; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62608 () Bool)

(assert start!62608)

(declare-fun res!470320 () Bool)

(declare-fun e!397963 () Bool)

(assert (=> start!62608 (=> (not res!470320) (not e!397963))))

(declare-datatypes ((array!40287 0))(
  ( (array!40288 (arr!19300 (Array (_ BitVec 32) (_ BitVec 64))) (size!19685 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40287)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62608 (= res!470320 (and (bvslt (size!19685 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19685 a!3591))))))

(assert (=> start!62608 e!397963))

(assert (=> start!62608 true))

(declare-fun array_inv!15096 (array!40287) Bool)

(assert (=> start!62608 (array_inv!15096 a!3591)))

(declare-fun b!706503 () Bool)

(declare-fun res!470321 () Bool)

(assert (=> b!706503 (=> (not res!470321) (not e!397963))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706503 (= res!470321 (validKeyInArray!0 k0!2824))))

(declare-fun b!706504 () Bool)

(declare-fun res!470318 () Bool)

(assert (=> b!706504 (=> (not res!470318) (not e!397963))))

(declare-datatypes ((List!13341 0))(
  ( (Nil!13338) (Cons!13337 (h!14382 (_ BitVec 64)) (t!19623 List!13341)) )
))
(declare-fun acc!652 () List!13341)

(declare-fun contains!3918 (List!13341 (_ BitVec 64)) Bool)

(assert (=> b!706504 (= res!470318 (not (contains!3918 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706505 () Bool)

(declare-fun res!470319 () Bool)

(assert (=> b!706505 (=> (not res!470319) (not e!397963))))

(declare-fun arrayContainsKey!0 (array!40287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706505 (= res!470319 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706506 () Bool)

(declare-fun res!470322 () Bool)

(assert (=> b!706506 (=> (not res!470322) (not e!397963))))

(assert (=> b!706506 (= res!470322 (not (contains!3918 acc!652 k0!2824)))))

(declare-fun b!706507 () Bool)

(declare-fun res!470313 () Bool)

(assert (=> b!706507 (=> (not res!470313) (not e!397963))))

(declare-fun newAcc!49 () List!13341)

(assert (=> b!706507 (= res!470313 (contains!3918 newAcc!49 k0!2824))))

(declare-fun b!706508 () Bool)

(assert (=> b!706508 (= e!397963 false)))

(declare-fun lt!317955 () Bool)

(assert (=> b!706508 (= lt!317955 (contains!3918 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706509 () Bool)

(declare-fun res!470315 () Bool)

(assert (=> b!706509 (=> (not res!470315) (not e!397963))))

(assert (=> b!706509 (= res!470315 (not (contains!3918 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706510 () Bool)

(declare-fun res!470316 () Bool)

(assert (=> b!706510 (=> (not res!470316) (not e!397963))))

(declare-fun -!328 (List!13341 (_ BitVec 64)) List!13341)

(assert (=> b!706510 (= res!470316 (= (-!328 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706511 () Bool)

(declare-fun res!470317 () Bool)

(assert (=> b!706511 (=> (not res!470317) (not e!397963))))

(declare-fun noDuplicate!1165 (List!13341) Bool)

(assert (=> b!706511 (= res!470317 (noDuplicate!1165 newAcc!49))))

(declare-fun b!706512 () Bool)

(declare-fun res!470323 () Bool)

(assert (=> b!706512 (=> (not res!470323) (not e!397963))))

(declare-fun arrayNoDuplicates!0 (array!40287 (_ BitVec 32) List!13341) Bool)

(assert (=> b!706512 (= res!470323 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706513 () Bool)

(declare-fun res!470325 () Bool)

(assert (=> b!706513 (=> (not res!470325) (not e!397963))))

(declare-fun subseq!363 (List!13341 List!13341) Bool)

(assert (=> b!706513 (= res!470325 (subseq!363 acc!652 newAcc!49))))

(declare-fun b!706514 () Bool)

(declare-fun res!470324 () Bool)

(assert (=> b!706514 (=> (not res!470324) (not e!397963))))

(assert (=> b!706514 (= res!470324 (noDuplicate!1165 acc!652))))

(declare-fun b!706515 () Bool)

(declare-fun res!470314 () Bool)

(assert (=> b!706515 (=> (not res!470314) (not e!397963))))

(assert (=> b!706515 (= res!470314 (not (contains!3918 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62608 res!470320) b!706514))

(assert (= (and b!706514 res!470324) b!706511))

(assert (= (and b!706511 res!470317) b!706504))

(assert (= (and b!706504 res!470318) b!706515))

(assert (= (and b!706515 res!470314) b!706505))

(assert (= (and b!706505 res!470319) b!706506))

(assert (= (and b!706506 res!470322) b!706503))

(assert (= (and b!706503 res!470321) b!706512))

(assert (= (and b!706512 res!470323) b!706513))

(assert (= (and b!706513 res!470325) b!706507))

(assert (= (and b!706507 res!470313) b!706510))

(assert (= (and b!706510 res!470316) b!706509))

(assert (= (and b!706509 res!470315) b!706508))

(declare-fun m!664355 () Bool)

(assert (=> b!706515 m!664355))

(declare-fun m!664357 () Bool)

(assert (=> b!706508 m!664357))

(declare-fun m!664359 () Bool)

(assert (=> b!706507 m!664359))

(declare-fun m!664361 () Bool)

(assert (=> b!706503 m!664361))

(declare-fun m!664363 () Bool)

(assert (=> b!706514 m!664363))

(declare-fun m!664365 () Bool)

(assert (=> b!706513 m!664365))

(declare-fun m!664367 () Bool)

(assert (=> b!706505 m!664367))

(declare-fun m!664369 () Bool)

(assert (=> b!706506 m!664369))

(declare-fun m!664371 () Bool)

(assert (=> b!706510 m!664371))

(declare-fun m!664373 () Bool)

(assert (=> b!706509 m!664373))

(declare-fun m!664375 () Bool)

(assert (=> b!706511 m!664375))

(declare-fun m!664377 () Bool)

(assert (=> b!706512 m!664377))

(declare-fun m!664379 () Bool)

(assert (=> start!62608 m!664379))

(declare-fun m!664381 () Bool)

(assert (=> b!706504 m!664381))

(check-sat (not start!62608) (not b!706505) (not b!706504) (not b!706513) (not b!706514) (not b!706511) (not b!706510) (not b!706509) (not b!706515) (not b!706508) (not b!706503) (not b!706512) (not b!706506) (not b!706507))
(check-sat)
