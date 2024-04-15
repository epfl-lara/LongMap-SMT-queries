; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6150 () Bool)

(assert start!6150)

(declare-fun res!25114 () Bool)

(declare-fun e!26660 () Bool)

(assert (=> start!6150 (=> (not res!25114) (not e!26660))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6150 (= res!25114 (validMask!0 mask!853))))

(assert (=> start!6150 e!26660))

(assert (=> start!6150 true))

(declare-fun b!42134 () Bool)

(assert (=> b!42134 (= e!26660 (not true))))

(declare-datatypes ((array!2753 0))(
  ( (array!2754 (arr!1320 (Array (_ BitVec 32) (_ BitVec 64))) (size!1484 (_ BitVec 32))) )
))
(declare-fun lt!17362 () array!2753)

(declare-fun arrayCountValidKeys!0 (array!2753 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42134 (= (arrayCountValidKeys!0 lt!17362 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1104 0))(
  ( (Unit!1105) )
))
(declare-fun lt!17363 () Unit!1104)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2753 (_ BitVec 32) (_ BitVec 32)) Unit!1104)

(assert (=> b!42134 (= lt!17363 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17362 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42134 (= lt!17362 (array!2754 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6150 res!25114) b!42134))

(declare-fun m!35705 () Bool)

(assert (=> start!6150 m!35705))

(declare-fun m!35707 () Bool)

(assert (=> b!42134 m!35707))

(declare-fun m!35709 () Bool)

(assert (=> b!42134 m!35709))

(push 1)

(assert (not b!42134))

(assert (not start!6150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

