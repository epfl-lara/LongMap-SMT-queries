; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5328 () Bool)

(assert start!5328)

(declare-fun b!38281 () Bool)

(declare-fun e!24332 () Bool)

(declare-fun e!24333 () Bool)

(assert (=> b!38281 (= e!24332 (not e!24333))))

(declare-fun res!23053 () Bool)

(assert (=> b!38281 (=> res!23053 e!24333)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38281 (= res!23053 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2509 0))(
  ( (array!2510 (arr!1198 (Array (_ BitVec 32) (_ BitVec 64))) (size!1305 (_ BitVec 32))) )
))
(declare-fun lt!14207 () array!2509)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2509 (_ BitVec 32)) Bool)

(assert (=> b!38281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14207 mask!853)))

(declare-datatypes ((Unit!928 0))(
  ( (Unit!929) )
))
(declare-fun lt!14209 () Unit!928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2509 (_ BitVec 32) (_ BitVec 32)) Unit!928)

(assert (=> b!38281 (= lt!14209 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14207 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2509 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38281 (= (arrayCountValidKeys!0 lt!14207 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14208 () Unit!928)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2509 (_ BitVec 32) (_ BitVec 32)) Unit!928)

(assert (=> b!38281 (= lt!14208 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14207 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38281 (= lt!14207 (array!2510 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38283 () Bool)

(declare-fun res!23055 () Bool)

(assert (=> b!38283 (=> res!23055 e!24333)))

(declare-datatypes ((List!1020 0))(
  ( (Nil!1017) (Cons!1016 (h!1584 (_ BitVec 64)) (t!3852 List!1020)) )
))
(declare-fun contains!481 (List!1020 (_ BitVec 64)) Bool)

(assert (=> b!38283 (= res!23055 (contains!481 Nil!1017 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23056 () Bool)

(assert (=> start!5328 (=> (not res!23056) (not e!24332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5328 (= res!23056 (validMask!0 mask!853))))

(assert (=> start!5328 e!24332))

(assert (=> start!5328 true))

(declare-fun b!38282 () Bool)

(declare-fun res!23054 () Bool)

(assert (=> b!38282 (=> res!23054 e!24333)))

(assert (=> b!38282 (= res!23054 (contains!481 Nil!1017 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38284 () Bool)

(assert (=> b!38284 (= e!24333 true)))

(declare-fun lt!14210 () Bool)

(declare-fun noDuplicate!16 (List!1020) Bool)

(assert (=> b!38284 (= lt!14210 (noDuplicate!16 Nil!1017))))

(assert (= (and start!5328 res!23056) b!38281))

(assert (= (and b!38281 (not res!23053)) b!38282))

(assert (= (and b!38282 (not res!23054)) b!38283))

(assert (= (and b!38283 (not res!23055)) b!38284))

(declare-fun m!30901 () Bool)

(assert (=> b!38282 m!30901))

(declare-fun m!30903 () Bool)

(assert (=> b!38281 m!30903))

(declare-fun m!30905 () Bool)

(assert (=> b!38281 m!30905))

(declare-fun m!30907 () Bool)

(assert (=> b!38281 m!30907))

(declare-fun m!30909 () Bool)

(assert (=> b!38281 m!30909))

(declare-fun m!30911 () Bool)

(assert (=> start!5328 m!30911))

(declare-fun m!30913 () Bool)

(assert (=> b!38283 m!30913))

(declare-fun m!30915 () Bool)

(assert (=> b!38284 m!30915))

(push 1)

(assert (not b!38281))

(assert (not b!38283))

(assert (not b!38284))

(assert (not b!38282))

(assert (not start!5328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

