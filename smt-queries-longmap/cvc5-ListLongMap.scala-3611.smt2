; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49788 () Bool)

(assert start!49788)

(declare-fun res!340554 () Bool)

(declare-fun e!316104 () Bool)

(assert (=> start!49788 (=> (not res!340554) (not e!316104))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49788 (= res!340554 (validMask!0 mask!3119))))

(assert (=> start!49788 e!316104))

(assert (=> start!49788 true))

(declare-datatypes ((array!34472 0))(
  ( (array!34473 (arr!16560 (Array (_ BitVec 32) (_ BitVec 64))) (size!16924 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34472)

(declare-fun array_inv!12419 (array!34472) Bool)

(assert (=> start!49788 (array_inv!12419 a!3118)))

(declare-fun b!546942 () Bool)

(assert (=> b!546942 (= e!316104 false)))

(declare-datatypes ((SeekEntryResult!4965 0))(
  ( (MissingZero!4965 (index!22087 (_ BitVec 32))) (Found!4965 (index!22088 (_ BitVec 32))) (Intermediate!4965 (undefined!5777 Bool) (index!22089 (_ BitVec 32)) (x!51188 (_ BitVec 32))) (Undefined!4965) (MissingVacant!4965 (index!22090 (_ BitVec 32))) )
))
(declare-fun lt!249466 () SeekEntryResult!4965)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34472 (_ BitVec 32)) SeekEntryResult!4965)

(assert (=> b!546942 (= lt!249466 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546943 () Bool)

(declare-fun res!340553 () Bool)

(assert (=> b!546943 (=> (not res!340553) (not e!316104))))

(declare-fun arrayContainsKey!0 (array!34472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546943 (= res!340553 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546944 () Bool)

(declare-fun res!340552 () Bool)

(assert (=> b!546944 (=> (not res!340552) (not e!316104))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546944 (= res!340552 (and (= (size!16924 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16924 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16924 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546945 () Bool)

(declare-fun res!340551 () Bool)

(assert (=> b!546945 (=> (not res!340551) (not e!316104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546945 (= res!340551 (validKeyInArray!0 (select (arr!16560 a!3118) j!142)))))

(declare-fun b!546946 () Bool)

(declare-fun res!340555 () Bool)

(assert (=> b!546946 (=> (not res!340555) (not e!316104))))

(assert (=> b!546946 (= res!340555 (validKeyInArray!0 k!1914))))

(assert (= (and start!49788 res!340554) b!546944))

(assert (= (and b!546944 res!340552) b!546945))

(assert (= (and b!546945 res!340551) b!546946))

(assert (= (and b!546946 res!340555) b!546943))

(assert (= (and b!546943 res!340553) b!546942))

(declare-fun m!524489 () Bool)

(assert (=> b!546943 m!524489))

(declare-fun m!524491 () Bool)

(assert (=> start!49788 m!524491))

(declare-fun m!524493 () Bool)

(assert (=> start!49788 m!524493))

(declare-fun m!524495 () Bool)

(assert (=> b!546942 m!524495))

(declare-fun m!524497 () Bool)

(assert (=> b!546946 m!524497))

(declare-fun m!524499 () Bool)

(assert (=> b!546945 m!524499))

(assert (=> b!546945 m!524499))

(declare-fun m!524501 () Bool)

(assert (=> b!546945 m!524501))

(push 1)

(assert (not b!546942))

(assert (not b!546943))

(assert (not b!546946))

(assert (not start!49788))

(assert (not b!546945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

