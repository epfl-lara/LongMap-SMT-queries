; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52434 () Bool)

(assert start!52434)

(declare-fun b!572426 () Bool)

(declare-fun res!361942 () Bool)

(declare-fun e!329270 () Bool)

(assert (=> b!572426 (=> (not res!361942) (not e!329270))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35831 0))(
  ( (array!35832 (arr!17204 (Array (_ BitVec 32) (_ BitVec 64))) (size!17568 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35831)

(assert (=> b!572426 (= res!361942 (and (= (size!17568 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17568 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17568 a!3118)) (not (= i!1132 j!142))))))

(declare-fun lt!261232 () (_ BitVec 64))

(declare-fun e!329271 () Bool)

(declare-fun lt!261234 () array!35831)

(declare-fun b!572427 () Bool)

(declare-datatypes ((SeekEntryResult!5653 0))(
  ( (MissingZero!5653 (index!24839 (_ BitVec 32))) (Found!5653 (index!24840 (_ BitVec 32))) (Intermediate!5653 (undefined!6465 Bool) (index!24841 (_ BitVec 32)) (x!53706 (_ BitVec 32))) (Undefined!5653) (MissingVacant!5653 (index!24842 (_ BitVec 32))) )
))
(declare-fun lt!261231 () SeekEntryResult!5653)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35831 (_ BitVec 32)) SeekEntryResult!5653)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35831 (_ BitVec 32)) SeekEntryResult!5653)

(assert (=> b!572427 (= e!329271 (= (seekEntryOrOpen!0 lt!261232 lt!261234 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53706 lt!261231) (index!24841 lt!261231) (index!24841 lt!261231) lt!261232 lt!261234 mask!3119)))))

(declare-fun b!572428 () Bool)

(declare-fun res!361938 () Bool)

