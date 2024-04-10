; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49758 () Bool)

(assert start!49758)

(declare-fun b!546877 () Bool)

(declare-fun res!340595 () Bool)

(declare-fun e!316029 () Bool)

(assert (=> b!546877 (=> (not res!340595) (not e!316029))))

(declare-datatypes ((array!34496 0))(
  ( (array!34497 (arr!16574 (Array (_ BitVec 32) (_ BitVec 64))) (size!16938 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34496)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546877 (= res!340595 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546878 () Bool)

(declare-fun res!340594 () Bool)

(assert (=> b!546878 (=> (not res!340594) (not e!316029))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546878 (= res!340594 (and (= (size!16938 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16938 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16938 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546879 () Bool)

(declare-fun res!340591 () Bool)

(assert (=> b!546879 (=> (not res!340591) (not e!316029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546879 (= res!340591 (validKeyInArray!0 (select (arr!16574 a!3118) j!142)))))

(declare-fun res!340592 () Bool)

(assert (=> start!49758 (=> (not res!340592) (not e!316029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49758 (= res!340592 (validMask!0 mask!3119))))

(assert (=> start!49758 e!316029))

(assert (=> start!49758 true))

(declare-fun array_inv!12370 (array!34496) Bool)

(assert (=> start!49758 (array_inv!12370 a!3118)))

(declare-fun b!546880 () Bool)

(declare-fun res!340593 () Bool)

(assert (=> b!546880 (=> (not res!340593) (not e!316029))))

(assert (=> b!546880 (= res!340593 (validKeyInArray!0 k!1914))))

(declare-fun b!546881 () Bool)

(assert (=> b!546881 (= e!316029 false)))

(declare-datatypes ((SeekEntryResult!5023 0))(
  ( (MissingZero!5023 (index!22319 (_ BitVec 32))) (Found!5023 (index!22320 (_ BitVec 32))) (Intermediate!5023 (undefined!5835 Bool) (index!22321 (_ BitVec 32)) (x!51267 (_ BitVec 32))) (Undefined!5023) (MissingVacant!5023 (index!22322 (_ BitVec 32))) )
))
(declare-fun lt!249382 () SeekEntryResult!5023)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34496 (_ BitVec 32)) SeekEntryResult!5023)

(assert (=> b!546881 (= lt!249382 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!49758 res!340592) b!546878))

(assert (= (and b!546878 res!340594) b!546879))

(assert (= (and b!546879 res!340591) b!546880))

(assert (= (and b!546880 res!340593) b!546877))

(assert (= (and b!546877 res!340595) b!546881))

(declare-fun m!524263 () Bool)

(assert (=> b!546879 m!524263))

(assert (=> b!546879 m!524263))

(declare-fun m!524265 () Bool)

(assert (=> b!546879 m!524265))

(declare-fun m!524267 () Bool)

(assert (=> b!546881 m!524267))

(declare-fun m!524269 () Bool)

(assert (=> start!49758 m!524269))

(declare-fun m!524271 () Bool)

(assert (=> start!49758 m!524271))

(declare-fun m!524273 () Bool)

(assert (=> b!546880 m!524273))

(declare-fun m!524275 () Bool)

(assert (=> b!546877 m!524275))

(push 1)

(assert (not start!49758))

(assert (not b!546880))

(assert (not b!546879))

(assert (not b!546881))

(assert (not b!546877))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

