; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36374 () Bool)

(assert start!36374)

(declare-fun b!363874 () Bool)

(declare-fun e!222786 () Bool)

(assert (=> b!363874 (= e!222786 (not true))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-datatypes ((array!20654 0))(
  ( (array!20655 (arr!9806 (Array (_ BitVec 32) (_ BitVec 64))) (size!10158 (_ BitVec 32))) )
))
(declare-fun lt!168006 () array!20654)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun lt!168005 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20654 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363874 (= (bvadd (arrayCountValidKeys!0 lt!168006 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168005) (arrayCountValidKeys!0 lt!168006 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11282 0))(
  ( (Unit!11283) )
))
(declare-fun lt!168007 () Unit!11282)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11282)

(assert (=> b!363874 (= lt!168007 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168006 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168004 () (_ BitVec 32))

(declare-fun a!4289 () array!20654)

(assert (=> b!363874 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168004) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168003 () Unit!11282)

(assert (=> b!363874 (= lt!168003 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363875 () Bool)

(declare-fun res!203034 () Bool)

(declare-fun e!222787 () Bool)

(assert (=> b!363875 (=> (not res!203034) (not e!222787))))

(assert (=> b!363875 (= res!203034 (and (bvslt (size!10158 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10158 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363876 () Bool)

(assert (=> b!363876 (= e!222787 e!222786)))

(declare-fun res!203036 () Bool)

(assert (=> b!363876 (=> (not res!203036) (not e!222786))))

(assert (=> b!363876 (= res!203036 (and (= lt!168005 (bvadd #b00000000000000000000000000000001 lt!168004)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363876 (= lt!168005 (arrayCountValidKeys!0 lt!168006 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363876 (= lt!168004 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363876 (= lt!168006 (array!20655 (store (arr!9806 a!4289) i!1472 k0!2974) (size!10158 a!4289)))))

(declare-fun b!363877 () Bool)

(declare-fun res!203035 () Bool)

(assert (=> b!363877 (=> (not res!203035) (not e!222787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363877 (= res!203035 (not (validKeyInArray!0 (select (arr!9806 a!4289) i!1472))))))

(declare-fun res!203037 () Bool)

(assert (=> start!36374 (=> (not res!203037) (not e!222787))))

(assert (=> start!36374 (= res!203037 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10158 a!4289))))))

(assert (=> start!36374 e!222787))

(assert (=> start!36374 true))

(declare-fun array_inv!7248 (array!20654) Bool)

(assert (=> start!36374 (array_inv!7248 a!4289)))

(declare-fun b!363873 () Bool)

(declare-fun res!203038 () Bool)

(assert (=> b!363873 (=> (not res!203038) (not e!222787))))

(assert (=> b!363873 (= res!203038 (validKeyInArray!0 k0!2974))))

(assert (= (and start!36374 res!203037) b!363877))

(assert (= (and b!363877 res!203035) b!363873))

(assert (= (and b!363873 res!203038) b!363875))

(assert (= (and b!363875 res!203034) b!363876))

(assert (= (and b!363876 res!203036) b!363874))

(declare-fun m!361147 () Bool)

(assert (=> start!36374 m!361147))

(declare-fun m!361149 () Bool)

(assert (=> b!363873 m!361149))

(declare-fun m!361151 () Bool)

(assert (=> b!363876 m!361151))

(declare-fun m!361153 () Bool)

(assert (=> b!363876 m!361153))

(declare-fun m!361155 () Bool)

(assert (=> b!363876 m!361155))

(declare-fun m!361157 () Bool)

(assert (=> b!363874 m!361157))

(declare-fun m!361159 () Bool)

(assert (=> b!363874 m!361159))

(declare-fun m!361161 () Bool)

(assert (=> b!363874 m!361161))

(declare-fun m!361163 () Bool)

(assert (=> b!363874 m!361163))

(declare-fun m!361165 () Bool)

(assert (=> b!363874 m!361165))

(declare-fun m!361167 () Bool)

(assert (=> b!363874 m!361167))

(declare-fun m!361169 () Bool)

(assert (=> b!363877 m!361169))

(assert (=> b!363877 m!361169))

(declare-fun m!361171 () Bool)

(assert (=> b!363877 m!361171))

(check-sat (not b!363877) (not b!363873) (not b!363876) (not b!363874) (not start!36374))
(check-sat)
