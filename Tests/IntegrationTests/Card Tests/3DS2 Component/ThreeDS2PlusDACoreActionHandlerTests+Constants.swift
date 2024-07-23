//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

@available(iOS 16.0, *)
extension ThreeDS2PlusDACoreActionHandlerTests {
    
    var sdkPublicKey: String {
        "{\"y\":\"zv0kz1SKfNvT3ql75L217de6ZszxfLA8LUKOIKe5Zf4\",\"x\":\"3b3mPfWhuOxwOWydLejS3DJEUPiMVFxtzGCV6906rfc\",\"kty\":\"EC\",\"crv\":\"P-256\"}"
    }
    
    var fingerprintToken: String {
        "eyJkaXJlY3RvcnlTZXJ2ZXJJZCI6IkYwMTMzNzEzMzciLCJkaXJlY3RvcnlTZXJ2ZXJQdWJsaWNLZXkiOiJleUpyZEhraU9pSlNVMEVpTENKbElqb2lRVkZCUWlJc0ltNGlPaUk0VkZCeFprRk9XazR4U1VFemNIRnVNa2RoVVZaaloxZzRMVXBXWjFZME0yZGlXVVJ0WW1kVFkwTjVTa1ZTTjNsUFdFSnFRbVF5YVRCRWNWRkJRV3BWVVZCWFZVeFpVMUZzUkZSS1ltOTFiVkIxYVhWb2VWTXhVSE4yTlRNNFVIQlJSbkV5U2tOYVNFUmthVjg1V1RoVlpHOWhibWxyVTA5NWMyTkhRV3RCVm1KSldIQTVjblZPU20xd1RUQndaMHM1Vkd4SlNXVkhZbEUzWkVKYVIwMU9RVkpMUVhSS2VUWTNkVmx2YlZwWFYwWkJiV3B3TTJkNFNEVnpOemRDUjJ4a2FFOVJVVmxRVEZkeWJEZHlTMHBMUWxVd05tMXRabGt0VUROcGF6azVNbXRQVVRORWFrMDJiSFIyV21OdkxUaEVUMlJDUjBSS1ltZFdSR0ZtYjI5TFVuVk5kMk5VVFhoRGRUUldZV3B5Tm1ReVprcHBWWGxxTlVZemNWQnJZbmc0V0RsNmExYzNVbWx4Vm5vMlNVMXFkRTU0TnpaaWNtZzNhVTlWZDJKaVdtb3hZV0Y2VkcxR1EyeEViMGR5WTJKeE9WODBObmNpZlE9PSIsImRpcmVjdG9yeVNlcnZlclJvb3RDZXJ0aWZpY2F0ZXMiOiJleUFpWVd4bklqb2dJa1ZUTlRFeUlpd2dJbmcxWXlJNklGc2dJazFKU1VNeGVrTkRRV3B0WjBGM1NVSkJaMGxEUlVGQmQwTm5XVWxMYjFwSmVtb3dSVUYzU1hkbldWVjRRM3BCU2tKblRsWkNRVmxVUVdzMVRVMVJjM2REVVZsRVZsRlJTVVJCU2s5VFJFVlRUVUpCUjBFeFZVVkNkM2RLVVZjeGVtUkhWbmxhUjBaMFRWSk5kMFZSV1VSV1VWRkxSRUZ3UWxwSWJHeGlhVUpQVEd4WmRVMVNjM2RIVVZsRVZsRlJURVJDU2tKYVNHeHNZbWxDVVdKSFJqQmFiVGw1WWxOQ1VWTXdhM2hKZWtGb1FtZE9Wa0pCVFUxSGEwWnJaVmRXZFVsR1FuTlpXRkp0WWpOS2RFbEZWa1JSZVVKVFlqSTVNRWxGVGtKTlFqUllSRlJKZVUxRVVYZE9ha0UwVFZSbmVFMVdiMWhFVkVrelRVUlJkMDVVUVRSTlZHZDRUVlp2ZDJSRVJVeE5RV3RIUVRGVlJVSm9UVU5VYTNkNFEzcEJTa0puVGxaQ1FXZE5RV3MxU1UxU1RYZEZVVmxFVmxGUlMwUkJjRUphU0d4c1ltbENUMHhzV1hWTlVuTjNSMUZaUkZaUlVVeEVRa3BDV2toc2JHSnBRbEZpUjBZd1dtMDVlV0pUUWxGVE1HdDRTbXBCYTBKblRsWkNRVTFOU0ZWNFNsWnJWWFZOTUZKVVRXbENSbEV3VFdkVFZ6VXdXbGhLZEZwWFVuQlpXRkpzU1VWT1FrMUpSMkpOUWtGSFFubHhSMU5OTkRsQlowVkhRbE4xUWtKQlFXcEJORWRIUVVGUlFXNUZZbEUwVUdWTlVtUXZTVk5XUzBsU1dEUjJjSFUwTW5oU01HOXJOa1ZNY1RjMWNVRndNRWd3TW1GVU5YbGxhRzAwTVZGVVpWZGtSVEpaTm5CQmFGQlpWa1ZYYzBoT1UwbHRRVTh5TDIweVNHaEdLM1ExTkVKcFkzaGFOUzlXZGswMGRuUXZZblZqZHpWQllYZHpRMmxFV2xnd1VtMHlNbnBQVEVveVJUVlhLMjVRVTFrNGIzZHNNemxFYW13NFoyd3laMEZITUUxRWVrdHhNWFpQU0N0c05tNW9kMDVyZEV4alEzbHVjMlZxV21wQ2EwMUNNRWRCTVZWa1JHZFJWMEpDVTJKSmFuaFJUVGxPTWtkWU1XZEpWV0l2ZEU4clRIbFZVeXRVYWtGbVFtZE9Wa2hUVFVWSFJFRlhaMEpSZEVwRFdFUndjVmRHZEZSUFFrTlJhbG81ZURRMlJFSlBTM0JVUVZOQ1owNVdTRkpOUWtGbU9FVkRSRUZIUVZGSUwwRm5SVUZOUVRSSFFURlZaRVIzUlVJdmQxRkZRWGRKUW1ocVFVdENaMmR4YUd0cVQxQlJVVVJCWjA5Q2FYZEJkMmRaWTBOUlowUk9VMnRMU1dOYVlWQjVRa3MwVWk5cFoyTXdPVTVSWWl0Sk9UTnllblEyVTIxS2RqSnVPQ3MyU0RGdmVXVkJaVVJLZURSMVFXVTNVMnRPV0RGbVpFVkdjSFpMVmpock1EQXdUakJYVjBGS1ZuTXJVRVpUYTNkS1FscHVZbWhKU1hoM1lUbGthamt3V0ZGb056QjVNVEpaV25FeGNITlNURWcySzJ4S2VEQnlRWGhOU0VKTk1HdHFWazFoUTJKRlJYY3lZMlJoYVdJMFVtRlJibnAwVERScU1qWlJZMU15TldscmNXODVla2xQYnowaUlGMGdmUW8uZXlBaVkyVnlkR2xtYVdOaGRHVnpJam9nV3lBaVRVbEpSRGhxUTBOQmRHOURRMUZFVG01WWVXTldSVWwzZFhwQlRrSm5hM0ZvYTJsSE9YY3dRa0ZSYzBaQlJFTkNkV3BGVEUxQmEwZEJNVlZGUW1oTlExUnJkM2hHYWtGVlFtZE9Wa0pCWjAxRVZUVjJZak5LYTB4VmFIWmlSM2hvWW0xUmVFVnFRVkZDWjA1V1FrRmpUVU5WUm5Sak0xSnNZMjFTYUdKVVJWUk5Ra1ZIUVRGVlJVTm5kMHRSVjFJMVdsYzBaMVJwTlZkTWFrVlNUVUU0UjBFeFZVVkRkM2RKVVRKb2JGa3lkSFprV0ZGNFRsUkJla0puVGxaQ1FVMU5URVJPUlZWNlNXZFZNbXgwWkZkNGFHUkhPWGxKUmxwS1ZUQkZaMUpHVFdkUk1sWjVaRWRzYldGWFRtaGtSMVZuVVZoV01HRkhPWGxoV0ZJMVRWTkJkMGhuV1VwTGIxcEphSFpqVGtGUmEwSkdhRVo2WkZoQ2QySXpTakJSUjBaclpWZFdkVXh0VG5aaVZFRmxSbmN3ZUU5RVFUUk5hbU40VFhwUmQwNVVhR0ZHZHpCNVQwUkJORTFxVVhoTmVsRjNUbFJvWVUxSlJ6Wk5VWE4zUTFGWlJGWlJVVWRGZDBwUFZFUkZWMDFDVVVkQk1WVkZRMEYzVGxSdE9YWmpiVkYwVTBjNWMySkhSblZhUkVWVFRVSkJSMEV4VlVWQ2QzZEtVVmN4ZW1SSFZubGFSMFowVFZKTmQwVlJXVVJXVVZGTFJFRndRbHBJYkd4aWFVSlBUR3haZFUxU1JYZEVkMWxFVmxGUlRFUkJhRVJoUjFacVlUSTVNV1JFUlRGTlJFMUhRVEZWUlVGM2QzTk5NRkpVVFdsQ1ZHRlhNVEZpUjBZd1lqTkpaMVpyYkZSUlUwSkZWWGxDUkZwWVNqQmhWMXB3V1RKR01GcFRRa0prV0ZKdllqTktjR1JJYTNoSlJFRmxRbWRyY1docmFVYzVkekJDUTFGRlYwVllUakZqU0VKMlkyNVNRVmxYVWpWYVZ6UjFXVEk1ZEUxSlNVSkpha0ZPUW1kcmNXaHJhVWM1ZHpCQ1FWRkZSa0ZCVDBOQlVUaEJUVWxKUWtOblMwTkJVVVZCZFhBM0syWjBkMWRuUjJSallUWXhjVlpDWXpGQ2RsUnBOVmswTTBKM2FGb3pVMmhLU1d0dFIwbDNaMWxRYzBvNWNISlBZMXBWVm1WSGEwVm9ZelZIV0hjdk9WSk1ZMnhaYldscE1sb3ZURkJGZVhrMlZVbGpVSE5GUm1sa1VucFhURFprT0RSaVpHSTRWRFZwTmtsQlRITklVMmRQWm1OUVR6SkVRMWx2VGpWR0swZ3ZkbFZoY0hkWlIycENORmtyYVhkTlpsRXlaWE5NTTFGRVpFVXJMMjg1TDFvMFRuQm1iemtyWTJZeFJIcGxjRk5YVm5oVWVGSlNhMU5ZTVVjclVYWnJRazB2Y0d4ME5XMDFlQ3RNVlZrd2VqWlZOQ3QxVVhGQ1VWbHphVEJWVURWTmJXSTRSVFpWZDBjeWEyTTROblJ6WlhjMFdVeHhVMk5ZZEZVNVp5OXZPVGxuT1VWcmJrVlRXbTlDT0ZGdGFtZEpNSE5hVVhKRk0wdHZORUV5TDFsRFpUSTFTbWRhTnpGTFl6ZEZMemxJUzFGTE0xWXhkR2xNY25wNGFWTkxNSEU0WWtWT00ycGhZalJ6VVVwWFkzcFNOVTVSU1VSQlVVRkNUVUV3UjBOVGNVZFRTV0l6UkZGRlFrTjNWVUZCTkVsQ1FWRkJiVGh4VDBSQlRrSXpVSEFyT1RoUlpuVlJWVVZVV0dVeFRsSndTblpFYjJONWMyUnZTaXR6ZERoSFdtUmlWMmx1YTA5d04yWnNXVFJZY0VaeU1scEpjVTVJVFhsS2MyWTNPVWxCUzJ4Q1pXOVRXRGQ0VkdacVozSXlPSGRuYTFONWREVlFWMkkzV2tZeldGUXdibWRYYzNoeU1tUjBSamRTZFVGNFVUaEtZbFJ3VUV4a1JWa3hXakp5YUVvMVlYUktkRGRGU2xsRk5rRllTbnBCY2pWVlNqZDViVEJqV1NzNVRrMHpWa0pxVTNCak9XVk1UMDR6Vkd0WldHOVZkakprYlV0MU1VaDZUSFppTVcxRU1HVkllWFZGY2xGUGNtSlVLekZ2UmsxbEwwdG9lbll4TjB4cldEaHFOMDk0VTB0dFVpOUlMMVF5ZVhGbmJYcFBlR2ROTUd4TGVtc3pWMmxSVDI0eGExUlhZVzlZT0VOb1VEWnBVMjFLYTNKM1NWVjVXaXRXTVZWSlVFTlViblJzVVhwRlVVcElPVFpSTlc1WlRsUk1UamhxVm14d05XMXVTMGQwVWtGWWNteDFjbmhNYVRsWk5rVWlMQ0FpVFVsSlIwSlVRME5CS3pKblFYZEpRa0ZuU1VwQlMwOW5hRGh6ZFVWeFpVOU5RVEJIUTFOeFIxTkpZak5FVVVWQ1EzZFZRVTFKUjFsTlVYTjNRMUZaUkZaUlVVZEZkMHBQVkVSRlYwMUNVVWRCTVZWRlEwRjNUbFJ0T1haamJWRjBVMGM1YzJKSFJuVmFSRVZUVFVKQlIwRXhWVVZDZDNkS1VWY3hlbVJIVm5sYVIwWjBUVkpGZDBSM1dVUldVVkZMUkVGb1FscEliR3hpYVVKUFZtcEZaMDFDTkVkQk1WVkZRM2QzV0Uwd1VXZFZNbFpxWkZoS2JFbEVTWFZOUTBKVVlWY3hNV0pIUmpCaU0wbDRTMFJCYlVKblRsWkNRVTFOU0hwT1JVbEdUbXhaTTFaNVdsTkJlVXhxUVdkVk1teDBaRmQ0YUdSSE9YbEpSa3AyWWpOUloxRXdSWGRJYUdOT1RWUnJkMDVxUVRKTlJHdDNUbnBKZWxkb1kwNU5hbXQzVG1wQmVrMUVhM2RPZWtsNlYycERRbTFFUlV4TlFXdEhRVEZWUlVKb1RVTlVhM2Q0Um1wQlZVSm5UbFpDUVdkTlJGVTFkbUl6U210TVZXaDJZa2Q0YUdKdFVYaEZha0ZSUW1kT1ZrSkJZMDFEVlVaMFl6TlNiR050VW1oaVZFVlNUVUU0UjBFeFZVVkRaM2RKVVZkU05WcFhOR2RVYkZsNFNVUkJaVUpuVGxaQ1FYTk5SbnBPUlVsR1RteFpNMVo1V2xOQmVVeHFRV2RWTW14MFpGZDRhR1JIT1hsTlUyZDNTbWRaUkZaUlVVUkVRamg2VWtOQ1ZGcFhUakZqYlZWblRXazBkMGxHVG5CaVdGWnpXVmhTZG1OcFFsTmlNamt3U1VWT1FrMUpTVU5KYWtGT1FtZHJjV2hyYVVjNWR6QkNRVkZGUmtGQlQwTkJaemhCVFVsSlEwTm5TME5CWjBWQmJURnRhRk5FUmxoWlN6QjRSV3AyTHpSQldVdEpTRmR5ZUZJcmJHaFVaVnBpZUc5bWMwcENia2hpUTNsbGJXVXhkek5ZVUhaVlRHcFVlbXQ1ZFRkMVZsbEZXbE15WkVwWVlreHdiMUZ6ZFVwcmNsbEROVTlMV0VZM01rRlhObkp6UnpKeFNrUTFVVmhCZFRkVGFESnZlWFo1U1UxM05taEJha055WjJWVlNXMHdTMlJ1T1VkUVZWTjNWbXhJVjFsd2NtUk1NblZhZUVGRE5sSkJWM0ZGWjNoeGFDdHphVzgxU1VSeEszUkNMMm81WVVSMllWQnNXazVhVlRoaFUxWm5iazlNVGtZNVExbGpZWEF4V0VoaVRVTnNkRWd3VlhjeVRHZFllRzlQZDB0VVpVZFJlREpaVlc1RU5tbzFNVmd3Ym1nME9VcGlXbVV6WTJGUWNraHpTRVF5YUhKM1JXWlBTa1V4YVVwMGNYRnVVVnBxWjBsUVQyY3lhbU53TDFsWVVHdERjRFpMVUZsTVpVWm5PRU5DVlVNelNFbG5ZM1l6TVdKall6STJWa3BDT0daM1NqWmhiSGRvYkVKTlNua3pTek5uVFVvd2FuaFZkMlZRV0dWbVFtNWphVzg1TjBOTk1uaHZSRk5LVkdaWU5YRkpiMlUwYlZKR1QyZ3dRVFJUVm5CSlVGUjFTV0V6TUdWc1dXSXpaMVF4ZVdRdmJXWkhNR05ZT0VwaVlsbHlTbTl0WVRCM01HUnpVbmx5WlRJelJuZzRaV3BKWkhRMVV6Sm9WV0pDYm1zelVUSnhUbVZNTnpRcldXVTJlSGxqT1dkcVYydHhPV3BzTnpkNVJtZGphamhOYldsU1FVTkllVkF6ZEZGVWFrNVpPVzVCZGs1YU0yUnBOME5GVlc1bVpIRTBObXBVYkVWcU1VNHdRelUxVEhZNWIySldORUZGYmk5V1JubEtaa3cxZG1wcU4yRklURVF5YjJoclRHRkdRMGQ2UzJaT1EzTkNjRkZDVWtjMFVtNXFhbXhuV0ZOWGRGaGxhV0pRTjBkTVJraEVZamx3VFRsa2VqSktNaXRGVW10Qk5qTnRVWFpDVjA4MlUzQm5LMU5uWm5WTVltRk5iamg2YWxGT1NGQTRVREowV25aM1ZVOVlLM0kwZDJGTldVeFlXRGRqUTBoa1YxbE1XalEwV2tSdlFUQXJRVUZxUTBWRFFYZEZRVUZoVGxGTlJUUjNTRkZaUkZaU01FOUNRbGxGUmtobGNYaENaVFZTVFVoRk4yaDVWVkpIWW5sS2VIVkxjbXd5ZVUxQ09FZEJNVlZrU1hkUldVMUNZVUZHU0dWeGVFSmxOVkpOU0VVM2FIbFZVa2RpZVVwNGRVdHliREo1VFVGM1IwRXhWV1JGZDFGR1RVRk5Ra0ZtT0hkRVVWbEtTMjlhU1doMlkwNUJVVVZNUWxGQlJHZG5TVUpCUmpsbWR6SjNWWEJ5VjJGMksxbEhUR3hCVUVsTFkwZ3ZSRkJETUcwd2VHNXNWR05sTjJwcFZFUkRiWElyYVU0NE0ya3JSelk0Tldwd2EyWlpVbWhOVkUxdGNDc3hNak5oWmlzclZucFhRbXgwWW1OTFpVa3lhMUZWV1doWVkxbHJWR2MyWlVSclprSjFVVTVXVkVwTlZtbFNZM2cyVjJjNGFrRlFiMDQ0U2xablVtcG1lVGhPY1hNNFlWUXZTU3RLTldKSk5sWTVhRVUwYWtsSFUzQTBRa2RrY0VadFluTjRiRTFRYW5GdE5EWm1ObEJETlVwUmVXWTFUV2h1UmpBcmRuWnNiR0ZwYWxoNWRsVktLekk1WTFsUVQzRlRlbGRPUVhaamREUnVWM1ZhYkdSRWEwdzBkemRsTkZOR1VGVmlSamt5V0RoWVkxaDNOMnAwTDFoa1J6VllTSGxwWjNobk5YRnJTRloyUTJSdlVFeDZPRWhZY0c1R1JHTnFibGhtZG1seVQwMVJhRzlPYlRaWVJXWnZNM1Z5VDBscVREUk1jMkp2UnpBNGMweEpZbGgxV0dGNFJsVk5jV050TjNKM1EwRlFUVVJEY0VOTGJtTkdVSEE0Y0cxVmJrdHhhVGxFZUdaT1JYaDRVbmxhVkRSbldXOXFXR2NyY1V4Q2NqbGpRVk4wYjNscFZrSkRka1kzYTNKbmF6TlBTMUJSWW1wR1Eya3JNRUpUYzNGUVkzYzBlVFpoTVdwUWVuQXlaMHRzV2xoQ2JsUnRZbXh0VlhOdlNYbGlPSEYwZUZCWE1rbFJOVzFsVEdaS1drUmxTMFJaY3l0U1pXZHZTV296YkdKdmEwaGtSM2cxTWlzdk1FZEJSa3BpVkhsaGIzSjFNVTFzU21wdllVaG5WR3haUW01aVJUUXJZblU1TURJMVRFVkhjMlZ5TWpoakx6Qm5WMjlhUzJVeVVuQmlSbG9yWmsxQmVrMTZaamxUVGpkeVEwdzVUemR4YmpCTWVrMWxOSEJOUVVwSU1VWkVRVEU1UVhkUFlWbE1jWGRrYURnNWVFRjBUWGhtVTJnMFdVaFhRMGg2VDFVM1YybHVZazlFV0c5MFMwZHFWVlJGUml0MVdXSTBWREZwZEhOeUx6azVjRUpvWVhNeFFqaFlNVnBXUjNwbmVqVklOU3RQZWtWclUyTlhWVUpOU1RKRmF6aHpRWEVpSUYwZ2ZRby5NSUdHQWtGajh0ZjJqQUdaQ182bGhWdkFuMWNTRUlEdmNSOGZpcWNUblNTT1NYU0Ywb0p2b0JIaDVZTXVMMHhLeW9xRXRkME05dVNZOWNnbkJnalNDakRSWEhvNXBRSkJEZ2ZSWkExWXpBempsbW5qMDBCSzRXNkJXcld3MDF0NWJvZWpOdVYwVzFDTVZ3VVdBdi1kZklvNkNHUkJtUnhYVlRmLVVuaVJvbjJXVHp1MjM4N21aT0EiLCJ0aHJlZURTTWVzc2FnZVZlcnNpb24iOiIyLjIuMCIsInRocmVlRFNTZXJ2ZXJUcmFuc0lEIjoiNjU1YzA2ZGUtYWQzZS00OWQxLTk2NTAtNTliYjZiYWU0MjJkIn0="
    }
    
