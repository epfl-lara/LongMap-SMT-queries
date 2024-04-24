; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6160 () Bool)

(assert start!6160)

(declare-fun res!25115 () Bool)

(declare-fun e!26676 () Bool)

(assert (=> start!6160 (=> (not res!25115) (not e!26676))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6160 (= res!25115 (validMask!0 mask!853))))

(assert (=> start!6160 e!26676))

(assert (=> start!6160 true))

(declare-fun b!42157 () Bool)

(assert (=> b!42157 (= e!26676 (not true))))

(declare-datatypes ((array!2765 0))(
  ( (array!2766 (arr!1326 (Array (_ BitVec 32) (_ BitVec 64))) (size!1490 (_ BitVec 32))) )
))
(declare-fun lt!17337 () array!2765)

(declare-fun arrayCountValidKeys!0 (array!2765 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42157 (= (arrayCountValidKeys!0 lt!17337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1109 0))(
  ( (Unit!1110) )
))
(declare-fun lt!17338 () Unit!1109)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2765 (_ BitVec 32) (_ BitVec 32)) Unit!1109)

(assert (=> b!42157 (= lt!17338 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42157 (= lt!17337 (array!2766 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6160 res!25115) b!42157))

(declare-fun m!35677 () Bool)

(assert (=> start!6160 m!35677))

(declare-fun m!35679 () Bool)

(assert (=> b!42157 m!35679))

(declare-fun m!35681 () Bool)

(assert (=> b!42157 m!35681))

(push 1)

(assert (not b!42157))

(assert (not start!6160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

