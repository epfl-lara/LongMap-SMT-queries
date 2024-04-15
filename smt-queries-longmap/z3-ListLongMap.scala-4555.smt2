; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63490 () Bool)

(assert start!63490)

(declare-fun b!714885 () Bool)

(declare-fun res!478037 () Bool)

(declare-fun e!401641 () Bool)

(assert (=> b!714885 (=> (not res!478037) (not e!401641))))

(declare-datatypes ((array!40515 0))(
  ( (array!40516 (arr!19394 (Array (_ BitVec 32) (_ BitVec 64))) (size!19809 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40515)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714885 (= res!478037 (not (validKeyInArray!0 (select (arr!19394 a!3591) from!2969))))))

(declare-fun b!714886 () Bool)

(assert (=> b!714886 (= e!401641 false)))

(declare-datatypes ((List!13474 0))(
  ( (Nil!13471) (Cons!13470 (h!14515 (_ BitVec 64)) (t!19780 List!13474)) )
))
(declare-fun acc!652 () List!13474)

(declare-fun lt!318572 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40515 (_ BitVec 32) List!13474) Bool)

(assert (=> b!714886 (= lt!318572 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!714887 () Bool)

(declare-fun res!478029 () Bool)

(assert (=> b!714887 (=> (not res!478029) (not e!401641))))

(declare-fun noDuplicate!1265 (List!13474) Bool)

(assert (=> b!714887 (= res!478029 (noDuplicate!1265 acc!652))))

(declare-fun b!714888 () Bool)

(declare-fun res!478021 () Bool)

(assert (=> b!714888 (=> (not res!478021) (not e!401641))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!714888 (= res!478021 (validKeyInArray!0 k0!2824))))

(declare-fun b!714889 () Bool)

(declare-fun res!478031 () Bool)

(assert (=> b!714889 (=> (not res!478031) (not e!401641))))

(declare-fun newAcc!49 () List!13474)

(declare-fun -!423 (List!13474 (_ BitVec 64)) List!13474)

(assert (=> b!714889 (= res!478031 (= (-!423 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714890 () Bool)

(declare-fun res!478032 () Bool)

(assert (=> b!714890 (=> (not res!478032) (not e!401641))))

(declare-fun subseq!458 (List!13474 List!13474) Bool)

(assert (=> b!714890 (= res!478032 (subseq!458 acc!652 newAcc!49))))

(declare-fun b!714892 () Bool)

(declare-fun res!478022 () Bool)

(assert (=> b!714892 (=> (not res!478022) (not e!401641))))

(declare-fun contains!3996 (List!13474 (_ BitVec 64)) Bool)

(assert (=> b!714892 (= res!478022 (not (contains!3996 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714893 () Bool)

(declare-fun res!478034 () Bool)

(assert (=> b!714893 (=> (not res!478034) (not e!401641))))

(declare-fun arrayContainsKey!0 (array!40515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714893 (= res!478034 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714894 () Bool)

(declare-fun res!478036 () Bool)

(assert (=> b!714894 (=> (not res!478036) (not e!401641))))

(assert (=> b!714894 (= res!478036 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19809 a!3591)))))

(declare-fun b!714895 () Bool)

(declare-fun res!478025 () Bool)

(assert (=> b!714895 (=> (not res!478025) (not e!401641))))

(assert (=> b!714895 (= res!478025 (not (contains!3996 acc!652 k0!2824)))))

(declare-fun b!714896 () Bool)

(declare-fun res!478024 () Bool)

(assert (=> b!714896 (=> (not res!478024) (not e!401641))))

(assert (=> b!714896 (= res!478024 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714897 () Bool)

(declare-fun res!478023 () Bool)

(assert (=> b!714897 (=> (not res!478023) (not e!401641))))

(assert (=> b!714897 (= res!478023 (not (contains!3996 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714898 () Bool)

(declare-fun res!478028 () Bool)

(assert (=> b!714898 (=> (not res!478028) (not e!401641))))

(assert (=> b!714898 (= res!478028 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714891 () Bool)

(declare-fun res!478038 () Bool)

(assert (=> b!714891 (=> (not res!478038) (not e!401641))))

(assert (=> b!714891 (= res!478038 (contains!3996 newAcc!49 k0!2824))))

(declare-fun res!478035 () Bool)

(assert (=> start!63490 (=> (not res!478035) (not e!401641))))

(assert (=> start!63490 (= res!478035 (and (bvslt (size!19809 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19809 a!3591))))))

(assert (=> start!63490 e!401641))

(assert (=> start!63490 true))

(declare-fun array_inv!15277 (array!40515) Bool)

(assert (=> start!63490 (array_inv!15277 a!3591)))

(declare-fun b!714899 () Bool)

(declare-fun res!478033 () Bool)

(assert (=> b!714899 (=> (not res!478033) (not e!401641))))

(assert (=> b!714899 (= res!478033 (noDuplicate!1265 newAcc!49))))

(declare-fun b!714900 () Bool)

(declare-fun res!478026 () Bool)

(assert (=> b!714900 (=> (not res!478026) (not e!401641))))

(assert (=> b!714900 (= res!478026 (not (contains!3996 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714901 () Bool)

(declare-fun res!478027 () Bool)

(assert (=> b!714901 (=> (not res!478027) (not e!401641))))

(assert (=> b!714901 (= res!478027 (not (contains!3996 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714902 () Bool)

(declare-fun res!478030 () Bool)

(assert (=> b!714902 (=> (not res!478030) (not e!401641))))

(assert (=> b!714902 (= res!478030 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (= (and start!63490 res!478035) b!714887))

(assert (= (and b!714887 res!478029) b!714899))

(assert (= (and b!714899 res!478033) b!714897))

(assert (= (and b!714897 res!478023) b!714892))

(assert (= (and b!714892 res!478022) b!714896))

(assert (= (and b!714896 res!478024) b!714895))

(assert (= (and b!714895 res!478025) b!714888))

(assert (= (and b!714888 res!478021) b!714898))

(assert (= (and b!714898 res!478028) b!714890))

(assert (= (and b!714890 res!478032) b!714891))

(assert (= (and b!714891 res!478038) b!714889))

(assert (= (and b!714889 res!478031) b!714901))

(assert (= (and b!714901 res!478027) b!714900))

(assert (= (and b!714900 res!478026) b!714894))

(assert (= (and b!714894 res!478036) b!714885))

(assert (= (and b!714885 res!478037) b!714902))

(assert (= (and b!714902 res!478030) b!714893))

(assert (= (and b!714893 res!478034) b!714886))

(declare-fun m!670725 () Bool)

(assert (=> b!714893 m!670725))

(declare-fun m!670727 () Bool)

(assert (=> b!714891 m!670727))

(declare-fun m!670729 () Bool)

(assert (=> b!714898 m!670729))

(declare-fun m!670731 () Bool)

(assert (=> b!714899 m!670731))

(declare-fun m!670733 () Bool)

(assert (=> b!714897 m!670733))

(declare-fun m!670735 () Bool)

(assert (=> start!63490 m!670735))

(declare-fun m!670737 () Bool)

(assert (=> b!714900 m!670737))

(declare-fun m!670739 () Bool)

(assert (=> b!714890 m!670739))

(declare-fun m!670741 () Bool)

(assert (=> b!714887 m!670741))

(declare-fun m!670743 () Bool)

(assert (=> b!714895 m!670743))

(declare-fun m!670745 () Bool)

(assert (=> b!714888 m!670745))

(declare-fun m!670747 () Bool)

(assert (=> b!714892 m!670747))

(declare-fun m!670749 () Bool)

(assert (=> b!714901 m!670749))

(declare-fun m!670751 () Bool)

(assert (=> b!714885 m!670751))

(assert (=> b!714885 m!670751))

(declare-fun m!670753 () Bool)

(assert (=> b!714885 m!670753))

(declare-fun m!670755 () Bool)

(assert (=> b!714886 m!670755))

(declare-fun m!670757 () Bool)

(assert (=> b!714889 m!670757))

(declare-fun m!670759 () Bool)

(assert (=> b!714896 m!670759))

(check-sat (not b!714890) (not b!714900) (not b!714893) (not b!714885) (not start!63490) (not b!714898) (not b!714888) (not b!714892) (not b!714901) (not b!714895) (not b!714899) (not b!714896) (not b!714887) (not b!714886) (not b!714891) (not b!714889) (not b!714897))
(check-sat)
