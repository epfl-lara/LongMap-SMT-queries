; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5346 () Bool)

(assert start!5346)

(declare-fun b!38389 () Bool)

(declare-fun e!24387 () Bool)

(declare-fun e!24386 () Bool)

(assert (=> b!38389 (= e!24387 (not e!24386))))

(declare-fun res!23161 () Bool)

(assert (=> b!38389 (=> res!23161 e!24386)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38389 (= res!23161 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2527 0))(
  ( (array!2528 (arr!1207 (Array (_ BitVec 32) (_ BitVec 64))) (size!1314 (_ BitVec 32))) )
))
(declare-fun lt!14317 () array!2527)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2527 (_ BitVec 32)) Bool)

(assert (=> b!38389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14317 mask!853)))

(declare-datatypes ((Unit!946 0))(
  ( (Unit!947) )
))
(declare-fun lt!14318 () Unit!946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2527 (_ BitVec 32) (_ BitVec 32)) Unit!946)

(assert (=> b!38389 (= lt!14318 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14317 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2527 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38389 (= (arrayCountValidKeys!0 lt!14317 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14316 () Unit!946)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2527 (_ BitVec 32) (_ BitVec 32)) Unit!946)

(assert (=> b!38389 (= lt!14316 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14317 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38389 (= lt!14317 (array!2528 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun res!23163 () Bool)

(assert (=> start!5346 (=> (not res!23163) (not e!24387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5346 (= res!23163 (validMask!0 mask!853))))

(assert (=> start!5346 e!24387))

(assert (=> start!5346 true))

(declare-fun b!38390 () Bool)

(declare-fun res!23162 () Bool)

(assert (=> b!38390 (=> res!23162 e!24386)))

(declare-datatypes ((List!1029 0))(
  ( (Nil!1026) (Cons!1025 (h!1593 (_ BitVec 64)) (t!3861 List!1029)) )
))
(declare-fun contains!490 (List!1029 (_ BitVec 64)) Bool)

(assert (=> b!38390 (= res!23162 (contains!490 Nil!1026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38391 () Bool)

(declare-fun res!23164 () Bool)

(assert (=> b!38391 (=> res!23164 e!24386)))

(assert (=> b!38391 (= res!23164 (contains!490 Nil!1026 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38392 () Bool)

(assert (=> b!38392 (= e!24386 true)))

(declare-fun lt!14315 () Bool)

(declare-fun noDuplicate!25 (List!1029) Bool)

(assert (=> b!38392 (= lt!14315 (noDuplicate!25 Nil!1026))))

(assert (= (and start!5346 res!23163) b!38389))

(assert (= (and b!38389 (not res!23161)) b!38390))

(assert (= (and b!38390 (not res!23162)) b!38391))

(assert (= (and b!38391 (not res!23164)) b!38392))

(declare-fun m!31045 () Bool)

(assert (=> b!38392 m!31045))

(declare-fun m!31047 () Bool)

(assert (=> b!38390 m!31047))

(declare-fun m!31049 () Bool)

(assert (=> b!38389 m!31049))

(declare-fun m!31051 () Bool)

(assert (=> b!38389 m!31051))

(declare-fun m!31053 () Bool)

(assert (=> b!38389 m!31053))

(declare-fun m!31055 () Bool)

(assert (=> b!38389 m!31055))

(declare-fun m!31057 () Bool)

(assert (=> start!5346 m!31057))

(declare-fun m!31059 () Bool)

(assert (=> b!38391 m!31059))

(push 1)

(assert (not b!38389))

(assert (not start!5346))

(assert (not b!38391))

(assert (not b!38392))

(assert (not b!38390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

