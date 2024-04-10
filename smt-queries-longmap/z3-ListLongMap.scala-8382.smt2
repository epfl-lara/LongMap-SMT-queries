; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101970 () Bool)

(assert start!101970)

(declare-fun b!1227598 () Bool)

(declare-fun res!816219 () Bool)

(declare-fun e!697020 () Bool)

(assert (=> b!1227598 (=> (not res!816219) (not e!697020))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227598 (= res!816219 (validKeyInArray!0 k0!2913))))

(declare-fun b!1227599 () Bool)

(declare-fun res!816222 () Bool)

(declare-fun e!697022 () Bool)

(assert (=> b!1227599 (=> res!816222 e!697022)))

(declare-datatypes ((List!27017 0))(
  ( (Nil!27014) (Cons!27013 (h!28222 (_ BitVec 64)) (t!40480 List!27017)) )
))
(declare-fun acc!823 () List!27017)

(declare-fun subseq!483 (List!27017 List!27017) Bool)

(assert (=> b!1227599 (= res!816222 (not (subseq!483 Nil!27014 acc!823)))))

(declare-fun b!1227600 () Bool)

(declare-fun res!816210 () Bool)

(assert (=> b!1227600 (=> (not res!816210) (not e!697020))))

(declare-datatypes ((array!79243 0))(
  ( (array!79244 (arr!38244 (Array (_ BitVec 32) (_ BitVec 64))) (size!38780 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79243)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1227600 (= res!816210 (validKeyInArray!0 (select (arr!38244 a!3806) from!3184)))))

(declare-fun b!1227601 () Bool)

(declare-fun res!816214 () Bool)

(assert (=> b!1227601 (=> (not res!816214) (not e!697020))))

(declare-fun noDuplicate!1676 (List!27017) Bool)

(assert (=> b!1227601 (= res!816214 (noDuplicate!1676 acc!823))))

(declare-fun b!1227602 () Bool)

(declare-fun res!816212 () Bool)

(assert (=> b!1227602 (=> (not res!816212) (not e!697020))))

(declare-fun arrayContainsKey!0 (array!79243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227602 (= res!816212 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227603 () Bool)

(declare-fun res!816217 () Bool)

(assert (=> b!1227603 (=> res!816217 e!697022)))

(declare-fun contains!7079 (List!27017 (_ BitVec 64)) Bool)

(assert (=> b!1227603 (= res!816217 (contains!7079 Nil!27014 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227604 () Bool)

(declare-fun res!816211 () Bool)

(assert (=> b!1227604 (=> (not res!816211) (not e!697020))))

(assert (=> b!1227604 (= res!816211 (not (contains!7079 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227605 () Bool)

(declare-fun res!816221 () Bool)

(assert (=> b!1227605 (=> res!816221 e!697022)))

(assert (=> b!1227605 (= res!816221 (contains!7079 Nil!27014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227606 () Bool)

(declare-fun res!816215 () Bool)

(assert (=> b!1227606 (=> (not res!816215) (not e!697020))))

(assert (=> b!1227606 (= res!816215 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38780 a!3806)) (bvslt from!3184 (size!38780 a!3806))))))

(declare-fun b!1227607 () Bool)

(declare-fun res!816220 () Bool)

(assert (=> b!1227607 (=> (not res!816220) (not e!697020))))

(assert (=> b!1227607 (= res!816220 (not (contains!7079 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227608 () Bool)

(declare-fun res!816216 () Bool)

(assert (=> b!1227608 (=> (not res!816216) (not e!697020))))

(declare-fun arrayNoDuplicates!0 (array!79243 (_ BitVec 32) List!27017) Bool)

(assert (=> b!1227608 (= res!816216 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!816218 () Bool)

(assert (=> start!101970 (=> (not res!816218) (not e!697020))))

(assert (=> start!101970 (= res!816218 (bvslt (size!38780 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101970 e!697020))

(declare-fun array_inv!29092 (array!79243) Bool)

(assert (=> start!101970 (array_inv!29092 a!3806)))

(assert (=> start!101970 true))

(declare-fun b!1227609 () Bool)

(assert (=> b!1227609 (= e!697022 true)))

(declare-datatypes ((Unit!40654 0))(
  ( (Unit!40655) )
))
(declare-fun lt!558927 () Unit!40654)

(declare-fun noDuplicateSubseq!36 (List!27017 List!27017) Unit!40654)

(assert (=> b!1227609 (= lt!558927 (noDuplicateSubseq!36 Nil!27014 acc!823))))

(declare-fun b!1227610 () Bool)

(assert (=> b!1227610 (= e!697020 (not e!697022))))

(declare-fun res!816213 () Bool)

(assert (=> b!1227610 (=> res!816213 e!697022)))

(assert (=> b!1227610 (= res!816213 (bvsgt from!3184 (size!38780 a!3806)))))

(assert (=> b!1227610 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27013 (select (arr!38244 a!3806) from!3184) acc!823))))

(assert (= (and start!101970 res!816218) b!1227598))

(assert (= (and b!1227598 res!816219) b!1227606))

(assert (= (and b!1227606 res!816215) b!1227601))

(assert (= (and b!1227601 res!816214) b!1227607))

(assert (= (and b!1227607 res!816220) b!1227604))

(assert (= (and b!1227604 res!816211) b!1227602))

(assert (= (and b!1227602 res!816212) b!1227608))

(assert (= (and b!1227608 res!816216) b!1227600))

(assert (= (and b!1227600 res!816210) b!1227610))

(assert (= (and b!1227610 (not res!816213)) b!1227605))

(assert (= (and b!1227605 (not res!816221)) b!1227603))

(assert (= (and b!1227603 (not res!816217)) b!1227599))

(assert (= (and b!1227599 (not res!816222)) b!1227609))

(declare-fun m!1132339 () Bool)

(assert (=> b!1227610 m!1132339))

(declare-fun m!1132341 () Bool)

(assert (=> b!1227610 m!1132341))

(declare-fun m!1132343 () Bool)

(assert (=> b!1227598 m!1132343))

(declare-fun m!1132345 () Bool)

(assert (=> b!1227608 m!1132345))

(declare-fun m!1132347 () Bool)

(assert (=> b!1227607 m!1132347))

(declare-fun m!1132349 () Bool)

(assert (=> start!101970 m!1132349))

(declare-fun m!1132351 () Bool)

(assert (=> b!1227599 m!1132351))

(declare-fun m!1132353 () Bool)

(assert (=> b!1227603 m!1132353))

(assert (=> b!1227600 m!1132339))

(assert (=> b!1227600 m!1132339))

(declare-fun m!1132355 () Bool)

(assert (=> b!1227600 m!1132355))

(declare-fun m!1132357 () Bool)

(assert (=> b!1227601 m!1132357))

(declare-fun m!1132359 () Bool)

(assert (=> b!1227602 m!1132359))

(declare-fun m!1132361 () Bool)

(assert (=> b!1227604 m!1132361))

(declare-fun m!1132363 () Bool)

(assert (=> b!1227605 m!1132363))

(declare-fun m!1132365 () Bool)

(assert (=> b!1227609 m!1132365))

(check-sat (not b!1227599) (not b!1227600) (not b!1227602) (not b!1227605) (not b!1227608) (not b!1227598) (not b!1227609) (not b!1227603) (not b!1227607) (not b!1227601) (not start!101970) (not b!1227610) (not b!1227604))
(check-sat)
