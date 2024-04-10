; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25936 () Bool)

(assert start!25936)

(declare-fun res!132055 () Bool)

(declare-fun e!173092 () Bool)

(assert (=> start!25936 (=> (not res!132055) (not e!173092))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25936 (= res!132055 (validMask!0 mask!3868))))

(assert (=> start!25936 e!173092))

(declare-datatypes ((array!13033 0))(
  ( (array!13034 (arr!6166 (Array (_ BitVec 32) (_ BitVec 64))) (size!6518 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13033)

(declare-fun array_inv!4129 (array!13033) Bool)

(assert (=> start!25936 (array_inv!4129 a!3325)))

(assert (=> start!25936 true))

(declare-fun b!267777 () Bool)

(declare-fun res!132056 () Bool)

(assert (=> b!267777 (=> (not res!132056) (not e!173092))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!267777 (= res!132056 (and (= (size!6518 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6518 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6518 a!3325))))))

(declare-fun b!267778 () Bool)

(declare-fun res!132057 () Bool)

(assert (=> b!267778 (=> (not res!132057) (not e!173092))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267778 (= res!132057 (validKeyInArray!0 k!2581))))

(declare-fun b!267779 () Bool)

(assert (=> b!267779 (= e!173092 false)))

(declare-fun lt!134728 () Bool)

(declare-datatypes ((List!3974 0))(
  ( (Nil!3971) (Cons!3970 (h!4637 (_ BitVec 64)) (t!9056 List!3974)) )
))
(declare-fun arrayNoDuplicates!0 (array!13033 (_ BitVec 32) List!3974) Bool)

(assert (=> b!267779 (= lt!134728 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3971))))

(assert (= (and start!25936 res!132055) b!267777))

(assert (= (and b!267777 res!132056) b!267778))

(assert (= (and b!267778 res!132057) b!267779))

(declare-fun m!284059 () Bool)

(assert (=> start!25936 m!284059))

(declare-fun m!284061 () Bool)

(assert (=> start!25936 m!284061))

(declare-fun m!284063 () Bool)

(assert (=> b!267778 m!284063))

(declare-fun m!284065 () Bool)

(assert (=> b!267779 m!284065))

(push 1)

(assert (not b!267779))

(assert (not start!25936))

(assert (not b!267778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

