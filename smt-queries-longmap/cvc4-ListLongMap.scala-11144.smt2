; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130230 () Bool)

(assert start!130230)

(declare-fun b!1528703 () Bool)

(declare-fun res!1046414 () Bool)

(declare-fun e!852025 () Bool)

(assert (=> b!1528703 (=> (not res!1046414) (not e!852025))))

(declare-datatypes ((array!101580 0))(
  ( (array!101581 (arr!49015 (Array (_ BitVec 32) (_ BitVec 64))) (size!49565 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101580)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528703 (= res!1046414 (validKeyInArray!0 (select (arr!49015 a!2804) j!70)))))

(declare-fun b!1528705 () Bool)

(declare-fun e!852026 () Bool)

(assert (=> b!1528705 (= e!852025 e!852026)))

(declare-fun res!1046413 () Bool)

(assert (=> b!1528705 (=> (not res!1046413) (not e!852026))))

(declare-datatypes ((SeekEntryResult!13180 0))(
  ( (MissingZero!13180 (index!55115 (_ BitVec 32))) (Found!13180 (index!55116 (_ BitVec 32))) (Intermediate!13180 (undefined!13992 Bool) (index!55117 (_ BitVec 32)) (x!136803 (_ BitVec 32))) (Undefined!13180) (MissingVacant!13180 (index!55118 (_ BitVec 32))) )
))
(declare-fun lt!662190 () SeekEntryResult!13180)

(declare-fun lt!662191 () SeekEntryResult!13180)

(assert (=> b!1528705 (= res!1046413 (= lt!662190 lt!662191))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528705 (= lt!662191 (Intermediate!13180 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101580 (_ BitVec 32)) SeekEntryResult!13180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528705 (= lt!662190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49015 a!2804) j!70) mask!2512) (select (arr!49015 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!852027 () Bool)

(declare-fun b!1528706 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101580 (_ BitVec 32)) SeekEntryResult!13180)

(assert (=> b!1528706 (= e!852027 (= (seekEntry!0 (select (arr!49015 a!2804) j!70) a!2804 mask!2512) (Found!13180 j!70)))))

(declare-fun b!1528707 () Bool)

(declare-fun e!852028 () Bool)

(assert (=> b!1528707 (= e!852026 e!852028)))

(declare-fun res!1046418 () Bool)

(assert (=> b!1528707 (=> (not res!1046418) (not e!852028))))

(declare-fun lt!662183 () array!101580)

(declare-fun lt!662189 () (_ BitVec 64))

(assert (=> b!1528707 (= res!1046418 (= lt!662190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662189 mask!2512) lt!662189 lt!662183 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528707 (= lt!662189 (select (store (arr!49015 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528707 (= lt!662183 (array!101581 (store (arr!49015 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49565 a!2804)))))

(declare-fun b!1528708 () Bool)

(declare-fun res!1046415 () Bool)

(assert (=> b!1528708 (=> (not res!1046415) (not e!852025))))

(assert (=> b!1528708 (= res!1046415 (validKeyInArray!0 (select (arr!49015 a!2804) i!961)))))

(declare-fun b!1528709 () Bool)

(declare-fun res!1046416 () Bool)

(assert (=> b!1528709 (=> (not res!1046416) (not e!852025))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528709 (= res!1046416 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49565 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49565 a!2804))))))

(declare-fun b!1528710 () Bool)

(declare-fun e!852024 () Bool)

(assert (=> b!1528710 (= e!852028 (not e!852024))))

(declare-fun res!1046412 () Bool)

(assert (=> b!1528710 (=> res!1046412 e!852024)))

(assert (=> b!1528710 (= res!1046412 (or (not (= (select (arr!49015 a!2804) j!70) lt!662189)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49015 a!2804) index!487) (select (arr!49015 a!2804) j!70)) (not (= (select (arr!49015 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1528710 e!852027))

(declare-fun res!1046417 () Bool)

(assert (=> b!1528710 (=> (not res!1046417) (not e!852027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101580 (_ BitVec 32)) Bool)

(assert (=> b!1528710 (= res!1046417 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51144 0))(
  ( (Unit!51145) )
))
(declare-fun lt!662187 () Unit!51144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51144)

(assert (=> b!1528710 (= lt!662187 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528711 () Bool)

(declare-fun res!1046411 () Bool)

(assert (=> b!1528711 (=> (not res!1046411) (not e!852026))))

(assert (=> b!1528711 (= res!1046411 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49015 a!2804) j!70) a!2804 mask!2512) lt!662191))))

(declare-fun res!1046410 () Bool)

(assert (=> start!130230 (=> (not res!1046410) (not e!852025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130230 (= res!1046410 (validMask!0 mask!2512))))

(assert (=> start!130230 e!852025))

(assert (=> start!130230 true))

(declare-fun array_inv!38043 (array!101580) Bool)

(assert (=> start!130230 (array_inv!38043 a!2804)))

(declare-fun b!1528704 () Bool)

(declare-fun res!1046422 () Bool)

(assert (=> b!1528704 (=> (not res!1046422) (not e!852025))))

(declare-datatypes ((List!35498 0))(
  ( (Nil!35495) (Cons!35494 (h!36930 (_ BitVec 64)) (t!50192 List!35498)) )
))
(declare-fun arrayNoDuplicates!0 (array!101580 (_ BitVec 32) List!35498) Bool)

(assert (=> b!1528704 (= res!1046422 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35495))))

(declare-fun b!1528712 () Bool)

(declare-fun res!1046421 () Bool)

(assert (=> b!1528712 (=> (not res!1046421) (not e!852025))))

(assert (=> b!1528712 (= res!1046421 (and (= (size!49565 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49565 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49565 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528713 () Bool)

(declare-fun res!1046420 () Bool)

(assert (=> b!1528713 (=> (not res!1046420) (not e!852025))))

(assert (=> b!1528713 (= res!1046420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528714 () Bool)

(declare-fun e!852023 () Bool)

(declare-fun lt!662185 () SeekEntryResult!13180)

(declare-fun lt!662186 () SeekEntryResult!13180)

(assert (=> b!1528714 (= e!852023 (= lt!662185 lt!662186))))

(declare-fun lt!662184 () SeekEntryResult!13180)

(declare-fun lt!662188 () SeekEntryResult!13180)

(assert (=> b!1528714 (= lt!662184 lt!662188)))

(declare-fun lt!662182 () Unit!51144)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51144)

(assert (=> b!1528714 (= lt!662182 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528715 () Bool)

(assert (=> b!1528715 (= e!852024 e!852023)))

(declare-fun res!1046419 () Bool)

(assert (=> b!1528715 (=> res!1046419 e!852023)))

(assert (=> b!1528715 (= res!1046419 (not (= lt!662188 (Found!13180 j!70))))))

(assert (=> b!1528715 (= lt!662186 lt!662184)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101580 (_ BitVec 32)) SeekEntryResult!13180)

(assert (=> b!1528715 (= lt!662184 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662189 lt!662183 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101580 (_ BitVec 32)) SeekEntryResult!13180)

(assert (=> b!1528715 (= lt!662186 (seekEntryOrOpen!0 lt!662189 lt!662183 mask!2512))))

(assert (=> b!1528715 (= lt!662185 lt!662188)))

(assert (=> b!1528715 (= lt!662188 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49015 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528715 (= lt!662185 (seekEntryOrOpen!0 (select (arr!49015 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130230 res!1046410) b!1528712))

(assert (= (and b!1528712 res!1046421) b!1528708))

(assert (= (and b!1528708 res!1046415) b!1528703))

(assert (= (and b!1528703 res!1046414) b!1528713))

(assert (= (and b!1528713 res!1046420) b!1528704))

(assert (= (and b!1528704 res!1046422) b!1528709))

(assert (= (and b!1528709 res!1046416) b!1528705))

(assert (= (and b!1528705 res!1046413) b!1528711))

(assert (= (and b!1528711 res!1046411) b!1528707))

(assert (= (and b!1528707 res!1046418) b!1528710))

(assert (= (and b!1528710 res!1046417) b!1528706))

(assert (= (and b!1528710 (not res!1046412)) b!1528715))

(assert (= (and b!1528715 (not res!1046419)) b!1528714))

(declare-fun m!1411599 () Bool)

(assert (=> b!1528714 m!1411599))

(declare-fun m!1411601 () Bool)

(assert (=> start!130230 m!1411601))

(declare-fun m!1411603 () Bool)

(assert (=> start!130230 m!1411603))

(declare-fun m!1411605 () Bool)

(assert (=> b!1528704 m!1411605))

(declare-fun m!1411607 () Bool)

(assert (=> b!1528715 m!1411607))

(assert (=> b!1528715 m!1411607))

(declare-fun m!1411609 () Bool)

(assert (=> b!1528715 m!1411609))

(declare-fun m!1411611 () Bool)

(assert (=> b!1528715 m!1411611))

(assert (=> b!1528715 m!1411607))

(declare-fun m!1411613 () Bool)

(assert (=> b!1528715 m!1411613))

(declare-fun m!1411615 () Bool)

(assert (=> b!1528715 m!1411615))

(assert (=> b!1528706 m!1411607))

(assert (=> b!1528706 m!1411607))

(declare-fun m!1411617 () Bool)

(assert (=> b!1528706 m!1411617))

(assert (=> b!1528705 m!1411607))

(assert (=> b!1528705 m!1411607))

(declare-fun m!1411619 () Bool)

(assert (=> b!1528705 m!1411619))

(assert (=> b!1528705 m!1411619))

(assert (=> b!1528705 m!1411607))

(declare-fun m!1411621 () Bool)

(assert (=> b!1528705 m!1411621))

(declare-fun m!1411623 () Bool)

(assert (=> b!1528713 m!1411623))

(assert (=> b!1528710 m!1411607))

(declare-fun m!1411625 () Bool)

(assert (=> b!1528710 m!1411625))

(declare-fun m!1411627 () Bool)

(assert (=> b!1528710 m!1411627))

(declare-fun m!1411629 () Bool)

(assert (=> b!1528710 m!1411629))

(declare-fun m!1411631 () Bool)

(assert (=> b!1528708 m!1411631))

(assert (=> b!1528708 m!1411631))

(declare-fun m!1411633 () Bool)

(assert (=> b!1528708 m!1411633))

(assert (=> b!1528711 m!1411607))

(assert (=> b!1528711 m!1411607))

(declare-fun m!1411635 () Bool)

(assert (=> b!1528711 m!1411635))

(assert (=> b!1528703 m!1411607))

(assert (=> b!1528703 m!1411607))

(declare-fun m!1411637 () Bool)

(assert (=> b!1528703 m!1411637))

(declare-fun m!1411639 () Bool)

(assert (=> b!1528707 m!1411639))

(assert (=> b!1528707 m!1411639))

(declare-fun m!1411641 () Bool)

(assert (=> b!1528707 m!1411641))

(declare-fun m!1411643 () Bool)

(assert (=> b!1528707 m!1411643))

(declare-fun m!1411645 () Bool)

(assert (=> b!1528707 m!1411645))

(push 1)

