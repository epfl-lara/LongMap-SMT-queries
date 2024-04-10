; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27182 () Bool)

(assert start!27182)

(declare-fun b!281283 () Bool)

(declare-fun e!178822 () Bool)

(declare-fun e!178821 () Bool)

(assert (=> b!281283 (= e!178822 e!178821)))

(declare-fun res!144355 () Bool)

(assert (=> b!281283 (=> (not res!144355) (not e!178821))))

(declare-datatypes ((SeekEntryResult!1800 0))(
  ( (MissingZero!1800 (index!9370 (_ BitVec 32))) (Found!1800 (index!9371 (_ BitVec 32))) (Intermediate!1800 (undefined!2612 Bool) (index!9372 (_ BitVec 32)) (x!27598 (_ BitVec 32))) (Undefined!1800) (MissingVacant!1800 (index!9373 (_ BitVec 32))) )
))
(declare-fun lt!139015 () SeekEntryResult!1800)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281283 (= res!144355 (or (= lt!139015 (MissingZero!1800 i!1267)) (= lt!139015 (MissingVacant!1800 i!1267))))))

(declare-datatypes ((array!14000 0))(
  ( (array!14001 (arr!6642 (Array (_ BitVec 32) (_ BitVec 64))) (size!6994 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14000)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14000 (_ BitVec 32)) SeekEntryResult!1800)

(assert (=> b!281283 (= lt!139015 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281284 () Bool)

(declare-fun res!144360 () Bool)

(assert (=> b!281284 (=> (not res!144360) (not e!178821))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281284 (= res!144360 (validKeyInArray!0 (select (arr!6642 a!3325) startIndex!26)))))

(declare-fun res!144354 () Bool)

(assert (=> start!27182 (=> (not res!144354) (not e!178822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27182 (= res!144354 (validMask!0 mask!3868))))

(assert (=> start!27182 e!178822))

(declare-fun array_inv!4605 (array!14000) Bool)

(assert (=> start!27182 (array_inv!4605 a!3325)))

(assert (=> start!27182 true))

(declare-fun b!281285 () Bool)

(assert (=> b!281285 (= e!178821 (not true))))

(declare-datatypes ((List!4450 0))(
  ( (Nil!4447) (Cons!4446 (h!5116 (_ BitVec 64)) (t!9532 List!4450)) )
))
(declare-fun arrayNoDuplicates!0 (array!14000 (_ BitVec 32) List!4450) Bool)

(assert (=> b!281285 (arrayNoDuplicates!0 (array!14001 (store (arr!6642 a!3325) i!1267 k0!2581) (size!6994 a!3325)) #b00000000000000000000000000000000 Nil!4447)))

(declare-datatypes ((Unit!8884 0))(
  ( (Unit!8885) )
))
(declare-fun lt!139014 () Unit!8884)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14000 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4450) Unit!8884)

(assert (=> b!281285 (= lt!139014 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4447))))

(declare-fun b!281286 () Bool)

(declare-fun res!144353 () Bool)

(assert (=> b!281286 (=> (not res!144353) (not e!178822))))

(assert (=> b!281286 (= res!144353 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4447))))

(declare-fun b!281287 () Bool)

(declare-fun res!144352 () Bool)

(assert (=> b!281287 (=> (not res!144352) (not e!178822))))

(assert (=> b!281287 (= res!144352 (and (= (size!6994 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6994 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6994 a!3325))))))

(declare-fun b!281288 () Bool)

(declare-fun res!144357 () Bool)

(assert (=> b!281288 (=> (not res!144357) (not e!178822))))

(assert (=> b!281288 (= res!144357 (validKeyInArray!0 k0!2581))))

(declare-fun b!281289 () Bool)

(declare-fun res!144358 () Bool)

(assert (=> b!281289 (=> (not res!144358) (not e!178821))))

(assert (=> b!281289 (= res!144358 (not (= startIndex!26 i!1267)))))

(declare-fun b!281290 () Bool)

(declare-fun res!144359 () Bool)

(assert (=> b!281290 (=> (not res!144359) (not e!178821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14000 (_ BitVec 32)) Bool)

(assert (=> b!281290 (= res!144359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281291 () Bool)

(declare-fun res!144356 () Bool)

(assert (=> b!281291 (=> (not res!144356) (not e!178822))))

(declare-fun arrayContainsKey!0 (array!14000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281291 (= res!144356 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27182 res!144354) b!281287))

(assert (= (and b!281287 res!144352) b!281288))

(assert (= (and b!281288 res!144357) b!281286))

(assert (= (and b!281286 res!144353) b!281291))

(assert (= (and b!281291 res!144356) b!281283))

(assert (= (and b!281283 res!144355) b!281290))

(assert (= (and b!281290 res!144359) b!281289))

(assert (= (and b!281289 res!144358) b!281284))

(assert (= (and b!281284 res!144360) b!281285))

(declare-fun m!295623 () Bool)

(assert (=> b!281286 m!295623))

(declare-fun m!295625 () Bool)

(assert (=> b!281291 m!295625))

(declare-fun m!295627 () Bool)

(assert (=> b!281290 m!295627))

(declare-fun m!295629 () Bool)

(assert (=> start!27182 m!295629))

(declare-fun m!295631 () Bool)

(assert (=> start!27182 m!295631))

(declare-fun m!295633 () Bool)

(assert (=> b!281288 m!295633))

(declare-fun m!295635 () Bool)

(assert (=> b!281284 m!295635))

(assert (=> b!281284 m!295635))

(declare-fun m!295637 () Bool)

(assert (=> b!281284 m!295637))

(declare-fun m!295639 () Bool)

(assert (=> b!281285 m!295639))

(declare-fun m!295641 () Bool)

(assert (=> b!281285 m!295641))

(declare-fun m!295643 () Bool)

(assert (=> b!281285 m!295643))

(declare-fun m!295645 () Bool)

(assert (=> b!281283 m!295645))

(check-sat (not b!281290) (not b!281283) (not b!281284) (not b!281291) (not b!281285) (not b!281288) (not b!281286) (not start!27182))
(check-sat)
