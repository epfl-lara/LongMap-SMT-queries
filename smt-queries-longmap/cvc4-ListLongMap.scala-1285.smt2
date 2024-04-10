; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26272 () Bool)

(assert start!26272)

(declare-fun b!272092 () Bool)

(declare-fun res!136084 () Bool)

(declare-fun e!174740 () Bool)

(assert (=> b!272092 (=> (not res!136084) (not e!174740))))

(declare-datatypes ((array!13369 0))(
  ( (array!13370 (arr!6334 (Array (_ BitVec 32) (_ BitVec 64))) (size!6686 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13369)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272092 (= res!136084 (validKeyInArray!0 (select (arr!6334 a!3325) startIndex!26)))))

(declare-fun b!272093 () Bool)

(declare-fun res!136082 () Bool)

(declare-fun e!174738 () Bool)

(assert (=> b!272093 (=> (not res!136082) (not e!174738))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!272093 (= res!136082 (validKeyInArray!0 k!2581))))

(declare-fun b!272094 () Bool)

(declare-fun res!136085 () Bool)

(assert (=> b!272094 (=> (not res!136085) (not e!174738))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!272094 (= res!136085 (and (= (size!6686 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6686 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6686 a!3325))))))

(declare-fun b!272095 () Bool)

(declare-fun res!136083 () Bool)

(assert (=> b!272095 (=> (not res!136083) (not e!174740))))

(assert (=> b!272095 (= res!136083 (not (= startIndex!26 i!1267)))))

(declare-fun b!272096 () Bool)

(declare-fun res!136081 () Bool)

(assert (=> b!272096 (=> (not res!136081) (not e!174738))))

(declare-fun arrayContainsKey!0 (array!13369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272096 (= res!136081 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272097 () Bool)

(assert (=> b!272097 (= e!174738 e!174740)))

(declare-fun res!136087 () Bool)

(assert (=> b!272097 (=> (not res!136087) (not e!174740))))

(declare-datatypes ((SeekEntryResult!1492 0))(
  ( (MissingZero!1492 (index!8138 (_ BitVec 32))) (Found!1492 (index!8139 (_ BitVec 32))) (Intermediate!1492 (undefined!2304 Bool) (index!8140 (_ BitVec 32)) (x!26457 (_ BitVec 32))) (Undefined!1492) (MissingVacant!1492 (index!8141 (_ BitVec 32))) )
))
(declare-fun lt!135925 () SeekEntryResult!1492)

(assert (=> b!272097 (= res!136087 (or (= lt!135925 (MissingZero!1492 i!1267)) (= lt!135925 (MissingVacant!1492 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13369 (_ BitVec 32)) SeekEntryResult!1492)

(assert (=> b!272097 (= lt!135925 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272098 () Bool)

(declare-fun res!136089 () Bool)

(assert (=> b!272098 (=> (not res!136089) (not e!174738))))

(declare-datatypes ((List!4142 0))(
  ( (Nil!4139) (Cons!4138 (h!4805 (_ BitVec 64)) (t!9224 List!4142)) )
))
(declare-fun arrayNoDuplicates!0 (array!13369 (_ BitVec 32) List!4142) Bool)

(assert (=> b!272098 (= res!136089 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4139))))

(declare-fun b!272099 () Bool)

(declare-fun res!136088 () Bool)

(assert (=> b!272099 (=> (not res!136088) (not e!174740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13369 (_ BitVec 32)) Bool)

(assert (=> b!272099 (= res!136088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!136086 () Bool)

(assert (=> start!26272 (=> (not res!136086) (not e!174738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26272 (= res!136086 (validMask!0 mask!3868))))

(assert (=> start!26272 e!174738))

(declare-fun array_inv!4297 (array!13369) Bool)

(assert (=> start!26272 (array_inv!4297 a!3325)))

(assert (=> start!26272 true))

(declare-fun b!272091 () Bool)

(assert (=> b!272091 (= e!174740 (not true))))

(assert (=> b!272091 (arrayNoDuplicates!0 (array!13370 (store (arr!6334 a!3325) i!1267 k!2581) (size!6686 a!3325)) #b00000000000000000000000000000000 Nil!4139)))

(declare-datatypes ((Unit!8471 0))(
  ( (Unit!8472) )
))
(declare-fun lt!135924 () Unit!8471)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13369 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4142) Unit!8471)

(assert (=> b!272091 (= lt!135924 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4139))))

(assert (= (and start!26272 res!136086) b!272094))

(assert (= (and b!272094 res!136085) b!272093))

(assert (= (and b!272093 res!136082) b!272098))

(assert (= (and b!272098 res!136089) b!272096))

(assert (= (and b!272096 res!136081) b!272097))

(assert (= (and b!272097 res!136087) b!272099))

(assert (= (and b!272099 res!136088) b!272095))

(assert (= (and b!272095 res!136083) b!272092))

(assert (= (and b!272092 res!136084) b!272091))

(declare-fun m!287229 () Bool)

(assert (=> start!26272 m!287229))

(declare-fun m!287231 () Bool)

(assert (=> start!26272 m!287231))

(declare-fun m!287233 () Bool)

(assert (=> b!272091 m!287233))

(declare-fun m!287235 () Bool)

(assert (=> b!272091 m!287235))

(declare-fun m!287237 () Bool)

(assert (=> b!272091 m!287237))

(declare-fun m!287239 () Bool)

(assert (=> b!272098 m!287239))

(declare-fun m!287241 () Bool)

(assert (=> b!272096 m!287241))

(declare-fun m!287243 () Bool)

(assert (=> b!272097 m!287243))

(declare-fun m!287245 () Bool)

(assert (=> b!272093 m!287245))

(declare-fun m!287247 () Bool)

(assert (=> b!272092 m!287247))

(assert (=> b!272092 m!287247))

(declare-fun m!287249 () Bool)

(assert (=> b!272092 m!287249))

(declare-fun m!287251 () Bool)

(assert (=> b!272099 m!287251))

(push 1)

(assert (not b!272092))

