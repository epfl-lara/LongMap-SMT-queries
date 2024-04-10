; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129182 () Bool)

(assert start!129182)

(declare-fun b!1516312 () Bool)

(declare-fun res!1036223 () Bool)

(declare-fun e!846097 () Bool)

(assert (=> b!1516312 (=> (not res!1036223) (not e!846097))))

(declare-datatypes ((array!101038 0))(
  ( (array!101039 (arr!48756 (Array (_ BitVec 32) (_ BitVec 64))) (size!49306 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101038)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101038 (_ BitVec 32)) Bool)

(assert (=> b!1516312 (= res!1036223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516313 () Bool)

(declare-fun res!1036225 () Bool)

(assert (=> b!1516313 (=> (not res!1036225) (not e!846097))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516313 (= res!1036225 (validKeyInArray!0 (select (arr!48756 a!2804) i!961)))))

(declare-fun b!1516314 () Bool)

(declare-fun res!1036217 () Bool)

(assert (=> b!1516314 (=> (not res!1036217) (not e!846097))))

(declare-datatypes ((List!35239 0))(
  ( (Nil!35236) (Cons!35235 (h!36647 (_ BitVec 64)) (t!49933 List!35239)) )
))
(declare-fun arrayNoDuplicates!0 (array!101038 (_ BitVec 32) List!35239) Bool)

(assert (=> b!1516314 (= res!1036217 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35236))))

(declare-fun e!846099 () Bool)

(declare-fun b!1516315 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12927 0))(
  ( (MissingZero!12927 (index!54103 (_ BitVec 32))) (Found!12927 (index!54104 (_ BitVec 32))) (Intermediate!12927 (undefined!13739 Bool) (index!54105 (_ BitVec 32)) (x!135797 (_ BitVec 32))) (Undefined!12927) (MissingVacant!12927 (index!54106 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101038 (_ BitVec 32)) SeekEntryResult!12927)

(assert (=> b!1516315 (= e!846099 (= (seekEntry!0 (select (arr!48756 a!2804) j!70) a!2804 mask!2512) (Found!12927 j!70)))))

(declare-fun res!1036224 () Bool)

(assert (=> start!129182 (=> (not res!1036224) (not e!846097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129182 (= res!1036224 (validMask!0 mask!2512))))

(assert (=> start!129182 e!846097))

(assert (=> start!129182 true))

(declare-fun array_inv!37784 (array!101038) Bool)

(assert (=> start!129182 (array_inv!37784 a!2804)))

(declare-fun b!1516316 () Bool)

(declare-fun res!1036215 () Bool)

(declare-fun e!846100 () Bool)

(assert (=> b!1516316 (=> (not res!1036215) (not e!846100))))

(declare-fun lt!657356 () SeekEntryResult!12927)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101038 (_ BitVec 32)) SeekEntryResult!12927)

(assert (=> b!1516316 (= res!1036215 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48756 a!2804) j!70) a!2804 mask!2512) lt!657356))))

(declare-fun b!1516317 () Bool)

(declare-fun res!1036219 () Bool)

(assert (=> b!1516317 (=> (not res!1036219) (not e!846097))))

(assert (=> b!1516317 (= res!1036219 (validKeyInArray!0 (select (arr!48756 a!2804) j!70)))))

(declare-fun b!1516318 () Bool)

(assert (=> b!1516318 (= e!846100 (not true))))

(assert (=> b!1516318 e!846099))

(declare-fun res!1036222 () Bool)

(assert (=> b!1516318 (=> (not res!1036222) (not e!846099))))

(assert (=> b!1516318 (= res!1036222 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50722 0))(
  ( (Unit!50723) )
))
(declare-fun lt!657358 () Unit!50722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50722)

