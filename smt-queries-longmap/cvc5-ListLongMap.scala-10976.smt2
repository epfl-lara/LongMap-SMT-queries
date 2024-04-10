; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128520 () Bool)

(assert start!128520)

(declare-fun b!1506987 () Bool)

(declare-fun res!1027318 () Bool)

(declare-fun e!842064 () Bool)

(assert (=> b!1506987 (=> (not res!1027318) (not e!842064))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100532 0))(
  ( (array!100533 (arr!48509 (Array (_ BitVec 32) (_ BitVec 64))) (size!49059 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100532)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506987 (= res!1027318 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49059 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49059 a!2804))))))

(declare-fun b!1506988 () Bool)

(declare-fun res!1027317 () Bool)

(declare-fun e!842065 () Bool)

(assert (=> b!1506988 (=> (not res!1027317) (not e!842065))))

(declare-datatypes ((SeekEntryResult!12680 0))(
  ( (MissingZero!12680 (index!53115 (_ BitVec 32))) (Found!12680 (index!53116 (_ BitVec 32))) (Intermediate!12680 (undefined!13492 Bool) (index!53117 (_ BitVec 32)) (x!134870 (_ BitVec 32))) (Undefined!12680) (MissingVacant!12680 (index!53118 (_ BitVec 32))) )
))
(declare-fun lt!654289 () SeekEntryResult!12680)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100532 (_ BitVec 32)) SeekEntryResult!12680)

(assert (=> b!1506988 (= res!1027317 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48509 a!2804) j!70) a!2804 mask!2512) lt!654289))))

(declare-fun b!1506989 () Bool)

(declare-fun res!1027316 () Bool)

