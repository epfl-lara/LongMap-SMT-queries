; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51090 () Bool)

(assert start!51090)

(declare-fun b!558355 () Bool)

(declare-fun res!350223 () Bool)

(declare-fun e!321652 () Bool)

(assert (=> b!558355 (=> (not res!350223) (not e!321652))))

(declare-datatypes ((array!35144 0))(
  ( (array!35145 (arr!16877 (Array (_ BitVec 32) (_ BitVec 64))) (size!17241 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35144)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35144 (_ BitVec 32)) Bool)

(assert (=> b!558355 (= res!350223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558356 () Bool)

(declare-fun e!321655 () Bool)

(declare-fun e!321656 () Bool)

(assert (=> b!558356 (= e!321655 e!321656)))

(declare-fun res!350222 () Bool)

(assert (=> b!558356 (=> res!350222 e!321656)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5326 0))(
  ( (MissingZero!5326 (index!23531 (_ BitVec 32))) (Found!5326 (index!23532 (_ BitVec 32))) (Intermediate!5326 (undefined!6138 Bool) (index!23533 (_ BitVec 32)) (x!52426 (_ BitVec 32))) (Undefined!5326) (MissingVacant!5326 (index!23534 (_ BitVec 32))) )
))
(declare-fun lt!253731 () SeekEntryResult!5326)

(assert (=> b!558356 (= res!350222 (or (undefined!6138 lt!253731) (not (is-Intermediate!5326 lt!253731)) (= (select (arr!16877 a!3118) (index!23533 lt!253731)) (select (arr!16877 a!3118) j!142)) (= (select (arr!16877 a!3118) (index!23533 lt!253731)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558357 () Bool)

(declare-fun e!321654 () Bool)

(assert (=> b!558357 (= e!321652 e!321654)))

(declare-fun res!350225 () Bool)

(assert (=> b!558357 (=> (not res!350225) (not e!321654))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!253734 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35144 (_ BitVec 32)) SeekEntryResult!5326)

(assert (=> b!558357 (= res!350225 (= lt!253731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253734 (select (store (arr!16877 a!3118) i!1132 k!1914) j!142) (array!35145 (store (arr!16877 a!3118) i!1132 k!1914) (size!17241 a!3118)) mask!3119)))))

(declare-fun lt!253733 () (_ BitVec 32))

(assert (=> b!558357 (= lt!253731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253733 (select (arr!16877 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558357 (= lt!253734 (toIndex!0 (select (store (arr!16877 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558357 (= lt!253733 (toIndex!0 (select (arr!16877 a!3118) j!142) mask!3119))))

(declare-fun b!558358 () Bool)

(declare-fun e!321653 () Bool)

(assert (=> b!558358 (= e!321653 e!321652)))

(declare-fun res!350218 () Bool)

(assert (=> b!558358 (=> (not res!350218) (not e!321652))))

(declare-fun lt!253735 () SeekEntryResult!5326)

(assert (=> b!558358 (= res!350218 (or (= lt!253735 (MissingZero!5326 i!1132)) (= lt!253735 (MissingVacant!5326 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35144 (_ BitVec 32)) SeekEntryResult!5326)

(assert (=> b!558358 (= lt!253735 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558359 () Bool)

(declare-fun res!350224 () Bool)

(assert (=> b!558359 (=> (not res!350224) (not e!321653))))

(declare-fun arrayContainsKey!0 (array!35144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558359 (= res!350224 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558360 () Bool)

(declare-fun res!350226 () Bool)

(assert (=> b!558360 (=> (not res!350226) (not e!321653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558360 (= res!350226 (validKeyInArray!0 k!1914))))

(declare-fun b!558361 () Bool)

(declare-fun res!350227 () Bool)

(assert (=> b!558361 (=> (not res!350227) (not e!321652))))

(declare-datatypes ((List!10957 0))(
  ( (Nil!10954) (Cons!10953 (h!11947 (_ BitVec 64)) (t!17185 List!10957)) )
))
(declare-fun arrayNoDuplicates!0 (array!35144 (_ BitVec 32) List!10957) Bool)

(assert (=> b!558361 (= res!350227 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10954))))

(declare-fun res!350219 () Bool)

(assert (=> start!51090 (=> (not res!350219) (not e!321653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51090 (= res!350219 (validMask!0 mask!3119))))

(assert (=> start!51090 e!321653))

(assert (=> start!51090 true))

(declare-fun array_inv!12673 (array!35144) Bool)

(assert (=> start!51090 (array_inv!12673 a!3118)))

(declare-fun b!558362 () Bool)

(assert (=> b!558362 (= e!321654 (not true))))

(assert (=> b!558362 e!321655))

(declare-fun res!350221 () Bool)

(assert (=> b!558362 (=> (not res!350221) (not e!321655))))

(declare-fun lt!253732 () SeekEntryResult!5326)

(assert (=> b!558362 (= res!350221 (= lt!253732 (Found!5326 j!142)))))

(assert (=> b!558362 (= lt!253732 (seekEntryOrOpen!0 (select (arr!16877 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558362 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17426 0))(
  ( (Unit!17427) )
))
(declare-fun lt!253730 () Unit!17426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17426)

(assert (=> b!558362 (= lt!253730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558363 () Bool)

(declare-fun res!350220 () Bool)

(assert (=> b!558363 (=> (not res!350220) (not e!321653))))

(assert (=> b!558363 (= res!350220 (validKeyInArray!0 (select (arr!16877 a!3118) j!142)))))

(declare-fun b!558364 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35144 (_ BitVec 32)) SeekEntryResult!5326)

(assert (=> b!558364 (= e!321656 (= lt!253732 (seekKeyOrZeroReturnVacant!0 (x!52426 lt!253731) (index!23533 lt!253731) (index!23533 lt!253731) (select (arr!16877 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558365 () Bool)

(declare-fun res!350228 () Bool)

(assert (=> b!558365 (=> (not res!350228) (not e!321653))))

(assert (=> b!558365 (= res!350228 (and (= (size!17241 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17241 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17241 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51090 res!350219) b!558365))

(assert (= (and b!558365 res!350228) b!558363))

(assert (= (and b!558363 res!350220) b!558360))

(assert (= (and b!558360 res!350226) b!558359))

(assert (= (and b!558359 res!350224) b!558358))

(assert (= (and b!558358 res!350218) b!558355))

(assert (= (and b!558355 res!350223) b!558361))

(assert (= (and b!558361 res!350227) b!558357))

(assert (= (and b!558357 res!350225) b!558362))

(assert (= (and b!558362 res!350221) b!558356))

(assert (= (and b!558356 (not res!350222)) b!558364))

(declare-fun m!536315 () Bool)

(assert (=> b!558358 m!536315))

(declare-fun m!536317 () Bool)

(assert (=> b!558362 m!536317))

(assert (=> b!558362 m!536317))

(declare-fun m!536319 () Bool)

(assert (=> b!558362 m!536319))

(declare-fun m!536321 () Bool)

(assert (=> b!558362 m!536321))

(declare-fun m!536323 () Bool)

(assert (=> b!558362 m!536323))

(declare-fun m!536325 () Bool)

(assert (=> b!558360 m!536325))

(assert (=> b!558363 m!536317))

(assert (=> b!558363 m!536317))

(declare-fun m!536327 () Bool)

(assert (=> b!558363 m!536327))

(declare-fun m!536329 () Bool)

(assert (=> b!558359 m!536329))

(assert (=> b!558357 m!536317))

(declare-fun m!536331 () Bool)

(assert (=> b!558357 m!536331))

(declare-fun m!536333 () Bool)

(assert (=> b!558357 m!536333))

(declare-fun m!536335 () Bool)

(assert (=> b!558357 m!536335))

(assert (=> b!558357 m!536317))

(assert (=> b!558357 m!536333))

(assert (=> b!558357 m!536317))

(declare-fun m!536337 () Bool)

(assert (=> b!558357 m!536337))

(declare-fun m!536339 () Bool)

(assert (=> b!558357 m!536339))

(assert (=> b!558357 m!536333))

(declare-fun m!536341 () Bool)

(assert (=> b!558357 m!536341))

(assert (=> b!558364 m!536317))

(assert (=> b!558364 m!536317))

(declare-fun m!536343 () Bool)

(assert (=> b!558364 m!536343))

(declare-fun m!536345 () Bool)

(assert (=> b!558355 m!536345))

(declare-fun m!536347 () Bool)

(assert (=> b!558356 m!536347))

(assert (=> b!558356 m!536317))

(declare-fun m!536349 () Bool)

(assert (=> b!558361 m!536349))

(declare-fun m!536351 () Bool)

(assert (=> start!51090 m!536351))

(declare-fun m!536353 () Bool)

(assert (=> start!51090 m!536353))

(push 1)

(assert (not b!558362))

(assert (not b!558358))

(assert (not b!558360))

(assert (not b!558364))

(assert (not b!558359))

(assert (not b!558363))

(assert (not b!558361))

(assert (not b!558357))

