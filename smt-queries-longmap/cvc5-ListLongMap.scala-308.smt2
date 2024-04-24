; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5328 () Bool)

(assert start!5328)

(declare-fun res!23012 () Bool)

(declare-fun e!24306 () Bool)

(assert (=> start!5328 (=> (not res!23012) (not e!24306))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5328 (= res!23012 (validMask!0 mask!853))))

(assert (=> start!5328 e!24306))

(assert (=> start!5328 true))

(declare-fun b!38230 () Bool)

(assert (=> b!38230 (= e!24306 (not true))))

(declare-datatypes ((array!2515 0))(
  ( (array!2516 (arr!1201 (Array (_ BitVec 32) (_ BitVec 64))) (size!1308 (_ BitVec 32))) )
))
(declare-fun lt!14133 () array!2515)

(declare-fun arrayCountValidKeys!0 (array!2515 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38230 (= (arrayCountValidKeys!0 lt!14133 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!927 0))(
  ( (Unit!928) )
))
(declare-fun lt!14134 () Unit!927)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2515 (_ BitVec 32) (_ BitVec 32)) Unit!927)

(assert (=> b!38230 (= lt!14134 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14133 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38230 (= lt!14133 (array!2516 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5328 res!23012) b!38230))

(declare-fun m!30781 () Bool)

(assert (=> start!5328 m!30781))

(declare-fun m!30783 () Bool)

(assert (=> b!38230 m!30783))

(declare-fun m!30785 () Bool)

(assert (=> b!38230 m!30785))

(push 1)

(assert (not b!38230))

(assert (not start!5328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

