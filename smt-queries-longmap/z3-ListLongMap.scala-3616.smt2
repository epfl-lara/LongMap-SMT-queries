; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49768 () Bool)

(assert start!49768)

(declare-fun b!546953 () Bool)

(declare-fun res!340666 () Bool)

(declare-fun e!316058 () Bool)

(assert (=> b!546953 (=> (not res!340666) (not e!316058))))

(declare-datatypes ((array!34506 0))(
  ( (array!34507 (arr!16579 (Array (_ BitVec 32) (_ BitVec 64))) (size!16943 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34506)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546953 (= res!340666 (validKeyInArray!0 (select (arr!16579 a!3118) j!142)))))

(declare-fun b!546954 () Bool)

(declare-fun res!340669 () Bool)

(assert (=> b!546954 (=> (not res!340669) (not e!316058))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546954 (= res!340669 (and (= (size!16943 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16943 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16943 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546955 () Bool)

(declare-fun res!340667 () Bool)

(assert (=> b!546955 (=> (not res!340667) (not e!316058))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546955 (= res!340667 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546956 () Bool)

(declare-fun res!340668 () Bool)

(assert (=> b!546956 (=> (not res!340668) (not e!316058))))

(assert (=> b!546956 (= res!340668 (validKeyInArray!0 k0!1914))))

(declare-datatypes ((SeekEntryResult!5028 0))(
  ( (MissingZero!5028 (index!22339 (_ BitVec 32))) (Found!5028 (index!22340 (_ BitVec 32))) (Intermediate!5028 (undefined!5840 Bool) (index!22341 (_ BitVec 32)) (x!51288 (_ BitVec 32))) (Undefined!5028) (MissingVacant!5028 (index!22342 (_ BitVec 32))) )
))
(declare-fun lt!249397 () SeekEntryResult!5028)

(declare-fun b!546952 () Bool)

(assert (=> b!546952 (= e!316058 (and (or (= lt!249397 (MissingZero!5028 i!1132)) (= lt!249397 (MissingVacant!5028 i!1132))) (bvsgt #b00000000000000000000000000000000 (size!16943 a!3118))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34506 (_ BitVec 32)) SeekEntryResult!5028)

(assert (=> b!546952 (= lt!249397 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!340670 () Bool)

(assert (=> start!49768 (=> (not res!340670) (not e!316058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49768 (= res!340670 (validMask!0 mask!3119))))

(assert (=> start!49768 e!316058))

(assert (=> start!49768 true))

(declare-fun array_inv!12375 (array!34506) Bool)

(assert (=> start!49768 (array_inv!12375 a!3118)))

(assert (= (and start!49768 res!340670) b!546954))

(assert (= (and b!546954 res!340669) b!546953))

(assert (= (and b!546953 res!340666) b!546956))

(assert (= (and b!546956 res!340668) b!546955))

(assert (= (and b!546955 res!340667) b!546952))

(declare-fun m!524333 () Bool)

(assert (=> b!546956 m!524333))

(declare-fun m!524335 () Bool)

(assert (=> b!546952 m!524335))

(declare-fun m!524337 () Bool)

(assert (=> b!546955 m!524337))

(declare-fun m!524339 () Bool)

(assert (=> start!49768 m!524339))

(declare-fun m!524341 () Bool)

(assert (=> start!49768 m!524341))

(declare-fun m!524343 () Bool)

(assert (=> b!546953 m!524343))

(assert (=> b!546953 m!524343))

(declare-fun m!524345 () Bool)

(assert (=> b!546953 m!524345))

(check-sat (not b!546956) (not b!546953) (not start!49768) (not b!546955) (not b!546952))
(check-sat)
