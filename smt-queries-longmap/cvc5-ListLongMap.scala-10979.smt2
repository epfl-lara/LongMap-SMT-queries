; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128886 () Bool)

(assert start!128886)

(declare-fun b!1509288 () Bool)

(declare-fun res!1028333 () Bool)

(declare-fun e!843405 () Bool)

(assert (=> b!1509288 (=> (not res!1028333) (not e!843405))))

(declare-datatypes ((array!100673 0))(
  ( (array!100674 (arr!48573 (Array (_ BitVec 32) (_ BitVec 64))) (size!49124 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100673)

(declare-datatypes ((List!35043 0))(
  ( (Nil!35040) (Cons!35039 (h!36457 (_ BitVec 64)) (t!49729 List!35043)) )
))
(declare-fun arrayNoDuplicates!0 (array!100673 (_ BitVec 32) List!35043) Bool)

(assert (=> b!1509288 (= res!1028333 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35040))))

(declare-fun b!1509289 () Bool)

(declare-fun res!1028331 () Bool)

(assert (=> b!1509289 (=> (not res!1028331) (not e!843405))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100673 (_ BitVec 32)) Bool)

(assert (=> b!1509289 (= res!1028331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509290 () Bool)

(declare-fun res!1028334 () Bool)

(assert (=> b!1509290 (=> (not res!1028334) (not e!843405))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1509290 (= res!1028334 (and (= (size!49124 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49124 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49124 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509291 () Bool)

(declare-fun res!1028329 () Bool)

(assert (=> b!1509291 (=> (not res!1028329) (not e!843405))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12637 0))(
  ( (MissingZero!12637 (index!52943 (_ BitVec 32))) (Found!12637 (index!52944 (_ BitVec 32))) (Intermediate!12637 (undefined!13449 Bool) (index!52945 (_ BitVec 32)) (x!134894 (_ BitVec 32))) (Undefined!12637) (MissingVacant!12637 (index!52946 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100673 (_ BitVec 32)) SeekEntryResult!12637)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509291 (= res!1028329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48573 a!2804) j!70) mask!2512) (select (arr!48573 a!2804) j!70) a!2804 mask!2512) (Intermediate!12637 false resIndex!21 resX!21)))))

(declare-fun b!1509292 () Bool)

(assert (=> b!1509292 (= e!843405 false)))

(declare-fun lt!655054 () SeekEntryResult!12637)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509292 (= lt!655054 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48573 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509293 () Bool)

(declare-fun res!1028330 () Bool)

(assert (=> b!1509293 (=> (not res!1028330) (not e!843405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509293 (= res!1028330 (validKeyInArray!0 (select (arr!48573 a!2804) i!961)))))

(declare-fun b!1509294 () Bool)

(declare-fun res!1028332 () Bool)

(assert (=> b!1509294 (=> (not res!1028332) (not e!843405))))

(assert (=> b!1509294 (= res!1028332 (validKeyInArray!0 (select (arr!48573 a!2804) j!70)))))

(declare-fun res!1028336 () Bool)

(assert (=> start!128886 (=> (not res!1028336) (not e!843405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128886 (= res!1028336 (validMask!0 mask!2512))))

(assert (=> start!128886 e!843405))

(assert (=> start!128886 true))

(declare-fun array_inv!37854 (array!100673) Bool)

(assert (=> start!128886 (array_inv!37854 a!2804)))

(declare-fun b!1509295 () Bool)

(declare-fun res!1028335 () Bool)

(assert (=> b!1509295 (=> (not res!1028335) (not e!843405))))

(assert (=> b!1509295 (= res!1028335 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49124 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49124 a!2804))))))

(assert (= (and start!128886 res!1028336) b!1509290))

(assert (= (and b!1509290 res!1028334) b!1509293))

(assert (= (and b!1509293 res!1028330) b!1509294))

(assert (= (and b!1509294 res!1028332) b!1509289))

(assert (= (and b!1509289 res!1028331) b!1509288))

(assert (= (and b!1509288 res!1028333) b!1509295))

(assert (= (and b!1509295 res!1028335) b!1509291))

(assert (= (and b!1509291 res!1028329) b!1509292))

(declare-fun m!1391999 () Bool)

(assert (=> b!1509293 m!1391999))

(assert (=> b!1509293 m!1391999))

(declare-fun m!1392001 () Bool)

(assert (=> b!1509293 m!1392001))

(declare-fun m!1392003 () Bool)

(assert (=> b!1509292 m!1392003))

(assert (=> b!1509292 m!1392003))

(declare-fun m!1392005 () Bool)

(assert (=> b!1509292 m!1392005))

(declare-fun m!1392007 () Bool)

(assert (=> b!1509288 m!1392007))

(assert (=> b!1509294 m!1392003))

(assert (=> b!1509294 m!1392003))

(declare-fun m!1392009 () Bool)

(assert (=> b!1509294 m!1392009))

(assert (=> b!1509291 m!1392003))

(assert (=> b!1509291 m!1392003))

(declare-fun m!1392011 () Bool)

(assert (=> b!1509291 m!1392011))

(assert (=> b!1509291 m!1392011))

(assert (=> b!1509291 m!1392003))

(declare-fun m!1392013 () Bool)

(assert (=> b!1509291 m!1392013))

(declare-fun m!1392015 () Bool)

(assert (=> b!1509289 m!1392015))

(declare-fun m!1392017 () Bool)

(assert (=> start!128886 m!1392017))

(declare-fun m!1392019 () Bool)

(assert (=> start!128886 m!1392019))

(push 1)

(assert (not b!1509288))

(assert (not start!128886))

(assert (not b!1509293))

(assert (not b!1509291))

(assert (not b!1509292))

(assert (not b!1509294))

(assert (not b!1509289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

