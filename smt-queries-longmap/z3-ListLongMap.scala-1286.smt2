; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26276 () Bool)

(assert start!26276)

(declare-fun b!272145 () Bool)

(declare-fun res!136135 () Bool)

(declare-fun e!174757 () Bool)

(assert (=> b!272145 (=> (not res!136135) (not e!174757))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272145 (= res!136135 (not (= startIndex!26 i!1267)))))

(declare-fun res!136138 () Bool)

(declare-fun e!174756 () Bool)

(assert (=> start!26276 (=> (not res!136138) (not e!174756))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26276 (= res!136138 (validMask!0 mask!3868))))

(assert (=> start!26276 e!174756))

(declare-datatypes ((array!13373 0))(
  ( (array!13374 (arr!6336 (Array (_ BitVec 32) (_ BitVec 64))) (size!6688 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13373)

(declare-fun array_inv!4299 (array!13373) Bool)

(assert (=> start!26276 (array_inv!4299 a!3325)))

(assert (=> start!26276 true))

(declare-fun b!272146 () Bool)

(declare-fun res!136136 () Bool)

(assert (=> b!272146 (=> (not res!136136) (not e!174757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13373 (_ BitVec 32)) Bool)

(assert (=> b!272146 (= res!136136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272147 () Bool)

(declare-fun res!136137 () Bool)

(assert (=> b!272147 (=> (not res!136137) (not e!174756))))

(declare-datatypes ((List!4144 0))(
  ( (Nil!4141) (Cons!4140 (h!4807 (_ BitVec 64)) (t!9226 List!4144)) )
))
(declare-fun arrayNoDuplicates!0 (array!13373 (_ BitVec 32) List!4144) Bool)

(assert (=> b!272147 (= res!136137 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4141))))

(declare-fun b!272148 () Bool)

(declare-fun res!136143 () Bool)

(assert (=> b!272148 (=> (not res!136143) (not e!174756))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272148 (= res!136143 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272149 () Bool)

(declare-fun res!136142 () Bool)

(assert (=> b!272149 (=> (not res!136142) (not e!174757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272149 (= res!136142 (validKeyInArray!0 (select (arr!6336 a!3325) startIndex!26)))))

(declare-fun b!272150 () Bool)

(declare-fun res!136140 () Bool)

(assert (=> b!272150 (=> (not res!136140) (not e!174756))))

(assert (=> b!272150 (= res!136140 (and (= (size!6688 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6688 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6688 a!3325))))))

(declare-fun b!272151 () Bool)

(assert (=> b!272151 (= e!174757 (not true))))

(assert (=> b!272151 (arrayNoDuplicates!0 (array!13374 (store (arr!6336 a!3325) i!1267 k0!2581) (size!6688 a!3325)) #b00000000000000000000000000000000 Nil!4141)))

(declare-datatypes ((Unit!8475 0))(
  ( (Unit!8476) )
))
(declare-fun lt!135936 () Unit!8475)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13373 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4144) Unit!8475)

(assert (=> b!272151 (= lt!135936 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4141))))

(declare-fun b!272152 () Bool)

(declare-fun res!136141 () Bool)

(assert (=> b!272152 (=> (not res!136141) (not e!174756))))

(assert (=> b!272152 (= res!136141 (validKeyInArray!0 k0!2581))))

(declare-fun b!272153 () Bool)

(assert (=> b!272153 (= e!174756 e!174757)))

(declare-fun res!136139 () Bool)

(assert (=> b!272153 (=> (not res!136139) (not e!174757))))

(declare-datatypes ((SeekEntryResult!1494 0))(
  ( (MissingZero!1494 (index!8146 (_ BitVec 32))) (Found!1494 (index!8147 (_ BitVec 32))) (Intermediate!1494 (undefined!2306 Bool) (index!8148 (_ BitVec 32)) (x!26467 (_ BitVec 32))) (Undefined!1494) (MissingVacant!1494 (index!8149 (_ BitVec 32))) )
))
(declare-fun lt!135937 () SeekEntryResult!1494)

(assert (=> b!272153 (= res!136139 (or (= lt!135937 (MissingZero!1494 i!1267)) (= lt!135937 (MissingVacant!1494 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13373 (_ BitVec 32)) SeekEntryResult!1494)

(assert (=> b!272153 (= lt!135937 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26276 res!136138) b!272150))

(assert (= (and b!272150 res!136140) b!272152))

(assert (= (and b!272152 res!136141) b!272147))

(assert (= (and b!272147 res!136137) b!272148))

(assert (= (and b!272148 res!136143) b!272153))

(assert (= (and b!272153 res!136139) b!272146))

(assert (= (and b!272146 res!136136) b!272145))

(assert (= (and b!272145 res!136135) b!272149))

(assert (= (and b!272149 res!136142) b!272151))

(declare-fun m!287277 () Bool)

(assert (=> b!272148 m!287277))

(declare-fun m!287279 () Bool)

(assert (=> start!26276 m!287279))

(declare-fun m!287281 () Bool)

(assert (=> start!26276 m!287281))

(declare-fun m!287283 () Bool)

(assert (=> b!272146 m!287283))

(declare-fun m!287285 () Bool)

(assert (=> b!272151 m!287285))

(declare-fun m!287287 () Bool)

(assert (=> b!272151 m!287287))

(declare-fun m!287289 () Bool)

(assert (=> b!272151 m!287289))

(declare-fun m!287291 () Bool)

(assert (=> b!272153 m!287291))

(declare-fun m!287293 () Bool)

(assert (=> b!272152 m!287293))

(declare-fun m!287295 () Bool)

(assert (=> b!272149 m!287295))

(assert (=> b!272149 m!287295))

(declare-fun m!287297 () Bool)

(assert (=> b!272149 m!287297))

(declare-fun m!287299 () Bool)

(assert (=> b!272147 m!287299))

(check-sat (not b!272149) (not b!272151) (not b!272153) (not b!272152) (not b!272146) (not start!26276) (not b!272148) (not b!272147))
(check-sat)
