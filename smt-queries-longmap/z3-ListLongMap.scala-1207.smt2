; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25712 () Bool)

(assert start!25712)

(declare-fun b!266645 () Bool)

(declare-fun res!130920 () Bool)

(declare-fun e!172490 () Bool)

(assert (=> b!266645 (=> (not res!130920) (not e!172490))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266645 (= res!130920 (validKeyInArray!0 k0!2698))))

(declare-fun b!266646 () Bool)

(declare-fun e!172488 () Bool)

(assert (=> b!266646 (= e!172488 false)))

(declare-fun lt!134528 () Bool)

(declare-datatypes ((array!12886 0))(
  ( (array!12887 (arr!6097 (Array (_ BitVec 32) (_ BitVec 64))) (size!6449 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12886)

(declare-datatypes ((List!3824 0))(
  ( (Nil!3821) (Cons!3820 (h!4487 (_ BitVec 64)) (t!8898 List!3824)) )
))
(declare-fun arrayNoDuplicates!0 (array!12886 (_ BitVec 32) List!3824) Bool)

(assert (=> b!266646 (= lt!134528 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3821))))

(declare-fun b!266647 () Bool)

(declare-fun res!130918 () Bool)

(assert (=> b!266647 (=> (not res!130918) (not e!172490))))

(declare-fun arrayContainsKey!0 (array!12886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266647 (= res!130918 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266648 () Bool)

(declare-fun res!130917 () Bool)

(assert (=> b!266648 (=> (not res!130917) (not e!172488))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12886 (_ BitVec 32)) Bool)

(assert (=> b!266648 (= res!130917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266649 () Bool)

(declare-fun res!130915 () Bool)

(assert (=> b!266649 (=> (not res!130915) (not e!172490))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266649 (= res!130915 (and (= (size!6449 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6449 a!3436))))))

(declare-fun b!266650 () Bool)

(assert (=> b!266650 (= e!172490 e!172488)))

(declare-fun res!130916 () Bool)

(assert (=> b!266650 (=> (not res!130916) (not e!172488))))

(declare-datatypes ((SeekEntryResult!1253 0))(
  ( (MissingZero!1253 (index!7182 (_ BitVec 32))) (Found!1253 (index!7183 (_ BitVec 32))) (Intermediate!1253 (undefined!2065 Bool) (index!7184 (_ BitVec 32)) (x!25594 (_ BitVec 32))) (Undefined!1253) (MissingVacant!1253 (index!7185 (_ BitVec 32))) )
))
(declare-fun lt!134529 () SeekEntryResult!1253)

(assert (=> b!266650 (= res!130916 (or (= lt!134529 (MissingZero!1253 i!1355)) (= lt!134529 (MissingVacant!1253 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12886 (_ BitVec 32)) SeekEntryResult!1253)

(assert (=> b!266650 (= lt!134529 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!130919 () Bool)

(assert (=> start!25712 (=> (not res!130919) (not e!172490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25712 (= res!130919 (validMask!0 mask!4002))))

(assert (=> start!25712 e!172490))

(assert (=> start!25712 true))

(declare-fun array_inv!4047 (array!12886) Bool)

(assert (=> start!25712 (array_inv!4047 a!3436)))

(assert (= (and start!25712 res!130919) b!266649))

(assert (= (and b!266649 res!130915) b!266645))

(assert (= (and b!266645 res!130920) b!266647))

(assert (= (and b!266647 res!130918) b!266650))

(assert (= (and b!266650 res!130916) b!266648))

(assert (= (and b!266648 res!130917) b!266646))

(declare-fun m!283367 () Bool)

(assert (=> b!266647 m!283367))

(declare-fun m!283369 () Bool)

(assert (=> start!25712 m!283369))

(declare-fun m!283371 () Bool)

(assert (=> start!25712 m!283371))

(declare-fun m!283373 () Bool)

(assert (=> b!266646 m!283373))

(declare-fun m!283375 () Bool)

(assert (=> b!266650 m!283375))

(declare-fun m!283377 () Bool)

(assert (=> b!266648 m!283377))

(declare-fun m!283379 () Bool)

(assert (=> b!266645 m!283379))

(check-sat (not b!266645) (not start!25712) (not b!266648) (not b!266650) (not b!266647) (not b!266646))
(check-sat)
