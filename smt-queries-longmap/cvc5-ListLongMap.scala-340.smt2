; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6198 () Bool)

(assert start!6198)

(declare-fun res!25145 () Bool)

(declare-fun e!26724 () Bool)

(assert (=> start!6198 (=> (not res!25145) (not e!26724))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6198 (= res!25145 (validMask!0 mask!853))))

(assert (=> start!6198 e!26724))

(assert (=> start!6198 true))

(declare-fun b!42223 () Bool)

(assert (=> b!42223 (= e!26724 (not true))))

(declare-datatypes ((array!2785 0))(
  ( (array!2786 (arr!1336 (Array (_ BitVec 32) (_ BitVec 64))) (size!1503 (_ BitVec 32))) )
))
(declare-fun lt!17424 () array!2785)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2785 (_ BitVec 32)) Bool)

(assert (=> b!42223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17424 mask!853)))

(declare-datatypes ((Unit!1129 0))(
  ( (Unit!1130) )
))
(declare-fun lt!17425 () Unit!1129)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2785 (_ BitVec 32) (_ BitVec 32)) Unit!1129)

(assert (=> b!42223 (= lt!17425 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17424 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2785 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42223 (= (arrayCountValidKeys!0 lt!17424 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17423 () Unit!1129)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2785 (_ BitVec 32) (_ BitVec 32)) Unit!1129)

(assert (=> b!42223 (= lt!17423 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17424 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42223 (= lt!17424 (array!2786 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6198 res!25145) b!42223))

(declare-fun m!35769 () Bool)

(assert (=> start!6198 m!35769))

(declare-fun m!35771 () Bool)

(assert (=> b!42223 m!35771))

(declare-fun m!35773 () Bool)

(assert (=> b!42223 m!35773))

(declare-fun m!35775 () Bool)

(assert (=> b!42223 m!35775))

(declare-fun m!35777 () Bool)

(assert (=> b!42223 m!35777))

(push 1)

(assert (not start!6198))

(assert (not b!42223))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

