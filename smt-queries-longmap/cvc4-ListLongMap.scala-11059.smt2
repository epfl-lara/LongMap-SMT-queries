; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129190 () Bool)

(assert start!129190)

(declare-fun b!1516460 () Bool)

(declare-fun res!1036364 () Bool)

(declare-fun e!846164 () Bool)

(assert (=> b!1516460 (=> (not res!1036364) (not e!846164))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12931 0))(
  ( (MissingZero!12931 (index!54119 (_ BitVec 32))) (Found!12931 (index!54120 (_ BitVec 32))) (Intermediate!12931 (undefined!13743 Bool) (index!54121 (_ BitVec 32)) (x!135809 (_ BitVec 32))) (Undefined!12931) (MissingVacant!12931 (index!54122 (_ BitVec 32))) )
))
(declare-fun lt!657412 () SeekEntryResult!12931)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101046 0))(
  ( (array!101047 (arr!48760 (Array (_ BitVec 32) (_ BitVec 64))) (size!49310 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101046)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101046 (_ BitVec 32)) SeekEntryResult!12931)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516460 (= res!1036364 (= lt!657412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48760 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48760 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101047 (store (arr!48760 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49310 a!2804)) mask!2512)))))

(declare-fun b!1516461 () Bool)

(declare-fun res!1036370 () Bool)

(assert (=> b!1516461 (=> (not res!1036370) (not e!846164))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657408 () SeekEntryResult!12931)

(assert (=> b!1516461 (= res!1036370 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48760 a!2804) j!70) a!2804 mask!2512) lt!657408))))

(declare-fun b!1516462 () Bool)

(declare-fun res!1036373 () Bool)

(declare-fun e!846162 () Bool)

(assert (=> b!1516462 (=> (not res!1036373) (not e!846162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516462 (= res!1036373 (validKeyInArray!0 (select (arr!48760 a!2804) j!70)))))

(declare-fun b!1516463 () Bool)

(declare-fun res!1036371 () Bool)

(assert (=> b!1516463 (=> (not res!1036371) (not e!846162))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516463 (= res!1036371 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49310 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49310 a!2804))))))

(declare-fun b!1516464 () Bool)

(declare-fun res!1036375 () Bool)

(assert (=> b!1516464 (=> (not res!1036375) (not e!846162))))

(declare-datatypes ((List!35243 0))(
  ( (Nil!35240) (Cons!35239 (h!36651 (_ BitVec 64)) (t!49937 List!35243)) )
))
(declare-fun arrayNoDuplicates!0 (array!101046 (_ BitVec 32) List!35243) Bool)

(assert (=> b!1516464 (= res!1036375 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35240))))

(declare-fun b!1516465 () Bool)

(declare-fun res!1036372 () Bool)

(assert (=> b!1516465 (=> (not res!1036372) (not e!846162))))

