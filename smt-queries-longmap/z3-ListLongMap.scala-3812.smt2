; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52280 () Bool)

(assert start!52280)

(declare-fun b!570351 () Bool)

(declare-fun res!360283 () Bool)

(declare-fun e!328009 () Bool)

(assert (=> b!570351 (=> (not res!360283) (not e!328009))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35749 0))(
  ( (array!35750 (arr!17165 (Array (_ BitVec 32) (_ BitVec 64))) (size!17530 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35749)

(assert (=> b!570351 (= res!360283 (and (= (size!17530 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17530 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17530 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!360284 () Bool)

(assert (=> start!52280 (=> (not res!360284) (not e!328009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52280 (= res!360284 (validMask!0 mask!3119))))

(assert (=> start!52280 e!328009))

(assert (=> start!52280 true))

(declare-fun array_inv!13048 (array!35749) Bool)

(assert (=> start!52280 (array_inv!13048 a!3118)))

(declare-fun b!570352 () Bool)

(declare-fun res!360280 () Bool)

(declare-fun e!328013 () Bool)

(assert (=> b!570352 (=> (not res!360280) (not e!328013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35749 (_ BitVec 32)) Bool)

(assert (=> b!570352 (= res!360280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570353 () Bool)

(assert (=> b!570353 (= e!328009 e!328013)))

(declare-fun res!360275 () Bool)

(assert (=> b!570353 (=> (not res!360275) (not e!328013))))

(declare-datatypes ((SeekEntryResult!5611 0))(
  ( (MissingZero!5611 (index!24671 (_ BitVec 32))) (Found!5611 (index!24672 (_ BitVec 32))) (Intermediate!5611 (undefined!6423 Bool) (index!24673 (_ BitVec 32)) (x!53554 (_ BitVec 32))) (Undefined!5611) (MissingVacant!5611 (index!24674 (_ BitVec 32))) )
))
(declare-fun lt!259901 () SeekEntryResult!5611)

(assert (=> b!570353 (= res!360275 (or (= lt!259901 (MissingZero!5611 i!1132)) (= lt!259901 (MissingVacant!5611 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35749 (_ BitVec 32)) SeekEntryResult!5611)

(assert (=> b!570353 (= lt!259901 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570354 () Bool)

(declare-fun res!360279 () Bool)

(assert (=> b!570354 (=> (not res!360279) (not e!328009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570354 (= res!360279 (validKeyInArray!0 (select (arr!17165 a!3118) j!142)))))

(declare-fun b!570355 () Bool)

(declare-fun e!328012 () Bool)

(assert (=> b!570355 (= e!328013 e!328012)))

(declare-fun res!360282 () Bool)

(assert (=> b!570355 (=> (not res!360282) (not e!328012))))

(declare-fun lt!259902 () (_ BitVec 32))

(declare-fun lt!259899 () SeekEntryResult!5611)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35749 (_ BitVec 32)) SeekEntryResult!5611)

(assert (=> b!570355 (= res!360282 (= lt!259899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259902 (select (store (arr!17165 a!3118) i!1132 k0!1914) j!142) (array!35750 (store (arr!17165 a!3118) i!1132 k0!1914) (size!17530 a!3118)) mask!3119)))))

(declare-fun lt!259898 () (_ BitVec 32))

(assert (=> b!570355 (= lt!259899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259898 (select (arr!17165 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570355 (= lt!259902 (toIndex!0 (select (store (arr!17165 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570355 (= lt!259898 (toIndex!0 (select (arr!17165 a!3118) j!142) mask!3119))))

(declare-fun b!570356 () Bool)

(declare-fun res!360281 () Bool)

(assert (=> b!570356 (=> (not res!360281) (not e!328013))))

(declare-datatypes ((List!11284 0))(
  ( (Nil!11281) (Cons!11280 (h!12304 (_ BitVec 64)) (t!17503 List!11284)) )
))
(declare-fun arrayNoDuplicates!0 (array!35749 (_ BitVec 32) List!11284) Bool)

(assert (=> b!570356 (= res!360281 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11281))))

(declare-fun b!570357 () Bool)

(declare-fun res!360277 () Bool)

(assert (=> b!570357 (=> (not res!360277) (not e!328009))))

(assert (=> b!570357 (= res!360277 (validKeyInArray!0 k0!1914))))

(declare-fun lt!259900 () SeekEntryResult!5611)

(declare-fun e!328011 () Bool)

(declare-fun b!570358 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35749 (_ BitVec 32)) SeekEntryResult!5611)

(assert (=> b!570358 (= e!328011 (= lt!259900 (seekKeyOrZeroReturnVacant!0 (x!53554 lt!259899) (index!24673 lt!259899) (index!24673 lt!259899) (select (arr!17165 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570359 () Bool)

(assert (=> b!570359 (= e!328012 (not true))))

(declare-fun e!328014 () Bool)

(assert (=> b!570359 e!328014))

(declare-fun res!360274 () Bool)

(assert (=> b!570359 (=> (not res!360274) (not e!328014))))

(assert (=> b!570359 (= res!360274 (= lt!259900 (Found!5611 j!142)))))

(assert (=> b!570359 (= lt!259900 (seekEntryOrOpen!0 (select (arr!17165 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570359 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17910 0))(
  ( (Unit!17911) )
))
(declare-fun lt!259903 () Unit!17910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17910)

(assert (=> b!570359 (= lt!259903 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570360 () Bool)

(declare-fun res!360278 () Bool)

(assert (=> b!570360 (=> (not res!360278) (not e!328009))))

(declare-fun arrayContainsKey!0 (array!35749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570360 (= res!360278 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570361 () Bool)

(assert (=> b!570361 (= e!328014 e!328011)))

(declare-fun res!360276 () Bool)

(assert (=> b!570361 (=> res!360276 e!328011)))

(get-info :version)

(assert (=> b!570361 (= res!360276 (or (undefined!6423 lt!259899) (not ((_ is Intermediate!5611) lt!259899)) (= (select (arr!17165 a!3118) (index!24673 lt!259899)) (select (arr!17165 a!3118) j!142)) (= (select (arr!17165 a!3118) (index!24673 lt!259899)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!52280 res!360284) b!570351))

(assert (= (and b!570351 res!360283) b!570354))

(assert (= (and b!570354 res!360279) b!570357))

(assert (= (and b!570357 res!360277) b!570360))

(assert (= (and b!570360 res!360278) b!570353))

(assert (= (and b!570353 res!360275) b!570352))

(assert (= (and b!570352 res!360280) b!570356))

(assert (= (and b!570356 res!360281) b!570355))

(assert (= (and b!570355 res!360282) b!570359))

(assert (= (and b!570359 res!360274) b!570361))

(assert (= (and b!570361 (not res!360276)) b!570358))

(declare-fun m!548717 () Bool)

(assert (=> b!570353 m!548717))

(declare-fun m!548719 () Bool)

(assert (=> b!570352 m!548719))

(declare-fun m!548721 () Bool)

(assert (=> b!570355 m!548721))

(declare-fun m!548723 () Bool)

(assert (=> b!570355 m!548723))

(declare-fun m!548725 () Bool)

(assert (=> b!570355 m!548725))

(assert (=> b!570355 m!548721))

(declare-fun m!548727 () Bool)

(assert (=> b!570355 m!548727))

(assert (=> b!570355 m!548721))

(declare-fun m!548729 () Bool)

(assert (=> b!570355 m!548729))

(assert (=> b!570355 m!548723))

(declare-fun m!548731 () Bool)

(assert (=> b!570355 m!548731))

(assert (=> b!570355 m!548723))

(declare-fun m!548733 () Bool)

(assert (=> b!570355 m!548733))

(declare-fun m!548735 () Bool)

(assert (=> b!570360 m!548735))

(declare-fun m!548737 () Bool)

(assert (=> b!570361 m!548737))

(assert (=> b!570361 m!548721))

(declare-fun m!548739 () Bool)

(assert (=> b!570357 m!548739))

(declare-fun m!548741 () Bool)

(assert (=> b!570356 m!548741))

(assert (=> b!570358 m!548721))

(assert (=> b!570358 m!548721))

(declare-fun m!548743 () Bool)

(assert (=> b!570358 m!548743))

(assert (=> b!570354 m!548721))

(assert (=> b!570354 m!548721))

(declare-fun m!548745 () Bool)

(assert (=> b!570354 m!548745))

(assert (=> b!570359 m!548721))

(assert (=> b!570359 m!548721))

(declare-fun m!548747 () Bool)

(assert (=> b!570359 m!548747))

(declare-fun m!548749 () Bool)

(assert (=> b!570359 m!548749))

(declare-fun m!548751 () Bool)

(assert (=> b!570359 m!548751))

(declare-fun m!548753 () Bool)

(assert (=> start!52280 m!548753))

(declare-fun m!548755 () Bool)

(assert (=> start!52280 m!548755))

(check-sat (not b!570357) (not b!570354) (not b!570355) (not b!570358) (not start!52280) (not b!570352) (not b!570353) (not b!570360) (not b!570356) (not b!570359))
(check-sat)
