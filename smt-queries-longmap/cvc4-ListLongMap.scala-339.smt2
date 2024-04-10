; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6170 () Bool)

(assert start!6170)

(declare-fun res!25161 () Bool)

(declare-fun e!26734 () Bool)

(assert (=> start!6170 (=> (not res!25161) (not e!26734))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6170 (= res!25161 (validMask!0 mask!853))))

(assert (=> start!6170 e!26734))

(assert (=> start!6170 true))

(declare-fun b!42235 () Bool)

(assert (=> b!42235 (= e!26734 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2793 0))(
  ( (array!2794 (arr!1340 (Array (_ BitVec 32) (_ BitVec 64))) (size!1504 (_ BitVec 32))) )
))
(declare-fun lt!17422 () array!2793)

(declare-fun arrayCountValidKeys!0 (array!2793 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42235 (= (arrayCountValidKeys!0 lt!17422 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1111 0))(
  ( (Unit!1112) )
))
(declare-fun lt!17423 () Unit!1111)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2793 (_ BitVec 32) (_ BitVec 32)) Unit!1111)

(assert (=> b!42235 (= lt!17423 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17422 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42235 (= lt!17422 (array!2794 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6170 res!25161) b!42235))

(declare-fun m!35845 () Bool)

(assert (=> start!6170 m!35845))

(declare-fun m!35847 () Bool)

(assert (=> b!42235 m!35847))

(declare-fun m!35849 () Bool)

(assert (=> b!42235 m!35849))

(push 1)

(assert (not b!42235))

(assert (not start!6170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

