; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126824 () Bool)

(assert start!126824)

(declare-fun lt!649321 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!834492 () Bool)

(declare-datatypes ((SeekEntryResult!12310 0))(
  ( (MissingZero!12310 (index!51632 (_ BitVec 32))) (Found!12310 (index!51633 (_ BitVec 32))) (Intermediate!12310 (undefined!13122 Bool) (index!51634 (_ BitVec 32)) (x!133230 (_ BitVec 32))) (Undefined!12310) (MissingVacant!12310 (index!51635 (_ BitVec 32))) )
))
(declare-fun lt!649323 () SeekEntryResult!12310)

(declare-fun b!1488794 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99597 0))(
  ( (array!99598 (arr!48070 (Array (_ BitVec 32) (_ BitVec 64))) (size!48620 (_ BitVec 32))) )
))
(declare-fun lt!649322 () array!99597)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99597 (_ BitVec 32)) SeekEntryResult!12310)

(assert (=> b!1488794 (= e!834492 (= lt!649323 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649321 lt!649322 mask!2687)))))

(declare-fun b!1488795 () Bool)

(declare-fun res!1012371 () Bool)

(declare-fun e!834491 () Bool)

(assert (=> b!1488795 (=> (not res!1012371) (not e!834491))))

(declare-fun a!2862 () array!99597)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99597 (_ BitVec 32)) Bool)

(assert (=> b!1488795 (= res!1012371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488796 () Bool)

(declare-fun res!1012372 () Bool)

(assert (=> b!1488796 (=> (not res!1012372) (not e!834491))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1488796 (= res!1012372 (and (= (size!48620 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48620 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48620 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488797 () Bool)

(declare-fun e!834493 () Bool)

(declare-fun e!834487 () Bool)

(assert (=> b!1488797 (= e!834493 e!834487)))

(declare-fun res!1012363 () Bool)

(assert (=> b!1488797 (=> (not res!1012363) (not e!834487))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1488797 (= res!1012363 (= lt!649323 (Intermediate!12310 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488797 (= lt!649323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649321 mask!2687) lt!649321 lt!649322 mask!2687))))

(assert (=> b!1488797 (= lt!649321 (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488798 () Bool)

(declare-fun res!1012358 () Bool)

(assert (=> b!1488798 (=> (not res!1012358) (not e!834491))))

(declare-datatypes ((List!34571 0))(
  ( (Nil!34568) (Cons!34567 (h!35950 (_ BitVec 64)) (t!49265 List!34571)) )
))
(declare-fun arrayNoDuplicates!0 (array!99597 (_ BitVec 32) List!34571) Bool)

(assert (=> b!1488798 (= res!1012358 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34568))))

(declare-fun lt!649320 () (_ BitVec 32))

(declare-fun b!1488799 () Bool)

(declare-fun e!834489 () Bool)

(assert (=> b!1488799 (= e!834489 (not (= lt!649323 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649320 lt!649321 lt!649322 mask!2687))))))

(declare-fun b!1488800 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99597 (_ BitVec 32)) SeekEntryResult!12310)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99597 (_ BitVec 32)) SeekEntryResult!12310)

(assert (=> b!1488800 (= e!834492 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649321 lt!649322 mask!2687) (seekEntryOrOpen!0 lt!649321 lt!649322 mask!2687)))))

(declare-fun lt!649326 () SeekEntryResult!12310)

(declare-fun b!1488801 () Bool)

(assert (=> b!1488801 (= e!834489 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649320 intermediateAfterIndex!19 lt!649321 lt!649322 mask!2687) lt!649326)))))

(declare-fun b!1488802 () Bool)

(declare-fun res!1012354 () Bool)

(assert (=> b!1488802 (=> (not res!1012354) (not e!834491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488802 (= res!1012354 (validKeyInArray!0 (select (arr!48070 a!2862) j!93)))))

(declare-fun b!1488803 () Bool)

(declare-fun res!1012362 () Bool)

(declare-fun e!834490 () Bool)

(assert (=> b!1488803 (=> res!1012362 e!834490)))

(declare-fun lt!649324 () SeekEntryResult!12310)

(assert (=> b!1488803 (= res!1012362 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649320 (select (arr!48070 a!2862) j!93) a!2862 mask!2687) lt!649324)))))

(declare-fun res!1012364 () Bool)

