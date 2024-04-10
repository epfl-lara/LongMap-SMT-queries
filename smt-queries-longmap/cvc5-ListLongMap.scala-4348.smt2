; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60116 () Bool)

(assert start!60116)

(declare-fun b!670788 () Bool)

(declare-fun res!437489 () Bool)

(declare-fun e!383490 () Bool)

(assert (=> b!670788 (=> (not res!437489) (not e!383490))))

(declare-datatypes ((List!12815 0))(
  ( (Nil!12812) (Cons!12811 (h!13856 (_ BitVec 64)) (t!19043 List!12815)) )
))
(declare-fun acc!681 () List!12815)

(declare-fun contains!3392 (List!12815 (_ BitVec 64)) Bool)

(assert (=> b!670788 (= res!437489 (not (contains!3392 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670789 () Bool)

(declare-fun res!437492 () Bool)

(assert (=> b!670789 (=> (not res!437492) (not e!383490))))

(declare-fun e!383488 () Bool)

(assert (=> b!670789 (= res!437492 e!383488)))

(declare-fun res!437484 () Bool)

(assert (=> b!670789 (=> res!437484 e!383488)))

(declare-fun e!383489 () Bool)

(assert (=> b!670789 (= res!437484 e!383489)))

(declare-fun res!437485 () Bool)

(assert (=> b!670789 (=> (not res!437485) (not e!383489))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670789 (= res!437485 (bvsgt from!3004 i!1382))))

(declare-fun b!670790 () Bool)

(assert (=> b!670790 (= e!383490 false)))

(declare-datatypes ((array!39163 0))(
  ( (array!39164 (arr!18774 (Array (_ BitVec 32) (_ BitVec 64))) (size!19138 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39163)

(declare-fun lt!312151 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39163 (_ BitVec 32) List!12815) Bool)

(assert (=> b!670790 (= lt!312151 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670791 () Bool)

(declare-fun res!437486 () Bool)

(assert (=> b!670791 (=> (not res!437486) (not e!383490))))

(declare-fun noDuplicate!639 (List!12815) Bool)

(assert (=> b!670791 (= res!437486 (noDuplicate!639 acc!681))))

(declare-fun b!670792 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!670792 (= e!383489 (contains!3392 acc!681 k!2843))))

(declare-fun b!670793 () Bool)

(declare-fun e!383486 () Bool)

(assert (=> b!670793 (= e!383488 e!383486)))

(declare-fun res!437491 () Bool)

(assert (=> b!670793 (=> (not res!437491) (not e!383486))))

(assert (=> b!670793 (= res!437491 (bvsle from!3004 i!1382))))

(declare-fun b!670794 () Bool)

(assert (=> b!670794 (= e!383486 (not (contains!3392 acc!681 k!2843)))))

(declare-fun res!437490 () Bool)

(assert (=> start!60116 (=> (not res!437490) (not e!383490))))

(assert (=> start!60116 (= res!437490 (and (bvslt (size!19138 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19138 a!3626))))))

(assert (=> start!60116 e!383490))

(assert (=> start!60116 true))

(declare-fun array_inv!14570 (array!39163) Bool)

(assert (=> start!60116 (array_inv!14570 a!3626)))

(declare-fun b!670795 () Bool)

(declare-fun res!437488 () Bool)

(assert (=> b!670795 (=> (not res!437488) (not e!383490))))

(assert (=> b!670795 (= res!437488 (not (contains!3392 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670796 () Bool)

(declare-fun res!437487 () Bool)

(assert (=> b!670796 (=> (not res!437487) (not e!383490))))

(assert (=> b!670796 (= res!437487 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12812))))

(assert (= (and start!60116 res!437490) b!670791))

(assert (= (and b!670791 res!437486) b!670788))

(assert (= (and b!670788 res!437489) b!670795))

(assert (= (and b!670795 res!437488) b!670789))

(assert (= (and b!670789 res!437485) b!670792))

(assert (= (and b!670789 (not res!437484)) b!670793))

(assert (= (and b!670793 res!437491) b!670794))

(assert (= (and b!670789 res!437492) b!670796))

(assert (= (and b!670796 res!437487) b!670790))

(declare-fun m!640601 () Bool)

(assert (=> b!670796 m!640601))

(declare-fun m!640603 () Bool)

(assert (=> b!670792 m!640603))

(declare-fun m!640605 () Bool)

(assert (=> b!670791 m!640605))

(declare-fun m!640607 () Bool)

(assert (=> b!670790 m!640607))

(declare-fun m!640609 () Bool)

(assert (=> b!670795 m!640609))

(declare-fun m!640611 () Bool)

(assert (=> start!60116 m!640611))

(declare-fun m!640613 () Bool)

(assert (=> b!670788 m!640613))

(assert (=> b!670794 m!640603))

(push 1)

(assert (not b!670790))

(assert (not b!670796))

(assert (not b!670795))

(assert (not start!60116))

(assert (not b!670792))

(assert (not b!670794))

(assert (not b!670788))

(assert (not b!670791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

