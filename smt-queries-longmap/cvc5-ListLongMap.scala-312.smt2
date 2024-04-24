; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5352 () Bool)

(assert start!5352)

(declare-fun b!38373 () Bool)

(declare-fun res!23153 () Bool)

(declare-fun e!24377 () Bool)

(assert (=> b!38373 (=> res!23153 e!24377)))

(declare-datatypes ((List!1022 0))(
  ( (Nil!1019) (Cons!1018 (h!1586 (_ BitVec 64)) (t!3855 List!1022)) )
))
(declare-fun contains!483 (List!1022 (_ BitVec 64)) Bool)

(assert (=> b!38373 (= res!23153 (contains!483 Nil!1019 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38374 () Bool)

(assert (=> b!38374 (= e!24377 true)))

(declare-fun lt!14277 () Bool)

(declare-fun noDuplicate!23 (List!1022) Bool)

(assert (=> b!38374 (= lt!14277 (noDuplicate!23 Nil!1019))))

(declare-fun res!23156 () Bool)

(declare-fun e!24378 () Bool)

(assert (=> start!5352 (=> (not res!23156) (not e!24378))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5352 (= res!23156 (validMask!0 mask!853))))

(assert (=> start!5352 e!24378))

(assert (=> start!5352 true))

(declare-fun b!38372 () Bool)

(declare-fun res!23155 () Bool)

(assert (=> b!38372 (=> res!23155 e!24377)))

(assert (=> b!38372 (= res!23155 (contains!483 Nil!1019 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38371 () Bool)

(assert (=> b!38371 (= e!24378 (not e!24377))))

(declare-fun res!23154 () Bool)

(assert (=> b!38371 (=> res!23154 e!24377)))

(assert (=> b!38371 (= res!23154 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2539 0))(
  ( (array!2540 (arr!1213 (Array (_ BitVec 32) (_ BitVec 64))) (size!1320 (_ BitVec 32))) )
))
(declare-fun lt!14276 () array!2539)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2539 (_ BitVec 32)) Bool)

(assert (=> b!38371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14276 mask!853)))

(declare-datatypes ((Unit!951 0))(
  ( (Unit!952) )
))
(declare-fun lt!14275 () Unit!951)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2539 (_ BitVec 32) (_ BitVec 32)) Unit!951)

(assert (=> b!38371 (= lt!14275 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14276 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2539 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38371 (= (arrayCountValidKeys!0 lt!14276 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14278 () Unit!951)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2539 (_ BitVec 32) (_ BitVec 32)) Unit!951)

(assert (=> b!38371 (= lt!14278 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14276 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38371 (= lt!14276 (array!2540 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5352 res!23156) b!38371))

(assert (= (and b!38371 (not res!23154)) b!38372))

(assert (= (and b!38372 (not res!23155)) b!38373))

(assert (= (and b!38373 (not res!23153)) b!38374))

(declare-fun m!30963 () Bool)

(assert (=> start!5352 m!30963))

(declare-fun m!30965 () Bool)

(assert (=> b!38374 m!30965))

(declare-fun m!30967 () Bool)

(assert (=> b!38373 m!30967))

(declare-fun m!30969 () Bool)

(assert (=> b!38371 m!30969))

(declare-fun m!30971 () Bool)

(assert (=> b!38371 m!30971))

(declare-fun m!30973 () Bool)

(assert (=> b!38371 m!30973))

(declare-fun m!30975 () Bool)

(assert (=> b!38371 m!30975))

(declare-fun m!30977 () Bool)

(assert (=> b!38372 m!30977))

(push 1)

(assert (not b!38372))

(assert (not start!5352))

(assert (not b!38371))

(assert (not b!38374))

(assert (not b!38373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

