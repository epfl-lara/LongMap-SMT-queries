; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103192 () Bool)

(assert start!103192)

(declare-fun b!1238703 () Bool)

(declare-fun res!826334 () Bool)

(declare-fun e!702048 () Bool)

(assert (=> b!1238703 (=> (not res!826334) (not e!702048))))

(declare-datatypes ((List!27288 0))(
  ( (Nil!27285) (Cons!27284 (h!28493 (_ BitVec 64)) (t!40751 List!27288)) )
))
(declare-fun acc!846 () List!27288)

(declare-fun contains!7350 (List!27288 (_ BitVec 64)) Bool)

(assert (=> b!1238703 (= res!826334 (not (contains!7350 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238704 () Bool)

(declare-datatypes ((Unit!41122 0))(
  ( (Unit!41123) )
))
(declare-fun e!702046 () Unit!41122)

(declare-fun lt!561382 () Unit!41122)

(assert (=> b!1238704 (= e!702046 lt!561382)))

(declare-datatypes ((array!79827 0))(
  ( (array!79828 (arr!38515 (Array (_ BitVec 32) (_ BitVec 64))) (size!39051 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79827)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!561386 () List!27288)

(assert (=> b!1238704 (= lt!561386 (Cons!27284 (select (arr!38515 a!3835) from!3213) acc!846))))

(declare-fun lt!561383 () Unit!41122)

(declare-fun lemmaListSubSeqRefl!0 (List!27288) Unit!41122)

(assert (=> b!1238704 (= lt!561383 (lemmaListSubSeqRefl!0 lt!561386))))

(declare-fun subseq!604 (List!27288 List!27288) Bool)

(assert (=> b!1238704 (subseq!604 lt!561386 lt!561386)))

(declare-fun lt!561385 () Unit!41122)

(declare-fun subseqTail!91 (List!27288 List!27288) Unit!41122)

(assert (=> b!1238704 (= lt!561385 (subseqTail!91 lt!561386 lt!561386))))

(assert (=> b!1238704 (subseq!604 acc!846 lt!561386)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79827 List!27288 List!27288 (_ BitVec 32)) Unit!41122)

(assert (=> b!1238704 (= lt!561382 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561386 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79827 (_ BitVec 32) List!27288) Bool)

(assert (=> b!1238704 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238705 () Bool)

(declare-fun res!826338 () Bool)

(assert (=> b!1238705 (=> (not res!826338) (not e!702048))))

(assert (=> b!1238705 (= res!826338 (not (contains!7350 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238706 () Bool)

(declare-fun res!826335 () Bool)

(assert (=> b!1238706 (=> (not res!826335) (not e!702048))))

(assert (=> b!1238706 (= res!826335 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238707 () Bool)

(assert (=> b!1238707 (= e!702048 false)))

(declare-fun lt!561384 () Unit!41122)

(assert (=> b!1238707 (= lt!561384 e!702046)))

(declare-fun c!121045 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238707 (= c!121045 (validKeyInArray!0 (select (arr!38515 a!3835) from!3213)))))

(declare-fun b!1238709 () Bool)

(declare-fun Unit!41124 () Unit!41122)

(assert (=> b!1238709 (= e!702046 Unit!41124)))

(declare-fun b!1238710 () Bool)

(declare-fun res!826337 () Bool)

(assert (=> b!1238710 (=> (not res!826337) (not e!702048))))

(declare-fun noDuplicate!1947 (List!27288) Bool)

(assert (=> b!1238710 (= res!826337 (noDuplicate!1947 acc!846))))

(declare-fun b!1238711 () Bool)

(declare-fun res!826339 () Bool)

(assert (=> b!1238711 (=> (not res!826339) (not e!702048))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238711 (= res!826339 (contains!7350 acc!846 k!2925))))

(declare-fun b!1238708 () Bool)

(declare-fun res!826333 () Bool)

(assert (=> b!1238708 (=> (not res!826333) (not e!702048))))

(assert (=> b!1238708 (= res!826333 (not (= from!3213 (bvsub (size!39051 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!826336 () Bool)

(assert (=> start!103192 (=> (not res!826336) (not e!702048))))

(assert (=> start!103192 (= res!826336 (and (bvslt (size!39051 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39051 a!3835))))))

(assert (=> start!103192 e!702048))

(declare-fun array_inv!29363 (array!79827) Bool)

(assert (=> start!103192 (array_inv!29363 a!3835)))

(assert (=> start!103192 true))

(assert (= (and start!103192 res!826336) b!1238710))

(assert (= (and b!1238710 res!826337) b!1238705))

(assert (= (and b!1238705 res!826338) b!1238703))

(assert (= (and b!1238703 res!826334) b!1238706))

(assert (= (and b!1238706 res!826335) b!1238711))

(assert (= (and b!1238711 res!826339) b!1238708))

(assert (= (and b!1238708 res!826333) b!1238707))

(assert (= (and b!1238707 c!121045) b!1238704))

(assert (= (and b!1238707 (not c!121045)) b!1238709))

(declare-fun m!1142211 () Bool)

(assert (=> b!1238706 m!1142211))

(declare-fun m!1142213 () Bool)

(assert (=> b!1238704 m!1142213))

(declare-fun m!1142215 () Bool)

(assert (=> b!1238704 m!1142215))

(declare-fun m!1142217 () Bool)

(assert (=> b!1238704 m!1142217))

(declare-fun m!1142219 () Bool)

(assert (=> b!1238704 m!1142219))

(declare-fun m!1142221 () Bool)

(assert (=> b!1238704 m!1142221))

(declare-fun m!1142223 () Bool)

(assert (=> b!1238704 m!1142223))

(declare-fun m!1142225 () Bool)

(assert (=> b!1238704 m!1142225))

(declare-fun m!1142227 () Bool)

(assert (=> b!1238705 m!1142227))

(declare-fun m!1142229 () Bool)

(assert (=> b!1238711 m!1142229))

(declare-fun m!1142231 () Bool)

(assert (=> b!1238703 m!1142231))

(declare-fun m!1142233 () Bool)

(assert (=> start!103192 m!1142233))

(assert (=> b!1238707 m!1142217))

(assert (=> b!1238707 m!1142217))

(declare-fun m!1142235 () Bool)

(assert (=> b!1238707 m!1142235))

(declare-fun m!1142237 () Bool)

(assert (=> b!1238710 m!1142237))

(push 1)

(assert (not b!1238703))

(assert (not b!1238704))

(assert (not b!1238711))

(assert (not b!1238710))

(assert (not start!103192))

(assert (not b!1238707))

(assert (not b!1238705))

(assert (not b!1238706))

(check-sat)

(pop 1)

