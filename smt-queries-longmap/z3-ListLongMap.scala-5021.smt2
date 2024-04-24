; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68760 () Bool)

(assert start!68760)

(declare-fun b!799401 () Bool)

(declare-fun res!543551 () Bool)

(declare-fun e!443440 () Bool)

(assert (=> b!799401 (=> (not res!543551) (not e!443440))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43424 0))(
  ( (array!43425 (arr!20788 (Array (_ BitVec 32) (_ BitVec 64))) (size!21208 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43424)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799401 (= res!543551 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21208 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20788 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21208 a!3170)) (= (select (arr!20788 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799402 () Bool)

(declare-fun res!543552 () Bool)

(declare-fun e!443439 () Bool)

(assert (=> b!799402 (=> (not res!543552) (not e!443439))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!799402 (= res!543552 (and (= (size!21208 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21208 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21208 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799403 () Bool)

(assert (=> b!799403 (= e!443439 e!443440)))

(declare-fun res!543553 () Bool)

(assert (=> b!799403 (=> (not res!543553) (not e!443440))))

(declare-datatypes ((SeekEntryResult!8335 0))(
  ( (MissingZero!8335 (index!35708 (_ BitVec 32))) (Found!8335 (index!35709 (_ BitVec 32))) (Intermediate!8335 (undefined!9147 Bool) (index!35710 (_ BitVec 32)) (x!66752 (_ BitVec 32))) (Undefined!8335) (MissingVacant!8335 (index!35711 (_ BitVec 32))) )
))
(declare-fun lt!356849 () SeekEntryResult!8335)

(assert (=> b!799403 (= res!543553 (or (= lt!356849 (MissingZero!8335 i!1163)) (= lt!356849 (MissingVacant!8335 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43424 (_ BitVec 32)) SeekEntryResult!8335)

(assert (=> b!799403 (= lt!356849 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!543555 () Bool)

(assert (=> start!68760 (=> (not res!543555) (not e!443439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68760 (= res!543555 (validMask!0 mask!3266))))

(assert (=> start!68760 e!443439))

(assert (=> start!68760 true))

(declare-fun array_inv!16647 (array!43424) Bool)

(assert (=> start!68760 (array_inv!16647 a!3170)))

(declare-fun e!443437 () Bool)

(declare-fun lt!356848 () SeekEntryResult!8335)

(declare-fun b!799404 () Bool)

(declare-fun lt!356851 () SeekEntryResult!8335)

(assert (=> b!799404 (= e!443437 (and (= lt!356851 lt!356848) (= lt!356848 (Found!8335 j!153)) (not (= (select (arr!20788 a!3170) index!1236) (select (arr!20788 a!3170) j!153))) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43424 (_ BitVec 32)) SeekEntryResult!8335)

(assert (=> b!799404 (= lt!356848 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20788 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799404 (= lt!356851 (seekEntryOrOpen!0 (select (arr!20788 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799405 () Bool)

(declare-fun res!543546 () Bool)

(assert (=> b!799405 (=> (not res!543546) (not e!443440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43424 (_ BitVec 32)) Bool)

(assert (=> b!799405 (= res!543546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799406 () Bool)

(declare-fun res!543547 () Bool)

(assert (=> b!799406 (=> (not res!543547) (not e!443439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799406 (= res!543547 (validKeyInArray!0 (select (arr!20788 a!3170) j!153)))))

(declare-fun b!799407 () Bool)

(declare-fun res!543554 () Bool)

(assert (=> b!799407 (=> (not res!543554) (not e!443440))))

(declare-datatypes ((List!14658 0))(
  ( (Nil!14655) (Cons!14654 (h!15789 (_ BitVec 64)) (t!20965 List!14658)) )
))
(declare-fun arrayNoDuplicates!0 (array!43424 (_ BitVec 32) List!14658) Bool)

(assert (=> b!799407 (= res!543554 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14655))))

(declare-fun b!799408 () Bool)

(assert (=> b!799408 (= e!443440 e!443437)))

(declare-fun res!543549 () Bool)

(assert (=> b!799408 (=> (not res!543549) (not e!443437))))

(declare-fun lt!356850 () (_ BitVec 64))

(declare-fun lt!356847 () array!43424)

(assert (=> b!799408 (= res!543549 (= (seekEntryOrOpen!0 lt!356850 lt!356847 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356850 lt!356847 mask!3266)))))

(assert (=> b!799408 (= lt!356850 (select (store (arr!20788 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799408 (= lt!356847 (array!43425 (store (arr!20788 a!3170) i!1163 k0!2044) (size!21208 a!3170)))))

(declare-fun b!799409 () Bool)

(declare-fun res!543548 () Bool)

(assert (=> b!799409 (=> (not res!543548) (not e!443439))))

(declare-fun arrayContainsKey!0 (array!43424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799409 (= res!543548 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799410 () Bool)

(declare-fun res!543550 () Bool)

(assert (=> b!799410 (=> (not res!543550) (not e!443439))))

(assert (=> b!799410 (= res!543550 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68760 res!543555) b!799402))

(assert (= (and b!799402 res!543552) b!799406))

(assert (= (and b!799406 res!543547) b!799410))

(assert (= (and b!799410 res!543550) b!799409))

(assert (= (and b!799409 res!543548) b!799403))

(assert (= (and b!799403 res!543553) b!799405))

(assert (= (and b!799405 res!543546) b!799407))

(assert (= (and b!799407 res!543554) b!799401))

(assert (= (and b!799401 res!543551) b!799408))

(assert (= (and b!799408 res!543549) b!799404))

(declare-fun m!740789 () Bool)

(assert (=> b!799406 m!740789))

(assert (=> b!799406 m!740789))

(declare-fun m!740791 () Bool)

(assert (=> b!799406 m!740791))

(declare-fun m!740793 () Bool)

(assert (=> start!68760 m!740793))

(declare-fun m!740795 () Bool)

(assert (=> start!68760 m!740795))

(declare-fun m!740797 () Bool)

(assert (=> b!799405 m!740797))

(declare-fun m!740799 () Bool)

(assert (=> b!799403 m!740799))

(declare-fun m!740801 () Bool)

(assert (=> b!799408 m!740801))

(declare-fun m!740803 () Bool)

(assert (=> b!799408 m!740803))

(declare-fun m!740805 () Bool)

(assert (=> b!799408 m!740805))

(declare-fun m!740807 () Bool)

(assert (=> b!799408 m!740807))

(declare-fun m!740809 () Bool)

(assert (=> b!799404 m!740809))

(assert (=> b!799404 m!740789))

(assert (=> b!799404 m!740789))

(declare-fun m!740811 () Bool)

(assert (=> b!799404 m!740811))

(assert (=> b!799404 m!740789))

(declare-fun m!740813 () Bool)

(assert (=> b!799404 m!740813))

(declare-fun m!740815 () Bool)

(assert (=> b!799410 m!740815))

(declare-fun m!740817 () Bool)

(assert (=> b!799407 m!740817))

(declare-fun m!740819 () Bool)

(assert (=> b!799401 m!740819))

(declare-fun m!740821 () Bool)

(assert (=> b!799401 m!740821))

(declare-fun m!740823 () Bool)

(assert (=> b!799409 m!740823))

(check-sat (not b!799404) (not b!799405) (not b!799406) (not b!799409) (not start!68760) (not b!799408) (not b!799403) (not b!799410) (not b!799407))
(check-sat)
(get-model)

(declare-fun b!799481 () Bool)

(declare-fun e!443475 () Bool)

(declare-fun e!443473 () Bool)

(assert (=> b!799481 (= e!443475 e!443473)))

(declare-fun res!543623 () Bool)

(assert (=> b!799481 (=> (not res!543623) (not e!443473))))

(declare-fun e!443476 () Bool)

(assert (=> b!799481 (= res!543623 (not e!443476))))

(declare-fun res!543622 () Bool)

(assert (=> b!799481 (=> (not res!543622) (not e!443476))))

(assert (=> b!799481 (= res!543622 (validKeyInArray!0 (select (arr!20788 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103683 () Bool)

(declare-fun res!543624 () Bool)

(assert (=> d!103683 (=> res!543624 e!443475)))

(assert (=> d!103683 (= res!543624 (bvsge #b00000000000000000000000000000000 (size!21208 a!3170)))))

(assert (=> d!103683 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14655) e!443475)))

(declare-fun bm!35373 () Bool)

(declare-fun call!35376 () Bool)

(declare-fun c!88343 () Bool)

(assert (=> bm!35373 (= call!35376 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88343 (Cons!14654 (select (arr!20788 a!3170) #b00000000000000000000000000000000) Nil!14655) Nil!14655)))))

(declare-fun b!799482 () Bool)

(declare-fun contains!4098 (List!14658 (_ BitVec 64)) Bool)

(assert (=> b!799482 (= e!443476 (contains!4098 Nil!14655 (select (arr!20788 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!799483 () Bool)

(declare-fun e!443474 () Bool)

(assert (=> b!799483 (= e!443474 call!35376)))

(declare-fun b!799484 () Bool)

(assert (=> b!799484 (= e!443474 call!35376)))

(declare-fun b!799485 () Bool)

(assert (=> b!799485 (= e!443473 e!443474)))

(assert (=> b!799485 (= c!88343 (validKeyInArray!0 (select (arr!20788 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103683 (not res!543624)) b!799481))

(assert (= (and b!799481 res!543622) b!799482))

(assert (= (and b!799481 res!543623) b!799485))

(assert (= (and b!799485 c!88343) b!799484))

(assert (= (and b!799485 (not c!88343)) b!799483))

(assert (= (or b!799484 b!799483) bm!35373))

(declare-fun m!740897 () Bool)

(assert (=> b!799481 m!740897))

(assert (=> b!799481 m!740897))

(declare-fun m!740899 () Bool)

(assert (=> b!799481 m!740899))

(assert (=> bm!35373 m!740897))

(declare-fun m!740901 () Bool)

(assert (=> bm!35373 m!740901))

(assert (=> b!799482 m!740897))

(assert (=> b!799482 m!740897))

(declare-fun m!740903 () Bool)

(assert (=> b!799482 m!740903))

(assert (=> b!799485 m!740897))

(assert (=> b!799485 m!740897))

(assert (=> b!799485 m!740899))

(assert (=> b!799407 d!103683))

(declare-fun d!103685 () Bool)

(assert (=> d!103685 (= (validKeyInArray!0 (select (arr!20788 a!3170) j!153)) (and (not (= (select (arr!20788 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20788 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!799406 d!103685))

(declare-fun b!799498 () Bool)

(declare-fun e!443485 () SeekEntryResult!8335)

(declare-fun e!443484 () SeekEntryResult!8335)

(assert (=> b!799498 (= e!443485 e!443484)))

(declare-fun lt!356886 () (_ BitVec 64))

(declare-fun c!88350 () Bool)

(assert (=> b!799498 (= c!88350 (= lt!356886 (select (arr!20788 a!3170) j!153)))))

(declare-fun b!799499 () Bool)

(declare-fun c!88351 () Bool)

(assert (=> b!799499 (= c!88351 (= lt!356886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!443483 () SeekEntryResult!8335)

(assert (=> b!799499 (= e!443484 e!443483)))

(declare-fun b!799500 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799500 (= e!443483 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantBefore!23 (select (arr!20788 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799501 () Bool)

(assert (=> b!799501 (= e!443484 (Found!8335 index!1236))))

(declare-fun b!799502 () Bool)

(assert (=> b!799502 (= e!443483 (MissingVacant!8335 vacantBefore!23))))

(declare-fun b!799503 () Bool)

(assert (=> b!799503 (= e!443485 Undefined!8335)))

(declare-fun d!103687 () Bool)

(declare-fun lt!356887 () SeekEntryResult!8335)

(get-info :version)

(assert (=> d!103687 (and (or ((_ is Undefined!8335) lt!356887) (not ((_ is Found!8335) lt!356887)) (and (bvsge (index!35709 lt!356887) #b00000000000000000000000000000000) (bvslt (index!35709 lt!356887) (size!21208 a!3170)))) (or ((_ is Undefined!8335) lt!356887) ((_ is Found!8335) lt!356887) (not ((_ is MissingVacant!8335) lt!356887)) (not (= (index!35711 lt!356887) vacantBefore!23)) (and (bvsge (index!35711 lt!356887) #b00000000000000000000000000000000) (bvslt (index!35711 lt!356887) (size!21208 a!3170)))) (or ((_ is Undefined!8335) lt!356887) (ite ((_ is Found!8335) lt!356887) (= (select (arr!20788 a!3170) (index!35709 lt!356887)) (select (arr!20788 a!3170) j!153)) (and ((_ is MissingVacant!8335) lt!356887) (= (index!35711 lt!356887) vacantBefore!23) (= (select (arr!20788 a!3170) (index!35711 lt!356887)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103687 (= lt!356887 e!443485)))

(declare-fun c!88352 () Bool)

(assert (=> d!103687 (= c!88352 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103687 (= lt!356886 (select (arr!20788 a!3170) index!1236))))

(assert (=> d!103687 (validMask!0 mask!3266)))

(assert (=> d!103687 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20788 a!3170) j!153) a!3170 mask!3266) lt!356887)))

(assert (= (and d!103687 c!88352) b!799503))

(assert (= (and d!103687 (not c!88352)) b!799498))

(assert (= (and b!799498 c!88350) b!799501))

(assert (= (and b!799498 (not c!88350)) b!799499))

(assert (= (and b!799499 c!88351) b!799502))

(assert (= (and b!799499 (not c!88351)) b!799500))

(declare-fun m!740905 () Bool)

(assert (=> b!799500 m!740905))

(assert (=> b!799500 m!740905))

(assert (=> b!799500 m!740789))

(declare-fun m!740907 () Bool)

(assert (=> b!799500 m!740907))

(declare-fun m!740909 () Bool)

(assert (=> d!103687 m!740909))

(declare-fun m!740911 () Bool)

(assert (=> d!103687 m!740911))

(assert (=> d!103687 m!740809))

(assert (=> d!103687 m!740793))

(assert (=> b!799404 d!103687))

(declare-fun b!799532 () Bool)

(declare-fun e!443504 () SeekEntryResult!8335)

(declare-fun lt!356908 () SeekEntryResult!8335)

(assert (=> b!799532 (= e!443504 (MissingZero!8335 (index!35710 lt!356908)))))

(declare-fun b!799533 () Bool)

(assert (=> b!799533 (= e!443504 (seekKeyOrZeroReturnVacant!0 (x!66752 lt!356908) (index!35710 lt!356908) (index!35710 lt!356908) (select (arr!20788 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799534 () Bool)

(declare-fun e!443506 () SeekEntryResult!8335)

(assert (=> b!799534 (= e!443506 Undefined!8335)))

(declare-fun b!799535 () Bool)

(declare-fun e!443505 () SeekEntryResult!8335)

(assert (=> b!799535 (= e!443506 e!443505)))

(declare-fun lt!356907 () (_ BitVec 64))

(assert (=> b!799535 (= lt!356907 (select (arr!20788 a!3170) (index!35710 lt!356908)))))

(declare-fun c!88365 () Bool)

(assert (=> b!799535 (= c!88365 (= lt!356907 (select (arr!20788 a!3170) j!153)))))

(declare-fun b!799536 () Bool)

(declare-fun c!88363 () Bool)

(assert (=> b!799536 (= c!88363 (= lt!356907 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!799536 (= e!443505 e!443504)))

(declare-fun b!799537 () Bool)

(assert (=> b!799537 (= e!443505 (Found!8335 (index!35710 lt!356908)))))

(declare-fun d!103689 () Bool)

(declare-fun lt!356906 () SeekEntryResult!8335)

(assert (=> d!103689 (and (or ((_ is Undefined!8335) lt!356906) (not ((_ is Found!8335) lt!356906)) (and (bvsge (index!35709 lt!356906) #b00000000000000000000000000000000) (bvslt (index!35709 lt!356906) (size!21208 a!3170)))) (or ((_ is Undefined!8335) lt!356906) ((_ is Found!8335) lt!356906) (not ((_ is MissingZero!8335) lt!356906)) (and (bvsge (index!35708 lt!356906) #b00000000000000000000000000000000) (bvslt (index!35708 lt!356906) (size!21208 a!3170)))) (or ((_ is Undefined!8335) lt!356906) ((_ is Found!8335) lt!356906) ((_ is MissingZero!8335) lt!356906) (not ((_ is MissingVacant!8335) lt!356906)) (and (bvsge (index!35711 lt!356906) #b00000000000000000000000000000000) (bvslt (index!35711 lt!356906) (size!21208 a!3170)))) (or ((_ is Undefined!8335) lt!356906) (ite ((_ is Found!8335) lt!356906) (= (select (arr!20788 a!3170) (index!35709 lt!356906)) (select (arr!20788 a!3170) j!153)) (ite ((_ is MissingZero!8335) lt!356906) (= (select (arr!20788 a!3170) (index!35708 lt!356906)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8335) lt!356906) (= (select (arr!20788 a!3170) (index!35711 lt!356906)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103689 (= lt!356906 e!443506)))

(declare-fun c!88364 () Bool)

(assert (=> d!103689 (= c!88364 (and ((_ is Intermediate!8335) lt!356908) (undefined!9147 lt!356908)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43424 (_ BitVec 32)) SeekEntryResult!8335)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103689 (= lt!356908 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20788 a!3170) j!153) mask!3266) (select (arr!20788 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103689 (validMask!0 mask!3266)))

(assert (=> d!103689 (= (seekEntryOrOpen!0 (select (arr!20788 a!3170) j!153) a!3170 mask!3266) lt!356906)))

(assert (= (and d!103689 c!88364) b!799534))

(assert (= (and d!103689 (not c!88364)) b!799535))

(assert (= (and b!799535 c!88365) b!799537))

(assert (= (and b!799535 (not c!88365)) b!799536))

(assert (= (and b!799536 c!88363) b!799532))

(assert (= (and b!799536 (not c!88363)) b!799533))

(assert (=> b!799533 m!740789))

(declare-fun m!740913 () Bool)

(assert (=> b!799533 m!740913))

(declare-fun m!740915 () Bool)

(assert (=> b!799535 m!740915))

(assert (=> d!103689 m!740789))

(declare-fun m!740917 () Bool)

(assert (=> d!103689 m!740917))

(declare-fun m!740919 () Bool)

(assert (=> d!103689 m!740919))

(assert (=> d!103689 m!740793))

(declare-fun m!740921 () Bool)

(assert (=> d!103689 m!740921))

(assert (=> d!103689 m!740917))

(assert (=> d!103689 m!740789))

(declare-fun m!740923 () Bool)

(assert (=> d!103689 m!740923))

(declare-fun m!740925 () Bool)

(assert (=> d!103689 m!740925))

(assert (=> b!799404 d!103689))

(declare-fun b!799564 () Bool)

(declare-fun e!443527 () Bool)

(declare-fun e!443529 () Bool)

(assert (=> b!799564 (= e!443527 e!443529)))

(declare-fun lt!356922 () (_ BitVec 64))

(assert (=> b!799564 (= lt!356922 (select (arr!20788 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27443 0))(
  ( (Unit!27444) )
))
(declare-fun lt!356923 () Unit!27443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43424 (_ BitVec 64) (_ BitVec 32)) Unit!27443)

(assert (=> b!799564 (= lt!356923 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!356922 #b00000000000000000000000000000000))))

(assert (=> b!799564 (arrayContainsKey!0 a!3170 lt!356922 #b00000000000000000000000000000000)))

(declare-fun lt!356921 () Unit!27443)

(assert (=> b!799564 (= lt!356921 lt!356923)))

(declare-fun res!543648 () Bool)

(assert (=> b!799564 (= res!543648 (= (seekEntryOrOpen!0 (select (arr!20788 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8335 #b00000000000000000000000000000000)))))

(assert (=> b!799564 (=> (not res!543648) (not e!443529))))

(declare-fun b!799565 () Bool)

(declare-fun e!443528 () Bool)

(assert (=> b!799565 (= e!443528 e!443527)))

(declare-fun c!88372 () Bool)

(assert (=> b!799565 (= c!88372 (validKeyInArray!0 (select (arr!20788 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103697 () Bool)

(declare-fun res!543647 () Bool)

(assert (=> d!103697 (=> res!543647 e!443528)))

(assert (=> d!103697 (= res!543647 (bvsge #b00000000000000000000000000000000 (size!21208 a!3170)))))

(assert (=> d!103697 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!443528)))

(declare-fun bm!35382 () Bool)

(declare-fun call!35385 () Bool)

(assert (=> bm!35382 (= call!35385 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!799566 () Bool)

(assert (=> b!799566 (= e!443529 call!35385)))

(declare-fun b!799567 () Bool)

(assert (=> b!799567 (= e!443527 call!35385)))

(assert (= (and d!103697 (not res!543647)) b!799565))

(assert (= (and b!799565 c!88372) b!799564))

(assert (= (and b!799565 (not c!88372)) b!799567))

(assert (= (and b!799564 res!543648) b!799566))

(assert (= (or b!799566 b!799567) bm!35382))

(assert (=> b!799564 m!740897))

(declare-fun m!740951 () Bool)

(assert (=> b!799564 m!740951))

(declare-fun m!740953 () Bool)

(assert (=> b!799564 m!740953))

(assert (=> b!799564 m!740897))

(declare-fun m!740955 () Bool)

(assert (=> b!799564 m!740955))

(assert (=> b!799565 m!740897))

(assert (=> b!799565 m!740897))

(assert (=> b!799565 m!740899))

(declare-fun m!740957 () Bool)

(assert (=> bm!35382 m!740957))

(assert (=> b!799405 d!103697))

(declare-fun d!103703 () Bool)

(assert (=> d!103703 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!799410 d!103703))

(declare-fun b!799568 () Bool)

(declare-fun e!443530 () SeekEntryResult!8335)

(declare-fun lt!356926 () SeekEntryResult!8335)

(assert (=> b!799568 (= e!443530 (MissingZero!8335 (index!35710 lt!356926)))))

(declare-fun b!799569 () Bool)

(assert (=> b!799569 (= e!443530 (seekKeyOrZeroReturnVacant!0 (x!66752 lt!356926) (index!35710 lt!356926) (index!35710 lt!356926) k0!2044 a!3170 mask!3266))))

(declare-fun b!799570 () Bool)

(declare-fun e!443532 () SeekEntryResult!8335)

(assert (=> b!799570 (= e!443532 Undefined!8335)))

(declare-fun b!799571 () Bool)

(declare-fun e!443531 () SeekEntryResult!8335)

(assert (=> b!799571 (= e!443532 e!443531)))

(declare-fun lt!356925 () (_ BitVec 64))

(assert (=> b!799571 (= lt!356925 (select (arr!20788 a!3170) (index!35710 lt!356926)))))

(declare-fun c!88375 () Bool)

(assert (=> b!799571 (= c!88375 (= lt!356925 k0!2044))))

(declare-fun b!799572 () Bool)

(declare-fun c!88373 () Bool)

(assert (=> b!799572 (= c!88373 (= lt!356925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!799572 (= e!443531 e!443530)))

(declare-fun b!799573 () Bool)

(assert (=> b!799573 (= e!443531 (Found!8335 (index!35710 lt!356926)))))

(declare-fun d!103705 () Bool)

(declare-fun lt!356924 () SeekEntryResult!8335)

(assert (=> d!103705 (and (or ((_ is Undefined!8335) lt!356924) (not ((_ is Found!8335) lt!356924)) (and (bvsge (index!35709 lt!356924) #b00000000000000000000000000000000) (bvslt (index!35709 lt!356924) (size!21208 a!3170)))) (or ((_ is Undefined!8335) lt!356924) ((_ is Found!8335) lt!356924) (not ((_ is MissingZero!8335) lt!356924)) (and (bvsge (index!35708 lt!356924) #b00000000000000000000000000000000) (bvslt (index!35708 lt!356924) (size!21208 a!3170)))) (or ((_ is Undefined!8335) lt!356924) ((_ is Found!8335) lt!356924) ((_ is MissingZero!8335) lt!356924) (not ((_ is MissingVacant!8335) lt!356924)) (and (bvsge (index!35711 lt!356924) #b00000000000000000000000000000000) (bvslt (index!35711 lt!356924) (size!21208 a!3170)))) (or ((_ is Undefined!8335) lt!356924) (ite ((_ is Found!8335) lt!356924) (= (select (arr!20788 a!3170) (index!35709 lt!356924)) k0!2044) (ite ((_ is MissingZero!8335) lt!356924) (= (select (arr!20788 a!3170) (index!35708 lt!356924)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8335) lt!356924) (= (select (arr!20788 a!3170) (index!35711 lt!356924)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103705 (= lt!356924 e!443532)))

(declare-fun c!88374 () Bool)

(assert (=> d!103705 (= c!88374 (and ((_ is Intermediate!8335) lt!356926) (undefined!9147 lt!356926)))))

(assert (=> d!103705 (= lt!356926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103705 (validMask!0 mask!3266)))

(assert (=> d!103705 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!356924)))

(assert (= (and d!103705 c!88374) b!799570))

(assert (= (and d!103705 (not c!88374)) b!799571))

(assert (= (and b!799571 c!88375) b!799573))

(assert (= (and b!799571 (not c!88375)) b!799572))

(assert (= (and b!799572 c!88373) b!799568))

(assert (= (and b!799572 (not c!88373)) b!799569))

(declare-fun m!740959 () Bool)

(assert (=> b!799569 m!740959))

(declare-fun m!740961 () Bool)

(assert (=> b!799571 m!740961))

(declare-fun m!740963 () Bool)

(assert (=> d!103705 m!740963))

(declare-fun m!740965 () Bool)

(assert (=> d!103705 m!740965))

(assert (=> d!103705 m!740793))

(declare-fun m!740967 () Bool)

(assert (=> d!103705 m!740967))

(assert (=> d!103705 m!740963))

(declare-fun m!740969 () Bool)

(assert (=> d!103705 m!740969))

(declare-fun m!740971 () Bool)

(assert (=> d!103705 m!740971))

(assert (=> b!799403 d!103705))

(declare-fun d!103707 () Bool)

(assert (=> d!103707 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68760 d!103707))

(declare-fun d!103713 () Bool)

(assert (=> d!103713 (= (array_inv!16647 a!3170) (bvsge (size!21208 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68760 d!103713))

(declare-fun b!799585 () Bool)

(declare-fun e!443543 () SeekEntryResult!8335)

(declare-fun lt!356933 () SeekEntryResult!8335)

(assert (=> b!799585 (= e!443543 (MissingZero!8335 (index!35710 lt!356933)))))

(declare-fun b!799586 () Bool)

(assert (=> b!799586 (= e!443543 (seekKeyOrZeroReturnVacant!0 (x!66752 lt!356933) (index!35710 lt!356933) (index!35710 lt!356933) lt!356850 lt!356847 mask!3266))))

(declare-fun b!799587 () Bool)

(declare-fun e!443545 () SeekEntryResult!8335)

(assert (=> b!799587 (= e!443545 Undefined!8335)))

(declare-fun b!799588 () Bool)

(declare-fun e!443544 () SeekEntryResult!8335)

(assert (=> b!799588 (= e!443545 e!443544)))

(declare-fun lt!356932 () (_ BitVec 64))

(assert (=> b!799588 (= lt!356932 (select (arr!20788 lt!356847) (index!35710 lt!356933)))))

(declare-fun c!88379 () Bool)

(assert (=> b!799588 (= c!88379 (= lt!356932 lt!356850))))

(declare-fun b!799589 () Bool)

(declare-fun c!88377 () Bool)

(assert (=> b!799589 (= c!88377 (= lt!356932 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!799589 (= e!443544 e!443543)))

(declare-fun b!799590 () Bool)

(assert (=> b!799590 (= e!443544 (Found!8335 (index!35710 lt!356933)))))

(declare-fun d!103715 () Bool)

(declare-fun lt!356931 () SeekEntryResult!8335)

(assert (=> d!103715 (and (or ((_ is Undefined!8335) lt!356931) (not ((_ is Found!8335) lt!356931)) (and (bvsge (index!35709 lt!356931) #b00000000000000000000000000000000) (bvslt (index!35709 lt!356931) (size!21208 lt!356847)))) (or ((_ is Undefined!8335) lt!356931) ((_ is Found!8335) lt!356931) (not ((_ is MissingZero!8335) lt!356931)) (and (bvsge (index!35708 lt!356931) #b00000000000000000000000000000000) (bvslt (index!35708 lt!356931) (size!21208 lt!356847)))) (or ((_ is Undefined!8335) lt!356931) ((_ is Found!8335) lt!356931) ((_ is MissingZero!8335) lt!356931) (not ((_ is MissingVacant!8335) lt!356931)) (and (bvsge (index!35711 lt!356931) #b00000000000000000000000000000000) (bvslt (index!35711 lt!356931) (size!21208 lt!356847)))) (or ((_ is Undefined!8335) lt!356931) (ite ((_ is Found!8335) lt!356931) (= (select (arr!20788 lt!356847) (index!35709 lt!356931)) lt!356850) (ite ((_ is MissingZero!8335) lt!356931) (= (select (arr!20788 lt!356847) (index!35708 lt!356931)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8335) lt!356931) (= (select (arr!20788 lt!356847) (index!35711 lt!356931)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103715 (= lt!356931 e!443545)))

(declare-fun c!88378 () Bool)

(assert (=> d!103715 (= c!88378 (and ((_ is Intermediate!8335) lt!356933) (undefined!9147 lt!356933)))))

(assert (=> d!103715 (= lt!356933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!356850 mask!3266) lt!356850 lt!356847 mask!3266))))

(assert (=> d!103715 (validMask!0 mask!3266)))

(assert (=> d!103715 (= (seekEntryOrOpen!0 lt!356850 lt!356847 mask!3266) lt!356931)))

(assert (= (and d!103715 c!88378) b!799587))

(assert (= (and d!103715 (not c!88378)) b!799588))

(assert (= (and b!799588 c!88379) b!799590))

(assert (= (and b!799588 (not c!88379)) b!799589))

(assert (= (and b!799589 c!88377) b!799585))

(assert (= (and b!799589 (not c!88377)) b!799586))

(declare-fun m!740979 () Bool)

(assert (=> b!799586 m!740979))

(declare-fun m!740981 () Bool)

(assert (=> b!799588 m!740981))

(declare-fun m!740983 () Bool)

(assert (=> d!103715 m!740983))

(declare-fun m!740985 () Bool)

(assert (=> d!103715 m!740985))

(assert (=> d!103715 m!740793))

(declare-fun m!740987 () Bool)

(assert (=> d!103715 m!740987))

(assert (=> d!103715 m!740983))

(declare-fun m!740989 () Bool)

(assert (=> d!103715 m!740989))

(declare-fun m!740991 () Bool)

(assert (=> d!103715 m!740991))

(assert (=> b!799408 d!103715))

(declare-fun b!799603 () Bool)

(declare-fun e!443554 () SeekEntryResult!8335)

(declare-fun e!443553 () SeekEntryResult!8335)

(assert (=> b!799603 (= e!443554 e!443553)))

(declare-fun c!88386 () Bool)

(declare-fun lt!356934 () (_ BitVec 64))

(assert (=> b!799603 (= c!88386 (= lt!356934 lt!356850))))

(declare-fun b!799604 () Bool)

(declare-fun c!88387 () Bool)

(assert (=> b!799604 (= c!88387 (= lt!356934 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!443552 () SeekEntryResult!8335)

(assert (=> b!799604 (= e!443553 e!443552)))

(declare-fun b!799605 () Bool)

(assert (=> b!799605 (= e!443552 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!356850 lt!356847 mask!3266))))

(declare-fun b!799606 () Bool)

(assert (=> b!799606 (= e!443553 (Found!8335 index!1236))))

(declare-fun b!799607 () Bool)

(assert (=> b!799607 (= e!443552 (MissingVacant!8335 vacantAfter!23))))

(declare-fun b!799608 () Bool)

(assert (=> b!799608 (= e!443554 Undefined!8335)))

(declare-fun d!103717 () Bool)

(declare-fun lt!356935 () SeekEntryResult!8335)

(assert (=> d!103717 (and (or ((_ is Undefined!8335) lt!356935) (not ((_ is Found!8335) lt!356935)) (and (bvsge (index!35709 lt!356935) #b00000000000000000000000000000000) (bvslt (index!35709 lt!356935) (size!21208 lt!356847)))) (or ((_ is Undefined!8335) lt!356935) ((_ is Found!8335) lt!356935) (not ((_ is MissingVacant!8335) lt!356935)) (not (= (index!35711 lt!356935) vacantAfter!23)) (and (bvsge (index!35711 lt!356935) #b00000000000000000000000000000000) (bvslt (index!35711 lt!356935) (size!21208 lt!356847)))) (or ((_ is Undefined!8335) lt!356935) (ite ((_ is Found!8335) lt!356935) (= (select (arr!20788 lt!356847) (index!35709 lt!356935)) lt!356850) (and ((_ is MissingVacant!8335) lt!356935) (= (index!35711 lt!356935) vacantAfter!23) (= (select (arr!20788 lt!356847) (index!35711 lt!356935)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103717 (= lt!356935 e!443554)))

(declare-fun c!88388 () Bool)

(assert (=> d!103717 (= c!88388 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103717 (= lt!356934 (select (arr!20788 lt!356847) index!1236))))

(assert (=> d!103717 (validMask!0 mask!3266)))

(assert (=> d!103717 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356850 lt!356847 mask!3266) lt!356935)))

(assert (= (and d!103717 c!88388) b!799608))

(assert (= (and d!103717 (not c!88388)) b!799603))

(assert (= (and b!799603 c!88386) b!799606))

(assert (= (and b!799603 (not c!88386)) b!799604))

(assert (= (and b!799604 c!88387) b!799607))

(assert (= (and b!799604 (not c!88387)) b!799605))

(assert (=> b!799605 m!740905))

(assert (=> b!799605 m!740905))

(declare-fun m!740993 () Bool)

(assert (=> b!799605 m!740993))

(declare-fun m!740995 () Bool)

(assert (=> d!103717 m!740995))

(declare-fun m!740997 () Bool)

(assert (=> d!103717 m!740997))

(declare-fun m!740999 () Bool)

(assert (=> d!103717 m!740999))

(assert (=> d!103717 m!740793))

(assert (=> b!799408 d!103717))

(declare-fun d!103719 () Bool)

(declare-fun res!543662 () Bool)

(declare-fun e!443559 () Bool)

(assert (=> d!103719 (=> res!543662 e!443559)))

(assert (=> d!103719 (= res!543662 (= (select (arr!20788 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103719 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!443559)))

(declare-fun b!799613 () Bool)

(declare-fun e!443560 () Bool)

(assert (=> b!799613 (= e!443559 e!443560)))

(declare-fun res!543663 () Bool)

(assert (=> b!799613 (=> (not res!543663) (not e!443560))))

(assert (=> b!799613 (= res!543663 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21208 a!3170)))))

(declare-fun b!799614 () Bool)

(assert (=> b!799614 (= e!443560 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103719 (not res!543662)) b!799613))

(assert (= (and b!799613 res!543663) b!799614))

(assert (=> d!103719 m!740897))

(declare-fun m!741001 () Bool)

(assert (=> b!799614 m!741001))

(assert (=> b!799409 d!103719))

(check-sat (not d!103689) (not bm!35382) (not d!103705) (not d!103687) (not b!799485) (not b!799482) (not b!799481) (not b!799569) (not d!103715) (not b!799533) (not d!103717) (not b!799565) (not b!799586) (not bm!35373) (not b!799564) (not b!799500) (not b!799605) (not b!799614))
(check-sat)
