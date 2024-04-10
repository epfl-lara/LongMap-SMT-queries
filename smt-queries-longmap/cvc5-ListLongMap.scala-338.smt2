; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6160 () Bool)

(assert start!6160)

(declare-fun res!25146 () Bool)

(declare-fun e!26719 () Bool)

(assert (=> start!6160 (=> (not res!25146) (not e!26719))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6160 (= res!25146 (validMask!0 mask!853))))

(assert (=> start!6160 e!26719))

(assert (=> start!6160 true))

(declare-fun b!42220 () Bool)

(assert (=> b!42220 (= e!26719 (not true))))

(declare-datatypes ((array!2783 0))(
  ( (array!2784 (arr!1335 (Array (_ BitVec 32) (_ BitVec 64))) (size!1499 (_ BitVec 32))) )
))
(declare-fun lt!17392 () array!2783)

(declare-fun arrayCountValidKeys!0 (array!2783 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42220 (= (arrayCountValidKeys!0 lt!17392 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1101 0))(
  ( (Unit!1102) )
))
(declare-fun lt!17393 () Unit!1101)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2783 (_ BitVec 32) (_ BitVec 32)) Unit!1101)

(assert (=> b!42220 (= lt!17393 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17392 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42220 (= lt!17392 (array!2784 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6160 res!25146) b!42220))

(declare-fun m!35815 () Bool)

(assert (=> start!6160 m!35815))

(declare-fun m!35817 () Bool)

(assert (=> b!42220 m!35817))

(declare-fun m!35819 () Bool)

(assert (=> b!42220 m!35819))

(push 1)

(assert (not start!6160))

(assert (not b!42220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

