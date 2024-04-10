; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125490 () Bool)

(assert start!125490)

(declare-fun b!1468129 () Bool)

(declare-fun e!824480 () Bool)

(declare-fun e!824478 () Bool)

(assert (=> b!1468129 (= e!824480 e!824478)))

(declare-fun res!996672 () Bool)

(assert (=> b!1468129 (=> (not res!996672) (not e!824478))))

(declare-datatypes ((array!98938 0))(
  ( (array!98939 (arr!47757 (Array (_ BitVec 32) (_ BitVec 64))) (size!48307 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98938)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11997 0))(
  ( (MissingZero!11997 (index!50380 (_ BitVec 32))) (Found!11997 (index!50381 (_ BitVec 32))) (Intermediate!11997 (undefined!12809 Bool) (index!50382 (_ BitVec 32)) (x!131974 (_ BitVec 32))) (Undefined!11997) (MissingVacant!11997 (index!50383 (_ BitVec 32))) )
))
(declare-fun lt!642221 () SeekEntryResult!11997)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98938 (_ BitVec 32)) SeekEntryResult!11997)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468129 (= res!996672 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47757 a!2862) j!93) mask!2687) (select (arr!47757 a!2862) j!93) a!2862 mask!2687) lt!642221))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468129 (= lt!642221 (Intermediate!11997 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468130 () Bool)

(declare-fun res!996669 () Bool)

(assert (=> b!1468130 (=> (not res!996669) (not e!824480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468130 (= res!996669 (validKeyInArray!0 (select (arr!47757 a!2862) j!93)))))

(declare-fun b!1468131 () Bool)

(declare-fun res!996668 () Bool)

(assert (=> b!1468131 (=> (not res!996668) (not e!824480))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468131 (= res!996668 (and (= (size!48307 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48307 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48307 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!996673 () Bool)

(assert (=> start!125490 (=> (not res!996673) (not e!824480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125490 (= res!996673 (validMask!0 mask!2687))))

(assert (=> start!125490 e!824480))

(assert (=> start!125490 true))

(declare-fun array_inv!36785 (array!98938) Bool)

(assert (=> start!125490 (array_inv!36785 a!2862)))

(declare-fun b!1468132 () Bool)

(declare-fun res!996674 () Bool)

(assert (=> b!1468132 (=> (not res!996674) (not e!824480))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468132 (= res!996674 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48307 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48307 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48307 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47757 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468133 () Bool)

(assert (=> b!1468133 (= e!824478 false)))

(declare-fun lt!642222 () SeekEntryResult!11997)

(assert (=> b!1468133 (= lt!642222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47757 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47757 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98939 (store (arr!47757 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48307 a!2862)) mask!2687))))

(declare-fun b!1468134 () Bool)

(declare-fun res!996676 () Bool)

(assert (=> b!1468134 (=> (not res!996676) (not e!824480))))

(assert (=> b!1468134 (= res!996676 (validKeyInArray!0 (select (arr!47757 a!2862) i!1006)))))

(declare-fun b!1468135 () Bool)

(declare-fun res!996671 () Bool)

(assert (=> b!1468135 (=> (not res!996671) (not e!824480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98938 (_ BitVec 32)) Bool)

(assert (=> b!1468135 (= res!996671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468136 () Bool)

(declare-fun res!996675 () Bool)

(assert (=> b!1468136 (=> (not res!996675) (not e!824480))))

(declare-datatypes ((List!34258 0))(
  ( (Nil!34255) (Cons!34254 (h!35604 (_ BitVec 64)) (t!48952 List!34258)) )
))
(declare-fun arrayNoDuplicates!0 (array!98938 (_ BitVec 32) List!34258) Bool)

(assert (=> b!1468136 (= res!996675 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34255))))

(declare-fun b!1468137 () Bool)

(declare-fun res!996670 () Bool)

(assert (=> b!1468137 (=> (not res!996670) (not e!824478))))

(assert (=> b!1468137 (= res!996670 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47757 a!2862) j!93) a!2862 mask!2687) lt!642221))))

(assert (= (and start!125490 res!996673) b!1468131))

(assert (= (and b!1468131 res!996668) b!1468134))

(assert (= (and b!1468134 res!996676) b!1468130))

(assert (= (and b!1468130 res!996669) b!1468135))

(assert (= (and b!1468135 res!996671) b!1468136))

(assert (= (and b!1468136 res!996675) b!1468132))

(assert (= (and b!1468132 res!996674) b!1468129))

(assert (= (and b!1468129 res!996672) b!1468137))

(assert (= (and b!1468137 res!996670) b!1468133))

(declare-fun m!1355133 () Bool)

(assert (=> b!1468129 m!1355133))

(assert (=> b!1468129 m!1355133))

(declare-fun m!1355135 () Bool)

(assert (=> b!1468129 m!1355135))

(assert (=> b!1468129 m!1355135))

(assert (=> b!1468129 m!1355133))

(declare-fun m!1355137 () Bool)

(assert (=> b!1468129 m!1355137))

(declare-fun m!1355139 () Bool)

(assert (=> b!1468133 m!1355139))

(declare-fun m!1355141 () Bool)

(assert (=> b!1468133 m!1355141))

(assert (=> b!1468133 m!1355141))

(declare-fun m!1355143 () Bool)

(assert (=> b!1468133 m!1355143))

(assert (=> b!1468133 m!1355143))

(assert (=> b!1468133 m!1355141))

(declare-fun m!1355145 () Bool)

(assert (=> b!1468133 m!1355145))

(declare-fun m!1355147 () Bool)

(assert (=> b!1468134 m!1355147))

(assert (=> b!1468134 m!1355147))

(declare-fun m!1355149 () Bool)

(assert (=> b!1468134 m!1355149))

(declare-fun m!1355151 () Bool)

(assert (=> b!1468136 m!1355151))

(assert (=> b!1468130 m!1355133))

(assert (=> b!1468130 m!1355133))

(declare-fun m!1355153 () Bool)

(assert (=> b!1468130 m!1355153))

(assert (=> b!1468132 m!1355139))

(declare-fun m!1355155 () Bool)

(assert (=> b!1468132 m!1355155))

(declare-fun m!1355157 () Bool)

(assert (=> b!1468135 m!1355157))

(declare-fun m!1355159 () Bool)

(assert (=> start!125490 m!1355159))

(declare-fun m!1355161 () Bool)

(assert (=> start!125490 m!1355161))

(assert (=> b!1468137 m!1355133))

(assert (=> b!1468137 m!1355133))

(declare-fun m!1355163 () Bool)

(assert (=> b!1468137 m!1355163))

(check-sat (not b!1468134) (not b!1468133) (not b!1468129) (not b!1468135) (not b!1468130) (not b!1468137) (not b!1468136) (not start!125490))
(check-sat)
