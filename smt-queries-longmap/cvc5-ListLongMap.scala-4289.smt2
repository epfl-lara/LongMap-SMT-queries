; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59762 () Bool)

(assert start!59762)

(declare-fun b!660139 () Bool)

(declare-fun res!428207 () Bool)

(declare-fun e!379339 () Bool)

(assert (=> b!660139 (=> (not res!428207) (not e!379339))))

(declare-datatypes ((List!12638 0))(
  ( (Nil!12635) (Cons!12634 (h!13679 (_ BitVec 64)) (t!18866 List!12638)) )
))
(declare-fun acc!681 () List!12638)

(declare-fun noDuplicate!462 (List!12638) Bool)

(assert (=> b!660139 (= res!428207 (noDuplicate!462 acc!681))))

(declare-fun b!660140 () Bool)

(declare-fun e!379337 () Bool)

(declare-fun e!379341 () Bool)

(assert (=> b!660140 (= e!379337 e!379341)))

(declare-fun res!428204 () Bool)

(assert (=> b!660140 (=> (not res!428204) (not e!379341))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660140 (= res!428204 (bvsle from!3004 i!1382))))

(declare-fun res!428206 () Bool)

(assert (=> start!59762 (=> (not res!428206) (not e!379339))))

(declare-datatypes ((array!38809 0))(
  ( (array!38810 (arr!18597 (Array (_ BitVec 32) (_ BitVec 64))) (size!18961 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38809)

(assert (=> start!59762 (= res!428206 (and (bvslt (size!18961 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18961 a!3626))))))

(assert (=> start!59762 e!379339))

(assert (=> start!59762 true))

(declare-fun array_inv!14393 (array!38809) Bool)

(assert (=> start!59762 (array_inv!14393 a!3626)))

(declare-fun b!660141 () Bool)

(declare-fun res!428209 () Bool)

(assert (=> b!660141 (=> (not res!428209) (not e!379339))))

(assert (=> b!660141 (= res!428209 e!379337)))

(declare-fun res!428208 () Bool)

(assert (=> b!660141 (=> res!428208 e!379337)))

(declare-fun e!379340 () Bool)

(assert (=> b!660141 (= res!428208 e!379340)))

(declare-fun res!428205 () Bool)

(assert (=> b!660141 (=> (not res!428205) (not e!379340))))

(assert (=> b!660141 (= res!428205 (bvsgt from!3004 i!1382))))

(declare-fun b!660142 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3215 (List!12638 (_ BitVec 64)) Bool)

(assert (=> b!660142 (= e!379341 (not (contains!3215 acc!681 k!2843)))))

(declare-fun b!660143 () Bool)

(assert (=> b!660143 (= e!379340 (contains!3215 acc!681 k!2843))))

(declare-fun b!660144 () Bool)

(assert (=> b!660144 (= e!379339 false)))

(declare-fun lt!308749 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38809 (_ BitVec 32) List!12638) Bool)

(assert (=> b!660144 (= lt!308749 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12635))))

(declare-fun b!660145 () Bool)

(declare-fun res!428203 () Bool)

(assert (=> b!660145 (=> (not res!428203) (not e!379339))))

(assert (=> b!660145 (= res!428203 (not (contains!3215 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660146 () Bool)

(declare-fun res!428210 () Bool)

(assert (=> b!660146 (=> (not res!428210) (not e!379339))))

(assert (=> b!660146 (= res!428210 (not (contains!3215 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59762 res!428206) b!660139))

(assert (= (and b!660139 res!428207) b!660146))

(assert (= (and b!660146 res!428210) b!660145))

(assert (= (and b!660145 res!428203) b!660141))

(assert (= (and b!660141 res!428205) b!660143))

(assert (= (and b!660141 (not res!428208)) b!660140))

(assert (= (and b!660140 res!428204) b!660142))

(assert (= (and b!660141 res!428209) b!660144))

(declare-fun m!632969 () Bool)

(assert (=> start!59762 m!632969))

(declare-fun m!632971 () Bool)

(assert (=> b!660144 m!632971))

(declare-fun m!632973 () Bool)

(assert (=> b!660139 m!632973))

(declare-fun m!632975 () Bool)

(assert (=> b!660142 m!632975))

(assert (=> b!660143 m!632975))

(declare-fun m!632977 () Bool)

(assert (=> b!660145 m!632977))

(declare-fun m!632979 () Bool)

(assert (=> b!660146 m!632979))

(push 1)

(assert (not start!59762))

(assert (not b!660144))

(assert (not b!660146))

(assert (not b!660139))

(assert (not b!660142))

(assert (not b!660145))

(assert (not b!660143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

