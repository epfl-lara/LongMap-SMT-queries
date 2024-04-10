; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5316 () Bool)

(assert start!5316)

(declare-fun res!23025 () Bool)

(declare-fun e!24331 () Bool)

(assert (=> start!5316 (=> (not res!23025) (not e!24331))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5316 (= res!23025 (validMask!0 mask!853))))

(assert (=> start!5316 e!24331))

(assert (=> start!5316 true))

(declare-fun b!38275 () Bool)

(assert (=> b!38275 (= e!24331 (not true))))

(declare-datatypes ((array!2521 0))(
  ( (array!2522 (arr!1204 (Array (_ BitVec 32) (_ BitVec 64))) (size!1311 (_ BitVec 32))) )
))
(declare-fun lt!14152 () array!2521)

(declare-fun arrayCountValidKeys!0 (array!2521 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38275 (= (arrayCountValidKeys!0 lt!14152 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!913 0))(
  ( (Unit!914) )
))
(declare-fun lt!14153 () Unit!913)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2521 (_ BitVec 32) (_ BitVec 32)) Unit!913)

(assert (=> b!38275 (= lt!14153 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14152 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38275 (= lt!14152 (array!2522 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5316 res!23025) b!38275))

(declare-fun m!30883 () Bool)

(assert (=> start!5316 m!30883))

(declare-fun m!30885 () Bool)

(assert (=> b!38275 m!30885))

(declare-fun m!30887 () Bool)

(assert (=> b!38275 m!30887))

(check-sat (not start!5316) (not b!38275))
(check-sat)
