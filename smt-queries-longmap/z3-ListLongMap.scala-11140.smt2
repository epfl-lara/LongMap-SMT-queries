; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130584 () Bool)

(assert start!130584)

(declare-fun b!1530449 () Bool)

(declare-fun e!853150 () Bool)

(declare-fun e!853151 () Bool)

(assert (=> b!1530449 (= e!853150 e!853151)))

(declare-fun res!1046675 () Bool)

(assert (=> b!1530449 (=> res!1046675 e!853151)))

(declare-datatypes ((SeekEntryResult!13112 0))(
  ( (MissingZero!13112 (index!54843 (_ BitVec 32))) (Found!13112 (index!54844 (_ BitVec 32))) (Intermediate!13112 (undefined!13924 Bool) (index!54845 (_ BitVec 32)) (x!136750 (_ BitVec 32))) (Undefined!13112) (MissingVacant!13112 (index!54846 (_ BitVec 32))) )
))
(declare-fun lt!662639 () SeekEntryResult!13112)

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1530449 (= res!1046675 (not (= lt!662639 (Found!13112 j!70))))))

(declare-fun lt!662644 () SeekEntryResult!13112)

(declare-fun lt!662643 () SeekEntryResult!13112)

(assert (=> b!1530449 (= lt!662644 lt!662643)))

(declare-datatypes ((array!101671 0))(
  ( (array!101672 (arr!49054 (Array (_ BitVec 32) (_ BitVec 64))) (size!49605 (_ BitVec 32))) )
))
(declare-fun lt!662640 () array!101671)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!662645 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101671 (_ BitVec 32)) SeekEntryResult!13112)

