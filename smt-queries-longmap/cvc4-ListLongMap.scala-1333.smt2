; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26560 () Bool)

(assert start!26560)

(declare-fun b!275708 () Bool)

(declare-fun res!139698 () Bool)

(declare-fun e!176296 () Bool)

(assert (=> b!275708 (=> (not res!139698) (not e!176296))))

(declare-datatypes ((array!13657 0))(
  ( (array!13658 (arr!6478 (Array (_ BitVec 32) (_ BitVec 64))) (size!6830 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13657)

(declare-datatypes ((List!4286 0))(
  ( (Nil!4283) (Cons!4282 (h!4949 (_ BitVec 64)) (t!9368 List!4286)) )
))
(declare-fun arrayNoDuplicates!0 (array!13657 (_ BitVec 32) List!4286) Bool)

(assert (=> b!275708 (= res!139698 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4283))))

(declare-fun res!139705 () Bool)

(assert (=> start!26560 (=> (not res!139705) (not e!176296))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26560 (= res!139705 (validMask!0 mask!3868))))

(assert (=> start!26560 e!176296))

(declare-fun array_inv!4441 (array!13657) Bool)

(assert (=> start!26560 (array_inv!4441 a!3325)))

(assert (=> start!26560 true))

(declare-fun b!275709 () Bool)

(declare-fun res!139703 () Bool)

(assert (=> b!275709 (=> (not res!139703) (not e!176296))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275709 (= res!139703 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275710 () Bool)

(declare-fun res!139701 () Bool)

(declare-fun e!176295 () Bool)

(assert (=> b!275710 (=> (not res!139701) (not e!176295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13657 (_ BitVec 32)) Bool)

(assert (=> b!275710 (= res!139701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275711 () Bool)

(assert (=> b!275711 (= e!176295 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275711 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13658 (store (arr!6478 a!3325) i!1267 k!2581) (size!6830 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8687 0))(
  ( (Unit!8688) )
))
(declare-fun lt!137454 () Unit!8687)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8687)

(assert (=> b!275711 (= lt!137454 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275712 () Bool)

(declare-fun res!139704 () Bool)

(assert (=> b!275712 (=> (not res!139704) (not e!176296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275712 (= res!139704 (validKeyInArray!0 k!2581))))

(declare-fun b!275713 () Bool)

(declare-fun res!139702 () Bool)

(assert (=> b!275713 (=> (not res!139702) (not e!176295))))

(assert (=> b!275713 (= res!139702 (and (bvslt startIndex!26 (bvsub (size!6830 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275714 () Bool)

(assert (=> b!275714 (= e!176296 e!176295)))

(declare-fun res!139706 () Bool)

(assert (=> b!275714 (=> (not res!139706) (not e!176295))))

(declare-datatypes ((SeekEntryResult!1636 0))(
  ( (MissingZero!1636 (index!8714 (_ BitVec 32))) (Found!1636 (index!8715 (_ BitVec 32))) (Intermediate!1636 (undefined!2448 Bool) (index!8716 (_ BitVec 32)) (x!26985 (_ BitVec 32))) (Undefined!1636) (MissingVacant!1636 (index!8717 (_ BitVec 32))) )
))
(declare-fun lt!137455 () SeekEntryResult!1636)

(assert (=> b!275714 (= res!139706 (or (= lt!137455 (MissingZero!1636 i!1267)) (= lt!137455 (MissingVacant!1636 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13657 (_ BitVec 32)) SeekEntryResult!1636)

(assert (=> b!275714 (= lt!137455 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275715 () Bool)

(declare-fun res!139707 () Bool)

(assert (=> b!275715 (=> (not res!139707) (not e!176295))))

(assert (=> b!275715 (= res!139707 (not (= startIndex!26 i!1267)))))

(declare-fun b!275716 () Bool)

(declare-fun res!139700 () Bool)

(assert (=> b!275716 (=> (not res!139700) (not e!176296))))

(assert (=> b!275716 (= res!139700 (and (= (size!6830 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6830 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6830 a!3325))))))

(declare-fun b!275717 () Bool)

(declare-fun res!139699 () Bool)

(assert (=> b!275717 (=> (not res!139699) (not e!176295))))

(assert (=> b!275717 (= res!139699 (not (validKeyInArray!0 (select (arr!6478 a!3325) startIndex!26))))))

(assert (= (and start!26560 res!139705) b!275716))

(assert (= (and b!275716 res!139700) b!275712))

(assert (= (and b!275712 res!139704) b!275708))

(assert (= (and b!275708 res!139698) b!275709))

(assert (= (and b!275709 res!139703) b!275714))

(assert (= (and b!275714 res!139706) b!275710))

(assert (= (and b!275710 res!139701) b!275715))

(assert (= (and b!275715 res!139707) b!275717))

(assert (= (and b!275717 res!139699) b!275713))

(assert (= (and b!275713 res!139702) b!275711))

(declare-fun m!291213 () Bool)

(assert (=> b!275714 m!291213))

(declare-fun m!291215 () Bool)

(assert (=> start!26560 m!291215))

(declare-fun m!291217 () Bool)

(assert (=> start!26560 m!291217))

(declare-fun m!291219 () Bool)

(assert (=> b!275708 m!291219))

(declare-fun m!291221 () Bool)

(assert (=> b!275712 m!291221))

(declare-fun m!291223 () Bool)

(assert (=> b!275717 m!291223))

(assert (=> b!275717 m!291223))

(declare-fun m!291225 () Bool)

(assert (=> b!275717 m!291225))

(declare-fun m!291227 () Bool)

(assert (=> b!275710 m!291227))

(declare-fun m!291229 () Bool)

(assert (=> b!275709 m!291229))

(declare-fun m!291231 () Bool)

(assert (=> b!275711 m!291231))

(declare-fun m!291233 () Bool)

(assert (=> b!275711 m!291233))

(declare-fun m!291235 () Bool)

(assert (=> b!275711 m!291235))

(push 1)

(assert (not start!26560))

(assert (not b!275708))

(assert (not b!275709))

