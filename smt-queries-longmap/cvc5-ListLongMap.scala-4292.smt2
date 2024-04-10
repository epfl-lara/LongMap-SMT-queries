; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59780 () Bool)

(assert start!59780)

(declare-fun b!660357 () Bool)

(declare-fun e!379476 () Bool)

(assert (=> b!660357 (= e!379476 false)))

(declare-fun lt!308776 () Bool)

(declare-datatypes ((array!38827 0))(
  ( (array!38828 (arr!18606 (Array (_ BitVec 32) (_ BitVec 64))) (size!18970 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38827)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12647 0))(
  ( (Nil!12644) (Cons!12643 (h!13688 (_ BitVec 64)) (t!18875 List!12647)) )
))
(declare-fun acc!681 () List!12647)

(declare-fun arrayNoDuplicates!0 (array!38827 (_ BitVec 32) List!12647) Bool)

(assert (=> b!660357 (= lt!308776 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660358 () Bool)

(declare-fun res!428428 () Bool)

(assert (=> b!660358 (=> (not res!428428) (not e!379476))))

(declare-fun noDuplicate!471 (List!12647) Bool)

(assert (=> b!660358 (= res!428428 (noDuplicate!471 acc!681))))

(declare-fun res!428426 () Bool)

(assert (=> start!59780 (=> (not res!428426) (not e!379476))))

(assert (=> start!59780 (= res!428426 (and (bvslt (size!18970 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18970 a!3626))))))

(assert (=> start!59780 e!379476))

(assert (=> start!59780 true))

(declare-fun array_inv!14402 (array!38827) Bool)

(assert (=> start!59780 (array_inv!14402 a!3626)))

(declare-fun b!660359 () Bool)

(declare-fun res!428425 () Bool)

(assert (=> b!660359 (=> (not res!428425) (not e!379476))))

(declare-fun e!379475 () Bool)

(assert (=> b!660359 (= res!428425 e!379475)))

(declare-fun res!428422 () Bool)

(assert (=> b!660359 (=> res!428422 e!379475)))

(declare-fun e!379472 () Bool)

(assert (=> b!660359 (= res!428422 e!379472)))

(declare-fun res!428421 () Bool)

(assert (=> b!660359 (=> (not res!428421) (not e!379472))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660359 (= res!428421 (bvsgt from!3004 i!1382))))

(declare-fun b!660360 () Bool)

(declare-fun e!379474 () Bool)

(assert (=> b!660360 (= e!379475 e!379474)))

(declare-fun res!428429 () Bool)

(assert (=> b!660360 (=> (not res!428429) (not e!379474))))

(assert (=> b!660360 (= res!428429 (bvsle from!3004 i!1382))))

(declare-fun b!660361 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3224 (List!12647 (_ BitVec 64)) Bool)

(assert (=> b!660361 (= e!379472 (contains!3224 acc!681 k!2843))))

(declare-fun b!660362 () Bool)

(assert (=> b!660362 (= e!379474 (not (contains!3224 acc!681 k!2843)))))

(declare-fun b!660363 () Bool)

(declare-fun res!428423 () Bool)

(assert (=> b!660363 (=> (not res!428423) (not e!379476))))

(assert (=> b!660363 (= res!428423 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12644))))

(declare-fun b!660364 () Bool)

(declare-fun res!428424 () Bool)

(assert (=> b!660364 (=> (not res!428424) (not e!379476))))

(assert (=> b!660364 (= res!428424 (not (contains!3224 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660365 () Bool)

(declare-fun res!428427 () Bool)

(assert (=> b!660365 (=> (not res!428427) (not e!379476))))

(assert (=> b!660365 (= res!428427 (not (contains!3224 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59780 res!428426) b!660358))

(assert (= (and b!660358 res!428428) b!660365))

(assert (= (and b!660365 res!428427) b!660364))

(assert (= (and b!660364 res!428424) b!660359))

(assert (= (and b!660359 res!428421) b!660361))

(assert (= (and b!660359 (not res!428422)) b!660360))

(assert (= (and b!660360 res!428429) b!660362))

(assert (= (and b!660359 res!428425) b!660363))

(assert (= (and b!660363 res!428423) b!660357))

(declare-fun m!633077 () Bool)

(assert (=> b!660357 m!633077))

(declare-fun m!633079 () Bool)

(assert (=> b!660361 m!633079))

(declare-fun m!633081 () Bool)

(assert (=> start!59780 m!633081))

(declare-fun m!633083 () Bool)

(assert (=> b!660365 m!633083))

(declare-fun m!633085 () Bool)

(assert (=> b!660364 m!633085))

(declare-fun m!633087 () Bool)

(assert (=> b!660363 m!633087))

(assert (=> b!660362 m!633079))

(declare-fun m!633089 () Bool)

(assert (=> b!660358 m!633089))

(push 1)

(assert (not start!59780))

(assert (not b!660365))

(assert (not b!660364))

(assert (not b!660363))

(assert (not b!660357))

(assert (not b!660358))

(assert (not b!660362))

(assert (not b!660361))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

