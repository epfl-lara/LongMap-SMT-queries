; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5342 () Bool)

(assert start!5342)

(declare-fun b!38392 () Bool)

(declare-fun e!24396 () Bool)

(declare-fun e!24397 () Bool)

(assert (=> b!38392 (= e!24396 (not e!24397))))

(declare-fun res!23142 () Bool)

(assert (=> b!38392 (=> res!23142 e!24397)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38392 (= res!23142 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2547 0))(
  ( (array!2548 (arr!1217 (Array (_ BitVec 32) (_ BitVec 64))) (size!1324 (_ BitVec 32))) )
))
(declare-fun lt!14282 () array!2547)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2547 (_ BitVec 32)) Bool)

(assert (=> b!38392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14282 mask!853)))

(declare-datatypes ((Unit!939 0))(
  ( (Unit!940) )
))
(declare-fun lt!14283 () Unit!939)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2547 (_ BitVec 32) (_ BitVec 32)) Unit!939)

(assert (=> b!38392 (= lt!14283 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14282 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2547 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38392 (= (arrayCountValidKeys!0 lt!14282 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14285 () Unit!939)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2547 (_ BitVec 32) (_ BitVec 32)) Unit!939)

(assert (=> b!38392 (= lt!14285 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14282 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38392 (= lt!14282 (array!2548 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38395 () Bool)

(assert (=> b!38395 (= e!24397 true)))

(declare-fun lt!14284 () Bool)

(declare-datatypes ((List!1033 0))(
  ( (Nil!1030) (Cons!1029 (h!1597 (_ BitVec 64)) (t!3866 List!1033)) )
))
(declare-fun noDuplicate!24 (List!1033) Bool)

(assert (=> b!38395 (= lt!14284 (noDuplicate!24 Nil!1030))))

(declare-fun res!23143 () Bool)

(assert (=> start!5342 (=> (not res!23143) (not e!24396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5342 (= res!23143 (validMask!0 mask!853))))

(assert (=> start!5342 e!24396))

(assert (=> start!5342 true))

(declare-fun b!38393 () Bool)

(declare-fun res!23144 () Bool)

(assert (=> b!38393 (=> res!23144 e!24397)))

(declare-fun contains!490 (List!1033 (_ BitVec 64)) Bool)

(assert (=> b!38393 (= res!23144 (contains!490 Nil!1030 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38394 () Bool)

(declare-fun res!23145 () Bool)

(assert (=> b!38394 (=> res!23145 e!24397)))

(assert (=> b!38394 (= res!23145 (contains!490 Nil!1030 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5342 res!23143) b!38392))

(assert (= (and b!38392 (not res!23142)) b!38393))

(assert (= (and b!38393 (not res!23144)) b!38394))

(assert (= (and b!38394 (not res!23145)) b!38395))

(declare-fun m!31041 () Bool)

(assert (=> b!38394 m!31041))

(declare-fun m!31043 () Bool)

(assert (=> b!38395 m!31043))

(declare-fun m!31045 () Bool)

(assert (=> start!5342 m!31045))

(declare-fun m!31047 () Bool)

(assert (=> b!38392 m!31047))

(declare-fun m!31049 () Bool)

(assert (=> b!38392 m!31049))

(declare-fun m!31051 () Bool)

(assert (=> b!38392 m!31051))

(declare-fun m!31053 () Bool)

(assert (=> b!38392 m!31053))

(declare-fun m!31055 () Bool)

(assert (=> b!38393 m!31055))

(push 1)

(assert (not b!38393))

(assert (not b!38395))

(assert (not start!5342))

(assert (not b!38394))

(assert (not b!38392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

