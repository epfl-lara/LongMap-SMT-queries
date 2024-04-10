; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52172 () Bool)

(assert start!52172)

(declare-fun b!569481 () Bool)

(declare-fun e!327600 () Bool)

(declare-fun e!327597 () Bool)

(assert (=> b!569481 (= e!327600 e!327597)))

(declare-fun res!359499 () Bool)

(assert (=> b!569481 (=> (not res!359499) (not e!327597))))

(declare-datatypes ((SeekEntryResult!5588 0))(
  ( (MissingZero!5588 (index!24579 (_ BitVec 32))) (Found!5588 (index!24580 (_ BitVec 32))) (Intermediate!5588 (undefined!6400 Bool) (index!24581 (_ BitVec 32)) (x!53455 (_ BitVec 32))) (Undefined!5588) (MissingVacant!5588 (index!24582 (_ BitVec 32))) )
))
(declare-fun lt!259571 () SeekEntryResult!5588)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569481 (= res!359499 (or (= lt!259571 (MissingZero!5588 i!1132)) (= lt!259571 (MissingVacant!5588 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35695 0))(
  ( (array!35696 (arr!17139 (Array (_ BitVec 32) (_ BitVec 64))) (size!17503 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35695)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35695 (_ BitVec 32)) SeekEntryResult!5588)

(assert (=> b!569481 (= lt!259571 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!359506 () Bool)

(assert (=> start!52172 (=> (not res!359506) (not e!327600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52172 (= res!359506 (validMask!0 mask!3119))))

(assert (=> start!52172 e!327600))

(assert (=> start!52172 true))

(declare-fun array_inv!12935 (array!35695) Bool)

(assert (=> start!52172 (array_inv!12935 a!3118)))

(declare-fun b!569482 () Bool)

(declare-fun e!327598 () Bool)

(assert (=> b!569482 (= e!327597 e!327598)))

(declare-fun res!359503 () Bool)

(assert (=> b!569482 (=> (not res!359503) (not e!327598))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259574 () SeekEntryResult!5588)

(declare-fun lt!259573 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35695 (_ BitVec 32)) SeekEntryResult!5588)

(assert (=> b!569482 (= res!359503 (= lt!259574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259573 (select (store (arr!17139 a!3118) i!1132 k!1914) j!142) (array!35696 (store (arr!17139 a!3118) i!1132 k!1914) (size!17503 a!3118)) mask!3119)))))

(declare-fun lt!259572 () (_ BitVec 32))

(assert (=> b!569482 (= lt!259574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259572 (select (arr!17139 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569482 (= lt!259573 (toIndex!0 (select (store (arr!17139 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569482 (= lt!259572 (toIndex!0 (select (arr!17139 a!3118) j!142) mask!3119))))

(declare-fun b!569483 () Bool)

(declare-fun res!359500 () Bool)

(assert (=> b!569483 (=> (not res!359500) (not e!327600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569483 (= res!359500 (validKeyInArray!0 k!1914))))

(declare-fun b!569484 () Bool)

(assert (=> b!569484 (= e!327598 (not true))))

(declare-fun lt!259576 () SeekEntryResult!5588)

(assert (=> b!569484 (and (= lt!259576 (Found!5588 j!142)) (or (undefined!6400 lt!259574) (not (is-Intermediate!5588 lt!259574)) (= (select (arr!17139 a!3118) (index!24581 lt!259574)) (select (arr!17139 a!3118) j!142)) (not (= (select (arr!17139 a!3118) (index!24581 lt!259574)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259576 (MissingZero!5588 (index!24581 lt!259574)))))))

(assert (=> b!569484 (= lt!259576 (seekEntryOrOpen!0 (select (arr!17139 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35695 (_ BitVec 32)) Bool)

(assert (=> b!569484 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17878 0))(
  ( (Unit!17879) )
))
(declare-fun lt!259575 () Unit!17878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17878)

(assert (=> b!569484 (= lt!259575 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569485 () Bool)

(declare-fun res!359501 () Bool)

(assert (=> b!569485 (=> (not res!359501) (not e!327597))))

(assert (=> b!569485 (= res!359501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569486 () Bool)

(declare-fun res!359502 () Bool)

(assert (=> b!569486 (=> (not res!359502) (not e!327600))))

(declare-fun arrayContainsKey!0 (array!35695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569486 (= res!359502 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569487 () Bool)

(declare-fun res!359507 () Bool)

(assert (=> b!569487 (=> (not res!359507) (not e!327597))))

(declare-datatypes ((List!11219 0))(
  ( (Nil!11216) (Cons!11215 (h!12236 (_ BitVec 64)) (t!17447 List!11219)) )
))
(declare-fun arrayNoDuplicates!0 (array!35695 (_ BitVec 32) List!11219) Bool)

(assert (=> b!569487 (= res!359507 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11216))))

(declare-fun b!569488 () Bool)

(declare-fun res!359505 () Bool)

(assert (=> b!569488 (=> (not res!359505) (not e!327600))))

(assert (=> b!569488 (= res!359505 (and (= (size!17503 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17503 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17503 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569489 () Bool)

(declare-fun res!359504 () Bool)

(assert (=> b!569489 (=> (not res!359504) (not e!327600))))

(assert (=> b!569489 (= res!359504 (validKeyInArray!0 (select (arr!17139 a!3118) j!142)))))

(assert (= (and start!52172 res!359506) b!569488))

(assert (= (and b!569488 res!359505) b!569489))

(assert (= (and b!569489 res!359504) b!569483))

(assert (= (and b!569483 res!359500) b!569486))

(assert (= (and b!569486 res!359502) b!569481))

(assert (= (and b!569481 res!359499) b!569485))

(assert (= (and b!569485 res!359501) b!569487))

(assert (= (and b!569487 res!359507) b!569482))

(assert (= (and b!569482 res!359503) b!569484))

(declare-fun m!548229 () Bool)

(assert (=> b!569486 m!548229))

(declare-fun m!548231 () Bool)

(assert (=> start!52172 m!548231))

(declare-fun m!548233 () Bool)

(assert (=> start!52172 m!548233))

(declare-fun m!548235 () Bool)

(assert (=> b!569483 m!548235))

(declare-fun m!548237 () Bool)

(assert (=> b!569487 m!548237))

(declare-fun m!548239 () Bool)

(assert (=> b!569482 m!548239))

(declare-fun m!548241 () Bool)

(assert (=> b!569482 m!548241))

(assert (=> b!569482 m!548239))

(declare-fun m!548243 () Bool)

(assert (=> b!569482 m!548243))

(declare-fun m!548245 () Bool)

(assert (=> b!569482 m!548245))

(assert (=> b!569482 m!548243))

(declare-fun m!548247 () Bool)

(assert (=> b!569482 m!548247))

(assert (=> b!569482 m!548239))

(declare-fun m!548249 () Bool)

(assert (=> b!569482 m!548249))

(assert (=> b!569482 m!548243))

(declare-fun m!548251 () Bool)

(assert (=> b!569482 m!548251))

(declare-fun m!548253 () Bool)

(assert (=> b!569485 m!548253))

(assert (=> b!569484 m!548239))

(declare-fun m!548255 () Bool)

(assert (=> b!569484 m!548255))

(declare-fun m!548257 () Bool)

(assert (=> b!569484 m!548257))

(declare-fun m!548259 () Bool)

(assert (=> b!569484 m!548259))

(assert (=> b!569484 m!548239))

(declare-fun m!548261 () Bool)

(assert (=> b!569484 m!548261))

(assert (=> b!569489 m!548239))

(assert (=> b!569489 m!548239))

(declare-fun m!548263 () Bool)

(assert (=> b!569489 m!548263))

(declare-fun m!548265 () Bool)

(assert (=> b!569481 m!548265))

(push 1)

