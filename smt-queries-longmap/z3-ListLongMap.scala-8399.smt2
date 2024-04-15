; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102172 () Bool)

(assert start!102172)

(declare-fun b!1229946 () Bool)

(declare-fun res!818471 () Bool)

(declare-fun e!697945 () Bool)

(assert (=> b!1229946 (=> (not res!818471) (not e!697945))))

(declare-datatypes ((List!27129 0))(
  ( (Nil!27126) (Cons!27125 (h!28334 (_ BitVec 64)) (t!40583 List!27129)) )
))
(declare-fun acc!823 () List!27129)

(declare-fun noDuplicate!1744 (List!27129) Bool)

(assert (=> b!1229946 (= res!818471 (noDuplicate!1744 acc!823))))

(declare-fun b!1229947 () Bool)

(declare-fun res!818473 () Bool)

(assert (=> b!1229947 (=> (not res!818473) (not e!697945))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79270 0))(
  ( (array!79271 (arr!38255 (Array (_ BitVec 32) (_ BitVec 64))) (size!38793 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79270)

(assert (=> b!1229947 (= res!818473 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38793 a!3806)) (bvslt from!3184 (size!38793 a!3806))))))

(declare-fun b!1229948 () Bool)

(declare-fun res!818474 () Bool)

(assert (=> b!1229948 (=> (not res!818474) (not e!697945))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229948 (= res!818474 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229949 () Bool)

(declare-fun res!818470 () Bool)

(assert (=> b!1229949 (=> (not res!818470) (not e!697945))))

(declare-fun arrayContainsKey!0 (array!79270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229949 (= res!818470 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!818469 () Bool)

(assert (=> start!102172 (=> (not res!818469) (not e!697945))))

(assert (=> start!102172 (= res!818469 (bvslt (size!38793 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102172 e!697945))

(declare-fun array_inv!29238 (array!79270) Bool)

(assert (=> start!102172 (array_inv!29238 a!3806)))

(assert (=> start!102172 true))

(declare-fun b!1229950 () Bool)

(declare-fun res!818476 () Bool)

(assert (=> b!1229950 (=> (not res!818476) (not e!697945))))

(declare-fun arrayNoDuplicates!0 (array!79270 (_ BitVec 32) List!27129) Bool)

(assert (=> b!1229950 (= res!818476 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229951 () Bool)

(declare-fun e!697944 () Bool)

(assert (=> b!1229951 (= e!697944 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27125 (select (arr!38255 a!3806) from!3184) Nil!27126)))))

(declare-fun b!1229952 () Bool)

(assert (=> b!1229952 (= e!697945 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(assert (=> b!1229952 (not (arrayContainsKey!0 a!3806 (select (arr!38255 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40601 0))(
  ( (Unit!40602) )
))
(declare-fun lt!559130 () Unit!40601)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79270 (_ BitVec 32) (_ BitVec 64) List!27129) Unit!40601)

(assert (=> b!1229952 (= lt!559130 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38255 a!3806) from!3184) (Cons!27125 (select (arr!38255 a!3806) from!3184) Nil!27126)))))

(assert (=> b!1229952 e!697944))

(declare-fun res!818468 () Bool)

(assert (=> b!1229952 (=> (not res!818468) (not e!697944))))

(assert (=> b!1229952 (= res!818468 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27126))))

(declare-fun lt!559129 () Unit!40601)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79270 List!27129 List!27129 (_ BitVec 32)) Unit!40601)

(assert (=> b!1229952 (= lt!559129 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27126 from!3184))))

(assert (=> b!1229952 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27125 (select (arr!38255 a!3806) from!3184) acc!823))))

(declare-fun b!1229953 () Bool)

(declare-fun res!818477 () Bool)

(assert (=> b!1229953 (=> (not res!818477) (not e!697945))))

(declare-fun contains!7101 (List!27129 (_ BitVec 64)) Bool)

(assert (=> b!1229953 (= res!818477 (not (contains!7101 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229954 () Bool)

(declare-fun res!818475 () Bool)

(assert (=> b!1229954 (=> (not res!818475) (not e!697945))))

(assert (=> b!1229954 (= res!818475 (not (contains!7101 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229955 () Bool)

(declare-fun res!818472 () Bool)

(assert (=> b!1229955 (=> (not res!818472) (not e!697945))))

(assert (=> b!1229955 (= res!818472 (validKeyInArray!0 (select (arr!38255 a!3806) from!3184)))))

(assert (= (and start!102172 res!818469) b!1229948))

(assert (= (and b!1229948 res!818474) b!1229947))

(assert (= (and b!1229947 res!818473) b!1229946))

(assert (= (and b!1229946 res!818471) b!1229953))

(assert (= (and b!1229953 res!818477) b!1229954))

(assert (= (and b!1229954 res!818475) b!1229949))

(assert (= (and b!1229949 res!818470) b!1229950))

(assert (= (and b!1229950 res!818476) b!1229955))

(assert (= (and b!1229955 res!818472) b!1229952))

(assert (= (and b!1229952 res!818468) b!1229951))

(declare-fun m!1133973 () Bool)

(assert (=> b!1229953 m!1133973))

(declare-fun m!1133975 () Bool)

(assert (=> b!1229951 m!1133975))

(declare-fun m!1133977 () Bool)

(assert (=> b!1229951 m!1133977))

(declare-fun m!1133979 () Bool)

(assert (=> b!1229954 m!1133979))

(declare-fun m!1133981 () Bool)

(assert (=> b!1229950 m!1133981))

(declare-fun m!1133983 () Bool)

(assert (=> b!1229946 m!1133983))

(declare-fun m!1133985 () Bool)

(assert (=> b!1229952 m!1133985))

(declare-fun m!1133987 () Bool)

(assert (=> b!1229952 m!1133987))

(assert (=> b!1229952 m!1133975))

(declare-fun m!1133989 () Bool)

(assert (=> b!1229952 m!1133989))

(assert (=> b!1229952 m!1133975))

(declare-fun m!1133991 () Bool)

(assert (=> b!1229952 m!1133991))

(assert (=> b!1229952 m!1133975))

(declare-fun m!1133993 () Bool)

(assert (=> b!1229952 m!1133993))

(declare-fun m!1133995 () Bool)

(assert (=> start!102172 m!1133995))

(declare-fun m!1133997 () Bool)

(assert (=> b!1229948 m!1133997))

(declare-fun m!1133999 () Bool)

(assert (=> b!1229949 m!1133999))

(assert (=> b!1229955 m!1133975))

(assert (=> b!1229955 m!1133975))

(declare-fun m!1134001 () Bool)

(assert (=> b!1229955 m!1134001))

(check-sat (not b!1229952) (not start!102172) (not b!1229949) (not b!1229951) (not b!1229953) (not b!1229954) (not b!1229946) (not b!1229948) (not b!1229950) (not b!1229955))
(check-sat)
