; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52604 () Bool)

(assert start!52604)

(declare-fun b!573893 () Bool)

(declare-fun e!330162 () Bool)

(declare-fun e!330160 () Bool)

(assert (=> b!573893 (= e!330162 e!330160)))

(declare-fun res!363003 () Bool)

(assert (=> b!573893 (=> (not res!363003) (not e!330160))))

(declare-datatypes ((SeekEntryResult!5674 0))(
  ( (MissingZero!5674 (index!24923 (_ BitVec 32))) (Found!5674 (index!24924 (_ BitVec 32))) (Intermediate!5674 (undefined!6486 Bool) (index!24925 (_ BitVec 32)) (x!53812 (_ BitVec 32))) (Undefined!5674) (MissingVacant!5674 (index!24926 (_ BitVec 32))) )
))
(declare-fun lt!262000 () SeekEntryResult!5674)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573893 (= res!363003 (or (= lt!262000 (MissingZero!5674 i!1132)) (= lt!262000 (MissingVacant!5674 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35884 0))(
  ( (array!35885 (arr!17228 (Array (_ BitVec 32) (_ BitVec 64))) (size!17593 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35884)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35884 (_ BitVec 32)) SeekEntryResult!5674)

(assert (=> b!573893 (= lt!262000 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!573894 () Bool)

(declare-fun res!362999 () Bool)

(assert (=> b!573894 (=> (not res!362999) (not e!330162))))

(declare-fun arrayContainsKey!0 (array!35884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573894 (= res!362999 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573895 () Bool)

(declare-fun e!330161 () Bool)

(declare-fun e!330158 () Bool)

(assert (=> b!573895 (= e!330161 e!330158)))

(declare-fun res!363005 () Bool)

(assert (=> b!573895 (=> res!363005 e!330158)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261992 () (_ BitVec 64))

(assert (=> b!573895 (= res!363005 (or (= lt!261992 (select (arr!17228 a!3118) j!142)) (= lt!261992 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!261999 () SeekEntryResult!5674)

(assert (=> b!573895 (= lt!261992 (select (arr!17228 a!3118) (index!24925 lt!261999)))))

(declare-fun b!573896 () Bool)

(declare-fun e!330159 () Bool)

(get-info :version)

(assert (=> b!573896 (= e!330159 (not (or (undefined!6486 lt!261999) (not ((_ is Intermediate!5674) lt!261999)) (let ((bdg!18009 (select (arr!17228 a!3118) (index!24925 lt!261999)))) (or (= bdg!18009 (select (arr!17228 a!3118) j!142)) (= bdg!18009 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24925 lt!261999) #b00000000000000000000000000000000) (bvsge (index!24925 lt!261999) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53812 lt!261999) #b01111111111111111111111111111110) (bvslt (x!53812 lt!261999) #b00000000000000000000000000000000) (= bdg!18009 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330156 () Bool)

(assert (=> b!573896 e!330156))

(declare-fun res!363000 () Bool)

(assert (=> b!573896 (=> (not res!363000) (not e!330156))))

(declare-fun lt!261998 () SeekEntryResult!5674)

(assert (=> b!573896 (= res!363000 (= lt!261998 (Found!5674 j!142)))))

(assert (=> b!573896 (= lt!261998 (seekEntryOrOpen!0 (select (arr!17228 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35884 (_ BitVec 32)) Bool)

(assert (=> b!573896 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18036 0))(
  ( (Unit!18037) )
))
(declare-fun lt!261996 () Unit!18036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18036)

(assert (=> b!573896 (= lt!261996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573897 () Bool)

(assert (=> b!573897 (= e!330160 e!330159)))

(declare-fun res!363002 () Bool)

(assert (=> b!573897 (=> (not res!363002) (not e!330159))))

(declare-fun lt!261997 () (_ BitVec 64))

(declare-fun lt!261995 () (_ BitVec 32))

(declare-fun lt!261994 () array!35884)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35884 (_ BitVec 32)) SeekEntryResult!5674)

(assert (=> b!573897 (= res!363002 (= lt!261999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261995 lt!261997 lt!261994 mask!3119)))))

(declare-fun lt!261993 () (_ BitVec 32))

(assert (=> b!573897 (= lt!261999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261993 (select (arr!17228 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573897 (= lt!261995 (toIndex!0 lt!261997 mask!3119))))

(assert (=> b!573897 (= lt!261997 (select (store (arr!17228 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!573897 (= lt!261993 (toIndex!0 (select (arr!17228 a!3118) j!142) mask!3119))))

(assert (=> b!573897 (= lt!261994 (array!35885 (store (arr!17228 a!3118) i!1132 k0!1914) (size!17593 a!3118)))))

(declare-fun b!573898 () Bool)

(assert (=> b!573898 (= e!330156 e!330161)))

(declare-fun res!363008 () Bool)

(assert (=> b!573898 (=> res!363008 e!330161)))

(assert (=> b!573898 (= res!363008 (or (undefined!6486 lt!261999) (not ((_ is Intermediate!5674) lt!261999))))))

(declare-fun b!573899 () Bool)

(declare-fun e!330155 () Bool)

(assert (=> b!573899 (= e!330158 e!330155)))

(declare-fun res!363004 () Bool)

(assert (=> b!573899 (=> (not res!363004) (not e!330155))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35884 (_ BitVec 32)) SeekEntryResult!5674)

(assert (=> b!573899 (= res!363004 (= lt!261998 (seekKeyOrZeroReturnVacant!0 (x!53812 lt!261999) (index!24925 lt!261999) (index!24925 lt!261999) (select (arr!17228 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573900 () Bool)

(declare-fun res!362998 () Bool)

(assert (=> b!573900 (=> (not res!362998) (not e!330162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573900 (= res!362998 (validKeyInArray!0 k0!1914))))

(declare-fun b!573892 () Bool)

(declare-fun res!362997 () Bool)

(assert (=> b!573892 (=> (not res!362997) (not e!330160))))

(assert (=> b!573892 (= res!362997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!363007 () Bool)

(assert (=> start!52604 (=> (not res!363007) (not e!330162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52604 (= res!363007 (validMask!0 mask!3119))))

(assert (=> start!52604 e!330162))

(assert (=> start!52604 true))

(declare-fun array_inv!13111 (array!35884) Bool)

(assert (=> start!52604 (array_inv!13111 a!3118)))

(declare-fun b!573901 () Bool)

(assert (=> b!573901 (= e!330155 (= (seekEntryOrOpen!0 lt!261997 lt!261994 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53812 lt!261999) (index!24925 lt!261999) (index!24925 lt!261999) lt!261997 lt!261994 mask!3119)))))

(declare-fun b!573902 () Bool)

(declare-fun res!363001 () Bool)

(assert (=> b!573902 (=> (not res!363001) (not e!330160))))

(declare-datatypes ((List!11347 0))(
  ( (Nil!11344) (Cons!11343 (h!12376 (_ BitVec 64)) (t!17566 List!11347)) )
))
(declare-fun arrayNoDuplicates!0 (array!35884 (_ BitVec 32) List!11347) Bool)

(assert (=> b!573902 (= res!363001 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11344))))

(declare-fun b!573903 () Bool)

(declare-fun res!362996 () Bool)

(assert (=> b!573903 (=> (not res!362996) (not e!330162))))

(assert (=> b!573903 (= res!362996 (and (= (size!17593 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17593 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17593 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573904 () Bool)

(declare-fun res!363006 () Bool)

(assert (=> b!573904 (=> (not res!363006) (not e!330162))))

(assert (=> b!573904 (= res!363006 (validKeyInArray!0 (select (arr!17228 a!3118) j!142)))))

(assert (= (and start!52604 res!363007) b!573903))

(assert (= (and b!573903 res!362996) b!573904))

(assert (= (and b!573904 res!363006) b!573900))

(assert (= (and b!573900 res!362998) b!573894))

(assert (= (and b!573894 res!362999) b!573893))

(assert (= (and b!573893 res!363003) b!573892))

(assert (= (and b!573892 res!362997) b!573902))

(assert (= (and b!573902 res!363001) b!573897))

(assert (= (and b!573897 res!363002) b!573896))

(assert (= (and b!573896 res!363000) b!573898))

(assert (= (and b!573898 (not res!363008)) b!573895))

(assert (= (and b!573895 (not res!363005)) b!573899))

(assert (= (and b!573899 res!363004) b!573901))

(declare-fun m!552305 () Bool)

(assert (=> b!573896 m!552305))

(declare-fun m!552307 () Bool)

(assert (=> b!573896 m!552307))

(declare-fun m!552309 () Bool)

(assert (=> b!573896 m!552309))

(declare-fun m!552311 () Bool)

(assert (=> b!573896 m!552311))

(assert (=> b!573896 m!552305))

(declare-fun m!552313 () Bool)

(assert (=> b!573896 m!552313))

(declare-fun m!552315 () Bool)

(assert (=> b!573892 m!552315))

(declare-fun m!552317 () Bool)

(assert (=> b!573902 m!552317))

(declare-fun m!552319 () Bool)

(assert (=> b!573897 m!552319))

(assert (=> b!573897 m!552305))

(declare-fun m!552321 () Bool)

(assert (=> b!573897 m!552321))

(declare-fun m!552323 () Bool)

(assert (=> b!573897 m!552323))

(assert (=> b!573897 m!552305))

(declare-fun m!552325 () Bool)

(assert (=> b!573897 m!552325))

(declare-fun m!552327 () Bool)

(assert (=> b!573897 m!552327))

(assert (=> b!573897 m!552305))

(declare-fun m!552329 () Bool)

(assert (=> b!573897 m!552329))

(assert (=> b!573904 m!552305))

(assert (=> b!573904 m!552305))

(declare-fun m!552331 () Bool)

(assert (=> b!573904 m!552331))

(declare-fun m!552333 () Bool)

(assert (=> b!573893 m!552333))

(assert (=> b!573895 m!552305))

(assert (=> b!573895 m!552307))

(declare-fun m!552335 () Bool)

(assert (=> b!573901 m!552335))

(declare-fun m!552337 () Bool)

(assert (=> b!573901 m!552337))

(declare-fun m!552339 () Bool)

(assert (=> b!573894 m!552339))

(assert (=> b!573899 m!552305))

(assert (=> b!573899 m!552305))

(declare-fun m!552341 () Bool)

(assert (=> b!573899 m!552341))

(declare-fun m!552343 () Bool)

(assert (=> start!52604 m!552343))

(declare-fun m!552345 () Bool)

(assert (=> start!52604 m!552345))

(declare-fun m!552347 () Bool)

(assert (=> b!573900 m!552347))

(check-sat (not b!573902) (not b!573900) (not b!573896) (not start!52604) (not b!573901) (not b!573894) (not b!573904) (not b!573899) (not b!573893) (not b!573892) (not b!573897))
(check-sat)
(get-model)

(declare-fun d!84863 () Bool)

(assert (=> d!84863 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52604 d!84863))

(declare-fun d!84865 () Bool)

(assert (=> d!84865 (= (array_inv!13111 a!3118) (bvsge (size!17593 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52604 d!84865))

(declare-fun d!84867 () Bool)

(assert (=> d!84867 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573900 d!84867))

(declare-fun b!574013 () Bool)

(declare-fun c!65822 () Bool)

(declare-fun lt!262065 () (_ BitVec 64))

(assert (=> b!574013 (= c!65822 (= lt!262065 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330229 () SeekEntryResult!5674)

(declare-fun e!330227 () SeekEntryResult!5674)

(assert (=> b!574013 (= e!330229 e!330227)))

(declare-fun d!84869 () Bool)

(declare-fun lt!262067 () SeekEntryResult!5674)

(assert (=> d!84869 (and (or ((_ is Undefined!5674) lt!262067) (not ((_ is Found!5674) lt!262067)) (and (bvsge (index!24924 lt!262067) #b00000000000000000000000000000000) (bvslt (index!24924 lt!262067) (size!17593 lt!261994)))) (or ((_ is Undefined!5674) lt!262067) ((_ is Found!5674) lt!262067) (not ((_ is MissingZero!5674) lt!262067)) (and (bvsge (index!24923 lt!262067) #b00000000000000000000000000000000) (bvslt (index!24923 lt!262067) (size!17593 lt!261994)))) (or ((_ is Undefined!5674) lt!262067) ((_ is Found!5674) lt!262067) ((_ is MissingZero!5674) lt!262067) (not ((_ is MissingVacant!5674) lt!262067)) (and (bvsge (index!24926 lt!262067) #b00000000000000000000000000000000) (bvslt (index!24926 lt!262067) (size!17593 lt!261994)))) (or ((_ is Undefined!5674) lt!262067) (ite ((_ is Found!5674) lt!262067) (= (select (arr!17228 lt!261994) (index!24924 lt!262067)) lt!261997) (ite ((_ is MissingZero!5674) lt!262067) (= (select (arr!17228 lt!261994) (index!24923 lt!262067)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5674) lt!262067) (= (select (arr!17228 lt!261994) (index!24926 lt!262067)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330228 () SeekEntryResult!5674)

(assert (=> d!84869 (= lt!262067 e!330228)))

(declare-fun c!65821 () Bool)

(declare-fun lt!262066 () SeekEntryResult!5674)

(assert (=> d!84869 (= c!65821 (and ((_ is Intermediate!5674) lt!262066) (undefined!6486 lt!262066)))))

(assert (=> d!84869 (= lt!262066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!261997 mask!3119) lt!261997 lt!261994 mask!3119))))

(assert (=> d!84869 (validMask!0 mask!3119)))

(assert (=> d!84869 (= (seekEntryOrOpen!0 lt!261997 lt!261994 mask!3119) lt!262067)))

(declare-fun b!574014 () Bool)

(assert (=> b!574014 (= e!330227 (MissingZero!5674 (index!24925 lt!262066)))))

(declare-fun b!574015 () Bool)

(assert (=> b!574015 (= e!330229 (Found!5674 (index!24925 lt!262066)))))

(declare-fun b!574016 () Bool)

(assert (=> b!574016 (= e!330228 e!330229)))

(assert (=> b!574016 (= lt!262065 (select (arr!17228 lt!261994) (index!24925 lt!262066)))))

(declare-fun c!65823 () Bool)

(assert (=> b!574016 (= c!65823 (= lt!262065 lt!261997))))

(declare-fun b!574017 () Bool)

(assert (=> b!574017 (= e!330228 Undefined!5674)))

(declare-fun b!574018 () Bool)

(assert (=> b!574018 (= e!330227 (seekKeyOrZeroReturnVacant!0 (x!53812 lt!262066) (index!24925 lt!262066) (index!24925 lt!262066) lt!261997 lt!261994 mask!3119))))

(assert (= (and d!84869 c!65821) b!574017))

(assert (= (and d!84869 (not c!65821)) b!574016))

(assert (= (and b!574016 c!65823) b!574015))

(assert (= (and b!574016 (not c!65823)) b!574013))

(assert (= (and b!574013 c!65822) b!574014))

(assert (= (and b!574013 (not c!65822)) b!574018))

(declare-fun m!552437 () Bool)

(assert (=> d!84869 m!552437))

(declare-fun m!552439 () Bool)

(assert (=> d!84869 m!552439))

(assert (=> d!84869 m!552323))

(assert (=> d!84869 m!552343))

(assert (=> d!84869 m!552323))

(declare-fun m!552441 () Bool)

(assert (=> d!84869 m!552441))

(declare-fun m!552443 () Bool)

(assert (=> d!84869 m!552443))

(declare-fun m!552445 () Bool)

(assert (=> b!574016 m!552445))

(declare-fun m!552447 () Bool)

(assert (=> b!574018 m!552447))

(assert (=> b!573901 d!84869))

(declare-fun lt!262094 () SeekEntryResult!5674)

(declare-fun d!84879 () Bool)

(assert (=> d!84879 (and (or ((_ is Undefined!5674) lt!262094) (not ((_ is Found!5674) lt!262094)) (and (bvsge (index!24924 lt!262094) #b00000000000000000000000000000000) (bvslt (index!24924 lt!262094) (size!17593 lt!261994)))) (or ((_ is Undefined!5674) lt!262094) ((_ is Found!5674) lt!262094) (not ((_ is MissingVacant!5674) lt!262094)) (not (= (index!24926 lt!262094) (index!24925 lt!261999))) (and (bvsge (index!24926 lt!262094) #b00000000000000000000000000000000) (bvslt (index!24926 lt!262094) (size!17593 lt!261994)))) (or ((_ is Undefined!5674) lt!262094) (ite ((_ is Found!5674) lt!262094) (= (select (arr!17228 lt!261994) (index!24924 lt!262094)) lt!261997) (and ((_ is MissingVacant!5674) lt!262094) (= (index!24926 lt!262094) (index!24925 lt!261999)) (= (select (arr!17228 lt!261994) (index!24926 lt!262094)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330255 () SeekEntryResult!5674)

(assert (=> d!84879 (= lt!262094 e!330255)))

(declare-fun c!65845 () Bool)

(assert (=> d!84879 (= c!65845 (bvsge (x!53812 lt!261999) #b01111111111111111111111111111110))))

(declare-fun lt!262093 () (_ BitVec 64))

(assert (=> d!84879 (= lt!262093 (select (arr!17228 lt!261994) (index!24925 lt!261999)))))

(assert (=> d!84879 (validMask!0 mask!3119)))

(assert (=> d!84879 (= (seekKeyOrZeroReturnVacant!0 (x!53812 lt!261999) (index!24925 lt!261999) (index!24925 lt!261999) lt!261997 lt!261994 mask!3119) lt!262094)))

(declare-fun b!574067 () Bool)

(assert (=> b!574067 (= e!330255 Undefined!5674)))

(declare-fun b!574068 () Bool)

(declare-fun e!330257 () SeekEntryResult!5674)

(assert (=> b!574068 (= e!330255 e!330257)))

(declare-fun c!65846 () Bool)

(assert (=> b!574068 (= c!65846 (= lt!262093 lt!261997))))

(declare-fun e!330256 () SeekEntryResult!5674)

(declare-fun b!574069 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574069 (= e!330256 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53812 lt!261999) #b00000000000000000000000000000001) (nextIndex!0 (index!24925 lt!261999) (x!53812 lt!261999) mask!3119) (index!24925 lt!261999) lt!261997 lt!261994 mask!3119))))

(declare-fun b!574070 () Bool)

(assert (=> b!574070 (= e!330257 (Found!5674 (index!24925 lt!261999)))))

(declare-fun b!574071 () Bool)

(declare-fun c!65847 () Bool)

(assert (=> b!574071 (= c!65847 (= lt!262093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574071 (= e!330257 e!330256)))

(declare-fun b!574072 () Bool)

(assert (=> b!574072 (= e!330256 (MissingVacant!5674 (index!24925 lt!261999)))))

(assert (= (and d!84879 c!65845) b!574067))

(assert (= (and d!84879 (not c!65845)) b!574068))

(assert (= (and b!574068 c!65846) b!574070))

(assert (= (and b!574068 (not c!65846)) b!574071))

(assert (= (and b!574071 c!65847) b!574072))

(assert (= (and b!574071 (not c!65847)) b!574069))

(declare-fun m!552477 () Bool)

(assert (=> d!84879 m!552477))

(declare-fun m!552479 () Bool)

(assert (=> d!84879 m!552479))

(declare-fun m!552481 () Bool)

(assert (=> d!84879 m!552481))

(assert (=> d!84879 m!552343))

(declare-fun m!552483 () Bool)

(assert (=> b!574069 m!552483))

(assert (=> b!574069 m!552483))

(declare-fun m!552485 () Bool)

(assert (=> b!574069 m!552485))

(assert (=> b!573901 d!84879))

(declare-fun b!574125 () Bool)

(declare-fun e!330288 () Bool)

(declare-fun contains!2869 (List!11347 (_ BitVec 64)) Bool)

(assert (=> b!574125 (= e!330288 (contains!2869 Nil!11344 (select (arr!17228 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574126 () Bool)

(declare-fun e!330289 () Bool)

(declare-fun e!330290 () Bool)

(assert (=> b!574126 (= e!330289 e!330290)))

(declare-fun res!363107 () Bool)

(assert (=> b!574126 (=> (not res!363107) (not e!330290))))

(assert (=> b!574126 (= res!363107 (not e!330288))))

(declare-fun res!363108 () Bool)

(assert (=> b!574126 (=> (not res!363108) (not e!330288))))

(assert (=> b!574126 (= res!363108 (validKeyInArray!0 (select (arr!17228 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84891 () Bool)

(declare-fun res!363106 () Bool)

(assert (=> d!84891 (=> res!363106 e!330289)))

(assert (=> d!84891 (= res!363106 (bvsge #b00000000000000000000000000000000 (size!17593 a!3118)))))

(assert (=> d!84891 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11344) e!330289)))

(declare-fun bm!32641 () Bool)

(declare-fun call!32644 () Bool)

(declare-fun c!65871 () Bool)

(assert (=> bm!32641 (= call!32644 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65871 (Cons!11343 (select (arr!17228 a!3118) #b00000000000000000000000000000000) Nil!11344) Nil!11344)))))

(declare-fun b!574127 () Bool)

(declare-fun e!330287 () Bool)

(assert (=> b!574127 (= e!330290 e!330287)))

(assert (=> b!574127 (= c!65871 (validKeyInArray!0 (select (arr!17228 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574128 () Bool)

(assert (=> b!574128 (= e!330287 call!32644)))

(declare-fun b!574129 () Bool)

(assert (=> b!574129 (= e!330287 call!32644)))

(assert (= (and d!84891 (not res!363106)) b!574126))

(assert (= (and b!574126 res!363108) b!574125))

(assert (= (and b!574126 res!363107) b!574127))

(assert (= (and b!574127 c!65871) b!574128))

(assert (= (and b!574127 (not c!65871)) b!574129))

(assert (= (or b!574128 b!574129) bm!32641))

(declare-fun m!552515 () Bool)

(assert (=> b!574125 m!552515))

(assert (=> b!574125 m!552515))

(declare-fun m!552517 () Bool)

(assert (=> b!574125 m!552517))

(assert (=> b!574126 m!552515))

(assert (=> b!574126 m!552515))

(declare-fun m!552519 () Bool)

(assert (=> b!574126 m!552519))

(assert (=> bm!32641 m!552515))

(declare-fun m!552521 () Bool)

(assert (=> bm!32641 m!552521))

(assert (=> b!574127 m!552515))

(assert (=> b!574127 m!552515))

(assert (=> b!574127 m!552519))

(assert (=> b!573902 d!84891))

(declare-fun d!84899 () Bool)

(declare-fun lt!262116 () SeekEntryResult!5674)

(assert (=> d!84899 (and (or ((_ is Undefined!5674) lt!262116) (not ((_ is Found!5674) lt!262116)) (and (bvsge (index!24924 lt!262116) #b00000000000000000000000000000000) (bvslt (index!24924 lt!262116) (size!17593 a!3118)))) (or ((_ is Undefined!5674) lt!262116) ((_ is Found!5674) lt!262116) (not ((_ is MissingVacant!5674) lt!262116)) (not (= (index!24926 lt!262116) (index!24925 lt!261999))) (and (bvsge (index!24926 lt!262116) #b00000000000000000000000000000000) (bvslt (index!24926 lt!262116) (size!17593 a!3118)))) (or ((_ is Undefined!5674) lt!262116) (ite ((_ is Found!5674) lt!262116) (= (select (arr!17228 a!3118) (index!24924 lt!262116)) (select (arr!17228 a!3118) j!142)) (and ((_ is MissingVacant!5674) lt!262116) (= (index!24926 lt!262116) (index!24925 lt!261999)) (= (select (arr!17228 a!3118) (index!24926 lt!262116)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330294 () SeekEntryResult!5674)

(assert (=> d!84899 (= lt!262116 e!330294)))

(declare-fun c!65875 () Bool)

(assert (=> d!84899 (= c!65875 (bvsge (x!53812 lt!261999) #b01111111111111111111111111111110))))

(declare-fun lt!262115 () (_ BitVec 64))

(assert (=> d!84899 (= lt!262115 (select (arr!17228 a!3118) (index!24925 lt!261999)))))

(assert (=> d!84899 (validMask!0 mask!3119)))

(assert (=> d!84899 (= (seekKeyOrZeroReturnVacant!0 (x!53812 lt!261999) (index!24925 lt!261999) (index!24925 lt!261999) (select (arr!17228 a!3118) j!142) a!3118 mask!3119) lt!262116)))

(declare-fun b!574136 () Bool)

(assert (=> b!574136 (= e!330294 Undefined!5674)))

(declare-fun b!574137 () Bool)

(declare-fun e!330296 () SeekEntryResult!5674)

(assert (=> b!574137 (= e!330294 e!330296)))

(declare-fun c!65876 () Bool)

(assert (=> b!574137 (= c!65876 (= lt!262115 (select (arr!17228 a!3118) j!142)))))

(declare-fun b!574138 () Bool)

(declare-fun e!330295 () SeekEntryResult!5674)

(assert (=> b!574138 (= e!330295 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53812 lt!261999) #b00000000000000000000000000000001) (nextIndex!0 (index!24925 lt!261999) (x!53812 lt!261999) mask!3119) (index!24925 lt!261999) (select (arr!17228 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574139 () Bool)

(assert (=> b!574139 (= e!330296 (Found!5674 (index!24925 lt!261999)))))

(declare-fun b!574140 () Bool)

(declare-fun c!65877 () Bool)

(assert (=> b!574140 (= c!65877 (= lt!262115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574140 (= e!330296 e!330295)))

(declare-fun b!574141 () Bool)

(assert (=> b!574141 (= e!330295 (MissingVacant!5674 (index!24925 lt!261999)))))

(assert (= (and d!84899 c!65875) b!574136))

(assert (= (and d!84899 (not c!65875)) b!574137))

(assert (= (and b!574137 c!65876) b!574139))

(assert (= (and b!574137 (not c!65876)) b!574140))

(assert (= (and b!574140 c!65877) b!574141))

(assert (= (and b!574140 (not c!65877)) b!574138))

(declare-fun m!552535 () Bool)

(assert (=> d!84899 m!552535))

(declare-fun m!552537 () Bool)

(assert (=> d!84899 m!552537))

(assert (=> d!84899 m!552307))

(assert (=> d!84899 m!552343))

(assert (=> b!574138 m!552483))

(assert (=> b!574138 m!552483))

(assert (=> b!574138 m!552305))

(declare-fun m!552539 () Bool)

(assert (=> b!574138 m!552539))

(assert (=> b!573899 d!84899))

(declare-fun b!574142 () Bool)

(declare-fun c!65879 () Bool)

(declare-fun lt!262117 () (_ BitVec 64))

(assert (=> b!574142 (= c!65879 (= lt!262117 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330299 () SeekEntryResult!5674)

(declare-fun e!330297 () SeekEntryResult!5674)

(assert (=> b!574142 (= e!330299 e!330297)))

(declare-fun d!84903 () Bool)

(declare-fun lt!262119 () SeekEntryResult!5674)

(assert (=> d!84903 (and (or ((_ is Undefined!5674) lt!262119) (not ((_ is Found!5674) lt!262119)) (and (bvsge (index!24924 lt!262119) #b00000000000000000000000000000000) (bvslt (index!24924 lt!262119) (size!17593 a!3118)))) (or ((_ is Undefined!5674) lt!262119) ((_ is Found!5674) lt!262119) (not ((_ is MissingZero!5674) lt!262119)) (and (bvsge (index!24923 lt!262119) #b00000000000000000000000000000000) (bvslt (index!24923 lt!262119) (size!17593 a!3118)))) (or ((_ is Undefined!5674) lt!262119) ((_ is Found!5674) lt!262119) ((_ is MissingZero!5674) lt!262119) (not ((_ is MissingVacant!5674) lt!262119)) (and (bvsge (index!24926 lt!262119) #b00000000000000000000000000000000) (bvslt (index!24926 lt!262119) (size!17593 a!3118)))) (or ((_ is Undefined!5674) lt!262119) (ite ((_ is Found!5674) lt!262119) (= (select (arr!17228 a!3118) (index!24924 lt!262119)) (select (arr!17228 a!3118) j!142)) (ite ((_ is MissingZero!5674) lt!262119) (= (select (arr!17228 a!3118) (index!24923 lt!262119)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5674) lt!262119) (= (select (arr!17228 a!3118) (index!24926 lt!262119)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330298 () SeekEntryResult!5674)

(assert (=> d!84903 (= lt!262119 e!330298)))

(declare-fun c!65878 () Bool)

(declare-fun lt!262118 () SeekEntryResult!5674)

(assert (=> d!84903 (= c!65878 (and ((_ is Intermediate!5674) lt!262118) (undefined!6486 lt!262118)))))

(assert (=> d!84903 (= lt!262118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17228 a!3118) j!142) mask!3119) (select (arr!17228 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84903 (validMask!0 mask!3119)))

(assert (=> d!84903 (= (seekEntryOrOpen!0 (select (arr!17228 a!3118) j!142) a!3118 mask!3119) lt!262119)))

(declare-fun b!574143 () Bool)

(assert (=> b!574143 (= e!330297 (MissingZero!5674 (index!24925 lt!262118)))))

(declare-fun b!574144 () Bool)

(assert (=> b!574144 (= e!330299 (Found!5674 (index!24925 lt!262118)))))

(declare-fun b!574145 () Bool)

(assert (=> b!574145 (= e!330298 e!330299)))

(assert (=> b!574145 (= lt!262117 (select (arr!17228 a!3118) (index!24925 lt!262118)))))

(declare-fun c!65880 () Bool)

(assert (=> b!574145 (= c!65880 (= lt!262117 (select (arr!17228 a!3118) j!142)))))

(declare-fun b!574146 () Bool)

(assert (=> b!574146 (= e!330298 Undefined!5674)))

(declare-fun b!574147 () Bool)

(assert (=> b!574147 (= e!330297 (seekKeyOrZeroReturnVacant!0 (x!53812 lt!262118) (index!24925 lt!262118) (index!24925 lt!262118) (select (arr!17228 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!84903 c!65878) b!574146))

(assert (= (and d!84903 (not c!65878)) b!574145))

(assert (= (and b!574145 c!65880) b!574144))

(assert (= (and b!574145 (not c!65880)) b!574142))

(assert (= (and b!574142 c!65879) b!574143))

(assert (= (and b!574142 (not c!65879)) b!574147))

(declare-fun m!552541 () Bool)

(assert (=> d!84903 m!552541))

(declare-fun m!552543 () Bool)

(assert (=> d!84903 m!552543))

(assert (=> d!84903 m!552305))

(assert (=> d!84903 m!552321))

(assert (=> d!84903 m!552343))

(assert (=> d!84903 m!552321))

(assert (=> d!84903 m!552305))

(declare-fun m!552545 () Bool)

(assert (=> d!84903 m!552545))

(declare-fun m!552547 () Bool)

(assert (=> d!84903 m!552547))

(declare-fun m!552549 () Bool)

(assert (=> b!574145 m!552549))

(assert (=> b!574147 m!552305))

(declare-fun m!552551 () Bool)

(assert (=> b!574147 m!552551))

(assert (=> b!573896 d!84903))

(declare-fun b!574190 () Bool)

(declare-fun e!330330 () Bool)

(declare-fun e!330331 () Bool)

(assert (=> b!574190 (= e!330330 e!330331)))

(declare-fun lt!262154 () (_ BitVec 64))

(assert (=> b!574190 (= lt!262154 (select (arr!17228 a!3118) j!142))))

(declare-fun lt!262153 () Unit!18036)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35884 (_ BitVec 64) (_ BitVec 32)) Unit!18036)

(assert (=> b!574190 (= lt!262153 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262154 j!142))))

(assert (=> b!574190 (arrayContainsKey!0 a!3118 lt!262154 #b00000000000000000000000000000000)))

(declare-fun lt!262155 () Unit!18036)

(assert (=> b!574190 (= lt!262155 lt!262153)))

(declare-fun res!363127 () Bool)

(assert (=> b!574190 (= res!363127 (= (seekEntryOrOpen!0 (select (arr!17228 a!3118) j!142) a!3118 mask!3119) (Found!5674 j!142)))))

(assert (=> b!574190 (=> (not res!363127) (not e!330331))))

(declare-fun d!84905 () Bool)

(declare-fun res!363128 () Bool)

(declare-fun e!330332 () Bool)

(assert (=> d!84905 (=> res!363128 e!330332)))

(assert (=> d!84905 (= res!363128 (bvsge j!142 (size!17593 a!3118)))))

(assert (=> d!84905 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330332)))

(declare-fun b!574191 () Bool)

(assert (=> b!574191 (= e!330332 e!330330)))

(declare-fun c!65893 () Bool)

(assert (=> b!574191 (= c!65893 (validKeyInArray!0 (select (arr!17228 a!3118) j!142)))))

(declare-fun bm!32651 () Bool)

(declare-fun call!32654 () Bool)

(assert (=> bm!32651 (= call!32654 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574192 () Bool)

(assert (=> b!574192 (= e!330330 call!32654)))

(declare-fun b!574193 () Bool)

(assert (=> b!574193 (= e!330331 call!32654)))

(assert (= (and d!84905 (not res!363128)) b!574191))

(assert (= (and b!574191 c!65893) b!574190))

(assert (= (and b!574191 (not c!65893)) b!574192))

(assert (= (and b!574190 res!363127) b!574193))

(assert (= (or b!574193 b!574192) bm!32651))

(assert (=> b!574190 m!552305))

(declare-fun m!552585 () Bool)

(assert (=> b!574190 m!552585))

(declare-fun m!552589 () Bool)

(assert (=> b!574190 m!552589))

(assert (=> b!574190 m!552305))

(assert (=> b!574190 m!552313))

(assert (=> b!574191 m!552305))

(assert (=> b!574191 m!552305))

(assert (=> b!574191 m!552331))

(declare-fun m!552597 () Bool)

(assert (=> bm!32651 m!552597))

(assert (=> b!573896 d!84905))

(declare-fun d!84917 () Bool)

(assert (=> d!84917 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262161 () Unit!18036)

(declare-fun choose!38 (array!35884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18036)

(assert (=> d!84917 (= lt!262161 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84917 (validMask!0 mask!3119)))

(assert (=> d!84917 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262161)))

(declare-fun bs!17742 () Bool)

(assert (= bs!17742 d!84917))

(assert (=> bs!17742 m!552309))

(declare-fun m!552605 () Bool)

(assert (=> bs!17742 m!552605))

(assert (=> bs!17742 m!552343))

(assert (=> b!573896 d!84917))

(declare-fun b!574272 () Bool)

(declare-fun lt!262189 () SeekEntryResult!5674)

(assert (=> b!574272 (and (bvsge (index!24925 lt!262189) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262189) (size!17593 lt!261994)))))

(declare-fun res!363156 () Bool)

(assert (=> b!574272 (= res!363156 (= (select (arr!17228 lt!261994) (index!24925 lt!262189)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330380 () Bool)

(assert (=> b!574272 (=> res!363156 e!330380)))

(declare-fun b!574273 () Bool)

(declare-fun e!330379 () SeekEntryResult!5674)

(assert (=> b!574273 (= e!330379 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261995 #b00000000000000000000000000000000 mask!3119) lt!261997 lt!261994 mask!3119))))

(declare-fun b!574274 () Bool)

(assert (=> b!574274 (= e!330379 (Intermediate!5674 false lt!261995 #b00000000000000000000000000000000))))

(declare-fun b!574275 () Bool)

(declare-fun e!330381 () Bool)

(declare-fun e!330378 () Bool)

(assert (=> b!574275 (= e!330381 e!330378)))

(declare-fun res!363155 () Bool)

(assert (=> b!574275 (= res!363155 (and ((_ is Intermediate!5674) lt!262189) (not (undefined!6486 lt!262189)) (bvslt (x!53812 lt!262189) #b01111111111111111111111111111110) (bvsge (x!53812 lt!262189) #b00000000000000000000000000000000) (bvsge (x!53812 lt!262189) #b00000000000000000000000000000000)))))

(assert (=> b!574275 (=> (not res!363155) (not e!330378))))

(declare-fun b!574276 () Bool)

(assert (=> b!574276 (= e!330381 (bvsge (x!53812 lt!262189) #b01111111111111111111111111111110))))

(declare-fun b!574277 () Bool)

(declare-fun e!330382 () SeekEntryResult!5674)

(assert (=> b!574277 (= e!330382 (Intermediate!5674 true lt!261995 #b00000000000000000000000000000000))))

(declare-fun d!84925 () Bool)

(assert (=> d!84925 e!330381))

(declare-fun c!65922 () Bool)

(assert (=> d!84925 (= c!65922 (and ((_ is Intermediate!5674) lt!262189) (undefined!6486 lt!262189)))))

(assert (=> d!84925 (= lt!262189 e!330382)))

(declare-fun c!65923 () Bool)

(assert (=> d!84925 (= c!65923 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262188 () (_ BitVec 64))

(assert (=> d!84925 (= lt!262188 (select (arr!17228 lt!261994) lt!261995))))

(assert (=> d!84925 (validMask!0 mask!3119)))

(assert (=> d!84925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261995 lt!261997 lt!261994 mask!3119) lt!262189)))

(declare-fun b!574278 () Bool)

(assert (=> b!574278 (and (bvsge (index!24925 lt!262189) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262189) (size!17593 lt!261994)))))

(declare-fun res!363154 () Bool)

(assert (=> b!574278 (= res!363154 (= (select (arr!17228 lt!261994) (index!24925 lt!262189)) lt!261997))))

(assert (=> b!574278 (=> res!363154 e!330380)))

(assert (=> b!574278 (= e!330378 e!330380)))

(declare-fun b!574279 () Bool)

(assert (=> b!574279 (and (bvsge (index!24925 lt!262189) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262189) (size!17593 lt!261994)))))

(assert (=> b!574279 (= e!330380 (= (select (arr!17228 lt!261994) (index!24925 lt!262189)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574280 () Bool)

(assert (=> b!574280 (= e!330382 e!330379)))

(declare-fun c!65921 () Bool)

(assert (=> b!574280 (= c!65921 (or (= lt!262188 lt!261997) (= (bvadd lt!262188 lt!262188) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!84925 c!65923) b!574277))

(assert (= (and d!84925 (not c!65923)) b!574280))

(assert (= (and b!574280 c!65921) b!574274))

(assert (= (and b!574280 (not c!65921)) b!574273))

(assert (= (and d!84925 c!65922) b!574276))

(assert (= (and d!84925 (not c!65922)) b!574275))

(assert (= (and b!574275 res!363155) b!574278))

(assert (= (and b!574278 (not res!363154)) b!574272))

(assert (= (and b!574272 (not res!363156)) b!574279))

(declare-fun m!552631 () Bool)

(assert (=> b!574273 m!552631))

(assert (=> b!574273 m!552631))

(declare-fun m!552633 () Bool)

(assert (=> b!574273 m!552633))

(declare-fun m!552635 () Bool)

(assert (=> b!574272 m!552635))

(assert (=> b!574279 m!552635))

(declare-fun m!552637 () Bool)

(assert (=> d!84925 m!552637))

(assert (=> d!84925 m!552343))

(assert (=> b!574278 m!552635))

(assert (=> b!573897 d!84925))

(declare-fun b!574291 () Bool)

(declare-fun lt!262191 () SeekEntryResult!5674)

(assert (=> b!574291 (and (bvsge (index!24925 lt!262191) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262191) (size!17593 a!3118)))))

(declare-fun res!363165 () Bool)

(assert (=> b!574291 (= res!363165 (= (select (arr!17228 a!3118) (index!24925 lt!262191)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330393 () Bool)

(assert (=> b!574291 (=> res!363165 e!330393)))

(declare-fun b!574292 () Bool)

(declare-fun e!330392 () SeekEntryResult!5674)

(assert (=> b!574292 (= e!330392 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261993 #b00000000000000000000000000000000 mask!3119) (select (arr!17228 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574293 () Bool)

(assert (=> b!574293 (= e!330392 (Intermediate!5674 false lt!261993 #b00000000000000000000000000000000))))

(declare-fun b!574294 () Bool)

(declare-fun e!330394 () Bool)

(declare-fun e!330391 () Bool)

(assert (=> b!574294 (= e!330394 e!330391)))

(declare-fun res!363164 () Bool)

(assert (=> b!574294 (= res!363164 (and ((_ is Intermediate!5674) lt!262191) (not (undefined!6486 lt!262191)) (bvslt (x!53812 lt!262191) #b01111111111111111111111111111110) (bvsge (x!53812 lt!262191) #b00000000000000000000000000000000) (bvsge (x!53812 lt!262191) #b00000000000000000000000000000000)))))

(assert (=> b!574294 (=> (not res!363164) (not e!330391))))

(declare-fun b!574295 () Bool)

(assert (=> b!574295 (= e!330394 (bvsge (x!53812 lt!262191) #b01111111111111111111111111111110))))

(declare-fun b!574296 () Bool)

(declare-fun e!330395 () SeekEntryResult!5674)

(assert (=> b!574296 (= e!330395 (Intermediate!5674 true lt!261993 #b00000000000000000000000000000000))))

(declare-fun d!84939 () Bool)

(assert (=> d!84939 e!330394))

(declare-fun c!65927 () Bool)

(assert (=> d!84939 (= c!65927 (and ((_ is Intermediate!5674) lt!262191) (undefined!6486 lt!262191)))))

(assert (=> d!84939 (= lt!262191 e!330395)))

(declare-fun c!65928 () Bool)

(assert (=> d!84939 (= c!65928 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262190 () (_ BitVec 64))

(assert (=> d!84939 (= lt!262190 (select (arr!17228 a!3118) lt!261993))))

(assert (=> d!84939 (validMask!0 mask!3119)))

(assert (=> d!84939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261993 (select (arr!17228 a!3118) j!142) a!3118 mask!3119) lt!262191)))

(declare-fun b!574297 () Bool)

(assert (=> b!574297 (and (bvsge (index!24925 lt!262191) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262191) (size!17593 a!3118)))))

(declare-fun res!363163 () Bool)

(assert (=> b!574297 (= res!363163 (= (select (arr!17228 a!3118) (index!24925 lt!262191)) (select (arr!17228 a!3118) j!142)))))

(assert (=> b!574297 (=> res!363163 e!330393)))

(assert (=> b!574297 (= e!330391 e!330393)))

(declare-fun b!574298 () Bool)

(assert (=> b!574298 (and (bvsge (index!24925 lt!262191) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262191) (size!17593 a!3118)))))

(assert (=> b!574298 (= e!330393 (= (select (arr!17228 a!3118) (index!24925 lt!262191)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574299 () Bool)

(assert (=> b!574299 (= e!330395 e!330392)))

(declare-fun c!65926 () Bool)

(assert (=> b!574299 (= c!65926 (or (= lt!262190 (select (arr!17228 a!3118) j!142)) (= (bvadd lt!262190 lt!262190) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!84939 c!65928) b!574296))

(assert (= (and d!84939 (not c!65928)) b!574299))

(assert (= (and b!574299 c!65926) b!574293))

(assert (= (and b!574299 (not c!65926)) b!574292))

(assert (= (and d!84939 c!65927) b!574295))

(assert (= (and d!84939 (not c!65927)) b!574294))

(assert (= (and b!574294 res!363164) b!574297))

(assert (= (and b!574297 (not res!363163)) b!574291))

(assert (= (and b!574291 (not res!363165)) b!574298))

(declare-fun m!552639 () Bool)

(assert (=> b!574292 m!552639))

(assert (=> b!574292 m!552639))

(assert (=> b!574292 m!552305))

(declare-fun m!552641 () Bool)

(assert (=> b!574292 m!552641))

(declare-fun m!552645 () Bool)

(assert (=> b!574291 m!552645))

(assert (=> b!574298 m!552645))

(declare-fun m!552651 () Bool)

(assert (=> d!84939 m!552651))

(assert (=> d!84939 m!552343))

(assert (=> b!574297 m!552645))

(assert (=> b!573897 d!84939))

(declare-fun d!84943 () Bool)

(declare-fun lt!262205 () (_ BitVec 32))

(declare-fun lt!262204 () (_ BitVec 32))

(assert (=> d!84943 (= lt!262205 (bvmul (bvxor lt!262204 (bvlshr lt!262204 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84943 (= lt!262204 ((_ extract 31 0) (bvand (bvxor lt!261997 (bvlshr lt!261997 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84943 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363166 (let ((h!12381 ((_ extract 31 0) (bvand (bvxor lt!261997 (bvlshr lt!261997 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53823 (bvmul (bvxor h!12381 (bvlshr h!12381 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53823 (bvlshr x!53823 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363166 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363166 #b00000000000000000000000000000000))))))

(assert (=> d!84943 (= (toIndex!0 lt!261997 mask!3119) (bvand (bvxor lt!262205 (bvlshr lt!262205 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573897 d!84943))

(declare-fun d!84957 () Bool)

(declare-fun lt!262207 () (_ BitVec 32))

(declare-fun lt!262206 () (_ BitVec 32))

(assert (=> d!84957 (= lt!262207 (bvmul (bvxor lt!262206 (bvlshr lt!262206 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84957 (= lt!262206 ((_ extract 31 0) (bvand (bvxor (select (arr!17228 a!3118) j!142) (bvlshr (select (arr!17228 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84957 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363166 (let ((h!12381 ((_ extract 31 0) (bvand (bvxor (select (arr!17228 a!3118) j!142) (bvlshr (select (arr!17228 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53823 (bvmul (bvxor h!12381 (bvlshr h!12381 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53823 (bvlshr x!53823 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363166 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363166 #b00000000000000000000000000000000))))))

(assert (=> d!84957 (= (toIndex!0 (select (arr!17228 a!3118) j!142) mask!3119) (bvand (bvxor lt!262207 (bvlshr lt!262207 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573897 d!84957))

(declare-fun b!574339 () Bool)

(declare-fun e!330423 () Bool)

(declare-fun e!330424 () Bool)

(assert (=> b!574339 (= e!330423 e!330424)))

(declare-fun lt!262209 () (_ BitVec 64))

(assert (=> b!574339 (= lt!262209 (select (arr!17228 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262208 () Unit!18036)

(assert (=> b!574339 (= lt!262208 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262209 #b00000000000000000000000000000000))))

(assert (=> b!574339 (arrayContainsKey!0 a!3118 lt!262209 #b00000000000000000000000000000000)))

(declare-fun lt!262210 () Unit!18036)

(assert (=> b!574339 (= lt!262210 lt!262208)))

(declare-fun res!363182 () Bool)

(assert (=> b!574339 (= res!363182 (= (seekEntryOrOpen!0 (select (arr!17228 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5674 #b00000000000000000000000000000000)))))

(assert (=> b!574339 (=> (not res!363182) (not e!330424))))

(declare-fun d!84959 () Bool)

(declare-fun res!363183 () Bool)

(declare-fun e!330425 () Bool)

(assert (=> d!84959 (=> res!363183 e!330425)))

(assert (=> d!84959 (= res!363183 (bvsge #b00000000000000000000000000000000 (size!17593 a!3118)))))

(assert (=> d!84959 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330425)))

(declare-fun b!574340 () Bool)

(assert (=> b!574340 (= e!330425 e!330423)))

(declare-fun c!65941 () Bool)

(assert (=> b!574340 (= c!65941 (validKeyInArray!0 (select (arr!17228 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32657 () Bool)

(declare-fun call!32660 () Bool)

(assert (=> bm!32657 (= call!32660 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574341 () Bool)

(assert (=> b!574341 (= e!330423 call!32660)))

(declare-fun b!574342 () Bool)

(assert (=> b!574342 (= e!330424 call!32660)))

(assert (= (and d!84959 (not res!363183)) b!574340))

(assert (= (and b!574340 c!65941) b!574339))

(assert (= (and b!574340 (not c!65941)) b!574341))

(assert (= (and b!574339 res!363182) b!574342))

(assert (= (or b!574342 b!574341) bm!32657))

(assert (=> b!574339 m!552515))

(declare-fun m!552687 () Bool)

(assert (=> b!574339 m!552687))

(declare-fun m!552689 () Bool)

(assert (=> b!574339 m!552689))

(assert (=> b!574339 m!552515))

(declare-fun m!552691 () Bool)

(assert (=> b!574339 m!552691))

(assert (=> b!574340 m!552515))

(assert (=> b!574340 m!552515))

(assert (=> b!574340 m!552519))

(declare-fun m!552693 () Bool)

(assert (=> bm!32657 m!552693))

(assert (=> b!573892 d!84959))

(declare-fun b!574343 () Bool)

(declare-fun c!65943 () Bool)

(declare-fun lt!262211 () (_ BitVec 64))

(assert (=> b!574343 (= c!65943 (= lt!262211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330428 () SeekEntryResult!5674)

(declare-fun e!330426 () SeekEntryResult!5674)

(assert (=> b!574343 (= e!330428 e!330426)))

(declare-fun d!84961 () Bool)

(declare-fun lt!262213 () SeekEntryResult!5674)

(assert (=> d!84961 (and (or ((_ is Undefined!5674) lt!262213) (not ((_ is Found!5674) lt!262213)) (and (bvsge (index!24924 lt!262213) #b00000000000000000000000000000000) (bvslt (index!24924 lt!262213) (size!17593 a!3118)))) (or ((_ is Undefined!5674) lt!262213) ((_ is Found!5674) lt!262213) (not ((_ is MissingZero!5674) lt!262213)) (and (bvsge (index!24923 lt!262213) #b00000000000000000000000000000000) (bvslt (index!24923 lt!262213) (size!17593 a!3118)))) (or ((_ is Undefined!5674) lt!262213) ((_ is Found!5674) lt!262213) ((_ is MissingZero!5674) lt!262213) (not ((_ is MissingVacant!5674) lt!262213)) (and (bvsge (index!24926 lt!262213) #b00000000000000000000000000000000) (bvslt (index!24926 lt!262213) (size!17593 a!3118)))) (or ((_ is Undefined!5674) lt!262213) (ite ((_ is Found!5674) lt!262213) (= (select (arr!17228 a!3118) (index!24924 lt!262213)) k0!1914) (ite ((_ is MissingZero!5674) lt!262213) (= (select (arr!17228 a!3118) (index!24923 lt!262213)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5674) lt!262213) (= (select (arr!17228 a!3118) (index!24926 lt!262213)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330427 () SeekEntryResult!5674)

(assert (=> d!84961 (= lt!262213 e!330427)))

(declare-fun c!65942 () Bool)

(declare-fun lt!262212 () SeekEntryResult!5674)

(assert (=> d!84961 (= c!65942 (and ((_ is Intermediate!5674) lt!262212) (undefined!6486 lt!262212)))))

(assert (=> d!84961 (= lt!262212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84961 (validMask!0 mask!3119)))

(assert (=> d!84961 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!262213)))

(declare-fun b!574344 () Bool)

(assert (=> b!574344 (= e!330426 (MissingZero!5674 (index!24925 lt!262212)))))

(declare-fun b!574345 () Bool)

(assert (=> b!574345 (= e!330428 (Found!5674 (index!24925 lt!262212)))))

(declare-fun b!574346 () Bool)

(assert (=> b!574346 (= e!330427 e!330428)))

(assert (=> b!574346 (= lt!262211 (select (arr!17228 a!3118) (index!24925 lt!262212)))))

(declare-fun c!65944 () Bool)

(assert (=> b!574346 (= c!65944 (= lt!262211 k0!1914))))

(declare-fun b!574347 () Bool)

(assert (=> b!574347 (= e!330427 Undefined!5674)))

(declare-fun b!574348 () Bool)

(assert (=> b!574348 (= e!330426 (seekKeyOrZeroReturnVacant!0 (x!53812 lt!262212) (index!24925 lt!262212) (index!24925 lt!262212) k0!1914 a!3118 mask!3119))))

(assert (= (and d!84961 c!65942) b!574347))

(assert (= (and d!84961 (not c!65942)) b!574346))

(assert (= (and b!574346 c!65944) b!574345))

(assert (= (and b!574346 (not c!65944)) b!574343))

(assert (= (and b!574343 c!65943) b!574344))

(assert (= (and b!574343 (not c!65943)) b!574348))

(declare-fun m!552695 () Bool)

(assert (=> d!84961 m!552695))

(declare-fun m!552697 () Bool)

(assert (=> d!84961 m!552697))

(declare-fun m!552699 () Bool)

(assert (=> d!84961 m!552699))

(assert (=> d!84961 m!552343))

(assert (=> d!84961 m!552699))

(declare-fun m!552701 () Bool)

(assert (=> d!84961 m!552701))

(declare-fun m!552703 () Bool)

(assert (=> d!84961 m!552703))

(declare-fun m!552705 () Bool)

(assert (=> b!574346 m!552705))

(declare-fun m!552707 () Bool)

(assert (=> b!574348 m!552707))

(assert (=> b!573893 d!84961))

(declare-fun d!84963 () Bool)

(assert (=> d!84963 (= (validKeyInArray!0 (select (arr!17228 a!3118) j!142)) (and (not (= (select (arr!17228 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17228 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573904 d!84963))

(declare-fun d!84965 () Bool)

(declare-fun res!363193 () Bool)

(declare-fun e!330440 () Bool)

(assert (=> d!84965 (=> res!363193 e!330440)))

(assert (=> d!84965 (= res!363193 (= (select (arr!17228 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84965 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!330440)))

(declare-fun b!574362 () Bool)

(declare-fun e!330441 () Bool)

(assert (=> b!574362 (= e!330440 e!330441)))

(declare-fun res!363194 () Bool)

(assert (=> b!574362 (=> (not res!363194) (not e!330441))))

(assert (=> b!574362 (= res!363194 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17593 a!3118)))))

(declare-fun b!574363 () Bool)

(assert (=> b!574363 (= e!330441 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84965 (not res!363193)) b!574362))

(assert (= (and b!574362 res!363194) b!574363))

(assert (=> d!84965 m!552515))

(declare-fun m!552723 () Bool)

(assert (=> b!574363 m!552723))

(assert (=> b!573894 d!84965))

(check-sat (not bm!32641) (not d!84961) (not b!574069) (not b!574018) (not b!574348) (not b!574273) (not d!84869) (not b!574138) (not b!574125) (not b!574147) (not d!84879) (not b!574339) (not b!574292) (not d!84939) (not d!84917) (not d!84903) (not d!84899) (not b!574190) (not b!574126) (not d!84925) (not bm!32651) (not b!574191) (not bm!32657) (not b!574340) (not b!574127) (not b!574363))
(check-sat)
