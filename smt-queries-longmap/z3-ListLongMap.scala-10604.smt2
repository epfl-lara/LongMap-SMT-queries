; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124732 () Bool)

(assert start!124732)

(declare-fun b!1446750 () Bool)

(declare-fun res!978581 () Bool)

(declare-fun e!814817 () Bool)

(assert (=> b!1446750 (=> (not res!978581) (not e!814817))))

(declare-datatypes ((array!98158 0))(
  ( (array!98159 (arr!47368 (Array (_ BitVec 32) (_ BitVec 64))) (size!47920 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98158)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446750 (= res!978581 (validKeyInArray!0 (select (arr!47368 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634748 () array!98158)

(declare-fun lt!634752 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!814809 () Bool)

(declare-fun b!1446751 () Bool)

(declare-datatypes ((SeekEntryResult!11645 0))(
  ( (MissingZero!11645 (index!48972 (_ BitVec 32))) (Found!11645 (index!48973 (_ BitVec 32))) (Intermediate!11645 (undefined!12457 Bool) (index!48974 (_ BitVec 32)) (x!130649 (_ BitVec 32))) (Undefined!11645) (MissingVacant!11645 (index!48975 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98158 (_ BitVec 32)) SeekEntryResult!11645)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98158 (_ BitVec 32)) SeekEntryResult!11645)

(assert (=> b!1446751 (= e!814809 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634752 lt!634748 mask!2687) (seekEntryOrOpen!0 lt!634752 lt!634748 mask!2687)))))

(declare-fun b!1446752 () Bool)

(declare-fun e!814814 () Bool)

(declare-fun e!814810 () Bool)

(assert (=> b!1446752 (= e!814814 e!814810)))

(declare-fun res!978577 () Bool)

(assert (=> b!1446752 (=> (not res!978577) (not e!814810))))

(declare-fun lt!634749 () SeekEntryResult!11645)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98158 (_ BitVec 32)) SeekEntryResult!11645)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446752 (= res!978577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47368 a!2862) j!93) mask!2687) (select (arr!47368 a!2862) j!93) a!2862 mask!2687) lt!634749))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446752 (= lt!634749 (Intermediate!11645 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446753 () Bool)

(declare-fun e!814816 () Bool)

(assert (=> b!1446753 (= e!814810 e!814816)))

(declare-fun res!978584 () Bool)

(assert (=> b!1446753 (=> (not res!978584) (not e!814816))))

(declare-fun lt!634750 () SeekEntryResult!11645)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446753 (= res!978584 (= lt!634750 (Intermediate!11645 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446753 (= lt!634750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634752 mask!2687) lt!634752 lt!634748 mask!2687))))

