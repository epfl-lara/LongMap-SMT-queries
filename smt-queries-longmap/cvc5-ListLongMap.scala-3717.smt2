; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51098 () Bool)

(assert start!51098)

(declare-fun b!558487 () Bool)

(declare-fun e!321726 () Bool)

(declare-fun e!321729 () Bool)

(assert (=> b!558487 (= e!321726 e!321729)))

(declare-fun res!350350 () Bool)

(assert (=> b!558487 (=> (not res!350350) (not e!321729))))

(declare-datatypes ((SeekEntryResult!5330 0))(
  ( (MissingZero!5330 (index!23547 (_ BitVec 32))) (Found!5330 (index!23548 (_ BitVec 32))) (Intermediate!5330 (undefined!6142 Bool) (index!23549 (_ BitVec 32)) (x!52446 (_ BitVec 32))) (Undefined!5330) (MissingVacant!5330 (index!23550 (_ BitVec 32))) )
))
(declare-fun lt!253803 () SeekEntryResult!5330)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558487 (= res!350350 (or (= lt!253803 (MissingZero!5330 i!1132)) (= lt!253803 (MissingVacant!5330 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35152 0))(
  ( (array!35153 (arr!16881 (Array (_ BitVec 32) (_ BitVec 64))) (size!17245 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35152)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35152 (_ BitVec 32)) SeekEntryResult!5330)

(assert (=> b!558487 (= lt!253803 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558488 () Bool)

(declare-fun res!350356 () Bool)

(assert (=> b!558488 (=> (not res!350356) (not e!321726))))

(declare-fun arrayContainsKey!0 (array!35152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558488 (= res!350356 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!350357 () Bool)

(assert (=> start!51098 (=> (not res!350357) (not e!321726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51098 (= res!350357 (validMask!0 mask!3119))))

(assert (=> start!51098 e!321726))

(assert (=> start!51098 true))

(declare-fun array_inv!12677 (array!35152) Bool)

(assert (=> start!51098 (array_inv!12677 a!3118)))

(declare-fun b!558489 () Bool)

(declare-fun res!350355 () Bool)

(assert (=> b!558489 (=> (not res!350355) (not e!321729))))

(declare-datatypes ((List!10961 0))(
  ( (Nil!10958) (Cons!10957 (h!11951 (_ BitVec 64)) (t!17189 List!10961)) )
))
(declare-fun arrayNoDuplicates!0 (array!35152 (_ BitVec 32) List!10961) Bool)

(assert (=> b!558489 (= res!350355 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10958))))

(declare-fun b!558490 () Bool)

(declare-fun res!350360 () Bool)

(assert (=> b!558490 (=> (not res!350360) (not e!321726))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!558490 (= res!350360 (and (= (size!17245 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17245 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17245 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558491 () Bool)

(declare-fun res!350351 () Bool)

(assert (=> b!558491 (=> (not res!350351) (not e!321729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35152 (_ BitVec 32)) Bool)

(assert (=> b!558491 (= res!350351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558492 () Bool)

(declare-fun res!350352 () Bool)

(assert (=> b!558492 (=> (not res!350352) (not e!321726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558492 (= res!350352 (validKeyInArray!0 k!1914))))

(declare-fun lt!253807 () SeekEntryResult!5330)

(declare-fun b!558493 () Bool)

(declare-fun e!321725 () Bool)

(declare-fun lt!253806 () SeekEntryResult!5330)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35152 (_ BitVec 32)) SeekEntryResult!5330)

(assert (=> b!558493 (= e!321725 (= lt!253806 (seekKeyOrZeroReturnVacant!0 (x!52446 lt!253807) (index!23549 lt!253807) (index!23549 lt!253807) (select (arr!16881 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558494 () Bool)

(declare-fun res!350353 () Bool)

(assert (=> b!558494 (=> (not res!350353) (not e!321726))))

(assert (=> b!558494 (= res!350353 (validKeyInArray!0 (select (arr!16881 a!3118) j!142)))))

(declare-fun b!558495 () Bool)

(declare-fun e!321724 () Bool)

(assert (=> b!558495 (= e!321729 e!321724)))

(declare-fun res!350354 () Bool)

(assert (=> b!558495 (=> (not res!350354) (not e!321724))))

(declare-fun lt!253804 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35152 (_ BitVec 32)) SeekEntryResult!5330)

(assert (=> b!558495 (= res!350354 (= lt!253807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253804 (select (store (arr!16881 a!3118) i!1132 k!1914) j!142) (array!35153 (store (arr!16881 a!3118) i!1132 k!1914) (size!17245 a!3118)) mask!3119)))))

(declare-fun lt!253805 () (_ BitVec 32))

(assert (=> b!558495 (= lt!253807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253805 (select (arr!16881 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558495 (= lt!253804 (toIndex!0 (select (store (arr!16881 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558495 (= lt!253805 (toIndex!0 (select (arr!16881 a!3118) j!142) mask!3119))))

(declare-fun b!558496 () Bool)

(declare-fun e!321728 () Bool)

(assert (=> b!558496 (= e!321728 e!321725)))

(declare-fun res!350359 () Bool)

(assert (=> b!558496 (=> res!350359 e!321725)))

(assert (=> b!558496 (= res!350359 (or (undefined!6142 lt!253807) (not (is-Intermediate!5330 lt!253807)) (= (select (arr!16881 a!3118) (index!23549 lt!253807)) (select (arr!16881 a!3118) j!142)) (= (select (arr!16881 a!3118) (index!23549 lt!253807)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558497 () Bool)

(assert (=> b!558497 (= e!321724 (not true))))

(assert (=> b!558497 e!321728))

(declare-fun res!350358 () Bool)

(assert (=> b!558497 (=> (not res!350358) (not e!321728))))

(assert (=> b!558497 (= res!350358 (= lt!253806 (Found!5330 j!142)))))

(assert (=> b!558497 (= lt!253806 (seekEntryOrOpen!0 (select (arr!16881 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558497 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17434 0))(
  ( (Unit!17435) )
))
(declare-fun lt!253802 () Unit!17434)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17434)

(assert (=> b!558497 (= lt!253802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51098 res!350357) b!558490))

(assert (= (and b!558490 res!350360) b!558494))

(assert (= (and b!558494 res!350353) b!558492))

(assert (= (and b!558492 res!350352) b!558488))

(assert (= (and b!558488 res!350356) b!558487))

(assert (= (and b!558487 res!350350) b!558491))

(assert (= (and b!558491 res!350351) b!558489))

(assert (= (and b!558489 res!350355) b!558495))

(assert (= (and b!558495 res!350354) b!558497))

(assert (= (and b!558497 res!350358) b!558496))

(assert (= (and b!558496 (not res!350359)) b!558493))

(declare-fun m!536475 () Bool)

(assert (=> b!558495 m!536475))

(declare-fun m!536477 () Bool)

(assert (=> b!558495 m!536477))

(assert (=> b!558495 m!536475))

(declare-fun m!536479 () Bool)

(assert (=> b!558495 m!536479))

(assert (=> b!558495 m!536475))

(declare-fun m!536481 () Bool)

(assert (=> b!558495 m!536481))

(assert (=> b!558495 m!536481))

(declare-fun m!536483 () Bool)

(assert (=> b!558495 m!536483))

(declare-fun m!536485 () Bool)

(assert (=> b!558495 m!536485))

(assert (=> b!558495 m!536481))

(declare-fun m!536487 () Bool)

(assert (=> b!558495 m!536487))

(declare-fun m!536489 () Bool)

(assert (=> start!51098 m!536489))

(declare-fun m!536491 () Bool)

(assert (=> start!51098 m!536491))

(assert (=> b!558497 m!536475))

(assert (=> b!558497 m!536475))

(declare-fun m!536493 () Bool)

(assert (=> b!558497 m!536493))

(declare-fun m!536495 () Bool)

(assert (=> b!558497 m!536495))

(declare-fun m!536497 () Bool)

(assert (=> b!558497 m!536497))

(assert (=> b!558493 m!536475))

(assert (=> b!558493 m!536475))

(declare-fun m!536499 () Bool)

(assert (=> b!558493 m!536499))

(declare-fun m!536501 () Bool)

(assert (=> b!558488 m!536501))

(assert (=> b!558494 m!536475))

(assert (=> b!558494 m!536475))

(declare-fun m!536503 () Bool)

(assert (=> b!558494 m!536503))

(declare-fun m!536505 () Bool)

(assert (=> b!558489 m!536505))

(declare-fun m!536507 () Bool)

(assert (=> b!558492 m!536507))

(declare-fun m!536509 () Bool)

(assert (=> b!558496 m!536509))

(assert (=> b!558496 m!536475))

(declare-fun m!536511 () Bool)

(assert (=> b!558491 m!536511))

(declare-fun m!536513 () Bool)

(assert (=> b!558487 m!536513))

(push 1)

