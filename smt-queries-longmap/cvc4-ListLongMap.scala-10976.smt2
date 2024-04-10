; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128524 () Bool)

(assert start!128524)

(declare-fun b!1507041 () Bool)

(declare-fun res!1027367 () Bool)

(declare-fun e!842081 () Bool)

(assert (=> b!1507041 (=> (not res!1027367) (not e!842081))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100536 0))(
  ( (array!100537 (arr!48511 (Array (_ BitVec 32) (_ BitVec 64))) (size!49061 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100536)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507041 (= res!1027367 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49061 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49061 a!2804))))))

(declare-fun b!1507042 () Bool)

(declare-fun res!1027366 () Bool)

(assert (=> b!1507042 (=> (not res!1027366) (not e!842081))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100536 (_ BitVec 32)) Bool)

(assert (=> b!1507042 (= res!1027366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507043 () Bool)

(declare-fun res!1027369 () Bool)

(declare-fun e!842083 () Bool)

(assert (=> b!1507043 (=> (not res!1027369) (not e!842083))))

(declare-datatypes ((SeekEntryResult!12682 0))(
  ( (MissingZero!12682 (index!53123 (_ BitVec 32))) (Found!12682 (index!53124 (_ BitVec 32))) (Intermediate!12682 (undefined!13494 Bool) (index!53125 (_ BitVec 32)) (x!134872 (_ BitVec 32))) (Undefined!12682) (MissingVacant!12682 (index!53126 (_ BitVec 32))) )
))
(declare-fun lt!654295 () SeekEntryResult!12682)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100536 (_ BitVec 32)) SeekEntryResult!12682)

(assert (=> b!1507043 (= res!1027369 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48511 a!2804) j!70) a!2804 mask!2512) lt!654295))))

(declare-fun b!1507044 () Bool)

(declare-fun res!1027365 () Bool)

