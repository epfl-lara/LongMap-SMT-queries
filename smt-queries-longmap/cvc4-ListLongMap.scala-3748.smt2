; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51486 () Bool)

(assert start!51486)

(declare-fun b!563106 () Bool)

(declare-fun e!324526 () Bool)

(declare-fun e!324528 () Bool)

(assert (=> b!563106 (= e!324526 e!324528)))

(declare-fun res!354258 () Bool)

(assert (=> b!563106 (=> (not res!354258) (not e!324528))))

(declare-datatypes ((SeekEntryResult!5425 0))(
  ( (MissingZero!5425 (index!23927 (_ BitVec 32))) (Found!5425 (index!23928 (_ BitVec 32))) (Intermediate!5425 (undefined!6237 Bool) (index!23929 (_ BitVec 32)) (x!52816 (_ BitVec 32))) (Undefined!5425) (MissingVacant!5425 (index!23930 (_ BitVec 32))) )
))
(declare-fun lt!257028 () SeekEntryResult!5425)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35351 0))(
  ( (array!35352 (arr!16976 (Array (_ BitVec 32) (_ BitVec 64))) (size!17340 (_ BitVec 32))) )
))
(declare-fun lt!257018 () array!35351)

(declare-fun lt!257024 () (_ BitVec 64))

(declare-fun lt!257020 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35351 (_ BitVec 32)) SeekEntryResult!5425)

