; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49728 () Bool)

(assert start!49728)

(declare-fun b!546643 () Bool)

(declare-fun res!340358 () Bool)

(declare-fun e!315938 () Bool)

(assert (=> b!546643 (=> (not res!340358) (not e!315938))))

(declare-datatypes ((array!34466 0))(
  ( (array!34467 (arr!16559 (Array (_ BitVec 32) (_ BitVec 64))) (size!16923 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34466)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546643 (= res!340358 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546644 () Bool)

(declare-fun res!340359 () Bool)

(assert (=> b!546644 (=> (not res!340359) (not e!315938))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546644 (= res!340359 (validKeyInArray!0 (select (arr!16559 a!3118) j!142)))))

(declare-fun b!546645 () Bool)

(declare-fun res!340357 () Bool)

(assert (=> b!546645 (=> (not res!340357) (not e!315938))))

(assert (=> b!546645 (= res!340357 (validKeyInArray!0 k!1914))))

(declare-fun b!546646 () Bool)

(assert (=> b!546646 (= e!315938 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5008 0))(
  ( (MissingZero!5008 (index!22259 (_ BitVec 32))) (Found!5008 (index!22260 (_ BitVec 32))) (Intermediate!5008 (undefined!5820 Bool) (index!22261 (_ BitVec 32)) (x!51212 (_ BitVec 32))) (Undefined!5008) (MissingVacant!5008 (index!22262 (_ BitVec 32))) )
))
(declare-fun lt!249346 () SeekEntryResult!5008)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34466 (_ BitVec 32)) SeekEntryResult!5008)

(assert (=> b!546646 (= lt!249346 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!340361 () Bool)

(assert (=> start!49728 (=> (not res!340361) (not e!315938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49728 (= res!340361 (validMask!0 mask!3119))))

(assert (=> start!49728 e!315938))

(assert (=> start!49728 true))

(declare-fun array_inv!12355 (array!34466) Bool)

(assert (=> start!49728 (array_inv!12355 a!3118)))

(declare-fun b!546647 () Bool)

(declare-fun res!340360 () Bool)

(assert (=> b!546647 (=> (not res!340360) (not e!315938))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546647 (= res!340360 (and (= (size!16923 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16923 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16923 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49728 res!340361) b!546647))

(assert (= (and b!546647 res!340360) b!546644))

(assert (= (and b!546644 res!340359) b!546645))

(assert (= (and b!546645 res!340357) b!546643))

(assert (= (and b!546643 res!340358) b!546646))

(declare-fun m!524053 () Bool)

(assert (=> b!546646 m!524053))

(declare-fun m!524055 () Bool)

(assert (=> b!546643 m!524055))

(declare-fun m!524057 () Bool)

(assert (=> b!546644 m!524057))

(assert (=> b!546644 m!524057))

(declare-fun m!524059 () Bool)

(assert (=> b!546644 m!524059))

(declare-fun m!524061 () Bool)

(assert (=> start!49728 m!524061))

(declare-fun m!524063 () Bool)

(assert (=> start!49728 m!524063))

(declare-fun m!524065 () Bool)

(assert (=> b!546645 m!524065))

(push 1)

(assert (not start!49728))

(assert (not b!546645))

(assert (not b!546646))

(assert (not b!546644))

(assert (not b!546643))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

