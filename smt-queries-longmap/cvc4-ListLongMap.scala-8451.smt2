; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102844 () Bool)

(assert start!102844)

(declare-fun b!1236148 () Bool)

(declare-fun res!824156 () Bool)

(declare-fun e!700725 () Bool)

(assert (=> b!1236148 (=> (not res!824156) (not e!700725))))

(declare-datatypes ((List!27225 0))(
  ( (Nil!27222) (Cons!27221 (h!28430 (_ BitVec 64)) (t!40688 List!27225)) )
))
(declare-fun acc!846 () List!27225)

(declare-fun contains!7287 (List!27225 (_ BitVec 64)) Bool)

(assert (=> b!1236148 (= res!824156 (not (contains!7287 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236149 () Bool)

(declare-datatypes ((Unit!41000 0))(
  ( (Unit!41001) )
))
(declare-fun e!700723 () Unit!41000)

(declare-fun lt!560707 () Unit!41000)

(assert (=> b!1236149 (= e!700723 lt!560707)))

(declare-fun lt!560709 () List!27225)

(declare-datatypes ((array!79689 0))(
  ( (array!79690 (arr!38452 (Array (_ BitVec 32) (_ BitVec 64))) (size!38988 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79689)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1236149 (= lt!560709 (Cons!27221 (select (arr!38452 a!3835) from!3213) acc!846))))

(declare-fun lt!560708 () Unit!41000)

(declare-fun lemmaListSubSeqRefl!0 (List!27225) Unit!41000)

(assert (=> b!1236149 (= lt!560708 (lemmaListSubSeqRefl!0 lt!560709))))

(declare-fun subseq!559 (List!27225 List!27225) Bool)

(assert (=> b!1236149 (subseq!559 lt!560709 lt!560709)))

(declare-fun lt!560711 () Unit!41000)

(declare-fun subseqTail!52 (List!27225 List!27225) Unit!41000)

(assert (=> b!1236149 (= lt!560711 (subseqTail!52 lt!560709 lt!560709))))

(assert (=> b!1236149 (subseq!559 acc!846 lt!560709)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79689 List!27225 List!27225 (_ BitVec 32)) Unit!41000)

(assert (=> b!1236149 (= lt!560707 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560709 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79689 (_ BitVec 32) List!27225) Bool)

(assert (=> b!1236149 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236150 () Bool)

(declare-fun e!700724 () Bool)

(assert (=> b!1236150 (= e!700725 e!700724)))

(declare-fun res!824152 () Bool)

(assert (=> b!1236150 (=> (not res!824152) (not e!700724))))

(assert (=> b!1236150 (= res!824152 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38988 a!3835))))))

(declare-fun lt!560706 () Unit!41000)

(assert (=> b!1236150 (= lt!560706 e!700723)))

(declare-fun c!120859 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236150 (= c!120859 (validKeyInArray!0 (select (arr!38452 a!3835) from!3213)))))

(declare-fun b!1236151 () Bool)

(declare-fun res!824153 () Bool)

(assert (=> b!1236151 (=> (not res!824153) (not e!700725))))

(assert (=> b!1236151 (= res!824153 (not (contains!7287 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824154 () Bool)

(assert (=> start!102844 (=> (not res!824154) (not e!700725))))

(assert (=> start!102844 (= res!824154 (and (bvslt (size!38988 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38988 a!3835))))))

(assert (=> start!102844 e!700725))

(declare-fun array_inv!29300 (array!79689) Bool)

(assert (=> start!102844 (array_inv!29300 a!3835)))

(assert (=> start!102844 true))

(declare-fun b!1236152 () Bool)

(declare-fun res!824150 () Bool)

(assert (=> b!1236152 (=> (not res!824150) (not e!700725))))

(declare-fun noDuplicate!1884 (List!27225) Bool)

(assert (=> b!1236152 (= res!824150 (noDuplicate!1884 acc!846))))

(declare-fun b!1236153 () Bool)

(assert (=> b!1236153 (= e!700724 (not true))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1236153 (not (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!560710 () Unit!41000)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79689 (_ BitVec 32) (_ BitVec 64) List!27225) Unit!41000)

(assert (=> b!1236153 (= lt!560710 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846))))

(declare-fun b!1236154 () Bool)

(declare-fun res!824151 () Bool)

(assert (=> b!1236154 (=> (not res!824151) (not e!700725))))

(assert (=> b!1236154 (= res!824151 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236155 () Bool)

(declare-fun res!824157 () Bool)

(assert (=> b!1236155 (=> (not res!824157) (not e!700724))))

(assert (=> b!1236155 (= res!824157 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236156 () Bool)

(declare-fun res!824158 () Bool)

(assert (=> b!1236156 (=> (not res!824158) (not e!700725))))

(assert (=> b!1236156 (= res!824158 (not (= from!3213 (bvsub (size!38988 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236157 () Bool)

(declare-fun res!824155 () Bool)

(assert (=> b!1236157 (=> (not res!824155) (not e!700725))))

(assert (=> b!1236157 (= res!824155 (contains!7287 acc!846 k!2925))))

(declare-fun b!1236158 () Bool)

(declare-fun Unit!41002 () Unit!41000)

(assert (=> b!1236158 (= e!700723 Unit!41002)))

(assert (= (and start!102844 res!824154) b!1236152))

(assert (= (and b!1236152 res!824150) b!1236148))

(assert (= (and b!1236148 res!824156) b!1236151))

(assert (= (and b!1236151 res!824153) b!1236154))

(assert (= (and b!1236154 res!824151) b!1236157))

(assert (= (and b!1236157 res!824155) b!1236156))

(assert (= (and b!1236156 res!824158) b!1236150))

(assert (= (and b!1236150 c!120859) b!1236149))

(assert (= (and b!1236150 (not c!120859)) b!1236158))

(assert (= (and b!1236150 res!824152) b!1236155))

(assert (= (and b!1236155 res!824157) b!1236153))

(declare-fun m!1139987 () Bool)

(assert (=> b!1236148 m!1139987))

(declare-fun m!1139989 () Bool)

(assert (=> b!1236155 m!1139989))

(declare-fun m!1139991 () Bool)

(assert (=> b!1236157 m!1139991))

(declare-fun m!1139993 () Bool)

(assert (=> b!1236154 m!1139993))

(declare-fun m!1139995 () Bool)

(assert (=> b!1236152 m!1139995))

(declare-fun m!1139997 () Bool)

(assert (=> b!1236153 m!1139997))

(declare-fun m!1139999 () Bool)

(assert (=> b!1236153 m!1139999))

(declare-fun m!1140001 () Bool)

(assert (=> b!1236149 m!1140001))

(declare-fun m!1140003 () Bool)

(assert (=> b!1236149 m!1140003))

(declare-fun m!1140005 () Bool)

(assert (=> b!1236149 m!1140005))

(assert (=> b!1236149 m!1139989))

(declare-fun m!1140007 () Bool)

(assert (=> b!1236149 m!1140007))

(declare-fun m!1140009 () Bool)

(assert (=> b!1236149 m!1140009))

(declare-fun m!1140011 () Bool)

(assert (=> b!1236149 m!1140011))

(declare-fun m!1140013 () Bool)

(assert (=> b!1236151 m!1140013))

(declare-fun m!1140015 () Bool)

(assert (=> start!102844 m!1140015))

(assert (=> b!1236150 m!1140009))

(assert (=> b!1236150 m!1140009))

(declare-fun m!1140017 () Bool)

(assert (=> b!1236150 m!1140017))

(push 1)

