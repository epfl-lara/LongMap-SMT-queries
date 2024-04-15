; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102826 () Bool)

(assert start!102826)

(declare-fun b!1235823 () Bool)

(declare-fun res!823912 () Bool)

(declare-fun e!700592 () Bool)

(assert (=> b!1235823 (=> (not res!823912) (not e!700592))))

(declare-datatypes ((List!27279 0))(
  ( (Nil!27276) (Cons!27275 (h!28484 (_ BitVec 64)) (t!40733 List!27279)) )
))
(declare-fun acc!846 () List!27279)

(declare-fun contains!7251 (List!27279 (_ BitVec 64)) Bool)

(assert (=> b!1235823 (= res!823912 (not (contains!7251 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235824 () Bool)

(declare-fun res!823914 () Bool)

(assert (=> b!1235824 (=> (not res!823914) (not e!700592))))

(declare-fun noDuplicate!1894 (List!27279) Bool)

(assert (=> b!1235824 (= res!823914 (noDuplicate!1894 acc!846))))

(declare-fun b!1235825 () Bool)

(declare-fun e!700595 () Bool)

(assert (=> b!1235825 (= e!700592 e!700595)))

(declare-fun res!823916 () Bool)

(assert (=> b!1235825 (=> (not res!823916) (not e!700595))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79594 0))(
  ( (array!79595 (arr!38405 (Array (_ BitVec 32) (_ BitVec 64))) (size!38943 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79594)

(assert (=> b!1235825 (= res!823916 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38943 a!3835))))))

(declare-datatypes ((Unit!40823 0))(
  ( (Unit!40824) )
))
(declare-fun lt!560391 () Unit!40823)

(declare-fun e!700593 () Unit!40823)

(assert (=> b!1235825 (= lt!560391 e!700593)))

(declare-fun c!120820 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235825 (= c!120820 (validKeyInArray!0 (select (arr!38405 a!3835) from!3213)))))

(declare-fun b!1235826 () Bool)

(declare-fun res!823911 () Bool)

(assert (=> b!1235826 (=> (not res!823911) (not e!700592))))

(assert (=> b!1235826 (= res!823911 (not (contains!7251 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235827 () Bool)

(declare-fun res!823910 () Bool)

(assert (=> b!1235827 (=> (not res!823910) (not e!700592))))

(declare-fun arrayNoDuplicates!0 (array!79594 (_ BitVec 32) List!27279) Bool)

(assert (=> b!1235827 (= res!823910 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!823913 () Bool)

(assert (=> start!102826 (=> (not res!823913) (not e!700592))))

(assert (=> start!102826 (= res!823913 (and (bvslt (size!38943 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38943 a!3835))))))

(assert (=> start!102826 e!700592))

(declare-fun array_inv!29388 (array!79594) Bool)

(assert (=> start!102826 (array_inv!29388 a!3835)))

(assert (=> start!102826 true))

(declare-fun b!1235828 () Bool)

(declare-fun Unit!40825 () Unit!40823)

(assert (=> b!1235828 (= e!700593 Unit!40825)))

(declare-fun b!1235829 () Bool)

(assert (=> b!1235829 (= e!700595 false)))

(declare-fun lt!560393 () Bool)

(assert (=> b!1235829 (= lt!560393 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235830 () Bool)

(declare-fun res!823915 () Bool)

(assert (=> b!1235830 (=> (not res!823915) (not e!700592))))

(assert (=> b!1235830 (= res!823915 (not (= from!3213 (bvsub (size!38943 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235831 () Bool)

(declare-fun res!823909 () Bool)

(assert (=> b!1235831 (=> (not res!823909) (not e!700592))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235831 (= res!823909 (contains!7251 acc!846 k0!2925))))

(declare-fun b!1235832 () Bool)

(declare-fun lt!560388 () Unit!40823)

(assert (=> b!1235832 (= e!700593 lt!560388)))

(declare-fun lt!560390 () List!27279)

(assert (=> b!1235832 (= lt!560390 (Cons!27275 (select (arr!38405 a!3835) from!3213) acc!846))))

(declare-fun lt!560389 () Unit!40823)

(declare-fun lemmaListSubSeqRefl!0 (List!27279) Unit!40823)

(assert (=> b!1235832 (= lt!560389 (lemmaListSubSeqRefl!0 lt!560390))))

(declare-fun subseq!551 (List!27279 List!27279) Bool)

(assert (=> b!1235832 (subseq!551 lt!560390 lt!560390)))

(declare-fun lt!560392 () Unit!40823)

(declare-fun subseqTail!44 (List!27279 List!27279) Unit!40823)

(assert (=> b!1235832 (= lt!560392 (subseqTail!44 lt!560390 lt!560390))))

(assert (=> b!1235832 (subseq!551 acc!846 lt!560390)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79594 List!27279 List!27279 (_ BitVec 32)) Unit!40823)

(assert (=> b!1235832 (= lt!560388 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560390 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235832 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(assert (= (and start!102826 res!823913) b!1235824))

(assert (= (and b!1235824 res!823914) b!1235826))

(assert (= (and b!1235826 res!823911) b!1235823))

(assert (= (and b!1235823 res!823912) b!1235827))

(assert (= (and b!1235827 res!823910) b!1235831))

(assert (= (and b!1235831 res!823909) b!1235830))

(assert (= (and b!1235830 res!823915) b!1235825))

(assert (= (and b!1235825 c!120820) b!1235832))

(assert (= (and b!1235825 (not c!120820)) b!1235828))

(assert (= (and b!1235825 res!823916) b!1235829))

(declare-fun m!1139247 () Bool)

(assert (=> b!1235827 m!1139247))

(declare-fun m!1139249 () Bool)

(assert (=> b!1235832 m!1139249))

(declare-fun m!1139251 () Bool)

(assert (=> b!1235832 m!1139251))

(declare-fun m!1139253 () Bool)

(assert (=> b!1235832 m!1139253))

(declare-fun m!1139255 () Bool)

(assert (=> b!1235832 m!1139255))

(declare-fun m!1139257 () Bool)

(assert (=> b!1235832 m!1139257))

(declare-fun m!1139259 () Bool)

(assert (=> b!1235832 m!1139259))

(declare-fun m!1139261 () Bool)

(assert (=> b!1235832 m!1139261))

(declare-fun m!1139263 () Bool)

(assert (=> start!102826 m!1139263))

(declare-fun m!1139265 () Bool)

(assert (=> b!1235824 m!1139265))

(declare-fun m!1139267 () Bool)

(assert (=> b!1235831 m!1139267))

(declare-fun m!1139269 () Bool)

(assert (=> b!1235826 m!1139269))

(declare-fun m!1139271 () Bool)

(assert (=> b!1235823 m!1139271))

(assert (=> b!1235829 m!1139259))

(assert (=> b!1235825 m!1139261))

(assert (=> b!1235825 m!1139261))

(declare-fun m!1139273 () Bool)

(assert (=> b!1235825 m!1139273))

(check-sat (not start!102826) (not b!1235827) (not b!1235829) (not b!1235831) (not b!1235825) (not b!1235832) (not b!1235824) (not b!1235823) (not b!1235826))
(check-sat)
