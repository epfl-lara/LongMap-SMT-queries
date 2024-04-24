; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51642 () Bool)

(assert start!51642)

(declare-fun b!564810 () Bool)

(declare-fun res!355862 () Bool)

(declare-fun e!325313 () Bool)

(assert (=> b!564810 (=> (not res!355862) (not e!325313))))

(declare-datatypes ((array!35454 0))(
  ( (array!35455 (arr!17026 (Array (_ BitVec 32) (_ BitVec 64))) (size!17390 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35454)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564810 (= res!355862 (validKeyInArray!0 (select (arr!17026 a!3118) j!142)))))

(declare-fun b!564811 () Bool)

(declare-fun e!325314 () Bool)

(assert (=> b!564811 (= e!325313 e!325314)))

(declare-fun res!355857 () Bool)

(assert (=> b!564811 (=> (not res!355857) (not e!325314))))

(declare-datatypes ((SeekEntryResult!5431 0))(
  ( (MissingZero!5431 (index!23951 (_ BitVec 32))) (Found!5431 (index!23952 (_ BitVec 32))) (Intermediate!5431 (undefined!6243 Bool) (index!23953 (_ BitVec 32)) (x!52977 (_ BitVec 32))) (Undefined!5431) (MissingVacant!5431 (index!23954 (_ BitVec 32))) )
))
(declare-fun lt!257719 () SeekEntryResult!5431)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564811 (= res!355857 (or (= lt!257719 (MissingZero!5431 i!1132)) (= lt!257719 (MissingVacant!5431 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35454 (_ BitVec 32)) SeekEntryResult!5431)

(assert (=> b!564811 (= lt!257719 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564812 () Bool)

(declare-fun res!355860 () Bool)

(assert (=> b!564812 (=> (not res!355860) (not e!325313))))

(assert (=> b!564812 (= res!355860 (validKeyInArray!0 k0!1914))))

(declare-fun res!355859 () Bool)

(assert (=> start!51642 (=> (not res!355859) (not e!325313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51642 (= res!355859 (validMask!0 mask!3119))))

(assert (=> start!51642 e!325313))

(assert (=> start!51642 true))

(declare-fun array_inv!12885 (array!35454) Bool)

(assert (=> start!51642 (array_inv!12885 a!3118)))

(declare-fun b!564813 () Bool)

(declare-fun res!355861 () Bool)

(assert (=> b!564813 (=> (not res!355861) (not e!325314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35454 (_ BitVec 32)) Bool)

(assert (=> b!564813 (= res!355861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564814 () Bool)

(assert (=> b!564814 (= e!325314 false)))

(declare-fun lt!257718 () (_ BitVec 32))

(declare-fun lt!257720 () SeekEntryResult!5431)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35454 (_ BitVec 32)) SeekEntryResult!5431)

(assert (=> b!564814 (= lt!257720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257718 (select (store (arr!17026 a!3118) i!1132 k0!1914) j!142) (array!35455 (store (arr!17026 a!3118) i!1132 k0!1914) (size!17390 a!3118)) mask!3119))))

(declare-fun lt!257721 () SeekEntryResult!5431)

(declare-fun lt!257722 () (_ BitVec 32))

(assert (=> b!564814 (= lt!257721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257722 (select (arr!17026 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564814 (= lt!257718 (toIndex!0 (select (store (arr!17026 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!564814 (= lt!257722 (toIndex!0 (select (arr!17026 a!3118) j!142) mask!3119))))

(declare-fun b!564815 () Bool)

(declare-fun res!355863 () Bool)

(assert (=> b!564815 (=> (not res!355863) (not e!325313))))

(declare-fun arrayContainsKey!0 (array!35454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564815 (= res!355863 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564816 () Bool)

(declare-fun res!355858 () Bool)

(assert (=> b!564816 (=> (not res!355858) (not e!325314))))

(declare-datatypes ((List!11013 0))(
  ( (Nil!11010) (Cons!11009 (h!12015 (_ BitVec 64)) (t!17233 List!11013)) )
))
(declare-fun arrayNoDuplicates!0 (array!35454 (_ BitVec 32) List!11013) Bool)

(assert (=> b!564816 (= res!355858 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11010))))

(declare-fun b!564817 () Bool)

(declare-fun res!355864 () Bool)

(assert (=> b!564817 (=> (not res!355864) (not e!325313))))

(assert (=> b!564817 (= res!355864 (and (= (size!17390 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17390 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17390 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51642 res!355859) b!564817))

(assert (= (and b!564817 res!355864) b!564810))

(assert (= (and b!564810 res!355862) b!564812))

(assert (= (and b!564812 res!355860) b!564815))

(assert (= (and b!564815 res!355863) b!564811))

(assert (= (and b!564811 res!355857) b!564813))

(assert (= (and b!564813 res!355861) b!564816))

(assert (= (and b!564816 res!355858) b!564814))

(declare-fun m!543389 () Bool)

(assert (=> start!51642 m!543389))

(declare-fun m!543391 () Bool)

(assert (=> start!51642 m!543391))

(declare-fun m!543393 () Bool)

(assert (=> b!564811 m!543393))

(declare-fun m!543395 () Bool)

(assert (=> b!564816 m!543395))

(declare-fun m!543397 () Bool)

(assert (=> b!564813 m!543397))

(declare-fun m!543399 () Bool)

(assert (=> b!564814 m!543399))

(declare-fun m!543401 () Bool)

(assert (=> b!564814 m!543401))

(assert (=> b!564814 m!543399))

(assert (=> b!564814 m!543399))

(declare-fun m!543403 () Bool)

(assert (=> b!564814 m!543403))

(declare-fun m!543405 () Bool)

(assert (=> b!564814 m!543405))

(declare-fun m!543407 () Bool)

(assert (=> b!564814 m!543407))

(declare-fun m!543409 () Bool)

(assert (=> b!564814 m!543409))

(assert (=> b!564814 m!543407))

(declare-fun m!543411 () Bool)

(assert (=> b!564814 m!543411))

(assert (=> b!564814 m!543407))

(declare-fun m!543413 () Bool)

(assert (=> b!564812 m!543413))

(declare-fun m!543415 () Bool)

(assert (=> b!564815 m!543415))

(assert (=> b!564810 m!543399))

(assert (=> b!564810 m!543399))

(declare-fun m!543417 () Bool)

(assert (=> b!564810 m!543417))

(check-sat (not b!564816) (not b!564811) (not b!564810) (not b!564813) (not start!51642) (not b!564815) (not b!564812) (not b!564814))
(check-sat)
