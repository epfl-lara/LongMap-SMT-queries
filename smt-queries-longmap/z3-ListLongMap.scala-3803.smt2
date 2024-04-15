; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52160 () Bool)

(assert start!52160)

(declare-fun b!569210 () Bool)

(declare-fun res!359371 () Bool)

(declare-fun e!327425 () Bool)

(assert (=> b!569210 (=> (not res!359371) (not e!327425))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35692 0))(
  ( (array!35693 (arr!17138 (Array (_ BitVec 32) (_ BitVec 64))) (size!17503 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35692)

(assert (=> b!569210 (= res!359371 (and (= (size!17503 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17503 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17503 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569211 () Bool)

(declare-fun e!327424 () Bool)

(declare-fun e!327426 () Bool)

(assert (=> b!569211 (= e!327424 e!327426)))

(declare-fun res!359377 () Bool)

(assert (=> b!569211 (=> (not res!359377) (not e!327426))))

(declare-datatypes ((SeekEntryResult!5584 0))(
  ( (MissingZero!5584 (index!24563 (_ BitVec 32))) (Found!5584 (index!24564 (_ BitVec 32))) (Intermediate!5584 (undefined!6396 Bool) (index!24565 (_ BitVec 32)) (x!53446 (_ BitVec 32))) (Undefined!5584) (MissingVacant!5584 (index!24566 (_ BitVec 32))) )
))
(declare-fun lt!259338 () SeekEntryResult!5584)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!259340 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35692 (_ BitVec 32)) SeekEntryResult!5584)

(assert (=> b!569211 (= res!359377 (= lt!259338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259340 (select (store (arr!17138 a!3118) i!1132 k0!1914) j!142) (array!35693 (store (arr!17138 a!3118) i!1132 k0!1914) (size!17503 a!3118)) mask!3119)))))

(declare-fun lt!259339 () (_ BitVec 32))

(assert (=> b!569211 (= lt!259338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259339 (select (arr!17138 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569211 (= lt!259340 (toIndex!0 (select (store (arr!17138 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569211 (= lt!259339 (toIndex!0 (select (arr!17138 a!3118) j!142) mask!3119))))

(declare-fun b!569212 () Bool)

(declare-fun res!359376 () Bool)

(assert (=> b!569212 (=> (not res!359376) (not e!327425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569212 (= res!359376 (validKeyInArray!0 k0!1914))))

(declare-fun b!569213 () Bool)

(declare-fun res!359375 () Bool)

(assert (=> b!569213 (=> (not res!359375) (not e!327424))))

(declare-datatypes ((List!11257 0))(
  ( (Nil!11254) (Cons!11253 (h!12274 (_ BitVec 64)) (t!17476 List!11257)) )
))
(declare-fun arrayNoDuplicates!0 (array!35692 (_ BitVec 32) List!11257) Bool)

(assert (=> b!569213 (= res!359375 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11254))))

(declare-fun b!569214 () Bool)

(declare-fun res!359378 () Bool)

(assert (=> b!569214 (=> (not res!359378) (not e!327425))))

(declare-fun arrayContainsKey!0 (array!35692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569214 (= res!359378 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569215 () Bool)

(assert (=> b!569215 (= e!327426 (not true))))

(declare-fun lt!259341 () SeekEntryResult!5584)

(get-info :version)

(assert (=> b!569215 (and (= lt!259341 (Found!5584 j!142)) (or (undefined!6396 lt!259338) (not ((_ is Intermediate!5584) lt!259338)) (= (select (arr!17138 a!3118) (index!24565 lt!259338)) (select (arr!17138 a!3118) j!142)) (not (= (select (arr!17138 a!3118) (index!24565 lt!259338)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259341 (MissingZero!5584 (index!24565 lt!259338)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35692 (_ BitVec 32)) SeekEntryResult!5584)

(assert (=> b!569215 (= lt!259341 (seekEntryOrOpen!0 (select (arr!17138 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35692 (_ BitVec 32)) Bool)

(assert (=> b!569215 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17856 0))(
  ( (Unit!17857) )
))
(declare-fun lt!259342 () Unit!17856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17856)

(assert (=> b!569215 (= lt!259342 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569216 () Bool)

(assert (=> b!569216 (= e!327425 e!327424)))

(declare-fun res!359373 () Bool)

(assert (=> b!569216 (=> (not res!359373) (not e!327424))))

(declare-fun lt!259337 () SeekEntryResult!5584)

(assert (=> b!569216 (= res!359373 (or (= lt!259337 (MissingZero!5584 i!1132)) (= lt!259337 (MissingVacant!5584 i!1132))))))

(assert (=> b!569216 (= lt!259337 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569217 () Bool)

(declare-fun res!359370 () Bool)

(assert (=> b!569217 (=> (not res!359370) (not e!327425))))

(assert (=> b!569217 (= res!359370 (validKeyInArray!0 (select (arr!17138 a!3118) j!142)))))

(declare-fun res!359374 () Bool)

(assert (=> start!52160 (=> (not res!359374) (not e!327425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52160 (= res!359374 (validMask!0 mask!3119))))

(assert (=> start!52160 e!327425))

(assert (=> start!52160 true))

(declare-fun array_inv!13021 (array!35692) Bool)

(assert (=> start!52160 (array_inv!13021 a!3118)))

(declare-fun b!569218 () Bool)

(declare-fun res!359372 () Bool)

(assert (=> b!569218 (=> (not res!359372) (not e!327424))))

(assert (=> b!569218 (= res!359372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52160 res!359374) b!569210))

(assert (= (and b!569210 res!359371) b!569217))

(assert (= (and b!569217 res!359370) b!569212))

(assert (= (and b!569212 res!359376) b!569214))

(assert (= (and b!569214 res!359378) b!569216))

(assert (= (and b!569216 res!359373) b!569218))

(assert (= (and b!569218 res!359372) b!569213))

(assert (= (and b!569213 res!359375) b!569211))

(assert (= (and b!569211 res!359377) b!569215))

(declare-fun m!547457 () Bool)

(assert (=> b!569212 m!547457))

(declare-fun m!547459 () Bool)

(assert (=> b!569214 m!547459))

(declare-fun m!547461 () Bool)

(assert (=> b!569217 m!547461))

(assert (=> b!569217 m!547461))

(declare-fun m!547463 () Bool)

(assert (=> b!569217 m!547463))

(declare-fun m!547465 () Bool)

(assert (=> start!52160 m!547465))

(declare-fun m!547467 () Bool)

(assert (=> start!52160 m!547467))

(assert (=> b!569215 m!547461))

(declare-fun m!547469 () Bool)

(assert (=> b!569215 m!547469))

(declare-fun m!547471 () Bool)

(assert (=> b!569215 m!547471))

(declare-fun m!547473 () Bool)

(assert (=> b!569215 m!547473))

(assert (=> b!569215 m!547461))

(declare-fun m!547475 () Bool)

(assert (=> b!569215 m!547475))

(declare-fun m!547477 () Bool)

(assert (=> b!569216 m!547477))

(assert (=> b!569211 m!547461))

(declare-fun m!547479 () Bool)

(assert (=> b!569211 m!547479))

(declare-fun m!547481 () Bool)

(assert (=> b!569211 m!547481))

(declare-fun m!547483 () Bool)

(assert (=> b!569211 m!547483))

(assert (=> b!569211 m!547461))

(assert (=> b!569211 m!547481))

(assert (=> b!569211 m!547461))

(declare-fun m!547485 () Bool)

(assert (=> b!569211 m!547485))

(declare-fun m!547487 () Bool)

(assert (=> b!569211 m!547487))

(assert (=> b!569211 m!547481))

(declare-fun m!547489 () Bool)

(assert (=> b!569211 m!547489))

(declare-fun m!547491 () Bool)

(assert (=> b!569213 m!547491))

(declare-fun m!547493 () Bool)

(assert (=> b!569218 m!547493))

(check-sat (not b!569216) (not b!569217) (not b!569215) (not b!569218) (not b!569213) (not b!569211) (not b!569214) (not b!569212) (not start!52160))
(check-sat)
