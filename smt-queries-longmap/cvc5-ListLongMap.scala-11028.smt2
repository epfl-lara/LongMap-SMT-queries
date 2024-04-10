; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129000 () Bool)

(assert start!129000)

(declare-fun b!1512665 () Bool)

(declare-fun res!1032573 () Bool)

(declare-fun e!844297 () Bool)

(assert (=> b!1512665 (=> (not res!1032573) (not e!844297))))

(declare-datatypes ((array!100856 0))(
  ( (array!100857 (arr!48665 (Array (_ BitVec 32) (_ BitVec 64))) (size!49215 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100856)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512665 (= res!1032573 (validKeyInArray!0 (select (arr!48665 a!2804) i!961)))))

(declare-fun b!1512666 () Bool)

(declare-fun res!1032569 () Bool)

(declare-fun e!844300 () Bool)

(assert (=> b!1512666 (=> (not res!1032569) (not e!844300))))

(declare-datatypes ((SeekEntryResult!12836 0))(
  ( (MissingZero!12836 (index!53739 (_ BitVec 32))) (Found!12836 (index!53740 (_ BitVec 32))) (Intermediate!12836 (undefined!13648 Bool) (index!53741 (_ BitVec 32)) (x!135466 (_ BitVec 32))) (Undefined!12836) (MissingVacant!12836 (index!53742 (_ BitVec 32))) )
))
(declare-fun lt!655727 () SeekEntryResult!12836)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100856 (_ BitVec 32)) SeekEntryResult!12836)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512666 (= res!1032569 (= lt!655727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48665 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48665 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100857 (store (arr!48665 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49215 a!2804)) mask!2512)))))

(declare-fun b!1512667 () Bool)

(declare-fun e!844296 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100856 (_ BitVec 32)) SeekEntryResult!12836)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100856 (_ BitVec 32)) SeekEntryResult!12836)

