; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59934 () Bool)

(assert start!59934)

(declare-fun b!664110 () Bool)

(declare-fun res!431862 () Bool)

(declare-fun e!380933 () Bool)

(assert (=> b!664110 (=> (not res!431862) (not e!380933))))

(declare-datatypes ((array!38981 0))(
  ( (array!38982 (arr!18683 (Array (_ BitVec 32) (_ BitVec 64))) (size!19047 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38981)

(declare-datatypes ((List!12724 0))(
  ( (Nil!12721) (Cons!12720 (h!13765 (_ BitVec 64)) (t!18952 List!12724)) )
))
(declare-fun arrayNoDuplicates!0 (array!38981 (_ BitVec 32) List!12724) Bool)

(assert (=> b!664110 (= res!431862 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12721))))

(declare-fun b!664111 () Bool)

(assert (=> b!664111 (= e!380933 (not true))))

(declare-fun lt!309490 () Bool)

(declare-fun acc!681 () List!12724)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3301 (List!12724 (_ BitVec 64)) Bool)

(assert (=> b!664111 (= lt!309490 (contains!3301 acc!681 k!2843))))

(declare-fun subseq!40 (List!12724 List!12724) Bool)

(assert (=> b!664111 (subseq!40 acc!681 acc!681)))

(declare-datatypes ((Unit!23140 0))(
  ( (Unit!23141) )
))
(declare-fun lt!309489 () Unit!23140)

(declare-fun lemmaListSubSeqRefl!0 (List!12724) Unit!23140)

(assert (=> b!664111 (= lt!309489 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664111 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309488 () Unit!23140)

(declare-fun e!380931 () Unit!23140)

(assert (=> b!664111 (= lt!309488 e!380931)))

(declare-fun c!76496 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664111 (= c!76496 (validKeyInArray!0 (select (arr!18683 a!3626) from!3004)))))

(declare-fun lt!309493 () Unit!23140)

(declare-fun e!380932 () Unit!23140)

(assert (=> b!664111 (= lt!309493 e!380932)))

(declare-fun c!76495 () Bool)

(declare-fun arrayContainsKey!0 (array!38981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664111 (= c!76495 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664111 (arrayContainsKey!0 (array!38982 (store (arr!18683 a!3626) i!1382 k!2843) (size!19047 a!3626)) k!2843 from!3004)))

(declare-fun b!664112 () Bool)

(declare-fun Unit!23142 () Unit!23140)

(assert (=> b!664112 (= e!380931 Unit!23142)))

(declare-fun b!664114 () Bool)

(declare-fun res!431856 () Bool)

(assert (=> b!664114 (=> (not res!431856) (not e!380933))))

(assert (=> b!664114 (= res!431856 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664115 () Bool)

(declare-fun res!431860 () Bool)

(assert (=> b!664115 (=> (not res!431860) (not e!380933))))

(assert (=> b!664115 (= res!431860 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19047 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664116 () Bool)

(declare-fun e!380934 () Bool)

(declare-fun e!380937 () Bool)

(assert (=> b!664116 (= e!380934 e!380937)))

(declare-fun res!431865 () Bool)

(assert (=> b!664116 (=> (not res!431865) (not e!380937))))

(assert (=> b!664116 (= res!431865 (bvsle from!3004 i!1382))))

(declare-fun b!664117 () Bool)

(declare-fun res!431859 () Bool)

(assert (=> b!664117 (=> (not res!431859) (not e!380933))))

(assert (=> b!664117 (= res!431859 (validKeyInArray!0 k!2843))))

(declare-fun b!664118 () Bool)

(assert (=> b!664118 (= e!380937 (not (contains!3301 acc!681 k!2843)))))

(declare-fun b!664119 () Bool)

(declare-fun res!431864 () Bool)

(assert (=> b!664119 (=> (not res!431864) (not e!380933))))

(assert (=> b!664119 (= res!431864 (not (contains!3301 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664120 () Bool)

(declare-fun e!380936 () Bool)

(assert (=> b!664120 (= e!380936 (contains!3301 acc!681 k!2843))))

(declare-fun b!664121 () Bool)

(declare-fun res!431866 () Bool)

(assert (=> b!664121 (=> (not res!431866) (not e!380933))))

(assert (=> b!664121 (= res!431866 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19047 a!3626))))))

(declare-fun b!664113 () Bool)

(declare-fun res!431854 () Bool)

(assert (=> b!664113 (=> (not res!431854) (not e!380933))))

(assert (=> b!664113 (= res!431854 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!431863 () Bool)

(assert (=> start!59934 (=> (not res!431863) (not e!380933))))

(assert (=> start!59934 (= res!431863 (and (bvslt (size!19047 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19047 a!3626))))))

(assert (=> start!59934 e!380933))

(assert (=> start!59934 true))

(declare-fun array_inv!14479 (array!38981) Bool)

(assert (=> start!59934 (array_inv!14479 a!3626)))

(declare-fun b!664122 () Bool)

(declare-fun Unit!23143 () Unit!23140)

(assert (=> b!664122 (= e!380932 Unit!23143)))

(declare-fun b!664123 () Bool)

(declare-fun res!431867 () Bool)

(assert (=> b!664123 (=> (not res!431867) (not e!380933))))

(assert (=> b!664123 (= res!431867 (not (contains!3301 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664124 () Bool)

(declare-fun lt!309492 () Unit!23140)

(assert (=> b!664124 (= e!380931 lt!309492)))

(declare-fun lt!309491 () Unit!23140)

(assert (=> b!664124 (= lt!309491 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664124 (subseq!40 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38981 List!12724 List!12724 (_ BitVec 32)) Unit!23140)

(declare-fun $colon$colon!172 (List!12724 (_ BitVec 64)) List!12724)

(assert (=> b!664124 (= lt!309492 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!172 acc!681 (select (arr!18683 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664124 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664125 () Bool)

(declare-fun Unit!23144 () Unit!23140)

(assert (=> b!664125 (= e!380932 Unit!23144)))

(declare-fun lt!309487 () Unit!23140)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38981 (_ BitVec 64) (_ BitVec 32)) Unit!23140)

(assert (=> b!664125 (= lt!309487 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664125 false))

(declare-fun b!664126 () Bool)

(declare-fun res!431857 () Bool)

(assert (=> b!664126 (=> (not res!431857) (not e!380933))))

(assert (=> b!664126 (= res!431857 e!380934)))

(declare-fun res!431858 () Bool)

(assert (=> b!664126 (=> res!431858 e!380934)))

(assert (=> b!664126 (= res!431858 e!380936)))

(declare-fun res!431855 () Bool)

(assert (=> b!664126 (=> (not res!431855) (not e!380936))))

(assert (=> b!664126 (= res!431855 (bvsgt from!3004 i!1382))))

(declare-fun b!664127 () Bool)

(declare-fun res!431861 () Bool)

(assert (=> b!664127 (=> (not res!431861) (not e!380933))))

(declare-fun noDuplicate!548 (List!12724) Bool)

(assert (=> b!664127 (= res!431861 (noDuplicate!548 acc!681))))

(assert (= (and start!59934 res!431863) b!664127))

(assert (= (and b!664127 res!431861) b!664119))

(assert (= (and b!664119 res!431864) b!664123))

(assert (= (and b!664123 res!431867) b!664126))

(assert (= (and b!664126 res!431855) b!664120))

(assert (= (and b!664126 (not res!431858)) b!664116))

(assert (= (and b!664116 res!431865) b!664118))

(assert (= (and b!664126 res!431857) b!664110))

(assert (= (and b!664110 res!431862) b!664114))

(assert (= (and b!664114 res!431856) b!664121))

(assert (= (and b!664121 res!431866) b!664117))

(assert (= (and b!664117 res!431859) b!664113))

(assert (= (and b!664113 res!431854) b!664115))

(assert (= (and b!664115 res!431860) b!664111))

(assert (= (and b!664111 c!76495) b!664125))

(assert (= (and b!664111 (not c!76495)) b!664122))

(assert (= (and b!664111 c!76496) b!664124))

(assert (= (and b!664111 (not c!76496)) b!664112))

(declare-fun m!635509 () Bool)

(assert (=> b!664113 m!635509))

(declare-fun m!635511 () Bool)

(assert (=> b!664127 m!635511))

(declare-fun m!635513 () Bool)

(assert (=> start!59934 m!635513))

(declare-fun m!635515 () Bool)

(assert (=> b!664125 m!635515))

(declare-fun m!635517 () Bool)

(assert (=> b!664114 m!635517))

(declare-fun m!635519 () Bool)

(assert (=> b!664124 m!635519))

(declare-fun m!635521 () Bool)

(assert (=> b!664124 m!635521))

(declare-fun m!635523 () Bool)

(assert (=> b!664124 m!635523))

(declare-fun m!635525 () Bool)

(assert (=> b!664124 m!635525))

(assert (=> b!664124 m!635521))

(assert (=> b!664124 m!635523))

(declare-fun m!635527 () Bool)

(assert (=> b!664124 m!635527))

(declare-fun m!635529 () Bool)

(assert (=> b!664124 m!635529))

(assert (=> b!664111 m!635519))

(assert (=> b!664111 m!635521))

(declare-fun m!635531 () Bool)

(assert (=> b!664111 m!635531))

(declare-fun m!635533 () Bool)

(assert (=> b!664111 m!635533))

(assert (=> b!664111 m!635527))

(declare-fun m!635535 () Bool)

(assert (=> b!664111 m!635535))

(assert (=> b!664111 m!635521))

(declare-fun m!635537 () Bool)

(assert (=> b!664111 m!635537))

(declare-fun m!635539 () Bool)

(assert (=> b!664111 m!635539))

(assert (=> b!664111 m!635529))

(assert (=> b!664118 m!635531))

(declare-fun m!635541 () Bool)

(assert (=> b!664110 m!635541))

(declare-fun m!635543 () Bool)

(assert (=> b!664119 m!635543))

(declare-fun m!635545 () Bool)

(assert (=> b!664117 m!635545))

(assert (=> b!664120 m!635531))

(declare-fun m!635547 () Bool)

(assert (=> b!664123 m!635547))

(push 1)

(assert (not b!664124))

(assert (not b!664118))

(assert (not b!664119))

(assert (not start!59934))

(assert (not b!664111))

(assert (not b!664114))

(assert (not b!664127))

(assert (not b!664125))

(assert (not b!664117))

(assert (not b!664110))

(assert (not b!664120))

(assert (not b!664123))

(assert (not b!664113))

