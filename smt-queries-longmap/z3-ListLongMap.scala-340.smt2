; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6192 () Bool)

(assert start!6192)

(declare-fun res!25167 () Bool)

(declare-fun e!26758 () Bool)

(assert (=> start!6192 (=> (not res!25167) (not e!26758))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6192 (= res!25167 (validMask!0 mask!853))))

(assert (=> start!6192 e!26758))

(assert (=> start!6192 true))

(declare-fun b!42277 () Bool)

(assert (=> b!42277 (= e!26758 (not true))))

(declare-datatypes ((array!2797 0))(
  ( (array!2798 (arr!1342 (Array (_ BitVec 32) (_ BitVec 64))) (size!1509 (_ BitVec 32))) )
))
(declare-fun lt!17459 () array!2797)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2797 (_ BitVec 32)) Bool)

(assert (=> b!42277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17459 mask!853)))

(declare-datatypes ((Unit!1115 0))(
  ( (Unit!1116) )
))
(declare-fun lt!17457 () Unit!1115)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2797 (_ BitVec 32) (_ BitVec 32)) Unit!1115)

(assert (=> b!42277 (= lt!17457 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17459 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2797 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42277 (= (arrayCountValidKeys!0 lt!17459 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17458 () Unit!1115)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2797 (_ BitVec 32) (_ BitVec 32)) Unit!1115)

(assert (=> b!42277 (= lt!17458 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17459 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42277 (= lt!17459 (array!2798 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6192 res!25167) b!42277))

(declare-fun m!35883 () Bool)

(assert (=> start!6192 m!35883))

(declare-fun m!35885 () Bool)

(assert (=> b!42277 m!35885))

(declare-fun m!35887 () Bool)

(assert (=> b!42277 m!35887))

(declare-fun m!35889 () Bool)

(assert (=> b!42277 m!35889))

(declare-fun m!35891 () Bool)

(assert (=> b!42277 m!35891))

(check-sat (not start!6192) (not b!42277))
(check-sat)
