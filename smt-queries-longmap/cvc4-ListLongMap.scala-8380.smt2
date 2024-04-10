; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101960 () Bool)

(assert start!101960)

(declare-fun res!816020 () Bool)

(declare-fun e!696977 () Bool)

(assert (=> start!101960 (=> (not res!816020) (not e!696977))))

(declare-datatypes ((array!79233 0))(
  ( (array!79234 (arr!38239 (Array (_ BitVec 32) (_ BitVec 64))) (size!38775 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79233)

(assert (=> start!101960 (= res!816020 (bvslt (size!38775 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101960 e!696977))

(declare-fun array_inv!29087 (array!79233) Bool)

(assert (=> start!101960 (array_inv!29087 a!3806)))

(assert (=> start!101960 true))

(declare-fun b!1227403 () Bool)

(declare-fun res!816026 () Bool)

(assert (=> b!1227403 (=> (not res!816026) (not e!696977))))

(declare-datatypes ((List!27012 0))(
  ( (Nil!27009) (Cons!27008 (h!28217 (_ BitVec 64)) (t!40475 List!27012)) )
))
(declare-fun acc!823 () List!27012)

(declare-fun noDuplicate!1671 (List!27012) Bool)

(assert (=> b!1227403 (= res!816026 (noDuplicate!1671 acc!823))))

(declare-fun b!1227404 () Bool)

(declare-fun e!696975 () Bool)

(assert (=> b!1227404 (= e!696975 true)))

(declare-datatypes ((Unit!40644 0))(
  ( (Unit!40645) )
))
(declare-fun lt!558912 () Unit!40644)

(declare-fun noDuplicateSubseq!31 (List!27012 List!27012) Unit!40644)

(assert (=> b!1227404 (= lt!558912 (noDuplicateSubseq!31 Nil!27009 acc!823))))

(declare-fun b!1227405 () Bool)

(declare-fun res!816018 () Bool)

(assert (=> b!1227405 (=> (not res!816018) (not e!696977))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227405 (= res!816018 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227406 () Bool)

(declare-fun res!816015 () Bool)

(assert (=> b!1227406 (=> (not res!816015) (not e!696977))))

(declare-fun contains!7074 (List!27012 (_ BitVec 64)) Bool)

(assert (=> b!1227406 (= res!816015 (not (contains!7074 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227407 () Bool)

(declare-fun res!816022 () Bool)

(assert (=> b!1227407 (=> res!816022 e!696975)))

(declare-fun subseq!478 (List!27012 List!27012) Bool)

(assert (=> b!1227407 (= res!816022 (not (subseq!478 Nil!27009 acc!823)))))

(declare-fun b!1227408 () Bool)

(declare-fun res!816027 () Bool)

(assert (=> b!1227408 (=> (not res!816027) (not e!696977))))

(declare-fun arrayNoDuplicates!0 (array!79233 (_ BitVec 32) List!27012) Bool)

(assert (=> b!1227408 (= res!816027 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227409 () Bool)

(declare-fun res!816024 () Bool)

(assert (=> b!1227409 (=> (not res!816024) (not e!696977))))

(assert (=> b!1227409 (= res!816024 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38775 a!3806)) (bvslt from!3184 (size!38775 a!3806))))))

(declare-fun b!1227410 () Bool)

(declare-fun res!816016 () Bool)

(assert (=> b!1227410 (=> (not res!816016) (not e!696977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227410 (= res!816016 (validKeyInArray!0 k!2913))))

(declare-fun b!1227411 () Bool)

(declare-fun res!816017 () Bool)

(assert (=> b!1227411 (=> res!816017 e!696975)))

(assert (=> b!1227411 (= res!816017 (contains!7074 Nil!27009 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227412 () Bool)

(declare-fun res!816021 () Bool)

(assert (=> b!1227412 (=> (not res!816021) (not e!696977))))

(assert (=> b!1227412 (= res!816021 (validKeyInArray!0 (select (arr!38239 a!3806) from!3184)))))

(declare-fun b!1227413 () Bool)

(assert (=> b!1227413 (= e!696977 (not e!696975))))

(declare-fun res!816019 () Bool)

(assert (=> b!1227413 (=> res!816019 e!696975)))

(assert (=> b!1227413 (= res!816019 (bvsgt from!3184 (size!38775 a!3806)))))

(assert (=> b!1227413 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27008 (select (arr!38239 a!3806) from!3184) acc!823))))

(declare-fun b!1227414 () Bool)

(declare-fun res!816023 () Bool)

(assert (=> b!1227414 (=> res!816023 e!696975)))

(assert (=> b!1227414 (= res!816023 (contains!7074 Nil!27009 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227415 () Bool)

(declare-fun res!816025 () Bool)

(assert (=> b!1227415 (=> (not res!816025) (not e!696977))))

(assert (=> b!1227415 (= res!816025 (not (contains!7074 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101960 res!816020) b!1227410))

(assert (= (and b!1227410 res!816016) b!1227409))

(assert (= (and b!1227409 res!816024) b!1227403))

(assert (= (and b!1227403 res!816026) b!1227406))

(assert (= (and b!1227406 res!816015) b!1227415))

(assert (= (and b!1227415 res!816025) b!1227405))

(assert (= (and b!1227405 res!816018) b!1227408))

(assert (= (and b!1227408 res!816027) b!1227412))

(assert (= (and b!1227412 res!816021) b!1227413))

(assert (= (and b!1227413 (not res!816019)) b!1227411))

(assert (= (and b!1227411 (not res!816017)) b!1227414))

(assert (= (and b!1227414 (not res!816023)) b!1227407))

(assert (= (and b!1227407 (not res!816022)) b!1227404))

(declare-fun m!1132199 () Bool)

(assert (=> b!1227414 m!1132199))

(declare-fun m!1132201 () Bool)

(assert (=> b!1227412 m!1132201))

(assert (=> b!1227412 m!1132201))

(declare-fun m!1132203 () Bool)

(assert (=> b!1227412 m!1132203))

(declare-fun m!1132205 () Bool)

(assert (=> b!1227408 m!1132205))

(declare-fun m!1132207 () Bool)

(assert (=> b!1227403 m!1132207))

(declare-fun m!1132209 () Bool)

(assert (=> b!1227411 m!1132209))

(declare-fun m!1132211 () Bool)

(assert (=> b!1227410 m!1132211))

(declare-fun m!1132213 () Bool)

(assert (=> start!101960 m!1132213))

(declare-fun m!1132215 () Bool)

(assert (=> b!1227404 m!1132215))

(declare-fun m!1132217 () Bool)

(assert (=> b!1227415 m!1132217))

(assert (=> b!1227413 m!1132201))

(declare-fun m!1132219 () Bool)

(assert (=> b!1227413 m!1132219))

(declare-fun m!1132221 () Bool)

(assert (=> b!1227405 m!1132221))

(declare-fun m!1132223 () Bool)

(assert (=> b!1227406 m!1132223))

(declare-fun m!1132225 () Bool)

(assert (=> b!1227407 m!1132225))

(push 1)

(assert (not b!1227410))

(assert (not b!1227408))

(assert (not b!1227411))

(assert (not b!1227412))

(assert (not b!1227405))

(assert (not b!1227407))

(assert (not b!1227404))

(assert (not b!1227406))

(assert (not b!1227415))

(assert (not start!101960))

(assert (not b!1227403))

(assert (not b!1227414))

(assert (not b!1227413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

