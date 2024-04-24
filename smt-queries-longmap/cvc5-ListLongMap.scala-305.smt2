; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5310 () Bool)

(assert start!5310)

(declare-fun res!22985 () Bool)

(declare-fun e!24279 () Bool)

(assert (=> start!5310 (=> (not res!22985) (not e!24279))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5310 (= res!22985 (validMask!0 mask!853))))

(assert (=> start!5310 e!24279))

(assert (=> start!5310 true))

(declare-fun b!38203 () Bool)

(assert (=> b!38203 (= e!24279 (not true))))

(declare-datatypes ((array!2497 0))(
  ( (array!2498 (arr!1192 (Array (_ BitVec 32) (_ BitVec 64))) (size!1299 (_ BitVec 32))) )
))
(declare-fun lt!14079 () array!2497)

(declare-fun arrayCountValidKeys!0 (array!2497 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38203 (= (arrayCountValidKeys!0 lt!14079 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!909 0))(
  ( (Unit!910) )
))
(declare-fun lt!14080 () Unit!909)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2497 (_ BitVec 32) (_ BitVec 32)) Unit!909)

(assert (=> b!38203 (= lt!14080 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14079 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38203 (= lt!14079 (array!2498 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5310 res!22985) b!38203))

(declare-fun m!30727 () Bool)

(assert (=> start!5310 m!30727))

(declare-fun m!30729 () Bool)

(assert (=> b!38203 m!30729))

(declare-fun m!30731 () Bool)

(assert (=> b!38203 m!30731))

(push 1)

(assert (not start!5310))

(assert (not b!38203))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

