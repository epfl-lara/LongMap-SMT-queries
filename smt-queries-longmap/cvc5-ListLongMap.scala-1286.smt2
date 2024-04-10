; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26274 () Bool)

(assert start!26274)

(declare-fun b!272118 () Bool)

(declare-fun res!136116 () Bool)

(declare-fun e!174747 () Bool)

(assert (=> b!272118 (=> (not res!136116) (not e!174747))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272118 (= res!136116 (not (= startIndex!26 i!1267)))))

(declare-fun b!272119 () Bool)

(declare-fun res!136111 () Bool)

(declare-fun e!174748 () Bool)

(assert (=> b!272119 (=> (not res!136111) (not e!174748))))

(declare-datatypes ((array!13371 0))(
  ( (array!13372 (arr!6335 (Array (_ BitVec 32) (_ BitVec 64))) (size!6687 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13371)

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!272119 (= res!136111 (and (= (size!6687 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6687 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6687 a!3325))))))

(declare-fun b!272120 () Bool)

(assert (=> b!272120 (= e!174748 e!174747)))

(declare-fun res!136113 () Bool)

(assert (=> b!272120 (=> (not res!136113) (not e!174747))))

(declare-datatypes ((SeekEntryResult!1493 0))(
  ( (MissingZero!1493 (index!8142 (_ BitVec 32))) (Found!1493 (index!8143 (_ BitVec 32))) (Intermediate!1493 (undefined!2305 Bool) (index!8144 (_ BitVec 32)) (x!26466 (_ BitVec 32))) (Undefined!1493) (MissingVacant!1493 (index!8145 (_ BitVec 32))) )
))
(declare-fun lt!135931 () SeekEntryResult!1493)

(assert (=> b!272120 (= res!136113 (or (= lt!135931 (MissingZero!1493 i!1267)) (= lt!135931 (MissingVacant!1493 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13371 (_ BitVec 32)) SeekEntryResult!1493)

(assert (=> b!272120 (= lt!135931 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272121 () Bool)

(declare-fun res!136112 () Bool)

(assert (=> b!272121 (=> (not res!136112) (not e!174748))))

(declare-datatypes ((List!4143 0))(
  ( (Nil!4140) (Cons!4139 (h!4806 (_ BitVec 64)) (t!9225 List!4143)) )
))
(declare-fun arrayNoDuplicates!0 (array!13371 (_ BitVec 32) List!4143) Bool)

(assert (=> b!272121 (= res!136112 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4140))))

(declare-fun b!272122 () Bool)

(declare-fun res!136108 () Bool)

(assert (=> b!272122 (=> (not res!136108) (not e!174747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13371 (_ BitVec 32)) Bool)

(assert (=> b!272122 (= res!136108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!136109 () Bool)

(assert (=> start!26274 (=> (not res!136109) (not e!174748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26274 (= res!136109 (validMask!0 mask!3868))))

(assert (=> start!26274 e!174748))

(declare-fun array_inv!4298 (array!13371) Bool)

(assert (=> start!26274 (array_inv!4298 a!3325)))

(assert (=> start!26274 true))

(declare-fun b!272123 () Bool)

(assert (=> b!272123 (= e!174747 (not true))))

(assert (=> b!272123 (arrayNoDuplicates!0 (array!13372 (store (arr!6335 a!3325) i!1267 k!2581) (size!6687 a!3325)) #b00000000000000000000000000000000 Nil!4140)))

(declare-datatypes ((Unit!8473 0))(
  ( (Unit!8474) )
))
(declare-fun lt!135930 () Unit!8473)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13371 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4143) Unit!8473)

(assert (=> b!272123 (= lt!135930 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4140))))

(declare-fun b!272124 () Bool)

(declare-fun res!136110 () Bool)

(assert (=> b!272124 (=> (not res!136110) (not e!174748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272124 (= res!136110 (validKeyInArray!0 k!2581))))

(declare-fun b!272125 () Bool)

(declare-fun res!136115 () Bool)

(assert (=> b!272125 (=> (not res!136115) (not e!174748))))

(declare-fun arrayContainsKey!0 (array!13371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272125 (= res!136115 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272126 () Bool)

(declare-fun res!136114 () Bool)

(assert (=> b!272126 (=> (not res!136114) (not e!174747))))

(assert (=> b!272126 (= res!136114 (validKeyInArray!0 (select (arr!6335 a!3325) startIndex!26)))))

(assert (= (and start!26274 res!136109) b!272119))

(assert (= (and b!272119 res!136111) b!272124))

(assert (= (and b!272124 res!136110) b!272121))

(assert (= (and b!272121 res!136112) b!272125))

(assert (= (and b!272125 res!136115) b!272120))

(assert (= (and b!272120 res!136113) b!272122))

(assert (= (and b!272122 res!136108) b!272118))

(assert (= (and b!272118 res!136116) b!272126))

(assert (= (and b!272126 res!136114) b!272123))

(declare-fun m!287253 () Bool)

(assert (=> b!272123 m!287253))

(declare-fun m!287255 () Bool)

(assert (=> b!272123 m!287255))

(declare-fun m!287257 () Bool)

(assert (=> b!272123 m!287257))

(declare-fun m!287259 () Bool)

(assert (=> b!272125 m!287259))

(declare-fun m!287261 () Bool)

(assert (=> b!272124 m!287261))

(declare-fun m!287263 () Bool)

(assert (=> start!26274 m!287263))

(declare-fun m!287265 () Bool)

(assert (=> start!26274 m!287265))

(declare-fun m!287267 () Bool)

(assert (=> b!272122 m!287267))

(declare-fun m!287269 () Bool)

(assert (=> b!272126 m!287269))

(assert (=> b!272126 m!287269))

(declare-fun m!287271 () Bool)

(assert (=> b!272126 m!287271))

(declare-fun m!287273 () Bool)

(assert (=> b!272120 m!287273))

(declare-fun m!287275 () Bool)

(assert (=> b!272121 m!287275))

(push 1)

