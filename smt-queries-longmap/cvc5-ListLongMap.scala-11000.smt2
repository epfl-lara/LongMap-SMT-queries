; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128832 () Bool)

(assert start!128832)

(declare-fun b!1509709 () Bool)

(declare-fun res!1029618 () Bool)

(declare-fun e!843187 () Bool)

(assert (=> b!1509709 (=> (not res!1029618) (not e!843187))))

(declare-datatypes ((array!100688 0))(
  ( (array!100689 (arr!48581 (Array (_ BitVec 32) (_ BitVec 64))) (size!49131 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100688)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509709 (= res!1029618 (validKeyInArray!0 (select (arr!48581 a!2804) j!70)))))

(declare-fun b!1509710 () Bool)

(declare-fun res!1029621 () Bool)

(assert (=> b!1509710 (=> (not res!1029621) (not e!843187))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100688 (_ BitVec 32)) Bool)

(assert (=> b!1509710 (= res!1029621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509711 () Bool)

(declare-fun res!1029614 () Bool)

(declare-fun e!843189 () Bool)

(assert (=> b!1509711 (=> (not res!1029614) (not e!843189))))

(declare-datatypes ((SeekEntryResult!12752 0))(
  ( (MissingZero!12752 (index!53403 (_ BitVec 32))) (Found!12752 (index!53404 (_ BitVec 32))) (Intermediate!12752 (undefined!13564 Bool) (index!53405 (_ BitVec 32)) (x!135158 (_ BitVec 32))) (Undefined!12752) (MissingVacant!12752 (index!53406 (_ BitVec 32))) )
))
(declare-fun lt!654972 () SeekEntryResult!12752)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100688 (_ BitVec 32)) SeekEntryResult!12752)

(assert (=> b!1509711 (= res!1029614 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48581 a!2804) j!70) a!2804 mask!2512) lt!654972))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun b!1509712 () Bool)

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509712 (= e!843189 (not (or (not (= (select (arr!48581 a!2804) j!70) (select (store (arr!48581 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48581 a!2804) index!487) (select (arr!48581 a!2804) j!70))) (not (= j!70 index!487)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!843190 () Bool)

(assert (=> b!1509712 e!843190))

(declare-fun res!1029620 () Bool)

(assert (=> b!1509712 (=> (not res!1029620) (not e!843190))))

(assert (=> b!1509712 (= res!1029620 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50372 0))(
  ( (Unit!50373) )
))
(declare-fun lt!654971 () Unit!50372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50372)

(assert (=> b!1509712 (= lt!654971 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509713 () Bool)

(declare-fun res!1029619 () Bool)

(assert (=> b!1509713 (=> (not res!1029619) (not e!843187))))

(declare-datatypes ((List!35064 0))(
  ( (Nil!35061) (Cons!35060 (h!36472 (_ BitVec 64)) (t!49758 List!35064)) )
))
(declare-fun arrayNoDuplicates!0 (array!100688 (_ BitVec 32) List!35064) Bool)

(assert (=> b!1509713 (= res!1029619 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35061))))

(declare-fun b!1509714 () Bool)

(declare-fun res!1029617 () Bool)

(assert (=> b!1509714 (=> (not res!1029617) (not e!843187))))

(assert (=> b!1509714 (= res!1029617 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49131 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49131 a!2804))))))

(declare-fun b!1509715 () Bool)

(declare-fun res!1029613 () Bool)

(assert (=> b!1509715 (=> (not res!1029613) (not e!843189))))

(declare-fun lt!654973 () SeekEntryResult!12752)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509715 (= res!1029613 (= lt!654973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48581 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48581 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100689 (store (arr!48581 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49131 a!2804)) mask!2512)))))

(declare-fun b!1509716 () Bool)

(declare-fun res!1029616 () Bool)

(assert (=> b!1509716 (=> (not res!1029616) (not e!843187))))

