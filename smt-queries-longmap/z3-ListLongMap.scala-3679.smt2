; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50692 () Bool)

(assert start!50692)

(declare-fun b!554312 () Bool)

(declare-fun res!346729 () Bool)

(declare-fun e!319643 () Bool)

(assert (=> b!554312 (=> (not res!346729) (not e!319643))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34917 0))(
  ( (array!34918 (arr!16768 (Array (_ BitVec 32) (_ BitVec 64))) (size!17132 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34917)

(assert (=> b!554312 (= res!346729 (and (= (size!17132 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17132 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17132 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554313 () Bool)

(declare-fun res!346726 () Bool)

(declare-fun e!319642 () Bool)

(assert (=> b!554313 (=> (not res!346726) (not e!319642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34917 (_ BitVec 32)) Bool)

(assert (=> b!554313 (= res!346726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!346728 () Bool)

(assert (=> start!50692 (=> (not res!346728) (not e!319643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50692 (= res!346728 (validMask!0 mask!3119))))

(assert (=> start!50692 e!319643))

(assert (=> start!50692 true))

(declare-fun array_inv!12564 (array!34917) Bool)

(assert (=> start!50692 (array_inv!12564 a!3118)))

(declare-fun e!319640 () Bool)

(declare-fun b!554314 () Bool)

(declare-datatypes ((SeekEntryResult!5217 0))(
  ( (MissingZero!5217 (index!23095 (_ BitVec 32))) (Found!5217 (index!23096 (_ BitVec 32))) (Intermediate!5217 (undefined!6029 Bool) (index!23097 (_ BitVec 32)) (x!52011 (_ BitVec 32))) (Undefined!5217) (MissingVacant!5217 (index!23098 (_ BitVec 32))) )
))
(declare-fun lt!251754 () SeekEntryResult!5217)

(get-info :version)

(assert (=> b!554314 (= e!319640 (not (or (not ((_ is Intermediate!5217) lt!251754)) (undefined!6029 lt!251754) (= (select (arr!16768 a!3118) (index!23097 lt!251754)) (select (arr!16768 a!3118) j!142)) (not (= (select (arr!16768 a!3118) (index!23097 lt!251754)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319644 () Bool)

(assert (=> b!554314 e!319644))

(declare-fun res!346731 () Bool)

(assert (=> b!554314 (=> (not res!346731) (not e!319644))))

(assert (=> b!554314 (= res!346731 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17208 0))(
  ( (Unit!17209) )
))
(declare-fun lt!251756 () Unit!17208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17208)

(assert (=> b!554314 (= lt!251756 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554315 () Bool)

(declare-fun res!346732 () Bool)

(assert (=> b!554315 (=> (not res!346732) (not e!319643))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554315 (= res!346732 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554316 () Bool)

(assert (=> b!554316 (= e!319643 e!319642)))

(declare-fun res!346733 () Bool)

(assert (=> b!554316 (=> (not res!346733) (not e!319642))))

(declare-fun lt!251755 () SeekEntryResult!5217)

(assert (=> b!554316 (= res!346733 (or (= lt!251755 (MissingZero!5217 i!1132)) (= lt!251755 (MissingVacant!5217 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34917 (_ BitVec 32)) SeekEntryResult!5217)

(assert (=> b!554316 (= lt!251755 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554317 () Bool)

(declare-fun res!346725 () Bool)

(assert (=> b!554317 (=> (not res!346725) (not e!319643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554317 (= res!346725 (validKeyInArray!0 (select (arr!16768 a!3118) j!142)))))

(declare-fun b!554318 () Bool)

(declare-fun res!346724 () Bool)

(assert (=> b!554318 (=> (not res!346724) (not e!319643))))

(assert (=> b!554318 (= res!346724 (validKeyInArray!0 k0!1914))))

(declare-fun b!554319 () Bool)

(assert (=> b!554319 (= e!319644 (= (seekEntryOrOpen!0 (select (arr!16768 a!3118) j!142) a!3118 mask!3119) (Found!5217 j!142)))))

(declare-fun b!554320 () Bool)

(declare-fun res!346727 () Bool)

(assert (=> b!554320 (=> (not res!346727) (not e!319642))))

(declare-datatypes ((List!10848 0))(
  ( (Nil!10845) (Cons!10844 (h!11829 (_ BitVec 64)) (t!17076 List!10848)) )
))
(declare-fun arrayNoDuplicates!0 (array!34917 (_ BitVec 32) List!10848) Bool)

(assert (=> b!554320 (= res!346727 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10845))))

(declare-fun b!554321 () Bool)

(assert (=> b!554321 (= e!319642 e!319640)))

(declare-fun res!346730 () Bool)

(assert (=> b!554321 (=> (not res!346730) (not e!319640))))

(declare-fun lt!251757 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34917 (_ BitVec 32)) SeekEntryResult!5217)

(assert (=> b!554321 (= res!346730 (= lt!251754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251757 (select (store (arr!16768 a!3118) i!1132 k0!1914) j!142) (array!34918 (store (arr!16768 a!3118) i!1132 k0!1914) (size!17132 a!3118)) mask!3119)))))

(declare-fun lt!251758 () (_ BitVec 32))

(assert (=> b!554321 (= lt!251754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251758 (select (arr!16768 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554321 (= lt!251757 (toIndex!0 (select (store (arr!16768 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554321 (= lt!251758 (toIndex!0 (select (arr!16768 a!3118) j!142) mask!3119))))

(assert (= (and start!50692 res!346728) b!554312))

(assert (= (and b!554312 res!346729) b!554317))

(assert (= (and b!554317 res!346725) b!554318))

(assert (= (and b!554318 res!346724) b!554315))

(assert (= (and b!554315 res!346732) b!554316))

(assert (= (and b!554316 res!346733) b!554313))

(assert (= (and b!554313 res!346726) b!554320))

(assert (= (and b!554320 res!346727) b!554321))

(assert (= (and b!554321 res!346730) b!554314))

(assert (= (and b!554314 res!346731) b!554319))

(declare-fun m!531581 () Bool)

(assert (=> start!50692 m!531581))

(declare-fun m!531583 () Bool)

(assert (=> start!50692 m!531583))

(declare-fun m!531585 () Bool)

(assert (=> b!554314 m!531585))

(declare-fun m!531587 () Bool)

(assert (=> b!554314 m!531587))

(declare-fun m!531589 () Bool)

(assert (=> b!554314 m!531589))

(declare-fun m!531591 () Bool)

(assert (=> b!554314 m!531591))

(assert (=> b!554317 m!531587))

(assert (=> b!554317 m!531587))

(declare-fun m!531593 () Bool)

(assert (=> b!554317 m!531593))

(assert (=> b!554321 m!531587))

(declare-fun m!531595 () Bool)

(assert (=> b!554321 m!531595))

(declare-fun m!531597 () Bool)

(assert (=> b!554321 m!531597))

(assert (=> b!554321 m!531595))

(declare-fun m!531599 () Bool)

(assert (=> b!554321 m!531599))

(assert (=> b!554321 m!531595))

(declare-fun m!531601 () Bool)

(assert (=> b!554321 m!531601))

(assert (=> b!554321 m!531587))

(declare-fun m!531603 () Bool)

(assert (=> b!554321 m!531603))

(assert (=> b!554321 m!531587))

(declare-fun m!531605 () Bool)

(assert (=> b!554321 m!531605))

(declare-fun m!531607 () Bool)

(assert (=> b!554320 m!531607))

(declare-fun m!531609 () Bool)

(assert (=> b!554318 m!531609))

(declare-fun m!531611 () Bool)

(assert (=> b!554316 m!531611))

(declare-fun m!531613 () Bool)

(assert (=> b!554313 m!531613))

(assert (=> b!554319 m!531587))

(assert (=> b!554319 m!531587))

(declare-fun m!531615 () Bool)

(assert (=> b!554319 m!531615))

(declare-fun m!531617 () Bool)

(assert (=> b!554315 m!531617))

(check-sat (not b!554320) (not b!554315) (not start!50692) (not b!554321) (not b!554319) (not b!554313) (not b!554318) (not b!554314) (not b!554316) (not b!554317))
(check-sat)
