; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27180 () Bool)

(assert start!27180)

(declare-fun b!281256 () Bool)

(declare-fun e!178813 () Bool)

(declare-fun e!178812 () Bool)

(assert (=> b!281256 (= e!178813 e!178812)))

(declare-fun res!144333 () Bool)

(assert (=> b!281256 (=> (not res!144333) (not e!178812))))

(declare-datatypes ((SeekEntryResult!1799 0))(
  ( (MissingZero!1799 (index!9366 (_ BitVec 32))) (Found!1799 (index!9367 (_ BitVec 32))) (Intermediate!1799 (undefined!2611 Bool) (index!9368 (_ BitVec 32)) (x!27597 (_ BitVec 32))) (Undefined!1799) (MissingVacant!1799 (index!9369 (_ BitVec 32))) )
))
(declare-fun lt!139008 () SeekEntryResult!1799)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281256 (= res!144333 (or (= lt!139008 (MissingZero!1799 i!1267)) (= lt!139008 (MissingVacant!1799 i!1267))))))

(declare-datatypes ((array!13998 0))(
  ( (array!13999 (arr!6641 (Array (_ BitVec 32) (_ BitVec 64))) (size!6993 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13998)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13998 (_ BitVec 32)) SeekEntryResult!1799)

(assert (=> b!281256 (= lt!139008 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281257 () Bool)

(declare-fun res!144329 () Bool)

(assert (=> b!281257 (=> (not res!144329) (not e!178813))))

(declare-fun arrayContainsKey!0 (array!13998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281257 (= res!144329 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281258 () Bool)

(declare-fun res!144326 () Bool)

(assert (=> b!281258 (=> (not res!144326) (not e!178812))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281258 (= res!144326 (validKeyInArray!0 (select (arr!6641 a!3325) startIndex!26)))))

(declare-fun b!281260 () Bool)

(declare-fun res!144332 () Bool)

(assert (=> b!281260 (=> (not res!144332) (not e!178813))))

(declare-datatypes ((List!4449 0))(
  ( (Nil!4446) (Cons!4445 (h!5115 (_ BitVec 64)) (t!9531 List!4449)) )
))
(declare-fun arrayNoDuplicates!0 (array!13998 (_ BitVec 32) List!4449) Bool)

(assert (=> b!281260 (= res!144332 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4446))))

(declare-fun res!144325 () Bool)

(assert (=> start!27180 (=> (not res!144325) (not e!178813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27180 (= res!144325 (validMask!0 mask!3868))))

(assert (=> start!27180 e!178813))

(declare-fun array_inv!4604 (array!13998) Bool)

(assert (=> start!27180 (array_inv!4604 a!3325)))

(assert (=> start!27180 true))

(declare-fun b!281259 () Bool)

(declare-fun res!144328 () Bool)

(assert (=> b!281259 (=> (not res!144328) (not e!178812))))

(assert (=> b!281259 (= res!144328 (not (= startIndex!26 i!1267)))))

(declare-fun b!281261 () Bool)

(declare-fun res!144331 () Bool)

(assert (=> b!281261 (=> (not res!144331) (not e!178812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13998 (_ BitVec 32)) Bool)

(assert (=> b!281261 (= res!144331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281262 () Bool)

(declare-fun res!144330 () Bool)

(assert (=> b!281262 (=> (not res!144330) (not e!178813))))

(assert (=> b!281262 (= res!144330 (validKeyInArray!0 k!2581))))

(declare-fun b!281263 () Bool)

(assert (=> b!281263 (= e!178812 (not true))))

(assert (=> b!281263 (arrayNoDuplicates!0 (array!13999 (store (arr!6641 a!3325) i!1267 k!2581) (size!6993 a!3325)) #b00000000000000000000000000000000 Nil!4446)))

(declare-datatypes ((Unit!8882 0))(
  ( (Unit!8883) )
))
(declare-fun lt!139009 () Unit!8882)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13998 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4449) Unit!8882)

(assert (=> b!281263 (= lt!139009 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4446))))

(declare-fun b!281264 () Bool)

(declare-fun res!144327 () Bool)

(assert (=> b!281264 (=> (not res!144327) (not e!178813))))

(assert (=> b!281264 (= res!144327 (and (= (size!6993 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6993 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6993 a!3325))))))

(assert (= (and start!27180 res!144325) b!281264))

(assert (= (and b!281264 res!144327) b!281262))

(assert (= (and b!281262 res!144330) b!281260))

(assert (= (and b!281260 res!144332) b!281257))

(assert (= (and b!281257 res!144329) b!281256))

(assert (= (and b!281256 res!144333) b!281261))

(assert (= (and b!281261 res!144331) b!281259))

(assert (= (and b!281259 res!144328) b!281258))

(assert (= (and b!281258 res!144326) b!281263))

(declare-fun m!295599 () Bool)

(assert (=> b!281262 m!295599))

(declare-fun m!295601 () Bool)

(assert (=> b!281258 m!295601))

(assert (=> b!281258 m!295601))

(declare-fun m!295603 () Bool)

(assert (=> b!281258 m!295603))

(declare-fun m!295605 () Bool)

(assert (=> b!281256 m!295605))

(declare-fun m!295607 () Bool)

(assert (=> b!281257 m!295607))

(declare-fun m!295609 () Bool)

(assert (=> b!281263 m!295609))

(declare-fun m!295611 () Bool)

(assert (=> b!281263 m!295611))

(declare-fun m!295613 () Bool)

(assert (=> b!281263 m!295613))

(declare-fun m!295615 () Bool)

(assert (=> start!27180 m!295615))

(declare-fun m!295617 () Bool)

(assert (=> start!27180 m!295617))

(declare-fun m!295619 () Bool)

(assert (=> b!281260 m!295619))

(declare-fun m!295621 () Bool)

(assert (=> b!281261 m!295621))

(push 1)

(assert (not b!281262))

(assert (not b!281256))

(assert (not b!281261))

(assert (not b!281260))

(assert (not b!281257))

(assert (not start!27180))

(assert (not b!281258))

(assert (not b!281263))

(check-sat)

