; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60988 () Bool)

(assert start!60988)

(declare-fun b!684048 () Bool)

(declare-fun res!449687 () Bool)

(declare-fun e!389626 () Bool)

(assert (=> b!684048 (=> (not res!449687) (not e!389626))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39597 0))(
  ( (array!39598 (arr!18979 (Array (_ BitVec 32) (_ BitVec 64))) (size!19346 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39597)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!684048 (= res!449687 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19346 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684049 () Bool)

(declare-datatypes ((Unit!24062 0))(
  ( (Unit!24063) )
))
(declare-fun e!389628 () Unit!24062)

(declare-fun Unit!24064 () Unit!24062)

(assert (=> b!684049 (= e!389628 Unit!24064)))

(declare-fun lt!314147 () Unit!24062)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39597 (_ BitVec 64) (_ BitVec 32)) Unit!24062)

(assert (=> b!684049 (= lt!314147 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!684049 false))

(declare-fun b!684050 () Bool)

(declare-fun e!389621 () Unit!24062)

(declare-fun lt!314149 () Unit!24062)

(assert (=> b!684050 (= e!389621 lt!314149)))

(declare-fun lt!314146 () Unit!24062)

(declare-datatypes ((List!13020 0))(
  ( (Nil!13017) (Cons!13016 (h!14061 (_ BitVec 64)) (t!19266 List!13020)) )
))
(declare-fun acc!681 () List!13020)

(declare-fun lemmaListSubSeqRefl!0 (List!13020) Unit!24062)

(assert (=> b!684050 (= lt!314146 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!183 (List!13020 List!13020) Bool)

(assert (=> b!684050 (subseq!183 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39597 List!13020 List!13020 (_ BitVec 32)) Unit!24062)

(declare-fun $colon$colon!348 (List!13020 (_ BitVec 64)) List!13020)

(assert (=> b!684050 (= lt!314149 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!348 acc!681 (select (arr!18979 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39597 (_ BitVec 32) List!13020) Bool)

(assert (=> b!684050 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684051 () Bool)

(declare-fun e!389623 () Bool)

(declare-fun contains!3597 (List!13020 (_ BitVec 64)) Bool)

(assert (=> b!684051 (= e!389623 (contains!3597 acc!681 k0!2843))))

(declare-fun b!684052 () Bool)

(declare-fun res!449693 () Bool)

(assert (=> b!684052 (=> (not res!449693) (not e!389626))))

(declare-fun arrayContainsKey!0 (array!39597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684052 (= res!449693 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684053 () Bool)

(declare-fun res!449686 () Bool)

(declare-fun e!389624 () Bool)

(assert (=> b!684053 (=> res!449686 e!389624)))

(declare-fun lt!314144 () Bool)

(assert (=> b!684053 (= res!449686 lt!314144)))

(declare-fun b!684054 () Bool)

(declare-fun res!449699 () Bool)

(assert (=> b!684054 (=> (not res!449699) (not e!389626))))

(declare-fun noDuplicate!844 (List!13020) Bool)

(assert (=> b!684054 (= res!449699 (noDuplicate!844 acc!681))))

(declare-fun b!684055 () Bool)

(declare-fun Unit!24065 () Unit!24062)

(assert (=> b!684055 (= e!389628 Unit!24065)))

(declare-fun b!684056 () Bool)

(declare-fun res!449692 () Bool)

(assert (=> b!684056 (=> (not res!449692) (not e!389626))))

(assert (=> b!684056 (= res!449692 (not (contains!3597 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684057 () Bool)

(declare-fun Unit!24066 () Unit!24062)

(assert (=> b!684057 (= e!389621 Unit!24066)))

(declare-fun b!684058 () Bool)

(declare-fun res!449702 () Bool)

(assert (=> b!684058 (=> (not res!449702) (not e!389626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684058 (= res!449702 (validKeyInArray!0 k0!2843))))

(declare-fun b!684059 () Bool)

(assert (=> b!684059 (= e!389624 (not (contains!3597 acc!681 k0!2843)))))

(declare-fun b!684060 () Bool)

(declare-fun e!389622 () Bool)

(declare-fun e!389627 () Bool)

(assert (=> b!684060 (= e!389622 e!389627)))

(declare-fun res!449701 () Bool)

(assert (=> b!684060 (=> (not res!449701) (not e!389627))))

(assert (=> b!684060 (= res!449701 (bvsle from!3004 i!1382))))

(declare-fun b!684061 () Bool)

(declare-fun res!449696 () Bool)

(assert (=> b!684061 (=> res!449696 e!389624)))

(declare-fun lt!314142 () List!13020)

(assert (=> b!684061 (= res!449696 (not (noDuplicate!844 lt!314142)))))

(declare-fun b!684062 () Bool)

(declare-fun res!449691 () Bool)

(assert (=> b!684062 (=> (not res!449691) (not e!389626))))

(assert (=> b!684062 (= res!449691 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19346 a!3626))))))

(declare-fun b!684063 () Bool)

(declare-fun res!449695 () Bool)

(assert (=> b!684063 (=> (not res!449695) (not e!389626))))

(assert (=> b!684063 (= res!449695 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13017))))

(declare-fun b!684064 () Bool)

(assert (=> b!684064 (= e!389626 (not e!389624))))

(declare-fun res!449690 () Bool)

(assert (=> b!684064 (=> res!449690 e!389624)))

(assert (=> b!684064 (= res!449690 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!148 (List!13020 (_ BitVec 64)) List!13020)

(assert (=> b!684064 (= (-!148 lt!314142 k0!2843) acc!681)))

(assert (=> b!684064 (= lt!314142 ($colon$colon!348 acc!681 k0!2843))))

(declare-fun lt!314143 () Unit!24062)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13020) Unit!24062)

(assert (=> b!684064 (= lt!314143 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!684064 (subseq!183 acc!681 acc!681)))

(declare-fun lt!314141 () Unit!24062)

(assert (=> b!684064 (= lt!314141 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684064 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314145 () Unit!24062)

(assert (=> b!684064 (= lt!314145 e!389621)))

(declare-fun c!77548 () Bool)

(assert (=> b!684064 (= c!77548 (validKeyInArray!0 (select (arr!18979 a!3626) from!3004)))))

(declare-fun lt!314148 () Unit!24062)

(assert (=> b!684064 (= lt!314148 e!389628)))

(declare-fun c!77549 () Bool)

(assert (=> b!684064 (= c!77549 lt!314144)))

(assert (=> b!684064 (= lt!314144 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684064 (arrayContainsKey!0 (array!39598 (store (arr!18979 a!3626) i!1382 k0!2843) (size!19346 a!3626)) k0!2843 from!3004)))

(declare-fun res!449697 () Bool)

(assert (=> start!60988 (=> (not res!449697) (not e!389626))))

(assert (=> start!60988 (= res!449697 (and (bvslt (size!19346 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19346 a!3626))))))

(assert (=> start!60988 e!389626))

(assert (=> start!60988 true))

(declare-fun array_inv!14775 (array!39597) Bool)

(assert (=> start!60988 (array_inv!14775 a!3626)))

(declare-fun b!684065 () Bool)

(declare-fun res!449688 () Bool)

(assert (=> b!684065 (=> (not res!449688) (not e!389626))))

(assert (=> b!684065 (= res!449688 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684066 () Bool)

(declare-fun res!449694 () Bool)

(assert (=> b!684066 (=> (not res!449694) (not e!389626))))

(assert (=> b!684066 (= res!449694 e!389622)))

(declare-fun res!449700 () Bool)

(assert (=> b!684066 (=> res!449700 e!389622)))

(assert (=> b!684066 (= res!449700 e!389623)))

(declare-fun res!449698 () Bool)

(assert (=> b!684066 (=> (not res!449698) (not e!389623))))

(assert (=> b!684066 (= res!449698 (bvsgt from!3004 i!1382))))

(declare-fun b!684067 () Bool)

(assert (=> b!684067 (= e!389627 (not (contains!3597 acc!681 k0!2843)))))

(declare-fun b!684068 () Bool)

(declare-fun res!449689 () Bool)

(assert (=> b!684068 (=> (not res!449689) (not e!389626))))

(assert (=> b!684068 (= res!449689 (not (contains!3597 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60988 res!449697) b!684054))

(assert (= (and b!684054 res!449699) b!684068))

(assert (= (and b!684068 res!449689) b!684056))

(assert (= (and b!684056 res!449692) b!684066))

(assert (= (and b!684066 res!449698) b!684051))

(assert (= (and b!684066 (not res!449700)) b!684060))

(assert (= (and b!684060 res!449701) b!684067))

(assert (= (and b!684066 res!449694) b!684063))

(assert (= (and b!684063 res!449695) b!684065))

(assert (= (and b!684065 res!449688) b!684062))

(assert (= (and b!684062 res!449691) b!684058))

(assert (= (and b!684058 res!449702) b!684052))

(assert (= (and b!684052 res!449693) b!684048))

(assert (= (and b!684048 res!449687) b!684064))

(assert (= (and b!684064 c!77549) b!684049))

(assert (= (and b!684064 (not c!77549)) b!684055))

(assert (= (and b!684064 c!77548) b!684050))

(assert (= (and b!684064 (not c!77548)) b!684057))

(assert (= (and b!684064 (not res!449690)) b!684061))

(assert (= (and b!684061 (not res!449696)) b!684053))

(assert (= (and b!684053 (not res!449686)) b!684059))

(declare-fun m!648497 () Bool)

(assert (=> b!684058 m!648497))

(declare-fun m!648499 () Bool)

(assert (=> b!684059 m!648499))

(declare-fun m!648501 () Bool)

(assert (=> b!684068 m!648501))

(declare-fun m!648503 () Bool)

(assert (=> b!684052 m!648503))

(declare-fun m!648505 () Bool)

(assert (=> b!684061 m!648505))

(declare-fun m!648507 () Bool)

(assert (=> b!684049 m!648507))

(declare-fun m!648509 () Bool)

(assert (=> b!684054 m!648509))

(declare-fun m!648511 () Bool)

(assert (=> start!60988 m!648511))

(assert (=> b!684067 m!648499))

(declare-fun m!648513 () Bool)

(assert (=> b!684065 m!648513))

(declare-fun m!648515 () Bool)

(assert (=> b!684056 m!648515))

(declare-fun m!648517 () Bool)

(assert (=> b!684063 m!648517))

(declare-fun m!648519 () Bool)

(assert (=> b!684064 m!648519))

(declare-fun m!648521 () Bool)

(assert (=> b!684064 m!648521))

(declare-fun m!648523 () Bool)

(assert (=> b!684064 m!648523))

(declare-fun m!648525 () Bool)

(assert (=> b!684064 m!648525))

(declare-fun m!648527 () Bool)

(assert (=> b!684064 m!648527))

(declare-fun m!648529 () Bool)

(assert (=> b!684064 m!648529))

(declare-fun m!648531 () Bool)

(assert (=> b!684064 m!648531))

(declare-fun m!648533 () Bool)

(assert (=> b!684064 m!648533))

(assert (=> b!684064 m!648521))

(declare-fun m!648535 () Bool)

(assert (=> b!684064 m!648535))

(declare-fun m!648537 () Bool)

(assert (=> b!684064 m!648537))

(declare-fun m!648539 () Bool)

(assert (=> b!684064 m!648539))

(assert (=> b!684050 m!648519))

(assert (=> b!684050 m!648521))

(declare-fun m!648541 () Bool)

(assert (=> b!684050 m!648541))

(declare-fun m!648543 () Bool)

(assert (=> b!684050 m!648543))

(assert (=> b!684050 m!648521))

(assert (=> b!684050 m!648541))

(assert (=> b!684050 m!648527))

(assert (=> b!684050 m!648539))

(assert (=> b!684051 m!648499))

(check-sat (not b!684067) (not b!684052) (not b!684051) (not b!684050) (not start!60988) (not b!684068) (not b!684056) (not b!684054) (not b!684059) (not b!684064) (not b!684063) (not b!684061) (not b!684049) (not b!684058) (not b!684065))
(check-sat)
