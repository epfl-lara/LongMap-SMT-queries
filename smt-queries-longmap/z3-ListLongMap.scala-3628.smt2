; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50042 () Bool)

(assert start!50042)

(declare-fun res!341663 () Bool)

(declare-fun e!316698 () Bool)

(assert (=> start!50042 (=> (not res!341663) (not e!316698))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50042 (= res!341663 (validMask!0 mask!3119))))

(assert (=> start!50042 e!316698))

(assert (=> start!50042 true))

(declare-datatypes ((array!34588 0))(
  ( (array!34589 (arr!16613 (Array (_ BitVec 32) (_ BitVec 64))) (size!16978 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34588)

(declare-fun array_inv!12496 (array!34588) Bool)

(assert (=> start!50042 (array_inv!12496 a!3118)))

(declare-fun b!548199 () Bool)

(declare-fun res!341667 () Bool)

(declare-fun e!316696 () Bool)

(assert (=> b!548199 (=> (not res!341667) (not e!316696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34588 (_ BitVec 32)) Bool)

(assert (=> b!548199 (= res!341667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548200 () Bool)

(declare-fun res!341664 () Bool)

(assert (=> b!548200 (=> (not res!341664) (not e!316698))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548200 (= res!341664 (validKeyInArray!0 k0!1914))))

(declare-fun b!548201 () Bool)

(declare-fun res!341666 () Bool)

(assert (=> b!548201 (=> (not res!341666) (not e!316698))))

(declare-fun arrayContainsKey!0 (array!34588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548201 (= res!341666 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548202 () Bool)

(declare-fun res!341662 () Bool)

(assert (=> b!548202 (=> (not res!341662) (not e!316696))))

(declare-datatypes ((List!10732 0))(
  ( (Nil!10729) (Cons!10728 (h!11698 (_ BitVec 64)) (t!16951 List!10732)) )
))
(declare-fun arrayNoDuplicates!0 (array!34588 (_ BitVec 32) List!10732) Bool)

(assert (=> b!548202 (= res!341662 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10729))))

(declare-fun b!548203 () Bool)

(assert (=> b!548203 (= e!316698 e!316696)))

(declare-fun res!341668 () Bool)

(assert (=> b!548203 (=> (not res!341668) (not e!316696))))

(declare-datatypes ((SeekEntryResult!5059 0))(
  ( (MissingZero!5059 (index!22463 (_ BitVec 32))) (Found!5059 (index!22464 (_ BitVec 32))) (Intermediate!5059 (undefined!5871 Bool) (index!22465 (_ BitVec 32)) (x!51413 (_ BitVec 32))) (Undefined!5059) (MissingVacant!5059 (index!22466 (_ BitVec 32))) )
))
(declare-fun lt!249615 () SeekEntryResult!5059)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548203 (= res!341668 (or (= lt!249615 (MissingZero!5059 i!1132)) (= lt!249615 (MissingVacant!5059 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34588 (_ BitVec 32)) SeekEntryResult!5059)

(assert (=> b!548203 (= lt!249615 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548204 () Bool)

(declare-fun res!341669 () Bool)

(assert (=> b!548204 (=> (not res!341669) (not e!316698))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548204 (= res!341669 (validKeyInArray!0 (select (arr!16613 a!3118) j!142)))))

(declare-fun b!548205 () Bool)

(assert (=> b!548205 (= e!316696 false)))

(declare-fun lt!249616 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548205 (= lt!249616 (toIndex!0 (select (arr!16613 a!3118) j!142) mask!3119))))

(declare-fun b!548206 () Bool)

(declare-fun res!341665 () Bool)

(assert (=> b!548206 (=> (not res!341665) (not e!316698))))

(assert (=> b!548206 (= res!341665 (and (= (size!16978 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16978 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16978 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50042 res!341663) b!548206))

(assert (= (and b!548206 res!341665) b!548204))

(assert (= (and b!548204 res!341669) b!548200))

(assert (= (and b!548200 res!341664) b!548201))

(assert (= (and b!548201 res!341666) b!548203))

(assert (= (and b!548203 res!341668) b!548199))

(assert (= (and b!548199 res!341667) b!548202))

(assert (= (and b!548202 res!341662) b!548205))

(declare-fun m!524711 () Bool)

(assert (=> b!548204 m!524711))

(assert (=> b!548204 m!524711))

(declare-fun m!524713 () Bool)

(assert (=> b!548204 m!524713))

(declare-fun m!524715 () Bool)

(assert (=> b!548199 m!524715))

(declare-fun m!524717 () Bool)

(assert (=> b!548200 m!524717))

(assert (=> b!548205 m!524711))

(assert (=> b!548205 m!524711))

(declare-fun m!524719 () Bool)

(assert (=> b!548205 m!524719))

(declare-fun m!524721 () Bool)

(assert (=> start!50042 m!524721))

(declare-fun m!524723 () Bool)

(assert (=> start!50042 m!524723))

(declare-fun m!524725 () Bool)

(assert (=> b!548202 m!524725))

(declare-fun m!524727 () Bool)

(assert (=> b!548203 m!524727))

(declare-fun m!524729 () Bool)

(assert (=> b!548201 m!524729))

(check-sat (not b!548205) (not start!50042) (not b!548202) (not b!548199) (not b!548200) (not b!548201) (not b!548203) (not b!548204))
(check-sat)
