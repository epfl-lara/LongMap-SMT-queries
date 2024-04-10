; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130444 () Bool)

(assert start!130444)

(declare-fun b!1530960 () Bool)

(declare-fun res!1048302 () Bool)

(declare-fun e!853079 () Bool)

(assert (=> b!1530960 (=> (not res!1048302) (not e!853079))))

(declare-datatypes ((array!101680 0))(
  ( (array!101681 (arr!49062 (Array (_ BitVec 32) (_ BitVec 64))) (size!49612 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101680)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530960 (= res!1048302 (validKeyInArray!0 (select (arr!49062 a!2804) j!70)))))

(declare-fun b!1530961 () Bool)

(declare-fun e!853080 () Bool)

(assert (=> b!1530961 (= e!853079 e!853080)))

(declare-fun res!1048311 () Bool)

(assert (=> b!1530961 (=> (not res!1048311) (not e!853080))))

(declare-datatypes ((SeekEntryResult!13227 0))(
  ( (MissingZero!13227 (index!55303 (_ BitVec 32))) (Found!13227 (index!55304 (_ BitVec 32))) (Intermediate!13227 (undefined!14039 Bool) (index!55305 (_ BitVec 32)) (x!136996 (_ BitVec 32))) (Undefined!13227) (MissingVacant!13227 (index!55306 (_ BitVec 32))) )
))
(declare-fun lt!663040 () SeekEntryResult!13227)

(declare-fun lt!663042 () SeekEntryResult!13227)

(assert (=> b!1530961 (= res!1048311 (= lt!663040 lt!663042))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530961 (= lt!663042 (Intermediate!13227 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101680 (_ BitVec 32)) SeekEntryResult!13227)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530961 (= lt!663040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49062 a!2804) j!70) mask!2512) (select (arr!49062 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530962 () Bool)

(declare-fun e!853081 () Bool)

(assert (=> b!1530962 (= e!853081 true)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!663043 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530962 (= lt!663043 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun e!853077 () Bool)

(declare-fun b!1530963 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101680 (_ BitVec 32)) SeekEntryResult!13227)

(assert (=> b!1530963 (= e!853077 (= (seekEntry!0 (select (arr!49062 a!2804) j!70) a!2804 mask!2512) (Found!13227 j!70)))))

(declare-fun b!1530964 () Bool)

(declare-fun res!1048306 () Bool)

(assert (=> b!1530964 (=> (not res!1048306) (not e!853080))))

(assert (=> b!1530964 (= res!1048306 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49062 a!2804) j!70) a!2804 mask!2512) lt!663042))))

(declare-fun b!1530965 () Bool)

(declare-fun res!1048312 () Bool)

(assert (=> b!1530965 (=> (not res!1048312) (not e!853079))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1530965 (= res!1048312 (validKeyInArray!0 (select (arr!49062 a!2804) i!961)))))

(declare-fun b!1530967 () Bool)

(declare-fun res!1048301 () Bool)

(assert (=> b!1530967 (=> (not res!1048301) (not e!853079))))

