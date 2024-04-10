; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6168 () Bool)

(assert start!6168)

(declare-fun res!25158 () Bool)

(declare-fun e!26731 () Bool)

(assert (=> start!6168 (=> (not res!25158) (not e!26731))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6168 (= res!25158 (validMask!0 mask!853))))

(assert (=> start!6168 e!26731))

(assert (=> start!6168 true))

(declare-fun b!42232 () Bool)

(assert (=> b!42232 (= e!26731 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2791 0))(
  ( (array!2792 (arr!1339 (Array (_ BitVec 32) (_ BitVec 64))) (size!1503 (_ BitVec 32))) )
))
(declare-fun lt!17416 () array!2791)

(declare-fun arrayCountValidKeys!0 (array!2791 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42232 (= (arrayCountValidKeys!0 lt!17416 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1109 0))(
  ( (Unit!1110) )
))
(declare-fun lt!17417 () Unit!1109)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2791 (_ BitVec 32) (_ BitVec 32)) Unit!1109)

(assert (=> b!42232 (= lt!17417 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17416 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42232 (= lt!17416 (array!2792 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6168 res!25158) b!42232))

(declare-fun m!35839 () Bool)

(assert (=> start!6168 m!35839))

(declare-fun m!35841 () Bool)

(assert (=> b!42232 m!35841))

(declare-fun m!35843 () Bool)

(assert (=> b!42232 m!35843))

(check-sat (not start!6168) (not b!42232))
(check-sat)
(get-model)

