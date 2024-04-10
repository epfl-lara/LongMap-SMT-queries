; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6190 () Bool)

(assert start!6190)

(declare-fun res!25164 () Bool)

(declare-fun e!26755 () Bool)

(assert (=> start!6190 (=> (not res!25164) (not e!26755))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6190 (= res!25164 (validMask!0 mask!853))))

(assert (=> start!6190 e!26755))

(assert (=> start!6190 true))

(declare-fun b!42274 () Bool)

(assert (=> b!42274 (= e!26755 (not true))))

(declare-datatypes ((array!2795 0))(
  ( (array!2796 (arr!1341 (Array (_ BitVec 32) (_ BitVec 64))) (size!1508 (_ BitVec 32))) )
))
(declare-fun lt!17448 () array!2795)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2795 (_ BitVec 32)) Bool)

(assert (=> b!42274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17448 mask!853)))

(declare-datatypes ((Unit!1113 0))(
  ( (Unit!1114) )
))
(declare-fun lt!17450 () Unit!1113)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2795 (_ BitVec 32) (_ BitVec 32)) Unit!1113)

(assert (=> b!42274 (= lt!17450 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17448 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2795 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42274 (= (arrayCountValidKeys!0 lt!17448 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17449 () Unit!1113)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2795 (_ BitVec 32) (_ BitVec 32)) Unit!1113)

(assert (=> b!42274 (= lt!17449 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17448 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42274 (= lt!17448 (array!2796 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6190 res!25164) b!42274))

(declare-fun m!35873 () Bool)

(assert (=> start!6190 m!35873))

(declare-fun m!35875 () Bool)

(assert (=> b!42274 m!35875))

(declare-fun m!35877 () Bool)

(assert (=> b!42274 m!35877))

(declare-fun m!35879 () Bool)

(assert (=> b!42274 m!35879))

(declare-fun m!35881 () Bool)

(assert (=> b!42274 m!35881))

(push 1)

(assert (not b!42274))

(assert (not start!6190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

