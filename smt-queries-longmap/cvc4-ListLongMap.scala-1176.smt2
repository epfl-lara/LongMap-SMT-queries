; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25386 () Bool)

(assert start!25386)

(declare-fun res!129136 () Bool)

(declare-fun e!171443 () Bool)

(assert (=> start!25386 (=> (not res!129136) (not e!171443))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25386 (= res!129136 (validMask!0 mask!4002))))

(assert (=> start!25386 e!171443))

(assert (=> start!25386 true))

(declare-datatypes ((array!12695 0))(
  ( (array!12696 (arr!6007 (Array (_ BitVec 32) (_ BitVec 64))) (size!6359 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12695)

(declare-fun array_inv!3970 (array!12695) Bool)

(assert (=> start!25386 (array_inv!3970 a!3436)))

(declare-fun b!264624 () Bool)

(declare-fun res!129138 () Bool)

(assert (=> b!264624 (=> (not res!129138) (not e!171443))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264624 (= res!129138 (and (= (size!6359 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6359 a!3436))))))

(declare-fun b!264625 () Bool)

(declare-fun res!129137 () Bool)

(assert (=> b!264625 (=> (not res!129137) (not e!171443))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264625 (= res!129137 (validKeyInArray!0 k!2698))))

(declare-fun b!264626 () Bool)

(assert (=> b!264626 (= e!171443 (and (bvslt #b00000000000000000000000000000000 (size!6359 a!3436)) (bvsge (size!6359 a!3436) #b01111111111111111111111111111111)))))

(assert (= (and start!25386 res!129136) b!264624))

(assert (= (and b!264624 res!129138) b!264625))

(assert (= (and b!264625 res!129137) b!264626))

(declare-fun m!281655 () Bool)

(assert (=> start!25386 m!281655))

(declare-fun m!281657 () Bool)

(assert (=> start!25386 m!281657))

(declare-fun m!281659 () Bool)

(assert (=> b!264625 m!281659))

(push 1)

(assert (not b!264625))

(assert (not start!25386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

