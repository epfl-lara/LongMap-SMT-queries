; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102994 () Bool)

(assert start!102994)

(declare-fun b!1237315 () Bool)

(declare-fun res!825186 () Bool)

(declare-fun e!701274 () Bool)

(assert (=> b!1237315 (=> (not res!825186) (not e!701274))))

(declare-datatypes ((array!79770 0))(
  ( (array!79771 (arr!38491 (Array (_ BitVec 32) (_ BitVec 64))) (size!39027 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79770)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237315 (= res!825186 (validKeyInArray!0 (select (arr!38491 a!3835) from!3213)))))

(declare-fun b!1237316 () Bool)

(declare-fun res!825189 () Bool)

(assert (=> b!1237316 (=> (not res!825189) (not e!701274))))

(declare-datatypes ((List!27264 0))(
  ( (Nil!27261) (Cons!27260 (h!28469 (_ BitVec 64)) (t!40727 List!27264)) )
))
(declare-fun acc!846 () List!27264)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7326 (List!27264 (_ BitVec 64)) Bool)

(assert (=> b!1237316 (= res!825189 (contains!7326 acc!846 k!2925))))

(declare-fun res!825187 () Bool)

(assert (=> start!102994 (=> (not res!825187) (not e!701274))))

(assert (=> start!102994 (= res!825187 (and (bvslt (size!39027 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39027 a!3835))))))

(assert (=> start!102994 e!701274))

(declare-fun array_inv!29339 (array!79770) Bool)

(assert (=> start!102994 (array_inv!29339 a!3835)))

(assert (=> start!102994 true))

(declare-fun b!1237317 () Bool)

(declare-fun res!825185 () Bool)

(assert (=> b!1237317 (=> (not res!825185) (not e!701274))))

(declare-fun arrayNoDuplicates!0 (array!79770 (_ BitVec 32) List!27264) Bool)

(assert (=> b!1237317 (= res!825185 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237318 () Bool)

(declare-fun res!825183 () Bool)

(assert (=> b!1237318 (=> (not res!825183) (not e!701274))))

(assert (=> b!1237318 (= res!825183 (not (= from!3213 (bvsub (size!39027 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237319 () Bool)

(declare-fun res!825188 () Bool)

(assert (=> b!1237319 (=> (not res!825188) (not e!701274))))

(assert (=> b!1237319 (= res!825188 (not (contains!7326 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237320 () Bool)

(declare-fun res!825184 () Bool)

(assert (=> b!1237320 (=> (not res!825184) (not e!701274))))

(declare-fun noDuplicate!1923 (List!27264) Bool)

(assert (=> b!1237320 (= res!825184 (noDuplicate!1923 acc!846))))

(declare-fun b!1237321 () Bool)

(declare-fun res!825190 () Bool)

(assert (=> b!1237321 (=> (not res!825190) (not e!701274))))

(assert (=> b!1237321 (= res!825190 (not (contains!7326 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237322 () Bool)

(assert (=> b!1237322 (= e!701274 (not true))))

(declare-fun lt!561003 () List!27264)

(declare-fun subseq!580 (List!27264 List!27264) Bool)

(assert (=> b!1237322 (subseq!580 acc!846 lt!561003)))

(declare-datatypes ((Unit!41058 0))(
  ( (Unit!41059) )
))
(declare-fun lt!561005 () Unit!41058)

(declare-fun subseqTail!67 (List!27264 List!27264) Unit!41058)

(assert (=> b!1237322 (= lt!561005 (subseqTail!67 lt!561003 lt!561003))))

(assert (=> b!1237322 (subseq!580 lt!561003 lt!561003)))

(declare-fun lt!561004 () Unit!41058)

(declare-fun lemmaListSubSeqRefl!0 (List!27264) Unit!41058)

(assert (=> b!1237322 (= lt!561004 (lemmaListSubSeqRefl!0 lt!561003))))

(assert (=> b!1237322 (= lt!561003 (Cons!27260 (select (arr!38491 a!3835) from!3213) acc!846))))

(assert (= (and start!102994 res!825187) b!1237320))

(assert (= (and b!1237320 res!825184) b!1237319))

(assert (= (and b!1237319 res!825188) b!1237321))

(assert (= (and b!1237321 res!825190) b!1237317))

(assert (= (and b!1237317 res!825185) b!1237316))

(assert (= (and b!1237316 res!825189) b!1237318))

(assert (= (and b!1237318 res!825183) b!1237315))

(assert (= (and b!1237315 res!825186) b!1237322))

(declare-fun m!1141033 () Bool)

(assert (=> start!102994 m!1141033))

(declare-fun m!1141035 () Bool)

(assert (=> b!1237315 m!1141035))

(assert (=> b!1237315 m!1141035))

(declare-fun m!1141037 () Bool)

(assert (=> b!1237315 m!1141037))

(declare-fun m!1141039 () Bool)

(assert (=> b!1237321 m!1141039))

(declare-fun m!1141041 () Bool)

(assert (=> b!1237317 m!1141041))

(declare-fun m!1141043 () Bool)

(assert (=> b!1237322 m!1141043))

(declare-fun m!1141045 () Bool)

(assert (=> b!1237322 m!1141045))

(declare-fun m!1141047 () Bool)

(assert (=> b!1237322 m!1141047))

(declare-fun m!1141049 () Bool)

(assert (=> b!1237322 m!1141049))

(assert (=> b!1237322 m!1141035))

(declare-fun m!1141051 () Bool)

(assert (=> b!1237320 m!1141051))

(declare-fun m!1141053 () Bool)

(assert (=> b!1237316 m!1141053))

(declare-fun m!1141055 () Bool)

(assert (=> b!1237319 m!1141055))

(push 1)

(assert (not b!1237317))

(assert (not b!1237320))

(assert (not start!102994))

(assert (not b!1237316))

(assert (not b!1237321))

(assert (not b!1237315))

(assert (not b!1237322))

(assert (not b!1237319))

(check-sat)

(pop 1)

