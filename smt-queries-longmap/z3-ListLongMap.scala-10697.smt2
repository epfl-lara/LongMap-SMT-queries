; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125322 () Bool)

(assert start!125322)

(declare-fun b!1464099 () Bool)

(declare-fun res!993240 () Bool)

(declare-fun e!822830 () Bool)

(assert (=> b!1464099 (=> (not res!993240) (not e!822830))))

(declare-datatypes ((array!98770 0))(
  ( (array!98771 (arr!47673 (Array (_ BitVec 32) (_ BitVec 64))) (size!48223 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98770)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464099 (= res!993240 (validKeyInArray!0 (select (arr!47673 a!2862) j!93)))))

(declare-fun b!1464100 () Bool)

(declare-fun e!822824 () Bool)

(assert (=> b!1464100 (= e!822824 true)))

(declare-fun lt!640981 () Bool)

(declare-fun e!822822 () Bool)

(assert (=> b!1464100 (= lt!640981 e!822822)))

(declare-fun c!134946 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464100 (= c!134946 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464101 () Bool)

(declare-fun res!993242 () Bool)

(declare-fun e!822827 () Bool)

(assert (=> b!1464101 (=> (not res!993242) (not e!822827))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11925 0))(
  ( (MissingZero!11925 (index!50092 (_ BitVec 32))) (Found!11925 (index!50093 (_ BitVec 32))) (Intermediate!11925 (undefined!12737 Bool) (index!50094 (_ BitVec 32)) (x!131678 (_ BitVec 32))) (Undefined!11925) (MissingVacant!11925 (index!50095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98770 (_ BitVec 32)) SeekEntryResult!11925)

(assert (=> b!1464101 (= res!993242 (= (seekEntryOrOpen!0 (select (arr!47673 a!2862) j!93) a!2862 mask!2687) (Found!11925 j!93)))))

(declare-fun b!1464102 () Bool)

(declare-fun e!822823 () Bool)

(declare-fun e!822826 () Bool)

(assert (=> b!1464102 (= e!822823 e!822826)))

(declare-fun res!993244 () Bool)

(assert (=> b!1464102 (=> (not res!993244) (not e!822826))))

(declare-fun lt!640979 () SeekEntryResult!11925)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98770 (_ BitVec 32)) SeekEntryResult!11925)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464102 (= res!993244 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47673 a!2862) j!93) mask!2687) (select (arr!47673 a!2862) j!93) a!2862 mask!2687) lt!640979))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464102 (= lt!640979 (Intermediate!11925 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464103 () Bool)

(declare-fun res!993241 () Bool)

(assert (=> b!1464103 (=> (not res!993241) (not e!822830))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464103 (= res!993241 (and (= (size!48223 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48223 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48223 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464104 () Bool)

(declare-fun res!993230 () Bool)

(assert (=> b!1464104 (=> (not res!993230) (not e!822830))))

(assert (=> b!1464104 (= res!993230 (validKeyInArray!0 (select (arr!47673 a!2862) i!1006)))))

(declare-fun b!1464105 () Bool)

(declare-fun res!993239 () Bool)

(assert (=> b!1464105 (=> res!993239 e!822824)))

(declare-fun lt!640982 () (_ BitVec 32))

(assert (=> b!1464105 (= res!993239 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640982 (select (arr!47673 a!2862) j!93) a!2862 mask!2687) lt!640979)))))

(declare-fun b!1464106 () Bool)

(declare-fun res!993233 () Bool)

(assert (=> b!1464106 (=> (not res!993233) (not e!822826))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1464106 (= res!993233 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47673 a!2862) j!93) a!2862 mask!2687) lt!640979))))

(declare-fun b!1464107 () Bool)

(declare-fun lt!640980 () (_ BitVec 64))

(declare-fun lt!640978 () array!98770)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98770 (_ BitVec 32)) SeekEntryResult!11925)

(assert (=> b!1464107 (= e!822822 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640982 intermediateAfterIndex!19 lt!640980 lt!640978 mask!2687) (seekEntryOrOpen!0 lt!640980 lt!640978 mask!2687))))))

(declare-fun b!1464108 () Bool)

(assert (=> b!1464108 (= e!822827 (or (= (select (arr!47673 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47673 a!2862) intermediateBeforeIndex!19) (select (arr!47673 a!2862) j!93))))))

(declare-fun b!1464109 () Bool)

(declare-fun lt!640977 () SeekEntryResult!11925)

(assert (=> b!1464109 (= e!822822 (not (= lt!640977 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640982 lt!640980 lt!640978 mask!2687))))))

(declare-fun b!1464110 () Bool)

(declare-fun res!993234 () Bool)

(assert (=> b!1464110 (=> (not res!993234) (not e!822830))))

