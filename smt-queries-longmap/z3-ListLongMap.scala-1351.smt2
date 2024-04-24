; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26664 () Bool)

(assert start!26664)

(declare-fun b!276812 () Bool)

(declare-fun e!176789 () Bool)

(declare-fun e!176787 () Bool)

(assert (=> b!276812 (= e!176789 e!176787)))

(declare-fun res!140781 () Bool)

(assert (=> b!276812 (=> (not res!140781) (not e!176787))))

(declare-datatypes ((SeekEntryResult!1652 0))(
  ( (MissingZero!1652 (index!8778 (_ BitVec 32))) (Found!1652 (index!8779 (_ BitVec 32))) (Intermediate!1652 (undefined!2464 Bool) (index!8780 (_ BitVec 32)) (x!27145 (_ BitVec 32))) (Undefined!1652) (MissingVacant!1652 (index!8781 (_ BitVec 32))) )
))
(declare-fun lt!137799 () SeekEntryResult!1652)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276812 (= res!140781 (or (= lt!137799 (MissingZero!1652 i!1267)) (= lt!137799 (MissingVacant!1652 i!1267))))))

(declare-datatypes ((array!13760 0))(
  ( (array!13761 (arr!6529 (Array (_ BitVec 32) (_ BitVec 64))) (size!6881 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13760)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13760 (_ BitVec 32)) SeekEntryResult!1652)

(assert (=> b!276812 (= lt!137799 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276813 () Bool)

(declare-fun res!140776 () Bool)

(assert (=> b!276813 (=> (not res!140776) (not e!176789))))

(declare-datatypes ((List!4250 0))(
  ( (Nil!4247) (Cons!4246 (h!4913 (_ BitVec 64)) (t!9324 List!4250)) )
))
(declare-fun arrayNoDuplicates!0 (array!13760 (_ BitVec 32) List!4250) Bool)

(assert (=> b!276813 (= res!140776 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4247))))

(declare-fun b!276814 () Bool)

(declare-fun res!140780 () Bool)

(assert (=> b!276814 (=> (not res!140780) (not e!176789))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276814 (= res!140780 (and (= (size!6881 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6881 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6881 a!3325))))))

(declare-fun res!140777 () Bool)

(assert (=> start!26664 (=> (not res!140777) (not e!176789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26664 (= res!140777 (validMask!0 mask!3868))))

(assert (=> start!26664 e!176789))

(declare-fun array_inv!4479 (array!13760) Bool)

(assert (=> start!26664 (array_inv!4479 a!3325)))

(assert (=> start!26664 true))

(declare-fun b!276815 () Bool)

(declare-fun res!140778 () Bool)

(assert (=> b!276815 (=> (not res!140778) (not e!176789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276815 (= res!140778 (validKeyInArray!0 k0!2581))))

(declare-fun b!276816 () Bool)

(declare-fun res!140779 () Bool)

(assert (=> b!276816 (=> (not res!140779) (not e!176789))))

(declare-fun arrayContainsKey!0 (array!13760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276816 (= res!140779 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276817 () Bool)

(assert (=> b!276817 (= e!176787 false)))

(declare-fun lt!137798 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13760 (_ BitVec 32)) Bool)

(assert (=> b!276817 (= lt!137798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26664 res!140777) b!276814))

(assert (= (and b!276814 res!140780) b!276815))

(assert (= (and b!276815 res!140778) b!276813))

(assert (= (and b!276813 res!140776) b!276816))

(assert (= (and b!276816 res!140779) b!276812))

(assert (= (and b!276812 res!140781) b!276817))

(declare-fun m!292229 () Bool)

(assert (=> b!276817 m!292229))

(declare-fun m!292231 () Bool)

(assert (=> b!276816 m!292231))

(declare-fun m!292233 () Bool)

(assert (=> b!276813 m!292233))

(declare-fun m!292235 () Bool)

(assert (=> b!276812 m!292235))

(declare-fun m!292237 () Bool)

(assert (=> start!26664 m!292237))

(declare-fun m!292239 () Bool)

(assert (=> start!26664 m!292239))

(declare-fun m!292241 () Bool)

(assert (=> b!276815 m!292241))

(check-sat (not b!276815) (not b!276817) (not start!26664) (not b!276812) (not b!276816) (not b!276813))
(check-sat)
