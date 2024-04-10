; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124506 () Bool)

(assert start!124506)

(declare-fun b!1440702 () Bool)

(declare-fun res!973136 () Bool)

(declare-fun e!812266 () Bool)

(assert (=> b!1440702 (=> (not res!973136) (not e!812266))))

(declare-datatypes ((array!97954 0))(
  ( (array!97955 (arr!47265 (Array (_ BitVec 32) (_ BitVec 64))) (size!47815 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97954)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440702 (= res!973136 (validKeyInArray!0 (select (arr!47265 a!2862) j!93)))))

(declare-fun b!1440703 () Bool)

(declare-fun res!973135 () Bool)

(assert (=> b!1440703 (=> (not res!973135) (not e!812266))))

(declare-datatypes ((List!33766 0))(
  ( (Nil!33763) (Cons!33762 (h!35112 (_ BitVec 64)) (t!48460 List!33766)) )
))
(declare-fun arrayNoDuplicates!0 (array!97954 (_ BitVec 32) List!33766) Bool)

(assert (=> b!1440703 (= res!973135 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33763))))

(declare-fun b!1440704 () Bool)

(declare-fun res!973138 () Bool)

(assert (=> b!1440704 (=> (not res!973138) (not e!812266))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440704 (= res!973138 (and (= (size!47815 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47815 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47815 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440705 () Bool)

(declare-fun res!973129 () Bool)

(declare-fun e!812265 () Bool)

(assert (=> b!1440705 (=> (not res!973129) (not e!812265))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11517 0))(
  ( (MissingZero!11517 (index!48460 (_ BitVec 32))) (Found!11517 (index!48461 (_ BitVec 32))) (Intermediate!11517 (undefined!12329 Bool) (index!48462 (_ BitVec 32)) (x!130182 (_ BitVec 32))) (Undefined!11517) (MissingVacant!11517 (index!48463 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97954 (_ BitVec 32)) SeekEntryResult!11517)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440705 (= res!973129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47265 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47265 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97955 (store (arr!47265 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47815 a!2862)) mask!2687) (Intermediate!11517 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440706 () Bool)

(declare-fun res!973137 () Bool)

(assert (=> b!1440706 (=> (not res!973137) (not e!812266))))

(assert (=> b!1440706 (= res!973137 (validKeyInArray!0 (select (arr!47265 a!2862) i!1006)))))

(declare-fun res!973131 () Bool)

(assert (=> start!124506 (=> (not res!973131) (not e!812266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124506 (= res!973131 (validMask!0 mask!2687))))

(assert (=> start!124506 e!812266))

(assert (=> start!124506 true))

(declare-fun array_inv!36293 (array!97954) Bool)

(assert (=> start!124506 (array_inv!36293 a!2862)))

(declare-fun b!1440707 () Bool)

(declare-fun res!973133 () Bool)

(assert (=> b!1440707 (=> (not res!973133) (not e!812266))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440707 (= res!973133 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47815 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47815 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47815 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47265 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440708 () Bool)

(assert (=> b!1440708 (= e!812265 (and (bvsgt x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1440709 () Bool)

(declare-fun res!973132 () Bool)

(assert (=> b!1440709 (=> (not res!973132) (not e!812265))))

(declare-fun lt!633009 () SeekEntryResult!11517)

(assert (=> b!1440709 (= res!973132 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47265 a!2862) j!93) a!2862 mask!2687) lt!633009))))

(declare-fun b!1440710 () Bool)

(assert (=> b!1440710 (= e!812266 e!812265)))

(declare-fun res!973134 () Bool)

(assert (=> b!1440710 (=> (not res!973134) (not e!812265))))

(assert (=> b!1440710 (= res!973134 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47265 a!2862) j!93) mask!2687) (select (arr!47265 a!2862) j!93) a!2862 mask!2687) lt!633009))))

(assert (=> b!1440710 (= lt!633009 (Intermediate!11517 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440711 () Bool)

(declare-fun res!973130 () Bool)

(assert (=> b!1440711 (=> (not res!973130) (not e!812266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97954 (_ BitVec 32)) Bool)

(assert (=> b!1440711 (= res!973130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124506 res!973131) b!1440704))

(assert (= (and b!1440704 res!973138) b!1440706))

(assert (= (and b!1440706 res!973137) b!1440702))

(assert (= (and b!1440702 res!973136) b!1440711))

(assert (= (and b!1440711 res!973130) b!1440703))

(assert (= (and b!1440703 res!973135) b!1440707))

(assert (= (and b!1440707 res!973133) b!1440710))

(assert (= (and b!1440710 res!973134) b!1440709))

(assert (= (and b!1440709 res!973132) b!1440705))

(assert (= (and b!1440705 res!973129) b!1440708))

(declare-fun m!1329921 () Bool)

(assert (=> start!124506 m!1329921))

(declare-fun m!1329923 () Bool)

(assert (=> start!124506 m!1329923))

(declare-fun m!1329925 () Bool)

(assert (=> b!1440707 m!1329925))

(declare-fun m!1329927 () Bool)

(assert (=> b!1440707 m!1329927))

(declare-fun m!1329929 () Bool)

(assert (=> b!1440709 m!1329929))

(assert (=> b!1440709 m!1329929))

(declare-fun m!1329931 () Bool)

(assert (=> b!1440709 m!1329931))

(assert (=> b!1440705 m!1329925))

(declare-fun m!1329933 () Bool)

(assert (=> b!1440705 m!1329933))

(assert (=> b!1440705 m!1329933))

(declare-fun m!1329935 () Bool)

(assert (=> b!1440705 m!1329935))

(assert (=> b!1440705 m!1329935))

(assert (=> b!1440705 m!1329933))

(declare-fun m!1329937 () Bool)

(assert (=> b!1440705 m!1329937))

(declare-fun m!1329939 () Bool)

(assert (=> b!1440706 m!1329939))

(assert (=> b!1440706 m!1329939))

(declare-fun m!1329941 () Bool)

(assert (=> b!1440706 m!1329941))

(declare-fun m!1329943 () Bool)

(assert (=> b!1440703 m!1329943))

(assert (=> b!1440710 m!1329929))

(assert (=> b!1440710 m!1329929))

(declare-fun m!1329945 () Bool)

(assert (=> b!1440710 m!1329945))

(assert (=> b!1440710 m!1329945))

(assert (=> b!1440710 m!1329929))

(declare-fun m!1329947 () Bool)

(assert (=> b!1440710 m!1329947))

(assert (=> b!1440702 m!1329929))

(assert (=> b!1440702 m!1329929))

(declare-fun m!1329949 () Bool)

(assert (=> b!1440702 m!1329949))

(declare-fun m!1329951 () Bool)

(assert (=> b!1440711 m!1329951))

(check-sat (not b!1440706) (not b!1440711) (not b!1440709) (not start!124506) (not b!1440710) (not b!1440702) (not b!1440705) (not b!1440703))
(check-sat)
