; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36200 () Bool)

(assert start!36200)

(declare-fun res!202249 () Bool)

(declare-fun e!222249 () Bool)

(assert (=> start!36200 (=> (not res!202249) (not e!222249))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20511 0))(
  ( (array!20512 (arr!9737 (Array (_ BitVec 32) (_ BitVec 64))) (size!10089 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20511)

(assert (=> start!36200 (= res!202249 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10089 a!4337))))))

(assert (=> start!36200 e!222249))

(assert (=> start!36200 true))

(declare-fun array_inv!7209 (array!20511) Bool)

(assert (=> start!36200 (array_inv!7209 a!4337)))

(declare-fun b!362912 () Bool)

(declare-fun res!202247 () Bool)

(assert (=> b!362912 (=> (not res!202247) (not e!222249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362912 (= res!202247 (not (validKeyInArray!0 (select (arr!9737 a!4337) i!1478))))))

(declare-fun b!362913 () Bool)

(declare-fun res!202248 () Bool)

(assert (=> b!362913 (=> (not res!202248) (not e!222249))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362913 (= res!202248 (validKeyInArray!0 k!2980))))

(declare-fun b!362914 () Bool)

(assert (=> b!362914 (= e!222249 (and (bvslt (size!10089 a!4337) #b01111111111111111111111111111111) (bvsgt i!1478 (size!10089 a!4337))))))

(assert (= (and start!36200 res!202249) b!362912))

(assert (= (and b!362912 res!202247) b!362913))

(assert (= (and b!362913 res!202248) b!362914))

(declare-fun m!360059 () Bool)

(assert (=> start!36200 m!360059))

(declare-fun m!360061 () Bool)

(assert (=> b!362912 m!360061))

(assert (=> b!362912 m!360061))

(declare-fun m!360063 () Bool)

(assert (=> b!362912 m!360063))

(declare-fun m!360065 () Bool)

(assert (=> b!362913 m!360065))

(push 1)

(assert (not b!362912))

(assert (not start!36200))

(assert (not b!362913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

