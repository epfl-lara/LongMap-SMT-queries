; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32582 () Bool)

(assert start!32582)

(declare-fun b!325526 () Bool)

(declare-fun res!178865 () Bool)

(declare-fun e!200579 () Bool)

(assert (=> b!325526 (=> (not res!178865) (not e!200579))))

(declare-datatypes ((array!16674 0))(
  ( (array!16675 (arr!7893 (Array (_ BitVec 32) (_ BitVec 64))) (size!8246 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16674)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16674 (_ BitVec 32)) Bool)

(assert (=> b!325526 (= res!178865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325527 () Bool)

(declare-fun res!178864 () Bool)

(assert (=> b!325527 (=> (not res!178864) (not e!200579))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3023 0))(
  ( (MissingZero!3023 (index!14268 (_ BitVec 32))) (Found!3023 (index!14269 (_ BitVec 32))) (Intermediate!3023 (undefined!3835 Bool) (index!14270 (_ BitVec 32)) (x!32527 (_ BitVec 32))) (Undefined!3023) (MissingVacant!3023 (index!14271 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16674 (_ BitVec 32)) SeekEntryResult!3023)

(assert (=> b!325527 (= res!178864 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3023 i!1250)))))

(declare-fun b!325528 () Bool)

(declare-fun res!178866 () Bool)

(declare-fun e!200581 () Bool)

(assert (=> b!325528 (=> (not res!178866) (not e!200581))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!156901 () SeekEntryResult!3023)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16674 (_ BitVec 32)) SeekEntryResult!3023)

(assert (=> b!325528 (= res!178866 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156901))))

(declare-fun e!200582 () Bool)

(declare-fun lt!156902 () (_ BitVec 32))

(declare-fun b!325529 () Bool)

(assert (=> b!325529 (= e!200582 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) lt!156902 k0!2497 a!3305 mask!3777) lt!156901)))))

(declare-fun b!325530 () Bool)

(declare-fun res!178869 () Bool)

