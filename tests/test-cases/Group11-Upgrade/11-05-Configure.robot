# Copyright 2017 VMware, Inc. All Rights Reserved.
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
Documentation  Test 11-05 - Configure
Resource  ../../resources/Util.robot
<<<<<<< b3681d371002a134b6ab67dce74e2dd17679bc1e:tests/test-cases/Group11-Upgrade/11-05-Configure.robot
Suite Setup  Install VIC with version to Test Server  7315
Suite Teardown  Clean up VIC Appliance And Local Binary
=======
Suite Setup  Wait Until Keyword Succeeds  10x  10m  Resource Pool Install Setup
Suite Teardown  Run Keyword And Ignore Error  Nimbus Cleanup  ${list}
Test Teardown  Cleanup VIC Appliance On Test Server
>>>>>>> Remove drone from nightly and allow for nimbus retries (#6530):tests/manual-test-cases/Group5-Functional-Tests/5-23-Resource-Pool-Install.robot

*** Keywords ***
Resource Pool Install Setup
    Run Keyword And Ignore Error  Nimbus Cleanup  ${list}  ${false}
    ${esx1}  ${esx2}  ${esx3}  ${vc}  ${esx1-ip}  ${esx2-ip}  ${esx3-ip}  ${vc-ip}=  Create a Simple VC Cluster  datacenter  cls
    Set Suite Variable  @{list}  ${esx1}  ${esx2}  ${esx3}  ${vc}

*** Test Cases ***
<<<<<<< b3681d371002a134b6ab67dce74e2dd17679bc1e:tests/test-cases/Group11-Upgrade/11-05-Configure.robot
Configure VCH with new vic-machine
    ${ret}=  Run  bin/vic-machine-linux configure --target %{TEST_URL} --user %{TEST_USERNAME} --password=%{TEST_PASSWORD} --compute-resource=%{TEST_RESOURCE} --name %{VCH-NAME} --http-proxy http://proxy.vmware.com:3128
    Should Not Contain  ${ret}  Completed successfully
    Should Contain  ${ret}  configure failed
=======
Test
    Log To Console  \nStarting test...
    Install VIC Appliance To Test Server  additional-args=--use-rp
    Run Regression Tests
>>>>>>> Remove drone from nightly and allow for nimbus retries (#6530):tests/manual-test-cases/Group5-Functional-Tests/5-23-Resource-Pool-Install.robot
