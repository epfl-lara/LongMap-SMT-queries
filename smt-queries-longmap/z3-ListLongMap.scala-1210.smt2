; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25730 () Bool)

(assert start!25730)

(declare-fun res!130963 () Bool)

(declare-fun e!172445 () Bool)

(assert (=> start!25730 (=> (not res!130963) (not e!172445))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25730 (= res!130963 (validMask!0 mask!4002))))

(assert (=> start!25730 e!172445))

(assert (=> start!25730 true))

(declare-datatypes ((array!12897 0))(
  ( (array!12898 (arr!6102 (Array (_ BitVec 32) (_ BitVec 64))) (size!6455 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12897)

(declare-fun array_inv!4074 (array!12897) Bool)

(assert (=> start!25730 (array_inv!4074 a!3436)))

(declare-fun b!266613 () Bool)

(declare-fun res!130961 () Bool)

(declare-fun e!172446 () Bool)

(assert (=> b!266613 (=> (not res!130961) (not e!172446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12897 (_ BitVec 32)) Bool)

(assert (=> b!266613 (= res!130961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266614 () Bool)

(declare-fun res!130965 () Bool)

(assert (=> b!266614 (=> (not res!130965) (not e!172445))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266614 (= res!130965 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266615 () Bool)

(assert (=> b!266615 (= e!172445 e!172446)))

(declare-fun res!130964 () Bool)

(assert (=> b!266615 (=> (not res!130964) (not e!172446))))

(declare-datatypes ((SeekEntryResult!1292 0))(
  ( (MissingZero!1292 (index!7338 (_ BitVec 32))) (Found!1292 (index!7339 (_ BitVec 32))) (Intermediate!1292 (undefined!2104 Bool) (index!7340 (_ BitVec 32)) (x!25656 (_ BitVec 32))) (Undefined!1292) (MissingVacant!1292 (index!7341 (_ BitVec 32))) )
))
(declare-fun lt!134343 () SeekEntryResult!1292)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266615 (= res!130964 (or (= lt!134343 (MissingZero!1292 i!1355)) (= lt!134343 (MissingVacant!1292 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12897 (_ BitVec 32)) SeekEntryResult!1292)

(assert (=> b!266615 (= lt!134343 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266616 () Bool)

(assert (=> b!266616 (= e!172446 false)))

(declare-fun lt!134342 () Bool)

(declare-datatypes ((List!3889 0))(
  ( (Nil!3886) (Cons!3885 (h!4552 (_ BitVec 64)) (t!8962 List!3889)) )
))
(declare-fun arrayNoDuplicates!0 (array!12897 (_ BitVec 32) List!3889) Bool)

(assert (=> b!266616 (= lt!134342 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3886))))

(declare-fun b!266617 () Bool)

(declare-fun res!130962 () Bool)

(assert (=> b!266617 (=> (not res!130962) (not e!172445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266617 (= res!130962 (validKeyInArray!0 k0!2698))))

(declare-fun b!266618 () Bool)

(declare-fun res!130966 () Bool)

(assert (=> b!266618 (=> (not res!130966) (not e!172445))))

(assert (=> b!266618 (= res!130966 (and (= (size!6455 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6455 a!3436))))))

(assert (= (and start!25730 res!130963) b!266618))

(assert (= (and b!266618 res!130966) b!266617))

(assert (= (and b!266617 res!130962) b!266614))

(assert (= (and b!266614 res!130965) b!266615))

(assert (= (and b!266615 res!130964) b!266613))

(assert (= (and b!266613 res!130961) b!266616))

(declare-fun m!282695 () Bool)

(assert (=> b!266616 m!282695))

(declare-fun m!282697 () Bool)

(assert (=> b!266617 m!282697))

(declare-fun m!282699 () Bool)

(assert (=> b!266615 m!282699))

(declare-fun m!282701 () Bool)

(assert (=> start!25730 m!282701))

(declare-fun m!282703 () Bool)

(assert (=> start!25730 m!282703))

(declare-fun m!282705 () Bool)

(assert (=> b!266613 m!282705))

(declare-fun m!282707 () Bool)

(assert (=> b!266614 m!282707))

(check-sat (not b!266614) (not b!266617) (not b!266615) (not start!25730) (not b!266613) (not b!266616))
(check-sat)