(assert (=> b!1509716 (= res!1029616 (and (= (size!49131 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49131 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49131 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509717 () Bool)

(declare-fun res!1029615 () Bool)

(assert (=> b!1509717 (=> (not res!1029615) (not e!843187))))

(assert (=> b!1509717 (= res!1029615 (validKeyInArray!0 (select (arr!48581 a!2804) i!961)))))

(declare-fun b!1509718 () Bool)

(assert (=> b!1509718 (= e!843187 e!843189)))

(declare-fun res!1029612 () Bool)

(assert (=> b!1509718 (=> (not res!1029612) (not e!843189))))

(assert (=> b!1509718 (= res!1029612 (= lt!654973 lt!654972))))

(assert (=> b!1509718 (= lt!654972 (Intermediate!12752 false resIndex!21 resX!21))))

(assert (=> b!1509718 (= lt!654973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48581 a!2804) j!70) mask!2512) (select (arr!48581 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509719 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100688 (_ BitVec 32)) SeekEntryResult!12752)

(assert (=> b!1509719 (= e!843190 (= (seekEntry!0 (select (arr!48581 a!2804) j!70) a!2804 mask!2512) (Found!12752 j!70)))))

(declare-fun res!1029622 () Bool)

(assert (=> start!128832 (=> (not res!1029622) (not e!843187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128832 (= res!1029622 (validMask!0 mask!2512))))

(assert (=> start!128832 e!843187))

(assert (=> start!128832 true))

(declare-fun array_inv!37609 (array!100688) Bool)

(assert (=> start!128832 (array_inv!37609 a!2804)))

(assert (= (and start!128832 res!1029622) b!1509716))

(assert (= (and b!1509716 res!1029616) b!1509717))

(assert (= (and b!1509717 res!1029615) b!1509709))

(assert (= (and b!1509709 res!1029618) b!1509710))

(assert (= (and b!1509710 res!1029621) b!1509713))

(assert (= (and b!1509713 res!1029619) b!1509714))

(assert (= (and b!1509714 res!1029617) b!1509718))

(assert (= (and b!1509718 res!1029612) b!1509711))

(assert (= (and b!1509711 res!1029614) b!1509715))

(assert (= (and b!1509715 res!1029613) b!1509712))

(assert (= (and b!1509712 res!1029620) b!1509719))

(declare-fun m!1392217 () Bool)

(assert (=> b!1509718 m!1392217))

(assert (=> b!1509718 m!1392217))

(declare-fun m!1392219 () Bool)

(assert (=> b!1509718 m!1392219))

(assert (=> b!1509718 m!1392219))

(assert (=> b!1509718 m!1392217))

(declare-fun m!1392221 () Bool)

(assert (=> b!1509718 m!1392221))

(assert (=> b!1509712 m!1392217))

(declare-fun m!1392223 () Bool)

(assert (=> b!1509712 m!1392223))

(declare-fun m!1392225 () Bool)

(assert (=> b!1509712 m!1392225))

(declare-fun m!1392227 () Bool)

(assert (=> b!1509712 m!1392227))

(declare-fun m!1392229 () Bool)

(assert (=> b!1509712 m!1392229))

(declare-fun m!1392231 () Bool)

(assert (=> b!1509712 m!1392231))

(assert (=> b!1509709 m!1392217))

(assert (=> b!1509709 m!1392217))

(declare-fun m!1392233 () Bool)

(assert (=> b!1509709 m!1392233))

(declare-fun m!1392235 () Bool)

(assert (=> b!1509710 m!1392235))

(declare-fun m!1392237 () Bool)

(assert (=> start!128832 m!1392237))

(declare-fun m!1392239 () Bool)

(assert (=> start!128832 m!1392239))

(assert (=> b!1509715 m!1392225))

(assert (=> b!1509715 m!1392229))

(assert (=> b!1509715 m!1392229))

(declare-fun m!1392241 () Bool)

(assert (=> b!1509715 m!1392241))

(assert (=> b!1509715 m!1392241))

(assert (=> b!1509715 m!1392229))

(declare-fun m!1392243 () Bool)

(assert (=> b!1509715 m!1392243))

(assert (=> b!1509719 m!1392217))

(assert (=> b!1509719 m!1392217))

(declare-fun m!1392245 () Bool)

(assert (=> b!1509719 m!1392245))

(assert (=> b!1509711 m!1392217))

(assert (=> b!1509711 m!1392217))

(declare-fun m!1392247 () Bool)

(assert (=> b!1509711 m!1392247))

(declare-fun m!1392249 () Bool)

(assert (=> b!1509713 m!1392249))

(declare-fun m!1392251 () Bool)

(assert (=> b!1509717 m!1392251))

(assert (=> b!1509717 m!1392251))

(declare-fun m!1392253 () Bool)

(assert (=> b!1509717 m!1392253))

(push 1)

(assert (not b!1509715))

(assert (not b!1509709))

(assert (not b!1509718))

(assert (not b!1509713))

(assert (not b!1509719))

(assert (not b!1509710))

(assert (not start!128832))

(assert (not b!1509712))

(assert (not b!1509711))

(assert (not b!1509717))

(check-sat)

(pop 1)

(push 1)

(check-sat)

