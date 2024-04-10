; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61772 () Bool)

(assert start!61772)

(declare-fun b!691324 () Bool)

(declare-datatypes ((Unit!24378 0))(
  ( (Unit!24379) )
))
(declare-fun e!393474 () Unit!24378)

(declare-fun Unit!24380 () Unit!24378)

(assert (=> b!691324 (= e!393474 Unit!24380)))

(declare-fun b!691326 () Bool)

(declare-fun e!393470 () Bool)

(declare-datatypes ((List!13106 0))(
  ( (Nil!13103) (Cons!13102 (h!14147 (_ BitVec 64)) (t!19373 List!13106)) )
))
(declare-fun acc!681 () List!13106)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3683 (List!13106 (_ BitVec 64)) Bool)

(assert (=> b!691326 (= e!393470 (not (contains!3683 acc!681 k!2843)))))

(declare-fun b!691327 () Bool)

(declare-fun res!455710 () Bool)

(declare-fun e!393472 () Bool)

(assert (=> b!691327 (=> (not res!455710) (not e!393472))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39793 0))(
  ( (array!39794 (arr!19065 (Array (_ BitVec 32) (_ BitVec 64))) (size!19450 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39793)

(assert (=> b!691327 (= res!455710 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19450 a!3626))))))

(declare-fun b!691328 () Bool)

(declare-fun res!455707 () Bool)

(assert (=> b!691328 (=> (not res!455707) (not e!393472))))

