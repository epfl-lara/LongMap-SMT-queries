; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5310 () Bool)

(assert start!5310)

(declare-fun res!23002 () Bool)

(declare-fun e!24297 () Bool)

(assert (=> start!5310 (=> (not res!23002) (not e!24297))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5310 (= res!23002 (validMask!0 mask!853))))

(assert (=> start!5310 e!24297))

(assert (=> start!5310 true))

(declare-fun b!38230 () Bool)

(assert (=> b!38230 (= e!24297 (not true))))

(declare-datatypes ((array!2491 0))(
  ( (array!2492 (arr!1189 (Array (_ BitVec 32) (_ BitVec 64))) (size!1296 (_ BitVec 32))) )
))
(declare-fun lt!14137 () array!2491)

(declare-fun arrayCountValidKeys!0 (array!2491 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38230 (= (arrayCountValidKeys!0 lt!14137 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!910 0))(
  ( (Unit!911) )
))
(declare-fun lt!14138 () Unit!910)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2491 (_ BitVec 32) (_ BitVec 32)) Unit!910)

(assert (=> b!38230 (= lt!14138 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14137 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38230 (= lt!14137 (array!2492 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5310 res!23002) b!38230))

(declare-fun m!30827 () Bool)

(assert (=> start!5310 m!30827))

(declare-fun m!30829 () Bool)

(assert (=> b!38230 m!30829))

(declare-fun m!30831 () Bool)

(assert (=> b!38230 m!30831))

(push 1)

(assert (not start!5310))

(assert (not b!38230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

