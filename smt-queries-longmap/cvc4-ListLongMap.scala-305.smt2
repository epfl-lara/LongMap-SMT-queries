; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5306 () Bool)

(assert start!5306)

(declare-fun res!23010 () Bool)

(declare-fun e!24316 () Bool)

(assert (=> start!5306 (=> (not res!23010) (not e!24316))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5306 (= res!23010 (validMask!0 mask!853))))

(assert (=> start!5306 e!24316))

(assert (=> start!5306 true))

(declare-fun b!38260 () Bool)

(assert (=> b!38260 (= e!24316 (not true))))

(declare-datatypes ((array!2511 0))(
  ( (array!2512 (arr!1199 (Array (_ BitVec 32) (_ BitVec 64))) (size!1306 (_ BitVec 32))) )
))
(declare-fun lt!14122 () array!2511)

(declare-fun arrayCountValidKeys!0 (array!2511 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38260 (= (arrayCountValidKeys!0 lt!14122 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!903 0))(
  ( (Unit!904) )
))
(declare-fun lt!14123 () Unit!903)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2511 (_ BitVec 32) (_ BitVec 32)) Unit!903)

(assert (=> b!38260 (= lt!14123 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14122 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38260 (= lt!14122 (array!2512 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5306 res!23010) b!38260))

(declare-fun m!30853 () Bool)

(assert (=> start!5306 m!30853))

(declare-fun m!30855 () Bool)

(assert (=> b!38260 m!30855))

(declare-fun m!30857 () Bool)

(assert (=> b!38260 m!30857))

(push 1)

(assert (not start!5306))

(assert (not b!38260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

