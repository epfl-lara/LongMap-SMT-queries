; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115930 () Bool)

(assert start!115930)

(declare-fun b!1369479 () Bool)

(declare-fun res!912213 () Bool)

(declare-fun e!776106 () Bool)

(assert (=> b!1369479 (=> (not res!912213) (not e!776106))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1369479 (= res!912213 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369480 () Bool)

(declare-fun res!912208 () Bool)

(declare-fun e!776107 () Bool)

(assert (=> b!1369480 (=> (not res!912208) (not e!776107))))

(declare-datatypes ((List!31981 0))(
  ( (Nil!31978) (Cons!31977 (h!33195 (_ BitVec 64)) (t!46667 List!31981)) )
))
(declare-fun acc!866 () List!31981)

(declare-fun contains!9666 (List!31981 (_ BitVec 64)) Bool)

(assert (=> b!1369480 (= res!912208 (not (contains!9666 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369481 () Bool)

(declare-fun res!912215 () Bool)

(assert (=> b!1369481 (=> (not res!912215) (not e!776107))))

(assert (=> b!1369481 (= res!912215 (not (contains!9666 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369482 () Bool)

(declare-fun res!912216 () Bool)

(assert (=> b!1369482 (=> (not res!912216) (not e!776107))))

(declare-fun newAcc!98 () List!31981)

(assert (=> b!1369482 (= res!912216 (not (contains!9666 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369483 () Bool)

(assert (=> b!1369483 (= e!776106 false)))

(declare-datatypes ((array!93013 0))(
  ( (array!93014 (arr!44926 (Array (_ BitVec 32) (_ BitVec 64))) (size!45477 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93013)

(declare-fun lt!602495 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93013 (_ BitVec 32) List!31981) Bool)

(assert (=> b!1369483 (= lt!602495 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369484 () Bool)

(declare-fun res!912211 () Bool)

(assert (=> b!1369484 (=> (not res!912211) (not e!776107))))

(declare-fun noDuplicate!2497 (List!31981) Bool)

(assert (=> b!1369484 (= res!912211 (noDuplicate!2497 acc!866))))

(declare-fun b!1369485 () Bool)

(declare-fun res!912210 () Bool)

(assert (=> b!1369485 (=> (not res!912210) (not e!776106))))

(assert (=> b!1369485 (= res!912210 (bvslt from!3239 (size!45477 a!3861)))))

(declare-fun res!912214 () Bool)

(assert (=> start!115930 (=> (not res!912214) (not e!776107))))

(assert (=> start!115930 (= res!912214 (and (bvslt (size!45477 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45477 a!3861))))))

(assert (=> start!115930 e!776107))

(declare-fun array_inv!34207 (array!93013) Bool)

(assert (=> start!115930 (array_inv!34207 a!3861)))

(assert (=> start!115930 true))

(declare-fun b!1369486 () Bool)

(declare-fun res!912212 () Bool)

(assert (=> b!1369486 (=> (not res!912212) (not e!776106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369486 (= res!912212 (not (validKeyInArray!0 (select (arr!44926 a!3861) from!3239))))))

(declare-fun b!1369487 () Bool)

(declare-fun res!912207 () Bool)

(assert (=> b!1369487 (=> (not res!912207) (not e!776107))))

(declare-fun subseq!1025 (List!31981 List!31981) Bool)

(assert (=> b!1369487 (= res!912207 (subseq!1025 newAcc!98 acc!866))))

(declare-fun b!1369488 () Bool)

(declare-fun res!912206 () Bool)

(assert (=> b!1369488 (=> (not res!912206) (not e!776107))))

(assert (=> b!1369488 (= res!912206 (not (contains!9666 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369489 () Bool)

(assert (=> b!1369489 (= e!776107 e!776106)))

(declare-fun res!912209 () Bool)

(assert (=> b!1369489 (=> (not res!912209) (not e!776106))))

(assert (=> b!1369489 (= res!912209 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45122 0))(
  ( (Unit!45123) )
))
(declare-fun lt!602496 () Unit!45122)

(declare-fun noDuplicateSubseq!212 (List!31981 List!31981) Unit!45122)

(assert (=> b!1369489 (= lt!602496 (noDuplicateSubseq!212 newAcc!98 acc!866))))

(assert (= (and start!115930 res!912214) b!1369484))

(assert (= (and b!1369484 res!912211) b!1369481))

(assert (= (and b!1369481 res!912215) b!1369480))

(assert (= (and b!1369480 res!912208) b!1369488))

(assert (= (and b!1369488 res!912206) b!1369482))

(assert (= (and b!1369482 res!912216) b!1369487))

(assert (= (and b!1369487 res!912207) b!1369489))

(assert (= (and b!1369489 res!912209) b!1369485))

(assert (= (and b!1369485 res!912210) b!1369486))

(assert (= (and b!1369486 res!912212) b!1369479))

(assert (= (and b!1369479 res!912213) b!1369483))

(declare-fun m!1253815 () Bool)

(assert (=> b!1369486 m!1253815))

(assert (=> b!1369486 m!1253815))

(declare-fun m!1253817 () Bool)

(assert (=> b!1369486 m!1253817))

(declare-fun m!1253819 () Bool)

(assert (=> b!1369488 m!1253819))

(declare-fun m!1253821 () Bool)

(assert (=> b!1369480 m!1253821))

(declare-fun m!1253823 () Bool)

(assert (=> b!1369483 m!1253823))

(declare-fun m!1253825 () Bool)

(assert (=> b!1369482 m!1253825))

(declare-fun m!1253827 () Bool)

(assert (=> b!1369487 m!1253827))

(declare-fun m!1253829 () Bool)

(assert (=> b!1369481 m!1253829))

(declare-fun m!1253831 () Bool)

(assert (=> b!1369484 m!1253831))

(declare-fun m!1253833 () Bool)

(assert (=> b!1369489 m!1253833))

(declare-fun m!1253835 () Bool)

(assert (=> b!1369489 m!1253835))

(declare-fun m!1253837 () Bool)

(assert (=> start!115930 m!1253837))

(check-sat (not b!1369486) (not b!1369482) (not b!1369488) (not b!1369484) (not b!1369480) (not b!1369481) (not b!1369483) (not b!1369489) (not start!115930) (not b!1369487))
(check-sat)
