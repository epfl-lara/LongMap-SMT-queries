; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124692 () Bool)

(assert start!124692)

(declare-fun res!977027 () Bool)

(declare-fun e!814109 () Bool)

(assert (=> start!124692 (=> (not res!977027) (not e!814109))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124692 (= res!977027 (validMask!0 mask!2687))))

(assert (=> start!124692 e!814109))

(assert (=> start!124692 true))

(declare-datatypes ((array!98140 0))(
  ( (array!98141 (arr!47358 (Array (_ BitVec 32) (_ BitVec 64))) (size!47908 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98140)

(declare-fun array_inv!36386 (array!98140) Bool)

(assert (=> start!124692 (array_inv!36386 a!2862)))

(declare-fun b!1445102 () Bool)

(declare-fun res!977015 () Bool)

(assert (=> b!1445102 (=> (not res!977015) (not e!814109))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445102 (= res!977015 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47908 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47908 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47908 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445103 () Bool)

(declare-fun res!977022 () Bool)

(declare-fun e!814103 () Bool)

(assert (=> b!1445103 (=> (not res!977022) (not e!814103))))

(declare-datatypes ((SeekEntryResult!11610 0))(
  ( (MissingZero!11610 (index!48832 (_ BitVec 32))) (Found!11610 (index!48833 (_ BitVec 32))) (Intermediate!11610 (undefined!12422 Bool) (index!48834 (_ BitVec 32)) (x!130523 (_ BitVec 32))) (Undefined!11610) (MissingVacant!11610 (index!48835 (_ BitVec 32))) )
))
(declare-fun lt!634401 () SeekEntryResult!11610)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98140 (_ BitVec 32)) SeekEntryResult!11610)

(assert (=> b!1445103 (= res!977022 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47358 a!2862) j!93) a!2862 mask!2687) lt!634401))))

(declare-fun b!1445104 () Bool)

(declare-fun res!977024 () Bool)

(declare-fun e!814104 () Bool)

(assert (=> b!1445104 (=> (not res!977024) (not e!814104))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98140 (_ BitVec 32)) SeekEntryResult!11610)

(assert (=> b!1445104 (= res!977024 (= (seekEntryOrOpen!0 (select (arr!47358 a!2862) j!93) a!2862 mask!2687) (Found!11610 j!93)))))

(declare-fun b!1445105 () Bool)

(declare-fun res!977017 () Bool)

(declare-fun e!814106 () Bool)