(assert (=> b!1516318 (= lt!657358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516319 () Bool)

(assert (=> b!1516319 (= e!846097 e!846100)))

(declare-fun res!1036221 () Bool)

(assert (=> b!1516319 (=> (not res!1036221) (not e!846100))))

(declare-fun lt!657357 () SeekEntryResult!12927)

(assert (=> b!1516319 (= res!1036221 (= lt!657357 lt!657356))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516319 (= lt!657356 (Intermediate!12927 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516319 (= lt!657357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48756 a!2804) j!70) mask!2512) (select (arr!48756 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516320 () Bool)

(declare-fun res!1036220 () Bool)

(assert (=> b!1516320 (=> (not res!1036220) (not e!846097))))

(assert (=> b!1516320 (= res!1036220 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49306 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49306 a!2804))))))

(declare-fun b!1516321 () Bool)

(declare-fun res!1036216 () Bool)

(assert (=> b!1516321 (=> (not res!1036216) (not e!846097))))

(assert (=> b!1516321 (= res!1036216 (and (= (size!49306 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49306 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49306 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516322 () Bool)

(declare-fun res!1036218 () Bool)

(assert (=> b!1516322 (=> (not res!1036218) (not e!846100))))

(assert (=> b!1516322 (= res!1036218 (= lt!657357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48756 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48756 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101039 (store (arr!48756 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49306 a!2804)) mask!2512)))))

(assert (= (and start!129182 res!1036224) b!1516321))

(assert (= (and b!1516321 res!1036216) b!1516313))

(assert (= (and b!1516313 res!1036225) b!1516317))

(assert (= (and b!1516317 res!1036219) b!1516312))

(assert (= (and b!1516312 res!1036223) b!1516314))

(assert (= (and b!1516314 res!1036217) b!1516320))

(assert (= (and b!1516320 res!1036220) b!1516319))

(assert (= (and b!1516319 res!1036221) b!1516316))

(assert (= (and b!1516316 res!1036215) b!1516322))

(assert (= (and b!1516322 res!1036218) b!1516318))

(assert (= (and b!1516318 res!1036222) b!1516315))

(declare-fun m!1399573 () Bool)

(assert (=> b!1516312 m!1399573))

(declare-fun m!1399575 () Bool)

(assert (=> b!1516314 m!1399575))

(declare-fun m!1399577 () Bool)

(assert (=> b!1516318 m!1399577))

(declare-fun m!1399579 () Bool)

(assert (=> b!1516318 m!1399579))

(declare-fun m!1399581 () Bool)

(assert (=> b!1516322 m!1399581))

(declare-fun m!1399583 () Bool)

(assert (=> b!1516322 m!1399583))

(assert (=> b!1516322 m!1399583))

(declare-fun m!1399585 () Bool)

(assert (=> b!1516322 m!1399585))

(assert (=> b!1516322 m!1399585))

(assert (=> b!1516322 m!1399583))

(declare-fun m!1399587 () Bool)

(assert (=> b!1516322 m!1399587))

(declare-fun m!1399589 () Bool)

(assert (=> start!129182 m!1399589))

(declare-fun m!1399591 () Bool)

(assert (=> start!129182 m!1399591))

(declare-fun m!1399593 () Bool)

(assert (=> b!1516317 m!1399593))

(assert (=> b!1516317 m!1399593))

(declare-fun m!1399595 () Bool)

(assert (=> b!1516317 m!1399595))

(assert (=> b!1516315 m!1399593))

(assert (=> b!1516315 m!1399593))

(declare-fun m!1399597 () Bool)

(assert (=> b!1516315 m!1399597))

(assert (=> b!1516316 m!1399593))

(assert (=> b!1516316 m!1399593))

(declare-fun m!1399599 () Bool)

(assert (=> b!1516316 m!1399599))

(assert (=> b!1516319 m!1399593))

(assert (=> b!1516319 m!1399593))

(declare-fun m!1399601 () Bool)

(assert (=> b!1516319 m!1399601))

(assert (=> b!1516319 m!1399601))

(assert (=> b!1516319 m!1399593))

(declare-fun m!1399603 () Bool)

(assert (=> b!1516319 m!1399603))

(declare-fun m!1399605 () Bool)

(assert (=> b!1516313 m!1399605))

(assert (=> b!1516313 m!1399605))

(declare-fun m!1399607 () Bool)

(assert (=> b!1516313 m!1399607))

(check-sat (not b!1516315) (not b!1516313) (not b!1516322) (not b!1516312) (not b!1516319) (not b!1516314) (not b!1516316) (not start!129182) (not b!1516318) (not b!1516317))
(check-sat)
