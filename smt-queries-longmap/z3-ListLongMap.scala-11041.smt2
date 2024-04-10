; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129080 () Bool)

(assert start!129080)

(declare-fun b!1514329 () Bool)

(declare-fun res!1034238 () Bool)

(declare-fun e!845115 () Bool)

(assert (=> b!1514329 (=> (not res!1034238) (not e!845115))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12876 0))(
  ( (MissingZero!12876 (index!53899 (_ BitVec 32))) (Found!12876 (index!53900 (_ BitVec 32))) (Intermediate!12876 (undefined!13688 Bool) (index!53901 (_ BitVec 32)) (x!135610 (_ BitVec 32))) (Undefined!12876) (MissingVacant!12876 (index!53902 (_ BitVec 32))) )
))
(declare-fun lt!656297 () SeekEntryResult!12876)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100936 0))(
  ( (array!100937 (arr!48705 (Array (_ BitVec 32) (_ BitVec 64))) (size!49255 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100936)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12876)

(assert (=> b!1514329 (= res!1034238 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48705 a!2804) j!70) a!2804 mask!2512) lt!656297))))

(declare-fun b!1514330 () Bool)

(declare-fun e!845113 () Bool)

(assert (=> b!1514330 (= e!845113 (not true))))

(declare-fun e!845119 () Bool)

(assert (=> b!1514330 e!845119))

(declare-fun res!1034242 () Bool)

