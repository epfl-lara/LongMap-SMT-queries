; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26554 () Bool)

(assert start!26554)

(declare-fun b!275618 () Bool)

(declare-fun res!139613 () Bool)

(declare-fun e!176270 () Bool)

(assert (=> b!275618 (=> (not res!139613) (not e!176270))))

(declare-datatypes ((array!13651 0))(
  ( (array!13652 (arr!6475 (Array (_ BitVec 32) (_ BitVec 64))) (size!6827 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13651)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275618 (= res!139613 (not (validKeyInArray!0 (select (arr!6475 a!3325) startIndex!26))))))

(declare-fun b!275619 () Bool)

(declare-fun res!139617 () Bool)

(declare-fun e!176269 () Bool)

(assert (=> b!275619 (=> (not res!139617) (not e!176269))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275619 (= res!139617 (and (= (size!6827 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6827 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6827 a!3325))))))

(declare-fun b!275620 () Bool)

(declare-fun res!139611 () Bool)

(assert (=> b!275620 (=> (not res!139611) (not e!176270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13651 (_ BitVec 32)) Bool)

(assert (=> b!275620 (= res!139611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275621 () Bool)

(assert (=> b!275621 (= e!176269 e!176270)))

(declare-fun res!139616 () Bool)

(assert (=> b!275621 (=> (not res!139616) (not e!176270))))

(declare-datatypes ((SeekEntryResult!1633 0))(
  ( (MissingZero!1633 (index!8702 (_ BitVec 32))) (Found!1633 (index!8703 (_ BitVec 32))) (Intermediate!1633 (undefined!2445 Bool) (index!8704 (_ BitVec 32)) (x!26974 (_ BitVec 32))) (Undefined!1633) (MissingVacant!1633 (index!8705 (_ BitVec 32))) )
))
(declare-fun lt!137437 () SeekEntryResult!1633)

(assert (=> b!275621 (= res!139616 (or (= lt!137437 (MissingZero!1633 i!1267)) (= lt!137437 (MissingVacant!1633 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13651 (_ BitVec 32)) SeekEntryResult!1633)

(assert (=> b!275621 (= lt!137437 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!139614 () Bool)

(assert (=> start!26554 (=> (not res!139614) (not e!176269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26554 (= res!139614 (validMask!0 mask!3868))))

(assert (=> start!26554 e!176269))

(declare-fun array_inv!4438 (array!13651) Bool)

(assert (=> start!26554 (array_inv!4438 a!3325)))

(assert (=> start!26554 true))

(declare-fun b!275622 () Bool)

(declare-fun res!139615 () Bool)

(assert (=> b!275622 (=> (not res!139615) (not e!176269))))

(declare-datatypes ((List!4283 0))(
  ( (Nil!4280) (Cons!4279 (h!4946 (_ BitVec 64)) (t!9365 List!4283)) )
))
(declare-fun arrayNoDuplicates!0 (array!13651 (_ BitVec 32) List!4283) Bool)

(assert (=> b!275622 (= res!139615 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4280))))

(declare-fun b!275623 () Bool)

(declare-fun res!139610 () Bool)

(assert (=> b!275623 (=> (not res!139610) (not e!176270))))

(assert (=> b!275623 (= res!139610 (not (= startIndex!26 i!1267)))))

(declare-fun b!275624 () Bool)

(declare-fun res!139612 () Bool)

(assert (=> b!275624 (=> (not res!139612) (not e!176269))))

(declare-fun arrayContainsKey!0 (array!13651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275624 (= res!139612 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275625 () Bool)

(assert (=> b!275625 (= e!176270 (not true))))

(assert (=> b!275625 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13652 (store (arr!6475 a!3325) i!1267 k!2581) (size!6827 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8681 0))(
  ( (Unit!8682) )
))
(declare-fun lt!137436 () Unit!8681)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13651 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8681)

(assert (=> b!275625 (= lt!137436 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275626 () Bool)

(declare-fun res!139609 () Bool)

(assert (=> b!275626 (=> (not res!139609) (not e!176270))))

(assert (=> b!275626 (= res!139609 (and (bvslt startIndex!26 (bvsub (size!6827 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275627 () Bool)

(declare-fun res!139608 () Bool)

(assert (=> b!275627 (=> (not res!139608) (not e!176269))))

(assert (=> b!275627 (= res!139608 (validKeyInArray!0 k!2581))))

(assert (= (and start!26554 res!139614) b!275619))

(assert (= (and b!275619 res!139617) b!275627))

(assert (= (and b!275627 res!139608) b!275622))

(assert (= (and b!275622 res!139615) b!275624))

(assert (= (and b!275624 res!139612) b!275621))

(assert (= (and b!275621 res!139616) b!275620))

(assert (= (and b!275620 res!139611) b!275623))

(assert (= (and b!275623 res!139610) b!275618))

(assert (= (and b!275618 res!139613) b!275626))

(assert (= (and b!275626 res!139609) b!275625))

(declare-fun m!291141 () Bool)

(assert (=> b!275624 m!291141))

(declare-fun m!291143 () Bool)

(assert (=> start!26554 m!291143))

(declare-fun m!291145 () Bool)

(assert (=> start!26554 m!291145))

(declare-fun m!291147 () Bool)

(assert (=> b!275620 m!291147))

(declare-fun m!291149 () Bool)

(assert (=> b!275622 m!291149))

(declare-fun m!291151 () Bool)

(assert (=> b!275618 m!291151))

(assert (=> b!275618 m!291151))

(declare-fun m!291153 () Bool)

(assert (=> b!275618 m!291153))

(declare-fun m!291155 () Bool)

(assert (=> b!275621 m!291155))

(declare-fun m!291157 () Bool)

(assert (=> b!275625 m!291157))

(declare-fun m!291159 () Bool)

(assert (=> b!275625 m!291159))

(declare-fun m!291161 () Bool)

(assert (=> b!275625 m!291161))

(declare-fun m!291163 () Bool)

(assert (=> b!275627 m!291163))

(push 1)

(assert (not start!26554))

(assert (not b!275622))

(assert (not b!275618))

(assert (not b!275624))

(assert (not b!275621))

(assert (not b!275625))

