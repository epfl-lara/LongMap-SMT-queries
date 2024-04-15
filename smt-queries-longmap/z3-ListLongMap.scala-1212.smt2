; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25742 () Bool)

(assert start!25742)

(declare-fun b!266731 () Bool)

(declare-fun e!172498 () Bool)

(declare-fun e!172500 () Bool)

(assert (=> b!266731 (= e!172498 e!172500)))

(declare-fun res!131078 () Bool)

(assert (=> b!266731 (=> (not res!131078) (not e!172500))))

(declare-datatypes ((SeekEntryResult!1298 0))(
  ( (MissingZero!1298 (index!7362 (_ BitVec 32))) (Found!1298 (index!7363 (_ BitVec 32))) (Intermediate!1298 (undefined!2110 Bool) (index!7364 (_ BitVec 32)) (x!25678 (_ BitVec 32))) (Undefined!1298) (MissingVacant!1298 (index!7365 (_ BitVec 32))) )
))
(declare-fun lt!134370 () SeekEntryResult!1298)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266731 (= res!131078 (or (= lt!134370 (MissingZero!1298 i!1355)) (= lt!134370 (MissingVacant!1298 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12909 0))(
  ( (array!12910 (arr!6108 (Array (_ BitVec 32) (_ BitVec 64))) (size!6461 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12909)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12909 (_ BitVec 32)) SeekEntryResult!1298)

(assert (=> b!266731 (= lt!134370 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266732 () Bool)

(assert (=> b!266732 (= e!172500 false)))

(declare-fun lt!134369 () Bool)

(declare-datatypes ((List!3895 0))(
  ( (Nil!3892) (Cons!3891 (h!4558 (_ BitVec 64)) (t!8968 List!3895)) )
))
(declare-fun arrayNoDuplicates!0 (array!12909 (_ BitVec 32) List!3895) Bool)

(assert (=> b!266732 (= lt!134369 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3892))))

(declare-fun b!266733 () Bool)

(declare-fun res!131083 () Bool)

(assert (=> b!266733 (=> (not res!131083) (not e!172498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266733 (= res!131083 (validKeyInArray!0 k0!2698))))

(declare-fun res!131082 () Bool)

(assert (=> start!25742 (=> (not res!131082) (not e!172498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25742 (= res!131082 (validMask!0 mask!4002))))

(assert (=> start!25742 e!172498))

(assert (=> start!25742 true))

(declare-fun array_inv!4080 (array!12909) Bool)

(assert (=> start!25742 (array_inv!4080 a!3436)))

(declare-fun b!266730 () Bool)

(declare-fun res!131079 () Bool)

(assert (=> b!266730 (=> (not res!131079) (not e!172500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12909 (_ BitVec 32)) Bool)

(assert (=> b!266730 (= res!131079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266734 () Bool)

(declare-fun res!131080 () Bool)

(assert (=> b!266734 (=> (not res!131080) (not e!172498))))

(declare-fun arrayContainsKey!0 (array!12909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266734 (= res!131080 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266735 () Bool)

(declare-fun res!131081 () Bool)

(assert (=> b!266735 (=> (not res!131081) (not e!172498))))

(assert (=> b!266735 (= res!131081 (and (= (size!6461 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6461 a!3436))))))

(assert (= (and start!25742 res!131082) b!266735))

(assert (= (and b!266735 res!131081) b!266733))

(assert (= (and b!266733 res!131083) b!266734))

(assert (= (and b!266734 res!131080) b!266731))

(assert (= (and b!266731 res!131078) b!266730))

(assert (= (and b!266730 res!131079) b!266732))

(declare-fun m!282779 () Bool)

(assert (=> b!266731 m!282779))

(declare-fun m!282781 () Bool)

(assert (=> b!266732 m!282781))

(declare-fun m!282783 () Bool)

(assert (=> start!25742 m!282783))

(declare-fun m!282785 () Bool)

(assert (=> start!25742 m!282785))

(declare-fun m!282787 () Bool)

(assert (=> b!266734 m!282787))

(declare-fun m!282789 () Bool)

(assert (=> b!266730 m!282789))

(declare-fun m!282791 () Bool)

(assert (=> b!266733 m!282791))

(check-sat (not b!266732) (not b!266734) (not b!266730) (not b!266731) (not start!25742) (not b!266733))
(check-sat)
