; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129322 () Bool)

(assert start!129322)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101178 0))(
  ( (array!101179 (arr!48826 (Array (_ BitVec 32) (_ BitVec 64))) (size!49376 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101178)

(declare-fun e!847393 () Bool)

(declare-fun b!1519078 () Bool)

(declare-datatypes ((SeekEntryResult!12997 0))(
  ( (MissingZero!12997 (index!54383 (_ BitVec 32))) (Found!12997 (index!54384 (_ BitVec 32))) (Intermediate!12997 (undefined!13809 Bool) (index!54385 (_ BitVec 32)) (x!136051 (_ BitVec 32))) (Undefined!12997) (MissingVacant!12997 (index!54386 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101178 (_ BitVec 32)) SeekEntryResult!12997)

(assert (=> b!1519078 (= e!847393 (= (seekEntry!0 (select (arr!48826 a!2804) j!70) a!2804 mask!2512) (Found!12997 j!70)))))

(declare-fun b!1519079 () Bool)

(declare-fun e!847394 () Bool)

(declare-fun e!847395 () Bool)

(assert (=> b!1519079 (= e!847394 e!847395)))

(declare-fun res!1038987 () Bool)

(assert (=> b!1519079 (=> res!1038987 e!847395)))

(declare-fun lt!658488 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519079 (= res!1038987 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658488 #b00000000000000000000000000000000) (bvsge lt!658488 (size!49376 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519079 (= lt!658488 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519080 () Bool)

(assert (=> b!1519080 (= e!847395 true)))

(declare-fun lt!658486 () (_ BitVec 64))

(declare-fun lt!658489 () array!101178)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101178 (_ BitVec 32)) SeekEntryResult!12997)

(assert (=> b!1519080 (= (seekEntryOrOpen!0 (select (arr!48826 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658486 lt!658489 mask!2512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((Unit!50862 0))(
  ( (Unit!50863) )
))
(declare-fun lt!658487 () Unit!50862)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50862)

(assert (=> b!1519080 (= lt!658487 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658488 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1519081 () Bool)

(declare-fun res!1038983 () Bool)

(declare-fun e!847396 () Bool)

(assert (=> b!1519081 (=> (not res!1038983) (not e!847396))))

(assert (=> b!1519081 (= res!1038983 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49376 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49376 a!2804))))))

(declare-fun b!1519082 () Bool)

(declare-fun e!847397 () Bool)

(assert (=> b!1519082 (= e!847396 e!847397)))

(declare-fun res!1038994 () Bool)

(assert (=> b!1519082 (=> (not res!1038994) (not e!847397))))

(declare-fun lt!658491 () SeekEntryResult!12997)

(declare-fun lt!658492 () SeekEntryResult!12997)

(assert (=> b!1519082 (= res!1038994 (= lt!658491 lt!658492))))

(assert (=> b!1519082 (= lt!658492 (Intermediate!12997 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101178 (_ BitVec 32)) SeekEntryResult!12997)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519082 (= lt!658491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48826 a!2804) j!70) mask!2512) (select (arr!48826 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519083 () Bool)

(declare-fun res!1038991 () Bool)

(assert (=> b!1519083 (=> (not res!1038991) (not e!847396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519083 (= res!1038991 (validKeyInArray!0 (select (arr!48826 a!2804) j!70)))))

(declare-fun b!1519084 () Bool)

(declare-fun e!847398 () Bool)

(assert (=> b!1519084 (= e!847397 e!847398)))

(declare-fun res!1038993 () Bool)

(assert (=> b!1519084 (=> (not res!1038993) (not e!847398))))

(assert (=> b!1519084 (= res!1038993 (= lt!658491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658486 mask!2512) lt!658486 lt!658489 mask!2512)))))

(assert (=> b!1519084 (= lt!658486 (select (store (arr!48826 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519084 (= lt!658489 (array!101179 (store (arr!48826 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49376 a!2804)))))

(declare-fun b!1519085 () Bool)

(declare-fun res!1038986 () Bool)

(assert (=> b!1519085 (=> (not res!1038986) (not e!847396))))

(assert (=> b!1519085 (= res!1038986 (and (= (size!49376 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49376 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49376 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519086 () Bool)

(declare-fun res!1038985 () Bool)

(assert (=> b!1519086 (=> (not res!1038985) (not e!847397))))

(assert (=> b!1519086 (= res!1038985 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48826 a!2804) j!70) a!2804 mask!2512) lt!658492))))

(declare-fun b!1519087 () Bool)

(declare-fun res!1038981 () Bool)

(assert (=> b!1519087 (=> (not res!1038981) (not e!847396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101178 (_ BitVec 32)) Bool)

(assert (=> b!1519087 (= res!1038981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519088 () Bool)

(declare-fun res!1038990 () Bool)

(assert (=> b!1519088 (=> (not res!1038990) (not e!847396))))

(assert (=> b!1519088 (= res!1038990 (validKeyInArray!0 (select (arr!48826 a!2804) i!961)))))

(declare-fun b!1519089 () Bool)

(declare-fun res!1038982 () Bool)

(assert (=> b!1519089 (=> res!1038982 e!847395)))

(assert (=> b!1519089 (= res!1038982 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658488 (select (arr!48826 a!2804) j!70) a!2804 mask!2512) lt!658492)))))

(declare-fun res!1038992 () Bool)

(assert (=> start!129322 (=> (not res!1038992) (not e!847396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129322 (= res!1038992 (validMask!0 mask!2512))))

(assert (=> start!129322 e!847396))

(assert (=> start!129322 true))

(declare-fun array_inv!37854 (array!101178) Bool)

(assert (=> start!129322 (array_inv!37854 a!2804)))

(declare-fun b!1519090 () Bool)

(declare-fun res!1038988 () Bool)

(assert (=> b!1519090 (=> (not res!1038988) (not e!847396))))

(declare-datatypes ((List!35309 0))(
  ( (Nil!35306) (Cons!35305 (h!36717 (_ BitVec 64)) (t!50003 List!35309)) )
))
(declare-fun arrayNoDuplicates!0 (array!101178 (_ BitVec 32) List!35309) Bool)

(assert (=> b!1519090 (= res!1038988 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35306))))

(declare-fun b!1519091 () Bool)

(assert (=> b!1519091 (= e!847398 (not e!847394))))

(declare-fun res!1038989 () Bool)

(assert (=> b!1519091 (=> res!1038989 e!847394)))

(assert (=> b!1519091 (= res!1038989 (or (not (= (select (arr!48826 a!2804) j!70) lt!658486)) (= x!534 resX!21)))))

(assert (=> b!1519091 e!847393))

(declare-fun res!1038984 () Bool)

(assert (=> b!1519091 (=> (not res!1038984) (not e!847393))))

(assert (=> b!1519091 (= res!1038984 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658490 () Unit!50862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50862)

(assert (=> b!1519091 (= lt!658490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129322 res!1038992) b!1519085))

(assert (= (and b!1519085 res!1038986) b!1519088))

(assert (= (and b!1519088 res!1038990) b!1519083))

(assert (= (and b!1519083 res!1038991) b!1519087))

(assert (= (and b!1519087 res!1038981) b!1519090))

(assert (= (and b!1519090 res!1038988) b!1519081))

(assert (= (and b!1519081 res!1038983) b!1519082))

(assert (= (and b!1519082 res!1038994) b!1519086))

(assert (= (and b!1519086 res!1038985) b!1519084))

(assert (= (and b!1519084 res!1038993) b!1519091))

(assert (= (and b!1519091 res!1038984) b!1519078))

(assert (= (and b!1519091 (not res!1038989)) b!1519079))

(assert (= (and b!1519079 (not res!1038987)) b!1519089))

(assert (= (and b!1519089 (not res!1038982)) b!1519080))

(declare-fun m!1402449 () Bool)

(assert (=> start!129322 m!1402449))

(declare-fun m!1402451 () Bool)

(assert (=> start!129322 m!1402451))

(declare-fun m!1402453 () Bool)

(assert (=> b!1519083 m!1402453))

(assert (=> b!1519083 m!1402453))

(declare-fun m!1402455 () Bool)

(assert (=> b!1519083 m!1402455))

(declare-fun m!1402457 () Bool)

(assert (=> b!1519090 m!1402457))

(assert (=> b!1519078 m!1402453))

(assert (=> b!1519078 m!1402453))

(declare-fun m!1402459 () Bool)

(assert (=> b!1519078 m!1402459))

(assert (=> b!1519091 m!1402453))

(declare-fun m!1402461 () Bool)

(assert (=> b!1519091 m!1402461))

(declare-fun m!1402463 () Bool)

(assert (=> b!1519091 m!1402463))

(assert (=> b!1519082 m!1402453))

(assert (=> b!1519082 m!1402453))

(declare-fun m!1402465 () Bool)

(assert (=> b!1519082 m!1402465))

(assert (=> b!1519082 m!1402465))

(assert (=> b!1519082 m!1402453))

(declare-fun m!1402467 () Bool)

(assert (=> b!1519082 m!1402467))

(declare-fun m!1402469 () Bool)

(assert (=> b!1519079 m!1402469))

(assert (=> b!1519089 m!1402453))

(assert (=> b!1519089 m!1402453))

(declare-fun m!1402471 () Bool)

(assert (=> b!1519089 m!1402471))

(assert (=> b!1519080 m!1402453))

(assert (=> b!1519080 m!1402453))

(declare-fun m!1402473 () Bool)

(assert (=> b!1519080 m!1402473))

(declare-fun m!1402475 () Bool)

(assert (=> b!1519080 m!1402475))

(declare-fun m!1402477 () Bool)

(assert (=> b!1519080 m!1402477))

(declare-fun m!1402479 () Bool)

(assert (=> b!1519084 m!1402479))

(assert (=> b!1519084 m!1402479))

(declare-fun m!1402481 () Bool)

(assert (=> b!1519084 m!1402481))

(declare-fun m!1402483 () Bool)

(assert (=> b!1519084 m!1402483))

(declare-fun m!1402485 () Bool)

(assert (=> b!1519084 m!1402485))

(declare-fun m!1402487 () Bool)

(assert (=> b!1519088 m!1402487))

(assert (=> b!1519088 m!1402487))

(declare-fun m!1402489 () Bool)

(assert (=> b!1519088 m!1402489))

(assert (=> b!1519086 m!1402453))

(assert (=> b!1519086 m!1402453))

(declare-fun m!1402491 () Bool)

(assert (=> b!1519086 m!1402491))

(declare-fun m!1402493 () Bool)

(assert (=> b!1519087 m!1402493))

(push 1)

(assert (not b!1519091))

(assert (not start!129322))

(assert (not b!1519087))

(assert (not b!1519082))

(assert (not b!1519089))

(assert (not b!1519079))

(assert (not b!1519084))

(assert (not b!1519078))

(assert (not b!1519090))

(assert (not b!1519086))

(assert (not b!1519088))

(assert (not b!1519083))

(assert (not b!1519080))

(check-sat)

