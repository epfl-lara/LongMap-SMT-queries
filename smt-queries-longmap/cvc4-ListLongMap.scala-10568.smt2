; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124550 () Bool)

(assert start!124550)

(declare-fun b!1441494 () Bool)

(declare-fun e!812597 () Bool)

(declare-fun e!812595 () Bool)

(assert (=> b!1441494 (= e!812597 e!812595)))

(declare-fun res!973838 () Bool)

(assert (=> b!1441494 (=> (not res!973838) (not e!812595))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97998 0))(
  ( (array!97999 (arr!47287 (Array (_ BitVec 32) (_ BitVec 64))) (size!47837 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97998)

(assert (=> b!1441494 (= res!973838 (= (select (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633263 () array!97998)

(assert (=> b!1441494 (= lt!633263 (array!97999 (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47837 a!2862)))))

(declare-fun res!973836 () Bool)

(assert (=> start!124550 (=> (not res!973836) (not e!812597))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124550 (= res!973836 (validMask!0 mask!2687))))

(assert (=> start!124550 e!812597))

(assert (=> start!124550 true))

(declare-fun array_inv!36315 (array!97998) Bool)

(assert (=> start!124550 (array_inv!36315 a!2862)))

(declare-fun b!1441495 () Bool)

(declare-fun res!973842 () Bool)

(assert (=> b!1441495 (=> (not res!973842) (not e!812597))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1441495 (= res!973842 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47837 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47837 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47837 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-datatypes ((SeekEntryResult!11539 0))(
  ( (MissingZero!11539 (index!48548 (_ BitVec 32))) (Found!11539 (index!48549 (_ BitVec 32))) (Intermediate!11539 (undefined!12351 Bool) (index!48550 (_ BitVec 32)) (x!130260 (_ BitVec 32))) (Undefined!11539) (MissingVacant!11539 (index!48551 (_ BitVec 32))) )
))
(declare-fun lt!633261 () SeekEntryResult!11539)

(declare-fun b!1441496 () Bool)

(declare-fun e!812596 () Bool)

(declare-fun lt!633262 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97998 (_ BitVec 32)) SeekEntryResult!11539)

(assert (=> b!1441496 (= e!812596 (not (= lt!633261 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633262 lt!633263 mask!2687))))))

(declare-fun b!1441497 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97998 (_ BitVec 32)) SeekEntryResult!11539)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97998 (_ BitVec 32)) SeekEntryResult!11539)

(assert (=> b!1441497 (= e!812596 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633262 lt!633263 mask!2687) (seekEntryOrOpen!0 lt!633262 lt!633263 mask!2687))))))

(declare-fun b!1441498 () Bool)

(declare-fun res!973843 () Bool)

(declare-fun e!812600 () Bool)

(assert (=> b!1441498 (=> (not res!973843) (not e!812600))))

(declare-fun lt!633260 () SeekEntryResult!11539)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1441498 (= res!973843 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47287 a!2862) j!93) a!2862 mask!2687) lt!633260))))

(declare-fun b!1441499 () Bool)

(assert (=> b!1441499 (= e!812595 e!812600)))

(declare-fun res!973840 () Bool)

(assert (=> b!1441499 (=> (not res!973840) (not e!812600))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441499 (= res!973840 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47287 a!2862) j!93) mask!2687) (select (arr!47287 a!2862) j!93) a!2862 mask!2687) lt!633260))))

