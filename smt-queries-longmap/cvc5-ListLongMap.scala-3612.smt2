; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49742 () Bool)

(assert start!49742)

(declare-fun b!546757 () Bool)

(declare-fun res!340474 () Bool)

(declare-fun e!315981 () Bool)

(assert (=> b!546757 (=> (not res!340474) (not e!315981))))

(declare-datatypes ((array!34480 0))(
  ( (array!34481 (arr!16566 (Array (_ BitVec 32) (_ BitVec 64))) (size!16930 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34480)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546757 (= res!340474 (validKeyInArray!0 (select (arr!16566 a!3118) j!142)))))

(declare-fun b!546758 () Bool)

(declare-fun res!340472 () Bool)

(assert (=> b!546758 (=> (not res!340472) (not e!315981))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546758 (= res!340472 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546759 () Bool)

(declare-fun res!340475 () Bool)

(assert (=> b!546759 (=> (not res!340475) (not e!315981))))

(assert (=> b!546759 (= res!340475 (validKeyInArray!0 k!1914))))

(declare-fun b!546760 () Bool)

(assert (=> b!546760 (= e!315981 false)))

(declare-datatypes ((SeekEntryResult!5015 0))(
  ( (MissingZero!5015 (index!22287 (_ BitVec 32))) (Found!5015 (index!22288 (_ BitVec 32))) (Intermediate!5015 (undefined!5827 Bool) (index!22289 (_ BitVec 32)) (x!51243 (_ BitVec 32))) (Undefined!5015) (MissingVacant!5015 (index!22290 (_ BitVec 32))) )
))
(declare-fun lt!249358 () SeekEntryResult!5015)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34480 (_ BitVec 32)) SeekEntryResult!5015)

(assert (=> b!546760 (= lt!249358 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546761 () Bool)

(declare-fun res!340473 () Bool)

(assert (=> b!546761 (=> (not res!340473) (not e!315981))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546761 (= res!340473 (and (= (size!16930 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16930 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16930 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!340471 () Bool)

(assert (=> start!49742 (=> (not res!340471) (not e!315981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49742 (= res!340471 (validMask!0 mask!3119))))

(assert (=> start!49742 e!315981))

(assert (=> start!49742 true))

(declare-fun array_inv!12362 (array!34480) Bool)

(assert (=> start!49742 (array_inv!12362 a!3118)))

(assert (= (and start!49742 res!340471) b!546761))

(assert (= (and b!546761 res!340473) b!546757))

(assert (= (and b!546757 res!340474) b!546759))

(assert (= (and b!546759 res!340475) b!546758))

(assert (= (and b!546758 res!340472) b!546760))

(declare-fun m!524151 () Bool)

(assert (=> start!49742 m!524151))

(declare-fun m!524153 () Bool)

(assert (=> start!49742 m!524153))

(declare-fun m!524155 () Bool)

(assert (=> b!546759 m!524155))

(declare-fun m!524157 () Bool)

(assert (=> b!546758 m!524157))

(declare-fun m!524159 () Bool)

(assert (=> b!546757 m!524159))

(assert (=> b!546757 m!524159))

(declare-fun m!524161 () Bool)

(assert (=> b!546757 m!524161))

(declare-fun m!524163 () Bool)

(assert (=> b!546760 m!524163))

(push 1)

(assert (not b!546758))

(assert (not start!49742))

(assert (not b!546757))

(assert (not b!546759))

(assert (not b!546760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

