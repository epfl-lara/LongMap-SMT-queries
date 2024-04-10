; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32294 () Bool)

(assert start!32294)

(declare-fun b!321854 () Bool)

(declare-fun res!175977 () Bool)

(declare-fun e!199302 () Bool)

(assert (=> b!321854 (=> (not res!175977) (not e!199302))))

(declare-datatypes ((array!16484 0))(
  ( (array!16485 (arr!7801 (Array (_ BitVec 32) (_ BitVec 64))) (size!8153 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16484)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321854 (= res!175977 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321855 () Bool)

(declare-fun e!199303 () Bool)

(assert (=> b!321855 (= e!199302 e!199303)))

(declare-fun res!175974 () Bool)

(assert (=> b!321855 (=> (not res!175974) (not e!199303))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2932 0))(
  ( (MissingZero!2932 (index!13904 (_ BitVec 32))) (Found!2932 (index!13905 (_ BitVec 32))) (Intermediate!2932 (undefined!3744 Bool) (index!13906 (_ BitVec 32)) (x!32159 (_ BitVec 32))) (Undefined!2932) (MissingVacant!2932 (index!13907 (_ BitVec 32))) )
))
(declare-fun lt!156273 () SeekEntryResult!2932)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16484 (_ BitVec 32)) SeekEntryResult!2932)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321855 (= res!175974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156273))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321855 (= lt!156273 (Intermediate!2932 false resIndex!58 resX!58))))

(declare-fun b!321856 () Bool)

(declare-fun res!175978 () Bool)

(assert (=> b!321856 (=> (not res!175978) (not e!199303))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321856 (= res!175978 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156273))))

(declare-fun res!175980 () Bool)

(assert (=> start!32294 (=> (not res!175980) (not e!199302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32294 (= res!175980 (validMask!0 mask!3777))))

(assert (=> start!32294 e!199302))

(declare-fun array_inv!5764 (array!16484) Bool)

(assert (=> start!32294 (array_inv!5764 a!3305)))

(assert (=> start!32294 true))

(declare-fun b!321857 () Bool)

(declare-fun res!175976 () Bool)

(assert (=> b!321857 (=> (not res!175976) (not e!199302))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16484 (_ BitVec 32)) SeekEntryResult!2932)

(assert (=> b!321857 (= res!175976 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2932 i!1250)))))

(declare-fun b!321858 () Bool)

(declare-fun lt!156272 () (_ BitVec 32))

