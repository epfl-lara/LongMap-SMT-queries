; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51490 () Bool)

(assert start!51490)

(declare-fun b!563183 () Bool)

(declare-fun e!324575 () Bool)

(declare-fun e!324574 () Bool)

(assert (=> b!563183 (= e!324575 e!324574)))

(declare-fun res!354342 () Bool)

(assert (=> b!563183 (=> (not res!354342) (not e!324574))))

(declare-fun lt!257113 () (_ BitVec 64))

(declare-datatypes ((array!35355 0))(
  ( (array!35356 (arr!16978 (Array (_ BitVec 32) (_ BitVec 64))) (size!17342 (_ BitVec 32))) )
))
(declare-fun lt!257112 () array!35355)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5427 0))(
  ( (MissingZero!5427 (index!23935 (_ BitVec 32))) (Found!5427 (index!23936 (_ BitVec 32))) (Intermediate!5427 (undefined!6239 Bool) (index!23937 (_ BitVec 32)) (x!52826 (_ BitVec 32))) (Undefined!5427) (MissingVacant!5427 (index!23938 (_ BitVec 32))) )
))
(declare-fun lt!257104 () SeekEntryResult!5427)

(declare-fun lt!257106 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35355 (_ BitVec 32)) SeekEntryResult!5427)

