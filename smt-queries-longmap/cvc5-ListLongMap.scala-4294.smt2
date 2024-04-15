; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59784 () Bool)

(assert start!59784)

(declare-fun b!660304 () Bool)

(declare-fun e!379405 () Bool)

(declare-fun e!379406 () Bool)

(assert (=> b!660304 (= e!379405 e!379406)))

(declare-fun res!428529 () Bool)

(assert (=> b!660304 (=> (not res!428529) (not e!379406))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660304 (= res!428529 (bvsle from!3004 i!1382))))

(declare-fun res!428534 () Bool)

(declare-fun e!379404 () Bool)

(assert (=> start!59784 (=> (not res!428534) (not e!379404))))

(declare-datatypes ((array!38842 0))(
  ( (array!38843 (arr!18613 (Array (_ BitVec 32) (_ BitVec 64))) (size!18978 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38842)

(assert (=> start!59784 (= res!428534 (and (bvslt (size!18978 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18978 a!3626))))))

(assert (=> start!59784 e!379404))

(assert (=> start!59784 true))

(declare-fun array_inv!14496 (array!38842) Bool)

(assert (=> start!59784 (array_inv!14496 a!3626)))

(declare-fun b!660305 () Bool)

(declare-fun res!428531 () Bool)

(assert (=> b!660305 (=> (not res!428531) (not e!379404))))

(assert (=> b!660305 (= res!428531 e!379405)))

(declare-fun res!428536 () Bool)

(assert (=> b!660305 (=> res!428536 e!379405)))

(declare-fun e!379403 () Bool)

(assert (=> b!660305 (= res!428536 e!379403)))

(declare-fun res!428532 () Bool)

(assert (=> b!660305 (=> (not res!428532) (not e!379403))))

(assert (=> b!660305 (= res!428532 (bvsgt from!3004 i!1382))))

(declare-fun b!660306 () Bool)

(declare-datatypes ((List!12693 0))(
  ( (Nil!12690) (Cons!12689 (h!13734 (_ BitVec 64)) (t!18912 List!12693)) )
))
(declare-fun acc!681 () List!12693)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3215 (List!12693 (_ BitVec 64)) Bool)

(assert (=> b!660306 (= e!379403 (contains!3215 acc!681 k!2843))))

(declare-fun b!660307 () Bool)

(assert (=> b!660307 (= e!379404 false)))

(declare-fun lt!308535 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38842 (_ BitVec 32) List!12693) Bool)

(assert (=> b!660307 (= lt!308535 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660308 () Bool)

(declare-fun res!428535 () Bool)

(assert (=> b!660308 (=> (not res!428535) (not e!379404))))

(assert (=> b!660308 (= res!428535 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12690))))

(declare-fun b!660309 () Bool)

(declare-fun res!428533 () Bool)

(assert (=> b!660309 (=> (not res!428533) (not e!379404))))

(assert (=> b!660309 (= res!428533 (not (contains!3215 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660310 () Bool)

(declare-fun res!428530 () Bool)

(assert (=> b!660310 (=> (not res!428530) (not e!379404))))

(assert (=> b!660310 (= res!428530 (not (contains!3215 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660311 () Bool)

(declare-fun res!428528 () Bool)

(assert (=> b!660311 (=> (not res!428528) (not e!379404))))

(declare-fun noDuplicate!484 (List!12693) Bool)

(assert (=> b!660311 (= res!428528 (noDuplicate!484 acc!681))))

(declare-fun b!660312 () Bool)

(assert (=> b!660312 (= e!379406 (not (contains!3215 acc!681 k!2843)))))

(assert (= (and start!59784 res!428534) b!660311))

(assert (= (and b!660311 res!428528) b!660310))

(assert (= (and b!660310 res!428530) b!660309))

(assert (= (and b!660309 res!428533) b!660305))

(assert (= (and b!660305 res!428532) b!660306))

(assert (= (and b!660305 (not res!428536)) b!660304))

(assert (= (and b!660304 res!428529) b!660312))

(assert (= (and b!660305 res!428531) b!660308))

(assert (= (and b!660308 res!428535) b!660307))

(declare-fun m!632413 () Bool)

(assert (=> b!660308 m!632413))

(declare-fun m!632415 () Bool)

(assert (=> b!660309 m!632415))

(declare-fun m!632417 () Bool)

(assert (=> b!660312 m!632417))

(declare-fun m!632419 () Bool)

(assert (=> b!660311 m!632419))

(assert (=> b!660306 m!632417))

(declare-fun m!632421 () Bool)

(assert (=> b!660310 m!632421))

(declare-fun m!632423 () Bool)

(assert (=> b!660307 m!632423))

(declare-fun m!632425 () Bool)

(assert (=> start!59784 m!632425))

(push 1)

(assert (not start!59784))

(assert (not b!660310))

(assert (not b!660307))

(assert (not b!660312))

(assert (not b!660311))

(assert (not b!660306))

(assert (not b!660308))

(assert (not b!660309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

