; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25792 () Bool)

(assert start!25792)

(declare-fun res!131663 () Bool)

(declare-fun e!172832 () Bool)

(assert (=> start!25792 (=> (not res!131663) (not e!172832))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25792 (= res!131663 (validMask!0 mask!3868))))

(assert (=> start!25792 e!172832))

(declare-datatypes ((array!12971 0))(
  ( (array!12972 (arr!6140 (Array (_ BitVec 32) (_ BitVec 64))) (size!6492 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12971)

(declare-fun array_inv!4103 (array!12971) Bool)

(assert (=> start!25792 (array_inv!4103 a!3325)))

(assert (=> start!25792 true))

(declare-fun b!267366 () Bool)

(declare-fun res!131664 () Bool)

(assert (=> b!267366 (=> (not res!131664) (not e!172832))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267366 (= res!131664 (and (= (size!6492 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6492 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6492 a!3325))))))

(declare-fun b!267367 () Bool)

(declare-fun res!131662 () Bool)

(assert (=> b!267367 (=> (not res!131662) (not e!172832))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267367 (= res!131662 (validKeyInArray!0 k!2581))))

(declare-fun b!267368 () Bool)

(assert (=> b!267368 (= e!172832 (and (bvsle #b00000000000000000000000000000000 (size!6492 a!3325)) (bvsge (size!6492 a!3325) #b01111111111111111111111111111111)))))

(assert (= (and start!25792 res!131663) b!267366))

(assert (= (and b!267366 res!131664) b!267367))

(assert (= (and b!267367 res!131662) b!267368))

(declare-fun m!283761 () Bool)

(assert (=> start!25792 m!283761))

(declare-fun m!283763 () Bool)

(assert (=> start!25792 m!283763))

(declare-fun m!283765 () Bool)

(assert (=> b!267367 m!283765))

(push 1)

(assert (not b!267367))

(assert (not start!25792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

