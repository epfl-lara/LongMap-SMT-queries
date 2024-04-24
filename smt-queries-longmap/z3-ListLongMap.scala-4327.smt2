; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60048 () Bool)

(assert start!60048)

(declare-fun b!666427 () Bool)

(declare-datatypes ((Unit!23259 0))(
  ( (Unit!23260) )
))
(declare-fun e!381745 () Unit!23259)

(declare-fun lt!310430 () Unit!23259)

(assert (=> b!666427 (= e!381745 lt!310430)))

(declare-fun lt!310431 () Unit!23259)

(declare-datatypes ((List!12654 0))(
  ( (Nil!12651) (Cons!12650 (h!13698 (_ BitVec 64)) (t!18874 List!12654)) )
))
(declare-fun acc!681 () List!12654)

(declare-fun lemmaListSubSeqRefl!0 (List!12654) Unit!23259)

(assert (=> b!666427 (= lt!310431 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!68 (List!12654 List!12654) Bool)

(assert (=> b!666427 (subseq!68 acc!681 acc!681)))

(declare-datatypes ((array!39033 0))(
  ( (array!39034 (arr!18706 (Array (_ BitVec 32) (_ BitVec 64))) (size!19070 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39033)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39033 List!12654 List!12654 (_ BitVec 32)) Unit!23259)

(declare-fun $colon$colon!197 (List!12654 (_ BitVec 64)) List!12654)

(assert (=> b!666427 (= lt!310430 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!197 acc!681 (select (arr!18706 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39033 (_ BitVec 32) List!12654) Bool)

(assert (=> b!666427 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666428 () Bool)

(declare-fun res!433731 () Bool)

(declare-fun e!381746 () Bool)

(assert (=> b!666428 (=> res!433731 e!381746)))

(declare-fun lt!310428 () List!12654)

(declare-fun noDuplicate!580 (List!12654) Bool)

(assert (=> b!666428 (= res!433731 (not (noDuplicate!580 lt!310428)))))

(declare-fun b!666429 () Bool)

(declare-fun res!433734 () Bool)

(declare-fun e!381749 () Bool)

(assert (=> b!666429 (=> (not res!433734) (not e!381749))))

(assert (=> b!666429 (= res!433734 (noDuplicate!580 acc!681))))

(declare-fun b!666430 () Bool)

(declare-fun res!433728 () Bool)

(assert (=> b!666430 (=> res!433728 e!381746)))

(assert (=> b!666430 (= res!433728 (not (subseq!68 acc!681 lt!310428)))))

(declare-fun b!666432 () Bool)

(declare-fun res!433744 () Bool)

(assert (=> b!666432 (=> (not res!433744) (not e!381749))))

(assert (=> b!666432 (= res!433744 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12651))))

(declare-fun b!666433 () Bool)

(declare-fun e!381747 () Bool)

(declare-fun e!381748 () Bool)

(assert (=> b!666433 (= e!381747 e!381748)))

(declare-fun res!433738 () Bool)

(assert (=> b!666433 (=> (not res!433738) (not e!381748))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666433 (= res!433738 (bvsle from!3004 i!1382))))

(declare-fun b!666434 () Bool)

(declare-fun res!433740 () Bool)

(assert (=> b!666434 (=> (not res!433740) (not e!381749))))

(declare-fun contains!3306 (List!12654 (_ BitVec 64)) Bool)

(assert (=> b!666434 (= res!433740 (not (contains!3306 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666435 () Bool)

(declare-fun e!381750 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!666435 (= e!381750 (contains!3306 acc!681 k0!2843))))

(declare-fun b!666436 () Bool)

(declare-fun res!433726 () Bool)

(assert (=> b!666436 (=> (not res!433726) (not e!381749))))

(assert (=> b!666436 (= res!433726 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19070 a!3626))))))

(declare-fun b!666437 () Bool)

(declare-fun res!433739 () Bool)

(assert (=> b!666437 (=> res!433739 e!381746)))

(assert (=> b!666437 (= res!433739 (contains!3306 lt!310428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666438 () Bool)

(declare-fun res!433732 () Bool)

(assert (=> b!666438 (=> (not res!433732) (not e!381749))))

(assert (=> b!666438 (= res!433732 e!381747)))

(declare-fun res!433725 () Bool)

(assert (=> b!666438 (=> res!433725 e!381747)))

(assert (=> b!666438 (= res!433725 e!381750)))

(declare-fun res!433743 () Bool)

(assert (=> b!666438 (=> (not res!433743) (not e!381750))))

(assert (=> b!666438 (= res!433743 (bvsgt from!3004 i!1382))))

(declare-fun b!666439 () Bool)

(declare-fun res!433724 () Bool)

(assert (=> b!666439 (=> res!433724 e!381746)))

(assert (=> b!666439 (= res!433724 (not (contains!3306 lt!310428 k0!2843)))))

(declare-fun b!666440 () Bool)

(declare-fun res!433736 () Bool)

(assert (=> b!666440 (=> (not res!433736) (not e!381749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666440 (= res!433736 (validKeyInArray!0 k0!2843))))

(declare-fun b!666441 () Bool)

(declare-fun e!381744 () Unit!23259)

(declare-fun Unit!23261 () Unit!23259)

(assert (=> b!666441 (= e!381744 Unit!23261)))

(declare-fun lt!310432 () Unit!23259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39033 (_ BitVec 64) (_ BitVec 32)) Unit!23259)

(assert (=> b!666441 (= lt!310432 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!666441 false))

(declare-fun b!666442 () Bool)

(declare-fun res!433727 () Bool)

(assert (=> b!666442 (=> (not res!433727) (not e!381749))))

(assert (=> b!666442 (= res!433727 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19070 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666443 () Bool)

(assert (=> b!666443 (= e!381749 (not e!381746))))

(declare-fun res!433735 () Bool)

(assert (=> b!666443 (=> res!433735 e!381746)))

(assert (=> b!666443 (= res!433735 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!65 (List!12654 (_ BitVec 64)) List!12654)

(assert (=> b!666443 (= (-!65 lt!310428 k0!2843) acc!681)))

(assert (=> b!666443 (= lt!310428 ($colon$colon!197 acc!681 k0!2843))))

(declare-fun lt!310434 () Unit!23259)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12654) Unit!23259)

(assert (=> b!666443 (= lt!310434 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!666443 (subseq!68 acc!681 acc!681)))

(declare-fun lt!310426 () Unit!23259)

(assert (=> b!666443 (= lt!310426 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666443 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310429 () Unit!23259)

(assert (=> b!666443 (= lt!310429 e!381745)))

(declare-fun c!76721 () Bool)

(assert (=> b!666443 (= c!76721 (validKeyInArray!0 (select (arr!18706 a!3626) from!3004)))))

(declare-fun lt!310427 () Unit!23259)

(assert (=> b!666443 (= lt!310427 e!381744)))

(declare-fun c!76720 () Bool)

(declare-fun lt!310433 () Bool)

(assert (=> b!666443 (= c!76720 lt!310433)))

(declare-fun arrayContainsKey!0 (array!39033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666443 (= lt!310433 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666443 (arrayContainsKey!0 (array!39034 (store (arr!18706 a!3626) i!1382 k0!2843) (size!19070 a!3626)) k0!2843 from!3004)))

(declare-fun res!433733 () Bool)

(assert (=> start!60048 (=> (not res!433733) (not e!381749))))

(assert (=> start!60048 (= res!433733 (and (bvslt (size!19070 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19070 a!3626))))))

(assert (=> start!60048 e!381749))

(assert (=> start!60048 true))

(declare-fun array_inv!14565 (array!39033) Bool)

(assert (=> start!60048 (array_inv!14565 a!3626)))

(declare-fun b!666431 () Bool)

(declare-fun Unit!23262 () Unit!23259)

(assert (=> b!666431 (= e!381744 Unit!23262)))

(declare-fun b!666444 () Bool)

(declare-fun Unit!23263 () Unit!23259)

(assert (=> b!666444 (= e!381745 Unit!23263)))

(declare-fun b!666445 () Bool)

(assert (=> b!666445 (= e!381748 (not (contains!3306 acc!681 k0!2843)))))

(declare-fun b!666446 () Bool)

(declare-fun res!433742 () Bool)

(assert (=> b!666446 (=> (not res!433742) (not e!381749))))

(assert (=> b!666446 (= res!433742 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666447 () Bool)

(assert (=> b!666447 (= e!381746 true)))

(declare-fun lt!310435 () Bool)

(assert (=> b!666447 (= lt!310435 (contains!3306 lt!310428 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666448 () Bool)

(declare-fun res!433729 () Bool)

(assert (=> b!666448 (=> res!433729 e!381746)))

(assert (=> b!666448 (= res!433729 lt!310433)))

(declare-fun b!666449 () Bool)

(declare-fun res!433737 () Bool)

(assert (=> b!666449 (=> (not res!433737) (not e!381749))))

(assert (=> b!666449 (= res!433737 (not (contains!3306 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666450 () Bool)

(declare-fun res!433730 () Bool)

(assert (=> b!666450 (=> res!433730 e!381746)))

(assert (=> b!666450 (= res!433730 (contains!3306 acc!681 k0!2843))))

(declare-fun b!666451 () Bool)

(declare-fun res!433741 () Bool)

(assert (=> b!666451 (=> (not res!433741) (not e!381749))))

(assert (=> b!666451 (= res!433741 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60048 res!433733) b!666429))

(assert (= (and b!666429 res!433734) b!666449))

(assert (= (and b!666449 res!433737) b!666434))

(assert (= (and b!666434 res!433740) b!666438))

(assert (= (and b!666438 res!433743) b!666435))

(assert (= (and b!666438 (not res!433725)) b!666433))

(assert (= (and b!666433 res!433738) b!666445))

(assert (= (and b!666438 res!433732) b!666432))

(assert (= (and b!666432 res!433744) b!666446))

(assert (= (and b!666446 res!433742) b!666436))

(assert (= (and b!666436 res!433726) b!666440))

(assert (= (and b!666440 res!433736) b!666451))

(assert (= (and b!666451 res!433741) b!666442))

(assert (= (and b!666442 res!433727) b!666443))

(assert (= (and b!666443 c!76720) b!666441))

(assert (= (and b!666443 (not c!76720)) b!666431))

(assert (= (and b!666443 c!76721) b!666427))

(assert (= (and b!666443 (not c!76721)) b!666444))

(assert (= (and b!666443 (not res!433735)) b!666428))

(assert (= (and b!666428 (not res!433731)) b!666448))

(assert (= (and b!666448 (not res!433729)) b!666450))

(assert (= (and b!666450 (not res!433730)) b!666430))

(assert (= (and b!666430 (not res!433728)) b!666439))

(assert (= (and b!666439 (not res!433724)) b!666437))

(assert (= (and b!666437 (not res!433739)) b!666447))

(declare-fun m!637759 () Bool)

(assert (=> b!666446 m!637759))

(declare-fun m!637761 () Bool)

(assert (=> b!666428 m!637761))

(declare-fun m!637763 () Bool)

(assert (=> b!666435 m!637763))

(assert (=> b!666450 m!637763))

(declare-fun m!637765 () Bool)

(assert (=> b!666429 m!637765))

(declare-fun m!637767 () Bool)

(assert (=> b!666443 m!637767))

(declare-fun m!637769 () Bool)

(assert (=> b!666443 m!637769))

(declare-fun m!637771 () Bool)

(assert (=> b!666443 m!637771))

(declare-fun m!637773 () Bool)

(assert (=> b!666443 m!637773))

(declare-fun m!637775 () Bool)

(assert (=> b!666443 m!637775))

(declare-fun m!637777 () Bool)

(assert (=> b!666443 m!637777))

(declare-fun m!637779 () Bool)

(assert (=> b!666443 m!637779))

(declare-fun m!637781 () Bool)

(assert (=> b!666443 m!637781))

(assert (=> b!666443 m!637769))

(declare-fun m!637783 () Bool)

(assert (=> b!666443 m!637783))

(declare-fun m!637785 () Bool)

(assert (=> b!666443 m!637785))

(declare-fun m!637787 () Bool)

(assert (=> b!666443 m!637787))

(declare-fun m!637789 () Bool)

(assert (=> b!666430 m!637789))

(declare-fun m!637791 () Bool)

(assert (=> b!666437 m!637791))

(declare-fun m!637793 () Bool)

(assert (=> b!666434 m!637793))

(declare-fun m!637795 () Bool)

(assert (=> b!666447 m!637795))

(assert (=> b!666427 m!637767))

(assert (=> b!666427 m!637769))

(declare-fun m!637797 () Bool)

(assert (=> b!666427 m!637797))

(declare-fun m!637799 () Bool)

(assert (=> b!666427 m!637799))

(assert (=> b!666427 m!637769))

(assert (=> b!666427 m!637797))

(assert (=> b!666427 m!637777))

(assert (=> b!666427 m!637787))

(declare-fun m!637801 () Bool)

(assert (=> b!666441 m!637801))

(declare-fun m!637803 () Bool)

(assert (=> b!666432 m!637803))

(declare-fun m!637805 () Bool)

(assert (=> b!666451 m!637805))

(declare-fun m!637807 () Bool)

(assert (=> b!666440 m!637807))

(assert (=> b!666445 m!637763))

(declare-fun m!637809 () Bool)

(assert (=> b!666439 m!637809))

(declare-fun m!637811 () Bool)

(assert (=> start!60048 m!637811))

(declare-fun m!637813 () Bool)

(assert (=> b!666449 m!637813))

(check-sat (not b!666434) (not b!666447) (not b!666430) (not b!666450) (not b!666446) (not b!666427) (not b!666441) (not b!666451) (not b!666428) (not b!666449) (not b!666432) (not b!666443) (not b!666437) (not b!666435) (not b!666429) (not b!666440) (not b!666439) (not start!60048) (not b!666445))
(check-sat)
