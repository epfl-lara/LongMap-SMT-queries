; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49748 () Bool)

(assert start!49748)

(declare-fun b!546802 () Bool)

(declare-fun res!340516 () Bool)

(declare-fun e!315999 () Bool)

(assert (=> b!546802 (=> (not res!340516) (not e!315999))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34486 0))(
  ( (array!34487 (arr!16569 (Array (_ BitVec 32) (_ BitVec 64))) (size!16933 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34486)

(assert (=> b!546802 (= res!340516 (and (= (size!16933 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16933 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16933 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546803 () Bool)

(declare-fun res!340518 () Bool)

(assert (=> b!546803 (=> (not res!340518) (not e!315999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546803 (= res!340518 (validKeyInArray!0 (select (arr!16569 a!3118) j!142)))))

(declare-fun b!546804 () Bool)

(assert (=> b!546804 (= e!315999 false)))

(declare-datatypes ((SeekEntryResult!5018 0))(
  ( (MissingZero!5018 (index!22299 (_ BitVec 32))) (Found!5018 (index!22300 (_ BitVec 32))) (Intermediate!5018 (undefined!5830 Bool) (index!22301 (_ BitVec 32)) (x!51254 (_ BitVec 32))) (Undefined!5018) (MissingVacant!5018 (index!22302 (_ BitVec 32))) )
))
(declare-fun lt!249367 () SeekEntryResult!5018)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34486 (_ BitVec 32)) SeekEntryResult!5018)

(assert (=> b!546804 (= lt!249367 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!340519 () Bool)

(assert (=> start!49748 (=> (not res!340519) (not e!315999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49748 (= res!340519 (validMask!0 mask!3119))))

(assert (=> start!49748 e!315999))

(assert (=> start!49748 true))

(declare-fun array_inv!12365 (array!34486) Bool)

(assert (=> start!49748 (array_inv!12365 a!3118)))

(declare-fun b!546805 () Bool)

(declare-fun res!340517 () Bool)

(assert (=> b!546805 (=> (not res!340517) (not e!315999))))

(declare-fun arrayContainsKey!0 (array!34486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546805 (= res!340517 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546806 () Bool)

(declare-fun res!340520 () Bool)

(assert (=> b!546806 (=> (not res!340520) (not e!315999))))

(assert (=> b!546806 (= res!340520 (validKeyInArray!0 k!1914))))

(assert (= (and start!49748 res!340519) b!546802))

(assert (= (and b!546802 res!340516) b!546803))

(assert (= (and b!546803 res!340518) b!546806))

(assert (= (and b!546806 res!340520) b!546805))

(assert (= (and b!546805 res!340517) b!546804))

(declare-fun m!524193 () Bool)

(assert (=> b!546803 m!524193))

(assert (=> b!546803 m!524193))

(declare-fun m!524195 () Bool)

(assert (=> b!546803 m!524195))

(declare-fun m!524197 () Bool)

(assert (=> b!546804 m!524197))

(declare-fun m!524199 () Bool)

(assert (=> start!49748 m!524199))

(declare-fun m!524201 () Bool)

(assert (=> start!49748 m!524201))

(declare-fun m!524203 () Bool)

(assert (=> b!546806 m!524203))

(declare-fun m!524205 () Bool)

(assert (=> b!546805 m!524205))

(push 1)

(assert (not b!546806))

(assert (not start!49748))

(assert (not b!546803))

(assert (not b!546805))

(assert (not b!546804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

