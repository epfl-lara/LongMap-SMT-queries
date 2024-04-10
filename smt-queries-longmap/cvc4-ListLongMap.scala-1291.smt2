; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26308 () Bool)

(assert start!26308)

(declare-fun res!136569 () Bool)

(declare-fun e!174902 () Bool)

(assert (=> start!26308 (=> (not res!136569) (not e!174902))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26308 (= res!136569 (validMask!0 mask!3868))))

(assert (=> start!26308 e!174902))

(declare-datatypes ((array!13405 0))(
  ( (array!13406 (arr!6352 (Array (_ BitVec 32) (_ BitVec 64))) (size!6704 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13405)

(declare-fun array_inv!4315 (array!13405) Bool)

(assert (=> start!26308 (array_inv!4315 a!3325)))

(assert (=> start!26308 true))

(declare-fun b!272577 () Bool)

(declare-fun res!136572 () Bool)

(assert (=> b!272577 (=> (not res!136572) (not e!174902))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272577 (= res!136572 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272578 () Bool)

(declare-fun res!136571 () Bool)

(assert (=> b!272578 (=> (not res!136571) (not e!174902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272578 (= res!136571 (validKeyInArray!0 k!2581))))

(declare-fun b!272579 () Bool)

(declare-fun e!174900 () Bool)

(assert (=> b!272579 (= e!174902 e!174900)))

(declare-fun res!136567 () Bool)

(assert (=> b!272579 (=> (not res!136567) (not e!174900))))

(declare-datatypes ((SeekEntryResult!1510 0))(
  ( (MissingZero!1510 (index!8210 (_ BitVec 32))) (Found!1510 (index!8211 (_ BitVec 32))) (Intermediate!1510 (undefined!2322 Bool) (index!8212 (_ BitVec 32)) (x!26523 (_ BitVec 32))) (Undefined!1510) (MissingVacant!1510 (index!8213 (_ BitVec 32))) )
))
(declare-fun lt!136033 () SeekEntryResult!1510)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272579 (= res!136567 (or (= lt!136033 (MissingZero!1510 i!1267)) (= lt!136033 (MissingVacant!1510 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13405 (_ BitVec 32)) SeekEntryResult!1510)

(assert (=> b!272579 (= lt!136033 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272580 () Bool)

(declare-fun res!136568 () Bool)

(assert (=> b!272580 (=> (not res!136568) (not e!174900))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272580 (= res!136568 (validKeyInArray!0 (select (arr!6352 a!3325) startIndex!26)))))

(declare-fun b!272581 () Bool)

(declare-fun res!136570 () Bool)

(assert (=> b!272581 (=> (not res!136570) (not e!174902))))

(declare-datatypes ((List!4160 0))(
  ( (Nil!4157) (Cons!4156 (h!4823 (_ BitVec 64)) (t!9242 List!4160)) )
))
(declare-fun arrayNoDuplicates!0 (array!13405 (_ BitVec 32) List!4160) Bool)

(assert (=> b!272581 (= res!136570 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4157))))

(declare-fun b!272582 () Bool)

(assert (=> b!272582 (= e!174900 (not true))))

(assert (=> b!272582 (arrayNoDuplicates!0 (array!13406 (store (arr!6352 a!3325) i!1267 k!2581) (size!6704 a!3325)) #b00000000000000000000000000000000 Nil!4157)))

(declare-datatypes ((Unit!8507 0))(
  ( (Unit!8508) )
))
(declare-fun lt!136032 () Unit!8507)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13405 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4160) Unit!8507)

(assert (=> b!272582 (= lt!136032 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4157))))

(declare-fun b!272583 () Bool)

(declare-fun res!136573 () Bool)

(assert (=> b!272583 (=> (not res!136573) (not e!174900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13405 (_ BitVec 32)) Bool)

(assert (=> b!272583 (= res!136573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272584 () Bool)

(declare-fun res!136575 () Bool)

(assert (=> b!272584 (=> (not res!136575) (not e!174900))))

(assert (=> b!272584 (= res!136575 (not (= startIndex!26 i!1267)))))

(declare-fun b!272585 () Bool)

(declare-fun res!136574 () Bool)

(assert (=> b!272585 (=> (not res!136574) (not e!174902))))

(assert (=> b!272585 (= res!136574 (and (= (size!6704 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6704 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6704 a!3325))))))

(assert (= (and start!26308 res!136569) b!272585))

(assert (= (and b!272585 res!136574) b!272578))

(assert (= (and b!272578 res!136571) b!272581))

(assert (= (and b!272581 res!136570) b!272577))

(assert (= (and b!272577 res!136572) b!272579))

(assert (= (and b!272579 res!136567) b!272583))

(assert (= (and b!272583 res!136573) b!272584))

(assert (= (and b!272584 res!136575) b!272580))

(assert (= (and b!272580 res!136568) b!272582))

(declare-fun m!287661 () Bool)

(assert (=> b!272582 m!287661))

(declare-fun m!287663 () Bool)

(assert (=> b!272582 m!287663))

(declare-fun m!287665 () Bool)

(assert (=> b!272582 m!287665))

(declare-fun m!287667 () Bool)

(assert (=> start!26308 m!287667))

(declare-fun m!287669 () Bool)

(assert (=> start!26308 m!287669))

(declare-fun m!287671 () Bool)

(assert (=> b!272578 m!287671))

(declare-fun m!287673 () Bool)

(assert (=> b!272577 m!287673))

(declare-fun m!287675 () Bool)

(assert (=> b!272580 m!287675))

(assert (=> b!272580 m!287675))

(declare-fun m!287677 () Bool)

(assert (=> b!272580 m!287677))

(declare-fun m!287679 () Bool)

(assert (=> b!272581 m!287679))

(declare-fun m!287681 () Bool)

(assert (=> b!272579 m!287681))

(declare-fun m!287683 () Bool)

(assert (=> b!272583 m!287683))

(push 1)

