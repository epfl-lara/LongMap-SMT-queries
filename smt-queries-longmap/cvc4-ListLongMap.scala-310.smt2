; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5336 () Bool)

(assert start!5336)

(declare-fun b!38358 () Bool)

(declare-fun res!23109 () Bool)

(declare-fun e!24378 () Bool)

(assert (=> b!38358 (=> res!23109 e!24378)))

(declare-datatypes ((List!1030 0))(
  ( (Nil!1027) (Cons!1026 (h!1594 (_ BitVec 64)) (t!3863 List!1030)) )
))
(declare-fun contains!487 (List!1030 (_ BitVec 64)) Bool)

(assert (=> b!38358 (= res!23109 (contains!487 Nil!1027 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38356 () Bool)

(declare-fun e!24379 () Bool)

(assert (=> b!38356 (= e!24379 (not e!24378))))

(declare-fun res!23106 () Bool)

(assert (=> b!38356 (=> res!23106 e!24378)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38356 (= res!23106 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2541 0))(
  ( (array!2542 (arr!1214 (Array (_ BitVec 32) (_ BitVec 64))) (size!1321 (_ BitVec 32))) )
))
(declare-fun lt!14246 () array!2541)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2541 (_ BitVec 32)) Bool)

(assert (=> b!38356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14246 mask!853)))

(declare-datatypes ((Unit!933 0))(
  ( (Unit!934) )
))
(declare-fun lt!14249 () Unit!933)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2541 (_ BitVec 32) (_ BitVec 32)) Unit!933)

(assert (=> b!38356 (= lt!14249 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14246 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38356 (= (arrayCountValidKeys!0 lt!14246 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14248 () Unit!933)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2541 (_ BitVec 32) (_ BitVec 32)) Unit!933)

(assert (=> b!38356 (= lt!14248 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14246 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38356 (= lt!14246 (array!2542 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38359 () Bool)

(assert (=> b!38359 (= e!24378 true)))

(declare-fun lt!14247 () Bool)

(declare-fun noDuplicate!21 (List!1030) Bool)

(assert (=> b!38359 (= lt!14247 (noDuplicate!21 Nil!1027))))

(declare-fun res!23107 () Bool)

(assert (=> start!5336 (=> (not res!23107) (not e!24379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5336 (= res!23107 (validMask!0 mask!853))))

(assert (=> start!5336 e!24379))

(assert (=> start!5336 true))

(declare-fun b!38357 () Bool)

(declare-fun res!23108 () Bool)

(assert (=> b!38357 (=> res!23108 e!24378)))

(assert (=> b!38357 (= res!23108 (contains!487 Nil!1027 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5336 res!23107) b!38356))

(assert (= (and b!38356 (not res!23106)) b!38357))

(assert (= (and b!38357 (not res!23108)) b!38358))

(assert (= (and b!38358 (not res!23109)) b!38359))

(declare-fun m!30993 () Bool)

(assert (=> b!38359 m!30993))

(declare-fun m!30995 () Bool)

(assert (=> b!38356 m!30995))

(declare-fun m!30997 () Bool)

(assert (=> b!38356 m!30997))

(declare-fun m!30999 () Bool)

(assert (=> b!38356 m!30999))

(declare-fun m!31001 () Bool)

(assert (=> b!38356 m!31001))

(declare-fun m!31003 () Bool)

(assert (=> b!38358 m!31003))

(declare-fun m!31005 () Bool)

(assert (=> b!38357 m!31005))

(declare-fun m!31007 () Bool)

(assert (=> start!5336 m!31007))

(push 1)

(assert (not b!38358))

(assert (not b!38357))

(assert (not start!5336))

(assert (not b!38359))

(assert (not b!38356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

