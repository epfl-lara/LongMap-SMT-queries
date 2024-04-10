; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102768 () Bool)

(assert start!102768)

(declare-fun b!1234923 () Bool)

(declare-fun res!823095 () Bool)

(declare-fun e!700302 () Bool)

(assert (=> b!1234923 (=> (not res!823095) (not e!700302))))

(declare-datatypes ((List!27187 0))(
  ( (Nil!27184) (Cons!27183 (h!28392 (_ BitVec 64)) (t!40650 List!27187)) )
))
(declare-fun acc!846 () List!27187)

(declare-fun contains!7249 (List!27187 (_ BitVec 64)) Bool)

(assert (=> b!1234923 (= res!823095 (not (contains!7249 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!823087 () Bool)

(assert (=> start!102768 (=> (not res!823087) (not e!700302))))

(declare-datatypes ((array!79613 0))(
  ( (array!79614 (arr!38414 (Array (_ BitVec 32) (_ BitVec 64))) (size!38950 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79613)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102768 (= res!823087 (and (bvslt (size!38950 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38950 a!3835))))))

(assert (=> start!102768 e!700302))

(declare-fun array_inv!29262 (array!79613) Bool)

(assert (=> start!102768 (array_inv!29262 a!3835)))

(assert (=> start!102768 true))

(declare-fun b!1234924 () Bool)

(declare-fun res!823094 () Bool)

(assert (=> b!1234924 (=> (not res!823094) (not e!700302))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234924 (= res!823094 (contains!7249 acc!846 k!2925))))

(declare-fun b!1234925 () Bool)

(declare-fun res!823093 () Bool)

(assert (=> b!1234925 (=> (not res!823093) (not e!700302))))

(declare-fun arrayNoDuplicates!0 (array!79613 (_ BitVec 32) List!27187) Bool)

(assert (=> b!1234925 (= res!823093 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234926 () Bool)

(declare-fun res!823091 () Bool)

(declare-fun e!700301 () Bool)

(assert (=> b!1234926 (=> res!823091 e!700301)))

(declare-fun lt!560060 () List!27187)

(assert (=> b!1234926 (= res!823091 (contains!7249 lt!560060 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234927 () Bool)

(declare-fun res!823088 () Bool)

(assert (=> b!1234927 (=> res!823088 e!700301)))

(assert (=> b!1234927 (= res!823088 (contains!7249 lt!560060 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234928 () Bool)

(declare-fun res!823085 () Bool)

(assert (=> b!1234928 (=> (not res!823085) (not e!700302))))

(assert (=> b!1234928 (= res!823085 (not (= from!3213 (bvsub (size!38950 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234929 () Bool)

(assert (=> b!1234929 (= e!700301 true)))

(declare-fun lt!560059 () Bool)

(assert (=> b!1234929 (= lt!560059 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560060))))

(declare-datatypes ((Unit!40898 0))(
  ( (Unit!40899) )
))
(declare-fun lt!560057 () Unit!40898)

(declare-fun noDuplicateSubseq!68 (List!27187 List!27187) Unit!40898)

(assert (=> b!1234929 (= lt!560057 (noDuplicateSubseq!68 acc!846 lt!560060))))

(declare-fun b!1234930 () Bool)

(declare-fun res!823096 () Bool)

(assert (=> b!1234930 (=> res!823096 e!700301)))

(declare-fun noDuplicate!1846 (List!27187) Bool)

(assert (=> b!1234930 (= res!823096 (not (noDuplicate!1846 lt!560060)))))

(declare-fun b!1234931 () Bool)

(declare-fun res!823089 () Bool)

(assert (=> b!1234931 (=> (not res!823089) (not e!700302))))

(assert (=> b!1234931 (= res!823089 (not (contains!7249 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234932 () Bool)

(declare-fun res!823086 () Bool)

(assert (=> b!1234932 (=> (not res!823086) (not e!700302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234932 (= res!823086 (validKeyInArray!0 (select (arr!38414 a!3835) from!3213)))))

(declare-fun b!1234933 () Bool)

(assert (=> b!1234933 (= e!700302 (not e!700301))))

(declare-fun res!823092 () Bool)

(assert (=> b!1234933 (=> res!823092 e!700301)))

(assert (=> b!1234933 (= res!823092 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!521 (List!27187 List!27187) Bool)

(assert (=> b!1234933 (subseq!521 acc!846 lt!560060)))

(declare-fun lt!560058 () Unit!40898)

(declare-fun subseqTail!14 (List!27187 List!27187) Unit!40898)

(assert (=> b!1234933 (= lt!560058 (subseqTail!14 lt!560060 lt!560060))))

(assert (=> b!1234933 (subseq!521 lt!560060 lt!560060)))

(declare-fun lt!560056 () Unit!40898)

(declare-fun lemmaListSubSeqRefl!0 (List!27187) Unit!40898)

(assert (=> b!1234933 (= lt!560056 (lemmaListSubSeqRefl!0 lt!560060))))

(assert (=> b!1234933 (= lt!560060 (Cons!27183 (select (arr!38414 a!3835) from!3213) acc!846))))

(declare-fun b!1234934 () Bool)

(declare-fun res!823090 () Bool)

(assert (=> b!1234934 (=> (not res!823090) (not e!700302))))

(assert (=> b!1234934 (= res!823090 (noDuplicate!1846 acc!846))))

(assert (= (and start!102768 res!823087) b!1234934))

(assert (= (and b!1234934 res!823090) b!1234923))

(assert (= (and b!1234923 res!823095) b!1234931))

(assert (= (and b!1234931 res!823089) b!1234925))

(assert (= (and b!1234925 res!823093) b!1234924))

(assert (= (and b!1234924 res!823094) b!1234928))

(assert (= (and b!1234928 res!823085) b!1234932))

(assert (= (and b!1234932 res!823086) b!1234933))

(assert (= (and b!1234933 (not res!823092)) b!1234930))

(assert (= (and b!1234930 (not res!823096)) b!1234926))

(assert (= (and b!1234926 (not res!823091)) b!1234927))

(assert (= (and b!1234927 (not res!823088)) b!1234929))

(declare-fun m!1138831 () Bool)

(assert (=> b!1234930 m!1138831))

(declare-fun m!1138833 () Bool)

(assert (=> b!1234924 m!1138833))

(declare-fun m!1138835 () Bool)

(assert (=> b!1234932 m!1138835))

(assert (=> b!1234932 m!1138835))

(declare-fun m!1138837 () Bool)

(assert (=> b!1234932 m!1138837))

(declare-fun m!1138839 () Bool)

(assert (=> b!1234934 m!1138839))

(declare-fun m!1138841 () Bool)

(assert (=> b!1234931 m!1138841))

(declare-fun m!1138843 () Bool)

(assert (=> b!1234933 m!1138843))

(declare-fun m!1138845 () Bool)

(assert (=> b!1234933 m!1138845))

(declare-fun m!1138847 () Bool)

(assert (=> b!1234933 m!1138847))

(declare-fun m!1138849 () Bool)

(assert (=> b!1234933 m!1138849))

(assert (=> b!1234933 m!1138835))

(declare-fun m!1138851 () Bool)

(assert (=> b!1234929 m!1138851))

(declare-fun m!1138853 () Bool)

(assert (=> b!1234929 m!1138853))

(declare-fun m!1138855 () Bool)

(assert (=> b!1234926 m!1138855))

(declare-fun m!1138857 () Bool)

(assert (=> b!1234925 m!1138857))

(declare-fun m!1138859 () Bool)

(assert (=> start!102768 m!1138859))

(declare-fun m!1138861 () Bool)

(assert (=> b!1234927 m!1138861))

(declare-fun m!1138863 () Bool)

(assert (=> b!1234923 m!1138863))

(push 1)

(assert (not b!1234927))

(assert (not b!1234933))

(assert (not b!1234932))

(assert (not b!1234934))

(assert (not b!1234924))

(assert (not b!1234926))

(assert (not b!1234930))

(assert (not b!1234931))

(assert (not start!102768))

(assert (not b!1234923))

(assert (not b!1234929))

(assert (not b!1234925))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

