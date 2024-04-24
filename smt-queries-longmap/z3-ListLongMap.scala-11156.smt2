; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130680 () Bool)

(assert start!130680)

(declare-fun b!1532220 () Bool)

(declare-fun res!1048451 () Bool)

(declare-fun e!853954 () Bool)

(assert (=> b!1532220 (=> (not res!1048451) (not e!853954))))

(declare-datatypes ((array!101767 0))(
  ( (array!101768 (arr!49102 (Array (_ BitVec 32) (_ BitVec 64))) (size!49653 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101767)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101767 (_ BitVec 32)) Bool)

(assert (=> b!1532220 (= res!1048451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532221 () Bool)

(declare-fun res!1048452 () Bool)

(assert (=> b!1532221 (=> (not res!1048452) (not e!853954))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532221 (= res!1048452 (validKeyInArray!0 (select (arr!49102 a!2804) j!70)))))

(declare-fun b!1532222 () Bool)

(declare-fun res!1048442 () Bool)

(assert (=> b!1532222 (=> (not res!1048442) (not e!853954))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1532222 (= res!1048442 (validKeyInArray!0 (select (arr!49102 a!2804) i!961)))))

(declare-fun b!1532223 () Bool)

(declare-fun res!1048444 () Bool)

(assert (=> b!1532223 (=> (not res!1048444) (not e!853954))))

(assert (=> b!1532223 (= res!1048444 (and (= (size!49653 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49653 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49653 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532225 () Bool)

(declare-fun e!853955 () Bool)

(declare-fun e!853957 () Bool)

(assert (=> b!1532225 (= e!853955 (not e!853957))))

(declare-fun res!1048450 () Bool)

(assert (=> b!1532225 (=> res!1048450 e!853957)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1532225 (= res!1048450 (or (not (= (select (arr!49102 a!2804) j!70) (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853953 () Bool)

(assert (=> b!1532225 e!853953))

(declare-fun res!1048443 () Bool)

(assert (=> b!1532225 (=> (not res!1048443) (not e!853953))))

(assert (=> b!1532225 (= res!1048443 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51139 0))(
  ( (Unit!51140) )
))
(declare-fun lt!663472 () Unit!51139)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51139)

(assert (=> b!1532225 (= lt!663472 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532226 () Bool)

(declare-fun res!1048445 () Bool)

(assert (=> b!1532226 (=> (not res!1048445) (not e!853954))))

(declare-datatypes ((List!35572 0))(
  ( (Nil!35569) (Cons!35568 (h!37022 (_ BitVec 64)) (t!50258 List!35572)) )
))
(declare-fun arrayNoDuplicates!0 (array!101767 (_ BitVec 32) List!35572) Bool)

(assert (=> b!1532226 (= res!1048445 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35569))))

(declare-fun b!1532227 () Bool)

(declare-fun res!1048441 () Bool)

(assert (=> b!1532227 (=> (not res!1048441) (not e!853955))))

(declare-datatypes ((SeekEntryResult!13160 0))(
  ( (MissingZero!13160 (index!55035 (_ BitVec 32))) (Found!13160 (index!55036 (_ BitVec 32))) (Intermediate!13160 (undefined!13972 Bool) (index!55037 (_ BitVec 32)) (x!136926 (_ BitVec 32))) (Undefined!13160) (MissingVacant!13160 (index!55038 (_ BitVec 32))) )
))
(declare-fun lt!663471 () SeekEntryResult!13160)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101767 (_ BitVec 32)) SeekEntryResult!13160)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532227 (= res!1048441 (= lt!663471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101768 (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49653 a!2804)) mask!2512)))))

(declare-fun res!1048449 () Bool)

(assert (=> start!130680 (=> (not res!1048449) (not e!853954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130680 (= res!1048449 (validMask!0 mask!2512))))

(assert (=> start!130680 e!853954))

(assert (=> start!130680 true))

(declare-fun array_inv!38383 (array!101767) Bool)

(assert (=> start!130680 (array_inv!38383 a!2804)))

(declare-fun b!1532224 () Bool)

(declare-fun res!1048447 () Bool)

(assert (=> b!1532224 (=> (not res!1048447) (not e!853955))))

(declare-fun lt!663473 () SeekEntryResult!13160)

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1532224 (= res!1048447 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49102 a!2804) j!70) a!2804 mask!2512) lt!663473))))

(declare-fun b!1532228 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101767 (_ BitVec 32)) SeekEntryResult!13160)

(assert (=> b!1532228 (= e!853953 (= (seekEntry!0 (select (arr!49102 a!2804) j!70) a!2804 mask!2512) (Found!13160 j!70)))))

(declare-fun b!1532229 () Bool)

(declare-fun res!1048446 () Bool)

(assert (=> b!1532229 (=> (not res!1048446) (not e!853954))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1532229 (= res!1048446 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49653 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49653 a!2804))))))

(declare-fun b!1532230 () Bool)

(assert (=> b!1532230 (= e!853954 e!853955)))

(declare-fun res!1048448 () Bool)

(assert (=> b!1532230 (=> (not res!1048448) (not e!853955))))

(assert (=> b!1532230 (= res!1048448 (= lt!663471 lt!663473))))

(assert (=> b!1532230 (= lt!663473 (Intermediate!13160 false resIndex!21 resX!21))))

(assert (=> b!1532230 (= lt!663471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49102 a!2804) j!70) mask!2512) (select (arr!49102 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532231 () Bool)

(assert (=> b!1532231 (= e!853957 (and (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110)))))

(declare-fun lt!663474 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532231 (= lt!663474 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(assert (= (and start!130680 res!1048449) b!1532223))

(assert (= (and b!1532223 res!1048444) b!1532222))

(assert (= (and b!1532222 res!1048442) b!1532221))

(assert (= (and b!1532221 res!1048452) b!1532220))

(assert (= (and b!1532220 res!1048451) b!1532226))

(assert (= (and b!1532226 res!1048445) b!1532229))

(assert (= (and b!1532229 res!1048446) b!1532230))

(assert (= (and b!1532230 res!1048448) b!1532224))

(assert (= (and b!1532224 res!1048447) b!1532227))

(assert (= (and b!1532227 res!1048441) b!1532225))

(assert (= (and b!1532225 res!1048443) b!1532228))

(assert (= (and b!1532225 (not res!1048450)) b!1532231))

(declare-fun m!1415041 () Bool)

(assert (=> b!1532230 m!1415041))

(assert (=> b!1532230 m!1415041))

(declare-fun m!1415043 () Bool)

(assert (=> b!1532230 m!1415043))

(assert (=> b!1532230 m!1415043))

(assert (=> b!1532230 m!1415041))

(declare-fun m!1415045 () Bool)

(assert (=> b!1532230 m!1415045))

(assert (=> b!1532221 m!1415041))

(assert (=> b!1532221 m!1415041))

(declare-fun m!1415047 () Bool)

(assert (=> b!1532221 m!1415047))

(declare-fun m!1415049 () Bool)

(assert (=> b!1532227 m!1415049))

(declare-fun m!1415051 () Bool)

(assert (=> b!1532227 m!1415051))

(assert (=> b!1532227 m!1415051))

(declare-fun m!1415053 () Bool)

(assert (=> b!1532227 m!1415053))

(assert (=> b!1532227 m!1415053))

(assert (=> b!1532227 m!1415051))

(declare-fun m!1415055 () Bool)

(assert (=> b!1532227 m!1415055))

(assert (=> b!1532225 m!1415041))

(declare-fun m!1415057 () Bool)

(assert (=> b!1532225 m!1415057))

(assert (=> b!1532225 m!1415049))

(assert (=> b!1532225 m!1415051))

(declare-fun m!1415059 () Bool)

(assert (=> b!1532225 m!1415059))

(assert (=> b!1532228 m!1415041))

(assert (=> b!1532228 m!1415041))

(declare-fun m!1415061 () Bool)

(assert (=> b!1532228 m!1415061))

(declare-fun m!1415063 () Bool)

(assert (=> start!130680 m!1415063))

(declare-fun m!1415065 () Bool)

(assert (=> start!130680 m!1415065))

(declare-fun m!1415067 () Bool)

(assert (=> b!1532220 m!1415067))

(declare-fun m!1415069 () Bool)

(assert (=> b!1532222 m!1415069))

(assert (=> b!1532222 m!1415069))

(declare-fun m!1415071 () Bool)

(assert (=> b!1532222 m!1415071))

(declare-fun m!1415073 () Bool)

(assert (=> b!1532231 m!1415073))

(assert (=> b!1532224 m!1415041))

(assert (=> b!1532224 m!1415041))

(declare-fun m!1415075 () Bool)

(assert (=> b!1532224 m!1415075))

(declare-fun m!1415077 () Bool)

(assert (=> b!1532226 m!1415077))

(check-sat (not b!1532230) (not b!1532231) (not b!1532226) (not b!1532227) (not b!1532221) (not b!1532222) (not start!130680) (not b!1532225) (not b!1532228) (not b!1532220) (not b!1532224))
(check-sat)
(get-model)

(declare-fun d!160403 () Bool)

(declare-fun lt!663501 () (_ BitVec 32))

(assert (=> d!160403 (and (bvsge lt!663501 #b00000000000000000000000000000000) (bvslt lt!663501 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160403 (= lt!663501 (choose!52 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(assert (=> d!160403 (validMask!0 mask!2512)))

(assert (=> d!160403 (= (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512) lt!663501)))

(declare-fun bs!43892 () Bool)

(assert (= bs!43892 d!160403))

(declare-fun m!1415155 () Bool)

(assert (=> bs!43892 m!1415155))

(assert (=> bs!43892 m!1415063))

(assert (=> b!1532231 d!160403))

(declare-fun bm!68622 () Bool)

(declare-fun call!68625 () Bool)

(assert (=> bm!68622 (= call!68625 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1532312 () Bool)

(declare-fun e!853996 () Bool)

(assert (=> b!1532312 (= e!853996 call!68625)))

(declare-fun b!1532313 () Bool)

(declare-fun e!853994 () Bool)

(assert (=> b!1532313 (= e!853994 e!853996)))

(declare-fun lt!663509 () (_ BitVec 64))

(assert (=> b!1532313 (= lt!663509 (select (arr!49102 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!663508 () Unit!51139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101767 (_ BitVec 64) (_ BitVec 32)) Unit!51139)

(assert (=> b!1532313 (= lt!663508 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!663509 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532313 (arrayContainsKey!0 a!2804 lt!663509 #b00000000000000000000000000000000)))

(declare-fun lt!663510 () Unit!51139)

(assert (=> b!1532313 (= lt!663510 lt!663508)))

(declare-fun res!1048529 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101767 (_ BitVec 32)) SeekEntryResult!13160)

(assert (=> b!1532313 (= res!1048529 (= (seekEntryOrOpen!0 (select (arr!49102 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13160 #b00000000000000000000000000000000)))))

(assert (=> b!1532313 (=> (not res!1048529) (not e!853996))))

(declare-fun d!160405 () Bool)

(declare-fun res!1048530 () Bool)

(declare-fun e!853995 () Bool)

(assert (=> d!160405 (=> res!1048530 e!853995)))

(assert (=> d!160405 (= res!1048530 (bvsge #b00000000000000000000000000000000 (size!49653 a!2804)))))

(assert (=> d!160405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!853995)))

(declare-fun b!1532314 () Bool)

(assert (=> b!1532314 (= e!853995 e!853994)))

(declare-fun c!141457 () Bool)

(assert (=> b!1532314 (= c!141457 (validKeyInArray!0 (select (arr!49102 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1532315 () Bool)

(assert (=> b!1532315 (= e!853994 call!68625)))

(assert (= (and d!160405 (not res!1048530)) b!1532314))

(assert (= (and b!1532314 c!141457) b!1532313))

(assert (= (and b!1532314 (not c!141457)) b!1532315))

(assert (= (and b!1532313 res!1048529) b!1532312))

(assert (= (or b!1532312 b!1532315) bm!68622))

(declare-fun m!1415157 () Bool)

(assert (=> bm!68622 m!1415157))

(declare-fun m!1415159 () Bool)

(assert (=> b!1532313 m!1415159))

(declare-fun m!1415161 () Bool)

(assert (=> b!1532313 m!1415161))

(declare-fun m!1415163 () Bool)

(assert (=> b!1532313 m!1415163))

(assert (=> b!1532313 m!1415159))

(declare-fun m!1415165 () Bool)

(assert (=> b!1532313 m!1415165))

(assert (=> b!1532314 m!1415159))

(assert (=> b!1532314 m!1415159))

(declare-fun m!1415167 () Bool)

(assert (=> b!1532314 m!1415167))

(assert (=> b!1532220 d!160405))

(declare-fun call!68626 () Bool)

(declare-fun bm!68623 () Bool)

(assert (=> bm!68623 (= call!68626 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1532316 () Bool)

(declare-fun e!853999 () Bool)

(assert (=> b!1532316 (= e!853999 call!68626)))

(declare-fun b!1532317 () Bool)

(declare-fun e!853997 () Bool)

(assert (=> b!1532317 (= e!853997 e!853999)))

(declare-fun lt!663512 () (_ BitVec 64))

(assert (=> b!1532317 (= lt!663512 (select (arr!49102 a!2804) j!70))))

(declare-fun lt!663511 () Unit!51139)

(assert (=> b!1532317 (= lt!663511 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!663512 j!70))))

(assert (=> b!1532317 (arrayContainsKey!0 a!2804 lt!663512 #b00000000000000000000000000000000)))

(declare-fun lt!663513 () Unit!51139)

(assert (=> b!1532317 (= lt!663513 lt!663511)))

(declare-fun res!1048531 () Bool)

(assert (=> b!1532317 (= res!1048531 (= (seekEntryOrOpen!0 (select (arr!49102 a!2804) j!70) a!2804 mask!2512) (Found!13160 j!70)))))

(assert (=> b!1532317 (=> (not res!1048531) (not e!853999))))

(declare-fun d!160407 () Bool)

(declare-fun res!1048532 () Bool)

(declare-fun e!853998 () Bool)

(assert (=> d!160407 (=> res!1048532 e!853998)))

(assert (=> d!160407 (= res!1048532 (bvsge j!70 (size!49653 a!2804)))))

(assert (=> d!160407 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!853998)))

(declare-fun b!1532318 () Bool)

(assert (=> b!1532318 (= e!853998 e!853997)))

(declare-fun c!141458 () Bool)

(assert (=> b!1532318 (= c!141458 (validKeyInArray!0 (select (arr!49102 a!2804) j!70)))))

(declare-fun b!1532319 () Bool)

(assert (=> b!1532319 (= e!853997 call!68626)))

(assert (= (and d!160407 (not res!1048532)) b!1532318))

(assert (= (and b!1532318 c!141458) b!1532317))

(assert (= (and b!1532318 (not c!141458)) b!1532319))

(assert (= (and b!1532317 res!1048531) b!1532316))

(assert (= (or b!1532316 b!1532319) bm!68623))

(declare-fun m!1415169 () Bool)

(assert (=> bm!68623 m!1415169))

(assert (=> b!1532317 m!1415041))

(declare-fun m!1415171 () Bool)

(assert (=> b!1532317 m!1415171))

(declare-fun m!1415173 () Bool)

(assert (=> b!1532317 m!1415173))

(assert (=> b!1532317 m!1415041))

(declare-fun m!1415175 () Bool)

(assert (=> b!1532317 m!1415175))

(assert (=> b!1532318 m!1415041))

(assert (=> b!1532318 m!1415041))

(assert (=> b!1532318 m!1415047))

(assert (=> b!1532225 d!160407))

(declare-fun d!160409 () Bool)

(assert (=> d!160409 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!663516 () Unit!51139)

(declare-fun choose!38 (array!101767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51139)

(assert (=> d!160409 (= lt!663516 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!160409 (validMask!0 mask!2512)))

(assert (=> d!160409 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!663516)))

(declare-fun bs!43893 () Bool)

(assert (= bs!43893 d!160409))

(assert (=> bs!43893 m!1415059))

(declare-fun m!1415177 () Bool)

(assert (=> bs!43893 m!1415177))

(assert (=> bs!43893 m!1415063))

(assert (=> b!1532225 d!160409))

(declare-fun b!1532356 () Bool)

(declare-fun lt!663525 () SeekEntryResult!13160)

(assert (=> b!1532356 (and (bvsge (index!55037 lt!663525) #b00000000000000000000000000000000) (bvslt (index!55037 lt!663525) (size!49653 a!2804)))))

(declare-fun e!854024 () Bool)

(assert (=> b!1532356 (= e!854024 (= (select (arr!49102 a!2804) (index!55037 lt!663525)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!160411 () Bool)

(declare-fun e!854020 () Bool)

(assert (=> d!160411 e!854020))

(declare-fun c!141473 () Bool)

(get-info :version)

(assert (=> d!160411 (= c!141473 (and ((_ is Intermediate!13160) lt!663525) (undefined!13972 lt!663525)))))

(declare-fun e!854023 () SeekEntryResult!13160)

(assert (=> d!160411 (= lt!663525 e!854023)))

(declare-fun c!141471 () Bool)

(assert (=> d!160411 (= c!141471 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!663526 () (_ BitVec 64))

(assert (=> d!160411 (= lt!663526 (select (arr!49102 a!2804) (toIndex!0 (select (arr!49102 a!2804) j!70) mask!2512)))))

(assert (=> d!160411 (validMask!0 mask!2512)))

(assert (=> d!160411 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49102 a!2804) j!70) mask!2512) (select (arr!49102 a!2804) j!70) a!2804 mask!2512) lt!663525)))

(declare-fun b!1532357 () Bool)

(assert (=> b!1532357 (and (bvsge (index!55037 lt!663525) #b00000000000000000000000000000000) (bvslt (index!55037 lt!663525) (size!49653 a!2804)))))

(declare-fun res!1048547 () Bool)

(assert (=> b!1532357 (= res!1048547 (= (select (arr!49102 a!2804) (index!55037 lt!663525)) (select (arr!49102 a!2804) j!70)))))

(assert (=> b!1532357 (=> res!1048547 e!854024)))

(declare-fun e!854022 () Bool)

(assert (=> b!1532357 (= e!854022 e!854024)))

(declare-fun b!1532358 () Bool)

(assert (=> b!1532358 (= e!854020 e!854022)))

(declare-fun res!1048546 () Bool)

(assert (=> b!1532358 (= res!1048546 (and ((_ is Intermediate!13160) lt!663525) (not (undefined!13972 lt!663525)) (bvslt (x!136926 lt!663525) #b01111111111111111111111111111110) (bvsge (x!136926 lt!663525) #b00000000000000000000000000000000) (bvsge (x!136926 lt!663525) #b00000000000000000000000000000000)))))

(assert (=> b!1532358 (=> (not res!1048546) (not e!854022))))

(declare-fun b!1532359 () Bool)

(assert (=> b!1532359 (= e!854020 (bvsge (x!136926 lt!663525) #b01111111111111111111111111111110))))

(declare-fun b!1532360 () Bool)

(declare-fun e!854021 () SeekEntryResult!13160)

(assert (=> b!1532360 (= e!854021 (Intermediate!13160 false (toIndex!0 (select (arr!49102 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1532361 () Bool)

(assert (=> b!1532361 (= e!854023 (Intermediate!13160 true (toIndex!0 (select (arr!49102 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1532362 () Bool)

(assert (=> b!1532362 (= e!854023 e!854021)))

(declare-fun c!141472 () Bool)

(assert (=> b!1532362 (= c!141472 (or (= lt!663526 (select (arr!49102 a!2804) j!70)) (= (bvadd lt!663526 lt!663526) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1532363 () Bool)

(assert (=> b!1532363 (and (bvsge (index!55037 lt!663525) #b00000000000000000000000000000000) (bvslt (index!55037 lt!663525) (size!49653 a!2804)))))

(declare-fun res!1048545 () Bool)

(assert (=> b!1532363 (= res!1048545 (= (select (arr!49102 a!2804) (index!55037 lt!663525)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1532363 (=> res!1048545 e!854024)))

(declare-fun b!1532364 () Bool)

(assert (=> b!1532364 (= e!854021 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49102 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!49102 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!160411 c!141471) b!1532361))

(assert (= (and d!160411 (not c!141471)) b!1532362))

(assert (= (and b!1532362 c!141472) b!1532360))

(assert (= (and b!1532362 (not c!141472)) b!1532364))

(assert (= (and d!160411 c!141473) b!1532359))

(assert (= (and d!160411 (not c!141473)) b!1532358))

(assert (= (and b!1532358 res!1048546) b!1532357))

(assert (= (and b!1532357 (not res!1048547)) b!1532363))

(assert (= (and b!1532363 (not res!1048545)) b!1532356))

(declare-fun m!1415179 () Bool)

(assert (=> b!1532363 m!1415179))

(assert (=> d!160411 m!1415043))

(declare-fun m!1415181 () Bool)

(assert (=> d!160411 m!1415181))

(assert (=> d!160411 m!1415063))

(assert (=> b!1532357 m!1415179))

(assert (=> b!1532356 m!1415179))

(assert (=> b!1532364 m!1415043))

(declare-fun m!1415183 () Bool)

(assert (=> b!1532364 m!1415183))

(assert (=> b!1532364 m!1415183))

(assert (=> b!1532364 m!1415041))

(declare-fun m!1415185 () Bool)

(assert (=> b!1532364 m!1415185))

(assert (=> b!1532230 d!160411))

(declare-fun d!160423 () Bool)

(declare-fun lt!663534 () (_ BitVec 32))

(declare-fun lt!663533 () (_ BitVec 32))

(assert (=> d!160423 (= lt!663534 (bvmul (bvxor lt!663533 (bvlshr lt!663533 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160423 (= lt!663533 ((_ extract 31 0) (bvand (bvxor (select (arr!49102 a!2804) j!70) (bvlshr (select (arr!49102 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160423 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048548 (let ((h!37025 ((_ extract 31 0) (bvand (bvxor (select (arr!49102 a!2804) j!70) (bvlshr (select (arr!49102 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136932 (bvmul (bvxor h!37025 (bvlshr h!37025 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136932 (bvlshr x!136932 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048548 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048548 #b00000000000000000000000000000000))))))

(assert (=> d!160423 (= (toIndex!0 (select (arr!49102 a!2804) j!70) mask!2512) (bvand (bvxor lt!663534 (bvlshr lt!663534 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1532230 d!160423))

(declare-fun b!1532374 () Bool)

(declare-fun lt!663535 () SeekEntryResult!13160)

(assert (=> b!1532374 (and (bvsge (index!55037 lt!663535) #b00000000000000000000000000000000) (bvslt (index!55037 lt!663535) (size!49653 (array!101768 (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49653 a!2804)))))))

(declare-fun e!854034 () Bool)

(assert (=> b!1532374 (= e!854034 (= (select (arr!49102 (array!101768 (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49653 a!2804))) (index!55037 lt!663535)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!160427 () Bool)

(declare-fun e!854030 () Bool)

(assert (=> d!160427 e!854030))

(declare-fun c!141479 () Bool)

(assert (=> d!160427 (= c!141479 (and ((_ is Intermediate!13160) lt!663535) (undefined!13972 lt!663535)))))

(declare-fun e!854033 () SeekEntryResult!13160)

(assert (=> d!160427 (= lt!663535 e!854033)))

(declare-fun c!141477 () Bool)

(assert (=> d!160427 (= c!141477 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!663536 () (_ BitVec 64))

(assert (=> d!160427 (= lt!663536 (select (arr!49102 (array!101768 (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49653 a!2804))) (toIndex!0 (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!160427 (validMask!0 mask!2512)))

(assert (=> d!160427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101768 (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49653 a!2804)) mask!2512) lt!663535)))

(declare-fun b!1532375 () Bool)

(assert (=> b!1532375 (and (bvsge (index!55037 lt!663535) #b00000000000000000000000000000000) (bvslt (index!55037 lt!663535) (size!49653 (array!101768 (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49653 a!2804)))))))

(declare-fun res!1048555 () Bool)

(assert (=> b!1532375 (= res!1048555 (= (select (arr!49102 (array!101768 (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49653 a!2804))) (index!55037 lt!663535)) (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1532375 (=> res!1048555 e!854034)))

(declare-fun e!854032 () Bool)

(assert (=> b!1532375 (= e!854032 e!854034)))

(declare-fun b!1532376 () Bool)

(assert (=> b!1532376 (= e!854030 e!854032)))

(declare-fun res!1048554 () Bool)

(assert (=> b!1532376 (= res!1048554 (and ((_ is Intermediate!13160) lt!663535) (not (undefined!13972 lt!663535)) (bvslt (x!136926 lt!663535) #b01111111111111111111111111111110) (bvsge (x!136926 lt!663535) #b00000000000000000000000000000000) (bvsge (x!136926 lt!663535) #b00000000000000000000000000000000)))))

(assert (=> b!1532376 (=> (not res!1048554) (not e!854032))))

(declare-fun b!1532377 () Bool)

(assert (=> b!1532377 (= e!854030 (bvsge (x!136926 lt!663535) #b01111111111111111111111111111110))))

(declare-fun e!854031 () SeekEntryResult!13160)

(declare-fun b!1532378 () Bool)

(assert (=> b!1532378 (= e!854031 (Intermediate!13160 false (toIndex!0 (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1532379 () Bool)

(assert (=> b!1532379 (= e!854033 (Intermediate!13160 true (toIndex!0 (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1532380 () Bool)

(assert (=> b!1532380 (= e!854033 e!854031)))

(declare-fun c!141478 () Bool)

(assert (=> b!1532380 (= c!141478 (or (= lt!663536 (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!663536 lt!663536) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1532381 () Bool)

(assert (=> b!1532381 (and (bvsge (index!55037 lt!663535) #b00000000000000000000000000000000) (bvslt (index!55037 lt!663535) (size!49653 (array!101768 (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49653 a!2804)))))))

(declare-fun res!1048553 () Bool)

(assert (=> b!1532381 (= res!1048553 (= (select (arr!49102 (array!101768 (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49653 a!2804))) (index!55037 lt!663535)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1532381 (=> res!1048553 e!854034)))

(declare-fun b!1532382 () Bool)

(assert (=> b!1532382 (= e!854031 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101768 (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49653 a!2804)) mask!2512))))

(assert (= (and d!160427 c!141477) b!1532379))

(assert (= (and d!160427 (not c!141477)) b!1532380))

(assert (= (and b!1532380 c!141478) b!1532378))

(assert (= (and b!1532380 (not c!141478)) b!1532382))

(assert (= (and d!160427 c!141479) b!1532377))

(assert (= (and d!160427 (not c!141479)) b!1532376))

(assert (= (and b!1532376 res!1048554) b!1532375))

(assert (= (and b!1532375 (not res!1048555)) b!1532381))

(assert (= (and b!1532381 (not res!1048553)) b!1532374))

(declare-fun m!1415195 () Bool)

(assert (=> b!1532381 m!1415195))

(assert (=> d!160427 m!1415053))

(declare-fun m!1415197 () Bool)

(assert (=> d!160427 m!1415197))

(assert (=> d!160427 m!1415063))

(assert (=> b!1532375 m!1415195))

(assert (=> b!1532374 m!1415195))

(assert (=> b!1532382 m!1415053))

(declare-fun m!1415199 () Bool)

(assert (=> b!1532382 m!1415199))

(assert (=> b!1532382 m!1415199))

(assert (=> b!1532382 m!1415051))

(declare-fun m!1415201 () Bool)

(assert (=> b!1532382 m!1415201))

(assert (=> b!1532227 d!160427))

(declare-fun d!160429 () Bool)

(declare-fun lt!663538 () (_ BitVec 32))

(declare-fun lt!663537 () (_ BitVec 32))

(assert (=> d!160429 (= lt!663538 (bvmul (bvxor lt!663537 (bvlshr lt!663537 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160429 (= lt!663537 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160429 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048548 (let ((h!37025 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136932 (bvmul (bvxor h!37025 (bvlshr h!37025 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136932 (bvlshr x!136932 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048548 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048548 #b00000000000000000000000000000000))))))

(assert (=> d!160429 (= (toIndex!0 (select (store (arr!49102 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!663538 (bvlshr lt!663538 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1532227 d!160429))

(declare-fun d!160431 () Bool)

(assert (=> d!160431 (= (validKeyInArray!0 (select (arr!49102 a!2804) j!70)) (and (not (= (select (arr!49102 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49102 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532221 d!160431))

(declare-fun bm!68626 () Bool)

(declare-fun call!68629 () Bool)

(declare-fun c!141491 () Bool)

(assert (=> bm!68626 (= call!68629 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141491 (Cons!35568 (select (arr!49102 a!2804) #b00000000000000000000000000000000) Nil!35569) Nil!35569)))))

(declare-fun b!1532421 () Bool)

(declare-fun e!854059 () Bool)

(declare-fun e!854058 () Bool)

(assert (=> b!1532421 (= e!854059 e!854058)))

(declare-fun res!1048572 () Bool)

(assert (=> b!1532421 (=> (not res!1048572) (not e!854058))))

(declare-fun e!854060 () Bool)

(assert (=> b!1532421 (= res!1048572 (not e!854060))))

(declare-fun res!1048573 () Bool)

(assert (=> b!1532421 (=> (not res!1048573) (not e!854060))))

(assert (=> b!1532421 (= res!1048573 (validKeyInArray!0 (select (arr!49102 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1532422 () Bool)

(declare-fun e!854061 () Bool)

(assert (=> b!1532422 (= e!854061 call!68629)))

(declare-fun d!160433 () Bool)

(declare-fun res!1048571 () Bool)

(assert (=> d!160433 (=> res!1048571 e!854059)))

(assert (=> d!160433 (= res!1048571 (bvsge #b00000000000000000000000000000000 (size!49653 a!2804)))))

(assert (=> d!160433 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35569) e!854059)))

(declare-fun b!1532420 () Bool)

(assert (=> b!1532420 (= e!854061 call!68629)))

(declare-fun b!1532423 () Bool)

(declare-fun contains!10047 (List!35572 (_ BitVec 64)) Bool)

(assert (=> b!1532423 (= e!854060 (contains!10047 Nil!35569 (select (arr!49102 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1532424 () Bool)

(assert (=> b!1532424 (= e!854058 e!854061)))

(assert (=> b!1532424 (= c!141491 (validKeyInArray!0 (select (arr!49102 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!160433 (not res!1048571)) b!1532421))

(assert (= (and b!1532421 res!1048573) b!1532423))

(assert (= (and b!1532421 res!1048572) b!1532424))

(assert (= (and b!1532424 c!141491) b!1532422))

(assert (= (and b!1532424 (not c!141491)) b!1532420))

(assert (= (or b!1532422 b!1532420) bm!68626))

(assert (=> bm!68626 m!1415159))

(declare-fun m!1415213 () Bool)

(assert (=> bm!68626 m!1415213))

(assert (=> b!1532421 m!1415159))

(assert (=> b!1532421 m!1415159))

(assert (=> b!1532421 m!1415167))

(assert (=> b!1532423 m!1415159))

(assert (=> b!1532423 m!1415159))

(declare-fun m!1415215 () Bool)

(assert (=> b!1532423 m!1415215))

(assert (=> b!1532424 m!1415159))

(assert (=> b!1532424 m!1415159))

(assert (=> b!1532424 m!1415167))

(assert (=> b!1532226 d!160433))

(declare-fun d!160447 () Bool)

(assert (=> d!160447 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130680 d!160447))

(declare-fun d!160455 () Bool)

(assert (=> d!160455 (= (array_inv!38383 a!2804) (bvsge (size!49653 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130680 d!160455))

(declare-fun b!1532496 () Bool)

(declare-fun e!854103 () SeekEntryResult!13160)

(declare-fun lt!663607 () SeekEntryResult!13160)

(assert (=> b!1532496 (= e!854103 (MissingZero!13160 (index!55037 lt!663607)))))

(declare-fun b!1532497 () Bool)

(declare-fun e!854104 () SeekEntryResult!13160)

(declare-fun e!854105 () SeekEntryResult!13160)

(assert (=> b!1532497 (= e!854104 e!854105)))

(declare-fun lt!663605 () (_ BitVec 64))

(assert (=> b!1532497 (= lt!663605 (select (arr!49102 a!2804) (index!55037 lt!663607)))))

(declare-fun c!141523 () Bool)

(assert (=> b!1532497 (= c!141523 (= lt!663605 (select (arr!49102 a!2804) j!70)))))

(declare-fun b!1532498 () Bool)

(assert (=> b!1532498 (= e!854105 (Found!13160 (index!55037 lt!663607)))))

(declare-fun d!160457 () Bool)

(declare-fun lt!663606 () SeekEntryResult!13160)

(assert (=> d!160457 (and (or ((_ is MissingVacant!13160) lt!663606) (not ((_ is Found!13160) lt!663606)) (and (bvsge (index!55036 lt!663606) #b00000000000000000000000000000000) (bvslt (index!55036 lt!663606) (size!49653 a!2804)))) (not ((_ is MissingVacant!13160) lt!663606)) (or (not ((_ is Found!13160) lt!663606)) (= (select (arr!49102 a!2804) (index!55036 lt!663606)) (select (arr!49102 a!2804) j!70))))))

(assert (=> d!160457 (= lt!663606 e!854104)))

(declare-fun c!141521 () Bool)

(assert (=> d!160457 (= c!141521 (and ((_ is Intermediate!13160) lt!663607) (undefined!13972 lt!663607)))))

(assert (=> d!160457 (= lt!663607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49102 a!2804) j!70) mask!2512) (select (arr!49102 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!160457 (validMask!0 mask!2512)))

(assert (=> d!160457 (= (seekEntry!0 (select (arr!49102 a!2804) j!70) a!2804 mask!2512) lt!663606)))

(declare-fun b!1532499 () Bool)

(declare-fun lt!663604 () SeekEntryResult!13160)

(assert (=> b!1532499 (= e!854103 (ite ((_ is MissingVacant!13160) lt!663604) (MissingZero!13160 (index!55038 lt!663604)) lt!663604))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101767 (_ BitVec 32)) SeekEntryResult!13160)

(assert (=> b!1532499 (= lt!663604 (seekKeyOrZeroReturnVacant!0 (x!136926 lt!663607) (index!55037 lt!663607) (index!55037 lt!663607) (select (arr!49102 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532500 () Bool)

(declare-fun c!141522 () Bool)

(assert (=> b!1532500 (= c!141522 (= lt!663605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1532500 (= e!854105 e!854103)))

(declare-fun b!1532501 () Bool)

(assert (=> b!1532501 (= e!854104 Undefined!13160)))

(assert (= (and d!160457 c!141521) b!1532501))

(assert (= (and d!160457 (not c!141521)) b!1532497))

(assert (= (and b!1532497 c!141523) b!1532498))

(assert (= (and b!1532497 (not c!141523)) b!1532500))

(assert (= (and b!1532500 c!141522) b!1532496))

(assert (= (and b!1532500 (not c!141522)) b!1532499))

(declare-fun m!1415241 () Bool)

(assert (=> b!1532497 m!1415241))

(declare-fun m!1415243 () Bool)

(assert (=> d!160457 m!1415243))

(assert (=> d!160457 m!1415041))

(assert (=> d!160457 m!1415043))

(assert (=> d!160457 m!1415043))

(assert (=> d!160457 m!1415041))

(assert (=> d!160457 m!1415045))

(assert (=> d!160457 m!1415063))

(assert (=> b!1532499 m!1415041))

(declare-fun m!1415245 () Bool)

(assert (=> b!1532499 m!1415245))

(assert (=> b!1532228 d!160457))

(declare-fun d!160463 () Bool)

(assert (=> d!160463 (= (validKeyInArray!0 (select (arr!49102 a!2804) i!961)) (and (not (= (select (arr!49102 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49102 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532222 d!160463))

(declare-fun b!1532502 () Bool)

(declare-fun lt!663608 () SeekEntryResult!13160)

(assert (=> b!1532502 (and (bvsge (index!55037 lt!663608) #b00000000000000000000000000000000) (bvslt (index!55037 lt!663608) (size!49653 a!2804)))))

(declare-fun e!854110 () Bool)

(assert (=> b!1532502 (= e!854110 (= (select (arr!49102 a!2804) (index!55037 lt!663608)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!160465 () Bool)

(declare-fun e!854106 () Bool)

(assert (=> d!160465 e!854106))

(declare-fun c!141526 () Bool)

(assert (=> d!160465 (= c!141526 (and ((_ is Intermediate!13160) lt!663608) (undefined!13972 lt!663608)))))

(declare-fun e!854109 () SeekEntryResult!13160)

(assert (=> d!160465 (= lt!663608 e!854109)))

(declare-fun c!141524 () Bool)

(assert (=> d!160465 (= c!141524 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!663609 () (_ BitVec 64))

(assert (=> d!160465 (= lt!663609 (select (arr!49102 a!2804) index!487))))

(assert (=> d!160465 (validMask!0 mask!2512)))

(assert (=> d!160465 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49102 a!2804) j!70) a!2804 mask!2512) lt!663608)))

(declare-fun b!1532503 () Bool)

(assert (=> b!1532503 (and (bvsge (index!55037 lt!663608) #b00000000000000000000000000000000) (bvslt (index!55037 lt!663608) (size!49653 a!2804)))))

(declare-fun res!1048589 () Bool)

(assert (=> b!1532503 (= res!1048589 (= (select (arr!49102 a!2804) (index!55037 lt!663608)) (select (arr!49102 a!2804) j!70)))))

(assert (=> b!1532503 (=> res!1048589 e!854110)))

(declare-fun e!854108 () Bool)

(assert (=> b!1532503 (= e!854108 e!854110)))

(declare-fun b!1532504 () Bool)

(assert (=> b!1532504 (= e!854106 e!854108)))

(declare-fun res!1048588 () Bool)

(assert (=> b!1532504 (= res!1048588 (and ((_ is Intermediate!13160) lt!663608) (not (undefined!13972 lt!663608)) (bvslt (x!136926 lt!663608) #b01111111111111111111111111111110) (bvsge (x!136926 lt!663608) #b00000000000000000000000000000000) (bvsge (x!136926 lt!663608) x!534)))))

(assert (=> b!1532504 (=> (not res!1048588) (not e!854108))))

(declare-fun b!1532505 () Bool)

(assert (=> b!1532505 (= e!854106 (bvsge (x!136926 lt!663608) #b01111111111111111111111111111110))))

(declare-fun b!1532506 () Bool)

(declare-fun e!854107 () SeekEntryResult!13160)

(assert (=> b!1532506 (= e!854107 (Intermediate!13160 false index!487 x!534))))

(declare-fun b!1532507 () Bool)

(assert (=> b!1532507 (= e!854109 (Intermediate!13160 true index!487 x!534))))

(declare-fun b!1532508 () Bool)

(assert (=> b!1532508 (= e!854109 e!854107)))

(declare-fun c!141525 () Bool)

(assert (=> b!1532508 (= c!141525 (or (= lt!663609 (select (arr!49102 a!2804) j!70)) (= (bvadd lt!663609 lt!663609) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1532509 () Bool)

(assert (=> b!1532509 (and (bvsge (index!55037 lt!663608) #b00000000000000000000000000000000) (bvslt (index!55037 lt!663608) (size!49653 a!2804)))))

(declare-fun res!1048587 () Bool)

(assert (=> b!1532509 (= res!1048587 (= (select (arr!49102 a!2804) (index!55037 lt!663608)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1532509 (=> res!1048587 e!854110)))

(declare-fun b!1532510 () Bool)

(assert (=> b!1532510 (= e!854107 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!49102 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!160465 c!141524) b!1532507))

(assert (= (and d!160465 (not c!141524)) b!1532508))

(assert (= (and b!1532508 c!141525) b!1532506))

(assert (= (and b!1532508 (not c!141525)) b!1532510))

(assert (= (and d!160465 c!141526) b!1532505))

(assert (= (and d!160465 (not c!141526)) b!1532504))

(assert (= (and b!1532504 res!1048588) b!1532503))

(assert (= (and b!1532503 (not res!1048589)) b!1532509))

(assert (= (and b!1532509 (not res!1048587)) b!1532502))

(declare-fun m!1415247 () Bool)

(assert (=> b!1532509 m!1415247))

(declare-fun m!1415249 () Bool)

(assert (=> d!160465 m!1415249))

(assert (=> d!160465 m!1415063))

(assert (=> b!1532503 m!1415247))

(assert (=> b!1532502 m!1415247))

(declare-fun m!1415255 () Bool)

(assert (=> b!1532510 m!1415255))

(assert (=> b!1532510 m!1415255))

(assert (=> b!1532510 m!1415041))

(declare-fun m!1415261 () Bool)

(assert (=> b!1532510 m!1415261))

(assert (=> b!1532224 d!160465))

(check-sat (not d!160427) (not d!160411) (not bm!68622) (not b!1532499) (not b!1532313) (not d!160409) (not d!160403) (not b!1532364) (not b!1532423) (not b!1532424) (not bm!68626) (not d!160465) (not bm!68623) (not b!1532314) (not b!1532510) (not b!1532421) (not b!1532317) (not b!1532318) (not b!1532382) (not d!160457))
(check-sat)
