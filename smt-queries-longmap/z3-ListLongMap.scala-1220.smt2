; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25790 () Bool)

(assert start!25790)

(declare-fun res!131541 () Bool)

(declare-fun e!172712 () Bool)

(assert (=> start!25790 (=> (not res!131541) (not e!172712))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25790 (= res!131541 (validMask!0 mask!3868))))

(assert (=> start!25790 e!172712))

(declare-datatypes ((array!12957 0))(
  ( (array!12958 (arr!6132 (Array (_ BitVec 32) (_ BitVec 64))) (size!6485 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12957)

(declare-fun array_inv!4104 (array!12957) Bool)

(assert (=> start!25790 (array_inv!4104 a!3325)))

(assert (=> start!25790 true))

(declare-fun b!267192 () Bool)

(declare-fun res!131540 () Bool)

(assert (=> b!267192 (=> (not res!131540) (not e!172712))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267192 (= res!131540 (and (= (size!6485 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6485 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6485 a!3325))))))

(declare-fun b!267193 () Bool)

(declare-fun res!131542 () Bool)

(assert (=> b!267193 (=> (not res!131542) (not e!172712))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267193 (= res!131542 (validKeyInArray!0 k0!2581))))

(declare-fun b!267194 () Bool)

(assert (=> b!267194 (= e!172712 (bvsgt #b00000000000000000000000000000000 (size!6485 a!3325)))))

(assert (= (and start!25790 res!131541) b!267192))

(assert (= (and b!267192 res!131540) b!267193))

(assert (= (and b!267193 res!131542) b!267194))

(declare-fun m!283151 () Bool)

(assert (=> start!25790 m!283151))

(declare-fun m!283153 () Bool)

(assert (=> start!25790 m!283153))

(declare-fun m!283155 () Bool)

(assert (=> b!267193 m!283155))

(check-sat (not start!25790) (not b!267193))
(check-sat)
