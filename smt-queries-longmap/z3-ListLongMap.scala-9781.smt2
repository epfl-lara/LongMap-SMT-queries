; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116116 () Bool)

(assert start!116116)

(declare-fun res!914013 () Bool)

(declare-fun e!776835 () Bool)

(assert (=> start!116116 (=> (not res!914013) (not e!776835))))

(declare-datatypes ((array!93121 0))(
  ( (array!93122 (arr!44977 (Array (_ BitVec 32) (_ BitVec 64))) (size!45528 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93121)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116116 (= res!914013 (and (bvslt (size!45528 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45528 a!3861))))))

(assert (=> start!116116 e!776835))

(declare-fun array_inv!34258 (array!93121) Bool)

(assert (=> start!116116 (array_inv!34258 a!3861)))

(assert (=> start!116116 true))

(declare-fun b!1371332 () Bool)

(declare-fun res!914018 () Bool)

(declare-fun e!776836 () Bool)

(assert (=> b!1371332 (=> (not res!914018) (not e!776836))))

(assert (=> b!1371332 (= res!914018 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1371333 () Bool)

(declare-fun res!914020 () Bool)

(assert (=> b!1371333 (=> (not res!914020) (not e!776835))))

(declare-datatypes ((List!32032 0))(
  ( (Nil!32029) (Cons!32028 (h!33246 (_ BitVec 64)) (t!46718 List!32032)) )
))
(declare-fun acc!866 () List!32032)

(declare-fun contains!9717 (List!32032 (_ BitVec 64)) Bool)

(assert (=> b!1371333 (= res!914020 (not (contains!9717 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371334 () Bool)

(assert (=> b!1371334 (= e!776835 e!776836)))

(declare-fun res!914016 () Bool)

(assert (=> b!1371334 (=> (not res!914016) (not e!776836))))

(declare-fun arrayNoDuplicates!0 (array!93121 (_ BitVec 32) List!32032) Bool)

(assert (=> b!1371334 (= res!914016 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45224 0))(
  ( (Unit!45225) )
))
(declare-fun lt!602853 () Unit!45224)

(declare-fun newAcc!98 () List!32032)

(declare-fun noDuplicateSubseq!263 (List!32032 List!32032) Unit!45224)

(assert (=> b!1371334 (= lt!602853 (noDuplicateSubseq!263 newAcc!98 acc!866))))

(declare-fun b!1371335 () Bool)

(declare-fun res!914017 () Bool)

(assert (=> b!1371335 (=> (not res!914017) (not e!776835))))

(assert (=> b!1371335 (= res!914017 (not (contains!9717 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371336 () Bool)

(declare-fun res!914022 () Bool)

(assert (=> b!1371336 (=> (not res!914022) (not e!776836))))

(assert (=> b!1371336 (= res!914022 (not (contains!9717 acc!866 (select (arr!44977 a!3861) from!3239))))))

(declare-fun b!1371337 () Bool)

(declare-fun res!914014 () Bool)

(assert (=> b!1371337 (=> (not res!914014) (not e!776835))))

(declare-fun subseq!1076 (List!32032 List!32032) Bool)

(assert (=> b!1371337 (= res!914014 (subseq!1076 newAcc!98 acc!866))))

(declare-fun b!1371338 () Bool)

(declare-fun res!914021 () Bool)

(assert (=> b!1371338 (=> (not res!914021) (not e!776836))))

(assert (=> b!1371338 (= res!914021 (bvslt from!3239 (size!45528 a!3861)))))

(declare-fun b!1371339 () Bool)

(declare-fun res!914015 () Bool)

(assert (=> b!1371339 (=> (not res!914015) (not e!776835))))

(assert (=> b!1371339 (= res!914015 (not (contains!9717 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371340 () Bool)

(declare-fun noDuplicate!2548 (List!32032) Bool)

(assert (=> b!1371340 (= e!776836 (not (noDuplicate!2548 (Cons!32028 (select (arr!44977 a!3861) from!3239) acc!866))))))

(declare-fun b!1371341 () Bool)

(declare-fun res!914019 () Bool)

(assert (=> b!1371341 (=> (not res!914019) (not e!776836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371341 (= res!914019 (validKeyInArray!0 (select (arr!44977 a!3861) from!3239)))))

(declare-fun b!1371342 () Bool)

(declare-fun res!914011 () Bool)

(assert (=> b!1371342 (=> (not res!914011) (not e!776835))))

(assert (=> b!1371342 (= res!914011 (not (contains!9717 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371343 () Bool)

(declare-fun res!914012 () Bool)

(assert (=> b!1371343 (=> (not res!914012) (not e!776835))))

(assert (=> b!1371343 (= res!914012 (noDuplicate!2548 acc!866))))

(assert (= (and start!116116 res!914013) b!1371343))

(assert (= (and b!1371343 res!914012) b!1371333))

(assert (= (and b!1371333 res!914020) b!1371339))

(assert (= (and b!1371339 res!914015) b!1371335))

(assert (= (and b!1371335 res!914017) b!1371342))

(assert (= (and b!1371342 res!914011) b!1371337))

(assert (= (and b!1371337 res!914014) b!1371334))

(assert (= (and b!1371334 res!914016) b!1371338))

(assert (= (and b!1371338 res!914021) b!1371341))

(assert (= (and b!1371341 res!914019) b!1371336))

(assert (= (and b!1371336 res!914022) b!1371332))

(assert (= (and b!1371332 res!914018) b!1371340))

(declare-fun m!1255285 () Bool)

(assert (=> b!1371343 m!1255285))

(declare-fun m!1255287 () Bool)

(assert (=> start!116116 m!1255287))

(declare-fun m!1255289 () Bool)

(assert (=> b!1371339 m!1255289))

(declare-fun m!1255291 () Bool)

(assert (=> b!1371336 m!1255291))

(assert (=> b!1371336 m!1255291))

(declare-fun m!1255293 () Bool)

(assert (=> b!1371336 m!1255293))

(declare-fun m!1255295 () Bool)

(assert (=> b!1371333 m!1255295))

(declare-fun m!1255297 () Bool)

(assert (=> b!1371334 m!1255297))

(declare-fun m!1255299 () Bool)

(assert (=> b!1371334 m!1255299))

(assert (=> b!1371340 m!1255291))

(declare-fun m!1255301 () Bool)

(assert (=> b!1371340 m!1255301))

(declare-fun m!1255303 () Bool)

(assert (=> b!1371335 m!1255303))

(declare-fun m!1255305 () Bool)

(assert (=> b!1371342 m!1255305))

(assert (=> b!1371341 m!1255291))

(assert (=> b!1371341 m!1255291))

(declare-fun m!1255307 () Bool)

(assert (=> b!1371341 m!1255307))

(declare-fun m!1255309 () Bool)

(assert (=> b!1371337 m!1255309))

(check-sat (not b!1371343) (not start!116116) (not b!1371335) (not b!1371342) (not b!1371334) (not b!1371337) (not b!1371333) (not b!1371340) (not b!1371336) (not b!1371341) (not b!1371339))
(check-sat)
(get-model)

(declare-fun d!147525 () Bool)

(declare-fun res!914099 () Bool)

(declare-fun e!776859 () Bool)

(assert (=> d!147525 (=> res!914099 e!776859)))

(get-info :version)

(assert (=> d!147525 (= res!914099 ((_ is Nil!32029) (Cons!32028 (select (arr!44977 a!3861) from!3239) acc!866)))))

(assert (=> d!147525 (= (noDuplicate!2548 (Cons!32028 (select (arr!44977 a!3861) from!3239) acc!866)) e!776859)))

(declare-fun b!1371420 () Bool)

(declare-fun e!776860 () Bool)

(assert (=> b!1371420 (= e!776859 e!776860)))

(declare-fun res!914100 () Bool)

(assert (=> b!1371420 (=> (not res!914100) (not e!776860))))

(assert (=> b!1371420 (= res!914100 (not (contains!9717 (t!46718 (Cons!32028 (select (arr!44977 a!3861) from!3239) acc!866)) (h!33246 (Cons!32028 (select (arr!44977 a!3861) from!3239) acc!866)))))))

(declare-fun b!1371421 () Bool)

(assert (=> b!1371421 (= e!776860 (noDuplicate!2548 (t!46718 (Cons!32028 (select (arr!44977 a!3861) from!3239) acc!866))))))

(assert (= (and d!147525 (not res!914099)) b!1371420))

(assert (= (and b!1371420 res!914100) b!1371421))

(declare-fun m!1255363 () Bool)

(assert (=> b!1371420 m!1255363))

(declare-fun m!1255365 () Bool)

(assert (=> b!1371421 m!1255365))

(assert (=> b!1371340 d!147525))

(declare-fun d!147527 () Bool)

(declare-fun lt!602862 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!722 (List!32032) (InoxSet (_ BitVec 64)))

(assert (=> d!147527 (= lt!602862 (select (content!722 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776865 () Bool)

(assert (=> d!147527 (= lt!602862 e!776865)))

(declare-fun res!914105 () Bool)

(assert (=> d!147527 (=> (not res!914105) (not e!776865))))

(assert (=> d!147527 (= res!914105 ((_ is Cons!32028) newAcc!98))))

(assert (=> d!147527 (= (contains!9717 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602862)))

(declare-fun b!1371426 () Bool)

(declare-fun e!776866 () Bool)

(assert (=> b!1371426 (= e!776865 e!776866)))

(declare-fun res!914106 () Bool)

(assert (=> b!1371426 (=> res!914106 e!776866)))

(assert (=> b!1371426 (= res!914106 (= (h!33246 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371427 () Bool)

(assert (=> b!1371427 (= e!776866 (contains!9717 (t!46718 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147527 res!914105) b!1371426))

(assert (= (and b!1371426 (not res!914106)) b!1371427))

(declare-fun m!1255367 () Bool)

(assert (=> d!147527 m!1255367))

(declare-fun m!1255369 () Bool)

(assert (=> d!147527 m!1255369))

(declare-fun m!1255371 () Bool)

(assert (=> b!1371427 m!1255371))

(assert (=> b!1371335 d!147527))

(declare-fun lt!602863 () Bool)

(declare-fun d!147529 () Bool)

(assert (=> d!147529 (= lt!602863 (select (content!722 acc!866) (select (arr!44977 a!3861) from!3239)))))

(declare-fun e!776867 () Bool)

(assert (=> d!147529 (= lt!602863 e!776867)))

(declare-fun res!914107 () Bool)

(assert (=> d!147529 (=> (not res!914107) (not e!776867))))

(assert (=> d!147529 (= res!914107 ((_ is Cons!32028) acc!866))))

(assert (=> d!147529 (= (contains!9717 acc!866 (select (arr!44977 a!3861) from!3239)) lt!602863)))

(declare-fun b!1371428 () Bool)

(declare-fun e!776868 () Bool)

(assert (=> b!1371428 (= e!776867 e!776868)))

(declare-fun res!914108 () Bool)

(assert (=> b!1371428 (=> res!914108 e!776868)))

(assert (=> b!1371428 (= res!914108 (= (h!33246 acc!866) (select (arr!44977 a!3861) from!3239)))))

(declare-fun b!1371429 () Bool)

(assert (=> b!1371429 (= e!776868 (contains!9717 (t!46718 acc!866) (select (arr!44977 a!3861) from!3239)))))

(assert (= (and d!147529 res!914107) b!1371428))

(assert (= (and b!1371428 (not res!914108)) b!1371429))

(declare-fun m!1255373 () Bool)

(assert (=> d!147529 m!1255373))

(assert (=> d!147529 m!1255291))

(declare-fun m!1255375 () Bool)

(assert (=> d!147529 m!1255375))

(assert (=> b!1371429 m!1255291))

(declare-fun m!1255377 () Bool)

(assert (=> b!1371429 m!1255377))

(assert (=> b!1371336 d!147529))

(declare-fun d!147531 () Bool)

(assert (=> d!147531 (= (validKeyInArray!0 (select (arr!44977 a!3861) from!3239)) (and (not (= (select (arr!44977 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44977 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1371341 d!147531))

(declare-fun d!147537 () Bool)

(declare-fun lt!602864 () Bool)

(assert (=> d!147537 (= lt!602864 (select (content!722 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776869 () Bool)

(assert (=> d!147537 (= lt!602864 e!776869)))

(declare-fun res!914109 () Bool)

(assert (=> d!147537 (=> (not res!914109) (not e!776869))))

(assert (=> d!147537 (= res!914109 ((_ is Cons!32028) newAcc!98))))

(assert (=> d!147537 (= (contains!9717 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602864)))

(declare-fun b!1371430 () Bool)

(declare-fun e!776870 () Bool)

(assert (=> b!1371430 (= e!776869 e!776870)))

(declare-fun res!914110 () Bool)

(assert (=> b!1371430 (=> res!914110 e!776870)))

(assert (=> b!1371430 (= res!914110 (= (h!33246 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371431 () Bool)

(assert (=> b!1371431 (= e!776870 (contains!9717 (t!46718 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147537 res!914109) b!1371430))

(assert (= (and b!1371430 (not res!914110)) b!1371431))

(assert (=> d!147537 m!1255367))

(declare-fun m!1255379 () Bool)

(assert (=> d!147537 m!1255379))

(declare-fun m!1255381 () Bool)

(assert (=> b!1371431 m!1255381))

(assert (=> b!1371342 d!147537))

(declare-fun b!1371450 () Bool)

(declare-fun e!776891 () Bool)

(declare-fun e!776892 () Bool)

(assert (=> b!1371450 (= e!776891 e!776892)))

(declare-fun res!914132 () Bool)

(assert (=> b!1371450 (=> (not res!914132) (not e!776892))))

(assert (=> b!1371450 (= res!914132 ((_ is Cons!32028) acc!866))))

(declare-fun b!1371453 () Bool)

(declare-fun e!776889 () Bool)

(assert (=> b!1371453 (= e!776889 (subseq!1076 newAcc!98 (t!46718 acc!866)))))

(declare-fun d!147539 () Bool)

(declare-fun res!914129 () Bool)

(assert (=> d!147539 (=> res!914129 e!776891)))

(assert (=> d!147539 (= res!914129 ((_ is Nil!32029) newAcc!98))))

(assert (=> d!147539 (= (subseq!1076 newAcc!98 acc!866) e!776891)))

(declare-fun b!1371451 () Bool)

(assert (=> b!1371451 (= e!776892 e!776889)))

(declare-fun res!914131 () Bool)

(assert (=> b!1371451 (=> res!914131 e!776889)))

(declare-fun e!776890 () Bool)

(assert (=> b!1371451 (= res!914131 e!776890)))

(declare-fun res!914130 () Bool)

(assert (=> b!1371451 (=> (not res!914130) (not e!776890))))

(assert (=> b!1371451 (= res!914130 (= (h!33246 newAcc!98) (h!33246 acc!866)))))

(declare-fun b!1371452 () Bool)

(assert (=> b!1371452 (= e!776890 (subseq!1076 (t!46718 newAcc!98) (t!46718 acc!866)))))

(assert (= (and d!147539 (not res!914129)) b!1371450))

(assert (= (and b!1371450 res!914132) b!1371451))

(assert (= (and b!1371451 res!914130) b!1371452))

(assert (= (and b!1371451 (not res!914131)) b!1371453))

(declare-fun m!1255387 () Bool)

(assert (=> b!1371453 m!1255387))

(declare-fun m!1255389 () Bool)

(assert (=> b!1371452 m!1255389))

(assert (=> b!1371337 d!147539))

(declare-fun d!147543 () Bool)

(declare-fun res!914135 () Bool)

(declare-fun e!776895 () Bool)

(assert (=> d!147543 (=> res!914135 e!776895)))

(assert (=> d!147543 (= res!914135 ((_ is Nil!32029) acc!866))))

(assert (=> d!147543 (= (noDuplicate!2548 acc!866) e!776895)))

(declare-fun b!1371456 () Bool)

(declare-fun e!776896 () Bool)

(assert (=> b!1371456 (= e!776895 e!776896)))

(declare-fun res!914136 () Bool)

(assert (=> b!1371456 (=> (not res!914136) (not e!776896))))

(assert (=> b!1371456 (= res!914136 (not (contains!9717 (t!46718 acc!866) (h!33246 acc!866))))))

(declare-fun b!1371457 () Bool)

(assert (=> b!1371457 (= e!776896 (noDuplicate!2548 (t!46718 acc!866)))))

(assert (= (and d!147543 (not res!914135)) b!1371456))

(assert (= (and b!1371456 res!914136) b!1371457))

(declare-fun m!1255395 () Bool)

(assert (=> b!1371456 m!1255395))

(declare-fun m!1255397 () Bool)

(assert (=> b!1371457 m!1255397))

(assert (=> b!1371343 d!147543))

(declare-fun d!147545 () Bool)

(declare-fun lt!602868 () Bool)

(assert (=> d!147545 (= lt!602868 (select (content!722 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776897 () Bool)

(assert (=> d!147545 (= lt!602868 e!776897)))

(declare-fun res!914137 () Bool)

(assert (=> d!147545 (=> (not res!914137) (not e!776897))))

(assert (=> d!147545 (= res!914137 ((_ is Cons!32028) acc!866))))

(assert (=> d!147545 (= (contains!9717 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602868)))

(declare-fun b!1371458 () Bool)

(declare-fun e!776898 () Bool)

(assert (=> b!1371458 (= e!776897 e!776898)))

(declare-fun res!914138 () Bool)

(assert (=> b!1371458 (=> res!914138 e!776898)))

(assert (=> b!1371458 (= res!914138 (= (h!33246 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371459 () Bool)

(assert (=> b!1371459 (= e!776898 (contains!9717 (t!46718 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147545 res!914137) b!1371458))

(assert (= (and b!1371458 (not res!914138)) b!1371459))

(assert (=> d!147545 m!1255373))

(declare-fun m!1255401 () Bool)

(assert (=> d!147545 m!1255401))

(declare-fun m!1255403 () Bool)

(assert (=> b!1371459 m!1255403))

(assert (=> b!1371333 d!147545))

(declare-fun b!1371492 () Bool)

(declare-fun e!776930 () Bool)

(declare-fun call!65584 () Bool)

(assert (=> b!1371492 (= e!776930 call!65584)))

(declare-fun b!1371493 () Bool)

(declare-fun e!776929 () Bool)

(assert (=> b!1371493 (= e!776929 e!776930)))

(declare-fun c!128110 () Bool)

(assert (=> b!1371493 (= c!128110 (validKeyInArray!0 (select (arr!44977 a!3861) from!3239)))))

(declare-fun bm!65581 () Bool)

(assert (=> bm!65581 (= call!65584 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128110 (Cons!32028 (select (arr!44977 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun e!776932 () Bool)

(declare-fun b!1371494 () Bool)

(assert (=> b!1371494 (= e!776932 (contains!9717 acc!866 (select (arr!44977 a!3861) from!3239)))))

(declare-fun b!1371496 () Bool)

(assert (=> b!1371496 (= e!776930 call!65584)))

(declare-fun b!1371495 () Bool)

(declare-fun e!776931 () Bool)

(assert (=> b!1371495 (= e!776931 e!776929)))

(declare-fun res!914168 () Bool)

(assert (=> b!1371495 (=> (not res!914168) (not e!776929))))

(assert (=> b!1371495 (= res!914168 (not e!776932))))

(declare-fun res!914167 () Bool)

(assert (=> b!1371495 (=> (not res!914167) (not e!776932))))

(assert (=> b!1371495 (= res!914167 (validKeyInArray!0 (select (arr!44977 a!3861) from!3239)))))

(declare-fun d!147549 () Bool)

(declare-fun res!914169 () Bool)

(assert (=> d!147549 (=> res!914169 e!776931)))

(assert (=> d!147549 (= res!914169 (bvsge from!3239 (size!45528 a!3861)))))

(assert (=> d!147549 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776931)))

(assert (= (and d!147549 (not res!914169)) b!1371495))

(assert (= (and b!1371495 res!914167) b!1371494))

(assert (= (and b!1371495 res!914168) b!1371493))

(assert (= (and b!1371493 c!128110) b!1371496))

(assert (= (and b!1371493 (not c!128110)) b!1371492))

(assert (= (or b!1371496 b!1371492) bm!65581))

(assert (=> b!1371493 m!1255291))

(assert (=> b!1371493 m!1255291))

(assert (=> b!1371493 m!1255307))

(assert (=> bm!65581 m!1255291))

(declare-fun m!1255425 () Bool)

(assert (=> bm!65581 m!1255425))

(assert (=> b!1371494 m!1255291))

(assert (=> b!1371494 m!1255291))

(assert (=> b!1371494 m!1255293))

(assert (=> b!1371495 m!1255291))

(assert (=> b!1371495 m!1255291))

(assert (=> b!1371495 m!1255307))

(assert (=> b!1371334 d!147549))

(declare-fun d!147559 () Bool)

(assert (=> d!147559 (noDuplicate!2548 newAcc!98)))

(declare-fun lt!602878 () Unit!45224)

(declare-fun choose!2008 (List!32032 List!32032) Unit!45224)

(assert (=> d!147559 (= lt!602878 (choose!2008 newAcc!98 acc!866))))

(declare-fun e!776943 () Bool)

(assert (=> d!147559 e!776943))

(declare-fun res!914180 () Bool)

(assert (=> d!147559 (=> (not res!914180) (not e!776943))))

(assert (=> d!147559 (= res!914180 (subseq!1076 newAcc!98 acc!866))))

(assert (=> d!147559 (= (noDuplicateSubseq!263 newAcc!98 acc!866) lt!602878)))

(declare-fun b!1371505 () Bool)

(assert (=> b!1371505 (= e!776943 (noDuplicate!2548 acc!866))))

(assert (= (and d!147559 res!914180) b!1371505))

(declare-fun m!1255441 () Bool)

(assert (=> d!147559 m!1255441))

(declare-fun m!1255443 () Bool)

(assert (=> d!147559 m!1255443))

(assert (=> d!147559 m!1255309))

(assert (=> b!1371505 m!1255285))

(assert (=> b!1371334 d!147559))

(declare-fun d!147569 () Bool)

(assert (=> d!147569 (= (array_inv!34258 a!3861) (bvsge (size!45528 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116116 d!147569))

(declare-fun d!147571 () Bool)

(declare-fun lt!602879 () Bool)

(assert (=> d!147571 (= lt!602879 (select (content!722 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776950 () Bool)

(assert (=> d!147571 (= lt!602879 e!776950)))

(declare-fun res!914185 () Bool)

(assert (=> d!147571 (=> (not res!914185) (not e!776950))))

(assert (=> d!147571 (= res!914185 ((_ is Cons!32028) acc!866))))

(assert (=> d!147571 (= (contains!9717 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602879)))

(declare-fun b!1371516 () Bool)

(declare-fun e!776951 () Bool)

(assert (=> b!1371516 (= e!776950 e!776951)))

(declare-fun res!914186 () Bool)

(assert (=> b!1371516 (=> res!914186 e!776951)))

(assert (=> b!1371516 (= res!914186 (= (h!33246 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371517 () Bool)

(assert (=> b!1371517 (= e!776951 (contains!9717 (t!46718 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147571 res!914185) b!1371516))

(assert (= (and b!1371516 (not res!914186)) b!1371517))

(assert (=> d!147571 m!1255373))

(declare-fun m!1255445 () Bool)

(assert (=> d!147571 m!1255445))

(declare-fun m!1255447 () Bool)

(assert (=> b!1371517 m!1255447))

(assert (=> b!1371339 d!147571))

(check-sat (not d!147545) (not b!1371517) (not b!1371456) (not b!1371429) (not b!1371452) (not b!1371457) (not b!1371453) (not d!147529) (not b!1371505) (not b!1371427) (not d!147571) (not d!147559) (not b!1371493) (not b!1371431) (not b!1371421) (not d!147537) (not b!1371495) (not b!1371420) (not d!147527) (not b!1371459) (not bm!65581) (not b!1371494))
(check-sat)
