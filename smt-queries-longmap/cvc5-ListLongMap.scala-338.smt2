; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6168 () Bool)

(assert start!6168)

(declare-fun res!25127 () Bool)

(declare-fun e!26688 () Bool)

(assert (=> start!6168 (=> (not res!25127) (not e!26688))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6168 (= res!25127 (validMask!0 mask!853))))

(assert (=> start!6168 e!26688))

(assert (=> start!6168 true))

(declare-fun b!42169 () Bool)

(assert (=> b!42169 (= e!26688 (not true))))

(declare-datatypes ((array!2773 0))(
  ( (array!2774 (arr!1330 (Array (_ BitVec 32) (_ BitVec 64))) (size!1494 (_ BitVec 32))) )
))
(declare-fun lt!17361 () array!2773)

(declare-fun arrayCountValidKeys!0 (array!2773 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42169 (= (arrayCountValidKeys!0 lt!17361 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1117 0))(
  ( (Unit!1118) )
))
(declare-fun lt!17362 () Unit!1117)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2773 (_ BitVec 32) (_ BitVec 32)) Unit!1117)

(assert (=> b!42169 (= lt!17362 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17361 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42169 (= lt!17361 (array!2774 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6168 res!25127) b!42169))

(declare-fun m!35701 () Bool)

(assert (=> start!6168 m!35701))

(declare-fun m!35703 () Bool)

(assert (=> b!42169 m!35703))

(declare-fun m!35705 () Bool)

(assert (=> b!42169 m!35705))

(push 1)

(assert (not b!42169))

(assert (not start!6168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

