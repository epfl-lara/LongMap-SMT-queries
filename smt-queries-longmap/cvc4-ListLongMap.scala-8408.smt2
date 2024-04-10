; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102268 () Bool)

(assert start!102268)

(declare-fun b!1230906 () Bool)

(declare-fun res!819371 () Bool)

(declare-fun e!698285 () Bool)

(assert (=> b!1230906 (=> (not res!819371) (not e!698285))))

(declare-datatypes ((List!27096 0))(
  ( (Nil!27093) (Cons!27092 (h!28301 (_ BitVec 64)) (t!40559 List!27096)) )
))
(declare-fun acc!823 () List!27096)

(declare-fun noDuplicate!1755 (List!27096) Bool)

(assert (=> b!1230906 (= res!819371 (noDuplicate!1755 acc!823))))

(declare-fun b!1230907 () Bool)

(declare-fun res!819370 () Bool)

(assert (=> b!1230907 (=> (not res!819370) (not e!698285))))

(declare-datatypes ((array!79410 0))(
  ( (array!79411 (arr!38323 (Array (_ BitVec 32) (_ BitVec 64))) (size!38859 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79410)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79410 (_ BitVec 32) List!27096) Bool)

(assert (=> b!1230907 (= res!819370 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!819373 () Bool)

(assert (=> start!102268 (=> (not res!819373) (not e!698285))))

(assert (=> start!102268 (= res!819373 (bvslt (size!38859 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102268 e!698285))

(declare-fun array_inv!29171 (array!79410) Bool)

(assert (=> start!102268 (array_inv!29171 a!3806)))

(assert (=> start!102268 true))

(declare-fun b!1230908 () Bool)

(declare-fun res!819369 () Bool)

(assert (=> b!1230908 (=> (not res!819369) (not e!698285))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230908 (= res!819369 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230909 () Bool)

(declare-fun res!819368 () Bool)

(assert (=> b!1230909 (=> (not res!819368) (not e!698285))))

(declare-fun contains!7158 (List!27096 (_ BitVec 64)) Bool)

(assert (=> b!1230909 (= res!819368 (not (contains!7158 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230910 () Bool)

(assert (=> b!1230910 (= e!698285 (not true))))

(assert (=> b!1230910 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27092 (select (arr!38323 a!3806) from!3184) acc!823))))

(declare-fun b!1230911 () Bool)

(declare-fun res!819372 () Bool)

(assert (=> b!1230911 (=> (not res!819372) (not e!698285))))

(assert (=> b!1230911 (= res!819372 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38859 a!3806)) (bvslt from!3184 (size!38859 a!3806))))))

(declare-fun b!1230912 () Bool)

(declare-fun res!819376 () Bool)

(assert (=> b!1230912 (=> (not res!819376) (not e!698285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230912 (= res!819376 (validKeyInArray!0 k!2913))))

(declare-fun b!1230913 () Bool)

(declare-fun res!819374 () Bool)

(assert (=> b!1230913 (=> (not res!819374) (not e!698285))))

(assert (=> b!1230913 (= res!819374 (not (contains!7158 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230914 () Bool)

(declare-fun res!819375 () Bool)

(assert (=> b!1230914 (=> (not res!819375) (not e!698285))))

(assert (=> b!1230914 (= res!819375 (validKeyInArray!0 (select (arr!38323 a!3806) from!3184)))))

(assert (= (and start!102268 res!819373) b!1230912))

(assert (= (and b!1230912 res!819376) b!1230911))

(assert (= (and b!1230911 res!819372) b!1230906))

(assert (= (and b!1230906 res!819371) b!1230909))

(assert (= (and b!1230909 res!819368) b!1230913))

(assert (= (and b!1230913 res!819374) b!1230908))

(assert (= (and b!1230908 res!819369) b!1230907))

(assert (= (and b!1230907 res!819370) b!1230914))

(assert (= (and b!1230914 res!819375) b!1230910))

(declare-fun m!1135187 () Bool)

(assert (=> b!1230910 m!1135187))

(declare-fun m!1135189 () Bool)

(assert (=> b!1230910 m!1135189))

(declare-fun m!1135191 () Bool)

(assert (=> b!1230909 m!1135191))

(declare-fun m!1135193 () Bool)

(assert (=> b!1230912 m!1135193))

(declare-fun m!1135195 () Bool)

(assert (=> b!1230913 m!1135195))

(declare-fun m!1135197 () Bool)

(assert (=> start!102268 m!1135197))

(declare-fun m!1135199 () Bool)

(assert (=> b!1230907 m!1135199))

(declare-fun m!1135201 () Bool)

(assert (=> b!1230906 m!1135201))

(declare-fun m!1135203 () Bool)

(assert (=> b!1230908 m!1135203))

(assert (=> b!1230914 m!1135187))

(assert (=> b!1230914 m!1135187))

(declare-fun m!1135205 () Bool)

(assert (=> b!1230914 m!1135205))

(push 1)

(assert (not b!1230909))

(assert (not b!1230912))

(assert (not b!1230913))

(assert (not b!1230908))

(assert (not start!102268))

(assert (not b!1230914))

(assert (not b!1230907))

(assert (not b!1230906))

(assert (not b!1230910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

