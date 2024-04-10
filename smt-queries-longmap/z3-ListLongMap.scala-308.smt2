; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5322 () Bool)

(assert start!5322)

(declare-fun res!23034 () Bool)

(declare-fun e!24340 () Bool)

(assert (=> start!5322 (=> (not res!23034) (not e!24340))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5322 (= res!23034 (validMask!0 mask!853))))

(assert (=> start!5322 e!24340))

(assert (=> start!5322 true))

(declare-fun b!38284 () Bool)

(assert (=> b!38284 (= e!24340 (not true))))

(declare-datatypes ((array!2527 0))(
  ( (array!2528 (arr!1207 (Array (_ BitVec 32) (_ BitVec 64))) (size!1314 (_ BitVec 32))) )
))
(declare-fun lt!14170 () array!2527)

(declare-fun arrayCountValidKeys!0 (array!2527 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38284 (= (arrayCountValidKeys!0 lt!14170 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!919 0))(
  ( (Unit!920) )
))
(declare-fun lt!14171 () Unit!919)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2527 (_ BitVec 32) (_ BitVec 32)) Unit!919)

(assert (=> b!38284 (= lt!14171 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14170 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38284 (= lt!14170 (array!2528 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5322 res!23034) b!38284))

(declare-fun m!30901 () Bool)

(assert (=> start!5322 m!30901))

(declare-fun m!30903 () Bool)

(assert (=> b!38284 m!30903))

(declare-fun m!30905 () Bool)

(assert (=> b!38284 m!30905))

(check-sat (not b!38284) (not start!5322))
(check-sat)
