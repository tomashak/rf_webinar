import xml.etree.ElementTree as ET
import os

class CodeBeamerListener:
    ROBOT_LISTENER_API_VERSION = 3
    CB_IDs_dict = {}  
    def end_test(self, data, result):                        
        for tag in result.tags:            
            if "CB" in tag:
                self.CB_IDs_dict[result.name] = tag.split(':')[1]                

    def xunit_file(self, path):        
        print(self.CB_IDs_dict)
        try:
            tree = ET.parse(path)
            root = tree.getroot()
            for testcase in root.findall('testcase'):
                print(testcase.get('name'))
                properties = ET.Element('properties')
                property = ET.Element('property', {'name': 'cbTestCaseId', 'value': self.CB_IDs_dict[testcase.get('name')]})
                properties.append(property)
                testcase.append(properties)

            tree.write(path, encoding="utf-8", xml_declaration=True)
        except Exception as e:
            print(f"Error during work with XML file : {str(e)}")