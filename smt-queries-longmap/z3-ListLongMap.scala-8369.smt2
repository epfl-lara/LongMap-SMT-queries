; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101812 () Bool)

(assert start!101812)

(declare-fun b!1226284 () Bool)

(declare-fun res!814984 () Bool)

(declare-fun e!696455 () Bool)

(assert (=> b!1226284 (=> (not res!814984) (not e!696455))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79078 0))(
  ( (array!79079 (arr!38165 (Array (_ BitVec 32) (_ BitVec 64))) (size!38703 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79078)

(assert (=> b!1226284 (= res!814984 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38703 a!3806)) (bvslt from!3184 (size!38703 a!3806))))))

(declare-fun b!1226285 () Bool)

(declare-fun res!814982 () Bool)

(assert (=> b!1226285 (=> (not res!814982) (not e!696455))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226285 (= res!814982 (validKeyInArray!0 k0!2913))))

(declare-fun res!814981 () Bool)

(assert (=> start!101812 (=> (not res!814981) (not e!696455))))

(assert (=> start!101812 (= res!814981 (bvslt (size!38703 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101812 e!696455))

(declare-fun array_inv!29148 (array!79078) Bool)

(assert (=> start!101812 (array_inv!29148 a!3806)))

(assert (=> start!101812 true))

(declare-fun b!1226286 () Bool)

(declare-fun res!814980 () Bool)

(assert (=> b!1226286 (=> (not res!814980) (not e!696455))))

(declare-datatypes ((List!27039 0))(
  ( (Nil!27036) (Cons!27035 (h!28244 (_ BitVec 64)) (t!40493 List!27039)) )
))
(declare-fun acc!823 () List!27039)

(declare-fun contains!7011 (List!27039 (_ BitVec 64)) Bool)

(assert (=> b!1226286 (= res!814980 (not (contains!7011 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226287 () Bool)

(declare-fun res!814983 () Bool)

(assert (=> b!1226287 (=> (not res!814983) (not e!696455))))

(assert (=> b!1226287 (= res!814983 (not (contains!7011 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226288 () Bool)

(assert (=> b!1226288 (= e!696455 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun b!1226289 () Bool)

(declare-fun res!814985 () Bool)

(assert (=> b!1226289 (=> (not res!814985) (not e!696455))))

(declare-fun noDuplicate!1654 (List!27039) Bool)

(assert (=> b!1226289 (= res!814985 (noDuplicate!1654 acc!823))))

(assert (= (and start!101812 res!814981) b!1226285))

(assert (= (and b!1226285 res!814982) b!1226284))

(assert (= (and b!1226284 res!814984) b!1226289))

(assert (= (and b!1226289 res!814985) b!1226286))

(assert (= (and b!1226286 res!814980) b!1226287))

(assert (= (and b!1226287 res!814983) b!1226288))

(declare-fun m!1130949 () Bool)

(assert (=> b!1226287 m!1130949))

(declare-fun m!1130951 () Bool)

(assert (=> b!1226289 m!1130951))

(declare-fun m!1130953 () Bool)

(assert (=> b!1226285 m!1130953))

(declare-fun m!1130955 () Bool)

(assert (=> start!101812 m!1130955))

(declare-fun m!1130957 () Bool)

(assert (=> b!1226286 m!1130957))

(check-sat (not start!101812) (not b!1226286) (not b!1226289) (not b!1226287) (not b!1226285))
(check-sat)
