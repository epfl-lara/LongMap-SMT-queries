; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6156 () Bool)

(assert start!6156)

(declare-fun res!25140 () Bool)

(declare-fun e!26713 () Bool)

(assert (=> start!6156 (=> (not res!25140) (not e!26713))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6156 (= res!25140 (validMask!0 mask!853))))

(assert (=> start!6156 e!26713))

(assert (=> start!6156 true))

(declare-fun b!42214 () Bool)

(assert (=> b!42214 (= e!26713 (not true))))

(declare-datatypes ((array!2779 0))(
  ( (array!2780 (arr!1333 (Array (_ BitVec 32) (_ BitVec 64))) (size!1497 (_ BitVec 32))) )
))
(declare-fun lt!17380 () array!2779)

(declare-fun arrayCountValidKeys!0 (array!2779 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42214 (= (arrayCountValidKeys!0 lt!17380 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1097 0))(
  ( (Unit!1098) )
))
(declare-fun lt!17381 () Unit!1097)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2779 (_ BitVec 32) (_ BitVec 32)) Unit!1097)

(assert (=> b!42214 (= lt!17381 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17380 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42214 (= lt!17380 (array!2780 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6156 res!25140) b!42214))

(declare-fun m!35803 () Bool)

(assert (=> start!6156 m!35803))

(declare-fun m!35805 () Bool)

(assert (=> b!42214 m!35805))

(declare-fun m!35807 () Bool)

(assert (=> b!42214 m!35807))

(check-sat (not b!42214) (not start!6156))
(check-sat)