(assert (=> b!1506989 (=> (not res!1027316) (not e!842064))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506989 (= res!1027316 (and (= (size!49059 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49059 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49059 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506990 () Bool)

(declare-fun res!1027312 () Bool)

(assert (=> b!1506990 (=> (not res!1027312) (not e!842064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506990 (= res!1027312 (validKeyInArray!0 (select (arr!48509 a!2804) i!961)))))

(declare-fun res!1027310 () Bool)

(assert (=> start!128520 (=> (not res!1027310) (not e!842064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128520 (= res!1027310 (validMask!0 mask!2512))))

(assert (=> start!128520 e!842064))

(assert (=> start!128520 true))

(declare-fun array_inv!37537 (array!100532) Bool)

(assert (=> start!128520 (array_inv!37537 a!2804)))

(declare-fun b!1506991 () Bool)

(declare-fun res!1027311 () Bool)

(assert (=> b!1506991 (=> (not res!1027311) (not e!842064))))

(assert (=> b!1506991 (= res!1027311 (validKeyInArray!0 (select (arr!48509 a!2804) j!70)))))

(declare-fun b!1506992 () Bool)

(declare-fun res!1027315 () Bool)

(assert (=> b!1506992 (=> (not res!1027315) (not e!842064))))

(declare-datatypes ((List!34992 0))(
  ( (Nil!34989) (Cons!34988 (h!36388 (_ BitVec 64)) (t!49686 List!34992)) )
))
(declare-fun arrayNoDuplicates!0 (array!100532 (_ BitVec 32) List!34992) Bool)

(assert (=> b!1506992 (= res!1027315 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34989))))

(declare-fun b!1506993 () Bool)

(declare-fun res!1027314 () Bool)

(assert (=> b!1506993 (=> (not res!1027314) (not e!842064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100532 (_ BitVec 32)) Bool)

(assert (=> b!1506993 (= res!1027314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506994 () Bool)

(assert (=> b!1506994 (= e!842065 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(declare-fun b!1506995 () Bool)

(assert (=> b!1506995 (= e!842064 e!842065)))

(declare-fun res!1027313 () Bool)

(assert (=> b!1506995 (=> (not res!1027313) (not e!842065))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506995 (= res!1027313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48509 a!2804) j!70) mask!2512) (select (arr!48509 a!2804) j!70) a!2804 mask!2512) lt!654289))))

(assert (=> b!1506995 (= lt!654289 (Intermediate!12680 false resIndex!21 resX!21))))

(assert (= (and start!128520 res!1027310) b!1506989))

(assert (= (and b!1506989 res!1027316) b!1506990))

(assert (= (and b!1506990 res!1027312) b!1506991))

(assert (= (and b!1506991 res!1027311) b!1506993))

(assert (= (and b!1506993 res!1027314) b!1506992))

(assert (= (and b!1506992 res!1027315) b!1506987))

(assert (= (and b!1506987 res!1027318) b!1506995))

(assert (= (and b!1506995 res!1027313) b!1506988))

(assert (= (and b!1506988 res!1027317) b!1506994))

(declare-fun m!1389865 () Bool)

(assert (=> b!1506990 m!1389865))

(assert (=> b!1506990 m!1389865))

(declare-fun m!1389867 () Bool)

(assert (=> b!1506990 m!1389867))

(declare-fun m!1389869 () Bool)

(assert (=> b!1506993 m!1389869))

(declare-fun m!1389871 () Bool)

(assert (=> start!128520 m!1389871))

(declare-fun m!1389873 () Bool)

(assert (=> start!128520 m!1389873))

(declare-fun m!1389875 () Bool)

(assert (=> b!1506988 m!1389875))

(assert (=> b!1506988 m!1389875))

(declare-fun m!1389877 () Bool)

(assert (=> b!1506988 m!1389877))

(assert (=> b!1506995 m!1389875))

(assert (=> b!1506995 m!1389875))

(declare-fun m!1389879 () Bool)

(assert (=> b!1506995 m!1389879))

(assert (=> b!1506995 m!1389879))

(assert (=> b!1506995 m!1389875))

(declare-fun m!1389881 () Bool)

(assert (=> b!1506995 m!1389881))

(declare-fun m!1389883 () Bool)

(assert (=> b!1506992 m!1389883))

(assert (=> b!1506991 m!1389875))

(assert (=> b!1506991 m!1389875))

(declare-fun m!1389885 () Bool)

(assert (=> b!1506991 m!1389885))

(push 1)

(assert (not b!1506995))

(assert (not start!128520))

(assert (not b!1506992))

(assert (not b!1506990))

(assert (not b!1506993))

(assert (not b!1506988))

(assert (not b!1506991))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158269 () Bool)

(assert (=> d!158269 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128520 d!158269))

(declare-fun d!158273 () Bool)

(assert (=> d!158273 (= (array_inv!37537 a!2804) (bvsge (size!49059 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128520 d!158273))

(declare-fun bm!68238 () Bool)

(declare-fun call!68241 () Bool)

(assert (=> bm!68238 (= call!68241 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!158275 () Bool)

(declare-fun res!1027383 () Bool)

(declare-fun e!842102 () Bool)

(assert (=> d!158275 (=> res!1027383 e!842102)))

(assert (=> d!158275 (= res!1027383 (bvsge #b00000000000000000000000000000000 (size!49059 a!2804)))))

(assert (=> d!158275 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842102)))

(declare-fun b!1507076 () Bool)

(declare-fun e!842101 () Bool)

(assert (=> b!1507076 (= e!842102 e!842101)))

(declare-fun c!139382 () Bool)

(assert (=> b!1507076 (= c!139382 (validKeyInArray!0 (select (arr!48509 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507077 () Bool)

(declare-fun e!842100 () Bool)

(assert (=> b!1507077 (= e!842100 call!68241)))

(declare-fun b!1507078 () Bool)

(assert (=> b!1507078 (= e!842101 e!842100)))

(declare-fun lt!654306 () (_ BitVec 64))

(assert (=> b!1507078 (= lt!654306 (select (arr!48509 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50324 0))(
  ( (Unit!50325) )
))
(declare-fun lt!654307 () Unit!50324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100532 (_ BitVec 64) (_ BitVec 32)) Unit!50324)

(assert (=> b!1507078 (= lt!654307 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654306 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507078 (arrayContainsKey!0 a!2804 lt!654306 #b00000000000000000000000000000000)))

(declare-fun lt!654308 () Unit!50324)

(assert (=> b!1507078 (= lt!654308 lt!654307)))

(declare-fun res!1027384 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100532 (_ BitVec 32)) SeekEntryResult!12680)

(assert (=> b!1507078 (= res!1027384 (= (seekEntryOrOpen!0 (select (arr!48509 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12680 #b00000000000000000000000000000000)))))

(assert (=> b!1507078 (=> (not res!1027384) (not e!842100))))

(declare-fun b!1507079 () Bool)

(assert (=> b!1507079 (= e!842101 call!68241)))

(assert (= (and d!158275 (not res!1027383)) b!1507076))

(assert (= (and b!1507076 c!139382) b!1507078))

(assert (= (and b!1507076 (not c!139382)) b!1507079))

(assert (= (and b!1507078 res!1027384) b!1507077))

(assert (= (or b!1507077 b!1507079) bm!68238))

(declare-fun m!1389931 () Bool)

(assert (=> bm!68238 m!1389931))

(declare-fun m!1389933 () Bool)

(assert (=> b!1507076 m!1389933))

(assert (=> b!1507076 m!1389933))

(declare-fun m!1389935 () Bool)

(assert (=> b!1507076 m!1389935))

(assert (=> b!1507078 m!1389933))

(declare-fun m!1389937 () Bool)

(assert (=> b!1507078 m!1389937))

(declare-fun m!1389939 () Bool)

(assert (=> b!1507078 m!1389939))

(assert (=> b!1507078 m!1389933))

(declare-fun m!1389941 () Bool)

(assert (=> b!1507078 m!1389941))

(assert (=> b!1506993 d!158275))

(declare-fun e!842166 () SeekEntryResult!12680)

(declare-fun b!1507178 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507178 (= e!842166 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48509 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507179 () Bool)

(assert (=> b!1507179 (= e!842166 (Intermediate!12680 false index!487 x!534))))

(declare-fun b!1507180 () Bool)

(declare-fun lt!654345 () SeekEntryResult!12680)

(assert (=> b!1507180 (and (bvsge (index!53117 lt!654345) #b00000000000000000000000000000000) (bvslt (index!53117 lt!654345) (size!49059 a!2804)))))

(declare-fun e!842169 () Bool)

(assert (=> b!1507180 (= e!842169 (= (select (arr!48509 a!2804) (index!53117 lt!654345)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507181 () Bool)

(declare-fun e!842168 () Bool)

(assert (=> b!1507181 (= e!842168 (bvsge (x!134870 lt!654345) #b01111111111111111111111111111110))))

(declare-fun b!1507183 () Bool)

(assert (=> b!1507183 (and (bvsge (index!53117 lt!654345) #b00000000000000000000000000000000) (bvslt (index!53117 lt!654345) (size!49059 a!2804)))))

(declare-fun res!1027426 () Bool)

(assert (=> b!1507183 (= res!1027426 (= (select (arr!48509 a!2804) (index!53117 lt!654345)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507183 (=> res!1027426 e!842169)))

(declare-fun b!1507184 () Bool)

(declare-fun e!842167 () Bool)

(assert (=> b!1507184 (= e!842168 e!842167)))

(declare-fun res!1027428 () Bool)

(assert (=> b!1507184 (= res!1027428 (and (is-Intermediate!12680 lt!654345) (not (undefined!13492 lt!654345)) (bvslt (x!134870 lt!654345) #b01111111111111111111111111111110) (bvsge (x!134870 lt!654345) #b00000000000000000000000000000000) (bvsge (x!134870 lt!654345) x!534)))))

(assert (=> b!1507184 (=> (not res!1027428) (not e!842167))))

(declare-fun b!1507185 () Bool)

(assert (=> b!1507185 (and (bvsge (index!53117 lt!654345) #b00000000000000000000000000000000) (bvslt (index!53117 lt!654345) (size!49059 a!2804)))))

(declare-fun res!1027427 () Bool)

(assert (=> b!1507185 (= res!1027427 (= (select (arr!48509 a!2804) (index!53117 lt!654345)) (select (arr!48509 a!2804) j!70)))))

(assert (=> b!1507185 (=> res!1027427 e!842169)))

(assert (=> b!1507185 (= e!842167 e!842169)))

(declare-fun b!1507186 () Bool)

(declare-fun e!842165 () SeekEntryResult!12680)

(assert (=> b!1507186 (= e!842165 (Intermediate!12680 true index!487 x!534))))

(declare-fun b!1507182 () Bool)

(assert (=> b!1507182 (= e!842165 e!842166)))

(declare-fun lt!654344 () (_ BitVec 64))

(declare-fun c!139412 () Bool)

(assert (=> b!1507182 (= c!139412 (or (= lt!654344 (select (arr!48509 a!2804) j!70)) (= (bvadd lt!654344 lt!654344) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158277 () Bool)

(assert (=> d!158277 e!842168))

(declare-fun c!139413 () Bool)

(assert (=> d!158277 (= c!139413 (and (is-Intermediate!12680 lt!654345) (undefined!13492 lt!654345)))))

(assert (=> d!158277 (= lt!654345 e!842165)))

(declare-fun c!139414 () Bool)

(assert (=> d!158277 (= c!139414 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158277 (= lt!654344 (select (arr!48509 a!2804) index!487))))

(assert (=> d!158277 (validMask!0 mask!2512)))

(assert (=> d!158277 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48509 a!2804) j!70) a!2804 mask!2512) lt!654345)))

(assert (= (and d!158277 c!139414) b!1507186))

(assert (= (and d!158277 (not c!139414)) b!1507182))

(assert (= (and b!1507182 c!139412) b!1507179))

(assert (= (and b!1507182 (not c!139412)) b!1507178))

(assert (= (and d!158277 c!139413) b!1507181))

(assert (= (and d!158277 (not c!139413)) b!1507184))

(assert (= (and b!1507184 res!1027428) b!1507185))

(assert (= (and b!1507185 (not res!1027427)) b!1507183))

(assert (= (and b!1507183 (not res!1027426)) b!1507180))

(declare-fun m!1389987 () Bool)

(assert (=> b!1507178 m!1389987))

(assert (=> b!1507178 m!1389987))

(assert (=> b!1507178 m!1389875))

(declare-fun m!1389989 () Bool)

(assert (=> b!1507178 m!1389989))

(declare-fun m!1389991 () Bool)

(assert (=> b!1507180 m!1389991))

(assert (=> b!1507183 m!1389991))

(declare-fun m!1389993 () Bool)

(assert (=> d!158277 m!1389993))

(assert (=> d!158277 m!1389871))

(assert (=> b!1507185 m!1389991))

(assert (=> b!1506988 d!158277))

(declare-fun b!1507201 () Bool)

(declare-fun e!842182 () Bool)

(declare-fun e!842181 () Bool)

(assert (=> b!1507201 (= e!842182 e!842181)))

(declare-fun res!1027439 () Bool)

(assert (=> b!1507201 (=> (not res!1027439) (not e!842181))))

(declare-fun e!842183 () Bool)

(assert (=> b!1507201 (= res!1027439 (not e!842183))))

(declare-fun res!1027437 () Bool)

(assert (=> b!1507201 (=> (not res!1027437) (not e!842183))))

(assert (=> b!1507201 (= res!1027437 (validKeyInArray!0 (select (arr!48509 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158291 () Bool)

(declare-fun res!1027438 () Bool)

(assert (=> d!158291 (=> res!1027438 e!842182)))

(assert (=> d!158291 (= res!1027438 (bvsge #b00000000000000000000000000000000 (size!49059 a!2804)))))

(assert (=> d!158291 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34989) e!842182)))

(declare-fun b!1507202 () Bool)

(declare-fun contains!9967 (List!34992 (_ BitVec 64)) Bool)

(assert (=> b!1507202 (= e!842183 (contains!9967 Nil!34989 (select (arr!48509 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507203 () Bool)

(declare-fun e!842184 () Bool)

(declare-fun call!68253 () Bool)

(assert (=> b!1507203 (= e!842184 call!68253)))

(declare-fun bm!68250 () Bool)

(declare-fun c!139418 () Bool)

(assert (=> bm!68250 (= call!68253 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139418 (Cons!34988 (select (arr!48509 a!2804) #b00000000000000000000000000000000) Nil!34989) Nil!34989)))))

(declare-fun b!1507204 () Bool)

(assert (=> b!1507204 (= e!842184 call!68253)))

(declare-fun b!1507205 () Bool)

(assert (=> b!1507205 (= e!842181 e!842184)))

(assert (=> b!1507205 (= c!139418 (validKeyInArray!0 (select (arr!48509 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158291 (not res!1027438)) b!1507201))

(assert (= (and b!1507201 res!1027437) b!1507202))

(assert (= (and b!1507201 res!1027439) b!1507205))

(assert (= (and b!1507205 c!139418) b!1507204))

(assert (= (and b!1507205 (not c!139418)) b!1507203))

(assert (= (or b!1507204 b!1507203) bm!68250))

(assert (=> b!1507201 m!1389933))

(assert (=> b!1507201 m!1389933))

(assert (=> b!1507201 m!1389935))

(assert (=> b!1507202 m!1389933))

(assert (=> b!1507202 m!1389933))

(declare-fun m!1390003 () Bool)

(assert (=> b!1507202 m!1390003))

(assert (=> bm!68250 m!1389933))

(declare-fun m!1390005 () Bool)

(assert (=> bm!68250 m!1390005))

(assert (=> b!1507205 m!1389933))

(assert (=> b!1507205 m!1389933))

(assert (=> b!1507205 m!1389935))

(assert (=> b!1506992 d!158291))

(declare-fun d!158297 () Bool)

(assert (=> d!158297 (= (validKeyInArray!0 (select (arr!48509 a!2804) j!70)) (and (not (= (select (arr!48509 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48509 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506991 d!158297))

(declare-fun e!842191 () SeekEntryResult!12680)

(declare-fun b!1507215 () Bool)

(assert (=> b!1507215 (= e!842191 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48509 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48509 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507216 () Bool)

(assert (=> b!1507216 (= e!842191 (Intermediate!12680 false (toIndex!0 (select (arr!48509 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1507217 () Bool)

(declare-fun lt!654352 () SeekEntryResult!12680)

(assert (=> b!1507217 (and (bvsge (index!53117 lt!654352) #b00000000000000000000000000000000) (bvslt (index!53117 lt!654352) (size!49059 a!2804)))))

(declare-fun e!842194 () Bool)

(assert (=> b!1507217 (= e!842194 (= (select (arr!48509 a!2804) (index!53117 lt!654352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507218 () Bool)

(declare-fun e!842193 () Bool)

(assert (=> b!1507218 (= e!842193 (bvsge (x!134870 lt!654352) #b01111111111111111111111111111110))))

(declare-fun b!1507220 () Bool)

(assert (=> b!1507220 (and (bvsge (index!53117 lt!654352) #b00000000000000000000000000000000) (bvslt (index!53117 lt!654352) (size!49059 a!2804)))))

(declare-fun res!1027443 () Bool)

(assert (=> b!1507220 (= res!1027443 (= (select (arr!48509 a!2804) (index!53117 lt!654352)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507220 (=> res!1027443 e!842194)))

(declare-fun b!1507221 () Bool)

(declare-fun e!842192 () Bool)

(assert (=> b!1507221 (= e!842193 e!842192)))

(declare-fun res!1027445 () Bool)

(assert (=> b!1507221 (= res!1027445 (and (is-Intermediate!12680 lt!654352) (not (undefined!13492 lt!654352)) (bvslt (x!134870 lt!654352) #b01111111111111111111111111111110) (bvsge (x!134870 lt!654352) #b00000000000000000000000000000000) (bvsge (x!134870 lt!654352) #b00000000000000000000000000000000)))))

(assert (=> b!1507221 (=> (not res!1027445) (not e!842192))))

(declare-fun b!1507222 () Bool)

(assert (=> b!1507222 (and (bvsge (index!53117 lt!654352) #b00000000000000000000000000000000) (bvslt (index!53117 lt!654352) (size!49059 a!2804)))))

(declare-fun res!1027444 () Bool)

(assert (=> b!1507222 (= res!1027444 (= (select (arr!48509 a!2804) (index!53117 lt!654352)) (select (arr!48509 a!2804) j!70)))))

(assert (=> b!1507222 (=> res!1027444 e!842194)))

(assert (=> b!1507222 (= e!842192 e!842194)))

(declare-fun b!1507223 () Bool)

(declare-fun e!842190 () SeekEntryResult!12680)

(assert (=> b!1507223 (= e!842190 (Intermediate!12680 true (toIndex!0 (select (arr!48509 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1507219 () Bool)

(assert (=> b!1507219 (= e!842190 e!842191)))

(declare-fun lt!654351 () (_ BitVec 64))

(declare-fun c!139422 () Bool)

(assert (=> b!1507219 (= c!139422 (or (= lt!654351 (select (arr!48509 a!2804) j!70)) (= (bvadd lt!654351 lt!654351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158301 () Bool)

(assert (=> d!158301 e!842193))

(declare-fun c!139423 () Bool)

(assert (=> d!158301 (= c!139423 (and (is-Intermediate!12680 lt!654352) (undefined!13492 lt!654352)))))

(assert (=> d!158301 (= lt!654352 e!842190)))

(declare-fun c!139424 () Bool)

(assert (=> d!158301 (= c!139424 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158301 (= lt!654351 (select (arr!48509 a!2804) (toIndex!0 (select (arr!48509 a!2804) j!70) mask!2512)))))

(assert (=> d!158301 (validMask!0 mask!2512)))

(assert (=> d!158301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48509 a!2804) j!70) mask!2512) (select (arr!48509 a!2804) j!70) a!2804 mask!2512) lt!654352)))

(assert (= (and d!158301 c!139424) b!1507223))

(assert (= (and d!158301 (not c!139424)) b!1507219))

(assert (= (and b!1507219 c!139422) b!1507216))

(assert (= (and b!1507219 (not c!139422)) b!1507215))

(assert (= (and d!158301 c!139423) b!1507218))

(assert (= (and d!158301 (not c!139423)) b!1507221))

(assert (= (and b!1507221 res!1027445) b!1507222))

(assert (= (and b!1507222 (not res!1027444)) b!1507220))

(assert (= (and b!1507220 (not res!1027443)) b!1507217))

(assert (=> b!1507215 m!1389879))

(declare-fun m!1390015 () Bool)

(assert (=> b!1507215 m!1390015))

(assert (=> b!1507215 m!1390015))

(assert (=> b!1507215 m!1389875))

(declare-fun m!1390017 () Bool)

(assert (=> b!1507215 m!1390017))

(declare-fun m!1390019 () Bool)

(assert (=> b!1507217 m!1390019))

(assert (=> b!1507220 m!1390019))

(assert (=> d!158301 m!1389879))

(declare-fun m!1390021 () Bool)

(assert (=> d!158301 m!1390021))

(assert (=> d!158301 m!1389871))

(assert (=> b!1507222 m!1390019))

(assert (=> b!1506995 d!158301))

(declare-fun d!158303 () Bool)

(declare-fun lt!654364 () (_ BitVec 32))

(declare-fun lt!654363 () (_ BitVec 32))

(assert (=> d!158303 (= lt!654364 (bvmul (bvxor lt!654363 (bvlshr lt!654363 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158303 (= lt!654363 ((_ extract 31 0) (bvand (bvxor (select (arr!48509 a!2804) j!70) (bvlshr (select (arr!48509 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158303 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1027447 (let ((h!36393 ((_ extract 31 0) (bvand (bvxor (select (arr!48509 a!2804) j!70) (bvlshr (select (arr!48509 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134878 (bvmul (bvxor h!36393 (bvlshr h!36393 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134878 (bvlshr x!134878 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1027447 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1027447 #b00000000000000000000000000000000))))))

(assert (=> d!158303 (= (toIndex!0 (select (arr!48509 a!2804) j!70) mask!2512) (bvand (bvxor lt!654364 (bvlshr lt!654364 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1506995 d!158303))

(declare-fun d!158307 () Bool)

(assert (=> d!158307 (= (validKeyInArray!0 (select (arr!48509 a!2804) i!961)) (and (not (= (select (arr!48509 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48509 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506990 d!158307))

(push 1)

