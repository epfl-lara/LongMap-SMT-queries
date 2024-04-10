; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63436 () Bool)

(assert start!63436)

(declare-fun b!714502 () Bool)

(declare-fun res!477542 () Bool)

(declare-fun e!401572 () Bool)

(assert (=> b!714502 (=> (not res!477542) (not e!401572))))

(declare-datatypes ((array!40495 0))(
  ( (array!40496 (arr!19386 (Array (_ BitVec 32) (_ BitVec 64))) (size!19799 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40495)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13427 0))(
  ( (Nil!13424) (Cons!13423 (h!14468 (_ BitVec 64)) (t!19742 List!13427)) )
))
(declare-fun acc!652 () List!13427)

(declare-fun arrayNoDuplicates!0 (array!40495 (_ BitVec 32) List!13427) Bool)

(assert (=> b!714502 (= res!477542 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714503 () Bool)

(declare-fun res!477536 () Bool)

(assert (=> b!714503 (=> (not res!477536) (not e!401572))))

(declare-fun contains!4004 (List!13427 (_ BitVec 64)) Bool)

(assert (=> b!714503 (= res!477536 (not (contains!4004 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714504 () Bool)

(declare-fun res!477544 () Bool)

(assert (=> b!714504 (=> (not res!477544) (not e!401572))))

(declare-fun newAcc!49 () List!13427)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!414 (List!13427 (_ BitVec 64)) List!13427)

(assert (=> b!714504 (= res!477544 (= (-!414 newAcc!49 k!2824) acc!652))))

(declare-fun b!714505 () Bool)

(declare-fun res!477540 () Bool)

(assert (=> b!714505 (=> (not res!477540) (not e!401572))))

(assert (=> b!714505 (= res!477540 (not (contains!4004 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714506 () Bool)

(declare-fun res!477539 () Bool)

(assert (=> b!714506 (=> (not res!477539) (not e!401572))))

(assert (=> b!714506 (= res!477539 (not (contains!4004 acc!652 k!2824)))))

(declare-fun b!714507 () Bool)

(declare-fun res!477541 () Bool)

(assert (=> b!714507 (=> (not res!477541) (not e!401572))))

(assert (=> b!714507 (= res!477541 (not (contains!4004 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714508 () Bool)

(declare-fun res!477533 () Bool)

(assert (=> b!714508 (=> (not res!477533) (not e!401572))))

(assert (=> b!714508 (= res!477533 (contains!4004 newAcc!49 k!2824))))

(declare-fun b!714509 () Bool)

(declare-fun res!477538 () Bool)

(assert (=> b!714509 (=> (not res!477538) (not e!401572))))

(declare-fun arrayContainsKey!0 (array!40495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714509 (= res!477538 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!714510 () Bool)

(declare-fun res!477532 () Bool)

(assert (=> b!714510 (=> (not res!477532) (not e!401572))))

(declare-fun noDuplicate!1251 (List!13427) Bool)

(assert (=> b!714510 (= res!477532 (noDuplicate!1251 acc!652))))

(declare-fun b!714511 () Bool)

(declare-fun res!477537 () Bool)

(assert (=> b!714511 (=> (not res!477537) (not e!401572))))

(declare-fun subseq!449 (List!13427 List!13427) Bool)

(assert (=> b!714511 (= res!477537 (subseq!449 acc!652 newAcc!49))))

(declare-fun res!477535 () Bool)

(assert (=> start!63436 (=> (not res!477535) (not e!401572))))

(assert (=> start!63436 (= res!477535 (and (bvslt (size!19799 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19799 a!3591))))))

(assert (=> start!63436 e!401572))

(assert (=> start!63436 true))

(declare-fun array_inv!15182 (array!40495) Bool)

(assert (=> start!63436 (array_inv!15182 a!3591)))

(declare-fun b!714512 () Bool)

(declare-fun res!477534 () Bool)

(assert (=> b!714512 (=> (not res!477534) (not e!401572))))

(assert (=> b!714512 (= res!477534 (noDuplicate!1251 newAcc!49))))

(declare-fun b!714513 () Bool)

(declare-fun res!477543 () Bool)

(assert (=> b!714513 (=> (not res!477543) (not e!401572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714513 (= res!477543 (validKeyInArray!0 k!2824))))

(declare-fun b!714514 () Bool)

(assert (=> b!714514 (= e!401572 false)))

(declare-fun lt!318776 () Bool)

(assert (=> b!714514 (= lt!318776 (contains!4004 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!63436 res!477535) b!714510))

(assert (= (and b!714510 res!477532) b!714512))

(assert (= (and b!714512 res!477534) b!714507))

(assert (= (and b!714507 res!477541) b!714503))

(assert (= (and b!714503 res!477536) b!714509))

(assert (= (and b!714509 res!477538) b!714506))

(assert (= (and b!714506 res!477539) b!714513))

(assert (= (and b!714513 res!477543) b!714502))

(assert (= (and b!714502 res!477542) b!714511))

(assert (= (and b!714511 res!477537) b!714508))

(assert (= (and b!714508 res!477533) b!714504))

(assert (= (and b!714504 res!477544) b!714505))

(assert (= (and b!714505 res!477540) b!714514))

(declare-fun m!671017 () Bool)

(assert (=> b!714512 m!671017))

(declare-fun m!671019 () Bool)

(assert (=> start!63436 m!671019))

(declare-fun m!671021 () Bool)

(assert (=> b!714510 m!671021))

(declare-fun m!671023 () Bool)

(assert (=> b!714508 m!671023))

(declare-fun m!671025 () Bool)

(assert (=> b!714514 m!671025))

(declare-fun m!671027 () Bool)

(assert (=> b!714505 m!671027))

(declare-fun m!671029 () Bool)

(assert (=> b!714503 m!671029))

(declare-fun m!671031 () Bool)

(assert (=> b!714507 m!671031))

(declare-fun m!671033 () Bool)

(assert (=> b!714511 m!671033))

(declare-fun m!671035 () Bool)

(assert (=> b!714509 m!671035))

(declare-fun m!671037 () Bool)

(assert (=> b!714504 m!671037))

(declare-fun m!671039 () Bool)

(assert (=> b!714513 m!671039))

(declare-fun m!671041 () Bool)

(assert (=> b!714502 m!671041))

(declare-fun m!671043 () Bool)

(assert (=> b!714506 m!671043))

(push 1)

(assert (not b!714513))

(assert (not start!63436))

(assert (not b!714507))

(assert (not b!714510))

(assert (not b!714506))

(assert (not b!714502))

(assert (not b!714508))

(assert (not b!714503))

(assert (not b!714504))

(assert (not b!714514))

(assert (not b!714512))

(assert (not b!714511))

(assert (not b!714509))

(assert (not b!714505))

(check-sat)

