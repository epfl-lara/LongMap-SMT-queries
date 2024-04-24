; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26280 () Bool)

(assert start!26280)

(declare-fun b!272246 () Bool)

(declare-fun res!136215 () Bool)

(declare-fun e!174798 () Bool)

(assert (=> b!272246 (=> (not res!136215) (not e!174798))))

(declare-datatypes ((array!13376 0))(
  ( (array!13377 (arr!6337 (Array (_ BitVec 32) (_ BitVec 64))) (size!6689 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13376)

(declare-datatypes ((List!4058 0))(
  ( (Nil!4055) (Cons!4054 (h!4721 (_ BitVec 64)) (t!9132 List!4058)) )
))
(declare-fun arrayNoDuplicates!0 (array!13376 (_ BitVec 32) List!4058) Bool)

(assert (=> b!272246 (= res!136215 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4055))))

(declare-fun b!272247 () Bool)

(declare-fun res!136213 () Bool)

(assert (=> b!272247 (=> (not res!136213) (not e!174798))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272247 (= res!136213 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272249 () Bool)

(declare-fun e!174800 () Bool)

(assert (=> b!272249 (= e!174800 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272249 (arrayNoDuplicates!0 (array!13377 (store (arr!6337 a!3325) i!1267 k0!2581) (size!6689 a!3325)) #b00000000000000000000000000000000 Nil!4055)))

(declare-datatypes ((Unit!8459 0))(
  ( (Unit!8460) )
))
(declare-fun lt!136007 () Unit!8459)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4058) Unit!8459)

(assert (=> b!272249 (= lt!136007 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4055))))

(declare-fun b!272250 () Bool)

(assert (=> b!272250 (= e!174798 e!174800)))

(declare-fun res!136217 () Bool)

(assert (=> b!272250 (=> (not res!136217) (not e!174800))))

(declare-datatypes ((SeekEntryResult!1460 0))(
  ( (MissingZero!1460 (index!8010 (_ BitVec 32))) (Found!1460 (index!8011 (_ BitVec 32))) (Intermediate!1460 (undefined!2272 Bool) (index!8012 (_ BitVec 32)) (x!26441 (_ BitVec 32))) (Undefined!1460) (MissingVacant!1460 (index!8013 (_ BitVec 32))) )
))
(declare-fun lt!136008 () SeekEntryResult!1460)

(assert (=> b!272250 (= res!136217 (or (= lt!136008 (MissingZero!1460 i!1267)) (= lt!136008 (MissingVacant!1460 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13376 (_ BitVec 32)) SeekEntryResult!1460)

(assert (=> b!272250 (= lt!136008 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272251 () Bool)

(declare-fun res!136211 () Bool)

(assert (=> b!272251 (=> (not res!136211) (not e!174798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272251 (= res!136211 (validKeyInArray!0 k0!2581))))

(declare-fun b!272252 () Bool)

(declare-fun res!136212 () Bool)

(assert (=> b!272252 (=> (not res!136212) (not e!174800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13376 (_ BitVec 32)) Bool)

(assert (=> b!272252 (= res!136212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272248 () Bool)

(declare-fun res!136210 () Bool)

(assert (=> b!272248 (=> (not res!136210) (not e!174800))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272248 (= res!136210 (validKeyInArray!0 (select (arr!6337 a!3325) startIndex!26)))))

(declare-fun res!136218 () Bool)

(assert (=> start!26280 (=> (not res!136218) (not e!174798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26280 (= res!136218 (validMask!0 mask!3868))))

(assert (=> start!26280 e!174798))

(declare-fun array_inv!4287 (array!13376) Bool)

(assert (=> start!26280 (array_inv!4287 a!3325)))

(assert (=> start!26280 true))

(declare-fun b!272253 () Bool)

(declare-fun res!136214 () Bool)

(assert (=> b!272253 (=> (not res!136214) (not e!174798))))

(assert (=> b!272253 (= res!136214 (and (= (size!6689 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6689 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6689 a!3325))))))

(declare-fun b!272254 () Bool)

(declare-fun res!136216 () Bool)

(assert (=> b!272254 (=> (not res!136216) (not e!174800))))

(assert (=> b!272254 (= res!136216 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26280 res!136218) b!272253))

(assert (= (and b!272253 res!136214) b!272251))

(assert (= (and b!272251 res!136211) b!272246))

(assert (= (and b!272246 res!136215) b!272247))

(assert (= (and b!272247 res!136213) b!272250))

(assert (= (and b!272250 res!136217) b!272252))

(assert (= (and b!272252 res!136212) b!272254))

(assert (= (and b!272254 res!136216) b!272248))

(assert (= (and b!272248 res!136210) b!272249))

(declare-fun m!287531 () Bool)

(assert (=> b!272252 m!287531))

(declare-fun m!287533 () Bool)

(assert (=> start!26280 m!287533))

(declare-fun m!287535 () Bool)

(assert (=> start!26280 m!287535))

(declare-fun m!287537 () Bool)

(assert (=> b!272250 m!287537))

(declare-fun m!287539 () Bool)

(assert (=> b!272249 m!287539))

(declare-fun m!287541 () Bool)

(assert (=> b!272249 m!287541))

(declare-fun m!287543 () Bool)

(assert (=> b!272249 m!287543))

(declare-fun m!287545 () Bool)

(assert (=> b!272246 m!287545))

(declare-fun m!287547 () Bool)

(assert (=> b!272247 m!287547))

(declare-fun m!287549 () Bool)

(assert (=> b!272248 m!287549))

(assert (=> b!272248 m!287549))

(declare-fun m!287551 () Bool)

(assert (=> b!272248 m!287551))

(declare-fun m!287553 () Bool)

(assert (=> b!272251 m!287553))

(check-sat (not b!272246) (not b!272252) (not b!272251) (not start!26280) (not b!272250) (not b!272248) (not b!272249) (not b!272247))
(check-sat)
