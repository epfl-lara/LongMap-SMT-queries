; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36326 () Bool)

(assert start!36326)

(declare-fun b!363564 () Bool)

(declare-fun e!222602 () Bool)

(assert (=> b!363564 (= e!222602 false)))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20601 0))(
  ( (array!20602 (arr!9779 (Array (_ BitVec 32) (_ BitVec 64))) (size!10131 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20601)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lt!167798 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20601 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363564 (= lt!167798 (arrayCountValidKeys!0 (array!20602 (store (arr!9779 a!4289) i!1472 k!2974) (size!10131 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167797 () (_ BitVec 32))

(assert (=> b!363564 (= lt!167797 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!363563 () Bool)

(declare-fun res!202768 () Bool)

(assert (=> b!363563 (=> (not res!202768) (not e!222602))))

(assert (=> b!363563 (= res!202768 (and (bvslt (size!10131 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10131 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363562 () Bool)

(declare-fun res!202770 () Bool)

(assert (=> b!363562 (=> (not res!202770) (not e!222602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363562 (= res!202770 (validKeyInArray!0 k!2974))))

(declare-fun b!363561 () Bool)

(declare-fun res!202771 () Bool)

(assert (=> b!363561 (=> (not res!202771) (not e!222602))))

(assert (=> b!363561 (= res!202771 (not (validKeyInArray!0 (select (arr!9779 a!4289) i!1472))))))

(declare-fun res!202769 () Bool)

(assert (=> start!36326 (=> (not res!202769) (not e!222602))))

(assert (=> start!36326 (= res!202769 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10131 a!4289))))))

(assert (=> start!36326 e!222602))

(assert (=> start!36326 true))

(declare-fun array_inv!7251 (array!20601) Bool)

(assert (=> start!36326 (array_inv!7251 a!4289)))

(assert (= (and start!36326 res!202769) b!363561))

(assert (= (and b!363561 res!202771) b!363562))

(assert (= (and b!363562 res!202770) b!363563))

(assert (= (and b!363563 res!202768) b!363564))

(declare-fun m!360965 () Bool)

(assert (=> b!363564 m!360965))

(declare-fun m!360967 () Bool)

(assert (=> b!363564 m!360967))

(declare-fun m!360969 () Bool)

(assert (=> b!363564 m!360969))

(declare-fun m!360971 () Bool)

(assert (=> b!363562 m!360971))

(declare-fun m!360973 () Bool)

(assert (=> b!363561 m!360973))

(assert (=> b!363561 m!360973))

(declare-fun m!360975 () Bool)

(assert (=> b!363561 m!360975))

(declare-fun m!360977 () Bool)

(assert (=> start!36326 m!360977))

(push 1)

(assert (not start!36326))

(assert (not b!363564))

(assert (not b!363562))

(assert (not b!363561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