(assert (=> b!321858 (= e!199303 (and (bvsge mask!3777 #b00000000000000000000000000000000) (or (bvslt lt!156272 #b00000000000000000000000000000000) (bvsge lt!156272 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321858 (= lt!156272 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321859 () Bool)

(declare-fun res!175983 () Bool)

(assert (=> b!321859 (=> (not res!175983) (not e!199303))))

(assert (=> b!321859 (= res!175983 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7801 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7801 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7801 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321860 () Bool)

(declare-fun res!175979 () Bool)

(assert (=> b!321860 (=> (not res!175979) (not e!199303))))

(assert (=> b!321860 (= res!175979 (and (= (select (arr!7801 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8153 a!3305))))))

(declare-fun b!321861 () Bool)

(declare-fun res!175975 () Bool)

(assert (=> b!321861 (=> (not res!175975) (not e!199302))))

(assert (=> b!321861 (= res!175975 (and (= (size!8153 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8153 a!3305))))))

(declare-fun b!321862 () Bool)

(declare-fun res!175981 () Bool)

(assert (=> b!321862 (=> (not res!175981) (not e!199302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321862 (= res!175981 (validKeyInArray!0 k!2497))))

(declare-fun b!321863 () Bool)

(declare-fun res!175982 () Bool)

(assert (=> b!321863 (=> (not res!175982) (not e!199302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16484 (_ BitVec 32)) Bool)

(assert (=> b!321863 (= res!175982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32294 res!175980) b!321861))

(assert (= (and b!321861 res!175975) b!321862))

(assert (= (and b!321862 res!175981) b!321854))

(assert (= (and b!321854 res!175977) b!321857))

(assert (= (and b!321857 res!175976) b!321863))

(assert (= (and b!321863 res!175982) b!321855))

(assert (= (and b!321855 res!175974) b!321860))

(assert (= (and b!321860 res!175979) b!321856))

(assert (= (and b!321856 res!175978) b!321859))

(assert (= (and b!321859 res!175983) b!321858))

(declare-fun m!329915 () Bool)

(assert (=> b!321856 m!329915))

(declare-fun m!329917 () Bool)

(assert (=> b!321857 m!329917))

(declare-fun m!329919 () Bool)

(assert (=> b!321855 m!329919))

(assert (=> b!321855 m!329919))

(declare-fun m!329921 () Bool)

(assert (=> b!321855 m!329921))

(declare-fun m!329923 () Bool)

(assert (=> b!321863 m!329923))

(declare-fun m!329925 () Bool)

(assert (=> b!321858 m!329925))

(declare-fun m!329927 () Bool)

(assert (=> start!32294 m!329927))

(declare-fun m!329929 () Bool)

(assert (=> start!32294 m!329929))

(declare-fun m!329931 () Bool)

(assert (=> b!321862 m!329931))

(declare-fun m!329933 () Bool)

(assert (=> b!321854 m!329933))

(declare-fun m!329935 () Bool)

(assert (=> b!321860 m!329935))

(declare-fun m!329937 () Bool)

(assert (=> b!321859 m!329937))

(push 1)

(assert (not b!321854))

(assert (not b!321858))

(assert (not start!32294))

(assert (not b!321855))

(assert (not b!321857))

(assert (not b!321863))

(assert (not b!321856))

(assert (not b!321862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69533 () Bool)

(assert (=> d!69533 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!321862 d!69533))

(declare-fun b!321948 () Bool)

(declare-fun lt!156300 () SeekEntryResult!2932)

(assert (=> b!321948 (and (bvsge (index!13906 lt!156300) #b00000000000000000000000000000000) (bvslt (index!13906 lt!156300) (size!8153 a!3305)))))

(declare-fun res!176015 () Bool)

(assert (=> b!321948 (= res!176015 (= (select (arr!7801 a!3305) (index!13906 lt!156300)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!199354 () Bool)

(assert (=> b!321948 (=> res!176015 e!199354)))

(declare-fun b!321949 () Bool)

(declare-fun e!199357 () Bool)

(declare-fun e!199353 () Bool)

(assert (=> b!321949 (= e!199357 e!199353)))

(declare-fun res!176014 () Bool)

(assert (=> b!321949 (= res!176014 (and (is-Intermediate!2932 lt!156300) (not (undefined!3744 lt!156300)) (bvslt (x!32159 lt!156300) #b01111111111111111111111111111110) (bvsge (x!32159 lt!156300) #b00000000000000000000000000000000) (bvsge (x!32159 lt!156300) x!1490)))))

(assert (=> b!321949 (=> (not res!176014) (not e!199353))))

(declare-fun b!321950 () Bool)

(assert (=> b!321950 (and (bvsge (index!13906 lt!156300) #b00000000000000000000000000000000) (bvslt (index!13906 lt!156300) (size!8153 a!3305)))))

(assert (=> b!321950 (= e!199354 (= (select (arr!7801 a!3305) (index!13906 lt!156300)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321951 () Bool)

(assert (=> b!321951 (= e!199357 (bvsge (x!32159 lt!156300) #b01111111111111111111111111111110))))

(declare-fun b!321952 () Bool)

(declare-fun e!199355 () SeekEntryResult!2932)

(declare-fun e!199356 () SeekEntryResult!2932)

(assert (=> b!321952 (= e!199355 e!199356)))

(declare-fun c!50595 () Bool)

(declare-fun lt!156299 () (_ BitVec 64))

(assert (=> b!321952 (= c!50595 (or (= lt!156299 k!2497) (= (bvadd lt!156299 lt!156299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!321953 () Bool)

(assert (=> b!321953 (= e!199355 (Intermediate!2932 true index!1840 x!1490))))

(declare-fun d!69535 () Bool)

(assert (=> d!69535 e!199357))

(declare-fun c!50593 () Bool)

(assert (=> d!69535 (= c!50593 (and (is-Intermediate!2932 lt!156300) (undefined!3744 lt!156300)))))

(assert (=> d!69535 (= lt!156300 e!199355)))

(declare-fun c!50594 () Bool)

(assert (=> d!69535 (= c!50594 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69535 (= lt!156299 (select (arr!7801 a!3305) index!1840))))

(assert (=> d!69535 (validMask!0 mask!3777)))

(assert (=> d!69535 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156300)))

(declare-fun b!321954 () Bool)

(assert (=> b!321954 (= e!199356 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!321955 () Bool)

(assert (=> b!321955 (= e!199356 (Intermediate!2932 false index!1840 x!1490))))

(declare-fun b!321956 () Bool)

(assert (=> b!321956 (and (bvsge (index!13906 lt!156300) #b00000000000000000000000000000000) (bvslt (index!13906 lt!156300) (size!8153 a!3305)))))

(declare-fun res!176016 () Bool)

(assert (=> b!321956 (= res!176016 (= (select (arr!7801 a!3305) (index!13906 lt!156300)) k!2497))))

(assert (=> b!321956 (=> res!176016 e!199354)))

(assert (=> b!321956 (= e!199353 e!199354)))

(assert (= (and d!69535 c!50594) b!321953))

(assert (= (and d!69535 (not c!50594)) b!321952))

(assert (= (and b!321952 c!50595) b!321955))

(assert (= (and b!321952 (not c!50595)) b!321954))

(assert (= (and d!69535 c!50593) b!321951))

(assert (= (and d!69535 (not c!50593)) b!321949))

(assert (= (and b!321949 res!176014) b!321956))

(assert (= (and b!321956 (not res!176016)) b!321948))

(assert (= (and b!321948 (not res!176015)) b!321950))

(assert (=> b!321954 m!329925))

(assert (=> b!321954 m!329925))

(declare-fun m!329959 () Bool)

(assert (=> b!321954 m!329959))

(declare-fun m!329961 () Bool)

(assert (=> b!321950 m!329961))

(assert (=> d!69535 m!329937))

(assert (=> d!69535 m!329927))

(assert (=> b!321956 m!329961))

(assert (=> b!321948 m!329961))

(assert (=> b!321856 d!69535))

(declare-fun b!321961 () Bool)

(declare-fun lt!156302 () SeekEntryResult!2932)

(assert (=> b!321961 (and (bvsge (index!13906 lt!156302) #b00000000000000000000000000000000) (bvslt (index!13906 lt!156302) (size!8153 a!3305)))))

(declare-fun res!176022 () Bool)

(assert (=> b!321961 (= res!176022 (= (select (arr!7801 a!3305) (index!13906 lt!156302)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!199363 () Bool)

(assert (=> b!321961 (=> res!176022 e!199363)))

(declare-fun b!321962 () Bool)

(declare-fun e!199366 () Bool)

(declare-fun e!199362 () Bool)

(assert (=> b!321962 (= e!199366 e!199362)))

(declare-fun res!176021 () Bool)

(assert (=> b!321962 (= res!176021 (and (is-Intermediate!2932 lt!156302) (not (undefined!3744 lt!156302)) (bvslt (x!32159 lt!156302) #b01111111111111111111111111111110) (bvsge (x!32159 lt!156302) #b00000000000000000000000000000000) (bvsge (x!32159 lt!156302) #b00000000000000000000000000000000)))))

(assert (=> b!321962 (=> (not res!176021) (not e!199362))))

(declare-fun b!321963 () Bool)

(assert (=> b!321963 (and (bvsge (index!13906 lt!156302) #b00000000000000000000000000000000) (bvslt (index!13906 lt!156302) (size!8153 a!3305)))))

(assert (=> b!321963 (= e!199363 (= (select (arr!7801 a!3305) (index!13906 lt!156302)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321964 () Bool)

(assert (=> b!321964 (= e!199366 (bvsge (x!32159 lt!156302) #b01111111111111111111111111111110))))

(declare-fun b!321965 () Bool)

(declare-fun e!199364 () SeekEntryResult!2932)

(declare-fun e!199365 () SeekEntryResult!2932)

(assert (=> b!321965 (= e!199364 e!199365)))

(declare-fun c!50598 () Bool)

(declare-fun lt!156301 () (_ BitVec 64))

(assert (=> b!321965 (= c!50598 (or (= lt!156301 k!2497) (= (bvadd lt!156301 lt!156301) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!321966 () Bool)

(assert (=> b!321966 (= e!199364 (Intermediate!2932 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!69541 () Bool)

(assert (=> d!69541 e!199366))

(declare-fun c!50596 () Bool)

(assert (=> d!69541 (= c!50596 (and (is-Intermediate!2932 lt!156302) (undefined!3744 lt!156302)))))

(assert (=> d!69541 (= lt!156302 e!199364)))

(declare-fun c!50597 () Bool)

(assert (=> d!69541 (= c!50597 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69541 (= lt!156301 (select (arr!7801 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69541 (validMask!0 mask!3777)))

(assert (=> d!69541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156302)))

(declare-fun b!321967 () Bool)

(assert (=> b!321967 (= e!199365 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!321968 () Bool)

(assert (=> b!321968 (= e!199365 (Intermediate!2932 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!321969 () Bool)

(assert (=> b!321969 (and (bvsge (index!13906 lt!156302) #b00000000000000000000000000000000) (bvslt (index!13906 lt!156302) (size!8153 a!3305)))))

(declare-fun res!176023 () Bool)

(assert (=> b!321969 (= res!176023 (= (select (arr!7801 a!3305) (index!13906 lt!156302)) k!2497))))

(assert (=> b!321969 (=> res!176023 e!199363)))

(assert (=> b!321969 (= e!199362 e!199363)))

(assert (= (and d!69541 c!50597) b!321966))

(assert (= (and d!69541 (not c!50597)) b!321965))

(assert (= (and b!321965 c!50598) b!321968))

(assert (= (and b!321965 (not c!50598)) b!321967))

(assert (= (and d!69541 c!50596) b!321964))

(assert (= (and d!69541 (not c!50596)) b!321962))

(assert (= (and b!321962 res!176021) b!321969))

(assert (= (and b!321969 (not res!176023)) b!321961))

(assert (= (and b!321961 (not res!176022)) b!321963))

(assert (=> b!321967 m!329919))

(declare-fun m!329965 () Bool)

(assert (=> b!321967 m!329965))

(assert (=> b!321967 m!329965))

(declare-fun m!329967 () Bool)

(assert (=> b!321967 m!329967))

(declare-fun m!329969 () Bool)

(assert (=> b!321963 m!329969))

(assert (=> d!69541 m!329919))

(declare-fun m!329971 () Bool)

(assert (=> d!69541 m!329971))

(assert (=> d!69541 m!329927))

(assert (=> b!321969 m!329969))

(assert (=> b!321961 m!329969))

(assert (=> b!321855 d!69541))

(declare-fun d!69545 () Bool)

(declare-fun lt!156313 () (_ BitVec 32))

(declare-fun lt!156312 () (_ BitVec 32))

(assert (=> d!69545 (= lt!156313 (bvmul (bvxor lt!156312 (bvlshr lt!156312 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69545 (= lt!156312 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69545 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!176026 (let ((h!5388 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32163 (bvmul (bvxor h!5388 (bvlshr h!5388 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32163 (bvlshr x!32163 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!176026 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!176026 #b00000000000000000000000000000000))))))

(assert (=> d!69545 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!156313 (bvlshr lt!156313 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!321855 d!69545))

(declare-fun d!69553 () Bool)

(declare-fun res!176035 () Bool)

(declare-fun e!199378 () Bool)

(assert (=> d!69553 (=> res!176035 e!199378)))

(assert (=> d!69553 (= res!176035 (= (select (arr!7801 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69553 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!199378)))

(declare-fun b!321985 () Bool)

(declare-fun e!199379 () Bool)

(assert (=> b!321985 (= e!199378 e!199379)))

(declare-fun res!176036 () Bool)

(assert (=> b!321985 (=> (not res!176036) (not e!199379))))

(assert (=> b!321985 (= res!176036 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8153 a!3305)))))

(declare-fun b!321986 () Bool)

(assert (=> b!321986 (= e!199379 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69553 (not res!176035)) b!321985))

(assert (= (and b!321985 res!176036) b!321986))

(declare-fun m!329983 () Bool)

(assert (=> d!69553 m!329983))

(declare-fun m!329985 () Bool)

(assert (=> b!321986 m!329985))

(assert (=> b!321854 d!69553))

(declare-fun d!69555 () Bool)

(declare-fun lt!156322 () (_ BitVec 32))

(assert (=> d!69555 (and (bvsge lt!156322 #b00000000000000000000000000000000) (bvslt lt!156322 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69555 (= lt!156322 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69555 (validMask!0 mask!3777)))

(assert (=> d!69555 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!156322)))

(declare-fun bs!11229 () Bool)

(assert (= bs!11229 d!69555))

(declare-fun m!329987 () Bool)

(assert (=> bs!11229 m!329987))

(assert (=> bs!11229 m!329927))

(assert (=> b!321858 d!69555))

(declare-fun bm!26065 () Bool)

(declare-fun call!26068 () Bool)

(assert (=> bm!26065 (= call!26068 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!322004 () Bool)

(declare-fun e!199392 () Bool)

(declare-fun e!199391 () Bool)

(assert (=> b!322004 (= e!199392 e!199391)))

(declare-fun lt!156338 () (_ BitVec 64))

(assert (=> b!322004 (= lt!156338 (select (arr!7801 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9834 0))(
  ( (Unit!9835) )
))
(declare-fun lt!156339 () Unit!9834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16484 (_ BitVec 64) (_ BitVec 32)) Unit!9834)

(assert (=> b!322004 (= lt!156339 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!156338 #b00000000000000000000000000000000))))

(assert (=> b!322004 (arrayContainsKey!0 a!3305 lt!156338 #b00000000000000000000000000000000)))

(declare-fun lt!156337 () Unit!9834)

(assert (=> b!322004 (= lt!156337 lt!156339)))

(declare-fun res!176046 () Bool)

(assert (=> b!322004 (= res!176046 (= (seekEntryOrOpen!0 (select (arr!7801 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2932 #b00000000000000000000000000000000)))))

(assert (=> b!322004 (=> (not res!176046) (not e!199391))))

(declare-fun b!322005 () Bool)

(assert (=> b!322005 (= e!199391 call!26068)))

(declare-fun b!322006 () Bool)

(assert (=> b!322006 (= e!199392 call!26068)))

(declare-fun b!322007 () Bool)

(declare-fun e!199393 () Bool)

(assert (=> b!322007 (= e!199393 e!199392)))

(declare-fun c!50607 () Bool)

(assert (=> b!322007 (= c!50607 (validKeyInArray!0 (select (arr!7801 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!69563 () Bool)

(declare-fun res!176045 () Bool)

(assert (=> d!69563 (=> res!176045 e!199393)))

(assert (=> d!69563 (= res!176045 (bvsge #b00000000000000000000000000000000 (size!8153 a!3305)))))

(assert (=> d!69563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!199393)))

(assert (= (and d!69563 (not res!176045)) b!322007))

(assert (= (and b!322007 c!50607) b!322004))

(assert (= (and b!322007 (not c!50607)) b!322006))

(assert (= (and b!322004 res!176046) b!322005))

(assert (= (or b!322005 b!322006) bm!26065))

(declare-fun m!329997 () Bool)

(assert (=> bm!26065 m!329997))

(assert (=> b!322004 m!329983))

(declare-fun m!329999 () Bool)

(assert (=> b!322004 m!329999))

(declare-fun m!330001 () Bool)

(assert (=> b!322004 m!330001))

(assert (=> b!322004 m!329983))

(declare-fun m!330003 () Bool)

(assert (=> b!322004 m!330003))

(assert (=> b!322007 m!329983))

(assert (=> b!322007 m!329983))

(declare-fun m!330005 () Bool)

(assert (=> b!322007 m!330005))

(assert (=> b!321863 d!69563))

(declare-fun d!69571 () Bool)

(assert (=> d!69571 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32294 d!69571))

(declare-fun d!69575 () Bool)

(assert (=> d!69575 (= (array_inv!5764 a!3305) (bvsge (size!8153 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32294 d!69575))

(declare-fun lt!156376 () SeekEntryResult!2932)

(declare-fun e!199434 () SeekEntryResult!2932)

