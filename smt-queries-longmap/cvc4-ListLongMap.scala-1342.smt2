; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26614 () Bool)

(assert start!26614)

(declare-fun b!276306 () Bool)

(declare-fun e!176538 () Bool)

(assert (=> b!276306 (= e!176538 false)))

(declare-fun lt!137599 () Bool)

(declare-datatypes ((array!13711 0))(
  ( (array!13712 (arr!6505 (Array (_ BitVec 32) (_ BitVec 64))) (size!6857 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13711)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13711 (_ BitVec 32)) Bool)

(assert (=> b!276306 (= lt!137599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140296 () Bool)

(declare-fun e!176539 () Bool)

(assert (=> start!26614 (=> (not res!140296) (not e!176539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26614 (= res!140296 (validMask!0 mask!3868))))

(assert (=> start!26614 e!176539))

(declare-fun array_inv!4468 (array!13711) Bool)

(assert (=> start!26614 (array_inv!4468 a!3325)))

(assert (=> start!26614 true))

(declare-fun b!276307 () Bool)

(assert (=> b!276307 (= e!176539 e!176538)))

(declare-fun res!140301 () Bool)

(assert (=> b!276307 (=> (not res!140301) (not e!176538))))

(declare-datatypes ((SeekEntryResult!1663 0))(
  ( (MissingZero!1663 (index!8822 (_ BitVec 32))) (Found!1663 (index!8823 (_ BitVec 32))) (Intermediate!1663 (undefined!2475 Bool) (index!8824 (_ BitVec 32)) (x!27084 (_ BitVec 32))) (Undefined!1663) (MissingVacant!1663 (index!8825 (_ BitVec 32))) )
))
(declare-fun lt!137598 () SeekEntryResult!1663)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276307 (= res!140301 (or (= lt!137598 (MissingZero!1663 i!1267)) (= lt!137598 (MissingVacant!1663 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13711 (_ BitVec 32)) SeekEntryResult!1663)

(assert (=> b!276307 (= lt!137598 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276308 () Bool)

(declare-fun res!140297 () Bool)

(assert (=> b!276308 (=> (not res!140297) (not e!176539))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276308 (= res!140297 (and (= (size!6857 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6857 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6857 a!3325))))))

(declare-fun b!276309 () Bool)

(declare-fun res!140300 () Bool)

(assert (=> b!276309 (=> (not res!140300) (not e!176539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276309 (= res!140300 (validKeyInArray!0 k!2581))))

(declare-fun b!276310 () Bool)

(declare-fun res!140299 () Bool)

(assert (=> b!276310 (=> (not res!140299) (not e!176539))))

(declare-datatypes ((List!4313 0))(
  ( (Nil!4310) (Cons!4309 (h!4976 (_ BitVec 64)) (t!9395 List!4313)) )
))
(declare-fun arrayNoDuplicates!0 (array!13711 (_ BitVec 32) List!4313) Bool)

(assert (=> b!276310 (= res!140299 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4310))))

(declare-fun b!276311 () Bool)

(declare-fun res!140298 () Bool)

(assert (=> b!276311 (=> (not res!140298) (not e!176539))))

(declare-fun arrayContainsKey!0 (array!13711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276311 (= res!140298 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26614 res!140296) b!276308))

(assert (= (and b!276308 res!140297) b!276309))

(assert (= (and b!276309 res!140300) b!276310))

(assert (= (and b!276310 res!140299) b!276311))

(assert (= (and b!276311 res!140298) b!276307))

(assert (= (and b!276307 res!140301) b!276306))

(declare-fun m!291673 () Bool)

(assert (=> b!276307 m!291673))

(declare-fun m!291675 () Bool)

(assert (=> start!26614 m!291675))

(declare-fun m!291677 () Bool)

(assert (=> start!26614 m!291677))

(declare-fun m!291679 () Bool)

(assert (=> b!276306 m!291679))

(declare-fun m!291681 () Bool)

(assert (=> b!276309 m!291681))

(declare-fun m!291683 () Bool)

(assert (=> b!276311 m!291683))

(declare-fun m!291685 () Bool)

(assert (=> b!276310 m!291685))

(push 1)

(assert (not b!276306))

(assert (not b!276311))

(assert (not b!276310))

(assert (not b!276309))

(assert (not start!26614))

(assert (not b!276307))

(check-sat)

