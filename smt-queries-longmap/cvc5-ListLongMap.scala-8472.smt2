; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103188 () Bool)

(assert start!103188)

(declare-fun b!1238649 () Bool)

(declare-fun res!826292 () Bool)

(declare-fun e!702030 () Bool)

(assert (=> b!1238649 (=> (not res!826292) (not e!702030))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79823 0))(
  ( (array!79824 (arr!38513 (Array (_ BitVec 32) (_ BitVec 64))) (size!39049 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79823)

(assert (=> b!1238649 (= res!826292 (not (= from!3213 (bvsub (size!39049 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238650 () Bool)

(declare-fun res!826294 () Bool)

(assert (=> b!1238650 (=> (not res!826294) (not e!702030))))

(declare-datatypes ((List!27286 0))(
  ( (Nil!27283) (Cons!27282 (h!28491 (_ BitVec 64)) (t!40749 List!27286)) )
))
(declare-fun acc!846 () List!27286)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7348 (List!27286 (_ BitVec 64)) Bool)

(assert (=> b!1238650 (= res!826294 (contains!7348 acc!846 k!2925))))

(declare-fun b!1238651 () Bool)

(declare-fun res!826291 () Bool)

(assert (=> b!1238651 (=> (not res!826291) (not e!702030))))

(assert (=> b!1238651 (= res!826291 (not (contains!7348 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238652 () Bool)

(declare-datatypes ((Unit!41116 0))(
  ( (Unit!41117) )
))
(declare-fun e!702028 () Unit!41116)

(declare-fun Unit!41118 () Unit!41116)

(assert (=> b!1238652 (= e!702028 Unit!41118)))

(declare-fun b!1238653 () Bool)

(declare-fun res!826295 () Bool)

(assert (=> b!1238653 (=> (not res!826295) (not e!702030))))

(declare-fun noDuplicate!1945 (List!27286) Bool)

(assert (=> b!1238653 (= res!826295 (noDuplicate!1945 acc!846))))

(declare-fun b!1238655 () Bool)

(assert (=> b!1238655 (= e!702030 false)))

(declare-fun lt!561353 () Unit!41116)

(assert (=> b!1238655 (= lt!561353 e!702028)))

(declare-fun c!121039 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238655 (= c!121039 (validKeyInArray!0 (select (arr!38513 a!3835) from!3213)))))

(declare-fun b!1238656 () Bool)

(declare-fun res!826297 () Bool)

(assert (=> b!1238656 (=> (not res!826297) (not e!702030))))

(declare-fun arrayNoDuplicates!0 (array!79823 (_ BitVec 32) List!27286) Bool)

(assert (=> b!1238656 (= res!826297 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238657 () Bool)

(declare-fun lt!561354 () Unit!41116)

(assert (=> b!1238657 (= e!702028 lt!561354)))

(declare-fun lt!561356 () List!27286)

(assert (=> b!1238657 (= lt!561356 (Cons!27282 (select (arr!38513 a!3835) from!3213) acc!846))))

(declare-fun lt!561352 () Unit!41116)

(declare-fun lemmaListSubSeqRefl!0 (List!27286) Unit!41116)

(assert (=> b!1238657 (= lt!561352 (lemmaListSubSeqRefl!0 lt!561356))))

(declare-fun subseq!602 (List!27286 List!27286) Bool)

(assert (=> b!1238657 (subseq!602 lt!561356 lt!561356)))

(declare-fun lt!561355 () Unit!41116)

(declare-fun subseqTail!89 (List!27286 List!27286) Unit!41116)

(assert (=> b!1238657 (= lt!561355 (subseqTail!89 lt!561356 lt!561356))))

(assert (=> b!1238657 (subseq!602 acc!846 lt!561356)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79823 List!27286 List!27286 (_ BitVec 32)) Unit!41116)

(assert (=> b!1238657 (= lt!561354 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561356 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1238657 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238654 () Bool)

(declare-fun res!826296 () Bool)

(assert (=> b!1238654 (=> (not res!826296) (not e!702030))))

(assert (=> b!1238654 (= res!826296 (not (contains!7348 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!826293 () Bool)

(assert (=> start!103188 (=> (not res!826293) (not e!702030))))

(assert (=> start!103188 (= res!826293 (and (bvslt (size!39049 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39049 a!3835))))))

(assert (=> start!103188 e!702030))

(declare-fun array_inv!29361 (array!79823) Bool)

(assert (=> start!103188 (array_inv!29361 a!3835)))

(assert (=> start!103188 true))

(assert (= (and start!103188 res!826293) b!1238653))

(assert (= (and b!1238653 res!826295) b!1238654))

(assert (= (and b!1238654 res!826296) b!1238651))

(assert (= (and b!1238651 res!826291) b!1238656))

(assert (= (and b!1238656 res!826297) b!1238650))

(assert (= (and b!1238650 res!826294) b!1238649))

(assert (= (and b!1238649 res!826292) b!1238655))

(assert (= (and b!1238655 c!121039) b!1238657))

(assert (= (and b!1238655 (not c!121039)) b!1238652))

(declare-fun m!1142155 () Bool)

(assert (=> b!1238651 m!1142155))

(declare-fun m!1142157 () Bool)

(assert (=> b!1238656 m!1142157))

(declare-fun m!1142159 () Bool)

(assert (=> b!1238653 m!1142159))

(declare-fun m!1142161 () Bool)

(assert (=> b!1238655 m!1142161))

(assert (=> b!1238655 m!1142161))

(declare-fun m!1142163 () Bool)

(assert (=> b!1238655 m!1142163))

(declare-fun m!1142165 () Bool)

(assert (=> start!103188 m!1142165))

(declare-fun m!1142167 () Bool)

(assert (=> b!1238654 m!1142167))

(declare-fun m!1142169 () Bool)

(assert (=> b!1238657 m!1142169))

(declare-fun m!1142171 () Bool)

(assert (=> b!1238657 m!1142171))

(declare-fun m!1142173 () Bool)

(assert (=> b!1238657 m!1142173))

(declare-fun m!1142175 () Bool)

(assert (=> b!1238657 m!1142175))

(assert (=> b!1238657 m!1142161))

(declare-fun m!1142177 () Bool)

(assert (=> b!1238657 m!1142177))

(declare-fun m!1142179 () Bool)

(assert (=> b!1238657 m!1142179))

(declare-fun m!1142181 () Bool)

(assert (=> b!1238650 m!1142181))

(push 1)

(assert (not b!1238655))

(assert (not b!1238657))

(assert (not b!1238654))

(assert (not b!1238656))

(assert (not b!1238651))

(assert (not start!103188))

(assert (not b!1238650))

(assert (not b!1238653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