(assert (=> b!1530967 (= res!1048301 (and (= (size!49612 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49612 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49612 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530968 () Bool)

(assert (=> b!1530968 (= e!853080 (not e!853081))))

(declare-fun res!1048310 () Bool)

(assert (=> b!1530968 (=> res!1048310 e!853081)))

(assert (=> b!1530968 (= res!1048310 (or (not (= (select (arr!49062 a!2804) j!70) (select (store (arr!49062 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530968 e!853077))

(declare-fun res!1048303 () Bool)

(assert (=> b!1530968 (=> (not res!1048303) (not e!853077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101680 (_ BitVec 32)) Bool)

(assert (=> b!1530968 (= res!1048303 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51238 0))(
  ( (Unit!51239) )
))
(declare-fun lt!663041 () Unit!51238)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51238)

(assert (=> b!1530968 (= lt!663041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530969 () Bool)

(declare-fun res!1048305 () Bool)

(assert (=> b!1530969 (=> (not res!1048305) (not e!853079))))

(declare-datatypes ((List!35545 0))(
  ( (Nil!35542) (Cons!35541 (h!36983 (_ BitVec 64)) (t!50239 List!35545)) )
))
(declare-fun arrayNoDuplicates!0 (array!101680 (_ BitVec 32) List!35545) Bool)

(assert (=> b!1530969 (= res!1048305 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35542))))

(declare-fun res!1048308 () Bool)

(assert (=> start!130444 (=> (not res!1048308) (not e!853079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130444 (= res!1048308 (validMask!0 mask!2512))))

(assert (=> start!130444 e!853079))

(assert (=> start!130444 true))

(declare-fun array_inv!38090 (array!101680) Bool)

(assert (=> start!130444 (array_inv!38090 a!2804)))

(declare-fun b!1530966 () Bool)

(declare-fun res!1048304 () Bool)

(assert (=> b!1530966 (=> (not res!1048304) (not e!853079))))

(assert (=> b!1530966 (= res!1048304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530970 () Bool)

(declare-fun res!1048307 () Bool)

(assert (=> b!1530970 (=> (not res!1048307) (not e!853080))))

(assert (=> b!1530970 (= res!1048307 (= lt!663040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49062 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49062 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101681 (store (arr!49062 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49612 a!2804)) mask!2512)))))

(declare-fun b!1530971 () Bool)

(declare-fun res!1048309 () Bool)

(assert (=> b!1530971 (=> (not res!1048309) (not e!853079))))

(assert (=> b!1530971 (= res!1048309 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49612 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49612 a!2804))))))

(assert (= (and start!130444 res!1048308) b!1530967))

(assert (= (and b!1530967 res!1048301) b!1530965))

(assert (= (and b!1530965 res!1048312) b!1530960))

(assert (= (and b!1530960 res!1048302) b!1530966))

(assert (= (and b!1530966 res!1048304) b!1530969))

(assert (= (and b!1530969 res!1048305) b!1530971))

(assert (= (and b!1530971 res!1048309) b!1530961))

(assert (= (and b!1530961 res!1048311) b!1530964))

(assert (= (and b!1530964 res!1048306) b!1530970))

(assert (= (and b!1530970 res!1048307) b!1530968))

(assert (= (and b!1530968 res!1048303) b!1530963))

(assert (= (and b!1530968 (not res!1048310)) b!1530962))

(declare-fun m!1413731 () Bool)

(assert (=> b!1530961 m!1413731))

(assert (=> b!1530961 m!1413731))

(declare-fun m!1413733 () Bool)

(assert (=> b!1530961 m!1413733))

(assert (=> b!1530961 m!1413733))

(assert (=> b!1530961 m!1413731))

(declare-fun m!1413735 () Bool)

(assert (=> b!1530961 m!1413735))

(assert (=> b!1530963 m!1413731))

(assert (=> b!1530963 m!1413731))

(declare-fun m!1413737 () Bool)

(assert (=> b!1530963 m!1413737))

(declare-fun m!1413739 () Bool)

(assert (=> b!1530962 m!1413739))

(declare-fun m!1413741 () Bool)

(assert (=> b!1530970 m!1413741))

(declare-fun m!1413743 () Bool)

(assert (=> b!1530970 m!1413743))

(assert (=> b!1530970 m!1413743))

(declare-fun m!1413745 () Bool)

(assert (=> b!1530970 m!1413745))

(assert (=> b!1530970 m!1413745))

(assert (=> b!1530970 m!1413743))

(declare-fun m!1413747 () Bool)

(assert (=> b!1530970 m!1413747))

(assert (=> b!1530960 m!1413731))

(assert (=> b!1530960 m!1413731))

(declare-fun m!1413749 () Bool)

(assert (=> b!1530960 m!1413749))

(declare-fun m!1413751 () Bool)

(assert (=> b!1530969 m!1413751))

(declare-fun m!1413753 () Bool)

(assert (=> b!1530965 m!1413753))

(assert (=> b!1530965 m!1413753))

(declare-fun m!1413755 () Bool)

(assert (=> b!1530965 m!1413755))

(assert (=> b!1530968 m!1413731))

(declare-fun m!1413757 () Bool)

(assert (=> b!1530968 m!1413757))

(assert (=> b!1530968 m!1413741))

(assert (=> b!1530968 m!1413743))

(declare-fun m!1413759 () Bool)

(assert (=> b!1530968 m!1413759))

(declare-fun m!1413761 () Bool)

(assert (=> start!130444 m!1413761))

(declare-fun m!1413763 () Bool)

(assert (=> start!130444 m!1413763))

(assert (=> b!1530964 m!1413731))

(assert (=> b!1530964 m!1413731))

(declare-fun m!1413765 () Bool)

(assert (=> b!1530964 m!1413765))

(declare-fun m!1413767 () Bool)

(assert (=> b!1530966 m!1413767))

(check-sat (not b!1530965) (not b!1530963) (not b!1530970) (not b!1530969) (not b!1530966) (not b!1530964) (not b!1530960) (not b!1530962) (not b!1530961) (not start!130444) (not b!1530968))
(check-sat)
