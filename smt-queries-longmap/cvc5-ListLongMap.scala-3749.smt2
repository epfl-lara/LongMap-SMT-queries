; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51488 () Bool)

(assert start!51488)

(declare-fun b!563144 () Bool)

(declare-fun res!354302 () Bool)

(declare-fun e!324546 () Bool)

(assert (=> b!563144 (=> (not res!354302) (not e!324546))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563144 (= res!354302 (validKeyInArray!0 k!1914))))

(declare-fun b!563145 () Bool)

(declare-fun e!324550 () Bool)

(declare-fun e!324545 () Bool)

(assert (=> b!563145 (= e!324550 e!324545)))

(declare-fun res!354307 () Bool)

(assert (=> b!563145 (=> (not res!354307) (not e!324545))))

(declare-datatypes ((array!35353 0))(
  ( (array!35354 (arr!16977 (Array (_ BitVec 32) (_ BitVec 64))) (size!17341 (_ BitVec 32))) )
))
(declare-fun lt!257065 () array!35353)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!257064 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5426 0))(
  ( (MissingZero!5426 (index!23931 (_ BitVec 32))) (Found!5426 (index!23932 (_ BitVec 32))) (Intermediate!5426 (undefined!6238 Bool) (index!23933 (_ BitVec 32)) (x!52825 (_ BitVec 32))) (Undefined!5426) (MissingVacant!5426 (index!23934 (_ BitVec 32))) )
))
(declare-fun lt!257067 () SeekEntryResult!5426)

(declare-fun lt!257066 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35353 (_ BitVec 32)) SeekEntryResult!5426)

