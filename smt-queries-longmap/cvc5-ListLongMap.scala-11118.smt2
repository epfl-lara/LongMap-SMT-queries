; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129872 () Bool)

(assert start!129872)

(declare-fun b!1524238 () Bool)

(declare-fun res!1042897 () Bool)

(declare-fun e!849726 () Bool)

(assert (=> b!1524238 (=> (not res!1042897) (not e!849726))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101411 0))(
  ( (array!101412 (arr!48935 (Array (_ BitVec 32) (_ BitVec 64))) (size!49485 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101411)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524238 (= res!1042897 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49485 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49485 a!2804))))))

(declare-fun b!1524239 () Bool)

(declare-fun res!1042896 () Bool)

(assert (=> b!1524239 (=> (not res!1042896) (not e!849726))))

(declare-datatypes ((List!35418 0))(
  ( (Nil!35415) (Cons!35414 (h!36841 (_ BitVec 64)) (t!50112 List!35418)) )
))
(declare-fun arrayNoDuplicates!0 (array!101411 (_ BitVec 32) List!35418) Bool)

(assert (=> b!1524239 (= res!1042896 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35415))))

(declare-fun b!1524240 () Bool)

(declare-fun res!1042899 () Bool)

(declare-fun e!849727 () Bool)

(assert (=> b!1524240 (=> (not res!1042899) (not e!849727))))

(declare-datatypes ((SeekEntryResult!13100 0))(
  ( (MissingZero!13100 (index!54795 (_ BitVec 32))) (Found!13100 (index!54796 (_ BitVec 32))) (Intermediate!13100 (undefined!13912 Bool) (index!54797 (_ BitVec 32)) (x!136488 (_ BitVec 32))) (Undefined!13100) (MissingVacant!13100 (index!54798 (_ BitVec 32))) )
))
(declare-fun lt!660260 () SeekEntryResult!13100)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101411 (_ BitVec 32)) SeekEntryResult!13100)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524240 (= res!1042899 (= lt!660260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48935 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48935 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101412 (store (arr!48935 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49485 a!2804)) mask!2512)))))

(declare-fun res!1042891 () Bool)

(assert (=> start!129872 (=> (not res!1042891) (not e!849726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129872 (= res!1042891 (validMask!0 mask!2512))))

(assert (=> start!129872 e!849726))

(assert (=> start!129872 true))

(declare-fun array_inv!37963 (array!101411) Bool)

(assert (=> start!129872 (array_inv!37963 a!2804)))

(declare-fun b!1524241 () Bool)

(declare-fun res!1042890 () Bool)

(assert (=> b!1524241 (=> (not res!1042890) (not e!849726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524241 (= res!1042890 (validKeyInArray!0 (select (arr!48935 a!2804) j!70)))))

(declare-fun b!1524242 () Bool)

(declare-fun res!1042893 () Bool)

(assert (=> b!1524242 (=> (not res!1042893) (not e!849727))))

(declare-fun lt!660262 () SeekEntryResult!13100)

(assert (=> b!1524242 (= res!1042893 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48935 a!2804) j!70) a!2804 mask!2512) lt!660262))))

(declare-fun b!1524243 () Bool)

(declare-fun res!1042898 () Bool)

