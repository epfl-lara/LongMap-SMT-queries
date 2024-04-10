; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25884 () Bool)

(assert start!25884)

(declare-fun res!131870 () Bool)

(declare-fun e!172972 () Bool)

(assert (=> start!25884 (=> (not res!131870) (not e!172972))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25884 (= res!131870 (validMask!0 mask!3868))))

(assert (=> start!25884 e!172972))

(declare-datatypes ((array!13002 0))(
  ( (array!13003 (arr!6152 (Array (_ BitVec 32) (_ BitVec 64))) (size!6504 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13002)

(declare-fun array_inv!4115 (array!13002) Bool)

(assert (=> start!25884 (array_inv!4115 a!3325)))

(assert (=> start!25884 true))

(declare-fun b!267572 () Bool)

(declare-fun res!131868 () Bool)

(assert (=> b!267572 (=> (not res!131868) (not e!172972))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267572 (= res!131868 (and (= (size!6504 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6504 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6504 a!3325))))))

(declare-fun b!267574 () Bool)

(declare-fun res!131871 () Bool)

(assert (=> b!267574 (=> (not res!131871) (not e!172972))))

(declare-datatypes ((List!3960 0))(
  ( (Nil!3957) (Cons!3956 (h!4623 (_ BitVec 64)) (t!9042 List!3960)) )
))
(declare-fun arrayNoDuplicates!0 (array!13002 (_ BitVec 32) List!3960) Bool)

(assert (=> b!267574 (= res!131871 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3957))))

(declare-fun b!267575 () Bool)

(assert (=> b!267575 (= e!172972 (bvsge #b00000000000000000000000000000000 (size!6504 a!3325)))))

(declare-fun b!267573 () Bool)

(declare-fun res!131869 () Bool)

(assert (=> b!267573 (=> (not res!131869) (not e!172972))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267573 (= res!131869 (validKeyInArray!0 k!2581))))

(assert (= (and start!25884 res!131870) b!267572))

(assert (= (and b!267572 res!131868) b!267573))

(assert (= (and b!267573 res!131869) b!267574))

(assert (= (and b!267574 res!131871) b!267575))

(declare-fun m!283917 () Bool)

(assert (=> start!25884 m!283917))

(declare-fun m!283919 () Bool)

(assert (=> start!25884 m!283919))

(declare-fun m!283921 () Bool)

(assert (=> b!267574 m!283921))

(declare-fun m!283923 () Bool)

(assert (=> b!267573 m!283923))

(push 1)

(assert (not b!267574))

(assert (not b!267573))

(assert (not start!25884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