(assert (=> b!1514330 (=> (not res!1034242) (not e!845119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100936 (_ BitVec 32)) Bool)

(assert (=> b!1514330 (= res!1034242 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50620 0))(
  ( (Unit!50621) )
))
(declare-fun lt!656299 () Unit!50620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50620)

(assert (=> b!1514330 (= lt!656299 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514331 () Bool)

(declare-fun res!1034234 () Bool)

(declare-fun e!845116 () Bool)

(assert (=> b!1514331 (=> (not res!1034234) (not e!845116))))

(declare-datatypes ((List!35188 0))(
  ( (Nil!35185) (Cons!35184 (h!36596 (_ BitVec 64)) (t!49882 List!35188)) )
))
(declare-fun arrayNoDuplicates!0 (array!100936 (_ BitVec 32) List!35188) Bool)

(assert (=> b!1514331 (= res!1034234 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35185))))

(declare-fun res!1034245 () Bool)

(assert (=> start!129080 (=> (not res!1034245) (not e!845116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129080 (= res!1034245 (validMask!0 mask!2512))))

(assert (=> start!129080 e!845116))

(assert (=> start!129080 true))

(declare-fun array_inv!37733 (array!100936) Bool)

(assert (=> start!129080 (array_inv!37733 a!2804)))

(declare-fun b!1514332 () Bool)

(declare-fun e!845117 () Bool)

(declare-fun e!845118 () Bool)

(assert (=> b!1514332 (= e!845117 e!845118)))

(declare-fun res!1034236 () Bool)

(assert (=> b!1514332 (=> (not res!1034236) (not e!845118))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12876)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12876)

(assert (=> b!1514332 (= res!1034236 (= (seekEntryOrOpen!0 (select (arr!48705 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48705 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514333 () Bool)

(declare-fun lt!656295 () array!100936)

(declare-fun lt!656296 () (_ BitVec 64))

(assert (=> b!1514333 (= e!845118 (= (seekEntryOrOpen!0 lt!656296 lt!656295 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656296 lt!656295 mask!2512)))))

(declare-fun b!1514334 () Bool)

(declare-fun res!1034235 () Bool)

(assert (=> b!1514334 (=> (not res!1034235) (not e!845116))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514334 (= res!1034235 (and (= (size!49255 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49255 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49255 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514335 () Bool)

(declare-fun res!1034241 () Bool)

(assert (=> b!1514335 (=> (not res!1034241) (not e!845116))))

(assert (=> b!1514335 (= res!1034241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514336 () Bool)

(assert (=> b!1514336 (= e!845116 e!845115)))

(declare-fun res!1034233 () Bool)

(assert (=> b!1514336 (=> (not res!1034233) (not e!845115))))

(declare-fun lt!656298 () SeekEntryResult!12876)

(assert (=> b!1514336 (= res!1034233 (= lt!656298 lt!656297))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514336 (= lt!656297 (Intermediate!12876 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514336 (= lt!656298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48705 a!2804) j!70) mask!2512) (select (arr!48705 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514337 () Bool)

(assert (=> b!1514337 (= e!845115 e!845113)))

(declare-fun res!1034237 () Bool)

(assert (=> b!1514337 (=> (not res!1034237) (not e!845113))))

(assert (=> b!1514337 (= res!1034237 (= lt!656298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656296 mask!2512) lt!656296 lt!656295 mask!2512)))))

(assert (=> b!1514337 (= lt!656296 (select (store (arr!48705 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514337 (= lt!656295 (array!100937 (store (arr!48705 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49255 a!2804)))))

(declare-fun b!1514338 () Bool)

(declare-fun res!1034232 () Bool)

(assert (=> b!1514338 (=> (not res!1034232) (not e!845119))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12876)

(assert (=> b!1514338 (= res!1034232 (= (seekEntry!0 (select (arr!48705 a!2804) j!70) a!2804 mask!2512) (Found!12876 j!70)))))

(declare-fun b!1514339 () Bool)

(declare-fun res!1034240 () Bool)

(assert (=> b!1514339 (=> (not res!1034240) (not e!845116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514339 (= res!1034240 (validKeyInArray!0 (select (arr!48705 a!2804) j!70)))))

(declare-fun b!1514340 () Bool)

(assert (=> b!1514340 (= e!845119 e!845117)))

(declare-fun res!1034243 () Bool)

(assert (=> b!1514340 (=> res!1034243 e!845117)))

(assert (=> b!1514340 (= res!1034243 (or (not (= (select (arr!48705 a!2804) j!70) lt!656296)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48705 a!2804) index!487) (select (arr!48705 a!2804) j!70)) (not (= (select (arr!48705 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514341 () Bool)

(declare-fun res!1034244 () Bool)

(assert (=> b!1514341 (=> (not res!1034244) (not e!845116))))

(assert (=> b!1514341 (= res!1034244 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49255 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49255 a!2804))))))

(declare-fun b!1514342 () Bool)

(declare-fun res!1034239 () Bool)

(assert (=> b!1514342 (=> (not res!1034239) (not e!845116))))

(assert (=> b!1514342 (= res!1034239 (validKeyInArray!0 (select (arr!48705 a!2804) i!961)))))

(assert (= (and start!129080 res!1034245) b!1514334))

(assert (= (and b!1514334 res!1034235) b!1514342))

(assert (= (and b!1514342 res!1034239) b!1514339))

(assert (= (and b!1514339 res!1034240) b!1514335))

(assert (= (and b!1514335 res!1034241) b!1514331))

(assert (= (and b!1514331 res!1034234) b!1514341))

(assert (= (and b!1514341 res!1034244) b!1514336))

(assert (= (and b!1514336 res!1034233) b!1514329))

(assert (= (and b!1514329 res!1034238) b!1514337))

(assert (= (and b!1514337 res!1034237) b!1514330))

(assert (= (and b!1514330 res!1034242) b!1514338))

(assert (= (and b!1514338 res!1034232) b!1514340))

(assert (= (and b!1514340 (not res!1034243)) b!1514332))

(assert (= (and b!1514332 res!1034236) b!1514333))

(declare-fun m!1397273 () Bool)

(assert (=> b!1514340 m!1397273))

(declare-fun m!1397275 () Bool)

(assert (=> b!1514340 m!1397275))

(declare-fun m!1397277 () Bool)

(assert (=> b!1514333 m!1397277))

(declare-fun m!1397279 () Bool)

(assert (=> b!1514333 m!1397279))

(assert (=> b!1514329 m!1397273))

(assert (=> b!1514329 m!1397273))

(declare-fun m!1397281 () Bool)

(assert (=> b!1514329 m!1397281))

(assert (=> b!1514339 m!1397273))

(assert (=> b!1514339 m!1397273))

(declare-fun m!1397283 () Bool)

(assert (=> b!1514339 m!1397283))

(declare-fun m!1397285 () Bool)

(assert (=> b!1514330 m!1397285))

(declare-fun m!1397287 () Bool)

(assert (=> b!1514330 m!1397287))

(assert (=> b!1514332 m!1397273))

(assert (=> b!1514332 m!1397273))

(declare-fun m!1397289 () Bool)

(assert (=> b!1514332 m!1397289))

(assert (=> b!1514332 m!1397273))

(declare-fun m!1397291 () Bool)

(assert (=> b!1514332 m!1397291))

(declare-fun m!1397293 () Bool)

(assert (=> b!1514335 m!1397293))

(declare-fun m!1397295 () Bool)

(assert (=> b!1514342 m!1397295))

(assert (=> b!1514342 m!1397295))

(declare-fun m!1397297 () Bool)

(assert (=> b!1514342 m!1397297))

(assert (=> b!1514336 m!1397273))

(assert (=> b!1514336 m!1397273))

(declare-fun m!1397299 () Bool)

(assert (=> b!1514336 m!1397299))

(assert (=> b!1514336 m!1397299))

(assert (=> b!1514336 m!1397273))

(declare-fun m!1397301 () Bool)

(assert (=> b!1514336 m!1397301))

(declare-fun m!1397303 () Bool)

(assert (=> b!1514331 m!1397303))

(assert (=> b!1514338 m!1397273))

(assert (=> b!1514338 m!1397273))

(declare-fun m!1397305 () Bool)

(assert (=> b!1514338 m!1397305))

(declare-fun m!1397307 () Bool)

(assert (=> start!129080 m!1397307))

(declare-fun m!1397309 () Bool)

(assert (=> start!129080 m!1397309))

(declare-fun m!1397311 () Bool)

(assert (=> b!1514337 m!1397311))

(assert (=> b!1514337 m!1397311))

(declare-fun m!1397313 () Bool)

(assert (=> b!1514337 m!1397313))

(declare-fun m!1397315 () Bool)

(assert (=> b!1514337 m!1397315))

(declare-fun m!1397317 () Bool)

(assert (=> b!1514337 m!1397317))

(check-sat (not b!1514337) (not start!129080) (not b!1514333) (not b!1514335) (not b!1514332) (not b!1514330) (not b!1514329) (not b!1514336) (not b!1514342) (not b!1514331) (not b!1514339) (not b!1514338))
(check-sat)
