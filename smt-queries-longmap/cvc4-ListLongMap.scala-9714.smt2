; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114900 () Bool)

(assert start!114900)

(declare-fun b!1362309 () Bool)

(declare-fun res!906337 () Bool)

(declare-fun e!772708 () Bool)

(assert (=> b!1362309 (=> (not res!906337) (not e!772708))))

(declare-datatypes ((List!31793 0))(
  ( (Nil!31790) (Cons!31789 (h!32998 (_ BitVec 64)) (t!46478 List!31793)) )
))
(declare-fun lt!600465 () List!31793)

(declare-fun contains!9502 (List!31793 (_ BitVec 64)) Bool)

(assert (=> b!1362309 (= res!906337 (not (contains!9502 lt!600465 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362310 () Bool)

(declare-datatypes ((Unit!44916 0))(
  ( (Unit!44917) )
))
(declare-fun e!772710 () Unit!44916)

(declare-fun lt!600466 () Unit!44916)

(assert (=> b!1362310 (= e!772710 lt!600466)))

(declare-fun lt!600468 () Unit!44916)

(declare-fun acc!759 () List!31793)

(declare-fun lemmaListSubSeqRefl!0 (List!31793) Unit!44916)

(assert (=> b!1362310 (= lt!600468 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!904 (List!31793 List!31793) Bool)

(assert (=> b!1362310 (subseq!904 acc!759 acc!759)))

(declare-datatypes ((array!92635 0))(
  ( (array!92636 (arr!44752 (Array (_ BitVec 32) (_ BitVec 64))) (size!45302 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92635)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92635 List!31793 List!31793 (_ BitVec 32)) Unit!44916)

(declare-fun $colon$colon!907 (List!31793 (_ BitVec 64)) List!31793)

(assert (=> b!1362310 (= lt!600466 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!907 acc!759 (select (arr!44752 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92635 (_ BitVec 32) List!31793) Bool)

(assert (=> b!1362310 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362311 () Bool)

(declare-fun res!906331 () Bool)

(assert (=> b!1362311 (=> (not res!906331) (not e!772708))))

(declare-fun noDuplicate!2359 (List!31793) Bool)

(assert (=> b!1362311 (= res!906331 (noDuplicate!2359 lt!600465))))

(declare-fun b!1362312 () Bool)

(declare-fun e!772711 () Bool)

(declare-fun e!772707 () Bool)

(assert (=> b!1362312 (= e!772711 e!772707)))

(declare-fun res!906339 () Bool)

(assert (=> b!1362312 (=> (not res!906339) (not e!772707))))

(declare-fun lt!600463 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362312 (= res!906339 (and (not (= from!3120 i!1404)) lt!600463))))

(declare-fun lt!600464 () Unit!44916)

(assert (=> b!1362312 (= lt!600464 e!772710)))

(declare-fun c!127430 () Bool)

(assert (=> b!1362312 (= c!127430 lt!600463)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362312 (= lt!600463 (validKeyInArray!0 (select (arr!44752 a!3742) from!3120)))))

(declare-fun b!1362313 () Bool)

(declare-fun res!906334 () Bool)

(assert (=> b!1362313 (=> (not res!906334) (not e!772711))))

(assert (=> b!1362313 (= res!906334 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362314 () Bool)

(declare-fun res!906338 () Bool)

(assert (=> b!1362314 (=> (not res!906338) (not e!772711))))

(assert (=> b!1362314 (= res!906338 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45302 a!3742))))))

(declare-fun b!1362315 () Bool)

(declare-fun res!906335 () Bool)

(assert (=> b!1362315 (=> (not res!906335) (not e!772708))))

(assert (=> b!1362315 (= res!906335 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600465))))

(declare-fun b!1362316 () Bool)

(declare-fun res!906330 () Bool)

(assert (=> b!1362316 (=> (not res!906330) (not e!772711))))

(assert (=> b!1362316 (= res!906330 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45302 a!3742)))))

(declare-fun res!906332 () Bool)

(assert (=> start!114900 (=> (not res!906332) (not e!772711))))

(assert (=> start!114900 (= res!906332 (and (bvslt (size!45302 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45302 a!3742))))))

(assert (=> start!114900 e!772711))

(assert (=> start!114900 true))

(declare-fun array_inv!33780 (array!92635) Bool)

(assert (=> start!114900 (array_inv!33780 a!3742)))

(declare-fun b!1362317 () Bool)

(declare-fun res!906340 () Bool)

(assert (=> b!1362317 (=> (not res!906340) (not e!772711))))

(assert (=> b!1362317 (= res!906340 (not (contains!9502 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362318 () Bool)

(declare-fun Unit!44918 () Unit!44916)

(assert (=> b!1362318 (= e!772710 Unit!44918)))

(declare-fun b!1362319 () Bool)

(declare-fun res!906341 () Bool)

(assert (=> b!1362319 (=> (not res!906341) (not e!772711))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362319 (= res!906341 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362320 () Bool)

(declare-fun res!906342 () Bool)

(assert (=> b!1362320 (=> (not res!906342) (not e!772708))))

(assert (=> b!1362320 (= res!906342 (not (contains!9502 lt!600465 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362321 () Bool)

(declare-fun res!906343 () Bool)

(assert (=> b!1362321 (=> (not res!906343) (not e!772711))))

(assert (=> b!1362321 (= res!906343 (noDuplicate!2359 acc!759))))

(declare-fun b!1362322 () Bool)

(declare-fun res!906333 () Bool)

(assert (=> b!1362322 (=> (not res!906333) (not e!772711))))

(assert (=> b!1362322 (= res!906333 (not (contains!9502 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362323 () Bool)

(declare-fun res!906336 () Bool)

(assert (=> b!1362323 (=> (not res!906336) (not e!772711))))

(assert (=> b!1362323 (= res!906336 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31790))))

(declare-fun b!1362324 () Bool)

(assert (=> b!1362324 (= e!772707 e!772708)))

(declare-fun res!906329 () Bool)

(assert (=> b!1362324 (=> (not res!906329) (not e!772708))))

(assert (=> b!1362324 (= res!906329 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1362324 (= lt!600465 ($colon$colon!907 acc!759 (select (arr!44752 a!3742) from!3120)))))

(declare-fun b!1362325 () Bool)

(declare-fun lt!600467 () array!92635)

(assert (=> b!1362325 (= e!772708 (not (arrayNoDuplicates!0 lt!600467 from!3120 acc!759)))))

(assert (=> b!1362325 (arrayNoDuplicates!0 lt!600467 (bvadd #b00000000000000000000000000000001 from!3120) lt!600465)))

(assert (=> b!1362325 (= lt!600467 (array!92636 (store (arr!44752 a!3742) i!1404 l!3587) (size!45302 a!3742)))))

(declare-fun lt!600469 () Unit!44916)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92635 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31793) Unit!44916)

(assert (=> b!1362325 (= lt!600469 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600465))))

(assert (= (and start!114900 res!906332) b!1362321))

(assert (= (and b!1362321 res!906343) b!1362317))

(assert (= (and b!1362317 res!906340) b!1362322))

(assert (= (and b!1362322 res!906333) b!1362323))

(assert (= (and b!1362323 res!906336) b!1362313))

(assert (= (and b!1362313 res!906334) b!1362314))

(assert (= (and b!1362314 res!906338) b!1362319))

(assert (= (and b!1362319 res!906341) b!1362316))

(assert (= (and b!1362316 res!906330) b!1362312))

(assert (= (and b!1362312 c!127430) b!1362310))

(assert (= (and b!1362312 (not c!127430)) b!1362318))

(assert (= (and b!1362312 res!906339) b!1362324))

(assert (= (and b!1362324 res!906329) b!1362311))

(assert (= (and b!1362311 res!906331) b!1362309))

(assert (= (and b!1362309 res!906337) b!1362320))

(assert (= (and b!1362320 res!906342) b!1362315))

(assert (= (and b!1362315 res!906335) b!1362325))

(declare-fun m!1247243 () Bool)

(assert (=> b!1362325 m!1247243))

(declare-fun m!1247245 () Bool)

(assert (=> b!1362325 m!1247245))

(declare-fun m!1247247 () Bool)

(assert (=> b!1362325 m!1247247))

(declare-fun m!1247249 () Bool)

(assert (=> b!1362325 m!1247249))

(declare-fun m!1247251 () Bool)

(assert (=> b!1362313 m!1247251))

(declare-fun m!1247253 () Bool)

(assert (=> b!1362320 m!1247253))

(declare-fun m!1247255 () Bool)

(assert (=> b!1362310 m!1247255))

(declare-fun m!1247257 () Bool)

(assert (=> b!1362310 m!1247257))

(declare-fun m!1247259 () Bool)

(assert (=> b!1362310 m!1247259))

(declare-fun m!1247261 () Bool)

(assert (=> b!1362310 m!1247261))

(declare-fun m!1247263 () Bool)

(assert (=> b!1362310 m!1247263))

(assert (=> b!1362310 m!1247257))

(assert (=> b!1362310 m!1247259))

(declare-fun m!1247265 () Bool)

(assert (=> b!1362310 m!1247265))

(declare-fun m!1247267 () Bool)

(assert (=> start!114900 m!1247267))

(assert (=> b!1362324 m!1247257))

(assert (=> b!1362324 m!1247257))

(assert (=> b!1362324 m!1247259))

(declare-fun m!1247269 () Bool)

(assert (=> b!1362319 m!1247269))

(declare-fun m!1247271 () Bool)

(assert (=> b!1362322 m!1247271))

(declare-fun m!1247273 () Bool)

(assert (=> b!1362311 m!1247273))

(declare-fun m!1247275 () Bool)

(assert (=> b!1362309 m!1247275))

(declare-fun m!1247277 () Bool)

(assert (=> b!1362323 m!1247277))

(declare-fun m!1247279 () Bool)

(assert (=> b!1362315 m!1247279))

(assert (=> b!1362312 m!1247257))

(assert (=> b!1362312 m!1247257))

(declare-fun m!1247281 () Bool)

(assert (=> b!1362312 m!1247281))

(declare-fun m!1247283 () Bool)

(assert (=> b!1362317 m!1247283))

(declare-fun m!1247285 () Bool)

(assert (=> b!1362321 m!1247285))

(push 1)

(assert (not b!1362315))

(assert (not b!1362319))

(assert (not b!1362322))

(assert (not b!1362312))

(assert (not b!1362321))

(assert (not b!1362313))

(assert (not b!1362317))

(assert (not b!1362323))

(assert (not b!1362311))

(assert (not b!1362325))

(assert (not b!1362324))

(assert (not b!1362310))

(assert (not b!1362309))

(assert (not b!1362320))

(assert (not start!114900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145981 () Bool)

(declare-fun lt!600487 () Bool)

(declare-fun content!700 (List!31793) (Set (_ BitVec 64)))

(assert (=> d!145981 (= lt!600487 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!700 lt!600465)))))

(declare-fun e!772792 () Bool)

(assert (=> d!145981 (= lt!600487 e!772792)))

(declare-fun res!906415 () Bool)

(assert (=> d!145981 (=> (not res!906415) (not e!772792))))

(assert (=> d!145981 (= res!906415 (is-Cons!31789 lt!600465))))

(assert (=> d!145981 (= (contains!9502 lt!600465 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600487)))

(declare-fun b!1362414 () Bool)

(declare-fun e!772791 () Bool)

(assert (=> b!1362414 (= e!772792 e!772791)))

(declare-fun res!906414 () Bool)

(assert (=> b!1362414 (=> res!906414 e!772791)))

(assert (=> b!1362414 (= res!906414 (= (h!32998 lt!600465) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362415 () Bool)

(assert (=> b!1362415 (= e!772791 (contains!9502 (t!46478 lt!600465) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145981 res!906415) b!1362414))

(assert (= (and b!1362414 (not res!906414)) b!1362415))

(declare-fun m!1247355 () Bool)

(assert (=> d!145981 m!1247355))

(declare-fun m!1247357 () Bool)

(assert (=> d!145981 m!1247357))

(declare-fun m!1247359 () Bool)

(assert (=> b!1362415 m!1247359))

(assert (=> b!1362309 d!145981))

(declare-fun d!145989 () Bool)

(assert (=> d!145989 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1362319 d!145989))

(declare-fun d!145993 () Bool)

(assert (=> d!145993 (= (array_inv!33780 a!3742) (bvsge (size!45302 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114900 d!145993))

(declare-fun d!145995 () Bool)

(declare-fun lt!600491 () Bool)

(assert (=> d!145995 (= lt!600491 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!700 acc!759)))))

(declare-fun e!772802 () Bool)

(assert (=> d!145995 (= lt!600491 e!772802)))

(declare-fun res!906425 () Bool)

(assert (=> d!145995 (=> (not res!906425) (not e!772802))))

(assert (=> d!145995 (= res!906425 (is-Cons!31789 acc!759))))

(assert (=> d!145995 (= (contains!9502 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600491)))

(declare-fun b!1362424 () Bool)

(declare-fun e!772801 () Bool)

(assert (=> b!1362424 (= e!772802 e!772801)))

(declare-fun res!906424 () Bool)

(assert (=> b!1362424 (=> res!906424 e!772801)))

(assert (=> b!1362424 (= res!906424 (= (h!32998 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362425 () Bool)

(assert (=> b!1362425 (= e!772801 (contains!9502 (t!46478 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145995 res!906425) b!1362424))

(assert (= (and b!1362424 (not res!906424)) b!1362425))

(declare-fun m!1247363 () Bool)

(assert (=> d!145995 m!1247363))

(declare-fun m!1247365 () Bool)

(assert (=> d!145995 m!1247365))

(declare-fun m!1247367 () Bool)

(assert (=> b!1362425 m!1247367))

(assert (=> b!1362317 d!145995))

(declare-fun b!1362487 () Bool)

(declare-fun e!772857 () Bool)

(declare-fun e!772856 () Bool)

(assert (=> b!1362487 (= e!772857 e!772856)))

(declare-fun c!127449 () Bool)

(assert (=> b!1362487 (= c!127449 (validKeyInArray!0 (select (arr!44752 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362488 () Bool)

(declare-fun e!772858 () Bool)

(assert (=> b!1362488 (= e!772858 e!772857)))

(declare-fun res!906471 () Bool)

(assert (=> b!1362488 (=> (not res!906471) (not e!772857))))

(declare-fun e!772855 () Bool)

(assert (=> b!1362488 (= res!906471 (not e!772855))))

(declare-fun res!906470 () Bool)

(assert (=> b!1362488 (=> (not res!906470) (not e!772855))))

(assert (=> b!1362488 (= res!906470 (validKeyInArray!0 (select (arr!44752 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362489 () Bool)

(assert (=> b!1362489 (= e!772855 (contains!9502 lt!600465 (select (arr!44752 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362490 () Bool)

(declare-fun call!65394 () Bool)

(assert (=> b!1362490 (= e!772856 call!65394)))

(declare-fun bm!65391 () Bool)

(assert (=> bm!65391 (= call!65394 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127449 (Cons!31789 (select (arr!44752 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600465) lt!600465)))))

(declare-fun d!145999 () Bool)

(declare-fun res!906469 () Bool)

(assert (=> d!145999 (=> res!906469 e!772858)))

(assert (=> d!145999 (= res!906469 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45302 a!3742)))))

(assert (=> d!145999 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600465) e!772858)))

(declare-fun b!1362491 () Bool)

(assert (=> b!1362491 (= e!772856 call!65394)))

(assert (= (and d!145999 (not res!906469)) b!1362488))

(assert (= (and b!1362488 res!906470) b!1362489))

(assert (= (and b!1362488 res!906471) b!1362487))

(assert (= (and b!1362487 c!127449) b!1362490))

(assert (= (and b!1362487 (not c!127449)) b!1362491))

(assert (= (or b!1362490 b!1362491) bm!65391))

(declare-fun m!1247447 () Bool)

(assert (=> b!1362487 m!1247447))

(assert (=> b!1362487 m!1247447))

(declare-fun m!1247449 () Bool)

(assert (=> b!1362487 m!1247449))

(assert (=> b!1362488 m!1247447))

(assert (=> b!1362488 m!1247447))

(assert (=> b!1362488 m!1247449))

(assert (=> b!1362489 m!1247447))

(assert (=> b!1362489 m!1247447))

(declare-fun m!1247451 () Bool)

(assert (=> b!1362489 m!1247451))

(assert (=> bm!65391 m!1247447))

(declare-fun m!1247453 () Bool)

(assert (=> bm!65391 m!1247453))

(assert (=> b!1362315 d!145999))

(declare-fun b!1362494 () Bool)

(declare-fun e!772863 () Bool)

(declare-fun e!772862 () Bool)

(assert (=> b!1362494 (= e!772863 e!772862)))

(declare-fun c!127450 () Bool)

(assert (=> b!1362494 (= c!127450 (validKeyInArray!0 (select (arr!44752 lt!600467) from!3120)))))

(declare-fun b!1362495 () Bool)

(declare-fun e!772864 () Bool)

(assert (=> b!1362495 (= e!772864 e!772863)))

(declare-fun res!906476 () Bool)

(assert (=> b!1362495 (=> (not res!906476) (not e!772863))))

(declare-fun e!772861 () Bool)

(assert (=> b!1362495 (= res!906476 (not e!772861))))

(declare-fun res!906475 () Bool)

(assert (=> b!1362495 (=> (not res!906475) (not e!772861))))

(assert (=> b!1362495 (= res!906475 (validKeyInArray!0 (select (arr!44752 lt!600467) from!3120)))))

(declare-fun b!1362496 () Bool)

(assert (=> b!1362496 (= e!772861 (contains!9502 acc!759 (select (arr!44752 lt!600467) from!3120)))))

(declare-fun b!1362497 () Bool)

(declare-fun call!65395 () Bool)

(assert (=> b!1362497 (= e!772862 call!65395)))

(declare-fun bm!65392 () Bool)

(assert (=> bm!65392 (= call!65395 (arrayNoDuplicates!0 lt!600467 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127450 (Cons!31789 (select (arr!44752 lt!600467) from!3120) acc!759) acc!759)))))

(declare-fun d!146037 () Bool)

(declare-fun res!906474 () Bool)

(assert (=> d!146037 (=> res!906474 e!772864)))

(assert (=> d!146037 (= res!906474 (bvsge from!3120 (size!45302 lt!600467)))))

(assert (=> d!146037 (= (arrayNoDuplicates!0 lt!600467 from!3120 acc!759) e!772864)))

(declare-fun b!1362498 () Bool)

(assert (=> b!1362498 (= e!772862 call!65395)))

(assert (= (and d!146037 (not res!906474)) b!1362495))

(assert (= (and b!1362495 res!906475) b!1362496))

(assert (= (and b!1362495 res!906476) b!1362494))

(assert (= (and b!1362494 c!127450) b!1362497))

(assert (= (and b!1362494 (not c!127450)) b!1362498))

(assert (= (or b!1362497 b!1362498) bm!65392))

(declare-fun m!1247463 () Bool)

(assert (=> b!1362494 m!1247463))

(assert (=> b!1362494 m!1247463))

(declare-fun m!1247465 () Bool)

(assert (=> b!1362494 m!1247465))

(assert (=> b!1362495 m!1247463))

(assert (=> b!1362495 m!1247463))

(assert (=> b!1362495 m!1247465))

(assert (=> b!1362496 m!1247463))

(assert (=> b!1362496 m!1247463))

(declare-fun m!1247467 () Bool)

(assert (=> b!1362496 m!1247467))

(assert (=> bm!65392 m!1247463))

(declare-fun m!1247469 () Bool)

(assert (=> bm!65392 m!1247469))

(assert (=> b!1362325 d!146037))

(declare-fun b!1362501 () Bool)

(declare-fun e!772869 () Bool)

(declare-fun e!772868 () Bool)

(assert (=> b!1362501 (= e!772869 e!772868)))

(declare-fun c!127451 () Bool)

(assert (=> b!1362501 (= c!127451 (validKeyInArray!0 (select (arr!44752 lt!600467) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362502 () Bool)

(declare-fun e!772870 () Bool)

(assert (=> b!1362502 (= e!772870 e!772869)))

(declare-fun res!906481 () Bool)

(assert (=> b!1362502 (=> (not res!906481) (not e!772869))))

(declare-fun e!772867 () Bool)

(assert (=> b!1362502 (= res!906481 (not e!772867))))

(declare-fun res!906480 () Bool)

(assert (=> b!1362502 (=> (not res!906480) (not e!772867))))

(assert (=> b!1362502 (= res!906480 (validKeyInArray!0 (select (arr!44752 lt!600467) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362503 () Bool)

(assert (=> b!1362503 (= e!772867 (contains!9502 lt!600465 (select (arr!44752 lt!600467) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362504 () Bool)

(declare-fun call!65396 () Bool)

(assert (=> b!1362504 (= e!772868 call!65396)))

(declare-fun bm!65393 () Bool)

(assert (=> bm!65393 (= call!65396 (arrayNoDuplicates!0 lt!600467 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127451 (Cons!31789 (select (arr!44752 lt!600467) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600465) lt!600465)))))

(declare-fun d!146041 () Bool)

(declare-fun res!906479 () Bool)

(assert (=> d!146041 (=> res!906479 e!772870)))

(assert (=> d!146041 (= res!906479 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45302 lt!600467)))))

(assert (=> d!146041 (= (arrayNoDuplicates!0 lt!600467 (bvadd #b00000000000000000000000000000001 from!3120) lt!600465) e!772870)))

(declare-fun b!1362505 () Bool)

(assert (=> b!1362505 (= e!772868 call!65396)))

(assert (= (and d!146041 (not res!906479)) b!1362502))

(assert (= (and b!1362502 res!906480) b!1362503))

(assert (= (and b!1362502 res!906481) b!1362501))

(assert (= (and b!1362501 c!127451) b!1362504))

(assert (= (and b!1362501 (not c!127451)) b!1362505))

(assert (= (or b!1362504 b!1362505) bm!65393))

(declare-fun m!1247471 () Bool)

(assert (=> b!1362501 m!1247471))

(assert (=> b!1362501 m!1247471))

(declare-fun m!1247473 () Bool)

(assert (=> b!1362501 m!1247473))

(assert (=> b!1362502 m!1247471))

(assert (=> b!1362502 m!1247471))

(assert (=> b!1362502 m!1247473))

(assert (=> b!1362503 m!1247471))

(assert (=> b!1362503 m!1247471))

(declare-fun m!1247475 () Bool)

(assert (=> b!1362503 m!1247475))

(assert (=> bm!65393 m!1247471))

(declare-fun m!1247477 () Bool)

(assert (=> bm!65393 m!1247477))

(assert (=> b!1362325 d!146041))

(declare-fun d!146043 () Bool)

(declare-fun e!772876 () Bool)

(assert (=> d!146043 e!772876))

(declare-fun res!906487 () Bool)

(assert (=> d!146043 (=> (not res!906487) (not e!772876))))

(assert (=> d!146043 (= res!906487 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45302 a!3742))))))

(declare-fun lt!600506 () Unit!44916)

(declare-fun choose!53 (array!92635 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31793) Unit!44916)

(assert (=> d!146043 (= lt!600506 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600465))))

(assert (=> d!146043 (bvslt (size!45302 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146043 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600465) lt!600506)))

(declare-fun b!1362511 () Bool)

(assert (=> b!1362511 (= e!772876 (arrayNoDuplicates!0 (array!92636 (store (arr!44752 a!3742) i!1404 l!3587) (size!45302 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!600465))))

(assert (= (and d!146043 res!906487) b!1362511))

(declare-fun m!1247483 () Bool)

(assert (=> d!146043 m!1247483))

(assert (=> b!1362511 m!1247247))

(declare-fun m!1247485 () Bool)

(assert (=> b!1362511 m!1247485))

(assert (=> b!1362325 d!146043))

(declare-fun d!146047 () Bool)

(assert (=> d!146047 (= ($colon$colon!907 acc!759 (select (arr!44752 a!3742) from!3120)) (Cons!31789 (select (arr!44752 a!3742) from!3120) acc!759))))

(assert (=> b!1362324 d!146047))

(declare-fun b!1362512 () Bool)

(declare-fun e!772879 () Bool)

(declare-fun e!772878 () Bool)

(assert (=> b!1362512 (= e!772879 e!772878)))

(declare-fun c!127452 () Bool)

(assert (=> b!1362512 (= c!127452 (validKeyInArray!0 (select (arr!44752 a!3742) from!3120)))))

(declare-fun b!1362513 () Bool)

(declare-fun e!772880 () Bool)

(assert (=> b!1362513 (= e!772880 e!772879)))

(declare-fun res!906490 () Bool)

(assert (=> b!1362513 (=> (not res!906490) (not e!772879))))

(declare-fun e!772877 () Bool)

(assert (=> b!1362513 (= res!906490 (not e!772877))))

