; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49746 () Bool)

(assert start!49746)

(declare-fun res!340462 () Bool)

(declare-fun e!315854 () Bool)

(assert (=> start!49746 (=> (not res!340462) (not e!315854))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49746 (= res!340462 (validMask!0 mask!3119))))

(assert (=> start!49746 e!315854))

(assert (=> start!49746 true))

(declare-datatypes ((array!34493 0))(
  ( (array!34494 (arr!16573 (Array (_ BitVec 32) (_ BitVec 64))) (size!16938 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34493)

(declare-fun array_inv!12456 (array!34493) Bool)

(assert (=> start!49746 (array_inv!12456 a!3118)))

(declare-fun b!546606 () Bool)

(assert (=> b!546606 (= e!315854 false)))

(declare-datatypes ((SeekEntryResult!5019 0))(
  ( (MissingZero!5019 (index!22303 (_ BitVec 32))) (Found!5019 (index!22304 (_ BitVec 32))) (Intermediate!5019 (undefined!5831 Bool) (index!22305 (_ BitVec 32)) (x!51258 (_ BitVec 32))) (Undefined!5019) (MissingVacant!5019 (index!22306 (_ BitVec 32))) )
))
(declare-fun lt!249148 () SeekEntryResult!5019)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34493 (_ BitVec 32)) SeekEntryResult!5019)

(assert (=> b!546606 (= lt!249148 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546607 () Bool)

(declare-fun res!340464 () Bool)

(assert (=> b!546607 (=> (not res!340464) (not e!315854))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546607 (= res!340464 (and (= (size!16938 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16938 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16938 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546608 () Bool)

(declare-fun res!340466 () Bool)

(assert (=> b!546608 (=> (not res!340466) (not e!315854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546608 (= res!340466 (validKeyInArray!0 k!1914))))

(declare-fun b!546609 () Bool)

(declare-fun res!340463 () Bool)

(assert (=> b!546609 (=> (not res!340463) (not e!315854))))

(declare-fun arrayContainsKey!0 (array!34493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546609 (= res!340463 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546610 () Bool)

(declare-fun res!340465 () Bool)

(assert (=> b!546610 (=> (not res!340465) (not e!315854))))

(assert (=> b!546610 (= res!340465 (validKeyInArray!0 (select (arr!16573 a!3118) j!142)))))

(assert (= (and start!49746 res!340462) b!546607))

(assert (= (and b!546607 res!340464) b!546610))

(assert (= (and b!546610 res!340465) b!546608))

(assert (= (and b!546608 res!340466) b!546609))

(assert (= (and b!546609 res!340463) b!546606))

(declare-fun m!523511 () Bool)

(assert (=> b!546610 m!523511))

(assert (=> b!546610 m!523511))

(declare-fun m!523513 () Bool)

(assert (=> b!546610 m!523513))

(declare-fun m!523515 () Bool)

(assert (=> b!546609 m!523515))

(declare-fun m!523517 () Bool)

(assert (=> start!49746 m!523517))

(declare-fun m!523519 () Bool)

(assert (=> start!49746 m!523519))

(declare-fun m!523521 () Bool)

(assert (=> b!546606 m!523521))

(declare-fun m!523523 () Bool)

(assert (=> b!546608 m!523523))

(push 1)

(assert (not b!546610))

(assert (not start!49746))

(assert (not b!546609))

(assert (not b!546608))

(assert (not b!546606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

