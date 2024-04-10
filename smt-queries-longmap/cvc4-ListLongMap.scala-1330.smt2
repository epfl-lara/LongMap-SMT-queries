; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26542 () Bool)

(assert start!26542)

(declare-fun b!275478 () Bool)

(declare-fun e!176215 () Bool)

(declare-fun e!176214 () Bool)

(assert (=> b!275478 (= e!176215 e!176214)))

(declare-fun res!139472 () Bool)

(assert (=> b!275478 (=> (not res!139472) (not e!176214))))

(declare-datatypes ((SeekEntryResult!1627 0))(
  ( (MissingZero!1627 (index!8678 (_ BitVec 32))) (Found!1627 (index!8679 (_ BitVec 32))) (Intermediate!1627 (undefined!2439 Bool) (index!8680 (_ BitVec 32)) (x!26952 (_ BitVec 32))) (Undefined!1627) (MissingVacant!1627 (index!8681 (_ BitVec 32))) )
))
(declare-fun lt!137401 () SeekEntryResult!1627)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275478 (= res!139472 (or (= lt!137401 (MissingZero!1627 i!1267)) (= lt!137401 (MissingVacant!1627 i!1267))))))

(declare-datatypes ((array!13639 0))(
  ( (array!13640 (arr!6469 (Array (_ BitVec 32) (_ BitVec 64))) (size!6821 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13639)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13639 (_ BitVec 32)) SeekEntryResult!1627)

(assert (=> b!275478 (= lt!137401 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275479 () Bool)

(declare-fun res!139471 () Bool)

(assert (=> b!275479 (=> (not res!139471) (not e!176215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275479 (= res!139471 (validKeyInArray!0 k!2581))))

(declare-fun b!275480 () Bool)

(declare-fun res!139470 () Bool)

(assert (=> b!275480 (=> (not res!139470) (not e!176215))))

(declare-fun arrayContainsKey!0 (array!13639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275480 (= res!139470 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275481 () Bool)

(assert (=> b!275481 (= e!176214 false)))

(declare-fun lt!137400 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13639 (_ BitVec 32)) Bool)

(assert (=> b!275481 (= lt!137400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275482 () Bool)

(declare-fun res!139473 () Bool)

(assert (=> b!275482 (=> (not res!139473) (not e!176215))))

(declare-datatypes ((List!4277 0))(
  ( (Nil!4274) (Cons!4273 (h!4940 (_ BitVec 64)) (t!9359 List!4277)) )
))
(declare-fun arrayNoDuplicates!0 (array!13639 (_ BitVec 32) List!4277) Bool)

(assert (=> b!275482 (= res!139473 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4274))))

(declare-fun b!275483 () Bool)

(declare-fun res!139469 () Bool)

(assert (=> b!275483 (=> (not res!139469) (not e!176215))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275483 (= res!139469 (and (= (size!6821 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6821 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6821 a!3325))))))

(declare-fun res!139468 () Bool)

(assert (=> start!26542 (=> (not res!139468) (not e!176215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26542 (= res!139468 (validMask!0 mask!3868))))

(assert (=> start!26542 e!176215))

(declare-fun array_inv!4432 (array!13639) Bool)

(assert (=> start!26542 (array_inv!4432 a!3325)))

(assert (=> start!26542 true))

(assert (= (and start!26542 res!139468) b!275483))

(assert (= (and b!275483 res!139469) b!275479))

(assert (= (and b!275479 res!139471) b!275482))

(assert (= (and b!275482 res!139473) b!275480))

(assert (= (and b!275480 res!139470) b!275478))

(assert (= (and b!275478 res!139472) b!275481))

(declare-fun m!291037 () Bool)

(assert (=> b!275479 m!291037))

(declare-fun m!291039 () Bool)

(assert (=> b!275480 m!291039))

(declare-fun m!291041 () Bool)

(assert (=> b!275478 m!291041))

(declare-fun m!291043 () Bool)

(assert (=> b!275482 m!291043))

(declare-fun m!291045 () Bool)

(assert (=> start!26542 m!291045))

(declare-fun m!291047 () Bool)

(assert (=> start!26542 m!291047))

(declare-fun m!291049 () Bool)

(assert (=> b!275481 m!291049))

(push 1)

(assert (not start!26542))

(assert (not b!275478))

(assert (not b!275481))

(assert (not b!275480))

(assert (not b!275479))

(assert (not b!275482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

