; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5352 () Bool)

(assert start!5352)

(declare-fun b!38454 () Bool)

(declare-fun res!23202 () Bool)

(declare-fun e!24426 () Bool)

(assert (=> b!38454 (=> res!23202 e!24426)))

(declare-datatypes ((List!1038 0))(
  ( (Nil!1035) (Cons!1034 (h!1602 (_ BitVec 64)) (t!3871 List!1038)) )
))
(declare-fun contains!495 (List!1038 (_ BitVec 64)) Bool)

(assert (=> b!38454 (= res!23202 (contains!495 Nil!1035 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38453 () Bool)

(declare-fun res!23204 () Bool)

(assert (=> b!38453 (=> res!23204 e!24426)))

(assert (=> b!38453 (= res!23204 (contains!495 Nil!1035 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23203 () Bool)

(declare-fun e!24427 () Bool)

(assert (=> start!5352 (=> (not res!23203) (not e!24427))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5352 (= res!23203 (validMask!0 mask!853))))

(assert (=> start!5352 e!24427))

(assert (=> start!5352 true))

(declare-fun b!38455 () Bool)

(assert (=> b!38455 (= e!24426 true)))

(declare-fun lt!14342 () Bool)

(declare-fun noDuplicate!29 (List!1038) Bool)

(assert (=> b!38455 (= lt!14342 (noDuplicate!29 Nil!1035))))

(declare-fun b!38452 () Bool)

(assert (=> b!38452 (= e!24427 (not e!24426))))

(declare-fun res!23205 () Bool)

(assert (=> b!38452 (=> res!23205 e!24426)))

(assert (=> b!38452 (= res!23205 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2557 0))(
  ( (array!2558 (arr!1222 (Array (_ BitVec 32) (_ BitVec 64))) (size!1329 (_ BitVec 32))) )
))
(declare-fun lt!14343 () array!2557)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2557 (_ BitVec 32)) Bool)

(assert (=> b!38452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14343 mask!853)))

(declare-datatypes ((Unit!949 0))(
  ( (Unit!950) )
))
(declare-fun lt!14344 () Unit!949)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2557 (_ BitVec 32) (_ BitVec 32)) Unit!949)

(assert (=> b!38452 (= lt!14344 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14343 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2557 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38452 (= (arrayCountValidKeys!0 lt!14343 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14345 () Unit!949)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2557 (_ BitVec 32) (_ BitVec 32)) Unit!949)

(assert (=> b!38452 (= lt!14345 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14343 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38452 (= lt!14343 (array!2558 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5352 res!23203) b!38452))

(assert (= (and b!38452 (not res!23205)) b!38453))

(assert (= (and b!38453 (not res!23204)) b!38454))

(assert (= (and b!38454 (not res!23202)) b!38455))

(declare-fun m!31121 () Bool)

(assert (=> start!5352 m!31121))

(declare-fun m!31123 () Bool)

(assert (=> b!38454 m!31123))

(declare-fun m!31125 () Bool)

(assert (=> b!38452 m!31125))

(declare-fun m!31127 () Bool)

(assert (=> b!38452 m!31127))

(declare-fun m!31129 () Bool)

(assert (=> b!38452 m!31129))

(declare-fun m!31131 () Bool)

(assert (=> b!38452 m!31131))

(declare-fun m!31133 () Bool)

(assert (=> b!38455 m!31133))

(declare-fun m!31135 () Bool)

(assert (=> b!38453 m!31135))

(check-sat (not b!38455) (not start!5352) (not b!38453) (not b!38452) (not b!38454))
(check-sat)
