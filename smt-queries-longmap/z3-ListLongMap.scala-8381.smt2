; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101964 () Bool)

(assert start!101964)

(declare-fun b!1227481 () Bool)

(declare-fun res!816094 () Bool)

(declare-fun e!696994 () Bool)

(assert (=> b!1227481 (=> res!816094 e!696994)))

(declare-datatypes ((List!27014 0))(
  ( (Nil!27011) (Cons!27010 (h!28219 (_ BitVec 64)) (t!40477 List!27014)) )
))
(declare-fun contains!7076 (List!27014 (_ BitVec 64)) Bool)

(assert (=> b!1227481 (= res!816094 (contains!7076 Nil!27011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227482 () Bool)

(declare-fun res!816096 () Bool)

(assert (=> b!1227482 (=> res!816096 e!696994)))

(assert (=> b!1227482 (= res!816096 (contains!7076 Nil!27011 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227483 () Bool)

(declare-fun res!816098 () Bool)

(declare-fun e!696995 () Bool)

(assert (=> b!1227483 (=> (not res!816098) (not e!696995))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79237 0))(
  ( (array!79238 (arr!38241 (Array (_ BitVec 32) (_ BitVec 64))) (size!38777 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79237)

(assert (=> b!1227483 (= res!816098 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38777 a!3806)) (bvslt from!3184 (size!38777 a!3806))))))

(declare-fun b!1227484 () Bool)

(assert (=> b!1227484 (= e!696994 true)))

(declare-datatypes ((Unit!40648 0))(
  ( (Unit!40649) )
))
(declare-fun lt!558918 () Unit!40648)

(declare-fun acc!823 () List!27014)

(declare-fun noDuplicateSubseq!33 (List!27014 List!27014) Unit!40648)

(assert (=> b!1227484 (= lt!558918 (noDuplicateSubseq!33 Nil!27011 acc!823))))

(declare-fun res!816095 () Bool)

(assert (=> start!101964 (=> (not res!816095) (not e!696995))))

(assert (=> start!101964 (= res!816095 (bvslt (size!38777 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101964 e!696995))

(declare-fun array_inv!29089 (array!79237) Bool)

(assert (=> start!101964 (array_inv!29089 a!3806)))

(assert (=> start!101964 true))

(declare-fun b!1227485 () Bool)

(declare-fun res!816093 () Bool)

(assert (=> b!1227485 (=> (not res!816093) (not e!696995))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227485 (= res!816093 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227486 () Bool)

(declare-fun res!816100 () Bool)

(assert (=> b!1227486 (=> (not res!816100) (not e!696995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227486 (= res!816100 (validKeyInArray!0 (select (arr!38241 a!3806) from!3184)))))

(declare-fun b!1227487 () Bool)

(declare-fun res!816102 () Bool)

(assert (=> b!1227487 (=> (not res!816102) (not e!696995))))

(declare-fun arrayNoDuplicates!0 (array!79237 (_ BitVec 32) List!27014) Bool)

(assert (=> b!1227487 (= res!816102 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227488 () Bool)

(declare-fun res!816104 () Bool)

(assert (=> b!1227488 (=> (not res!816104) (not e!696995))))

(assert (=> b!1227488 (= res!816104 (validKeyInArray!0 k0!2913))))

(declare-fun b!1227489 () Bool)

(declare-fun res!816097 () Bool)

(assert (=> b!1227489 (=> (not res!816097) (not e!696995))))

(assert (=> b!1227489 (= res!816097 (not (contains!7076 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227490 () Bool)

(assert (=> b!1227490 (= e!696995 (not e!696994))))

(declare-fun res!816103 () Bool)

(assert (=> b!1227490 (=> res!816103 e!696994)))

(assert (=> b!1227490 (= res!816103 (bvsgt from!3184 (size!38777 a!3806)))))

(assert (=> b!1227490 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27010 (select (arr!38241 a!3806) from!3184) acc!823))))

(declare-fun b!1227491 () Bool)

(declare-fun res!816101 () Bool)

(assert (=> b!1227491 (=> res!816101 e!696994)))

(declare-fun subseq!480 (List!27014 List!27014) Bool)

(assert (=> b!1227491 (= res!816101 (not (subseq!480 Nil!27011 acc!823)))))

(declare-fun b!1227492 () Bool)

(declare-fun res!816105 () Bool)

(assert (=> b!1227492 (=> (not res!816105) (not e!696995))))

(declare-fun noDuplicate!1673 (List!27014) Bool)

(assert (=> b!1227492 (= res!816105 (noDuplicate!1673 acc!823))))

(declare-fun b!1227493 () Bool)

(declare-fun res!816099 () Bool)

(assert (=> b!1227493 (=> (not res!816099) (not e!696995))))

(assert (=> b!1227493 (= res!816099 (not (contains!7076 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101964 res!816095) b!1227488))

(assert (= (and b!1227488 res!816104) b!1227483))

(assert (= (and b!1227483 res!816098) b!1227492))

(assert (= (and b!1227492 res!816105) b!1227489))

(assert (= (and b!1227489 res!816097) b!1227493))

(assert (= (and b!1227493 res!816099) b!1227485))

(assert (= (and b!1227485 res!816093) b!1227487))

(assert (= (and b!1227487 res!816102) b!1227486))

(assert (= (and b!1227486 res!816100) b!1227490))

(assert (= (and b!1227490 (not res!816103)) b!1227481))

(assert (= (and b!1227481 (not res!816094)) b!1227482))

(assert (= (and b!1227482 (not res!816096)) b!1227491))

(assert (= (and b!1227491 (not res!816101)) b!1227484))

(declare-fun m!1132255 () Bool)

(assert (=> b!1227484 m!1132255))

(declare-fun m!1132257 () Bool)

(assert (=> b!1227490 m!1132257))

(declare-fun m!1132259 () Bool)

(assert (=> b!1227490 m!1132259))

(declare-fun m!1132261 () Bool)

(assert (=> b!1227487 m!1132261))

(declare-fun m!1132263 () Bool)

(assert (=> b!1227489 m!1132263))

(declare-fun m!1132265 () Bool)

(assert (=> b!1227492 m!1132265))

(declare-fun m!1132267 () Bool)

(assert (=> b!1227491 m!1132267))

(declare-fun m!1132269 () Bool)

(assert (=> start!101964 m!1132269))

(declare-fun m!1132271 () Bool)

(assert (=> b!1227493 m!1132271))

(assert (=> b!1227486 m!1132257))

(assert (=> b!1227486 m!1132257))

(declare-fun m!1132273 () Bool)

(assert (=> b!1227486 m!1132273))

(declare-fun m!1132275 () Bool)

(assert (=> b!1227485 m!1132275))

(declare-fun m!1132277 () Bool)

(assert (=> b!1227482 m!1132277))

(declare-fun m!1132279 () Bool)

(assert (=> b!1227481 m!1132279))

(declare-fun m!1132281 () Bool)

(assert (=> b!1227488 m!1132281))

(check-sat (not b!1227485) (not b!1227492) (not start!101964) (not b!1227481) (not b!1227490) (not b!1227482) (not b!1227487) (not b!1227486) (not b!1227489) (not b!1227484) (not b!1227493) (not b!1227488) (not b!1227491))
(check-sat)
