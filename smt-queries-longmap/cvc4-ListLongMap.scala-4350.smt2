; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60132 () Bool)

(assert start!60132)

(declare-fun b!671060 () Bool)

(declare-fun e!383607 () Bool)

(declare-fun e!383608 () Bool)

(assert (=> b!671060 (= e!383607 e!383608)))

(declare-fun res!437770 () Bool)

(assert (=> b!671060 (=> (not res!437770) (not e!383608))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671060 (= res!437770 (bvsle from!3004 i!1382))))

(declare-fun b!671061 () Bool)

(declare-fun res!437769 () Bool)

(declare-fun e!383606 () Bool)

(assert (=> b!671061 (=> (not res!437769) (not e!383606))))

(declare-datatypes ((List!12823 0))(
  ( (Nil!12820) (Cons!12819 (h!13864 (_ BitVec 64)) (t!19051 List!12823)) )
))
(declare-fun acc!681 () List!12823)

(declare-fun contains!3400 (List!12823 (_ BitVec 64)) Bool)

(assert (=> b!671061 (= res!437769 (not (contains!3400 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!437757 () Bool)

(assert (=> start!60132 (=> (not res!437757) (not e!383606))))

(declare-datatypes ((array!39179 0))(
  ( (array!39180 (arr!18782 (Array (_ BitVec 32) (_ BitVec 64))) (size!19146 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39179)

(assert (=> start!60132 (= res!437757 (and (bvslt (size!19146 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19146 a!3626))))))

(assert (=> start!60132 e!383606))

(assert (=> start!60132 true))

(declare-fun array_inv!14578 (array!39179) Bool)

(assert (=> start!60132 (array_inv!14578 a!3626)))

(declare-fun b!671062 () Bool)

(declare-fun res!437762 () Bool)

(assert (=> b!671062 (=> (not res!437762) (not e!383606))))

(assert (=> b!671062 (= res!437762 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19146 a!3626))))))

(declare-fun b!671063 () Bool)

(declare-fun res!437764 () Bool)

(assert (=> b!671063 (=> (not res!437764) (not e!383606))))

(declare-fun arrayNoDuplicates!0 (array!39179 (_ BitVec 32) List!12823) Bool)

(assert (=> b!671063 (= res!437764 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12820))))

(declare-fun b!671064 () Bool)

(declare-fun res!437766 () Bool)

(assert (=> b!671064 (=> (not res!437766) (not e!383606))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671064 (= res!437766 (validKeyInArray!0 k!2843))))

(declare-fun b!671065 () Bool)

(declare-fun res!437763 () Bool)

(assert (=> b!671065 (=> (not res!437763) (not e!383606))))

(assert (=> b!671065 (= res!437763 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671066 () Bool)

(declare-fun res!437758 () Bool)

(assert (=> b!671066 (=> (not res!437758) (not e!383606))))

(assert (=> b!671066 (= res!437758 (validKeyInArray!0 (select (arr!18782 a!3626) from!3004)))))

(declare-fun b!671067 () Bool)

(declare-fun res!437767 () Bool)

(assert (=> b!671067 (=> (not res!437767) (not e!383606))))

(assert (=> b!671067 (= res!437767 e!383607)))

(declare-fun res!437759 () Bool)

(assert (=> b!671067 (=> res!437759 e!383607)))

(declare-fun e!383610 () Bool)

(assert (=> b!671067 (= res!437759 e!383610)))

(declare-fun res!437760 () Bool)

(assert (=> b!671067 (=> (not res!437760) (not e!383610))))

(assert (=> b!671067 (= res!437760 (bvsgt from!3004 i!1382))))

(declare-fun b!671068 () Bool)

(assert (=> b!671068 (= e!383610 (contains!3400 acc!681 k!2843))))

(declare-fun b!671069 () Bool)

(declare-fun res!437761 () Bool)

(assert (=> b!671069 (=> (not res!437761) (not e!383606))))

(assert (=> b!671069 (= res!437761 (not (contains!3400 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671070 () Bool)

(assert (=> b!671070 (= e!383608 (not (contains!3400 acc!681 k!2843)))))

(declare-fun b!671071 () Bool)

(declare-fun res!437756 () Bool)

(assert (=> b!671071 (=> (not res!437756) (not e!383606))))

(assert (=> b!671071 (= res!437756 (= (select (arr!18782 a!3626) from!3004) k!2843))))

(declare-fun b!671072 () Bool)

(declare-fun res!437765 () Bool)

(assert (=> b!671072 (=> (not res!437765) (not e!383606))))

(assert (=> b!671072 (= res!437765 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19146 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671073 () Bool)

(declare-fun res!437771 () Bool)

(assert (=> b!671073 (=> (not res!437771) (not e!383606))))

(declare-fun noDuplicate!647 (List!12823) Bool)

(assert (=> b!671073 (= res!437771 (noDuplicate!647 acc!681))))

(declare-fun b!671074 () Bool)

(declare-fun res!437768 () Bool)

(assert (=> b!671074 (=> (not res!437768) (not e!383606))))

(declare-fun arrayContainsKey!0 (array!39179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671074 (= res!437768 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671075 () Bool)

(assert (=> b!671075 (= e!383606 (not true))))

(assert (=> b!671075 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(assert (= (and start!60132 res!437757) b!671073))

(assert (= (and b!671073 res!437771) b!671061))

(assert (= (and b!671061 res!437769) b!671069))

(assert (= (and b!671069 res!437761) b!671067))

(assert (= (and b!671067 res!437760) b!671068))

(assert (= (and b!671067 (not res!437759)) b!671060))

(assert (= (and b!671060 res!437770) b!671070))

(assert (= (and b!671067 res!437767) b!671063))

(assert (= (and b!671063 res!437764) b!671065))

(assert (= (and b!671065 res!437763) b!671062))

(assert (= (and b!671062 res!437762) b!671064))

(assert (= (and b!671064 res!437766) b!671074))

(assert (= (and b!671074 res!437768) b!671072))

(assert (= (and b!671072 res!437765) b!671066))

(assert (= (and b!671066 res!437758) b!671071))

(assert (= (and b!671071 res!437756) b!671075))

(declare-fun m!640733 () Bool)

(assert (=> b!671068 m!640733))

(declare-fun m!640735 () Bool)

(assert (=> b!671073 m!640735))

(declare-fun m!640737 () Bool)

(assert (=> b!671074 m!640737))

(declare-fun m!640739 () Bool)

(assert (=> b!671066 m!640739))

(assert (=> b!671066 m!640739))

(declare-fun m!640741 () Bool)

(assert (=> b!671066 m!640741))

(assert (=> b!671071 m!640739))

(declare-fun m!640743 () Bool)

(assert (=> b!671061 m!640743))

(declare-fun m!640745 () Bool)

(assert (=> b!671075 m!640745))

(declare-fun m!640747 () Bool)

(assert (=> b!671069 m!640747))

(declare-fun m!640749 () Bool)

(assert (=> b!671063 m!640749))

(assert (=> b!671070 m!640733))

(declare-fun m!640751 () Bool)

(assert (=> b!671064 m!640751))

(declare-fun m!640753 () Bool)

(assert (=> b!671065 m!640753))

(declare-fun m!640755 () Bool)

(assert (=> start!60132 m!640755))

(push 1)

(assert (not b!671064))

(assert (not b!671075))

(assert (not b!671069))

(assert (not b!671061))

(assert (not b!671073))

(assert (not b!671074))

(assert (not b!671070))

(assert (not start!60132))

(assert (not b!671066))

(assert (not b!671068))

(assert (not b!671063))

(assert (not b!671065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

