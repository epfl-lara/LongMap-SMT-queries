; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102262 () Bool)

(assert start!102262)

(declare-fun b!1230825 () Bool)

(declare-fun res!819295 () Bool)

(declare-fun e!698267 () Bool)

(assert (=> b!1230825 (=> (not res!819295) (not e!698267))))

(declare-datatypes ((List!27093 0))(
  ( (Nil!27090) (Cons!27089 (h!28298 (_ BitVec 64)) (t!40556 List!27093)) )
))
(declare-fun acc!823 () List!27093)

(declare-fun contains!7155 (List!27093 (_ BitVec 64)) Bool)

(assert (=> b!1230825 (= res!819295 (not (contains!7155 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230826 () Bool)

(declare-fun res!819292 () Bool)

(assert (=> b!1230826 (=> (not res!819292) (not e!698267))))

(declare-fun noDuplicate!1752 (List!27093) Bool)

(assert (=> b!1230826 (= res!819292 (noDuplicate!1752 acc!823))))

(declare-fun b!1230827 () Bool)

(declare-fun res!819293 () Bool)

(assert (=> b!1230827 (=> (not res!819293) (not e!698267))))

(assert (=> b!1230827 (= res!819293 (not (contains!7155 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230828 () Bool)

(declare-fun res!819288 () Bool)

(assert (=> b!1230828 (=> (not res!819288) (not e!698267))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79404 0))(
  ( (array!79405 (arr!38320 (Array (_ BitVec 32) (_ BitVec 64))) (size!38856 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79404)

(assert (=> b!1230828 (= res!819288 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38856 a!3806)) (bvslt from!3184 (size!38856 a!3806))))))

(declare-fun b!1230829 () Bool)

(declare-fun res!819287 () Bool)

(assert (=> b!1230829 (=> (not res!819287) (not e!698267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230829 (= res!819287 (validKeyInArray!0 (select (arr!38320 a!3806) from!3184)))))

(declare-fun b!1230831 () Bool)

(declare-fun res!819294 () Bool)

(assert (=> b!1230831 (=> (not res!819294) (not e!698267))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1230831 (= res!819294 (validKeyInArray!0 k!2913))))

(declare-fun b!1230830 () Bool)

(assert (=> b!1230830 (= e!698267 (not (bvsle from!3184 (size!38856 a!3806))))))

(declare-fun arrayNoDuplicates!0 (array!79404 (_ BitVec 32) List!27093) Bool)

(assert (=> b!1230830 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27089 (select (arr!38320 a!3806) from!3184) acc!823))))

(declare-fun res!819289 () Bool)

(assert (=> start!102262 (=> (not res!819289) (not e!698267))))

(assert (=> start!102262 (= res!819289 (bvslt (size!38856 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102262 e!698267))

(declare-fun array_inv!29168 (array!79404) Bool)

(assert (=> start!102262 (array_inv!29168 a!3806)))

(assert (=> start!102262 true))

(declare-fun b!1230832 () Bool)

(declare-fun res!819290 () Bool)

(assert (=> b!1230832 (=> (not res!819290) (not e!698267))))

(declare-fun arrayContainsKey!0 (array!79404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230832 (= res!819290 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230833 () Bool)

(declare-fun res!819291 () Bool)

(assert (=> b!1230833 (=> (not res!819291) (not e!698267))))

(assert (=> b!1230833 (= res!819291 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102262 res!819289) b!1230831))

(assert (= (and b!1230831 res!819294) b!1230828))

(assert (= (and b!1230828 res!819288) b!1230826))

(assert (= (and b!1230826 res!819292) b!1230825))

(assert (= (and b!1230825 res!819295) b!1230827))

(assert (= (and b!1230827 res!819293) b!1230832))

(assert (= (and b!1230832 res!819290) b!1230833))

(assert (= (and b!1230833 res!819291) b!1230829))

(assert (= (and b!1230829 res!819287) b!1230830))

(declare-fun m!1135127 () Bool)

(assert (=> b!1230827 m!1135127))

(declare-fun m!1135129 () Bool)

(assert (=> b!1230831 m!1135129))

(declare-fun m!1135131 () Bool)

(assert (=> start!102262 m!1135131))

(declare-fun m!1135133 () Bool)

(assert (=> b!1230833 m!1135133))

(declare-fun m!1135135 () Bool)

(assert (=> b!1230832 m!1135135))

(declare-fun m!1135137 () Bool)

(assert (=> b!1230825 m!1135137))

(declare-fun m!1135139 () Bool)

(assert (=> b!1230829 m!1135139))

(assert (=> b!1230829 m!1135139))

(declare-fun m!1135141 () Bool)

(assert (=> b!1230829 m!1135141))

(assert (=> b!1230830 m!1135139))

(declare-fun m!1135143 () Bool)

(assert (=> b!1230830 m!1135143))

(declare-fun m!1135145 () Bool)

(assert (=> b!1230826 m!1135145))

(push 1)

(assert (not b!1230832))

(assert (not b!1230831))

(assert (not b!1230827))

(assert (not b!1230825))

(assert (not b!1230830))

(assert (not start!102262))

(assert (not b!1230829))

(assert (not b!1230833))

(assert (not b!1230826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

