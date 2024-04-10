; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5320 () Bool)

(assert start!5320)

(declare-fun res!23031 () Bool)

(declare-fun e!24337 () Bool)

(assert (=> start!5320 (=> (not res!23031) (not e!24337))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5320 (= res!23031 (validMask!0 mask!853))))

(assert (=> start!5320 e!24337))

(assert (=> start!5320 true))

(declare-fun b!38281 () Bool)

(assert (=> b!38281 (= e!24337 (not true))))

(declare-datatypes ((array!2525 0))(
  ( (array!2526 (arr!1206 (Array (_ BitVec 32) (_ BitVec 64))) (size!1313 (_ BitVec 32))) )
))
(declare-fun lt!14164 () array!2525)

(declare-fun arrayCountValidKeys!0 (array!2525 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38281 (= (arrayCountValidKeys!0 lt!14164 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!917 0))(
  ( (Unit!918) )
))
(declare-fun lt!14165 () Unit!917)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2525 (_ BitVec 32) (_ BitVec 32)) Unit!917)

(assert (=> b!38281 (= lt!14165 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14164 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38281 (= lt!14164 (array!2526 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5320 res!23031) b!38281))

(declare-fun m!30895 () Bool)

(assert (=> start!5320 m!30895))

(declare-fun m!30897 () Bool)

(assert (=> b!38281 m!30897))

(declare-fun m!30899 () Bool)

(assert (=> b!38281 m!30899))

(push 1)

(assert (not start!5320))

(assert (not b!38281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

