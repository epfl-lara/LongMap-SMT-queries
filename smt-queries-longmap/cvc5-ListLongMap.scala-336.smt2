; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6156 () Bool)

(assert start!6156)

(declare-fun res!25109 () Bool)

(declare-fun e!26670 () Bool)

(assert (=> start!6156 (=> (not res!25109) (not e!26670))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6156 (= res!25109 (validMask!0 mask!853))))

(assert (=> start!6156 e!26670))

(assert (=> start!6156 true))

(declare-fun b!42151 () Bool)

(assert (=> b!42151 (= e!26670 (not true))))

(declare-datatypes ((array!2761 0))(
  ( (array!2762 (arr!1324 (Array (_ BitVec 32) (_ BitVec 64))) (size!1488 (_ BitVec 32))) )
))
(declare-fun lt!17325 () array!2761)

(declare-fun arrayCountValidKeys!0 (array!2761 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42151 (= (arrayCountValidKeys!0 lt!17325 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1105 0))(
  ( (Unit!1106) )
))
(declare-fun lt!17326 () Unit!1105)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2761 (_ BitVec 32) (_ BitVec 32)) Unit!1105)

(assert (=> b!42151 (= lt!17326 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17325 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42151 (= lt!17325 (array!2762 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6156 res!25109) b!42151))

(declare-fun m!35665 () Bool)

(assert (=> start!6156 m!35665))

(declare-fun m!35667 () Bool)

(assert (=> b!42151 m!35667))

(declare-fun m!35669 () Bool)

(assert (=> b!42151 m!35669))

(push 1)

(assert (not start!6156))

(assert (not b!42151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

