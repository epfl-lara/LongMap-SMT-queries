; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115648 () Bool)

(assert start!115648)

(declare-fun b!1366195 () Bool)

(declare-fun res!908989 () Bool)

(declare-fun e!774921 () Bool)

(assert (=> b!1366195 (=> (not res!908989) (not e!774921))))

(declare-datatypes ((List!31909 0))(
  ( (Nil!31906) (Cons!31905 (h!33123 (_ BitVec 64)) (t!46595 List!31909)) )
))
(declare-fun acc!866 () List!31909)

(declare-fun contains!9594 (List!31909 (_ BitVec 64)) Bool)

(assert (=> b!1366195 (= res!908989 (not (contains!9594 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366196 () Bool)

(assert (=> b!1366196 (= e!774921 false)))

(declare-datatypes ((Unit!44978 0))(
  ( (Unit!44979) )
))
(declare-fun lt!601635 () Unit!44978)

(declare-fun newAcc!98 () List!31909)

(declare-fun noDuplicateSubseq!140 (List!31909 List!31909) Unit!44978)

(assert (=> b!1366196 (= lt!601635 (noDuplicateSubseq!140 newAcc!98 acc!866))))

(declare-fun b!1366197 () Bool)

(declare-fun res!908992 () Bool)

(assert (=> b!1366197 (=> (not res!908992) (not e!774921))))

(assert (=> b!1366197 (= res!908992 (not (contains!9594 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366198 () Bool)

(declare-fun res!908991 () Bool)

(assert (=> b!1366198 (=> (not res!908991) (not e!774921))))

(assert (=> b!1366198 (= res!908991 (not (contains!9594 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908988 () Bool)

(assert (=> start!115648 (=> (not res!908988) (not e!774921))))

(declare-datatypes ((array!92860 0))(
  ( (array!92861 (arr!44854 (Array (_ BitVec 32) (_ BitVec 64))) (size!45405 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92860)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115648 (= res!908988 (and (bvslt (size!45405 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45405 a!3861))))))

(assert (=> start!115648 e!774921))

(declare-fun array_inv!34135 (array!92860) Bool)

(assert (=> start!115648 (array_inv!34135 a!3861)))

(assert (=> start!115648 true))

(declare-fun b!1366199 () Bool)

(declare-fun res!908994 () Bool)

(assert (=> b!1366199 (=> (not res!908994) (not e!774921))))

(assert (=> b!1366199 (= res!908994 (not (contains!9594 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366200 () Bool)

(declare-fun res!908990 () Bool)

(assert (=> b!1366200 (=> (not res!908990) (not e!774921))))

(declare-fun subseq!953 (List!31909 List!31909) Bool)

(assert (=> b!1366200 (= res!908990 (subseq!953 newAcc!98 acc!866))))

(declare-fun b!1366201 () Bool)

(declare-fun res!908993 () Bool)

(assert (=> b!1366201 (=> (not res!908993) (not e!774921))))

(declare-fun noDuplicate!2425 (List!31909) Bool)

(assert (=> b!1366201 (= res!908993 (noDuplicate!2425 acc!866))))

(assert (= (and start!115648 res!908988) b!1366201))

(assert (= (and b!1366201 res!908993) b!1366197))

(assert (= (and b!1366197 res!908992) b!1366195))

(assert (= (and b!1366195 res!908989) b!1366198))

(assert (= (and b!1366198 res!908991) b!1366199))

(assert (= (and b!1366199 res!908994) b!1366200))

(assert (= (and b!1366200 res!908990) b!1366196))

(declare-fun m!1251193 () Bool)

(assert (=> b!1366196 m!1251193))

(declare-fun m!1251195 () Bool)

(assert (=> b!1366199 m!1251195))

(declare-fun m!1251197 () Bool)

(assert (=> b!1366201 m!1251197))

(declare-fun m!1251199 () Bool)

(assert (=> b!1366198 m!1251199))

(declare-fun m!1251201 () Bool)

(assert (=> b!1366197 m!1251201))

(declare-fun m!1251203 () Bool)

(assert (=> b!1366195 m!1251203))

(declare-fun m!1251205 () Bool)

(assert (=> b!1366200 m!1251205))

(declare-fun m!1251207 () Bool)

(assert (=> start!115648 m!1251207))

(check-sat (not b!1366196) (not b!1366198) (not b!1366201) (not b!1366195) (not b!1366200) (not b!1366199) (not start!115648) (not b!1366197))
(check-sat)
