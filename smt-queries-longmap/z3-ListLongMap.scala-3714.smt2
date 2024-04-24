; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51126 () Bool)

(assert start!51126)

(declare-fun b!558383 () Bool)

(declare-fun e!321687 () Bool)

(declare-fun e!321686 () Bool)

(assert (=> b!558383 (= e!321687 e!321686)))

(declare-fun res!350146 () Bool)

(assert (=> b!558383 (=> (not res!350146) (not e!321686))))

(declare-datatypes ((SeekEntryResult!5272 0))(
  ( (MissingZero!5272 (index!23315 (_ BitVec 32))) (Found!5272 (index!23316 (_ BitVec 32))) (Intermediate!5272 (undefined!6084 Bool) (index!23317 (_ BitVec 32)) (x!52367 (_ BitVec 32))) (Undefined!5272) (MissingVacant!5272 (index!23318 (_ BitVec 32))) )
))
(declare-fun lt!253752 () SeekEntryResult!5272)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558383 (= res!350146 (or (= lt!253752 (MissingZero!5272 i!1132)) (= lt!253752 (MissingVacant!5272 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35127 0))(
  ( (array!35128 (arr!16867 (Array (_ BitVec 32) (_ BitVec 64))) (size!17231 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35127)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35127 (_ BitVec 32)) SeekEntryResult!5272)

(assert (=> b!558383 (= lt!253752 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558384 () Bool)

(declare-fun e!321685 () Bool)

(assert (=> b!558384 (= e!321686 e!321685)))

(declare-fun res!350149 () Bool)

(assert (=> b!558384 (=> (not res!350149) (not e!321685))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!253753 () (_ BitVec 32))

(declare-fun lt!253751 () SeekEntryResult!5272)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35127 (_ BitVec 32)) SeekEntryResult!5272)

(assert (=> b!558384 (= res!350149 (= lt!253751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253753 (select (store (arr!16867 a!3118) i!1132 k0!1914) j!142) (array!35128 (store (arr!16867 a!3118) i!1132 k0!1914) (size!17231 a!3118)) mask!3119)))))

(declare-fun lt!253756 () (_ BitVec 32))

(assert (=> b!558384 (= lt!253751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253756 (select (arr!16867 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558384 (= lt!253753 (toIndex!0 (select (store (arr!16867 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558384 (= lt!253756 (toIndex!0 (select (arr!16867 a!3118) j!142) mask!3119))))

(declare-fun b!558385 () Bool)

(declare-fun res!350145 () Bool)

(assert (=> b!558385 (=> (not res!350145) (not e!321686))))

(declare-datatypes ((List!10854 0))(
  ( (Nil!10851) (Cons!10850 (h!11847 (_ BitVec 64)) (t!17074 List!10854)) )
))
(declare-fun arrayNoDuplicates!0 (array!35127 (_ BitVec 32) List!10854) Bool)

(assert (=> b!558385 (= res!350145 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10851))))

(declare-fun b!558386 () Bool)

(declare-fun res!350141 () Bool)

(assert (=> b!558386 (=> (not res!350141) (not e!321686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35127 (_ BitVec 32)) Bool)

(assert (=> b!558386 (= res!350141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun lt!253755 () SeekEntryResult!5272)

(declare-fun e!321689 () Bool)

(declare-fun b!558387 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35127 (_ BitVec 32)) SeekEntryResult!5272)

(assert (=> b!558387 (= e!321689 (= lt!253755 (seekKeyOrZeroReturnVacant!0 (x!52367 lt!253751) (index!23317 lt!253751) (index!23317 lt!253751) (select (arr!16867 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558389 () Bool)

(declare-fun res!350147 () Bool)

(assert (=> b!558389 (=> (not res!350147) (not e!321687))))

(assert (=> b!558389 (= res!350147 (and (= (size!17231 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17231 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17231 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558390 () Bool)

(declare-fun res!350148 () Bool)

(assert (=> b!558390 (=> (not res!350148) (not e!321687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558390 (= res!350148 (validKeyInArray!0 (select (arr!16867 a!3118) j!142)))))

(declare-fun b!558391 () Bool)

(declare-fun res!350151 () Bool)

(assert (=> b!558391 (=> (not res!350151) (not e!321687))))

(assert (=> b!558391 (= res!350151 (validKeyInArray!0 k0!1914))))

(declare-fun b!558392 () Bool)

(declare-fun res!350143 () Bool)

(assert (=> b!558392 (=> (not res!350143) (not e!321687))))

(declare-fun arrayContainsKey!0 (array!35127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558392 (= res!350143 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558388 () Bool)

(declare-fun e!321688 () Bool)

(assert (=> b!558388 (= e!321685 (not e!321688))))

(declare-fun res!350152 () Bool)

(assert (=> b!558388 (=> res!350152 e!321688)))

(get-info :version)

(assert (=> b!558388 (= res!350152 (or (undefined!6084 lt!253751) (not ((_ is Intermediate!5272) lt!253751)) (= (select (arr!16867 a!3118) (index!23317 lt!253751)) (select (arr!16867 a!3118) j!142)) (= (select (arr!16867 a!3118) (index!23317 lt!253751)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!321684 () Bool)

(assert (=> b!558388 e!321684))

(declare-fun res!350142 () Bool)

(assert (=> b!558388 (=> (not res!350142) (not e!321684))))

(assert (=> b!558388 (= res!350142 (= lt!253755 (Found!5272 j!142)))))

(assert (=> b!558388 (= lt!253755 (seekEntryOrOpen!0 (select (arr!16867 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558388 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17389 0))(
  ( (Unit!17390) )
))
(declare-fun lt!253754 () Unit!17389)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17389)

(assert (=> b!558388 (= lt!253754 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!350144 () Bool)

(assert (=> start!51126 (=> (not res!350144) (not e!321687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51126 (= res!350144 (validMask!0 mask!3119))))

(assert (=> start!51126 e!321687))

(assert (=> start!51126 true))

(declare-fun array_inv!12726 (array!35127) Bool)

(assert (=> start!51126 (array_inv!12726 a!3118)))

(declare-fun b!558393 () Bool)

(assert (=> b!558393 (= e!321684 e!321689)))

(declare-fun res!350150 () Bool)

(assert (=> b!558393 (=> res!350150 e!321689)))

(assert (=> b!558393 (= res!350150 (or (undefined!6084 lt!253751) (not ((_ is Intermediate!5272) lt!253751)) (= (select (arr!16867 a!3118) (index!23317 lt!253751)) (select (arr!16867 a!3118) j!142)) (= (select (arr!16867 a!3118) (index!23317 lt!253751)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558394 () Bool)

(assert (=> b!558394 (= e!321688 (validKeyInArray!0 (select (store (arr!16867 a!3118) i!1132 k0!1914) j!142)))))

(assert (= (and start!51126 res!350144) b!558389))

(assert (= (and b!558389 res!350147) b!558390))

(assert (= (and b!558390 res!350148) b!558391))

(assert (= (and b!558391 res!350151) b!558392))

(assert (= (and b!558392 res!350143) b!558383))

(assert (= (and b!558383 res!350146) b!558386))

(assert (= (and b!558386 res!350141) b!558385))

(assert (= (and b!558385 res!350145) b!558384))

(assert (= (and b!558384 res!350149) b!558388))

(assert (= (and b!558388 res!350142) b!558393))

(assert (= (and b!558393 (not res!350150)) b!558387))

(assert (= (and b!558388 (not res!350152)) b!558394))

(declare-fun m!536447 () Bool)

(assert (=> start!51126 m!536447))

(declare-fun m!536449 () Bool)

(assert (=> start!51126 m!536449))

(declare-fun m!536451 () Bool)

(assert (=> b!558387 m!536451))

(assert (=> b!558387 m!536451))

(declare-fun m!536453 () Bool)

(assert (=> b!558387 m!536453))

(declare-fun m!536455 () Bool)

(assert (=> b!558383 m!536455))

(declare-fun m!536457 () Bool)

(assert (=> b!558392 m!536457))

(assert (=> b!558384 m!536451))

(declare-fun m!536459 () Bool)

(assert (=> b!558384 m!536459))

(assert (=> b!558384 m!536451))

(declare-fun m!536461 () Bool)

(assert (=> b!558384 m!536461))

(assert (=> b!558384 m!536451))

(declare-fun m!536463 () Bool)

(assert (=> b!558384 m!536463))

(declare-fun m!536465 () Bool)

(assert (=> b!558384 m!536465))

(assert (=> b!558384 m!536461))

(declare-fun m!536467 () Bool)

(assert (=> b!558384 m!536467))

(assert (=> b!558384 m!536461))

(declare-fun m!536469 () Bool)

(assert (=> b!558384 m!536469))

(assert (=> b!558390 m!536451))

(assert (=> b!558390 m!536451))

(declare-fun m!536471 () Bool)

(assert (=> b!558390 m!536471))

(declare-fun m!536473 () Bool)

(assert (=> b!558393 m!536473))

(assert (=> b!558393 m!536451))

(declare-fun m!536475 () Bool)

(assert (=> b!558385 m!536475))

(declare-fun m!536477 () Bool)

(assert (=> b!558391 m!536477))

(declare-fun m!536479 () Bool)

(assert (=> b!558386 m!536479))

(assert (=> b!558388 m!536451))

(assert (=> b!558388 m!536473))

(declare-fun m!536481 () Bool)

(assert (=> b!558388 m!536481))

(declare-fun m!536483 () Bool)

(assert (=> b!558388 m!536483))

(assert (=> b!558388 m!536451))

(declare-fun m!536485 () Bool)

(assert (=> b!558388 m!536485))

(assert (=> b!558394 m!536465))

(assert (=> b!558394 m!536461))

(assert (=> b!558394 m!536461))

(declare-fun m!536487 () Bool)

(assert (=> b!558394 m!536487))

(check-sat (not b!558384) (not b!558392) (not b!558388) (not start!51126) (not b!558383) (not b!558385) (not b!558386) (not b!558387) (not b!558390) (not b!558394) (not b!558391))
(check-sat)
