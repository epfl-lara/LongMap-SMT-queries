; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32840 () Bool)

(assert start!32840)

(declare-fun b!327875 () Bool)

(declare-fun res!180626 () Bool)

(declare-fun e!201598 () Bool)

(assert (=> b!327875 (=> (not res!180626) (not e!201598))))

(declare-datatypes ((array!16787 0))(
  ( (array!16788 (arr!7945 (Array (_ BitVec 32) (_ BitVec 64))) (size!8297 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16787)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!327875 (= res!180626 (and (= (select (arr!7945 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8297 a!3305))))))

(declare-fun b!327876 () Bool)

(declare-fun res!180632 () Bool)

(declare-fun e!201596 () Bool)

(assert (=> b!327876 (=> (not res!180632) (not e!201596))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327876 (= res!180632 (validKeyInArray!0 k!2497))))

(declare-fun b!327877 () Bool)

(declare-fun res!180627 () Bool)

(assert (=> b!327877 (=> (not res!180627) (not e!201596))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3076 0))(
  ( (MissingZero!3076 (index!14480 (_ BitVec 32))) (Found!3076 (index!14481 (_ BitVec 32))) (Intermediate!3076 (undefined!3888 Bool) (index!14482 (_ BitVec 32)) (x!32726 (_ BitVec 32))) (Undefined!3076) (MissingVacant!3076 (index!14483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16787 (_ BitVec 32)) SeekEntryResult!3076)

(assert (=> b!327877 (= res!180627 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3076 i!1250)))))

(declare-fun res!180624 () Bool)

(assert (=> start!32840 (=> (not res!180624) (not e!201596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32840 (= res!180624 (validMask!0 mask!3777))))

(assert (=> start!32840 e!201596))

(declare-fun array_inv!5908 (array!16787) Bool)

(assert (=> start!32840 (array_inv!5908 a!3305)))

(assert (=> start!32840 true))

(declare-fun b!327878 () Bool)

(declare-fun res!180628 () Bool)

(assert (=> b!327878 (=> (not res!180628) (not e!201596))))

(declare-fun arrayContainsKey!0 (array!16787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327878 (= res!180628 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327879 () Bool)

(declare-fun lt!157703 () SeekEntryResult!3076)

(assert (=> b!327879 (= e!201598 (and (is-Intermediate!3076 lt!157703) (bvslt (x!32726 lt!157703) (bvadd #b00000000000000000000000000000001 x!1490))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16787 (_ BitVec 32)) SeekEntryResult!3076)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327879 (= lt!157703 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!327880 () Bool)

(declare-fun res!180633 () Bool)

(assert (=> b!327880 (=> (not res!180633) (not e!201598))))

(assert (=> b!327880 (= res!180633 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7945 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7945 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7945 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!327881 () Bool)

(declare-fun res!180629 () Bool)

(assert (=> b!327881 (=> (not res!180629) (not e!201598))))

(declare-fun lt!157704 () SeekEntryResult!3076)

(assert (=> b!327881 (= res!180629 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157704))))

(declare-fun b!327882 () Bool)

(assert (=> b!327882 (= e!201596 e!201598)))

(declare-fun res!180625 () Bool)

(assert (=> b!327882 (=> (not res!180625) (not e!201598))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327882 (= res!180625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157704))))

(assert (=> b!327882 (= lt!157704 (Intermediate!3076 false resIndex!58 resX!58))))

(declare-fun b!327883 () Bool)

(declare-fun res!180630 () Bool)

(assert (=> b!327883 (=> (not res!180630) (not e!201596))))

(assert (=> b!327883 (= res!180630 (and (= (size!8297 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8297 a!3305))))))

(declare-fun b!327884 () Bool)

(declare-fun res!180631 () Bool)

(assert (=> b!327884 (=> (not res!180631) (not e!201596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16787 (_ BitVec 32)) Bool)

(assert (=> b!327884 (= res!180631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32840 res!180624) b!327883))

(assert (= (and b!327883 res!180630) b!327876))

(assert (= (and b!327876 res!180632) b!327878))

(assert (= (and b!327878 res!180628) b!327877))

(assert (= (and b!327877 res!180627) b!327884))

(assert (= (and b!327884 res!180631) b!327882))

(assert (= (and b!327882 res!180625) b!327875))

(assert (= (and b!327875 res!180626) b!327881))

(assert (= (and b!327881 res!180629) b!327880))

(assert (= (and b!327880 res!180633) b!327879))

(declare-fun m!334077 () Bool)

(assert (=> b!327877 m!334077))

(declare-fun m!334079 () Bool)

(assert (=> b!327875 m!334079))

(declare-fun m!334081 () Bool)

(assert (=> start!32840 m!334081))

(declare-fun m!334083 () Bool)

(assert (=> start!32840 m!334083))

(declare-fun m!334085 () Bool)

(assert (=> b!327882 m!334085))

(assert (=> b!327882 m!334085))

(declare-fun m!334087 () Bool)

(assert (=> b!327882 m!334087))

(declare-fun m!334089 () Bool)

(assert (=> b!327881 m!334089))

(declare-fun m!334091 () Bool)

(assert (=> b!327876 m!334091))

(declare-fun m!334093 () Bool)

(assert (=> b!327884 m!334093))

(declare-fun m!334095 () Bool)

(assert (=> b!327880 m!334095))

(declare-fun m!334097 () Bool)

(assert (=> b!327878 m!334097))

(declare-fun m!334099 () Bool)

(assert (=> b!327879 m!334099))

(assert (=> b!327879 m!334099))

(declare-fun m!334101 () Bool)

(assert (=> b!327879 m!334101))

(push 1)

(assert (not b!327881))

(assert (not b!327877))

(assert (not b!327878))

(assert (not b!327882))

(assert (not b!327879))

(assert (not b!327884))

(assert (not b!327876))

(assert (not start!32840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!327978 () Bool)

(declare-fun e!201654 () SeekEntryResult!3076)

(declare-fun lt!157747 () SeekEntryResult!3076)

(assert (=> b!327978 (= e!201654 (MissingZero!3076 (index!14482 lt!157747)))))

(declare-fun b!327979 () Bool)

(declare-fun e!201655 () SeekEntryResult!3076)

(assert (=> b!327979 (= e!201655 (Found!3076 (index!14482 lt!157747)))))

(declare-fun d!69921 () Bool)

(declare-fun lt!157746 () SeekEntryResult!3076)

(assert (=> d!69921 (and (or (is-Undefined!3076 lt!157746) (not (is-Found!3076 lt!157746)) (and (bvsge (index!14481 lt!157746) #b00000000000000000000000000000000) (bvslt (index!14481 lt!157746) (size!8297 a!3305)))) (or (is-Undefined!3076 lt!157746) (is-Found!3076 lt!157746) (not (is-MissingZero!3076 lt!157746)) (and (bvsge (index!14480 lt!157746) #b00000000000000000000000000000000) (bvslt (index!14480 lt!157746) (size!8297 a!3305)))) (or (is-Undefined!3076 lt!157746) (is-Found!3076 lt!157746) (is-MissingZero!3076 lt!157746) (not (is-MissingVacant!3076 lt!157746)) (and (bvsge (index!14483 lt!157746) #b00000000000000000000000000000000) (bvslt (index!14483 lt!157746) (size!8297 a!3305)))) (or (is-Undefined!3076 lt!157746) (ite (is-Found!3076 lt!157746) (= (select (arr!7945 a!3305) (index!14481 lt!157746)) k!2497) (ite (is-MissingZero!3076 lt!157746) (= (select (arr!7945 a!3305) (index!14480 lt!157746)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3076 lt!157746) (= (select (arr!7945 a!3305) (index!14483 lt!157746)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!201656 () SeekEntryResult!3076)

(assert (=> d!69921 (= lt!157746 e!201656)))

(declare-fun c!51293 () Bool)

(assert (=> d!69921 (= c!51293 (and (is-Intermediate!3076 lt!157747) (undefined!3888 lt!157747)))))

(assert (=> d!69921 (= lt!157747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69921 (validMask!0 mask!3777)))

(assert (=> d!69921 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!157746)))

(declare-fun b!327980 () Bool)

(declare-fun c!51292 () Bool)

(declare-fun lt!157745 () (_ BitVec 64))

(assert (=> b!327980 (= c!51292 (= lt!157745 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327980 (= e!201655 e!201654)))

(declare-fun b!327981 () Bool)

(assert (=> b!327981 (= e!201656 e!201655)))

(assert (=> b!327981 (= lt!157745 (select (arr!7945 a!3305) (index!14482 lt!157747)))))

(declare-fun c!51294 () Bool)

(assert (=> b!327981 (= c!51294 (= lt!157745 k!2497))))

(declare-fun b!327982 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16787 (_ BitVec 32)) SeekEntryResult!3076)

(assert (=> b!327982 (= e!201654 (seekKeyOrZeroReturnVacant!0 (x!32726 lt!157747) (index!14482 lt!157747) (index!14482 lt!157747) k!2497 a!3305 mask!3777))))

(declare-fun b!327983 () Bool)

(assert (=> b!327983 (= e!201656 Undefined!3076)))

(assert (= (and d!69921 c!51293) b!327983))

(assert (= (and d!69921 (not c!51293)) b!327981))

(assert (= (and b!327981 c!51294) b!327979))

(assert (= (and b!327981 (not c!51294)) b!327980))

(assert (= (and b!327980 c!51292) b!327978))

(assert (= (and b!327980 (not c!51292)) b!327982))

(assert (=> d!69921 m!334085))

(assert (=> d!69921 m!334087))

(declare-fun m!334137 () Bool)

(assert (=> d!69921 m!334137))

(assert (=> d!69921 m!334081))

(assert (=> d!69921 m!334085))

(declare-fun m!334139 () Bool)

(assert (=> d!69921 m!334139))

(declare-fun m!334141 () Bool)

(assert (=> d!69921 m!334141))

(declare-fun m!334143 () Bool)

(assert (=> b!327981 m!334143))

(declare-fun m!334145 () Bool)

(assert (=> b!327982 m!334145))

(assert (=> b!327877 d!69921))

(declare-fun b!328053 () Bool)

(declare-fun lt!157777 () SeekEntryResult!3076)

(assert (=> b!328053 (and (bvsge (index!14482 lt!157777) #b00000000000000000000000000000000) (bvslt (index!14482 lt!157777) (size!8297 a!3305)))))

(declare-fun res!180686 () Bool)

(assert (=> b!328053 (= res!180686 (= (select (arr!7945 a!3305) (index!14482 lt!157777)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201697 () Bool)

(assert (=> b!328053 (=> res!180686 e!201697)))

(declare-fun d!69933 () Bool)

(declare-fun e!201700 () Bool)

(assert (=> d!69933 e!201700))

(declare-fun c!51321 () Bool)

(assert (=> d!69933 (= c!51321 (and (is-Intermediate!3076 lt!157777) (undefined!3888 lt!157777)))))

(declare-fun e!201699 () SeekEntryResult!3076)

(assert (=> d!69933 (= lt!157777 e!201699)))

(declare-fun c!51319 () Bool)

(assert (=> d!69933 (= c!51319 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157776 () (_ BitVec 64))

(assert (=> d!69933 (= lt!157776 (select (arr!7945 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69933 (validMask!0 mask!3777)))

(assert (=> d!69933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157777)))

(declare-fun b!328054 () Bool)

(assert (=> b!328054 (= e!201700 (bvsge (x!32726 lt!157777) #b01111111111111111111111111111110))))

(declare-fun b!328055 () Bool)

(assert (=> b!328055 (and (bvsge (index!14482 lt!157777) #b00000000000000000000000000000000) (bvslt (index!14482 lt!157777) (size!8297 a!3305)))))

(declare-fun res!180684 () Bool)

(assert (=> b!328055 (= res!180684 (= (select (arr!7945 a!3305) (index!14482 lt!157777)) k!2497))))

(assert (=> b!328055 (=> res!180684 e!201697)))

(declare-fun e!201701 () Bool)

(assert (=> b!328055 (= e!201701 e!201697)))

(declare-fun b!328056 () Bool)

(assert (=> b!328056 (= e!201700 e!201701)))

(declare-fun res!180685 () Bool)

(assert (=> b!328056 (= res!180685 (and (is-Intermediate!3076 lt!157777) (not (undefined!3888 lt!157777)) (bvslt (x!32726 lt!157777) #b01111111111111111111111111111110) (bvsge (x!32726 lt!157777) #b00000000000000000000000000000000) (bvsge (x!32726 lt!157777) #b00000000000000000000000000000000)))))

(assert (=> b!328056 (=> (not res!180685) (not e!201701))))

(declare-fun b!328057 () Bool)

(declare-fun e!201698 () SeekEntryResult!3076)

(assert (=> b!328057 (= e!201698 (Intermediate!3076 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328058 () Bool)

(assert (=> b!328058 (and (bvsge (index!14482 lt!157777) #b00000000000000000000000000000000) (bvslt (index!14482 lt!157777) (size!8297 a!3305)))))

(assert (=> b!328058 (= e!201697 (= (select (arr!7945 a!3305) (index!14482 lt!157777)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328059 () Bool)

(assert (=> b!328059 (= e!201699 (Intermediate!3076 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328060 () Bool)

(assert (=> b!328060 (= e!201699 e!201698)))

(declare-fun c!51320 () Bool)

(assert (=> b!328060 (= c!51320 (or (= lt!157776 k!2497) (= (bvadd lt!157776 lt!157776) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328061 () Bool)

(assert (=> b!328061 (= e!201698 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and d!69933 c!51319) b!328059))

(assert (= (and d!69933 (not c!51319)) b!328060))

(assert (= (and b!328060 c!51320) b!328057))

(assert (= (and b!328060 (not c!51320)) b!328061))

(assert (= (and d!69933 c!51321) b!328054))

(assert (= (and d!69933 (not c!51321)) b!328056))

(assert (= (and b!328056 res!180685) b!328055))

(assert (= (and b!328055 (not res!180684)) b!328053))

(assert (= (and b!328053 (not res!180686)) b!328058))

(assert (=> b!328061 m!334085))

(declare-fun m!334179 () Bool)

(assert (=> b!328061 m!334179))

(assert (=> b!328061 m!334179))

(declare-fun m!334181 () Bool)

(assert (=> b!328061 m!334181))

(assert (=> d!69933 m!334085))

(declare-fun m!334183 () Bool)

(assert (=> d!69933 m!334183))

(assert (=> d!69933 m!334081))

(declare-fun m!334185 () Bool)

(assert (=> b!328058 m!334185))

(assert (=> b!328053 m!334185))

(assert (=> b!328055 m!334185))

(assert (=> b!327882 d!69933))

(declare-fun d!69949 () Bool)

(declare-fun lt!157794 () (_ BitVec 32))

(declare-fun lt!157793 () (_ BitVec 32))

(assert (=> d!69949 (= lt!157794 (bvmul (bvxor lt!157793 (bvlshr lt!157793 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69949 (= lt!157793 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69949 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180687 (let ((h!5405 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32733 (bvmul (bvxor h!5405 (bvlshr h!5405 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32733 (bvlshr x!32733 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180687 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180687 #b00000000000000000000000000000000))))))

(assert (=> d!69949 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157794 (bvlshr lt!157794 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327882 d!69949))

(declare-fun b!328083 () Bool)

(declare-fun lt!157796 () SeekEntryResult!3076)

(assert (=> b!328083 (and (bvsge (index!14482 lt!157796) #b00000000000000000000000000000000) (bvslt (index!14482 lt!157796) (size!8297 a!3305)))))

(declare-fun res!180699 () Bool)

(assert (=> b!328083 (= res!180699 (= (select (arr!7945 a!3305) (index!14482 lt!157796)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201716 () Bool)

(assert (=> b!328083 (=> res!180699 e!201716)))

(declare-fun d!69957 () Bool)

(declare-fun e!201719 () Bool)

(assert (=> d!69957 e!201719))

(declare-fun c!51330 () Bool)

(assert (=> d!69957 (= c!51330 (and (is-Intermediate!3076 lt!157796) (undefined!3888 lt!157796)))))

(declare-fun e!201718 () SeekEntryResult!3076)

(assert (=> d!69957 (= lt!157796 e!201718)))

(declare-fun c!51328 () Bool)

(assert (=> d!69957 (= c!51328 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!157795 () (_ BitVec 64))

(assert (=> d!69957 (= lt!157795 (select (arr!7945 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!69957 (validMask!0 mask!3777)))

(assert (=> d!69957 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777) lt!157796)))

(declare-fun b!328084 () Bool)

(assert (=> b!328084 (= e!201719 (bvsge (x!32726 lt!157796) #b01111111111111111111111111111110))))

(declare-fun b!328085 () Bool)

(assert (=> b!328085 (and (bvsge (index!14482 lt!157796) #b00000000000000000000000000000000) (bvslt (index!14482 lt!157796) (size!8297 a!3305)))))

(declare-fun res!180697 () Bool)

(assert (=> b!328085 (= res!180697 (= (select (arr!7945 a!3305) (index!14482 lt!157796)) k!2497))))

(assert (=> b!328085 (=> res!180697 e!201716)))

(declare-fun e!201720 () Bool)

(assert (=> b!328085 (= e!201720 e!201716)))

(declare-fun b!328086 () Bool)

(assert (=> b!328086 (= e!201719 e!201720)))

(declare-fun res!180698 () Bool)

(assert (=> b!328086 (= res!180698 (and (is-Intermediate!3076 lt!157796) (not (undefined!3888 lt!157796)) (bvslt (x!32726 lt!157796) #b01111111111111111111111111111110) (bvsge (x!32726 lt!157796) #b00000000000000000000000000000000) (bvsge (x!32726 lt!157796) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!328086 (=> (not res!180698) (not e!201720))))

(declare-fun b!328087 () Bool)

(declare-fun e!201717 () SeekEntryResult!3076)

(assert (=> b!328087 (= e!201717 (Intermediate!3076 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!328088 () Bool)

(assert (=> b!328088 (and (bvsge (index!14482 lt!157796) #b00000000000000000000000000000000) (bvslt (index!14482 lt!157796) (size!8297 a!3305)))))

(assert (=> b!328088 (= e!201716 (= (select (arr!7945 a!3305) (index!14482 lt!157796)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328089 () Bool)

(assert (=> b!328089 (= e!201718 (Intermediate!3076 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!328090 () Bool)

(assert (=> b!328090 (= e!201718 e!201717)))

(declare-fun c!51329 () Bool)

(assert (=> b!328090 (= c!51329 (or (= lt!157795 k!2497) (= (bvadd lt!157795 lt!157795) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328091 () Bool)

(assert (=> b!328091 (= e!201717 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and d!69957 c!51328) b!328089))

(assert (= (and d!69957 (not c!51328)) b!328090))

(assert (= (and b!328090 c!51329) b!328087))

(assert (= (and b!328090 (not c!51329)) b!328091))

(assert (= (and d!69957 c!51330) b!328084))

(assert (= (and d!69957 (not c!51330)) b!328086))

(assert (= (and b!328086 res!180698) b!328085))

(assert (= (and b!328085 (not res!180697)) b!328083))

(assert (= (and b!328083 (not res!180699)) b!328088))

(assert (=> b!328091 m!334099))

(declare-fun m!334207 () Bool)

(assert (=> b!328091 m!334207))

(assert (=> b!328091 m!334207))

(declare-fun m!334209 () Bool)

(assert (=> b!328091 m!334209))

(assert (=> d!69957 m!334099))

(declare-fun m!334211 () Bool)

(assert (=> d!69957 m!334211))

(assert (=> d!69957 m!334081))

(declare-fun m!334213 () Bool)

(assert (=> b!328088 m!334213))

(assert (=> b!328083 m!334213))

(assert (=> b!328085 m!334213))

(assert (=> b!327879 d!69957))

(declare-fun d!69961 () Bool)

(declare-fun lt!157804 () (_ BitVec 32))

(assert (=> d!69961 (and (bvsge lt!157804 #b00000000000000000000000000000000) (bvslt lt!157804 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69961 (= lt!157804 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69961 (validMask!0 mask!3777)))

(assert (=> d!69961 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!157804)))

(declare-fun bs!11383 () Bool)

(assert (= bs!11383 d!69961))

(declare-fun m!334217 () Bool)

(assert (=> bs!11383 m!334217))

(assert (=> bs!11383 m!334081))

(assert (=> b!327879 d!69961))

(declare-fun bm!26113 () Bool)

(declare-fun call!26116 () Bool)

(assert (=> bm!26113 (= call!26116 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!328109 () Bool)

(declare-fun e!201732 () Bool)

(assert (=> b!328109 (= e!201732 call!26116)))

(declare-fun b!328110 () Bool)

(declare-fun e!201734 () Bool)

(assert (=> b!328110 (= e!201732 e!201734)))

(declare-fun lt!157812 () (_ BitVec 64))

(assert (=> b!328110 (= lt!157812 (select (arr!7945 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10186 0))(
  ( (Unit!10187) )
))
(declare-fun lt!157811 () Unit!10186)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16787 (_ BitVec 64) (_ BitVec 32)) Unit!10186)

(assert (=> b!328110 (= lt!157811 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157812 #b00000000000000000000000000000000))))

(assert (=> b!328110 (arrayContainsKey!0 a!3305 lt!157812 #b00000000000000000000000000000000)))

(declare-fun lt!157813 () Unit!10186)

(assert (=> b!328110 (= lt!157813 lt!157811)))

(declare-fun res!180707 () Bool)

(assert (=> b!328110 (= res!180707 (= (seekEntryOrOpen!0 (select (arr!7945 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3076 #b00000000000000000000000000000000)))))

(assert (=> b!328110 (=> (not res!180707) (not e!201734))))

(declare-fun b!328111 () Bool)

(declare-fun e!201733 () Bool)

(assert (=> b!328111 (= e!201733 e!201732)))

(declare-fun c!51336 () Bool)

(assert (=> b!328111 (= c!51336 (validKeyInArray!0 (select (arr!7945 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!69965 () Bool)

(declare-fun res!180708 () Bool)

(assert (=> d!69965 (=> res!180708 e!201733)))

(assert (=> d!69965 (= res!180708 (bvsge #b00000000000000000000000000000000 (size!8297 a!3305)))))

(assert (=> d!69965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201733)))

(declare-fun b!328112 () Bool)

(assert (=> b!328112 (= e!201734 call!26116)))

(assert (= (and d!69965 (not res!180708)) b!328111))

(assert (= (and b!328111 c!51336) b!328110))

(assert (= (and b!328111 (not c!51336)) b!328109))

(assert (= (and b!328110 res!180707) b!328112))

(assert (= (or b!328112 b!328109) bm!26113))

(declare-fun m!334223 () Bool)

(assert (=> bm!26113 m!334223))

(declare-fun m!334225 () Bool)

(assert (=> b!328110 m!334225))

(declare-fun m!334227 () Bool)

(assert (=> b!328110 m!334227))

(declare-fun m!334229 () Bool)

(assert (=> b!328110 m!334229))

(assert (=> b!328110 m!334225))

(declare-fun m!334231 () Bool)

(assert (=> b!328110 m!334231))

(assert (=> b!328111 m!334225))

(assert (=> b!328111 m!334225))

(declare-fun m!334233 () Bool)

(assert (=> b!328111 m!334233))

(assert (=> b!327884 d!69965))

(declare-fun d!69969 () Bool)

(assert (=> d!69969 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32840 d!69969))

(declare-fun d!69971 () Bool)

(assert (=> d!69971 (= (array_inv!5908 a!3305) (bvsge (size!8297 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32840 d!69971))

(declare-fun d!69973 () Bool)

(declare-fun res!180713 () Bool)

(declare-fun e!201739 () Bool)

(assert (=> d!69973 (=> res!180713 e!201739)))

(assert (=> d!69973 (= res!180713 (= (select (arr!7945 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69973 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!201739)))

(declare-fun b!328117 () Bool)

(declare-fun e!201740 () Bool)

(assert (=> b!328117 (= e!201739 e!201740)))

(declare-fun res!180714 () Bool)

(assert (=> b!328117 (=> (not res!180714) (not e!201740))))

(assert (=> b!328117 (= res!180714 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8297 a!3305)))))

(declare-fun b!328118 () Bool)

(assert (=> b!328118 (= e!201740 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69973 (not res!180713)) b!328117))

(assert (= (and b!328117 res!180714) b!328118))

(assert (=> d!69973 m!334225))

(declare-fun m!334235 () Bool)

(assert (=> b!328118 m!334235))

(assert (=> b!327878 d!69973))

(declare-fun d!69975 () Bool)

(assert (=> d!69975 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327876 d!69975))

(declare-fun b!328119 () Bool)

(declare-fun lt!157815 () SeekEntryResult!3076)

(assert (=> b!328119 (and (bvsge (index!14482 lt!157815) #b00000000000000000000000000000000) (bvslt (index!14482 lt!157815) (size!8297 a!3305)))))

(declare-fun res!180717 () Bool)

(assert (=> b!328119 (= res!180717 (= (select (arr!7945 a!3305) (index!14482 lt!157815)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201741 () Bool)

(assert (=> b!328119 (=> res!180717 e!201741)))

(declare-fun d!69977 () Bool)

(declare-fun e!201744 () Bool)

(assert (=> d!69977 e!201744))

(declare-fun c!51339 () Bool)

(assert (=> d!69977 (= c!51339 (and (is-Intermediate!3076 lt!157815) (undefined!3888 lt!157815)))))

(declare-fun e!201743 () SeekEntryResult!3076)

(assert (=> d!69977 (= lt!157815 e!201743)))

(declare-fun c!51337 () Bool)

(assert (=> d!69977 (= c!51337 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157814 () (_ BitVec 64))

(assert (=> d!69977 (= lt!157814 (select (arr!7945 a!3305) index!1840))))

(assert (=> d!69977 (validMask!0 mask!3777)))

(assert (=> d!69977 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157815)))

(declare-fun b!328120 () Bool)

(assert (=> b!328120 (= e!201744 (bvsge (x!32726 lt!157815) #b01111111111111111111111111111110))))

(declare-fun b!328121 () Bool)

(assert (=> b!328121 (and (bvsge (index!14482 lt!157815) #b00000000000000000000000000000000) (bvslt (index!14482 lt!157815) (size!8297 a!3305)))))

(declare-fun res!180715 () Bool)

(assert (=> b!328121 (= res!180715 (= (select (arr!7945 a!3305) (index!14482 lt!157815)) k!2497))))

(assert (=> b!328121 (=> res!180715 e!201741)))

(declare-fun e!201745 () Bool)

(assert (=> b!328121 (= e!201745 e!201741)))

(declare-fun b!328122 () Bool)

(assert (=> b!328122 (= e!201744 e!201745)))

