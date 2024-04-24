; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59818 () Bool)

(assert start!59818)

(declare-fun b!660338 () Bool)

(declare-fun res!428298 () Bool)

(declare-fun e!379463 () Bool)

(assert (=> b!660338 (=> (not res!428298) (not e!379463))))

(declare-datatypes ((array!38803 0))(
  ( (array!38804 (arr!18591 (Array (_ BitVec 32) (_ BitVec 64))) (size!18955 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38803)

(declare-datatypes ((List!12539 0))(
  ( (Nil!12536) (Cons!12535 (h!13583 (_ BitVec 64)) (t!18759 List!12539)) )
))
(declare-fun arrayNoDuplicates!0 (array!38803 (_ BitVec 32) List!12539) Bool)

(assert (=> b!660338 (= res!428298 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12536))))

(declare-fun b!660339 () Bool)

(declare-fun res!428296 () Bool)

(assert (=> b!660339 (=> (not res!428296) (not e!379463))))

(declare-fun acc!681 () List!12539)

(declare-fun contains!3191 (List!12539 (_ BitVec 64)) Bool)

(assert (=> b!660339 (= res!428296 (not (contains!3191 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660341 () Bool)

(declare-fun res!428293 () Bool)

(assert (=> b!660341 (=> (not res!428293) (not e!379463))))

(declare-fun e!379466 () Bool)

(assert (=> b!660341 (= res!428293 e!379466)))

(declare-fun res!428294 () Bool)

(assert (=> b!660341 (=> res!428294 e!379466)))

(declare-fun e!379465 () Bool)

(assert (=> b!660341 (= res!428294 e!379465)))

(declare-fun res!428297 () Bool)

(assert (=> b!660341 (=> (not res!428297) (not e!379465))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660341 (= res!428297 (bvsgt from!3004 i!1382))))

(declare-fun b!660342 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660342 (= e!379465 (contains!3191 acc!681 k!2843))))

(declare-fun b!660343 () Bool)

(declare-fun res!428299 () Bool)

(assert (=> b!660343 (=> (not res!428299) (not e!379463))))

(assert (=> b!660343 (= res!428299 (not (contains!3191 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660344 () Bool)

(declare-fun res!428295 () Bool)

(assert (=> b!660344 (=> (not res!428295) (not e!379463))))

(declare-fun noDuplicate!465 (List!12539) Bool)

(assert (=> b!660344 (= res!428295 (noDuplicate!465 acc!681))))

(declare-fun b!660345 () Bool)

(assert (=> b!660345 (= e!379463 (bvsgt from!3004 (size!18955 a!3626)))))

(declare-fun b!660346 () Bool)

(declare-fun e!379464 () Bool)

(assert (=> b!660346 (= e!379464 (not (contains!3191 acc!681 k!2843)))))

(declare-fun b!660340 () Bool)

(assert (=> b!660340 (= e!379466 e!379464)))

(declare-fun res!428291 () Bool)

(assert (=> b!660340 (=> (not res!428291) (not e!379464))))

(assert (=> b!660340 (= res!428291 (bvsle from!3004 i!1382))))

(declare-fun res!428292 () Bool)

(assert (=> start!59818 (=> (not res!428292) (not e!379463))))

(assert (=> start!59818 (= res!428292 (and (bvslt (size!18955 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18955 a!3626))))))

(assert (=> start!59818 e!379463))

(assert (=> start!59818 true))

(declare-fun array_inv!14450 (array!38803) Bool)

(assert (=> start!59818 (array_inv!14450 a!3626)))

(assert (= (and start!59818 res!428292) b!660344))

(assert (= (and b!660344 res!428295) b!660343))

(assert (= (and b!660343 res!428299) b!660339))

(assert (= (and b!660339 res!428296) b!660341))

(assert (= (and b!660341 res!428297) b!660342))

(assert (= (and b!660341 (not res!428294)) b!660340))

(assert (= (and b!660340 res!428291) b!660346))

(assert (= (and b!660341 res!428293) b!660338))

(assert (= (and b!660338 res!428298) b!660345))

(declare-fun m!633655 () Bool)

(assert (=> b!660344 m!633655))

(declare-fun m!633657 () Bool)

(assert (=> b!660339 m!633657))

(declare-fun m!633659 () Bool)

(assert (=> b!660338 m!633659))

(declare-fun m!633661 () Bool)

(assert (=> b!660346 m!633661))

(declare-fun m!633663 () Bool)

(assert (=> b!660343 m!633663))

(assert (=> b!660342 m!633661))

(declare-fun m!633665 () Bool)

(assert (=> start!59818 m!633665))

(push 1)

(assert (not b!660343))

(assert (not b!660344))

(assert (not b!660339))

(assert (not b!660342))

(assert (not start!59818))

(assert (not b!660338))

(assert (not b!660346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

