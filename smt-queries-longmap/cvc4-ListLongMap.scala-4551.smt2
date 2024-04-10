; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63434 () Bool)

(assert start!63434)

(declare-fun b!714463 () Bool)

(declare-fun res!477504 () Bool)

(declare-fun e!401567 () Bool)

(assert (=> b!714463 (=> (not res!477504) (not e!401567))))

(declare-datatypes ((List!13426 0))(
  ( (Nil!13423) (Cons!13422 (h!14467 (_ BitVec 64)) (t!19741 List!13426)) )
))
(declare-fun acc!652 () List!13426)

(declare-fun noDuplicate!1250 (List!13426) Bool)

(assert (=> b!714463 (= res!477504 (noDuplicate!1250 acc!652))))

(declare-fun b!714464 () Bool)

(assert (=> b!714464 (= e!401567 false)))

(declare-fun lt!318773 () Bool)

(declare-fun newAcc!49 () List!13426)

(declare-fun contains!4003 (List!13426 (_ BitVec 64)) Bool)

(assert (=> b!714464 (= lt!318773 (contains!4003 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!477501 () Bool)

(assert (=> start!63434 (=> (not res!477501) (not e!401567))))

(declare-datatypes ((array!40493 0))(
  ( (array!40494 (arr!19385 (Array (_ BitVec 32) (_ BitVec 64))) (size!19798 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40493)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63434 (= res!477501 (and (bvslt (size!19798 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19798 a!3591))))))

(assert (=> start!63434 e!401567))

(assert (=> start!63434 true))

(declare-fun array_inv!15181 (array!40493) Bool)

(assert (=> start!63434 (array_inv!15181 a!3591)))

(declare-fun b!714465 () Bool)

(declare-fun res!477495 () Bool)

(assert (=> b!714465 (=> (not res!477495) (not e!401567))))

(declare-fun arrayNoDuplicates!0 (array!40493 (_ BitVec 32) List!13426) Bool)

(assert (=> b!714465 (= res!477495 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714466 () Bool)

(declare-fun res!477502 () Bool)

(assert (=> b!714466 (=> (not res!477502) (not e!401567))))

(assert (=> b!714466 (= res!477502 (not (contains!4003 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714467 () Bool)

(declare-fun res!477503 () Bool)

(assert (=> b!714467 (=> (not res!477503) (not e!401567))))

(assert (=> b!714467 (= res!477503 (not (contains!4003 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714468 () Bool)

(declare-fun res!477494 () Bool)

(assert (=> b!714468 (=> (not res!477494) (not e!401567))))

(assert (=> b!714468 (= res!477494 (not (contains!4003 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714469 () Bool)

(declare-fun res!477493 () Bool)

(assert (=> b!714469 (=> (not res!477493) (not e!401567))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!714469 (= res!477493 (contains!4003 newAcc!49 k!2824))))

(declare-fun b!714470 () Bool)

(declare-fun res!477498 () Bool)

(assert (=> b!714470 (=> (not res!477498) (not e!401567))))

(assert (=> b!714470 (= res!477498 (not (contains!4003 acc!652 k!2824)))))

(declare-fun b!714471 () Bool)

(declare-fun res!477505 () Bool)

(assert (=> b!714471 (=> (not res!477505) (not e!401567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714471 (= res!477505 (validKeyInArray!0 k!2824))))

(declare-fun b!714472 () Bool)

(declare-fun res!477496 () Bool)

(assert (=> b!714472 (=> (not res!477496) (not e!401567))))

(declare-fun subseq!448 (List!13426 List!13426) Bool)

(assert (=> b!714472 (= res!477496 (subseq!448 acc!652 newAcc!49))))

(declare-fun b!714473 () Bool)

(declare-fun res!477499 () Bool)

(assert (=> b!714473 (=> (not res!477499) (not e!401567))))

(declare-fun arrayContainsKey!0 (array!40493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714473 (= res!477499 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!714474 () Bool)

(declare-fun res!477497 () Bool)

(assert (=> b!714474 (=> (not res!477497) (not e!401567))))

(declare-fun -!413 (List!13426 (_ BitVec 64)) List!13426)

(assert (=> b!714474 (= res!477497 (= (-!413 newAcc!49 k!2824) acc!652))))

(declare-fun b!714475 () Bool)

(declare-fun res!477500 () Bool)

(assert (=> b!714475 (=> (not res!477500) (not e!401567))))

(assert (=> b!714475 (= res!477500 (noDuplicate!1250 newAcc!49))))

(assert (= (and start!63434 res!477501) b!714463))

(assert (= (and b!714463 res!477504) b!714475))

(assert (= (and b!714475 res!477500) b!714467))

(assert (= (and b!714467 res!477503) b!714468))

(assert (= (and b!714468 res!477494) b!714473))

(assert (= (and b!714473 res!477499) b!714470))

(assert (= (and b!714470 res!477498) b!714471))

(assert (= (and b!714471 res!477505) b!714465))

(assert (= (and b!714465 res!477495) b!714472))

(assert (= (and b!714472 res!477496) b!714469))

(assert (= (and b!714469 res!477493) b!714474))

(assert (= (and b!714474 res!477497) b!714466))

(assert (= (and b!714466 res!477502) b!714464))

(declare-fun m!670989 () Bool)

(assert (=> b!714471 m!670989))

(declare-fun m!670991 () Bool)

(assert (=> b!714466 m!670991))

(declare-fun m!670993 () Bool)

(assert (=> start!63434 m!670993))

(declare-fun m!670995 () Bool)

(assert (=> b!714473 m!670995))

(declare-fun m!670997 () Bool)

(assert (=> b!714468 m!670997))

(declare-fun m!670999 () Bool)

(assert (=> b!714475 m!670999))

(declare-fun m!671001 () Bool)

(assert (=> b!714474 m!671001))

(declare-fun m!671003 () Bool)

(assert (=> b!714472 m!671003))

(declare-fun m!671005 () Bool)

(assert (=> b!714464 m!671005))

(declare-fun m!671007 () Bool)

(assert (=> b!714463 m!671007))

(declare-fun m!671009 () Bool)

(assert (=> b!714470 m!671009))

(declare-fun m!671011 () Bool)

(assert (=> b!714469 m!671011))

(declare-fun m!671013 () Bool)

(assert (=> b!714467 m!671013))

(declare-fun m!671015 () Bool)

(assert (=> b!714465 m!671015))

(push 1)

(assert (not b!714471))

(assert (not b!714470))

(assert (not b!714474))

(assert (not b!714467))

(assert (not b!714463))

(assert (not start!63434))

(assert (not b!714466))

(assert (not b!714465))

(assert (not b!714472))

(assert (not b!714468))

(assert (not b!714469))

(assert (not b!714464))

(assert (not b!714473))

(assert (not b!714475))

