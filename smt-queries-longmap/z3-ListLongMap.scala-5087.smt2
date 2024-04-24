; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69200 () Bool)

(assert start!69200)

(declare-fun b!806307 () Bool)

(declare-fun res!550283 () Bool)

(declare-fun e!446614 () Bool)

(assert (=> b!806307 (=> (not res!550283) (not e!446614))))

(declare-datatypes ((array!43822 0))(
  ( (array!43823 (arr!20986 (Array (_ BitVec 32) (_ BitVec 64))) (size!21406 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43822)

(declare-datatypes ((List!14856 0))(
  ( (Nil!14853) (Cons!14852 (h!15987 (_ BitVec 64)) (t!21163 List!14856)) )
))
(declare-fun arrayNoDuplicates!0 (array!43822 (_ BitVec 32) List!14856) Bool)

(assert (=> b!806307 (= res!550283 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14853))))

(declare-fun b!806308 () Bool)

(declare-fun res!550279 () Bool)

(assert (=> b!806308 (=> (not res!550279) (not e!446614))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43822 (_ BitVec 32)) Bool)

(assert (=> b!806308 (= res!550279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806309 () Bool)

(declare-fun e!446611 () Bool)

(assert (=> b!806309 (= e!446611 e!446614)))

(declare-fun res!550280 () Bool)

(assert (=> b!806309 (=> (not res!550280) (not e!446614))))

(declare-datatypes ((SeekEntryResult!8533 0))(
  ( (MissingZero!8533 (index!36500 (_ BitVec 32))) (Found!8533 (index!36501 (_ BitVec 32))) (Intermediate!8533 (undefined!9345 Bool) (index!36502 (_ BitVec 32)) (x!67481 (_ BitVec 32))) (Undefined!8533) (MissingVacant!8533 (index!36503 (_ BitVec 32))) )
))
(declare-fun lt!360978 () SeekEntryResult!8533)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806309 (= res!550280 (or (= lt!360978 (MissingZero!8533 i!1163)) (= lt!360978 (MissingVacant!8533 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43822 (_ BitVec 32)) SeekEntryResult!8533)

(assert (=> b!806309 (= lt!360978 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806310 () Bool)

(declare-fun res!550286 () Bool)

(assert (=> b!806310 (=> (not res!550286) (not e!446611))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806310 (= res!550286 (validKeyInArray!0 (select (arr!20986 a!3170) j!153)))))

(declare-fun b!806311 () Bool)

(declare-fun res!550278 () Bool)

(assert (=> b!806311 (=> (not res!550278) (not e!446611))))

(assert (=> b!806311 (= res!550278 (and (= (size!21406 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21406 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21406 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!550285 () Bool)

(assert (=> start!69200 (=> (not res!550285) (not e!446611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69200 (= res!550285 (validMask!0 mask!3266))))

(assert (=> start!69200 e!446611))

(assert (=> start!69200 true))

(declare-fun array_inv!16845 (array!43822) Bool)

(assert (=> start!69200 (array_inv!16845 a!3170)))

(declare-fun b!806312 () Bool)

(declare-fun res!550284 () Bool)

(assert (=> b!806312 (=> (not res!550284) (not e!446611))))

(declare-fun arrayContainsKey!0 (array!43822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806312 (= res!550284 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806313 () Bool)

(declare-fun e!446612 () Bool)

(assert (=> b!806313 (= e!446614 e!446612)))

(declare-fun res!550287 () Bool)

(assert (=> b!806313 (=> (not res!550287) (not e!446612))))

(declare-fun lt!360982 () SeekEntryResult!8533)

(declare-fun lt!360981 () SeekEntryResult!8533)

(assert (=> b!806313 (= res!550287 (= lt!360982 lt!360981))))

(declare-fun lt!360983 () array!43822)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360977 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43822 (_ BitVec 32)) SeekEntryResult!8533)

(assert (=> b!806313 (= lt!360981 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360977 lt!360983 mask!3266))))

(assert (=> b!806313 (= lt!360982 (seekEntryOrOpen!0 lt!360977 lt!360983 mask!3266))))

(assert (=> b!806313 (= lt!360977 (select (store (arr!20986 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806313 (= lt!360983 (array!43823 (store (arr!20986 a!3170) i!1163 k0!2044) (size!21406 a!3170)))))

(declare-fun lt!360979 () SeekEntryResult!8533)

(declare-fun lt!360980 () SeekEntryResult!8533)

(declare-fun b!806314 () Bool)

(assert (=> b!806314 (= e!446612 (and (= lt!360979 lt!360980) (= lt!360980 (Found!8533 j!153)) (= (select (arr!20986 a!3170) index!1236) (select (arr!20986 a!3170) j!153)) (not (= lt!360981 (Found!8533 index!1236)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806314 (= lt!360980 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20986 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806314 (= lt!360979 (seekEntryOrOpen!0 (select (arr!20986 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806315 () Bool)

(declare-fun res!550282 () Bool)

(assert (=> b!806315 (=> (not res!550282) (not e!446614))))

(assert (=> b!806315 (= res!550282 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21406 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20986 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21406 a!3170)) (= (select (arr!20986 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806316 () Bool)

(declare-fun res!550281 () Bool)

(assert (=> b!806316 (=> (not res!550281) (not e!446611))))

(assert (=> b!806316 (= res!550281 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69200 res!550285) b!806311))

(assert (= (and b!806311 res!550278) b!806310))

(assert (= (and b!806310 res!550286) b!806316))

(assert (= (and b!806316 res!550281) b!806312))

(assert (= (and b!806312 res!550284) b!806309))

(assert (= (and b!806309 res!550280) b!806308))

(assert (= (and b!806308 res!550279) b!806307))

(assert (= (and b!806307 res!550283) b!806315))

(assert (= (and b!806315 res!550282) b!806313))

(assert (= (and b!806313 res!550287) b!806314))

(declare-fun m!748621 () Bool)

(assert (=> b!806313 m!748621))

(declare-fun m!748623 () Bool)

(assert (=> b!806313 m!748623))

(declare-fun m!748625 () Bool)

(assert (=> b!806313 m!748625))

(declare-fun m!748627 () Bool)

(assert (=> b!806313 m!748627))

(declare-fun m!748629 () Bool)

(assert (=> b!806308 m!748629))

(declare-fun m!748631 () Bool)

(assert (=> b!806307 m!748631))

(declare-fun m!748633 () Bool)

(assert (=> start!69200 m!748633))

(declare-fun m!748635 () Bool)

(assert (=> start!69200 m!748635))

(declare-fun m!748637 () Bool)

(assert (=> b!806315 m!748637))

(declare-fun m!748639 () Bool)

(assert (=> b!806315 m!748639))

(declare-fun m!748641 () Bool)

(assert (=> b!806314 m!748641))

(declare-fun m!748643 () Bool)

(assert (=> b!806314 m!748643))

(assert (=> b!806314 m!748643))

(declare-fun m!748645 () Bool)

(assert (=> b!806314 m!748645))

(assert (=> b!806314 m!748643))

(declare-fun m!748647 () Bool)

(assert (=> b!806314 m!748647))

(declare-fun m!748649 () Bool)

(assert (=> b!806309 m!748649))

(declare-fun m!748651 () Bool)

(assert (=> b!806312 m!748651))

(declare-fun m!748653 () Bool)

(assert (=> b!806316 m!748653))

(assert (=> b!806310 m!748643))

(assert (=> b!806310 m!748643))

(declare-fun m!748655 () Bool)

(assert (=> b!806310 m!748655))

(check-sat (not b!806312) (not b!806309) (not b!806308) (not b!806310) (not b!806307) (not start!69200) (not b!806313) (not b!806316) (not b!806314))
(check-sat)
(get-model)

(declare-fun d!103873 () Bool)

(declare-fun res!550352 () Bool)

(declare-fun e!446643 () Bool)

(assert (=> d!103873 (=> res!550352 e!446643)))

(assert (=> d!103873 (= res!550352 (= (select (arr!20986 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103873 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!446643)))

(declare-fun b!806381 () Bool)

(declare-fun e!446644 () Bool)

(assert (=> b!806381 (= e!446643 e!446644)))

(declare-fun res!550353 () Bool)

(assert (=> b!806381 (=> (not res!550353) (not e!446644))))

(assert (=> b!806381 (= res!550353 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21406 a!3170)))))

(declare-fun b!806382 () Bool)

(assert (=> b!806382 (= e!446644 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103873 (not res!550352)) b!806381))

(assert (= (and b!806381 res!550353) b!806382))

(declare-fun m!748729 () Bool)

(assert (=> d!103873 m!748729))

(declare-fun m!748731 () Bool)

(assert (=> b!806382 m!748731))

(assert (=> b!806312 d!103873))

(declare-fun d!103875 () Bool)

(assert (=> d!103875 (= (validKeyInArray!0 (select (arr!20986 a!3170) j!153)) (and (not (= (select (arr!20986 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20986 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!806310 d!103875))

(declare-fun d!103877 () Bool)

(assert (=> d!103877 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!806316 d!103877))

(declare-fun d!103879 () Bool)

(assert (=> d!103879 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69200 d!103879))

(declare-fun d!103881 () Bool)

(assert (=> d!103881 (= (array_inv!16845 a!3170) (bvsge (size!21406 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69200 d!103881))

(declare-fun b!806395 () Bool)

(declare-fun e!446651 () SeekEntryResult!8533)

(assert (=> b!806395 (= e!446651 (Found!8533 index!1236))))

(declare-fun b!806396 () Bool)

(declare-fun c!88435 () Bool)

(declare-fun lt!361031 () (_ BitVec 64))

(assert (=> b!806396 (= c!88435 (= lt!361031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446653 () SeekEntryResult!8533)

(assert (=> b!806396 (= e!446651 e!446653)))

(declare-fun b!806397 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806397 (= e!446653 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantBefore!23 (select (arr!20986 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806398 () Bool)

(assert (=> b!806398 (= e!446653 (MissingVacant!8533 vacantBefore!23))))

(declare-fun lt!361030 () SeekEntryResult!8533)

(declare-fun d!103883 () Bool)

(get-info :version)

(assert (=> d!103883 (and (or ((_ is Undefined!8533) lt!361030) (not ((_ is Found!8533) lt!361030)) (and (bvsge (index!36501 lt!361030) #b00000000000000000000000000000000) (bvslt (index!36501 lt!361030) (size!21406 a!3170)))) (or ((_ is Undefined!8533) lt!361030) ((_ is Found!8533) lt!361030) (not ((_ is MissingVacant!8533) lt!361030)) (not (= (index!36503 lt!361030) vacantBefore!23)) (and (bvsge (index!36503 lt!361030) #b00000000000000000000000000000000) (bvslt (index!36503 lt!361030) (size!21406 a!3170)))) (or ((_ is Undefined!8533) lt!361030) (ite ((_ is Found!8533) lt!361030) (= (select (arr!20986 a!3170) (index!36501 lt!361030)) (select (arr!20986 a!3170) j!153)) (and ((_ is MissingVacant!8533) lt!361030) (= (index!36503 lt!361030) vacantBefore!23) (= (select (arr!20986 a!3170) (index!36503 lt!361030)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!446652 () SeekEntryResult!8533)

(assert (=> d!103883 (= lt!361030 e!446652)))

(declare-fun c!88436 () Bool)

(assert (=> d!103883 (= c!88436 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103883 (= lt!361031 (select (arr!20986 a!3170) index!1236))))

(assert (=> d!103883 (validMask!0 mask!3266)))

(assert (=> d!103883 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20986 a!3170) j!153) a!3170 mask!3266) lt!361030)))

(declare-fun b!806399 () Bool)

(assert (=> b!806399 (= e!446652 e!446651)))

(declare-fun c!88434 () Bool)

(assert (=> b!806399 (= c!88434 (= lt!361031 (select (arr!20986 a!3170) j!153)))))

(declare-fun b!806400 () Bool)

(assert (=> b!806400 (= e!446652 Undefined!8533)))

(assert (= (and d!103883 c!88436) b!806400))

(assert (= (and d!103883 (not c!88436)) b!806399))

(assert (= (and b!806399 c!88434) b!806395))

(assert (= (and b!806399 (not c!88434)) b!806396))

(assert (= (and b!806396 c!88435) b!806398))

(assert (= (and b!806396 (not c!88435)) b!806397))

(declare-fun m!748733 () Bool)

(assert (=> b!806397 m!748733))

(assert (=> b!806397 m!748733))

(assert (=> b!806397 m!748643))

(declare-fun m!748735 () Bool)

(assert (=> b!806397 m!748735))

(declare-fun m!748737 () Bool)

(assert (=> d!103883 m!748737))

(declare-fun m!748739 () Bool)

(assert (=> d!103883 m!748739))

(assert (=> d!103883 m!748641))

(assert (=> d!103883 m!748633))

(assert (=> b!806314 d!103883))

(declare-fun b!806443 () Bool)

(declare-fun c!88459 () Bool)

(declare-fun lt!361049 () (_ BitVec 64))

(assert (=> b!806443 (= c!88459 (= lt!361049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446677 () SeekEntryResult!8533)

(declare-fun e!446675 () SeekEntryResult!8533)

(assert (=> b!806443 (= e!446677 e!446675)))

(declare-fun b!806444 () Bool)

(declare-fun e!446676 () SeekEntryResult!8533)

(assert (=> b!806444 (= e!446676 e!446677)))

(declare-fun lt!361048 () SeekEntryResult!8533)

(assert (=> b!806444 (= lt!361049 (select (arr!20986 a!3170) (index!36502 lt!361048)))))

(declare-fun c!88460 () Bool)

(assert (=> b!806444 (= c!88460 (= lt!361049 (select (arr!20986 a!3170) j!153)))))

(declare-fun b!806445 () Bool)

(assert (=> b!806445 (= e!446676 Undefined!8533)))

(declare-fun b!806447 () Bool)

(assert (=> b!806447 (= e!446675 (seekKeyOrZeroReturnVacant!0 (x!67481 lt!361048) (index!36502 lt!361048) (index!36502 lt!361048) (select (arr!20986 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806448 () Bool)

(assert (=> b!806448 (= e!446675 (MissingZero!8533 (index!36502 lt!361048)))))

(declare-fun b!806446 () Bool)

(assert (=> b!806446 (= e!446677 (Found!8533 (index!36502 lt!361048)))))

(declare-fun d!103885 () Bool)

(declare-fun lt!361050 () SeekEntryResult!8533)

(assert (=> d!103885 (and (or ((_ is Undefined!8533) lt!361050) (not ((_ is Found!8533) lt!361050)) (and (bvsge (index!36501 lt!361050) #b00000000000000000000000000000000) (bvslt (index!36501 lt!361050) (size!21406 a!3170)))) (or ((_ is Undefined!8533) lt!361050) ((_ is Found!8533) lt!361050) (not ((_ is MissingZero!8533) lt!361050)) (and (bvsge (index!36500 lt!361050) #b00000000000000000000000000000000) (bvslt (index!36500 lt!361050) (size!21406 a!3170)))) (or ((_ is Undefined!8533) lt!361050) ((_ is Found!8533) lt!361050) ((_ is MissingZero!8533) lt!361050) (not ((_ is MissingVacant!8533) lt!361050)) (and (bvsge (index!36503 lt!361050) #b00000000000000000000000000000000) (bvslt (index!36503 lt!361050) (size!21406 a!3170)))) (or ((_ is Undefined!8533) lt!361050) (ite ((_ is Found!8533) lt!361050) (= (select (arr!20986 a!3170) (index!36501 lt!361050)) (select (arr!20986 a!3170) j!153)) (ite ((_ is MissingZero!8533) lt!361050) (= (select (arr!20986 a!3170) (index!36500 lt!361050)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8533) lt!361050) (= (select (arr!20986 a!3170) (index!36503 lt!361050)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103885 (= lt!361050 e!446676)))

(declare-fun c!88458 () Bool)

(assert (=> d!103885 (= c!88458 (and ((_ is Intermediate!8533) lt!361048) (undefined!9345 lt!361048)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43822 (_ BitVec 32)) SeekEntryResult!8533)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103885 (= lt!361048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20986 a!3170) j!153) mask!3266) (select (arr!20986 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103885 (validMask!0 mask!3266)))

(assert (=> d!103885 (= (seekEntryOrOpen!0 (select (arr!20986 a!3170) j!153) a!3170 mask!3266) lt!361050)))

(assert (= (and d!103885 c!88458) b!806445))

(assert (= (and d!103885 (not c!88458)) b!806444))

(assert (= (and b!806444 c!88460) b!806446))

(assert (= (and b!806444 (not c!88460)) b!806443))

(assert (= (and b!806443 c!88459) b!806448))

(assert (= (and b!806443 (not c!88459)) b!806447))

(declare-fun m!748749 () Bool)

(assert (=> b!806444 m!748749))

(assert (=> b!806447 m!748643))

(declare-fun m!748751 () Bool)

(assert (=> b!806447 m!748751))

(declare-fun m!748753 () Bool)

(assert (=> d!103885 m!748753))

(assert (=> d!103885 m!748643))

(declare-fun m!748755 () Bool)

(assert (=> d!103885 m!748755))

(assert (=> d!103885 m!748633))

(declare-fun m!748757 () Bool)

(assert (=> d!103885 m!748757))

(declare-fun m!748759 () Bool)

(assert (=> d!103885 m!748759))

(assert (=> d!103885 m!748755))

(assert (=> d!103885 m!748643))

(declare-fun m!748761 () Bool)

(assert (=> d!103885 m!748761))

(assert (=> b!806314 d!103885))

(declare-fun b!806449 () Bool)

(declare-fun c!88462 () Bool)

(declare-fun lt!361052 () (_ BitVec 64))

(assert (=> b!806449 (= c!88462 (= lt!361052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446680 () SeekEntryResult!8533)

(declare-fun e!446678 () SeekEntryResult!8533)

(assert (=> b!806449 (= e!446680 e!446678)))

(declare-fun b!806450 () Bool)

(declare-fun e!446679 () SeekEntryResult!8533)

(assert (=> b!806450 (= e!446679 e!446680)))

(declare-fun lt!361051 () SeekEntryResult!8533)

(assert (=> b!806450 (= lt!361052 (select (arr!20986 a!3170) (index!36502 lt!361051)))))

(declare-fun c!88463 () Bool)

(assert (=> b!806450 (= c!88463 (= lt!361052 k0!2044))))

(declare-fun b!806451 () Bool)

(assert (=> b!806451 (= e!446679 Undefined!8533)))

(declare-fun b!806453 () Bool)

(assert (=> b!806453 (= e!446678 (seekKeyOrZeroReturnVacant!0 (x!67481 lt!361051) (index!36502 lt!361051) (index!36502 lt!361051) k0!2044 a!3170 mask!3266))))

(declare-fun b!806454 () Bool)

(assert (=> b!806454 (= e!446678 (MissingZero!8533 (index!36502 lt!361051)))))

(declare-fun b!806452 () Bool)

(assert (=> b!806452 (= e!446680 (Found!8533 (index!36502 lt!361051)))))

(declare-fun d!103895 () Bool)

(declare-fun lt!361053 () SeekEntryResult!8533)

(assert (=> d!103895 (and (or ((_ is Undefined!8533) lt!361053) (not ((_ is Found!8533) lt!361053)) (and (bvsge (index!36501 lt!361053) #b00000000000000000000000000000000) (bvslt (index!36501 lt!361053) (size!21406 a!3170)))) (or ((_ is Undefined!8533) lt!361053) ((_ is Found!8533) lt!361053) (not ((_ is MissingZero!8533) lt!361053)) (and (bvsge (index!36500 lt!361053) #b00000000000000000000000000000000) (bvslt (index!36500 lt!361053) (size!21406 a!3170)))) (or ((_ is Undefined!8533) lt!361053) ((_ is Found!8533) lt!361053) ((_ is MissingZero!8533) lt!361053) (not ((_ is MissingVacant!8533) lt!361053)) (and (bvsge (index!36503 lt!361053) #b00000000000000000000000000000000) (bvslt (index!36503 lt!361053) (size!21406 a!3170)))) (or ((_ is Undefined!8533) lt!361053) (ite ((_ is Found!8533) lt!361053) (= (select (arr!20986 a!3170) (index!36501 lt!361053)) k0!2044) (ite ((_ is MissingZero!8533) lt!361053) (= (select (arr!20986 a!3170) (index!36500 lt!361053)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8533) lt!361053) (= (select (arr!20986 a!3170) (index!36503 lt!361053)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103895 (= lt!361053 e!446679)))

(declare-fun c!88461 () Bool)

(assert (=> d!103895 (= c!88461 (and ((_ is Intermediate!8533) lt!361051) (undefined!9345 lt!361051)))))

(assert (=> d!103895 (= lt!361051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103895 (validMask!0 mask!3266)))

(assert (=> d!103895 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!361053)))

(assert (= (and d!103895 c!88461) b!806451))

(assert (= (and d!103895 (not c!88461)) b!806450))

(assert (= (and b!806450 c!88463) b!806452))

(assert (= (and b!806450 (not c!88463)) b!806449))

(assert (= (and b!806449 c!88462) b!806454))

(assert (= (and b!806449 (not c!88462)) b!806453))

(declare-fun m!748763 () Bool)

(assert (=> b!806450 m!748763))

(declare-fun m!748765 () Bool)

(assert (=> b!806453 m!748765))

(declare-fun m!748767 () Bool)

(assert (=> d!103895 m!748767))

(declare-fun m!748769 () Bool)

(assert (=> d!103895 m!748769))

(assert (=> d!103895 m!748633))

(declare-fun m!748771 () Bool)

(assert (=> d!103895 m!748771))

(declare-fun m!748773 () Bool)

(assert (=> d!103895 m!748773))

(assert (=> d!103895 m!748769))

(declare-fun m!748775 () Bool)

(assert (=> d!103895 m!748775))

(assert (=> b!806309 d!103895))

(declare-fun b!806471 () Bool)

(declare-fun e!446695 () Bool)

(declare-fun call!35394 () Bool)

(assert (=> b!806471 (= e!446695 call!35394)))

(declare-fun d!103897 () Bool)

(declare-fun res!550361 () Bool)

(declare-fun e!446694 () Bool)

(assert (=> d!103897 (=> res!550361 e!446694)))

(assert (=> d!103897 (= res!550361 (bvsge #b00000000000000000000000000000000 (size!21406 a!3170)))))

(assert (=> d!103897 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14853) e!446694)))

(declare-fun b!806472 () Bool)

(declare-fun e!446693 () Bool)

(assert (=> b!806472 (= e!446694 e!446693)))

(declare-fun res!550360 () Bool)

(assert (=> b!806472 (=> (not res!550360) (not e!446693))))

(declare-fun e!446692 () Bool)

(assert (=> b!806472 (= res!550360 (not e!446692))))

(declare-fun res!550362 () Bool)

(assert (=> b!806472 (=> (not res!550362) (not e!446692))))

(assert (=> b!806472 (= res!550362 (validKeyInArray!0 (select (arr!20986 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!806473 () Bool)

(declare-fun contains!4099 (List!14856 (_ BitVec 64)) Bool)

(assert (=> b!806473 (= e!446692 (contains!4099 Nil!14853 (select (arr!20986 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!806474 () Bool)

(assert (=> b!806474 (= e!446693 e!446695)))

(declare-fun c!88469 () Bool)

(assert (=> b!806474 (= c!88469 (validKeyInArray!0 (select (arr!20986 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!806475 () Bool)

(assert (=> b!806475 (= e!446695 call!35394)))

(declare-fun bm!35391 () Bool)

(assert (=> bm!35391 (= call!35394 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88469 (Cons!14852 (select (arr!20986 a!3170) #b00000000000000000000000000000000) Nil!14853) Nil!14853)))))

(assert (= (and d!103897 (not res!550361)) b!806472))

(assert (= (and b!806472 res!550362) b!806473))

(assert (= (and b!806472 res!550360) b!806474))

(assert (= (and b!806474 c!88469) b!806475))

(assert (= (and b!806474 (not c!88469)) b!806471))

(assert (= (or b!806475 b!806471) bm!35391))

(assert (=> b!806472 m!748729))

(assert (=> b!806472 m!748729))

(declare-fun m!748787 () Bool)

(assert (=> b!806472 m!748787))

(assert (=> b!806473 m!748729))

(assert (=> b!806473 m!748729))

(declare-fun m!748789 () Bool)

(assert (=> b!806473 m!748789))

(assert (=> b!806474 m!748729))

(assert (=> b!806474 m!748729))

(assert (=> b!806474 m!748787))

(assert (=> bm!35391 m!748729))

(declare-fun m!748791 () Bool)

(assert (=> bm!35391 m!748791))

(assert (=> b!806307 d!103897))

(declare-fun b!806476 () Bool)

(declare-fun e!446696 () SeekEntryResult!8533)

(assert (=> b!806476 (= e!446696 (Found!8533 index!1236))))

(declare-fun b!806477 () Bool)

(declare-fun c!88471 () Bool)

(declare-fun lt!361057 () (_ BitVec 64))

(assert (=> b!806477 (= c!88471 (= lt!361057 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446698 () SeekEntryResult!8533)

(assert (=> b!806477 (= e!446696 e!446698)))

(declare-fun b!806478 () Bool)

(assert (=> b!806478 (= e!446698 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!360977 lt!360983 mask!3266))))

(declare-fun b!806479 () Bool)

(assert (=> b!806479 (= e!446698 (MissingVacant!8533 vacantAfter!23))))

(declare-fun d!103901 () Bool)

(declare-fun lt!361056 () SeekEntryResult!8533)

(assert (=> d!103901 (and (or ((_ is Undefined!8533) lt!361056) (not ((_ is Found!8533) lt!361056)) (and (bvsge (index!36501 lt!361056) #b00000000000000000000000000000000) (bvslt (index!36501 lt!361056) (size!21406 lt!360983)))) (or ((_ is Undefined!8533) lt!361056) ((_ is Found!8533) lt!361056) (not ((_ is MissingVacant!8533) lt!361056)) (not (= (index!36503 lt!361056) vacantAfter!23)) (and (bvsge (index!36503 lt!361056) #b00000000000000000000000000000000) (bvslt (index!36503 lt!361056) (size!21406 lt!360983)))) (or ((_ is Undefined!8533) lt!361056) (ite ((_ is Found!8533) lt!361056) (= (select (arr!20986 lt!360983) (index!36501 lt!361056)) lt!360977) (and ((_ is MissingVacant!8533) lt!361056) (= (index!36503 lt!361056) vacantAfter!23) (= (select (arr!20986 lt!360983) (index!36503 lt!361056)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!446697 () SeekEntryResult!8533)

(assert (=> d!103901 (= lt!361056 e!446697)))

(declare-fun c!88472 () Bool)

(assert (=> d!103901 (= c!88472 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103901 (= lt!361057 (select (arr!20986 lt!360983) index!1236))))

(assert (=> d!103901 (validMask!0 mask!3266)))

(assert (=> d!103901 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360977 lt!360983 mask!3266) lt!361056)))

(declare-fun b!806480 () Bool)

(assert (=> b!806480 (= e!446697 e!446696)))

(declare-fun c!88470 () Bool)

(assert (=> b!806480 (= c!88470 (= lt!361057 lt!360977))))

(declare-fun b!806481 () Bool)

(assert (=> b!806481 (= e!446697 Undefined!8533)))

(assert (= (and d!103901 c!88472) b!806481))

(assert (= (and d!103901 (not c!88472)) b!806480))

(assert (= (and b!806480 c!88470) b!806476))

(assert (= (and b!806480 (not c!88470)) b!806477))

(assert (= (and b!806477 c!88471) b!806479))

(assert (= (and b!806477 (not c!88471)) b!806478))

(assert (=> b!806478 m!748733))

(assert (=> b!806478 m!748733))

(declare-fun m!748793 () Bool)

(assert (=> b!806478 m!748793))

(declare-fun m!748795 () Bool)

(assert (=> d!103901 m!748795))

(declare-fun m!748797 () Bool)

(assert (=> d!103901 m!748797))

(declare-fun m!748799 () Bool)

(assert (=> d!103901 m!748799))

(assert (=> d!103901 m!748633))

(assert (=> b!806313 d!103901))

(declare-fun b!806482 () Bool)

(declare-fun c!88474 () Bool)

(declare-fun lt!361059 () (_ BitVec 64))

(assert (=> b!806482 (= c!88474 (= lt!361059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446701 () SeekEntryResult!8533)

(declare-fun e!446699 () SeekEntryResult!8533)

(assert (=> b!806482 (= e!446701 e!446699)))

(declare-fun b!806483 () Bool)

(declare-fun e!446700 () SeekEntryResult!8533)

(assert (=> b!806483 (= e!446700 e!446701)))

(declare-fun lt!361058 () SeekEntryResult!8533)

(assert (=> b!806483 (= lt!361059 (select (arr!20986 lt!360983) (index!36502 lt!361058)))))

(declare-fun c!88475 () Bool)

(assert (=> b!806483 (= c!88475 (= lt!361059 lt!360977))))

(declare-fun b!806484 () Bool)

(assert (=> b!806484 (= e!446700 Undefined!8533)))

(declare-fun b!806486 () Bool)

(assert (=> b!806486 (= e!446699 (seekKeyOrZeroReturnVacant!0 (x!67481 lt!361058) (index!36502 lt!361058) (index!36502 lt!361058) lt!360977 lt!360983 mask!3266))))

(declare-fun b!806487 () Bool)

(assert (=> b!806487 (= e!446699 (MissingZero!8533 (index!36502 lt!361058)))))

(declare-fun b!806485 () Bool)

(assert (=> b!806485 (= e!446701 (Found!8533 (index!36502 lt!361058)))))

(declare-fun d!103903 () Bool)

(declare-fun lt!361060 () SeekEntryResult!8533)

(assert (=> d!103903 (and (or ((_ is Undefined!8533) lt!361060) (not ((_ is Found!8533) lt!361060)) (and (bvsge (index!36501 lt!361060) #b00000000000000000000000000000000) (bvslt (index!36501 lt!361060) (size!21406 lt!360983)))) (or ((_ is Undefined!8533) lt!361060) ((_ is Found!8533) lt!361060) (not ((_ is MissingZero!8533) lt!361060)) (and (bvsge (index!36500 lt!361060) #b00000000000000000000000000000000) (bvslt (index!36500 lt!361060) (size!21406 lt!360983)))) (or ((_ is Undefined!8533) lt!361060) ((_ is Found!8533) lt!361060) ((_ is MissingZero!8533) lt!361060) (not ((_ is MissingVacant!8533) lt!361060)) (and (bvsge (index!36503 lt!361060) #b00000000000000000000000000000000) (bvslt (index!36503 lt!361060) (size!21406 lt!360983)))) (or ((_ is Undefined!8533) lt!361060) (ite ((_ is Found!8533) lt!361060) (= (select (arr!20986 lt!360983) (index!36501 lt!361060)) lt!360977) (ite ((_ is MissingZero!8533) lt!361060) (= (select (arr!20986 lt!360983) (index!36500 lt!361060)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8533) lt!361060) (= (select (arr!20986 lt!360983) (index!36503 lt!361060)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103903 (= lt!361060 e!446700)))

(declare-fun c!88473 () Bool)

(assert (=> d!103903 (= c!88473 (and ((_ is Intermediate!8533) lt!361058) (undefined!9345 lt!361058)))))

(assert (=> d!103903 (= lt!361058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!360977 mask!3266) lt!360977 lt!360983 mask!3266))))

(assert (=> d!103903 (validMask!0 mask!3266)))

(assert (=> d!103903 (= (seekEntryOrOpen!0 lt!360977 lt!360983 mask!3266) lt!361060)))

(assert (= (and d!103903 c!88473) b!806484))

(assert (= (and d!103903 (not c!88473)) b!806483))

(assert (= (and b!806483 c!88475) b!806485))

(assert (= (and b!806483 (not c!88475)) b!806482))

(assert (= (and b!806482 c!88474) b!806487))

(assert (= (and b!806482 (not c!88474)) b!806486))

(declare-fun m!748801 () Bool)

(assert (=> b!806483 m!748801))

(declare-fun m!748803 () Bool)

(assert (=> b!806486 m!748803))

(declare-fun m!748805 () Bool)

(assert (=> d!103903 m!748805))

(declare-fun m!748807 () Bool)

(assert (=> d!103903 m!748807))

(assert (=> d!103903 m!748633))

(declare-fun m!748809 () Bool)

(assert (=> d!103903 m!748809))

(declare-fun m!748811 () Bool)

(assert (=> d!103903 m!748811))

(assert (=> d!103903 m!748807))

(declare-fun m!748813 () Bool)

(assert (=> d!103903 m!748813))

(assert (=> b!806313 d!103903))

(declare-fun b!806520 () Bool)

(declare-fun e!446721 () Bool)

(declare-fun e!446722 () Bool)

(assert (=> b!806520 (= e!446721 e!446722)))

(declare-fun lt!361081 () (_ BitVec 64))

(assert (=> b!806520 (= lt!361081 (select (arr!20986 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27589 0))(
  ( (Unit!27590) )
))
(declare-fun lt!361080 () Unit!27589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43822 (_ BitVec 64) (_ BitVec 32)) Unit!27589)

(assert (=> b!806520 (= lt!361080 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!361081 #b00000000000000000000000000000000))))

(assert (=> b!806520 (arrayContainsKey!0 a!3170 lt!361081 #b00000000000000000000000000000000)))

(declare-fun lt!361079 () Unit!27589)

(assert (=> b!806520 (= lt!361079 lt!361080)))

(declare-fun res!550367 () Bool)

(assert (=> b!806520 (= res!550367 (= (seekEntryOrOpen!0 (select (arr!20986 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8533 #b00000000000000000000000000000000)))))

(assert (=> b!806520 (=> (not res!550367) (not e!446722))))

(declare-fun b!806521 () Bool)

(declare-fun call!35397 () Bool)

(assert (=> b!806521 (= e!446722 call!35397)))

(declare-fun b!806522 () Bool)

(assert (=> b!806522 (= e!446721 call!35397)))

(declare-fun b!806523 () Bool)

(declare-fun e!446720 () Bool)

(assert (=> b!806523 (= e!446720 e!446721)))

(declare-fun c!88490 () Bool)

(assert (=> b!806523 (= c!88490 (validKeyInArray!0 (select (arr!20986 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103905 () Bool)

(declare-fun res!550368 () Bool)

(assert (=> d!103905 (=> res!550368 e!446720)))

(assert (=> d!103905 (= res!550368 (bvsge #b00000000000000000000000000000000 (size!21406 a!3170)))))

(assert (=> d!103905 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!446720)))

(declare-fun bm!35394 () Bool)

(assert (=> bm!35394 (= call!35397 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(assert (= (and d!103905 (not res!550368)) b!806523))

(assert (= (and b!806523 c!88490) b!806520))

(assert (= (and b!806523 (not c!88490)) b!806522))

(assert (= (and b!806520 res!550367) b!806521))

(assert (= (or b!806521 b!806522) bm!35394))

(assert (=> b!806520 m!748729))

(declare-fun m!748815 () Bool)

(assert (=> b!806520 m!748815))

(declare-fun m!748817 () Bool)

(assert (=> b!806520 m!748817))

(assert (=> b!806520 m!748729))

(declare-fun m!748819 () Bool)

(assert (=> b!806520 m!748819))

(assert (=> b!806523 m!748729))

(assert (=> b!806523 m!748729))

(assert (=> b!806523 m!748787))

(declare-fun m!748821 () Bool)

(assert (=> bm!35394 m!748821))

(assert (=> b!806308 d!103905))

(check-sat (not b!806478) (not bm!35391) (not bm!35394) (not b!806520) (not d!103901) (not b!806397) (not d!103883) (not d!103903) (not b!806447) (not b!806453) (not b!806486) (not b!806523) (not b!806473) (not d!103895) (not b!806474) (not b!806382) (not b!806472) (not d!103885))
(check-sat)
