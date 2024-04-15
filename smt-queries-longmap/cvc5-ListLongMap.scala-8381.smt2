; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101960 () Bool)

(assert start!101960)

(declare-fun b!1227411 () Bool)

(declare-fun res!816082 () Bool)

(declare-fun e!696933 () Bool)

(assert (=> b!1227411 (=> res!816082 e!696933)))

(declare-datatypes ((List!27077 0))(
  ( (Nil!27074) (Cons!27073 (h!28282 (_ BitVec 64)) (t!40531 List!27077)) )
))
(declare-fun contains!7049 (List!27077 (_ BitVec 64)) Bool)

(assert (=> b!1227411 (= res!816082 (contains!7049 Nil!27074 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227412 () Bool)

(declare-fun res!816078 () Bool)

(declare-fun e!696935 () Bool)

(assert (=> b!1227412 (=> (not res!816078) (not e!696935))))

(declare-fun acc!823 () List!27077)

(declare-fun noDuplicate!1692 (List!27077) Bool)

(assert (=> b!1227412 (= res!816078 (noDuplicate!1692 acc!823))))

(declare-fun b!1227413 () Bool)

(assert (=> b!1227413 (= e!696933 true)))

(declare-datatypes ((Unit!40497 0))(
  ( (Unit!40498) )
))
(declare-fun lt!558740 () Unit!40497)

(declare-fun noDuplicateSubseq!34 (List!27077 List!27077) Unit!40497)

(assert (=> b!1227413 (= lt!558740 (noDuplicateSubseq!34 Nil!27074 acc!823))))

(declare-fun b!1227415 () Bool)

(declare-fun res!816077 () Bool)

(assert (=> b!1227415 (=> (not res!816077) (not e!696935))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227415 (= res!816077 (validKeyInArray!0 k!2913))))

(declare-fun b!1227416 () Bool)

(declare-fun res!816072 () Bool)

(assert (=> b!1227416 (=> (not res!816072) (not e!696935))))

(declare-datatypes ((array!79160 0))(
  ( (array!79161 (arr!38203 (Array (_ BitVec 32) (_ BitVec 64))) (size!38741 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79160)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79160 (_ BitVec 32) List!27077) Bool)

(assert (=> b!1227416 (= res!816072 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227417 () Bool)

(declare-fun res!816074 () Bool)

(assert (=> b!1227417 (=> (not res!816074) (not e!696935))))

(assert (=> b!1227417 (= res!816074 (validKeyInArray!0 (select (arr!38203 a!3806) from!3184)))))

(declare-fun b!1227418 () Bool)

(assert (=> b!1227418 (= e!696935 (not e!696933))))

(declare-fun res!816076 () Bool)

(assert (=> b!1227418 (=> res!816076 e!696933)))

(assert (=> b!1227418 (= res!816076 (bvsgt from!3184 (size!38741 a!3806)))))

(assert (=> b!1227418 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27073 (select (arr!38203 a!3806) from!3184) acc!823))))

(declare-fun b!1227419 () Bool)

(declare-fun res!816083 () Bool)

(assert (=> b!1227419 (=> (not res!816083) (not e!696935))))

(declare-fun arrayContainsKey!0 (array!79160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227419 (= res!816083 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227420 () Bool)

(declare-fun res!816079 () Bool)

(assert (=> b!1227420 (=> res!816079 e!696933)))

(assert (=> b!1227420 (= res!816079 (contains!7049 Nil!27074 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227421 () Bool)

(declare-fun res!816081 () Bool)

(assert (=> b!1227421 (=> (not res!816081) (not e!696935))))

(assert (=> b!1227421 (= res!816081 (not (contains!7049 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227414 () Bool)

(declare-fun res!816071 () Bool)

(assert (=> b!1227414 (=> res!816071 e!696933)))

(declare-fun subseq!481 (List!27077 List!27077) Bool)

(assert (=> b!1227414 (= res!816071 (not (subseq!481 Nil!27074 acc!823)))))

(declare-fun res!816080 () Bool)

(assert (=> start!101960 (=> (not res!816080) (not e!696935))))

(assert (=> start!101960 (= res!816080 (bvslt (size!38741 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101960 e!696935))

(declare-fun array_inv!29186 (array!79160) Bool)

(assert (=> start!101960 (array_inv!29186 a!3806)))

(assert (=> start!101960 true))

(declare-fun b!1227422 () Bool)

(declare-fun res!816075 () Bool)

(assert (=> b!1227422 (=> (not res!816075) (not e!696935))))

(assert (=> b!1227422 (= res!816075 (not (contains!7049 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227423 () Bool)

(declare-fun res!816073 () Bool)

(assert (=> b!1227423 (=> (not res!816073) (not e!696935))))

(assert (=> b!1227423 (= res!816073 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38741 a!3806)) (bvslt from!3184 (size!38741 a!3806))))))

(assert (= (and start!101960 res!816080) b!1227415))

(assert (= (and b!1227415 res!816077) b!1227423))

(assert (= (and b!1227423 res!816073) b!1227412))

(assert (= (and b!1227412 res!816078) b!1227421))

(assert (= (and b!1227421 res!816081) b!1227422))

(assert (= (and b!1227422 res!816075) b!1227419))

(assert (= (and b!1227419 res!816083) b!1227416))

(assert (= (and b!1227416 res!816072) b!1227417))

(assert (= (and b!1227417 res!816074) b!1227418))

(assert (= (and b!1227418 (not res!816076)) b!1227411))

(assert (= (and b!1227411 (not res!816082)) b!1227420))

(assert (= (and b!1227420 (not res!816079)) b!1227414))

(assert (= (and b!1227414 (not res!816071)) b!1227413))

(declare-fun m!1131719 () Bool)

(assert (=> b!1227412 m!1131719))

(declare-fun m!1131721 () Bool)

(assert (=> b!1227417 m!1131721))

(assert (=> b!1227417 m!1131721))

(declare-fun m!1131723 () Bool)

(assert (=> b!1227417 m!1131723))

(declare-fun m!1131725 () Bool)

(assert (=> b!1227415 m!1131725))

(declare-fun m!1131727 () Bool)

(assert (=> b!1227414 m!1131727))

(declare-fun m!1131729 () Bool)

(assert (=> b!1227422 m!1131729))

(declare-fun m!1131731 () Bool)

(assert (=> b!1227419 m!1131731))

(declare-fun m!1131733 () Bool)

(assert (=> b!1227416 m!1131733))

(declare-fun m!1131735 () Bool)

(assert (=> b!1227421 m!1131735))

(declare-fun m!1131737 () Bool)

(assert (=> b!1227420 m!1131737))

(declare-fun m!1131739 () Bool)

(assert (=> b!1227413 m!1131739))

(declare-fun m!1131741 () Bool)

(assert (=> start!101960 m!1131741))

(assert (=> b!1227418 m!1131721))

(declare-fun m!1131743 () Bool)

(assert (=> b!1227418 m!1131743))

(declare-fun m!1131745 () Bool)

(assert (=> b!1227411 m!1131745))

(push 1)

(assert (not b!1227412))

(assert (not b!1227418))

(assert (not b!1227422))

(assert (not start!101960))

(assert (not b!1227421))

(assert (not b!1227413))

(assert (not b!1227415))

(assert (not b!1227411))

(assert (not b!1227414))

(assert (not b!1227416))

(assert (not b!1227420))

(assert (not b!1227419))

(assert (not b!1227417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

