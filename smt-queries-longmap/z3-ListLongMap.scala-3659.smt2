; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50498 () Bool)

(assert start!50498)

(declare-fun b!551893 () Bool)

(declare-fun res!344633 () Bool)

(declare-fun e!318447 () Bool)

(assert (=> b!551893 (=> (not res!344633) (not e!318447))))

(declare-datatypes ((array!34789 0))(
  ( (array!34790 (arr!16706 (Array (_ BitVec 32) (_ BitVec 64))) (size!17071 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34789)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551893 (= res!344633 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551894 () Bool)

(declare-fun res!344636 () Bool)

(declare-fun e!318448 () Bool)

(assert (=> b!551894 (=> (not res!344636) (not e!318448))))

(declare-datatypes ((List!10825 0))(
  ( (Nil!10822) (Cons!10821 (h!11803 (_ BitVec 64)) (t!17044 List!10825)) )
))
(declare-fun arrayNoDuplicates!0 (array!34789 (_ BitVec 32) List!10825) Bool)

(assert (=> b!551894 (= res!344636 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10822))))

(declare-fun b!551895 () Bool)

(declare-fun res!344638 () Bool)

(assert (=> b!551895 (=> (not res!344638) (not e!318447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551895 (= res!344638 (validKeyInArray!0 k0!1914))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!318450 () Bool)

(declare-fun b!551896 () Bool)

(declare-datatypes ((SeekEntryResult!5152 0))(
  ( (MissingZero!5152 (index!22835 (_ BitVec 32))) (Found!5152 (index!22836 (_ BitVec 32))) (Intermediate!5152 (undefined!5964 Bool) (index!22837 (_ BitVec 32)) (x!51775 (_ BitVec 32))) (Undefined!5152) (MissingVacant!5152 (index!22838 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34789 (_ BitVec 32)) SeekEntryResult!5152)

(assert (=> b!551896 (= e!318450 (= (seekEntryOrOpen!0 (select (arr!16706 a!3118) j!142) a!3118 mask!3119) (Found!5152 j!142)))))

(declare-fun b!551897 () Bool)

(declare-fun res!344635 () Bool)

(assert (=> b!551897 (=> (not res!344635) (not e!318447))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551897 (= res!344635 (and (= (size!17071 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17071 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17071 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551898 () Bool)

(declare-fun e!318446 () Bool)

(assert (=> b!551898 (= e!318448 e!318446)))

(declare-fun res!344634 () Bool)

(assert (=> b!551898 (=> (not res!344634) (not e!318446))))

(declare-fun lt!250816 () (_ BitVec 32))

(declare-fun lt!250817 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34789 (_ BitVec 32)) SeekEntryResult!5152)

(assert (=> b!551898 (= res!344634 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250816 (select (arr!16706 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250817 (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142) (array!34790 (store (arr!16706 a!3118) i!1132 k0!1914) (size!17071 a!3118)) mask!3119)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551898 (= lt!250817 (toIndex!0 (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!551898 (= lt!250816 (toIndex!0 (select (arr!16706 a!3118) j!142) mask!3119))))

(declare-fun res!344639 () Bool)

(assert (=> start!50498 (=> (not res!344639) (not e!318447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50498 (= res!344639 (validMask!0 mask!3119))))

(assert (=> start!50498 e!318447))

(assert (=> start!50498 true))

(declare-fun array_inv!12589 (array!34789) Bool)

(assert (=> start!50498 (array_inv!12589 a!3118)))

(declare-fun b!551899 () Bool)

(assert (=> b!551899 (= e!318447 e!318448)))

(declare-fun res!344631 () Bool)

(assert (=> b!551899 (=> (not res!344631) (not e!318448))))

(declare-fun lt!250819 () SeekEntryResult!5152)

(assert (=> b!551899 (= res!344631 (or (= lt!250819 (MissingZero!5152 i!1132)) (= lt!250819 (MissingVacant!5152 i!1132))))))

(assert (=> b!551899 (= lt!250819 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551900 () Bool)

(assert (=> b!551900 (= e!318446 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge lt!250817 #b00000000000000000000000000000000) (bvslt lt!250817 (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(assert (=> b!551900 e!318450))

(declare-fun res!344632 () Bool)

(assert (=> b!551900 (=> (not res!344632) (not e!318450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34789 (_ BitVec 32)) Bool)

(assert (=> b!551900 (= res!344632 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17064 0))(
  ( (Unit!17065) )
))
(declare-fun lt!250818 () Unit!17064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17064)

(assert (=> b!551900 (= lt!250818 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551901 () Bool)

(declare-fun res!344637 () Bool)

(assert (=> b!551901 (=> (not res!344637) (not e!318447))))

(assert (=> b!551901 (= res!344637 (validKeyInArray!0 (select (arr!16706 a!3118) j!142)))))

(declare-fun b!551902 () Bool)

(declare-fun res!344630 () Bool)

(assert (=> b!551902 (=> (not res!344630) (not e!318448))))

(assert (=> b!551902 (= res!344630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50498 res!344639) b!551897))

(assert (= (and b!551897 res!344635) b!551901))

(assert (= (and b!551901 res!344637) b!551895))

(assert (= (and b!551895 res!344638) b!551893))

(assert (= (and b!551893 res!344633) b!551899))

(assert (= (and b!551899 res!344631) b!551902))

(assert (= (and b!551902 res!344630) b!551894))

(assert (= (and b!551894 res!344636) b!551898))

(assert (= (and b!551898 res!344634) b!551900))

(assert (= (and b!551900 res!344632) b!551896))

(declare-fun m!528371 () Bool)

(assert (=> b!551902 m!528371))

(declare-fun m!528373 () Bool)

(assert (=> b!551901 m!528373))

(assert (=> b!551901 m!528373))

(declare-fun m!528375 () Bool)

(assert (=> b!551901 m!528375))

(declare-fun m!528377 () Bool)

(assert (=> b!551893 m!528377))

(assert (=> b!551896 m!528373))

(assert (=> b!551896 m!528373))

(declare-fun m!528379 () Bool)

(assert (=> b!551896 m!528379))

(declare-fun m!528381 () Bool)

(assert (=> b!551900 m!528381))

(declare-fun m!528383 () Bool)

(assert (=> b!551900 m!528383))

(declare-fun m!528385 () Bool)

(assert (=> b!551899 m!528385))

(declare-fun m!528387 () Bool)

(assert (=> b!551894 m!528387))

(assert (=> b!551898 m!528373))

(declare-fun m!528389 () Bool)

(assert (=> b!551898 m!528389))

(assert (=> b!551898 m!528389))

(declare-fun m!528391 () Bool)

(assert (=> b!551898 m!528391))

(assert (=> b!551898 m!528373))

(declare-fun m!528393 () Bool)

(assert (=> b!551898 m!528393))

(assert (=> b!551898 m!528389))

(declare-fun m!528395 () Bool)

(assert (=> b!551898 m!528395))

(assert (=> b!551898 m!528373))

(declare-fun m!528397 () Bool)

(assert (=> b!551898 m!528397))

(declare-fun m!528399 () Bool)

(assert (=> b!551898 m!528399))

(declare-fun m!528401 () Bool)

(assert (=> b!551895 m!528401))

(declare-fun m!528403 () Bool)

(assert (=> start!50498 m!528403))

(declare-fun m!528405 () Bool)

(assert (=> start!50498 m!528405))

(check-sat (not b!551902) (not b!551900) (not b!551898) (not b!551896) (not b!551895) (not b!551899) (not b!551894) (not start!50498) (not b!551893) (not b!551901))
(check-sat)
(get-model)

(declare-fun d!82895 () Bool)

(assert (=> d!82895 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551895 d!82895))

(declare-fun d!82897 () Bool)

(assert (=> d!82897 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50498 d!82897))

(declare-fun d!82901 () Bool)

(assert (=> d!82901 (= (array_inv!12589 a!3118) (bvsge (size!17071 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50498 d!82901))

(declare-fun b!552005 () Bool)

(declare-fun e!318511 () SeekEntryResult!5152)

(assert (=> b!552005 (= e!318511 Undefined!5152)))

(declare-fun b!552006 () Bool)

(declare-fun c!63980 () Bool)

(declare-fun lt!250869 () (_ BitVec 64))

(assert (=> b!552006 (= c!63980 (= lt!250869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318512 () SeekEntryResult!5152)

(declare-fun e!318513 () SeekEntryResult!5152)

(assert (=> b!552006 (= e!318512 e!318513)))

(declare-fun d!82903 () Bool)

(declare-fun lt!250868 () SeekEntryResult!5152)

(get-info :version)

(assert (=> d!82903 (and (or ((_ is Undefined!5152) lt!250868) (not ((_ is Found!5152) lt!250868)) (and (bvsge (index!22836 lt!250868) #b00000000000000000000000000000000) (bvslt (index!22836 lt!250868) (size!17071 a!3118)))) (or ((_ is Undefined!5152) lt!250868) ((_ is Found!5152) lt!250868) (not ((_ is MissingZero!5152) lt!250868)) (and (bvsge (index!22835 lt!250868) #b00000000000000000000000000000000) (bvslt (index!22835 lt!250868) (size!17071 a!3118)))) (or ((_ is Undefined!5152) lt!250868) ((_ is Found!5152) lt!250868) ((_ is MissingZero!5152) lt!250868) (not ((_ is MissingVacant!5152) lt!250868)) (and (bvsge (index!22838 lt!250868) #b00000000000000000000000000000000) (bvslt (index!22838 lt!250868) (size!17071 a!3118)))) (or ((_ is Undefined!5152) lt!250868) (ite ((_ is Found!5152) lt!250868) (= (select (arr!16706 a!3118) (index!22836 lt!250868)) (select (arr!16706 a!3118) j!142)) (ite ((_ is MissingZero!5152) lt!250868) (= (select (arr!16706 a!3118) (index!22835 lt!250868)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5152) lt!250868) (= (select (arr!16706 a!3118) (index!22838 lt!250868)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82903 (= lt!250868 e!318511)))

(declare-fun c!63981 () Bool)

(declare-fun lt!250870 () SeekEntryResult!5152)

(assert (=> d!82903 (= c!63981 (and ((_ is Intermediate!5152) lt!250870) (undefined!5964 lt!250870)))))

(assert (=> d!82903 (= lt!250870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16706 a!3118) j!142) mask!3119) (select (arr!16706 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!82903 (validMask!0 mask!3119)))

(assert (=> d!82903 (= (seekEntryOrOpen!0 (select (arr!16706 a!3118) j!142) a!3118 mask!3119) lt!250868)))

(declare-fun b!552007 () Bool)

(assert (=> b!552007 (= e!318512 (Found!5152 (index!22837 lt!250870)))))

(declare-fun b!552008 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34789 (_ BitVec 32)) SeekEntryResult!5152)

(assert (=> b!552008 (= e!318513 (seekKeyOrZeroReturnVacant!0 (x!51775 lt!250870) (index!22837 lt!250870) (index!22837 lt!250870) (select (arr!16706 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!552009 () Bool)

(assert (=> b!552009 (= e!318511 e!318512)))

(assert (=> b!552009 (= lt!250869 (select (arr!16706 a!3118) (index!22837 lt!250870)))))

(declare-fun c!63979 () Bool)

(assert (=> b!552009 (= c!63979 (= lt!250869 (select (arr!16706 a!3118) j!142)))))

(declare-fun b!552010 () Bool)

(assert (=> b!552010 (= e!318513 (MissingZero!5152 (index!22837 lt!250870)))))

(assert (= (and d!82903 c!63981) b!552005))

(assert (= (and d!82903 (not c!63981)) b!552009))

(assert (= (and b!552009 c!63979) b!552007))

(assert (= (and b!552009 (not c!63979)) b!552006))

(assert (= (and b!552006 c!63980) b!552010))

(assert (= (and b!552006 (not c!63980)) b!552008))

(declare-fun m!528499 () Bool)

(assert (=> d!82903 m!528499))

(declare-fun m!528501 () Bool)

(assert (=> d!82903 m!528501))

(assert (=> d!82903 m!528373))

(assert (=> d!82903 m!528393))

(assert (=> d!82903 m!528393))

(assert (=> d!82903 m!528373))

(declare-fun m!528503 () Bool)

(assert (=> d!82903 m!528503))

(assert (=> d!82903 m!528403))

(declare-fun m!528505 () Bool)

(assert (=> d!82903 m!528505))

(assert (=> b!552008 m!528373))

(declare-fun m!528507 () Bool)

(assert (=> b!552008 m!528507))

(declare-fun m!528509 () Bool)

(assert (=> b!552009 m!528509))

(assert (=> b!551896 d!82903))

(declare-fun d!82917 () Bool)

(assert (=> d!82917 (= (validKeyInArray!0 (select (arr!16706 a!3118) j!142)) (and (not (= (select (arr!16706 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16706 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551901 d!82917))

(declare-fun bm!32290 () Bool)

(declare-fun call!32293 () Bool)

(declare-fun c!63984 () Bool)

(assert (=> bm!32290 (= call!32293 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63984 (Cons!10821 (select (arr!16706 a!3118) #b00000000000000000000000000000000) Nil!10822) Nil!10822)))))

(declare-fun d!82919 () Bool)

(declare-fun res!344731 () Bool)

(declare-fun e!318531 () Bool)

(assert (=> d!82919 (=> res!344731 e!318531)))

(assert (=> d!82919 (= res!344731 (bvsge #b00000000000000000000000000000000 (size!17071 a!3118)))))

(assert (=> d!82919 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10822) e!318531)))

(declare-fun b!552027 () Bool)

(declare-fun e!318529 () Bool)

(declare-fun contains!2823 (List!10825 (_ BitVec 64)) Bool)

(assert (=> b!552027 (= e!318529 (contains!2823 Nil!10822 (select (arr!16706 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552028 () Bool)

(declare-fun e!318530 () Bool)

(assert (=> b!552028 (= e!318530 call!32293)))

(declare-fun b!552029 () Bool)

(declare-fun e!318528 () Bool)

(assert (=> b!552029 (= e!318531 e!318528)))

(declare-fun res!344732 () Bool)

(assert (=> b!552029 (=> (not res!344732) (not e!318528))))

(assert (=> b!552029 (= res!344732 (not e!318529))))

(declare-fun res!344730 () Bool)

(assert (=> b!552029 (=> (not res!344730) (not e!318529))))

(assert (=> b!552029 (= res!344730 (validKeyInArray!0 (select (arr!16706 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552030 () Bool)

(assert (=> b!552030 (= e!318528 e!318530)))

(assert (=> b!552030 (= c!63984 (validKeyInArray!0 (select (arr!16706 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552031 () Bool)

(assert (=> b!552031 (= e!318530 call!32293)))

(assert (= (and d!82919 (not res!344731)) b!552029))

(assert (= (and b!552029 res!344730) b!552027))

(assert (= (and b!552029 res!344732) b!552030))

(assert (= (and b!552030 c!63984) b!552031))

(assert (= (and b!552030 (not c!63984)) b!552028))

(assert (= (or b!552031 b!552028) bm!32290))

(declare-fun m!528517 () Bool)

(assert (=> bm!32290 m!528517))

(declare-fun m!528519 () Bool)

(assert (=> bm!32290 m!528519))

(assert (=> b!552027 m!528517))

(assert (=> b!552027 m!528517))

(declare-fun m!528521 () Bool)

(assert (=> b!552027 m!528521))

(assert (=> b!552029 m!528517))

(assert (=> b!552029 m!528517))

(declare-fun m!528523 () Bool)

(assert (=> b!552029 m!528523))

(assert (=> b!552030 m!528517))

(assert (=> b!552030 m!528517))

(assert (=> b!552030 m!528523))

(assert (=> b!551894 d!82919))

(declare-fun b!552036 () Bool)

(declare-fun e!318534 () SeekEntryResult!5152)

(assert (=> b!552036 (= e!318534 Undefined!5152)))

(declare-fun b!552037 () Bool)

(declare-fun c!63988 () Bool)

(declare-fun lt!250879 () (_ BitVec 64))

(assert (=> b!552037 (= c!63988 (= lt!250879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318535 () SeekEntryResult!5152)

(declare-fun e!318536 () SeekEntryResult!5152)

(assert (=> b!552037 (= e!318535 e!318536)))

(declare-fun d!82925 () Bool)

(declare-fun lt!250878 () SeekEntryResult!5152)

(assert (=> d!82925 (and (or ((_ is Undefined!5152) lt!250878) (not ((_ is Found!5152) lt!250878)) (and (bvsge (index!22836 lt!250878) #b00000000000000000000000000000000) (bvslt (index!22836 lt!250878) (size!17071 a!3118)))) (or ((_ is Undefined!5152) lt!250878) ((_ is Found!5152) lt!250878) (not ((_ is MissingZero!5152) lt!250878)) (and (bvsge (index!22835 lt!250878) #b00000000000000000000000000000000) (bvslt (index!22835 lt!250878) (size!17071 a!3118)))) (or ((_ is Undefined!5152) lt!250878) ((_ is Found!5152) lt!250878) ((_ is MissingZero!5152) lt!250878) (not ((_ is MissingVacant!5152) lt!250878)) (and (bvsge (index!22838 lt!250878) #b00000000000000000000000000000000) (bvslt (index!22838 lt!250878) (size!17071 a!3118)))) (or ((_ is Undefined!5152) lt!250878) (ite ((_ is Found!5152) lt!250878) (= (select (arr!16706 a!3118) (index!22836 lt!250878)) k0!1914) (ite ((_ is MissingZero!5152) lt!250878) (= (select (arr!16706 a!3118) (index!22835 lt!250878)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5152) lt!250878) (= (select (arr!16706 a!3118) (index!22838 lt!250878)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82925 (= lt!250878 e!318534)))

(declare-fun c!63989 () Bool)

(declare-fun lt!250880 () SeekEntryResult!5152)

(assert (=> d!82925 (= c!63989 (and ((_ is Intermediate!5152) lt!250880) (undefined!5964 lt!250880)))))

(assert (=> d!82925 (= lt!250880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82925 (validMask!0 mask!3119)))

(assert (=> d!82925 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!250878)))

(declare-fun b!552038 () Bool)

(assert (=> b!552038 (= e!318535 (Found!5152 (index!22837 lt!250880)))))

(declare-fun b!552039 () Bool)

(assert (=> b!552039 (= e!318536 (seekKeyOrZeroReturnVacant!0 (x!51775 lt!250880) (index!22837 lt!250880) (index!22837 lt!250880) k0!1914 a!3118 mask!3119))))

(declare-fun b!552040 () Bool)

(assert (=> b!552040 (= e!318534 e!318535)))

(assert (=> b!552040 (= lt!250879 (select (arr!16706 a!3118) (index!22837 lt!250880)))))

(declare-fun c!63987 () Bool)

(assert (=> b!552040 (= c!63987 (= lt!250879 k0!1914))))

(declare-fun b!552041 () Bool)

(assert (=> b!552041 (= e!318536 (MissingZero!5152 (index!22837 lt!250880)))))

(assert (= (and d!82925 c!63989) b!552036))

(assert (= (and d!82925 (not c!63989)) b!552040))

(assert (= (and b!552040 c!63987) b!552038))

(assert (= (and b!552040 (not c!63987)) b!552037))

(assert (= (and b!552037 c!63988) b!552041))

(assert (= (and b!552037 (not c!63988)) b!552039))

(declare-fun m!528525 () Bool)

(assert (=> d!82925 m!528525))

(declare-fun m!528527 () Bool)

(assert (=> d!82925 m!528527))

(declare-fun m!528529 () Bool)

(assert (=> d!82925 m!528529))

(assert (=> d!82925 m!528529))

(declare-fun m!528531 () Bool)

(assert (=> d!82925 m!528531))

(assert (=> d!82925 m!528403))

(declare-fun m!528533 () Bool)

(assert (=> d!82925 m!528533))

(declare-fun m!528535 () Bool)

(assert (=> b!552039 m!528535))

(declare-fun m!528537 () Bool)

(assert (=> b!552040 m!528537))

(assert (=> b!551899 d!82925))

(declare-fun b!552097 () Bool)

(declare-fun e!318574 () Bool)

(declare-fun call!32299 () Bool)

(assert (=> b!552097 (= e!318574 call!32299)))

(declare-fun b!552098 () Bool)

(declare-fun e!318575 () Bool)

(assert (=> b!552098 (= e!318575 call!32299)))

(declare-fun b!552099 () Bool)

(assert (=> b!552099 (= e!318574 e!318575)))

(declare-fun lt!250891 () (_ BitVec 64))

(assert (=> b!552099 (= lt!250891 (select (arr!16706 a!3118) j!142))))

(declare-fun lt!250893 () Unit!17064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34789 (_ BitVec 64) (_ BitVec 32)) Unit!17064)

(assert (=> b!552099 (= lt!250893 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250891 j!142))))

(assert (=> b!552099 (arrayContainsKey!0 a!3118 lt!250891 #b00000000000000000000000000000000)))

(declare-fun lt!250892 () Unit!17064)

(assert (=> b!552099 (= lt!250892 lt!250893)))

(declare-fun res!344760 () Bool)

(assert (=> b!552099 (= res!344760 (= (seekEntryOrOpen!0 (select (arr!16706 a!3118) j!142) a!3118 mask!3119) (Found!5152 j!142)))))

(assert (=> b!552099 (=> (not res!344760) (not e!318575))))

(declare-fun d!82927 () Bool)

(declare-fun res!344759 () Bool)

(declare-fun e!318573 () Bool)

(assert (=> d!82927 (=> res!344759 e!318573)))

(assert (=> d!82927 (= res!344759 (bvsge j!142 (size!17071 a!3118)))))

(assert (=> d!82927 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318573)))

(declare-fun bm!32296 () Bool)

(assert (=> bm!32296 (= call!32299 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!552100 () Bool)

(assert (=> b!552100 (= e!318573 e!318574)))

(declare-fun c!64005 () Bool)

(assert (=> b!552100 (= c!64005 (validKeyInArray!0 (select (arr!16706 a!3118) j!142)))))

(assert (= (and d!82927 (not res!344759)) b!552100))

(assert (= (and b!552100 c!64005) b!552099))

(assert (= (and b!552100 (not c!64005)) b!552097))

(assert (= (and b!552099 res!344760) b!552098))

(assert (= (or b!552098 b!552097) bm!32296))

(assert (=> b!552099 m!528373))

(declare-fun m!528561 () Bool)

(assert (=> b!552099 m!528561))

(declare-fun m!528563 () Bool)

(assert (=> b!552099 m!528563))

(assert (=> b!552099 m!528373))

(assert (=> b!552099 m!528379))

(declare-fun m!528565 () Bool)

(assert (=> bm!32296 m!528565))

(assert (=> b!552100 m!528373))

(assert (=> b!552100 m!528373))

(assert (=> b!552100 m!528375))

(assert (=> b!551900 d!82927))

(declare-fun d!82935 () Bool)

(assert (=> d!82935 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250904 () Unit!17064)

(declare-fun choose!38 (array!34789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17064)

(assert (=> d!82935 (= lt!250904 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!82935 (validMask!0 mask!3119)))

(assert (=> d!82935 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250904)))

(declare-fun bs!17168 () Bool)

(assert (= bs!17168 d!82935))

(assert (=> bs!17168 m!528381))

(declare-fun m!528567 () Bool)

(assert (=> bs!17168 m!528567))

(assert (=> bs!17168 m!528403))

(assert (=> b!551900 d!82935))

(declare-fun e!318596 () SeekEntryResult!5152)

(declare-fun b!552137 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552137 (= e!318596 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!250816 #b00000000000000000000000000000000 mask!3119) (select (arr!16706 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!552138 () Bool)

(declare-fun lt!250919 () SeekEntryResult!5152)

(assert (=> b!552138 (and (bvsge (index!22837 lt!250919) #b00000000000000000000000000000000) (bvslt (index!22837 lt!250919) (size!17071 a!3118)))))

(declare-fun res!344769 () Bool)

(assert (=> b!552138 (= res!344769 (= (select (arr!16706 a!3118) (index!22837 lt!250919)) (select (arr!16706 a!3118) j!142)))))

(declare-fun e!318598 () Bool)

(assert (=> b!552138 (=> res!344769 e!318598)))

(declare-fun e!318599 () Bool)

(assert (=> b!552138 (= e!318599 e!318598)))

(declare-fun b!552139 () Bool)

(declare-fun e!318597 () SeekEntryResult!5152)

(assert (=> b!552139 (= e!318597 (Intermediate!5152 true lt!250816 #b00000000000000000000000000000000))))

(declare-fun b!552140 () Bool)

(assert (=> b!552140 (and (bvsge (index!22837 lt!250919) #b00000000000000000000000000000000) (bvslt (index!22837 lt!250919) (size!17071 a!3118)))))

(assert (=> b!552140 (= e!318598 (= (select (arr!16706 a!3118) (index!22837 lt!250919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!552141 () Bool)

(assert (=> b!552141 (and (bvsge (index!22837 lt!250919) #b00000000000000000000000000000000) (bvslt (index!22837 lt!250919) (size!17071 a!3118)))))

(declare-fun res!344767 () Bool)

(assert (=> b!552141 (= res!344767 (= (select (arr!16706 a!3118) (index!22837 lt!250919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!552141 (=> res!344767 e!318598)))

(declare-fun b!552142 () Bool)

(declare-fun e!318595 () Bool)

(assert (=> b!552142 (= e!318595 e!318599)))

(declare-fun res!344768 () Bool)

(assert (=> b!552142 (= res!344768 (and ((_ is Intermediate!5152) lt!250919) (not (undefined!5964 lt!250919)) (bvslt (x!51775 lt!250919) #b01111111111111111111111111111110) (bvsge (x!51775 lt!250919) #b00000000000000000000000000000000) (bvsge (x!51775 lt!250919) #b00000000000000000000000000000000)))))

(assert (=> b!552142 (=> (not res!344768) (not e!318599))))

(declare-fun d!82941 () Bool)

(assert (=> d!82941 e!318595))

(declare-fun c!64022 () Bool)

(assert (=> d!82941 (= c!64022 (and ((_ is Intermediate!5152) lt!250919) (undefined!5964 lt!250919)))))

(assert (=> d!82941 (= lt!250919 e!318597)))

(declare-fun c!64023 () Bool)

(assert (=> d!82941 (= c!64023 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250918 () (_ BitVec 64))

(assert (=> d!82941 (= lt!250918 (select (arr!16706 a!3118) lt!250816))))

(assert (=> d!82941 (validMask!0 mask!3119)))

(assert (=> d!82941 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250816 (select (arr!16706 a!3118) j!142) a!3118 mask!3119) lt!250919)))

(declare-fun b!552143 () Bool)

(assert (=> b!552143 (= e!318597 e!318596)))

(declare-fun c!64021 () Bool)

(assert (=> b!552143 (= c!64021 (or (= lt!250918 (select (arr!16706 a!3118) j!142)) (= (bvadd lt!250918 lt!250918) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!552144 () Bool)

(assert (=> b!552144 (= e!318595 (bvsge (x!51775 lt!250919) #b01111111111111111111111111111110))))

(declare-fun b!552145 () Bool)

(assert (=> b!552145 (= e!318596 (Intermediate!5152 false lt!250816 #b00000000000000000000000000000000))))

(assert (= (and d!82941 c!64023) b!552139))

(assert (= (and d!82941 (not c!64023)) b!552143))

(assert (= (and b!552143 c!64021) b!552145))

(assert (= (and b!552143 (not c!64021)) b!552137))

(assert (= (and d!82941 c!64022) b!552144))

(assert (= (and d!82941 (not c!64022)) b!552142))

(assert (= (and b!552142 res!344768) b!552138))

(assert (= (and b!552138 (not res!344769)) b!552141))

(assert (= (and b!552141 (not res!344767)) b!552140))

(declare-fun m!528581 () Bool)

(assert (=> b!552138 m!528581))

(assert (=> b!552141 m!528581))

(declare-fun m!528583 () Bool)

(assert (=> d!82941 m!528583))

(assert (=> d!82941 m!528403))

(assert (=> b!552140 m!528581))

(declare-fun m!528585 () Bool)

(assert (=> b!552137 m!528585))

(assert (=> b!552137 m!528585))

(assert (=> b!552137 m!528373))

(declare-fun m!528587 () Bool)

(assert (=> b!552137 m!528587))

(assert (=> b!551898 d!82941))

(declare-fun e!318601 () SeekEntryResult!5152)

(declare-fun b!552146 () Bool)

(assert (=> b!552146 (= e!318601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!250817 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142) (array!34790 (store (arr!16706 a!3118) i!1132 k0!1914) (size!17071 a!3118)) mask!3119))))

(declare-fun b!552147 () Bool)

(declare-fun lt!250921 () SeekEntryResult!5152)

(assert (=> b!552147 (and (bvsge (index!22837 lt!250921) #b00000000000000000000000000000000) (bvslt (index!22837 lt!250921) (size!17071 (array!34790 (store (arr!16706 a!3118) i!1132 k0!1914) (size!17071 a!3118)))))))

(declare-fun res!344772 () Bool)

(assert (=> b!552147 (= res!344772 (= (select (arr!16706 (array!34790 (store (arr!16706 a!3118) i!1132 k0!1914) (size!17071 a!3118))) (index!22837 lt!250921)) (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!318603 () Bool)

(assert (=> b!552147 (=> res!344772 e!318603)))

(declare-fun e!318604 () Bool)

(assert (=> b!552147 (= e!318604 e!318603)))

(declare-fun b!552148 () Bool)

(declare-fun e!318602 () SeekEntryResult!5152)

(assert (=> b!552148 (= e!318602 (Intermediate!5152 true lt!250817 #b00000000000000000000000000000000))))

(declare-fun b!552149 () Bool)

(assert (=> b!552149 (and (bvsge (index!22837 lt!250921) #b00000000000000000000000000000000) (bvslt (index!22837 lt!250921) (size!17071 (array!34790 (store (arr!16706 a!3118) i!1132 k0!1914) (size!17071 a!3118)))))))

(assert (=> b!552149 (= e!318603 (= (select (arr!16706 (array!34790 (store (arr!16706 a!3118) i!1132 k0!1914) (size!17071 a!3118))) (index!22837 lt!250921)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!552150 () Bool)

(assert (=> b!552150 (and (bvsge (index!22837 lt!250921) #b00000000000000000000000000000000) (bvslt (index!22837 lt!250921) (size!17071 (array!34790 (store (arr!16706 a!3118) i!1132 k0!1914) (size!17071 a!3118)))))))

(declare-fun res!344770 () Bool)

(assert (=> b!552150 (= res!344770 (= (select (arr!16706 (array!34790 (store (arr!16706 a!3118) i!1132 k0!1914) (size!17071 a!3118))) (index!22837 lt!250921)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!552150 (=> res!344770 e!318603)))

(declare-fun b!552151 () Bool)

(declare-fun e!318600 () Bool)

(assert (=> b!552151 (= e!318600 e!318604)))

(declare-fun res!344771 () Bool)

(assert (=> b!552151 (= res!344771 (and ((_ is Intermediate!5152) lt!250921) (not (undefined!5964 lt!250921)) (bvslt (x!51775 lt!250921) #b01111111111111111111111111111110) (bvsge (x!51775 lt!250921) #b00000000000000000000000000000000) (bvsge (x!51775 lt!250921) #b00000000000000000000000000000000)))))

(assert (=> b!552151 (=> (not res!344771) (not e!318604))))

(declare-fun d!82953 () Bool)

(assert (=> d!82953 e!318600))

(declare-fun c!64025 () Bool)

(assert (=> d!82953 (= c!64025 (and ((_ is Intermediate!5152) lt!250921) (undefined!5964 lt!250921)))))

(assert (=> d!82953 (= lt!250921 e!318602)))

(declare-fun c!64026 () Bool)

(assert (=> d!82953 (= c!64026 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250920 () (_ BitVec 64))

(assert (=> d!82953 (= lt!250920 (select (arr!16706 (array!34790 (store (arr!16706 a!3118) i!1132 k0!1914) (size!17071 a!3118))) lt!250817))))

(assert (=> d!82953 (validMask!0 mask!3119)))

(assert (=> d!82953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250817 (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142) (array!34790 (store (arr!16706 a!3118) i!1132 k0!1914) (size!17071 a!3118)) mask!3119) lt!250921)))

(declare-fun b!552152 () Bool)

(assert (=> b!552152 (= e!318602 e!318601)))

(declare-fun c!64024 () Bool)

(assert (=> b!552152 (= c!64024 (or (= lt!250920 (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!250920 lt!250920) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!552153 () Bool)

(assert (=> b!552153 (= e!318600 (bvsge (x!51775 lt!250921) #b01111111111111111111111111111110))))

(declare-fun b!552154 () Bool)

(assert (=> b!552154 (= e!318601 (Intermediate!5152 false lt!250817 #b00000000000000000000000000000000))))

(assert (= (and d!82953 c!64026) b!552148))

(assert (= (and d!82953 (not c!64026)) b!552152))

(assert (= (and b!552152 c!64024) b!552154))

(assert (= (and b!552152 (not c!64024)) b!552146))

(assert (= (and d!82953 c!64025) b!552153))

(assert (= (and d!82953 (not c!64025)) b!552151))

(assert (= (and b!552151 res!344771) b!552147))

(assert (= (and b!552147 (not res!344772)) b!552150))

(assert (= (and b!552150 (not res!344770)) b!552149))

(declare-fun m!528589 () Bool)

(assert (=> b!552147 m!528589))

(assert (=> b!552150 m!528589))

(declare-fun m!528591 () Bool)

(assert (=> d!82953 m!528591))

(assert (=> d!82953 m!528403))

(assert (=> b!552149 m!528589))

(declare-fun m!528593 () Bool)

(assert (=> b!552146 m!528593))

(assert (=> b!552146 m!528593))

(assert (=> b!552146 m!528389))

(declare-fun m!528595 () Bool)

(assert (=> b!552146 m!528595))

(assert (=> b!551898 d!82953))

(declare-fun d!82957 () Bool)

(declare-fun lt!250933 () (_ BitVec 32))

(declare-fun lt!250932 () (_ BitVec 32))

(assert (=> d!82957 (= lt!250933 (bvmul (bvxor lt!250932 (bvlshr lt!250932 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82957 (= lt!250932 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82957 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344773 (let ((h!11807 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51781 (bvmul (bvxor h!11807 (bvlshr h!11807 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51781 (bvlshr x!51781 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344773 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344773 #b00000000000000000000000000000000))))))

(assert (=> d!82957 (= (toIndex!0 (select (store (arr!16706 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!250933 (bvlshr lt!250933 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551898 d!82957))

(declare-fun d!82959 () Bool)

(declare-fun lt!250935 () (_ BitVec 32))

(declare-fun lt!250934 () (_ BitVec 32))

(assert (=> d!82959 (= lt!250935 (bvmul (bvxor lt!250934 (bvlshr lt!250934 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82959 (= lt!250934 ((_ extract 31 0) (bvand (bvxor (select (arr!16706 a!3118) j!142) (bvlshr (select (arr!16706 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82959 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344773 (let ((h!11807 ((_ extract 31 0) (bvand (bvxor (select (arr!16706 a!3118) j!142) (bvlshr (select (arr!16706 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51781 (bvmul (bvxor h!11807 (bvlshr h!11807 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51781 (bvlshr x!51781 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344773 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344773 #b00000000000000000000000000000000))))))

(assert (=> d!82959 (= (toIndex!0 (select (arr!16706 a!3118) j!142) mask!3119) (bvand (bvxor lt!250935 (bvlshr lt!250935 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551898 d!82959))

(declare-fun d!82961 () Bool)

(declare-fun res!344780 () Bool)

(declare-fun e!318624 () Bool)

(assert (=> d!82961 (=> res!344780 e!318624)))

(assert (=> d!82961 (= res!344780 (= (select (arr!16706 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82961 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!318624)))

(declare-fun b!552187 () Bool)

(declare-fun e!318625 () Bool)

(assert (=> b!552187 (= e!318624 e!318625)))

(declare-fun res!344781 () Bool)

(assert (=> b!552187 (=> (not res!344781) (not e!318625))))

(assert (=> b!552187 (= res!344781 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17071 a!3118)))))

(declare-fun b!552188 () Bool)

(assert (=> b!552188 (= e!318625 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82961 (not res!344780)) b!552187))

(assert (= (and b!552187 res!344781) b!552188))

(assert (=> d!82961 m!528517))

(declare-fun m!528625 () Bool)

(assert (=> b!552188 m!528625))

(assert (=> b!551893 d!82961))

(declare-fun b!552189 () Bool)

(declare-fun e!318627 () Bool)

(declare-fun call!32301 () Bool)

(assert (=> b!552189 (= e!318627 call!32301)))

(declare-fun b!552190 () Bool)

(declare-fun e!318628 () Bool)

(assert (=> b!552190 (= e!318628 call!32301)))

(declare-fun b!552191 () Bool)

(assert (=> b!552191 (= e!318627 e!318628)))

(declare-fun lt!250945 () (_ BitVec 64))

(assert (=> b!552191 (= lt!250945 (select (arr!16706 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250947 () Unit!17064)

(assert (=> b!552191 (= lt!250947 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250945 #b00000000000000000000000000000000))))

(assert (=> b!552191 (arrayContainsKey!0 a!3118 lt!250945 #b00000000000000000000000000000000)))

(declare-fun lt!250946 () Unit!17064)

(assert (=> b!552191 (= lt!250946 lt!250947)))

(declare-fun res!344783 () Bool)

(assert (=> b!552191 (= res!344783 (= (seekEntryOrOpen!0 (select (arr!16706 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5152 #b00000000000000000000000000000000)))))

(assert (=> b!552191 (=> (not res!344783) (not e!318628))))

(declare-fun d!82967 () Bool)

(declare-fun res!344782 () Bool)

(declare-fun e!318626 () Bool)

(assert (=> d!82967 (=> res!344782 e!318626)))

(assert (=> d!82967 (= res!344782 (bvsge #b00000000000000000000000000000000 (size!17071 a!3118)))))

(assert (=> d!82967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318626)))

(declare-fun bm!32298 () Bool)

(assert (=> bm!32298 (= call!32301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!552192 () Bool)

(assert (=> b!552192 (= e!318626 e!318627)))

(declare-fun c!64040 () Bool)

(assert (=> b!552192 (= c!64040 (validKeyInArray!0 (select (arr!16706 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82967 (not res!344782)) b!552192))

(assert (= (and b!552192 c!64040) b!552191))

(assert (= (and b!552192 (not c!64040)) b!552189))

(assert (= (and b!552191 res!344783) b!552190))

(assert (= (or b!552190 b!552189) bm!32298))

(assert (=> b!552191 m!528517))

(declare-fun m!528631 () Bool)

(assert (=> b!552191 m!528631))

(declare-fun m!528633 () Bool)

(assert (=> b!552191 m!528633))

(assert (=> b!552191 m!528517))

(declare-fun m!528635 () Bool)

(assert (=> b!552191 m!528635))

(declare-fun m!528637 () Bool)

(assert (=> bm!32298 m!528637))

(assert (=> b!552192 m!528517))

(assert (=> b!552192 m!528517))

(assert (=> b!552192 m!528523))

(assert (=> b!551902 d!82967))

(check-sat (not d!82941) (not b!552137) (not b!552027) (not b!552039) (not d!82953) (not bm!32290) (not b!552029) (not bm!32296) (not d!82925) (not b!552030) (not b!552146) (not b!552008) (not d!82903) (not b!552100) (not b!552191) (not b!552099) (not b!552192) (not d!82935) (not bm!32298) (not b!552188))
(check-sat)
