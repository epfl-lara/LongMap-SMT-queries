; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103208 () Bool)

(assert start!103208)

(declare-fun b!1238878 () Bool)

(declare-fun res!826496 () Bool)

(declare-fun e!702094 () Bool)

(assert (=> b!1238878 (=> (not res!826496) (not e!702094))))

(declare-datatypes ((List!27359 0))(
  ( (Nil!27356) (Cons!27355 (h!28564 (_ BitVec 64)) (t!40813 List!27359)) )
))
(declare-fun acc!846 () List!27359)

(declare-fun contains!7331 (List!27359 (_ BitVec 64)) Bool)

(assert (=> b!1238878 (= res!826496 (not (contains!7331 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238879 () Bool)

(declare-fun res!826491 () Bool)

(assert (=> b!1238879 (=> (not res!826491) (not e!702094))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238879 (= res!826491 (contains!7331 acc!846 k!2925))))

(declare-fun b!1238880 () Bool)

(declare-datatypes ((Unit!40994 0))(
  ( (Unit!40995) )
))
(declare-fun e!702093 () Unit!40994)

(declare-fun Unit!40996 () Unit!40994)

(assert (=> b!1238880 (= e!702093 Unit!40996)))

(declare-fun b!1238881 () Bool)

(declare-fun lt!561343 () Unit!40994)

(assert (=> b!1238881 (= e!702093 lt!561343)))

(declare-datatypes ((array!79766 0))(
  ( (array!79767 (arr!38485 (Array (_ BitVec 32) (_ BitVec 64))) (size!39023 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79766)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!561345 () List!27359)

(assert (=> b!1238881 (= lt!561345 (Cons!27355 (select (arr!38485 a!3835) from!3213) acc!846))))

(declare-fun lt!561346 () Unit!40994)

(declare-fun lemmaListSubSeqRefl!0 (List!27359) Unit!40994)

(assert (=> b!1238881 (= lt!561346 (lemmaListSubSeqRefl!0 lt!561345))))

(declare-fun subseq!613 (List!27359 List!27359) Bool)

(assert (=> b!1238881 (subseq!613 lt!561345 lt!561345)))

(declare-fun lt!561344 () Unit!40994)

(declare-fun subseqTail!100 (List!27359 List!27359) Unit!40994)

(assert (=> b!1238881 (= lt!561344 (subseqTail!100 lt!561345 lt!561345))))

(assert (=> b!1238881 (subseq!613 acc!846 lt!561345)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79766 List!27359 List!27359 (_ BitVec 32)) Unit!40994)

(assert (=> b!1238881 (= lt!561343 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561345 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79766 (_ BitVec 32) List!27359) Bool)

(assert (=> b!1238881 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238882 () Bool)

(declare-fun res!826494 () Bool)

(assert (=> b!1238882 (=> (not res!826494) (not e!702094))))

(declare-fun noDuplicate!1974 (List!27359) Bool)

(assert (=> b!1238882 (= res!826494 (noDuplicate!1974 acc!846))))

(declare-fun res!826493 () Bool)

(assert (=> start!103208 (=> (not res!826493) (not e!702094))))

(assert (=> start!103208 (= res!826493 (and (bvslt (size!39023 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39023 a!3835))))))

(assert (=> start!103208 e!702094))

(declare-fun array_inv!29468 (array!79766) Bool)

(assert (=> start!103208 (array_inv!29468 a!3835)))

(assert (=> start!103208 true))

(declare-fun b!1238883 () Bool)

(declare-fun res!826495 () Bool)

(assert (=> b!1238883 (=> (not res!826495) (not e!702094))))

(assert (=> b!1238883 (= res!826495 (not (= from!3213 (bvsub (size!39023 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238884 () Bool)

(declare-fun res!826492 () Bool)

(assert (=> b!1238884 (=> (not res!826492) (not e!702094))))

(assert (=> b!1238884 (= res!826492 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238885 () Bool)

(assert (=> b!1238885 (= e!702094 false)))

(declare-fun lt!561347 () Unit!40994)

(assert (=> b!1238885 (= lt!561347 e!702093)))

(declare-fun c!121057 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238885 (= c!121057 (validKeyInArray!0 (select (arr!38485 a!3835) from!3213)))))

(declare-fun b!1238886 () Bool)

(declare-fun res!826490 () Bool)

(assert (=> b!1238886 (=> (not res!826490) (not e!702094))))

(assert (=> b!1238886 (= res!826490 (not (contains!7331 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103208 res!826493) b!1238882))

(assert (= (and b!1238882 res!826494) b!1238878))

(assert (= (and b!1238878 res!826496) b!1238886))

(assert (= (and b!1238886 res!826490) b!1238884))

(assert (= (and b!1238884 res!826492) b!1238879))

(assert (= (and b!1238879 res!826491) b!1238883))

(assert (= (and b!1238883 res!826495) b!1238885))

(assert (= (and b!1238885 c!121057) b!1238881))

(assert (= (and b!1238885 (not c!121057)) b!1238880))

(declare-fun m!1141967 () Bool)

(assert (=> b!1238882 m!1141967))

(declare-fun m!1141969 () Bool)

(assert (=> b!1238886 m!1141969))

(declare-fun m!1141971 () Bool)

(assert (=> b!1238884 m!1141971))

(declare-fun m!1141973 () Bool)

(assert (=> b!1238881 m!1141973))

(declare-fun m!1141975 () Bool)

(assert (=> b!1238881 m!1141975))

(declare-fun m!1141977 () Bool)

(assert (=> b!1238881 m!1141977))

(declare-fun m!1141979 () Bool)

(assert (=> b!1238881 m!1141979))

(declare-fun m!1141981 () Bool)

(assert (=> b!1238881 m!1141981))

(declare-fun m!1141983 () Bool)

(assert (=> b!1238881 m!1141983))

(declare-fun m!1141985 () Bool)

(assert (=> b!1238881 m!1141985))

(declare-fun m!1141987 () Bool)

(assert (=> b!1238878 m!1141987))

(declare-fun m!1141989 () Bool)

(assert (=> b!1238879 m!1141989))

(declare-fun m!1141991 () Bool)

(assert (=> start!103208 m!1141991))

(assert (=> b!1238885 m!1141983))

(assert (=> b!1238885 m!1141983))

(declare-fun m!1141993 () Bool)

(assert (=> b!1238885 m!1141993))

(push 1)

(assert (not b!1238885))

(assert (not start!103208))

(assert (not b!1238879))

(assert (not b!1238886))

(assert (not b!1238881))

(assert (not b!1238882))

(assert (not b!1238884))

(assert (not b!1238878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

