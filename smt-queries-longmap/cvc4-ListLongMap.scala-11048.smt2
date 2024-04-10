; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129124 () Bool)

(assert start!129124)

(declare-fun b!1515236 () Bool)

(declare-fun res!1035144 () Bool)

(declare-fun e!845576 () Bool)

(assert (=> b!1515236 (=> (not res!1035144) (not e!845576))))

(declare-datatypes ((SeekEntryResult!12898 0))(
  ( (MissingZero!12898 (index!53987 (_ BitVec 32))) (Found!12898 (index!53988 (_ BitVec 32))) (Intermediate!12898 (undefined!13710 Bool) (index!53989 (_ BitVec 32)) (x!135688 (_ BitVec 32))) (Undefined!12898) (MissingVacant!12898 (index!53990 (_ BitVec 32))) )
))
(declare-fun lt!656718 () SeekEntryResult!12898)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100980 0))(
  ( (array!100981 (arr!48727 (Array (_ BitVec 32) (_ BitVec 64))) (size!49277 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100980)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100980 (_ BitVec 32)) SeekEntryResult!12898)

(assert (=> b!1515236 (= res!1035144 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48727 a!2804) j!70) a!2804 mask!2512) lt!656718))))

(declare-fun b!1515237 () Bool)

(declare-fun res!1035145 () Bool)

(declare-fun e!845580 () Bool)

(assert (=> b!1515237 (=> (not res!1035145) (not e!845580))))

(declare-datatypes ((List!35210 0))(
  ( (Nil!35207) (Cons!35206 (h!36618 (_ BitVec 64)) (t!49904 List!35210)) )
))
(declare-fun arrayNoDuplicates!0 (array!100980 (_ BitVec 32) List!35210) Bool)

(assert (=> b!1515237 (= res!1035145 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35207))))

(declare-fun b!1515238 () Bool)

(declare-fun e!845581 () Bool)

(declare-fun e!845577 () Bool)

(assert (=> b!1515238 (= e!845581 (not e!845577))))

(declare-fun res!1035149 () Bool)

