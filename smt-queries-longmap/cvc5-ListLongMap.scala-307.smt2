; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5316 () Bool)

(assert start!5316)

(declare-fun res!23011 () Bool)

(declare-fun e!24306 () Bool)

(assert (=> start!5316 (=> (not res!23011) (not e!24306))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5316 (= res!23011 (validMask!0 mask!853))))

(assert (=> start!5316 e!24306))

(assert (=> start!5316 true))

(declare-fun b!38239 () Bool)

(assert (=> b!38239 (= e!24306 (not true))))

(declare-datatypes ((array!2497 0))(
  ( (array!2498 (arr!1192 (Array (_ BitVec 32) (_ BitVec 64))) (size!1299 (_ BitVec 32))) )
))
(declare-fun lt!14155 () array!2497)

(declare-fun arrayCountValidKeys!0 (array!2497 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38239 (= (arrayCountValidKeys!0 lt!14155 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!916 0))(
  ( (Unit!917) )
))
(declare-fun lt!14156 () Unit!916)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2497 (_ BitVec 32) (_ BitVec 32)) Unit!916)

(assert (=> b!38239 (= lt!14156 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14155 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38239 (= lt!14155 (array!2498 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5316 res!23011) b!38239))

(declare-fun m!30845 () Bool)

(assert (=> start!5316 m!30845))

(declare-fun m!30847 () Bool)

(assert (=> b!38239 m!30847))

(declare-fun m!30849 () Bool)

(assert (=> b!38239 m!30849))

(push 1)

(assert (not start!5316))

(assert (not b!38239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

