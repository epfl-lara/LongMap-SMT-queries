; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5302 () Bool)

(assert start!5302)

(declare-fun res!23004 () Bool)

(declare-fun e!24310 () Bool)

(assert (=> start!5302 (=> (not res!23004) (not e!24310))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5302 (= res!23004 (validMask!0 mask!853))))

(assert (=> start!5302 e!24310))

(assert (=> start!5302 true))

(declare-fun b!38254 () Bool)

(assert (=> b!38254 (= e!24310 (not true))))

(declare-datatypes ((array!2507 0))(
  ( (array!2508 (arr!1197 (Array (_ BitVec 32) (_ BitVec 64))) (size!1304 (_ BitVec 32))) )
))
(declare-fun lt!14110 () array!2507)

(declare-fun arrayCountValidKeys!0 (array!2507 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38254 (= (arrayCountValidKeys!0 lt!14110 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!899 0))(
  ( (Unit!900) )
))
(declare-fun lt!14111 () Unit!899)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2507 (_ BitVec 32) (_ BitVec 32)) Unit!899)

(assert (=> b!38254 (= lt!14111 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14110 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38254 (= lt!14110 (array!2508 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5302 res!23004) b!38254))

(declare-fun m!30841 () Bool)

(assert (=> start!5302 m!30841))

(declare-fun m!30843 () Bool)

(assert (=> b!38254 m!30843))

(declare-fun m!30845 () Bool)

(assert (=> b!38254 m!30845))

(push 1)

(assert (not start!5302))

(assert (not b!38254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

