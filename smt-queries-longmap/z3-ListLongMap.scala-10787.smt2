; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126190 () Bool)

(assert start!126190)

(declare-fun b!1478725 () Bool)

(declare-fun res!1004808 () Bool)

(declare-fun e!829476 () Bool)

(assert (=> b!1478725 (=> (not res!1004808) (not e!829476))))

(declare-datatypes ((SeekEntryResult!12182 0))(
  ( (MissingZero!12182 (index!51120 (_ BitVec 32))) (Found!12182 (index!51121 (_ BitVec 32))) (Intermediate!12182 (undefined!12994 Bool) (index!51122 (_ BitVec 32)) (x!132704 (_ BitVec 32))) (Undefined!12182) (MissingVacant!12182 (index!51123 (_ BitVec 32))) )
))
(declare-fun lt!645611 () SeekEntryResult!12182)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99274 0))(
  ( (array!99275 (arr!47917 (Array (_ BitVec 32) (_ BitVec 64))) (size!48469 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99274)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99274 (_ BitVec 32)) SeekEntryResult!12182)

(assert (=> b!1478725 (= res!1004808 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47917 a!2862) j!93) a!2862 mask!2687) lt!645611))))

(declare-fun b!1478726 () Bool)

(declare-fun e!829472 () Bool)

(assert (=> b!1478726 (= e!829472 (not true))))

(declare-fun e!829468 () Bool)

(assert (=> b!1478726 e!829468))

(declare-fun res!1004811 () Bool)

