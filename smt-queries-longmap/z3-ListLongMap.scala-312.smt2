; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5346 () Bool)

(assert start!5346)

(declare-fun b!38419 () Bool)

(declare-fun e!24409 () Bool)

(assert (=> b!38419 (= e!24409 true)))

(declare-fun lt!14307 () Bool)

(declare-datatypes ((List!1035 0))(
  ( (Nil!1032) (Cons!1031 (h!1599 (_ BitVec 64)) (t!3868 List!1035)) )
))
(declare-fun noDuplicate!26 (List!1035) Bool)

(assert (=> b!38419 (= lt!14307 (noDuplicate!26 Nil!1032))))

(declare-fun b!38418 () Bool)

(declare-fun res!23167 () Bool)

(assert (=> b!38418 (=> res!23167 e!24409)))

(declare-fun contains!492 (List!1035 (_ BitVec 64)) Bool)

(assert (=> b!38418 (= res!23167 (contains!492 Nil!1032 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38416 () Bool)

(declare-fun e!24408 () Bool)

(assert (=> b!38416 (= e!24408 (not e!24409))))

(declare-fun res!23166 () Bool)

(assert (=> b!38416 (=> res!23166 e!24409)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38416 (= res!23166 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2551 0))(
  ( (array!2552 (arr!1219 (Array (_ BitVec 32) (_ BitVec 64))) (size!1326 (_ BitVec 32))) )
))
(declare-fun lt!14308 () array!2551)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2551 (_ BitVec 32)) Bool)

(assert (=> b!38416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14308 mask!853)))

(declare-datatypes ((Unit!943 0))(
  ( (Unit!944) )
))
(declare-fun lt!14306 () Unit!943)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2551 (_ BitVec 32) (_ BitVec 32)) Unit!943)

(assert (=> b!38416 (= lt!14306 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14308 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2551 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38416 (= (arrayCountValidKeys!0 lt!14308 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14309 () Unit!943)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2551 (_ BitVec 32) (_ BitVec 32)) Unit!943)

(assert (=> b!38416 (= lt!14309 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14308 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38416 (= lt!14308 (array!2552 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun res!23169 () Bool)

(assert (=> start!5346 (=> (not res!23169) (not e!24408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5346 (= res!23169 (validMask!0 mask!853))))

(assert (=> start!5346 e!24408))

(assert (=> start!5346 true))

(declare-fun b!38417 () Bool)

(declare-fun res!23168 () Bool)

(assert (=> b!38417 (=> res!23168 e!24409)))

(assert (=> b!38417 (= res!23168 (contains!492 Nil!1032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5346 res!23169) b!38416))

(assert (= (and b!38416 (not res!23166)) b!38417))

(assert (= (and b!38417 (not res!23168)) b!38418))

(assert (= (and b!38418 (not res!23167)) b!38419))

(declare-fun m!31073 () Bool)

(assert (=> start!5346 m!31073))

(declare-fun m!31075 () Bool)

(assert (=> b!38419 m!31075))

(declare-fun m!31077 () Bool)

(assert (=> b!38416 m!31077))

(declare-fun m!31079 () Bool)

(assert (=> b!38416 m!31079))

(declare-fun m!31081 () Bool)

(assert (=> b!38416 m!31081))

(declare-fun m!31083 () Bool)

(assert (=> b!38416 m!31083))

(declare-fun m!31085 () Bool)

(assert (=> b!38417 m!31085))

(declare-fun m!31087 () Bool)

(assert (=> b!38418 m!31087))

(check-sat (not b!38419) (not b!38416) (not b!38417) (not b!38418) (not start!5346))
(check-sat)
