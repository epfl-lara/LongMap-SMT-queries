; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49776 () Bool)

(assert start!49776)

(declare-fun b!546843 () Bool)

(declare-fun e!316067 () Bool)

(assert (=> b!546843 (= e!316067 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4959 0))(
  ( (MissingZero!4959 (index!22063 (_ BitVec 32))) (Found!4959 (index!22064 (_ BitVec 32))) (Intermediate!4959 (undefined!5771 Bool) (index!22065 (_ BitVec 32)) (x!51166 (_ BitVec 32))) (Undefined!4959) (MissingVacant!4959 (index!22066 (_ BitVec 32))) )
))
(declare-fun lt!249457 () SeekEntryResult!4959)

(declare-datatypes ((array!34460 0))(
  ( (array!34461 (arr!16554 (Array (_ BitVec 32) (_ BitVec 64))) (size!16918 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34460)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34460 (_ BitVec 32)) SeekEntryResult!4959)

(assert (=> b!546843 (= lt!249457 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546844 () Bool)

(declare-fun res!340453 () Bool)

(assert (=> b!546844 (=> (not res!340453) (not e!316067))))

(declare-fun arrayContainsKey!0 (array!34460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546844 (= res!340453 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340455 () Bool)

(assert (=> start!49776 (=> (not res!340455) (not e!316067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49776 (= res!340455 (validMask!0 mask!3119))))

(assert (=> start!49776 e!316067))

(assert (=> start!49776 true))

(declare-fun array_inv!12413 (array!34460) Bool)

(assert (=> start!49776 (array_inv!12413 a!3118)))

(declare-fun b!546845 () Bool)

(declare-fun res!340454 () Bool)

(assert (=> b!546845 (=> (not res!340454) (not e!316067))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546845 (= res!340454 (and (= (size!16918 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16918 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16918 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546846 () Bool)

(declare-fun res!340456 () Bool)

(assert (=> b!546846 (=> (not res!340456) (not e!316067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546846 (= res!340456 (validKeyInArray!0 (select (arr!16554 a!3118) j!142)))))

(declare-fun b!546847 () Bool)

(declare-fun res!340452 () Bool)

(assert (=> b!546847 (=> (not res!340452) (not e!316067))))

(assert (=> b!546847 (= res!340452 (validKeyInArray!0 k!1914))))

(assert (= (and start!49776 res!340455) b!546845))

(assert (= (and b!546845 res!340454) b!546846))

(assert (= (and b!546846 res!340456) b!546847))

(assert (= (and b!546847 res!340452) b!546844))

(assert (= (and b!546844 res!340453) b!546843))

(declare-fun m!524405 () Bool)

(assert (=> b!546846 m!524405))

(assert (=> b!546846 m!524405))

(declare-fun m!524407 () Bool)

(assert (=> b!546846 m!524407))

(declare-fun m!524409 () Bool)

(assert (=> start!49776 m!524409))

(declare-fun m!524411 () Bool)

(assert (=> start!49776 m!524411))

(declare-fun m!524413 () Bool)

(assert (=> b!546843 m!524413))

(declare-fun m!524415 () Bool)

(assert (=> b!546847 m!524415))

(declare-fun m!524417 () Bool)

(assert (=> b!546844 m!524417))

(push 1)

(assert (not b!546847))

(assert (not b!546846))

(assert (not b!546844))

(assert (not b!546843))

(assert (not start!49776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

