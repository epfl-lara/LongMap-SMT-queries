; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71854 () Bool)

(assert start!71854)

(declare-fun b!835081 () Bool)

(declare-fun res!567950 () Bool)

(declare-fun e!465905 () Bool)

(assert (=> b!835081 (=> (not res!567950) (not e!465905))))

(declare-datatypes ((array!46764 0))(
  ( (array!46765 (arr!22416 (Array (_ BitVec 32) (_ BitVec 64))) (size!22837 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46764)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835081 (= res!567950 (and (bvslt (size!22837 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22837 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!567953 () Bool)

(assert (=> start!71854 (=> (not res!567953) (not e!465905))))

(assert (=> start!71854 (= res!567953 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22837 a!4227))))))

(assert (=> start!71854 e!465905))

(assert (=> start!71854 true))

(declare-fun array_inv!17863 (array!46764) Bool)

(assert (=> start!71854 (array_inv!17863 a!4227)))

(declare-fun b!835080 () Bool)

(declare-fun res!567951 () Bool)

(assert (=> b!835080 (=> (not res!567951) (not e!465905))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835080 (= res!567951 (validKeyInArray!0 k!2968))))

(declare-fun b!835082 () Bool)

(assert (=> b!835082 (= e!465905 false)))

(declare-fun lt!379647 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46764 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835082 (= lt!379647 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379648 () (_ BitVec 32))

(assert (=> b!835082 (= lt!379648 (arrayCountValidKeys!0 (array!46765 (store (arr!22416 a!4227) i!1466 k!2968) (size!22837 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835079 () Bool)

(declare-fun res!567952 () Bool)

(assert (=> b!835079 (=> (not res!567952) (not e!465905))))

(assert (=> b!835079 (= res!567952 (not (validKeyInArray!0 (select (arr!22416 a!4227) i!1466))))))

(assert (= (and start!71854 res!567953) b!835079))

(assert (= (and b!835079 res!567952) b!835080))

(assert (= (and b!835080 res!567951) b!835081))

(assert (= (and b!835081 res!567950) b!835082))

(declare-fun m!780243 () Bool)

(assert (=> start!71854 m!780243))

(declare-fun m!780245 () Bool)

(assert (=> b!835080 m!780245))

(declare-fun m!780247 () Bool)

(assert (=> b!835082 m!780247))

(declare-fun m!780249 () Bool)

(assert (=> b!835082 m!780249))

(declare-fun m!780251 () Bool)

(assert (=> b!835082 m!780251))

(declare-fun m!780253 () Bool)

(assert (=> b!835079 m!780253))

(assert (=> b!835079 m!780253))

(declare-fun m!780255 () Bool)

(assert (=> b!835079 m!780255))

(push 1)

(assert (not start!71854))

(assert (not b!835082))

(assert (not b!835080))

(assert (not b!835079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

