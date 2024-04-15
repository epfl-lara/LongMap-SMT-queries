; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25944 () Bool)

(assert start!25944)

(declare-fun res!131989 () Bool)

(declare-fun e!173009 () Bool)

(assert (=> start!25944 (=> (not res!131989) (not e!173009))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25944 (= res!131989 (validMask!0 mask!3868))))

(assert (=> start!25944 e!173009))

(declare-datatypes ((array!13030 0))(
  ( (array!13031 (arr!6164 (Array (_ BitVec 32) (_ BitVec 64))) (size!6517 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13030)

(declare-fun array_inv!4136 (array!13030) Bool)

(assert (=> start!25944 (array_inv!4136 a!3325)))

(assert (=> start!25944 true))

(declare-fun b!267657 () Bool)

(declare-fun res!131987 () Bool)

(assert (=> b!267657 (=> (not res!131987) (not e!173009))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267657 (= res!131987 (and (= (size!6517 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6517 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6517 a!3325))))))

(declare-fun b!267658 () Bool)

(declare-fun res!131988 () Bool)

(assert (=> b!267658 (=> (not res!131988) (not e!173009))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267658 (= res!131988 (validKeyInArray!0 k!2581))))

(declare-fun b!267659 () Bool)

(assert (=> b!267659 (= e!173009 false)))

(declare-fun lt!134556 () Bool)

(declare-datatypes ((List!3945 0))(
  ( (Nil!3942) (Cons!3941 (h!4608 (_ BitVec 64)) (t!9018 List!3945)) )
))
(declare-fun arrayNoDuplicates!0 (array!13030 (_ BitVec 32) List!3945) Bool)

(assert (=> b!267659 (= lt!134556 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3942))))

(assert (= (and start!25944 res!131989) b!267657))

(assert (= (and b!267657 res!131987) b!267658))

(assert (= (and b!267658 res!131988) b!267659))

(declare-fun m!283491 () Bool)

(assert (=> start!25944 m!283491))

(declare-fun m!283493 () Bool)

(assert (=> start!25944 m!283493))

(declare-fun m!283495 () Bool)

(assert (=> b!267658 m!283495))

(declare-fun m!283497 () Bool)

(assert (=> b!267659 m!283497))

(push 1)

(assert (not b!267659))

(assert (not b!267658))

(assert (not start!25944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

