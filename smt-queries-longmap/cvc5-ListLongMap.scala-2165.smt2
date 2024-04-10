; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36324 () Bool)

(assert start!36324)

(declare-fun res!202693 () Bool)

(declare-fun e!222585 () Bool)

(assert (=> start!36324 (=> (not res!202693) (not e!222585))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20604 0))(
  ( (array!20605 (arr!9781 (Array (_ BitVec 32) (_ BitVec 64))) (size!10133 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20604)

(assert (=> start!36324 (= res!202693 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10133 a!4289))))))

(assert (=> start!36324 e!222585))

(assert (=> start!36324 true))

(declare-fun array_inv!7223 (array!20604) Bool)

(assert (=> start!36324 (array_inv!7223 a!4289)))

(declare-fun b!363530 () Bool)

(declare-fun res!202691 () Bool)

(assert (=> b!363530 (=> (not res!202691) (not e!222585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363530 (= res!202691 (not (validKeyInArray!0 (select (arr!9781 a!4289) i!1472))))))

(declare-fun b!363531 () Bool)

(declare-fun res!202692 () Bool)

(assert (=> b!363531 (=> (not res!202692) (not e!222585))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363531 (= res!202692 (validKeyInArray!0 k!2974))))

(declare-fun b!363532 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363532 (= e!222585 (and (bvslt (size!10133 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10133 a!4289)) (bvsge i!1472 from!3650) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36324 res!202693) b!363530))

(assert (= (and b!363530 res!202691) b!363531))

(assert (= (and b!363531 res!202692) b!363532))

(declare-fun m!360659 () Bool)

(assert (=> start!36324 m!360659))

(declare-fun m!360661 () Bool)

(assert (=> b!363530 m!360661))

(assert (=> b!363530 m!360661))

(declare-fun m!360663 () Bool)

(assert (=> b!363530 m!360663))

(declare-fun m!360665 () Bool)

(assert (=> b!363531 m!360665))

(push 1)

(assert (not b!363530))

(assert (not b!363531))

(assert (not start!36324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

