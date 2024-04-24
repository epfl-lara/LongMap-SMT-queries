; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49812 () Bool)

(assert start!49812)

(declare-fun b!547122 () Bool)

(declare-fun res!340731 () Bool)

(declare-fun e!316176 () Bool)

(assert (=> b!547122 (=> (not res!340731) (not e!316176))))

(declare-datatypes ((array!34496 0))(
  ( (array!34497 (arr!16572 (Array (_ BitVec 32) (_ BitVec 64))) (size!16936 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34496)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547122 (= res!340731 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547123 () Bool)

(declare-fun res!340734 () Bool)

(assert (=> b!547123 (=> (not res!340734) (not e!316176))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547123 (= res!340734 (validKeyInArray!0 (select (arr!16572 a!3118) j!142)))))

(declare-fun res!340732 () Bool)

(assert (=> start!49812 (=> (not res!340732) (not e!316176))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49812 (= res!340732 (validMask!0 mask!3119))))

(assert (=> start!49812 e!316176))

(assert (=> start!49812 true))

(declare-fun array_inv!12431 (array!34496) Bool)

(assert (=> start!49812 (array_inv!12431 a!3118)))

(declare-fun b!547124 () Bool)

(declare-fun res!340735 () Bool)

(assert (=> b!547124 (=> (not res!340735) (not e!316176))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547124 (= res!340735 (and (= (size!16936 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16936 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16936 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547125 () Bool)

(declare-fun res!340733 () Bool)

(assert (=> b!547125 (=> (not res!340733) (not e!316176))))

(assert (=> b!547125 (= res!340733 (validKeyInArray!0 k!1914))))

(declare-fun b!547126 () Bool)

(assert (=> b!547126 (= e!316176 false)))

(declare-datatypes ((SeekEntryResult!4977 0))(
  ( (MissingZero!4977 (index!22135 (_ BitVec 32))) (Found!4977 (index!22136 (_ BitVec 32))) (Intermediate!4977 (undefined!5789 Bool) (index!22137 (_ BitVec 32)) (x!51232 (_ BitVec 32))) (Undefined!4977) (MissingVacant!4977 (index!22138 (_ BitVec 32))) )
))
(declare-fun lt!249502 () SeekEntryResult!4977)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34496 (_ BitVec 32)) SeekEntryResult!4977)

(assert (=> b!547126 (= lt!249502 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!49812 res!340732) b!547124))

(assert (= (and b!547124 res!340735) b!547123))

(assert (= (and b!547123 res!340734) b!547125))

(assert (= (and b!547125 res!340733) b!547122))

(assert (= (and b!547122 res!340731) b!547126))

(declare-fun m!524657 () Bool)

(assert (=> start!49812 m!524657))

(declare-fun m!524659 () Bool)

(assert (=> start!49812 m!524659))

(declare-fun m!524661 () Bool)

(assert (=> b!547125 m!524661))

(declare-fun m!524663 () Bool)

(assert (=> b!547123 m!524663))

(assert (=> b!547123 m!524663))

(declare-fun m!524665 () Bool)

(assert (=> b!547123 m!524665))

(declare-fun m!524667 () Bool)

(assert (=> b!547122 m!524667))

(declare-fun m!524669 () Bool)

(assert (=> b!547126 m!524669))

(push 1)

(assert (not b!547125))

(assert (not b!547126))

(assert (not b!547122))

(assert (not b!547123))

(assert (not start!49812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

