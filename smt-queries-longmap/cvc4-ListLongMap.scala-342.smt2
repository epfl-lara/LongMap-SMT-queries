; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6238 () Bool)

(assert start!6238)

(declare-fun res!25178 () Bool)

(declare-fun e!26784 () Bool)

(assert (=> start!6238 (=> (not res!25178) (not e!26784))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6238 (= res!25178 (validMask!0 mask!853))))

(assert (=> start!6238 e!26784))

(assert (=> start!6238 true))

(declare-fun b!42310 () Bool)

(assert (=> b!42310 (= e!26784 (not true))))

(declare-datatypes ((array!2795 0))(
  ( (array!2796 (arr!1341 (Array (_ BitVec 32) (_ BitVec 64))) (size!1511 (_ BitVec 32))) )
))
(declare-fun lt!17522 () array!2795)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2795 (_ BitVec 32)) Bool)

(assert (=> b!42310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17522 mask!853)))

(declare-datatypes ((Unit!1139 0))(
  ( (Unit!1140) )
))
(declare-fun lt!17524 () Unit!1139)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2795 (_ BitVec 32) (_ BitVec 32)) Unit!1139)

(assert (=> b!42310 (= lt!17524 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17522 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2795 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42310 (= (arrayCountValidKeys!0 lt!17522 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17523 () Unit!1139)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2795 (_ BitVec 32) (_ BitVec 32)) Unit!1139)

(assert (=> b!42310 (= lt!17523 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17522 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42310 (= lt!17522 (array!2796 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6238 res!25178) b!42310))

(declare-fun m!35873 () Bool)

(assert (=> start!6238 m!35873))

(declare-fun m!35875 () Bool)

(assert (=> b!42310 m!35875))

(declare-fun m!35877 () Bool)

(assert (=> b!42310 m!35877))

(declare-fun m!35879 () Bool)

(assert (=> b!42310 m!35879))

(declare-fun m!35881 () Bool)

(assert (=> b!42310 m!35881))

(push 1)

(assert (not b!42310))

(assert (not start!6238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

