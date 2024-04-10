; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52280 () Bool)

(assert start!52280)

(declare-fun b!570425 () Bool)

(declare-fun res!360205 () Bool)

(declare-fun e!328075 () Bool)

(assert (=> b!570425 (=> (not res!360205) (not e!328075))))

(declare-datatypes ((array!35740 0))(
  ( (array!35741 (arr!17160 (Array (_ BitVec 32) (_ BitVec 64))) (size!17524 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35740)

(declare-datatypes ((List!11240 0))(
  ( (Nil!11237) (Cons!11236 (h!12260 (_ BitVec 64)) (t!17468 List!11240)) )
))
(declare-fun arrayNoDuplicates!0 (array!35740 (_ BitVec 32) List!11240) Bool)

(assert (=> b!570425 (= res!360205 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11237))))

(declare-fun b!570426 () Bool)

(declare-fun res!360214 () Bool)

(assert (=> b!570426 (=> (not res!360214) (not e!328075))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35740 (_ BitVec 32)) Bool)

(assert (=> b!570426 (= res!360214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570427 () Bool)

(declare-fun e!328078 () Bool)

(assert (=> b!570427 (= e!328075 e!328078)))

(declare-fun res!360206 () Bool)

(assert (=> b!570427 (=> (not res!360206) (not e!328078))))

(declare-datatypes ((SeekEntryResult!5609 0))(
  ( (MissingZero!5609 (index!24663 (_ BitVec 32))) (Found!5609 (index!24664 (_ BitVec 32))) (Intermediate!5609 (undefined!6421 Bool) (index!24665 (_ BitVec 32)) (x!53541 (_ BitVec 32))) (Undefined!5609) (MissingVacant!5609 (index!24666 (_ BitVec 32))) )
))
(declare-fun lt!260027 () SeekEntryResult!5609)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!260026 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35740 (_ BitVec 32)) SeekEntryResult!5609)

(assert (=> b!570427 (= res!360206 (= lt!260027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260026 (select (store (arr!17160 a!3118) i!1132 k!1914) j!142) (array!35741 (store (arr!17160 a!3118) i!1132 k!1914) (size!17524 a!3118)) mask!3119)))))

(declare-fun lt!260028 () (_ BitVec 32))

(assert (=> b!570427 (= lt!260027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260028 (select (arr!17160 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570427 (= lt!260026 (toIndex!0 (select (store (arr!17160 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570427 (= lt!260028 (toIndex!0 (select (arr!17160 a!3118) j!142) mask!3119))))

(declare-fun b!570428 () Bool)

(declare-fun res!360212 () Bool)

(declare-fun e!328076 () Bool)

(assert (=> b!570428 (=> (not res!360212) (not e!328076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570428 (= res!360212 (validKeyInArray!0 (select (arr!17160 a!3118) j!142)))))

(declare-fun b!570429 () Bool)

(declare-fun res!360209 () Bool)

(assert (=> b!570429 (=> (not res!360209) (not e!328076))))

(assert (=> b!570429 (= res!360209 (validKeyInArray!0 k!1914))))

(declare-fun b!570430 () Bool)

(declare-fun e!328077 () Bool)

(declare-fun e!328080 () Bool)

(assert (=> b!570430 (= e!328077 e!328080)))

(declare-fun res!360211 () Bool)

(assert (=> b!570430 (=> res!360211 e!328080)))

(assert (=> b!570430 (= res!360211 (or (undefined!6421 lt!260027) (not (is-Intermediate!5609 lt!260027)) (= (select (arr!17160 a!3118) (index!24665 lt!260027)) (select (arr!17160 a!3118) j!142)) (= (select (arr!17160 a!3118) (index!24665 lt!260027)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570424 () Bool)

(declare-fun res!360210 () Bool)

(assert (=> b!570424 (=> (not res!360210) (not e!328076))))

(assert (=> b!570424 (= res!360210 (and (= (size!17524 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17524 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17524 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!360208 () Bool)

(assert (=> start!52280 (=> (not res!360208) (not e!328076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52280 (= res!360208 (validMask!0 mask!3119))))

(assert (=> start!52280 e!328076))

(assert (=> start!52280 true))

(declare-fun array_inv!12956 (array!35740) Bool)

(assert (=> start!52280 (array_inv!12956 a!3118)))

(declare-fun b!570431 () Bool)

(assert (=> b!570431 (= e!328078 (not true))))

(assert (=> b!570431 e!328077))

(declare-fun res!360215 () Bool)

(assert (=> b!570431 (=> (not res!360215) (not e!328077))))

(declare-fun lt!260025 () SeekEntryResult!5609)

(assert (=> b!570431 (= res!360215 (= lt!260025 (Found!5609 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35740 (_ BitVec 32)) SeekEntryResult!5609)

(assert (=> b!570431 (= lt!260025 (seekEntryOrOpen!0 (select (arr!17160 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570431 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17920 0))(
  ( (Unit!17921) )
))
(declare-fun lt!260029 () Unit!17920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17920)

(assert (=> b!570431 (= lt!260029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570432 () Bool)

(declare-fun res!360213 () Bool)

(assert (=> b!570432 (=> (not res!360213) (not e!328076))))

(declare-fun arrayContainsKey!0 (array!35740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570432 (= res!360213 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570433 () Bool)

(assert (=> b!570433 (= e!328076 e!328075)))

(declare-fun res!360207 () Bool)

(assert (=> b!570433 (=> (not res!360207) (not e!328075))))

(declare-fun lt!260024 () SeekEntryResult!5609)

(assert (=> b!570433 (= res!360207 (or (= lt!260024 (MissingZero!5609 i!1132)) (= lt!260024 (MissingVacant!5609 i!1132))))))

(assert (=> b!570433 (= lt!260024 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570434 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35740 (_ BitVec 32)) SeekEntryResult!5609)

(assert (=> b!570434 (= e!328080 (= lt!260025 (seekKeyOrZeroReturnVacant!0 (x!53541 lt!260027) (index!24665 lt!260027) (index!24665 lt!260027) (select (arr!17160 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!52280 res!360208) b!570424))

(assert (= (and b!570424 res!360210) b!570428))

(assert (= (and b!570428 res!360212) b!570429))

(assert (= (and b!570429 res!360209) b!570432))

(assert (= (and b!570432 res!360213) b!570433))

(assert (= (and b!570433 res!360207) b!570426))

(assert (= (and b!570426 res!360214) b!570425))

(assert (= (and b!570425 res!360205) b!570427))

(assert (= (and b!570427 res!360206) b!570431))

(assert (= (and b!570431 res!360215) b!570430))

(assert (= (and b!570430 (not res!360211)) b!570434))

(declare-fun m!549249 () Bool)

(assert (=> b!570427 m!549249))

(declare-fun m!549251 () Bool)

(assert (=> b!570427 m!549251))

(declare-fun m!549253 () Bool)

(assert (=> b!570427 m!549253))

(declare-fun m!549255 () Bool)

(assert (=> b!570427 m!549255))

(assert (=> b!570427 m!549249))

(declare-fun m!549257 () Bool)

(assert (=> b!570427 m!549257))

(assert (=> b!570427 m!549249))

(assert (=> b!570427 m!549253))

(declare-fun m!549259 () Bool)

(assert (=> b!570427 m!549259))

(assert (=> b!570427 m!549253))

(declare-fun m!549261 () Bool)

(assert (=> b!570427 m!549261))

(declare-fun m!549263 () Bool)

(assert (=> b!570432 m!549263))

(declare-fun m!549265 () Bool)

(assert (=> b!570433 m!549265))

(assert (=> b!570431 m!549249))

(assert (=> b!570431 m!549249))

(declare-fun m!549267 () Bool)

(assert (=> b!570431 m!549267))

(declare-fun m!549269 () Bool)

(assert (=> b!570431 m!549269))

(declare-fun m!549271 () Bool)

(assert (=> b!570431 m!549271))

(assert (=> b!570434 m!549249))

(assert (=> b!570434 m!549249))

(declare-fun m!549273 () Bool)

(assert (=> b!570434 m!549273))

(declare-fun m!549275 () Bool)

(assert (=> b!570425 m!549275))

(assert (=> b!570428 m!549249))

(assert (=> b!570428 m!549249))

(declare-fun m!549277 () Bool)

(assert (=> b!570428 m!549277))

(declare-fun m!549279 () Bool)

(assert (=> b!570426 m!549279))

(declare-fun m!549281 () Bool)

(assert (=> b!570430 m!549281))

(assert (=> b!570430 m!549249))

(declare-fun m!549283 () Bool)

(assert (=> b!570429 m!549283))

(declare-fun m!549285 () Bool)

(assert (=> start!52280 m!549285))

(declare-fun m!549287 () Bool)

(assert (=> start!52280 m!549287))

(push 1)

