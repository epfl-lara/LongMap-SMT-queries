; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124514 () Bool)

(assert start!124514)

(declare-fun b!1440814 () Bool)

(declare-fun res!973241 () Bool)

(declare-fun e!812301 () Bool)

(assert (=> b!1440814 (=> (not res!973241) (not e!812301))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11521 0))(
  ( (MissingZero!11521 (index!48476 (_ BitVec 32))) (Found!11521 (index!48477 (_ BitVec 32))) (Intermediate!11521 (undefined!12333 Bool) (index!48478 (_ BitVec 32)) (x!130194 (_ BitVec 32))) (Undefined!11521) (MissingVacant!11521 (index!48479 (_ BitVec 32))) )
))
(declare-fun lt!633030 () SeekEntryResult!11521)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97962 0))(
  ( (array!97963 (arr!47269 (Array (_ BitVec 32) (_ BitVec 64))) (size!47819 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97962)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97962 (_ BitVec 32)) SeekEntryResult!11521)

(assert (=> b!1440814 (= res!973241 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47269 a!2862) j!93) a!2862 mask!2687) lt!633030))))

(declare-fun res!973248 () Bool)

(declare-fun e!812303 () Bool)

(assert (=> start!124514 (=> (not res!973248) (not e!812303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124514 (= res!973248 (validMask!0 mask!2687))))

(assert (=> start!124514 e!812303))

(assert (=> start!124514 true))

(declare-fun array_inv!36297 (array!97962) Bool)

(assert (=> start!124514 (array_inv!36297 a!2862)))

(declare-fun b!1440815 () Bool)

(declare-fun res!973243 () Bool)

(assert (=> b!1440815 (=> (not res!973243) (not e!812303))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440815 (= res!973243 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47819 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47819 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47819 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440816 () Bool)

(declare-fun res!973249 () Bool)

(assert (=> b!1440816 (=> (not res!973249) (not e!812303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440816 (= res!973249 (validKeyInArray!0 (select (arr!47269 a!2862) i!1006)))))

(declare-fun b!1440817 () Bool)

(declare-fun res!973245 () Bool)

(assert (=> b!1440817 (=> (not res!973245) (not e!812303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97962 (_ BitVec 32)) Bool)

(assert (=> b!1440817 (= res!973245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440818 () Bool)

(assert (=> b!1440818 (= e!812301 false)))

(declare-fun lt!633029 () SeekEntryResult!11521)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440818 (= lt!633029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97963 (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47819 a!2862)) mask!2687))))

(declare-fun b!1440819 () Bool)

(declare-fun res!973244 () Bool)

(assert (=> b!1440819 (=> (not res!973244) (not e!812303))))

(assert (=> b!1440819 (= res!973244 (validKeyInArray!0 (select (arr!47269 a!2862) j!93)))))

(declare-fun b!1440820 () Bool)

(declare-fun res!973242 () Bool)

(assert (=> b!1440820 (=> (not res!973242) (not e!812303))))

(declare-datatypes ((List!33770 0))(
  ( (Nil!33767) (Cons!33766 (h!35116 (_ BitVec 64)) (t!48464 List!33770)) )
))
(declare-fun arrayNoDuplicates!0 (array!97962 (_ BitVec 32) List!33770) Bool)

(assert (=> b!1440820 (= res!973242 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33767))))

(declare-fun b!1440821 () Bool)

(assert (=> b!1440821 (= e!812303 e!812301)))

(declare-fun res!973247 () Bool)

(assert (=> b!1440821 (=> (not res!973247) (not e!812301))))

(assert (=> b!1440821 (= res!973247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47269 a!2862) j!93) mask!2687) (select (arr!47269 a!2862) j!93) a!2862 mask!2687) lt!633030))))

(assert (=> b!1440821 (= lt!633030 (Intermediate!11521 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440822 () Bool)

(declare-fun res!973246 () Bool)

(assert (=> b!1440822 (=> (not res!973246) (not e!812303))))

(assert (=> b!1440822 (= res!973246 (and (= (size!47819 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47819 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47819 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124514 res!973248) b!1440822))

(assert (= (and b!1440822 res!973246) b!1440816))

(assert (= (and b!1440816 res!973249) b!1440819))

(assert (= (and b!1440819 res!973244) b!1440817))

(assert (= (and b!1440817 res!973245) b!1440820))

(assert (= (and b!1440820 res!973242) b!1440815))

(assert (= (and b!1440815 res!973243) b!1440821))

(assert (= (and b!1440821 res!973247) b!1440814))

(assert (= (and b!1440814 res!973241) b!1440818))

(declare-fun m!1330049 () Bool)

(assert (=> start!124514 m!1330049))

(declare-fun m!1330051 () Bool)

(assert (=> start!124514 m!1330051))

(declare-fun m!1330053 () Bool)

(assert (=> b!1440814 m!1330053))

(assert (=> b!1440814 m!1330053))

(declare-fun m!1330055 () Bool)

(assert (=> b!1440814 m!1330055))

(declare-fun m!1330057 () Bool)

(assert (=> b!1440818 m!1330057))

(declare-fun m!1330059 () Bool)

(assert (=> b!1440818 m!1330059))

(assert (=> b!1440818 m!1330059))

(declare-fun m!1330061 () Bool)

(assert (=> b!1440818 m!1330061))

(assert (=> b!1440818 m!1330061))

(assert (=> b!1440818 m!1330059))

(declare-fun m!1330063 () Bool)

(assert (=> b!1440818 m!1330063))

(declare-fun m!1330065 () Bool)

(assert (=> b!1440817 m!1330065))

(declare-fun m!1330067 () Bool)

(assert (=> b!1440820 m!1330067))

(assert (=> b!1440821 m!1330053))

(assert (=> b!1440821 m!1330053))

(declare-fun m!1330069 () Bool)

(assert (=> b!1440821 m!1330069))

(assert (=> b!1440821 m!1330069))

(assert (=> b!1440821 m!1330053))

(declare-fun m!1330071 () Bool)

(assert (=> b!1440821 m!1330071))

(declare-fun m!1330073 () Bool)

(assert (=> b!1440816 m!1330073))

(assert (=> b!1440816 m!1330073))

(declare-fun m!1330075 () Bool)

(assert (=> b!1440816 m!1330075))

(assert (=> b!1440815 m!1330057))

(declare-fun m!1330077 () Bool)

(assert (=> b!1440815 m!1330077))

(assert (=> b!1440819 m!1330053))

(assert (=> b!1440819 m!1330053))

(declare-fun m!1330079 () Bool)

(assert (=> b!1440819 m!1330079))

(push 1)

(assert (not b!1440821))

(assert (not b!1440814))

(assert (not start!124514))

(assert (not b!1440817))

(assert (not b!1440820))

(assert (not b!1440816))

(assert (not b!1440818))

(assert (not b!1440819))

(check-sat)

(pop 1)

