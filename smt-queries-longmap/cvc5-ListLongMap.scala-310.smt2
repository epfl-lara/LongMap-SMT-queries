; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5334 () Bool)

(assert start!5334)

(declare-fun b!38320 () Bool)

(declare-fun e!24351 () Bool)

(assert (=> b!38320 (= e!24351 true)))

(declare-fun lt!14244 () Bool)

(declare-datatypes ((List!1023 0))(
  ( (Nil!1020) (Cons!1019 (h!1587 (_ BitVec 64)) (t!3855 List!1023)) )
))
(declare-fun noDuplicate!19 (List!1023) Bool)

(assert (=> b!38320 (= lt!14244 (noDuplicate!19 Nil!1020))))

(declare-fun b!38319 () Bool)

(declare-fun res!23092 () Bool)

(assert (=> b!38319 (=> res!23092 e!24351)))

(declare-fun contains!484 (List!1023 (_ BitVec 64)) Bool)

(assert (=> b!38319 (= res!23092 (contains!484 Nil!1020 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38318 () Bool)

(declare-fun res!23091 () Bool)

(assert (=> b!38318 (=> res!23091 e!24351)))

(assert (=> b!38318 (= res!23091 (contains!484 Nil!1020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23090 () Bool)

(declare-fun e!24350 () Bool)

(assert (=> start!5334 (=> (not res!23090) (not e!24350))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5334 (= res!23090 (validMask!0 mask!853))))

(assert (=> start!5334 e!24350))

(assert (=> start!5334 true))

(declare-fun b!38317 () Bool)

(assert (=> b!38317 (= e!24350 (not e!24351))))

(declare-fun res!23089 () Bool)

(assert (=> b!38317 (=> res!23089 e!24351)))

(assert (=> b!38317 (= res!23089 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2515 0))(
  ( (array!2516 (arr!1201 (Array (_ BitVec 32) (_ BitVec 64))) (size!1308 (_ BitVec 32))) )
))
(declare-fun lt!14246 () array!2515)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2515 (_ BitVec 32)) Bool)

(assert (=> b!38317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14246 mask!853)))

(declare-datatypes ((Unit!934 0))(
  ( (Unit!935) )
))
(declare-fun lt!14243 () Unit!934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2515 (_ BitVec 32) (_ BitVec 32)) Unit!934)

(assert (=> b!38317 (= lt!14243 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14246 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2515 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38317 (= (arrayCountValidKeys!0 lt!14246 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14245 () Unit!934)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2515 (_ BitVec 32) (_ BitVec 32)) Unit!934)

(assert (=> b!38317 (= lt!14245 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14246 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38317 (= lt!14246 (array!2516 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5334 res!23090) b!38317))

(assert (= (and b!38317 (not res!23089)) b!38318))

(assert (= (and b!38318 (not res!23091)) b!38319))

(assert (= (and b!38319 (not res!23092)) b!38320))

(declare-fun m!30949 () Bool)

(assert (=> start!5334 m!30949))

(declare-fun m!30951 () Bool)

(assert (=> b!38319 m!30951))

(declare-fun m!30953 () Bool)

(assert (=> b!38317 m!30953))

(declare-fun m!30955 () Bool)

(assert (=> b!38317 m!30955))

(declare-fun m!30957 () Bool)

(assert (=> b!38317 m!30957))

(declare-fun m!30959 () Bool)

(assert (=> b!38317 m!30959))

(declare-fun m!30961 () Bool)

(assert (=> b!38318 m!30961))

(declare-fun m!30963 () Bool)

(assert (=> b!38320 m!30963))

(push 1)

(assert (not start!5334))

(assert (not b!38320))

(assert (not b!38319))

(assert (not b!38317))

(assert (not b!38318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

