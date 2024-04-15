; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25712 () Bool)

(assert start!25712)

(declare-fun res!130799 () Bool)

(declare-fun e!172363 () Bool)

(assert (=> start!25712 (=> (not res!130799) (not e!172363))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25712 (= res!130799 (validMask!0 mask!4002))))

(assert (=> start!25712 e!172363))

(assert (=> start!25712 true))

(declare-datatypes ((array!12879 0))(
  ( (array!12880 (arr!6093 (Array (_ BitVec 32) (_ BitVec 64))) (size!6446 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12879)

(declare-fun array_inv!4065 (array!12879) Bool)

(assert (=> start!25712 (array_inv!4065 a!3436)))

(declare-fun b!266451 () Bool)

(declare-fun e!172364 () Bool)

(assert (=> b!266451 (= e!172363 e!172364)))

(declare-fun res!130801 () Bool)

(assert (=> b!266451 (=> (not res!130801) (not e!172364))))

(declare-datatypes ((SeekEntryResult!1283 0))(
  ( (MissingZero!1283 (index!7302 (_ BitVec 32))) (Found!1283 (index!7303 (_ BitVec 32))) (Intermediate!1283 (undefined!2095 Bool) (index!7304 (_ BitVec 32)) (x!25623 (_ BitVec 32))) (Undefined!1283) (MissingVacant!1283 (index!7305 (_ BitVec 32))) )
))
(declare-fun lt!134289 () SeekEntryResult!1283)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266451 (= res!130801 (or (= lt!134289 (MissingZero!1283 i!1355)) (= lt!134289 (MissingVacant!1283 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12879 (_ BitVec 32)) SeekEntryResult!1283)

(assert (=> b!266451 (= lt!134289 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266452 () Bool)

(assert (=> b!266452 (= e!172364 false)))

(declare-fun lt!134288 () Bool)

(declare-datatypes ((List!3880 0))(
  ( (Nil!3877) (Cons!3876 (h!4543 (_ BitVec 64)) (t!8953 List!3880)) )
))
(declare-fun arrayNoDuplicates!0 (array!12879 (_ BitVec 32) List!3880) Bool)

(assert (=> b!266452 (= lt!134288 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3877))))

(declare-fun b!266453 () Bool)

(declare-fun res!130800 () Bool)

(assert (=> b!266453 (=> (not res!130800) (not e!172363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266453 (= res!130800 (validKeyInArray!0 k0!2698))))

(declare-fun b!266454 () Bool)

(declare-fun res!130804 () Bool)

(assert (=> b!266454 (=> (not res!130804) (not e!172364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12879 (_ BitVec 32)) Bool)

(assert (=> b!266454 (= res!130804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266455 () Bool)

(declare-fun res!130802 () Bool)

(assert (=> b!266455 (=> (not res!130802) (not e!172363))))

(assert (=> b!266455 (= res!130802 (and (= (size!6446 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6446 a!3436))))))

(declare-fun b!266456 () Bool)

(declare-fun res!130803 () Bool)

(assert (=> b!266456 (=> (not res!130803) (not e!172363))))

(declare-fun arrayContainsKey!0 (array!12879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266456 (= res!130803 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25712 res!130799) b!266455))

(assert (= (and b!266455 res!130802) b!266453))

(assert (= (and b!266453 res!130800) b!266456))

(assert (= (and b!266456 res!130803) b!266451))

(assert (= (and b!266451 res!130801) b!266454))

(assert (= (and b!266454 res!130804) b!266452))

(declare-fun m!282569 () Bool)

(assert (=> b!266451 m!282569))

(declare-fun m!282571 () Bool)

(assert (=> b!266456 m!282571))

(declare-fun m!282573 () Bool)

(assert (=> b!266453 m!282573))

(declare-fun m!282575 () Bool)

(assert (=> b!266452 m!282575))

(declare-fun m!282577 () Bool)

(assert (=> b!266454 m!282577))

(declare-fun m!282579 () Bool)

(assert (=> start!25712 m!282579))

(declare-fun m!282581 () Bool)

(assert (=> start!25712 m!282581))

(check-sat (not b!266452) (not b!266453) (not b!266456) (not start!25712) (not b!266451) (not b!266454))
(check-sat)
