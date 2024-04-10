; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61276 () Bool)

(assert start!61276)

(declare-fun b!686541 () Bool)

(declare-datatypes ((Unit!24197 0))(
  ( (Unit!24198) )
))
(declare-fun e!390951 () Unit!24197)

(declare-fun Unit!24199 () Unit!24197)

(assert (=> b!686541 (= e!390951 Unit!24199)))

(declare-fun lt!315094 () Unit!24197)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39660 0))(
  ( (array!39661 (arr!19006 (Array (_ BitVec 32) (_ BitVec 64))) (size!19380 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39660 (_ BitVec 64) (_ BitVec 32)) Unit!24197)

(assert (=> b!686541 (= lt!315094 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!686541 false))

(declare-fun b!686542 () Bool)

(declare-fun res!451670 () Bool)

(declare-fun e!390948 () Bool)

(assert (=> b!686542 (=> (not res!451670) (not e!390948))))

(declare-datatypes ((List!13047 0))(
  ( (Nil!13044) (Cons!13043 (h!14088 (_ BitVec 64)) (t!19302 List!13047)) )
))
(declare-fun acc!681 () List!13047)

(declare-fun contains!3624 (List!13047 (_ BitVec 64)) Bool)

(assert (=> b!686542 (= res!451670 (not (contains!3624 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686543 () Bool)

(declare-fun res!451658 () Bool)

(assert (=> b!686543 (=> (not res!451658) (not e!390948))))

(declare-fun arrayContainsKey!0 (array!39660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686543 (= res!451658 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686544 () Bool)

(declare-fun Unit!24200 () Unit!24197)

(assert (=> b!686544 (= e!390951 Unit!24200)))

(declare-fun b!686545 () Bool)

(declare-fun res!451663 () Bool)

(assert (=> b!686545 (=> (not res!451663) (not e!390948))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686545 (= res!451663 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19380 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686546 () Bool)

(declare-fun res!451669 () Bool)

(assert (=> b!686546 (=> (not res!451669) (not e!390948))))

(assert (=> b!686546 (= res!451669 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19380 a!3626))))))

(declare-fun b!686547 () Bool)

(declare-fun res!451657 () Bool)

(assert (=> b!686547 (=> (not res!451657) (not e!390948))))

(declare-fun noDuplicate!871 (List!13047) Bool)

(assert (=> b!686547 (= res!451657 (noDuplicate!871 acc!681))))

(declare-fun b!686548 () Bool)

(declare-fun res!451667 () Bool)

(assert (=> b!686548 (=> (not res!451667) (not e!390948))))

(declare-fun arrayNoDuplicates!0 (array!39660 (_ BitVec 32) List!13047) Bool)

(assert (=> b!686548 (= res!451667 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13044))))

(declare-fun b!686549 () Bool)

(declare-fun e!390947 () Bool)

(assert (=> b!686549 (= e!390947 (not (contains!3624 acc!681 k0!2843)))))

(declare-fun b!686550 () Bool)

(declare-fun res!451661 () Bool)

(assert (=> b!686550 (=> (not res!451661) (not e!390948))))

(declare-fun e!390946 () Bool)

(assert (=> b!686550 (= res!451661 e!390946)))

(declare-fun res!451660 () Bool)

(assert (=> b!686550 (=> res!451660 e!390946)))

(declare-fun e!390949 () Bool)

(assert (=> b!686550 (= res!451660 e!390949)))

(declare-fun res!451659 () Bool)

(assert (=> b!686550 (=> (not res!451659) (not e!390949))))

(assert (=> b!686550 (= res!451659 (bvsgt from!3004 i!1382))))

(declare-fun b!686551 () Bool)

(assert (=> b!686551 (= e!390946 e!390947)))

(declare-fun res!451668 () Bool)

(assert (=> b!686551 (=> (not res!451668) (not e!390947))))

(assert (=> b!686551 (= res!451668 (bvsle from!3004 i!1382))))

(declare-fun b!686552 () Bool)

(declare-fun res!451664 () Bool)

(assert (=> b!686552 (=> (not res!451664) (not e!390948))))

(assert (=> b!686552 (= res!451664 (not (contains!3624 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686553 () Bool)

(assert (=> b!686553 (= e!390948 (not true))))

(declare-fun lt!315092 () List!13047)

(assert (=> b!686553 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315092)))

(declare-fun lt!315096 () Unit!24197)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39660 (_ BitVec 64) (_ BitVec 32) List!13047 List!13047) Unit!24197)

(assert (=> b!686553 (= lt!315096 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315092))))

(declare-fun -!175 (List!13047 (_ BitVec 64)) List!13047)

(assert (=> b!686553 (= (-!175 lt!315092 k0!2843) acc!681)))

(declare-fun $colon$colon!375 (List!13047 (_ BitVec 64)) List!13047)

(assert (=> b!686553 (= lt!315092 ($colon$colon!375 acc!681 k0!2843))))

(declare-fun lt!315095 () Unit!24197)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13047) Unit!24197)

(assert (=> b!686553 (= lt!315095 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!210 (List!13047 List!13047) Bool)

(assert (=> b!686553 (subseq!210 acc!681 acc!681)))

(declare-fun lt!315091 () Unit!24197)

(declare-fun lemmaListSubSeqRefl!0 (List!13047) Unit!24197)

(assert (=> b!686553 (= lt!315091 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686553 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315093 () Unit!24197)

(declare-fun e!390945 () Unit!24197)

(assert (=> b!686553 (= lt!315093 e!390945)))

(declare-fun c!77810 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686553 (= c!77810 (validKeyInArray!0 (select (arr!19006 a!3626) from!3004)))))

(declare-fun lt!315097 () Unit!24197)

(assert (=> b!686553 (= lt!315097 e!390951)))

(declare-fun c!77809 () Bool)

(assert (=> b!686553 (= c!77809 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686553 (arrayContainsKey!0 (array!39661 (store (arr!19006 a!3626) i!1382 k0!2843) (size!19380 a!3626)) k0!2843 from!3004)))

(declare-fun b!686554 () Bool)

(declare-fun res!451666 () Bool)

(assert (=> b!686554 (=> (not res!451666) (not e!390948))))

(assert (=> b!686554 (= res!451666 (validKeyInArray!0 k0!2843))))

(declare-fun b!686555 () Bool)

(assert (=> b!686555 (= e!390949 (contains!3624 acc!681 k0!2843))))

(declare-fun b!686557 () Bool)

(declare-fun Unit!24201 () Unit!24197)

(assert (=> b!686557 (= e!390945 Unit!24201)))

(declare-fun b!686558 () Bool)

(declare-fun res!451662 () Bool)

(assert (=> b!686558 (=> (not res!451662) (not e!390948))))

(assert (=> b!686558 (= res!451662 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!451665 () Bool)

(assert (=> start!61276 (=> (not res!451665) (not e!390948))))

(assert (=> start!61276 (= res!451665 (and (bvslt (size!19380 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19380 a!3626))))))

(assert (=> start!61276 e!390948))

(assert (=> start!61276 true))

(declare-fun array_inv!14802 (array!39660) Bool)

(assert (=> start!61276 (array_inv!14802 a!3626)))

(declare-fun b!686556 () Bool)

(declare-fun lt!315090 () Unit!24197)

(assert (=> b!686556 (= e!390945 lt!315090)))

(declare-fun lt!315089 () Unit!24197)

(assert (=> b!686556 (= lt!315089 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686556 (subseq!210 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39660 List!13047 List!13047 (_ BitVec 32)) Unit!24197)

(assert (=> b!686556 (= lt!315090 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!375 acc!681 (select (arr!19006 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686556 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!61276 res!451665) b!686547))

(assert (= (and b!686547 res!451657) b!686542))

(assert (= (and b!686542 res!451670) b!686552))

(assert (= (and b!686552 res!451664) b!686550))

(assert (= (and b!686550 res!451659) b!686555))

(assert (= (and b!686550 (not res!451660)) b!686551))

(assert (= (and b!686551 res!451668) b!686549))

(assert (= (and b!686550 res!451661) b!686548))

(assert (= (and b!686548 res!451667) b!686558))

(assert (= (and b!686558 res!451662) b!686546))

(assert (= (and b!686546 res!451669) b!686554))

(assert (= (and b!686554 res!451666) b!686543))

(assert (= (and b!686543 res!451658) b!686545))

(assert (= (and b!686545 res!451663) b!686553))

(assert (= (and b!686553 c!77809) b!686541))

(assert (= (and b!686553 (not c!77809)) b!686544))

(assert (= (and b!686553 c!77810) b!686556))

(assert (= (and b!686553 (not c!77810)) b!686557))

(declare-fun m!650629 () Bool)

(assert (=> b!686554 m!650629))

(declare-fun m!650631 () Bool)

(assert (=> b!686543 m!650631))

(declare-fun m!650633 () Bool)

(assert (=> b!686547 m!650633))

(declare-fun m!650635 () Bool)

(assert (=> b!686542 m!650635))

(declare-fun m!650637 () Bool)

(assert (=> b!686549 m!650637))

(declare-fun m!650639 () Bool)

(assert (=> b!686558 m!650639))

(declare-fun m!650641 () Bool)

(assert (=> b!686548 m!650641))

(declare-fun m!650643 () Bool)

(assert (=> b!686553 m!650643))

(declare-fun m!650645 () Bool)

(assert (=> b!686553 m!650645))

(declare-fun m!650647 () Bool)

(assert (=> b!686553 m!650647))

(declare-fun m!650649 () Bool)

(assert (=> b!686553 m!650649))

(declare-fun m!650651 () Bool)

(assert (=> b!686553 m!650651))

(declare-fun m!650653 () Bool)

(assert (=> b!686553 m!650653))

(declare-fun m!650655 () Bool)

(assert (=> b!686553 m!650655))

(declare-fun m!650657 () Bool)

(assert (=> b!686553 m!650657))

(declare-fun m!650659 () Bool)

(assert (=> b!686553 m!650659))

(assert (=> b!686553 m!650647))

(declare-fun m!650661 () Bool)

(assert (=> b!686553 m!650661))

(declare-fun m!650663 () Bool)

(assert (=> b!686553 m!650663))

(declare-fun m!650665 () Bool)

(assert (=> b!686553 m!650665))

(declare-fun m!650667 () Bool)

(assert (=> b!686553 m!650667))

(assert (=> b!686555 m!650637))

(assert (=> b!686556 m!650645))

(assert (=> b!686556 m!650647))

(declare-fun m!650669 () Bool)

(assert (=> b!686556 m!650669))

(declare-fun m!650671 () Bool)

(assert (=> b!686556 m!650671))

(assert (=> b!686556 m!650647))

(assert (=> b!686556 m!650669))

(assert (=> b!686556 m!650655))

(assert (=> b!686556 m!650667))

(declare-fun m!650673 () Bool)

(assert (=> b!686541 m!650673))

(declare-fun m!650675 () Bool)

(assert (=> b!686552 m!650675))

(declare-fun m!650677 () Bool)

(assert (=> start!61276 m!650677))

(check-sat (not b!686556) (not b!686552) (not b!686554) (not b!686555) (not b!686548) (not b!686558) (not b!686547) (not b!686541) (not start!61276) (not b!686553) (not b!686549) (not b!686543) (not b!686542))
