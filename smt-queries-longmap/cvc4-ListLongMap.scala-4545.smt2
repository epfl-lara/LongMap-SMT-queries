; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63350 () Bool)

(assert start!63350)

(declare-fun b!713500 () Bool)

(declare-fun e!401261 () Bool)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!713500 (= e!401261 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!713501 () Bool)

(declare-fun res!476591 () Bool)

(assert (=> b!713501 (=> (not res!476591) (not e!401261))))

(declare-datatypes ((List!13408 0))(
  ( (Nil!13405) (Cons!13404 (h!14449 (_ BitVec 64)) (t!19723 List!13408)) )
))
(declare-fun newAcc!49 () List!13408)

(declare-fun noDuplicate!1232 (List!13408) Bool)

(assert (=> b!713501 (= res!476591 (noDuplicate!1232 newAcc!49))))

(declare-fun b!713502 () Bool)

(declare-fun res!476599 () Bool)

(assert (=> b!713502 (=> (not res!476599) (not e!401261))))

(declare-datatypes ((array!40454 0))(
  ( (array!40455 (arr!19367 (Array (_ BitVec 32) (_ BitVec 64))) (size!19778 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40454)

(assert (=> b!713502 (= res!476599 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19778 a!3591)))))

(declare-fun b!713503 () Bool)

(declare-fun res!476589 () Bool)

(assert (=> b!713503 (=> (not res!476589) (not e!401261))))

(declare-fun acc!652 () List!13408)

(assert (=> b!713503 (= res!476589 (noDuplicate!1232 acc!652))))

(declare-fun b!713504 () Bool)

(declare-fun res!476595 () Bool)

(assert (=> b!713504 (=> (not res!476595) (not e!401261))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3985 (List!13408 (_ BitVec 64)) Bool)

(assert (=> b!713504 (= res!476595 (not (contains!3985 acc!652 k!2824)))))

(declare-fun res!476597 () Bool)

(assert (=> start!63350 (=> (not res!476597) (not e!401261))))

(assert (=> start!63350 (= res!476597 (and (bvslt (size!19778 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19778 a!3591))))))

(assert (=> start!63350 e!401261))

(assert (=> start!63350 true))

(declare-fun array_inv!15163 (array!40454) Bool)

(assert (=> start!63350 (array_inv!15163 a!3591)))

(declare-fun b!713505 () Bool)

(declare-fun res!476585 () Bool)

(assert (=> b!713505 (=> (not res!476585) (not e!401261))))

(assert (=> b!713505 (= res!476585 (not (contains!3985 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713506 () Bool)

(declare-fun res!476594 () Bool)

(assert (=> b!713506 (=> (not res!476594) (not e!401261))))

(assert (=> b!713506 (= res!476594 (not (contains!3985 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713507 () Bool)

(declare-fun res!476590 () Bool)

(assert (=> b!713507 (=> (not res!476590) (not e!401261))))

(assert (=> b!713507 (= res!476590 (contains!3985 newAcc!49 k!2824))))

(declare-fun b!713508 () Bool)

(declare-fun res!476586 () Bool)

(assert (=> b!713508 (=> (not res!476586) (not e!401261))))

(assert (=> b!713508 (= res!476586 (not (contains!3985 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713509 () Bool)

(declare-fun res!476584 () Bool)

(assert (=> b!713509 (=> (not res!476584) (not e!401261))))

(declare-fun subseq!430 (List!13408 List!13408) Bool)

(assert (=> b!713509 (= res!476584 (subseq!430 acc!652 newAcc!49))))

(declare-fun b!713510 () Bool)

(declare-fun res!476587 () Bool)

(assert (=> b!713510 (=> (not res!476587) (not e!401261))))

(declare-fun -!395 (List!13408 (_ BitVec 64)) List!13408)

(assert (=> b!713510 (= res!476587 (= (-!395 newAcc!49 k!2824) acc!652))))

(declare-fun b!713511 () Bool)

(declare-fun res!476596 () Bool)

(assert (=> b!713511 (=> (not res!476596) (not e!401261))))

(assert (=> b!713511 (= res!476596 (not (contains!3985 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713512 () Bool)

(declare-fun res!476593 () Bool)

(assert (=> b!713512 (=> (not res!476593) (not e!401261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713512 (= res!476593 (validKeyInArray!0 k!2824))))

(declare-fun b!713513 () Bool)

(declare-fun res!476592 () Bool)

(assert (=> b!713513 (=> (not res!476592) (not e!401261))))

(assert (=> b!713513 (= res!476592 (not (validKeyInArray!0 (select (arr!19367 a!3591) from!2969))))))

(declare-fun b!713514 () Bool)

(declare-fun res!476598 () Bool)

(assert (=> b!713514 (=> (not res!476598) (not e!401261))))

(declare-fun arrayNoDuplicates!0 (array!40454 (_ BitVec 32) List!13408) Bool)

(assert (=> b!713514 (= res!476598 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713515 () Bool)

(declare-fun res!476588 () Bool)

(assert (=> b!713515 (=> (not res!476588) (not e!401261))))

(declare-fun arrayContainsKey!0 (array!40454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713515 (= res!476588 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(assert (= (and start!63350 res!476597) b!713503))

(assert (= (and b!713503 res!476589) b!713501))

(assert (= (and b!713501 res!476591) b!713505))

(assert (= (and b!713505 res!476585) b!713508))

(assert (= (and b!713508 res!476586) b!713515))

(assert (= (and b!713515 res!476588) b!713504))

(assert (= (and b!713504 res!476595) b!713512))

(assert (= (and b!713512 res!476593) b!713514))

(assert (= (and b!713514 res!476598) b!713509))

(assert (= (and b!713509 res!476584) b!713507))

(assert (= (and b!713507 res!476590) b!713510))

(assert (= (and b!713510 res!476587) b!713506))

(assert (= (and b!713506 res!476594) b!713511))

(assert (= (and b!713511 res!476596) b!713502))

(assert (= (and b!713502 res!476599) b!713513))

(assert (= (and b!713513 res!476592) b!713500))

(declare-fun m!670283 () Bool)

(assert (=> b!713508 m!670283))

(declare-fun m!670285 () Bool)

(assert (=> b!713509 m!670285))

(declare-fun m!670287 () Bool)

(assert (=> b!713512 m!670287))

(declare-fun m!670289 () Bool)

(assert (=> b!713514 m!670289))

(declare-fun m!670291 () Bool)

(assert (=> b!713504 m!670291))

(declare-fun m!670293 () Bool)

(assert (=> b!713510 m!670293))

(declare-fun m!670295 () Bool)

(assert (=> start!63350 m!670295))

(declare-fun m!670297 () Bool)

(assert (=> b!713511 m!670297))

(declare-fun m!670299 () Bool)

(assert (=> b!713503 m!670299))

(declare-fun m!670301 () Bool)

(assert (=> b!713506 m!670301))

(declare-fun m!670303 () Bool)

(assert (=> b!713507 m!670303))

(declare-fun m!670305 () Bool)

(assert (=> b!713513 m!670305))

(assert (=> b!713513 m!670305))

(declare-fun m!670307 () Bool)

(assert (=> b!713513 m!670307))

(declare-fun m!670309 () Bool)

(assert (=> b!713501 m!670309))

(declare-fun m!670311 () Bool)

(assert (=> b!713515 m!670311))

(declare-fun m!670313 () Bool)

(assert (=> b!713505 m!670313))

(push 1)

(assert (not b!713508))

(assert (not b!713501))

(assert (not b!713514))