    var challengeToken: String { "eyJkZWxlZ2F0ZWRBdXRoZW50aWNhdGlvblNES0lucHV0IjogImV5SmphR0ZzYkdWdVoyVWlPaUpqYUdGc2JHVnVaMlVpZlEiLCAiYWNzUmVmZXJlbmNlTnVtYmVyIjoiQURZRU4tQUNTLVNJTVVMQVRPUiIsImFjc1NpZ25lZENvbnRlbnQiOiJleUpoYkdjaU9pSlFVekkxTmlJc0luZzFZeUk2V3lKTlNVbEVNMFJEUTBGelVVTkRVVVJVU205VFZHeFlXQzlQVkVGT1FtZHJjV2hyYVVjNWR6QkNRVkZ6UmtGRVEwSjFha1ZNVFVGclIwRXhWVVZDYUUxRFZHdDNlRVpxUVZWQ1owNVdRa0ZuVFVSVk5YWmlNMHByVEZWb2RtSkhlR2hpYlZGNFJXcEJVVUpuVGxaQ1FXTk5RMVZHZEdNelVteGpiVkpvWWxSRlZFMUNSVWRCTVZWRlEyZDNTMUZYVWpWYVZ6Um5WR2sxVjB4cVJWSk5RVGhIUVRGVlJVTjNkMGxSTW1oc1dUSjBkbVJZVVhoT1ZFRjZRbWRPVmtKQlRVMU1SRTVGVlhwSloxVXliSFJrVjNob1pFYzVlVWxHV2twVk1FVm5Va1pOWjFFeVZubGtSMnh0WVZkT2FHUkhWV2RSV0ZZd1lVYzVlV0ZZVWpWTlUwRjNTR2RaU2t0dldrbG9kbU5PUVZGclFrWm9SbnBrV0VKM1lqTktNRkZIUm10bFYxWjFURzFPZG1KVVFXVkdkekI0VDBSQk5FMXFZM2hOZWxGNlRWUlNZVVozTUhsUFJFRTBUV3BSZUUxNlVYcE5WRkpoVFVsSGEwMVJjM2REVVZsRVZsRlJSMFYzU2s5VVJFVlhUVUpSUjBFeFZVVkRRWGRPVkcwNWRtTnRVWFJUUnpsellrZEdkVnBFUlZOTlFrRkhRVEZWUlVKM2QwcFJWekY2WkVkV2VWcEhSblJOVWsxM1JWRlpSRlpSVVV0RVFYQkNXa2hzYkdKcFFrOU1iRmwxVFZKRmQwUjNXVVJXVVZGTVJFRm9SR0ZIVm1waE1qa3haRVJGWmsxQ01FZEJNVlZGUVhkM1YwMHdVbFJOYVVKVVlWY3hNV0pIUmpCaU0wbG5WbXRzVkZGVFFrVlZla1ZuVFVJMFIwTlRjVWRUU1dJelJGRkZTa0ZTV1ZKak0xWjNZMGM1ZVdSRlFtaGFTR3hzWW1rMWFtSXlNSGRuWjBWcFRVRXdSME5UY1VkVFNXSXpSRkZGUWtGUlZVRkJORWxDUkhkQmQyZG5SVXRCYjBsQ1FWRkRZeTlYZDA0MlpuWXhZVWwxYTNwTmFGZGhVbVJhWjBRNVVHdDFOV0Y1VFdWaGJXeE9SelIwVld3eVV6WTNURXRFT1VKU2VXTm9RWFp2TlVFclJXdG1Na2hMVWpKWVZHVnhUMlpIWm05TVJFbHhNa3hYUnpsSGEwdHlSeTlMUW5RdlFWQkVNWGhDYUdkdFNHNXJORmxxY0VGV2JsQTBabUZLVEhSU2NXRlFSVVZPVHpnd2JXTjZXV3hoZHpoWmFuUlJObmxJV0ZCTk5FOVBMMlo2TjJZMU9GRmxjRWhoZFUxYWNIcDZlazByUkc5dFZEQk1NVWhDYkZoVWVGcG5kVlpETUM5MVpVUk5ZMU5SVFdZNFQzSldZa3hVZHpOa1FubEVPRmQ1TlhkNFFXZFJkbFl2UkdaRWVWRllXamRMUTFabVpqbDFaVkZZYmtSdVQzbEdNRTVoTDBKSlZXMXFlbWgyU205R1kxZzJVeTg0V1V3MmRtSnBNMjVrWVhsTFdXdHVkRFZ2Y1RKb1ZrZG1hRm9yYURVM2VWbzNabmxXWmtJd2MyRlFhRkZyTTBjMlNqQlBLMHBzTWxWWE9GRjJRVFl3VmpoNk5HWkJaMDFDUVVGRmQwUlJXVXBMYjFwSmFIWmpUa0ZSUlV4Q1VVRkVaMmRGUWtGSFVVeGpVRzlRTkRoQllVTnlVV0p4ZWl0MlJsQTBNbWx5YjJKR1VHWnhjRlZyWkZZMlFVeE5lRXBDWTJOMlNEbENibHBuVmxKNkwzRk9UbE0yUlVnMmJIWnZabGt3YkVoVGRVdGthMEo0TDFCV09FcE9jR1JvYldNdllVTkZTM2RtY1dsMFZuWndNemxFUnpsTlVrcFZNWG8zYlhRdlVsSklTbWxWUkRGR01WRlJlR0pUT0dSTWJXOTBTR1pOU1dsVmR5OXpVWEpXWm1WRU5sQk1VRGxxUTNrdlZXbDFkMlZIWTNOaWFGRXpiekJJUVdjeGRrbDJUVUpXU0RKaWNDdG1iREJpUVhFNVRHczBXWGhCTUVSdlMyTklZbGhtUTBWS2J6ZFBMM1JMV1d4YVoxcHJOVk5rUzFGbGNFTmhWRkV6Tmk5V2IxUnliSHBKTUU5d1ZVY3hkSEpGT1dWVk1TdEpOa3hxTVU5bFpYbGtaalU1Wm5aWVFXUm9MMmhrWkdoTFZEUm5TbkoyZGtaaU1IYzBlbHBwV0hWNlZscFFTMUF3ZG5sclFXNDVLMGsyUVZJeVVrczRZVUUwTkc5S1FVd3pkMGd4U1VFOUlpd2lUVWxKUkRocVEwTkJkRzlEUTFGRVRtNVllV05XUlVsM2RYcEJUa0puYTNGb2EybEhPWGN3UWtGUmMwWkJSRU5DZFdwRlRFMUJhMGRCTVZWRlFtaE5RMVJyZDNoR2FrRlZRbWRPVmtKQlowMUVWVFYyWWpOS2EweFZhSFppUjNob1ltMVJlRVZxUVZGQ1owNVdRa0ZqVFVOVlJuUmpNMUpzWTIxU2FHSlVSVlJOUWtWSFFURlZSVU5uZDB0UlYxSTFXbGMwWjFScE5WZE1ha1ZTVFVFNFIwRXhWVVZEZDNkSlVUSm9iRmt5ZEhaa1dGRjRUbFJCZWtKblRsWkNRVTFOVEVST1JWVjZTV2RWTW14MFpGZDRhR1JIT1hsSlJscEtWVEJGWjFKR1RXZFJNbFo1WkVkc2JXRlhUbWhrUjFWblVWaFdNR0ZIT1hsaFdGSTFUVk5CZDBobldVcExiMXBKYUhaalRrRlJhMEpHYUVaNlpGaENkMkl6U2pCUlIwWnJaVmRXZFV4dFRuWmlWRUZsUm5jd2VFOUVRVFJOYW1ONFRYcFJkMDVVYUdGR2R6QjVUMFJCTkUxcVVYaE5lbEYzVGxSb1lVMUpSelpOVVhOM1ExRlpSRlpSVVVkRmQwcFBWRVJGVjAxQ1VVZEJNVlZGUTBGM1RsUnRPWFpqYlZGMFUwYzVjMkpIUm5WYVJFVlRUVUpCUjBFeFZVVkNkM2RLVVZjeGVtUkhWbmxhUjBaMFRWSk5kMFZSV1VSV1VWRkxSRUZ3UWxwSWJHeGlhVUpQVEd4WmRVMVNSWGRFZDFsRVZsRlJURVJCYUVSaFIxWnFZVEk1TVdSRVJURk5SRTFIUVRGVlJVRjNkM05OTUZKVVRXbENWR0ZYTVRGaVIwWXdZak5KWjFacmJGUlJVMEpGVlhsQ1JGcFlTakJoVjFwd1dUSkdNRnBUUWtKa1dGSnZZak5LY0dSSWEzaEpSRUZsUW1kcmNXaHJhVWM1ZHpCQ1ExRkZWMFZZVGpGalNFSjJZMjVTUVZsWFVqVmFWelIxV1RJNWRFMUpTVUpKYWtGT1FtZHJjV2hyYVVjNWR6QkNRVkZGUmtGQlQwTkJVVGhCVFVsSlFrTm5TME5CVVVWQmRYQTNLMlowZDFkblIyUmpZVFl4Y1ZaQ1l6RkNkbFJwTlZrME0wSjNhRm96VTJoS1NXdHRSMGwzWjFsUWMwbzVjSEpQWTFwVlZtVkhhMFZvWXpWSFdIY3ZPVkpNWTJ4WmJXbHBNbG92VEZCRmVYazJWVWxqVUhORlJtbGtVbnBYVERaa09EUmlaR0k0VkRWcE5rbEJUSE5JVTJkUFptTlFUekpFUTFsdlRqVkdLMGd2ZGxWaGNIZFpSMnBDTkZrcmFYZE5abEV5WlhOTU0xRkVaRVVyTDI4NUwxbzBUbkJtYnprclkyWXhSSHBsY0ZOWFZuaFVlRkpTYTFOWU1VY3JVWFpyUWswdmNHeDBOVzAxZUN0TVZWa3dlalpWTkN0MVVYRkNVVmx6YVRCVlVEVk5iV0k0UlRaVmQwY3lhMk00Tm5SelpYYzBXVXh4VTJOWWRGVTVaeTl2T1Rsbk9VVnJia1ZUV205Q09GRnRhbWRKTUhOYVVYSkZNMHR2TkVFeUwxbERaVEkxU21kYU56RkxZemRGTHpsSVMxRkxNMVl4ZEdsTWNucDRhVk5MTUhFNFlrVk9NMnBoWWpSelVVcFhZM3BTTlU1UlNVUkJVVUZDVFVFd1IwTlRjVWRUU1dJelJGRkZRa04zVlVGQk5FbENRVkZCYlRoeFQwUkJUa0l6VUhBck9UaFJablZSVlVWVVdHVXhUbEp3U25aRWIyTjVjMlJ2U2l0emREaEhXbVJpVjJsdWEwOXdOMlpzV1RSWWNFWnlNbHBKY1U1SVRYbEtjMlkzT1VsQlMyeENaVzlUV0RkNFZHWnFaM0l5T0hkbmExTjVkRFZRVjJJM1drWXpXRlF3Ym1kWGMzaHlNbVIwUmpkU2RVRjRVVGhLWWxSd1VFeGtSVmt4V2pKeWFFbzFZWFJLZERkRlNsbEZOa0ZZU25wQmNqVlZTamQ1YlRCaldTczVUazB6VmtKcVUzQmpPV1ZNVDA0elZHdFpXRzlWZGpKa2JVdDFNVWg2VEhaaU1XMUVNR1ZJZVhWRmNsRlBjbUpVS3pGdlJrMWxMMHRvZW5ZeE4weHJXRGhxTjA5NFUwdHRVaTlJTDFReWVYRm5iWHBQZUdkTk1HeExlbXN6VjJsUlQyNHhhMVJYWVc5WU9FTm9VRFpwVTIxS2EzSjNTVlY1V2l0V01WVkpVRU5VYm5Sc1VYcEZVVXBJT1RaUk5XNVpUbFJNVGpocVZteHdOVzF1UzBkMFVrRlljbXgxY25oTWFUbFpOa1VpWFgwLmV5SmhZM05GY0dobGJWQjFZa3RsZVNJNmV5SmpjbllpT2lKUUxUSTFOaUlzSW10MGVTSTZJa1ZESWl3aWVDSTZJbWRKTUVkQlNVeENaSFUzVkRVellXdHlSbTFOZVVkamMwWXpialZrVHpkTmJYZE9Ra2hMVnpWVFZqQWlMQ0o1SWpvaVUweFhYM2hUWm1aNmJGQlhja2hGVmtrek1FUklUVjgwWldkV2QzUXpUbEZ4WlZWRU4yNU5SbkJ3Y3lKOUxDSnpaR3RGY0dobGJWQjFZa3RsZVNJNmV5SmpjbllpT2lKUUxUSTFOaUlzSW10MGVTSTZJa1ZESWl3aWVDSTZJa1ozUldGc1prOTZRV1l0YmpaRU5GRjJSRnBHZG1oU2FEVm5ORkJIWm00NVYzcEVWelZSTkZNeU1VVWlMQ0o1SWpvaVJrYzBiMDFXTjJ0dWNUSllSVEZHVFRsUE0zb3hTVXBPTWxNeE9FSk9RVTB0ZGt0SFRXeDNjbU5UV1NKOUxDSmhZM05WVWt3aU9pSm9kSFJ3Y3pwY0wxd3ZjR0ZzTFhSbGMzUXVZV1I1Wlc0dVkyOXRYQzkwYUhKbFpXUnpNbk5wYlhWc1lYUnZjbHd2YzJWeWRtbGpaWE5jTDFSb2NtVmxSRk15VTJsdGRXeGhkRzl5WEM5Mk1Wd3ZhR0Z1Wkd4bFhDOHlOR1ZsTnpJME1pMHhaRGcxTFRRNFpHTXRPREV6WWkwM01EaGhOVFl3Wm1WaVpUVWlmUS5UM0pSUUg4UlkwNzYta1BCRGl1LU9lRlJLcEtyX0tfX3RCdUxscnZSeWlsc3JxMHA2dzVMcGM2STVXMHE1V1Awbk5hUmE2VFdYMWZVc1g2Rldhbk5LYzJXczRWYk0zejg5M3BjRFNSZVZYWVp3eWs5WnZzaWhRNzAzQjJoTzNQbXZPM09QT0VTWi1xRGFJckRLRkVHUEdSQnVwQlhUVmVRaFNkdUlPOWpUekxEZW5NZGdEMlFDNU9BR3VTTEVKN0o4VnFiM0htV0k4bGZJLWNQQ3YxSkpEY3YxMWJ2ZEZOVC1WNzVIT0xGNjN2WGY3UkxhZTVLbFQwalJtMW93NDFTMG9Td3lrN1BjeTBvN3A0S0o2LWxGaGRvc2ZEVGJQWXp5VkprSHdfR0J2YzhNNWU2QV8zcUdtbWJtYjlvaUJkWC1taEtJc0RrVkI4bW5CbkdKdzRRY0EiLCJhY3NUcmFuc0lEIjoiMjRlZTcyNDItMWQ4NS00OGRjLTgxM2ItNzA4YTU2MGZlYmU1IiwiYWNzVVJMIjoiaHR0cHM6XC9cL3BhbC10ZXN0LmFkeWVuLmNvbVwvdGhyZWVkczJzaW11bGF0b3JcL3NlcnZpY2VzXC9UaHJlZURTMlNpbXVsYXRvclwvdjFcL2hhbmRsZVwvMjRlZTcyNDItMWQ4NS00OGRjLTgxM2ItNzA4YTU2MGZlYmU1IiwibWVzc2FnZVZlcnNpb24iOiIyLjEuMCIsInRocmVlRFNTZXJ2ZXJUcmFuc0lEIjoiN2IyNjBkNzMtNzE2NC00MWNkLWE3MGMtOGFhOGQxYTFjOWEyIn0="
    }
    
