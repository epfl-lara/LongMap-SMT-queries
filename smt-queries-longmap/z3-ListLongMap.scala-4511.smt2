; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62522 () Bool)

(assert start!62522)

(declare-fun b!704332 () Bool)

(declare-fun res!468307 () Bool)

(declare-fun e!397559 () Bool)

(assert (=> b!704332 (=> (not res!468307) (not e!397559))))

(declare-datatypes ((array!40212 0))(
  ( (array!40213 (arr!19262 (Array (_ BitVec 32) (_ BitVec 64))) (size!19644 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40212)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704332 (= res!468307 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704333 () Bool)

(declare-fun res!468303 () Bool)

(assert (=> b!704333 (=> (not res!468303) (not e!397559))))

(assert (=> b!704333 (= res!468303 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704334 () Bool)

(declare-fun res!468309 () Bool)

(assert (=> b!704334 (=> (not res!468309) (not e!397559))))

(assert (=> b!704334 (= res!468309 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19644 a!3591)))))

(declare-fun b!704335 () Bool)

(declare-fun res!468306 () Bool)

(assert (=> b!704335 (=> (not res!468306) (not e!397559))))

(declare-datatypes ((List!13342 0))(
  ( (Nil!13339) (Cons!13338 (h!14383 (_ BitVec 64)) (t!19615 List!13342)) )
))
(declare-fun newAcc!49 () List!13342)

(declare-fun acc!652 () List!13342)

(declare-fun -!291 (List!13342 (_ BitVec 64)) List!13342)

(assert (=> b!704335 (= res!468306 (= (-!291 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704336 () Bool)

(declare-fun res!468311 () Bool)

(assert (=> b!704336 (=> (not res!468311) (not e!397559))))

(declare-fun contains!3864 (List!13342 (_ BitVec 64)) Bool)

(assert (=> b!704336 (= res!468311 (not (contains!3864 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704337 () Bool)

(assert (=> b!704337 (= e!397559 false)))

(declare-fun lt!317601 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40212 (_ BitVec 32) List!13342) Bool)

(assert (=> b!704337 (= lt!317601 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704338 () Bool)

(declare-fun res!468308 () Bool)

(assert (=> b!704338 (=> (not res!468308) (not e!397559))))

(assert (=> b!704338 (= res!468308 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704339 () Bool)

(declare-fun res!468318 () Bool)

(assert (=> b!704339 (=> (not res!468318) (not e!397559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704339 (= res!468318 (not (validKeyInArray!0 (select (arr!19262 a!3591) from!2969))))))

(declare-fun b!704340 () Bool)

(declare-fun res!468305 () Bool)

(assert (=> b!704340 (=> (not res!468305) (not e!397559))))

(declare-fun noDuplicate!1133 (List!13342) Bool)

(assert (=> b!704340 (= res!468305 (noDuplicate!1133 acc!652))))

(declare-fun b!704341 () Bool)

(declare-fun res!468310 () Bool)

(assert (=> b!704341 (=> (not res!468310) (not e!397559))))

(declare-fun subseq!326 (List!13342 List!13342) Bool)

(assert (=> b!704341 (= res!468310 (subseq!326 acc!652 newAcc!49))))

(declare-fun b!704343 () Bool)

(declare-fun res!468313 () Bool)

(assert (=> b!704343 (=> (not res!468313) (not e!397559))))

(assert (=> b!704343 (= res!468313 (not (contains!3864 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704344 () Bool)

(declare-fun res!468314 () Bool)

(assert (=> b!704344 (=> (not res!468314) (not e!397559))))

(assert (=> b!704344 (= res!468314 (not (contains!3864 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704345 () Bool)

(declare-fun res!468317 () Bool)

(assert (=> b!704345 (=> (not res!468317) (not e!397559))))

(assert (=> b!704345 (= res!468317 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704346 () Bool)

(declare-fun res!468304 () Bool)

(assert (=> b!704346 (=> (not res!468304) (not e!397559))))

(assert (=> b!704346 (= res!468304 (not (contains!3864 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704347 () Bool)

(declare-fun res!468302 () Bool)

(assert (=> b!704347 (=> (not res!468302) (not e!397559))))

(assert (=> b!704347 (= res!468302 (noDuplicate!1133 newAcc!49))))

(declare-fun b!704348 () Bool)

(declare-fun res!468319 () Bool)

(assert (=> b!704348 (=> (not res!468319) (not e!397559))))

(assert (=> b!704348 (= res!468319 (contains!3864 newAcc!49 k0!2824))))

(declare-fun b!704349 () Bool)

(declare-fun res!468312 () Bool)

(assert (=> b!704349 (=> (not res!468312) (not e!397559))))

(assert (=> b!704349 (= res!468312 (not (contains!3864 acc!652 k0!2824)))))

(declare-fun b!704342 () Bool)

(declare-fun res!468315 () Bool)

(assert (=> b!704342 (=> (not res!468315) (not e!397559))))

(assert (=> b!704342 (= res!468315 (validKeyInArray!0 k0!2824))))

(declare-fun res!468316 () Bool)

(assert (=> start!62522 (=> (not res!468316) (not e!397559))))

(assert (=> start!62522 (= res!468316 (and (bvslt (size!19644 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19644 a!3591))))))

(assert (=> start!62522 e!397559))

(assert (=> start!62522 true))

(declare-fun array_inv!15145 (array!40212) Bool)

(assert (=> start!62522 (array_inv!15145 a!3591)))

(assert (= (and start!62522 res!468316) b!704340))

(assert (= (and b!704340 res!468305) b!704347))

(assert (= (and b!704347 res!468302) b!704344))

(assert (= (and b!704344 res!468314) b!704343))

(assert (= (and b!704343 res!468313) b!704332))

(assert (= (and b!704332 res!468307) b!704349))

(assert (= (and b!704349 res!468312) b!704342))

(assert (= (and b!704342 res!468315) b!704345))

(assert (= (and b!704345 res!468317) b!704341))

(assert (= (and b!704341 res!468310) b!704348))

(assert (= (and b!704348 res!468319) b!704335))

(assert (= (and b!704335 res!468306) b!704346))

(assert (= (and b!704346 res!468304) b!704336))

(assert (= (and b!704336 res!468311) b!704334))

(assert (= (and b!704334 res!468309) b!704339))

(assert (= (and b!704339 res!468318) b!704338))

(assert (= (and b!704338 res!468308) b!704333))

(assert (= (and b!704333 res!468303) b!704337))

(declare-fun m!662295 () Bool)

(assert (=> b!704342 m!662295))

(declare-fun m!662297 () Bool)

(assert (=> b!704347 m!662297))

(declare-fun m!662299 () Bool)

(assert (=> start!62522 m!662299))

(declare-fun m!662301 () Bool)

(assert (=> b!704344 m!662301))

(declare-fun m!662303 () Bool)

(assert (=> b!704333 m!662303))

(declare-fun m!662305 () Bool)

(assert (=> b!704345 m!662305))

(declare-fun m!662307 () Bool)

(assert (=> b!704343 m!662307))

(declare-fun m!662309 () Bool)

(assert (=> b!704341 m!662309))

(declare-fun m!662311 () Bool)

(assert (=> b!704336 m!662311))

(declare-fun m!662313 () Bool)

(assert (=> b!704340 m!662313))

(declare-fun m!662315 () Bool)

(assert (=> b!704335 m!662315))

(declare-fun m!662317 () Bool)

(assert (=> b!704346 m!662317))

(declare-fun m!662319 () Bool)

(assert (=> b!704332 m!662319))

(declare-fun m!662321 () Bool)

(assert (=> b!704349 m!662321))

(declare-fun m!662323 () Bool)

(assert (=> b!704337 m!662323))

(declare-fun m!662325 () Bool)

(assert (=> b!704348 m!662325))

(declare-fun m!662327 () Bool)

(assert (=> b!704339 m!662327))

(assert (=> b!704339 m!662327))

(declare-fun m!662329 () Bool)

(assert (=> b!704339 m!662329))

(check-sat (not b!704342) (not b!704346) (not b!704345) (not b!704332) (not b!704341) (not b!704340) (not b!704348) (not start!62522) (not b!704347) (not b!704336) (not b!704349) (not b!704339) (not b!704343) (not b!704337) (not b!704333) (not b!704335) (not b!704344))
(check-sat)
