; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49716 () Bool)

(assert start!49716)

(declare-fun b!546372 () Bool)

(declare-fun e!315764 () Bool)

(assert (=> b!546372 (= e!315764 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5004 0))(
  ( (MissingZero!5004 (index!22243 (_ BitVec 32))) (Found!5004 (index!22244 (_ BitVec 32))) (Intermediate!5004 (undefined!5816 Bool) (index!22245 (_ BitVec 32)) (x!51203 (_ BitVec 32))) (Undefined!5004) (MissingVacant!5004 (index!22246 (_ BitVec 32))) )
))
(declare-fun lt!249112 () SeekEntryResult!5004)

(declare-datatypes ((array!34463 0))(
  ( (array!34464 (arr!16558 (Array (_ BitVec 32) (_ BitVec 64))) (size!16923 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34463)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34463 (_ BitVec 32)) SeekEntryResult!5004)

(assert (=> b!546372 (= lt!249112 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546373 () Bool)

(declare-fun res!340231 () Bool)

(assert (=> b!546373 (=> (not res!340231) (not e!315764))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546373 (= res!340231 (and (= (size!16923 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16923 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16923 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!340229 () Bool)

(assert (=> start!49716 (=> (not res!340229) (not e!315764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49716 (= res!340229 (validMask!0 mask!3119))))

(assert (=> start!49716 e!315764))

(assert (=> start!49716 true))

(declare-fun array_inv!12441 (array!34463) Bool)

(assert (=> start!49716 (array_inv!12441 a!3118)))

(declare-fun b!546374 () Bool)

(declare-fun res!340228 () Bool)

(assert (=> b!546374 (=> (not res!340228) (not e!315764))))

(declare-fun arrayContainsKey!0 (array!34463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546374 (= res!340228 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546375 () Bool)

(declare-fun res!340232 () Bool)

(assert (=> b!546375 (=> (not res!340232) (not e!315764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546375 (= res!340232 (validKeyInArray!0 k!1914))))

(declare-fun b!546376 () Bool)

(declare-fun res!340230 () Bool)

(assert (=> b!546376 (=> (not res!340230) (not e!315764))))

(assert (=> b!546376 (= res!340230 (validKeyInArray!0 (select (arr!16558 a!3118) j!142)))))

(assert (= (and start!49716 res!340229) b!546373))

(assert (= (and b!546373 res!340231) b!546376))

(assert (= (and b!546376 res!340230) b!546375))

(assert (= (and b!546375 res!340232) b!546374))

(assert (= (and b!546374 res!340228) b!546372))

(declare-fun m!523301 () Bool)

(assert (=> b!546376 m!523301))

(assert (=> b!546376 m!523301))

(declare-fun m!523303 () Bool)

(assert (=> b!546376 m!523303))

(declare-fun m!523305 () Bool)

(assert (=> b!546374 m!523305))

(declare-fun m!523307 () Bool)

(assert (=> b!546375 m!523307))

(declare-fun m!523309 () Bool)

(assert (=> start!49716 m!523309))

(declare-fun m!523311 () Bool)

(assert (=> start!49716 m!523311))

(declare-fun m!523313 () Bool)

(assert (=> b!546372 m!523313))

(push 1)

(assert (not b!546374))

(assert (not b!546372))

(assert (not b!546376))

(assert (not b!546375))

(assert (not start!49716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

