; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129876 () Bool)

(assert start!129876)

(declare-fun b!1524304 () Bool)

(declare-fun e!849748 () Bool)

(declare-fun e!849751 () Bool)

(assert (=> b!1524304 (= e!849748 e!849751)))

(declare-fun res!1042963 () Bool)

(assert (=> b!1524304 (=> (not res!1042963) (not e!849751))))

(declare-datatypes ((SeekEntryResult!13102 0))(
  ( (MissingZero!13102 (index!54803 (_ BitVec 32))) (Found!13102 (index!54804 (_ BitVec 32))) (Intermediate!13102 (undefined!13914 Bool) (index!54805 (_ BitVec 32)) (x!136490 (_ BitVec 32))) (Undefined!13102) (MissingVacant!13102 (index!54806 (_ BitVec 32))) )
))
(declare-fun lt!660278 () SeekEntryResult!13102)

(declare-fun lt!660279 () SeekEntryResult!13102)

(assert (=> b!1524304 (= res!1042963 (= lt!660278 lt!660279))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1524304 (= lt!660279 (Intermediate!13102 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101415 0))(
  ( (array!101416 (arr!48937 (Array (_ BitVec 32) (_ BitVec 64))) (size!49487 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101415)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101415 (_ BitVec 32)) SeekEntryResult!13102)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524304 (= lt!660278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48937 a!2804) j!70) mask!2512) (select (arr!48937 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524305 () Bool)

(declare-fun res!1042965 () Bool)

(assert (=> b!1524305 (=> (not res!1042965) (not e!849748))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524305 (= res!1042965 (validKeyInArray!0 (select (arr!48937 a!2804) i!961)))))

(declare-fun b!1524306 () Bool)

(assert (=> b!1524306 (= e!849751 (not true))))

(declare-fun e!849749 () Bool)

(assert (=> b!1524306 e!849749))

(declare-fun res!1042956 () Bool)

(assert (=> b!1524306 (=> (not res!1042956) (not e!849749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101415 (_ BitVec 32)) Bool)

(assert (=> b!1524306 (= res!1042956 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50988 0))(
  ( (Unit!50989) )
))
(declare-fun lt!660280 () Unit!50988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50988)

(assert (=> b!1524306 (= lt!660280 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524307 () Bool)

(declare-fun res!1042957 () Bool)

(assert (=> b!1524307 (=> (not res!1042957) (not e!849751))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1524307 (= res!1042957 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48937 a!2804) j!70) a!2804 mask!2512) lt!660279))))

(declare-fun res!1042966 () Bool)

(assert (=> start!129876 (=> (not res!1042966) (not e!849748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129876 (= res!1042966 (validMask!0 mask!2512))))

(assert (=> start!129876 e!849748))

(assert (=> start!129876 true))

(declare-fun array_inv!37965 (array!101415) Bool)

(assert (=> start!129876 (array_inv!37965 a!2804)))

(declare-fun b!1524308 () Bool)

(declare-fun res!1042962 () Bool)

(assert (=> b!1524308 (=> (not res!1042962) (not e!849748))))

(assert (=> b!1524308 (= res!1042962 (and (= (size!49487 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49487 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49487 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524309 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101415 (_ BitVec 32)) SeekEntryResult!13102)

(assert (=> b!1524309 (= e!849749 (= (seekEntry!0 (select (arr!48937 a!2804) j!70) a!2804 mask!2512) (Found!13102 j!70)))))

(declare-fun b!1524310 () Bool)

(declare-fun res!1042964 () Bool)

(assert (=> b!1524310 (=> (not res!1042964) (not e!849748))))

(assert (=> b!1524310 (= res!1042964 (validKeyInArray!0 (select (arr!48937 a!2804) j!70)))))

(declare-fun b!1524311 () Bool)

(declare-fun res!1042961 () Bool)

(assert (=> b!1524311 (=> (not res!1042961) (not e!849748))))

(declare-datatypes ((List!35420 0))(
  ( (Nil!35417) (Cons!35416 (h!36843 (_ BitVec 64)) (t!50114 List!35420)) )
))
(declare-fun arrayNoDuplicates!0 (array!101415 (_ BitVec 32) List!35420) Bool)

(assert (=> b!1524311 (= res!1042961 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35417))))

(declare-fun b!1524312 () Bool)

(declare-fun res!1042960 () Bool)

(assert (=> b!1524312 (=> (not res!1042960) (not e!849748))))

(assert (=> b!1524312 (= res!1042960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524313 () Bool)

(declare-fun res!1042959 () Bool)

(assert (=> b!1524313 (=> (not res!1042959) (not e!849751))))

(assert (=> b!1524313 (= res!1042959 (= lt!660278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48937 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48937 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101416 (store (arr!48937 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49487 a!2804)) mask!2512)))))

(declare-fun b!1524314 () Bool)

(declare-fun res!1042958 () Bool)

(assert (=> b!1524314 (=> (not res!1042958) (not e!849748))))

(assert (=> b!1524314 (= res!1042958 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49487 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49487 a!2804))))))

(assert (= (and start!129876 res!1042966) b!1524308))

(assert (= (and b!1524308 res!1042962) b!1524305))

(assert (= (and b!1524305 res!1042965) b!1524310))

(assert (= (and b!1524310 res!1042964) b!1524312))

(assert (= (and b!1524312 res!1042960) b!1524311))

(assert (= (and b!1524311 res!1042961) b!1524314))

(assert (= (and b!1524314 res!1042958) b!1524304))

(assert (= (and b!1524304 res!1042963) b!1524307))

(assert (= (and b!1524307 res!1042957) b!1524313))

(assert (= (and b!1524313 res!1042959) b!1524306))

(assert (= (and b!1524306 res!1042956) b!1524309))

(declare-fun m!1407339 () Bool)

(assert (=> b!1524311 m!1407339))

(declare-fun m!1407341 () Bool)

(assert (=> b!1524310 m!1407341))

(assert (=> b!1524310 m!1407341))

(declare-fun m!1407343 () Bool)

(assert (=> b!1524310 m!1407343))

(assert (=> b!1524309 m!1407341))

(assert (=> b!1524309 m!1407341))

(declare-fun m!1407345 () Bool)

(assert (=> b!1524309 m!1407345))

(declare-fun m!1407347 () Bool)

(assert (=> b!1524306 m!1407347))

(declare-fun m!1407349 () Bool)

(assert (=> b!1524306 m!1407349))

(declare-fun m!1407351 () Bool)

(assert (=> start!129876 m!1407351))

(declare-fun m!1407353 () Bool)

(assert (=> start!129876 m!1407353))

(declare-fun m!1407355 () Bool)

(assert (=> b!1524305 m!1407355))

(assert (=> b!1524305 m!1407355))

(declare-fun m!1407357 () Bool)

(assert (=> b!1524305 m!1407357))

(assert (=> b!1524307 m!1407341))

(assert (=> b!1524307 m!1407341))

(declare-fun m!1407359 () Bool)

(assert (=> b!1524307 m!1407359))

(declare-fun m!1407361 () Bool)

(assert (=> b!1524313 m!1407361))

(declare-fun m!1407363 () Bool)

(assert (=> b!1524313 m!1407363))

(assert (=> b!1524313 m!1407363))

(declare-fun m!1407365 () Bool)

(assert (=> b!1524313 m!1407365))

(assert (=> b!1524313 m!1407365))

(assert (=> b!1524313 m!1407363))

(declare-fun m!1407367 () Bool)

(assert (=> b!1524313 m!1407367))

(declare-fun m!1407369 () Bool)

(assert (=> b!1524312 m!1407369))

(assert (=> b!1524304 m!1407341))

(assert (=> b!1524304 m!1407341))

(declare-fun m!1407371 () Bool)

(assert (=> b!1524304 m!1407371))

(assert (=> b!1524304 m!1407371))

(assert (=> b!1524304 m!1407341))

(declare-fun m!1407373 () Bool)

(assert (=> b!1524304 m!1407373))

(push 1)

(assert (not b!1524306))

(assert (not start!129876))

(assert (not b!1524305))

(assert (not b!1524310))

(assert (not b!1524309))

(assert (not b!1524304))

(assert (not b!1524307))

(assert (not b!1524311))

(assert (not b!1524313))

(assert (not b!1524312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

