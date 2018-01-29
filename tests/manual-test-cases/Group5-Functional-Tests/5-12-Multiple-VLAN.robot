# Copyright 2016-2017 VMware, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License

*** Settings ***
Documentation  Test 5-12 - Multiple VLAN
Resource  ../../resources/Util.robot
Suite Setup  Wait Until Keyword Succeeds  10x  10m  Multiple VLAN Setup
Suite Teardown  Run Keyword And Ignore Error  Nimbus Cleanup  ${list}
Test Teardown  Cleanup VIC Appliance On Test Server

*** Keywords ***
Multiple VLAN Setup
<<<<<<< d71cdd19f35c70a8ea390a0c96d9a019316301f4
<<<<<<< b3681d371002a134b6ab67dce74e2dd17679bc1e
=======
>>>>>>> Add timeouts to nightly tests to prevent jenkins timeout (#7080)
    [Timeout]    110 minutes
    Run Keyword And Ignore Error  Nimbus Cleanup  ${list}  ${false}
    ${esx1}  ${esx2}  ${esx3}  ${vc}  ${esx1-ip}  ${esx2-ip}  ${esx3-ip}  ${vc-ip}=  Create a Simple VC Cluster  multi-vlan-1  cls
    Set Suite Variable  @{list}  ${esx1}  ${esx2}  ${esx3}  %{NIMBUS_USER}-${vc}
=======
    Run Keyword And Ignore Error  Nimbus Cleanup  ${list}  ${false}
    ${esx1}  ${esx2}  ${esx3}  ${vc}  ${esx1-ip}  ${esx2-ip}  ${esx3-ip}  ${vc-ip}=  Create a Simple VC Cluster  multi-vlan-1  cls
    Set Suite Variable  @{list}  ${esx1}  ${esx2}  ${esx3}  ${vc}
>>>>>>> Remove drone from nightly and allow for nimbus retries (#6530)

*** Test Cases ***
Test1
    ${out}=  Run  govc dvs.portgroup.change -vlan 1 bridge
    Should Contain  ${out}  OK
    ${out}=  Run  govc dvs.portgroup.change -vlan 1 management
    Should Contain  ${out}  OK

    Install VIC Appliance To Test Server
    Run Regression Tests

Test2
    ${out}=  Run  govc dvs.portgroup.change -vlan 1 bridge
    Should Contain  ${out}  OK
    ${out}=  Run  govc dvs.portgroup.change -vlan 2 management
    Should Contain  ${out}  OK

    Install VIC Appliance To Test Server
    Run Regression Tests
