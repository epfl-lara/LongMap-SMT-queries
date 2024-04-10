; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26584 () Bool)

(assert start!26584)

(declare-fun res!139994 () Bool)

(declare-fun e!176405 () Bool)

(assert (=> start!26584 (=> (not res!139994) (not e!176405))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26584 (= res!139994 (validMask!0 mask!3868))))

(assert (=> start!26584 e!176405))

(declare-datatypes ((array!13681 0))(
  ( (array!13682 (arr!6490 (Array (_ BitVec 32) (_ BitVec 64))) (size!6842 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13681)

(declare-fun array_inv!4453 (array!13681) Bool)

(assert (=> start!26584 (array_inv!4453 a!3325)))

(assert (=> start!26584 true))

(declare-fun b!276000 () Bool)

(declare-fun e!176403 () Bool)

(assert (=> b!276000 (= e!176405 e!176403)))

(declare-fun res!139990 () Bool)

(assert (=> b!276000 (=> (not res!139990) (not e!176403))))

(declare-datatypes ((SeekEntryResult!1648 0))(
  ( (MissingZero!1648 (index!8762 (_ BitVec 32))) (Found!1648 (index!8763 (_ BitVec 32))) (Intermediate!1648 (undefined!2460 Bool) (index!8764 (_ BitVec 32)) (x!27029 (_ BitVec 32))) (Undefined!1648) (MissingVacant!1648 (index!8765 (_ BitVec 32))) )
))
(declare-fun lt!137526 () SeekEntryResult!1648)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276000 (= res!139990 (or (= lt!137526 (MissingZero!1648 i!1267)) (= lt!137526 (MissingVacant!1648 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13681 (_ BitVec 32)) SeekEntryResult!1648)

(assert (=> b!276000 (= lt!137526 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276001 () Bool)

(declare-fun res!139995 () Bool)

(assert (=> b!276001 (=> (not res!139995) (not e!176405))))

(declare-datatypes ((List!4298 0))(
  ( (Nil!4295) (Cons!4294 (h!4961 (_ BitVec 64)) (t!9380 List!4298)) )
))
(declare-fun arrayNoDuplicates!0 (array!13681 (_ BitVec 32) List!4298) Bool)

(assert (=> b!276001 (= res!139995 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4295))))

(declare-fun b!276002 () Bool)

(assert (=> b!276002 (= e!176403 false)))

(declare-fun lt!137527 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13681 (_ BitVec 32)) Bool)

(assert (=> b!276002 (= lt!137527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276003 () Bool)

(declare-fun res!139992 () Bool)

(assert (=> b!276003 (=> (not res!139992) (not e!176405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276003 (= res!139992 (validKeyInArray!0 k!2581))))

(declare-fun b!276004 () Bool)

(declare-fun res!139991 () Bool)

(assert (=> b!276004 (=> (not res!139991) (not e!176405))))

(declare-fun arrayContainsKey!0 (array!13681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276004 (= res!139991 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276005 () Bool)

(declare-fun res!139993 () Bool)

(assert (=> b!276005 (=> (not res!139993) (not e!176405))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276005 (= res!139993 (and (= (size!6842 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6842 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6842 a!3325))))))

(assert (= (and start!26584 res!139994) b!276005))

(assert (= (and b!276005 res!139993) b!276003))

(assert (= (and b!276003 res!139992) b!276001))

(assert (= (and b!276001 res!139995) b!276004))

(assert (= (and b!276004 res!139991) b!276000))

(assert (= (and b!276000 res!139990) b!276002))

(declare-fun m!291451 () Bool)

(assert (=> b!276003 m!291451))

(declare-fun m!291453 () Bool)

(assert (=> start!26584 m!291453))

(declare-fun m!291455 () Bool)

(assert (=> start!26584 m!291455))

(declare-fun m!291457 () Bool)

(assert (=> b!276001 m!291457))

(declare-fun m!291459 () Bool)

(assert (=> b!276002 m!291459))

(declare-fun m!291461 () Bool)

(assert (=> b!276004 m!291461))

(declare-fun m!291463 () Bool)

(assert (=> b!276000 m!291463))

(push 1)

(assert (not b!276000))

(assert (not b!276003))

(assert (not b!276001))

(assert (not b!276004))

(assert (not b!276002))

(assert (not start!26584))

(check-sat)

