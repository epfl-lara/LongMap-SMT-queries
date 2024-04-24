; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124710 () Bool)

(assert start!124710)

(declare-fun b!1441821 () Bool)

(declare-fun res!973424 () Bool)

(declare-fun e!813040 () Bool)

(assert (=> b!1441821 (=> (not res!973424) (not e!813040))))

(declare-datatypes ((array!98053 0))(
  ( (array!98054 (arr!47311 (Array (_ BitVec 32) (_ BitVec 64))) (size!47862 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98053)

(declare-datatypes ((List!33799 0))(
  ( (Nil!33796) (Cons!33795 (h!35156 (_ BitVec 64)) (t!48485 List!33799)) )
))
(declare-fun arrayNoDuplicates!0 (array!98053 (_ BitVec 32) List!33799) Bool)

(assert (=> b!1441821 (= res!973424 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33796))))

(declare-fun b!1441822 () Bool)

(declare-fun res!973423 () Bool)

(assert (=> b!1441822 (=> (not res!973423) (not e!813040))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441822 (= res!973423 (validKeyInArray!0 (select (arr!47311 a!2862) j!93)))))

(declare-fun b!1441823 () Bool)

(declare-fun res!973425 () Bool)

(assert (=> b!1441823 (=> (not res!973425) (not e!813040))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441823 (= res!973425 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47862 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47862 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47862 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1441824 () Bool)

(declare-fun res!973426 () Bool)

(declare-fun e!813042 () Bool)

(assert (=> b!1441824 (=> (not res!973426) (not e!813042))))

(declare-datatypes ((SeekEntryResult!11460 0))(
  ( (MissingZero!11460 (index!48232 (_ BitVec 32))) (Found!11460 (index!48233 (_ BitVec 32))) (Intermediate!11460 (undefined!12272 Bool) (index!48234 (_ BitVec 32)) (x!130133 (_ BitVec 32))) (Undefined!11460) (MissingVacant!11460 (index!48235 (_ BitVec 32))) )
))
(declare-fun lt!633457 () SeekEntryResult!11460)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98053 (_ BitVec 32)) SeekEntryResult!11460)

(assert (=> b!1441824 (= res!973426 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47311 a!2862) j!93) a!2862 mask!2687) lt!633457))))

(declare-fun b!1441825 () Bool)

(assert (=> b!1441825 (= e!813040 e!813042)))

(declare-fun res!973432 () Bool)

(assert (=> b!1441825 (=> (not res!973432) (not e!813042))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441825 (= res!973432 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47311 a!2862) j!93) mask!2687) (select (arr!47311 a!2862) j!93) a!2862 mask!2687) lt!633457))))

(assert (=> b!1441825 (= lt!633457 (Intermediate!11460 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!973428 () Bool)

(assert (=> start!124710 (=> (not res!973428) (not e!813040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124710 (= res!973428 (validMask!0 mask!2687))))

(assert (=> start!124710 e!813040))

(assert (=> start!124710 true))

(declare-fun array_inv!36592 (array!98053) Bool)

(assert (=> start!124710 (array_inv!36592 a!2862)))

(declare-fun b!1441826 () Bool)

(declare-fun res!973429 () Bool)

(assert (=> b!1441826 (=> (not res!973429) (not e!813042))))

(assert (=> b!1441826 (= res!973429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98054 (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47862 a!2862)) mask!2687) (Intermediate!11460 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1441827 () Bool)

(declare-fun res!973430 () Bool)

(assert (=> b!1441827 (=> (not res!973430) (not e!813040))))

(assert (=> b!1441827 (= res!973430 (validKeyInArray!0 (select (arr!47311 a!2862) i!1006)))))

(declare-fun b!1441828 () Bool)

(declare-fun res!973433 () Bool)

(assert (=> b!1441828 (=> (not res!973433) (not e!813040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98053 (_ BitVec 32)) Bool)

(assert (=> b!1441828 (= res!973433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441829 () Bool)

(assert (=> b!1441829 (= e!813042 (not (validKeyInArray!0 (select (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1441830 () Bool)

(declare-fun res!973431 () Bool)

(assert (=> b!1441830 (=> (not res!973431) (not e!813040))))

(assert (=> b!1441830 (= res!973431 (and (= (size!47862 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47862 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47862 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441831 () Bool)

(declare-fun res!973427 () Bool)

(assert (=> b!1441831 (=> (not res!973427) (not e!813042))))

(assert (=> b!1441831 (= res!973427 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvslt intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(assert (= (and start!124710 res!973428) b!1441830))

(assert (= (and b!1441830 res!973431) b!1441827))

(assert (= (and b!1441827 res!973430) b!1441822))

(assert (= (and b!1441822 res!973423) b!1441828))

(assert (= (and b!1441828 res!973433) b!1441821))

(assert (= (and b!1441821 res!973424) b!1441823))

(assert (= (and b!1441823 res!973425) b!1441825))

(assert (= (and b!1441825 res!973432) b!1441824))

(assert (= (and b!1441824 res!973426) b!1441826))

(assert (= (and b!1441826 res!973429) b!1441831))

(assert (= (and b!1441831 res!973427) b!1441829))

(declare-fun m!1331131 () Bool)

(assert (=> b!1441823 m!1331131))

(declare-fun m!1331133 () Bool)

(assert (=> b!1441823 m!1331133))

(assert (=> b!1441829 m!1331131))

(declare-fun m!1331135 () Bool)

(assert (=> b!1441829 m!1331135))

(assert (=> b!1441829 m!1331135))

(declare-fun m!1331137 () Bool)

(assert (=> b!1441829 m!1331137))

(declare-fun m!1331139 () Bool)

(assert (=> b!1441825 m!1331139))

(assert (=> b!1441825 m!1331139))

(declare-fun m!1331141 () Bool)

(assert (=> b!1441825 m!1331141))

(assert (=> b!1441825 m!1331141))

(assert (=> b!1441825 m!1331139))

(declare-fun m!1331143 () Bool)

(assert (=> b!1441825 m!1331143))

(declare-fun m!1331145 () Bool)

(assert (=> b!1441821 m!1331145))

(assert (=> b!1441822 m!1331139))

(assert (=> b!1441822 m!1331139))

(declare-fun m!1331147 () Bool)

(assert (=> b!1441822 m!1331147))

(declare-fun m!1331149 () Bool)

(assert (=> start!124710 m!1331149))

(declare-fun m!1331151 () Bool)

(assert (=> start!124710 m!1331151))

(declare-fun m!1331153 () Bool)

(assert (=> b!1441828 m!1331153))

(assert (=> b!1441826 m!1331131))

(assert (=> b!1441826 m!1331135))

(assert (=> b!1441826 m!1331135))

(declare-fun m!1331155 () Bool)

(assert (=> b!1441826 m!1331155))

(assert (=> b!1441826 m!1331155))

(assert (=> b!1441826 m!1331135))

(declare-fun m!1331157 () Bool)

(assert (=> b!1441826 m!1331157))

(declare-fun m!1331159 () Bool)

(assert (=> b!1441827 m!1331159))

(assert (=> b!1441827 m!1331159))

(declare-fun m!1331161 () Bool)

(assert (=> b!1441827 m!1331161))

(assert (=> b!1441824 m!1331139))

(assert (=> b!1441824 m!1331139))

(declare-fun m!1331163 () Bool)

(assert (=> b!1441824 m!1331163))

(check-sat (not b!1441829) (not b!1441821) (not b!1441828) (not b!1441827) (not b!1441822) (not b!1441826) (not b!1441825) (not b!1441824) (not start!124710))
(check-sat)
