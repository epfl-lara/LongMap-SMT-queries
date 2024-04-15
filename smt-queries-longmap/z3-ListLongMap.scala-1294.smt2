; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26324 () Bool)

(assert start!26324)

(declare-fun b!272619 () Bool)

(declare-fun e!174864 () Bool)

(assert (=> b!272619 (= e!174864 (not true))))

(declare-datatypes ((array!13410 0))(
  ( (array!13411 (arr!6354 (Array (_ BitVec 32) (_ BitVec 64))) (size!6707 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13410)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4135 0))(
  ( (Nil!4132) (Cons!4131 (h!4798 (_ BitVec 64)) (t!9208 List!4135)) )
))
(declare-fun arrayNoDuplicates!0 (array!13410 (_ BitVec 32) List!4135) Bool)

(assert (=> b!272619 (arrayNoDuplicates!0 (array!13411 (store (arr!6354 a!3325) i!1267 k0!2581) (size!6707 a!3325)) #b00000000000000000000000000000000 Nil!4132)))

(declare-datatypes ((Unit!8475 0))(
  ( (Unit!8476) )
))
(declare-fun lt!135893 () Unit!8475)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13410 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4135) Unit!8475)

(assert (=> b!272619 (= lt!135893 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4132))))

(declare-fun b!272620 () Bool)

(declare-fun e!174863 () Bool)

(assert (=> b!272620 (= e!174863 e!174864)))

(declare-fun res!136664 () Bool)

(assert (=> b!272620 (=> (not res!136664) (not e!174864))))

(declare-datatypes ((SeekEntryResult!1511 0))(
  ( (MissingZero!1511 (index!8214 (_ BitVec 32))) (Found!1511 (index!8215 (_ BitVec 32))) (Intermediate!1511 (undefined!2323 Bool) (index!8216 (_ BitVec 32)) (x!26547 (_ BitVec 32))) (Undefined!1511) (MissingVacant!1511 (index!8217 (_ BitVec 32))) )
))
(declare-fun lt!135894 () SeekEntryResult!1511)

(assert (=> b!272620 (= res!136664 (or (= lt!135894 (MissingZero!1511 i!1267)) (= lt!135894 (MissingVacant!1511 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13410 (_ BitVec 32)) SeekEntryResult!1511)

(assert (=> b!272620 (= lt!135894 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272621 () Bool)

(declare-fun res!136666 () Bool)

(assert (=> b!272621 (=> (not res!136666) (not e!174864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13410 (_ BitVec 32)) Bool)

(assert (=> b!272621 (= res!136666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272622 () Bool)

(declare-fun res!136662 () Bool)

(assert (=> b!272622 (=> (not res!136662) (not e!174864))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272622 (= res!136662 (not (= startIndex!26 i!1267)))))

(declare-fun b!272623 () Bool)

(declare-fun res!136663 () Bool)

(assert (=> b!272623 (=> (not res!136663) (not e!174863))))

(assert (=> b!272623 (= res!136663 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4132))))

(declare-fun b!272624 () Bool)

(declare-fun res!136665 () Bool)

(assert (=> b!272624 (=> (not res!136665) (not e!174863))))

(assert (=> b!272624 (= res!136665 (and (= (size!6707 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6707 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6707 a!3325))))))

(declare-fun b!272626 () Bool)

(declare-fun res!136667 () Bool)

(assert (=> b!272626 (=> (not res!136667) (not e!174864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272626 (= res!136667 (validKeyInArray!0 (select (arr!6354 a!3325) startIndex!26)))))

(declare-fun b!272627 () Bool)

(declare-fun res!136668 () Bool)

(assert (=> b!272627 (=> (not res!136668) (not e!174863))))

(assert (=> b!272627 (= res!136668 (validKeyInArray!0 k0!2581))))

(declare-fun res!136661 () Bool)

(assert (=> start!26324 (=> (not res!136661) (not e!174863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26324 (= res!136661 (validMask!0 mask!3868))))

(assert (=> start!26324 e!174863))

(declare-fun array_inv!4326 (array!13410) Bool)

(assert (=> start!26324 (array_inv!4326 a!3325)))

(assert (=> start!26324 true))

(declare-fun b!272625 () Bool)

(declare-fun res!136669 () Bool)

(assert (=> b!272625 (=> (not res!136669) (not e!174863))))

(declare-fun arrayContainsKey!0 (array!13410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272625 (= res!136669 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26324 res!136661) b!272624))

(assert (= (and b!272624 res!136665) b!272627))

(assert (= (and b!272627 res!136668) b!272623))

(assert (= (and b!272623 res!136663) b!272625))

(assert (= (and b!272625 res!136669) b!272620))

(assert (= (and b!272620 res!136664) b!272621))

(assert (= (and b!272621 res!136666) b!272622))

(assert (= (and b!272622 res!136662) b!272626))

(assert (= (and b!272626 res!136667) b!272619))

(declare-fun m!287237 () Bool)

(assert (=> b!272620 m!287237))

(declare-fun m!287239 () Bool)

(assert (=> b!272621 m!287239))

(declare-fun m!287241 () Bool)

(assert (=> b!272626 m!287241))

(assert (=> b!272626 m!287241))

(declare-fun m!287243 () Bool)

(assert (=> b!272626 m!287243))

(declare-fun m!287245 () Bool)

(assert (=> start!26324 m!287245))

(declare-fun m!287247 () Bool)

(assert (=> start!26324 m!287247))

(declare-fun m!287249 () Bool)

(assert (=> b!272619 m!287249))

(declare-fun m!287251 () Bool)

(assert (=> b!272619 m!287251))

(declare-fun m!287253 () Bool)

(assert (=> b!272619 m!287253))

(declare-fun m!287255 () Bool)

(assert (=> b!272627 m!287255))

(declare-fun m!287257 () Bool)

(assert (=> b!272623 m!287257))

(declare-fun m!287259 () Bool)

(assert (=> b!272625 m!287259))

(check-sat (not b!272619) (not b!272627) (not b!272620) (not start!26324) (not b!272621) (not b!272623) (not b!272625) (not b!272626))
(check-sat)
