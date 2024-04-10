; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71756 () Bool)

(assert start!71756)

(declare-fun res!567113 () Bool)

(declare-fun e!465351 () Bool)

(assert (=> start!71756 (=> (not res!567113) (not e!465351))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46666 0))(
  ( (array!46667 (arr!22367 (Array (_ BitVec 32) (_ BitVec 64))) (size!22788 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46666)

(assert (=> start!71756 (= res!567113 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22788 a!4227))))))

(assert (=> start!71756 e!465351))

(assert (=> start!71756 true))

(declare-fun array_inv!17814 (array!46666) Bool)

(assert (=> start!71756 (array_inv!17814 a!4227)))

(declare-fun b!834078 () Bool)

(declare-fun res!567112 () Bool)

(assert (=> b!834078 (=> (not res!567112) (not e!465351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834078 (= res!567112 (not (validKeyInArray!0 (select (arr!22367 a!4227) i!1466))))))

(declare-fun b!834079 () Bool)

(declare-fun res!567111 () Bool)

(assert (=> b!834079 (=> (not res!567111) (not e!465351))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834079 (= res!567111 (validKeyInArray!0 k!2968))))

(declare-fun b!834080 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834080 (= e!465351 (and (bvslt (size!22788 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22788 a!4227)) (bvsgt to!390 i!1466) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!71756 res!567113) b!834078))

(assert (= (and b!834078 res!567112) b!834079))

(assert (= (and b!834079 res!567111) b!834080))

(declare-fun m!779003 () Bool)

(assert (=> start!71756 m!779003))

(declare-fun m!779005 () Bool)

(assert (=> b!834078 m!779005))

(assert (=> b!834078 m!779005))

(declare-fun m!779007 () Bool)

(assert (=> b!834078 m!779007))

(declare-fun m!779009 () Bool)

(assert (=> b!834079 m!779009))

(push 1)

(assert (not start!71756))

(assert (not b!834078))

(assert (not b!834079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

