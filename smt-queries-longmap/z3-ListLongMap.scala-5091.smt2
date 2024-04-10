; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69106 () Bool)

(assert start!69106)

(declare-fun b!806107 () Bool)

(declare-fun res!550432 () Bool)

(declare-fun e!446394 () Bool)

(assert (=> b!806107 (=> (not res!550432) (not e!446394))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43851 0))(
  ( (array!43852 (arr!21004 (Array (_ BitVec 32) (_ BitVec 64))) (size!21425 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43851)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!806107 (= res!550432 (and (= (size!21425 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21425 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21425 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806108 () Bool)

(declare-fun e!446399 () Bool)

(declare-fun e!446398 () Bool)

(assert (=> b!806108 (= e!446399 e!446398)))

(declare-fun res!550439 () Bool)

(assert (=> b!806108 (=> (not res!550439) (not e!446398))))

(declare-datatypes ((SeekEntryResult!8595 0))(
  ( (MissingZero!8595 (index!36748 (_ BitVec 32))) (Found!8595 (index!36749 (_ BitVec 32))) (Intermediate!8595 (undefined!9407 Bool) (index!36750 (_ BitVec 32)) (x!67564 (_ BitVec 32))) (Undefined!8595) (MissingVacant!8595 (index!36751 (_ BitVec 32))) )
))
(declare-fun lt!360996 () SeekEntryResult!8595)

(declare-fun lt!360997 () SeekEntryResult!8595)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806108 (= res!550439 (and (= lt!360997 lt!360996) (= (select (arr!21004 a!3170) index!1236) (select (arr!21004 a!3170) j!153))))))

(assert (=> b!806108 (= lt!360996 (Found!8595 j!153))))

(declare-fun b!806109 () Bool)

(declare-fun res!550428 () Bool)

(declare-fun e!446397 () Bool)

(assert (=> b!806109 (=> (not res!550428) (not e!446397))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806109 (= res!550428 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21425 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21004 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21425 a!3170)) (= (select (arr!21004 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806111 () Bool)

(declare-fun res!550433 () Bool)

(assert (=> b!806111 (=> (not res!550433) (not e!446394))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806111 (= res!550433 (validKeyInArray!0 k0!2044))))

(declare-fun b!806112 () Bool)

(declare-fun e!446396 () Bool)

(assert (=> b!806112 (= e!446396 e!446399)))

(declare-fun res!550431 () Bool)

(assert (=> b!806112 (=> (not res!550431) (not e!446399))))

(declare-fun lt!360999 () SeekEntryResult!8595)

(assert (=> b!806112 (= res!550431 (= lt!360999 lt!360997))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43851 (_ BitVec 32)) SeekEntryResult!8595)

(assert (=> b!806112 (= lt!360997 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21004 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43851 (_ BitVec 32)) SeekEntryResult!8595)

(assert (=> b!806112 (= lt!360999 (seekEntryOrOpen!0 (select (arr!21004 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806113 () Bool)

(assert (=> b!806113 (= e!446397 e!446396)))

(declare-fun res!550438 () Bool)

(assert (=> b!806113 (=> (not res!550438) (not e!446396))))

(declare-fun lt!361000 () SeekEntryResult!8595)

(declare-fun lt!361001 () SeekEntryResult!8595)

(assert (=> b!806113 (= res!550438 (= lt!361000 lt!361001))))

(declare-fun lt!360994 () (_ BitVec 64))

(declare-fun lt!360995 () array!43851)

(assert (=> b!806113 (= lt!361001 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360994 lt!360995 mask!3266))))

(assert (=> b!806113 (= lt!361000 (seekEntryOrOpen!0 lt!360994 lt!360995 mask!3266))))

(assert (=> b!806113 (= lt!360994 (select (store (arr!21004 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806113 (= lt!360995 (array!43852 (store (arr!21004 a!3170) i!1163 k0!2044) (size!21425 a!3170)))))

(declare-fun b!806114 () Bool)

(declare-fun res!550429 () Bool)

(assert (=> b!806114 (=> (not res!550429) (not e!446397))))

(declare-datatypes ((List!14967 0))(
  ( (Nil!14964) (Cons!14963 (h!16092 (_ BitVec 64)) (t!21282 List!14967)) )
))
(declare-fun arrayNoDuplicates!0 (array!43851 (_ BitVec 32) List!14967) Bool)

(assert (=> b!806114 (= res!550429 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14964))))

(declare-fun b!806115 () Bool)

(declare-fun res!550430 () Bool)

(assert (=> b!806115 (=> (not res!550430) (not e!446397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43851 (_ BitVec 32)) Bool)

(assert (=> b!806115 (= res!550430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806116 () Bool)

(assert (=> b!806116 (= e!446394 e!446397)))

(declare-fun res!550434 () Bool)

(assert (=> b!806116 (=> (not res!550434) (not e!446397))))

(declare-fun lt!360998 () SeekEntryResult!8595)

(assert (=> b!806116 (= res!550434 (or (= lt!360998 (MissingZero!8595 i!1163)) (= lt!360998 (MissingVacant!8595 i!1163))))))

(assert (=> b!806116 (= lt!360998 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!550437 () Bool)

(assert (=> start!69106 (=> (not res!550437) (not e!446394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69106 (= res!550437 (validMask!0 mask!3266))))

(assert (=> start!69106 e!446394))

(assert (=> start!69106 true))

(declare-fun array_inv!16800 (array!43851) Bool)

(assert (=> start!69106 (array_inv!16800 a!3170)))

(declare-fun b!806110 () Bool)

(assert (=> b!806110 (= e!446398 (not (= lt!361001 lt!360996)))))

(assert (=> b!806110 (= lt!361001 (Found!8595 index!1236))))

(declare-fun b!806117 () Bool)

(declare-fun res!550435 () Bool)

(assert (=> b!806117 (=> (not res!550435) (not e!446394))))

(assert (=> b!806117 (= res!550435 (validKeyInArray!0 (select (arr!21004 a!3170) j!153)))))

(declare-fun b!806118 () Bool)

(declare-fun res!550436 () Bool)

(assert (=> b!806118 (=> (not res!550436) (not e!446394))))

(declare-fun arrayContainsKey!0 (array!43851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806118 (= res!550436 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69106 res!550437) b!806107))

(assert (= (and b!806107 res!550432) b!806117))

(assert (= (and b!806117 res!550435) b!806111))

(assert (= (and b!806111 res!550433) b!806118))

(assert (= (and b!806118 res!550436) b!806116))

(assert (= (and b!806116 res!550434) b!806115))

(assert (= (and b!806115 res!550430) b!806114))

(assert (= (and b!806114 res!550429) b!806109))

(assert (= (and b!806109 res!550428) b!806113))

(assert (= (and b!806113 res!550438) b!806112))

(assert (= (and b!806112 res!550431) b!806108))

(assert (= (and b!806108 res!550439) b!806110))

(declare-fun m!748061 () Bool)

(assert (=> b!806108 m!748061))

(declare-fun m!748063 () Bool)

(assert (=> b!806108 m!748063))

(declare-fun m!748065 () Bool)

(assert (=> b!806109 m!748065))

(declare-fun m!748067 () Bool)

(assert (=> b!806109 m!748067))

(declare-fun m!748069 () Bool)

(assert (=> b!806114 m!748069))

(declare-fun m!748071 () Bool)

(assert (=> start!69106 m!748071))

(declare-fun m!748073 () Bool)

(assert (=> start!69106 m!748073))

(declare-fun m!748075 () Bool)

(assert (=> b!806118 m!748075))

(assert (=> b!806117 m!748063))

(assert (=> b!806117 m!748063))

(declare-fun m!748077 () Bool)

(assert (=> b!806117 m!748077))

(declare-fun m!748079 () Bool)

(assert (=> b!806113 m!748079))

(declare-fun m!748081 () Bool)

(assert (=> b!806113 m!748081))

(declare-fun m!748083 () Bool)

(assert (=> b!806113 m!748083))

(declare-fun m!748085 () Bool)

(assert (=> b!806113 m!748085))

(declare-fun m!748087 () Bool)

(assert (=> b!806116 m!748087))

(assert (=> b!806112 m!748063))

(assert (=> b!806112 m!748063))

(declare-fun m!748089 () Bool)

(assert (=> b!806112 m!748089))

(assert (=> b!806112 m!748063))

(declare-fun m!748091 () Bool)

(assert (=> b!806112 m!748091))

(declare-fun m!748093 () Bool)

(assert (=> b!806115 m!748093))

(declare-fun m!748095 () Bool)

(assert (=> b!806111 m!748095))

(check-sat (not start!69106) (not b!806118) (not b!806117) (not b!806112) (not b!806113) (not b!806116) (not b!806115) (not b!806111) (not b!806114))
(check-sat)
(get-model)

(declare-fun d!103631 () Bool)

(declare-fun lt!361033 () SeekEntryResult!8595)

(get-info :version)

(assert (=> d!103631 (and (or ((_ is Undefined!8595) lt!361033) (not ((_ is Found!8595) lt!361033)) (and (bvsge (index!36749 lt!361033) #b00000000000000000000000000000000) (bvslt (index!36749 lt!361033) (size!21425 a!3170)))) (or ((_ is Undefined!8595) lt!361033) ((_ is Found!8595) lt!361033) (not ((_ is MissingZero!8595) lt!361033)) (and (bvsge (index!36748 lt!361033) #b00000000000000000000000000000000) (bvslt (index!36748 lt!361033) (size!21425 a!3170)))) (or ((_ is Undefined!8595) lt!361033) ((_ is Found!8595) lt!361033) ((_ is MissingZero!8595) lt!361033) (not ((_ is MissingVacant!8595) lt!361033)) (and (bvsge (index!36751 lt!361033) #b00000000000000000000000000000000) (bvslt (index!36751 lt!361033) (size!21425 a!3170)))) (or ((_ is Undefined!8595) lt!361033) (ite ((_ is Found!8595) lt!361033) (= (select (arr!21004 a!3170) (index!36749 lt!361033)) k0!2044) (ite ((_ is MissingZero!8595) lt!361033) (= (select (arr!21004 a!3170) (index!36748 lt!361033)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8595) lt!361033) (= (select (arr!21004 a!3170) (index!36751 lt!361033)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!446425 () SeekEntryResult!8595)

(assert (=> d!103631 (= lt!361033 e!446425)))

(declare-fun c!88258 () Bool)

(declare-fun lt!361034 () SeekEntryResult!8595)

(assert (=> d!103631 (= c!88258 (and ((_ is Intermediate!8595) lt!361034) (undefined!9407 lt!361034)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43851 (_ BitVec 32)) SeekEntryResult!8595)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103631 (= lt!361034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103631 (validMask!0 mask!3266)))

(assert (=> d!103631 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!361033)))

(declare-fun b!806167 () Bool)

(declare-fun e!446424 () SeekEntryResult!8595)

(assert (=> b!806167 (= e!446424 (MissingZero!8595 (index!36750 lt!361034)))))

(declare-fun b!806168 () Bool)

(assert (=> b!806168 (= e!446425 Undefined!8595)))

(declare-fun b!806169 () Bool)

(declare-fun c!88256 () Bool)

(declare-fun lt!361032 () (_ BitVec 64))

(assert (=> b!806169 (= c!88256 (= lt!361032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446426 () SeekEntryResult!8595)

(assert (=> b!806169 (= e!446426 e!446424)))

(declare-fun b!806170 () Bool)

(assert (=> b!806170 (= e!446424 (seekKeyOrZeroReturnVacant!0 (x!67564 lt!361034) (index!36750 lt!361034) (index!36750 lt!361034) k0!2044 a!3170 mask!3266))))

(declare-fun b!806171 () Bool)

(assert (=> b!806171 (= e!446426 (Found!8595 (index!36750 lt!361034)))))

(declare-fun b!806172 () Bool)

(assert (=> b!806172 (= e!446425 e!446426)))

(assert (=> b!806172 (= lt!361032 (select (arr!21004 a!3170) (index!36750 lt!361034)))))

(declare-fun c!88257 () Bool)

(assert (=> b!806172 (= c!88257 (= lt!361032 k0!2044))))

(assert (= (and d!103631 c!88258) b!806168))

(assert (= (and d!103631 (not c!88258)) b!806172))

(assert (= (and b!806172 c!88257) b!806171))

(assert (= (and b!806172 (not c!88257)) b!806169))

(assert (= (and b!806169 c!88256) b!806167))

(assert (= (and b!806169 (not c!88256)) b!806170))

(declare-fun m!748133 () Bool)

(assert (=> d!103631 m!748133))

(declare-fun m!748135 () Bool)

(assert (=> d!103631 m!748135))

(assert (=> d!103631 m!748133))

(declare-fun m!748137 () Bool)

(assert (=> d!103631 m!748137))

(declare-fun m!748139 () Bool)

(assert (=> d!103631 m!748139))

(declare-fun m!748141 () Bool)

(assert (=> d!103631 m!748141))

(assert (=> d!103631 m!748071))

(declare-fun m!748143 () Bool)

(assert (=> b!806170 m!748143))

(declare-fun m!748145 () Bool)

(assert (=> b!806172 m!748145))

(assert (=> b!806116 d!103631))

(declare-fun d!103635 () Bool)

(assert (=> d!103635 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69106 d!103635))

(declare-fun d!103641 () Bool)

(assert (=> d!103641 (= (array_inv!16800 a!3170) (bvsge (size!21425 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69106 d!103641))

(declare-fun d!103643 () Bool)

(assert (=> d!103643 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!806111 d!103643))

(declare-fun b!806211 () Bool)

(declare-fun e!446451 () Bool)

(declare-fun call!35370 () Bool)

(assert (=> b!806211 (= e!446451 call!35370)))

(declare-fun b!806212 () Bool)

(declare-fun e!446453 () Bool)

(assert (=> b!806212 (= e!446453 call!35370)))

(declare-fun b!806213 () Bool)

(declare-fun e!446452 () Bool)

(assert (=> b!806213 (= e!446452 e!446451)))

(declare-fun c!88273 () Bool)

(assert (=> b!806213 (= c!88273 (validKeyInArray!0 (select (arr!21004 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103647 () Bool)

(declare-fun res!550487 () Bool)

(assert (=> d!103647 (=> res!550487 e!446452)))

(assert (=> d!103647 (= res!550487 (bvsge #b00000000000000000000000000000000 (size!21425 a!3170)))))

(assert (=> d!103647 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!446452)))

(declare-fun b!806214 () Bool)

(assert (=> b!806214 (= e!446451 e!446453)))

(declare-fun lt!361057 () (_ BitVec 64))

(assert (=> b!806214 (= lt!361057 (select (arr!21004 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27608 0))(
  ( (Unit!27609) )
))
(declare-fun lt!361056 () Unit!27608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43851 (_ BitVec 64) (_ BitVec 32)) Unit!27608)

(assert (=> b!806214 (= lt!361056 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!361057 #b00000000000000000000000000000000))))

(assert (=> b!806214 (arrayContainsKey!0 a!3170 lt!361057 #b00000000000000000000000000000000)))

(declare-fun lt!361058 () Unit!27608)

(assert (=> b!806214 (= lt!361058 lt!361056)))

(declare-fun res!550486 () Bool)

(assert (=> b!806214 (= res!550486 (= (seekEntryOrOpen!0 (select (arr!21004 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8595 #b00000000000000000000000000000000)))))

(assert (=> b!806214 (=> (not res!550486) (not e!446453))))

(declare-fun bm!35367 () Bool)

(assert (=> bm!35367 (= call!35370 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(assert (= (and d!103647 (not res!550487)) b!806213))

(assert (= (and b!806213 c!88273) b!806214))

(assert (= (and b!806213 (not c!88273)) b!806211))

(assert (= (and b!806214 res!550486) b!806212))

(assert (= (or b!806212 b!806211) bm!35367))

(declare-fun m!748167 () Bool)

(assert (=> b!806213 m!748167))

(assert (=> b!806213 m!748167))

(declare-fun m!748169 () Bool)

(assert (=> b!806213 m!748169))

(assert (=> b!806214 m!748167))

(declare-fun m!748171 () Bool)

(assert (=> b!806214 m!748171))

(declare-fun m!748173 () Bool)

(assert (=> b!806214 m!748173))

(assert (=> b!806214 m!748167))

(declare-fun m!748175 () Bool)

(assert (=> b!806214 m!748175))

(declare-fun m!748177 () Bool)

(assert (=> bm!35367 m!748177))

(assert (=> b!806115 d!103647))

(declare-fun b!806269 () Bool)

(declare-fun e!446481 () SeekEntryResult!8595)

(assert (=> b!806269 (= e!446481 (Found!8595 index!1236))))

(declare-fun b!806270 () Bool)

(declare-fun e!446482 () SeekEntryResult!8595)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806270 (= e!446482 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!360994 lt!360995 mask!3266))))

(declare-fun b!806271 () Bool)

(assert (=> b!806271 (= e!446482 (MissingVacant!8595 vacantAfter!23))))

(declare-fun b!806272 () Bool)

(declare-fun e!446483 () SeekEntryResult!8595)

(assert (=> b!806272 (= e!446483 e!446481)))

(declare-fun c!88303 () Bool)

(declare-fun lt!361082 () (_ BitVec 64))

(assert (=> b!806272 (= c!88303 (= lt!361082 lt!360994))))

(declare-fun d!103651 () Bool)

(declare-fun lt!361081 () SeekEntryResult!8595)

(assert (=> d!103651 (and (or ((_ is Undefined!8595) lt!361081) (not ((_ is Found!8595) lt!361081)) (and (bvsge (index!36749 lt!361081) #b00000000000000000000000000000000) (bvslt (index!36749 lt!361081) (size!21425 lt!360995)))) (or ((_ is Undefined!8595) lt!361081) ((_ is Found!8595) lt!361081) (not ((_ is MissingVacant!8595) lt!361081)) (not (= (index!36751 lt!361081) vacantAfter!23)) (and (bvsge (index!36751 lt!361081) #b00000000000000000000000000000000) (bvslt (index!36751 lt!361081) (size!21425 lt!360995)))) (or ((_ is Undefined!8595) lt!361081) (ite ((_ is Found!8595) lt!361081) (= (select (arr!21004 lt!360995) (index!36749 lt!361081)) lt!360994) (and ((_ is MissingVacant!8595) lt!361081) (= (index!36751 lt!361081) vacantAfter!23) (= (select (arr!21004 lt!360995) (index!36751 lt!361081)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103651 (= lt!361081 e!446483)))

(declare-fun c!88301 () Bool)

(assert (=> d!103651 (= c!88301 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103651 (= lt!361082 (select (arr!21004 lt!360995) index!1236))))

(assert (=> d!103651 (validMask!0 mask!3266)))

(assert (=> d!103651 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360994 lt!360995 mask!3266) lt!361081)))

(declare-fun b!806273 () Bool)

(assert (=> b!806273 (= e!446483 Undefined!8595)))

(declare-fun b!806274 () Bool)

(declare-fun c!88302 () Bool)

(assert (=> b!806274 (= c!88302 (= lt!361082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!806274 (= e!446481 e!446482)))

(assert (= (and d!103651 c!88301) b!806273))

(assert (= (and d!103651 (not c!88301)) b!806272))

(assert (= (and b!806272 c!88303) b!806269))

(assert (= (and b!806272 (not c!88303)) b!806274))

(assert (= (and b!806274 c!88302) b!806271))

(assert (= (and b!806274 (not c!88302)) b!806270))

(declare-fun m!748203 () Bool)

(assert (=> b!806270 m!748203))

(assert (=> b!806270 m!748203))

(declare-fun m!748210 () Bool)

(assert (=> b!806270 m!748210))

(declare-fun m!748213 () Bool)

(assert (=> d!103651 m!748213))

(declare-fun m!748219 () Bool)

(assert (=> d!103651 m!748219))

(declare-fun m!748221 () Bool)

(assert (=> d!103651 m!748221))

(assert (=> d!103651 m!748071))

(assert (=> b!806113 d!103651))

(declare-fun d!103657 () Bool)

(declare-fun lt!361084 () SeekEntryResult!8595)

(assert (=> d!103657 (and (or ((_ is Undefined!8595) lt!361084) (not ((_ is Found!8595) lt!361084)) (and (bvsge (index!36749 lt!361084) #b00000000000000000000000000000000) (bvslt (index!36749 lt!361084) (size!21425 lt!360995)))) (or ((_ is Undefined!8595) lt!361084) ((_ is Found!8595) lt!361084) (not ((_ is MissingZero!8595) lt!361084)) (and (bvsge (index!36748 lt!361084) #b00000000000000000000000000000000) (bvslt (index!36748 lt!361084) (size!21425 lt!360995)))) (or ((_ is Undefined!8595) lt!361084) ((_ is Found!8595) lt!361084) ((_ is MissingZero!8595) lt!361084) (not ((_ is MissingVacant!8595) lt!361084)) (and (bvsge (index!36751 lt!361084) #b00000000000000000000000000000000) (bvslt (index!36751 lt!361084) (size!21425 lt!360995)))) (or ((_ is Undefined!8595) lt!361084) (ite ((_ is Found!8595) lt!361084) (= (select (arr!21004 lt!360995) (index!36749 lt!361084)) lt!360994) (ite ((_ is MissingZero!8595) lt!361084) (= (select (arr!21004 lt!360995) (index!36748 lt!361084)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8595) lt!361084) (= (select (arr!21004 lt!360995) (index!36751 lt!361084)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!446485 () SeekEntryResult!8595)

(assert (=> d!103657 (= lt!361084 e!446485)))

(declare-fun c!88306 () Bool)

(declare-fun lt!361085 () SeekEntryResult!8595)

(assert (=> d!103657 (= c!88306 (and ((_ is Intermediate!8595) lt!361085) (undefined!9407 lt!361085)))))

(assert (=> d!103657 (= lt!361085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!360994 mask!3266) lt!360994 lt!360995 mask!3266))))

(assert (=> d!103657 (validMask!0 mask!3266)))

(assert (=> d!103657 (= (seekEntryOrOpen!0 lt!360994 lt!360995 mask!3266) lt!361084)))

(declare-fun b!806275 () Bool)

(declare-fun e!446484 () SeekEntryResult!8595)

(assert (=> b!806275 (= e!446484 (MissingZero!8595 (index!36750 lt!361085)))))

(declare-fun b!806276 () Bool)

(assert (=> b!806276 (= e!446485 Undefined!8595)))

(declare-fun b!806277 () Bool)

(declare-fun c!88304 () Bool)

(declare-fun lt!361083 () (_ BitVec 64))

(assert (=> b!806277 (= c!88304 (= lt!361083 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446486 () SeekEntryResult!8595)

(assert (=> b!806277 (= e!446486 e!446484)))

(declare-fun b!806278 () Bool)

(assert (=> b!806278 (= e!446484 (seekKeyOrZeroReturnVacant!0 (x!67564 lt!361085) (index!36750 lt!361085) (index!36750 lt!361085) lt!360994 lt!360995 mask!3266))))

(declare-fun b!806279 () Bool)

(assert (=> b!806279 (= e!446486 (Found!8595 (index!36750 lt!361085)))))

(declare-fun b!806280 () Bool)

(assert (=> b!806280 (= e!446485 e!446486)))

(assert (=> b!806280 (= lt!361083 (select (arr!21004 lt!360995) (index!36750 lt!361085)))))

(declare-fun c!88305 () Bool)

(assert (=> b!806280 (= c!88305 (= lt!361083 lt!360994))))

(assert (= (and d!103657 c!88306) b!806276))

(assert (= (and d!103657 (not c!88306)) b!806280))

(assert (= (and b!806280 c!88305) b!806279))

(assert (= (and b!806280 (not c!88305)) b!806277))

(assert (= (and b!806277 c!88304) b!806275))

(assert (= (and b!806277 (not c!88304)) b!806278))

(declare-fun m!748227 () Bool)

(assert (=> d!103657 m!748227))

(declare-fun m!748229 () Bool)

(assert (=> d!103657 m!748229))

(assert (=> d!103657 m!748227))

(declare-fun m!748231 () Bool)

(assert (=> d!103657 m!748231))

(declare-fun m!748233 () Bool)

(assert (=> d!103657 m!748233))

(declare-fun m!748235 () Bool)

(assert (=> d!103657 m!748235))

(assert (=> d!103657 m!748071))

(declare-fun m!748237 () Bool)

(assert (=> b!806278 m!748237))

(declare-fun m!748239 () Bool)

(assert (=> b!806280 m!748239))

(assert (=> b!806113 d!103657))

(declare-fun b!806309 () Bool)

(declare-fun e!446510 () Bool)

(declare-fun call!35373 () Bool)

(assert (=> b!806309 (= e!446510 call!35373)))

(declare-fun b!806310 () Bool)

(declare-fun e!446509 () Bool)

(assert (=> b!806310 (= e!446509 e!446510)))

(declare-fun c!88315 () Bool)

(assert (=> b!806310 (= c!88315 (validKeyInArray!0 (select (arr!21004 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!806311 () Bool)

(assert (=> b!806311 (= e!446510 call!35373)))

(declare-fun d!103663 () Bool)

(declare-fun res!550501 () Bool)

(declare-fun e!446507 () Bool)

(assert (=> d!103663 (=> res!550501 e!446507)))

(assert (=> d!103663 (= res!550501 (bvsge #b00000000000000000000000000000000 (size!21425 a!3170)))))

(assert (=> d!103663 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14964) e!446507)))

(declare-fun b!806312 () Bool)

(assert (=> b!806312 (= e!446507 e!446509)))

(declare-fun res!550502 () Bool)

(assert (=> b!806312 (=> (not res!550502) (not e!446509))))

(declare-fun e!446508 () Bool)

(assert (=> b!806312 (= res!550502 (not e!446508))))

(declare-fun res!550500 () Bool)

(assert (=> b!806312 (=> (not res!550500) (not e!446508))))

(assert (=> b!806312 (= res!550500 (validKeyInArray!0 (select (arr!21004 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!806313 () Bool)

(declare-fun contains!4123 (List!14967 (_ BitVec 64)) Bool)

(assert (=> b!806313 (= e!446508 (contains!4123 Nil!14964 (select (arr!21004 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35370 () Bool)

(assert (=> bm!35370 (= call!35373 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88315 (Cons!14963 (select (arr!21004 a!3170) #b00000000000000000000000000000000) Nil!14964) Nil!14964)))))

(assert (= (and d!103663 (not res!550501)) b!806312))

(assert (= (and b!806312 res!550500) b!806313))

(assert (= (and b!806312 res!550502) b!806310))

(assert (= (and b!806310 c!88315) b!806311))

(assert (= (and b!806310 (not c!88315)) b!806309))

(assert (= (or b!806311 b!806309) bm!35370))

(assert (=> b!806310 m!748167))

(assert (=> b!806310 m!748167))

(assert (=> b!806310 m!748169))

(assert (=> b!806312 m!748167))

(assert (=> b!806312 m!748167))

(assert (=> b!806312 m!748169))

(assert (=> b!806313 m!748167))

(assert (=> b!806313 m!748167))

(declare-fun m!748245 () Bool)

(assert (=> b!806313 m!748245))

(assert (=> bm!35370 m!748167))

(declare-fun m!748247 () Bool)

(assert (=> bm!35370 m!748247))

(assert (=> b!806114 d!103663))

(declare-fun d!103669 () Bool)

(assert (=> d!103669 (= (validKeyInArray!0 (select (arr!21004 a!3170) j!153)) (and (not (= (select (arr!21004 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21004 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!806117 d!103669))

(declare-fun b!806314 () Bool)

(declare-fun e!446511 () SeekEntryResult!8595)

(assert (=> b!806314 (= e!446511 (Found!8595 index!1236))))

(declare-fun e!446512 () SeekEntryResult!8595)

(declare-fun b!806315 () Bool)

(assert (=> b!806315 (= e!446512 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21004 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806316 () Bool)

(assert (=> b!806316 (= e!446512 (MissingVacant!8595 vacantBefore!23))))

(declare-fun b!806317 () Bool)

(declare-fun e!446513 () SeekEntryResult!8595)

(assert (=> b!806317 (= e!446513 e!446511)))

(declare-fun lt!361093 () (_ BitVec 64))

(declare-fun c!88318 () Bool)

(assert (=> b!806317 (= c!88318 (= lt!361093 (select (arr!21004 a!3170) j!153)))))

(declare-fun lt!361092 () SeekEntryResult!8595)

(declare-fun d!103671 () Bool)

(assert (=> d!103671 (and (or ((_ is Undefined!8595) lt!361092) (not ((_ is Found!8595) lt!361092)) (and (bvsge (index!36749 lt!361092) #b00000000000000000000000000000000) (bvslt (index!36749 lt!361092) (size!21425 a!3170)))) (or ((_ is Undefined!8595) lt!361092) ((_ is Found!8595) lt!361092) (not ((_ is MissingVacant!8595) lt!361092)) (not (= (index!36751 lt!361092) vacantBefore!23)) (and (bvsge (index!36751 lt!361092) #b00000000000000000000000000000000) (bvslt (index!36751 lt!361092) (size!21425 a!3170)))) (or ((_ is Undefined!8595) lt!361092) (ite ((_ is Found!8595) lt!361092) (= (select (arr!21004 a!3170) (index!36749 lt!361092)) (select (arr!21004 a!3170) j!153)) (and ((_ is MissingVacant!8595) lt!361092) (= (index!36751 lt!361092) vacantBefore!23) (= (select (arr!21004 a!3170) (index!36751 lt!361092)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103671 (= lt!361092 e!446513)))

(declare-fun c!88316 () Bool)

(assert (=> d!103671 (= c!88316 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103671 (= lt!361093 (select (arr!21004 a!3170) index!1236))))

(assert (=> d!103671 (validMask!0 mask!3266)))

(assert (=> d!103671 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21004 a!3170) j!153) a!3170 mask!3266) lt!361092)))

(declare-fun b!806318 () Bool)

(assert (=> b!806318 (= e!446513 Undefined!8595)))

(declare-fun b!806319 () Bool)

(declare-fun c!88317 () Bool)

(assert (=> b!806319 (= c!88317 (= lt!361093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!806319 (= e!446511 e!446512)))

(assert (= (and d!103671 c!88316) b!806318))

(assert (= (and d!103671 (not c!88316)) b!806317))

(assert (= (and b!806317 c!88318) b!806314))

(assert (= (and b!806317 (not c!88318)) b!806319))

(assert (= (and b!806319 c!88317) b!806316))

(assert (= (and b!806319 (not c!88317)) b!806315))

(assert (=> b!806315 m!748203))

(assert (=> b!806315 m!748203))

(assert (=> b!806315 m!748063))

(declare-fun m!748249 () Bool)

(assert (=> b!806315 m!748249))

(declare-fun m!748251 () Bool)

(assert (=> d!103671 m!748251))

(declare-fun m!748253 () Bool)

(assert (=> d!103671 m!748253))

(assert (=> d!103671 m!748061))

(assert (=> d!103671 m!748071))

(assert (=> b!806112 d!103671))

(declare-fun d!103673 () Bool)

(declare-fun lt!361095 () SeekEntryResult!8595)

(assert (=> d!103673 (and (or ((_ is Undefined!8595) lt!361095) (not ((_ is Found!8595) lt!361095)) (and (bvsge (index!36749 lt!361095) #b00000000000000000000000000000000) (bvslt (index!36749 lt!361095) (size!21425 a!3170)))) (or ((_ is Undefined!8595) lt!361095) ((_ is Found!8595) lt!361095) (not ((_ is MissingZero!8595) lt!361095)) (and (bvsge (index!36748 lt!361095) #b00000000000000000000000000000000) (bvslt (index!36748 lt!361095) (size!21425 a!3170)))) (or ((_ is Undefined!8595) lt!361095) ((_ is Found!8595) lt!361095) ((_ is MissingZero!8595) lt!361095) (not ((_ is MissingVacant!8595) lt!361095)) (and (bvsge (index!36751 lt!361095) #b00000000000000000000000000000000) (bvslt (index!36751 lt!361095) (size!21425 a!3170)))) (or ((_ is Undefined!8595) lt!361095) (ite ((_ is Found!8595) lt!361095) (= (select (arr!21004 a!3170) (index!36749 lt!361095)) (select (arr!21004 a!3170) j!153)) (ite ((_ is MissingZero!8595) lt!361095) (= (select (arr!21004 a!3170) (index!36748 lt!361095)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8595) lt!361095) (= (select (arr!21004 a!3170) (index!36751 lt!361095)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!446515 () SeekEntryResult!8595)

(assert (=> d!103673 (= lt!361095 e!446515)))

(declare-fun c!88321 () Bool)

(declare-fun lt!361096 () SeekEntryResult!8595)

(assert (=> d!103673 (= c!88321 (and ((_ is Intermediate!8595) lt!361096) (undefined!9407 lt!361096)))))

(assert (=> d!103673 (= lt!361096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21004 a!3170) j!153) mask!3266) (select (arr!21004 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103673 (validMask!0 mask!3266)))

(assert (=> d!103673 (= (seekEntryOrOpen!0 (select (arr!21004 a!3170) j!153) a!3170 mask!3266) lt!361095)))

(declare-fun b!806320 () Bool)

(declare-fun e!446514 () SeekEntryResult!8595)

(assert (=> b!806320 (= e!446514 (MissingZero!8595 (index!36750 lt!361096)))))

(declare-fun b!806321 () Bool)

(assert (=> b!806321 (= e!446515 Undefined!8595)))

(declare-fun b!806322 () Bool)

(declare-fun c!88319 () Bool)

(declare-fun lt!361094 () (_ BitVec 64))

(assert (=> b!806322 (= c!88319 (= lt!361094 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446516 () SeekEntryResult!8595)

(assert (=> b!806322 (= e!446516 e!446514)))

(declare-fun b!806323 () Bool)

(assert (=> b!806323 (= e!446514 (seekKeyOrZeroReturnVacant!0 (x!67564 lt!361096) (index!36750 lt!361096) (index!36750 lt!361096) (select (arr!21004 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806324 () Bool)

(assert (=> b!806324 (= e!446516 (Found!8595 (index!36750 lt!361096)))))

(declare-fun b!806325 () Bool)

(assert (=> b!806325 (= e!446515 e!446516)))

(assert (=> b!806325 (= lt!361094 (select (arr!21004 a!3170) (index!36750 lt!361096)))))

(declare-fun c!88320 () Bool)

(assert (=> b!806325 (= c!88320 (= lt!361094 (select (arr!21004 a!3170) j!153)))))

(assert (= (and d!103673 c!88321) b!806321))

(assert (= (and d!103673 (not c!88321)) b!806325))

(assert (= (and b!806325 c!88320) b!806324))

(assert (= (and b!806325 (not c!88320)) b!806322))

(assert (= (and b!806322 c!88319) b!806320))

(assert (= (and b!806322 (not c!88319)) b!806323))

(assert (=> d!103673 m!748063))

(declare-fun m!748255 () Bool)

(assert (=> d!103673 m!748255))

(declare-fun m!748257 () Bool)

(assert (=> d!103673 m!748257))

(assert (=> d!103673 m!748255))

(assert (=> d!103673 m!748063))

(declare-fun m!748259 () Bool)

(assert (=> d!103673 m!748259))

(declare-fun m!748261 () Bool)

(assert (=> d!103673 m!748261))

(declare-fun m!748263 () Bool)

(assert (=> d!103673 m!748263))

(assert (=> d!103673 m!748071))

(assert (=> b!806323 m!748063))

(declare-fun m!748265 () Bool)

(assert (=> b!806323 m!748265))

(declare-fun m!748267 () Bool)

(assert (=> b!806325 m!748267))

(assert (=> b!806112 d!103673))

(declare-fun d!103675 () Bool)

(declare-fun res!550511 () Bool)

(declare-fun e!446536 () Bool)

(assert (=> d!103675 (=> res!550511 e!446536)))

(assert (=> d!103675 (= res!550511 (= (select (arr!21004 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103675 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!446536)))

(declare-fun b!806356 () Bool)

(declare-fun e!446537 () Bool)

(assert (=> b!806356 (= e!446536 e!446537)))

(declare-fun res!550512 () Bool)

(assert (=> b!806356 (=> (not res!550512) (not e!446537))))

(assert (=> b!806356 (= res!550512 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21425 a!3170)))))

(declare-fun b!806357 () Bool)

(assert (=> b!806357 (= e!446537 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103675 (not res!550511)) b!806356))

(assert (= (and b!806356 res!550512) b!806357))

(assert (=> d!103675 m!748167))

(declare-fun m!748289 () Bool)

(assert (=> b!806357 m!748289))

(assert (=> b!806118 d!103675))

(check-sat (not b!806310) (not bm!35367) (not d!103657) (not d!103651) (not d!103631) (not b!806170) (not d!103671) (not b!806323) (not bm!35370) (not b!806313) (not b!806214) (not b!806312) (not b!806315) (not b!806357) (not b!806213) (not b!806278) (not d!103673) (not b!806270))
(check-sat)
