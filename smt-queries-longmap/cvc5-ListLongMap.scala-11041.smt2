; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129078 () Bool)

(assert start!129078)

(declare-fun b!1514287 () Bool)

(declare-fun e!845093 () Bool)

(declare-fun e!845096 () Bool)

(assert (=> b!1514287 (= e!845093 e!845096)))

(declare-fun res!1034191 () Bool)

(assert (=> b!1514287 (=> (not res!1034191) (not e!845096))))

(declare-datatypes ((SeekEntryResult!12875 0))(
  ( (MissingZero!12875 (index!53895 (_ BitVec 32))) (Found!12875 (index!53896 (_ BitVec 32))) (Intermediate!12875 (undefined!13687 Bool) (index!53897 (_ BitVec 32)) (x!135609 (_ BitVec 32))) (Undefined!12875) (MissingVacant!12875 (index!53898 (_ BitVec 32))) )
))
(declare-fun lt!656282 () SeekEntryResult!12875)

(declare-fun lt!656283 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100934 0))(
  ( (array!100935 (arr!48704 (Array (_ BitVec 32) (_ BitVec 64))) (size!49254 (_ BitVec 32))) )
))
(declare-fun lt!656284 () array!100934)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100934 (_ BitVec 32)) SeekEntryResult!12875)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514287 (= res!1034191 (= lt!656282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656283 mask!2512) lt!656283 lt!656284 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!100934)

