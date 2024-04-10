; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101962 () Bool)

(assert start!101962)

(declare-fun b!1227442 () Bool)

(declare-fun res!816063 () Bool)

(declare-fun e!696985 () Bool)

(assert (=> b!1227442 (=> res!816063 e!696985)))

(declare-datatypes ((List!27013 0))(
  ( (Nil!27010) (Cons!27009 (h!28218 (_ BitVec 64)) (t!40476 List!27013)) )
))
(declare-fun contains!7075 (List!27013 (_ BitVec 64)) Bool)

(assert (=> b!1227442 (= res!816063 (contains!7075 Nil!27010 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227443 () Bool)

(assert (=> b!1227443 (= e!696985 true)))

(declare-datatypes ((Unit!40646 0))(
  ( (Unit!40647) )
))
(declare-fun lt!558915 () Unit!40646)

(declare-fun acc!823 () List!27013)

(declare-fun noDuplicateSubseq!32 (List!27013 List!27013) Unit!40646)

(assert (=> b!1227443 (= lt!558915 (noDuplicateSubseq!32 Nil!27010 acc!823))))

(declare-fun b!1227444 () Bool)

(declare-fun res!816058 () Bool)

(declare-fun e!696984 () Bool)

(assert (=> b!1227444 (=> (not res!816058) (not e!696984))))

(declare-datatypes ((array!79235 0))(
  ( (array!79236 (arr!38240 (Array (_ BitVec 32) (_ BitVec 64))) (size!38776 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79235)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227444 (= res!816058 (validKeyInArray!0 (select (arr!38240 a!3806) from!3184)))))

(declare-fun b!1227445 () Bool)

(declare-fun res!816056 () Bool)

(assert (=> b!1227445 (=> (not res!816056) (not e!696984))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227445 (= res!816056 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227446 () Bool)

(declare-fun res!816066 () Bool)

(assert (=> b!1227446 (=> res!816066 e!696985)))

(assert (=> b!1227446 (= res!816066 (contains!7075 Nil!27010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227448 () Bool)

(assert (=> b!1227448 (= e!696984 (not e!696985))))

(declare-fun res!816059 () Bool)

(assert (=> b!1227448 (=> res!816059 e!696985)))

(assert (=> b!1227448 (= res!816059 (bvsgt from!3184 (size!38776 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79235 (_ BitVec 32) List!27013) Bool)

(assert (=> b!1227448 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27009 (select (arr!38240 a!3806) from!3184) acc!823))))

(declare-fun b!1227449 () Bool)

(declare-fun res!816062 () Bool)

(assert (=> b!1227449 (=> (not res!816062) (not e!696984))))

(assert (=> b!1227449 (= res!816062 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38776 a!3806)) (bvslt from!3184 (size!38776 a!3806))))))

(declare-fun b!1227450 () Bool)

(declare-fun res!816055 () Bool)

(assert (=> b!1227450 (=> res!816055 e!696985)))

(declare-fun subseq!479 (List!27013 List!27013) Bool)

(assert (=> b!1227450 (= res!816055 (not (subseq!479 Nil!27010 acc!823)))))

(declare-fun b!1227451 () Bool)

(declare-fun res!816060 () Bool)

(assert (=> b!1227451 (=> (not res!816060) (not e!696984))))

(assert (=> b!1227451 (= res!816060 (not (contains!7075 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227452 () Bool)

(declare-fun res!816061 () Bool)

(assert (=> b!1227452 (=> (not res!816061) (not e!696984))))

(assert (=> b!1227452 (= res!816061 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!816064 () Bool)

(assert (=> start!101962 (=> (not res!816064) (not e!696984))))

(assert (=> start!101962 (= res!816064 (bvslt (size!38776 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101962 e!696984))

(declare-fun array_inv!29088 (array!79235) Bool)

(assert (=> start!101962 (array_inv!29088 a!3806)))

(assert (=> start!101962 true))

(declare-fun b!1227447 () Bool)

(declare-fun res!816057 () Bool)

(assert (=> b!1227447 (=> (not res!816057) (not e!696984))))

(assert (=> b!1227447 (= res!816057 (validKeyInArray!0 k!2913))))

(declare-fun b!1227453 () Bool)

(declare-fun res!816065 () Bool)

(assert (=> b!1227453 (=> (not res!816065) (not e!696984))))

(declare-fun noDuplicate!1672 (List!27013) Bool)

(assert (=> b!1227453 (= res!816065 (noDuplicate!1672 acc!823))))

(declare-fun b!1227454 () Bool)

(declare-fun res!816054 () Bool)

(assert (=> b!1227454 (=> (not res!816054) (not e!696984))))

(assert (=> b!1227454 (= res!816054 (not (contains!7075 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101962 res!816064) b!1227447))

(assert (= (and b!1227447 res!816057) b!1227449))

(assert (= (and b!1227449 res!816062) b!1227453))

(assert (= (and b!1227453 res!816065) b!1227451))

(assert (= (and b!1227451 res!816060) b!1227454))

(assert (= (and b!1227454 res!816054) b!1227445))

(assert (= (and b!1227445 res!816056) b!1227452))

(assert (= (and b!1227452 res!816061) b!1227444))

(assert (= (and b!1227444 res!816058) b!1227448))

(assert (= (and b!1227448 (not res!816059)) b!1227446))

(assert (= (and b!1227446 (not res!816066)) b!1227442))

(assert (= (and b!1227442 (not res!816063)) b!1227450))

(assert (= (and b!1227450 (not res!816055)) b!1227443))

(declare-fun m!1132227 () Bool)

(assert (=> b!1227444 m!1132227))

(assert (=> b!1227444 m!1132227))

(declare-fun m!1132229 () Bool)

(assert (=> b!1227444 m!1132229))

(declare-fun m!1132231 () Bool)

(assert (=> b!1227443 m!1132231))

(assert (=> b!1227448 m!1132227))

(declare-fun m!1132233 () Bool)

(assert (=> b!1227448 m!1132233))

(declare-fun m!1132235 () Bool)

(assert (=> b!1227451 m!1132235))

(declare-fun m!1132237 () Bool)

(assert (=> b!1227450 m!1132237))

(declare-fun m!1132239 () Bool)

(assert (=> b!1227454 m!1132239))

(declare-fun m!1132241 () Bool)

(assert (=> b!1227447 m!1132241))

(declare-fun m!1132243 () Bool)

(assert (=> b!1227446 m!1132243))

(declare-fun m!1132245 () Bool)

(assert (=> b!1227442 m!1132245))

(declare-fun m!1132247 () Bool)

(assert (=> start!101962 m!1132247))

(declare-fun m!1132249 () Bool)

(assert (=> b!1227453 m!1132249))

(declare-fun m!1132251 () Bool)

(assert (=> b!1227445 m!1132251))

(declare-fun m!1132253 () Bool)

(assert (=> b!1227452 m!1132253))

(push 1)

(assert (not b!1227447))

(assert (not b!1227452))

(assert (not b!1227453))

(assert (not b!1227443))

(assert (not b!1227450))

(assert (not b!1227446))

(assert (not b!1227442))

(assert (not b!1227444))

(assert (not start!101962))

(assert (not b!1227454))

(assert (not b!1227448))

(assert (not b!1227451))

(assert (not b!1227445))

(check-sat)

(pop 1)

