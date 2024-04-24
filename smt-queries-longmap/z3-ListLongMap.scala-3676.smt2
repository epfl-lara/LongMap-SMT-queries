; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50718 () Bool)

(assert start!50718)

(declare-fun b!554203 () Bool)

(declare-fun e!319627 () Bool)

(declare-fun e!319629 () Bool)

(assert (=> b!554203 (= e!319627 e!319629)))

(declare-fun res!346516 () Bool)

(assert (=> b!554203 (=> (not res!346516) (not e!319629))))

(declare-datatypes ((SeekEntryResult!5158 0))(
  ( (MissingZero!5158 (index!22859 (_ BitVec 32))) (Found!5158 (index!22860 (_ BitVec 32))) (Intermediate!5158 (undefined!5970 Bool) (index!22861 (_ BitVec 32)) (x!51931 (_ BitVec 32))) (Undefined!5158) (MissingVacant!5158 (index!22862 (_ BitVec 32))) )
))
(declare-fun lt!251763 () SeekEntryResult!5158)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554203 (= res!346516 (or (= lt!251763 (MissingZero!5158 i!1132)) (= lt!251763 (MissingVacant!5158 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34890 0))(
  ( (array!34891 (arr!16753 (Array (_ BitVec 32) (_ BitVec 64))) (size!17117 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34890)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34890 (_ BitVec 32)) SeekEntryResult!5158)

(assert (=> b!554203 (= lt!251763 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554204 () Bool)

(declare-fun res!346517 () Bool)

(assert (=> b!554204 (=> (not res!346517) (not e!319627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554204 (= res!346517 (validKeyInArray!0 k0!1914))))

(declare-fun b!554205 () Bool)

(declare-fun res!346512 () Bool)

(assert (=> b!554205 (=> (not res!346512) (not e!319627))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!554205 (= res!346512 (and (= (size!17117 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17117 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17117 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554206 () Bool)

(declare-fun res!346518 () Bool)

(assert (=> b!554206 (=> (not res!346518) (not e!319629))))

(declare-datatypes ((List!10740 0))(
  ( (Nil!10737) (Cons!10736 (h!11724 (_ BitVec 64)) (t!16960 List!10740)) )
))
(declare-fun arrayNoDuplicates!0 (array!34890 (_ BitVec 32) List!10740) Bool)

(assert (=> b!554206 (= res!346518 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10737))))

(declare-fun b!554207 () Bool)

(declare-fun res!346510 () Bool)

(assert (=> b!554207 (=> (not res!346510) (not e!319629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34890 (_ BitVec 32)) Bool)

(assert (=> b!554207 (= res!346510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!346514 () Bool)

(assert (=> start!50718 (=> (not res!346514) (not e!319627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50718 (= res!346514 (validMask!0 mask!3119))))

(assert (=> start!50718 e!319627))

(assert (=> start!50718 true))

(declare-fun array_inv!12612 (array!34890) Bool)

(assert (=> start!50718 (array_inv!12612 a!3118)))

(declare-fun b!554208 () Bool)

(declare-fun res!346511 () Bool)

(assert (=> b!554208 (=> (not res!346511) (not e!319627))))

(declare-fun arrayContainsKey!0 (array!34890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554208 (= res!346511 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554209 () Bool)

(declare-fun e!319626 () Bool)

(assert (=> b!554209 (= e!319626 (= (seekEntryOrOpen!0 (select (arr!16753 a!3118) j!142) a!3118 mask!3119) (Found!5158 j!142)))))

(declare-fun b!554210 () Bool)

(declare-fun res!346513 () Bool)

(assert (=> b!554210 (=> (not res!346513) (not e!319629))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34890 (_ BitVec 32)) SeekEntryResult!5158)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554210 (= res!346513 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16753 a!3118) j!142) mask!3119) (select (arr!16753 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16753 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16753 a!3118) i!1132 k0!1914) j!142) (array!34891 (store (arr!16753 a!3118) i!1132 k0!1914) (size!17117 a!3118)) mask!3119)))))

(declare-fun b!554211 () Bool)

(declare-fun res!346515 () Bool)

(assert (=> b!554211 (=> (not res!346515) (not e!319627))))

(assert (=> b!554211 (= res!346515 (validKeyInArray!0 (select (arr!16753 a!3118) j!142)))))

(declare-fun b!554212 () Bool)

(assert (=> b!554212 (= e!319629 (not true))))

(assert (=> b!554212 e!319626))

(declare-fun res!346519 () Bool)

(assert (=> b!554212 (=> (not res!346519) (not e!319626))))

(assert (=> b!554212 (= res!346519 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17161 0))(
  ( (Unit!17162) )
))
(declare-fun lt!251764 () Unit!17161)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17161)

(assert (=> b!554212 (= lt!251764 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50718 res!346514) b!554205))

(assert (= (and b!554205 res!346512) b!554211))

(assert (= (and b!554211 res!346515) b!554204))

(assert (= (and b!554204 res!346517) b!554208))

(assert (= (and b!554208 res!346511) b!554203))

(assert (= (and b!554203 res!346516) b!554207))

(assert (= (and b!554207 res!346510) b!554206))

(assert (= (and b!554206 res!346518) b!554210))

(assert (= (and b!554210 res!346513) b!554212))

(assert (= (and b!554212 res!346519) b!554209))

(declare-fun m!531545 () Bool)

(assert (=> b!554204 m!531545))

(declare-fun m!531547 () Bool)

(assert (=> b!554211 m!531547))

(assert (=> b!554211 m!531547))

(declare-fun m!531549 () Bool)

(assert (=> b!554211 m!531549))

(declare-fun m!531551 () Bool)

(assert (=> b!554208 m!531551))

(declare-fun m!531553 () Bool)

(assert (=> b!554212 m!531553))

(declare-fun m!531555 () Bool)

(assert (=> b!554212 m!531555))

(declare-fun m!531557 () Bool)

(assert (=> b!554203 m!531557))

(declare-fun m!531559 () Bool)

(assert (=> b!554206 m!531559))

(declare-fun m!531561 () Bool)

(assert (=> b!554207 m!531561))

(assert (=> b!554210 m!531547))

(declare-fun m!531563 () Bool)

(assert (=> b!554210 m!531563))

(assert (=> b!554210 m!531547))

(declare-fun m!531565 () Bool)

(assert (=> b!554210 m!531565))

(declare-fun m!531567 () Bool)

(assert (=> b!554210 m!531567))

(assert (=> b!554210 m!531565))

(declare-fun m!531569 () Bool)

(assert (=> b!554210 m!531569))

(assert (=> b!554210 m!531563))

(assert (=> b!554210 m!531547))

(declare-fun m!531571 () Bool)

(assert (=> b!554210 m!531571))

(declare-fun m!531573 () Bool)

(assert (=> b!554210 m!531573))

(assert (=> b!554210 m!531565))

(assert (=> b!554210 m!531567))

(assert (=> b!554209 m!531547))

(assert (=> b!554209 m!531547))

(declare-fun m!531575 () Bool)

(assert (=> b!554209 m!531575))

(declare-fun m!531577 () Bool)

(assert (=> start!50718 m!531577))

(declare-fun m!531579 () Bool)

(assert (=> start!50718 m!531579))

(check-sat (not b!554208) (not start!50718) (not b!554204) (not b!554210) (not b!554207) (not b!554206) (not b!554209) (not b!554211) (not b!554212) (not b!554203))
(check-sat)
