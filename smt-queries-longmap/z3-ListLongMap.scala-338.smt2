; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6162 () Bool)

(assert start!6162)

(declare-fun res!25149 () Bool)

(declare-fun e!26722 () Bool)

(assert (=> start!6162 (=> (not res!25149) (not e!26722))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6162 (= res!25149 (validMask!0 mask!853))))

(assert (=> start!6162 e!26722))

(assert (=> start!6162 true))

(declare-fun b!42223 () Bool)

(assert (=> b!42223 (= e!26722 (not true))))

(declare-datatypes ((array!2785 0))(
  ( (array!2786 (arr!1336 (Array (_ BitVec 32) (_ BitVec 64))) (size!1500 (_ BitVec 32))) )
))
(declare-fun lt!17398 () array!2785)

(declare-fun arrayCountValidKeys!0 (array!2785 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42223 (= (arrayCountValidKeys!0 lt!17398 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1103 0))(
  ( (Unit!1104) )
))
(declare-fun lt!17399 () Unit!1103)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2785 (_ BitVec 32) (_ BitVec 32)) Unit!1103)

(assert (=> b!42223 (= lt!17399 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17398 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42223 (= lt!17398 (array!2786 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6162 res!25149) b!42223))

(declare-fun m!35821 () Bool)

(assert (=> start!6162 m!35821))

(declare-fun m!35823 () Bool)

(assert (=> b!42223 m!35823))

(declare-fun m!35825 () Bool)

(assert (=> b!42223 m!35825))

(check-sat (not b!42223) (not start!6162))