(assert (=> b!1516465 (= res!1036372 (and (= (size!49310 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49310 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49310 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516466 () Bool)

(declare-fun res!1036367 () Bool)

(assert (=> b!1516466 (=> (not res!1036367) (not e!846162))))

(assert (=> b!1516466 (= res!1036367 (validKeyInArray!0 (select (arr!48760 a!2804) i!961)))))

(declare-fun b!1516468 () Bool)

(declare-fun e!846166 () Bool)

(declare-fun e!846163 () Bool)

(assert (=> b!1516468 (= e!846166 e!846163)))

(declare-fun res!1036363 () Bool)

(assert (=> b!1516468 (=> res!1036363 e!846163)))

(declare-fun lt!657411 () (_ BitVec 32))

(assert (=> b!1516468 (= res!1036363 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657411 #b00000000000000000000000000000000) (bvsge lt!657411 (size!49310 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516468 (= lt!657411 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516469 () Bool)

(declare-fun e!846165 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101046 (_ BitVec 32)) SeekEntryResult!12931)

(assert (=> b!1516469 (= e!846165 (= (seekEntry!0 (select (arr!48760 a!2804) j!70) a!2804 mask!2512) (Found!12931 j!70)))))

(declare-fun b!1516470 () Bool)

(assert (=> b!1516470 (= e!846162 e!846164)))

(declare-fun res!1036366 () Bool)

(assert (=> b!1516470 (=> (not res!1036366) (not e!846164))))

(assert (=> b!1516470 (= res!1036366 (= lt!657412 lt!657408))))

(assert (=> b!1516470 (= lt!657408 (Intermediate!12931 false resIndex!21 resX!21))))

(assert (=> b!1516470 (= lt!657412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48760 a!2804) j!70) mask!2512) (select (arr!48760 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516471 () Bool)

(assert (=> b!1516471 (= e!846164 (not e!846166))))

(declare-fun res!1036369 () Bool)

(assert (=> b!1516471 (=> res!1036369 e!846166)))

(assert (=> b!1516471 (= res!1036369 (or (not (= (select (arr!48760 a!2804) j!70) (select (store (arr!48760 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1516471 e!846165))

(declare-fun res!1036365 () Bool)

(assert (=> b!1516471 (=> (not res!1036365) (not e!846165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101046 (_ BitVec 32)) Bool)

(assert (=> b!1516471 (= res!1036365 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50730 0))(
  ( (Unit!50731) )
))
(declare-fun lt!657409 () Unit!50730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50730)

(assert (=> b!1516471 (= lt!657409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516472 () Bool)

(declare-fun res!1036374 () Bool)

(assert (=> b!1516472 (=> (not res!1036374) (not e!846162))))

(assert (=> b!1516472 (= res!1036374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1036368 () Bool)

(assert (=> start!129190 (=> (not res!1036368) (not e!846162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129190 (= res!1036368 (validMask!0 mask!2512))))

(assert (=> start!129190 e!846162))

(assert (=> start!129190 true))

(declare-fun array_inv!37788 (array!101046) Bool)

(assert (=> start!129190 (array_inv!37788 a!2804)))

(declare-fun b!1516467 () Bool)

(assert (=> b!1516467 (= e!846163 true)))

(declare-fun lt!657410 () SeekEntryResult!12931)

(assert (=> b!1516467 (= lt!657410 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657411 (select (arr!48760 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129190 res!1036368) b!1516465))

(assert (= (and b!1516465 res!1036372) b!1516466))

(assert (= (and b!1516466 res!1036367) b!1516462))

(assert (= (and b!1516462 res!1036373) b!1516472))

(assert (= (and b!1516472 res!1036374) b!1516464))

(assert (= (and b!1516464 res!1036375) b!1516463))

(assert (= (and b!1516463 res!1036371) b!1516470))

(assert (= (and b!1516470 res!1036366) b!1516461))

(assert (= (and b!1516461 res!1036370) b!1516460))

(assert (= (and b!1516460 res!1036364) b!1516471))

(assert (= (and b!1516471 res!1036365) b!1516469))

(assert (= (and b!1516471 (not res!1036369)) b!1516468))

(assert (= (and b!1516468 (not res!1036363)) b!1516467))

(declare-fun m!1399725 () Bool)

(assert (=> b!1516462 m!1399725))

(assert (=> b!1516462 m!1399725))

(declare-fun m!1399727 () Bool)

(assert (=> b!1516462 m!1399727))

(assert (=> b!1516461 m!1399725))

(assert (=> b!1516461 m!1399725))

(declare-fun m!1399729 () Bool)

(assert (=> b!1516461 m!1399729))

(assert (=> b!1516470 m!1399725))

(assert (=> b!1516470 m!1399725))

(declare-fun m!1399731 () Bool)

(assert (=> b!1516470 m!1399731))

(assert (=> b!1516470 m!1399731))

(assert (=> b!1516470 m!1399725))

(declare-fun m!1399733 () Bool)

(assert (=> b!1516470 m!1399733))

(declare-fun m!1399735 () Bool)

(assert (=> b!1516466 m!1399735))

(assert (=> b!1516466 m!1399735))

(declare-fun m!1399737 () Bool)

(assert (=> b!1516466 m!1399737))

(assert (=> b!1516467 m!1399725))

(assert (=> b!1516467 m!1399725))

(declare-fun m!1399739 () Bool)

(assert (=> b!1516467 m!1399739))

(declare-fun m!1399741 () Bool)

(assert (=> b!1516468 m!1399741))

(assert (=> b!1516471 m!1399725))

(declare-fun m!1399743 () Bool)

(assert (=> b!1516471 m!1399743))

(declare-fun m!1399745 () Bool)

(assert (=> b!1516471 m!1399745))

(declare-fun m!1399747 () Bool)

(assert (=> b!1516471 m!1399747))

(declare-fun m!1399749 () Bool)

(assert (=> b!1516471 m!1399749))

(assert (=> b!1516469 m!1399725))

(assert (=> b!1516469 m!1399725))

(declare-fun m!1399751 () Bool)

(assert (=> b!1516469 m!1399751))

(declare-fun m!1399753 () Bool)

(assert (=> b!1516464 m!1399753))

(declare-fun m!1399755 () Bool)

(assert (=> start!129190 m!1399755))

(declare-fun m!1399757 () Bool)

(assert (=> start!129190 m!1399757))

(declare-fun m!1399759 () Bool)

(assert (=> b!1516472 m!1399759))

(assert (=> b!1516460 m!1399745))

(assert (=> b!1516460 m!1399747))

(assert (=> b!1516460 m!1399747))

(declare-fun m!1399761 () Bool)

(assert (=> b!1516460 m!1399761))

(assert (=> b!1516460 m!1399761))

(assert (=> b!1516460 m!1399747))

(declare-fun m!1399763 () Bool)

(assert (=> b!1516460 m!1399763))

(push 1)

(assert (not start!129190))

