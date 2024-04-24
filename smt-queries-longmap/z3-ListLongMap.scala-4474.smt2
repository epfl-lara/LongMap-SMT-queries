; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62286 () Bool)

(assert start!62286)

(declare-fun b!697652 () Bool)

(declare-fun res!461461 () Bool)

(declare-fun e!396581 () Bool)

(assert (=> b!697652 (=> (not res!461461) (not e!396581))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39981 0))(
  ( (array!39982 (arr!19147 (Array (_ BitVec 32) (_ BitVec 64))) (size!19530 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39981)

(assert (=> b!697652 (= res!461461 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19530 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697653 () Bool)

(declare-fun e!396582 () Bool)

(declare-fun e!396584 () Bool)

(assert (=> b!697653 (= e!396582 e!396584)))

(declare-fun res!461471 () Bool)

(assert (=> b!697653 (=> (not res!461471) (not e!396584))))

(assert (=> b!697653 (= res!461471 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697654 () Bool)

(declare-fun res!461467 () Bool)

(assert (=> b!697654 (=> (not res!461467) (not e!396581))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697654 (= res!461467 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697655 () Bool)

(declare-fun e!396588 () Bool)

(declare-datatypes ((List!13095 0))(
  ( (Nil!13092) (Cons!13091 (h!14139 (_ BitVec 64)) (t!19369 List!13095)) )
))
(declare-fun acc!681 () List!13095)

(declare-fun contains!3747 (List!13095 (_ BitVec 64)) Bool)

(assert (=> b!697655 (= e!396588 (contains!3747 acc!681 k0!2843))))

(declare-fun b!697656 () Bool)

(declare-fun res!461464 () Bool)

(assert (=> b!697656 (=> (not res!461464) (not e!396581))))

(declare-fun noDuplicate!1021 (List!13095) Bool)

(assert (=> b!697656 (= res!461464 (noDuplicate!1021 acc!681))))

(declare-fun b!697657 () Bool)

(declare-fun res!461462 () Bool)

(assert (=> b!697657 (=> (not res!461462) (not e!396581))))

(declare-fun arrayNoDuplicates!0 (array!39981 (_ BitVec 32) List!13095) Bool)

(assert (=> b!697657 (= res!461462 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697658 () Bool)

(declare-fun res!461472 () Bool)

(assert (=> b!697658 (=> (not res!461472) (not e!396581))))

(assert (=> b!697658 (= res!461472 (not (contains!3747 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697659 () Bool)

(declare-fun res!461460 () Bool)

(assert (=> b!697659 (=> (not res!461460) (not e!396581))))

(assert (=> b!697659 (= res!461460 (not (contains!3747 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697660 () Bool)

(declare-fun res!461479 () Bool)

(assert (=> b!697660 (=> (not res!461479) (not e!396581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697660 (= res!461479 (not (validKeyInArray!0 (select (arr!19147 a!3626) from!3004))))))

(declare-fun b!697661 () Bool)

(declare-fun res!461468 () Bool)

(assert (=> b!697661 (=> (not res!461468) (not e!396581))))

(assert (=> b!697661 (= res!461468 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697662 () Bool)

(declare-fun e!396586 () Bool)

(assert (=> b!697662 (= e!396586 (contains!3747 acc!681 k0!2843))))

(declare-fun b!697663 () Bool)

(declare-fun res!461465 () Bool)

(assert (=> b!697663 (=> (not res!461465) (not e!396581))))

(assert (=> b!697663 (= res!461465 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13092))))

(declare-fun b!697664 () Bool)

(declare-fun res!461476 () Bool)

(assert (=> b!697664 (=> (not res!461476) (not e!396581))))

(assert (=> b!697664 (= res!461476 e!396582)))

(declare-fun res!461466 () Bool)

(assert (=> b!697664 (=> res!461466 e!396582)))

(assert (=> b!697664 (= res!461466 e!396588)))

(declare-fun res!461463 () Bool)

(assert (=> b!697664 (=> (not res!461463) (not e!396588))))

(assert (=> b!697664 (= res!461463 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun lt!317254 () array!39981)

(declare-fun b!697665 () Bool)

(assert (=> b!697665 (= e!396581 (not (arrayNoDuplicates!0 lt!317254 from!3004 acc!681)))))

(assert (=> b!697665 (arrayNoDuplicates!0 lt!317254 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (=> b!697665 (= lt!317254 (array!39982 (store (arr!19147 a!3626) i!1382 k0!2843) (size!19530 a!3626)))))

(declare-datatypes ((Unit!24555 0))(
  ( (Unit!24556) )
))
(declare-fun lt!317253 () Unit!24555)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39981 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13095) Unit!24555)

(assert (=> b!697665 (= lt!317253 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697666 () Bool)

(declare-fun e!396587 () Bool)

(declare-fun e!396583 () Bool)

(assert (=> b!697666 (= e!396587 e!396583)))

(declare-fun res!461459 () Bool)

(assert (=> b!697666 (=> (not res!461459) (not e!396583))))

(assert (=> b!697666 (= res!461459 (bvsle from!3004 i!1382))))

(declare-fun b!697667 () Bool)

(declare-fun res!461478 () Bool)

(assert (=> b!697667 (=> (not res!461478) (not e!396581))))

(assert (=> b!697667 (= res!461478 e!396587)))

(declare-fun res!461475 () Bool)

(assert (=> b!697667 (=> res!461475 e!396587)))

(assert (=> b!697667 (= res!461475 e!396586)))

(declare-fun res!461470 () Bool)

(assert (=> b!697667 (=> (not res!461470) (not e!396586))))

(assert (=> b!697667 (= res!461470 (bvsgt from!3004 i!1382))))

(declare-fun b!697668 () Bool)

(declare-fun res!461469 () Bool)

(assert (=> b!697668 (=> (not res!461469) (not e!396581))))

(assert (=> b!697668 (= res!461469 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697669 () Bool)

(assert (=> b!697669 (= e!396584 (not (contains!3747 acc!681 k0!2843)))))

(declare-fun b!697670 () Bool)

(declare-fun res!461473 () Bool)

(assert (=> b!697670 (=> (not res!461473) (not e!396581))))

(assert (=> b!697670 (= res!461473 (validKeyInArray!0 k0!2843))))

(declare-fun res!461474 () Bool)

(assert (=> start!62286 (=> (not res!461474) (not e!396581))))

(assert (=> start!62286 (= res!461474 (and (bvslt (size!19530 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19530 a!3626))))))

(assert (=> start!62286 e!396581))

(assert (=> start!62286 true))

(declare-fun array_inv!15006 (array!39981) Bool)

(assert (=> start!62286 (array_inv!15006 a!3626)))

(declare-fun b!697671 () Bool)

(declare-fun res!461477 () Bool)

(assert (=> b!697671 (=> (not res!461477) (not e!396581))))

(assert (=> b!697671 (= res!461477 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19530 a!3626))))))

(declare-fun b!697672 () Bool)

(assert (=> b!697672 (= e!396583 (not (contains!3747 acc!681 k0!2843)))))

(assert (= (and start!62286 res!461474) b!697656))

(assert (= (and b!697656 res!461464) b!697659))

(assert (= (and b!697659 res!461460) b!697658))

(assert (= (and b!697658 res!461472) b!697667))

(assert (= (and b!697667 res!461470) b!697662))

(assert (= (and b!697667 (not res!461475)) b!697666))

(assert (= (and b!697666 res!461459) b!697672))

(assert (= (and b!697667 res!461478) b!697663))

(assert (= (and b!697663 res!461465) b!697657))

(assert (= (and b!697657 res!461462) b!697671))

(assert (= (and b!697671 res!461477) b!697670))

(assert (= (and b!697670 res!461473) b!697654))

(assert (= (and b!697654 res!461467) b!697652))

(assert (= (and b!697652 res!461461) b!697660))

(assert (= (and b!697660 res!461479) b!697668))

(assert (= (and b!697668 res!461469) b!697664))

(assert (= (and b!697664 res!461463) b!697655))

(assert (= (and b!697664 (not res!461466)) b!697653))

(assert (= (and b!697653 res!461471) b!697669))

(assert (= (and b!697664 res!461476) b!697661))

(assert (= (and b!697661 res!461468) b!697665))

(declare-fun m!658543 () Bool)

(assert (=> b!697665 m!658543))

(declare-fun m!658545 () Bool)

(assert (=> b!697665 m!658545))

(declare-fun m!658547 () Bool)

(assert (=> b!697665 m!658547))

(declare-fun m!658549 () Bool)

(assert (=> b!697665 m!658549))

(declare-fun m!658551 () Bool)

(assert (=> b!697657 m!658551))

(declare-fun m!658553 () Bool)

(assert (=> b!697660 m!658553))

(assert (=> b!697660 m!658553))

(declare-fun m!658555 () Bool)

(assert (=> b!697660 m!658555))

(declare-fun m!658557 () Bool)

(assert (=> b!697670 m!658557))

(declare-fun m!658559 () Bool)

(assert (=> b!697672 m!658559))

(declare-fun m!658561 () Bool)

(assert (=> b!697661 m!658561))

(declare-fun m!658563 () Bool)

(assert (=> start!62286 m!658563))

(declare-fun m!658565 () Bool)

(assert (=> b!697658 m!658565))

(assert (=> b!697655 m!658559))

(assert (=> b!697662 m!658559))

(declare-fun m!658567 () Bool)

(assert (=> b!697656 m!658567))

(declare-fun m!658569 () Bool)

(assert (=> b!697654 m!658569))

(assert (=> b!697669 m!658559))

(declare-fun m!658571 () Bool)

(assert (=> b!697659 m!658571))

(declare-fun m!658573 () Bool)

(assert (=> b!697663 m!658573))

(check-sat (not b!697657) (not b!697669) (not b!697659) (not b!697663) (not start!62286) (not b!697658) (not b!697670) (not b!697660) (not b!697661) (not b!697665) (not b!697655) (not b!697656) (not b!697662) (not b!697672) (not b!697654))
(check-sat)
(get-model)

(declare-fun d!96275 () Bool)

(declare-fun lt!317269 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!326 (List!13095) (InoxSet (_ BitVec 64)))

(assert (=> d!96275 (= lt!317269 (select (content!326 acc!681) k0!2843))))

(declare-fun e!396642 () Bool)

(assert (=> d!96275 (= lt!317269 e!396642)))

(declare-fun res!461611 () Bool)

(assert (=> d!96275 (=> (not res!461611) (not e!396642))))

(get-info :version)

(assert (=> d!96275 (= res!461611 ((_ is Cons!13091) acc!681))))

(assert (=> d!96275 (= (contains!3747 acc!681 k0!2843) lt!317269)))

(declare-fun b!697803 () Bool)

(declare-fun e!396641 () Bool)

(assert (=> b!697803 (= e!396642 e!396641)))

(declare-fun res!461610 () Bool)

(assert (=> b!697803 (=> res!461610 e!396641)))

(assert (=> b!697803 (= res!461610 (= (h!14139 acc!681) k0!2843))))

(declare-fun b!697804 () Bool)

(assert (=> b!697804 (= e!396641 (contains!3747 (t!19369 acc!681) k0!2843))))

(assert (= (and d!96275 res!461611) b!697803))

(assert (= (and b!697803 (not res!461610)) b!697804))

(declare-fun m!658639 () Bool)

(assert (=> d!96275 m!658639))

(declare-fun m!658641 () Bool)

(assert (=> d!96275 m!658641))

(declare-fun m!658643 () Bool)

(assert (=> b!697804 m!658643))

(assert (=> b!697672 d!96275))

(declare-fun d!96277 () Bool)

(declare-fun res!461619 () Bool)

(declare-fun e!396654 () Bool)

(assert (=> d!96277 (=> res!461619 e!396654)))

(assert (=> d!96277 (= res!461619 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19530 a!3626)))))

(assert (=> d!96277 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!396654)))

(declare-fun b!697815 () Bool)

(declare-fun e!396652 () Bool)

(declare-fun e!396653 () Bool)

(assert (=> b!697815 (= e!396652 e!396653)))

(declare-fun c!78467 () Bool)

(assert (=> b!697815 (= c!78467 (validKeyInArray!0 (select (arr!19147 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun call!34323 () Bool)

(declare-fun bm!34320 () Bool)

(assert (=> bm!34320 (= call!34323 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78467 (Cons!13091 (select (arr!19147 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun e!396651 () Bool)

(declare-fun b!697816 () Bool)

(assert (=> b!697816 (= e!396651 (contains!3747 acc!681 (select (arr!19147 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697817 () Bool)

(assert (=> b!697817 (= e!396653 call!34323)))

(declare-fun b!697818 () Bool)

(assert (=> b!697818 (= e!396654 e!396652)))

(declare-fun res!461618 () Bool)

(assert (=> b!697818 (=> (not res!461618) (not e!396652))))

(assert (=> b!697818 (= res!461618 (not e!396651))))

(declare-fun res!461620 () Bool)

(assert (=> b!697818 (=> (not res!461620) (not e!396651))))

(assert (=> b!697818 (= res!461620 (validKeyInArray!0 (select (arr!19147 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697819 () Bool)

(assert (=> b!697819 (= e!396653 call!34323)))

(assert (= (and d!96277 (not res!461619)) b!697818))

(assert (= (and b!697818 res!461620) b!697816))

(assert (= (and b!697818 res!461618) b!697815))

(assert (= (and b!697815 c!78467) b!697819))

(assert (= (and b!697815 (not c!78467)) b!697817))

(assert (= (or b!697819 b!697817) bm!34320))

(declare-fun m!658645 () Bool)

(assert (=> b!697815 m!658645))

(assert (=> b!697815 m!658645))

(declare-fun m!658647 () Bool)

(assert (=> b!697815 m!658647))

(assert (=> bm!34320 m!658645))

(declare-fun m!658649 () Bool)

(assert (=> bm!34320 m!658649))

(assert (=> b!697816 m!658645))

(assert (=> b!697816 m!658645))

(declare-fun m!658651 () Bool)

(assert (=> b!697816 m!658651))

(assert (=> b!697818 m!658645))

(assert (=> b!697818 m!658645))

(assert (=> b!697818 m!658647))

(assert (=> b!697661 d!96277))

(declare-fun d!96279 () Bool)

(assert (=> d!96279 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!697670 d!96279))

(declare-fun d!96281 () Bool)

(declare-fun lt!317270 () Bool)

(assert (=> d!96281 (= lt!317270 (select (content!326 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!396656 () Bool)

(assert (=> d!96281 (= lt!317270 e!396656)))

(declare-fun res!461622 () Bool)

(assert (=> d!96281 (=> (not res!461622) (not e!396656))))

(assert (=> d!96281 (= res!461622 ((_ is Cons!13091) acc!681))))

(assert (=> d!96281 (= (contains!3747 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317270)))

(declare-fun b!697820 () Bool)

(declare-fun e!396655 () Bool)

(assert (=> b!697820 (= e!396656 e!396655)))

(declare-fun res!461621 () Bool)

(assert (=> b!697820 (=> res!461621 e!396655)))

(assert (=> b!697820 (= res!461621 (= (h!14139 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!697821 () Bool)

(assert (=> b!697821 (= e!396655 (contains!3747 (t!19369 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96281 res!461622) b!697820))

(assert (= (and b!697820 (not res!461621)) b!697821))

(assert (=> d!96281 m!658639))

(declare-fun m!658653 () Bool)

(assert (=> d!96281 m!658653))

(declare-fun m!658655 () Bool)

(assert (=> b!697821 m!658655))

(assert (=> b!697659 d!96281))

(declare-fun d!96283 () Bool)

(assert (=> d!96283 (= (validKeyInArray!0 (select (arr!19147 a!3626) from!3004)) (and (not (= (select (arr!19147 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19147 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!697660 d!96283))

(declare-fun d!96285 () Bool)

(declare-fun lt!317271 () Bool)

(assert (=> d!96285 (= lt!317271 (select (content!326 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!396658 () Bool)

(assert (=> d!96285 (= lt!317271 e!396658)))

(declare-fun res!461624 () Bool)

(assert (=> d!96285 (=> (not res!461624) (not e!396658))))

(assert (=> d!96285 (= res!461624 ((_ is Cons!13091) acc!681))))

(assert (=> d!96285 (= (contains!3747 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317271)))

(declare-fun b!697822 () Bool)

(declare-fun e!396657 () Bool)

(assert (=> b!697822 (= e!396658 e!396657)))

(declare-fun res!461623 () Bool)

(assert (=> b!697822 (=> res!461623 e!396657)))

(assert (=> b!697822 (= res!461623 (= (h!14139 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!697823 () Bool)

(assert (=> b!697823 (= e!396657 (contains!3747 (t!19369 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96285 res!461624) b!697822))

(assert (= (and b!697822 (not res!461623)) b!697823))

(assert (=> d!96285 m!658639))

(declare-fun m!658657 () Bool)

(assert (=> d!96285 m!658657))

(declare-fun m!658659 () Bool)

(assert (=> b!697823 m!658659))

(assert (=> b!697658 d!96285))

(assert (=> b!697669 d!96275))

(declare-fun d!96287 () Bool)

(declare-fun res!461626 () Bool)

(declare-fun e!396662 () Bool)

(assert (=> d!96287 (=> res!461626 e!396662)))

(assert (=> d!96287 (= res!461626 (bvsge from!3004 (size!19530 a!3626)))))

(assert (=> d!96287 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!396662)))

(declare-fun b!697824 () Bool)

(declare-fun e!396660 () Bool)

(declare-fun e!396661 () Bool)

(assert (=> b!697824 (= e!396660 e!396661)))

(declare-fun c!78468 () Bool)

(assert (=> b!697824 (= c!78468 (validKeyInArray!0 (select (arr!19147 a!3626) from!3004)))))

(declare-fun call!34324 () Bool)

(declare-fun bm!34321 () Bool)

(assert (=> bm!34321 (= call!34324 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78468 (Cons!13091 (select (arr!19147 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun e!396659 () Bool)

(declare-fun b!697825 () Bool)

(assert (=> b!697825 (= e!396659 (contains!3747 acc!681 (select (arr!19147 a!3626) from!3004)))))

(declare-fun b!697826 () Bool)

(assert (=> b!697826 (= e!396661 call!34324)))

(declare-fun b!697827 () Bool)

(assert (=> b!697827 (= e!396662 e!396660)))

(declare-fun res!461625 () Bool)

(assert (=> b!697827 (=> (not res!461625) (not e!396660))))

(assert (=> b!697827 (= res!461625 (not e!396659))))

(declare-fun res!461627 () Bool)

(assert (=> b!697827 (=> (not res!461627) (not e!396659))))

(assert (=> b!697827 (= res!461627 (validKeyInArray!0 (select (arr!19147 a!3626) from!3004)))))

(declare-fun b!697828 () Bool)

(assert (=> b!697828 (= e!396661 call!34324)))

(assert (= (and d!96287 (not res!461626)) b!697827))

(assert (= (and b!697827 res!461627) b!697825))

(assert (= (and b!697827 res!461625) b!697824))

(assert (= (and b!697824 c!78468) b!697828))

(assert (= (and b!697824 (not c!78468)) b!697826))

(assert (= (or b!697828 b!697826) bm!34321))

(assert (=> b!697824 m!658553))

(assert (=> b!697824 m!658553))

(assert (=> b!697824 m!658555))

(assert (=> bm!34321 m!658553))

(declare-fun m!658661 () Bool)

(assert (=> bm!34321 m!658661))

(assert (=> b!697825 m!658553))

(assert (=> b!697825 m!658553))

(declare-fun m!658663 () Bool)

(assert (=> b!697825 m!658663))

(assert (=> b!697827 m!658553))

(assert (=> b!697827 m!658553))

(assert (=> b!697827 m!658555))

(assert (=> b!697657 d!96287))

(assert (=> b!697655 d!96275))

(declare-fun d!96289 () Bool)

(declare-fun res!461632 () Bool)

(declare-fun e!396667 () Bool)

(assert (=> d!96289 (=> res!461632 e!396667)))

(assert (=> d!96289 (= res!461632 ((_ is Nil!13092) acc!681))))

(assert (=> d!96289 (= (noDuplicate!1021 acc!681) e!396667)))

(declare-fun b!697833 () Bool)

(declare-fun e!396668 () Bool)

(assert (=> b!697833 (= e!396667 e!396668)))

(declare-fun res!461633 () Bool)

(assert (=> b!697833 (=> (not res!461633) (not e!396668))))

(assert (=> b!697833 (= res!461633 (not (contains!3747 (t!19369 acc!681) (h!14139 acc!681))))))

(declare-fun b!697834 () Bool)

(assert (=> b!697834 (= e!396668 (noDuplicate!1021 (t!19369 acc!681)))))

(assert (= (and d!96289 (not res!461632)) b!697833))

(assert (= (and b!697833 res!461633) b!697834))

(declare-fun m!658665 () Bool)

(assert (=> b!697833 m!658665))

(declare-fun m!658667 () Bool)

(assert (=> b!697834 m!658667))

(assert (=> b!697656 d!96289))

(declare-fun d!96291 () Bool)

(declare-fun res!461638 () Bool)

(declare-fun e!396673 () Bool)

(assert (=> d!96291 (=> res!461638 e!396673)))

(assert (=> d!96291 (= res!461638 (= (select (arr!19147 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!96291 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!396673)))

(declare-fun b!697839 () Bool)

(declare-fun e!396674 () Bool)

(assert (=> b!697839 (= e!396673 e!396674)))

(declare-fun res!461639 () Bool)

(assert (=> b!697839 (=> (not res!461639) (not e!396674))))

(assert (=> b!697839 (= res!461639 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19530 a!3626)))))

(declare-fun b!697840 () Bool)

(assert (=> b!697840 (= e!396674 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!96291 (not res!461638)) b!697839))

(assert (= (and b!697839 res!461639) b!697840))

(declare-fun m!658669 () Bool)

(assert (=> d!96291 m!658669))

(declare-fun m!658671 () Bool)

(assert (=> b!697840 m!658671))

(assert (=> b!697654 d!96291))

(declare-fun d!96293 () Bool)

(assert (=> d!96293 (= (array_inv!15006 a!3626) (bvsge (size!19530 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!62286 d!96293))

(declare-fun d!96295 () Bool)

(declare-fun res!461641 () Bool)

(declare-fun e!396678 () Bool)

(assert (=> d!96295 (=> res!461641 e!396678)))

(assert (=> d!96295 (= res!461641 (bvsge from!3004 (size!19530 lt!317254)))))

(assert (=> d!96295 (= (arrayNoDuplicates!0 lt!317254 from!3004 acc!681) e!396678)))

(declare-fun b!697841 () Bool)

(declare-fun e!396676 () Bool)

(declare-fun e!396677 () Bool)

(assert (=> b!697841 (= e!396676 e!396677)))

(declare-fun c!78469 () Bool)

(assert (=> b!697841 (= c!78469 (validKeyInArray!0 (select (arr!19147 lt!317254) from!3004)))))

(declare-fun bm!34322 () Bool)

(declare-fun call!34325 () Bool)

(assert (=> bm!34322 (= call!34325 (arrayNoDuplicates!0 lt!317254 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78469 (Cons!13091 (select (arr!19147 lt!317254) from!3004) acc!681) acc!681)))))

(declare-fun e!396675 () Bool)

(declare-fun b!697842 () Bool)

(assert (=> b!697842 (= e!396675 (contains!3747 acc!681 (select (arr!19147 lt!317254) from!3004)))))

(declare-fun b!697843 () Bool)

(assert (=> b!697843 (= e!396677 call!34325)))

(declare-fun b!697844 () Bool)

(assert (=> b!697844 (= e!396678 e!396676)))

(declare-fun res!461640 () Bool)

(assert (=> b!697844 (=> (not res!461640) (not e!396676))))

(assert (=> b!697844 (= res!461640 (not e!396675))))

(declare-fun res!461642 () Bool)

(assert (=> b!697844 (=> (not res!461642) (not e!396675))))

(assert (=> b!697844 (= res!461642 (validKeyInArray!0 (select (arr!19147 lt!317254) from!3004)))))

(declare-fun b!697845 () Bool)

(assert (=> b!697845 (= e!396677 call!34325)))

(assert (= (and d!96295 (not res!461641)) b!697844))

(assert (= (and b!697844 res!461642) b!697842))

(assert (= (and b!697844 res!461640) b!697841))

(assert (= (and b!697841 c!78469) b!697845))

(assert (= (and b!697841 (not c!78469)) b!697843))

(assert (= (or b!697845 b!697843) bm!34322))

(declare-fun m!658673 () Bool)

(assert (=> b!697841 m!658673))

(assert (=> b!697841 m!658673))

(declare-fun m!658675 () Bool)

(assert (=> b!697841 m!658675))

(assert (=> bm!34322 m!658673))

(declare-fun m!658677 () Bool)

(assert (=> bm!34322 m!658677))

(assert (=> b!697842 m!658673))

(assert (=> b!697842 m!658673))

(declare-fun m!658679 () Bool)

(assert (=> b!697842 m!658679))

(assert (=> b!697844 m!658673))

(assert (=> b!697844 m!658673))

(assert (=> b!697844 m!658675))

(assert (=> b!697665 d!96295))

(declare-fun d!96297 () Bool)

(declare-fun res!461644 () Bool)

(declare-fun e!396682 () Bool)

(assert (=> d!96297 (=> res!461644 e!396682)))

(assert (=> d!96297 (= res!461644 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19530 lt!317254)))))

(assert (=> d!96297 (= (arrayNoDuplicates!0 lt!317254 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!396682)))

(declare-fun b!697846 () Bool)

(declare-fun e!396680 () Bool)

(declare-fun e!396681 () Bool)

(assert (=> b!697846 (= e!396680 e!396681)))

(declare-fun c!78470 () Bool)

(assert (=> b!697846 (= c!78470 (validKeyInArray!0 (select (arr!19147 lt!317254) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34323 () Bool)

(declare-fun call!34326 () Bool)

(assert (=> bm!34323 (= call!34326 (arrayNoDuplicates!0 lt!317254 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78470 (Cons!13091 (select (arr!19147 lt!317254) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun e!396679 () Bool)

(declare-fun b!697847 () Bool)

(assert (=> b!697847 (= e!396679 (contains!3747 acc!681 (select (arr!19147 lt!317254) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697848 () Bool)

(assert (=> b!697848 (= e!396681 call!34326)))

(declare-fun b!697849 () Bool)

(assert (=> b!697849 (= e!396682 e!396680)))

(declare-fun res!461643 () Bool)

(assert (=> b!697849 (=> (not res!461643) (not e!396680))))

(assert (=> b!697849 (= res!461643 (not e!396679))))

(declare-fun res!461645 () Bool)

(assert (=> b!697849 (=> (not res!461645) (not e!396679))))

(assert (=> b!697849 (= res!461645 (validKeyInArray!0 (select (arr!19147 lt!317254) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697850 () Bool)

(assert (=> b!697850 (= e!396681 call!34326)))

(assert (= (and d!96297 (not res!461644)) b!697849))

(assert (= (and b!697849 res!461645) b!697847))

(assert (= (and b!697849 res!461643) b!697846))

(assert (= (and b!697846 c!78470) b!697850))

(assert (= (and b!697846 (not c!78470)) b!697848))

(assert (= (or b!697850 b!697848) bm!34323))

(declare-fun m!658681 () Bool)

(assert (=> b!697846 m!658681))

(assert (=> b!697846 m!658681))

(declare-fun m!658683 () Bool)

(assert (=> b!697846 m!658683))

(assert (=> bm!34323 m!658681))

(declare-fun m!658685 () Bool)

(assert (=> bm!34323 m!658685))

(assert (=> b!697847 m!658681))

(assert (=> b!697847 m!658681))

(declare-fun m!658687 () Bool)

(assert (=> b!697847 m!658687))

(assert (=> b!697849 m!658681))

(assert (=> b!697849 m!658681))

(assert (=> b!697849 m!658683))

(assert (=> b!697665 d!96297))

(declare-fun d!96301 () Bool)

(declare-fun e!396693 () Bool)

(assert (=> d!96301 e!396693))

(declare-fun res!461654 () Bool)

(assert (=> d!96301 (=> (not res!461654) (not e!396693))))

(assert (=> d!96301 (= res!461654 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19530 a!3626))))))

(declare-fun lt!317274 () Unit!24555)

(declare-fun choose!41 (array!39981 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13095) Unit!24555)

(assert (=> d!96301 (= lt!317274 (choose!41 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (=> d!96301 (bvslt (size!19530 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!96301 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) lt!317274)))

(declare-fun b!697863 () Bool)

(assert (=> b!697863 (= e!396693 (arrayNoDuplicates!0 (array!39982 (store (arr!19147 a!3626) i!1382 k0!2843) (size!19530 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (= (and d!96301 res!461654) b!697863))

(declare-fun m!658689 () Bool)

(assert (=> d!96301 m!658689))

(assert (=> b!697863 m!658547))

(declare-fun m!658691 () Bool)

(assert (=> b!697863 m!658691))

(assert (=> b!697665 d!96301))

(declare-fun d!96303 () Bool)

(declare-fun res!461656 () Bool)

(declare-fun e!396697 () Bool)

(assert (=> d!96303 (=> res!461656 e!396697)))

(assert (=> d!96303 (= res!461656 (bvsge #b00000000000000000000000000000000 (size!19530 a!3626)))))

(assert (=> d!96303 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13092) e!396697)))

(declare-fun b!697864 () Bool)

(declare-fun e!396695 () Bool)

(declare-fun e!396696 () Bool)

(assert (=> b!697864 (= e!396695 e!396696)))

(declare-fun c!78473 () Bool)

(assert (=> b!697864 (= c!78473 (validKeyInArray!0 (select (arr!19147 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34326 () Bool)

(declare-fun call!34329 () Bool)

(assert (=> bm!34326 (= call!34329 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78473 (Cons!13091 (select (arr!19147 a!3626) #b00000000000000000000000000000000) Nil!13092) Nil!13092)))))

(declare-fun b!697865 () Bool)

(declare-fun e!396694 () Bool)

(assert (=> b!697865 (= e!396694 (contains!3747 Nil!13092 (select (arr!19147 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!697866 () Bool)

(assert (=> b!697866 (= e!396696 call!34329)))

(declare-fun b!697867 () Bool)

(assert (=> b!697867 (= e!396697 e!396695)))

(declare-fun res!461655 () Bool)

(assert (=> b!697867 (=> (not res!461655) (not e!396695))))

(assert (=> b!697867 (= res!461655 (not e!396694))))

(declare-fun res!461657 () Bool)

(assert (=> b!697867 (=> (not res!461657) (not e!396694))))

(assert (=> b!697867 (= res!461657 (validKeyInArray!0 (select (arr!19147 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!697868 () Bool)

(assert (=> b!697868 (= e!396696 call!34329)))

(assert (= (and d!96303 (not res!461656)) b!697867))

(assert (= (and b!697867 res!461657) b!697865))

(assert (= (and b!697867 res!461655) b!697864))

(assert (= (and b!697864 c!78473) b!697868))

(assert (= (and b!697864 (not c!78473)) b!697866))

(assert (= (or b!697868 b!697866) bm!34326))

(assert (=> b!697864 m!658669))

(assert (=> b!697864 m!658669))

(declare-fun m!658693 () Bool)

(assert (=> b!697864 m!658693))

(assert (=> bm!34326 m!658669))

(declare-fun m!658695 () Bool)

(assert (=> bm!34326 m!658695))

(assert (=> b!697865 m!658669))

(assert (=> b!697865 m!658669))

(declare-fun m!658697 () Bool)

(assert (=> b!697865 m!658697))

(assert (=> b!697867 m!658669))

(assert (=> b!697867 m!658669))

(assert (=> b!697867 m!658693))

(assert (=> b!697663 d!96303))

(assert (=> b!697662 d!96275))

(check-sat (not b!697841) (not b!697827) (not bm!34322) (not b!697816) (not d!96275) (not b!697865) (not b!697840) (not b!697849) (not b!697867) (not b!697824) (not b!697846) (not b!697842) (not bm!34321) (not b!697833) (not d!96301) (not b!697863) (not b!697834) (not bm!34326) (not b!697864) (not d!96281) (not b!697821) (not b!697823) (not bm!34323) (not b!697804) (not bm!34320) (not b!697815) (not d!96285) (not b!697825) (not b!697844) (not b!697818) (not b!697847))
(check-sat)
