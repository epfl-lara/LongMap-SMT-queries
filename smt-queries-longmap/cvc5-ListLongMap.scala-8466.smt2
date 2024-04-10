; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103002 () Bool)

(assert start!103002)

(declare-fun b!1237411 () Bool)

(declare-fun res!825285 () Bool)

(declare-fun e!701298 () Bool)

(assert (=> b!1237411 (=> (not res!825285) (not e!701298))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79778 0))(
  ( (array!79779 (arr!38495 (Array (_ BitVec 32) (_ BitVec 64))) (size!39031 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79778)

(assert (=> b!1237411 (= res!825285 (not (= from!3213 (bvsub (size!39031 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237412 () Bool)

(declare-fun res!825280 () Bool)

(assert (=> b!1237412 (=> (not res!825280) (not e!701298))))

(declare-datatypes ((List!27268 0))(
  ( (Nil!27265) (Cons!27264 (h!28473 (_ BitVec 64)) (t!40731 List!27268)) )
))
(declare-fun acc!846 () List!27268)

(declare-fun arrayNoDuplicates!0 (array!79778 (_ BitVec 32) List!27268) Bool)

(assert (=> b!1237412 (= res!825280 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!825284 () Bool)

(assert (=> start!103002 (=> (not res!825284) (not e!701298))))

(assert (=> start!103002 (= res!825284 (and (bvslt (size!39031 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39031 a!3835))))))

(assert (=> start!103002 e!701298))

(declare-fun array_inv!29343 (array!79778) Bool)

(assert (=> start!103002 (array_inv!29343 a!3835)))

(assert (=> start!103002 true))

(declare-fun b!1237413 () Bool)

(declare-fun res!825282 () Bool)

(assert (=> b!1237413 (=> (not res!825282) (not e!701298))))

(declare-fun contains!7330 (List!27268 (_ BitVec 64)) Bool)

(assert (=> b!1237413 (= res!825282 (not (contains!7330 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237414 () Bool)

(declare-fun res!825281 () Bool)

(assert (=> b!1237414 (=> (not res!825281) (not e!701298))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1237414 (= res!825281 (contains!7330 acc!846 k!2925))))

(declare-fun b!1237415 () Bool)

(assert (=> b!1237415 (= e!701298 (not true))))

(declare-fun lt!561040 () List!27268)

(declare-fun subseq!584 (List!27268 List!27268) Bool)

(assert (=> b!1237415 (subseq!584 acc!846 lt!561040)))

(declare-datatypes ((Unit!41066 0))(
  ( (Unit!41067) )
))
(declare-fun lt!561041 () Unit!41066)

(declare-fun subseqTail!71 (List!27268 List!27268) Unit!41066)

(assert (=> b!1237415 (= lt!561041 (subseqTail!71 lt!561040 lt!561040))))

(assert (=> b!1237415 (subseq!584 lt!561040 lt!561040)))

(declare-fun lt!561039 () Unit!41066)

(declare-fun lemmaListSubSeqRefl!0 (List!27268) Unit!41066)

(assert (=> b!1237415 (= lt!561039 (lemmaListSubSeqRefl!0 lt!561040))))

(assert (=> b!1237415 (= lt!561040 (Cons!27264 (select (arr!38495 a!3835) from!3213) acc!846))))

(declare-fun b!1237416 () Bool)

(declare-fun res!825283 () Bool)

(assert (=> b!1237416 (=> (not res!825283) (not e!701298))))

(declare-fun noDuplicate!1927 (List!27268) Bool)

(assert (=> b!1237416 (= res!825283 (noDuplicate!1927 acc!846))))

(declare-fun b!1237417 () Bool)

(declare-fun res!825286 () Bool)

(assert (=> b!1237417 (=> (not res!825286) (not e!701298))))

(assert (=> b!1237417 (= res!825286 (not (contains!7330 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237418 () Bool)

(declare-fun res!825279 () Bool)

(assert (=> b!1237418 (=> (not res!825279) (not e!701298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237418 (= res!825279 (validKeyInArray!0 (select (arr!38495 a!3835) from!3213)))))

(assert (= (and start!103002 res!825284) b!1237416))

(assert (= (and b!1237416 res!825283) b!1237417))

(assert (= (and b!1237417 res!825286) b!1237413))

(assert (= (and b!1237413 res!825282) b!1237412))

(assert (= (and b!1237412 res!825280) b!1237414))

(assert (= (and b!1237414 res!825281) b!1237411))

(assert (= (and b!1237411 res!825285) b!1237418))

(assert (= (and b!1237418 res!825279) b!1237415))

(declare-fun m!1141129 () Bool)

(assert (=> start!103002 m!1141129))

(declare-fun m!1141131 () Bool)

(assert (=> b!1237416 m!1141131))

(declare-fun m!1141133 () Bool)

(assert (=> b!1237413 m!1141133))

(declare-fun m!1141135 () Bool)

(assert (=> b!1237412 m!1141135))

(declare-fun m!1141137 () Bool)

(assert (=> b!1237415 m!1141137))

(declare-fun m!1141139 () Bool)

(assert (=> b!1237415 m!1141139))

(declare-fun m!1141141 () Bool)

(assert (=> b!1237415 m!1141141))

(declare-fun m!1141143 () Bool)

(assert (=> b!1237415 m!1141143))

(declare-fun m!1141145 () Bool)

(assert (=> b!1237415 m!1141145))

(declare-fun m!1141147 () Bool)

(assert (=> b!1237417 m!1141147))

(declare-fun m!1141149 () Bool)

(assert (=> b!1237414 m!1141149))

(assert (=> b!1237418 m!1141145))

(assert (=> b!1237418 m!1141145))

(declare-fun m!1141151 () Bool)

(assert (=> b!1237418 m!1141151))

(push 1)

(assert (not b!1237417))

(assert (not b!1237416))

(assert (not start!103002))

(assert (not b!1237418))

(assert (not b!1237412))

(assert (not b!1237415))

(assert (not b!1237414))

(assert (not b!1237413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

