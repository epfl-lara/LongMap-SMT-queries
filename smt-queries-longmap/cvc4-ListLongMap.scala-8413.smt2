; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102376 () Bool)

(assert start!102376)

(declare-fun b!1231692 () Bool)

(declare-fun res!820112 () Bool)

(declare-fun e!698688 () Bool)

(assert (=> b!1231692 (=> (not res!820112) (not e!698688))))

(declare-datatypes ((List!27111 0))(
  ( (Nil!27108) (Cons!27107 (h!28316 (_ BitVec 64)) (t!40574 List!27111)) )
))
(declare-fun acc!823 () List!27111)

(declare-fun noDuplicate!1770 (List!27111) Bool)

(assert (=> b!1231692 (= res!820112 (noDuplicate!1770 acc!823))))

(declare-fun b!1231693 () Bool)

(declare-fun res!820114 () Bool)

(assert (=> b!1231693 (=> (not res!820114) (not e!698688))))

(declare-fun contains!7173 (List!27111 (_ BitVec 64)) Bool)

(assert (=> b!1231693 (= res!820114 (not (contains!7173 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231694 () Bool)

(declare-fun res!820106 () Bool)

(assert (=> b!1231694 (=> (not res!820106) (not e!698688))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231694 (= res!820106 (validKeyInArray!0 k!2913))))

(declare-fun b!1231695 () Bool)

(assert (=> b!1231695 (= e!698688 (not true))))

(declare-datatypes ((array!79446 0))(
  ( (array!79447 (arr!38338 (Array (_ BitVec 32) (_ BitVec 64))) (size!38874 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79446)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79446 (_ BitVec 32) List!27111) Bool)

(assert (=> b!1231695 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27108)))

(declare-datatypes ((Unit!40782 0))(
  ( (Unit!40783) )
))
(declare-fun lt!559436 () Unit!40782)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79446 List!27111 List!27111 (_ BitVec 32)) Unit!40782)

(assert (=> b!1231695 (= lt!559436 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27108 from!3184))))

(assert (=> b!1231695 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27107 (select (arr!38338 a!3806) from!3184) acc!823))))

(declare-fun b!1231696 () Bool)

(declare-fun res!820113 () Bool)

(assert (=> b!1231696 (=> (not res!820113) (not e!698688))))

(assert (=> b!1231696 (= res!820113 (validKeyInArray!0 (select (arr!38338 a!3806) from!3184)))))

(declare-fun res!820107 () Bool)

(assert (=> start!102376 (=> (not res!820107) (not e!698688))))

(assert (=> start!102376 (= res!820107 (bvslt (size!38874 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102376 e!698688))

(declare-fun array_inv!29186 (array!79446) Bool)

(assert (=> start!102376 (array_inv!29186 a!3806)))

(assert (=> start!102376 true))

(declare-fun b!1231697 () Bool)

(declare-fun res!820108 () Bool)

(assert (=> b!1231697 (=> (not res!820108) (not e!698688))))

(assert (=> b!1231697 (= res!820108 (not (contains!7173 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231698 () Bool)

(declare-fun res!820110 () Bool)

(assert (=> b!1231698 (=> (not res!820110) (not e!698688))))

(declare-fun arrayContainsKey!0 (array!79446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231698 (= res!820110 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231699 () Bool)

(declare-fun res!820111 () Bool)

(assert (=> b!1231699 (=> (not res!820111) (not e!698688))))

(assert (=> b!1231699 (= res!820111 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38874 a!3806)) (bvslt from!3184 (size!38874 a!3806))))))

(declare-fun b!1231700 () Bool)

(declare-fun res!820109 () Bool)

(assert (=> b!1231700 (=> (not res!820109) (not e!698688))))

(assert (=> b!1231700 (= res!820109 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102376 res!820107) b!1231694))

(assert (= (and b!1231694 res!820106) b!1231699))

(assert (= (and b!1231699 res!820111) b!1231692))

(assert (= (and b!1231692 res!820112) b!1231697))

(assert (= (and b!1231697 res!820108) b!1231693))

(assert (= (and b!1231693 res!820114) b!1231698))

(assert (= (and b!1231698 res!820110) b!1231700))

(assert (= (and b!1231700 res!820109) b!1231696))

(assert (= (and b!1231696 res!820113) b!1231695))

(declare-fun m!1135789 () Bool)

(assert (=> b!1231700 m!1135789))

(declare-fun m!1135791 () Bool)

(assert (=> b!1231698 m!1135791))

(declare-fun m!1135793 () Bool)

(assert (=> b!1231694 m!1135793))

(declare-fun m!1135795 () Bool)

(assert (=> b!1231695 m!1135795))

(declare-fun m!1135797 () Bool)

(assert (=> b!1231695 m!1135797))

(declare-fun m!1135799 () Bool)

(assert (=> b!1231695 m!1135799))

(declare-fun m!1135801 () Bool)

(assert (=> b!1231695 m!1135801))

(declare-fun m!1135803 () Bool)

(assert (=> b!1231693 m!1135803))

(declare-fun m!1135805 () Bool)

(assert (=> b!1231697 m!1135805))

(declare-fun m!1135807 () Bool)

(assert (=> b!1231692 m!1135807))

(assert (=> b!1231696 m!1135799))

(assert (=> b!1231696 m!1135799))

(declare-fun m!1135809 () Bool)

(assert (=> b!1231696 m!1135809))

(declare-fun m!1135811 () Bool)

(assert (=> start!102376 m!1135811))

(push 1)

(assert (not b!1231693))

(assert (not b!1231692))

(assert (not b!1231698))

(assert (not b!1231695))

(assert (not b!1231694))

(assert (not b!1231696))

(assert (not b!1231697))

(assert (not b!1231700))

(assert (not start!102376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

