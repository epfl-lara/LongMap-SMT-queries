; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102774 () Bool)

(assert start!102774)

(declare-fun b!1235031 () Bool)

(declare-fun res!823202 () Bool)

(declare-fun e!700328 () Bool)

(assert (=> b!1235031 (=> res!823202 e!700328)))

(declare-datatypes ((List!27190 0))(
  ( (Nil!27187) (Cons!27186 (h!28395 (_ BitVec 64)) (t!40653 List!27190)) )
))
(declare-fun lt!560104 () List!27190)

(declare-fun contains!7252 (List!27190 (_ BitVec 64)) Bool)

(assert (=> b!1235031 (= res!823202 (contains!7252 lt!560104 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!823193 () Bool)

(declare-fun e!700327 () Bool)

(assert (=> start!102774 (=> (not res!823193) (not e!700327))))

(declare-datatypes ((array!79619 0))(
  ( (array!79620 (arr!38417 (Array (_ BitVec 32) (_ BitVec 64))) (size!38953 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79619)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102774 (= res!823193 (and (bvslt (size!38953 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38953 a!3835))))))

(assert (=> start!102774 e!700327))

(declare-fun array_inv!29265 (array!79619) Bool)

(assert (=> start!102774 (array_inv!29265 a!3835)))

(assert (=> start!102774 true))

(declare-fun b!1235032 () Bool)

(declare-fun res!823195 () Bool)

(assert (=> b!1235032 (=> (not res!823195) (not e!700327))))

(declare-fun acc!846 () List!27190)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235032 (= res!823195 (contains!7252 acc!846 k!2925))))

(declare-fun b!1235033 () Bool)

(declare-fun res!823204 () Bool)

(assert (=> b!1235033 (=> res!823204 e!700328)))

(assert (=> b!1235033 (= res!823204 (contains!7252 lt!560104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235034 () Bool)

(declare-fun res!823203 () Bool)

(assert (=> b!1235034 (=> (not res!823203) (not e!700327))))

(assert (=> b!1235034 (= res!823203 (not (contains!7252 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235035 () Bool)

(assert (=> b!1235035 (= e!700328 true)))

(declare-fun lt!560103 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79619 (_ BitVec 32) List!27190) Bool)

(assert (=> b!1235035 (= lt!560103 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560104))))

(declare-datatypes ((Unit!40904 0))(
  ( (Unit!40905) )
))
(declare-fun lt!560102 () Unit!40904)

(declare-fun noDuplicateSubseq!71 (List!27190 List!27190) Unit!40904)

(assert (=> b!1235035 (= lt!560102 (noDuplicateSubseq!71 acc!846 lt!560104))))

(declare-fun b!1235036 () Bool)

(declare-fun res!823197 () Bool)

(assert (=> b!1235036 (=> (not res!823197) (not e!700327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235036 (= res!823197 (validKeyInArray!0 (select (arr!38417 a!3835) from!3213)))))

(declare-fun b!1235037 () Bool)

(declare-fun res!823199 () Bool)

(assert (=> b!1235037 (=> (not res!823199) (not e!700327))))

(assert (=> b!1235037 (= res!823199 (not (= from!3213 (bvsub (size!38953 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235038 () Bool)

(declare-fun res!823201 () Bool)

(assert (=> b!1235038 (=> (not res!823201) (not e!700327))))

(assert (=> b!1235038 (= res!823201 (not (contains!7252 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235039 () Bool)

(declare-fun res!823196 () Bool)

(assert (=> b!1235039 (=> (not res!823196) (not e!700327))))

(assert (=> b!1235039 (= res!823196 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235040 () Bool)

(declare-fun res!823198 () Bool)

(assert (=> b!1235040 (=> (not res!823198) (not e!700327))))

(declare-fun noDuplicate!1849 (List!27190) Bool)

(assert (=> b!1235040 (= res!823198 (noDuplicate!1849 acc!846))))

(declare-fun b!1235041 () Bool)

(declare-fun res!823200 () Bool)

(assert (=> b!1235041 (=> res!823200 e!700328)))

(assert (=> b!1235041 (= res!823200 (not (noDuplicate!1849 lt!560104)))))

(declare-fun b!1235042 () Bool)

(assert (=> b!1235042 (= e!700327 (not e!700328))))

(declare-fun res!823194 () Bool)

(assert (=> b!1235042 (=> res!823194 e!700328)))

(assert (=> b!1235042 (= res!823194 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!524 (List!27190 List!27190) Bool)

(assert (=> b!1235042 (subseq!524 acc!846 lt!560104)))

(declare-fun lt!560105 () Unit!40904)

(declare-fun subseqTail!17 (List!27190 List!27190) Unit!40904)

(assert (=> b!1235042 (= lt!560105 (subseqTail!17 lt!560104 lt!560104))))

(assert (=> b!1235042 (subseq!524 lt!560104 lt!560104)))

(declare-fun lt!560101 () Unit!40904)

(declare-fun lemmaListSubSeqRefl!0 (List!27190) Unit!40904)

(assert (=> b!1235042 (= lt!560101 (lemmaListSubSeqRefl!0 lt!560104))))

(assert (=> b!1235042 (= lt!560104 (Cons!27186 (select (arr!38417 a!3835) from!3213) acc!846))))

(assert (= (and start!102774 res!823193) b!1235040))

(assert (= (and b!1235040 res!823198) b!1235034))

(assert (= (and b!1235034 res!823203) b!1235038))

(assert (= (and b!1235038 res!823201) b!1235039))

(assert (= (and b!1235039 res!823196) b!1235032))

(assert (= (and b!1235032 res!823195) b!1235037))

(assert (= (and b!1235037 res!823199) b!1235036))

(assert (= (and b!1235036 res!823197) b!1235042))

(assert (= (and b!1235042 (not res!823194)) b!1235041))

(assert (= (and b!1235041 (not res!823200)) b!1235033))

(assert (= (and b!1235033 (not res!823204)) b!1235031))

(assert (= (and b!1235031 (not res!823202)) b!1235035))

(declare-fun m!1138933 () Bool)

(assert (=> b!1235035 m!1138933))

(declare-fun m!1138935 () Bool)

(assert (=> b!1235035 m!1138935))

(declare-fun m!1138937 () Bool)

(assert (=> b!1235038 m!1138937))

(declare-fun m!1138939 () Bool)

(assert (=> b!1235036 m!1138939))

(assert (=> b!1235036 m!1138939))

(declare-fun m!1138941 () Bool)

(assert (=> b!1235036 m!1138941))

(declare-fun m!1138943 () Bool)

(assert (=> b!1235041 m!1138943))

(declare-fun m!1138945 () Bool)

(assert (=> b!1235034 m!1138945))

(declare-fun m!1138947 () Bool)

(assert (=> b!1235032 m!1138947))

(declare-fun m!1138949 () Bool)

(assert (=> b!1235033 m!1138949))

(declare-fun m!1138951 () Bool)

(assert (=> b!1235031 m!1138951))

(declare-fun m!1138953 () Bool)

(assert (=> b!1235040 m!1138953))

(declare-fun m!1138955 () Bool)

(assert (=> start!102774 m!1138955))

(declare-fun m!1138957 () Bool)

(assert (=> b!1235042 m!1138957))

(declare-fun m!1138959 () Bool)

(assert (=> b!1235042 m!1138959))

(declare-fun m!1138961 () Bool)

(assert (=> b!1235042 m!1138961))

(declare-fun m!1138963 () Bool)

(assert (=> b!1235042 m!1138963))

(assert (=> b!1235042 m!1138939))

(declare-fun m!1138965 () Bool)

(assert (=> b!1235039 m!1138965))

(push 1)

(assert (not b!1235036))

(assert (not b!1235039))

(assert (not b!1235032))

(assert (not b!1235035))

(assert (not start!102774))

(assert (not b!1235042))

(assert (not b!1235033))

(assert (not b!1235038))

(assert (not b!1235031))

(assert (not b!1235034))

(assert (not b!1235040))

(assert (not b!1235041))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

