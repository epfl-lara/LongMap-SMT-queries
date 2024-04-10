; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102270 () Bool)

(assert start!102270)

(declare-fun b!1230933 () Bool)

(declare-fun res!819403 () Bool)

(declare-fun e!698292 () Bool)

(assert (=> b!1230933 (=> (not res!819403) (not e!698292))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79412 0))(
  ( (array!79413 (arr!38324 (Array (_ BitVec 32) (_ BitVec 64))) (size!38860 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79412)

(assert (=> b!1230933 (= res!819403 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38860 a!3806)) (bvslt from!3184 (size!38860 a!3806))))))

(declare-fun b!1230934 () Bool)

(declare-fun res!819402 () Bool)

(assert (=> b!1230934 (=> (not res!819402) (not e!698292))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230934 (= res!819402 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!819395 () Bool)

(assert (=> start!102270 (=> (not res!819395) (not e!698292))))

(assert (=> start!102270 (= res!819395 (bvslt (size!38860 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102270 e!698292))

(declare-fun array_inv!29172 (array!79412) Bool)

(assert (=> start!102270 (array_inv!29172 a!3806)))

(assert (=> start!102270 true))

(declare-fun b!1230935 () Bool)

(declare-fun res!819398 () Bool)

(assert (=> b!1230935 (=> (not res!819398) (not e!698292))))

(declare-datatypes ((List!27097 0))(
  ( (Nil!27094) (Cons!27093 (h!28302 (_ BitVec 64)) (t!40560 List!27097)) )
))
(declare-fun acc!823 () List!27097)

(declare-fun arrayNoDuplicates!0 (array!79412 (_ BitVec 32) List!27097) Bool)

(assert (=> b!1230935 (= res!819398 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230936 () Bool)

(declare-fun res!819399 () Bool)

(assert (=> b!1230936 (=> (not res!819399) (not e!698292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230936 (= res!819399 (validKeyInArray!0 (select (arr!38324 a!3806) from!3184)))))

(declare-fun b!1230937 () Bool)

(assert (=> b!1230937 (= e!698292 (not true))))

(assert (=> b!1230937 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27093 (select (arr!38324 a!3806) from!3184) acc!823))))

(declare-fun b!1230938 () Bool)

(declare-fun res!819401 () Bool)

(assert (=> b!1230938 (=> (not res!819401) (not e!698292))))

(declare-fun contains!7159 (List!27097 (_ BitVec 64)) Bool)

(assert (=> b!1230938 (= res!819401 (not (contains!7159 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230939 () Bool)

(declare-fun res!819396 () Bool)

(assert (=> b!1230939 (=> (not res!819396) (not e!698292))))

(declare-fun noDuplicate!1756 (List!27097) Bool)

(assert (=> b!1230939 (= res!819396 (noDuplicate!1756 acc!823))))

(declare-fun b!1230940 () Bool)

(declare-fun res!819400 () Bool)

(assert (=> b!1230940 (=> (not res!819400) (not e!698292))))

(assert (=> b!1230940 (= res!819400 (validKeyInArray!0 k!2913))))

(declare-fun b!1230941 () Bool)

(declare-fun res!819397 () Bool)

(assert (=> b!1230941 (=> (not res!819397) (not e!698292))))

(assert (=> b!1230941 (= res!819397 (not (contains!7159 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102270 res!819395) b!1230940))

(assert (= (and b!1230940 res!819400) b!1230933))

(assert (= (and b!1230933 res!819403) b!1230939))

(assert (= (and b!1230939 res!819396) b!1230941))

(assert (= (and b!1230941 res!819397) b!1230938))

(assert (= (and b!1230938 res!819401) b!1230934))

(assert (= (and b!1230934 res!819402) b!1230935))

(assert (= (and b!1230935 res!819398) b!1230936))

(assert (= (and b!1230936 res!819399) b!1230937))

(declare-fun m!1135207 () Bool)

(assert (=> b!1230938 m!1135207))

(declare-fun m!1135209 () Bool)

(assert (=> b!1230937 m!1135209))

(declare-fun m!1135211 () Bool)

(assert (=> b!1230937 m!1135211))

(declare-fun m!1135213 () Bool)

(assert (=> b!1230935 m!1135213))

(declare-fun m!1135215 () Bool)

(assert (=> b!1230941 m!1135215))

(declare-fun m!1135217 () Bool)

(assert (=> start!102270 m!1135217))

(declare-fun m!1135219 () Bool)

(assert (=> b!1230934 m!1135219))

(declare-fun m!1135221 () Bool)

(assert (=> b!1230940 m!1135221))

(declare-fun m!1135223 () Bool)

(assert (=> b!1230939 m!1135223))

(assert (=> b!1230936 m!1135209))

(assert (=> b!1230936 m!1135209))

(declare-fun m!1135225 () Bool)

(assert (=> b!1230936 m!1135225))

(push 1)

(assert (not b!1230934))

(assert (not b!1230940))

(assert (not b!1230939))

(assert (not b!1230935))

(assert (not b!1230936))

(assert (not b!1230938))

(assert (not start!102270))

(assert (not b!1230937))

(assert (not b!1230941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

