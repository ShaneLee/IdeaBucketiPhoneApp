//
//  RequestController.swift
//  IdeaBucket
//
//  Created by Shane Lee on 26/10/2019.
//  Copyright © 2019 Shane Lee. All rights reserved.
//

import Foundation

func postIdea(idea: String, category: String)
{
    let url = URL(string: "http://shanelee.co.uk:1200/api/submit_idea")!
    var request = URLRequest(url: url)
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    let parameters: [String: Any] = [
        "idea": idea,
        "category": category
    ]
    request.httpBody = parameters.percentEscaped().data(using: .utf8)

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data,
            let response = response as? HTTPURLResponse,
            error == nil else {                                              // check for fundamental networking error
            print("error", error ?? "Unknown error")
            return
        }

        guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
            print("statusCode should be 2xx, but is \(response.statusCode)")
            print("response = \(response)")
            return
        }

        let responseString = String(data: data, encoding: .utf8)
        print("responseString = \(String(describing: responseString))")
    }

    task.resume()
}

func getIdeas() -> [Idea] {
    var ideas = [Idea]()
    let url = URL(string: "http://shanelee.co.uk:1200/api/ideas")!
    var request = URLRequest(url: url)
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data,
            let response = response as? HTTPURLResponse,
            error == nil else {
            print("error", error ?? "Unknown error")
            return
        }

        guard (200 ... 299) ~= response.statusCode else {
            print("statusCode should be 2xx, but is \(response.statusCode)")
            print("response = \(response)")
            return
        }
        ideas = parseJSON(data: data)
    }
    task.resume()
    sleep(2)
    print("hi")
    print(ideas)
    return ideas
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}


//private val _submitForm = MutableLiveData<SubmitFormState>()
//    val submitFormState: LiveData<SubmitFormState> = _submitForm
//
//    private val _submitResult = MutableLiveData<SubmitResult>()
//    val submitResult: LiveData<SubmitResult> = _submitResult
//
//    fun submit(idea: String, category: String) {
//        val json = JSONObject()
//        json.put("idea", idea)
//        json.put("category", category)
//        APIService( {
//            if (it == null) {
//                println("connection error")
//                return@APIService
//            }
//            println(it)
//        } ).execute("POST", "http://shanelee.co.uk:1200/api/submit_idea", json.toString())
//    }
//
//    fun submitDataChanged(idea: String, category: String) {
////        if (!isIdeaValid(idea)) {
////            _submitForm.value = SubmitFormState(ideaError = R.string.invalid_username)
////        } else if (!isCategoryValid(category)) {
////            _submitForm.value = SubmitFormState(categoryError = R.string.invalid_password)
////        } else {
//            _submitForm.value = SubmitFormState(isDataValid = true)
////        }
//    }
//
//    private fun isIdeaValid(idea: String): Boolean {
//        return idea.isNotBlank()
//    }
//
//    private fun isCategoryValid(password: String): Boolean {
//        return password.length >= 2
//    }
//}
