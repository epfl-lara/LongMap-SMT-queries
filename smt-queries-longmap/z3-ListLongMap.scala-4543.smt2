; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63262 () Bool)

(assert start!63262)

(declare-fun b!712405 () Bool)

(declare-fun res!475745 () Bool)

(declare-fun e!400708 () Bool)

(assert (=> b!712405 (=> (not res!475745) (not e!400708))))

(declare-datatypes ((List!13438 0))(
  ( (Nil!13435) (Cons!13434 (h!14479 (_ BitVec 64)) (t!19741 List!13438)) )
))
(declare-fun lt!318350 () List!13438)

(declare-fun contains!3960 (List!13438 (_ BitVec 64)) Bool)

(assert (=> b!712405 (= res!475745 (not (contains!3960 lt!318350 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun newAcc!49 () List!13438)

(declare-fun b!712406 () Bool)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40434 0))(
  ( (array!40435 (arr!19358 (Array (_ BitVec 32) (_ BitVec 64))) (size!19767 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40434)

(declare-fun arrayNoDuplicates!0 (array!40434 (_ BitVec 32) List!13438) Bool)

(assert (=> b!712406 (= e!400708 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(assert (=> b!712406 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318350)))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-datatypes ((Unit!24608 0))(
  ( (Unit!24609) )
))
(declare-fun lt!318349 () Unit!24608)

(declare-fun lt!318348 () List!13438)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40434 (_ BitVec 64) (_ BitVec 32) List!13438 List!13438) Unit!24608)

(assert (=> b!712406 (= lt!318349 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318348 lt!318350))))

(declare-fun b!712407 () Bool)

(declare-fun res!475754 () Bool)

(declare-fun e!400707 () Bool)

(assert (=> b!712407 (=> (not res!475754) (not e!400707))))

(declare-fun acc!652 () List!13438)

(assert (=> b!712407 (= res!475754 (not (contains!3960 acc!652 k0!2824)))))

(declare-fun b!712408 () Bool)

(declare-fun res!475739 () Bool)

(assert (=> b!712408 (=> (not res!475739) (not e!400708))))

(assert (=> b!712408 (= res!475739 (not (contains!3960 lt!318350 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712409 () Bool)

(declare-fun res!475763 () Bool)

(assert (=> b!712409 (=> (not res!475763) (not e!400707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712409 (= res!475763 (validKeyInArray!0 k0!2824))))

(declare-fun b!712410 () Bool)

(declare-fun res!475756 () Bool)

(assert (=> b!712410 (=> (not res!475756) (not e!400707))))

(assert (=> b!712410 (= res!475756 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712411 () Bool)

(assert (=> b!712411 (= e!400707 e!400708)))

(declare-fun res!475746 () Bool)

(assert (=> b!712411 (=> (not res!475746) (not e!400708))))

(assert (=> b!712411 (= res!475746 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!532 (List!13438 (_ BitVec 64)) List!13438)

(assert (=> b!712411 (= lt!318350 ($colon$colon!532 newAcc!49 (select (arr!19358 a!3591) from!2969)))))

(assert (=> b!712411 (= lt!318348 ($colon$colon!532 acc!652 (select (arr!19358 a!3591) from!2969)))))

(declare-fun b!712412 () Bool)

(declare-fun res!475740 () Bool)

(assert (=> b!712412 (=> (not res!475740) (not e!400708))))

(assert (=> b!712412 (= res!475740 (not (contains!3960 lt!318348 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712413 () Bool)

(declare-fun res!475759 () Bool)

(assert (=> b!712413 (=> (not res!475759) (not e!400708))))

(declare-fun subseq!422 (List!13438 List!13438) Bool)

(assert (=> b!712413 (= res!475759 (subseq!422 lt!318348 lt!318350))))

(declare-fun b!712414 () Bool)

(declare-fun res!475766 () Bool)

(assert (=> b!712414 (=> (not res!475766) (not e!400708))))

(declare-fun noDuplicate!1229 (List!13438) Bool)

(assert (=> b!712414 (= res!475766 (noDuplicate!1229 lt!318350))))

(declare-fun b!712415 () Bool)

(declare-fun res!475761 () Bool)

(assert (=> b!712415 (=> (not res!475761) (not e!400708))))

(assert (=> b!712415 (= res!475761 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318348))))

(declare-fun b!712416 () Bool)

(declare-fun res!475749 () Bool)

(assert (=> b!712416 (=> (not res!475749) (not e!400707))))

(assert (=> b!712416 (= res!475749 (not (contains!3960 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712417 () Bool)

(declare-fun res!475755 () Bool)

(assert (=> b!712417 (=> (not res!475755) (not e!400708))))

(assert (=> b!712417 (= res!475755 (not (contains!3960 lt!318348 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712418 () Bool)

(declare-fun res!475743 () Bool)

(assert (=> b!712418 (=> (not res!475743) (not e!400708))))

(assert (=> b!712418 (= res!475743 (not (contains!3960 lt!318348 k0!2824)))))

(declare-fun b!712419 () Bool)

(declare-fun res!475744 () Bool)

(assert (=> b!712419 (=> (not res!475744) (not e!400707))))

(assert (=> b!712419 (= res!475744 (noDuplicate!1229 newAcc!49))))

(declare-fun b!712420 () Bool)

(declare-fun res!475747 () Bool)

(assert (=> b!712420 (=> (not res!475747) (not e!400707))))

(assert (=> b!712420 (= res!475747 (contains!3960 newAcc!49 k0!2824))))

(declare-fun b!712421 () Bool)

(declare-fun res!475751 () Bool)

(assert (=> b!712421 (=> (not res!475751) (not e!400707))))

(assert (=> b!712421 (= res!475751 (not (contains!3960 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712422 () Bool)

(declare-fun res!475750 () Bool)

(assert (=> b!712422 (=> (not res!475750) (not e!400707))))

(declare-fun -!387 (List!13438 (_ BitVec 64)) List!13438)

(assert (=> b!712422 (= res!475750 (= (-!387 newAcc!49 k0!2824) acc!652))))

(declare-fun b!712423 () Bool)

(declare-fun res!475748 () Bool)

(assert (=> b!712423 (=> (not res!475748) (not e!400708))))

(declare-fun arrayContainsKey!0 (array!40434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712423 (= res!475748 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712424 () Bool)

(declare-fun res!475760 () Bool)

(assert (=> b!712424 (=> (not res!475760) (not e!400707))))

(assert (=> b!712424 (= res!475760 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!712425 () Bool)

(declare-fun res!475741 () Bool)

(assert (=> b!712425 (=> (not res!475741) (not e!400707))))

(assert (=> b!712425 (= res!475741 (not (contains!3960 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712426 () Bool)

(declare-fun res!475752 () Bool)

(assert (=> b!712426 (=> (not res!475752) (not e!400707))))

(assert (=> b!712426 (= res!475752 (noDuplicate!1229 acc!652))))

(declare-fun res!475764 () Bool)

(assert (=> start!63262 (=> (not res!475764) (not e!400707))))

(assert (=> start!63262 (= res!475764 (and (bvslt (size!19767 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19767 a!3591))))))

(assert (=> start!63262 e!400707))

(assert (=> start!63262 true))

(declare-fun array_inv!15241 (array!40434) Bool)

(assert (=> start!63262 (array_inv!15241 a!3591)))

(declare-fun b!712427 () Bool)

(declare-fun res!475742 () Bool)

(assert (=> b!712427 (=> (not res!475742) (not e!400707))))

(assert (=> b!712427 (= res!475742 (subseq!422 acc!652 newAcc!49))))

(declare-fun b!712428 () Bool)

(declare-fun res!475767 () Bool)

(assert (=> b!712428 (=> (not res!475767) (not e!400707))))

(assert (=> b!712428 (= res!475767 (validKeyInArray!0 (select (arr!19358 a!3591) from!2969)))))

(declare-fun b!712429 () Bool)

(declare-fun res!475753 () Bool)

(assert (=> b!712429 (=> (not res!475753) (not e!400708))))

(assert (=> b!712429 (= res!475753 (= (-!387 lt!318350 k0!2824) lt!318348))))

(declare-fun b!712430 () Bool)

(declare-fun res!475758 () Bool)

(assert (=> b!712430 (=> (not res!475758) (not e!400707))))

(assert (=> b!712430 (= res!475758 (not (contains!3960 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712431 () Bool)

(declare-fun res!475765 () Bool)

(assert (=> b!712431 (=> (not res!475765) (not e!400708))))

(assert (=> b!712431 (= res!475765 (contains!3960 lt!318350 k0!2824))))

(declare-fun b!712432 () Bool)

(declare-fun res!475757 () Bool)

(assert (=> b!712432 (=> (not res!475757) (not e!400707))))

(assert (=> b!712432 (= res!475757 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19767 a!3591)))))

(declare-fun b!712433 () Bool)

(declare-fun res!475762 () Bool)

(assert (=> b!712433 (=> (not res!475762) (not e!400708))))

(assert (=> b!712433 (= res!475762 (noDuplicate!1229 lt!318348))))

(assert (= (and start!63262 res!475764) b!712426))

(assert (= (and b!712426 res!475752) b!712419))

(assert (= (and b!712419 res!475744) b!712430))

(assert (= (and b!712430 res!475758) b!712416))

(assert (= (and b!712416 res!475749) b!712424))

(assert (= (and b!712424 res!475760) b!712407))

(assert (= (and b!712407 res!475754) b!712409))

(assert (= (and b!712409 res!475763) b!712410))

(assert (= (and b!712410 res!475756) b!712427))

(assert (= (and b!712427 res!475742) b!712420))

(assert (= (and b!712420 res!475747) b!712422))

(assert (= (and b!712422 res!475750) b!712425))

(assert (= (and b!712425 res!475741) b!712421))

(assert (= (and b!712421 res!475751) b!712432))

(assert (= (and b!712432 res!475757) b!712428))

(assert (= (and b!712428 res!475767) b!712411))

(assert (= (and b!712411 res!475746) b!712433))

(assert (= (and b!712433 res!475762) b!712414))

(assert (= (and b!712414 res!475766) b!712417))

(assert (= (and b!712417 res!475755) b!712412))

(assert (= (and b!712412 res!475740) b!712423))

(assert (= (and b!712423 res!475748) b!712418))

(assert (= (and b!712418 res!475743) b!712415))

(assert (= (and b!712415 res!475761) b!712413))

(assert (= (and b!712413 res!475759) b!712431))

(assert (= (and b!712431 res!475765) b!712429))

(assert (= (and b!712429 res!475753) b!712408))

(assert (= (and b!712408 res!475739) b!712405))

(assert (= (and b!712405 res!475745) b!712406))

(declare-fun m!668775 () Bool)

(assert (=> b!712418 m!668775))

(declare-fun m!668777 () Bool)

(assert (=> b!712430 m!668777))

(declare-fun m!668779 () Bool)

(assert (=> b!712413 m!668779))

(declare-fun m!668781 () Bool)

(assert (=> b!712419 m!668781))

(declare-fun m!668783 () Bool)

(assert (=> b!712414 m!668783))

(declare-fun m!668785 () Bool)

(assert (=> b!712416 m!668785))

(declare-fun m!668787 () Bool)

(assert (=> b!712415 m!668787))

(declare-fun m!668789 () Bool)

(assert (=> b!712433 m!668789))

(declare-fun m!668791 () Bool)

(assert (=> b!712421 m!668791))

(declare-fun m!668793 () Bool)

(assert (=> b!712425 m!668793))

(declare-fun m!668795 () Bool)

(assert (=> b!712427 m!668795))

(declare-fun m!668797 () Bool)

(assert (=> b!712426 m!668797))

(declare-fun m!668799 () Bool)

(assert (=> b!712405 m!668799))

(declare-fun m!668801 () Bool)

(assert (=> start!63262 m!668801))

(declare-fun m!668803 () Bool)

(assert (=> b!712420 m!668803))

(declare-fun m!668805 () Bool)

(assert (=> b!712406 m!668805))

(declare-fun m!668807 () Bool)

(assert (=> b!712406 m!668807))

(declare-fun m!668809 () Bool)

(assert (=> b!712406 m!668809))

(declare-fun m!668811 () Bool)

(assert (=> b!712428 m!668811))

(assert (=> b!712428 m!668811))

(declare-fun m!668813 () Bool)

(assert (=> b!712428 m!668813))

(declare-fun m!668815 () Bool)

(assert (=> b!712410 m!668815))

(declare-fun m!668817 () Bool)

(assert (=> b!712407 m!668817))

(declare-fun m!668819 () Bool)

(assert (=> b!712429 m!668819))

(assert (=> b!712411 m!668811))

(assert (=> b!712411 m!668811))

(declare-fun m!668821 () Bool)

(assert (=> b!712411 m!668821))

(assert (=> b!712411 m!668811))

(declare-fun m!668823 () Bool)

(assert (=> b!712411 m!668823))

(declare-fun m!668825 () Bool)

(assert (=> b!712409 m!668825))

(declare-fun m!668827 () Bool)

(assert (=> b!712417 m!668827))

(declare-fun m!668829 () Bool)

(assert (=> b!712408 m!668829))

(declare-fun m!668831 () Bool)

(assert (=> b!712422 m!668831))

(declare-fun m!668833 () Bool)

(assert (=> b!712424 m!668833))

(declare-fun m!668835 () Bool)

(assert (=> b!712431 m!668835))

(declare-fun m!668837 () Bool)

(assert (=> b!712423 m!668837))

(declare-fun m!668839 () Bool)

(assert (=> b!712412 m!668839))

(check-sat (not b!712428) (not b!712416) (not b!712411) (not b!712427) (not b!712419) (not b!712409) (not b!712408) (not b!712420) (not b!712407) (not b!712413) (not b!712424) (not b!712425) (not b!712430) (not b!712418) (not b!712410) (not b!712422) (not b!712406) (not b!712405) (not b!712423) (not b!712415) (not b!712431) (not b!712421) (not b!712429) (not b!712412) (not b!712417) (not start!63262) (not b!712414) (not b!712433) (not b!712426))
(check-sat)
(get-model)

(declare-fun d!97799 () Bool)

(declare-fun res!475950 () Bool)

(declare-fun e!400736 () Bool)

(assert (=> d!97799 (=> res!475950 e!400736)))

(get-info :version)

(assert (=> d!97799 (= res!475950 ((_ is Nil!13435) acc!652))))

(assert (=> d!97799 (= (subseq!422 acc!652 newAcc!49) e!400736)))

(declare-fun b!712617 () Bool)

(declare-fun e!400738 () Bool)

(declare-fun e!400735 () Bool)

(assert (=> b!712617 (= e!400738 e!400735)))

(declare-fun res!475952 () Bool)

(assert (=> b!712617 (=> res!475952 e!400735)))

(declare-fun e!400737 () Bool)

(assert (=> b!712617 (= res!475952 e!400737)))

(declare-fun res!475953 () Bool)

(assert (=> b!712617 (=> (not res!475953) (not e!400737))))

(assert (=> b!712617 (= res!475953 (= (h!14479 acc!652) (h!14479 newAcc!49)))))

(declare-fun b!712618 () Bool)

(assert (=> b!712618 (= e!400737 (subseq!422 (t!19741 acc!652) (t!19741 newAcc!49)))))

(declare-fun b!712619 () Bool)

(assert (=> b!712619 (= e!400735 (subseq!422 acc!652 (t!19741 newAcc!49)))))

(declare-fun b!712616 () Bool)

(assert (=> b!712616 (= e!400736 e!400738)))

(declare-fun res!475951 () Bool)

(assert (=> b!712616 (=> (not res!475951) (not e!400738))))

(assert (=> b!712616 (= res!475951 ((_ is Cons!13434) newAcc!49))))

(assert (= (and d!97799 (not res!475950)) b!712616))

(assert (= (and b!712616 res!475951) b!712617))

(assert (= (and b!712617 res!475953) b!712618))

(assert (= (and b!712617 (not res!475952)) b!712619))

(declare-fun m!668973 () Bool)

(assert (=> b!712618 m!668973))

(declare-fun m!668975 () Bool)

(assert (=> b!712619 m!668975))

(assert (=> b!712427 d!97799))

(declare-fun d!97801 () Bool)

(declare-fun lt!318371 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!361 (List!13438) (InoxSet (_ BitVec 64)))

(assert (=> d!97801 (= lt!318371 (select (content!361 lt!318350) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400743 () Bool)

(assert (=> d!97801 (= lt!318371 e!400743)))

(declare-fun res!475959 () Bool)

(assert (=> d!97801 (=> (not res!475959) (not e!400743))))

(assert (=> d!97801 (= res!475959 ((_ is Cons!13434) lt!318350))))

(assert (=> d!97801 (= (contains!3960 lt!318350 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318371)))

(declare-fun b!712624 () Bool)

(declare-fun e!400744 () Bool)

(assert (=> b!712624 (= e!400743 e!400744)))

(declare-fun res!475958 () Bool)

(assert (=> b!712624 (=> res!475958 e!400744)))

(assert (=> b!712624 (= res!475958 (= (h!14479 lt!318350) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712625 () Bool)

(assert (=> b!712625 (= e!400744 (contains!3960 (t!19741 lt!318350) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97801 res!475959) b!712624))

(assert (= (and b!712624 (not res!475958)) b!712625))

(declare-fun m!668977 () Bool)

(assert (=> d!97801 m!668977))

(declare-fun m!668979 () Bool)

(assert (=> d!97801 m!668979))

(declare-fun m!668981 () Bool)

(assert (=> b!712625 m!668981))

(assert (=> b!712405 d!97801))

(declare-fun d!97803 () Bool)

(declare-fun res!475964 () Bool)

(declare-fun e!400749 () Bool)

(assert (=> d!97803 (=> res!475964 e!400749)))

(assert (=> d!97803 (= res!475964 ((_ is Nil!13435) acc!652))))

(assert (=> d!97803 (= (noDuplicate!1229 acc!652) e!400749)))

(declare-fun b!712630 () Bool)

(declare-fun e!400750 () Bool)

(assert (=> b!712630 (= e!400749 e!400750)))

(declare-fun res!475965 () Bool)

(assert (=> b!712630 (=> (not res!475965) (not e!400750))))

(assert (=> b!712630 (= res!475965 (not (contains!3960 (t!19741 acc!652) (h!14479 acc!652))))))

(declare-fun b!712631 () Bool)

(assert (=> b!712631 (= e!400750 (noDuplicate!1229 (t!19741 acc!652)))))

(assert (= (and d!97803 (not res!475964)) b!712630))

(assert (= (and b!712630 res!475965) b!712631))

(declare-fun m!668983 () Bool)

(assert (=> b!712630 m!668983))

(declare-fun m!668985 () Bool)

(assert (=> b!712631 m!668985))

(assert (=> b!712426 d!97803))

(declare-fun d!97805 () Bool)

(declare-fun lt!318372 () Bool)

(assert (=> d!97805 (= lt!318372 (select (content!361 acc!652) k0!2824))))

(declare-fun e!400751 () Bool)

(assert (=> d!97805 (= lt!318372 e!400751)))

(declare-fun res!475967 () Bool)

(assert (=> d!97805 (=> (not res!475967) (not e!400751))))

(assert (=> d!97805 (= res!475967 ((_ is Cons!13434) acc!652))))

(assert (=> d!97805 (= (contains!3960 acc!652 k0!2824) lt!318372)))

(declare-fun b!712632 () Bool)

(declare-fun e!400752 () Bool)

(assert (=> b!712632 (= e!400751 e!400752)))

(declare-fun res!475966 () Bool)

(assert (=> b!712632 (=> res!475966 e!400752)))

(assert (=> b!712632 (= res!475966 (= (h!14479 acc!652) k0!2824))))

(declare-fun b!712633 () Bool)

(assert (=> b!712633 (= e!400752 (contains!3960 (t!19741 acc!652) k0!2824))))

(assert (= (and d!97805 res!475967) b!712632))

(assert (= (and b!712632 (not res!475966)) b!712633))

(declare-fun m!668987 () Bool)

(assert (=> d!97805 m!668987))

(declare-fun m!668989 () Bool)

(assert (=> d!97805 m!668989))

(declare-fun m!668991 () Bool)

(assert (=> b!712633 m!668991))

(assert (=> b!712407 d!97805))

(declare-fun d!97807 () Bool)

(assert (=> d!97807 (= (validKeyInArray!0 (select (arr!19358 a!3591) from!2969)) (and (not (= (select (arr!19358 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19358 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712428 d!97807))

(declare-fun b!712648 () Bool)

(declare-fun e!400768 () Bool)

(declare-fun call!34537 () Bool)

(assert (=> b!712648 (= e!400768 call!34537)))

(declare-fun d!97809 () Bool)

(declare-fun res!475978 () Bool)

(declare-fun e!400767 () Bool)

(assert (=> d!97809 (=> res!475978 e!400767)))

(assert (=> d!97809 (= res!475978 (bvsge from!2969 (size!19767 a!3591)))))

(assert (=> d!97809 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!400767)))

(declare-fun bm!34534 () Bool)

(declare-fun c!78702 () Bool)

(assert (=> bm!34534 (= call!34537 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78702 (Cons!13434 (select (arr!19358 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun b!712649 () Bool)

(assert (=> b!712649 (= e!400768 call!34537)))

(declare-fun b!712650 () Bool)

(declare-fun e!400765 () Bool)

(assert (=> b!712650 (= e!400765 (contains!3960 newAcc!49 (select (arr!19358 a!3591) from!2969)))))

(declare-fun b!712651 () Bool)

(declare-fun e!400766 () Bool)

(assert (=> b!712651 (= e!400766 e!400768)))

(assert (=> b!712651 (= c!78702 (validKeyInArray!0 (select (arr!19358 a!3591) from!2969)))))

(declare-fun b!712652 () Bool)

(assert (=> b!712652 (= e!400767 e!400766)))

(declare-fun res!475979 () Bool)

(assert (=> b!712652 (=> (not res!475979) (not e!400766))))

(assert (=> b!712652 (= res!475979 (not e!400765))))

(declare-fun res!475980 () Bool)

(assert (=> b!712652 (=> (not res!475980) (not e!400765))))

(assert (=> b!712652 (= res!475980 (validKeyInArray!0 (select (arr!19358 a!3591) from!2969)))))

(assert (= (and d!97809 (not res!475978)) b!712652))

(assert (= (and b!712652 res!475980) b!712650))

(assert (= (and b!712652 res!475979) b!712651))

(assert (= (and b!712651 c!78702) b!712649))

(assert (= (and b!712651 (not c!78702)) b!712648))

(assert (= (or b!712649 b!712648) bm!34534))

(assert (=> bm!34534 m!668811))

(declare-fun m!668993 () Bool)

(assert (=> bm!34534 m!668993))

(assert (=> b!712650 m!668811))

(assert (=> b!712650 m!668811))

(declare-fun m!668995 () Bool)

(assert (=> b!712650 m!668995))

(assert (=> b!712651 m!668811))

(assert (=> b!712651 m!668811))

(assert (=> b!712651 m!668813))

(assert (=> b!712652 m!668811))

(assert (=> b!712652 m!668811))

(assert (=> b!712652 m!668813))

(assert (=> b!712406 d!97809))

(declare-fun b!712653 () Bool)

(declare-fun e!400772 () Bool)

(declare-fun call!34538 () Bool)

(assert (=> b!712653 (= e!400772 call!34538)))

(declare-fun d!97813 () Bool)

(declare-fun res!475981 () Bool)

(declare-fun e!400771 () Bool)

(assert (=> d!97813 (=> res!475981 e!400771)))

(assert (=> d!97813 (= res!475981 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19767 a!3591)))))

(assert (=> d!97813 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318350) e!400771)))

(declare-fun c!78703 () Bool)

(declare-fun bm!34535 () Bool)

(assert (=> bm!34535 (= call!34538 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78703 (Cons!13434 (select (arr!19358 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318350) lt!318350)))))

(declare-fun b!712654 () Bool)

(assert (=> b!712654 (= e!400772 call!34538)))

(declare-fun b!712655 () Bool)

(declare-fun e!400769 () Bool)

(assert (=> b!712655 (= e!400769 (contains!3960 lt!318350 (select (arr!19358 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712656 () Bool)

(declare-fun e!400770 () Bool)

(assert (=> b!712656 (= e!400770 e!400772)))

(assert (=> b!712656 (= c!78703 (validKeyInArray!0 (select (arr!19358 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712657 () Bool)

(assert (=> b!712657 (= e!400771 e!400770)))

(declare-fun res!475982 () Bool)

(assert (=> b!712657 (=> (not res!475982) (not e!400770))))

(assert (=> b!712657 (= res!475982 (not e!400769))))

(declare-fun res!475983 () Bool)

(assert (=> b!712657 (=> (not res!475983) (not e!400769))))

(assert (=> b!712657 (= res!475983 (validKeyInArray!0 (select (arr!19358 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!97813 (not res!475981)) b!712657))

(assert (= (and b!712657 res!475983) b!712655))

(assert (= (and b!712657 res!475982) b!712656))

(assert (= (and b!712656 c!78703) b!712654))

(assert (= (and b!712656 (not c!78703)) b!712653))

(assert (= (or b!712654 b!712653) bm!34535))

(declare-fun m!669001 () Bool)

(assert (=> bm!34535 m!669001))

(declare-fun m!669005 () Bool)

(assert (=> bm!34535 m!669005))

(assert (=> b!712655 m!669001))

(assert (=> b!712655 m!669001))

(declare-fun m!669007 () Bool)

(assert (=> b!712655 m!669007))

(assert (=> b!712656 m!669001))

(assert (=> b!712656 m!669001))

(declare-fun m!669009 () Bool)

(assert (=> b!712656 m!669009))

(assert (=> b!712657 m!669001))

(assert (=> b!712657 m!669001))

(assert (=> b!712657 m!669009))

(assert (=> b!712406 d!97813))

(declare-fun d!97819 () Bool)

(assert (=> d!97819 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318350)))

(declare-fun lt!318379 () Unit!24608)

(declare-fun choose!66 (array!40434 (_ BitVec 64) (_ BitVec 32) List!13438 List!13438) Unit!24608)

(assert (=> d!97819 (= lt!318379 (choose!66 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318348 lt!318350))))

(assert (=> d!97819 (bvslt (size!19767 a!3591) #b01111111111111111111111111111111)))

(assert (=> d!97819 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318348 lt!318350) lt!318379)))

(declare-fun bs!20526 () Bool)

(assert (= bs!20526 d!97819))

(assert (=> bs!20526 m!668807))

(declare-fun m!669023 () Bool)

(assert (=> bs!20526 m!669023))

(assert (=> b!712406 d!97819))

(declare-fun d!97827 () Bool)

(declare-fun lt!318380 () Bool)

(assert (=> d!97827 (= lt!318380 (select (content!361 lt!318350) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400789 () Bool)

(assert (=> d!97827 (= lt!318380 e!400789)))

(declare-fun res!476001 () Bool)

(assert (=> d!97827 (=> (not res!476001) (not e!400789))))

(assert (=> d!97827 (= res!476001 ((_ is Cons!13434) lt!318350))))

(assert (=> d!97827 (= (contains!3960 lt!318350 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318380)))

(declare-fun b!712674 () Bool)

(declare-fun e!400790 () Bool)

(assert (=> b!712674 (= e!400789 e!400790)))

(declare-fun res!476000 () Bool)

(assert (=> b!712674 (=> res!476000 e!400790)))

(assert (=> b!712674 (= res!476000 (= (h!14479 lt!318350) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712675 () Bool)

(assert (=> b!712675 (= e!400790 (contains!3960 (t!19741 lt!318350) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97827 res!476001) b!712674))

(assert (= (and b!712674 (not res!476000)) b!712675))

(assert (=> d!97827 m!668977))

(declare-fun m!669025 () Bool)

(assert (=> d!97827 m!669025))

(declare-fun m!669027 () Bool)

(assert (=> b!712675 m!669027))

(assert (=> b!712408 d!97827))

(declare-fun b!712717 () Bool)

(declare-fun e!400826 () List!13438)

(declare-fun call!34544 () List!13438)

(assert (=> b!712717 (= e!400826 call!34544)))

(declare-fun b!712718 () Bool)

(declare-fun e!400827 () List!13438)

(assert (=> b!712718 (= e!400827 Nil!13435)))

(declare-fun d!97829 () Bool)

(declare-fun e!400828 () Bool)

(assert (=> d!97829 e!400828))

(declare-fun res!476029 () Bool)

(assert (=> d!97829 (=> (not res!476029) (not e!400828))))

(declare-fun lt!318387 () List!13438)

(declare-fun size!19770 (List!13438) Int)

(assert (=> d!97829 (= res!476029 (<= (size!19770 lt!318387) (size!19770 lt!318350)))))

(assert (=> d!97829 (= lt!318387 e!400827)))

(declare-fun c!78712 () Bool)

(assert (=> d!97829 (= c!78712 ((_ is Cons!13434) lt!318350))))

(assert (=> d!97829 (= (-!387 lt!318350 k0!2824) lt!318387)))

(declare-fun b!712719 () Bool)

(assert (=> b!712719 (= e!400826 (Cons!13434 (h!14479 lt!318350) call!34544))))

(declare-fun b!712720 () Bool)

(assert (=> b!712720 (= e!400827 e!400826)))

(declare-fun c!78711 () Bool)

(assert (=> b!712720 (= c!78711 (= k0!2824 (h!14479 lt!318350)))))

(declare-fun bm!34541 () Bool)

(assert (=> bm!34541 (= call!34544 (-!387 (t!19741 lt!318350) k0!2824))))

(declare-fun b!712721 () Bool)

(assert (=> b!712721 (= e!400828 (= (content!361 lt!318387) ((_ map and) (content!361 lt!318350) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(assert (= (and d!97829 c!78712) b!712720))

(assert (= (and d!97829 (not c!78712)) b!712718))

(assert (= (and b!712720 c!78711) b!712717))

(assert (= (and b!712720 (not c!78711)) b!712719))

(assert (= (or b!712717 b!712719) bm!34541))

(assert (= (and d!97829 res!476029) b!712721))

(declare-fun m!669045 () Bool)

(assert (=> d!97829 m!669045))

(declare-fun m!669047 () Bool)

(assert (=> d!97829 m!669047))

(declare-fun m!669049 () Bool)

(assert (=> bm!34541 m!669049))

(declare-fun m!669051 () Bool)

(assert (=> b!712721 m!669051))

(assert (=> b!712721 m!668977))

(declare-fun m!669053 () Bool)

(assert (=> b!712721 m!669053))

(assert (=> b!712429 d!97829))

(declare-fun d!97837 () Bool)

(declare-fun lt!318388 () Bool)

(assert (=> d!97837 (= lt!318388 (select (content!361 lt!318350) k0!2824))))

(declare-fun e!400837 () Bool)

(assert (=> d!97837 (= lt!318388 e!400837)))

(declare-fun res!476038 () Bool)

(assert (=> d!97837 (=> (not res!476038) (not e!400837))))

(assert (=> d!97837 (= res!476038 ((_ is Cons!13434) lt!318350))))

(assert (=> d!97837 (= (contains!3960 lt!318350 k0!2824) lt!318388)))

(declare-fun b!712731 () Bool)

(declare-fun e!400838 () Bool)

(assert (=> b!712731 (= e!400837 e!400838)))

(declare-fun res!476037 () Bool)

(assert (=> b!712731 (=> res!476037 e!400838)))

(assert (=> b!712731 (= res!476037 (= (h!14479 lt!318350) k0!2824))))

(declare-fun b!712732 () Bool)

(assert (=> b!712732 (= e!400838 (contains!3960 (t!19741 lt!318350) k0!2824))))

(assert (= (and d!97837 res!476038) b!712731))

(assert (= (and b!712731 (not res!476037)) b!712732))

(assert (=> d!97837 m!668977))

(declare-fun m!669061 () Bool)

(assert (=> d!97837 m!669061))

(declare-fun m!669065 () Bool)

(assert (=> b!712732 m!669065))

(assert (=> b!712431 d!97837))

(declare-fun d!97841 () Bool)

(assert (=> d!97841 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712409 d!97841))

(declare-fun d!97845 () Bool)

(declare-fun lt!318389 () Bool)

(assert (=> d!97845 (= lt!318389 (select (content!361 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400843 () Bool)

(assert (=> d!97845 (= lt!318389 e!400843)))

(declare-fun res!476043 () Bool)

(assert (=> d!97845 (=> (not res!476043) (not e!400843))))

(assert (=> d!97845 (= res!476043 ((_ is Cons!13434) acc!652))))

(assert (=> d!97845 (= (contains!3960 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318389)))

(declare-fun b!712738 () Bool)

(declare-fun e!400844 () Bool)

(assert (=> b!712738 (= e!400843 e!400844)))

(declare-fun res!476042 () Bool)

(assert (=> b!712738 (=> res!476042 e!400844)))

(assert (=> b!712738 (= res!476042 (= (h!14479 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712739 () Bool)

(assert (=> b!712739 (= e!400844 (contains!3960 (t!19741 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97845 res!476043) b!712738))

(assert (= (and b!712738 (not res!476042)) b!712739))

(assert (=> d!97845 m!668987))

(declare-fun m!669067 () Bool)

(assert (=> d!97845 m!669067))

(declare-fun m!669069 () Bool)

(assert (=> b!712739 m!669069))

(assert (=> b!712430 d!97845))

(declare-fun d!97847 () Bool)

(assert (=> d!97847 (= ($colon$colon!532 newAcc!49 (select (arr!19358 a!3591) from!2969)) (Cons!13434 (select (arr!19358 a!3591) from!2969) newAcc!49))))

(assert (=> b!712411 d!97847))

(declare-fun d!97855 () Bool)

(assert (=> d!97855 (= ($colon$colon!532 acc!652 (select (arr!19358 a!3591) from!2969)) (Cons!13434 (select (arr!19358 a!3591) from!2969) acc!652))))

(assert (=> b!712411 d!97855))

(declare-fun b!712744 () Bool)

(declare-fun e!400852 () Bool)

(declare-fun call!34547 () Bool)

(assert (=> b!712744 (= e!400852 call!34547)))

(declare-fun d!97857 () Bool)

(declare-fun res!476048 () Bool)

(declare-fun e!400851 () Bool)

(assert (=> d!97857 (=> res!476048 e!400851)))

(assert (=> d!97857 (= res!476048 (bvsge from!2969 (size!19767 a!3591)))))

(assert (=> d!97857 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400851)))

(declare-fun c!78715 () Bool)

(declare-fun bm!34544 () Bool)

(assert (=> bm!34544 (= call!34547 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78715 (Cons!13434 (select (arr!19358 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!712745 () Bool)

(assert (=> b!712745 (= e!400852 call!34547)))

(declare-fun b!712746 () Bool)

(declare-fun e!400849 () Bool)

(assert (=> b!712746 (= e!400849 (contains!3960 acc!652 (select (arr!19358 a!3591) from!2969)))))

(declare-fun b!712747 () Bool)

(declare-fun e!400850 () Bool)

(assert (=> b!712747 (= e!400850 e!400852)))

(assert (=> b!712747 (= c!78715 (validKeyInArray!0 (select (arr!19358 a!3591) from!2969)))))

(declare-fun b!712748 () Bool)

(assert (=> b!712748 (= e!400851 e!400850)))

(declare-fun res!476049 () Bool)

(assert (=> b!712748 (=> (not res!476049) (not e!400850))))

(assert (=> b!712748 (= res!476049 (not e!400849))))

(declare-fun res!476050 () Bool)

(assert (=> b!712748 (=> (not res!476050) (not e!400849))))

(assert (=> b!712748 (= res!476050 (validKeyInArray!0 (select (arr!19358 a!3591) from!2969)))))

(assert (= (and d!97857 (not res!476048)) b!712748))

(assert (= (and b!712748 res!476050) b!712746))

(assert (= (and b!712748 res!476049) b!712747))

(assert (= (and b!712747 c!78715) b!712745))

(assert (= (and b!712747 (not c!78715)) b!712744))

(assert (= (or b!712745 b!712744) bm!34544))

(assert (=> bm!34544 m!668811))

(declare-fun m!669093 () Bool)

(assert (=> bm!34544 m!669093))

(assert (=> b!712746 m!668811))

(assert (=> b!712746 m!668811))

(declare-fun m!669095 () Bool)

(assert (=> b!712746 m!669095))

(assert (=> b!712747 m!668811))

(assert (=> b!712747 m!668811))

(assert (=> b!712747 m!668813))

(assert (=> b!712748 m!668811))

(assert (=> b!712748 m!668811))

(assert (=> b!712748 m!668813))

(assert (=> b!712410 d!97857))

(declare-fun d!97863 () Bool)

(declare-fun lt!318392 () Bool)

(assert (=> d!97863 (= lt!318392 (select (content!361 lt!318348) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400859 () Bool)

(assert (=> d!97863 (= lt!318392 e!400859)))

(declare-fun res!476058 () Bool)

(assert (=> d!97863 (=> (not res!476058) (not e!400859))))

(assert (=> d!97863 (= res!476058 ((_ is Cons!13434) lt!318348))))

(assert (=> d!97863 (= (contains!3960 lt!318348 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318392)))

(declare-fun b!712755 () Bool)

(declare-fun e!400860 () Bool)

(assert (=> b!712755 (= e!400859 e!400860)))

(declare-fun res!476057 () Bool)

(assert (=> b!712755 (=> res!476057 e!400860)))

(assert (=> b!712755 (= res!476057 (= (h!14479 lt!318348) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712756 () Bool)

(assert (=> b!712756 (= e!400860 (contains!3960 (t!19741 lt!318348) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97863 res!476058) b!712755))

(assert (= (and b!712755 (not res!476057)) b!712756))

(declare-fun m!669101 () Bool)

(assert (=> d!97863 m!669101))

(declare-fun m!669103 () Bool)

(assert (=> d!97863 m!669103))

(declare-fun m!669105 () Bool)

(assert (=> b!712756 m!669105))

(assert (=> b!712412 d!97863))

(declare-fun d!97867 () Bool)

(declare-fun res!476059 () Bool)

(declare-fun e!400861 () Bool)

(assert (=> d!97867 (=> res!476059 e!400861)))

(assert (=> d!97867 (= res!476059 ((_ is Nil!13435) lt!318348))))

(assert (=> d!97867 (= (noDuplicate!1229 lt!318348) e!400861)))

(declare-fun b!712757 () Bool)

(declare-fun e!400862 () Bool)

(assert (=> b!712757 (= e!400861 e!400862)))

(declare-fun res!476060 () Bool)

(assert (=> b!712757 (=> (not res!476060) (not e!400862))))

(assert (=> b!712757 (= res!476060 (not (contains!3960 (t!19741 lt!318348) (h!14479 lt!318348))))))

(declare-fun b!712758 () Bool)

(assert (=> b!712758 (= e!400862 (noDuplicate!1229 (t!19741 lt!318348)))))

(assert (= (and d!97867 (not res!476059)) b!712757))

(assert (= (and b!712757 res!476060) b!712758))

(declare-fun m!669107 () Bool)

(assert (=> b!712757 m!669107))

(declare-fun m!669109 () Bool)

(assert (=> b!712758 m!669109))

(assert (=> b!712433 d!97867))

(declare-fun d!97869 () Bool)

(assert (=> d!97869 (= (array_inv!15241 a!3591) (bvsge (size!19767 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63262 d!97869))

(declare-fun d!97871 () Bool)

(declare-fun res!476061 () Bool)

(declare-fun e!400864 () Bool)

(assert (=> d!97871 (=> res!476061 e!400864)))

(assert (=> d!97871 (= res!476061 ((_ is Nil!13435) lt!318348))))

(assert (=> d!97871 (= (subseq!422 lt!318348 lt!318350) e!400864)))

(declare-fun b!712760 () Bool)

(declare-fun e!400866 () Bool)

(declare-fun e!400863 () Bool)

(assert (=> b!712760 (= e!400866 e!400863)))

(declare-fun res!476063 () Bool)

(assert (=> b!712760 (=> res!476063 e!400863)))

(declare-fun e!400865 () Bool)

(assert (=> b!712760 (= res!476063 e!400865)))

(declare-fun res!476064 () Bool)

(assert (=> b!712760 (=> (not res!476064) (not e!400865))))

(assert (=> b!712760 (= res!476064 (= (h!14479 lt!318348) (h!14479 lt!318350)))))

(declare-fun b!712761 () Bool)

(assert (=> b!712761 (= e!400865 (subseq!422 (t!19741 lt!318348) (t!19741 lt!318350)))))

(declare-fun b!712762 () Bool)

(assert (=> b!712762 (= e!400863 (subseq!422 lt!318348 (t!19741 lt!318350)))))

(declare-fun b!712759 () Bool)

(assert (=> b!712759 (= e!400864 e!400866)))

(declare-fun res!476062 () Bool)

(assert (=> b!712759 (=> (not res!476062) (not e!400866))))

(assert (=> b!712759 (= res!476062 ((_ is Cons!13434) lt!318350))))

(assert (= (and d!97871 (not res!476061)) b!712759))

(assert (= (and b!712759 res!476062) b!712760))

(assert (= (and b!712760 res!476064) b!712761))

(assert (= (and b!712760 (not res!476063)) b!712762))

(declare-fun m!669111 () Bool)

(assert (=> b!712761 m!669111))

(declare-fun m!669113 () Bool)

(assert (=> b!712762 m!669113))

(assert (=> b!712413 d!97871))

(declare-fun b!712763 () Bool)

(declare-fun e!400870 () Bool)

(declare-fun call!34548 () Bool)

(assert (=> b!712763 (= e!400870 call!34548)))

(declare-fun d!97873 () Bool)

(declare-fun res!476065 () Bool)

(declare-fun e!400869 () Bool)

(assert (=> d!97873 (=> res!476065 e!400869)))

(assert (=> d!97873 (= res!476065 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19767 a!3591)))))

(assert (=> d!97873 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318348) e!400869)))

(declare-fun bm!34545 () Bool)

(declare-fun c!78716 () Bool)

(assert (=> bm!34545 (= call!34548 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78716 (Cons!13434 (select (arr!19358 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318348) lt!318348)))))

(declare-fun b!712764 () Bool)

(assert (=> b!712764 (= e!400870 call!34548)))

(declare-fun b!712765 () Bool)

(declare-fun e!400867 () Bool)

(assert (=> b!712765 (= e!400867 (contains!3960 lt!318348 (select (arr!19358 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712766 () Bool)

(declare-fun e!400868 () Bool)

(assert (=> b!712766 (= e!400868 e!400870)))

(assert (=> b!712766 (= c!78716 (validKeyInArray!0 (select (arr!19358 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712767 () Bool)

(assert (=> b!712767 (= e!400869 e!400868)))

(declare-fun res!476066 () Bool)

(assert (=> b!712767 (=> (not res!476066) (not e!400868))))

(assert (=> b!712767 (= res!476066 (not e!400867))))

(declare-fun res!476067 () Bool)

(assert (=> b!712767 (=> (not res!476067) (not e!400867))))

(assert (=> b!712767 (= res!476067 (validKeyInArray!0 (select (arr!19358 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!97873 (not res!476065)) b!712767))

(assert (= (and b!712767 res!476067) b!712765))

(assert (= (and b!712767 res!476066) b!712766))

(assert (= (and b!712766 c!78716) b!712764))

(assert (= (and b!712766 (not c!78716)) b!712763))

(assert (= (or b!712764 b!712763) bm!34545))

(assert (=> bm!34545 m!669001))

(declare-fun m!669121 () Bool)

(assert (=> bm!34545 m!669121))

(assert (=> b!712765 m!669001))

(assert (=> b!712765 m!669001))

(declare-fun m!669123 () Bool)

(assert (=> b!712765 m!669123))

(assert (=> b!712766 m!669001))

(assert (=> b!712766 m!669001))

(assert (=> b!712766 m!669009))

(assert (=> b!712767 m!669001))

(assert (=> b!712767 m!669001))

(assert (=> b!712767 m!669009))

(assert (=> b!712415 d!97873))

(declare-fun d!97881 () Bool)

(declare-fun res!476072 () Bool)

(declare-fun e!400875 () Bool)

(assert (=> d!97881 (=> res!476072 e!400875)))

(assert (=> d!97881 (= res!476072 ((_ is Nil!13435) lt!318350))))

(assert (=> d!97881 (= (noDuplicate!1229 lt!318350) e!400875)))

(declare-fun b!712772 () Bool)

(declare-fun e!400876 () Bool)

(assert (=> b!712772 (= e!400875 e!400876)))

(declare-fun res!476073 () Bool)

(assert (=> b!712772 (=> (not res!476073) (not e!400876))))

(assert (=> b!712772 (= res!476073 (not (contains!3960 (t!19741 lt!318350) (h!14479 lt!318350))))))

(declare-fun b!712773 () Bool)

(assert (=> b!712773 (= e!400876 (noDuplicate!1229 (t!19741 lt!318350)))))

(assert (= (and d!97881 (not res!476072)) b!712772))

(assert (= (and b!712772 res!476073) b!712773))

(declare-fun m!669131 () Bool)

(assert (=> b!712772 m!669131))

(declare-fun m!669133 () Bool)

(assert (=> b!712773 m!669133))

(assert (=> b!712414 d!97881))

(declare-fun d!97883 () Bool)

(declare-fun lt!318398 () Bool)

(assert (=> d!97883 (= lt!318398 (select (content!361 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400877 () Bool)

(assert (=> d!97883 (= lt!318398 e!400877)))

(declare-fun res!476075 () Bool)

(assert (=> d!97883 (=> (not res!476075) (not e!400877))))

(assert (=> d!97883 (= res!476075 ((_ is Cons!13434) acc!652))))

(assert (=> d!97883 (= (contains!3960 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318398)))

(declare-fun b!712774 () Bool)

(declare-fun e!400878 () Bool)

(assert (=> b!712774 (= e!400877 e!400878)))

(declare-fun res!476074 () Bool)

(assert (=> b!712774 (=> res!476074 e!400878)))

(assert (=> b!712774 (= res!476074 (= (h!14479 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712775 () Bool)

(assert (=> b!712775 (= e!400878 (contains!3960 (t!19741 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97883 res!476075) b!712774))

(assert (= (and b!712774 (not res!476074)) b!712775))

(assert (=> d!97883 m!668987))

(declare-fun m!669135 () Bool)

(assert (=> d!97883 m!669135))

(declare-fun m!669137 () Bool)

(assert (=> b!712775 m!669137))

(assert (=> b!712416 d!97883))

(declare-fun d!97885 () Bool)

(declare-fun lt!318401 () Bool)

(assert (=> d!97885 (= lt!318401 (select (content!361 lt!318348) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400884 () Bool)

(assert (=> d!97885 (= lt!318401 e!400884)))

(declare-fun res!476077 () Bool)

(assert (=> d!97885 (=> (not res!476077) (not e!400884))))

(assert (=> d!97885 (= res!476077 ((_ is Cons!13434) lt!318348))))

(assert (=> d!97885 (= (contains!3960 lt!318348 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318401)))

(declare-fun b!712784 () Bool)

(declare-fun e!400885 () Bool)

(assert (=> b!712784 (= e!400884 e!400885)))

(declare-fun res!476076 () Bool)

(assert (=> b!712784 (=> res!476076 e!400885)))

(assert (=> b!712784 (= res!476076 (= (h!14479 lt!318348) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712785 () Bool)

(assert (=> b!712785 (= e!400885 (contains!3960 (t!19741 lt!318348) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97885 res!476077) b!712784))

(assert (= (and b!712784 (not res!476076)) b!712785))

(assert (=> d!97885 m!669101))

(declare-fun m!669139 () Bool)

(assert (=> d!97885 m!669139))

(declare-fun m!669141 () Bool)

(assert (=> b!712785 m!669141))

(assert (=> b!712417 d!97885))

(declare-fun d!97887 () Bool)

(declare-fun res!476078 () Bool)

(declare-fun e!400886 () Bool)

(assert (=> d!97887 (=> res!476078 e!400886)))

(assert (=> d!97887 (= res!476078 ((_ is Nil!13435) newAcc!49))))

(assert (=> d!97887 (= (noDuplicate!1229 newAcc!49) e!400886)))

(declare-fun b!712786 () Bool)

(declare-fun e!400887 () Bool)

(assert (=> b!712786 (= e!400886 e!400887)))

(declare-fun res!476079 () Bool)

(assert (=> b!712786 (=> (not res!476079) (not e!400887))))

(assert (=> b!712786 (= res!476079 (not (contains!3960 (t!19741 newAcc!49) (h!14479 newAcc!49))))))

(declare-fun b!712787 () Bool)

(assert (=> b!712787 (= e!400887 (noDuplicate!1229 (t!19741 newAcc!49)))))

(assert (= (and d!97887 (not res!476078)) b!712786))

(assert (= (and b!712786 res!476079) b!712787))

(declare-fun m!669143 () Bool)

(assert (=> b!712786 m!669143))

(declare-fun m!669145 () Bool)

(assert (=> b!712787 m!669145))

(assert (=> b!712419 d!97887))

(declare-fun d!97889 () Bool)

(declare-fun lt!318402 () Bool)

(assert (=> d!97889 (= lt!318402 (select (content!361 lt!318348) k0!2824))))

(declare-fun e!400888 () Bool)

(assert (=> d!97889 (= lt!318402 e!400888)))

(declare-fun res!476081 () Bool)

(assert (=> d!97889 (=> (not res!476081) (not e!400888))))

(assert (=> d!97889 (= res!476081 ((_ is Cons!13434) lt!318348))))

(assert (=> d!97889 (= (contains!3960 lt!318348 k0!2824) lt!318402)))

(declare-fun b!712788 () Bool)

(declare-fun e!400889 () Bool)

(assert (=> b!712788 (= e!400888 e!400889)))

(declare-fun res!476080 () Bool)

(assert (=> b!712788 (=> res!476080 e!400889)))

(assert (=> b!712788 (= res!476080 (= (h!14479 lt!318348) k0!2824))))

(declare-fun b!712789 () Bool)

(assert (=> b!712789 (= e!400889 (contains!3960 (t!19741 lt!318348) k0!2824))))

(assert (= (and d!97889 res!476081) b!712788))

(assert (= (and b!712788 (not res!476080)) b!712789))

(assert (=> d!97889 m!669101))

(declare-fun m!669147 () Bool)

(assert (=> d!97889 m!669147))

(declare-fun m!669149 () Bool)

(assert (=> b!712789 m!669149))

(assert (=> b!712418 d!97889))

(declare-fun d!97891 () Bool)

(declare-fun lt!318403 () Bool)

(assert (=> d!97891 (= lt!318403 (select (content!361 newAcc!49) k0!2824))))

(declare-fun e!400892 () Bool)

(assert (=> d!97891 (= lt!318403 e!400892)))

(declare-fun res!476085 () Bool)

(assert (=> d!97891 (=> (not res!476085) (not e!400892))))

(assert (=> d!97891 (= res!476085 ((_ is Cons!13434) newAcc!49))))

(assert (=> d!97891 (= (contains!3960 newAcc!49 k0!2824) lt!318403)))

(declare-fun b!712792 () Bool)

(declare-fun e!400893 () Bool)

(assert (=> b!712792 (= e!400892 e!400893)))

(declare-fun res!476084 () Bool)

(assert (=> b!712792 (=> res!476084 e!400893)))

(assert (=> b!712792 (= res!476084 (= (h!14479 newAcc!49) k0!2824))))

(declare-fun b!712793 () Bool)

(assert (=> b!712793 (= e!400893 (contains!3960 (t!19741 newAcc!49) k0!2824))))

(assert (= (and d!97891 res!476085) b!712792))

(assert (= (and b!712792 (not res!476084)) b!712793))

(declare-fun m!669151 () Bool)

(assert (=> d!97891 m!669151))

(declare-fun m!669153 () Bool)

(assert (=> d!97891 m!669153))

(declare-fun m!669155 () Bool)

(assert (=> b!712793 m!669155))

(assert (=> b!712420 d!97891))

(declare-fun d!97893 () Bool)

(declare-fun lt!318404 () Bool)

(assert (=> d!97893 (= lt!318404 (select (content!361 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400894 () Bool)

(assert (=> d!97893 (= lt!318404 e!400894)))

(declare-fun res!476087 () Bool)

(assert (=> d!97893 (=> (not res!476087) (not e!400894))))

(assert (=> d!97893 (= res!476087 ((_ is Cons!13434) newAcc!49))))

(assert (=> d!97893 (= (contains!3960 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318404)))

(declare-fun b!712794 () Bool)

(declare-fun e!400895 () Bool)

(assert (=> b!712794 (= e!400894 e!400895)))

(declare-fun res!476086 () Bool)

(assert (=> b!712794 (=> res!476086 e!400895)))

(assert (=> b!712794 (= res!476086 (= (h!14479 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712795 () Bool)

(assert (=> b!712795 (= e!400895 (contains!3960 (t!19741 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97893 res!476087) b!712794))

(assert (= (and b!712794 (not res!476086)) b!712795))

(assert (=> d!97893 m!669151))

(declare-fun m!669157 () Bool)

(assert (=> d!97893 m!669157))

(declare-fun m!669159 () Bool)

(assert (=> b!712795 m!669159))

(assert (=> b!712421 d!97893))

(declare-fun d!97895 () Bool)

(declare-fun res!476095 () Bool)

(declare-fun e!400910 () Bool)

(assert (=> d!97895 (=> res!476095 e!400910)))

(assert (=> d!97895 (= res!476095 (= (select (arr!19358 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97895 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!400910)))

(declare-fun b!712815 () Bool)

(declare-fun e!400911 () Bool)

(assert (=> b!712815 (= e!400910 e!400911)))

(declare-fun res!476096 () Bool)

(assert (=> b!712815 (=> (not res!476096) (not e!400911))))

(assert (=> b!712815 (= res!476096 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19767 a!3591)))))

(declare-fun b!712816 () Bool)

(assert (=> b!712816 (= e!400911 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97895 (not res!476095)) b!712815))

(assert (= (and b!712815 res!476096) b!712816))

(assert (=> d!97895 m!669001))

(declare-fun m!669173 () Bool)

(assert (=> b!712816 m!669173))

(assert (=> b!712423 d!97895))

(declare-fun b!712817 () Bool)

(declare-fun e!400912 () List!13438)

(declare-fun call!34554 () List!13438)

(assert (=> b!712817 (= e!400912 call!34554)))

(declare-fun b!712818 () Bool)

(declare-fun e!400913 () List!13438)

(assert (=> b!712818 (= e!400913 Nil!13435)))

(declare-fun d!97901 () Bool)

(declare-fun e!400914 () Bool)

(assert (=> d!97901 e!400914))

(declare-fun res!476097 () Bool)

(assert (=> d!97901 (=> (not res!476097) (not e!400914))))

(declare-fun lt!318408 () List!13438)

(assert (=> d!97901 (= res!476097 (<= (size!19770 lt!318408) (size!19770 newAcc!49)))))

(assert (=> d!97901 (= lt!318408 e!400913)))

(declare-fun c!78728 () Bool)

(assert (=> d!97901 (= c!78728 ((_ is Cons!13434) newAcc!49))))

(assert (=> d!97901 (= (-!387 newAcc!49 k0!2824) lt!318408)))

(declare-fun b!712819 () Bool)

(assert (=> b!712819 (= e!400912 (Cons!13434 (h!14479 newAcc!49) call!34554))))

(declare-fun b!712820 () Bool)

(assert (=> b!712820 (= e!400913 e!400912)))

(declare-fun c!78727 () Bool)

(assert (=> b!712820 (= c!78727 (= k0!2824 (h!14479 newAcc!49)))))

(declare-fun bm!34551 () Bool)

(assert (=> bm!34551 (= call!34554 (-!387 (t!19741 newAcc!49) k0!2824))))

(declare-fun b!712821 () Bool)

(assert (=> b!712821 (= e!400914 (= (content!361 lt!318408) ((_ map and) (content!361 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(assert (= (and d!97901 c!78728) b!712820))

(assert (= (and d!97901 (not c!78728)) b!712818))

(assert (= (and b!712820 c!78727) b!712817))

(assert (= (and b!712820 (not c!78727)) b!712819))

(assert (= (or b!712817 b!712819) bm!34551))

(assert (= (and d!97901 res!476097) b!712821))

(declare-fun m!669175 () Bool)

(assert (=> d!97901 m!669175))

(declare-fun m!669177 () Bool)

(assert (=> d!97901 m!669177))

(declare-fun m!669179 () Bool)

(assert (=> bm!34551 m!669179))

(declare-fun m!669181 () Bool)

(assert (=> b!712821 m!669181))

(assert (=> b!712821 m!669151))

(assert (=> b!712821 m!669053))

(assert (=> b!712422 d!97901))

(declare-fun d!97903 () Bool)

(declare-fun res!476101 () Bool)

(declare-fun e!400920 () Bool)

(assert (=> d!97903 (=> res!476101 e!400920)))

(assert (=> d!97903 (= res!476101 (= (select (arr!19358 a!3591) from!2969) k0!2824))))

(assert (=> d!97903 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!400920)))

(declare-fun b!712829 () Bool)

(declare-fun e!400921 () Bool)

(assert (=> b!712829 (= e!400920 e!400921)))

(declare-fun res!476102 () Bool)

(assert (=> b!712829 (=> (not res!476102) (not e!400921))))

(assert (=> b!712829 (= res!476102 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19767 a!3591)))))

(declare-fun b!712830 () Bool)

(assert (=> b!712830 (= e!400921 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97903 (not res!476101)) b!712829))

(assert (= (and b!712829 res!476102) b!712830))

(assert (=> d!97903 m!668811))

(declare-fun m!669183 () Bool)

(assert (=> b!712830 m!669183))

(assert (=> b!712424 d!97903))

(declare-fun d!97905 () Bool)

(declare-fun lt!318410 () Bool)

(assert (=> d!97905 (= lt!318410 (select (content!361 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400924 () Bool)

(assert (=> d!97905 (= lt!318410 e!400924)))

(declare-fun res!476106 () Bool)

(assert (=> d!97905 (=> (not res!476106) (not e!400924))))

(assert (=> d!97905 (= res!476106 ((_ is Cons!13434) newAcc!49))))

(assert (=> d!97905 (= (contains!3960 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318410)))

(declare-fun b!712833 () Bool)

(declare-fun e!400925 () Bool)

(assert (=> b!712833 (= e!400924 e!400925)))

(declare-fun res!476105 () Bool)

(assert (=> b!712833 (=> res!476105 e!400925)))

(assert (=> b!712833 (= res!476105 (= (h!14479 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712834 () Bool)

(assert (=> b!712834 (= e!400925 (contains!3960 (t!19741 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97905 res!476106) b!712833))

(assert (= (and b!712833 (not res!476105)) b!712834))

(assert (=> d!97905 m!669151))

(declare-fun m!669197 () Bool)

(assert (=> d!97905 m!669197))

(declare-fun m!669199 () Bool)

(assert (=> b!712834 m!669199))

(assert (=> b!712425 d!97905))

(check-sat (not b!712619) (not b!712793) (not bm!34534) (not b!712633) (not b!712772) (not b!712775) (not d!97893) (not b!712618) (not b!712787) (not b!712765) (not d!97845) (not b!712651) (not d!97891) (not b!712631) (not b!712756) (not b!712656) (not d!97883) (not bm!34535) (not d!97901) (not b!712657) (not bm!34551) (not b!712766) (not b!712721) (not bm!34541) (not b!712747) (not b!712675) (not b!712767) (not b!712758) (not d!97905) (not b!712625) (not b!712789) (not d!97805) (not d!97829) (not b!712773) (not d!97827) (not b!712785) (not b!712795) (not b!712816) (not b!712762) (not b!712650) (not b!712821) (not b!712652) (not b!712732) (not b!712748) (not b!712630) (not d!97885) (not b!712739) (not bm!34544) (not b!712746) (not b!712834) (not d!97801) (not b!712655) (not b!712761) (not b!712786) (not d!97863) (not d!97819) (not d!97889) (not b!712757) (not d!97837) (not bm!34545) (not b!712830))
(check-sat)
