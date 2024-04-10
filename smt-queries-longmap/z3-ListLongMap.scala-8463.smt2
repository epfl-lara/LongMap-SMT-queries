; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102986 () Bool)

(assert start!102986)

(declare-fun b!1237219 () Bool)

(declare-fun res!825089 () Bool)

(declare-fun e!701250 () Bool)

(assert (=> b!1237219 (=> (not res!825089) (not e!701250))))

(declare-datatypes ((List!27260 0))(
  ( (Nil!27257) (Cons!27256 (h!28465 (_ BitVec 64)) (t!40723 List!27260)) )
))
(declare-fun acc!846 () List!27260)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7322 (List!27260 (_ BitVec 64)) Bool)

(assert (=> b!1237219 (= res!825089 (contains!7322 acc!846 k0!2925))))

(declare-fun b!1237220 () Bool)

(declare-fun res!825091 () Bool)

(assert (=> b!1237220 (=> (not res!825091) (not e!701250))))

(declare-datatypes ((array!79762 0))(
  ( (array!79763 (arr!38487 (Array (_ BitVec 32) (_ BitVec 64))) (size!39023 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79762)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237220 (= res!825091 (validKeyInArray!0 (select (arr!38487 a!3835) from!3213)))))

(declare-fun b!1237221 () Bool)

(assert (=> b!1237221 (= e!701250 (not true))))

(declare-fun lt!560969 () List!27260)

(declare-fun subseq!576 (List!27260 List!27260) Bool)

(assert (=> b!1237221 (subseq!576 acc!846 lt!560969)))

(declare-datatypes ((Unit!41050 0))(
  ( (Unit!41051) )
))
(declare-fun lt!560967 () Unit!41050)

(declare-fun subseqTail!63 (List!27260 List!27260) Unit!41050)

(assert (=> b!1237221 (= lt!560967 (subseqTail!63 lt!560969 lt!560969))))

(assert (=> b!1237221 (subseq!576 lt!560969 lt!560969)))

(declare-fun lt!560968 () Unit!41050)

(declare-fun lemmaListSubSeqRefl!0 (List!27260) Unit!41050)

(assert (=> b!1237221 (= lt!560968 (lemmaListSubSeqRefl!0 lt!560969))))

(assert (=> b!1237221 (= lt!560969 (Cons!27256 (select (arr!38487 a!3835) from!3213) acc!846))))

(declare-fun res!825088 () Bool)

(assert (=> start!102986 (=> (not res!825088) (not e!701250))))

(assert (=> start!102986 (= res!825088 (and (bvslt (size!39023 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39023 a!3835))))))

(assert (=> start!102986 e!701250))

(declare-fun array_inv!29335 (array!79762) Bool)

(assert (=> start!102986 (array_inv!29335 a!3835)))

(assert (=> start!102986 true))

(declare-fun b!1237222 () Bool)

(declare-fun res!825092 () Bool)

(assert (=> b!1237222 (=> (not res!825092) (not e!701250))))

(assert (=> b!1237222 (= res!825092 (not (contains!7322 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237223 () Bool)

(declare-fun res!825094 () Bool)

(assert (=> b!1237223 (=> (not res!825094) (not e!701250))))

(assert (=> b!1237223 (= res!825094 (not (contains!7322 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237224 () Bool)

(declare-fun res!825090 () Bool)

(assert (=> b!1237224 (=> (not res!825090) (not e!701250))))

(declare-fun noDuplicate!1919 (List!27260) Bool)

(assert (=> b!1237224 (= res!825090 (noDuplicate!1919 acc!846))))

(declare-fun b!1237225 () Bool)

(declare-fun res!825093 () Bool)

(assert (=> b!1237225 (=> (not res!825093) (not e!701250))))

(assert (=> b!1237225 (= res!825093 (not (= from!3213 (bvsub (size!39023 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237226 () Bool)

(declare-fun res!825087 () Bool)

(assert (=> b!1237226 (=> (not res!825087) (not e!701250))))

(declare-fun arrayNoDuplicates!0 (array!79762 (_ BitVec 32) List!27260) Bool)

(assert (=> b!1237226 (= res!825087 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102986 res!825088) b!1237224))

(assert (= (and b!1237224 res!825090) b!1237223))

(assert (= (and b!1237223 res!825094) b!1237222))

(assert (= (and b!1237222 res!825092) b!1237226))

(assert (= (and b!1237226 res!825087) b!1237219))

(assert (= (and b!1237219 res!825089) b!1237225))

(assert (= (and b!1237225 res!825093) b!1237220))

(assert (= (and b!1237220 res!825091) b!1237221))

(declare-fun m!1140937 () Bool)

(assert (=> b!1237222 m!1140937))

(declare-fun m!1140939 () Bool)

(assert (=> start!102986 m!1140939))

(declare-fun m!1140941 () Bool)

(assert (=> b!1237219 m!1140941))

(declare-fun m!1140943 () Bool)

(assert (=> b!1237220 m!1140943))

(assert (=> b!1237220 m!1140943))

(declare-fun m!1140945 () Bool)

(assert (=> b!1237220 m!1140945))

(declare-fun m!1140947 () Bool)

(assert (=> b!1237221 m!1140947))

(declare-fun m!1140949 () Bool)

(assert (=> b!1237221 m!1140949))

(declare-fun m!1140951 () Bool)

(assert (=> b!1237221 m!1140951))

(declare-fun m!1140953 () Bool)

(assert (=> b!1237221 m!1140953))

(assert (=> b!1237221 m!1140943))

(declare-fun m!1140955 () Bool)

(assert (=> b!1237223 m!1140955))

(declare-fun m!1140957 () Bool)

(assert (=> b!1237224 m!1140957))

(declare-fun m!1140959 () Bool)

(assert (=> b!1237226 m!1140959))

(check-sat (not b!1237219) (not b!1237220) (not b!1237223) (not b!1237222) (not b!1237226) (not start!102986) (not b!1237221) (not b!1237224))
(check-sat)
