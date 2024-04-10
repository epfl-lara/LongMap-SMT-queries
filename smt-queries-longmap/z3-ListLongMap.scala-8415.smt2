; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102428 () Bool)

(assert start!102428)

(declare-fun res!820366 () Bool)

(declare-fun e!698855 () Bool)

(assert (=> start!102428 (=> (not res!820366) (not e!698855))))

(declare-datatypes ((array!79459 0))(
  ( (array!79460 (arr!38343 (Array (_ BitVec 32) (_ BitVec 64))) (size!38879 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79459)

(assert (=> start!102428 (= res!820366 (bvslt (size!38879 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102428 e!698855))

(declare-fun array_inv!29191 (array!79459) Bool)

(assert (=> start!102428 (array_inv!29191 a!3806)))

(assert (=> start!102428 true))

(declare-fun b!1231982 () Bool)

(assert (=> b!1231982 (= e!698855 (not true))))

(declare-fun e!698856 () Bool)

(assert (=> b!1231982 e!698856))

(declare-fun res!820369 () Bool)

(assert (=> b!1231982 (=> (not res!820369) (not e!698856))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27116 0))(
  ( (Nil!27113) (Cons!27112 (h!28321 (_ BitVec 64)) (t!40579 List!27116)) )
))
(declare-fun arrayNoDuplicates!0 (array!79459 (_ BitVec 32) List!27116) Bool)

(assert (=> b!1231982 (= res!820369 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27113))))

(declare-fun acc!823 () List!27116)

(declare-datatypes ((Unit!40792 0))(
  ( (Unit!40793) )
))
(declare-fun lt!559472 () Unit!40792)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79459 List!27116 List!27116 (_ BitVec 32)) Unit!40792)

(assert (=> b!1231982 (= lt!559472 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27113 from!3184))))

(assert (=> b!1231982 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27112 (select (arr!38343 a!3806) from!3184) acc!823))))

(declare-fun b!1231983 () Bool)

(declare-fun res!820367 () Bool)

(assert (=> b!1231983 (=> (not res!820367) (not e!698855))))

(declare-fun noDuplicate!1775 (List!27116) Bool)

(assert (=> b!1231983 (= res!820367 (noDuplicate!1775 acc!823))))

(declare-fun b!1231984 () Bool)

(assert (=> b!1231984 (= e!698856 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27112 (select (arr!38343 a!3806) from!3184) Nil!27113)))))

(declare-fun b!1231985 () Bool)

(declare-fun res!820362 () Bool)

(assert (=> b!1231985 (=> (not res!820362) (not e!698855))))

(assert (=> b!1231985 (= res!820362 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231986 () Bool)

(declare-fun res!820364 () Bool)

(assert (=> b!1231986 (=> (not res!820364) (not e!698855))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231986 (= res!820364 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231987 () Bool)

(declare-fun res!820361 () Bool)

(assert (=> b!1231987 (=> (not res!820361) (not e!698855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231987 (= res!820361 (validKeyInArray!0 (select (arr!38343 a!3806) from!3184)))))

(declare-fun b!1231988 () Bool)

(declare-fun res!820360 () Bool)

(assert (=> b!1231988 (=> (not res!820360) (not e!698855))))

(assert (=> b!1231988 (= res!820360 (validKeyInArray!0 k0!2913))))

(declare-fun b!1231989 () Bool)

(declare-fun res!820365 () Bool)

(assert (=> b!1231989 (=> (not res!820365) (not e!698855))))

(declare-fun contains!7178 (List!27116 (_ BitVec 64)) Bool)

(assert (=> b!1231989 (= res!820365 (not (contains!7178 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231990 () Bool)

(declare-fun res!820368 () Bool)

(assert (=> b!1231990 (=> (not res!820368) (not e!698855))))

(assert (=> b!1231990 (= res!820368 (not (contains!7178 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231991 () Bool)

(declare-fun res!820363 () Bool)

(assert (=> b!1231991 (=> (not res!820363) (not e!698855))))

(assert (=> b!1231991 (= res!820363 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38879 a!3806)) (bvslt from!3184 (size!38879 a!3806))))))

(assert (= (and start!102428 res!820366) b!1231988))

(assert (= (and b!1231988 res!820360) b!1231991))

(assert (= (and b!1231991 res!820363) b!1231983))

(assert (= (and b!1231983 res!820367) b!1231989))

(assert (= (and b!1231989 res!820365) b!1231990))

(assert (= (and b!1231990 res!820368) b!1231986))

(assert (= (and b!1231986 res!820364) b!1231985))

(assert (= (and b!1231985 res!820362) b!1231987))

(assert (= (and b!1231987 res!820361) b!1231982))

(assert (= (and b!1231982 res!820369) b!1231984))

(declare-fun m!1136031 () Bool)

(assert (=> b!1231989 m!1136031))

(declare-fun m!1136033 () Bool)

(assert (=> b!1231990 m!1136033))

(declare-fun m!1136035 () Bool)

(assert (=> b!1231985 m!1136035))

(declare-fun m!1136037 () Bool)

(assert (=> b!1231984 m!1136037))

(declare-fun m!1136039 () Bool)

(assert (=> b!1231984 m!1136039))

(declare-fun m!1136041 () Bool)

(assert (=> start!102428 m!1136041))

(declare-fun m!1136043 () Bool)

(assert (=> b!1231982 m!1136043))

(declare-fun m!1136045 () Bool)

(assert (=> b!1231982 m!1136045))

(assert (=> b!1231982 m!1136037))

(declare-fun m!1136047 () Bool)

(assert (=> b!1231982 m!1136047))

(declare-fun m!1136049 () Bool)

(assert (=> b!1231986 m!1136049))

(declare-fun m!1136051 () Bool)

(assert (=> b!1231983 m!1136051))

(assert (=> b!1231987 m!1136037))

(assert (=> b!1231987 m!1136037))

(declare-fun m!1136053 () Bool)

(assert (=> b!1231987 m!1136053))

(declare-fun m!1136055 () Bool)

(assert (=> b!1231988 m!1136055))

(check-sat (not b!1231983) (not b!1231982) (not b!1231987) (not start!102428) (not b!1231988) (not b!1231989) (not b!1231985) (not b!1231986) (not b!1231990) (not b!1231984))
(check-sat)
