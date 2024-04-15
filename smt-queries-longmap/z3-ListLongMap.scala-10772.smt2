; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126100 () Bool)

(assert start!126100)

(declare-fun b!1476295 () Bool)

(declare-fun e!828253 () Bool)

(assert (=> b!1476295 (= e!828253 (not true))))

(declare-fun e!828261 () Bool)

(assert (=> b!1476295 e!828261))

(declare-fun res!1002645 () Bool)

(assert (=> b!1476295 (=> (not res!1002645) (not e!828261))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12137 0))(
  ( (MissingZero!12137 (index!50940 (_ BitVec 32))) (Found!12137 (index!50941 (_ BitVec 32))) (Intermediate!12137 (undefined!12949 Bool) (index!50942 (_ BitVec 32)) (x!132539 (_ BitVec 32))) (Undefined!12137) (MissingVacant!12137 (index!50943 (_ BitVec 32))) )
))
(declare-fun lt!644800 () SeekEntryResult!12137)

(declare-datatypes ((array!99184 0))(
  ( (array!99185 (arr!47872 (Array (_ BitVec 32) (_ BitVec 64))) (size!48424 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99184)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1476295 (= res!1002645 (and (= lt!644800 (Found!12137 j!93)) (or (= (select (arr!47872 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47872 a!2862) intermediateBeforeIndex!19) (select (arr!47872 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99184 (_ BitVec 32)) SeekEntryResult!12137)

(assert (=> b!1476295 (= lt!644800 (seekEntryOrOpen!0 (select (arr!47872 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99184 (_ BitVec 32)) Bool)

(assert (=> b!1476295 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49455 0))(
  ( (Unit!49456) )
))
(declare-fun lt!644797 () Unit!49455)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49455)

(assert (=> b!1476295 (= lt!644797 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476296 () Bool)

(declare-fun e!828255 () Bool)

(declare-fun e!828259 () Bool)

(assert (=> b!1476296 (= e!828255 e!828259)))

(declare-fun res!1002656 () Bool)

(assert (=> b!1476296 (=> (not res!1002656) (not e!828259))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99184 (_ BitVec 32)) SeekEntryResult!12137)

(assert (=> b!1476296 (= res!1002656 (= lt!644800 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47872 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476297 () Bool)

(declare-fun res!1002643 () Bool)

(declare-fun e!828258 () Bool)

(assert (=> b!1476297 (=> (not res!1002643) (not e!828258))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476297 (= res!1002643 (and (= (size!48424 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48424 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48424 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476298 () Bool)

(declare-fun res!1002650 () Bool)

(assert (=> b!1476298 (=> (not res!1002650) (not e!828258))))

(assert (=> b!1476298 (= res!1002650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476299 () Bool)

(declare-fun res!1002658 () Bool)

(assert (=> b!1476299 (=> (not res!1002658) (not e!828253))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476299 (= res!1002658 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476300 () Bool)

(declare-fun res!1002653 () Bool)

(assert (=> b!1476300 (=> (not res!1002653) (not e!828253))))

(declare-fun e!828260 () Bool)

(assert (=> b!1476300 (= res!1002653 e!828260)))

(declare-fun c!136348 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476300 (= c!136348 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476301 () Bool)

(assert (=> b!1476301 (= e!828259 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!1002646 () Bool)

(assert (=> start!126100 (=> (not res!1002646) (not e!828258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126100 (= res!1002646 (validMask!0 mask!2687))))

(assert (=> start!126100 e!828258))

(assert (=> start!126100 true))

(declare-fun array_inv!37105 (array!99184) Bool)

(assert (=> start!126100 (array_inv!37105 a!2862)))

(declare-fun b!1476302 () Bool)

(declare-fun e!828254 () Bool)

(assert (=> b!1476302 (= e!828258 e!828254)))

(declare-fun res!1002649 () Bool)

(assert (=> b!1476302 (=> (not res!1002649) (not e!828254))))

(assert (=> b!1476302 (= res!1002649 (= (select (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644799 () array!99184)

(assert (=> b!1476302 (= lt!644799 (array!99185 (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48424 a!2862)))))

(declare-fun b!1476303 () Bool)

(declare-fun e!828257 () Bool)

(assert (=> b!1476303 (= e!828257 e!828253)))

(declare-fun res!1002648 () Bool)

(assert (=> b!1476303 (=> (not res!1002648) (not e!828253))))

(declare-fun lt!644798 () SeekEntryResult!12137)

(assert (=> b!1476303 (= res!1002648 (= lt!644798 (Intermediate!12137 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644802 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99184 (_ BitVec 32)) SeekEntryResult!12137)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476303 (= lt!644798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644802 mask!2687) lt!644802 lt!644799 mask!2687))))

(assert (=> b!1476303 (= lt!644802 (select (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476304 () Bool)

(declare-fun res!1002654 () Bool)

(assert (=> b!1476304 (=> (not res!1002654) (not e!828258))))

(assert (=> b!1476304 (= res!1002654 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48424 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48424 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48424 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476305 () Bool)

(declare-fun res!1002655 () Bool)

(assert (=> b!1476305 (=> (not res!1002655) (not e!828258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476305 (= res!1002655 (validKeyInArray!0 (select (arr!47872 a!2862) j!93)))))

(declare-fun b!1476306 () Bool)

(assert (=> b!1476306 (= e!828260 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644802 lt!644799 mask!2687) (seekEntryOrOpen!0 lt!644802 lt!644799 mask!2687)))))

(declare-fun b!1476307 () Bool)

(assert (=> b!1476307 (= e!828254 e!828257)))

(declare-fun res!1002644 () Bool)

(assert (=> b!1476307 (=> (not res!1002644) (not e!828257))))

(declare-fun lt!644801 () SeekEntryResult!12137)

(assert (=> b!1476307 (= res!1002644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47872 a!2862) j!93) mask!2687) (select (arr!47872 a!2862) j!93) a!2862 mask!2687) lt!644801))))

(assert (=> b!1476307 (= lt!644801 (Intermediate!12137 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476308 () Bool)

(declare-fun res!1002647 () Bool)

(assert (=> b!1476308 (=> (not res!1002647) (not e!828258))))

(declare-datatypes ((List!34451 0))(
  ( (Nil!34448) (Cons!34447 (h!35815 (_ BitVec 64)) (t!49137 List!34451)) )
))
(declare-fun arrayNoDuplicates!0 (array!99184 (_ BitVec 32) List!34451) Bool)

(assert (=> b!1476308 (= res!1002647 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34448))))

(declare-fun b!1476309 () Bool)

(assert (=> b!1476309 (= e!828260 (= lt!644798 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644802 lt!644799 mask!2687)))))

(declare-fun b!1476310 () Bool)

(declare-fun res!1002652 () Bool)

(assert (=> b!1476310 (=> (not res!1002652) (not e!828257))))

(assert (=> b!1476310 (= res!1002652 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47872 a!2862) j!93) a!2862 mask!2687) lt!644801))))

(declare-fun b!1476311 () Bool)

(assert (=> b!1476311 (= e!828261 e!828255)))

(declare-fun res!1002651 () Bool)

(assert (=> b!1476311 (=> res!1002651 e!828255)))

(assert (=> b!1476311 (= res!1002651 (or (and (= (select (arr!47872 a!2862) index!646) (select (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47872 a!2862) index!646) (select (arr!47872 a!2862) j!93))) (not (= (select (arr!47872 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476312 () Bool)

(declare-fun res!1002657 () Bool)

(assert (=> b!1476312 (=> (not res!1002657) (not e!828258))))

(assert (=> b!1476312 (= res!1002657 (validKeyInArray!0 (select (arr!47872 a!2862) i!1006)))))

(assert (= (and start!126100 res!1002646) b!1476297))

(assert (= (and b!1476297 res!1002643) b!1476312))

(assert (= (and b!1476312 res!1002657) b!1476305))

(assert (= (and b!1476305 res!1002655) b!1476298))

(assert (= (and b!1476298 res!1002650) b!1476308))

(assert (= (and b!1476308 res!1002647) b!1476304))

(assert (= (and b!1476304 res!1002654) b!1476302))

(assert (= (and b!1476302 res!1002649) b!1476307))

(assert (= (and b!1476307 res!1002644) b!1476310))

(assert (= (and b!1476310 res!1002652) b!1476303))

(assert (= (and b!1476303 res!1002648) b!1476300))

(assert (= (and b!1476300 c!136348) b!1476309))

(assert (= (and b!1476300 (not c!136348)) b!1476306))

(assert (= (and b!1476300 res!1002653) b!1476299))

(assert (= (and b!1476299 res!1002658) b!1476295))

(assert (= (and b!1476295 res!1002645) b!1476311))

(assert (= (and b!1476311 (not res!1002651)) b!1476296))

(assert (= (and b!1476296 res!1002656) b!1476301))

(declare-fun m!1361799 () Bool)

(assert (=> b!1476312 m!1361799))

(assert (=> b!1476312 m!1361799))

(declare-fun m!1361801 () Bool)

(assert (=> b!1476312 m!1361801))

(declare-fun m!1361803 () Bool)

(assert (=> b!1476307 m!1361803))

(assert (=> b!1476307 m!1361803))

(declare-fun m!1361805 () Bool)

(assert (=> b!1476307 m!1361805))

(assert (=> b!1476307 m!1361805))

(assert (=> b!1476307 m!1361803))

(declare-fun m!1361807 () Bool)

(assert (=> b!1476307 m!1361807))

(declare-fun m!1361809 () Bool)

(assert (=> b!1476295 m!1361809))

(declare-fun m!1361811 () Bool)

(assert (=> b!1476295 m!1361811))

(assert (=> b!1476295 m!1361803))

(declare-fun m!1361813 () Bool)

(assert (=> b!1476295 m!1361813))

(declare-fun m!1361815 () Bool)

(assert (=> b!1476295 m!1361815))

(assert (=> b!1476295 m!1361803))

(declare-fun m!1361817 () Bool)

(assert (=> b!1476302 m!1361817))

(declare-fun m!1361819 () Bool)

(assert (=> b!1476302 m!1361819))

(assert (=> b!1476305 m!1361803))

(assert (=> b!1476305 m!1361803))

(declare-fun m!1361821 () Bool)

(assert (=> b!1476305 m!1361821))

(declare-fun m!1361823 () Bool)

(assert (=> b!1476311 m!1361823))

(assert (=> b!1476311 m!1361817))

(declare-fun m!1361825 () Bool)

(assert (=> b!1476311 m!1361825))

(assert (=> b!1476311 m!1361803))

(declare-fun m!1361827 () Bool)

(assert (=> b!1476303 m!1361827))

(assert (=> b!1476303 m!1361827))

(declare-fun m!1361829 () Bool)

(assert (=> b!1476303 m!1361829))

(assert (=> b!1476303 m!1361817))

(declare-fun m!1361831 () Bool)

(assert (=> b!1476303 m!1361831))

(declare-fun m!1361833 () Bool)

(assert (=> b!1476298 m!1361833))

(declare-fun m!1361835 () Bool)

(assert (=> b!1476306 m!1361835))

(declare-fun m!1361837 () Bool)

(assert (=> b!1476306 m!1361837))

(declare-fun m!1361839 () Bool)

(assert (=> start!126100 m!1361839))

(declare-fun m!1361841 () Bool)

(assert (=> start!126100 m!1361841))

(assert (=> b!1476310 m!1361803))

(assert (=> b!1476310 m!1361803))

(declare-fun m!1361843 () Bool)

(assert (=> b!1476310 m!1361843))

(declare-fun m!1361845 () Bool)

(assert (=> b!1476309 m!1361845))

(assert (=> b!1476296 m!1361803))

(assert (=> b!1476296 m!1361803))

(declare-fun m!1361847 () Bool)

(assert (=> b!1476296 m!1361847))

(declare-fun m!1361849 () Bool)

(assert (=> b!1476308 m!1361849))

(check-sat (not b!1476306) (not b!1476298) (not b!1476309) (not b!1476305) (not b!1476307) (not b!1476308) (not b!1476310) (not b!1476295) (not b!1476312) (not b!1476296) (not start!126100) (not b!1476303))
(check-sat)
