; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116572 () Bool)

(assert start!116572)

(declare-fun b!1374551 () Bool)

(declare-fun res!917017 () Bool)

(declare-fun e!778767 () Bool)

(assert (=> b!1374551 (=> (not res!917017) (not e!778767))))

(declare-datatypes ((List!32080 0))(
  ( (Nil!32077) (Cons!32076 (h!33294 (_ BitVec 64)) (t!46766 List!32080)) )
))
(declare-fun acc!866 () List!32080)

(declare-fun contains!9765 (List!32080 (_ BitVec 64)) Bool)

(assert (=> b!1374551 (= res!917017 (not (contains!9765 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374552 () Bool)

(declare-fun res!917016 () Bool)

(declare-fun e!778766 () Bool)

(assert (=> b!1374552 (=> (not res!917016) (not e!778766))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!93241 0))(
  ( (array!93242 (arr!45025 (Array (_ BitVec 32) (_ BitVec 64))) (size!45576 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93241)

(assert (=> b!1374552 (= res!917016 (bvslt from!3239 (size!45576 a!3861)))))

(declare-fun b!1374553 () Bool)

(declare-fun res!917023 () Bool)

(assert (=> b!1374553 (=> (not res!917023) (not e!778767))))

(declare-fun noDuplicate!2596 (List!32080) Bool)

(assert (=> b!1374553 (= res!917023 (noDuplicate!2596 acc!866))))

(declare-fun b!1374554 () Bool)

(declare-fun res!917014 () Bool)

(assert (=> b!1374554 (=> (not res!917014) (not e!778767))))

(declare-fun newAcc!98 () List!32080)

(declare-fun subseq!1124 (List!32080 List!32080) Bool)

(assert (=> b!1374554 (= res!917014 (subseq!1124 newAcc!98 acc!866))))

(declare-fun b!1374555 () Bool)

(declare-fun res!917018 () Bool)

(assert (=> b!1374555 (=> (not res!917018) (not e!778766))))

(assert (=> b!1374555 (= res!917018 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1374556 () Bool)

(declare-fun res!917024 () Bool)

(assert (=> b!1374556 (=> (not res!917024) (not e!778766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374556 (= res!917024 (not (validKeyInArray!0 (select (arr!45025 a!3861) from!3239))))))

(declare-fun b!1374557 () Bool)

(assert (=> b!1374557 (= e!778767 e!778766)))

(declare-fun res!917019 () Bool)

(assert (=> b!1374557 (=> (not res!917019) (not e!778766))))

(declare-fun arrayNoDuplicates!0 (array!93241 (_ BitVec 32) List!32080) Bool)

(assert (=> b!1374557 (= res!917019 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45320 0))(
  ( (Unit!45321) )
))
(declare-fun lt!603504 () Unit!45320)

(declare-fun noDuplicateSubseq!311 (List!32080 List!32080) Unit!45320)

(assert (=> b!1374557 (= lt!603504 (noDuplicateSubseq!311 newAcc!98 acc!866))))

(declare-fun res!917025 () Bool)

(assert (=> start!116572 (=> (not res!917025) (not e!778767))))

(assert (=> start!116572 (= res!917025 (and (bvslt (size!45576 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45576 a!3861))))))

(assert (=> start!116572 e!778767))

(declare-fun array_inv!34306 (array!93241) Bool)

(assert (=> start!116572 (array_inv!34306 a!3861)))

(assert (=> start!116572 true))

(declare-fun b!1374558 () Bool)

(declare-fun res!917021 () Bool)

(assert (=> b!1374558 (=> (not res!917021) (not e!778767))))

(assert (=> b!1374558 (= res!917021 (not (contains!9765 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374559 () Bool)

(declare-fun res!917015 () Bool)

(assert (=> b!1374559 (=> (not res!917015) (not e!778767))))

(assert (=> b!1374559 (= res!917015 (not (contains!9765 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374560 () Bool)

(declare-fun res!917020 () Bool)

(assert (=> b!1374560 (=> (not res!917020) (not e!778767))))

(assert (=> b!1374560 (= res!917020 (not (contains!9765 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374561 () Bool)

(declare-fun res!917022 () Bool)

(assert (=> b!1374561 (=> (not res!917022) (not e!778766))))

(assert (=> b!1374561 (= res!917022 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1374562 () Bool)

(assert (=> b!1374562 (= e!778766 (bvsge (bvsub (size!45576 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) (bvsub (size!45576 a!3861) from!3239)))))

(assert (= (and start!116572 res!917025) b!1374553))

(assert (= (and b!1374553 res!917023) b!1374559))

(assert (= (and b!1374559 res!917015) b!1374551))

(assert (= (and b!1374551 res!917017) b!1374558))

(assert (= (and b!1374558 res!917021) b!1374560))

(assert (= (and b!1374560 res!917020) b!1374554))

(assert (= (and b!1374554 res!917014) b!1374557))

(assert (= (and b!1374557 res!917019) b!1374552))

(assert (= (and b!1374552 res!917016) b!1374556))

(assert (= (and b!1374556 res!917024) b!1374555))

(assert (= (and b!1374555 res!917018) b!1374561))

(assert (= (and b!1374561 res!917022) b!1374562))

(declare-fun m!1258141 () Bool)

(assert (=> start!116572 m!1258141))

(declare-fun m!1258143 () Bool)

(assert (=> b!1374557 m!1258143))

(declare-fun m!1258145 () Bool)

(assert (=> b!1374557 m!1258145))

(declare-fun m!1258147 () Bool)

(assert (=> b!1374560 m!1258147))

(declare-fun m!1258149 () Bool)

(assert (=> b!1374553 m!1258149))

(declare-fun m!1258151 () Bool)

(assert (=> b!1374551 m!1258151))

(declare-fun m!1258153 () Bool)

(assert (=> b!1374559 m!1258153))

(declare-fun m!1258155 () Bool)

(assert (=> b!1374556 m!1258155))

(assert (=> b!1374556 m!1258155))

(declare-fun m!1258157 () Bool)

(assert (=> b!1374556 m!1258157))

(declare-fun m!1258159 () Bool)

(assert (=> b!1374561 m!1258159))

(declare-fun m!1258161 () Bool)

(assert (=> b!1374558 m!1258161))

(declare-fun m!1258163 () Bool)

(assert (=> b!1374554 m!1258163))

(check-sat (not b!1374560) (not b!1374559) (not b!1374561) (not b!1374556) (not b!1374551) (not start!116572) (not b!1374554) (not b!1374553) (not b!1374557) (not b!1374558))
(check-sat)
