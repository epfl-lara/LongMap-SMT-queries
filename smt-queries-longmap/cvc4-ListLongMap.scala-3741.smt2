; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51444 () Bool)

(assert start!51444)

(declare-datatypes ((SeekEntryResult!5404 0))(
  ( (MissingZero!5404 (index!23843 (_ BitVec 32))) (Found!5404 (index!23844 (_ BitVec 32))) (Intermediate!5404 (undefined!6216 Bool) (index!23845 (_ BitVec 32)) (x!52739 (_ BitVec 32))) (Undefined!5404) (MissingVacant!5404 (index!23846 (_ BitVec 32))) )
))
(declare-fun lt!256141 () SeekEntryResult!5404)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35309 0))(
  ( (array!35310 (arr!16955 (Array (_ BitVec 32) (_ BitVec 64))) (size!17319 (_ BitVec 32))) )
))
(declare-fun lt!256144 () array!35309)

(declare-fun lt!256139 () (_ BitVec 64))

(declare-fun b!562350 () Bool)

(declare-fun e!324083 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35309 (_ BitVec 32)) SeekEntryResult!5404)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35309 (_ BitVec 32)) SeekEntryResult!5404)

(assert (=> b!562350 (= e!324083 (= (seekEntryOrOpen!0 lt!256139 lt!256144 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52739 lt!256141) (index!23845 lt!256141) (index!23845 lt!256141) lt!256139 lt!256144 mask!3119)))))

(declare-fun b!562351 () Bool)

(declare-fun e!324085 () Bool)

(declare-fun e!324082 () Bool)

(assert (=> b!562351 (= e!324085 e!324082)))

(declare-fun res!353511 () Bool)

