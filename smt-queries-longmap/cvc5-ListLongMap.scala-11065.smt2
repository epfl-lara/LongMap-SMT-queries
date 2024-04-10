; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129222 () Bool)

(assert start!129222)

(declare-fun b!1517084 () Bool)

(declare-fun res!1036996 () Bool)

(declare-fun e!846453 () Bool)

(assert (=> b!1517084 (=> (not res!1036996) (not e!846453))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101078 0))(
  ( (array!101079 (arr!48776 (Array (_ BitVec 32) (_ BitVec 64))) (size!49326 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101078)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517084 (= res!1036996 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49326 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49326 a!2804))))))

(declare-fun res!1036993 () Bool)

(assert (=> start!129222 (=> (not res!1036993) (not e!846453))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129222 (= res!1036993 (validMask!0 mask!2512))))

(assert (=> start!129222 e!846453))

(assert (=> start!129222 true))

(declare-fun array_inv!37804 (array!101078) Bool)

(assert (=> start!129222 (array_inv!37804 a!2804)))

(declare-fun b!1517085 () Bool)

(declare-fun res!1036991 () Bool)

(assert (=> b!1517085 (=> (not res!1036991) (not e!846453))))

(declare-datatypes ((List!35259 0))(
  ( (Nil!35256) (Cons!35255 (h!36667 (_ BitVec 64)) (t!49953 List!35259)) )
))
(declare-fun arrayNoDuplicates!0 (array!101078 (_ BitVec 32) List!35259) Bool)

(assert (=> b!1517085 (= res!1036991 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35256))))

(declare-fun b!1517086 () Bool)

(declare-fun e!846454 () Bool)

(assert (=> b!1517086 (= e!846453 e!846454)))

(declare-fun res!1036994 () Bool)

(assert (=> b!1517086 (=> (not res!1036994) (not e!846454))))

(declare-datatypes ((SeekEntryResult!12947 0))(
  ( (MissingZero!12947 (index!54183 (_ BitVec 32))) (Found!12947 (index!54184 (_ BitVec 32))) (Intermediate!12947 (undefined!13759 Bool) (index!54185 (_ BitVec 32)) (x!135873 (_ BitVec 32))) (Undefined!12947) (MissingVacant!12947 (index!54186 (_ BitVec 32))) )
))
(declare-fun lt!657650 () SeekEntryResult!12947)

(declare-fun lt!657648 () SeekEntryResult!12947)

(assert (=> b!1517086 (= res!1036994 (= lt!657650 lt!657648))))