(assert (=> b!1441499 (= lt!633260 (Intermediate!11539 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441500 () Bool)

(declare-fun res!973841 () Bool)

(assert (=> b!1441500 (=> (not res!973841) (not e!812597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441500 (= res!973841 (validKeyInArray!0 (select (arr!47287 a!2862) i!1006)))))

(declare-fun b!1441501 () Bool)

(declare-fun res!973833 () Bool)

(assert (=> b!1441501 (=> (not res!973833) (not e!812597))))

(declare-datatypes ((List!33788 0))(
  ( (Nil!33785) (Cons!33784 (h!35134 (_ BitVec 64)) (t!48482 List!33788)) )
))
(declare-fun arrayNoDuplicates!0 (array!97998 (_ BitVec 32) List!33788) Bool)

(assert (=> b!1441501 (= res!973833 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33785))))

(declare-fun b!1441502 () Bool)

(declare-fun e!812598 () Bool)

(assert (=> b!1441502 (= e!812598 false)))

(declare-fun lt!633264 () Bool)

(assert (=> b!1441502 (= lt!633264 e!812596)))

(declare-fun c!133341 () Bool)

(assert (=> b!1441502 (= c!133341 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441503 () Bool)

(declare-fun res!973834 () Bool)

(assert (=> b!1441503 (=> (not res!973834) (not e!812597))))

(assert (=> b!1441503 (= res!973834 (validKeyInArray!0 (select (arr!47287 a!2862) j!93)))))

(declare-fun b!1441504 () Bool)

(declare-fun res!973839 () Bool)

(assert (=> b!1441504 (=> (not res!973839) (not e!812597))))

(assert (=> b!1441504 (= res!973839 (and (= (size!47837 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47837 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47837 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441505 () Bool)

(declare-fun res!973835 () Bool)

(assert (=> b!1441505 (=> (not res!973835) (not e!812597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97998 (_ BitVec 32)) Bool)

(assert (=> b!1441505 (= res!973835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441506 () Bool)

(assert (=> b!1441506 (= e!812600 e!812598)))

(declare-fun res!973837 () Bool)

(assert (=> b!1441506 (=> (not res!973837) (not e!812598))))

(assert (=> b!1441506 (= res!973837 (= lt!633261 (Intermediate!11539 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1441506 (= lt!633261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633262 mask!2687) lt!633262 lt!633263 mask!2687))))

(assert (=> b!1441506 (= lt!633262 (select (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124550 res!973836) b!1441504))

(assert (= (and b!1441504 res!973839) b!1441500))

(assert (= (and b!1441500 res!973841) b!1441503))

(assert (= (and b!1441503 res!973834) b!1441505))

(assert (= (and b!1441505 res!973835) b!1441501))

(assert (= (and b!1441501 res!973833) b!1441495))

(assert (= (and b!1441495 res!973842) b!1441494))

(assert (= (and b!1441494 res!973838) b!1441499))

(assert (= (and b!1441499 res!973840) b!1441498))

(assert (= (and b!1441498 res!973843) b!1441506))

(assert (= (and b!1441506 res!973837) b!1441502))

(assert (= (and b!1441502 c!133341) b!1441496))

(assert (= (and b!1441502 (not c!133341)) b!1441497))

(declare-fun m!1330715 () Bool)

(assert (=> b!1441494 m!1330715))

(declare-fun m!1330717 () Bool)

(assert (=> b!1441494 m!1330717))

(declare-fun m!1330719 () Bool)

(assert (=> b!1441498 m!1330719))

(assert (=> b!1441498 m!1330719))

(declare-fun m!1330721 () Bool)

(assert (=> b!1441498 m!1330721))

(assert (=> b!1441499 m!1330719))

(assert (=> b!1441499 m!1330719))

(declare-fun m!1330723 () Bool)

(assert (=> b!1441499 m!1330723))

(assert (=> b!1441499 m!1330723))

(assert (=> b!1441499 m!1330719))

(declare-fun m!1330725 () Bool)

(assert (=> b!1441499 m!1330725))

(declare-fun m!1330727 () Bool)

(assert (=> b!1441497 m!1330727))

(declare-fun m!1330729 () Bool)

(assert (=> b!1441497 m!1330729))

(declare-fun m!1330731 () Bool)

(assert (=> start!124550 m!1330731))

(declare-fun m!1330733 () Bool)

(assert (=> start!124550 m!1330733))

(declare-fun m!1330735 () Bool)

(assert (=> b!1441501 m!1330735))

(declare-fun m!1330737 () Bool)

(assert (=> b!1441500 m!1330737))

(assert (=> b!1441500 m!1330737))

(declare-fun m!1330739 () Bool)

(assert (=> b!1441500 m!1330739))

(assert (=> b!1441503 m!1330719))

(assert (=> b!1441503 m!1330719))

(declare-fun m!1330741 () Bool)

(assert (=> b!1441503 m!1330741))

(declare-fun m!1330743 () Bool)

(assert (=> b!1441496 m!1330743))

(declare-fun m!1330745 () Bool)

(assert (=> b!1441506 m!1330745))

(assert (=> b!1441506 m!1330745))

(declare-fun m!1330747 () Bool)

(assert (=> b!1441506 m!1330747))

(assert (=> b!1441506 m!1330715))

(declare-fun m!1330749 () Bool)

(assert (=> b!1441506 m!1330749))

(declare-fun m!1330751 () Bool)

(assert (=> b!1441505 m!1330751))

(push 1)

(assert (not b!1441498))

(assert (not b!1441500))

(assert (not start!124550))

(assert (not b!1441497))

(assert (not b!1441506))

