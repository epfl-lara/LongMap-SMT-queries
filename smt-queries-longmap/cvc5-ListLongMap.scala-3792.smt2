; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51986 () Bool)

(assert start!51986)

(declare-fun b!567993 () Bool)

(declare-fun res!358385 () Bool)

(declare-fun e!326826 () Bool)

(assert (=> b!567993 (=> (not res!358385) (not e!326826))))

(declare-datatypes ((array!35623 0))(
  ( (array!35624 (arr!17106 (Array (_ BitVec 32) (_ BitVec 64))) (size!17470 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35623)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35623 (_ BitVec 32)) Bool)

(assert (=> b!567993 (= res!358385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!326825 () Bool)

(declare-fun b!567994 () Bool)

(declare-datatypes ((SeekEntryResult!5555 0))(
  ( (MissingZero!5555 (index!24447 (_ BitVec 32))) (Found!5555 (index!24448 (_ BitVec 32))) (Intermediate!5555 (undefined!6367 Bool) (index!24449 (_ BitVec 32)) (x!53322 (_ BitVec 32))) (Undefined!5555) (MissingVacant!5555 (index!24450 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35623 (_ BitVec 32)) SeekEntryResult!5555)

(assert (=> b!567994 (= e!326825 (= (seekEntryOrOpen!0 (select (arr!17106 a!3118) j!142) a!3118 mask!3119) (Found!5555 j!142)))))

(declare-fun b!567995 () Bool)

(declare-fun res!358378 () Bool)

(declare-fun e!326824 () Bool)

(assert (=> b!567995 (=> (not res!358378) (not e!326824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567995 (= res!358378 (validKeyInArray!0 (select (arr!17106 a!3118) j!142)))))

(declare-fun b!567996 () Bool)

(declare-fun e!326822 () Bool)

(assert (=> b!567996 (= e!326826 e!326822)))

(declare-fun res!358377 () Bool)

(assert (=> b!567996 (=> (not res!358377) (not e!326822))))

(declare-fun lt!258763 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!258766 () SeekEntryResult!5555)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35623 (_ BitVec 32)) SeekEntryResult!5555)

(assert (=> b!567996 (= res!358377 (= lt!258766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258763 (select (store (arr!17106 a!3118) i!1132 k!1914) j!142) (array!35624 (store (arr!17106 a!3118) i!1132 k!1914) (size!17470 a!3118)) mask!3119)))))

(declare-fun lt!258762 () (_ BitVec 32))

(assert (=> b!567996 (= lt!258766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258762 (select (arr!17106 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567996 (= lt!258763 (toIndex!0 (select (store (arr!17106 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!567996 (= lt!258762 (toIndex!0 (select (arr!17106 a!3118) j!142) mask!3119))))

(declare-fun b!567997 () Bool)

(assert (=> b!567997 (= e!326822 (not (or (not (is-Intermediate!5555 lt!258766)) (undefined!6367 lt!258766) (= (select (arr!17106 a!3118) (index!24449 lt!258766)) (select (arr!17106 a!3118) j!142)) (and (bvsge (index!24449 lt!258766) #b00000000000000000000000000000000) (bvslt (index!24449 lt!258766) (size!17470 a!3118))))))))

(assert (=> b!567997 e!326825))

(declare-fun res!358379 () Bool)

(assert (=> b!567997 (=> (not res!358379) (not e!326825))))

(assert (=> b!567997 (= res!358379 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17812 0))(
  ( (Unit!17813) )
))
(declare-fun lt!258765 () Unit!17812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17812)

(assert (=> b!567997 (= lt!258765 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567998 () Bool)

(assert (=> b!567998 (= e!326824 e!326826)))

(declare-fun res!358376 () Bool)

(assert (=> b!567998 (=> (not res!358376) (not e!326826))))

(declare-fun lt!258764 () SeekEntryResult!5555)

(assert (=> b!567998 (= res!358376 (or (= lt!258764 (MissingZero!5555 i!1132)) (= lt!258764 (MissingVacant!5555 i!1132))))))

(assert (=> b!567998 (= lt!258764 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567999 () Bool)

(declare-fun res!358381 () Bool)

(assert (=> b!567999 (=> (not res!358381) (not e!326824))))

(assert (=> b!567999 (= res!358381 (validKeyInArray!0 k!1914))))

(declare-fun res!358383 () Bool)

(assert (=> start!51986 (=> (not res!358383) (not e!326824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51986 (= res!358383 (validMask!0 mask!3119))))

(assert (=> start!51986 e!326824))

(assert (=> start!51986 true))

(declare-fun array_inv!12902 (array!35623) Bool)

(assert (=> start!51986 (array_inv!12902 a!3118)))

(declare-fun b!567992 () Bool)

(declare-fun res!358382 () Bool)

(assert (=> b!567992 (=> (not res!358382) (not e!326826))))

(declare-datatypes ((List!11186 0))(
  ( (Nil!11183) (Cons!11182 (h!12197 (_ BitVec 64)) (t!17414 List!11186)) )
))
(declare-fun arrayNoDuplicates!0 (array!35623 (_ BitVec 32) List!11186) Bool)

(assert (=> b!567992 (= res!358382 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11183))))

(declare-fun b!568000 () Bool)

(declare-fun res!358380 () Bool)

(assert (=> b!568000 (=> (not res!358380) (not e!326824))))

(assert (=> b!568000 (= res!358380 (and (= (size!17470 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17470 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17470 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568001 () Bool)

(declare-fun res!358384 () Bool)

(assert (=> b!568001 (=> (not res!358384) (not e!326824))))

(declare-fun arrayContainsKey!0 (array!35623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568001 (= res!358384 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51986 res!358383) b!568000))

(assert (= (and b!568000 res!358380) b!567995))

(assert (= (and b!567995 res!358378) b!567999))

(assert (= (and b!567999 res!358381) b!568001))

(assert (= (and b!568001 res!358384) b!567998))

(assert (= (and b!567998 res!358376) b!567993))

(assert (= (and b!567993 res!358385) b!567992))

(assert (= (and b!567992 res!358382) b!567996))

(assert (= (and b!567996 res!358377) b!567997))

(assert (= (and b!567997 res!358379) b!567994))

(declare-fun m!546573 () Bool)

(assert (=> b!567995 m!546573))

(assert (=> b!567995 m!546573))

(declare-fun m!546575 () Bool)

(assert (=> b!567995 m!546575))

(declare-fun m!546577 () Bool)

(assert (=> b!567997 m!546577))

(assert (=> b!567997 m!546573))

(declare-fun m!546579 () Bool)

(assert (=> b!567997 m!546579))

(declare-fun m!546581 () Bool)

(assert (=> b!567997 m!546581))

(assert (=> b!567994 m!546573))

(assert (=> b!567994 m!546573))

(declare-fun m!546583 () Bool)

(assert (=> b!567994 m!546583))

(declare-fun m!546585 () Bool)

(assert (=> b!567993 m!546585))

(declare-fun m!546587 () Bool)

(assert (=> b!567998 m!546587))

(declare-fun m!546589 () Bool)

(assert (=> b!568001 m!546589))

(declare-fun m!546591 () Bool)

(assert (=> b!567992 m!546591))

(declare-fun m!546593 () Bool)

(assert (=> start!51986 m!546593))

(declare-fun m!546595 () Bool)

(assert (=> start!51986 m!546595))

(assert (=> b!567996 m!546573))

(declare-fun m!546597 () Bool)

(assert (=> b!567996 m!546597))

(assert (=> b!567996 m!546573))

(declare-fun m!546599 () Bool)

(assert (=> b!567996 m!546599))

(declare-fun m!546601 () Bool)

(assert (=> b!567996 m!546601))

(assert (=> b!567996 m!546599))

(declare-fun m!546603 () Bool)

(assert (=> b!567996 m!546603))

(assert (=> b!567996 m!546573))

(declare-fun m!546605 () Bool)

(assert (=> b!567996 m!546605))

(assert (=> b!567996 m!546599))

(declare-fun m!546607 () Bool)

(assert (=> b!567996 m!546607))

(declare-fun m!546609 () Bool)

(assert (=> b!567999 m!546609))

(push 1)

(assert (not b!567995))

(assert (not b!567997))

(assert (not b!567996))

(assert (not b!567992))

(assert (not b!567999))

(assert (not b!568001))

(assert (not b!567993))

(assert (not b!567998))

(assert (not b!567994))

(assert (not start!51986))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!568121 () Bool)

(declare-fun c!65185 () Bool)

(declare-fun lt!258826 () (_ BitVec 64))

(assert (=> b!568121 (= c!65185 (= lt!258826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326893 () SeekEntryResult!5555)

(declare-fun e!326892 () SeekEntryResult!5555)

(assert (=> b!568121 (= e!326893 e!326892)))

(declare-fun b!568122 () Bool)

(declare-fun lt!258825 () SeekEntryResult!5555)

(assert (=> b!568122 (= e!326893 (Found!5555 (index!24449 lt!258825)))))

(declare-fun b!568123 () Bool)

(declare-fun e!326894 () SeekEntryResult!5555)

(assert (=> b!568123 (= e!326894 e!326893)))

(assert (=> b!568123 (= lt!258826 (select (arr!17106 a!3118) (index!24449 lt!258825)))))

(declare-fun c!65183 () Bool)

(assert (=> b!568123 (= c!65183 (= lt!258826 k!1914))))

(declare-fun b!568120 () Bool)

(assert (=> b!568120 (= e!326892 (MissingZero!5555 (index!24449 lt!258825)))))

(declare-fun d!84391 () Bool)

(declare-fun lt!258824 () SeekEntryResult!5555)

(assert (=> d!84391 (and (or (is-Undefined!5555 lt!258824) (not (is-Found!5555 lt!258824)) (and (bvsge (index!24448 lt!258824) #b00000000000000000000000000000000) (bvslt (index!24448 lt!258824) (size!17470 a!3118)))) (or (is-Undefined!5555 lt!258824) (is-Found!5555 lt!258824) (not (is-MissingZero!5555 lt!258824)) (and (bvsge (index!24447 lt!258824) #b00000000000000000000000000000000) (bvslt (index!24447 lt!258824) (size!17470 a!3118)))) (or (is-Undefined!5555 lt!258824) (is-Found!5555 lt!258824) (is-MissingZero!5555 lt!258824) (not (is-MissingVacant!5555 lt!258824)) (and (bvsge (index!24450 lt!258824) #b00000000000000000000000000000000) (bvslt (index!24450 lt!258824) (size!17470 a!3118)))) (or (is-Undefined!5555 lt!258824) (ite (is-Found!5555 lt!258824) (= (select (arr!17106 a!3118) (index!24448 lt!258824)) k!1914) (ite (is-MissingZero!5555 lt!258824) (= (select (arr!17106 a!3118) (index!24447 lt!258824)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5555 lt!258824) (= (select (arr!17106 a!3118) (index!24450 lt!258824)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84391 (= lt!258824 e!326894)))

(declare-fun c!65184 () Bool)

(assert (=> d!84391 (= c!65184 (and (is-Intermediate!5555 lt!258825) (undefined!6367 lt!258825)))))

(assert (=> d!84391 (= lt!258825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84391 (validMask!0 mask!3119)))

(assert (=> d!84391 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!258824)))

(declare-fun b!568124 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35623 (_ BitVec 32)) SeekEntryResult!5555)

(assert (=> b!568124 (= e!326892 (seekKeyOrZeroReturnVacant!0 (x!53322 lt!258825) (index!24449 lt!258825) (index!24449 lt!258825) k!1914 a!3118 mask!3119))))

(declare-fun b!568125 () Bool)

(assert (=> b!568125 (= e!326894 Undefined!5555)))

(assert (= (and d!84391 c!65184) b!568125))

(assert (= (and d!84391 (not c!65184)) b!568123))

(assert (= (and b!568123 c!65183) b!568122))

(assert (= (and b!568123 (not c!65183)) b!568121))

(assert (= (and b!568121 c!65185) b!568120))

(assert (= (and b!568121 (not c!65185)) b!568124))

(declare-fun m!546725 () Bool)

(assert (=> b!568123 m!546725))

(declare-fun m!546727 () Bool)

(assert (=> d!84391 m!546727))

(declare-fun m!546729 () Bool)

(assert (=> d!84391 m!546729))

(declare-fun m!546731 () Bool)

(assert (=> d!84391 m!546731))

(declare-fun m!546733 () Bool)

(assert (=> d!84391 m!546733))

(declare-fun m!546735 () Bool)

(assert (=> d!84391 m!546735))

(assert (=> d!84391 m!546727))

(assert (=> d!84391 m!546593))

(declare-fun m!546737 () Bool)

(assert (=> b!568124 m!546737))

(assert (=> b!567998 d!84391))

(declare-fun b!568176 () Bool)

(declare-fun e!326930 () Bool)

(declare-fun e!326931 () Bool)

(assert (=> b!568176 (= e!326930 e!326931)))

(declare-fun lt!258842 () (_ BitVec 64))

(assert (=> b!568176 (= lt!258842 (select (arr!17106 a!3118) j!142))))

(declare-fun lt!258843 () Unit!17812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35623 (_ BitVec 64) (_ BitVec 32)) Unit!17812)

(assert (=> b!568176 (= lt!258843 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258842 j!142))))

(assert (=> b!568176 (arrayContainsKey!0 a!3118 lt!258842 #b00000000000000000000000000000000)))

(declare-fun lt!258844 () Unit!17812)

(assert (=> b!568176 (= lt!258844 lt!258843)))

(declare-fun res!358482 () Bool)

(assert (=> b!568176 (= res!358482 (= (seekEntryOrOpen!0 (select (arr!17106 a!3118) j!142) a!3118 mask!3119) (Found!5555 j!142)))))

(assert (=> b!568176 (=> (not res!358482) (not e!326931))))

(declare-fun d!84403 () Bool)

(declare-fun res!358483 () Bool)

(declare-fun e!326929 () Bool)

(assert (=> d!84403 (=> res!358483 e!326929)))

(assert (=> d!84403 (= res!358483 (bvsge j!142 (size!17470 a!3118)))))

(assert (=> d!84403 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326929)))

(declare-fun b!568177 () Bool)

(assert (=> b!568177 (= e!326929 e!326930)))

(declare-fun c!65199 () Bool)

(assert (=> b!568177 (= c!65199 (validKeyInArray!0 (select (arr!17106 a!3118) j!142)))))

(declare-fun b!568178 () Bool)

(declare-fun call!32550 () Bool)

(assert (=> b!568178 (= e!326931 call!32550)))

(declare-fun b!568179 () Bool)

(assert (=> b!568179 (= e!326930 call!32550)))

(declare-fun bm!32547 () Bool)

(assert (=> bm!32547 (= call!32550 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84403 (not res!358483)) b!568177))

(assert (= (and b!568177 c!65199) b!568176))

(assert (= (and b!568177 (not c!65199)) b!568179))

(assert (= (and b!568176 res!358482) b!568178))

(assert (= (or b!568178 b!568179) bm!32547))

(assert (=> b!568176 m!546573))

(declare-fun m!546759 () Bool)

(assert (=> b!568176 m!546759))

(declare-fun m!546761 () Bool)

(assert (=> b!568176 m!546761))

(assert (=> b!568176 m!546573))

(assert (=> b!568176 m!546583))

(assert (=> b!568177 m!546573))

(assert (=> b!568177 m!546573))

(assert (=> b!568177 m!546575))

(declare-fun m!546763 () Bool)

(assert (=> bm!32547 m!546763))

(assert (=> b!567997 d!84403))

(declare-fun d!84415 () Bool)

(assert (=> d!84415 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258852 () Unit!17812)

(declare-fun choose!38 (array!35623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17812)

(assert (=> d!84415 (= lt!258852 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84415 (validMask!0 mask!3119)))

(assert (=> d!84415 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258852)))

(declare-fun bs!17630 () Bool)

(assert (= bs!17630 d!84415))

(assert (=> bs!17630 m!546579))

(declare-fun m!546775 () Bool)

(assert (=> bs!17630 m!546775))

(assert (=> bs!17630 m!546593))

(assert (=> b!567997 d!84415))

(declare-fun b!568205 () Bool)

(declare-fun e!326953 () Bool)

(declare-fun call!32553 () Bool)

(assert (=> b!568205 (= e!326953 call!32553)))

(declare-fun bm!32550 () Bool)

(declare-fun c!65205 () Bool)

(assert (=> bm!32550 (= call!32553 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65205 (Cons!11182 (select (arr!17106 a!3118) #b00000000000000000000000000000000) Nil!11183) Nil!11183)))))

(declare-fun b!568206 () Bool)

(declare-fun e!326952 () Bool)

(declare-fun e!326951 () Bool)

(assert (=> b!568206 (= e!326952 e!326951)))

(declare-fun res!358502 () Bool)

(assert (=> b!568206 (=> (not res!358502) (not e!326951))))

(declare-fun e!326954 () Bool)

(assert (=> b!568206 (= res!358502 (not e!326954))))

(declare-fun res!358501 () Bool)

(assert (=> b!568206 (=> (not res!358501) (not e!326954))))

(assert (=> b!568206 (= res!358501 (validKeyInArray!0 (select (arr!17106 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568207 () Bool)

(assert (=> b!568207 (= e!326951 e!326953)))

(assert (=> b!568207 (= c!65205 (validKeyInArray!0 (select (arr!17106 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568208 () Bool)

(declare-fun contains!2874 (List!11186 (_ BitVec 64)) Bool)

(assert (=> b!568208 (= e!326954 (contains!2874 Nil!11183 (select (arr!17106 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84421 () Bool)

(declare-fun res!358500 () Bool)

(assert (=> d!84421 (=> res!358500 e!326952)))

(assert (=> d!84421 (= res!358500 (bvsge #b00000000000000000000000000000000 (size!17470 a!3118)))))

(assert (=> d!84421 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11183) e!326952)))

(declare-fun b!568209 () Bool)

(assert (=> b!568209 (= e!326953 call!32553)))

(assert (= (and d!84421 (not res!358500)) b!568206))

(assert (= (and b!568206 res!358501) b!568208))

(assert (= (and b!568206 res!358502) b!568207))

(assert (= (and b!568207 c!65205) b!568209))

(assert (= (and b!568207 (not c!65205)) b!568205))

(assert (= (or b!568209 b!568205) bm!32550))

(declare-fun m!546781 () Bool)

(assert (=> bm!32550 m!546781))

(declare-fun m!546783 () Bool)

(assert (=> bm!32550 m!546783))

(assert (=> b!568206 m!546781))

(assert (=> b!568206 m!546781))

(declare-fun m!546785 () Bool)

(assert (=> b!568206 m!546785))

(assert (=> b!568207 m!546781))

(assert (=> b!568207 m!546781))

(assert (=> b!568207 m!546785))

(assert (=> b!568208 m!546781))

(assert (=> b!568208 m!546781))

(declare-fun m!546787 () Bool)

(assert (=> b!568208 m!546787))

(assert (=> b!567992 d!84421))

(declare-fun d!84429 () Bool)

(assert (=> d!84429 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567999 d!84429))

(declare-fun b!568211 () Bool)

(declare-fun c!65208 () Bool)

(declare-fun lt!258863 () (_ BitVec 64))

(assert (=> b!568211 (= c!65208 (= lt!258863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326956 () SeekEntryResult!5555)

(declare-fun e!326955 () SeekEntryResult!5555)

(assert (=> b!568211 (= e!326956 e!326955)))

(declare-fun b!568212 () Bool)

(declare-fun lt!258862 () SeekEntryResult!5555)

(assert (=> b!568212 (= e!326956 (Found!5555 (index!24449 lt!258862)))))

(declare-fun b!568213 () Bool)

(declare-fun e!326957 () SeekEntryResult!5555)

(assert (=> b!568213 (= e!326957 e!326956)))

(assert (=> b!568213 (= lt!258863 (select (arr!17106 a!3118) (index!24449 lt!258862)))))

(declare-fun c!65206 () Bool)

(assert (=> b!568213 (= c!65206 (= lt!258863 (select (arr!17106 a!3118) j!142)))))

(declare-fun b!568210 () Bool)

(assert (=> b!568210 (= e!326955 (MissingZero!5555 (index!24449 lt!258862)))))

(declare-fun d!84431 () Bool)

(declare-fun lt!258861 () SeekEntryResult!5555)

(assert (=> d!84431 (and (or (is-Undefined!5555 lt!258861) (not (is-Found!5555 lt!258861)) (and (bvsge (index!24448 lt!258861) #b00000000000000000000000000000000) (bvslt (index!24448 lt!258861) (size!17470 a!3118)))) (or (is-Undefined!5555 lt!258861) (is-Found!5555 lt!258861) (not (is-MissingZero!5555 lt!258861)) (and (bvsge (index!24447 lt!258861) #b00000000000000000000000000000000) (bvslt (index!24447 lt!258861) (size!17470 a!3118)))) (or (is-Undefined!5555 lt!258861) (is-Found!5555 lt!258861) (is-MissingZero!5555 lt!258861) (not (is-MissingVacant!5555 lt!258861)) (and (bvsge (index!24450 lt!258861) #b00000000000000000000000000000000) (bvslt (index!24450 lt!258861) (size!17470 a!3118)))) (or (is-Undefined!5555 lt!258861) (ite (is-Found!5555 lt!258861) (= (select (arr!17106 a!3118) (index!24448 lt!258861)) (select (arr!17106 a!3118) j!142)) (ite (is-MissingZero!5555 lt!258861) (= (select (arr!17106 a!3118) (index!24447 lt!258861)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5555 lt!258861) (= (select (arr!17106 a!3118) (index!24450 lt!258861)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84431 (= lt!258861 e!326957)))

(declare-fun c!65207 () Bool)

(assert (=> d!84431 (= c!65207 (and (is-Intermediate!5555 lt!258862) (undefined!6367 lt!258862)))))

(assert (=> d!84431 (= lt!258862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17106 a!3118) j!142) mask!3119) (select (arr!17106 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84431 (validMask!0 mask!3119)))

(assert (=> d!84431 (= (seekEntryOrOpen!0 (select (arr!17106 a!3118) j!142) a!3118 mask!3119) lt!258861)))

(declare-fun b!568214 () Bool)

(assert (=> b!568214 (= e!326955 (seekKeyOrZeroReturnVacant!0 (x!53322 lt!258862) (index!24449 lt!258862) (index!24449 lt!258862) (select (arr!17106 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568215 () Bool)

(assert (=> b!568215 (= e!326957 Undefined!5555)))

(assert (= (and d!84431 c!65207) b!568215))

(assert (= (and d!84431 (not c!65207)) b!568213))

(assert (= (and b!568213 c!65206) b!568212))

(assert (= (and b!568213 (not c!65206)) b!568211))

(assert (= (and b!568211 c!65208) b!568210))

(assert (= (and b!568211 (not c!65208)) b!568214))

(declare-fun m!546789 () Bool)

(assert (=> b!568213 m!546789))

(assert (=> d!84431 m!546597))

(assert (=> d!84431 m!546573))

(declare-fun m!546791 () Bool)

(assert (=> d!84431 m!546791))

(declare-fun m!546793 () Bool)

(assert (=> d!84431 m!546793))

(declare-fun m!546795 () Bool)

(assert (=> d!84431 m!546795))

(declare-fun m!546797 () Bool)

(assert (=> d!84431 m!546797))

(assert (=> d!84431 m!546573))

(assert (=> d!84431 m!546597))

(assert (=> d!84431 m!546593))

(assert (=> b!568214 m!546573))

(declare-fun m!546799 () Bool)

(assert (=> b!568214 m!546799))

(assert (=> b!567994 d!84431))

(declare-fun b!568216 () Bool)

(declare-fun e!326959 () Bool)

(declare-fun e!326960 () Bool)

(assert (=> b!568216 (= e!326959 e!326960)))

(declare-fun lt!258864 () (_ BitVec 64))

(assert (=> b!568216 (= lt!258864 (select (arr!17106 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258865 () Unit!17812)

(assert (=> b!568216 (= lt!258865 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258864 #b00000000000000000000000000000000))))

(assert (=> b!568216 (arrayContainsKey!0 a!3118 lt!258864 #b00000000000000000000000000000000)))

(declare-fun lt!258866 () Unit!17812)

(assert (=> b!568216 (= lt!258866 lt!258865)))

(declare-fun res!358503 () Bool)

(assert (=> b!568216 (= res!358503 (= (seekEntryOrOpen!0 (select (arr!17106 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5555 #b00000000000000000000000000000000)))))

(assert (=> b!568216 (=> (not res!358503) (not e!326960))))

(declare-fun d!84433 () Bool)

(declare-fun res!358504 () Bool)

(declare-fun e!326958 () Bool)

(assert (=> d!84433 (=> res!358504 e!326958)))

(assert (=> d!84433 (= res!358504 (bvsge #b00000000000000000000000000000000 (size!17470 a!3118)))))

(assert (=> d!84433 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326958)))

(declare-fun b!568217 () Bool)

(assert (=> b!568217 (= e!326958 e!326959)))

(declare-fun c!65209 () Bool)

(assert (=> b!568217 (= c!65209 (validKeyInArray!0 (select (arr!17106 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568218 () Bool)

(declare-fun call!32554 () Bool)

(assert (=> b!568218 (= e!326960 call!32554)))

(declare-fun b!568219 () Bool)

(assert (=> b!568219 (= e!326959 call!32554)))

(declare-fun bm!32551 () Bool)

(assert (=> bm!32551 (= call!32554 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84433 (not res!358504)) b!568217))

(assert (= (and b!568217 c!65209) b!568216))

(assert (= (and b!568217 (not c!65209)) b!568219))

(assert (= (and b!568216 res!358503) b!568218))

(assert (= (or b!568218 b!568219) bm!32551))

(assert (=> b!568216 m!546781))

(declare-fun m!546801 () Bool)

(assert (=> b!568216 m!546801))

(declare-fun m!546803 () Bool)

(assert (=> b!568216 m!546803))

(assert (=> b!568216 m!546781))

(declare-fun m!546805 () Bool)

(assert (=> b!568216 m!546805))

(assert (=> b!568217 m!546781))

(assert (=> b!568217 m!546781))

(assert (=> b!568217 m!546785))

(declare-fun m!546807 () Bool)

(assert (=> bm!32551 m!546807))

(assert (=> b!567993 d!84433))

(declare-fun d!84435 () Bool)

(assert (=> d!84435 (= (validKeyInArray!0 (select (arr!17106 a!3118) j!142)) (and (not (= (select (arr!17106 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17106 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567995 d!84435))

(declare-fun d!84437 () Bool)

(assert (=> d!84437 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51986 d!84437))

(declare-fun d!84443 () Bool)

(assert (=> d!84443 (= (array_inv!12902 a!3118) (bvsge (size!17470 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51986 d!84443))

(declare-fun d!84445 () Bool)

(declare-fun res!358522 () Bool)

(declare-fun e!326991 () Bool)

(assert (=> d!84445 (=> res!358522 e!326991)))

(assert (=> d!84445 (= res!358522 (= (select (arr!17106 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84445 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!326991)))

(declare-fun b!568272 () Bool)

(declare-fun e!326992 () Bool)

(assert (=> b!568272 (= e!326991 e!326992)))

(declare-fun res!358523 () Bool)

(assert (=> b!568272 (=> (not res!358523) (not e!326992))))

(assert (=> b!568272 (= res!358523 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17470 a!3118)))))

(declare-fun b!568273 () Bool)

(assert (=> b!568273 (= e!326992 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84445 (not res!358522)) b!568272))

(assert (= (and b!568272 res!358523) b!568273))

(assert (=> d!84445 m!546781))

(declare-fun m!546825 () Bool)

(assert (=> b!568273 m!546825))

(assert (=> b!568001 d!84445))

(declare-fun lt!258912 () SeekEntryResult!5555)

(declare-fun b!568314 () Bool)

(assert (=> b!568314 (and (bvsge (index!24449 lt!258912) #b00000000000000000000000000000000) (bvslt (index!24449 lt!258912) (size!17470 (array!35624 (store (arr!17106 a!3118) i!1132 k!1914) (size!17470 a!3118)))))))

(declare-fun res!358540 () Bool)

(assert (=> b!568314 (= res!358540 (= (select (arr!17106 (array!35624 (store (arr!17106 a!3118) i!1132 k!1914) (size!17470 a!3118))) (index!24449 lt!258912)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327018 () Bool)

(assert (=> b!568314 (=> res!358540 e!327018)))

(declare-fun b!568315 () Bool)

(declare-fun e!327020 () SeekEntryResult!5555)

(assert (=> b!568315 (= e!327020 (Intermediate!5555 false lt!258763 #b00000000000000000000000000000000))))

(declare-fun b!568316 () Bool)

(assert (=> b!568316 (and (bvsge (index!24449 lt!258912) #b00000000000000000000000000000000) (bvslt (index!24449 lt!258912) (size!17470 (array!35624 (store (arr!17106 a!3118) i!1132 k!1914) (size!17470 a!3118)))))))

(assert (=> b!568316 (= e!327018 (= (select (arr!17106 (array!35624 (store (arr!17106 a!3118) i!1132 k!1914) (size!17470 a!3118))) (index!24449 lt!258912)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568317 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568317 (= e!327020 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258763 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17106 a!3118) i!1132 k!1914) j!142) (array!35624 (store (arr!17106 a!3118) i!1132 k!1914) (size!17470 a!3118)) mask!3119))))

(declare-fun d!84447 () Bool)

(declare-fun e!327021 () Bool)

(assert (=> d!84447 e!327021))

(declare-fun c!65243 () Bool)

(assert (=> d!84447 (= c!65243 (and (is-Intermediate!5555 lt!258912) (undefined!6367 lt!258912)))))

(declare-fun e!327022 () SeekEntryResult!5555)

(assert (=> d!84447 (= lt!258912 e!327022)))

(declare-fun c!65241 () Bool)

(assert (=> d!84447 (= c!65241 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258911 () (_ BitVec 64))

(assert (=> d!84447 (= lt!258911 (select (arr!17106 (array!35624 (store (arr!17106 a!3118) i!1132 k!1914) (size!17470 a!3118))) lt!258763))))

(assert (=> d!84447 (validMask!0 mask!3119)))

(assert (=> d!84447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258763 (select (store (arr!17106 a!3118) i!1132 k!1914) j!142) (array!35624 (store (arr!17106 a!3118) i!1132 k!1914) (size!17470 a!3118)) mask!3119) lt!258912)))

(declare-fun b!568318 () Bool)

(assert (=> b!568318 (= e!327021 (bvsge (x!53322 lt!258912) #b01111111111111111111111111111110))))

(declare-fun b!568319 () Bool)

(assert (=> b!568319 (and (bvsge (index!24449 lt!258912) #b00000000000000000000000000000000) (bvslt (index!24449 lt!258912) (size!17470 (array!35624 (store (arr!17106 a!3118) i!1132 k!1914) (size!17470 a!3118)))))))

(declare-fun res!358538 () Bool)

(assert (=> b!568319 (= res!358538 (= (select (arr!17106 (array!35624 (store (arr!17106 a!3118) i!1132 k!1914) (size!17470 a!3118))) (index!24449 lt!258912)) (select (store (arr!17106 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!568319 (=> res!358538 e!327018)))

(declare-fun e!327019 () Bool)

(assert (=> b!568319 (= e!327019 e!327018)))

(declare-fun b!568320 () Bool)

(assert (=> b!568320 (= e!327022 (Intermediate!5555 true lt!258763 #b00000000000000000000000000000000))))

(declare-fun b!568321 () Bool)

(assert (=> b!568321 (= e!327022 e!327020)))

(declare-fun c!65242 () Bool)

(assert (=> b!568321 (= c!65242 (or (= lt!258911 (select (store (arr!17106 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!258911 lt!258911) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568322 () Bool)

(assert (=> b!568322 (= e!327021 e!327019)))

(declare-fun res!358539 () Bool)

(assert (=> b!568322 (= res!358539 (and (is-Intermediate!5555 lt!258912) (not (undefined!6367 lt!258912)) (bvslt (x!53322 lt!258912) #b01111111111111111111111111111110) (bvsge (x!53322 lt!258912) #b00000000000000000000000000000000) (bvsge (x!53322 lt!258912) #b00000000000000000000000000000000)))))

(assert (=> b!568322 (=> (not res!358539) (not e!327019))))

(assert (= (and d!84447 c!65241) b!568320))

(assert (= (and d!84447 (not c!65241)) b!568321))

(assert (= (and b!568321 c!65242) b!568315))

(assert (= (and b!568321 (not c!65242)) b!568317))

(assert (= (and d!84447 c!65243) b!568318))

(assert (= (and d!84447 (not c!65243)) b!568322))

(assert (= (and b!568322 res!358539) b!568319))

(assert (= (and b!568319 (not res!358538)) b!568314))

(assert (= (and b!568314 (not res!358540)) b!568316))

(declare-fun m!546859 () Bool)

(assert (=> b!568317 m!546859))

(assert (=> b!568317 m!546859))

(assert (=> b!568317 m!546599))

(declare-fun m!546861 () Bool)

(assert (=> b!568317 m!546861))

(declare-fun m!546863 () Bool)

(assert (=> d!84447 m!546863))

(assert (=> d!84447 m!546593))

(declare-fun m!546865 () Bool)

(assert (=> b!568316 m!546865))

(assert (=> b!568319 m!546865))

(assert (=> b!568314 m!546865))

(assert (=> b!567996 d!84447))

(declare-fun b!568323 () Bool)

(declare-fun lt!258914 () SeekEntryResult!5555)

(assert (=> b!568323 (and (bvsge (index!24449 lt!258914) #b00000000000000000000000000000000) (bvslt (index!24449 lt!258914) (size!17470 a!3118)))))

(declare-fun res!358543 () Bool)

(assert (=> b!568323 (= res!358543 (= (select (arr!17106 a!3118) (index!24449 lt!258914)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327023 () Bool)

(assert (=> b!568323 (=> res!358543 e!327023)))

(declare-fun b!568324 () Bool)

(declare-fun e!327025 () SeekEntryResult!5555)

(assert (=> b!568324 (= e!327025 (Intermediate!5555 false lt!258762 #b00000000000000000000000000000000))))

(declare-fun b!568325 () Bool)

(assert (=> b!568325 (and (bvsge (index!24449 lt!258914) #b00000000000000000000000000000000) (bvslt (index!24449 lt!258914) (size!17470 a!3118)))))

(assert (=> b!568325 (= e!327023 (= (select (arr!17106 a!3118) (index!24449 lt!258914)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568326 () Bool)

(assert (=> b!568326 (= e!327025 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258762 #b00000000000000000000000000000000 mask!3119) (select (arr!17106 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84463 () Bool)

(declare-fun e!327026 () Bool)

(assert (=> d!84463 e!327026))

(declare-fun c!65246 () Bool)

(assert (=> d!84463 (= c!65246 (and (is-Intermediate!5555 lt!258914) (undefined!6367 lt!258914)))))

(declare-fun e!327027 () SeekEntryResult!5555)

(assert (=> d!84463 (= lt!258914 e!327027)))

(declare-fun c!65244 () Bool)

(assert (=> d!84463 (= c!65244 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258913 () (_ BitVec 64))

(assert (=> d!84463 (= lt!258913 (select (arr!17106 a!3118) lt!258762))))

(assert (=> d!84463 (validMask!0 mask!3119)))

(assert (=> d!84463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258762 (select (arr!17106 a!3118) j!142) a!3118 mask!3119) lt!258914)))

(declare-fun b!568327 () Bool)

(assert (=> b!568327 (= e!327026 (bvsge (x!53322 lt!258914) #b01111111111111111111111111111110))))

(declare-fun b!568328 () Bool)

(assert (=> b!568328 (and (bvsge (index!24449 lt!258914) #b00000000000000000000000000000000) (bvslt (index!24449 lt!258914) (size!17470 a!3118)))))

(declare-fun res!358541 () Bool)

(assert (=> b!568328 (= res!358541 (= (select (arr!17106 a!3118) (index!24449 lt!258914)) (select (arr!17106 a!3118) j!142)))))

(assert (=> b!568328 (=> res!358541 e!327023)))

(declare-fun e!327024 () Bool)

(assert (=> b!568328 (= e!327024 e!327023)))

(declare-fun b!568329 () Bool)

(assert (=> b!568329 (= e!327027 (Intermediate!5555 true lt!258762 #b00000000000000000000000000000000))))

(declare-fun b!568330 () Bool)

(assert (=> b!568330 (= e!327027 e!327025)))

(declare-fun c!65245 () Bool)

(assert (=> b!568330 (= c!65245 (or (= lt!258913 (select (arr!17106 a!3118) j!142)) (= (bvadd lt!258913 lt!258913) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568331 () Bool)

(assert (=> b!568331 (= e!327026 e!327024)))

(declare-fun res!358542 () Bool)

(assert (=> b!568331 (= res!358542 (and (is-Intermediate!5555 lt!258914) (not (undefined!6367 lt!258914)) (bvslt (x!53322 lt!258914) #b01111111111111111111111111111110) (bvsge (x!53322 lt!258914) #b00000000000000000000000000000000) (bvsge (x!53322 lt!258914) #b00000000000000000000000000000000)))))

(assert (=> b!568331 (=> (not res!358542) (not e!327024))))

(assert (= (and d!84463 c!65244) b!568329))

(assert (= (and d!84463 (not c!65244)) b!568330))

(assert (= (and b!568330 c!65245) b!568324))

(assert (= (and b!568330 (not c!65245)) b!568326))

(assert (= (and d!84463 c!65246) b!568327))

(assert (= (and d!84463 (not c!65246)) b!568331))

(assert (= (and b!568331 res!358542) b!568328))

(assert (= (and b!568328 (not res!358541)) b!568323))

(assert (= (and b!568323 (not res!358543)) b!568325))

(declare-fun m!546867 () Bool)

(assert (=> b!568326 m!546867))

(assert (=> b!568326 m!546867))

(assert (=> b!568326 m!546573))

(declare-fun m!546869 () Bool)

(assert (=> b!568326 m!546869))

(declare-fun m!546871 () Bool)

(assert (=> d!84463 m!546871))

(assert (=> d!84463 m!546593))

(declare-fun m!546873 () Bool)

(assert (=> b!568325 m!546873))

(assert (=> b!568328 m!546873))

(assert (=> b!568323 m!546873))

(assert (=> b!567996 d!84463))

(declare-fun d!84465 () Bool)

(declare-fun lt!258923 () (_ BitVec 32))

(declare-fun lt!258922 () (_ BitVec 32))

(assert (=> d!84465 (= lt!258923 (bvmul (bvxor lt!258922 (bvlshr lt!258922 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84465 (= lt!258922 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17106 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17106 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84465 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358544 (let ((h!12202 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17106 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17106 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53330 (bvmul (bvxor h!12202 (bvlshr h!12202 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53330 (bvlshr x!53330 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358544 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358544 #b00000000000000000000000000000000))))))

(assert (=> d!84465 (= (toIndex!0 (select (store (arr!17106 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!258923 (bvlshr lt!258923 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567996 d!84465))

(declare-fun d!84475 () Bool)

(declare-fun lt!258925 () (_ BitVec 32))

(declare-fun lt!258924 () (_ BitVec 32))

(assert (=> d!84475 (= lt!258925 (bvmul (bvxor lt!258924 (bvlshr lt!258924 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84475 (= lt!258924 ((_ extract 31 0) (bvand (bvxor (select (arr!17106 a!3118) j!142) (bvlshr (select (arr!17106 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84475 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358544 (let ((h!12202 ((_ extract 31 0) (bvand (bvxor (select (arr!17106 a!3118) j!142) (bvlshr (select (arr!17106 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53330 (bvmul (bvxor h!12202 (bvlshr h!12202 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53330 (bvlshr x!53330 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358544 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358544 #b00000000000000000000000000000000))))))

(assert (=> d!84475 (= (toIndex!0 (select (arr!17106 a!3118) j!142) mask!3119) (bvand (bvxor lt!258925 (bvlshr lt!258925 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567996 d!84475))

(push 1)

(assert (not b!568208))

(assert (not bm!32550))

(assert (not b!568217))

(assert (not d!84463))

(assert (not bm!32551))

(assert (not b!568124))

(assert (not d!84431))

(assert (not b!568177))

(assert (not d!84447))

(assert (not b!568214))

(assert (not b!568317))

(assert (not b!568216))

(assert (not bm!32547))

(assert (not b!568273))

(assert (not b!568207))

(assert (not b!568206))

(assert (not b!568326))

(assert (not d!84391))

(assert (not b!568176))

(assert (not d!84415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

