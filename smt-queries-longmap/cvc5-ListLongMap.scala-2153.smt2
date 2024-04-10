; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36210 () Bool)

(assert start!36210)

(declare-fun res!202233 () Bool)

(declare-fun e!222269 () Bool)

(assert (=> start!36210 (=> (not res!202233) (not e!222269))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20526 0))(
  ( (array!20527 (arr!9745 (Array (_ BitVec 32) (_ BitVec 64))) (size!10097 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20526)

(assert (=> start!36210 (= res!202233 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10097 a!4337))))))

(assert (=> start!36210 e!222269))

(assert (=> start!36210 true))

(declare-fun array_inv!7187 (array!20526) Bool)

(assert (=> start!36210 (array_inv!7187 a!4337)))

(declare-fun b!362943 () Bool)

(declare-fun res!202234 () Bool)

(assert (=> b!362943 (=> (not res!202234) (not e!222269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362943 (= res!202234 (not (validKeyInArray!0 (select (arr!9745 a!4337) i!1478))))))

(declare-fun b!362944 () Bool)

(declare-fun res!202232 () Bool)

(assert (=> b!362944 (=> (not res!202232) (not e!222269))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362944 (= res!202232 (validKeyInArray!0 k!2980))))

(declare-fun b!362945 () Bool)

(assert (=> b!362945 (= e!222269 (and (bvslt (size!10097 a!4337) #b01111111111111111111111111111111) (bvsgt i!1478 (size!10097 a!4337))))))

(assert (= (and start!36210 res!202233) b!362943))

(assert (= (and b!362943 res!202234) b!362944))

(assert (= (and b!362944 res!202232) b!362945))

(declare-fun m!359813 () Bool)

(assert (=> start!36210 m!359813))

(declare-fun m!359815 () Bool)

(assert (=> b!362943 m!359815))

(assert (=> b!362943 m!359815))

(declare-fun m!359817 () Bool)

(assert (=> b!362943 m!359817))

(declare-fun m!359819 () Bool)

(assert (=> b!362944 m!359819))

(push 1)

(assert (not start!36210))

(assert (not b!362943))

(assert (not b!362944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

