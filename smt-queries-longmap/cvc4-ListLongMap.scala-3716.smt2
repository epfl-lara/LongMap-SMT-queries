; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51096 () Bool)

(assert start!51096)

(declare-fun b!558454 () Bool)

(declare-fun e!321709 () Bool)

(declare-fun e!321707 () Bool)

(assert (=> b!558454 (= e!321709 e!321707)))

(declare-fun res!350320 () Bool)

(assert (=> b!558454 (=> (not res!350320) (not e!321707))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5329 0))(
  ( (MissingZero!5329 (index!23543 (_ BitVec 32))) (Found!5329 (index!23544 (_ BitVec 32))) (Intermediate!5329 (undefined!6141 Bool) (index!23545 (_ BitVec 32)) (x!52437 (_ BitVec 32))) (Undefined!5329) (MissingVacant!5329 (index!23546 (_ BitVec 32))) )
))
(declare-fun lt!253785 () SeekEntryResult!5329)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!253784 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35150 0))(
  ( (array!35151 (arr!16880 (Array (_ BitVec 32) (_ BitVec 64))) (size!17244 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35150)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35150 (_ BitVec 32)) SeekEntryResult!5329)

(assert (=> b!558454 (= res!350320 (= lt!253785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253784 (select (store (arr!16880 a!3118) i!1132 k!1914) j!142) (array!35151 (store (arr!16880 a!3118) i!1132 k!1914) (size!17244 a!3118)) mask!3119)))))

(declare-fun lt!253786 () (_ BitVec 32))

