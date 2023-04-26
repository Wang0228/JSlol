<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>

<body>
    <div class="jumbotron justify-content-center d-flex bg-info align-items-center mb-4" style="height: 150px;">
        <h1>LOL英雄聯盟圖鑑</h1>
    </div>

    



    
    <div class="container">
        <div class="row"><button id="API">Ajax call LOL英雄聯盟 API</button>
            <template id="template">
                <div class="col-3 mb-3">
                    <div class="card  w-100" style="width: 18rem;" id="card">
                        <img src="" class="card-img-top" alt="..." id="pic">
                        <div class="card-body bg-warning">
                            <h5 class="card-title bg-black text-white p-1" id="number"></h5>
                            <p class="card-text" id="introduce" style="overflow:auto; height: 100px;">
                                尊貴的蘇瑞瑪守護者過去曾為符文大地挺身對抗虛空，只不過厄薩斯和...</p>
                            <button type="button" id="bt" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="pc0">
                                詳細
                            </button>
                            <div class="modal fade " id="pc" tabindex="-1" aria-labelledby="exampleModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <h5 class="card-title bg-info d-flex justify-content-between align-items-center text-center px-2"
                                            style="height: 50px;">
                                            <div id="number" class="text" style="height: fit-content;"></div> <button
                                                type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </h5>
                                        <div class="card-body px-3">
                                            <img id="pic" src="" class="card-img-top p-3" alt="...">
                                            <p class="card-text" id="ability">HP:580 <br>Move Speed:345<br>Armor:38
                                                <br>Spell Block:32.1<br>AttackRange:175
                                            </p>
                                            <hr>
                                            <button type="button" class="btn btn-secondary mb-3"
                                                data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#a" id="vbt">
                                影片
                            </button>
                            <div class="modal fade" id="vd" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="videoModalLabel">影片標題</h5>
                                            <button
                                                type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <video style="width: 100%;" controls="" name="media"><source id="video" src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0002/ability_0002_R1.webm" type="video/mp4"></video>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary mb-3"
                                                data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- <div class="modal fade " id="a" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
                                <div class="modal-dialog modal-dialog modal-dialog-centered" >
                                    <div class="modal-content">
                                        <h5 class="card-title bg-info d-flex justify-content-between align-items-center text-center px-2" style="height: 50px;"><div id="number" class="text" style="height: fit-content;"></div> <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></h5>
                                        <iframe class="w-auto" src="https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0266/ability_0266_P1.jpg" frameborder="0"></iframe>
                                        <div style="height: 300px; width: 300px; background-color:aqua;"></div>
                                    </div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>


            </template>
        </div>
    </div>
    <div class="a"></div>
    
    

    


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        let data;
        let index = 0;
        let template = $("#template")[0];

        console.log(template)
        let url = 'https://ddragon.leagueoflegends.com/cdn/10.22.1/data/zh_TW/champion.json'
        $(document).ready(function () {
            $("#API").click(function(){
                API()
            });
        })

        function API(){
            $.ajax({
                method: 'GET',
                url: url
            }).
                done(function (res) {
                    $.each(res.data, function (name, all) {
                        let card = $(template.content.cloneNode(true));
                        card.find(`#bt`).attr("data-bs-target", `#pc${index}`)
                        card.find("#pc").attr("id", `pc${index}`)
                        card.find("#number").text(`${index} : ${all.id} - ${all.name}`)
                        card.find("#introduce").text(all.blurb)
                        card.find("#ability").html(`HP:${all.stats.hp}<br>Move Speed:${all.stats.movespeed}<br>Armor:${all.stats.armor}<br>Spell Block:${all.stats.spellblock}<br>AttackRange:${all.stats.attackrange}`)
                        card.find("#pic").attr("src", `https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${name}_0.jpg`)
                        card.find(`#vbt`).attr("data-bs-target", `#video${index}`)
                        card.find("#vd").attr("id", `video${index}`)
                        card.find("#video").attr("src",`https://d28xe8vt774jo5.cloudfront.net/champion-abilities/${all.key.padStart(4,0)}/ability_${all.key.padStart(4,0)}_R1.webm`)
                        card.appendTo(".row")
                        index += 1
                        
                    })
                })
        }
    </script>
</body>


</html>