(assert (=> b!563106 (= res!354258 (= lt!257028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257020 lt!257024 lt!257018 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!257021 () (_ BitVec 32))

(declare-fun a!3118 () array!35351)

(assert (=> b!563106 (= lt!257028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257021 (select (arr!16976 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563106 (= lt!257020 (toIndex!0 lt!257024 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563106 (= lt!257024 (select (store (arr!16976 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!563106 (= lt!257021 (toIndex!0 (select (arr!16976 a!3118) j!142) mask!3119))))

(assert (=> b!563106 (= lt!257018 (array!35352 (store (arr!16976 a!3118) i!1132 k!1914) (size!17340 a!3118)))))

(declare-fun b!563107 () Bool)

(declare-fun e!324523 () Bool)

(declare-fun e!324525 () Bool)

(assert (=> b!563107 (= e!324523 e!324525)))

(declare-fun res!354260 () Bool)

(assert (=> b!563107 (=> res!354260 e!324525)))

(declare-fun lt!257022 () SeekEntryResult!5425)

(declare-fun lt!257023 () (_ BitVec 64))

(declare-fun lt!257026 () SeekEntryResult!5425)

(assert (=> b!563107 (= res!354260 (or (bvslt (index!23929 lt!257028) #b00000000000000000000000000000000) (bvsge (index!23929 lt!257028) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52816 lt!257028) #b01111111111111111111111111111110) (bvslt (x!52816 lt!257028) #b00000000000000000000000000000000) (not (= lt!257023 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16976 a!3118) i!1132 k!1914) (index!23929 lt!257028)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!257022 lt!257026))))))

(declare-fun lt!257027 () SeekEntryResult!5425)

(declare-fun lt!257017 () SeekEntryResult!5425)

(assert (=> b!563107 (= lt!257027 lt!257017)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35351 (_ BitVec 32)) SeekEntryResult!5425)

(assert (=> b!563107 (= lt!257017 (seekKeyOrZeroReturnVacant!0 (x!52816 lt!257028) (index!23929 lt!257028) (index!23929 lt!257028) lt!257024 lt!257018 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35351 (_ BitVec 32)) SeekEntryResult!5425)

(assert (=> b!563107 (= lt!257027 (seekEntryOrOpen!0 lt!257024 lt!257018 mask!3119))))

(declare-fun lt!257016 () SeekEntryResult!5425)

(assert (=> b!563107 (= lt!257016 lt!257022)))

(assert (=> b!563107 (= lt!257022 (seekKeyOrZeroReturnVacant!0 (x!52816 lt!257028) (index!23929 lt!257028) (index!23929 lt!257028) (select (arr!16976 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!563108 () Bool)

(declare-fun e!324524 () Bool)

(assert (=> b!563108 (= e!324524 e!324526)))

(declare-fun res!354261 () Bool)

(assert (=> b!563108 (=> (not res!354261) (not e!324526))))

(declare-fun lt!257025 () SeekEntryResult!5425)

(assert (=> b!563108 (= res!354261 (or (= lt!257025 (MissingZero!5425 i!1132)) (= lt!257025 (MissingVacant!5425 i!1132))))))

(assert (=> b!563108 (= lt!257025 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!354262 () Bool)

(assert (=> start!51486 (=> (not res!354262) (not e!324524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51486 (= res!354262 (validMask!0 mask!3119))))

(assert (=> start!51486 e!324524))

(assert (=> start!51486 true))

(declare-fun array_inv!12772 (array!35351) Bool)

(assert (=> start!51486 (array_inv!12772 a!3118)))

(declare-fun b!563109 () Bool)

(assert (=> b!563109 (= e!324525 true)))

(assert (=> b!563109 (= lt!257022 lt!257017)))

(declare-datatypes ((Unit!17624 0))(
  ( (Unit!17625) )
))
(declare-fun lt!257019 () Unit!17624)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35351 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17624)

(assert (=> b!563109 (= lt!257019 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52816 lt!257028) (index!23929 lt!257028) (index!23929 lt!257028) mask!3119))))

(declare-fun b!563110 () Bool)

(declare-fun res!354266 () Bool)

(assert (=> b!563110 (=> (not res!354266) (not e!324526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35351 (_ BitVec 32)) Bool)

(assert (=> b!563110 (= res!354266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563111 () Bool)

(declare-fun res!354263 () Bool)

(assert (=> b!563111 (=> (not res!354263) (not e!324526))))

(declare-datatypes ((List!11056 0))(
  ( (Nil!11053) (Cons!11052 (h!12055 (_ BitVec 64)) (t!17284 List!11056)) )
))
(declare-fun arrayNoDuplicates!0 (array!35351 (_ BitVec 32) List!11056) Bool)

(assert (=> b!563111 (= res!354263 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11053))))

(declare-fun b!563112 () Bool)

(declare-fun res!354268 () Bool)

(assert (=> b!563112 (=> (not res!354268) (not e!324524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563112 (= res!354268 (validKeyInArray!0 k!1914))))

(declare-fun b!563113 () Bool)

(declare-fun e!324522 () Bool)

(assert (=> b!563113 (= e!324522 e!324523)))

(declare-fun res!354264 () Bool)

(assert (=> b!563113 (=> res!354264 e!324523)))

(assert (=> b!563113 (= res!354264 (or (= lt!257023 (select (arr!16976 a!3118) j!142)) (= lt!257023 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563113 (= lt!257023 (select (arr!16976 a!3118) (index!23929 lt!257028)))))

(declare-fun b!563114 () Bool)

(declare-fun res!354265 () Bool)

(assert (=> b!563114 (=> (not res!354265) (not e!324524))))

(assert (=> b!563114 (= res!354265 (and (= (size!17340 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17340 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17340 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563115 () Bool)

(assert (=> b!563115 (= e!324528 (not e!324522))))

(declare-fun res!354259 () Bool)

(assert (=> b!563115 (=> res!354259 e!324522)))

(assert (=> b!563115 (= res!354259 (or (undefined!6237 lt!257028) (not (is-Intermediate!5425 lt!257028))))))

(assert (=> b!563115 (= lt!257016 lt!257026)))

(assert (=> b!563115 (= lt!257026 (Found!5425 j!142))))

(assert (=> b!563115 (= lt!257016 (seekEntryOrOpen!0 (select (arr!16976 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!563115 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!257029 () Unit!17624)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35351 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17624)

(assert (=> b!563115 (= lt!257029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563116 () Bool)

(declare-fun res!354269 () Bool)

(assert (=> b!563116 (=> (not res!354269) (not e!324524))))

(assert (=> b!563116 (= res!354269 (validKeyInArray!0 (select (arr!16976 a!3118) j!142)))))

(declare-fun b!563117 () Bool)

(declare-fun res!354267 () Bool)

(assert (=> b!563117 (=> (not res!354267) (not e!324524))))

(declare-fun arrayContainsKey!0 (array!35351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563117 (= res!354267 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51486 res!354262) b!563114))

(assert (= (and b!563114 res!354265) b!563116))

(assert (= (and b!563116 res!354269) b!563112))

(assert (= (and b!563112 res!354268) b!563117))

(assert (= (and b!563117 res!354267) b!563108))

(assert (= (and b!563108 res!354261) b!563110))

(assert (= (and b!563110 res!354266) b!563111))

(assert (= (and b!563111 res!354263) b!563106))

(assert (= (and b!563106 res!354258) b!563115))

(assert (= (and b!563115 (not res!354259)) b!563113))

(assert (= (and b!563113 (not res!354264)) b!563107))

(assert (= (and b!563107 (not res!354260)) b!563109))

(declare-fun m!541365 () Bool)

(assert (=> b!563112 m!541365))

(declare-fun m!541367 () Bool)

(assert (=> b!563109 m!541367))

(declare-fun m!541369 () Bool)

(assert (=> b!563111 m!541369))

(declare-fun m!541371 () Bool)

(assert (=> b!563106 m!541371))

(declare-fun m!541373 () Bool)

(assert (=> b!563106 m!541373))

(assert (=> b!563106 m!541371))

(declare-fun m!541375 () Bool)

(assert (=> b!563106 m!541375))

(declare-fun m!541377 () Bool)

(assert (=> b!563106 m!541377))

(declare-fun m!541379 () Bool)

(assert (=> b!563106 m!541379))

(declare-fun m!541381 () Bool)

(assert (=> b!563106 m!541381))

(assert (=> b!563106 m!541371))

(declare-fun m!541383 () Bool)

(assert (=> b!563106 m!541383))

(assert (=> b!563115 m!541371))

(assert (=> b!563115 m!541371))

(declare-fun m!541385 () Bool)

(assert (=> b!563115 m!541385))

(declare-fun m!541387 () Bool)

(assert (=> b!563115 m!541387))

(declare-fun m!541389 () Bool)

(assert (=> b!563115 m!541389))

(declare-fun m!541391 () Bool)

(assert (=> b!563110 m!541391))

(declare-fun m!541393 () Bool)

(assert (=> b!563108 m!541393))

(assert (=> b!563113 m!541371))

(declare-fun m!541395 () Bool)

(assert (=> b!563113 m!541395))

(declare-fun m!541397 () Bool)

(assert (=> b!563117 m!541397))

(assert (=> b!563107 m!541371))

(declare-fun m!541399 () Bool)

(assert (=> b!563107 m!541399))

(assert (=> b!563107 m!541371))

(declare-fun m!541401 () Bool)

(assert (=> b!563107 m!541401))

(assert (=> b!563107 m!541379))

(declare-fun m!541403 () Bool)

(assert (=> b!563107 m!541403))

(declare-fun m!541405 () Bool)

(assert (=> b!563107 m!541405))

(assert (=> b!563116 m!541371))

(assert (=> b!563116 m!541371))

(declare-fun m!541407 () Bool)

(assert (=> b!563116 m!541407))

(declare-fun m!541409 () Bool)

(assert (=> start!51486 m!541409))

(declare-fun m!541411 () Bool)

(assert (=> start!51486 m!541411))

(push 1)