(assert (=> b!1446753 (= lt!634752 (select (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446754 () Bool)

(declare-fun res!978582 () Bool)

(assert (=> b!1446754 (=> (not res!978582) (not e!814817))))

(assert (=> b!1446754 (= res!978582 (and (= (size!47920 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47920 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47920 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446755 () Bool)

(declare-fun res!978580 () Bool)

(assert (=> b!1446755 (=> (not res!978580) (not e!814816))))

(assert (=> b!1446755 (= res!978580 e!814809)))

(declare-fun c!133603 () Bool)

(assert (=> b!1446755 (= c!133603 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446756 () Bool)

(declare-fun e!814813 () Bool)

(declare-fun e!814815 () Bool)

(assert (=> b!1446756 (= e!814813 e!814815)))

(declare-fun res!978585 () Bool)

(assert (=> b!1446756 (=> res!978585 e!814815)))

(assert (=> b!1446756 (= res!978585 (or (and (= (select (arr!47368 a!2862) index!646) (select (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47368 a!2862) index!646) (select (arr!47368 a!2862) j!93))) (not (= (select (arr!47368 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446757 () Bool)

(declare-fun res!978572 () Bool)

(assert (=> b!1446757 (=> (not res!978572) (not e!814817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98158 (_ BitVec 32)) Bool)

(assert (=> b!1446757 (= res!978572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446758 () Bool)

(assert (=> b!1446758 (= e!814817 e!814814)))

(declare-fun res!978576 () Bool)

(assert (=> b!1446758 (=> (not res!978576) (not e!814814))))

(assert (=> b!1446758 (= res!978576 (= (select (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446758 (= lt!634748 (array!98159 (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47920 a!2862)))))

(declare-fun res!978570 () Bool)

(assert (=> start!124732 (=> (not res!978570) (not e!814817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124732 (= res!978570 (validMask!0 mask!2687))))

(assert (=> start!124732 e!814817))

(assert (=> start!124732 true))

(declare-fun array_inv!36601 (array!98158) Bool)

(assert (=> start!124732 (array_inv!36601 a!2862)))

(declare-fun b!1446759 () Bool)

(declare-fun res!978583 () Bool)

(assert (=> b!1446759 (=> (not res!978583) (not e!814816))))

(assert (=> b!1446759 (= res!978583 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446760 () Bool)

(declare-fun res!978574 () Bool)

(assert (=> b!1446760 (=> (not res!978574) (not e!814817))))

(assert (=> b!1446760 (= res!978574 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47920 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47920 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47920 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446761 () Bool)

(declare-fun e!814811 () Bool)

(assert (=> b!1446761 (= e!814811 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446762 () Bool)

(declare-fun res!978575 () Bool)

(assert (=> b!1446762 (=> (not res!978575) (not e!814810))))

(assert (=> b!1446762 (= res!978575 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47368 a!2862) j!93) a!2862 mask!2687) lt!634749))))

(declare-fun b!1446763 () Bool)

(declare-fun res!978579 () Bool)

(assert (=> b!1446763 (=> (not res!978579) (not e!814817))))

(assert (=> b!1446763 (= res!978579 (validKeyInArray!0 (select (arr!47368 a!2862) j!93)))))

(declare-fun b!1446764 () Bool)

(assert (=> b!1446764 (= e!814815 e!814811)))

(declare-fun res!978571 () Bool)

(assert (=> b!1446764 (=> (not res!978571) (not e!814811))))

(declare-fun lt!634751 () SeekEntryResult!11645)

(assert (=> b!1446764 (= res!978571 (= lt!634751 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47368 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446765 () Bool)

(declare-fun res!978573 () Bool)

(assert (=> b!1446765 (=> (not res!978573) (not e!814817))))

(declare-datatypes ((List!33947 0))(
  ( (Nil!33944) (Cons!33943 (h!35293 (_ BitVec 64)) (t!48633 List!33947)) )
))
(declare-fun arrayNoDuplicates!0 (array!98158 (_ BitVec 32) List!33947) Bool)

(assert (=> b!1446765 (= res!978573 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33944))))

(declare-fun b!1446766 () Bool)

(assert (=> b!1446766 (= e!814809 (= lt!634750 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634752 lt!634748 mask!2687)))))

(declare-fun b!1446767 () Bool)

(declare-fun e!814818 () Bool)

(assert (=> b!1446767 (= e!814816 (not e!814818))))

(declare-fun res!978586 () Bool)

(assert (=> b!1446767 (=> res!978586 e!814818)))

(assert (=> b!1446767 (= res!978586 (or (and (= (select (arr!47368 a!2862) index!646) (select (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47368 a!2862) index!646) (select (arr!47368 a!2862) j!93))) (not (= (select (arr!47368 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47368 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1446767 e!814813))

(declare-fun res!978578 () Bool)

(assert (=> b!1446767 (=> (not res!978578) (not e!814813))))

(assert (=> b!1446767 (= res!978578 (and (= lt!634751 (Found!11645 j!93)) (or (= (select (arr!47368 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47368 a!2862) intermediateBeforeIndex!19) (select (arr!47368 a!2862) j!93)))))))

(assert (=> b!1446767 (= lt!634751 (seekEntryOrOpen!0 (select (arr!47368 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1446767 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48627 0))(
  ( (Unit!48628) )
))
(declare-fun lt!634746 () Unit!48627)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48627)

(assert (=> b!1446767 (= lt!634746 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446768 () Bool)

(assert (=> b!1446768 (= e!814818 true)))

(declare-fun lt!634747 () SeekEntryResult!11645)

(assert (=> b!1446768 (= lt!634747 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47368 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!124732 res!978570) b!1446754))

(assert (= (and b!1446754 res!978582) b!1446750))

(assert (= (and b!1446750 res!978581) b!1446763))

(assert (= (and b!1446763 res!978579) b!1446757))

(assert (= (and b!1446757 res!978572) b!1446765))

(assert (= (and b!1446765 res!978573) b!1446760))

(assert (= (and b!1446760 res!978574) b!1446758))

(assert (= (and b!1446758 res!978576) b!1446752))

(assert (= (and b!1446752 res!978577) b!1446762))

(assert (= (and b!1446762 res!978575) b!1446753))

(assert (= (and b!1446753 res!978584) b!1446755))

(assert (= (and b!1446755 c!133603) b!1446766))

(assert (= (and b!1446755 (not c!133603)) b!1446751))

(assert (= (and b!1446755 res!978580) b!1446759))

(assert (= (and b!1446759 res!978583) b!1446767))

(assert (= (and b!1446767 res!978578) b!1446756))

(assert (= (and b!1446756 (not res!978585)) b!1446764))

(assert (= (and b!1446764 res!978571) b!1446761))

(assert (= (and b!1446767 (not res!978586)) b!1446768))

(declare-fun m!1335111 () Bool)

(assert (=> b!1446762 m!1335111))

(assert (=> b!1446762 m!1335111))

(declare-fun m!1335113 () Bool)

(assert (=> b!1446762 m!1335113))

(declare-fun m!1335115 () Bool)

(assert (=> b!1446767 m!1335115))

(declare-fun m!1335117 () Bool)

(assert (=> b!1446767 m!1335117))

(declare-fun m!1335119 () Bool)

(assert (=> b!1446767 m!1335119))

(declare-fun m!1335121 () Bool)

(assert (=> b!1446767 m!1335121))

(declare-fun m!1335123 () Bool)

(assert (=> b!1446767 m!1335123))

(assert (=> b!1446767 m!1335111))

(declare-fun m!1335125 () Bool)

(assert (=> b!1446767 m!1335125))

(declare-fun m!1335127 () Bool)

(assert (=> b!1446767 m!1335127))

(assert (=> b!1446767 m!1335111))

(declare-fun m!1335129 () Bool)

(assert (=> b!1446766 m!1335129))

(declare-fun m!1335131 () Bool)

(assert (=> b!1446757 m!1335131))

(declare-fun m!1335133 () Bool)

(assert (=> start!124732 m!1335133))

(declare-fun m!1335135 () Bool)

(assert (=> start!124732 m!1335135))

(assert (=> b!1446756 m!1335123))

(assert (=> b!1446756 m!1335117))

(assert (=> b!1446756 m!1335121))

(assert (=> b!1446756 m!1335111))

(assert (=> b!1446768 m!1335111))

(assert (=> b!1446768 m!1335111))

(declare-fun m!1335137 () Bool)

(assert (=> b!1446768 m!1335137))

(declare-fun m!1335139 () Bool)

(assert (=> b!1446750 m!1335139))

(assert (=> b!1446750 m!1335139))

(declare-fun m!1335141 () Bool)

(assert (=> b!1446750 m!1335141))

(assert (=> b!1446763 m!1335111))

(assert (=> b!1446763 m!1335111))

(declare-fun m!1335143 () Bool)

(assert (=> b!1446763 m!1335143))

(declare-fun m!1335145 () Bool)

(assert (=> b!1446753 m!1335145))

(assert (=> b!1446753 m!1335145))

(declare-fun m!1335147 () Bool)

(assert (=> b!1446753 m!1335147))

(assert (=> b!1446753 m!1335117))

(declare-fun m!1335149 () Bool)

(assert (=> b!1446753 m!1335149))

(declare-fun m!1335151 () Bool)

(assert (=> b!1446751 m!1335151))

(declare-fun m!1335153 () Bool)

(assert (=> b!1446751 m!1335153))

(assert (=> b!1446764 m!1335111))

(assert (=> b!1446764 m!1335111))

(declare-fun m!1335155 () Bool)

(assert (=> b!1446764 m!1335155))

(assert (=> b!1446752 m!1335111))

(assert (=> b!1446752 m!1335111))

(declare-fun m!1335157 () Bool)

(assert (=> b!1446752 m!1335157))

(assert (=> b!1446752 m!1335157))

(assert (=> b!1446752 m!1335111))

(declare-fun m!1335159 () Bool)

(assert (=> b!1446752 m!1335159))

(declare-fun m!1335161 () Bool)

(assert (=> b!1446765 m!1335161))

(assert (=> b!1446758 m!1335117))

(declare-fun m!1335163 () Bool)

(assert (=> b!1446758 m!1335163))

(check-sat (not b!1446750) (not b!1446757) (not b!1446767) (not b!1446763) (not b!1446766) (not b!1446764) (not b!1446752) (not b!1446751) (not b!1446765) (not start!124732) (not b!1446753) (not b!1446768) (not b!1446762))
(check-sat)
