; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129778 () Bool)

(assert start!129778)

(declare-fun b!1523314 () Bool)

(declare-fun res!1042230 () Bool)

(declare-fun e!849293 () Bool)

(assert (=> b!1523314 (=> (not res!1042230) (not e!849293))))

(declare-datatypes ((array!101374 0))(
  ( (array!101375 (arr!48918 (Array (_ BitVec 32) (_ BitVec 64))) (size!49468 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101374)

(declare-datatypes ((List!35401 0))(
  ( (Nil!35398) (Cons!35397 (h!36821 (_ BitVec 64)) (t!50095 List!35401)) )
))
(declare-fun arrayNoDuplicates!0 (array!101374 (_ BitVec 32) List!35401) Bool)

(assert (=> b!1523314 (= res!1042230 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35398))))

(declare-fun b!1523315 () Bool)

(declare-fun res!1042231 () Bool)

(assert (=> b!1523315 (=> (not res!1042231) (not e!849293))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523315 (= res!1042231 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49468 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49468 a!2804))))))

(declare-fun e!849292 () Bool)

(declare-fun b!1523316 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13083 0))(
  ( (MissingZero!13083 (index!54727 (_ BitVec 32))) (Found!13083 (index!54728 (_ BitVec 32))) (Intermediate!13083 (undefined!13895 Bool) (index!54729 (_ BitVec 32)) (x!136417 (_ BitVec 32))) (Undefined!13083) (MissingVacant!13083 (index!54730 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101374 (_ BitVec 32)) SeekEntryResult!13083)

(assert (=> b!1523316 (= e!849292 (= (seekEntry!0 (select (arr!48918 a!2804) j!70) a!2804 mask!2512) (Found!13083 j!70)))))

(declare-fun b!1523317 () Bool)

(declare-fun res!1042227 () Bool)

(assert (=> b!1523317 (=> (not res!1042227) (not e!849293))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523317 (= res!1042227 (validKeyInArray!0 (select (arr!48918 a!2804) i!961)))))

(declare-fun b!1523318 () Bool)

(declare-fun res!1042229 () Bool)

(assert (=> b!1523318 (=> (not res!1042229) (not e!849293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101374 (_ BitVec 32)) Bool)

(assert (=> b!1523318 (= res!1042229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523319 () Bool)

(declare-fun e!849294 () Bool)

(assert (=> b!1523319 (= e!849294 (not true))))

(assert (=> b!1523319 e!849292))

(declare-fun res!1042224 () Bool)

(assert (=> b!1523319 (=> (not res!1042224) (not e!849292))))

(assert (=> b!1523319 (= res!1042224 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50950 0))(
  ( (Unit!50951) )
))
(declare-fun lt!659919 () Unit!50950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50950)

(assert (=> b!1523319 (= lt!659919 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523321 () Bool)

(declare-fun res!1042222 () Bool)

(assert (=> b!1523321 (=> (not res!1042222) (not e!849293))))

(assert (=> b!1523321 (= res!1042222 (validKeyInArray!0 (select (arr!48918 a!2804) j!70)))))

(declare-fun b!1523322 () Bool)

(declare-fun res!1042223 () Bool)

(assert (=> b!1523322 (=> (not res!1042223) (not e!849294))))

(declare-fun lt!659920 () SeekEntryResult!13083)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101374 (_ BitVec 32)) SeekEntryResult!13083)

(assert (=> b!1523322 (= res!1042223 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48918 a!2804) j!70) a!2804 mask!2512) lt!659920))))

(declare-fun b!1523323 () Bool)

(declare-fun res!1042226 () Bool)

(assert (=> b!1523323 (=> (not res!1042226) (not e!849293))))

(assert (=> b!1523323 (= res!1042226 (and (= (size!49468 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49468 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49468 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523324 () Bool)

(assert (=> b!1523324 (= e!849293 e!849294)))

(declare-fun res!1042228 () Bool)

(assert (=> b!1523324 (=> (not res!1042228) (not e!849294))))

(declare-fun lt!659918 () SeekEntryResult!13083)

(assert (=> b!1523324 (= res!1042228 (= lt!659918 lt!659920))))

(assert (=> b!1523324 (= lt!659920 (Intermediate!13083 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523324 (= lt!659918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48918 a!2804) j!70) mask!2512) (select (arr!48918 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523320 () Bool)

(declare-fun res!1042221 () Bool)

(assert (=> b!1523320 (=> (not res!1042221) (not e!849294))))

(assert (=> b!1523320 (= res!1042221 (= lt!659918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48918 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48918 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101375 (store (arr!48918 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804)) mask!2512)))))

(declare-fun res!1042225 () Bool)

(assert (=> start!129778 (=> (not res!1042225) (not e!849293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129778 (= res!1042225 (validMask!0 mask!2512))))

(assert (=> start!129778 e!849293))

(assert (=> start!129778 true))

(declare-fun array_inv!37946 (array!101374) Bool)

(assert (=> start!129778 (array_inv!37946 a!2804)))

(assert (= (and start!129778 res!1042225) b!1523323))

(assert (= (and b!1523323 res!1042226) b!1523317))

(assert (= (and b!1523317 res!1042227) b!1523321))

(assert (= (and b!1523321 res!1042222) b!1523318))

(assert (= (and b!1523318 res!1042229) b!1523314))

(assert (= (and b!1523314 res!1042230) b!1523315))

(assert (= (and b!1523315 res!1042231) b!1523324))

(assert (= (and b!1523324 res!1042228) b!1523322))

(assert (= (and b!1523322 res!1042223) b!1523320))

(assert (= (and b!1523320 res!1042221) b!1523319))

(assert (= (and b!1523319 res!1042224) b!1523316))

(declare-fun m!1406421 () Bool)

(assert (=> b!1523322 m!1406421))

(assert (=> b!1523322 m!1406421))

(declare-fun m!1406423 () Bool)

(assert (=> b!1523322 m!1406423))

(declare-fun m!1406425 () Bool)

(assert (=> b!1523318 m!1406425))

(assert (=> b!1523316 m!1406421))

(assert (=> b!1523316 m!1406421))

(declare-fun m!1406427 () Bool)

(assert (=> b!1523316 m!1406427))

(declare-fun m!1406429 () Bool)

(assert (=> b!1523320 m!1406429))

(declare-fun m!1406431 () Bool)

(assert (=> b!1523320 m!1406431))

(assert (=> b!1523320 m!1406431))

(declare-fun m!1406433 () Bool)

(assert (=> b!1523320 m!1406433))

(assert (=> b!1523320 m!1406433))

(assert (=> b!1523320 m!1406431))

(declare-fun m!1406435 () Bool)

(assert (=> b!1523320 m!1406435))

(assert (=> b!1523321 m!1406421))

(assert (=> b!1523321 m!1406421))

(declare-fun m!1406437 () Bool)

(assert (=> b!1523321 m!1406437))

(declare-fun m!1406439 () Bool)

(assert (=> start!129778 m!1406439))

(declare-fun m!1406441 () Bool)

(assert (=> start!129778 m!1406441))

(declare-fun m!1406443 () Bool)

(assert (=> b!1523314 m!1406443))

(assert (=> b!1523324 m!1406421))

(assert (=> b!1523324 m!1406421))

(declare-fun m!1406445 () Bool)

(assert (=> b!1523324 m!1406445))

(assert (=> b!1523324 m!1406445))

(assert (=> b!1523324 m!1406421))

(declare-fun m!1406447 () Bool)

(assert (=> b!1523324 m!1406447))

(declare-fun m!1406449 () Bool)

(assert (=> b!1523319 m!1406449))

(declare-fun m!1406451 () Bool)

(assert (=> b!1523319 m!1406451))

(declare-fun m!1406453 () Bool)

(assert (=> b!1523317 m!1406453))

(assert (=> b!1523317 m!1406453))

(declare-fun m!1406455 () Bool)

(assert (=> b!1523317 m!1406455))

(check-sat (not b!1523314) (not b!1523322) (not b!1523321) (not b!1523318) (not b!1523317) (not b!1523316) (not b!1523324) (not start!129778) (not b!1523320) (not b!1523319))
(check-sat)
