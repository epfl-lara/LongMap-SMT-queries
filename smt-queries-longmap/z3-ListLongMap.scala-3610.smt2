; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49778 () Bool)

(assert start!49778)

(declare-fun b!546860 () Bool)

(declare-fun res!340472 () Bool)

(declare-fun e!316073 () Bool)

(assert (=> b!546860 (=> (not res!340472) (not e!316073))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!34462 0))(
  ( (array!34463 (arr!16555 (Array (_ BitVec 32) (_ BitVec 64))) (size!16919 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34462)

(assert (=> b!546860 (= res!340472 (and (= (size!16919 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16919 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16919 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546861 () Bool)

(declare-fun res!340473 () Bool)

(assert (=> b!546861 (=> (not res!340473) (not e!316073))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546861 (= res!340473 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546862 () Bool)

(declare-fun res!340469 () Bool)

(assert (=> b!546862 (=> (not res!340469) (not e!316073))))

(declare-datatypes ((SeekEntryResult!4960 0))(
  ( (MissingZero!4960 (index!22067 (_ BitVec 32))) (Found!4960 (index!22068 (_ BitVec 32))) (Intermediate!4960 (undefined!5772 Bool) (index!22069 (_ BitVec 32)) (x!51175 (_ BitVec 32))) (Undefined!4960) (MissingVacant!4960 (index!22070 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34462 (_ BitVec 32)) SeekEntryResult!4960)

(assert (=> b!546862 (= res!340469 (not (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) (MissingZero!4960 i!1132))))))

(declare-fun b!546863 () Bool)

(declare-fun res!340470 () Bool)

(assert (=> b!546863 (=> (not res!340470) (not e!316073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546863 (= res!340470 (validKeyInArray!0 (select (arr!16555 a!3118) j!142)))))

(declare-fun b!546865 () Bool)

(assert (=> b!546865 (= e!316073 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!546864 () Bool)

(declare-fun res!340474 () Bool)

(assert (=> b!546864 (=> (not res!340474) (not e!316073))))

(assert (=> b!546864 (= res!340474 (validKeyInArray!0 k0!1914))))

(declare-fun res!340471 () Bool)

(assert (=> start!49778 (=> (not res!340471) (not e!316073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49778 (= res!340471 (validMask!0 mask!3119))))

(assert (=> start!49778 e!316073))

(assert (=> start!49778 true))

(declare-fun array_inv!12414 (array!34462) Bool)

(assert (=> start!49778 (array_inv!12414 a!3118)))

(assert (= (and start!49778 res!340471) b!546860))

(assert (= (and b!546860 res!340472) b!546863))

(assert (= (and b!546863 res!340470) b!546864))

(assert (= (and b!546864 res!340474) b!546861))

(assert (= (and b!546861 res!340473) b!546862))

(assert (= (and b!546862 res!340469) b!546865))

(declare-fun m!524419 () Bool)

(assert (=> b!546864 m!524419))

(declare-fun m!524421 () Bool)

(assert (=> b!546863 m!524421))

(assert (=> b!546863 m!524421))

(declare-fun m!524423 () Bool)

(assert (=> b!546863 m!524423))

(declare-fun m!524425 () Bool)

(assert (=> start!49778 m!524425))

(declare-fun m!524427 () Bool)

(assert (=> start!49778 m!524427))

(declare-fun m!524429 () Bool)

(assert (=> b!546861 m!524429))

(declare-fun m!524431 () Bool)

(assert (=> b!546862 m!524431))

(check-sat (not b!546864) (not b!546861) (not start!49778) (not b!546862) (not b!546863))
(check-sat)
