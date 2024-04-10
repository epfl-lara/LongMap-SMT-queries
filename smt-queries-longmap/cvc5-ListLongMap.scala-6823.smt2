; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85838 () Bool)

(assert start!85838)

(declare-fun b!995304 () Bool)

(declare-fun e!561637 () Bool)

(declare-fun e!561636 () Bool)

(assert (=> b!995304 (= e!561637 e!561636)))

(declare-fun res!665670 () Bool)

(assert (=> b!995304 (=> res!665670 e!561636)))

(declare-datatypes ((List!20998 0))(
  ( (Nil!20995) (Cons!20994 (h!22156 (_ BitVec 64)) (t!29999 List!20998)) )
))
(declare-fun contains!5859 (List!20998 (_ BitVec 64)) Bool)

(assert (=> b!995304 (= res!665670 (contains!5859 Nil!20995 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995305 () Bool)

(declare-fun res!665674 () Bool)

(declare-fun e!561634 () Bool)

(assert (=> b!995305 (=> (not res!665674) (not e!561634))))

(declare-datatypes ((array!62972 0))(
  ( (array!62973 (arr!30322 (Array (_ BitVec 32) (_ BitVec 64))) (size!30824 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62972)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995305 (= res!665674 (validKeyInArray!0 (select (arr!30322 a!3219) j!170)))))

(declare-fun b!995306 () Bool)

(declare-fun res!665673 () Bool)

(assert (=> b!995306 (=> (not res!665673) (not e!561634))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995306 (= res!665673 (and (= (size!30824 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30824 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30824 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995307 () Bool)

(assert (=> b!995307 (= e!561636 (contains!5859 Nil!20995 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995308 () Bool)

(assert (=> b!995308 (= e!561634 e!561637)))

(declare-fun res!665672 () Bool)

(assert (=> b!995308 (=> (not res!665672) (not e!561637))))

(declare-datatypes ((SeekEntryResult!9254 0))(
  ( (MissingZero!9254 (index!39387 (_ BitVec 32))) (Found!9254 (index!39388 (_ BitVec 32))) (Intermediate!9254 (undefined!10066 Bool) (index!39389 (_ BitVec 32)) (x!86831 (_ BitVec 32))) (Undefined!9254) (MissingVacant!9254 (index!39390 (_ BitVec 32))) )
))
(declare-fun lt!440915 () SeekEntryResult!9254)

(assert (=> b!995308 (= res!665672 (or (= lt!440915 (MissingVacant!9254 i!1194)) (= lt!440915 (MissingZero!9254 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62972 (_ BitVec 32)) SeekEntryResult!9254)

(assert (=> b!995308 (= lt!440915 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!995310 () Bool)

(declare-fun res!665675 () Bool)

(assert (=> b!995310 (=> (not res!665675) (not e!561637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62972 (_ BitVec 32)) Bool)

(assert (=> b!995310 (= res!665675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995311 () Bool)

(declare-fun res!665667 () Bool)

(assert (=> b!995311 (=> (not res!665667) (not e!561637))))

(assert (=> b!995311 (= res!665667 (and (bvsle #b00000000000000000000000000000000 (size!30824 a!3219)) (bvslt (size!30824 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!995312 () Bool)

(declare-fun res!665676 () Bool)

(assert (=> b!995312 (=> (not res!665676) (not e!561637))))

(declare-fun noDuplicate!1457 (List!20998) Bool)

(assert (=> b!995312 (= res!665676 (noDuplicate!1457 Nil!20995))))

(declare-fun b!995313 () Bool)

(declare-fun res!665671 () Bool)

(assert (=> b!995313 (=> (not res!665671) (not e!561634))))

(assert (=> b!995313 (= res!665671 (validKeyInArray!0 k!2224))))

(declare-fun b!995309 () Bool)

(declare-fun res!665669 () Bool)

(assert (=> b!995309 (=> (not res!665669) (not e!561634))))

(declare-fun arrayContainsKey!0 (array!62972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995309 (= res!665669 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!665668 () Bool)

(assert (=> start!85838 (=> (not res!665668) (not e!561634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85838 (= res!665668 (validMask!0 mask!3464))))

(assert (=> start!85838 e!561634))

(declare-fun array_inv!23446 (array!62972) Bool)

(assert (=> start!85838 (array_inv!23446 a!3219)))

(assert (=> start!85838 true))

(assert (= (and start!85838 res!665668) b!995306))

(assert (= (and b!995306 res!665673) b!995305))

(assert (= (and b!995305 res!665674) b!995313))

(assert (= (and b!995313 res!665671) b!995309))

(assert (= (and b!995309 res!665669) b!995308))

(assert (= (and b!995308 res!665672) b!995310))

(assert (= (and b!995310 res!665675) b!995311))

(assert (= (and b!995311 res!665667) b!995312))

(assert (= (and b!995312 res!665676) b!995304))

(assert (= (and b!995304 (not res!665670)) b!995307))

(declare-fun m!922733 () Bool)

(assert (=> b!995308 m!922733))

(declare-fun m!922735 () Bool)

(assert (=> b!995307 m!922735))

(declare-fun m!922737 () Bool)

(assert (=> b!995305 m!922737))

(assert (=> b!995305 m!922737))

(declare-fun m!922739 () Bool)

(assert (=> b!995305 m!922739))

(declare-fun m!922741 () Bool)

(assert (=> b!995312 m!922741))

(declare-fun m!922743 () Bool)

(assert (=> start!85838 m!922743))

(declare-fun m!922745 () Bool)

(assert (=> start!85838 m!922745))

(declare-fun m!922747 () Bool)

(assert (=> b!995304 m!922747))

(declare-fun m!922749 () Bool)

(assert (=> b!995313 m!922749))

(declare-fun m!922751 () Bool)

(assert (=> b!995310 m!922751))

(declare-fun m!922753 () Bool)

(assert (=> b!995309 m!922753))

(push 1)

(assert (not b!995309))

(assert (not b!995307))

(assert (not b!995310))

(assert (not b!995304))

(assert (not b!995312))

(assert (not b!995305))

(assert (not start!85838))

(assert (not b!995313))

(assert (not b!995308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!561692 () SeekEntryResult!9254)

(declare-fun b!995408 () Bool)

(declare-fun lt!440932 () SeekEntryResult!9254)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62972 (_ BitVec 32)) SeekEntryResult!9254)

(assert (=> b!995408 (= e!561692 (seekKeyOrZeroReturnVacant!0 (x!86831 lt!440932) (index!39389 lt!440932) (index!39389 lt!440932) k!2224 a!3219 mask!3464))))

(declare-fun b!995409 () Bool)

(declare-fun e!561691 () SeekEntryResult!9254)

(declare-fun e!561690 () SeekEntryResult!9254)

(assert (=> b!995409 (= e!561691 e!561690)))

(declare-fun lt!440933 () (_ BitVec 64))

(assert (=> b!995409 (= lt!440933 (select (arr!30322 a!3219) (index!39389 lt!440932)))))

(declare-fun c!100965 () Bool)

(assert (=> b!995409 (= c!100965 (= lt!440933 k!2224))))

(declare-fun b!995410 () Bool)

(assert (=> b!995410 (= e!561690 (Found!9254 (index!39389 lt!440932)))))

(declare-fun b!995411 () Bool)

(assert (=> b!995411 (= e!561691 Undefined!9254)))

(declare-fun b!995413 () Bool)

(assert (=> b!995413 (= e!561692 (MissingZero!9254 (index!39389 lt!440932)))))

(declare-fun b!995412 () Bool)

(declare-fun c!100967 () Bool)

(assert (=> b!995412 (= c!100967 (= lt!440933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!995412 (= e!561690 e!561692)))

(declare-fun d!118839 () Bool)

(declare-fun lt!440931 () SeekEntryResult!9254)

(assert (=> d!118839 (and (or (is-Undefined!9254 lt!440931) (not (is-Found!9254 lt!440931)) (and (bvsge (index!39388 lt!440931) #b00000000000000000000000000000000) (bvslt (index!39388 lt!440931) (size!30824 a!3219)))) (or (is-Undefined!9254 lt!440931) (is-Found!9254 lt!440931) (not (is-MissingZero!9254 lt!440931)) (and (bvsge (index!39387 lt!440931) #b00000000000000000000000000000000) (bvslt (index!39387 lt!440931) (size!30824 a!3219)))) (or (is-Undefined!9254 lt!440931) (is-Found!9254 lt!440931) (is-MissingZero!9254 lt!440931) (not (is-MissingVacant!9254 lt!440931)) (and (bvsge (index!39390 lt!440931) #b00000000000000000000000000000000) (bvslt (index!39390 lt!440931) (size!30824 a!3219)))) (or (is-Undefined!9254 lt!440931) (ite (is-Found!9254 lt!440931) (= (select (arr!30322 a!3219) (index!39388 lt!440931)) k!2224) (ite (is-MissingZero!9254 lt!440931) (= (select (arr!30322 a!3219) (index!39387 lt!440931)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9254 lt!440931) (= (select (arr!30322 a!3219) (index!39390 lt!440931)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118839 (= lt!440931 e!561691)))

(declare-fun c!100966 () Bool)

(assert (=> d!118839 (= c!100966 (and (is-Intermediate!9254 lt!440932) (undefined!10066 lt!440932)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62972 (_ BitVec 32)) SeekEntryResult!9254)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118839 (= lt!440932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!118839 (validMask!0 mask!3464)))

(assert (=> d!118839 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!440931)))

(assert (= (and d!118839 c!100966) b!995411))

(assert (= (and d!118839 (not c!100966)) b!995409))

(assert (= (and b!995409 c!100965) b!995410))

(assert (= (and b!995409 (not c!100965)) b!995412))

(assert (= (and b!995412 c!100967) b!995413))

(assert (= (and b!995412 (not c!100967)) b!995408))

(declare-fun m!922813 () Bool)

(assert (=> b!995408 m!922813))

(declare-fun m!922815 () Bool)

(assert (=> b!995409 m!922815))

(declare-fun m!922817 () Bool)

(assert (=> d!118839 m!922817))

(declare-fun m!922819 () Bool)

(assert (=> d!118839 m!922819))

(declare-fun m!922821 () Bool)

(assert (=> d!118839 m!922821))

(assert (=> d!118839 m!922817))

(declare-fun m!922823 () Bool)

(assert (=> d!118839 m!922823))

(declare-fun m!922825 () Bool)

(assert (=> d!118839 m!922825))

(assert (=> d!118839 m!922743))

(assert (=> b!995308 d!118839))

(declare-fun d!118859 () Bool)

(assert (=> d!118859 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995313 d!118859))

(declare-fun d!118863 () Bool)

(assert (=> d!118863 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85838 d!118863))

(declare-fun d!118877 () Bool)

(assert (=> d!118877 (= (array_inv!23446 a!3219) (bvsge (size!30824 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85838 d!118877))

(declare-fun d!118879 () Bool)

(declare-fun lt!440955 () Bool)

(declare-fun content!482 (List!20998) (Set (_ BitVec 64)))

(assert (=> d!118879 (= lt!440955 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!482 Nil!20995)))))

(declare-fun e!561729 () Bool)

(assert (=> d!118879 (= lt!440955 e!561729)))

(declare-fun res!665789 () Bool)

(assert (=> d!118879 (=> (not res!665789) (not e!561729))))

(assert (=> d!118879 (= res!665789 (is-Cons!20994 Nil!20995))))

(assert (=> d!118879 (= (contains!5859 Nil!20995 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440955)))

(declare-fun b!995454 () Bool)

(declare-fun e!561728 () Bool)

(assert (=> b!995454 (= e!561729 e!561728)))

(declare-fun res!665790 () Bool)

(assert (=> b!995454 (=> res!665790 e!561728)))

(assert (=> b!995454 (= res!665790 (= (h!22156 Nil!20995) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995455 () Bool)

(assert (=> b!995455 (= e!561728 (contains!5859 (t!29999 Nil!20995) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118879 res!665789) b!995454))

(assert (= (and b!995454 (not res!665790)) b!995455))

(declare-fun m!922855 () Bool)

(assert (=> d!118879 m!922855))

(declare-fun m!922857 () Bool)

(assert (=> d!118879 m!922857))

(declare-fun m!922859 () Bool)

(assert (=> b!995455 m!922859))

(assert (=> b!995307 d!118879))

(declare-fun d!118881 () Bool)

(declare-fun res!665797 () Bool)

(declare-fun e!561737 () Bool)

(assert (=> d!118881 (=> res!665797 e!561737)))

(assert (=> d!118881 (= res!665797 (is-Nil!20995 Nil!20995))))

(assert (=> d!118881 (= (noDuplicate!1457 Nil!20995) e!561737)))

(declare-fun b!995464 () Bool)

(declare-fun e!561738 () Bool)

(assert (=> b!995464 (= e!561737 e!561738)))

(declare-fun res!665798 () Bool)

(assert (=> b!995464 (=> (not res!665798) (not e!561738))))

(assert (=> b!995464 (= res!665798 (not (contains!5859 (t!29999 Nil!20995) (h!22156 Nil!20995))))))

(declare-fun b!995465 () Bool)

(assert (=> b!995465 (= e!561738 (noDuplicate!1457 (t!29999 Nil!20995)))))

(assert (= (and d!118881 (not res!665797)) b!995464))

(assert (= (and b!995464 res!665798) b!995465))

(declare-fun m!922871 () Bool)

(assert (=> b!995464 m!922871))

(declare-fun m!922873 () Bool)

(assert (=> b!995465 m!922873))

(assert (=> b!995312 d!118881))

(declare-fun d!118885 () Bool)

(assert (=> d!118885 (= (validKeyInArray!0 (select (arr!30322 a!3219) j!170)) (and (not (= (select (arr!30322 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30322 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995305 d!118885))

(declare-fun b!995486 () Bool)

(declare-fun e!561753 () Bool)

(declare-fun call!42203 () Bool)

(assert (=> b!995486 (= e!561753 call!42203)))

(declare-fun b!995487 () Bool)

(declare-fun e!561751 () Bool)

(declare-fun e!561752 () Bool)

(assert (=> b!995487 (= e!561751 e!561752)))

(declare-fun c!100982 () Bool)

(assert (=> b!995487 (= c!100982 (validKeyInArray!0 (select (arr!30322 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118887 () Bool)

(declare-fun res!665804 () Bool)

(assert (=> d!118887 (=> res!665804 e!561751)))

(assert (=> d!118887 (= res!665804 (bvsge #b00000000000000000000000000000000 (size!30824 a!3219)))))

(assert (=> d!118887 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561751)))

(declare-fun b!995488 () Bool)

(assert (=> b!995488 (= e!561752 call!42203)))

(declare-fun bm!42200 () Bool)

(assert (=> bm!42200 (= call!42203 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!995489 () Bool)

(assert (=> b!995489 (= e!561752 e!561753)))

(declare-fun lt!440972 () (_ BitVec 64))

(assert (=> b!995489 (= lt!440972 (select (arr!30322 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32958 0))(
  ( (Unit!32959) )
))
(declare-fun lt!440971 () Unit!32958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62972 (_ BitVec 64) (_ BitVec 32)) Unit!32958)

(assert (=> b!995489 (= lt!440971 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440972 #b00000000000000000000000000000000))))

(assert (=> b!995489 (arrayContainsKey!0 a!3219 lt!440972 #b00000000000000000000000000000000)))

(declare-fun lt!440973 () Unit!32958)

(assert (=> b!995489 (= lt!440973 lt!440971)))

(declare-fun res!665803 () Bool)

(assert (=> b!995489 (= res!665803 (= (seekEntryOrOpen!0 (select (arr!30322 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9254 #b00000000000000000000000000000000)))))

(assert (=> b!995489 (=> (not res!665803) (not e!561753))))

(assert (= (and d!118887 (not res!665804)) b!995487))

(assert (= (and b!995487 c!100982) b!995489))

(assert (= (and b!995487 (not c!100982)) b!995488))

(assert (= (and b!995489 res!665803) b!995486))

(assert (= (or b!995486 b!995488) bm!42200))

(declare-fun m!922875 () Bool)

(assert (=> b!995487 m!922875))

(assert (=> b!995487 m!922875))

(declare-fun m!922877 () Bool)

(assert (=> b!995487 m!922877))

(declare-fun m!922879 () Bool)

(assert (=> bm!42200 m!922879))

(assert (=> b!995489 m!922875))

(declare-fun m!922881 () Bool)

(assert (=> b!995489 m!922881))

(declare-fun m!922883 () Bool)

(assert (=> b!995489 m!922883))

(assert (=> b!995489 m!922875))

(declare-fun m!922885 () Bool)

(assert (=> b!995489 m!922885))

(assert (=> b!995310 d!118887))

(declare-fun d!118889 () Bool)

(declare-fun lt!440974 () Bool)

(assert (=> d!118889 (= lt!440974 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!482 Nil!20995)))))

(declare-fun e!561755 () Bool)

(assert (=> d!118889 (= lt!440974 e!561755)))

(declare-fun res!665805 () Bool)

(assert (=> d!118889 (=> (not res!665805) (not e!561755))))

(assert (=> d!118889 (= res!665805 (is-Cons!20994 Nil!20995))))

(assert (=> d!118889 (= (contains!5859 Nil!20995 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440974)))

(declare-fun b!995490 () Bool)

(declare-fun e!561754 () Bool)

(assert (=> b!995490 (= e!561755 e!561754)))

(declare-fun res!665806 () Bool)

(assert (=> b!995490 (=> res!665806 e!561754)))

(assert (=> b!995490 (= res!665806 (= (h!22156 Nil!20995) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995491 () Bool)

(assert (=> b!995491 (= e!561754 (contains!5859 (t!29999 Nil!20995) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118889 res!665805) b!995490))

(assert (= (and b!995490 (not res!665806)) b!995491))

(assert (=> d!118889 m!922855))

(declare-fun m!922887 () Bool)

(assert (=> d!118889 m!922887))

(declare-fun m!922889 () Bool)

(assert (=> b!995491 m!922889))

(assert (=> b!995304 d!118889))

(declare-fun d!118891 () Bool)

(declare-fun res!665811 () Bool)

(declare-fun e!561763 () Bool)

(assert (=> d!118891 (=> res!665811 e!561763)))

(assert (=> d!118891 (= res!665811 (= (select (arr!30322 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!118891 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!561763)))

(declare-fun b!995502 () Bool)

(declare-fun e!561764 () Bool)

(assert (=> b!995502 (= e!561763 e!561764)))

(declare-fun res!665812 () Bool)

(assert (=> b!995502 (=> (not res!665812) (not e!561764))))

(assert (=> b!995502 (= res!665812 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30824 a!3219)))))

(declare-fun b!995503 () Bool)

(assert (=> b!995503 (= e!561764 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118891 (not res!665811)) b!995502))

(assert (= (and b!995502 res!665812) b!995503))

(assert (=> d!118891 m!922875))

(declare-fun m!922905 () Bool)

(assert (=> b!995503 m!922905))

(assert (=> b!995309 d!118891))

(push 1)