(assert (=> b!563145 (= res!354307 (= lt!257067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257064 lt!257066 lt!257065 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!257069 () (_ BitVec 32))

(declare-fun a!3118 () array!35353)

(assert (=> b!563145 (= lt!257067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257069 (select (arr!16977 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563145 (= lt!257064 (toIndex!0 lt!257066 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563145 (= lt!257066 (select (store (arr!16977 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!563145 (= lt!257069 (toIndex!0 (select (arr!16977 a!3118) j!142) mask!3119))))

(assert (=> b!563145 (= lt!257065 (array!35354 (store (arr!16977 a!3118) i!1132 k!1914) (size!17341 a!3118)))))

(declare-fun b!563146 () Bool)

(declare-fun e!324548 () Bool)

(declare-fun e!324549 () Bool)

(assert (=> b!563146 (= e!324548 e!324549)))

(declare-fun res!354296 () Bool)

(assert (=> b!563146 (=> res!354296 e!324549)))

(declare-fun lt!257068 () SeekEntryResult!5426)

(declare-fun lt!257058 () (_ BitVec 64))

(declare-fun lt!257070 () SeekEntryResult!5426)

(assert (=> b!563146 (= res!354296 (or (bvslt (index!23933 lt!257067) #b00000000000000000000000000000000) (bvsge (index!23933 lt!257067) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52825 lt!257067) #b01111111111111111111111111111110) (bvslt (x!52825 lt!257067) #b00000000000000000000000000000000) (not (= lt!257058 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16977 a!3118) i!1132 k!1914) (index!23933 lt!257067)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!257068 lt!257070))))))

(declare-fun lt!257062 () SeekEntryResult!5426)

(declare-fun lt!257060 () SeekEntryResult!5426)

(assert (=> b!563146 (= lt!257062 lt!257060)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35353 (_ BitVec 32)) SeekEntryResult!5426)

(assert (=> b!563146 (= lt!257060 (seekKeyOrZeroReturnVacant!0 (x!52825 lt!257067) (index!23933 lt!257067) (index!23933 lt!257067) lt!257066 lt!257065 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35353 (_ BitVec 32)) SeekEntryResult!5426)

(assert (=> b!563146 (= lt!257062 (seekEntryOrOpen!0 lt!257066 lt!257065 mask!3119))))

(declare-fun lt!257063 () SeekEntryResult!5426)

(assert (=> b!563146 (= lt!257063 lt!257068)))

(assert (=> b!563146 (= lt!257068 (seekKeyOrZeroReturnVacant!0 (x!52825 lt!257067) (index!23933 lt!257067) (index!23933 lt!257067) (select (arr!16977 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!563147 () Bool)

(assert (=> b!563147 (= e!324546 e!324550)))

(declare-fun res!354298 () Bool)

(assert (=> b!563147 (=> (not res!354298) (not e!324550))))

(declare-fun lt!257059 () SeekEntryResult!5426)

(assert (=> b!563147 (= res!354298 (or (= lt!257059 (MissingZero!5426 i!1132)) (= lt!257059 (MissingVacant!5426 i!1132))))))

(assert (=> b!563147 (= lt!257059 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563148 () Bool)

(declare-fun res!354305 () Bool)

(assert (=> b!563148 (=> (not res!354305) (not e!324546))))

(assert (=> b!563148 (= res!354305 (validKeyInArray!0 (select (arr!16977 a!3118) j!142)))))

(declare-fun b!563149 () Bool)

(declare-fun res!354303 () Bool)

(assert (=> b!563149 (=> (not res!354303) (not e!324550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35353 (_ BitVec 32)) Bool)

(assert (=> b!563149 (= res!354303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563150 () Bool)

(declare-fun e!324551 () Bool)

(assert (=> b!563150 (= e!324551 (validKeyInArray!0 lt!257066))))

(declare-fun b!563151 () Bool)

(declare-fun res!354300 () Bool)

(assert (=> b!563151 (=> (not res!354300) (not e!324546))))

(declare-fun arrayContainsKey!0 (array!35353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563151 (= res!354300 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!354306 () Bool)

(assert (=> start!51488 (=> (not res!354306) (not e!324546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51488 (= res!354306 (validMask!0 mask!3119))))

(assert (=> start!51488 e!324546))

(assert (=> start!51488 true))

(declare-fun array_inv!12773 (array!35353) Bool)

(assert (=> start!51488 (array_inv!12773 a!3118)))

(declare-fun b!563152 () Bool)

(declare-fun res!354299 () Bool)

(assert (=> b!563152 (=> (not res!354299) (not e!324546))))

(assert (=> b!563152 (= res!354299 (and (= (size!17341 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17341 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17341 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563153 () Bool)

(declare-fun res!354308 () Bool)

(assert (=> b!563153 (=> (not res!354308) (not e!324550))))

(declare-datatypes ((List!11057 0))(
  ( (Nil!11054) (Cons!11053 (h!12056 (_ BitVec 64)) (t!17285 List!11057)) )
))
(declare-fun arrayNoDuplicates!0 (array!35353 (_ BitVec 32) List!11057) Bool)

(assert (=> b!563153 (= res!354308 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11054))))

(declare-fun b!563154 () Bool)

(assert (=> b!563154 (= e!324549 e!324551)))

(declare-fun res!354304 () Bool)

(assert (=> b!563154 (=> res!354304 e!324551)))

(assert (=> b!563154 (= res!354304 (bvslt mask!3119 #b00000000000000000000000000000000))))

(assert (=> b!563154 (= lt!257068 lt!257060)))

(declare-datatypes ((Unit!17626 0))(
  ( (Unit!17627) )
))
(declare-fun lt!257061 () Unit!17626)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17626)

(assert (=> b!563154 (= lt!257061 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52825 lt!257067) (index!23933 lt!257067) (index!23933 lt!257067) mask!3119))))

(declare-fun b!563155 () Bool)

(declare-fun e!324547 () Bool)

(assert (=> b!563155 (= e!324547 e!324548)))

(declare-fun res!354297 () Bool)

(assert (=> b!563155 (=> res!354297 e!324548)))

(assert (=> b!563155 (= res!354297 (or (= lt!257058 (select (arr!16977 a!3118) j!142)) (= lt!257058 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563155 (= lt!257058 (select (arr!16977 a!3118) (index!23933 lt!257067)))))

(declare-fun b!563156 () Bool)

(assert (=> b!563156 (= e!324545 (not e!324547))))

(declare-fun res!354301 () Bool)

(assert (=> b!563156 (=> res!354301 e!324547)))

(assert (=> b!563156 (= res!354301 (or (undefined!6238 lt!257067) (not (is-Intermediate!5426 lt!257067))))))

(assert (=> b!563156 (= lt!257063 lt!257070)))

(assert (=> b!563156 (= lt!257070 (Found!5426 j!142))))

(assert (=> b!563156 (= lt!257063 (seekEntryOrOpen!0 (select (arr!16977 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!563156 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!257071 () Unit!17626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17626)

(assert (=> b!563156 (= lt!257071 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51488 res!354306) b!563152))

(assert (= (and b!563152 res!354299) b!563148))

(assert (= (and b!563148 res!354305) b!563144))

(assert (= (and b!563144 res!354302) b!563151))

(assert (= (and b!563151 res!354300) b!563147))

(assert (= (and b!563147 res!354298) b!563149))

(assert (= (and b!563149 res!354303) b!563153))

(assert (= (and b!563153 res!354308) b!563145))

(assert (= (and b!563145 res!354307) b!563156))

(assert (= (and b!563156 (not res!354301)) b!563155))

(assert (= (and b!563155 (not res!354297)) b!563146))

(assert (= (and b!563146 (not res!354296)) b!563154))

(assert (= (and b!563154 (not res!354304)) b!563150))

(declare-fun m!541413 () Bool)

(assert (=> b!563146 m!541413))

(declare-fun m!541415 () Bool)

(assert (=> b!563146 m!541415))

(assert (=> b!563146 m!541415))

(declare-fun m!541417 () Bool)

(assert (=> b!563146 m!541417))

(declare-fun m!541419 () Bool)

(assert (=> b!563146 m!541419))

(declare-fun m!541421 () Bool)

(assert (=> b!563146 m!541421))

(declare-fun m!541423 () Bool)

(assert (=> b!563146 m!541423))

(assert (=> b!563155 m!541415))

(declare-fun m!541425 () Bool)

(assert (=> b!563155 m!541425))

(assert (=> b!563156 m!541415))

(assert (=> b!563156 m!541415))

(declare-fun m!541427 () Bool)

(assert (=> b!563156 m!541427))

(declare-fun m!541429 () Bool)

(assert (=> b!563156 m!541429))

(declare-fun m!541431 () Bool)

(assert (=> b!563156 m!541431))

(declare-fun m!541433 () Bool)

(assert (=> b!563144 m!541433))

(declare-fun m!541435 () Bool)

(assert (=> b!563151 m!541435))

(declare-fun m!541437 () Bool)

(assert (=> b!563149 m!541437))

(declare-fun m!541439 () Bool)

(assert (=> b!563153 m!541439))

(declare-fun m!541441 () Bool)

(assert (=> b!563147 m!541441))

(declare-fun m!541443 () Bool)

(assert (=> b!563150 m!541443))

(assert (=> b!563145 m!541415))

(declare-fun m!541445 () Bool)

(assert (=> b!563145 m!541445))

(assert (=> b!563145 m!541415))

(declare-fun m!541447 () Bool)

(assert (=> b!563145 m!541447))

(declare-fun m!541449 () Bool)

(assert (=> b!563145 m!541449))

(declare-fun m!541451 () Bool)

(assert (=> b!563145 m!541451))

(assert (=> b!563145 m!541415))

(declare-fun m!541453 () Bool)

(assert (=> b!563145 m!541453))

(assert (=> b!563145 m!541419))

(declare-fun m!541455 () Bool)

(assert (=> start!51488 m!541455))

(declare-fun m!541457 () Bool)

(assert (=> start!51488 m!541457))

(declare-fun m!541459 () Bool)

(assert (=> b!563154 m!541459))

(assert (=> b!563148 m!541415))

(assert (=> b!563148 m!541415))

(declare-fun m!541461 () Bool)

(assert (=> b!563148 m!541461))

(push 1)

