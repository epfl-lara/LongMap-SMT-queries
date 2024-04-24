; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51936 () Bool)

(assert start!51936)

(declare-fun b!567343 () Bool)

(declare-fun res!357831 () Bool)

(declare-fun e!326530 () Bool)

(assert (=> b!567343 (=> (not res!357831) (not e!326530))))

(declare-datatypes ((array!35577 0))(
  ( (array!35578 (arr!17083 (Array (_ BitVec 32) (_ BitVec 64))) (size!17447 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35577)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567343 (= res!357831 (validKeyInArray!0 (select (arr!17083 a!3118) j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!567344 () Bool)

(declare-fun e!326529 () Bool)

(declare-datatypes ((SeekEntryResult!5488 0))(
  ( (MissingZero!5488 (index!24179 (_ BitVec 32))) (Found!5488 (index!24180 (_ BitVec 32))) (Intermediate!5488 (undefined!6300 Bool) (index!24181 (_ BitVec 32)) (x!53204 (_ BitVec 32))) (Undefined!5488) (MissingVacant!5488 (index!24182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35577 (_ BitVec 32)) SeekEntryResult!5488)

(assert (=> b!567344 (= e!326529 (= (seekEntryOrOpen!0 (select (arr!17083 a!3118) j!142) a!3118 mask!3119) (Found!5488 j!142)))))

(declare-fun b!567345 () Bool)

(declare-fun res!357829 () Bool)

(assert (=> b!567345 (=> (not res!357829) (not e!326530))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567345 (= res!357829 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567347 () Bool)

(declare-fun res!357824 () Bool)

(declare-fun e!326532 () Bool)

(assert (=> b!567347 (=> (not res!357824) (not e!326532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35577 (_ BitVec 32)) Bool)

(assert (=> b!567347 (= res!357824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567348 () Bool)

(assert (=> b!567348 (= e!326530 e!326532)))

(declare-fun res!357830 () Bool)

(assert (=> b!567348 (=> (not res!357830) (not e!326532))))

(declare-fun lt!258568 () SeekEntryResult!5488)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567348 (= res!357830 (or (= lt!258568 (MissingZero!5488 i!1132)) (= lt!258568 (MissingVacant!5488 i!1132))))))

(assert (=> b!567348 (= lt!258568 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!357827 () Bool)

(assert (=> start!51936 (=> (not res!357827) (not e!326530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51936 (= res!357827 (validMask!0 mask!3119))))

(assert (=> start!51936 e!326530))

(assert (=> start!51936 true))

(declare-fun array_inv!12942 (array!35577) Bool)

(assert (=> start!51936 (array_inv!12942 a!3118)))

(declare-fun b!567346 () Bool)

(declare-fun res!357828 () Bool)

(assert (=> b!567346 (=> (not res!357828) (not e!326532))))

(declare-datatypes ((List!11070 0))(
  ( (Nil!11067) (Cons!11066 (h!12081 (_ BitVec 64)) (t!17290 List!11070)) )
))
(declare-fun arrayNoDuplicates!0 (array!35577 (_ BitVec 32) List!11070) Bool)

(assert (=> b!567346 (= res!357828 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11067))))

(declare-fun b!567349 () Bool)

(declare-fun res!357825 () Bool)

(assert (=> b!567349 (=> (not res!357825) (not e!326532))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35577 (_ BitVec 32)) SeekEntryResult!5488)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567349 (= res!357825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17083 a!3118) j!142) mask!3119) (select (arr!17083 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17083 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17083 a!3118) i!1132 k0!1914) j!142) (array!35578 (store (arr!17083 a!3118) i!1132 k0!1914) (size!17447 a!3118)) mask!3119)))))

(declare-fun b!567350 () Bool)

(declare-fun res!357832 () Bool)

(assert (=> b!567350 (=> (not res!357832) (not e!326530))))

(assert (=> b!567350 (= res!357832 (validKeyInArray!0 k0!1914))))

(declare-fun b!567351 () Bool)

(assert (=> b!567351 (= e!326532 (not true))))

(assert (=> b!567351 e!326529))

(declare-fun res!357823 () Bool)

(assert (=> b!567351 (=> (not res!357823) (not e!326529))))

(assert (=> b!567351 (= res!357823 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17749 0))(
  ( (Unit!17750) )
))
(declare-fun lt!258567 () Unit!17749)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17749)

(assert (=> b!567351 (= lt!258567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567352 () Bool)

(declare-fun res!357826 () Bool)

(assert (=> b!567352 (=> (not res!357826) (not e!326530))))

(assert (=> b!567352 (= res!357826 (and (= (size!17447 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17447 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17447 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51936 res!357827) b!567352))

(assert (= (and b!567352 res!357826) b!567343))

(assert (= (and b!567343 res!357831) b!567350))

(assert (= (and b!567350 res!357832) b!567345))

(assert (= (and b!567345 res!357829) b!567348))

(assert (= (and b!567348 res!357830) b!567347))

(assert (= (and b!567347 res!357824) b!567346))

(assert (= (and b!567346 res!357828) b!567349))

(assert (= (and b!567349 res!357825) b!567351))

(assert (= (and b!567351 res!357823) b!567344))

(declare-fun m!546011 () Bool)

(assert (=> b!567345 m!546011))

(declare-fun m!546013 () Bool)

(assert (=> start!51936 m!546013))

(declare-fun m!546015 () Bool)

(assert (=> start!51936 m!546015))

(declare-fun m!546017 () Bool)

(assert (=> b!567350 m!546017))

(declare-fun m!546019 () Bool)

(assert (=> b!567343 m!546019))

(assert (=> b!567343 m!546019))

(declare-fun m!546021 () Bool)

(assert (=> b!567343 m!546021))

(assert (=> b!567344 m!546019))

(assert (=> b!567344 m!546019))

(declare-fun m!546023 () Bool)

(assert (=> b!567344 m!546023))

(declare-fun m!546025 () Bool)

(assert (=> b!567347 m!546025))

(declare-fun m!546027 () Bool)

(assert (=> b!567348 m!546027))

(declare-fun m!546029 () Bool)

(assert (=> b!567351 m!546029))

(declare-fun m!546031 () Bool)

(assert (=> b!567351 m!546031))

(declare-fun m!546033 () Bool)

(assert (=> b!567346 m!546033))

(assert (=> b!567349 m!546019))

(declare-fun m!546035 () Bool)

(assert (=> b!567349 m!546035))

(assert (=> b!567349 m!546019))

(declare-fun m!546037 () Bool)

(assert (=> b!567349 m!546037))

(declare-fun m!546039 () Bool)

(assert (=> b!567349 m!546039))

(assert (=> b!567349 m!546037))

(declare-fun m!546041 () Bool)

(assert (=> b!567349 m!546041))

(assert (=> b!567349 m!546035))

(assert (=> b!567349 m!546019))

(declare-fun m!546043 () Bool)

(assert (=> b!567349 m!546043))

(declare-fun m!546045 () Bool)

(assert (=> b!567349 m!546045))

(assert (=> b!567349 m!546037))

(assert (=> b!567349 m!546039))

(check-sat (not start!51936) (not b!567344) (not b!567350) (not b!567346) (not b!567343) (not b!567348) (not b!567345) (not b!567351) (not b!567349) (not b!567347))
(check-sat)
