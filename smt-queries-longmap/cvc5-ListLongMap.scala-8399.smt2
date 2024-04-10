; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102174 () Bool)

(assert start!102174)

(declare-fun b!1230014 () Bool)

(declare-fun res!818503 () Bool)

(declare-fun e!697980 () Bool)

(assert (=> b!1230014 (=> (not res!818503) (not e!697980))))

(declare-datatypes ((array!79349 0))(
  ( (array!79350 (arr!38294 (Array (_ BitVec 32) (_ BitVec 64))) (size!38830 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79349)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27067 0))(
  ( (Nil!27064) (Cons!27063 (h!28272 (_ BitVec 64)) (t!40530 List!27067)) )
))
(declare-fun acc!823 () List!27067)

(declare-fun arrayNoDuplicates!0 (array!79349 (_ BitVec 32) List!27067) Bool)

(assert (=> b!1230014 (= res!818503 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230015 () Bool)

(declare-fun res!818500 () Bool)

(assert (=> b!1230015 (=> (not res!818500) (not e!697980))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230015 (= res!818500 (validKeyInArray!0 k!2913))))

(declare-fun b!1230016 () Bool)

(declare-fun res!818506 () Bool)

(assert (=> b!1230016 (=> (not res!818506) (not e!697980))))

(declare-fun noDuplicate!1726 (List!27067) Bool)

(assert (=> b!1230016 (= res!818506 (noDuplicate!1726 acc!823))))

(declare-fun res!818502 () Bool)

(assert (=> start!102174 (=> (not res!818502) (not e!697980))))

(assert (=> start!102174 (= res!818502 (bvslt (size!38830 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102174 e!697980))

(declare-fun array_inv!29142 (array!79349) Bool)

(assert (=> start!102174 (array_inv!29142 a!3806)))

(assert (=> start!102174 true))

(declare-fun b!1230017 () Bool)

(declare-fun res!818501 () Bool)

(assert (=> b!1230017 (=> (not res!818501) (not e!697980))))

(declare-fun contains!7129 (List!27067 (_ BitVec 64)) Bool)

(assert (=> b!1230017 (= res!818501 (not (contains!7129 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230018 () Bool)

(declare-fun res!818504 () Bool)

(assert (=> b!1230018 (=> (not res!818504) (not e!697980))))

(assert (=> b!1230018 (= res!818504 (validKeyInArray!0 (select (arr!38294 a!3806) from!3184)))))

(declare-fun b!1230019 () Bool)

(declare-fun e!697978 () Bool)

(assert (=> b!1230019 (= e!697978 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27063 (select (arr!38294 a!3806) from!3184) Nil!27064)))))

(declare-fun b!1230020 () Bool)

(declare-fun res!818509 () Bool)

(assert (=> b!1230020 (=> (not res!818509) (not e!697980))))

(assert (=> b!1230020 (= res!818509 (not (contains!7129 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230021 () Bool)

(declare-fun res!818505 () Bool)

(assert (=> b!1230021 (=> (not res!818505) (not e!697980))))

(declare-fun arrayContainsKey!0 (array!79349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230021 (= res!818505 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230022 () Bool)

(assert (=> b!1230022 (= e!697980 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(assert (=> b!1230022 (not (arrayContainsKey!0 a!3806 (select (arr!38294 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40754 0))(
  ( (Unit!40755) )
))
(declare-fun lt!559304 () Unit!40754)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79349 (_ BitVec 32) (_ BitVec 64) List!27067) Unit!40754)

(assert (=> b!1230022 (= lt!559304 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38294 a!3806) from!3184) (Cons!27063 (select (arr!38294 a!3806) from!3184) Nil!27064)))))

(assert (=> b!1230022 e!697978))

(declare-fun res!818508 () Bool)

(assert (=> b!1230022 (=> (not res!818508) (not e!697978))))

(assert (=> b!1230022 (= res!818508 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27064))))

(declare-fun lt!559303 () Unit!40754)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79349 List!27067 List!27067 (_ BitVec 32)) Unit!40754)

(assert (=> b!1230022 (= lt!559303 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27064 from!3184))))

(assert (=> b!1230022 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27063 (select (arr!38294 a!3806) from!3184) acc!823))))

(declare-fun b!1230023 () Bool)

(declare-fun res!818507 () Bool)

(assert (=> b!1230023 (=> (not res!818507) (not e!697980))))

(assert (=> b!1230023 (= res!818507 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38830 a!3806)) (bvslt from!3184 (size!38830 a!3806))))))

(assert (= (and start!102174 res!818502) b!1230015))

(assert (= (and b!1230015 res!818500) b!1230023))

(assert (= (and b!1230023 res!818507) b!1230016))

(assert (= (and b!1230016 res!818506) b!1230017))

(assert (= (and b!1230017 res!818501) b!1230020))

(assert (= (and b!1230020 res!818509) b!1230021))

(assert (= (and b!1230021 res!818505) b!1230014))

(assert (= (and b!1230014 res!818503) b!1230018))

(assert (= (and b!1230018 res!818504) b!1230022))

(assert (= (and b!1230022 res!818508) b!1230019))

(declare-fun m!1134469 () Bool)

(assert (=> b!1230021 m!1134469))

(declare-fun m!1134471 () Bool)

(assert (=> start!102174 m!1134471))

(declare-fun m!1134473 () Bool)

(assert (=> b!1230018 m!1134473))

(assert (=> b!1230018 m!1134473))

(declare-fun m!1134475 () Bool)

(assert (=> b!1230018 m!1134475))

(declare-fun m!1134477 () Bool)

(assert (=> b!1230016 m!1134477))

(assert (=> b!1230019 m!1134473))

(declare-fun m!1134479 () Bool)

(assert (=> b!1230019 m!1134479))

(declare-fun m!1134481 () Bool)

(assert (=> b!1230014 m!1134481))

(declare-fun m!1134483 () Bool)

(assert (=> b!1230022 m!1134483))

(declare-fun m!1134485 () Bool)

(assert (=> b!1230022 m!1134485))

(assert (=> b!1230022 m!1134473))

(declare-fun m!1134487 () Bool)

(assert (=> b!1230022 m!1134487))

(assert (=> b!1230022 m!1134473))

(declare-fun m!1134489 () Bool)

(assert (=> b!1230022 m!1134489))

(assert (=> b!1230022 m!1134473))

(declare-fun m!1134491 () Bool)

(assert (=> b!1230022 m!1134491))

(declare-fun m!1134493 () Bool)

(assert (=> b!1230020 m!1134493))

(declare-fun m!1134495 () Bool)

(assert (=> b!1230017 m!1134495))

(declare-fun m!1134497 () Bool)

(assert (=> b!1230015 m!1134497))

(push 1)

