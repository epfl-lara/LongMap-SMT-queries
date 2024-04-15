; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26852 () Bool)

(assert start!26852)

(declare-fun b!278403 () Bool)

(declare-fun res!141886 () Bool)

(declare-fun e!177570 () Bool)

(assert (=> b!278403 (=> (not res!141886) (not e!177570))))

(declare-datatypes ((array!13845 0))(
  ( (array!13846 (arr!6570 (Array (_ BitVec 32) (_ BitVec 64))) (size!6923 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13845)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278403 (= res!141886 (and (= (size!6923 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6923 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6923 a!3325))))))

(declare-fun b!278404 () Bool)

(declare-fun e!177569 () Bool)

(assert (=> b!278404 (= e!177570 e!177569)))

(declare-fun res!141885 () Bool)

(assert (=> b!278404 (=> (not res!141885) (not e!177569))))

(declare-datatypes ((SeekEntryResult!1727 0))(
  ( (MissingZero!1727 (index!9078 (_ BitVec 32))) (Found!1727 (index!9079 (_ BitVec 32))) (Intermediate!1727 (undefined!2539 Bool) (index!9080 (_ BitVec 32)) (x!27348 (_ BitVec 32))) (Undefined!1727) (MissingVacant!1727 (index!9081 (_ BitVec 32))) )
))
(declare-fun lt!138233 () SeekEntryResult!1727)

(assert (=> b!278404 (= res!141885 (or (= lt!138233 (MissingZero!1727 i!1267)) (= lt!138233 (MissingVacant!1727 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13845 (_ BitVec 32)) SeekEntryResult!1727)

(assert (=> b!278404 (= lt!138233 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!278405 () Bool)

(assert (=> b!278405 (= e!177569 false)))

(declare-fun lt!138234 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13845 (_ BitVec 32)) Bool)

(assert (=> b!278405 (= lt!138234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!141889 () Bool)

(assert (=> start!26852 (=> (not res!141889) (not e!177570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26852 (= res!141889 (validMask!0 mask!3868))))

(assert (=> start!26852 e!177570))

(declare-fun array_inv!4542 (array!13845) Bool)

(assert (=> start!26852 (array_inv!4542 a!3325)))

(assert (=> start!26852 true))

(declare-fun b!278406 () Bool)

(declare-fun res!141888 () Bool)

(assert (=> b!278406 (=> (not res!141888) (not e!177570))))

(declare-fun arrayContainsKey!0 (array!13845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278406 (= res!141888 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278407 () Bool)

(declare-fun res!141887 () Bool)

(assert (=> b!278407 (=> (not res!141887) (not e!177570))))

(declare-datatypes ((List!4351 0))(
  ( (Nil!4348) (Cons!4347 (h!5017 (_ BitVec 64)) (t!9424 List!4351)) )
))
(declare-fun arrayNoDuplicates!0 (array!13845 (_ BitVec 32) List!4351) Bool)

(assert (=> b!278407 (= res!141887 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4348))))

(declare-fun b!278408 () Bool)

(declare-fun res!141884 () Bool)

(assert (=> b!278408 (=> (not res!141884) (not e!177570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278408 (= res!141884 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26852 res!141889) b!278403))

(assert (= (and b!278403 res!141886) b!278408))

(assert (= (and b!278408 res!141884) b!278407))

(assert (= (and b!278407 res!141887) b!278406))

(assert (= (and b!278406 res!141888) b!278404))

(assert (= (and b!278404 res!141885) b!278405))

(declare-fun m!293003 () Bool)

(assert (=> start!26852 m!293003))

(declare-fun m!293005 () Bool)

(assert (=> start!26852 m!293005))

(declare-fun m!293007 () Bool)

(assert (=> b!278408 m!293007))

(declare-fun m!293009 () Bool)

(assert (=> b!278407 m!293009))

(declare-fun m!293011 () Bool)

(assert (=> b!278404 m!293011))

(declare-fun m!293013 () Bool)

(assert (=> b!278405 m!293013))

(declare-fun m!293015 () Bool)

(assert (=> b!278406 m!293015))

(check-sat (not b!278405) (not b!278407) (not b!278408) (not b!278404) (not b!278406) (not start!26852))
(check-sat)