    var expectedSDKRegistrationOutput: String {
        "eyJycElkIjoiQjJOWVNTNTkzMi5jb20uYWR5ZW4uQ2hlY2tvdXREZW1vVUlLaXQiLCJkZXZpY2UiOiJpT1MiLCJhdHRlc3RhdGlvbk9iamVjdCI6Im8yTm1iWFJ2WVhCd2JHVXRZWEJ3WVhSMFpYTjBaMkYwZEZOMGJYU2lZM2cxWTRKWkF1OHdnZ0xyTUlJQ2NxQURBZ0VDQWdZQmd0cWtwZTR3Q2dZSUtvWkl6ajBFQXdJd1R6RWpNQ0VHQTFVRUF3d2FRWEJ3YkdVZ1FYQndJRUYwZEdWemRHRjBhVzl1SUVOQklERXhFekFSQmdOVkJBb01Da0Z3Y0d4bElFbHVZeTR4RXpBUkJnTlZCQWdNQ2tOaGJHbG1iM0p1YVdFd0hoY05Nakl3T0RJMU1UUTFNekU1V2hjTk1qSXdPREk0TVRRMU16RTVXakNCa1RGSk1FY0dBMVVFQXd4QVpHSmhOMll5WkdReU9UQTVNRGMwTnprd04yVTVOREk1T0RKak56UXlZamN5WW1FMFltTmlaREF6TlRJd01EQTFNelpsWm1NME9EVm1OREkwTmpabU1ERWFNQmdHQTFVRUN3d1JRVUZCSUVObGNuUnBabWxqWVhScGIyNHhFekFSQmdOVkJBb01Da0Z3Y0d4bElFbHVZeTR4RXpBUkJnTlZCQWdNQ2tOaGJHbG1iM0p1YVdFd1dUQVRCZ2NxaGtqT1BRSUJCZ2dxaGtqT1BRTUJCd05DQUFUMDdkN1lidGFRM0lVUmtzZjZjNWU5XC9mZGs1TW05TW9BYlwvRzFsVTlTTkhqNGVTXC9OOWVYU3c3b2N2XC95NTdMa3dRWnV0MXZYc3N3dlRMcDg2YlgxSDdvNEgyTUlIek1Bd0dBMVVkRXdFQlwvd1FDTUFBd0RnWURWUjBQQVFIXC9CQVFEQWdUd01JR0FCZ2txaGtpRzkyTmtDQVVFY3pCeHBBTUNBUXFcL2lUQURBZ0VCdjRreEF3SUJBTCtKTWdNQ0FRR1wvaVRNREFnRUJ2NGswS0FRbVFqSk9XVk5UTlRrek1pNWpiMjB1WVdSNVpXNHVRMmhsWTJ0dmRYUkVaVzF2VlVsTGFYU2xCZ1FFYzJ0eklMK0pOZ01DQVFXXC9pVGNEQWdFQXY0azVBd0lCQUwrSk9nTUNBUUF3R3dZSktvWklodmRqWkFnSEJBNHdETCtLZUFnRUJqRTFMalF1TVRBekJna3Foa2lHOTJOa0NBSUVKakFrb1NJRUlIY0h0MjRFUG45RjIrMU00XC9iSmNDV05GR044WjQ1YUJIWm1vSFg0c3BueU1Bb0dDQ3FHU000OUJBTUNBMmNBTUdRQ01GS3U0UXh4NWhza3hwUWdhXC9mXC8zb1pXRnNSMDRza1Z0ZHBMRDM0bnBjRkZUZHluUjJqT2luWlU3U2tlSmRDWkR3SXdDODI3VFpvdDRoYW9nMmxVRkFnTWozYlV4ZTJkQ0lsUTE2MjBEQzZ6R2ZCemtKVjRFeDlcLzU3S3NcLzQ3Z3JNcjlXUUpITUlJQ1F6Q0NBY2lnQXdJQkFnSVFDYnJGNGJ4QUd0blVVNVc4T0JvSVZEQUtCZ2dxaGtqT1BRUURBekJTTVNZd0pBWURWUVFEREIxQmNIQnNaU0JCY0hBZ1FYUjBaWE4wWVhScGIyNGdVbTl2ZENCRFFURVRNQkVHQTFVRUNnd0tRWEJ3YkdVZ1NXNWpMakVUTUJFR0ExVUVDQXdLUTJGc2FXWnZjbTVwWVRBZUZ3MHlNREF6TVRneE9ETTVOVFZhRncwek1EQXpNVE13TURBd01EQmFNRTh4SXpBaEJnTlZCQU1NR2tGd2NHeGxJRUZ3Y0NCQmRIUmxjM1JoZEdsdmJpQkRRU0F4TVJNd0VRWURWUVFLREFwQmNIQnNaU0JKYm1NdU1STXdFUVlEVlFRSURBcERZV3hwWm05eWJtbGhNSFl3RUFZSEtvWkl6ajBDQVFZRks0RUVBQ0lEWWdBRXJsczNvSGROZWJJMWowRG4wZkltSnZIQ1grOFhnQzNxczRKcVdZZFArTkt0RlNWNG1xSm1CQmtTU0xZOHVXY0ducGpUWTcxZU53K1wvb0k0eW5vQnpxWVhuZEc2aldhTDJieW5iTXE5RlhpRVdXTlZucjU0bWZySmhUY0lhWnM2Wm8yWXdaREFTQmdOVkhSTUJBZjhFQ0RBR0FRSFwvQWdFQU1COEdBMVVkSXdRWU1CYUFGS3lSRUZNenZiNW9RZituREtubCt1cmw1WXFoTUIwR0ExVWREZ1FXQkJRKzQxMGNCQm1weWJReCtJUjAxdUhoVjNMam16QU9CZ05WSFE4QkFmOEVCQU1DQVFZd0NnWUlLb1pJemowRUF3TURhUUF3WmdJeEFMdStpSTF6alFVQ3o3ejlabTBKVjFBMXZOYUhMRCtFTUVrbUtlM1IrUlRvZVprY211aTFydmpUcUZRejk3WU5CZ0l4QUtzNDdkRE1nZTBBcEZMRHVrVDVrMk5sVVwvN01LWDh1dE4rZlhyNWFTc3EybVZ4TGdnMzVCRGh2ZUFlN1dKUTV0MmR5WldObGFYQjBXUTVqTUlBR0NTcUdTSWIzRFFFSEFxQ0FNSUFDQVFFeER6QU5CZ2xnaGtnQlpRTUVBZ0VGQURDQUJna3Foa2lHOXcwQkJ3R2dnQ1NBQklJRDZER0NCQjR3TGdJQkFnSUJBUVFtUWpKT1dWTlROVGt6TWk1amIyMHVZV1I1Wlc0dVEyaGxZMnR2ZFhSRVpXMXZWVWxMYVhRd2dnTDVBZ0VEQWdFQkJJSUM3ekNDQXVzd2dnSnlvQU1DQVFJQ0JnR0MycVNsN2pBS0JnZ3Foa2pPUFFRREFqQlBNU013SVFZRFZRUUREQnBCY0hCc1pTQkJjSEFnUVhSMFpYTjBZWFJwYjI0Z1EwRWdNVEVUTUJFR0ExVUVDZ3dLUVhCd2JHVWdTVzVqTGpFVE1CRUdBMVVFQ0F3S1EyRnNhV1p2Y201cFlUQWVGdzB5TWpBNE1qVXhORFV6TVRsYUZ3MHlNakE0TWpneE5EVXpNVGxhTUlHUk1Va3dSd1lEVlFRRERFQmtZbUUzWmpKa1pESTVNRGt3TnpRM09UQTNaVGswTWprNE1tTTNOREppTnpKaVlUUmlZMkprTURNMU1qQXdNRFV6Tm1WbVl6UTROV1kwTWpRMk5tWXdNUm93R0FZRFZRUUxEQkZCUVVFZ1EyVnlkR2xtYVdOaGRHbHZiakVUTUJFR0ExVUVDZ3dLUVhCd2JHVWdTVzVqTGpFVE1CRUdBMVVFQ0F3S1EyRnNhV1p2Y201cFlUQlpNQk1HQnlxR1NNNDlBZ0VHQ0NxR1NNNDlBd0VIQTBJQUJQVHQzdGh1MXBEY2hSR1N4XC9wemw3Mzk5MlRreWIweWdCdjhiV1ZUMUkwZVBoNUw4MzE1ZExEdWh5XC9cL0xuc3VUQkJtNjNXOWV5ekM5TXVuenB0ZlVmdWpnZll3Z2ZNd0RBWURWUjBUQVFIXC9CQUl3QURBT0JnTlZIUThCQWY4RUJBTUNCUEF3Z1lBR0NTcUdTSWIzWTJRSUJRUnpNSEdrQXdJQkNyK0pNQU1DQVFHXC9pVEVEQWdFQXY0a3lBd0lCQWIrSk13TUNBUUdcL2lUUW9CQ1pDTWs1WlUxTTFPVE15TG1OdmJTNWhaSGxsYmk1RGFHVmphMjkxZEVSbGJXOVZTVXRwZEtVR0JBUnphM01ndjRrMkF3SUJCYitKTndNQ0FRQ1wvaVRrREFnRUF2NGs2QXdJQkFEQWJCZ2txaGtpRzkyTmtDQWNFRGpBTXY0cDRDQVFHTVRVdU5DNHhNRE1HQ1NxR1NJYjNZMlFJQWdRbU1DU2hJZ1FnZHdlM2JnUStmMFhiN1V6ajlzbHdKWTBVWTN4bmpsb0VkbWFnZGZpeW1mSXdDZ1lJS29aSXpqMEVBd0lEWndBd1pBSXdVcTdoREhIbUd5VEdsQ0JyOVwvXC9laGxZV3hIVGl5UlcxMmtzUGZpZWx3VVZOM0tkSGFNNktkbFR0S1I0bDBKa1BBakFMemJ0Tm1pM2lGcWlEYVZRVUNBeVBkdFRGN1owSWlWRFhyYlFNTHJNWjhIT1FsWGdUSDNcL25zcXpcL2p1Q3N5djB3S0FJQkJBSUJBUVFnZmZnNnlMZzczaWs0cThNUDYrbUhuaFNvUUlFbDNCOFgzd1N3dDZMMU1vWXdZQUlCQlFJQkFRUllibTVsZEVKVmNsSlBUMEZ4WTB4MGQxSlROSFI2ZEZOeWNFNW9hbWxGUzA1dk5UZG9OMkY1VFM5dVVEZFNUak5hY2xwbWNDdExTV05rTm13NWJEQXlWWFZtU2tGUGVESTBNbVpKUkcwck1qaDBWbGcyVkdjOVBUQU9BZ0VHQWdFQkJBWkJWRlJGVTFRd0R3SUJCd0lCQVFRSGMyRnVaR0p2ZURBZ0FnRU1BZ0VCQkJnRU9qSXdNakl0TURndE1qWlVNVFE2TlRNNk1Ua3VOelkwV2pBZ0FnRVZBZ0VCQkJneU1ESXlMVEV4TFRJMFZERTBPalV6T2pFNUxqYzJORm9BQUFBQUFBQ2dnRENDQTY0d2dnTlVvQU1DQVFJQ0VBazV0THpwRE1PaGdXVTJOeTltY1VFd0NnWUlLb1pJemowRUF3SXdmREV3TUM0R0ExVUVBd3duUVhCd2JHVWdRWEJ3YkdsallYUnBiMjRnU1c1MFpXZHlZWFJwYjI0Z1EwRWdOU0F0SUVjeE1TWXdKQVlEVlFRTERCMUJjSEJzWlNCRFpYSjBhV1pwWTJGMGFXOXVJRUYxZEdodmNtbDBlVEVUTUJFR0ExVUVDZ3dLUVhCd2JHVWdTVzVqTGpFTE1Ba0dBMVVFQmhNQ1ZWTXdIaGNOTWpJd05ERTVNVE16TXpBeldoY05Nak13TlRFNU1UTXpNekF5V2pCYU1UWXdOQVlEVlFRRERDMUJjSEJzYVdOaGRHbHZiaUJCZEhSbGMzUmhkR2x2YmlCR2NtRjFaQ0JTWldObGFYQjBJRk5wWjI1cGJtY3hFekFSQmdOVkJBb01Da0Z3Y0d4bElFbHVZeTR4Q3pBSkJnTlZCQVlUQWxWVE1Ga3dFd1lIS29aSXpqMENBUVlJS29aSXpqMERBUWNEUWdBRU9kVDVxcHNjeEVYV1c2WVhyUExBaE94dkJ3alZrQlNnNTI3UFBlNDVtYWxNYVwvc0JWUkJWVldSczJvNGo0Q1lCRkFMUWZoTzVWQlwvWXROWlgyQzZUZUtPQ0FkZ3dnZ0hVTUF3R0ExVWRFd0VCXC93UUNNQUF3SHdZRFZSMGpCQmd3Rm9BVTJSZitTMmVRT0V1UzlOdk8xVmVBRkF1UFBja3dRd1lJS3dZQkJRVUhBUUVFTnpBMU1ETUdDQ3NHQVFVRkJ6QUJoaWRvZEhSd09pOHZiMk56Y0M1aGNIQnNaUzVqYjIwdmIyTnpjREF6TFdGaGFXTmhOV2N4TURFd2dnRWNCZ05WSFNBRWdnRVRNSUlCRHpDQ0FRc0dDU3FHU0liM1kyUUZBVENCXC9UQ0J3d1lJS3dZQkJRVUhBZ0l3Z2JZTWdiTlNaV3hwWVc1alpTQnZiaUIwYUdseklHTmxjblJwWm1sallYUmxJR0o1SUdGdWVTQndZWEowZVNCaGMzTjFiV1Z6SUdGalkyVndkR0Z1WTJVZ2IyWWdkR2hsSUhSb1pXNGdZWEJ3YkdsallXSnNaU0J6ZEdGdVpHRnlaQ0IwWlhKdGN5QmhibVFnWTI5dVpHbDBhVzl1Y3lCdlppQjFjMlVzSUdObGNuUnBabWxqWVhSbElIQnZiR2xqZVNCaGJtUWdZMlZ5ZEdsbWFXTmhkR2x2YmlCd2NtRmpkR2xqWlNCemRHRjBaVzFsYm5SekxqQTFCZ2dyQmdFRkJRY0NBUllwYUhSMGNEb3ZMM2QzZHk1aGNIQnNaUzVqYjIwdlkyVnlkR2xtYVdOaGRHVmhkWFJvYjNKcGRIa3dIUVlEVlIwT0JCWUVGUHRuMHcyXC9jN2VTcGlaZFNJMHN3UjJWNG5QNE1BNEdBMVVkRHdFQlwvd1FFQXdJSGdEQVBCZ2txaGtpRzkyTmtEQThFQWdVQU1Bb0dDQ3FHU000OUJBTUNBMGdBTUVVQ0lRQ1VrS0JuTjNQbkwzZ3BObllqdU4xUjE4aWFDZXE3QU9PY2JrVUxCVmdMMEFJZ1J6UWFLOUU4d0ZTb0NqcXF6RHpCUlh3QVZGTVk2ak9OZlczVjlnc3JoeTR3Z2dMNU1JSUNmNkFEQWdFQ0FoQlcrNFBVS1wvK053emVaSTdWYXJtNjlNQW9HQ0NxR1NNNDlCQU1ETUdjeEd6QVpCZ05WQkFNTUVrRndjR3hsSUZKdmIzUWdRMEVnTFNCSE16RW1NQ1FHQTFVRUN3d2RRWEJ3YkdVZ1EyVnlkR2xtYVdOaGRHbHZiaUJCZFhSb2IzSnBkSGt4RXpBUkJnTlZCQW9NQ2tGd2NHeGxJRWx1WXk0eEN6QUpCZ05WQkFZVEFsVlRNQjRYRFRFNU1ETXlNakUzTlRNek0xb1hEVE0wTURNeU1qQXdNREF3TUZvd2ZERXdNQzRHQTFVRUF3d25RWEJ3YkdVZ1FYQndiR2xqWVhScGIyNGdTVzUwWldkeVlYUnBiMjRnUTBFZ05TQXRJRWN4TVNZd0pBWURWUVFMREIxQmNIQnNaU0JEWlhKMGFXWnBZMkYwYVc5dUlFRjFkR2h2Y21sMGVURVRNQkVHQTFVRUNnd0tRWEJ3YkdVZ1NXNWpMakVMTUFrR0ExVUVCaE1DVlZNd1dUQVRCZ2NxaGtqT1BRSUJCZ2dxaGtqT1BRTUJCd05DQUFTU3ptTzlmWWF4cXlnS094emhyXC9zRWxJQ1JyUFl4MzZiTEtEVnZSRXZoSWVWWDNSS05qYnFDZkpXK1NmcStNOHF1elFRWjhTOURKZnIwdnJQTGczNjZvNEgzTUlIME1BOEdBMVVkRXdFQlwvd1FGTUFNQkFmOHdId1lEVlIwakJCZ3dGb0FVdTdEZW9WZ3ppSnFraXBuZXZyM3JyOXJMSktzd1JnWUlLd1lCQlFVSEFRRUVPakE0TURZR0NDc0dBUVVGQnpBQmhpcG9kSFJ3T2k4dmIyTnpjQzVoY0hCc1pTNWpiMjB2YjJOemNEQXpMV0Z3Y0d4bGNtOXZkR05oWnpNd053WURWUjBmQkRBd0xqQXNvQ3FnS0lZbWFIUjBjRG92TDJOeWJDNWhjSEJzWlM1amIyMHZZWEJ3YkdWeWIyOTBZMkZuTXk1amNtd3dIUVlEVlIwT0JCWUVGTmtYXC9rdG5rRGhMa3ZUYnp0VlhnQlFManozSk1BNEdBMVVkRHdFQlwvd1FFQXdJQkJqQVFCZ29xaGtpRzkyTmtCZ0lEQkFJRkFEQUtCZ2dxaGtqT1BRUURBd05vQURCbEFqRUFqVyttbjZIZzVPeGJUbk9La244OWVGT1lqXC9UYUgxZ2V3M1ZLXC9qaW9UQ3FER2hxcURhWmtiZUc1aytqUlZVenRBakJuT3l5MDRlZzNCM2ZMMWV4MnFCbzZWVHNcL05Xckl4ZWFTc09GaHZvQkphZVJmSzZsczRSRUNxc3hoMlRpM2Mwb3dnZ0pETUlJQnlhQURBZ0VDQWdndHhmeUkwc1ZMbFRBS0JnZ3Foa2pPUFFRREF6Qm5NUnN3R1FZRFZRUUREQkpCY0hCc1pTQlNiMjkwSUVOQklDMGdSek14SmpBa0JnTlZCQXNNSFVGd2NHeGxJRU5sY25ScFptbGpZWFJwYjI0Z1FYVjBhRzl5YVhSNU1STXdFUVlEVlFRS0RBcEJjSEJzWlNCSmJtTXVNUXN3Q1FZRFZRUUdFd0pWVXpBZUZ3MHhOREEwTXpBeE9ERTVNRFphRncwek9UQTBNekF4T0RFNU1EWmFNR2N4R3pBWkJnTlZCQU1NRWtGd2NHeGxJRkp2YjNRZ1EwRWdMU0JITXpFbU1DUUdBMVVFQ3d3ZFFYQndiR1VnUTJWeWRHbG1hV05oZEdsdmJpQkJkWFJvYjNKcGRIa3hFekFSQmdOVkJBb01Da0Z3Y0d4bElFbHVZeTR4Q3pBSkJnTlZCQVlUQWxWVE1IWXdFQVlIS29aSXpqMENBUVlGSzRFRUFDSURZZ0FFbU9rdlBVQnlwTzJUSW5LQkV4emRFSlh4eGFOT2Nkd1VGdGtPNWFZRktuZGtlMTlPT05PN0hFUzFmXC9VZnRqSmlYY25waEZ0UE1FOFJXZ0Q5V0ZnTXBmVVBMRTBIUnhOMTJwZVhsMjh4WE8wcm5Yc2dPOWk1Vk5sZW1hUTZVUW94bzBJd1FEQWRCZ05WSFE0RUZnUVV1N0Rlb1ZnemlKcWtpcG5ldnIzcnI5ckxKS3N3RHdZRFZSMFRBUUhcL0JBVXdBd0VCXC96QU9CZ05WSFE4QkFmOEVCQU1DQVFZd0NnWUlLb1pJemowRUF3TURhQUF3WlFJeEFJUHB3Y1FXWGhwZE5Calo3ZVwvMGJBNEFSa3U0MzdKR0VjVVBcL2VaNmpLR21hODdDQTlTYzlaUEdkTGhxMzZvakZRSXdiV2FLRU1yVURkUlB6WTFEUHJTS1k2VXpidU50MmhlM1pCXC9JVXliNWlHSjBPUXNYVzh0UnFBem9HQVBub3JJb0FBQXhnZnd3Z2ZrQ0FRRXdnWkF3ZkRFd01DNEdBMVVFQXd3blFYQndiR1VnUVhCd2JHbGpZWFJwYjI0Z1NXNTBaV2R5WVhScGIyNGdRMEVnTlNBdElFY3hNU1l3SkFZRFZRUUxEQjFCY0hCc1pTQkRaWEowYVdacFkyRjBhVzl1SUVGMWRHaHZjbWwwZVRFVE1CRUdBMVVFQ2d3S1FYQndiR1VnU1c1akxqRUxNQWtHQTFVRUJoTUNWVk1DRUFrNXRMenBETU9oZ1dVMk55OW1jVUV3RFFZSllJWklBV1VEQkFJQkJRQXdDZ1lJS29aSXpqMEVBd0lFUmpCRUFpQXMwTVRSTHcwUTJXb2lXMVgrR0lEVWQzdWFFc0JLOUxhcjJnbmtFcmsydndJZ0FObWY4T2lpbkxKdkw0ZTk4ejFFMUFzSDBVV2l5U2VuSWJHRkw2QU5UbUlBQUFBQUFBQm9ZWFYwYUVSaGRHRllwQzh0d3RUcmlmZFwvaUtMRCtsUm5OS3E1WmFKVjNHbmpFTXZVeUE2N21DbGZRQUFBQUFCaGNIQmhkSFJsYzNSa1pYWmxiRzl3QUNEYnBcL0xkS1FrSFI1QitsQ21DeDBLM0s2Uzh2UU5TQUFVMjc4U0Y5Q1JtOEtVQkFnTW1JQUVoV0NEMDdkN1lidGFRM0lVUmtzZjZjNWU5XC9mZGs1TW05TW9BYlwvRzFsVTlTTkhpSllJRDRlU1wvTjllWFN3N29jdlwveTU3TGt3UVp1dDF2WHNzd3ZUTHA4NmJYMUg3IiwidmVyc2lvbiI6MX0"
    }
}
