; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128944 () Bool)

(assert start!128944)

(declare-fun b!1511566 () Bool)

(declare-fun res!1031471 () Bool)

(declare-fun e!843871 () Bool)

(assert (=> b!1511566 (=> (not res!1031471) (not e!843871))))

(declare-datatypes ((array!100800 0))(
  ( (array!100801 (arr!48637 (Array (_ BitVec 32) (_ BitVec 64))) (size!49187 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100800)

(declare-datatypes ((List!35120 0))(
  ( (Nil!35117) (Cons!35116 (h!36528 (_ BitVec 64)) (t!49814 List!35120)) )
))
(declare-fun arrayNoDuplicates!0 (array!100800 (_ BitVec 32) List!35120) Bool)

(assert (=> b!1511566 (= res!1031471 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35117))))

(declare-fun b!1511568 () Bool)

(declare-fun res!1031479 () Bool)

(assert (=> b!1511568 (=> (not res!1031479) (not e!843871))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1511568 (= res!1031479 (and (= (size!49187 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49187 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49187 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!843868 () Bool)

(declare-fun b!1511569 () Bool)

(declare-datatypes ((SeekEntryResult!12808 0))(
  ( (MissingZero!12808 (index!53627 (_ BitVec 32))) (Found!12808 (index!53628 (_ BitVec 32))) (Intermediate!12808 (undefined!13620 Bool) (index!53629 (_ BitVec 32)) (x!135358 (_ BitVec 32))) (Undefined!12808) (MissingVacant!12808 (index!53630 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100800 (_ BitVec 32)) SeekEntryResult!12808)

(assert (=> b!1511569 (= e!843868 (= (seekEntry!0 (select (arr!48637 a!2804) j!70) a!2804 mask!2512) (Found!12808 j!70)))))

(declare-fun b!1511570 () Bool)

(declare-fun res!1031477 () Bool)

(declare-fun e!843869 () Bool)

(assert (=> b!1511570 (=> (not res!1031477) (not e!843869))))

(declare-fun lt!655475 () SeekEntryResult!12808)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100800 (_ BitVec 32)) SeekEntryResult!12808)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511570 (= res!1031477 (= lt!655475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48637 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48637 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100801 (store (arr!48637 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49187 a!2804)) mask!2512)))))

(declare-fun b!1511571 () Bool)

(declare-fun res!1031476 () Bool)

(assert (=> b!1511571 (=> (not res!1031476) (not e!843869))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!655476 () SeekEntryResult!12808)

(assert (=> b!1511571 (= res!1031476 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48637 a!2804) j!70) a!2804 mask!2512) lt!655476))))

(declare-fun b!1511572 () Bool)

(declare-fun res!1031474 () Bool)

(assert (=> b!1511572 (=> (not res!1031474) (not e!843871))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511572 (= res!1031474 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49187 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49187 a!2804))))))

(declare-fun b!1511573 () Bool)

(declare-fun res!1031470 () Bool)

