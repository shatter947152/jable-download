// 向页面注入script，为了得到页面中js变量
var s = document.createElement('script');
s.src = chrome.runtime.getURL('inject.js');
s.onload = function() { this.remove(); };
(document.head || document.documentElement).appendChild(s);



console.log('contents-script.js');

chrome.storage.local.get(function(settingsObj) {
    inputDom = document.createElement('input');
    inputDom.id = 'ex-settings';
    inputDom.type = 'hidden';
    inputDom.value = JSON.stringify(settingsObj);
    (document.head || document.documentElement).appendChild(inputDom);
});



// function Func() {
//     return new Promise((resolve, reject) => {
//         window.addEventListener("message", function(e) {
//             resolve(e)
//         }, false);
//     })
// }

// Func().then(res => {
//     // console.log('content then');
//     // console.log(res.data);
//     chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
//         // console.log('content-script addListener');
//         // console.log(request);
//         // console.log(sender);
//         // console.log(res.data);
//         sendResponse(res.data);
//     });
// })