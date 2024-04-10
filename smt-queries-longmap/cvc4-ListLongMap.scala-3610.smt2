; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49734 () Bool)

(assert start!49734)

(declare-fun b!546696 () Bool)

(declare-fun e!315956 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!546696 (= e!315956 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!546697 () Bool)

(declare-fun res!340410 () Bool)

(assert (=> b!546697 (=> (not res!340410) (not e!315956))))

(declare-datatypes ((array!34472 0))(
  ( (array!34473 (arr!16562 (Array (_ BitVec 32) (_ BitVec 64))) (size!16926 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34472)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546697 (= res!340410 (validKeyInArray!0 (select (arr!16562 a!3118) j!142)))))

(declare-fun b!546698 () Bool)

(declare-fun res!340411 () Bool)

(assert (=> b!546698 (=> (not res!340411) (not e!315956))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546698 (= res!340411 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546699 () Bool)

(declare-fun res!340415 () Bool)

(assert (=> b!546699 (=> (not res!340415) (not e!315956))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546699 (= res!340415 (and (= (size!16926 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16926 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16926 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546700 () Bool)

(declare-fun res!340414 () Bool)

(assert (=> b!546700 (=> (not res!340414) (not e!315956))))

(declare-datatypes ((SeekEntryResult!5011 0))(
  ( (MissingZero!5011 (index!22271 (_ BitVec 32))) (Found!5011 (index!22272 (_ BitVec 32))) (Intermediate!5011 (undefined!5823 Bool) (index!22273 (_ BitVec 32)) (x!51223 (_ BitVec 32))) (Undefined!5011) (MissingVacant!5011 (index!22274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34472 (_ BitVec 32)) SeekEntryResult!5011)

(assert (=> b!546700 (= res!340414 (not (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) (MissingZero!5011 i!1132))))))

(declare-fun res!340413 () Bool)

(assert (=> start!49734 (=> (not res!340413) (not e!315956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49734 (= res!340413 (validMask!0 mask!3119))))

(assert (=> start!49734 e!315956))

(assert (=> start!49734 true))

(declare-fun array_inv!12358 (array!34472) Bool)

(assert (=> start!49734 (array_inv!12358 a!3118)))

(declare-fun b!546701 () Bool)

(declare-fun res!340412 () Bool)

(assert (=> b!546701 (=> (not res!340412) (not e!315956))))

(assert (=> b!546701 (= res!340412 (validKeyInArray!0 k!1914))))

(assert (= (and start!49734 res!340413) b!546699))

(assert (= (and b!546699 res!340415) b!546697))

(assert (= (and b!546697 res!340410) b!546701))

(assert (= (and b!546701 res!340412) b!546698))

(assert (= (and b!546698 res!340411) b!546700))

(assert (= (and b!546700 res!340414) b!546696))

(declare-fun m!524095 () Bool)

(assert (=> start!49734 m!524095))

(declare-fun m!524097 () Bool)

(assert (=> start!49734 m!524097))

(declare-fun m!524099 () Bool)

(assert (=> b!546698 m!524099))

(declare-fun m!524101 () Bool)

(assert (=> b!546697 m!524101))

(assert (=> b!546697 m!524101))

(declare-fun m!524103 () Bool)

(assert (=> b!546697 m!524103))

(declare-fun m!524105 () Bool)

(assert (=> b!546700 m!524105))

(declare-fun m!524107 () Bool)

(assert (=> b!546701 m!524107))

(push 1)

(assert (not b!546697))

(assert (not b!546700))

(assert (not b!546701))

(assert (not start!49734))

(assert (not b!546698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

