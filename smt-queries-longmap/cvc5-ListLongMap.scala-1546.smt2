; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29254 () Bool)

(assert start!29254)

(declare-fun b!296638 () Bool)

(declare-fun e!187483 () Bool)

(declare-fun e!187480 () Bool)

(assert (=> b!296638 (= e!187483 e!187480)))

(declare-fun res!156308 () Bool)

(assert (=> b!296638 (=> (not res!156308) (not e!187480))))

(declare-datatypes ((SeekEntryResult!2264 0))(
  ( (MissingZero!2264 (index!11226 (_ BitVec 32))) (Found!2264 (index!11227 (_ BitVec 32))) (Intermediate!2264 (undefined!3076 Bool) (index!11228 (_ BitVec 32)) (x!29442 (_ BitVec 32))) (Undefined!2264) (MissingVacant!2264 (index!11229 (_ BitVec 32))) )
))
(declare-fun lt!147302 () SeekEntryResult!2264)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147298 () Bool)

(assert (=> b!296638 (= res!156308 (or lt!147298 (= lt!147302 (MissingVacant!2264 i!1256))))))

(assert (=> b!296638 (= lt!147298 (= lt!147302 (MissingZero!2264 i!1256)))))

(declare-datatypes ((array!15012 0))(
  ( (array!15013 (arr!7115 (Array (_ BitVec 32) (_ BitVec 64))) (size!7467 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15012)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15012 (_ BitVec 32)) SeekEntryResult!2264)

(assert (=> b!296638 (= lt!147302 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296639 () Bool)

(declare-fun e!187479 () Bool)

(declare-fun e!187482 () Bool)

(assert (=> b!296639 (= e!187479 e!187482)))

(declare-fun res!156311 () Bool)

(assert (=> b!296639 (=> (not res!156311) (not e!187482))))

(declare-fun lt!147300 () SeekEntryResult!2264)

(declare-fun lt!147303 () Bool)

(assert (=> b!296639 (= res!156311 (and (or lt!147303 (not (undefined!3076 lt!147300))) (or lt!147303 (not (= (select (arr!7115 a!3312) (index!11228 lt!147300)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147303 (not (= (select (arr!7115 a!3312) (index!11228 lt!147300)) k!2524))) (not lt!147303)))))

(assert (=> b!296639 (= lt!147303 (not (is-Intermediate!2264 lt!147300)))))

(declare-fun b!296640 () Bool)

(declare-fun res!156312 () Bool)

(assert (=> b!296640 (=> (not res!156312) (not e!187483))))

(declare-fun arrayContainsKey!0 (array!15012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296640 (= res!156312 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296641 () Bool)

(declare-fun res!156310 () Bool)

(assert (=> b!296641 (=> (not res!156310) (not e!187483))))

(assert (=> b!296641 (= res!156310 (and (= (size!7467 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7467 a!3312))))))

(declare-fun b!296642 () Bool)

(declare-fun res!156307 () Bool)

(assert (=> b!296642 (=> (not res!156307) (not e!187483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296642 (= res!156307 (validKeyInArray!0 k!2524))))

(declare-fun res!156306 () Bool)

(assert (=> start!29254 (=> (not res!156306) (not e!187483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29254 (= res!156306 (validMask!0 mask!3809))))

(assert (=> start!29254 e!187483))

(assert (=> start!29254 true))

(declare-fun array_inv!5078 (array!15012) Bool)

(assert (=> start!29254 (array_inv!5078 a!3312)))

(declare-fun b!296643 () Bool)

(assert (=> b!296643 (= e!187480 e!187479)))

(declare-fun res!156305 () Bool)

(assert (=> b!296643 (=> (not res!156305) (not e!187479))))

(assert (=> b!296643 (= res!156305 lt!147298)))

(declare-fun lt!147301 () (_ BitVec 32))

(declare-fun lt!147299 () SeekEntryResult!2264)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15012 (_ BitVec 32)) SeekEntryResult!2264)

(assert (=> b!296643 (= lt!147299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147301 k!2524 (array!15013 (store (arr!7115 a!3312) i!1256 k!2524) (size!7467 a!3312)) mask!3809))))

(assert (=> b!296643 (= lt!147300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147301 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296643 (= lt!147301 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296644 () Bool)

(assert (=> b!296644 (= e!187482 (not (or (not (= lt!147300 (Intermediate!2264 false (index!11228 lt!147300) (x!29442 lt!147300)))) (bvsgt #b00000000000000000000000000000000 (x!29442 lt!147300)) (and (bvsge lt!147301 #b00000000000000000000000000000000) (bvslt lt!147301 (size!7467 a!3312))))))))

(assert (=> b!296644 (and (= (select (arr!7115 a!3312) (index!11228 lt!147300)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11228 lt!147300) i!1256))))

(declare-fun b!296645 () Bool)

(declare-fun res!156309 () Bool)

(assert (=> b!296645 (=> (not res!156309) (not e!187480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15012 (_ BitVec 32)) Bool)

(assert (=> b!296645 (= res!156309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29254 res!156306) b!296641))

(assert (= (and b!296641 res!156310) b!296642))

(assert (= (and b!296642 res!156307) b!296640))

(assert (= (and b!296640 res!156312) b!296638))

(assert (= (and b!296638 res!156308) b!296645))

(assert (= (and b!296645 res!156309) b!296643))

(assert (= (and b!296643 res!156305) b!296639))

(assert (= (and b!296639 res!156311) b!296644))

(declare-fun m!309567 () Bool)

(assert (=> b!296642 m!309567))

(declare-fun m!309569 () Bool)

(assert (=> start!29254 m!309569))

(declare-fun m!309571 () Bool)

(assert (=> start!29254 m!309571))

(declare-fun m!309573 () Bool)

(assert (=> b!296643 m!309573))

(declare-fun m!309575 () Bool)

(assert (=> b!296643 m!309575))

(declare-fun m!309577 () Bool)

(assert (=> b!296643 m!309577))

(declare-fun m!309579 () Bool)

(assert (=> b!296643 m!309579))

(declare-fun m!309581 () Bool)

(assert (=> b!296638 m!309581))

(declare-fun m!309583 () Bool)

(assert (=> b!296639 m!309583))

(declare-fun m!309585 () Bool)

(assert (=> b!296645 m!309585))

(assert (=> b!296644 m!309583))

(declare-fun m!309587 () Bool)

(assert (=> b!296640 m!309587))

(push 1)

(assert (not start!29254))

(assert (not b!296640))

(assert (not b!296643))

(assert (not b!296642))

(assert (not b!296645))

(assert (not b!296638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67105 () Bool)

(declare-fun res!156377 () Bool)

(declare-fun e!187538 () Bool)

(assert (=> d!67105 (=> res!156377 e!187538)))

(assert (=> d!67105 (= res!156377 (= (select (arr!7115 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67105 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!187538)))

(declare-fun b!296734 () Bool)

(declare-fun e!187539 () Bool)

(assert (=> b!296734 (= e!187538 e!187539)))

(declare-fun res!156378 () Bool)

(assert (=> b!296734 (=> (not res!156378) (not e!187539))))

(assert (=> b!296734 (= res!156378 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7467 a!3312)))))

(declare-fun b!296735 () Bool)

(assert (=> b!296735 (= e!187539 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67105 (not res!156377)) b!296734))

(assert (= (and b!296734 res!156378) b!296735))

(declare-fun m!309641 () Bool)

(assert (=> d!67105 m!309641))

(declare-fun m!309643 () Bool)

(assert (=> b!296735 m!309643))

(assert (=> b!296640 d!67105))

(declare-fun b!296752 () Bool)

(declare-fun e!187554 () Bool)

(declare-fun e!187553 () Bool)

(assert (=> b!296752 (= e!187554 e!187553)))

(declare-fun c!47762 () Bool)

(assert (=> b!296752 (= c!47762 (validKeyInArray!0 (select (arr!7115 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!296753 () Bool)

(declare-fun call!25749 () Bool)

(assert (=> b!296753 (= e!187553 call!25749)))

(declare-fun bm!25746 () Bool)

(assert (=> bm!25746 (= call!25749 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!296755 () Bool)

(declare-fun e!187552 () Bool)

(assert (=> b!296755 (= e!187553 e!187552)))

(declare-fun lt!147366 () (_ BitVec 64))

(assert (=> b!296755 (= lt!147366 (select (arr!7115 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9232 0))(
  ( (Unit!9233) )
))
(declare-fun lt!147365 () Unit!9232)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15012 (_ BitVec 64) (_ BitVec 32)) Unit!9232)

(assert (=> b!296755 (= lt!147365 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147366 #b00000000000000000000000000000000))))

(assert (=> b!296755 (arrayContainsKey!0 a!3312 lt!147366 #b00000000000000000000000000000000)))

(declare-fun lt!147364 () Unit!9232)

(assert (=> b!296755 (= lt!147364 lt!147365)))

(declare-fun res!156388 () Bool)

(assert (=> b!296755 (= res!156388 (= (seekEntryOrOpen!0 (select (arr!7115 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2264 #b00000000000000000000000000000000)))))

(assert (=> b!296755 (=> (not res!156388) (not e!187552))))

(declare-fun d!67109 () Bool)

(declare-fun res!156389 () Bool)

(assert (=> d!67109 (=> res!156389 e!187554)))

(assert (=> d!67109 (= res!156389 (bvsge #b00000000000000000000000000000000 (size!7467 a!3312)))))

(assert (=> d!67109 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187554)))

(declare-fun b!296754 () Bool)

(assert (=> b!296754 (= e!187552 call!25749)))

(assert (= (and d!67109 (not res!156389)) b!296752))

(assert (= (and b!296752 c!47762) b!296755))

(assert (= (and b!296752 (not c!47762)) b!296753))

(assert (= (and b!296755 res!156388) b!296754))

(assert (= (or b!296754 b!296753) bm!25746))

(assert (=> b!296752 m!309641))

(assert (=> b!296752 m!309641))

(declare-fun m!309651 () Bool)

(assert (=> b!296752 m!309651))

(declare-fun m!309653 () Bool)

(assert (=> bm!25746 m!309653))

(assert (=> b!296755 m!309641))

(declare-fun m!309655 () Bool)

(assert (=> b!296755 m!309655))

(declare-fun m!309657 () Bool)

(assert (=> b!296755 m!309657))

(assert (=> b!296755 m!309641))

(declare-fun m!309659 () Bool)

(assert (=> b!296755 m!309659))

(assert (=> b!296645 d!67109))

(declare-fun lt!147376 () SeekEntryResult!2264)

(declare-fun b!296784 () Bool)

(assert (=> b!296784 (and (bvsge (index!11228 lt!147376) #b00000000000000000000000000000000) (bvslt (index!11228 lt!147376) (size!7467 (array!15013 (store (arr!7115 a!3312) i!1256 k!2524) (size!7467 a!3312)))))))

(declare-fun res!156404 () Bool)

(assert (=> b!296784 (= res!156404 (= (select (arr!7115 (array!15013 (store (arr!7115 a!3312) i!1256 k!2524) (size!7467 a!3312))) (index!11228 lt!147376)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187574 () Bool)

(assert (=> b!296784 (=> res!156404 e!187574)))

(declare-fun b!296785 () Bool)

(declare-fun e!187578 () Bool)

(declare-fun e!187575 () Bool)

(assert (=> b!296785 (= e!187578 e!187575)))

(declare-fun res!156405 () Bool)

(assert (=> b!296785 (= res!156405 (and (is-Intermediate!2264 lt!147376) (not (undefined!3076 lt!147376)) (bvslt (x!29442 lt!147376) #b01111111111111111111111111111110) (bvsge (x!29442 lt!147376) #b00000000000000000000000000000000) (bvsge (x!29442 lt!147376) #b00000000000000000000000000000000)))))

(assert (=> b!296785 (=> (not res!156405) (not e!187575))))

(declare-fun b!296786 () Bool)

(declare-fun e!187577 () SeekEntryResult!2264)

(declare-fun e!187576 () SeekEntryResult!2264)

(assert (=> b!296786 (= e!187577 e!187576)))

(declare-fun c!47771 () Bool)

(declare-fun lt!147377 () (_ BitVec 64))

(assert (=> b!296786 (= c!47771 (or (= lt!147377 k!2524) (= (bvadd lt!147377 lt!147377) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296787 () Bool)

(assert (=> b!296787 (and (bvsge (index!11228 lt!147376) #b00000000000000000000000000000000) (bvslt (index!11228 lt!147376) (size!7467 (array!15013 (store (arr!7115 a!3312) i!1256 k!2524) (size!7467 a!3312)))))))

(assert (=> b!296787 (= e!187574 (= (select (arr!7115 (array!15013 (store (arr!7115 a!3312) i!1256 k!2524) (size!7467 a!3312))) (index!11228 lt!147376)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67115 () Bool)

(assert (=> d!67115 e!187578))

(declare-fun c!47772 () Bool)

(assert (=> d!67115 (= c!47772 (and (is-Intermediate!2264 lt!147376) (undefined!3076 lt!147376)))))

(assert (=> d!67115 (= lt!147376 e!187577)))

(declare-fun c!47770 () Bool)

(assert (=> d!67115 (= c!47770 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67115 (= lt!147377 (select (arr!7115 (array!15013 (store (arr!7115 a!3312) i!1256 k!2524) (size!7467 a!3312))) lt!147301))))

(assert (=> d!67115 (validMask!0 mask!3809)))

(assert (=> d!67115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147301 k!2524 (array!15013 (store (arr!7115 a!3312) i!1256 k!2524) (size!7467 a!3312)) mask!3809) lt!147376)))

(declare-fun b!296788 () Bool)

(assert (=> b!296788 (= e!187578 (bvsge (x!29442 lt!147376) #b01111111111111111111111111111110))))

(declare-fun b!296789 () Bool)

(assert (=> b!296789 (= e!187576 (Intermediate!2264 false lt!147301 #b00000000000000000000000000000000))))

(declare-fun b!296790 () Bool)

(assert (=> b!296790 (and (bvsge (index!11228 lt!147376) #b00000000000000000000000000000000) (bvslt (index!11228 lt!147376) (size!7467 (array!15013 (store (arr!7115 a!3312) i!1256 k!2524) (size!7467 a!3312)))))))

(declare-fun res!156406 () Bool)

(assert (=> b!296790 (= res!156406 (= (select (arr!7115 (array!15013 (store (arr!7115 a!3312) i!1256 k!2524) (size!7467 a!3312))) (index!11228 lt!147376)) k!2524))))

(assert (=> b!296790 (=> res!156406 e!187574)))

(assert (=> b!296790 (= e!187575 e!187574)))

(declare-fun b!296791 () Bool)

(assert (=> b!296791 (= e!187577 (Intermediate!2264 true lt!147301 #b00000000000000000000000000000000))))

(declare-fun b!296792 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296792 (= e!187576 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147301 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15013 (store (arr!7115 a!3312) i!1256 k!2524) (size!7467 a!3312)) mask!3809))))

(assert (= (and d!67115 c!47770) b!296791))

(assert (= (and d!67115 (not c!47770)) b!296786))

(assert (= (and b!296786 c!47771) b!296789))

(assert (= (and b!296786 (not c!47771)) b!296792))

(assert (= (and d!67115 c!47772) b!296788))

(assert (= (and d!67115 (not c!47772)) b!296785))

(assert (= (and b!296785 res!156405) b!296790))

(assert (= (and b!296790 (not res!156406)) b!296784))

(assert (= (and b!296784 (not res!156404)) b!296787))

(declare-fun m!309677 () Bool)

(assert (=> b!296790 m!309677))

(assert (=> b!296787 m!309677))

(declare-fun m!309679 () Bool)

(assert (=> b!296792 m!309679))

(assert (=> b!296792 m!309679))

(declare-fun m!309681 () Bool)

(assert (=> b!296792 m!309681))

(assert (=> b!296784 m!309677))

(declare-fun m!309683 () Bool)

(assert (=> d!67115 m!309683))

(assert (=> d!67115 m!309569))

(assert (=> b!296643 d!67115))

(declare-fun b!296793 () Bool)

(declare-fun lt!147378 () SeekEntryResult!2264)

(assert (=> b!296793 (and (bvsge (index!11228 lt!147378) #b00000000000000000000000000000000) (bvslt (index!11228 lt!147378) (size!7467 a!3312)))))

(declare-fun res!156407 () Bool)

(assert (=> b!296793 (= res!156407 (= (select (arr!7115 a!3312) (index!11228 lt!147378)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187579 () Bool)

(assert (=> b!296793 (=> res!156407 e!187579)))

(declare-fun b!296794 () Bool)

(declare-fun e!187583 () Bool)

(declare-fun e!187580 () Bool)

(assert (=> b!296794 (= e!187583 e!187580)))

(declare-fun res!156408 () Bool)

(assert (=> b!296794 (= res!156408 (and (is-Intermediate!2264 lt!147378) (not (undefined!3076 lt!147378)) (bvslt (x!29442 lt!147378) #b01111111111111111111111111111110) (bvsge (x!29442 lt!147378) #b00000000000000000000000000000000) (bvsge (x!29442 lt!147378) #b00000000000000000000000000000000)))))

(assert (=> b!296794 (=> (not res!156408) (not e!187580))))

(declare-fun b!296795 () Bool)

(declare-fun e!187582 () SeekEntryResult!2264)

(declare-fun e!187581 () SeekEntryResult!2264)

(assert (=> b!296795 (= e!187582 e!187581)))

(declare-fun c!47774 () Bool)

(declare-fun lt!147379 () (_ BitVec 64))

(assert (=> b!296795 (= c!47774 (or (= lt!147379 k!2524) (= (bvadd lt!147379 lt!147379) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296796 () Bool)

(assert (=> b!296796 (and (bvsge (index!11228 lt!147378) #b00000000000000000000000000000000) (bvslt (index!11228 lt!147378) (size!7467 a!3312)))))

(assert (=> b!296796 (= e!187579 (= (select (arr!7115 a!3312) (index!11228 lt!147378)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67123 () Bool)

(assert (=> d!67123 e!187583))

(declare-fun c!47775 () Bool)

(assert (=> d!67123 (= c!47775 (and (is-Intermediate!2264 lt!147378) (undefined!3076 lt!147378)))))

(assert (=> d!67123 (= lt!147378 e!187582)))

(declare-fun c!47773 () Bool)

(assert (=> d!67123 (= c!47773 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67123 (= lt!147379 (select (arr!7115 a!3312) lt!147301))))

(assert (=> d!67123 (validMask!0 mask!3809)))

(assert (=> d!67123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147301 k!2524 a!3312 mask!3809) lt!147378)))

(declare-fun b!296797 () Bool)

(assert (=> b!296797 (= e!187583 (bvsge (x!29442 lt!147378) #b01111111111111111111111111111110))))

(declare-fun b!296798 () Bool)

(assert (=> b!296798 (= e!187581 (Intermediate!2264 false lt!147301 #b00000000000000000000000000000000))))

(declare-fun b!296799 () Bool)

(assert (=> b!296799 (and (bvsge (index!11228 lt!147378) #b00000000000000000000000000000000) (bvslt (index!11228 lt!147378) (size!7467 a!3312)))))

(declare-fun res!156409 () Bool)

(assert (=> b!296799 (= res!156409 (= (select (arr!7115 a!3312) (index!11228 lt!147378)) k!2524))))

(assert (=> b!296799 (=> res!156409 e!187579)))

(assert (=> b!296799 (= e!187580 e!187579)))

(declare-fun b!296800 () Bool)

(assert (=> b!296800 (= e!187582 (Intermediate!2264 true lt!147301 #b00000000000000000000000000000000))))

(declare-fun b!296801 () Bool)

(assert (=> b!296801 (= e!187581 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147301 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(assert (= (and d!67123 c!47773) b!296800))

(assert (= (and d!67123 (not c!47773)) b!296795))

(assert (= (and b!296795 c!47774) b!296798))

(assert (= (and b!296795 (not c!47774)) b!296801))

(assert (= (and d!67123 c!47775) b!296797))

(assert (= (and d!67123 (not c!47775)) b!296794))

(assert (= (and b!296794 res!156408) b!296799))

(assert (= (and b!296799 (not res!156409)) b!296793))

(assert (= (and b!296793 (not res!156407)) b!296796))

(declare-fun m!309685 () Bool)

(assert (=> b!296799 m!309685))

(assert (=> b!296796 m!309685))

(assert (=> b!296801 m!309679))

(assert (=> b!296801 m!309679))

(declare-fun m!309687 () Bool)

(assert (=> b!296801 m!309687))

(assert (=> b!296793 m!309685))

(declare-fun m!309689 () Bool)

(assert (=> d!67123 m!309689))

(assert (=> d!67123 m!309569))

(assert (=> b!296643 d!67123))

(declare-fun d!67125 () Bool)

(declare-fun lt!147391 () (_ BitVec 32))

(declare-fun lt!147390 () (_ BitVec 32))

(assert (=> d!67125 (= lt!147391 (bvmul (bvxor lt!147390 (bvlshr lt!147390 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67125 (= lt!147390 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67125 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156410 (let ((h!5296 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29448 (bvmul (bvxor h!5296 (bvlshr h!5296 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29448 (bvlshr x!29448 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156410 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156410 #b00000000000000000000000000000000))))))

(assert (=> d!67125 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!147391 (bvlshr lt!147391 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!296643 d!67125))

(declare-fun d!67127 () Bool)

(assert (=> d!67127 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!296642 d!67127))

(declare-fun d!67129 () Bool)

(assert (=> d!67129 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29254 d!67129))

(declare-fun d!67133 () Bool)

(assert (=> d!67133 (= (array_inv!5078 a!3312) (bvsge (size!7467 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29254 d!67133))

(declare-fun b!296850 () Bool)

(declare-fun c!47800 () Bool)

(declare-fun lt!147410 () (_ BitVec 64))

(assert (=> b!296850 (= c!47800 (= lt!147410 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187608 () SeekEntryResult!2264)

(declare-fun e!187610 () SeekEntryResult!2264)

(assert (=> b!296850 (= e!187608 e!187610)))

(declare-fun b!296851 () Bool)

(declare-fun e!187609 () SeekEntryResult!2264)

(assert (=> b!296851 (= e!187609 Undefined!2264)))

(declare-fun b!296852 () Bool)

(declare-fun lt!147412 () SeekEntryResult!2264)

(assert (=> b!296852 (= e!187610 (MissingZero!2264 (index!11228 lt!147412)))))

(declare-fun b!296853 () Bool)

(assert (=> b!296853 (= e!187608 (Found!2264 (index!11228 lt!147412)))))

(declare-fun d!67135 () Bool)

(declare-fun lt!147411 () SeekEntryResult!2264)

(assert (=> d!67135 (and (or (is-Undefined!2264 lt!147411) (not (is-Found!2264 lt!147411)) (and (bvsge (index!11227 lt!147411) #b00000000000000000000000000000000) (bvslt (index!11227 lt!147411) (size!7467 a!3312)))) (or (is-Undefined!2264 lt!147411) (is-Found!2264 lt!147411) (not (is-MissingZero!2264 lt!147411)) (and (bvsge (index!11226 lt!147411) #b00000000000000000000000000000000) (bvslt (index!11226 lt!147411) (size!7467 a!3312)))) (or (is-Undefined!2264 lt!147411) (is-Found!2264 lt!147411) (is-MissingZero!2264 lt!147411) (not (is-MissingVacant!2264 lt!147411)) (and (bvsge (index!11229 lt!147411) #b00000000000000000000000000000000) (bvslt (index!11229 lt!147411) (size!7467 a!3312)))) (or (is-Undefined!2264 lt!147411) (ite (is-Found!2264 lt!147411) (= (select (arr!7115 a!3312) (index!11227 lt!147411)) k!2524) (ite (is-MissingZero!2264 lt!147411) (= (select (arr!7115 a!3312) (index!11226 lt!147411)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2264 lt!147411) (= (select (arr!7115 a!3312) (index!11229 lt!147411)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67135 (= lt!147411 e!187609)))

(declare-fun c!47802 () Bool)

(assert (=> d!67135 (= c!47802 (and (is-Intermediate!2264 lt!147412) (undefined!3076 lt!147412)))))

(assert (=> d!67135 (= lt!147412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67135 (validMask!0 mask!3809)))

(assert (=> d!67135 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!147411)))

(declare-fun b!296854 () Bool)

(assert (=> b!296854 (= e!187609 e!187608)))

(assert (=> b!296854 (= lt!147410 (select (arr!7115 a!3312) (index!11228 lt!147412)))))

(declare-fun c!47801 () Bool)

(assert (=> b!296854 (= c!47801 (= lt!147410 k!2524))))

(declare-fun b!296855 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15012 (_ BitVec 32)) SeekEntryResult!2264)

(assert (=> b!296855 (= e!187610 (seekKeyOrZeroReturnVacant!0 (x!29442 lt!147412) (index!11228 lt!147412) (index!11228 lt!147412) k!2524 a!3312 mask!3809))))

(assert (= (and d!67135 c!47802) b!296851))

(assert (= (and d!67135 (not c!47802)) b!296854))

(assert (= (and b!296854 c!47801) b!296853))

(assert (= (and b!296854 (not c!47801)) b!296850))

(assert (= (and b!296850 c!47800) b!296852))

(assert (= (and b!296850 (not c!47800)) b!296855))

(assert (=> d!67135 m!309579))

(declare-fun m!309715 () Bool)

(assert (=> d!67135 m!309715))

(assert (=> d!67135 m!309579))

(assert (=> d!67135 m!309569))

(declare-fun m!309717 () Bool)

(assert (=> d!67135 m!309717))

(declare-fun m!309719 () Bool)

(assert (=> d!67135 m!309719))

(declare-fun m!309721 () Bool)

(assert (=> d!67135 m!309721))

(declare-fun m!309723 () Bool)

(assert (=> b!296854 m!309723))

(declare-fun m!309725 () Bool)

(assert (=> b!296855 m!309725))

(assert (=> b!296638 d!67135))

(push 1)

(assert (not b!296752))

(assert (not b!296855))

(assert (not d!67123))

(assert (not b!296735))

(assert (not b!296792))

(assert (not b!296801))

(assert (not d!67115))

(assert (not bm!25746))

(assert (not d!67135))

(assert (not b!296755))

(check-sat)

(pop 1)

(push 1)

(check-sat)

