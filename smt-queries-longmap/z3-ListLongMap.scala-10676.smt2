; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125412 () Bool)

(assert start!125412)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640169 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11811 0))(
  ( (MissingZero!11811 (index!49636 (_ BitVec 32))) (Found!11811 (index!49637 (_ BitVec 32))) (Intermediate!11811 (undefined!12623 Bool) (index!49638 (_ BitVec 32)) (x!131420 (_ BitVec 32))) (Undefined!11811) (MissingVacant!11811 (index!49639 (_ BitVec 32))) )
))
(declare-fun lt!640173 () SeekEntryResult!11811)

(declare-fun b!1461375 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!821847 () Bool)

(declare-fun lt!640170 () (_ BitVec 32))

(declare-datatypes ((array!98755 0))(
  ( (array!98756 (arr!47662 (Array (_ BitVec 32) (_ BitVec 64))) (size!48213 (_ BitVec 32))) )
))
(declare-fun lt!640174 () array!98755)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98755 (_ BitVec 32)) SeekEntryResult!11811)

(assert (=> b!1461375 (= e!821847 (not (= lt!640173 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640170 lt!640169 lt!640174 mask!2687))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1461376 () Bool)

(declare-fun e!821855 () Bool)

(assert (=> b!1461376 (= e!821855 (= lt!640173 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640169 lt!640174 mask!2687)))))

(declare-fun b!1461377 () Bool)

(declare-fun res!990382 () Bool)

(declare-fun e!821848 () Bool)

(assert (=> b!1461377 (=> (not res!990382) (not e!821848))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98755)

(assert (=> b!1461377 (= res!990382 (and (= (size!48213 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48213 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48213 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461378 () Bool)

(declare-fun res!990387 () Bool)

(assert (=> b!1461378 (=> (not res!990387) (not e!821848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461378 (= res!990387 (validKeyInArray!0 (select (arr!47662 a!2862) i!1006)))))

(declare-fun b!1461379 () Bool)

(declare-fun e!821853 () Bool)

(declare-fun e!821852 () Bool)

(assert (=> b!1461379 (= e!821853 e!821852)))

(declare-fun res!990391 () Bool)

(assert (=> b!1461379 (=> (not res!990391) (not e!821852))))

(declare-fun lt!640177 () SeekEntryResult!11811)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461379 (= res!990391 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47662 a!2862) j!93) mask!2687) (select (arr!47662 a!2862) j!93) a!2862 mask!2687) lt!640177))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461379 (= lt!640177 (Intermediate!11811 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461380 () Bool)

(declare-fun res!990388 () Bool)

(assert (=> b!1461380 (=> (not res!990388) (not e!821848))))

(declare-datatypes ((List!34150 0))(
  ( (Nil!34147) (Cons!34146 (h!35507 (_ BitVec 64)) (t!48836 List!34150)) )
))
(declare-fun arrayNoDuplicates!0 (array!98755 (_ BitVec 32) List!34150) Bool)

(assert (=> b!1461380 (= res!990388 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34147))))

(declare-fun b!1461381 () Bool)

(declare-fun e!821856 () Bool)

(declare-fun e!821850 () Bool)

(assert (=> b!1461381 (= e!821856 e!821850)))

(declare-fun res!990377 () Bool)

(assert (=> b!1461381 (=> res!990377 e!821850)))

(assert (=> b!1461381 (= res!990377 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!640172 () SeekEntryResult!11811)

(declare-fun lt!640171 () SeekEntryResult!11811)

(assert (=> b!1461381 (= lt!640172 lt!640171)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49151 0))(
  ( (Unit!49152) )
))
(declare-fun lt!640176 () Unit!49151)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49151)

(assert (=> b!1461381 (= lt!640176 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!640170 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1461382 () Bool)

(declare-fun res!990392 () Bool)

(declare-fun e!821854 () Bool)

(assert (=> b!1461382 (=> (not res!990392) (not e!821854))))

(assert (=> b!1461382 (= res!990392 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461383 () Bool)

(declare-fun res!990381 () Bool)

(assert (=> b!1461383 (=> (not res!990381) (not e!821852))))

(assert (=> b!1461383 (= res!990381 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47662 a!2862) j!93) a!2862 mask!2687) lt!640177))))

(declare-fun res!990390 () Bool)

(assert (=> start!125412 (=> (not res!990390) (not e!821848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125412 (= res!990390 (validMask!0 mask!2687))))

(assert (=> start!125412 e!821848))

(assert (=> start!125412 true))

(declare-fun array_inv!36943 (array!98755) Bool)

(assert (=> start!125412 (array_inv!36943 a!2862)))

(declare-fun b!1461384 () Bool)

(declare-fun res!990384 () Bool)

(assert (=> b!1461384 (=> (not res!990384) (not e!821848))))

(assert (=> b!1461384 (= res!990384 (validKeyInArray!0 (select (arr!47662 a!2862) j!93)))))

(declare-fun b!1461385 () Bool)

(assert (=> b!1461385 (= e!821852 e!821854)))

(declare-fun res!990379 () Bool)

(assert (=> b!1461385 (=> (not res!990379) (not e!821854))))

(assert (=> b!1461385 (= res!990379 (= lt!640173 (Intermediate!11811 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1461385 (= lt!640173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640169 mask!2687) lt!640169 lt!640174 mask!2687))))

(assert (=> b!1461385 (= lt!640169 (select (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461386 () Bool)

(assert (=> b!1461386 (= e!821850 (validKeyInArray!0 lt!640169))))

(declare-fun b!1461387 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98755 (_ BitVec 32)) SeekEntryResult!11811)

(assert (=> b!1461387 (= e!821847 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640170 intermediateAfterIndex!19 lt!640169 lt!640174 mask!2687) lt!640171)))))

(declare-fun b!1461388 () Bool)

(assert (=> b!1461388 (= e!821848 e!821853)))

(declare-fun res!990395 () Bool)

(assert (=> b!1461388 (=> (not res!990395) (not e!821853))))

(assert (=> b!1461388 (= res!990395 (= (select (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461388 (= lt!640174 (array!98756 (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48213 a!2862)))))

(declare-fun b!1461389 () Bool)

(declare-fun res!990383 () Bool)

(assert (=> b!1461389 (=> (not res!990383) (not e!821848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98755 (_ BitVec 32)) Bool)

(assert (=> b!1461389 (= res!990383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461390 () Bool)

(declare-fun e!821851 () Bool)

(assert (=> b!1461390 (= e!821854 (not e!821851))))

(declare-fun res!990389 () Bool)

(assert (=> b!1461390 (=> res!990389 e!821851)))

(assert (=> b!1461390 (= res!990389 (or (and (= (select (arr!47662 a!2862) index!646) (select (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47662 a!2862) index!646) (select (arr!47662 a!2862) j!93))) (= (select (arr!47662 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1461390 (and (= lt!640172 (Found!11811 j!93)) (or (= (select (arr!47662 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47662 a!2862) intermediateBeforeIndex!19) (select (arr!47662 a!2862) j!93))) (let ((bdg!53562 (select (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47662 a!2862) index!646) bdg!53562) (= (select (arr!47662 a!2862) index!646) (select (arr!47662 a!2862) j!93))) (= (select (arr!47662 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53562 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98755 (_ BitVec 32)) SeekEntryResult!11811)

(assert (=> b!1461390 (= lt!640172 (seekEntryOrOpen!0 (select (arr!47662 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1461390 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!640175 () Unit!49151)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49151)

(assert (=> b!1461390 (= lt!640175 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461391 () Bool)

(assert (=> b!1461391 (= e!821855 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640169 lt!640174 mask!2687) (seekEntryOrOpen!0 lt!640169 lt!640174 mask!2687)))))

(declare-fun b!1461392 () Bool)

(assert (=> b!1461392 (= e!821851 e!821856)))

(declare-fun res!990378 () Bool)

(assert (=> b!1461392 (=> res!990378 e!821856)))

(assert (=> b!1461392 (= res!990378 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640170 #b00000000000000000000000000000000) (bvsge lt!640170 (size!48213 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461392 (= lt!640170 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1461392 (= lt!640171 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640169 lt!640174 mask!2687))))

(assert (=> b!1461392 (= lt!640171 (seekEntryOrOpen!0 lt!640169 lt!640174 mask!2687))))

(declare-fun b!1461393 () Bool)

(declare-fun res!990380 () Bool)

(assert (=> b!1461393 (=> res!990380 e!821856)))

(assert (=> b!1461393 (= res!990380 e!821847)))

(declare-fun c!135019 () Bool)

(assert (=> b!1461393 (= c!135019 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461394 () Bool)

(declare-fun res!990394 () Bool)

(assert (=> b!1461394 (=> res!990394 e!821856)))

(assert (=> b!1461394 (= res!990394 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1461395 () Bool)

(declare-fun res!990386 () Bool)

(assert (=> b!1461395 (=> (not res!990386) (not e!821854))))

(assert (=> b!1461395 (= res!990386 e!821855)))

(declare-fun c!135018 () Bool)

(assert (=> b!1461395 (= c!135018 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461396 () Bool)

(declare-fun res!990393 () Bool)

(assert (=> b!1461396 (=> (not res!990393) (not e!821848))))

(assert (=> b!1461396 (= res!990393 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48213 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48213 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48213 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461397 () Bool)

(declare-fun res!990385 () Bool)

(assert (=> b!1461397 (=> res!990385 e!821856)))

(assert (=> b!1461397 (= res!990385 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640170 (select (arr!47662 a!2862) j!93) a!2862 mask!2687) lt!640177)))))

(assert (= (and start!125412 res!990390) b!1461377))

(assert (= (and b!1461377 res!990382) b!1461378))

(assert (= (and b!1461378 res!990387) b!1461384))

(assert (= (and b!1461384 res!990384) b!1461389))

(assert (= (and b!1461389 res!990383) b!1461380))

(assert (= (and b!1461380 res!990388) b!1461396))

(assert (= (and b!1461396 res!990393) b!1461388))

(assert (= (and b!1461388 res!990395) b!1461379))

(assert (= (and b!1461379 res!990391) b!1461383))

(assert (= (and b!1461383 res!990381) b!1461385))

(assert (= (and b!1461385 res!990379) b!1461395))

(assert (= (and b!1461395 c!135018) b!1461376))

(assert (= (and b!1461395 (not c!135018)) b!1461391))

(assert (= (and b!1461395 res!990386) b!1461382))

(assert (= (and b!1461382 res!990392) b!1461390))

(assert (= (and b!1461390 (not res!990389)) b!1461392))

(assert (= (and b!1461392 (not res!990378)) b!1461397))

(assert (= (and b!1461397 (not res!990385)) b!1461393))

(assert (= (and b!1461393 c!135019) b!1461375))

(assert (= (and b!1461393 (not c!135019)) b!1461387))

(assert (= (and b!1461393 (not res!990380)) b!1461394))

(assert (= (and b!1461394 (not res!990394)) b!1461381))

(assert (= (and b!1461381 (not res!990377)) b!1461386))

(declare-fun m!1349191 () Bool)

(assert (=> b!1461386 m!1349191))

(declare-fun m!1349193 () Bool)

(assert (=> b!1461376 m!1349193))

(declare-fun m!1349195 () Bool)

(assert (=> b!1461385 m!1349195))

(assert (=> b!1461385 m!1349195))

(declare-fun m!1349197 () Bool)

(assert (=> b!1461385 m!1349197))

(declare-fun m!1349199 () Bool)

(assert (=> b!1461385 m!1349199))

(declare-fun m!1349201 () Bool)

(assert (=> b!1461385 m!1349201))

(declare-fun m!1349203 () Bool)

(assert (=> b!1461379 m!1349203))

(assert (=> b!1461379 m!1349203))

(declare-fun m!1349205 () Bool)

(assert (=> b!1461379 m!1349205))

(assert (=> b!1461379 m!1349205))

(assert (=> b!1461379 m!1349203))

(declare-fun m!1349207 () Bool)

(assert (=> b!1461379 m!1349207))

(assert (=> b!1461388 m!1349199))

(declare-fun m!1349209 () Bool)

(assert (=> b!1461388 m!1349209))

(declare-fun m!1349211 () Bool)

(assert (=> b!1461392 m!1349211))

(declare-fun m!1349213 () Bool)

(assert (=> b!1461392 m!1349213))

(declare-fun m!1349215 () Bool)

(assert (=> b!1461392 m!1349215))

(declare-fun m!1349217 () Bool)

(assert (=> b!1461389 m!1349217))

(assert (=> b!1461397 m!1349203))

(assert (=> b!1461397 m!1349203))

(declare-fun m!1349219 () Bool)

(assert (=> b!1461397 m!1349219))

(assert (=> b!1461383 m!1349203))

(assert (=> b!1461383 m!1349203))

(declare-fun m!1349221 () Bool)

(assert (=> b!1461383 m!1349221))

(declare-fun m!1349223 () Bool)

(assert (=> b!1461380 m!1349223))

(assert (=> b!1461384 m!1349203))

(assert (=> b!1461384 m!1349203))

(declare-fun m!1349225 () Bool)

(assert (=> b!1461384 m!1349225))

(assert (=> b!1461391 m!1349213))

(assert (=> b!1461391 m!1349215))

(declare-fun m!1349227 () Bool)

(assert (=> b!1461381 m!1349227))

(declare-fun m!1349229 () Bool)

(assert (=> start!125412 m!1349229))

(declare-fun m!1349231 () Bool)

(assert (=> start!125412 m!1349231))

(declare-fun m!1349233 () Bool)

(assert (=> b!1461375 m!1349233))

(declare-fun m!1349235 () Bool)

(assert (=> b!1461378 m!1349235))

(assert (=> b!1461378 m!1349235))

(declare-fun m!1349237 () Bool)

(assert (=> b!1461378 m!1349237))

(declare-fun m!1349239 () Bool)

(assert (=> b!1461390 m!1349239))

(assert (=> b!1461390 m!1349199))

(declare-fun m!1349241 () Bool)

(assert (=> b!1461390 m!1349241))

(declare-fun m!1349243 () Bool)

(assert (=> b!1461390 m!1349243))

(declare-fun m!1349245 () Bool)

(assert (=> b!1461390 m!1349245))

(assert (=> b!1461390 m!1349203))

(declare-fun m!1349247 () Bool)

(assert (=> b!1461390 m!1349247))

(declare-fun m!1349249 () Bool)

(assert (=> b!1461390 m!1349249))

(assert (=> b!1461390 m!1349203))

(declare-fun m!1349251 () Bool)

(assert (=> b!1461387 m!1349251))

(check-sat (not start!125412) (not b!1461392) (not b!1461376) (not b!1461379) (not b!1461380) (not b!1461397) (not b!1461390) (not b!1461385) (not b!1461387) (not b!1461375) (not b!1461386) (not b!1461384) (not b!1461391) (not b!1461381) (not b!1461389) (not b!1461378) (not b!1461383))
(check-sat)
