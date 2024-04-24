; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102064 () Bool)

(assert start!102064)

(declare-fun b!1227762 () Bool)

(declare-fun res!815630 () Bool)

(declare-fun e!697385 () Bool)

(assert (=> b!1227762 (=> (not res!815630) (not e!697385))))

(declare-datatypes ((List!27007 0))(
  ( (Nil!27004) (Cons!27003 (h!28221 (_ BitVec 64)) (t!40462 List!27007)) )
))
(declare-fun acc!823 () List!27007)

(declare-fun contains!7078 (List!27007 (_ BitVec 64)) Bool)

(assert (=> b!1227762 (= res!815630 (not (contains!7078 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!815633 () Bool)

(assert (=> start!102064 (=> (not res!815633) (not e!697385))))

(declare-datatypes ((array!79203 0))(
  ( (array!79204 (arr!38221 (Array (_ BitVec 32) (_ BitVec 64))) (size!38758 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79203)

(assert (=> start!102064 (= res!815633 (bvslt (size!38758 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102064 e!697385))

(declare-fun array_inv!29159 (array!79203) Bool)

(assert (=> start!102064 (array_inv!29159 a!3806)))

(assert (=> start!102064 true))

(declare-fun b!1227763 () Bool)

(declare-fun res!815629 () Bool)

(assert (=> b!1227763 (=> (not res!815629) (not e!697385))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1227763 (= res!815629 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38758 a!3806)) (bvslt from!3184 (size!38758 a!3806))))))

(declare-fun b!1227764 () Bool)

(assert (=> b!1227764 (= e!697385 false)))

(declare-fun lt!559299 () Bool)

(assert (=> b!1227764 (= lt!559299 (contains!7078 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227765 () Bool)

(declare-fun res!815631 () Bool)

(assert (=> b!1227765 (=> (not res!815631) (not e!697385))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227765 (= res!815631 (validKeyInArray!0 k!2913))))

(declare-fun b!1227766 () Bool)

(declare-fun res!815632 () Bool)

(assert (=> b!1227766 (=> (not res!815632) (not e!697385))))

(declare-fun noDuplicate!1659 (List!27007) Bool)

(assert (=> b!1227766 (= res!815632 (noDuplicate!1659 acc!823))))

(assert (= (and start!102064 res!815633) b!1227765))

(assert (= (and b!1227765 res!815631) b!1227763))

(assert (= (and b!1227763 res!815629) b!1227766))

(assert (= (and b!1227766 res!815632) b!1227762))

(assert (= (and b!1227762 res!815630) b!1227764))

(declare-fun m!1133153 () Bool)

(assert (=> b!1227765 m!1133153))

(declare-fun m!1133155 () Bool)

(assert (=> start!102064 m!1133155))

(declare-fun m!1133157 () Bool)

(assert (=> b!1227766 m!1133157))

(declare-fun m!1133159 () Bool)

(assert (=> b!1227762 m!1133159))

(declare-fun m!1133161 () Bool)

(assert (=> b!1227764 m!1133161))

(push 1)

(assert (not b!1227762))

(assert (not b!1227766))

(assert (not b!1227765))

(assert (not b!1227764))

(assert (not start!102064))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

