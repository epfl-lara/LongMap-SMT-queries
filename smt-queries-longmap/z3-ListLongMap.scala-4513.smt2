; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62548 () Bool)

(assert start!62548)

(declare-fun b!704998 () Bool)

(declare-fun res!468824 () Bool)

(declare-fun e!397783 () Bool)

(assert (=> b!704998 (=> (not res!468824) (not e!397783))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704998 (= res!468824 (validKeyInArray!0 k0!2824))))

(declare-fun b!704999 () Bool)

(declare-fun res!468812 () Bool)

(assert (=> b!704999 (=> (not res!468812) (not e!397783))))

(declare-datatypes ((List!13311 0))(
  ( (Nil!13308) (Cons!13307 (h!14352 (_ BitVec 64)) (t!19593 List!13311)) )
))
(declare-fun acc!652 () List!13311)

(declare-fun contains!3888 (List!13311 (_ BitVec 64)) Bool)

(assert (=> b!704999 (= res!468812 (not (contains!3888 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705001 () Bool)

(declare-fun res!468818 () Bool)

(assert (=> b!705001 (=> (not res!468818) (not e!397783))))

(declare-datatypes ((array!40227 0))(
  ( (array!40228 (arr!19270 (Array (_ BitVec 32) (_ BitVec 64))) (size!19655 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40227)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705001 (= res!468818 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705002 () Bool)

(assert (=> b!705002 (= e!397783 false)))

(declare-fun lt!317874 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40227 (_ BitVec 32) List!13311) Bool)

(assert (=> b!705002 (= lt!317874 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705003 () Bool)

(declare-fun res!468825 () Bool)

(assert (=> b!705003 (=> (not res!468825) (not e!397783))))

(assert (=> b!705003 (= res!468825 (not (validKeyInArray!0 (select (arr!19270 a!3591) from!2969))))))

(declare-fun b!705004 () Bool)

(declare-fun res!468808 () Bool)

(assert (=> b!705004 (=> (not res!468808) (not e!397783))))

(assert (=> b!705004 (= res!468808 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705005 () Bool)

(declare-fun res!468814 () Bool)

(assert (=> b!705005 (=> (not res!468814) (not e!397783))))

(declare-fun newAcc!49 () List!13311)

(declare-fun -!298 (List!13311 (_ BitVec 64)) List!13311)

(assert (=> b!705005 (= res!468814 (= (-!298 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705000 () Bool)

(declare-fun res!468809 () Bool)

(assert (=> b!705000 (=> (not res!468809) (not e!397783))))

(declare-fun subseq!333 (List!13311 List!13311) Bool)

(assert (=> b!705000 (= res!468809 (subseq!333 acc!652 newAcc!49))))

(declare-fun res!468820 () Bool)

(assert (=> start!62548 (=> (not res!468820) (not e!397783))))

(assert (=> start!62548 (= res!468820 (and (bvslt (size!19655 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19655 a!3591))))))

(assert (=> start!62548 e!397783))

(assert (=> start!62548 true))

(declare-fun array_inv!15066 (array!40227) Bool)

(assert (=> start!62548 (array_inv!15066 a!3591)))

(declare-fun b!705006 () Bool)

(declare-fun res!468815 () Bool)

(assert (=> b!705006 (=> (not res!468815) (not e!397783))))

(assert (=> b!705006 (= res!468815 (not (contains!3888 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705007 () Bool)

(declare-fun res!468819 () Bool)

(assert (=> b!705007 (=> (not res!468819) (not e!397783))))

(assert (=> b!705007 (= res!468819 (contains!3888 newAcc!49 k0!2824))))

(declare-fun b!705008 () Bool)

(declare-fun res!468810 () Bool)

(assert (=> b!705008 (=> (not res!468810) (not e!397783))))

(declare-fun noDuplicate!1135 (List!13311) Bool)

(assert (=> b!705008 (= res!468810 (noDuplicate!1135 acc!652))))

(declare-fun b!705009 () Bool)

(declare-fun res!468817 () Bool)

(assert (=> b!705009 (=> (not res!468817) (not e!397783))))

(assert (=> b!705009 (= res!468817 (not (contains!3888 acc!652 k0!2824)))))

(declare-fun b!705010 () Bool)

(declare-fun res!468811 () Bool)

(assert (=> b!705010 (=> (not res!468811) (not e!397783))))

(assert (=> b!705010 (= res!468811 (noDuplicate!1135 newAcc!49))))

(declare-fun b!705011 () Bool)

(declare-fun res!468822 () Bool)

(assert (=> b!705011 (=> (not res!468822) (not e!397783))))

(assert (=> b!705011 (= res!468822 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705012 () Bool)

(declare-fun res!468816 () Bool)

(assert (=> b!705012 (=> (not res!468816) (not e!397783))))

(assert (=> b!705012 (= res!468816 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19655 a!3591)))))

(declare-fun b!705013 () Bool)

(declare-fun res!468823 () Bool)

(assert (=> b!705013 (=> (not res!468823) (not e!397783))))

(assert (=> b!705013 (= res!468823 (not (contains!3888 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705014 () Bool)

(declare-fun res!468821 () Bool)

(assert (=> b!705014 (=> (not res!468821) (not e!397783))))

(assert (=> b!705014 (= res!468821 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705015 () Bool)

(declare-fun res!468813 () Bool)

(assert (=> b!705015 (=> (not res!468813) (not e!397783))))

(assert (=> b!705015 (= res!468813 (not (contains!3888 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62548 res!468820) b!705008))

(assert (= (and b!705008 res!468810) b!705010))

(assert (= (and b!705010 res!468811) b!704999))

(assert (= (and b!704999 res!468812) b!705006))

(assert (= (and b!705006 res!468815) b!705014))

(assert (= (and b!705014 res!468821) b!705009))

(assert (= (and b!705009 res!468817) b!704998))

(assert (= (and b!704998 res!468824) b!705004))

(assert (= (and b!705004 res!468808) b!705000))

(assert (= (and b!705000 res!468809) b!705007))

(assert (= (and b!705007 res!468819) b!705005))

(assert (= (and b!705005 res!468814) b!705013))

(assert (= (and b!705013 res!468823) b!705015))

(assert (= (and b!705015 res!468813) b!705012))

(assert (= (and b!705012 res!468816) b!705003))

(assert (= (and b!705003 res!468825) b!705011))

(assert (= (and b!705011 res!468822) b!705001))

(assert (= (and b!705001 res!468818) b!705002))

(declare-fun m!663307 () Bool)

(assert (=> b!705001 m!663307))

(declare-fun m!663309 () Bool)

(assert (=> b!705007 m!663309))

(declare-fun m!663311 () Bool)

(assert (=> b!705005 m!663311))

(declare-fun m!663313 () Bool)

(assert (=> start!62548 m!663313))

(declare-fun m!663315 () Bool)

(assert (=> b!705003 m!663315))

(assert (=> b!705003 m!663315))

(declare-fun m!663317 () Bool)

(assert (=> b!705003 m!663317))

(declare-fun m!663319 () Bool)

(assert (=> b!705006 m!663319))

(declare-fun m!663321 () Bool)

(assert (=> b!705014 m!663321))

(declare-fun m!663323 () Bool)

(assert (=> b!705010 m!663323))

(declare-fun m!663325 () Bool)

(assert (=> b!705009 m!663325))

(declare-fun m!663327 () Bool)

(assert (=> b!704999 m!663327))

(declare-fun m!663329 () Bool)

(assert (=> b!705008 m!663329))

(declare-fun m!663331 () Bool)

(assert (=> b!704998 m!663331))

(declare-fun m!663333 () Bool)

(assert (=> b!705013 m!663333))

(declare-fun m!663335 () Bool)

(assert (=> b!705000 m!663335))

(declare-fun m!663337 () Bool)

(assert (=> b!705004 m!663337))

(declare-fun m!663339 () Bool)

(assert (=> b!705015 m!663339))

(declare-fun m!663341 () Bool)

(assert (=> b!705002 m!663341))

(check-sat (not b!705013) (not b!705001) (not b!705004) (not b!705000) (not b!705002) (not b!705003) (not b!705005) (not start!62548) (not b!705014) (not b!704999) (not b!704998) (not b!705010) (not b!705007) (not b!705009) (not b!705006) (not b!705008) (not b!705015))
(check-sat)