(assert (=> b!558454 (= lt!253785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253786 (select (arr!16880 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558454 (= lt!253784 (toIndex!0 (select (store (arr!16880 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558454 (= lt!253786 (toIndex!0 (select (arr!16880 a!3118) j!142) mask!3119))))

(declare-fun b!558455 () Bool)

(declare-fun res!350325 () Bool)

(declare-fun e!321711 () Bool)

(assert (=> b!558455 (=> (not res!350325) (not e!321711))))

(assert (=> b!558455 (= res!350325 (and (= (size!17244 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17244 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17244 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558457 () Bool)

(declare-fun lt!253789 () SeekEntryResult!5329)

(declare-fun e!321710 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35150 (_ BitVec 32)) SeekEntryResult!5329)

(assert (=> b!558457 (= e!321710 (= lt!253789 (seekKeyOrZeroReturnVacant!0 (x!52437 lt!253785) (index!23545 lt!253785) (index!23545 lt!253785) (select (arr!16880 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558458 () Bool)

(assert (=> b!558458 (= e!321707 (not (or (undefined!6141 lt!253785) (not (is-Intermediate!5329 lt!253785)) (= (select (arr!16880 a!3118) (index!23545 lt!253785)) (select (arr!16880 a!3118) j!142)) (= (select (arr!16880 a!3118) (index!23545 lt!253785)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!321708 () Bool)

(assert (=> b!558458 e!321708))

(declare-fun res!350319 () Bool)

(assert (=> b!558458 (=> (not res!350319) (not e!321708))))

(assert (=> b!558458 (= res!350319 (= lt!253789 (Found!5329 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35150 (_ BitVec 32)) SeekEntryResult!5329)

(assert (=> b!558458 (= lt!253789 (seekEntryOrOpen!0 (select (arr!16880 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35150 (_ BitVec 32)) Bool)

(assert (=> b!558458 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17432 0))(
  ( (Unit!17433) )
))
(declare-fun lt!253787 () Unit!17432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17432)

(assert (=> b!558458 (= lt!253787 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558459 () Bool)

(declare-fun res!350327 () Bool)

(assert (=> b!558459 (=> (not res!350327) (not e!321711))))

(declare-fun arrayContainsKey!0 (array!35150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558459 (= res!350327 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558460 () Bool)

(declare-fun res!350318 () Bool)

(assert (=> b!558460 (=> (not res!350318) (not e!321711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558460 (= res!350318 (validKeyInArray!0 (select (arr!16880 a!3118) j!142)))))

(declare-fun b!558461 () Bool)

(assert (=> b!558461 (= e!321711 e!321709)))

(declare-fun res!350326 () Bool)

(assert (=> b!558461 (=> (not res!350326) (not e!321709))))

(declare-fun lt!253788 () SeekEntryResult!5329)

(assert (=> b!558461 (= res!350326 (or (= lt!253788 (MissingZero!5329 i!1132)) (= lt!253788 (MissingVacant!5329 i!1132))))))

(assert (=> b!558461 (= lt!253788 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558462 () Bool)

(declare-fun res!350321 () Bool)

(assert (=> b!558462 (=> (not res!350321) (not e!321711))))

(assert (=> b!558462 (= res!350321 (validKeyInArray!0 k!1914))))

(declare-fun res!350323 () Bool)

(assert (=> start!51096 (=> (not res!350323) (not e!321711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51096 (= res!350323 (validMask!0 mask!3119))))

(assert (=> start!51096 e!321711))

(assert (=> start!51096 true))

(declare-fun array_inv!12676 (array!35150) Bool)

(assert (=> start!51096 (array_inv!12676 a!3118)))

(declare-fun b!558456 () Bool)

(declare-fun res!350324 () Bool)

(assert (=> b!558456 (=> (not res!350324) (not e!321709))))

(declare-datatypes ((List!10960 0))(
  ( (Nil!10957) (Cons!10956 (h!11950 (_ BitVec 64)) (t!17188 List!10960)) )
))
(declare-fun arrayNoDuplicates!0 (array!35150 (_ BitVec 32) List!10960) Bool)

(assert (=> b!558456 (= res!350324 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10957))))

(declare-fun b!558463 () Bool)

(declare-fun res!350322 () Bool)

(assert (=> b!558463 (=> (not res!350322) (not e!321709))))

(assert (=> b!558463 (= res!350322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558464 () Bool)

(assert (=> b!558464 (= e!321708 e!321710)))

(declare-fun res!350317 () Bool)

(assert (=> b!558464 (=> res!350317 e!321710)))

(assert (=> b!558464 (= res!350317 (or (undefined!6141 lt!253785) (not (is-Intermediate!5329 lt!253785)) (= (select (arr!16880 a!3118) (index!23545 lt!253785)) (select (arr!16880 a!3118) j!142)) (= (select (arr!16880 a!3118) (index!23545 lt!253785)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!51096 res!350323) b!558455))

(assert (= (and b!558455 res!350325) b!558460))

(assert (= (and b!558460 res!350318) b!558462))

(assert (= (and b!558462 res!350321) b!558459))

(assert (= (and b!558459 res!350327) b!558461))

(assert (= (and b!558461 res!350326) b!558463))

(assert (= (and b!558463 res!350322) b!558456))

(assert (= (and b!558456 res!350324) b!558454))

(assert (= (and b!558454 res!350320) b!558458))

(assert (= (and b!558458 res!350319) b!558464))

(assert (= (and b!558464 (not res!350317)) b!558457))

(declare-fun m!536435 () Bool)

(assert (=> start!51096 m!536435))

(declare-fun m!536437 () Bool)

(assert (=> start!51096 m!536437))

(declare-fun m!536439 () Bool)

(assert (=> b!558459 m!536439))

(declare-fun m!536441 () Bool)

(assert (=> b!558460 m!536441))

(assert (=> b!558460 m!536441))

(declare-fun m!536443 () Bool)

(assert (=> b!558460 m!536443))

(declare-fun m!536445 () Bool)

(assert (=> b!558456 m!536445))

(assert (=> b!558458 m!536441))

(declare-fun m!536447 () Bool)

(assert (=> b!558458 m!536447))

(declare-fun m!536449 () Bool)

(assert (=> b!558458 m!536449))

(declare-fun m!536451 () Bool)

(assert (=> b!558458 m!536451))

(assert (=> b!558458 m!536441))

(declare-fun m!536453 () Bool)

(assert (=> b!558458 m!536453))

(declare-fun m!536455 () Bool)

(assert (=> b!558463 m!536455))

(declare-fun m!536457 () Bool)

(assert (=> b!558462 m!536457))

(assert (=> b!558457 m!536441))

(assert (=> b!558457 m!536441))

(declare-fun m!536459 () Bool)

(assert (=> b!558457 m!536459))

(assert (=> b!558454 m!536441))

(declare-fun m!536461 () Bool)

(assert (=> b!558454 m!536461))

(assert (=> b!558454 m!536441))

(declare-fun m!536463 () Bool)

(assert (=> b!558454 m!536463))

(assert (=> b!558454 m!536441))

(declare-fun m!536465 () Bool)

(assert (=> b!558454 m!536465))

(declare-fun m!536467 () Bool)

(assert (=> b!558454 m!536467))

(assert (=> b!558454 m!536463))

(declare-fun m!536469 () Bool)

(assert (=> b!558454 m!536469))

(assert (=> b!558454 m!536463))

(declare-fun m!536471 () Bool)

(assert (=> b!558454 m!536471))

(assert (=> b!558464 m!536449))

(assert (=> b!558464 m!536441))

(declare-fun m!536473 () Bool)

(assert (=> b!558461 m!536473))

(push 1)

(assert (not b!558454))

(assert (not b!558462))

(assert (not b!558461))

(assert (not b!558456))

(assert (not b!558460))

(assert (not b!558459))

(assert (not b!558463))

(assert (not start!51096))

(assert (not b!558458))

(assert (not b!558457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

