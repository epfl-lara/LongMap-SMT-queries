; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26652 () Bool)

(assert start!26652)

(declare-fun b!276705 () Bool)

(declare-fun res!140668 () Bool)

(declare-fun e!176734 () Bool)

(assert (=> b!276705 (=> (not res!140668) (not e!176734))))

(declare-datatypes ((array!13748 0))(
  ( (array!13749 (arr!6523 (Array (_ BitVec 32) (_ BitVec 64))) (size!6875 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13748)

(declare-datatypes ((List!4244 0))(
  ( (Nil!4241) (Cons!4240 (h!4907 (_ BitVec 64)) (t!9318 List!4244)) )
))
(declare-fun arrayNoDuplicates!0 (array!13748 (_ BitVec 32) List!4244) Bool)

(assert (=> b!276705 (= res!140668 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4241))))

(declare-fun b!276706 () Bool)

(declare-fun e!176735 () Bool)

(assert (=> b!276706 (= e!176734 e!176735)))

(declare-fun res!140670 () Bool)

(assert (=> b!276706 (=> (not res!140670) (not e!176735))))

(declare-datatypes ((SeekEntryResult!1646 0))(
  ( (MissingZero!1646 (index!8754 (_ BitVec 32))) (Found!1646 (index!8755 (_ BitVec 32))) (Intermediate!1646 (undefined!2458 Bool) (index!8756 (_ BitVec 32)) (x!27123 (_ BitVec 32))) (Undefined!1646) (MissingVacant!1646 (index!8757 (_ BitVec 32))) )
))
(declare-fun lt!137762 () SeekEntryResult!1646)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276706 (= res!140670 (or (= lt!137762 (MissingZero!1646 i!1267)) (= lt!137762 (MissingVacant!1646 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13748 (_ BitVec 32)) SeekEntryResult!1646)

(assert (=> b!276706 (= lt!137762 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276707 () Bool)

(declare-fun res!140672 () Bool)

(assert (=> b!276707 (=> (not res!140672) (not e!176734))))

(declare-fun arrayContainsKey!0 (array!13748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276707 (= res!140672 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276708 () Bool)

(declare-fun res!140669 () Bool)

(assert (=> b!276708 (=> (not res!140669) (not e!176734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276708 (= res!140669 (validKeyInArray!0 k0!2581))))

(declare-fun b!276709 () Bool)

(declare-fun res!140673 () Bool)

(assert (=> b!276709 (=> (not res!140673) (not e!176734))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276709 (= res!140673 (and (= (size!6875 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6875 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6875 a!3325))))))

(declare-fun b!276704 () Bool)

(assert (=> b!276704 (= e!176735 false)))

(declare-fun lt!137763 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13748 (_ BitVec 32)) Bool)

(assert (=> b!276704 (= lt!137763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140671 () Bool)

(assert (=> start!26652 (=> (not res!140671) (not e!176734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26652 (= res!140671 (validMask!0 mask!3868))))

(assert (=> start!26652 e!176734))

(declare-fun array_inv!4473 (array!13748) Bool)

(assert (=> start!26652 (array_inv!4473 a!3325)))

(assert (=> start!26652 true))

(assert (= (and start!26652 res!140671) b!276709))

(assert (= (and b!276709 res!140673) b!276708))

(assert (= (and b!276708 res!140669) b!276705))

(assert (= (and b!276705 res!140668) b!276707))

(assert (= (and b!276707 res!140672) b!276706))

(assert (= (and b!276706 res!140670) b!276704))

(declare-fun m!292145 () Bool)

(assert (=> b!276705 m!292145))

(declare-fun m!292147 () Bool)

(assert (=> start!26652 m!292147))

(declare-fun m!292149 () Bool)

(assert (=> start!26652 m!292149))

(declare-fun m!292151 () Bool)

(assert (=> b!276706 m!292151))

(declare-fun m!292153 () Bool)

(assert (=> b!276704 m!292153))

(declare-fun m!292155 () Bool)

(assert (=> b!276708 m!292155))

(declare-fun m!292157 () Bool)

(assert (=> b!276707 m!292157))

(check-sat (not b!276707) (not b!276704) (not b!276706) (not b!276708) (not b!276705) (not start!26652))
(check-sat)
