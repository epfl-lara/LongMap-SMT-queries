; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25402 () Bool)

(assert start!25402)

(declare-fun b!264637 () Bool)

(declare-fun res!129149 () Bool)

(declare-fun e!171449 () Bool)

(assert (=> b!264637 (=> (not res!129149) (not e!171449))))

(declare-datatypes ((array!12698 0))(
  ( (array!12699 (arr!6008 (Array (_ BitVec 32) (_ BitVec 64))) (size!6360 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12698)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264637 (= res!129149 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264636 () Bool)

(declare-fun res!129150 () Bool)

(assert (=> b!264636 (=> (not res!129150) (not e!171449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264636 (= res!129150 (validKeyInArray!0 k!2698))))

(declare-fun b!264635 () Bool)

(declare-fun res!129147 () Bool)

(assert (=> b!264635 (=> (not res!129147) (not e!171449))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264635 (= res!129147 (and (= (size!6360 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6360 a!3436))))))

(declare-fun res!129148 () Bool)

(assert (=> start!25402 (=> (not res!129148) (not e!171449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25402 (= res!129148 (validMask!0 mask!4002))))

(assert (=> start!25402 e!171449))

(assert (=> start!25402 true))

(declare-fun array_inv!3971 (array!12698) Bool)

(assert (=> start!25402 (array_inv!3971 a!3436)))

(declare-fun b!264638 () Bool)

(assert (=> b!264638 (= e!171449 (bvslt mask!4002 #b00000000000000000000000000000000))))

(assert (= (and start!25402 res!129148) b!264635))

(assert (= (and b!264635 res!129147) b!264636))

(assert (= (and b!264636 res!129150) b!264637))

(assert (= (and b!264637 res!129149) b!264638))

(declare-fun m!281661 () Bool)

(assert (=> b!264637 m!281661))

(declare-fun m!281663 () Bool)

(assert (=> b!264636 m!281663))

(declare-fun m!281665 () Bool)

(assert (=> start!25402 m!281665))

(declare-fun m!281667 () Bool)

(assert (=> start!25402 m!281667))

(push 1)

(assert (not start!25402))

(assert (not b!264636))

(assert (not b!264637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

