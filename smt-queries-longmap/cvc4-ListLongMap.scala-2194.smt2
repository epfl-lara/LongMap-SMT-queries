; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36510 () Bool)

(assert start!36510)

(declare-fun b!364897 () Bool)

(declare-fun res!204013 () Bool)

(declare-fun e!223358 () Bool)

(assert (=> b!364897 (=> (not res!204013) (not e!223358))))

(declare-datatypes ((array!20764 0))(
  ( (array!20765 (arr!9859 (Array (_ BitVec 32) (_ BitVec 64))) (size!10211 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20764)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364897 (= res!204013 (not (validKeyInArray!0 (select (arr!9859 a!4289) i!1472))))))

(declare-fun b!364898 () Bool)

(declare-fun e!223356 () Bool)

(assert (=> b!364898 (= e!223358 e!223356)))

(declare-fun res!204011 () Bool)

(assert (=> b!364898 (=> (not res!204011) (not e!223356))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!169012 () (_ BitVec 32))

(declare-fun lt!169011 () (_ BitVec 32))

(assert (=> b!364898 (= res!204011 (and (= lt!169011 (bvadd #b00000000000000000000000000000001 lt!169012)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!169017 () array!20764)

(declare-fun arrayCountValidKeys!0 (array!20764 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364898 (= lt!169011 (arrayCountValidKeys!0 lt!169017 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364898 (= lt!169012 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364898 (= lt!169017 (array!20765 (store (arr!9859 a!4289) i!1472 k!2974) (size!10211 a!4289)))))

(declare-fun b!364899 () Bool)

(declare-fun res!204008 () Bool)

(assert (=> b!364899 (=> (not res!204008) (not e!223358))))

(assert (=> b!364899 (= res!204008 (validKeyInArray!0 k!2974))))

(declare-fun b!364900 () Bool)

(declare-fun e!223357 () Bool)

(assert (=> b!364900 (= e!223356 (not e!223357))))

(declare-fun res!204012 () Bool)

(assert (=> b!364900 (=> res!204012 e!223357)))

(declare-fun lt!169019 () (_ BitVec 32))

(declare-fun lt!169014 () (_ BitVec 32))

(assert (=> b!364900 (= res!204012 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10211 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!169019 (bvadd #b00000000000000000000000000000001 lt!169014)))))))

(declare-fun lt!169013 () (_ BitVec 32))

(assert (=> b!364900 (= (bvadd lt!169013 lt!169011) lt!169019)))

(assert (=> b!364900 (= lt!169019 (arrayCountValidKeys!0 lt!169017 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364900 (= lt!169013 (arrayCountValidKeys!0 lt!169017 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11361 0))(
  ( (Unit!11362) )
))
(declare-fun lt!169018 () Unit!11361)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11361)

(assert (=> b!364900 (= lt!169018 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!169017 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!169010 () (_ BitVec 32))

(assert (=> b!364900 (= (bvadd lt!169010 lt!169012) lt!169014)))

(assert (=> b!364900 (= lt!169014 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364900 (= lt!169010 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!169015 () Unit!11361)

(assert (=> b!364900 (= lt!169015 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364902 () Bool)

(assert (=> b!364902 (= e!223357 true)))

(assert (=> b!364902 (= (arrayCountValidKeys!0 lt!169017 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!169016 () Unit!11361)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20764 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11361)

(assert (=> b!364902 (= lt!169016 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364901 () Bool)

(declare-fun res!204010 () Bool)

(assert (=> b!364901 (=> (not res!204010) (not e!223358))))

(assert (=> b!364901 (= res!204010 (and (bvslt (size!10211 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10211 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!204009 () Bool)

(assert (=> start!36510 (=> (not res!204009) (not e!223358))))

(assert (=> start!36510 (= res!204009 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10211 a!4289))))))

(assert (=> start!36510 e!223358))

(assert (=> start!36510 true))

(declare-fun array_inv!7331 (array!20764) Bool)

(assert (=> start!36510 (array_inv!7331 a!4289)))

(assert (= (and start!36510 res!204009) b!364897))

(assert (= (and b!364897 res!204013) b!364899))

(assert (= (and b!364899 res!204008) b!364901))

(assert (= (and b!364901 res!204010) b!364898))

(assert (= (and b!364898 res!204011) b!364900))

(assert (= (and b!364900 (not res!204012)) b!364902))

(declare-fun m!362937 () Bool)

(assert (=> b!364897 m!362937))

(assert (=> b!364897 m!362937))

(declare-fun m!362939 () Bool)

(assert (=> b!364897 m!362939))

(declare-fun m!362941 () Bool)

(assert (=> b!364902 m!362941))

(declare-fun m!362943 () Bool)

(assert (=> b!364902 m!362943))

(declare-fun m!362945 () Bool)

(assert (=> b!364902 m!362945))

(declare-fun m!362947 () Bool)

(assert (=> start!36510 m!362947))

(declare-fun m!362949 () Bool)

(assert (=> b!364900 m!362949))

(declare-fun m!362951 () Bool)

(assert (=> b!364900 m!362951))

(declare-fun m!362953 () Bool)

(assert (=> b!364900 m!362953))

(declare-fun m!362955 () Bool)

(assert (=> b!364900 m!362955))

(declare-fun m!362957 () Bool)

(assert (=> b!364900 m!362957))

(declare-fun m!362959 () Bool)

(assert (=> b!364900 m!362959))

(declare-fun m!362961 () Bool)

(assert (=> b!364898 m!362961))

(declare-fun m!362963 () Bool)

(assert (=> b!364898 m!362963))

(declare-fun m!362965 () Bool)

(assert (=> b!364898 m!362965))

(declare-fun m!362967 () Bool)

(assert (=> b!364899 m!362967))

(push 1)

(assert (not b!364898))

(assert (not b!364902))

(assert (not b!364897))

(assert (not b!364899))

(assert (not b!364900))

(assert (not start!36510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

