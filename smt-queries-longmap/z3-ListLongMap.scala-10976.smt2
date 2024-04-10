; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128522 () Bool)

(assert start!128522)

(declare-fun b!1507014 () Bool)

(declare-fun res!1027344 () Bool)

(declare-fun e!842072 () Bool)

(assert (=> b!1507014 (=> (not res!1027344) (not e!842072))))

(declare-datatypes ((SeekEntryResult!12681 0))(
  ( (MissingZero!12681 (index!53119 (_ BitVec 32))) (Found!12681 (index!53120 (_ BitVec 32))) (Intermediate!12681 (undefined!13493 Bool) (index!53121 (_ BitVec 32)) (x!134871 (_ BitVec 32))) (Undefined!12681) (MissingVacant!12681 (index!53122 (_ BitVec 32))) )
))
(declare-fun lt!654292 () SeekEntryResult!12681)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100534 0))(
  ( (array!100535 (arr!48510 (Array (_ BitVec 32) (_ BitVec 64))) (size!49060 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100534)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100534 (_ BitVec 32)) SeekEntryResult!12681)

(assert (=> b!1507014 (= res!1027344 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48510 a!2804) j!70) a!2804 mask!2512) lt!654292))))

(declare-fun b!1507015 () Bool)

(declare-fun res!1027340 () Bool)

(declare-fun e!842074 () Bool)

(assert (=> b!1507015 (=> (not res!1027340) (not e!842074))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507015 (= res!1027340 (validKeyInArray!0 (select (arr!48510 a!2804) i!961)))))

(declare-fun b!1507016 () Bool)

(declare-fun res!1027341 () Bool)

(assert (=> b!1507016 (=> (not res!1027341) (not e!842074))))

(assert (=> b!1507016 (= res!1027341 (validKeyInArray!0 (select (arr!48510 a!2804) j!70)))))

(declare-fun b!1507017 () Bool)

(declare-fun res!1027342 () Bool)

