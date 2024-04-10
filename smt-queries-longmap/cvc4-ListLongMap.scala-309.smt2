; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5330 () Bool)

(assert start!5330)

(declare-fun b!38323 () Bool)

(declare-fun e!24361 () Bool)

(assert (=> b!38323 (= e!24361 true)))

(declare-fun lt!14211 () Bool)

(declare-datatypes ((List!1027 0))(
  ( (Nil!1024) (Cons!1023 (h!1591 (_ BitVec 64)) (t!3860 List!1027)) )
))
(declare-fun noDuplicate!18 (List!1027) Bool)

(assert (=> b!38323 (= lt!14211 (noDuplicate!18 Nil!1024))))

(declare-fun b!38322 () Bool)

(declare-fun res!23070 () Bool)

(assert (=> b!38322 (=> res!23070 e!24361)))

(declare-fun contains!484 (List!1027 (_ BitVec 64)) Bool)

(assert (=> b!38322 (= res!23070 (contains!484 Nil!1024 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23072 () Bool)

(declare-fun e!24360 () Bool)

(assert (=> start!5330 (=> (not res!23072) (not e!24360))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5330 (= res!23072 (validMask!0 mask!853))))

(assert (=> start!5330 e!24360))

(assert (=> start!5330 true))

(declare-fun b!38320 () Bool)

(assert (=> b!38320 (= e!24360 (not e!24361))))

(declare-fun res!23071 () Bool)

(assert (=> b!38320 (=> res!23071 e!24361)))

(assert (=> b!38320 (= res!23071 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2535 0))(
  ( (array!2536 (arr!1211 (Array (_ BitVec 32) (_ BitVec 64))) (size!1318 (_ BitVec 32))) )
))
(declare-fun lt!14212 () array!2535)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2535 (_ BitVec 32)) Bool)

(assert (=> b!38320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14212 mask!853)))

(declare-datatypes ((Unit!927 0))(
  ( (Unit!928) )
))
(declare-fun lt!14213 () Unit!927)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2535 (_ BitVec 32) (_ BitVec 32)) Unit!927)

(assert (=> b!38320 (= lt!14213 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14212 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2535 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38320 (= (arrayCountValidKeys!0 lt!14212 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14210 () Unit!927)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2535 (_ BitVec 32) (_ BitVec 32)) Unit!927)

(assert (=> b!38320 (= lt!14210 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14212 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38320 (= lt!14212 (array!2536 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38321 () Bool)

(declare-fun res!23073 () Bool)

(assert (=> b!38321 (=> res!23073 e!24361)))

(assert (=> b!38321 (= res!23073 (contains!484 Nil!1024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5330 res!23072) b!38320))

(assert (= (and b!38320 (not res!23071)) b!38321))

(assert (= (and b!38321 (not res!23073)) b!38322))

(assert (= (and b!38322 (not res!23070)) b!38323))

(declare-fun m!30945 () Bool)

(assert (=> b!38321 m!30945))

(declare-fun m!30947 () Bool)

(assert (=> b!38322 m!30947))

(declare-fun m!30949 () Bool)

(assert (=> b!38323 m!30949))

(declare-fun m!30951 () Bool)

(assert (=> b!38320 m!30951))

(declare-fun m!30953 () Bool)

(assert (=> b!38320 m!30953))

(declare-fun m!30955 () Bool)

(assert (=> b!38320 m!30955))

(declare-fun m!30957 () Bool)

(assert (=> b!38320 m!30957))

(declare-fun m!30959 () Bool)

(assert (=> start!5330 m!30959))

(push 1)

(assert (not b!38322))

(assert (not b!38321))

(assert (not start!5330))

(assert (not b!38320))

(assert (not b!38323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

