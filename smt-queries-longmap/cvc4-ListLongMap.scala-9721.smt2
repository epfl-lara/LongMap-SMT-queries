; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115002 () Bool)

(assert start!115002)

(declare-fun b!1363241 () Bool)

(declare-fun res!907093 () Bool)

(declare-fun e!773110 () Bool)

(assert (=> b!1363241 (=> (not res!907093) (not e!773110))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92680 0))(
  ( (array!92681 (arr!44773 (Array (_ BitVec 32) (_ BitVec 64))) (size!45323 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92680)

(assert (=> b!1363241 (= res!907093 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45323 a!3742))))))

(declare-fun b!1363242 () Bool)

(declare-fun res!907087 () Bool)

(assert (=> b!1363242 (=> (not res!907087) (not e!773110))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363242 (= res!907087 (not (validKeyInArray!0 l!3587)))))

(declare-datatypes ((List!31814 0))(
  ( (Nil!31811) (Cons!31810 (h!33019 (_ BitVec 64)) (t!46502 List!31814)) )
))
(declare-fun acc!759 () List!31814)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun e!773107 () Bool)

(declare-fun b!1363243 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92680 (_ BitVec 32) List!31814) Bool)

(assert (=> b!1363243 (= e!773107 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))))

(declare-fun b!1363244 () Bool)

(declare-fun res!907090 () Bool)

(assert (=> b!1363244 (=> (not res!907090) (not e!773110))))

(assert (=> b!1363244 (= res!907090 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31811))))

(declare-fun b!1363245 () Bool)

(declare-datatypes ((Unit!44979 0))(
  ( (Unit!44980) )
))
(declare-fun e!773109 () Unit!44979)

(declare-fun lt!600718 () Unit!44979)

(assert (=> b!1363245 (= e!773109 lt!600718)))

(declare-fun lt!600720 () Unit!44979)

(declare-fun lemmaListSubSeqRefl!0 (List!31814) Unit!44979)

