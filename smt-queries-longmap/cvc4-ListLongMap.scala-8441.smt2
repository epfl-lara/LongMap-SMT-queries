; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102784 () Bool)

(assert start!102784)

(declare-fun res!823382 () Bool)

(declare-fun e!700372 () Bool)

(assert (=> start!102784 (=> (not res!823382) (not e!700372))))

(declare-datatypes ((array!79629 0))(
  ( (array!79630 (arr!38422 (Array (_ BitVec 32) (_ BitVec 64))) (size!38958 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79629)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102784 (= res!823382 (and (bvslt (size!38958 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38958 a!3835))))))

(assert (=> start!102784 e!700372))

(declare-fun array_inv!29270 (array!79629) Bool)

(assert (=> start!102784 (array_inv!29270 a!3835)))

(assert (=> start!102784 true))

(declare-fun b!1235211 () Bool)

(declare-fun res!823373 () Bool)

(assert (=> b!1235211 (=> (not res!823373) (not e!700372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235211 (= res!823373 (validKeyInArray!0 (select (arr!38422 a!3835) from!3213)))))

(declare-fun b!1235212 () Bool)

(declare-fun res!823383 () Bool)

(declare-fun e!700373 () Bool)

(assert (=> b!1235212 (=> res!823383 e!700373)))

(declare-datatypes ((List!27195 0))(
  ( (Nil!27192) (Cons!27191 (h!28400 (_ BitVec 64)) (t!40658 List!27195)) )
))
(declare-fun lt!560177 () List!27195)

(declare-fun noDuplicate!1854 (List!27195) Bool)

(assert (=> b!1235212 (= res!823383 (not (noDuplicate!1854 lt!560177)))))

(declare-fun b!1235213 () Bool)

(assert (=> b!1235213 (= e!700372 (not e!700373))))

(declare-fun res!823384 () Bool)

(assert (=> b!1235213 (=> res!823384 e!700373)))

(assert (=> b!1235213 (= res!823384 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun acc!846 () List!27195)

(declare-fun subseq!529 (List!27195 List!27195) Bool)

(assert (=> b!1235213 (subseq!529 acc!846 lt!560177)))

(declare-datatypes ((Unit!40914 0))(
  ( (Unit!40915) )
))
(declare-fun lt!560180 () Unit!40914)

(declare-fun subseqTail!22 (List!27195 List!27195) Unit!40914)

(assert (=> b!1235213 (= lt!560180 (subseqTail!22 lt!560177 lt!560177))))

(assert (=> b!1235213 (subseq!529 lt!560177 lt!560177)))

(declare-fun lt!560176 () Unit!40914)

(declare-fun lemmaListSubSeqRefl!0 (List!27195) Unit!40914)

(assert (=> b!1235213 (= lt!560176 (lemmaListSubSeqRefl!0 lt!560177))))

(assert (=> b!1235213 (= lt!560177 (Cons!27191 (select (arr!38422 a!3835) from!3213) acc!846))))

(declare-fun b!1235214 () Bool)

(declare-fun res!823381 () Bool)

(assert (=> b!1235214 (=> (not res!823381) (not e!700372))))

(assert (=> b!1235214 (= res!823381 (noDuplicate!1854 acc!846))))

(declare-fun b!1235215 () Bool)

(declare-fun res!823379 () Bool)

(assert (=> b!1235215 (=> (not res!823379) (not e!700372))))

(declare-fun contains!7257 (List!27195 (_ BitVec 64)) Bool)

(assert (=> b!1235215 (= res!823379 (not (contains!7257 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235216 () Bool)

(declare-fun res!823380 () Bool)

(assert (=> b!1235216 (=> (not res!823380) (not e!700372))))

(assert (=> b!1235216 (= res!823380 (not (= from!3213 (bvsub (size!38958 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235217 () Bool)

(assert (=> b!1235217 (= e!700373 true)))

(declare-fun lt!560179 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79629 (_ BitVec 32) List!27195) Bool)

(assert (=> b!1235217 (= lt!560179 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560177))))

(declare-fun lt!560178 () Unit!40914)

(declare-fun noDuplicateSubseq!76 (List!27195 List!27195) Unit!40914)

(assert (=> b!1235217 (= lt!560178 (noDuplicateSubseq!76 acc!846 lt!560177))))

(declare-fun b!1235218 () Bool)

(declare-fun res!823377 () Bool)

(assert (=> b!1235218 (=> (not res!823377) (not e!700372))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235218 (= res!823377 (contains!7257 acc!846 k!2925))))

(declare-fun b!1235219 () Bool)

(declare-fun res!823375 () Bool)

(assert (=> b!1235219 (=> res!823375 e!700373)))

(assert (=> b!1235219 (= res!823375 (contains!7257 lt!560177 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235220 () Bool)

(declare-fun res!823378 () Bool)

(assert (=> b!1235220 (=> (not res!823378) (not e!700372))))

(assert (=> b!1235220 (= res!823378 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235221 () Bool)

(declare-fun res!823376 () Bool)

(assert (=> b!1235221 (=> res!823376 e!700373)))

(assert (=> b!1235221 (= res!823376 (contains!7257 lt!560177 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235222 () Bool)

(declare-fun res!823374 () Bool)

(assert (=> b!1235222 (=> (not res!823374) (not e!700372))))

(assert (=> b!1235222 (= res!823374 (not (contains!7257 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102784 res!823382) b!1235214))

(assert (= (and b!1235214 res!823381) b!1235215))

(assert (= (and b!1235215 res!823379) b!1235222))

(assert (= (and b!1235222 res!823374) b!1235220))

(assert (= (and b!1235220 res!823378) b!1235218))

(assert (= (and b!1235218 res!823377) b!1235216))

(assert (= (and b!1235216 res!823380) b!1235211))

(assert (= (and b!1235211 res!823373) b!1235213))

(assert (= (and b!1235213 (not res!823384)) b!1235212))

(assert (= (and b!1235212 (not res!823383)) b!1235219))

(assert (= (and b!1235219 (not res!823375)) b!1235221))

(assert (= (and b!1235221 (not res!823376)) b!1235217))

(declare-fun m!1139103 () Bool)

(assert (=> b!1235220 m!1139103))

(declare-fun m!1139105 () Bool)

(assert (=> b!1235221 m!1139105))

(declare-fun m!1139107 () Bool)

(assert (=> b!1235215 m!1139107))

(declare-fun m!1139109 () Bool)

(assert (=> b!1235213 m!1139109))

(declare-fun m!1139111 () Bool)

(assert (=> b!1235213 m!1139111))

(declare-fun m!1139113 () Bool)

(assert (=> b!1235213 m!1139113))

(declare-fun m!1139115 () Bool)

(assert (=> b!1235213 m!1139115))

(declare-fun m!1139117 () Bool)

(assert (=> b!1235213 m!1139117))

(assert (=> b!1235211 m!1139113))

(assert (=> b!1235211 m!1139113))

(declare-fun m!1139119 () Bool)

(assert (=> b!1235211 m!1139119))

(declare-fun m!1139121 () Bool)

(assert (=> b!1235212 m!1139121))

(declare-fun m!1139123 () Bool)

(assert (=> b!1235218 m!1139123))

(declare-fun m!1139125 () Bool)

(assert (=> b!1235222 m!1139125))

(declare-fun m!1139127 () Bool)

(assert (=> b!1235217 m!1139127))

(declare-fun m!1139129 () Bool)

(assert (=> b!1235217 m!1139129))

(declare-fun m!1139131 () Bool)

(assert (=> start!102784 m!1139131))

(declare-fun m!1139133 () Bool)

(assert (=> b!1235219 m!1139133))

(declare-fun m!1139135 () Bool)

(assert (=> b!1235214 m!1139135))

(push 1)

(assert (not b!1235218))

(assert (not b!1235222))

(assert (not b!1235212))

(assert (not start!102784))

(assert (not b!1235214))

(assert (not b!1235211))

(assert (not b!1235221))

(assert (not b!1235220))

(assert (not b!1235217))

(assert (not b!1235219))

(assert (not b!1235213))

(assert (not b!1235215))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

