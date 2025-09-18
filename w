<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fin｜互動式SOP作戰手冊</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;700;900&display=swap" rel="stylesheet">
    <!-- 
    Chosen Palette: Professional Slate & Interactive Blue
    Application Structure Plan: A single-page application designed as an interactive SOP (Standard Operating Procedure) manual. The structure is a vertical accordion, where each stage of the client communication process is a collapsible section. This allows the user to focus on one stage at a time. Key interactions include clickable checklists for actions, and a modal window for the detailed "Golden Questions," transforming the static document into a dynamic, actionable tool for professional use.
    Visualization & Content Choices: Process Stages -> Accordion Layout (HTML/JS) -> Goal: Focused Navigation -> Justification: Reduces cognitive load by hiding irrelevant details. Key Actions -> Interactive Checklist (HTML) -> Goal: Progress Tracking -> Justification: Makes the SOP a practical, reusable tool for each client. Golden Questions -> Modal Window (JS) -> Goal: Emphasize Importance & Declutter -> Justification: Presents critical information on-demand without cluttering the main view.
    CONFIRMATION: NO SVG graphics used. NO Mermaid JS used.
    -->
    <style>
        body {
            font-family: 'Noto Sans TC', sans-serif;
            background-color: #f1f5f9; /* slate-100 */
        }
        .accordion-header {
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }
        .accordion-header:hover {
            background-color: #f8fafc; /* slate-50 */
        }
        .accordion-content {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.4s ease-in-out, padding 0.4s ease-in-out;
            padding: 0 1.5rem;
        }
        .accordion-content.open {
            max-height: 1000px; /* Arbitrary large value */
            padding: 1.5rem 1.5rem;
        }
        .accordion-icon {
            transition: transform 0.4s ease-in-out;
        }
        .accordion-header.open .accordion-icon {
            transform: rotate(90deg);
        }
        .modal-overlay {
            display: none;
            position: fixed;
            z-index: 50;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.6);
            align-items: center;
            justify-content: center;
        }
        .modal-content {
            transform: translateY(-50px);
            opacity: 0;
            transition: all 0.3s ease-out;
        }
        .modal-overlay.open {
            display: flex;
        }
        .modal-overlay.open .modal-content {
            transform: translateY(0);
            opacity: 1;
        }
        .checklist-label {
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        .checklist-label input:checked ~ span {
            text-decoration: line-through;
            color: #94a3b8; /* slate-400 */
        }
    </style>
</head>
<body class="text-slate-800">

    <div class="container mx-auto max-w-3xl px-4 py-12">
        <header class="text-center mb-12">
            <h1 class="text-4xl font-black text-slate-900">互動式SOP作戰手冊</h1>
            <p class="text-xl text-slate-600 mt-2">您的顧問級服務流程儀表板</p>
        </header>

        <div class="space-y-4">
            <!-- Stage 0 -->
            <div class="bg-white rounded-lg border border-slate-200 shadow-sm overflow-hidden">
                <div class="accordion-header flex items-center justify-between p-6">
                    <div class="flex items-center">
                        <div class="text-2xl font-black text-blue-500 mr-4">0</div>
                        <div>
                            <h2 class="text-xl font-bold text-slate-800">準備階段：客戶研究</h2>
                            <p class="text-sm text-slate-500">心態：偵探 🕵️｜在接觸前，贏得先機</p>
                        </div>
                    </div>
                    <div class="accordion-icon text-2xl text-slate-400">▶</div>
                </div>
                <div class="accordion-content">
                    <h3 class="font-bold text-slate-700 mb-3">🚀 關鍵行動清單：</h3>
                    <ul class="space-y-3">
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span><strong>客戶背景調查：</strong>分析其社群內容、質感與互動缺口。</span></label></li>
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span><strong>自我價值定位：</strong>思考我能為他提供的最大價值是什麼。</span></label></li>
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span><strong>客製化素材準備：</strong>挑選1-2個最能解決他痛點的案例。</span></label></li>
                    </ul>
                </div>
            </div>

            <!-- Stage 1 -->
            <div class="bg-white rounded-lg border border-slate-200 shadow-sm overflow-hidden">
                <div class="accordion-header flex items-center justify-between p-6">
                    <div class="flex items-center">
                        <div class="text-2xl font-black text-blue-500 mr-4">1</div>
                        <div>
                            <h2 class="text-xl font-bold text-slate-800">初步接觸：建立連結</h2>
                            <p class="text-sm text-slate-500">心態：顧問 👨‍🏫｜目標是贏得一次深度對話</p>
                        </div>
                    </div>
                    <div class="accordion-icon text-2xl text-slate-400">▶</div>
                </div>
                <div class="accordion-content">
                    <h3 class="font-bold text-slate-700 mb-3">🚀 關鍵行動清單：</h3>
                    <ul class="space-y-3">
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**客製化破冰：** 發送「我注意到...我欣賞...」的訊息。</span></label></li>
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**策略性展示：** 附上最相關案例並簡述其解決方案。</span></label></li>
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**高價值邀約：** 邀請進行15-20分鐘的「品牌內容策略健檢」。</span></label></li>
                    </ul>
                </div>
            </div>

            <!-- Stage 2 -->
            <div class="bg-white rounded-lg border border-slate-200 shadow-sm overflow-hidden">
                <div class="accordion-header flex items-center justify-between p-6">
                    <div class="flex items-center">
                        <div class="text-2xl font-black text-blue-500 mr-4">2</div>
                        <div>
                            <h2 class="text-xl font-bold text-slate-800">價值探索會議：深度問診</h2>
                            <p class="text-sm text-slate-500">心態：醫生 🩺｜徹底忘掉報價，專注於診斷</p>
                        </div>
                    </div>
                     <div class="accordion-icon text-2xl text-slate-400">▶</div>
                </div>
                <div class="accordion-content">
                     <h3 class="font-bold text-slate-700 mb-3">🚀 關鍵行動清單：</h3>
                    <ul class="space-y-3">
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**開場定調：** 重申會議目標是「判斷我是否能幫上忙」。</span></label></li>
                        <li>
                            <button id="openModalBtn" class="w-full text-left bg-blue-50 hover:bg-blue-100 text-blue-700 font-semibold py-2 px-4 rounded-lg transition-colors">
                                ✓ **執行顧問級黃金提問** (點擊查看問題清單)
                            </button>
                        </li>
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**價值重述：** 用「所以，聽起來您真正的目標是...」來總結。</span></label></li>
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**設定下一步：** 承諾將為他「量身打造」一份合作提案。</span></label></li>
                    </ul>
                </div>
            </div>

             <!-- Stage 3 & 4 -->
            <div class="bg-white rounded-lg border border-slate-200 shadow-sm overflow-hidden">
                <div class="accordion-header flex items-center justify-between p-6">
                    <div class="flex items-center">
                        <div class="text-2xl font-black text-blue-500 mr-4">3</div>
                        <div>
                            <h2 class="text-xl font-bold text-slate-800">提案與簽約：呈現藍圖</h2>
                            <p class="text-sm text-slate-500">心態：建築師 🏗️｜呈現一份無法拒絕的解決方案</p>
                        </div>
                    </div>
                    <div class="accordion-icon text-2xl text-slate-400">▶</div>
                </div>
                <div class="accordion-content">
                     <h3 class="font-bold text-slate-700 mb-3">🚀 關鍵行動清單：</h3>
                    <ul class="space-y-3">
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**撰寫客製化提案：** 在提案中寫滿客戶的原話。</span></label></li>
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**安排價值導覽會議 (可選)：** 親自解說提案價值。</span></label></li>
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**引導正式簽約：** 發送最終合約書並引導簽署。</span></label></li>
                    </ul>
                </div>
            </div>
            
            <div class="bg-white rounded-lg border border-slate-200 shadow-sm overflow-hidden">
                <div class="accordion-header flex items-center justify-between p-6">
                    <div class="flex items-center">
                        <div class="text-2xl font-black text-blue-500 mr-4">4</div>
                        <div>
                            <h2 class="text-xl font-bold text-slate-800">專案啟動：創造絕佳體驗</h2>
                            <p class="text-sm text-slate-500">心態：領航員 🧭｜從第一天起，就讓客戶感到安心</p>
                        </div>
                    </div>
                    <div class="accordion-icon text-2xl text-slate-400">▶</div>
                </div>
                <div class="accordion-content">
                    <h3 class="font-bold text-slate-700 mb-3">🚀 關鍵行動清單：</h3>
                    <ul class="space-y-3">
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**發送「歡迎包裹」Email。**</span></label></li>
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**召開「專案啟動會議」。**</span></label></li>
                        <li><label class="checklist-label"><input type="checkbox" class="mr-3 h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"><span>**交付「專案儀表板」Notion連結。**</span></label></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    
    <!-- Modal -->
    <div id="questionsModal" class="modal-overlay">
        <div class="modal-content bg-white w-11/12 max-w-2xl rounded-lg shadow-xl p-6 md:p-8">
            <div class="flex justify-between items-center mb-6">
                <h3 class="text-2xl font-bold text-slate-800">顧問級黃金提問清單 🩺</h3>
                <button id="closeModalBtn" class="text-3xl text-slate-400 hover:text-slate-600">&times;</button>
            </div>
            <div class="space-y-4 text-sm text-slate-700">
                <div>
                    <p class="font-semibold text-slate-600 mb-2">【關於現況與挑戰】</p>
                    <ul class="space-y-2 list-disc list-inside">
                        <li>「在經營品牌上，目前讓您**最睡不著覺**的挑戰是什麼？」</li>
                        <li>「如果用一個詞來形容您現在的社群，您會用什麼？您**希望**它變成什麼？」</li>
                    </ul>
                </div>
                <div>
                    <p class="font-semibold text-slate-600 mb-2">【關於目標與願景】</p>
                    <ul class="space-y-2 list-disc list-inside">
                        <li>「如果這次合作非常成功，一年後，您希望您的品牌達到什麼樣的**具體成果**？（不只是粉絲數，而是商業上的）」</li>
                        <li>「您最希望您的客戶在體驗完您的服務/產品後，會跟朋友怎麼**形容**您？」</li>
                    </ul>
                </div>
                <div>
                    <p class="font-semibold text-slate-600 mb-2">【關於資源與期待】</p>
                    <ul class="space-y-2 list-disc list-inside">
                        <li>「過去在行銷上，您覺得哪一筆投資**最值得**？哪一筆**最浪費**？為什麼？」</li>
                        <li>「除了影片製作，您認為在合作中，我還能在哪些方面為您提供**額外的價值**？」</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const accordions = document.querySelectorAll('.accordion-header');
            const modal = document.getElementById('questionsModal');
            const openModalBtn = document.getElementById('openModalBtn');
            const closeModalBtn = document.getElementById('closeModalBtn');

            accordions.forEach(accordion => {
                accordion.addEventListener('click', function () {
                    const content = this.nextElementSibling;
                    
                    if (content.classList.contains('open')) {
                        content.classList.remove('open');
                        this.classList.remove('open');
                    } else {
                        // Optional: Close all other accordions
                        accordions.forEach(otherAccordion => {
                            if(otherAccordion !== this) {
                                otherAccordion.nextElementSibling.classList.remove('open');
                                otherAccordion.classList.remove('open');
                            }
                        });
                        
                        content.classList.add('open');
                        this.classList.add('open');
                    }
                });
            });
            
            if(openModalBtn) {
                openModalBtn.addEventListener('click', () => modal.classList.add('open'));
            }
            
            if(closeModalBtn) {
                closeModalBtn.addEventListener('click', () => modal.classList.remove('open'));
            }

            if(modal) {
                modal.addEventListener('click', (e) => {
                    if (e.target === modal) {
                        modal.classList.remove('open');
                    }
                });
            }
        });
    </script>
</body>
</html>

