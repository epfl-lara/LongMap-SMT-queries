; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60108 () Bool)

(assert start!60108)

(declare-fun b!670663 () Bool)

(declare-fun e!383427 () Bool)

(declare-fun e!383424 () Bool)

(assert (=> b!670663 (= e!383427 (not e!383424))))

(declare-fun res!437384 () Bool)

(assert (=> b!670663 (=> res!437384 e!383424)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!670663 (= res!437384 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39155 0))(
  ( (array!39156 (arr!18770 (Array (_ BitVec 32) (_ BitVec 64))) (size!19134 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39155)

(declare-datatypes ((List!12811 0))(
  ( (Nil!12808) (Cons!12807 (h!13852 (_ BitVec 64)) (t!19039 List!12811)) )
))
(declare-fun lt!312136 () List!12811)

(declare-fun arrayNoDuplicates!0 (array!39155 (_ BitVec 32) List!12811) Bool)

(assert (=> b!670663 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312136)))

(declare-datatypes ((Unit!23575 0))(
  ( (Unit!23576) )
))
(declare-fun lt!312131 () Unit!23575)

(declare-fun acc!681 () List!12811)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39155 (_ BitVec 64) (_ BitVec 32) List!12811 List!12811) Unit!23575)

(assert (=> b!670663 (= lt!312131 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!312136))))

(declare-fun -!125 (List!12811 (_ BitVec 64)) List!12811)

(assert (=> b!670663 (= (-!125 lt!312136 k!2843) acc!681)))

(declare-fun $colon$colon!259 (List!12811 (_ BitVec 64)) List!12811)

(assert (=> b!670663 (= lt!312136 ($colon$colon!259 acc!681 k!2843))))

(declare-fun lt!312135 () Unit!23575)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12811) Unit!23575)

