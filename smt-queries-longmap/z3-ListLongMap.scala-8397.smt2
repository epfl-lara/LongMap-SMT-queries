; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102164 () Bool)

(assert start!102164)

(declare-fun b!1229812 () Bool)

(declare-fun res!818299 () Bool)

(declare-fun e!697920 () Bool)

(assert (=> b!1229812 (=> res!818299 e!697920)))

(declare-datatypes ((List!27062 0))(
  ( (Nil!27059) (Cons!27058 (h!28267 (_ BitVec 64)) (t!40525 List!27062)) )
))
(declare-fun lt!559260 () List!27062)

(declare-fun contains!7124 (List!27062 (_ BitVec 64)) Bool)

(assert (=> b!1229812 (= res!818299 (contains!7124 lt!559260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229813 () Bool)

(declare-fun res!818311 () Bool)

(declare-fun e!697923 () Bool)

(assert (=> b!1229813 (=> (not res!818311) (not e!697923))))

(declare-fun acc!823 () List!27062)

(declare-fun noDuplicate!1721 (List!27062) Bool)

(assert (=> b!1229813 (= res!818311 (noDuplicate!1721 acc!823))))

(declare-fun b!1229814 () Bool)

(declare-fun res!818303 () Bool)

(assert (=> b!1229814 (=> (not res!818303) (not e!697923))))

(assert (=> b!1229814 (= res!818303 (not (contains!7124 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229815 () Bool)

(declare-fun res!818300 () Bool)

(assert (=> b!1229815 (=> (not res!818300) (not e!697923))))

(declare-datatypes ((array!79339 0))(
  ( (array!79340 (arr!38289 (Array (_ BitVec 32) (_ BitVec 64))) (size!38825 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79339)

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229815 (= res!818300 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229816 () Bool)

(declare-fun res!818305 () Bool)

(assert (=> b!1229816 (=> (not res!818305) (not e!697923))))

(assert (=> b!1229816 (= res!818305 (not (contains!7124 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229817 () Bool)

(declare-fun res!818308 () Bool)

(assert (=> b!1229817 (=> (not res!818308) (not e!697923))))

(declare-fun arrayNoDuplicates!0 (array!79339 (_ BitVec 32) List!27062) Bool)

(assert (=> b!1229817 (= res!818308 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229818 () Bool)

(assert (=> b!1229818 (= e!697920 true)))

(declare-fun lt!559261 () Bool)

(assert (=> b!1229818 (= lt!559261 (contains!7124 lt!559260 (select (arr!38289 a!3806) from!3184)))))

(declare-fun b!1229819 () Bool)

(declare-fun res!818301 () Bool)

(assert (=> b!1229819 (=> (not res!818301) (not e!697923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229819 (= res!818301 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229820 () Bool)

(declare-fun e!697921 () Bool)

(assert (=> b!1229820 (= e!697921 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27058 (select (arr!38289 a!3806) from!3184) Nil!27059)))))

(declare-fun b!1229821 () Bool)

(declare-fun res!818307 () Bool)

(assert (=> b!1229821 (=> res!818307 e!697920)))

(assert (=> b!1229821 (= res!818307 (contains!7124 lt!559260 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!818309 () Bool)

(assert (=> start!102164 (=> (not res!818309) (not e!697923))))

(assert (=> start!102164 (= res!818309 (bvslt (size!38825 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102164 e!697923))

(declare-fun array_inv!29137 (array!79339) Bool)

(assert (=> start!102164 (array_inv!29137 a!3806)))

(assert (=> start!102164 true))

(declare-fun b!1229822 () Bool)

(declare-fun res!818302 () Bool)

(assert (=> b!1229822 (=> (not res!818302) (not e!697923))))

(assert (=> b!1229822 (= res!818302 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38825 a!3806)) (bvslt from!3184 (size!38825 a!3806))))))

(declare-fun b!1229823 () Bool)

(assert (=> b!1229823 (= e!697923 (not e!697920))))

(declare-fun res!818306 () Bool)

(assert (=> b!1229823 (=> res!818306 e!697920)))

(assert (=> b!1229823 (= res!818306 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229823 (= lt!559260 (Cons!27058 (select (arr!38289 a!3806) from!3184) Nil!27059))))

(assert (=> b!1229823 e!697921))

(declare-fun res!818310 () Bool)

(assert (=> b!1229823 (=> (not res!818310) (not e!697921))))

(assert (=> b!1229823 (= res!818310 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27059))))

(declare-datatypes ((Unit!40744 0))(
  ( (Unit!40745) )
))
(declare-fun lt!559262 () Unit!40744)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79339 List!27062 List!27062 (_ BitVec 32)) Unit!40744)

(assert (=> b!1229823 (= lt!559262 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27059 from!3184))))

(assert (=> b!1229823 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27058 (select (arr!38289 a!3806) from!3184) acc!823))))

(declare-fun b!1229824 () Bool)

(declare-fun res!818298 () Bool)

(assert (=> b!1229824 (=> res!818298 e!697920)))

(assert (=> b!1229824 (= res!818298 (not (noDuplicate!1721 lt!559260)))))

(declare-fun b!1229825 () Bool)

(declare-fun res!818304 () Bool)

(assert (=> b!1229825 (=> (not res!818304) (not e!697923))))

(assert (=> b!1229825 (= res!818304 (validKeyInArray!0 (select (arr!38289 a!3806) from!3184)))))

(assert (= (and start!102164 res!818309) b!1229819))

(assert (= (and b!1229819 res!818301) b!1229822))

(assert (= (and b!1229822 res!818302) b!1229813))

(assert (= (and b!1229813 res!818311) b!1229814))

(assert (= (and b!1229814 res!818303) b!1229816))

(assert (= (and b!1229816 res!818305) b!1229815))

(assert (= (and b!1229815 res!818300) b!1229817))

(assert (= (and b!1229817 res!818308) b!1229825))

(assert (= (and b!1229825 res!818304) b!1229823))

(assert (= (and b!1229823 res!818310) b!1229820))

(assert (= (and b!1229823 (not res!818306)) b!1229824))

(assert (= (and b!1229824 (not res!818298)) b!1229812))

(assert (= (and b!1229812 (not res!818299)) b!1229821))

(assert (= (and b!1229821 (not res!818307)) b!1229818))

(declare-fun m!1134299 () Bool)

(assert (=> b!1229819 m!1134299))

(declare-fun m!1134301 () Bool)

(assert (=> b!1229825 m!1134301))

(assert (=> b!1229825 m!1134301))

(declare-fun m!1134303 () Bool)

(assert (=> b!1229825 m!1134303))

(declare-fun m!1134305 () Bool)

(assert (=> b!1229815 m!1134305))

(declare-fun m!1134307 () Bool)

(assert (=> b!1229813 m!1134307))

(declare-fun m!1134309 () Bool)

(assert (=> b!1229814 m!1134309))

(assert (=> b!1229823 m!1134301))

(declare-fun m!1134311 () Bool)

(assert (=> b!1229823 m!1134311))

(declare-fun m!1134313 () Bool)

(assert (=> b!1229823 m!1134313))

(declare-fun m!1134315 () Bool)

(assert (=> b!1229823 m!1134315))

(declare-fun m!1134317 () Bool)

(assert (=> start!102164 m!1134317))

(declare-fun m!1134319 () Bool)

(assert (=> b!1229817 m!1134319))

(declare-fun m!1134321 () Bool)

(assert (=> b!1229816 m!1134321))

(declare-fun m!1134323 () Bool)

(assert (=> b!1229824 m!1134323))

(declare-fun m!1134325 () Bool)

(assert (=> b!1229812 m!1134325))

(assert (=> b!1229818 m!1134301))

(assert (=> b!1229818 m!1134301))

(declare-fun m!1134327 () Bool)

(assert (=> b!1229818 m!1134327))

(declare-fun m!1134329 () Bool)

(assert (=> b!1229821 m!1134329))

(assert (=> b!1229820 m!1134301))

(declare-fun m!1134331 () Bool)

(assert (=> b!1229820 m!1134331))

(check-sat (not start!102164) (not b!1229813) (not b!1229812) (not b!1229821) (not b!1229818) (not b!1229825) (not b!1229820) (not b!1229823) (not b!1229819) (not b!1229816) (not b!1229815) (not b!1229814) (not b!1229817) (not b!1229824))
(check-sat)
