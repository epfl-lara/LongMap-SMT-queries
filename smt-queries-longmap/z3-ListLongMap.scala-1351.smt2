; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26666 () Bool)

(assert start!26666)

(declare-fun res!140660 () Bool)

(declare-fun e!176662 () Bool)

(assert (=> start!26666 (=> (not res!140660) (not e!176662))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26666 (= res!140660 (validMask!0 mask!3868))))

(assert (=> start!26666 e!176662))

(declare-datatypes ((array!13752 0))(
  ( (array!13753 (arr!6525 (Array (_ BitVec 32) (_ BitVec 64))) (size!6878 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13752)

(declare-fun array_inv!4497 (array!13752) Bool)

(assert (=> start!26666 (array_inv!4497 a!3325)))

(assert (=> start!26666 true))

(declare-fun b!276618 () Bool)

(declare-fun e!176664 () Bool)

(assert (=> b!276618 (= e!176664 false)))

(declare-fun lt!137559 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13752 (_ BitVec 32)) Bool)

(assert (=> b!276618 (= lt!137559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276619 () Bool)

(declare-fun res!140661 () Bool)

(assert (=> b!276619 (=> (not res!140661) (not e!176662))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276619 (= res!140661 (and (= (size!6878 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6878 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6878 a!3325))))))

(declare-fun b!276620 () Bool)

(declare-fun res!140665 () Bool)

(assert (=> b!276620 (=> (not res!140665) (not e!176662))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276620 (= res!140665 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276621 () Bool)

(assert (=> b!276621 (= e!176662 e!176664)))

(declare-fun res!140664 () Bool)

(assert (=> b!276621 (=> (not res!140664) (not e!176664))))

(declare-datatypes ((SeekEntryResult!1682 0))(
  ( (MissingZero!1682 (index!8898 (_ BitVec 32))) (Found!1682 (index!8899 (_ BitVec 32))) (Intermediate!1682 (undefined!2494 Bool) (index!8900 (_ BitVec 32)) (x!27174 (_ BitVec 32))) (Undefined!1682) (MissingVacant!1682 (index!8901 (_ BitVec 32))) )
))
(declare-fun lt!137558 () SeekEntryResult!1682)

(assert (=> b!276621 (= res!140664 (or (= lt!137558 (MissingZero!1682 i!1267)) (= lt!137558 (MissingVacant!1682 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13752 (_ BitVec 32)) SeekEntryResult!1682)

(assert (=> b!276621 (= lt!137558 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276622 () Bool)

(declare-fun res!140663 () Bool)

(assert (=> b!276622 (=> (not res!140663) (not e!176662))))

(declare-datatypes ((List!4306 0))(
  ( (Nil!4303) (Cons!4302 (h!4969 (_ BitVec 64)) (t!9379 List!4306)) )
))
(declare-fun arrayNoDuplicates!0 (array!13752 (_ BitVec 32) List!4306) Bool)

(assert (=> b!276622 (= res!140663 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4303))))

(declare-fun b!276623 () Bool)

(declare-fun res!140662 () Bool)

(assert (=> b!276623 (=> (not res!140662) (not e!176662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276623 (= res!140662 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26666 res!140660) b!276619))

(assert (= (and b!276619 res!140661) b!276623))

(assert (= (and b!276623 res!140662) b!276622))

(assert (= (and b!276622 res!140663) b!276620))

(assert (= (and b!276620 res!140665) b!276621))

(assert (= (and b!276621 res!140664) b!276618))

(declare-fun m!291431 () Bool)

(assert (=> b!276623 m!291431))

(declare-fun m!291433 () Bool)

(assert (=> b!276622 m!291433))

(declare-fun m!291435 () Bool)

(assert (=> start!26666 m!291435))

(declare-fun m!291437 () Bool)

(assert (=> start!26666 m!291437))

(declare-fun m!291439 () Bool)

(assert (=> b!276618 m!291439))

(declare-fun m!291441 () Bool)

(assert (=> b!276620 m!291441))

(declare-fun m!291443 () Bool)

(assert (=> b!276621 m!291443))

(check-sat (not b!276623) (not b!276622) (not b!276621) (not start!26666) (not b!276620) (not b!276618))
(check-sat)
