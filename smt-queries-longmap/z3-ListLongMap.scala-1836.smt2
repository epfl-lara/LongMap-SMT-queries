; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33212 () Bool)

(assert start!33212)

(declare-fun res!182180 () Bool)

(declare-fun e!202844 () Bool)

(assert (=> start!33212 (=> (not res!182180) (not e!202844))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33212 (= res!182180 (validMask!0 mask!3777))))

(assert (=> start!33212 e!202844))

(declare-datatypes ((array!16884 0))(
  ( (array!16885 (arr!7984 (Array (_ BitVec 32) (_ BitVec 64))) (size!8336 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16884)

(declare-fun array_inv!5934 (array!16884) Bool)

(assert (=> start!33212 (array_inv!5934 a!3305)))

(assert (=> start!33212 true))

(declare-fun b!330501 () Bool)

(declare-fun res!182179 () Bool)

(assert (=> b!330501 (=> (not res!182179) (not e!202844))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3080 0))(
  ( (MissingZero!3080 (index!14496 (_ BitVec 32))) (Found!3080 (index!14497 (_ BitVec 32))) (Intermediate!3080 (undefined!3892 Bool) (index!14498 (_ BitVec 32)) (x!32884 (_ BitVec 32))) (Undefined!3080) (MissingVacant!3080 (index!14499 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16884 (_ BitVec 32)) SeekEntryResult!3080)

(assert (=> b!330501 (= res!182179 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3080 i!1250)))))

(declare-fun b!330502 () Bool)

(assert (=> b!330502 false))

(declare-datatypes ((Unit!10270 0))(
  ( (Unit!10271) )
))
(declare-fun e!202850 () Unit!10270)

(declare-fun Unit!10272 () Unit!10270)

(assert (=> b!330502 (= e!202850 Unit!10272)))

(declare-fun b!330503 () Bool)

(declare-fun e!202851 () Bool)

(declare-fun e!202845 () Bool)

(assert (=> b!330503 (= e!202851 (not e!202845))))

(declare-fun res!182175 () Bool)

(assert (=> b!330503 (=> res!182175 e!202845)))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!330503 (= res!182175 (not (= (select (arr!7984 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330503 (= index!1840 resIndex!58)))

(declare-fun lt!158553 () Unit!10270)

(declare-fun e!202847 () Unit!10270)

(assert (=> b!330503 (= lt!158553 e!202847)))

(declare-fun c!51809 () Bool)

(assert (=> b!330503 (= c!51809 (not (= resIndex!58 index!1840)))))

(declare-fun b!330504 () Bool)

(assert (=> b!330504 (= e!202847 e!202850)))

(declare-fun c!51807 () Bool)

(assert (=> b!330504 (= c!51807 (or (= (select (arr!7984 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7984 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330505 () Bool)

(assert (=> b!330505 false))

(declare-fun lt!158555 () Unit!10270)

(declare-fun e!202849 () Unit!10270)

(assert (=> b!330505 (= lt!158555 e!202849)))

(declare-fun c!51808 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(get-info :version)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16884 (_ BitVec 32)) SeekEntryResult!3080)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330505 (= c!51808 ((_ is Intermediate!3080) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10273 () Unit!10270)

(assert (=> b!330505 (= e!202850 Unit!10273)))

(declare-fun b!330506 () Bool)

(declare-fun res!182177 () Bool)

(declare-fun e!202848 () Bool)

(assert (=> b!330506 (=> (not res!182177) (not e!202848))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330506 (= res!182177 (and (= (select (arr!7984 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8336 a!3305))))))

(declare-fun b!330507 () Bool)

(declare-fun res!182173 () Bool)

(assert (=> b!330507 (=> (not res!182173) (not e!202844))))

(declare-fun arrayContainsKey!0 (array!16884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330507 (= res!182173 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330508 () Bool)

(assert (=> b!330508 (= e!202844 e!202848)))

(declare-fun res!182181 () Bool)

(assert (=> b!330508 (=> (not res!182181) (not e!202848))))

(declare-fun lt!158554 () SeekEntryResult!3080)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330508 (= res!182181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158554))))

(assert (=> b!330508 (= lt!158554 (Intermediate!3080 false resIndex!58 resX!58))))

(declare-fun b!330509 () Bool)

(declare-fun Unit!10274 () Unit!10270)

(assert (=> b!330509 (= e!202849 Unit!10274)))

(assert (=> b!330509 false))

(declare-fun b!330510 () Bool)

(declare-fun res!182172 () Bool)

(assert (=> b!330510 (=> (not res!182172) (not e!202844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330510 (= res!182172 (validKeyInArray!0 k0!2497))))

(declare-fun lt!158556 () SeekEntryResult!3080)

(declare-fun b!330511 () Bool)

(assert (=> b!330511 (= e!202845 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 (array!16885 (store (arr!7984 a!3305) i!1250 k0!2497) (size!8336 a!3305)) mask!3777) lt!158556))))

(declare-fun b!330512 () Bool)

(declare-fun Unit!10275 () Unit!10270)

(assert (=> b!330512 (= e!202849 Unit!10275)))

(declare-fun b!330513 () Bool)

(assert (=> b!330513 (= e!202848 e!202851)))

(declare-fun res!182176 () Bool)

(assert (=> b!330513 (=> (not res!182176) (not e!202851))))

(assert (=> b!330513 (= res!182176 (and (= lt!158556 lt!158554) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7984 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(assert (=> b!330513 (= lt!158556 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!330514 () Bool)

(declare-fun Unit!10276 () Unit!10270)

(assert (=> b!330514 (= e!202847 Unit!10276)))

(declare-fun b!330515 () Bool)

(declare-fun res!182174 () Bool)

(assert (=> b!330515 (=> (not res!182174) (not e!202844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16884 (_ BitVec 32)) Bool)

(assert (=> b!330515 (= res!182174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330516 () Bool)

(declare-fun res!182178 () Bool)

(assert (=> b!330516 (=> (not res!182178) (not e!202844))))

(assert (=> b!330516 (= res!182178 (and (= (size!8336 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8336 a!3305))))))

(assert (= (and start!33212 res!182180) b!330516))

(assert (= (and b!330516 res!182178) b!330510))

(assert (= (and b!330510 res!182172) b!330507))

(assert (= (and b!330507 res!182173) b!330501))

(assert (= (and b!330501 res!182179) b!330515))

(assert (= (and b!330515 res!182174) b!330508))

(assert (= (and b!330508 res!182181) b!330506))

(assert (= (and b!330506 res!182177) b!330513))

(assert (= (and b!330513 res!182176) b!330503))

(assert (= (and b!330503 c!51809) b!330504))

(assert (= (and b!330503 (not c!51809)) b!330514))

(assert (= (and b!330504 c!51807) b!330502))

(assert (= (and b!330504 (not c!51807)) b!330505))

(assert (= (and b!330505 c!51808) b!330512))

(assert (= (and b!330505 (not c!51808)) b!330509))

(assert (= (and b!330503 (not res!182175)) b!330511))

(declare-fun m!335947 () Bool)

(assert (=> b!330506 m!335947))

(declare-fun m!335949 () Bool)

(assert (=> b!330504 m!335949))

(declare-fun m!335951 () Bool)

(assert (=> b!330511 m!335951))

(declare-fun m!335953 () Bool)

(assert (=> b!330511 m!335953))

(declare-fun m!335955 () Bool)

(assert (=> start!33212 m!335955))

(declare-fun m!335957 () Bool)

(assert (=> start!33212 m!335957))

(declare-fun m!335959 () Bool)

(assert (=> b!330507 m!335959))

(declare-fun m!335961 () Bool)

(assert (=> b!330508 m!335961))

(assert (=> b!330508 m!335961))

(declare-fun m!335963 () Bool)

(assert (=> b!330508 m!335963))

(declare-fun m!335965 () Bool)

(assert (=> b!330501 m!335965))

(declare-fun m!335967 () Bool)

(assert (=> b!330510 m!335967))

(declare-fun m!335969 () Bool)

(assert (=> b!330505 m!335969))

(assert (=> b!330505 m!335969))

(declare-fun m!335971 () Bool)

(assert (=> b!330505 m!335971))

(declare-fun m!335973 () Bool)

(assert (=> b!330515 m!335973))

(assert (=> b!330513 m!335949))

(declare-fun m!335975 () Bool)

(assert (=> b!330513 m!335975))

(assert (=> b!330503 m!335949))

(check-sat (not b!330513) (not start!33212) (not b!330507) (not b!330505) (not b!330501) (not b!330511) (not b!330515) (not b!330510) (not b!330508))
(check-sat)
(get-model)

(declare-fun b!330621 () Bool)

(declare-fun e!202907 () Bool)

(declare-fun e!202906 () Bool)

(assert (=> b!330621 (= e!202907 e!202906)))

(declare-fun lt!158587 () (_ BitVec 64))

(assert (=> b!330621 (= lt!158587 (select (arr!7984 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158589 () Unit!10270)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16884 (_ BitVec 64) (_ BitVec 32)) Unit!10270)

(assert (=> b!330621 (= lt!158589 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158587 #b00000000000000000000000000000000))))

(assert (=> b!330621 (arrayContainsKey!0 a!3305 lt!158587 #b00000000000000000000000000000000)))

(declare-fun lt!158588 () Unit!10270)

(assert (=> b!330621 (= lt!158588 lt!158589)))

(declare-fun res!182247 () Bool)

(assert (=> b!330621 (= res!182247 (= (seekEntryOrOpen!0 (select (arr!7984 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3080 #b00000000000000000000000000000000)))))

(assert (=> b!330621 (=> (not res!182247) (not e!202906))))

(declare-fun b!330622 () Bool)

(declare-fun e!202908 () Bool)

(assert (=> b!330622 (= e!202908 e!202907)))

(declare-fun c!51830 () Bool)

(assert (=> b!330622 (= c!51830 (validKeyInArray!0 (select (arr!7984 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!330623 () Bool)

(declare-fun call!26150 () Bool)

(assert (=> b!330623 (= e!202906 call!26150)))

(declare-fun b!330624 () Bool)

(assert (=> b!330624 (= e!202907 call!26150)))

(declare-fun d!70323 () Bool)

(declare-fun res!182246 () Bool)

(assert (=> d!70323 (=> res!182246 e!202908)))

(assert (=> d!70323 (= res!182246 (bvsge #b00000000000000000000000000000000 (size!8336 a!3305)))))

(assert (=> d!70323 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202908)))

(declare-fun bm!26147 () Bool)

(assert (=> bm!26147 (= call!26150 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!70323 (not res!182246)) b!330622))

(assert (= (and b!330622 c!51830) b!330621))

(assert (= (and b!330622 (not c!51830)) b!330624))

(assert (= (and b!330621 res!182247) b!330623))

(assert (= (or b!330623 b!330624) bm!26147))

(declare-fun m!336037 () Bool)

(assert (=> b!330621 m!336037))

(declare-fun m!336039 () Bool)

(assert (=> b!330621 m!336039))

(declare-fun m!336041 () Bool)

(assert (=> b!330621 m!336041))

(assert (=> b!330621 m!336037))

(declare-fun m!336043 () Bool)

(assert (=> b!330621 m!336043))

(assert (=> b!330622 m!336037))

(assert (=> b!330622 m!336037))

(declare-fun m!336045 () Bool)

(assert (=> b!330622 m!336045))

(declare-fun m!336047 () Bool)

(assert (=> bm!26147 m!336047))

(assert (=> b!330515 d!70323))

(declare-fun d!70325 () Bool)

(assert (=> d!70325 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!330510 d!70325))

(declare-fun b!330643 () Bool)

(declare-fun lt!158595 () SeekEntryResult!3080)

(assert (=> b!330643 (and (bvsge (index!14498 lt!158595) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158595) (size!8336 a!3305)))))

(declare-fun res!182254 () Bool)

(assert (=> b!330643 (= res!182254 (= (select (arr!7984 a!3305) (index!14498 lt!158595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202922 () Bool)

(assert (=> b!330643 (=> res!182254 e!202922)))

(declare-fun b!330644 () Bool)

(assert (=> b!330644 (and (bvsge (index!14498 lt!158595) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158595) (size!8336 a!3305)))))

(declare-fun res!182256 () Bool)

(assert (=> b!330644 (= res!182256 (= (select (arr!7984 a!3305) (index!14498 lt!158595)) k0!2497))))

(assert (=> b!330644 (=> res!182256 e!202922)))

(declare-fun e!202920 () Bool)

(assert (=> b!330644 (= e!202920 e!202922)))

(declare-fun b!330645 () Bool)

(declare-fun e!202921 () Bool)

(assert (=> b!330645 (= e!202921 (bvsge (x!32884 lt!158595) #b01111111111111111111111111111110))))

(declare-fun b!330646 () Bool)

(assert (=> b!330646 (= e!202921 e!202920)))

(declare-fun res!182255 () Bool)

(assert (=> b!330646 (= res!182255 (and ((_ is Intermediate!3080) lt!158595) (not (undefined!3892 lt!158595)) (bvslt (x!32884 lt!158595) #b01111111111111111111111111111110) (bvsge (x!32884 lt!158595) #b00000000000000000000000000000000) (bvsge (x!32884 lt!158595) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!330646 (=> (not res!182255) (not e!202920))))

(declare-fun d!70327 () Bool)

(assert (=> d!70327 e!202921))

(declare-fun c!51839 () Bool)

(assert (=> d!70327 (= c!51839 (and ((_ is Intermediate!3080) lt!158595) (undefined!3892 lt!158595)))))

(declare-fun e!202919 () SeekEntryResult!3080)

(assert (=> d!70327 (= lt!158595 e!202919)))

(declare-fun c!51838 () Bool)

(assert (=> d!70327 (= c!51838 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!158594 () (_ BitVec 64))

(assert (=> d!70327 (= lt!158594 (select (arr!7984 a!3305) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777)))))

(assert (=> d!70327 (validMask!0 mask!3777)))

(assert (=> d!70327 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777) lt!158595)))

(declare-fun b!330647 () Bool)

(declare-fun e!202923 () SeekEntryResult!3080)

(assert (=> b!330647 (= e!202919 e!202923)))

(declare-fun c!51837 () Bool)

(assert (=> b!330647 (= c!51837 (or (= lt!158594 k0!2497) (= (bvadd lt!158594 lt!158594) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330648 () Bool)

(assert (=> b!330648 (= e!202923 (Intermediate!3080 false (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!330649 () Bool)

(assert (=> b!330649 (and (bvsge (index!14498 lt!158595) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158595) (size!8336 a!3305)))))

(assert (=> b!330649 (= e!202922 (= (select (arr!7984 a!3305) (index!14498 lt!158595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330650 () Bool)

(assert (=> b!330650 (= e!202923 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!330651 () Bool)

(assert (=> b!330651 (= e!202919 (Intermediate!3080 true (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(assert (= (and d!70327 c!51838) b!330651))

(assert (= (and d!70327 (not c!51838)) b!330647))

(assert (= (and b!330647 c!51837) b!330648))

(assert (= (and b!330647 (not c!51837)) b!330650))

(assert (= (and d!70327 c!51839) b!330645))

(assert (= (and d!70327 (not c!51839)) b!330646))

(assert (= (and b!330646 res!182255) b!330644))

(assert (= (and b!330644 (not res!182256)) b!330643))

(assert (= (and b!330643 (not res!182254)) b!330649))

(declare-fun m!336049 () Bool)

(assert (=> b!330649 m!336049))

(assert (=> b!330643 m!336049))

(assert (=> b!330650 m!335969))

(declare-fun m!336051 () Bool)

(assert (=> b!330650 m!336051))

(assert (=> b!330650 m!336051))

(declare-fun m!336053 () Bool)

(assert (=> b!330650 m!336053))

(assert (=> d!70327 m!335969))

(declare-fun m!336055 () Bool)

(assert (=> d!70327 m!336055))

(assert (=> d!70327 m!335955))

(assert (=> b!330644 m!336049))

(assert (=> b!330505 d!70327))

(declare-fun d!70333 () Bool)

(declare-fun lt!158598 () (_ BitVec 32))

(assert (=> d!70333 (and (bvsge lt!158598 #b00000000000000000000000000000000) (bvslt lt!158598 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70333 (= lt!158598 (choose!52 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(assert (=> d!70333 (validMask!0 mask!3777)))

(assert (=> d!70333 (= (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) lt!158598)))

(declare-fun bs!11448 () Bool)

(assert (= bs!11448 d!70333))

(declare-fun m!336057 () Bool)

(assert (=> bs!11448 m!336057))

(assert (=> bs!11448 m!335955))

(assert (=> b!330505 d!70333))

(declare-fun d!70339 () Bool)

(assert (=> d!70339 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33212 d!70339))

(declare-fun d!70343 () Bool)

(assert (=> d!70343 (= (array_inv!5934 a!3305) (bvsge (size!8336 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33212 d!70343))

(declare-fun b!330688 () Bool)

(declare-fun lt!158608 () SeekEntryResult!3080)

(assert (=> b!330688 (and (bvsge (index!14498 lt!158608) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158608) (size!8336 (array!16885 (store (arr!7984 a!3305) i!1250 k0!2497) (size!8336 a!3305)))))))

(declare-fun res!182269 () Bool)

(assert (=> b!330688 (= res!182269 (= (select (arr!7984 (array!16885 (store (arr!7984 a!3305) i!1250 k0!2497) (size!8336 a!3305))) (index!14498 lt!158608)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202947 () Bool)

(assert (=> b!330688 (=> res!182269 e!202947)))

(declare-fun b!330689 () Bool)

(assert (=> b!330689 (and (bvsge (index!14498 lt!158608) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158608) (size!8336 (array!16885 (store (arr!7984 a!3305) i!1250 k0!2497) (size!8336 a!3305)))))))

(declare-fun res!182271 () Bool)

(assert (=> b!330689 (= res!182271 (= (select (arr!7984 (array!16885 (store (arr!7984 a!3305) i!1250 k0!2497) (size!8336 a!3305))) (index!14498 lt!158608)) k0!2497))))

(assert (=> b!330689 (=> res!182271 e!202947)))

(declare-fun e!202945 () Bool)

(assert (=> b!330689 (= e!202945 e!202947)))

(declare-fun b!330690 () Bool)

(declare-fun e!202946 () Bool)

(assert (=> b!330690 (= e!202946 (bvsge (x!32884 lt!158608) #b01111111111111111111111111111110))))

(declare-fun b!330691 () Bool)

(assert (=> b!330691 (= e!202946 e!202945)))

(declare-fun res!182270 () Bool)

(assert (=> b!330691 (= res!182270 (and ((_ is Intermediate!3080) lt!158608) (not (undefined!3892 lt!158608)) (bvslt (x!32884 lt!158608) #b01111111111111111111111111111110) (bvsge (x!32884 lt!158608) #b00000000000000000000000000000000) (bvsge (x!32884 lt!158608) x!1490)))))

(assert (=> b!330691 (=> (not res!182270) (not e!202945))))

(declare-fun d!70345 () Bool)

(assert (=> d!70345 e!202946))

(declare-fun c!51854 () Bool)

(assert (=> d!70345 (= c!51854 (and ((_ is Intermediate!3080) lt!158608) (undefined!3892 lt!158608)))))

(declare-fun e!202944 () SeekEntryResult!3080)

(assert (=> d!70345 (= lt!158608 e!202944)))

(declare-fun c!51853 () Bool)

(assert (=> d!70345 (= c!51853 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158607 () (_ BitVec 64))

(assert (=> d!70345 (= lt!158607 (select (arr!7984 (array!16885 (store (arr!7984 a!3305) i!1250 k0!2497) (size!8336 a!3305))) index!1840))))

(assert (=> d!70345 (validMask!0 mask!3777)))

(assert (=> d!70345 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 (array!16885 (store (arr!7984 a!3305) i!1250 k0!2497) (size!8336 a!3305)) mask!3777) lt!158608)))

(declare-fun b!330692 () Bool)

(declare-fun e!202948 () SeekEntryResult!3080)

(assert (=> b!330692 (= e!202944 e!202948)))

(declare-fun c!51852 () Bool)

(assert (=> b!330692 (= c!51852 (or (= lt!158607 k0!2497) (= (bvadd lt!158607 lt!158607) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330693 () Bool)

(assert (=> b!330693 (= e!202948 (Intermediate!3080 false index!1840 x!1490))))

(declare-fun b!330694 () Bool)

(assert (=> b!330694 (and (bvsge (index!14498 lt!158608) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158608) (size!8336 (array!16885 (store (arr!7984 a!3305) i!1250 k0!2497) (size!8336 a!3305)))))))

(assert (=> b!330694 (= e!202947 (= (select (arr!7984 (array!16885 (store (arr!7984 a!3305) i!1250 k0!2497) (size!8336 a!3305))) (index!14498 lt!158608)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330695 () Bool)

(assert (=> b!330695 (= e!202948 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 (array!16885 (store (arr!7984 a!3305) i!1250 k0!2497) (size!8336 a!3305)) mask!3777))))

(declare-fun b!330696 () Bool)

(assert (=> b!330696 (= e!202944 (Intermediate!3080 true index!1840 x!1490))))

(assert (= (and d!70345 c!51853) b!330696))

(assert (= (and d!70345 (not c!51853)) b!330692))

(assert (= (and b!330692 c!51852) b!330693))

(assert (= (and b!330692 (not c!51852)) b!330695))

(assert (= (and d!70345 c!51854) b!330690))

(assert (= (and d!70345 (not c!51854)) b!330691))

(assert (= (and b!330691 res!182270) b!330689))

(assert (= (and b!330689 (not res!182271)) b!330688))

(assert (= (and b!330688 (not res!182269)) b!330694))

(declare-fun m!336075 () Bool)

(assert (=> b!330694 m!336075))

(assert (=> b!330688 m!336075))

(declare-fun m!336077 () Bool)

(assert (=> b!330695 m!336077))

(assert (=> b!330695 m!336077))

(declare-fun m!336079 () Bool)

(assert (=> b!330695 m!336079))

(declare-fun m!336081 () Bool)

(assert (=> d!70345 m!336081))

(assert (=> d!70345 m!335955))

(assert (=> b!330689 m!336075))

(assert (=> b!330511 d!70345))

(declare-fun b!330771 () Bool)

(declare-fun e!202996 () SeekEntryResult!3080)

(declare-fun lt!158652 () SeekEntryResult!3080)

(assert (=> b!330771 (= e!202996 (MissingZero!3080 (index!14498 lt!158652)))))

(declare-fun b!330772 () Bool)

(declare-fun e!202995 () SeekEntryResult!3080)

(assert (=> b!330772 (= e!202995 (Found!3080 (index!14498 lt!158652)))))

(declare-fun b!330773 () Bool)

(declare-fun e!202997 () SeekEntryResult!3080)

(assert (=> b!330773 (= e!202997 Undefined!3080)))

(declare-fun b!330774 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16884 (_ BitVec 32)) SeekEntryResult!3080)

(assert (=> b!330774 (= e!202996 (seekKeyOrZeroReturnVacant!0 (x!32884 lt!158652) (index!14498 lt!158652) (index!14498 lt!158652) k0!2497 a!3305 mask!3777))))

(declare-fun b!330775 () Bool)

(assert (=> b!330775 (= e!202997 e!202995)))

(declare-fun lt!158653 () (_ BitVec 64))

(assert (=> b!330775 (= lt!158653 (select (arr!7984 a!3305) (index!14498 lt!158652)))))

(declare-fun c!51883 () Bool)

(assert (=> b!330775 (= c!51883 (= lt!158653 k0!2497))))

(declare-fun d!70349 () Bool)

(declare-fun lt!158654 () SeekEntryResult!3080)

(assert (=> d!70349 (and (or ((_ is Undefined!3080) lt!158654) (not ((_ is Found!3080) lt!158654)) (and (bvsge (index!14497 lt!158654) #b00000000000000000000000000000000) (bvslt (index!14497 lt!158654) (size!8336 a!3305)))) (or ((_ is Undefined!3080) lt!158654) ((_ is Found!3080) lt!158654) (not ((_ is MissingZero!3080) lt!158654)) (and (bvsge (index!14496 lt!158654) #b00000000000000000000000000000000) (bvslt (index!14496 lt!158654) (size!8336 a!3305)))) (or ((_ is Undefined!3080) lt!158654) ((_ is Found!3080) lt!158654) ((_ is MissingZero!3080) lt!158654) (not ((_ is MissingVacant!3080) lt!158654)) (and (bvsge (index!14499 lt!158654) #b00000000000000000000000000000000) (bvslt (index!14499 lt!158654) (size!8336 a!3305)))) (or ((_ is Undefined!3080) lt!158654) (ite ((_ is Found!3080) lt!158654) (= (select (arr!7984 a!3305) (index!14497 lt!158654)) k0!2497) (ite ((_ is MissingZero!3080) lt!158654) (= (select (arr!7984 a!3305) (index!14496 lt!158654)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3080) lt!158654) (= (select (arr!7984 a!3305) (index!14499 lt!158654)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70349 (= lt!158654 e!202997)))

(declare-fun c!51882 () Bool)

(assert (=> d!70349 (= c!51882 (and ((_ is Intermediate!3080) lt!158652) (undefined!3892 lt!158652)))))

(assert (=> d!70349 (= lt!158652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70349 (validMask!0 mask!3777)))

(assert (=> d!70349 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158654)))

(declare-fun b!330776 () Bool)

(declare-fun c!51881 () Bool)

(assert (=> b!330776 (= c!51881 (= lt!158653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!330776 (= e!202995 e!202996)))

(assert (= (and d!70349 c!51882) b!330773))

(assert (= (and d!70349 (not c!51882)) b!330775))

(assert (= (and b!330775 c!51883) b!330772))

(assert (= (and b!330775 (not c!51883)) b!330776))

(assert (= (and b!330776 c!51881) b!330771))

(assert (= (and b!330776 (not c!51881)) b!330774))

(declare-fun m!336123 () Bool)

(assert (=> b!330774 m!336123))

(declare-fun m!336125 () Bool)

(assert (=> b!330775 m!336125))

(assert (=> d!70349 m!335961))

(declare-fun m!336127 () Bool)

(assert (=> d!70349 m!336127))

(declare-fun m!336129 () Bool)

(assert (=> d!70349 m!336129))

(declare-fun m!336131 () Bool)

(assert (=> d!70349 m!336131))

(assert (=> d!70349 m!335955))

(assert (=> d!70349 m!335961))

(assert (=> d!70349 m!335963))

(assert (=> b!330501 d!70349))

(declare-fun d!70367 () Bool)

(declare-fun res!182307 () Bool)

(declare-fun e!203011 () Bool)

(assert (=> d!70367 (=> res!182307 e!203011)))

(assert (=> d!70367 (= res!182307 (= (select (arr!7984 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70367 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!203011)))

(declare-fun b!330791 () Bool)

(declare-fun e!203012 () Bool)

(assert (=> b!330791 (= e!203011 e!203012)))

(declare-fun res!182308 () Bool)

(assert (=> b!330791 (=> (not res!182308) (not e!203012))))

(assert (=> b!330791 (= res!182308 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8336 a!3305)))))

(declare-fun b!330792 () Bool)

(assert (=> b!330792 (= e!203012 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70367 (not res!182307)) b!330791))

(assert (= (and b!330791 res!182308) b!330792))

(assert (=> d!70367 m!336037))

(declare-fun m!336145 () Bool)

(assert (=> b!330792 m!336145))

(assert (=> b!330507 d!70367))

(declare-fun b!330793 () Bool)

(declare-fun lt!158659 () SeekEntryResult!3080)

(assert (=> b!330793 (and (bvsge (index!14498 lt!158659) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158659) (size!8336 a!3305)))))

(declare-fun res!182309 () Bool)

(assert (=> b!330793 (= res!182309 (= (select (arr!7984 a!3305) (index!14498 lt!158659)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203016 () Bool)

(assert (=> b!330793 (=> res!182309 e!203016)))

(declare-fun b!330794 () Bool)

(assert (=> b!330794 (and (bvsge (index!14498 lt!158659) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158659) (size!8336 a!3305)))))

(declare-fun res!182311 () Bool)

(assert (=> b!330794 (= res!182311 (= (select (arr!7984 a!3305) (index!14498 lt!158659)) k0!2497))))

(assert (=> b!330794 (=> res!182311 e!203016)))

(declare-fun e!203014 () Bool)

(assert (=> b!330794 (= e!203014 e!203016)))

(declare-fun b!330795 () Bool)

(declare-fun e!203015 () Bool)

(assert (=> b!330795 (= e!203015 (bvsge (x!32884 lt!158659) #b01111111111111111111111111111110))))

(declare-fun b!330796 () Bool)

(assert (=> b!330796 (= e!203015 e!203014)))

(declare-fun res!182310 () Bool)

(assert (=> b!330796 (= res!182310 (and ((_ is Intermediate!3080) lt!158659) (not (undefined!3892 lt!158659)) (bvslt (x!32884 lt!158659) #b01111111111111111111111111111110) (bvsge (x!32884 lt!158659) #b00000000000000000000000000000000) (bvsge (x!32884 lt!158659) x!1490)))))

(assert (=> b!330796 (=> (not res!182310) (not e!203014))))

(declare-fun d!70373 () Bool)

(assert (=> d!70373 e!203015))

(declare-fun c!51887 () Bool)

(assert (=> d!70373 (= c!51887 (and ((_ is Intermediate!3080) lt!158659) (undefined!3892 lt!158659)))))

(declare-fun e!203013 () SeekEntryResult!3080)

(assert (=> d!70373 (= lt!158659 e!203013)))

(declare-fun c!51886 () Bool)

(assert (=> d!70373 (= c!51886 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158658 () (_ BitVec 64))

(assert (=> d!70373 (= lt!158658 (select (arr!7984 a!3305) index!1840))))

(assert (=> d!70373 (validMask!0 mask!3777)))

(assert (=> d!70373 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158659)))

(declare-fun b!330797 () Bool)

(declare-fun e!203017 () SeekEntryResult!3080)

(assert (=> b!330797 (= e!203013 e!203017)))

(declare-fun c!51885 () Bool)

(assert (=> b!330797 (= c!51885 (or (= lt!158658 k0!2497) (= (bvadd lt!158658 lt!158658) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330798 () Bool)

(assert (=> b!330798 (= e!203017 (Intermediate!3080 false index!1840 x!1490))))

(declare-fun b!330799 () Bool)

(assert (=> b!330799 (and (bvsge (index!14498 lt!158659) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158659) (size!8336 a!3305)))))

(assert (=> b!330799 (= e!203016 (= (select (arr!7984 a!3305) (index!14498 lt!158659)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330800 () Bool)

(assert (=> b!330800 (= e!203017 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!330801 () Bool)

(assert (=> b!330801 (= e!203013 (Intermediate!3080 true index!1840 x!1490))))

(assert (= (and d!70373 c!51886) b!330801))

(assert (= (and d!70373 (not c!51886)) b!330797))

(assert (= (and b!330797 c!51885) b!330798))

(assert (= (and b!330797 (not c!51885)) b!330800))

(assert (= (and d!70373 c!51887) b!330795))

(assert (= (and d!70373 (not c!51887)) b!330796))

(assert (= (and b!330796 res!182310) b!330794))

(assert (= (and b!330794 (not res!182311)) b!330793))

(assert (= (and b!330793 (not res!182309)) b!330799))

(declare-fun m!336147 () Bool)

(assert (=> b!330799 m!336147))

(assert (=> b!330793 m!336147))

(assert (=> b!330800 m!336077))

(assert (=> b!330800 m!336077))

(declare-fun m!336149 () Bool)

(assert (=> b!330800 m!336149))

(assert (=> d!70373 m!335949))

(assert (=> d!70373 m!335955))

(assert (=> b!330794 m!336147))

(assert (=> b!330513 d!70373))

(declare-fun b!330802 () Bool)

(declare-fun lt!158661 () SeekEntryResult!3080)

(assert (=> b!330802 (and (bvsge (index!14498 lt!158661) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158661) (size!8336 a!3305)))))

(declare-fun res!182312 () Bool)

(assert (=> b!330802 (= res!182312 (= (select (arr!7984 a!3305) (index!14498 lt!158661)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203021 () Bool)

(assert (=> b!330802 (=> res!182312 e!203021)))

(declare-fun b!330803 () Bool)

(assert (=> b!330803 (and (bvsge (index!14498 lt!158661) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158661) (size!8336 a!3305)))))

(declare-fun res!182314 () Bool)

(assert (=> b!330803 (= res!182314 (= (select (arr!7984 a!3305) (index!14498 lt!158661)) k0!2497))))

(assert (=> b!330803 (=> res!182314 e!203021)))

(declare-fun e!203019 () Bool)

(assert (=> b!330803 (= e!203019 e!203021)))

(declare-fun b!330804 () Bool)

(declare-fun e!203020 () Bool)

(assert (=> b!330804 (= e!203020 (bvsge (x!32884 lt!158661) #b01111111111111111111111111111110))))

(declare-fun b!330805 () Bool)

(assert (=> b!330805 (= e!203020 e!203019)))

(declare-fun res!182313 () Bool)

(assert (=> b!330805 (= res!182313 (and ((_ is Intermediate!3080) lt!158661) (not (undefined!3892 lt!158661)) (bvslt (x!32884 lt!158661) #b01111111111111111111111111111110) (bvsge (x!32884 lt!158661) #b00000000000000000000000000000000) (bvsge (x!32884 lt!158661) #b00000000000000000000000000000000)))))

(assert (=> b!330805 (=> (not res!182313) (not e!203019))))

(declare-fun d!70375 () Bool)

(assert (=> d!70375 e!203020))

(declare-fun c!51890 () Bool)

(assert (=> d!70375 (= c!51890 (and ((_ is Intermediate!3080) lt!158661) (undefined!3892 lt!158661)))))

(declare-fun e!203018 () SeekEntryResult!3080)

(assert (=> d!70375 (= lt!158661 e!203018)))

(declare-fun c!51889 () Bool)

(assert (=> d!70375 (= c!51889 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!158660 () (_ BitVec 64))

(assert (=> d!70375 (= lt!158660 (select (arr!7984 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70375 (validMask!0 mask!3777)))

(assert (=> d!70375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158661)))

(declare-fun b!330806 () Bool)

(declare-fun e!203022 () SeekEntryResult!3080)

(assert (=> b!330806 (= e!203018 e!203022)))

(declare-fun c!51888 () Bool)

(assert (=> b!330806 (= c!51888 (or (= lt!158660 k0!2497) (= (bvadd lt!158660 lt!158660) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330807 () Bool)

(assert (=> b!330807 (= e!203022 (Intermediate!3080 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!330808 () Bool)

(assert (=> b!330808 (and (bvsge (index!14498 lt!158661) #b00000000000000000000000000000000) (bvslt (index!14498 lt!158661) (size!8336 a!3305)))))

(assert (=> b!330808 (= e!203021 (= (select (arr!7984 a!3305) (index!14498 lt!158661)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330809 () Bool)

(assert (=> b!330809 (= e!203022 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!330810 () Bool)

(assert (=> b!330810 (= e!203018 (Intermediate!3080 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!70375 c!51889) b!330810))

(assert (= (and d!70375 (not c!51889)) b!330806))

(assert (= (and b!330806 c!51888) b!330807))

(assert (= (and b!330806 (not c!51888)) b!330809))

(assert (= (and d!70375 c!51890) b!330804))

(assert (= (and d!70375 (not c!51890)) b!330805))

(assert (= (and b!330805 res!182313) b!330803))

(assert (= (and b!330803 (not res!182314)) b!330802))

(assert (= (and b!330802 (not res!182312)) b!330808))

(declare-fun m!336151 () Bool)

(assert (=> b!330808 m!336151))

(assert (=> b!330802 m!336151))

(assert (=> b!330809 m!335961))

(declare-fun m!336153 () Bool)

(assert (=> b!330809 m!336153))

(assert (=> b!330809 m!336153))

(declare-fun m!336155 () Bool)

(assert (=> b!330809 m!336155))

(assert (=> d!70375 m!335961))

(declare-fun m!336157 () Bool)

(assert (=> d!70375 m!336157))

(assert (=> d!70375 m!335955))

(assert (=> b!330803 m!336151))

(assert (=> b!330508 d!70375))

(declare-fun d!70377 () Bool)

(declare-fun lt!158667 () (_ BitVec 32))

(declare-fun lt!158666 () (_ BitVec 32))

(assert (=> d!70377 (= lt!158667 (bvmul (bvxor lt!158666 (bvlshr lt!158666 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70377 (= lt!158666 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70377 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!182315 (let ((h!5334 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32892 (bvmul (bvxor h!5334 (bvlshr h!5334 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32892 (bvlshr x!32892 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!182315 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!182315 #b00000000000000000000000000000000))))))

(assert (=> d!70377 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158667 (bvlshr lt!158667 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!330508 d!70377))

(check-sat (not b!330695) (not b!330774) (not b!330650) (not b!330792) (not d!70349) (not d!70345) (not b!330809) (not d!70327) (not bm!26147) (not b!330621) (not b!330800) (not d!70373) (not d!70375) (not d!70333) (not b!330622))
(check-sat)
