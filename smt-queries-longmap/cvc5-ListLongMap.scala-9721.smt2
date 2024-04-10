; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114998 () Bool)

(assert start!114998)

(declare-fun b!1363169 () Bool)

(declare-fun res!907034 () Bool)

(declare-fun e!773084 () Bool)

(assert (=> b!1363169 (=> (not res!907034) (not e!773084))))

(declare-datatypes ((List!31812 0))(
  ( (Nil!31809) (Cons!31808 (h!33017 (_ BitVec 64)) (t!46500 List!31812)) )
))
(declare-fun acc!759 () List!31812)

(declare-datatypes ((array!92676 0))(
  ( (array!92677 (arr!44771 (Array (_ BitVec 32) (_ BitVec 64))) (size!45321 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92676)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92676 (_ BitVec 32) List!31812) Bool)

(assert (=> b!1363169 (= res!907034 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363170 () Bool)

(declare-datatypes ((Unit!44973 0))(
  ( (Unit!44974) )
))
(declare-fun e!773086 () Unit!44973)

(declare-fun Unit!44975 () Unit!44973)

(assert (=> b!1363170 (= e!773086 Unit!44975)))

(declare-fun b!1363171 () Bool)

(declare-fun res!907032 () Bool)

(assert (=> b!1363171 (=> (not res!907032) (not e!773084))))

(assert (=> b!1363171 (= res!907032 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45321 a!3742)))))

(declare-fun b!1363172 () Bool)

(declare-fun res!907030 () Bool)

(assert (=> b!1363172 (=> (not res!907030) (not e!773084))))

(declare-fun contains!9521 (List!31812 (_ BitVec 64)) Bool)

(assert (=> b!1363172 (= res!907030 (not (contains!9521 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!907028 () Bool)

(assert (=> start!114998 (=> (not res!907028) (not e!773084))))

(assert (=> start!114998 (= res!907028 (and (bvslt (size!45321 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45321 a!3742))))))

(assert (=> start!114998 e!773084))

(assert (=> start!114998 true))

(declare-fun array_inv!33799 (array!92676) Bool)

(assert (=> start!114998 (array_inv!33799 a!3742)))

(declare-fun b!1363173 () Bool)

(declare-fun res!907027 () Bool)

(assert (=> b!1363173 (=> (not res!907027) (not e!773084))))

(assert (=> b!1363173 (= res!907027 (not (contains!9521 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363174 () Bool)

(declare-fun res!907033 () Bool)

(assert (=> b!1363174 (=> (not res!907033) (not e!773084))))

(declare-fun noDuplicate!2378 (List!31812) Bool)

(assert (=> b!1363174 (= res!907033 (noDuplicate!2378 acc!759))))

(declare-fun b!1363175 () Bool)

(declare-fun res!907029 () Bool)

(assert (=> b!1363175 (=> (not res!907029) (not e!773084))))

(assert (=> b!1363175 (= res!907029 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31809))))

(declare-fun b!1363176 () Bool)

(declare-fun lt!600694 () Unit!44973)

(assert (=> b!1363176 (= e!773086 lt!600694)))

(declare-fun lt!600697 () Unit!44973)

(declare-fun lemmaListSubSeqRefl!0 (List!31812) Unit!44973)

(assert (=> b!1363176 (= lt!600697 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!923 (List!31812 List!31812) Bool)

(assert (=> b!1363176 (subseq!923 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92676 List!31812 List!31812 (_ BitVec 32)) Unit!44973)

(declare-fun $colon$colon!926 (List!31812 (_ BitVec 64)) List!31812)

(assert (=> b!1363176 (= lt!600694 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!926 acc!759 (select (arr!44771 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363176 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363177 () Bool)

(declare-fun e!773085 () Bool)

(assert (=> b!1363177 (= e!773084 e!773085)))

(declare-fun res!907036 () Bool)

(assert (=> b!1363177 (=> (not res!907036) (not e!773085))))

(declare-fun lt!600696 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363177 (= res!907036 (and (not (= from!3120 i!1404)) (not lt!600696) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600695 () Unit!44973)

(assert (=> b!1363177 (= lt!600695 e!773086)))

(declare-fun c!127511 () Bool)

(assert (=> b!1363177 (= c!127511 lt!600696)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363177 (= lt!600696 (validKeyInArray!0 (select (arr!44771 a!3742) from!3120)))))

(declare-fun b!1363178 () Bool)

(assert (=> b!1363178 (= e!773085 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))))

(declare-fun b!1363179 () Bool)

(declare-fun res!907031 () Bool)

(assert (=> b!1363179 (=> (not res!907031) (not e!773084))))

(assert (=> b!1363179 (= res!907031 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45321 a!3742))))))

(declare-fun b!1363180 () Bool)

(declare-fun res!907035 () Bool)

(assert (=> b!1363180 (=> (not res!907035) (not e!773084))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363180 (= res!907035 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114998 res!907028) b!1363174))

(assert (= (and b!1363174 res!907033) b!1363172))

(assert (= (and b!1363172 res!907030) b!1363173))

(assert (= (and b!1363173 res!907027) b!1363175))

(assert (= (and b!1363175 res!907029) b!1363169))

(assert (= (and b!1363169 res!907034) b!1363179))

(assert (= (and b!1363179 res!907031) b!1363180))

(assert (= (and b!1363180 res!907035) b!1363171))

(assert (= (and b!1363171 res!907032) b!1363177))

(assert (= (and b!1363177 c!127511) b!1363176))

(assert (= (and b!1363177 (not c!127511)) b!1363170))

(assert (= (and b!1363177 res!907036) b!1363178))

(declare-fun m!1248031 () Bool)

(assert (=> b!1363180 m!1248031))

(declare-fun m!1248033 () Bool)

(assert (=> b!1363178 m!1248033))

(declare-fun m!1248035 () Bool)

(assert (=> b!1363175 m!1248035))

(declare-fun m!1248037 () Bool)

(assert (=> b!1363172 m!1248037))

(declare-fun m!1248039 () Bool)

(assert (=> b!1363174 m!1248039))

(declare-fun m!1248041 () Bool)

(assert (=> start!114998 m!1248041))

(declare-fun m!1248043 () Bool)

(assert (=> b!1363176 m!1248043))

(declare-fun m!1248045 () Bool)

(assert (=> b!1363176 m!1248045))

(declare-fun m!1248047 () Bool)

(assert (=> b!1363176 m!1248047))

(declare-fun m!1248049 () Bool)

(assert (=> b!1363176 m!1248049))

(assert (=> b!1363176 m!1248033))

(assert (=> b!1363176 m!1248045))

(assert (=> b!1363176 m!1248047))

(declare-fun m!1248051 () Bool)

(assert (=> b!1363176 m!1248051))

(assert (=> b!1363177 m!1248045))

(assert (=> b!1363177 m!1248045))

(declare-fun m!1248053 () Bool)

(assert (=> b!1363177 m!1248053))

(declare-fun m!1248055 () Bool)

(assert (=> b!1363169 m!1248055))

(declare-fun m!1248057 () Bool)

(assert (=> b!1363173 m!1248057))

(push 1)

(assert (not b!1363180))

(assert (not b!1363173))

(assert (not b!1363174))

(assert (not b!1363177))

(assert (not b!1363175))

(assert (not b!1363178))

(assert (not start!114998))

(assert (not b!1363176))

(assert (not b!1363172))

(assert (not b!1363169))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146097 () Bool)

(declare-fun lt!600727 () Bool)

(declare-fun content!703 (List!31812) (Set (_ BitVec 64)))

(assert (=> d!146097 (= lt!600727 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!703 acc!759)))))

(declare-fun e!773144 () Bool)

(assert (=> d!146097 (= lt!600727 e!773144)))

(declare-fun res!907125 () Bool)

(assert (=> d!146097 (=> (not res!907125) (not e!773144))))

(assert (=> d!146097 (= res!907125 (is-Cons!31808 acc!759))))

(assert (=> d!146097 (= (contains!9521 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600727)))

(declare-fun b!1363289 () Bool)

(declare-fun e!773143 () Bool)

(assert (=> b!1363289 (= e!773144 e!773143)))

(declare-fun res!907126 () Bool)

(assert (=> b!1363289 (=> res!907126 e!773143)))

(assert (=> b!1363289 (= res!907126 (= (h!33017 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1363290 () Bool)

(assert (=> b!1363290 (= e!773143 (contains!9521 (t!46500 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146097 res!907125) b!1363289))

(assert (= (and b!1363289 (not res!907126)) b!1363290))

(declare-fun m!1248125 () Bool)

(assert (=> d!146097 m!1248125))

(declare-fun m!1248127 () Bool)

(assert (=> d!146097 m!1248127))

(declare-fun m!1248129 () Bool)

(assert (=> b!1363290 m!1248129))

(assert (=> b!1363172 d!146097))

(declare-fun d!146099 () Bool)

(assert (=> d!146099 (= (array_inv!33799 a!3742) (bvsge (size!45321 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114998 d!146099))

(declare-fun d!146101 () Bool)

(assert (=> d!146101 (= (validKeyInArray!0 (select (arr!44771 a!3742) from!3120)) (and (not (= (select (arr!44771 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44771 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363177 d!146101))

(declare-fun c!127527 () Bool)

(declare-fun call!65409 () Bool)

(declare-fun bm!65406 () Bool)

(assert (=> bm!65406 (= call!65409 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127527 (Cons!31808 (select (arr!44771 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1363338 () Bool)

(declare-fun e!773190 () Bool)

(assert (=> b!1363338 (= e!773190 call!65409)))

(declare-fun b!1363340 () Bool)

(declare-fun e!773189 () Bool)

(assert (=> b!1363340 (= e!773189 e!773190)))

(assert (=> b!1363340 (= c!127527 (validKeyInArray!0 (select (arr!44771 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1363341 () Bool)

(assert (=> b!1363341 (= e!773190 call!65409)))

(declare-fun b!1363342 () Bool)

(declare-fun e!773188 () Bool)

(assert (=> b!1363342 (= e!773188 (contains!9521 acc!759 (select (arr!44771 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146103 () Bool)

(declare-fun res!907164 () Bool)

(declare-fun e!773187 () Bool)

(assert (=> d!146103 (=> res!907164 e!773187)))

(assert (=> d!146103 (= res!907164 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45321 a!3742)))))

(assert (=> d!146103 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773187)))

(declare-fun b!1363339 () Bool)

(assert (=> b!1363339 (= e!773187 e!773189)))

(declare-fun res!907165 () Bool)

(assert (=> b!1363339 (=> (not res!907165) (not e!773189))))

(assert (=> b!1363339 (= res!907165 (not e!773188))))

(declare-fun res!907166 () Bool)

(assert (=> b!1363339 (=> (not res!907166) (not e!773188))))

(assert (=> b!1363339 (= res!907166 (validKeyInArray!0 (select (arr!44771 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146103 (not res!907164)) b!1363339))

(assert (= (and b!1363339 res!907166) b!1363342))

(assert (= (and b!1363339 res!907165) b!1363340))

(assert (= (and b!1363340 c!127527) b!1363338))

(assert (= (and b!1363340 (not c!127527)) b!1363341))

(assert (= (or b!1363338 b!1363341) bm!65406))

(declare-fun m!1248159 () Bool)

(assert (=> bm!65406 m!1248159))

(declare-fun m!1248163 () Bool)

(assert (=> bm!65406 m!1248163))

(assert (=> b!1363340 m!1248159))

(assert (=> b!1363340 m!1248159))

(declare-fun m!1248165 () Bool)

(assert (=> b!1363340 m!1248165))

(assert (=> b!1363342 m!1248159))

(assert (=> b!1363342 m!1248159))

(declare-fun m!1248169 () Bool)

(assert (=> b!1363342 m!1248169))

(assert (=> b!1363339 m!1248159))

(assert (=> b!1363339 m!1248159))

(assert (=> b!1363339 m!1248165))

(assert (=> b!1363178 d!146103))

(declare-fun d!146119 () Bool)

(declare-fun lt!600735 () Bool)

(assert (=> d!146119 (= lt!600735 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!703 acc!759)))))

(declare-fun e!773192 () Bool)

(assert (=> d!146119 (= lt!600735 e!773192)))

(declare-fun res!907167 () Bool)

(assert (=> d!146119 (=> (not res!907167) (not e!773192))))

(assert (=> d!146119 (= res!907167 (is-Cons!31808 acc!759))))

(assert (=> d!146119 (= (contains!9521 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600735)))

(declare-fun b!1363343 () Bool)

(declare-fun e!773191 () Bool)

(assert (=> b!1363343 (= e!773192 e!773191)))

(declare-fun res!907168 () Bool)

(assert (=> b!1363343 (=> res!907168 e!773191)))

(assert (=> b!1363343 (= res!907168 (= (h!33017 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1363344 () Bool)

(assert (=> b!1363344 (= e!773191 (contains!9521 (t!46500 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146119 res!907167) b!1363343))

(assert (= (and b!1363343 (not res!907168)) b!1363344))

(assert (=> d!146119 m!1248125))

(declare-fun m!1248171 () Bool)

(assert (=> d!146119 m!1248171))

(declare-fun m!1248173 () Bool)

(assert (=> b!1363344 m!1248173))

(assert (=> b!1363173 d!146119))

(declare-fun d!146121 () Bool)

(assert (=> d!146121 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363180 d!146121))

(declare-fun bm!65407 () Bool)

(declare-fun call!65410 () Bool)

(declare-fun c!127528 () Bool)

(assert (=> bm!65407 (= call!65410 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127528 (Cons!31808 (select (arr!44771 a!3742) #b00000000000000000000000000000000) Nil!31809) Nil!31809)))))

(declare-fun b!1363349 () Bool)

(declare-fun e!773200 () Bool)

(assert (=> b!1363349 (= e!773200 call!65410)))

(declare-fun b!1363351 () Bool)

(declare-fun e!773199 () Bool)

(assert (=> b!1363351 (= e!773199 e!773200)))

(assert (=> b!1363351 (= c!127528 (validKeyInArray!0 (select (arr!44771 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1363352 () Bool)

(assert (=> b!1363352 (= e!773200 call!65410)))

(declare-fun b!1363353 () Bool)

(declare-fun e!773198 () Bool)

(assert (=> b!1363353 (= e!773198 (contains!9521 Nil!31809 (select (arr!44771 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!146123 () Bool)

(declare-fun res!907173 () Bool)

(declare-fun e!773197 () Bool)

(assert (=> d!146123 (=> res!907173 e!773197)))

(assert (=> d!146123 (= res!907173 (bvsge #b00000000000000000000000000000000 (size!45321 a!3742)))))

(assert (=> d!146123 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31809) e!773197)))

(declare-fun b!1363350 () Bool)

(assert (=> b!1363350 (= e!773197 e!773199)))

(declare-fun res!907174 () Bool)

(assert (=> b!1363350 (=> (not res!907174) (not e!773199))))

(assert (=> b!1363350 (= res!907174 (not e!773198))))

(declare-fun res!907175 () Bool)

(assert (=> b!1363350 (=> (not res!907175) (not e!773198))))

(assert (=> b!1363350 (= res!907175 (validKeyInArray!0 (select (arr!44771 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!146123 (not res!907173)) b!1363350))

(assert (= (and b!1363350 res!907175) b!1363353))

(assert (= (and b!1363350 res!907174) b!1363351))

(assert (= (and b!1363351 c!127528) b!1363349))

(assert (= (and b!1363351 (not c!127528)) b!1363352))

(assert (= (or b!1363349 b!1363352) bm!65407))

(declare-fun m!1248179 () Bool)

(assert (=> bm!65407 m!1248179))

(declare-fun m!1248181 () Bool)

(assert (=> bm!65407 m!1248181))

(assert (=> b!1363351 m!1248179))

(assert (=> b!1363351 m!1248179))

(declare-fun m!1248183 () Bool)

(assert (=> b!1363351 m!1248183))

(assert (=> b!1363353 m!1248179))

(assert (=> b!1363353 m!1248179))

(declare-fun m!1248187 () Bool)

(assert (=> b!1363353 m!1248187))

(assert (=> b!1363350 m!1248179))

(assert (=> b!1363350 m!1248179))

(assert (=> b!1363350 m!1248183))

(assert (=> b!1363175 d!146123))

(declare-fun d!146129 () Bool)

(declare-fun res!907188 () Bool)

(declare-fun e!773215 () Bool)

(assert (=> d!146129 (=> res!907188 e!773215)))

(assert (=> d!146129 (= res!907188 (is-Nil!31809 acc!759))))

(assert (=> d!146129 (= (noDuplicate!2378 acc!759) e!773215)))

(declare-fun b!1363370 () Bool)

(declare-fun e!773216 () Bool)

(assert (=> b!1363370 (= e!773215 e!773216)))

(declare-fun res!907189 () Bool)

(assert (=> b!1363370 (=> (not res!907189) (not e!773216))))

(assert (=> b!1363370 (= res!907189 (not (contains!9521 (t!46500 acc!759) (h!33017 acc!759))))))

(declare-fun b!1363371 () Bool)

(assert (=> b!1363371 (= e!773216 (noDuplicate!2378 (t!46500 acc!759)))))

(assert (= (and d!146129 (not res!907188)) b!1363370))

(assert (= (and b!1363370 res!907189) b!1363371))

(declare-fun m!1248209 () Bool)

(assert (=> b!1363370 m!1248209))

(declare-fun m!1248211 () Bool)

(assert (=> b!1363371 m!1248211))

(assert (=> b!1363174 d!146129))

(declare-fun bm!65411 () Bool)

(declare-fun c!127532 () Bool)

(declare-fun call!65414 () Bool)

(assert (=> bm!65411 (= call!65414 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127532 (Cons!31808 (select (arr!44771 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1363377 () Bool)

(declare-fun e!773224 () Bool)

(assert (=> b!1363377 (= e!773224 call!65414)))

(declare-fun b!1363379 () Bool)

