; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129340 () Bool)

(assert start!129340)

(declare-fun b!1519464 () Bool)

(declare-fun e!847592 () Bool)

(declare-fun e!847595 () Bool)

(assert (=> b!1519464 (= e!847592 e!847595)))

(declare-fun res!1039376 () Bool)

(assert (=> b!1519464 (=> res!1039376 e!847595)))

(declare-datatypes ((array!101196 0))(
  ( (array!101197 (arr!48835 (Array (_ BitVec 32) (_ BitVec 64))) (size!49385 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101196)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!658679 () (_ BitVec 32))

(assert (=> b!1519464 (= res!1039376 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658679 #b00000000000000000000000000000000) (bvsge lt!658679 (size!49385 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519464 (= lt!658679 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519465 () Bool)

(declare-fun res!1039381 () Bool)

(declare-fun e!847591 () Bool)

(assert (=> b!1519465 (=> (not res!1039381) (not e!847591))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519465 (= res!1039381 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49385 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49385 a!2804))))))

(declare-fun b!1519466 () Bool)

(declare-fun e!847593 () Bool)

(declare-fun e!847597 () Bool)

(assert (=> b!1519466 (= e!847593 e!847597)))

(declare-fun res!1039380 () Bool)

(assert (=> b!1519466 (=> (not res!1039380) (not e!847597))))

(declare-fun lt!658678 () (_ BitVec 64))

(declare-fun lt!658681 () array!101196)

(declare-datatypes ((SeekEntryResult!13006 0))(
  ( (MissingZero!13006 (index!54419 (_ BitVec 32))) (Found!13006 (index!54420 (_ BitVec 32))) (Intermediate!13006 (undefined!13818 Bool) (index!54421 (_ BitVec 32)) (x!136084 (_ BitVec 32))) (Undefined!13006) (MissingVacant!13006 (index!54422 (_ BitVec 32))) )
))
(declare-fun lt!658675 () SeekEntryResult!13006)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101196 (_ BitVec 32)) SeekEntryResult!13006)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519466 (= res!1039380 (= lt!658675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658678 mask!2512) lt!658678 lt!658681 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1519466 (= lt!658678 (select (store (arr!48835 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519466 (= lt!658681 (array!101197 (store (arr!48835 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49385 a!2804)))))

(declare-fun b!1519467 () Bool)

(declare-fun res!1039370 () Bool)

(assert (=> b!1519467 (=> (not res!1039370) (not e!847591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101196 (_ BitVec 32)) Bool)

(assert (=> b!1519467 (= res!1039370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1039371 () Bool)

(assert (=> start!129340 (=> (not res!1039371) (not e!847591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129340 (= res!1039371 (validMask!0 mask!2512))))

(assert (=> start!129340 e!847591))

(assert (=> start!129340 true))

(declare-fun array_inv!37863 (array!101196) Bool)

(assert (=> start!129340 (array_inv!37863 a!2804)))

(declare-fun b!1519468 () Bool)

(assert (=> b!1519468 (= e!847597 (not e!847592))))

(declare-fun res!1039372 () Bool)

(assert (=> b!1519468 (=> res!1039372 e!847592)))

(assert (=> b!1519468 (= res!1039372 (or (not (= (select (arr!48835 a!2804) j!70) lt!658678)) (= x!534 resX!21)))))

(declare-fun e!847596 () Bool)

(assert (=> b!1519468 e!847596))

(declare-fun res!1039379 () Bool)

(assert (=> b!1519468 (=> (not res!1039379) (not e!847596))))

(assert (=> b!1519468 (= res!1039379 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50880 0))(
  ( (Unit!50881) )
))
(declare-fun lt!658680 () Unit!50880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50880)

(assert (=> b!1519468 (= lt!658680 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519469 () Bool)

(assert (=> b!1519469 (= e!847591 e!847593)))

(declare-fun res!1039375 () Bool)

(assert (=> b!1519469 (=> (not res!1039375) (not e!847593))))

(declare-fun lt!658677 () SeekEntryResult!13006)

(assert (=> b!1519469 (= res!1039375 (= lt!658675 lt!658677))))

(assert (=> b!1519469 (= lt!658677 (Intermediate!13006 false resIndex!21 resX!21))))

(assert (=> b!1519469 (= lt!658675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48835 a!2804) j!70) mask!2512) (select (arr!48835 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519470 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101196 (_ BitVec 32)) SeekEntryResult!13006)

(assert (=> b!1519470 (= e!847596 (= (seekEntry!0 (select (arr!48835 a!2804) j!70) a!2804 mask!2512) (Found!13006 j!70)))))

(declare-fun b!1519471 () Bool)

(declare-fun res!1039377 () Bool)

(assert (=> b!1519471 (=> (not res!1039377) (not e!847591))))

(assert (=> b!1519471 (= res!1039377 (and (= (size!49385 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49385 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49385 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519472 () Bool)

(declare-fun e!847594 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519472 (= e!847594 (validKeyInArray!0 lt!658678))))

(declare-fun b!1519473 () Bool)

(declare-fun res!1039368 () Bool)

(assert (=> b!1519473 (=> (not res!1039368) (not e!847593))))

(assert (=> b!1519473 (= res!1039368 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48835 a!2804) j!70) a!2804 mask!2512) lt!658677))))

(declare-fun b!1519474 () Bool)

(declare-fun res!1039369 () Bool)

(assert (=> b!1519474 (=> (not res!1039369) (not e!847591))))

(assert (=> b!1519474 (= res!1039369 (validKeyInArray!0 (select (arr!48835 a!2804) i!961)))))

(declare-fun b!1519475 () Bool)

(declare-fun res!1039378 () Bool)

(assert (=> b!1519475 (=> (not res!1039378) (not e!847591))))

(declare-datatypes ((List!35318 0))(
  ( (Nil!35315) (Cons!35314 (h!36726 (_ BitVec 64)) (t!50012 List!35318)) )
))
(declare-fun arrayNoDuplicates!0 (array!101196 (_ BitVec 32) List!35318) Bool)

(assert (=> b!1519475 (= res!1039378 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35315))))

(declare-fun b!1519476 () Bool)

(declare-fun res!1039373 () Bool)

(assert (=> b!1519476 (=> res!1039373 e!847595)))

(assert (=> b!1519476 (= res!1039373 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658679 (select (arr!48835 a!2804) j!70) a!2804 mask!2512) lt!658677)))))

(declare-fun b!1519477 () Bool)

(assert (=> b!1519477 (= e!847595 e!847594)))

(declare-fun res!1039374 () Bool)

(assert (=> b!1519477 (=> res!1039374 e!847594)))

(assert (=> b!1519477 (= res!1039374 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101196 (_ BitVec 32)) SeekEntryResult!13006)

(assert (=> b!1519477 (= (seekEntryOrOpen!0 (select (arr!48835 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658678 lt!658681 mask!2512))))

(declare-fun lt!658676 () Unit!50880)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50880)

(assert (=> b!1519477 (= lt!658676 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658679 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1519478 () Bool)

(declare-fun res!1039367 () Bool)

(assert (=> b!1519478 (=> (not res!1039367) (not e!847591))))

(assert (=> b!1519478 (= res!1039367 (validKeyInArray!0 (select (arr!48835 a!2804) j!70)))))

(assert (= (and start!129340 res!1039371) b!1519471))

(assert (= (and b!1519471 res!1039377) b!1519474))

(assert (= (and b!1519474 res!1039369) b!1519478))

(assert (= (and b!1519478 res!1039367) b!1519467))

(assert (= (and b!1519467 res!1039370) b!1519475))

(assert (= (and b!1519475 res!1039378) b!1519465))

(assert (= (and b!1519465 res!1039381) b!1519469))

(assert (= (and b!1519469 res!1039375) b!1519473))

(assert (= (and b!1519473 res!1039368) b!1519466))

(assert (= (and b!1519466 res!1039380) b!1519468))

(assert (= (and b!1519468 res!1039379) b!1519470))

(assert (= (and b!1519468 (not res!1039372)) b!1519464))

(assert (= (and b!1519464 (not res!1039376)) b!1519476))

(assert (= (and b!1519476 (not res!1039373)) b!1519477))

(assert (= (and b!1519477 (not res!1039374)) b!1519472))

(declare-fun m!1402867 () Bool)

(assert (=> b!1519473 m!1402867))

(assert (=> b!1519473 m!1402867))

(declare-fun m!1402869 () Bool)

(assert (=> b!1519473 m!1402869))

(declare-fun m!1402871 () Bool)

(assert (=> b!1519474 m!1402871))

(assert (=> b!1519474 m!1402871))

(declare-fun m!1402873 () Bool)

(assert (=> b!1519474 m!1402873))

(assert (=> b!1519478 m!1402867))

(assert (=> b!1519478 m!1402867))

(declare-fun m!1402875 () Bool)

(assert (=> b!1519478 m!1402875))

(assert (=> b!1519476 m!1402867))

(assert (=> b!1519476 m!1402867))

(declare-fun m!1402877 () Bool)

(assert (=> b!1519476 m!1402877))

(assert (=> b!1519470 m!1402867))

(assert (=> b!1519470 m!1402867))

(declare-fun m!1402879 () Bool)

(assert (=> b!1519470 m!1402879))

(assert (=> b!1519477 m!1402867))

(assert (=> b!1519477 m!1402867))

(declare-fun m!1402881 () Bool)

(assert (=> b!1519477 m!1402881))

(declare-fun m!1402883 () Bool)

(assert (=> b!1519477 m!1402883))

(declare-fun m!1402885 () Bool)

(assert (=> b!1519477 m!1402885))

(declare-fun m!1402887 () Bool)

(assert (=> b!1519467 m!1402887))

(assert (=> b!1519469 m!1402867))

(assert (=> b!1519469 m!1402867))

(declare-fun m!1402889 () Bool)

(assert (=> b!1519469 m!1402889))

(assert (=> b!1519469 m!1402889))

(assert (=> b!1519469 m!1402867))

(declare-fun m!1402891 () Bool)

(assert (=> b!1519469 m!1402891))

(declare-fun m!1402893 () Bool)

(assert (=> b!1519472 m!1402893))

(declare-fun m!1402895 () Bool)

(assert (=> b!1519475 m!1402895))

(declare-fun m!1402897 () Bool)

(assert (=> b!1519464 m!1402897))

(declare-fun m!1402899 () Bool)

(assert (=> start!129340 m!1402899))

(declare-fun m!1402901 () Bool)

(assert (=> start!129340 m!1402901))

(declare-fun m!1402903 () Bool)

(assert (=> b!1519466 m!1402903))

(assert (=> b!1519466 m!1402903))

(declare-fun m!1402905 () Bool)

(assert (=> b!1519466 m!1402905))

(declare-fun m!1402907 () Bool)

(assert (=> b!1519466 m!1402907))

(declare-fun m!1402909 () Bool)

(assert (=> b!1519466 m!1402909))

(assert (=> b!1519468 m!1402867))

(declare-fun m!1402911 () Bool)

(assert (=> b!1519468 m!1402911))

(declare-fun m!1402913 () Bool)

(assert (=> b!1519468 m!1402913))

(push 1)

