; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51492 () Bool)

(assert start!51492)

(declare-fun b!563222 () Bool)

(declare-fun e!324594 () Bool)

(declare-fun e!324595 () Bool)

(assert (=> b!563222 (= e!324594 e!324595)))

(declare-fun res!354386 () Bool)

(assert (=> b!563222 (=> res!354386 e!324595)))

(declare-datatypes ((SeekEntryResult!5428 0))(
  ( (MissingZero!5428 (index!23939 (_ BitVec 32))) (Found!5428 (index!23940 (_ BitVec 32))) (Intermediate!5428 (undefined!6240 Bool) (index!23941 (_ BitVec 32)) (x!52827 (_ BitVec 32))) (Undefined!5428) (MissingVacant!5428 (index!23942 (_ BitVec 32))) )
))
(declare-fun lt!257148 () SeekEntryResult!5428)

(declare-fun lt!257152 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!257155 () SeekEntryResult!5428)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35357 0))(
  ( (array!35358 (arr!16979 (Array (_ BitVec 32) (_ BitVec 64))) (size!17343 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35357)

(declare-fun lt!257153 () SeekEntryResult!5428)

(assert (=> b!563222 (= res!354386 (or (bvslt (index!23941 lt!257155) #b00000000000000000000000000000000) (bvsge (index!23941 lt!257155) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52827 lt!257155) #b01111111111111111111111111111110) (bvslt (x!52827 lt!257155) #b00000000000000000000000000000000) (not (= lt!257152 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16979 a!3118) i!1132 k!1914) (index!23941 lt!257155)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!257153 lt!257148))))))

(declare-fun lt!257149 () SeekEntryResult!5428)

(declare-fun lt!257154 () SeekEntryResult!5428)

(assert (=> b!563222 (= lt!257149 lt!257154)))

(declare-fun lt!257146 () array!35357)

(declare-fun lt!257150 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35357 (_ BitVec 32)) SeekEntryResult!5428)

(assert (=> b!563222 (= lt!257154 (seekKeyOrZeroReturnVacant!0 (x!52827 lt!257155) (index!23941 lt!257155) (index!23941 lt!257155) lt!257150 lt!257146 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35357 (_ BitVec 32)) SeekEntryResult!5428)

(assert (=> b!563222 (= lt!257149 (seekEntryOrOpen!0 lt!257150 lt!257146 mask!3119))))

(declare-fun lt!257144 () SeekEntryResult!5428)

(assert (=> b!563222 (= lt!257144 lt!257153)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563222 (= lt!257153 (seekKeyOrZeroReturnVacant!0 (x!52827 lt!257155) (index!23941 lt!257155) (index!23941 lt!257155) (select (arr!16979 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!563223 () Bool)

(declare-fun res!354378 () Bool)

(declare-fun e!324593 () Bool)

(assert (=> b!563223 (=> (not res!354378) (not e!324593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563223 (= res!354378 (validKeyInArray!0 (select (arr!16979 a!3118) j!142)))))

(declare-fun b!563224 () Bool)

(declare-fun res!354384 () Bool)

(assert (=> b!563224 (=> (not res!354384) (not e!324593))))

(assert (=> b!563224 (= res!354384 (validKeyInArray!0 k!1914))))

(declare-fun b!563225 () Bool)

(declare-fun e!324600 () Bool)

(assert (=> b!563225 (= e!324600 (validKeyInArray!0 lt!257150))))

(declare-fun res!354376 () Bool)

(assert (=> start!51492 (=> (not res!354376) (not e!324593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51492 (= res!354376 (validMask!0 mask!3119))))

(assert (=> start!51492 e!324593))

(assert (=> start!51492 true))

(declare-fun array_inv!12775 (array!35357) Bool)

(assert (=> start!51492 (array_inv!12775 a!3118)))

(declare-fun b!563226 () Bool)

(declare-fun e!324596 () Bool)

(declare-fun e!324598 () Bool)

(assert (=> b!563226 (= e!324596 e!324598)))

(declare-fun res!354385 () Bool)

(assert (=> b!563226 (=> (not res!354385) (not e!324598))))

(declare-fun lt!257143 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35357 (_ BitVec 32)) SeekEntryResult!5428)

(assert (=> b!563226 (= res!354385 (= lt!257155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257143 lt!257150 lt!257146 mask!3119)))))

(declare-fun lt!257151 () (_ BitVec 32))

(assert (=> b!563226 (= lt!257155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257151 (select (arr!16979 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563226 (= lt!257143 (toIndex!0 lt!257150 mask!3119))))

(assert (=> b!563226 (= lt!257150 (select (store (arr!16979 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!563226 (= lt!257151 (toIndex!0 (select (arr!16979 a!3118) j!142) mask!3119))))

(assert (=> b!563226 (= lt!257146 (array!35358 (store (arr!16979 a!3118) i!1132 k!1914) (size!17343 a!3118)))))

(declare-fun b!563227 () Bool)

(assert (=> b!563227 (= e!324595 e!324600)))

(declare-fun res!354375 () Bool)

(assert (=> b!563227 (=> res!354375 e!324600)))

(assert (=> b!563227 (= res!354375 (bvslt mask!3119 #b00000000000000000000000000000000))))

(assert (=> b!563227 (= lt!257153 lt!257154)))

(declare-datatypes ((Unit!17630 0))(
  ( (Unit!17631) )
))
(declare-fun lt!257142 () Unit!17630)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35357 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17630)

(assert (=> b!563227 (= lt!257142 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52827 lt!257155) (index!23941 lt!257155) (index!23941 lt!257155) mask!3119))))

(declare-fun b!563228 () Bool)

(declare-fun res!354380 () Bool)

(assert (=> b!563228 (=> (not res!354380) (not e!324593))))

(declare-fun arrayContainsKey!0 (array!35357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563228 (= res!354380 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563229 () Bool)

(declare-fun res!354383 () Bool)

(assert (=> b!563229 (=> (not res!354383) (not e!324593))))

(assert (=> b!563229 (= res!354383 (and (= (size!17343 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17343 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17343 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563230 () Bool)

(assert (=> b!563230 (= e!324593 e!324596)))

(declare-fun res!354374 () Bool)

(assert (=> b!563230 (=> (not res!354374) (not e!324596))))

(declare-fun lt!257145 () SeekEntryResult!5428)

(assert (=> b!563230 (= res!354374 (or (= lt!257145 (MissingZero!5428 i!1132)) (= lt!257145 (MissingVacant!5428 i!1132))))))

(assert (=> b!563230 (= lt!257145 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563231 () Bool)

(declare-fun e!324597 () Bool)

(assert (=> b!563231 (= e!324598 (not e!324597))))

(declare-fun res!354382 () Bool)

(assert (=> b!563231 (=> res!354382 e!324597)))

(assert (=> b!563231 (= res!354382 (or (undefined!6240 lt!257155) (not (is-Intermediate!5428 lt!257155))))))

(assert (=> b!563231 (= lt!257144 lt!257148)))

(assert (=> b!563231 (= lt!257148 (Found!5428 j!142))))

(assert (=> b!563231 (= lt!257144 (seekEntryOrOpen!0 (select (arr!16979 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35357 (_ BitVec 32)) Bool)

(assert (=> b!563231 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!257147 () Unit!17630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17630)

(assert (=> b!563231 (= lt!257147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563232 () Bool)

(declare-fun res!354381 () Bool)

(assert (=> b!563232 (=> (not res!354381) (not e!324596))))

(assert (=> b!563232 (= res!354381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563233 () Bool)

(declare-fun res!354379 () Bool)

(assert (=> b!563233 (=> (not res!354379) (not e!324596))))

(declare-datatypes ((List!11059 0))(
  ( (Nil!11056) (Cons!11055 (h!12058 (_ BitVec 64)) (t!17287 List!11059)) )
))
(declare-fun arrayNoDuplicates!0 (array!35357 (_ BitVec 32) List!11059) Bool)

(assert (=> b!563233 (= res!354379 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11056))))

(declare-fun b!563234 () Bool)

(assert (=> b!563234 (= e!324597 e!324594)))

(declare-fun res!354377 () Bool)

(assert (=> b!563234 (=> res!354377 e!324594)))

(assert (=> b!563234 (= res!354377 (or (= lt!257152 (select (arr!16979 a!3118) j!142)) (= lt!257152 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563234 (= lt!257152 (select (arr!16979 a!3118) (index!23941 lt!257155)))))

(assert (= (and start!51492 res!354376) b!563229))

(assert (= (and b!563229 res!354383) b!563223))

(assert (= (and b!563223 res!354378) b!563224))

(assert (= (and b!563224 res!354384) b!563228))

(assert (= (and b!563228 res!354380) b!563230))

(assert (= (and b!563230 res!354374) b!563232))

(assert (= (and b!563232 res!354381) b!563233))

(assert (= (and b!563233 res!354379) b!563226))

(assert (= (and b!563226 res!354385) b!563231))

(assert (= (and b!563231 (not res!354382)) b!563234))

(assert (= (and b!563234 (not res!354377)) b!563222))

(assert (= (and b!563222 (not res!354386)) b!563227))

(assert (= (and b!563227 (not res!354375)) b!563225))

(declare-fun m!541513 () Bool)

(assert (=> b!563223 m!541513))

(assert (=> b!563223 m!541513))

(declare-fun m!541515 () Bool)

(assert (=> b!563223 m!541515))

(assert (=> b!563222 m!541513))

(declare-fun m!541517 () Bool)

(assert (=> b!563222 m!541517))

(assert (=> b!563222 m!541513))

(declare-fun m!541519 () Bool)

(assert (=> b!563222 m!541519))

(declare-fun m!541521 () Bool)

(assert (=> b!563222 m!541521))

(declare-fun m!541523 () Bool)

(assert (=> b!563222 m!541523))

(declare-fun m!541525 () Bool)

(assert (=> b!563222 m!541525))

(declare-fun m!541527 () Bool)

(assert (=> b!563228 m!541527))

(declare-fun m!541529 () Bool)

(assert (=> start!51492 m!541529))

(declare-fun m!541531 () Bool)

(assert (=> start!51492 m!541531))

(assert (=> b!563234 m!541513))

(declare-fun m!541533 () Bool)

(assert (=> b!563234 m!541533))

(declare-fun m!541535 () Bool)

(assert (=> b!563230 m!541535))

(declare-fun m!541537 () Bool)

(assert (=> b!563225 m!541537))

(declare-fun m!541539 () Bool)

(assert (=> b!563233 m!541539))

(declare-fun m!541541 () Bool)

(assert (=> b!563224 m!541541))

(assert (=> b!563231 m!541513))

(assert (=> b!563231 m!541513))

(declare-fun m!541543 () Bool)

(assert (=> b!563231 m!541543))

(declare-fun m!541545 () Bool)

(assert (=> b!563231 m!541545))

(declare-fun m!541547 () Bool)

(assert (=> b!563231 m!541547))

(assert (=> b!563226 m!541513))

(declare-fun m!541549 () Bool)

(assert (=> b!563226 m!541549))

(assert (=> b!563226 m!541513))

(declare-fun m!541551 () Bool)

(assert (=> b!563226 m!541551))

(assert (=> b!563226 m!541513))

(declare-fun m!541553 () Bool)

(assert (=> b!563226 m!541553))

(assert (=> b!563226 m!541519))

(declare-fun m!541555 () Bool)

(assert (=> b!563226 m!541555))

(declare-fun m!541557 () Bool)

(assert (=> b!563226 m!541557))

(declare-fun m!541559 () Bool)

(assert (=> b!563227 m!541559))

(declare-fun m!541561 () Bool)

(assert (=> b!563232 m!541561))

(push 1)

