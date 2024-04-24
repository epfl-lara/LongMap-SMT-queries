; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5322 () Bool)

(assert start!5322)

(declare-fun res!23003 () Bool)

(declare-fun e!24297 () Bool)

(assert (=> start!5322 (=> (not res!23003) (not e!24297))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5322 (= res!23003 (validMask!0 mask!853))))

(assert (=> start!5322 e!24297))

(assert (=> start!5322 true))

(declare-fun b!38221 () Bool)

(assert (=> b!38221 (= e!24297 (not true))))

(declare-datatypes ((array!2509 0))(
  ( (array!2510 (arr!1198 (Array (_ BitVec 32) (_ BitVec 64))) (size!1305 (_ BitVec 32))) )
))
(declare-fun lt!14115 () array!2509)

(declare-fun arrayCountValidKeys!0 (array!2509 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38221 (= (arrayCountValidKeys!0 lt!14115 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!921 0))(
  ( (Unit!922) )
))
(declare-fun lt!14116 () Unit!921)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2509 (_ BitVec 32) (_ BitVec 32)) Unit!921)

(assert (=> b!38221 (= lt!14116 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14115 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38221 (= lt!14115 (array!2510 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5322 res!23003) b!38221))

(declare-fun m!30763 () Bool)

(assert (=> start!5322 m!30763))

(declare-fun m!30765 () Bool)

(assert (=> b!38221 m!30765))

(declare-fun m!30767 () Bool)

(assert (=> b!38221 m!30767))

(push 1)

(assert (not start!5322))

(assert (not b!38221))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

