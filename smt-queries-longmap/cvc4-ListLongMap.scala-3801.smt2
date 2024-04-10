; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52164 () Bool)

(assert start!52164)

(declare-fun b!569373 () Bool)

(declare-fun res!359399 () Bool)

(declare-fun e!327552 () Bool)

(assert (=> b!569373 (=> (not res!359399) (not e!327552))))

(declare-datatypes ((array!35687 0))(
  ( (array!35688 (arr!17135 (Array (_ BitVec 32) (_ BitVec 64))) (size!17499 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35687)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569373 (= res!359399 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569374 () Bool)

(declare-fun e!327549 () Bool)

(declare-fun e!327551 () Bool)

(assert (=> b!569374 (= e!327549 e!327551)))

(declare-fun res!359397 () Bool)

(assert (=> b!569374 (=> (not res!359397) (not e!327551))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!259500 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5584 0))(
  ( (MissingZero!5584 (index!24563 (_ BitVec 32))) (Found!5584 (index!24564 (_ BitVec 32))) (Intermediate!5584 (undefined!6396 Bool) (index!24565 (_ BitVec 32)) (x!53435 (_ BitVec 32))) (Undefined!5584) (MissingVacant!5584 (index!24566 (_ BitVec 32))) )
))
(declare-fun lt!259501 () SeekEntryResult!5584)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35687 (_ BitVec 32)) SeekEntryResult!5584)

(assert (=> b!569374 (= res!359397 (= lt!259501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259500 (select (store (arr!17135 a!3118) i!1132 k!1914) j!142) (array!35688 (store (arr!17135 a!3118) i!1132 k!1914) (size!17499 a!3118)) mask!3119)))))

(declare-fun lt!259502 () (_ BitVec 32))

