; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117480 () Bool)

(assert start!117480)

(declare-fun res!922422 () Bool)

(declare-fun e!782295 () Bool)

(assert (=> start!117480 (=> (not res!922422) (not e!782295))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93960 0))(
  ( (array!93961 (arr!45374 (Array (_ BitVec 32) (_ BitVec 64))) (size!45925 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93960)

(assert (=> start!117480 (= res!922422 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45925 a!4094))))))

(assert (=> start!117480 e!782295))

(assert (=> start!117480 true))

(declare-fun array_inv!34655 (array!93960) Bool)

(assert (=> start!117480 (array_inv!34655 a!4094)))

(declare-fun b!1380771 () Bool)

(declare-fun e!782293 () Bool)

(declare-fun e!782292 () Bool)

(assert (=> b!1380771 (= e!782293 (not e!782292))))

(declare-fun res!922424 () Bool)

(assert (=> b!1380771 (=> res!922424 e!782292)))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!608005 () (_ BitVec 32))

(declare-fun lt!608009 () (_ BitVec 32))

(assert (=> b!1380771 (= res!922424 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45925 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!608009 (bvsub lt!608005 #b00000000000000000000000000000001)))))))

(declare-fun lt!608013 () (_ BitVec 32))

(declare-fun lt!608006 () (_ BitVec 32))

(assert (=> b!1380771 (= (bvadd lt!608013 lt!608006) lt!608009)))

(declare-fun lt!608007 () array!93960)

(declare-fun arrayCountValidKeys!0 (array!93960 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380771 (= lt!608009 (arrayCountValidKeys!0 lt!608007 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380771 (= lt!608013 (arrayCountValidKeys!0 lt!608007 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45808 0))(
  ( (Unit!45809) )
))
(declare-fun lt!608011 () Unit!45808)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45808)

(assert (=> b!1380771 (= lt!608011 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!608007 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!608010 () (_ BitVec 32))

(declare-fun lt!608014 () (_ BitVec 32))

(assert (=> b!1380771 (= (bvadd lt!608010 lt!608014) lt!608005)))

(assert (=> b!1380771 (= lt!608005 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380771 (= lt!608010 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!608012 () Unit!45808)

(assert (=> b!1380771 (= lt!608012 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1380772 () Bool)

(assert (=> b!1380772 (= e!782292 true)))

(assert (=> b!1380772 (= (arrayCountValidKeys!0 lt!608007 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun lt!608008 () Unit!45808)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93960 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45808)

(assert (=> b!1380772 (= lt!608008 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1380773 () Bool)

(assert (=> b!1380773 (= e!782295 e!782293)))

(declare-fun res!922423 () Bool)

(assert (=> b!1380773 (=> (not res!922423) (not e!782293))))

(assert (=> b!1380773 (= res!922423 (and (= lt!608006 (bvsub lt!608014 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1380773 (= lt!608006 (arrayCountValidKeys!0 lt!608007 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380773 (= lt!608014 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380773 (= lt!608007 (array!93961 (store (arr!45374 a!4094) i!1451 k!2953) (size!45925 a!4094)))))

(declare-fun b!1380774 () Bool)

(declare-fun res!922421 () Bool)

(assert (=> b!1380774 (=> (not res!922421) (not e!782295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380774 (= res!922421 (validKeyInArray!0 (select (arr!45374 a!4094) i!1451)))))

(declare-fun b!1380775 () Bool)

(declare-fun res!922420 () Bool)

(assert (=> b!1380775 (=> (not res!922420) (not e!782295))))

(assert (=> b!1380775 (= res!922420 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380776 () Bool)

(declare-fun res!922425 () Bool)

(assert (=> b!1380776 (=> (not res!922425) (not e!782295))))

(assert (=> b!1380776 (= res!922425 (and (bvslt (size!45925 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45925 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117480 res!922422) b!1380774))

(assert (= (and b!1380774 res!922421) b!1380775))

(assert (= (and b!1380775 res!922420) b!1380776))

(assert (= (and b!1380776 res!922425) b!1380773))

(assert (= (and b!1380773 res!922423) b!1380771))

(assert (= (and b!1380771 (not res!922424)) b!1380772))

(declare-fun m!1266177 () Bool)

(assert (=> b!1380772 m!1266177))

(declare-fun m!1266179 () Bool)

(assert (=> b!1380772 m!1266179))

(declare-fun m!1266181 () Bool)

(assert (=> b!1380772 m!1266181))

(declare-fun m!1266183 () Bool)

(assert (=> b!1380773 m!1266183))

(declare-fun m!1266185 () Bool)

(assert (=> b!1380773 m!1266185))

(declare-fun m!1266187 () Bool)

(assert (=> b!1380773 m!1266187))

(declare-fun m!1266189 () Bool)

(assert (=> b!1380775 m!1266189))

(declare-fun m!1266191 () Bool)

(assert (=> start!117480 m!1266191))

(declare-fun m!1266193 () Bool)

(assert (=> b!1380774 m!1266193))

(assert (=> b!1380774 m!1266193))

(declare-fun m!1266195 () Bool)

(assert (=> b!1380774 m!1266195))

(declare-fun m!1266197 () Bool)

(assert (=> b!1380771 m!1266197))

(declare-fun m!1266199 () Bool)

(assert (=> b!1380771 m!1266199))

(declare-fun m!1266201 () Bool)

(assert (=> b!1380771 m!1266201))

(declare-fun m!1266203 () Bool)

(assert (=> b!1380771 m!1266203))

(declare-fun m!1266205 () Bool)

(assert (=> b!1380771 m!1266205))

(declare-fun m!1266207 () Bool)

(assert (=> b!1380771 m!1266207))

(push 1)

(assert (not b!1380772))

(assert (not b!1380774))

(assert (not b!1380771))

(assert (not start!117480))

(assert (not b!1380775))

(assert (not b!1380773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

