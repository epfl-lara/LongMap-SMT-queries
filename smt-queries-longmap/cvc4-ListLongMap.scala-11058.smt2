; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129184 () Bool)

(assert start!129184)

(declare-fun b!1516345 () Bool)

(declare-fun res!1036257 () Bool)

(declare-fun e!846110 () Bool)

(assert (=> b!1516345 (=> (not res!1036257) (not e!846110))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101040 0))(
  ( (array!101041 (arr!48757 (Array (_ BitVec 32) (_ BitVec 64))) (size!49307 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101040)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516345 (= res!1036257 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49307 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49307 a!2804))))))

(declare-fun b!1516346 () Bool)

(declare-fun e!846109 () Bool)

(assert (=> b!1516346 (= e!846109 (not true))))

(declare-fun e!846112 () Bool)

(assert (=> b!1516346 e!846112))

(declare-fun res!1036256 () Bool)

(assert (=> b!1516346 (=> (not res!1036256) (not e!846112))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101040 (_ BitVec 32)) Bool)

(assert (=> b!1516346 (= res!1036256 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50724 0))(
  ( (Unit!50725) )
))
(declare-fun lt!657367 () Unit!50724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50724)

(assert (=> b!1516346 (= lt!657367 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516348 () Bool)

(declare-fun res!1036253 () Bool)

(assert (=> b!1516348 (=> (not res!1036253) (not e!846110))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516348 (= res!1036253 (validKeyInArray!0 (select (arr!48757 a!2804) i!961)))))

(declare-fun b!1516349 () Bool)

(declare-fun res!1036249 () Bool)

(assert (=> b!1516349 (=> (not res!1036249) (not e!846110))))

(assert (=> b!1516349 (= res!1036249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516350 () Bool)

(declare-datatypes ((SeekEntryResult!12928 0))(
  ( (MissingZero!12928 (index!54107 (_ BitVec 32))) (Found!12928 (index!54108 (_ BitVec 32))) (Intermediate!12928 (undefined!13740 Bool) (index!54109 (_ BitVec 32)) (x!135798 (_ BitVec 32))) (Undefined!12928) (MissingVacant!12928 (index!54110 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101040 (_ BitVec 32)) SeekEntryResult!12928)

(assert (=> b!1516350 (= e!846112 (= (seekEntry!0 (select (arr!48757 a!2804) j!70) a!2804 mask!2512) (Found!12928 j!70)))))

(declare-fun b!1516351 () Bool)

(declare-fun res!1036250 () Bool)

(assert (=> b!1516351 (=> (not res!1036250) (not e!846109))))

(declare-fun lt!657366 () SeekEntryResult!12928)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101040 (_ BitVec 32)) SeekEntryResult!12928)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516351 (= res!1036250 (= lt!657366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48757 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48757 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101041 (store (arr!48757 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49307 a!2804)) mask!2512)))))

(declare-fun res!1036255 () Bool)

(assert (=> start!129184 (=> (not res!1036255) (not e!846110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129184 (= res!1036255 (validMask!0 mask!2512))))

(assert (=> start!129184 e!846110))

(assert (=> start!129184 true))

(declare-fun array_inv!37785 (array!101040) Bool)

(assert (=> start!129184 (array_inv!37785 a!2804)))

(declare-fun b!1516347 () Bool)

(declare-fun res!1036248 () Bool)

(assert (=> b!1516347 (=> (not res!1036248) (not e!846110))))

(assert (=> b!1516347 (= res!1036248 (validKeyInArray!0 (select (arr!48757 a!2804) j!70)))))

(declare-fun b!1516352 () Bool)

(assert (=> b!1516352 (= e!846110 e!846109)))

(declare-fun res!1036251 () Bool)

(assert (=> b!1516352 (=> (not res!1036251) (not e!846109))))

(declare-fun lt!657365 () SeekEntryResult!12928)

(assert (=> b!1516352 (= res!1036251 (= lt!657366 lt!657365))))

(assert (=> b!1516352 (= lt!657365 (Intermediate!12928 false resIndex!21 resX!21))))

(assert (=> b!1516352 (= lt!657366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48757 a!2804) j!70) mask!2512) (select (arr!48757 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516353 () Bool)

(declare-fun res!1036254 () Bool)

(assert (=> b!1516353 (=> (not res!1036254) (not e!846110))))

(declare-datatypes ((List!35240 0))(
  ( (Nil!35237) (Cons!35236 (h!36648 (_ BitVec 64)) (t!49934 List!35240)) )
))
(declare-fun arrayNoDuplicates!0 (array!101040 (_ BitVec 32) List!35240) Bool)

(assert (=> b!1516353 (= res!1036254 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35237))))

(declare-fun b!1516354 () Bool)

(declare-fun res!1036252 () Bool)

(assert (=> b!1516354 (=> (not res!1036252) (not e!846110))))

(assert (=> b!1516354 (= res!1036252 (and (= (size!49307 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49307 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49307 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516355 () Bool)

(declare-fun res!1036258 () Bool)

(assert (=> b!1516355 (=> (not res!1036258) (not e!846109))))

(assert (=> b!1516355 (= res!1036258 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48757 a!2804) j!70) a!2804 mask!2512) lt!657365))))

(assert (= (and start!129184 res!1036255) b!1516354))

(assert (= (and b!1516354 res!1036252) b!1516348))

(assert (= (and b!1516348 res!1036253) b!1516347))

(assert (= (and b!1516347 res!1036248) b!1516349))

(assert (= (and b!1516349 res!1036249) b!1516353))

(assert (= (and b!1516353 res!1036254) b!1516345))

(assert (= (and b!1516345 res!1036257) b!1516352))

(assert (= (and b!1516352 res!1036251) b!1516355))

(assert (= (and b!1516355 res!1036258) b!1516351))

(assert (= (and b!1516351 res!1036250) b!1516346))

(assert (= (and b!1516346 res!1036256) b!1516350))

(declare-fun m!1399609 () Bool)

(assert (=> b!1516346 m!1399609))

(declare-fun m!1399611 () Bool)

(assert (=> b!1516346 m!1399611))

(declare-fun m!1399613 () Bool)

(assert (=> b!1516349 m!1399613))

(declare-fun m!1399615 () Bool)

(assert (=> b!1516351 m!1399615))

(declare-fun m!1399617 () Bool)

(assert (=> b!1516351 m!1399617))

(assert (=> b!1516351 m!1399617))

(declare-fun m!1399619 () Bool)

(assert (=> b!1516351 m!1399619))

(assert (=> b!1516351 m!1399619))

(assert (=> b!1516351 m!1399617))

(declare-fun m!1399621 () Bool)

(assert (=> b!1516351 m!1399621))

(declare-fun m!1399623 () Bool)

(assert (=> b!1516347 m!1399623))

(assert (=> b!1516347 m!1399623))

(declare-fun m!1399625 () Bool)

(assert (=> b!1516347 m!1399625))

(declare-fun m!1399627 () Bool)

(assert (=> b!1516353 m!1399627))

(declare-fun m!1399629 () Bool)

(assert (=> start!129184 m!1399629))

(declare-fun m!1399631 () Bool)

(assert (=> start!129184 m!1399631))

(assert (=> b!1516352 m!1399623))

(assert (=> b!1516352 m!1399623))

(declare-fun m!1399633 () Bool)

(assert (=> b!1516352 m!1399633))

(assert (=> b!1516352 m!1399633))

(assert (=> b!1516352 m!1399623))

(declare-fun m!1399635 () Bool)

(assert (=> b!1516352 m!1399635))

(assert (=> b!1516350 m!1399623))

(assert (=> b!1516350 m!1399623))

(declare-fun m!1399637 () Bool)

(assert (=> b!1516350 m!1399637))

(assert (=> b!1516355 m!1399623))

(assert (=> b!1516355 m!1399623))

(declare-fun m!1399639 () Bool)

(assert (=> b!1516355 m!1399639))

(declare-fun m!1399641 () Bool)

(assert (=> b!1516348 m!1399641))

(assert (=> b!1516348 m!1399641))

(declare-fun m!1399643 () Bool)

(assert (=> b!1516348 m!1399643))

(push 1)

(assert (not b!1516355))