(declare-datatypes ((List!34174 0))(
  ( (Nil!34171) (Cons!34170 (h!35520 (_ BitVec 64)) (t!48868 List!34174)) )
))
(declare-fun arrayNoDuplicates!0 (array!98770 (_ BitVec 32) List!34174) Bool)

(assert (=> b!1464110 (= res!993234 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34171))))

(declare-fun b!1464111 () Bool)

(declare-fun e!822829 () Bool)

(assert (=> b!1464111 (= e!822829 (= lt!640977 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640980 lt!640978 mask!2687)))))

(declare-fun b!1464112 () Bool)

(declare-fun e!822821 () Bool)

(assert (=> b!1464112 (= e!822826 e!822821)))

(declare-fun res!993245 () Bool)

(assert (=> b!1464112 (=> (not res!993245) (not e!822821))))

(assert (=> b!1464112 (= res!993245 (= lt!640977 (Intermediate!11925 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1464112 (= lt!640977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640980 mask!2687) lt!640980 lt!640978 mask!2687))))

(assert (=> b!1464112 (= lt!640980 (select (store (arr!47673 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464113 () Bool)

(assert (=> b!1464113 (= e!822830 e!822823)))

(declare-fun res!993231 () Bool)

(assert (=> b!1464113 (=> (not res!993231) (not e!822823))))

(assert (=> b!1464113 (= res!993231 (= (select (store (arr!47673 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464113 (= lt!640978 (array!98771 (store (arr!47673 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48223 a!2862)))))

(declare-fun res!993232 () Bool)

(assert (=> start!125322 (=> (not res!993232) (not e!822830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125322 (= res!993232 (validMask!0 mask!2687))))

(assert (=> start!125322 e!822830))

(assert (=> start!125322 true))

(declare-fun array_inv!36701 (array!98770) Bool)

(assert (=> start!125322 (array_inv!36701 a!2862)))

(declare-fun b!1464114 () Bool)

(declare-fun res!993236 () Bool)

(assert (=> b!1464114 (=> (not res!993236) (not e!822830))))

(assert (=> b!1464114 (= res!993236 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48223 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48223 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48223 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464115 () Bool)

(assert (=> b!1464115 (= e!822829 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640980 lt!640978 mask!2687) (seekEntryOrOpen!0 lt!640980 lt!640978 mask!2687)))))

(declare-fun b!1464116 () Bool)

(declare-fun e!822828 () Bool)

(assert (=> b!1464116 (= e!822821 (not e!822828))))

(declare-fun res!993238 () Bool)

(assert (=> b!1464116 (=> res!993238 e!822828)))

(assert (=> b!1464116 (= res!993238 (or (and (= (select (arr!47673 a!2862) index!646) (select (store (arr!47673 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47673 a!2862) index!646) (select (arr!47673 a!2862) j!93))) (= (select (arr!47673 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464116 e!822827))

(declare-fun res!993246 () Bool)

(assert (=> b!1464116 (=> (not res!993246) (not e!822827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98770 (_ BitVec 32)) Bool)

(assert (=> b!1464116 (= res!993246 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49346 0))(
  ( (Unit!49347) )
))
(declare-fun lt!640983 () Unit!49346)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49346)

(assert (=> b!1464116 (= lt!640983 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464117 () Bool)

(declare-fun res!993243 () Bool)

(assert (=> b!1464117 (=> (not res!993243) (not e!822830))))

(assert (=> b!1464117 (= res!993243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464118 () Bool)

(assert (=> b!1464118 (= e!822828 e!822824)))

(declare-fun res!993235 () Bool)

(assert (=> b!1464118 (=> res!993235 e!822824)))

(assert (=> b!1464118 (= res!993235 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640982 #b00000000000000000000000000000000) (bvsge lt!640982 (size!48223 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464118 (= lt!640982 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464119 () Bool)

(declare-fun res!993247 () Bool)

(assert (=> b!1464119 (=> (not res!993247) (not e!822821))))

(assert (=> b!1464119 (= res!993247 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464120 () Bool)

(declare-fun res!993237 () Bool)

(assert (=> b!1464120 (=> (not res!993237) (not e!822821))))

(assert (=> b!1464120 (= res!993237 e!822829)))

(declare-fun c!134945 () Bool)

(assert (=> b!1464120 (= c!134945 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125322 res!993232) b!1464103))

(assert (= (and b!1464103 res!993241) b!1464104))

(assert (= (and b!1464104 res!993230) b!1464099))

(assert (= (and b!1464099 res!993240) b!1464117))

(assert (= (and b!1464117 res!993243) b!1464110))

(assert (= (and b!1464110 res!993234) b!1464114))

(assert (= (and b!1464114 res!993236) b!1464113))

(assert (= (and b!1464113 res!993231) b!1464102))

(assert (= (and b!1464102 res!993244) b!1464106))

(assert (= (and b!1464106 res!993233) b!1464112))

(assert (= (and b!1464112 res!993245) b!1464120))

(assert (= (and b!1464120 c!134945) b!1464111))

(assert (= (and b!1464120 (not c!134945)) b!1464115))

(assert (= (and b!1464120 res!993237) b!1464119))

(assert (= (and b!1464119 res!993247) b!1464116))

(assert (= (and b!1464116 res!993246) b!1464101))

(assert (= (and b!1464101 res!993242) b!1464108))

(assert (= (and b!1464116 (not res!993238)) b!1464118))

(assert (= (and b!1464118 (not res!993235)) b!1464105))

(assert (= (and b!1464105 (not res!993239)) b!1464100))

(assert (= (and b!1464100 c!134946) b!1464109))

(assert (= (and b!1464100 (not c!134946)) b!1464107))

(declare-fun m!1351355 () Bool)

(assert (=> start!125322 m!1351355))

(declare-fun m!1351357 () Bool)

(assert (=> start!125322 m!1351357))

(declare-fun m!1351359 () Bool)

(assert (=> b!1464105 m!1351359))

(assert (=> b!1464105 m!1351359))

(declare-fun m!1351361 () Bool)

(assert (=> b!1464105 m!1351361))

(declare-fun m!1351363 () Bool)

(assert (=> b!1464112 m!1351363))

(assert (=> b!1464112 m!1351363))

(declare-fun m!1351365 () Bool)

(assert (=> b!1464112 m!1351365))

(declare-fun m!1351367 () Bool)

(assert (=> b!1464112 m!1351367))

(declare-fun m!1351369 () Bool)

(assert (=> b!1464112 m!1351369))

(declare-fun m!1351371 () Bool)

(assert (=> b!1464107 m!1351371))

(declare-fun m!1351373 () Bool)

(assert (=> b!1464107 m!1351373))

(declare-fun m!1351375 () Bool)

(assert (=> b!1464109 m!1351375))

(declare-fun m!1351377 () Bool)

(assert (=> b!1464104 m!1351377))

(assert (=> b!1464104 m!1351377))

(declare-fun m!1351379 () Bool)

(assert (=> b!1464104 m!1351379))

(assert (=> b!1464113 m!1351367))

(declare-fun m!1351381 () Bool)

(assert (=> b!1464113 m!1351381))

(declare-fun m!1351383 () Bool)

(assert (=> b!1464115 m!1351383))

(assert (=> b!1464115 m!1351373))

(declare-fun m!1351385 () Bool)

(assert (=> b!1464110 m!1351385))

(assert (=> b!1464101 m!1351359))

(assert (=> b!1464101 m!1351359))

(declare-fun m!1351387 () Bool)

(assert (=> b!1464101 m!1351387))

(assert (=> b!1464099 m!1351359))

(assert (=> b!1464099 m!1351359))

(declare-fun m!1351389 () Bool)

(assert (=> b!1464099 m!1351389))

(declare-fun m!1351391 () Bool)

(assert (=> b!1464117 m!1351391))

(assert (=> b!1464102 m!1351359))

(assert (=> b!1464102 m!1351359))

(declare-fun m!1351393 () Bool)

(assert (=> b!1464102 m!1351393))

(assert (=> b!1464102 m!1351393))

(assert (=> b!1464102 m!1351359))

(declare-fun m!1351395 () Bool)

(assert (=> b!1464102 m!1351395))

(declare-fun m!1351397 () Bool)

(assert (=> b!1464111 m!1351397))

(declare-fun m!1351399 () Bool)

(assert (=> b!1464108 m!1351399))

(assert (=> b!1464108 m!1351359))

(declare-fun m!1351401 () Bool)

(assert (=> b!1464118 m!1351401))

(declare-fun m!1351403 () Bool)

(assert (=> b!1464116 m!1351403))

(assert (=> b!1464116 m!1351367))

(declare-fun m!1351405 () Bool)

(assert (=> b!1464116 m!1351405))

(declare-fun m!1351407 () Bool)

(assert (=> b!1464116 m!1351407))

(declare-fun m!1351409 () Bool)

(assert (=> b!1464116 m!1351409))

(assert (=> b!1464116 m!1351359))

(assert (=> b!1464106 m!1351359))

(assert (=> b!1464106 m!1351359))

(declare-fun m!1351411 () Bool)

(assert (=> b!1464106 m!1351411))

(check-sat (not b!1464102) (not b!1464106) (not b!1464105) (not b!1464109) (not b!1464110) (not b!1464111) (not b!1464118) (not start!125322) (not b!1464104) (not b!1464117) (not b!1464112) (not b!1464115) (not b!1464099) (not b!1464116) (not b!1464101) (not b!1464107))
(check-sat)
