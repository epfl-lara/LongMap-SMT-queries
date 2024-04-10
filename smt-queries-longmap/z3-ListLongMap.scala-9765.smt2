; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115714 () Bool)

(assert start!115714)

(declare-fun b!1368312 () Bool)

(declare-fun res!911827 () Bool)

(declare-fun e!775300 () Bool)

(assert (=> b!1368312 (=> (not res!911827) (not e!775300))))

(declare-datatypes ((List!31945 0))(
  ( (Nil!31942) (Cons!31941 (h!33150 (_ BitVec 64)) (t!46639 List!31945)) )
))
(declare-fun newAcc!98 () List!31945)

(declare-fun contains!9627 (List!31945 (_ BitVec 64)) Bool)

(assert (=> b!1368312 (= res!911827 (not (contains!9627 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368313 () Bool)

(declare-fun res!911820 () Bool)

(assert (=> b!1368313 (=> (not res!911820) (not e!775300))))

(assert (=> b!1368313 (= res!911820 (not (contains!9627 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368314 () Bool)

(declare-fun res!911821 () Bool)

(declare-fun e!775298 () Bool)

(assert (=> b!1368314 (=> (not res!911821) (not e!775298))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1368314 (= res!911821 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368315 () Bool)

(declare-fun res!911830 () Bool)

(assert (=> b!1368315 (=> (not res!911830) (not e!775298))))

(declare-datatypes ((array!92906 0))(
  ( (array!92907 (arr!44877 (Array (_ BitVec 32) (_ BitVec 64))) (size!45427 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92906)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368315 (= res!911830 (not (validKeyInArray!0 (select (arr!44877 a!3861) from!3239))))))

(declare-fun b!1368316 () Bool)

(assert (=> b!1368316 (= e!775300 e!775298)))

(declare-fun res!911825 () Bool)

(assert (=> b!1368316 (=> (not res!911825) (not e!775298))))

(declare-fun acc!866 () List!31945)

(declare-fun arrayNoDuplicates!0 (array!92906 (_ BitVec 32) List!31945) Bool)

(assert (=> b!1368316 (= res!911825 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45191 0))(
  ( (Unit!45192) )
))
(declare-fun lt!602044 () Unit!45191)

(declare-fun noDuplicateSubseq!216 (List!31945 List!31945) Unit!45191)

(assert (=> b!1368316 (= lt!602044 (noDuplicateSubseq!216 newAcc!98 acc!866))))

(declare-fun res!911829 () Bool)

(assert (=> start!115714 (=> (not res!911829) (not e!775300))))

(assert (=> start!115714 (= res!911829 (and (bvslt (size!45427 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45427 a!3861))))))

(assert (=> start!115714 e!775300))

(declare-fun array_inv!33905 (array!92906) Bool)

(assert (=> start!115714 (array_inv!33905 a!3861)))

(assert (=> start!115714 true))

(declare-fun b!1368317 () Bool)

(declare-fun res!911822 () Bool)

(assert (=> b!1368317 (=> (not res!911822) (not e!775298))))

(assert (=> b!1368317 (= res!911822 (bvslt from!3239 (size!45427 a!3861)))))

(declare-fun b!1368318 () Bool)

(declare-fun res!911824 () Bool)

(assert (=> b!1368318 (=> (not res!911824) (not e!775300))))

(declare-fun noDuplicate!2484 (List!31945) Bool)

(assert (=> b!1368318 (= res!911824 (noDuplicate!2484 acc!866))))

(declare-fun b!1368319 () Bool)

(assert (=> b!1368319 (= e!775298 false)))

(declare-fun lt!602043 () Bool)

(assert (=> b!1368319 (= lt!602043 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368320 () Bool)

(declare-fun res!911826 () Bool)

(assert (=> b!1368320 (=> (not res!911826) (not e!775300))))

(declare-fun subseq!1029 (List!31945 List!31945) Bool)

(assert (=> b!1368320 (= res!911826 (subseq!1029 newAcc!98 acc!866))))

(declare-fun b!1368321 () Bool)

(declare-fun res!911828 () Bool)

(assert (=> b!1368321 (=> (not res!911828) (not e!775300))))

(assert (=> b!1368321 (= res!911828 (not (contains!9627 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368322 () Bool)

(declare-fun res!911823 () Bool)

(assert (=> b!1368322 (=> (not res!911823) (not e!775300))))

(assert (=> b!1368322 (= res!911823 (not (contains!9627 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115714 res!911829) b!1368318))

(assert (= (and b!1368318 res!911824) b!1368321))

(assert (= (and b!1368321 res!911828) b!1368322))

(assert (= (and b!1368322 res!911823) b!1368313))

(assert (= (and b!1368313 res!911820) b!1368312))

(assert (= (and b!1368312 res!911827) b!1368320))

(assert (= (and b!1368320 res!911826) b!1368316))

(assert (= (and b!1368316 res!911825) b!1368317))

(assert (= (and b!1368317 res!911822) b!1368315))

(assert (= (and b!1368315 res!911830) b!1368314))

(assert (= (and b!1368314 res!911821) b!1368319))

(declare-fun m!1252315 () Bool)

(assert (=> b!1368319 m!1252315))

(declare-fun m!1252317 () Bool)

(assert (=> b!1368318 m!1252317))

(declare-fun m!1252319 () Bool)

(assert (=> b!1368313 m!1252319))

(declare-fun m!1252321 () Bool)

(assert (=> start!115714 m!1252321))

(declare-fun m!1252323 () Bool)

(assert (=> b!1368321 m!1252323))

(declare-fun m!1252325 () Bool)

(assert (=> b!1368315 m!1252325))

(assert (=> b!1368315 m!1252325))

(declare-fun m!1252327 () Bool)

(assert (=> b!1368315 m!1252327))

(declare-fun m!1252329 () Bool)

(assert (=> b!1368320 m!1252329))

(declare-fun m!1252331 () Bool)

(assert (=> b!1368322 m!1252331))

(declare-fun m!1252333 () Bool)

(assert (=> b!1368312 m!1252333))

(declare-fun m!1252335 () Bool)

(assert (=> b!1368316 m!1252335))

(declare-fun m!1252337 () Bool)

(assert (=> b!1368316 m!1252337))

(check-sat (not b!1368316) (not b!1368321) (not b!1368322) (not b!1368318) (not b!1368320) (not b!1368315) (not start!115714) (not b!1368312) (not b!1368319) (not b!1368313))
(check-sat)
