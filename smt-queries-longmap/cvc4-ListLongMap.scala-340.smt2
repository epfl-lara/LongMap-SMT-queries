; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6194 () Bool)

(assert start!6194)

(declare-fun res!25170 () Bool)

(declare-fun e!26761 () Bool)

(assert (=> start!6194 (=> (not res!25170) (not e!26761))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6194 (= res!25170 (validMask!0 mask!853))))

(assert (=> start!6194 e!26761))

(assert (=> start!6194 true))

(declare-fun b!42280 () Bool)

(assert (=> b!42280 (= e!26761 (not true))))

(declare-datatypes ((array!2799 0))(
  ( (array!2800 (arr!1343 (Array (_ BitVec 32) (_ BitVec 64))) (size!1510 (_ BitVec 32))) )
))
(declare-fun lt!17468 () array!2799)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2799 (_ BitVec 32)) Bool)

(assert (=> b!42280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17468 mask!853)))

(declare-datatypes ((Unit!1117 0))(
  ( (Unit!1118) )
))
(declare-fun lt!17466 () Unit!1117)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2799 (_ BitVec 32) (_ BitVec 32)) Unit!1117)

(assert (=> b!42280 (= lt!17466 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17468 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2799 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42280 (= (arrayCountValidKeys!0 lt!17468 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17467 () Unit!1117)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2799 (_ BitVec 32) (_ BitVec 32)) Unit!1117)

(assert (=> b!42280 (= lt!17467 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17468 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42280 (= lt!17468 (array!2800 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6194 res!25170) b!42280))

(declare-fun m!35893 () Bool)

(assert (=> start!6194 m!35893))

(declare-fun m!35895 () Bool)

(assert (=> b!42280 m!35895))

(declare-fun m!35897 () Bool)

(assert (=> b!42280 m!35897))

(declare-fun m!35899 () Bool)

(assert (=> b!42280 m!35899))

(declare-fun m!35901 () Bool)

(assert (=> b!42280 m!35901))

(push 1)

(assert (not start!6194))

(assert (not b!42280))

(check-sat)

(pop 1)

