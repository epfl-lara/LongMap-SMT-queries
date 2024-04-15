; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52772 () Bool)

(assert start!52772)

(declare-fun b!575318 () Bool)

(declare-fun res!363881 () Bool)

(declare-fun e!331014 () Bool)

(assert (=> b!575318 (=> (not res!363881) (not e!331014))))

(declare-datatypes ((array!35926 0))(
  ( (array!35927 (arr!17246 (Array (_ BitVec 32) (_ BitVec 64))) (size!17611 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35926)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35926 (_ BitVec 32)) Bool)

(assert (=> b!575318 (= res!363881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575319 () Bool)

(declare-fun res!363877 () Bool)

(declare-fun e!331011 () Bool)

(assert (=> b!575319 (=> (not res!363877) (not e!331011))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575319 (= res!363877 (validKeyInArray!0 (select (arr!17246 a!3118) j!142)))))

(declare-fun b!575320 () Bool)

(declare-fun e!331012 () Bool)

(assert (=> b!575320 (= e!331012 true)))

(declare-datatypes ((SeekEntryResult!5692 0))(
  ( (MissingZero!5692 (index!24995 (_ BitVec 32))) (Found!5692 (index!24996 (_ BitVec 32))) (Intermediate!5692 (undefined!6504 Bool) (index!24997 (_ BitVec 32)) (x!53896 (_ BitVec 32))) (Undefined!5692) (MissingVacant!5692 (index!24998 (_ BitVec 32))) )
))
(declare-fun lt!262976 () SeekEntryResult!5692)

(declare-fun lt!262973 () SeekEntryResult!5692)

(assert (=> b!575320 (= lt!262976 lt!262973)))

(declare-datatypes ((Unit!18072 0))(
  ( (Unit!18073) )
))
(declare-fun lt!262971 () Unit!18072)

(declare-fun lt!262966 () SeekEntryResult!5692)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35926 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18072)

(assert (=> b!575320 (= lt!262971 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53896 lt!262966) (index!24997 lt!262966) (index!24997 lt!262966) mask!3119))))

(declare-fun b!575321 () Bool)

(declare-fun e!331017 () Bool)

(assert (=> b!575321 (= e!331014 e!331017)))

(declare-fun res!363876 () Bool)

(assert (=> b!575321 (=> (not res!363876) (not e!331017))))

(declare-fun lt!262970 () (_ BitVec 32))

(declare-fun lt!262965 () (_ BitVec 64))

(declare-fun lt!262975 () array!35926)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35926 (_ BitVec 32)) SeekEntryResult!5692)

(assert (=> b!575321 (= res!363876 (= lt!262966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262970 lt!262965 lt!262975 mask!3119)))))

(declare-fun lt!262978 () (_ BitVec 32))

