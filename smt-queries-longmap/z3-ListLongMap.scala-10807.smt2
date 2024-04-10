; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126492 () Bool)

(assert start!126492)

(declare-fun b!1483288 () Bool)

(declare-fun e!831728 () Bool)

(assert (=> b!1483288 (= e!831728 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647377 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483288 (= lt!647377 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483289 () Bool)

(declare-fun res!1008184 () Bool)

(declare-fun e!831734 () Bool)

(assert (=> b!1483289 (=> (not res!1008184) (not e!831734))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((array!99454 0))(
  ( (array!99455 (arr!48003 (Array (_ BitVec 32) (_ BitVec 64))) (size!48553 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99454)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483289 (= res!1008184 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48553 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48553 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48553 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483290 () Bool)

(declare-fun res!1008185 () Bool)

(declare-fun e!831731 () Bool)

(assert (=> b!1483290 (=> (not res!1008185) (not e!831731))))

(declare-fun e!831736 () Bool)

(assert (=> b!1483290 (= res!1008185 e!831736)))

(declare-fun c!137079 () Bool)

(assert (=> b!1483290 (= c!137079 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!647380 () (_ BitVec 64))

(declare-fun b!1483291 () Bool)

(declare-fun lt!647378 () array!99454)

(declare-datatypes ((SeekEntryResult!12243 0))(
  ( (MissingZero!12243 (index!51364 (_ BitVec 32))) (Found!12243 (index!51365 (_ BitVec 32))) (Intermediate!12243 (undefined!13055 Bool) (index!51366 (_ BitVec 32)) (x!132951 (_ BitVec 32))) (Undefined!12243) (MissingVacant!12243 (index!51367 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99454 (_ BitVec 32)) SeekEntryResult!12243)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99454 (_ BitVec 32)) SeekEntryResult!12243)

(assert (=> b!1483291 (= e!831736 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647380 lt!647378 mask!2687) (seekEntryOrOpen!0 lt!647380 lt!647378 mask!2687)))))

(declare-fun b!1483292 () Bool)

(declare-fun e!831729 () Bool)

(assert (=> b!1483292 (= e!831729 e!831731)))

(declare-fun res!1008189 () Bool)

(assert (=> b!1483292 (=> (not res!1008189) (not e!831731))))

(declare-fun lt!647376 () SeekEntryResult!12243)

(assert (=> b!1483292 (= res!1008189 (= lt!647376 (Intermediate!12243 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99454 (_ BitVec 32)) SeekEntryResult!12243)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483292 (= lt!647376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647380 mask!2687) lt!647380 lt!647378 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483292 (= lt!647380 (select (store (arr!48003 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483293 () Bool)

(declare-fun res!1008191 () Bool)

(assert (=> b!1483293 (=> (not res!1008191) (not e!831734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483293 (= res!1008191 (validKeyInArray!0 (select (arr!48003 a!2862) j!93)))))

(declare-fun b!1483294 () Bool)

(declare-fun e!831732 () Bool)

(declare-fun e!831733 () Bool)

(assert (=> b!1483294 (= e!831732 e!831733)))

(declare-fun res!1008180 () Bool)

(assert (=> b!1483294 (=> (not res!1008180) (not e!831733))))

(declare-fun lt!647379 () (_ BitVec 64))

(assert (=> b!1483294 (= res!1008180 (and (= index!646 intermediateAfterIndex!19) (= lt!647379 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483295 () Bool)

(declare-fun res!1008183 () Bool)

(assert (=> b!1483295 (=> (not res!1008183) (not e!831734))))

(assert (=> b!1483295 (= res!1008183 (and (= (size!48553 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48553 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48553 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1008186 () Bool)

(assert (=> start!126492 (=> (not res!1008186) (not e!831734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126492 (= res!1008186 (validMask!0 mask!2687))))

(assert (=> start!126492 e!831734))

(assert (=> start!126492 true))

(declare-fun array_inv!37031 (array!99454) Bool)

(assert (=> start!126492 (array_inv!37031 a!2862)))

(declare-fun b!1483296 () Bool)

(declare-fun res!1008188 () Bool)

(declare-fun e!831737 () Bool)

(assert (=> b!1483296 (=> (not res!1008188) (not e!831737))))

(assert (=> b!1483296 (= res!1008188 (or (= (select (arr!48003 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48003 a!2862) intermediateBeforeIndex!19) (select (arr!48003 a!2862) j!93))))))

(declare-fun b!1483297 () Bool)

(declare-fun e!831730 () Bool)

(assert (=> b!1483297 (= e!831730 e!831729)))

(declare-fun res!1008190 () Bool)

(assert (=> b!1483297 (=> (not res!1008190) (not e!831729))))

(declare-fun lt!647381 () SeekEntryResult!12243)

(assert (=> b!1483297 (= res!1008190 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48003 a!2862) j!93) mask!2687) (select (arr!48003 a!2862) j!93) a!2862 mask!2687) lt!647381))))

(assert (=> b!1483297 (= lt!647381 (Intermediate!12243 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483298 () Bool)

(assert (=> b!1483298 (= e!831734 e!831730)))

(declare-fun res!1008187 () Bool)

(assert (=> b!1483298 (=> (not res!1008187) (not e!831730))))

(assert (=> b!1483298 (= res!1008187 (= (select (store (arr!48003 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483298 (= lt!647378 (array!99455 (store (arr!48003 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48553 a!2862)))))

(declare-fun b!1483299 () Bool)

(declare-fun res!1008177 () Bool)

(assert (=> b!1483299 (=> (not res!1008177) (not e!831734))))

(assert (=> b!1483299 (= res!1008177 (validKeyInArray!0 (select (arr!48003 a!2862) i!1006)))))

(declare-fun b!1483300 () Bool)

(declare-fun res!1008192 () Bool)

(assert (=> b!1483300 (=> (not res!1008192) (not e!831731))))

(assert (=> b!1483300 (= res!1008192 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483301 () Bool)

(declare-fun res!1008179 () Bool)

(assert (=> b!1483301 (=> (not res!1008179) (not e!831734))))

(declare-datatypes ((List!34504 0))(
  ( (Nil!34501) (Cons!34500 (h!35874 (_ BitVec 64)) (t!49198 List!34504)) )
))
(declare-fun arrayNoDuplicates!0 (array!99454 (_ BitVec 32) List!34504) Bool)

(assert (=> b!1483301 (= res!1008179 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34501))))

(declare-fun b!1483302 () Bool)

(declare-fun res!1008182 () Bool)

(assert (=> b!1483302 (=> (not res!1008182) (not e!831737))))

(assert (=> b!1483302 (= res!1008182 (= (seekEntryOrOpen!0 (select (arr!48003 a!2862) j!93) a!2862 mask!2687) (Found!12243 j!93)))))

(declare-fun b!1483303 () Bool)

(assert (=> b!1483303 (= e!831731 (not e!831728))))

(declare-fun res!1008193 () Bool)

(assert (=> b!1483303 (=> res!1008193 e!831728)))

(assert (=> b!1483303 (= res!1008193 (or (and (= (select (arr!48003 a!2862) index!646) (select (store (arr!48003 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48003 a!2862) index!646) (select (arr!48003 a!2862) j!93))) (= (select (arr!48003 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483303 e!831737))

(declare-fun res!1008175 () Bool)

(assert (=> b!1483303 (=> (not res!1008175) (not e!831737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99454 (_ BitVec 32)) Bool)

(assert (=> b!1483303 (= res!1008175 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49826 0))(
  ( (Unit!49827) )
))
(declare-fun lt!647382 () Unit!49826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49826)

(assert (=> b!1483303 (= lt!647382 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483304 () Bool)

(declare-fun res!1008176 () Bool)

(assert (=> b!1483304 (=> (not res!1008176) (not e!831729))))

(assert (=> b!1483304 (= res!1008176 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48003 a!2862) j!93) a!2862 mask!2687) lt!647381))))

(declare-fun b!1483305 () Bool)

(assert (=> b!1483305 (= e!831737 e!831732)))

(declare-fun res!1008178 () Bool)

(assert (=> b!1483305 (=> res!1008178 e!831732)))

(assert (=> b!1483305 (= res!1008178 (or (and (= (select (arr!48003 a!2862) index!646) lt!647379) (= (select (arr!48003 a!2862) index!646) (select (arr!48003 a!2862) j!93))) (= (select (arr!48003 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483305 (= lt!647379 (select (store (arr!48003 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483306 () Bool)

(declare-fun res!1008181 () Bool)

(assert (=> b!1483306 (=> (not res!1008181) (not e!831734))))

(assert (=> b!1483306 (= res!1008181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483307 () Bool)

(assert (=> b!1483307 (= e!831733 (= (seekEntryOrOpen!0 lt!647380 lt!647378 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647380 lt!647378 mask!2687)))))

(declare-fun b!1483308 () Bool)

(assert (=> b!1483308 (= e!831736 (= lt!647376 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647380 lt!647378 mask!2687)))))

(assert (= (and start!126492 res!1008186) b!1483295))

(assert (= (and b!1483295 res!1008183) b!1483299))

(assert (= (and b!1483299 res!1008177) b!1483293))

(assert (= (and b!1483293 res!1008191) b!1483306))

(assert (= (and b!1483306 res!1008181) b!1483301))

(assert (= (and b!1483301 res!1008179) b!1483289))

(assert (= (and b!1483289 res!1008184) b!1483298))

(assert (= (and b!1483298 res!1008187) b!1483297))

(assert (= (and b!1483297 res!1008190) b!1483304))

(assert (= (and b!1483304 res!1008176) b!1483292))

(assert (= (and b!1483292 res!1008189) b!1483290))

(assert (= (and b!1483290 c!137079) b!1483308))

(assert (= (and b!1483290 (not c!137079)) b!1483291))

(assert (= (and b!1483290 res!1008185) b!1483300))

(assert (= (and b!1483300 res!1008192) b!1483303))

(assert (= (and b!1483303 res!1008175) b!1483302))

(assert (= (and b!1483302 res!1008182) b!1483296))

(assert (= (and b!1483296 res!1008188) b!1483305))

(assert (= (and b!1483305 (not res!1008178)) b!1483294))

(assert (= (and b!1483294 res!1008180) b!1483307))

(assert (= (and b!1483303 (not res!1008193)) b!1483288))

(declare-fun m!1368797 () Bool)

(assert (=> b!1483302 m!1368797))

(assert (=> b!1483302 m!1368797))

(declare-fun m!1368799 () Bool)

(assert (=> b!1483302 m!1368799))

(declare-fun m!1368801 () Bool)

(assert (=> b!1483288 m!1368801))

(declare-fun m!1368803 () Bool)

(assert (=> start!126492 m!1368803))

(declare-fun m!1368805 () Bool)

(assert (=> start!126492 m!1368805))

(declare-fun m!1368807 () Bool)

(assert (=> b!1483303 m!1368807))

(declare-fun m!1368809 () Bool)

(assert (=> b!1483303 m!1368809))

(declare-fun m!1368811 () Bool)

(assert (=> b!1483303 m!1368811))

(declare-fun m!1368813 () Bool)

(assert (=> b!1483303 m!1368813))

(declare-fun m!1368815 () Bool)

(assert (=> b!1483303 m!1368815))

(assert (=> b!1483303 m!1368797))

(declare-fun m!1368817 () Bool)

(assert (=> b!1483308 m!1368817))

(assert (=> b!1483304 m!1368797))

(assert (=> b!1483304 m!1368797))

(declare-fun m!1368819 () Bool)

(assert (=> b!1483304 m!1368819))

(declare-fun m!1368821 () Bool)

(assert (=> b!1483296 m!1368821))

(assert (=> b!1483296 m!1368797))

(declare-fun m!1368823 () Bool)

(assert (=> b!1483291 m!1368823))

(declare-fun m!1368825 () Bool)

(assert (=> b!1483291 m!1368825))

(assert (=> b!1483298 m!1368809))

(declare-fun m!1368827 () Bool)

(assert (=> b!1483298 m!1368827))

(declare-fun m!1368829 () Bool)

(assert (=> b!1483306 m!1368829))

(assert (=> b!1483293 m!1368797))

(assert (=> b!1483293 m!1368797))

(declare-fun m!1368831 () Bool)

(assert (=> b!1483293 m!1368831))

(assert (=> b!1483307 m!1368825))

(assert (=> b!1483307 m!1368823))

(declare-fun m!1368833 () Bool)

(assert (=> b!1483292 m!1368833))

(assert (=> b!1483292 m!1368833))

(declare-fun m!1368835 () Bool)

(assert (=> b!1483292 m!1368835))

(assert (=> b!1483292 m!1368809))

(declare-fun m!1368837 () Bool)

(assert (=> b!1483292 m!1368837))

(declare-fun m!1368839 () Bool)

(assert (=> b!1483299 m!1368839))

(assert (=> b!1483299 m!1368839))

(declare-fun m!1368841 () Bool)

(assert (=> b!1483299 m!1368841))

(assert (=> b!1483297 m!1368797))

(assert (=> b!1483297 m!1368797))

(declare-fun m!1368843 () Bool)

(assert (=> b!1483297 m!1368843))

(assert (=> b!1483297 m!1368843))

(assert (=> b!1483297 m!1368797))

(declare-fun m!1368845 () Bool)

(assert (=> b!1483297 m!1368845))

(assert (=> b!1483305 m!1368813))

(assert (=> b!1483305 m!1368797))

(assert (=> b!1483305 m!1368809))

(assert (=> b!1483305 m!1368811))

(declare-fun m!1368847 () Bool)

(assert (=> b!1483301 m!1368847))

(check-sat (not b!1483303) (not b!1483308) (not b!1483291) (not start!126492) (not b!1483302) (not b!1483293) (not b!1483299) (not b!1483301) (not b!1483292) (not b!1483306) (not b!1483304) (not b!1483288) (not b!1483297) (not b!1483307))
(check-sat)
