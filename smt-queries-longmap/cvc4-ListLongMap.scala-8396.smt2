; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102160 () Bool)

(assert start!102160)

(declare-fun b!1229728 () Bool)

(declare-fun res!818217 () Bool)

(declare-fun e!697897 () Bool)

(assert (=> b!1229728 (=> res!818217 e!697897)))

(declare-datatypes ((List!27060 0))(
  ( (Nil!27057) (Cons!27056 (h!28265 (_ BitVec 64)) (t!40523 List!27060)) )
))
(declare-fun lt!559244 () List!27060)

(declare-fun noDuplicate!1719 (List!27060) Bool)

(assert (=> b!1229728 (= res!818217 (not (noDuplicate!1719 lt!559244)))))

(declare-fun b!1229729 () Bool)

(declare-fun e!697896 () Bool)

(assert (=> b!1229729 (= e!697896 (not e!697897))))

(declare-fun res!818223 () Bool)

(assert (=> b!1229729 (=> res!818223 e!697897)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1229729 (= res!818223 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-datatypes ((array!79335 0))(
  ( (array!79336 (arr!38287 (Array (_ BitVec 32) (_ BitVec 64))) (size!38823 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79335)

(assert (=> b!1229729 (= lt!559244 (Cons!27056 (select (arr!38287 a!3806) from!3184) Nil!27057))))

(declare-fun e!697898 () Bool)

(assert (=> b!1229729 e!697898))

(declare-fun res!818222 () Bool)

(assert (=> b!1229729 (=> (not res!818222) (not e!697898))))

(declare-fun arrayNoDuplicates!0 (array!79335 (_ BitVec 32) List!27060) Bool)

(assert (=> b!1229729 (= res!818222 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27057))))

(declare-datatypes ((Unit!40740 0))(
  ( (Unit!40741) )
))
(declare-fun lt!559243 () Unit!40740)

(declare-fun acc!823 () List!27060)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79335 List!27060 List!27060 (_ BitVec 32)) Unit!40740)

(assert (=> b!1229729 (= lt!559243 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27057 from!3184))))

(assert (=> b!1229729 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27056 (select (arr!38287 a!3806) from!3184) acc!823))))

(declare-fun b!1229730 () Bool)

(declare-fun res!818226 () Bool)

(assert (=> b!1229730 (=> res!818226 e!697897)))

(declare-fun contains!7122 (List!27060 (_ BitVec 64)) Bool)