(assert (=> b!562351 (=> res!353511 e!324082)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256142 () (_ BitVec 64))

(declare-fun a!3118 () array!35309)

(assert (=> b!562351 (= res!353511 (or (= lt!256142 (select (arr!16955 a!3118) j!142)) (= lt!256142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562351 (= lt!256142 (select (arr!16955 a!3118) (index!23845 lt!256141)))))

(declare-fun b!562352 () Bool)

(declare-fun e!324081 () Bool)

(declare-fun e!324080 () Bool)

(assert (=> b!562352 (= e!324081 e!324080)))

(declare-fun res!353512 () Bool)

(assert (=> b!562352 (=> (not res!353512) (not e!324080))))

(declare-fun lt!256140 () SeekEntryResult!5404)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562352 (= res!353512 (or (= lt!256140 (MissingZero!5404 i!1132)) (= lt!256140 (MissingVacant!5404 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!562352 (= lt!256140 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562353 () Bool)

(declare-fun res!353505 () Bool)

(assert (=> b!562353 (=> (not res!353505) (not e!324081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562353 (= res!353505 (validKeyInArray!0 k!1914))))

(declare-fun b!562354 () Bool)

(declare-fun res!353506 () Bool)

(assert (=> b!562354 (=> (not res!353506) (not e!324080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35309 (_ BitVec 32)) Bool)

(assert (=> b!562354 (= res!353506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562355 () Bool)

(declare-fun res!353504 () Bool)

(assert (=> b!562355 (=> (not res!353504) (not e!324081))))

(declare-fun arrayContainsKey!0 (array!35309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562355 (= res!353504 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562356 () Bool)

(declare-fun e!324086 () Bool)

(assert (=> b!562356 (= e!324086 (not true))))

(declare-fun e!324087 () Bool)

(assert (=> b!562356 e!324087))

(declare-fun res!353501 () Bool)

(assert (=> b!562356 (=> (not res!353501) (not e!324087))))

(declare-fun lt!256145 () SeekEntryResult!5404)

(assert (=> b!562356 (= res!353501 (= lt!256145 (Found!5404 j!142)))))

(assert (=> b!562356 (= lt!256145 (seekEntryOrOpen!0 (select (arr!16955 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562356 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17582 0))(
  ( (Unit!17583) )
))
(declare-fun lt!256147 () Unit!17582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17582)

(assert (=> b!562356 (= lt!256147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562357 () Bool)

(assert (=> b!562357 (= e!324080 e!324086)))

(declare-fun res!353509 () Bool)

(assert (=> b!562357 (=> (not res!353509) (not e!324086))))

(declare-fun lt!256146 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35309 (_ BitVec 32)) SeekEntryResult!5404)

(assert (=> b!562357 (= res!353509 (= lt!256141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256146 lt!256139 lt!256144 mask!3119)))))

(declare-fun lt!256143 () (_ BitVec 32))

(assert (=> b!562357 (= lt!256141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256143 (select (arr!16955 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562357 (= lt!256146 (toIndex!0 lt!256139 mask!3119))))

(assert (=> b!562357 (= lt!256139 (select (store (arr!16955 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562357 (= lt!256143 (toIndex!0 (select (arr!16955 a!3118) j!142) mask!3119))))

(assert (=> b!562357 (= lt!256144 (array!35310 (store (arr!16955 a!3118) i!1132 k!1914) (size!17319 a!3118)))))

(declare-fun res!353507 () Bool)

(assert (=> start!51444 (=> (not res!353507) (not e!324081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51444 (= res!353507 (validMask!0 mask!3119))))

(assert (=> start!51444 e!324081))

(assert (=> start!51444 true))

(declare-fun array_inv!12751 (array!35309) Bool)

(assert (=> start!51444 (array_inv!12751 a!3118)))

(declare-fun b!562349 () Bool)

(assert (=> b!562349 (= e!324087 e!324085)))

(declare-fun res!353502 () Bool)

(assert (=> b!562349 (=> res!353502 e!324085)))

(assert (=> b!562349 (= res!353502 (or (undefined!6216 lt!256141) (not (is-Intermediate!5404 lt!256141))))))

(declare-fun b!562358 () Bool)

(assert (=> b!562358 (= e!324082 e!324083)))

(declare-fun res!353508 () Bool)

(assert (=> b!562358 (=> (not res!353508) (not e!324083))))

(assert (=> b!562358 (= res!353508 (= lt!256145 (seekKeyOrZeroReturnVacant!0 (x!52739 lt!256141) (index!23845 lt!256141) (index!23845 lt!256141) (select (arr!16955 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562359 () Bool)

(declare-fun res!353510 () Bool)

(assert (=> b!562359 (=> (not res!353510) (not e!324081))))

(assert (=> b!562359 (= res!353510 (and (= (size!17319 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17319 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17319 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562360 () Bool)

(declare-fun res!353513 () Bool)

(assert (=> b!562360 (=> (not res!353513) (not e!324080))))

(declare-datatypes ((List!11035 0))(
  ( (Nil!11032) (Cons!11031 (h!12034 (_ BitVec 64)) (t!17263 List!11035)) )
))
(declare-fun arrayNoDuplicates!0 (array!35309 (_ BitVec 32) List!11035) Bool)

(assert (=> b!562360 (= res!353513 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11032))))

(declare-fun b!562361 () Bool)

(declare-fun res!353503 () Bool)

(assert (=> b!562361 (=> (not res!353503) (not e!324081))))

(assert (=> b!562361 (= res!353503 (validKeyInArray!0 (select (arr!16955 a!3118) j!142)))))

(assert (= (and start!51444 res!353507) b!562359))

(assert (= (and b!562359 res!353510) b!562361))

(assert (= (and b!562361 res!353503) b!562353))

(assert (= (and b!562353 res!353505) b!562355))

(assert (= (and b!562355 res!353504) b!562352))

(assert (= (and b!562352 res!353512) b!562354))

(assert (= (and b!562354 res!353506) b!562360))

(assert (= (and b!562360 res!353513) b!562357))

(assert (= (and b!562357 res!353509) b!562356))

(assert (= (and b!562356 res!353501) b!562349))

(assert (= (and b!562349 (not res!353502)) b!562351))

(assert (= (and b!562351 (not res!353511)) b!562358))

(assert (= (and b!562358 res!353508) b!562350))

(declare-fun m!540361 () Bool)

(assert (=> b!562360 m!540361))

(declare-fun m!540363 () Bool)

(assert (=> b!562351 m!540363))

(declare-fun m!540365 () Bool)

(assert (=> b!562351 m!540365))

(declare-fun m!540367 () Bool)

(assert (=> b!562350 m!540367))

(declare-fun m!540369 () Bool)

(assert (=> b!562350 m!540369))

(assert (=> b!562356 m!540363))

(assert (=> b!562356 m!540363))

(declare-fun m!540371 () Bool)

(assert (=> b!562356 m!540371))

(declare-fun m!540373 () Bool)

(assert (=> b!562356 m!540373))

(declare-fun m!540375 () Bool)

(assert (=> b!562356 m!540375))

(declare-fun m!540377 () Bool)

(assert (=> b!562355 m!540377))

(declare-fun m!540379 () Bool)

(assert (=> b!562352 m!540379))

(declare-fun m!540381 () Bool)

(assert (=> b!562354 m!540381))

(assert (=> b!562357 m!540363))

(declare-fun m!540383 () Bool)

(assert (=> b!562357 m!540383))

(assert (=> b!562357 m!540363))

(declare-fun m!540385 () Bool)

(assert (=> b!562357 m!540385))

(declare-fun m!540387 () Bool)

(assert (=> b!562357 m!540387))

(assert (=> b!562357 m!540363))

(declare-fun m!540389 () Bool)

(assert (=> b!562357 m!540389))

(declare-fun m!540391 () Bool)

(assert (=> b!562357 m!540391))

(declare-fun m!540393 () Bool)

(assert (=> b!562357 m!540393))

(declare-fun m!540395 () Bool)

(assert (=> b!562353 m!540395))

(assert (=> b!562361 m!540363))

(assert (=> b!562361 m!540363))

(declare-fun m!540397 () Bool)

(assert (=> b!562361 m!540397))

(assert (=> b!562358 m!540363))

(assert (=> b!562358 m!540363))

(declare-fun m!540399 () Bool)

(assert (=> b!562358 m!540399))

(declare-fun m!540401 () Bool)

(assert (=> start!51444 m!540401))

(declare-fun m!540403 () Bool)

(assert (=> start!51444 m!540403))

(push 1)

