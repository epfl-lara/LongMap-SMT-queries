; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6154 () Bool)

(assert start!6154)

(declare-fun res!25137 () Bool)

(declare-fun e!26710 () Bool)

(assert (=> start!6154 (=> (not res!25137) (not e!26710))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6154 (= res!25137 (validMask!0 mask!853))))

(assert (=> start!6154 e!26710))

(assert (=> start!6154 true))

(declare-fun b!42211 () Bool)

(assert (=> b!42211 (= e!26710 (not true))))

(declare-datatypes ((array!2777 0))(
  ( (array!2778 (arr!1332 (Array (_ BitVec 32) (_ BitVec 64))) (size!1496 (_ BitVec 32))) )
))
(declare-fun lt!17374 () array!2777)

(declare-fun arrayCountValidKeys!0 (array!2777 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42211 (= (arrayCountValidKeys!0 lt!17374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1095 0))(
  ( (Unit!1096) )
))
(declare-fun lt!17375 () Unit!1095)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2777 (_ BitVec 32) (_ BitVec 32)) Unit!1095)

(assert (=> b!42211 (= lt!17375 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42211 (= lt!17374 (array!2778 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6154 res!25137) b!42211))

(declare-fun m!35797 () Bool)

(assert (=> start!6154 m!35797))

(declare-fun m!35799 () Bool)

(assert (=> b!42211 m!35799))

(declare-fun m!35801 () Bool)

(assert (=> b!42211 m!35801))

(push 1)

(assert (not b!42211))

(assert (not start!6154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

