; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124450 () Bool)

(assert start!124450)

(declare-fun b!1440126 () Bool)

(declare-fun e!812033 () Bool)

(declare-fun e!812032 () Bool)

(assert (=> b!1440126 (= e!812033 e!812032)))

(declare-fun res!972677 () Bool)

(assert (=> b!1440126 (=> (not res!972677) (not e!812032))))

(declare-datatypes ((array!97876 0))(
  ( (array!97877 (arr!47227 (Array (_ BitVec 32) (_ BitVec 64))) (size!47779 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97876)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11504 0))(
  ( (MissingZero!11504 (index!48408 (_ BitVec 32))) (Found!11504 (index!48409 (_ BitVec 32))) (Intermediate!11504 (undefined!12316 Bool) (index!48410 (_ BitVec 32)) (x!130132 (_ BitVec 32))) (Undefined!11504) (MissingVacant!11504 (index!48411 (_ BitVec 32))) )
))
(declare-fun lt!632718 () SeekEntryResult!11504)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97876 (_ BitVec 32)) SeekEntryResult!11504)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440126 (= res!972677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47227 a!2862) j!93) mask!2687) (select (arr!47227 a!2862) j!93) a!2862 mask!2687) lt!632718))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440126 (= lt!632718 (Intermediate!11504 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440127 () Bool)

(declare-fun res!972675 () Bool)

(assert (=> b!1440127 (=> (not res!972675) (not e!812033))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440127 (= res!972675 (and (= (size!47779 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47779 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47779 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1440128 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440128 (= e!812032 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun res!972672 () Bool)

(assert (=> start!124450 (=> (not res!972672) (not e!812033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124450 (= res!972672 (validMask!0 mask!2687))))

(assert (=> start!124450 e!812033))

(assert (=> start!124450 true))

(declare-fun array_inv!36460 (array!97876) Bool)

(assert (=> start!124450 (array_inv!36460 a!2862)))

(declare-fun b!1440129 () Bool)

(declare-fun res!972670 () Bool)

(assert (=> b!1440129 (=> (not res!972670) (not e!812033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440129 (= res!972670 (validKeyInArray!0 (select (arr!47227 a!2862) j!93)))))

(declare-fun b!1440130 () Bool)

(declare-fun res!972674 () Bool)

(assert (=> b!1440130 (=> (not res!972674) (not e!812033))))

(assert (=> b!1440130 (= res!972674 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47779 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47779 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47779 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47227 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440131 () Bool)

(declare-fun res!972671 () Bool)

(assert (=> b!1440131 (=> (not res!972671) (not e!812032))))

(assert (=> b!1440131 (= res!972671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47227 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47227 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97877 (store (arr!47227 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47779 a!2862)) mask!2687) (Intermediate!11504 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440132 () Bool)

(declare-fun res!972673 () Bool)

(assert (=> b!1440132 (=> (not res!972673) (not e!812032))))

(assert (=> b!1440132 (= res!972673 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47227 a!2862) j!93) a!2862 mask!2687) lt!632718))))

(declare-fun b!1440133 () Bool)

(declare-fun res!972676 () Bool)

(assert (=> b!1440133 (=> (not res!972676) (not e!812033))))

(declare-datatypes ((List!33806 0))(
  ( (Nil!33803) (Cons!33802 (h!35152 (_ BitVec 64)) (t!48492 List!33806)) )
))
(declare-fun arrayNoDuplicates!0 (array!97876 (_ BitVec 32) List!33806) Bool)

(assert (=> b!1440133 (= res!972676 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33803))))

(declare-fun b!1440134 () Bool)

(declare-fun res!972679 () Bool)

(assert (=> b!1440134 (=> (not res!972679) (not e!812033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97876 (_ BitVec 32)) Bool)

(assert (=> b!1440134 (= res!972679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440135 () Bool)

(declare-fun res!972678 () Bool)

(assert (=> b!1440135 (=> (not res!972678) (not e!812033))))

(assert (=> b!1440135 (= res!972678 (validKeyInArray!0 (select (arr!47227 a!2862) i!1006)))))

(assert (= (and start!124450 res!972672) b!1440127))

(assert (= (and b!1440127 res!972675) b!1440135))

(assert (= (and b!1440135 res!972678) b!1440129))

(assert (= (and b!1440129 res!972670) b!1440134))

(assert (= (and b!1440134 res!972679) b!1440133))

(assert (= (and b!1440133 res!972676) b!1440130))

(assert (= (and b!1440130 res!972674) b!1440126))

(assert (= (and b!1440126 res!972677) b!1440132))

(assert (= (and b!1440132 res!972673) b!1440131))

(assert (= (and b!1440131 res!972671) b!1440128))

(declare-fun m!1328823 () Bool)

(assert (=> b!1440130 m!1328823))

(declare-fun m!1328825 () Bool)

(assert (=> b!1440130 m!1328825))

(declare-fun m!1328827 () Bool)

(assert (=> b!1440126 m!1328827))

(assert (=> b!1440126 m!1328827))

(declare-fun m!1328829 () Bool)

(assert (=> b!1440126 m!1328829))

(assert (=> b!1440126 m!1328829))

(assert (=> b!1440126 m!1328827))

(declare-fun m!1328831 () Bool)

(assert (=> b!1440126 m!1328831))

(assert (=> b!1440131 m!1328823))

(declare-fun m!1328833 () Bool)

(assert (=> b!1440131 m!1328833))

(assert (=> b!1440131 m!1328833))

(declare-fun m!1328835 () Bool)

(assert (=> b!1440131 m!1328835))

(assert (=> b!1440131 m!1328835))

(assert (=> b!1440131 m!1328833))

(declare-fun m!1328837 () Bool)

(assert (=> b!1440131 m!1328837))

(declare-fun m!1328839 () Bool)

(assert (=> b!1440133 m!1328839))

(declare-fun m!1328841 () Bool)

(assert (=> start!124450 m!1328841))

(declare-fun m!1328843 () Bool)

(assert (=> start!124450 m!1328843))

(declare-fun m!1328845 () Bool)

(assert (=> b!1440135 m!1328845))

(assert (=> b!1440135 m!1328845))

(declare-fun m!1328847 () Bool)

(assert (=> b!1440135 m!1328847))

(assert (=> b!1440132 m!1328827))

(assert (=> b!1440132 m!1328827))

(declare-fun m!1328849 () Bool)

(assert (=> b!1440132 m!1328849))

(assert (=> b!1440129 m!1328827))

(assert (=> b!1440129 m!1328827))

(declare-fun m!1328851 () Bool)

(assert (=> b!1440129 m!1328851))

(declare-fun m!1328853 () Bool)

(assert (=> b!1440134 m!1328853))

(check-sat (not b!1440133) (not b!1440134) (not b!1440131) (not b!1440132) (not b!1440126) (not b!1440135) (not start!124450) (not b!1440129))
(check-sat)
