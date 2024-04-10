; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36328 () Bool)

(assert start!36328)

(declare-fun res!202710 () Bool)

(declare-fun e!222598 () Bool)

(assert (=> start!36328 (=> (not res!202710) (not e!222598))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20608 0))(
  ( (array!20609 (arr!9783 (Array (_ BitVec 32) (_ BitVec 64))) (size!10135 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20608)

(assert (=> start!36328 (= res!202710 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10135 a!4289))))))

(assert (=> start!36328 e!222598))

(assert (=> start!36328 true))

(declare-fun array_inv!7225 (array!20608) Bool)

(assert (=> start!36328 (array_inv!7225 a!4289)))

(declare-fun b!363548 () Bool)

(declare-fun res!202709 () Bool)

(assert (=> b!363548 (=> (not res!202709) (not e!222598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363548 (= res!202709 (not (validKeyInArray!0 (select (arr!9783 a!4289) i!1472))))))

(declare-fun b!363549 () Bool)

(declare-fun res!202711 () Bool)

(assert (=> b!363549 (=> (not res!202711) (not e!222598))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363549 (= res!202711 (validKeyInArray!0 k!2974))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun b!363550 () Bool)

(assert (=> b!363550 (= e!222598 (and (bvslt (size!10135 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10135 a!4289)) (bvsge i!1472 from!3650) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36328 res!202710) b!363548))

(assert (= (and b!363548 res!202709) b!363549))

(assert (= (and b!363549 res!202711) b!363550))

(declare-fun m!360675 () Bool)

(assert (=> start!36328 m!360675))

(declare-fun m!360677 () Bool)

(assert (=> b!363548 m!360677))

(assert (=> b!363548 m!360677))

(declare-fun m!360679 () Bool)

(assert (=> b!363548 m!360679))

(declare-fun m!360681 () Bool)

(assert (=> b!363549 m!360681))

(push 1)

(assert (not b!363549))

(assert (not start!36328))

(assert (not b!363548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

