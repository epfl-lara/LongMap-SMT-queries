; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26544 () Bool)

(assert start!26544)

(declare-fun res!139490 () Bool)

(declare-fun e!176225 () Bool)

(assert (=> start!26544 (=> (not res!139490) (not e!176225))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26544 (= res!139490 (validMask!0 mask!3868))))

(assert (=> start!26544 e!176225))

(declare-datatypes ((array!13641 0))(
  ( (array!13642 (arr!6470 (Array (_ BitVec 32) (_ BitVec 64))) (size!6822 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13641)

(declare-fun array_inv!4433 (array!13641) Bool)

(assert (=> start!26544 (array_inv!4433 a!3325)))

(assert (=> start!26544 true))

(declare-fun b!275496 () Bool)

(declare-fun res!139488 () Bool)

(assert (=> b!275496 (=> (not res!139488) (not e!176225))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275496 (= res!139488 (validKeyInArray!0 k!2581))))

(declare-fun b!275497 () Bool)

(declare-fun res!139487 () Bool)

(assert (=> b!275497 (=> (not res!139487) (not e!176225))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275497 (= res!139487 (and (= (size!6822 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6822 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6822 a!3325))))))

(declare-fun b!275498 () Bool)

(declare-fun res!139489 () Bool)

(assert (=> b!275498 (=> (not res!139489) (not e!176225))))

(declare-datatypes ((List!4278 0))(
  ( (Nil!4275) (Cons!4274 (h!4941 (_ BitVec 64)) (t!9360 List!4278)) )
))
(declare-fun arrayNoDuplicates!0 (array!13641 (_ BitVec 32) List!4278) Bool)

(assert (=> b!275498 (= res!139489 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4275))))

(declare-fun b!275499 () Bool)

(declare-fun e!176223 () Bool)

(assert (=> b!275499 (= e!176223 false)))

(declare-fun lt!137406 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13641 (_ BitVec 32)) Bool)

(assert (=> b!275499 (= lt!137406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275500 () Bool)

(assert (=> b!275500 (= e!176225 e!176223)))

(declare-fun res!139486 () Bool)

(assert (=> b!275500 (=> (not res!139486) (not e!176223))))

(declare-datatypes ((SeekEntryResult!1628 0))(
  ( (MissingZero!1628 (index!8682 (_ BitVec 32))) (Found!1628 (index!8683 (_ BitVec 32))) (Intermediate!1628 (undefined!2440 Bool) (index!8684 (_ BitVec 32)) (x!26961 (_ BitVec 32))) (Undefined!1628) (MissingVacant!1628 (index!8685 (_ BitVec 32))) )
))
(declare-fun lt!137407 () SeekEntryResult!1628)

(assert (=> b!275500 (= res!139486 (or (= lt!137407 (MissingZero!1628 i!1267)) (= lt!137407 (MissingVacant!1628 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13641 (_ BitVec 32)) SeekEntryResult!1628)

(assert (=> b!275500 (= lt!137407 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275501 () Bool)

(declare-fun res!139491 () Bool)

(assert (=> b!275501 (=> (not res!139491) (not e!176225))))

(declare-fun arrayContainsKey!0 (array!13641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275501 (= res!139491 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26544 res!139490) b!275497))

(assert (= (and b!275497 res!139487) b!275496))

(assert (= (and b!275496 res!139488) b!275498))

(assert (= (and b!275498 res!139489) b!275501))

(assert (= (and b!275501 res!139491) b!275500))

(assert (= (and b!275500 res!139486) b!275499))

(declare-fun m!291051 () Bool)

(assert (=> b!275496 m!291051))

(declare-fun m!291053 () Bool)

(assert (=> b!275500 m!291053))

(declare-fun m!291055 () Bool)

(assert (=> b!275498 m!291055))

(declare-fun m!291057 () Bool)

(assert (=> b!275499 m!291057))

(declare-fun m!291059 () Bool)

(assert (=> start!26544 m!291059))

(declare-fun m!291061 () Bool)

(assert (=> start!26544 m!291061))

(declare-fun m!291063 () Bool)

(assert (=> b!275501 m!291063))

(push 1)