(assert (=> b!563183 (= res!354342 (= lt!257104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257106 lt!257113 lt!257112 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun a!3118 () array!35355)

(declare-fun lt!257109 () (_ BitVec 32))

(assert (=> b!563183 (= lt!257104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257109 (select (arr!16978 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563183 (= lt!257106 (toIndex!0 lt!257113 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563183 (= lt!257113 (select (store (arr!16978 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!563183 (= lt!257109 (toIndex!0 (select (arr!16978 a!3118) j!142) mask!3119))))

(assert (=> b!563183 (= lt!257112 (array!35356 (store (arr!16978 a!3118) i!1132 k0!1914) (size!17342 a!3118)))))

(declare-fun b!563184 () Bool)

(declare-fun res!354341 () Bool)

(declare-fun e!324576 () Bool)

(assert (=> b!563184 (=> (not res!354341) (not e!324576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563184 (= res!354341 (validKeyInArray!0 (select (arr!16978 a!3118) j!142)))))

(declare-fun b!563185 () Bool)

(declare-fun e!324571 () Bool)

(assert (=> b!563185 (= e!324574 (not e!324571))))

(declare-fun res!354346 () Bool)

(assert (=> b!563185 (=> res!354346 e!324571)))

(get-info :version)

(assert (=> b!563185 (= res!354346 (or (undefined!6239 lt!257104) (not ((_ is Intermediate!5427) lt!257104))))))

(declare-fun lt!257100 () SeekEntryResult!5427)

(declare-fun lt!257105 () SeekEntryResult!5427)

(assert (=> b!563185 (= lt!257100 lt!257105)))

(assert (=> b!563185 (= lt!257105 (Found!5427 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35355 (_ BitVec 32)) SeekEntryResult!5427)

(assert (=> b!563185 (= lt!257100 (seekEntryOrOpen!0 (select (arr!16978 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35355 (_ BitVec 32)) Bool)

(assert (=> b!563185 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17628 0))(
  ( (Unit!17629) )
))
(declare-fun lt!257103 () Unit!17628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17628)

(assert (=> b!563185 (= lt!257103 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563186 () Bool)

(declare-fun e!324570 () Bool)

(declare-fun e!324569 () Bool)

(assert (=> b!563186 (= e!324570 e!324569)))

(declare-fun res!354335 () Bool)

(assert (=> b!563186 (=> res!354335 e!324569)))

(assert (=> b!563186 (= res!354335 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun lt!257110 () SeekEntryResult!5427)

(declare-fun lt!257107 () SeekEntryResult!5427)

(assert (=> b!563186 (= lt!257110 lt!257107)))

(declare-fun lt!257102 () Unit!17628)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17628)

(assert (=> b!563186 (= lt!257102 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52826 lt!257104) (index!23937 lt!257104) (index!23937 lt!257104) mask!3119))))

(declare-fun b!563187 () Bool)

(declare-fun res!354345 () Bool)

(assert (=> b!563187 (=> (not res!354345) (not e!324575))))

(assert (=> b!563187 (= res!354345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!354336 () Bool)

(assert (=> start!51490 (=> (not res!354336) (not e!324576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51490 (= res!354336 (validMask!0 mask!3119))))

(assert (=> start!51490 e!324576))

(assert (=> start!51490 true))

(declare-fun array_inv!12774 (array!35355) Bool)

(assert (=> start!51490 (array_inv!12774 a!3118)))

(declare-fun b!563188 () Bool)

(declare-fun e!324573 () Bool)

(assert (=> b!563188 (= e!324573 e!324570)))

(declare-fun res!354338 () Bool)

(assert (=> b!563188 (=> res!354338 e!324570)))

(declare-fun lt!257101 () (_ BitVec 64))

(assert (=> b!563188 (= res!354338 (or (bvslt (index!23937 lt!257104) #b00000000000000000000000000000000) (bvsge (index!23937 lt!257104) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52826 lt!257104) #b01111111111111111111111111111110) (bvslt (x!52826 lt!257104) #b00000000000000000000000000000000) (not (= lt!257101 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16978 a!3118) i!1132 k0!1914) (index!23937 lt!257104)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!257110 lt!257105))))))

(declare-fun lt!257111 () SeekEntryResult!5427)

(assert (=> b!563188 (= lt!257111 lt!257107)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35355 (_ BitVec 32)) SeekEntryResult!5427)

(assert (=> b!563188 (= lt!257107 (seekKeyOrZeroReturnVacant!0 (x!52826 lt!257104) (index!23937 lt!257104) (index!23937 lt!257104) lt!257113 lt!257112 mask!3119))))

(assert (=> b!563188 (= lt!257111 (seekEntryOrOpen!0 lt!257113 lt!257112 mask!3119))))

(assert (=> b!563188 (= lt!257100 lt!257110)))

(assert (=> b!563188 (= lt!257110 (seekKeyOrZeroReturnVacant!0 (x!52826 lt!257104) (index!23937 lt!257104) (index!23937 lt!257104) (select (arr!16978 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!563189 () Bool)

(assert (=> b!563189 (= e!324576 e!324575)))

(declare-fun res!354337 () Bool)

(assert (=> b!563189 (=> (not res!354337) (not e!324575))))

(declare-fun lt!257108 () SeekEntryResult!5427)

(assert (=> b!563189 (= res!354337 (or (= lt!257108 (MissingZero!5427 i!1132)) (= lt!257108 (MissingVacant!5427 i!1132))))))

(assert (=> b!563189 (= lt!257108 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563190 () Bool)

(declare-fun res!354343 () Bool)

(assert (=> b!563190 (=> (not res!354343) (not e!324575))))

(declare-datatypes ((List!11058 0))(
  ( (Nil!11055) (Cons!11054 (h!12057 (_ BitVec 64)) (t!17286 List!11058)) )
))
(declare-fun arrayNoDuplicates!0 (array!35355 (_ BitVec 32) List!11058) Bool)

(assert (=> b!563190 (= res!354343 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11055))))

(declare-fun b!563191 () Bool)

(declare-fun res!354344 () Bool)

(assert (=> b!563191 (=> (not res!354344) (not e!324576))))

(assert (=> b!563191 (= res!354344 (and (= (size!17342 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17342 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17342 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563192 () Bool)

(assert (=> b!563192 (= e!324571 e!324573)))

(declare-fun res!354347 () Bool)

(assert (=> b!563192 (=> res!354347 e!324573)))

(assert (=> b!563192 (= res!354347 (or (= lt!257101 (select (arr!16978 a!3118) j!142)) (= lt!257101 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563192 (= lt!257101 (select (arr!16978 a!3118) (index!23937 lt!257104)))))

(declare-fun b!563193 () Bool)

(declare-fun res!354339 () Bool)

(assert (=> b!563193 (=> (not res!354339) (not e!324576))))

(declare-fun arrayContainsKey!0 (array!35355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563193 (= res!354339 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563194 () Bool)

(declare-fun res!354340 () Bool)

(assert (=> b!563194 (=> (not res!354340) (not e!324576))))

(assert (=> b!563194 (= res!354340 (validKeyInArray!0 k0!1914))))

(declare-fun b!563195 () Bool)

(assert (=> b!563195 (= e!324569 (validKeyInArray!0 lt!257113))))

(assert (= (and start!51490 res!354336) b!563191))

(assert (= (and b!563191 res!354344) b!563184))

(assert (= (and b!563184 res!354341) b!563194))

(assert (= (and b!563194 res!354340) b!563193))

(assert (= (and b!563193 res!354339) b!563189))

(assert (= (and b!563189 res!354337) b!563187))

(assert (= (and b!563187 res!354345) b!563190))

(assert (= (and b!563190 res!354343) b!563183))

(assert (= (and b!563183 res!354342) b!563185))

(assert (= (and b!563185 (not res!354346)) b!563192))

(assert (= (and b!563192 (not res!354347)) b!563188))

(assert (= (and b!563188 (not res!354338)) b!563186))

(assert (= (and b!563186 (not res!354335)) b!563195))

(declare-fun m!541463 () Bool)

(assert (=> b!563192 m!541463))

(declare-fun m!541465 () Bool)

(assert (=> b!563192 m!541465))

(assert (=> b!563184 m!541463))

(assert (=> b!563184 m!541463))

(declare-fun m!541467 () Bool)

(assert (=> b!563184 m!541467))

(declare-fun m!541469 () Bool)

(assert (=> start!51490 m!541469))

(declare-fun m!541471 () Bool)

(assert (=> start!51490 m!541471))

(assert (=> b!563188 m!541463))

(assert (=> b!563188 m!541463))

(declare-fun m!541473 () Bool)

(assert (=> b!563188 m!541473))

(declare-fun m!541475 () Bool)

(assert (=> b!563188 m!541475))

(declare-fun m!541477 () Bool)

(assert (=> b!563188 m!541477))

(declare-fun m!541479 () Bool)

(assert (=> b!563188 m!541479))

(declare-fun m!541481 () Bool)

(assert (=> b!563188 m!541481))

(declare-fun m!541483 () Bool)

(assert (=> b!563186 m!541483))

(declare-fun m!541485 () Bool)

(assert (=> b!563190 m!541485))

(declare-fun m!541487 () Bool)

(assert (=> b!563194 m!541487))

(assert (=> b!563185 m!541463))

(assert (=> b!563185 m!541463))

(declare-fun m!541489 () Bool)

(assert (=> b!563185 m!541489))

(declare-fun m!541491 () Bool)

(assert (=> b!563185 m!541491))

(declare-fun m!541493 () Bool)

(assert (=> b!563185 m!541493))

(assert (=> b!563183 m!541463))

(declare-fun m!541495 () Bool)

(assert (=> b!563183 m!541495))

(assert (=> b!563183 m!541463))

(declare-fun m!541497 () Bool)

(assert (=> b!563183 m!541497))

(assert (=> b!563183 m!541463))

(declare-fun m!541499 () Bool)

(assert (=> b!563183 m!541499))

(declare-fun m!541501 () Bool)

(assert (=> b!563183 m!541501))

(declare-fun m!541503 () Bool)

(assert (=> b!563183 m!541503))

(assert (=> b!563183 m!541481))

(declare-fun m!541505 () Bool)

(assert (=> b!563193 m!541505))

(declare-fun m!541507 () Bool)

(assert (=> b!563187 m!541507))

(declare-fun m!541509 () Bool)

(assert (=> b!563195 m!541509))

(declare-fun m!541511 () Bool)

(assert (=> b!563189 m!541511))

(check-sat (not start!51490) (not b!563184) (not b!563193) (not b!563195) (not b!563185) (not b!563188) (not b!563194) (not b!563190) (not b!563189) (not b!563186) (not b!563183) (not b!563187))
(check-sat)
