; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6158 () Bool)

(assert start!6158)

(declare-fun res!25126 () Bool)

(declare-fun e!26672 () Bool)

(assert (=> start!6158 (=> (not res!25126) (not e!26672))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6158 (= res!25126 (validMask!0 mask!853))))

(assert (=> start!6158 e!26672))

(assert (=> start!6158 true))

(declare-fun b!42146 () Bool)

(assert (=> b!42146 (= e!26672 (not true))))

(declare-datatypes ((array!2761 0))(
  ( (array!2762 (arr!1324 (Array (_ BitVec 32) (_ BitVec 64))) (size!1488 (_ BitVec 32))) )
))
(declare-fun lt!17386 () array!2761)

(declare-fun arrayCountValidKeys!0 (array!2761 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42146 (= (arrayCountValidKeys!0 lt!17386 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1112 0))(
  ( (Unit!1113) )
))
(declare-fun lt!17387 () Unit!1112)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2761 (_ BitVec 32) (_ BitVec 32)) Unit!1112)

(assert (=> b!42146 (= lt!17387 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17386 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42146 (= lt!17386 (array!2762 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6158 res!25126) b!42146))

(declare-fun m!35729 () Bool)

(assert (=> start!6158 m!35729))

(declare-fun m!35731 () Bool)

(assert (=> b!42146 m!35731))

(declare-fun m!35733 () Bool)

(assert (=> b!42146 m!35733))

(push 1)

(assert (not b!42146))

(assert (not start!6158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

