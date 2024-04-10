; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36330 () Bool)

(assert start!36330)

(declare-fun res!202720 () Bool)

(declare-fun e!222603 () Bool)

(assert (=> start!36330 (=> (not res!202720) (not e!222603))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20610 0))(
  ( (array!20611 (arr!9784 (Array (_ BitVec 32) (_ BitVec 64))) (size!10136 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20610)

(assert (=> start!36330 (= res!202720 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10136 a!4289))))))

(assert (=> start!36330 e!222603))

(assert (=> start!36330 true))

(declare-fun array_inv!7226 (array!20610) Bool)

(assert (=> start!36330 (array_inv!7226 a!4289)))

(declare-fun b!363557 () Bool)

(declare-fun res!202719 () Bool)

(assert (=> b!363557 (=> (not res!202719) (not e!222603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363557 (= res!202719 (not (validKeyInArray!0 (select (arr!9784 a!4289) i!1472))))))

(declare-fun b!363558 () Bool)

(declare-fun res!202718 () Bool)

(assert (=> b!363558 (=> (not res!202718) (not e!222603))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363558 (= res!202718 (validKeyInArray!0 k!2974))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun b!363559 () Bool)

(assert (=> b!363559 (= e!222603 (and (bvslt (size!10136 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10136 a!4289)) (bvsge i!1472 from!3650) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36330 res!202720) b!363557))

(assert (= (and b!363557 res!202719) b!363558))

(assert (= (and b!363558 res!202718) b!363559))

(declare-fun m!360683 () Bool)

(assert (=> start!36330 m!360683))

(declare-fun m!360685 () Bool)

(assert (=> b!363557 m!360685))

(assert (=> b!363557 m!360685))

(declare-fun m!360687 () Bool)

(assert (=> b!363557 m!360687))

(declare-fun m!360689 () Bool)

(assert (=> b!363558 m!360689))

(push 1)

(assert (not b!363558))

(assert (not b!363557))

(assert (not start!36330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

