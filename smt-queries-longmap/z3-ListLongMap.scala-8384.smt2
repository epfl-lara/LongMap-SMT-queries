; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101982 () Bool)

(assert start!101982)

(declare-fun b!1227832 () Bool)

(declare-fun res!816451 () Bool)

(declare-fun e!697075 () Bool)

(assert (=> b!1227832 (=> (not res!816451) (not e!697075))))

(declare-datatypes ((array!79255 0))(
  ( (array!79256 (arr!38250 (Array (_ BitVec 32) (_ BitVec 64))) (size!38786 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79255)

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227832 (= res!816451 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227833 () Bool)

(declare-fun res!816454 () Bool)

(assert (=> b!1227833 (=> (not res!816454) (not e!697075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227833 (= res!816454 (validKeyInArray!0 k0!2913))))

(declare-fun b!1227834 () Bool)

(declare-fun e!697076 () Bool)

(assert (=> b!1227834 (= e!697075 (not e!697076))))

(declare-fun res!816453 () Bool)

(assert (=> b!1227834 (=> res!816453 e!697076)))

(assert (=> b!1227834 (= res!816453 (bvsgt from!3184 (size!38786 a!3806)))))

(declare-datatypes ((List!27023 0))(
  ( (Nil!27020) (Cons!27019 (h!28228 (_ BitVec 64)) (t!40486 List!27023)) )
))
(declare-fun acc!823 () List!27023)

(declare-fun arrayNoDuplicates!0 (array!79255 (_ BitVec 32) List!27023) Bool)

(assert (=> b!1227834 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27019 (select (arr!38250 a!3806) from!3184) acc!823))))

(declare-fun b!1227835 () Bool)

(declare-fun res!816450 () Bool)

(assert (=> b!1227835 (=> (not res!816450) (not e!697075))))

(assert (=> b!1227835 (= res!816450 (validKeyInArray!0 (select (arr!38250 a!3806) from!3184)))))

(declare-fun b!1227836 () Bool)

(declare-fun res!816455 () Bool)

(assert (=> b!1227836 (=> (not res!816455) (not e!697075))))

(declare-fun contains!7085 (List!27023 (_ BitVec 64)) Bool)

(assert (=> b!1227836 (= res!816455 (not (contains!7085 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227837 () Bool)

(declare-fun res!816447 () Bool)

(assert (=> b!1227837 (=> (not res!816447) (not e!697075))))

(declare-fun noDuplicate!1682 (List!27023) Bool)

(assert (=> b!1227837 (= res!816447 (noDuplicate!1682 acc!823))))

(declare-fun b!1227838 () Bool)

(declare-fun res!816456 () Bool)

(assert (=> b!1227838 (=> res!816456 e!697076)))

(assert (=> b!1227838 (= res!816456 (contains!7085 Nil!27020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227839 () Bool)

(declare-fun res!816452 () Bool)

(assert (=> b!1227839 (=> res!816452 e!697076)))

(declare-fun subseq!489 (List!27023 List!27023) Bool)

(assert (=> b!1227839 (= res!816452 (not (subseq!489 Nil!27020 acc!823)))))

(declare-fun b!1227840 () Bool)

(declare-fun res!816448 () Bool)

(assert (=> b!1227840 (=> (not res!816448) (not e!697075))))

(assert (=> b!1227840 (= res!816448 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227841 () Bool)

(declare-fun res!816445 () Bool)

(assert (=> b!1227841 (=> res!816445 e!697076)))

(assert (=> b!1227841 (= res!816445 (contains!7085 Nil!27020 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227842 () Bool)

(declare-fun res!816446 () Bool)

(assert (=> b!1227842 (=> (not res!816446) (not e!697075))))

(assert (=> b!1227842 (= res!816446 (not (contains!7085 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816444 () Bool)

(assert (=> start!101982 (=> (not res!816444) (not e!697075))))

(assert (=> start!101982 (= res!816444 (bvslt (size!38786 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101982 e!697075))

(declare-fun array_inv!29098 (array!79255) Bool)

(assert (=> start!101982 (array_inv!29098 a!3806)))

(assert (=> start!101982 true))

(declare-fun b!1227843 () Bool)

(declare-fun res!816449 () Bool)

(assert (=> b!1227843 (=> (not res!816449) (not e!697075))))

(assert (=> b!1227843 (= res!816449 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38786 a!3806)) (bvslt from!3184 (size!38786 a!3806))))))

(declare-fun b!1227844 () Bool)

(assert (=> b!1227844 (= e!697076 true)))

(declare-datatypes ((Unit!40666 0))(
  ( (Unit!40667) )
))
(declare-fun lt!558945 () Unit!40666)

(declare-fun noDuplicateSubseq!42 (List!27023 List!27023) Unit!40666)

(assert (=> b!1227844 (= lt!558945 (noDuplicateSubseq!42 Nil!27020 acc!823))))

(assert (= (and start!101982 res!816444) b!1227833))

(assert (= (and b!1227833 res!816454) b!1227843))

(assert (= (and b!1227843 res!816449) b!1227837))

(assert (= (and b!1227837 res!816447) b!1227836))

(assert (= (and b!1227836 res!816455) b!1227842))

(assert (= (and b!1227842 res!816446) b!1227832))

(assert (= (and b!1227832 res!816451) b!1227840))

(assert (= (and b!1227840 res!816448) b!1227835))

(assert (= (and b!1227835 res!816450) b!1227834))

(assert (= (and b!1227834 (not res!816453)) b!1227838))

(assert (= (and b!1227838 (not res!816456)) b!1227841))

(assert (= (and b!1227841 (not res!816445)) b!1227839))

(assert (= (and b!1227839 (not res!816452)) b!1227844))

(declare-fun m!1132507 () Bool)

(assert (=> b!1227839 m!1132507))

(declare-fun m!1132509 () Bool)

(assert (=> b!1227838 m!1132509))

(declare-fun m!1132511 () Bool)

(assert (=> b!1227840 m!1132511))

(declare-fun m!1132513 () Bool)

(assert (=> b!1227835 m!1132513))

(assert (=> b!1227835 m!1132513))

(declare-fun m!1132515 () Bool)

(assert (=> b!1227835 m!1132515))

(declare-fun m!1132517 () Bool)

(assert (=> b!1227837 m!1132517))

(declare-fun m!1132519 () Bool)

(assert (=> b!1227841 m!1132519))

(declare-fun m!1132521 () Bool)

(assert (=> b!1227844 m!1132521))

(declare-fun m!1132523 () Bool)

(assert (=> b!1227836 m!1132523))

(declare-fun m!1132525 () Bool)

(assert (=> b!1227833 m!1132525))

(declare-fun m!1132527 () Bool)

(assert (=> b!1227842 m!1132527))

(declare-fun m!1132529 () Bool)

(assert (=> start!101982 m!1132529))

(declare-fun m!1132531 () Bool)

(assert (=> b!1227832 m!1132531))

(assert (=> b!1227834 m!1132513))

(declare-fun m!1132533 () Bool)

(assert (=> b!1227834 m!1132533))

(check-sat (not b!1227840) (not b!1227832) (not b!1227844) (not b!1227838) (not b!1227837) (not b!1227833) (not b!1227835) (not b!1227839) (not start!101982) (not b!1227841) (not b!1227834) (not b!1227842) (not b!1227836))
(check-sat)
