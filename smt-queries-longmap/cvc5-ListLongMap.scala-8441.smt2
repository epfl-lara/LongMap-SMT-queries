; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102780 () Bool)

(assert start!102780)

(declare-fun b!1235139 () Bool)

(declare-fun res!823306 () Bool)

(declare-fun e!700354 () Bool)

(assert (=> b!1235139 (=> (not res!823306) (not e!700354))))

(declare-datatypes ((List!27193 0))(
  ( (Nil!27190) (Cons!27189 (h!28398 (_ BitVec 64)) (t!40656 List!27193)) )
))
(declare-fun acc!846 () List!27193)

(declare-fun noDuplicate!1852 (List!27193) Bool)

(assert (=> b!1235139 (= res!823306 (noDuplicate!1852 acc!846))))

(declare-fun res!823304 () Bool)

(assert (=> start!102780 (=> (not res!823304) (not e!700354))))

(declare-datatypes ((array!79625 0))(
  ( (array!79626 (arr!38420 (Array (_ BitVec 32) (_ BitVec 64))) (size!38956 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79625)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102780 (= res!823304 (and (bvslt (size!38956 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38956 a!3835))))))

(assert (=> start!102780 e!700354))

(declare-fun array_inv!29268 (array!79625) Bool)

(assert (=> start!102780 (array_inv!29268 a!3835)))

(assert (=> start!102780 true))

(declare-fun b!1235140 () Bool)

(declare-fun e!700356 () Bool)

(assert (=> b!1235140 (= e!700356 true)))

(declare-fun lt!560149 () Bool)

(declare-fun lt!560147 () List!27193)

(declare-fun arrayNoDuplicates!0 (array!79625 (_ BitVec 32) List!27193) Bool)

(assert (=> b!1235140 (= lt!560149 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560147))))

(declare-datatypes ((Unit!40910 0))(
  ( (Unit!40911) )
))
(declare-fun lt!560146 () Unit!40910)

(declare-fun noDuplicateSubseq!74 (List!27193 List!27193) Unit!40910)

(assert (=> b!1235140 (= lt!560146 (noDuplicateSubseq!74 acc!846 lt!560147))))

(declare-fun b!1235141 () Bool)

(declare-fun res!823311 () Bool)

(assert (=> b!1235141 (=> (not res!823311) (not e!700354))))

(assert (=> b!1235141 (= res!823311 (not (= from!3213 (bvsub (size!38956 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235142 () Bool)

(declare-fun res!823302 () Bool)

(assert (=> b!1235142 (=> (not res!823302) (not e!700354))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7255 (List!27193 (_ BitVec 64)) Bool)

(assert (=> b!1235142 (= res!823302 (contains!7255 acc!846 k!2925))))

(declare-fun b!1235143 () Bool)

(declare-fun res!823308 () Bool)

(assert (=> b!1235143 (=> (not res!823308) (not e!700354))))

(assert (=> b!1235143 (= res!823308 (not (contains!7255 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235144 () Bool)

(declare-fun res!823303 () Bool)

(assert (=> b!1235144 (=> res!823303 e!700356)))

(assert (=> b!1235144 (= res!823303 (not (noDuplicate!1852 lt!560147)))))

(declare-fun b!1235145 () Bool)

(declare-fun res!823312 () Bool)

(assert (=> b!1235145 (=> (not res!823312) (not e!700354))))

(assert (=> b!1235145 (= res!823312 (not (contains!7255 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235146 () Bool)

(declare-fun res!823301 () Bool)

(assert (=> b!1235146 (=> (not res!823301) (not e!700354))))

(assert (=> b!1235146 (= res!823301 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235147 () Bool)

(assert (=> b!1235147 (= e!700354 (not e!700356))))

(declare-fun res!823309 () Bool)

(assert (=> b!1235147 (=> res!823309 e!700356)))

(assert (=> b!1235147 (= res!823309 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!527 (List!27193 List!27193) Bool)

(assert (=> b!1235147 (subseq!527 acc!846 lt!560147)))

(declare-fun lt!560148 () Unit!40910)

(declare-fun subseqTail!20 (List!27193 List!27193) Unit!40910)

(assert (=> b!1235147 (= lt!560148 (subseqTail!20 lt!560147 lt!560147))))

(assert (=> b!1235147 (subseq!527 lt!560147 lt!560147)))

(declare-fun lt!560150 () Unit!40910)

(declare-fun lemmaListSubSeqRefl!0 (List!27193) Unit!40910)

(assert (=> b!1235147 (= lt!560150 (lemmaListSubSeqRefl!0 lt!560147))))

(assert (=> b!1235147 (= lt!560147 (Cons!27189 (select (arr!38420 a!3835) from!3213) acc!846))))

(declare-fun b!1235148 () Bool)

(declare-fun res!823305 () Bool)

(assert (=> b!1235148 (=> (not res!823305) (not e!700354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235148 (= res!823305 (validKeyInArray!0 (select (arr!38420 a!3835) from!3213)))))

(declare-fun b!1235149 () Bool)

(declare-fun res!823307 () Bool)

(assert (=> b!1235149 (=> res!823307 e!700356)))

(assert (=> b!1235149 (= res!823307 (contains!7255 lt!560147 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235150 () Bool)

(declare-fun res!823310 () Bool)

(assert (=> b!1235150 (=> res!823310 e!700356)))

(assert (=> b!1235150 (= res!823310 (contains!7255 lt!560147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102780 res!823304) b!1235139))

(assert (= (and b!1235139 res!823306) b!1235145))

(assert (= (and b!1235145 res!823312) b!1235143))

(assert (= (and b!1235143 res!823308) b!1235146))

(assert (= (and b!1235146 res!823301) b!1235142))

(assert (= (and b!1235142 res!823302) b!1235141))

(assert (= (and b!1235141 res!823311) b!1235148))

(assert (= (and b!1235148 res!823305) b!1235147))

(assert (= (and b!1235147 (not res!823309)) b!1235144))

(assert (= (and b!1235144 (not res!823303)) b!1235150))

(assert (= (and b!1235150 (not res!823310)) b!1235149))

(assert (= (and b!1235149 (not res!823307)) b!1235140))

(declare-fun m!1139035 () Bool)

(assert (=> b!1235150 m!1139035))

(declare-fun m!1139037 () Bool)

(assert (=> b!1235145 m!1139037))

(declare-fun m!1139039 () Bool)

(assert (=> b!1235142 m!1139039))

(declare-fun m!1139041 () Bool)

(assert (=> b!1235143 m!1139041))

(declare-fun m!1139043 () Bool)

(assert (=> b!1235149 m!1139043))

(declare-fun m!1139045 () Bool)

(assert (=> start!102780 m!1139045))

(declare-fun m!1139047 () Bool)

(assert (=> b!1235147 m!1139047))

(declare-fun m!1139049 () Bool)

(assert (=> b!1235147 m!1139049))

(declare-fun m!1139051 () Bool)

(assert (=> b!1235147 m!1139051))

(declare-fun m!1139053 () Bool)

(assert (=> b!1235147 m!1139053))

(declare-fun m!1139055 () Bool)

(assert (=> b!1235147 m!1139055))

(assert (=> b!1235148 m!1139051))

(assert (=> b!1235148 m!1139051))

(declare-fun m!1139057 () Bool)

(assert (=> b!1235148 m!1139057))

(declare-fun m!1139059 () Bool)

(assert (=> b!1235146 m!1139059))

(declare-fun m!1139061 () Bool)

(assert (=> b!1235139 m!1139061))

(declare-fun m!1139063 () Bool)

(assert (=> b!1235140 m!1139063))

(declare-fun m!1139065 () Bool)

(assert (=> b!1235140 m!1139065))

(declare-fun m!1139067 () Bool)

(assert (=> b!1235144 m!1139067))

(push 1)

(assert (not b!1235140))

(assert (not b!1235143))

(assert (not b!1235145))

(assert (not start!102780))

(assert (not b!1235148))

(assert (not b!1235150))

(assert (not b!1235147))

(assert (not b!1235146))

(assert (not b!1235149))

(assert (not b!1235142))

(assert (not b!1235139))

(assert (not b!1235144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