(assert (=> b!1445105 (=> (not res!977017) (not e!814106))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445105 (= res!977017 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445106 () Bool)

(assert (=> b!1445106 (= e!814103 e!814106)))

(declare-fun res!977023 () Bool)

(assert (=> b!1445106 (=> (not res!977023) (not e!814106))))

(declare-fun lt!634400 () SeekEntryResult!11610)

(assert (=> b!1445106 (= res!977023 (= lt!634400 (Intermediate!11610 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634399 () array!98140)

(declare-fun lt!634397 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445106 (= lt!634400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634397 mask!2687) lt!634397 lt!634399 mask!2687))))

(assert (=> b!1445106 (= lt!634397 (select (store (arr!47358 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445107 () Bool)

(declare-fun res!977016 () Bool)

(assert (=> b!1445107 (=> (not res!977016) (not e!814106))))

(declare-fun e!814105 () Bool)

(assert (=> b!1445107 (= res!977016 e!814105)))

(declare-fun c!133554 () Bool)

(assert (=> b!1445107 (= c!133554 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445108 () Bool)

(declare-fun e!814108 () Bool)

(assert (=> b!1445108 (= e!814109 e!814108)))

(declare-fun res!977029 () Bool)

(assert (=> b!1445108 (=> (not res!977029) (not e!814108))))

(assert (=> b!1445108 (= res!977029 (= (select (store (arr!47358 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445108 (= lt!634399 (array!98141 (store (arr!47358 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47908 a!2862)))))

(declare-fun b!1445109 () Bool)

(assert (=> b!1445109 (= e!814105 (= lt!634400 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634397 lt!634399 mask!2687)))))

(declare-fun b!1445110 () Bool)

(declare-fun res!977019 () Bool)

(assert (=> b!1445110 (=> (not res!977019) (not e!814109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445110 (= res!977019 (validKeyInArray!0 (select (arr!47358 a!2862) j!93)))))

(declare-fun b!1445111 () Bool)

(declare-fun res!977028 () Bool)

(assert (=> b!1445111 (=> (not res!977028) (not e!814109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98140 (_ BitVec 32)) Bool)

(assert (=> b!1445111 (= res!977028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445112 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98140 (_ BitVec 32)) SeekEntryResult!11610)

(assert (=> b!1445112 (= e!814105 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634397 lt!634399 mask!2687) (seekEntryOrOpen!0 lt!634397 lt!634399 mask!2687)))))

(declare-fun b!1445113 () Bool)

(declare-fun res!977025 () Bool)

(assert (=> b!1445113 (=> (not res!977025) (not e!814109))))

(assert (=> b!1445113 (= res!977025 (and (= (size!47908 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47908 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47908 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445114 () Bool)

(assert (=> b!1445114 (= e!814108 e!814103)))

(declare-fun res!977020 () Bool)

(assert (=> b!1445114 (=> (not res!977020) (not e!814103))))

(assert (=> b!1445114 (= res!977020 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47358 a!2862) j!93) mask!2687) (select (arr!47358 a!2862) j!93) a!2862 mask!2687) lt!634401))))

(assert (=> b!1445114 (= lt!634401 (Intermediate!11610 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445115 () Bool)

(assert (=> b!1445115 (= e!814104 (or (= (select (arr!47358 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47358 a!2862) intermediateBeforeIndex!19) (select (arr!47358 a!2862) j!93))))))

(declare-fun b!1445116 () Bool)

(assert (=> b!1445116 (= e!814106 (not true))))

(assert (=> b!1445116 e!814104))

(declare-fun res!977018 () Bool)

(assert (=> b!1445116 (=> (not res!977018) (not e!814104))))

(assert (=> b!1445116 (= res!977018 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48716 0))(
  ( (Unit!48717) )
))
(declare-fun lt!634398 () Unit!48716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48716)

(assert (=> b!1445116 (= lt!634398 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445117 () Bool)

(declare-fun res!977021 () Bool)

(assert (=> b!1445117 (=> (not res!977021) (not e!814109))))

(declare-datatypes ((List!33859 0))(
  ( (Nil!33856) (Cons!33855 (h!35205 (_ BitVec 64)) (t!48553 List!33859)) )
))
(declare-fun arrayNoDuplicates!0 (array!98140 (_ BitVec 32) List!33859) Bool)

(assert (=> b!1445117 (= res!977021 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33856))))

(declare-fun b!1445118 () Bool)

(declare-fun res!977026 () Bool)

(assert (=> b!1445118 (=> (not res!977026) (not e!814109))))

(assert (=> b!1445118 (= res!977026 (validKeyInArray!0 (select (arr!47358 a!2862) i!1006)))))

(assert (= (and start!124692 res!977027) b!1445113))

(assert (= (and b!1445113 res!977025) b!1445118))

(assert (= (and b!1445118 res!977026) b!1445110))

(assert (= (and b!1445110 res!977019) b!1445111))

(assert (= (and b!1445111 res!977028) b!1445117))

(assert (= (and b!1445117 res!977021) b!1445102))

(assert (= (and b!1445102 res!977015) b!1445108))

(assert (= (and b!1445108 res!977029) b!1445114))

(assert (= (and b!1445114 res!977020) b!1445103))

(assert (= (and b!1445103 res!977022) b!1445106))

(assert (= (and b!1445106 res!977023) b!1445107))

(assert (= (and b!1445107 c!133554) b!1445109))

(assert (= (and b!1445107 (not c!133554)) b!1445112))

(assert (= (and b!1445107 res!977016) b!1445105))

(assert (= (and b!1445105 res!977017) b!1445116))

(assert (= (and b!1445116 res!977018) b!1445104))

(assert (= (and b!1445104 res!977024) b!1445115))

(declare-fun m!1334081 () Bool)

(assert (=> start!124692 m!1334081))

(declare-fun m!1334083 () Bool)

(assert (=> start!124692 m!1334083))

(declare-fun m!1334085 () Bool)

(assert (=> b!1445111 m!1334085))

(declare-fun m!1334087 () Bool)

(assert (=> b!1445116 m!1334087))

(declare-fun m!1334089 () Bool)

(assert (=> b!1445116 m!1334089))

(declare-fun m!1334091 () Bool)

(assert (=> b!1445109 m!1334091))

(declare-fun m!1334093 () Bool)

(assert (=> b!1445112 m!1334093))

(declare-fun m!1334095 () Bool)

(assert (=> b!1445112 m!1334095))

(declare-fun m!1334097 () Bool)

(assert (=> b!1445110 m!1334097))

(assert (=> b!1445110 m!1334097))

(declare-fun m!1334099 () Bool)

(assert (=> b!1445110 m!1334099))

(assert (=> b!1445104 m!1334097))

(assert (=> b!1445104 m!1334097))

(declare-fun m!1334101 () Bool)

(assert (=> b!1445104 m!1334101))

(assert (=> b!1445114 m!1334097))

(assert (=> b!1445114 m!1334097))

(declare-fun m!1334103 () Bool)

(assert (=> b!1445114 m!1334103))

(assert (=> b!1445114 m!1334103))

(assert (=> b!1445114 m!1334097))

(declare-fun m!1334105 () Bool)

(assert (=> b!1445114 m!1334105))

(declare-fun m!1334107 () Bool)

(assert (=> b!1445106 m!1334107))

(assert (=> b!1445106 m!1334107))

(declare-fun m!1334109 () Bool)

(assert (=> b!1445106 m!1334109))

(declare-fun m!1334111 () Bool)

(assert (=> b!1445106 m!1334111))

(declare-fun m!1334113 () Bool)

(assert (=> b!1445106 m!1334113))

(assert (=> b!1445103 m!1334097))

(assert (=> b!1445103 m!1334097))

(declare-fun m!1334115 () Bool)

(assert (=> b!1445103 m!1334115))

(declare-fun m!1334117 () Bool)

(assert (=> b!1445115 m!1334117))

(assert (=> b!1445115 m!1334097))

(declare-fun m!1334119 () Bool)

(assert (=> b!1445117 m!1334119))

(assert (=> b!1445108 m!1334111))

(declare-fun m!1334121 () Bool)

(assert (=> b!1445108 m!1334121))

(declare-fun m!1334123 () Bool)

(assert (=> b!1445118 m!1334123))

(assert (=> b!1445118 m!1334123))

(declare-fun m!1334125 () Bool)

(assert (=> b!1445118 m!1334125))

(check-sat (not b!1445110) (not start!124692) (not b!1445109) (not b!1445106) (not b!1445112) (not b!1445104) (not b!1445114) (not b!1445103) (not b!1445117) (not b!1445111) (not b!1445118) (not b!1445116))
(check-sat)
