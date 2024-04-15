; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103006 () Bool)

(assert start!103006)

(declare-fun b!1237417 () Bool)

(declare-fun res!825326 () Bool)

(declare-fun e!701285 () Bool)

(assert (=> b!1237417 (=> (not res!825326) (not e!701285))))

(declare-datatypes ((List!27333 0))(
  ( (Nil!27330) (Cons!27329 (h!28538 (_ BitVec 64)) (t!40787 List!27333)) )
))
(declare-fun acc!846 () List!27333)

(declare-fun contains!7305 (List!27333 (_ BitVec 64)) Bool)

(assert (=> b!1237417 (= res!825326 (not (contains!7305 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237418 () Bool)

(declare-fun res!825328 () Bool)

(assert (=> b!1237418 (=> (not res!825328) (not e!701285))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79705 0))(
  ( (array!79706 (arr!38459 (Array (_ BitVec 32) (_ BitVec 64))) (size!38997 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79705)

(assert (=> b!1237418 (= res!825328 (not (= from!3213 (bvsub (size!38997 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237420 () Bool)

(declare-fun res!825322 () Bool)

(assert (=> b!1237420 (=> (not res!825322) (not e!701285))))

(assert (=> b!1237420 (= res!825322 (not (contains!7305 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237421 () Bool)

(declare-fun res!825329 () Bool)

(assert (=> b!1237421 (=> (not res!825329) (not e!701285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237421 (= res!825329 (validKeyInArray!0 (select (arr!38459 a!3835) from!3213)))))

(declare-fun res!825325 () Bool)

(assert (=> start!103006 (=> (not res!825325) (not e!701285))))

(assert (=> start!103006 (= res!825325 (and (bvslt (size!38997 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38997 a!3835))))))

(assert (=> start!103006 e!701285))

(declare-fun array_inv!29442 (array!79705) Bool)

(assert (=> start!103006 (array_inv!29442 a!3835)))

(assert (=> start!103006 true))

(declare-fun b!1237419 () Bool)

(declare-fun res!825321 () Bool)

(assert (=> b!1237419 (=> (not res!825321) (not e!701285))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237419 (= res!825321 (contains!7305 acc!846 k0!2925))))

(declare-fun b!1237422 () Bool)

(declare-fun e!701283 () Bool)

(declare-fun lt!560893 () List!27333)

(declare-fun noDuplicate!1948 (List!27333) Bool)

(assert (=> b!1237422 (= e!701283 (noDuplicate!1948 lt!560893))))

(declare-fun b!1237423 () Bool)

(assert (=> b!1237423 (= e!701285 (not e!701283))))

(declare-fun res!825324 () Bool)

(assert (=> b!1237423 (=> res!825324 e!701283)))

(assert (=> b!1237423 (= res!825324 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!587 (List!27333 List!27333) Bool)

(assert (=> b!1237423 (subseq!587 acc!846 lt!560893)))

(declare-datatypes ((Unit!40917 0))(
  ( (Unit!40918) )
))
(declare-fun lt!560894 () Unit!40917)

(declare-fun subseqTail!74 (List!27333 List!27333) Unit!40917)

(assert (=> b!1237423 (= lt!560894 (subseqTail!74 lt!560893 lt!560893))))

(assert (=> b!1237423 (subseq!587 lt!560893 lt!560893)))

(declare-fun lt!560892 () Unit!40917)

(declare-fun lemmaListSubSeqRefl!0 (List!27333) Unit!40917)

(assert (=> b!1237423 (= lt!560892 (lemmaListSubSeqRefl!0 lt!560893))))

(assert (=> b!1237423 (= lt!560893 (Cons!27329 (select (arr!38459 a!3835) from!3213) acc!846))))

(declare-fun b!1237424 () Bool)

(declare-fun res!825323 () Bool)

(assert (=> b!1237424 (=> (not res!825323) (not e!701285))))

(declare-fun arrayNoDuplicates!0 (array!79705 (_ BitVec 32) List!27333) Bool)

(assert (=> b!1237424 (= res!825323 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237425 () Bool)

(declare-fun res!825327 () Bool)

(assert (=> b!1237425 (=> (not res!825327) (not e!701285))))

(assert (=> b!1237425 (= res!825327 (noDuplicate!1948 acc!846))))

(assert (= (and start!103006 res!825325) b!1237425))

(assert (= (and b!1237425 res!825327) b!1237417))

(assert (= (and b!1237417 res!825326) b!1237420))

(assert (= (and b!1237420 res!825322) b!1237424))

(assert (= (and b!1237424 res!825323) b!1237419))

(assert (= (and b!1237419 res!825321) b!1237418))

(assert (= (and b!1237418 res!825328) b!1237421))

(assert (= (and b!1237421 res!825329) b!1237423))

(assert (= (and b!1237423 (not res!825324)) b!1237422))

(declare-fun m!1140705 () Bool)

(assert (=> b!1237425 m!1140705))

(declare-fun m!1140707 () Bool)

(assert (=> start!103006 m!1140707))

(declare-fun m!1140709 () Bool)

(assert (=> b!1237423 m!1140709))

(declare-fun m!1140711 () Bool)

(assert (=> b!1237423 m!1140711))

(declare-fun m!1140713 () Bool)

(assert (=> b!1237423 m!1140713))

(declare-fun m!1140715 () Bool)

(assert (=> b!1237423 m!1140715))

(declare-fun m!1140717 () Bool)

(assert (=> b!1237423 m!1140717))

(declare-fun m!1140719 () Bool)

(assert (=> b!1237422 m!1140719))

(assert (=> b!1237421 m!1140717))

(assert (=> b!1237421 m!1140717))

(declare-fun m!1140721 () Bool)

(assert (=> b!1237421 m!1140721))

(declare-fun m!1140723 () Bool)

(assert (=> b!1237417 m!1140723))

(declare-fun m!1140725 () Bool)

(assert (=> b!1237419 m!1140725))

(declare-fun m!1140727 () Bool)

(assert (=> b!1237424 m!1140727))

(declare-fun m!1140729 () Bool)

(assert (=> b!1237420 m!1140729))

(check-sat (not b!1237422) (not b!1237417) (not b!1237419) (not b!1237424) (not b!1237421) (not start!103006) (not b!1237425) (not b!1237420) (not b!1237423))
(check-sat)
(get-model)

(declare-fun d!135571 () Bool)

(declare-fun res!825388 () Bool)

(declare-fun e!701308 () Bool)

(assert (=> d!135571 (=> res!825388 e!701308)))

(get-info :version)

(assert (=> d!135571 (= res!825388 ((_ is Nil!27330) acc!846))))

(assert (=> d!135571 (= (noDuplicate!1948 acc!846) e!701308)))

(declare-fun b!1237484 () Bool)

(declare-fun e!701309 () Bool)

(assert (=> b!1237484 (= e!701308 e!701309)))

(declare-fun res!825389 () Bool)

(assert (=> b!1237484 (=> (not res!825389) (not e!701309))))

(assert (=> b!1237484 (= res!825389 (not (contains!7305 (t!40787 acc!846) (h!28538 acc!846))))))

(declare-fun b!1237485 () Bool)

(assert (=> b!1237485 (= e!701309 (noDuplicate!1948 (t!40787 acc!846)))))

(assert (= (and d!135571 (not res!825388)) b!1237484))

(assert (= (and b!1237484 res!825389) b!1237485))

(declare-fun m!1140783 () Bool)

(assert (=> b!1237484 m!1140783))

(declare-fun m!1140785 () Bool)

(assert (=> b!1237485 m!1140785))

(assert (=> b!1237425 d!135571))

(declare-fun d!135573 () Bool)

(declare-fun lt!560915 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!584 (List!27333) (InoxSet (_ BitVec 64)))

(assert (=> d!135573 (= lt!560915 (select (content!584 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701315 () Bool)

(assert (=> d!135573 (= lt!560915 e!701315)))

(declare-fun res!825394 () Bool)

(assert (=> d!135573 (=> (not res!825394) (not e!701315))))

(assert (=> d!135573 (= res!825394 ((_ is Cons!27329) acc!846))))

(assert (=> d!135573 (= (contains!7305 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560915)))

(declare-fun b!1237490 () Bool)

(declare-fun e!701314 () Bool)

(assert (=> b!1237490 (= e!701315 e!701314)))

(declare-fun res!825395 () Bool)

(assert (=> b!1237490 (=> res!825395 e!701314)))

(assert (=> b!1237490 (= res!825395 (= (h!28538 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237491 () Bool)

(assert (=> b!1237491 (= e!701314 (contains!7305 (t!40787 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135573 res!825394) b!1237490))

(assert (= (and b!1237490 (not res!825395)) b!1237491))

(declare-fun m!1140787 () Bool)

(assert (=> d!135573 m!1140787))

(declare-fun m!1140789 () Bool)

(assert (=> d!135573 m!1140789))

(declare-fun m!1140791 () Bool)

(assert (=> b!1237491 m!1140791))

(assert (=> b!1237420 d!135573))

(declare-fun d!135575 () Bool)

(declare-fun res!825396 () Bool)

(declare-fun e!701316 () Bool)

(assert (=> d!135575 (=> res!825396 e!701316)))

(assert (=> d!135575 (= res!825396 ((_ is Nil!27330) lt!560893))))

(assert (=> d!135575 (= (noDuplicate!1948 lt!560893) e!701316)))

(declare-fun b!1237492 () Bool)

(declare-fun e!701317 () Bool)

(assert (=> b!1237492 (= e!701316 e!701317)))

(declare-fun res!825397 () Bool)

(assert (=> b!1237492 (=> (not res!825397) (not e!701317))))

(assert (=> b!1237492 (= res!825397 (not (contains!7305 (t!40787 lt!560893) (h!28538 lt!560893))))))

(declare-fun b!1237493 () Bool)

(assert (=> b!1237493 (= e!701317 (noDuplicate!1948 (t!40787 lt!560893)))))

(assert (= (and d!135575 (not res!825396)) b!1237492))

(assert (= (and b!1237492 res!825397) b!1237493))

(declare-fun m!1140793 () Bool)

(assert (=> b!1237492 m!1140793))

(declare-fun m!1140795 () Bool)

(assert (=> b!1237493 m!1140795))

(assert (=> b!1237422 d!135575))

(declare-fun d!135577 () Bool)

(assert (=> d!135577 (= (validKeyInArray!0 (select (arr!38459 a!3835) from!3213)) (and (not (= (select (arr!38459 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38459 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1237421 d!135577))

(declare-fun b!1237518 () Bool)

(declare-fun e!701340 () Bool)

(declare-fun e!701343 () Bool)

(assert (=> b!1237518 (= e!701340 e!701343)))

(declare-fun res!825421 () Bool)

(assert (=> b!1237518 (=> (not res!825421) (not e!701343))))

(assert (=> b!1237518 (= res!825421 ((_ is Cons!27329) lt!560893))))

(declare-fun b!1237519 () Bool)

(declare-fun e!701342 () Bool)

(assert (=> b!1237519 (= e!701343 e!701342)))

(declare-fun res!825419 () Bool)

(assert (=> b!1237519 (=> res!825419 e!701342)))

(declare-fun e!701341 () Bool)

(assert (=> b!1237519 (= res!825419 e!701341)))

(declare-fun res!825418 () Bool)

(assert (=> b!1237519 (=> (not res!825418) (not e!701341))))

(assert (=> b!1237519 (= res!825418 (= (h!28538 acc!846) (h!28538 lt!560893)))))

(declare-fun d!135581 () Bool)

(declare-fun res!825420 () Bool)

(assert (=> d!135581 (=> res!825420 e!701340)))

(assert (=> d!135581 (= res!825420 ((_ is Nil!27330) acc!846))))

(assert (=> d!135581 (= (subseq!587 acc!846 lt!560893) e!701340)))

(declare-fun b!1237520 () Bool)

(assert (=> b!1237520 (= e!701341 (subseq!587 (t!40787 acc!846) (t!40787 lt!560893)))))

(declare-fun b!1237521 () Bool)

(assert (=> b!1237521 (= e!701342 (subseq!587 acc!846 (t!40787 lt!560893)))))

(assert (= (and d!135581 (not res!825420)) b!1237518))

(assert (= (and b!1237518 res!825421) b!1237519))

(assert (= (and b!1237519 res!825418) b!1237520))

(assert (= (and b!1237519 (not res!825419)) b!1237521))

(declare-fun m!1140801 () Bool)

(assert (=> b!1237520 m!1140801))

(declare-fun m!1140803 () Bool)

(assert (=> b!1237521 m!1140803))

(assert (=> b!1237423 d!135581))

(declare-fun bm!61004 () Bool)

(declare-fun call!61007 () Unit!40917)

(declare-fun c!120928 () Bool)

(assert (=> bm!61004 (= call!61007 (subseqTail!74 (ite c!120928 lt!560893 (t!40787 lt!560893)) (t!40787 lt!560893)))))

(declare-fun d!135589 () Bool)

(declare-fun tail!161 (List!27333) List!27333)

(assert (=> d!135589 (subseq!587 (tail!161 lt!560893) lt!560893)))

(declare-fun lt!560924 () Unit!40917)

(declare-fun e!701384 () Unit!40917)

(assert (=> d!135589 (= lt!560924 e!701384)))

(declare-fun c!120927 () Bool)

(assert (=> d!135589 (= c!120927 (and ((_ is Cons!27329) lt!560893) ((_ is Cons!27329) lt!560893)))))

(declare-fun e!701387 () Bool)

(assert (=> d!135589 e!701387))

(declare-fun res!825449 () Bool)

(assert (=> d!135589 (=> (not res!825449) (not e!701387))))

(declare-fun isEmpty!1014 (List!27333) Bool)

(assert (=> d!135589 (= res!825449 (not (isEmpty!1014 lt!560893)))))

(assert (=> d!135589 (= (subseqTail!74 lt!560893 lt!560893) lt!560924)))

(declare-fun b!1237575 () Bool)

(declare-fun Unit!40923 () Unit!40917)

(assert (=> b!1237575 (= e!701384 Unit!40923)))

(declare-fun b!1237576 () Bool)

(declare-fun e!701386 () Unit!40917)

(assert (=> b!1237576 (= e!701386 call!61007)))

(declare-fun b!1237577 () Bool)

(declare-fun e!701385 () Unit!40917)

(assert (=> b!1237577 (= e!701385 call!61007)))

(declare-fun b!1237578 () Bool)

(assert (=> b!1237578 (= e!701387 (subseq!587 lt!560893 lt!560893))))

(declare-fun b!1237579 () Bool)

(declare-fun c!120926 () Bool)

(assert (=> b!1237579 (= c!120926 (not (isEmpty!1014 (t!40787 lt!560893))))))

(assert (=> b!1237579 (= e!701386 e!701385)))

(declare-fun b!1237580 () Bool)

(assert (=> b!1237580 (= e!701384 e!701386)))

(assert (=> b!1237580 (= c!120928 (subseq!587 lt!560893 (t!40787 lt!560893)))))

(declare-fun b!1237581 () Bool)

(declare-fun Unit!40924 () Unit!40917)

(assert (=> b!1237581 (= e!701385 Unit!40924)))

(assert (= (and d!135589 res!825449) b!1237578))

(assert (= (and d!135589 c!120927) b!1237580))

(assert (= (and d!135589 (not c!120927)) b!1237575))

(assert (= (and b!1237580 c!120928) b!1237576))

(assert (= (and b!1237580 (not c!120928)) b!1237579))

(assert (= (and b!1237579 c!120926) b!1237577))

(assert (= (and b!1237579 (not c!120926)) b!1237581))

(assert (= (or b!1237576 b!1237577) bm!61004))

(assert (=> b!1237578 m!1140713))

(declare-fun m!1140823 () Bool)

(assert (=> b!1237580 m!1140823))

(declare-fun m!1140825 () Bool)

(assert (=> bm!61004 m!1140825))

(declare-fun m!1140827 () Bool)

(assert (=> d!135589 m!1140827))

(assert (=> d!135589 m!1140827))

(declare-fun m!1140829 () Bool)

(assert (=> d!135589 m!1140829))

(declare-fun m!1140831 () Bool)

(assert (=> d!135589 m!1140831))

(declare-fun m!1140833 () Bool)

(assert (=> b!1237579 m!1140833))

(assert (=> b!1237423 d!135589))

(declare-fun b!1237582 () Bool)

(declare-fun e!701388 () Bool)

(declare-fun e!701391 () Bool)

(assert (=> b!1237582 (= e!701388 e!701391)))

(declare-fun res!825453 () Bool)

(assert (=> b!1237582 (=> (not res!825453) (not e!701391))))

(assert (=> b!1237582 (= res!825453 ((_ is Cons!27329) lt!560893))))

(declare-fun b!1237583 () Bool)

(declare-fun e!701390 () Bool)

(assert (=> b!1237583 (= e!701391 e!701390)))

(declare-fun res!825451 () Bool)

(assert (=> b!1237583 (=> res!825451 e!701390)))

(declare-fun e!701389 () Bool)

(assert (=> b!1237583 (= res!825451 e!701389)))

(declare-fun res!825450 () Bool)

(assert (=> b!1237583 (=> (not res!825450) (not e!701389))))

(assert (=> b!1237583 (= res!825450 (= (h!28538 lt!560893) (h!28538 lt!560893)))))

(declare-fun d!135601 () Bool)

(declare-fun res!825452 () Bool)

(assert (=> d!135601 (=> res!825452 e!701388)))

(assert (=> d!135601 (= res!825452 ((_ is Nil!27330) lt!560893))))

(assert (=> d!135601 (= (subseq!587 lt!560893 lt!560893) e!701388)))

(declare-fun b!1237584 () Bool)

(assert (=> b!1237584 (= e!701389 (subseq!587 (t!40787 lt!560893) (t!40787 lt!560893)))))

(declare-fun b!1237585 () Bool)

(assert (=> b!1237585 (= e!701390 (subseq!587 lt!560893 (t!40787 lt!560893)))))

(assert (= (and d!135601 (not res!825452)) b!1237582))

(assert (= (and b!1237582 res!825453) b!1237583))

(assert (= (and b!1237583 res!825450) b!1237584))

(assert (= (and b!1237583 (not res!825451)) b!1237585))

(declare-fun m!1140835 () Bool)

(assert (=> b!1237584 m!1140835))

(assert (=> b!1237585 m!1140823))

(assert (=> b!1237423 d!135601))

(declare-fun d!135603 () Bool)

(assert (=> d!135603 (subseq!587 lt!560893 lt!560893)))

(declare-fun lt!560927 () Unit!40917)

(declare-fun choose!36 (List!27333) Unit!40917)

(assert (=> d!135603 (= lt!560927 (choose!36 lt!560893))))

(assert (=> d!135603 (= (lemmaListSubSeqRefl!0 lt!560893) lt!560927)))

(declare-fun bs!34774 () Bool)

(assert (= bs!34774 d!135603))

(assert (=> bs!34774 m!1140713))

(declare-fun m!1140843 () Bool)

(assert (=> bs!34774 m!1140843))

(assert (=> b!1237423 d!135603))

(declare-fun d!135607 () Bool)

(assert (=> d!135607 (= (array_inv!29442 a!3835) (bvsge (size!38997 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103006 d!135607))

(declare-fun d!135613 () Bool)

(declare-fun lt!560930 () Bool)

(assert (=> d!135613 (= lt!560930 (select (content!584 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701407 () Bool)

(assert (=> d!135613 (= lt!560930 e!701407)))

(declare-fun res!825465 () Bool)

(assert (=> d!135613 (=> (not res!825465) (not e!701407))))

(assert (=> d!135613 (= res!825465 ((_ is Cons!27329) acc!846))))

(assert (=> d!135613 (= (contains!7305 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560930)))

(declare-fun b!1237603 () Bool)

(declare-fun e!701406 () Bool)

(assert (=> b!1237603 (= e!701407 e!701406)))

(declare-fun res!825466 () Bool)

(assert (=> b!1237603 (=> res!825466 e!701406)))

(assert (=> b!1237603 (= res!825466 (= (h!28538 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237604 () Bool)

(assert (=> b!1237604 (= e!701406 (contains!7305 (t!40787 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135613 res!825465) b!1237603))

(assert (= (and b!1237603 (not res!825466)) b!1237604))

(assert (=> d!135613 m!1140787))

(declare-fun m!1140859 () Bool)

(assert (=> d!135613 m!1140859))

(declare-fun m!1140863 () Bool)

(assert (=> b!1237604 m!1140863))

(assert (=> b!1237417 d!135613))

(declare-fun d!135615 () Bool)

(declare-fun lt!560931 () Bool)

(assert (=> d!135615 (= lt!560931 (select (content!584 acc!846) k0!2925))))

(declare-fun e!701409 () Bool)

(assert (=> d!135615 (= lt!560931 e!701409)))

(declare-fun res!825467 () Bool)

(assert (=> d!135615 (=> (not res!825467) (not e!701409))))

(assert (=> d!135615 (= res!825467 ((_ is Cons!27329) acc!846))))

(assert (=> d!135615 (= (contains!7305 acc!846 k0!2925) lt!560931)))

(declare-fun b!1237605 () Bool)

(declare-fun e!701408 () Bool)

(assert (=> b!1237605 (= e!701409 e!701408)))

(declare-fun res!825468 () Bool)

(assert (=> b!1237605 (=> res!825468 e!701408)))

(assert (=> b!1237605 (= res!825468 (= (h!28538 acc!846) k0!2925))))

(declare-fun b!1237606 () Bool)

(assert (=> b!1237606 (= e!701408 (contains!7305 (t!40787 acc!846) k0!2925))))

(assert (= (and d!135615 res!825467) b!1237605))

(assert (= (and b!1237605 (not res!825468)) b!1237606))

(assert (=> d!135615 m!1140787))

(declare-fun m!1140867 () Bool)

(assert (=> d!135615 m!1140867))

(declare-fun m!1140869 () Bool)

(assert (=> b!1237606 m!1140869))

(assert (=> b!1237419 d!135615))

(declare-fun b!1237641 () Bool)

(declare-fun e!701442 () Bool)

(declare-fun e!701444 () Bool)

(assert (=> b!1237641 (= e!701442 e!701444)))

(declare-fun res!825499 () Bool)

(assert (=> b!1237641 (=> (not res!825499) (not e!701444))))

(declare-fun e!701443 () Bool)

(assert (=> b!1237641 (= res!825499 (not e!701443))))

(declare-fun res!825501 () Bool)

(assert (=> b!1237641 (=> (not res!825501) (not e!701443))))

(assert (=> b!1237641 (= res!825501 (validKeyInArray!0 (select (arr!38459 a!3835) from!3213)))))

(declare-fun d!135619 () Bool)

(declare-fun res!825500 () Bool)

(assert (=> d!135619 (=> res!825500 e!701442)))

(assert (=> d!135619 (= res!825500 (bvsge from!3213 (size!38997 a!3835)))))

(assert (=> d!135619 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701442)))

(declare-fun b!1237642 () Bool)

(declare-fun e!701445 () Bool)

(assert (=> b!1237642 (= e!701444 e!701445)))

(declare-fun c!120934 () Bool)

(assert (=> b!1237642 (= c!120934 (validKeyInArray!0 (select (arr!38459 a!3835) from!3213)))))

(declare-fun b!1237643 () Bool)

(assert (=> b!1237643 (= e!701443 (contains!7305 acc!846 (select (arr!38459 a!3835) from!3213)))))

(declare-fun b!1237644 () Bool)

(declare-fun call!61011 () Bool)

(assert (=> b!1237644 (= e!701445 call!61011)))

(declare-fun bm!61008 () Bool)

(assert (=> bm!61008 (= call!61011 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120934 (Cons!27329 (select (arr!38459 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1237645 () Bool)

(assert (=> b!1237645 (= e!701445 call!61011)))

(assert (= (and d!135619 (not res!825500)) b!1237641))

(assert (= (and b!1237641 res!825501) b!1237643))

(assert (= (and b!1237641 res!825499) b!1237642))

(assert (= (and b!1237642 c!120934) b!1237645))

(assert (= (and b!1237642 (not c!120934)) b!1237644))

(assert (= (or b!1237645 b!1237644) bm!61008))

(assert (=> b!1237641 m!1140717))

(assert (=> b!1237641 m!1140717))

(assert (=> b!1237641 m!1140721))

(assert (=> b!1237642 m!1140717))

(assert (=> b!1237642 m!1140717))

(assert (=> b!1237642 m!1140721))

(assert (=> b!1237643 m!1140717))

(assert (=> b!1237643 m!1140717))

(declare-fun m!1140889 () Bool)

(assert (=> b!1237643 m!1140889))

(assert (=> bm!61008 m!1140717))

(declare-fun m!1140891 () Bool)

(assert (=> bm!61008 m!1140891))

(assert (=> b!1237424 d!135619))

(check-sat (not d!135615) (not d!135573) (not b!1237493) (not b!1237521) (not b!1237580) (not bm!61004) (not b!1237642) (not d!135613) (not d!135603) (not b!1237484) (not b!1237492) (not b!1237584) (not b!1237485) (not b!1237606) (not b!1237520) (not b!1237491) (not b!1237643) (not d!135589) (not b!1237578) (not b!1237579) (not b!1237585) (not b!1237641) (not bm!61008) (not b!1237604))
(check-sat)
