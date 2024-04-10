; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102834 () Bool)

(assert start!102834)

(declare-fun b!1235983 () Bool)

(declare-fun res!824018 () Bool)

(declare-fun e!700664 () Bool)

(assert (=> b!1235983 (=> (not res!824018) (not e!700664))))

(declare-datatypes ((List!27220 0))(
  ( (Nil!27217) (Cons!27216 (h!28425 (_ BitVec 64)) (t!40683 List!27220)) )
))
(declare-fun acc!846 () List!27220)

(declare-fun contains!7282 (List!27220 (_ BitVec 64)) Bool)

(assert (=> b!1235983 (= res!824018 (not (contains!7282 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235984 () Bool)

(declare-fun res!824021 () Bool)

(assert (=> b!1235984 (=> (not res!824021) (not e!700664))))

(declare-datatypes ((array!79679 0))(
  ( (array!79680 (arr!38447 (Array (_ BitVec 32) (_ BitVec 64))) (size!38983 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79679)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79679 (_ BitVec 32) List!27220) Bool)

(assert (=> b!1235984 (= res!824021 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235985 () Bool)

(declare-fun res!824022 () Bool)

(assert (=> b!1235985 (=> (not res!824022) (not e!700664))))

(assert (=> b!1235985 (= res!824022 (not (contains!7282 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235986 () Bool)

(declare-datatypes ((Unit!40985 0))(
  ( (Unit!40986) )
))
(declare-fun e!700663 () Unit!40985)

(declare-fun Unit!40987 () Unit!40985)

(assert (=> b!1235986 (= e!700663 Unit!40987)))

(declare-fun b!1235987 () Bool)

(declare-fun lt!560617 () Unit!40985)

(assert (=> b!1235987 (= e!700663 lt!560617)))

(declare-fun lt!560618 () List!27220)

(assert (=> b!1235987 (= lt!560618 (Cons!27216 (select (arr!38447 a!3835) from!3213) acc!846))))

(declare-fun lt!560620 () Unit!40985)

(declare-fun lemmaListSubSeqRefl!0 (List!27220) Unit!40985)

(assert (=> b!1235987 (= lt!560620 (lemmaListSubSeqRefl!0 lt!560618))))

(declare-fun subseq!554 (List!27220 List!27220) Bool)

(assert (=> b!1235987 (subseq!554 lt!560618 lt!560618)))

(declare-fun lt!560619 () Unit!40985)

(declare-fun subseqTail!47 (List!27220 List!27220) Unit!40985)

(assert (=> b!1235987 (= lt!560619 (subseqTail!47 lt!560618 lt!560618))))

(assert (=> b!1235987 (subseq!554 acc!846 lt!560618)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79679 List!27220 List!27220 (_ BitVec 32)) Unit!40985)

(assert (=> b!1235987 (= lt!560617 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560618 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235987 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235988 () Bool)

(declare-fun res!824016 () Bool)

(declare-fun e!700662 () Bool)

(assert (=> b!1235988 (=> (not res!824016) (not e!700662))))

(assert (=> b!1235988 (= res!824016 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235989 () Bool)

(assert (=> b!1235989 (= e!700664 e!700662)))

(declare-fun res!824017 () Bool)

(assert (=> b!1235989 (=> (not res!824017) (not e!700662))))

(assert (=> b!1235989 (= res!824017 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38983 a!3835))))))

(declare-fun lt!560616 () Unit!40985)

(assert (=> b!1235989 (= lt!560616 e!700663)))

(declare-fun c!120844 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235989 (= c!120844 (validKeyInArray!0 (select (arr!38447 a!3835) from!3213)))))

(declare-fun b!1235990 () Bool)

(declare-fun res!824023 () Bool)

(assert (=> b!1235990 (=> (not res!824023) (not e!700664))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235990 (= res!824023 (contains!7282 acc!846 k!2925))))

(declare-fun b!1235992 () Bool)

(declare-fun res!824020 () Bool)

(assert (=> b!1235992 (=> (not res!824020) (not e!700664))))

(assert (=> b!1235992 (= res!824020 (not (= from!3213 (bvsub (size!38983 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235993 () Bool)

(declare-fun res!824019 () Bool)

(assert (=> b!1235993 (=> (not res!824019) (not e!700664))))

(declare-fun noDuplicate!1879 (List!27220) Bool)

(assert (=> b!1235993 (= res!824019 (noDuplicate!1879 acc!846))))

(declare-fun res!824015 () Bool)

(assert (=> start!102834 (=> (not res!824015) (not e!700664))))

(assert (=> start!102834 (= res!824015 (and (bvslt (size!38983 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38983 a!3835))))))

(assert (=> start!102834 e!700664))

(declare-fun array_inv!29295 (array!79679) Bool)

(assert (=> start!102834 (array_inv!29295 a!3835)))

(assert (=> start!102834 true))

(declare-fun b!1235991 () Bool)

(assert (=> b!1235991 (= e!700662 (not true))))

(declare-fun arrayContainsKey!0 (array!79679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1235991 (not (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!560621 () Unit!40985)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79679 (_ BitVec 32) (_ BitVec 64) List!27220) Unit!40985)

(assert (=> b!1235991 (= lt!560621 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846))))

(assert (= (and start!102834 res!824015) b!1235993))

(assert (= (and b!1235993 res!824019) b!1235983))

(assert (= (and b!1235983 res!824018) b!1235985))

(assert (= (and b!1235985 res!824022) b!1235984))

(assert (= (and b!1235984 res!824021) b!1235990))

(assert (= (and b!1235990 res!824023) b!1235992))

(assert (= (and b!1235992 res!824020) b!1235989))

(assert (= (and b!1235989 c!120844) b!1235987))

(assert (= (and b!1235989 (not c!120844)) b!1235986))

(assert (= (and b!1235989 res!824017) b!1235988))

(assert (= (and b!1235988 res!824016) b!1235991))

(declare-fun m!1139827 () Bool)

(assert (=> b!1235983 m!1139827))

(declare-fun m!1139829 () Bool)

(assert (=> b!1235989 m!1139829))

(assert (=> b!1235989 m!1139829))

(declare-fun m!1139831 () Bool)

(assert (=> b!1235989 m!1139831))

(declare-fun m!1139833 () Bool)

(assert (=> b!1235987 m!1139833))

(declare-fun m!1139835 () Bool)

(assert (=> b!1235987 m!1139835))

(declare-fun m!1139837 () Bool)

(assert (=> b!1235987 m!1139837))

(declare-fun m!1139839 () Bool)

(assert (=> b!1235987 m!1139839))

(declare-fun m!1139841 () Bool)

(assert (=> b!1235987 m!1139841))

(declare-fun m!1139843 () Bool)

(assert (=> b!1235987 m!1139843))

(assert (=> b!1235987 m!1139829))

(declare-fun m!1139845 () Bool)

(assert (=> start!102834 m!1139845))

(declare-fun m!1139847 () Bool)

(assert (=> b!1235984 m!1139847))

(assert (=> b!1235988 m!1139837))

(declare-fun m!1139849 () Bool)

(assert (=> b!1235990 m!1139849))

(declare-fun m!1139851 () Bool)

(assert (=> b!1235991 m!1139851))

(declare-fun m!1139853 () Bool)

(assert (=> b!1235991 m!1139853))

(declare-fun m!1139855 () Bool)

(assert (=> b!1235993 m!1139855))

(declare-fun m!1139857 () Bool)

(assert (=> b!1235985 m!1139857))

(push 1)

