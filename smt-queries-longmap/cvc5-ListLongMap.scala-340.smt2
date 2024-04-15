; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6188 () Bool)

(assert start!6188)

(declare-fun res!25144 () Bool)

(declare-fun e!26708 () Bool)

(assert (=> start!6188 (=> (not res!25144) (not e!26708))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6188 (= res!25144 (validMask!0 mask!853))))

(assert (=> start!6188 e!26708))

(assert (=> start!6188 true))

(declare-fun b!42200 () Bool)

(assert (=> b!42200 (= e!26708 (not true))))

(declare-datatypes ((array!2773 0))(
  ( (array!2774 (arr!1330 (Array (_ BitVec 32) (_ BitVec 64))) (size!1497 (_ BitVec 32))) )
))
(declare-fun lt!17450 () array!2773)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2773 (_ BitVec 32)) Bool)

(assert (=> b!42200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17450 mask!853)))

(declare-datatypes ((Unit!1124 0))(
  ( (Unit!1125) )
))
(declare-fun lt!17448 () Unit!1124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2773 (_ BitVec 32) (_ BitVec 32)) Unit!1124)

(assert (=> b!42200 (= lt!17448 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17450 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2773 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42200 (= (arrayCountValidKeys!0 lt!17450 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17449 () Unit!1124)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2773 (_ BitVec 32) (_ BitVec 32)) Unit!1124)

(assert (=> b!42200 (= lt!17449 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17450 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42200 (= lt!17450 (array!2774 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6188 res!25144) b!42200))

(declare-fun m!35797 () Bool)

(assert (=> start!6188 m!35797))

(declare-fun m!35799 () Bool)

(assert (=> b!42200 m!35799))

(declare-fun m!35801 () Bool)

(assert (=> b!42200 m!35801))

(declare-fun m!35803 () Bool)

(assert (=> b!42200 m!35803))

(declare-fun m!35805 () Bool)

(assert (=> b!42200 m!35805))

(push 1)

(assert (not b!42200))

(assert (not start!6188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

