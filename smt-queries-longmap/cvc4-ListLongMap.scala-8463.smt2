; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102988 () Bool)

(assert start!102988)

(declare-fun b!1237244 () Bool)

(declare-fun res!825116 () Bool)

(declare-fun e!701256 () Bool)

(assert (=> b!1237244 (=> (not res!825116) (not e!701256))))

(declare-datatypes ((array!79764 0))(
  ( (array!79765 (arr!38488 (Array (_ BitVec 32) (_ BitVec 64))) (size!39024 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79764)

(declare-datatypes ((List!27261 0))(
  ( (Nil!27258) (Cons!27257 (h!28466 (_ BitVec 64)) (t!40724 List!27261)) )
))
(declare-fun acc!846 () List!27261)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79764 (_ BitVec 32) List!27261) Bool)

(assert (=> b!1237244 (= res!825116 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237245 () Bool)

(declare-fun res!825113 () Bool)

(assert (=> b!1237245 (=> (not res!825113) (not e!701256))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7323 (List!27261 (_ BitVec 64)) Bool)

(assert (=> b!1237245 (= res!825113 (contains!7323 acc!846 k!2925))))

(declare-fun b!1237246 () Bool)

(declare-fun res!825115 () Bool)

(assert (=> b!1237246 (=> (not res!825115) (not e!701256))))

(assert (=> b!1237246 (= res!825115 (not (= from!3213 (bvsub (size!39024 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237247 () Bool)

(assert (=> b!1237247 (= e!701256 (not true))))

(declare-fun lt!560977 () List!27261)

(declare-fun subseq!577 (List!27261 List!27261) Bool)

(assert (=> b!1237247 (subseq!577 acc!846 lt!560977)))

(declare-datatypes ((Unit!41052 0))(
  ( (Unit!41053) )
))
(declare-fun lt!560976 () Unit!41052)

(declare-fun subseqTail!64 (List!27261 List!27261) Unit!41052)

(assert (=> b!1237247 (= lt!560976 (subseqTail!64 lt!560977 lt!560977))))

(assert (=> b!1237247 (subseq!577 lt!560977 lt!560977)))

(declare-fun lt!560978 () Unit!41052)

(declare-fun lemmaListSubSeqRefl!0 (List!27261) Unit!41052)

(assert (=> b!1237247 (= lt!560978 (lemmaListSubSeqRefl!0 lt!560977))))

(assert (=> b!1237247 (= lt!560977 (Cons!27257 (select (arr!38488 a!3835) from!3213) acc!846))))

(declare-fun b!1237248 () Bool)

(declare-fun res!825111 () Bool)

(assert (=> b!1237248 (=> (not res!825111) (not e!701256))))

(assert (=> b!1237248 (= res!825111 (not (contains!7323 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237249 () Bool)

(declare-fun res!825118 () Bool)

(assert (=> b!1237249 (=> (not res!825118) (not e!701256))))

(assert (=> b!1237249 (= res!825118 (not (contains!7323 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237250 () Bool)

(declare-fun res!825112 () Bool)

(assert (=> b!1237250 (=> (not res!825112) (not e!701256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237250 (= res!825112 (validKeyInArray!0 (select (arr!38488 a!3835) from!3213)))))

(declare-fun b!1237243 () Bool)

(declare-fun res!825114 () Bool)

(assert (=> b!1237243 (=> (not res!825114) (not e!701256))))

(declare-fun noDuplicate!1920 (List!27261) Bool)

(assert (=> b!1237243 (= res!825114 (noDuplicate!1920 acc!846))))

(declare-fun res!825117 () Bool)

(assert (=> start!102988 (=> (not res!825117) (not e!701256))))

(assert (=> start!102988 (= res!825117 (and (bvslt (size!39024 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39024 a!3835))))))

(assert (=> start!102988 e!701256))

(declare-fun array_inv!29336 (array!79764) Bool)

(assert (=> start!102988 (array_inv!29336 a!3835)))

(assert (=> start!102988 true))

(assert (= (and start!102988 res!825117) b!1237243))

(assert (= (and b!1237243 res!825114) b!1237248))

(assert (= (and b!1237248 res!825111) b!1237249))

(assert (= (and b!1237249 res!825118) b!1237244))

(assert (= (and b!1237244 res!825116) b!1237245))

(assert (= (and b!1237245 res!825113) b!1237246))

(assert (= (and b!1237246 res!825115) b!1237250))

(assert (= (and b!1237250 res!825112) b!1237247))

(declare-fun m!1140961 () Bool)

(assert (=> b!1237249 m!1140961))

(declare-fun m!1140963 () Bool)

(assert (=> b!1237243 m!1140963))

(declare-fun m!1140965 () Bool)

(assert (=> b!1237248 m!1140965))

(declare-fun m!1140967 () Bool)

(assert (=> b!1237244 m!1140967))

(declare-fun m!1140969 () Bool)

(assert (=> start!102988 m!1140969))

(declare-fun m!1140971 () Bool)

(assert (=> b!1237245 m!1140971))

(declare-fun m!1140973 () Bool)

(assert (=> b!1237247 m!1140973))

(declare-fun m!1140975 () Bool)

(assert (=> b!1237247 m!1140975))

(declare-fun m!1140977 () Bool)

(assert (=> b!1237247 m!1140977))

(declare-fun m!1140979 () Bool)

(assert (=> b!1237247 m!1140979))

(declare-fun m!1140981 () Bool)

(assert (=> b!1237247 m!1140981))

(assert (=> b!1237250 m!1140981))

(assert (=> b!1237250 m!1140981))

(declare-fun m!1140983 () Bool)

(assert (=> b!1237250 m!1140983))

(push 1)

(assert (not b!1237250))

(assert (not b!1237248))

(assert (not b!1237249))

(assert (not b!1237244))

(assert (not start!102988))

(assert (not b!1237243))

(assert (not b!1237245))

(assert (not b!1237247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

