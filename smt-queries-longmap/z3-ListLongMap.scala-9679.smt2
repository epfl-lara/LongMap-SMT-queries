; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114214 () Bool)

(assert start!114214)

(declare-fun b!1356798 () Bool)

(declare-fun res!901555 () Bool)

(declare-fun e!770184 () Bool)

(assert (=> b!1356798 (=> (not res!901555) (not e!770184))))

(declare-datatypes ((List!31687 0))(
  ( (Nil!31684) (Cons!31683 (h!32892 (_ BitVec 64)) (t!46345 List!31687)) )
))
(declare-fun acc!759 () List!31687)

(declare-fun contains!9396 (List!31687 (_ BitVec 64)) Bool)

(assert (=> b!1356798 (= res!901555 (not (contains!9396 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901556 () Bool)

(assert (=> start!114214 (=> (not res!901556) (not e!770184))))

(declare-datatypes ((array!92396 0))(
  ( (array!92397 (arr!44646 (Array (_ BitVec 32) (_ BitVec 64))) (size!45196 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92396)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114214 (= res!901556 (and (bvslt (size!45196 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45196 a!3742))))))

(assert (=> start!114214 e!770184))

(declare-fun array_inv!33674 (array!92396) Bool)

(assert (=> start!114214 (array_inv!33674 a!3742)))

(assert (=> start!114214 true))

(declare-fun b!1356799 () Bool)

(declare-fun res!901557 () Bool)

(assert (=> b!1356799 (=> (not res!901557) (not e!770184))))

(declare-fun arrayNoDuplicates!0 (array!92396 (_ BitVec 32) List!31687) Bool)

(assert (=> b!1356799 (= res!901557 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31684))))

(declare-fun b!1356800 () Bool)

(declare-fun res!901558 () Bool)

(assert (=> b!1356800 (=> (not res!901558) (not e!770184))))

(declare-fun noDuplicate!2253 (List!31687) Bool)

(assert (=> b!1356800 (= res!901558 (noDuplicate!2253 acc!759))))

(declare-fun b!1356801 () Bool)

(declare-fun res!901554 () Bool)

(assert (=> b!1356801 (=> (not res!901554) (not e!770184))))

(assert (=> b!1356801 (= res!901554 (not (contains!9396 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356802 () Bool)

(assert (=> b!1356802 (= e!770184 false)))

(declare-fun lt!599086 () Bool)

(assert (=> b!1356802 (= lt!599086 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114214 res!901556) b!1356800))

(assert (= (and b!1356800 res!901558) b!1356801))

(assert (= (and b!1356801 res!901554) b!1356798))

(assert (= (and b!1356798 res!901555) b!1356799))

(assert (= (and b!1356799 res!901557) b!1356802))

(declare-fun m!1242709 () Bool)

(assert (=> b!1356801 m!1242709))

(declare-fun m!1242711 () Bool)

(assert (=> b!1356798 m!1242711))

(declare-fun m!1242713 () Bool)

(assert (=> start!114214 m!1242713))

(declare-fun m!1242715 () Bool)

(assert (=> b!1356800 m!1242715))

(declare-fun m!1242717 () Bool)

(assert (=> b!1356802 m!1242717))

(declare-fun m!1242719 () Bool)

(assert (=> b!1356799 m!1242719))

(check-sat (not b!1356800) (not b!1356801) (not b!1356799) (not start!114214) (not b!1356798) (not b!1356802))
(check-sat)
