; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102840 () Bool)

(assert start!102840)

(declare-fun b!1236082 () Bool)

(declare-fun res!824103 () Bool)

(declare-fun e!700699 () Bool)

(assert (=> b!1236082 (=> (not res!824103) (not e!700699))))

(declare-datatypes ((List!27223 0))(
  ( (Nil!27220) (Cons!27219 (h!28428 (_ BitVec 64)) (t!40686 List!27223)) )
))
(declare-fun acc!846 () List!27223)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7285 (List!27223 (_ BitVec 64)) Bool)

(assert (=> b!1236082 (= res!824103 (contains!7285 acc!846 k!2925))))

(declare-fun b!1236083 () Bool)

(declare-fun res!824097 () Bool)

(assert (=> b!1236083 (=> (not res!824097) (not e!700699))))

(declare-fun noDuplicate!1882 (List!27223) Bool)

(assert (=> b!1236083 (= res!824097 (noDuplicate!1882 acc!846))))

(declare-fun b!1236084 () Bool)

(declare-fun e!700700 () Bool)

(assert (=> b!1236084 (= e!700699 e!700700)))

(declare-fun res!824099 () Bool)

(assert (=> b!1236084 (=> (not res!824099) (not e!700700))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79685 0))(
  ( (array!79686 (arr!38450 (Array (_ BitVec 32) (_ BitVec 64))) (size!38986 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79685)

(assert (=> b!1236084 (= res!824099 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38986 a!3835))))))

(declare-datatypes ((Unit!40994 0))(
  ( (Unit!40995) )
))
(declare-fun lt!560670 () Unit!40994)

(declare-fun e!700701 () Unit!40994)

(assert (=> b!1236084 (= lt!560670 e!700701)))

(declare-fun c!120853 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236084 (= c!120853 (validKeyInArray!0 (select (arr!38450 a!3835) from!3213)))))

(declare-fun b!1236085 () Bool)

(assert (=> b!1236085 (= e!700700 (not true))))

(declare-fun arrayContainsKey!0 (array!79685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1236085 (not (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!560675 () Unit!40994)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79685 (_ BitVec 32) (_ BitVec 64) List!27223) Unit!40994)

(assert (=> b!1236085 (= lt!560675 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846))))

(declare-fun b!1236086 () Bool)

(declare-fun res!824102 () Bool)

(assert (=> b!1236086 (=> (not res!824102) (not e!700699))))

(declare-fun arrayNoDuplicates!0 (array!79685 (_ BitVec 32) List!27223) Bool)

(assert (=> b!1236086 (= res!824102 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236087 () Bool)

(declare-fun res!824100 () Bool)

(assert (=> b!1236087 (=> (not res!824100) (not e!700699))))

(assert (=> b!1236087 (= res!824100 (not (= from!3213 (bvsub (size!38986 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236088 () Bool)

(declare-fun lt!560671 () Unit!40994)

(assert (=> b!1236088 (= e!700701 lt!560671)))

(declare-fun lt!560672 () List!27223)

(assert (=> b!1236088 (= lt!560672 (Cons!27219 (select (arr!38450 a!3835) from!3213) acc!846))))

(declare-fun lt!560673 () Unit!40994)

(declare-fun lemmaListSubSeqRefl!0 (List!27223) Unit!40994)

(assert (=> b!1236088 (= lt!560673 (lemmaListSubSeqRefl!0 lt!560672))))

(declare-fun subseq!557 (List!27223 List!27223) Bool)

(assert (=> b!1236088 (subseq!557 lt!560672 lt!560672)))

(declare-fun lt!560674 () Unit!40994)

(declare-fun subseqTail!50 (List!27223 List!27223) Unit!40994)

(assert (=> b!1236088 (= lt!560674 (subseqTail!50 lt!560672 lt!560672))))

(assert (=> b!1236088 (subseq!557 acc!846 lt!560672)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79685 List!27223 List!27223 (_ BitVec 32)) Unit!40994)

(assert (=> b!1236088 (= lt!560671 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560672 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1236088 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236089 () Bool)

(declare-fun res!824096 () Bool)

(assert (=> b!1236089 (=> (not res!824096) (not e!700700))))

(assert (=> b!1236089 (= res!824096 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236091 () Bool)

(declare-fun Unit!40996 () Unit!40994)

(assert (=> b!1236091 (= e!700701 Unit!40996)))

(declare-fun b!1236092 () Bool)

(declare-fun res!824104 () Bool)

(assert (=> b!1236092 (=> (not res!824104) (not e!700699))))

(assert (=> b!1236092 (= res!824104 (not (contains!7285 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824098 () Bool)

(assert (=> start!102840 (=> (not res!824098) (not e!700699))))

(assert (=> start!102840 (= res!824098 (and (bvslt (size!38986 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38986 a!3835))))))

(assert (=> start!102840 e!700699))

(declare-fun array_inv!29298 (array!79685) Bool)

(assert (=> start!102840 (array_inv!29298 a!3835)))

(assert (=> start!102840 true))

(declare-fun b!1236090 () Bool)

(declare-fun res!824101 () Bool)

(assert (=> b!1236090 (=> (not res!824101) (not e!700699))))

(assert (=> b!1236090 (= res!824101 (not (contains!7285 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102840 res!824098) b!1236083))

(assert (= (and b!1236083 res!824097) b!1236092))

(assert (= (and b!1236092 res!824104) b!1236090))

(assert (= (and b!1236090 res!824101) b!1236086))

(assert (= (and b!1236086 res!824102) b!1236082))

(assert (= (and b!1236082 res!824103) b!1236087))

(assert (= (and b!1236087 res!824100) b!1236084))

(assert (= (and b!1236084 c!120853) b!1236088))

(assert (= (and b!1236084 (not c!120853)) b!1236091))

(assert (= (and b!1236084 res!824099) b!1236089))

(assert (= (and b!1236089 res!824096) b!1236085))

(declare-fun m!1139923 () Bool)

(assert (=> b!1236090 m!1139923))

(declare-fun m!1139925 () Bool)

(assert (=> b!1236088 m!1139925))

(declare-fun m!1139927 () Bool)

(assert (=> b!1236088 m!1139927))

(declare-fun m!1139929 () Bool)

(assert (=> b!1236088 m!1139929))

(declare-fun m!1139931 () Bool)

(assert (=> b!1236088 m!1139931))

(declare-fun m!1139933 () Bool)

(assert (=> b!1236088 m!1139933))

(declare-fun m!1139935 () Bool)

(assert (=> b!1236088 m!1139935))

(declare-fun m!1139937 () Bool)

(assert (=> b!1236088 m!1139937))

(declare-fun m!1139939 () Bool)

(assert (=> start!102840 m!1139939))

(declare-fun m!1139941 () Bool)

(assert (=> b!1236086 m!1139941))

(declare-fun m!1139943 () Bool)

(assert (=> b!1236085 m!1139943))

(declare-fun m!1139945 () Bool)

(assert (=> b!1236085 m!1139945))

(declare-fun m!1139947 () Bool)

(assert (=> b!1236082 m!1139947))

(declare-fun m!1139949 () Bool)

(assert (=> b!1236092 m!1139949))

(assert (=> b!1236084 m!1139937))

(assert (=> b!1236084 m!1139937))

(declare-fun m!1139951 () Bool)

(assert (=> b!1236084 m!1139951))

(declare-fun m!1139953 () Bool)

(assert (=> b!1236083 m!1139953))

(assert (=> b!1236089 m!1139933))

(push 1)

