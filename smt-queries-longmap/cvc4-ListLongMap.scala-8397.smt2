; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102166 () Bool)

(assert start!102166)

(declare-fun b!1229854 () Bool)

(declare-fun res!818342 () Bool)

(declare-fun e!697932 () Bool)

(assert (=> b!1229854 (=> (not res!818342) (not e!697932))))

(declare-datatypes ((List!27063 0))(
  ( (Nil!27060) (Cons!27059 (h!28268 (_ BitVec 64)) (t!40526 List!27063)) )
))
(declare-fun acc!823 () List!27063)

(declare-fun noDuplicate!1722 (List!27063) Bool)

(assert (=> b!1229854 (= res!818342 (noDuplicate!1722 acc!823))))

(declare-fun b!1229855 () Bool)

(declare-fun e!697935 () Bool)

(assert (=> b!1229855 (= e!697932 (not e!697935))))

(declare-fun res!818352 () Bool)

(assert (=> b!1229855 (=> res!818352 e!697935)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1229855 (= res!818352 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun lt!559269 () List!27063)

(declare-datatypes ((array!79341 0))(
  ( (array!79342 (arr!38290 (Array (_ BitVec 32) (_ BitVec 64))) (size!38826 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79341)

(assert (=> b!1229855 (= lt!559269 (Cons!27059 (select (arr!38290 a!3806) from!3184) Nil!27060))))

(declare-fun e!697933 () Bool)

(assert (=> b!1229855 e!697933))

(declare-fun res!818341 () Bool)

(assert (=> b!1229855 (=> (not res!818341) (not e!697933))))

(declare-fun arrayNoDuplicates!0 (array!79341 (_ BitVec 32) List!27063) Bool)

(assert (=> b!1229855 (= res!818341 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27060))))

(declare-datatypes ((Unit!40746 0))(
  ( (Unit!40747) )
))
(declare-fun lt!559270 () Unit!40746)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79341 List!27063 List!27063 (_ BitVec 32)) Unit!40746)

(assert (=> b!1229855 (= lt!559270 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27060 from!3184))))

(assert (=> b!1229855 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27059 (select (arr!38290 a!3806) from!3184) acc!823))))

(declare-fun b!1229856 () Bool)

(declare-fun res!818343 () Bool)

(assert (=> b!1229856 (=> (not res!818343) (not e!697932))))

(assert (=> b!1229856 (= res!818343 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229857 () Bool)

(declare-fun res!818353 () Bool)

(assert (=> b!1229857 (=> (not res!818353) (not e!697932))))

(assert (=> b!1229857 (= res!818353 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38826 a!3806)) (bvslt from!3184 (size!38826 a!3806))))))

(declare-fun b!1229858 () Bool)

(declare-fun res!818345 () Bool)

(assert (=> b!1229858 (=> (not res!818345) (not e!697932))))

(declare-fun contains!7125 (List!27063 (_ BitVec 64)) Bool)

