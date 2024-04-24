; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103126 () Bool)

(assert start!103126)

(declare-fun res!825070 () Bool)

(declare-fun e!701738 () Bool)

(assert (=> start!103126 (=> (not res!825070) (not e!701738))))

(declare-datatypes ((array!79769 0))(
  ( (array!79770 (arr!38486 (Array (_ BitVec 32) (_ BitVec 64))) (size!39023 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79769)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103126 (= res!825070 (and (bvslt (size!39023 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39023 a!3835))))))

(assert (=> start!103126 e!701738))

(declare-fun array_inv!29424 (array!79769) Bool)

(assert (=> start!103126 (array_inv!29424 a!3835)))

(assert (=> start!103126 true))

(declare-fun b!1237877 () Bool)

(declare-fun res!825069 () Bool)

(assert (=> b!1237877 (=> (not res!825069) (not e!701738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237877 (= res!825069 (validKeyInArray!0 (select (arr!38486 a!3835) from!3213)))))

(declare-fun b!1237878 () Bool)

(declare-fun res!825073 () Bool)

(assert (=> b!1237878 (=> (not res!825073) (not e!701738))))

(declare-datatypes ((List!27272 0))(
  ( (Nil!27269) (Cons!27268 (h!28486 (_ BitVec 64)) (t!40727 List!27272)) )
))
(declare-fun acc!846 () List!27272)

(declare-fun contains!7343 (List!27272 (_ BitVec 64)) Bool)

(assert (=> b!1237878 (= res!825073 (not (contains!7343 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237879 () Bool)

(declare-fun res!825075 () Bool)

(assert (=> b!1237879 (=> (not res!825075) (not e!701738))))

(declare-fun arrayNoDuplicates!0 (array!79769 (_ BitVec 32) List!27272) Bool)

(assert (=> b!1237879 (= res!825075 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237880 () Bool)

(declare-fun res!825068 () Bool)

(assert (=> b!1237880 (=> (not res!825068) (not e!701738))))

(assert (=> b!1237880 (= res!825068 (not (contains!7343 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237881 () Bool)

(declare-fun res!825071 () Bool)

(assert (=> b!1237881 (=> (not res!825071) (not e!701738))))

(assert (=> b!1237881 (= res!825071 (not (= from!3213 (bvsub (size!39023 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237882 () Bool)

(declare-fun res!825074 () Bool)

(assert (=> b!1237882 (=> (not res!825074) (not e!701738))))

(declare-fun noDuplicate!1924 (List!27272) Bool)

(assert (=> b!1237882 (= res!825074 (noDuplicate!1924 acc!846))))

(declare-fun b!1237883 () Bool)

(assert (=> b!1237883 (= e!701738 (not true))))

(declare-fun lt!561301 () List!27272)

(declare-fun subseq!563 (List!27272 List!27272) Bool)

(assert (=> b!1237883 (subseq!563 lt!561301 lt!561301)))

(declare-datatypes ((Unit!40985 0))(
  ( (Unit!40986) )
))
(declare-fun lt!561302 () Unit!40985)

(declare-fun lemmaListSubSeqRefl!0 (List!27272) Unit!40985)

(assert (=> b!1237883 (= lt!561302 (lemmaListSubSeqRefl!0 lt!561301))))

(assert (=> b!1237883 (= lt!561301 (Cons!27268 (select (arr!38486 a!3835) from!3213) acc!846))))

(declare-fun b!1237884 () Bool)

(declare-fun res!825072 () Bool)

(assert (=> b!1237884 (=> (not res!825072) (not e!701738))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237884 (= res!825072 (contains!7343 acc!846 k0!2925))))

(assert (= (and start!103126 res!825070) b!1237882))

(assert (= (and b!1237882 res!825074) b!1237880))

(assert (= (and b!1237880 res!825068) b!1237878))

(assert (= (and b!1237878 res!825073) b!1237879))

(assert (= (and b!1237879 res!825075) b!1237884))

(assert (= (and b!1237884 res!825072) b!1237881))

(assert (= (and b!1237881 res!825071) b!1237877))

(assert (= (and b!1237877 res!825069) b!1237883))

(declare-fun m!1141979 () Bool)

(assert (=> b!1237884 m!1141979))

(declare-fun m!1141981 () Bool)

(assert (=> b!1237879 m!1141981))

(declare-fun m!1141983 () Bool)

(assert (=> b!1237882 m!1141983))

(declare-fun m!1141985 () Bool)

(assert (=> start!103126 m!1141985))

(declare-fun m!1141987 () Bool)

(assert (=> b!1237878 m!1141987))

(declare-fun m!1141989 () Bool)

(assert (=> b!1237877 m!1141989))

(assert (=> b!1237877 m!1141989))

(declare-fun m!1141991 () Bool)

(assert (=> b!1237877 m!1141991))

(declare-fun m!1141993 () Bool)

(assert (=> b!1237880 m!1141993))

(declare-fun m!1141995 () Bool)

(assert (=> b!1237883 m!1141995))

(declare-fun m!1141997 () Bool)

(assert (=> b!1237883 m!1141997))

(assert (=> b!1237883 m!1141989))

(check-sat (not b!1237880) (not b!1237878) (not b!1237879) (not b!1237883) (not b!1237882) (not b!1237877) (not start!103126) (not b!1237884))
(check-sat)
