; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25790 () Bool)

(assert start!25790)

(declare-fun res!131654 () Bool)

(declare-fun e!172826 () Bool)

(assert (=> start!25790 (=> (not res!131654) (not e!172826))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25790 (= res!131654 (validMask!0 mask!3868))))

(assert (=> start!25790 e!172826))

(declare-datatypes ((array!12969 0))(
  ( (array!12970 (arr!6139 (Array (_ BitVec 32) (_ BitVec 64))) (size!6491 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12969)

(declare-fun array_inv!4102 (array!12969) Bool)

(assert (=> start!25790 (array_inv!4102 a!3325)))

(assert (=> start!25790 true))

(declare-fun b!267357 () Bool)

(declare-fun res!131653 () Bool)

(assert (=> b!267357 (=> (not res!131653) (not e!172826))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267357 (= res!131653 (and (= (size!6491 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6491 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6491 a!3325))))))

(declare-fun b!267358 () Bool)

(declare-fun res!131655 () Bool)

(assert (=> b!267358 (=> (not res!131655) (not e!172826))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267358 (= res!131655 (validKeyInArray!0 k!2581))))

(declare-fun b!267359 () Bool)

(assert (=> b!267359 (= e!172826 (bvsgt #b00000000000000000000000000000000 (size!6491 a!3325)))))

(assert (= (and start!25790 res!131654) b!267357))

(assert (= (and b!267357 res!131653) b!267358))

(assert (= (and b!267358 res!131655) b!267359))

(declare-fun m!283755 () Bool)

(assert (=> start!25790 m!283755))

(declare-fun m!283757 () Bool)

(assert (=> start!25790 m!283757))

(declare-fun m!283759 () Bool)

(assert (=> b!267358 m!283759))

(push 1)

(assert (not b!267358))

(assert (not start!25790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