(assert (=> b!1515238 (=> res!1035149 e!845577)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!656711 () (_ BitVec 64))

(assert (=> b!1515238 (= res!1035149 (or (not (= (select (arr!48727 a!2804) j!70) lt!656711)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48727 a!2804) index!487) (select (arr!48727 a!2804) j!70)) (not (= (select (arr!48727 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845578 () Bool)

(assert (=> b!1515238 e!845578))

(declare-fun res!1035148 () Bool)

(assert (=> b!1515238 (=> (not res!1035148) (not e!845578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100980 (_ BitVec 32)) Bool)

(assert (=> b!1515238 (= res!1035148 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50664 0))(
  ( (Unit!50665) )
))
(declare-fun lt!656715 () Unit!50664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50664)

(assert (=> b!1515238 (= lt!656715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515239 () Bool)

(declare-fun res!1035150 () Bool)

(assert (=> b!1515239 (=> (not res!1035150) (not e!845580))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515239 (= res!1035150 (validKeyInArray!0 (select (arr!48727 a!2804) i!961)))))

(declare-fun b!1515240 () Bool)

(declare-fun res!1035142 () Bool)

(assert (=> b!1515240 (=> (not res!1035142) (not e!845580))))

(assert (=> b!1515240 (= res!1035142 (validKeyInArray!0 (select (arr!48727 a!2804) j!70)))))

(declare-fun b!1515241 () Bool)

(assert (=> b!1515241 (= e!845580 e!845576)))

(declare-fun res!1035143 () Bool)

(assert (=> b!1515241 (=> (not res!1035143) (not e!845576))))

(declare-fun lt!656714 () SeekEntryResult!12898)

(assert (=> b!1515241 (= res!1035143 (= lt!656714 lt!656718))))

(assert (=> b!1515241 (= lt!656718 (Intermediate!12898 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515241 (= lt!656714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48727 a!2804) j!70) mask!2512) (select (arr!48727 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515242 () Bool)

(declare-fun res!1035141 () Bool)

(assert (=> b!1515242 (=> (not res!1035141) (not e!845580))))

(assert (=> b!1515242 (= res!1035141 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49277 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49277 a!2804))))))

(declare-fun b!1515243 () Bool)

(declare-fun res!1035139 () Bool)

(assert (=> b!1515243 (=> (not res!1035139) (not e!845580))))

(assert (=> b!1515243 (= res!1035139 (and (= (size!49277 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49277 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49277 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515244 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100980 (_ BitVec 32)) SeekEntryResult!12898)

(assert (=> b!1515244 (= e!845578 (= (seekEntry!0 (select (arr!48727 a!2804) j!70) a!2804 mask!2512) (Found!12898 j!70)))))

(declare-fun b!1515245 () Bool)

(assert (=> b!1515245 (= e!845576 e!845581)))

(declare-fun res!1035140 () Bool)

(assert (=> b!1515245 (=> (not res!1035140) (not e!845581))))

(declare-fun lt!656717 () array!100980)

(assert (=> b!1515245 (= res!1035140 (= lt!656714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656711 mask!2512) lt!656711 lt!656717 mask!2512)))))

(assert (=> b!1515245 (= lt!656711 (select (store (arr!48727 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515245 (= lt!656717 (array!100981 (store (arr!48727 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49277 a!2804)))))

(declare-fun b!1515246 () Bool)

(declare-fun res!1035147 () Bool)

(assert (=> b!1515246 (=> (not res!1035147) (not e!845580))))

(assert (=> b!1515246 (= res!1035147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515247 () Bool)

(declare-fun e!845579 () Bool)

(assert (=> b!1515247 (= e!845577 e!845579)))

(declare-fun res!1035151 () Bool)

(assert (=> b!1515247 (=> res!1035151 e!845579)))

(declare-fun lt!656719 () SeekEntryResult!12898)

(assert (=> b!1515247 (= res!1035151 (not (= lt!656719 (Found!12898 j!70))))))

(declare-fun lt!656712 () SeekEntryResult!12898)

(declare-fun lt!656716 () SeekEntryResult!12898)

(assert (=> b!1515247 (= lt!656712 lt!656716)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100980 (_ BitVec 32)) SeekEntryResult!12898)

(assert (=> b!1515247 (= lt!656716 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656711 lt!656717 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100980 (_ BitVec 32)) SeekEntryResult!12898)

(assert (=> b!1515247 (= lt!656712 (seekEntryOrOpen!0 lt!656711 lt!656717 mask!2512))))

(declare-fun lt!656710 () SeekEntryResult!12898)

(assert (=> b!1515247 (= lt!656710 lt!656719)))

(assert (=> b!1515247 (= lt!656719 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48727 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515247 (= lt!656710 (seekEntryOrOpen!0 (select (arr!48727 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515248 () Bool)

(assert (=> b!1515248 (= e!845579 (bvsge mask!2512 #b00000000000000000000000000000000))))

(assert (=> b!1515248 (= lt!656716 lt!656719)))

(declare-fun lt!656713 () Unit!50664)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50664)

(assert (=> b!1515248 (= lt!656713 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun res!1035146 () Bool)

(assert (=> start!129124 (=> (not res!1035146) (not e!845580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129124 (= res!1035146 (validMask!0 mask!2512))))

(assert (=> start!129124 e!845580))

(assert (=> start!129124 true))

(declare-fun array_inv!37755 (array!100980) Bool)

(assert (=> start!129124 (array_inv!37755 a!2804)))

(assert (= (and start!129124 res!1035146) b!1515243))

(assert (= (and b!1515243 res!1035139) b!1515239))

(assert (= (and b!1515239 res!1035150) b!1515240))

(assert (= (and b!1515240 res!1035142) b!1515246))

(assert (= (and b!1515246 res!1035147) b!1515237))

(assert (= (and b!1515237 res!1035145) b!1515242))

(assert (= (and b!1515242 res!1035141) b!1515241))

(assert (= (and b!1515241 res!1035143) b!1515236))

(assert (= (and b!1515236 res!1035144) b!1515245))

(assert (= (and b!1515245 res!1035140) b!1515238))

(assert (= (and b!1515238 res!1035148) b!1515244))

(assert (= (and b!1515238 (not res!1035149)) b!1515247))

(assert (= (and b!1515247 (not res!1035151)) b!1515248))

(declare-fun m!1398295 () Bool)

(assert (=> b!1515238 m!1398295))

(declare-fun m!1398297 () Bool)

(assert (=> b!1515238 m!1398297))

(declare-fun m!1398299 () Bool)

(assert (=> b!1515238 m!1398299))

(declare-fun m!1398301 () Bool)

(assert (=> b!1515238 m!1398301))

(assert (=> b!1515236 m!1398295))

(assert (=> b!1515236 m!1398295))

(declare-fun m!1398303 () Bool)

(assert (=> b!1515236 m!1398303))

(assert (=> b!1515240 m!1398295))

(assert (=> b!1515240 m!1398295))

(declare-fun m!1398305 () Bool)

(assert (=> b!1515240 m!1398305))

(declare-fun m!1398307 () Bool)

(assert (=> b!1515248 m!1398307))

(declare-fun m!1398309 () Bool)

(assert (=> b!1515237 m!1398309))

(declare-fun m!1398311 () Bool)

(assert (=> b!1515246 m!1398311))

(declare-fun m!1398313 () Bool)

(assert (=> b!1515245 m!1398313))

(assert (=> b!1515245 m!1398313))

(declare-fun m!1398315 () Bool)

(assert (=> b!1515245 m!1398315))

(declare-fun m!1398317 () Bool)

(assert (=> b!1515245 m!1398317))

(declare-fun m!1398319 () Bool)

(assert (=> b!1515245 m!1398319))

(declare-fun m!1398321 () Bool)

(assert (=> start!129124 m!1398321))

(declare-fun m!1398323 () Bool)

(assert (=> start!129124 m!1398323))

(declare-fun m!1398325 () Bool)

(assert (=> b!1515239 m!1398325))

(assert (=> b!1515239 m!1398325))

(declare-fun m!1398327 () Bool)

(assert (=> b!1515239 m!1398327))

(assert (=> b!1515247 m!1398295))

(declare-fun m!1398329 () Bool)

(assert (=> b!1515247 m!1398329))

(assert (=> b!1515247 m!1398295))

(declare-fun m!1398331 () Bool)

(assert (=> b!1515247 m!1398331))

(declare-fun m!1398333 () Bool)

(assert (=> b!1515247 m!1398333))

(assert (=> b!1515247 m!1398295))

(declare-fun m!1398335 () Bool)

(assert (=> b!1515247 m!1398335))

(assert (=> b!1515244 m!1398295))

(assert (=> b!1515244 m!1398295))

(declare-fun m!1398337 () Bool)

(assert (=> b!1515244 m!1398337))

(assert (=> b!1515241 m!1398295))

(assert (=> b!1515241 m!1398295))

(declare-fun m!1398339 () Bool)

(assert (=> b!1515241 m!1398339))

(assert (=> b!1515241 m!1398339))

(assert (=> b!1515241 m!1398295))

(declare-fun m!1398341 () Bool)

(assert (=> b!1515241 m!1398341))

(push 1)

(assert (not b!1515241))

