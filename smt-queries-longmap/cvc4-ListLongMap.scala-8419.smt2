; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102454 () Bool)

(assert start!102454)

(declare-fun b!1232372 () Bool)

(declare-fun res!820757 () Bool)

(declare-fun e!698972 () Bool)

(assert (=> b!1232372 (=> (not res!820757) (not e!698972))))

(declare-datatypes ((List!27129 0))(
  ( (Nil!27126) (Cons!27125 (h!28334 (_ BitVec 64)) (t!40592 List!27129)) )
))
(declare-fun acc!823 () List!27129)

(declare-fun noDuplicate!1788 (List!27129) Bool)

(assert (=> b!1232372 (= res!820757 (noDuplicate!1788 acc!823))))

(declare-fun b!1232373 () Bool)

(declare-fun res!820752 () Bool)

(assert (=> b!1232373 (=> (not res!820752) (not e!698972))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232373 (= res!820752 (validKeyInArray!0 k!2913))))

(declare-fun b!1232374 () Bool)

(declare-fun e!698973 () Bool)

(declare-datatypes ((array!79485 0))(
  ( (array!79486 (arr!38356 (Array (_ BitVec 32) (_ BitVec 64))) (size!38892 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79485)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79485 (_ BitVec 32) List!27129) Bool)

(assert (=> b!1232374 (= e!698973 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27125 (select (arr!38356 a!3806) from!3184) Nil!27126)))))

(declare-fun b!1232375 () Bool)

(declare-fun res!820753 () Bool)

(assert (=> b!1232375 (=> (not res!820753) (not e!698972))))

(assert (=> b!1232375 (= res!820753 (validKeyInArray!0 (select (arr!38356 a!3806) from!3184)))))

(declare-fun b!1232376 () Bool)

(declare-fun res!820754 () Bool)

(assert (=> b!1232376 (=> (not res!820754) (not e!698972))))

(assert (=> b!1232376 (= res!820754 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38892 a!3806)) (bvslt from!3184 (size!38892 a!3806))))))

(declare-fun b!1232377 () Bool)

(declare-fun res!820750 () Bool)

(assert (=> b!1232377 (=> (not res!820750) (not e!698972))))

(assert (=> b!1232377 (= res!820750 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232379 () Bool)

(declare-fun res!820751 () Bool)

(assert (=> b!1232379 (=> (not res!820751) (not e!698972))))

(declare-fun contains!7191 (List!27129 (_ BitVec 64)) Bool)

(assert (=> b!1232379 (= res!820751 (not (contains!7191 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232380 () Bool)

(declare-fun res!820756 () Bool)

(assert (=> b!1232380 (=> (not res!820756) (not e!698972))))

(assert (=> b!1232380 (= res!820756 (not (contains!7191 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232381 () Bool)

(declare-fun res!820758 () Bool)

(assert (=> b!1232381 (=> (not res!820758) (not e!698972))))

(declare-fun arrayContainsKey!0 (array!79485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232381 (= res!820758 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!820759 () Bool)

(assert (=> start!102454 (=> (not res!820759) (not e!698972))))

(assert (=> start!102454 (= res!820759 (bvslt (size!38892 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102454 e!698972))

(declare-fun array_inv!29204 (array!79485) Bool)

(assert (=> start!102454 (array_inv!29204 a!3806)))

(assert (=> start!102454 true))

(declare-fun b!1232378 () Bool)

(assert (=> b!1232378 (= e!698972 (not true))))

(assert (=> b!1232378 e!698973))

(declare-fun res!820755 () Bool)

(assert (=> b!1232378 (=> (not res!820755) (not e!698973))))

(assert (=> b!1232378 (= res!820755 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27126))))

(declare-datatypes ((Unit!40818 0))(
  ( (Unit!40819) )
))
(declare-fun lt!559511 () Unit!40818)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79485 List!27129 List!27129 (_ BitVec 32)) Unit!40818)

(assert (=> b!1232378 (= lt!559511 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27126 from!3184))))

(assert (=> b!1232378 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27125 (select (arr!38356 a!3806) from!3184) acc!823))))

(assert (= (and start!102454 res!820759) b!1232373))

(assert (= (and b!1232373 res!820752) b!1232376))

(assert (= (and b!1232376 res!820754) b!1232372))

(assert (= (and b!1232372 res!820757) b!1232379))

(assert (= (and b!1232379 res!820751) b!1232380))

(assert (= (and b!1232380 res!820756) b!1232381))

(assert (= (and b!1232381 res!820758) b!1232377))

(assert (= (and b!1232377 res!820750) b!1232375))

(assert (= (and b!1232375 res!820753) b!1232378))

(assert (= (and b!1232378 res!820755) b!1232374))

(declare-fun m!1136369 () Bool)

(assert (=> b!1232374 m!1136369))

(declare-fun m!1136371 () Bool)

(assert (=> b!1232374 m!1136371))

(declare-fun m!1136373 () Bool)

(assert (=> b!1232380 m!1136373))

(declare-fun m!1136375 () Bool)

(assert (=> start!102454 m!1136375))

(declare-fun m!1136377 () Bool)

(assert (=> b!1232381 m!1136377))

(declare-fun m!1136379 () Bool)

(assert (=> b!1232378 m!1136379))

(declare-fun m!1136381 () Bool)

(assert (=> b!1232378 m!1136381))

(assert (=> b!1232378 m!1136369))

(declare-fun m!1136383 () Bool)

(assert (=> b!1232378 m!1136383))

(declare-fun m!1136385 () Bool)

(assert (=> b!1232379 m!1136385))

(assert (=> b!1232375 m!1136369))

(assert (=> b!1232375 m!1136369))

(declare-fun m!1136387 () Bool)

(assert (=> b!1232375 m!1136387))

(declare-fun m!1136389 () Bool)

(assert (=> b!1232373 m!1136389))

(declare-fun m!1136391 () Bool)

(assert (=> b!1232377 m!1136391))

(declare-fun m!1136393 () Bool)

(assert (=> b!1232372 m!1136393))

(push 1)

(assert (not b!1232379))

(assert (not b!1232381))

(assert (not b!1232372))

(assert (not start!102454))

(assert (not b!1232380))

(assert (not b!1232374))

(assert (not b!1232378))

(assert (not b!1232373))

(assert (not b!1232377))

(assert (not b!1232375))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

