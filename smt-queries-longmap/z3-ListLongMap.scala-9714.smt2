; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114898 () Bool)

(assert start!114898)

(declare-fun b!1362258 () Bool)

(declare-fun res!906293 () Bool)

(declare-fun e!772694 () Bool)

(assert (=> b!1362258 (=> (not res!906293) (not e!772694))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92633 0))(
  ( (array!92634 (arr!44751 (Array (_ BitVec 32) (_ BitVec 64))) (size!45301 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92633)

(assert (=> b!1362258 (= res!906293 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45301 a!3742)))))

(declare-fun b!1362260 () Bool)

(declare-datatypes ((Unit!44913 0))(
  ( (Unit!44914) )
))
(declare-fun e!772695 () Unit!44913)

(declare-fun lt!600444 () Unit!44913)

(assert (=> b!1362260 (= e!772695 lt!600444)))

(declare-fun lt!600446 () Unit!44913)

(declare-datatypes ((List!31792 0))(
  ( (Nil!31789) (Cons!31788 (h!32997 (_ BitVec 64)) (t!46477 List!31792)) )
))
(declare-fun acc!759 () List!31792)

(declare-fun lemmaListSubSeqRefl!0 (List!31792) Unit!44913)

(assert (=> b!1362260 (= lt!600446 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!903 (List!31792 List!31792) Bool)

(assert (=> b!1362260 (subseq!903 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92633 List!31792 List!31792 (_ BitVec 32)) Unit!44913)

(declare-fun $colon$colon!906 (List!31792 (_ BitVec 64)) List!31792)

(assert (=> b!1362260 (= lt!600444 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!906 acc!759 (select (arr!44751 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92633 (_ BitVec 32) List!31792) Bool)

(assert (=> b!1362260 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362261 () Bool)

(declare-fun res!906297 () Bool)

(assert (=> b!1362261 (=> (not res!906297) (not e!772694))))

(assert (=> b!1362261 (= res!906297 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362262 () Bool)

(declare-fun Unit!44915 () Unit!44913)

(assert (=> b!1362262 (= e!772695 Unit!44915)))

(declare-fun b!1362263 () Bool)

(declare-fun e!772692 () Bool)

(assert (=> b!1362263 (= e!772694 e!772692)))

(declare-fun res!906288 () Bool)

(assert (=> b!1362263 (=> (not res!906288) (not e!772692))))

(declare-fun lt!600448 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362263 (= res!906288 (and (not (= from!3120 i!1404)) lt!600448))))

(declare-fun lt!600447 () Unit!44913)

(assert (=> b!1362263 (= lt!600447 e!772695)))

(declare-fun c!127427 () Bool)

(assert (=> b!1362263 (= c!127427 lt!600448)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362263 (= lt!600448 (validKeyInArray!0 (select (arr!44751 a!3742) from!3120)))))

(declare-fun b!1362264 () Bool)

(declare-fun res!906287 () Bool)

(declare-fun e!772693 () Bool)

(assert (=> b!1362264 (=> (not res!906287) (not e!772693))))

(declare-fun lt!600445 () List!31792)

(declare-fun noDuplicate!2358 (List!31792) Bool)

(assert (=> b!1362264 (= res!906287 (noDuplicate!2358 lt!600445))))

(declare-fun b!1362265 () Bool)

(declare-fun res!906294 () Bool)

(assert (=> b!1362265 (=> (not res!906294) (not e!772693))))

(declare-fun contains!9501 (List!31792 (_ BitVec 64)) Bool)

(assert (=> b!1362265 (= res!906294 (not (contains!9501 lt!600445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362266 () Bool)

(declare-fun res!906296 () Bool)

(assert (=> b!1362266 (=> (not res!906296) (not e!772694))))

(assert (=> b!1362266 (= res!906296 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45301 a!3742))))))

(declare-fun b!1362267 () Bool)

(declare-fun res!906284 () Bool)

(assert (=> b!1362267 (=> (not res!906284) (not e!772694))))

(assert (=> b!1362267 (= res!906284 (not (contains!9501 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362268 () Bool)

(declare-fun res!906295 () Bool)

(assert (=> b!1362268 (=> (not res!906295) (not e!772694))))

(assert (=> b!1362268 (= res!906295 (not (contains!9501 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362269 () Bool)

(declare-fun res!906289 () Bool)

(assert (=> b!1362269 (=> (not res!906289) (not e!772694))))

(assert (=> b!1362269 (= res!906289 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31789))))

(declare-fun b!1362270 () Bool)

(declare-fun res!906291 () Bool)

(assert (=> b!1362270 (=> (not res!906291) (not e!772693))))

(assert (=> b!1362270 (= res!906291 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600445))))

(declare-fun b!1362271 () Bool)

(declare-fun res!906290 () Bool)

(assert (=> b!1362271 (=> (not res!906290) (not e!772693))))

(assert (=> b!1362271 (= res!906290 (not (contains!9501 lt!600445 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362272 () Bool)

(assert (=> b!1362272 (= e!772692 e!772693)))

(declare-fun res!906292 () Bool)

(assert (=> b!1362272 (=> (not res!906292) (not e!772693))))

(assert (=> b!1362272 (= res!906292 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1362272 (= lt!600445 ($colon$colon!906 acc!759 (select (arr!44751 a!3742) from!3120)))))

(declare-fun res!906286 () Bool)

(assert (=> start!114898 (=> (not res!906286) (not e!772694))))

(assert (=> start!114898 (= res!906286 (and (bvslt (size!45301 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45301 a!3742))))))

(assert (=> start!114898 e!772694))

(assert (=> start!114898 true))

(declare-fun array_inv!33779 (array!92633) Bool)

(assert (=> start!114898 (array_inv!33779 a!3742)))

(declare-fun b!1362259 () Bool)

(declare-fun res!906298 () Bool)

(assert (=> b!1362259 (=> (not res!906298) (not e!772694))))

(assert (=> b!1362259 (= res!906298 (noDuplicate!2358 acc!759))))

(declare-fun lt!600442 () array!92633)

(declare-fun b!1362273 () Bool)

(assert (=> b!1362273 (= e!772693 (not (arrayNoDuplicates!0 lt!600442 from!3120 acc!759)))))

(assert (=> b!1362273 (arrayNoDuplicates!0 lt!600442 (bvadd #b00000000000000000000000000000001 from!3120) lt!600445)))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362273 (= lt!600442 (array!92634 (store (arr!44751 a!3742) i!1404 l!3587) (size!45301 a!3742)))))

(declare-fun lt!600443 () Unit!44913)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92633 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31792) Unit!44913)

(assert (=> b!1362273 (= lt!600443 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600445))))

(declare-fun b!1362274 () Bool)

(declare-fun res!906285 () Bool)

(assert (=> b!1362274 (=> (not res!906285) (not e!772694))))

(assert (=> b!1362274 (= res!906285 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114898 res!906286) b!1362259))

(assert (= (and b!1362259 res!906298) b!1362267))

(assert (= (and b!1362267 res!906284) b!1362268))

(assert (= (and b!1362268 res!906295) b!1362269))

(assert (= (and b!1362269 res!906289) b!1362261))

(assert (= (and b!1362261 res!906297) b!1362266))

(assert (= (and b!1362266 res!906296) b!1362274))

(assert (= (and b!1362274 res!906285) b!1362258))

(assert (= (and b!1362258 res!906293) b!1362263))

(assert (= (and b!1362263 c!127427) b!1362260))

(assert (= (and b!1362263 (not c!127427)) b!1362262))

(assert (= (and b!1362263 res!906288) b!1362272))

(assert (= (and b!1362272 res!906292) b!1362264))

(assert (= (and b!1362264 res!906287) b!1362265))

(assert (= (and b!1362265 res!906294) b!1362271))

(assert (= (and b!1362271 res!906290) b!1362270))

(assert (= (and b!1362270 res!906291) b!1362273))

(declare-fun m!1247199 () Bool)

(assert (=> b!1362269 m!1247199))

(declare-fun m!1247201 () Bool)

(assert (=> b!1362274 m!1247201))

(declare-fun m!1247203 () Bool)

(assert (=> b!1362261 m!1247203))

(declare-fun m!1247205 () Bool)

(assert (=> b!1362260 m!1247205))

(declare-fun m!1247207 () Bool)

(assert (=> b!1362260 m!1247207))

(declare-fun m!1247209 () Bool)

(assert (=> b!1362260 m!1247209))

(declare-fun m!1247211 () Bool)

(assert (=> b!1362260 m!1247211))

(declare-fun m!1247213 () Bool)

(assert (=> b!1362260 m!1247213))

(assert (=> b!1362260 m!1247207))

(assert (=> b!1362260 m!1247209))

(declare-fun m!1247215 () Bool)

(assert (=> b!1362260 m!1247215))

(declare-fun m!1247217 () Bool)

(assert (=> b!1362273 m!1247217))

(declare-fun m!1247219 () Bool)

(assert (=> b!1362273 m!1247219))

(declare-fun m!1247221 () Bool)

(assert (=> b!1362273 m!1247221))

(declare-fun m!1247223 () Bool)

(assert (=> b!1362273 m!1247223))

(declare-fun m!1247225 () Bool)

(assert (=> b!1362265 m!1247225))

(declare-fun m!1247227 () Bool)

(assert (=> b!1362270 m!1247227))

(assert (=> b!1362272 m!1247207))

(assert (=> b!1362272 m!1247207))

(assert (=> b!1362272 m!1247209))

(declare-fun m!1247229 () Bool)

(assert (=> b!1362271 m!1247229))

(declare-fun m!1247231 () Bool)

(assert (=> start!114898 m!1247231))

(declare-fun m!1247233 () Bool)

(assert (=> b!1362259 m!1247233))

(declare-fun m!1247235 () Bool)

(assert (=> b!1362267 m!1247235))

(declare-fun m!1247237 () Bool)

(assert (=> b!1362268 m!1247237))

(assert (=> b!1362263 m!1247207))

(assert (=> b!1362263 m!1247207))

(declare-fun m!1247239 () Bool)

(assert (=> b!1362263 m!1247239))

(declare-fun m!1247241 () Bool)

(assert (=> b!1362264 m!1247241))

(check-sat (not b!1362263) (not b!1362272) (not b!1362274) (not b!1362271) (not b!1362264) (not start!114898) (not b!1362259) (not b!1362269) (not b!1362273) (not b!1362260) (not b!1362270) (not b!1362265) (not b!1362261) (not b!1362268) (not b!1362267))
(check-sat)
(get-model)

(declare-fun d!145951 () Bool)

(declare-fun res!906348 () Bool)

(declare-fun e!772716 () Bool)

(assert (=> d!145951 (=> res!906348 e!772716)))

(get-info :version)

(assert (=> d!145951 (= res!906348 ((_ is Nil!31789) lt!600445))))

(assert (=> d!145951 (= (noDuplicate!2358 lt!600445) e!772716)))

(declare-fun b!1362330 () Bool)

(declare-fun e!772717 () Bool)

(assert (=> b!1362330 (= e!772716 e!772717)))

(declare-fun res!906349 () Bool)

(assert (=> b!1362330 (=> (not res!906349) (not e!772717))))

(assert (=> b!1362330 (= res!906349 (not (contains!9501 (t!46477 lt!600445) (h!32997 lt!600445))))))

(declare-fun b!1362331 () Bool)

(assert (=> b!1362331 (= e!772717 (noDuplicate!2358 (t!46477 lt!600445)))))

(assert (= (and d!145951 (not res!906348)) b!1362330))

(assert (= (and b!1362330 res!906349) b!1362331))

(declare-fun m!1247287 () Bool)

(assert (=> b!1362330 m!1247287))

(declare-fun m!1247289 () Bool)

(assert (=> b!1362331 m!1247289))

(assert (=> b!1362264 d!145951))

(declare-fun d!145953 () Bool)

(assert (=> d!145953 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1362274 d!145953))

(declare-fun d!145955 () Bool)

(assert (=> d!145955 (= (validKeyInArray!0 (select (arr!44751 a!3742) from!3120)) (and (not (= (select (arr!44751 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44751 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1362263 d!145955))

(declare-fun b!1362342 () Bool)

(declare-fun e!772727 () Bool)

(declare-fun call!65378 () Bool)

(assert (=> b!1362342 (= e!772727 call!65378)))

(declare-fun e!772726 () Bool)

(declare-fun b!1362343 () Bool)

(assert (=> b!1362343 (= e!772726 (contains!9501 acc!759 (select (arr!44751 lt!600442) from!3120)))))

(declare-fun d!145957 () Bool)

(declare-fun res!906357 () Bool)

(declare-fun e!772729 () Bool)

(assert (=> d!145957 (=> res!906357 e!772729)))

(assert (=> d!145957 (= res!906357 (bvsge from!3120 (size!45301 lt!600442)))))

(assert (=> d!145957 (= (arrayNoDuplicates!0 lt!600442 from!3120 acc!759) e!772729)))

(declare-fun b!1362344 () Bool)

(assert (=> b!1362344 (= e!772727 call!65378)))

(declare-fun b!1362345 () Bool)

(declare-fun e!772728 () Bool)

(assert (=> b!1362345 (= e!772729 e!772728)))

(declare-fun res!906358 () Bool)

(assert (=> b!1362345 (=> (not res!906358) (not e!772728))))

(assert (=> b!1362345 (= res!906358 (not e!772726))))

(declare-fun res!906356 () Bool)

(assert (=> b!1362345 (=> (not res!906356) (not e!772726))))

(assert (=> b!1362345 (= res!906356 (validKeyInArray!0 (select (arr!44751 lt!600442) from!3120)))))

(declare-fun bm!65375 () Bool)

(declare-fun c!127433 () Bool)

(assert (=> bm!65375 (= call!65378 (arrayNoDuplicates!0 lt!600442 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127433 (Cons!31788 (select (arr!44751 lt!600442) from!3120) acc!759) acc!759)))))

(declare-fun b!1362346 () Bool)

(assert (=> b!1362346 (= e!772728 e!772727)))

(assert (=> b!1362346 (= c!127433 (validKeyInArray!0 (select (arr!44751 lt!600442) from!3120)))))

(assert (= (and d!145957 (not res!906357)) b!1362345))

(assert (= (and b!1362345 res!906356) b!1362343))

(assert (= (and b!1362345 res!906358) b!1362346))

(assert (= (and b!1362346 c!127433) b!1362344))

(assert (= (and b!1362346 (not c!127433)) b!1362342))

(assert (= (or b!1362344 b!1362342) bm!65375))

(declare-fun m!1247291 () Bool)

(assert (=> b!1362343 m!1247291))

(assert (=> b!1362343 m!1247291))

(declare-fun m!1247293 () Bool)

(assert (=> b!1362343 m!1247293))

(assert (=> b!1362345 m!1247291))

(assert (=> b!1362345 m!1247291))

(declare-fun m!1247295 () Bool)

(assert (=> b!1362345 m!1247295))

(assert (=> bm!65375 m!1247291))

(declare-fun m!1247297 () Bool)

(assert (=> bm!65375 m!1247297))

(assert (=> b!1362346 m!1247291))

(assert (=> b!1362346 m!1247291))

(assert (=> b!1362346 m!1247295))

(assert (=> b!1362273 d!145957))

(declare-fun b!1362347 () Bool)

(declare-fun e!772731 () Bool)

(declare-fun call!65379 () Bool)

(assert (=> b!1362347 (= e!772731 call!65379)))

(declare-fun e!772730 () Bool)

(declare-fun b!1362348 () Bool)

(assert (=> b!1362348 (= e!772730 (contains!9501 lt!600445 (select (arr!44751 lt!600442) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145959 () Bool)

(declare-fun res!906360 () Bool)

(declare-fun e!772733 () Bool)

(assert (=> d!145959 (=> res!906360 e!772733)))

(assert (=> d!145959 (= res!906360 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45301 lt!600442)))))

(assert (=> d!145959 (= (arrayNoDuplicates!0 lt!600442 (bvadd #b00000000000000000000000000000001 from!3120) lt!600445) e!772733)))

(declare-fun b!1362349 () Bool)

(assert (=> b!1362349 (= e!772731 call!65379)))

(declare-fun b!1362350 () Bool)

(declare-fun e!772732 () Bool)

(assert (=> b!1362350 (= e!772733 e!772732)))

(declare-fun res!906361 () Bool)

(assert (=> b!1362350 (=> (not res!906361) (not e!772732))))

(assert (=> b!1362350 (= res!906361 (not e!772730))))

(declare-fun res!906359 () Bool)

(assert (=> b!1362350 (=> (not res!906359) (not e!772730))))

(assert (=> b!1362350 (= res!906359 (validKeyInArray!0 (select (arr!44751 lt!600442) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65376 () Bool)

(declare-fun c!127434 () Bool)

(assert (=> bm!65376 (= call!65379 (arrayNoDuplicates!0 lt!600442 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127434 (Cons!31788 (select (arr!44751 lt!600442) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600445) lt!600445)))))

(declare-fun b!1362351 () Bool)

(assert (=> b!1362351 (= e!772732 e!772731)))

(assert (=> b!1362351 (= c!127434 (validKeyInArray!0 (select (arr!44751 lt!600442) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145959 (not res!906360)) b!1362350))

(assert (= (and b!1362350 res!906359) b!1362348))

(assert (= (and b!1362350 res!906361) b!1362351))

(assert (= (and b!1362351 c!127434) b!1362349))

(assert (= (and b!1362351 (not c!127434)) b!1362347))

(assert (= (or b!1362349 b!1362347) bm!65376))

(declare-fun m!1247299 () Bool)

(assert (=> b!1362348 m!1247299))

(assert (=> b!1362348 m!1247299))

(declare-fun m!1247301 () Bool)

(assert (=> b!1362348 m!1247301))

(assert (=> b!1362350 m!1247299))

(assert (=> b!1362350 m!1247299))

(declare-fun m!1247303 () Bool)

(assert (=> b!1362350 m!1247303))

(assert (=> bm!65376 m!1247299))

(declare-fun m!1247305 () Bool)

(assert (=> bm!65376 m!1247305))

(assert (=> b!1362351 m!1247299))

(assert (=> b!1362351 m!1247299))

(assert (=> b!1362351 m!1247303))

(assert (=> b!1362273 d!145959))

(declare-fun d!145963 () Bool)

(declare-fun e!772754 () Bool)

(assert (=> d!145963 e!772754))

(declare-fun res!906379 () Bool)

(assert (=> d!145963 (=> (not res!906379) (not e!772754))))

(assert (=> d!145963 (= res!906379 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45301 a!3742))))))

(declare-fun lt!600472 () Unit!44913)

(declare-fun choose!53 (array!92633 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31792) Unit!44913)

(assert (=> d!145963 (= lt!600472 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600445))))

(assert (=> d!145963 (bvslt (size!45301 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145963 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600445) lt!600472)))

(declare-fun b!1362375 () Bool)

(assert (=> b!1362375 (= e!772754 (arrayNoDuplicates!0 (array!92634 (store (arr!44751 a!3742) i!1404 l!3587) (size!45301 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!600445))))

(assert (= (and d!145963 res!906379) b!1362375))

(declare-fun m!1247317 () Bool)

(assert (=> d!145963 m!1247317))

(assert (=> b!1362375 m!1247221))

(declare-fun m!1247321 () Bool)

(assert (=> b!1362375 m!1247321))

(assert (=> b!1362273 d!145963))

(declare-fun d!145969 () Bool)

(assert (=> d!145969 (= ($colon$colon!906 acc!759 (select (arr!44751 a!3742) from!3120)) (Cons!31788 (select (arr!44751 a!3742) from!3120) acc!759))))

(assert (=> b!1362272 d!145969))

(declare-fun b!1362376 () Bool)

(declare-fun e!772756 () Bool)

(declare-fun call!65383 () Bool)

(assert (=> b!1362376 (= e!772756 call!65383)))

(declare-fun b!1362377 () Bool)

(declare-fun e!772755 () Bool)

(assert (=> b!1362377 (= e!772755 (contains!9501 acc!759 (select (arr!44751 a!3742) from!3120)))))

(declare-fun d!145971 () Bool)

(declare-fun res!906381 () Bool)

(declare-fun e!772758 () Bool)

(assert (=> d!145971 (=> res!906381 e!772758)))

(assert (=> d!145971 (= res!906381 (bvsge from!3120 (size!45301 a!3742)))))

(assert (=> d!145971 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772758)))

(declare-fun b!1362378 () Bool)

(assert (=> b!1362378 (= e!772756 call!65383)))

(declare-fun b!1362379 () Bool)

(declare-fun e!772757 () Bool)

(assert (=> b!1362379 (= e!772758 e!772757)))

(declare-fun res!906382 () Bool)

(assert (=> b!1362379 (=> (not res!906382) (not e!772757))))

(assert (=> b!1362379 (= res!906382 (not e!772755))))

(declare-fun res!906380 () Bool)

(assert (=> b!1362379 (=> (not res!906380) (not e!772755))))

(assert (=> b!1362379 (= res!906380 (validKeyInArray!0 (select (arr!44751 a!3742) from!3120)))))

(declare-fun bm!65380 () Bool)

(declare-fun c!127438 () Bool)

(assert (=> bm!65380 (= call!65383 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127438 (Cons!31788 (select (arr!44751 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1362380 () Bool)

(assert (=> b!1362380 (= e!772757 e!772756)))

(assert (=> b!1362380 (= c!127438 (validKeyInArray!0 (select (arr!44751 a!3742) from!3120)))))

(assert (= (and d!145971 (not res!906381)) b!1362379))

(assert (= (and b!1362379 res!906380) b!1362377))

(assert (= (and b!1362379 res!906382) b!1362380))

(assert (= (and b!1362380 c!127438) b!1362378))

(assert (= (and b!1362380 (not c!127438)) b!1362376))

(assert (= (or b!1362378 b!1362376) bm!65380))

(assert (=> b!1362377 m!1247207))

(assert (=> b!1362377 m!1247207))

(declare-fun m!1247323 () Bool)

(assert (=> b!1362377 m!1247323))

(assert (=> b!1362379 m!1247207))

(assert (=> b!1362379 m!1247207))

(assert (=> b!1362379 m!1247239))

(assert (=> bm!65380 m!1247207))

(declare-fun m!1247325 () Bool)

(assert (=> bm!65380 m!1247325))

(assert (=> b!1362380 m!1247207))

(assert (=> b!1362380 m!1247207))

(assert (=> b!1362380 m!1247239))

(assert (=> b!1362261 d!145971))

(declare-fun d!145973 () Bool)

(declare-fun lt!600481 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!701 (List!31792) (InoxSet (_ BitVec 64)))

(assert (=> d!145973 (= lt!600481 (select (content!701 lt!600445) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772769 () Bool)

(assert (=> d!145973 (= lt!600481 e!772769)))

(declare-fun res!906393 () Bool)

(assert (=> d!145973 (=> (not res!906393) (not e!772769))))

(assert (=> d!145973 (= res!906393 ((_ is Cons!31788) lt!600445))))

(assert (=> d!145973 (= (contains!9501 lt!600445 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600481)))

(declare-fun b!1362391 () Bool)

(declare-fun e!772770 () Bool)

(assert (=> b!1362391 (= e!772769 e!772770)))

(declare-fun res!906394 () Bool)

(assert (=> b!1362391 (=> res!906394 e!772770)))

(assert (=> b!1362391 (= res!906394 (= (h!32997 lt!600445) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362392 () Bool)

(assert (=> b!1362392 (= e!772770 (contains!9501 (t!46477 lt!600445) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145973 res!906393) b!1362391))

(assert (= (and b!1362391 (not res!906394)) b!1362392))

(declare-fun m!1247335 () Bool)

(assert (=> d!145973 m!1247335))

(declare-fun m!1247337 () Bool)

(assert (=> d!145973 m!1247337))

(declare-fun m!1247339 () Bool)

(assert (=> b!1362392 m!1247339))

(assert (=> b!1362271 d!145973))

(declare-fun d!145979 () Bool)

(assert (=> d!145979 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600484 () Unit!44913)

(declare-fun choose!80 (array!92633 List!31792 List!31792 (_ BitVec 32)) Unit!44913)

(assert (=> d!145979 (= lt!600484 (choose!80 a!3742 ($colon$colon!906 acc!759 (select (arr!44751 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145979 (bvslt (size!45301 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145979 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!906 acc!759 (select (arr!44751 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600484)))

(declare-fun bs!39061 () Bool)

(assert (= bs!39061 d!145979))

(assert (=> bs!39061 m!1247213))

(assert (=> bs!39061 m!1247209))

(declare-fun m!1247341 () Bool)

(assert (=> bs!39061 m!1247341))

(assert (=> b!1362260 d!145979))

(declare-fun b!1362431 () Bool)

(declare-fun e!772806 () Bool)

(assert (=> b!1362431 (= e!772806 (subseq!903 acc!759 (t!46477 acc!759)))))

(declare-fun b!1362428 () Bool)

(declare-fun e!772807 () Bool)

(declare-fun e!772805 () Bool)

(assert (=> b!1362428 (= e!772807 e!772805)))

(declare-fun res!906429 () Bool)

(assert (=> b!1362428 (=> (not res!906429) (not e!772805))))

(assert (=> b!1362428 (= res!906429 ((_ is Cons!31788) acc!759))))

(declare-fun b!1362430 () Bool)

(declare-fun e!772808 () Bool)

(assert (=> b!1362430 (= e!772808 (subseq!903 (t!46477 acc!759) (t!46477 acc!759)))))

(declare-fun b!1362429 () Bool)

(assert (=> b!1362429 (= e!772805 e!772806)))

(declare-fun res!906428 () Bool)

(assert (=> b!1362429 (=> res!906428 e!772806)))

(assert (=> b!1362429 (= res!906428 e!772808)))

(declare-fun res!906430 () Bool)

(assert (=> b!1362429 (=> (not res!906430) (not e!772808))))

(assert (=> b!1362429 (= res!906430 (= (h!32997 acc!759) (h!32997 acc!759)))))

(declare-fun d!145983 () Bool)

(declare-fun res!906431 () Bool)

(assert (=> d!145983 (=> res!906431 e!772807)))

(assert (=> d!145983 (= res!906431 ((_ is Nil!31789) acc!759))))

(assert (=> d!145983 (= (subseq!903 acc!759 acc!759) e!772807)))

(assert (= (and d!145983 (not res!906431)) b!1362428))

(assert (= (and b!1362428 res!906429) b!1362429))

(assert (= (and b!1362429 res!906430) b!1362430))

(assert (= (and b!1362429 (not res!906428)) b!1362431))

(declare-fun m!1247377 () Bool)

(assert (=> b!1362431 m!1247377))

(declare-fun m!1247381 () Bool)

(assert (=> b!1362430 m!1247381))

(assert (=> b!1362260 d!145983))

(declare-fun b!1362439 () Bool)

(declare-fun e!772816 () Bool)

(declare-fun call!65386 () Bool)

(assert (=> b!1362439 (= e!772816 call!65386)))

(declare-fun b!1362440 () Bool)

(declare-fun e!772815 () Bool)

(assert (=> b!1362440 (= e!772815 (contains!9501 acc!759 (select (arr!44751 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146007 () Bool)

(declare-fun res!906438 () Bool)

(declare-fun e!772818 () Bool)

(assert (=> d!146007 (=> res!906438 e!772818)))

(assert (=> d!146007 (= res!906438 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45301 a!3742)))))

(assert (=> d!146007 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772818)))

(declare-fun b!1362441 () Bool)

(assert (=> b!1362441 (= e!772816 call!65386)))

(declare-fun b!1362442 () Bool)

(declare-fun e!772817 () Bool)

(assert (=> b!1362442 (= e!772818 e!772817)))

(declare-fun res!906439 () Bool)

(assert (=> b!1362442 (=> (not res!906439) (not e!772817))))

(assert (=> b!1362442 (= res!906439 (not e!772815))))

(declare-fun res!906437 () Bool)

(assert (=> b!1362442 (=> (not res!906437) (not e!772815))))

(assert (=> b!1362442 (= res!906437 (validKeyInArray!0 (select (arr!44751 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun c!127441 () Bool)

(declare-fun bm!65383 () Bool)

(assert (=> bm!65383 (= call!65386 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127441 (Cons!31788 (select (arr!44751 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1362443 () Bool)

(assert (=> b!1362443 (= e!772817 e!772816)))

(assert (=> b!1362443 (= c!127441 (validKeyInArray!0 (select (arr!44751 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146007 (not res!906438)) b!1362442))

(assert (= (and b!1362442 res!906437) b!1362440))

(assert (= (and b!1362442 res!906439) b!1362443))

(assert (= (and b!1362443 c!127441) b!1362441))

(assert (= (and b!1362443 (not c!127441)) b!1362439))

(assert (= (or b!1362441 b!1362439) bm!65383))

(declare-fun m!1247383 () Bool)

(assert (=> b!1362440 m!1247383))

(assert (=> b!1362440 m!1247383))

(declare-fun m!1247385 () Bool)

(assert (=> b!1362440 m!1247385))

(assert (=> b!1362442 m!1247383))

(assert (=> b!1362442 m!1247383))

(declare-fun m!1247387 () Bool)

(assert (=> b!1362442 m!1247387))

(assert (=> bm!65383 m!1247383))

(declare-fun m!1247391 () Bool)

(assert (=> bm!65383 m!1247391))

(assert (=> b!1362443 m!1247383))

(assert (=> b!1362443 m!1247383))

(assert (=> b!1362443 m!1247387))

(assert (=> b!1362260 d!146007))

(assert (=> b!1362260 d!145969))

(declare-fun d!146011 () Bool)

(assert (=> d!146011 (subseq!903 acc!759 acc!759)))

(declare-fun lt!600496 () Unit!44913)

(declare-fun choose!36 (List!31792) Unit!44913)

(assert (=> d!146011 (= lt!600496 (choose!36 acc!759))))

(assert (=> d!146011 (= (lemmaListSubSeqRefl!0 acc!759) lt!600496)))

(declare-fun bs!39063 () Bool)

(assert (= bs!39063 d!146011))

(assert (=> bs!39063 m!1247215))

(declare-fun m!1247403 () Bool)

(assert (=> bs!39063 m!1247403))

(assert (=> b!1362260 d!146011))

(declare-fun b!1362461 () Bool)

(declare-fun e!772834 () Bool)

(declare-fun call!65388 () Bool)

(assert (=> b!1362461 (= e!772834 call!65388)))

(declare-fun e!772833 () Bool)

(declare-fun b!1362462 () Bool)

(assert (=> b!1362462 (= e!772833 (contains!9501 lt!600445 (select (arr!44751 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146017 () Bool)

(declare-fun res!906452 () Bool)

(declare-fun e!772836 () Bool)

(assert (=> d!146017 (=> res!906452 e!772836)))

(assert (=> d!146017 (= res!906452 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45301 a!3742)))))

(assert (=> d!146017 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600445) e!772836)))

(declare-fun b!1362463 () Bool)

(assert (=> b!1362463 (= e!772834 call!65388)))

(declare-fun b!1362464 () Bool)

(declare-fun e!772835 () Bool)

(assert (=> b!1362464 (= e!772836 e!772835)))

(declare-fun res!906453 () Bool)

(assert (=> b!1362464 (=> (not res!906453) (not e!772835))))

(assert (=> b!1362464 (= res!906453 (not e!772833))))

(declare-fun res!906451 () Bool)

(assert (=> b!1362464 (=> (not res!906451) (not e!772833))))

(assert (=> b!1362464 (= res!906451 (validKeyInArray!0 (select (arr!44751 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65385 () Bool)

(declare-fun c!127445 () Bool)

(assert (=> bm!65385 (= call!65388 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127445 (Cons!31788 (select (arr!44751 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600445) lt!600445)))))

(declare-fun b!1362465 () Bool)

(assert (=> b!1362465 (= e!772835 e!772834)))

(assert (=> b!1362465 (= c!127445 (validKeyInArray!0 (select (arr!44751 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146017 (not res!906452)) b!1362464))

(assert (= (and b!1362464 res!906451) b!1362462))

(assert (= (and b!1362464 res!906453) b!1362465))

(assert (= (and b!1362465 c!127445) b!1362463))

(assert (= (and b!1362465 (not c!127445)) b!1362461))

(assert (= (or b!1362463 b!1362461) bm!65385))

(assert (=> b!1362462 m!1247383))

(assert (=> b!1362462 m!1247383))

(declare-fun m!1247405 () Bool)

(assert (=> b!1362462 m!1247405))

(assert (=> b!1362464 m!1247383))

(assert (=> b!1362464 m!1247383))

(assert (=> b!1362464 m!1247387))

(assert (=> bm!65385 m!1247383))

(declare-fun m!1247407 () Bool)

(assert (=> bm!65385 m!1247407))

(assert (=> b!1362465 m!1247383))

(assert (=> b!1362465 m!1247383))

(assert (=> b!1362465 m!1247387))

(assert (=> b!1362270 d!146017))

(declare-fun d!146021 () Bool)

(declare-fun res!906456 () Bool)

(declare-fun e!772839 () Bool)

(assert (=> d!146021 (=> res!906456 e!772839)))

(assert (=> d!146021 (= res!906456 ((_ is Nil!31789) acc!759))))

(assert (=> d!146021 (= (noDuplicate!2358 acc!759) e!772839)))

(declare-fun b!1362468 () Bool)

(declare-fun e!772840 () Bool)

(assert (=> b!1362468 (= e!772839 e!772840)))

(declare-fun res!906457 () Bool)

(assert (=> b!1362468 (=> (not res!906457) (not e!772840))))

(assert (=> b!1362468 (= res!906457 (not (contains!9501 (t!46477 acc!759) (h!32997 acc!759))))))

(declare-fun b!1362469 () Bool)

(assert (=> b!1362469 (= e!772840 (noDuplicate!2358 (t!46477 acc!759)))))

(assert (= (and d!146021 (not res!906456)) b!1362468))

(assert (= (and b!1362468 res!906457) b!1362469))

(declare-fun m!1247413 () Bool)

(assert (=> b!1362468 m!1247413))

(declare-fun m!1247415 () Bool)

(assert (=> b!1362469 m!1247415))

(assert (=> b!1362259 d!146021))

(declare-fun b!1362475 () Bool)

(declare-fun e!772846 () Bool)

(declare-fun call!65392 () Bool)

(assert (=> b!1362475 (= e!772846 call!65392)))

(declare-fun b!1362476 () Bool)

(declare-fun e!772845 () Bool)

(assert (=> b!1362476 (= e!772845 (contains!9501 Nil!31789 (select (arr!44751 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!146025 () Bool)

(declare-fun res!906462 () Bool)

(declare-fun e!772848 () Bool)

(assert (=> d!146025 (=> res!906462 e!772848)))

(assert (=> d!146025 (= res!906462 (bvsge #b00000000000000000000000000000000 (size!45301 a!3742)))))

(assert (=> d!146025 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31789) e!772848)))

(declare-fun b!1362477 () Bool)

(assert (=> b!1362477 (= e!772846 call!65392)))

(declare-fun b!1362478 () Bool)

(declare-fun e!772847 () Bool)

(assert (=> b!1362478 (= e!772848 e!772847)))

(declare-fun res!906463 () Bool)

(assert (=> b!1362478 (=> (not res!906463) (not e!772847))))

(assert (=> b!1362478 (= res!906463 (not e!772845))))

(declare-fun res!906461 () Bool)

(assert (=> b!1362478 (=> (not res!906461) (not e!772845))))

(assert (=> b!1362478 (= res!906461 (validKeyInArray!0 (select (arr!44751 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65389 () Bool)

(declare-fun c!127447 () Bool)

(assert (=> bm!65389 (= call!65392 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127447 (Cons!31788 (select (arr!44751 a!3742) #b00000000000000000000000000000000) Nil!31789) Nil!31789)))))

(declare-fun b!1362479 () Bool)

(assert (=> b!1362479 (= e!772847 e!772846)))

(assert (=> b!1362479 (= c!127447 (validKeyInArray!0 (select (arr!44751 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!146025 (not res!906462)) b!1362478))

(assert (= (and b!1362478 res!906461) b!1362476))

(assert (= (and b!1362478 res!906463) b!1362479))

(assert (= (and b!1362479 c!127447) b!1362477))

(assert (= (and b!1362479 (not c!127447)) b!1362475))

(assert (= (or b!1362477 b!1362475) bm!65389))

(declare-fun m!1247421 () Bool)

(assert (=> b!1362476 m!1247421))

(assert (=> b!1362476 m!1247421))

(declare-fun m!1247423 () Bool)

(assert (=> b!1362476 m!1247423))

(assert (=> b!1362478 m!1247421))

(assert (=> b!1362478 m!1247421))

(declare-fun m!1247427 () Bool)

(assert (=> b!1362478 m!1247427))

(assert (=> bm!65389 m!1247421))

(declare-fun m!1247431 () Bool)

(assert (=> bm!65389 m!1247431))

(assert (=> b!1362479 m!1247421))

(assert (=> b!1362479 m!1247421))

(assert (=> b!1362479 m!1247427))

(assert (=> b!1362269 d!146025))

(declare-fun d!146029 () Bool)

(declare-fun lt!600498 () Bool)

(assert (=> d!146029 (= lt!600498 (select (content!701 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772853 () Bool)

(assert (=> d!146029 (= lt!600498 e!772853)))

(declare-fun res!906467 () Bool)

(assert (=> d!146029 (=> (not res!906467) (not e!772853))))

(assert (=> d!146029 (= res!906467 ((_ is Cons!31788) acc!759))))

(assert (=> d!146029 (= (contains!9501 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600498)))

(declare-fun b!1362485 () Bool)

(declare-fun e!772854 () Bool)

(assert (=> b!1362485 (= e!772853 e!772854)))

(declare-fun res!906468 () Bool)

(assert (=> b!1362485 (=> res!906468 e!772854)))

(assert (=> b!1362485 (= res!906468 (= (h!32997 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362486 () Bool)

(assert (=> b!1362486 (= e!772854 (contains!9501 (t!46477 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146029 res!906467) b!1362485))

(assert (= (and b!1362485 (not res!906468)) b!1362486))

(declare-fun m!1247433 () Bool)

(assert (=> d!146029 m!1247433))

(declare-fun m!1247435 () Bool)

(assert (=> d!146029 m!1247435))

(declare-fun m!1247437 () Bool)

(assert (=> b!1362486 m!1247437))

(assert (=> b!1362268 d!146029))

(declare-fun d!146031 () Bool)

(assert (=> d!146031 (= (array_inv!33779 a!3742) (bvsge (size!45301 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114898 d!146031))

(declare-fun d!146035 () Bool)

(declare-fun lt!600499 () Bool)

(assert (=> d!146035 (= lt!600499 (select (content!701 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772859 () Bool)

(assert (=> d!146035 (= lt!600499 e!772859)))

(declare-fun res!906472 () Bool)

(assert (=> d!146035 (=> (not res!906472) (not e!772859))))

(assert (=> d!146035 (= res!906472 ((_ is Cons!31788) acc!759))))

(assert (=> d!146035 (= (contains!9501 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600499)))

(declare-fun b!1362492 () Bool)

(declare-fun e!772860 () Bool)

(assert (=> b!1362492 (= e!772859 e!772860)))

(declare-fun res!906473 () Bool)

(assert (=> b!1362492 (=> res!906473 e!772860)))

(assert (=> b!1362492 (= res!906473 (= (h!32997 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362493 () Bool)

(assert (=> b!1362493 (= e!772860 (contains!9501 (t!46477 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146035 res!906472) b!1362492))

(assert (= (and b!1362492 (not res!906473)) b!1362493))

(assert (=> d!146035 m!1247433))

(declare-fun m!1247455 () Bool)

(assert (=> d!146035 m!1247455))

(declare-fun m!1247457 () Bool)

(assert (=> b!1362493 m!1247457))

(assert (=> b!1362267 d!146035))

(declare-fun d!146039 () Bool)

(declare-fun lt!600500 () Bool)

(assert (=> d!146039 (= lt!600500 (select (content!701 lt!600445) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772865 () Bool)

(assert (=> d!146039 (= lt!600500 e!772865)))

(declare-fun res!906477 () Bool)

(assert (=> d!146039 (=> (not res!906477) (not e!772865))))

(assert (=> d!146039 (= res!906477 ((_ is Cons!31788) lt!600445))))

(assert (=> d!146039 (= (contains!9501 lt!600445 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600500)))

(declare-fun b!1362499 () Bool)

(declare-fun e!772866 () Bool)

(assert (=> b!1362499 (= e!772865 e!772866)))

(declare-fun res!906478 () Bool)

(assert (=> b!1362499 (=> res!906478 e!772866)))

(assert (=> b!1362499 (= res!906478 (= (h!32997 lt!600445) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362500 () Bool)

(assert (=> b!1362500 (= e!772866 (contains!9501 (t!46477 lt!600445) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146039 res!906477) b!1362499))

(assert (= (and b!1362499 (not res!906478)) b!1362500))

(assert (=> d!146039 m!1247335))

(declare-fun m!1247459 () Bool)

(assert (=> d!146039 m!1247459))

(declare-fun m!1247461 () Bool)

(assert (=> b!1362500 m!1247461))

(assert (=> b!1362265 d!146039))

(check-sat (not b!1362443) (not b!1362478) (not d!145973) (not bm!65380) (not d!146039) (not b!1362346) (not b!1362464) (not b!1362375) (not bm!65389) (not b!1362392) (not bm!65376) (not b!1362348) (not b!1362379) (not b!1362330) (not b!1362465) (not b!1362343) (not b!1362468) (not b!1362500) (not b!1362351) (not d!146029) (not d!145979) (not b!1362442) (not b!1362431) (not d!146035) (not b!1362350) (not d!145963) (not bm!65385) (not b!1362380) (not bm!65383) (not b!1362486) (not b!1362493) (not b!1362345) (not b!1362469) (not d!146011) (not b!1362430) (not b!1362476) (not b!1362440) (not b!1362331) (not b!1362377) (not b!1362462) (not b!1362479) (not bm!65375))
(check-sat)
