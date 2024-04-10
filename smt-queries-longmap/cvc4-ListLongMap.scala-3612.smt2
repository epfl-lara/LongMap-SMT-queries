; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49746 () Bool)

(assert start!49746)

(declare-fun b!546787 () Bool)

(declare-fun res!340502 () Bool)

(declare-fun e!315993 () Bool)

(assert (=> b!546787 (=> (not res!340502) (not e!315993))))

(declare-datatypes ((array!34484 0))(
  ( (array!34485 (arr!16568 (Array (_ BitVec 32) (_ BitVec 64))) (size!16932 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34484)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546787 (= res!340502 (validKeyInArray!0 (select (arr!16568 a!3118) j!142)))))

(declare-fun b!546788 () Bool)

(declare-fun res!340504 () Bool)

(assert (=> b!546788 (=> (not res!340504) (not e!315993))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546788 (= res!340504 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546789 () Bool)

(declare-fun res!340501 () Bool)

(assert (=> b!546789 (=> (not res!340501) (not e!315993))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546789 (= res!340501 (and (= (size!16932 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16932 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16932 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546790 () Bool)

(assert (=> b!546790 (= e!315993 false)))

(declare-datatypes ((SeekEntryResult!5017 0))(
  ( (MissingZero!5017 (index!22295 (_ BitVec 32))) (Found!5017 (index!22296 (_ BitVec 32))) (Intermediate!5017 (undefined!5829 Bool) (index!22297 (_ BitVec 32)) (x!51245 (_ BitVec 32))) (Undefined!5017) (MissingVacant!5017 (index!22298 (_ BitVec 32))) )
))
(declare-fun lt!249364 () SeekEntryResult!5017)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34484 (_ BitVec 32)) SeekEntryResult!5017)

(assert (=> b!546790 (= lt!249364 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546791 () Bool)

(declare-fun res!340505 () Bool)

(assert (=> b!546791 (=> (not res!340505) (not e!315993))))

(assert (=> b!546791 (= res!340505 (validKeyInArray!0 k!1914))))

(declare-fun res!340503 () Bool)

(assert (=> start!49746 (=> (not res!340503) (not e!315993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49746 (= res!340503 (validMask!0 mask!3119))))

(assert (=> start!49746 e!315993))

(assert (=> start!49746 true))

(declare-fun array_inv!12364 (array!34484) Bool)

(assert (=> start!49746 (array_inv!12364 a!3118)))

(assert (= (and start!49746 res!340503) b!546789))

(assert (= (and b!546789 res!340501) b!546787))

(assert (= (and b!546787 res!340502) b!546791))

(assert (= (and b!546791 res!340505) b!546788))

(assert (= (and b!546788 res!340504) b!546790))

(declare-fun m!524179 () Bool)

(assert (=> b!546790 m!524179))

(declare-fun m!524181 () Bool)

(assert (=> start!49746 m!524181))

(declare-fun m!524183 () Bool)

(assert (=> start!49746 m!524183))

(declare-fun m!524185 () Bool)

(assert (=> b!546788 m!524185))

(declare-fun m!524187 () Bool)

(assert (=> b!546787 m!524187))

(assert (=> b!546787 m!524187))

(declare-fun m!524189 () Bool)

(assert (=> b!546787 m!524189))

(declare-fun m!524191 () Bool)

(assert (=> b!546791 m!524191))

(push 1)

(assert (not b!546791))

(assert (not b!546788))

(assert (not start!49746))

(assert (not b!546787))

(assert (not b!546790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

