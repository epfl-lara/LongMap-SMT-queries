; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103010 () Bool)

(assert start!103010)

(declare-fun b!1237512 () Bool)

(declare-fun res!825386 () Bool)

(declare-fun e!701326 () Bool)

(assert (=> b!1237512 (=> (not res!825386) (not e!701326))))

(declare-datatypes ((List!27272 0))(
  ( (Nil!27269) (Cons!27268 (h!28477 (_ BitVec 64)) (t!40735 List!27272)) )
))
(declare-fun acc!846 () List!27272)

(declare-fun noDuplicate!1931 (List!27272) Bool)

(assert (=> b!1237512 (= res!825386 (noDuplicate!1931 acc!846))))

(declare-fun b!1237513 () Bool)

(declare-fun res!825387 () Bool)

(assert (=> b!1237513 (=> (not res!825387) (not e!701326))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79786 0))(
  ( (array!79787 (arr!38499 (Array (_ BitVec 32) (_ BitVec 64))) (size!39035 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79786)

(assert (=> b!1237513 (= res!825387 (not (= from!3213 (bvsub (size!39035 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237514 () Bool)

(declare-fun res!825380 () Bool)

(assert (=> b!1237514 (=> (not res!825380) (not e!701326))))

(declare-fun arrayNoDuplicates!0 (array!79786 (_ BitVec 32) List!27272) Bool)

(assert (=> b!1237514 (= res!825380 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237515 () Bool)

(declare-fun e!701328 () Bool)

(declare-fun lt!561077 () List!27272)

(assert (=> b!1237515 (= e!701328 (noDuplicate!1931 lt!561077))))

(declare-fun b!1237516 () Bool)

(declare-fun res!825382 () Bool)

(assert (=> b!1237516 (=> (not res!825382) (not e!701326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237516 (= res!825382 (validKeyInArray!0 (select (arr!38499 a!3835) from!3213)))))

(declare-fun res!825385 () Bool)

(assert (=> start!103010 (=> (not res!825385) (not e!701326))))

(assert (=> start!103010 (= res!825385 (and (bvslt (size!39035 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39035 a!3835))))))

(assert (=> start!103010 e!701326))

(declare-fun array_inv!29347 (array!79786) Bool)

(assert (=> start!103010 (array_inv!29347 a!3835)))

(assert (=> start!103010 true))

(declare-fun b!1237517 () Bool)

(assert (=> b!1237517 (= e!701326 (not e!701328))))

(declare-fun res!825381 () Bool)

(assert (=> b!1237517 (=> res!825381 e!701328)))

(assert (=> b!1237517 (= res!825381 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!588 (List!27272 List!27272) Bool)

(assert (=> b!1237517 (subseq!588 acc!846 lt!561077)))

(declare-datatypes ((Unit!41074 0))(
  ( (Unit!41075) )
))
(declare-fun lt!561076 () Unit!41074)

(declare-fun subseqTail!75 (List!27272 List!27272) Unit!41074)

(assert (=> b!1237517 (= lt!561076 (subseqTail!75 lt!561077 lt!561077))))

(assert (=> b!1237517 (subseq!588 lt!561077 lt!561077)))

(declare-fun lt!561075 () Unit!41074)

(declare-fun lemmaListSubSeqRefl!0 (List!27272) Unit!41074)

(assert (=> b!1237517 (= lt!561075 (lemmaListSubSeqRefl!0 lt!561077))))

(assert (=> b!1237517 (= lt!561077 (Cons!27268 (select (arr!38499 a!3835) from!3213) acc!846))))

(declare-fun b!1237518 () Bool)

(declare-fun res!825384 () Bool)

(assert (=> b!1237518 (=> (not res!825384) (not e!701326))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7334 (List!27272 (_ BitVec 64)) Bool)

(assert (=> b!1237518 (= res!825384 (contains!7334 acc!846 k0!2925))))

(declare-fun b!1237519 () Bool)

(declare-fun res!825383 () Bool)

(assert (=> b!1237519 (=> (not res!825383) (not e!701326))))

(assert (=> b!1237519 (= res!825383 (not (contains!7334 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237520 () Bool)

(declare-fun res!825388 () Bool)

(assert (=> b!1237520 (=> (not res!825388) (not e!701326))))

(assert (=> b!1237520 (= res!825388 (not (contains!7334 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103010 res!825385) b!1237512))

(assert (= (and b!1237512 res!825386) b!1237520))

(assert (= (and b!1237520 res!825388) b!1237519))

(assert (= (and b!1237519 res!825383) b!1237514))

(assert (= (and b!1237514 res!825380) b!1237518))

(assert (= (and b!1237518 res!825384) b!1237513))

(assert (= (and b!1237513 res!825387) b!1237516))

(assert (= (and b!1237516 res!825382) b!1237517))

(assert (= (and b!1237517 (not res!825381)) b!1237515))

(declare-fun m!1141227 () Bool)

(assert (=> b!1237514 m!1141227))

(declare-fun m!1141229 () Bool)

(assert (=> b!1237515 m!1141229))

(declare-fun m!1141231 () Bool)

(assert (=> b!1237518 m!1141231))

(declare-fun m!1141233 () Bool)

(assert (=> start!103010 m!1141233))

(declare-fun m!1141235 () Bool)

(assert (=> b!1237516 m!1141235))

(assert (=> b!1237516 m!1141235))

(declare-fun m!1141237 () Bool)

(assert (=> b!1237516 m!1141237))

(declare-fun m!1141239 () Bool)

(assert (=> b!1237512 m!1141239))

(declare-fun m!1141241 () Bool)

(assert (=> b!1237519 m!1141241))

(declare-fun m!1141243 () Bool)

(assert (=> b!1237517 m!1141243))

(declare-fun m!1141245 () Bool)

(assert (=> b!1237517 m!1141245))

(declare-fun m!1141247 () Bool)

(assert (=> b!1237517 m!1141247))

(declare-fun m!1141249 () Bool)

(assert (=> b!1237517 m!1141249))

(assert (=> b!1237517 m!1141235))

(declare-fun m!1141251 () Bool)

(assert (=> b!1237520 m!1141251))

(check-sat (not b!1237516) (not start!103010) (not b!1237520) (not b!1237519) (not b!1237518) (not b!1237517) (not b!1237514) (not b!1237512) (not b!1237515))
(check-sat)
(get-model)

(declare-fun d!135687 () Bool)

(declare-fun res!825420 () Bool)

(declare-fun e!701342 () Bool)

(assert (=> d!135687 (=> res!825420 e!701342)))

(get-info :version)

(assert (=> d!135687 (= res!825420 ((_ is Nil!27269) lt!561077))))

(assert (=> d!135687 (= (noDuplicate!1931 lt!561077) e!701342)))

(declare-fun b!1237552 () Bool)

(declare-fun e!701343 () Bool)

(assert (=> b!1237552 (= e!701342 e!701343)))

(declare-fun res!825421 () Bool)

(assert (=> b!1237552 (=> (not res!825421) (not e!701343))))

(assert (=> b!1237552 (= res!825421 (not (contains!7334 (t!40735 lt!561077) (h!28477 lt!561077))))))

(declare-fun b!1237553 () Bool)

(assert (=> b!1237553 (= e!701343 (noDuplicate!1931 (t!40735 lt!561077)))))

(assert (= (and d!135687 (not res!825420)) b!1237552))

(assert (= (and b!1237552 res!825421) b!1237553))

(declare-fun m!1141279 () Bool)

(assert (=> b!1237552 m!1141279))

(declare-fun m!1141281 () Bool)

(assert (=> b!1237553 m!1141281))

(assert (=> b!1237515 d!135687))

(declare-fun d!135689 () Bool)

(assert (=> d!135689 (= (validKeyInArray!0 (select (arr!38499 a!3835) from!3213)) (and (not (= (select (arr!38499 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38499 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1237516 d!135689))

(declare-fun d!135691 () Bool)

(assert (=> d!135691 (= (array_inv!29347 a!3835) (bvsge (size!39035 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103010 d!135691))

(declare-fun d!135693 () Bool)

(declare-fun res!825422 () Bool)

(declare-fun e!701344 () Bool)

(assert (=> d!135693 (=> res!825422 e!701344)))

(assert (=> d!135693 (= res!825422 ((_ is Nil!27269) acc!846))))

(assert (=> d!135693 (= (noDuplicate!1931 acc!846) e!701344)))

(declare-fun b!1237554 () Bool)

(declare-fun e!701345 () Bool)

(assert (=> b!1237554 (= e!701344 e!701345)))

(declare-fun res!825423 () Bool)

(assert (=> b!1237554 (=> (not res!825423) (not e!701345))))

(assert (=> b!1237554 (= res!825423 (not (contains!7334 (t!40735 acc!846) (h!28477 acc!846))))))

(declare-fun b!1237555 () Bool)

(assert (=> b!1237555 (= e!701345 (noDuplicate!1931 (t!40735 acc!846)))))

(assert (= (and d!135693 (not res!825422)) b!1237554))

(assert (= (and b!1237554 res!825423) b!1237555))

(declare-fun m!1141283 () Bool)

(assert (=> b!1237554 m!1141283))

(declare-fun m!1141285 () Bool)

(assert (=> b!1237555 m!1141285))

(assert (=> b!1237512 d!135693))

(declare-fun b!1237567 () Bool)

(declare-fun e!701354 () Bool)

(assert (=> b!1237567 (= e!701354 (subseq!588 acc!846 (t!40735 lt!561077)))))

(declare-fun d!135695 () Bool)

(declare-fun res!825434 () Bool)

(declare-fun e!701357 () Bool)

(assert (=> d!135695 (=> res!825434 e!701357)))

(assert (=> d!135695 (= res!825434 ((_ is Nil!27269) acc!846))))

(assert (=> d!135695 (= (subseq!588 acc!846 lt!561077) e!701357)))

(declare-fun b!1237564 () Bool)

(declare-fun e!701355 () Bool)

(assert (=> b!1237564 (= e!701357 e!701355)))

(declare-fun res!825433 () Bool)

(assert (=> b!1237564 (=> (not res!825433) (not e!701355))))

(assert (=> b!1237564 (= res!825433 ((_ is Cons!27268) lt!561077))))

(declare-fun b!1237565 () Bool)

(assert (=> b!1237565 (= e!701355 e!701354)))

(declare-fun res!825432 () Bool)

(assert (=> b!1237565 (=> res!825432 e!701354)))

(declare-fun e!701356 () Bool)

(assert (=> b!1237565 (= res!825432 e!701356)))

(declare-fun res!825435 () Bool)

(assert (=> b!1237565 (=> (not res!825435) (not e!701356))))

(assert (=> b!1237565 (= res!825435 (= (h!28477 acc!846) (h!28477 lt!561077)))))

(declare-fun b!1237566 () Bool)

(assert (=> b!1237566 (= e!701356 (subseq!588 (t!40735 acc!846) (t!40735 lt!561077)))))

(assert (= (and d!135695 (not res!825434)) b!1237564))

(assert (= (and b!1237564 res!825433) b!1237565))

(assert (= (and b!1237565 res!825435) b!1237566))

(assert (= (and b!1237565 (not res!825432)) b!1237567))

(declare-fun m!1141287 () Bool)

(assert (=> b!1237567 m!1141287))

(declare-fun m!1141289 () Bool)

(assert (=> b!1237566 m!1141289))

(assert (=> b!1237517 d!135695))

(declare-fun b!1237612 () Bool)

(declare-fun e!701397 () Bool)

(assert (=> b!1237612 (= e!701397 (subseq!588 lt!561077 lt!561077))))

(declare-fun b!1237613 () Bool)

(declare-fun e!701396 () Unit!41074)

(declare-fun e!701395 () Unit!41074)

(assert (=> b!1237613 (= e!701396 e!701395)))

(declare-fun c!120935 () Bool)

(assert (=> b!1237613 (= c!120935 (subseq!588 lt!561077 (t!40735 lt!561077)))))

(declare-fun d!135703 () Bool)

(declare-fun tail!161 (List!27272) List!27272)

(assert (=> d!135703 (subseq!588 (tail!161 lt!561077) lt!561077)))

(declare-fun lt!561096 () Unit!41074)

(assert (=> d!135703 (= lt!561096 e!701396)))

(declare-fun c!120934 () Bool)

(assert (=> d!135703 (= c!120934 (and ((_ is Cons!27268) lt!561077) ((_ is Cons!27268) lt!561077)))))

(assert (=> d!135703 e!701397))

(declare-fun res!825464 () Bool)

(assert (=> d!135703 (=> (not res!825464) (not e!701397))))

(declare-fun isEmpty!1009 (List!27272) Bool)

(assert (=> d!135703 (= res!825464 (not (isEmpty!1009 lt!561077)))))

(assert (=> d!135703 (= (subseqTail!75 lt!561077 lt!561077) lt!561096)))

(declare-fun b!1237614 () Bool)

(declare-fun Unit!41078 () Unit!41074)

(assert (=> b!1237614 (= e!701396 Unit!41078)))

(declare-fun b!1237615 () Bool)

(declare-fun c!120936 () Bool)

(assert (=> b!1237615 (= c!120936 (not (isEmpty!1009 (t!40735 lt!561077))))))

(declare-fun e!701394 () Unit!41074)

(assert (=> b!1237615 (= e!701395 e!701394)))

(declare-fun b!1237616 () Bool)

(declare-fun call!61023 () Unit!41074)

(assert (=> b!1237616 (= e!701394 call!61023)))

(declare-fun b!1237617 () Bool)

(assert (=> b!1237617 (= e!701395 call!61023)))

(declare-fun b!1237618 () Bool)

(declare-fun Unit!41079 () Unit!41074)

(assert (=> b!1237618 (= e!701394 Unit!41079)))

(declare-fun bm!61020 () Bool)

(assert (=> bm!61020 (= call!61023 (subseqTail!75 (ite c!120935 lt!561077 (t!40735 lt!561077)) (t!40735 lt!561077)))))

(assert (= (and d!135703 res!825464) b!1237612))

(assert (= (and d!135703 c!120934) b!1237613))

(assert (= (and d!135703 (not c!120934)) b!1237614))

(assert (= (and b!1237613 c!120935) b!1237617))

(assert (= (and b!1237613 (not c!120935)) b!1237615))

(assert (= (and b!1237615 c!120936) b!1237616))

(assert (= (and b!1237615 (not c!120936)) b!1237618))

(assert (= (or b!1237617 b!1237616) bm!61020))

(declare-fun m!1141311 () Bool)

(assert (=> b!1237615 m!1141311))

(declare-fun m!1141313 () Bool)

(assert (=> d!135703 m!1141313))

(assert (=> d!135703 m!1141313))

(declare-fun m!1141315 () Bool)

(assert (=> d!135703 m!1141315))

(declare-fun m!1141317 () Bool)

(assert (=> d!135703 m!1141317))

(declare-fun m!1141319 () Bool)

(assert (=> b!1237613 m!1141319))

(declare-fun m!1141321 () Bool)

(assert (=> bm!61020 m!1141321))

(assert (=> b!1237612 m!1141247))

(assert (=> b!1237517 d!135703))

(declare-fun b!1237632 () Bool)

(declare-fun e!701406 () Bool)

(assert (=> b!1237632 (= e!701406 (subseq!588 lt!561077 (t!40735 lt!561077)))))

(declare-fun d!135713 () Bool)

(declare-fun res!825473 () Bool)

(declare-fun e!701409 () Bool)

(assert (=> d!135713 (=> res!825473 e!701409)))

(assert (=> d!135713 (= res!825473 ((_ is Nil!27269) lt!561077))))

(assert (=> d!135713 (= (subseq!588 lt!561077 lt!561077) e!701409)))

(declare-fun b!1237629 () Bool)

(declare-fun e!701407 () Bool)

(assert (=> b!1237629 (= e!701409 e!701407)))

(declare-fun res!825472 () Bool)

(assert (=> b!1237629 (=> (not res!825472) (not e!701407))))

(assert (=> b!1237629 (= res!825472 ((_ is Cons!27268) lt!561077))))

(declare-fun b!1237630 () Bool)

(assert (=> b!1237630 (= e!701407 e!701406)))

(declare-fun res!825471 () Bool)

(assert (=> b!1237630 (=> res!825471 e!701406)))

(declare-fun e!701408 () Bool)

(assert (=> b!1237630 (= res!825471 e!701408)))

(declare-fun res!825474 () Bool)

(assert (=> b!1237630 (=> (not res!825474) (not e!701408))))

(assert (=> b!1237630 (= res!825474 (= (h!28477 lt!561077) (h!28477 lt!561077)))))

(declare-fun b!1237631 () Bool)

(assert (=> b!1237631 (= e!701408 (subseq!588 (t!40735 lt!561077) (t!40735 lt!561077)))))

(assert (= (and d!135713 (not res!825473)) b!1237629))

(assert (= (and b!1237629 res!825472) b!1237630))

(assert (= (and b!1237630 res!825474) b!1237631))

(assert (= (and b!1237630 (not res!825471)) b!1237632))

(assert (=> b!1237632 m!1141319))

(declare-fun m!1141323 () Bool)

(assert (=> b!1237631 m!1141323))

(assert (=> b!1237517 d!135713))

(declare-fun d!135715 () Bool)

(assert (=> d!135715 (subseq!588 lt!561077 lt!561077)))

(declare-fun lt!561099 () Unit!41074)

(declare-fun choose!36 (List!27272) Unit!41074)

(assert (=> d!135715 (= lt!561099 (choose!36 lt!561077))))

(assert (=> d!135715 (= (lemmaListSubSeqRefl!0 lt!561077) lt!561099)))

(declare-fun bs!34802 () Bool)

(assert (= bs!34802 d!135715))

(assert (=> bs!34802 m!1141247))

(declare-fun m!1141329 () Bool)

(assert (=> bs!34802 m!1141329))

(assert (=> b!1237517 d!135715))

(declare-fun d!135719 () Bool)

(declare-fun lt!561103 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!586 (List!27272) (InoxSet (_ BitVec 64)))

(assert (=> d!135719 (= lt!561103 (select (content!586 acc!846) k0!2925))))

(declare-fun e!701433 () Bool)

(assert (=> d!135719 (= lt!561103 e!701433)))

(declare-fun res!825496 () Bool)

(assert (=> d!135719 (=> (not res!825496) (not e!701433))))

(assert (=> d!135719 (= res!825496 ((_ is Cons!27268) acc!846))))

(assert (=> d!135719 (= (contains!7334 acc!846 k0!2925) lt!561103)))

(declare-fun b!1237657 () Bool)

(declare-fun e!701432 () Bool)

(assert (=> b!1237657 (= e!701433 e!701432)))

(declare-fun res!825495 () Bool)

(assert (=> b!1237657 (=> res!825495 e!701432)))

(assert (=> b!1237657 (= res!825495 (= (h!28477 acc!846) k0!2925))))

(declare-fun b!1237658 () Bool)

(assert (=> b!1237658 (= e!701432 (contains!7334 (t!40735 acc!846) k0!2925))))

(assert (= (and d!135719 res!825496) b!1237657))

(assert (= (and b!1237657 (not res!825495)) b!1237658))

(declare-fun m!1141347 () Bool)

(assert (=> d!135719 m!1141347))

(declare-fun m!1141349 () Bool)

(assert (=> d!135719 m!1141349))

(declare-fun m!1141351 () Bool)

(assert (=> b!1237658 m!1141351))

(assert (=> b!1237518 d!135719))

(declare-fun bm!61027 () Bool)

(declare-fun c!120943 () Bool)

(declare-fun call!61030 () Bool)

(assert (=> bm!61027 (= call!61030 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120943 (Cons!27268 (select (arr!38499 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1237693 () Bool)

(declare-fun e!701468 () Bool)

(declare-fun e!701467 () Bool)

(assert (=> b!1237693 (= e!701468 e!701467)))

(assert (=> b!1237693 (= c!120943 (validKeyInArray!0 (select (arr!38499 a!3835) from!3213)))))

(declare-fun d!135731 () Bool)

(declare-fun res!825529 () Bool)

(declare-fun e!701466 () Bool)

(assert (=> d!135731 (=> res!825529 e!701466)))

(assert (=> d!135731 (= res!825529 (bvsge from!3213 (size!39035 a!3835)))))

(assert (=> d!135731 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701466)))

(declare-fun b!1237694 () Bool)

(assert (=> b!1237694 (= e!701467 call!61030)))

(declare-fun b!1237695 () Bool)

(declare-fun e!701469 () Bool)

(assert (=> b!1237695 (= e!701469 (contains!7334 acc!846 (select (arr!38499 a!3835) from!3213)))))

(declare-fun b!1237696 () Bool)

(assert (=> b!1237696 (= e!701466 e!701468)))

(declare-fun res!825527 () Bool)

(assert (=> b!1237696 (=> (not res!825527) (not e!701468))))

(assert (=> b!1237696 (= res!825527 (not e!701469))))

(declare-fun res!825528 () Bool)

(assert (=> b!1237696 (=> (not res!825528) (not e!701469))))

(assert (=> b!1237696 (= res!825528 (validKeyInArray!0 (select (arr!38499 a!3835) from!3213)))))

(declare-fun b!1237697 () Bool)

(assert (=> b!1237697 (= e!701467 call!61030)))

(assert (= (and d!135731 (not res!825529)) b!1237696))

(assert (= (and b!1237696 res!825528) b!1237695))

(assert (= (and b!1237696 res!825527) b!1237693))

(assert (= (and b!1237693 c!120943) b!1237697))

(assert (= (and b!1237693 (not c!120943)) b!1237694))

(assert (= (or b!1237697 b!1237694) bm!61027))

(assert (=> bm!61027 m!1141235))

(declare-fun m!1141361 () Bool)

(assert (=> bm!61027 m!1141361))

(assert (=> b!1237693 m!1141235))

(assert (=> b!1237693 m!1141235))

(assert (=> b!1237693 m!1141237))

(assert (=> b!1237695 m!1141235))

(assert (=> b!1237695 m!1141235))

(declare-fun m!1141363 () Bool)

(assert (=> b!1237695 m!1141363))

(assert (=> b!1237696 m!1141235))

(assert (=> b!1237696 m!1141235))

(assert (=> b!1237696 m!1141237))

(assert (=> b!1237514 d!135731))

(declare-fun d!135739 () Bool)

(declare-fun lt!561104 () Bool)

(assert (=> d!135739 (= lt!561104 (select (content!586 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701473 () Bool)

(assert (=> d!135739 (= lt!561104 e!701473)))

(declare-fun res!825533 () Bool)

(assert (=> d!135739 (=> (not res!825533) (not e!701473))))

(assert (=> d!135739 (= res!825533 ((_ is Cons!27268) acc!846))))

(assert (=> d!135739 (= (contains!7334 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561104)))

(declare-fun b!1237700 () Bool)

(declare-fun e!701472 () Bool)

(assert (=> b!1237700 (= e!701473 e!701472)))

(declare-fun res!825532 () Bool)

(assert (=> b!1237700 (=> res!825532 e!701472)))

(assert (=> b!1237700 (= res!825532 (= (h!28477 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237701 () Bool)

(assert (=> b!1237701 (= e!701472 (contains!7334 (t!40735 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135739 res!825533) b!1237700))

(assert (= (and b!1237700 (not res!825532)) b!1237701))

(assert (=> d!135739 m!1141347))

(declare-fun m!1141365 () Bool)

(assert (=> d!135739 m!1141365))

(declare-fun m!1141367 () Bool)

(assert (=> b!1237701 m!1141367))

(assert (=> b!1237519 d!135739))

(declare-fun d!135741 () Bool)

(declare-fun lt!561107 () Bool)

(assert (=> d!135741 (= lt!561107 (select (content!586 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701481 () Bool)

(assert (=> d!135741 (= lt!561107 e!701481)))

(declare-fun res!825535 () Bool)

(assert (=> d!135741 (=> (not res!825535) (not e!701481))))

(assert (=> d!135741 (= res!825535 ((_ is Cons!27268) acc!846))))

(assert (=> d!135741 (= (contains!7334 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561107)))

(declare-fun b!1237714 () Bool)

(declare-fun e!701480 () Bool)

(assert (=> b!1237714 (= e!701481 e!701480)))

(declare-fun res!825534 () Bool)

(assert (=> b!1237714 (=> res!825534 e!701480)))

(assert (=> b!1237714 (= res!825534 (= (h!28477 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237715 () Bool)

(assert (=> b!1237715 (= e!701480 (contains!7334 (t!40735 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135741 res!825535) b!1237714))

(assert (= (and b!1237714 (not res!825534)) b!1237715))

(assert (=> d!135741 m!1141347))

(declare-fun m!1141369 () Bool)

(assert (=> d!135741 m!1141369))

(declare-fun m!1141371 () Bool)

(assert (=> b!1237715 m!1141371))

(assert (=> b!1237520 d!135741))

(check-sat (not b!1237552) (not b!1237615) (not b!1237696) (not b!1237554) (not b!1237612) (not b!1237695) (not b!1237631) (not d!135741) (not b!1237553) (not bm!61020) (not b!1237632) (not b!1237715) (not b!1237613) (not d!135719) (not b!1237701) (not d!135739) (not d!135715) (not d!135703) (not b!1237566) (not b!1237693) (not bm!61027) (not b!1237658) (not b!1237555) (not b!1237567))
(check-sat)
