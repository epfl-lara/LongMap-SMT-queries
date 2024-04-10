; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25878 () Bool)

(assert start!25878)

(declare-fun res!131840 () Bool)

(declare-fun e!172954 () Bool)

(assert (=> start!25878 (=> (not res!131840) (not e!172954))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25878 (= res!131840 (validMask!0 mask!3868))))

(assert (=> start!25878 e!172954))

(declare-datatypes ((array!12996 0))(
  ( (array!12997 (arr!6149 (Array (_ BitVec 32) (_ BitVec 64))) (size!6501 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12996)

(declare-fun array_inv!4112 (array!12996) Bool)

(assert (=> start!25878 (array_inv!4112 a!3325)))

(assert (=> start!25878 true))

(declare-fun b!267543 () Bool)

(declare-fun res!131839 () Bool)

(assert (=> b!267543 (=> (not res!131839) (not e!172954))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267543 (= res!131839 (and (= (size!6501 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6501 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6501 a!3325))))))

(declare-fun b!267544 () Bool)

(declare-fun res!131841 () Bool)

(assert (=> b!267544 (=> (not res!131841) (not e!172954))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267544 (= res!131841 (validKeyInArray!0 k!2581))))

(declare-fun b!267545 () Bool)

(assert (=> b!267545 (= e!172954 false)))

(declare-fun lt!134704 () Bool)

(declare-datatypes ((List!3957 0))(
  ( (Nil!3954) (Cons!3953 (h!4620 (_ BitVec 64)) (t!9039 List!3957)) )
))
(declare-fun arrayNoDuplicates!0 (array!12996 (_ BitVec 32) List!3957) Bool)

(assert (=> b!267545 (= lt!134704 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3954))))

(assert (= (and start!25878 res!131840) b!267543))

(assert (= (and b!267543 res!131839) b!267544))

(assert (= (and b!267544 res!131841) b!267545))

(declare-fun m!283893 () Bool)

(assert (=> start!25878 m!283893))

(declare-fun m!283895 () Bool)

(assert (=> start!25878 m!283895))

(declare-fun m!283897 () Bool)

(assert (=> b!267544 m!283897))

(declare-fun m!283899 () Bool)

(assert (=> b!267545 m!283899))

(push 1)

(assert (not start!25878))

(assert (not b!267545))

(assert (not b!267544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

