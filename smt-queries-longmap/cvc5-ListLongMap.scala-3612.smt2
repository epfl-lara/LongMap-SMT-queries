; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49734 () Bool)

(assert start!49734)

(declare-fun b!546516 () Bool)

(declare-fun res!340373 () Bool)

(declare-fun e!315818 () Bool)

(assert (=> b!546516 (=> (not res!340373) (not e!315818))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546516 (= res!340373 (validKeyInArray!0 k!1914))))

(declare-fun res!340376 () Bool)

(assert (=> start!49734 (=> (not res!340376) (not e!315818))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49734 (= res!340376 (validMask!0 mask!3119))))

(assert (=> start!49734 e!315818))

(assert (=> start!49734 true))

(declare-datatypes ((array!34481 0))(
  ( (array!34482 (arr!16567 (Array (_ BitVec 32) (_ BitVec 64))) (size!16932 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34481)

(declare-fun array_inv!12450 (array!34481) Bool)

(assert (=> start!49734 (array_inv!12450 a!3118)))

(declare-fun b!546517 () Bool)

(declare-fun res!340374 () Bool)

(assert (=> b!546517 (=> (not res!340374) (not e!315818))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!546517 (= res!340374 (validKeyInArray!0 (select (arr!16567 a!3118) j!142)))))

(declare-fun b!546518 () Bool)

(declare-fun res!340372 () Bool)

(assert (=> b!546518 (=> (not res!340372) (not e!315818))))

(declare-fun arrayContainsKey!0 (array!34481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546518 (= res!340372 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546519 () Bool)

(assert (=> b!546519 (= e!315818 false)))

(declare-datatypes ((SeekEntryResult!5013 0))(
  ( (MissingZero!5013 (index!22279 (_ BitVec 32))) (Found!5013 (index!22280 (_ BitVec 32))) (Intermediate!5013 (undefined!5825 Bool) (index!22281 (_ BitVec 32)) (x!51236 (_ BitVec 32))) (Undefined!5013) (MissingVacant!5013 (index!22282 (_ BitVec 32))) )
))
(declare-fun lt!249130 () SeekEntryResult!5013)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34481 (_ BitVec 32)) SeekEntryResult!5013)

(assert (=> b!546519 (= lt!249130 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546520 () Bool)

(declare-fun res!340375 () Bool)

(assert (=> b!546520 (=> (not res!340375) (not e!315818))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546520 (= res!340375 (and (= (size!16932 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16932 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16932 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49734 res!340376) b!546520))

(assert (= (and b!546520 res!340375) b!546517))

(assert (= (and b!546517 res!340374) b!546516))

(assert (= (and b!546516 res!340373) b!546518))

(assert (= (and b!546518 res!340372) b!546519))

(declare-fun m!523427 () Bool)

(assert (=> b!546517 m!523427))

(assert (=> b!546517 m!523427))

(declare-fun m!523429 () Bool)

(assert (=> b!546517 m!523429))

(declare-fun m!523431 () Bool)

(assert (=> start!49734 m!523431))

(declare-fun m!523433 () Bool)

(assert (=> start!49734 m!523433))

(declare-fun m!523435 () Bool)

(assert (=> b!546519 m!523435))

(declare-fun m!523437 () Bool)

(assert (=> b!546518 m!523437))

(declare-fun m!523439 () Bool)

(assert (=> b!546516 m!523439))

(push 1)

(assert (not b!546519))

(assert (not start!49734))

(assert (not b!546517))

(assert (not b!546518))

(assert (not b!546516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

