; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52436 () Bool)

(assert start!52436)

(declare-fun b!572465 () Bool)

(declare-fun res!361984 () Bool)

(declare-fun e!329294 () Bool)

(assert (=> b!572465 (=> (not res!361984) (not e!329294))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35833 0))(
  ( (array!35834 (arr!17205 (Array (_ BitVec 32) (_ BitVec 64))) (size!17569 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35833)

(assert (=> b!572465 (= res!361984 (and (= (size!17569 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17569 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17569 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572466 () Bool)

(declare-fun e!329295 () Bool)

(declare-fun e!329293 () Bool)

(assert (=> b!572466 (= e!329295 e!329293)))

(declare-fun res!361982 () Bool)

(assert (=> b!572466 (=> (not res!361982) (not e!329293))))

(declare-datatypes ((SeekEntryResult!5654 0))(
  ( (MissingZero!5654 (index!24843 (_ BitVec 32))) (Found!5654 (index!24844 (_ BitVec 32))) (Intermediate!5654 (undefined!6466 Bool) (index!24845 (_ BitVec 32)) (x!53715 (_ BitVec 32))) (Undefined!5654) (MissingVacant!5654 (index!24846 (_ BitVec 32))) )
))
(declare-fun lt!261260 () SeekEntryResult!5654)

(declare-fun lt!261259 () SeekEntryResult!5654)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35833 (_ BitVec 32)) SeekEntryResult!5654)

(assert (=> b!572466 (= res!361982 (= lt!261260 (seekKeyOrZeroReturnVacant!0 (x!53715 lt!261259) (index!24845 lt!261259) (index!24845 lt!261259) (select (arr!17205 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572467 () Bool)

(declare-fun res!361979 () Bool)

(assert (=> b!572467 (=> (not res!361979) (not e!329294))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572467 (= res!361979 (validKeyInArray!0 k!1914))))

(declare-fun b!572468 () Bool)

(declare-fun e!329298 () Bool)

(assert (=> b!572468 (= e!329294 e!329298)))

(declare-fun res!361983 () Bool)

(assert (=> b!572468 (=> (not res!361983) (not e!329298))))

(declare-fun lt!261258 () SeekEntryResult!5654)

(assert (=> b!572468 (= res!361983 (or (= lt!261258 (MissingZero!5654 i!1132)) (= lt!261258 (MissingVacant!5654 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35833 (_ BitVec 32)) SeekEntryResult!5654)

(assert (=> b!572468 (= lt!261258 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572469 () Bool)

(declare-fun e!329296 () Bool)

(assert (=> b!572469 (= e!329296 e!329295)))

(declare-fun res!361978 () Bool)

(assert (=> b!572469 (=> res!361978 e!329295)))

(declare-fun lt!261261 () (_ BitVec 64))

(assert (=> b!572469 (= res!361978 (or (= lt!261261 (select (arr!17205 a!3118) j!142)) (= lt!261261 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572469 (= lt!261261 (select (arr!17205 a!3118) (index!24845 lt!261259)))))

(declare-fun b!572470 () Bool)

(declare-fun res!361974 () Bool)

(assert (=> b!572470 (=> (not res!361974) (not e!329294))))

(assert (=> b!572470 (= res!361974 (validKeyInArray!0 (select (arr!17205 a!3118) j!142)))))

(declare-fun lt!261254 () array!35833)

(declare-fun b!572471 () Bool)

(declare-fun lt!261257 () (_ BitVec 64))

(assert (=> b!572471 (= e!329293 (= (seekEntryOrOpen!0 lt!261257 lt!261254 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53715 lt!261259) (index!24845 lt!261259) (index!24845 lt!261259) lt!261257 lt!261254 mask!3119)))))

(declare-fun res!361981 () Bool)

(assert (=> start!52436 (=> (not res!361981) (not e!329294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52436 (= res!361981 (validMask!0 mask!3119))))

(assert (=> start!52436 e!329294))

(assert (=> start!52436 true))

(declare-fun array_inv!13001 (array!35833) Bool)

(assert (=> start!52436 (array_inv!13001 a!3118)))

(declare-fun b!572472 () Bool)

(declare-fun e!329292 () Bool)

(assert (=> b!572472 (= e!329298 e!329292)))

(declare-fun res!361985 () Bool)

(assert (=> b!572472 (=> (not res!361985) (not e!329292))))

(declare-fun lt!261255 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35833 (_ BitVec 32)) SeekEntryResult!5654)

(assert (=> b!572472 (= res!361985 (= lt!261259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261255 lt!261257 lt!261254 mask!3119)))))

(declare-fun lt!261256 () (_ BitVec 32))

(assert (=> b!572472 (= lt!261259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261256 (select (arr!17205 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572472 (= lt!261255 (toIndex!0 lt!261257 mask!3119))))

(assert (=> b!572472 (= lt!261257 (select (store (arr!17205 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572472 (= lt!261256 (toIndex!0 (select (arr!17205 a!3118) j!142) mask!3119))))

(assert (=> b!572472 (= lt!261254 (array!35834 (store (arr!17205 a!3118) i!1132 k!1914) (size!17569 a!3118)))))

(declare-fun b!572473 () Bool)

(declare-fun e!329291 () Bool)

(assert (=> b!572473 (= e!329291 e!329296)))

(declare-fun res!361973 () Bool)

(assert (=> b!572473 (=> res!361973 e!329296)))

(assert (=> b!572473 (= res!361973 (or (undefined!6466 lt!261259) (not (is-Intermediate!5654 lt!261259))))))

(declare-fun b!572474 () Bool)

(assert (=> b!572474 (= e!329292 (not true))))

(assert (=> b!572474 e!329291))

(declare-fun res!361980 () Bool)

(assert (=> b!572474 (=> (not res!361980) (not e!329291))))

(assert (=> b!572474 (= res!361980 (= lt!261260 (Found!5654 j!142)))))

(assert (=> b!572474 (= lt!261260 (seekEntryOrOpen!0 (select (arr!17205 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35833 (_ BitVec 32)) Bool)

(assert (=> b!572474 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18010 0))(
  ( (Unit!18011) )
))
(declare-fun lt!261262 () Unit!18010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18010)

(assert (=> b!572474 (= lt!261262 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572475 () Bool)

(declare-fun res!361976 () Bool)

(assert (=> b!572475 (=> (not res!361976) (not e!329298))))

(assert (=> b!572475 (= res!361976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572476 () Bool)

(declare-fun res!361975 () Bool)

(assert (=> b!572476 (=> (not res!361975) (not e!329294))))

(declare-fun arrayContainsKey!0 (array!35833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572476 (= res!361975 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572477 () Bool)

(declare-fun res!361977 () Bool)

(assert (=> b!572477 (=> (not res!361977) (not e!329298))))

(declare-datatypes ((List!11285 0))(
  ( (Nil!11282) (Cons!11281 (h!12308 (_ BitVec 64)) (t!17513 List!11285)) )
))
(declare-fun arrayNoDuplicates!0 (array!35833 (_ BitVec 32) List!11285) Bool)

(assert (=> b!572477 (= res!361977 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11282))))

(assert (= (and start!52436 res!361981) b!572465))

(assert (= (and b!572465 res!361984) b!572470))

(assert (= (and b!572470 res!361974) b!572467))

(assert (= (and b!572467 res!361979) b!572476))

(assert (= (and b!572476 res!361975) b!572468))

(assert (= (and b!572468 res!361983) b!572475))

(assert (= (and b!572475 res!361976) b!572477))

(assert (= (and b!572477 res!361977) b!572472))

(assert (= (and b!572472 res!361985) b!572474))

(assert (= (and b!572474 res!361980) b!572473))

(assert (= (and b!572473 (not res!361973)) b!572469))

(assert (= (and b!572469 (not res!361978)) b!572466))

(assert (= (and b!572466 res!361982) b!572471))

(declare-fun m!551445 () Bool)

(assert (=> b!572469 m!551445))

(declare-fun m!551447 () Bool)

(assert (=> b!572469 m!551447))

(declare-fun m!551449 () Bool)

(assert (=> b!572476 m!551449))

(declare-fun m!551451 () Bool)

(assert (=> b!572468 m!551451))

(declare-fun m!551453 () Bool)

(assert (=> b!572475 m!551453))

(declare-fun m!551455 () Bool)

(assert (=> b!572471 m!551455))

(declare-fun m!551457 () Bool)

(assert (=> b!572471 m!551457))

(declare-fun m!551459 () Bool)

(assert (=> b!572477 m!551459))

(assert (=> b!572474 m!551445))

(assert (=> b!572474 m!551445))

(declare-fun m!551461 () Bool)

(assert (=> b!572474 m!551461))

(declare-fun m!551463 () Bool)

(assert (=> b!572474 m!551463))

(declare-fun m!551465 () Bool)

(assert (=> b!572474 m!551465))

(declare-fun m!551467 () Bool)

(assert (=> b!572467 m!551467))

(assert (=> b!572466 m!551445))

(assert (=> b!572466 m!551445))

(declare-fun m!551469 () Bool)

(assert (=> b!572466 m!551469))

(declare-fun m!551471 () Bool)

(assert (=> start!52436 m!551471))

(declare-fun m!551473 () Bool)

(assert (=> start!52436 m!551473))

(assert (=> b!572470 m!551445))

(assert (=> b!572470 m!551445))

(declare-fun m!551475 () Bool)

(assert (=> b!572470 m!551475))

(assert (=> b!572472 m!551445))

(declare-fun m!551477 () Bool)

(assert (=> b!572472 m!551477))

(assert (=> b!572472 m!551445))

(declare-fun m!551479 () Bool)

(assert (=> b!572472 m!551479))

(declare-fun m!551481 () Bool)

(assert (=> b!572472 m!551481))

(assert (=> b!572472 m!551445))

(declare-fun m!551483 () Bool)

(assert (=> b!572472 m!551483))

(declare-fun m!551485 () Bool)

(assert (=> b!572472 m!551485))

(declare-fun m!551487 () Bool)

(assert (=> b!572472 m!551487))

(push 1)

