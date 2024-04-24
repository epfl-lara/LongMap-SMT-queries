; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26646 () Bool)

(assert start!26646)

(declare-fun b!276650 () Bool)

(declare-fun res!140614 () Bool)

(declare-fun e!176707 () Bool)

(assert (=> b!276650 (=> (not res!140614) (not e!176707))))

(declare-datatypes ((array!13742 0))(
  ( (array!13743 (arr!6520 (Array (_ BitVec 32) (_ BitVec 64))) (size!6872 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13742)

(declare-datatypes ((List!4241 0))(
  ( (Nil!4238) (Cons!4237 (h!4904 (_ BitVec 64)) (t!9315 List!4241)) )
))
(declare-fun arrayNoDuplicates!0 (array!13742 (_ BitVec 32) List!4241) Bool)

(assert (=> b!276650 (= res!140614 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4238))))

(declare-fun b!276651 () Bool)

(declare-fun e!176708 () Bool)

(assert (=> b!276651 (= e!176708 false)))

(declare-fun lt!137745 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13742 (_ BitVec 32)) Bool)

(assert (=> b!276651 (= lt!137745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276652 () Bool)

(declare-fun res!140615 () Bool)

(assert (=> b!276652 (=> (not res!140615) (not e!176707))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276652 (= res!140615 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276653 () Bool)

(declare-fun res!140616 () Bool)

(assert (=> b!276653 (=> (not res!140616) (not e!176707))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276653 (= res!140616 (and (= (size!6872 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6872 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6872 a!3325))))))

(declare-fun res!140617 () Bool)

(assert (=> start!26646 (=> (not res!140617) (not e!176707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26646 (= res!140617 (validMask!0 mask!3868))))

(assert (=> start!26646 e!176707))

(declare-fun array_inv!4470 (array!13742) Bool)

(assert (=> start!26646 (array_inv!4470 a!3325)))

(assert (=> start!26646 true))

(declare-fun b!276654 () Bool)

(assert (=> b!276654 (= e!176707 e!176708)))

(declare-fun res!140618 () Bool)

(assert (=> b!276654 (=> (not res!140618) (not e!176708))))

(declare-datatypes ((SeekEntryResult!1643 0))(
  ( (MissingZero!1643 (index!8742 (_ BitVec 32))) (Found!1643 (index!8743 (_ BitVec 32))) (Intermediate!1643 (undefined!2455 Bool) (index!8744 (_ BitVec 32)) (x!27112 (_ BitVec 32))) (Undefined!1643) (MissingVacant!1643 (index!8745 (_ BitVec 32))) )
))
(declare-fun lt!137744 () SeekEntryResult!1643)

(assert (=> b!276654 (= res!140618 (or (= lt!137744 (MissingZero!1643 i!1267)) (= lt!137744 (MissingVacant!1643 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13742 (_ BitVec 32)) SeekEntryResult!1643)

(assert (=> b!276654 (= lt!137744 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276655 () Bool)

(declare-fun res!140619 () Bool)

(assert (=> b!276655 (=> (not res!140619) (not e!176707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276655 (= res!140619 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26646 res!140617) b!276653))

(assert (= (and b!276653 res!140616) b!276655))

(assert (= (and b!276655 res!140619) b!276650))

(assert (= (and b!276650 res!140614) b!276652))

(assert (= (and b!276652 res!140615) b!276654))

(assert (= (and b!276654 res!140618) b!276651))

(declare-fun m!292103 () Bool)

(assert (=> start!26646 m!292103))

(declare-fun m!292105 () Bool)

(assert (=> start!26646 m!292105))

(declare-fun m!292107 () Bool)

(assert (=> b!276651 m!292107))

(declare-fun m!292109 () Bool)

(assert (=> b!276655 m!292109))

(declare-fun m!292111 () Bool)

(assert (=> b!276654 m!292111))

(declare-fun m!292113 () Bool)

(assert (=> b!276652 m!292113))

(declare-fun m!292115 () Bool)

(assert (=> b!276650 m!292115))

(check-sat (not b!276650) (not b!276652) (not b!276655) (not b!276651) (not b!276654) (not start!26646))
(check-sat)
