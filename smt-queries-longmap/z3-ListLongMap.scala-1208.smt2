; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25718 () Bool)

(assert start!25718)

(declare-fun b!266505 () Bool)

(declare-fun res!130858 () Bool)

(declare-fun e!172390 () Bool)

(assert (=> b!266505 (=> (not res!130858) (not e!172390))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266505 (= res!130858 (validKeyInArray!0 k0!2698))))

(declare-fun b!266506 () Bool)

(declare-fun res!130854 () Bool)

(declare-fun e!172392 () Bool)

(assert (=> b!266506 (=> (not res!130854) (not e!172392))))

(declare-datatypes ((array!12885 0))(
  ( (array!12886 (arr!6096 (Array (_ BitVec 32) (_ BitVec 64))) (size!6449 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12885)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12885 (_ BitVec 32)) Bool)

(assert (=> b!266506 (= res!130854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266507 () Bool)

(declare-fun res!130856 () Bool)

(assert (=> b!266507 (=> (not res!130856) (not e!172390))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266507 (= res!130856 (and (= (size!6449 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6449 a!3436))))))

(declare-fun b!266508 () Bool)

(declare-fun res!130857 () Bool)

(assert (=> b!266508 (=> (not res!130857) (not e!172390))))

(declare-fun arrayContainsKey!0 (array!12885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266508 (= res!130857 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266509 () Bool)

(assert (=> b!266509 (= e!172392 false)))

(declare-fun lt!134306 () Bool)

(declare-datatypes ((List!3883 0))(
  ( (Nil!3880) (Cons!3879 (h!4546 (_ BitVec 64)) (t!8956 List!3883)) )
))
(declare-fun arrayNoDuplicates!0 (array!12885 (_ BitVec 32) List!3883) Bool)

(assert (=> b!266509 (= lt!134306 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3880))))

(declare-fun res!130853 () Bool)

(assert (=> start!25718 (=> (not res!130853) (not e!172390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25718 (= res!130853 (validMask!0 mask!4002))))

(assert (=> start!25718 e!172390))

(assert (=> start!25718 true))

(declare-fun array_inv!4068 (array!12885) Bool)

(assert (=> start!25718 (array_inv!4068 a!3436)))

(declare-fun b!266510 () Bool)

(assert (=> b!266510 (= e!172390 e!172392)))

(declare-fun res!130855 () Bool)

(assert (=> b!266510 (=> (not res!130855) (not e!172392))))

(declare-datatypes ((SeekEntryResult!1286 0))(
  ( (MissingZero!1286 (index!7314 (_ BitVec 32))) (Found!1286 (index!7315 (_ BitVec 32))) (Intermediate!1286 (undefined!2098 Bool) (index!7316 (_ BitVec 32)) (x!25634 (_ BitVec 32))) (Undefined!1286) (MissingVacant!1286 (index!7317 (_ BitVec 32))) )
))
(declare-fun lt!134307 () SeekEntryResult!1286)

(assert (=> b!266510 (= res!130855 (or (= lt!134307 (MissingZero!1286 i!1355)) (= lt!134307 (MissingVacant!1286 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12885 (_ BitVec 32)) SeekEntryResult!1286)

(assert (=> b!266510 (= lt!134307 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(assert (= (and start!25718 res!130853) b!266507))

(assert (= (and b!266507 res!130856) b!266505))

(assert (= (and b!266505 res!130858) b!266508))

(assert (= (and b!266508 res!130857) b!266510))

(assert (= (and b!266510 res!130855) b!266506))

(assert (= (and b!266506 res!130854) b!266509))

(declare-fun m!282611 () Bool)

(assert (=> b!266505 m!282611))

(declare-fun m!282613 () Bool)

(assert (=> b!266510 m!282613))

(declare-fun m!282615 () Bool)

(assert (=> start!25718 m!282615))

(declare-fun m!282617 () Bool)

(assert (=> start!25718 m!282617))

(declare-fun m!282619 () Bool)

(assert (=> b!266508 m!282619))

(declare-fun m!282621 () Bool)

(assert (=> b!266509 m!282621))

(declare-fun m!282623 () Bool)

(assert (=> b!266506 m!282623))

(check-sat (not b!266509) (not b!266505) (not b!266510) (not b!266506) (not b!266508) (not start!25718))
(check-sat)
