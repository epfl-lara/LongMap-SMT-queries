; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52872 () Bool)

(assert start!52872)

(declare-fun b!576332 () Bool)

(declare-fun e!331597 () Bool)

(assert (=> b!576332 (= e!331597 (not true))))

(declare-fun e!331598 () Bool)

(assert (=> b!576332 e!331598))

(declare-fun res!364565 () Bool)

(assert (=> b!576332 (=> (not res!364565) (not e!331598))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35960 0))(
  ( (array!35961 (arr!17261 (Array (_ BitVec 32) (_ BitVec 64))) (size!17625 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35960)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35960 (_ BitVec 32)) Bool)

(assert (=> b!576332 (= res!364565 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18122 0))(
  ( (Unit!18123) )
))
(declare-fun lt!263641 () Unit!18122)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18122)

(assert (=> b!576332 (= lt!263641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576333 () Bool)

(declare-fun res!364566 () Bool)

(assert (=> b!576333 (=> (not res!364566) (not e!331597))))

(declare-datatypes ((List!11341 0))(
  ( (Nil!11338) (Cons!11337 (h!12379 (_ BitVec 64)) (t!17569 List!11341)) )
))
(declare-fun arrayNoDuplicates!0 (array!35960 (_ BitVec 32) List!11341) Bool)

(assert (=> b!576333 (= res!364566 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11338))))

(declare-fun b!576334 () Bool)

(declare-fun e!331599 () Bool)

(assert (=> b!576334 (= e!331599 e!331597)))

(declare-fun res!364569 () Bool)

(assert (=> b!576334 (=> (not res!364569) (not e!331597))))

(declare-datatypes ((SeekEntryResult!5710 0))(
  ( (MissingZero!5710 (index!25067 (_ BitVec 32))) (Found!5710 (index!25068 (_ BitVec 32))) (Intermediate!5710 (undefined!6522 Bool) (index!25069 (_ BitVec 32)) (x!53957 (_ BitVec 32))) (Undefined!5710) (MissingVacant!5710 (index!25070 (_ BitVec 32))) )
))
(declare-fun lt!263640 () SeekEntryResult!5710)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576334 (= res!364569 (or (= lt!263640 (MissingZero!5710 i!1132)) (= lt!263640 (MissingVacant!5710 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35960 (_ BitVec 32)) SeekEntryResult!5710)

(assert (=> b!576334 (= lt!263640 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!576335 () Bool)

(assert (=> b!576335 (= e!331598 (= (seekEntryOrOpen!0 (select (arr!17261 a!3118) j!142) a!3118 mask!3119) (Found!5710 j!142)))))

(declare-fun b!576336 () Bool)

(declare-fun res!364574 () Bool)

(assert (=> b!576336 (=> (not res!364574) (not e!331599))))

(assert (=> b!576336 (= res!364574 (and (= (size!17625 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17625 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17625 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576337 () Bool)

(declare-fun res!364573 () Bool)

(assert (=> b!576337 (=> (not res!364573) (not e!331599))))

(declare-fun arrayContainsKey!0 (array!35960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576337 (= res!364573 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576338 () Bool)

(declare-fun res!364572 () Bool)

(assert (=> b!576338 (=> (not res!364572) (not e!331597))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35960 (_ BitVec 32)) SeekEntryResult!5710)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576338 (= res!364572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17261 a!3118) j!142) mask!3119) (select (arr!17261 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17261 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17261 a!3118) i!1132 k!1914) j!142) (array!35961 (store (arr!17261 a!3118) i!1132 k!1914) (size!17625 a!3118)) mask!3119)))))

(declare-fun b!576339 () Bool)

(declare-fun res!364567 () Bool)

(assert (=> b!576339 (=> (not res!364567) (not e!331597))))

(assert (=> b!576339 (= res!364567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576340 () Bool)

(declare-fun res!364570 () Bool)

(assert (=> b!576340 (=> (not res!364570) (not e!331599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576340 (= res!364570 (validKeyInArray!0 k!1914))))

(declare-fun b!576341 () Bool)

(declare-fun res!364571 () Bool)

(assert (=> b!576341 (=> (not res!364571) (not e!331599))))

(assert (=> b!576341 (= res!364571 (validKeyInArray!0 (select (arr!17261 a!3118) j!142)))))

(declare-fun res!364568 () Bool)

(assert (=> start!52872 (=> (not res!364568) (not e!331599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52872 (= res!364568 (validMask!0 mask!3119))))

(assert (=> start!52872 e!331599))

(assert (=> start!52872 true))

(declare-fun array_inv!13057 (array!35960) Bool)

(assert (=> start!52872 (array_inv!13057 a!3118)))

(assert (= (and start!52872 res!364568) b!576336))

(assert (= (and b!576336 res!364574) b!576341))

(assert (= (and b!576341 res!364571) b!576340))

(assert (= (and b!576340 res!364570) b!576337))

(assert (= (and b!576337 res!364573) b!576334))

(assert (= (and b!576334 res!364569) b!576339))

(assert (= (and b!576339 res!364567) b!576333))

(assert (= (and b!576333 res!364566) b!576338))

(assert (= (and b!576338 res!364572) b!576332))

(assert (= (and b!576332 res!364565) b!576335))

(declare-fun m!555273 () Bool)

(assert (=> b!576339 m!555273))

(declare-fun m!555275 () Bool)

(assert (=> b!576338 m!555275))

(declare-fun m!555277 () Bool)

(assert (=> b!576338 m!555277))

(assert (=> b!576338 m!555275))

(declare-fun m!555279 () Bool)

(assert (=> b!576338 m!555279))

(declare-fun m!555281 () Bool)

(assert (=> b!576338 m!555281))

(assert (=> b!576338 m!555279))

(declare-fun m!555283 () Bool)

(assert (=> b!576338 m!555283))

(assert (=> b!576338 m!555277))

(assert (=> b!576338 m!555275))

(declare-fun m!555285 () Bool)

(assert (=> b!576338 m!555285))

(declare-fun m!555287 () Bool)

(assert (=> b!576338 m!555287))

(assert (=> b!576338 m!555279))

(assert (=> b!576338 m!555281))

(declare-fun m!555289 () Bool)

(assert (=> b!576334 m!555289))

(declare-fun m!555291 () Bool)

(assert (=> b!576332 m!555291))

(declare-fun m!555293 () Bool)

(assert (=> b!576332 m!555293))

(assert (=> b!576341 m!555275))

(assert (=> b!576341 m!555275))

(declare-fun m!555295 () Bool)

(assert (=> b!576341 m!555295))

(assert (=> b!576335 m!555275))

(assert (=> b!576335 m!555275))

(declare-fun m!555297 () Bool)

(assert (=> b!576335 m!555297))

(declare-fun m!555299 () Bool)

(assert (=> b!576337 m!555299))

(declare-fun m!555301 () Bool)

(assert (=> start!52872 m!555301))

(declare-fun m!555303 () Bool)

(assert (=> start!52872 m!555303))

(declare-fun m!555305 () Bool)

(assert (=> b!576340 m!555305))

(declare-fun m!555307 () Bool)

(assert (=> b!576333 m!555307))

(push 1)

(assert (not b!576341))

(assert (not b!576339))

(assert (not b!576338))

(assert (not b!576340))

