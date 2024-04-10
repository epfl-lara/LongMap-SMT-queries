; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128652 () Bool)

(assert start!128652)

(declare-fun b!1507977 () Bool)

(declare-fun res!1028093 () Bool)

(declare-fun e!842491 () Bool)

(assert (=> b!1507977 (=> (not res!1028093) (not e!842491))))

(declare-datatypes ((array!100586 0))(
  ( (array!100587 (arr!48533 (Array (_ BitVec 32) (_ BitVec 64))) (size!49083 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100586)

(declare-datatypes ((List!35016 0))(
  ( (Nil!35013) (Cons!35012 (h!36418 (_ BitVec 64)) (t!49710 List!35016)) )
))
(declare-fun arrayNoDuplicates!0 (array!100586 (_ BitVec 32) List!35016) Bool)

(assert (=> b!1507977 (= res!1028093 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35013))))

(declare-fun res!1028097 () Bool)

(assert (=> start!128652 (=> (not res!1028097) (not e!842491))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128652 (= res!1028097 (validMask!0 mask!2512))))

(assert (=> start!128652 e!842491))

(assert (=> start!128652 true))

(declare-fun array_inv!37561 (array!100586) Bool)

(assert (=> start!128652 (array_inv!37561 a!2804)))

(declare-fun b!1507978 () Bool)

(declare-fun res!1028091 () Bool)

(assert (=> b!1507978 (=> (not res!1028091) (not e!842491))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507978 (= res!1028091 (validKeyInArray!0 (select (arr!48533 a!2804) i!961)))))

(declare-fun b!1507979 () Bool)

(declare-fun res!1028092 () Bool)

(declare-fun e!842489 () Bool)

(assert (=> b!1507979 (=> (not res!1028092) (not e!842489))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12704 0))(
  ( (MissingZero!12704 (index!53211 (_ BitVec 32))) (Found!12704 (index!53212 (_ BitVec 32))) (Intermediate!12704 (undefined!13516 Bool) (index!53213 (_ BitVec 32)) (x!134970 (_ BitVec 32))) (Undefined!12704) (MissingVacant!12704 (index!53214 (_ BitVec 32))) )
))
(declare-fun lt!654508 () SeekEntryResult!12704)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100586 (_ BitVec 32)) SeekEntryResult!12704)

(assert (=> b!1507979 (= res!1028092 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48533 a!2804) j!70) a!2804 mask!2512) lt!654508))))

(declare-fun b!1507980 () Bool)

(declare-fun res!1028096 () Bool)

(assert (=> b!1507980 (=> (not res!1028096) (not e!842491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100586 (_ BitVec 32)) Bool)

(assert (=> b!1507980 (= res!1028096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507981 () Bool)

(declare-fun res!1028098 () Bool)

(assert (=> b!1507981 (=> (not res!1028098) (not e!842491))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507981 (= res!1028098 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49083 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49083 a!2804))))))

(declare-fun b!1507982 () Bool)

(declare-fun res!1028095 () Bool)

(assert (=> b!1507982 (=> (not res!1028095) (not e!842491))))

(assert (=> b!1507982 (= res!1028095 (validKeyInArray!0 (select (arr!48533 a!2804) j!70)))))

(declare-fun b!1507983 () Bool)

(assert (=> b!1507983 (= e!842489 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(declare-fun b!1507984 () Bool)

(assert (=> b!1507984 (= e!842491 e!842489)))

(declare-fun res!1028094 () Bool)

(assert (=> b!1507984 (=> (not res!1028094) (not e!842489))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507984 (= res!1028094 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48533 a!2804) j!70) mask!2512) (select (arr!48533 a!2804) j!70) a!2804 mask!2512) lt!654508))))

(assert (=> b!1507984 (= lt!654508 (Intermediate!12704 false resIndex!21 resX!21))))

(declare-fun b!1507985 () Bool)

(declare-fun res!1028090 () Bool)

(assert (=> b!1507985 (=> (not res!1028090) (not e!842491))))

