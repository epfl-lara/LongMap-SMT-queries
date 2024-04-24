; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103096 () Bool)

(assert start!103096)

(declare-fun b!1237637 () Bool)

(declare-fun e!701648 () Bool)

(assert (=> b!1237637 (= e!701648 false)))

(declare-fun lt!561263 () Bool)

(declare-datatypes ((List!27257 0))(
  ( (Nil!27254) (Cons!27253 (h!28471 (_ BitVec 64)) (t!40712 List!27257)) )
))
(declare-fun acc!846 () List!27257)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7328 (List!27257 (_ BitVec 64)) Bool)

(assert (=> b!1237637 (= lt!561263 (contains!7328 acc!846 k0!2925))))

(declare-fun b!1237638 () Bool)

(declare-fun res!824829 () Bool)

(assert (=> b!1237638 (=> (not res!824829) (not e!701648))))

(declare-datatypes ((array!79739 0))(
  ( (array!79740 (arr!38471 (Array (_ BitVec 32) (_ BitVec 64))) (size!39008 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79739)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79739 (_ BitVec 32) List!27257) Bool)

(assert (=> b!1237638 (= res!824829 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237639 () Bool)

(declare-fun res!824831 () Bool)

(assert (=> b!1237639 (=> (not res!824831) (not e!701648))))

(assert (=> b!1237639 (= res!824831 (not (contains!7328 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237640 () Bool)

(declare-fun res!824832 () Bool)

(assert (=> b!1237640 (=> (not res!824832) (not e!701648))))

(declare-fun noDuplicate!1909 (List!27257) Bool)

(assert (=> b!1237640 (= res!824832 (noDuplicate!1909 acc!846))))

(declare-fun b!1237641 () Bool)

(declare-fun res!824828 () Bool)

(assert (=> b!1237641 (=> (not res!824828) (not e!701648))))

(assert (=> b!1237641 (= res!824828 (not (contains!7328 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824830 () Bool)

(assert (=> start!103096 (=> (not res!824830) (not e!701648))))

(assert (=> start!103096 (= res!824830 (and (bvslt (size!39008 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39008 a!3835))))))

(assert (=> start!103096 e!701648))

(declare-fun array_inv!29409 (array!79739) Bool)

(assert (=> start!103096 (array_inv!29409 a!3835)))

(assert (=> start!103096 true))

(assert (= (and start!103096 res!824830) b!1237640))

(assert (= (and b!1237640 res!824832) b!1237639))

(assert (= (and b!1237639 res!824831) b!1237641))

(assert (= (and b!1237641 res!824828) b!1237638))

(assert (= (and b!1237638 res!824829) b!1237637))

(declare-fun m!1141799 () Bool)

(assert (=> b!1237639 m!1141799))

(declare-fun m!1141801 () Bool)

(assert (=> b!1237637 m!1141801))

(declare-fun m!1141803 () Bool)

(assert (=> b!1237641 m!1141803))

(declare-fun m!1141805 () Bool)

(assert (=> b!1237638 m!1141805))

(declare-fun m!1141807 () Bool)

(assert (=> start!103096 m!1141807))

(declare-fun m!1141809 () Bool)

(assert (=> b!1237640 m!1141809))

(check-sat (not b!1237637) (not b!1237639) (not b!1237640) (not start!103096) (not b!1237638) (not b!1237641))
(check-sat)