(assert (=> b!1511573 (=> (not res!1031470) (not e!843871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100800 (_ BitVec 32)) Bool)

(assert (=> b!1511573 (= res!1031470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511574 () Bool)

(declare-fun res!1031469 () Bool)

(assert (=> b!1511574 (=> (not res!1031469) (not e!843871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511574 (= res!1031469 (validKeyInArray!0 (select (arr!48637 a!2804) j!70)))))

(declare-fun b!1511575 () Bool)

(declare-fun res!1031472 () Bool)

(assert (=> b!1511575 (=> (not res!1031472) (not e!843871))))

(assert (=> b!1511575 (= res!1031472 (validKeyInArray!0 (select (arr!48637 a!2804) i!961)))))

(declare-fun b!1511576 () Bool)

(assert (=> b!1511576 (= e!843871 e!843869)))

(declare-fun res!1031475 () Bool)

(assert (=> b!1511576 (=> (not res!1031475) (not e!843869))))

(assert (=> b!1511576 (= res!1031475 (= lt!655475 lt!655476))))

(assert (=> b!1511576 (= lt!655476 (Intermediate!12808 false resIndex!21 resX!21))))

(assert (=> b!1511576 (= lt!655475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48637 a!2804) j!70) mask!2512) (select (arr!48637 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1031473 () Bool)

(assert (=> start!128944 (=> (not res!1031473) (not e!843871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128944 (= res!1031473 (validMask!0 mask!2512))))

(assert (=> start!128944 e!843871))

(assert (=> start!128944 true))

(declare-fun array_inv!37665 (array!100800) Bool)

(assert (=> start!128944 (array_inv!37665 a!2804)))

(declare-fun b!1511567 () Bool)

(assert (=> b!1511567 (= e!843869 (not true))))

(assert (=> b!1511567 e!843868))

(declare-fun res!1031478 () Bool)

(assert (=> b!1511567 (=> (not res!1031478) (not e!843868))))

(assert (=> b!1511567 (= res!1031478 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50484 0))(
  ( (Unit!50485) )
))
(declare-fun lt!655477 () Unit!50484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50484)

(assert (=> b!1511567 (= lt!655477 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128944 res!1031473) b!1511568))

(assert (= (and b!1511568 res!1031479) b!1511575))

(assert (= (and b!1511575 res!1031472) b!1511574))

(assert (= (and b!1511574 res!1031469) b!1511573))

(assert (= (and b!1511573 res!1031470) b!1511566))

(assert (= (and b!1511566 res!1031471) b!1511572))

(assert (= (and b!1511572 res!1031474) b!1511576))

(assert (= (and b!1511576 res!1031475) b!1511571))

(assert (= (and b!1511571 res!1031476) b!1511570))

(assert (= (and b!1511570 res!1031477) b!1511567))

(assert (= (and b!1511567 res!1031478) b!1511569))

(declare-fun m!1394275 () Bool)

(assert (=> b!1511573 m!1394275))

(declare-fun m!1394277 () Bool)

(assert (=> start!128944 m!1394277))

(declare-fun m!1394279 () Bool)

(assert (=> start!128944 m!1394279))

(declare-fun m!1394281 () Bool)

(assert (=> b!1511574 m!1394281))

(assert (=> b!1511574 m!1394281))

(declare-fun m!1394283 () Bool)

(assert (=> b!1511574 m!1394283))

(declare-fun m!1394285 () Bool)

(assert (=> b!1511575 m!1394285))

(assert (=> b!1511575 m!1394285))

(declare-fun m!1394287 () Bool)

(assert (=> b!1511575 m!1394287))

(declare-fun m!1394289 () Bool)

(assert (=> b!1511570 m!1394289))

(declare-fun m!1394291 () Bool)

(assert (=> b!1511570 m!1394291))

(assert (=> b!1511570 m!1394291))

(declare-fun m!1394293 () Bool)

(assert (=> b!1511570 m!1394293))

(assert (=> b!1511570 m!1394293))

(assert (=> b!1511570 m!1394291))

(declare-fun m!1394295 () Bool)

(assert (=> b!1511570 m!1394295))

(assert (=> b!1511576 m!1394281))

(assert (=> b!1511576 m!1394281))

(declare-fun m!1394297 () Bool)

(assert (=> b!1511576 m!1394297))

(assert (=> b!1511576 m!1394297))

(assert (=> b!1511576 m!1394281))

(declare-fun m!1394299 () Bool)

(assert (=> b!1511576 m!1394299))

(assert (=> b!1511569 m!1394281))

(assert (=> b!1511569 m!1394281))

(declare-fun m!1394301 () Bool)

(assert (=> b!1511569 m!1394301))

(assert (=> b!1511571 m!1394281))

(assert (=> b!1511571 m!1394281))

(declare-fun m!1394303 () Bool)

(assert (=> b!1511571 m!1394303))

(declare-fun m!1394305 () Bool)

(assert (=> b!1511566 m!1394305))

(declare-fun m!1394307 () Bool)

(assert (=> b!1511567 m!1394307))

(declare-fun m!1394309 () Bool)

(assert (=> b!1511567 m!1394309))

(push 1)

(assert (not b!1511566))

