; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102258 () Bool)

(assert start!102258)

(declare-fun b!1230771 () Bool)

(declare-fun res!819236 () Bool)

(declare-fun e!698256 () Bool)

(assert (=> b!1230771 (=> (not res!819236) (not e!698256))))

(declare-datatypes ((array!79400 0))(
  ( (array!79401 (arr!38318 (Array (_ BitVec 32) (_ BitVec 64))) (size!38854 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79400)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230771 (= res!819236 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230772 () Bool)

(declare-fun res!819238 () Bool)

(assert (=> b!1230772 (=> (not res!819238) (not e!698256))))

(declare-datatypes ((List!27091 0))(
  ( (Nil!27088) (Cons!27087 (h!28296 (_ BitVec 64)) (t!40554 List!27091)) )
))
(declare-fun acc!823 () List!27091)

(declare-fun noDuplicate!1750 (List!27091) Bool)

(assert (=> b!1230772 (= res!819238 (noDuplicate!1750 acc!823))))

(declare-fun b!1230773 () Bool)

(declare-fun res!819235 () Bool)

(assert (=> b!1230773 (=> (not res!819235) (not e!698256))))

(declare-fun arrayNoDuplicates!0 (array!79400 (_ BitVec 32) List!27091) Bool)

(assert (=> b!1230773 (= res!819235 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230774 () Bool)

(declare-fun res!819233 () Bool)

(assert (=> b!1230774 (=> (not res!819233) (not e!698256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230774 (= res!819233 (validKeyInArray!0 k!2913))))

(declare-fun b!1230775 () Bool)

(declare-fun res!819240 () Bool)

(assert (=> b!1230775 (=> (not res!819240) (not e!698256))))

(assert (=> b!1230775 (= res!819240 (validKeyInArray!0 (select (arr!38318 a!3806) from!3184)))))

(declare-fun b!1230776 () Bool)

(assert (=> b!1230776 (= e!698256 (not (bvsle from!3184 (size!38854 a!3806))))))

(assert (=> b!1230776 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27087 (select (arr!38318 a!3806) from!3184) acc!823))))

(declare-fun b!1230778 () Bool)

(declare-fun res!819234 () Bool)

(assert (=> b!1230778 (=> (not res!819234) (not e!698256))))

(declare-fun contains!7153 (List!27091 (_ BitVec 64)) Bool)

(assert (=> b!1230778 (= res!819234 (not (contains!7153 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230779 () Bool)

(declare-fun res!819239 () Bool)

(assert (=> b!1230779 (=> (not res!819239) (not e!698256))))

(assert (=> b!1230779 (= res!819239 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38854 a!3806)) (bvslt from!3184 (size!38854 a!3806))))))

(declare-fun res!819237 () Bool)

(assert (=> start!102258 (=> (not res!819237) (not e!698256))))

(assert (=> start!102258 (= res!819237 (bvslt (size!38854 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102258 e!698256))

(declare-fun array_inv!29166 (array!79400) Bool)

(assert (=> start!102258 (array_inv!29166 a!3806)))

(assert (=> start!102258 true))

(declare-fun b!1230777 () Bool)

(declare-fun res!819241 () Bool)

(assert (=> b!1230777 (=> (not res!819241) (not e!698256))))

(assert (=> b!1230777 (= res!819241 (not (contains!7153 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102258 res!819237) b!1230774))

(assert (= (and b!1230774 res!819233) b!1230779))

(assert (= (and b!1230779 res!819239) b!1230772))

(assert (= (and b!1230772 res!819238) b!1230778))

(assert (= (and b!1230778 res!819234) b!1230777))

(assert (= (and b!1230777 res!819241) b!1230771))

(assert (= (and b!1230771 res!819236) b!1230773))

(assert (= (and b!1230773 res!819235) b!1230775))

(assert (= (and b!1230775 res!819240) b!1230776))

(declare-fun m!1135087 () Bool)

(assert (=> b!1230776 m!1135087))

(declare-fun m!1135089 () Bool)

(assert (=> b!1230776 m!1135089))

(declare-fun m!1135091 () Bool)

(assert (=> b!1230771 m!1135091))

(assert (=> b!1230775 m!1135087))

(assert (=> b!1230775 m!1135087))

(declare-fun m!1135093 () Bool)

(assert (=> b!1230775 m!1135093))

(declare-fun m!1135095 () Bool)

(assert (=> b!1230778 m!1135095))

(declare-fun m!1135097 () Bool)

(assert (=> b!1230773 m!1135097))

(declare-fun m!1135099 () Bool)

(assert (=> b!1230774 m!1135099))

(declare-fun m!1135101 () Bool)

(assert (=> b!1230777 m!1135101))

(declare-fun m!1135103 () Bool)

(assert (=> start!102258 m!1135103))

(declare-fun m!1135105 () Bool)

(assert (=> b!1230772 m!1135105))

(push 1)

(assert (not b!1230771))

(assert (not b!1230774))

(assert (not start!102258))

(assert (not b!1230775))

(assert (not b!1230777))

(assert (not b!1230778))

(assert (not b!1230773))

(assert (not b!1230776))

(assert (not b!1230772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

