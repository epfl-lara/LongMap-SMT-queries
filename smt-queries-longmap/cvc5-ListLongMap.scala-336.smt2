; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6146 () Bool)

(assert start!6146)

(declare-fun res!25108 () Bool)

(declare-fun e!26654 () Bool)

(assert (=> start!6146 (=> (not res!25108) (not e!26654))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6146 (= res!25108 (validMask!0 mask!853))))

(assert (=> start!6146 e!26654))

(assert (=> start!6146 true))

(declare-fun b!42128 () Bool)

(assert (=> b!42128 (= e!26654 (not true))))

(declare-datatypes ((array!2749 0))(
  ( (array!2750 (arr!1318 (Array (_ BitVec 32) (_ BitVec 64))) (size!1482 (_ BitVec 32))) )
))
(declare-fun lt!17350 () array!2749)

(declare-fun arrayCountValidKeys!0 (array!2749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42128 (= (arrayCountValidKeys!0 lt!17350 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1100 0))(
  ( (Unit!1101) )
))
(declare-fun lt!17351 () Unit!1100)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2749 (_ BitVec 32) (_ BitVec 32)) Unit!1100)

(assert (=> b!42128 (= lt!17351 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17350 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42128 (= lt!17350 (array!2750 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6146 res!25108) b!42128))

(declare-fun m!35693 () Bool)

(assert (=> start!6146 m!35693))

(declare-fun m!35695 () Bool)

(assert (=> b!42128 m!35695))

(declare-fun m!35697 () Bool)

(assert (=> b!42128 m!35697))

(push 1)

(assert (not start!6146))

(assert (not b!42128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

