; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51094 () Bool)

(assert start!51094)

(declare-fun b!558421 () Bool)

(declare-fun res!350291 () Bool)

(declare-fun e!321690 () Bool)

(assert (=> b!558421 (=> (not res!350291) (not e!321690))))

(declare-datatypes ((array!35148 0))(
  ( (array!35149 (arr!16879 (Array (_ BitVec 32) (_ BitVec 64))) (size!17243 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35148)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35148 (_ BitVec 32)) Bool)

(assert (=> b!558421 (= res!350291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558422 () Bool)

(declare-fun res!350285 () Bool)

(declare-fun e!321693 () Bool)

(assert (=> b!558422 (=> (not res!350285) (not e!321693))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558422 (= res!350285 (and (= (size!17243 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17243 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17243 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558423 () Bool)

(declare-datatypes ((SeekEntryResult!5328 0))(
  ( (MissingZero!5328 (index!23539 (_ BitVec 32))) (Found!5328 (index!23540 (_ BitVec 32))) (Intermediate!5328 (undefined!6140 Bool) (index!23541 (_ BitVec 32)) (x!52436 (_ BitVec 32))) (Undefined!5328) (MissingVacant!5328 (index!23542 (_ BitVec 32))) )
))
(declare-fun lt!253771 () SeekEntryResult!5328)

(declare-fun e!321692 () Bool)

(declare-fun lt!253767 () SeekEntryResult!5328)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35148 (_ BitVec 32)) SeekEntryResult!5328)

(assert (=> b!558423 (= e!321692 (= lt!253767 (seekKeyOrZeroReturnVacant!0 (x!52436 lt!253771) (index!23541 lt!253771) (index!23541 lt!253771) (select (arr!16879 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558424 () Bool)

(declare-fun res!350288 () Bool)

(assert (=> b!558424 (=> (not res!350288) (not e!321693))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558424 (= res!350288 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558425 () Bool)

(declare-fun e!321689 () Bool)

(assert (=> b!558425 (= e!321689 e!321692)))

(declare-fun res!350284 () Bool)

(assert (=> b!558425 (=> res!350284 e!321692)))

(get-info :version)

(assert (=> b!558425 (= res!350284 (or (undefined!6140 lt!253771) (not ((_ is Intermediate!5328) lt!253771)) (= (select (arr!16879 a!3118) (index!23541 lt!253771)) (select (arr!16879 a!3118) j!142)) (= (select (arr!16879 a!3118) (index!23541 lt!253771)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!321691 () Bool)

(declare-fun b!558426 () Bool)

(assert (=> b!558426 (= e!321691 (not (or (undefined!6140 lt!253771) (not ((_ is Intermediate!5328) lt!253771)) (= (select (arr!16879 a!3118) (index!23541 lt!253771)) (select (arr!16879 a!3118) j!142)) (= (select (arr!16879 a!3118) (index!23541 lt!253771)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!558426 e!321689))

(declare-fun res!350289 () Bool)

(assert (=> b!558426 (=> (not res!350289) (not e!321689))))

(assert (=> b!558426 (= res!350289 (= lt!253767 (Found!5328 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35148 (_ BitVec 32)) SeekEntryResult!5328)

(assert (=> b!558426 (= lt!253767 (seekEntryOrOpen!0 (select (arr!16879 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558426 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17430 0))(
  ( (Unit!17431) )
))
(declare-fun lt!253769 () Unit!17430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17430)

(assert (=> b!558426 (= lt!253769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558427 () Bool)

(assert (=> b!558427 (= e!321693 e!321690)))

(declare-fun res!350292 () Bool)

(assert (=> b!558427 (=> (not res!350292) (not e!321690))))

(declare-fun lt!253770 () SeekEntryResult!5328)

(assert (=> b!558427 (= res!350292 (or (= lt!253770 (MissingZero!5328 i!1132)) (= lt!253770 (MissingVacant!5328 i!1132))))))

(assert (=> b!558427 (= lt!253770 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558428 () Bool)

(assert (=> b!558428 (= e!321690 e!321691)))

(declare-fun res!350290 () Bool)

(assert (=> b!558428 (=> (not res!350290) (not e!321691))))

(declare-fun lt!253766 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35148 (_ BitVec 32)) SeekEntryResult!5328)

(assert (=> b!558428 (= res!350290 (= lt!253771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253766 (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) (array!35149 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118)) mask!3119)))))

(declare-fun lt!253768 () (_ BitVec 32))

(assert (=> b!558428 (= lt!253771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253768 (select (arr!16879 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558428 (= lt!253766 (toIndex!0 (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558428 (= lt!253768 (toIndex!0 (select (arr!16879 a!3118) j!142) mask!3119))))

(declare-fun b!558429 () Bool)

(declare-fun res!350287 () Bool)

(assert (=> b!558429 (=> (not res!350287) (not e!321690))))

(declare-datatypes ((List!10959 0))(
  ( (Nil!10956) (Cons!10955 (h!11949 (_ BitVec 64)) (t!17187 List!10959)) )
))
(declare-fun arrayNoDuplicates!0 (array!35148 (_ BitVec 32) List!10959) Bool)

(assert (=> b!558429 (= res!350287 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10956))))

(declare-fun b!558430 () Bool)

(declare-fun res!350286 () Bool)

(assert (=> b!558430 (=> (not res!350286) (not e!321693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558430 (= res!350286 (validKeyInArray!0 k0!1914))))

(declare-fun res!350293 () Bool)

(assert (=> start!51094 (=> (not res!350293) (not e!321693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51094 (= res!350293 (validMask!0 mask!3119))))

(assert (=> start!51094 e!321693))

(assert (=> start!51094 true))

(declare-fun array_inv!12675 (array!35148) Bool)

(assert (=> start!51094 (array_inv!12675 a!3118)))

(declare-fun b!558431 () Bool)

(declare-fun res!350294 () Bool)

(assert (=> b!558431 (=> (not res!350294) (not e!321693))))

(assert (=> b!558431 (= res!350294 (validKeyInArray!0 (select (arr!16879 a!3118) j!142)))))

(assert (= (and start!51094 res!350293) b!558422))

(assert (= (and b!558422 res!350285) b!558431))

(assert (= (and b!558431 res!350294) b!558430))

(assert (= (and b!558430 res!350286) b!558424))

(assert (= (and b!558424 res!350288) b!558427))

(assert (= (and b!558427 res!350292) b!558421))

(assert (= (and b!558421 res!350291) b!558429))

(assert (= (and b!558429 res!350287) b!558428))

(assert (= (and b!558428 res!350290) b!558426))

(assert (= (and b!558426 res!350289) b!558425))

(assert (= (and b!558425 (not res!350284)) b!558423))

(declare-fun m!536395 () Bool)

(assert (=> b!558430 m!536395))

(declare-fun m!536397 () Bool)

(assert (=> b!558426 m!536397))

(declare-fun m!536399 () Bool)

(assert (=> b!558426 m!536399))

(declare-fun m!536401 () Bool)

(assert (=> b!558426 m!536401))

(declare-fun m!536403 () Bool)

(assert (=> b!558426 m!536403))

(assert (=> b!558426 m!536397))

(declare-fun m!536405 () Bool)

(assert (=> b!558426 m!536405))

(declare-fun m!536407 () Bool)

(assert (=> b!558421 m!536407))

(declare-fun m!536409 () Bool)

(assert (=> start!51094 m!536409))

(declare-fun m!536411 () Bool)

(assert (=> start!51094 m!536411))

(declare-fun m!536413 () Bool)

(assert (=> b!558429 m!536413))

(assert (=> b!558425 m!536401))

(assert (=> b!558425 m!536397))

(assert (=> b!558423 m!536397))

(assert (=> b!558423 m!536397))

(declare-fun m!536415 () Bool)

(assert (=> b!558423 m!536415))

(assert (=> b!558428 m!536397))

(declare-fun m!536417 () Bool)

(assert (=> b!558428 m!536417))

(assert (=> b!558428 m!536397))

(declare-fun m!536419 () Bool)

(assert (=> b!558428 m!536419))

(assert (=> b!558428 m!536397))

(declare-fun m!536421 () Bool)

(assert (=> b!558428 m!536421))

(assert (=> b!558428 m!536419))

(declare-fun m!536423 () Bool)

(assert (=> b!558428 m!536423))

(declare-fun m!536425 () Bool)

(assert (=> b!558428 m!536425))

(assert (=> b!558428 m!536419))

(declare-fun m!536427 () Bool)

(assert (=> b!558428 m!536427))

(declare-fun m!536429 () Bool)

(assert (=> b!558427 m!536429))

(assert (=> b!558431 m!536397))

(assert (=> b!558431 m!536397))

(declare-fun m!536431 () Bool)

(assert (=> b!558431 m!536431))

(declare-fun m!536433 () Bool)

(assert (=> b!558424 m!536433))

(check-sat (not b!558421) (not b!558431) (not b!558424) (not b!558427) (not b!558423) (not start!51094) (not b!558428) (not b!558429) (not b!558430) (not b!558426))
(check-sat)
