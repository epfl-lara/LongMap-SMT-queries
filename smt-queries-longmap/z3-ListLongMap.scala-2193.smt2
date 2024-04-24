; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36502 () Bool)

(assert start!36502)

(declare-fun res!203945 () Bool)

(declare-fun e!223316 () Bool)

(assert (=> start!36502 (=> (not res!203945) (not e!223316))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20756 0))(
  ( (array!20757 (arr!9855 (Array (_ BitVec 32) (_ BitVec 64))) (size!10207 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20756)

(assert (=> start!36502 (= res!203945 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10207 a!4289))))))

(assert (=> start!36502 e!223316))

(assert (=> start!36502 true))

(declare-fun array_inv!7327 (array!20756) Bool)

(assert (=> start!36502 (array_inv!7327 a!4289)))

(declare-fun b!364832 () Bool)

(declare-fun res!203946 () Bool)

(assert (=> b!364832 (=> (not res!203946) (not e!223316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364832 (= res!203946 (not (validKeyInArray!0 (select (arr!9855 a!4289) i!1472))))))

(declare-fun e!223315 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168898 () (_ BitVec 32))

(declare-fun lt!168900 () (_ BitVec 32))

(declare-fun b!364833 () Bool)

(assert (=> b!364833 (= e!223315 (not (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10207 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168898 (bvadd #b00000000000000000000000000000001 lt!168900))) (bvslt (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))))

(declare-fun lt!168904 () (_ BitVec 32))

(declare-fun lt!168901 () (_ BitVec 32))

(assert (=> b!364833 (= (bvadd lt!168904 lt!168901) lt!168898)))

(declare-fun lt!168903 () array!20756)

(declare-fun arrayCountValidKeys!0 (array!20756 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364833 (= lt!168898 (arrayCountValidKeys!0 lt!168903 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364833 (= lt!168904 (arrayCountValidKeys!0 lt!168903 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11353 0))(
  ( (Unit!11354) )
))
(declare-fun lt!168899 () Unit!11353)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11353)

(assert (=> b!364833 (= lt!168899 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168903 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168905 () (_ BitVec 32))

(declare-fun lt!168902 () (_ BitVec 32))

(assert (=> b!364833 (= (bvadd lt!168905 lt!168902) lt!168900)))

(assert (=> b!364833 (= lt!168900 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364833 (= lt!168905 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168897 () Unit!11353)

(assert (=> b!364833 (= lt!168897 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364834 () Bool)

(declare-fun res!203947 () Bool)

(assert (=> b!364834 (=> (not res!203947) (not e!223316))))

(assert (=> b!364834 (= res!203947 (and (bvslt (size!10207 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10207 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364835 () Bool)

(declare-fun res!203944 () Bool)

(assert (=> b!364835 (=> (not res!203944) (not e!223316))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364835 (= res!203944 (validKeyInArray!0 k0!2974))))

(declare-fun b!364836 () Bool)

(assert (=> b!364836 (= e!223316 e!223315)))

(declare-fun res!203943 () Bool)

(assert (=> b!364836 (=> (not res!203943) (not e!223315))))

(assert (=> b!364836 (= res!203943 (and (= lt!168901 (bvadd #b00000000000000000000000000000001 lt!168902)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364836 (= lt!168901 (arrayCountValidKeys!0 lt!168903 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364836 (= lt!168902 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364836 (= lt!168903 (array!20757 (store (arr!9855 a!4289) i!1472 k0!2974) (size!10207 a!4289)))))

(assert (= (and start!36502 res!203945) b!364832))

(assert (= (and b!364832 res!203946) b!364835))

(assert (= (and b!364835 res!203944) b!364834))

(assert (= (and b!364834 res!203947) b!364836))

(assert (= (and b!364836 res!203943) b!364833))

(declare-fun m!362827 () Bool)

(assert (=> b!364832 m!362827))

(assert (=> b!364832 m!362827))

(declare-fun m!362829 () Bool)

(assert (=> b!364832 m!362829))

(declare-fun m!362831 () Bool)

(assert (=> b!364835 m!362831))

(declare-fun m!362833 () Bool)

(assert (=> b!364833 m!362833))

(declare-fun m!362835 () Bool)

(assert (=> b!364833 m!362835))

(declare-fun m!362837 () Bool)

(assert (=> b!364833 m!362837))

(declare-fun m!362839 () Bool)

(assert (=> b!364833 m!362839))

(declare-fun m!362841 () Bool)

(assert (=> b!364833 m!362841))

(declare-fun m!362843 () Bool)

(assert (=> b!364833 m!362843))

(declare-fun m!362845 () Bool)

(assert (=> start!36502 m!362845))

(declare-fun m!362847 () Bool)

(assert (=> b!364836 m!362847))

(declare-fun m!362849 () Bool)

(assert (=> b!364836 m!362849))

(declare-fun m!362851 () Bool)

(assert (=> b!364836 m!362851))

(check-sat (not b!364832) (not b!364836) (not start!36502) (not b!364833) (not b!364835))
(check-sat)
