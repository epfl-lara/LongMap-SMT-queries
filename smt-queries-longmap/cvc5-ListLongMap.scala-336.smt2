; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6148 () Bool)

(assert start!6148)

(declare-fun res!25128 () Bool)

(declare-fun e!26701 () Bool)

(assert (=> start!6148 (=> (not res!25128) (not e!26701))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6148 (= res!25128 (validMask!0 mask!853))))

(assert (=> start!6148 e!26701))

(assert (=> start!6148 true))

(declare-fun b!42202 () Bool)

(assert (=> b!42202 (= e!26701 (not true))))

(declare-datatypes ((array!2771 0))(
  ( (array!2772 (arr!1329 (Array (_ BitVec 32) (_ BitVec 64))) (size!1493 (_ BitVec 32))) )
))
(declare-fun lt!17356 () array!2771)

(declare-fun arrayCountValidKeys!0 (array!2771 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42202 (= (arrayCountValidKeys!0 lt!17356 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1089 0))(
  ( (Unit!1090) )
))
(declare-fun lt!17357 () Unit!1089)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2771 (_ BitVec 32) (_ BitVec 32)) Unit!1089)

(assert (=> b!42202 (= lt!17357 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17356 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42202 (= lt!17356 (array!2772 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6148 res!25128) b!42202))

(declare-fun m!35779 () Bool)

(assert (=> start!6148 m!35779))

(declare-fun m!35781 () Bool)

(assert (=> b!42202 m!35781))

(declare-fun m!35783 () Bool)

(assert (=> b!42202 m!35783))

(push 1)

(assert (not start!6148))

(assert (not b!42202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