(assert (=> b!1512667 (= e!844296 (= (seekEntryOrOpen!0 (select (arr!48665 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48665 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512668 () Bool)

(declare-fun e!844298 () Bool)

(assert (=> b!1512668 (= e!844298 e!844296)))

(declare-fun res!1032574 () Bool)

(assert (=> b!1512668 (=> res!1032574 e!844296)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512668 (= res!1032574 (or (not (= (select (arr!48665 a!2804) j!70) (select (store (arr!48665 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48665 a!2804) index!487) (select (arr!48665 a!2804) j!70)) (not (= (select (arr!48665 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1032576 () Bool)

(assert (=> start!129000 (=> (not res!1032576) (not e!844297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129000 (= res!1032576 (validMask!0 mask!2512))))

(assert (=> start!129000 e!844297))

(assert (=> start!129000 true))

(declare-fun array_inv!37693 (array!100856) Bool)

(assert (=> start!129000 (array_inv!37693 a!2804)))

(declare-fun b!1512669 () Bool)

(declare-fun res!1032571 () Bool)

(assert (=> b!1512669 (=> (not res!1032571) (not e!844300))))

(declare-fun lt!655728 () SeekEntryResult!12836)

(assert (=> b!1512669 (= res!1032571 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48665 a!2804) j!70) a!2804 mask!2512) lt!655728))))

(declare-fun b!1512670 () Bool)

(declare-fun res!1032580 () Bool)

(assert (=> b!1512670 (=> (not res!1032580) (not e!844297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100856 (_ BitVec 32)) Bool)

(assert (=> b!1512670 (= res!1032580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512671 () Bool)

(declare-fun res!1032578 () Bool)

(assert (=> b!1512671 (=> (not res!1032578) (not e!844297))))

(assert (=> b!1512671 (= res!1032578 (validKeyInArray!0 (select (arr!48665 a!2804) j!70)))))

(declare-fun b!1512672 () Bool)

(declare-fun res!1032577 () Bool)

(assert (=> b!1512672 (=> (not res!1032577) (not e!844297))))

(assert (=> b!1512672 (= res!1032577 (and (= (size!49215 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49215 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49215 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512673 () Bool)

(declare-fun res!1032570 () Bool)

(assert (=> b!1512673 (=> (not res!1032570) (not e!844297))))

(assert (=> b!1512673 (= res!1032570 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49215 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49215 a!2804))))))

(declare-fun b!1512674 () Bool)

(declare-fun res!1032575 () Bool)

(assert (=> b!1512674 (=> (not res!1032575) (not e!844297))))

(declare-datatypes ((List!35148 0))(
  ( (Nil!35145) (Cons!35144 (h!36556 (_ BitVec 64)) (t!49842 List!35148)) )
))
(declare-fun arrayNoDuplicates!0 (array!100856 (_ BitVec 32) List!35148) Bool)

(assert (=> b!1512674 (= res!1032575 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35145))))

(declare-fun b!1512675 () Bool)

(declare-fun res!1032572 () Bool)

(assert (=> b!1512675 (=> (not res!1032572) (not e!844298))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100856 (_ BitVec 32)) SeekEntryResult!12836)

(assert (=> b!1512675 (= res!1032572 (= (seekEntry!0 (select (arr!48665 a!2804) j!70) a!2804 mask!2512) (Found!12836 j!70)))))

(declare-fun b!1512676 () Bool)

(assert (=> b!1512676 (= e!844300 (not true))))

(assert (=> b!1512676 e!844298))

(declare-fun res!1032579 () Bool)

(assert (=> b!1512676 (=> (not res!1032579) (not e!844298))))

(assert (=> b!1512676 (= res!1032579 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50540 0))(
  ( (Unit!50541) )
))
(declare-fun lt!655729 () Unit!50540)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50540)

(assert (=> b!1512676 (= lt!655729 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512677 () Bool)

(assert (=> b!1512677 (= e!844297 e!844300)))

(declare-fun res!1032568 () Bool)

(assert (=> b!1512677 (=> (not res!1032568) (not e!844300))))

(assert (=> b!1512677 (= res!1032568 (= lt!655727 lt!655728))))

(assert (=> b!1512677 (= lt!655728 (Intermediate!12836 false resIndex!21 resX!21))))

(assert (=> b!1512677 (= lt!655727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48665 a!2804) j!70) mask!2512) (select (arr!48665 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129000 res!1032576) b!1512672))

(assert (= (and b!1512672 res!1032577) b!1512665))

(assert (= (and b!1512665 res!1032573) b!1512671))

(assert (= (and b!1512671 res!1032578) b!1512670))

(assert (= (and b!1512670 res!1032580) b!1512674))

(assert (= (and b!1512674 res!1032575) b!1512673))

(assert (= (and b!1512673 res!1032570) b!1512677))

(assert (= (and b!1512677 res!1032568) b!1512669))

(assert (= (and b!1512669 res!1032571) b!1512666))

(assert (= (and b!1512666 res!1032569) b!1512676))

(assert (= (and b!1512676 res!1032579) b!1512675))

(assert (= (and b!1512675 res!1032572) b!1512668))

(assert (= (and b!1512668 (not res!1032574)) b!1512667))

(declare-fun m!1395451 () Bool)

(assert (=> b!1512668 m!1395451))

(declare-fun m!1395453 () Bool)

(assert (=> b!1512668 m!1395453))

(declare-fun m!1395455 () Bool)

(assert (=> b!1512668 m!1395455))

(declare-fun m!1395457 () Bool)

(assert (=> b!1512668 m!1395457))

(assert (=> b!1512667 m!1395451))

(assert (=> b!1512667 m!1395451))

(declare-fun m!1395459 () Bool)

(assert (=> b!1512667 m!1395459))

(assert (=> b!1512667 m!1395451))

(declare-fun m!1395461 () Bool)

(assert (=> b!1512667 m!1395461))

(declare-fun m!1395463 () Bool)

(assert (=> b!1512674 m!1395463))

(declare-fun m!1395465 () Bool)

(assert (=> b!1512670 m!1395465))

(declare-fun m!1395467 () Bool)

(assert (=> b!1512676 m!1395467))

(declare-fun m!1395469 () Bool)

(assert (=> b!1512676 m!1395469))

(declare-fun m!1395471 () Bool)

(assert (=> b!1512665 m!1395471))

(assert (=> b!1512665 m!1395471))

(declare-fun m!1395473 () Bool)

(assert (=> b!1512665 m!1395473))

(assert (=> b!1512677 m!1395451))

(assert (=> b!1512677 m!1395451))

(declare-fun m!1395475 () Bool)

(assert (=> b!1512677 m!1395475))

(assert (=> b!1512677 m!1395475))

(assert (=> b!1512677 m!1395451))

(declare-fun m!1395477 () Bool)

(assert (=> b!1512677 m!1395477))

(assert (=> b!1512675 m!1395451))

(assert (=> b!1512675 m!1395451))

(declare-fun m!1395479 () Bool)

(assert (=> b!1512675 m!1395479))

(assert (=> b!1512666 m!1395453))

(assert (=> b!1512666 m!1395455))

(assert (=> b!1512666 m!1395455))

(declare-fun m!1395481 () Bool)

(assert (=> b!1512666 m!1395481))

(assert (=> b!1512666 m!1395481))

(assert (=> b!1512666 m!1395455))

(declare-fun m!1395483 () Bool)

(assert (=> b!1512666 m!1395483))

(assert (=> b!1512671 m!1395451))

(assert (=> b!1512671 m!1395451))

(declare-fun m!1395485 () Bool)

(assert (=> b!1512671 m!1395485))

(declare-fun m!1395487 () Bool)

(assert (=> start!129000 m!1395487))

(declare-fun m!1395489 () Bool)

(assert (=> start!129000 m!1395489))

(assert (=> b!1512669 m!1395451))

(assert (=> b!1512669 m!1395451))

(declare-fun m!1395491 () Bool)

(assert (=> b!1512669 m!1395491))

(push 1)

