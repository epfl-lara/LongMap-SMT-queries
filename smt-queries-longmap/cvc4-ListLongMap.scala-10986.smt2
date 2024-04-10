; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128710 () Bool)

(assert start!128710)

(declare-fun b!1508382 () Bool)

(declare-fun res!1028393 () Bool)

(declare-fun e!842685 () Bool)

(assert (=> b!1508382 (=> (not res!1028393) (not e!842685))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100605 0))(
  ( (array!100606 (arr!48541 (Array (_ BitVec 32) (_ BitVec 64))) (size!49091 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100605)

(assert (=> b!1508382 (= res!1028393 (and (= (size!49091 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49091 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49091 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508383 () Bool)

(declare-fun res!1028396 () Bool)

(declare-fun e!842686 () Bool)

(assert (=> b!1508383 (=> (not res!1028396) (not e!842686))))

(declare-datatypes ((SeekEntryResult!12712 0))(
  ( (MissingZero!12712 (index!53243 (_ BitVec 32))) (Found!12712 (index!53244 (_ BitVec 32))) (Intermediate!12712 (undefined!13524 Bool) (index!53245 (_ BitVec 32)) (x!135000 (_ BitVec 32))) (Undefined!12712) (MissingVacant!12712 (index!53246 (_ BitVec 32))) )
))
(declare-fun lt!654618 () SeekEntryResult!12712)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100605 (_ BitVec 32)) SeekEntryResult!12712)

(assert (=> b!1508383 (= res!1028396 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48541 a!2804) j!70) a!2804 mask!2512) lt!654618))))

(declare-fun b!1508384 () Bool)

(declare-fun res!1028390 () Bool)

(assert (=> b!1508384 (=> (not res!1028390) (not e!842685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508384 (= res!1028390 (validKeyInArray!0 (select (arr!48541 a!2804) i!961)))))

(declare-fun b!1508385 () Bool)

(assert (=> b!1508385 (= e!842686 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!654619 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508385 (= lt!654619 (toIndex!0 (select (store (arr!48541 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508386 () Bool)

(declare-fun res!1028391 () Bool)

(assert (=> b!1508386 (=> (not res!1028391) (not e!842685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100605 (_ BitVec 32)) Bool)

(assert (=> b!1508386 (= res!1028391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508387 () Bool)

(declare-fun res!1028392 () Bool)

(assert (=> b!1508387 (=> (not res!1028392) (not e!842685))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508387 (= res!1028392 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49091 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49091 a!2804))))))

(declare-fun res!1028398 () Bool)

(assert (=> start!128710 (=> (not res!1028398) (not e!842685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128710 (= res!1028398 (validMask!0 mask!2512))))

(assert (=> start!128710 e!842685))

(assert (=> start!128710 true))

(declare-fun array_inv!37569 (array!100605) Bool)

(assert (=> start!128710 (array_inv!37569 a!2804)))

(declare-fun b!1508388 () Bool)

(assert (=> b!1508388 (= e!842685 e!842686)))

(declare-fun res!1028394 () Bool)

(assert (=> b!1508388 (=> (not res!1028394) (not e!842686))))

(assert (=> b!1508388 (= res!1028394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48541 a!2804) j!70) mask!2512) (select (arr!48541 a!2804) j!70) a!2804 mask!2512) lt!654618))))

(assert (=> b!1508388 (= lt!654618 (Intermediate!12712 false resIndex!21 resX!21))))

(declare-fun b!1508389 () Bool)

(declare-fun res!1028397 () Bool)

(assert (=> b!1508389 (=> (not res!1028397) (not e!842685))))

(assert (=> b!1508389 (= res!1028397 (validKeyInArray!0 (select (arr!48541 a!2804) j!70)))))

(declare-fun b!1508390 () Bool)

(declare-fun res!1028395 () Bool)

(assert (=> b!1508390 (=> (not res!1028395) (not e!842685))))

(declare-datatypes ((List!35024 0))(
  ( (Nil!35021) (Cons!35020 (h!36429 (_ BitVec 64)) (t!49718 List!35024)) )
))
(declare-fun arrayNoDuplicates!0 (array!100605 (_ BitVec 32) List!35024) Bool)

(assert (=> b!1508390 (= res!1028395 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35021))))

(assert (= (and start!128710 res!1028398) b!1508382))

(assert (= (and b!1508382 res!1028393) b!1508384))

(assert (= (and b!1508384 res!1028390) b!1508389))

(assert (= (and b!1508389 res!1028397) b!1508386))

(assert (= (and b!1508386 res!1028391) b!1508390))

(assert (= (and b!1508390 res!1028395) b!1508387))

(assert (= (and b!1508387 res!1028392) b!1508388))

(assert (= (and b!1508388 res!1028394) b!1508383))

(assert (= (and b!1508383 res!1028396) b!1508385))

(declare-fun m!1390887 () Bool)

(assert (=> b!1508389 m!1390887))

(assert (=> b!1508389 m!1390887))

(declare-fun m!1390889 () Bool)

(assert (=> b!1508389 m!1390889))

(declare-fun m!1390891 () Bool)

(assert (=> b!1508386 m!1390891))

(assert (=> b!1508383 m!1390887))

(assert (=> b!1508383 m!1390887))

(declare-fun m!1390893 () Bool)

(assert (=> b!1508383 m!1390893))

(declare-fun m!1390895 () Bool)

(assert (=> b!1508390 m!1390895))

(declare-fun m!1390897 () Bool)

(assert (=> b!1508385 m!1390897))

(declare-fun m!1390899 () Bool)

(assert (=> b!1508385 m!1390899))

(assert (=> b!1508385 m!1390899))

(declare-fun m!1390901 () Bool)

(assert (=> b!1508385 m!1390901))

(declare-fun m!1390903 () Bool)

(assert (=> b!1508384 m!1390903))

(assert (=> b!1508384 m!1390903))

(declare-fun m!1390905 () Bool)

(assert (=> b!1508384 m!1390905))

(declare-fun m!1390907 () Bool)

(assert (=> start!128710 m!1390907))

(declare-fun m!1390909 () Bool)

(assert (=> start!128710 m!1390909))

(assert (=> b!1508388 m!1390887))

(assert (=> b!1508388 m!1390887))

(declare-fun m!1390911 () Bool)

(assert (=> b!1508388 m!1390911))

(assert (=> b!1508388 m!1390911))

(assert (=> b!1508388 m!1390887))

(declare-fun m!1390913 () Bool)

(assert (=> b!1508388 m!1390913))

(push 1)

