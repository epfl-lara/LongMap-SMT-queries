; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102436 () Bool)

(assert start!102436)

(declare-fun b!1231648 () Bool)

(declare-fun res!819346 () Bool)

(declare-fun e!698935 () Bool)

(assert (=> b!1231648 (=> (not res!819346) (not e!698935))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231648 (= res!819346 (validKeyInArray!0 k!2913))))

(declare-fun b!1231649 () Bool)

(declare-fun res!819343 () Bool)

(assert (=> b!1231649 (=> (not res!819343) (not e!698935))))

(declare-datatypes ((List!27103 0))(
  ( (Nil!27100) (Cons!27099 (h!28317 (_ BitVec 64)) (t!40558 List!27103)) )
))
(declare-fun acc!823 () List!27103)

(declare-fun contains!7174 (List!27103 (_ BitVec 64)) Bool)

(assert (=> b!1231649 (= res!819343 (not (contains!7174 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231650 () Bool)

(assert (=> b!1231650 (= e!698935 false)))

(declare-datatypes ((array!79407 0))(
  ( (array!79408 (arr!38317 (Array (_ BitVec 32) (_ BitVec 64))) (size!38854 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79407)

(declare-fun lt!559848 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79407 (_ BitVec 32) List!27103) Bool)

(assert (=> b!1231650 (= lt!559848 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231651 () Bool)

(declare-fun res!819341 () Bool)

(assert (=> b!1231651 (=> (not res!819341) (not e!698935))))

(assert (=> b!1231651 (= res!819341 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38854 a!3806)) (bvslt from!3184 (size!38854 a!3806))))))

(declare-fun b!1231652 () Bool)

(declare-fun res!819345 () Bool)

(assert (=> b!1231652 (=> (not res!819345) (not e!698935))))

(assert (=> b!1231652 (= res!819345 (not (contains!7174 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!819347 () Bool)

(assert (=> start!102436 (=> (not res!819347) (not e!698935))))

(assert (=> start!102436 (= res!819347 (bvslt (size!38854 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102436 e!698935))

(declare-fun array_inv!29255 (array!79407) Bool)

(assert (=> start!102436 (array_inv!29255 a!3806)))

(assert (=> start!102436 true))

(declare-fun b!1231653 () Bool)

(declare-fun res!819342 () Bool)

(assert (=> b!1231653 (=> (not res!819342) (not e!698935))))

(declare-fun arrayContainsKey!0 (array!79407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231653 (= res!819342 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231654 () Bool)

(declare-fun res!819344 () Bool)

(assert (=> b!1231654 (=> (not res!819344) (not e!698935))))

(declare-fun noDuplicate!1755 (List!27103) Bool)

(assert (=> b!1231654 (= res!819344 (noDuplicate!1755 acc!823))))

(assert (= (and start!102436 res!819347) b!1231648))

(assert (= (and b!1231648 res!819346) b!1231651))

(assert (= (and b!1231651 res!819341) b!1231654))

(assert (= (and b!1231654 res!819344) b!1231652))

(assert (= (and b!1231652 res!819345) b!1231649))

(assert (= (and b!1231649 res!819343) b!1231653))

(assert (= (and b!1231653 res!819342) b!1231650))

(declare-fun m!1136425 () Bool)

(assert (=> start!102436 m!1136425))

(declare-fun m!1136427 () Bool)

(assert (=> b!1231654 m!1136427))

(declare-fun m!1136429 () Bool)

(assert (=> b!1231649 m!1136429))

(declare-fun m!1136431 () Bool)

(assert (=> b!1231653 m!1136431))

(declare-fun m!1136433 () Bool)

(assert (=> b!1231650 m!1136433))

(declare-fun m!1136435 () Bool)

(assert (=> b!1231648 m!1136435))

(declare-fun m!1136437 () Bool)

(assert (=> b!1231652 m!1136437))

(push 1)

(assert (not b!1231652))

(assert (not b!1231650))

(assert (not start!102436))

(assert (not b!1231653))

(assert (not b!1231648))

(assert (not b!1231649))

(assert (not b!1231654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