(assert (=> b!1507044 (=> (not res!1027365) (not e!842081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507044 (= res!1027365 (validKeyInArray!0 (select (arr!48511 a!2804) j!70)))))

(declare-fun b!1507045 () Bool)

(declare-fun res!1027371 () Bool)

(assert (=> b!1507045 (=> (not res!1027371) (not e!842081))))

(declare-datatypes ((List!34994 0))(
  ( (Nil!34991) (Cons!34990 (h!36390 (_ BitVec 64)) (t!49688 List!34994)) )
))
(declare-fun arrayNoDuplicates!0 (array!100536 (_ BitVec 32) List!34994) Bool)

(assert (=> b!1507045 (= res!1027371 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34991))))

(declare-fun b!1507046 () Bool)

(declare-fun res!1027368 () Bool)

(assert (=> b!1507046 (=> (not res!1027368) (not e!842081))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507046 (= res!1027368 (and (= (size!49061 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49061 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49061 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507047 () Bool)

(assert (=> b!1507047 (= e!842081 e!842083)))

(declare-fun res!1027372 () Bool)

(assert (=> b!1507047 (=> (not res!1027372) (not e!842083))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507047 (= res!1027372 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48511 a!2804) j!70) mask!2512) (select (arr!48511 a!2804) j!70) a!2804 mask!2512) lt!654295))))

(assert (=> b!1507047 (= lt!654295 (Intermediate!12682 false resIndex!21 resX!21))))

(declare-fun b!1507048 () Bool)

(assert (=> b!1507048 (= e!842083 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(declare-fun b!1507049 () Bool)

(declare-fun res!1027370 () Bool)

(assert (=> b!1507049 (=> (not res!1027370) (not e!842081))))

(assert (=> b!1507049 (= res!1027370 (validKeyInArray!0 (select (arr!48511 a!2804) i!961)))))

(declare-fun res!1027364 () Bool)

(assert (=> start!128524 (=> (not res!1027364) (not e!842081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128524 (= res!1027364 (validMask!0 mask!2512))))

(assert (=> start!128524 e!842081))

(assert (=> start!128524 true))

(declare-fun array_inv!37539 (array!100536) Bool)

(assert (=> start!128524 (array_inv!37539 a!2804)))

(assert (= (and start!128524 res!1027364) b!1507046))

(assert (= (and b!1507046 res!1027368) b!1507049))

(assert (= (and b!1507049 res!1027370) b!1507044))

(assert (= (and b!1507044 res!1027365) b!1507042))

(assert (= (and b!1507042 res!1027366) b!1507045))

(assert (= (and b!1507045 res!1027371) b!1507041))

(assert (= (and b!1507041 res!1027367) b!1507047))

(assert (= (and b!1507047 res!1027372) b!1507043))

(assert (= (and b!1507043 res!1027369) b!1507048))

(declare-fun m!1389909 () Bool)

(assert (=> b!1507044 m!1389909))

(assert (=> b!1507044 m!1389909))

(declare-fun m!1389911 () Bool)

(assert (=> b!1507044 m!1389911))

(declare-fun m!1389913 () Bool)

(assert (=> b!1507045 m!1389913))

(declare-fun m!1389915 () Bool)

(assert (=> start!128524 m!1389915))

(declare-fun m!1389917 () Bool)

(assert (=> start!128524 m!1389917))

(assert (=> b!1507047 m!1389909))

(assert (=> b!1507047 m!1389909))

(declare-fun m!1389919 () Bool)

(assert (=> b!1507047 m!1389919))

(assert (=> b!1507047 m!1389919))

(assert (=> b!1507047 m!1389909))

(declare-fun m!1389921 () Bool)

(assert (=> b!1507047 m!1389921))

(assert (=> b!1507043 m!1389909))

(assert (=> b!1507043 m!1389909))

(declare-fun m!1389923 () Bool)

(assert (=> b!1507043 m!1389923))

(declare-fun m!1389925 () Bool)

(assert (=> b!1507049 m!1389925))

(assert (=> b!1507049 m!1389925))

(declare-fun m!1389927 () Bool)

(assert (=> b!1507049 m!1389927))

(declare-fun m!1389929 () Bool)

(assert (=> b!1507042 m!1389929))

(push 1)

(assert (not b!1507043))

(assert (not b!1507042))

(assert (not b!1507049))

(assert (not start!128524))

(assert (not b!1507044))

(assert (not b!1507045))

(assert (not b!1507047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1507117 () Bool)

(declare-fun e!842127 () Bool)

(declare-fun e!842128 () Bool)

(assert (=> b!1507117 (= e!842127 e!842128)))

(declare-fun res!1027400 () Bool)

(declare-fun lt!654316 () SeekEntryResult!12682)

(assert (=> b!1507117 (= res!1027400 (and (is-Intermediate!12682 lt!654316) (not (undefined!13494 lt!654316)) (bvslt (x!134872 lt!654316) #b01111111111111111111111111111110) (bvsge (x!134872 lt!654316) #b00000000000000000000000000000000) (bvsge (x!134872 lt!654316) x!534)))))

(assert (=> b!1507117 (=> (not res!1027400) (not e!842128))))

(declare-fun b!1507118 () Bool)

(declare-fun e!842126 () SeekEntryResult!12682)

(assert (=> b!1507118 (= e!842126 (Intermediate!12682 false index!487 x!534))))

(declare-fun b!1507119 () Bool)

(assert (=> b!1507119 (and (bvsge (index!53125 lt!654316) #b00000000000000000000000000000000) (bvslt (index!53125 lt!654316) (size!49061 a!2804)))))

(declare-fun res!1027402 () Bool)

(assert (=> b!1507119 (= res!1027402 (= (select (arr!48511 a!2804) (index!53125 lt!654316)) (select (arr!48511 a!2804) j!70)))))

(declare-fun e!842130 () Bool)

(assert (=> b!1507119 (=> res!1027402 e!842130)))

(assert (=> b!1507119 (= e!842128 e!842130)))

(declare-fun b!1507120 () Bool)

(assert (=> b!1507120 (= e!842127 (bvsge (x!134872 lt!654316) #b01111111111111111111111111111110))))

(declare-fun b!1507122 () Bool)

(assert (=> b!1507122 (and (bvsge (index!53125 lt!654316) #b00000000000000000000000000000000) (bvslt (index!53125 lt!654316) (size!49061 a!2804)))))

(assert (=> b!1507122 (= e!842130 (= (select (arr!48511 a!2804) (index!53125 lt!654316)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507123 () Bool)

(declare-fun e!842129 () SeekEntryResult!12682)

(assert (=> b!1507123 (= e!842129 e!842126)))

(declare-fun c!139396 () Bool)

(declare-fun lt!654315 () (_ BitVec 64))

(assert (=> b!1507123 (= c!139396 (or (= lt!654315 (select (arr!48511 a!2804) j!70)) (= (bvadd lt!654315 lt!654315) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507124 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507124 (= e!842126 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48511 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507125 () Bool)

(assert (=> b!1507125 (and (bvsge (index!53125 lt!654316) #b00000000000000000000000000000000) (bvslt (index!53125 lt!654316) (size!49061 a!2804)))))

(declare-fun res!1027401 () Bool)

(assert (=> b!1507125 (= res!1027401 (= (select (arr!48511 a!2804) (index!53125 lt!654316)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507125 (=> res!1027401 e!842130)))

(declare-fun d!158271 () Bool)

(assert (=> d!158271 e!842127))

(declare-fun c!139395 () Bool)

(assert (=> d!158271 (= c!139395 (and (is-Intermediate!12682 lt!654316) (undefined!13494 lt!654316)))))

(assert (=> d!158271 (= lt!654316 e!842129)))

(declare-fun c!139394 () Bool)

(assert (=> d!158271 (= c!139394 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158271 (= lt!654315 (select (arr!48511 a!2804) index!487))))

(assert (=> d!158271 (validMask!0 mask!2512)))

(assert (=> d!158271 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48511 a!2804) j!70) a!2804 mask!2512) lt!654316)))

(declare-fun b!1507121 () Bool)

(assert (=> b!1507121 (= e!842129 (Intermediate!12682 true index!487 x!534))))

(assert (= (and d!158271 c!139394) b!1507121))

(assert (= (and d!158271 (not c!139394)) b!1507123))

(assert (= (and b!1507123 c!139396) b!1507118))

(assert (= (and b!1507123 (not c!139396)) b!1507124))

(assert (= (and d!158271 c!139395) b!1507120))

(assert (= (and d!158271 (not c!139395)) b!1507117))

(assert (= (and b!1507117 res!1027400) b!1507119))

(assert (= (and b!1507119 (not res!1027402)) b!1507125))

(assert (= (and b!1507125 (not res!1027401)) b!1507122))

(declare-fun m!1389957 () Bool)

(assert (=> b!1507122 m!1389957))

(assert (=> b!1507119 m!1389957))

(declare-fun m!1389961 () Bool)

(assert (=> d!158271 m!1389961))

(assert (=> d!158271 m!1389915))

(assert (=> b!1507125 m!1389957))

(declare-fun m!1389963 () Bool)

(assert (=> b!1507124 m!1389963))

(assert (=> b!1507124 m!1389963))

(assert (=> b!1507124 m!1389909))

(declare-fun m!1389965 () Bool)

(assert (=> b!1507124 m!1389965))

(assert (=> b!1507043 d!158271))

(declare-fun b!1507166 () Bool)

(declare-fun e!842156 () Bool)

(declare-fun e!842157 () Bool)

(assert (=> b!1507166 (= e!842156 e!842157)))

(declare-fun lt!654336 () (_ BitVec 64))

(assert (=> b!1507166 (= lt!654336 (select (arr!48511 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50326 0))(
  ( (Unit!50327) )
))
(declare-fun lt!654335 () Unit!50326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100536 (_ BitVec 64) (_ BitVec 32)) Unit!50326)

(assert (=> b!1507166 (= lt!654335 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654336 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507166 (arrayContainsKey!0 a!2804 lt!654336 #b00000000000000000000000000000000)))

(declare-fun lt!654337 () Unit!50326)

(assert (=> b!1507166 (= lt!654337 lt!654335)))

(declare-fun res!1027420 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100536 (_ BitVec 32)) SeekEntryResult!12682)

(assert (=> b!1507166 (= res!1027420 (= (seekEntryOrOpen!0 (select (arr!48511 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12682 #b00000000000000000000000000000000)))))

(assert (=> b!1507166 (=> (not res!1027420) (not e!842157))))

(declare-fun b!1507167 () Bool)

(declare-fun e!842158 () Bool)

(assert (=> b!1507167 (= e!842158 e!842156)))

(declare-fun c!139409 () Bool)

(assert (=> b!1507167 (= c!139409 (validKeyInArray!0 (select (arr!48511 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507168 () Bool)

(declare-fun call!68247 () Bool)

(assert (=> b!1507168 (= e!842157 call!68247)))

(declare-fun d!158283 () Bool)

(declare-fun res!1027421 () Bool)

(assert (=> d!158283 (=> res!1027421 e!842158)))

(assert (=> d!158283 (= res!1027421 (bvsge #b00000000000000000000000000000000 (size!49061 a!2804)))))

(assert (=> d!158283 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842158)))

(declare-fun bm!68244 () Bool)

(assert (=> bm!68244 (= call!68247 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1507169 () Bool)

(assert (=> b!1507169 (= e!842156 call!68247)))

(assert (= (and d!158283 (not res!1027421)) b!1507167))

(assert (= (and b!1507167 c!139409) b!1507166))

(assert (= (and b!1507167 (not c!139409)) b!1507169))

(assert (= (and b!1507166 res!1027420) b!1507168))

(assert (= (or b!1507168 b!1507169) bm!68244))

(declare-fun m!1389975 () Bool)

(assert (=> b!1507166 m!1389975))

(declare-fun m!1389977 () Bool)

(assert (=> b!1507166 m!1389977))

(declare-fun m!1389979 () Bool)

(assert (=> b!1507166 m!1389979))

(assert (=> b!1507166 m!1389975))

(declare-fun m!1389981 () Bool)

(assert (=> b!1507166 m!1389981))

(assert (=> b!1507167 m!1389975))

(assert (=> b!1507167 m!1389975))

(declare-fun m!1389983 () Bool)

(assert (=> b!1507167 m!1389983))

(declare-fun m!1389985 () Bool)

(assert (=> bm!68244 m!1389985))

(assert (=> b!1507042 d!158283))

(declare-fun d!158289 () Bool)

(assert (=> d!158289 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128524 d!158289))

(declare-fun d!158293 () Bool)

(assert (=> d!158293 (= (array_inv!37539 a!2804) (bvsge (size!49061 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128524 d!158293))

(declare-fun b!1507206 () Bool)

(declare-fun e!842186 () Bool)

(declare-fun e!842187 () Bool)

(assert (=> b!1507206 (= e!842186 e!842187)))

(declare-fun res!1027440 () Bool)

(declare-fun lt!654350 () SeekEntryResult!12682)

(assert (=> b!1507206 (= res!1027440 (and (is-Intermediate!12682 lt!654350) (not (undefined!13494 lt!654350)) (bvslt (x!134872 lt!654350) #b01111111111111111111111111111110) (bvsge (x!134872 lt!654350) #b00000000000000000000000000000000) (bvsge (x!134872 lt!654350) #b00000000000000000000000000000000)))))

(assert (=> b!1507206 (=> (not res!1027440) (not e!842187))))

(declare-fun e!842185 () SeekEntryResult!12682)

(declare-fun b!1507207 () Bool)

(assert (=> b!1507207 (= e!842185 (Intermediate!12682 false (toIndex!0 (select (arr!48511 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1507208 () Bool)

(assert (=> b!1507208 (and (bvsge (index!53125 lt!654350) #b00000000000000000000000000000000) (bvslt (index!53125 lt!654350) (size!49061 a!2804)))))

(declare-fun res!1027442 () Bool)

(assert (=> b!1507208 (= res!1027442 (= (select (arr!48511 a!2804) (index!53125 lt!654350)) (select (arr!48511 a!2804) j!70)))))

(declare-fun e!842189 () Bool)

(assert (=> b!1507208 (=> res!1027442 e!842189)))

(assert (=> b!1507208 (= e!842187 e!842189)))

(declare-fun b!1507209 () Bool)

(assert (=> b!1507209 (= e!842186 (bvsge (x!134872 lt!654350) #b01111111111111111111111111111110))))

(declare-fun b!1507211 () Bool)

(assert (=> b!1507211 (and (bvsge (index!53125 lt!654350) #b00000000000000000000000000000000) (bvslt (index!53125 lt!654350) (size!49061 a!2804)))))

(assert (=> b!1507211 (= e!842189 (= (select (arr!48511 a!2804) (index!53125 lt!654350)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507212 () Bool)

(declare-fun e!842188 () SeekEntryResult!12682)

(assert (=> b!1507212 (= e!842188 e!842185)))

(declare-fun c!139421 () Bool)

(declare-fun lt!654349 () (_ BitVec 64))

(assert (=> b!1507212 (= c!139421 (or (= lt!654349 (select (arr!48511 a!2804) j!70)) (= (bvadd lt!654349 lt!654349) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507213 () Bool)

(assert (=> b!1507213 (= e!842185 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48511 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48511 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507214 () Bool)

(assert (=> b!1507214 (and (bvsge (index!53125 lt!654350) #b00000000000000000000000000000000) (bvslt (index!53125 lt!654350) (size!49061 a!2804)))))

(declare-fun res!1027441 () Bool)

(assert (=> b!1507214 (= res!1027441 (= (select (arr!48511 a!2804) (index!53125 lt!654350)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507214 (=> res!1027441 e!842189)))

(declare-fun d!158295 () Bool)

(assert (=> d!158295 e!842186))

(declare-fun c!139420 () Bool)

(assert (=> d!158295 (= c!139420 (and (is-Intermediate!12682 lt!654350) (undefined!13494 lt!654350)))))

(assert (=> d!158295 (= lt!654350 e!842188)))

(declare-fun c!139419 () Bool)

(assert (=> d!158295 (= c!139419 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158295 (= lt!654349 (select (arr!48511 a!2804) (toIndex!0 (select (arr!48511 a!2804) j!70) mask!2512)))))

(assert (=> d!158295 (validMask!0 mask!2512)))

(assert (=> d!158295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48511 a!2804) j!70) mask!2512) (select (arr!48511 a!2804) j!70) a!2804 mask!2512) lt!654350)))

(declare-fun b!1507210 () Bool)

(assert (=> b!1507210 (= e!842188 (Intermediate!12682 true (toIndex!0 (select (arr!48511 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