(assert (=> start!126824 (=> (not res!1012364) (not e!834491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126824 (= res!1012364 (validMask!0 mask!2687))))

(assert (=> start!126824 e!834491))

(assert (=> start!126824 true))

(declare-fun array_inv!37098 (array!99597) Bool)

(assert (=> start!126824 (array_inv!37098 a!2862)))

(declare-fun b!1488804 () Bool)

(declare-fun res!1012365 () Bool)

(assert (=> b!1488804 (=> (not res!1012365) (not e!834487))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488804 (= res!1012365 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488805 () Bool)

(declare-fun e!834488 () Bool)

(assert (=> b!1488805 (= e!834488 e!834490)))

(declare-fun res!1012369 () Bool)

(assert (=> b!1488805 (=> res!1012369 e!834490)))

(assert (=> b!1488805 (= res!1012369 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649320 #b00000000000000000000000000000000) (bvsge lt!649320 (size!48620 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488805 (= lt!649320 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1488805 (= lt!649326 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649321 lt!649322 mask!2687))))

(assert (=> b!1488805 (= lt!649326 (seekEntryOrOpen!0 lt!649321 lt!649322 mask!2687))))

(declare-fun b!1488806 () Bool)

(declare-fun e!834485 () Bool)

(assert (=> b!1488806 (= e!834485 e!834493)))

(declare-fun res!1012359 () Bool)

(assert (=> b!1488806 (=> (not res!1012359) (not e!834493))))

(assert (=> b!1488806 (= res!1012359 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48070 a!2862) j!93) mask!2687) (select (arr!48070 a!2862) j!93) a!2862 mask!2687) lt!649324))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1488806 (= lt!649324 (Intermediate!12310 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488807 () Bool)

(assert (=> b!1488807 (= e!834490 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1488808 () Bool)

(declare-fun res!1012370 () Bool)

(assert (=> b!1488808 (=> res!1012370 e!834490)))

(assert (=> b!1488808 (= res!1012370 e!834489)))

(declare-fun c!137747 () Bool)

(assert (=> b!1488808 (= c!137747 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1488809 () Bool)

(declare-fun res!1012361 () Bool)

(assert (=> b!1488809 (=> (not res!1012361) (not e!834487))))

(assert (=> b!1488809 (= res!1012361 e!834492)))

(declare-fun c!137748 () Bool)

(assert (=> b!1488809 (= c!137748 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488810 () Bool)

(declare-fun e!834486 () Bool)

(assert (=> b!1488810 (= e!834486 (and (or (= (select (arr!48070 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48070 a!2862) intermediateBeforeIndex!19) (select (arr!48070 a!2862) j!93))) (let ((bdg!54659 (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48070 a!2862) index!646) bdg!54659) (= (select (arr!48070 a!2862) index!646) (select (arr!48070 a!2862) j!93))) (= (select (arr!48070 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54659 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1488811 () Bool)

(declare-fun res!1012360 () Bool)

(assert (=> b!1488811 (=> (not res!1012360) (not e!834491))))

(assert (=> b!1488811 (= res!1012360 (validKeyInArray!0 (select (arr!48070 a!2862) i!1006)))))

(declare-fun b!1488812 () Bool)

(assert (=> b!1488812 (= e!834491 e!834485)))

(declare-fun res!1012367 () Bool)

(assert (=> b!1488812 (=> (not res!1012367) (not e!834485))))

(assert (=> b!1488812 (= res!1012367 (= (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488812 (= lt!649322 (array!99598 (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48620 a!2862)))))

(declare-fun b!1488813 () Bool)

(declare-fun res!1012366 () Bool)

(assert (=> b!1488813 (=> (not res!1012366) (not e!834491))))

(assert (=> b!1488813 (= res!1012366 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48620 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48620 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48620 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488814 () Bool)

(declare-fun res!1012368 () Bool)

(assert (=> b!1488814 (=> (not res!1012368) (not e!834486))))

(assert (=> b!1488814 (= res!1012368 (= (seekEntryOrOpen!0 (select (arr!48070 a!2862) j!93) a!2862 mask!2687) (Found!12310 j!93)))))

(declare-fun b!1488815 () Bool)

(assert (=> b!1488815 (= e!834487 (not e!834488))))

(declare-fun res!1012357 () Bool)

(assert (=> b!1488815 (=> res!1012357 e!834488)))

(assert (=> b!1488815 (= res!1012357 (or (and (= (select (arr!48070 a!2862) index!646) (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48070 a!2862) index!646) (select (arr!48070 a!2862) j!93))) (= (select (arr!48070 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488815 e!834486))

(declare-fun res!1012356 () Bool)

(assert (=> b!1488815 (=> (not res!1012356) (not e!834486))))

(assert (=> b!1488815 (= res!1012356 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49960 0))(
  ( (Unit!49961) )
))
(declare-fun lt!649325 () Unit!49960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49960)

(assert (=> b!1488815 (= lt!649325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488816 () Bool)

(declare-fun res!1012355 () Bool)

(assert (=> b!1488816 (=> (not res!1012355) (not e!834493))))

(assert (=> b!1488816 (= res!1012355 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48070 a!2862) j!93) a!2862 mask!2687) lt!649324))))

(assert (= (and start!126824 res!1012364) b!1488796))

(assert (= (and b!1488796 res!1012372) b!1488811))

(assert (= (and b!1488811 res!1012360) b!1488802))

(assert (= (and b!1488802 res!1012354) b!1488795))

(assert (= (and b!1488795 res!1012371) b!1488798))

(assert (= (and b!1488798 res!1012358) b!1488813))

(assert (= (and b!1488813 res!1012366) b!1488812))

(assert (= (and b!1488812 res!1012367) b!1488806))

(assert (= (and b!1488806 res!1012359) b!1488816))

(assert (= (and b!1488816 res!1012355) b!1488797))

(assert (= (and b!1488797 res!1012363) b!1488809))

(assert (= (and b!1488809 c!137748) b!1488794))

(assert (= (and b!1488809 (not c!137748)) b!1488800))

(assert (= (and b!1488809 res!1012361) b!1488804))

(assert (= (and b!1488804 res!1012365) b!1488815))

(assert (= (and b!1488815 res!1012356) b!1488814))

(assert (= (and b!1488814 res!1012368) b!1488810))

(assert (= (and b!1488815 (not res!1012357)) b!1488805))

(assert (= (and b!1488805 (not res!1012369)) b!1488803))

(assert (= (and b!1488803 (not res!1012362)) b!1488808))

(assert (= (and b!1488808 c!137747) b!1488799))

(assert (= (and b!1488808 (not c!137747)) b!1488801))

(assert (= (and b!1488808 (not res!1012370)) b!1488807))

(declare-fun m!1373109 () Bool)

(assert (=> b!1488794 m!1373109))

(declare-fun m!1373111 () Bool)

(assert (=> b!1488816 m!1373111))

(assert (=> b!1488816 m!1373111))

(declare-fun m!1373113 () Bool)

(assert (=> b!1488816 m!1373113))

(declare-fun m!1373115 () Bool)

(assert (=> b!1488801 m!1373115))

(assert (=> b!1488803 m!1373111))

(assert (=> b!1488803 m!1373111))

(declare-fun m!1373117 () Bool)

(assert (=> b!1488803 m!1373117))

(declare-fun m!1373119 () Bool)

(assert (=> start!126824 m!1373119))

(declare-fun m!1373121 () Bool)

(assert (=> start!126824 m!1373121))

(declare-fun m!1373123 () Bool)

(assert (=> b!1488795 m!1373123))

(declare-fun m!1373125 () Bool)

(assert (=> b!1488797 m!1373125))

(assert (=> b!1488797 m!1373125))

(declare-fun m!1373127 () Bool)

(assert (=> b!1488797 m!1373127))

(declare-fun m!1373129 () Bool)

(assert (=> b!1488797 m!1373129))

(declare-fun m!1373131 () Bool)

(assert (=> b!1488797 m!1373131))

(declare-fun m!1373133 () Bool)

(assert (=> b!1488799 m!1373133))

(declare-fun m!1373135 () Bool)

(assert (=> b!1488800 m!1373135))

(declare-fun m!1373137 () Bool)

(assert (=> b!1488800 m!1373137))

(declare-fun m!1373139 () Bool)

(assert (=> b!1488811 m!1373139))

(assert (=> b!1488811 m!1373139))

(declare-fun m!1373141 () Bool)

(assert (=> b!1488811 m!1373141))

(assert (=> b!1488806 m!1373111))

(assert (=> b!1488806 m!1373111))

(declare-fun m!1373143 () Bool)

(assert (=> b!1488806 m!1373143))

(assert (=> b!1488806 m!1373143))

(assert (=> b!1488806 m!1373111))

(declare-fun m!1373145 () Bool)

(assert (=> b!1488806 m!1373145))

(assert (=> b!1488802 m!1373111))

(assert (=> b!1488802 m!1373111))

(declare-fun m!1373147 () Bool)

(assert (=> b!1488802 m!1373147))

(declare-fun m!1373149 () Bool)

(assert (=> b!1488798 m!1373149))

(declare-fun m!1373151 () Bool)

(assert (=> b!1488805 m!1373151))

(assert (=> b!1488805 m!1373135))

(assert (=> b!1488805 m!1373137))

(assert (=> b!1488814 m!1373111))

(assert (=> b!1488814 m!1373111))

(declare-fun m!1373153 () Bool)

(assert (=> b!1488814 m!1373153))

(assert (=> b!1488812 m!1373129))

(declare-fun m!1373155 () Bool)

(assert (=> b!1488812 m!1373155))

(declare-fun m!1373157 () Bool)

(assert (=> b!1488815 m!1373157))

(assert (=> b!1488815 m!1373129))

(declare-fun m!1373159 () Bool)

(assert (=> b!1488815 m!1373159))

(declare-fun m!1373161 () Bool)

(assert (=> b!1488815 m!1373161))

(declare-fun m!1373163 () Bool)

(assert (=> b!1488815 m!1373163))

(assert (=> b!1488815 m!1373111))

(assert (=> b!1488810 m!1373129))

(declare-fun m!1373165 () Bool)

(assert (=> b!1488810 m!1373165))

(assert (=> b!1488810 m!1373159))

(assert (=> b!1488810 m!1373161))

(assert (=> b!1488810 m!1373111))

(push 1)

(assert (not b!1488806))

(assert (not b!1488803))

(assert (not b!1488798))

(assert (not b!1488800))

(assert (not b!1488801))

(assert (not b!1488814))

(assert (not b!1488799))

(assert (not b!1488795))

(assert (not b!1488816))

(assert (not b!1488805))

(assert (not b!1488811))

(assert (not start!126824))

(assert (not b!1488802))

(assert (not b!1488797))

(assert (not b!1488794))

(assert (not b!1488815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

