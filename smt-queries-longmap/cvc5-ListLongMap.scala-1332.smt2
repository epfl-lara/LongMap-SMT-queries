; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26550 () Bool)

(assert start!26550)

(declare-fun b!275558 () Bool)

(declare-fun res!139557 () Bool)

(declare-fun e!176250 () Bool)

(assert (=> b!275558 (=> (not res!139557) (not e!176250))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275558 (= res!139557 (not (= startIndex!26 i!1267)))))

(declare-fun b!275559 () Bool)

(declare-fun res!139551 () Bool)

(assert (=> b!275559 (=> (not res!139551) (not e!176250))))

(declare-datatypes ((array!13647 0))(
  ( (array!13648 (arr!6473 (Array (_ BitVec 32) (_ BitVec 64))) (size!6825 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13647)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275559 (= res!139551 (not (validKeyInArray!0 (select (arr!6473 a!3325) startIndex!26))))))

(declare-fun b!275560 () Bool)

(assert (=> b!275560 (= e!176250 (not true))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13647 (_ BitVec 32)) Bool)

(assert (=> b!275560 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13648 (store (arr!6473 a!3325) i!1267 k!2581) (size!6825 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8677 0))(
  ( (Unit!8678) )
))
(declare-fun lt!137424 () Unit!8677)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13647 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8677)

(assert (=> b!275560 (= lt!137424 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275561 () Bool)

(declare-fun e!176251 () Bool)

(assert (=> b!275561 (= e!176251 e!176250)))

(declare-fun res!139555 () Bool)

(assert (=> b!275561 (=> (not res!139555) (not e!176250))))

(declare-datatypes ((SeekEntryResult!1631 0))(
  ( (MissingZero!1631 (index!8694 (_ BitVec 32))) (Found!1631 (index!8695 (_ BitVec 32))) (Intermediate!1631 (undefined!2443 Bool) (index!8696 (_ BitVec 32)) (x!26972 (_ BitVec 32))) (Undefined!1631) (MissingVacant!1631 (index!8697 (_ BitVec 32))) )
))
(declare-fun lt!137425 () SeekEntryResult!1631)

(assert (=> b!275561 (= res!139555 (or (= lt!137425 (MissingZero!1631 i!1267)) (= lt!137425 (MissingVacant!1631 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13647 (_ BitVec 32)) SeekEntryResult!1631)

(assert (=> b!275561 (= lt!137425 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275562 () Bool)

(declare-fun res!139550 () Bool)

(assert (=> b!275562 (=> (not res!139550) (not e!176250))))

(assert (=> b!275562 (= res!139550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139549 () Bool)

(assert (=> start!26550 (=> (not res!139549) (not e!176251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26550 (= res!139549 (validMask!0 mask!3868))))

(assert (=> start!26550 e!176251))

(declare-fun array_inv!4436 (array!13647) Bool)

(assert (=> start!26550 (array_inv!4436 a!3325)))

(assert (=> start!26550 true))

(declare-fun b!275563 () Bool)

(declare-fun res!139556 () Bool)

(assert (=> b!275563 (=> (not res!139556) (not e!176251))))

(declare-fun arrayContainsKey!0 (array!13647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275563 (= res!139556 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275564 () Bool)

(declare-fun res!139548 () Bool)

(assert (=> b!275564 (=> (not res!139548) (not e!176251))))

(assert (=> b!275564 (= res!139548 (and (= (size!6825 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6825 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6825 a!3325))))))

(declare-fun b!275565 () Bool)

(declare-fun res!139553 () Bool)

(assert (=> b!275565 (=> (not res!139553) (not e!176250))))

(assert (=> b!275565 (= res!139553 (and (bvslt startIndex!26 (bvsub (size!6825 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275566 () Bool)

(declare-fun res!139552 () Bool)

(assert (=> b!275566 (=> (not res!139552) (not e!176251))))

(assert (=> b!275566 (= res!139552 (validKeyInArray!0 k!2581))))

(declare-fun b!275567 () Bool)

(declare-fun res!139554 () Bool)

(assert (=> b!275567 (=> (not res!139554) (not e!176251))))

(declare-datatypes ((List!4281 0))(
  ( (Nil!4278) (Cons!4277 (h!4944 (_ BitVec 64)) (t!9363 List!4281)) )
))
(declare-fun arrayNoDuplicates!0 (array!13647 (_ BitVec 32) List!4281) Bool)

(assert (=> b!275567 (= res!139554 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4278))))

(assert (= (and start!26550 res!139549) b!275564))

(assert (= (and b!275564 res!139548) b!275566))

(assert (= (and b!275566 res!139552) b!275567))

(assert (= (and b!275567 res!139554) b!275563))

(assert (= (and b!275563 res!139556) b!275561))

(assert (= (and b!275561 res!139555) b!275562))

(assert (= (and b!275562 res!139550) b!275558))

(assert (= (and b!275558 res!139557) b!275559))

(assert (= (and b!275559 res!139551) b!275565))

(assert (= (and b!275565 res!139553) b!275560))

(declare-fun m!291093 () Bool)

(assert (=> b!275562 m!291093))

(declare-fun m!291095 () Bool)

(assert (=> b!275567 m!291095))

(declare-fun m!291097 () Bool)

(assert (=> b!275563 m!291097))

(declare-fun m!291099 () Bool)

(assert (=> b!275560 m!291099))

(declare-fun m!291101 () Bool)

(assert (=> b!275560 m!291101))

(declare-fun m!291103 () Bool)

(assert (=> b!275560 m!291103))

(declare-fun m!291105 () Bool)

(assert (=> b!275561 m!291105))

(declare-fun m!291107 () Bool)

(assert (=> start!26550 m!291107))

(declare-fun m!291109 () Bool)

(assert (=> start!26550 m!291109))

(declare-fun m!291111 () Bool)

(assert (=> b!275559 m!291111))

(assert (=> b!275559 m!291111))

(declare-fun m!291113 () Bool)

(assert (=> b!275559 m!291113))

(declare-fun m!291115 () Bool)

(assert (=> b!275566 m!291115))

(push 1)