(assert (=> b!569374 (= lt!259501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259502 (select (arr!17135 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569374 (= lt!259500 (toIndex!0 (select (store (arr!17135 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569374 (= lt!259502 (toIndex!0 (select (arr!17135 a!3118) j!142) mask!3119))))

(declare-fun b!569375 () Bool)

(declare-fun res!359395 () Bool)

(assert (=> b!569375 (=> (not res!359395) (not e!327552))))

(assert (=> b!569375 (= res!359395 (and (= (size!17499 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17499 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17499 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569376 () Bool)

(declare-fun res!359393 () Bool)

(assert (=> b!569376 (=> (not res!359393) (not e!327549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35687 (_ BitVec 32)) Bool)

(assert (=> b!569376 (= res!359393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569377 () Bool)

(declare-fun res!359392 () Bool)

(assert (=> b!569377 (=> (not res!359392) (not e!327552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569377 (= res!359392 (validKeyInArray!0 (select (arr!17135 a!3118) j!142)))))

(declare-fun b!569378 () Bool)

(assert (=> b!569378 (= e!327552 e!327549)))

(declare-fun res!359391 () Bool)

(assert (=> b!569378 (=> (not res!359391) (not e!327549))))

(declare-fun lt!259503 () SeekEntryResult!5584)

(assert (=> b!569378 (= res!359391 (or (= lt!259503 (MissingZero!5584 i!1132)) (= lt!259503 (MissingVacant!5584 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35687 (_ BitVec 32)) SeekEntryResult!5584)

(assert (=> b!569378 (= lt!259503 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569380 () Bool)

(assert (=> b!569380 (= e!327551 (not (or (undefined!6396 lt!259501) (not (is-Intermediate!5584 lt!259501)) (= (select (arr!17135 a!3118) (index!24565 lt!259501)) (select (arr!17135 a!3118) j!142)) (not (= (select (arr!17135 a!3118) (index!24565 lt!259501)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!259504 () SeekEntryResult!5584)

(assert (=> b!569380 (and (= lt!259504 (Found!5584 j!142)) (or (undefined!6396 lt!259501) (not (is-Intermediate!5584 lt!259501)) (= (select (arr!17135 a!3118) (index!24565 lt!259501)) (select (arr!17135 a!3118) j!142)) (not (= (select (arr!17135 a!3118) (index!24565 lt!259501)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259504 (MissingZero!5584 (index!24565 lt!259501)))))))

(assert (=> b!569380 (= lt!259504 (seekEntryOrOpen!0 (select (arr!17135 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569380 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17870 0))(
  ( (Unit!17871) )
))
(declare-fun lt!259499 () Unit!17870)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17870)

(assert (=> b!569380 (= lt!259499 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569381 () Bool)

(declare-fun res!359398 () Bool)

(assert (=> b!569381 (=> (not res!359398) (not e!327552))))

(assert (=> b!569381 (= res!359398 (validKeyInArray!0 k!1914))))

(declare-fun b!569379 () Bool)

(declare-fun res!359394 () Bool)

(assert (=> b!569379 (=> (not res!359394) (not e!327549))))

(declare-datatypes ((List!11215 0))(
  ( (Nil!11212) (Cons!11211 (h!12232 (_ BitVec 64)) (t!17443 List!11215)) )
))
(declare-fun arrayNoDuplicates!0 (array!35687 (_ BitVec 32) List!11215) Bool)

(assert (=> b!569379 (= res!359394 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11212))))

(declare-fun res!359396 () Bool)

(assert (=> start!52164 (=> (not res!359396) (not e!327552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52164 (= res!359396 (validMask!0 mask!3119))))

(assert (=> start!52164 e!327552))

(assert (=> start!52164 true))

(declare-fun array_inv!12931 (array!35687) Bool)

(assert (=> start!52164 (array_inv!12931 a!3118)))

(assert (= (and start!52164 res!359396) b!569375))

(assert (= (and b!569375 res!359395) b!569377))

(assert (= (and b!569377 res!359392) b!569381))

(assert (= (and b!569381 res!359398) b!569373))

(assert (= (and b!569373 res!359399) b!569378))

(assert (= (and b!569378 res!359391) b!569376))

(assert (= (and b!569376 res!359393) b!569379))

(assert (= (and b!569379 res!359394) b!569374))

(assert (= (and b!569374 res!359397) b!569380))

(declare-fun m!548077 () Bool)

(assert (=> b!569373 m!548077))

(declare-fun m!548079 () Bool)

(assert (=> b!569376 m!548079))

(declare-fun m!548081 () Bool)

(assert (=> b!569381 m!548081))

(declare-fun m!548083 () Bool)

(assert (=> b!569378 m!548083))

(declare-fun m!548085 () Bool)

(assert (=> b!569374 m!548085))

(declare-fun m!548087 () Bool)

(assert (=> b!569374 m!548087))

(assert (=> b!569374 m!548085))

(declare-fun m!548089 () Bool)

(assert (=> b!569374 m!548089))

(assert (=> b!569374 m!548085))

(declare-fun m!548091 () Bool)

(assert (=> b!569374 m!548091))

(assert (=> b!569374 m!548089))

(declare-fun m!548093 () Bool)

(assert (=> b!569374 m!548093))

(assert (=> b!569374 m!548089))

(declare-fun m!548095 () Bool)

(assert (=> b!569374 m!548095))

(declare-fun m!548097 () Bool)

(assert (=> b!569374 m!548097))

(declare-fun m!548099 () Bool)

(assert (=> start!52164 m!548099))

(declare-fun m!548101 () Bool)

(assert (=> start!52164 m!548101))

(assert (=> b!569377 m!548085))

(assert (=> b!569377 m!548085))

(declare-fun m!548103 () Bool)

(assert (=> b!569377 m!548103))

(declare-fun m!548105 () Bool)

(assert (=> b!569379 m!548105))

(assert (=> b!569380 m!548085))

(declare-fun m!548107 () Bool)

(assert (=> b!569380 m!548107))

(declare-fun m!548109 () Bool)

(assert (=> b!569380 m!548109))

(declare-fun m!548111 () Bool)

(assert (=> b!569380 m!548111))

(assert (=> b!569380 m!548085))

(declare-fun m!548113 () Bool)

(assert (=> b!569380 m!548113))

(push 1)

