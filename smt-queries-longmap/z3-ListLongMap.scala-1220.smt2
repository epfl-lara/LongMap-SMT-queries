; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25790 () Bool)

(assert start!25790)

(declare-fun res!131658 () Bool)

(declare-fun e!172837 () Bool)

(assert (=> start!25790 (=> (not res!131658) (not e!172837))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25790 (= res!131658 (validMask!0 mask!3868))))

(assert (=> start!25790 e!172837))

(declare-datatypes ((array!12964 0))(
  ( (array!12965 (arr!6136 (Array (_ BitVec 32) (_ BitVec 64))) (size!6488 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12964)

(declare-fun array_inv!4086 (array!12964) Bool)

(assert (=> start!25790 (array_inv!4086 a!3325)))

(assert (=> start!25790 true))

(declare-fun b!267386 () Bool)

(declare-fun res!131657 () Bool)

(assert (=> b!267386 (=> (not res!131657) (not e!172837))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267386 (= res!131657 (and (= (size!6488 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6488 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6488 a!3325))))))

(declare-fun b!267387 () Bool)

(declare-fun res!131656 () Bool)

(assert (=> b!267387 (=> (not res!131656) (not e!172837))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267387 (= res!131656 (validKeyInArray!0 k0!2581))))

(declare-fun b!267388 () Bool)

(assert (=> b!267388 (= e!172837 (bvsgt #b00000000000000000000000000000000 (size!6488 a!3325)))))

(assert (= (and start!25790 res!131658) b!267386))

(assert (= (and b!267386 res!131657) b!267387))

(assert (= (and b!267387 res!131656) b!267388))

(declare-fun m!283949 () Bool)

(assert (=> start!25790 m!283949))

(declare-fun m!283951 () Bool)

(assert (=> start!25790 m!283951))

(declare-fun m!283953 () Bool)

(assert (=> b!267387 m!283953))

(check-sat (not b!267387) (not start!25790))
(check-sat)
