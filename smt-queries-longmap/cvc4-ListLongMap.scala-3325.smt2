; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45898 () Bool)

(assert start!45898)

(declare-fun b!508387 () Bool)

(declare-fun e!297411 () Bool)

(declare-fun e!297410 () Bool)

(assert (=> b!508387 (= e!297411 e!297410)))

(declare-fun res!309347 () Bool)

(assert (=> b!508387 (=> (not res!309347) (not e!297410))))

(declare-datatypes ((SeekEntryResult!4174 0))(
  ( (MissingZero!4174 (index!18884 (_ BitVec 32))) (Found!4174 (index!18885 (_ BitVec 32))) (Intermediate!4174 (undefined!4986 Bool) (index!18886 (_ BitVec 32)) (x!47863 (_ BitVec 32))) (Undefined!4174) (MissingVacant!4174 (index!18887 (_ BitVec 32))) )
))
(declare-fun lt!232222 () SeekEntryResult!4174)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508387 (= res!309347 (or (= lt!232222 (MissingZero!4174 i!1204)) (= lt!232222 (MissingVacant!4174 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32654 0))(
  ( (array!32655 (arr!15707 (Array (_ BitVec 32) (_ BitVec 64))) (size!16071 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32654)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32654 (_ BitVec 32)) SeekEntryResult!4174)

(assert (=> b!508387 (= lt!232222 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508388 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508388 (= e!297410 (not (= (seekEntryOrOpen!0 (select (arr!15707 a!3235) j!176) a!3235 mask!3524) (Found!4174 j!176))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32654 (_ BitVec 32)) Bool)

(assert (=> b!508388 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15606 0))(
  ( (Unit!15607) )
))
(declare-fun lt!232221 () Unit!15606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15606)

(assert (=> b!508388 (= lt!232221 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!309350 () Bool)

(assert (=> start!45898 (=> (not res!309350) (not e!297411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45898 (= res!309350 (validMask!0 mask!3524))))

(assert (=> start!45898 e!297411))

(assert (=> start!45898 true))

(declare-fun array_inv!11503 (array!32654) Bool)

(assert (=> start!45898 (array_inv!11503 a!3235)))

(declare-fun b!508389 () Bool)

(declare-fun res!309349 () Bool)

(assert (=> b!508389 (=> (not res!309349) (not e!297410))))

(declare-datatypes ((List!9865 0))(
  ( (Nil!9862) (Cons!9861 (h!10738 (_ BitVec 64)) (t!16093 List!9865)) )
))
(declare-fun arrayNoDuplicates!0 (array!32654 (_ BitVec 32) List!9865) Bool)

(assert (=> b!508389 (= res!309349 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9862))))

(declare-fun b!508390 () Bool)

(declare-fun res!309352 () Bool)

(assert (=> b!508390 (=> (not res!309352) (not e!297411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508390 (= res!309352 (validKeyInArray!0 k!2280))))

(declare-fun b!508391 () Bool)

(declare-fun res!309348 () Bool)

(assert (=> b!508391 (=> (not res!309348) (not e!297411))))

(assert (=> b!508391 (= res!309348 (and (= (size!16071 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16071 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16071 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508392 () Bool)

(declare-fun res!309346 () Bool)

(assert (=> b!508392 (=> (not res!309346) (not e!297411))))

(declare-fun arrayContainsKey!0 (array!32654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508392 (= res!309346 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508393 () Bool)

(declare-fun res!309353 () Bool)

(assert (=> b!508393 (=> (not res!309353) (not e!297411))))

(assert (=> b!508393 (= res!309353 (validKeyInArray!0 (select (arr!15707 a!3235) j!176)))))

(declare-fun b!508394 () Bool)

(declare-fun res!309351 () Bool)

(assert (=> b!508394 (=> (not res!309351) (not e!297410))))

(assert (=> b!508394 (= res!309351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45898 res!309350) b!508391))

(assert (= (and b!508391 res!309348) b!508393))

(assert (= (and b!508393 res!309353) b!508390))

(assert (= (and b!508390 res!309352) b!508392))

(assert (= (and b!508392 res!309346) b!508387))

(assert (= (and b!508387 res!309347) b!508394))

(assert (= (and b!508394 res!309351) b!508389))

(assert (= (and b!508389 res!309349) b!508388))

(declare-fun m!489171 () Bool)

(assert (=> b!508390 m!489171))

(declare-fun m!489173 () Bool)

(assert (=> b!508388 m!489173))

(assert (=> b!508388 m!489173))

(declare-fun m!489175 () Bool)

(assert (=> b!508388 m!489175))

(declare-fun m!489177 () Bool)

(assert (=> b!508388 m!489177))

(declare-fun m!489179 () Bool)

(assert (=> b!508388 m!489179))

(declare-fun m!489181 () Bool)

(assert (=> b!508394 m!489181))

(declare-fun m!489183 () Bool)

(assert (=> b!508389 m!489183))

(assert (=> b!508393 m!489173))

(assert (=> b!508393 m!489173))

(declare-fun m!489185 () Bool)

(assert (=> b!508393 m!489185))

(declare-fun m!489187 () Bool)

(assert (=> start!45898 m!489187))

(declare-fun m!489189 () Bool)

(assert (=> start!45898 m!489189))

(declare-fun m!489191 () Bool)

(assert (=> b!508392 m!489191))

(declare-fun m!489193 () Bool)

(assert (=> b!508387 m!489193))

(push 1)

(assert (not b!508392))

(assert (not b!508389))

(assert (not b!508390))

(assert (not b!508393))

(assert (not start!45898))

(assert (not b!508387))

(assert (not b!508394))

(assert (not b!508388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!508425 () Bool)

(declare-fun e!297432 () Bool)

(declare-fun call!31477 () Bool)

(assert (=> b!508425 (= e!297432 call!31477)))

(declare-fun b!508426 () Bool)

(declare-fun e!297435 () Bool)

(assert (=> b!508426 (= e!297435 e!297432)))

(declare-fun c!59809 () Bool)

(assert (=> b!508426 (= c!59809 (validKeyInArray!0 (select (arr!15707 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31474 () Bool)

(assert (=> bm!31474 (= call!31477 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59809 (Cons!9861 (select (arr!15707 a!3235) #b00000000000000000000000000000000) Nil!9862) Nil!9862)))))

(declare-fun d!78745 () Bool)

(declare-fun res!309366 () Bool)

(declare-fun e!297434 () Bool)

(assert (=> d!78745 (=> res!309366 e!297434)))

(assert (=> d!78745 (= res!309366 (bvsge #b00000000000000000000000000000000 (size!16071 a!3235)))))

(assert (=> d!78745 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9862) e!297434)))

(declare-fun b!508427 () Bool)

(assert (=> b!508427 (= e!297432 call!31477)))

(declare-fun b!508428 () Bool)

(declare-fun e!297433 () Bool)

(declare-fun contains!2719 (List!9865 (_ BitVec 64)) Bool)

(assert (=> b!508428 (= e!297433 (contains!2719 Nil!9862 (select (arr!15707 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!508429 () Bool)

(assert (=> b!508429 (= e!297434 e!297435)))

(declare-fun res!309364 () Bool)

(assert (=> b!508429 (=> (not res!309364) (not e!297435))))

(assert (=> b!508429 (= res!309364 (not e!297433))))

(declare-fun res!309365 () Bool)

(assert (=> b!508429 (=> (not res!309365) (not e!297433))))

(assert (=> b!508429 (= res!309365 (validKeyInArray!0 (select (arr!15707 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78745 (not res!309366)) b!508429))

(assert (= (and b!508429 res!309365) b!508428))

(assert (= (and b!508429 res!309364) b!508426))

(assert (= (and b!508426 c!59809) b!508427))

(assert (= (and b!508426 (not c!59809)) b!508425))

(assert (= (or b!508427 b!508425) bm!31474))

(declare-fun m!489195 () Bool)

(assert (=> b!508426 m!489195))

(assert (=> b!508426 m!489195))

(declare-fun m!489197 () Bool)

(assert (=> b!508426 m!489197))

(assert (=> bm!31474 m!489195))

(declare-fun m!489199 () Bool)

(assert (=> bm!31474 m!489199))

(assert (=> b!508428 m!489195))

(assert (=> b!508428 m!489195))

(declare-fun m!489201 () Bool)

(assert (=> b!508428 m!489201))

(assert (=> b!508429 m!489195))

(assert (=> b!508429 m!489195))

(assert (=> b!508429 m!489197))

(assert (=> b!508389 d!78745))

(declare-fun b!508456 () Bool)

(declare-fun e!297456 () Bool)

(declare-fun e!297455 () Bool)

(assert (=> b!508456 (= e!297456 e!297455)))

(declare-fun lt!232254 () (_ BitVec 64))

(assert (=> b!508456 (= lt!232254 (select (arr!15707 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!232255 () Unit!15606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32654 (_ BitVec 64) (_ BitVec 32)) Unit!15606)

(assert (=> b!508456 (= lt!232255 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!232254 #b00000000000000000000000000000000))))

(assert (=> b!508456 (arrayContainsKey!0 a!3235 lt!232254 #b00000000000000000000000000000000)))

(declare-fun lt!232253 () Unit!15606)

(assert (=> b!508456 (= lt!232253 lt!232255)))

(declare-fun res!309378 () Bool)

(assert (=> b!508456 (= res!309378 (= (seekEntryOrOpen!0 (select (arr!15707 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4174 #b00000000000000000000000000000000)))))

(assert (=> b!508456 (=> (not res!309378) (not e!297455))))

(declare-fun b!508458 () Bool)

(declare-fun call!31483 () Bool)

(assert (=> b!508458 (= e!297455 call!31483)))

(declare-fun b!508457 () Bool)

(declare-fun e!297454 () Bool)

(assert (=> b!508457 (= e!297454 e!297456)))

(declare-fun c!59818 () Bool)

(assert (=> b!508457 (= c!59818 (validKeyInArray!0 (select (arr!15707 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78747 () Bool)

(declare-fun res!309377 () Bool)

(assert (=> d!78747 (=> res!309377 e!297454)))

(assert (=> d!78747 (= res!309377 (bvsge #b00000000000000000000000000000000 (size!16071 a!3235)))))

(assert (=> d!78747 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!297454)))

(declare-fun b!508459 () Bool)

(assert (=> b!508459 (= e!297456 call!31483)))

(declare-fun bm!31480 () Bool)

(assert (=> bm!31480 (= call!31483 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78747 (not res!309377)) b!508457))

(assert (= (and b!508457 c!59818) b!508456))

(assert (= (and b!508457 (not c!59818)) b!508459))

(assert (= (and b!508456 res!309378) b!508458))

(assert (= (or b!508458 b!508459) bm!31480))

(assert (=> b!508456 m!489195))

(declare-fun m!489229 () Bool)

(assert (=> b!508456 m!489229))

(declare-fun m!489231 () Bool)

(assert (=> b!508456 m!489231))

(assert (=> b!508456 m!489195))

(declare-fun m!489233 () Bool)

(assert (=> b!508456 m!489233))

(assert (=> b!508457 m!489195))

(assert (=> b!508457 m!489195))

(assert (=> b!508457 m!489197))

(declare-fun m!489235 () Bool)

(assert (=> bm!31480 m!489235))

(assert (=> b!508394 d!78747))

(declare-fun e!297489 () SeekEntryResult!4174)

(declare-fun b!508510 () Bool)

(declare-fun lt!232286 () SeekEntryResult!4174)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32654 (_ BitVec 32)) SeekEntryResult!4174)

(assert (=> b!508510 (= e!297489 (seekKeyOrZeroReturnVacant!0 (x!47863 lt!232286) (index!18886 lt!232286) (index!18886 lt!232286) (select (arr!15707 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!508511 () Bool)

(declare-fun c!59840 () Bool)

(declare-fun lt!232288 () (_ BitVec 64))

(assert (=> b!508511 (= c!59840 (= lt!232288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!297488 () SeekEntryResult!4174)

(assert (=> b!508511 (= e!297488 e!297489)))

(declare-fun b!508512 () Bool)

(declare-fun e!297487 () SeekEntryResult!4174)

(assert (=> b!508512 (= e!297487 e!297488)))

(assert (=> b!508512 (= lt!232288 (select (arr!15707 a!3235) (index!18886 lt!232286)))))

(declare-fun c!59839 () Bool)

(assert (=> b!508512 (= c!59839 (= lt!232288 (select (arr!15707 a!3235) j!176)))))

(declare-fun b!508513 () Bool)

(assert (=> b!508513 (= e!297487 Undefined!4174)))

(declare-fun b!508514 () Bool)

(assert (=> b!508514 (= e!297489 (MissingZero!4174 (index!18886 lt!232286)))))

(declare-fun b!508515 () Bool)

(assert (=> b!508515 (= e!297488 (Found!4174 (index!18886 lt!232286)))))

(declare-fun d!78753 () Bool)

(declare-fun lt!232287 () SeekEntryResult!4174)

(assert (=> d!78753 (and (or (is-Undefined!4174 lt!232287) (not (is-Found!4174 lt!232287)) (and (bvsge (index!18885 lt!232287) #b00000000000000000000000000000000) (bvslt (index!18885 lt!232287) (size!16071 a!3235)))) (or (is-Undefined!4174 lt!232287) (is-Found!4174 lt!232287) (not (is-MissingZero!4174 lt!232287)) (and (bvsge (index!18884 lt!232287) #b00000000000000000000000000000000) (bvslt (index!18884 lt!232287) (size!16071 a!3235)))) (or (is-Undefined!4174 lt!232287) (is-Found!4174 lt!232287) (is-MissingZero!4174 lt!232287) (not (is-MissingVacant!4174 lt!232287)) (and (bvsge (index!18887 lt!232287) #b00000000000000000000000000000000) (bvslt (index!18887 lt!232287) (size!16071 a!3235)))) (or (is-Undefined!4174 lt!232287) (ite (is-Found!4174 lt!232287) (= (select (arr!15707 a!3235) (index!18885 lt!232287)) (select (arr!15707 a!3235) j!176)) (ite (is-MissingZero!4174 lt!232287) (= (select (arr!15707 a!3235) (index!18884 lt!232287)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4174 lt!232287) (= (select (arr!15707 a!3235) (index!18887 lt!232287)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78753 (= lt!232287 e!297487)))

(declare-fun c!59841 () Bool)

(assert (=> d!78753 (= c!59841 (and (is-Intermediate!4174 lt!232286) (undefined!4986 lt!232286)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32654 (_ BitVec 32)) SeekEntryResult!4174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!78753 (= lt!232286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15707 a!3235) j!176) mask!3524) (select (arr!15707 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78753 (validMask!0 mask!3524)))

(assert (=> d!78753 (= (seekEntryOrOpen!0 (select (arr!15707 a!3235) j!176) a!3235 mask!3524) lt!232287)))

(assert (= (and d!78753 c!59841) b!508513))

(assert (= (and d!78753 (not c!59841)) b!508512))

(assert (= (and b!508512 c!59839) b!508515))

(assert (= (and b!508512 (not c!59839)) b!508511))

(assert (= (and b!508511 c!59840) b!508514))

(assert (= (and b!508511 (not c!59840)) b!508510))

(assert (=> b!508510 m!489173))

(declare-fun m!489285 () Bool)

(assert (=> b!508510 m!489285))

(declare-fun m!489287 () Bool)

(assert (=> b!508512 m!489287))

(assert (=> d!78753 m!489187))

(declare-fun m!489289 () Bool)

(assert (=> d!78753 m!489289))

(declare-fun m!489291 () Bool)

(assert (=> d!78753 m!489291))

(assert (=> d!78753 m!489173))

(declare-fun m!489293 () Bool)

(assert (=> d!78753 m!489293))

(declare-fun m!489295 () Bool)

(assert (=> d!78753 m!489295))

(declare-fun m!489297 () Bool)

(assert (=> d!78753 m!489297))

(assert (=> d!78753 m!489173))

(assert (=> d!78753 m!489291))

(assert (=> b!508388 d!78753))

(declare-fun b!508516 () Bool)

(declare-fun e!297492 () Bool)

(declare-fun e!297491 () Bool)

(assert (=> b!508516 (= e!297492 e!297491)))

(declare-fun lt!232290 () (_ BitVec 64))

(assert (=> b!508516 (= lt!232290 (select (arr!15707 a!3235) j!176))))

(declare-fun lt!232291 () Unit!15606)

(assert (=> b!508516 (= lt!232291 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!232290 j!176))))

(assert (=> b!508516 (arrayContainsKey!0 a!3235 lt!232290 #b00000000000000000000000000000000)))

(declare-fun lt!232289 () Unit!15606)

(assert (=> b!508516 (= lt!232289 lt!232291)))

(declare-fun res!309390 () Bool)

(assert (=> b!508516 (= res!309390 (= (seekEntryOrOpen!0 (select (arr!15707 a!3235) j!176) a!3235 mask!3524) (Found!4174 j!176)))))

(assert (=> b!508516 (=> (not res!309390) (not e!297491))))

(declare-fun b!508518 () Bool)

(declare-fun call!31486 () Bool)

(assert (=> b!508518 (= e!297491 call!31486)))

(declare-fun b!508517 () Bool)

(declare-fun e!297490 () Bool)

(assert (=> b!508517 (= e!297490 e!297492)))

(declare-fun c!59842 () Bool)

(assert (=> b!508517 (= c!59842 (validKeyInArray!0 (select (arr!15707 a!3235) j!176)))))

(declare-fun d!78779 () Bool)

(declare-fun res!309389 () Bool)

(assert (=> d!78779 (=> res!309389 e!297490)))

(assert (=> d!78779 (= res!309389 (bvsge j!176 (size!16071 a!3235)))))

(assert (=> d!78779 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!297490)))

(declare-fun b!508519 () Bool)

(assert (=> b!508519 (= e!297492 call!31486)))

(declare-fun bm!31483 () Bool)

(assert (=> bm!31483 (= call!31486 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78779 (not res!309389)) b!508517))

(assert (= (and b!508517 c!59842) b!508516))

(assert (= (and b!508517 (not c!59842)) b!508519))

(assert (= (and b!508516 res!309390) b!508518))

(assert (= (or b!508518 b!508519) bm!31483))

(assert (=> b!508516 m!489173))

(declare-fun m!489299 () Bool)

(assert (=> b!508516 m!489299))

(declare-fun m!489301 () Bool)

(assert (=> b!508516 m!489301))

(assert (=> b!508516 m!489173))

(assert (=> b!508516 m!489175))

(assert (=> b!508517 m!489173))

(assert (=> b!508517 m!489173))

(assert (=> b!508517 m!489185))

(declare-fun m!489303 () Bool)

(assert (=> bm!31483 m!489303))

(assert (=> b!508388 d!78779))

(declare-fun d!78781 () Bool)

(assert (=> d!78781 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!232294 () Unit!15606)

(declare-fun choose!38 (array!32654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15606)

(assert (=> d!78781 (= lt!232294 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78781 (validMask!0 mask!3524)))

(assert (=> d!78781 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!232294)))

(declare-fun bs!16098 () Bool)

(assert (= bs!16098 d!78781))

(assert (=> bs!16098 m!489177))

(declare-fun m!489305 () Bool)

(assert (=> bs!16098 m!489305))

(assert (=> bs!16098 m!489187))

(assert (=> b!508388 d!78781))

(declare-fun d!78783 () Bool)

(assert (=> d!78783 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!508390 d!78783))

(declare-fun d!78789 () Bool)

(assert (=> d!78789 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45898 d!78789))

(declare-fun d!78797 () Bool)

(assert (=> d!78797 (= (array_inv!11503 a!3235) (bvsge (size!16071 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45898 d!78797))

(declare-fun d!78799 () Bool)

(assert (=> d!78799 (= (validKeyInArray!0 (select (arr!15707 a!3235) j!176)) (and (not (= (select (arr!15707 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15707 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!508393 d!78799))

(declare-fun e!297525 () SeekEntryResult!4174)

(declare-fun lt!232301 () SeekEntryResult!4174)