(assert (=> b!1229730 (= res!818226 (contains!7122 lt!559244 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229731 () Bool)

(declare-fun res!818224 () Bool)

(assert (=> b!1229731 (=> (not res!818224) (not e!697896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229731 (= res!818224 (validKeyInArray!0 (select (arr!38287 a!3806) from!3184)))))

(declare-fun b!1229732 () Bool)

(declare-fun res!818220 () Bool)

(assert (=> b!1229732 (=> (not res!818220) (not e!697896))))

(assert (=> b!1229732 (= res!818220 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229733 () Bool)

(declare-fun res!818218 () Bool)

(assert (=> b!1229733 (=> (not res!818218) (not e!697896))))

(assert (=> b!1229733 (= res!818218 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38823 a!3806)) (bvslt from!3184 (size!38823 a!3806))))))

(declare-fun b!1229734 () Bool)

(declare-fun res!818225 () Bool)

(assert (=> b!1229734 (=> (not res!818225) (not e!697896))))

(assert (=> b!1229734 (= res!818225 (not (contains!7122 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229735 () Bool)

(declare-fun res!818216 () Bool)

(assert (=> b!1229735 (=> res!818216 e!697897)))

(assert (=> b!1229735 (= res!818216 (contains!7122 lt!559244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229736 () Bool)

(declare-fun res!818227 () Bool)

(assert (=> b!1229736 (=> (not res!818227) (not e!697896))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229736 (= res!818227 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229737 () Bool)

(declare-fun res!818219 () Bool)

(assert (=> b!1229737 (=> (not res!818219) (not e!697896))))

(assert (=> b!1229737 (= res!818219 (validKeyInArray!0 k!2913))))

(declare-fun res!818221 () Bool)

(assert (=> start!102160 (=> (not res!818221) (not e!697896))))

(assert (=> start!102160 (= res!818221 (bvslt (size!38823 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102160 e!697896))

(declare-fun array_inv!29135 (array!79335) Bool)

(assert (=> start!102160 (array_inv!29135 a!3806)))

(assert (=> start!102160 true))

(declare-fun b!1229738 () Bool)

(assert (=> b!1229738 (= e!697898 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27056 (select (arr!38287 a!3806) from!3184) Nil!27057)))))

(declare-fun b!1229739 () Bool)

(declare-fun res!818214 () Bool)

(assert (=> b!1229739 (=> (not res!818214) (not e!697896))))

(assert (=> b!1229739 (= res!818214 (noDuplicate!1719 acc!823))))

(declare-fun b!1229740 () Bool)

(declare-fun res!818215 () Bool)

(assert (=> b!1229740 (=> (not res!818215) (not e!697896))))

(assert (=> b!1229740 (= res!818215 (not (contains!7122 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229741 () Bool)

(assert (=> b!1229741 (= e!697897 true)))

(declare-fun lt!559242 () Bool)

(assert (=> b!1229741 (= lt!559242 (contains!7122 lt!559244 (select (arr!38287 a!3806) from!3184)))))

(assert (= (and start!102160 res!818221) b!1229737))

(assert (= (and b!1229737 res!818219) b!1229733))

(assert (= (and b!1229733 res!818218) b!1229739))

(assert (= (and b!1229739 res!818214) b!1229740))

(assert (= (and b!1229740 res!818215) b!1229734))

(assert (= (and b!1229734 res!818225) b!1229736))

(assert (= (and b!1229736 res!818227) b!1229732))

(assert (= (and b!1229732 res!818220) b!1229731))

(assert (= (and b!1229731 res!818224) b!1229729))

(assert (= (and b!1229729 res!818222) b!1229738))

(assert (= (and b!1229729 (not res!818223)) b!1229728))

(assert (= (and b!1229728 (not res!818217)) b!1229735))

(assert (= (and b!1229735 (not res!818216)) b!1229730))

(assert (= (and b!1229730 (not res!818226)) b!1229741))

(declare-fun m!1134231 () Bool)

(assert (=> b!1229739 m!1134231))

(declare-fun m!1134233 () Bool)

(assert (=> b!1229735 m!1134233))

(declare-fun m!1134235 () Bool)

(assert (=> b!1229729 m!1134235))

(declare-fun m!1134237 () Bool)

(assert (=> b!1229729 m!1134237))

(declare-fun m!1134239 () Bool)

(assert (=> b!1229729 m!1134239))

(declare-fun m!1134241 () Bool)

(assert (=> b!1229729 m!1134241))

(declare-fun m!1134243 () Bool)

(assert (=> b!1229740 m!1134243))

(assert (=> b!1229738 m!1134235))

(declare-fun m!1134245 () Bool)

(assert (=> b!1229738 m!1134245))

(declare-fun m!1134247 () Bool)

(assert (=> b!1229732 m!1134247))

(assert (=> b!1229741 m!1134235))

(assert (=> b!1229741 m!1134235))

(declare-fun m!1134249 () Bool)

(assert (=> b!1229741 m!1134249))

(declare-fun m!1134251 () Bool)

(assert (=> b!1229728 m!1134251))

(declare-fun m!1134253 () Bool)

(assert (=> b!1229736 m!1134253))

(declare-fun m!1134255 () Bool)

(assert (=> b!1229730 m!1134255))

(declare-fun m!1134257 () Bool)

(assert (=> b!1229737 m!1134257))

(declare-fun m!1134259 () Bool)

(assert (=> b!1229734 m!1134259))

(declare-fun m!1134261 () Bool)

(assert (=> start!102160 m!1134261))

(assert (=> b!1229731 m!1134235))

(assert (=> b!1229731 m!1134235))

(declare-fun m!1134263 () Bool)

(assert (=> b!1229731 m!1134263))

(push 1)

(assert (not b!1229729))

(assert (not b!1229739))

(assert (not b!1229734))

(assert (not b!1229735))

(assert (not b!1229732))

(assert (not b!1229731))

(assert (not b!1229738))

(assert (not b!1229741))

(assert (not b!1229737))

(assert (not b!1229736))

(assert (not b!1229730))

(assert (not start!102160))

(assert (not b!1229728))

(assert (not b!1229740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

