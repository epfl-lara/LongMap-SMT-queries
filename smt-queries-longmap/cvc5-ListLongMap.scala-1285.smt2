; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26268 () Bool)

(assert start!26268)

(declare-fun b!272037 () Bool)

(declare-fun res!136028 () Bool)

(declare-fun e!174720 () Bool)

(assert (=> b!272037 (=> (not res!136028) (not e!174720))))

(declare-datatypes ((array!13365 0))(
  ( (array!13366 (arr!6332 (Array (_ BitVec 32) (_ BitVec 64))) (size!6684 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13365)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272037 (= res!136028 (validKeyInArray!0 (select (arr!6332 a!3325) startIndex!26)))))

(declare-fun b!272038 () Bool)

(declare-fun res!136032 () Bool)

(assert (=> b!272038 (=> (not res!136032) (not e!174720))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13365 (_ BitVec 32)) Bool)

(assert (=> b!272038 (= res!136032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272039 () Bool)

(assert (=> b!272039 (= e!174720 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((List!4140 0))(
  ( (Nil!4137) (Cons!4136 (h!4803 (_ BitVec 64)) (t!9222 List!4140)) )
))
(declare-fun arrayNoDuplicates!0 (array!13365 (_ BitVec 32) List!4140) Bool)

(assert (=> b!272039 (arrayNoDuplicates!0 (array!13366 (store (arr!6332 a!3325) i!1267 k!2581) (size!6684 a!3325)) #b00000000000000000000000000000000 Nil!4137)))

(declare-datatypes ((Unit!8467 0))(
  ( (Unit!8468) )
))
(declare-fun lt!135913 () Unit!8467)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4140) Unit!8467)

(assert (=> b!272039 (= lt!135913 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4137))))

(declare-fun b!272040 () Bool)

(declare-fun res!136030 () Bool)

(declare-fun e!174722 () Bool)

(assert (=> b!272040 (=> (not res!136030) (not e!174722))))

(assert (=> b!272040 (= res!136030 (and (= (size!6684 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6684 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6684 a!3325))))))

(declare-fun b!272041 () Bool)

(declare-fun res!136034 () Bool)

(assert (=> b!272041 (=> (not res!136034) (not e!174722))))

(assert (=> b!272041 (= res!136034 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4137))))

(declare-fun b!272042 () Bool)

(assert (=> b!272042 (= e!174722 e!174720)))

(declare-fun res!136027 () Bool)

(assert (=> b!272042 (=> (not res!136027) (not e!174720))))

(declare-datatypes ((SeekEntryResult!1490 0))(
  ( (MissingZero!1490 (index!8130 (_ BitVec 32))) (Found!1490 (index!8131 (_ BitVec 32))) (Intermediate!1490 (undefined!2302 Bool) (index!8132 (_ BitVec 32)) (x!26455 (_ BitVec 32))) (Undefined!1490) (MissingVacant!1490 (index!8133 (_ BitVec 32))) )
))
(declare-fun lt!135912 () SeekEntryResult!1490)

(assert (=> b!272042 (= res!136027 (or (= lt!135912 (MissingZero!1490 i!1267)) (= lt!135912 (MissingVacant!1490 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13365 (_ BitVec 32)) SeekEntryResult!1490)

(assert (=> b!272042 (= lt!135912 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!136035 () Bool)

(assert (=> start!26268 (=> (not res!136035) (not e!174722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26268 (= res!136035 (validMask!0 mask!3868))))

(assert (=> start!26268 e!174722))

(declare-fun array_inv!4295 (array!13365) Bool)

(assert (=> start!26268 (array_inv!4295 a!3325)))

(assert (=> start!26268 true))

(declare-fun b!272043 () Bool)

(declare-fun res!136033 () Bool)

(assert (=> b!272043 (=> (not res!136033) (not e!174722))))

(assert (=> b!272043 (= res!136033 (validKeyInArray!0 k!2581))))

(declare-fun b!272044 () Bool)

(declare-fun res!136029 () Bool)

(assert (=> b!272044 (=> (not res!136029) (not e!174722))))

(declare-fun arrayContainsKey!0 (array!13365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272044 (= res!136029 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272045 () Bool)

(declare-fun res!136031 () Bool)

(assert (=> b!272045 (=> (not res!136031) (not e!174720))))

(assert (=> b!272045 (= res!136031 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26268 res!136035) b!272040))

(assert (= (and b!272040 res!136030) b!272043))

(assert (= (and b!272043 res!136033) b!272041))

(assert (= (and b!272041 res!136034) b!272044))

(assert (= (and b!272044 res!136029) b!272042))

(assert (= (and b!272042 res!136027) b!272038))

(assert (= (and b!272038 res!136032) b!272045))

(assert (= (and b!272045 res!136031) b!272037))

(assert (= (and b!272037 res!136028) b!272039))

(declare-fun m!287181 () Bool)

(assert (=> b!272042 m!287181))

(declare-fun m!287183 () Bool)

(assert (=> b!272041 m!287183))

(declare-fun m!287185 () Bool)

(assert (=> b!272037 m!287185))

(assert (=> b!272037 m!287185))

(declare-fun m!287187 () Bool)

(assert (=> b!272037 m!287187))

(declare-fun m!287189 () Bool)

(assert (=> b!272043 m!287189))

(declare-fun m!287191 () Bool)

(assert (=> b!272039 m!287191))

(declare-fun m!287193 () Bool)

(assert (=> b!272039 m!287193))

(declare-fun m!287195 () Bool)

(assert (=> b!272039 m!287195))

(declare-fun m!287197 () Bool)

(assert (=> b!272038 m!287197))

(declare-fun m!287199 () Bool)

(assert (=> b!272044 m!287199))

(declare-fun m!287201 () Bool)

(assert (=> start!26268 m!287201))

(declare-fun m!287203 () Bool)

(assert (=> start!26268 m!287203))

(push 1)

(assert (not b!272042))

(assert (not b!272044))

(assert (not b!272039))

(assert (not b!272037))

(assert (not start!26268))

(assert (not b!272038))