(assert (=> b!1507017 (=> (not res!1027342) (not e!842074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100534 (_ BitVec 32)) Bool)

(assert (=> b!1507017 (= res!1027342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507018 () Bool)

(declare-fun res!1027345 () Bool)

(assert (=> b!1507018 (=> (not res!1027345) (not e!842074))))

(assert (=> b!1507018 (= res!1027345 (and (= (size!49060 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49060 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49060 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1027343 () Bool)

(assert (=> start!128522 (=> (not res!1027343) (not e!842074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128522 (= res!1027343 (validMask!0 mask!2512))))

(assert (=> start!128522 e!842074))

(assert (=> start!128522 true))

(declare-fun array_inv!37538 (array!100534) Bool)

(assert (=> start!128522 (array_inv!37538 a!2804)))

(declare-fun b!1507019 () Bool)

(declare-fun res!1027339 () Bool)

(assert (=> b!1507019 (=> (not res!1027339) (not e!842074))))

(declare-datatypes ((List!34993 0))(
  ( (Nil!34990) (Cons!34989 (h!36389 (_ BitVec 64)) (t!49687 List!34993)) )
))
(declare-fun arrayNoDuplicates!0 (array!100534 (_ BitVec 32) List!34993) Bool)

(assert (=> b!1507019 (= res!1027339 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34990))))

(declare-fun b!1507020 () Bool)

(declare-fun res!1027338 () Bool)

(assert (=> b!1507020 (=> (not res!1027338) (not e!842074))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507020 (= res!1027338 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49060 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49060 a!2804))))))

(declare-fun b!1507021 () Bool)

(assert (=> b!1507021 (= e!842072 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(declare-fun b!1507022 () Bool)

(assert (=> b!1507022 (= e!842074 e!842072)))

(declare-fun res!1027337 () Bool)

(assert (=> b!1507022 (=> (not res!1027337) (not e!842072))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507022 (= res!1027337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48510 a!2804) j!70) mask!2512) (select (arr!48510 a!2804) j!70) a!2804 mask!2512) lt!654292))))

(assert (=> b!1507022 (= lt!654292 (Intermediate!12681 false resIndex!21 resX!21))))

(assert (= (and start!128522 res!1027343) b!1507018))

(assert (= (and b!1507018 res!1027345) b!1507015))

(assert (= (and b!1507015 res!1027340) b!1507016))

(assert (= (and b!1507016 res!1027341) b!1507017))

(assert (= (and b!1507017 res!1027342) b!1507019))

(assert (= (and b!1507019 res!1027339) b!1507020))

(assert (= (and b!1507020 res!1027338) b!1507022))

(assert (= (and b!1507022 res!1027337) b!1507014))

(assert (= (and b!1507014 res!1027344) b!1507021))

(declare-fun m!1389887 () Bool)

(assert (=> b!1507014 m!1389887))

(assert (=> b!1507014 m!1389887))

(declare-fun m!1389889 () Bool)

(assert (=> b!1507014 m!1389889))

(declare-fun m!1389891 () Bool)

(assert (=> b!1507019 m!1389891))

(assert (=> b!1507022 m!1389887))

(assert (=> b!1507022 m!1389887))

(declare-fun m!1389893 () Bool)

(assert (=> b!1507022 m!1389893))

(assert (=> b!1507022 m!1389893))

(assert (=> b!1507022 m!1389887))

(declare-fun m!1389895 () Bool)

(assert (=> b!1507022 m!1389895))

(declare-fun m!1389897 () Bool)

(assert (=> b!1507015 m!1389897))

(assert (=> b!1507015 m!1389897))

(declare-fun m!1389899 () Bool)

(assert (=> b!1507015 m!1389899))

(declare-fun m!1389901 () Bool)

(assert (=> start!128522 m!1389901))

(declare-fun m!1389903 () Bool)

(assert (=> start!128522 m!1389903))

(assert (=> b!1507016 m!1389887))

(assert (=> b!1507016 m!1389887))

(declare-fun m!1389905 () Bool)

(assert (=> b!1507016 m!1389905))

(declare-fun m!1389907 () Bool)

(assert (=> b!1507017 m!1389907))

(check-sat (not b!1507022) (not b!1507014) (not start!128522) (not b!1507017) (not b!1507015) (not b!1507016) (not b!1507019))
(check-sat)
(get-model)

(declare-fun d!158259 () Bool)

(assert (=> d!158259 (= (validKeyInArray!0 (select (arr!48510 a!2804) j!70)) (and (not (= (select (arr!48510 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48510 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507016 d!158259))

(declare-fun d!158261 () Bool)

(assert (=> d!158261 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128522 d!158261))

(declare-fun d!158263 () Bool)

(assert (=> d!158263 (= (array_inv!37538 a!2804) (bvsge (size!49060 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128522 d!158263))

(declare-fun d!158265 () Bool)

(assert (=> d!158265 (= (validKeyInArray!0 (select (arr!48510 a!2804) i!961)) (and (not (= (select (arr!48510 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48510 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507015 d!158265))

(declare-fun b!1507080 () Bool)

(declare-fun e!842107 () Bool)

(declare-fun e!842105 () Bool)

(assert (=> b!1507080 (= e!842107 e!842105)))

(declare-fun res!1027385 () Bool)

(declare-fun lt!654309 () SeekEntryResult!12681)

(get-info :version)

(assert (=> b!1507080 (= res!1027385 (and ((_ is Intermediate!12681) lt!654309) (not (undefined!13493 lt!654309)) (bvslt (x!134871 lt!654309) #b01111111111111111111111111111110) (bvsge (x!134871 lt!654309) #b00000000000000000000000000000000) (bvsge (x!134871 lt!654309) x!534)))))

(assert (=> b!1507080 (=> (not res!1027385) (not e!842105))))

(declare-fun b!1507081 () Bool)

(assert (=> b!1507081 (and (bvsge (index!53121 lt!654309) #b00000000000000000000000000000000) (bvslt (index!53121 lt!654309) (size!49060 a!2804)))))

(declare-fun res!1027387 () Bool)

(assert (=> b!1507081 (= res!1027387 (= (select (arr!48510 a!2804) (index!53121 lt!654309)) (select (arr!48510 a!2804) j!70)))))

(declare-fun e!842106 () Bool)

(assert (=> b!1507081 (=> res!1027387 e!842106)))

(assert (=> b!1507081 (= e!842105 e!842106)))

(declare-fun b!1507082 () Bool)

(declare-fun e!842103 () SeekEntryResult!12681)

(declare-fun e!842104 () SeekEntryResult!12681)

(assert (=> b!1507082 (= e!842103 e!842104)))

(declare-fun c!139383 () Bool)

(declare-fun lt!654310 () (_ BitVec 64))

(assert (=> b!1507082 (= c!139383 (or (= lt!654310 (select (arr!48510 a!2804) j!70)) (= (bvadd lt!654310 lt!654310) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507084 () Bool)

(assert (=> b!1507084 (= e!842103 (Intermediate!12681 true index!487 x!534))))

(declare-fun b!1507085 () Bool)

(assert (=> b!1507085 (and (bvsge (index!53121 lt!654309) #b00000000000000000000000000000000) (bvslt (index!53121 lt!654309) (size!49060 a!2804)))))

(assert (=> b!1507085 (= e!842106 (= (select (arr!48510 a!2804) (index!53121 lt!654309)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507086 () Bool)

(assert (=> b!1507086 (and (bvsge (index!53121 lt!654309) #b00000000000000000000000000000000) (bvslt (index!53121 lt!654309) (size!49060 a!2804)))))

(declare-fun res!1027386 () Bool)

(assert (=> b!1507086 (= res!1027386 (= (select (arr!48510 a!2804) (index!53121 lt!654309)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507086 (=> res!1027386 e!842106)))

(declare-fun b!1507087 () Bool)

(assert (=> b!1507087 (= e!842107 (bvsge (x!134871 lt!654309) #b01111111111111111111111111111110))))

(declare-fun b!1507088 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507088 (= e!842104 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48510 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507083 () Bool)

(assert (=> b!1507083 (= e!842104 (Intermediate!12681 false index!487 x!534))))

(declare-fun d!158267 () Bool)

(assert (=> d!158267 e!842107))

(declare-fun c!139385 () Bool)

(assert (=> d!158267 (= c!139385 (and ((_ is Intermediate!12681) lt!654309) (undefined!13493 lt!654309)))))

(assert (=> d!158267 (= lt!654309 e!842103)))

(declare-fun c!139384 () Bool)

(assert (=> d!158267 (= c!139384 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158267 (= lt!654310 (select (arr!48510 a!2804) index!487))))

(assert (=> d!158267 (validMask!0 mask!2512)))

(assert (=> d!158267 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48510 a!2804) j!70) a!2804 mask!2512) lt!654309)))

(assert (= (and d!158267 c!139384) b!1507084))

(assert (= (and d!158267 (not c!139384)) b!1507082))

(assert (= (and b!1507082 c!139383) b!1507083))

(assert (= (and b!1507082 (not c!139383)) b!1507088))

(assert (= (and d!158267 c!139385) b!1507087))

(assert (= (and d!158267 (not c!139385)) b!1507080))

(assert (= (and b!1507080 res!1027385) b!1507081))

(assert (= (and b!1507081 (not res!1027387)) b!1507086))

(assert (= (and b!1507086 (not res!1027386)) b!1507085))

(declare-fun m!1389943 () Bool)

(assert (=> d!158267 m!1389943))

(assert (=> d!158267 m!1389901))

(declare-fun m!1389945 () Bool)

(assert (=> b!1507088 m!1389945))

(assert (=> b!1507088 m!1389945))

(assert (=> b!1507088 m!1389887))

(declare-fun m!1389947 () Bool)

(assert (=> b!1507088 m!1389947))

(declare-fun m!1389949 () Bool)

(assert (=> b!1507086 m!1389949))

(assert (=> b!1507081 m!1389949))

(assert (=> b!1507085 m!1389949))

(assert (=> b!1507014 d!158267))

(declare-fun b!1507126 () Bool)

(declare-fun e!842134 () Bool)

(declare-fun call!68244 () Bool)

(assert (=> b!1507126 (= e!842134 call!68244)))

(declare-fun bm!68241 () Bool)

(declare-fun c!139397 () Bool)

(assert (=> bm!68241 (= call!68244 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139397 (Cons!34989 (select (arr!48510 a!2804) #b00000000000000000000000000000000) Nil!34990) Nil!34990)))))

(declare-fun d!158279 () Bool)

(declare-fun res!1027404 () Bool)

(declare-fun e!842131 () Bool)

(assert (=> d!158279 (=> res!1027404 e!842131)))

(assert (=> d!158279 (= res!1027404 (bvsge #b00000000000000000000000000000000 (size!49060 a!2804)))))

(assert (=> d!158279 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34990) e!842131)))

(declare-fun b!1507127 () Bool)

(declare-fun e!842132 () Bool)

(assert (=> b!1507127 (= e!842132 e!842134)))

(assert (=> b!1507127 (= c!139397 (validKeyInArray!0 (select (arr!48510 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507128 () Bool)

(assert (=> b!1507128 (= e!842134 call!68244)))

(declare-fun b!1507129 () Bool)

(declare-fun e!842133 () Bool)

(declare-fun contains!9966 (List!34993 (_ BitVec 64)) Bool)

(assert (=> b!1507129 (= e!842133 (contains!9966 Nil!34990 (select (arr!48510 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507130 () Bool)

(assert (=> b!1507130 (= e!842131 e!842132)))

(declare-fun res!1027405 () Bool)

(assert (=> b!1507130 (=> (not res!1027405) (not e!842132))))

(assert (=> b!1507130 (= res!1027405 (not e!842133))))

(declare-fun res!1027403 () Bool)

(assert (=> b!1507130 (=> (not res!1027403) (not e!842133))))

(assert (=> b!1507130 (= res!1027403 (validKeyInArray!0 (select (arr!48510 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158279 (not res!1027404)) b!1507130))

(assert (= (and b!1507130 res!1027403) b!1507129))

(assert (= (and b!1507130 res!1027405) b!1507127))

(assert (= (and b!1507127 c!139397) b!1507128))

(assert (= (and b!1507127 (not c!139397)) b!1507126))

(assert (= (or b!1507128 b!1507126) bm!68241))

(declare-fun m!1389951 () Bool)

(assert (=> bm!68241 m!1389951))

(declare-fun m!1389953 () Bool)

(assert (=> bm!68241 m!1389953))

(assert (=> b!1507127 m!1389951))

(assert (=> b!1507127 m!1389951))

(declare-fun m!1389955 () Bool)

(assert (=> b!1507127 m!1389955))

(assert (=> b!1507129 m!1389951))

(assert (=> b!1507129 m!1389951))

(declare-fun m!1389959 () Bool)

(assert (=> b!1507129 m!1389959))

(assert (=> b!1507130 m!1389951))

(assert (=> b!1507130 m!1389951))

(assert (=> b!1507130 m!1389955))

(assert (=> b!1507019 d!158279))

(declare-fun b!1507131 () Bool)

(declare-fun e!842139 () Bool)

(declare-fun e!842137 () Bool)

(assert (=> b!1507131 (= e!842139 e!842137)))

(declare-fun res!1027406 () Bool)

(declare-fun lt!654317 () SeekEntryResult!12681)

(assert (=> b!1507131 (= res!1027406 (and ((_ is Intermediate!12681) lt!654317) (not (undefined!13493 lt!654317)) (bvslt (x!134871 lt!654317) #b01111111111111111111111111111110) (bvsge (x!134871 lt!654317) #b00000000000000000000000000000000) (bvsge (x!134871 lt!654317) #b00000000000000000000000000000000)))))

(assert (=> b!1507131 (=> (not res!1027406) (not e!842137))))

(declare-fun b!1507132 () Bool)

(assert (=> b!1507132 (and (bvsge (index!53121 lt!654317) #b00000000000000000000000000000000) (bvslt (index!53121 lt!654317) (size!49060 a!2804)))))

(declare-fun res!1027408 () Bool)

(assert (=> b!1507132 (= res!1027408 (= (select (arr!48510 a!2804) (index!53121 lt!654317)) (select (arr!48510 a!2804) j!70)))))

(declare-fun e!842138 () Bool)

(assert (=> b!1507132 (=> res!1027408 e!842138)))

(assert (=> b!1507132 (= e!842137 e!842138)))

(declare-fun b!1507133 () Bool)

(declare-fun e!842135 () SeekEntryResult!12681)

(declare-fun e!842136 () SeekEntryResult!12681)

(assert (=> b!1507133 (= e!842135 e!842136)))

(declare-fun c!139398 () Bool)

(declare-fun lt!654318 () (_ BitVec 64))

(assert (=> b!1507133 (= c!139398 (or (= lt!654318 (select (arr!48510 a!2804) j!70)) (= (bvadd lt!654318 lt!654318) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507135 () Bool)

(assert (=> b!1507135 (= e!842135 (Intermediate!12681 true (toIndex!0 (select (arr!48510 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1507136 () Bool)

(assert (=> b!1507136 (and (bvsge (index!53121 lt!654317) #b00000000000000000000000000000000) (bvslt (index!53121 lt!654317) (size!49060 a!2804)))))

(assert (=> b!1507136 (= e!842138 (= (select (arr!48510 a!2804) (index!53121 lt!654317)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507137 () Bool)

(assert (=> b!1507137 (and (bvsge (index!53121 lt!654317) #b00000000000000000000000000000000) (bvslt (index!53121 lt!654317) (size!49060 a!2804)))))

(declare-fun res!1027407 () Bool)

(assert (=> b!1507137 (= res!1027407 (= (select (arr!48510 a!2804) (index!53121 lt!654317)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507137 (=> res!1027407 e!842138)))

(declare-fun b!1507138 () Bool)

(assert (=> b!1507138 (= e!842139 (bvsge (x!134871 lt!654317) #b01111111111111111111111111111110))))

(declare-fun b!1507139 () Bool)

(assert (=> b!1507139 (= e!842136 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48510 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48510 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507134 () Bool)

(assert (=> b!1507134 (= e!842136 (Intermediate!12681 false (toIndex!0 (select (arr!48510 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!158281 () Bool)

(assert (=> d!158281 e!842139))

(declare-fun c!139400 () Bool)

(assert (=> d!158281 (= c!139400 (and ((_ is Intermediate!12681) lt!654317) (undefined!13493 lt!654317)))))

(assert (=> d!158281 (= lt!654317 e!842135)))

(declare-fun c!139399 () Bool)

(assert (=> d!158281 (= c!139399 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158281 (= lt!654318 (select (arr!48510 a!2804) (toIndex!0 (select (arr!48510 a!2804) j!70) mask!2512)))))

(assert (=> d!158281 (validMask!0 mask!2512)))

(assert (=> d!158281 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48510 a!2804) j!70) mask!2512) (select (arr!48510 a!2804) j!70) a!2804 mask!2512) lt!654317)))

(assert (= (and d!158281 c!139399) b!1507135))

(assert (= (and d!158281 (not c!139399)) b!1507133))

(assert (= (and b!1507133 c!139398) b!1507134))

(assert (= (and b!1507133 (not c!139398)) b!1507139))

(assert (= (and d!158281 c!139400) b!1507138))

(assert (= (and d!158281 (not c!139400)) b!1507131))

(assert (= (and b!1507131 res!1027406) b!1507132))

(assert (= (and b!1507132 (not res!1027408)) b!1507137))

(assert (= (and b!1507137 (not res!1027407)) b!1507136))

(assert (=> d!158281 m!1389893))

(declare-fun m!1389967 () Bool)

(assert (=> d!158281 m!1389967))

(assert (=> d!158281 m!1389901))

(assert (=> b!1507139 m!1389893))

(declare-fun m!1389969 () Bool)

(assert (=> b!1507139 m!1389969))

(assert (=> b!1507139 m!1389969))

(assert (=> b!1507139 m!1389887))

(declare-fun m!1389971 () Bool)

(assert (=> b!1507139 m!1389971))

(declare-fun m!1389973 () Bool)

(assert (=> b!1507137 m!1389973))

(assert (=> b!1507132 m!1389973))

(assert (=> b!1507136 m!1389973))

(assert (=> b!1507022 d!158281))

(declare-fun d!158285 () Bool)

(declare-fun lt!654324 () (_ BitVec 32))

(declare-fun lt!654323 () (_ BitVec 32))

(assert (=> d!158285 (= lt!654324 (bvmul (bvxor lt!654323 (bvlshr lt!654323 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158285 (= lt!654323 ((_ extract 31 0) (bvand (bvxor (select (arr!48510 a!2804) j!70) (bvlshr (select (arr!48510 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158285 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1027409 (let ((h!36391 ((_ extract 31 0) (bvand (bvxor (select (arr!48510 a!2804) j!70) (bvlshr (select (arr!48510 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134875 (bvmul (bvxor h!36391 (bvlshr h!36391 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134875 (bvlshr x!134875 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1027409 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1027409 #b00000000000000000000000000000000))))))

(assert (=> d!158285 (= (toIndex!0 (select (arr!48510 a!2804) j!70) mask!2512) (bvand (bvxor lt!654324 (bvlshr lt!654324 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1507022 d!158285))

(declare-fun d!158287 () Bool)

(declare-fun res!1027429 () Bool)

(declare-fun e!842171 () Bool)

(assert (=> d!158287 (=> res!1027429 e!842171)))

(assert (=> d!158287 (= res!1027429 (bvsge #b00000000000000000000000000000000 (size!49060 a!2804)))))

(assert (=> d!158287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842171)))

(declare-fun bm!68247 () Bool)

(declare-fun call!68250 () Bool)

(assert (=> bm!68247 (= call!68250 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1507187 () Bool)

(declare-fun e!842170 () Bool)

(assert (=> b!1507187 (= e!842170 call!68250)))

(declare-fun b!1507188 () Bool)

(declare-fun e!842172 () Bool)

(assert (=> b!1507188 (= e!842171 e!842172)))

(declare-fun c!139415 () Bool)

(assert (=> b!1507188 (= c!139415 (validKeyInArray!0 (select (arr!48510 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507189 () Bool)

(assert (=> b!1507189 (= e!842172 call!68250)))

(declare-fun b!1507190 () Bool)

(assert (=> b!1507190 (= e!842172 e!842170)))

(declare-fun lt!654346 () (_ BitVec 64))

(assert (=> b!1507190 (= lt!654346 (select (arr!48510 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50328 0))(
  ( (Unit!50329) )
))
(declare-fun lt!654348 () Unit!50328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100534 (_ BitVec 64) (_ BitVec 32)) Unit!50328)

(assert (=> b!1507190 (= lt!654348 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654346 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507190 (arrayContainsKey!0 a!2804 lt!654346 #b00000000000000000000000000000000)))

(declare-fun lt!654347 () Unit!50328)

(assert (=> b!1507190 (= lt!654347 lt!654348)))

(declare-fun res!1027430 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100534 (_ BitVec 32)) SeekEntryResult!12681)

(assert (=> b!1507190 (= res!1027430 (= (seekEntryOrOpen!0 (select (arr!48510 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12681 #b00000000000000000000000000000000)))))

(assert (=> b!1507190 (=> (not res!1027430) (not e!842170))))

(assert (= (and d!158287 (not res!1027429)) b!1507188))

(assert (= (and b!1507188 c!139415) b!1507190))

(assert (= (and b!1507188 (not c!139415)) b!1507189))

(assert (= (and b!1507190 res!1027430) b!1507187))

(assert (= (or b!1507187 b!1507189) bm!68247))

(declare-fun m!1389995 () Bool)

(assert (=> bm!68247 m!1389995))

(assert (=> b!1507188 m!1389951))

(assert (=> b!1507188 m!1389951))

(assert (=> b!1507188 m!1389955))

(assert (=> b!1507190 m!1389951))

(declare-fun m!1389997 () Bool)

(assert (=> b!1507190 m!1389997))

(declare-fun m!1389999 () Bool)

(assert (=> b!1507190 m!1389999))

(assert (=> b!1507190 m!1389951))

(declare-fun m!1390001 () Bool)

(assert (=> b!1507190 m!1390001))

(assert (=> b!1507017 d!158287))

(check-sat (not b!1507088) (not bm!68241) (not d!158281) (not b!1507127) (not bm!68247) (not d!158267) (not b!1507190) (not b!1507139) (not b!1507129) (not b!1507130) (not b!1507188))
(check-sat)
