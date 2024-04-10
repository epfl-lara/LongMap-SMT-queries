; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36334 () Bool)

(assert start!36334)

(declare-fun res!202736 () Bool)

(declare-fun e!222616 () Bool)

(assert (=> start!36334 (=> (not res!202736) (not e!222616))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20614 0))(
  ( (array!20615 (arr!9786 (Array (_ BitVec 32) (_ BitVec 64))) (size!10138 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20614)

(assert (=> start!36334 (= res!202736 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10138 a!4289))))))

(assert (=> start!36334 e!222616))

(assert (=> start!36334 true))

(declare-fun array_inv!7228 (array!20614) Bool)

(assert (=> start!36334 (array_inv!7228 a!4289)))

(declare-fun b!363575 () Bool)

(declare-fun res!202738 () Bool)

(assert (=> b!363575 (=> (not res!202738) (not e!222616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363575 (= res!202738 (not (validKeyInArray!0 (select (arr!9786 a!4289) i!1472))))))

(declare-fun b!363576 () Bool)

(declare-fun res!202737 () Bool)

(assert (=> b!363576 (=> (not res!202737) (not e!222616))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363576 (= res!202737 (validKeyInArray!0 k!2974))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun b!363577 () Bool)

(assert (=> b!363577 (= e!222616 (and (bvslt (size!10138 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10138 a!4289)) (bvsge i!1472 from!3650) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36334 res!202736) b!363575))

(assert (= (and b!363575 res!202738) b!363576))

(assert (= (and b!363576 res!202737) b!363577))

(declare-fun m!360699 () Bool)

(assert (=> start!36334 m!360699))

(declare-fun m!360701 () Bool)

(assert (=> b!363575 m!360701))

(assert (=> b!363575 m!360701))

(declare-fun m!360703 () Bool)

(assert (=> b!363575 m!360703))

(declare-fun m!360705 () Bool)

(assert (=> b!363576 m!360705))

(push 1)

(assert (not start!36334))

(assert (not b!363575))

(assert (not b!363576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

