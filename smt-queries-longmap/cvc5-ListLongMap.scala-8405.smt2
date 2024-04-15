; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102248 () Bool)

(assert start!102248)

(declare-fun b!1230595 () Bool)

(declare-fun res!819097 () Bool)

(declare-fun e!698197 () Bool)

(assert (=> b!1230595 (=> (not res!819097) (not e!698197))))

(declare-datatypes ((array!79313 0))(
  ( (array!79314 (arr!38275 (Array (_ BitVec 32) (_ BitVec 64))) (size!38813 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79313)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230595 (= res!819097 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230596 () Bool)

(declare-fun res!819098 () Bool)

(assert (=> b!1230596 (=> (not res!819098) (not e!698197))))

(declare-datatypes ((List!27149 0))(
  ( (Nil!27146) (Cons!27145 (h!28354 (_ BitVec 64)) (t!40603 List!27149)) )
))
(declare-fun acc!823 () List!27149)

(declare-fun arrayNoDuplicates!0 (array!79313 (_ BitVec 32) List!27149) Bool)

(assert (=> b!1230596 (= res!819098 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230597 () Bool)

(declare-fun res!819095 () Bool)

(assert (=> b!1230597 (=> (not res!819095) (not e!698197))))

(assert (=> b!1230597 (= res!819095 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38813 a!3806)) (bvslt from!3184 (size!38813 a!3806))))))

(declare-fun res!819099 () Bool)

(assert (=> start!102248 (=> (not res!819099) (not e!698197))))

(assert (=> start!102248 (= res!819099 (bvslt (size!38813 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102248 e!698197))

(declare-fun array_inv!29258 (array!79313) Bool)

(assert (=> start!102248 (array_inv!29258 a!3806)))

(assert (=> start!102248 true))

(declare-fun b!1230598 () Bool)

(declare-fun res!819094 () Bool)

(assert (=> b!1230598 (=> (not res!819094) (not e!698197))))

(declare-fun noDuplicate!1764 (List!27149) Bool)

(assert (=> b!1230598 (= res!819094 (noDuplicate!1764 acc!823))))

(declare-fun b!1230599 () Bool)

(declare-fun res!819096 () Bool)

(assert (=> b!1230599 (=> (not res!819096) (not e!698197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230599 (= res!819096 (validKeyInArray!0 k!2913))))

(declare-fun b!1230600 () Bool)

(assert (=> b!1230600 (= e!698197 (not true))))

(assert (=> b!1230600 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27145 (select (arr!38275 a!3806) from!3184) acc!823))))

(declare-fun b!1230601 () Bool)

(declare-fun res!819100 () Bool)

(assert (=> b!1230601 (=> (not res!819100) (not e!698197))))

(assert (=> b!1230601 (= res!819100 (validKeyInArray!0 (select (arr!38275 a!3806) from!3184)))))

(declare-fun b!1230602 () Bool)

(declare-fun res!819093 () Bool)

(assert (=> b!1230602 (=> (not res!819093) (not e!698197))))

(declare-fun contains!7121 (List!27149 (_ BitVec 64)) Bool)

(assert (=> b!1230602 (= res!819093 (not (contains!7121 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230603 () Bool)

(declare-fun res!819101 () Bool)

(assert (=> b!1230603 (=> (not res!819101) (not e!698197))))

(assert (=> b!1230603 (= res!819101 (not (contains!7121 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102248 res!819099) b!1230599))

(assert (= (and b!1230599 res!819096) b!1230597))

(assert (= (and b!1230597 res!819095) b!1230598))

(assert (= (and b!1230598 res!819094) b!1230602))

(assert (= (and b!1230602 res!819093) b!1230603))

(assert (= (and b!1230603 res!819101) b!1230595))

(assert (= (and b!1230595 res!819097) b!1230596))

(assert (= (and b!1230596 res!819098) b!1230601))

(assert (= (and b!1230601 res!819100) b!1230600))

(declare-fun m!1134511 () Bool)

(assert (=> b!1230601 m!1134511))

(assert (=> b!1230601 m!1134511))

(declare-fun m!1134513 () Bool)

(assert (=> b!1230601 m!1134513))

(declare-fun m!1134515 () Bool)

(assert (=> b!1230599 m!1134515))

(declare-fun m!1134517 () Bool)

(assert (=> start!102248 m!1134517))

(declare-fun m!1134519 () Bool)

(assert (=> b!1230598 m!1134519))

(assert (=> b!1230600 m!1134511))

(declare-fun m!1134521 () Bool)

(assert (=> b!1230600 m!1134521))

(declare-fun m!1134523 () Bool)

(assert (=> b!1230603 m!1134523))

(declare-fun m!1134525 () Bool)

(assert (=> b!1230595 m!1134525))

(declare-fun m!1134527 () Bool)

(assert (=> b!1230602 m!1134527))

(declare-fun m!1134529 () Bool)

(assert (=> b!1230596 m!1134529))

(push 1)

(assert (not b!1230603))

(assert (not b!1230602))

(assert (not b!1230595))

(assert (not b!1230598))

(assert (not b!1230596))

(assert (not b!1230600))

(assert (not start!102248))

(assert (not b!1230599))

(assert (not b!1230601))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

