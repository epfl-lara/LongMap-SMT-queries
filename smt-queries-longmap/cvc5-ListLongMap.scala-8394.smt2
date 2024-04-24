; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102388 () Bool)

(assert start!102388)

(declare-fun b!1230804 () Bool)

(declare-fun res!818508 () Bool)

(declare-fun e!698692 () Bool)

(assert (=> b!1230804 (=> res!818508 e!698692)))

(declare-datatypes ((List!27079 0))(
  ( (Nil!27076) (Cons!27075 (h!28293 (_ BitVec 64)) (t!40534 List!27079)) )
))
(declare-fun lt!559675 () List!27079)

(declare-fun contains!7150 (List!27079 (_ BitVec 64)) Bool)

(assert (=> b!1230804 (= res!818508 (contains!7150 lt!559675 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230805 () Bool)

(declare-fun res!818497 () Bool)

(assert (=> b!1230805 (=> res!818497 e!698692)))

(declare-fun noDuplicate!1731 (List!27079) Bool)

(assert (=> b!1230805 (= res!818497 (not (noDuplicate!1731 lt!559675)))))

(declare-fun b!1230806 () Bool)

(declare-fun res!818506 () Bool)

(declare-fun e!698691 () Bool)

(assert (=> b!1230806 (=> (not res!818506) (not e!698691))))

(declare-fun acc!823 () List!27079)

(assert (=> b!1230806 (= res!818506 (not (contains!7150 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230807 () Bool)

(declare-fun res!818504 () Bool)

(assert (=> b!1230807 (=> (not res!818504) (not e!698691))))

(assert (=> b!1230807 (= res!818504 (not (contains!7150 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!818502 () Bool)

(assert (=> start!102388 (=> (not res!818502) (not e!698691))))

(declare-datatypes ((array!79359 0))(
  ( (array!79360 (arr!38293 (Array (_ BitVec 32) (_ BitVec 64))) (size!38830 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79359)

(assert (=> start!102388 (= res!818502 (bvslt (size!38830 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102388 e!698691))

(declare-fun array_inv!29231 (array!79359) Bool)

(assert (=> start!102388 (array_inv!29231 a!3806)))

(assert (=> start!102388 true))

(declare-fun b!1230808 () Bool)

(declare-fun res!818509 () Bool)

(assert (=> b!1230808 (=> (not res!818509) (not e!698691))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230808 (= res!818509 (validKeyInArray!0 (select (arr!38293 a!3806) from!3184)))))

(declare-fun b!1230809 () Bool)

(assert (=> b!1230809 (= e!698691 (not e!698692))))

(declare-fun res!818505 () Bool)

(assert (=> b!1230809 (=> res!818505 e!698692)))

(assert (=> b!1230809 (= res!818505 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1230809 (= lt!559675 (Cons!27075 (select (arr!38293 a!3806) from!3184) Nil!27076))))

(declare-fun e!698693 () Bool)

(assert (=> b!1230809 e!698693))

(declare-fun res!818498 () Bool)

(assert (=> b!1230809 (=> (not res!818498) (not e!698693))))

(declare-fun arrayNoDuplicates!0 (array!79359 (_ BitVec 32) List!27079) Bool)

(assert (=> b!1230809 (= res!818498 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27076))))

(declare-datatypes ((Unit!40701 0))(
  ( (Unit!40702) )
))
(declare-fun lt!559676 () Unit!40701)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79359 List!27079 List!27079 (_ BitVec 32)) Unit!40701)

(assert (=> b!1230809 (= lt!559676 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27076 from!3184))))

(assert (=> b!1230809 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27075 (select (arr!38293 a!3806) from!3184) acc!823))))

(declare-fun b!1230810 () Bool)

(declare-fun res!818503 () Bool)

(assert (=> b!1230810 (=> (not res!818503) (not e!698691))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1230810 (= res!818503 (validKeyInArray!0 k!2913))))

(declare-fun b!1230811 () Bool)

(assert (=> b!1230811 (= e!698693 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27075 (select (arr!38293 a!3806) from!3184) Nil!27076)))))

(declare-fun b!1230812 () Bool)

(declare-fun res!818510 () Bool)

(assert (=> b!1230812 (=> (not res!818510) (not e!698691))))

(assert (=> b!1230812 (= res!818510 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38830 a!3806)) (bvslt from!3184 (size!38830 a!3806))))))

(declare-fun b!1230813 () Bool)

(declare-fun res!818501 () Bool)

(assert (=> b!1230813 (=> (not res!818501) (not e!698691))))

(declare-fun arrayContainsKey!0 (array!79359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230813 (= res!818501 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230814 () Bool)

(declare-fun res!818500 () Bool)

(assert (=> b!1230814 (=> res!818500 e!698692)))

(assert (=> b!1230814 (= res!818500 (contains!7150 lt!559675 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230815 () Bool)

(declare-fun res!818499 () Bool)

(assert (=> b!1230815 (=> (not res!818499) (not e!698691))))

(assert (=> b!1230815 (= res!818499 (noDuplicate!1731 acc!823))))

(declare-fun b!1230816 () Bool)

(declare-fun res!818507 () Bool)

(assert (=> b!1230816 (=> (not res!818507) (not e!698691))))

(assert (=> b!1230816 (= res!818507 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230817 () Bool)

(assert (=> b!1230817 (= e!698692 true)))

(declare-fun lt!559677 () Bool)

(assert (=> b!1230817 (= lt!559677 (contains!7150 lt!559675 (select (arr!38293 a!3806) from!3184)))))

(assert (= (and start!102388 res!818502) b!1230810))

(assert (= (and b!1230810 res!818503) b!1230812))

(assert (= (and b!1230812 res!818510) b!1230815))

(assert (= (and b!1230815 res!818499) b!1230807))

(assert (= (and b!1230807 res!818504) b!1230806))

(assert (= (and b!1230806 res!818506) b!1230813))

(assert (= (and b!1230813 res!818501) b!1230816))

(assert (= (and b!1230816 res!818507) b!1230808))

(assert (= (and b!1230808 res!818509) b!1230809))

(assert (= (and b!1230809 res!818498) b!1230811))

(assert (= (and b!1230809 (not res!818505)) b!1230805))

(assert (= (and b!1230805 (not res!818497)) b!1230814))

(assert (= (and b!1230814 (not res!818500)) b!1230804))

(assert (= (and b!1230804 (not res!818508)) b!1230817))

(declare-fun m!1135685 () Bool)

(assert (=> b!1230809 m!1135685))

(declare-fun m!1135687 () Bool)

(assert (=> b!1230809 m!1135687))

(declare-fun m!1135689 () Bool)

(assert (=> b!1230809 m!1135689))

(declare-fun m!1135691 () Bool)

(assert (=> b!1230809 m!1135691))

(assert (=> b!1230817 m!1135685))

(assert (=> b!1230817 m!1135685))

(declare-fun m!1135693 () Bool)

(assert (=> b!1230817 m!1135693))

(declare-fun m!1135695 () Bool)

(assert (=> b!1230814 m!1135695))

(assert (=> b!1230811 m!1135685))

(declare-fun m!1135697 () Bool)

(assert (=> b!1230811 m!1135697))

(declare-fun m!1135699 () Bool)

(assert (=> b!1230805 m!1135699))

(assert (=> b!1230808 m!1135685))

(assert (=> b!1230808 m!1135685))

(declare-fun m!1135701 () Bool)

(assert (=> b!1230808 m!1135701))

(declare-fun m!1135703 () Bool)

(assert (=> b!1230807 m!1135703))

(declare-fun m!1135705 () Bool)

(assert (=> start!102388 m!1135705))

(declare-fun m!1135707 () Bool)

(assert (=> b!1230815 m!1135707))

(declare-fun m!1135709 () Bool)

(assert (=> b!1230806 m!1135709))

(declare-fun m!1135711 () Bool)

(assert (=> b!1230804 m!1135711))

(declare-fun m!1135713 () Bool)

(assert (=> b!1230810 m!1135713))

(declare-fun m!1135715 () Bool)

(assert (=> b!1230813 m!1135715))

(declare-fun m!1135717 () Bool)

(assert (=> b!1230816 m!1135717))

(push 1)

(assert (not b!1230814))

(assert (not b!1230805))

(assert (not b!1230817))

(assert (not b!1230816))

(assert (not start!102388))

(assert (not b!1230810))

(assert (not b!1230811))

(assert (not b!1230808))

(assert (not b!1230804))

(assert (not b!1230806))

(assert (not b!1230815))

(assert (not b!1230807))

(assert (not b!1230813))

(assert (not b!1230809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

