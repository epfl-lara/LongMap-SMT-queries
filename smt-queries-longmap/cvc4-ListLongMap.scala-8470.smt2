; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103126 () Bool)

(assert start!103126)

(declare-fun b!1238266 () Bool)

(declare-fun res!825992 () Bool)

(declare-fun e!701786 () Bool)

(assert (=> b!1238266 (=> (not res!825992) (not e!701786))))

(declare-datatypes ((List!27282 0))(
  ( (Nil!27279) (Cons!27278 (h!28487 (_ BitVec 64)) (t!40745 List!27282)) )
))
(declare-fun acc!846 () List!27282)

(declare-fun noDuplicate!1941 (List!27282) Bool)

(assert (=> b!1238266 (= res!825992 (noDuplicate!1941 acc!846))))

(declare-fun b!1238267 () Bool)

(declare-fun res!825990 () Bool)

(assert (=> b!1238267 (=> (not res!825990) (not e!701786))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79812 0))(
  ( (array!79813 (arr!38509 (Array (_ BitVec 32) (_ BitVec 64))) (size!39045 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79812)

(assert (=> b!1238267 (= res!825990 (not (= from!3213 (bvsub (size!39045 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!825997 () Bool)

(assert (=> start!103126 (=> (not res!825997) (not e!701786))))

(assert (=> start!103126 (= res!825997 (and (bvslt (size!39045 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39045 a!3835))))))

(assert (=> start!103126 e!701786))

(declare-fun array_inv!29357 (array!79812) Bool)

(assert (=> start!103126 (array_inv!29357 a!3835)))

(assert (=> start!103126 true))

(declare-fun b!1238268 () Bool)

(declare-fun res!825998 () Bool)

(assert (=> b!1238268 (=> (not res!825998) (not e!701786))))

(declare-fun contains!7344 (List!27282 (_ BitVec 64)) Bool)

(assert (=> b!1238268 (= res!825998 (not (contains!7344 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238269 () Bool)

(declare-fun e!701785 () Bool)

(assert (=> b!1238269 (= e!701785 true)))

(declare-fun lt!561255 () Bool)

(declare-fun lt!561257 () List!27282)

(assert (=> b!1238269 (= lt!561255 (contains!7344 lt!561257 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238270 () Bool)

(declare-fun res!825993 () Bool)

(assert (=> b!1238270 (=> (not res!825993) (not e!701786))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238270 (= res!825993 (contains!7344 acc!846 k!2925))))

(declare-fun b!1238271 () Bool)

(declare-fun res!825991 () Bool)

(assert (=> b!1238271 (=> (not res!825991) (not e!701786))))

(assert (=> b!1238271 (= res!825991 (not (contains!7344 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238272 () Bool)

(declare-fun res!825994 () Bool)

(assert (=> b!1238272 (=> res!825994 e!701785)))

(assert (=> b!1238272 (= res!825994 (contains!7344 lt!561257 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238273 () Bool)

(declare-fun res!825995 () Bool)

(assert (=> b!1238273 (=> (not res!825995) (not e!701786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238273 (= res!825995 (validKeyInArray!0 (select (arr!38509 a!3835) from!3213)))))

(declare-fun b!1238274 () Bool)

(declare-fun res!825996 () Bool)

(assert (=> b!1238274 (=> res!825996 e!701785)))

(assert (=> b!1238274 (= res!825996 (not (noDuplicate!1941 lt!561257)))))

(declare-fun b!1238275 () Bool)

(assert (=> b!1238275 (= e!701786 (not e!701785))))

(declare-fun res!826000 () Bool)

(assert (=> b!1238275 (=> res!826000 e!701785)))

(assert (=> b!1238275 (= res!826000 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!598 (List!27282 List!27282) Bool)

(assert (=> b!1238275 (subseq!598 acc!846 lt!561257)))

(declare-datatypes ((Unit!41104 0))(
  ( (Unit!41105) )
))
(declare-fun lt!561254 () Unit!41104)

(declare-fun subseqTail!85 (List!27282 List!27282) Unit!41104)

(assert (=> b!1238275 (= lt!561254 (subseqTail!85 lt!561257 lt!561257))))

(assert (=> b!1238275 (subseq!598 lt!561257 lt!561257)))

(declare-fun lt!561256 () Unit!41104)

(declare-fun lemmaListSubSeqRefl!0 (List!27282) Unit!41104)

(assert (=> b!1238275 (= lt!561256 (lemmaListSubSeqRefl!0 lt!561257))))

(assert (=> b!1238275 (= lt!561257 (Cons!27278 (select (arr!38509 a!3835) from!3213) acc!846))))

(declare-fun b!1238276 () Bool)

(declare-fun res!825999 () Bool)

(assert (=> b!1238276 (=> (not res!825999) (not e!701786))))

(declare-fun arrayNoDuplicates!0 (array!79812 (_ BitVec 32) List!27282) Bool)

(assert (=> b!1238276 (= res!825999 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!103126 res!825997) b!1238266))

(assert (= (and b!1238266 res!825992) b!1238271))

(assert (= (and b!1238271 res!825991) b!1238268))

(assert (= (and b!1238268 res!825998) b!1238276))

(assert (= (and b!1238276 res!825999) b!1238270))

(assert (= (and b!1238270 res!825993) b!1238267))

(assert (= (and b!1238267 res!825990) b!1238273))

(assert (= (and b!1238273 res!825995) b!1238275))

(assert (= (and b!1238275 (not res!826000)) b!1238274))

(assert (= (and b!1238274 (not res!825996)) b!1238272))

(assert (= (and b!1238272 (not res!825994)) b!1238269))

(declare-fun m!1141825 () Bool)

(assert (=> b!1238272 m!1141825))

(declare-fun m!1141827 () Bool)

(assert (=> b!1238271 m!1141827))

(declare-fun m!1141829 () Bool)

(assert (=> b!1238273 m!1141829))

(assert (=> b!1238273 m!1141829))

(declare-fun m!1141831 () Bool)

(assert (=> b!1238273 m!1141831))

(declare-fun m!1141833 () Bool)

(assert (=> b!1238266 m!1141833))

(declare-fun m!1141835 () Bool)

(assert (=> b!1238269 m!1141835))

(declare-fun m!1141837 () Bool)

(assert (=> b!1238274 m!1141837))

(declare-fun m!1141839 () Bool)

(assert (=> b!1238268 m!1141839))

(declare-fun m!1141841 () Bool)

(assert (=> b!1238275 m!1141841))

(declare-fun m!1141843 () Bool)

(assert (=> b!1238275 m!1141843))

(declare-fun m!1141845 () Bool)

(assert (=> b!1238275 m!1141845))

(declare-fun m!1141847 () Bool)

(assert (=> b!1238275 m!1141847))

(assert (=> b!1238275 m!1141829))

(declare-fun m!1141849 () Bool)

(assert (=> start!103126 m!1141849))

(declare-fun m!1141851 () Bool)

(assert (=> b!1238270 m!1141851))

(declare-fun m!1141853 () Bool)

(assert (=> b!1238276 m!1141853))

(push 1)

(assert (not start!103126))

(assert (not b!1238273))

(assert (not b!1238271))

(assert (not b!1238270))

(assert (not b!1238268))

(assert (not b!1238274))

(assert (not b!1238276))

(assert (not b!1238272))

(assert (not b!1238266))

(assert (not b!1238269))

(assert (not b!1238275))

(check-sat)

