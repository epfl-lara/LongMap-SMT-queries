; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103288 () Bool)

(assert start!103288)

(declare-fun b!1239523 () Bool)

(declare-fun res!826955 () Bool)

(declare-fun e!702443 () Bool)

(assert (=> b!1239523 (=> (not res!826955) (not e!702443))))

(declare-datatypes ((List!27309 0))(
  ( (Nil!27306) (Cons!27305 (h!28514 (_ BitVec 64)) (t!40772 List!27309)) )
))
(declare-fun acc!846 () List!27309)

(declare-fun contains!7371 (List!27309 (_ BitVec 64)) Bool)

(assert (=> b!1239523 (= res!826955 (not (contains!7371 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239524 () Bool)

(declare-datatypes ((Unit!41189 0))(
  ( (Unit!41190) )
))
(declare-fun e!702441 () Unit!41189)

(declare-fun lt!561748 () Unit!41189)

(assert (=> b!1239524 (= e!702441 lt!561748)))

(declare-datatypes ((array!79872 0))(
  ( (array!79873 (arr!38536 (Array (_ BitVec 32) (_ BitVec 64))) (size!39072 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79872)

(declare-fun lt!561752 () List!27309)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1239524 (= lt!561752 (Cons!27305 (select (arr!38536 a!3835) from!3213) acc!846))))

(declare-fun lt!561751 () Unit!41189)

(declare-fun lemmaListSubSeqRefl!0 (List!27309) Unit!41189)

(assert (=> b!1239524 (= lt!561751 (lemmaListSubSeqRefl!0 lt!561752))))

(declare-fun subseq!625 (List!27309 List!27309) Bool)

(assert (=> b!1239524 (subseq!625 lt!561752 lt!561752)))

(declare-fun lt!561750 () Unit!41189)

(declare-fun subseqTail!112 (List!27309 List!27309) Unit!41189)

(assert (=> b!1239524 (= lt!561750 (subseqTail!112 lt!561752 lt!561752))))

(assert (=> b!1239524 (subseq!625 acc!846 lt!561752)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79872 List!27309 List!27309 (_ BitVec 32)) Unit!41189)

(assert (=> b!1239524 (= lt!561748 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561752 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79872 (_ BitVec 32) List!27309) Bool)

(assert (=> b!1239524 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239525 () Bool)

(declare-fun Unit!41191 () Unit!41189)

(assert (=> b!1239525 (= e!702441 Unit!41191)))

(declare-fun b!1239526 () Bool)

(declare-fun res!826957 () Bool)

(assert (=> b!1239526 (=> (not res!826957) (not e!702443))))

(assert (=> b!1239526 (= res!826957 (not (= from!3213 (bvsub (size!39072 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239527 () Bool)

(declare-fun res!826956 () Bool)

(assert (=> b!1239527 (=> (not res!826956) (not e!702443))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1239527 (= res!826956 (contains!7371 acc!846 k!2925))))

(declare-fun b!1239528 () Bool)

(declare-fun res!826953 () Bool)

(declare-fun e!702442 () Bool)

(assert (=> b!1239528 (=> (not res!826953) (not e!702442))))

(assert (=> b!1239528 (= res!826953 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1239529 () Bool)

(declare-fun res!826950 () Bool)

(assert (=> b!1239529 (=> (not res!826950) (not e!702443))))

(declare-fun noDuplicate!1968 (List!27309) Bool)

(assert (=> b!1239529 (= res!826950 (noDuplicate!1968 acc!846))))

(declare-fun b!1239530 () Bool)

(declare-fun res!826951 () Bool)

(assert (=> b!1239530 (=> (not res!826951) (not e!702443))))

(assert (=> b!1239530 (= res!826951 (not (contains!7371 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239531 () Bool)

(declare-fun res!826949 () Bool)

(assert (=> b!1239531 (=> (not res!826949) (not e!702443))))

(assert (=> b!1239531 (= res!826949 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239532 () Bool)

(assert (=> b!1239532 (= e!702443 e!702442)))

(declare-fun res!826952 () Bool)

(assert (=> b!1239532 (=> (not res!826952) (not e!702442))))

(assert (=> b!1239532 (= res!826952 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39072 a!3835))))))

(declare-fun lt!561749 () Unit!41189)

(assert (=> b!1239532 (= lt!561749 e!702441)))

(declare-fun c!121147 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239532 (= c!121147 (validKeyInArray!0 (select (arr!38536 a!3835) from!3213)))))

(declare-fun res!826954 () Bool)

(assert (=> start!103288 (=> (not res!826954) (not e!702443))))

(assert (=> start!103288 (= res!826954 (and (bvslt (size!39072 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39072 a!3835))))))

(assert (=> start!103288 e!702443))

(declare-fun array_inv!29384 (array!79872) Bool)

(assert (=> start!103288 (array_inv!29384 a!3835)))

(assert (=> start!103288 true))

(declare-fun b!1239533 () Bool)

(assert (=> b!1239533 (= e!702442 (bvsge (bvsub (size!39072 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) (bvsub (size!39072 a!3835) from!3213)))))

(assert (= (and start!103288 res!826954) b!1239529))

(assert (= (and b!1239529 res!826950) b!1239523))

(assert (= (and b!1239523 res!826955) b!1239530))

(assert (= (and b!1239530 res!826951) b!1239531))

(assert (= (and b!1239531 res!826949) b!1239527))

(assert (= (and b!1239527 res!826956) b!1239526))

(assert (= (and b!1239526 res!826957) b!1239532))

(assert (= (and b!1239532 c!121147) b!1239524))

(assert (= (and b!1239532 (not c!121147)) b!1239525))

(assert (= (and b!1239532 res!826952) b!1239528))

(assert (= (and b!1239528 res!826953) b!1239533))

(declare-fun m!1142955 () Bool)

(assert (=> b!1239523 m!1142955))

(declare-fun m!1142957 () Bool)

(assert (=> b!1239528 m!1142957))

(declare-fun m!1142959 () Bool)

(assert (=> b!1239530 m!1142959))

(declare-fun m!1142961 () Bool)

(assert (=> b!1239527 m!1142961))

(declare-fun m!1142963 () Bool)

(assert (=> b!1239532 m!1142963))

(assert (=> b!1239532 m!1142963))

(declare-fun m!1142965 () Bool)

(assert (=> b!1239532 m!1142965))

(declare-fun m!1142967 () Bool)

(assert (=> b!1239529 m!1142967))

(declare-fun m!1142969 () Bool)

(assert (=> b!1239531 m!1142969))

(declare-fun m!1142971 () Bool)

(assert (=> b!1239524 m!1142971))

(declare-fun m!1142973 () Bool)

(assert (=> b!1239524 m!1142973))

(declare-fun m!1142975 () Bool)

(assert (=> b!1239524 m!1142975))

(assert (=> b!1239524 m!1142957))

(assert (=> b!1239524 m!1142963))

(declare-fun m!1142977 () Bool)

(assert (=> b!1239524 m!1142977))

(declare-fun m!1142979 () Bool)

(assert (=> b!1239524 m!1142979))

(declare-fun m!1142981 () Bool)

(assert (=> start!103288 m!1142981))

(push 1)

(assert (not b!1239528))

(assert (not b!1239531))

(assert (not start!103288))

(assert (not b!1239527))

(assert (not b!1239523))

(assert (not b!1239524))

(assert (not b!1239532))

(assert (not b!1239530))

(assert (not b!1239529))

(check-sat)

(pop 1)

(push 1)

(check-sat)

