; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129784 () Bool)

(assert start!129784)

(declare-fun b!1523413 () Bool)

(declare-fun res!1042320 () Bool)

(declare-fun e!849329 () Bool)

(assert (=> b!1523413 (=> (not res!1042320) (not e!849329))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101380 0))(
  ( (array!101381 (arr!48921 (Array (_ BitVec 32) (_ BitVec 64))) (size!49471 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101380)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13086 0))(
  ( (MissingZero!13086 (index!54739 (_ BitVec 32))) (Found!13086 (index!54740 (_ BitVec 32))) (Intermediate!13086 (undefined!13898 Bool) (index!54741 (_ BitVec 32)) (x!136428 (_ BitVec 32))) (Undefined!13086) (MissingVacant!13086 (index!54742 (_ BitVec 32))) )
))
(declare-fun lt!659945 () SeekEntryResult!13086)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101380 (_ BitVec 32)) SeekEntryResult!13086)

(assert (=> b!1523413 (= res!1042320 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48921 a!2804) j!70) a!2804 mask!2512) lt!659945))))

(declare-fun e!849331 () Bool)

(declare-fun b!1523414 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101380 (_ BitVec 32)) SeekEntryResult!13086)

(assert (=> b!1523414 (= e!849331 (= (seekEntry!0 (select (arr!48921 a!2804) j!70) a!2804 mask!2512) (Found!13086 j!70)))))

(declare-fun b!1523415 () Bool)

(declare-fun res!1042325 () Bool)

(declare-fun e!849330 () Bool)

