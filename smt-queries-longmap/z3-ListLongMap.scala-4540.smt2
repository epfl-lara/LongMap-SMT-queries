; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63150 () Bool)

(assert start!63150)

(declare-fun b!711423 () Bool)

(declare-fun res!474759 () Bool)

(declare-fun e!400277 () Bool)

(assert (=> b!711423 (=> (not res!474759) (not e!400277))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40413 0))(
  ( (array!40414 (arr!19351 (Array (_ BitVec 32) (_ BitVec 64))) (size!19753 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40413)

(assert (=> b!711423 (= res!474759 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19753 a!3591)))))

(declare-fun b!711424 () Bool)

(declare-fun res!474756 () Bool)

(assert (=> b!711424 (=> (not res!474756) (not e!400277))))

(declare-datatypes ((List!13392 0))(
  ( (Nil!13389) (Cons!13388 (h!14433 (_ BitVec 64)) (t!19698 List!13392)) )
))
(declare-fun acc!652 () List!13392)

(declare-fun noDuplicate!1216 (List!13392) Bool)

(assert (=> b!711424 (= res!474756 (noDuplicate!1216 acc!652))))

(declare-fun b!711425 () Bool)

(declare-fun res!474760 () Bool)

(assert (=> b!711425 (=> (not res!474760) (not e!400277))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!711425 (= res!474760 (validKeyInArray!0 k0!2824))))

(declare-fun b!711426 () Bool)

(declare-fun res!474738 () Bool)

(assert (=> b!711426 (=> (not res!474738) (not e!400277))))

(declare-fun newAcc!49 () List!13392)

(declare-fun subseq!414 (List!13392 List!13392) Bool)

(assert (=> b!711426 (= res!474738 (subseq!414 acc!652 newAcc!49))))

(declare-fun lt!318451 () List!13392)

(declare-fun lt!318452 () List!13392)

(declare-fun e!400276 () Bool)

(declare-fun b!711427 () Bool)

(declare-fun -!379 (List!13392 (_ BitVec 64)) List!13392)

(assert (=> b!711427 (= e!400276 (not (= (-!379 lt!318452 k0!2824) lt!318451)))))

(declare-fun b!711428 () Bool)

(declare-fun res!474741 () Bool)

(assert (=> b!711428 (=> (not res!474741) (not e!400277))))

(declare-fun contains!3969 (List!13392 (_ BitVec 64)) Bool)

(assert (=> b!711428 (= res!474741 (not (contains!3969 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711429 () Bool)

(declare-fun res!474736 () Bool)

(assert (=> b!711429 (=> (not res!474736) (not e!400277))))

(declare-fun arrayNoDuplicates!0 (array!40413 (_ BitVec 32) List!13392) Bool)

(assert (=> b!711429 (= res!474736 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!711430 () Bool)

(declare-fun res!474735 () Bool)

(assert (=> b!711430 (=> (not res!474735) (not e!400276))))

(declare-fun arrayContainsKey!0 (array!40413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!711430 (= res!474735 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711431 () Bool)

(declare-fun res!474744 () Bool)

(assert (=> b!711431 (=> (not res!474744) (not e!400277))))

(assert (=> b!711431 (= res!474744 (validKeyInArray!0 (select (arr!19351 a!3591) from!2969)))))

(declare-fun b!711432 () Bool)

(declare-fun res!474742 () Bool)

(assert (=> b!711432 (=> (not res!474742) (not e!400277))))

(assert (=> b!711432 (= res!474742 (not (contains!3969 acc!652 k0!2824)))))

(declare-fun b!711433 () Bool)

(declare-fun res!474740 () Bool)

(assert (=> b!711433 (=> (not res!474740) (not e!400277))))

(assert (=> b!711433 (= res!474740 (contains!3969 newAcc!49 k0!2824))))

(declare-fun b!711434 () Bool)

(declare-fun res!474755 () Bool)

(assert (=> b!711434 (=> (not res!474755) (not e!400276))))

(assert (=> b!711434 (= res!474755 (noDuplicate!1216 lt!318452))))

(declare-fun res!474752 () Bool)

(assert (=> start!63150 (=> (not res!474752) (not e!400277))))

(assert (=> start!63150 (= res!474752 (and (bvslt (size!19753 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19753 a!3591))))))

(assert (=> start!63150 e!400277))

(assert (=> start!63150 true))

(declare-fun array_inv!15147 (array!40413) Bool)

(assert (=> start!63150 (array_inv!15147 a!3591)))

(declare-fun b!711435 () Bool)

(declare-fun res!474750 () Bool)

(assert (=> b!711435 (=> (not res!474750) (not e!400277))))

(assert (=> b!711435 (= res!474750 (not (contains!3969 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711436 () Bool)

(declare-fun res!474747 () Bool)

(assert (=> b!711436 (=> (not res!474747) (not e!400276))))

(assert (=> b!711436 (= res!474747 (not (contains!3969 lt!318451 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711437 () Bool)

(declare-fun res!474737 () Bool)

(assert (=> b!711437 (=> (not res!474737) (not e!400276))))

(assert (=> b!711437 (= res!474737 (contains!3969 lt!318452 k0!2824))))

(declare-fun b!711438 () Bool)

(declare-fun res!474745 () Bool)

(assert (=> b!711438 (=> (not res!474745) (not e!400276))))

(assert (=> b!711438 (= res!474745 (subseq!414 lt!318451 lt!318452))))

(declare-fun b!711439 () Bool)

(declare-fun res!474748 () Bool)

(assert (=> b!711439 (=> (not res!474748) (not e!400277))))

(assert (=> b!711439 (= res!474748 (noDuplicate!1216 newAcc!49))))

(declare-fun b!711440 () Bool)

(declare-fun res!474749 () Bool)

(assert (=> b!711440 (=> (not res!474749) (not e!400277))))

(assert (=> b!711440 (= res!474749 (= (-!379 newAcc!49 k0!2824) acc!652))))

(declare-fun b!711441 () Bool)

(declare-fun res!474758 () Bool)

(assert (=> b!711441 (=> (not res!474758) (not e!400276))))

(assert (=> b!711441 (= res!474758 (noDuplicate!1216 lt!318451))))

(declare-fun b!711442 () Bool)

(declare-fun res!474743 () Bool)

(assert (=> b!711442 (=> (not res!474743) (not e!400277))))

(assert (=> b!711442 (= res!474743 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!711443 () Bool)

(declare-fun res!474739 () Bool)

(assert (=> b!711443 (=> (not res!474739) (not e!400276))))

(assert (=> b!711443 (= res!474739 (not (contains!3969 lt!318451 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711444 () Bool)

(assert (=> b!711444 (= e!400277 e!400276)))

(declare-fun res!474757 () Bool)

(assert (=> b!711444 (=> (not res!474757) (not e!400276))))

(assert (=> b!711444 (= res!474757 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!525 (List!13392 (_ BitVec 64)) List!13392)

(assert (=> b!711444 (= lt!318452 ($colon$colon!525 newAcc!49 (select (arr!19351 a!3591) from!2969)))))

(assert (=> b!711444 (= lt!318451 ($colon$colon!525 acc!652 (select (arr!19351 a!3591) from!2969)))))

(declare-fun b!711445 () Bool)

(declare-fun res!474751 () Bool)

(assert (=> b!711445 (=> (not res!474751) (not e!400276))))

(assert (=> b!711445 (= res!474751 (not (contains!3969 lt!318451 k0!2824)))))

(declare-fun b!711446 () Bool)

(declare-fun res!474753 () Bool)

(assert (=> b!711446 (=> (not res!474753) (not e!400277))))

(assert (=> b!711446 (= res!474753 (not (contains!3969 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711447 () Bool)

(declare-fun res!474746 () Bool)

(assert (=> b!711447 (=> (not res!474746) (not e!400277))))

(assert (=> b!711447 (= res!474746 (not (contains!3969 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711448 () Bool)

(declare-fun res!474754 () Bool)

(assert (=> b!711448 (=> (not res!474754) (not e!400276))))

(assert (=> b!711448 (= res!474754 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318451))))

(assert (= (and start!63150 res!474752) b!711424))

(assert (= (and b!711424 res!474756) b!711439))

(assert (= (and b!711439 res!474748) b!711435))

(assert (= (and b!711435 res!474750) b!711428))

(assert (= (and b!711428 res!474741) b!711442))

(assert (= (and b!711442 res!474743) b!711432))

(assert (= (and b!711432 res!474742) b!711425))

(assert (= (and b!711425 res!474760) b!711429))

(assert (= (and b!711429 res!474736) b!711426))

(assert (= (and b!711426 res!474738) b!711433))

(assert (= (and b!711433 res!474740) b!711440))

(assert (= (and b!711440 res!474749) b!711446))

(assert (= (and b!711446 res!474753) b!711447))

(assert (= (and b!711447 res!474746) b!711423))

(assert (= (and b!711423 res!474759) b!711431))

(assert (= (and b!711431 res!474744) b!711444))

(assert (= (and b!711444 res!474757) b!711441))

(assert (= (and b!711441 res!474758) b!711434))

(assert (= (and b!711434 res!474755) b!711436))

(assert (= (and b!711436 res!474747) b!711443))

(assert (= (and b!711443 res!474739) b!711430))

(assert (= (and b!711430 res!474735) b!711445))

(assert (= (and b!711445 res!474751) b!711448))

(assert (= (and b!711448 res!474754) b!711438))

(assert (= (and b!711438 res!474745) b!711437))

(assert (= (and b!711437 res!474737) b!711427))

(declare-fun m!668433 () Bool)

(assert (=> b!711447 m!668433))

(declare-fun m!668435 () Bool)

(assert (=> b!711440 m!668435))

(declare-fun m!668437 () Bool)

(assert (=> b!711437 m!668437))

(declare-fun m!668439 () Bool)

(assert (=> b!711436 m!668439))

(declare-fun m!668441 () Bool)

(assert (=> b!711438 m!668441))

(declare-fun m!668443 () Bool)

(assert (=> b!711430 m!668443))

(declare-fun m!668445 () Bool)

(assert (=> start!63150 m!668445))

(declare-fun m!668447 () Bool)

(assert (=> b!711445 m!668447))

(declare-fun m!668449 () Bool)

(assert (=> b!711428 m!668449))

(declare-fun m!668451 () Bool)

(assert (=> b!711434 m!668451))

(declare-fun m!668453 () Bool)

(assert (=> b!711448 m!668453))

(declare-fun m!668455 () Bool)

(assert (=> b!711444 m!668455))

(assert (=> b!711444 m!668455))

(declare-fun m!668457 () Bool)

(assert (=> b!711444 m!668457))

(assert (=> b!711444 m!668455))

(declare-fun m!668459 () Bool)

(assert (=> b!711444 m!668459))

(declare-fun m!668461 () Bool)

(assert (=> b!711427 m!668461))

(declare-fun m!668463 () Bool)

(assert (=> b!711432 m!668463))

(declare-fun m!668465 () Bool)

(assert (=> b!711441 m!668465))

(declare-fun m!668467 () Bool)

(assert (=> b!711429 m!668467))

(declare-fun m!668469 () Bool)

(assert (=> b!711443 m!668469))

(declare-fun m!668471 () Bool)

(assert (=> b!711433 m!668471))

(declare-fun m!668473 () Bool)

(assert (=> b!711442 m!668473))

(declare-fun m!668475 () Bool)

(assert (=> b!711439 m!668475))

(declare-fun m!668477 () Bool)

(assert (=> b!711426 m!668477))

(assert (=> b!711431 m!668455))

(assert (=> b!711431 m!668455))

(declare-fun m!668479 () Bool)

(assert (=> b!711431 m!668479))

(declare-fun m!668481 () Bool)

(assert (=> b!711425 m!668481))

(declare-fun m!668483 () Bool)

(assert (=> b!711424 m!668483))

(declare-fun m!668485 () Bool)

(assert (=> b!711435 m!668485))

(declare-fun m!668487 () Bool)

(assert (=> b!711446 m!668487))

(check-sat (not b!711434) (not b!711441) (not b!711443) (not b!711433) (not b!711447) (not b!711439) (not b!711432) (not b!711445) (not b!711442) (not b!711431) (not start!63150) (not b!711436) (not b!711430) (not b!711427) (not b!711437) (not b!711429) (not b!711435) (not b!711438) (not b!711428) (not b!711425) (not b!711444) (not b!711426) (not b!711446) (not b!711448) (not b!711424) (not b!711440))
(check-sat)
(get-model)

(declare-fun d!97679 () Bool)

(declare-fun res!474843 () Bool)

(declare-fun e!400291 () Bool)

(assert (=> d!97679 (=> res!474843 e!400291)))

(assert (=> d!97679 (= res!474843 (= (select (arr!19351 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97679 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!400291)))

(declare-fun b!711531 () Bool)

(declare-fun e!400292 () Bool)

(assert (=> b!711531 (= e!400291 e!400292)))

(declare-fun res!474844 () Bool)

(assert (=> b!711531 (=> (not res!474844) (not e!400292))))

(assert (=> b!711531 (= res!474844 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19753 a!3591)))))

(declare-fun b!711532 () Bool)

(assert (=> b!711532 (= e!400292 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97679 (not res!474843)) b!711531))

(assert (= (and b!711531 res!474844) b!711532))

(declare-fun m!668545 () Bool)

(assert (=> d!97679 m!668545))

(declare-fun m!668547 () Bool)

(assert (=> b!711532 m!668547))

(assert (=> b!711430 d!97679))

(declare-fun e!400301 () Bool)

(declare-fun b!711543 () Bool)

(assert (=> b!711543 (= e!400301 (contains!3969 acc!652 (select (arr!19351 a!3591) from!2969)))))

(declare-fun b!711544 () Bool)

(declare-fun e!400304 () Bool)

(declare-fun e!400303 () Bool)

(assert (=> b!711544 (= e!400304 e!400303)))

(declare-fun res!474852 () Bool)

(assert (=> b!711544 (=> (not res!474852) (not e!400303))))

(assert (=> b!711544 (= res!474852 (not e!400301))))

(declare-fun res!474851 () Bool)

(assert (=> b!711544 (=> (not res!474851) (not e!400301))))

(assert (=> b!711544 (= res!474851 (validKeyInArray!0 (select (arr!19351 a!3591) from!2969)))))

(declare-fun b!711545 () Bool)

(declare-fun e!400302 () Bool)

(declare-fun call!34518 () Bool)

(assert (=> b!711545 (= e!400302 call!34518)))

(declare-fun bm!34515 () Bool)

(declare-fun c!78713 () Bool)

(assert (=> bm!34515 (= call!34518 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78713 (Cons!13388 (select (arr!19351 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!711546 () Bool)

(assert (=> b!711546 (= e!400302 call!34518)))

(declare-fun d!97681 () Bool)

(declare-fun res!474853 () Bool)

(assert (=> d!97681 (=> res!474853 e!400304)))

(assert (=> d!97681 (= res!474853 (bvsge from!2969 (size!19753 a!3591)))))

(assert (=> d!97681 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400304)))

(declare-fun b!711547 () Bool)

(assert (=> b!711547 (= e!400303 e!400302)))

(assert (=> b!711547 (= c!78713 (validKeyInArray!0 (select (arr!19351 a!3591) from!2969)))))

(assert (= (and d!97681 (not res!474853)) b!711544))

(assert (= (and b!711544 res!474851) b!711543))

(assert (= (and b!711544 res!474852) b!711547))

(assert (= (and b!711547 c!78713) b!711545))

(assert (= (and b!711547 (not c!78713)) b!711546))

(assert (= (or b!711545 b!711546) bm!34515))

(assert (=> b!711543 m!668455))

(assert (=> b!711543 m!668455))

(declare-fun m!668549 () Bool)

(assert (=> b!711543 m!668549))

(assert (=> b!711544 m!668455))

(assert (=> b!711544 m!668455))

(assert (=> b!711544 m!668479))

(assert (=> bm!34515 m!668455))

(declare-fun m!668551 () Bool)

(assert (=> bm!34515 m!668551))

(assert (=> b!711547 m!668455))

(assert (=> b!711547 m!668455))

(assert (=> b!711547 m!668479))

(assert (=> b!711429 d!97681))

(declare-fun d!97683 () Bool)

(declare-fun lt!318461 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!355 (List!13392) (InoxSet (_ BitVec 64)))

(assert (=> d!97683 (= lt!318461 (select (content!355 newAcc!49) k0!2824))))

(declare-fun e!400310 () Bool)

(assert (=> d!97683 (= lt!318461 e!400310)))

(declare-fun res!474859 () Bool)

(assert (=> d!97683 (=> (not res!474859) (not e!400310))))

(get-info :version)

(assert (=> d!97683 (= res!474859 ((_ is Cons!13388) newAcc!49))))

(assert (=> d!97683 (= (contains!3969 newAcc!49 k0!2824) lt!318461)))

(declare-fun b!711552 () Bool)

(declare-fun e!400309 () Bool)

(assert (=> b!711552 (= e!400310 e!400309)))

(declare-fun res!474858 () Bool)

(assert (=> b!711552 (=> res!474858 e!400309)))

(assert (=> b!711552 (= res!474858 (= (h!14433 newAcc!49) k0!2824))))

(declare-fun b!711553 () Bool)

(assert (=> b!711553 (= e!400309 (contains!3969 (t!19698 newAcc!49) k0!2824))))

(assert (= (and d!97683 res!474859) b!711552))

(assert (= (and b!711552 (not res!474858)) b!711553))

(declare-fun m!668553 () Bool)

(assert (=> d!97683 m!668553))

(declare-fun m!668555 () Bool)

(assert (=> d!97683 m!668555))

(declare-fun m!668557 () Bool)

(assert (=> b!711553 m!668557))

(assert (=> b!711433 d!97683))

(declare-fun d!97689 () Bool)

(declare-fun lt!318462 () Bool)

(assert (=> d!97689 (= lt!318462 (select (content!355 acc!652) k0!2824))))

(declare-fun e!400312 () Bool)

(assert (=> d!97689 (= lt!318462 e!400312)))

(declare-fun res!474861 () Bool)

(assert (=> d!97689 (=> (not res!474861) (not e!400312))))

(assert (=> d!97689 (= res!474861 ((_ is Cons!13388) acc!652))))

(assert (=> d!97689 (= (contains!3969 acc!652 k0!2824) lt!318462)))

(declare-fun b!711554 () Bool)

(declare-fun e!400311 () Bool)

(assert (=> b!711554 (= e!400312 e!400311)))

(declare-fun res!474860 () Bool)

(assert (=> b!711554 (=> res!474860 e!400311)))

(assert (=> b!711554 (= res!474860 (= (h!14433 acc!652) k0!2824))))

(declare-fun b!711555 () Bool)

(assert (=> b!711555 (= e!400311 (contains!3969 (t!19698 acc!652) k0!2824))))

(assert (= (and d!97689 res!474861) b!711554))

(assert (= (and b!711554 (not res!474860)) b!711555))

(declare-fun m!668559 () Bool)

(assert (=> d!97689 m!668559))

(declare-fun m!668561 () Bool)

(assert (=> d!97689 m!668561))

(declare-fun m!668563 () Bool)

(assert (=> b!711555 m!668563))

(assert (=> b!711432 d!97689))

(declare-fun d!97691 () Bool)

(assert (=> d!97691 (= (validKeyInArray!0 (select (arr!19351 a!3591) from!2969)) (and (not (= (select (arr!19351 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19351 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711431 d!97691))

(declare-fun d!97693 () Bool)

(declare-fun lt!318465 () Bool)

(assert (=> d!97693 (= lt!318465 (select (content!355 lt!318451) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400325 () Bool)

(assert (=> d!97693 (= lt!318465 e!400325)))

(declare-fun res!474869 () Bool)

(assert (=> d!97693 (=> (not res!474869) (not e!400325))))

(assert (=> d!97693 (= res!474869 ((_ is Cons!13388) lt!318451))))

(assert (=> d!97693 (= (contains!3969 lt!318451 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318465)))

(declare-fun b!711570 () Bool)

(declare-fun e!400324 () Bool)

(assert (=> b!711570 (= e!400325 e!400324)))

(declare-fun res!474868 () Bool)

(assert (=> b!711570 (=> res!474868 e!400324)))

(assert (=> b!711570 (= res!474868 (= (h!14433 lt!318451) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711571 () Bool)

(assert (=> b!711571 (= e!400324 (contains!3969 (t!19698 lt!318451) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97693 res!474869) b!711570))

(assert (= (and b!711570 (not res!474868)) b!711571))

(declare-fun m!668567 () Bool)

(assert (=> d!97693 m!668567))

(declare-fun m!668569 () Bool)

(assert (=> d!97693 m!668569))

(declare-fun m!668573 () Bool)

(assert (=> b!711571 m!668573))

(assert (=> b!711436 d!97693))

(declare-fun d!97697 () Bool)

(declare-fun lt!318466 () Bool)

(assert (=> d!97697 (= lt!318466 (select (content!355 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400329 () Bool)

(assert (=> d!97697 (= lt!318466 e!400329)))

(declare-fun res!474873 () Bool)

(assert (=> d!97697 (=> (not res!474873) (not e!400329))))

(assert (=> d!97697 (= res!474873 ((_ is Cons!13388) acc!652))))

(assert (=> d!97697 (= (contains!3969 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318466)))

(declare-fun b!711574 () Bool)

(declare-fun e!400328 () Bool)

(assert (=> b!711574 (= e!400329 e!400328)))

(declare-fun res!474872 () Bool)

(assert (=> b!711574 (=> res!474872 e!400328)))

(assert (=> b!711574 (= res!474872 (= (h!14433 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711575 () Bool)

(assert (=> b!711575 (= e!400328 (contains!3969 (t!19698 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97697 res!474873) b!711574))

(assert (= (and b!711574 (not res!474872)) b!711575))

(assert (=> d!97697 m!668559))

(declare-fun m!668575 () Bool)

(assert (=> d!97697 m!668575))

(declare-fun m!668577 () Bool)

(assert (=> b!711575 m!668577))

(assert (=> b!711435 d!97697))

(declare-fun d!97699 () Bool)

(declare-fun res!474883 () Bool)

(declare-fun e!400341 () Bool)

(assert (=> d!97699 (=> res!474883 e!400341)))

(assert (=> d!97699 (= res!474883 ((_ is Nil!13389) lt!318452))))

(assert (=> d!97699 (= (noDuplicate!1216 lt!318452) e!400341)))

(declare-fun b!711589 () Bool)

(declare-fun e!400342 () Bool)

(assert (=> b!711589 (= e!400341 e!400342)))

(declare-fun res!474884 () Bool)

(assert (=> b!711589 (=> (not res!474884) (not e!400342))))

(assert (=> b!711589 (= res!474884 (not (contains!3969 (t!19698 lt!318452) (h!14433 lt!318452))))))

(declare-fun b!711590 () Bool)

(assert (=> b!711590 (= e!400342 (noDuplicate!1216 (t!19698 lt!318452)))))

(assert (= (and d!97699 (not res!474883)) b!711589))

(assert (= (and b!711589 res!474884) b!711590))

(declare-fun m!668591 () Bool)

(assert (=> b!711589 m!668591))

(declare-fun m!668593 () Bool)

(assert (=> b!711590 m!668593))

(assert (=> b!711434 d!97699))

(declare-fun b!711617 () Bool)

(declare-fun e!400367 () Bool)

(assert (=> b!711617 (= e!400367 (subseq!414 (t!19698 lt!318451) (t!19698 lt!318452)))))

(declare-fun d!97703 () Bool)

(declare-fun res!474912 () Bool)

(declare-fun e!400369 () Bool)

(assert (=> d!97703 (=> res!474912 e!400369)))

(assert (=> d!97703 (= res!474912 ((_ is Nil!13389) lt!318451))))

(assert (=> d!97703 (= (subseq!414 lt!318451 lt!318452) e!400369)))

(declare-fun b!711615 () Bool)

(declare-fun e!400368 () Bool)

(assert (=> b!711615 (= e!400369 e!400368)))

(declare-fun res!474910 () Bool)

(assert (=> b!711615 (=> (not res!474910) (not e!400368))))

(assert (=> b!711615 (= res!474910 ((_ is Cons!13388) lt!318452))))

(declare-fun b!711618 () Bool)

(declare-fun e!400370 () Bool)

(assert (=> b!711618 (= e!400370 (subseq!414 lt!318451 (t!19698 lt!318452)))))

(declare-fun b!711616 () Bool)

(assert (=> b!711616 (= e!400368 e!400370)))

(declare-fun res!474911 () Bool)

(assert (=> b!711616 (=> res!474911 e!400370)))

(assert (=> b!711616 (= res!474911 e!400367)))

(declare-fun res!474909 () Bool)

(assert (=> b!711616 (=> (not res!474909) (not e!400367))))

(assert (=> b!711616 (= res!474909 (= (h!14433 lt!318451) (h!14433 lt!318452)))))

(assert (= (and d!97703 (not res!474912)) b!711615))

(assert (= (and b!711615 res!474910) b!711616))

(assert (= (and b!711616 res!474909) b!711617))

(assert (= (and b!711616 (not res!474911)) b!711618))

(declare-fun m!668609 () Bool)

(assert (=> b!711617 m!668609))

(declare-fun m!668611 () Bool)

(assert (=> b!711618 m!668611))

(assert (=> b!711438 d!97703))

(declare-fun d!97711 () Bool)

(declare-fun lt!318472 () Bool)

(assert (=> d!97711 (= lt!318472 (select (content!355 lt!318452) k0!2824))))

(declare-fun e!400374 () Bool)

(assert (=> d!97711 (= lt!318472 e!400374)))

(declare-fun res!474916 () Bool)

(assert (=> d!97711 (=> (not res!474916) (not e!400374))))

(assert (=> d!97711 (= res!474916 ((_ is Cons!13388) lt!318452))))

(assert (=> d!97711 (= (contains!3969 lt!318452 k0!2824) lt!318472)))

(declare-fun b!711619 () Bool)

(declare-fun e!400373 () Bool)

(assert (=> b!711619 (= e!400374 e!400373)))

(declare-fun res!474915 () Bool)

(assert (=> b!711619 (=> res!474915 e!400373)))

(assert (=> b!711619 (= res!474915 (= (h!14433 lt!318452) k0!2824))))

(declare-fun b!711620 () Bool)

(assert (=> b!711620 (= e!400373 (contains!3969 (t!19698 lt!318452) k0!2824))))

(assert (= (and d!97711 res!474916) b!711619))

(assert (= (and b!711619 (not res!474915)) b!711620))

(declare-fun m!668613 () Bool)

(assert (=> d!97711 m!668613))

(declare-fun m!668615 () Bool)

(assert (=> d!97711 m!668615))

(declare-fun m!668617 () Bool)

(assert (=> b!711620 m!668617))

(assert (=> b!711437 d!97711))

(declare-fun d!97713 () Bool)

(declare-fun res!474921 () Bool)

(declare-fun e!400379 () Bool)

(assert (=> d!97713 (=> res!474921 e!400379)))

(assert (=> d!97713 (= res!474921 ((_ is Nil!13389) lt!318451))))

(assert (=> d!97713 (= (noDuplicate!1216 lt!318451) e!400379)))

(declare-fun b!711629 () Bool)

(declare-fun e!400380 () Bool)

(assert (=> b!711629 (= e!400379 e!400380)))

(declare-fun res!474922 () Bool)

(assert (=> b!711629 (=> (not res!474922) (not e!400380))))

(assert (=> b!711629 (= res!474922 (not (contains!3969 (t!19698 lt!318451) (h!14433 lt!318451))))))

(declare-fun b!711630 () Bool)

(assert (=> b!711630 (= e!400380 (noDuplicate!1216 (t!19698 lt!318451)))))

(assert (= (and d!97713 (not res!474921)) b!711629))

(assert (= (and b!711629 res!474922) b!711630))

(declare-fun m!668619 () Bool)

(assert (=> b!711629 m!668619))

(declare-fun m!668621 () Bool)

(assert (=> b!711630 m!668621))

(assert (=> b!711441 d!97713))

(declare-fun b!711670 () Bool)

(declare-fun e!400415 () List!13392)

(assert (=> b!711670 (= e!400415 Nil!13389)))

(declare-fun b!711671 () Bool)

(declare-fun e!400416 () Bool)

(declare-fun lt!318481 () List!13392)

(assert (=> b!711671 (= e!400416 (= (content!355 lt!318481) ((_ map and) (content!355 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun bm!34526 () Bool)

(declare-fun call!34529 () List!13392)

(assert (=> bm!34526 (= call!34529 (-!379 (t!19698 newAcc!49) k0!2824))))

(declare-fun b!711673 () Bool)

(declare-fun e!400414 () List!13392)

(assert (=> b!711673 (= e!400414 call!34529)))

(declare-fun b!711674 () Bool)

(assert (=> b!711674 (= e!400414 (Cons!13388 (h!14433 newAcc!49) call!34529))))

(declare-fun d!97715 () Bool)

(assert (=> d!97715 e!400416))

(declare-fun res!474946 () Bool)

(assert (=> d!97715 (=> (not res!474946) (not e!400416))))

(declare-fun size!19756 (List!13392) Int)

(assert (=> d!97715 (= res!474946 (<= (size!19756 lt!318481) (size!19756 newAcc!49)))))

(assert (=> d!97715 (= lt!318481 e!400415)))

(declare-fun c!78729 () Bool)

(assert (=> d!97715 (= c!78729 ((_ is Cons!13388) newAcc!49))))

(assert (=> d!97715 (= (-!379 newAcc!49 k0!2824) lt!318481)))

(declare-fun b!711672 () Bool)

(assert (=> b!711672 (= e!400415 e!400414)))

(declare-fun c!78730 () Bool)

(assert (=> b!711672 (= c!78730 (= k0!2824 (h!14433 newAcc!49)))))

(assert (= (and d!97715 c!78729) b!711672))

(assert (= (and d!97715 (not c!78729)) b!711670))

(assert (= (and b!711672 c!78730) b!711673))

(assert (= (and b!711672 (not c!78730)) b!711674))

(assert (= (or b!711673 b!711674) bm!34526))

(assert (= (and d!97715 res!474946) b!711671))

(declare-fun m!668649 () Bool)

(assert (=> b!711671 m!668649))

(assert (=> b!711671 m!668553))

(declare-fun m!668651 () Bool)

(assert (=> b!711671 m!668651))

(declare-fun m!668653 () Bool)

(assert (=> bm!34526 m!668653))

(declare-fun m!668655 () Bool)

(assert (=> d!97715 m!668655))

(declare-fun m!668657 () Bool)

(assert (=> d!97715 m!668657))

(assert (=> b!711440 d!97715))

(declare-fun d!97727 () Bool)

(declare-fun res!474947 () Bool)

(declare-fun e!400417 () Bool)

(assert (=> d!97727 (=> res!474947 e!400417)))

(assert (=> d!97727 (= res!474947 ((_ is Nil!13389) newAcc!49))))

(assert (=> d!97727 (= (noDuplicate!1216 newAcc!49) e!400417)))

(declare-fun b!711675 () Bool)

(declare-fun e!400418 () Bool)

(assert (=> b!711675 (= e!400417 e!400418)))

(declare-fun res!474948 () Bool)

(assert (=> b!711675 (=> (not res!474948) (not e!400418))))

(assert (=> b!711675 (= res!474948 (not (contains!3969 (t!19698 newAcc!49) (h!14433 newAcc!49))))))

(declare-fun b!711676 () Bool)

(assert (=> b!711676 (= e!400418 (noDuplicate!1216 (t!19698 newAcc!49)))))

(assert (= (and d!97727 (not res!474947)) b!711675))

(assert (= (and b!711675 res!474948) b!711676))

(declare-fun m!668659 () Bool)

(assert (=> b!711675 m!668659))

(declare-fun m!668661 () Bool)

(assert (=> b!711676 m!668661))

(assert (=> b!711439 d!97727))

(declare-fun d!97729 () Bool)

(assert (=> d!97729 (= ($colon$colon!525 newAcc!49 (select (arr!19351 a!3591) from!2969)) (Cons!13388 (select (arr!19351 a!3591) from!2969) newAcc!49))))

(assert (=> b!711444 d!97729))

(declare-fun d!97731 () Bool)

(assert (=> d!97731 (= ($colon$colon!525 acc!652 (select (arr!19351 a!3591) from!2969)) (Cons!13388 (select (arr!19351 a!3591) from!2969) acc!652))))

(assert (=> b!711444 d!97731))

(declare-fun d!97733 () Bool)

(declare-fun lt!318482 () Bool)

(assert (=> d!97733 (= lt!318482 (select (content!355 lt!318451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400420 () Bool)

(assert (=> d!97733 (= lt!318482 e!400420)))

(declare-fun res!474950 () Bool)

(assert (=> d!97733 (=> (not res!474950) (not e!400420))))

(assert (=> d!97733 (= res!474950 ((_ is Cons!13388) lt!318451))))

(assert (=> d!97733 (= (contains!3969 lt!318451 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318482)))

(declare-fun b!711677 () Bool)

(declare-fun e!400419 () Bool)

(assert (=> b!711677 (= e!400420 e!400419)))

(declare-fun res!474949 () Bool)

(assert (=> b!711677 (=> res!474949 e!400419)))

(assert (=> b!711677 (= res!474949 (= (h!14433 lt!318451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711678 () Bool)

(assert (=> b!711678 (= e!400419 (contains!3969 (t!19698 lt!318451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97733 res!474950) b!711677))

(assert (= (and b!711677 (not res!474949)) b!711678))

(assert (=> d!97733 m!668567))

(declare-fun m!668663 () Bool)

(assert (=> d!97733 m!668663))

(declare-fun m!668665 () Bool)

(assert (=> b!711678 m!668665))

(assert (=> b!711443 d!97733))

(declare-fun d!97735 () Bool)

(declare-fun res!474951 () Bool)

(declare-fun e!400421 () Bool)

(assert (=> d!97735 (=> res!474951 e!400421)))

(assert (=> d!97735 (= res!474951 (= (select (arr!19351 a!3591) from!2969) k0!2824))))

(assert (=> d!97735 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!400421)))

(declare-fun b!711679 () Bool)

(declare-fun e!400422 () Bool)

(assert (=> b!711679 (= e!400421 e!400422)))

(declare-fun res!474952 () Bool)

(assert (=> b!711679 (=> (not res!474952) (not e!400422))))

(assert (=> b!711679 (= res!474952 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19753 a!3591)))))

(declare-fun b!711680 () Bool)

(assert (=> b!711680 (= e!400422 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97735 (not res!474951)) b!711679))

(assert (= (and b!711679 res!474952) b!711680))

(assert (=> d!97735 m!668455))

(declare-fun m!668667 () Bool)

(assert (=> b!711680 m!668667))

(assert (=> b!711442 d!97735))

(declare-fun d!97737 () Bool)

(assert (=> d!97737 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711425 d!97737))

(declare-fun d!97739 () Bool)

(declare-fun lt!318483 () Bool)

(assert (=> d!97739 (= lt!318483 (select (content!355 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400434 () Bool)

(assert (=> d!97739 (= lt!318483 e!400434)))

(declare-fun res!474963 () Bool)

(assert (=> d!97739 (=> (not res!474963) (not e!400434))))

(assert (=> d!97739 (= res!474963 ((_ is Cons!13388) newAcc!49))))

(assert (=> d!97739 (= (contains!3969 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318483)))

(declare-fun b!711690 () Bool)

(declare-fun e!400433 () Bool)

(assert (=> b!711690 (= e!400434 e!400433)))

(declare-fun res!474962 () Bool)

(assert (=> b!711690 (=> res!474962 e!400433)))

(assert (=> b!711690 (= res!474962 (= (h!14433 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711691 () Bool)

(assert (=> b!711691 (= e!400433 (contains!3969 (t!19698 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97739 res!474963) b!711690))

(assert (= (and b!711690 (not res!474962)) b!711691))

(assert (=> d!97739 m!668553))

(declare-fun m!668669 () Bool)

(assert (=> d!97739 m!668669))

(declare-fun m!668671 () Bool)

(assert (=> b!711691 m!668671))

(assert (=> b!711446 d!97739))

(declare-fun d!97741 () Bool)

(declare-fun lt!318484 () Bool)

(assert (=> d!97741 (= lt!318484 (select (content!355 lt!318451) k0!2824))))

(declare-fun e!400438 () Bool)

(assert (=> d!97741 (= lt!318484 e!400438)))

(declare-fun res!474967 () Bool)

(assert (=> d!97741 (=> (not res!474967) (not e!400438))))

(assert (=> d!97741 (= res!474967 ((_ is Cons!13388) lt!318451))))

(assert (=> d!97741 (= (contains!3969 lt!318451 k0!2824) lt!318484)))

(declare-fun b!711696 () Bool)

(declare-fun e!400437 () Bool)

(assert (=> b!711696 (= e!400438 e!400437)))

(declare-fun res!474966 () Bool)

(assert (=> b!711696 (=> res!474966 e!400437)))

(assert (=> b!711696 (= res!474966 (= (h!14433 lt!318451) k0!2824))))

(declare-fun b!711697 () Bool)

(assert (=> b!711697 (= e!400437 (contains!3969 (t!19698 lt!318451) k0!2824))))

(assert (= (and d!97741 res!474967) b!711696))

(assert (= (and b!711696 (not res!474966)) b!711697))

(assert (=> d!97741 m!668567))

(declare-fun m!668677 () Bool)

(assert (=> d!97741 m!668677))

(declare-fun m!668679 () Bool)

(assert (=> b!711697 m!668679))

(assert (=> b!711445 d!97741))

(declare-fun d!97745 () Bool)

(declare-fun res!474968 () Bool)

(declare-fun e!400439 () Bool)

(assert (=> d!97745 (=> res!474968 e!400439)))

(assert (=> d!97745 (= res!474968 ((_ is Nil!13389) acc!652))))

(assert (=> d!97745 (= (noDuplicate!1216 acc!652) e!400439)))

(declare-fun b!711698 () Bool)

(declare-fun e!400440 () Bool)

(assert (=> b!711698 (= e!400439 e!400440)))

(declare-fun res!474969 () Bool)

(assert (=> b!711698 (=> (not res!474969) (not e!400440))))

(assert (=> b!711698 (= res!474969 (not (contains!3969 (t!19698 acc!652) (h!14433 acc!652))))))

(declare-fun b!711699 () Bool)

(assert (=> b!711699 (= e!400440 (noDuplicate!1216 (t!19698 acc!652)))))

(assert (= (and d!97745 (not res!474968)) b!711698))

(assert (= (and b!711698 res!474969) b!711699))

(declare-fun m!668681 () Bool)

(assert (=> b!711698 m!668681))

(declare-fun m!668683 () Bool)

(assert (=> b!711699 m!668683))

(assert (=> b!711424 d!97745))

(declare-fun d!97747 () Bool)

(declare-fun lt!318485 () Bool)

(assert (=> d!97747 (= lt!318485 (select (content!355 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400442 () Bool)

(assert (=> d!97747 (= lt!318485 e!400442)))

(declare-fun res!474971 () Bool)

(assert (=> d!97747 (=> (not res!474971) (not e!400442))))

(assert (=> d!97747 (= res!474971 ((_ is Cons!13388) acc!652))))

(assert (=> d!97747 (= (contains!3969 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318485)))

(declare-fun b!711700 () Bool)

(declare-fun e!400441 () Bool)

(assert (=> b!711700 (= e!400442 e!400441)))

(declare-fun res!474970 () Bool)

(assert (=> b!711700 (=> res!474970 e!400441)))

(assert (=> b!711700 (= res!474970 (= (h!14433 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711701 () Bool)

(assert (=> b!711701 (= e!400441 (contains!3969 (t!19698 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97747 res!474971) b!711700))

(assert (= (and b!711700 (not res!474970)) b!711701))

(assert (=> d!97747 m!668559))

(declare-fun m!668685 () Bool)

(assert (=> d!97747 m!668685))

(declare-fun m!668687 () Bool)

(assert (=> b!711701 m!668687))

(assert (=> b!711428 d!97747))

(declare-fun b!711702 () Bool)

(declare-fun e!400444 () List!13392)

(assert (=> b!711702 (= e!400444 Nil!13389)))

(declare-fun e!400445 () Bool)

(declare-fun b!711703 () Bool)

(declare-fun lt!318486 () List!13392)

(assert (=> b!711703 (= e!400445 (= (content!355 lt!318486) ((_ map and) (content!355 lt!318452) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun bm!34528 () Bool)

(declare-fun call!34531 () List!13392)

(assert (=> bm!34528 (= call!34531 (-!379 (t!19698 lt!318452) k0!2824))))

(declare-fun b!711705 () Bool)

(declare-fun e!400443 () List!13392)

(assert (=> b!711705 (= e!400443 call!34531)))

(declare-fun b!711706 () Bool)

(assert (=> b!711706 (= e!400443 (Cons!13388 (h!14433 lt!318452) call!34531))))

(declare-fun d!97749 () Bool)

(assert (=> d!97749 e!400445))

(declare-fun res!474972 () Bool)

(assert (=> d!97749 (=> (not res!474972) (not e!400445))))

(assert (=> d!97749 (= res!474972 (<= (size!19756 lt!318486) (size!19756 lt!318452)))))

(assert (=> d!97749 (= lt!318486 e!400444)))

(declare-fun c!78732 () Bool)

(assert (=> d!97749 (= c!78732 ((_ is Cons!13388) lt!318452))))

(assert (=> d!97749 (= (-!379 lt!318452 k0!2824) lt!318486)))

(declare-fun b!711704 () Bool)

(assert (=> b!711704 (= e!400444 e!400443)))

(declare-fun c!78733 () Bool)

(assert (=> b!711704 (= c!78733 (= k0!2824 (h!14433 lt!318452)))))

(assert (= (and d!97749 c!78732) b!711704))

(assert (= (and d!97749 (not c!78732)) b!711702))

(assert (= (and b!711704 c!78733) b!711705))

(assert (= (and b!711704 (not c!78733)) b!711706))

(assert (= (or b!711705 b!711706) bm!34528))

(assert (= (and d!97749 res!474972) b!711703))

(declare-fun m!668689 () Bool)

(assert (=> b!711703 m!668689))

(assert (=> b!711703 m!668613))

(assert (=> b!711703 m!668651))

(declare-fun m!668691 () Bool)

(assert (=> bm!34528 m!668691))

(declare-fun m!668693 () Bool)

(assert (=> d!97749 m!668693))

(declare-fun m!668695 () Bool)

(assert (=> d!97749 m!668695))

(assert (=> b!711427 d!97749))

(declare-fun d!97755 () Bool)

(assert (=> d!97755 (= (array_inv!15147 a!3591) (bvsge (size!19753 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63150 d!97755))

(declare-fun b!711716 () Bool)

(declare-fun e!400453 () Bool)

(assert (=> b!711716 (= e!400453 (contains!3969 lt!318451 (select (arr!19351 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711717 () Bool)

(declare-fun e!400456 () Bool)

(declare-fun e!400455 () Bool)

(assert (=> b!711717 (= e!400456 e!400455)))

(declare-fun res!474979 () Bool)

(assert (=> b!711717 (=> (not res!474979) (not e!400455))))

(assert (=> b!711717 (= res!474979 (not e!400453))))

(declare-fun res!474978 () Bool)

(assert (=> b!711717 (=> (not res!474978) (not e!400453))))

(assert (=> b!711717 (= res!474978 (validKeyInArray!0 (select (arr!19351 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711718 () Bool)

(declare-fun e!400454 () Bool)

(declare-fun call!34533 () Bool)

(assert (=> b!711718 (= e!400454 call!34533)))

(declare-fun bm!34530 () Bool)

(declare-fun c!78736 () Bool)

(assert (=> bm!34530 (= call!34533 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78736 (Cons!13388 (select (arr!19351 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318451) lt!318451)))))

(declare-fun b!711719 () Bool)

(assert (=> b!711719 (= e!400454 call!34533)))

(declare-fun d!97757 () Bool)

(declare-fun res!474980 () Bool)

(assert (=> d!97757 (=> res!474980 e!400456)))

(assert (=> d!97757 (= res!474980 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19753 a!3591)))))

(assert (=> d!97757 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318451) e!400456)))

(declare-fun b!711720 () Bool)

(assert (=> b!711720 (= e!400455 e!400454)))

(assert (=> b!711720 (= c!78736 (validKeyInArray!0 (select (arr!19351 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!97757 (not res!474980)) b!711717))

(assert (= (and b!711717 res!474978) b!711716))

(assert (= (and b!711717 res!474979) b!711720))

(assert (= (and b!711720 c!78736) b!711718))

(assert (= (and b!711720 (not c!78736)) b!711719))

(assert (= (or b!711718 b!711719) bm!34530))

(assert (=> b!711716 m!668545))

(assert (=> b!711716 m!668545))

(declare-fun m!668709 () Bool)

(assert (=> b!711716 m!668709))

(assert (=> b!711717 m!668545))

(assert (=> b!711717 m!668545))

(declare-fun m!668711 () Bool)

(assert (=> b!711717 m!668711))

(assert (=> bm!34530 m!668545))

(declare-fun m!668717 () Bool)

(assert (=> bm!34530 m!668717))

(assert (=> b!711720 m!668545))

(assert (=> b!711720 m!668545))

(assert (=> b!711720 m!668711))

(assert (=> b!711448 d!97757))

(declare-fun d!97763 () Bool)

(declare-fun lt!318488 () Bool)

(assert (=> d!97763 (= lt!318488 (select (content!355 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400466 () Bool)

(assert (=> d!97763 (= lt!318488 e!400466)))

(declare-fun res!474988 () Bool)

(assert (=> d!97763 (=> (not res!474988) (not e!400466))))

(assert (=> d!97763 (= res!474988 ((_ is Cons!13388) newAcc!49))))

(assert (=> d!97763 (= (contains!3969 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318488)))

(declare-fun b!711731 () Bool)

(declare-fun e!400465 () Bool)

(assert (=> b!711731 (= e!400466 e!400465)))

(declare-fun res!474987 () Bool)

(assert (=> b!711731 (=> res!474987 e!400465)))

(assert (=> b!711731 (= res!474987 (= (h!14433 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711732 () Bool)

(assert (=> b!711732 (= e!400465 (contains!3969 (t!19698 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97763 res!474988) b!711731))

(assert (= (and b!711731 (not res!474987)) b!711732))

(assert (=> d!97763 m!668553))

(declare-fun m!668727 () Bool)

(assert (=> d!97763 m!668727))

(declare-fun m!668729 () Bool)

(assert (=> b!711732 m!668729))

(assert (=> b!711447 d!97763))

(declare-fun b!711739 () Bool)

(declare-fun e!400471 () Bool)

(assert (=> b!711739 (= e!400471 (subseq!414 (t!19698 acc!652) (t!19698 newAcc!49)))))

(declare-fun d!97769 () Bool)

(declare-fun res!474996 () Bool)

(declare-fun e!400473 () Bool)

(assert (=> d!97769 (=> res!474996 e!400473)))

(assert (=> d!97769 (= res!474996 ((_ is Nil!13389) acc!652))))

(assert (=> d!97769 (= (subseq!414 acc!652 newAcc!49) e!400473)))

(declare-fun b!711737 () Bool)

(declare-fun e!400472 () Bool)

(assert (=> b!711737 (= e!400473 e!400472)))

(declare-fun res!474994 () Bool)

(assert (=> b!711737 (=> (not res!474994) (not e!400472))))

(assert (=> b!711737 (= res!474994 ((_ is Cons!13388) newAcc!49))))

(declare-fun b!711740 () Bool)

(declare-fun e!400474 () Bool)

(assert (=> b!711740 (= e!400474 (subseq!414 acc!652 (t!19698 newAcc!49)))))

(declare-fun b!711738 () Bool)

(assert (=> b!711738 (= e!400472 e!400474)))

(declare-fun res!474995 () Bool)

(assert (=> b!711738 (=> res!474995 e!400474)))

(assert (=> b!711738 (= res!474995 e!400471)))

(declare-fun res!474993 () Bool)

(assert (=> b!711738 (=> (not res!474993) (not e!400471))))

(assert (=> b!711738 (= res!474993 (= (h!14433 acc!652) (h!14433 newAcc!49)))))

(assert (= (and d!97769 (not res!474996)) b!711737))

(assert (= (and b!711737 res!474994) b!711738))

(assert (= (and b!711738 res!474993) b!711739))

(assert (= (and b!711738 (not res!474995)) b!711740))

(declare-fun m!668741 () Bool)

(assert (=> b!711739 m!668741))

(declare-fun m!668745 () Bool)

(assert (=> b!711740 m!668745))

(assert (=> b!711426 d!97769))

(check-sat (not bm!34528) (not b!711629) (not b!711571) (not d!97741) (not b!711717) (not b!711547) (not bm!34530) (not b!711698) (not b!711544) (not b!711671) (not b!711617) (not d!97747) (not b!711589) (not b!711703) (not b!711590) (not b!711675) (not bm!34526) (not d!97689) (not b!711620) (not b!711676) (not b!711699) (not b!711701) (not b!711740) (not d!97697) (not b!711618) (not b!711732) (not b!711532) (not b!711555) (not d!97693) (not b!711543) (not d!97739) (not b!711630) (not b!711680) (not d!97749) (not b!711553) (not bm!34515) (not b!711678) (not d!97711) (not d!97733) (not b!711739) (not b!711697) (not d!97715) (not b!711691) (not b!711720) (not b!711716) (not d!97763) (not d!97683) (not b!711575))
(check-sat)
