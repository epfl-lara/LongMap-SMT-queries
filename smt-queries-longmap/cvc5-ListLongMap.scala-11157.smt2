; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130364 () Bool)

(assert start!130364)

(declare-fun b!1530318 () Bool)

(declare-fun res!1047847 () Bool)

(declare-fun e!852753 () Bool)

(assert (=> b!1530318 (=> (not res!1047847) (not e!852753))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101657 0))(
  ( (array!101658 (arr!49052 (Array (_ BitVec 32) (_ BitVec 64))) (size!49602 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101657)

(assert (=> b!1530318 (= res!1047847 (and (= (size!49602 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49602 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49602 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530319 () Bool)

(declare-fun e!852756 () Bool)

(assert (=> b!1530319 (= e!852753 e!852756)))

(declare-fun res!1047843 () Bool)

(assert (=> b!1530319 (=> (not res!1047843) (not e!852756))))

(declare-datatypes ((SeekEntryResult!13217 0))(
  ( (MissingZero!13217 (index!55263 (_ BitVec 32))) (Found!13217 (index!55264 (_ BitVec 32))) (Intermediate!13217 (undefined!14029 Bool) (index!55265 (_ BitVec 32)) (x!136953 (_ BitVec 32))) (Undefined!13217) (MissingVacant!13217 (index!55266 (_ BitVec 32))) )
))
(declare-fun lt!662777 () SeekEntryResult!13217)

(declare-fun lt!662779 () SeekEntryResult!13217)

(assert (=> b!1530319 (= res!1047843 (= lt!662777 lt!662779))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530319 (= lt!662779 (Intermediate!13217 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101657 (_ BitVec 32)) SeekEntryResult!13217)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530319 (= lt!662777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49052 a!2804) j!70) mask!2512) (select (arr!49052 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1047850 () Bool)

(assert (=> start!130364 (=> (not res!1047850) (not e!852753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130364 (= res!1047850 (validMask!0 mask!2512))))

(assert (=> start!130364 e!852753))

(assert (=> start!130364 true))

(declare-fun array_inv!38080 (array!101657) Bool)

(assert (=> start!130364 (array_inv!38080 a!2804)))

(declare-fun b!1530320 () Bool)

(declare-fun res!1047849 () Bool)

(assert (=> b!1530320 (=> (not res!1047849) (not e!852756))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1530320 (= res!1047849 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49052 a!2804) j!70) a!2804 mask!2512) lt!662779))))

(declare-fun b!1530321 () Bool)

(declare-fun e!852757 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101657 (_ BitVec 32)) SeekEntryResult!13217)

(assert (=> b!1530321 (= e!852757 (= (seekEntry!0 (select (arr!49052 a!2804) j!70) a!2804 mask!2512) (Found!13217 j!70)))))

(declare-fun b!1530322 () Bool)

(declare-fun res!1047853 () Bool)

(assert (=> b!1530322 (=> (not res!1047853) (not e!852756))))

(assert (=> b!1530322 (= res!1047853 (= lt!662777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49052 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49052 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101658 (store (arr!49052 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49602 a!2804)) mask!2512)))))

(declare-fun b!1530323 () Bool)

(declare-fun res!1047844 () Bool)

(assert (=> b!1530323 (=> (not res!1047844) (not e!852753))))

(assert (=> b!1530323 (= res!1047844 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49602 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49602 a!2804))))))

(declare-fun b!1530324 () Bool)

(declare-fun res!1047852 () Bool)

(assert (=> b!1530324 (=> (not res!1047852) (not e!852753))))

(declare-datatypes ((List!35535 0))(
  ( (Nil!35532) (Cons!35531 (h!36970 (_ BitVec 64)) (t!50229 List!35535)) )
))
(declare-fun arrayNoDuplicates!0 (array!101657 (_ BitVec 32) List!35535) Bool)

(assert (=> b!1530324 (= res!1047852 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35532))))

(declare-fun b!1530325 () Bool)

(declare-fun res!1047845 () Bool)

(assert (=> b!1530325 (=> (not res!1047845) (not e!852753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530325 (= res!1047845 (validKeyInArray!0 (select (arr!49052 a!2804) i!961)))))

(declare-fun b!1530326 () Bool)

(declare-fun res!1047848 () Bool)

(assert (=> b!1530326 (=> (not res!1047848) (not e!852753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101657 (_ BitVec 32)) Bool)

(assert (=> b!1530326 (= res!1047848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530327 () Bool)

(declare-fun res!1047851 () Bool)

(assert (=> b!1530327 (=> (not res!1047851) (not e!852753))))

(assert (=> b!1530327 (= res!1047851 (validKeyInArray!0 (select (arr!49052 a!2804) j!70)))))

(declare-fun b!1530328 () Bool)

(declare-fun e!852755 () Bool)

(assert (=> b!1530328 (= e!852756 (not e!852755))))

(declare-fun res!1047842 () Bool)

(assert (=> b!1530328 (=> res!1047842 e!852755)))

(assert (=> b!1530328 (= res!1047842 (or (not (= (select (arr!49052 a!2804) j!70) (select (store (arr!49052 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530328 e!852757))

(declare-fun res!1047846 () Bool)

(assert (=> b!1530328 (=> (not res!1047846) (not e!852757))))

(assert (=> b!1530328 (= res!1047846 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51218 0))(
  ( (Unit!51219) )
))
(declare-fun lt!662778 () Unit!51218)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51218)

(assert (=> b!1530328 (= lt!662778 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530329 () Bool)

(assert (=> b!1530329 (= e!852755 true)))

(declare-fun lt!662776 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530329 (= lt!662776 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130364 res!1047850) b!1530318))

(assert (= (and b!1530318 res!1047847) b!1530325))

(assert (= (and b!1530325 res!1047845) b!1530327))

(assert (= (and b!1530327 res!1047851) b!1530326))

(assert (= (and b!1530326 res!1047848) b!1530324))

(assert (= (and b!1530324 res!1047852) b!1530323))

(assert (= (and b!1530323 res!1047844) b!1530319))

(assert (= (and b!1530319 res!1047843) b!1530320))

(assert (= (and b!1530320 res!1047849) b!1530322))

(assert (= (and b!1530322 res!1047853) b!1530328))

(assert (= (and b!1530328 res!1047846) b!1530321))

(assert (= (and b!1530328 (not res!1047842)) b!1530329))

(declare-fun m!1413183 () Bool)

(assert (=> b!1530329 m!1413183))

(declare-fun m!1413185 () Bool)

(assert (=> b!1530319 m!1413185))

(assert (=> b!1530319 m!1413185))

(declare-fun m!1413187 () Bool)

(assert (=> b!1530319 m!1413187))

(assert (=> b!1530319 m!1413187))

(assert (=> b!1530319 m!1413185))

(declare-fun m!1413189 () Bool)

(assert (=> b!1530319 m!1413189))

(declare-fun m!1413191 () Bool)

(assert (=> b!1530326 m!1413191))

(declare-fun m!1413193 () Bool)

(assert (=> b!1530324 m!1413193))

(declare-fun m!1413195 () Bool)

(assert (=> b!1530325 m!1413195))

(assert (=> b!1530325 m!1413195))

(declare-fun m!1413197 () Bool)

(assert (=> b!1530325 m!1413197))

(declare-fun m!1413199 () Bool)

(assert (=> start!130364 m!1413199))

(declare-fun m!1413201 () Bool)

(assert (=> start!130364 m!1413201))

(assert (=> b!1530320 m!1413185))

(assert (=> b!1530320 m!1413185))

(declare-fun m!1413203 () Bool)

(assert (=> b!1530320 m!1413203))

(assert (=> b!1530321 m!1413185))

(assert (=> b!1530321 m!1413185))

(declare-fun m!1413205 () Bool)

(assert (=> b!1530321 m!1413205))

(assert (=> b!1530327 m!1413185))

(assert (=> b!1530327 m!1413185))

(declare-fun m!1413207 () Bool)

(assert (=> b!1530327 m!1413207))

(declare-fun m!1413209 () Bool)

(assert (=> b!1530322 m!1413209))

(declare-fun m!1413211 () Bool)

(assert (=> b!1530322 m!1413211))

(assert (=> b!1530322 m!1413211))

(declare-fun m!1413213 () Bool)

(assert (=> b!1530322 m!1413213))

(assert (=> b!1530322 m!1413213))

(assert (=> b!1530322 m!1413211))

(declare-fun m!1413215 () Bool)

(assert (=> b!1530322 m!1413215))

(assert (=> b!1530328 m!1413185))

(declare-fun m!1413217 () Bool)

(assert (=> b!1530328 m!1413217))

(assert (=> b!1530328 m!1413209))

(assert (=> b!1530328 m!1413211))

(declare-fun m!1413219 () Bool)

(assert (=> b!1530328 m!1413219))

(push 1)

