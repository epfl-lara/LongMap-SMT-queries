; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50724 () Bool)

(assert start!50724)

(declare-fun b!554295 () Bool)

(declare-fun e!319669 () Bool)

(declare-fun e!319670 () Bool)

(assert (=> b!554295 (= e!319669 e!319670)))

(declare-fun res!346610 () Bool)

(assert (=> b!554295 (=> (not res!346610) (not e!319670))))

(declare-datatypes ((SeekEntryResult!5161 0))(
  ( (MissingZero!5161 (index!22871 (_ BitVec 32))) (Found!5161 (index!22872 (_ BitVec 32))) (Intermediate!5161 (undefined!5973 Bool) (index!22873 (_ BitVec 32)) (x!51942 (_ BitVec 32))) (Undefined!5161) (MissingVacant!5161 (index!22874 (_ BitVec 32))) )
))
(declare-fun lt!251789 () SeekEntryResult!5161)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554295 (= res!346610 (or (= lt!251789 (MissingZero!5161 i!1132)) (= lt!251789 (MissingVacant!5161 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34896 0))(
  ( (array!34897 (arr!16756 (Array (_ BitVec 32) (_ BitVec 64))) (size!17120 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34896)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34896 (_ BitVec 32)) SeekEntryResult!5161)

(assert (=> b!554295 (= lt!251789 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554296 () Bool)

(declare-fun res!346604 () Bool)

(assert (=> b!554296 (=> (not res!346604) (not e!319669))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554296 (= res!346604 (validKeyInArray!0 (select (arr!16756 a!3118) j!142)))))

(declare-fun b!554297 () Bool)

(declare-fun res!346606 () Bool)

(assert (=> b!554297 (=> (not res!346606) (not e!319669))))

(declare-fun arrayContainsKey!0 (array!34896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554297 (= res!346606 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554298 () Bool)

(declare-fun res!346609 () Bool)

(assert (=> b!554298 (=> (not res!346609) (not e!319669))))

(assert (=> b!554298 (= res!346609 (validKeyInArray!0 k0!1914))))

(declare-fun b!554299 () Bool)

(declare-fun e!319668 () Bool)

(declare-fun e!319666 () Bool)

(assert (=> b!554299 (= e!319668 (not e!319666))))

(declare-fun res!346602 () Bool)

(assert (=> b!554299 (=> res!346602 e!319666)))

(declare-fun lt!251790 () SeekEntryResult!5161)

(get-info :version)

(assert (=> b!554299 (= res!346602 (or (not ((_ is Intermediate!5161) lt!251790)) (undefined!5973 lt!251790) (not (= (select (arr!16756 a!3118) (index!22873 lt!251790)) (select (arr!16756 a!3118) j!142))) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!319671 () Bool)

(assert (=> b!554299 e!319671))

(declare-fun res!346612 () Bool)

(assert (=> b!554299 (=> (not res!346612) (not e!319671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34896 (_ BitVec 32)) Bool)

(assert (=> b!554299 (= res!346612 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17167 0))(
  ( (Unit!17168) )
))
(declare-fun lt!251788 () Unit!17167)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17167)

(assert (=> b!554299 (= lt!251788 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554300 () Bool)

(assert (=> b!554300 (= e!319670 e!319668)))

(declare-fun res!346605 () Bool)

(assert (=> b!554300 (=> (not res!346605) (not e!319668))))

(declare-fun lt!251787 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34896 (_ BitVec 32)) SeekEntryResult!5161)

(assert (=> b!554300 (= res!346605 (= lt!251790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251787 (select (store (arr!16756 a!3118) i!1132 k0!1914) j!142) (array!34897 (store (arr!16756 a!3118) i!1132 k0!1914) (size!17120 a!3118)) mask!3119)))))

(declare-fun lt!251791 () (_ BitVec 32))

(assert (=> b!554300 (= lt!251790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251791 (select (arr!16756 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554300 (= lt!251787 (toIndex!0 (select (store (arr!16756 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554300 (= lt!251791 (toIndex!0 (select (arr!16756 a!3118) j!142) mask!3119))))

(declare-fun b!554301 () Bool)

(assert (=> b!554301 (= e!319666 (validKeyInArray!0 (select (store (arr!16756 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun res!346611 () Bool)

(assert (=> start!50724 (=> (not res!346611) (not e!319669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50724 (= res!346611 (validMask!0 mask!3119))))

(assert (=> start!50724 e!319669))

(assert (=> start!50724 true))

(declare-fun array_inv!12615 (array!34896) Bool)

(assert (=> start!50724 (array_inv!12615 a!3118)))

(declare-fun b!554302 () Bool)

(declare-fun res!346607 () Bool)

(assert (=> b!554302 (=> (not res!346607) (not e!319669))))

(assert (=> b!554302 (= res!346607 (and (= (size!17120 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17120 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17120 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554303 () Bool)

(declare-fun res!346603 () Bool)

(assert (=> b!554303 (=> (not res!346603) (not e!319670))))

(assert (=> b!554303 (= res!346603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554304 () Bool)

(declare-fun res!346608 () Bool)

(assert (=> b!554304 (=> (not res!346608) (not e!319670))))

(declare-datatypes ((List!10743 0))(
  ( (Nil!10740) (Cons!10739 (h!11727 (_ BitVec 64)) (t!16963 List!10743)) )
))
(declare-fun arrayNoDuplicates!0 (array!34896 (_ BitVec 32) List!10743) Bool)

(assert (=> b!554304 (= res!346608 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10740))))

(declare-fun b!554305 () Bool)

(assert (=> b!554305 (= e!319671 (= (seekEntryOrOpen!0 (select (arr!16756 a!3118) j!142) a!3118 mask!3119) (Found!5161 j!142)))))

(assert (= (and start!50724 res!346611) b!554302))

(assert (= (and b!554302 res!346607) b!554296))

(assert (= (and b!554296 res!346604) b!554298))

(assert (= (and b!554298 res!346609) b!554297))

(assert (= (and b!554297 res!346606) b!554295))

(assert (= (and b!554295 res!346610) b!554303))

(assert (= (and b!554303 res!346603) b!554304))

(assert (= (and b!554304 res!346608) b!554300))

(assert (= (and b!554300 res!346605) b!554299))

(assert (= (and b!554299 res!346612) b!554305))

(assert (= (and b!554299 (not res!346602)) b!554301))

(declare-fun m!531653 () Bool)

(assert (=> b!554305 m!531653))

(assert (=> b!554305 m!531653))

(declare-fun m!531655 () Bool)

(assert (=> b!554305 m!531655))

(declare-fun m!531657 () Bool)

(assert (=> b!554298 m!531657))

(assert (=> b!554296 m!531653))

(assert (=> b!554296 m!531653))

(declare-fun m!531659 () Bool)

(assert (=> b!554296 m!531659))

(declare-fun m!531661 () Bool)

(assert (=> start!50724 m!531661))

(declare-fun m!531663 () Bool)

(assert (=> start!50724 m!531663))

(declare-fun m!531665 () Bool)

(assert (=> b!554297 m!531665))

(declare-fun m!531667 () Bool)

(assert (=> b!554301 m!531667))

(declare-fun m!531669 () Bool)

(assert (=> b!554301 m!531669))

(assert (=> b!554301 m!531669))

(declare-fun m!531671 () Bool)

(assert (=> b!554301 m!531671))

(assert (=> b!554300 m!531653))

(declare-fun m!531673 () Bool)

(assert (=> b!554300 m!531673))

(assert (=> b!554300 m!531653))

(assert (=> b!554300 m!531669))

(assert (=> b!554300 m!531669))

(declare-fun m!531675 () Bool)

(assert (=> b!554300 m!531675))

(assert (=> b!554300 m!531667))

(assert (=> b!554300 m!531669))

(declare-fun m!531677 () Bool)

(assert (=> b!554300 m!531677))

(assert (=> b!554300 m!531653))

(declare-fun m!531679 () Bool)

(assert (=> b!554300 m!531679))

(declare-fun m!531681 () Bool)

(assert (=> b!554303 m!531681))

(declare-fun m!531683 () Bool)

(assert (=> b!554304 m!531683))

(declare-fun m!531685 () Bool)

(assert (=> b!554295 m!531685))

(declare-fun m!531687 () Bool)

(assert (=> b!554299 m!531687))

(assert (=> b!554299 m!531653))

(declare-fun m!531689 () Bool)

(assert (=> b!554299 m!531689))

(declare-fun m!531691 () Bool)

(assert (=> b!554299 m!531691))

(check-sat (not b!554301) (not b!554298) (not b!554295) (not b!554299) (not b!554300) (not b!554303) (not start!50724) (not b!554305) (not b!554304) (not b!554297) (not b!554296))
(check-sat)