(assert (=> b!1229858 (= res!818345 (not (contains!7125 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229859 () Bool)

(assert (=> b!1229859 (= e!697933 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27059 (select (arr!38290 a!3806) from!3184) Nil!27060)))))

(declare-fun b!1229860 () Bool)

(declare-fun res!818350 () Bool)

(assert (=> b!1229860 (=> (not res!818350) (not e!697932))))

(assert (=> b!1229860 (= res!818350 (not (contains!7125 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229861 () Bool)

(declare-fun res!818351 () Bool)

(assert (=> b!1229861 (=> res!818351 e!697935)))

(assert (=> b!1229861 (= res!818351 (contains!7125 lt!559269 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!818344 () Bool)

(assert (=> start!102166 (=> (not res!818344) (not e!697932))))

(assert (=> start!102166 (= res!818344 (bvslt (size!38826 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102166 e!697932))

(declare-fun array_inv!29138 (array!79341) Bool)

(assert (=> start!102166 (array_inv!29138 a!3806)))

(assert (=> start!102166 true))

(declare-fun b!1229862 () Bool)

(declare-fun res!818348 () Bool)

(assert (=> b!1229862 (=> res!818348 e!697935)))

(assert (=> b!1229862 (= res!818348 (contains!7125 lt!559269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229863 () Bool)

(declare-fun res!818347 () Bool)

(assert (=> b!1229863 (=> (not res!818347) (not e!697932))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229863 (= res!818347 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229864 () Bool)

(declare-fun res!818340 () Bool)

(assert (=> b!1229864 (=> (not res!818340) (not e!697932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229864 (= res!818340 (validKeyInArray!0 (select (arr!38290 a!3806) from!3184)))))

(declare-fun b!1229865 () Bool)

(declare-fun res!818346 () Bool)

(assert (=> b!1229865 (=> res!818346 e!697935)))

(assert (=> b!1229865 (= res!818346 (not (noDuplicate!1722 lt!559269)))))

(declare-fun b!1229866 () Bool)

(assert (=> b!1229866 (= e!697935 true)))

(declare-fun lt!559271 () Bool)

(assert (=> b!1229866 (= lt!559271 (contains!7125 lt!559269 (select (arr!38290 a!3806) from!3184)))))

(declare-fun b!1229867 () Bool)

(declare-fun res!818349 () Bool)

(assert (=> b!1229867 (=> (not res!818349) (not e!697932))))

(assert (=> b!1229867 (= res!818349 (validKeyInArray!0 k!2913))))

(assert (= (and start!102166 res!818344) b!1229867))

(assert (= (and b!1229867 res!818349) b!1229857))

(assert (= (and b!1229857 res!818353) b!1229854))

(assert (= (and b!1229854 res!818342) b!1229860))

(assert (= (and b!1229860 res!818350) b!1229858))

(assert (= (and b!1229858 res!818345) b!1229863))

(assert (= (and b!1229863 res!818347) b!1229856))

(assert (= (and b!1229856 res!818343) b!1229864))

(assert (= (and b!1229864 res!818340) b!1229855))

(assert (= (and b!1229855 res!818341) b!1229859))

(assert (= (and b!1229855 (not res!818352)) b!1229865))

(assert (= (and b!1229865 (not res!818346)) b!1229862))

(assert (= (and b!1229862 (not res!818348)) b!1229861))

(assert (= (and b!1229861 (not res!818351)) b!1229866))

(declare-fun m!1134333 () Bool)

(assert (=> b!1229858 m!1134333))

(declare-fun m!1134335 () Bool)

(assert (=> b!1229861 m!1134335))

(declare-fun m!1134337 () Bool)

(assert (=> b!1229855 m!1134337))

(declare-fun m!1134339 () Bool)

(assert (=> b!1229855 m!1134339))

(declare-fun m!1134341 () Bool)

(assert (=> b!1229855 m!1134341))

(declare-fun m!1134343 () Bool)

(assert (=> b!1229855 m!1134343))

(declare-fun m!1134345 () Bool)

(assert (=> b!1229862 m!1134345))

(declare-fun m!1134347 () Bool)

(assert (=> start!102166 m!1134347))

(declare-fun m!1134349 () Bool)

(assert (=> b!1229863 m!1134349))

(declare-fun m!1134351 () Bool)

(assert (=> b!1229867 m!1134351))

(assert (=> b!1229864 m!1134337))

(assert (=> b!1229864 m!1134337))

(declare-fun m!1134353 () Bool)

(assert (=> b!1229864 m!1134353))

(declare-fun m!1134355 () Bool)

(assert (=> b!1229860 m!1134355))

(declare-fun m!1134357 () Bool)

(assert (=> b!1229865 m!1134357))

(assert (=> b!1229866 m!1134337))

(assert (=> b!1229866 m!1134337))

(declare-fun m!1134359 () Bool)

(assert (=> b!1229866 m!1134359))

(declare-fun m!1134361 () Bool)

(assert (=> b!1229856 m!1134361))

(assert (=> b!1229859 m!1134337))

(declare-fun m!1134363 () Bool)

(assert (=> b!1229859 m!1134363))

(declare-fun m!1134365 () Bool)

(assert (=> b!1229854 m!1134365))

(push 1)

(assert (not b!1229858))

(assert (not b!1229854))

(assert (not b!1229864))

(assert (not b!1229860))

(assert (not b!1229863))

(assert (not b!1229856))

(assert (not start!102166))

(assert (not b!1229866))

(assert (not b!1229867))

(assert (not b!1229862))

(assert (not b!1229861))

(assert (not b!1229865))

(assert (not b!1229855))

(assert (not b!1229859))

