; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6230 () Bool)

(assert start!6230)

(declare-fun res!25180 () Bool)

(declare-fun e!26771 () Bool)

(assert (=> start!6230 (=> (not res!25180) (not e!26771))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6230 (= res!25180 (validMask!0 mask!853))))

(assert (=> start!6230 e!26771))

(assert (=> start!6230 true))

(declare-fun b!42290 () Bool)

(assert (=> b!42290 (= e!26771 (not true))))

(declare-datatypes ((array!2785 0))(
  ( (array!2786 (arr!1336 (Array (_ BitVec 32) (_ BitVec 64))) (size!1506 (_ BitVec 32))) )
))
(declare-fun lt!17556 () array!2785)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2785 (_ BitVec 32)) Bool)

(assert (=> b!42290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17556 mask!853)))

(declare-datatypes ((Unit!1136 0))(
  ( (Unit!1137) )
))
(declare-fun lt!17558 () Unit!1136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2785 (_ BitVec 32) (_ BitVec 32)) Unit!1136)

(assert (=> b!42290 (= lt!17558 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17556 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2785 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42290 (= (arrayCountValidKeys!0 lt!17556 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17557 () Unit!1136)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2785 (_ BitVec 32) (_ BitVec 32)) Unit!1136)

(assert (=> b!42290 (= lt!17557 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17556 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42290 (= lt!17556 (array!2786 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6230 res!25180) b!42290))

(declare-fun m!35911 () Bool)

(assert (=> start!6230 m!35911))

(declare-fun m!35913 () Bool)

(assert (=> b!42290 m!35913))

(declare-fun m!35915 () Bool)

(assert (=> b!42290 m!35915))

(declare-fun m!35917 () Bool)

(assert (=> b!42290 m!35917))

(declare-fun m!35919 () Bool)

(assert (=> b!42290 m!35919))

(push 1)

(assert (not b!42290))

(assert (not start!6230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

