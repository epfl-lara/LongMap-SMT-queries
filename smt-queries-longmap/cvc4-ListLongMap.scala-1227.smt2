; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25922 () Bool)

(assert start!25922)

(declare-fun res!131997 () Bool)

(declare-fun e!173075 () Bool)

(assert (=> start!25922 (=> (not res!131997) (not e!173075))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25922 (= res!131997 (validMask!0 mask!3868))))

(assert (=> start!25922 e!173075))

(declare-datatypes ((array!13018 0))(
  ( (array!13019 (arr!6158 (Array (_ BitVec 32) (_ BitVec 64))) (size!6510 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13018)

(declare-fun array_inv!4108 (array!13018) Bool)

(assert (=> start!25922 (array_inv!4108 a!3325)))

(assert (=> start!25922 true))

(declare-fun b!267743 () Bool)

(declare-fun res!131995 () Bool)

(assert (=> b!267743 (=> (not res!131995) (not e!173075))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267743 (= res!131995 (and (= (size!6510 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6510 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6510 a!3325))))))

(declare-fun b!267744 () Bool)

(declare-fun res!131996 () Bool)

(assert (=> b!267744 (=> (not res!131996) (not e!173075))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267744 (= res!131996 (validKeyInArray!0 k!2581))))

(declare-fun b!267745 () Bool)

(assert (=> b!267745 (= e!173075 false)))

(declare-fun lt!134775 () Bool)

(declare-datatypes ((List!3879 0))(
  ( (Nil!3876) (Cons!3875 (h!4542 (_ BitVec 64)) (t!8953 List!3879)) )
))
(declare-fun arrayNoDuplicates!0 (array!13018 (_ BitVec 32) List!3879) Bool)

(assert (=> b!267745 (= lt!134775 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3876))))

(assert (= (and start!25922 res!131997) b!267743))

(assert (= (and b!267743 res!131995) b!267744))

(assert (= (and b!267744 res!131996) b!267745))

(declare-fun m!284203 () Bool)

(assert (=> start!25922 m!284203))

(declare-fun m!284205 () Bool)

(assert (=> start!25922 m!284205))

(declare-fun m!284207 () Bool)

(assert (=> b!267744 m!284207))

(declare-fun m!284209 () Bool)

(assert (=> b!267745 m!284209))

(push 1)

(assert (not b!267744))

(assert (not b!267745))

(assert (not start!25922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

