; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6234 () Bool)

(assert start!6234)

(declare-fun res!25203 () Bool)

(declare-fun e!26821 () Bool)

(assert (=> start!6234 (=> (not res!25203) (not e!26821))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6234 (= res!25203 (validMask!0 mask!853))))

(assert (=> start!6234 e!26821))

(assert (=> start!6234 true))

(declare-fun b!42367 () Bool)

(assert (=> b!42367 (= e!26821 (not true))))

(declare-datatypes ((array!2809 0))(
  ( (array!2810 (arr!1348 (Array (_ BitVec 32) (_ BitVec 64))) (size!1518 (_ BitVec 32))) )
))
(declare-fun lt!17567 () array!2809)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2809 (_ BitVec 32)) Bool)

(assert (=> b!42367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17567 mask!853)))

(declare-datatypes ((Unit!1127 0))(
  ( (Unit!1128) )
))
(declare-fun lt!17565 () Unit!1127)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2809 (_ BitVec 32) (_ BitVec 32)) Unit!1127)

(assert (=> b!42367 (= lt!17565 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17567 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2809 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42367 (= (arrayCountValidKeys!0 lt!17567 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17566 () Unit!1127)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2809 (_ BitVec 32) (_ BitVec 32)) Unit!1127)

(assert (=> b!42367 (= lt!17566 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17567 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42367 (= lt!17567 (array!2810 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6234 res!25203) b!42367))

(declare-fun m!35997 () Bool)

(assert (=> start!6234 m!35997))

(declare-fun m!35999 () Bool)

(assert (=> b!42367 m!35999))

(declare-fun m!36001 () Bool)

(assert (=> b!42367 m!36001))

(declare-fun m!36003 () Bool)

(assert (=> b!42367 m!36003))

(declare-fun m!36005 () Bool)

(assert (=> b!42367 m!36005))

(check-sat (not b!42367) (not start!6234))
