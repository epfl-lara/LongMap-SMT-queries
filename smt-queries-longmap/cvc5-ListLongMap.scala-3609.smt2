; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49724 () Bool)

(assert start!49724)

(declare-fun b!546613 () Bool)

(declare-fun res!340327 () Bool)

(declare-fun e!315926 () Bool)

(assert (=> b!546613 (=> (not res!340327) (not e!315926))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546613 (= res!340327 (validKeyInArray!0 k!1914))))

(declare-fun b!546614 () Bool)

(assert (=> b!546614 (= e!315926 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5006 0))(
  ( (MissingZero!5006 (index!22251 (_ BitVec 32))) (Found!5006 (index!22252 (_ BitVec 32))) (Intermediate!5006 (undefined!5818 Bool) (index!22253 (_ BitVec 32)) (x!51210 (_ BitVec 32))) (Undefined!5006) (MissingVacant!5006 (index!22254 (_ BitVec 32))) )
))
(declare-fun lt!249340 () SeekEntryResult!5006)

(declare-datatypes ((array!34462 0))(
  ( (array!34463 (arr!16557 (Array (_ BitVec 32) (_ BitVec 64))) (size!16921 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34462)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34462 (_ BitVec 32)) SeekEntryResult!5006)

(assert (=> b!546614 (= lt!249340 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546615 () Bool)

(declare-fun res!340328 () Bool)

(assert (=> b!546615 (=> (not res!340328) (not e!315926))))

(declare-fun arrayContainsKey!0 (array!34462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546615 (= res!340328 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340331 () Bool)

(assert (=> start!49724 (=> (not res!340331) (not e!315926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49724 (= res!340331 (validMask!0 mask!3119))))

(assert (=> start!49724 e!315926))

(assert (=> start!49724 true))

(declare-fun array_inv!12353 (array!34462) Bool)

(assert (=> start!49724 (array_inv!12353 a!3118)))

(declare-fun b!546616 () Bool)

(declare-fun res!340329 () Bool)

(assert (=> b!546616 (=> (not res!340329) (not e!315926))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546616 (= res!340329 (and (= (size!16921 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16921 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16921 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546617 () Bool)

(declare-fun res!340330 () Bool)

(assert (=> b!546617 (=> (not res!340330) (not e!315926))))

(assert (=> b!546617 (= res!340330 (validKeyInArray!0 (select (arr!16557 a!3118) j!142)))))

(assert (= (and start!49724 res!340331) b!546616))

(assert (= (and b!546616 res!340329) b!546617))

(assert (= (and b!546617 res!340330) b!546613))

(assert (= (and b!546613 res!340327) b!546615))

(assert (= (and b!546615 res!340328) b!546614))

(declare-fun m!524025 () Bool)

(assert (=> b!546615 m!524025))

(declare-fun m!524027 () Bool)

(assert (=> start!49724 m!524027))

(declare-fun m!524029 () Bool)

(assert (=> start!49724 m!524029))

(declare-fun m!524031 () Bool)

(assert (=> b!546613 m!524031))

(declare-fun m!524033 () Bool)

(assert (=> b!546617 m!524033))

(assert (=> b!546617 m!524033))

(declare-fun m!524035 () Bool)

(assert (=> b!546617 m!524035))

(declare-fun m!524037 () Bool)

(assert (=> b!546614 m!524037))

(push 1)

(assert (not b!546613))

(assert (not b!546614))

(assert (not start!49724))

(assert (not b!546615))

(assert (not b!546617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

