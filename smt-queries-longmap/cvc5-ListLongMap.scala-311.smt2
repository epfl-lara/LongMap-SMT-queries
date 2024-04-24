; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5346 () Bool)

(assert start!5346)

(declare-fun b!38335 () Bool)

(declare-fun e!24359 () Bool)

(declare-fun e!24360 () Bool)

(assert (=> b!38335 (= e!24359 (not e!24360))))

(declare-fun res!23119 () Bool)

(assert (=> b!38335 (=> res!23119 e!24360)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38335 (= res!23119 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2533 0))(
  ( (array!2534 (arr!1210 (Array (_ BitVec 32) (_ BitVec 64))) (size!1317 (_ BitVec 32))) )
))
(declare-fun lt!14241 () array!2533)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2533 (_ BitVec 32)) Bool)

(assert (=> b!38335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14241 mask!853)))

(declare-datatypes ((Unit!945 0))(
  ( (Unit!946) )
))
(declare-fun lt!14240 () Unit!945)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2533 (_ BitVec 32) (_ BitVec 32)) Unit!945)

(assert (=> b!38335 (= lt!14240 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14241 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2533 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38335 (= (arrayCountValidKeys!0 lt!14241 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14242 () Unit!945)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2533 (_ BitVec 32) (_ BitVec 32)) Unit!945)

(assert (=> b!38335 (= lt!14242 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14241 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38335 (= lt!14241 (array!2534 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun res!23117 () Bool)

(assert (=> start!5346 (=> (not res!23117) (not e!24359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5346 (= res!23117 (validMask!0 mask!853))))

(assert (=> start!5346 e!24359))

(assert (=> start!5346 true))

(declare-fun b!38338 () Bool)

(assert (=> b!38338 (= e!24360 true)))

(declare-fun lt!14239 () Bool)

(declare-datatypes ((List!1019 0))(
  ( (Nil!1016) (Cons!1015 (h!1583 (_ BitVec 64)) (t!3852 List!1019)) )
))
(declare-fun noDuplicate!20 (List!1019) Bool)

(assert (=> b!38338 (= lt!14239 (noDuplicate!20 Nil!1016))))

(declare-fun b!38336 () Bool)

(declare-fun res!23118 () Bool)

(assert (=> b!38336 (=> res!23118 e!24360)))

(declare-fun contains!480 (List!1019 (_ BitVec 64)) Bool)

(assert (=> b!38336 (= res!23118 (contains!480 Nil!1016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38337 () Bool)

(declare-fun res!23120 () Bool)

(assert (=> b!38337 (=> res!23120 e!24360)))

(assert (=> b!38337 (= res!23120 (contains!480 Nil!1016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5346 res!23117) b!38335))

(assert (= (and b!38335 (not res!23119)) b!38336))

(assert (= (and b!38336 (not res!23118)) b!38337))

(assert (= (and b!38337 (not res!23120)) b!38338))

(declare-fun m!30915 () Bool)

(assert (=> b!38336 m!30915))

(declare-fun m!30917 () Bool)

(assert (=> b!38337 m!30917))

(declare-fun m!30919 () Bool)

(assert (=> start!5346 m!30919))

(declare-fun m!30921 () Bool)

(assert (=> b!38335 m!30921))

(declare-fun m!30923 () Bool)

(assert (=> b!38335 m!30923))

(declare-fun m!30925 () Bool)

(assert (=> b!38335 m!30925))

(declare-fun m!30927 () Bool)

(assert (=> b!38335 m!30927))

(declare-fun m!30929 () Bool)

(assert (=> b!38338 m!30929))

(push 1)

(assert (not b!38338))

(assert (not start!5346))

(assert (not b!38336))

(assert (not b!38335))

(assert (not b!38337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

