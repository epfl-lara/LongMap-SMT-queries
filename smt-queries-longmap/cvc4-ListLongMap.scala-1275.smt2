; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26212 () Bool)

(assert start!26212)

(declare-fun b!271061 () Bool)

(declare-fun res!135053 () Bool)

(declare-fun e!174468 () Bool)

(assert (=> b!271061 (=> (not res!135053) (not e!174468))))

(declare-datatypes ((List!4112 0))(
  ( (Nil!4109) (Cons!4108 (h!4775 (_ BitVec 64)) (t!9194 List!4112)) )
))
(declare-fun contains!1942 (List!4112 (_ BitVec 64)) Bool)

(assert (=> b!271061 (= res!135053 (not (contains!1942 Nil!4109 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271062 () Bool)

(declare-fun res!135051 () Bool)

(assert (=> b!271062 (=> (not res!135051) (not e!174468))))

(declare-datatypes ((array!13309 0))(
  ( (array!13310 (arr!6304 (Array (_ BitVec 32) (_ BitVec 64))) (size!6656 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13309)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13309 (_ BitVec 32)) Bool)

(assert (=> b!271062 (= res!135051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271063 () Bool)

(declare-fun res!135062 () Bool)

(declare-fun e!174469 () Bool)

(assert (=> b!271063 (=> (not res!135062) (not e!174469))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271063 (= res!135062 (validKeyInArray!0 k!2581))))

(declare-fun res!135059 () Bool)

(assert (=> start!26212 (=> (not res!135059) (not e!174469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26212 (= res!135059 (validMask!0 mask!3868))))

(assert (=> start!26212 e!174469))

(declare-fun array_inv!4267 (array!13309) Bool)

(assert (=> start!26212 (array_inv!4267 a!3325)))

(assert (=> start!26212 true))

(declare-fun b!271064 () Bool)

(declare-fun res!135058 () Bool)

(assert (=> b!271064 (=> (not res!135058) (not e!174469))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271064 (= res!135058 (and (= (size!6656 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6656 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6656 a!3325))))))

(declare-fun b!271065 () Bool)

(assert (=> b!271065 (= e!174468 false)))

(declare-fun lt!135745 () Bool)

(assert (=> b!271065 (= lt!135745 (contains!1942 Nil!4109 k!2581))))

(declare-fun b!271066 () Bool)

(declare-fun res!135063 () Bool)

(assert (=> b!271066 (=> (not res!135063) (not e!174468))))

(declare-fun noDuplicate!130 (List!4112) Bool)

(assert (=> b!271066 (= res!135063 (noDuplicate!130 Nil!4109))))

(declare-fun b!271067 () Bool)

(assert (=> b!271067 (= e!174469 e!174468)))

(declare-fun res!135052 () Bool)

(assert (=> b!271067 (=> (not res!135052) (not e!174468))))

(declare-datatypes ((SeekEntryResult!1462 0))(
  ( (MissingZero!1462 (index!8018 (_ BitVec 32))) (Found!1462 (index!8019 (_ BitVec 32))) (Intermediate!1462 (undefined!2274 Bool) (index!8020 (_ BitVec 32)) (x!26347 (_ BitVec 32))) (Undefined!1462) (MissingVacant!1462 (index!8021 (_ BitVec 32))) )
))
(declare-fun lt!135744 () SeekEntryResult!1462)

(assert (=> b!271067 (= res!135052 (or (= lt!135744 (MissingZero!1462 i!1267)) (= lt!135744 (MissingVacant!1462 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13309 (_ BitVec 32)) SeekEntryResult!1462)

(assert (=> b!271067 (= lt!135744 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271068 () Bool)

(declare-fun res!135061 () Bool)

(assert (=> b!271068 (=> (not res!135061) (not e!174469))))

(declare-fun arrayNoDuplicates!0 (array!13309 (_ BitVec 32) List!4112) Bool)

(assert (=> b!271068 (= res!135061 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4109))))

(declare-fun b!271069 () Bool)

(declare-fun res!135054 () Bool)

(assert (=> b!271069 (=> (not res!135054) (not e!174468))))

(assert (=> b!271069 (= res!135054 (and (bvslt (size!6656 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6656 a!3325))))))

(declare-fun b!271070 () Bool)

(declare-fun res!135057 () Bool)

(assert (=> b!271070 (=> (not res!135057) (not e!174468))))

(assert (=> b!271070 (= res!135057 (validKeyInArray!0 (select (arr!6304 a!3325) startIndex!26)))))

(declare-fun b!271071 () Bool)

(declare-fun res!135055 () Bool)

(assert (=> b!271071 (=> (not res!135055) (not e!174468))))

(assert (=> b!271071 (= res!135055 (not (contains!1942 Nil!4109 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271072 () Bool)

(declare-fun res!135060 () Bool)

(assert (=> b!271072 (=> (not res!135060) (not e!174469))))

(declare-fun arrayContainsKey!0 (array!13309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271072 (= res!135060 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271073 () Bool)

(declare-fun res!135056 () Bool)

(assert (=> b!271073 (=> (not res!135056) (not e!174468))))

(assert (=> b!271073 (= res!135056 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26212 res!135059) b!271064))

(assert (= (and b!271064 res!135058) b!271063))

(assert (= (and b!271063 res!135062) b!271068))

(assert (= (and b!271068 res!135061) b!271072))

(assert (= (and b!271072 res!135060) b!271067))

(assert (= (and b!271067 res!135052) b!271062))

(assert (= (and b!271062 res!135051) b!271073))

(assert (= (and b!271073 res!135056) b!271070))

(assert (= (and b!271070 res!135057) b!271069))

(assert (= (and b!271069 res!135054) b!271066))

(assert (= (and b!271066 res!135063) b!271071))

(assert (= (and b!271071 res!135055) b!271061))

(assert (= (and b!271061 res!135053) b!271065))

(declare-fun m!286471 () Bool)

(assert (=> start!26212 m!286471))

(declare-fun m!286473 () Bool)

(assert (=> start!26212 m!286473))

(declare-fun m!286475 () Bool)

(assert (=> b!271068 m!286475))

(declare-fun m!286477 () Bool)

(assert (=> b!271067 m!286477))

(declare-fun m!286479 () Bool)

(assert (=> b!271062 m!286479))

(declare-fun m!286481 () Bool)

(assert (=> b!271070 m!286481))

(assert (=> b!271070 m!286481))

(declare-fun m!286483 () Bool)

(assert (=> b!271070 m!286483))

(declare-fun m!286485 () Bool)

(assert (=> b!271065 m!286485))

(declare-fun m!286487 () Bool)

(assert (=> b!271066 m!286487))

(declare-fun m!286489 () Bool)

(assert (=> b!271061 m!286489))

(declare-fun m!286491 () Bool)

(assert (=> b!271063 m!286491))

(declare-fun m!286493 () Bool)

(assert (=> b!271072 m!286493))

(declare-fun m!286495 () Bool)

(assert (=> b!271071 m!286495))

(push 1)

(assert (not b!271063))

