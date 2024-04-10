; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26620 () Bool)

(assert start!26620)

(declare-fun b!276360 () Bool)

(declare-fun res!140354 () Bool)

(declare-fun e!176565 () Bool)

(assert (=> b!276360 (=> (not res!140354) (not e!176565))))

(declare-datatypes ((array!13717 0))(
  ( (array!13718 (arr!6508 (Array (_ BitVec 32) (_ BitVec 64))) (size!6860 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13717)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276360 (= res!140354 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276361 () Bool)

(declare-fun e!176567 () Bool)

(assert (=> b!276361 (= e!176567 false)))

(declare-fun lt!137617 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13717 (_ BitVec 32)) Bool)

(assert (=> b!276361 (= lt!137617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276362 () Bool)

(declare-fun res!140353 () Bool)

(assert (=> b!276362 (=> (not res!140353) (not e!176565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276362 (= res!140353 (validKeyInArray!0 k!2581))))

(declare-fun b!276363 () Bool)

(assert (=> b!276363 (= e!176565 e!176567)))

(declare-fun res!140355 () Bool)

(assert (=> b!276363 (=> (not res!140355) (not e!176567))))

(declare-datatypes ((SeekEntryResult!1666 0))(
  ( (MissingZero!1666 (index!8834 (_ BitVec 32))) (Found!1666 (index!8835 (_ BitVec 32))) (Intermediate!1666 (undefined!2478 Bool) (index!8836 (_ BitVec 32)) (x!27095 (_ BitVec 32))) (Undefined!1666) (MissingVacant!1666 (index!8837 (_ BitVec 32))) )
))
(declare-fun lt!137616 () SeekEntryResult!1666)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276363 (= res!140355 (or (= lt!137616 (MissingZero!1666 i!1267)) (= lt!137616 (MissingVacant!1666 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13717 (_ BitVec 32)) SeekEntryResult!1666)

(assert (=> b!276363 (= lt!137616 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!140352 () Bool)

(assert (=> start!26620 (=> (not res!140352) (not e!176565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26620 (= res!140352 (validMask!0 mask!3868))))

(assert (=> start!26620 e!176565))

(declare-fun array_inv!4471 (array!13717) Bool)

(assert (=> start!26620 (array_inv!4471 a!3325)))

(assert (=> start!26620 true))

(declare-fun b!276364 () Bool)

(declare-fun res!140350 () Bool)

(assert (=> b!276364 (=> (not res!140350) (not e!176565))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276364 (= res!140350 (and (= (size!6860 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6860 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6860 a!3325))))))

(declare-fun b!276365 () Bool)

(declare-fun res!140351 () Bool)

(assert (=> b!276365 (=> (not res!140351) (not e!176565))))

(declare-datatypes ((List!4316 0))(
  ( (Nil!4313) (Cons!4312 (h!4979 (_ BitVec 64)) (t!9398 List!4316)) )
))
(declare-fun arrayNoDuplicates!0 (array!13717 (_ BitVec 32) List!4316) Bool)

(assert (=> b!276365 (= res!140351 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4313))))

(assert (= (and start!26620 res!140352) b!276364))

(assert (= (and b!276364 res!140350) b!276362))

(assert (= (and b!276362 res!140353) b!276365))

(assert (= (and b!276365 res!140351) b!276360))

(assert (= (and b!276360 res!140354) b!276363))

(assert (= (and b!276363 res!140355) b!276361))

(declare-fun m!291715 () Bool)

(assert (=> b!276365 m!291715))

(declare-fun m!291717 () Bool)

(assert (=> b!276362 m!291717))

(declare-fun m!291719 () Bool)

(assert (=> b!276361 m!291719))

(declare-fun m!291721 () Bool)

(assert (=> b!276360 m!291721))

(declare-fun m!291723 () Bool)

(assert (=> start!26620 m!291723))

(declare-fun m!291725 () Bool)

(assert (=> start!26620 m!291725))

(declare-fun m!291727 () Bool)

(assert (=> b!276363 m!291727))

(push 1)

(assert (not b!276362))

(assert (not b!276363))

(assert (not start!26620))

(assert (not b!276361))

(assert (not b!276365))

(assert (not b!276360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

