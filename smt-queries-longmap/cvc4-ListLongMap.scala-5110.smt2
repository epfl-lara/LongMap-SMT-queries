; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69270 () Bool)

(assert start!69270)

(declare-fun b!808295 () Bool)

(declare-fun res!552421 () Bool)

(declare-fun e!447441 () Bool)

(assert (=> b!808295 (=> (not res!552421) (not e!447441))))

(declare-datatypes ((array!43970 0))(
  ( (array!43971 (arr!21062 (Array (_ BitVec 32) (_ BitVec 64))) (size!21483 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43970)

(declare-datatypes ((List!15025 0))(
  ( (Nil!15022) (Cons!15021 (h!16150 (_ BitVec 64)) (t!21340 List!15025)) )
))
(declare-fun arrayNoDuplicates!0 (array!43970 (_ BitVec 32) List!15025) Bool)

(assert (=> b!808295 (= res!552421 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15022))))

(declare-fun b!808296 () Bool)

(declare-fun res!552423 () Bool)

(declare-fun e!447439 () Bool)

(assert (=> b!808296 (=> (not res!552423) (not e!447439))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808296 (= res!552423 (validKeyInArray!0 k!2044))))

(declare-fun b!808297 () Bool)

(declare-fun e!447443 () Bool)

(declare-fun e!447442 () Bool)

(assert (=> b!808297 (= e!447443 e!447442)))

(declare-fun res!552419 () Bool)

(assert (=> b!808297 (=> (not res!552419) (not e!447442))))

(declare-datatypes ((SeekEntryResult!8653 0))(
  ( (MissingZero!8653 (index!36980 (_ BitVec 32))) (Found!8653 (index!36981 (_ BitVec 32))) (Intermediate!8653 (undefined!9465 Bool) (index!36982 (_ BitVec 32)) (x!67777 (_ BitVec 32))) (Undefined!8653) (MissingVacant!8653 (index!36983 (_ BitVec 32))) )
))
(declare-fun lt!362200 () SeekEntryResult!8653)

(declare-fun lt!362198 () SeekEntryResult!8653)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808297 (= res!552419 (and (= lt!362198 lt!362200) (= lt!362200 (Found!8653 j!153)) (not (= (select (arr!21062 a!3170) index!1236) (select (arr!21062 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43970 (_ BitVec 32)) SeekEntryResult!8653)

(assert (=> b!808297 (= lt!362200 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21062 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43970 (_ BitVec 32)) SeekEntryResult!8653)

(assert (=> b!808297 (= lt!362198 (seekEntryOrOpen!0 (select (arr!21062 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808298 () Bool)

(declare-fun res!552425 () Bool)

(assert (=> b!808298 (=> (not res!552425) (not e!447441))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808298 (= res!552425 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21483 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21062 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21483 a!3170)) (= (select (arr!21062 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808299 () Bool)

(assert (=> b!808299 (= e!447441 e!447443)))

(declare-fun res!552428 () Bool)

(assert (=> b!808299 (=> (not res!552428) (not e!447443))))

(declare-fun lt!362201 () array!43970)

(declare-fun lt!362199 () (_ BitVec 64))

(assert (=> b!808299 (= res!552428 (= (seekEntryOrOpen!0 lt!362199 lt!362201 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362199 lt!362201 mask!3266)))))

(assert (=> b!808299 (= lt!362199 (select (store (arr!21062 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808299 (= lt!362201 (array!43971 (store (arr!21062 a!3170) i!1163 k!2044) (size!21483 a!3170)))))

(declare-fun b!808300 () Bool)

(declare-fun res!552422 () Bool)

(assert (=> b!808300 (=> (not res!552422) (not e!447439))))

(assert (=> b!808300 (= res!552422 (and (= (size!21483 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21483 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21483 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808301 () Bool)

(assert (=> b!808301 (= e!447439 e!447441)))

(declare-fun res!552418 () Bool)

(assert (=> b!808301 (=> (not res!552418) (not e!447441))))

(declare-fun lt!362197 () SeekEntryResult!8653)

(assert (=> b!808301 (= res!552418 (or (= lt!362197 (MissingZero!8653 i!1163)) (= lt!362197 (MissingVacant!8653 i!1163))))))

(assert (=> b!808301 (= lt!362197 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!808302 () Bool)

(declare-fun res!552424 () Bool)

(assert (=> b!808302 (=> (not res!552424) (not e!447439))))

(assert (=> b!808302 (= res!552424 (validKeyInArray!0 (select (arr!21062 a!3170) j!153)))))

(declare-fun res!552420 () Bool)

(assert (=> start!69270 (=> (not res!552420) (not e!447439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69270 (= res!552420 (validMask!0 mask!3266))))

(assert (=> start!69270 e!447439))

(assert (=> start!69270 true))

(declare-fun array_inv!16858 (array!43970) Bool)

(assert (=> start!69270 (array_inv!16858 a!3170)))

(declare-fun b!808303 () Bool)

(declare-fun res!552427 () Bool)

(assert (=> b!808303 (=> (not res!552427) (not e!447439))))

(declare-fun arrayContainsKey!0 (array!43970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808303 (= res!552427 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808304 () Bool)

(assert (=> b!808304 (= e!447442 (bvsgt (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!362196 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808304 (= lt!362196 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808305 () Bool)

(declare-fun res!552426 () Bool)

(assert (=> b!808305 (=> (not res!552426) (not e!447441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43970 (_ BitVec 32)) Bool)

(assert (=> b!808305 (= res!552426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69270 res!552420) b!808300))

(assert (= (and b!808300 res!552422) b!808302))

(assert (= (and b!808302 res!552424) b!808296))

(assert (= (and b!808296 res!552423) b!808303))

(assert (= (and b!808303 res!552427) b!808301))

(assert (= (and b!808301 res!552418) b!808305))

(assert (= (and b!808305 res!552426) b!808295))

(assert (= (and b!808295 res!552421) b!808298))

(assert (= (and b!808298 res!552425) b!808299))

(assert (= (and b!808299 res!552428) b!808297))

(assert (= (and b!808297 res!552419) b!808304))

(declare-fun m!750459 () Bool)

(assert (=> start!69270 m!750459))

(declare-fun m!750461 () Bool)

(assert (=> start!69270 m!750461))

(declare-fun m!750463 () Bool)

(assert (=> b!808301 m!750463))

(declare-fun m!750465 () Bool)

(assert (=> b!808304 m!750465))

(declare-fun m!750467 () Bool)

(assert (=> b!808302 m!750467))

(assert (=> b!808302 m!750467))

(declare-fun m!750469 () Bool)

(assert (=> b!808302 m!750469))

(declare-fun m!750471 () Bool)

(assert (=> b!808296 m!750471))

(declare-fun m!750473 () Bool)

(assert (=> b!808299 m!750473))

(declare-fun m!750475 () Bool)

(assert (=> b!808299 m!750475))

(declare-fun m!750477 () Bool)

(assert (=> b!808299 m!750477))

(declare-fun m!750479 () Bool)

(assert (=> b!808299 m!750479))

(declare-fun m!750481 () Bool)

(assert (=> b!808295 m!750481))

(declare-fun m!750483 () Bool)

(assert (=> b!808297 m!750483))

(assert (=> b!808297 m!750467))

(assert (=> b!808297 m!750467))

(declare-fun m!750485 () Bool)

(assert (=> b!808297 m!750485))

(assert (=> b!808297 m!750467))

(declare-fun m!750487 () Bool)

(assert (=> b!808297 m!750487))

(declare-fun m!750489 () Bool)

(assert (=> b!808298 m!750489))

(declare-fun m!750491 () Bool)

(assert (=> b!808298 m!750491))

(declare-fun m!750493 () Bool)

(assert (=> b!808303 m!750493))

(declare-fun m!750495 () Bool)

(assert (=> b!808305 m!750495))

(push 1)

(assert (not b!808305))

(assert (not b!808295))

(assert (not b!808303))

(assert (not b!808297))

(assert (not b!808301))

(assert (not start!69270))

(assert (not b!808296))

(assert (not b!808299))

(assert (not b!808302))

(assert (not b!808304))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103747 () Bool)

(assert (=> d!103747 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808296 d!103747))

(declare-fun b!808405 () Bool)

(declare-fun e!447506 () SeekEntryResult!8653)

(declare-fun e!447505 () SeekEntryResult!8653)

(assert (=> b!808405 (= e!447506 e!447505)))

(declare-fun lt!362238 () (_ BitVec 64))

(declare-fun lt!362239 () SeekEntryResult!8653)

(assert (=> b!808405 (= lt!362238 (select (arr!21062 a!3170) (index!36982 lt!362239)))))

(declare-fun c!88389 () Bool)

(assert (=> b!808405 (= c!88389 (= lt!362238 k!2044))))

(declare-fun b!808406 () Bool)

(declare-fun e!447504 () SeekEntryResult!8653)

(assert (=> b!808406 (= e!447504 (MissingZero!8653 (index!36982 lt!362239)))))

(declare-fun b!808407 () Bool)

(declare-fun c!88388 () Bool)

(assert (=> b!808407 (= c!88388 (= lt!362238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!808407 (= e!447505 e!447504)))

(declare-fun b!808408 () Bool)

(assert (=> b!808408 (= e!447505 (Found!8653 (index!36982 lt!362239)))))

(declare-fun b!808409 () Bool)

(assert (=> b!808409 (= e!447504 (seekKeyOrZeroReturnVacant!0 (x!67777 lt!362239) (index!36982 lt!362239) (index!36982 lt!362239) k!2044 a!3170 mask!3266))))

(declare-fun b!808410 () Bool)

(assert (=> b!808410 (= e!447506 Undefined!8653)))

(declare-fun d!103749 () Bool)

(declare-fun lt!362240 () SeekEntryResult!8653)

(assert (=> d!103749 (and (or (is-Undefined!8653 lt!362240) (not (is-Found!8653 lt!362240)) (and (bvsge (index!36981 lt!362240) #b00000000000000000000000000000000) (bvslt (index!36981 lt!362240) (size!21483 a!3170)))) (or (is-Undefined!8653 lt!362240) (is-Found!8653 lt!362240) (not (is-MissingZero!8653 lt!362240)) (and (bvsge (index!36980 lt!362240) #b00000000000000000000000000000000) (bvslt (index!36980 lt!362240) (size!21483 a!3170)))) (or (is-Undefined!8653 lt!362240) (is-Found!8653 lt!362240) (is-MissingZero!8653 lt!362240) (not (is-MissingVacant!8653 lt!362240)) (and (bvsge (index!36983 lt!362240) #b00000000000000000000000000000000) (bvslt (index!36983 lt!362240) (size!21483 a!3170)))) (or (is-Undefined!8653 lt!362240) (ite (is-Found!8653 lt!362240) (= (select (arr!21062 a!3170) (index!36981 lt!362240)) k!2044) (ite (is-MissingZero!8653 lt!362240) (= (select (arr!21062 a!3170) (index!36980 lt!362240)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8653 lt!362240) (= (select (arr!21062 a!3170) (index!36983 lt!362240)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103749 (= lt!362240 e!447506)))

(declare-fun c!88390 () Bool)

(assert (=> d!103749 (= c!88390 (and (is-Intermediate!8653 lt!362239) (undefined!9465 lt!362239)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43970 (_ BitVec 32)) SeekEntryResult!8653)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103749 (= lt!362239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103749 (validMask!0 mask!3266)))

(assert (=> d!103749 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!362240)))

(assert (= (and d!103749 c!88390) b!808410))

(assert (= (and d!103749 (not c!88390)) b!808405))

(assert (= (and b!808405 c!88389) b!808408))

(assert (= (and b!808405 (not c!88389)) b!808407))

(assert (= (and b!808407 c!88388) b!808406))

(assert (= (and b!808407 (not c!88388)) b!808409))

(declare-fun m!750547 () Bool)

(assert (=> b!808405 m!750547))

(declare-fun m!750549 () Bool)

(assert (=> b!808409 m!750549))

(declare-fun m!750551 () Bool)

(assert (=> d!103749 m!750551))

(declare-fun m!750553 () Bool)

(assert (=> d!103749 m!750553))

(assert (=> d!103749 m!750459))

(declare-fun m!750555 () Bool)

(assert (=> d!103749 m!750555))

(declare-fun m!750557 () Bool)

(assert (=> d!103749 m!750557))

(assert (=> d!103749 m!750555))

(declare-fun m!750559 () Bool)

(assert (=> d!103749 m!750559))

(assert (=> b!808301 d!103749))

(declare-fun b!808457 () Bool)

(declare-fun e!447536 () Bool)

(declare-fun call!35391 () Bool)

(assert (=> b!808457 (= e!447536 call!35391)))

(declare-fun bm!35388 () Bool)

(declare-fun c!88408 () Bool)

(assert (=> bm!35388 (= call!35391 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88408 (Cons!15021 (select (arr!21062 a!3170) #b00000000000000000000000000000000) Nil!15022) Nil!15022)))))

(declare-fun b!808458 () Bool)

(declare-fun e!447537 () Bool)

(declare-fun contains!4127 (List!15025 (_ BitVec 64)) Bool)

(assert (=> b!808458 (= e!447537 (contains!4127 Nil!15022 (select (arr!21062 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808459 () Bool)

(declare-fun e!447538 () Bool)

(assert (=> b!808459 (= e!447538 e!447536)))

(assert (=> b!808459 (= c!88408 (validKeyInArray!0 (select (arr!21062 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103767 () Bool)

(declare-fun res!552463 () Bool)

(declare-fun e!447539 () Bool)

(assert (=> d!103767 (=> res!552463 e!447539)))

(assert (=> d!103767 (= res!552463 (bvsge #b00000000000000000000000000000000 (size!21483 a!3170)))))

(assert (=> d!103767 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15022) e!447539)))

(declare-fun b!808460 () Bool)

(assert (=> b!808460 (= e!447536 call!35391)))

(declare-fun b!808461 () Bool)

(assert (=> b!808461 (= e!447539 e!447538)))

(declare-fun res!552464 () Bool)

(assert (=> b!808461 (=> (not res!552464) (not e!447538))))

(assert (=> b!808461 (= res!552464 (not e!447537))))

(declare-fun res!552462 () Bool)

(assert (=> b!808461 (=> (not res!552462) (not e!447537))))

(assert (=> b!808461 (= res!552462 (validKeyInArray!0 (select (arr!21062 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103767 (not res!552463)) b!808461))

(assert (= (and b!808461 res!552462) b!808458))

(assert (= (and b!808461 res!552464) b!808459))

(assert (= (and b!808459 c!88408) b!808457))

(assert (= (and b!808459 (not c!88408)) b!808460))

(assert (= (or b!808457 b!808460) bm!35388))

(declare-fun m!750597 () Bool)

(assert (=> bm!35388 m!750597))

(declare-fun m!750599 () Bool)

(assert (=> bm!35388 m!750599))

(assert (=> b!808458 m!750597))

(assert (=> b!808458 m!750597))

(declare-fun m!750601 () Bool)

(assert (=> b!808458 m!750601))

(assert (=> b!808459 m!750597))

(assert (=> b!808459 m!750597))

(declare-fun m!750603 () Bool)

(assert (=> b!808459 m!750603))

(assert (=> b!808461 m!750597))

(assert (=> b!808461 m!750597))

(assert (=> b!808461 m!750603))

(assert (=> b!808295 d!103767))

(declare-fun b!808521 () Bool)

(declare-fun e!447579 () Bool)

(declare-fun call!35400 () Bool)

(assert (=> b!808521 (= e!447579 call!35400)))

(declare-fun bm!35397 () Bool)

(assert (=> bm!35397 (= call!35400 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!808522 () Bool)

(declare-fun e!447580 () Bool)

(assert (=> b!808522 (= e!447580 e!447579)))

(declare-fun c!88429 () Bool)

(assert (=> b!808522 (= c!88429 (validKeyInArray!0 (select (arr!21062 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103781 () Bool)

(declare-fun res!552484 () Bool)

(assert (=> d!103781 (=> res!552484 e!447580)))

(assert (=> d!103781 (= res!552484 (bvsge #b00000000000000000000000000000000 (size!21483 a!3170)))))

(assert (=> d!103781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!447580)))

(declare-fun b!808523 () Bool)

(declare-fun e!447581 () Bool)

(assert (=> b!808523 (= e!447581 call!35400)))

(declare-fun b!808524 () Bool)

(assert (=> b!808524 (= e!447579 e!447581)))

(declare-fun lt!362283 () (_ BitVec 64))

(assert (=> b!808524 (= lt!362283 (select (arr!21062 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27618 0))(
  ( (Unit!27619) )
))
(declare-fun lt!362281 () Unit!27618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43970 (_ BitVec 64) (_ BitVec 32)) Unit!27618)

(assert (=> b!808524 (= lt!362281 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362283 #b00000000000000000000000000000000))))

(assert (=> b!808524 (arrayContainsKey!0 a!3170 lt!362283 #b00000000000000000000000000000000)))

(declare-fun lt!362282 () Unit!27618)

(assert (=> b!808524 (= lt!362282 lt!362281)))

(declare-fun res!552485 () Bool)

(assert (=> b!808524 (= res!552485 (= (seekEntryOrOpen!0 (select (arr!21062 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8653 #b00000000000000000000000000000000)))))

(assert (=> b!808524 (=> (not res!552485) (not e!447581))))

(assert (= (and d!103781 (not res!552484)) b!808522))

(assert (= (and b!808522 c!88429) b!808524))

(assert (= (and b!808522 (not c!88429)) b!808521))

(assert (= (and b!808524 res!552485) b!808523))

(assert (= (or b!808523 b!808521) bm!35397))

(declare-fun m!750660 () Bool)

(assert (=> bm!35397 m!750660))

(assert (=> b!808522 m!750597))

(assert (=> b!808522 m!750597))

(assert (=> b!808522 m!750603))

(assert (=> b!808524 m!750597))

(declare-fun m!750667 () Bool)

(assert (=> b!808524 m!750667))

(declare-fun m!750671 () Bool)

(assert (=> b!808524 m!750671))

(assert (=> b!808524 m!750597))

(declare-fun m!750673 () Bool)

(assert (=> b!808524 m!750673))

(assert (=> b!808305 d!103781))

(declare-fun b!808525 () Bool)

(declare-fun e!447584 () SeekEntryResult!8653)

(declare-fun e!447583 () SeekEntryResult!8653)

(assert (=> b!808525 (= e!447584 e!447583)))

(declare-fun lt!362284 () (_ BitVec 64))

(declare-fun lt!362285 () SeekEntryResult!8653)

(assert (=> b!808525 (= lt!362284 (select (arr!21062 lt!362201) (index!36982 lt!362285)))))

(declare-fun c!88431 () Bool)

(assert (=> b!808525 (= c!88431 (= lt!362284 lt!362199))))

(declare-fun b!808526 () Bool)

(declare-fun e!447582 () SeekEntryResult!8653)

(assert (=> b!808526 (= e!447582 (MissingZero!8653 (index!36982 lt!362285)))))

(declare-fun b!808527 () Bool)

(declare-fun c!88430 () Bool)

(assert (=> b!808527 (= c!88430 (= lt!362284 #b0000000000000000000000000000000000000000000000000000000000000000))))

