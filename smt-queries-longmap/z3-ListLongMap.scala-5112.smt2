; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69312 () Bool)

(assert start!69312)

(declare-fun b!808438 () Bool)

(declare-fun res!552506 () Bool)

(declare-fun e!447510 () Bool)

(assert (=> b!808438 (=> (not res!552506) (not e!447510))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43978 0))(
  ( (array!43979 (arr!21065 (Array (_ BitVec 32) (_ BitVec 64))) (size!21486 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43978)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808438 (= res!552506 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21486 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21065 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21486 a!3170)) (= (select (arr!21065 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808439 () Bool)

(declare-fun res!552505 () Bool)

(declare-fun e!447507 () Bool)

(assert (=> b!808439 (=> (not res!552505) (not e!447507))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!808439 (= res!552505 (and (= (size!21486 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21486 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21486 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808440 () Bool)

(declare-fun res!552507 () Bool)

(assert (=> b!808440 (=> (not res!552507) (not e!447507))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808440 (= res!552507 (validKeyInArray!0 k0!2044))))

(declare-fun b!808441 () Bool)

(declare-fun res!552504 () Bool)

(assert (=> b!808441 (=> (not res!552504) (not e!447507))))

(declare-fun arrayContainsKey!0 (array!43978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808441 (= res!552504 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808442 () Bool)

(assert (=> b!808442 (= e!447507 e!447510)))

(declare-fun res!552513 () Bool)

(assert (=> b!808442 (=> (not res!552513) (not e!447510))))

(declare-datatypes ((SeekEntryResult!8653 0))(
  ( (MissingZero!8653 (index!36980 (_ BitVec 32))) (Found!8653 (index!36981 (_ BitVec 32))) (Intermediate!8653 (undefined!9465 Bool) (index!36982 (_ BitVec 32)) (x!67794 (_ BitVec 32))) (Undefined!8653) (MissingVacant!8653 (index!36983 (_ BitVec 32))) )
))
(declare-fun lt!362134 () SeekEntryResult!8653)

(assert (=> b!808442 (= res!552513 (or (= lt!362134 (MissingZero!8653 i!1163)) (= lt!362134 (MissingVacant!8653 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43978 (_ BitVec 32)) SeekEntryResult!8653)

(assert (=> b!808442 (= lt!362134 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun e!447511 () Bool)

(declare-fun lt!362138 () (_ BitVec 32))

(declare-fun b!808443 () Bool)

(assert (=> b!808443 (= e!447511 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (or (bvslt lt!362138 #b00000000000000000000000000000000) (bvsge lt!362138 (size!21486 a!3170)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808443 (= lt!362138 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808444 () Bool)

(declare-fun res!552511 () Bool)

(assert (=> b!808444 (=> (not res!552511) (not e!447510))))

(declare-datatypes ((List!15067 0))(
  ( (Nil!15064) (Cons!15063 (h!16192 (_ BitVec 64)) (t!21373 List!15067)) )
))
(declare-fun arrayNoDuplicates!0 (array!43978 (_ BitVec 32) List!15067) Bool)

(assert (=> b!808444 (= res!552511 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15064))))

(declare-fun b!808445 () Bool)

(declare-fun res!552512 () Bool)

(assert (=> b!808445 (=> (not res!552512) (not e!447510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43978 (_ BitVec 32)) Bool)

(assert (=> b!808445 (= res!552512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808446 () Bool)

(declare-fun res!552503 () Bool)

(assert (=> b!808446 (=> (not res!552503) (not e!447507))))

(assert (=> b!808446 (= res!552503 (validKeyInArray!0 (select (arr!21065 a!3170) j!153)))))

(declare-fun res!552510 () Bool)

(assert (=> start!69312 (=> (not res!552510) (not e!447507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69312 (= res!552510 (validMask!0 mask!3266))))

(assert (=> start!69312 e!447507))

(assert (=> start!69312 true))

(declare-fun array_inv!16948 (array!43978) Bool)

(assert (=> start!69312 (array_inv!16948 a!3170)))

(declare-fun b!808447 () Bool)

(declare-fun e!447508 () Bool)

(assert (=> b!808447 (= e!447508 e!447511)))

(declare-fun res!552508 () Bool)

(assert (=> b!808447 (=> (not res!552508) (not e!447511))))

(declare-fun lt!362136 () SeekEntryResult!8653)

(declare-fun lt!362133 () SeekEntryResult!8653)

(assert (=> b!808447 (= res!552508 (and (= lt!362136 lt!362133) (= lt!362133 (Found!8653 j!153)) (not (= (select (arr!21065 a!3170) index!1236) (select (arr!21065 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43978 (_ BitVec 32)) SeekEntryResult!8653)

(assert (=> b!808447 (= lt!362133 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21065 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808447 (= lt!362136 (seekEntryOrOpen!0 (select (arr!21065 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808448 () Bool)

(assert (=> b!808448 (= e!447510 e!447508)))

(declare-fun res!552509 () Bool)

(assert (=> b!808448 (=> (not res!552509) (not e!447508))))

(declare-fun lt!362137 () (_ BitVec 64))

(declare-fun lt!362135 () array!43978)

(assert (=> b!808448 (= res!552509 (= (seekEntryOrOpen!0 lt!362137 lt!362135 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362137 lt!362135 mask!3266)))))

(assert (=> b!808448 (= lt!362137 (select (store (arr!21065 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808448 (= lt!362135 (array!43979 (store (arr!21065 a!3170) i!1163 k0!2044) (size!21486 a!3170)))))

(assert (= (and start!69312 res!552510) b!808439))

(assert (= (and b!808439 res!552505) b!808446))

(assert (= (and b!808446 res!552503) b!808440))

(assert (= (and b!808440 res!552507) b!808441))

(assert (= (and b!808441 res!552504) b!808442))

(assert (= (and b!808442 res!552513) b!808445))

(assert (= (and b!808445 res!552512) b!808444))

(assert (= (and b!808444 res!552511) b!808438))

(assert (= (and b!808438 res!552506) b!808448))

(assert (= (and b!808448 res!552509) b!808447))

(assert (= (and b!808447 res!552508) b!808443))

(declare-fun m!750097 () Bool)

(assert (=> b!808443 m!750097))

(declare-fun m!750099 () Bool)

(assert (=> start!69312 m!750099))

(declare-fun m!750101 () Bool)

(assert (=> start!69312 m!750101))

(declare-fun m!750103 () Bool)

(assert (=> b!808446 m!750103))

(assert (=> b!808446 m!750103))

(declare-fun m!750105 () Bool)

(assert (=> b!808446 m!750105))

(declare-fun m!750107 () Bool)

(assert (=> b!808444 m!750107))

(declare-fun m!750109 () Bool)

(assert (=> b!808441 m!750109))

(declare-fun m!750111 () Bool)

(assert (=> b!808442 m!750111))

(declare-fun m!750113 () Bool)

(assert (=> b!808438 m!750113))

(declare-fun m!750115 () Bool)

(assert (=> b!808438 m!750115))

(declare-fun m!750117 () Bool)

(assert (=> b!808448 m!750117))

(declare-fun m!750119 () Bool)

(assert (=> b!808448 m!750119))

(declare-fun m!750121 () Bool)

(assert (=> b!808448 m!750121))

(declare-fun m!750123 () Bool)

(assert (=> b!808448 m!750123))

(declare-fun m!750125 () Bool)

(assert (=> b!808440 m!750125))

(declare-fun m!750127 () Bool)

(assert (=> b!808447 m!750127))

(assert (=> b!808447 m!750103))

(assert (=> b!808447 m!750103))

(declare-fun m!750129 () Bool)

(assert (=> b!808447 m!750129))

(assert (=> b!808447 m!750103))

(declare-fun m!750131 () Bool)

(assert (=> b!808447 m!750131))

(declare-fun m!750133 () Bool)

(assert (=> b!808445 m!750133))

(check-sat (not b!808442) (not b!808444) (not b!808441) (not b!808448) (not b!808443) (not b!808446) (not b!808445) (not b!808440) (not b!808447) (not start!69312))
(check-sat)
(get-model)

(declare-fun bm!35374 () Bool)

(declare-fun call!35377 () Bool)

(declare-fun c!88380 () Bool)

(assert (=> bm!35374 (= call!35377 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88380 (Cons!15063 (select (arr!21065 a!3170) #b00000000000000000000000000000000) Nil!15064) Nil!15064)))))

(declare-fun b!808525 () Bool)

(declare-fun e!447550 () Bool)

(assert (=> b!808525 (= e!447550 call!35377)))

(declare-fun b!808526 () Bool)

(declare-fun e!447551 () Bool)

(declare-fun e!447553 () Bool)

(assert (=> b!808526 (= e!447551 e!447553)))

(declare-fun res!552587 () Bool)

(assert (=> b!808526 (=> (not res!552587) (not e!447553))))

(declare-fun e!447552 () Bool)

(assert (=> b!808526 (= res!552587 (not e!447552))))

(declare-fun res!552588 () Bool)

(assert (=> b!808526 (=> (not res!552588) (not e!447552))))

(assert (=> b!808526 (= res!552588 (validKeyInArray!0 (select (arr!21065 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103629 () Bool)

(declare-fun res!552586 () Bool)

(assert (=> d!103629 (=> res!552586 e!447551)))

(assert (=> d!103629 (= res!552586 (bvsge #b00000000000000000000000000000000 (size!21486 a!3170)))))

(assert (=> d!103629 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15064) e!447551)))

(declare-fun b!808527 () Bool)

(declare-fun contains!4105 (List!15067 (_ BitVec 64)) Bool)

(assert (=> b!808527 (= e!447552 (contains!4105 Nil!15064 (select (arr!21065 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808528 () Bool)

(assert (=> b!808528 (= e!447550 call!35377)))

(declare-fun b!808529 () Bool)

(assert (=> b!808529 (= e!447553 e!447550)))

(assert (=> b!808529 (= c!88380 (validKeyInArray!0 (select (arr!21065 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103629 (not res!552586)) b!808526))

(assert (= (and b!808526 res!552588) b!808527))

(assert (= (and b!808526 res!552587) b!808529))

(assert (= (and b!808529 c!88380) b!808528))

(assert (= (and b!808529 (not c!88380)) b!808525))

(assert (= (or b!808528 b!808525) bm!35374))

(declare-fun m!750211 () Bool)

(assert (=> bm!35374 m!750211))

(declare-fun m!750213 () Bool)

(assert (=> bm!35374 m!750213))

(assert (=> b!808526 m!750211))

(assert (=> b!808526 m!750211))

(declare-fun m!750215 () Bool)

(assert (=> b!808526 m!750215))

(assert (=> b!808527 m!750211))

(assert (=> b!808527 m!750211))

(declare-fun m!750217 () Bool)

(assert (=> b!808527 m!750217))

(assert (=> b!808529 m!750211))

(assert (=> b!808529 m!750211))

(assert (=> b!808529 m!750215))

(assert (=> b!808444 d!103629))

(declare-fun d!103631 () Bool)

(declare-fun lt!362177 () (_ BitVec 32))

(assert (=> d!103631 (and (bvsge lt!362177 #b00000000000000000000000000000000) (bvslt lt!362177 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103631 (= lt!362177 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103631 (validMask!0 mask!3266)))

(assert (=> d!103631 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!362177)))

(declare-fun bs!22371 () Bool)

(assert (= bs!22371 d!103631))

(declare-fun m!750219 () Bool)

(assert (=> bs!22371 m!750219))

(assert (=> bs!22371 m!750099))

(assert (=> b!808443 d!103631))

(declare-fun b!808542 () Bool)

(declare-fun e!447560 () SeekEntryResult!8653)

(assert (=> b!808542 (= e!447560 Undefined!8653)))

(declare-fun b!808543 () Bool)

(declare-fun e!447562 () SeekEntryResult!8653)

(declare-fun lt!362185 () SeekEntryResult!8653)

(assert (=> b!808543 (= e!447562 (Found!8653 (index!36982 lt!362185)))))

(declare-fun b!808544 () Bool)

(declare-fun c!88389 () Bool)

(declare-fun lt!362186 () (_ BitVec 64))

(assert (=> b!808544 (= c!88389 (= lt!362186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447561 () SeekEntryResult!8653)

(assert (=> b!808544 (= e!447562 e!447561)))

(declare-fun b!808546 () Bool)

(assert (=> b!808546 (= e!447561 (MissingZero!8653 (index!36982 lt!362185)))))

(declare-fun b!808547 () Bool)

(assert (=> b!808547 (= e!447560 e!447562)))

(assert (=> b!808547 (= lt!362186 (select (arr!21065 lt!362135) (index!36982 lt!362185)))))

(declare-fun c!88388 () Bool)

(assert (=> b!808547 (= c!88388 (= lt!362186 lt!362137))))

(declare-fun d!103633 () Bool)

(declare-fun lt!362184 () SeekEntryResult!8653)

(get-info :version)

(assert (=> d!103633 (and (or ((_ is Undefined!8653) lt!362184) (not ((_ is Found!8653) lt!362184)) (and (bvsge (index!36981 lt!362184) #b00000000000000000000000000000000) (bvslt (index!36981 lt!362184) (size!21486 lt!362135)))) (or ((_ is Undefined!8653) lt!362184) ((_ is Found!8653) lt!362184) (not ((_ is MissingZero!8653) lt!362184)) (and (bvsge (index!36980 lt!362184) #b00000000000000000000000000000000) (bvslt (index!36980 lt!362184) (size!21486 lt!362135)))) (or ((_ is Undefined!8653) lt!362184) ((_ is Found!8653) lt!362184) ((_ is MissingZero!8653) lt!362184) (not ((_ is MissingVacant!8653) lt!362184)) (and (bvsge (index!36983 lt!362184) #b00000000000000000000000000000000) (bvslt (index!36983 lt!362184) (size!21486 lt!362135)))) (or ((_ is Undefined!8653) lt!362184) (ite ((_ is Found!8653) lt!362184) (= (select (arr!21065 lt!362135) (index!36981 lt!362184)) lt!362137) (ite ((_ is MissingZero!8653) lt!362184) (= (select (arr!21065 lt!362135) (index!36980 lt!362184)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8653) lt!362184) (= (select (arr!21065 lt!362135) (index!36983 lt!362184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103633 (= lt!362184 e!447560)))

(declare-fun c!88387 () Bool)

(assert (=> d!103633 (= c!88387 (and ((_ is Intermediate!8653) lt!362185) (undefined!9465 lt!362185)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43978 (_ BitVec 32)) SeekEntryResult!8653)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103633 (= lt!362185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362137 mask!3266) lt!362137 lt!362135 mask!3266))))

(assert (=> d!103633 (validMask!0 mask!3266)))

(assert (=> d!103633 (= (seekEntryOrOpen!0 lt!362137 lt!362135 mask!3266) lt!362184)))

(declare-fun b!808545 () Bool)

(assert (=> b!808545 (= e!447561 (seekKeyOrZeroReturnVacant!0 (x!67794 lt!362185) (index!36982 lt!362185) (index!36982 lt!362185) lt!362137 lt!362135 mask!3266))))

(assert (= (and d!103633 c!88387) b!808542))

(assert (= (and d!103633 (not c!88387)) b!808547))

(assert (= (and b!808547 c!88388) b!808543))

(assert (= (and b!808547 (not c!88388)) b!808544))

(assert (= (and b!808544 c!88389) b!808546))

(assert (= (and b!808544 (not c!88389)) b!808545))

(declare-fun m!750221 () Bool)

(assert (=> b!808547 m!750221))

(declare-fun m!750223 () Bool)

(assert (=> d!103633 m!750223))

(declare-fun m!750225 () Bool)

(assert (=> d!103633 m!750225))

(declare-fun m!750227 () Bool)

(assert (=> d!103633 m!750227))

(assert (=> d!103633 m!750099))

(declare-fun m!750229 () Bool)

(assert (=> d!103633 m!750229))

(assert (=> d!103633 m!750223))

(declare-fun m!750231 () Bool)

(assert (=> d!103633 m!750231))

(declare-fun m!750233 () Bool)

(assert (=> b!808545 m!750233))

(assert (=> b!808448 d!103633))

(declare-fun b!808560 () Bool)

(declare-fun e!447569 () SeekEntryResult!8653)

(assert (=> b!808560 (= e!447569 (MissingVacant!8653 vacantAfter!23))))

(declare-fun b!808561 () Bool)

(assert (=> b!808561 (= e!447569 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!362137 lt!362135 mask!3266))))

(declare-fun d!103635 () Bool)

(declare-fun lt!362191 () SeekEntryResult!8653)

(assert (=> d!103635 (and (or ((_ is Undefined!8653) lt!362191) (not ((_ is Found!8653) lt!362191)) (and (bvsge (index!36981 lt!362191) #b00000000000000000000000000000000) (bvslt (index!36981 lt!362191) (size!21486 lt!362135)))) (or ((_ is Undefined!8653) lt!362191) ((_ is Found!8653) lt!362191) (not ((_ is MissingVacant!8653) lt!362191)) (not (= (index!36983 lt!362191) vacantAfter!23)) (and (bvsge (index!36983 lt!362191) #b00000000000000000000000000000000) (bvslt (index!36983 lt!362191) (size!21486 lt!362135)))) (or ((_ is Undefined!8653) lt!362191) (ite ((_ is Found!8653) lt!362191) (= (select (arr!21065 lt!362135) (index!36981 lt!362191)) lt!362137) (and ((_ is MissingVacant!8653) lt!362191) (= (index!36983 lt!362191) vacantAfter!23) (= (select (arr!21065 lt!362135) (index!36983 lt!362191)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!447570 () SeekEntryResult!8653)

(assert (=> d!103635 (= lt!362191 e!447570)))

(declare-fun c!88397 () Bool)

(assert (=> d!103635 (= c!88397 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362192 () (_ BitVec 64))

(assert (=> d!103635 (= lt!362192 (select (arr!21065 lt!362135) index!1236))))

(assert (=> d!103635 (validMask!0 mask!3266)))

(assert (=> d!103635 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362137 lt!362135 mask!3266) lt!362191)))

(declare-fun b!808562 () Bool)

(declare-fun c!88396 () Bool)

(assert (=> b!808562 (= c!88396 (= lt!362192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447571 () SeekEntryResult!8653)

(assert (=> b!808562 (= e!447571 e!447569)))

(declare-fun b!808563 () Bool)

(assert (=> b!808563 (= e!447571 (Found!8653 index!1236))))

(declare-fun b!808564 () Bool)

(assert (=> b!808564 (= e!447570 Undefined!8653)))

(declare-fun b!808565 () Bool)

(assert (=> b!808565 (= e!447570 e!447571)))

(declare-fun c!88398 () Bool)

(assert (=> b!808565 (= c!88398 (= lt!362192 lt!362137))))

(assert (= (and d!103635 c!88397) b!808564))

(assert (= (and d!103635 (not c!88397)) b!808565))

(assert (= (and b!808565 c!88398) b!808563))

(assert (= (and b!808565 (not c!88398)) b!808562))

(assert (= (and b!808562 c!88396) b!808560))

(assert (= (and b!808562 (not c!88396)) b!808561))

(assert (=> b!808561 m!750097))

(assert (=> b!808561 m!750097))

(declare-fun m!750235 () Bool)

(assert (=> b!808561 m!750235))

(declare-fun m!750237 () Bool)

(assert (=> d!103635 m!750237))

(declare-fun m!750239 () Bool)

(assert (=> d!103635 m!750239))

(declare-fun m!750241 () Bool)

(assert (=> d!103635 m!750241))

(assert (=> d!103635 m!750099))

(assert (=> b!808448 d!103635))

(declare-fun b!808566 () Bool)

(declare-fun e!447572 () SeekEntryResult!8653)

(assert (=> b!808566 (= e!447572 Undefined!8653)))

(declare-fun b!808567 () Bool)

(declare-fun e!447574 () SeekEntryResult!8653)

(declare-fun lt!362194 () SeekEntryResult!8653)

(assert (=> b!808567 (= e!447574 (Found!8653 (index!36982 lt!362194)))))

(declare-fun b!808568 () Bool)

(declare-fun c!88401 () Bool)

(declare-fun lt!362195 () (_ BitVec 64))

(assert (=> b!808568 (= c!88401 (= lt!362195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447573 () SeekEntryResult!8653)

(assert (=> b!808568 (= e!447574 e!447573)))

(declare-fun b!808570 () Bool)

(assert (=> b!808570 (= e!447573 (MissingZero!8653 (index!36982 lt!362194)))))

(declare-fun b!808571 () Bool)

(assert (=> b!808571 (= e!447572 e!447574)))

(assert (=> b!808571 (= lt!362195 (select (arr!21065 a!3170) (index!36982 lt!362194)))))

(declare-fun c!88400 () Bool)

(assert (=> b!808571 (= c!88400 (= lt!362195 k0!2044))))

(declare-fun d!103643 () Bool)

(declare-fun lt!362193 () SeekEntryResult!8653)

(assert (=> d!103643 (and (or ((_ is Undefined!8653) lt!362193) (not ((_ is Found!8653) lt!362193)) (and (bvsge (index!36981 lt!362193) #b00000000000000000000000000000000) (bvslt (index!36981 lt!362193) (size!21486 a!3170)))) (or ((_ is Undefined!8653) lt!362193) ((_ is Found!8653) lt!362193) (not ((_ is MissingZero!8653) lt!362193)) (and (bvsge (index!36980 lt!362193) #b00000000000000000000000000000000) (bvslt (index!36980 lt!362193) (size!21486 a!3170)))) (or ((_ is Undefined!8653) lt!362193) ((_ is Found!8653) lt!362193) ((_ is MissingZero!8653) lt!362193) (not ((_ is MissingVacant!8653) lt!362193)) (and (bvsge (index!36983 lt!362193) #b00000000000000000000000000000000) (bvslt (index!36983 lt!362193) (size!21486 a!3170)))) (or ((_ is Undefined!8653) lt!362193) (ite ((_ is Found!8653) lt!362193) (= (select (arr!21065 a!3170) (index!36981 lt!362193)) k0!2044) (ite ((_ is MissingZero!8653) lt!362193) (= (select (arr!21065 a!3170) (index!36980 lt!362193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8653) lt!362193) (= (select (arr!21065 a!3170) (index!36983 lt!362193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103643 (= lt!362193 e!447572)))

(declare-fun c!88399 () Bool)

(assert (=> d!103643 (= c!88399 (and ((_ is Intermediate!8653) lt!362194) (undefined!9465 lt!362194)))))

(assert (=> d!103643 (= lt!362194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103643 (validMask!0 mask!3266)))

(assert (=> d!103643 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!362193)))

(declare-fun b!808569 () Bool)

(assert (=> b!808569 (= e!447573 (seekKeyOrZeroReturnVacant!0 (x!67794 lt!362194) (index!36982 lt!362194) (index!36982 lt!362194) k0!2044 a!3170 mask!3266))))

(assert (= (and d!103643 c!88399) b!808566))

(assert (= (and d!103643 (not c!88399)) b!808571))

(assert (= (and b!808571 c!88400) b!808567))

(assert (= (and b!808571 (not c!88400)) b!808568))

(assert (= (and b!808568 c!88401) b!808570))

(assert (= (and b!808568 (not c!88401)) b!808569))

(declare-fun m!750243 () Bool)

(assert (=> b!808571 m!750243))

(declare-fun m!750245 () Bool)

(assert (=> d!103643 m!750245))

(declare-fun m!750247 () Bool)

(assert (=> d!103643 m!750247))

(declare-fun m!750249 () Bool)

(assert (=> d!103643 m!750249))

(assert (=> d!103643 m!750099))

(declare-fun m!750251 () Bool)

(assert (=> d!103643 m!750251))

(assert (=> d!103643 m!750245))

(declare-fun m!750253 () Bool)

(assert (=> d!103643 m!750253))

(declare-fun m!750255 () Bool)

(assert (=> b!808569 m!750255))

(assert (=> b!808442 d!103643))

(declare-fun b!808572 () Bool)

(declare-fun e!447575 () SeekEntryResult!8653)

(assert (=> b!808572 (= e!447575 (MissingVacant!8653 vacantBefore!23))))

(declare-fun b!808573 () Bool)

(assert (=> b!808573 (= e!447575 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21065 a!3170) j!153) a!3170 mask!3266))))

(declare-fun d!103645 () Bool)

(declare-fun lt!362196 () SeekEntryResult!8653)

(assert (=> d!103645 (and (or ((_ is Undefined!8653) lt!362196) (not ((_ is Found!8653) lt!362196)) (and (bvsge (index!36981 lt!362196) #b00000000000000000000000000000000) (bvslt (index!36981 lt!362196) (size!21486 a!3170)))) (or ((_ is Undefined!8653) lt!362196) ((_ is Found!8653) lt!362196) (not ((_ is MissingVacant!8653) lt!362196)) (not (= (index!36983 lt!362196) vacantBefore!23)) (and (bvsge (index!36983 lt!362196) #b00000000000000000000000000000000) (bvslt (index!36983 lt!362196) (size!21486 a!3170)))) (or ((_ is Undefined!8653) lt!362196) (ite ((_ is Found!8653) lt!362196) (= (select (arr!21065 a!3170) (index!36981 lt!362196)) (select (arr!21065 a!3170) j!153)) (and ((_ is MissingVacant!8653) lt!362196) (= (index!36983 lt!362196) vacantBefore!23) (= (select (arr!21065 a!3170) (index!36983 lt!362196)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!447576 () SeekEntryResult!8653)

(assert (=> d!103645 (= lt!362196 e!447576)))

(declare-fun c!88403 () Bool)

(assert (=> d!103645 (= c!88403 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362197 () (_ BitVec 64))

(assert (=> d!103645 (= lt!362197 (select (arr!21065 a!3170) index!1236))))

(assert (=> d!103645 (validMask!0 mask!3266)))

(assert (=> d!103645 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21065 a!3170) j!153) a!3170 mask!3266) lt!362196)))

(declare-fun b!808574 () Bool)

(declare-fun c!88402 () Bool)

(assert (=> b!808574 (= c!88402 (= lt!362197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447577 () SeekEntryResult!8653)

(assert (=> b!808574 (= e!447577 e!447575)))

(declare-fun b!808575 () Bool)

(assert (=> b!808575 (= e!447577 (Found!8653 index!1236))))

(declare-fun b!808576 () Bool)

(assert (=> b!808576 (= e!447576 Undefined!8653)))

(declare-fun b!808577 () Bool)

(assert (=> b!808577 (= e!447576 e!447577)))

(declare-fun c!88404 () Bool)

(assert (=> b!808577 (= c!88404 (= lt!362197 (select (arr!21065 a!3170) j!153)))))

(assert (= (and d!103645 c!88403) b!808576))

(assert (= (and d!103645 (not c!88403)) b!808577))

(assert (= (and b!808577 c!88404) b!808575))

(assert (= (and b!808577 (not c!88404)) b!808574))

(assert (= (and b!808574 c!88402) b!808572))

(assert (= (and b!808574 (not c!88402)) b!808573))

(assert (=> b!808573 m!750097))

(assert (=> b!808573 m!750097))

(assert (=> b!808573 m!750103))

(declare-fun m!750257 () Bool)

(assert (=> b!808573 m!750257))

(declare-fun m!750259 () Bool)

(assert (=> d!103645 m!750259))

(declare-fun m!750261 () Bool)

(assert (=> d!103645 m!750261))

(assert (=> d!103645 m!750127))

(assert (=> d!103645 m!750099))

(assert (=> b!808447 d!103645))

(declare-fun b!808578 () Bool)

(declare-fun e!447578 () SeekEntryResult!8653)

(assert (=> b!808578 (= e!447578 Undefined!8653)))

(declare-fun b!808579 () Bool)

(declare-fun e!447580 () SeekEntryResult!8653)

(declare-fun lt!362199 () SeekEntryResult!8653)

(assert (=> b!808579 (= e!447580 (Found!8653 (index!36982 lt!362199)))))

(declare-fun b!808580 () Bool)

(declare-fun c!88407 () Bool)

(declare-fun lt!362200 () (_ BitVec 64))

(assert (=> b!808580 (= c!88407 (= lt!362200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447579 () SeekEntryResult!8653)

(assert (=> b!808580 (= e!447580 e!447579)))

(declare-fun b!808582 () Bool)

(assert (=> b!808582 (= e!447579 (MissingZero!8653 (index!36982 lt!362199)))))

(declare-fun b!808583 () Bool)

(assert (=> b!808583 (= e!447578 e!447580)))

(assert (=> b!808583 (= lt!362200 (select (arr!21065 a!3170) (index!36982 lt!362199)))))

(declare-fun c!88406 () Bool)

(assert (=> b!808583 (= c!88406 (= lt!362200 (select (arr!21065 a!3170) j!153)))))

(declare-fun d!103647 () Bool)

(declare-fun lt!362198 () SeekEntryResult!8653)

(assert (=> d!103647 (and (or ((_ is Undefined!8653) lt!362198) (not ((_ is Found!8653) lt!362198)) (and (bvsge (index!36981 lt!362198) #b00000000000000000000000000000000) (bvslt (index!36981 lt!362198) (size!21486 a!3170)))) (or ((_ is Undefined!8653) lt!362198) ((_ is Found!8653) lt!362198) (not ((_ is MissingZero!8653) lt!362198)) (and (bvsge (index!36980 lt!362198) #b00000000000000000000000000000000) (bvslt (index!36980 lt!362198) (size!21486 a!3170)))) (or ((_ is Undefined!8653) lt!362198) ((_ is Found!8653) lt!362198) ((_ is MissingZero!8653) lt!362198) (not ((_ is MissingVacant!8653) lt!362198)) (and (bvsge (index!36983 lt!362198) #b00000000000000000000000000000000) (bvslt (index!36983 lt!362198) (size!21486 a!3170)))) (or ((_ is Undefined!8653) lt!362198) (ite ((_ is Found!8653) lt!362198) (= (select (arr!21065 a!3170) (index!36981 lt!362198)) (select (arr!21065 a!3170) j!153)) (ite ((_ is MissingZero!8653) lt!362198) (= (select (arr!21065 a!3170) (index!36980 lt!362198)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8653) lt!362198) (= (select (arr!21065 a!3170) (index!36983 lt!362198)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103647 (= lt!362198 e!447578)))

(declare-fun c!88405 () Bool)

(assert (=> d!103647 (= c!88405 (and ((_ is Intermediate!8653) lt!362199) (undefined!9465 lt!362199)))))

(assert (=> d!103647 (= lt!362199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21065 a!3170) j!153) mask!3266) (select (arr!21065 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103647 (validMask!0 mask!3266)))

(assert (=> d!103647 (= (seekEntryOrOpen!0 (select (arr!21065 a!3170) j!153) a!3170 mask!3266) lt!362198)))

(declare-fun b!808581 () Bool)

(assert (=> b!808581 (= e!447579 (seekKeyOrZeroReturnVacant!0 (x!67794 lt!362199) (index!36982 lt!362199) (index!36982 lt!362199) (select (arr!21065 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and d!103647 c!88405) b!808578))

(assert (= (and d!103647 (not c!88405)) b!808583))

(assert (= (and b!808583 c!88406) b!808579))

(assert (= (and b!808583 (not c!88406)) b!808580))

(assert (= (and b!808580 c!88407) b!808582))

(assert (= (and b!808580 (not c!88407)) b!808581))

(declare-fun m!750263 () Bool)

(assert (=> b!808583 m!750263))

(declare-fun m!750265 () Bool)

(assert (=> d!103647 m!750265))

(assert (=> d!103647 m!750103))

(declare-fun m!750267 () Bool)

(assert (=> d!103647 m!750267))

(declare-fun m!750269 () Bool)

(assert (=> d!103647 m!750269))

(assert (=> d!103647 m!750099))

(declare-fun m!750271 () Bool)

(assert (=> d!103647 m!750271))

(assert (=> d!103647 m!750103))

(assert (=> d!103647 m!750265))

(declare-fun m!750273 () Bool)

(assert (=> d!103647 m!750273))

(assert (=> b!808581 m!750103))

(declare-fun m!750275 () Bool)

(assert (=> b!808581 m!750275))

(assert (=> b!808447 d!103647))

(declare-fun d!103649 () Bool)

(declare-fun res!552597 () Bool)

(declare-fun e!447589 () Bool)

(assert (=> d!103649 (=> res!552597 e!447589)))

(assert (=> d!103649 (= res!552597 (= (select (arr!21065 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103649 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!447589)))

(declare-fun b!808592 () Bool)

(declare-fun e!447590 () Bool)

(assert (=> b!808592 (= e!447589 e!447590)))

(declare-fun res!552598 () Bool)

(assert (=> b!808592 (=> (not res!552598) (not e!447590))))

(assert (=> b!808592 (= res!552598 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21486 a!3170)))))

(declare-fun b!808593 () Bool)

(assert (=> b!808593 (= e!447590 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103649 (not res!552597)) b!808592))

(assert (= (and b!808592 res!552598) b!808593))

(assert (=> d!103649 m!750211))

(declare-fun m!750277 () Bool)

(assert (=> b!808593 m!750277))

(assert (=> b!808441 d!103649))

(declare-fun d!103653 () Bool)

(assert (=> d!103653 (= (validKeyInArray!0 (select (arr!21065 a!3170) j!153)) (and (not (= (select (arr!21065 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21065 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808446 d!103653))

(declare-fun d!103657 () Bool)

(assert (=> d!103657 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808440 d!103657))

(declare-fun b!808631 () Bool)

(declare-fun e!447617 () Bool)

(declare-fun e!447618 () Bool)

(assert (=> b!808631 (= e!447617 e!447618)))

(declare-fun c!88419 () Bool)

(assert (=> b!808631 (= c!88419 (validKeyInArray!0 (select (arr!21065 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103659 () Bool)

(declare-fun res!552615 () Bool)

(assert (=> d!103659 (=> res!552615 e!447617)))

(assert (=> d!103659 (= res!552615 (bvsge #b00000000000000000000000000000000 (size!21486 a!3170)))))

(assert (=> d!103659 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!447617)))

(declare-fun b!808632 () Bool)

(declare-fun e!447619 () Bool)

(assert (=> b!808632 (= e!447618 e!447619)))

(declare-fun lt!362214 () (_ BitVec 64))

(assert (=> b!808632 (= lt!362214 (select (arr!21065 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27580 0))(
  ( (Unit!27581) )
))
(declare-fun lt!362215 () Unit!27580)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43978 (_ BitVec 64) (_ BitVec 32)) Unit!27580)

(assert (=> b!808632 (= lt!362215 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362214 #b00000000000000000000000000000000))))

(assert (=> b!808632 (arrayContainsKey!0 a!3170 lt!362214 #b00000000000000000000000000000000)))

(declare-fun lt!362213 () Unit!27580)

(assert (=> b!808632 (= lt!362213 lt!362215)))

(declare-fun res!552614 () Bool)

(assert (=> b!808632 (= res!552614 (= (seekEntryOrOpen!0 (select (arr!21065 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8653 #b00000000000000000000000000000000)))))

(assert (=> b!808632 (=> (not res!552614) (not e!447619))))

(declare-fun bm!35380 () Bool)

(declare-fun call!35383 () Bool)

(assert (=> bm!35380 (= call!35383 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!808633 () Bool)

(assert (=> b!808633 (= e!447619 call!35383)))

(declare-fun b!808634 () Bool)

(assert (=> b!808634 (= e!447618 call!35383)))

(assert (= (and d!103659 (not res!552615)) b!808631))

(assert (= (and b!808631 c!88419) b!808632))

(assert (= (and b!808631 (not c!88419)) b!808634))

(assert (= (and b!808632 res!552614) b!808633))

(assert (= (or b!808633 b!808634) bm!35380))

(assert (=> b!808631 m!750211))

(assert (=> b!808631 m!750211))

(assert (=> b!808631 m!750215))

(assert (=> b!808632 m!750211))

(declare-fun m!750289 () Bool)

(assert (=> b!808632 m!750289))

(declare-fun m!750291 () Bool)

(assert (=> b!808632 m!750291))

(assert (=> b!808632 m!750211))

(declare-fun m!750293 () Bool)

(assert (=> b!808632 m!750293))

(declare-fun m!750295 () Bool)

(assert (=> bm!35380 m!750295))

(assert (=> b!808445 d!103659))

(declare-fun d!103665 () Bool)

(assert (=> d!103665 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69312 d!103665))

(declare-fun d!103669 () Bool)

(assert (=> d!103669 (= (array_inv!16948 a!3170) (bvsge (size!21486 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69312 d!103669))

(check-sat (not bm!35380) (not b!808581) (not b!808593) (not d!103631) (not b!808573) (not d!103643) (not d!103645) (not b!808632) (not b!808527) (not b!808631) (not b!808529) (not b!808569) (not bm!35374) (not b!808561) (not d!103633) (not b!808526) (not b!808545) (not d!103647) (not d!103635))
(check-sat)
