; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71746 () Bool)

(assert start!71746)

(declare-fun res!567066 () Bool)

(declare-fun e!465321 () Bool)

(assert (=> start!71746 (=> (not res!567066) (not e!465321))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46656 0))(
  ( (array!46657 (arr!22362 (Array (_ BitVec 32) (_ BitVec 64))) (size!22783 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46656)

(assert (=> start!71746 (= res!567066 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22783 a!4227))))))

(assert (=> start!71746 e!465321))

(assert (=> start!71746 true))

(declare-fun array_inv!17809 (array!46656) Bool)

(assert (=> start!71746 (array_inv!17809 a!4227)))

(declare-fun b!834033 () Bool)

(declare-fun res!567068 () Bool)

(assert (=> b!834033 (=> (not res!567068) (not e!465321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834033 (= res!567068 (not (validKeyInArray!0 (select (arr!22362 a!4227) i!1466))))))

(declare-fun b!834034 () Bool)

(declare-fun res!567067 () Bool)

(assert (=> b!834034 (=> (not res!567067) (not e!465321))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834034 (= res!567067 (validKeyInArray!0 k!2968))))

(declare-fun b!834035 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834035 (= e!465321 (and (bvslt (size!22783 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22783 a!4227)) (bvsgt to!390 i!1466) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!71746 res!567066) b!834033))

(assert (= (and b!834033 res!567068) b!834034))

(assert (= (and b!834034 res!567067) b!834035))

(declare-fun m!778963 () Bool)

(assert (=> start!71746 m!778963))

(declare-fun m!778965 () Bool)

(assert (=> b!834033 m!778965))

(assert (=> b!834033 m!778965))

(declare-fun m!778967 () Bool)

(assert (=> b!834033 m!778967))

(declare-fun m!778969 () Bool)

(assert (=> b!834034 m!778969))

(push 1)

(assert (not b!834034))

(assert (not b!834033))

(assert (not start!71746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

