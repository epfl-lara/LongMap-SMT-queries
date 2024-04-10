; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25380 () Bool)

(assert start!25380)

(declare-fun res!129109 () Bool)

(declare-fun e!171424 () Bool)

(assert (=> start!25380 (=> (not res!129109) (not e!171424))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25380 (= res!129109 (validMask!0 mask!4002))))

(assert (=> start!25380 e!171424))

(assert (=> start!25380 true))

(declare-datatypes ((array!12689 0))(
  ( (array!12690 (arr!6004 (Array (_ BitVec 32) (_ BitVec 64))) (size!6356 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12689)

(declare-fun array_inv!3967 (array!12689) Bool)

(assert (=> start!25380 (array_inv!3967 a!3436)))

(declare-fun b!264597 () Bool)

(declare-fun res!129110 () Bool)

(assert (=> b!264597 (=> (not res!129110) (not e!171424))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264597 (= res!129110 (and (= (size!6356 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6356 a!3436))))))

(declare-fun b!264598 () Bool)

(declare-fun res!129111 () Bool)

(assert (=> b!264598 (=> (not res!129111) (not e!171424))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264598 (= res!129111 (validKeyInArray!0 k!2698))))

(declare-fun b!264599 () Bool)

(assert (=> b!264599 (= e!171424 (bvsge #b00000000000000000000000000000000 (size!6356 a!3436)))))

(assert (= (and start!25380 res!129109) b!264597))

(assert (= (and b!264597 res!129110) b!264598))

(assert (= (and b!264598 res!129111) b!264599))

(declare-fun m!281637 () Bool)

(assert (=> start!25380 m!281637))

(declare-fun m!281639 () Bool)

(assert (=> start!25380 m!281639))

(declare-fun m!281641 () Bool)

(assert (=> b!264598 m!281641))

(push 1)

(assert (not start!25380))

(assert (not b!264598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

