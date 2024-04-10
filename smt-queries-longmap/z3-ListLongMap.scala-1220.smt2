; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25788 () Bool)

(assert start!25788)

(declare-fun res!131644 () Bool)

(declare-fun e!172819 () Bool)

(assert (=> start!25788 (=> (not res!131644) (not e!172819))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25788 (= res!131644 (validMask!0 mask!3868))))

(assert (=> start!25788 e!172819))

(declare-datatypes ((array!12967 0))(
  ( (array!12968 (arr!6138 (Array (_ BitVec 32) (_ BitVec 64))) (size!6490 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12967)

(declare-fun array_inv!4101 (array!12967) Bool)

(assert (=> start!25788 (array_inv!4101 a!3325)))

(assert (=> start!25788 true))

(declare-fun b!267348 () Bool)

(declare-fun res!131645 () Bool)

(assert (=> b!267348 (=> (not res!131645) (not e!172819))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267348 (= res!131645 (and (= (size!6490 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6490 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6490 a!3325))))))

(declare-fun b!267349 () Bool)

(declare-fun res!131646 () Bool)

(assert (=> b!267349 (=> (not res!131646) (not e!172819))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267349 (= res!131646 (validKeyInArray!0 k0!2581))))

(declare-fun b!267350 () Bool)

(assert (=> b!267350 (= e!172819 (bvsgt #b00000000000000000000000000000000 (size!6490 a!3325)))))

(assert (= (and start!25788 res!131644) b!267348))

(assert (= (and b!267348 res!131645) b!267349))

(assert (= (and b!267349 res!131646) b!267350))

(declare-fun m!283749 () Bool)

(assert (=> start!25788 m!283749))

(declare-fun m!283751 () Bool)

(assert (=> start!25788 m!283751))

(declare-fun m!283753 () Bool)

(assert (=> b!267349 m!283753))

(check-sat (not b!267349) (not start!25788))
(check-sat)
