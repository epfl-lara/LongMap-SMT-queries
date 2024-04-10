; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63272 () Bool)

(assert start!63272)

(declare-fun b!712623 () Bool)

(declare-fun res!475812 () Bool)

(declare-fun e!400893 () Bool)

(assert (=> b!712623 (=> (not res!475812) (not e!400893))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712623 (= res!475812 (validKeyInArray!0 k!2824))))

(declare-fun b!712624 () Bool)

(declare-fun res!475817 () Bool)

(assert (=> b!712624 (=> (not res!475817) (not e!400893))))

(declare-datatypes ((array!40433 0))(
  ( (array!40434 (arr!19358 (Array (_ BitVec 32) (_ BitVec 64))) (size!19766 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40433)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!712624 (= res!475817 (validKeyInArray!0 (select (arr!19358 a!3591) from!2969)))))

(declare-fun b!712625 () Bool)

(declare-fun e!400894 () Bool)

(assert (=> b!712625 (= e!400894 (bvsge (bvsub (size!19766 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) (bvsub (size!19766 a!3591) from!2969)))))

(declare-fun b!712626 () Bool)

(declare-fun res!475804 () Bool)

(assert (=> b!712626 (=> (not res!475804) (not e!400893))))

(declare-datatypes ((List!13399 0))(
  ( (Nil!13396) (Cons!13395 (h!14440 (_ BitVec 64)) (t!19711 List!13399)) )
))
(declare-fun acc!652 () List!13399)

(declare-fun noDuplicate!1223 (List!13399) Bool)

(assert (=> b!712626 (= res!475804 (noDuplicate!1223 acc!652))))

(declare-fun res!475807 () Bool)

(assert (=> start!63272 (=> (not res!475807) (not e!400893))))

(assert (=> start!63272 (= res!475807 (and (bvslt (size!19766 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19766 a!3591))))))

(assert (=> start!63272 e!400893))

(assert (=> start!63272 true))

(declare-fun array_inv!15154 (array!40433) Bool)

(assert (=> start!63272 (array_inv!15154 a!3591)))

(declare-fun b!712627 () Bool)

(declare-fun res!475798 () Bool)

(assert (=> b!712627 (=> (not res!475798) (not e!400893))))

(declare-fun arrayNoDuplicates!0 (array!40433 (_ BitVec 32) List!13399) Bool)

(assert (=> b!712627 (= res!475798 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712628 () Bool)

(declare-fun res!475809 () Bool)

(assert (=> b!712628 (=> (not res!475809) (not e!400893))))

(declare-fun contains!3976 (List!13399 (_ BitVec 64)) Bool)

(assert (=> b!712628 (= res!475809 (not (contains!3976 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712629 () Bool)

(declare-fun res!475805 () Bool)

(assert (=> b!712629 (=> (not res!475805) (not e!400894))))

(declare-fun lt!318595 () List!13399)

(assert (=> b!712629 (= res!475805 (contains!3976 lt!318595 k!2824))))

(declare-fun b!712630 () Bool)

(declare-fun res!475813 () Bool)

(assert (=> b!712630 (=> (not res!475813) (not e!400894))))

(declare-fun lt!318596 () List!13399)

(declare-fun subseq!421 (List!13399 List!13399) Bool)

(assert (=> b!712630 (= res!475813 (subseq!421 lt!318596 lt!318595))))

(declare-fun b!712631 () Bool)

(declare-fun res!475791 () Bool)

(assert (=> b!712631 (=> (not res!475791) (not e!400893))))

(declare-fun newAcc!49 () List!13399)

(assert (=> b!712631 (= res!475791 (contains!3976 newAcc!49 k!2824))))

(declare-fun b!712632 () Bool)

(declare-fun res!475797 () Bool)

(assert (=> b!712632 (=> (not res!475797) (not e!400894))))

(declare-fun arrayContainsKey!0 (array!40433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712632 (= res!475797 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712633 () Bool)

(declare-fun res!475803 () Bool)

(assert (=> b!712633 (=> (not res!475803) (not e!400894))))

(assert (=> b!712633 (= res!475803 (not (contains!3976 lt!318596 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712634 () Bool)

(declare-fun res!475814 () Bool)

(assert (=> b!712634 (=> (not res!475814) (not e!400894))))

(declare-fun -!386 (List!13399 (_ BitVec 64)) List!13399)

(assert (=> b!712634 (= res!475814 (= (-!386 lt!318595 k!2824) lt!318596))))

(declare-fun b!712635 () Bool)

(declare-fun res!475794 () Bool)

(assert (=> b!712635 (=> (not res!475794) (not e!400894))))

(assert (=> b!712635 (= res!475794 (noDuplicate!1223 lt!318595))))

(declare-fun b!712636 () Bool)

(declare-fun res!475819 () Bool)

(assert (=> b!712636 (=> (not res!475819) (not e!400894))))

(assert (=> b!712636 (= res!475819 (not (contains!3976 lt!318596 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712637 () Bool)

(declare-fun res!475816 () Bool)

(assert (=> b!712637 (=> (not res!475816) (not e!400893))))

(assert (=> b!712637 (= res!475816 (not (contains!3976 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712638 () Bool)

(declare-fun res!475796 () Bool)

(assert (=> b!712638 (=> (not res!475796) (not e!400893))))

(assert (=> b!712638 (= res!475796 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19766 a!3591)))))

(declare-fun b!712639 () Bool)

(assert (=> b!712639 (= e!400893 e!400894)))

(declare-fun res!475800 () Bool)

(assert (=> b!712639 (=> (not res!475800) (not e!400894))))

(assert (=> b!712639 (= res!475800 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!532 (List!13399 (_ BitVec 64)) List!13399)

(assert (=> b!712639 (= lt!318595 ($colon$colon!532 newAcc!49 (select (arr!19358 a!3591) from!2969)))))

(assert (=> b!712639 (= lt!318596 ($colon$colon!532 acc!652 (select (arr!19358 a!3591) from!2969)))))

(declare-fun b!712640 () Bool)

(declare-fun res!475815 () Bool)

(assert (=> b!712640 (=> (not res!475815) (not e!400893))))

(assert (=> b!712640 (= res!475815 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!712641 () Bool)

(declare-fun res!475806 () Bool)

(assert (=> b!712641 (=> (not res!475806) (not e!400893))))

(assert (=> b!712641 (= res!475806 (= (-!386 newAcc!49 k!2824) acc!652))))

(declare-fun b!712642 () Bool)

(declare-fun res!475810 () Bool)

(assert (=> b!712642 (=> (not res!475810) (not e!400893))))

(assert (=> b!712642 (= res!475810 (subseq!421 acc!652 newAcc!49))))

(declare-fun b!712643 () Bool)

(declare-fun res!475811 () Bool)

(assert (=> b!712643 (=> (not res!475811) (not e!400894))))

(assert (=> b!712643 (= res!475811 (not (contains!3976 lt!318595 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712644 () Bool)

(declare-fun res!475818 () Bool)

(assert (=> b!712644 (=> (not res!475818) (not e!400893))))

(assert (=> b!712644 (= res!475818 (not (contains!3976 acc!652 k!2824)))))

(declare-fun b!712645 () Bool)

(declare-fun res!475802 () Bool)

(assert (=> b!712645 (=> (not res!475802) (not e!400894))))

(assert (=> b!712645 (= res!475802 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318596))))

(declare-fun b!712646 () Bool)

(declare-fun res!475793 () Bool)

(assert (=> b!712646 (=> (not res!475793) (not e!400893))))

(assert (=> b!712646 (= res!475793 (not (contains!3976 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712647 () Bool)

(declare-fun res!475799 () Bool)

(assert (=> b!712647 (=> (not res!475799) (not e!400894))))

(assert (=> b!712647 (= res!475799 (not (contains!3976 lt!318595 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712648 () Bool)

(declare-fun res!475795 () Bool)

(assert (=> b!712648 (=> (not res!475795) (not e!400894))))

(assert (=> b!712648 (= res!475795 (not (contains!3976 lt!318596 k!2824)))))

(declare-fun b!712649 () Bool)

(declare-fun res!475801 () Bool)

(assert (=> b!712649 (=> (not res!475801) (not e!400894))))

(assert (=> b!712649 (= res!475801 (noDuplicate!1223 lt!318596))))

(declare-fun b!712650 () Bool)

(declare-fun res!475808 () Bool)

(assert (=> b!712650 (=> (not res!475808) (not e!400893))))

(assert (=> b!712650 (= res!475808 (noDuplicate!1223 newAcc!49))))

(declare-fun b!712651 () Bool)

(declare-fun res!475792 () Bool)

(assert (=> b!712651 (=> (not res!475792) (not e!400893))))

(assert (=> b!712651 (= res!475792 (not (contains!3976 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63272 res!475807) b!712626))

(assert (= (and b!712626 res!475804) b!712650))

(assert (= (and b!712650 res!475808) b!712628))

(assert (= (and b!712628 res!475809) b!712651))

(assert (= (and b!712651 res!475792) b!712640))

(assert (= (and b!712640 res!475815) b!712644))

(assert (= (and b!712644 res!475818) b!712623))

(assert (= (and b!712623 res!475812) b!712627))

(assert (= (and b!712627 res!475798) b!712642))

(assert (= (and b!712642 res!475810) b!712631))

(assert (= (and b!712631 res!475791) b!712641))

(assert (= (and b!712641 res!475806) b!712637))

(assert (= (and b!712637 res!475816) b!712646))

(assert (= (and b!712646 res!475793) b!712638))

(assert (= (and b!712638 res!475796) b!712624))

(assert (= (and b!712624 res!475817) b!712639))

(assert (= (and b!712639 res!475800) b!712649))

(assert (= (and b!712649 res!475801) b!712635))

(assert (= (and b!712635 res!475794) b!712636))

(assert (= (and b!712636 res!475819) b!712633))

(assert (= (and b!712633 res!475803) b!712632))

(assert (= (and b!712632 res!475797) b!712648))

(assert (= (and b!712648 res!475795) b!712645))

(assert (= (and b!712645 res!475802) b!712630))

(assert (= (and b!712630 res!475813) b!712629))

(assert (= (and b!712629 res!475805) b!712634))

(assert (= (and b!712634 res!475814) b!712643))

(assert (= (and b!712643 res!475811) b!712647))

(assert (= (and b!712647 res!475799) b!712625))

(declare-fun m!669505 () Bool)

(assert (=> b!712628 m!669505))

(declare-fun m!669507 () Bool)

(assert (=> b!712650 m!669507))

(declare-fun m!669509 () Bool)

(assert (=> b!712651 m!669509))

(declare-fun m!669511 () Bool)

(assert (=> b!712646 m!669511))

(declare-fun m!669513 () Bool)

(assert (=> b!712626 m!669513))

(declare-fun m!669515 () Bool)

(assert (=> b!712635 m!669515))

(declare-fun m!669517 () Bool)

(assert (=> start!63272 m!669517))

(declare-fun m!669519 () Bool)

(assert (=> b!712636 m!669519))

(declare-fun m!669521 () Bool)

(assert (=> b!712631 m!669521))

(declare-fun m!669523 () Bool)

(assert (=> b!712641 m!669523))

(declare-fun m!669525 () Bool)

(assert (=> b!712634 m!669525))

(declare-fun m!669527 () Bool)

(assert (=> b!712629 m!669527))

(declare-fun m!669529 () Bool)

(assert (=> b!712649 m!669529))

(declare-fun m!669531 () Bool)

(assert (=> b!712643 m!669531))

(declare-fun m!669533 () Bool)

(assert (=> b!712623 m!669533))

(declare-fun m!669535 () Bool)

(assert (=> b!712624 m!669535))

(assert (=> b!712624 m!669535))

(declare-fun m!669537 () Bool)

(assert (=> b!712624 m!669537))

(declare-fun m!669539 () Bool)

(assert (=> b!712632 m!669539))

(declare-fun m!669541 () Bool)

(assert (=> b!712642 m!669541))

(declare-fun m!669543 () Bool)

(assert (=> b!712633 m!669543))

(declare-fun m!669545 () Bool)

(assert (=> b!712648 m!669545))

(declare-fun m!669547 () Bool)

(assert (=> b!712647 m!669547))

(declare-fun m!669549 () Bool)

(assert (=> b!712637 m!669549))

(declare-fun m!669551 () Bool)

(assert (=> b!712644 m!669551))

(declare-fun m!669553 () Bool)

(assert (=> b!712640 m!669553))

(declare-fun m!669555 () Bool)

(assert (=> b!712627 m!669555))

(declare-fun m!669557 () Bool)

(assert (=> b!712645 m!669557))

(declare-fun m!669559 () Bool)

(assert (=> b!712630 m!669559))

(assert (=> b!712639 m!669535))

(assert (=> b!712639 m!669535))

(declare-fun m!669561 () Bool)

(assert (=> b!712639 m!669561))

(assert (=> b!712639 m!669535))

(declare-fun m!669563 () Bool)

(assert (=> b!712639 m!669563))

(push 1)

(assert (not start!63272))

(assert (not b!712626))

(assert (not b!712635))

(assert (not b!712623))

(assert (not b!712650))

(assert (not b!712627))

(assert (not b!712639))

(assert (not b!712645))

(assert (not b!712634))

(assert (not b!712647))

(assert (not b!712644))

(assert (not b!712632))

(assert (not b!712641))

(assert (not b!712631))

(assert (not b!712643))

(assert (not b!712629))

(assert (not b!712636))

(assert (not b!712628))

(assert (not b!712640))

(assert (not b!712624))

(assert (not b!712648))

(assert (not b!712637))

(assert (not b!712633))

(assert (not b!712646))

(assert (not b!712649))

(assert (not b!712630))

(assert (not b!712651))

(assert (not b!712642))

(check-sat)

