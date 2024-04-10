; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128790 () Bool)

(assert start!128790)

(declare-fun b!1509093 () Bool)

(declare-fun res!1028998 () Bool)

(declare-fun e!842989 () Bool)

(assert (=> b!1509093 (=> (not res!1028998) (not e!842989))))

(declare-datatypes ((array!100646 0))(
  ( (array!100647 (arr!48560 (Array (_ BitVec 32) (_ BitVec 64))) (size!49110 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100646)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509093 (= res!1028998 (validKeyInArray!0 (select (arr!48560 a!2804) j!70)))))

(declare-fun b!1509094 () Bool)

(declare-fun res!1028997 () Bool)

(assert (=> b!1509094 (=> (not res!1028997) (not e!842989))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100646 (_ BitVec 32)) Bool)

(assert (=> b!1509094 (= res!1028997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509095 () Bool)

(declare-fun res!1029004 () Bool)

(assert (=> b!1509095 (=> (not res!1029004) (not e!842989))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509095 (= res!1029004 (and (= (size!49110 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49110 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49110 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509096 () Bool)

(declare-fun res!1029002 () Bool)

(assert (=> b!1509096 (=> (not res!1029002) (not e!842989))))

(declare-datatypes ((List!35043 0))(
  ( (Nil!35040) (Cons!35039 (h!36451 (_ BitVec 64)) (t!49737 List!35043)) )
))
(declare-fun arrayNoDuplicates!0 (array!100646 (_ BitVec 32) List!35043) Bool)

(assert (=> b!1509096 (= res!1029002 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35040))))

(declare-fun b!1509097 () Bool)

(declare-fun res!1029001 () Bool)

(declare-fun e!842988 () Bool)

(assert (=> b!1509097 (=> (not res!1029001) (not e!842988))))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12731 0))(
  ( (MissingZero!12731 (index!53319 (_ BitVec 32))) (Found!12731 (index!53320 (_ BitVec 32))) (Intermediate!12731 (undefined!13543 Bool) (index!53321 (_ BitVec 32)) (x!135081 (_ BitVec 32))) (Undefined!12731) (MissingVacant!12731 (index!53322 (_ BitVec 32))) )
))
(declare-fun lt!654808 () SeekEntryResult!12731)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100646 (_ BitVec 32)) SeekEntryResult!12731)

(assert (=> b!1509097 (= res!1029001 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48560 a!2804) j!70) a!2804 mask!2512) lt!654808))))

(declare-fun b!1509098 () Bool)

(assert (=> b!1509098 (= e!842989 e!842988)))

(declare-fun res!1028996 () Bool)

(assert (=> b!1509098 (=> (not res!1028996) (not e!842988))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509098 (= res!1028996 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48560 a!2804) j!70) mask!2512) (select (arr!48560 a!2804) j!70) a!2804 mask!2512) lt!654808))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509098 (= lt!654808 (Intermediate!12731 false resIndex!21 resX!21))))

(declare-fun b!1509099 () Bool)

(declare-fun res!1029000 () Bool)

(assert (=> b!1509099 (=> (not res!1029000) (not e!842989))))

(assert (=> b!1509099 (= res!1029000 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49110 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49110 a!2804))))))

(declare-fun res!1028999 () Bool)

(assert (=> start!128790 (=> (not res!1028999) (not e!842989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128790 (= res!1028999 (validMask!0 mask!2512))))

(assert (=> start!128790 e!842989))

(assert (=> start!128790 true))

(declare-fun array_inv!37588 (array!100646) Bool)

(assert (=> start!128790 (array_inv!37588 a!2804)))

(declare-fun b!1509100 () Bool)

(declare-fun res!1029003 () Bool)

(assert (=> b!1509100 (=> (not res!1029003) (not e!842989))))

(assert (=> b!1509100 (= res!1029003 (validKeyInArray!0 (select (arr!48560 a!2804) i!961)))))

(declare-fun b!1509101 () Bool)

(assert (=> b!1509101 (= e!842988 false)))

(declare-fun lt!654807 () SeekEntryResult!12731)

(assert (=> b!1509101 (= lt!654807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48560 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48560 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100647 (store (arr!48560 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49110 a!2804)) mask!2512))))

(assert (= (and start!128790 res!1028999) b!1509095))

(assert (= (and b!1509095 res!1029004) b!1509100))

(assert (= (and b!1509100 res!1029003) b!1509093))

(assert (= (and b!1509093 res!1028998) b!1509094))

(assert (= (and b!1509094 res!1028997) b!1509096))

(assert (= (and b!1509096 res!1029002) b!1509099))

(assert (= (and b!1509099 res!1029000) b!1509098))

(assert (= (and b!1509098 res!1028996) b!1509097))

(assert (= (and b!1509097 res!1029001) b!1509101))

(declare-fun m!1391533 () Bool)

(assert (=> b!1509093 m!1391533))

(assert (=> b!1509093 m!1391533))

(declare-fun m!1391535 () Bool)

(assert (=> b!1509093 m!1391535))

(declare-fun m!1391537 () Bool)

(assert (=> b!1509094 m!1391537))

(declare-fun m!1391539 () Bool)

(assert (=> start!128790 m!1391539))

(declare-fun m!1391541 () Bool)

(assert (=> start!128790 m!1391541))

(assert (=> b!1509097 m!1391533))

(assert (=> b!1509097 m!1391533))

(declare-fun m!1391543 () Bool)

(assert (=> b!1509097 m!1391543))

(declare-fun m!1391545 () Bool)

(assert (=> b!1509100 m!1391545))

(assert (=> b!1509100 m!1391545))

(declare-fun m!1391547 () Bool)

(assert (=> b!1509100 m!1391547))

(declare-fun m!1391549 () Bool)

(assert (=> b!1509101 m!1391549))

(declare-fun m!1391551 () Bool)

(assert (=> b!1509101 m!1391551))

(assert (=> b!1509101 m!1391551))

(declare-fun m!1391553 () Bool)

(assert (=> b!1509101 m!1391553))

(assert (=> b!1509101 m!1391553))

(assert (=> b!1509101 m!1391551))

(declare-fun m!1391555 () Bool)

(assert (=> b!1509101 m!1391555))

(declare-fun m!1391557 () Bool)

(assert (=> b!1509096 m!1391557))

(assert (=> b!1509098 m!1391533))

(assert (=> b!1509098 m!1391533))

(declare-fun m!1391559 () Bool)

(assert (=> b!1509098 m!1391559))

(assert (=> b!1509098 m!1391559))

(assert (=> b!1509098 m!1391533))

(declare-fun m!1391561 () Bool)

(assert (=> b!1509098 m!1391561))

(push 1)

