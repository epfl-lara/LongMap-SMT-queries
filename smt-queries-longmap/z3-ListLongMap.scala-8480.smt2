; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103288 () Bool)

(assert start!103288)

(declare-fun b!1239488 () Bool)

(declare-fun res!826952 () Bool)

(declare-fun e!702420 () Bool)

(assert (=> b!1239488 (=> (not res!826952) (not e!702420))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79795 0))(
  ( (array!79796 (arr!38498 (Array (_ BitVec 32) (_ BitVec 64))) (size!39036 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79795)

(assert (=> b!1239488 (= res!826952 (not (= from!3213 (bvsub (size!39036 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!826946 () Bool)

(assert (=> start!103288 (=> (not res!826946) (not e!702420))))

(assert (=> start!103288 (= res!826946 (and (bvslt (size!39036 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39036 a!3835))))))

(assert (=> start!103288 e!702420))

(declare-fun array_inv!29481 (array!79795) Bool)

(assert (=> start!103288 (array_inv!29481 a!3835)))

(assert (=> start!103288 true))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun b!1239489 () Bool)

(declare-fun e!702419 () Bool)

(declare-fun arrayContainsKey!0 (array!79795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1239489 (= e!702419 (not (not (arrayContainsKey!0 a!3835 k0!2925 from!3213))))))

(assert (=> b!1239489 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-datatypes ((List!27372 0))(
  ( (Nil!27369) (Cons!27368 (h!28577 (_ BitVec 64)) (t!40826 List!27372)) )
))
(declare-fun acc!846 () List!27372)

(declare-datatypes ((Unit!41037 0))(
  ( (Unit!41038) )
))
(declare-fun lt!561596 () Unit!41037)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79795 (_ BitVec 32) (_ BitVec 64) List!27372) Unit!41037)

(assert (=> b!1239489 (= lt!561596 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1239490 () Bool)

(declare-fun e!702422 () Unit!41037)

(declare-fun lt!561592 () Unit!41037)

(assert (=> b!1239490 (= e!702422 lt!561592)))

(declare-fun lt!561594 () List!27372)

(assert (=> b!1239490 (= lt!561594 (Cons!27368 (select (arr!38498 a!3835) from!3213) acc!846))))

(declare-fun lt!561591 () Unit!41037)

(declare-fun lemmaListSubSeqRefl!0 (List!27372) Unit!41037)

(assert (=> b!1239490 (= lt!561591 (lemmaListSubSeqRefl!0 lt!561594))))

(declare-fun subseq!626 (List!27372 List!27372) Bool)

(assert (=> b!1239490 (subseq!626 lt!561594 lt!561594)))

(declare-fun lt!561595 () Unit!41037)

(declare-fun subseqTail!113 (List!27372 List!27372) Unit!41037)

(assert (=> b!1239490 (= lt!561595 (subseqTail!113 lt!561594 lt!561594))))

(assert (=> b!1239490 (subseq!626 acc!846 lt!561594)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79795 List!27372 List!27372 (_ BitVec 32)) Unit!41037)

(assert (=> b!1239490 (= lt!561592 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561594 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79795 (_ BitVec 32) List!27372) Bool)

(assert (=> b!1239490 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239491 () Bool)

(declare-fun res!826948 () Bool)

(assert (=> b!1239491 (=> (not res!826948) (not e!702420))))

(declare-fun noDuplicate!1987 (List!27372) Bool)

(assert (=> b!1239491 (= res!826948 (noDuplicate!1987 acc!846))))

(declare-fun b!1239492 () Bool)

(declare-fun res!826945 () Bool)

(assert (=> b!1239492 (=> (not res!826945) (not e!702420))))

(declare-fun contains!7344 (List!27372 (_ BitVec 64)) Bool)

(assert (=> b!1239492 (= res!826945 (not (contains!7344 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239493 () Bool)

(declare-fun res!826950 () Bool)

(assert (=> b!1239493 (=> (not res!826950) (not e!702420))))

(assert (=> b!1239493 (= res!826950 (contains!7344 acc!846 k0!2925))))

(declare-fun b!1239494 () Bool)

(declare-fun Unit!41039 () Unit!41037)

(assert (=> b!1239494 (= e!702422 Unit!41039)))

(declare-fun b!1239495 () Bool)

(declare-fun res!826947 () Bool)

(assert (=> b!1239495 (=> (not res!826947) (not e!702420))))

(assert (=> b!1239495 (= res!826947 (not (contains!7344 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239496 () Bool)

(declare-fun res!826944 () Bool)

(assert (=> b!1239496 (=> (not res!826944) (not e!702419))))

(assert (=> b!1239496 (= res!826944 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1239497 () Bool)

(declare-fun res!826951 () Bool)

(assert (=> b!1239497 (=> (not res!826951) (not e!702420))))

(assert (=> b!1239497 (= res!826951 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239498 () Bool)

(assert (=> b!1239498 (= e!702420 e!702419)))

(declare-fun res!826949 () Bool)

(assert (=> b!1239498 (=> (not res!826949) (not e!702419))))

(assert (=> b!1239498 (= res!826949 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39036 a!3835))))))

(declare-fun lt!561593 () Unit!41037)

(assert (=> b!1239498 (= lt!561593 e!702422)))

(declare-fun c!121135 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239498 (= c!121135 (validKeyInArray!0 (select (arr!38498 a!3835) from!3213)))))

(assert (= (and start!103288 res!826946) b!1239491))

(assert (= (and b!1239491 res!826948) b!1239495))

(assert (= (and b!1239495 res!826947) b!1239492))

(assert (= (and b!1239492 res!826945) b!1239497))

(assert (= (and b!1239497 res!826951) b!1239493))

(assert (= (and b!1239493 res!826950) b!1239488))

(assert (= (and b!1239488 res!826952) b!1239498))

(assert (= (and b!1239498 c!121135) b!1239490))

(assert (= (and b!1239498 (not c!121135)) b!1239494))

(assert (= (and b!1239498 res!826949) b!1239496))

(assert (= (and b!1239496 res!826944) b!1239489))

(declare-fun m!1142487 () Bool)

(assert (=> b!1239498 m!1142487))

(assert (=> b!1239498 m!1142487))

(declare-fun m!1142489 () Bool)

(assert (=> b!1239498 m!1142489))

(declare-fun m!1142491 () Bool)

(assert (=> b!1239493 m!1142491))

(declare-fun m!1142493 () Bool)

(assert (=> b!1239496 m!1142493))

(declare-fun m!1142495 () Bool)

(assert (=> b!1239497 m!1142495))

(declare-fun m!1142497 () Bool)

(assert (=> b!1239495 m!1142497))

(declare-fun m!1142499 () Bool)

(assert (=> b!1239489 m!1142499))

(declare-fun m!1142501 () Bool)

(assert (=> b!1239489 m!1142501))

(declare-fun m!1142503 () Bool)

(assert (=> b!1239489 m!1142503))

(declare-fun m!1142505 () Bool)

(assert (=> b!1239492 m!1142505))

(declare-fun m!1142507 () Bool)

(assert (=> start!103288 m!1142507))

(declare-fun m!1142509 () Bool)

(assert (=> b!1239490 m!1142509))

(declare-fun m!1142511 () Bool)

(assert (=> b!1239490 m!1142511))

(assert (=> b!1239490 m!1142493))

(declare-fun m!1142513 () Bool)

(assert (=> b!1239490 m!1142513))

(assert (=> b!1239490 m!1142487))

(declare-fun m!1142515 () Bool)

(assert (=> b!1239490 m!1142515))

(declare-fun m!1142517 () Bool)

(assert (=> b!1239490 m!1142517))

(declare-fun m!1142519 () Bool)

(assert (=> b!1239491 m!1142519))

(check-sat (not b!1239490) (not b!1239492) (not b!1239489) (not b!1239495) (not b!1239496) (not b!1239493) (not b!1239497) (not b!1239498) (not start!103288) (not b!1239491))
(check-sat)
(get-model)

(declare-fun d!135927 () Bool)

(declare-fun lt!561635 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!596 (List!27372) (InoxSet (_ BitVec 64)))

(assert (=> d!135927 (= lt!561635 (select (content!596 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702451 () Bool)

(assert (=> d!135927 (= lt!561635 e!702451)))

(declare-fun res!827011 () Bool)

(assert (=> d!135927 (=> (not res!827011) (not e!702451))))

(get-info :version)

(assert (=> d!135927 (= res!827011 ((_ is Cons!27368) acc!846))))

(assert (=> d!135927 (= (contains!7344 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561635)))

(declare-fun b!1239569 () Bool)

(declare-fun e!702452 () Bool)

(assert (=> b!1239569 (= e!702451 e!702452)))

(declare-fun res!827012 () Bool)

(assert (=> b!1239569 (=> res!827012 e!702452)))

(assert (=> b!1239569 (= res!827012 (= (h!28577 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239570 () Bool)

(assert (=> b!1239570 (= e!702452 (contains!7344 (t!40826 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135927 res!827011) b!1239569))

(assert (= (and b!1239569 (not res!827012)) b!1239570))

(declare-fun m!1142589 () Bool)

(assert (=> d!135927 m!1142589))

(declare-fun m!1142591 () Bool)

(assert (=> d!135927 m!1142591))

(declare-fun m!1142593 () Bool)

(assert (=> b!1239570 m!1142593))

(assert (=> b!1239492 d!135927))

(declare-fun b!1239581 () Bool)

(declare-fun e!702464 () Bool)

(declare-fun call!61080 () Bool)

(assert (=> b!1239581 (= e!702464 call!61080)))

(declare-fun e!702461 () Bool)

(declare-fun b!1239582 () Bool)

(assert (=> b!1239582 (= e!702461 (contains!7344 acc!846 (select (arr!38498 a!3835) from!3213)))))

(declare-fun d!135929 () Bool)

(declare-fun res!827020 () Bool)

(declare-fun e!702462 () Bool)

(assert (=> d!135929 (=> res!827020 e!702462)))

(assert (=> d!135929 (= res!827020 (bvsge from!3213 (size!39036 a!3835)))))

(assert (=> d!135929 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702462)))

(declare-fun b!1239583 () Bool)

(declare-fun e!702463 () Bool)

(assert (=> b!1239583 (= e!702462 e!702463)))

(declare-fun res!827021 () Bool)

(assert (=> b!1239583 (=> (not res!827021) (not e!702463))))

(assert (=> b!1239583 (= res!827021 (not e!702461))))

(declare-fun res!827019 () Bool)

(assert (=> b!1239583 (=> (not res!827019) (not e!702461))))

(assert (=> b!1239583 (= res!827019 (validKeyInArray!0 (select (arr!38498 a!3835) from!3213)))))

(declare-fun b!1239584 () Bool)

(assert (=> b!1239584 (= e!702464 call!61080)))

(declare-fun b!1239585 () Bool)

(assert (=> b!1239585 (= e!702463 e!702464)))

(declare-fun c!121144 () Bool)

(assert (=> b!1239585 (= c!121144 (validKeyInArray!0 (select (arr!38498 a!3835) from!3213)))))

(declare-fun bm!61077 () Bool)

(assert (=> bm!61077 (= call!61080 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121144 (Cons!27368 (select (arr!38498 a!3835) from!3213) acc!846) acc!846)))))

(assert (= (and d!135929 (not res!827020)) b!1239583))

(assert (= (and b!1239583 res!827019) b!1239582))

(assert (= (and b!1239583 res!827021) b!1239585))

(assert (= (and b!1239585 c!121144) b!1239581))

(assert (= (and b!1239585 (not c!121144)) b!1239584))

(assert (= (or b!1239581 b!1239584) bm!61077))

(assert (=> b!1239582 m!1142487))

(assert (=> b!1239582 m!1142487))

(declare-fun m!1142595 () Bool)

(assert (=> b!1239582 m!1142595))

(assert (=> b!1239583 m!1142487))

(assert (=> b!1239583 m!1142487))

(assert (=> b!1239583 m!1142489))

(assert (=> b!1239585 m!1142487))

(assert (=> b!1239585 m!1142487))

(assert (=> b!1239585 m!1142489))

(assert (=> bm!61077 m!1142487))

(declare-fun m!1142597 () Bool)

(assert (=> bm!61077 m!1142597))

(assert (=> b!1239497 d!135929))

(declare-fun d!135931 () Bool)

(declare-fun res!827026 () Bool)

(declare-fun e!702469 () Bool)

(assert (=> d!135931 (=> res!827026 e!702469)))

(assert (=> d!135931 (= res!827026 ((_ is Nil!27369) acc!846))))

(assert (=> d!135931 (= (noDuplicate!1987 acc!846) e!702469)))

(declare-fun b!1239590 () Bool)

(declare-fun e!702470 () Bool)

(assert (=> b!1239590 (= e!702469 e!702470)))

(declare-fun res!827027 () Bool)

(assert (=> b!1239590 (=> (not res!827027) (not e!702470))))

(assert (=> b!1239590 (= res!827027 (not (contains!7344 (t!40826 acc!846) (h!28577 acc!846))))))

(declare-fun b!1239591 () Bool)

(assert (=> b!1239591 (= e!702470 (noDuplicate!1987 (t!40826 acc!846)))))

(assert (= (and d!135931 (not res!827026)) b!1239590))

(assert (= (and b!1239590 res!827027) b!1239591))

(declare-fun m!1142599 () Bool)

(assert (=> b!1239590 m!1142599))

(declare-fun m!1142601 () Bool)

(assert (=> b!1239591 m!1142601))

(assert (=> b!1239491 d!135931))

(declare-fun b!1239592 () Bool)

(declare-fun e!702474 () Bool)

(declare-fun call!61081 () Bool)

(assert (=> b!1239592 (= e!702474 call!61081)))

(declare-fun b!1239593 () Bool)

(declare-fun e!702471 () Bool)

(assert (=> b!1239593 (= e!702471 (contains!7344 acc!846 (select (arr!38498 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun d!135935 () Bool)

(declare-fun res!827029 () Bool)

(declare-fun e!702472 () Bool)

(assert (=> d!135935 (=> res!827029 e!702472)))

(assert (=> d!135935 (= res!827029 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39036 a!3835)))))

(assert (=> d!135935 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846) e!702472)))

(declare-fun b!1239594 () Bool)

(declare-fun e!702473 () Bool)

(assert (=> b!1239594 (= e!702472 e!702473)))

(declare-fun res!827030 () Bool)

(assert (=> b!1239594 (=> (not res!827030) (not e!702473))))

(assert (=> b!1239594 (= res!827030 (not e!702471))))

(declare-fun res!827028 () Bool)

(assert (=> b!1239594 (=> (not res!827028) (not e!702471))))

(assert (=> b!1239594 (= res!827028 (validKeyInArray!0 (select (arr!38498 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239595 () Bool)

(assert (=> b!1239595 (= e!702474 call!61081)))

(declare-fun b!1239596 () Bool)

(assert (=> b!1239596 (= e!702473 e!702474)))

(declare-fun c!121145 () Bool)

(assert (=> b!1239596 (= c!121145 (validKeyInArray!0 (select (arr!38498 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun bm!61078 () Bool)

(assert (=> bm!61078 (= call!61081 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121145 (Cons!27368 (select (arr!38498 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) acc!846) acc!846)))))

(assert (= (and d!135935 (not res!827029)) b!1239594))

(assert (= (and b!1239594 res!827028) b!1239593))

(assert (= (and b!1239594 res!827030) b!1239596))

(assert (= (and b!1239596 c!121145) b!1239592))

(assert (= (and b!1239596 (not c!121145)) b!1239595))

(assert (= (or b!1239592 b!1239595) bm!61078))

(declare-fun m!1142603 () Bool)

(assert (=> b!1239593 m!1142603))

(assert (=> b!1239593 m!1142603))

(declare-fun m!1142605 () Bool)

(assert (=> b!1239593 m!1142605))

(assert (=> b!1239594 m!1142603))

(assert (=> b!1239594 m!1142603))

(declare-fun m!1142607 () Bool)

(assert (=> b!1239594 m!1142607))

(assert (=> b!1239596 m!1142603))

(assert (=> b!1239596 m!1142603))

(assert (=> b!1239596 m!1142607))

(assert (=> bm!61078 m!1142603))

(declare-fun m!1142609 () Bool)

(assert (=> bm!61078 m!1142609))

(assert (=> b!1239496 d!135935))

(declare-fun b!1239612 () Bool)

(declare-fun e!702490 () Bool)

(declare-fun e!702492 () Bool)

(assert (=> b!1239612 (= e!702490 e!702492)))

(declare-fun res!827048 () Bool)

(assert (=> b!1239612 (=> res!827048 e!702492)))

(declare-fun e!702489 () Bool)

(assert (=> b!1239612 (= res!827048 e!702489)))

(declare-fun res!827047 () Bool)

(assert (=> b!1239612 (=> (not res!827047) (not e!702489))))

(assert (=> b!1239612 (= res!827047 (= (h!28577 lt!561594) (h!28577 lt!561594)))))

(declare-fun b!1239613 () Bool)

(assert (=> b!1239613 (= e!702489 (subseq!626 (t!40826 lt!561594) (t!40826 lt!561594)))))

(declare-fun d!135937 () Bool)

(declare-fun res!827046 () Bool)

(declare-fun e!702491 () Bool)

(assert (=> d!135937 (=> res!827046 e!702491)))

(assert (=> d!135937 (= res!827046 ((_ is Nil!27369) lt!561594))))

(assert (=> d!135937 (= (subseq!626 lt!561594 lt!561594) e!702491)))

(declare-fun b!1239614 () Bool)

(assert (=> b!1239614 (= e!702492 (subseq!626 lt!561594 (t!40826 lt!561594)))))

(declare-fun b!1239611 () Bool)

(assert (=> b!1239611 (= e!702491 e!702490)))

(declare-fun res!827045 () Bool)

(assert (=> b!1239611 (=> (not res!827045) (not e!702490))))

(assert (=> b!1239611 (= res!827045 ((_ is Cons!27368) lt!561594))))

(assert (= (and d!135937 (not res!827046)) b!1239611))

(assert (= (and b!1239611 res!827045) b!1239612))

(assert (= (and b!1239612 res!827047) b!1239613))

(assert (= (and b!1239612 (not res!827048)) b!1239614))

(declare-fun m!1142617 () Bool)

(assert (=> b!1239613 m!1142617))

(declare-fun m!1142619 () Bool)

(assert (=> b!1239614 m!1142619))

(assert (=> b!1239490 d!135937))

(declare-fun d!135945 () Bool)

(assert (=> d!135945 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun lt!561641 () Unit!41037)

(declare-fun choose!80 (array!79795 List!27372 List!27372 (_ BitVec 32)) Unit!41037)

(assert (=> d!135945 (= lt!561641 (choose!80 a!3835 lt!561594 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> d!135945 (bvslt (size!39036 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!135945 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561594 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)) lt!561641)))

(declare-fun bs!34828 () Bool)

(assert (= bs!34828 d!135945))

(assert (=> bs!34828 m!1142493))

(declare-fun m!1142621 () Bool)

(assert (=> bs!34828 m!1142621))

(assert (=> b!1239490 d!135945))

(declare-fun b!1239636 () Bool)

(declare-fun e!702510 () Bool)

(declare-fun e!702512 () Bool)

(assert (=> b!1239636 (= e!702510 e!702512)))

(declare-fun res!827064 () Bool)

(assert (=> b!1239636 (=> res!827064 e!702512)))

(declare-fun e!702509 () Bool)

(assert (=> b!1239636 (= res!827064 e!702509)))

(declare-fun res!827063 () Bool)

(assert (=> b!1239636 (=> (not res!827063) (not e!702509))))

(assert (=> b!1239636 (= res!827063 (= (h!28577 acc!846) (h!28577 lt!561594)))))

(declare-fun b!1239637 () Bool)

(assert (=> b!1239637 (= e!702509 (subseq!626 (t!40826 acc!846) (t!40826 lt!561594)))))

(declare-fun d!135947 () Bool)

(declare-fun res!827062 () Bool)

(declare-fun e!702511 () Bool)

(assert (=> d!135947 (=> res!827062 e!702511)))

(assert (=> d!135947 (= res!827062 ((_ is Nil!27369) acc!846))))

(assert (=> d!135947 (= (subseq!626 acc!846 lt!561594) e!702511)))

(declare-fun b!1239638 () Bool)

(assert (=> b!1239638 (= e!702512 (subseq!626 acc!846 (t!40826 lt!561594)))))

(declare-fun b!1239635 () Bool)

(assert (=> b!1239635 (= e!702511 e!702510)))

(declare-fun res!827061 () Bool)

(assert (=> b!1239635 (=> (not res!827061) (not e!702510))))

(assert (=> b!1239635 (= res!827061 ((_ is Cons!27368) lt!561594))))

(assert (= (and d!135947 (not res!827062)) b!1239635))

(assert (= (and b!1239635 res!827061) b!1239636))

(assert (= (and b!1239636 res!827063) b!1239637))

(assert (= (and b!1239636 (not res!827064)) b!1239638))

(declare-fun m!1142623 () Bool)

(assert (=> b!1239637 m!1142623))

(declare-fun m!1142625 () Bool)

(assert (=> b!1239638 m!1142625))

(assert (=> b!1239490 d!135947))

(assert (=> b!1239490 d!135935))

(declare-fun d!135949 () Bool)

(assert (=> d!135949 (subseq!626 lt!561594 lt!561594)))

(declare-fun lt!561644 () Unit!41037)

(declare-fun choose!36 (List!27372) Unit!41037)

(assert (=> d!135949 (= lt!561644 (choose!36 lt!561594))))

(assert (=> d!135949 (= (lemmaListSubSeqRefl!0 lt!561594) lt!561644)))

(declare-fun bs!34829 () Bool)

(assert (= bs!34829 d!135949))

(assert (=> bs!34829 m!1142513))

(declare-fun m!1142641 () Bool)

(assert (=> bs!34829 m!1142641))

(assert (=> b!1239490 d!135949))

(declare-fun d!135953 () Bool)

(declare-fun tail!171 (List!27372) List!27372)

(assert (=> d!135953 (subseq!626 (tail!171 lt!561594) lt!561594)))

(declare-fun lt!561656 () Unit!41037)

(declare-fun e!702551 () Unit!41037)

(assert (=> d!135953 (= lt!561656 e!702551)))

(declare-fun c!121159 () Bool)

(assert (=> d!135953 (= c!121159 (and ((_ is Cons!27368) lt!561594) ((_ is Cons!27368) lt!561594)))))

(declare-fun e!702552 () Bool)

(assert (=> d!135953 e!702552))

(declare-fun res!827092 () Bool)

(assert (=> d!135953 (=> (not res!827092) (not e!702552))))

(declare-fun isEmpty!1024 (List!27372) Bool)

(assert (=> d!135953 (= res!827092 (not (isEmpty!1024 lt!561594)))))

(assert (=> d!135953 (= (subseqTail!113 lt!561594 lt!561594) lt!561656)))

(declare-fun b!1239684 () Bool)

(declare-fun e!702550 () Unit!41037)

(declare-fun Unit!41046 () Unit!41037)

(assert (=> b!1239684 (= e!702550 Unit!41046)))

(declare-fun b!1239685 () Bool)

(declare-fun Unit!41047 () Unit!41037)

(assert (=> b!1239685 (= e!702551 Unit!41047)))

(declare-fun b!1239686 () Bool)

(declare-fun e!702549 () Unit!41037)

(declare-fun call!61091 () Unit!41037)

(assert (=> b!1239686 (= e!702549 call!61091)))

(declare-fun bm!61088 () Bool)

(declare-fun c!121160 () Bool)

(assert (=> bm!61088 (= call!61091 (subseqTail!113 (ite c!121160 lt!561594 (t!40826 lt!561594)) (t!40826 lt!561594)))))

(declare-fun b!1239687 () Bool)

(assert (=> b!1239687 (= e!702552 (subseq!626 lt!561594 lt!561594))))

(declare-fun b!1239688 () Bool)

(assert (=> b!1239688 (= e!702551 e!702549)))

(assert (=> b!1239688 (= c!121160 (subseq!626 lt!561594 (t!40826 lt!561594)))))

(declare-fun b!1239689 () Bool)

(declare-fun c!121161 () Bool)

(assert (=> b!1239689 (= c!121161 (not (isEmpty!1024 (t!40826 lt!561594))))))

(assert (=> b!1239689 (= e!702549 e!702550)))

(declare-fun b!1239690 () Bool)

(assert (=> b!1239690 (= e!702550 call!61091)))

(assert (= (and d!135953 res!827092) b!1239687))

(assert (= (and d!135953 c!121159) b!1239688))

(assert (= (and d!135953 (not c!121159)) b!1239685))

(assert (= (and b!1239688 c!121160) b!1239686))

(assert (= (and b!1239688 (not c!121160)) b!1239689))

(assert (= (and b!1239689 c!121161) b!1239690))

(assert (= (and b!1239689 (not c!121161)) b!1239684))

(assert (= (or b!1239686 b!1239690) bm!61088))

(declare-fun m!1142663 () Bool)

(assert (=> bm!61088 m!1142663))

(declare-fun m!1142665 () Bool)

(assert (=> b!1239689 m!1142665))

(assert (=> b!1239688 m!1142619))

(declare-fun m!1142667 () Bool)

(assert (=> d!135953 m!1142667))

(assert (=> d!135953 m!1142667))

(declare-fun m!1142669 () Bool)

(assert (=> d!135953 m!1142669))

(declare-fun m!1142671 () Bool)

(assert (=> d!135953 m!1142671))

(assert (=> b!1239687 m!1142513))

(assert (=> b!1239490 d!135953))

(declare-fun d!135971 () Bool)

(declare-fun lt!561657 () Bool)

(assert (=> d!135971 (= lt!561657 (select (content!596 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702561 () Bool)

(assert (=> d!135971 (= lt!561657 e!702561)))

(declare-fun res!827101 () Bool)

(assert (=> d!135971 (=> (not res!827101) (not e!702561))))

(assert (=> d!135971 (= res!827101 ((_ is Cons!27368) acc!846))))

(assert (=> d!135971 (= (contains!7344 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561657)))

(declare-fun b!1239699 () Bool)

(declare-fun e!702562 () Bool)

(assert (=> b!1239699 (= e!702561 e!702562)))

(declare-fun res!827102 () Bool)

(assert (=> b!1239699 (=> res!827102 e!702562)))

(assert (=> b!1239699 (= res!827102 (= (h!28577 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239700 () Bool)

(assert (=> b!1239700 (= e!702562 (contains!7344 (t!40826 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135971 res!827101) b!1239699))

(assert (= (and b!1239699 (not res!827102)) b!1239700))

(assert (=> d!135971 m!1142589))

(declare-fun m!1142677 () Bool)

(assert (=> d!135971 m!1142677))

(declare-fun m!1142679 () Bool)

(assert (=> b!1239700 m!1142679))

(assert (=> b!1239495 d!135971))

(declare-fun d!135975 () Bool)

(declare-fun res!827109 () Bool)

(declare-fun e!702575 () Bool)

(assert (=> d!135975 (=> res!827109 e!702575)))

(assert (=> d!135975 (= res!827109 (= (select (arr!38498 a!3835) from!3213) k0!2925))))

(assert (=> d!135975 (= (arrayContainsKey!0 a!3835 k0!2925 from!3213) e!702575)))

(declare-fun b!1239719 () Bool)

(declare-fun e!702576 () Bool)

(assert (=> b!1239719 (= e!702575 e!702576)))

(declare-fun res!827110 () Bool)

(assert (=> b!1239719 (=> (not res!827110) (not e!702576))))

(assert (=> b!1239719 (= res!827110 (bvslt (bvadd from!3213 #b00000000000000000000000000000001) (size!39036 a!3835)))))

(declare-fun b!1239720 () Bool)

(assert (=> b!1239720 (= e!702576 (arrayContainsKey!0 a!3835 k0!2925 (bvadd from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!135975 (not res!827109)) b!1239719))

(assert (= (and b!1239719 res!827110) b!1239720))

(assert (=> d!135975 m!1142487))

(declare-fun m!1142681 () Bool)

(assert (=> b!1239720 m!1142681))

(assert (=> b!1239489 d!135975))

(declare-fun d!135977 () Bool)

(declare-fun res!827111 () Bool)

(declare-fun e!702577 () Bool)

(assert (=> d!135977 (=> res!827111 e!702577)))

(assert (=> d!135977 (= res!827111 (= (select (arr!38498 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) k0!2925))))

(assert (=> d!135977 (= (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)) e!702577)))

(declare-fun b!1239721 () Bool)

(declare-fun e!702578 () Bool)

(assert (=> b!1239721 (= e!702577 e!702578)))

(declare-fun res!827112 () Bool)

(assert (=> b!1239721 (=> (not res!827112) (not e!702578))))

(assert (=> b!1239721 (= res!827112 (bvslt (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (size!39036 a!3835)))))

(declare-fun b!1239722 () Bool)

(assert (=> b!1239722 (= e!702578 (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!135977 (not res!827111)) b!1239721))

(assert (= (and b!1239721 res!827112) b!1239722))

(assert (=> d!135977 m!1142603))

(declare-fun m!1142683 () Bool)

(assert (=> b!1239722 m!1142683))

(assert (=> b!1239489 d!135977))

(declare-fun d!135979 () Bool)

(assert (=> d!135979 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!561665 () Unit!41037)

(declare-fun choose!68 (array!79795 (_ BitVec 32) (_ BitVec 64) List!27372) Unit!41037)

(assert (=> d!135979 (= lt!561665 (choose!68 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(assert (=> d!135979 (bvslt (size!39036 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!135979 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846) lt!561665)))

(declare-fun bs!34833 () Bool)

(assert (= bs!34833 d!135979))

(assert (=> bs!34833 m!1142501))

(declare-fun m!1142697 () Bool)

(assert (=> bs!34833 m!1142697))

(assert (=> b!1239489 d!135979))

(declare-fun d!135983 () Bool)

(assert (=> d!135983 (= (array_inv!29481 a!3835) (bvsge (size!39036 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103288 d!135983))

(declare-fun d!135985 () Bool)

(declare-fun lt!561666 () Bool)

(assert (=> d!135985 (= lt!561666 (select (content!596 acc!846) k0!2925))))

(declare-fun e!702591 () Bool)

(assert (=> d!135985 (= lt!561666 e!702591)))

(declare-fun res!827116 () Bool)

(assert (=> d!135985 (=> (not res!827116) (not e!702591))))

(assert (=> d!135985 (= res!827116 ((_ is Cons!27368) acc!846))))

(assert (=> d!135985 (= (contains!7344 acc!846 k0!2925) lt!561666)))

(declare-fun b!1239744 () Bool)

(declare-fun e!702592 () Bool)

(assert (=> b!1239744 (= e!702591 e!702592)))

(declare-fun res!827117 () Bool)

(assert (=> b!1239744 (=> res!827117 e!702592)))

(assert (=> b!1239744 (= res!827117 (= (h!28577 acc!846) k0!2925))))

(declare-fun b!1239745 () Bool)

(assert (=> b!1239745 (= e!702592 (contains!7344 (t!40826 acc!846) k0!2925))))

(assert (= (and d!135985 res!827116) b!1239744))

(assert (= (and b!1239744 (not res!827117)) b!1239745))

(assert (=> d!135985 m!1142589))

(declare-fun m!1142699 () Bool)

(assert (=> d!135985 m!1142699))

(declare-fun m!1142701 () Bool)

(assert (=> b!1239745 m!1142701))

(assert (=> b!1239493 d!135985))

(declare-fun d!135987 () Bool)

(assert (=> d!135987 (= (validKeyInArray!0 (select (arr!38498 a!3835) from!3213)) (and (not (= (select (arr!38498 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38498 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1239498 d!135987))

(check-sat (not b!1239582) (not d!135927) (not b!1239720) (not b!1239745) (not b!1239591) (not bm!61088) (not d!135953) (not b!1239596) (not b!1239593) (not d!135971) (not b!1239583) (not b!1239637) (not bm!61077) (not b!1239585) (not d!135985) (not b!1239689) (not b!1239638) (not b!1239594) (not b!1239687) (not d!135949) (not d!135945) (not b!1239722) (not b!1239613) (not d!135979) (not b!1239614) (not b!1239700) (not b!1239590) (not bm!61078) (not b!1239570) (not b!1239688))
(check-sat)
