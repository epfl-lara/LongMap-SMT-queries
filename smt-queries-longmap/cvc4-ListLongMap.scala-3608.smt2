; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49722 () Bool)

(assert start!49722)

(declare-fun b!546598 () Bool)

(declare-fun res!340315 () Bool)

(declare-fun e!315921 () Bool)

(assert (=> b!546598 (=> (not res!340315) (not e!315921))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34460 0))(
  ( (array!34461 (arr!16556 (Array (_ BitVec 32) (_ BitVec 64))) (size!16920 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34460)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!546598 (= res!340315 (and (= (size!16920 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16920 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16920 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546599 () Bool)

(declare-fun res!340314 () Bool)

(assert (=> b!546599 (=> (not res!340314) (not e!315921))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546599 (= res!340314 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546600 () Bool)

(assert (=> b!546600 (= e!315921 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun res!340316 () Bool)

(assert (=> start!49722 (=> (not res!340316) (not e!315921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49722 (= res!340316 (validMask!0 mask!3119))))

(assert (=> start!49722 e!315921))

(assert (=> start!49722 true))

(declare-fun array_inv!12352 (array!34460) Bool)

(assert (=> start!49722 (array_inv!12352 a!3118)))

(declare-fun b!546601 () Bool)

(declare-fun res!340312 () Bool)

(assert (=> b!546601 (=> (not res!340312) (not e!315921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546601 (= res!340312 (validKeyInArray!0 (select (arr!16556 a!3118) j!142)))))

(declare-fun b!546602 () Bool)

(declare-fun res!340313 () Bool)

(assert (=> b!546602 (=> (not res!340313) (not e!315921))))

(assert (=> b!546602 (= res!340313 (validKeyInArray!0 k!1914))))

(assert (= (and start!49722 res!340316) b!546598))

(assert (= (and b!546598 res!340315) b!546601))

(assert (= (and b!546601 res!340312) b!546602))

(assert (= (and b!546602 res!340313) b!546599))

(assert (= (and b!546599 res!340314) b!546600))

(declare-fun m!524013 () Bool)

(assert (=> b!546599 m!524013))

(declare-fun m!524015 () Bool)

(assert (=> start!49722 m!524015))

(declare-fun m!524017 () Bool)

(assert (=> start!49722 m!524017))

(declare-fun m!524019 () Bool)

(assert (=> b!546601 m!524019))

(assert (=> b!546601 m!524019))

(declare-fun m!524021 () Bool)

(assert (=> b!546601 m!524021))

(declare-fun m!524023 () Bool)

(assert (=> b!546602 m!524023))

(push 1)

(assert (not b!546601))

(assert (not b!546602))

(assert (not start!49722))

(assert (not b!546599))

(check-sat)

(pop 1)

(push 1)

(check-sat)

