; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26616 () Bool)

(assert start!26616)

(declare-fun b!276371 () Bool)

(declare-fun res!140340 () Bool)

(declare-fun e!176573 () Bool)

(assert (=> b!276371 (=> (not res!140340) (not e!176573))))

(declare-datatypes ((array!13712 0))(
  ( (array!13713 (arr!6505 (Array (_ BitVec 32) (_ BitVec 64))) (size!6857 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13712)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276371 (= res!140340 (and (= (size!6857 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6857 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6857 a!3325))))))

(declare-fun b!276372 () Bool)

(declare-fun e!176572 () Bool)

(assert (=> b!276372 (= e!176572 false)))

(declare-fun lt!137663 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13712 (_ BitVec 32)) Bool)

(assert (=> b!276372 (= lt!137663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276374 () Bool)

(assert (=> b!276374 (= e!176573 e!176572)))

(declare-fun res!140339 () Bool)

(assert (=> b!276374 (=> (not res!140339) (not e!176572))))

(declare-datatypes ((SeekEntryResult!1628 0))(
  ( (MissingZero!1628 (index!8682 (_ BitVec 32))) (Found!1628 (index!8683 (_ BitVec 32))) (Intermediate!1628 (undefined!2440 Bool) (index!8684 (_ BitVec 32)) (x!27057 (_ BitVec 32))) (Undefined!1628) (MissingVacant!1628 (index!8685 (_ BitVec 32))) )
))
(declare-fun lt!137664 () SeekEntryResult!1628)

(assert (=> b!276374 (= res!140339 (or (= lt!137664 (MissingZero!1628 i!1267)) (= lt!137664 (MissingVacant!1628 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13712 (_ BitVec 32)) SeekEntryResult!1628)

(assert (=> b!276374 (= lt!137664 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276375 () Bool)

(declare-fun res!140337 () Bool)

(assert (=> b!276375 (=> (not res!140337) (not e!176573))))

(declare-fun arrayContainsKey!0 (array!13712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276375 (= res!140337 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276376 () Bool)

(declare-fun res!140336 () Bool)

(assert (=> b!276376 (=> (not res!140336) (not e!176573))))

(declare-datatypes ((List!4226 0))(
  ( (Nil!4223) (Cons!4222 (h!4889 (_ BitVec 64)) (t!9300 List!4226)) )
))
(declare-fun arrayNoDuplicates!0 (array!13712 (_ BitVec 32) List!4226) Bool)

(assert (=> b!276376 (= res!140336 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4223))))

(declare-fun res!140338 () Bool)

(assert (=> start!26616 (=> (not res!140338) (not e!176573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26616 (= res!140338 (validMask!0 mask!3868))))

(assert (=> start!26616 e!176573))

(declare-fun array_inv!4455 (array!13712) Bool)

(assert (=> start!26616 (array_inv!4455 a!3325)))

(assert (=> start!26616 true))

(declare-fun b!276373 () Bool)

(declare-fun res!140335 () Bool)

(assert (=> b!276373 (=> (not res!140335) (not e!176573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276373 (= res!140335 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26616 res!140338) b!276371))

(assert (= (and b!276371 res!140340) b!276373))

(assert (= (and b!276373 res!140335) b!276376))

(assert (= (and b!276376 res!140336) b!276375))

(assert (= (and b!276375 res!140337) b!276374))

(assert (= (and b!276374 res!140339) b!276372))

(declare-fun m!291893 () Bool)

(assert (=> b!276374 m!291893))

(declare-fun m!291895 () Bool)

(assert (=> b!276372 m!291895))

(declare-fun m!291897 () Bool)

(assert (=> b!276373 m!291897))

(declare-fun m!291899 () Bool)

(assert (=> b!276376 m!291899))

(declare-fun m!291901 () Bool)

(assert (=> b!276375 m!291901))

(declare-fun m!291903 () Bool)

(assert (=> start!26616 m!291903))

(declare-fun m!291905 () Bool)

(assert (=> start!26616 m!291905))

(check-sat (not b!276376) (not b!276375) (not b!276373) (not b!276372) (not b!276374) (not start!26616))
(check-sat)
