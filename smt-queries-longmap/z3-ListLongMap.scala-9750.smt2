; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115474 () Bool)

(assert start!115474)

(declare-fun b!1366169 () Bool)

(declare-fun res!909793 () Bool)

(declare-fun e!774354 () Bool)

(assert (=> b!1366169 (=> (not res!909793) (not e!774354))))

(declare-datatypes ((List!31952 0))(
  ( (Nil!31949) (Cons!31948 (h!33157 (_ BitVec 64)) (t!46638 List!31952)) )
))
(declare-fun newAcc!98 () List!31952)

(declare-fun acc!866 () List!31952)

(declare-fun subseq!983 (List!31952 List!31952) Bool)

(assert (=> b!1366169 (= res!909793 (subseq!983 newAcc!98 acc!866))))

(declare-fun b!1366170 () Bool)

(declare-fun res!909788 () Bool)

(assert (=> b!1366170 (=> (not res!909788) (not e!774354))))

(declare-fun contains!9545 (List!31952 (_ BitVec 64)) Bool)

(assert (=> b!1366170 (= res!909788 (not (contains!9545 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366171 () Bool)

(declare-fun res!909800 () Bool)

(declare-fun e!774356 () Bool)

(assert (=> b!1366171 (=> (not res!909800) (not e!774356))))

(declare-fun lt!601325 () List!31952)

(assert (=> b!1366171 (= res!909800 (not (contains!9545 lt!601325 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366172 () Bool)

(declare-fun res!909792 () Bool)

(assert (=> b!1366172 (=> (not res!909792) (not e!774354))))

(assert (=> b!1366172 (= res!909792 (not (contains!9545 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366173 () Bool)

(declare-fun res!909802 () Bool)

(assert (=> b!1366173 (=> (not res!909802) (not e!774354))))

(assert (=> b!1366173 (= res!909802 (not (contains!9545 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366174 () Bool)

(declare-fun res!909803 () Bool)

(assert (=> b!1366174 (=> (not res!909803) (not e!774356))))

(declare-fun lt!601322 () List!31952)

(assert (=> b!1366174 (= res!909803 (subseq!983 lt!601322 lt!601325))))

(declare-fun b!1366175 () Bool)

(declare-fun res!909797 () Bool)

(assert (=> b!1366175 (=> (not res!909797) (not e!774356))))

(declare-fun noDuplicate!2460 (List!31952) Bool)

(assert (=> b!1366175 (= res!909797 (noDuplicate!2460 lt!601325))))

(declare-fun b!1366177 () Bool)

(declare-fun res!909791 () Bool)

(declare-fun e!774357 () Bool)

(assert (=> b!1366177 (=> (not res!909791) (not e!774357))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92754 0))(
  ( (array!92755 (arr!44806 (Array (_ BitVec 32) (_ BitVec 64))) (size!45358 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92754)

(assert (=> b!1366177 (= res!909791 (bvslt from!3239 (size!45358 a!3861)))))

(declare-fun b!1366178 () Bool)

(assert (=> b!1366178 (= e!774354 e!774357)))

(declare-fun res!909786 () Bool)

(assert (=> b!1366178 (=> (not res!909786) (not e!774357))))

(declare-fun arrayNoDuplicates!0 (array!92754 (_ BitVec 32) List!31952) Bool)

(assert (=> b!1366178 (= res!909786 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44940 0))(
  ( (Unit!44941) )
))
(declare-fun lt!601324 () Unit!44940)

(declare-fun noDuplicateSubseq!170 (List!31952 List!31952) Unit!44940)

(assert (=> b!1366178 (= lt!601324 (noDuplicateSubseq!170 newAcc!98 acc!866))))

(declare-fun b!1366179 () Bool)

(assert (=> b!1366179 (= e!774357 e!774356)))

(declare-fun res!909790 () Bool)

(assert (=> b!1366179 (=> (not res!909790) (not e!774356))))

(assert (=> b!1366179 (= res!909790 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366179 (= lt!601322 (Cons!31948 (select (arr!44806 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366179 (= lt!601325 (Cons!31948 (select (arr!44806 a!3861) from!3239) acc!866))))

(declare-fun b!1366180 () Bool)

(declare-fun res!909789 () Bool)

(assert (=> b!1366180 (=> (not res!909789) (not e!774356))))

(assert (=> b!1366180 (= res!909789 (not (contains!9545 lt!601322 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366181 () Bool)

(declare-fun res!909801 () Bool)

(assert (=> b!1366181 (=> (not res!909801) (not e!774356))))

(assert (=> b!1366181 (= res!909801 (not (contains!9545 lt!601325 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366182 () Bool)

(declare-fun res!909795 () Bool)

(assert (=> b!1366182 (=> (not res!909795) (not e!774356))))

(assert (=> b!1366182 (= res!909795 (not (contains!9545 lt!601322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366183 () Bool)

(assert (=> b!1366183 (= e!774356 false)))

(declare-fun lt!601326 () Bool)

(assert (=> b!1366183 (= lt!601326 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601325))))

(declare-fun lt!601323 () Unit!44940)

(assert (=> b!1366183 (= lt!601323 (noDuplicateSubseq!170 lt!601322 lt!601325))))

(declare-fun b!1366184 () Bool)

(declare-fun res!909796 () Bool)

(assert (=> b!1366184 (=> (not res!909796) (not e!774357))))

(assert (=> b!1366184 (= res!909796 (not (contains!9545 acc!866 (select (arr!44806 a!3861) from!3239))))))

(declare-fun res!909787 () Bool)

(assert (=> start!115474 (=> (not res!909787) (not e!774354))))

(assert (=> start!115474 (= res!909787 (and (bvslt (size!45358 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45358 a!3861))))))

(assert (=> start!115474 e!774354))

(declare-fun array_inv!34039 (array!92754) Bool)

(assert (=> start!115474 (array_inv!34039 a!3861)))

(assert (=> start!115474 true))

(declare-fun b!1366176 () Bool)

(declare-fun res!909798 () Bool)

(assert (=> b!1366176 (=> (not res!909798) (not e!774354))))

(assert (=> b!1366176 (= res!909798 (noDuplicate!2460 acc!866))))

(declare-fun b!1366185 () Bool)

(declare-fun res!909799 () Bool)

(assert (=> b!1366185 (=> (not res!909799) (not e!774354))))

(assert (=> b!1366185 (= res!909799 (not (contains!9545 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366186 () Bool)

(declare-fun res!909794 () Bool)

(assert (=> b!1366186 (=> (not res!909794) (not e!774357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366186 (= res!909794 (validKeyInArray!0 (select (arr!44806 a!3861) from!3239)))))

(assert (= (and start!115474 res!909787) b!1366176))

(assert (= (and b!1366176 res!909798) b!1366173))

(assert (= (and b!1366173 res!909802) b!1366170))

(assert (= (and b!1366170 res!909788) b!1366172))

(assert (= (and b!1366172 res!909792) b!1366185))

(assert (= (and b!1366185 res!909799) b!1366169))

(assert (= (and b!1366169 res!909793) b!1366178))

(assert (= (and b!1366178 res!909786) b!1366177))

(assert (= (and b!1366177 res!909791) b!1366186))

(assert (= (and b!1366186 res!909794) b!1366184))

(assert (= (and b!1366184 res!909796) b!1366179))

(assert (= (and b!1366179 res!909790) b!1366175))

(assert (= (and b!1366175 res!909797) b!1366171))

(assert (= (and b!1366171 res!909800) b!1366181))

(assert (= (and b!1366181 res!909801) b!1366182))

(assert (= (and b!1366182 res!909795) b!1366180))

(assert (= (and b!1366180 res!909789) b!1366174))

(assert (= (and b!1366174 res!909803) b!1366183))

(declare-fun m!1250055 () Bool)

(assert (=> b!1366186 m!1250055))

(assert (=> b!1366186 m!1250055))

(declare-fun m!1250057 () Bool)

(assert (=> b!1366186 m!1250057))

(declare-fun m!1250059 () Bool)

(assert (=> b!1366178 m!1250059))

(declare-fun m!1250061 () Bool)

(assert (=> b!1366178 m!1250061))

(declare-fun m!1250063 () Bool)

(assert (=> b!1366175 m!1250063))

(declare-fun m!1250065 () Bool)

(assert (=> b!1366174 m!1250065))

(declare-fun m!1250067 () Bool)

(assert (=> b!1366185 m!1250067))

(declare-fun m!1250069 () Bool)

(assert (=> b!1366181 m!1250069))

(declare-fun m!1250071 () Bool)

(assert (=> b!1366180 m!1250071))

(declare-fun m!1250073 () Bool)

(assert (=> b!1366169 m!1250073))

(declare-fun m!1250075 () Bool)

(assert (=> b!1366173 m!1250075))

(declare-fun m!1250077 () Bool)

(assert (=> b!1366176 m!1250077))

(declare-fun m!1250079 () Bool)

(assert (=> b!1366172 m!1250079))

(assert (=> b!1366184 m!1250055))

(assert (=> b!1366184 m!1250055))

(declare-fun m!1250081 () Bool)

(assert (=> b!1366184 m!1250081))

(declare-fun m!1250083 () Bool)

(assert (=> b!1366182 m!1250083))

(declare-fun m!1250085 () Bool)

(assert (=> b!1366183 m!1250085))

(declare-fun m!1250087 () Bool)

(assert (=> b!1366183 m!1250087))

(assert (=> b!1366179 m!1250055))

(declare-fun m!1250089 () Bool)

(assert (=> b!1366170 m!1250089))

(declare-fun m!1250091 () Bool)

(assert (=> b!1366171 m!1250091))

(declare-fun m!1250093 () Bool)

(assert (=> start!115474 m!1250093))

(check-sat (not b!1366173) (not b!1366182) (not b!1366181) (not b!1366169) (not b!1366171) (not b!1366185) (not start!115474) (not b!1366186) (not b!1366183) (not b!1366180) (not b!1366175) (not b!1366184) (not b!1366178) (not b!1366170) (not b!1366174) (not b!1366176) (not b!1366172))
(check-sat)
