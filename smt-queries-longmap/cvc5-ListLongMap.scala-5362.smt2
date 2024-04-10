; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71770 () Bool)

(assert start!71770)

(declare-fun b!834182 () Bool)

(declare-fun e!465402 () Bool)

(assert (=> b!834182 (= e!465402 false)))

(declare-datatypes ((array!46680 0))(
  ( (array!46681 (arr!22374 (Array (_ BitVec 32) (_ BitVec 64))) (size!22795 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46680)

(declare-fun lt!378810 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46680 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834182 (= lt!378810 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378811 () (_ BitVec 32))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834182 (= lt!378811 (arrayCountValidKeys!0 (array!46681 (store (arr!22374 a!4227) i!1466 k!2968) (size!22795 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834179 () Bool)

(declare-fun res!567212 () Bool)

(assert (=> b!834179 (=> (not res!567212) (not e!465402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834179 (= res!567212 (not (validKeyInArray!0 (select (arr!22374 a!4227) i!1466))))))

(declare-fun res!567214 () Bool)

(assert (=> start!71770 (=> (not res!567214) (not e!465402))))

(assert (=> start!71770 (= res!567214 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22795 a!4227))))))

(assert (=> start!71770 e!465402))

(assert (=> start!71770 true))

(declare-fun array_inv!17821 (array!46680) Bool)

(assert (=> start!71770 (array_inv!17821 a!4227)))

(declare-fun b!834180 () Bool)

(declare-fun res!567213 () Bool)

(assert (=> b!834180 (=> (not res!567213) (not e!465402))))

(assert (=> b!834180 (= res!567213 (validKeyInArray!0 k!2968))))

(declare-fun b!834181 () Bool)

(declare-fun res!567215 () Bool)

(assert (=> b!834181 (=> (not res!567215) (not e!465402))))

(assert (=> b!834181 (= res!567215 (and (bvslt (size!22795 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22795 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71770 res!567214) b!834179))

(assert (= (and b!834179 res!567212) b!834180))

(assert (= (and b!834180 res!567213) b!834181))

(assert (= (and b!834181 res!567215) b!834182))

(declare-fun m!779119 () Bool)

(assert (=> b!834182 m!779119))

(declare-fun m!779121 () Bool)

(assert (=> b!834182 m!779121))

(declare-fun m!779123 () Bool)

(assert (=> b!834182 m!779123))

(declare-fun m!779125 () Bool)

(assert (=> b!834179 m!779125))

(assert (=> b!834179 m!779125))

(declare-fun m!779127 () Bool)

(assert (=> b!834179 m!779127))

(declare-fun m!779129 () Bool)

(assert (=> start!71770 m!779129))

(declare-fun m!779131 () Bool)

(assert (=> b!834180 m!779131))

(push 1)

(assert (not b!834182))

(assert (not b!834180))

(assert (not start!71770))

(assert (not b!834179))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

