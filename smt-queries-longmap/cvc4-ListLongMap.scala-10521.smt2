; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124064 () Bool)

(assert start!124064)

(declare-fun b!1436577 () Bool)

(declare-fun res!969493 () Bool)

(declare-fun e!810656 () Bool)

(assert (=> b!1436577 (=> (not res!969493) (not e!810656))))

(declare-datatypes ((array!97701 0))(
  ( (array!97702 (arr!47146 (Array (_ BitVec 32) (_ BitVec 64))) (size!47696 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97701)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436577 (= res!969493 (validKeyInArray!0 (select (arr!47146 a!2862) j!93)))))

(declare-fun b!1436578 () Bool)

(declare-fun res!969499 () Bool)

(assert (=> b!1436578 (=> (not res!969499) (not e!810656))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436578 (= res!969499 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47696 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47696 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47696 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47146 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436579 () Bool)

(declare-fun res!969497 () Bool)

(assert (=> b!1436579 (=> (not res!969497) (not e!810656))))

(assert (=> b!1436579 (= res!969497 (validKeyInArray!0 (select (arr!47146 a!2862) i!1006)))))

(declare-fun b!1436580 () Bool)

(declare-fun res!969495 () Bool)

(assert (=> b!1436580 (=> (not res!969495) (not e!810656))))

(declare-datatypes ((List!33647 0))(
  ( (Nil!33644) (Cons!33643 (h!34978 (_ BitVec 64)) (t!48341 List!33647)) )
))
(declare-fun arrayNoDuplicates!0 (array!97701 (_ BitVec 32) List!33647) Bool)

(assert (=> b!1436580 (= res!969495 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33644))))

(declare-fun b!1436581 () Bool)

(declare-fun res!969494 () Bool)

(assert (=> b!1436581 (=> (not res!969494) (not e!810656))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97701 (_ BitVec 32)) Bool)

(assert (=> b!1436581 (= res!969494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!969496 () Bool)

(assert (=> start!124064 (=> (not res!969496) (not e!810656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124064 (= res!969496 (validMask!0 mask!2687))))

(assert (=> start!124064 e!810656))

(assert (=> start!124064 true))

(declare-fun array_inv!36174 (array!97701) Bool)

(assert (=> start!124064 (array_inv!36174 a!2862)))

(declare-fun b!1436582 () Bool)

(declare-fun res!969498 () Bool)

(assert (=> b!1436582 (=> (not res!969498) (not e!810656))))

(assert (=> b!1436582 (= res!969498 (and (= (size!47696 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47696 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47696 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436583 () Bool)

(declare-fun lt!632148 () (_ BitVec 32))

(assert (=> b!1436583 (= e!810656 (and (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632148 #b00000000000000000000000000000000) (bvsge lt!632148 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436583 (= lt!632148 (toIndex!0 (select (arr!47146 a!2862) j!93) mask!2687))))

(assert (= (and start!124064 res!969496) b!1436582))

(assert (= (and b!1436582 res!969498) b!1436579))

(assert (= (and b!1436579 res!969497) b!1436577))

(assert (= (and b!1436577 res!969493) b!1436581))

(assert (= (and b!1436581 res!969494) b!1436580))

(assert (= (and b!1436580 res!969495) b!1436578))

(assert (= (and b!1436578 res!969499) b!1436583))

(declare-fun m!1325895 () Bool)

(assert (=> start!124064 m!1325895))

(declare-fun m!1325897 () Bool)

(assert (=> start!124064 m!1325897))

(declare-fun m!1325899 () Bool)

(assert (=> b!1436580 m!1325899))

(declare-fun m!1325901 () Bool)

(assert (=> b!1436583 m!1325901))

(assert (=> b!1436583 m!1325901))

(declare-fun m!1325903 () Bool)

(assert (=> b!1436583 m!1325903))

(assert (=> b!1436577 m!1325901))

(assert (=> b!1436577 m!1325901))

(declare-fun m!1325905 () Bool)

(assert (=> b!1436577 m!1325905))

(declare-fun m!1325907 () Bool)

(assert (=> b!1436581 m!1325907))

(declare-fun m!1325909 () Bool)

(assert (=> b!1436578 m!1325909))

(declare-fun m!1325911 () Bool)

(assert (=> b!1436578 m!1325911))

(declare-fun m!1325913 () Bool)

(assert (=> b!1436579 m!1325913))

(assert (=> b!1436579 m!1325913))

(declare-fun m!1325915 () Bool)

(assert (=> b!1436579 m!1325915))

(push 1)

(assert (not b!1436583))

(assert (not b!1436581))

(assert (not b!1436577))

(assert (not b!1436580))

(assert (not start!124064))

(assert (not b!1436579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154597 () Bool)

(assert (=> d!154597 (= (validKeyInArray!0 (select (arr!47146 a!2862) j!93)) (and (not (= (select (arr!47146 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47146 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436577 d!154597))

(declare-fun d!154601 () Bool)

(declare-fun lt!632184 () (_ BitVec 32))

(declare-fun lt!632183 () (_ BitVec 32))

(assert (=> d!154601 (= lt!632184 (bvmul (bvxor lt!632183 (bvlshr lt!632183 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154601 (= lt!632183 ((_ extract 31 0) (bvand (bvxor (select (arr!47146 a!2862) j!93) (bvlshr (select (arr!47146 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154601 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!969532 (let ((h!34981 ((_ extract 31 0) (bvand (bvxor (select (arr!47146 a!2862) j!93) (bvlshr (select (arr!47146 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129722 (bvmul (bvxor h!34981 (bvlshr h!34981 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129722 (bvlshr x!129722 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!969532 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!969532 #b00000000000000000000000000000000))))))

(assert (=> d!154601 (= (toIndex!0 (select (arr!47146 a!2862) j!93) mask!2687) (bvand (bvxor lt!632184 (bvlshr lt!632184 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1436583 d!154601))

(declare-fun b!1436646 () Bool)

(declare-fun e!810705 () Bool)

(declare-fun e!810707 () Bool)

(assert (=> b!1436646 (= e!810705 e!810707)))

(declare-fun lt!632192 () (_ BitVec 64))

(assert (=> b!1436646 (= lt!632192 (select (arr!47146 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48554 0))(
  ( (Unit!48555) )
))
(declare-fun lt!632193 () Unit!48554)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97701 (_ BitVec 64) (_ BitVec 32)) Unit!48554)

(assert (=> b!1436646 (= lt!632193 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632192 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1436646 (arrayContainsKey!0 a!2862 lt!632192 #b00000000000000000000000000000000)))

(declare-fun lt!632191 () Unit!48554)

(assert (=> b!1436646 (= lt!632191 lt!632193)))

(declare-fun res!969537 () Bool)

(declare-datatypes ((SeekEntryResult!11404 0))(
  ( (MissingZero!11404 (index!48008 (_ BitVec 32))) (Found!11404 (index!48009 (_ BitVec 32))) (Intermediate!11404 (undefined!12216 Bool) (index!48010 (_ BitVec 32)) (x!129725 (_ BitVec 32))) (Undefined!11404) (MissingVacant!11404 (index!48011 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97701 (_ BitVec 32)) SeekEntryResult!11404)

(assert (=> b!1436646 (= res!969537 (= (seekEntryOrOpen!0 (select (arr!47146 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11404 #b00000000000000000000000000000000)))))

(assert (=> b!1436646 (=> (not res!969537) (not e!810707))))

(declare-fun d!154607 () Bool)

(declare-fun res!969538 () Bool)

(declare-fun e!810706 () Bool)

(assert (=> d!154607 (=> res!969538 e!810706)))

(assert (=> d!154607 (= res!969538 (bvsge #b00000000000000000000000000000000 (size!47696 a!2862)))))

(assert (=> d!154607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810706)))

(declare-fun bm!67618 () Bool)

(declare-fun call!67621 () Bool)

(assert (=> bm!67618 (= call!67621 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1436647 () Bool)

(assert (=> b!1436647 (= e!810707 call!67621)))

(declare-fun b!1436648 () Bool)

(assert (=> b!1436648 (= e!810705 call!67621)))

(declare-fun b!1436649 () Bool)

(assert (=> b!1436649 (= e!810706 e!810705)))

(declare-fun c!133059 () Bool)

(assert (=> b!1436649 (= c!133059 (validKeyInArray!0 (select (arr!47146 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154607 (not res!969538)) b!1436649))

(assert (= (and b!1436649 c!133059) b!1436646))

(assert (= (and b!1436649 (not c!133059)) b!1436648))

(assert (= (and b!1436646 res!969537) b!1436647))

(assert (= (or b!1436647 b!1436648) bm!67618))

(declare-fun m!1325949 () Bool)

(assert (=> b!1436646 m!1325949))

(declare-fun m!1325951 () Bool)

(assert (=> b!1436646 m!1325951))

(declare-fun m!1325953 () Bool)

(assert (=> b!1436646 m!1325953))

(assert (=> b!1436646 m!1325949))

(declare-fun m!1325955 () Bool)

(assert (=> b!1436646 m!1325955))

(declare-fun m!1325957 () Bool)

(assert (=> bm!67618 m!1325957))

(assert (=> b!1436649 m!1325949))

(assert (=> b!1436649 m!1325949))

(declare-fun m!1325959 () Bool)

(assert (=> b!1436649 m!1325959))

(assert (=> b!1436581 d!154607))

(declare-fun d!154609 () Bool)

(assert (=> d!154609 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

