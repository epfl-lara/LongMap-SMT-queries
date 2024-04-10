; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25786 () Bool)

(assert start!25786)

(declare-fun res!131637 () Bool)

(declare-fun e!172814 () Bool)

(assert (=> start!25786 (=> (not res!131637) (not e!172814))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25786 (= res!131637 (validMask!0 mask!3868))))

(assert (=> start!25786 e!172814))

(declare-datatypes ((array!12965 0))(
  ( (array!12966 (arr!6137 (Array (_ BitVec 32) (_ BitVec 64))) (size!6489 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12965)

(declare-fun array_inv!4100 (array!12965) Bool)

(assert (=> start!25786 (array_inv!4100 a!3325)))

(assert (=> start!25786 true))

(declare-fun b!267339 () Bool)

(declare-fun res!131636 () Bool)

(assert (=> b!267339 (=> (not res!131636) (not e!172814))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!267339 (= res!131636 (and (= (size!6489 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6489 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6489 a!3325))))))

(declare-fun b!267340 () Bool)

(declare-fun res!131635 () Bool)

(assert (=> b!267340 (=> (not res!131635) (not e!172814))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267340 (= res!131635 (validKeyInArray!0 k!2581))))

(declare-fun b!267341 () Bool)

(assert (=> b!267341 (= e!172814 (bvsgt #b00000000000000000000000000000000 (size!6489 a!3325)))))

(assert (= (and start!25786 res!131637) b!267339))

(assert (= (and b!267339 res!131636) b!267340))

(assert (= (and b!267340 res!131635) b!267341))

(declare-fun m!283743 () Bool)

(assert (=> start!25786 m!283743))

(declare-fun m!283745 () Bool)

(assert (=> start!25786 m!283745))

(declare-fun m!283747 () Bool)

(assert (=> b!267340 m!283747))

(push 1)

(assert (not b!267340))

(assert (not start!25786))

(check-sat)

(pop 1)

