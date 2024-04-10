; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47694 () Bool)

(assert start!47694)

(declare-fun b!524365 () Bool)

(declare-fun e!305817 () Bool)

(declare-fun e!305820 () Bool)

(assert (=> b!524365 (= e!305817 e!305820)))

(declare-fun res!321289 () Bool)

(assert (=> b!524365 (=> (not res!321289) (not e!305820))))

(declare-datatypes ((SeekEntryResult!4484 0))(
  ( (MissingZero!4484 (index!20148 (_ BitVec 32))) (Found!4484 (index!20149 (_ BitVec 32))) (Intermediate!4484 (undefined!5296 Bool) (index!20150 (_ BitVec 32)) (x!49137 (_ BitVec 32))) (Undefined!4484) (MissingVacant!4484 (index!20151 (_ BitVec 32))) )
))
(declare-fun lt!240642 () SeekEntryResult!4484)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524365 (= res!321289 (or (= lt!240642 (MissingZero!4484 i!1204)) (= lt!240642 (MissingVacant!4484 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33331 0))(
  ( (array!33332 (arr!16017 (Array (_ BitVec 32) (_ BitVec 64))) (size!16381 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33331)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33331 (_ BitVec 32)) SeekEntryResult!4484)

(assert (=> b!524365 (= lt!240642 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!305819 () Bool)

(declare-fun b!524366 () Bool)

(assert (=> b!524366 (= e!305819 (= (seekEntryOrOpen!0 (select (arr!16017 a!3235) j!176) a!3235 mask!3524) (Found!4484 j!176)))))

(declare-fun b!524367 () Bool)

(declare-datatypes ((Unit!16388 0))(
  ( (Unit!16389) )
))
(declare-fun e!305818 () Unit!16388)

(declare-fun Unit!16390 () Unit!16388)

(assert (=> b!524367 (= e!305818 Unit!16390)))

(declare-fun b!524368 () Bool)

(declare-fun res!321291 () Bool)

(assert (=> b!524368 (=> (not res!321291) (not e!305820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33331 (_ BitVec 32)) Bool)

(assert (=> b!524368 (= res!321291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524369 () Bool)

(declare-fun res!321292 () Bool)

(assert (=> b!524369 (=> (not res!321292) (not e!305817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524369 (= res!321292 (validKeyInArray!0 (select (arr!16017 a!3235) j!176)))))

(declare-fun b!524370 () Bool)

(declare-fun res!321287 () Bool)

(assert (=> b!524370 (=> (not res!321287) (not e!305817))))

(assert (=> b!524370 (= res!321287 (and (= (size!16381 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16381 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16381 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524372 () Bool)

(declare-fun e!305821 () Bool)

(assert (=> b!524372 (= e!305821 false)))

(declare-fun b!524373 () Bool)

(declare-fun res!321288 () Bool)

(assert (=> b!524373 (=> (not res!321288) (not e!305820))))

(declare-datatypes ((List!10175 0))(
  ( (Nil!10172) (Cons!10171 (h!11102 (_ BitVec 64)) (t!16403 List!10175)) )
))
(declare-fun arrayNoDuplicates!0 (array!33331 (_ BitVec 32) List!10175) Bool)

(assert (=> b!524373 (= res!321288 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10172))))

(declare-fun b!524374 () Bool)

(declare-fun e!305823 () Bool)

(assert (=> b!524374 (= e!305823 true)))

(declare-fun lt!240646 () SeekEntryResult!4484)

(assert (=> b!524374 (and (or (= (select (arr!16017 a!3235) (index!20150 lt!240646)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16017 a!3235) (index!20150 lt!240646)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16017 a!3235) (index!20150 lt!240646)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16017 a!3235) (index!20150 lt!240646)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240641 () Unit!16388)

(assert (=> b!524374 (= lt!240641 e!305818)))

(declare-fun c!61847 () Bool)

(assert (=> b!524374 (= c!61847 (= (select (arr!16017 a!3235) (index!20150 lt!240646)) (select (arr!16017 a!3235) j!176)))))

(assert (=> b!524374 (and (bvslt (x!49137 lt!240646) #b01111111111111111111111111111110) (or (= (select (arr!16017 a!3235) (index!20150 lt!240646)) (select (arr!16017 a!3235) j!176)) (= (select (arr!16017 a!3235) (index!20150 lt!240646)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16017 a!3235) (index!20150 lt!240646)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524375 () Bool)

(assert (=> b!524375 (= e!305820 (not e!305823))))

(declare-fun res!321284 () Bool)

(assert (=> b!524375 (=> res!321284 e!305823)))

(declare-fun lt!240648 () (_ BitVec 64))

(declare-fun lt!240649 () array!33331)

(declare-fun lt!240645 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33331 (_ BitVec 32)) SeekEntryResult!4484)

(assert (=> b!524375 (= res!321284 (= lt!240646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240645 lt!240648 lt!240649 mask!3524)))))

(declare-fun lt!240644 () (_ BitVec 32))

(assert (=> b!524375 (= lt!240646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240644 (select (arr!16017 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524375 (= lt!240645 (toIndex!0 lt!240648 mask!3524))))

(assert (=> b!524375 (= lt!240648 (select (store (arr!16017 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524375 (= lt!240644 (toIndex!0 (select (arr!16017 a!3235) j!176) mask!3524))))

(assert (=> b!524375 (= lt!240649 (array!33332 (store (arr!16017 a!3235) i!1204 k!2280) (size!16381 a!3235)))))

(assert (=> b!524375 e!305819))

(declare-fun res!321285 () Bool)

(assert (=> b!524375 (=> (not res!321285) (not e!305819))))

(assert (=> b!524375 (= res!321285 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240643 () Unit!16388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16388)

(assert (=> b!524375 (= lt!240643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524376 () Bool)

(declare-fun res!321283 () Bool)

(assert (=> b!524376 (=> (not res!321283) (not e!305817))))

(declare-fun arrayContainsKey!0 (array!33331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524376 (= res!321283 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524377 () Bool)

(declare-fun Unit!16391 () Unit!16388)

(assert (=> b!524377 (= e!305818 Unit!16391)))

(declare-fun lt!240647 () Unit!16388)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16388)

(assert (=> b!524377 (= lt!240647 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240644 #b00000000000000000000000000000000 (index!20150 lt!240646) (x!49137 lt!240646) mask!3524))))

(declare-fun res!321290 () Bool)

(assert (=> b!524377 (= res!321290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240644 lt!240648 lt!240649 mask!3524) (Intermediate!4484 false (index!20150 lt!240646) (x!49137 lt!240646))))))

(assert (=> b!524377 (=> (not res!321290) (not e!305821))))

(assert (=> b!524377 e!305821))

(declare-fun b!524378 () Bool)

(declare-fun res!321286 () Bool)

(assert (=> b!524378 (=> res!321286 e!305823)))

(assert (=> b!524378 (= res!321286 (or (undefined!5296 lt!240646) (not (is-Intermediate!4484 lt!240646))))))

(declare-fun b!524371 () Bool)

(declare-fun res!321293 () Bool)

(assert (=> b!524371 (=> (not res!321293) (not e!305817))))

(assert (=> b!524371 (= res!321293 (validKeyInArray!0 k!2280))))

(declare-fun res!321282 () Bool)

(assert (=> start!47694 (=> (not res!321282) (not e!305817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47694 (= res!321282 (validMask!0 mask!3524))))

(assert (=> start!47694 e!305817))

(assert (=> start!47694 true))

(declare-fun array_inv!11813 (array!33331) Bool)

(assert (=> start!47694 (array_inv!11813 a!3235)))

(assert (= (and start!47694 res!321282) b!524370))

(assert (= (and b!524370 res!321287) b!524369))

(assert (= (and b!524369 res!321292) b!524371))

(assert (= (and b!524371 res!321293) b!524376))

(assert (= (and b!524376 res!321283) b!524365))

(assert (= (and b!524365 res!321289) b!524368))

(assert (= (and b!524368 res!321291) b!524373))

(assert (= (and b!524373 res!321288) b!524375))

(assert (= (and b!524375 res!321285) b!524366))

(assert (= (and b!524375 (not res!321284)) b!524378))

(assert (= (and b!524378 (not res!321286)) b!524374))

(assert (= (and b!524374 c!61847) b!524377))

(assert (= (and b!524374 (not c!61847)) b!524367))

(assert (= (and b!524377 res!321290) b!524372))

(declare-fun m!504999 () Bool)

(assert (=> start!47694 m!504999))

(declare-fun m!505001 () Bool)

(assert (=> start!47694 m!505001))

(declare-fun m!505003 () Bool)

(assert (=> b!524374 m!505003))

(declare-fun m!505005 () Bool)

(assert (=> b!524374 m!505005))

(declare-fun m!505007 () Bool)

(assert (=> b!524365 m!505007))

(declare-fun m!505009 () Bool)

(assert (=> b!524377 m!505009))

(declare-fun m!505011 () Bool)

(assert (=> b!524377 m!505011))

(assert (=> b!524375 m!505005))

(declare-fun m!505013 () Bool)

(assert (=> b!524375 m!505013))

(declare-fun m!505015 () Bool)

(assert (=> b!524375 m!505015))

(declare-fun m!505017 () Bool)

(assert (=> b!524375 m!505017))

(declare-fun m!505019 () Bool)

(assert (=> b!524375 m!505019))

(declare-fun m!505021 () Bool)

(assert (=> b!524375 m!505021))

(declare-fun m!505023 () Bool)

(assert (=> b!524375 m!505023))

(assert (=> b!524375 m!505005))

(declare-fun m!505025 () Bool)

(assert (=> b!524375 m!505025))

(assert (=> b!524375 m!505005))

(declare-fun m!505027 () Bool)

(assert (=> b!524375 m!505027))

(assert (=> b!524366 m!505005))

(assert (=> b!524366 m!505005))

(declare-fun m!505029 () Bool)

(assert (=> b!524366 m!505029))

(declare-fun m!505031 () Bool)

(assert (=> b!524373 m!505031))

(declare-fun m!505033 () Bool)

(assert (=> b!524368 m!505033))

(assert (=> b!524369 m!505005))

(assert (=> b!524369 m!505005))

(declare-fun m!505035 () Bool)

(assert (=> b!524369 m!505035))

(declare-fun m!505037 () Bool)

(assert (=> b!524376 m!505037))

(declare-fun m!505039 () Bool)

(assert (=> b!524371 m!505039))

(push 1)

