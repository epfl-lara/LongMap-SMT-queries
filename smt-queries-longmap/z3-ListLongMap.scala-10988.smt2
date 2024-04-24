; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129020 () Bool)

(assert start!129020)

(declare-fun b!1510322 () Bool)

(declare-fun res!1029157 () Bool)

(declare-fun e!843856 () Bool)

(assert (=> b!1510322 (=> (not res!1029157) (not e!843856))))

(declare-datatypes ((array!100729 0))(
  ( (array!100730 (arr!48598 (Array (_ BitVec 32) (_ BitVec 64))) (size!49149 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100729)

(declare-datatypes ((List!35068 0))(
  ( (Nil!35065) (Cons!35064 (h!36488 (_ BitVec 64)) (t!49754 List!35068)) )
))
(declare-fun arrayNoDuplicates!0 (array!100729 (_ BitVec 32) List!35068) Bool)

(assert (=> b!1510322 (= res!1029157 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35065))))

(declare-fun b!1510324 () Bool)

(declare-fun e!843857 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!655305 () (_ BitVec 32))

(assert (=> b!1510324 (= e!843857 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!655305 #b00000000000000000000000000000000) (bvsge lt!655305 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510324 (= lt!655305 (toIndex!0 (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1510325 () Bool)

(declare-fun res!1029153 () Bool)

(assert (=> b!1510325 (=> (not res!1029153) (not e!843856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510325 (= res!1029153 (validKeyInArray!0 (select (arr!48598 a!2804) j!70)))))

(declare-fun b!1510326 () Bool)

(declare-fun res!1029154 () Bool)

(assert (=> b!1510326 (=> (not res!1029154) (not e!843857))))

(declare-datatypes ((SeekEntryResult!12662 0))(
  ( (MissingZero!12662 (index!53043 (_ BitVec 32))) (Found!12662 (index!53044 (_ BitVec 32))) (Intermediate!12662 (undefined!13474 Bool) (index!53045 (_ BitVec 32)) (x!135003 (_ BitVec 32))) (Undefined!12662) (MissingVacant!12662 (index!53046 (_ BitVec 32))) )
))
(declare-fun lt!655306 () SeekEntryResult!12662)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100729 (_ BitVec 32)) SeekEntryResult!12662)

(assert (=> b!1510326 (= res!1029154 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48598 a!2804) j!70) a!2804 mask!2512) lt!655306))))

(declare-fun b!1510327 () Bool)

(declare-fun res!1029161 () Bool)

(assert (=> b!1510327 (=> (not res!1029161) (not e!843856))))

(assert (=> b!1510327 (= res!1029161 (validKeyInArray!0 (select (arr!48598 a!2804) i!961)))))

(declare-fun b!1510328 () Bool)

(declare-fun res!1029160 () Bool)

(assert (=> b!1510328 (=> (not res!1029160) (not e!843856))))

(assert (=> b!1510328 (= res!1029160 (and (= (size!49149 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49149 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49149 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510329 () Bool)

(declare-fun res!1029155 () Bool)

(assert (=> b!1510329 (=> (not res!1029155) (not e!843856))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510329 (= res!1029155 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49149 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49149 a!2804))))))

(declare-fun b!1510330 () Bool)

(declare-fun res!1029158 () Bool)

(assert (=> b!1510330 (=> (not res!1029158) (not e!843856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100729 (_ BitVec 32)) Bool)

(assert (=> b!1510330 (= res!1029158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1029159 () Bool)

(assert (=> start!129020 (=> (not res!1029159) (not e!843856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129020 (= res!1029159 (validMask!0 mask!2512))))

(assert (=> start!129020 e!843856))

(assert (=> start!129020 true))

(declare-fun array_inv!37879 (array!100729) Bool)

(assert (=> start!129020 (array_inv!37879 a!2804)))

(declare-fun b!1510323 () Bool)

(assert (=> b!1510323 (= e!843856 e!843857)))

(declare-fun res!1029156 () Bool)

(assert (=> b!1510323 (=> (not res!1029156) (not e!843857))))

(assert (=> b!1510323 (= res!1029156 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48598 a!2804) j!70) mask!2512) (select (arr!48598 a!2804) j!70) a!2804 mask!2512) lt!655306))))

(assert (=> b!1510323 (= lt!655306 (Intermediate!12662 false resIndex!21 resX!21))))

(assert (= (and start!129020 res!1029159) b!1510328))

(assert (= (and b!1510328 res!1029160) b!1510327))

(assert (= (and b!1510327 res!1029161) b!1510325))

(assert (= (and b!1510325 res!1029153) b!1510330))

(assert (= (and b!1510330 res!1029158) b!1510322))

(assert (= (and b!1510322 res!1029157) b!1510329))

(assert (= (and b!1510329 res!1029155) b!1510323))

(assert (= (and b!1510323 res!1029156) b!1510326))

(assert (= (and b!1510326 res!1029154) b!1510324))

(declare-fun m!1392795 () Bool)

(assert (=> b!1510326 m!1392795))

(assert (=> b!1510326 m!1392795))

(declare-fun m!1392797 () Bool)

(assert (=> b!1510326 m!1392797))

(declare-fun m!1392799 () Bool)

(assert (=> b!1510322 m!1392799))

(assert (=> b!1510323 m!1392795))

(assert (=> b!1510323 m!1392795))

(declare-fun m!1392801 () Bool)

(assert (=> b!1510323 m!1392801))

(assert (=> b!1510323 m!1392801))

(assert (=> b!1510323 m!1392795))

(declare-fun m!1392803 () Bool)

(assert (=> b!1510323 m!1392803))

(declare-fun m!1392805 () Bool)

(assert (=> start!129020 m!1392805))

(declare-fun m!1392807 () Bool)

(assert (=> start!129020 m!1392807))

(assert (=> b!1510325 m!1392795))

(assert (=> b!1510325 m!1392795))

(declare-fun m!1392809 () Bool)

(assert (=> b!1510325 m!1392809))

(declare-fun m!1392811 () Bool)

(assert (=> b!1510324 m!1392811))

(declare-fun m!1392813 () Bool)

(assert (=> b!1510324 m!1392813))

(assert (=> b!1510324 m!1392813))

(declare-fun m!1392815 () Bool)

(assert (=> b!1510324 m!1392815))

(declare-fun m!1392817 () Bool)

(assert (=> b!1510327 m!1392817))

(assert (=> b!1510327 m!1392817))

(declare-fun m!1392819 () Bool)

(assert (=> b!1510327 m!1392819))

(declare-fun m!1392821 () Bool)

(assert (=> b!1510330 m!1392821))

(check-sat (not b!1510325) (not b!1510327) (not start!129020) (not b!1510322) (not b!1510323) (not b!1510324) (not b!1510326) (not b!1510330))
(check-sat)
(get-model)

(declare-fun b!1510403 () Bool)

(declare-fun lt!655324 () SeekEntryResult!12662)

(assert (=> b!1510403 (and (bvsge (index!53045 lt!655324) #b00000000000000000000000000000000) (bvslt (index!53045 lt!655324) (size!49149 a!2804)))))

(declare-fun res!1029224 () Bool)

(assert (=> b!1510403 (= res!1029224 (= (select (arr!48598 a!2804) (index!53045 lt!655324)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!843887 () Bool)

(assert (=> b!1510403 (=> res!1029224 e!843887)))

(declare-fun b!1510404 () Bool)

(declare-fun e!843888 () Bool)

(declare-fun e!843891 () Bool)

(assert (=> b!1510404 (= e!843888 e!843891)))

(declare-fun res!1029222 () Bool)

(get-info :version)

(assert (=> b!1510404 (= res!1029222 (and ((_ is Intermediate!12662) lt!655324) (not (undefined!13474 lt!655324)) (bvslt (x!135003 lt!655324) #b01111111111111111111111111111110) (bvsge (x!135003 lt!655324) #b00000000000000000000000000000000) (bvsge (x!135003 lt!655324) #b00000000000000000000000000000000)))))

(assert (=> b!1510404 (=> (not res!1029222) (not e!843891))))

(declare-fun d!158959 () Bool)

(assert (=> d!158959 e!843888))

(declare-fun c!140142 () Bool)

(assert (=> d!158959 (= c!140142 (and ((_ is Intermediate!12662) lt!655324) (undefined!13474 lt!655324)))))

(declare-fun e!843890 () SeekEntryResult!12662)

(assert (=> d!158959 (= lt!655324 e!843890)))

(declare-fun c!140141 () Bool)

(assert (=> d!158959 (= c!140141 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!655323 () (_ BitVec 64))

(assert (=> d!158959 (= lt!655323 (select (arr!48598 a!2804) (toIndex!0 (select (arr!48598 a!2804) j!70) mask!2512)))))

(assert (=> d!158959 (validMask!0 mask!2512)))

(assert (=> d!158959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48598 a!2804) j!70) mask!2512) (select (arr!48598 a!2804) j!70) a!2804 mask!2512) lt!655324)))

(declare-fun b!1510405 () Bool)

(assert (=> b!1510405 (and (bvsge (index!53045 lt!655324) #b00000000000000000000000000000000) (bvslt (index!53045 lt!655324) (size!49149 a!2804)))))

(assert (=> b!1510405 (= e!843887 (= (select (arr!48598 a!2804) (index!53045 lt!655324)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1510406 () Bool)

(declare-fun e!843889 () SeekEntryResult!12662)

(assert (=> b!1510406 (= e!843890 e!843889)))

(declare-fun c!140143 () Bool)

(assert (=> b!1510406 (= c!140143 (or (= lt!655323 (select (arr!48598 a!2804) j!70)) (= (bvadd lt!655323 lt!655323) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1510407 () Bool)

(assert (=> b!1510407 (= e!843888 (bvsge (x!135003 lt!655324) #b01111111111111111111111111111110))))

(declare-fun b!1510408 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510408 (= e!843889 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48598 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48598 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510409 () Bool)

(assert (=> b!1510409 (= e!843889 (Intermediate!12662 false (toIndex!0 (select (arr!48598 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1510410 () Bool)

(assert (=> b!1510410 (= e!843890 (Intermediate!12662 true (toIndex!0 (select (arr!48598 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1510411 () Bool)

(assert (=> b!1510411 (and (bvsge (index!53045 lt!655324) #b00000000000000000000000000000000) (bvslt (index!53045 lt!655324) (size!49149 a!2804)))))

(declare-fun res!1029223 () Bool)

(assert (=> b!1510411 (= res!1029223 (= (select (arr!48598 a!2804) (index!53045 lt!655324)) (select (arr!48598 a!2804) j!70)))))

(assert (=> b!1510411 (=> res!1029223 e!843887)))

(assert (=> b!1510411 (= e!843891 e!843887)))

(assert (= (and d!158959 c!140141) b!1510410))

(assert (= (and d!158959 (not c!140141)) b!1510406))

(assert (= (and b!1510406 c!140143) b!1510409))

(assert (= (and b!1510406 (not c!140143)) b!1510408))

(assert (= (and d!158959 c!140142) b!1510407))

(assert (= (and d!158959 (not c!140142)) b!1510404))

(assert (= (and b!1510404 res!1029222) b!1510411))

(assert (= (and b!1510411 (not res!1029223)) b!1510403))

(assert (= (and b!1510403 (not res!1029224)) b!1510405))

(declare-fun m!1392879 () Bool)

(assert (=> b!1510403 m!1392879))

(assert (=> d!158959 m!1392801))

(declare-fun m!1392881 () Bool)

(assert (=> d!158959 m!1392881))

(assert (=> d!158959 m!1392805))

(assert (=> b!1510405 m!1392879))

(assert (=> b!1510411 m!1392879))

(assert (=> b!1510408 m!1392801))

(declare-fun m!1392883 () Bool)

(assert (=> b!1510408 m!1392883))

(assert (=> b!1510408 m!1392883))

(assert (=> b!1510408 m!1392795))

(declare-fun m!1392885 () Bool)

(assert (=> b!1510408 m!1392885))

(assert (=> b!1510323 d!158959))

(declare-fun d!158965 () Bool)

(declare-fun lt!655334 () (_ BitVec 32))

(declare-fun lt!655333 () (_ BitVec 32))

(assert (=> d!158965 (= lt!655334 (bvmul (bvxor lt!655333 (bvlshr lt!655333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158965 (= lt!655333 ((_ extract 31 0) (bvand (bvxor (select (arr!48598 a!2804) j!70) (bvlshr (select (arr!48598 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158965 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1029226 (let ((h!36492 ((_ extract 31 0) (bvand (bvxor (select (arr!48598 a!2804) j!70) (bvlshr (select (arr!48598 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135008 (bvmul (bvxor h!36492 (bvlshr h!36492 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135008 (bvlshr x!135008 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1029226 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1029226 #b00000000000000000000000000000000))))))

(assert (=> d!158965 (= (toIndex!0 (select (arr!48598 a!2804) j!70) mask!2512) (bvand (bvxor lt!655334 (bvlshr lt!655334 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1510323 d!158965))

(declare-fun b!1510432 () Bool)

(declare-fun e!843909 () Bool)

(declare-fun e!843910 () Bool)

(assert (=> b!1510432 (= e!843909 e!843910)))

(declare-fun c!140148 () Bool)

(assert (=> b!1510432 (= c!140148 (validKeyInArray!0 (select (arr!48598 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1510433 () Bool)

(declare-fun e!843911 () Bool)

(declare-fun contains!10018 (List!35068 (_ BitVec 64)) Bool)

(assert (=> b!1510433 (= e!843911 (contains!10018 Nil!35065 (select (arr!48598 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158969 () Bool)

(declare-fun res!1029239 () Bool)

(declare-fun e!843908 () Bool)

(assert (=> d!158969 (=> res!1029239 e!843908)))

(assert (=> d!158969 (= res!1029239 (bvsge #b00000000000000000000000000000000 (size!49149 a!2804)))))

(assert (=> d!158969 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35065) e!843908)))

(declare-fun b!1510434 () Bool)

(declare-fun call!68402 () Bool)

(assert (=> b!1510434 (= e!843910 call!68402)))

(declare-fun b!1510435 () Bool)

(assert (=> b!1510435 (= e!843910 call!68402)))

(declare-fun bm!68399 () Bool)

(assert (=> bm!68399 (= call!68402 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140148 (Cons!35064 (select (arr!48598 a!2804) #b00000000000000000000000000000000) Nil!35065) Nil!35065)))))

(declare-fun b!1510436 () Bool)

(assert (=> b!1510436 (= e!843908 e!843909)))

(declare-fun res!1029240 () Bool)

(assert (=> b!1510436 (=> (not res!1029240) (not e!843909))))

(assert (=> b!1510436 (= res!1029240 (not e!843911))))

(declare-fun res!1029241 () Bool)

(assert (=> b!1510436 (=> (not res!1029241) (not e!843911))))

(assert (=> b!1510436 (= res!1029241 (validKeyInArray!0 (select (arr!48598 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158969 (not res!1029239)) b!1510436))

(assert (= (and b!1510436 res!1029241) b!1510433))

(assert (= (and b!1510436 res!1029240) b!1510432))

(assert (= (and b!1510432 c!140148) b!1510435))

(assert (= (and b!1510432 (not c!140148)) b!1510434))

(assert (= (or b!1510435 b!1510434) bm!68399))

(declare-fun m!1392887 () Bool)

(assert (=> b!1510432 m!1392887))

(assert (=> b!1510432 m!1392887))

(declare-fun m!1392889 () Bool)

(assert (=> b!1510432 m!1392889))

(assert (=> b!1510433 m!1392887))

(assert (=> b!1510433 m!1392887))

(declare-fun m!1392891 () Bool)

(assert (=> b!1510433 m!1392891))

(assert (=> bm!68399 m!1392887))

(declare-fun m!1392893 () Bool)

(assert (=> bm!68399 m!1392893))

(assert (=> b!1510436 m!1392887))

(assert (=> b!1510436 m!1392887))

(assert (=> b!1510436 m!1392889))

(assert (=> b!1510322 d!158969))

(declare-fun d!158981 () Bool)

(assert (=> d!158981 (= (validKeyInArray!0 (select (arr!48598 a!2804) i!961)) (and (not (= (select (arr!48598 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48598 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1510327 d!158981))

(declare-fun b!1510442 () Bool)

(declare-fun lt!655338 () SeekEntryResult!12662)

(assert (=> b!1510442 (and (bvsge (index!53045 lt!655338) #b00000000000000000000000000000000) (bvslt (index!53045 lt!655338) (size!49149 a!2804)))))

(declare-fun res!1029247 () Bool)

(assert (=> b!1510442 (= res!1029247 (= (select (arr!48598 a!2804) (index!53045 lt!655338)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!843916 () Bool)

(assert (=> b!1510442 (=> res!1029247 e!843916)))

(declare-fun b!1510443 () Bool)

(declare-fun e!843917 () Bool)

(declare-fun e!843920 () Bool)

(assert (=> b!1510443 (= e!843917 e!843920)))

(declare-fun res!1029245 () Bool)

(assert (=> b!1510443 (= res!1029245 (and ((_ is Intermediate!12662) lt!655338) (not (undefined!13474 lt!655338)) (bvslt (x!135003 lt!655338) #b01111111111111111111111111111110) (bvsge (x!135003 lt!655338) #b00000000000000000000000000000000) (bvsge (x!135003 lt!655338) x!534)))))

(assert (=> b!1510443 (=> (not res!1029245) (not e!843920))))

(declare-fun d!158983 () Bool)

(assert (=> d!158983 e!843917))

(declare-fun c!140151 () Bool)

(assert (=> d!158983 (= c!140151 (and ((_ is Intermediate!12662) lt!655338) (undefined!13474 lt!655338)))))

(declare-fun e!843919 () SeekEntryResult!12662)

(assert (=> d!158983 (= lt!655338 e!843919)))

(declare-fun c!140150 () Bool)

(assert (=> d!158983 (= c!140150 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!655337 () (_ BitVec 64))

(assert (=> d!158983 (= lt!655337 (select (arr!48598 a!2804) index!487))))

(assert (=> d!158983 (validMask!0 mask!2512)))

(assert (=> d!158983 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48598 a!2804) j!70) a!2804 mask!2512) lt!655338)))

(declare-fun b!1510444 () Bool)

(assert (=> b!1510444 (and (bvsge (index!53045 lt!655338) #b00000000000000000000000000000000) (bvslt (index!53045 lt!655338) (size!49149 a!2804)))))

(assert (=> b!1510444 (= e!843916 (= (select (arr!48598 a!2804) (index!53045 lt!655338)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1510445 () Bool)

(declare-fun e!843918 () SeekEntryResult!12662)

(assert (=> b!1510445 (= e!843919 e!843918)))

(declare-fun c!140152 () Bool)

(assert (=> b!1510445 (= c!140152 (or (= lt!655337 (select (arr!48598 a!2804) j!70)) (= (bvadd lt!655337 lt!655337) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1510446 () Bool)

(assert (=> b!1510446 (= e!843917 (bvsge (x!135003 lt!655338) #b01111111111111111111111111111110))))

(declare-fun b!1510447 () Bool)

(assert (=> b!1510447 (= e!843918 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48598 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510448 () Bool)

(assert (=> b!1510448 (= e!843918 (Intermediate!12662 false index!487 x!534))))

(declare-fun b!1510449 () Bool)

(assert (=> b!1510449 (= e!843919 (Intermediate!12662 true index!487 x!534))))

(declare-fun b!1510450 () Bool)

(assert (=> b!1510450 (and (bvsge (index!53045 lt!655338) #b00000000000000000000000000000000) (bvslt (index!53045 lt!655338) (size!49149 a!2804)))))

(declare-fun res!1029246 () Bool)

(assert (=> b!1510450 (= res!1029246 (= (select (arr!48598 a!2804) (index!53045 lt!655338)) (select (arr!48598 a!2804) j!70)))))

(assert (=> b!1510450 (=> res!1029246 e!843916)))

(assert (=> b!1510450 (= e!843920 e!843916)))

(assert (= (and d!158983 c!140150) b!1510449))

(assert (= (and d!158983 (not c!140150)) b!1510445))

(assert (= (and b!1510445 c!140152) b!1510448))

(assert (= (and b!1510445 (not c!140152)) b!1510447))

(assert (= (and d!158983 c!140151) b!1510446))

(assert (= (and d!158983 (not c!140151)) b!1510443))

(assert (= (and b!1510443 res!1029245) b!1510450))

(assert (= (and b!1510450 (not res!1029246)) b!1510442))

(assert (= (and b!1510442 (not res!1029247)) b!1510444))

(declare-fun m!1392903 () Bool)

(assert (=> b!1510442 m!1392903))

(declare-fun m!1392905 () Bool)

(assert (=> d!158983 m!1392905))

(assert (=> d!158983 m!1392805))

(assert (=> b!1510444 m!1392903))

(assert (=> b!1510450 m!1392903))

(declare-fun m!1392907 () Bool)

(assert (=> b!1510447 m!1392907))

(assert (=> b!1510447 m!1392907))

(assert (=> b!1510447 m!1392795))

(declare-fun m!1392909 () Bool)

(assert (=> b!1510447 m!1392909))

(assert (=> b!1510326 d!158983))

(declare-fun d!158987 () Bool)

(declare-fun res!1029264 () Bool)

(declare-fun e!843946 () Bool)

(assert (=> d!158987 (=> res!1029264 e!843946)))

(assert (=> d!158987 (= res!1029264 (bvsge #b00000000000000000000000000000000 (size!49149 a!2804)))))

(assert (=> d!158987 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!843946)))

(declare-fun bm!68406 () Bool)

(declare-fun call!68409 () Bool)

(assert (=> bm!68406 (= call!68409 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1510489 () Bool)

(declare-fun e!843947 () Bool)

(assert (=> b!1510489 (= e!843947 call!68409)))

(declare-fun b!1510490 () Bool)

(assert (=> b!1510490 (= e!843946 e!843947)))

(declare-fun c!140164 () Bool)

(assert (=> b!1510490 (= c!140164 (validKeyInArray!0 (select (arr!48598 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1510491 () Bool)

(declare-fun e!843948 () Bool)

(assert (=> b!1510491 (= e!843947 e!843948)))

(declare-fun lt!655358 () (_ BitVec 64))

(assert (=> b!1510491 (= lt!655358 (select (arr!48598 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50269 0))(
  ( (Unit!50270) )
))
(declare-fun lt!655360 () Unit!50269)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100729 (_ BitVec 64) (_ BitVec 32)) Unit!50269)

(assert (=> b!1510491 (= lt!655360 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!655358 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1510491 (arrayContainsKey!0 a!2804 lt!655358 #b00000000000000000000000000000000)))

(declare-fun lt!655359 () Unit!50269)

(assert (=> b!1510491 (= lt!655359 lt!655360)))

(declare-fun res!1029265 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100729 (_ BitVec 32)) SeekEntryResult!12662)

(assert (=> b!1510491 (= res!1029265 (= (seekEntryOrOpen!0 (select (arr!48598 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12662 #b00000000000000000000000000000000)))))

(assert (=> b!1510491 (=> (not res!1029265) (not e!843948))))

(declare-fun b!1510492 () Bool)

(assert (=> b!1510492 (= e!843948 call!68409)))

(assert (= (and d!158987 (not res!1029264)) b!1510490))

(assert (= (and b!1510490 c!140164) b!1510491))

(assert (= (and b!1510490 (not c!140164)) b!1510489))

(assert (= (and b!1510491 res!1029265) b!1510492))

(assert (= (or b!1510492 b!1510489) bm!68406))

(declare-fun m!1392919 () Bool)

(assert (=> bm!68406 m!1392919))

(assert (=> b!1510490 m!1392887))

(assert (=> b!1510490 m!1392887))

(assert (=> b!1510490 m!1392889))

(assert (=> b!1510491 m!1392887))

(declare-fun m!1392921 () Bool)

(assert (=> b!1510491 m!1392921))

(declare-fun m!1392923 () Bool)

(assert (=> b!1510491 m!1392923))

(assert (=> b!1510491 m!1392887))

(declare-fun m!1392925 () Bool)

(assert (=> b!1510491 m!1392925))

(assert (=> b!1510330 d!158987))

(declare-fun d!158991 () Bool)

(assert (=> d!158991 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129020 d!158991))

(declare-fun d!158999 () Bool)

(assert (=> d!158999 (= (array_inv!37879 a!2804) (bvsge (size!49149 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129020 d!158999))

(declare-fun d!159001 () Bool)

(assert (=> d!159001 (= (validKeyInArray!0 (select (arr!48598 a!2804) j!70)) (and (not (= (select (arr!48598 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48598 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1510325 d!159001))

(declare-fun d!159003 () Bool)

(declare-fun lt!655370 () (_ BitVec 32))

(declare-fun lt!655369 () (_ BitVec 32))

(assert (=> d!159003 (= lt!655370 (bvmul (bvxor lt!655369 (bvlshr lt!655369 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159003 (= lt!655369 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159003 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1029226 (let ((h!36492 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135008 (bvmul (bvxor h!36492 (bvlshr h!36492 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135008 (bvlshr x!135008 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1029226 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1029226 #b00000000000000000000000000000000))))))

(assert (=> d!159003 (= (toIndex!0 (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!655370 (bvlshr lt!655370 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1510324 d!159003))

(check-sat (not d!158983) (not b!1510433) (not d!158959) (not b!1510491) (not bm!68406) (not b!1510490) (not b!1510408) (not b!1510447) (not b!1510432) (not b!1510436) (not bm!68399))
(check-sat)
