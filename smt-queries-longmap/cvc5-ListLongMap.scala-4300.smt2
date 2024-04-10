; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59828 () Bool)

(assert start!59828)

(declare-fun b!661132 () Bool)

(declare-fun res!429207 () Bool)

(declare-fun e!379834 () Bool)

(assert (=> b!661132 (=> (not res!429207) (not e!379834))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38875 0))(
  ( (array!38876 (arr!18630 (Array (_ BitVec 32) (_ BitVec 64))) (size!18994 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38875)

(assert (=> b!661132 (= res!429207 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18994 a!3626))))))

(declare-fun b!661133 () Bool)

(declare-fun res!429199 () Bool)

(assert (=> b!661133 (=> (not res!429199) (not e!379834))))

(declare-datatypes ((List!12671 0))(
  ( (Nil!12668) (Cons!12667 (h!13712 (_ BitVec 64)) (t!18899 List!12671)) )
))
(declare-fun acc!681 () List!12671)

(declare-fun contains!3248 (List!12671 (_ BitVec 64)) Bool)

(assert (=> b!661133 (= res!429199 (not (contains!3248 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661134 () Bool)

(declare-fun res!429204 () Bool)

(assert (=> b!661134 (=> (not res!429204) (not e!379834))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661134 (= res!429204 (validKeyInArray!0 k!2843))))

(declare-fun b!661135 () Bool)

(declare-fun e!379835 () Bool)

(declare-fun e!379833 () Bool)

(assert (=> b!661135 (= e!379835 e!379833)))

(declare-fun res!429201 () Bool)

(assert (=> b!661135 (=> (not res!429201) (not e!379833))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!661135 (= res!429201 (bvsle from!3004 i!1382))))

(declare-fun b!661136 () Bool)

(declare-fun res!429202 () Bool)

(assert (=> b!661136 (=> (not res!429202) (not e!379834))))

(assert (=> b!661136 (= res!429202 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18994 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661137 () Bool)

(declare-fun res!429209 () Bool)

(assert (=> b!661137 (=> (not res!429209) (not e!379834))))

(assert (=> b!661137 (= res!429209 (not (contains!3248 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!429203 () Bool)

(assert (=> start!59828 (=> (not res!429203) (not e!379834))))

(assert (=> start!59828 (= res!429203 (and (bvslt (size!18994 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18994 a!3626))))))

(assert (=> start!59828 e!379834))

(assert (=> start!59828 true))

(declare-fun array_inv!14426 (array!38875) Bool)

(assert (=> start!59828 (array_inv!14426 a!3626)))

(declare-fun b!661138 () Bool)

(declare-fun e!379836 () Bool)

(assert (=> b!661138 (= e!379836 (contains!3248 acc!681 k!2843))))

(declare-fun b!661139 () Bool)

(declare-fun res!429198 () Bool)

(assert (=> b!661139 (=> (not res!429198) (not e!379834))))

(declare-fun arrayNoDuplicates!0 (array!38875 (_ BitVec 32) List!12671) Bool)

(assert (=> b!661139 (= res!429198 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661140 () Bool)

(declare-fun res!429205 () Bool)

(assert (=> b!661140 (=> (not res!429205) (not e!379834))))

(assert (=> b!661140 (= res!429205 e!379835)))

(declare-fun res!429197 () Bool)

(assert (=> b!661140 (=> res!429197 e!379835)))

(assert (=> b!661140 (= res!429197 e!379836)))

(declare-fun res!429196 () Bool)

(assert (=> b!661140 (=> (not res!429196) (not e!379836))))

(assert (=> b!661140 (= res!429196 (bvsgt from!3004 i!1382))))

(declare-fun b!661141 () Bool)

(assert (=> b!661141 (= e!379834 (not true))))

(declare-fun arrayContainsKey!0 (array!38875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661141 (arrayContainsKey!0 (array!38876 (store (arr!18630 a!3626) i!1382 k!2843) (size!18994 a!3626)) k!2843 from!3004)))

(declare-fun b!661142 () Bool)

(assert (=> b!661142 (= e!379833 (not (contains!3248 acc!681 k!2843)))))

(declare-fun b!661143 () Bool)

(declare-fun res!429206 () Bool)

(assert (=> b!661143 (=> (not res!429206) (not e!379834))))

(assert (=> b!661143 (= res!429206 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661144 () Bool)

(declare-fun res!429208 () Bool)

(assert (=> b!661144 (=> (not res!429208) (not e!379834))))

(assert (=> b!661144 (= res!429208 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12668))))

(declare-fun b!661145 () Bool)

(declare-fun res!429200 () Bool)

(assert (=> b!661145 (=> (not res!429200) (not e!379834))))

(declare-fun noDuplicate!495 (List!12671) Bool)

(assert (=> b!661145 (= res!429200 (noDuplicate!495 acc!681))))

(assert (= (and start!59828 res!429203) b!661145))

(assert (= (and b!661145 res!429200) b!661133))

(assert (= (and b!661133 res!429199) b!661137))

(assert (= (and b!661137 res!429209) b!661140))

(assert (= (and b!661140 res!429196) b!661138))

(assert (= (and b!661140 (not res!429197)) b!661135))

(assert (= (and b!661135 res!429201) b!661142))

(assert (= (and b!661140 res!429205) b!661144))

(assert (= (and b!661144 res!429208) b!661139))

(assert (= (and b!661139 res!429198) b!661132))

(assert (= (and b!661132 res!429207) b!661134))

(assert (= (and b!661134 res!429204) b!661143))

(assert (= (and b!661143 res!429206) b!661136))

(assert (= (and b!661136 res!429202) b!661141))

(declare-fun m!633467 () Bool)

(assert (=> b!661145 m!633467))

(declare-fun m!633469 () Bool)

(assert (=> b!661134 m!633469))

(declare-fun m!633471 () Bool)

(assert (=> b!661139 m!633471))

(declare-fun m!633473 () Bool)

(assert (=> b!661141 m!633473))

(declare-fun m!633475 () Bool)

(assert (=> b!661141 m!633475))

(declare-fun m!633477 () Bool)

(assert (=> b!661143 m!633477))

(declare-fun m!633479 () Bool)

(assert (=> b!661144 m!633479))

(declare-fun m!633481 () Bool)

(assert (=> start!59828 m!633481))

(declare-fun m!633483 () Bool)

(assert (=> b!661142 m!633483))

(declare-fun m!633485 () Bool)

(assert (=> b!661133 m!633485))

(assert (=> b!661138 m!633483))

(declare-fun m!633487 () Bool)

(assert (=> b!661137 m!633487))

(push 1)

(assert (not b!661143))

(assert (not b!661138))

(assert (not start!59828))

(assert (not b!661139))

(assert (not b!661145))

(assert (not b!661142))

(assert (not b!661141))

(assert (not b!661134))

(assert (not b!661137))

(assert (not b!661133))

(assert (not b!661144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

