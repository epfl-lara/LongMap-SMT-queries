; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5310 () Bool)

(assert start!5310)

(declare-fun res!23016 () Bool)

(declare-fun e!24322 () Bool)

(assert (=> start!5310 (=> (not res!23016) (not e!24322))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5310 (= res!23016 (validMask!0 mask!853))))

(assert (=> start!5310 e!24322))

(assert (=> start!5310 true))

(declare-fun b!38266 () Bool)

(assert (=> b!38266 (= e!24322 (not true))))

(declare-datatypes ((array!2515 0))(
  ( (array!2516 (arr!1201 (Array (_ BitVec 32) (_ BitVec 64))) (size!1308 (_ BitVec 32))) )
))
(declare-fun lt!14134 () array!2515)

(declare-fun arrayCountValidKeys!0 (array!2515 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38266 (= (arrayCountValidKeys!0 lt!14134 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!907 0))(
  ( (Unit!908) )
))
(declare-fun lt!14135 () Unit!907)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2515 (_ BitVec 32) (_ BitVec 32)) Unit!907)

(assert (=> b!38266 (= lt!14135 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14134 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38266 (= lt!14134 (array!2516 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5310 res!23016) b!38266))

(declare-fun m!30865 () Bool)

(assert (=> start!5310 m!30865))

(declare-fun m!30867 () Bool)

(assert (=> b!38266 m!30867))

(declare-fun m!30869 () Bool)

(assert (=> b!38266 m!30869))

(check-sat (not start!5310) (not b!38266))
