; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59778 () Bool)

(assert start!59778)

(declare-fun b!660331 () Bool)

(declare-fun e!379459 () Bool)

(declare-datatypes ((List!12646 0))(
  ( (Nil!12643) (Cons!12642 (h!13687 (_ BitVec 64)) (t!18874 List!12646)) )
))
(declare-fun acc!681 () List!12646)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3223 (List!12646 (_ BitVec 64)) Bool)

(assert (=> b!660331 (= e!379459 (not (contains!3223 acc!681 k!2843)))))

(declare-fun b!660332 () Bool)

(declare-fun e!379461 () Bool)

(assert (=> b!660332 (= e!379461 (contains!3223 acc!681 k!2843))))

(declare-fun b!660333 () Bool)

(declare-fun res!428397 () Bool)

(declare-fun e!379457 () Bool)

(assert (=> b!660333 (=> (not res!428397) (not e!379457))))

(assert (=> b!660333 (= res!428397 (not (contains!3223 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660335 () Bool)

(declare-fun res!428402 () Bool)

(assert (=> b!660335 (=> (not res!428402) (not e!379457))))

(assert (=> b!660335 (= res!428402 (not (contains!3223 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660336 () Bool)

(declare-fun res!428398 () Bool)

(assert (=> b!660336 (=> (not res!428398) (not e!379457))))

(declare-fun e!379460 () Bool)

(assert (=> b!660336 (= res!428398 e!379460)))

(declare-fun res!428396 () Bool)

(assert (=> b!660336 (=> res!428396 e!379460)))

(assert (=> b!660336 (= res!428396 e!379461)))

(declare-fun res!428400 () Bool)

(assert (=> b!660336 (=> (not res!428400) (not e!379461))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660336 (= res!428400 (bvsgt from!3004 i!1382))))

(declare-fun b!660334 () Bool)

(assert (=> b!660334 (= e!379457 false)))

(declare-fun lt!308773 () Bool)

(declare-datatypes ((array!38825 0))(
  ( (array!38826 (arr!18605 (Array (_ BitVec 32) (_ BitVec 64))) (size!18969 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38825)

(declare-fun arrayNoDuplicates!0 (array!38825 (_ BitVec 32) List!12646) Bool)

(assert (=> b!660334 (= lt!308773 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12643))))

(declare-fun res!428399 () Bool)

(assert (=> start!59778 (=> (not res!428399) (not e!379457))))

(assert (=> start!59778 (= res!428399 (and (bvslt (size!18969 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18969 a!3626))))))

(assert (=> start!59778 e!379457))

(assert (=> start!59778 true))

(declare-fun array_inv!14401 (array!38825) Bool)

(assert (=> start!59778 (array_inv!14401 a!3626)))

(declare-fun b!660337 () Bool)

(assert (=> b!660337 (= e!379460 e!379459)))

(declare-fun res!428395 () Bool)

(assert (=> b!660337 (=> (not res!428395) (not e!379459))))

(assert (=> b!660337 (= res!428395 (bvsle from!3004 i!1382))))

(declare-fun b!660338 () Bool)

(declare-fun res!428401 () Bool)

(assert (=> b!660338 (=> (not res!428401) (not e!379457))))

(declare-fun noDuplicate!470 (List!12646) Bool)

(assert (=> b!660338 (= res!428401 (noDuplicate!470 acc!681))))

(assert (= (and start!59778 res!428399) b!660338))

(assert (= (and b!660338 res!428401) b!660333))

(assert (= (and b!660333 res!428397) b!660335))

(assert (= (and b!660335 res!428402) b!660336))

(assert (= (and b!660336 res!428400) b!660332))

(assert (= (and b!660336 (not res!428396)) b!660337))

(assert (= (and b!660337 res!428395) b!660331))

(assert (= (and b!660336 res!428398) b!660334))

(declare-fun m!633065 () Bool)

(assert (=> b!660338 m!633065))

(declare-fun m!633067 () Bool)

(assert (=> b!660332 m!633067))

(declare-fun m!633069 () Bool)

(assert (=> b!660334 m!633069))

(declare-fun m!633071 () Bool)

(assert (=> start!59778 m!633071))

(declare-fun m!633073 () Bool)

(assert (=> b!660333 m!633073))

(declare-fun m!633075 () Bool)

(assert (=> b!660335 m!633075))

(assert (=> b!660331 m!633067))

(push 1)

(assert (not b!660332))

(assert (not b!660335))

(assert (not start!59778))

(assert (not b!660338))

(assert (not b!660333))

(assert (not b!660331))

(assert (not b!660334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