(assert (=> b!572428 (=> (not res!361938) (not e!329270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572428 (= res!361938 (validKeyInArray!0 (select (arr!17204 a!3118) j!142)))))

(declare-fun b!572429 () Bool)

(declare-fun e!329274 () Bool)

(declare-fun e!329272 () Bool)

(assert (=> b!572429 (= e!329274 e!329272)))

(declare-fun res!361944 () Bool)

(assert (=> b!572429 (=> res!361944 e!329272)))

(assert (=> b!572429 (= res!361944 (or (undefined!6465 lt!261231) (not (is-Intermediate!5653 lt!261231))))))

(declare-fun b!572430 () Bool)

(declare-fun res!361937 () Bool)

(assert (=> b!572430 (=> (not res!361937) (not e!329270))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572430 (= res!361937 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572431 () Bool)

(declare-fun e!329273 () Bool)

(declare-fun e!329269 () Bool)

(assert (=> b!572431 (= e!329273 e!329269)))

(declare-fun res!361939 () Bool)

(assert (=> b!572431 (=> (not res!361939) (not e!329269))))

(declare-fun lt!261229 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35831 (_ BitVec 32)) SeekEntryResult!5653)

(assert (=> b!572431 (= res!361939 (= lt!261231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261229 lt!261232 lt!261234 mask!3119)))))

(declare-fun lt!261233 () (_ BitVec 32))

(assert (=> b!572431 (= lt!261231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261233 (select (arr!17204 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572431 (= lt!261229 (toIndex!0 lt!261232 mask!3119))))

(assert (=> b!572431 (= lt!261232 (select (store (arr!17204 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572431 (= lt!261233 (toIndex!0 (select (arr!17204 a!3118) j!142) mask!3119))))

(assert (=> b!572431 (= lt!261234 (array!35832 (store (arr!17204 a!3118) i!1132 k!1914) (size!17568 a!3118)))))

(declare-fun b!572432 () Bool)

(declare-fun res!361936 () Bool)

(assert (=> b!572432 (=> (not res!361936) (not e!329273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35831 (_ BitVec 32)) Bool)

(assert (=> b!572432 (= res!361936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572433 () Bool)

(declare-fun res!361934 () Bool)

(assert (=> b!572433 (=> (not res!361934) (not e!329270))))

(assert (=> b!572433 (= res!361934 (validKeyInArray!0 k!1914))))

(declare-fun b!572434 () Bool)

(assert (=> b!572434 (= e!329270 e!329273)))

(declare-fun res!361935 () Bool)

(assert (=> b!572434 (=> (not res!361935) (not e!329273))))

(declare-fun lt!261228 () SeekEntryResult!5653)

(assert (=> b!572434 (= res!361935 (or (= lt!261228 (MissingZero!5653 i!1132)) (= lt!261228 (MissingVacant!5653 i!1132))))))

(assert (=> b!572434 (= lt!261228 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572435 () Bool)

(declare-fun e!329268 () Bool)

(assert (=> b!572435 (= e!329272 e!329268)))

(declare-fun res!361943 () Bool)

(assert (=> b!572435 (=> res!361943 e!329268)))

(declare-fun lt!261235 () (_ BitVec 64))

(assert (=> b!572435 (= res!361943 (or (= lt!261235 (select (arr!17204 a!3118) j!142)) (= lt!261235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572435 (= lt!261235 (select (arr!17204 a!3118) (index!24841 lt!261231)))))

(declare-fun b!572436 () Bool)

(assert (=> b!572436 (= e!329268 e!329271)))

(declare-fun res!361941 () Bool)

(assert (=> b!572436 (=> (not res!361941) (not e!329271))))

(declare-fun lt!261227 () SeekEntryResult!5653)

(assert (=> b!572436 (= res!361941 (= lt!261227 (seekKeyOrZeroReturnVacant!0 (x!53706 lt!261231) (index!24841 lt!261231) (index!24841 lt!261231) (select (arr!17204 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!361940 () Bool)

(assert (=> start!52434 (=> (not res!361940) (not e!329270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52434 (= res!361940 (validMask!0 mask!3119))))

(assert (=> start!52434 e!329270))

(assert (=> start!52434 true))

(declare-fun array_inv!13000 (array!35831) Bool)

(assert (=> start!52434 (array_inv!13000 a!3118)))

(declare-fun b!572437 () Bool)

(declare-fun res!361946 () Bool)

(assert (=> b!572437 (=> (not res!361946) (not e!329273))))

(declare-datatypes ((List!11284 0))(
  ( (Nil!11281) (Cons!11280 (h!12307 (_ BitVec 64)) (t!17512 List!11284)) )
))
(declare-fun arrayNoDuplicates!0 (array!35831 (_ BitVec 32) List!11284) Bool)

(assert (=> b!572437 (= res!361946 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11281))))

(declare-fun b!572438 () Bool)

(assert (=> b!572438 (= e!329269 (not true))))

(assert (=> b!572438 e!329274))

(declare-fun res!361945 () Bool)

(assert (=> b!572438 (=> (not res!361945) (not e!329274))))

(assert (=> b!572438 (= res!361945 (= lt!261227 (Found!5653 j!142)))))

(assert (=> b!572438 (= lt!261227 (seekEntryOrOpen!0 (select (arr!17204 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572438 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18008 0))(
  ( (Unit!18009) )
))
(declare-fun lt!261230 () Unit!18008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18008)

(assert (=> b!572438 (= lt!261230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52434 res!361940) b!572426))

(assert (= (and b!572426 res!361942) b!572428))

(assert (= (and b!572428 res!361938) b!572433))

(assert (= (and b!572433 res!361934) b!572430))

(assert (= (and b!572430 res!361937) b!572434))

(assert (= (and b!572434 res!361935) b!572432))

(assert (= (and b!572432 res!361936) b!572437))

(assert (= (and b!572437 res!361946) b!572431))

(assert (= (and b!572431 res!361939) b!572438))

(assert (= (and b!572438 res!361945) b!572429))

(assert (= (and b!572429 (not res!361944)) b!572435))

(assert (= (and b!572435 (not res!361943)) b!572436))

(assert (= (and b!572436 res!361941) b!572427))

(declare-fun m!551401 () Bool)

(assert (=> b!572430 m!551401))

(declare-fun m!551403 () Bool)

(assert (=> b!572432 m!551403))

(declare-fun m!551405 () Bool)

(assert (=> b!572437 m!551405))

(declare-fun m!551407 () Bool)

(assert (=> b!572433 m!551407))

(declare-fun m!551409 () Bool)

(assert (=> b!572438 m!551409))

(assert (=> b!572438 m!551409))

(declare-fun m!551411 () Bool)

(assert (=> b!572438 m!551411))

(declare-fun m!551413 () Bool)

(assert (=> b!572438 m!551413))

(declare-fun m!551415 () Bool)

(assert (=> b!572438 m!551415))

(assert (=> b!572431 m!551409))

(declare-fun m!551417 () Bool)

(assert (=> b!572431 m!551417))

(declare-fun m!551419 () Bool)

(assert (=> b!572431 m!551419))

(assert (=> b!572431 m!551409))

(assert (=> b!572431 m!551409))

(declare-fun m!551421 () Bool)

(assert (=> b!572431 m!551421))

(declare-fun m!551423 () Bool)

(assert (=> b!572431 m!551423))

(declare-fun m!551425 () Bool)

(assert (=> b!572431 m!551425))

(declare-fun m!551427 () Bool)

(assert (=> b!572431 m!551427))

(assert (=> b!572436 m!551409))

(assert (=> b!572436 m!551409))

(declare-fun m!551429 () Bool)

(assert (=> b!572436 m!551429))

(declare-fun m!551431 () Bool)

(assert (=> start!52434 m!551431))

(declare-fun m!551433 () Bool)

(assert (=> start!52434 m!551433))

(assert (=> b!572428 m!551409))

(assert (=> b!572428 m!551409))

(declare-fun m!551435 () Bool)

(assert (=> b!572428 m!551435))

(declare-fun m!551437 () Bool)

(assert (=> b!572434 m!551437))

(declare-fun m!551439 () Bool)

(assert (=> b!572427 m!551439))

(declare-fun m!551441 () Bool)

(assert (=> b!572427 m!551441))

(assert (=> b!572435 m!551409))

(declare-fun m!551443 () Bool)

(assert (=> b!572435 m!551443))

(push 1)

