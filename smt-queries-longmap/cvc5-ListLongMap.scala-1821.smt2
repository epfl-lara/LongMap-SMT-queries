; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32782 () Bool)

(assert start!32782)

(declare-fun b!327516 () Bool)

(declare-fun res!180410 () Bool)

(declare-fun e!201421 () Bool)

(assert (=> b!327516 (=> (not res!180410) (not e!201421))))

(declare-datatypes ((array!16774 0))(
  ( (array!16775 (arr!7940 (Array (_ BitVec 32) (_ BitVec 64))) (size!8292 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16774)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16774 (_ BitVec 32)) Bool)

(assert (=> b!327516 (= res!180410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!180409 () Bool)

(assert (=> start!32782 (=> (not res!180409) (not e!201421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32782 (= res!180409 (validMask!0 mask!3777))))

(assert (=> start!32782 e!201421))

(declare-fun array_inv!5903 (array!16774) Bool)

(assert (=> start!32782 (array_inv!5903 a!3305)))

(assert (=> start!32782 true))

(declare-fun b!327517 () Bool)

(declare-fun res!180408 () Bool)

(assert (=> b!327517 (=> (not res!180408) (not e!201421))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3071 0))(
  ( (MissingZero!3071 (index!14460 (_ BitVec 32))) (Found!3071 (index!14461 (_ BitVec 32))) (Intermediate!3071 (undefined!3883 Bool) (index!14462 (_ BitVec 32)) (x!32707 (_ BitVec 32))) (Undefined!3071) (MissingVacant!3071 (index!14463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16774 (_ BitVec 32)) SeekEntryResult!3071)

(assert (=> b!327517 (= res!180408 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3071 i!1250)))))

(declare-fun b!327518 () Bool)

(declare-fun res!180411 () Bool)

(declare-fun e!201420 () Bool)

(assert (=> b!327518 (=> (not res!180411) (not e!201420))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!157584 () SeekEntryResult!3071)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16774 (_ BitVec 32)) SeekEntryResult!3071)

(assert (=> b!327518 (= res!180411 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157584))))

(declare-fun b!327519 () Bool)

(assert (=> b!327519 (= e!201421 e!201420)))

(declare-fun res!180406 () Bool)

(assert (=> b!327519 (=> (not res!180406) (not e!201420))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327519 (= res!180406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157584))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!327519 (= lt!157584 (Intermediate!3071 false resIndex!58 resX!58))))

(declare-fun b!327520 () Bool)

(declare-fun res!180414 () Bool)

(assert (=> b!327520 (=> (not res!180414) (not e!201421))))

(declare-fun arrayContainsKey!0 (array!16774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327520 (= res!180414 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327521 () Bool)

(declare-fun res!180413 () Bool)

(assert (=> b!327521 (=> (not res!180413) (not e!201421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327521 (= res!180413 (validKeyInArray!0 k!2497))))

(declare-fun b!327522 () Bool)

(assert (=> b!327522 (= e!201420 (and (bvslt resX!58 #b01111111111111111111111111111110) (= (select (arr!7940 a!3305) index!1840) k!2497)))))

(declare-fun b!327523 () Bool)

(declare-fun res!180412 () Bool)

(assert (=> b!327523 (=> (not res!180412) (not e!201421))))

(assert (=> b!327523 (= res!180412 (and (= (size!8292 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8292 a!3305))))))

(declare-fun b!327524 () Bool)

(declare-fun res!180407 () Bool)

(assert (=> b!327524 (=> (not res!180407) (not e!201420))))

(assert (=> b!327524 (= res!180407 (and (= (select (arr!7940 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8292 a!3305))))))

(assert (= (and start!32782 res!180409) b!327523))

(assert (= (and b!327523 res!180412) b!327521))

(assert (= (and b!327521 res!180413) b!327520))

(assert (= (and b!327520 res!180414) b!327517))

(assert (= (and b!327517 res!180408) b!327516))

(assert (= (and b!327516 res!180410) b!327519))

(assert (= (and b!327519 res!180406) b!327524))

(assert (= (and b!327524 res!180407) b!327518))

(assert (= (and b!327518 res!180411) b!327522))

(declare-fun m!333845 () Bool)

(assert (=> b!327521 m!333845))

(declare-fun m!333847 () Bool)

(assert (=> b!327522 m!333847))

(declare-fun m!333849 () Bool)

(assert (=> b!327516 m!333849))

(declare-fun m!333851 () Bool)

(assert (=> b!327520 m!333851))

(declare-fun m!333853 () Bool)

(assert (=> b!327517 m!333853))

(declare-fun m!333855 () Bool)

(assert (=> b!327518 m!333855))

(declare-fun m!333857 () Bool)

(assert (=> start!32782 m!333857))

(declare-fun m!333859 () Bool)

(assert (=> start!32782 m!333859))

(declare-fun m!333861 () Bool)

(assert (=> b!327524 m!333861))

(declare-fun m!333863 () Bool)

(assert (=> b!327519 m!333863))

(assert (=> b!327519 m!333863))

(declare-fun m!333865 () Bool)

(assert (=> b!327519 m!333865))

(push 1)

(assert (not b!327521))

(assert (not b!327516))

(assert (not b!327519))

(assert (not b!327520))

(assert (not b!327518))

(assert (not b!327517))

(assert (not start!32782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69861 () Bool)

(assert (=> d!69861 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327521 d!69861))

(declare-fun d!69863 () Bool)

(declare-fun res!180474 () Bool)

(declare-fun e!201454 () Bool)

(assert (=> d!69863 (=> res!180474 e!201454)))

(assert (=> d!69863 (= res!180474 (bvsge #b00000000000000000000000000000000 (size!8292 a!3305)))))

(assert (=> d!69863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201454)))

(declare-fun b!327599 () Bool)

(declare-fun e!201453 () Bool)

(declare-fun call!26101 () Bool)

(assert (=> b!327599 (= e!201453 call!26101)))

(declare-fun b!327600 () Bool)

(declare-fun e!201451 () Bool)

(assert (=> b!327600 (= e!201454 e!201451)))

(declare-fun c!51195 () Bool)

(assert (=> b!327600 (= c!51195 (validKeyInArray!0 (select (arr!7940 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!327601 () Bool)

(assert (=> b!327601 (= e!201451 e!201453)))

(declare-fun lt!157602 () (_ BitVec 64))

(assert (=> b!327601 (= lt!157602 (select (arr!7940 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10176 0))(
  ( (Unit!10177) )
))
(declare-fun lt!157603 () Unit!10176)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16774 (_ BitVec 64) (_ BitVec 32)) Unit!10176)

(assert (=> b!327601 (= lt!157603 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157602 #b00000000000000000000000000000000))))

(assert (=> b!327601 (arrayContainsKey!0 a!3305 lt!157602 #b00000000000000000000000000000000)))

(declare-fun lt!157601 () Unit!10176)

(assert (=> b!327601 (= lt!157601 lt!157603)))

(declare-fun res!180473 () Bool)

(assert (=> b!327601 (= res!180473 (= (seekEntryOrOpen!0 (select (arr!7940 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3071 #b00000000000000000000000000000000)))))

(assert (=> b!327601 (=> (not res!180473) (not e!201453))))

(declare-fun bm!26098 () Bool)

(assert (=> bm!26098 (= call!26101 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327602 () Bool)

(assert (=> b!327602 (= e!201451 call!26101)))

(assert (= (and d!69863 (not res!180474)) b!327600))

(assert (= (and b!327600 c!51195) b!327601))

(assert (= (and b!327600 (not c!51195)) b!327602))

(assert (= (and b!327601 res!180473) b!327599))

(assert (= (or b!327599 b!327602) bm!26098))

(declare-fun m!333911 () Bool)

(assert (=> b!327600 m!333911))

(assert (=> b!327600 m!333911))

(declare-fun m!333913 () Bool)

(assert (=> b!327600 m!333913))

(assert (=> b!327601 m!333911))

(declare-fun m!333915 () Bool)

(assert (=> b!327601 m!333915))

(declare-fun m!333917 () Bool)

(assert (=> b!327601 m!333917))

(assert (=> b!327601 m!333911))

(declare-fun m!333919 () Bool)

(assert (=> b!327601 m!333919))

(declare-fun m!333921 () Bool)

(assert (=> bm!26098 m!333921))

(assert (=> b!327516 d!69863))

(declare-fun b!327648 () Bool)

(declare-fun e!201483 () SeekEntryResult!3071)

(declare-fun e!201485 () SeekEntryResult!3071)

(assert (=> b!327648 (= e!201483 e!201485)))

(declare-fun c!51209 () Bool)

(declare-fun lt!157625 () (_ BitVec 64))

(assert (=> b!327648 (= c!51209 (or (= lt!157625 k!2497) (= (bvadd lt!157625 lt!157625) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327649 () Bool)

(declare-fun lt!157626 () SeekEntryResult!3071)

(assert (=> b!327649 (and (bvsge (index!14462 lt!157626) #b00000000000000000000000000000000) (bvslt (index!14462 lt!157626) (size!8292 a!3305)))))

(declare-fun e!201484 () Bool)

(assert (=> b!327649 (= e!201484 (= (select (arr!7940 a!3305) (index!14462 lt!157626)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69867 () Bool)

(declare-fun e!201486 () Bool)

(assert (=> d!69867 e!201486))

(declare-fun c!51208 () Bool)

(assert (=> d!69867 (= c!51208 (and (is-Intermediate!3071 lt!157626) (undefined!3883 lt!157626)))))

(assert (=> d!69867 (= lt!157626 e!201483)))

(declare-fun c!51210 () Bool)

(assert (=> d!69867 (= c!51210 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69867 (= lt!157625 (select (arr!7940 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69867 (validMask!0 mask!3777)))

(assert (=> d!69867 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157626)))

(declare-fun b!327650 () Bool)

(declare-fun e!201487 () Bool)

(assert (=> b!327650 (= e!201486 e!201487)))

(declare-fun res!180498 () Bool)

(assert (=> b!327650 (= res!180498 (and (is-Intermediate!3071 lt!157626) (not (undefined!3883 lt!157626)) (bvslt (x!32707 lt!157626) #b01111111111111111111111111111110) (bvsge (x!32707 lt!157626) #b00000000000000000000000000000000) (bvsge (x!32707 lt!157626) #b00000000000000000000000000000000)))))

(assert (=> b!327650 (=> (not res!180498) (not e!201487))))

(declare-fun b!327651 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327651 (= e!201485 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!327652 () Bool)

(assert (=> b!327652 (= e!201483 (Intermediate!3071 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327653 () Bool)

(assert (=> b!327653 (= e!201486 (bvsge (x!32707 lt!157626) #b01111111111111111111111111111110))))

(declare-fun b!327654 () Bool)

(assert (=> b!327654 (and (bvsge (index!14462 lt!157626) #b00000000000000000000000000000000) (bvslt (index!14462 lt!157626) (size!8292 a!3305)))))

(declare-fun res!180499 () Bool)

(assert (=> b!327654 (= res!180499 (= (select (arr!7940 a!3305) (index!14462 lt!157626)) k!2497))))

(assert (=> b!327654 (=> res!180499 e!201484)))

(assert (=> b!327654 (= e!201487 e!201484)))

(declare-fun b!327655 () Bool)

(assert (=> b!327655 (= e!201485 (Intermediate!3071 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327656 () Bool)

(assert (=> b!327656 (and (bvsge (index!14462 lt!157626) #b00000000000000000000000000000000) (bvslt (index!14462 lt!157626) (size!8292 a!3305)))))

(declare-fun res!180497 () Bool)

(assert (=> b!327656 (= res!180497 (= (select (arr!7940 a!3305) (index!14462 lt!157626)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327656 (=> res!180497 e!201484)))

(assert (= (and d!69867 c!51210) b!327652))

(assert (= (and d!69867 (not c!51210)) b!327648))

(assert (= (and b!327648 c!51209) b!327655))

(assert (= (and b!327648 (not c!51209)) b!327651))

(assert (= (and d!69867 c!51208) b!327653))

(assert (= (and d!69867 (not c!51208)) b!327650))

(assert (= (and b!327650 res!180498) b!327654))

(assert (= (and b!327654 (not res!180499)) b!327656))

(assert (= (and b!327656 (not res!180497)) b!327649))

(assert (=> b!327651 m!333863))

(declare-fun m!333943 () Bool)

(assert (=> b!327651 m!333943))

(assert (=> b!327651 m!333943))

(declare-fun m!333945 () Bool)

(assert (=> b!327651 m!333945))

(declare-fun m!333947 () Bool)

(assert (=> b!327654 m!333947))

(assert (=> b!327656 m!333947))

(assert (=> d!69867 m!333863))

(declare-fun m!333949 () Bool)

(assert (=> d!69867 m!333949))

(assert (=> d!69867 m!333857))

(assert (=> b!327649 m!333947))

(assert (=> b!327519 d!69867))

(declare-fun d!69875 () Bool)

(declare-fun lt!157638 () (_ BitVec 32))

(declare-fun lt!157637 () (_ BitVec 32))

(assert (=> d!69875 (= lt!157638 (bvmul (bvxor lt!157637 (bvlshr lt!157637 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69875 (= lt!157637 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69875 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180500 (let ((h!5401 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32713 (bvmul (bvxor h!5401 (bvlshr h!5401 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32713 (bvlshr x!32713 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180500 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180500 #b00000000000000000000000000000000))))))

(assert (=> d!69875 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157638 (bvlshr lt!157638 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327519 d!69875))

(declare-fun d!69877 () Bool)

(declare-fun res!180511 () Bool)

(declare-fun e!201505 () Bool)

(assert (=> d!69877 (=> res!180511 e!201505)))

(assert (=> d!69877 (= res!180511 (= (select (arr!7940 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69877 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!201505)))

(declare-fun b!327681 () Bool)

(declare-fun e!201506 () Bool)

(assert (=> b!327681 (= e!201505 e!201506)))

(declare-fun res!180512 () Bool)

(assert (=> b!327681 (=> (not res!180512) (not e!201506))))

(assert (=> b!327681 (= res!180512 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8292 a!3305)))))

(declare-fun b!327682 () Bool)

(assert (=> b!327682 (= e!201506 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69877 (not res!180511)) b!327681))

(assert (= (and b!327681 res!180512) b!327682))

(assert (=> d!69877 m!333911))

(declare-fun m!333963 () Bool)

(assert (=> b!327682 m!333963))

(assert (=> b!327520 d!69877))

(declare-fun b!327687 () Bool)

(declare-fun e!201508 () SeekEntryResult!3071)

(declare-fun e!201510 () SeekEntryResult!3071)

(assert (=> b!327687 (= e!201508 e!201510)))

(declare-fun c!51220 () Bool)

(declare-fun lt!157646 () (_ BitVec 64))

(assert (=> b!327687 (= c!51220 (or (= lt!157646 k!2497) (= (bvadd lt!157646 lt!157646) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327688 () Bool)

(declare-fun lt!157647 () SeekEntryResult!3071)

(assert (=> b!327688 (and (bvsge (index!14462 lt!157647) #b00000000000000000000000000000000) (bvslt (index!14462 lt!157647) (size!8292 a!3305)))))

(declare-fun e!201509 () Bool)

(assert (=> b!327688 (= e!201509 (= (select (arr!7940 a!3305) (index!14462 lt!157647)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69881 () Bool)

(declare-fun e!201512 () Bool)

(assert (=> d!69881 e!201512))

(declare-fun c!51219 () Bool)

(assert (=> d!69881 (= c!51219 (and (is-Intermediate!3071 lt!157647) (undefined!3883 lt!157647)))))

(assert (=> d!69881 (= lt!157647 e!201508)))

(declare-fun c!51221 () Bool)

(assert (=> d!69881 (= c!51221 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69881 (= lt!157646 (select (arr!7940 a!3305) index!1840))))

(assert (=> d!69881 (validMask!0 mask!3777)))

(assert (=> d!69881 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157647)))

(declare-fun b!327689 () Bool)

(declare-fun e!201513 () Bool)

(assert (=> b!327689 (= e!201512 e!201513)))

(declare-fun res!180514 () Bool)

(assert (=> b!327689 (= res!180514 (and (is-Intermediate!3071 lt!157647) (not (undefined!3883 lt!157647)) (bvslt (x!32707 lt!157647) #b01111111111111111111111111111110) (bvsge (x!32707 lt!157647) #b00000000000000000000000000000000) (bvsge (x!32707 lt!157647) x!1490)))))

(assert (=> b!327689 (=> (not res!180514) (not e!201513))))

(declare-fun b!327690 () Bool)

(assert (=> b!327690 (= e!201510 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!327691 () Bool)

(assert (=> b!327691 (= e!201508 (Intermediate!3071 true index!1840 x!1490))))

(declare-fun b!327692 () Bool)

(assert (=> b!327692 (= e!201512 (bvsge (x!32707 lt!157647) #b01111111111111111111111111111110))))

(declare-fun b!327693 () Bool)

(assert (=> b!327693 (and (bvsge (index!14462 lt!157647) #b00000000000000000000000000000000) (bvslt (index!14462 lt!157647) (size!8292 a!3305)))))

(declare-fun res!180515 () Bool)

(assert (=> b!327693 (= res!180515 (= (select (arr!7940 a!3305) (index!14462 lt!157647)) k!2497))))

(assert (=> b!327693 (=> res!180515 e!201509)))

(assert (=> b!327693 (= e!201513 e!201509)))

(declare-fun b!327694 () Bool)

(assert (=> b!327694 (= e!201510 (Intermediate!3071 false index!1840 x!1490))))

(declare-fun b!327695 () Bool)

(assert (=> b!327695 (and (bvsge (index!14462 lt!157647) #b00000000000000000000000000000000) (bvslt (index!14462 lt!157647) (size!8292 a!3305)))))

(declare-fun res!180513 () Bool)

(assert (=> b!327695 (= res!180513 (= (select (arr!7940 a!3305) (index!14462 lt!157647)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327695 (=> res!180513 e!201509)))

(assert (= (and d!69881 c!51221) b!327691))

(assert (= (and d!69881 (not c!51221)) b!327687))

(assert (= (and b!327687 c!51220) b!327694))

(assert (= (and b!327687 (not c!51220)) b!327690))

(assert (= (and d!69881 c!51219) b!327692))

(assert (= (and d!69881 (not c!51219)) b!327689))

(assert (= (and b!327689 res!180514) b!327693))

(assert (= (and b!327693 (not res!180515)) b!327695))

(assert (= (and b!327695 (not res!180513)) b!327688))

(declare-fun m!333965 () Bool)

(assert (=> b!327690 m!333965))

(assert (=> b!327690 m!333965))

(declare-fun m!333967 () Bool)

(assert (=> b!327690 m!333967))

(declare-fun m!333969 () Bool)

(assert (=> b!327693 m!333969))

(assert (=> b!327695 m!333969))

(assert (=> d!69881 m!333847))

(assert (=> d!69881 m!333857))

(assert (=> b!327688 m!333969))

(assert (=> b!327518 d!69881))

(declare-fun d!69883 () Bool)

(assert (=> d!69883 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32782 d!69883))

(declare-fun d!69887 () Bool)

(assert (=> d!69887 (= (array_inv!5903 a!3305) (bvsge (size!8292 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32782 d!69887))

(declare-fun b!327747 () Bool)

(declare-fun e!201546 () SeekEntryResult!3071)

(declare-fun e!201544 () SeekEntryResult!3071)

(assert (=> b!327747 (= e!201546 e!201544)))

(declare-fun lt!157671 () (_ BitVec 64))

(declare-fun lt!157673 () SeekEntryResult!3071)

(assert (=> b!327747 (= lt!157671 (select (arr!7940 a!3305) (index!14462 lt!157673)))))

(declare-fun c!51243 () Bool)

(assert (=> b!327747 (= c!51243 (= lt!157671 k!2497))))

(declare-fun b!327748 () Bool)

(declare-fun e!201545 () SeekEntryResult!3071)

(assert (=> b!327748 (= e!201545 (MissingZero!3071 (index!14462 lt!157673)))))

(declare-fun b!327749 () Bool)

(assert (=> b!327749 (= e!201546 Undefined!3071)))

(declare-fun b!327750 () Bool)

(declare-fun c!51241 () Bool)

(assert (=> b!327750 (= c!51241 (= lt!157671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327750 (= e!201544 e!201545)))

(declare-fun d!69889 () Bool)

(declare-fun lt!157672 () SeekEntryResult!3071)

(assert (=> d!69889 (and (or (is-Undefined!3071 lt!157672) (not (is-Found!3071 lt!157672)) (and (bvsge (index!14461 lt!157672) #b00000000000000000000000000000000) (bvslt (index!14461 lt!157672) (size!8292 a!3305)))) (or (is-Undefined!3071 lt!157672) (is-Found!3071 lt!157672) (not (is-MissingZero!3071 lt!157672)) (and (bvsge (index!14460 lt!157672) #b00000000000000000000000000000000) (bvslt (index!14460 lt!157672) (size!8292 a!3305)))) (or (is-Undefined!3071 lt!157672) (is-Found!3071 lt!157672) (is-MissingZero!3071 lt!157672) (not (is-MissingVacant!3071 lt!157672)) (and (bvsge (index!14463 lt!157672) #b00000000000000000000000000000000) (bvslt (index!14463 lt!157672) (size!8292 a!3305)))) (or (is-Undefined!3071 lt!157672) (ite (is-Found!3071 lt!157672) (= (select (arr!7940 a!3305) (index!14461 lt!157672)) k!2497) (ite (is-MissingZero!3071 lt!157672) (= (select (arr!7940 a!3305) (index!14460 lt!157672)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3071 lt!157672) (= (select (arr!7940 a!3305) (index!14463 lt!157672)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69889 (= lt!157672 e!201546)))

(declare-fun c!51242 () Bool)

(assert (=> d!69889 (= c!51242 (and (is-Intermediate!3071 lt!157673) (undefined!3883 lt!157673)))))

(assert (=> d!69889 (= lt!157673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69889 (validMask!0 mask!3777)))

(assert (=> d!69889 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!157672)))

(declare-fun b!327751 () Bool)

(assert (=> b!327751 (= e!201544 (Found!3071 (index!14462 lt!157673)))))

(declare-fun b!327752 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16774 (_ BitVec 32)) SeekEntryResult!3071)

(assert (=> b!327752 (= e!201545 (seekKeyOrZeroReturnVacant!0 (x!32707 lt!157673) (index!14462 lt!157673) (index!14462 lt!157673) k!2497 a!3305 mask!3777))))

(assert (= (and d!69889 c!51242) b!327749))

(assert (= (and d!69889 (not c!51242)) b!327747))

(assert (= (and b!327747 c!51243) b!327751))

(assert (= (and b!327747 (not c!51243)) b!327750))

(assert (= (and b!327750 c!51241) b!327748))

(assert (= (and b!327750 (not c!51241)) b!327752))

(declare-fun m!333991 () Bool)

(assert (=> b!327747 m!333991))

(assert (=> d!69889 m!333863))

(declare-fun m!333993 () Bool)

(assert (=> d!69889 m!333993))

(assert (=> d!69889 m!333857))

(assert (=> d!69889 m!333863))

(assert (=> d!69889 m!333865))

(declare-fun m!333995 () Bool)

(assert (=> d!69889 m!333995))

(declare-fun m!333997 () Bool)

(assert (=> d!69889 m!333997))

(declare-fun m!333999 () Bool)

(assert (=> b!327752 m!333999))

(assert (=> b!327517 d!69889))

(push 1)

(assert (not b!327601))

(assert (not b!327752))

(assert (not b!327600))

(assert (not b!327651))

(assert (not b!327690))

(assert (not b!327682))

(assert (not d!69881))

(assert (not d!69889))

(assert (not bm!26098))

(assert (not d!69867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

