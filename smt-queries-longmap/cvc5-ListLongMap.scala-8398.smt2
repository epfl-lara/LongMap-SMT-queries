; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102168 () Bool)

(assert start!102168)

(declare-fun b!1229896 () Bool)

(declare-fun res!818391 () Bool)

(declare-fun e!697946 () Bool)

(assert (=> b!1229896 (=> res!818391 e!697946)))

(declare-datatypes ((List!27064 0))(
  ( (Nil!27061) (Cons!27060 (h!28269 (_ BitVec 64)) (t!40527 List!27064)) )
))
(declare-fun lt!559279 () List!27064)

(declare-fun contains!7126 (List!27064 (_ BitVec 64)) Bool)

(assert (=> b!1229896 (= res!818391 (contains!7126 lt!559279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229897 () Bool)

(declare-fun res!818386 () Bool)

(declare-fun e!697945 () Bool)

(assert (=> b!1229897 (=> (not res!818386) (not e!697945))))

(declare-datatypes ((array!79343 0))(
  ( (array!79344 (arr!38291 (Array (_ BitVec 32) (_ BitVec 64))) (size!38827 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79343)

(declare-fun acc!823 () List!27064)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79343 (_ BitVec 32) List!27064) Bool)

(assert (=> b!1229897 (= res!818386 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229898 () Bool)

(declare-fun res!818395 () Bool)

(assert (=> b!1229898 (=> (not res!818395) (not e!697945))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229898 (= res!818395 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229899 () Bool)

(assert (=> b!1229899 (= e!697945 (not e!697946))))

(declare-fun res!818388 () Bool)

(assert (=> b!1229899 (=> res!818388 e!697946)))

(assert (=> b!1229899 (= res!818388 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229899 (= lt!559279 (Cons!27060 (select (arr!38291 a!3806) from!3184) Nil!27061))))

(declare-fun e!697944 () Bool)

(assert (=> b!1229899 e!697944))

(declare-fun res!818387 () Bool)

(assert (=> b!1229899 (=> (not res!818387) (not e!697944))))

(assert (=> b!1229899 (= res!818387 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27061))))

(declare-datatypes ((Unit!40748 0))(
  ( (Unit!40749) )
))
(declare-fun lt!559280 () Unit!40748)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79343 List!27064 List!27064 (_ BitVec 32)) Unit!40748)

(assert (=> b!1229899 (= lt!559280 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27061 from!3184))))

(assert (=> b!1229899 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27060 (select (arr!38291 a!3806) from!3184) acc!823))))

(declare-fun b!1229901 () Bool)

(declare-fun res!818393 () Bool)

(assert (=> b!1229901 (=> res!818393 e!697946)))

(declare-fun noDuplicate!1723 (List!27064) Bool)

(assert (=> b!1229901 (= res!818393 (not (noDuplicate!1723 lt!559279)))))

(declare-fun b!1229902 () Bool)

(declare-fun res!818382 () Bool)

(assert (=> b!1229902 (=> (not res!818382) (not e!697945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229902 (= res!818382 (validKeyInArray!0 (select (arr!38291 a!3806) from!3184)))))

(declare-fun b!1229903 () Bool)

(declare-fun res!818385 () Bool)

(assert (=> b!1229903 (=> res!818385 e!697946)))

(assert (=> b!1229903 (= res!818385 (contains!7126 lt!559279 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229904 () Bool)

(assert (=> b!1229904 (= e!697944 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27060 (select (arr!38291 a!3806) from!3184) Nil!27061)))))

(declare-fun b!1229905 () Bool)

(declare-fun res!818392 () Bool)

(assert (=> b!1229905 (=> (not res!818392) (not e!697945))))

(assert (=> b!1229905 (= res!818392 (not (contains!7126 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229906 () Bool)

(assert (=> b!1229906 (= e!697946 true)))

(declare-fun lt!559278 () Bool)

(assert (=> b!1229906 (= lt!559278 (contains!7126 lt!559279 (select (arr!38291 a!3806) from!3184)))))

(declare-fun b!1229907 () Bool)

(declare-fun res!818384 () Bool)

(assert (=> b!1229907 (=> (not res!818384) (not e!697945))))

(assert (=> b!1229907 (= res!818384 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38827 a!3806)) (bvslt from!3184 (size!38827 a!3806))))))

(declare-fun b!1229908 () Bool)

(declare-fun res!818394 () Bool)

(assert (=> b!1229908 (=> (not res!818394) (not e!697945))))

(assert (=> b!1229908 (= res!818394 (noDuplicate!1723 acc!823))))

(declare-fun b!1229909 () Bool)

(declare-fun res!818383 () Bool)

(assert (=> b!1229909 (=> (not res!818383) (not e!697945))))

(assert (=> b!1229909 (= res!818383 (not (contains!7126 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!818390 () Bool)

(assert (=> start!102168 (=> (not res!818390) (not e!697945))))

(assert (=> start!102168 (= res!818390 (bvslt (size!38827 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102168 e!697945))

(declare-fun array_inv!29139 (array!79343) Bool)

(assert (=> start!102168 (array_inv!29139 a!3806)))

(assert (=> start!102168 true))

(declare-fun b!1229900 () Bool)

(declare-fun res!818389 () Bool)

(assert (=> b!1229900 (=> (not res!818389) (not e!697945))))

(assert (=> b!1229900 (= res!818389 (validKeyInArray!0 k!2913))))

(assert (= (and start!102168 res!818390) b!1229900))

(assert (= (and b!1229900 res!818389) b!1229907))

(assert (= (and b!1229907 res!818384) b!1229908))

(assert (= (and b!1229908 res!818394) b!1229909))

(assert (= (and b!1229909 res!818383) b!1229905))

(assert (= (and b!1229905 res!818392) b!1229898))

(assert (= (and b!1229898 res!818395) b!1229897))

(assert (= (and b!1229897 res!818386) b!1229902))

(assert (= (and b!1229902 res!818382) b!1229899))

(assert (= (and b!1229899 res!818387) b!1229904))

(assert (= (and b!1229899 (not res!818388)) b!1229901))

(assert (= (and b!1229901 (not res!818393)) b!1229896))

(assert (= (and b!1229896 (not res!818391)) b!1229903))

(assert (= (and b!1229903 (not res!818385)) b!1229906))

(declare-fun m!1134367 () Bool)

(assert (=> b!1229903 m!1134367))

(declare-fun m!1134369 () Bool)

(assert (=> b!1229899 m!1134369))

(declare-fun m!1134371 () Bool)

(assert (=> b!1229899 m!1134371))

(declare-fun m!1134373 () Bool)

(assert (=> b!1229899 m!1134373))

(declare-fun m!1134375 () Bool)

(assert (=> b!1229899 m!1134375))

(assert (=> b!1229904 m!1134369))

(declare-fun m!1134377 () Bool)

(assert (=> b!1229904 m!1134377))

(declare-fun m!1134379 () Bool)

(assert (=> b!1229905 m!1134379))

(declare-fun m!1134381 () Bool)

(assert (=> b!1229901 m!1134381))

(assert (=> b!1229906 m!1134369))

(assert (=> b!1229906 m!1134369))

(declare-fun m!1134383 () Bool)

(assert (=> b!1229906 m!1134383))

(declare-fun m!1134385 () Bool)

(assert (=> b!1229908 m!1134385))

(declare-fun m!1134387 () Bool)

(assert (=> start!102168 m!1134387))

(declare-fun m!1134389 () Bool)

(assert (=> b!1229897 m!1134389))

(declare-fun m!1134391 () Bool)

(assert (=> b!1229896 m!1134391))

(assert (=> b!1229902 m!1134369))

(assert (=> b!1229902 m!1134369))

(declare-fun m!1134393 () Bool)

(assert (=> b!1229902 m!1134393))

(declare-fun m!1134395 () Bool)

(assert (=> b!1229898 m!1134395))

(declare-fun m!1134397 () Bool)

(assert (=> b!1229909 m!1134397))

(declare-fun m!1134399 () Bool)

(assert (=> b!1229900 m!1134399))

(push 1)

(assert (not b!1229899))

(assert (not b!1229903))

(assert (not b!1229909))

(assert (not b!1229905))

(assert (not b!1229900))

(assert (not b!1229902))

(assert (not b!1229908))

(assert (not b!1229898))

(assert (not b!1229897))

(assert (not b!1229896))

(assert (not b!1229906))

(assert (not b!1229904))

(assert (not start!102168))

(assert (not b!1229901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

