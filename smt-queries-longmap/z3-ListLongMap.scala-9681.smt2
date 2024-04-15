; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114224 () Bool)

(assert start!114224)

(declare-fun b!1356858 () Bool)

(declare-fun e!770181 () Bool)

(assert (=> b!1356858 (= e!770181 (not true))))

(declare-datatypes ((List!31745 0))(
  ( (Nil!31742) (Cons!31741 (h!32950 (_ BitVec 64)) (t!46395 List!31745)) )
))
(declare-fun acc!759 () List!31745)

(declare-fun subseq!803 (List!31745 List!31745) Bool)

(assert (=> b!1356858 (subseq!803 acc!759 acc!759)))

(declare-datatypes ((Unit!44478 0))(
  ( (Unit!44479) )
))
(declare-fun lt!598915 () Unit!44478)

(declare-fun lemmaListSubSeqRefl!0 (List!31745) Unit!44478)

(assert (=> b!1356858 (= lt!598915 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1356859 () Bool)

(declare-fun res!901663 () Bool)

(assert (=> b!1356859 (=> (not res!901663) (not e!770181))))

(declare-fun noDuplicate!2280 (List!31745) Bool)

(assert (=> b!1356859 (= res!901663 (noDuplicate!2280 acc!759))))

(declare-fun b!1356861 () Bool)

(declare-fun res!901658 () Bool)

(assert (=> b!1356861 (=> (not res!901658) (not e!770181))))

(declare-datatypes ((array!92355 0))(
  ( (array!92356 (arr!44626 (Array (_ BitVec 32) (_ BitVec 64))) (size!45178 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92355)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92355 (_ BitVec 32) List!31745) Bool)

(assert (=> b!1356861 (= res!901658 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356862 () Bool)

(declare-fun res!901655 () Bool)

(assert (=> b!1356862 (=> (not res!901655) (not e!770181))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356862 (= res!901655 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356863 () Bool)

(declare-fun res!901661 () Bool)

(assert (=> b!1356863 (=> (not res!901661) (not e!770181))))

(assert (=> b!1356863 (= res!901661 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45178 a!3742)))))

(declare-fun b!1356864 () Bool)

(declare-fun res!901662 () Bool)

(assert (=> b!1356864 (=> (not res!901662) (not e!770181))))

(declare-fun contains!9365 (List!31745 (_ BitVec 64)) Bool)

(assert (=> b!1356864 (= res!901662 (not (contains!9365 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356865 () Bool)

(declare-fun res!901660 () Bool)

(assert (=> b!1356865 (=> (not res!901660) (not e!770181))))

(assert (=> b!1356865 (= res!901660 (not (contains!9365 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356866 () Bool)

(declare-fun res!901657 () Bool)

(assert (=> b!1356866 (=> (not res!901657) (not e!770181))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356866 (= res!901657 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45178 a!3742))))))

(declare-fun b!1356867 () Bool)

(declare-fun res!901664 () Bool)

(assert (=> b!1356867 (=> (not res!901664) (not e!770181))))

(assert (=> b!1356867 (= res!901664 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31742))))

(declare-fun res!901659 () Bool)

(assert (=> start!114224 (=> (not res!901659) (not e!770181))))

(assert (=> start!114224 (= res!901659 (and (bvslt (size!45178 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45178 a!3742))))))

(assert (=> start!114224 e!770181))

(assert (=> start!114224 true))

(declare-fun array_inv!33859 (array!92355) Bool)

(assert (=> start!114224 (array_inv!33859 a!3742)))

(declare-fun b!1356860 () Bool)

(declare-fun res!901656 () Bool)

(assert (=> b!1356860 (=> (not res!901656) (not e!770181))))

(assert (=> b!1356860 (= res!901656 (validKeyInArray!0 (select (arr!44626 a!3742) from!3120)))))

(assert (= (and start!114224 res!901659) b!1356859))

(assert (= (and b!1356859 res!901663) b!1356864))

(assert (= (and b!1356864 res!901662) b!1356865))

(assert (= (and b!1356865 res!901660) b!1356867))

(assert (= (and b!1356867 res!901664) b!1356861))

(assert (= (and b!1356861 res!901658) b!1356866))

(assert (= (and b!1356866 res!901657) b!1356862))

(assert (= (and b!1356862 res!901655) b!1356863))

(assert (= (and b!1356863 res!901661) b!1356860))

(assert (= (and b!1356860 res!901656) b!1356858))

(declare-fun m!1242283 () Bool)

(assert (=> start!114224 m!1242283))

(declare-fun m!1242285 () Bool)

(assert (=> b!1356861 m!1242285))

(declare-fun m!1242287 () Bool)

(assert (=> b!1356864 m!1242287))

(declare-fun m!1242289 () Bool)

(assert (=> b!1356865 m!1242289))

(declare-fun m!1242291 () Bool)

(assert (=> b!1356867 m!1242291))

(declare-fun m!1242293 () Bool)

(assert (=> b!1356858 m!1242293))

(declare-fun m!1242295 () Bool)

(assert (=> b!1356858 m!1242295))

(declare-fun m!1242297 () Bool)

(assert (=> b!1356860 m!1242297))

(assert (=> b!1356860 m!1242297))

(declare-fun m!1242299 () Bool)

(assert (=> b!1356860 m!1242299))

(declare-fun m!1242301 () Bool)

(assert (=> b!1356859 m!1242301))

(declare-fun m!1242303 () Bool)

(assert (=> b!1356862 m!1242303))

(check-sat (not b!1356861) (not b!1356858) (not b!1356864) (not b!1356860) (not b!1356867) (not b!1356865) (not b!1356862) (not b!1356859) (not start!114224))
(check-sat)
