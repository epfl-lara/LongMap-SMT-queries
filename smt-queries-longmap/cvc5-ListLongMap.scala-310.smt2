; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5332 () Bool)

(assert start!5332)

(declare-fun b!38334 () Bool)

(declare-fun res!23082 () Bool)

(declare-fun e!24367 () Bool)

(assert (=> b!38334 (=> res!23082 e!24367)))

(declare-datatypes ((List!1028 0))(
  ( (Nil!1025) (Cons!1024 (h!1592 (_ BitVec 64)) (t!3861 List!1028)) )
))
(declare-fun contains!485 (List!1028 (_ BitVec 64)) Bool)

(assert (=> b!38334 (= res!23082 (contains!485 Nil!1025 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38335 () Bool)

(assert (=> b!38335 (= e!24367 true)))

(declare-fun lt!14222 () Bool)

(declare-fun noDuplicate!19 (List!1028) Bool)

(assert (=> b!38335 (= lt!14222 (noDuplicate!19 Nil!1025))))

(declare-fun b!38332 () Bool)

(declare-fun e!24366 () Bool)

(assert (=> b!38332 (= e!24366 (not e!24367))))

(declare-fun res!23084 () Bool)

(assert (=> b!38332 (=> res!23084 e!24367)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38332 (= res!23084 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2537 0))(
  ( (array!2538 (arr!1212 (Array (_ BitVec 32) (_ BitVec 64))) (size!1319 (_ BitVec 32))) )
))
(declare-fun lt!14225 () array!2537)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2537 (_ BitVec 32)) Bool)

(assert (=> b!38332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14225 mask!853)))

(declare-datatypes ((Unit!929 0))(
  ( (Unit!930) )
))
(declare-fun lt!14223 () Unit!929)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2537 (_ BitVec 32) (_ BitVec 32)) Unit!929)

(assert (=> b!38332 (= lt!14223 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14225 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2537 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38332 (= (arrayCountValidKeys!0 lt!14225 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14224 () Unit!929)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2537 (_ BitVec 32) (_ BitVec 32)) Unit!929)

(assert (=> b!38332 (= lt!14224 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14225 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38332 (= lt!14225 (array!2538 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun res!23085 () Bool)

(assert (=> start!5332 (=> (not res!23085) (not e!24366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5332 (= res!23085 (validMask!0 mask!853))))

(assert (=> start!5332 e!24366))

(assert (=> start!5332 true))

(declare-fun b!38333 () Bool)

(declare-fun res!23083 () Bool)

(assert (=> b!38333 (=> res!23083 e!24367)))

(assert (=> b!38333 (= res!23083 (contains!485 Nil!1025 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5332 res!23085) b!38332))

(assert (= (and b!38332 (not res!23084)) b!38333))

(assert (= (and b!38333 (not res!23083)) b!38334))

(assert (= (and b!38334 (not res!23082)) b!38335))

(declare-fun m!30961 () Bool)

(assert (=> b!38335 m!30961))

(declare-fun m!30963 () Bool)

(assert (=> b!38334 m!30963))

(declare-fun m!30965 () Bool)

(assert (=> b!38333 m!30965))

(declare-fun m!30967 () Bool)

(assert (=> start!5332 m!30967))

(declare-fun m!30969 () Bool)

(assert (=> b!38332 m!30969))

(declare-fun m!30971 () Bool)

(assert (=> b!38332 m!30971))

(declare-fun m!30973 () Bool)

(assert (=> b!38332 m!30973))

(declare-fun m!30975 () Bool)

(assert (=> b!38332 m!30975))

(push 1)

(assert (not b!38333))

(assert (not start!5332))

(assert (not b!38332))

(assert (not b!38335))

(assert (not b!38334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

