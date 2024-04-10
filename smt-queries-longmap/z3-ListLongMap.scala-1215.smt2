; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25758 () Bool)

(assert start!25758)

(declare-fun b!267057 () Bool)

(declare-fun e!172689 () Bool)

(assert (=> b!267057 (= e!172689 false)))

(declare-fun lt!134611 () Bool)

(declare-datatypes ((array!12937 0))(
  ( (array!12938 (arr!6123 (Array (_ BitVec 32) (_ BitVec 64))) (size!6475 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12937)

(declare-datatypes ((List!3937 0))(
  ( (Nil!3934) (Cons!3933 (h!4600 (_ BitVec 64)) (t!9019 List!3937)) )
))
(declare-fun arrayNoDuplicates!0 (array!12937 (_ BitVec 32) List!3937) Bool)

(assert (=> b!267057 (= lt!134611 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3934))))

(declare-fun b!267058 () Bool)

(declare-fun e!172691 () Bool)

(assert (=> b!267058 (= e!172691 e!172689)))

(declare-fun res!131357 () Bool)

(assert (=> b!267058 (=> (not res!131357) (not e!172689))))

(declare-datatypes ((SeekEntryResult!1314 0))(
  ( (MissingZero!1314 (index!7426 (_ BitVec 32))) (Found!1314 (index!7427 (_ BitVec 32))) (Intermediate!1314 (undefined!2126 Bool) (index!7428 (_ BitVec 32)) (x!25719 (_ BitVec 32))) (Undefined!1314) (MissingVacant!1314 (index!7429 (_ BitVec 32))) )
))
(declare-fun lt!134610 () SeekEntryResult!1314)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267058 (= res!131357 (or (= lt!134610 (MissingZero!1314 i!1355)) (= lt!134610 (MissingVacant!1314 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12937 (_ BitVec 32)) SeekEntryResult!1314)

(assert (=> b!267058 (= lt!134610 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!267059 () Bool)

(declare-fun res!131356 () Bool)

(assert (=> b!267059 (=> (not res!131356) (not e!172691))))

(assert (=> b!267059 (= res!131356 (and (= (size!6475 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6475 a!3436))))))

(declare-fun b!267060 () Bool)

(declare-fun res!131355 () Bool)

(assert (=> b!267060 (=> (not res!131355) (not e!172691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267060 (= res!131355 (validKeyInArray!0 k0!2698))))

(declare-fun b!267061 () Bool)

(declare-fun res!131353 () Bool)

(assert (=> b!267061 (=> (not res!131353) (not e!172691))))

(declare-fun arrayContainsKey!0 (array!12937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267061 (= res!131353 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267062 () Bool)

(declare-fun res!131354 () Bool)

(assert (=> b!267062 (=> (not res!131354) (not e!172689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12937 (_ BitVec 32)) Bool)

(assert (=> b!267062 (= res!131354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!131358 () Bool)

(assert (=> start!25758 (=> (not res!131358) (not e!172691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25758 (= res!131358 (validMask!0 mask!4002))))

(assert (=> start!25758 e!172691))

(assert (=> start!25758 true))

(declare-fun array_inv!4086 (array!12937) Bool)

(assert (=> start!25758 (array_inv!4086 a!3436)))

(assert (= (and start!25758 res!131358) b!267059))

(assert (= (and b!267059 res!131356) b!267060))

(assert (= (and b!267060 res!131355) b!267061))

(assert (= (and b!267061 res!131353) b!267058))

(assert (= (and b!267058 res!131357) b!267062))

(assert (= (and b!267062 res!131354) b!267057))

(declare-fun m!283511 () Bool)

(assert (=> b!267062 m!283511))

(declare-fun m!283513 () Bool)

(assert (=> b!267061 m!283513))

(declare-fun m!283515 () Bool)

(assert (=> b!267057 m!283515))

(declare-fun m!283517 () Bool)

(assert (=> b!267058 m!283517))

(declare-fun m!283519 () Bool)

(assert (=> b!267060 m!283519))

(declare-fun m!283521 () Bool)

(assert (=> start!25758 m!283521))

(declare-fun m!283523 () Bool)

(assert (=> start!25758 m!283523))

(check-sat (not b!267057) (not b!267062) (not b!267061) (not b!267060) (not b!267058) (not start!25758))
(check-sat)
