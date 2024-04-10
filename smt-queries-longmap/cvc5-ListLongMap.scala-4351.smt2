; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60134 () Bool)

(assert start!60134)

(declare-fun res!437818 () Bool)

(declare-fun e!383625 () Bool)

(assert (=> start!60134 (=> (not res!437818) (not e!383625))))

(declare-datatypes ((array!39181 0))(
  ( (array!39182 (arr!18783 (Array (_ BitVec 32) (_ BitVec 64))) (size!19147 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39181)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60134 (= res!437818 (and (bvslt (size!19147 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19147 a!3626))))))

(assert (=> start!60134 e!383625))

(assert (=> start!60134 true))

(declare-fun array_inv!14579 (array!39181) Bool)

(assert (=> start!60134 (array_inv!14579 a!3626)))

(declare-fun b!671108 () Bool)

(declare-fun e!383624 () Bool)

(declare-datatypes ((List!12824 0))(
  ( (Nil!12821) (Cons!12820 (h!13865 (_ BitVec 64)) (t!19052 List!12824)) )
))
(declare-fun acc!681 () List!12824)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3401 (List!12824 (_ BitVec 64)) Bool)

(assert (=> b!671108 (= e!383624 (not (contains!3401 acc!681 k!2843)))))

(declare-fun b!671109 () Bool)

(declare-fun res!437814 () Bool)

(assert (=> b!671109 (=> (not res!437814) (not e!383625))))

(declare-fun noDuplicate!648 (List!12824) Bool)

(assert (=> b!671109 (= res!437814 (noDuplicate!648 acc!681))))

(declare-fun b!671110 () Bool)

(declare-fun res!437812 () Bool)

(assert (=> b!671110 (=> (not res!437812) (not e!383625))))

(declare-fun arrayContainsKey!0 (array!39181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671110 (= res!437812 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671111 () Bool)

(declare-fun e!383623 () Bool)

(assert (=> b!671111 (= e!383623 (contains!3401 acc!681 k!2843))))

(declare-fun b!671112 () Bool)

(declare-fun res!437807 () Bool)

(assert (=> b!671112 (=> (not res!437807) (not e!383625))))

(assert (=> b!671112 (= res!437807 (not (contains!3401 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671113 () Bool)

(declare-fun res!437806 () Bool)

(assert (=> b!671113 (=> (not res!437806) (not e!383625))))

(assert (=> b!671113 (= res!437806 (not (contains!3401 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671114 () Bool)

(declare-fun e!383621 () Bool)

(assert (=> b!671114 (= e!383621 e!383624)))

(declare-fun res!437811 () Bool)

(assert (=> b!671114 (=> (not res!437811) (not e!383624))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671114 (= res!437811 (bvsle from!3004 i!1382))))

(declare-fun b!671115 () Bool)

(declare-fun res!437816 () Bool)

(assert (=> b!671115 (=> (not res!437816) (not e!383625))))

(assert (=> b!671115 (= res!437816 (= (select (arr!18783 a!3626) from!3004) k!2843))))

(declare-fun b!671116 () Bool)

(assert (=> b!671116 (= e!383625 (not true))))

(assert (=> b!671116 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671117 () Bool)

(declare-fun res!437817 () Bool)

(assert (=> b!671117 (=> (not res!437817) (not e!383625))))

(assert (=> b!671117 (= res!437817 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19147 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671118 () Bool)

(declare-fun res!437819 () Bool)

(assert (=> b!671118 (=> (not res!437819) (not e!383625))))

(declare-fun arrayNoDuplicates!0 (array!39181 (_ BitVec 32) List!12824) Bool)

(assert (=> b!671118 (= res!437819 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671119 () Bool)

(declare-fun res!437805 () Bool)

(assert (=> b!671119 (=> (not res!437805) (not e!383625))))

(assert (=> b!671119 (= res!437805 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19147 a!3626))))))

(declare-fun b!671120 () Bool)

(declare-fun res!437809 () Bool)

(assert (=> b!671120 (=> (not res!437809) (not e!383625))))

(assert (=> b!671120 (= res!437809 e!383621)))

(declare-fun res!437815 () Bool)

(assert (=> b!671120 (=> res!437815 e!383621)))

(assert (=> b!671120 (= res!437815 e!383623)))

(declare-fun res!437804 () Bool)

(assert (=> b!671120 (=> (not res!437804) (not e!383623))))

(assert (=> b!671120 (= res!437804 (bvsgt from!3004 i!1382))))

(declare-fun b!671121 () Bool)

(declare-fun res!437808 () Bool)

(assert (=> b!671121 (=> (not res!437808) (not e!383625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671121 (= res!437808 (validKeyInArray!0 k!2843))))

(declare-fun b!671122 () Bool)

(declare-fun res!437813 () Bool)

(assert (=> b!671122 (=> (not res!437813) (not e!383625))))

(assert (=> b!671122 (= res!437813 (validKeyInArray!0 (select (arr!18783 a!3626) from!3004)))))

(declare-fun b!671123 () Bool)

(declare-fun res!437810 () Bool)

(assert (=> b!671123 (=> (not res!437810) (not e!383625))))

(assert (=> b!671123 (= res!437810 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12821))))

(assert (= (and start!60134 res!437818) b!671109))

(assert (= (and b!671109 res!437814) b!671112))

(assert (= (and b!671112 res!437807) b!671113))

(assert (= (and b!671113 res!437806) b!671120))

(assert (= (and b!671120 res!437804) b!671111))

(assert (= (and b!671120 (not res!437815)) b!671114))

(assert (= (and b!671114 res!437811) b!671108))

(assert (= (and b!671120 res!437809) b!671123))

(assert (= (and b!671123 res!437810) b!671118))

(assert (= (and b!671118 res!437819) b!671119))

(assert (= (and b!671119 res!437805) b!671121))

(assert (= (and b!671121 res!437808) b!671110))

(assert (= (and b!671110 res!437812) b!671117))

(assert (= (and b!671117 res!437817) b!671122))

(assert (= (and b!671122 res!437813) b!671115))

(assert (= (and b!671115 res!437816) b!671116))

(declare-fun m!640757 () Bool)

(assert (=> b!671116 m!640757))

(declare-fun m!640759 () Bool)

(assert (=> b!671121 m!640759))

(declare-fun m!640761 () Bool)

(assert (=> start!60134 m!640761))

(declare-fun m!640763 () Bool)

(assert (=> b!671118 m!640763))

(declare-fun m!640765 () Bool)

(assert (=> b!671110 m!640765))

(declare-fun m!640767 () Bool)

(assert (=> b!671111 m!640767))

(declare-fun m!640769 () Bool)

(assert (=> b!671122 m!640769))

(assert (=> b!671122 m!640769))

(declare-fun m!640771 () Bool)

(assert (=> b!671122 m!640771))

(assert (=> b!671115 m!640769))

(declare-fun m!640773 () Bool)

(assert (=> b!671109 m!640773))

(declare-fun m!640775 () Bool)

(assert (=> b!671113 m!640775))

(declare-fun m!640777 () Bool)

(assert (=> b!671123 m!640777))

(declare-fun m!640779 () Bool)

(assert (=> b!671112 m!640779))

(assert (=> b!671108 m!640767))

(push 1)

(assert (not b!671123))

(assert (not start!60134))

(assert (not b!671111))

(assert (not b!671121))

(assert (not b!671116))

(assert (not b!671113))

(assert (not b!671122))

(assert (not b!671109))

(assert (not b!671112))

(assert (not b!671108))

(assert (not b!671110))

(assert (not b!671118))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

