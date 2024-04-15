; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115402 () Bool)

(assert start!115402)

(declare-fun b!1364705 () Bool)

(declare-fun res!908326 () Bool)

(declare-fun e!774009 () Bool)

(assert (=> b!1364705 (=> (not res!908326) (not e!774009))))

(declare-datatypes ((List!31916 0))(
  ( (Nil!31913) (Cons!31912 (h!33121 (_ BitVec 64)) (t!46602 List!31916)) )
))
(declare-fun acc!866 () List!31916)

(declare-fun contains!9509 (List!31916 (_ BitVec 64)) Bool)

(assert (=> b!1364705 (= res!908326 (not (contains!9509 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364706 () Bool)

(declare-fun res!908327 () Bool)

(assert (=> b!1364706 (=> (not res!908327) (not e!774009))))

(declare-fun noDuplicate!2424 (List!31916) Bool)

(assert (=> b!1364706 (= res!908327 (noDuplicate!2424 acc!866))))

(declare-fun b!1364707 () Bool)

(declare-fun res!908322 () Bool)

(assert (=> b!1364707 (=> (not res!908322) (not e!774009))))

(declare-fun newAcc!98 () List!31916)

(assert (=> b!1364707 (= res!908322 (not (contains!9509 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364708 () Bool)

(declare-fun res!908324 () Bool)

(assert (=> b!1364708 (=> (not res!908324) (not e!774009))))

(assert (=> b!1364708 (= res!908324 (not (contains!9509 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364709 () Bool)

(assert (=> b!1364709 (= e!774009 false)))

(declare-fun res!908323 () Bool)

(assert (=> start!115402 (=> (not res!908323) (not e!774009))))

(declare-datatypes ((array!92682 0))(
  ( (array!92683 (arr!44770 (Array (_ BitVec 32) (_ BitVec 64))) (size!45322 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92682)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115402 (= res!908323 (and (bvslt (size!45322 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45322 a!3861))))))

(assert (=> start!115402 e!774009))

(declare-fun array_inv!34003 (array!92682) Bool)

(assert (=> start!115402 (array_inv!34003 a!3861)))

(assert (=> start!115402 true))

(declare-fun b!1364710 () Bool)

(declare-fun res!908325 () Bool)

(assert (=> b!1364710 (=> (not res!908325) (not e!774009))))

(assert (=> b!1364710 (= res!908325 (not (contains!9509 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115402 res!908323) b!1364706))

(assert (= (and b!1364706 res!908327) b!1364705))

(assert (= (and b!1364705 res!908326) b!1364708))

(assert (= (and b!1364708 res!908324) b!1364707))

(assert (= (and b!1364707 res!908322) b!1364710))

(assert (= (and b!1364710 res!908325) b!1364709))

(declare-fun m!1248987 () Bool)

(assert (=> b!1364710 m!1248987))

(declare-fun m!1248989 () Bool)

(assert (=> b!1364708 m!1248989))

(declare-fun m!1248991 () Bool)

(assert (=> b!1364706 m!1248991))

(declare-fun m!1248993 () Bool)

(assert (=> b!1364707 m!1248993))

(declare-fun m!1248995 () Bool)

(assert (=> b!1364705 m!1248995))

(declare-fun m!1248997 () Bool)

(assert (=> start!115402 m!1248997))

(check-sat (not b!1364708) (not b!1364706) (not b!1364710) (not b!1364707) (not start!115402) (not b!1364705))
(check-sat)
