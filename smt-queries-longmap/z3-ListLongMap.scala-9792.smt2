; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116278 () Bool)

(assert start!116278)

(declare-fun res!916027 () Bool)

(declare-fun e!777682 () Bool)

(assert (=> start!116278 (=> (not res!916027) (not e!777682))))

(declare-datatypes ((array!93095 0))(
  ( (array!93096 (arr!44958 (Array (_ BitVec 32) (_ BitVec 64))) (size!45508 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93095)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116278 (= res!916027 (and (bvslt (size!45508 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45508 a!3861))))))

(assert (=> start!116278 e!777682))

(declare-fun array_inv!33986 (array!93095) Bool)

(assert (=> start!116278 (array_inv!33986 a!3861)))

(assert (=> start!116278 true))

(declare-fun b!1372753 () Bool)

(declare-fun res!916024 () Bool)

(assert (=> b!1372753 (=> (not res!916024) (not e!777682))))

(declare-datatypes ((List!32026 0))(
  ( (Nil!32023) (Cons!32022 (h!33231 (_ BitVec 64)) (t!46720 List!32026)) )
))
(declare-fun newAcc!98 () List!32026)

(declare-fun acc!866 () List!32026)

(declare-fun subseq!1110 (List!32026 List!32026) Bool)

(assert (=> b!1372753 (= res!916024 (subseq!1110 newAcc!98 acc!866))))

(declare-fun b!1372754 () Bool)

(declare-fun res!916023 () Bool)

(assert (=> b!1372754 (=> (not res!916023) (not e!777682))))

(declare-fun noDuplicate!2565 (List!32026) Bool)

(assert (=> b!1372754 (= res!916023 (noDuplicate!2565 acc!866))))

(declare-fun b!1372755 () Bool)

(declare-fun res!916022 () Bool)

(assert (=> b!1372755 (=> (not res!916022) (not e!777682))))

(declare-fun contains!9708 (List!32026 (_ BitVec 64)) Bool)

(assert (=> b!1372755 (= res!916022 (not (contains!9708 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372756 () Bool)

(declare-fun res!916021 () Bool)

(assert (=> b!1372756 (=> (not res!916021) (not e!777682))))

(assert (=> b!1372756 (= res!916021 (not (contains!9708 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372757 () Bool)

(declare-fun res!916026 () Bool)

(assert (=> b!1372757 (=> (not res!916026) (not e!777682))))

(assert (=> b!1372757 (= res!916026 (not (contains!9708 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372758 () Bool)

(declare-fun res!916025 () Bool)

(assert (=> b!1372758 (=> (not res!916025) (not e!777682))))

(assert (=> b!1372758 (= res!916025 (not (contains!9708 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372759 () Bool)

(assert (=> b!1372759 (= e!777682 false)))

(declare-fun lt!602928 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93095 (_ BitVec 32) List!32026) Bool)

(assert (=> b!1372759 (= lt!602928 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45353 0))(
  ( (Unit!45354) )
))
(declare-fun lt!602929 () Unit!45353)

(declare-fun noDuplicateSubseq!297 (List!32026 List!32026) Unit!45353)

(assert (=> b!1372759 (= lt!602929 (noDuplicateSubseq!297 newAcc!98 acc!866))))

(assert (= (and start!116278 res!916027) b!1372754))

(assert (= (and b!1372754 res!916023) b!1372757))

(assert (= (and b!1372757 res!916026) b!1372756))

(assert (= (and b!1372756 res!916021) b!1372755))

(assert (= (and b!1372755 res!916022) b!1372758))

(assert (= (and b!1372758 res!916025) b!1372753))

(assert (= (and b!1372753 res!916024) b!1372759))

(declare-fun m!1256143 () Bool)

(assert (=> b!1372757 m!1256143))

(declare-fun m!1256145 () Bool)

(assert (=> start!116278 m!1256145))

(declare-fun m!1256147 () Bool)

(assert (=> b!1372756 m!1256147))

(declare-fun m!1256149 () Bool)

(assert (=> b!1372758 m!1256149))

(declare-fun m!1256151 () Bool)

(assert (=> b!1372759 m!1256151))

(declare-fun m!1256153 () Bool)

(assert (=> b!1372759 m!1256153))

(declare-fun m!1256155 () Bool)

(assert (=> b!1372753 m!1256155))

(declare-fun m!1256157 () Bool)

(assert (=> b!1372755 m!1256157))

(declare-fun m!1256159 () Bool)

(assert (=> b!1372754 m!1256159))

(check-sat (not b!1372758) (not b!1372753) (not b!1372757) (not b!1372759) (not b!1372754) (not b!1372756) (not b!1372755) (not start!116278))
(check-sat)
