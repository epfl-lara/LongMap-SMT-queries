; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102260 () Bool)

(assert start!102260)

(declare-fun b!1230798 () Bool)

(declare-fun res!819265 () Bool)

(declare-fun e!698261 () Bool)

(assert (=> b!1230798 (=> (not res!819265) (not e!698261))))

(declare-datatypes ((List!27092 0))(
  ( (Nil!27089) (Cons!27088 (h!28297 (_ BitVec 64)) (t!40555 List!27092)) )
))
(declare-fun acc!823 () List!27092)

(declare-fun contains!7154 (List!27092 (_ BitVec 64)) Bool)

(assert (=> b!1230798 (= res!819265 (not (contains!7154 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230799 () Bool)

(declare-fun res!819266 () Bool)

(assert (=> b!1230799 (=> (not res!819266) (not e!698261))))

(assert (=> b!1230799 (= res!819266 (not (contains!7154 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230800 () Bool)

(declare-fun res!819262 () Bool)

(assert (=> b!1230800 (=> (not res!819262) (not e!698261))))

(declare-datatypes ((array!79402 0))(
  ( (array!79403 (arr!38319 (Array (_ BitVec 32) (_ BitVec 64))) (size!38855 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79402)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230800 (= res!819262 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!819264 () Bool)

(assert (=> start!102260 (=> (not res!819264) (not e!698261))))

(assert (=> start!102260 (= res!819264 (bvslt (size!38855 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102260 e!698261))

(declare-fun array_inv!29167 (array!79402) Bool)

(assert (=> start!102260 (array_inv!29167 a!3806)))

(assert (=> start!102260 true))

(declare-fun b!1230801 () Bool)

(declare-fun res!819267 () Bool)

(assert (=> b!1230801 (=> (not res!819267) (not e!698261))))

(declare-fun noDuplicate!1751 (List!27092) Bool)

(assert (=> b!1230801 (= res!819267 (noDuplicate!1751 acc!823))))

(declare-fun b!1230802 () Bool)

(declare-fun res!819268 () Bool)

(assert (=> b!1230802 (=> (not res!819268) (not e!698261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230802 (= res!819268 (validKeyInArray!0 (select (arr!38319 a!3806) from!3184)))))

(declare-fun b!1230803 () Bool)

(assert (=> b!1230803 (= e!698261 (not (bvsle from!3184 (size!38855 a!3806))))))

(declare-fun arrayNoDuplicates!0 (array!79402 (_ BitVec 32) List!27092) Bool)

(assert (=> b!1230803 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27088 (select (arr!38319 a!3806) from!3184) acc!823))))

(declare-fun b!1230804 () Bool)

(declare-fun res!819261 () Bool)

(assert (=> b!1230804 (=> (not res!819261) (not e!698261))))

(assert (=> b!1230804 (= res!819261 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38855 a!3806)) (bvslt from!3184 (size!38855 a!3806))))))

(declare-fun b!1230805 () Bool)

(declare-fun res!819260 () Bool)

(assert (=> b!1230805 (=> (not res!819260) (not e!698261))))

(assert (=> b!1230805 (= res!819260 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230806 () Bool)

(declare-fun res!819263 () Bool)

(assert (=> b!1230806 (=> (not res!819263) (not e!698261))))

(assert (=> b!1230806 (= res!819263 (validKeyInArray!0 k0!2913))))

(assert (= (and start!102260 res!819264) b!1230806))

(assert (= (and b!1230806 res!819263) b!1230804))

(assert (= (and b!1230804 res!819261) b!1230801))

(assert (= (and b!1230801 res!819267) b!1230799))

(assert (= (and b!1230799 res!819266) b!1230798))

(assert (= (and b!1230798 res!819265) b!1230800))

(assert (= (and b!1230800 res!819262) b!1230805))

(assert (= (and b!1230805 res!819260) b!1230802))

(assert (= (and b!1230802 res!819268) b!1230803))

(declare-fun m!1135107 () Bool)

(assert (=> b!1230806 m!1135107))

(declare-fun m!1135109 () Bool)

(assert (=> b!1230799 m!1135109))

(declare-fun m!1135111 () Bool)

(assert (=> b!1230801 m!1135111))

(declare-fun m!1135113 () Bool)

(assert (=> b!1230798 m!1135113))

(declare-fun m!1135115 () Bool)

(assert (=> b!1230802 m!1135115))

(assert (=> b!1230802 m!1135115))

(declare-fun m!1135117 () Bool)

(assert (=> b!1230802 m!1135117))

(declare-fun m!1135119 () Bool)

(assert (=> b!1230805 m!1135119))

(declare-fun m!1135121 () Bool)

(assert (=> b!1230800 m!1135121))

(assert (=> b!1230803 m!1135115))

(declare-fun m!1135123 () Bool)

(assert (=> b!1230803 m!1135123))

(declare-fun m!1135125 () Bool)

(assert (=> start!102260 m!1135125))

(check-sat (not b!1230800) (not b!1230799) (not b!1230805) (not b!1230803) (not b!1230801) (not b!1230798) (not b!1230806) (not b!1230802) (not start!102260))
(check-sat)
