; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47794 () Bool)

(assert start!47794)

(declare-fun b!526474 () Bool)

(declare-fun res!323091 () Bool)

(declare-fun e!306880 () Bool)

(assert (=> b!526474 (=> (not res!323091) (not e!306880))))

(declare-datatypes ((array!33431 0))(
  ( (array!33432 (arr!16067 (Array (_ BitVec 32) (_ BitVec 64))) (size!16431 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33431)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526474 (= res!323091 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!526475 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!306882 () Bool)

(declare-datatypes ((SeekEntryResult!4534 0))(
  ( (MissingZero!4534 (index!20348 (_ BitVec 32))) (Found!4534 (index!20349 (_ BitVec 32))) (Intermediate!4534 (undefined!5346 Bool) (index!20350 (_ BitVec 32)) (x!49315 (_ BitVec 32))) (Undefined!4534) (MissingVacant!4534 (index!20351 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33431 (_ BitVec 32)) SeekEntryResult!4534)

(assert (=> b!526475 (= e!306882 (= (seekEntryOrOpen!0 (select (arr!16067 a!3235) j!176) a!3235 mask!3524) (Found!4534 j!176)))))

(declare-fun b!526476 () Bool)

(declare-fun res!323100 () Bool)

(declare-fun e!306876 () Bool)

(assert (=> b!526476 (=> res!323100 e!306876)))

(declare-fun lt!242137 () SeekEntryResult!4534)

(assert (=> b!526476 (= res!323100 (or (undefined!5346 lt!242137) (not (is-Intermediate!4534 lt!242137))))))

(declare-fun res!323094 () Bool)

(assert (=> start!47794 (=> (not res!323094) (not e!306880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47794 (= res!323094 (validMask!0 mask!3524))))

(assert (=> start!47794 e!306880))

(assert (=> start!47794 true))

(declare-fun array_inv!11863 (array!33431) Bool)

(assert (=> start!47794 (array_inv!11863 a!3235)))

(declare-fun b!526477 () Bool)

(declare-fun res!323093 () Bool)

(assert (=> b!526477 (=> (not res!323093) (not e!306880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526477 (= res!323093 (validKeyInArray!0 (select (arr!16067 a!3235) j!176)))))

(declare-fun b!526478 () Bool)

(declare-fun e!306877 () Bool)

(assert (=> b!526478 (= e!306877 false)))

(declare-fun b!526479 () Bool)

(declare-fun res!323096 () Bool)

(declare-fun e!306881 () Bool)

(assert (=> b!526479 (=> (not res!323096) (not e!306881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33431 (_ BitVec 32)) Bool)

(assert (=> b!526479 (= res!323096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526480 () Bool)

(assert (=> b!526480 (= e!306876 true)))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526480 (= (index!20350 lt!242137) i!1204)))

(declare-fun lt!242141 () (_ BitVec 32))

(declare-datatypes ((Unit!16588 0))(
  ( (Unit!16589) )
))
(declare-fun lt!242138 () Unit!16588)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16588)

(assert (=> b!526480 (= lt!242138 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242141 #b00000000000000000000000000000000 (index!20350 lt!242137) (x!49315 lt!242137) mask!3524))))

(assert (=> b!526480 (and (or (= (select (arr!16067 a!3235) (index!20350 lt!242137)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16067 a!3235) (index!20350 lt!242137)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16067 a!3235) (index!20350 lt!242137)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16067 a!3235) (index!20350 lt!242137)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242135 () Unit!16588)

(declare-fun e!306879 () Unit!16588)

(assert (=> b!526480 (= lt!242135 e!306879)))

(declare-fun c!61997 () Bool)

(assert (=> b!526480 (= c!61997 (= (select (arr!16067 a!3235) (index!20350 lt!242137)) (select (arr!16067 a!3235) j!176)))))

(assert (=> b!526480 (and (bvslt (x!49315 lt!242137) #b01111111111111111111111111111110) (or (= (select (arr!16067 a!3235) (index!20350 lt!242137)) (select (arr!16067 a!3235) j!176)) (= (select (arr!16067 a!3235) (index!20350 lt!242137)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16067 a!3235) (index!20350 lt!242137)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526481 () Bool)

(assert (=> b!526481 (= e!306880 e!306881)))

(declare-fun res!323098 () Bool)

(assert (=> b!526481 (=> (not res!323098) (not e!306881))))

(declare-fun lt!242140 () SeekEntryResult!4534)

(assert (=> b!526481 (= res!323098 (or (= lt!242140 (MissingZero!4534 i!1204)) (= lt!242140 (MissingVacant!4534 i!1204))))))

(assert (=> b!526481 (= lt!242140 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526482 () Bool)

(declare-fun Unit!16590 () Unit!16588)

(assert (=> b!526482 (= e!306879 Unit!16590)))

(declare-fun b!526483 () Bool)

(declare-fun res!323092 () Bool)

(assert (=> b!526483 (=> (not res!323092) (not e!306880))))

(assert (=> b!526483 (= res!323092 (validKeyInArray!0 k!2280))))

(declare-fun b!526484 () Bool)

(assert (=> b!526484 (= e!306881 (not e!306876))))

(declare-fun res!323101 () Bool)

(assert (=> b!526484 (=> res!323101 e!306876)))

(declare-fun lt!242136 () (_ BitVec 32))

(declare-fun lt!242134 () (_ BitVec 64))

(declare-fun lt!242143 () array!33431)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33431 (_ BitVec 32)) SeekEntryResult!4534)

(assert (=> b!526484 (= res!323101 (= lt!242137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242136 lt!242134 lt!242143 mask!3524)))))

(assert (=> b!526484 (= lt!242137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242141 (select (arr!16067 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526484 (= lt!242136 (toIndex!0 lt!242134 mask!3524))))

(assert (=> b!526484 (= lt!242134 (select (store (arr!16067 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526484 (= lt!242141 (toIndex!0 (select (arr!16067 a!3235) j!176) mask!3524))))

(assert (=> b!526484 (= lt!242143 (array!33432 (store (arr!16067 a!3235) i!1204 k!2280) (size!16431 a!3235)))))

(assert (=> b!526484 e!306882))

(declare-fun res!323099 () Bool)

(assert (=> b!526484 (=> (not res!323099) (not e!306882))))

(assert (=> b!526484 (= res!323099 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242142 () Unit!16588)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16588)

(assert (=> b!526484 (= lt!242142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526485 () Bool)

(declare-fun res!323097 () Bool)

(assert (=> b!526485 (=> (not res!323097) (not e!306880))))

(assert (=> b!526485 (= res!323097 (and (= (size!16431 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16431 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16431 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526486 () Bool)

(declare-fun Unit!16591 () Unit!16588)

(assert (=> b!526486 (= e!306879 Unit!16591)))

(declare-fun lt!242139 () Unit!16588)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16588)

(assert (=> b!526486 (= lt!242139 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242141 #b00000000000000000000000000000000 (index!20350 lt!242137) (x!49315 lt!242137) mask!3524))))

(declare-fun res!323102 () Bool)

(assert (=> b!526486 (= res!323102 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242141 lt!242134 lt!242143 mask!3524) (Intermediate!4534 false (index!20350 lt!242137) (x!49315 lt!242137))))))

(assert (=> b!526486 (=> (not res!323102) (not e!306877))))

(assert (=> b!526486 e!306877))

(declare-fun b!526487 () Bool)

(declare-fun res!323095 () Bool)

(assert (=> b!526487 (=> (not res!323095) (not e!306881))))

(declare-datatypes ((List!10225 0))(
  ( (Nil!10222) (Cons!10221 (h!11152 (_ BitVec 64)) (t!16453 List!10225)) )
))
(declare-fun arrayNoDuplicates!0 (array!33431 (_ BitVec 32) List!10225) Bool)

(assert (=> b!526487 (= res!323095 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10222))))

(assert (= (and start!47794 res!323094) b!526485))

(assert (= (and b!526485 res!323097) b!526477))

(assert (= (and b!526477 res!323093) b!526483))

(assert (= (and b!526483 res!323092) b!526474))

(assert (= (and b!526474 res!323091) b!526481))

(assert (= (and b!526481 res!323098) b!526479))

(assert (= (and b!526479 res!323096) b!526487))

(assert (= (and b!526487 res!323095) b!526484))

(assert (= (and b!526484 res!323099) b!526475))

(assert (= (and b!526484 (not res!323101)) b!526476))

(assert (= (and b!526476 (not res!323100)) b!526480))

(assert (= (and b!526480 c!61997) b!526486))

(assert (= (and b!526480 (not c!61997)) b!526482))

(assert (= (and b!526486 res!323102) b!526478))

(declare-fun m!507181 () Bool)

(assert (=> start!47794 m!507181))

(declare-fun m!507183 () Bool)

(assert (=> start!47794 m!507183))

(declare-fun m!507185 () Bool)

(assert (=> b!526475 m!507185))

(assert (=> b!526475 m!507185))

(declare-fun m!507187 () Bool)

(assert (=> b!526475 m!507187))

(assert (=> b!526477 m!507185))

(assert (=> b!526477 m!507185))

(declare-fun m!507189 () Bool)

(assert (=> b!526477 m!507189))

(declare-fun m!507191 () Bool)

(assert (=> b!526483 m!507191))

(declare-fun m!507193 () Bool)

(assert (=> b!526479 m!507193))

(declare-fun m!507195 () Bool)

(assert (=> b!526484 m!507195))

(declare-fun m!507197 () Bool)

(assert (=> b!526484 m!507197))

(declare-fun m!507199 () Bool)

(assert (=> b!526484 m!507199))

(assert (=> b!526484 m!507185))

(declare-fun m!507201 () Bool)

(assert (=> b!526484 m!507201))

(assert (=> b!526484 m!507185))

(declare-fun m!507203 () Bool)

(assert (=> b!526484 m!507203))

(declare-fun m!507205 () Bool)

(assert (=> b!526484 m!507205))

(declare-fun m!507207 () Bool)

(assert (=> b!526484 m!507207))

(assert (=> b!526484 m!507185))

(declare-fun m!507209 () Bool)

(assert (=> b!526484 m!507209))

(declare-fun m!507211 () Bool)

(assert (=> b!526487 m!507211))

(declare-fun m!507213 () Bool)

(assert (=> b!526481 m!507213))

(declare-fun m!507215 () Bool)

(assert (=> b!526474 m!507215))

(declare-fun m!507217 () Bool)

(assert (=> b!526486 m!507217))

(declare-fun m!507219 () Bool)

(assert (=> b!526486 m!507219))

(declare-fun m!507221 () Bool)

(assert (=> b!526480 m!507221))

(declare-fun m!507223 () Bool)

(assert (=> b!526480 m!507223))

(assert (=> b!526480 m!507185))

(push 1)