(assert (=> b!1514287 (= lt!656283 (select (store (arr!48704 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514287 (= lt!656284 (array!100935 (store (arr!48704 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49254 a!2804)))))

(declare-fun b!1514288 () Bool)

(declare-fun res!1034196 () Bool)

(declare-fun e!845094 () Bool)

(assert (=> b!1514288 (=> (not res!1034196) (not e!845094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100934 (_ BitVec 32)) Bool)

(assert (=> b!1514288 (= res!1034196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514289 () Bool)

(declare-fun res!1034201 () Bool)

(assert (=> b!1514289 (=> (not res!1034201) (not e!845094))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514289 (= res!1034201 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49254 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49254 a!2804))))))

(declare-fun b!1514290 () Bool)

(declare-fun res!1034200 () Bool)

(assert (=> b!1514290 (=> (not res!1034200) (not e!845094))))

(assert (=> b!1514290 (= res!1034200 (and (= (size!49254 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49254 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49254 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1034198 () Bool)

(assert (=> start!129078 (=> (not res!1034198) (not e!845094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129078 (= res!1034198 (validMask!0 mask!2512))))

(assert (=> start!129078 e!845094))

(assert (=> start!129078 true))

(declare-fun array_inv!37732 (array!100934) Bool)

(assert (=> start!129078 (array_inv!37732 a!2804)))

(declare-fun b!1514291 () Bool)

(declare-fun res!1034195 () Bool)

(assert (=> b!1514291 (=> (not res!1034195) (not e!845094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514291 (= res!1034195 (validKeyInArray!0 (select (arr!48704 a!2804) j!70)))))

(declare-fun b!1514292 () Bool)

(declare-fun e!845092 () Bool)

(declare-fun e!845098 () Bool)

(assert (=> b!1514292 (= e!845092 e!845098)))

(declare-fun res!1034193 () Bool)

(assert (=> b!1514292 (=> res!1034193 e!845098)))

(assert (=> b!1514292 (= res!1034193 (or (not (= (select (arr!48704 a!2804) j!70) lt!656283)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48704 a!2804) index!487) (select (arr!48704 a!2804) j!70)) (not (= (select (arr!48704 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514293 () Bool)

(declare-fun res!1034199 () Bool)

(assert (=> b!1514293 (=> (not res!1034199) (not e!845093))))

(declare-fun lt!656281 () SeekEntryResult!12875)

(assert (=> b!1514293 (= res!1034199 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48704 a!2804) j!70) a!2804 mask!2512) lt!656281))))

(declare-fun b!1514294 () Bool)

(declare-fun res!1034202 () Bool)

(assert (=> b!1514294 (=> (not res!1034202) (not e!845094))))

(declare-datatypes ((List!35187 0))(
  ( (Nil!35184) (Cons!35183 (h!36595 (_ BitVec 64)) (t!49881 List!35187)) )
))
(declare-fun arrayNoDuplicates!0 (array!100934 (_ BitVec 32) List!35187) Bool)

(assert (=> b!1514294 (= res!1034202 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35184))))

(declare-fun b!1514295 () Bool)

(declare-fun res!1034203 () Bool)

(assert (=> b!1514295 (=> (not res!1034203) (not e!845094))))

(assert (=> b!1514295 (= res!1034203 (validKeyInArray!0 (select (arr!48704 a!2804) i!961)))))

(declare-fun b!1514296 () Bool)

(assert (=> b!1514296 (= e!845096 (not true))))

(assert (=> b!1514296 e!845092))

(declare-fun res!1034197 () Bool)

(assert (=> b!1514296 (=> (not res!1034197) (not e!845092))))

(assert (=> b!1514296 (= res!1034197 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50618 0))(
  ( (Unit!50619) )
))
(declare-fun lt!656280 () Unit!50618)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50618)

(assert (=> b!1514296 (= lt!656280 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514297 () Bool)

(assert (=> b!1514297 (= e!845094 e!845093)))

(declare-fun res!1034192 () Bool)

(assert (=> b!1514297 (=> (not res!1034192) (not e!845093))))

(assert (=> b!1514297 (= res!1034192 (= lt!656282 lt!656281))))

(assert (=> b!1514297 (= lt!656281 (Intermediate!12875 false resIndex!21 resX!21))))

(assert (=> b!1514297 (= lt!656282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48704 a!2804) j!70) mask!2512) (select (arr!48704 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514298 () Bool)

(declare-fun res!1034194 () Bool)

(assert (=> b!1514298 (=> (not res!1034194) (not e!845092))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100934 (_ BitVec 32)) SeekEntryResult!12875)

(assert (=> b!1514298 (= res!1034194 (= (seekEntry!0 (select (arr!48704 a!2804) j!70) a!2804 mask!2512) (Found!12875 j!70)))))

(declare-fun b!1514299 () Bool)

(declare-fun e!845095 () Bool)

(assert (=> b!1514299 (= e!845098 e!845095)))

(declare-fun res!1034190 () Bool)

(assert (=> b!1514299 (=> (not res!1034190) (not e!845095))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100934 (_ BitVec 32)) SeekEntryResult!12875)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100934 (_ BitVec 32)) SeekEntryResult!12875)

(assert (=> b!1514299 (= res!1034190 (= (seekEntryOrOpen!0 (select (arr!48704 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48704 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514300 () Bool)

(assert (=> b!1514300 (= e!845095 (= (seekEntryOrOpen!0 lt!656283 lt!656284 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656283 lt!656284 mask!2512)))))

(assert (= (and start!129078 res!1034198) b!1514290))

(assert (= (and b!1514290 res!1034200) b!1514295))

(assert (= (and b!1514295 res!1034203) b!1514291))

(assert (= (and b!1514291 res!1034195) b!1514288))

(assert (= (and b!1514288 res!1034196) b!1514294))

(assert (= (and b!1514294 res!1034202) b!1514289))

(assert (= (and b!1514289 res!1034201) b!1514297))

(assert (= (and b!1514297 res!1034192) b!1514293))

(assert (= (and b!1514293 res!1034199) b!1514287))

(assert (= (and b!1514287 res!1034191) b!1514296))

(assert (= (and b!1514296 res!1034197) b!1514298))

(assert (= (and b!1514298 res!1034194) b!1514292))

(assert (= (and b!1514292 (not res!1034193)) b!1514299))

(assert (= (and b!1514299 res!1034190) b!1514300))

(declare-fun m!1397227 () Bool)

(assert (=> b!1514295 m!1397227))

(assert (=> b!1514295 m!1397227))

(declare-fun m!1397229 () Bool)

(assert (=> b!1514295 m!1397229))

(declare-fun m!1397231 () Bool)

(assert (=> b!1514293 m!1397231))

(assert (=> b!1514293 m!1397231))

(declare-fun m!1397233 () Bool)

(assert (=> b!1514293 m!1397233))

(assert (=> b!1514291 m!1397231))

(assert (=> b!1514291 m!1397231))

(declare-fun m!1397235 () Bool)

(assert (=> b!1514291 m!1397235))

(declare-fun m!1397237 () Bool)

(assert (=> b!1514296 m!1397237))

(declare-fun m!1397239 () Bool)

(assert (=> b!1514296 m!1397239))

(assert (=> b!1514298 m!1397231))

(assert (=> b!1514298 m!1397231))

(declare-fun m!1397241 () Bool)

(assert (=> b!1514298 m!1397241))

(assert (=> b!1514299 m!1397231))

(assert (=> b!1514299 m!1397231))

(declare-fun m!1397243 () Bool)

(assert (=> b!1514299 m!1397243))

(assert (=> b!1514299 m!1397231))

(declare-fun m!1397245 () Bool)

(assert (=> b!1514299 m!1397245))

(assert (=> b!1514297 m!1397231))

(assert (=> b!1514297 m!1397231))

(declare-fun m!1397247 () Bool)

(assert (=> b!1514297 m!1397247))

(assert (=> b!1514297 m!1397247))

(assert (=> b!1514297 m!1397231))

(declare-fun m!1397249 () Bool)

(assert (=> b!1514297 m!1397249))

(declare-fun m!1397251 () Bool)

(assert (=> start!129078 m!1397251))

(declare-fun m!1397253 () Bool)

(assert (=> start!129078 m!1397253))

(declare-fun m!1397255 () Bool)

(assert (=> b!1514300 m!1397255))

(declare-fun m!1397257 () Bool)

(assert (=> b!1514300 m!1397257))

(assert (=> b!1514292 m!1397231))

(declare-fun m!1397259 () Bool)

(assert (=> b!1514292 m!1397259))

(declare-fun m!1397261 () Bool)

(assert (=> b!1514288 m!1397261))

(declare-fun m!1397263 () Bool)

(assert (=> b!1514287 m!1397263))

(assert (=> b!1514287 m!1397263))

(declare-fun m!1397265 () Bool)

(assert (=> b!1514287 m!1397265))

(declare-fun m!1397267 () Bool)

(assert (=> b!1514287 m!1397267))

(declare-fun m!1397269 () Bool)

(assert (=> b!1514287 m!1397269))

(declare-fun m!1397271 () Bool)

(assert (=> b!1514294 m!1397271))

(push 1)

