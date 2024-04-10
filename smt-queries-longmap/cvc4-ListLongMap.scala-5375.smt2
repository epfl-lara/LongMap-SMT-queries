; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71852 () Bool)

(assert start!71852)

(declare-fun b!835066 () Bool)

(declare-fun res!567939 () Bool)

(declare-fun e!465900 () Bool)

(assert (=> b!835066 (=> (not res!567939) (not e!465900))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835066 (= res!567939 (validKeyInArray!0 k!2968))))

(declare-fun res!567941 () Bool)

(assert (=> start!71852 (=> (not res!567941) (not e!465900))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46762 0))(
  ( (array!46763 (arr!22415 (Array (_ BitVec 32) (_ BitVec 64))) (size!22836 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46762)

(assert (=> start!71852 (= res!567941 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22836 a!4227))))))

(assert (=> start!71852 e!465900))

(assert (=> start!71852 true))

(declare-fun array_inv!17862 (array!46762) Bool)

(assert (=> start!71852 (array_inv!17862 a!4227)))

(declare-fun b!835067 () Bool)

(declare-fun res!567938 () Bool)

(assert (=> b!835067 (=> (not res!567938) (not e!465900))))

(assert (=> b!835067 (= res!567938 (not (validKeyInArray!0 (select (arr!22415 a!4227) i!1466))))))

(declare-fun b!835068 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835068 (= e!465900 (and (= to!390 (size!22836 a!4227)) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun b!835069 () Bool)

(declare-fun res!567940 () Bool)

(assert (=> b!835069 (=> (not res!567940) (not e!465900))))

(declare-fun arrayCountValidKeys!0 (array!46762 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835069 (= res!567940 (= (arrayCountValidKeys!0 (array!46763 (store (arr!22415 a!4227) i!1466 k!2968) (size!22836 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835070 () Bool)

(declare-fun res!567937 () Bool)

(assert (=> b!835070 (=> (not res!567937) (not e!465900))))

(assert (=> b!835070 (= res!567937 (and (bvslt (size!22836 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22836 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71852 res!567941) b!835067))

(assert (= (and b!835067 res!567938) b!835066))

(assert (= (and b!835066 res!567939) b!835070))

(assert (= (and b!835070 res!567937) b!835069))

(assert (= (and b!835069 res!567940) b!835068))

(declare-fun m!780229 () Bool)

(assert (=> b!835066 m!780229))

(declare-fun m!780231 () Bool)

(assert (=> start!71852 m!780231))

(declare-fun m!780233 () Bool)

(assert (=> b!835067 m!780233))

(assert (=> b!835067 m!780233))

(declare-fun m!780235 () Bool)

(assert (=> b!835067 m!780235))

(declare-fun m!780237 () Bool)

(assert (=> b!835069 m!780237))

(declare-fun m!780239 () Bool)

(assert (=> b!835069 m!780239))

(declare-fun m!780241 () Bool)

(assert (=> b!835069 m!780241))

(push 1)

(assert (not b!835066))

(assert (not start!71852))

(assert (not b!835069))

(assert (not b!835067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

