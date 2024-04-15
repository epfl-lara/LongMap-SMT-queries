; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59772 () Bool)

(assert start!59772)

(declare-fun b!660115 () Bool)

(declare-fun res!428342 () Bool)

(declare-fun e!379316 () Bool)

(assert (=> b!660115 (=> (not res!428342) (not e!379316))))

(declare-datatypes ((array!38830 0))(
  ( (array!38831 (arr!18607 (Array (_ BitVec 32) (_ BitVec 64))) (size!18972 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38830)

(declare-datatypes ((List!12687 0))(
  ( (Nil!12684) (Cons!12683 (h!13728 (_ BitVec 64)) (t!18906 List!12687)) )
))
(declare-fun arrayNoDuplicates!0 (array!38830 (_ BitVec 32) List!12687) Bool)

(assert (=> b!660115 (= res!428342 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12684))))

(declare-fun b!660116 () Bool)

(declare-fun res!428346 () Bool)

(assert (=> b!660116 (=> (not res!428346) (not e!379316))))

(declare-fun acc!681 () List!12687)

(declare-fun noDuplicate!478 (List!12687) Bool)

(assert (=> b!660116 (= res!428346 (noDuplicate!478 acc!681))))

(declare-fun b!660117 () Bool)

(declare-fun e!379314 () Bool)

(declare-fun e!379312 () Bool)

(assert (=> b!660117 (= e!379314 e!379312)))

(declare-fun res!428341 () Bool)

(assert (=> b!660117 (=> (not res!428341) (not e!379312))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660117 (= res!428341 (bvsle from!3004 i!1382))))

(declare-fun b!660119 () Bool)

(declare-fun res!428344 () Bool)

(assert (=> b!660119 (=> (not res!428344) (not e!379316))))

(assert (=> b!660119 (= res!428344 e!379314)))

(declare-fun res!428340 () Bool)

(assert (=> b!660119 (=> res!428340 e!379314)))

(declare-fun e!379313 () Bool)

(assert (=> b!660119 (= res!428340 e!379313)))

(declare-fun res!428339 () Bool)

(assert (=> b!660119 (=> (not res!428339) (not e!379313))))

(assert (=> b!660119 (= res!428339 (bvsgt from!3004 i!1382))))

(declare-fun b!660120 () Bool)

(assert (=> b!660120 (= e!379316 false)))

(declare-fun lt!308526 () Bool)

(assert (=> b!660120 (= lt!308526 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660121 () Bool)

(declare-fun res!428343 () Bool)

(assert (=> b!660121 (=> (not res!428343) (not e!379316))))

(declare-fun contains!3209 (List!12687 (_ BitVec 64)) Bool)

(assert (=> b!660121 (= res!428343 (not (contains!3209 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660118 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660118 (= e!379313 (contains!3209 acc!681 k!2843))))

(declare-fun res!428347 () Bool)

(assert (=> start!59772 (=> (not res!428347) (not e!379316))))

(assert (=> start!59772 (= res!428347 (and (bvslt (size!18972 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18972 a!3626))))))

(assert (=> start!59772 e!379316))

(assert (=> start!59772 true))

(declare-fun array_inv!14490 (array!38830) Bool)

(assert (=> start!59772 (array_inv!14490 a!3626)))

(declare-fun b!660122 () Bool)

(assert (=> b!660122 (= e!379312 (not (contains!3209 acc!681 k!2843)))))

(declare-fun b!660123 () Bool)

(declare-fun res!428345 () Bool)

(assert (=> b!660123 (=> (not res!428345) (not e!379316))))

(assert (=> b!660123 (= res!428345 (not (contains!3209 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59772 res!428347) b!660116))

(assert (= (and b!660116 res!428346) b!660123))

(assert (= (and b!660123 res!428345) b!660121))

(assert (= (and b!660121 res!428343) b!660119))

(assert (= (and b!660119 res!428339) b!660118))

(assert (= (and b!660119 (not res!428340)) b!660117))

(assert (= (and b!660117 res!428341) b!660122))

(assert (= (and b!660119 res!428344) b!660115))

(assert (= (and b!660115 res!428342) b!660120))

(declare-fun m!632323 () Bool)

(assert (=> b!660122 m!632323))

(declare-fun m!632325 () Bool)

(assert (=> start!59772 m!632325))

(declare-fun m!632327 () Bool)

(assert (=> b!660115 m!632327))

(declare-fun m!632329 () Bool)

(assert (=> b!660120 m!632329))

(assert (=> b!660118 m!632323))

(declare-fun m!632331 () Bool)

(assert (=> b!660121 m!632331))

(declare-fun m!632333 () Bool)

(assert (=> b!660116 m!632333))

(declare-fun m!632335 () Bool)

(assert (=> b!660123 m!632335))

(push 1)

(assert (not b!660120))

(assert (not b!660122))

(assert (not b!660121))

(assert (not start!59772))

(assert (not b!660118))

(assert (not b!660116))

(assert (not b!660115))

(assert (not b!660123))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

