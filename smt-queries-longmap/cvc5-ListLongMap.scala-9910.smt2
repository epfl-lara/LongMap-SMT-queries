; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117440 () Bool)

(assert start!117440)

(declare-fun b!1380550 () Bool)

(declare-fun res!922298 () Bool)

(declare-fun e!782168 () Bool)

(assert (=> b!1380550 (=> (not res!922298) (not e!782168))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380550 (= res!922298 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380551 () Bool)

(declare-fun e!782169 () Bool)

(assert (=> b!1380551 (= e!782168 e!782169)))

(declare-fun res!922297 () Bool)

(assert (=> b!1380551 (=> (not res!922297) (not e!782169))))

(declare-fun lt!607755 () (_ BitVec 32))

(declare-fun lt!607756 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1380551 (= res!922297 (and (= lt!607755 (bvsub lt!607756 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93941 0))(
  ( (array!93942 (arr!45366 (Array (_ BitVec 32) (_ BitVec 64))) (size!45917 (_ BitVec 32))) )
))
(declare-fun lt!607754 () array!93941)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93941 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380551 (= lt!607755 (arrayCountValidKeys!0 lt!607754 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93941)

(assert (=> b!1380551 (= lt!607756 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380551 (= lt!607754 (array!93942 (store (arr!45366 a!4094) i!1451 k!2953) (size!45917 a!4094)))))

(declare-fun b!1380552 () Bool)

(assert (=> b!1380552 (= e!782169 (not (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (size!45917 a!4094)) (bvsge i!1451 (bvsub from!3466 #b00000000000000000000000000000001)))))))

(assert (=> b!1380552 (= (bvadd (arrayCountValidKeys!0 lt!607754 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607755) (arrayCountValidKeys!0 lt!607754 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45792 0))(
  ( (Unit!45793) )
))
(declare-fun lt!607753 () Unit!45792)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45792)

(assert (=> b!1380552 (= lt!607753 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607754 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1380552 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607756) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607752 () Unit!45792)

(assert (=> b!1380552 (= lt!607752 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!922299 () Bool)

(assert (=> start!117440 (=> (not res!922299) (not e!782168))))

(assert (=> start!117440 (= res!922299 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45917 a!4094))))))

(assert (=> start!117440 e!782168))

(assert (=> start!117440 true))

(declare-fun array_inv!34647 (array!93941) Bool)

(assert (=> start!117440 (array_inv!34647 a!4094)))

(declare-fun b!1380553 () Bool)

(declare-fun res!922295 () Bool)

(assert (=> b!1380553 (=> (not res!922295) (not e!782168))))

(assert (=> b!1380553 (= res!922295 (validKeyInArray!0 (select (arr!45366 a!4094) i!1451)))))

(declare-fun b!1380554 () Bool)

(declare-fun res!922296 () Bool)

(assert (=> b!1380554 (=> (not res!922296) (not e!782168))))

(assert (=> b!1380554 (= res!922296 (and (bvslt (size!45917 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45917 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117440 res!922299) b!1380553))

(assert (= (and b!1380553 res!922295) b!1380550))

(assert (= (and b!1380550 res!922298) b!1380554))

(assert (= (and b!1380554 res!922296) b!1380551))

(assert (= (and b!1380551 res!922297) b!1380552))

(declare-fun m!1265867 () Bool)

(assert (=> b!1380553 m!1265867))

(assert (=> b!1380553 m!1265867))

(declare-fun m!1265869 () Bool)

(assert (=> b!1380553 m!1265869))

(declare-fun m!1265871 () Bool)

(assert (=> start!117440 m!1265871))

(declare-fun m!1265873 () Bool)

(assert (=> b!1380550 m!1265873))

(declare-fun m!1265875 () Bool)

(assert (=> b!1380552 m!1265875))

(declare-fun m!1265877 () Bool)

(assert (=> b!1380552 m!1265877))

(declare-fun m!1265879 () Bool)

(assert (=> b!1380552 m!1265879))

(declare-fun m!1265881 () Bool)

(assert (=> b!1380552 m!1265881))

(declare-fun m!1265883 () Bool)

(assert (=> b!1380552 m!1265883))

(declare-fun m!1265885 () Bool)

(assert (=> b!1380552 m!1265885))

(declare-fun m!1265887 () Bool)

(assert (=> b!1380551 m!1265887))

(declare-fun m!1265889 () Bool)

(assert (=> b!1380551 m!1265889))

(declare-fun m!1265891 () Bool)

(assert (=> b!1380551 m!1265891))

(push 1)

(assert (not start!117440))

(assert (not b!1380550))

(assert (not b!1380551))

(assert (not b!1380553))

(assert (not b!1380552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

