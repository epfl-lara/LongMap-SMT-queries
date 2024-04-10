; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6152 () Bool)

(assert start!6152)

(declare-fun res!25134 () Bool)

(declare-fun e!26707 () Bool)

(assert (=> start!6152 (=> (not res!25134) (not e!26707))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6152 (= res!25134 (validMask!0 mask!853))))

(assert (=> start!6152 e!26707))

(assert (=> start!6152 true))

(declare-fun b!42208 () Bool)

(assert (=> b!42208 (= e!26707 (not true))))

(declare-datatypes ((array!2775 0))(
  ( (array!2776 (arr!1331 (Array (_ BitVec 32) (_ BitVec 64))) (size!1495 (_ BitVec 32))) )
))
(declare-fun lt!17368 () array!2775)

(declare-fun arrayCountValidKeys!0 (array!2775 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42208 (= (arrayCountValidKeys!0 lt!17368 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1093 0))(
  ( (Unit!1094) )
))
(declare-fun lt!17369 () Unit!1093)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2775 (_ BitVec 32) (_ BitVec 32)) Unit!1093)

(assert (=> b!42208 (= lt!17369 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17368 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42208 (= lt!17368 (array!2776 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6152 res!25134) b!42208))

(declare-fun m!35791 () Bool)

(assert (=> start!6152 m!35791))

(declare-fun m!35793 () Bool)

(assert (=> b!42208 m!35793))

(declare-fun m!35795 () Bool)

(assert (=> b!42208 m!35795))

(push 1)

(assert (not b!42208))

