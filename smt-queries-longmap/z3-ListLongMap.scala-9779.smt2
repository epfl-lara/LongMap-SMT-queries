; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116104 () Bool)

(assert start!116104)

(declare-fun b!1371141 () Bool)

(declare-fun res!913824 () Bool)

(declare-fun e!776782 () Bool)

(assert (=> b!1371141 (=> (not res!913824) (not e!776782))))

(declare-datatypes ((List!32026 0))(
  ( (Nil!32023) (Cons!32022 (h!33240 (_ BitVec 64)) (t!46712 List!32026)) )
))
(declare-fun acc!866 () List!32026)

(declare-fun contains!9711 (List!32026 (_ BitVec 64)) Bool)

(assert (=> b!1371141 (= res!913824 (not (contains!9711 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913822 () Bool)

(assert (=> start!116104 (=> (not res!913822) (not e!776782))))

(declare-datatypes ((array!93109 0))(
  ( (array!93110 (arr!44971 (Array (_ BitVec 32) (_ BitVec 64))) (size!45522 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93109)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116104 (= res!913822 (and (bvslt (size!45522 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45522 a!3861))))))

(assert (=> start!116104 e!776782))

(declare-fun array_inv!34252 (array!93109) Bool)

(assert (=> start!116104 (array_inv!34252 a!3861)))

(assert (=> start!116104 true))

(declare-fun b!1371142 () Bool)

(declare-fun res!913823 () Bool)

(declare-fun e!776780 () Bool)

(assert (=> b!1371142 (=> (not res!913823) (not e!776780))))

(assert (=> b!1371142 (= res!913823 (not (contains!9711 acc!866 (select (arr!44971 a!3861) from!3239))))))

(declare-fun b!1371143 () Bool)

(assert (=> b!1371143 (= e!776780 (bvslt (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1371144 () Bool)

(assert (=> b!1371144 (= e!776782 e!776780)))

(declare-fun res!913828 () Bool)

(assert (=> b!1371144 (=> (not res!913828) (not e!776780))))

(declare-fun arrayNoDuplicates!0 (array!93109 (_ BitVec 32) List!32026) Bool)

(assert (=> b!1371144 (= res!913828 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45212 0))(
  ( (Unit!45213) )
))
(declare-fun lt!602826 () Unit!45212)

(declare-fun newAcc!98 () List!32026)

(declare-fun noDuplicateSubseq!257 (List!32026 List!32026) Unit!45212)

(assert (=> b!1371144 (= lt!602826 (noDuplicateSubseq!257 newAcc!98 acc!866))))

(declare-fun b!1371145 () Bool)

(declare-fun res!913827 () Bool)

(assert (=> b!1371145 (=> (not res!913827) (not e!776782))))

(declare-fun noDuplicate!2542 (List!32026) Bool)

(assert (=> b!1371145 (= res!913827 (noDuplicate!2542 acc!866))))

(declare-fun b!1371146 () Bool)

(declare-fun res!913820 () Bool)

(assert (=> b!1371146 (=> (not res!913820) (not e!776780))))

(assert (=> b!1371146 (= res!913820 (bvslt from!3239 (size!45522 a!3861)))))

(declare-fun b!1371147 () Bool)

(declare-fun res!913821 () Bool)

(assert (=> b!1371147 (=> (not res!913821) (not e!776782))))

(declare-fun subseq!1070 (List!32026 List!32026) Bool)

(assert (=> b!1371147 (= res!913821 (subseq!1070 newAcc!98 acc!866))))

(declare-fun b!1371148 () Bool)

(declare-fun res!913826 () Bool)

(assert (=> b!1371148 (=> (not res!913826) (not e!776782))))

(assert (=> b!1371148 (= res!913826 (not (contains!9711 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371149 () Bool)

(declare-fun res!913829 () Bool)

(assert (=> b!1371149 (=> (not res!913829) (not e!776782))))

(assert (=> b!1371149 (= res!913829 (not (contains!9711 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371150 () Bool)

(declare-fun res!913830 () Bool)

(assert (=> b!1371150 (=> (not res!913830) (not e!776782))))

(assert (=> b!1371150 (= res!913830 (not (contains!9711 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371151 () Bool)

(declare-fun res!913825 () Bool)

(assert (=> b!1371151 (=> (not res!913825) (not e!776780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371151 (= res!913825 (validKeyInArray!0 (select (arr!44971 a!3861) from!3239)))))

(assert (= (and start!116104 res!913822) b!1371145))

(assert (= (and b!1371145 res!913827) b!1371149))

(assert (= (and b!1371149 res!913829) b!1371141))

(assert (= (and b!1371141 res!913824) b!1371148))

(assert (= (and b!1371148 res!913826) b!1371150))

(assert (= (and b!1371150 res!913830) b!1371147))

(assert (= (and b!1371147 res!913821) b!1371144))

(assert (= (and b!1371144 res!913828) b!1371146))

(assert (= (and b!1371146 res!913820) b!1371151))

(assert (= (and b!1371151 res!913825) b!1371142))

(assert (= (and b!1371142 res!913823) b!1371143))

(declare-fun m!1255141 () Bool)

(assert (=> b!1371147 m!1255141))

(declare-fun m!1255143 () Bool)

(assert (=> b!1371149 m!1255143))

(declare-fun m!1255145 () Bool)

(assert (=> b!1371151 m!1255145))

(assert (=> b!1371151 m!1255145))

(declare-fun m!1255147 () Bool)

(assert (=> b!1371151 m!1255147))

(declare-fun m!1255149 () Bool)

(assert (=> b!1371148 m!1255149))

(declare-fun m!1255151 () Bool)

(assert (=> b!1371145 m!1255151))

(declare-fun m!1255153 () Bool)

(assert (=> b!1371150 m!1255153))

(declare-fun m!1255155 () Bool)

(assert (=> b!1371141 m!1255155))

(assert (=> b!1371142 m!1255145))

(assert (=> b!1371142 m!1255145))

(declare-fun m!1255157 () Bool)

(assert (=> b!1371142 m!1255157))

(declare-fun m!1255159 () Bool)

(assert (=> b!1371144 m!1255159))

(declare-fun m!1255161 () Bool)

(assert (=> b!1371144 m!1255161))

(declare-fun m!1255163 () Bool)

(assert (=> start!116104 m!1255163))

(check-sat (not b!1371141) (not b!1371145) (not b!1371151) (not b!1371149) (not b!1371150) (not b!1371147) (not start!116104) (not b!1371142) (not b!1371148) (not b!1371144))
(check-sat)
