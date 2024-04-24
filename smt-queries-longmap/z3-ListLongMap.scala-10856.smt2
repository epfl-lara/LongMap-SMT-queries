; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127392 () Bool)

(assert start!127392)

(declare-fun b!1495796 () Bool)

(declare-fun res!1017118 () Bool)

(declare-fun e!837981 () Bool)

(assert (=> b!1495796 (=> (not res!1017118) (not e!837981))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99877 0))(
  ( (array!99878 (arr!48202 (Array (_ BitVec 32) (_ BitVec 64))) (size!48753 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99877)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1495796 (= res!1017118 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48753 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48753 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48753 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!837980 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1495797 () Bool)

(assert (=> b!1495797 (= e!837980 (or (= (select (arr!48202 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48202 a!2862) intermediateBeforeIndex!19) (select (arr!48202 a!2862) j!93))))))

(declare-fun b!1495798 () Bool)

(declare-fun e!837978 () Bool)

(declare-fun e!837982 () Bool)

(assert (=> b!1495798 (= e!837978 e!837982)))

(declare-fun res!1017120 () Bool)

(assert (=> b!1495798 (=> (not res!1017120) (not e!837982))))

(declare-datatypes ((SeekEntryResult!12339 0))(
  ( (MissingZero!12339 (index!51748 (_ BitVec 32))) (Found!12339 (index!51749 (_ BitVec 32))) (Intermediate!12339 (undefined!13151 Bool) (index!51750 (_ BitVec 32)) (x!133532 (_ BitVec 32))) (Undefined!12339) (MissingVacant!12339 (index!51751 (_ BitVec 32))) )
))
(declare-fun lt!651881 () SeekEntryResult!12339)

(assert (=> b!1495798 (= res!1017120 (= lt!651881 (Intermediate!12339 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651878 () array!99877)

(declare-fun lt!651880 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99877 (_ BitVec 32)) SeekEntryResult!12339)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495798 (= lt!651881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651880 mask!2687) lt!651880 lt!651878 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1495798 (= lt!651880 (select (store (arr!48202 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495799 () Bool)

(declare-fun res!1017119 () Bool)

(assert (=> b!1495799 (=> (not res!1017119) (not e!837980))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99877 (_ BitVec 32)) SeekEntryResult!12339)

(assert (=> b!1495799 (= res!1017119 (= (seekEntryOrOpen!0 (select (arr!48202 a!2862) j!93) a!2862 mask!2687) (Found!12339 j!93)))))

(declare-fun e!837977 () Bool)

(declare-fun b!1495800 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99877 (_ BitVec 32)) SeekEntryResult!12339)

(assert (=> b!1495800 (= e!837977 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651880 lt!651878 mask!2687) (seekEntryOrOpen!0 lt!651880 lt!651878 mask!2687)))))

(declare-fun b!1495801 () Bool)

(assert (=> b!1495801 (= e!837977 (= lt!651881 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651880 lt!651878 mask!2687)))))

(declare-fun b!1495802 () Bool)

(declare-fun e!837979 () Bool)

(assert (=> b!1495802 (= e!837979 true)))

(declare-fun lt!651882 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495802 (= lt!651882 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1495803 () Bool)

(declare-fun res!1017112 () Bool)

(assert (=> b!1495803 (=> (not res!1017112) (not e!837982))))

(assert (=> b!1495803 (= res!1017112 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495805 () Bool)

(declare-fun e!837983 () Bool)

(assert (=> b!1495805 (= e!837981 e!837983)))

(declare-fun res!1017113 () Bool)

(assert (=> b!1495805 (=> (not res!1017113) (not e!837983))))

(assert (=> b!1495805 (= res!1017113 (= (select (store (arr!48202 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495805 (= lt!651878 (array!99878 (store (arr!48202 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48753 a!2862)))))

(declare-fun b!1495806 () Bool)

(declare-fun res!1017125 () Bool)

(assert (=> b!1495806 (=> (not res!1017125) (not e!837982))))

(assert (=> b!1495806 (= res!1017125 e!837977)))

(declare-fun c!138883 () Bool)

(assert (=> b!1495806 (= c!138883 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495807 () Bool)

(declare-fun res!1017116 () Bool)

(assert (=> b!1495807 (=> (not res!1017116) (not e!837981))))

(declare-datatypes ((List!34690 0))(
  ( (Nil!34687) (Cons!34686 (h!36089 (_ BitVec 64)) (t!49376 List!34690)) )
))
(declare-fun arrayNoDuplicates!0 (array!99877 (_ BitVec 32) List!34690) Bool)

(assert (=> b!1495807 (= res!1017116 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34687))))

(declare-fun b!1495808 () Bool)

(assert (=> b!1495808 (= e!837983 e!837978)))

(declare-fun res!1017111 () Bool)

(assert (=> b!1495808 (=> (not res!1017111) (not e!837978))))

(declare-fun lt!651883 () SeekEntryResult!12339)

(assert (=> b!1495808 (= res!1017111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48202 a!2862) j!93) mask!2687) (select (arr!48202 a!2862) j!93) a!2862 mask!2687) lt!651883))))

(assert (=> b!1495808 (= lt!651883 (Intermediate!12339 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495809 () Bool)

(declare-fun res!1017115 () Bool)

(assert (=> b!1495809 (=> (not res!1017115) (not e!837981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495809 (= res!1017115 (validKeyInArray!0 (select (arr!48202 a!2862) j!93)))))

(declare-fun b!1495810 () Bool)

(declare-fun res!1017124 () Bool)

(assert (=> b!1495810 (=> (not res!1017124) (not e!837981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99877 (_ BitVec 32)) Bool)

(assert (=> b!1495810 (= res!1017124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495811 () Bool)

(declare-fun res!1017114 () Bool)

(assert (=> b!1495811 (=> (not res!1017114) (not e!837978))))

(assert (=> b!1495811 (= res!1017114 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48202 a!2862) j!93) a!2862 mask!2687) lt!651883))))

(declare-fun b!1495812 () Bool)

(declare-fun res!1017123 () Bool)

(assert (=> b!1495812 (=> (not res!1017123) (not e!837981))))

(assert (=> b!1495812 (= res!1017123 (validKeyInArray!0 (select (arr!48202 a!2862) i!1006)))))

(declare-fun b!1495813 () Bool)

(assert (=> b!1495813 (= e!837982 (not e!837979))))

(declare-fun res!1017110 () Bool)

(assert (=> b!1495813 (=> res!1017110 e!837979)))

(assert (=> b!1495813 (= res!1017110 (or (and (= (select (arr!48202 a!2862) index!646) (select (store (arr!48202 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48202 a!2862) index!646) (select (arr!48202 a!2862) j!93))) (= (select (arr!48202 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495813 e!837980))

(declare-fun res!1017117 () Bool)

(assert (=> b!1495813 (=> (not res!1017117) (not e!837980))))

(assert (=> b!1495813 (= res!1017117 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50051 0))(
  ( (Unit!50052) )
))
(declare-fun lt!651879 () Unit!50051)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99877 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50051)

(assert (=> b!1495813 (= lt!651879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495804 () Bool)

(declare-fun res!1017122 () Bool)

(assert (=> b!1495804 (=> (not res!1017122) (not e!837981))))

(assert (=> b!1495804 (= res!1017122 (and (= (size!48753 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48753 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48753 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1017121 () Bool)

(assert (=> start!127392 (=> (not res!1017121) (not e!837981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127392 (= res!1017121 (validMask!0 mask!2687))))

(assert (=> start!127392 e!837981))

(assert (=> start!127392 true))

(declare-fun array_inv!37483 (array!99877) Bool)

(assert (=> start!127392 (array_inv!37483 a!2862)))

(assert (= (and start!127392 res!1017121) b!1495804))

(assert (= (and b!1495804 res!1017122) b!1495812))

(assert (= (and b!1495812 res!1017123) b!1495809))

(assert (= (and b!1495809 res!1017115) b!1495810))

(assert (= (and b!1495810 res!1017124) b!1495807))

(assert (= (and b!1495807 res!1017116) b!1495796))

(assert (= (and b!1495796 res!1017118) b!1495805))

(assert (= (and b!1495805 res!1017113) b!1495808))

(assert (= (and b!1495808 res!1017111) b!1495811))

(assert (= (and b!1495811 res!1017114) b!1495798))

(assert (= (and b!1495798 res!1017120) b!1495806))

(assert (= (and b!1495806 c!138883) b!1495801))

(assert (= (and b!1495806 (not c!138883)) b!1495800))

(assert (= (and b!1495806 res!1017125) b!1495803))

(assert (= (and b!1495803 res!1017112) b!1495813))

(assert (= (and b!1495813 res!1017117) b!1495799))

(assert (= (and b!1495799 res!1017119) b!1495797))

(assert (= (and b!1495813 (not res!1017110)) b!1495802))

(declare-fun m!1379563 () Bool)

(assert (=> b!1495812 m!1379563))

(assert (=> b!1495812 m!1379563))

(declare-fun m!1379565 () Bool)

(assert (=> b!1495812 m!1379565))

(declare-fun m!1379567 () Bool)

(assert (=> b!1495800 m!1379567))

(declare-fun m!1379569 () Bool)

(assert (=> b!1495800 m!1379569))

(declare-fun m!1379571 () Bool)

(assert (=> b!1495807 m!1379571))

(declare-fun m!1379573 () Bool)

(assert (=> b!1495798 m!1379573))

(assert (=> b!1495798 m!1379573))

(declare-fun m!1379575 () Bool)

(assert (=> b!1495798 m!1379575))

(declare-fun m!1379577 () Bool)

(assert (=> b!1495798 m!1379577))

(declare-fun m!1379579 () Bool)

(assert (=> b!1495798 m!1379579))

(declare-fun m!1379581 () Bool)

(assert (=> b!1495808 m!1379581))

(assert (=> b!1495808 m!1379581))

(declare-fun m!1379583 () Bool)

(assert (=> b!1495808 m!1379583))

(assert (=> b!1495808 m!1379583))

(assert (=> b!1495808 m!1379581))

(declare-fun m!1379585 () Bool)

(assert (=> b!1495808 m!1379585))

(declare-fun m!1379587 () Bool)

(assert (=> b!1495813 m!1379587))

(assert (=> b!1495813 m!1379577))

(declare-fun m!1379589 () Bool)

(assert (=> b!1495813 m!1379589))

(declare-fun m!1379591 () Bool)

(assert (=> b!1495813 m!1379591))

(declare-fun m!1379593 () Bool)

(assert (=> b!1495813 m!1379593))

(assert (=> b!1495813 m!1379581))

(assert (=> b!1495805 m!1379577))

(declare-fun m!1379595 () Bool)

(assert (=> b!1495805 m!1379595))

(assert (=> b!1495799 m!1379581))

(assert (=> b!1495799 m!1379581))

(declare-fun m!1379597 () Bool)

(assert (=> b!1495799 m!1379597))

(declare-fun m!1379599 () Bool)

(assert (=> b!1495797 m!1379599))

(assert (=> b!1495797 m!1379581))

(assert (=> b!1495809 m!1379581))

(assert (=> b!1495809 m!1379581))

(declare-fun m!1379601 () Bool)

(assert (=> b!1495809 m!1379601))

(declare-fun m!1379603 () Bool)

(assert (=> b!1495801 m!1379603))

(assert (=> b!1495811 m!1379581))

(assert (=> b!1495811 m!1379581))

(declare-fun m!1379605 () Bool)

(assert (=> b!1495811 m!1379605))

(declare-fun m!1379607 () Bool)

(assert (=> b!1495810 m!1379607))

(declare-fun m!1379609 () Bool)

(assert (=> start!127392 m!1379609))

(declare-fun m!1379611 () Bool)

(assert (=> start!127392 m!1379611))

(declare-fun m!1379613 () Bool)

(assert (=> b!1495802 m!1379613))

(check-sat (not b!1495802) (not b!1495813) (not b!1495807) (not start!127392) (not b!1495810) (not b!1495808) (not b!1495812) (not b!1495801) (not b!1495809) (not b!1495798) (not b!1495800) (not b!1495811) (not b!1495799))
(check-sat)