(assert (=> b!1363245 (= lt!600720 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!925 (List!31814 List!31814) Bool)

(assert (=> b!1363245 (subseq!925 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92680 List!31814 List!31814 (_ BitVec 32)) Unit!44979)

(declare-fun $colon$colon!928 (List!31814 (_ BitVec 64)) List!31814)

(assert (=> b!1363245 (= lt!600718 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!928 acc!759 (select (arr!44773 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363245 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363246 () Bool)

(declare-fun res!907092 () Bool)

(assert (=> b!1363246 (=> (not res!907092) (not e!773110))))

(declare-fun noDuplicate!2380 (List!31814) Bool)

(assert (=> b!1363246 (= res!907092 (noDuplicate!2380 acc!759))))

(declare-fun b!1363247 () Bool)

(declare-fun Unit!44981 () Unit!44979)

(assert (=> b!1363247 (= e!773109 Unit!44981)))

(declare-fun b!1363248 () Bool)

(declare-fun res!907095 () Bool)

(assert (=> b!1363248 (=> (not res!907095) (not e!773110))))

(declare-fun contains!9523 (List!31814 (_ BitVec 64)) Bool)

(assert (=> b!1363248 (= res!907095 (not (contains!9523 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363250 () Bool)

(assert (=> b!1363250 (= e!773110 e!773107)))

(declare-fun res!907089 () Bool)

(assert (=> b!1363250 (=> (not res!907089) (not e!773107))))

(declare-fun lt!600721 () Bool)

(assert (=> b!1363250 (= res!907089 (and (not (= from!3120 i!1404)) (not lt!600721) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600719 () Unit!44979)

(assert (=> b!1363250 (= lt!600719 e!773109)))

(declare-fun c!127517 () Bool)

(assert (=> b!1363250 (= c!127517 lt!600721)))

(assert (=> b!1363250 (= lt!600721 (validKeyInArray!0 (select (arr!44773 a!3742) from!3120)))))

(declare-fun b!1363251 () Bool)

(declare-fun res!907096 () Bool)

(assert (=> b!1363251 (=> (not res!907096) (not e!773110))))

(assert (=> b!1363251 (= res!907096 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45323 a!3742)))))

(declare-fun b!1363252 () Bool)

(declare-fun res!907088 () Bool)

(assert (=> b!1363252 (=> (not res!907088) (not e!773110))))

(assert (=> b!1363252 (= res!907088 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363249 () Bool)

(declare-fun res!907094 () Bool)

(assert (=> b!1363249 (=> (not res!907094) (not e!773110))))

(assert (=> b!1363249 (= res!907094 (not (contains!9523 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!907091 () Bool)

(assert (=> start!115002 (=> (not res!907091) (not e!773110))))

(assert (=> start!115002 (= res!907091 (and (bvslt (size!45323 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45323 a!3742))))))

(assert (=> start!115002 e!773110))

(assert (=> start!115002 true))

(declare-fun array_inv!33801 (array!92680) Bool)

(assert (=> start!115002 (array_inv!33801 a!3742)))

(assert (= (and start!115002 res!907091) b!1363246))

(assert (= (and b!1363246 res!907092) b!1363248))

(assert (= (and b!1363248 res!907095) b!1363249))

(assert (= (and b!1363249 res!907094) b!1363244))

(assert (= (and b!1363244 res!907090) b!1363252))

(assert (= (and b!1363252 res!907088) b!1363241))

(assert (= (and b!1363241 res!907093) b!1363242))

(assert (= (and b!1363242 res!907087) b!1363251))

(assert (= (and b!1363251 res!907096) b!1363250))

(assert (= (and b!1363250 c!127517) b!1363245))

(assert (= (and b!1363250 (not c!127517)) b!1363247))

(assert (= (and b!1363250 res!907089) b!1363243))

(declare-fun m!1248087 () Bool)

(assert (=> start!115002 m!1248087))

(declare-fun m!1248089 () Bool)

(assert (=> b!1363243 m!1248089))

(declare-fun m!1248091 () Bool)

(assert (=> b!1363252 m!1248091))

(declare-fun m!1248093 () Bool)

(assert (=> b!1363248 m!1248093))

(declare-fun m!1248095 () Bool)

(assert (=> b!1363245 m!1248095))

(declare-fun m!1248097 () Bool)

(assert (=> b!1363245 m!1248097))

(declare-fun m!1248099 () Bool)

(assert (=> b!1363245 m!1248099))

(declare-fun m!1248101 () Bool)

(assert (=> b!1363245 m!1248101))

(assert (=> b!1363245 m!1248089))

(assert (=> b!1363245 m!1248097))

(assert (=> b!1363245 m!1248099))

(declare-fun m!1248103 () Bool)

(assert (=> b!1363245 m!1248103))

(declare-fun m!1248105 () Bool)

(assert (=> b!1363249 m!1248105))

(assert (=> b!1363250 m!1248097))

(assert (=> b!1363250 m!1248097))

(declare-fun m!1248107 () Bool)

(assert (=> b!1363250 m!1248107))

(declare-fun m!1248109 () Bool)

(assert (=> b!1363242 m!1248109))

(declare-fun m!1248111 () Bool)

(assert (=> b!1363244 m!1248111))

(declare-fun m!1248113 () Bool)

(assert (=> b!1363246 m!1248113))

(push 1)

(assert (not b!1363246))

(assert (not start!115002))

(assert (not b!1363244))

(assert (not b!1363252))

(assert (not b!1363250))

(assert (not b!1363248))

(assert (not b!1363242))

(assert (not b!1363243))

(assert (not b!1363245))

(assert (not b!1363249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1363291 () Bool)

(declare-fun e!773146 () Bool)

(declare-fun call!65404 () Bool)

(assert (=> b!1363291 (= e!773146 call!65404)))

(declare-fun b!1363292 () Bool)

(declare-fun e!773145 () Bool)

(assert (=> b!1363292 (= e!773145 e!773146)))

(declare-fun c!127522 () Bool)

(assert (=> b!1363292 (= c!127522 (validKeyInArray!0 (select (arr!44773 a!3742) from!3120)))))

(declare-fun e!773148 () Bool)

(declare-fun b!1363293 () Bool)

(assert (=> b!1363293 (= e!773148 (contains!9523 acc!759 (select (arr!44773 a!3742) from!3120)))))

(declare-fun b!1363294 () Bool)

(declare-fun e!773147 () Bool)

(assert (=> b!1363294 (= e!773147 e!773145)))

(declare-fun res!907129 () Bool)

(assert (=> b!1363294 (=> (not res!907129) (not e!773145))))

(assert (=> b!1363294 (= res!907129 (not e!773148))))

(declare-fun res!907127 () Bool)

(assert (=> b!1363294 (=> (not res!907127) (not e!773148))))

(assert (=> b!1363294 (= res!907127 (validKeyInArray!0 (select (arr!44773 a!3742) from!3120)))))

(declare-fun d!146091 () Bool)

(declare-fun res!907128 () Bool)

(assert (=> d!146091 (=> res!907128 e!773147)))

(assert (=> d!146091 (= res!907128 (bvsge from!3120 (size!45323 a!3742)))))

(assert (=> d!146091 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!773147)))

(declare-fun bm!65401 () Bool)

(assert (=> bm!65401 (= call!65404 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127522 (Cons!31810 (select (arr!44773 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1363295 () Bool)

(assert (=> b!1363295 (= e!773146 call!65404)))

(assert (= (and d!146091 (not res!907128)) b!1363294))

(assert (= (and b!1363294 res!907127) b!1363293))

(assert (= (and b!1363294 res!907129) b!1363292))

(assert (= (and b!1363292 c!127522) b!1363295))

(assert (= (and b!1363292 (not c!127522)) b!1363291))

(assert (= (or b!1363295 b!1363291) bm!65401))

(assert (=> b!1363292 m!1248097))

(assert (=> b!1363292 m!1248097))

(assert (=> b!1363292 m!1248107))

(assert (=> b!1363293 m!1248097))

(assert (=> b!1363293 m!1248097))

(declare-fun m!1248131 () Bool)

(assert (=> b!1363293 m!1248131))

(assert (=> b!1363294 m!1248097))

(assert (=> b!1363294 m!1248097))

(assert (=> b!1363294 m!1248107))

(assert (=> bm!65401 m!1248097))

(declare-fun m!1248133 () Bool)

(assert (=> bm!65401 m!1248133))

(assert (=> b!1363252 d!146091))

(declare-fun d!146105 () Bool)

(declare-fun res!907139 () Bool)

(declare-fun e!773159 () Bool)

(assert (=> d!146105 (=> res!907139 e!773159)))

(assert (=> d!146105 (= res!907139 (is-Nil!31811 acc!759))))

(assert (=> d!146105 (= (noDuplicate!2380 acc!759) e!773159)))

(declare-fun b!1363307 () Bool)

(declare-fun e!773160 () Bool)

(assert (=> b!1363307 (= e!773159 e!773160)))

(declare-fun res!907140 () Bool)

(assert (=> b!1363307 (=> (not res!907140) (not e!773160))))

(assert (=> b!1363307 (= res!907140 (not (contains!9523 (t!46502 acc!759) (h!33019 acc!759))))))

(declare-fun b!1363308 () Bool)

(assert (=> b!1363308 (= e!773160 (noDuplicate!2380 (t!46502 acc!759)))))

(assert (= (and d!146105 (not res!907139)) b!1363307))

(assert (= (and b!1363307 res!907140) b!1363308))

(declare-fun m!1248143 () Bool)

(assert (=> b!1363307 m!1248143))

(declare-fun m!1248145 () Bool)

(assert (=> b!1363308 m!1248145))

(assert (=> b!1363246 d!146105))

(declare-fun d!146111 () Bool)

(declare-fun lt!600734 () Bool)

(declare-fun content!704 (List!31814) (Set (_ BitVec 64)))

(assert (=> d!146111 (= lt!600734 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!704 acc!759)))))

(declare-fun e!773173 () Bool)

(assert (=> d!146111 (= lt!600734 e!773173)))

(declare-fun res!907152 () Bool)

(assert (=> d!146111 (=> (not res!907152) (not e!773173))))

(assert (=> d!146111 (= res!907152 (is-Cons!31810 acc!759))))

(assert (=> d!146111 (= (contains!9523 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600734)))

(declare-fun b!1363323 () Bool)

(declare-fun e!773174 () Bool)

(assert (=> b!1363323 (= e!773173 e!773174)))

(declare-fun res!907151 () Bool)

(assert (=> b!1363323 (=> res!907151 e!773174)))

(assert (=> b!1363323 (= res!907151 (= (h!33019 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1363324 () Bool)

(assert (=> b!1363324 (= e!773174 (contains!9523 (t!46502 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146111 res!907152) b!1363323))

(assert (= (and b!1363323 (not res!907151)) b!1363324))

(declare-fun m!1248149 () Bool)

(assert (=> d!146111 m!1248149))

(declare-fun m!1248151 () Bool)

(assert (=> d!146111 m!1248151))

(declare-fun m!1248153 () Bool)

(assert (=> b!1363324 m!1248153))

(assert (=> b!1363248 d!146111))

(declare-fun b!1363331 () Bool)

(declare-fun e!773184 () Bool)

(declare-fun call!65408 () Bool)

(assert (=> b!1363331 (= e!773184 call!65408)))

(declare-fun b!1363332 () Bool)

(declare-fun e!773183 () Bool)

(assert (=> b!1363332 (= e!773183 e!773184)))

(declare-fun c!127526 () Bool)

(assert (=> b!1363332 (= c!127526 (validKeyInArray!0 (select (arr!44773 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1363333 () Bool)

(declare-fun e!773186 () Bool)

(assert (=> b!1363333 (= e!773186 (contains!9523 acc!759 (select (arr!44773 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1363334 () Bool)

(declare-fun e!773185 () Bool)

(assert (=> b!1363334 (= e!773185 e!773183)))

(declare-fun res!907163 () Bool)

(assert (=> b!1363334 (=> (not res!907163) (not e!773183))))

(assert (=> b!1363334 (= res!907163 (not e!773186))))

(declare-fun res!907161 () Bool)

(assert (=> b!1363334 (=> (not res!907161) (not e!773186))))

(assert (=> b!1363334 (= res!907161 (validKeyInArray!0 (select (arr!44773 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146115 () Bool)

(declare-fun res!907162 () Bool)

(assert (=> d!146115 (=> res!907162 e!773185)))

(assert (=> d!146115 (= res!907162 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45323 a!3742)))))

(assert (=> d!146115 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773185)))

(declare-fun bm!65405 () Bool)

(assert (=> bm!65405 (= call!65408 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127526 (Cons!31810 (select (arr!44773 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1363335 () Bool)

(assert (=> b!1363335 (= e!773184 call!65408)))

(assert (= (and d!146115 (not res!907162)) b!1363334))

(assert (= (and b!1363334 res!907161) b!1363333))

(assert (= (and b!1363334 res!907163) b!1363332))

(assert (= (and b!1363332 c!127526) b!1363335))

(assert (= (and b!1363332 (not c!127526)) b!1363331))

(assert (= (or b!1363335 b!1363331) bm!65405))

(declare-fun m!1248155 () Bool)

(assert (=> b!1363332 m!1248155))

(assert (=> b!1363332 m!1248155))

(declare-fun m!1248157 () Bool)

(assert (=> b!1363332 m!1248157))

(assert (=> b!1363333 m!1248155))

(assert (=> b!1363333 m!1248155))

(declare-fun m!1248161 () Bool)

(assert (=> b!1363333 m!1248161))

(assert (=> b!1363334 m!1248155))

(assert (=> b!1363334 m!1248155))

(assert (=> b!1363334 m!1248157))

(assert (=> bm!65405 m!1248155))

(declare-fun m!1248167 () Bool)

(assert (=> bm!65405 m!1248167))

(assert (=> b!1363243 d!146115))

(declare-fun d!146117 () Bool)

(assert (=> d!146117 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363242 d!146117))

(declare-fun b!1363354 () Bool)

(declare-fun e!773202 () Bool)

(declare-fun call!65411 () Bool)

(assert (=> b!1363354 (= e!773202 call!65411)))

(declare-fun b!1363355 () Bool)

(declare-fun e!773201 () Bool)

(assert (=> b!1363355 (= e!773201 e!773202)))

(declare-fun c!127529 () Bool)

(assert (=> b!1363355 (= c!127529 (validKeyInArray!0 (select (arr!44773 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1363356 () Bool)

(declare-fun e!773204 () Bool)

(assert (=> b!1363356 (= e!773204 (contains!9523 Nil!31811 (select (arr!44773 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1363357 () Bool)

(declare-fun e!773203 () Bool)

(assert (=> b!1363357 (= e!773203 e!773201)))

(declare-fun res!907178 () Bool)

(assert (=> b!1363357 (=> (not res!907178) (not e!773201))))

(assert (=> b!1363357 (= res!907178 (not e!773204))))

(declare-fun res!907176 () Bool)

(assert (=> b!1363357 (=> (not res!907176) (not e!773204))))

(assert (=> b!1363357 (= res!907176 (validKeyInArray!0 (select (arr!44773 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!146125 () Bool)

(declare-fun res!907177 () Bool)

(assert (=> d!146125 (=> res!907177 e!773203)))

(assert (=> d!146125 (= res!907177 (bvsge #b00000000000000000000000000000000 (size!45323 a!3742)))))

(assert (=> d!146125 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31811) e!773203)))

(declare-fun bm!65408 () Bool)

(assert (=> bm!65408 (= call!65411 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127529 (Cons!31810 (select (arr!44773 a!3742) #b00000000000000000000000000000000) Nil!31811) Nil!31811)))))

(declare-fun b!1363358 () Bool)

(assert (=> b!1363358 (= e!773202 call!65411)))

(assert (= (and d!146125 (not res!907177)) b!1363357))

(assert (= (and b!1363357 res!907176) b!1363356))

(assert (= (and b!1363357 res!907178) b!1363355))

(assert (= (and b!1363355 c!127529) b!1363358))

