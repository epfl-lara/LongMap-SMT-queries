; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6150 () Bool)

(assert start!6150)

(declare-fun res!25131 () Bool)

(declare-fun e!26704 () Bool)

(assert (=> start!6150 (=> (not res!25131) (not e!26704))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6150 (= res!25131 (validMask!0 mask!853))))

(assert (=> start!6150 e!26704))

(assert (=> start!6150 true))

(declare-fun b!42205 () Bool)

(assert (=> b!42205 (= e!26704 (not true))))

(declare-datatypes ((array!2773 0))(
  ( (array!2774 (arr!1330 (Array (_ BitVec 32) (_ BitVec 64))) (size!1494 (_ BitVec 32))) )
))
(declare-fun lt!17362 () array!2773)

(declare-fun arrayCountValidKeys!0 (array!2773 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42205 (= (arrayCountValidKeys!0 lt!17362 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1091 0))(
  ( (Unit!1092) )
))
(declare-fun lt!17363 () Unit!1091)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2773 (_ BitVec 32) (_ BitVec 32)) Unit!1091)

(assert (=> b!42205 (= lt!17363 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17362 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42205 (= lt!17362 (array!2774 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6150 res!25131) b!42205))

(declare-fun m!35785 () Bool)

(assert (=> start!6150 m!35785))

(declare-fun m!35787 () Bool)

(assert (=> b!42205 m!35787))

(declare-fun m!35789 () Bool)

(assert (=> b!42205 m!35789))

(check-sat (not b!42205) (not start!6150))