(assert (=> b!1524243 (=> (not res!1042898) (not e!849726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101411 (_ BitVec 32)) Bool)

(assert (=> b!1524243 (= res!1042898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524244 () Bool)

(assert (=> b!1524244 (= e!849726 e!849727)))

(declare-fun res!1042895 () Bool)

(assert (=> b!1524244 (=> (not res!1042895) (not e!849727))))

(assert (=> b!1524244 (= res!1042895 (= lt!660260 lt!660262))))

(assert (=> b!1524244 (= lt!660262 (Intermediate!13100 false resIndex!21 resX!21))))

(assert (=> b!1524244 (= lt!660260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48935 a!2804) j!70) mask!2512) (select (arr!48935 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524245 () Bool)

(declare-fun res!1042892 () Bool)

(assert (=> b!1524245 (=> (not res!1042892) (not e!849726))))

(assert (=> b!1524245 (= res!1042892 (validKeyInArray!0 (select (arr!48935 a!2804) i!961)))))

(declare-fun b!1524246 () Bool)

(assert (=> b!1524246 (= e!849727 (not true))))

(declare-fun e!849725 () Bool)

(assert (=> b!1524246 e!849725))

(declare-fun res!1042900 () Bool)

(assert (=> b!1524246 (=> (not res!1042900) (not e!849725))))

(assert (=> b!1524246 (= res!1042900 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50984 0))(
  ( (Unit!50985) )
))
(declare-fun lt!660261 () Unit!50984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50984)

(assert (=> b!1524246 (= lt!660261 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524247 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101411 (_ BitVec 32)) SeekEntryResult!13100)

(assert (=> b!1524247 (= e!849725 (= (seekEntry!0 (select (arr!48935 a!2804) j!70) a!2804 mask!2512) (Found!13100 j!70)))))

(declare-fun b!1524248 () Bool)

(declare-fun res!1042894 () Bool)

(assert (=> b!1524248 (=> (not res!1042894) (not e!849726))))

(assert (=> b!1524248 (= res!1042894 (and (= (size!49485 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49485 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49485 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129872 res!1042891) b!1524248))

(assert (= (and b!1524248 res!1042894) b!1524245))

(assert (= (and b!1524245 res!1042892) b!1524241))

(assert (= (and b!1524241 res!1042890) b!1524243))

(assert (= (and b!1524243 res!1042898) b!1524239))

(assert (= (and b!1524239 res!1042896) b!1524238))

(assert (= (and b!1524238 res!1042897) b!1524244))

(assert (= (and b!1524244 res!1042895) b!1524242))

(assert (= (and b!1524242 res!1042893) b!1524240))

(assert (= (and b!1524240 res!1042899) b!1524246))

(assert (= (and b!1524246 res!1042900) b!1524247))

(declare-fun m!1407267 () Bool)

(assert (=> b!1524244 m!1407267))

(assert (=> b!1524244 m!1407267))

(declare-fun m!1407269 () Bool)

(assert (=> b!1524244 m!1407269))

(assert (=> b!1524244 m!1407269))

(assert (=> b!1524244 m!1407267))

(declare-fun m!1407271 () Bool)

(assert (=> b!1524244 m!1407271))

(declare-fun m!1407273 () Bool)

(assert (=> b!1524240 m!1407273))

(declare-fun m!1407275 () Bool)

(assert (=> b!1524240 m!1407275))

(assert (=> b!1524240 m!1407275))

(declare-fun m!1407277 () Bool)

(assert (=> b!1524240 m!1407277))

(assert (=> b!1524240 m!1407277))

(assert (=> b!1524240 m!1407275))

(declare-fun m!1407279 () Bool)

(assert (=> b!1524240 m!1407279))

(assert (=> b!1524247 m!1407267))

(assert (=> b!1524247 m!1407267))

(declare-fun m!1407281 () Bool)

(assert (=> b!1524247 m!1407281))

(assert (=> b!1524242 m!1407267))

(assert (=> b!1524242 m!1407267))

(declare-fun m!1407283 () Bool)

(assert (=> b!1524242 m!1407283))

(assert (=> b!1524241 m!1407267))

(assert (=> b!1524241 m!1407267))

(declare-fun m!1407285 () Bool)

(assert (=> b!1524241 m!1407285))

(declare-fun m!1407287 () Bool)

(assert (=> b!1524239 m!1407287))

(declare-fun m!1407289 () Bool)

(assert (=> b!1524245 m!1407289))

(assert (=> b!1524245 m!1407289))

(declare-fun m!1407291 () Bool)

(assert (=> b!1524245 m!1407291))

(declare-fun m!1407293 () Bool)

(assert (=> b!1524246 m!1407293))

(declare-fun m!1407295 () Bool)

(assert (=> b!1524246 m!1407295))

(declare-fun m!1407297 () Bool)

(assert (=> start!129872 m!1407297))

(declare-fun m!1407299 () Bool)

(assert (=> start!129872 m!1407299))

(declare-fun m!1407301 () Bool)

(assert (=> b!1524243 m!1407301))

(push 1)

