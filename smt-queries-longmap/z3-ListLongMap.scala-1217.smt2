; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25772 () Bool)

(assert start!25772)

(declare-fun res!131348 () Bool)

(declare-fun e!172635 () Bool)

(assert (=> start!25772 (=> (not res!131348) (not e!172635))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25772 (= res!131348 (validMask!0 mask!4002))))

(assert (=> start!25772 e!172635))

(assert (=> start!25772 true))

(declare-datatypes ((array!12939 0))(
  ( (array!12940 (arr!6123 (Array (_ BitVec 32) (_ BitVec 64))) (size!6476 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12939)

(declare-fun array_inv!4095 (array!12939) Bool)

(assert (=> start!25772 (array_inv!4095 a!3436)))

(declare-fun b!267000 () Bool)

(declare-fun res!131349 () Bool)

(assert (=> b!267000 (=> (not res!131349) (not e!172635))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267000 (= res!131349 (and (= (size!6476 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6476 a!3436))))))

(declare-fun b!267001 () Bool)

(declare-fun e!172633 () Bool)

(assert (=> b!267001 (= e!172633 false)))

(declare-fun lt!134460 () Bool)

(declare-datatypes ((List!3910 0))(
  ( (Nil!3907) (Cons!3906 (h!4573 (_ BitVec 64)) (t!8983 List!3910)) )
))
(declare-fun arrayNoDuplicates!0 (array!12939 (_ BitVec 32) List!3910) Bool)

(assert (=> b!267001 (= lt!134460 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3907))))

(declare-fun b!267002 () Bool)

(assert (=> b!267002 (= e!172635 e!172633)))

(declare-fun res!131353 () Bool)

(assert (=> b!267002 (=> (not res!131353) (not e!172633))))

(declare-datatypes ((SeekEntryResult!1313 0))(
  ( (MissingZero!1313 (index!7422 (_ BitVec 32))) (Found!1313 (index!7423 (_ BitVec 32))) (Intermediate!1313 (undefined!2125 Bool) (index!7424 (_ BitVec 32)) (x!25733 (_ BitVec 32))) (Undefined!1313) (MissingVacant!1313 (index!7425 (_ BitVec 32))) )
))
(declare-fun lt!134459 () SeekEntryResult!1313)

(assert (=> b!267002 (= res!131353 (or (= lt!134459 (MissingZero!1313 i!1355)) (= lt!134459 (MissingVacant!1313 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12939 (_ BitVec 32)) SeekEntryResult!1313)

(assert (=> b!267002 (= lt!134459 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!267003 () Bool)

(declare-fun res!131351 () Bool)

(assert (=> b!267003 (=> (not res!131351) (not e!172633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12939 (_ BitVec 32)) Bool)

(assert (=> b!267003 (= res!131351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267004 () Bool)

(declare-fun res!131350 () Bool)

(assert (=> b!267004 (=> (not res!131350) (not e!172635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267004 (= res!131350 (validKeyInArray!0 k0!2698))))

(declare-fun b!267005 () Bool)

(declare-fun res!131352 () Bool)

(assert (=> b!267005 (=> (not res!131352) (not e!172635))))

(declare-fun arrayContainsKey!0 (array!12939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267005 (= res!131352 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25772 res!131348) b!267000))

(assert (= (and b!267000 res!131349) b!267004))

(assert (= (and b!267004 res!131350) b!267005))

(assert (= (and b!267005 res!131352) b!267002))

(assert (= (and b!267002 res!131353) b!267003))

(assert (= (and b!267003 res!131351) b!267001))

(declare-fun m!282989 () Bool)

(assert (=> b!267003 m!282989))

(declare-fun m!282991 () Bool)

(assert (=> b!267002 m!282991))

(declare-fun m!282993 () Bool)

(assert (=> b!267001 m!282993))

(declare-fun m!282995 () Bool)

(assert (=> b!267005 m!282995))

(declare-fun m!282997 () Bool)

(assert (=> start!25772 m!282997))

(declare-fun m!282999 () Bool)

(assert (=> start!25772 m!282999))

(declare-fun m!283001 () Bool)

(assert (=> b!267004 m!283001))

(check-sat (not b!267004) (not b!267001) (not start!25772) (not b!267002) (not b!267003) (not b!267005))
(check-sat)
