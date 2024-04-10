; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32156 () Bool)

(assert start!32156)

(declare-fun b!320480 () Bool)

(declare-fun res!174725 () Bool)

(declare-fun e!198825 () Bool)

(assert (=> b!320480 (=> (not res!174725) (not e!198825))))

(declare-datatypes ((array!16391 0))(
  ( (array!16392 (arr!7756 (Array (_ BitVec 32) (_ BitVec 64))) (size!8108 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16391)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16391 (_ BitVec 32)) Bool)

(assert (=> b!320480 (= res!174725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320481 () Bool)

(declare-fun res!174729 () Bool)

(assert (=> b!320481 (=> (not res!174729) (not e!198825))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320481 (= res!174729 (and (= (size!8108 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8108 a!3305))))))

(declare-fun b!320482 () Bool)

(declare-fun res!174726 () Bool)

(assert (=> b!320482 (=> (not res!174726) (not e!198825))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320482 (= res!174726 (validKeyInArray!0 k!2497))))

(declare-fun b!320483 () Bool)

(declare-fun res!174723 () Bool)

(assert (=> b!320483 (=> (not res!174723) (not e!198825))))

(declare-fun arrayContainsKey!0 (array!16391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320483 (= res!174723 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320484 () Bool)

(declare-fun res!174727 () Bool)

(assert (=> b!320484 (=> (not res!174727) (not e!198825))))

(declare-datatypes ((SeekEntryResult!2887 0))(
  ( (MissingZero!2887 (index!13724 (_ BitVec 32))) (Found!2887 (index!13725 (_ BitVec 32))) (Intermediate!2887 (undefined!3699 Bool) (index!13726 (_ BitVec 32)) (x!31988 (_ BitVec 32))) (Undefined!2887) (MissingVacant!2887 (index!13727 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16391 (_ BitVec 32)) SeekEntryResult!2887)

(assert (=> b!320484 (= res!174727 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2887 i!1250)))))

(declare-fun res!174724 () Bool)

(assert (=> start!32156 (=> (not res!174724) (not e!198825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32156 (= res!174724 (validMask!0 mask!3777))))

(assert (=> start!32156 e!198825))

(declare-fun array_inv!5719 (array!16391) Bool)

(assert (=> start!32156 (array_inv!5719 a!3305)))

(assert (=> start!32156 true))

(declare-fun b!320485 () Bool)

(declare-fun res!174728 () Bool)

(assert (=> b!320485 (=> (not res!174728) (not e!198825))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16391 (_ BitVec 32)) SeekEntryResult!2887)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320485 (= res!174728 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2887 false resIndex!58 resX!58)))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!320486 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!320486 (= e!198825 (and (= (select (arr!7756 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8108 a!3305)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(assert (= (and start!32156 res!174724) b!320481))

(assert (= (and b!320481 res!174729) b!320482))

(assert (= (and b!320482 res!174726) b!320483))

(assert (= (and b!320483 res!174723) b!320484))

(assert (= (and b!320484 res!174727) b!320480))

(assert (= (and b!320480 res!174725) b!320485))

(assert (= (and b!320485 res!174728) b!320486))

(declare-fun m!328853 () Bool)

(assert (=> b!320484 m!328853))

(declare-fun m!328855 () Bool)

(assert (=> start!32156 m!328855))

(declare-fun m!328857 () Bool)

(assert (=> start!32156 m!328857))

(declare-fun m!328859 () Bool)

(assert (=> b!320483 m!328859))

(declare-fun m!328861 () Bool)

(assert (=> b!320485 m!328861))

(assert (=> b!320485 m!328861))

(declare-fun m!328863 () Bool)

(assert (=> b!320485 m!328863))

(declare-fun m!328865 () Bool)

(assert (=> b!320480 m!328865))

(declare-fun m!328867 () Bool)

(assert (=> b!320482 m!328867))

(declare-fun m!328869 () Bool)

(assert (=> b!320486 m!328869))

(push 1)

(assert (not b!320482))

(assert (not b!320480))

(assert (not start!32156))

(assert (not b!320484))

(assert (not b!320483))

(assert (not b!320485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!320501 () Bool)

(declare-fun e!198839 () Bool)

(declare-fun call!26056 () Bool)

(assert (=> b!320501 (= e!198839 call!26056)))

(declare-fun d!69449 () Bool)

(declare-fun res!174740 () Bool)

(declare-fun e!198841 () Bool)

(assert (=> d!69449 (=> res!174740 e!198841)))

(assert (=> d!69449 (= res!174740 (bvsge #b00000000000000000000000000000000 (size!8108 a!3305)))))

(assert (=> d!69449 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198841)))

(declare-fun b!320502 () Bool)

(assert (=> b!320502 (= e!198841 e!198839)))

(declare-fun c!50505 () Bool)

(assert (=> b!320502 (= c!50505 (validKeyInArray!0 (select (arr!7756 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!320503 () Bool)

(declare-fun e!198840 () Bool)

(assert (=> b!320503 (= e!198840 call!26056)))

(declare-fun bm!26053 () Bool)

(assert (=> bm!26053 (= call!26056 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!320504 () Bool)

(assert (=> b!320504 (= e!198839 e!198840)))

(declare-fun lt!156020 () (_ BitVec 64))

(assert (=> b!320504 (= lt!156020 (select (arr!7756 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9824 0))(
  ( (Unit!9825) )
))
(declare-fun lt!156019 () Unit!9824)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16391 (_ BitVec 64) (_ BitVec 32)) Unit!9824)

(assert (=> b!320504 (= lt!156019 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!156020 #b00000000000000000000000000000000))))

(assert (=> b!320504 (arrayContainsKey!0 a!3305 lt!156020 #b00000000000000000000000000000000)))

(declare-fun lt!156021 () Unit!9824)

(assert (=> b!320504 (= lt!156021 lt!156019)))

(declare-fun res!174741 () Bool)

(assert (=> b!320504 (= res!174741 (= (seekEntryOrOpen!0 (select (arr!7756 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2887 #b00000000000000000000000000000000)))))

(assert (=> b!320504 (=> (not res!174741) (not e!198840))))

(assert (= (and d!69449 (not res!174740)) b!320502))

(assert (= (and b!320502 c!50505) b!320504))

(assert (= (and b!320502 (not c!50505)) b!320501))

(assert (= (and b!320504 res!174741) b!320503))

(assert (= (or b!320503 b!320501) bm!26053))

(declare-fun m!328875 () Bool)

(assert (=> b!320502 m!328875))

(assert (=> b!320502 m!328875))

(declare-fun m!328877 () Bool)

(assert (=> b!320502 m!328877))

(declare-fun m!328879 () Bool)

(assert (=> bm!26053 m!328879))

(assert (=> b!320504 m!328875))

(declare-fun m!328881 () Bool)

(assert (=> b!320504 m!328881))

(declare-fun m!328883 () Bool)

(assert (=> b!320504 m!328883))

(assert (=> b!320504 m!328875))

(declare-fun m!328885 () Bool)

(assert (=> b!320504 m!328885))

(assert (=> b!320480 d!69449))

(declare-fun b!320571 () Bool)

(declare-fun lt!156054 () SeekEntryResult!2887)

(assert (=> b!320571 (and (bvsge (index!13726 lt!156054) #b00000000000000000000000000000000) (bvslt (index!13726 lt!156054) (size!8108 a!3305)))))

(declare-fun res!174754 () Bool)

(assert (=> b!320571 (= res!174754 (= (select (arr!7756 a!3305) (index!13726 lt!156054)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198883 () Bool)

(assert (=> b!320571 (=> res!174754 e!198883)))

(declare-fun d!69453 () Bool)

(declare-fun e!198879 () Bool)

(assert (=> d!69453 e!198879))

(declare-fun c!50534 () Bool)

(assert (=> d!69453 (= c!50534 (and (is-Intermediate!2887 lt!156054) (undefined!3699 lt!156054)))))

(declare-fun e!198882 () SeekEntryResult!2887)

(assert (=> d!69453 (= lt!156054 e!198882)))

(declare-fun c!50533 () Bool)

(assert (=> d!69453 (= c!50533 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!156053 () (_ BitVec 64))

(assert (=> d!69453 (= lt!156053 (select (arr!7756 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69453 (validMask!0 mask!3777)))

(assert (=> d!69453 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156054)))

(declare-fun b!320572 () Bool)

(declare-fun e!198881 () SeekEntryResult!2887)

(assert (=> b!320572 (= e!198882 e!198881)))

(declare-fun c!50535 () Bool)

(assert (=> b!320572 (= c!50535 (or (= lt!156053 k!2497) (= (bvadd lt!156053 lt!156053) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320573 () Bool)

(assert (=> b!320573 (and (bvsge (index!13726 lt!156054) #b00000000000000000000000000000000) (bvslt (index!13726 lt!156054) (size!8108 a!3305)))))

(declare-fun res!174756 () Bool)

(assert (=> b!320573 (= res!174756 (= (select (arr!7756 a!3305) (index!13726 lt!156054)) k!2497))))

(assert (=> b!320573 (=> res!174756 e!198883)))

(declare-fun e!198880 () Bool)

(assert (=> b!320573 (= e!198880 e!198883)))

(declare-fun b!320574 () Bool)

(assert (=> b!320574 (= e!198879 e!198880)))

(declare-fun res!174755 () Bool)

(assert (=> b!320574 (= res!174755 (and (is-Intermediate!2887 lt!156054) (not (undefined!3699 lt!156054)) (bvslt (x!31988 lt!156054) #b01111111111111111111111111111110) (bvsge (x!31988 lt!156054) #b00000000000000000000000000000000) (bvsge (x!31988 lt!156054) #b00000000000000000000000000000000)))))

(assert (=> b!320574 (=> (not res!174755) (not e!198880))))

(declare-fun b!320575 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320575 (= e!198881 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!320576 () Bool)

(assert (=> b!320576 (= e!198881 (Intermediate!2887 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!320577 () Bool)

(assert (=> b!320577 (and (bvsge (index!13726 lt!156054) #b00000000000000000000000000000000) (bvslt (index!13726 lt!156054) (size!8108 a!3305)))))

(assert (=> b!320577 (= e!198883 (= (select (arr!7756 a!3305) (index!13726 lt!156054)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320578 () Bool)

(assert (=> b!320578 (= e!198882 (Intermediate!2887 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!320579 () Bool)

(assert (=> b!320579 (= e!198879 (bvsge (x!31988 lt!156054) #b01111111111111111111111111111110))))

(assert (= (and d!69453 c!50533) b!320578))

(assert (= (and d!69453 (not c!50533)) b!320572))

(assert (= (and b!320572 c!50535) b!320576))

(assert (= (and b!320572 (not c!50535)) b!320575))

(assert (= (and d!69453 c!50534) b!320579))

(assert (= (and d!69453 (not c!50534)) b!320574))

(assert (= (and b!320574 res!174755) b!320573))

(assert (= (and b!320573 (not res!174756)) b!320571))

(assert (= (and b!320571 (not res!174754)) b!320577))

(assert (=> b!320575 m!328861))

(declare-fun m!328911 () Bool)

(assert (=> b!320575 m!328911))

(assert (=> b!320575 m!328911))

(declare-fun m!328913 () Bool)

(assert (=> b!320575 m!328913))

(assert (=> d!69453 m!328861))

(declare-fun m!328915 () Bool)

(assert (=> d!69453 m!328915))

(assert (=> d!69453 m!328855))

(declare-fun m!328919 () Bool)

(assert (=> b!320571 m!328919))

(assert (=> b!320573 m!328919))

(assert (=> b!320577 m!328919))

(assert (=> b!320485 d!69453))

(declare-fun d!69459 () Bool)

(declare-fun lt!156060 () (_ BitVec 32))

(declare-fun lt!156059 () (_ BitVec 32))

(assert (=> d!69459 (= lt!156060 (bvmul (bvxor lt!156059 (bvlshr lt!156059 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69459 (= lt!156059 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69459 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!174757 (let ((h!5385 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31990 (bvmul (bvxor h!5385 (bvlshr h!5385 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31990 (bvlshr x!31990 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!174757 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!174757 #b00000000000000000000000000000000))))))

(assert (=> d!69459 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!156060 (bvlshr lt!156060 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!320485 d!69459))

(declare-fun b!320631 () Bool)

(declare-fun e!198916 () SeekEntryResult!2887)

(declare-fun lt!156090 () SeekEntryResult!2887)

(assert (=> b!320631 (= e!198916 (MissingZero!2887 (index!13726 lt!156090)))))

(declare-fun b!320632 () Bool)

(declare-fun e!198915 () SeekEntryResult!2887)

(assert (=> b!320632 (= e!198915 (Found!2887 (index!13726 lt!156090)))))

(declare-fun b!320633 () Bool)

(declare-fun e!198914 () SeekEntryResult!2887)

(assert (=> b!320633 (= e!198914 Undefined!2887)))

(declare-fun b!320634 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16391 (_ BitVec 32)) SeekEntryResult!2887)

(assert (=> b!320634 (= e!198916 (seekKeyOrZeroReturnVacant!0 (x!31988 lt!156090) (index!13726 lt!156090) (index!13726 lt!156090) k!2497 a!3305 mask!3777))))

(declare-fun d!69463 () Bool)

(declare-fun lt!156089 () SeekEntryResult!2887)

(assert (=> d!69463 (and (or (is-Undefined!2887 lt!156089) (not (is-Found!2887 lt!156089)) (and (bvsge (index!13725 lt!156089) #b00000000000000000000000000000000) (bvslt (index!13725 lt!156089) (size!8108 a!3305)))) (or (is-Undefined!2887 lt!156089) (is-Found!2887 lt!156089) (not (is-MissingZero!2887 lt!156089)) (and (bvsge (index!13724 lt!156089) #b00000000000000000000000000000000) (bvslt (index!13724 lt!156089) (size!8108 a!3305)))) (or (is-Undefined!2887 lt!156089) (is-Found!2887 lt!156089) (is-MissingZero!2887 lt!156089) (not (is-MissingVacant!2887 lt!156089)) (and (bvsge (index!13727 lt!156089) #b00000000000000000000000000000000) (bvslt (index!13727 lt!156089) (size!8108 a!3305)))) (or (is-Undefined!2887 lt!156089) (ite (is-Found!2887 lt!156089) (= (select (arr!7756 a!3305) (index!13725 lt!156089)) k!2497) (ite (is-MissingZero!2887 lt!156089) (= (select (arr!7756 a!3305) (index!13724 lt!156089)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2887 lt!156089) (= (select (arr!7756 a!3305) (index!13727 lt!156089)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69463 (= lt!156089 e!198914)))

(declare-fun c!50556 () Bool)

(assert (=> d!69463 (= c!50556 (and (is-Intermediate!2887 lt!156090) (undefined!3699 lt!156090)))))

(assert (=> d!69463 (= lt!156090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69463 (validMask!0 mask!3777)))

(assert (=> d!69463 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!156089)))

(declare-fun b!320635 () Bool)

(declare-fun c!50554 () Bool)

(declare-fun lt!156088 () (_ BitVec 64))

(assert (=> b!320635 (= c!50554 (= lt!156088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!320635 (= e!198915 e!198916)))

(declare-fun b!320636 () Bool)

(assert (=> b!320636 (= e!198914 e!198915)))

(assert (=> b!320636 (= lt!156088 (select (arr!7756 a!3305) (index!13726 lt!156090)))))

(declare-fun c!50555 () Bool)

(assert (=> b!320636 (= c!50555 (= lt!156088 k!2497))))

(assert (= (and d!69463 c!50556) b!320633))

(assert (= (and d!69463 (not c!50556)) b!320636))

(assert (= (and b!320636 c!50555) b!320632))

(assert (= (and b!320636 (not c!50555)) b!320635))

(assert (= (and b!320635 c!50554) b!320631))

(assert (= (and b!320635 (not c!50554)) b!320634))

(declare-fun m!328945 () Bool)

(assert (=> b!320634 m!328945))

(declare-fun m!328947 () Bool)

(assert (=> d!69463 m!328947))

(assert (=> d!69463 m!328861))

(assert (=> d!69463 m!328863))

(assert (=> d!69463 m!328855))

(declare-fun m!328949 () Bool)

(assert (=> d!69463 m!328949))

(declare-fun m!328951 () Bool)

(assert (=> d!69463 m!328951))

(assert (=> d!69463 m!328861))

(declare-fun m!328953 () Bool)

(assert (=> b!320636 m!328953))

(assert (=> b!320484 d!69463))

(declare-fun d!69471 () Bool)

(declare-fun res!174778 () Bool)

(declare-fun e!198921 () Bool)

(assert (=> d!69471 (=> res!174778 e!198921)))

(assert (=> d!69471 (= res!174778 (= (select (arr!7756 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69471 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!198921)))

(declare-fun b!320641 () Bool)

(declare-fun e!198922 () Bool)

(assert (=> b!320641 (= e!198921 e!198922)))

(declare-fun res!174779 () Bool)

(assert (=> b!320641 (=> (not res!174779) (not e!198922))))

(assert (=> b!320641 (= res!174779 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8108 a!3305)))))

(declare-fun b!320642 () Bool)

(assert (=> b!320642 (= e!198922 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69471 (not res!174778)) b!320641))

(assert (= (and b!320641 res!174779) b!320642))

(assert (=> d!69471 m!328875))

(declare-fun m!328955 () Bool)

(assert (=> b!320642 m!328955))

(assert (=> b!320483 d!69471))

(declare-fun d!69473 () Bool)

(assert (=> d!69473 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!320482 d!69473))

(declare-fun d!69475 () Bool)

(assert (=> d!69475 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32156 d!69475))

(declare-fun d!69485 () Bool)

(assert (=> d!69485 (= (array_inv!5719 a!3305) (bvsge (size!8108 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32156 d!69485))

(push 1)

(assert (not d!69453))

(assert (not b!320502))

(assert (not d!69463))

(assert (not b!320634))

(assert (not b!320642))

(assert (not b!320575))

(assert (not b!320504))

(assert (not bm!26053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

