; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129318 () Bool)

(assert start!129318)

(declare-fun b!1518994 () Bool)

(declare-fun e!847355 () Bool)

(assert (=> b!1518994 (= e!847355 true)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101174 0))(
  ( (array!101175 (arr!48824 (Array (_ BitVec 32) (_ BitVec 64))) (size!49374 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101174)

(declare-fun lt!658444 () (_ BitVec 64))

(declare-fun lt!658448 () array!101174)

(declare-datatypes ((SeekEntryResult!12995 0))(
  ( (MissingZero!12995 (index!54375 (_ BitVec 32))) (Found!12995 (index!54376 (_ BitVec 32))) (Intermediate!12995 (undefined!13807 Bool) (index!54377 (_ BitVec 32)) (x!136049 (_ BitVec 32))) (Undefined!12995) (MissingVacant!12995 (index!54378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101174 (_ BitVec 32)) SeekEntryResult!12995)

(assert (=> b!1518994 (= (seekEntryOrOpen!0 (select (arr!48824 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658444 lt!658448 mask!2512))))

(declare-datatypes ((Unit!50858 0))(
  ( (Unit!50859) )
))
(declare-fun lt!658445 () Unit!50858)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!658449 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50858)

(assert (=> b!1518994 (= lt!658445 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658449 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518995 () Bool)

(declare-fun res!1038910 () Bool)

(declare-fun e!847356 () Bool)

(assert (=> b!1518995 (=> (not res!1038910) (not e!847356))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!658450 () SeekEntryResult!12995)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101174 (_ BitVec 32)) SeekEntryResult!12995)

(assert (=> b!1518995 (= res!1038910 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48824 a!2804) j!70) a!2804 mask!2512) lt!658450))))

(declare-fun b!1518997 () Bool)

(declare-fun res!1038902 () Bool)

(assert (=> b!1518997 (=> res!1038902 e!847355)))

(assert (=> b!1518997 (= res!1038902 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658449 (select (arr!48824 a!2804) j!70) a!2804 mask!2512) lt!658450)))))

(declare-fun b!1518998 () Bool)

(declare-fun res!1038909 () Bool)

(declare-fun e!847352 () Bool)

(assert (=> b!1518998 (=> (not res!1038909) (not e!847352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101174 (_ BitVec 32)) Bool)

(assert (=> b!1518998 (= res!1038909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518999 () Bool)

(declare-fun res!1038903 () Bool)

(assert (=> b!1518999 (=> (not res!1038903) (not e!847352))))

(assert (=> b!1518999 (= res!1038903 (and (= (size!49374 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49374 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49374 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519000 () Bool)

(declare-fun res!1038901 () Bool)

(assert (=> b!1519000 (=> (not res!1038901) (not e!847352))))

(declare-datatypes ((List!35307 0))(
  ( (Nil!35304) (Cons!35303 (h!36715 (_ BitVec 64)) (t!50001 List!35307)) )
))
(declare-fun arrayNoDuplicates!0 (array!101174 (_ BitVec 32) List!35307) Bool)

(assert (=> b!1519000 (= res!1038901 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35304))))

(declare-fun b!1519001 () Bool)

(declare-fun res!1038907 () Bool)

(assert (=> b!1519001 (=> (not res!1038907) (not e!847352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519001 (= res!1038907 (validKeyInArray!0 (select (arr!48824 a!2804) i!961)))))

(declare-fun b!1519002 () Bool)

(declare-fun res!1038898 () Bool)

(assert (=> b!1519002 (=> (not res!1038898) (not e!847352))))

(assert (=> b!1519002 (= res!1038898 (validKeyInArray!0 (select (arr!48824 a!2804) j!70)))))

(declare-fun b!1519003 () Bool)

(declare-fun e!847354 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101174 (_ BitVec 32)) SeekEntryResult!12995)

(assert (=> b!1519003 (= e!847354 (= (seekEntry!0 (select (arr!48824 a!2804) j!70) a!2804 mask!2512) (Found!12995 j!70)))))

(declare-fun b!1518996 () Bool)

(declare-fun e!847351 () Bool)

(assert (=> b!1518996 (= e!847356 e!847351)))

(declare-fun res!1038905 () Bool)

(assert (=> b!1518996 (=> (not res!1038905) (not e!847351))))

(declare-fun lt!658447 () SeekEntryResult!12995)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518996 (= res!1038905 (= lt!658447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658444 mask!2512) lt!658444 lt!658448 mask!2512)))))

(assert (=> b!1518996 (= lt!658444 (select (store (arr!48824 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518996 (= lt!658448 (array!101175 (store (arr!48824 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49374 a!2804)))))

(declare-fun res!1038906 () Bool)

(assert (=> start!129318 (=> (not res!1038906) (not e!847352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129318 (= res!1038906 (validMask!0 mask!2512))))

(assert (=> start!129318 e!847352))

(assert (=> start!129318 true))

(declare-fun array_inv!37852 (array!101174) Bool)

(assert (=> start!129318 (array_inv!37852 a!2804)))

(declare-fun b!1519004 () Bool)

(declare-fun res!1038904 () Bool)

(assert (=> b!1519004 (=> (not res!1038904) (not e!847352))))

(assert (=> b!1519004 (= res!1038904 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49374 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49374 a!2804))))))

(declare-fun b!1519005 () Bool)

(declare-fun e!847353 () Bool)

(assert (=> b!1519005 (= e!847351 (not e!847353))))

(declare-fun res!1038897 () Bool)

(assert (=> b!1519005 (=> res!1038897 e!847353)))

(assert (=> b!1519005 (= res!1038897 (or (not (= (select (arr!48824 a!2804) j!70) lt!658444)) (= x!534 resX!21)))))

(assert (=> b!1519005 e!847354))

(declare-fun res!1038908 () Bool)

(assert (=> b!1519005 (=> (not res!1038908) (not e!847354))))

(assert (=> b!1519005 (= res!1038908 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658446 () Unit!50858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50858)

(assert (=> b!1519005 (= lt!658446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519006 () Bool)

(assert (=> b!1519006 (= e!847353 e!847355)))

(declare-fun res!1038899 () Bool)

(assert (=> b!1519006 (=> res!1038899 e!847355)))

(assert (=> b!1519006 (= res!1038899 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658449 #b00000000000000000000000000000000) (bvsge lt!658449 (size!49374 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519006 (= lt!658449 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519007 () Bool)

(assert (=> b!1519007 (= e!847352 e!847356)))

(declare-fun res!1038900 () Bool)

(assert (=> b!1519007 (=> (not res!1038900) (not e!847356))))

(assert (=> b!1519007 (= res!1038900 (= lt!658447 lt!658450))))

(assert (=> b!1519007 (= lt!658450 (Intermediate!12995 false resIndex!21 resX!21))))

(assert (=> b!1519007 (= lt!658447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48824 a!2804) j!70) mask!2512) (select (arr!48824 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129318 res!1038906) b!1518999))

(assert (= (and b!1518999 res!1038903) b!1519001))

(assert (= (and b!1519001 res!1038907) b!1519002))

(assert (= (and b!1519002 res!1038898) b!1518998))

(assert (= (and b!1518998 res!1038909) b!1519000))

(assert (= (and b!1519000 res!1038901) b!1519004))

(assert (= (and b!1519004 res!1038904) b!1519007))

(assert (= (and b!1519007 res!1038900) b!1518995))

(assert (= (and b!1518995 res!1038910) b!1518996))

(assert (= (and b!1518996 res!1038905) b!1519005))

(assert (= (and b!1519005 res!1038908) b!1519003))

(assert (= (and b!1519005 (not res!1038897)) b!1519006))

(assert (= (and b!1519006 (not res!1038899)) b!1518997))

(assert (= (and b!1518997 (not res!1038902)) b!1518994))

(declare-fun m!1402357 () Bool)

(assert (=> b!1518995 m!1402357))

(assert (=> b!1518995 m!1402357))

(declare-fun m!1402359 () Bool)

(assert (=> b!1518995 m!1402359))

(assert (=> b!1519007 m!1402357))

(assert (=> b!1519007 m!1402357))

(declare-fun m!1402361 () Bool)

(assert (=> b!1519007 m!1402361))

(assert (=> b!1519007 m!1402361))

(assert (=> b!1519007 m!1402357))

(declare-fun m!1402363 () Bool)

(assert (=> b!1519007 m!1402363))

(assert (=> b!1518994 m!1402357))

(assert (=> b!1518994 m!1402357))

(declare-fun m!1402365 () Bool)

(assert (=> b!1518994 m!1402365))

(declare-fun m!1402367 () Bool)

(assert (=> b!1518994 m!1402367))

(declare-fun m!1402369 () Bool)

(assert (=> b!1518994 m!1402369))

(assert (=> b!1518997 m!1402357))

(assert (=> b!1518997 m!1402357))

(declare-fun m!1402371 () Bool)

(assert (=> b!1518997 m!1402371))

(assert (=> b!1519002 m!1402357))

(assert (=> b!1519002 m!1402357))

(declare-fun m!1402373 () Bool)

(assert (=> b!1519002 m!1402373))

(declare-fun m!1402375 () Bool)

(assert (=> b!1518996 m!1402375))

(assert (=> b!1518996 m!1402375))

(declare-fun m!1402377 () Bool)

(assert (=> b!1518996 m!1402377))

(declare-fun m!1402379 () Bool)

(assert (=> b!1518996 m!1402379))

(declare-fun m!1402381 () Bool)

(assert (=> b!1518996 m!1402381))

(declare-fun m!1402383 () Bool)

(assert (=> b!1519006 m!1402383))

(declare-fun m!1402385 () Bool)

(assert (=> b!1518998 m!1402385))

(assert (=> b!1519003 m!1402357))

(assert (=> b!1519003 m!1402357))

(declare-fun m!1402387 () Bool)

(assert (=> b!1519003 m!1402387))

(declare-fun m!1402389 () Bool)

(assert (=> start!129318 m!1402389))

(declare-fun m!1402391 () Bool)

(assert (=> start!129318 m!1402391))

(assert (=> b!1519005 m!1402357))

(declare-fun m!1402393 () Bool)

(assert (=> b!1519005 m!1402393))

(declare-fun m!1402395 () Bool)

(assert (=> b!1519005 m!1402395))

(declare-fun m!1402397 () Bool)

(assert (=> b!1519000 m!1402397))

(declare-fun m!1402399 () Bool)

(assert (=> b!1519001 m!1402399))

(assert (=> b!1519001 m!1402399))

(declare-fun m!1402401 () Bool)

(assert (=> b!1519001 m!1402401))

(push 1)

