; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26110 () Bool)

(assert start!26110)

(declare-fun res!133608 () Bool)

(declare-fun e!173830 () Bool)

(assert (=> start!26110 (=> (not res!133608) (not e!173830))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26110 (= res!133608 (validMask!0 mask!3868))))

(assert (=> start!26110 e!173830))

(declare-datatypes ((array!13207 0))(
  ( (array!13208 (arr!6253 (Array (_ BitVec 32) (_ BitVec 64))) (size!6605 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13207)

(declare-fun array_inv!4216 (array!13207) Bool)

(assert (=> start!26110 (array_inv!4216 a!3325)))

(assert (=> start!26110 true))

(declare-fun b!269399 () Bool)

(declare-fun res!133612 () Bool)

(declare-fun e!173828 () Bool)

(assert (=> b!269399 (=> (not res!133612) (not e!173828))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269399 (= res!133612 (= startIndex!26 i!1267))))

(declare-fun b!269400 () Bool)

(declare-datatypes ((Unit!8338 0))(
  ( (Unit!8339) )
))
(declare-fun e!173831 () Unit!8338)

(declare-fun lt!135187 () Unit!8338)

(assert (=> b!269400 (= e!173831 lt!135187)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13207 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8338)

(assert (=> b!269400 (= lt!135187 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13207 (_ BitVec 32)) Bool)

(assert (=> b!269400 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13208 (store (arr!6253 a!3325) i!1267 k!2581) (size!6605 a!3325)) mask!3868)))

(declare-fun b!269401 () Bool)

(declare-fun res!133611 () Bool)

(assert (=> b!269401 (=> (not res!133611) (not e!173830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269401 (= res!133611 (validKeyInArray!0 k!2581))))

(declare-fun b!269402 () Bool)

(declare-fun res!133614 () Bool)

(assert (=> b!269402 (=> (not res!133614) (not e!173830))))

(assert (=> b!269402 (= res!133614 (and (= (size!6605 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6605 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6605 a!3325))))))

(declare-fun b!269403 () Bool)

(assert (=> b!269403 (= e!173828 false)))

(declare-fun lt!135186 () Unit!8338)

(assert (=> b!269403 (= lt!135186 e!173831)))

(declare-fun c!45447 () Bool)

(assert (=> b!269403 (= c!45447 (bvslt startIndex!26 (bvsub (size!6605 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269404 () Bool)

(declare-fun res!133610 () Bool)

(assert (=> b!269404 (=> (not res!133610) (not e!173830))))

(declare-datatypes ((List!4061 0))(
  ( (Nil!4058) (Cons!4057 (h!4724 (_ BitVec 64)) (t!9143 List!4061)) )
))
(declare-fun arrayNoDuplicates!0 (array!13207 (_ BitVec 32) List!4061) Bool)

(assert (=> b!269404 (= res!133610 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4058))))

(declare-fun b!269405 () Bool)

(assert (=> b!269405 (= e!173830 e!173828)))

(declare-fun res!133613 () Bool)

(assert (=> b!269405 (=> (not res!133613) (not e!173828))))

(declare-datatypes ((SeekEntryResult!1411 0))(
  ( (MissingZero!1411 (index!7814 (_ BitVec 32))) (Found!1411 (index!7815 (_ BitVec 32))) (Intermediate!1411 (undefined!2223 Bool) (index!7816 (_ BitVec 32)) (x!26160 (_ BitVec 32))) (Undefined!1411) (MissingVacant!1411 (index!7817 (_ BitVec 32))) )
))
(declare-fun lt!135185 () SeekEntryResult!1411)

(assert (=> b!269405 (= res!133613 (or (= lt!135185 (MissingZero!1411 i!1267)) (= lt!135185 (MissingVacant!1411 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13207 (_ BitVec 32)) SeekEntryResult!1411)

(assert (=> b!269405 (= lt!135185 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269406 () Bool)

(declare-fun res!133607 () Bool)

(assert (=> b!269406 (=> (not res!133607) (not e!173830))))

(declare-fun arrayContainsKey!0 (array!13207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269406 (= res!133607 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269407 () Bool)

(declare-fun res!133609 () Bool)

(assert (=> b!269407 (=> (not res!133609) (not e!173828))))

(assert (=> b!269407 (= res!133609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269408 () Bool)

(declare-fun Unit!8340 () Unit!8338)

(assert (=> b!269408 (= e!173831 Unit!8340)))

(assert (= (and start!26110 res!133608) b!269402))

(assert (= (and b!269402 res!133614) b!269401))

(assert (= (and b!269401 res!133611) b!269404))

(assert (= (and b!269404 res!133610) b!269406))

(assert (= (and b!269406 res!133607) b!269405))

(assert (= (and b!269405 res!133613) b!269407))

(assert (= (and b!269407 res!133609) b!269399))

(assert (= (and b!269399 res!133612) b!269403))

(assert (= (and b!269403 c!45447) b!269400))

(assert (= (and b!269403 (not c!45447)) b!269408))

(declare-fun m!285271 () Bool)

(assert (=> b!269405 m!285271))

(declare-fun m!285273 () Bool)

(assert (=> b!269406 m!285273))

(declare-fun m!285275 () Bool)

(assert (=> b!269401 m!285275))

(declare-fun m!285277 () Bool)

(assert (=> b!269404 m!285277))

(declare-fun m!285279 () Bool)

(assert (=> b!269400 m!285279))

(declare-fun m!285281 () Bool)

(assert (=> b!269400 m!285281))

(declare-fun m!285283 () Bool)

(assert (=> b!269400 m!285283))

(declare-fun m!285285 () Bool)

(assert (=> b!269407 m!285285))

(declare-fun m!285287 () Bool)

(assert (=> start!26110 m!285287))

(declare-fun m!285289 () Bool)

(assert (=> start!26110 m!285289))

(push 1)

(assert (not b!269400))

(assert (not start!26110))

(assert (not b!269401))

(assert (not b!269407))

(assert (not b!269405))

(assert (not b!269404))

(assert (not b!269406))

