; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60038 () Bool)

(assert start!60038)

(declare-fun b!668003 () Bool)

(declare-datatypes ((Unit!23400 0))(
  ( (Unit!23401) )
))
(declare-fun e!382272 () Unit!23400)

(declare-fun Unit!23402 () Unit!23400)

(assert (=> b!668003 (= e!382272 Unit!23402)))

(declare-fun b!668004 () Bool)

(declare-fun res!435125 () Bool)

(declare-fun e!382270 () Bool)

(assert (=> b!668004 (=> res!435125 e!382270)))

(declare-datatypes ((List!12776 0))(
  ( (Nil!12773) (Cons!12772 (h!13817 (_ BitVec 64)) (t!19004 List!12776)) )
))
(declare-fun lt!311051 () List!12776)

(declare-fun contains!3353 (List!12776 (_ BitVec 64)) Bool)

(assert (=> b!668004 (= res!435125 (contains!3353 lt!311051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668005 () Bool)

(declare-fun e!382275 () Unit!23400)

(declare-fun Unit!23403 () Unit!23400)

(assert (=> b!668005 (= e!382275 Unit!23403)))

(declare-fun lt!311049 () Unit!23400)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39085 0))(
  ( (array!39086 (arr!18735 (Array (_ BitVec 32) (_ BitVec 64))) (size!19099 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39085 (_ BitVec 64) (_ BitVec 32)) Unit!23400)

(assert (=> b!668005 (= lt!311049 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668005 false))

(declare-fun b!668006 () Bool)

(declare-fun res!435134 () Bool)

(assert (=> b!668006 (=> res!435134 e!382270)))

(declare-fun noDuplicate!600 (List!12776) Bool)

(assert (=> b!668006 (= res!435134 (not (noDuplicate!600 lt!311051)))))

(declare-fun b!668007 () Bool)

(declare-fun e!382268 () Bool)

(assert (=> b!668007 (= e!382268 (not e!382270))))

(declare-fun res!435139 () Bool)

(assert (=> b!668007 (=> res!435139 e!382270)))

(assert (=> b!668007 (= res!435139 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39085 (_ BitVec 32) List!12776) Bool)

(assert (=> b!668007 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311051)))

(declare-fun lt!311052 () Unit!23400)

(declare-fun acc!681 () List!12776)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39085 (_ BitVec 64) (_ BitVec 32) List!12776 List!12776) Unit!23400)

(assert (=> b!668007 (= lt!311052 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311051))))

(declare-fun -!90 (List!12776 (_ BitVec 64)) List!12776)

(assert (=> b!668007 (= (-!90 lt!311051 k!2843) acc!681)))

(declare-fun $colon$colon!224 (List!12776 (_ BitVec 64)) List!12776)

(assert (=> b!668007 (= lt!311051 ($colon$colon!224 acc!681 k!2843))))

(declare-fun lt!311048 () Unit!23400)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12776) Unit!23400)

