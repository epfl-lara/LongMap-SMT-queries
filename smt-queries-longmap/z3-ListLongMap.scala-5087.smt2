; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69034 () Bool)

(assert start!69034)

(declare-fun res!549976 () Bool)

(declare-fun e!446051 () Bool)

(assert (=> start!69034 (=> (not res!549976) (not e!446051))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69034 (= res!549976 (validMask!0 mask!3266))))

(assert (=> start!69034 e!446051))

(assert (=> start!69034 true))

(declare-datatypes ((array!43824 0))(
  ( (array!43825 (arr!20992 (Array (_ BitVec 32) (_ BitVec 64))) (size!21413 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43824)

(declare-fun array_inv!16788 (array!43824) Bool)

(assert (=> start!69034 (array_inv!16788 a!3170)))

(declare-fun b!805449 () Bool)

(declare-fun res!549975 () Bool)

(declare-fun e!446053 () Bool)

(assert (=> b!805449 (=> (not res!549975) (not e!446053))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805449 (= res!549975 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21413 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20992 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21413 a!3170)) (= (select (arr!20992 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805450 () Bool)

(declare-fun res!549972 () Bool)

(assert (=> b!805450 (=> (not res!549972) (not e!446051))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805450 (= res!549972 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805451 () Bool)

(declare-fun res!549970 () Bool)

(assert (=> b!805451 (=> (not res!549970) (not e!446051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805451 (= res!549970 (validKeyInArray!0 k0!2044))))

(declare-fun b!805452 () Bool)

(assert (=> b!805452 (= e!446051 e!446053)))

(declare-fun res!549974 () Bool)

(assert (=> b!805452 (=> (not res!549974) (not e!446053))))

(declare-datatypes ((SeekEntryResult!8583 0))(
  ( (MissingZero!8583 (index!36700 (_ BitVec 32))) (Found!8583 (index!36701 (_ BitVec 32))) (Intermediate!8583 (undefined!9395 Bool) (index!36702 (_ BitVec 32)) (x!67517 (_ BitVec 32))) (Undefined!8583) (MissingVacant!8583 (index!36703 (_ BitVec 32))) )
))
(declare-fun lt!360644 () SeekEntryResult!8583)

(assert (=> b!805452 (= res!549974 (or (= lt!360644 (MissingZero!8583 i!1163)) (= lt!360644 (MissingVacant!8583 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43824 (_ BitVec 32)) SeekEntryResult!8583)

(assert (=> b!805452 (= lt!360644 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805453 () Bool)

(declare-fun e!446054 () Bool)

(assert (=> b!805453 (= e!446053 e!446054)))

(declare-fun res!549969 () Bool)

(assert (=> b!805453 (=> (not res!549969) (not e!446054))))

(declare-fun lt!360641 () SeekEntryResult!8583)

(declare-fun lt!360642 () SeekEntryResult!8583)

(assert (=> b!805453 (= res!549969 (= lt!360641 lt!360642))))

(declare-fun lt!360647 () array!43824)

(declare-fun lt!360645 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43824 (_ BitVec 32)) SeekEntryResult!8583)

(assert (=> b!805453 (= lt!360642 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360645 lt!360647 mask!3266))))

(assert (=> b!805453 (= lt!360641 (seekEntryOrOpen!0 lt!360645 lt!360647 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805453 (= lt!360645 (select (store (arr!20992 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805453 (= lt!360647 (array!43825 (store (arr!20992 a!3170) i!1163 k0!2044) (size!21413 a!3170)))))

(declare-fun b!805454 () Bool)

(declare-fun res!549968 () Bool)

(assert (=> b!805454 (=> (not res!549968) (not e!446053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43824 (_ BitVec 32)) Bool)

(assert (=> b!805454 (= res!549968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805455 () Bool)

(declare-fun lt!360643 () SeekEntryResult!8583)

(declare-fun lt!360646 () SeekEntryResult!8583)

(assert (=> b!805455 (= e!446054 (and (= lt!360643 lt!360646) (= lt!360646 (Found!8583 j!153)) (= (select (arr!20992 a!3170) index!1236) (select (arr!20992 a!3170) j!153)) (not (= lt!360642 (Found!8583 index!1236)))))))

(assert (=> b!805455 (= lt!360646 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20992 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!805455 (= lt!360643 (seekEntryOrOpen!0 (select (arr!20992 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805456 () Bool)

(declare-fun res!549971 () Bool)

(assert (=> b!805456 (=> (not res!549971) (not e!446053))))

(declare-datatypes ((List!14955 0))(
  ( (Nil!14952) (Cons!14951 (h!16080 (_ BitVec 64)) (t!21270 List!14955)) )
))
(declare-fun arrayNoDuplicates!0 (array!43824 (_ BitVec 32) List!14955) Bool)

(assert (=> b!805456 (= res!549971 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14952))))

(declare-fun b!805457 () Bool)

(declare-fun res!549973 () Bool)

(assert (=> b!805457 (=> (not res!549973) (not e!446051))))

(assert (=> b!805457 (= res!549973 (and (= (size!21413 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21413 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21413 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805458 () Bool)

(declare-fun res!549977 () Bool)

(assert (=> b!805458 (=> (not res!549977) (not e!446051))))

(assert (=> b!805458 (= res!549977 (validKeyInArray!0 (select (arr!20992 a!3170) j!153)))))

(assert (= (and start!69034 res!549976) b!805457))

(assert (= (and b!805457 res!549973) b!805458))

(assert (= (and b!805458 res!549977) b!805451))

(assert (= (and b!805451 res!549970) b!805450))

(assert (= (and b!805450 res!549972) b!805452))

(assert (= (and b!805452 res!549974) b!805454))

(assert (= (and b!805454 res!549968) b!805456))

(assert (= (and b!805456 res!549971) b!805449))

(assert (= (and b!805449 res!549975) b!805453))

(assert (= (and b!805453 res!549969) b!805455))

(declare-fun m!747401 () Bool)

(assert (=> b!805456 m!747401))

(declare-fun m!747403 () Bool)

(assert (=> b!805449 m!747403))

(declare-fun m!747405 () Bool)

(assert (=> b!805449 m!747405))

(declare-fun m!747407 () Bool)

(assert (=> b!805453 m!747407))

(declare-fun m!747409 () Bool)

(assert (=> b!805453 m!747409))

(declare-fun m!747411 () Bool)

(assert (=> b!805453 m!747411))

(declare-fun m!747413 () Bool)

(assert (=> b!805453 m!747413))

(declare-fun m!747415 () Bool)

(assert (=> b!805455 m!747415))

(declare-fun m!747417 () Bool)

(assert (=> b!805455 m!747417))

(assert (=> b!805455 m!747417))

(declare-fun m!747419 () Bool)

(assert (=> b!805455 m!747419))

(assert (=> b!805455 m!747417))

(declare-fun m!747421 () Bool)

(assert (=> b!805455 m!747421))

(declare-fun m!747423 () Bool)

(assert (=> start!69034 m!747423))

(declare-fun m!747425 () Bool)

(assert (=> start!69034 m!747425))

(declare-fun m!747427 () Bool)

(assert (=> b!805451 m!747427))

(assert (=> b!805458 m!747417))

(assert (=> b!805458 m!747417))

(declare-fun m!747429 () Bool)

(assert (=> b!805458 m!747429))

(declare-fun m!747431 () Bool)

(assert (=> b!805454 m!747431))

(declare-fun m!747433 () Bool)

(assert (=> b!805450 m!747433))

(declare-fun m!747435 () Bool)

(assert (=> b!805452 m!747435))

(check-sat (not b!805454) (not b!805455) (not b!805458) (not b!805452) (not b!805450) (not start!69034) (not b!805456) (not b!805451) (not b!805453))
(check-sat)
(get-model)

(declare-fun d!103551 () Bool)

(assert (=> d!103551 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!805451 d!103551))

(declare-fun b!805499 () Bool)

(declare-fun e!446076 () Bool)

(declare-fun contains!4121 (List!14955 (_ BitVec 64)) Bool)

(assert (=> b!805499 (= e!446076 (contains!4121 Nil!14952 (select (arr!20992 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!805500 () Bool)

(declare-fun e!446077 () Bool)

(declare-fun call!35349 () Bool)

(assert (=> b!805500 (= e!446077 call!35349)))

(declare-fun d!103553 () Bool)

(declare-fun res!550014 () Bool)

(declare-fun e!446075 () Bool)

(assert (=> d!103553 (=> res!550014 e!446075)))

(assert (=> d!103553 (= res!550014 (bvsge #b00000000000000000000000000000000 (size!21413 a!3170)))))

(assert (=> d!103553 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14952) e!446075)))

(declare-fun b!805501 () Bool)

(declare-fun e!446078 () Bool)

(assert (=> b!805501 (= e!446078 e!446077)))

(declare-fun c!88153 () Bool)

(assert (=> b!805501 (= c!88153 (validKeyInArray!0 (select (arr!20992 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!805502 () Bool)

(assert (=> b!805502 (= e!446075 e!446078)))

(declare-fun res!550016 () Bool)

(assert (=> b!805502 (=> (not res!550016) (not e!446078))))

(assert (=> b!805502 (= res!550016 (not e!446076))))

(declare-fun res!550015 () Bool)

(assert (=> b!805502 (=> (not res!550015) (not e!446076))))

(assert (=> b!805502 (= res!550015 (validKeyInArray!0 (select (arr!20992 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35346 () Bool)

(assert (=> bm!35346 (= call!35349 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88153 (Cons!14951 (select (arr!20992 a!3170) #b00000000000000000000000000000000) Nil!14952) Nil!14952)))))

(declare-fun b!805503 () Bool)

(assert (=> b!805503 (= e!446077 call!35349)))

(assert (= (and d!103553 (not res!550014)) b!805502))

(assert (= (and b!805502 res!550015) b!805499))

(assert (= (and b!805502 res!550016) b!805501))

(assert (= (and b!805501 c!88153) b!805503))

(assert (= (and b!805501 (not c!88153)) b!805500))

(assert (= (or b!805503 b!805500) bm!35346))

(declare-fun m!747473 () Bool)

(assert (=> b!805499 m!747473))

(assert (=> b!805499 m!747473))

(declare-fun m!747475 () Bool)

(assert (=> b!805499 m!747475))

(assert (=> b!805501 m!747473))

(assert (=> b!805501 m!747473))

(declare-fun m!747477 () Bool)

(assert (=> b!805501 m!747477))

(assert (=> b!805502 m!747473))

(assert (=> b!805502 m!747473))

(assert (=> b!805502 m!747477))

(assert (=> bm!35346 m!747473))

(declare-fun m!747479 () Bool)

(assert (=> bm!35346 m!747479))

(assert (=> b!805456 d!103553))

(declare-fun d!103555 () Bool)

(assert (=> d!103555 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69034 d!103555))

(declare-fun d!103557 () Bool)

(assert (=> d!103557 (= (array_inv!16788 a!3170) (bvsge (size!21413 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69034 d!103557))

(declare-fun d!103559 () Bool)

(declare-fun res!550021 () Bool)

(declare-fun e!446083 () Bool)

(assert (=> d!103559 (=> res!550021 e!446083)))

(assert (=> d!103559 (= res!550021 (= (select (arr!20992 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103559 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!446083)))

(declare-fun b!805508 () Bool)

(declare-fun e!446084 () Bool)

(assert (=> b!805508 (= e!446083 e!446084)))

(declare-fun res!550022 () Bool)

(assert (=> b!805508 (=> (not res!550022) (not e!446084))))

(assert (=> b!805508 (= res!550022 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21413 a!3170)))))

(declare-fun b!805509 () Bool)

(assert (=> b!805509 (= e!446084 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103559 (not res!550021)) b!805508))

(assert (= (and b!805508 res!550022) b!805509))

(assert (=> d!103559 m!747473))

(declare-fun m!747481 () Bool)

(assert (=> b!805509 m!747481))

(assert (=> b!805450 d!103559))

(declare-fun b!805528 () Bool)

(declare-fun e!446098 () SeekEntryResult!8583)

(declare-fun e!446099 () SeekEntryResult!8583)

(assert (=> b!805528 (= e!446098 e!446099)))

(declare-fun c!88162 () Bool)

(declare-fun lt!360673 () (_ BitVec 64))

(assert (=> b!805528 (= c!88162 (= lt!360673 (select (arr!20992 a!3170) j!153)))))

(declare-fun b!805529 () Bool)

(declare-fun e!446097 () SeekEntryResult!8583)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!805529 (= e!446097 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!20992 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805530 () Bool)

(assert (=> b!805530 (= e!446098 Undefined!8583)))

(declare-fun b!805531 () Bool)

(assert (=> b!805531 (= e!446099 (Found!8583 index!1236))))

(declare-fun lt!360674 () SeekEntryResult!8583)

(declare-fun d!103561 () Bool)

(get-info :version)

(assert (=> d!103561 (and (or ((_ is Undefined!8583) lt!360674) (not ((_ is Found!8583) lt!360674)) (and (bvsge (index!36701 lt!360674) #b00000000000000000000000000000000) (bvslt (index!36701 lt!360674) (size!21413 a!3170)))) (or ((_ is Undefined!8583) lt!360674) ((_ is Found!8583) lt!360674) (not ((_ is MissingVacant!8583) lt!360674)) (not (= (index!36703 lt!360674) vacantBefore!23)) (and (bvsge (index!36703 lt!360674) #b00000000000000000000000000000000) (bvslt (index!36703 lt!360674) (size!21413 a!3170)))) (or ((_ is Undefined!8583) lt!360674) (ite ((_ is Found!8583) lt!360674) (= (select (arr!20992 a!3170) (index!36701 lt!360674)) (select (arr!20992 a!3170) j!153)) (and ((_ is MissingVacant!8583) lt!360674) (= (index!36703 lt!360674) vacantBefore!23) (= (select (arr!20992 a!3170) (index!36703 lt!360674)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103561 (= lt!360674 e!446098)))

(declare-fun c!88160 () Bool)

(assert (=> d!103561 (= c!88160 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103561 (= lt!360673 (select (arr!20992 a!3170) index!1236))))

(assert (=> d!103561 (validMask!0 mask!3266)))

(assert (=> d!103561 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20992 a!3170) j!153) a!3170 mask!3266) lt!360674)))

(declare-fun b!805532 () Bool)

(assert (=> b!805532 (= e!446097 (MissingVacant!8583 vacantBefore!23))))

(declare-fun b!805533 () Bool)

(declare-fun c!88161 () Bool)

(assert (=> b!805533 (= c!88161 (= lt!360673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805533 (= e!446099 e!446097)))

(assert (= (and d!103561 c!88160) b!805530))

(assert (= (and d!103561 (not c!88160)) b!805528))

(assert (= (and b!805528 c!88162) b!805531))

(assert (= (and b!805528 (not c!88162)) b!805533))

(assert (= (and b!805533 c!88161) b!805532))

(assert (= (and b!805533 (not c!88161)) b!805529))

(declare-fun m!747487 () Bool)

(assert (=> b!805529 m!747487))

(assert (=> b!805529 m!747487))

(assert (=> b!805529 m!747417))

(declare-fun m!747489 () Bool)

(assert (=> b!805529 m!747489))

(declare-fun m!747491 () Bool)

(assert (=> d!103561 m!747491))

(declare-fun m!747493 () Bool)

(assert (=> d!103561 m!747493))

(assert (=> d!103561 m!747415))

(assert (=> d!103561 m!747423))

(assert (=> b!805455 d!103561))

(declare-fun b!805582 () Bool)

(declare-fun e!446125 () SeekEntryResult!8583)

(declare-fun lt!360698 () SeekEntryResult!8583)

(assert (=> b!805582 (= e!446125 (Found!8583 (index!36702 lt!360698)))))

(declare-fun b!805583 () Bool)

(declare-fun e!446124 () SeekEntryResult!8583)

(assert (=> b!805583 (= e!446124 (seekKeyOrZeroReturnVacant!0 (x!67517 lt!360698) (index!36702 lt!360698) (index!36702 lt!360698) (select (arr!20992 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805584 () Bool)

(declare-fun c!88187 () Bool)

(declare-fun lt!360696 () (_ BitVec 64))

(assert (=> b!805584 (= c!88187 (= lt!360696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805584 (= e!446125 e!446124)))

(declare-fun b!805585 () Bool)

(declare-fun e!446126 () SeekEntryResult!8583)

(assert (=> b!805585 (= e!446126 e!446125)))

(assert (=> b!805585 (= lt!360696 (select (arr!20992 a!3170) (index!36702 lt!360698)))))

(declare-fun c!88188 () Bool)

(assert (=> b!805585 (= c!88188 (= lt!360696 (select (arr!20992 a!3170) j!153)))))

(declare-fun d!103571 () Bool)

(declare-fun lt!360697 () SeekEntryResult!8583)

(assert (=> d!103571 (and (or ((_ is Undefined!8583) lt!360697) (not ((_ is Found!8583) lt!360697)) (and (bvsge (index!36701 lt!360697) #b00000000000000000000000000000000) (bvslt (index!36701 lt!360697) (size!21413 a!3170)))) (or ((_ is Undefined!8583) lt!360697) ((_ is Found!8583) lt!360697) (not ((_ is MissingZero!8583) lt!360697)) (and (bvsge (index!36700 lt!360697) #b00000000000000000000000000000000) (bvslt (index!36700 lt!360697) (size!21413 a!3170)))) (or ((_ is Undefined!8583) lt!360697) ((_ is Found!8583) lt!360697) ((_ is MissingZero!8583) lt!360697) (not ((_ is MissingVacant!8583) lt!360697)) (and (bvsge (index!36703 lt!360697) #b00000000000000000000000000000000) (bvslt (index!36703 lt!360697) (size!21413 a!3170)))) (or ((_ is Undefined!8583) lt!360697) (ite ((_ is Found!8583) lt!360697) (= (select (arr!20992 a!3170) (index!36701 lt!360697)) (select (arr!20992 a!3170) j!153)) (ite ((_ is MissingZero!8583) lt!360697) (= (select (arr!20992 a!3170) (index!36700 lt!360697)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8583) lt!360697) (= (select (arr!20992 a!3170) (index!36703 lt!360697)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103571 (= lt!360697 e!446126)))

(declare-fun c!88189 () Bool)

(assert (=> d!103571 (= c!88189 (and ((_ is Intermediate!8583) lt!360698) (undefined!9395 lt!360698)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43824 (_ BitVec 32)) SeekEntryResult!8583)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103571 (= lt!360698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20992 a!3170) j!153) mask!3266) (select (arr!20992 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103571 (validMask!0 mask!3266)))

(assert (=> d!103571 (= (seekEntryOrOpen!0 (select (arr!20992 a!3170) j!153) a!3170 mask!3266) lt!360697)))

(declare-fun b!805586 () Bool)

(assert (=> b!805586 (= e!446126 Undefined!8583)))

(declare-fun b!805587 () Bool)

(assert (=> b!805587 (= e!446124 (MissingZero!8583 (index!36702 lt!360698)))))

(assert (= (and d!103571 c!88189) b!805586))

(assert (= (and d!103571 (not c!88189)) b!805585))

(assert (= (and b!805585 c!88188) b!805582))

(assert (= (and b!805585 (not c!88188)) b!805584))

(assert (= (and b!805584 c!88187) b!805587))

(assert (= (and b!805584 (not c!88187)) b!805583))

(assert (=> b!805583 m!747417))

(declare-fun m!747517 () Bool)

(assert (=> b!805583 m!747517))

(declare-fun m!747519 () Bool)

(assert (=> b!805585 m!747519))

(declare-fun m!747521 () Bool)

(assert (=> d!103571 m!747521))

(assert (=> d!103571 m!747417))

(declare-fun m!747523 () Bool)

(assert (=> d!103571 m!747523))

(assert (=> d!103571 m!747523))

(assert (=> d!103571 m!747417))

(declare-fun m!747525 () Bool)

(assert (=> d!103571 m!747525))

(assert (=> d!103571 m!747423))

(declare-fun m!747527 () Bool)

(assert (=> d!103571 m!747527))

(declare-fun m!747529 () Bool)

(assert (=> d!103571 m!747529))

(assert (=> b!805455 d!103571))

(declare-fun b!805642 () Bool)

(declare-fun e!446158 () Bool)

(declare-fun call!35352 () Bool)

(assert (=> b!805642 (= e!446158 call!35352)))

(declare-fun bm!35349 () Bool)

(assert (=> bm!35349 (= call!35352 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!805643 () Bool)

(declare-fun e!446160 () Bool)

(assert (=> b!805643 (= e!446158 e!446160)))

(declare-fun lt!360723 () (_ BitVec 64))

(assert (=> b!805643 (= lt!360723 (select (arr!20992 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27602 0))(
  ( (Unit!27603) )
))
(declare-fun lt!360725 () Unit!27602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43824 (_ BitVec 64) (_ BitVec 32)) Unit!27602)

(assert (=> b!805643 (= lt!360725 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!360723 #b00000000000000000000000000000000))))

(assert (=> b!805643 (arrayContainsKey!0 a!3170 lt!360723 #b00000000000000000000000000000000)))

(declare-fun lt!360724 () Unit!27602)

(assert (=> b!805643 (= lt!360724 lt!360725)))

(declare-fun res!550038 () Bool)

(assert (=> b!805643 (= res!550038 (= (seekEntryOrOpen!0 (select (arr!20992 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8583 #b00000000000000000000000000000000)))))

(assert (=> b!805643 (=> (not res!550038) (not e!446160))))

(declare-fun b!805644 () Bool)

(declare-fun e!446159 () Bool)

(assert (=> b!805644 (= e!446159 e!446158)))

(declare-fun c!88213 () Bool)

(assert (=> b!805644 (= c!88213 (validKeyInArray!0 (select (arr!20992 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103579 () Bool)

(declare-fun res!550037 () Bool)

(assert (=> d!103579 (=> res!550037 e!446159)))

(assert (=> d!103579 (= res!550037 (bvsge #b00000000000000000000000000000000 (size!21413 a!3170)))))

(assert (=> d!103579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!446159)))

(declare-fun b!805645 () Bool)

(assert (=> b!805645 (= e!446160 call!35352)))

(assert (= (and d!103579 (not res!550037)) b!805644))

(assert (= (and b!805644 c!88213) b!805643))

(assert (= (and b!805644 (not c!88213)) b!805642))

(assert (= (and b!805643 res!550038) b!805645))

(assert (= (or b!805645 b!805642) bm!35349))

(declare-fun m!747569 () Bool)

(assert (=> bm!35349 m!747569))

(assert (=> b!805643 m!747473))

(declare-fun m!747571 () Bool)

(assert (=> b!805643 m!747571))

(declare-fun m!747573 () Bool)

(assert (=> b!805643 m!747573))

(assert (=> b!805643 m!747473))

(declare-fun m!747575 () Bool)

(assert (=> b!805643 m!747575))

(assert (=> b!805644 m!747473))

(assert (=> b!805644 m!747473))

(assert (=> b!805644 m!747477))

(assert (=> b!805454 d!103579))

(declare-fun b!805648 () Bool)

(declare-fun e!446164 () SeekEntryResult!8583)

(declare-fun e!446165 () SeekEntryResult!8583)

(assert (=> b!805648 (= e!446164 e!446165)))

(declare-fun c!88216 () Bool)

(declare-fun lt!360726 () (_ BitVec 64))

(assert (=> b!805648 (= c!88216 (= lt!360726 lt!360645))))

(declare-fun e!446163 () SeekEntryResult!8583)

(declare-fun b!805649 () Bool)

(assert (=> b!805649 (= e!446163 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!360645 lt!360647 mask!3266))))

(declare-fun b!805650 () Bool)

(assert (=> b!805650 (= e!446164 Undefined!8583)))

(declare-fun b!805651 () Bool)

(assert (=> b!805651 (= e!446165 (Found!8583 index!1236))))

(declare-fun lt!360727 () SeekEntryResult!8583)

(declare-fun d!103589 () Bool)

(assert (=> d!103589 (and (or ((_ is Undefined!8583) lt!360727) (not ((_ is Found!8583) lt!360727)) (and (bvsge (index!36701 lt!360727) #b00000000000000000000000000000000) (bvslt (index!36701 lt!360727) (size!21413 lt!360647)))) (or ((_ is Undefined!8583) lt!360727) ((_ is Found!8583) lt!360727) (not ((_ is MissingVacant!8583) lt!360727)) (not (= (index!36703 lt!360727) vacantAfter!23)) (and (bvsge (index!36703 lt!360727) #b00000000000000000000000000000000) (bvslt (index!36703 lt!360727) (size!21413 lt!360647)))) (or ((_ is Undefined!8583) lt!360727) (ite ((_ is Found!8583) lt!360727) (= (select (arr!20992 lt!360647) (index!36701 lt!360727)) lt!360645) (and ((_ is MissingVacant!8583) lt!360727) (= (index!36703 lt!360727) vacantAfter!23) (= (select (arr!20992 lt!360647) (index!36703 lt!360727)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103589 (= lt!360727 e!446164)))

(declare-fun c!88214 () Bool)

(assert (=> d!103589 (= c!88214 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103589 (= lt!360726 (select (arr!20992 lt!360647) index!1236))))

(assert (=> d!103589 (validMask!0 mask!3266)))

(assert (=> d!103589 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360645 lt!360647 mask!3266) lt!360727)))

(declare-fun b!805652 () Bool)

(assert (=> b!805652 (= e!446163 (MissingVacant!8583 vacantAfter!23))))

(declare-fun b!805653 () Bool)

(declare-fun c!88215 () Bool)

(assert (=> b!805653 (= c!88215 (= lt!360726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805653 (= e!446165 e!446163)))

(assert (= (and d!103589 c!88214) b!805650))

(assert (= (and d!103589 (not c!88214)) b!805648))

(assert (= (and b!805648 c!88216) b!805651))

(assert (= (and b!805648 (not c!88216)) b!805653))

(assert (= (and b!805653 c!88215) b!805652))

(assert (= (and b!805653 (not c!88215)) b!805649))

(assert (=> b!805649 m!747487))

(assert (=> b!805649 m!747487))

(declare-fun m!747581 () Bool)

(assert (=> b!805649 m!747581))

(declare-fun m!747583 () Bool)

(assert (=> d!103589 m!747583))

(declare-fun m!747585 () Bool)

(assert (=> d!103589 m!747585))

(declare-fun m!747587 () Bool)

(assert (=> d!103589 m!747587))

(assert (=> d!103589 m!747423))

(assert (=> b!805453 d!103589))

(declare-fun b!805654 () Bool)

(declare-fun e!446167 () SeekEntryResult!8583)

(declare-fun lt!360730 () SeekEntryResult!8583)

(assert (=> b!805654 (= e!446167 (Found!8583 (index!36702 lt!360730)))))

(declare-fun e!446166 () SeekEntryResult!8583)

(declare-fun b!805655 () Bool)

(assert (=> b!805655 (= e!446166 (seekKeyOrZeroReturnVacant!0 (x!67517 lt!360730) (index!36702 lt!360730) (index!36702 lt!360730) lt!360645 lt!360647 mask!3266))))

(declare-fun b!805656 () Bool)

(declare-fun c!88217 () Bool)

(declare-fun lt!360728 () (_ BitVec 64))

(assert (=> b!805656 (= c!88217 (= lt!360728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805656 (= e!446167 e!446166)))

(declare-fun b!805657 () Bool)

(declare-fun e!446168 () SeekEntryResult!8583)

(assert (=> b!805657 (= e!446168 e!446167)))

(assert (=> b!805657 (= lt!360728 (select (arr!20992 lt!360647) (index!36702 lt!360730)))))

(declare-fun c!88218 () Bool)

(assert (=> b!805657 (= c!88218 (= lt!360728 lt!360645))))

(declare-fun d!103593 () Bool)

(declare-fun lt!360729 () SeekEntryResult!8583)

(assert (=> d!103593 (and (or ((_ is Undefined!8583) lt!360729) (not ((_ is Found!8583) lt!360729)) (and (bvsge (index!36701 lt!360729) #b00000000000000000000000000000000) (bvslt (index!36701 lt!360729) (size!21413 lt!360647)))) (or ((_ is Undefined!8583) lt!360729) ((_ is Found!8583) lt!360729) (not ((_ is MissingZero!8583) lt!360729)) (and (bvsge (index!36700 lt!360729) #b00000000000000000000000000000000) (bvslt (index!36700 lt!360729) (size!21413 lt!360647)))) (or ((_ is Undefined!8583) lt!360729) ((_ is Found!8583) lt!360729) ((_ is MissingZero!8583) lt!360729) (not ((_ is MissingVacant!8583) lt!360729)) (and (bvsge (index!36703 lt!360729) #b00000000000000000000000000000000) (bvslt (index!36703 lt!360729) (size!21413 lt!360647)))) (or ((_ is Undefined!8583) lt!360729) (ite ((_ is Found!8583) lt!360729) (= (select (arr!20992 lt!360647) (index!36701 lt!360729)) lt!360645) (ite ((_ is MissingZero!8583) lt!360729) (= (select (arr!20992 lt!360647) (index!36700 lt!360729)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8583) lt!360729) (= (select (arr!20992 lt!360647) (index!36703 lt!360729)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103593 (= lt!360729 e!446168)))

(declare-fun c!88219 () Bool)

(assert (=> d!103593 (= c!88219 (and ((_ is Intermediate!8583) lt!360730) (undefined!9395 lt!360730)))))

(assert (=> d!103593 (= lt!360730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!360645 mask!3266) lt!360645 lt!360647 mask!3266))))

(assert (=> d!103593 (validMask!0 mask!3266)))

(assert (=> d!103593 (= (seekEntryOrOpen!0 lt!360645 lt!360647 mask!3266) lt!360729)))

(declare-fun b!805658 () Bool)

(assert (=> b!805658 (= e!446168 Undefined!8583)))

(declare-fun b!805659 () Bool)

(assert (=> b!805659 (= e!446166 (MissingZero!8583 (index!36702 lt!360730)))))

(assert (= (and d!103593 c!88219) b!805658))

(assert (= (and d!103593 (not c!88219)) b!805657))

(assert (= (and b!805657 c!88218) b!805654))

(assert (= (and b!805657 (not c!88218)) b!805656))

(assert (= (and b!805656 c!88217) b!805659))

(assert (= (and b!805656 (not c!88217)) b!805655))

(declare-fun m!747589 () Bool)

(assert (=> b!805655 m!747589))

(declare-fun m!747591 () Bool)

(assert (=> b!805657 m!747591))

(declare-fun m!747593 () Bool)

(assert (=> d!103593 m!747593))

(declare-fun m!747595 () Bool)

(assert (=> d!103593 m!747595))

(assert (=> d!103593 m!747595))

(declare-fun m!747597 () Bool)

(assert (=> d!103593 m!747597))

(assert (=> d!103593 m!747423))

(declare-fun m!747599 () Bool)

(assert (=> d!103593 m!747599))

(declare-fun m!747601 () Bool)

(assert (=> d!103593 m!747601))

(assert (=> b!805453 d!103593))

(declare-fun d!103595 () Bool)

(assert (=> d!103595 (= (validKeyInArray!0 (select (arr!20992 a!3170) j!153)) (and (not (= (select (arr!20992 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20992 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!805458 d!103595))

(declare-fun b!805660 () Bool)

(declare-fun e!446170 () SeekEntryResult!8583)

(declare-fun lt!360733 () SeekEntryResult!8583)

(assert (=> b!805660 (= e!446170 (Found!8583 (index!36702 lt!360733)))))

(declare-fun e!446169 () SeekEntryResult!8583)

(declare-fun b!805661 () Bool)

(assert (=> b!805661 (= e!446169 (seekKeyOrZeroReturnVacant!0 (x!67517 lt!360733) (index!36702 lt!360733) (index!36702 lt!360733) k0!2044 a!3170 mask!3266))))

(declare-fun b!805662 () Bool)

(declare-fun c!88220 () Bool)

(declare-fun lt!360731 () (_ BitVec 64))

(assert (=> b!805662 (= c!88220 (= lt!360731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805662 (= e!446170 e!446169)))

(declare-fun b!805663 () Bool)

(declare-fun e!446171 () SeekEntryResult!8583)

(assert (=> b!805663 (= e!446171 e!446170)))

(assert (=> b!805663 (= lt!360731 (select (arr!20992 a!3170) (index!36702 lt!360733)))))

(declare-fun c!88221 () Bool)

(assert (=> b!805663 (= c!88221 (= lt!360731 k0!2044))))

(declare-fun d!103597 () Bool)

(declare-fun lt!360732 () SeekEntryResult!8583)

(assert (=> d!103597 (and (or ((_ is Undefined!8583) lt!360732) (not ((_ is Found!8583) lt!360732)) (and (bvsge (index!36701 lt!360732) #b00000000000000000000000000000000) (bvslt (index!36701 lt!360732) (size!21413 a!3170)))) (or ((_ is Undefined!8583) lt!360732) ((_ is Found!8583) lt!360732) (not ((_ is MissingZero!8583) lt!360732)) (and (bvsge (index!36700 lt!360732) #b00000000000000000000000000000000) (bvslt (index!36700 lt!360732) (size!21413 a!3170)))) (or ((_ is Undefined!8583) lt!360732) ((_ is Found!8583) lt!360732) ((_ is MissingZero!8583) lt!360732) (not ((_ is MissingVacant!8583) lt!360732)) (and (bvsge (index!36703 lt!360732) #b00000000000000000000000000000000) (bvslt (index!36703 lt!360732) (size!21413 a!3170)))) (or ((_ is Undefined!8583) lt!360732) (ite ((_ is Found!8583) lt!360732) (= (select (arr!20992 a!3170) (index!36701 lt!360732)) k0!2044) (ite ((_ is MissingZero!8583) lt!360732) (= (select (arr!20992 a!3170) (index!36700 lt!360732)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8583) lt!360732) (= (select (arr!20992 a!3170) (index!36703 lt!360732)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103597 (= lt!360732 e!446171)))

(declare-fun c!88222 () Bool)

(assert (=> d!103597 (= c!88222 (and ((_ is Intermediate!8583) lt!360733) (undefined!9395 lt!360733)))))

(assert (=> d!103597 (= lt!360733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103597 (validMask!0 mask!3266)))

(assert (=> d!103597 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!360732)))

(declare-fun b!805664 () Bool)

(assert (=> b!805664 (= e!446171 Undefined!8583)))

(declare-fun b!805665 () Bool)

(assert (=> b!805665 (= e!446169 (MissingZero!8583 (index!36702 lt!360733)))))

(assert (= (and d!103597 c!88222) b!805664))

(assert (= (and d!103597 (not c!88222)) b!805663))

(assert (= (and b!805663 c!88221) b!805660))

(assert (= (and b!805663 (not c!88221)) b!805662))

(assert (= (and b!805662 c!88220) b!805665))

(assert (= (and b!805662 (not c!88220)) b!805661))

(declare-fun m!747603 () Bool)

(assert (=> b!805661 m!747603))

(declare-fun m!747605 () Bool)

(assert (=> b!805663 m!747605))

(declare-fun m!747607 () Bool)

(assert (=> d!103597 m!747607))

(declare-fun m!747609 () Bool)

(assert (=> d!103597 m!747609))

(assert (=> d!103597 m!747609))

(declare-fun m!747611 () Bool)

(assert (=> d!103597 m!747611))

(assert (=> d!103597 m!747423))

(declare-fun m!747613 () Bool)

(assert (=> d!103597 m!747613))

(declare-fun m!747615 () Bool)

(assert (=> d!103597 m!747615))

(assert (=> b!805452 d!103597))

(check-sat (not d!103593) (not b!805529) (not b!805661) (not b!805583) (not b!805499) (not b!805501) (not d!103589) (not d!103571) (not b!805509) (not bm!35349) (not d!103597) (not d!103561) (not b!805655) (not bm!35346) (not b!805502) (not b!805643) (not b!805644) (not b!805649))
(check-sat)
