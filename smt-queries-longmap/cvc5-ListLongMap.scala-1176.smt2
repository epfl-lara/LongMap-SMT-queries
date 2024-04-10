; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25382 () Bool)

(assert start!25382)

(declare-fun res!129119 () Bool)

(declare-fun e!171430 () Bool)

(assert (=> start!25382 (=> (not res!129119) (not e!171430))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25382 (= res!129119 (validMask!0 mask!4002))))

(assert (=> start!25382 e!171430))

(assert (=> start!25382 true))

(declare-datatypes ((array!12691 0))(
  ( (array!12692 (arr!6005 (Array (_ BitVec 32) (_ BitVec 64))) (size!6357 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12691)

(declare-fun array_inv!3968 (array!12691) Bool)

(assert (=> start!25382 (array_inv!3968 a!3436)))

(declare-fun b!264606 () Bool)

(declare-fun res!129118 () Bool)

(assert (=> b!264606 (=> (not res!129118) (not e!171430))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264606 (= res!129118 (and (= (size!6357 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6357 a!3436))))))

(declare-fun b!264607 () Bool)

(declare-fun res!129120 () Bool)

(assert (=> b!264607 (=> (not res!129120) (not e!171430))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264607 (= res!129120 (validKeyInArray!0 k!2698))))

(declare-fun b!264608 () Bool)

(assert (=> b!264608 (= e!171430 (and (bvslt #b00000000000000000000000000000000 (size!6357 a!3436)) (bvsge (size!6357 a!3436) #b01111111111111111111111111111111)))))

(assert (= (and start!25382 res!129119) b!264606))

(assert (= (and b!264606 res!129118) b!264607))

(assert (= (and b!264607 res!129120) b!264608))

(declare-fun m!281643 () Bool)

(assert (=> start!25382 m!281643))

(declare-fun m!281645 () Bool)

(assert (=> start!25382 m!281645))

(declare-fun m!281647 () Bool)

(assert (=> b!264607 m!281647))

(push 1)

(assert (not b!264607))

(assert (not start!25382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