(assert (=> b!1523415 (=> (not res!1042325) (not e!849330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101380 (_ BitVec 32)) Bool)

(assert (=> b!1523415 (= res!1042325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523416 () Bool)

(declare-fun res!1042329 () Bool)

(assert (=> b!1523416 (=> (not res!1042329) (not e!849330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523416 (= res!1042329 (validKeyInArray!0 (select (arr!48921 a!2804) j!70)))))

(declare-fun res!1042323 () Bool)

(assert (=> start!129784 (=> (not res!1042323) (not e!849330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129784 (= res!1042323 (validMask!0 mask!2512))))

(assert (=> start!129784 e!849330))

(assert (=> start!129784 true))

(declare-fun array_inv!37949 (array!101380) Bool)

(assert (=> start!129784 (array_inv!37949 a!2804)))

(declare-fun b!1523417 () Bool)

(declare-fun res!1042328 () Bool)

(assert (=> b!1523417 (=> (not res!1042328) (not e!849330))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523417 (= res!1042328 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49471 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49471 a!2804))))))

(declare-fun b!1523418 () Bool)

(declare-fun res!1042322 () Bool)

(assert (=> b!1523418 (=> (not res!1042322) (not e!849330))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523418 (= res!1042322 (validKeyInArray!0 (select (arr!48921 a!2804) i!961)))))

(declare-fun b!1523419 () Bool)

(assert (=> b!1523419 (= e!849329 (not true))))

(assert (=> b!1523419 e!849331))

(declare-fun res!1042324 () Bool)

(assert (=> b!1523419 (=> (not res!1042324) (not e!849331))))

(assert (=> b!1523419 (= res!1042324 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50956 0))(
  ( (Unit!50957) )
))
(declare-fun lt!659946 () Unit!50956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50956)

(assert (=> b!1523419 (= lt!659946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523420 () Bool)

(declare-fun res!1042321 () Bool)

(assert (=> b!1523420 (=> (not res!1042321) (not e!849330))))

(assert (=> b!1523420 (= res!1042321 (and (= (size!49471 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49471 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49471 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523421 () Bool)

(assert (=> b!1523421 (= e!849330 e!849329)))

(declare-fun res!1042327 () Bool)

(assert (=> b!1523421 (=> (not res!1042327) (not e!849329))))

(declare-fun lt!659947 () SeekEntryResult!13086)

(assert (=> b!1523421 (= res!1042327 (= lt!659947 lt!659945))))

(assert (=> b!1523421 (= lt!659945 (Intermediate!13086 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523421 (= lt!659947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48921 a!2804) j!70) mask!2512) (select (arr!48921 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523422 () Bool)

(declare-fun res!1042326 () Bool)

(assert (=> b!1523422 (=> (not res!1042326) (not e!849329))))

(assert (=> b!1523422 (= res!1042326 (= lt!659947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48921 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48921 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101381 (store (arr!48921 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49471 a!2804)) mask!2512)))))

(declare-fun b!1523423 () Bool)

(declare-fun res!1042330 () Bool)

(assert (=> b!1523423 (=> (not res!1042330) (not e!849330))))

(declare-datatypes ((List!35404 0))(
  ( (Nil!35401) (Cons!35400 (h!36824 (_ BitVec 64)) (t!50098 List!35404)) )
))
(declare-fun arrayNoDuplicates!0 (array!101380 (_ BitVec 32) List!35404) Bool)

(assert (=> b!1523423 (= res!1042330 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35401))))

(assert (= (and start!129784 res!1042323) b!1523420))

(assert (= (and b!1523420 res!1042321) b!1523418))

(assert (= (and b!1523418 res!1042322) b!1523416))

(assert (= (and b!1523416 res!1042329) b!1523415))

(assert (= (and b!1523415 res!1042325) b!1523423))

(assert (= (and b!1523423 res!1042330) b!1523417))

(assert (= (and b!1523417 res!1042328) b!1523421))

(assert (= (and b!1523421 res!1042327) b!1523413))

(assert (= (and b!1523413 res!1042320) b!1523422))

(assert (= (and b!1523422 res!1042326) b!1523419))

(assert (= (and b!1523419 res!1042324) b!1523414))

(declare-fun m!1406529 () Bool)

(assert (=> b!1523421 m!1406529))

(assert (=> b!1523421 m!1406529))

(declare-fun m!1406531 () Bool)

(assert (=> b!1523421 m!1406531))

(assert (=> b!1523421 m!1406531))

(assert (=> b!1523421 m!1406529))

(declare-fun m!1406533 () Bool)

(assert (=> b!1523421 m!1406533))

(declare-fun m!1406535 () Bool)

(assert (=> b!1523418 m!1406535))

(assert (=> b!1523418 m!1406535))

(declare-fun m!1406537 () Bool)

(assert (=> b!1523418 m!1406537))

(declare-fun m!1406539 () Bool)

(assert (=> start!129784 m!1406539))

(declare-fun m!1406541 () Bool)

(assert (=> start!129784 m!1406541))

(assert (=> b!1523413 m!1406529))

(assert (=> b!1523413 m!1406529))

(declare-fun m!1406543 () Bool)

(assert (=> b!1523413 m!1406543))

(declare-fun m!1406545 () Bool)

(assert (=> b!1523423 m!1406545))

(declare-fun m!1406547 () Bool)

(assert (=> b!1523419 m!1406547))

(declare-fun m!1406549 () Bool)

(assert (=> b!1523419 m!1406549))

(assert (=> b!1523416 m!1406529))

(assert (=> b!1523416 m!1406529))

(declare-fun m!1406551 () Bool)

(assert (=> b!1523416 m!1406551))

(assert (=> b!1523414 m!1406529))

(assert (=> b!1523414 m!1406529))

(declare-fun m!1406553 () Bool)

(assert (=> b!1523414 m!1406553))

(declare-fun m!1406555 () Bool)

(assert (=> b!1523415 m!1406555))

(declare-fun m!1406557 () Bool)

(assert (=> b!1523422 m!1406557))

(declare-fun m!1406559 () Bool)

(assert (=> b!1523422 m!1406559))

(assert (=> b!1523422 m!1406559))

(declare-fun m!1406561 () Bool)

(assert (=> b!1523422 m!1406561))

(assert (=> b!1523422 m!1406561))

(assert (=> b!1523422 m!1406559))

(declare-fun m!1406563 () Bool)

(assert (=> b!1523422 m!1406563))

(check-sat (not b!1523418) (not b!1523414) (not b!1523413) (not b!1523415) (not b!1523421) (not b!1523419) (not b!1523423) (not b!1523422) (not b!1523416) (not start!129784))
(check-sat)
