; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5312 () Bool)

(assert start!5312)

(declare-fun res!23019 () Bool)

(declare-fun e!24325 () Bool)

(assert (=> start!5312 (=> (not res!23019) (not e!24325))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5312 (= res!23019 (validMask!0 mask!853))))

(assert (=> start!5312 e!24325))

(assert (=> start!5312 true))

(declare-fun b!38269 () Bool)

(assert (=> b!38269 (= e!24325 (not true))))

(declare-datatypes ((array!2517 0))(
  ( (array!2518 (arr!1202 (Array (_ BitVec 32) (_ BitVec 64))) (size!1309 (_ BitVec 32))) )
))
(declare-fun lt!14140 () array!2517)

(declare-fun arrayCountValidKeys!0 (array!2517 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38269 (= (arrayCountValidKeys!0 lt!14140 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!909 0))(
  ( (Unit!910) )
))
(declare-fun lt!14141 () Unit!909)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2517 (_ BitVec 32) (_ BitVec 32)) Unit!909)

(assert (=> b!38269 (= lt!14141 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14140 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38269 (= lt!14140 (array!2518 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5312 res!23019) b!38269))

(declare-fun m!30871 () Bool)

(assert (=> start!5312 m!30871))

(declare-fun m!30873 () Bool)

(assert (=> b!38269 m!30873))

(declare-fun m!30875 () Bool)

(assert (=> b!38269 m!30875))

(push 1)

(assert (not start!5312))

(assert (not b!38269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

