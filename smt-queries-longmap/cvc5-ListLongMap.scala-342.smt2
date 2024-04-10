; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6232 () Bool)

(assert start!6232)

(declare-fun res!25200 () Bool)

(declare-fun e!26818 () Bool)

(assert (=> start!6232 (=> (not res!25200) (not e!26818))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6232 (= res!25200 (validMask!0 mask!853))))

(assert (=> start!6232 e!26818))

(assert (=> start!6232 true))

(declare-fun b!42364 () Bool)

(assert (=> b!42364 (= e!26818 (not true))))

(declare-datatypes ((array!2807 0))(
  ( (array!2808 (arr!1347 (Array (_ BitVec 32) (_ BitVec 64))) (size!1517 (_ BitVec 32))) )
))
(declare-fun lt!17558 () array!2807)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2807 (_ BitVec 32)) Bool)

(assert (=> b!42364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17558 mask!853)))

(declare-datatypes ((Unit!1125 0))(
  ( (Unit!1126) )
))
(declare-fun lt!17556 () Unit!1125)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2807 (_ BitVec 32) (_ BitVec 32)) Unit!1125)

(assert (=> b!42364 (= lt!17556 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17558 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2807 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42364 (= (arrayCountValidKeys!0 lt!17558 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17557 () Unit!1125)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2807 (_ BitVec 32) (_ BitVec 32)) Unit!1125)

(assert (=> b!42364 (= lt!17557 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17558 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42364 (= lt!17558 (array!2808 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6232 res!25200) b!42364))

(declare-fun m!35987 () Bool)

(assert (=> start!6232 m!35987))

(declare-fun m!35989 () Bool)

(assert (=> b!42364 m!35989))

(declare-fun m!35991 () Bool)

(assert (=> b!42364 m!35991))

(declare-fun m!35993 () Bool)

(assert (=> b!42364 m!35993))

(declare-fun m!35995 () Bool)

(assert (=> b!42364 m!35995))

(push 1)

(assert (not start!6232))

(assert (not b!42364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