(assert (=> b!1530449 (= lt!662643 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662645 lt!662640 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101671 (_ BitVec 32)) SeekEntryResult!13112)

(assert (=> b!1530449 (= lt!662644 (seekEntryOrOpen!0 lt!662645 lt!662640 mask!2512))))

(declare-fun lt!662646 () SeekEntryResult!13112)

(assert (=> b!1530449 (= lt!662646 lt!662639)))

(declare-fun a!2804 () array!101671)

(assert (=> b!1530449 (= lt!662639 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49054 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1530449 (= lt!662646 (seekEntryOrOpen!0 (select (arr!49054 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530450 () Bool)

(declare-fun res!1046681 () Bool)

(declare-fun e!853147 () Bool)

(assert (=> b!1530450 (=> (not res!1046681) (not e!853147))))

(declare-fun lt!662642 () SeekEntryResult!13112)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101671 (_ BitVec 32)) SeekEntryResult!13112)

(assert (=> b!1530450 (= res!1046681 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49054 a!2804) j!70) a!2804 mask!2512) lt!662642))))

(declare-fun res!1046671 () Bool)

(declare-fun e!853149 () Bool)

(assert (=> start!130584 (=> (not res!1046671) (not e!853149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130584 (= res!1046671 (validMask!0 mask!2512))))

(assert (=> start!130584 e!853149))

(assert (=> start!130584 true))

(declare-fun array_inv!38335 (array!101671) Bool)

(assert (=> start!130584 (array_inv!38335 a!2804)))

(declare-fun b!1530451 () Bool)

(assert (=> b!1530451 (= e!853151 true)))

(assert (=> b!1530451 (= lt!662643 lt!662639)))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((Unit!51043 0))(
  ( (Unit!51044) )
))
(declare-fun lt!662637 () Unit!51043)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51043)

(assert (=> b!1530451 (= lt!662637 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1530452 () Bool)

(assert (=> b!1530452 (= e!853149 e!853147)))

(declare-fun res!1046679 () Bool)

(assert (=> b!1530452 (=> (not res!1046679) (not e!853147))))

(declare-fun lt!662638 () SeekEntryResult!13112)

(assert (=> b!1530452 (= res!1046679 (= lt!662638 lt!662642))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530452 (= lt!662642 (Intermediate!13112 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530452 (= lt!662638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49054 a!2804) j!70) mask!2512) (select (arr!49054 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530453 () Bool)

(declare-fun res!1046682 () Bool)

(assert (=> b!1530453 (=> (not res!1046682) (not e!853149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101671 (_ BitVec 32)) Bool)

(assert (=> b!1530453 (= res!1046682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530454 () Bool)

(declare-fun res!1046677 () Bool)

(assert (=> b!1530454 (=> (not res!1046677) (not e!853149))))

(assert (=> b!1530454 (= res!1046677 (and (= (size!49605 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49605 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49605 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!853152 () Bool)

(declare-fun b!1530455 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101671 (_ BitVec 32)) SeekEntryResult!13112)

(assert (=> b!1530455 (= e!853152 (= (seekEntry!0 (select (arr!49054 a!2804) j!70) a!2804 mask!2512) (Found!13112 j!70)))))

(declare-fun b!1530456 () Bool)

(declare-fun res!1046680 () Bool)

(assert (=> b!1530456 (=> (not res!1046680) (not e!853149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530456 (= res!1046680 (validKeyInArray!0 (select (arr!49054 a!2804) j!70)))))

(declare-fun b!1530457 () Bool)

(declare-fun res!1046676 () Bool)

(assert (=> b!1530457 (=> (not res!1046676) (not e!853149))))

(assert (=> b!1530457 (= res!1046676 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49605 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49605 a!2804))))))

(declare-fun b!1530458 () Bool)

(declare-fun e!853153 () Bool)

(assert (=> b!1530458 (= e!853147 e!853153)))

(declare-fun res!1046672 () Bool)

(assert (=> b!1530458 (=> (not res!1046672) (not e!853153))))

(assert (=> b!1530458 (= res!1046672 (= lt!662638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662645 mask!2512) lt!662645 lt!662640 mask!2512)))))

(assert (=> b!1530458 (= lt!662645 (select (store (arr!49054 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1530458 (= lt!662640 (array!101672 (store (arr!49054 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804)))))

(declare-fun b!1530459 () Bool)

(assert (=> b!1530459 (= e!853153 (not e!853150))))

(declare-fun res!1046674 () Bool)

(assert (=> b!1530459 (=> res!1046674 e!853150)))

(assert (=> b!1530459 (= res!1046674 (or (not (= (select (arr!49054 a!2804) j!70) lt!662645)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49054 a!2804) index!487) (select (arr!49054 a!2804) j!70)) (not (= (select (arr!49054 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530459 e!853152))

(declare-fun res!1046673 () Bool)

(assert (=> b!1530459 (=> (not res!1046673) (not e!853152))))

(assert (=> b!1530459 (= res!1046673 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!662641 () Unit!51043)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51043)

(assert (=> b!1530459 (= lt!662641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530460 () Bool)

(declare-fun res!1046678 () Bool)

(assert (=> b!1530460 (=> (not res!1046678) (not e!853149))))

(declare-datatypes ((List!35524 0))(
  ( (Nil!35521) (Cons!35520 (h!36974 (_ BitVec 64)) (t!50210 List!35524)) )
))
(declare-fun arrayNoDuplicates!0 (array!101671 (_ BitVec 32) List!35524) Bool)

(assert (=> b!1530460 (= res!1046678 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35521))))

(declare-fun b!1530461 () Bool)

(declare-fun res!1046670 () Bool)

(assert (=> b!1530461 (=> (not res!1046670) (not e!853149))))

(assert (=> b!1530461 (= res!1046670 (validKeyInArray!0 (select (arr!49054 a!2804) i!961)))))

(assert (= (and start!130584 res!1046671) b!1530454))

(assert (= (and b!1530454 res!1046677) b!1530461))

(assert (= (and b!1530461 res!1046670) b!1530456))

(assert (= (and b!1530456 res!1046680) b!1530453))

(assert (= (and b!1530453 res!1046682) b!1530460))

(assert (= (and b!1530460 res!1046678) b!1530457))

(assert (= (and b!1530457 res!1046676) b!1530452))

(assert (= (and b!1530452 res!1046679) b!1530450))

(assert (= (and b!1530450 res!1046681) b!1530458))

(assert (= (and b!1530458 res!1046672) b!1530459))

(assert (= (and b!1530459 res!1046673) b!1530455))

(assert (= (and b!1530459 (not res!1046674)) b!1530449))

(assert (= (and b!1530449 (not res!1046675)) b!1530451))

(declare-fun m!1413067 () Bool)

(assert (=> b!1530458 m!1413067))

(assert (=> b!1530458 m!1413067))

(declare-fun m!1413069 () Bool)

(assert (=> b!1530458 m!1413069))

(declare-fun m!1413071 () Bool)

(assert (=> b!1530458 m!1413071))

(declare-fun m!1413073 () Bool)

(assert (=> b!1530458 m!1413073))

(declare-fun m!1413075 () Bool)

(assert (=> start!130584 m!1413075))

(declare-fun m!1413077 () Bool)

(assert (=> start!130584 m!1413077))

(declare-fun m!1413079 () Bool)

(assert (=> b!1530453 m!1413079))

(declare-fun m!1413081 () Bool)

(assert (=> b!1530461 m!1413081))

(assert (=> b!1530461 m!1413081))

(declare-fun m!1413083 () Bool)

(assert (=> b!1530461 m!1413083))

(declare-fun m!1413085 () Bool)

(assert (=> b!1530460 m!1413085))

(declare-fun m!1413087 () Bool)

(assert (=> b!1530456 m!1413087))

(assert (=> b!1530456 m!1413087))

(declare-fun m!1413089 () Bool)

(assert (=> b!1530456 m!1413089))

(declare-fun m!1413091 () Bool)

(assert (=> b!1530451 m!1413091))

(assert (=> b!1530449 m!1413087))

(declare-fun m!1413093 () Bool)

(assert (=> b!1530449 m!1413093))

(assert (=> b!1530449 m!1413087))

(declare-fun m!1413095 () Bool)

(assert (=> b!1530449 m!1413095))

(declare-fun m!1413097 () Bool)

(assert (=> b!1530449 m!1413097))

(assert (=> b!1530449 m!1413087))

(declare-fun m!1413099 () Bool)

(assert (=> b!1530449 m!1413099))

(assert (=> b!1530450 m!1413087))

(assert (=> b!1530450 m!1413087))

(declare-fun m!1413101 () Bool)

(assert (=> b!1530450 m!1413101))

(assert (=> b!1530452 m!1413087))

(assert (=> b!1530452 m!1413087))

(declare-fun m!1413103 () Bool)

(assert (=> b!1530452 m!1413103))

(assert (=> b!1530452 m!1413103))

(assert (=> b!1530452 m!1413087))

(declare-fun m!1413105 () Bool)

(assert (=> b!1530452 m!1413105))

(assert (=> b!1530455 m!1413087))

(assert (=> b!1530455 m!1413087))

(declare-fun m!1413107 () Bool)

(assert (=> b!1530455 m!1413107))

(assert (=> b!1530459 m!1413087))

(declare-fun m!1413109 () Bool)

(assert (=> b!1530459 m!1413109))

(declare-fun m!1413111 () Bool)

(assert (=> b!1530459 m!1413111))

(declare-fun m!1413113 () Bool)

(assert (=> b!1530459 m!1413113))

(check-sat (not b!1530458) (not b!1530452) (not b!1530460) (not b!1530450) (not start!130584) (not b!1530456) (not b!1530459) (not b!1530449) (not b!1530453) (not b!1530451) (not b!1530455) (not b!1530461))
(check-sat)
