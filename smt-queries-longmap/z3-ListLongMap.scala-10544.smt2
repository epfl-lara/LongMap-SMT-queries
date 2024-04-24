; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124620 () Bool)

(assert start!124620)

(declare-fun b!1440521 () Bool)

(declare-fun res!972128 () Bool)

(declare-fun e!812626 () Bool)

(assert (=> b!1440521 (=> (not res!972128) (not e!812626))))

(declare-datatypes ((array!97963 0))(
  ( (array!97964 (arr!47266 (Array (_ BitVec 32) (_ BitVec 64))) (size!47817 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97963)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440521 (= res!972128 (validKeyInArray!0 (select (arr!47266 a!2862) j!93)))))

(declare-fun b!1440522 () Bool)

(declare-fun res!972129 () Bool)

(assert (=> b!1440522 (=> (not res!972129) (not e!812626))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440522 (= res!972129 (validKeyInArray!0 (select (arr!47266 a!2862) i!1006)))))

(declare-fun b!1440523 () Bool)

(declare-fun res!972126 () Bool)

(assert (=> b!1440523 (=> (not res!972126) (not e!812626))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440523 (= res!972126 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47817 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47817 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47817 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440524 () Bool)

(declare-fun e!812627 () Bool)

(assert (=> b!1440524 (= e!812626 e!812627)))

(declare-fun res!972124 () Bool)

(assert (=> b!1440524 (=> (not res!972124) (not e!812627))))

(declare-datatypes ((SeekEntryResult!11415 0))(
  ( (MissingZero!11415 (index!48052 (_ BitVec 32))) (Found!11415 (index!48053 (_ BitVec 32))) (Intermediate!11415 (undefined!12227 Bool) (index!48054 (_ BitVec 32)) (x!129968 (_ BitVec 32))) (Undefined!11415) (MissingVacant!11415 (index!48055 (_ BitVec 32))) )
))
(declare-fun lt!633243 () SeekEntryResult!11415)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97963 (_ BitVec 32)) SeekEntryResult!11415)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440524 (= res!972124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47266 a!2862) j!93) mask!2687) (select (arr!47266 a!2862) j!93) a!2862 mask!2687) lt!633243))))

(assert (=> b!1440524 (= lt!633243 (Intermediate!11415 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440525 () Bool)

(declare-fun res!972125 () Bool)

(assert (=> b!1440525 (=> (not res!972125) (not e!812627))))

(assert (=> b!1440525 (= res!972125 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47266 a!2862) j!93) a!2862 mask!2687) lt!633243))))

(declare-fun b!1440526 () Bool)

(declare-fun res!972127 () Bool)

(assert (=> b!1440526 (=> (not res!972127) (not e!812626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97963 (_ BitVec 32)) Bool)

(assert (=> b!1440526 (= res!972127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440527 () Bool)

(assert (=> b!1440527 (= e!812627 false)))

(declare-fun lt!633244 () SeekEntryResult!11415)

(assert (=> b!1440527 (= lt!633244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97964 (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47817 a!2862)) mask!2687))))

(declare-fun b!1440528 () Bool)

(declare-fun res!972123 () Bool)

(assert (=> b!1440528 (=> (not res!972123) (not e!812626))))

(assert (=> b!1440528 (= res!972123 (and (= (size!47817 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47817 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47817 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!972130 () Bool)

(assert (=> start!124620 (=> (not res!972130) (not e!812626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124620 (= res!972130 (validMask!0 mask!2687))))

(assert (=> start!124620 e!812626))

(assert (=> start!124620 true))

(declare-fun array_inv!36547 (array!97963) Bool)

(assert (=> start!124620 (array_inv!36547 a!2862)))

(declare-fun b!1440529 () Bool)

(declare-fun res!972131 () Bool)

(assert (=> b!1440529 (=> (not res!972131) (not e!812626))))

(declare-datatypes ((List!33754 0))(
  ( (Nil!33751) (Cons!33750 (h!35111 (_ BitVec 64)) (t!48440 List!33754)) )
))
(declare-fun arrayNoDuplicates!0 (array!97963 (_ BitVec 32) List!33754) Bool)

(assert (=> b!1440529 (= res!972131 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33751))))

(assert (= (and start!124620 res!972130) b!1440528))

(assert (= (and b!1440528 res!972123) b!1440522))

(assert (= (and b!1440522 res!972129) b!1440521))

(assert (= (and b!1440521 res!972128) b!1440526))

(assert (= (and b!1440526 res!972127) b!1440529))

(assert (= (and b!1440529 res!972131) b!1440523))

(assert (= (and b!1440523 res!972126) b!1440524))

(assert (= (and b!1440524 res!972124) b!1440525))

(assert (= (and b!1440525 res!972125) b!1440527))

(declare-fun m!1329679 () Bool)

(assert (=> b!1440525 m!1329679))

(assert (=> b!1440525 m!1329679))

(declare-fun m!1329681 () Bool)

(assert (=> b!1440525 m!1329681))

(assert (=> b!1440524 m!1329679))

(assert (=> b!1440524 m!1329679))

(declare-fun m!1329683 () Bool)

(assert (=> b!1440524 m!1329683))

(assert (=> b!1440524 m!1329683))

(assert (=> b!1440524 m!1329679))

(declare-fun m!1329685 () Bool)

(assert (=> b!1440524 m!1329685))

(declare-fun m!1329687 () Bool)

(assert (=> b!1440529 m!1329687))

(declare-fun m!1329689 () Bool)

(assert (=> start!124620 m!1329689))

(declare-fun m!1329691 () Bool)

(assert (=> start!124620 m!1329691))

(declare-fun m!1329693 () Bool)

(assert (=> b!1440526 m!1329693))

(declare-fun m!1329695 () Bool)

(assert (=> b!1440523 m!1329695))

(declare-fun m!1329697 () Bool)

(assert (=> b!1440523 m!1329697))

(assert (=> b!1440521 m!1329679))

(assert (=> b!1440521 m!1329679))

(declare-fun m!1329699 () Bool)

(assert (=> b!1440521 m!1329699))

(assert (=> b!1440527 m!1329695))

(declare-fun m!1329701 () Bool)

(assert (=> b!1440527 m!1329701))

(assert (=> b!1440527 m!1329701))

(declare-fun m!1329703 () Bool)

(assert (=> b!1440527 m!1329703))

(assert (=> b!1440527 m!1329703))

(assert (=> b!1440527 m!1329701))

(declare-fun m!1329705 () Bool)

(assert (=> b!1440527 m!1329705))

(declare-fun m!1329707 () Bool)

(assert (=> b!1440522 m!1329707))

(assert (=> b!1440522 m!1329707))

(declare-fun m!1329709 () Bool)

(assert (=> b!1440522 m!1329709))

(check-sat (not b!1440529) (not b!1440527) (not b!1440524) (not b!1440526) (not b!1440521) (not b!1440522) (not b!1440525) (not start!124620))
(check-sat)
