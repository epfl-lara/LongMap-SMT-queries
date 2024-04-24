; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115960 () Bool)

(assert start!115960)

(declare-fun b!1369985 () Bool)

(declare-fun res!912713 () Bool)

(declare-fun e!776242 () Bool)

(assert (=> b!1369985 (=> (not res!912713) (not e!776242))))

(declare-datatypes ((List!31996 0))(
  ( (Nil!31993) (Cons!31992 (h!33210 (_ BitVec 64)) (t!46682 List!31996)) )
))
(declare-fun newAcc!98 () List!31996)

(declare-fun contains!9681 (List!31996 (_ BitVec 64)) Bool)

(assert (=> b!1369985 (= res!912713 (not (contains!9681 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369986 () Bool)

(declare-fun res!912714 () Bool)

(assert (=> b!1369986 (=> (not res!912714) (not e!776242))))

(assert (=> b!1369986 (= res!912714 (not (contains!9681 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912717 () Bool)

(assert (=> start!115960 (=> (not res!912717) (not e!776242))))

(declare-datatypes ((array!93043 0))(
  ( (array!93044 (arr!44941 (Array (_ BitVec 32) (_ BitVec 64))) (size!45492 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93043)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115960 (= res!912717 (and (bvslt (size!45492 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45492 a!3861))))))

(assert (=> start!115960 e!776242))

(declare-fun array_inv!34222 (array!93043) Bool)

(assert (=> start!115960 (array_inv!34222 a!3861)))

(assert (=> start!115960 true))

(declare-fun b!1369987 () Bool)

(declare-fun res!912723 () Bool)

(assert (=> b!1369987 (=> (not res!912723) (not e!776242))))

(declare-fun acc!866 () List!31996)

(declare-fun subseq!1040 (List!31996 List!31996) Bool)

(assert (=> b!1369987 (= res!912723 (subseq!1040 newAcc!98 acc!866))))

(declare-fun b!1369988 () Bool)

(declare-fun res!912715 () Bool)

(assert (=> b!1369988 (=> (not res!912715) (not e!776242))))

(assert (=> b!1369988 (= res!912715 (not (contains!9681 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369989 () Bool)

(declare-fun res!912712 () Bool)

(assert (=> b!1369989 (=> (not res!912712) (not e!776242))))

(declare-fun noDuplicate!2512 (List!31996) Bool)

(assert (=> b!1369989 (= res!912712 (noDuplicate!2512 acc!866))))

(declare-fun b!1369990 () Bool)

(declare-fun res!912718 () Bool)

(declare-fun e!776240 () Bool)

(assert (=> b!1369990 (=> (not res!912718) (not e!776240))))

(assert (=> b!1369990 (= res!912718 (bvslt from!3239 (size!45492 a!3861)))))

(declare-fun b!1369991 () Bool)

(declare-fun res!912716 () Bool)

(assert (=> b!1369991 (=> (not res!912716) (not e!776240))))

(assert (=> b!1369991 (= res!912716 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369992 () Bool)

(declare-fun res!912719 () Bool)

(assert (=> b!1369992 (=> (not res!912719) (not e!776240))))

(declare-fun arrayNoDuplicates!0 (array!93043 (_ BitVec 32) List!31996) Bool)

(assert (=> b!1369992 (= res!912719 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369993 () Bool)

(assert (=> b!1369993 (= e!776242 e!776240)))

(declare-fun res!912722 () Bool)

(assert (=> b!1369993 (=> (not res!912722) (not e!776240))))

(assert (=> b!1369993 (= res!912722 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45152 0))(
  ( (Unit!45153) )
))
(declare-fun lt!602585 () Unit!45152)

(declare-fun noDuplicateSubseq!227 (List!31996 List!31996) Unit!45152)

(assert (=> b!1369993 (= lt!602585 (noDuplicateSubseq!227 newAcc!98 acc!866))))

(declare-fun b!1369994 () Bool)

(declare-fun res!912721 () Bool)

(assert (=> b!1369994 (=> (not res!912721) (not e!776240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369994 (= res!912721 (not (validKeyInArray!0 (select (arr!44941 a!3861) from!3239))))))

(declare-fun b!1369995 () Bool)

(declare-fun res!912720 () Bool)

(assert (=> b!1369995 (=> (not res!912720) (not e!776242))))

(assert (=> b!1369995 (= res!912720 (not (contains!9681 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369996 () Bool)

(assert (=> b!1369996 (= e!776240 (not true))))

(assert (=> b!1369996 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602586 () Unit!45152)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93043 List!31996 List!31996 (_ BitVec 32)) Unit!45152)

(assert (=> b!1369996 (= lt!602586 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (= (and start!115960 res!912717) b!1369989))

(assert (= (and b!1369989 res!912712) b!1369995))

(assert (= (and b!1369995 res!912720) b!1369988))

(assert (= (and b!1369988 res!912715) b!1369985))

(assert (= (and b!1369985 res!912713) b!1369986))

(assert (= (and b!1369986 res!912714) b!1369987))

(assert (= (and b!1369987 res!912723) b!1369993))

(assert (= (and b!1369993 res!912722) b!1369990))

(assert (= (and b!1369990 res!912718) b!1369994))

(assert (= (and b!1369994 res!912721) b!1369991))

(assert (= (and b!1369991 res!912716) b!1369992))

(assert (= (and b!1369992 res!912719) b!1369996))

(declare-fun m!1254187 () Bool)

(assert (=> b!1369987 m!1254187))

(declare-fun m!1254189 () Bool)

(assert (=> b!1369988 m!1254189))

(declare-fun m!1254191 () Bool)

(assert (=> start!115960 m!1254191))

(declare-fun m!1254193 () Bool)

(assert (=> b!1369985 m!1254193))

(declare-fun m!1254195 () Bool)

(assert (=> b!1369993 m!1254195))

(declare-fun m!1254197 () Bool)

(assert (=> b!1369993 m!1254197))

(declare-fun m!1254199 () Bool)

(assert (=> b!1369994 m!1254199))

(assert (=> b!1369994 m!1254199))

(declare-fun m!1254201 () Bool)

(assert (=> b!1369994 m!1254201))

(declare-fun m!1254203 () Bool)

(assert (=> b!1369995 m!1254203))

(declare-fun m!1254205 () Bool)

(assert (=> b!1369992 m!1254205))

(declare-fun m!1254207 () Bool)

(assert (=> b!1369986 m!1254207))

(declare-fun m!1254209 () Bool)

(assert (=> b!1369996 m!1254209))

(declare-fun m!1254211 () Bool)

(assert (=> b!1369996 m!1254211))

(declare-fun m!1254213 () Bool)

(assert (=> b!1369989 m!1254213))

(check-sat (not b!1369992) (not b!1369986) (not b!1369993) (not b!1369994) (not start!115960) (not b!1369996) (not b!1369995) (not b!1369985) (not b!1369987) (not b!1369989) (not b!1369988))
(check-sat)