(assert (=> b!1517086 (= lt!657648 (Intermediate!12947 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101078 (_ BitVec 32)) SeekEntryResult!12947)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517086 (= lt!657650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48776 a!2804) j!70) mask!2512) (select (arr!48776 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517087 () Bool)

(declare-fun e!846452 () Bool)

(declare-fun e!846451 () Bool)

(assert (=> b!1517087 (= e!846452 e!846451)))

(declare-fun res!1036997 () Bool)

(assert (=> b!1517087 (=> res!1036997 e!846451)))

(declare-fun lt!657651 () (_ BitVec 32))

(assert (=> b!1517087 (= res!1036997 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657651 #b00000000000000000000000000000000) (bvsge lt!657651 (size!49326 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517087 (= lt!657651 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517088 () Bool)

(declare-fun e!846450 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101078 (_ BitVec 32)) SeekEntryResult!12947)

(assert (=> b!1517088 (= e!846450 (= (seekEntry!0 (select (arr!48776 a!2804) j!70) a!2804 mask!2512) (Found!12947 j!70)))))

(declare-fun b!1517089 () Bool)

(declare-fun res!1036990 () Bool)

(assert (=> b!1517089 (=> (not res!1036990) (not e!846454))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517089 (= res!1036990 (= lt!657650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48776 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48776 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101079 (store (arr!48776 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49326 a!2804)) mask!2512)))))

(declare-fun b!1517090 () Bool)

(declare-fun res!1036988 () Bool)

(assert (=> b!1517090 (=> (not res!1036988) (not e!846453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517090 (= res!1036988 (validKeyInArray!0 (select (arr!48776 a!2804) i!961)))))

(declare-fun b!1517091 () Bool)

(declare-fun res!1036987 () Bool)

(assert (=> b!1517091 (=> (not res!1036987) (not e!846453))))

(assert (=> b!1517091 (= res!1036987 (validKeyInArray!0 (select (arr!48776 a!2804) j!70)))))

(declare-fun b!1517092 () Bool)

(declare-fun res!1036989 () Bool)

(assert (=> b!1517092 (=> (not res!1036989) (not e!846453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101078 (_ BitVec 32)) Bool)

(assert (=> b!1517092 (= res!1036989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517093 () Bool)

(declare-fun res!1036995 () Bool)

(assert (=> b!1517093 (=> (not res!1036995) (not e!846453))))

(assert (=> b!1517093 (= res!1036995 (and (= (size!49326 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49326 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49326 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517094 () Bool)

(assert (=> b!1517094 (= e!846454 (not e!846452))))

(declare-fun res!1036998 () Bool)

(assert (=> b!1517094 (=> res!1036998 e!846452)))

(assert (=> b!1517094 (= res!1036998 (or (not (= (select (arr!48776 a!2804) j!70) (select (store (arr!48776 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517094 e!846450))

(declare-fun res!1036992 () Bool)

(assert (=> b!1517094 (=> (not res!1036992) (not e!846450))))

(assert (=> b!1517094 (= res!1036992 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50762 0))(
  ( (Unit!50763) )
))
(declare-fun lt!657649 () Unit!50762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50762)

(assert (=> b!1517094 (= lt!657649 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517095 () Bool)

(assert (=> b!1517095 (= e!846451 true)))

(declare-fun lt!657652 () SeekEntryResult!12947)

(assert (=> b!1517095 (= lt!657652 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657651 (select (arr!48776 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517096 () Bool)

(declare-fun res!1036999 () Bool)

(assert (=> b!1517096 (=> (not res!1036999) (not e!846454))))

(assert (=> b!1517096 (= res!1036999 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48776 a!2804) j!70) a!2804 mask!2512) lt!657648))))

(assert (= (and start!129222 res!1036993) b!1517093))

(assert (= (and b!1517093 res!1036995) b!1517090))

(assert (= (and b!1517090 res!1036988) b!1517091))

(assert (= (and b!1517091 res!1036987) b!1517092))

(assert (= (and b!1517092 res!1036989) b!1517085))

(assert (= (and b!1517085 res!1036991) b!1517084))

(assert (= (and b!1517084 res!1036996) b!1517086))

(assert (= (and b!1517086 res!1036994) b!1517096))

(assert (= (and b!1517096 res!1036999) b!1517089))

(assert (= (and b!1517089 res!1036990) b!1517094))

(assert (= (and b!1517094 res!1036992) b!1517088))

(assert (= (and b!1517094 (not res!1036998)) b!1517087))

(assert (= (and b!1517087 (not res!1036997)) b!1517095))

(declare-fun m!1400365 () Bool)

(assert (=> start!129222 m!1400365))

(declare-fun m!1400367 () Bool)

(assert (=> start!129222 m!1400367))

(declare-fun m!1400369 () Bool)

(assert (=> b!1517090 m!1400369))

(assert (=> b!1517090 m!1400369))

(declare-fun m!1400371 () Bool)

(assert (=> b!1517090 m!1400371))

(declare-fun m!1400373 () Bool)

(assert (=> b!1517086 m!1400373))

(assert (=> b!1517086 m!1400373))

(declare-fun m!1400375 () Bool)

(assert (=> b!1517086 m!1400375))

(assert (=> b!1517086 m!1400375))

(assert (=> b!1517086 m!1400373))

(declare-fun m!1400377 () Bool)

(assert (=> b!1517086 m!1400377))

(declare-fun m!1400379 () Bool)

(assert (=> b!1517092 m!1400379))

(assert (=> b!1517096 m!1400373))

(assert (=> b!1517096 m!1400373))

(declare-fun m!1400381 () Bool)

(assert (=> b!1517096 m!1400381))

(assert (=> b!1517094 m!1400373))

(declare-fun m!1400383 () Bool)

(assert (=> b!1517094 m!1400383))

(declare-fun m!1400385 () Bool)

(assert (=> b!1517094 m!1400385))

(declare-fun m!1400387 () Bool)

(assert (=> b!1517094 m!1400387))

(declare-fun m!1400389 () Bool)

(assert (=> b!1517094 m!1400389))

(assert (=> b!1517088 m!1400373))

(assert (=> b!1517088 m!1400373))

(declare-fun m!1400391 () Bool)

(assert (=> b!1517088 m!1400391))

(declare-fun m!1400393 () Bool)

(assert (=> b!1517085 m!1400393))

(declare-fun m!1400395 () Bool)

(assert (=> b!1517087 m!1400395))

(assert (=> b!1517095 m!1400373))

(assert (=> b!1517095 m!1400373))

(declare-fun m!1400397 () Bool)

(assert (=> b!1517095 m!1400397))

(assert (=> b!1517091 m!1400373))

(assert (=> b!1517091 m!1400373))

(declare-fun m!1400399 () Bool)

(assert (=> b!1517091 m!1400399))

(assert (=> b!1517089 m!1400385))

(assert (=> b!1517089 m!1400387))

(assert (=> b!1517089 m!1400387))

(declare-fun m!1400401 () Bool)

(assert (=> b!1517089 m!1400401))

(assert (=> b!1517089 m!1400401))

(assert (=> b!1517089 m!1400387))

(declare-fun m!1400403 () Bool)

(assert (=> b!1517089 m!1400403))

(push 1)