(assert (=> b!670663 (= lt!312135 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!127 (List!12811 List!12811) Bool)

(assert (=> b!670663 (subseq!127 acc!681 acc!681)))

(declare-fun lt!312133 () Unit!23575)

(declare-fun lemmaListSubSeqRefl!0 (List!12811) Unit!23575)

(assert (=> b!670663 (= lt!312133 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670663 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!312139 () Unit!23575)

(declare-fun e!383425 () Unit!23575)

(assert (=> b!670663 (= lt!312139 e!383425)))

(declare-fun c!77017 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670663 (= c!77017 (validKeyInArray!0 (select (arr!18770 a!3626) from!3004)))))

(declare-fun lt!312138 () Unit!23575)

(declare-fun e!383421 () Unit!23575)

(assert (=> b!670663 (= lt!312138 e!383421)))

(declare-fun c!77018 () Bool)

(declare-fun arrayContainsKey!0 (array!39155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670663 (= c!77018 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!312137 () array!39155)

(assert (=> b!670663 (arrayContainsKey!0 lt!312137 k!2843 from!3004)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670663 (= lt!312137 (array!39156 (store (arr!18770 a!3626) i!1382 k!2843) (size!19134 a!3626)))))

(declare-fun b!670664 () Bool)

(declare-fun res!437378 () Bool)

(assert (=> b!670664 (=> res!437378 e!383424)))

(declare-fun contains!3388 (List!12811 (_ BitVec 64)) Bool)

(assert (=> b!670664 (= res!437378 (contains!3388 lt!312136 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670665 () Bool)

(declare-fun res!437375 () Bool)

(assert (=> b!670665 (=> res!437375 e!383424)))

(assert (=> b!670665 (= res!437375 (contains!3388 lt!312136 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670666 () Bool)

(declare-fun e!383422 () Bool)

(assert (=> b!670666 (= e!383422 (contains!3388 lt!312136 k!2843))))

(declare-fun res!437372 () Bool)

(assert (=> start!60108 (=> (not res!437372) (not e!383427))))

(assert (=> start!60108 (= res!437372 (and (bvslt (size!19134 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19134 a!3626))))))

(assert (=> start!60108 e!383427))

(assert (=> start!60108 true))

(declare-fun array_inv!14566 (array!39155) Bool)

(assert (=> start!60108 (array_inv!14566 a!3626)))

(declare-fun b!670667 () Bool)

(declare-fun e!383430 () Bool)

(assert (=> b!670667 (= e!383430 (not (contains!3388 lt!312136 k!2843)))))

(declare-fun b!670668 () Bool)

(declare-fun res!437383 () Bool)

(assert (=> b!670668 (=> (not res!437383) (not e!383427))))

(declare-fun e!383420 () Bool)

(assert (=> b!670668 (= res!437383 e!383420)))

(declare-fun res!437379 () Bool)

(assert (=> b!670668 (=> res!437379 e!383420)))

(declare-fun e!383423 () Bool)

(assert (=> b!670668 (= res!437379 e!383423)))

(declare-fun res!437370 () Bool)

(assert (=> b!670668 (=> (not res!437370) (not e!383423))))

(assert (=> b!670668 (= res!437370 (bvsgt from!3004 i!1382))))

(declare-fun b!670669 () Bool)

(assert (=> b!670669 (= e!383423 (contains!3388 acc!681 k!2843))))

(declare-fun b!670670 () Bool)

(declare-fun res!437376 () Bool)

(assert (=> b!670670 (=> (not res!437376) (not e!383427))))

(assert (=> b!670670 (= res!437376 (not (contains!3388 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670671 () Bool)

(declare-fun res!437377 () Bool)

(assert (=> b!670671 (=> res!437377 e!383424)))

(declare-fun e!383428 () Bool)

(assert (=> b!670671 (= res!437377 e!383428)))

(declare-fun res!437373 () Bool)

(assert (=> b!670671 (=> (not res!437373) (not e!383428))))

(assert (=> b!670671 (= res!437373 e!383430)))

(declare-fun res!437380 () Bool)

(assert (=> b!670671 (=> res!437380 e!383430)))

(assert (=> b!670671 (= res!437380 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670672 () Bool)

(declare-fun res!437365 () Bool)

(assert (=> b!670672 (=> res!437365 e!383424)))

(declare-fun noDuplicate!635 (List!12811) Bool)

(assert (=> b!670672 (= res!437365 (not (noDuplicate!635 lt!312136)))))

(declare-fun b!670673 () Bool)

(declare-fun res!437382 () Bool)

(assert (=> b!670673 (=> (not res!437382) (not e!383427))))

(assert (=> b!670673 (= res!437382 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12808))))

(declare-fun b!670674 () Bool)

(declare-fun res!437381 () Bool)

(assert (=> b!670674 (=> (not res!437381) (not e!383427))))

(assert (=> b!670674 (= res!437381 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670675 () Bool)

(declare-fun lt!312132 () Unit!23575)

(assert (=> b!670675 (= e!383425 lt!312132)))

(declare-fun lt!312129 () Unit!23575)

(assert (=> b!670675 (= lt!312129 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670675 (subseq!127 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39155 List!12811 List!12811 (_ BitVec 32)) Unit!23575)

(assert (=> b!670675 (= lt!312132 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!259 acc!681 (select (arr!18770 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670675 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670676 () Bool)

(declare-fun Unit!23577 () Unit!23575)

(assert (=> b!670676 (= e!383421 Unit!23577)))

(declare-fun lt!312134 () Unit!23575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39155 (_ BitVec 64) (_ BitVec 32)) Unit!23575)

(assert (=> b!670676 (= lt!312134 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!670676 false))

(declare-fun b!670677 () Bool)

(declare-fun e!383429 () Bool)

(assert (=> b!670677 (= e!383420 e!383429)))

(declare-fun res!437371 () Bool)

(assert (=> b!670677 (=> (not res!437371) (not e!383429))))

(assert (=> b!670677 (= res!437371 (bvsle from!3004 i!1382))))

(declare-fun b!670678 () Bool)

(declare-fun res!437366 () Bool)

(assert (=> b!670678 (=> (not res!437366) (not e!383427))))

(assert (=> b!670678 (= res!437366 (noDuplicate!635 acc!681))))

(declare-fun b!670679 () Bool)

(assert (=> b!670679 (= e!383428 e!383422)))

(declare-fun res!437368 () Bool)

(assert (=> b!670679 (=> res!437368 e!383422)))

(assert (=> b!670679 (= res!437368 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670680 () Bool)

(assert (=> b!670680 (= e!383429 (not (contains!3388 acc!681 k!2843)))))

(declare-fun b!670681 () Bool)

(declare-fun res!437374 () Bool)

(assert (=> b!670681 (=> (not res!437374) (not e!383427))))

(assert (=> b!670681 (= res!437374 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670682 () Bool)

(declare-fun res!437369 () Bool)

(assert (=> b!670682 (=> (not res!437369) (not e!383427))))

(assert (=> b!670682 (= res!437369 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19134 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670683 () Bool)

(declare-fun Unit!23578 () Unit!23575)

(assert (=> b!670683 (= e!383421 Unit!23578)))

(declare-fun b!670684 () Bool)

(assert (=> b!670684 (= e!383424 true)))

(assert (=> b!670684 (arrayNoDuplicates!0 lt!312137 (bvadd #b00000000000000000000000000000001 from!3004) lt!312136)))

(declare-fun lt!312130 () Unit!23575)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12811) Unit!23575)

(assert (=> b!670684 (= lt!312130 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312136))))

(declare-fun b!670685 () Bool)

(declare-fun Unit!23579 () Unit!23575)

(assert (=> b!670685 (= e!383425 Unit!23579)))

(declare-fun b!670686 () Bool)

(declare-fun res!437367 () Bool)

(assert (=> b!670686 (=> (not res!437367) (not e!383427))))

(assert (=> b!670686 (= res!437367 (not (contains!3388 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670687 () Bool)

(declare-fun res!437364 () Bool)

(assert (=> b!670687 (=> (not res!437364) (not e!383427))))

(assert (=> b!670687 (= res!437364 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19134 a!3626))))))

(declare-fun b!670688 () Bool)

(declare-fun res!437363 () Bool)

(assert (=> b!670688 (=> (not res!437363) (not e!383427))))

(assert (=> b!670688 (= res!437363 (validKeyInArray!0 k!2843))))

(assert (= (and start!60108 res!437372) b!670678))

(assert (= (and b!670678 res!437366) b!670686))

(assert (= (and b!670686 res!437367) b!670670))

(assert (= (and b!670670 res!437376) b!670668))

(assert (= (and b!670668 res!437370) b!670669))

(assert (= (and b!670668 (not res!437379)) b!670677))

(assert (= (and b!670677 res!437371) b!670680))

(assert (= (and b!670668 res!437383) b!670673))

(assert (= (and b!670673 res!437382) b!670681))

(assert (= (and b!670681 res!437374) b!670687))

(assert (= (and b!670687 res!437364) b!670688))

(assert (= (and b!670688 res!437363) b!670674))

(assert (= (and b!670674 res!437381) b!670682))

(assert (= (and b!670682 res!437369) b!670663))

(assert (= (and b!670663 c!77018) b!670676))

(assert (= (and b!670663 (not c!77018)) b!670683))

(assert (= (and b!670663 c!77017) b!670675))

(assert (= (and b!670663 (not c!77017)) b!670685))

(assert (= (and b!670663 (not res!437384)) b!670672))

(assert (= (and b!670672 (not res!437365)) b!670665))

(assert (= (and b!670665 (not res!437375)) b!670664))

(assert (= (and b!670664 (not res!437378)) b!670671))

(assert (= (and b!670671 (not res!437380)) b!670667))

(assert (= (and b!670671 res!437373) b!670679))

(assert (= (and b!670679 (not res!437368)) b!670666))

(assert (= (and b!670671 (not res!437377)) b!670684))

(declare-fun m!640497 () Bool)

(assert (=> b!670684 m!640497))

(declare-fun m!640499 () Bool)

(assert (=> b!670684 m!640499))

(declare-fun m!640501 () Bool)

(assert (=> b!670686 m!640501))

(declare-fun m!640503 () Bool)

(assert (=> b!670676 m!640503))

(declare-fun m!640505 () Bool)

(assert (=> b!670665 m!640505))

(declare-fun m!640507 () Bool)

(assert (=> b!670667 m!640507))

(declare-fun m!640509 () Bool)

(assert (=> b!670663 m!640509))

(declare-fun m!640511 () Bool)

(assert (=> b!670663 m!640511))

(declare-fun m!640513 () Bool)

(assert (=> b!670663 m!640513))

(declare-fun m!640515 () Bool)

(assert (=> b!670663 m!640515))

(declare-fun m!640517 () Bool)

(assert (=> b!670663 m!640517))

(declare-fun m!640519 () Bool)

(assert (=> b!670663 m!640519))

(declare-fun m!640521 () Bool)

(assert (=> b!670663 m!640521))

(declare-fun m!640523 () Bool)

(assert (=> b!670663 m!640523))

(declare-fun m!640525 () Bool)

(assert (=> b!670663 m!640525))

(declare-fun m!640527 () Bool)

(assert (=> b!670663 m!640527))

(assert (=> b!670663 m!640523))

(declare-fun m!640529 () Bool)

(assert (=> b!670663 m!640529))

(declare-fun m!640531 () Bool)

(assert (=> b!670663 m!640531))

(declare-fun m!640533 () Bool)

(assert (=> b!670663 m!640533))

(declare-fun m!640535 () Bool)

(assert (=> b!670673 m!640535))

(declare-fun m!640537 () Bool)

(assert (=> b!670681 m!640537))

(assert (=> b!670666 m!640507))

(declare-fun m!640539 () Bool)

(assert (=> b!670674 m!640539))

(declare-fun m!640541 () Bool)

(assert (=> b!670688 m!640541))

(declare-fun m!640543 () Bool)

(assert (=> b!670669 m!640543))

(declare-fun m!640545 () Bool)

(assert (=> start!60108 m!640545))

(declare-fun m!640547 () Bool)

(assert (=> b!670678 m!640547))

(declare-fun m!640549 () Bool)

(assert (=> b!670670 m!640549))

(declare-fun m!640551 () Bool)

(assert (=> b!670672 m!640551))

(declare-fun m!640553 () Bool)

(assert (=> b!670664 m!640553))

(assert (=> b!670680 m!640543))

(assert (=> b!670675 m!640509))

(assert (=> b!670675 m!640523))

(declare-fun m!640555 () Bool)

(assert (=> b!670675 m!640555))

(declare-fun m!640557 () Bool)

(assert (=> b!670675 m!640557))

(assert (=> b!670675 m!640523))

(assert (=> b!670675 m!640555))

(assert (=> b!670675 m!640517))

(assert (=> b!670675 m!640527))

(push 1)

(assert (not b!670673))

(assert (not b!670676))

(assert (not b!670669))

(assert (not b!670686))

(assert (not b!670672))

(assert (not b!670680))

(assert (not b!670678))

(assert (not b!670667))

(assert (not b!670666))

(assert (not b!670681))

(assert (not b!670688))

(assert (not b!670670))

(assert (not b!670665))

(assert (not b!670664))

(assert (not b!670675))

(assert (not start!60108))

(assert (not b!670663))

(assert (not b!670674))

(assert (not b!670684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