(assert (=> b!668007 (= lt!311048 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!92 (List!12776 List!12776) Bool)

(assert (=> b!668007 (subseq!92 acc!681 acc!681)))

(declare-fun lt!311046 () Unit!23400)

(declare-fun lemmaListSubSeqRefl!0 (List!12776) Unit!23400)

(assert (=> b!668007 (= lt!311046 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668007 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311047 () Unit!23400)

(assert (=> b!668007 (= lt!311047 e!382272)))

(declare-fun c!76807 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668007 (= c!76807 (validKeyInArray!0 (select (arr!18735 a!3626) from!3004)))))

(declare-fun lt!311053 () Unit!23400)

(assert (=> b!668007 (= lt!311053 e!382275)))

(declare-fun c!76808 () Bool)

(declare-fun arrayContainsKey!0 (array!39085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668007 (= c!76808 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668007 (arrayContainsKey!0 (array!39086 (store (arr!18735 a!3626) i!1382 k!2843) (size!19099 a!3626)) k!2843 from!3004)))

(declare-fun b!668008 () Bool)

(declare-fun res!435124 () Bool)

(assert (=> b!668008 (=> (not res!435124) (not e!382268))))

(assert (=> b!668008 (= res!435124 (not (contains!3353 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668009 () Bool)

(declare-fun res!435129 () Bool)

(assert (=> b!668009 (=> (not res!435129) (not e!382268))))

(assert (=> b!668009 (= res!435129 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12773))))

(declare-fun b!668010 () Bool)

(declare-fun res!435130 () Bool)

(assert (=> b!668010 (=> (not res!435130) (not e!382268))))

(declare-fun e!382269 () Bool)

(assert (=> b!668010 (= res!435130 e!382269)))

(declare-fun res!435123 () Bool)

(assert (=> b!668010 (=> res!435123 e!382269)))

(declare-fun e!382265 () Bool)

(assert (=> b!668010 (= res!435123 e!382265)))

(declare-fun res!435138 () Bool)

(assert (=> b!668010 (=> (not res!435138) (not e!382265))))

(assert (=> b!668010 (= res!435138 (bvsgt from!3004 i!1382))))

(declare-fun b!668012 () Bool)

(declare-fun res!435142 () Bool)

(assert (=> b!668012 (=> (not res!435142) (not e!382268))))

(assert (=> b!668012 (= res!435142 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19099 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668013 () Bool)

(declare-fun e!382274 () Bool)

(assert (=> b!668013 (= e!382274 (not (contains!3353 acc!681 k!2843)))))

(declare-fun b!668014 () Bool)

(declare-fun e!382267 () Bool)

(declare-fun e!382273 () Bool)

(assert (=> b!668014 (= e!382267 e!382273)))

(declare-fun res!435127 () Bool)

(assert (=> b!668014 (=> (not res!435127) (not e!382273))))

(assert (=> b!668014 (= res!435127 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668015 () Bool)

(declare-fun lt!311044 () Unit!23400)

(assert (=> b!668015 (= e!382272 lt!311044)))

(declare-fun lt!311050 () Unit!23400)

(assert (=> b!668015 (= lt!311050 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668015 (subseq!92 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39085 List!12776 List!12776 (_ BitVec 32)) Unit!23400)

(assert (=> b!668015 (= lt!311044 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!224 acc!681 (select (arr!18735 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668015 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668016 () Bool)

(assert (=> b!668016 (= e!382269 e!382274)))

(declare-fun res!435133 () Bool)

(assert (=> b!668016 (=> (not res!435133) (not e!382274))))

(assert (=> b!668016 (= res!435133 (bvsle from!3004 i!1382))))

(declare-fun b!668017 () Bool)

(declare-fun res!435140 () Bool)

(assert (=> b!668017 (=> (not res!435140) (not e!382268))))

(assert (=> b!668017 (= res!435140 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19099 a!3626))))))

(declare-fun b!668018 () Bool)

(assert (=> b!668018 (= e!382265 (contains!3353 acc!681 k!2843))))

(declare-fun b!668019 () Bool)

(declare-fun res!435132 () Bool)

(assert (=> b!668019 (=> (not res!435132) (not e!382268))))

(assert (=> b!668019 (= res!435132 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668020 () Bool)

(declare-fun res!435126 () Bool)

(assert (=> b!668020 (=> (not res!435126) (not e!382268))))

(assert (=> b!668020 (= res!435126 (validKeyInArray!0 k!2843))))

(declare-fun b!668021 () Bool)

(declare-fun Unit!23404 () Unit!23400)

(assert (=> b!668021 (= e!382275 Unit!23404)))

(declare-fun b!668022 () Bool)

(assert (=> b!668022 (= e!382270 true)))

(declare-fun lt!311045 () Bool)

(assert (=> b!668022 (= lt!311045 e!382267)))

(declare-fun res!435128 () Bool)

(assert (=> b!668022 (=> res!435128 e!382267)))

(declare-fun e!382266 () Bool)

(assert (=> b!668022 (= res!435128 e!382266)))

(declare-fun res!435141 () Bool)

(assert (=> b!668022 (=> (not res!435141) (not e!382266))))

(assert (=> b!668022 (= res!435141 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668011 () Bool)

(declare-fun res!435131 () Bool)

(assert (=> b!668011 (=> (not res!435131) (not e!382268))))

(assert (=> b!668011 (= res!435131 (noDuplicate!600 acc!681))))

(declare-fun res!435137 () Bool)

(assert (=> start!60038 (=> (not res!435137) (not e!382268))))

(assert (=> start!60038 (= res!435137 (and (bvslt (size!19099 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19099 a!3626))))))

(assert (=> start!60038 e!382268))

(assert (=> start!60038 true))

(declare-fun array_inv!14531 (array!39085) Bool)

(assert (=> start!60038 (array_inv!14531 a!3626)))

(declare-fun b!668023 () Bool)

(declare-fun res!435135 () Bool)

(assert (=> b!668023 (=> (not res!435135) (not e!382268))))

(assert (=> b!668023 (= res!435135 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668024 () Bool)

(declare-fun res!435143 () Bool)

(assert (=> b!668024 (=> (not res!435143) (not e!382268))))

(assert (=> b!668024 (= res!435143 (not (contains!3353 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668025 () Bool)

(assert (=> b!668025 (= e!382266 (contains!3353 lt!311051 k!2843))))

(declare-fun b!668026 () Bool)

(assert (=> b!668026 (= e!382273 (not (contains!3353 lt!311051 k!2843)))))

(declare-fun b!668027 () Bool)

(declare-fun res!435136 () Bool)

(assert (=> b!668027 (=> res!435136 e!382270)))

(assert (=> b!668027 (= res!435136 (contains!3353 lt!311051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!60038 res!435137) b!668011))

(assert (= (and b!668011 res!435131) b!668024))

(assert (= (and b!668024 res!435143) b!668008))

(assert (= (and b!668008 res!435124) b!668010))

(assert (= (and b!668010 res!435138) b!668018))

(assert (= (and b!668010 (not res!435123)) b!668016))

(assert (= (and b!668016 res!435133) b!668013))

(assert (= (and b!668010 res!435130) b!668009))

(assert (= (and b!668009 res!435129) b!668019))

(assert (= (and b!668019 res!435132) b!668017))

(assert (= (and b!668017 res!435140) b!668020))

(assert (= (and b!668020 res!435126) b!668023))

(assert (= (and b!668023 res!435135) b!668012))

(assert (= (and b!668012 res!435142) b!668007))

(assert (= (and b!668007 c!76808) b!668005))

(assert (= (and b!668007 (not c!76808)) b!668021))

(assert (= (and b!668007 c!76807) b!668015))

(assert (= (and b!668007 (not c!76807)) b!668003))

(assert (= (and b!668007 (not res!435139)) b!668006))

(assert (= (and b!668006 (not res!435134)) b!668027))

(assert (= (and b!668027 (not res!435136)) b!668004))

(assert (= (and b!668004 (not res!435125)) b!668022))

(assert (= (and b!668022 res!435141) b!668025))

(assert (= (and b!668022 (not res!435128)) b!668014))

(assert (= (and b!668014 res!435127) b!668026))

(declare-fun m!638423 () Bool)

(assert (=> start!60038 m!638423))

(declare-fun m!638425 () Bool)

(assert (=> b!668006 m!638425))

(declare-fun m!638427 () Bool)

(assert (=> b!668015 m!638427))

(declare-fun m!638429 () Bool)

(assert (=> b!668015 m!638429))

(declare-fun m!638431 () Bool)

(assert (=> b!668015 m!638431))

(declare-fun m!638433 () Bool)

(assert (=> b!668015 m!638433))

(assert (=> b!668015 m!638429))

(assert (=> b!668015 m!638431))

(declare-fun m!638435 () Bool)

(assert (=> b!668015 m!638435))

(declare-fun m!638437 () Bool)

(assert (=> b!668015 m!638437))

(declare-fun m!638439 () Bool)

(assert (=> b!668023 m!638439))

(declare-fun m!638441 () Bool)

(assert (=> b!668011 m!638441))

(declare-fun m!638443 () Bool)

(assert (=> b!668009 m!638443))

(declare-fun m!638445 () Bool)

(assert (=> b!668026 m!638445))

(declare-fun m!638447 () Bool)

(assert (=> b!668008 m!638447))

(declare-fun m!638449 () Bool)

(assert (=> b!668005 m!638449))

(declare-fun m!638451 () Bool)

(assert (=> b!668007 m!638451))

(assert (=> b!668007 m!638427))

(assert (=> b!668007 m!638429))

(declare-fun m!638453 () Bool)

(assert (=> b!668007 m!638453))

(declare-fun m!638455 () Bool)

(assert (=> b!668007 m!638455))

(assert (=> b!668007 m!638435))

(declare-fun m!638457 () Bool)

(assert (=> b!668007 m!638457))

(declare-fun m!638459 () Bool)

(assert (=> b!668007 m!638459))

(assert (=> b!668007 m!638429))

(declare-fun m!638461 () Bool)

(assert (=> b!668007 m!638461))

(declare-fun m!638463 () Bool)

(assert (=> b!668007 m!638463))

(declare-fun m!638465 () Bool)

(assert (=> b!668007 m!638465))

(declare-fun m!638467 () Bool)

(assert (=> b!668007 m!638467))

(assert (=> b!668007 m!638437))

(declare-fun m!638469 () Bool)

(assert (=> b!668027 m!638469))

(declare-fun m!638471 () Bool)

(assert (=> b!668020 m!638471))

(declare-fun m!638473 () Bool)

(assert (=> b!668018 m!638473))

(declare-fun m!638475 () Bool)

(assert (=> b!668024 m!638475))

(assert (=> b!668013 m!638473))

(declare-fun m!638477 () Bool)

(assert (=> b!668019 m!638477))

(assert (=> b!668025 m!638445))

(declare-fun m!638479 () Bool)

(assert (=> b!668004 m!638479))

(push 1)

(assert (not b!668023))

(assert (not start!60038))

(assert (not b!668020))

(assert (not b!668024))

(assert (not b!668013))

(assert (not b!668015))

(assert (not b!668004))

(assert (not b!668006))

(assert (not b!668009))

(assert (not b!668005))

(assert (not b!668019))

(assert (not b!668018))

(assert (not b!668007))

(assert (not b!668025))

(assert (not b!668026))

(assert (not b!668027))

(assert (not b!668008))

(assert (not b!668011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

