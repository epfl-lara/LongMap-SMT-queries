; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25718 () Bool)

(assert start!25718)

(declare-fun b!266699 () Bool)

(declare-fun res!130969 () Bool)

(declare-fun e!172517 () Bool)

(assert (=> b!266699 (=> (not res!130969) (not e!172517))))

(declare-datatypes ((array!12892 0))(
  ( (array!12893 (arr!6100 (Array (_ BitVec 32) (_ BitVec 64))) (size!6452 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12892)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266699 (= res!130969 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!130971 () Bool)

(assert (=> start!25718 (=> (not res!130971) (not e!172517))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25718 (= res!130971 (validMask!0 mask!4002))))

(assert (=> start!25718 e!172517))

(assert (=> start!25718 true))

(declare-fun array_inv!4050 (array!12892) Bool)

(assert (=> start!25718 (array_inv!4050 a!3436)))

(declare-fun b!266700 () Bool)

(declare-fun res!130972 () Bool)

(assert (=> b!266700 (=> (not res!130972) (not e!172517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266700 (= res!130972 (validKeyInArray!0 k0!2698))))

(declare-fun b!266701 () Bool)

(declare-fun res!130970 () Bool)

(assert (=> b!266701 (=> (not res!130970) (not e!172517))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266701 (= res!130970 (and (= (size!6452 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6452 a!3436))))))

(declare-fun b!266702 () Bool)

(declare-fun e!172516 () Bool)

(assert (=> b!266702 (= e!172516 false)))

(declare-fun lt!134547 () Bool)

(declare-datatypes ((List!3827 0))(
  ( (Nil!3824) (Cons!3823 (h!4490 (_ BitVec 64)) (t!8901 List!3827)) )
))
(declare-fun arrayNoDuplicates!0 (array!12892 (_ BitVec 32) List!3827) Bool)

(assert (=> b!266702 (= lt!134547 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3824))))

(declare-fun b!266703 () Bool)

(declare-fun res!130974 () Bool)

(assert (=> b!266703 (=> (not res!130974) (not e!172516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12892 (_ BitVec 32)) Bool)

(assert (=> b!266703 (= res!130974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266704 () Bool)

(assert (=> b!266704 (= e!172517 e!172516)))

(declare-fun res!130973 () Bool)

(assert (=> b!266704 (=> (not res!130973) (not e!172516))))

(declare-datatypes ((SeekEntryResult!1256 0))(
  ( (MissingZero!1256 (index!7194 (_ BitVec 32))) (Found!1256 (index!7195 (_ BitVec 32))) (Intermediate!1256 (undefined!2068 Bool) (index!7196 (_ BitVec 32)) (x!25605 (_ BitVec 32))) (Undefined!1256) (MissingVacant!1256 (index!7197 (_ BitVec 32))) )
))
(declare-fun lt!134546 () SeekEntryResult!1256)

(assert (=> b!266704 (= res!130973 (or (= lt!134546 (MissingZero!1256 i!1355)) (= lt!134546 (MissingVacant!1256 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12892 (_ BitVec 32)) SeekEntryResult!1256)

(assert (=> b!266704 (= lt!134546 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(assert (= (and start!25718 res!130971) b!266701))

(assert (= (and b!266701 res!130970) b!266700))

(assert (= (and b!266700 res!130972) b!266699))

(assert (= (and b!266699 res!130969) b!266704))

(assert (= (and b!266704 res!130973) b!266703))

(assert (= (and b!266703 res!130974) b!266702))

(declare-fun m!283409 () Bool)

(assert (=> b!266699 m!283409))

(declare-fun m!283411 () Bool)

(assert (=> start!25718 m!283411))

(declare-fun m!283413 () Bool)

(assert (=> start!25718 m!283413))

(declare-fun m!283415 () Bool)

(assert (=> b!266702 m!283415))

(declare-fun m!283417 () Bool)

(assert (=> b!266703 m!283417))

(declare-fun m!283419 () Bool)

(assert (=> b!266704 m!283419))

(declare-fun m!283421 () Bool)

(assert (=> b!266700 m!283421))

(check-sat (not b!266699) (not b!266702) (not b!266704) (not b!266703) (not b!266700) (not start!25718))
(check-sat)
