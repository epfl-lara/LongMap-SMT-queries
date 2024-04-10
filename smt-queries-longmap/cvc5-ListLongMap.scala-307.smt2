; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5314 () Bool)

(assert start!5314)

(declare-fun res!23022 () Bool)

(declare-fun e!24328 () Bool)

(assert (=> start!5314 (=> (not res!23022) (not e!24328))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5314 (= res!23022 (validMask!0 mask!853))))

(assert (=> start!5314 e!24328))

(assert (=> start!5314 true))

(declare-fun b!38272 () Bool)

(assert (=> b!38272 (= e!24328 (not true))))

(declare-datatypes ((array!2519 0))(
  ( (array!2520 (arr!1203 (Array (_ BitVec 32) (_ BitVec 64))) (size!1310 (_ BitVec 32))) )
))
(declare-fun lt!14146 () array!2519)

(declare-fun arrayCountValidKeys!0 (array!2519 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38272 (= (arrayCountValidKeys!0 lt!14146 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!911 0))(
  ( (Unit!912) )
))
(declare-fun lt!14147 () Unit!911)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2519 (_ BitVec 32) (_ BitVec 32)) Unit!911)

(assert (=> b!38272 (= lt!14147 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14146 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38272 (= lt!14146 (array!2520 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5314 res!23022) b!38272))

(declare-fun m!30877 () Bool)

(assert (=> start!5314 m!30877))

(declare-fun m!30879 () Bool)

(assert (=> b!38272 m!30879))

(declare-fun m!30881 () Bool)

(assert (=> b!38272 m!30881))

(push 1)

(assert (not b!38272))

(assert (not start!5314))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

