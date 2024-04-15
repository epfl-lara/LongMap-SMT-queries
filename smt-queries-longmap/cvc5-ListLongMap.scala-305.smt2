; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5304 () Bool)

(assert start!5304)

(declare-fun res!22993 () Bool)

(declare-fun e!24288 () Bool)

(assert (=> start!5304 (=> (not res!22993) (not e!24288))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5304 (= res!22993 (validMask!0 mask!853))))

(assert (=> start!5304 e!24288))

(assert (=> start!5304 true))

(declare-fun b!38221 () Bool)

(assert (=> b!38221 (= e!24288 (not true))))

(declare-datatypes ((array!2485 0))(
  ( (array!2486 (arr!1186 (Array (_ BitVec 32) (_ BitVec 64))) (size!1293 (_ BitVec 32))) )
))
(declare-fun lt!14119 () array!2485)

(declare-fun arrayCountValidKeys!0 (array!2485 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38221 (= (arrayCountValidKeys!0 lt!14119 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!904 0))(
  ( (Unit!905) )
))
(declare-fun lt!14120 () Unit!904)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2485 (_ BitVec 32) (_ BitVec 32)) Unit!904)

(assert (=> b!38221 (= lt!14120 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14119 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38221 (= lt!14119 (array!2486 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5304 res!22993) b!38221))

(declare-fun m!30809 () Bool)

(assert (=> start!5304 m!30809))

(declare-fun m!30811 () Bool)

(assert (=> b!38221 m!30811))

(declare-fun m!30813 () Bool)

(assert (=> b!38221 m!30813))

(push 1)

(assert (not start!5304))

(assert (not b!38221))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

