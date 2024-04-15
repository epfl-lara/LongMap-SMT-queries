; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129098 () Bool)

(assert start!129098)

(declare-fun b!1515403 () Bool)

(declare-fun res!1035522 () Bool)

(declare-fun e!845638 () Bool)

(assert (=> b!1515403 (=> (not res!1035522) (not e!845638))))

(declare-datatypes ((array!100954 0))(
  ( (array!100955 (arr!48715 (Array (_ BitVec 32) (_ BitVec 64))) (size!49267 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100954)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100954 (_ BitVec 32)) Bool)

(assert (=> b!1515403 (= res!1035522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515404 () Bool)

(declare-fun e!845634 () Bool)

(declare-fun e!845636 () Bool)

(assert (=> b!1515404 (= e!845634 e!845636)))

(declare-fun res!1035512 () Bool)

(assert (=> b!1515404 (=> (not res!1035512) (not e!845636))))

(declare-fun lt!656814 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12909 0))(
  ( (MissingZero!12909 (index!54031 (_ BitVec 32))) (Found!12909 (index!54032 (_ BitVec 32))) (Intermediate!12909 (undefined!13721 Bool) (index!54033 (_ BitVec 32)) (x!135733 (_ BitVec 32))) (Undefined!12909) (MissingVacant!12909 (index!54034 (_ BitVec 32))) )
))
(declare-fun lt!656811 () SeekEntryResult!12909)

(declare-fun lt!656809 () array!100954)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12909)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515404 (= res!1035512 (= lt!656811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656814 mask!2512) lt!656814 lt!656809 mask!2512)))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515404 (= lt!656814 (select (store (arr!48715 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515404 (= lt!656809 (array!100955 (store (arr!48715 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49267 a!2804)))))

(declare-fun b!1515405 () Bool)

(assert (=> b!1515405 (= e!845638 e!845634)))

(declare-fun res!1035524 () Bool)

(assert (=> b!1515405 (=> (not res!1035524) (not e!845634))))

(declare-fun lt!656812 () SeekEntryResult!12909)

(assert (=> b!1515405 (= res!1035524 (= lt!656811 lt!656812))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515405 (= lt!656812 (Intermediate!12909 false resIndex!21 resX!21))))

(assert (=> b!1515405 (= lt!656811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48715 a!2804) j!70) mask!2512) (select (arr!48715 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515406 () Bool)

(declare-fun res!1035521 () Bool)

(assert (=> b!1515406 (=> (not res!1035521) (not e!845638))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1515406 (= res!1035521 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49267 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49267 a!2804))))))

(declare-fun b!1515407 () Bool)

(declare-fun res!1035514 () Bool)

(assert (=> b!1515407 (=> (not res!1035514) (not e!845638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515407 (= res!1035514 (validKeyInArray!0 (select (arr!48715 a!2804) j!70)))))

(declare-fun b!1515409 () Bool)

(declare-fun e!845640 () Bool)

(declare-fun e!845637 () Bool)

(assert (=> b!1515409 (= e!845640 e!845637)))

(declare-fun res!1035517 () Bool)

(assert (=> b!1515409 (=> res!1035517 e!845637)))

(declare-fun lt!656813 () SeekEntryResult!12909)

(assert (=> b!1515409 (= res!1035517 (not (= lt!656813 (Found!12909 j!70))))))

(declare-fun lt!656810 () SeekEntryResult!12909)

(declare-fun lt!656806 () SeekEntryResult!12909)

(assert (=> b!1515409 (= lt!656810 lt!656806)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12909)

(assert (=> b!1515409 (= lt!656806 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656814 lt!656809 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12909)

(assert (=> b!1515409 (= lt!656810 (seekEntryOrOpen!0 lt!656814 lt!656809 mask!2512))))

(declare-fun lt!656805 () SeekEntryResult!12909)

(assert (=> b!1515409 (= lt!656805 lt!656813)))

(assert (=> b!1515409 (= lt!656813 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48715 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515409 (= lt!656805 (seekEntryOrOpen!0 (select (arr!48715 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515410 () Bool)

(assert (=> b!1515410 (= e!845637 true)))

(assert (=> b!1515410 (= lt!656806 lt!656813)))

(declare-datatypes ((Unit!50525 0))(
  ( (Unit!50526) )
))
(declare-fun lt!656808 () Unit!50525)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50525)

(assert (=> b!1515410 (= lt!656808 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun e!845635 () Bool)

(declare-fun b!1515411 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12909)

(assert (=> b!1515411 (= e!845635 (= (seekEntry!0 (select (arr!48715 a!2804) j!70) a!2804 mask!2512) (Found!12909 j!70)))))

(declare-fun res!1035515 () Bool)

(assert (=> start!129098 (=> (not res!1035515) (not e!845638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129098 (= res!1035515 (validMask!0 mask!2512))))

(assert (=> start!129098 e!845638))

(assert (=> start!129098 true))

(declare-fun array_inv!37948 (array!100954) Bool)

(assert (=> start!129098 (array_inv!37948 a!2804)))

(declare-fun b!1515408 () Bool)

(declare-fun res!1035518 () Bool)

(assert (=> b!1515408 (=> (not res!1035518) (not e!845638))))

(assert (=> b!1515408 (= res!1035518 (validKeyInArray!0 (select (arr!48715 a!2804) i!961)))))

(declare-fun b!1515412 () Bool)

(assert (=> b!1515412 (= e!845636 (not e!845640))))

(declare-fun res!1035516 () Bool)

(assert (=> b!1515412 (=> res!1035516 e!845640)))

(assert (=> b!1515412 (= res!1035516 (or (not (= (select (arr!48715 a!2804) j!70) lt!656814)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48715 a!2804) index!487) (select (arr!48715 a!2804) j!70)) (not (= (select (arr!48715 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515412 e!845635))

(declare-fun res!1035520 () Bool)

(assert (=> b!1515412 (=> (not res!1035520) (not e!845635))))

(assert (=> b!1515412 (= res!1035520 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!656807 () Unit!50525)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50525)

(assert (=> b!1515412 (= lt!656807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515413 () Bool)

(declare-fun res!1035523 () Bool)

(assert (=> b!1515413 (=> (not res!1035523) (not e!845638))))

(declare-datatypes ((List!35276 0))(
  ( (Nil!35273) (Cons!35272 (h!36685 (_ BitVec 64)) (t!49962 List!35276)) )
))
(declare-fun arrayNoDuplicates!0 (array!100954 (_ BitVec 32) List!35276) Bool)

(assert (=> b!1515413 (= res!1035523 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35273))))

(declare-fun b!1515414 () Bool)

(declare-fun res!1035519 () Bool)

(assert (=> b!1515414 (=> (not res!1035519) (not e!845638))))

(assert (=> b!1515414 (= res!1035519 (and (= (size!49267 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49267 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49267 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515415 () Bool)

(declare-fun res!1035513 () Bool)

(assert (=> b!1515415 (=> (not res!1035513) (not e!845634))))

(assert (=> b!1515415 (= res!1035513 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48715 a!2804) j!70) a!2804 mask!2512) lt!656812))))

(assert (= (and start!129098 res!1035515) b!1515414))

(assert (= (and b!1515414 res!1035519) b!1515408))

(assert (= (and b!1515408 res!1035518) b!1515407))

(assert (= (and b!1515407 res!1035514) b!1515403))

(assert (= (and b!1515403 res!1035522) b!1515413))

(assert (= (and b!1515413 res!1035523) b!1515406))

(assert (= (and b!1515406 res!1035521) b!1515405))

(assert (= (and b!1515405 res!1035524) b!1515415))

(assert (= (and b!1515415 res!1035513) b!1515404))

(assert (= (and b!1515404 res!1035512) b!1515412))

(assert (= (and b!1515412 res!1035520) b!1515411))

(assert (= (and b!1515412 (not res!1035516)) b!1515409))

(assert (= (and b!1515409 (not res!1035517)) b!1515410))

(declare-fun m!1398011 () Bool)

(assert (=> b!1515403 m!1398011))

(declare-fun m!1398013 () Bool)

(assert (=> b!1515410 m!1398013))

(declare-fun m!1398015 () Bool)

(assert (=> start!129098 m!1398015))

(declare-fun m!1398017 () Bool)

(assert (=> start!129098 m!1398017))

(declare-fun m!1398019 () Bool)

(assert (=> b!1515409 m!1398019))

(declare-fun m!1398021 () Bool)

(assert (=> b!1515409 m!1398021))

(assert (=> b!1515409 m!1398019))

(declare-fun m!1398023 () Bool)

(assert (=> b!1515409 m!1398023))

(declare-fun m!1398025 () Bool)

(assert (=> b!1515409 m!1398025))

(assert (=> b!1515409 m!1398019))

(declare-fun m!1398027 () Bool)

(assert (=> b!1515409 m!1398027))

(assert (=> b!1515415 m!1398019))

(assert (=> b!1515415 m!1398019))

(declare-fun m!1398029 () Bool)

(assert (=> b!1515415 m!1398029))

(assert (=> b!1515405 m!1398019))

(assert (=> b!1515405 m!1398019))

(declare-fun m!1398031 () Bool)

(assert (=> b!1515405 m!1398031))

(assert (=> b!1515405 m!1398031))

(assert (=> b!1515405 m!1398019))

(declare-fun m!1398033 () Bool)

(assert (=> b!1515405 m!1398033))

(assert (=> b!1515407 m!1398019))

(assert (=> b!1515407 m!1398019))

(declare-fun m!1398035 () Bool)

(assert (=> b!1515407 m!1398035))

(assert (=> b!1515412 m!1398019))

(declare-fun m!1398037 () Bool)

(assert (=> b!1515412 m!1398037))

(declare-fun m!1398039 () Bool)

(assert (=> b!1515412 m!1398039))

(declare-fun m!1398041 () Bool)

(assert (=> b!1515412 m!1398041))

(assert (=> b!1515411 m!1398019))

(assert (=> b!1515411 m!1398019))

(declare-fun m!1398043 () Bool)

(assert (=> b!1515411 m!1398043))

(declare-fun m!1398045 () Bool)

(assert (=> b!1515413 m!1398045))

(declare-fun m!1398047 () Bool)

(assert (=> b!1515408 m!1398047))

(assert (=> b!1515408 m!1398047))

(declare-fun m!1398049 () Bool)

(assert (=> b!1515408 m!1398049))

(declare-fun m!1398051 () Bool)

(assert (=> b!1515404 m!1398051))

(assert (=> b!1515404 m!1398051))

(declare-fun m!1398053 () Bool)

(assert (=> b!1515404 m!1398053))

(declare-fun m!1398055 () Bool)

(assert (=> b!1515404 m!1398055))

(declare-fun m!1398057 () Bool)

(assert (=> b!1515404 m!1398057))

(check-sat (not b!1515411) (not b!1515407) (not b!1515403) (not b!1515405) (not b!1515404) (not start!129098) (not b!1515415) (not b!1515410) (not b!1515409) (not b!1515413) (not b!1515408) (not b!1515412))
(check-sat)
