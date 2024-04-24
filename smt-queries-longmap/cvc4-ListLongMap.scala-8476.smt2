; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103452 () Bool)

(assert start!103452)

(declare-fun b!1240324 () Bool)

(declare-fun res!827100 () Bool)

(declare-fun e!703008 () Bool)

(assert (=> b!1240324 (=> (not res!827100) (not e!703008))))

(declare-datatypes ((List!27324 0))(
  ( (Nil!27321) (Cons!27320 (h!28538 (_ BitVec 64)) (t!40779 List!27324)) )
))
(declare-fun acc!846 () List!27324)

(declare-fun contains!7395 (List!27324 (_ BitVec 64)) Bool)

(assert (=> b!1240324 (= res!827100 (not (contains!7395 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240325 () Bool)

(declare-fun res!827097 () Bool)

(assert (=> b!1240325 (=> (not res!827097) (not e!703008))))

(assert (=> b!1240325 (= res!827097 (not (contains!7395 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240326 () Bool)

(declare-datatypes ((Unit!41128 0))(
  ( (Unit!41129) )
))
(declare-fun e!703010 () Unit!41128)

(declare-fun Unit!41130 () Unit!41128)

(assert (=> b!1240326 (= e!703010 Unit!41130)))

(declare-fun b!1240327 () Bool)

(declare-fun res!827103 () Bool)

(assert (=> b!1240327 (=> (not res!827103) (not e!703008))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79885 0))(
  ( (array!79886 (arr!38538 (Array (_ BitVec 32) (_ BitVec 64))) (size!39075 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79885)

(assert (=> b!1240327 (= res!827103 (not (= from!3213 (bvsub (size!39075 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!827099 () Bool)

(assert (=> start!103452 (=> (not res!827099) (not e!703008))))

(assert (=> start!103452 (= res!827099 (and (bvslt (size!39075 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39075 a!3835))))))

(assert (=> start!103452 e!703008))

(declare-fun array_inv!29476 (array!79885) Bool)

(assert (=> start!103452 (array_inv!29476 a!3835)))

(assert (=> start!103452 true))

(declare-fun b!1240328 () Bool)

(declare-fun res!827098 () Bool)

(assert (=> b!1240328 (=> (not res!827098) (not e!703008))))

(declare-fun arrayNoDuplicates!0 (array!79885 (_ BitVec 32) List!27324) Bool)

(assert (=> b!1240328 (= res!827098 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1240329 () Bool)

(declare-fun res!827101 () Bool)

(assert (=> b!1240329 (=> (not res!827101) (not e!703008))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1240329 (= res!827101 (contains!7395 acc!846 k!2925))))

(declare-fun b!1240330 () Bool)

(assert (=> b!1240330 (= e!703008 false)))

(declare-fun lt!562036 () Unit!41128)

(assert (=> b!1240330 (= lt!562036 e!703010)))

(declare-fun c!121481 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1240330 (= c!121481 (validKeyInArray!0 (select (arr!38538 a!3835) from!3213)))))

(declare-fun b!1240331 () Bool)

(declare-fun lt!562035 () Unit!41128)

(assert (=> b!1240331 (= e!703010 lt!562035)))

(declare-fun lt!562037 () List!27324)

(assert (=> b!1240331 (= lt!562037 (Cons!27320 (select (arr!38538 a!3835) from!3213) acc!846))))

(declare-fun lt!562034 () Unit!41128)

(declare-fun lemmaListSubSeqRefl!0 (List!27324) Unit!41128)

(assert (=> b!1240331 (= lt!562034 (lemmaListSubSeqRefl!0 lt!562037))))

(declare-fun subseq!615 (List!27324 List!27324) Bool)

(assert (=> b!1240331 (subseq!615 lt!562037 lt!562037)))

(declare-fun lt!562033 () Unit!41128)

(declare-fun subseqTail!102 (List!27324 List!27324) Unit!41128)

(assert (=> b!1240331 (= lt!562033 (subseqTail!102 lt!562037 lt!562037))))

(assert (=> b!1240331 (subseq!615 acc!846 lt!562037)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79885 List!27324 List!27324 (_ BitVec 32)) Unit!41128)

(assert (=> b!1240331 (= lt!562035 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!562037 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1240331 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1240332 () Bool)

(declare-fun res!827102 () Bool)

(assert (=> b!1240332 (=> (not res!827102) (not e!703008))))

(declare-fun noDuplicate!1976 (List!27324) Bool)

(assert (=> b!1240332 (= res!827102 (noDuplicate!1976 acc!846))))

(assert (= (and start!103452 res!827099) b!1240332))

(assert (= (and b!1240332 res!827102) b!1240325))

(assert (= (and b!1240325 res!827097) b!1240324))

(assert (= (and b!1240324 res!827100) b!1240328))

(assert (= (and b!1240328 res!827098) b!1240329))

(assert (= (and b!1240329 res!827101) b!1240327))

(assert (= (and b!1240327 res!827103) b!1240330))

(assert (= (and b!1240330 c!121481) b!1240331))

(assert (= (and b!1240330 (not c!121481)) b!1240326))

(declare-fun m!1144167 () Bool)

(assert (=> b!1240325 m!1144167))

(declare-fun m!1144169 () Bool)

(assert (=> b!1240331 m!1144169))

(declare-fun m!1144171 () Bool)

(assert (=> b!1240331 m!1144171))

(declare-fun m!1144173 () Bool)

(assert (=> b!1240331 m!1144173))

(declare-fun m!1144175 () Bool)

(assert (=> b!1240331 m!1144175))

(declare-fun m!1144177 () Bool)

(assert (=> b!1240331 m!1144177))

(declare-fun m!1144179 () Bool)

(assert (=> b!1240331 m!1144179))

(declare-fun m!1144181 () Bool)

(assert (=> b!1240331 m!1144181))

(declare-fun m!1144183 () Bool)

(assert (=> b!1240328 m!1144183))

(assert (=> b!1240330 m!1144177))

(assert (=> b!1240330 m!1144177))

(declare-fun m!1144185 () Bool)

(assert (=> b!1240330 m!1144185))

(declare-fun m!1144187 () Bool)

(assert (=> b!1240329 m!1144187))

(declare-fun m!1144189 () Bool)

(assert (=> b!1240324 m!1144189))

(declare-fun m!1144191 () Bool)

(assert (=> b!1240332 m!1144191))

(declare-fun m!1144193 () Bool)

(assert (=> start!103452 m!1144193))

(push 1)

(assert (not b!1240329))

(assert (not b!1240332))

(assert (not b!1240330))

(assert (not b!1240331))

(assert (not b!1240325))

(assert (not start!103452))

(assert (not b!1240324))

(assert (not b!1240328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

