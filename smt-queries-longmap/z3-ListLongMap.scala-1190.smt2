; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25608 () Bool)

(assert start!25608)

(declare-fun b!265626 () Bool)

(declare-fun res!129925 () Bool)

(declare-fun e!172014 () Bool)

(assert (=> b!265626 (=> (not res!129925) (not e!172014))))

(declare-datatypes ((array!12787 0))(
  ( (array!12788 (arr!6048 (Array (_ BitVec 32) (_ BitVec 64))) (size!6400 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12787)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12787 (_ BitVec 32)) Bool)

(assert (=> b!265626 (= res!129925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265627 () Bool)

(declare-fun res!129922 () Bool)

(declare-fun e!172016 () Bool)

(assert (=> b!265627 (=> (not res!129922) (not e!172016))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265627 (= res!129922 (and (= (size!6400 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6400 a!3436))))))

(declare-fun res!129926 () Bool)

(assert (=> start!25608 (=> (not res!129926) (not e!172016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25608 (= res!129926 (validMask!0 mask!4002))))

(assert (=> start!25608 e!172016))

(assert (=> start!25608 true))

(declare-fun array_inv!4011 (array!12787) Bool)

(assert (=> start!25608 (array_inv!4011 a!3436)))

(declare-fun b!265628 () Bool)

(assert (=> b!265628 (= e!172016 e!172014)))

(declare-fun res!129923 () Bool)

(assert (=> b!265628 (=> (not res!129923) (not e!172014))))

(declare-datatypes ((SeekEntryResult!1239 0))(
  ( (MissingZero!1239 (index!7126 (_ BitVec 32))) (Found!1239 (index!7127 (_ BitVec 32))) (Intermediate!1239 (undefined!2051 Bool) (index!7128 (_ BitVec 32)) (x!25444 (_ BitVec 32))) (Undefined!1239) (MissingVacant!1239 (index!7129 (_ BitVec 32))) )
))
(declare-fun lt!134169 () SeekEntryResult!1239)

(assert (=> b!265628 (= res!129923 (or (= lt!134169 (MissingZero!1239 i!1355)) (= lt!134169 (MissingVacant!1239 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12787 (_ BitVec 32)) SeekEntryResult!1239)

(assert (=> b!265628 (= lt!134169 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265629 () Bool)

(assert (=> b!265629 (= e!172014 false)))

(declare-fun lt!134170 () Bool)

(declare-datatypes ((List!3862 0))(
  ( (Nil!3859) (Cons!3858 (h!4525 (_ BitVec 64)) (t!8944 List!3862)) )
))
(declare-fun arrayNoDuplicates!0 (array!12787 (_ BitVec 32) List!3862) Bool)

(assert (=> b!265629 (= lt!134170 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3859))))

(declare-fun b!265630 () Bool)

(declare-fun res!129927 () Bool)

(assert (=> b!265630 (=> (not res!129927) (not e!172016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265630 (= res!129927 (validKeyInArray!0 k0!2698))))

(declare-fun b!265631 () Bool)

(declare-fun res!129924 () Bool)

(assert (=> b!265631 (=> (not res!129924) (not e!172016))))

(declare-fun arrayContainsKey!0 (array!12787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265631 (= res!129924 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25608 res!129926) b!265627))

(assert (= (and b!265627 res!129922) b!265630))

(assert (= (and b!265630 res!129927) b!265631))

(assert (= (and b!265631 res!129924) b!265628))

(assert (= (and b!265628 res!129923) b!265626))

(assert (= (and b!265626 res!129925) b!265629))

(declare-fun m!282389 () Bool)

(assert (=> b!265628 m!282389))

(declare-fun m!282391 () Bool)

(assert (=> start!25608 m!282391))

(declare-fun m!282393 () Bool)

(assert (=> start!25608 m!282393))

(declare-fun m!282395 () Bool)

(assert (=> b!265626 m!282395))

(declare-fun m!282397 () Bool)

(assert (=> b!265629 m!282397))

(declare-fun m!282399 () Bool)

(assert (=> b!265630 m!282399))

(declare-fun m!282401 () Bool)

(assert (=> b!265631 m!282401))

(check-sat (not b!265631) (not b!265626) (not b!265629) (not b!265630) (not start!25608) (not b!265628))
(check-sat)
