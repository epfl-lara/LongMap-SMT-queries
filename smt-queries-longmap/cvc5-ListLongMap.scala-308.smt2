; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5322 () Bool)

(assert start!5322)

(declare-fun res!23020 () Bool)

(declare-fun e!24315 () Bool)

(assert (=> start!5322 (=> (not res!23020) (not e!24315))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5322 (= res!23020 (validMask!0 mask!853))))

(assert (=> start!5322 e!24315))

(assert (=> start!5322 true))

(declare-fun b!38248 () Bool)

(assert (=> b!38248 (= e!24315 (not true))))

(declare-datatypes ((array!2503 0))(
  ( (array!2504 (arr!1195 (Array (_ BitVec 32) (_ BitVec 64))) (size!1302 (_ BitVec 32))) )
))
(declare-fun lt!14173 () array!2503)

(declare-fun arrayCountValidKeys!0 (array!2503 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38248 (= (arrayCountValidKeys!0 lt!14173 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!922 0))(
  ( (Unit!923) )
))
(declare-fun lt!14174 () Unit!922)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2503 (_ BitVec 32) (_ BitVec 32)) Unit!922)

(assert (=> b!38248 (= lt!14174 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14173 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38248 (= lt!14173 (array!2504 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5322 res!23020) b!38248))

(declare-fun m!30863 () Bool)

(assert (=> start!5322 m!30863))

(declare-fun m!30865 () Bool)

(assert (=> b!38248 m!30865))

(declare-fun m!30867 () Bool)

(assert (=> b!38248 m!30867))

(push 1)

(assert (not start!5322))

(assert (not b!38248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

