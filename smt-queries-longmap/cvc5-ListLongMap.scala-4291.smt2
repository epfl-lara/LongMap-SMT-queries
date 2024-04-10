; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59774 () Bool)

(assert start!59774)

(declare-fun b!660283 () Bool)

(declare-fun e!379430 () Bool)

(assert (=> b!660283 (= e!379430 false)))

(declare-fun lt!308767 () Bool)

(declare-datatypes ((array!38821 0))(
  ( (array!38822 (arr!18603 (Array (_ BitVec 32) (_ BitVec 64))) (size!18967 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38821)

(declare-datatypes ((List!12644 0))(
  ( (Nil!12641) (Cons!12640 (h!13685 (_ BitVec 64)) (t!18872 List!12644)) )
))
(declare-fun arrayNoDuplicates!0 (array!38821 (_ BitVec 32) List!12644) Bool)

(assert (=> b!660283 (= lt!308767 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12641))))

(declare-fun res!428351 () Bool)

(assert (=> start!59774 (=> (not res!428351) (not e!379430))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59774 (= res!428351 (and (bvslt (size!18967 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18967 a!3626))))))

(assert (=> start!59774 e!379430))

(assert (=> start!59774 true))

(declare-fun array_inv!14399 (array!38821) Bool)

(assert (=> start!59774 (array_inv!14399 a!3626)))

(declare-fun b!660284 () Bool)

(declare-fun res!428347 () Bool)

(assert (=> b!660284 (=> (not res!428347) (not e!379430))))

(declare-fun acc!681 () List!12644)

(declare-fun contains!3221 (List!12644 (_ BitVec 64)) Bool)

(assert (=> b!660284 (= res!428347 (not (contains!3221 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660285 () Bool)

(declare-fun e!379429 () Bool)

(declare-fun e!379428 () Bool)

(assert (=> b!660285 (= e!379429 e!379428)))

(declare-fun res!428354 () Bool)

(assert (=> b!660285 (=> (not res!428354) (not e!379428))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660285 (= res!428354 (bvsle from!3004 i!1382))))

(declare-fun b!660286 () Bool)

(declare-fun res!428349 () Bool)

(assert (=> b!660286 (=> (not res!428349) (not e!379430))))

(assert (=> b!660286 (= res!428349 e!379429)))

(declare-fun res!428348 () Bool)

(assert (=> b!660286 (=> res!428348 e!379429)))

(declare-fun e!379431 () Bool)

(assert (=> b!660286 (= res!428348 e!379431)))

(declare-fun res!428353 () Bool)

(assert (=> b!660286 (=> (not res!428353) (not e!379431))))

(assert (=> b!660286 (= res!428353 (bvsgt from!3004 i!1382))))

(declare-fun b!660287 () Bool)

(declare-fun res!428350 () Bool)

(assert (=> b!660287 (=> (not res!428350) (not e!379430))))

(assert (=> b!660287 (= res!428350 (not (contains!3221 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660288 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660288 (= e!379431 (contains!3221 acc!681 k!2843))))

(declare-fun b!660289 () Bool)

(assert (=> b!660289 (= e!379428 (not (contains!3221 acc!681 k!2843)))))

(declare-fun b!660290 () Bool)

(declare-fun res!428352 () Bool)

(assert (=> b!660290 (=> (not res!428352) (not e!379430))))

(declare-fun noDuplicate!468 (List!12644) Bool)

(assert (=> b!660290 (= res!428352 (noDuplicate!468 acc!681))))

(assert (= (and start!59774 res!428351) b!660290))

(assert (= (and b!660290 res!428352) b!660287))

(assert (= (and b!660287 res!428350) b!660284))

(assert (= (and b!660284 res!428347) b!660286))

(assert (= (and b!660286 res!428353) b!660288))

(assert (= (and b!660286 (not res!428348)) b!660285))

(assert (= (and b!660285 res!428354) b!660289))

(assert (= (and b!660286 res!428349) b!660283))

(declare-fun m!633041 () Bool)

(assert (=> b!660283 m!633041))

(declare-fun m!633043 () Bool)

(assert (=> start!59774 m!633043))

(declare-fun m!633045 () Bool)

(assert (=> b!660287 m!633045))

(declare-fun m!633047 () Bool)

(assert (=> b!660290 m!633047))

(declare-fun m!633049 () Bool)

(assert (=> b!660289 m!633049))

(declare-fun m!633051 () Bool)

(assert (=> b!660284 m!633051))

(assert (=> b!660288 m!633049))

(push 1)

(assert (not b!660289))

(assert (not b!660283))

(assert (not b!660290))

(assert (not b!660287))

(assert (not b!660284))

(assert (not b!660288))

(assert (not start!59774))

(check-sat)

(pop 1)

