; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25376 () Bool)

(assert start!25376)

(declare-fun res!129092 () Bool)

(declare-fun e!171413 () Bool)

(assert (=> start!25376 (=> (not res!129092) (not e!171413))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25376 (= res!129092 (validMask!0 mask!4002))))

(assert (=> start!25376 e!171413))

(assert (=> start!25376 true))

(declare-datatypes ((array!12685 0))(
  ( (array!12686 (arr!6002 (Array (_ BitVec 32) (_ BitVec 64))) (size!6354 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12685)

(declare-fun array_inv!3965 (array!12685) Bool)

(assert (=> start!25376 (array_inv!3965 a!3436)))

(declare-fun b!264579 () Bool)

(declare-fun res!129093 () Bool)

(assert (=> b!264579 (=> (not res!129093) (not e!171413))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264579 (= res!129093 (and (= (size!6354 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6354 a!3436))))))

(declare-fun b!264580 () Bool)

(declare-fun res!129091 () Bool)

(assert (=> b!264580 (=> (not res!129091) (not e!171413))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264580 (= res!129091 (validKeyInArray!0 k!2698))))

(declare-fun b!264581 () Bool)

(assert (=> b!264581 (= e!171413 (bvsge #b00000000000000000000000000000000 (size!6354 a!3436)))))

(assert (= (and start!25376 res!129092) b!264579))

(assert (= (and b!264579 res!129093) b!264580))

(assert (= (and b!264580 res!129091) b!264581))

(declare-fun m!281625 () Bool)

(assert (=> start!25376 m!281625))

(declare-fun m!281627 () Bool)

(assert (=> start!25376 m!281627))

(declare-fun m!281629 () Bool)

(assert (=> b!264580 m!281629))

(push 1)

(assert (not start!25376))

(assert (not b!264580))

(check-sat)

