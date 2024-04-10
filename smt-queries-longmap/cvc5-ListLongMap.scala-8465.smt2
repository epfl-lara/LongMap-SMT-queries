; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102996 () Bool)

(assert start!102996)

(declare-fun b!1237339 () Bool)

(declare-fun res!825214 () Bool)

(declare-fun e!701279 () Bool)

(assert (=> b!1237339 (=> (not res!825214) (not e!701279))))

(declare-datatypes ((List!27265 0))(
  ( (Nil!27262) (Cons!27261 (h!28470 (_ BitVec 64)) (t!40728 List!27265)) )
))
(declare-fun acc!846 () List!27265)

(declare-fun noDuplicate!1924 (List!27265) Bool)

(assert (=> b!1237339 (= res!825214 (noDuplicate!1924 acc!846))))

(declare-fun b!1237340 () Bool)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1237340 (= e!701279 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000)))))

(declare-fun lt!561012 () List!27265)

(declare-fun subseq!581 (List!27265 List!27265) Bool)

(assert (=> b!1237340 (subseq!581 acc!846 lt!561012)))

(declare-datatypes ((Unit!41060 0))(
  ( (Unit!41061) )
))
(declare-fun lt!561014 () Unit!41060)

(declare-fun subseqTail!68 (List!27265 List!27265) Unit!41060)

(assert (=> b!1237340 (= lt!561014 (subseqTail!68 lt!561012 lt!561012))))

(assert (=> b!1237340 (subseq!581 lt!561012 lt!561012)))

(declare-fun lt!561013 () Unit!41060)

(declare-fun lemmaListSubSeqRefl!0 (List!27265) Unit!41060)

(assert (=> b!1237340 (= lt!561013 (lemmaListSubSeqRefl!0 lt!561012))))

(declare-datatypes ((array!79772 0))(
  ( (array!79773 (arr!38492 (Array (_ BitVec 32) (_ BitVec 64))) (size!39028 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79772)

(assert (=> b!1237340 (= lt!561012 (Cons!27261 (select (arr!38492 a!3835) from!3213) acc!846))))

(declare-fun b!1237341 () Bool)

(declare-fun res!825211 () Bool)

(assert (=> b!1237341 (=> (not res!825211) (not e!701279))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7327 (List!27265 (_ BitVec 64)) Bool)

(assert (=> b!1237341 (= res!825211 (contains!7327 acc!846 k!2925))))

(declare-fun b!1237342 () Bool)

(declare-fun res!825210 () Bool)

(assert (=> b!1237342 (=> (not res!825210) (not e!701279))))

(assert (=> b!1237342 (= res!825210 (not (contains!7327 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237343 () Bool)

(declare-fun res!825207 () Bool)

(assert (=> b!1237343 (=> (not res!825207) (not e!701279))))

(declare-fun arrayNoDuplicates!0 (array!79772 (_ BitVec 32) List!27265) Bool)

(assert (=> b!1237343 (= res!825207 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!825209 () Bool)

(assert (=> start!102996 (=> (not res!825209) (not e!701279))))

(assert (=> start!102996 (= res!825209 (and (bvslt (size!39028 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39028 a!3835))))))

(assert (=> start!102996 e!701279))

(declare-fun array_inv!29340 (array!79772) Bool)

(assert (=> start!102996 (array_inv!29340 a!3835)))

(assert (=> start!102996 true))

(declare-fun b!1237344 () Bool)

(declare-fun res!825212 () Bool)

(assert (=> b!1237344 (=> (not res!825212) (not e!701279))))

(assert (=> b!1237344 (= res!825212 (not (= from!3213 (bvsub (size!39028 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237345 () Bool)

(declare-fun res!825213 () Bool)

(assert (=> b!1237345 (=> (not res!825213) (not e!701279))))

(assert (=> b!1237345 (= res!825213 (not (contains!7327 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237346 () Bool)

(declare-fun res!825208 () Bool)

(assert (=> b!1237346 (=> (not res!825208) (not e!701279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237346 (= res!825208 (validKeyInArray!0 (select (arr!38492 a!3835) from!3213)))))

(assert (= (and start!102996 res!825209) b!1237339))

(assert (= (and b!1237339 res!825214) b!1237342))

(assert (= (and b!1237342 res!825210) b!1237345))

(assert (= (and b!1237345 res!825213) b!1237343))

(assert (= (and b!1237343 res!825207) b!1237341))

(assert (= (and b!1237341 res!825211) b!1237344))

(assert (= (and b!1237344 res!825212) b!1237346))

(assert (= (and b!1237346 res!825208) b!1237340))

(declare-fun m!1141057 () Bool)

(assert (=> start!102996 m!1141057))

(declare-fun m!1141059 () Bool)

(assert (=> b!1237346 m!1141059))

(assert (=> b!1237346 m!1141059))

(declare-fun m!1141061 () Bool)

(assert (=> b!1237346 m!1141061))

(declare-fun m!1141063 () Bool)

(assert (=> b!1237339 m!1141063))

(declare-fun m!1141065 () Bool)

(assert (=> b!1237340 m!1141065))

(declare-fun m!1141067 () Bool)

(assert (=> b!1237340 m!1141067))

(declare-fun m!1141069 () Bool)

(assert (=> b!1237340 m!1141069))

(declare-fun m!1141071 () Bool)

(assert (=> b!1237340 m!1141071))

(assert (=> b!1237340 m!1141059))

(declare-fun m!1141073 () Bool)

(assert (=> b!1237343 m!1141073))

(declare-fun m!1141075 () Bool)

(assert (=> b!1237345 m!1141075))

(declare-fun m!1141077 () Bool)

(assert (=> b!1237341 m!1141077))

(declare-fun m!1141079 () Bool)

(assert (=> b!1237342 m!1141079))

(push 1)

