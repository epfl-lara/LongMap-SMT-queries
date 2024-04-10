; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49736 () Bool)

(assert start!49736)

(declare-fun b!546712 () Bool)

(declare-fun res!340430 () Bool)

(declare-fun e!315963 () Bool)

(assert (=> b!546712 (=> (not res!340430) (not e!315963))))

(declare-datatypes ((array!34474 0))(
  ( (array!34475 (arr!16563 (Array (_ BitVec 32) (_ BitVec 64))) (size!16927 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34474)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546712 (= res!340430 (validKeyInArray!0 (select (arr!16563 a!3118) j!142)))))

(declare-fun b!546713 () Bool)

(declare-fun res!340427 () Bool)

(assert (=> b!546713 (=> (not res!340427) (not e!315963))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!546713 (= res!340427 (validKeyInArray!0 k!1914))))

(declare-fun res!340429 () Bool)

(assert (=> start!49736 (=> (not res!340429) (not e!315963))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49736 (= res!340429 (validMask!0 mask!3119))))

(assert (=> start!49736 e!315963))

(assert (=> start!49736 true))

(declare-fun array_inv!12359 (array!34474) Bool)

(assert (=> start!49736 (array_inv!12359 a!3118)))

(declare-fun b!546714 () Bool)

(assert (=> b!546714 (= e!315963 false)))

(declare-datatypes ((SeekEntryResult!5012 0))(
  ( (MissingZero!5012 (index!22275 (_ BitVec 32))) (Found!5012 (index!22276 (_ BitVec 32))) (Intermediate!5012 (undefined!5824 Bool) (index!22277 (_ BitVec 32)) (x!51232 (_ BitVec 32))) (Undefined!5012) (MissingVacant!5012 (index!22278 (_ BitVec 32))) )
))
(declare-fun lt!249349 () SeekEntryResult!5012)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34474 (_ BitVec 32)) SeekEntryResult!5012)

(assert (=> b!546714 (= lt!249349 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546715 () Bool)

(declare-fun res!340426 () Bool)

(assert (=> b!546715 (=> (not res!340426) (not e!315963))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546715 (= res!340426 (and (= (size!16927 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16927 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16927 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546716 () Bool)

(declare-fun res!340428 () Bool)

(assert (=> b!546716 (=> (not res!340428) (not e!315963))))

(declare-fun arrayContainsKey!0 (array!34474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546716 (= res!340428 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49736 res!340429) b!546715))

(assert (= (and b!546715 res!340426) b!546712))

(assert (= (and b!546712 res!340430) b!546713))

(assert (= (and b!546713 res!340427) b!546716))

(assert (= (and b!546716 res!340428) b!546714))

(declare-fun m!524109 () Bool)

(assert (=> b!546713 m!524109))

(declare-fun m!524111 () Bool)

(assert (=> start!49736 m!524111))

(declare-fun m!524113 () Bool)

(assert (=> start!49736 m!524113))

(declare-fun m!524115 () Bool)

(assert (=> b!546716 m!524115))

(declare-fun m!524117 () Bool)

(assert (=> b!546712 m!524117))

(assert (=> b!546712 m!524117))

(declare-fun m!524119 () Bool)

(assert (=> b!546712 m!524119))

(declare-fun m!524121 () Bool)

(assert (=> b!546714 m!524121))

(push 1)

(assert (not b!546714))

(assert (not start!49736))

(assert (not b!546712))

(assert (not b!546716))

(assert (not b!546713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

