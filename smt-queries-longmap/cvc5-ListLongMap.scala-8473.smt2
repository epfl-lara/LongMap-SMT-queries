; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103194 () Bool)

(assert start!103194)

(declare-fun b!1238731 () Bool)

(declare-fun res!826356 () Bool)

(declare-fun e!702057 () Bool)

(assert (=> b!1238731 (=> (not res!826356) (not e!702057))))

(declare-datatypes ((List!27289 0))(
  ( (Nil!27286) (Cons!27285 (h!28494 (_ BitVec 64)) (t!40752 List!27289)) )
))
(declare-fun acc!846 () List!27289)

(declare-fun contains!7351 (List!27289 (_ BitVec 64)) Bool)

(assert (=> b!1238731 (= res!826356 (not (contains!7351 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238732 () Bool)

(declare-datatypes ((Unit!41125 0))(
  ( (Unit!41126) )
))
(declare-fun e!702055 () Unit!41125)

(declare-fun lt!561398 () Unit!41125)

(assert (=> b!1238732 (= e!702055 lt!561398)))

(declare-datatypes ((array!79829 0))(
  ( (array!79830 (arr!38516 (Array (_ BitVec 32) (_ BitVec 64))) (size!39052 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79829)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!561400 () List!27289)

(assert (=> b!1238732 (= lt!561400 (Cons!27285 (select (arr!38516 a!3835) from!3213) acc!846))))

(declare-fun lt!561397 () Unit!41125)

(declare-fun lemmaListSubSeqRefl!0 (List!27289) Unit!41125)

(assert (=> b!1238732 (= lt!561397 (lemmaListSubSeqRefl!0 lt!561400))))

(declare-fun subseq!605 (List!27289 List!27289) Bool)

(assert (=> b!1238732 (subseq!605 lt!561400 lt!561400)))

(declare-fun lt!561401 () Unit!41125)

(declare-fun subseqTail!92 (List!27289 List!27289) Unit!41125)

(assert (=> b!1238732 (= lt!561401 (subseqTail!92 lt!561400 lt!561400))))

(assert (=> b!1238732 (subseq!605 acc!846 lt!561400)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79829 List!27289 List!27289 (_ BitVec 32)) Unit!41125)

(assert (=> b!1238732 (= lt!561398 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561400 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79829 (_ BitVec 32) List!27289) Bool)

(assert (=> b!1238732 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238733 () Bool)

(declare-fun res!826357 () Bool)

(assert (=> b!1238733 (=> (not res!826357) (not e!702057))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238733 (= res!826357 (contains!7351 acc!846 k!2925))))

(declare-fun b!1238734 () Bool)

(declare-fun res!826355 () Bool)

(assert (=> b!1238734 (=> (not res!826355) (not e!702057))))

(assert (=> b!1238734 (= res!826355 (not (= from!3213 (bvsub (size!39052 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238735 () Bool)

(declare-fun Unit!41127 () Unit!41125)

(assert (=> b!1238735 (= e!702055 Unit!41127)))

(declare-fun b!1238736 () Bool)

(declare-fun res!826360 () Bool)

(assert (=> b!1238736 (=> (not res!826360) (not e!702057))))

(assert (=> b!1238736 (= res!826360 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!826359 () Bool)

(assert (=> start!103194 (=> (not res!826359) (not e!702057))))

(assert (=> start!103194 (= res!826359 (and (bvslt (size!39052 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39052 a!3835))))))

(assert (=> start!103194 e!702057))

(declare-fun array_inv!29364 (array!79829) Bool)

(assert (=> start!103194 (array_inv!29364 a!3835)))

(assert (=> start!103194 true))

(declare-fun b!1238730 () Bool)

(declare-fun res!826358 () Bool)

(assert (=> b!1238730 (=> (not res!826358) (not e!702057))))

(declare-fun noDuplicate!1948 (List!27289) Bool)

(assert (=> b!1238730 (= res!826358 (noDuplicate!1948 acc!846))))

(declare-fun b!1238737 () Bool)

(declare-fun res!826354 () Bool)

(assert (=> b!1238737 (=> (not res!826354) (not e!702057))))

(assert (=> b!1238737 (= res!826354 (not (contains!7351 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238738 () Bool)

(assert (=> b!1238738 (= e!702057 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!561399 () Unit!41125)

(assert (=> b!1238738 (= lt!561399 e!702055)))

(declare-fun c!121048 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238738 (= c!121048 (validKeyInArray!0 (select (arr!38516 a!3835) from!3213)))))

(assert (= (and start!103194 res!826359) b!1238730))

(assert (= (and b!1238730 res!826358) b!1238731))

(assert (= (and b!1238731 res!826356) b!1238737))

(assert (= (and b!1238737 res!826354) b!1238736))

(assert (= (and b!1238736 res!826360) b!1238733))

(assert (= (and b!1238733 res!826357) b!1238734))

(assert (= (and b!1238734 res!826355) b!1238738))

(assert (= (and b!1238738 c!121048) b!1238732))

(assert (= (and b!1238738 (not c!121048)) b!1238735))

(declare-fun m!1142239 () Bool)

(assert (=> b!1238732 m!1142239))

(declare-fun m!1142241 () Bool)

(assert (=> b!1238732 m!1142241))

(declare-fun m!1142243 () Bool)

(assert (=> b!1238732 m!1142243))

(declare-fun m!1142245 () Bool)

(assert (=> b!1238732 m!1142245))

(declare-fun m!1142247 () Bool)

(assert (=> b!1238732 m!1142247))

(declare-fun m!1142249 () Bool)

(assert (=> b!1238732 m!1142249))

(declare-fun m!1142251 () Bool)

(assert (=> b!1238732 m!1142251))

(declare-fun m!1142253 () Bool)

(assert (=> b!1238733 m!1142253))

(declare-fun m!1142255 () Bool)

(assert (=> b!1238737 m!1142255))

(declare-fun m!1142257 () Bool)

(assert (=> start!103194 m!1142257))

(declare-fun m!1142259 () Bool)

(assert (=> b!1238730 m!1142259))

(assert (=> b!1238738 m!1142251))

(assert (=> b!1238738 m!1142251))

(declare-fun m!1142261 () Bool)

(assert (=> b!1238738 m!1142261))

(declare-fun m!1142263 () Bool)

(assert (=> b!1238736 m!1142263))

(declare-fun m!1142265 () Bool)

(assert (=> b!1238731 m!1142265))

(push 1)

