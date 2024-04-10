; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124438 () Bool)

(assert start!124438)

(declare-fun b!1439716 () Bool)

(declare-fun res!972151 () Bool)

(declare-fun e!811960 () Bool)

(assert (=> b!1439716 (=> (not res!972151) (not e!811960))))

(declare-datatypes ((SeekEntryResult!11483 0))(
  ( (MissingZero!11483 (index!48324 (_ BitVec 32))) (Found!11483 (index!48325 (_ BitVec 32))) (Intermediate!11483 (undefined!12295 Bool) (index!48326 (_ BitVec 32)) (x!130060 (_ BitVec 32))) (Undefined!11483) (MissingVacant!11483 (index!48327 (_ BitVec 32))) )
))
(declare-fun lt!632856 () SeekEntryResult!11483)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97886 0))(
  ( (array!97887 (arr!47231 (Array (_ BitVec 32) (_ BitVec 64))) (size!47781 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97886)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97886 (_ BitVec 32)) SeekEntryResult!11483)

(assert (=> b!1439716 (= res!972151 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47231 a!2862) j!93) a!2862 mask!2687) lt!632856))))

(declare-fun b!1439717 () Bool)

(declare-fun res!972144 () Bool)

(declare-fun e!811959 () Bool)

(assert (=> b!1439717 (=> (not res!972144) (not e!811959))))

(declare-datatypes ((List!33732 0))(
  ( (Nil!33729) (Cons!33728 (h!35078 (_ BitVec 64)) (t!48426 List!33732)) )
))
(declare-fun arrayNoDuplicates!0 (array!97886 (_ BitVec 32) List!33732) Bool)

(assert (=> b!1439717 (= res!972144 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33729))))

(declare-fun b!1439718 () Bool)

(declare-fun res!972147 () Bool)

(assert (=> b!1439718 (=> (not res!972147) (not e!811959))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439718 (= res!972147 (validKeyInArray!0 (select (arr!47231 a!2862) i!1006)))))

(declare-fun b!1439720 () Bool)

(declare-fun res!972143 () Bool)

(assert (=> b!1439720 (=> (not res!972143) (not e!811959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97886 (_ BitVec 32)) Bool)

(assert (=> b!1439720 (= res!972143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439721 () Bool)

(declare-fun res!972149 () Bool)

(assert (=> b!1439721 (=> (not res!972149) (not e!811959))))

(assert (=> b!1439721 (= res!972149 (validKeyInArray!0 (select (arr!47231 a!2862) j!93)))))

(declare-fun b!1439722 () Bool)

(declare-fun res!972145 () Bool)

(assert (=> b!1439722 (=> (not res!972145) (not e!811959))))

(assert (=> b!1439722 (= res!972145 (and (= (size!47781 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47781 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47781 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439723 () Bool)

(assert (=> b!1439723 (= e!811959 e!811960)))

(declare-fun res!972146 () Bool)

(assert (=> b!1439723 (=> (not res!972146) (not e!811960))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439723 (= res!972146 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47231 a!2862) j!93) mask!2687) (select (arr!47231 a!2862) j!93) a!2862 mask!2687) lt!632856))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439723 (= lt!632856 (Intermediate!11483 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439724 () Bool)

(declare-fun res!972148 () Bool)

(assert (=> b!1439724 (=> (not res!972148) (not e!811959))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439724 (= res!972148 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47781 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47781 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47781 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47231 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439719 () Bool)

(assert (=> b!1439719 (= e!811960 false)))

(declare-fun lt!632855 () SeekEntryResult!11483)

(assert (=> b!1439719 (= lt!632855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47231 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47231 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97887 (store (arr!47231 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47781 a!2862)) mask!2687))))

(declare-fun res!972150 () Bool)

(assert (=> start!124438 (=> (not res!972150) (not e!811959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124438 (= res!972150 (validMask!0 mask!2687))))

(assert (=> start!124438 e!811959))

(assert (=> start!124438 true))

(declare-fun array_inv!36259 (array!97886) Bool)

(assert (=> start!124438 (array_inv!36259 a!2862)))

(assert (= (and start!124438 res!972150) b!1439722))

(assert (= (and b!1439722 res!972145) b!1439718))

(assert (= (and b!1439718 res!972147) b!1439721))

(assert (= (and b!1439721 res!972149) b!1439720))

(assert (= (and b!1439720 res!972143) b!1439717))

(assert (= (and b!1439717 res!972144) b!1439724))

(assert (= (and b!1439724 res!972148) b!1439723))

(assert (= (and b!1439723 res!972146) b!1439716))

(assert (= (and b!1439716 res!972151) b!1439719))

(declare-fun m!1328821 () Bool)

(assert (=> b!1439717 m!1328821))

(declare-fun m!1328823 () Bool)

(assert (=> start!124438 m!1328823))

(declare-fun m!1328825 () Bool)

(assert (=> start!124438 m!1328825))

(declare-fun m!1328827 () Bool)

(assert (=> b!1439720 m!1328827))

(declare-fun m!1328829 () Bool)

(assert (=> b!1439719 m!1328829))

(declare-fun m!1328831 () Bool)

(assert (=> b!1439719 m!1328831))

(assert (=> b!1439719 m!1328831))

(declare-fun m!1328833 () Bool)

(assert (=> b!1439719 m!1328833))

(assert (=> b!1439719 m!1328833))

(assert (=> b!1439719 m!1328831))

(declare-fun m!1328835 () Bool)

(assert (=> b!1439719 m!1328835))

(declare-fun m!1328837 () Bool)

(assert (=> b!1439721 m!1328837))

(assert (=> b!1439721 m!1328837))

(declare-fun m!1328839 () Bool)

(assert (=> b!1439721 m!1328839))

(declare-fun m!1328841 () Bool)

(assert (=> b!1439718 m!1328841))

(assert (=> b!1439718 m!1328841))

(declare-fun m!1328843 () Bool)

(assert (=> b!1439718 m!1328843))

(assert (=> b!1439723 m!1328837))

(assert (=> b!1439723 m!1328837))

(declare-fun m!1328845 () Bool)

(assert (=> b!1439723 m!1328845))

(assert (=> b!1439723 m!1328845))

(assert (=> b!1439723 m!1328837))

(declare-fun m!1328847 () Bool)

(assert (=> b!1439723 m!1328847))

(assert (=> b!1439724 m!1328829))

(declare-fun m!1328849 () Bool)

(assert (=> b!1439724 m!1328849))

(assert (=> b!1439716 m!1328837))

(assert (=> b!1439716 m!1328837))

(declare-fun m!1328851 () Bool)

(assert (=> b!1439716 m!1328851))

(push 1)

