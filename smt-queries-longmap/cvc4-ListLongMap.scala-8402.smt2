; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102196 () Bool)

(assert start!102196)

(declare-fun b!1230320 () Bool)

(declare-fun res!818811 () Bool)

(declare-fun e!698070 () Bool)

(assert (=> b!1230320 (=> (not res!818811) (not e!698070))))

(declare-datatypes ((List!27078 0))(
  ( (Nil!27075) (Cons!27074 (h!28283 (_ BitVec 64)) (t!40541 List!27078)) )
))
(declare-fun acc!823 () List!27078)

(declare-fun contains!7140 (List!27078 (_ BitVec 64)) Bool)

(assert (=> b!1230320 (= res!818811 (not (contains!7140 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!818810 () Bool)

(assert (=> start!102196 (=> (not res!818810) (not e!698070))))

(declare-datatypes ((array!79371 0))(
  ( (array!79372 (arr!38305 (Array (_ BitVec 32) (_ BitVec 64))) (size!38841 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79371)

(assert (=> start!102196 (= res!818810 (bvslt (size!38841 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102196 e!698070))

(declare-fun array_inv!29153 (array!79371) Bool)

(assert (=> start!102196 (array_inv!29153 a!3806)))

(assert (=> start!102196 true))

(declare-fun b!1230321 () Bool)

(declare-fun res!818808 () Bool)

(assert (=> b!1230321 (=> (not res!818808) (not e!698070))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230321 (= res!818808 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230322 () Bool)

(declare-fun res!818809 () Bool)

(assert (=> b!1230322 (=> (not res!818809) (not e!698070))))

(assert (=> b!1230322 (= res!818809 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38841 a!3806)) (bvslt from!3184 (size!38841 a!3806))))))

(declare-fun b!1230323 () Bool)

(declare-fun res!818806 () Bool)

(assert (=> b!1230323 (=> (not res!818806) (not e!698070))))

(assert (=> b!1230323 (= res!818806 (not (contains!7140 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230324 () Bool)

(declare-fun res!818807 () Bool)

(assert (=> b!1230324 (=> (not res!818807) (not e!698070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230324 (= res!818807 (validKeyInArray!0 k!2913))))

(declare-fun b!1230325 () Bool)

(declare-fun res!818812 () Bool)

(assert (=> b!1230325 (=> (not res!818812) (not e!698070))))

(declare-fun noDuplicate!1737 (List!27078) Bool)

(assert (=> b!1230325 (= res!818812 (noDuplicate!1737 acc!823))))

(declare-fun b!1230326 () Bool)

(assert (=> b!1230326 (= e!698070 false)))

(declare-fun lt!559361 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79371 (_ BitVec 32) List!27078) Bool)

(assert (=> b!1230326 (= lt!559361 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102196 res!818810) b!1230324))

(assert (= (and b!1230324 res!818807) b!1230322))

(assert (= (and b!1230322 res!818809) b!1230325))

(assert (= (and b!1230325 res!818812) b!1230320))

(assert (= (and b!1230320 res!818811) b!1230323))

(assert (= (and b!1230323 res!818806) b!1230321))

(assert (= (and b!1230321 res!818808) b!1230326))

(declare-fun m!1134767 () Bool)

(assert (=> start!102196 m!1134767))

(declare-fun m!1134769 () Bool)

(assert (=> b!1230323 m!1134769))

(declare-fun m!1134771 () Bool)

(assert (=> b!1230320 m!1134771))

(declare-fun m!1134773 () Bool)

(assert (=> b!1230326 m!1134773))

(declare-fun m!1134775 () Bool)

(assert (=> b!1230324 m!1134775))

(declare-fun m!1134777 () Bool)

(assert (=> b!1230325 m!1134777))

(declare-fun m!1134779 () Bool)

(assert (=> b!1230321 m!1134779))

(push 1)

(assert (not b!1230325))

(assert (not b!1230326))

(assert (not start!102196))

(assert (not b!1230320))

(assert (not b!1230321))

(assert (not b!1230324))

(assert (not b!1230323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

