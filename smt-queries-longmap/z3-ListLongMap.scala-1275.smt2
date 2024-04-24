; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26208 () Bool)

(assert start!26208)

(declare-fun b!271030 () Bool)

(declare-fun e!174476 () Bool)

(declare-fun e!174474 () Bool)

(assert (=> b!271030 (= e!174476 e!174474)))

(declare-fun res!135000 () Bool)

(assert (=> b!271030 (=> (not res!135000) (not e!174474))))

(declare-datatypes ((SeekEntryResult!1424 0))(
  ( (MissingZero!1424 (index!7866 (_ BitVec 32))) (Found!1424 (index!7867 (_ BitVec 32))) (Intermediate!1424 (undefined!2236 Bool) (index!7868 (_ BitVec 32)) (x!26309 (_ BitVec 32))) (Undefined!1424) (MissingVacant!1424 (index!7869 (_ BitVec 32))) )
))
(declare-fun lt!135791 () SeekEntryResult!1424)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271030 (= res!135000 (or (= lt!135791 (MissingZero!1424 i!1267)) (= lt!135791 (MissingVacant!1424 i!1267))))))

(declare-datatypes ((array!13304 0))(
  ( (array!13305 (arr!6301 (Array (_ BitVec 32) (_ BitVec 64))) (size!6653 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13304)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13304 (_ BitVec 32)) SeekEntryResult!1424)

(assert (=> b!271030 (= lt!135791 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271031 () Bool)

(declare-fun res!134999 () Bool)

(assert (=> b!271031 (=> (not res!134999) (not e!174474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13304 (_ BitVec 32)) Bool)

(assert (=> b!271031 (= res!134999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271032 () Bool)

(assert (=> b!271032 (= e!174474 false)))

(declare-fun lt!135792 () Bool)

(declare-datatypes ((List!4022 0))(
  ( (Nil!4019) (Cons!4018 (h!4685 (_ BitVec 64)) (t!9096 List!4022)) )
))
(declare-fun contains!1915 (List!4022 (_ BitVec 64)) Bool)

(assert (=> b!271032 (= lt!135792 (contains!1915 Nil!4019 k0!2581))))

(declare-fun b!271033 () Bool)

(declare-fun res!135005 () Bool)

(assert (=> b!271033 (=> (not res!135005) (not e!174476))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271033 (= res!135005 (and (= (size!6653 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6653 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6653 a!3325))))))

(declare-fun res!134998 () Bool)

(assert (=> start!26208 (=> (not res!134998) (not e!174476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26208 (= res!134998 (validMask!0 mask!3868))))

(assert (=> start!26208 e!174476))

(declare-fun array_inv!4251 (array!13304) Bool)

(assert (=> start!26208 (array_inv!4251 a!3325)))

(assert (=> start!26208 true))

(declare-fun b!271034 () Bool)

(declare-fun res!134996 () Bool)

(assert (=> b!271034 (=> (not res!134996) (not e!174476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271034 (= res!134996 (validKeyInArray!0 k0!2581))))

(declare-fun b!271035 () Bool)

(declare-fun res!135002 () Bool)

(assert (=> b!271035 (=> (not res!135002) (not e!174474))))

(assert (=> b!271035 (= res!135002 (not (contains!1915 Nil!4019 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271036 () Bool)

(declare-fun res!135004 () Bool)

(assert (=> b!271036 (=> (not res!135004) (not e!174474))))

(assert (=> b!271036 (= res!135004 (not (= startIndex!26 i!1267)))))

(declare-fun b!271037 () Bool)

(declare-fun res!134995 () Bool)

(assert (=> b!271037 (=> (not res!134995) (not e!174474))))

(assert (=> b!271037 (= res!134995 (and (bvslt (size!6653 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6653 a!3325))))))

(declare-fun b!271038 () Bool)

(declare-fun res!135003 () Bool)

(assert (=> b!271038 (=> (not res!135003) (not e!174474))))

(declare-fun noDuplicate!131 (List!4022) Bool)

(assert (=> b!271038 (= res!135003 (noDuplicate!131 Nil!4019))))

(declare-fun b!271039 () Bool)

(declare-fun res!134997 () Bool)

(assert (=> b!271039 (=> (not res!134997) (not e!174476))))

(declare-fun arrayContainsKey!0 (array!13304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271039 (= res!134997 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271040 () Bool)

(declare-fun res!135006 () Bool)

(assert (=> b!271040 (=> (not res!135006) (not e!174474))))

(assert (=> b!271040 (= res!135006 (not (contains!1915 Nil!4019 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271041 () Bool)

(declare-fun res!135001 () Bool)

(assert (=> b!271041 (=> (not res!135001) (not e!174476))))

(declare-fun arrayNoDuplicates!0 (array!13304 (_ BitVec 32) List!4022) Bool)

(assert (=> b!271041 (= res!135001 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4019))))

(declare-fun b!271042 () Bool)

(declare-fun res!134994 () Bool)

(assert (=> b!271042 (=> (not res!134994) (not e!174474))))

(assert (=> b!271042 (= res!134994 (validKeyInArray!0 (select (arr!6301 a!3325) startIndex!26)))))

(assert (= (and start!26208 res!134998) b!271033))

(assert (= (and b!271033 res!135005) b!271034))

(assert (= (and b!271034 res!134996) b!271041))

(assert (= (and b!271041 res!135001) b!271039))

(assert (= (and b!271039 res!134997) b!271030))

(assert (= (and b!271030 res!135000) b!271031))

(assert (= (and b!271031 res!134999) b!271036))

(assert (= (and b!271036 res!135004) b!271042))

(assert (= (and b!271042 res!134994) b!271037))

(assert (= (and b!271037 res!134995) b!271038))

(assert (= (and b!271038 res!135003) b!271040))

(assert (= (and b!271040 res!135006) b!271035))

(assert (= (and b!271035 res!135002) b!271032))

(declare-fun m!286625 () Bool)

(assert (=> b!271035 m!286625))

(declare-fun m!286627 () Bool)

(assert (=> b!271040 m!286627))

(declare-fun m!286629 () Bool)

(assert (=> b!271042 m!286629))

(assert (=> b!271042 m!286629))

(declare-fun m!286631 () Bool)

(assert (=> b!271042 m!286631))

(declare-fun m!286633 () Bool)

(assert (=> b!271032 m!286633))

(declare-fun m!286635 () Bool)

(assert (=> b!271030 m!286635))

(declare-fun m!286637 () Bool)

(assert (=> b!271031 m!286637))

(declare-fun m!286639 () Bool)

(assert (=> b!271034 m!286639))

(declare-fun m!286641 () Bool)

(assert (=> start!26208 m!286641))

(declare-fun m!286643 () Bool)

(assert (=> start!26208 m!286643))

(declare-fun m!286645 () Bool)

(assert (=> b!271038 m!286645))

(declare-fun m!286647 () Bool)

(assert (=> b!271041 m!286647))

(declare-fun m!286649 () Bool)

(assert (=> b!271039 m!286649))

(check-sat (not start!26208) (not b!271040) (not b!271034) (not b!271038) (not b!271031) (not b!271042) (not b!271030) (not b!271041) (not b!271039) (not b!271035) (not b!271032))
(check-sat)
