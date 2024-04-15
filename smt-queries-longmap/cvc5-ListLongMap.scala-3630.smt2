; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50058 () Bool)

(assert start!50058)

(declare-fun b!548391 () Bool)

(declare-fun res!341854 () Bool)

(declare-fun e!316769 () Bool)

(assert (=> b!548391 (=> (not res!341854) (not e!316769))))

(declare-datatypes ((array!34604 0))(
  ( (array!34605 (arr!16621 (Array (_ BitVec 32) (_ BitVec 64))) (size!16986 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34604)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548391 (= res!341854 (validKeyInArray!0 (select (arr!16621 a!3118) j!142)))))

(declare-fun b!548392 () Bool)

(declare-fun res!341860 () Bool)

(declare-fun e!316768 () Bool)

(assert (=> b!548392 (=> (not res!341860) (not e!316768))))

(declare-datatypes ((List!10740 0))(
  ( (Nil!10737) (Cons!10736 (h!11706 (_ BitVec 64)) (t!16959 List!10740)) )
))
(declare-fun arrayNoDuplicates!0 (array!34604 (_ BitVec 32) List!10740) Bool)

(assert (=> b!548392 (= res!341860 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10737))))

(declare-fun res!341857 () Bool)

(assert (=> start!50058 (=> (not res!341857) (not e!316769))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50058 (= res!341857 (validMask!0 mask!3119))))

(assert (=> start!50058 e!316769))

(assert (=> start!50058 true))

(declare-fun array_inv!12504 (array!34604) Bool)

(assert (=> start!50058 (array_inv!12504 a!3118)))

(declare-fun b!548393 () Bool)

(declare-fun res!341859 () Bool)

(assert (=> b!548393 (=> (not res!341859) (not e!316769))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548393 (= res!341859 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548394 () Bool)

(assert (=> b!548394 (= e!316769 e!316768)))

(declare-fun res!341856 () Bool)

(assert (=> b!548394 (=> (not res!341856) (not e!316768))))

(declare-datatypes ((SeekEntryResult!5067 0))(
  ( (MissingZero!5067 (index!22495 (_ BitVec 32))) (Found!5067 (index!22496 (_ BitVec 32))) (Intermediate!5067 (undefined!5879 Bool) (index!22497 (_ BitVec 32)) (x!51437 (_ BitVec 32))) (Undefined!5067) (MissingVacant!5067 (index!22498 (_ BitVec 32))) )
))
(declare-fun lt!249646 () SeekEntryResult!5067)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548394 (= res!341856 (or (= lt!249646 (MissingZero!5067 i!1132)) (= lt!249646 (MissingVacant!5067 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34604 (_ BitVec 32)) SeekEntryResult!5067)

(assert (=> b!548394 (= lt!249646 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548395 () Bool)

(declare-fun res!341858 () Bool)

(assert (=> b!548395 (=> (not res!341858) (not e!316769))))

(assert (=> b!548395 (= res!341858 (and (= (size!16986 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16986 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16986 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548396 () Bool)

(assert (=> b!548396 (= e!316768 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsgt mask!3119 #b00111111111111111111111111111111)))))

(declare-fun b!548397 () Bool)

(declare-fun res!341861 () Bool)

(assert (=> b!548397 (=> (not res!341861) (not e!316769))))

(assert (=> b!548397 (= res!341861 (validKeyInArray!0 k!1914))))

(declare-fun b!548398 () Bool)

(declare-fun res!341855 () Bool)

(assert (=> b!548398 (=> (not res!341855) (not e!316768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34604 (_ BitVec 32)) Bool)

(assert (=> b!548398 (= res!341855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50058 res!341857) b!548395))

(assert (= (and b!548395 res!341858) b!548391))

(assert (= (and b!548391 res!341854) b!548397))

(assert (= (and b!548397 res!341861) b!548393))

(assert (= (and b!548393 res!341859) b!548394))

(assert (= (and b!548394 res!341856) b!548398))

(assert (= (and b!548398 res!341855) b!548392))

(assert (= (and b!548392 res!341860) b!548396))

(declare-fun m!524861 () Bool)

(assert (=> b!548392 m!524861))

(declare-fun m!524863 () Bool)

(assert (=> b!548391 m!524863))

(assert (=> b!548391 m!524863))

(declare-fun m!524865 () Bool)

(assert (=> b!548391 m!524865))

(declare-fun m!524867 () Bool)

(assert (=> b!548397 m!524867))

(declare-fun m!524869 () Bool)

(assert (=> start!50058 m!524869))

(declare-fun m!524871 () Bool)

(assert (=> start!50058 m!524871))

(declare-fun m!524873 () Bool)

(assert (=> b!548393 m!524873))

(declare-fun m!524875 () Bool)

(assert (=> b!548398 m!524875))

(declare-fun m!524877 () Bool)

(assert (=> b!548394 m!524877))

(push 1)

(assert (not b!548392))

(assert (not b!548397))

(assert (not start!50058))

(assert (not b!548391))

(assert (not b!548398))

(assert (not b!548394))

(assert (not b!548393))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!548438 () Bool)

(declare-fun e!316799 () SeekEntryResult!5067)

(declare-fun e!316795 () SeekEntryResult!5067)

(assert (=> b!548438 (= e!316799 e!316795)))

(declare-fun lt!249664 () (_ BitVec 64))

(declare-fun lt!249662 () SeekEntryResult!5067)

(assert (=> b!548438 (= lt!249664 (select (arr!16621 a!3118) (index!22497 lt!249662)))))

(declare-fun c!63613 () Bool)

(assert (=> b!548438 (= c!63613 (= lt!249664 k!1914))))

(declare-fun e!316797 () SeekEntryResult!5067)

(declare-fun b!548440 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34604 (_ BitVec 32)) SeekEntryResult!5067)

(assert (=> b!548440 (= e!316797 (seekKeyOrZeroReturnVacant!0 (x!51437 lt!249662) (index!22497 lt!249662) (index!22497 lt!249662) k!1914 a!3118 mask!3119))))

(declare-fun b!548442 () Bool)

(declare-fun c!63615 () Bool)

(assert (=> b!548442 (= c!63615 (= lt!249664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!548442 (= e!316795 e!316797)))

(declare-fun d!82469 () Bool)

(declare-fun lt!249660 () SeekEntryResult!5067)

(assert (=> d!82469 (and (or (is-Undefined!5067 lt!249660) (not (is-Found!5067 lt!249660)) (and (bvsge (index!22496 lt!249660) #b00000000000000000000000000000000) (bvslt (index!22496 lt!249660) (size!16986 a!3118)))) (or (is-Undefined!5067 lt!249660) (is-Found!5067 lt!249660) (not (is-MissingZero!5067 lt!249660)) (and (bvsge (index!22495 lt!249660) #b00000000000000000000000000000000) (bvslt (index!22495 lt!249660) (size!16986 a!3118)))) (or (is-Undefined!5067 lt!249660) (is-Found!5067 lt!249660) (is-MissingZero!5067 lt!249660) (not (is-MissingVacant!5067 lt!249660)) (and (bvsge (index!22498 lt!249660) #b00000000000000000000000000000000) (bvslt (index!22498 lt!249660) (size!16986 a!3118)))) (or (is-Undefined!5067 lt!249660) (ite (is-Found!5067 lt!249660) (= (select (arr!16621 a!3118) (index!22496 lt!249660)) k!1914) (ite (is-MissingZero!5067 lt!249660) (= (select (arr!16621 a!3118) (index!22495 lt!249660)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5067 lt!249660) (= (select (arr!16621 a!3118) (index!22498 lt!249660)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82469 (= lt!249660 e!316799)))

(declare-fun c!63617 () Bool)

(assert (=> d!82469 (= c!63617 (and (is-Intermediate!5067 lt!249662) (undefined!5879 lt!249662)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34604 (_ BitVec 32)) SeekEntryResult!5067)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82469 (= lt!249662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82469 (validMask!0 mask!3119)))

(assert (=> d!82469 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249660)))

(declare-fun b!548444 () Bool)

(assert (=> b!548444 (= e!316795 (Found!5067 (index!22497 lt!249662)))))

(declare-fun b!548446 () Bool)

(assert (=> b!548446 (= e!316797 (MissingZero!5067 (index!22497 lt!249662)))))

(declare-fun b!548448 () Bool)

(assert (=> b!548448 (= e!316799 Undefined!5067)))

(assert (= (and d!82469 c!63617) b!548448))

(assert (= (and d!82469 (not c!63617)) b!548438))

(assert (= (and b!548438 c!63613) b!548444))

(assert (= (and b!548438 (not c!63613)) b!548442))

(assert (= (and b!548442 c!63615) b!548446))

(assert (= (and b!548442 (not c!63615)) b!548440))

(declare-fun m!524887 () Bool)

(assert (=> b!548438 m!524887))

(declare-fun m!524889 () Bool)

(assert (=> b!548440 m!524889))

(declare-fun m!524891 () Bool)

(assert (=> d!82469 m!524891))

(declare-fun m!524893 () Bool)

(assert (=> d!82469 m!524893))

(declare-fun m!524895 () Bool)

(assert (=> d!82469 m!524895))

(assert (=> d!82469 m!524869))

(declare-fun m!524897 () Bool)

(assert (=> d!82469 m!524897))

(assert (=> d!82469 m!524893))

(declare-fun m!524899 () Bool)

(assert (=> d!82469 m!524899))

(assert (=> b!548394 d!82469))

(declare-fun d!82477 () Bool)

(assert (=> d!82477 (= (validKeyInArray!0 (select (arr!16621 a!3118) j!142)) (and (not (= (select (arr!16621 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16621 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548391 d!82477))

(declare-fun d!82481 () Bool)

(assert (=> d!82481 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548397 d!82481))

(declare-fun d!82483 () Bool)

(assert (=> d!82483 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50058 d!82483))

(declare-fun d!82487 () Bool)

(assert (=> d!82487 (= (array_inv!12504 a!3118) (bvsge (size!16986 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50058 d!82487))

(declare-fun b!548487 () Bool)

(declare-fun e!316831 () Bool)

(declare-fun contains!2808 (List!10740 (_ BitVec 64)) Bool)

(assert (=> b!548487 (= e!316831 (contains!2808 Nil!10737 (select (arr!16621 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32194 () Bool)

(declare-fun call!32197 () Bool)

(declare-fun c!63627 () Bool)

(assert (=> bm!32194 (= call!32197 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63627 (Cons!10736 (select (arr!16621 a!3118) #b00000000000000000000000000000000) Nil!10737) Nil!10737)))))

(declare-fun b!548488 () Bool)

(declare-fun e!316832 () Bool)

(assert (=> b!548488 (= e!316832 call!32197)))

(declare-fun b!548489 () Bool)

(assert (=> b!548489 (= e!316832 call!32197)))

(declare-fun b!548490 () Bool)

(declare-fun e!316833 () Bool)

(assert (=> b!548490 (= e!316833 e!316832)))

(assert (=> b!548490 (= c!63627 (validKeyInArray!0 (select (arr!16621 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548491 () Bool)

(declare-fun e!316830 () Bool)

(assert (=> b!548491 (= e!316830 e!316833)))

(declare-fun res!341892 () Bool)

(assert (=> b!548491 (=> (not res!341892) (not e!316833))))

(assert (=> b!548491 (= res!341892 (not e!316831))))

(declare-fun res!341893 () Bool)

(assert (=> b!548491 (=> (not res!341893) (not e!316831))))

(assert (=> b!548491 (= res!341893 (validKeyInArray!0 (select (arr!16621 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82489 () Bool)

(declare-fun res!341894 () Bool)

(assert (=> d!82489 (=> res!341894 e!316830)))

(assert (=> d!82489 (= res!341894 (bvsge #b00000000000000000000000000000000 (size!16986 a!3118)))))

(assert (=> d!82489 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10737) e!316830)))

(assert (= (and d!82489 (not res!341894)) b!548491))

(assert (= (and b!548491 res!341893) b!548487))

(assert (= (and b!548491 res!341892) b!548490))

(assert (= (and b!548490 c!63627) b!548489))

(assert (= (and b!548490 (not c!63627)) b!548488))

(assert (= (or b!548489 b!548488) bm!32194))

(declare-fun m!524931 () Bool)

(assert (=> b!548487 m!524931))

(assert (=> b!548487 m!524931))

(declare-fun m!524933 () Bool)

(assert (=> b!548487 m!524933))

(assert (=> bm!32194 m!524931))

(declare-fun m!524935 () Bool)

(assert (=> bm!32194 m!524935))

(assert (=> b!548490 m!524931))

(assert (=> b!548490 m!524931))

(declare-fun m!524937 () Bool)

(assert (=> b!548490 m!524937))

(assert (=> b!548491 m!524931))

(assert (=> b!548491 m!524931))

(assert (=> b!548491 m!524937))

(assert (=> b!548392 d!82489))

(declare-fun d!82493 () Bool)

(declare-fun res!341899 () Bool)

(declare-fun e!316838 () Bool)

(assert (=> d!82493 (=> res!341899 e!316838)))

(assert (=> d!82493 (= res!341899 (= (select (arr!16621 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82493 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316838)))

(declare-fun b!548496 () Bool)

(declare-fun e!316839 () Bool)

(assert (=> b!548496 (= e!316838 e!316839)))

(declare-fun res!341900 () Bool)

(assert (=> b!548496 (=> (not res!341900) (not e!316839))))

(assert (=> b!548496 (= res!341900 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16986 a!3118)))))

(declare-fun b!548497 () Bool)

(assert (=> b!548497 (= e!316839 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82493 (not res!341899)) b!548496))

(assert (= (and b!548496 res!341900) b!548497))

(assert (=> d!82493 m!524931))

(declare-fun m!524939 () Bool)

(assert (=> b!548497 m!524939))

(assert (=> b!548393 d!82493))

(declare-fun d!82495 () Bool)

(declare-fun res!341911 () Bool)

(declare-fun e!316852 () Bool)

(assert (=> d!82495 (=> res!341911 e!316852)))

(assert (=> d!82495 (= res!341911 (bvsge #b00000000000000000000000000000000 (size!16986 a!3118)))))

(assert (=> d!82495 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316852)))

(declare-fun b!548512 () Bool)

(declare-fun e!316853 () Bool)

(assert (=> b!548512 (= e!316852 e!316853)))

(declare-fun c!63630 () Bool)

(assert (=> b!548512 (= c!63630 (validKeyInArray!0 (select (arr!16621 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548513 () Bool)

(declare-fun call!32200 () Bool)

(assert (=> b!548513 (= e!316853 call!32200)))

(declare-fun b!548514 () Bool)

(declare-fun e!316854 () Bool)

(assert (=> b!548514 (= e!316853 e!316854)))

(declare-fun lt!249680 () (_ BitVec 64))

(assert (=> b!548514 (= lt!249680 (select (arr!16621 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16954 0))(
  ( (Unit!16955) )
))
(declare-fun lt!249682 () Unit!16954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34604 (_ BitVec 64) (_ BitVec 32)) Unit!16954)

(assert (=> b!548514 (= lt!249682 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249680 #b00000000000000000000000000000000))))

(assert (=> b!548514 (arrayContainsKey!0 a!3118 lt!249680 #b00000000000000000000000000000000)))

(declare-fun lt!249681 () Unit!16954)

(assert (=> b!548514 (= lt!249681 lt!249682)))

(declare-fun res!341912 () Bool)

(assert (=> b!548514 (= res!341912 (= (seekEntryOrOpen!0 (select (arr!16621 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5067 #b00000000000000000000000000000000)))))

(assert (=> b!548514 (=> (not res!341912) (not e!316854))))

(declare-fun b!548515 () Bool)

(assert (=> b!548515 (= e!316854 call!32200)))

(declare-fun bm!32197 () Bool)

(assert (=> bm!32197 (= call!32200 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!82495 (not res!341911)) b!548512))

(assert (= (and b!548512 c!63630) b!548514))

(assert (= (and b!548512 (not c!63630)) b!548513))

(assert (= (and b!548514 res!341912) b!548515))

(assert (= (or b!548515 b!548513) bm!32197))

(assert (=> b!548512 m!524931))

(assert (=> b!548512 m!524931))

(assert (=> b!548512 m!524937))

(assert (=> b!548514 m!524931))

(declare-fun m!524943 () Bool)

(assert (=> b!548514 m!524943))

(declare-fun m!524945 () Bool)

(assert (=> b!548514 m!524945))

(assert (=> b!548514 m!524931))

(declare-fun m!524947 () Bool)

(assert (=> b!548514 m!524947))

(declare-fun m!524949 () Bool)

(assert (=> bm!32197 m!524949))

(assert (=> b!548398 d!82495))

(push 1)

(assert (not b!548487))

(assert (not bm!32197))

(assert (not b!548497))

(assert (not b!548512))

(assert (not b!548514))

(assert (not b!548490))

(assert (not d!82469))

(assert (not b!548440))

(assert (not bm!32194))

(assert (not b!548491))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

