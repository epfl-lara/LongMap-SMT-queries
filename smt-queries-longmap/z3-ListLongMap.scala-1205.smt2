; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25700 () Bool)

(assert start!25700)

(declare-fun res!130684 () Bool)

(declare-fun e!172310 () Bool)

(assert (=> start!25700 (=> (not res!130684) (not e!172310))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25700 (= res!130684 (validMask!0 mask!4002))))

(assert (=> start!25700 e!172310))

(assert (=> start!25700 true))

(declare-datatypes ((array!12867 0))(
  ( (array!12868 (arr!6087 (Array (_ BitVec 32) (_ BitVec 64))) (size!6440 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12867)

(declare-fun array_inv!4059 (array!12867) Bool)

(assert (=> start!25700 (array_inv!4059 a!3436)))

(declare-fun b!266329 () Bool)

(declare-fun res!130678 () Bool)

(assert (=> b!266329 (=> (not res!130678) (not e!172310))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266329 (= res!130678 (validKeyInArray!0 k0!2698))))

(declare-fun b!266330 () Bool)

(declare-fun e!172309 () Bool)

(assert (=> b!266330 (= e!172310 e!172309)))

(declare-fun res!130677 () Bool)

(assert (=> b!266330 (=> (not res!130677) (not e!172309))))

(declare-datatypes ((SeekEntryResult!1277 0))(
  ( (MissingZero!1277 (index!7278 (_ BitVec 32))) (Found!1277 (index!7279 (_ BitVec 32))) (Intermediate!1277 (undefined!2089 Bool) (index!7280 (_ BitVec 32)) (x!25601 (_ BitVec 32))) (Undefined!1277) (MissingVacant!1277 (index!7281 (_ BitVec 32))) )
))
(declare-fun lt!134253 () SeekEntryResult!1277)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266330 (= res!130677 (or (= lt!134253 (MissingZero!1277 i!1355)) (= lt!134253 (MissingVacant!1277 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12867 (_ BitVec 32)) SeekEntryResult!1277)

(assert (=> b!266330 (= lt!134253 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266331 () Bool)

(declare-fun res!130680 () Bool)

(assert (=> b!266331 (=> (not res!130680) (not e!172309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12867 (_ BitVec 32)) Bool)

(assert (=> b!266331 (= res!130680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266332 () Bool)

(declare-fun res!130681 () Bool)

(assert (=> b!266332 (=> (not res!130681) (not e!172310))))

(assert (=> b!266332 (= res!130681 (and (= (size!6440 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6440 a!3436))))))

(declare-fun b!266333 () Bool)

(declare-fun res!130682 () Bool)

(assert (=> b!266333 (=> (not res!130682) (not e!172309))))

(assert (=> b!266333 (= res!130682 (bvslt #b00000000000000000000000000000000 (size!6440 a!3436)))))

(declare-fun b!266334 () Bool)

(declare-fun res!130683 () Bool)

(assert (=> b!266334 (=> (not res!130683) (not e!172309))))

(declare-datatypes ((List!3874 0))(
  ( (Nil!3871) (Cons!3870 (h!4537 (_ BitVec 64)) (t!8947 List!3874)) )
))
(declare-fun arrayNoDuplicates!0 (array!12867 (_ BitVec 32) List!3874) Bool)

(assert (=> b!266334 (= res!130683 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3871))))

(declare-fun b!266335 () Bool)

(declare-fun res!130679 () Bool)

(assert (=> b!266335 (=> (not res!130679) (not e!172310))))

(declare-fun arrayContainsKey!0 (array!12867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266335 (= res!130679 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266336 () Bool)

(assert (=> b!266336 (= e!172309 (not (bvsle #b00000000000000000000000000000000 (size!6440 a!3436))))))

(assert (=> b!266336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12868 (store (arr!6087 a!3436) i!1355 k0!2698) (size!6440 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8241 0))(
  ( (Unit!8242) )
))
(declare-fun lt!134252 () Unit!8241)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12867 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8241)

(assert (=> b!266336 (= lt!134252 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(assert (= (and start!25700 res!130684) b!266332))

(assert (= (and b!266332 res!130681) b!266329))

(assert (= (and b!266329 res!130678) b!266335))

(assert (= (and b!266335 res!130679) b!266330))

(assert (= (and b!266330 res!130677) b!266331))

(assert (= (and b!266331 res!130680) b!266334))

(assert (= (and b!266334 res!130683) b!266333))

(assert (= (and b!266333 res!130682) b!266336))

(declare-fun m!282467 () Bool)

(assert (=> start!25700 m!282467))

(declare-fun m!282469 () Bool)

(assert (=> start!25700 m!282469))

(declare-fun m!282471 () Bool)

(assert (=> b!266330 m!282471))

(declare-fun m!282473 () Bool)

(assert (=> b!266335 m!282473))

(declare-fun m!282475 () Bool)

(assert (=> b!266334 m!282475))

(declare-fun m!282477 () Bool)

(assert (=> b!266336 m!282477))

(declare-fun m!282479 () Bool)

(assert (=> b!266336 m!282479))

(declare-fun m!282481 () Bool)

(assert (=> b!266336 m!282481))

(declare-fun m!282483 () Bool)

(assert (=> b!266329 m!282483))

(declare-fun m!282485 () Bool)

(assert (=> b!266331 m!282485))

(check-sat (not b!266330) (not b!266329) (not b!266334) (not b!266335) (not start!25700) (not b!266331) (not b!266336))
(check-sat)
