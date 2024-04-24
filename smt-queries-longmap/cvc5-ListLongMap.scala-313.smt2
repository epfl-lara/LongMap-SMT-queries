; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5358 () Bool)

(assert start!5358)

(declare-fun b!38410 () Bool)

(declare-fun e!24395 () Bool)

(assert (=> b!38410 (= e!24395 true)))

(declare-fun lt!14314 () Bool)

(declare-datatypes ((List!1025 0))(
  ( (Nil!1022) (Cons!1021 (h!1589 (_ BitVec 64)) (t!3858 List!1025)) )
))
(declare-fun noDuplicate!26 (List!1025) Bool)

(assert (=> b!38410 (= lt!14314 (noDuplicate!26 Nil!1022))))

(declare-fun b!38407 () Bool)

(declare-fun e!24396 () Bool)

(assert (=> b!38407 (= e!24396 (not e!24395))))

(declare-fun res!23190 () Bool)

(assert (=> b!38407 (=> res!23190 e!24395)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38407 (= res!23190 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2545 0))(
  ( (array!2546 (arr!1216 (Array (_ BitVec 32) (_ BitVec 64))) (size!1323 (_ BitVec 32))) )
))
(declare-fun lt!14313 () array!2545)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2545 (_ BitVec 32)) Bool)

(assert (=> b!38407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14313 mask!853)))

(declare-datatypes ((Unit!957 0))(
  ( (Unit!958) )
))
(declare-fun lt!14312 () Unit!957)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2545 (_ BitVec 32) (_ BitVec 32)) Unit!957)

(assert (=> b!38407 (= lt!14312 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14313 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2545 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38407 (= (arrayCountValidKeys!0 lt!14313 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14311 () Unit!957)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2545 (_ BitVec 32) (_ BitVec 32)) Unit!957)

(assert (=> b!38407 (= lt!14311 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14313 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38407 (= lt!14313 (array!2546 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38408 () Bool)

(declare-fun res!23192 () Bool)

(assert (=> b!38408 (=> res!23192 e!24395)))

(declare-fun contains!486 (List!1025 (_ BitVec 64)) Bool)

(assert (=> b!38408 (= res!23192 (contains!486 Nil!1022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38409 () Bool)

(declare-fun res!23191 () Bool)

(assert (=> b!38409 (=> res!23191 e!24395)))

(assert (=> b!38409 (= res!23191 (contains!486 Nil!1022 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23189 () Bool)

(assert (=> start!5358 (=> (not res!23189) (not e!24396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5358 (= res!23189 (validMask!0 mask!853))))

(assert (=> start!5358 e!24396))

(assert (=> start!5358 true))

(assert (= (and start!5358 res!23189) b!38407))

(assert (= (and b!38407 (not res!23190)) b!38408))

(assert (= (and b!38408 (not res!23192)) b!38409))

(assert (= (and b!38409 (not res!23191)) b!38410))

(declare-fun m!31011 () Bool)

(assert (=> b!38407 m!31011))

(declare-fun m!31013 () Bool)

(assert (=> b!38407 m!31013))

(declare-fun m!31015 () Bool)

(assert (=> b!38407 m!31015))

(declare-fun m!31017 () Bool)

(assert (=> b!38407 m!31017))

(declare-fun m!31019 () Bool)

(assert (=> b!38409 m!31019))

(declare-fun m!31021 () Bool)

(assert (=> start!5358 m!31021))

(declare-fun m!31023 () Bool)

(assert (=> b!38408 m!31023))

(declare-fun m!31025 () Bool)

(assert (=> b!38410 m!31025))

(push 1)

(assert (not b!38409))

(assert (not start!5358))

(assert (not b!38408))

(assert (not b!38407))

(assert (not b!38410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

