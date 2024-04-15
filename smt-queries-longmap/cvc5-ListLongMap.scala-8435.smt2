; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102746 () Bool)

(assert start!102746)

(declare-fun b!1234495 () Bool)

(declare-fun res!822699 () Bool)

(declare-fun e!700177 () Bool)

(assert (=> b!1234495 (=> res!822699 e!700177)))

(declare-datatypes ((List!27239 0))(
  ( (Nil!27236) (Cons!27235 (h!28444 (_ BitVec 64)) (t!40693 List!27239)) )
))
(declare-fun lt!559733 () List!27239)

(declare-fun contains!7211 (List!27239 (_ BitVec 64)) Bool)

(assert (=> b!1234495 (= res!822699 (contains!7211 lt!559733 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234496 () Bool)

(declare-fun res!822703 () Bool)

(declare-fun e!700176 () Bool)

(assert (=> b!1234496 (=> (not res!822703) (not e!700176))))

(declare-fun acc!846 () List!27239)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234496 (= res!822703 (contains!7211 acc!846 k!2925))))

(declare-fun b!1234497 () Bool)

(declare-fun res!822698 () Bool)

(assert (=> b!1234497 (=> res!822698 e!700177)))

(assert (=> b!1234497 (= res!822698 (contains!7211 lt!559733 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234498 () Bool)

(declare-fun res!822700 () Bool)

(assert (=> b!1234498 (=> (not res!822700) (not e!700176))))

(declare-fun noDuplicate!1854 (List!27239) Bool)

(assert (=> b!1234498 (= res!822700 (noDuplicate!1854 acc!846))))

(declare-fun b!1234499 () Bool)

(declare-fun res!822701 () Bool)

(assert (=> b!1234499 (=> (not res!822701) (not e!700176))))

(assert (=> b!1234499 (= res!822701 (not (contains!7211 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234500 () Bool)

(declare-fun res!822702 () Bool)

(assert (=> b!1234500 (=> (not res!822702) (not e!700176))))

(declare-datatypes ((array!79514 0))(
  ( (array!79515 (arr!38365 (Array (_ BitVec 32) (_ BitVec 64))) (size!38903 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79514)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79514 (_ BitVec 32) List!27239) Bool)

(assert (=> b!1234500 (= res!822702 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234501 () Bool)

(assert (=> b!1234501 (= e!700176 (not e!700177))))

(declare-fun res!822695 () Bool)

(assert (=> b!1234501 (=> res!822695 e!700177)))

(assert (=> b!1234501 (= res!822695 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!511 (List!27239 List!27239) Bool)

(assert (=> b!1234501 (subseq!511 acc!846 lt!559733)))

(declare-datatypes ((Unit!40725 0))(
  ( (Unit!40726) )
))
(declare-fun lt!559735 () Unit!40725)

(declare-fun subseqTail!4 (List!27239 List!27239) Unit!40725)

(assert (=> b!1234501 (= lt!559735 (subseqTail!4 lt!559733 lt!559733))))

(assert (=> b!1234501 (subseq!511 lt!559733 lt!559733)))

(declare-fun lt!559732 () Unit!40725)

(declare-fun lemmaListSubSeqRefl!0 (List!27239) Unit!40725)

(assert (=> b!1234501 (= lt!559732 (lemmaListSubSeqRefl!0 lt!559733))))

(assert (=> b!1234501 (= lt!559733 (Cons!27235 (select (arr!38365 a!3835) from!3213) acc!846))))

(declare-fun res!822704 () Bool)

(assert (=> start!102746 (=> (not res!822704) (not e!700176))))

(assert (=> start!102746 (= res!822704 (and (bvslt (size!38903 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38903 a!3835))))))

(assert (=> start!102746 e!700176))

(declare-fun array_inv!29348 (array!79514) Bool)

(assert (=> start!102746 (array_inv!29348 a!3835)))

(assert (=> start!102746 true))

(declare-fun b!1234502 () Bool)

(declare-fun res!822696 () Bool)

(assert (=> b!1234502 (=> (not res!822696) (not e!700176))))

(assert (=> b!1234502 (= res!822696 (not (= from!3213 (bvsub (size!38903 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234503 () Bool)

(declare-fun res!822694 () Bool)

(assert (=> b!1234503 (=> res!822694 e!700177)))

(assert (=> b!1234503 (= res!822694 (not (noDuplicate!1854 lt!559733)))))

(declare-fun b!1234504 () Bool)

(declare-fun res!822693 () Bool)

(assert (=> b!1234504 (=> (not res!822693) (not e!700176))))

(assert (=> b!1234504 (= res!822693 (not (contains!7211 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234505 () Bool)

(declare-fun res!822697 () Bool)

(assert (=> b!1234505 (=> (not res!822697) (not e!700176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234505 (= res!822697 (validKeyInArray!0 (select (arr!38365 a!3835) from!3213)))))

(declare-fun b!1234506 () Bool)

(assert (=> b!1234506 (= e!700177 true)))

(declare-fun lt!559736 () Bool)

(assert (=> b!1234506 (= lt!559736 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559733))))

(declare-fun lt!559734 () Unit!40725)

(declare-fun noDuplicateSubseq!58 (List!27239 List!27239) Unit!40725)

(assert (=> b!1234506 (= lt!559734 (noDuplicateSubseq!58 acc!846 lt!559733))))

(assert (= (and start!102746 res!822704) b!1234498))

(assert (= (and b!1234498 res!822700) b!1234499))

(assert (= (and b!1234499 res!822701) b!1234504))

(assert (= (and b!1234504 res!822693) b!1234500))

(assert (= (and b!1234500 res!822702) b!1234496))

(assert (= (and b!1234496 res!822703) b!1234502))

(assert (= (and b!1234502 res!822696) b!1234505))

(assert (= (and b!1234505 res!822697) b!1234501))

(assert (= (and b!1234501 (not res!822695)) b!1234503))

(assert (= (and b!1234503 (not res!822694)) b!1234495))

(assert (= (and b!1234495 (not res!822699)) b!1234497))

(assert (= (and b!1234497 (not res!822698)) b!1234506))

(declare-fun m!1137995 () Bool)

(assert (=> b!1234499 m!1137995))

(declare-fun m!1137997 () Bool)

(assert (=> b!1234495 m!1137997))

(declare-fun m!1137999 () Bool)

(assert (=> b!1234500 m!1137999))

(declare-fun m!1138001 () Bool)

(assert (=> b!1234505 m!1138001))

(assert (=> b!1234505 m!1138001))

(declare-fun m!1138003 () Bool)

(assert (=> b!1234505 m!1138003))

(declare-fun m!1138005 () Bool)

(assert (=> b!1234501 m!1138005))

(declare-fun m!1138007 () Bool)

(assert (=> b!1234501 m!1138007))

(declare-fun m!1138009 () Bool)

(assert (=> b!1234501 m!1138009))

(declare-fun m!1138011 () Bool)

(assert (=> b!1234501 m!1138011))

(assert (=> b!1234501 m!1138001))

(declare-fun m!1138013 () Bool)

(assert (=> b!1234498 m!1138013))

(declare-fun m!1138015 () Bool)

(assert (=> b!1234503 m!1138015))

(declare-fun m!1138017 () Bool)

(assert (=> b!1234506 m!1138017))

(declare-fun m!1138019 () Bool)

(assert (=> b!1234506 m!1138019))

(declare-fun m!1138021 () Bool)

(assert (=> b!1234497 m!1138021))

(declare-fun m!1138023 () Bool)

(assert (=> b!1234496 m!1138023))

(declare-fun m!1138025 () Bool)

(assert (=> b!1234504 m!1138025))

(declare-fun m!1138027 () Bool)

(assert (=> start!102746 m!1138027))

(push 1)

(assert (not b!1234503))

(assert (not b!1234504))

(assert (not b!1234497))

(assert (not start!102746))

(assert (not b!1234501))

(assert (not b!1234496))

(assert (not b!1234495))

(assert (not b!1234499))

(assert (not b!1234500))

(assert (not b!1234506))

(assert (not b!1234505))

(assert (not b!1234498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

