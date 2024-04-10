; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6158 () Bool)

(assert start!6158)

(declare-fun res!25143 () Bool)

(declare-fun e!26716 () Bool)

(assert (=> start!6158 (=> (not res!25143) (not e!26716))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6158 (= res!25143 (validMask!0 mask!853))))

(assert (=> start!6158 e!26716))

(assert (=> start!6158 true))

(declare-fun b!42217 () Bool)

(assert (=> b!42217 (= e!26716 (not true))))

(declare-datatypes ((array!2781 0))(
  ( (array!2782 (arr!1334 (Array (_ BitVec 32) (_ BitVec 64))) (size!1498 (_ BitVec 32))) )
))
(declare-fun lt!17386 () array!2781)

(declare-fun arrayCountValidKeys!0 (array!2781 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42217 (= (arrayCountValidKeys!0 lt!17386 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1099 0))(
  ( (Unit!1100) )
))
(declare-fun lt!17387 () Unit!1099)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2781 (_ BitVec 32) (_ BitVec 32)) Unit!1099)

(assert (=> b!42217 (= lt!17387 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17386 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42217 (= lt!17386 (array!2782 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6158 res!25143) b!42217))

(declare-fun m!35809 () Bool)

(assert (=> start!6158 m!35809))

(declare-fun m!35811 () Bool)

(assert (=> b!42217 m!35811))

(declare-fun m!35813 () Bool)

(assert (=> b!42217 m!35813))

(push 1)

(assert (not b!42217))

(assert (not start!6158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

