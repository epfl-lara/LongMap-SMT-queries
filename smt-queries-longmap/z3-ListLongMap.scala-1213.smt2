; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25748 () Bool)

(assert start!25748)

(declare-fun b!266784 () Bool)

(declare-fun res!131136 () Bool)

(declare-fun e!172526 () Bool)

(assert (=> b!266784 (=> (not res!131136) (not e!172526))))

(declare-datatypes ((array!12915 0))(
  ( (array!12916 (arr!6111 (Array (_ BitVec 32) (_ BitVec 64))) (size!6464 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12915)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12915 (_ BitVec 32)) Bool)

(assert (=> b!266784 (= res!131136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266785 () Bool)

(declare-fun res!131133 () Bool)

(declare-fun e!172527 () Bool)

(assert (=> b!266785 (=> (not res!131133) (not e!172527))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266785 (= res!131133 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266786 () Bool)

(declare-fun res!131137 () Bool)

(assert (=> b!266786 (=> (not res!131137) (not e!172527))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266786 (= res!131137 (and (= (size!6464 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6464 a!3436))))))

(declare-fun b!266787 () Bool)

(assert (=> b!266787 (= e!172526 false)))

(declare-fun lt!134388 () Bool)

(declare-datatypes ((List!3898 0))(
  ( (Nil!3895) (Cons!3894 (h!4561 (_ BitVec 64)) (t!8971 List!3898)) )
))
(declare-fun arrayNoDuplicates!0 (array!12915 (_ BitVec 32) List!3898) Bool)

(assert (=> b!266787 (= lt!134388 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3895))))

(declare-fun b!266788 () Bool)

(declare-fun res!131132 () Bool)

(assert (=> b!266788 (=> (not res!131132) (not e!172527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266788 (= res!131132 (validKeyInArray!0 k0!2698))))

(declare-fun b!266789 () Bool)

(assert (=> b!266789 (= e!172527 e!172526)))

(declare-fun res!131135 () Bool)

(assert (=> b!266789 (=> (not res!131135) (not e!172526))))

(declare-datatypes ((SeekEntryResult!1301 0))(
  ( (MissingZero!1301 (index!7374 (_ BitVec 32))) (Found!1301 (index!7375 (_ BitVec 32))) (Intermediate!1301 (undefined!2113 Bool) (index!7376 (_ BitVec 32)) (x!25689 (_ BitVec 32))) (Undefined!1301) (MissingVacant!1301 (index!7377 (_ BitVec 32))) )
))
(declare-fun lt!134387 () SeekEntryResult!1301)

(assert (=> b!266789 (= res!131135 (or (= lt!134387 (MissingZero!1301 i!1355)) (= lt!134387 (MissingVacant!1301 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12915 (_ BitVec 32)) SeekEntryResult!1301)

(assert (=> b!266789 (= lt!134387 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!131134 () Bool)

(assert (=> start!25748 (=> (not res!131134) (not e!172527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25748 (= res!131134 (validMask!0 mask!4002))))

(assert (=> start!25748 e!172527))

(assert (=> start!25748 true))

(declare-fun array_inv!4083 (array!12915) Bool)

(assert (=> start!25748 (array_inv!4083 a!3436)))

(assert (= (and start!25748 res!131134) b!266786))

(assert (= (and b!266786 res!131137) b!266788))

(assert (= (and b!266788 res!131132) b!266785))

(assert (= (and b!266785 res!131133) b!266789))

(assert (= (and b!266789 res!131135) b!266784))

(assert (= (and b!266784 res!131136) b!266787))

(declare-fun m!282821 () Bool)

(assert (=> b!266789 m!282821))

(declare-fun m!282823 () Bool)

(assert (=> b!266784 m!282823))

(declare-fun m!282825 () Bool)

(assert (=> start!25748 m!282825))

(declare-fun m!282827 () Bool)

(assert (=> start!25748 m!282827))

(declare-fun m!282829 () Bool)

(assert (=> b!266785 m!282829))

(declare-fun m!282831 () Bool)

(assert (=> b!266787 m!282831))

(declare-fun m!282833 () Bool)

(assert (=> b!266788 m!282833))

(check-sat (not b!266789) (not b!266784) (not start!25748) (not b!266785) (not b!266787) (not b!266788))
(check-sat)
