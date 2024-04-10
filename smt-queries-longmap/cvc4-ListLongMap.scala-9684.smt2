; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114246 () Bool)

(assert start!114246)

(declare-fun b!1357266 () Bool)

(declare-fun res!902029 () Bool)

(declare-fun e!770288 () Bool)

(assert (=> b!1357266 (=> (not res!902029) (not e!770288))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357266 (= res!902029 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357267 () Bool)

(declare-fun res!902025 () Bool)

(assert (=> b!1357267 (=> (not res!902025) (not e!770288))))

(declare-datatypes ((List!31703 0))(
  ( (Nil!31700) (Cons!31699 (h!32908 (_ BitVec 64)) (t!46361 List!31703)) )
))
(declare-fun acc!759 () List!31703)

(declare-fun contains!9412 (List!31703 (_ BitVec 64)) Bool)

(assert (=> b!1357267 (= res!902025 (not (contains!9412 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357268 () Bool)

(declare-fun res!902027 () Bool)

(assert (=> b!1357268 (=> (not res!902027) (not e!770288))))

(assert (=> b!1357268 (= res!902027 (not (contains!9412 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357269 () Bool)

(declare-fun res!902026 () Bool)

(assert (=> b!1357269 (=> (not res!902026) (not e!770288))))

(declare-datatypes ((array!92428 0))(
  ( (array!92429 (arr!44662 (Array (_ BitVec 32) (_ BitVec 64))) (size!45212 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92428)

(declare-fun arrayNoDuplicates!0 (array!92428 (_ BitVec 32) List!31703) Bool)

(assert (=> b!1357269 (= res!902026 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31700))))

(declare-fun b!1357270 () Bool)

(declare-fun res!902023 () Bool)

(assert (=> b!1357270 (=> (not res!902023) (not e!770288))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357270 (= res!902023 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45212 a!3742))))))

(declare-fun b!1357271 () Bool)

(declare-fun res!902030 () Bool)

(assert (=> b!1357271 (=> (not res!902030) (not e!770288))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357271 (= res!902030 (validKeyInArray!0 (select (arr!44662 a!3742) from!3120)))))

(declare-fun b!1357272 () Bool)

(declare-fun e!770290 () Bool)

(declare-fun noDuplicate!2269 (List!31703) Bool)

(declare-fun $colon$colon!817 (List!31703 (_ BitVec 64)) List!31703)

(assert (=> b!1357272 (= e!770290 (noDuplicate!2269 ($colon$colon!817 acc!759 (select (arr!44662 a!3742) from!3120))))))

(declare-fun res!902032 () Bool)

(assert (=> start!114246 (=> (not res!902032) (not e!770288))))

(assert (=> start!114246 (= res!902032 (and (bvslt (size!45212 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45212 a!3742))))))

(assert (=> start!114246 e!770288))

(assert (=> start!114246 true))

(declare-fun array_inv!33690 (array!92428) Bool)

(assert (=> start!114246 (array_inv!33690 a!3742)))

(declare-fun b!1357273 () Bool)

(declare-fun res!902031 () Bool)

(assert (=> b!1357273 (=> (not res!902031) (not e!770288))))

(assert (=> b!1357273 (= res!902031 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357274 () Bool)

(declare-fun res!902024 () Bool)

(assert (=> b!1357274 (=> (not res!902024) (not e!770288))))

(assert (=> b!1357274 (= res!902024 (noDuplicate!2269 acc!759))))

(declare-fun b!1357275 () Bool)

(assert (=> b!1357275 (= e!770288 (not e!770290))))

(declare-fun res!902022 () Bool)

(assert (=> b!1357275 (=> res!902022 e!770290)))

(assert (=> b!1357275 (= res!902022 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun subseq!814 (List!31703 List!31703) Bool)

(assert (=> b!1357275 (subseq!814 acc!759 acc!759)))

(declare-datatypes ((Unit!44659 0))(
  ( (Unit!44660) )
))
(declare-fun lt!599134 () Unit!44659)

(declare-fun lemmaListSubSeqRefl!0 (List!31703) Unit!44659)

(assert (=> b!1357275 (= lt!599134 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357276 () Bool)

(declare-fun res!902028 () Bool)

(assert (=> b!1357276 (=> (not res!902028) (not e!770288))))

(assert (=> b!1357276 (= res!902028 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45212 a!3742)))))

(assert (= (and start!114246 res!902032) b!1357274))

(assert (= (and b!1357274 res!902024) b!1357268))

(assert (= (and b!1357268 res!902027) b!1357267))

(assert (= (and b!1357267 res!902025) b!1357269))

(assert (= (and b!1357269 res!902026) b!1357273))

(assert (= (and b!1357273 res!902031) b!1357270))

(assert (= (and b!1357270 res!902023) b!1357266))

(assert (= (and b!1357266 res!902029) b!1357276))

(assert (= (and b!1357276 res!902028) b!1357271))

(assert (= (and b!1357271 res!902030) b!1357275))

(assert (= (and b!1357275 (not res!902022)) b!1357272))

(declare-fun m!1243049 () Bool)

(assert (=> b!1357273 m!1243049))

(declare-fun m!1243051 () Bool)

(assert (=> b!1357268 m!1243051))

(declare-fun m!1243053 () Bool)

(assert (=> b!1357274 m!1243053))

(declare-fun m!1243055 () Bool)

(assert (=> b!1357269 m!1243055))

(declare-fun m!1243057 () Bool)

(assert (=> b!1357272 m!1243057))

(assert (=> b!1357272 m!1243057))

(declare-fun m!1243059 () Bool)

(assert (=> b!1357272 m!1243059))

(assert (=> b!1357272 m!1243059))

(declare-fun m!1243061 () Bool)

(assert (=> b!1357272 m!1243061))

(declare-fun m!1243063 () Bool)

(assert (=> start!114246 m!1243063))

(declare-fun m!1243065 () Bool)

(assert (=> b!1357266 m!1243065))

(declare-fun m!1243067 () Bool)

(assert (=> b!1357275 m!1243067))

(declare-fun m!1243069 () Bool)

(assert (=> b!1357275 m!1243069))

(declare-fun m!1243071 () Bool)

(assert (=> b!1357267 m!1243071))

(assert (=> b!1357271 m!1243057))

(assert (=> b!1357271 m!1243057))

(declare-fun m!1243073 () Bool)

(assert (=> b!1357271 m!1243073))

(push 1)

(assert (not b!1357273))

(assert (not b!1357274))

(assert (not b!1357268))

(assert (not start!114246))

(assert (not b!1357272))

(assert (not b!1357266))

(assert (not b!1357271))

(assert (not b!1357269))

(assert (not b!1357267))

(assert (not b!1357275))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145097 () Bool)

(declare-fun res!902064 () Bool)

(declare-fun e!770325 () Bool)

(assert (=> d!145097 (=> res!902064 e!770325)))

(assert (=> d!145097 (= res!902064 (is-Nil!31700 ($colon$colon!817 acc!759 (select (arr!44662 a!3742) from!3120))))))

(assert (=> d!145097 (= (noDuplicate!2269 ($colon$colon!817 acc!759 (select (arr!44662 a!3742) from!3120))) e!770325)))

(declare-fun b!1357312 () Bool)

(declare-fun e!770326 () Bool)

(assert (=> b!1357312 (= e!770325 e!770326)))

(declare-fun res!902065 () Bool)

(assert (=> b!1357312 (=> (not res!902065) (not e!770326))))

(assert (=> b!1357312 (= res!902065 (not (contains!9412 (t!46361 ($colon$colon!817 acc!759 (select (arr!44662 a!3742) from!3120))) (h!32908 ($colon$colon!817 acc!759 (select (arr!44662 a!3742) from!3120))))))))

(declare-fun b!1357313 () Bool)

(assert (=> b!1357313 (= e!770326 (noDuplicate!2269 (t!46361 ($colon$colon!817 acc!759 (select (arr!44662 a!3742) from!3120)))))))

(assert (= (and d!145097 (not res!902064)) b!1357312))

(assert (= (and b!1357312 res!902065) b!1357313))

(declare-fun m!1243083 () Bool)

(assert (=> b!1357312 m!1243083))

(declare-fun m!1243085 () Bool)

(assert (=> b!1357313 m!1243085))

(assert (=> b!1357272 d!145097))

(declare-fun d!145101 () Bool)

(assert (=> d!145101 (= ($colon$colon!817 acc!759 (select (arr!44662 a!3742) from!3120)) (Cons!31699 (select (arr!44662 a!3742) from!3120) acc!759))))

(assert (=> b!1357272 d!145101))

(declare-fun d!145103 () Bool)

(assert (=> d!145103 (= (validKeyInArray!0 (select (arr!44662 a!3742) from!3120)) (and (not (= (select (arr!44662 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44662 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357271 d!145103))

(declare-fun d!145109 () Bool)

(assert (=> d!145109 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357266 d!145109))

(declare-fun b!1357347 () Bool)

(declare-fun e!770358 () Bool)

(assert (=> b!1357347 (= e!770358 (subseq!814 (t!46361 acc!759) (t!46361 acc!759)))))

(declare-fun d!145111 () Bool)

(declare-fun res!902093 () Bool)

(declare-fun e!770357 () Bool)

(assert (=> d!145111 (=> res!902093 e!770357)))

(assert (=> d!145111 (= res!902093 (is-Nil!31700 acc!759))))

(assert (=> d!145111 (= (subseq!814 acc!759 acc!759) e!770357)))

(declare-fun b!1357348 () Bool)

(declare-fun e!770355 () Bool)

(assert (=> b!1357348 (= e!770355 (subseq!814 acc!759 (t!46361 acc!759)))))

(declare-fun b!1357345 () Bool)

(declare-fun e!770356 () Bool)

(assert (=> b!1357345 (= e!770357 e!770356)))

(declare-fun res!902095 () Bool)

(assert (=> b!1357345 (=> (not res!902095) (not e!770356))))

(assert (=> b!1357345 (= res!902095 (is-Cons!31699 acc!759))))

(declare-fun b!1357346 () Bool)

(assert (=> b!1357346 (= e!770356 e!770355)))

(declare-fun res!902096 () Bool)

(assert (=> b!1357346 (=> res!902096 e!770355)))

(assert (=> b!1357346 (= res!902096 e!770358)))

(declare-fun res!902094 () Bool)

(assert (=> b!1357346 (=> (not res!902094) (not e!770358))))

(assert (=> b!1357346 (= res!902094 (= (h!32908 acc!759) (h!32908 acc!759)))))

(assert (= (and d!145111 (not res!902093)) b!1357345))

(assert (= (and b!1357345 res!902095) b!1357346))

(assert (= (and b!1357346 res!902094) b!1357347))

(assert (= (and b!1357346 (not res!902096)) b!1357348))

(declare-fun m!1243119 () Bool)

(assert (=> b!1357347 m!1243119))

(declare-fun m!1243121 () Bool)

(assert (=> b!1357348 m!1243121))

(assert (=> b!1357275 d!145111))

(declare-fun d!145127 () Bool)

(assert (=> d!145127 (subseq!814 acc!759 acc!759)))

(declare-fun lt!599147 () Unit!44659)

(declare-fun choose!36 (List!31703) Unit!44659)

(assert (=> d!145127 (= lt!599147 (choose!36 acc!759))))

(assert (=> d!145127 (= (lemmaListSubSeqRefl!0 acc!759) lt!599147)))

(declare-fun bs!38929 () Bool)

(assert (= bs!38929 d!145127))

(assert (=> bs!38929 m!1243067))

(declare-fun m!1243127 () Bool)

(assert (=> bs!38929 m!1243127))

(assert (=> b!1357275 d!145127))

(declare-fun d!145129 () Bool)

(declare-fun res!902125 () Bool)

(declare-fun e!770395 () Bool)

(assert (=> d!145129 (=> res!902125 e!770395)))

(assert (=> d!145129 (= res!902125 (bvsge #b00000000000000000000000000000000 (size!45212 a!3742)))))

(assert (=> d!145129 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31700) e!770395)))

(declare-fun b!1357389 () Bool)

(declare-fun e!770393 () Bool)

(assert (=> b!1357389 (= e!770393 (contains!9412 Nil!31700 (select (arr!44662 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65248 () Bool)

(declare-fun call!65251 () Bool)

(declare-fun c!127072 () Bool)

(assert (=> bm!65248 (= call!65251 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127072 (Cons!31699 (select (arr!44662 a!3742) #b00000000000000000000000000000000) Nil!31700) Nil!31700)))))

(declare-fun b!1357390 () Bool)

(declare-fun e!770394 () Bool)

(assert (=> b!1357390 (= e!770395 e!770394)))

(declare-fun res!902126 () Bool)

(assert (=> b!1357390 (=> (not res!902126) (not e!770394))))

(assert (=> b!1357390 (= res!902126 (not e!770393))))

(declare-fun res!902127 () Bool)

(assert (=> b!1357390 (=> (not res!902127) (not e!770393))))

(assert (=> b!1357390 (= res!902127 (validKeyInArray!0 (select (arr!44662 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357391 () Bool)

(declare-fun e!770396 () Bool)

(assert (=> b!1357391 (= e!770396 call!65251)))

(declare-fun b!1357392 () Bool)

(assert (=> b!1357392 (= e!770396 call!65251)))

(declare-fun b!1357393 () Bool)

(assert (=> b!1357393 (= e!770394 e!770396)))

(assert (=> b!1357393 (= c!127072 (validKeyInArray!0 (select (arr!44662 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145129 (not res!902125)) b!1357390))

(assert (= (and b!1357390 res!902127) b!1357389))

(assert (= (and b!1357390 res!902126) b!1357393))

(assert (= (and b!1357393 c!127072) b!1357391))

(assert (= (and b!1357393 (not c!127072)) b!1357392))

(assert (= (or b!1357391 b!1357392) bm!65248))

(declare-fun m!1243145 () Bool)

(assert (=> b!1357389 m!1243145))

(assert (=> b!1357389 m!1243145))

(declare-fun m!1243149 () Bool)

(assert (=> b!1357389 m!1243149))

(assert (=> bm!65248 m!1243145))

(declare-fun m!1243153 () Bool)

(assert (=> bm!65248 m!1243153))

(assert (=> b!1357390 m!1243145))