(assert (=> b!691328 (= res!455707 (not (contains!3683 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691329 () Bool)

(declare-fun res!455704 () Bool)

(assert (=> b!691329 (=> (not res!455704) (not e!393472))))

(declare-fun e!393471 () Bool)

(assert (=> b!691329 (= res!455704 e!393471)))

(declare-fun res!455706 () Bool)

(assert (=> b!691329 (=> res!455706 e!393471)))

(declare-fun e!393473 () Bool)

(assert (=> b!691329 (= res!455706 e!393473)))

(declare-fun res!455705 () Bool)

(assert (=> b!691329 (=> (not res!455705) (not e!393473))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!691329 (= res!455705 (bvsgt from!3004 i!1382))))

(declare-fun b!691330 () Bool)

(declare-fun res!455703 () Bool)

(assert (=> b!691330 (=> (not res!455703) (not e!393472))))

(declare-fun arrayContainsKey!0 (array!39793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691330 (= res!455703 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691331 () Bool)

(declare-fun res!455702 () Bool)

(assert (=> b!691331 (=> (not res!455702) (not e!393472))))

(declare-fun noDuplicate!930 (List!13106) Bool)

(assert (=> b!691331 (= res!455702 (noDuplicate!930 acc!681))))

(declare-fun b!691332 () Bool)

(assert (=> b!691332 (= e!393473 (contains!3683 acc!681 k!2843))))

(declare-fun b!691333 () Bool)

(assert (=> b!691333 (= e!393471 e!393470)))

(declare-fun res!455712 () Bool)

(assert (=> b!691333 (=> (not res!455712) (not e!393470))))

(assert (=> b!691333 (= res!455712 (bvsle from!3004 i!1382))))

(declare-fun b!691334 () Bool)

(declare-fun res!455701 () Bool)

(assert (=> b!691334 (=> (not res!455701) (not e!393472))))

(declare-fun arrayNoDuplicates!0 (array!39793 (_ BitVec 32) List!13106) Bool)

(assert (=> b!691334 (= res!455701 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13103))))

(declare-fun res!455713 () Bool)

(assert (=> start!61772 (=> (not res!455713) (not e!393472))))

(assert (=> start!61772 (= res!455713 (and (bvslt (size!19450 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19450 a!3626))))))

(assert (=> start!61772 e!393472))

(assert (=> start!61772 true))

(declare-fun array_inv!14861 (array!39793) Bool)

(assert (=> start!61772 (array_inv!14861 a!3626)))

(declare-fun b!691325 () Bool)

(declare-fun res!455714 () Bool)

(assert (=> b!691325 (=> (not res!455714) (not e!393472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691325 (= res!455714 (validKeyInArray!0 k!2843))))

(declare-fun b!691335 () Bool)

(assert (=> b!691335 (= e!393472 false)))

(declare-fun lt!316453 () Unit!24378)

(assert (=> b!691335 (= lt!316453 e!393474)))

(declare-fun c!78179 () Bool)

(assert (=> b!691335 (= c!78179 (= (select (arr!19065 a!3626) from!3004) k!2843))))

(declare-fun b!691336 () Bool)

(declare-fun res!455700 () Bool)

(assert (=> b!691336 (=> (not res!455700) (not e!393472))))

(assert (=> b!691336 (= res!455700 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19450 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691337 () Bool)

(declare-fun res!455709 () Bool)

(assert (=> b!691337 (=> (not res!455709) (not e!393472))))

(assert (=> b!691337 (= res!455709 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691338 () Bool)

(declare-fun res!455708 () Bool)

(assert (=> b!691338 (=> (not res!455708) (not e!393472))))

(assert (=> b!691338 (= res!455708 (validKeyInArray!0 (select (arr!19065 a!3626) from!3004)))))

(declare-fun b!691339 () Bool)

(declare-fun res!455711 () Bool)

(assert (=> b!691339 (=> (not res!455711) (not e!393472))))

(assert (=> b!691339 (= res!455711 (not (contains!3683 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691340 () Bool)

(declare-fun Unit!24381 () Unit!24378)

(assert (=> b!691340 (= e!393474 Unit!24381)))

(assert (=> b!691340 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316452 () Unit!24378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39793 (_ BitVec 64) (_ BitVec 32)) Unit!24378)

(assert (=> b!691340 (= lt!316452 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691340 false))

(assert (= (and start!61772 res!455713) b!691331))

(assert (= (and b!691331 res!455702) b!691339))

(assert (= (and b!691339 res!455711) b!691328))

(assert (= (and b!691328 res!455707) b!691329))

(assert (= (and b!691329 res!455705) b!691332))

(assert (= (and b!691329 (not res!455706)) b!691333))

(assert (= (and b!691333 res!455712) b!691326))

(assert (= (and b!691329 res!455704) b!691334))

(assert (= (and b!691334 res!455701) b!691337))

(assert (= (and b!691337 res!455709) b!691327))

(assert (= (and b!691327 res!455710) b!691325))

(assert (= (and b!691325 res!455714) b!691330))

(assert (= (and b!691330 res!455703) b!691336))

(assert (= (and b!691336 res!455700) b!691338))

(assert (= (and b!691338 res!455708) b!691335))

(assert (= (and b!691335 c!78179) b!691340))

(assert (= (and b!691335 (not c!78179)) b!691324))

(declare-fun m!654407 () Bool)

(assert (=> b!691325 m!654407))

(declare-fun m!654409 () Bool)

(assert (=> b!691339 m!654409))

(declare-fun m!654411 () Bool)

(assert (=> b!691337 m!654411))

(declare-fun m!654413 () Bool)

(assert (=> b!691331 m!654413))

(declare-fun m!654415 () Bool)

(assert (=> b!691328 m!654415))

(declare-fun m!654417 () Bool)

(assert (=> b!691335 m!654417))

(declare-fun m!654419 () Bool)

(assert (=> start!61772 m!654419))

(declare-fun m!654421 () Bool)

(assert (=> b!691330 m!654421))

(declare-fun m!654423 () Bool)

(assert (=> b!691326 m!654423))

(declare-fun m!654425 () Bool)

(assert (=> b!691340 m!654425))

(declare-fun m!654427 () Bool)

(assert (=> b!691340 m!654427))

(assert (=> b!691338 m!654417))

(assert (=> b!691338 m!654417))

(declare-fun m!654429 () Bool)

(assert (=> b!691338 m!654429))

(declare-fun m!654431 () Bool)

(assert (=> b!691334 m!654431))

(assert (=> b!691332 m!654423))

(push 1)

(assert (not b!691337))

(assert (not b!691338))

(assert (not b!691332))

(assert (not b!691328))

(assert (not start!61772))

(assert (not b!691325))

(assert (not b!691331))

(assert (not b!691340))

(assert (not b!691326))

(assert (not b!691334))

(assert (not b!691330))

(assert (not b!691339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

