; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26268 () Bool)

(assert start!26268)

(declare-fun res!136049 () Bool)

(declare-fun e!174745 () Bool)

(assert (=> start!26268 (=> (not res!136049) (not e!174745))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26268 (= res!136049 (validMask!0 mask!3868))))

(assert (=> start!26268 e!174745))

(declare-datatypes ((array!13364 0))(
  ( (array!13365 (arr!6331 (Array (_ BitVec 32) (_ BitVec 64))) (size!6683 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13364)

(declare-fun array_inv!4281 (array!13364) Bool)

(assert (=> start!26268 (array_inv!4281 a!3325)))

(assert (=> start!26268 true))

(declare-fun b!272084 () Bool)

(declare-fun e!174744 () Bool)

(assert (=> b!272084 (= e!174745 e!174744)))

(declare-fun res!136054 () Bool)

(assert (=> b!272084 (=> (not res!136054) (not e!174744))))

(declare-datatypes ((SeekEntryResult!1454 0))(
  ( (MissingZero!1454 (index!7986 (_ BitVec 32))) (Found!1454 (index!7987 (_ BitVec 32))) (Intermediate!1454 (undefined!2266 Bool) (index!7988 (_ BitVec 32)) (x!26419 (_ BitVec 32))) (Undefined!1454) (MissingVacant!1454 (index!7989 (_ BitVec 32))) )
))
(declare-fun lt!135972 () SeekEntryResult!1454)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272084 (= res!136054 (or (= lt!135972 (MissingZero!1454 i!1267)) (= lt!135972 (MissingVacant!1454 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13364 (_ BitVec 32)) SeekEntryResult!1454)

(assert (=> b!272084 (= lt!135972 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272085 () Bool)

(declare-fun res!136056 () Bool)

(assert (=> b!272085 (=> (not res!136056) (not e!174745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272085 (= res!136056 (validKeyInArray!0 k0!2581))))

(declare-fun b!272086 () Bool)

(declare-fun res!136050 () Bool)

(assert (=> b!272086 (=> (not res!136050) (not e!174745))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272086 (= res!136050 (and (= (size!6683 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6683 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6683 a!3325))))))

(declare-fun b!272087 () Bool)

(assert (=> b!272087 (= e!174744 (not true))))

(declare-datatypes ((List!4052 0))(
  ( (Nil!4049) (Cons!4048 (h!4715 (_ BitVec 64)) (t!9126 List!4052)) )
))
(declare-fun arrayNoDuplicates!0 (array!13364 (_ BitVec 32) List!4052) Bool)

(assert (=> b!272087 (arrayNoDuplicates!0 (array!13365 (store (arr!6331 a!3325) i!1267 k0!2581) (size!6683 a!3325)) #b00000000000000000000000000000000 Nil!4049)))

(declare-datatypes ((Unit!8447 0))(
  ( (Unit!8448) )
))
(declare-fun lt!135971 () Unit!8447)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13364 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4052) Unit!8447)

(assert (=> b!272087 (= lt!135971 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4049))))

(declare-fun b!272088 () Bool)

(declare-fun res!136053 () Bool)

(assert (=> b!272088 (=> (not res!136053) (not e!174745))))

(assert (=> b!272088 (= res!136053 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4049))))

(declare-fun b!272089 () Bool)

(declare-fun res!136051 () Bool)

(assert (=> b!272089 (=> (not res!136051) (not e!174744))))

(assert (=> b!272089 (= res!136051 (not (= startIndex!26 i!1267)))))

(declare-fun b!272090 () Bool)

(declare-fun res!136055 () Bool)

(assert (=> b!272090 (=> (not res!136055) (not e!174744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13364 (_ BitVec 32)) Bool)

(assert (=> b!272090 (= res!136055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272091 () Bool)

(declare-fun res!136052 () Bool)

(assert (=> b!272091 (=> (not res!136052) (not e!174745))))

(declare-fun arrayContainsKey!0 (array!13364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272091 (= res!136052 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272092 () Bool)

(declare-fun res!136048 () Bool)

(assert (=> b!272092 (=> (not res!136048) (not e!174744))))

(assert (=> b!272092 (= res!136048 (validKeyInArray!0 (select (arr!6331 a!3325) startIndex!26)))))

(assert (= (and start!26268 res!136049) b!272086))

(assert (= (and b!272086 res!136050) b!272085))

(assert (= (and b!272085 res!136056) b!272088))

(assert (= (and b!272088 res!136053) b!272091))

(assert (= (and b!272091 res!136052) b!272084))

(assert (= (and b!272084 res!136054) b!272090))

(assert (= (and b!272090 res!136055) b!272089))

(assert (= (and b!272089 res!136051) b!272092))

(assert (= (and b!272092 res!136048) b!272087))

(declare-fun m!287387 () Bool)

(assert (=> b!272084 m!287387))

(declare-fun m!287389 () Bool)

(assert (=> start!26268 m!287389))

(declare-fun m!287391 () Bool)

(assert (=> start!26268 m!287391))

(declare-fun m!287393 () Bool)

(assert (=> b!272091 m!287393))

(declare-fun m!287395 () Bool)

(assert (=> b!272087 m!287395))

(declare-fun m!287397 () Bool)

(assert (=> b!272087 m!287397))

(declare-fun m!287399 () Bool)

(assert (=> b!272087 m!287399))

(declare-fun m!287401 () Bool)

(assert (=> b!272090 m!287401))

(declare-fun m!287403 () Bool)

(assert (=> b!272092 m!287403))

(assert (=> b!272092 m!287403))

(declare-fun m!287405 () Bool)

(assert (=> b!272092 m!287405))

(declare-fun m!287407 () Bool)

(assert (=> b!272088 m!287407))

(declare-fun m!287409 () Bool)

(assert (=> b!272085 m!287409))

(check-sat (not b!272091) (not b!272092) (not b!272088) (not b!272085) (not b!272087) (not b!272084) (not b!272090) (not start!26268))
(check-sat)
