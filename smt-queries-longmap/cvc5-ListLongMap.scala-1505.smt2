; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28512 () Bool)

(assert start!28512)

(declare-fun b!291745 () Bool)

(declare-fun e!184603 () Bool)

(declare-fun e!184604 () Bool)

(assert (=> b!291745 (= e!184603 e!184604)))

(declare-fun res!152944 () Bool)

(assert (=> b!291745 (=> (not res!152944) (not e!184604))))

(declare-datatypes ((SeekEntryResult!2141 0))(
  ( (MissingZero!2141 (index!10734 (_ BitVec 32))) (Found!2141 (index!10735 (_ BitVec 32))) (Intermediate!2141 (undefined!2953 Bool) (index!10736 (_ BitVec 32)) (x!28926 (_ BitVec 32))) (Undefined!2141) (MissingVacant!2141 (index!10737 (_ BitVec 32))) )
))
(declare-fun lt!144356 () SeekEntryResult!2141)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144361 () Bool)

(assert (=> b!291745 (= res!152944 (and (not lt!144361) (= lt!144356 (MissingVacant!2141 i!1256))))))

(declare-fun lt!144360 () (_ BitVec 32))

(declare-datatypes ((array!14736 0))(
  ( (array!14737 (arr!6992 (Array (_ BitVec 32) (_ BitVec 64))) (size!7344 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14736)

(declare-fun lt!144357 () SeekEntryResult!2141)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14736 (_ BitVec 32)) SeekEntryResult!2141)

(assert (=> b!291745 (= lt!144357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144360 k!2524 (array!14737 (store (arr!6992 a!3312) i!1256 k!2524) (size!7344 a!3312)) mask!3809))))

(declare-fun lt!144359 () SeekEntryResult!2141)

(assert (=> b!291745 (= lt!144359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144360 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291745 (= lt!144360 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291746 () Bool)

(declare-fun res!152948 () Bool)

(declare-fun e!184602 () Bool)

(assert (=> b!291746 (=> (not res!152948) (not e!184602))))

(declare-fun arrayContainsKey!0 (array!14736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291746 (= res!152948 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291747 () Bool)

(declare-fun res!152947 () Bool)

(assert (=> b!291747 (=> (not res!152947) (not e!184602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291747 (= res!152947 (validKeyInArray!0 k!2524))))

(declare-fun b!291748 () Bool)

(assert (=> b!291748 (= e!184602 e!184603)))

(declare-fun res!152945 () Bool)

(assert (=> b!291748 (=> (not res!152945) (not e!184603))))

(assert (=> b!291748 (= res!152945 (or lt!144361 (= lt!144356 (MissingVacant!2141 i!1256))))))

(assert (=> b!291748 (= lt!144361 (= lt!144356 (MissingZero!2141 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14736 (_ BitVec 32)) SeekEntryResult!2141)

(assert (=> b!291748 (= lt!144356 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291749 () Bool)

(declare-fun e!184601 () Bool)

(assert (=> b!291749 (= e!184604 e!184601)))

(declare-fun res!152949 () Bool)

(assert (=> b!291749 (=> (not res!152949) (not e!184601))))

(declare-fun lt!144358 () Bool)

(assert (=> b!291749 (= res!152949 (and (or lt!144358 (not (undefined!2953 lt!144359))) (not lt!144358) (= (select (arr!6992 a!3312) (index!10736 lt!144359)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291749 (= lt!144358 (not (is-Intermediate!2141 lt!144359)))))

(declare-fun res!152942 () Bool)

(assert (=> start!28512 (=> (not res!152942) (not e!184602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28512 (= res!152942 (validMask!0 mask!3809))))

(assert (=> start!28512 e!184602))

(assert (=> start!28512 true))

(declare-fun array_inv!4955 (array!14736) Bool)

(assert (=> start!28512 (array_inv!4955 a!3312)))

(declare-fun b!291750 () Bool)

(declare-fun res!152943 () Bool)

(assert (=> b!291750 (=> (not res!152943) (not e!184603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14736 (_ BitVec 32)) Bool)

(assert (=> b!291750 (= res!152943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291751 () Bool)

(declare-fun res!152946 () Bool)

(assert (=> b!291751 (=> (not res!152946) (not e!184602))))

(assert (=> b!291751 (= res!152946 (and (= (size!7344 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7344 a!3312))))))

(declare-fun b!291752 () Bool)

(assert (=> b!291752 (= e!184601 (not (or (not (= lt!144359 (Intermediate!2141 false (index!10736 lt!144359) (x!28926 lt!144359)))) (bvsgt #b00000000000000000000000000000000 (x!28926 lt!144359)) (and (bvsge lt!144360 #b00000000000000000000000000000000) (bvslt lt!144360 (size!7344 a!3312))))))))

(assert (=> b!291752 (= (index!10736 lt!144359) i!1256)))

(assert (= (and start!28512 res!152942) b!291751))

(assert (= (and b!291751 res!152946) b!291747))

(assert (= (and b!291747 res!152947) b!291746))

(assert (= (and b!291746 res!152948) b!291748))

(assert (= (and b!291748 res!152945) b!291750))

(assert (= (and b!291750 res!152943) b!291745))

(assert (= (and b!291745 res!152944) b!291749))

(assert (= (and b!291749 res!152949) b!291752))

(declare-fun m!305577 () Bool)

(assert (=> b!291745 m!305577))

(declare-fun m!305579 () Bool)

(assert (=> b!291745 m!305579))

(declare-fun m!305581 () Bool)

(assert (=> b!291745 m!305581))

(declare-fun m!305583 () Bool)

(assert (=> b!291745 m!305583))

(declare-fun m!305585 () Bool)

(assert (=> b!291746 m!305585))

(declare-fun m!305587 () Bool)

(assert (=> b!291747 m!305587))

(declare-fun m!305589 () Bool)

(assert (=> b!291749 m!305589))

(declare-fun m!305591 () Bool)

(assert (=> b!291750 m!305591))

(declare-fun m!305593 () Bool)

(assert (=> start!28512 m!305593))

(declare-fun m!305595 () Bool)

(assert (=> start!28512 m!305595))

(declare-fun m!305597 () Bool)

(assert (=> b!291748 m!305597))

(push 1)

(assert (not b!291748))

(assert (not b!291745))

(assert (not b!291750))

(assert (not start!28512))

(assert (not b!291747))

(assert (not b!291746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!291873 () Bool)

(declare-fun e!184684 () SeekEntryResult!2141)

(declare-fun lt!144429 () SeekEntryResult!2141)

(assert (=> b!291873 (= e!184684 (Found!2141 (index!10736 lt!144429)))))

(declare-fun b!291874 () Bool)

(declare-fun c!46989 () Bool)

(declare-fun lt!144427 () (_ BitVec 64))

(assert (=> b!291874 (= c!46989 (= lt!144427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184683 () SeekEntryResult!2141)

(assert (=> b!291874 (= e!184684 e!184683)))

(declare-fun b!291875 () Bool)

(declare-fun e!184682 () SeekEntryResult!2141)

(assert (=> b!291875 (= e!184682 e!184684)))

(assert (=> b!291875 (= lt!144427 (select (arr!6992 a!3312) (index!10736 lt!144429)))))

(declare-fun c!46987 () Bool)

(assert (=> b!291875 (= c!46987 (= lt!144427 k!2524))))

(declare-fun b!291877 () Bool)

(assert (=> b!291877 (= e!184683 (MissingZero!2141 (index!10736 lt!144429)))))

(declare-fun b!291878 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14736 (_ BitVec 32)) SeekEntryResult!2141)

(assert (=> b!291878 (= e!184683 (seekKeyOrZeroReturnVacant!0 (x!28926 lt!144429) (index!10736 lt!144429) (index!10736 lt!144429) k!2524 a!3312 mask!3809))))

(declare-fun d!66421 () Bool)

(declare-fun lt!144428 () SeekEntryResult!2141)

(assert (=> d!66421 (and (or (is-Undefined!2141 lt!144428) (not (is-Found!2141 lt!144428)) (and (bvsge (index!10735 lt!144428) #b00000000000000000000000000000000) (bvslt (index!10735 lt!144428) (size!7344 a!3312)))) (or (is-Undefined!2141 lt!144428) (is-Found!2141 lt!144428) (not (is-MissingZero!2141 lt!144428)) (and (bvsge (index!10734 lt!144428) #b00000000000000000000000000000000) (bvslt (index!10734 lt!144428) (size!7344 a!3312)))) (or (is-Undefined!2141 lt!144428) (is-Found!2141 lt!144428) (is-MissingZero!2141 lt!144428) (not (is-MissingVacant!2141 lt!144428)) (and (bvsge (index!10737 lt!144428) #b00000000000000000000000000000000) (bvslt (index!10737 lt!144428) (size!7344 a!3312)))) (or (is-Undefined!2141 lt!144428) (ite (is-Found!2141 lt!144428) (= (select (arr!6992 a!3312) (index!10735 lt!144428)) k!2524) (ite (is-MissingZero!2141 lt!144428) (= (select (arr!6992 a!3312) (index!10734 lt!144428)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2141 lt!144428) (= (select (arr!6992 a!3312) (index!10737 lt!144428)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66421 (= lt!144428 e!184682)))

(declare-fun c!46988 () Bool)

(assert (=> d!66421 (= c!46988 (and (is-Intermediate!2141 lt!144429) (undefined!2953 lt!144429)))))

(assert (=> d!66421 (= lt!144429 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66421 (validMask!0 mask!3809)))

(assert (=> d!66421 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!144428)))

(declare-fun b!291876 () Bool)

(assert (=> b!291876 (= e!184682 Undefined!2141)))

(assert (= (and d!66421 c!46988) b!291876))

(assert (= (and d!66421 (not c!46988)) b!291875))

(assert (= (and b!291875 c!46987) b!291873))

(assert (= (and b!291875 (not c!46987)) b!291874))

(assert (= (and b!291874 c!46989) b!291877))

(assert (= (and b!291874 (not c!46989)) b!291878))

(declare-fun m!305675 () Bool)

(assert (=> b!291875 m!305675))

(declare-fun m!305677 () Bool)

(assert (=> b!291878 m!305677))

(assert (=> d!66421 m!305593))

(declare-fun m!305679 () Bool)

(assert (=> d!66421 m!305679))

(assert (=> d!66421 m!305583))

(assert (=> d!66421 m!305583))

(declare-fun m!305681 () Bool)

(assert (=> d!66421 m!305681))

(declare-fun m!305683 () Bool)

(assert (=> d!66421 m!305683))

(declare-fun m!305685 () Bool)

(assert (=> d!66421 m!305685))

(assert (=> b!291748 d!66421))

(declare-fun d!66439 () Bool)

(assert (=> d!66439 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!291747 d!66439))

(declare-fun d!66443 () Bool)

(assert (=> d!66443 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28512 d!66443))

(declare-fun d!66445 () Bool)

(assert (=> d!66445 (= (array_inv!4955 a!3312) (bvsge (size!7344 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28512 d!66445))

(declare-fun d!66447 () Bool)

(declare-fun res!153039 () Bool)

(declare-fun e!184699 () Bool)

(assert (=> d!66447 (=> res!153039 e!184699)))

(assert (=> d!66447 (= res!153039 (= (select (arr!6992 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66447 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!184699)))

(declare-fun b!291901 () Bool)

(declare-fun e!184700 () Bool)

(assert (=> b!291901 (= e!184699 e!184700)))

(declare-fun res!153040 () Bool)

(assert (=> b!291901 (=> (not res!153040) (not e!184700))))

(assert (=> b!291901 (= res!153040 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7344 a!3312)))))

(declare-fun b!291902 () Bool)

(assert (=> b!291902 (= e!184700 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66447 (not res!153039)) b!291901))

(assert (= (and b!291901 res!153040) b!291902))

(declare-fun m!305687 () Bool)

(assert (=> d!66447 m!305687))

(declare-fun m!305689 () Bool)

(assert (=> b!291902 m!305689))

(assert (=> b!291746 d!66447))

(declare-fun b!291969 () Bool)

(declare-fun e!184740 () SeekEntryResult!2141)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291969 (= e!184740 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144360 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14737 (store (arr!6992 a!3312) i!1256 k!2524) (size!7344 a!3312)) mask!3809))))

(declare-fun b!291970 () Bool)

(declare-fun e!184739 () Bool)

(declare-fun lt!144467 () SeekEntryResult!2141)

(assert (=> b!291970 (= e!184739 (bvsge (x!28926 lt!144467) #b01111111111111111111111111111110))))

(declare-fun b!291971 () Bool)

(assert (=> b!291971 (and (bvsge (index!10736 lt!144467) #b00000000000000000000000000000000) (bvslt (index!10736 lt!144467) (size!7344 (array!14737 (store (arr!6992 a!3312) i!1256 k!2524) (size!7344 a!3312)))))))

(declare-fun res!153060 () Bool)

(assert (=> b!291971 (= res!153060 (= (select (arr!6992 (array!14737 (store (arr!6992 a!3312) i!1256 k!2524) (size!7344 a!3312))) (index!10736 lt!144467)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184742 () Bool)

(assert (=> b!291971 (=> res!153060 e!184742)))

(declare-fun d!66449 () Bool)

(assert (=> d!66449 e!184739))

(declare-fun c!47022 () Bool)

(assert (=> d!66449 (= c!47022 (and (is-Intermediate!2141 lt!144467) (undefined!2953 lt!144467)))))

(declare-fun e!184741 () SeekEntryResult!2141)

(assert (=> d!66449 (= lt!144467 e!184741)))

(declare-fun c!47021 () Bool)

(assert (=> d!66449 (= c!47021 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144466 () (_ BitVec 64))

(assert (=> d!66449 (= lt!144466 (select (arr!6992 (array!14737 (store (arr!6992 a!3312) i!1256 k!2524) (size!7344 a!3312))) lt!144360))))

(assert (=> d!66449 (validMask!0 mask!3809)))

(assert (=> d!66449 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144360 k!2524 (array!14737 (store (arr!6992 a!3312) i!1256 k!2524) (size!7344 a!3312)) mask!3809) lt!144467)))

(declare-fun b!291972 () Bool)

(declare-fun e!184743 () Bool)

(assert (=> b!291972 (= e!184739 e!184743)))

(declare-fun res!153062 () Bool)

(assert (=> b!291972 (= res!153062 (and (is-Intermediate!2141 lt!144467) (not (undefined!2953 lt!144467)) (bvslt (x!28926 lt!144467) #b01111111111111111111111111111110) (bvsge (x!28926 lt!144467) #b00000000000000000000000000000000) (bvsge (x!28926 lt!144467) #b00000000000000000000000000000000)))))

(assert (=> b!291972 (=> (not res!153062) (not e!184743))))

(declare-fun b!291973 () Bool)

(assert (=> b!291973 (= e!184740 (Intermediate!2141 false lt!144360 #b00000000000000000000000000000000))))

(declare-fun b!291974 () Bool)

(assert (=> b!291974 (= e!184741 e!184740)))

(declare-fun c!47020 () Bool)

(assert (=> b!291974 (= c!47020 (or (= lt!144466 k!2524) (= (bvadd lt!144466 lt!144466) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291975 () Bool)

(assert (=> b!291975 (= e!184741 (Intermediate!2141 true lt!144360 #b00000000000000000000000000000000))))

(declare-fun b!291976 () Bool)

(assert (=> b!291976 (and (bvsge (index!10736 lt!144467) #b00000000000000000000000000000000) (bvslt (index!10736 lt!144467) (size!7344 (array!14737 (store (arr!6992 a!3312) i!1256 k!2524) (size!7344 a!3312)))))))

(declare-fun res!153061 () Bool)

(assert (=> b!291976 (= res!153061 (= (select (arr!6992 (array!14737 (store (arr!6992 a!3312) i!1256 k!2524) (size!7344 a!3312))) (index!10736 lt!144467)) k!2524))))

(assert (=> b!291976 (=> res!153061 e!184742)))

(assert (=> b!291976 (= e!184743 e!184742)))

(declare-fun b!291977 () Bool)

(assert (=> b!291977 (and (bvsge (index!10736 lt!144467) #b00000000000000000000000000000000) (bvslt (index!10736 lt!144467) (size!7344 (array!14737 (store (arr!6992 a!3312) i!1256 k!2524) (size!7344 a!3312)))))))

(assert (=> b!291977 (= e!184742 (= (select (arr!6992 (array!14737 (store (arr!6992 a!3312) i!1256 k!2524) (size!7344 a!3312))) (index!10736 lt!144467)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66449 c!47021) b!291975))

(assert (= (and d!66449 (not c!47021)) b!291974))

(assert (= (and b!291974 c!47020) b!291973))

(assert (= (and b!291974 (not c!47020)) b!291969))

(assert (= (and d!66449 c!47022) b!291970))

(assert (= (and d!66449 (not c!47022)) b!291972))

(assert (= (and b!291972 res!153062) b!291976))

(assert (= (and b!291976 (not res!153061)) b!291971))

(assert (= (and b!291971 (not res!153060)) b!291977))

(declare-fun m!305727 () Bool)

(assert (=> b!291969 m!305727))

(assert (=> b!291969 m!305727))

(declare-fun m!305729 () Bool)

(assert (=> b!291969 m!305729))

(declare-fun m!305731 () Bool)

(assert (=> b!291976 m!305731))

(assert (=> b!291977 m!305731))

(declare-fun m!305733 () Bool)

(assert (=> d!66449 m!305733))

(assert (=> d!66449 m!305593))

(assert (=> b!291971 m!305731))

(assert (=> b!291745 d!66449))

(declare-fun b!291978 () Bool)

(declare-fun e!184745 () SeekEntryResult!2141)

(assert (=> b!291978 (= e!184745 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144360 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!291979 () Bool)

(declare-fun e!184744 () Bool)

(declare-fun lt!144469 () SeekEntryResult!2141)

(assert (=> b!291979 (= e!184744 (bvsge (x!28926 lt!144469) #b01111111111111111111111111111110))))

(declare-fun b!291980 () Bool)

(assert (=> b!291980 (and (bvsge (index!10736 lt!144469) #b00000000000000000000000000000000) (bvslt (index!10736 lt!144469) (size!7344 a!3312)))))

(declare-fun res!153063 () Bool)

(assert (=> b!291980 (= res!153063 (= (select (arr!6992 a!3312) (index!10736 lt!144469)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184747 () Bool)

(assert (=> b!291980 (=> res!153063 e!184747)))

(declare-fun d!66465 () Bool)

(assert (=> d!66465 e!184744))

(declare-fun c!47025 () Bool)

(assert (=> d!66465 (= c!47025 (and (is-Intermediate!2141 lt!144469) (undefined!2953 lt!144469)))))

(declare-fun e!184746 () SeekEntryResult!2141)

(assert (=> d!66465 (= lt!144469 e!184746)))

(declare-fun c!47024 () Bool)

(assert (=> d!66465 (= c!47024 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144468 () (_ BitVec 64))

(assert (=> d!66465 (= lt!144468 (select (arr!6992 a!3312) lt!144360))))

(assert (=> d!66465 (validMask!0 mask!3809)))

(assert (=> d!66465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144360 k!2524 a!3312 mask!3809) lt!144469)))

(declare-fun b!291981 () Bool)

(declare-fun e!184748 () Bool)

(assert (=> b!291981 (= e!184744 e!184748)))

(declare-fun res!153065 () Bool)

(assert (=> b!291981 (= res!153065 (and (is-Intermediate!2141 lt!144469) (not (undefined!2953 lt!144469)) (bvslt (x!28926 lt!144469) #b01111111111111111111111111111110) (bvsge (x!28926 lt!144469) #b00000000000000000000000000000000) (bvsge (x!28926 lt!144469) #b00000000000000000000000000000000)))))

(assert (=> b!291981 (=> (not res!153065) (not e!184748))))

(declare-fun b!291982 () Bool)

(assert (=> b!291982 (= e!184745 (Intermediate!2141 false lt!144360 #b00000000000000000000000000000000))))

(declare-fun b!291983 () Bool)

(assert (=> b!291983 (= e!184746 e!184745)))

(declare-fun c!47023 () Bool)

(assert (=> b!291983 (= c!47023 (or (= lt!144468 k!2524) (= (bvadd lt!144468 lt!144468) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291984 () Bool)

(assert (=> b!291984 (= e!184746 (Intermediate!2141 true lt!144360 #b00000000000000000000000000000000))))

(declare-fun b!291985 () Bool)

(assert (=> b!291985 (and (bvsge (index!10736 lt!144469) #b00000000000000000000000000000000) (bvslt (index!10736 lt!144469) (size!7344 a!3312)))))

(declare-fun res!153064 () Bool)

(assert (=> b!291985 (= res!153064 (= (select (arr!6992 a!3312) (index!10736 lt!144469)) k!2524))))

(assert (=> b!291985 (=> res!153064 e!184747)))

(assert (=> b!291985 (= e!184748 e!184747)))

(declare-fun b!291986 () Bool)

(assert (=> b!291986 (and (bvsge (index!10736 lt!144469) #b00000000000000000000000000000000) (bvslt (index!10736 lt!144469) (size!7344 a!3312)))))

(assert (=> b!291986 (= e!184747 (= (select (arr!6992 a!3312) (index!10736 lt!144469)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66465 c!47024) b!291984))

(assert (= (and d!66465 (not c!47024)) b!291983))

(assert (= (and b!291983 c!47023) b!291982))

(assert (= (and b!291983 (not c!47023)) b!291978))

(assert (= (and d!66465 c!47025) b!291979))

(assert (= (and d!66465 (not c!47025)) b!291981))

(assert (= (and b!291981 res!153065) b!291985))

(assert (= (and b!291985 (not res!153064)) b!291980))

(assert (= (and b!291980 (not res!153063)) b!291986))

(assert (=> b!291978 m!305727))

(assert (=> b!291978 m!305727))

(declare-fun m!305735 () Bool)

(assert (=> b!291978 m!305735))

(declare-fun m!305737 () Bool)

(assert (=> b!291985 m!305737))

(assert (=> b!291986 m!305737))

(declare-fun m!305739 () Bool)

(assert (=> d!66465 m!305739))

(assert (=> d!66465 m!305593))

(assert (=> b!291980 m!305737))

(assert (=> b!291745 d!66465))

(declare-fun d!66467 () Bool)

(declare-fun lt!144475 () (_ BitVec 32))

(declare-fun lt!144474 () (_ BitVec 32))

(assert (=> d!66467 (= lt!144475 (bvmul (bvxor lt!144474 (bvlshr lt!144474 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66467 (= lt!144474 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66467 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!153066 (let ((h!5267 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28934 (bvmul (bvxor h!5267 (bvlshr h!5267 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28934 (bvlshr x!28934 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!153066 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!153066 #b00000000000000000000000000000000))))))

(assert (=> d!66467 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!144475 (bvlshr lt!144475 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!291745 d!66467))

(declare-fun b!291995 () Bool)

(declare-fun e!184755 () Bool)

(declare-fun e!184756 () Bool)

(assert (=> b!291995 (= e!184755 e!184756)))

(declare-fun lt!144482 () (_ BitVec 64))

(assert (=> b!291995 (= lt!144482 (select (arr!6992 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9154 0))(
  ( (Unit!9155) )
))
(declare-fun lt!144483 () Unit!9154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14736 (_ BitVec 64) (_ BitVec 32)) Unit!9154)

(assert (=> b!291995 (= lt!144483 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!144482 #b00000000000000000000000000000000))))

(assert (=> b!291995 (arrayContainsKey!0 a!3312 lt!144482 #b00000000000000000000000000000000)))

(declare-fun lt!144484 () Unit!9154)

(assert (=> b!291995 (= lt!144484 lt!144483)))

(declare-fun res!153071 () Bool)

(assert (=> b!291995 (= res!153071 (= (seekEntryOrOpen!0 (select (arr!6992 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2141 #b00000000000000000000000000000000)))))

(assert (=> b!291995 (=> (not res!153071) (not e!184756))))

(declare-fun d!66469 () Bool)

(declare-fun res!153072 () Bool)

(declare-fun e!184757 () Bool)

(assert (=> d!66469 (=> res!153072 e!184757)))

(assert (=> d!66469 (= res!153072 (bvsge #b00000000000000000000000000000000 (size!7344 a!3312)))))

(assert (=> d!66469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!184757)))

(declare-fun b!291996 () Bool)

(declare-fun call!25660 () Bool)

(assert (=> b!291996 (= e!184756 call!25660)))

(declare-fun b!291997 () Bool)

(assert (=> b!291997 (= e!184757 e!184755)))

(declare-fun c!47028 () Bool)

(assert (=> b!291997 (= c!47028 (validKeyInArray!0 (select (arr!6992 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25657 () Bool)

(assert (=> bm!25657 (= call!25660 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!291998 () Bool)

(assert (=> b!291998 (= e!184755 call!25660)))

(assert (= (and d!66469 (not res!153072)) b!291997))

(assert (= (and b!291997 c!47028) b!291995))

(assert (= (and b!291997 (not c!47028)) b!291998))

(assert (= (and b!291995 res!153071) b!291996))

(assert (= (or b!291996 b!291998) bm!25657))

(assert (=> b!291995 m!305687))

(declare-fun m!305741 () Bool)

(assert (=> b!291995 m!305741))

(declare-fun m!305743 () Bool)

(assert (=> b!291995 m!305743))

(assert (=> b!291995 m!305687))

(declare-fun m!305745 () Bool)

(assert (=> b!291995 m!305745))

(assert (=> b!291997 m!305687))

(assert (=> b!291997 m!305687))

(declare-fun m!305747 () Bool)

(assert (=> b!291997 m!305747))

(declare-fun m!305749 () Bool)

(assert (=> bm!25657 m!305749))

(assert (=> b!291750 d!66469))

(push 1)

(assert (not b!291902))

(assert (not d!66421))

(assert (not b!291997))

(assert (not d!66465))

(assert (not bm!25657))

(assert (not b!291969))

(assert (not b!291995))

(assert (not b!291878))

(assert (not d!66449))

(assert (not b!291978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

