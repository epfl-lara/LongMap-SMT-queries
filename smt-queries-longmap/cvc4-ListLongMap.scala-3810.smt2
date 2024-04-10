; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52284 () Bool)

(assert start!52284)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5611 0))(
  ( (MissingZero!5611 (index!24671 (_ BitVec 32))) (Found!5611 (index!24672 (_ BitVec 32))) (Intermediate!5611 (undefined!6423 Bool) (index!24673 (_ BitVec 32)) (x!53543 (_ BitVec 32))) (Undefined!5611) (MissingVacant!5611 (index!24674 (_ BitVec 32))) )
))
(declare-fun lt!260064 () SeekEntryResult!5611)

(declare-fun e!328111 () Bool)

(declare-fun b!570490 () Bool)

(declare-datatypes ((array!35744 0))(
  ( (array!35745 (arr!17162 (Array (_ BitVec 32) (_ BitVec 64))) (size!17526 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35744)

(declare-fun lt!260065 () SeekEntryResult!5611)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35744 (_ BitVec 32)) SeekEntryResult!5611)

(assert (=> b!570490 (= e!328111 (= lt!260065 (seekKeyOrZeroReturnVacant!0 (x!53543 lt!260064) (index!24673 lt!260064) (index!24673 lt!260064) (select (arr!17162 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!360277 () Bool)

(declare-fun e!328116 () Bool)

(assert (=> start!52284 (=> (not res!360277) (not e!328116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52284 (= res!360277 (validMask!0 mask!3119))))

(assert (=> start!52284 e!328116))

(assert (=> start!52284 true))

(declare-fun array_inv!12958 (array!35744) Bool)

(assert (=> start!52284 (array_inv!12958 a!3118)))

(declare-fun b!570491 () Bool)

(declare-fun res!360281 () Bool)

(assert (=> b!570491 (=> (not res!360281) (not e!328116))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570491 (= res!360281 (and (= (size!17526 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17526 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17526 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570492 () Bool)

(declare-fun e!328113 () Bool)

(assert (=> b!570492 (= e!328113 (not true))))

(declare-fun e!328112 () Bool)

(assert (=> b!570492 e!328112))

(declare-fun res!360276 () Bool)

(assert (=> b!570492 (=> (not res!360276) (not e!328112))))

(assert (=> b!570492 (= res!360276 (= lt!260065 (Found!5611 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35744 (_ BitVec 32)) SeekEntryResult!5611)

(assert (=> b!570492 (= lt!260065 (seekEntryOrOpen!0 (select (arr!17162 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35744 (_ BitVec 32)) Bool)

(assert (=> b!570492 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17924 0))(
  ( (Unit!17925) )
))
(declare-fun lt!260063 () Unit!17924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17924)

(assert (=> b!570492 (= lt!260063 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570493 () Bool)

(assert (=> b!570493 (= e!328112 e!328111)))

(declare-fun res!360275 () Bool)

(assert (=> b!570493 (=> res!360275 e!328111)))

(assert (=> b!570493 (= res!360275 (or (undefined!6423 lt!260064) (not (is-Intermediate!5611 lt!260064)) (= (select (arr!17162 a!3118) (index!24673 lt!260064)) (select (arr!17162 a!3118) j!142)) (= (select (arr!17162 a!3118) (index!24673 lt!260064)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570494 () Bool)

(declare-fun res!360274 () Bool)

(assert (=> b!570494 (=> (not res!360274) (not e!328116))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570494 (= res!360274 (validKeyInArray!0 k!1914))))

(declare-fun b!570495 () Bool)

(declare-fun e!328114 () Bool)

(assert (=> b!570495 (= e!328116 e!328114)))

(declare-fun res!360280 () Bool)

(assert (=> b!570495 (=> (not res!360280) (not e!328114))))

(declare-fun lt!260062 () SeekEntryResult!5611)

(assert (=> b!570495 (= res!360280 (or (= lt!260062 (MissingZero!5611 i!1132)) (= lt!260062 (MissingVacant!5611 i!1132))))))

(assert (=> b!570495 (= lt!260062 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570496 () Bool)

(declare-fun res!360278 () Bool)

(assert (=> b!570496 (=> (not res!360278) (not e!328114))))

(assert (=> b!570496 (= res!360278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570497 () Bool)

(assert (=> b!570497 (= e!328114 e!328113)))

(declare-fun res!360272 () Bool)

(assert (=> b!570497 (=> (not res!360272) (not e!328113))))

(declare-fun lt!260060 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35744 (_ BitVec 32)) SeekEntryResult!5611)

(assert (=> b!570497 (= res!360272 (= lt!260064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260060 (select (store (arr!17162 a!3118) i!1132 k!1914) j!142) (array!35745 (store (arr!17162 a!3118) i!1132 k!1914) (size!17526 a!3118)) mask!3119)))))

(declare-fun lt!260061 () (_ BitVec 32))

(assert (=> b!570497 (= lt!260064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260061 (select (arr!17162 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570497 (= lt!260060 (toIndex!0 (select (store (arr!17162 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570497 (= lt!260061 (toIndex!0 (select (arr!17162 a!3118) j!142) mask!3119))))

(declare-fun b!570498 () Bool)

(declare-fun res!360279 () Bool)

(assert (=> b!570498 (=> (not res!360279) (not e!328116))))

(declare-fun arrayContainsKey!0 (array!35744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570498 (= res!360279 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570499 () Bool)

(declare-fun res!360273 () Bool)

(assert (=> b!570499 (=> (not res!360273) (not e!328114))))

(declare-datatypes ((List!11242 0))(
  ( (Nil!11239) (Cons!11238 (h!12262 (_ BitVec 64)) (t!17470 List!11242)) )
))
(declare-fun arrayNoDuplicates!0 (array!35744 (_ BitVec 32) List!11242) Bool)

(assert (=> b!570499 (= res!360273 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11239))))

(declare-fun b!570500 () Bool)

(declare-fun res!360271 () Bool)

(assert (=> b!570500 (=> (not res!360271) (not e!328116))))

(assert (=> b!570500 (= res!360271 (validKeyInArray!0 (select (arr!17162 a!3118) j!142)))))

(assert (= (and start!52284 res!360277) b!570491))

(assert (= (and b!570491 res!360281) b!570500))

(assert (= (and b!570500 res!360271) b!570494))

(assert (= (and b!570494 res!360274) b!570498))

(assert (= (and b!570498 res!360279) b!570495))

(assert (= (and b!570495 res!360280) b!570496))

(assert (= (and b!570496 res!360278) b!570499))

(assert (= (and b!570499 res!360273) b!570497))

(assert (= (and b!570497 res!360272) b!570492))

(assert (= (and b!570492 res!360276) b!570493))

(assert (= (and b!570493 (not res!360275)) b!570490))

(declare-fun m!549329 () Bool)

(assert (=> b!570492 m!549329))

(assert (=> b!570492 m!549329))

(declare-fun m!549331 () Bool)

(assert (=> b!570492 m!549331))

(declare-fun m!549333 () Bool)

(assert (=> b!570492 m!549333))

(declare-fun m!549335 () Bool)

(assert (=> b!570492 m!549335))

(assert (=> b!570490 m!549329))

(assert (=> b!570490 m!549329))

(declare-fun m!549337 () Bool)

(assert (=> b!570490 m!549337))

(assert (=> b!570500 m!549329))

(assert (=> b!570500 m!549329))

(declare-fun m!549339 () Bool)

(assert (=> b!570500 m!549339))

(declare-fun m!549341 () Bool)

(assert (=> b!570494 m!549341))

(declare-fun m!549343 () Bool)

(assert (=> start!52284 m!549343))

(declare-fun m!549345 () Bool)

(assert (=> start!52284 m!549345))

(declare-fun m!549347 () Bool)

(assert (=> b!570496 m!549347))

(declare-fun m!549349 () Bool)

(assert (=> b!570493 m!549349))

(assert (=> b!570493 m!549329))

(declare-fun m!549351 () Bool)

(assert (=> b!570495 m!549351))

(assert (=> b!570497 m!549329))

(declare-fun m!549353 () Bool)

(assert (=> b!570497 m!549353))

(assert (=> b!570497 m!549329))

(declare-fun m!549355 () Bool)

(assert (=> b!570497 m!549355))

(assert (=> b!570497 m!549329))

(declare-fun m!549357 () Bool)

(assert (=> b!570497 m!549357))

(declare-fun m!549359 () Bool)

(assert (=> b!570497 m!549359))

(assert (=> b!570497 m!549357))

(declare-fun m!549361 () Bool)

(assert (=> b!570497 m!549361))

(assert (=> b!570497 m!549357))

(declare-fun m!549363 () Bool)

(assert (=> b!570497 m!549363))

(declare-fun m!549365 () Bool)

(assert (=> b!570498 m!549365))

(declare-fun m!549367 () Bool)

(assert (=> b!570499 m!549367))

(push 1)

