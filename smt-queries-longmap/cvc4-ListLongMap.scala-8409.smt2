; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102512 () Bool)

(assert start!102512)

(declare-fun b!1232288 () Bool)

(declare-fun res!819958 () Bool)

(declare-fun e!699163 () Bool)

(assert (=> b!1232288 (=> (not res!819958) (not e!699163))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79450 0))(
  ( (array!79451 (arr!38337 (Array (_ BitVec 32) (_ BitVec 64))) (size!38874 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79450)

(assert (=> b!1232288 (= res!819958 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38874 a!3806)) (bvslt from!3184 (size!38874 a!3806))))))

(declare-fun b!1232289 () Bool)

(assert (=> b!1232289 (= e!699163 (not true))))

(declare-datatypes ((List!27123 0))(
  ( (Nil!27120) (Cons!27119 (h!28337 (_ BitVec 64)) (t!40578 List!27123)) )
))
(declare-fun acc!823 () List!27123)

(declare-fun arrayNoDuplicates!0 (array!79450 (_ BitVec 32) List!27123) Bool)

(assert (=> b!1232289 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27119 (select (arr!38337 a!3806) from!3184) acc!823))))

(declare-fun b!1232290 () Bool)

(declare-fun res!819965 () Bool)

(assert (=> b!1232290 (=> (not res!819965) (not e!699163))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232290 (= res!819965 (validKeyInArray!0 k!2913))))

(declare-fun b!1232291 () Bool)

(declare-fun res!819957 () Bool)

(assert (=> b!1232291 (=> (not res!819957) (not e!699163))))

(declare-fun arrayContainsKey!0 (array!79450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232291 (= res!819957 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232292 () Bool)

(declare-fun res!819960 () Bool)

(assert (=> b!1232292 (=> (not res!819960) (not e!699163))))

(assert (=> b!1232292 (= res!819960 (validKeyInArray!0 (select (arr!38337 a!3806) from!3184)))))

(declare-fun b!1232293 () Bool)

(declare-fun res!819964 () Bool)

(assert (=> b!1232293 (=> (not res!819964) (not e!699163))))

(declare-fun contains!7194 (List!27123 (_ BitVec 64)) Bool)

(assert (=> b!1232293 (= res!819964 (not (contains!7194 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232294 () Bool)

(declare-fun res!819962 () Bool)

(assert (=> b!1232294 (=> (not res!819962) (not e!699163))))

(assert (=> b!1232294 (= res!819962 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232296 () Bool)

(declare-fun res!819961 () Bool)

(assert (=> b!1232296 (=> (not res!819961) (not e!699163))))

(declare-fun noDuplicate!1775 (List!27123) Bool)

(assert (=> b!1232296 (= res!819961 (noDuplicate!1775 acc!823))))

(declare-fun b!1232295 () Bool)

(declare-fun res!819959 () Bool)

(assert (=> b!1232295 (=> (not res!819959) (not e!699163))))

(assert (=> b!1232295 (= res!819959 (not (contains!7194 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!819963 () Bool)

(assert (=> start!102512 (=> (not res!819963) (not e!699163))))

(assert (=> start!102512 (= res!819963 (bvslt (size!38874 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102512 e!699163))

(declare-fun array_inv!29275 (array!79450) Bool)

(assert (=> start!102512 (array_inv!29275 a!3806)))

(assert (=> start!102512 true))

(assert (= (and start!102512 res!819963) b!1232290))

(assert (= (and b!1232290 res!819965) b!1232288))

(assert (= (and b!1232288 res!819958) b!1232296))

(assert (= (and b!1232296 res!819961) b!1232295))

(assert (= (and b!1232295 res!819959) b!1232293))

(assert (= (and b!1232293 res!819964) b!1232291))

(assert (= (and b!1232291 res!819957) b!1232294))

(assert (= (and b!1232294 res!819962) b!1232292))

(assert (= (and b!1232292 res!819960) b!1232289))

(declare-fun m!1136885 () Bool)

(assert (=> b!1232296 m!1136885))

(declare-fun m!1136887 () Bool)

(assert (=> start!102512 m!1136887))

(declare-fun m!1136889 () Bool)

(assert (=> b!1232291 m!1136889))

(declare-fun m!1136891 () Bool)

(assert (=> b!1232294 m!1136891))

(declare-fun m!1136893 () Bool)

(assert (=> b!1232290 m!1136893))

(declare-fun m!1136895 () Bool)

(assert (=> b!1232293 m!1136895))

(declare-fun m!1136897 () Bool)

(assert (=> b!1232292 m!1136897))

(assert (=> b!1232292 m!1136897))

(declare-fun m!1136899 () Bool)

(assert (=> b!1232292 m!1136899))

(declare-fun m!1136901 () Bool)

(assert (=> b!1232295 m!1136901))

(assert (=> b!1232289 m!1136897))

(declare-fun m!1136903 () Bool)

(assert (=> b!1232289 m!1136903))

(push 1)

(assert (not b!1232292))

(assert (not b!1232294))

(assert (not start!102512))

(assert (not b!1232296))

(assert (not b!1232293))

(assert (not b!1232289))

(assert (not b!1232295))

(assert (not b!1232291))

(assert (not b!1232290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