(assert (=> b!1478726 (=> (not res!1004811) (not e!829468))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!645610 () SeekEntryResult!12182)

(assert (=> b!1478726 (= res!1004811 (and (= lt!645610 (Found!12182 j!93)) (or (= (select (arr!47917 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47917 a!2862) intermediateBeforeIndex!19) (select (arr!47917 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99274 (_ BitVec 32)) SeekEntryResult!12182)

(assert (=> b!1478726 (= lt!645610 (seekEntryOrOpen!0 (select (arr!47917 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99274 (_ BitVec 32)) Bool)

(assert (=> b!1478726 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49545 0))(
  ( (Unit!49546) )
))
(declare-fun lt!645609 () Unit!49545)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49545)

(assert (=> b!1478726 (= lt!645609 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478727 () Bool)

(declare-fun e!829473 () Bool)

(declare-fun e!829470 () Bool)

(assert (=> b!1478727 (= e!829473 e!829470)))

(declare-fun res!1004804 () Bool)

(assert (=> b!1478727 (=> (not res!1004804) (not e!829470))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478727 (= res!1004804 (= (select (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645612 () array!99274)

(assert (=> b!1478727 (= lt!645612 (array!99275 (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48469 a!2862)))))

(declare-fun b!1478728 () Bool)

(declare-fun res!1004817 () Bool)

(assert (=> b!1478728 (=> (not res!1004817) (not e!829473))))

(declare-datatypes ((List!34496 0))(
  ( (Nil!34493) (Cons!34492 (h!35860 (_ BitVec 64)) (t!49182 List!34496)) )
))
(declare-fun arrayNoDuplicates!0 (array!99274 (_ BitVec 32) List!34496) Bool)

(assert (=> b!1478728 (= res!1004817 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34493))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1478730 () Bool)

(declare-fun e!829475 () Bool)

(assert (=> b!1478730 (= e!829475 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478731 () Bool)

(assert (=> b!1478731 (= e!829476 e!829472)))

(declare-fun res!1004805 () Bool)

(assert (=> b!1478731 (=> (not res!1004805) (not e!829472))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!645608 () SeekEntryResult!12182)

(assert (=> b!1478731 (= res!1004805 (= lt!645608 (Intermediate!12182 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645607 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478731 (= lt!645608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645607 mask!2687) lt!645607 lt!645612 mask!2687))))

(assert (=> b!1478731 (= lt!645607 (select (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478732 () Bool)

(declare-fun res!1004813 () Bool)

(assert (=> b!1478732 (=> (not res!1004813) (not e!829473))))

(assert (=> b!1478732 (= res!1004813 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48469 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48469 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48469 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478733 () Bool)

(declare-fun e!829469 () Bool)

(assert (=> b!1478733 (= e!829469 e!829475)))

(declare-fun res!1004809 () Bool)

(assert (=> b!1478733 (=> (not res!1004809) (not e!829475))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99274 (_ BitVec 32)) SeekEntryResult!12182)

(assert (=> b!1478733 (= res!1004809 (= lt!645610 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47917 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun e!829471 () Bool)

(declare-fun b!1478734 () Bool)

(assert (=> b!1478734 (= e!829471 (= lt!645608 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645607 lt!645612 mask!2687)))))

(declare-fun b!1478735 () Bool)

(declare-fun res!1004814 () Bool)

(assert (=> b!1478735 (=> (not res!1004814) (not e!829472))))

(assert (=> b!1478735 (= res!1004814 e!829471)))

(declare-fun c!136483 () Bool)

(assert (=> b!1478735 (= c!136483 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478736 () Bool)

(assert (=> b!1478736 (= e!829470 e!829476)))

(declare-fun res!1004803 () Bool)

(assert (=> b!1478736 (=> (not res!1004803) (not e!829476))))

(assert (=> b!1478736 (= res!1004803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47917 a!2862) j!93) mask!2687) (select (arr!47917 a!2862) j!93) a!2862 mask!2687) lt!645611))))

(assert (=> b!1478736 (= lt!645611 (Intermediate!12182 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478737 () Bool)

(assert (=> b!1478737 (= e!829471 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645607 lt!645612 mask!2687) (seekEntryOrOpen!0 lt!645607 lt!645612 mask!2687)))))

(declare-fun b!1478738 () Bool)

(declare-fun res!1004815 () Bool)

(assert (=> b!1478738 (=> (not res!1004815) (not e!829472))))

(assert (=> b!1478738 (= res!1004815 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478739 () Bool)

(declare-fun res!1004807 () Bool)

(assert (=> b!1478739 (=> (not res!1004807) (not e!829473))))

(assert (=> b!1478739 (= res!1004807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478740 () Bool)

(declare-fun res!1004818 () Bool)

(assert (=> b!1478740 (=> (not res!1004818) (not e!829473))))

(assert (=> b!1478740 (= res!1004818 (and (= (size!48469 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48469 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48469 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1004816 () Bool)

(assert (=> start!126190 (=> (not res!1004816) (not e!829473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126190 (= res!1004816 (validMask!0 mask!2687))))

(assert (=> start!126190 e!829473))

(assert (=> start!126190 true))

(declare-fun array_inv!37150 (array!99274) Bool)

(assert (=> start!126190 (array_inv!37150 a!2862)))

(declare-fun b!1478729 () Bool)

(declare-fun res!1004812 () Bool)

(assert (=> b!1478729 (=> (not res!1004812) (not e!829473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478729 (= res!1004812 (validKeyInArray!0 (select (arr!47917 a!2862) j!93)))))

(declare-fun b!1478741 () Bool)

(declare-fun res!1004810 () Bool)

(assert (=> b!1478741 (=> (not res!1004810) (not e!829473))))

(assert (=> b!1478741 (= res!1004810 (validKeyInArray!0 (select (arr!47917 a!2862) i!1006)))))

(declare-fun b!1478742 () Bool)

(assert (=> b!1478742 (= e!829468 e!829469)))

(declare-fun res!1004806 () Bool)

(assert (=> b!1478742 (=> res!1004806 e!829469)))

(assert (=> b!1478742 (= res!1004806 (or (and (= (select (arr!47917 a!2862) index!646) (select (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47917 a!2862) index!646) (select (arr!47917 a!2862) j!93))) (not (= (select (arr!47917 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!126190 res!1004816) b!1478740))

(assert (= (and b!1478740 res!1004818) b!1478741))

(assert (= (and b!1478741 res!1004810) b!1478729))

(assert (= (and b!1478729 res!1004812) b!1478739))

(assert (= (and b!1478739 res!1004807) b!1478728))

(assert (= (and b!1478728 res!1004817) b!1478732))

(assert (= (and b!1478732 res!1004813) b!1478727))

(assert (= (and b!1478727 res!1004804) b!1478736))

(assert (= (and b!1478736 res!1004803) b!1478725))

(assert (= (and b!1478725 res!1004808) b!1478731))

(assert (= (and b!1478731 res!1004805) b!1478735))

(assert (= (and b!1478735 c!136483) b!1478734))

(assert (= (and b!1478735 (not c!136483)) b!1478737))

(assert (= (and b!1478735 res!1004814) b!1478738))

(assert (= (and b!1478738 res!1004815) b!1478726))

(assert (= (and b!1478726 res!1004811) b!1478742))

(assert (= (and b!1478742 (not res!1004806)) b!1478733))

(assert (= (and b!1478733 res!1004809) b!1478730))

(declare-fun m!1364139 () Bool)

(assert (=> start!126190 m!1364139))

(declare-fun m!1364141 () Bool)

(assert (=> start!126190 m!1364141))

(declare-fun m!1364143 () Bool)

(assert (=> b!1478739 m!1364143))

(declare-fun m!1364145 () Bool)

(assert (=> b!1478733 m!1364145))

(assert (=> b!1478733 m!1364145))

(declare-fun m!1364147 () Bool)

(assert (=> b!1478733 m!1364147))

(declare-fun m!1364149 () Bool)

(assert (=> b!1478737 m!1364149))

(declare-fun m!1364151 () Bool)

(assert (=> b!1478737 m!1364151))

(assert (=> b!1478725 m!1364145))

(assert (=> b!1478725 m!1364145))

(declare-fun m!1364153 () Bool)

(assert (=> b!1478725 m!1364153))

(declare-fun m!1364155 () Bool)

(assert (=> b!1478726 m!1364155))

(declare-fun m!1364157 () Bool)

(assert (=> b!1478726 m!1364157))

(assert (=> b!1478726 m!1364145))

(declare-fun m!1364159 () Bool)

(assert (=> b!1478726 m!1364159))

(declare-fun m!1364161 () Bool)

(assert (=> b!1478726 m!1364161))

(assert (=> b!1478726 m!1364145))

(declare-fun m!1364163 () Bool)

(assert (=> b!1478734 m!1364163))

(assert (=> b!1478736 m!1364145))

(assert (=> b!1478736 m!1364145))

(declare-fun m!1364165 () Bool)

(assert (=> b!1478736 m!1364165))

(assert (=> b!1478736 m!1364165))

(assert (=> b!1478736 m!1364145))

(declare-fun m!1364167 () Bool)

(assert (=> b!1478736 m!1364167))

(declare-fun m!1364169 () Bool)

(assert (=> b!1478742 m!1364169))

(declare-fun m!1364171 () Bool)

(assert (=> b!1478742 m!1364171))

(declare-fun m!1364173 () Bool)

(assert (=> b!1478742 m!1364173))

(assert (=> b!1478742 m!1364145))

(assert (=> b!1478727 m!1364171))

(declare-fun m!1364175 () Bool)

(assert (=> b!1478727 m!1364175))

(declare-fun m!1364177 () Bool)

(assert (=> b!1478731 m!1364177))

(assert (=> b!1478731 m!1364177))

(declare-fun m!1364179 () Bool)

(assert (=> b!1478731 m!1364179))

(assert (=> b!1478731 m!1364171))

(declare-fun m!1364181 () Bool)

(assert (=> b!1478731 m!1364181))

(declare-fun m!1364183 () Bool)

(assert (=> b!1478741 m!1364183))

(assert (=> b!1478741 m!1364183))

(declare-fun m!1364185 () Bool)

(assert (=> b!1478741 m!1364185))

(declare-fun m!1364187 () Bool)

(assert (=> b!1478728 m!1364187))

(assert (=> b!1478729 m!1364145))

(assert (=> b!1478729 m!1364145))

(declare-fun m!1364189 () Bool)

(assert (=> b!1478729 m!1364189))

(check-sat (not b!1478737) (not start!126190) (not b!1478731) (not b!1478733) (not b!1478729) (not b!1478734) (not b!1478736) (not b!1478725) (not b!1478726) (not b!1478741) (not b!1478728) (not b!1478739))
(check-sat)
