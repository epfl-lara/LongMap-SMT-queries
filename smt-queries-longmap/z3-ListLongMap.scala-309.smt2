; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5328 () Bool)

(assert start!5328)

(declare-fun b!38309 () Bool)

(declare-fun res!23061 () Bool)

(declare-fun e!24355 () Bool)

(assert (=> b!38309 (=> res!23061 e!24355)))

(declare-datatypes ((List!1026 0))(
  ( (Nil!1023) (Cons!1022 (h!1590 (_ BitVec 64)) (t!3859 List!1026)) )
))
(declare-fun contains!483 (List!1026 (_ BitVec 64)) Bool)

(assert (=> b!38309 (= res!23061 (contains!483 Nil!1023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38310 () Bool)

(declare-fun res!23059 () Bool)

(assert (=> b!38310 (=> res!23059 e!24355)))

(assert (=> b!38310 (= res!23059 (contains!483 Nil!1023 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38311 () Bool)

(assert (=> b!38311 (= e!24355 true)))

(declare-fun lt!14199 () Bool)

(declare-fun noDuplicate!17 (List!1026) Bool)

(assert (=> b!38311 (= lt!14199 (noDuplicate!17 Nil!1023))))

(declare-fun b!38308 () Bool)

(declare-fun e!24354 () Bool)

(assert (=> b!38308 (= e!24354 (not e!24355))))

(declare-fun res!23060 () Bool)

(assert (=> b!38308 (=> res!23060 e!24355)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38308 (= res!23060 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2533 0))(
  ( (array!2534 (arr!1210 (Array (_ BitVec 32) (_ BitVec 64))) (size!1317 (_ BitVec 32))) )
))
(declare-fun lt!14201 () array!2533)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2533 (_ BitVec 32)) Bool)

(assert (=> b!38308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14201 mask!853)))

(declare-datatypes ((Unit!925 0))(
  ( (Unit!926) )
))
(declare-fun lt!14198 () Unit!925)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2533 (_ BitVec 32) (_ BitVec 32)) Unit!925)

(assert (=> b!38308 (= lt!14198 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14201 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2533 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38308 (= (arrayCountValidKeys!0 lt!14201 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14200 () Unit!925)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2533 (_ BitVec 32) (_ BitVec 32)) Unit!925)

(assert (=> b!38308 (= lt!14200 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14201 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38308 (= lt!14201 (array!2534 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun res!23058 () Bool)

(assert (=> start!5328 (=> (not res!23058) (not e!24354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5328 (= res!23058 (validMask!0 mask!853))))

(assert (=> start!5328 e!24354))

(assert (=> start!5328 true))

(assert (= (and start!5328 res!23058) b!38308))

(assert (= (and b!38308 (not res!23060)) b!38309))

(assert (= (and b!38309 (not res!23061)) b!38310))

(assert (= (and b!38310 (not res!23059)) b!38311))

(declare-fun m!30929 () Bool)

(assert (=> b!38309 m!30929))

(declare-fun m!30931 () Bool)

(assert (=> b!38310 m!30931))

(declare-fun m!30933 () Bool)

(assert (=> start!5328 m!30933))

(declare-fun m!30935 () Bool)

(assert (=> b!38308 m!30935))

(declare-fun m!30937 () Bool)

(assert (=> b!38308 m!30937))

(declare-fun m!30939 () Bool)

(assert (=> b!38308 m!30939))

(declare-fun m!30941 () Bool)

(assert (=> b!38308 m!30941))

(declare-fun m!30943 () Bool)

(assert (=> b!38311 m!30943))

(check-sat (not start!5328) (not b!38310) (not b!38311) (not b!38309) (not b!38308))
(check-sat)