(assert (=> b!575321 (= lt!262966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262978 (select (arr!17246 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575321 (= lt!262970 (toIndex!0 lt!262965 mask!3119))))

(assert (=> b!575321 (= lt!262965 (select (store (arr!17246 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575321 (= lt!262978 (toIndex!0 (select (arr!17246 a!3118) j!142) mask!3119))))

(assert (=> b!575321 (= lt!262975 (array!35927 (store (arr!17246 a!3118) i!1132 k0!1914) (size!17611 a!3118)))))

(declare-fun b!575322 () Bool)

(declare-fun res!363886 () Bool)

(assert (=> b!575322 (=> (not res!363886) (not e!331011))))

(assert (=> b!575322 (= res!363886 (and (= (size!17611 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17611 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17611 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575323 () Bool)

(declare-fun res!363880 () Bool)

(assert (=> b!575323 (=> (not res!363880) (not e!331014))))

(declare-datatypes ((List!11365 0))(
  ( (Nil!11362) (Cons!11361 (h!12400 (_ BitVec 64)) (t!17584 List!11365)) )
))
(declare-fun arrayNoDuplicates!0 (array!35926 (_ BitVec 32) List!11365) Bool)

(assert (=> b!575323 (= res!363880 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11362))))

(declare-fun b!575324 () Bool)

(declare-fun e!331016 () Bool)

(assert (=> b!575324 (= e!331017 (not e!331016))))

(declare-fun res!363883 () Bool)

(assert (=> b!575324 (=> res!363883 e!331016)))

(get-info :version)

(assert (=> b!575324 (= res!363883 (or (undefined!6504 lt!262966) (not ((_ is Intermediate!5692) lt!262966))))))

(declare-fun lt!262977 () SeekEntryResult!5692)

(declare-fun lt!262974 () SeekEntryResult!5692)

(assert (=> b!575324 (= lt!262977 lt!262974)))

(assert (=> b!575324 (= lt!262974 (Found!5692 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35926 (_ BitVec 32)) SeekEntryResult!5692)

(assert (=> b!575324 (= lt!262977 (seekEntryOrOpen!0 (select (arr!17246 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575324 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262969 () Unit!18072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18072)

(assert (=> b!575324 (= lt!262969 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575326 () Bool)

(declare-fun e!331015 () Bool)

(assert (=> b!575326 (= e!331015 e!331012)))

(declare-fun res!363878 () Bool)

(assert (=> b!575326 (=> res!363878 e!331012)))

(declare-fun lt!262967 () (_ BitVec 64))

(assert (=> b!575326 (= res!363878 (or (bvslt (index!24997 lt!262966) #b00000000000000000000000000000000) (bvsge (index!24997 lt!262966) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53896 lt!262966) #b01111111111111111111111111111110) (bvslt (x!53896 lt!262966) #b00000000000000000000000000000000) (not (= lt!262967 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17246 a!3118) i!1132 k0!1914) (index!24997 lt!262966)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!262976 lt!262974))))))

(declare-fun lt!262968 () SeekEntryResult!5692)

(assert (=> b!575326 (= lt!262968 lt!262973)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35926 (_ BitVec 32)) SeekEntryResult!5692)

(assert (=> b!575326 (= lt!262973 (seekKeyOrZeroReturnVacant!0 (x!53896 lt!262966) (index!24997 lt!262966) (index!24997 lt!262966) lt!262965 lt!262975 mask!3119))))

(assert (=> b!575326 (= lt!262968 (seekEntryOrOpen!0 lt!262965 lt!262975 mask!3119))))

(assert (=> b!575326 (= lt!262977 lt!262976)))

(assert (=> b!575326 (= lt!262976 (seekKeyOrZeroReturnVacant!0 (x!53896 lt!262966) (index!24997 lt!262966) (index!24997 lt!262966) (select (arr!17246 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575327 () Bool)

(declare-fun res!363885 () Bool)

(assert (=> b!575327 (=> (not res!363885) (not e!331011))))

(assert (=> b!575327 (= res!363885 (validKeyInArray!0 k0!1914))))

(declare-fun b!575328 () Bool)

(assert (=> b!575328 (= e!331016 e!331015)))

(declare-fun res!363887 () Bool)

(assert (=> b!575328 (=> res!363887 e!331015)))

(assert (=> b!575328 (= res!363887 (or (= lt!262967 (select (arr!17246 a!3118) j!142)) (= lt!262967 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575328 (= lt!262967 (select (arr!17246 a!3118) (index!24997 lt!262966)))))

(declare-fun b!575329 () Bool)

(assert (=> b!575329 (= e!331011 e!331014)))

(declare-fun res!363884 () Bool)

(assert (=> b!575329 (=> (not res!363884) (not e!331014))))

(declare-fun lt!262972 () SeekEntryResult!5692)

(assert (=> b!575329 (= res!363884 (or (= lt!262972 (MissingZero!5692 i!1132)) (= lt!262972 (MissingVacant!5692 i!1132))))))

(assert (=> b!575329 (= lt!262972 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575325 () Bool)

(declare-fun res!363879 () Bool)

(assert (=> b!575325 (=> (not res!363879) (not e!331011))))

(declare-fun arrayContainsKey!0 (array!35926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575325 (= res!363879 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!363882 () Bool)

(assert (=> start!52772 (=> (not res!363882) (not e!331011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52772 (= res!363882 (validMask!0 mask!3119))))

(assert (=> start!52772 e!331011))

(assert (=> start!52772 true))

(declare-fun array_inv!13129 (array!35926) Bool)

(assert (=> start!52772 (array_inv!13129 a!3118)))

(assert (= (and start!52772 res!363882) b!575322))

(assert (= (and b!575322 res!363886) b!575319))

(assert (= (and b!575319 res!363877) b!575327))

(assert (= (and b!575327 res!363885) b!575325))

(assert (= (and b!575325 res!363879) b!575329))

(assert (= (and b!575329 res!363884) b!575318))

(assert (= (and b!575318 res!363881) b!575323))

(assert (= (and b!575323 res!363880) b!575321))

(assert (= (and b!575321 res!363876) b!575324))

(assert (= (and b!575324 (not res!363883)) b!575328))

(assert (= (and b!575328 (not res!363887)) b!575326))

(assert (= (and b!575326 (not res!363878)) b!575320))

(declare-fun m!553721 () Bool)

(assert (=> b!575323 m!553721))

(declare-fun m!553723 () Bool)

(assert (=> b!575320 m!553723))

(declare-fun m!553725 () Bool)

(assert (=> b!575321 m!553725))

(declare-fun m!553727 () Bool)

(assert (=> b!575321 m!553727))

(declare-fun m!553729 () Bool)

(assert (=> b!575321 m!553729))

(declare-fun m!553731 () Bool)

(assert (=> b!575321 m!553731))

(declare-fun m!553733 () Bool)

(assert (=> b!575321 m!553733))

(declare-fun m!553735 () Bool)

(assert (=> b!575321 m!553735))

(assert (=> b!575321 m!553725))

(declare-fun m!553737 () Bool)

(assert (=> b!575321 m!553737))

(assert (=> b!575321 m!553725))

(declare-fun m!553739 () Bool)

(assert (=> b!575318 m!553739))

(declare-fun m!553741 () Bool)

(assert (=> b!575327 m!553741))

(declare-fun m!553743 () Bool)

(assert (=> b!575329 m!553743))

(assert (=> b!575324 m!553725))

(assert (=> b!575324 m!553725))

(declare-fun m!553745 () Bool)

(assert (=> b!575324 m!553745))

(declare-fun m!553747 () Bool)

(assert (=> b!575324 m!553747))

(declare-fun m!553749 () Bool)

(assert (=> b!575324 m!553749))

(declare-fun m!553751 () Bool)

(assert (=> b!575325 m!553751))

(declare-fun m!553753 () Bool)

(assert (=> b!575326 m!553753))

(declare-fun m!553755 () Bool)

(assert (=> b!575326 m!553755))

(assert (=> b!575326 m!553725))

(declare-fun m!553757 () Bool)

(assert (=> b!575326 m!553757))

(assert (=> b!575326 m!553725))

(declare-fun m!553759 () Bool)

(assert (=> b!575326 m!553759))

(assert (=> b!575326 m!553731))

(assert (=> b!575328 m!553725))

(declare-fun m!553761 () Bool)

(assert (=> b!575328 m!553761))

(assert (=> b!575319 m!553725))

(assert (=> b!575319 m!553725))

(declare-fun m!553763 () Bool)

(assert (=> b!575319 m!553763))

(declare-fun m!553765 () Bool)

(assert (=> start!52772 m!553765))

(declare-fun m!553767 () Bool)

(assert (=> start!52772 m!553767))

(check-sat (not b!575323) (not b!575325) (not b!575320) (not b!575321) (not b!575324) (not b!575329) (not b!575327) (not start!52772) (not b!575326) (not b!575318) (not b!575319))
(check-sat)
