; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25882 () Bool)

(assert start!25882)

(declare-fun res!131859 () Bool)

(declare-fun e!172967 () Bool)

(assert (=> start!25882 (=> (not res!131859) (not e!172967))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25882 (= res!131859 (validMask!0 mask!3868))))

(assert (=> start!25882 e!172967))

(declare-datatypes ((array!13000 0))(
  ( (array!13001 (arr!6151 (Array (_ BitVec 32) (_ BitVec 64))) (size!6503 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13000)

(declare-fun array_inv!4114 (array!13000) Bool)

(assert (=> start!25882 (array_inv!4114 a!3325)))

(assert (=> start!25882 true))

(declare-fun b!267561 () Bool)

(declare-fun res!131857 () Bool)

(assert (=> b!267561 (=> (not res!131857) (not e!172967))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267561 (= res!131857 (and (= (size!6503 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6503 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6503 a!3325))))))

(declare-fun b!267562 () Bool)

(declare-fun res!131858 () Bool)

(assert (=> b!267562 (=> (not res!131858) (not e!172967))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267562 (= res!131858 (validKeyInArray!0 k!2581))))

(declare-fun b!267563 () Bool)

(assert (=> b!267563 (= e!172967 false)))

(declare-fun lt!134710 () Bool)

(declare-datatypes ((List!3959 0))(
  ( (Nil!3956) (Cons!3955 (h!4622 (_ BitVec 64)) (t!9041 List!3959)) )
))
(declare-fun arrayNoDuplicates!0 (array!13000 (_ BitVec 32) List!3959) Bool)

(assert (=> b!267563 (= lt!134710 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3956))))

(assert (= (and start!25882 res!131859) b!267561))

(assert (= (and b!267561 res!131857) b!267562))

(assert (= (and b!267562 res!131858) b!267563))

(declare-fun m!283909 () Bool)

(assert (=> start!25882 m!283909))

(declare-fun m!283911 () Bool)

(assert (=> start!25882 m!283911))

(declare-fun m!283913 () Bool)

(assert (=> b!267562 m!283913))

(declare-fun m!283915 () Bool)

(assert (=> b!267563 m!283915))

(push 1)

(assert (not b!267563))

(assert (not b!267562))

(assert (not start!25882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