(assert (=> b!325530 (=> (not res!178869) (not e!200581))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325530 (= res!178869 (and (= (select (arr!7893 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8246 a!3305))))))

(declare-fun b!325531 () Bool)

(declare-fun res!178868 () Bool)

(assert (=> b!325531 (=> (not res!178868) (not e!200579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325531 (= res!178868 (validKeyInArray!0 k0!2497))))

(declare-fun b!325532 () Bool)

(declare-fun res!178862 () Bool)

(assert (=> b!325532 (=> (not res!178862) (not e!200581))))

(assert (=> b!325532 (= res!178862 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7893 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325533 () Bool)

(assert (=> b!325533 (= e!200581 e!200582)))

(declare-fun res!178870 () Bool)

(assert (=> b!325533 (=> (not res!178870) (not e!200582))))

(assert (=> b!325533 (= res!178870 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000) (bvsge lt!156902 #b00000000000000000000000000000000) (bvslt lt!156902 (size!8246 a!3305))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325533 (= lt!156902 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325534 () Bool)

(declare-fun res!178872 () Bool)

(assert (=> b!325534 (=> (not res!178872) (not e!200579))))

(declare-fun arrayContainsKey!0 (array!16674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325534 (= res!178872 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325535 () Bool)

(assert (=> b!325535 (= e!200579 e!200581)))

(declare-fun res!178867 () Bool)

(assert (=> b!325535 (=> (not res!178867) (not e!200581))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325535 (= res!178867 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156901))))

(assert (=> b!325535 (= lt!156901 (Intermediate!3023 false resIndex!58 resX!58))))

(declare-fun b!325536 () Bool)

(declare-fun res!178863 () Bool)

(assert (=> b!325536 (=> (not res!178863) (not e!200579))))

(assert (=> b!325536 (= res!178863 (and (= (size!8246 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8246 a!3305))))))

(declare-fun res!178871 () Bool)

(assert (=> start!32582 (=> (not res!178871) (not e!200579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32582 (= res!178871 (validMask!0 mask!3777))))

(assert (=> start!32582 e!200579))

(declare-fun array_inv!5865 (array!16674) Bool)

(assert (=> start!32582 (array_inv!5865 a!3305)))

(assert (=> start!32582 true))

(assert (= (and start!32582 res!178871) b!325536))

(assert (= (and b!325536 res!178863) b!325531))

(assert (= (and b!325531 res!178868) b!325534))

(assert (= (and b!325534 res!178872) b!325527))

(assert (= (and b!325527 res!178864) b!325526))

(assert (= (and b!325526 res!178865) b!325535))

(assert (= (and b!325535 res!178867) b!325530))

(assert (= (and b!325530 res!178869) b!325528))

(assert (= (and b!325528 res!178866) b!325532))

(assert (= (and b!325532 res!178862) b!325533))

(assert (= (and b!325533 res!178870) b!325529))

(declare-fun m!331783 () Bool)

(assert (=> start!32582 m!331783))

(declare-fun m!331785 () Bool)

(assert (=> start!32582 m!331785))

(declare-fun m!331787 () Bool)

(assert (=> b!325535 m!331787))

(assert (=> b!325535 m!331787))

(declare-fun m!331789 () Bool)

(assert (=> b!325535 m!331789))

(declare-fun m!331791 () Bool)

(assert (=> b!325530 m!331791))

(declare-fun m!331793 () Bool)

(assert (=> b!325526 m!331793))

(declare-fun m!331795 () Bool)

(assert (=> b!325534 m!331795))

(declare-fun m!331797 () Bool)

(assert (=> b!325527 m!331797))

(declare-fun m!331799 () Bool)

(assert (=> b!325532 m!331799))

(declare-fun m!331801 () Bool)

(assert (=> b!325528 m!331801))

(declare-fun m!331803 () Bool)

(assert (=> b!325533 m!331803))

(declare-fun m!331805 () Bool)

(assert (=> b!325529 m!331805))

(declare-fun m!331807 () Bool)

(assert (=> b!325531 m!331807))

(check-sat (not b!325531) (not b!325529) (not b!325528) (not b!325534) (not start!32582) (not b!325533) (not b!325527) (not b!325526) (not b!325535))
(check-sat)
(get-model)

(declare-fun e!200619 () SeekEntryResult!3023)

(declare-fun b!325621 () Bool)

(assert (=> b!325621 (= e!200619 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 lt!156902 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325622 () Bool)

(declare-fun e!200618 () Bool)

(declare-fun e!200621 () Bool)

(assert (=> b!325622 (= e!200618 e!200621)))

(declare-fun res!178945 () Bool)

(declare-fun lt!156923 () SeekEntryResult!3023)

(get-info :version)

(assert (=> b!325622 (= res!178945 (and ((_ is Intermediate!3023) lt!156923) (not (undefined!3835 lt!156923)) (bvslt (x!32527 lt!156923) #b01111111111111111111111111111110) (bvsge (x!32527 lt!156923) #b00000000000000000000000000000000) (bvsge (x!32527 lt!156923) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!325622 (=> (not res!178945) (not e!200621))))

(declare-fun b!325623 () Bool)

(assert (=> b!325623 (and (bvsge (index!14270 lt!156923) #b00000000000000000000000000000000) (bvslt (index!14270 lt!156923) (size!8246 a!3305)))))

(declare-fun e!200617 () Bool)

(assert (=> b!325623 (= e!200617 (= (select (arr!7893 a!3305) (index!14270 lt!156923)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325624 () Bool)

(declare-fun e!200620 () SeekEntryResult!3023)

(assert (=> b!325624 (= e!200620 e!200619)))

(declare-fun c!50968 () Bool)

(declare-fun lt!156922 () (_ BitVec 64))

(assert (=> b!325624 (= c!50968 (or (= lt!156922 k0!2497) (= (bvadd lt!156922 lt!156922) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325625 () Bool)

(assert (=> b!325625 (= e!200619 (Intermediate!3023 false lt!156902 (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!325626 () Bool)

(assert (=> b!325626 (and (bvsge (index!14270 lt!156923) #b00000000000000000000000000000000) (bvslt (index!14270 lt!156923) (size!8246 a!3305)))))

(declare-fun res!178947 () Bool)

(assert (=> b!325626 (= res!178947 (= (select (arr!7893 a!3305) (index!14270 lt!156923)) k0!2497))))

(assert (=> b!325626 (=> res!178947 e!200617)))

(assert (=> b!325626 (= e!200621 e!200617)))

(declare-fun b!325627 () Bool)

(assert (=> b!325627 (= e!200620 (Intermediate!3023 true lt!156902 (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!325628 () Bool)

(assert (=> b!325628 (and (bvsge (index!14270 lt!156923) #b00000000000000000000000000000000) (bvslt (index!14270 lt!156923) (size!8246 a!3305)))))

(declare-fun res!178946 () Bool)

(assert (=> b!325628 (= res!178946 (= (select (arr!7893 a!3305) (index!14270 lt!156923)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325628 (=> res!178946 e!200617)))

(declare-fun b!325629 () Bool)

(assert (=> b!325629 (= e!200618 (bvsge (x!32527 lt!156923) #b01111111111111111111111111111110))))

(declare-fun d!69503 () Bool)

(assert (=> d!69503 e!200618))

(declare-fun c!50969 () Bool)

(assert (=> d!69503 (= c!50969 (and ((_ is Intermediate!3023) lt!156923) (undefined!3835 lt!156923)))))

(assert (=> d!69503 (= lt!156923 e!200620)))

(declare-fun c!50967 () Bool)

(assert (=> d!69503 (= c!50967 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(assert (=> d!69503 (= lt!156922 (select (arr!7893 a!3305) lt!156902))))

(assert (=> d!69503 (validMask!0 mask!3777)))

(assert (=> d!69503 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) lt!156902 k0!2497 a!3305 mask!3777) lt!156923)))

(assert (= (and d!69503 c!50967) b!325627))

(assert (= (and d!69503 (not c!50967)) b!325624))

(assert (= (and b!325624 c!50968) b!325625))

(assert (= (and b!325624 (not c!50968)) b!325621))

(assert (= (and d!69503 c!50969) b!325629))

(assert (= (and d!69503 (not c!50969)) b!325622))

(assert (= (and b!325622 res!178945) b!325626))

(assert (= (and b!325626 (not res!178947)) b!325628))

(assert (= (and b!325628 (not res!178946)) b!325623))

(declare-fun m!331863 () Bool)

(assert (=> d!69503 m!331863))

(assert (=> d!69503 m!331783))

(declare-fun m!331865 () Bool)

(assert (=> b!325621 m!331865))

(assert (=> b!325621 m!331865))

(declare-fun m!331867 () Bool)

(assert (=> b!325621 m!331867))

(declare-fun m!331869 () Bool)

(assert (=> b!325626 m!331869))

(assert (=> b!325623 m!331869))

(assert (=> b!325628 m!331869))

(assert (=> b!325529 d!69503))

(declare-fun d!69511 () Bool)

(declare-fun res!178952 () Bool)

(declare-fun e!200626 () Bool)

(assert (=> d!69511 (=> res!178952 e!200626)))

(assert (=> d!69511 (= res!178952 (= (select (arr!7893 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69511 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!200626)))

(declare-fun b!325634 () Bool)

(declare-fun e!200627 () Bool)

(assert (=> b!325634 (= e!200626 e!200627)))

(declare-fun res!178953 () Bool)

(assert (=> b!325634 (=> (not res!178953) (not e!200627))))

(assert (=> b!325634 (= res!178953 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8246 a!3305)))))

(declare-fun b!325635 () Bool)

(assert (=> b!325635 (= e!200627 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69511 (not res!178952)) b!325634))

(assert (= (and b!325634 res!178953) b!325635))

(declare-fun m!331871 () Bool)

(assert (=> d!69511 m!331871))

(declare-fun m!331873 () Bool)

(assert (=> b!325635 m!331873))

(assert (=> b!325534 d!69511))

(declare-fun b!325636 () Bool)

(declare-fun e!200630 () SeekEntryResult!3023)

(assert (=> b!325636 (= e!200630 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325637 () Bool)

(declare-fun e!200629 () Bool)

(declare-fun e!200632 () Bool)

(assert (=> b!325637 (= e!200629 e!200632)))

(declare-fun res!178954 () Bool)

(declare-fun lt!156925 () SeekEntryResult!3023)

(assert (=> b!325637 (= res!178954 (and ((_ is Intermediate!3023) lt!156925) (not (undefined!3835 lt!156925)) (bvslt (x!32527 lt!156925) #b01111111111111111111111111111110) (bvsge (x!32527 lt!156925) #b00000000000000000000000000000000) (bvsge (x!32527 lt!156925) x!1490)))))

(assert (=> b!325637 (=> (not res!178954) (not e!200632))))

(declare-fun b!325638 () Bool)

(assert (=> b!325638 (and (bvsge (index!14270 lt!156925) #b00000000000000000000000000000000) (bvslt (index!14270 lt!156925) (size!8246 a!3305)))))

(declare-fun e!200628 () Bool)

(assert (=> b!325638 (= e!200628 (= (select (arr!7893 a!3305) (index!14270 lt!156925)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325639 () Bool)

(declare-fun e!200631 () SeekEntryResult!3023)

(assert (=> b!325639 (= e!200631 e!200630)))

(declare-fun c!50971 () Bool)

(declare-fun lt!156924 () (_ BitVec 64))

(assert (=> b!325639 (= c!50971 (or (= lt!156924 k0!2497) (= (bvadd lt!156924 lt!156924) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325640 () Bool)

(assert (=> b!325640 (= e!200630 (Intermediate!3023 false index!1840 x!1490))))

(declare-fun b!325641 () Bool)

(assert (=> b!325641 (and (bvsge (index!14270 lt!156925) #b00000000000000000000000000000000) (bvslt (index!14270 lt!156925) (size!8246 a!3305)))))

(declare-fun res!178956 () Bool)

(assert (=> b!325641 (= res!178956 (= (select (arr!7893 a!3305) (index!14270 lt!156925)) k0!2497))))

(assert (=> b!325641 (=> res!178956 e!200628)))

(assert (=> b!325641 (= e!200632 e!200628)))

(declare-fun b!325642 () Bool)

(assert (=> b!325642 (= e!200631 (Intermediate!3023 true index!1840 x!1490))))

(declare-fun b!325643 () Bool)

(assert (=> b!325643 (and (bvsge (index!14270 lt!156925) #b00000000000000000000000000000000) (bvslt (index!14270 lt!156925) (size!8246 a!3305)))))

(declare-fun res!178955 () Bool)

(assert (=> b!325643 (= res!178955 (= (select (arr!7893 a!3305) (index!14270 lt!156925)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325643 (=> res!178955 e!200628)))

(declare-fun b!325644 () Bool)

(assert (=> b!325644 (= e!200629 (bvsge (x!32527 lt!156925) #b01111111111111111111111111111110))))

(declare-fun d!69513 () Bool)

(assert (=> d!69513 e!200629))

(declare-fun c!50972 () Bool)

(assert (=> d!69513 (= c!50972 (and ((_ is Intermediate!3023) lt!156925) (undefined!3835 lt!156925)))))

(assert (=> d!69513 (= lt!156925 e!200631)))

(declare-fun c!50970 () Bool)

(assert (=> d!69513 (= c!50970 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69513 (= lt!156924 (select (arr!7893 a!3305) index!1840))))

(assert (=> d!69513 (validMask!0 mask!3777)))

(assert (=> d!69513 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156925)))

(assert (= (and d!69513 c!50970) b!325642))

(assert (= (and d!69513 (not c!50970)) b!325639))

(assert (= (and b!325639 c!50971) b!325640))

(assert (= (and b!325639 (not c!50971)) b!325636))

(assert (= (and d!69513 c!50972) b!325644))

(assert (= (and d!69513 (not c!50972)) b!325637))

(assert (= (and b!325637 res!178954) b!325641))

(assert (= (and b!325641 (not res!178956)) b!325643))

(assert (= (and b!325643 (not res!178955)) b!325638))

(assert (=> d!69513 m!331799))

(assert (=> d!69513 m!331783))

(assert (=> b!325636 m!331803))

(assert (=> b!325636 m!331803))

(declare-fun m!331875 () Bool)

(assert (=> b!325636 m!331875))

(declare-fun m!331877 () Bool)

(assert (=> b!325641 m!331877))

(assert (=> b!325638 m!331877))

(assert (=> b!325643 m!331877))

(assert (=> b!325528 d!69513))

(declare-fun d!69515 () Bool)

(declare-fun lt!156932 () (_ BitVec 32))

(assert (=> d!69515 (and (bvsge lt!156932 #b00000000000000000000000000000000) (bvslt lt!156932 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69515 (= lt!156932 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69515 (validMask!0 mask!3777)))

(assert (=> d!69515 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!156932)))

(declare-fun bs!11304 () Bool)

(assert (= bs!11304 d!69515))

(declare-fun m!331879 () Bool)

(assert (=> bs!11304 m!331879))

(assert (=> bs!11304 m!331783))

(assert (=> b!325533 d!69515))

(declare-fun b!325717 () Bool)

(declare-fun e!200675 () SeekEntryResult!3023)

(declare-fun lt!156959 () SeekEntryResult!3023)

(assert (=> b!325717 (= e!200675 (Found!3023 (index!14270 lt!156959)))))

(declare-fun b!325718 () Bool)

(declare-fun c!51002 () Bool)

(declare-fun lt!156960 () (_ BitVec 64))

(assert (=> b!325718 (= c!51002 (= lt!156960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200676 () SeekEntryResult!3023)

(assert (=> b!325718 (= e!200675 e!200676)))

(declare-fun b!325719 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16674 (_ BitVec 32)) SeekEntryResult!3023)

(assert (=> b!325719 (= e!200676 (seekKeyOrZeroReturnVacant!0 (x!32527 lt!156959) (index!14270 lt!156959) (index!14270 lt!156959) k0!2497 a!3305 mask!3777))))

(declare-fun b!325720 () Bool)

(declare-fun e!200674 () SeekEntryResult!3023)

(assert (=> b!325720 (= e!200674 Undefined!3023)))

(declare-fun b!325721 () Bool)

(assert (=> b!325721 (= e!200674 e!200675)))

(assert (=> b!325721 (= lt!156960 (select (arr!7893 a!3305) (index!14270 lt!156959)))))

(declare-fun c!51001 () Bool)

(assert (=> b!325721 (= c!51001 (= lt!156960 k0!2497))))

(declare-fun b!325722 () Bool)

(assert (=> b!325722 (= e!200676 (MissingZero!3023 (index!14270 lt!156959)))))

(declare-fun d!69517 () Bool)

(declare-fun lt!156958 () SeekEntryResult!3023)

(assert (=> d!69517 (and (or ((_ is Undefined!3023) lt!156958) (not ((_ is Found!3023) lt!156958)) (and (bvsge (index!14269 lt!156958) #b00000000000000000000000000000000) (bvslt (index!14269 lt!156958) (size!8246 a!3305)))) (or ((_ is Undefined!3023) lt!156958) ((_ is Found!3023) lt!156958) (not ((_ is MissingZero!3023) lt!156958)) (and (bvsge (index!14268 lt!156958) #b00000000000000000000000000000000) (bvslt (index!14268 lt!156958) (size!8246 a!3305)))) (or ((_ is Undefined!3023) lt!156958) ((_ is Found!3023) lt!156958) ((_ is MissingZero!3023) lt!156958) (not ((_ is MissingVacant!3023) lt!156958)) (and (bvsge (index!14271 lt!156958) #b00000000000000000000000000000000) (bvslt (index!14271 lt!156958) (size!8246 a!3305)))) (or ((_ is Undefined!3023) lt!156958) (ite ((_ is Found!3023) lt!156958) (= (select (arr!7893 a!3305) (index!14269 lt!156958)) k0!2497) (ite ((_ is MissingZero!3023) lt!156958) (= (select (arr!7893 a!3305) (index!14268 lt!156958)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3023) lt!156958) (= (select (arr!7893 a!3305) (index!14271 lt!156958)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69517 (= lt!156958 e!200674)))

(declare-fun c!51000 () Bool)

(assert (=> d!69517 (= c!51000 (and ((_ is Intermediate!3023) lt!156959) (undefined!3835 lt!156959)))))

(assert (=> d!69517 (= lt!156959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69517 (validMask!0 mask!3777)))

(assert (=> d!69517 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!156958)))

(assert (= (and d!69517 c!51000) b!325720))

(assert (= (and d!69517 (not c!51000)) b!325721))

(assert (= (and b!325721 c!51001) b!325717))

(assert (= (and b!325721 (not c!51001)) b!325718))

(assert (= (and b!325718 c!51002) b!325722))

(assert (= (and b!325718 (not c!51002)) b!325719))

(declare-fun m!331911 () Bool)

(assert (=> b!325719 m!331911))

(declare-fun m!331913 () Bool)

(assert (=> b!325721 m!331913))

(assert (=> d!69517 m!331783))

(declare-fun m!331915 () Bool)

(assert (=> d!69517 m!331915))

(declare-fun m!331917 () Bool)

(assert (=> d!69517 m!331917))

(assert (=> d!69517 m!331787))

(declare-fun m!331919 () Bool)

(assert (=> d!69517 m!331919))

(assert (=> d!69517 m!331787))

(assert (=> d!69517 m!331789))

(assert (=> b!325527 d!69517))

(declare-fun d!69535 () Bool)

(assert (=> d!69535 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32582 d!69535))

(declare-fun d!69543 () Bool)

(assert (=> d!69543 (= (array_inv!5865 a!3305) (bvsge (size!8246 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32582 d!69543))

(declare-fun b!325800 () Bool)

(declare-fun e!200725 () Bool)

(declare-fun call!26060 () Bool)

(assert (=> b!325800 (= e!200725 call!26060)))

(declare-fun bm!26057 () Bool)

(assert (=> bm!26057 (= call!26060 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!325801 () Bool)

(declare-fun e!200723 () Bool)

(declare-fun e!200724 () Bool)

(assert (=> b!325801 (= e!200723 e!200724)))

(declare-fun c!51029 () Bool)

(assert (=> b!325801 (= c!51029 (validKeyInArray!0 (select (arr!7893 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!325802 () Bool)

(assert (=> b!325802 (= e!200724 call!26060)))

(declare-fun b!325803 () Bool)

(assert (=> b!325803 (= e!200724 e!200725)))

(declare-fun lt!157000 () (_ BitVec 64))

(assert (=> b!325803 (= lt!157000 (select (arr!7893 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10060 0))(
  ( (Unit!10061) )
))
(declare-fun lt!156998 () Unit!10060)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16674 (_ BitVec 64) (_ BitVec 32)) Unit!10060)

(assert (=> b!325803 (= lt!156998 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157000 #b00000000000000000000000000000000))))

(assert (=> b!325803 (arrayContainsKey!0 a!3305 lt!157000 #b00000000000000000000000000000000)))

(declare-fun lt!156999 () Unit!10060)

(assert (=> b!325803 (= lt!156999 lt!156998)))

(declare-fun res!179002 () Bool)

(assert (=> b!325803 (= res!179002 (= (seekEntryOrOpen!0 (select (arr!7893 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3023 #b00000000000000000000000000000000)))))

(assert (=> b!325803 (=> (not res!179002) (not e!200725))))

(declare-fun d!69547 () Bool)

(declare-fun res!179003 () Bool)

(assert (=> d!69547 (=> res!179003 e!200723)))

(assert (=> d!69547 (= res!179003 (bvsge #b00000000000000000000000000000000 (size!8246 a!3305)))))

(assert (=> d!69547 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!200723)))

(assert (= (and d!69547 (not res!179003)) b!325801))

(assert (= (and b!325801 c!51029) b!325803))

(assert (= (and b!325801 (not c!51029)) b!325802))

(assert (= (and b!325803 res!179002) b!325800))

(assert (= (or b!325800 b!325802) bm!26057))

(declare-fun m!331951 () Bool)

(assert (=> bm!26057 m!331951))

(assert (=> b!325801 m!331871))

(assert (=> b!325801 m!331871))

(declare-fun m!331953 () Bool)

(assert (=> b!325801 m!331953))

(assert (=> b!325803 m!331871))

(declare-fun m!331955 () Bool)

(assert (=> b!325803 m!331955))

(declare-fun m!331957 () Bool)

(assert (=> b!325803 m!331957))

(assert (=> b!325803 m!331871))

(declare-fun m!331959 () Bool)

(assert (=> b!325803 m!331959))

(assert (=> b!325526 d!69547))

(declare-fun d!69553 () Bool)

(assert (=> d!69553 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325531 d!69553))

(declare-fun b!325810 () Bool)

(declare-fun e!200731 () SeekEntryResult!3023)

(assert (=> b!325810 (= e!200731 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325811 () Bool)

(declare-fun e!200730 () Bool)

(declare-fun e!200733 () Bool)

(assert (=> b!325811 (= e!200730 e!200733)))

(declare-fun res!179004 () Bool)

(declare-fun lt!157005 () SeekEntryResult!3023)

(assert (=> b!325811 (= res!179004 (and ((_ is Intermediate!3023) lt!157005) (not (undefined!3835 lt!157005)) (bvslt (x!32527 lt!157005) #b01111111111111111111111111111110) (bvsge (x!32527 lt!157005) #b00000000000000000000000000000000) (bvsge (x!32527 lt!157005) #b00000000000000000000000000000000)))))

(assert (=> b!325811 (=> (not res!179004) (not e!200733))))

(declare-fun b!325812 () Bool)

(assert (=> b!325812 (and (bvsge (index!14270 lt!157005) #b00000000000000000000000000000000) (bvslt (index!14270 lt!157005) (size!8246 a!3305)))))

(declare-fun e!200729 () Bool)

(assert (=> b!325812 (= e!200729 (= (select (arr!7893 a!3305) (index!14270 lt!157005)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325813 () Bool)

(declare-fun e!200732 () SeekEntryResult!3023)

(assert (=> b!325813 (= e!200732 e!200731)))

(declare-fun c!51034 () Bool)

(declare-fun lt!157004 () (_ BitVec 64))

(assert (=> b!325813 (= c!51034 (or (= lt!157004 k0!2497) (= (bvadd lt!157004 lt!157004) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325814 () Bool)

(assert (=> b!325814 (= e!200731 (Intermediate!3023 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325815 () Bool)

(assert (=> b!325815 (and (bvsge (index!14270 lt!157005) #b00000000000000000000000000000000) (bvslt (index!14270 lt!157005) (size!8246 a!3305)))))

(declare-fun res!179006 () Bool)

(assert (=> b!325815 (= res!179006 (= (select (arr!7893 a!3305) (index!14270 lt!157005)) k0!2497))))

(assert (=> b!325815 (=> res!179006 e!200729)))

(assert (=> b!325815 (= e!200733 e!200729)))

(declare-fun b!325816 () Bool)

(assert (=> b!325816 (= e!200732 (Intermediate!3023 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325817 () Bool)

(assert (=> b!325817 (and (bvsge (index!14270 lt!157005) #b00000000000000000000000000000000) (bvslt (index!14270 lt!157005) (size!8246 a!3305)))))

(declare-fun res!179005 () Bool)

(assert (=> b!325817 (= res!179005 (= (select (arr!7893 a!3305) (index!14270 lt!157005)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325817 (=> res!179005 e!200729)))

(declare-fun b!325818 () Bool)

(assert (=> b!325818 (= e!200730 (bvsge (x!32527 lt!157005) #b01111111111111111111111111111110))))

(declare-fun d!69555 () Bool)

(assert (=> d!69555 e!200730))

(declare-fun c!51035 () Bool)

(assert (=> d!69555 (= c!51035 (and ((_ is Intermediate!3023) lt!157005) (undefined!3835 lt!157005)))))

(assert (=> d!69555 (= lt!157005 e!200732)))

(declare-fun c!51033 () Bool)

(assert (=> d!69555 (= c!51033 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69555 (= lt!157004 (select (arr!7893 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69555 (validMask!0 mask!3777)))

(assert (=> d!69555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157005)))

(assert (= (and d!69555 c!51033) b!325816))

(assert (= (and d!69555 (not c!51033)) b!325813))

(assert (= (and b!325813 c!51034) b!325814))

(assert (= (and b!325813 (not c!51034)) b!325810))

(assert (= (and d!69555 c!51035) b!325818))

(assert (= (and d!69555 (not c!51035)) b!325811))

(assert (= (and b!325811 res!179004) b!325815))

(assert (= (and b!325815 (not res!179006)) b!325817))

(assert (= (and b!325817 (not res!179005)) b!325812))

(assert (=> d!69555 m!331787))

(declare-fun m!331971 () Bool)

(assert (=> d!69555 m!331971))

(assert (=> d!69555 m!331783))

(assert (=> b!325810 m!331787))

(declare-fun m!331973 () Bool)

(assert (=> b!325810 m!331973))

(assert (=> b!325810 m!331973))

(declare-fun m!331975 () Bool)

(assert (=> b!325810 m!331975))

(declare-fun m!331977 () Bool)

(assert (=> b!325815 m!331977))

(assert (=> b!325812 m!331977))

(assert (=> b!325817 m!331977))

(assert (=> b!325535 d!69555))

(declare-fun d!69559 () Bool)

(declare-fun lt!157011 () (_ BitVec 32))

(declare-fun lt!157010 () (_ BitVec 32))

(assert (=> d!69559 (= lt!157011 (bvmul (bvxor lt!157010 (bvlshr lt!157010 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69559 (= lt!157010 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69559 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!179007 (let ((h!5364 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32537 (bvmul (bvxor h!5364 (bvlshr h!5364 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32537 (bvlshr x!32537 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!179007 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!179007 #b00000000000000000000000000000000))))))

(assert (=> d!69559 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157011 (bvlshr lt!157011 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!325535 d!69559))

(check-sat (not d!69513) (not b!325803) (not d!69515) (not b!325810) (not b!325801) (not bm!26057) (not d!69517) (not d!69555) (not b!325621) (not d!69503) (not b!325635) (not b!325719) (not b!325636))
(check-sat)
