; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25616 () Bool)

(assert start!25616)

(declare-fun res!129863 () Bool)

(declare-fun e!171931 () Bool)

(assert (=> start!25616 (=> (not res!129863) (not e!171931))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25616 (= res!129863 (validMask!0 mask!4002))))

(assert (=> start!25616 e!171931))

(assert (=> start!25616 true))

(declare-datatypes ((array!12783 0))(
  ( (array!12784 (arr!6045 (Array (_ BitVec 32) (_ BitVec 64))) (size!6398 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12783)

(declare-fun array_inv!4017 (array!12783) Bool)

(assert (=> start!25616 (array_inv!4017 a!3436)))

(declare-fun b!265515 () Bool)

(declare-fun res!129864 () Bool)

(assert (=> b!265515 (=> (not res!129864) (not e!171931))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265515 (= res!129864 (validKeyInArray!0 k0!2698))))

(declare-fun b!265516 () Bool)

(declare-fun res!129868 () Bool)

(assert (=> b!265516 (=> (not res!129868) (not e!171931))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265516 (= res!129868 (and (= (size!6398 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6398 a!3436))))))

(declare-fun b!265517 () Bool)

(declare-fun e!171932 () Bool)

(assert (=> b!265517 (= e!171931 e!171932)))

(declare-fun res!129865 () Bool)

(assert (=> b!265517 (=> (not res!129865) (not e!171932))))

(declare-datatypes ((SeekEntryResult!1235 0))(
  ( (MissingZero!1235 (index!7110 (_ BitVec 32))) (Found!1235 (index!7111 (_ BitVec 32))) (Intermediate!1235 (undefined!2047 Bool) (index!7112 (_ BitVec 32)) (x!25447 (_ BitVec 32))) (Undefined!1235) (MissingVacant!1235 (index!7113 (_ BitVec 32))) )
))
(declare-fun lt!134001 () SeekEntryResult!1235)

(assert (=> b!265517 (= res!129865 (or (= lt!134001 (MissingZero!1235 i!1355)) (= lt!134001 (MissingVacant!1235 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12783 (_ BitVec 32)) SeekEntryResult!1235)

(assert (=> b!265517 (= lt!134001 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265518 () Bool)

(assert (=> b!265518 (= e!171932 false)))

(declare-fun lt!134000 () Bool)

(declare-datatypes ((List!3832 0))(
  ( (Nil!3829) (Cons!3828 (h!4495 (_ BitVec 64)) (t!8905 List!3832)) )
))
(declare-fun arrayNoDuplicates!0 (array!12783 (_ BitVec 32) List!3832) Bool)

(assert (=> b!265518 (= lt!134000 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3829))))

(declare-fun b!265519 () Bool)

(declare-fun res!129867 () Bool)

(assert (=> b!265519 (=> (not res!129867) (not e!171932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12783 (_ BitVec 32)) Bool)

(assert (=> b!265519 (= res!129867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265520 () Bool)

(declare-fun res!129866 () Bool)

(assert (=> b!265520 (=> (not res!129866) (not e!171931))))

(declare-fun arrayContainsKey!0 (array!12783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265520 (= res!129866 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25616 res!129863) b!265516))

(assert (= (and b!265516 res!129868) b!265515))

(assert (= (and b!265515 res!129864) b!265520))

(assert (= (and b!265520 res!129866) b!265517))

(assert (= (and b!265517 res!129865) b!265519))

(assert (= (and b!265519 res!129867) b!265518))

(declare-fun m!281825 () Bool)

(assert (=> start!25616 m!281825))

(declare-fun m!281827 () Bool)

(assert (=> start!25616 m!281827))

(declare-fun m!281829 () Bool)

(assert (=> b!265517 m!281829))

(declare-fun m!281831 () Bool)

(assert (=> b!265515 m!281831))

(declare-fun m!281833 () Bool)

(assert (=> b!265520 m!281833))

(declare-fun m!281835 () Bool)

(assert (=> b!265519 m!281835))

(declare-fun m!281837 () Bool)

(assert (=> b!265518 m!281837))

(check-sat (not b!265519) (not start!25616) (not b!265517) (not b!265518) (not b!265515) (not b!265520))
(check-sat)
