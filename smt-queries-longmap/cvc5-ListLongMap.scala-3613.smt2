; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49800 () Bool)

(assert start!49800)

(declare-fun res!340641 () Bool)

(declare-fun e!316139 () Bool)

(assert (=> start!49800 (=> (not res!340641) (not e!316139))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49800 (= res!340641 (validMask!0 mask!3119))))

(assert (=> start!49800 e!316139))

(assert (=> start!49800 true))

(declare-datatypes ((array!34484 0))(
  ( (array!34485 (arr!16566 (Array (_ BitVec 32) (_ BitVec 64))) (size!16930 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34484)

(declare-fun array_inv!12425 (array!34484) Bool)

(assert (=> start!49800 (array_inv!12425 a!3118)))

(declare-fun b!547032 () Bool)

(declare-fun res!340643 () Bool)

(assert (=> b!547032 (=> (not res!340643) (not e!316139))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547032 (= res!340643 (validKeyInArray!0 (select (arr!16566 a!3118) j!142)))))

(declare-fun b!547033 () Bool)

(declare-fun res!340642 () Bool)

(assert (=> b!547033 (=> (not res!340642) (not e!316139))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547033 (= res!340642 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547034 () Bool)

(declare-fun res!340644 () Bool)

(assert (=> b!547034 (=> (not res!340644) (not e!316139))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547034 (= res!340644 (and (= (size!16930 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16930 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16930 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547035 () Bool)

(assert (=> b!547035 (= e!316139 false)))

(declare-datatypes ((SeekEntryResult!4971 0))(
  ( (MissingZero!4971 (index!22111 (_ BitVec 32))) (Found!4971 (index!22112 (_ BitVec 32))) (Intermediate!4971 (undefined!5783 Bool) (index!22113 (_ BitVec 32)) (x!51210 (_ BitVec 32))) (Undefined!4971) (MissingVacant!4971 (index!22114 (_ BitVec 32))) )
))
(declare-fun lt!249484 () SeekEntryResult!4971)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34484 (_ BitVec 32)) SeekEntryResult!4971)

(assert (=> b!547035 (= lt!249484 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!547036 () Bool)

(declare-fun res!340645 () Bool)

(assert (=> b!547036 (=> (not res!340645) (not e!316139))))

(assert (=> b!547036 (= res!340645 (validKeyInArray!0 k!1914))))

(assert (= (and start!49800 res!340641) b!547034))

(assert (= (and b!547034 res!340644) b!547032))

(assert (= (and b!547032 res!340643) b!547036))

(assert (= (and b!547036 res!340645) b!547033))

(assert (= (and b!547033 res!340642) b!547035))

(declare-fun m!524573 () Bool)

(assert (=> start!49800 m!524573))

(declare-fun m!524575 () Bool)

(assert (=> start!49800 m!524575))

(declare-fun m!524577 () Bool)

(assert (=> b!547036 m!524577))

(declare-fun m!524579 () Bool)

(assert (=> b!547032 m!524579))

(assert (=> b!547032 m!524579))

(declare-fun m!524581 () Bool)

(assert (=> b!547032 m!524581))

(declare-fun m!524583 () Bool)

(assert (=> b!547033 m!524583))

(declare-fun m!524585 () Bool)

(assert (=> b!547035 m!524585))

(push 1)

(assert (not b!547032))

(assert (not b!547036))

(assert (not b!547033))

(assert (not b!547035))

(assert (not start!49800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