(assert (=> b!1507985 (= res!1028090 (and (= (size!49083 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49083 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49083 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128652 res!1028097) b!1507985))

(assert (= (and b!1507985 res!1028090) b!1507978))

(assert (= (and b!1507978 res!1028091) b!1507982))

(assert (= (and b!1507982 res!1028095) b!1507980))

(assert (= (and b!1507980 res!1028096) b!1507977))

(assert (= (and b!1507977 res!1028093) b!1507981))

(assert (= (and b!1507981 res!1028098) b!1507984))

(assert (= (and b!1507984 res!1028094) b!1507979))

(assert (= (and b!1507979 res!1028092) b!1507983))

(declare-fun m!1390585 () Bool)

(assert (=> b!1507979 m!1390585))

(assert (=> b!1507979 m!1390585))

(declare-fun m!1390587 () Bool)

(assert (=> b!1507979 m!1390587))

(declare-fun m!1390589 () Bool)

(assert (=> start!128652 m!1390589))

(declare-fun m!1390591 () Bool)

(assert (=> start!128652 m!1390591))

(declare-fun m!1390593 () Bool)

(assert (=> b!1507977 m!1390593))

(assert (=> b!1507982 m!1390585))

(assert (=> b!1507982 m!1390585))

(declare-fun m!1390595 () Bool)

(assert (=> b!1507982 m!1390595))

(declare-fun m!1390597 () Bool)

(assert (=> b!1507980 m!1390597))

(declare-fun m!1390599 () Bool)

(assert (=> b!1507978 m!1390599))

(assert (=> b!1507978 m!1390599))

(declare-fun m!1390601 () Bool)

(assert (=> b!1507978 m!1390601))

(assert (=> b!1507984 m!1390585))

(assert (=> b!1507984 m!1390585))

(declare-fun m!1390603 () Bool)

(assert (=> b!1507984 m!1390603))

(assert (=> b!1507984 m!1390603))

(assert (=> b!1507984 m!1390585))

(declare-fun m!1390605 () Bool)

(assert (=> b!1507984 m!1390605))

(push 1)

(assert (not b!1507982))

(assert (not b!1507979))

(assert (not b!1507980))

(assert (not b!1507978))

(assert (not start!128652))

(assert (not b!1507977))

(assert (not b!1507984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1508066 () Bool)

(declare-fun e!842527 () Bool)

(declare-fun call!68277 () Bool)

(assert (=> b!1508066 (= e!842527 call!68277)))

(declare-fun bm!68274 () Bool)

(assert (=> bm!68274 (= call!68277 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1508068 () Bool)

(declare-fun e!842526 () Bool)

(assert (=> b!1508068 (= e!842526 call!68277)))

(declare-fun b!1508069 () Bool)

(assert (=> b!1508069 (= e!842527 e!842526)))

(declare-fun lt!654525 () (_ BitVec 64))

(assert (=> b!1508069 (= lt!654525 (select (arr!48533 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50336 0))(
  ( (Unit!50337) )
))
(declare-fun lt!654526 () Unit!50336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100586 (_ BitVec 64) (_ BitVec 32)) Unit!50336)

(assert (=> b!1508069 (= lt!654526 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654525 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1508069 (arrayContainsKey!0 a!2804 lt!654525 #b00000000000000000000000000000000)))

(declare-fun lt!654527 () Unit!50336)

(assert (=> b!1508069 (= lt!654527 lt!654526)))

(declare-fun res!1028163 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100586 (_ BitVec 32)) SeekEntryResult!12704)

(assert (=> b!1508069 (= res!1028163 (= (seekEntryOrOpen!0 (select (arr!48533 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12704 #b00000000000000000000000000000000)))))

(assert (=> b!1508069 (=> (not res!1028163) (not e!842526))))

(declare-fun d!158385 () Bool)

(declare-fun res!1028164 () Bool)

(declare-fun e!842528 () Bool)

(assert (=> d!158385 (=> res!1028164 e!842528)))

(assert (=> d!158385 (= res!1028164 (bvsge #b00000000000000000000000000000000 (size!49083 a!2804)))))

(assert (=> d!158385 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842528)))

(declare-fun b!1508067 () Bool)

(assert (=> b!1508067 (= e!842528 e!842527)))

(declare-fun c!139490 () Bool)

(assert (=> b!1508067 (= c!139490 (validKeyInArray!0 (select (arr!48533 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158385 (not res!1028164)) b!1508067))

(assert (= (and b!1508067 c!139490) b!1508069))

(assert (= (and b!1508067 (not c!139490)) b!1508066))

(assert (= (and b!1508069 res!1028163) b!1508068))

(assert (= (or b!1508068 b!1508066) bm!68274))

(declare-fun m!1390651 () Bool)

(assert (=> bm!68274 m!1390651))

(declare-fun m!1390653 () Bool)

(assert (=> b!1508069 m!1390653))

(declare-fun m!1390655 () Bool)

(assert (=> b!1508069 m!1390655))

(declare-fun m!1390657 () Bool)

(assert (=> b!1508069 m!1390657))

(assert (=> b!1508069 m!1390653))

(declare-fun m!1390659 () Bool)

(assert (=> b!1508069 m!1390659))

(assert (=> b!1508067 m!1390653))

(assert (=> b!1508067 m!1390653))

(declare-fun m!1390661 () Bool)

(assert (=> b!1508067 m!1390661))

(assert (=> b!1507980 d!158385))

(declare-fun d!158393 () Bool)

(assert (=> d!158393 (= (validKeyInArray!0 (select (arr!48533 a!2804) j!70)) (and (not (= (select (arr!48533 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48533 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507982 d!158393))

(declare-fun b!1508113 () Bool)

(declare-fun e!842560 () Bool)

(declare-fun call!68283 () Bool)

(assert (=> b!1508113 (= e!842560 call!68283)))

(declare-fun d!158395 () Bool)

(declare-fun res!1028189 () Bool)

(declare-fun e!842562 () Bool)

(assert (=> d!158395 (=> res!1028189 e!842562)))

(assert (=> d!158395 (= res!1028189 (bvsge #b00000000000000000000000000000000 (size!49083 a!2804)))))

(assert (=> d!158395 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35013) e!842562)))

(declare-fun b!1508114 () Bool)

(assert (=> b!1508114 (= e!842560 call!68283)))

(declare-fun bm!68280 () Bool)

(declare-fun c!139502 () Bool)

(assert (=> bm!68280 (= call!68283 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139502 (Cons!35012 (select (arr!48533 a!2804) #b00000000000000000000000000000000) Nil!35013) Nil!35013)))))

(declare-fun b!1508115 () Bool)

(declare-fun e!842559 () Bool)

(assert (=> b!1508115 (= e!842562 e!842559)))

(declare-fun res!1028187 () Bool)

(assert (=> b!1508115 (=> (not res!1028187) (not e!842559))))

(declare-fun e!842561 () Bool)

(assert (=> b!1508115 (= res!1028187 (not e!842561))))

(declare-fun res!1028188 () Bool)

(assert (=> b!1508115 (=> (not res!1028188) (not e!842561))))

(assert (=> b!1508115 (= res!1028188 (validKeyInArray!0 (select (arr!48533 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508116 () Bool)

(declare-fun contains!9970 (List!35016 (_ BitVec 64)) Bool)

(assert (=> b!1508116 (= e!842561 (contains!9970 Nil!35013 (select (arr!48533 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508117 () Bool)

(assert (=> b!1508117 (= e!842559 e!842560)))

(assert (=> b!1508117 (= c!139502 (validKeyInArray!0 (select (arr!48533 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158395 (not res!1028189)) b!1508115))

(assert (= (and b!1508115 res!1028188) b!1508116))

(assert (= (and b!1508115 res!1028187) b!1508117))

(assert (= (and b!1508117 c!139502) b!1508113))

(assert (= (and b!1508117 (not c!139502)) b!1508114))

(assert (= (or b!1508113 b!1508114) bm!68280))

(assert (=> bm!68280 m!1390653))

(declare-fun m!1390687 () Bool)

(assert (=> bm!68280 m!1390687))

(assert (=> b!1508115 m!1390653))

(assert (=> b!1508115 m!1390653))

(assert (=> b!1508115 m!1390661))

(assert (=> b!1508116 m!1390653))

(assert (=> b!1508116 m!1390653))

(declare-fun m!1390689 () Bool)

(assert (=> b!1508116 m!1390689))

(assert (=> b!1508117 m!1390653))

(assert (=> b!1508117 m!1390653))

(assert (=> b!1508117 m!1390661))

(assert (=> b!1507977 d!158395))

(declare-fun d!158403 () Bool)

(assert (=> d!158403 (= (validKeyInArray!0 (select (arr!48533 a!2804) i!961)) (and (not (= (select (arr!48533 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48533 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507978 d!158403))

(declare-fun d!158405 () Bool)

(assert (=> d!158405 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128652 d!158405))

(declare-fun d!158415 () Bool)

(assert (=> d!158415 (= (array_inv!37561 a!2804) (bvsge (size!49083 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128652 d!158415))

(declare-fun b!1508175 () Bool)

(declare-fun e!842607 () Bool)

(declare-fun e!842606 () Bool)

(assert (=> b!1508175 (= e!842607 e!842606)))

(declare-fun res!1028219 () Bool)

(declare-fun lt!654560 () SeekEntryResult!12704)

(assert (=> b!1508175 (= res!1028219 (and (is-Intermediate!12704 lt!654560) (not (undefined!13516 lt!654560)) (bvslt (x!134970 lt!654560) #b01111111111111111111111111111110) (bvsge (x!134970 lt!654560) #b00000000000000000000000000000000) (bvsge (x!134970 lt!654560) #b00000000000000000000000000000000)))))

(assert (=> b!1508175 (=> (not res!1028219) (not e!842606))))

(declare-fun d!158417 () Bool)

(assert (=> d!158417 e!842607))

(declare-fun c!139518 () Bool)

(assert (=> d!158417 (= c!139518 (and (is-Intermediate!12704 lt!654560) (undefined!13516 lt!654560)))))

(declare-fun e!842605 () SeekEntryResult!12704)

(assert (=> d!158417 (= lt!654560 e!842605)))

(declare-fun c!139519 () Bool)

(assert (=> d!158417 (= c!139519 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!654561 () (_ BitVec 64))

(assert (=> d!158417 (= lt!654561 (select (arr!48533 a!2804) (toIndex!0 (select (arr!48533 a!2804) j!70) mask!2512)))))

(assert (=> d!158417 (validMask!0 mask!2512)))

(assert (=> d!158417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48533 a!2804) j!70) mask!2512) (select (arr!48533 a!2804) j!70) a!2804 mask!2512) lt!654560)))

(declare-fun b!1508176 () Bool)

(assert (=> b!1508176 (= e!842605 (Intermediate!12704 true (toIndex!0 (select (arr!48533 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508177 () Bool)

(declare-fun e!842603 () SeekEntryResult!12704)

(assert (=> b!1508177 (= e!842605 e!842603)))

(declare-fun c!139520 () Bool)

(assert (=> b!1508177 (= c!139520 (or (= lt!654561 (select (arr!48533 a!2804) j!70)) (= (bvadd lt!654561 lt!654561) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508178 () Bool)

(assert (=> b!1508178 (= e!842603 (Intermediate!12704 false (toIndex!0 (select (arr!48533 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508179 () Bool)

(assert (=> b!1508179 (and (bvsge (index!53213 lt!654560) #b00000000000000000000000000000000) (bvslt (index!53213 lt!654560) (size!49083 a!2804)))))

(declare-fun res!1028217 () Bool)

(assert (=> b!1508179 (= res!1028217 (= (select (arr!48533 a!2804) (index!53213 lt!654560)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842604 () Bool)

(assert (=> b!1508179 (=> res!1028217 e!842604)))

(declare-fun b!1508180 () Bool)

(assert (=> b!1508180 (= e!842607 (bvsge (x!134970 lt!654560) #b01111111111111111111111111111110))))

(declare-fun b!1508181 () Bool)

(assert (=> b!1508181 (and (bvsge (index!53213 lt!654560) #b00000000000000000000000000000000) (bvslt (index!53213 lt!654560) (size!49083 a!2804)))))

(assert (=> b!1508181 (= e!842604 (= (select (arr!48533 a!2804) (index!53213 lt!654560)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508182 () Bool)

(assert (=> b!1508182 (and (bvsge (index!53213 lt!654560) #b00000000000000000000000000000000) (bvslt (index!53213 lt!654560) (size!49083 a!2804)))))

(declare-fun res!1028218 () Bool)

(assert (=> b!1508182 (= res!1028218 (= (select (arr!48533 a!2804) (index!53213 lt!654560)) (select (arr!48533 a!2804) j!70)))))

(assert (=> b!1508182 (=> res!1028218 e!842604)))

(assert (=> b!1508182 (= e!842606 e!842604)))

(declare-fun b!1508183 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508183 (= e!842603 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48533 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48533 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!158417 c!139519) b!1508176))

(assert (= (and d!158417 (not c!139519)) b!1508177))

(assert (= (and b!1508177 c!139520) b!1508178))

(assert (= (and b!1508177 (not c!139520)) b!1508183))

(assert (= (and d!158417 c!139518) b!1508180))

(assert (= (and d!158417 (not c!139518)) b!1508175))

(assert (= (and b!1508175 res!1028219) b!1508182))

(assert (= (and b!1508182 (not res!1028218)) b!1508179))

(assert (= (and b!1508179 (not res!1028217)) b!1508181))

(declare-fun m!1390715 () Bool)

(assert (=> b!1508179 m!1390715))

(assert (=> b!1508182 m!1390715))

(assert (=> b!1508183 m!1390603))

(declare-fun m!1390717 () Bool)

(assert (=> b!1508183 m!1390717))

(assert (=> b!1508183 m!1390717))

(assert (=> b!1508183 m!1390585))

(declare-fun m!1390719 () Bool)

(assert (=> b!1508183 m!1390719))

(assert (=> b!1508181 m!1390715))

(assert (=> d!158417 m!1390603))

(declare-fun m!1390721 () Bool)

(assert (=> d!158417 m!1390721))

(assert (=> d!158417 m!1390589))

(assert (=> b!1507984 d!158417))

(declare-fun d!158429 () Bool)

(declare-fun lt!654567 () (_ BitVec 32))

(declare-fun lt!654566 () (_ BitVec 32))

(assert (=> d!158429 (= lt!654567 (bvmul (bvxor lt!654566 (bvlshr lt!654566 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158429 (= lt!654566 ((_ extract 31 0) (bvand (bvxor (select (arr!48533 a!2804) j!70) (bvlshr (select (arr!48533 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158429 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028220 (let ((h!36422 ((_ extract 31 0) (bvand (bvxor (select (arr!48533 a!2804) j!70) (bvlshr (select (arr!48533 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134976 (bvmul (bvxor h!36422 (bvlshr h!36422 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134976 (bvlshr x!134976 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028220 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028220 #b00000000000000000000000000000000))))))

(assert (=> d!158429 (= (toIndex!0 (select (arr!48533 a!2804) j!70) mask!2512) (bvand (bvxor lt!654567 (bvlshr lt!654567 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1507984 d!158429))

(declare-fun b!1508184 () Bool)

(declare-fun e!842612 () Bool)

(declare-fun e!842611 () Bool)

(assert (=> b!1508184 (= e!842612 e!842611)))

(declare-fun res!1028223 () Bool)

(declare-fun lt!654568 () SeekEntryResult!12704)

(assert (=> b!1508184 (= res!1028223 (and (is-Intermediate!12704 lt!654568) (not (undefined!13516 lt!654568)) (bvslt (x!134970 lt!654568) #b01111111111111111111111111111110) (bvsge (x!134970 lt!654568) #b00000000000000000000000000000000) (bvsge (x!134970 lt!654568) x!534)))))

(assert (=> b!1508184 (=> (not res!1028223) (not e!842611))))

(declare-fun d!158431 () Bool)

(assert (=> d!158431 e!842612))

(declare-fun c!139521 () Bool)

(assert (=> d!158431 (= c!139521 (and (is-Intermediate!12704 lt!654568) (undefined!13516 lt!654568)))))

(declare-fun e!842610 () SeekEntryResult!12704)

(assert (=> d!158431 (= lt!654568 e!842610)))

(declare-fun c!139522 () Bool)

(assert (=> d!158431 (= c!139522 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!654569 () (_ BitVec 64))

(assert (=> d!158431 (= lt!654569 (select (arr!48533 a!2804) index!487))))

(assert (=> d!158431 (validMask!0 mask!2512)))

(assert (=> d!158431 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48533 a!2804) j!70) a!2804 mask!2512) lt!654568)))

(declare-fun b!1508185 () Bool)

(assert (=> b!1508185 (= e!842610 (Intermediate!12704 true index!487 x!534))))

(declare-fun b!1508186 () Bool)

(declare-fun e!842608 () SeekEntryResult!12704)

(assert (=> b!1508186 (= e!842610 e!842608)))

(declare-fun c!139523 () Bool)

(assert (=> b!1508186 (= c!139523 (or (= lt!654569 (select (arr!48533 a!2804) j!70)) (= (bvadd lt!654569 lt!654569) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508187 () Bool)

(assert (=> b!1508187 (= e!842608 (Intermediate!12704 false index!487 x!534))))

(declare-fun b!1508188 () Bool)

(assert (=> b!1508188 (and (bvsge (index!53213 lt!654568) #b00000000000000000000000000000000) (bvslt (index!53213 lt!654568) (size!49083 a!2804)))))

(declare-fun res!1028221 () Bool)

(assert (=> b!1508188 (= res!1028221 (= (select (arr!48533 a!2804) (index!53213 lt!654568)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842609 () Bool)

(assert (=> b!1508188 (=> res!1028221 e!842609)))

(declare-fun b!1508189 () Bool)

(assert (=> b!1508189 (= e!842612 (bvsge (x!134970 lt!654568) #b01111111111111111111111111111110))))

(declare-fun b!1508190 () Bool)

(assert (=> b!1508190 (and (bvsge (index!53213 lt!654568) #b00000000000000000000000000000000) (bvslt (index!53213 lt!654568) (size!49083 a!2804)))))

(assert (=> b!1508190 (= e!842609 (= (select (arr!48533 a!2804) (index!53213 lt!654568)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508191 () Bool)

(assert (=> b!1508191 (and (bvsge (index!53213 lt!654568) #b00000000000000000000000000000000) (bvslt (index!53213 lt!654568) (size!49083 a!2804)))))

(declare-fun res!1028222 () Bool)

(assert (=> b!1508191 (= res!1028222 (= (select (arr!48533 a!2804) (index!53213 lt!654568)) (select (arr!48533 a!2804) j!70)))))

(assert (=> b!1508191 (=> res!1028222 e!842609)))

(assert (=> b!1508191 (= e!842611 e!842609)))

(declare-fun b!1508192 () Bool)

(assert (=> b!1508192 (= e!842608 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48533 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!158431 c!139522) b!1508185))

(assert (= (and d!158431 (not c!139522)) b!1508186))

(assert (= (and b!1508186 c!139523) b!1508187))

(assert (= (and b!1508186 (not c!139523)) b!1508192))

(assert (= (and d!158431 c!139521) b!1508189))

(assert (= (and d!158431 (not c!139521)) b!1508184))

(assert (= (and b!1508184 res!1028223) b!1508191))

(assert (= (and b!1508191 (not res!1028222)) b!1508188))

(assert (= (and b!1508188 (not res!1028221)) b!1508190))

(declare-fun m!1390723 () Bool)

(assert (=> b!1508188 m!1390723))

(assert (=> b!1508191 m!1390723))

(declare-fun m!1390725 () Bool)

(assert (=> b!1508192 m!1390725))

(assert (=> b!1508192 m!1390725))

(assert (=> b!1508192 m!1390585))

(declare-fun m!1390727 () Bool)

(assert (=> b!1508192 m!1390727))

(assert (=> b!1508190 m!1390723))

(declare-fun m!1390729 () Bool)

(assert (=> d!158431 m!1390729))

(assert (=> d!158431 m!1390589))

(assert (=> b!1507979 d!158431))

(push 1)

