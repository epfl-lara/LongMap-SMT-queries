; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25622 () Bool)

(assert start!25622)

(declare-fun b!265752 () Bool)

(declare-fun res!130052 () Bool)

(declare-fun e!172078 () Bool)

(assert (=> b!265752 (=> (not res!130052) (not e!172078))))

(declare-datatypes ((array!12801 0))(
  ( (array!12802 (arr!6055 (Array (_ BitVec 32) (_ BitVec 64))) (size!6407 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12801)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265752 (= res!130052 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265753 () Bool)

(declare-fun res!130049 () Bool)

(declare-fun e!172077 () Bool)

(assert (=> b!265753 (=> (not res!130049) (not e!172077))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12801 (_ BitVec 32)) Bool)

(assert (=> b!265753 (= res!130049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265754 () Bool)

(assert (=> b!265754 (= e!172077 false)))

(declare-fun lt!134211 () Bool)

(declare-datatypes ((List!3869 0))(
  ( (Nil!3866) (Cons!3865 (h!4532 (_ BitVec 64)) (t!8951 List!3869)) )
))
(declare-fun arrayNoDuplicates!0 (array!12801 (_ BitVec 32) List!3869) Bool)

(assert (=> b!265754 (= lt!134211 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3866))))

(declare-fun b!265755 () Bool)

(declare-fun res!130050 () Bool)

(assert (=> b!265755 (=> (not res!130050) (not e!172078))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265755 (= res!130050 (and (= (size!6407 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6407 a!3436))))))

(declare-fun b!265756 () Bool)

(declare-fun res!130051 () Bool)

(assert (=> b!265756 (=> (not res!130051) (not e!172078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265756 (= res!130051 (validKeyInArray!0 k!2698))))

(declare-fun res!130048 () Bool)

(assert (=> start!25622 (=> (not res!130048) (not e!172078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25622 (= res!130048 (validMask!0 mask!4002))))

(assert (=> start!25622 e!172078))

(assert (=> start!25622 true))

(declare-fun array_inv!4018 (array!12801) Bool)

(assert (=> start!25622 (array_inv!4018 a!3436)))

(declare-fun b!265757 () Bool)

(assert (=> b!265757 (= e!172078 e!172077)))

(declare-fun res!130053 () Bool)

(assert (=> b!265757 (=> (not res!130053) (not e!172077))))

(declare-datatypes ((SeekEntryResult!1246 0))(
  ( (MissingZero!1246 (index!7154 (_ BitVec 32))) (Found!1246 (index!7155 (_ BitVec 32))) (Intermediate!1246 (undefined!2058 Bool) (index!7156 (_ BitVec 32)) (x!25467 (_ BitVec 32))) (Undefined!1246) (MissingVacant!1246 (index!7157 (_ BitVec 32))) )
))
(declare-fun lt!134212 () SeekEntryResult!1246)

(assert (=> b!265757 (= res!130053 (or (= lt!134212 (MissingZero!1246 i!1355)) (= lt!134212 (MissingVacant!1246 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12801 (_ BitVec 32)) SeekEntryResult!1246)

(assert (=> b!265757 (= lt!134212 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25622 res!130048) b!265755))

(assert (= (and b!265755 res!130050) b!265756))

(assert (= (and b!265756 res!130051) b!265752))

(assert (= (and b!265752 res!130052) b!265757))

(assert (= (and b!265757 res!130053) b!265753))

(assert (= (and b!265753 res!130049) b!265754))

(declare-fun m!282487 () Bool)

(assert (=> b!265754 m!282487))

(declare-fun m!282489 () Bool)

(assert (=> b!265752 m!282489))

(declare-fun m!282491 () Bool)

(assert (=> b!265756 m!282491))

(declare-fun m!282493 () Bool)

(assert (=> b!265757 m!282493))

(declare-fun m!282495 () Bool)

(assert (=> start!25622 m!282495))

(declare-fun m!282497 () Bool)

(assert (=> start!25622 m!282497))

(declare-fun m!282499 () Bool)

(assert (=> b!265753 m!282499))

(push 1)

