; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62532 () Bool)

(assert start!62532)

(declare-fun b!704566 () Bool)

(declare-fun res!468378 () Bool)

(declare-fun e!397735 () Bool)

(assert (=> b!704566 (=> (not res!468378) (not e!397735))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40211 0))(
  ( (array!40212 (arr!19262 (Array (_ BitVec 32) (_ BitVec 64))) (size!19647 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40211)

(assert (=> b!704566 (= res!468378 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19647 a!3591)))))

(declare-fun b!704567 () Bool)

(declare-fun res!468387 () Bool)

(assert (=> b!704567 (=> (not res!468387) (not e!397735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704567 (= res!468387 (not (validKeyInArray!0 (select (arr!19262 a!3591) from!2969))))))

(declare-fun b!704568 () Bool)

(declare-fun res!468380 () Bool)

(assert (=> b!704568 (=> (not res!468380) (not e!397735))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!704568 (= res!468380 (validKeyInArray!0 k!2824))))

(declare-fun b!704569 () Bool)

(declare-fun res!468383 () Bool)

(assert (=> b!704569 (=> (not res!468383) (not e!397735))))

(declare-datatypes ((List!13303 0))(
  ( (Nil!13300) (Cons!13299 (h!14344 (_ BitVec 64)) (t!19585 List!13303)) )
))
(declare-fun acc!652 () List!13303)

(declare-fun arrayNoDuplicates!0 (array!40211 (_ BitVec 32) List!13303) Bool)

(assert (=> b!704569 (= res!468383 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704570 () Bool)

(declare-fun res!468389 () Bool)

(assert (=> b!704570 (=> (not res!468389) (not e!397735))))

(declare-fun newAcc!49 () List!13303)

(declare-fun contains!3880 (List!13303 (_ BitVec 64)) Bool)

(assert (=> b!704570 (= res!468389 (not (contains!3880 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704571 () Bool)

(declare-fun res!468390 () Bool)

(assert (=> b!704571 (=> (not res!468390) (not e!397735))))

(declare-fun noDuplicate!1127 (List!13303) Bool)

(assert (=> b!704571 (= res!468390 (noDuplicate!1127 newAcc!49))))

(declare-fun b!704572 () Bool)

(declare-fun res!468377 () Bool)

(assert (=> b!704572 (=> (not res!468377) (not e!397735))))

(assert (=> b!704572 (= res!468377 (not (contains!3880 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704573 () Bool)

(declare-fun res!468379 () Bool)

(assert (=> b!704573 (=> (not res!468379) (not e!397735))))

(assert (=> b!704573 (= res!468379 (not (contains!3880 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704574 () Bool)

(declare-fun res!468382 () Bool)

(assert (=> b!704574 (=> (not res!468382) (not e!397735))))

(assert (=> b!704574 (= res!468382 (not (contains!3880 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704575 () Bool)

(assert (=> b!704575 (= e!397735 false)))

(declare-fun lt!317850 () Bool)

(assert (=> b!704575 (= lt!317850 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704576 () Bool)

(declare-fun res!468385 () Bool)

(assert (=> b!704576 (=> (not res!468385) (not e!397735))))

(declare-fun arrayContainsKey!0 (array!40211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704576 (= res!468385 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704577 () Bool)

(declare-fun res!468384 () Bool)

(assert (=> b!704577 (=> (not res!468384) (not e!397735))))

(assert (=> b!704577 (= res!468384 (noDuplicate!1127 acc!652))))

(declare-fun b!704578 () Bool)

(declare-fun res!468381 () Bool)

(assert (=> b!704578 (=> (not res!468381) (not e!397735))))

(declare-fun -!290 (List!13303 (_ BitVec 64)) List!13303)

(assert (=> b!704578 (= res!468381 (= (-!290 newAcc!49 k!2824) acc!652))))

(declare-fun b!704579 () Bool)

(declare-fun res!468392 () Bool)

(assert (=> b!704579 (=> (not res!468392) (not e!397735))))

(assert (=> b!704579 (= res!468392 (not (contains!3880 acc!652 k!2824)))))

(declare-fun b!704580 () Bool)

(declare-fun res!468388 () Bool)

(assert (=> b!704580 (=> (not res!468388) (not e!397735))))

(assert (=> b!704580 (= res!468388 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704581 () Bool)

(declare-fun res!468393 () Bool)

(assert (=> b!704581 (=> (not res!468393) (not e!397735))))

(assert (=> b!704581 (= res!468393 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704582 () Bool)

(declare-fun res!468391 () Bool)

(assert (=> b!704582 (=> (not res!468391) (not e!397735))))

(declare-fun subseq!325 (List!13303 List!13303) Bool)

(assert (=> b!704582 (= res!468391 (subseq!325 acc!652 newAcc!49))))

(declare-fun b!704583 () Bool)

(declare-fun res!468386 () Bool)

(assert (=> b!704583 (=> (not res!468386) (not e!397735))))

(assert (=> b!704583 (= res!468386 (contains!3880 newAcc!49 k!2824))))

(declare-fun res!468376 () Bool)

(assert (=> start!62532 (=> (not res!468376) (not e!397735))))

(assert (=> start!62532 (= res!468376 (and (bvslt (size!19647 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19647 a!3591))))))

(assert (=> start!62532 e!397735))

(assert (=> start!62532 true))

(declare-fun array_inv!15058 (array!40211) Bool)

(assert (=> start!62532 (array_inv!15058 a!3591)))

(assert (= (and start!62532 res!468376) b!704577))

(assert (= (and b!704577 res!468384) b!704571))

(assert (= (and b!704571 res!468390) b!704574))

(assert (= (and b!704574 res!468382) b!704572))

(assert (= (and b!704572 res!468377) b!704581))

(assert (= (and b!704581 res!468393) b!704579))

(assert (= (and b!704579 res!468392) b!704568))

(assert (= (and b!704568 res!468380) b!704569))

(assert (= (and b!704569 res!468383) b!704582))

(assert (= (and b!704582 res!468391) b!704583))

(assert (= (and b!704583 res!468386) b!704578))

(assert (= (and b!704578 res!468381) b!704570))

(assert (= (and b!704570 res!468389) b!704573))

(assert (= (and b!704573 res!468379) b!704566))

(assert (= (and b!704566 res!468378) b!704567))

(assert (= (and b!704567 res!468387) b!704580))

(assert (= (and b!704580 res!468388) b!704576))

(assert (= (and b!704576 res!468385) b!704575))

(declare-fun m!663019 () Bool)

(assert (=> b!704579 m!663019))

(declare-fun m!663021 () Bool)

(assert (=> b!704573 m!663021))

(declare-fun m!663023 () Bool)

(assert (=> b!704574 m!663023))

(declare-fun m!663025 () Bool)

(assert (=> b!704575 m!663025))

(declare-fun m!663027 () Bool)

(assert (=> b!704572 m!663027))

(declare-fun m!663029 () Bool)

(assert (=> b!704568 m!663029))

(declare-fun m!663031 () Bool)

(assert (=> b!704581 m!663031))

(declare-fun m!663033 () Bool)

(assert (=> start!62532 m!663033))

(declare-fun m!663035 () Bool)

(assert (=> b!704583 m!663035))

(declare-fun m!663037 () Bool)

(assert (=> b!704576 m!663037))

(declare-fun m!663039 () Bool)

(assert (=> b!704570 m!663039))

(declare-fun m!663041 () Bool)

(assert (=> b!704567 m!663041))

(assert (=> b!704567 m!663041))

(declare-fun m!663043 () Bool)

(assert (=> b!704567 m!663043))

(declare-fun m!663045 () Bool)

(assert (=> b!704582 m!663045))

(declare-fun m!663047 () Bool)

(assert (=> b!704577 m!663047))

(declare-fun m!663049 () Bool)

(assert (=> b!704569 m!663049))

(declare-fun m!663051 () Bool)

(assert (=> b!704578 m!663051))

(declare-fun m!663053 () Bool)

(assert (=> b!704571 m!663053))

(push 1)

(assert (not b!704572))

(assert (not b!704568))

(assert (not b!704567))

(assert (not b!704573))

(assert (not start!62532))

(assert (not b!704574))

(assert (not b!704576))

(assert (not b!704575))

(assert (not b!704571))

(assert (not b!704579))

(assert (not b!704577))

(assert (not b!704581))

(assert (not b!704583))

(assert (not b!704569))

(assert (not b!704578))

(assert (not b!704582))

(assert (not b!704570))

(check-sat)

