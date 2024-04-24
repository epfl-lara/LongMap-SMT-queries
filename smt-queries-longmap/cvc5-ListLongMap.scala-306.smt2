; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5316 () Bool)

(assert start!5316)

(declare-fun res!22994 () Bool)

(declare-fun e!24288 () Bool)

(assert (=> start!5316 (=> (not res!22994) (not e!24288))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5316 (= res!22994 (validMask!0 mask!853))))

(assert (=> start!5316 e!24288))

(assert (=> start!5316 true))

(declare-fun b!38212 () Bool)

(assert (=> b!38212 (= e!24288 (not true))))

(declare-datatypes ((array!2503 0))(
  ( (array!2504 (arr!1195 (Array (_ BitVec 32) (_ BitVec 64))) (size!1302 (_ BitVec 32))) )
))
(declare-fun lt!14097 () array!2503)

(declare-fun arrayCountValidKeys!0 (array!2503 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38212 (= (arrayCountValidKeys!0 lt!14097 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!915 0))(
  ( (Unit!916) )
))
(declare-fun lt!14098 () Unit!915)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2503 (_ BitVec 32) (_ BitVec 32)) Unit!915)

(assert (=> b!38212 (= lt!14098 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14097 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38212 (= lt!14097 (array!2504 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5316 res!22994) b!38212))

(declare-fun m!30745 () Bool)

(assert (=> start!5316 m!30745))

(declare-fun m!30747 () Bool)

(assert (=> b!38212 m!30747))

(declare-fun m!30749 () Bool)

(assert (=> b!38212 m!30749))

(push 1)

(assert (not start!5316))

(assert (not b!38212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

