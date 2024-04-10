; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6164 () Bool)

(assert start!6164)

(declare-fun res!25152 () Bool)

(declare-fun e!26725 () Bool)

(assert (=> start!6164 (=> (not res!25152) (not e!26725))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6164 (= res!25152 (validMask!0 mask!853))))

(assert (=> start!6164 e!26725))

(assert (=> start!6164 true))

(declare-fun b!42226 () Bool)

(assert (=> b!42226 (= e!26725 (not true))))

(declare-datatypes ((array!2787 0))(
  ( (array!2788 (arr!1337 (Array (_ BitVec 32) (_ BitVec 64))) (size!1501 (_ BitVec 32))) )
))
(declare-fun lt!17404 () array!2787)

(declare-fun arrayCountValidKeys!0 (array!2787 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42226 (= (arrayCountValidKeys!0 lt!17404 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1105 0))(
  ( (Unit!1106) )
))
(declare-fun lt!17405 () Unit!1105)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2787 (_ BitVec 32) (_ BitVec 32)) Unit!1105)

(assert (=> b!42226 (= lt!17405 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17404 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42226 (= lt!17404 (array!2788 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6164 res!25152) b!42226))

(declare-fun m!35827 () Bool)

(assert (=> start!6164 m!35827))

(declare-fun m!35829 () Bool)

(assert (=> b!42226 m!35829))

(declare-fun m!35831 () Bool)

(assert (=> b!42226 m!35831))

(push 1)

(assert (not b!42226))

(assert (not start!6164))

(check-sat)

