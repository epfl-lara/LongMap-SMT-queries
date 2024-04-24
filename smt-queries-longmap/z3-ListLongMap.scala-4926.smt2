; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67918 () Bool)

(assert start!67918)

(declare-fun b!788957 () Bool)

(declare-fun e!438576 () Bool)

(declare-fun e!438569 () Bool)

(assert (=> b!788957 (= e!438576 e!438569)))

(declare-fun res!534321 () Bool)

(assert (=> b!788957 (=> (not res!534321) (not e!438569))))

(declare-datatypes ((SeekEntryResult!8059 0))(
  ( (MissingZero!8059 (index!34604 (_ BitVec 32))) (Found!8059 (index!34605 (_ BitVec 32))) (Intermediate!8059 (undefined!8871 Bool) (index!34606 (_ BitVec 32)) (x!65698 (_ BitVec 32))) (Undefined!8059) (MissingVacant!8059 (index!34607 (_ BitVec 32))) )
))
(declare-fun lt!351982 () SeekEntryResult!8059)

(declare-fun lt!351984 () SeekEntryResult!8059)

(assert (=> b!788957 (= res!534321 (= lt!351982 lt!351984))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42838 0))(
  ( (array!42839 (arr!20503 (Array (_ BitVec 32) (_ BitVec 64))) (size!20923 (_ BitVec 32))) )
))
(declare-fun lt!351979 () array!42838)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!351988 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42838 (_ BitVec 32)) SeekEntryResult!8059)

(assert (=> b!788957 (= lt!351984 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351988 lt!351979 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788957 (= lt!351982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351988 mask!3328) lt!351988 lt!351979 mask!3328))))

(declare-fun a!3186 () array!42838)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!788957 (= lt!351988 (select (store (arr!20503 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!788957 (= lt!351979 (array!42839 (store (arr!20503 a!3186) i!1173 k0!2102) (size!20923 a!3186)))))

(declare-fun b!788958 () Bool)

(declare-fun res!534308 () Bool)

(declare-fun e!438575 () Bool)

(assert (=> b!788958 (=> (not res!534308) (not e!438575))))

(declare-fun arrayContainsKey!0 (array!42838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788958 (= res!534308 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788959 () Bool)

(declare-fun e!438570 () Bool)

(declare-fun e!438571 () Bool)

(assert (=> b!788959 (= e!438570 e!438571)))

(declare-fun res!534307 () Bool)

(assert (=> b!788959 (=> res!534307 e!438571)))

(declare-fun lt!351987 () SeekEntryResult!8059)

(declare-fun lt!351978 () SeekEntryResult!8059)

(assert (=> b!788959 (= res!534307 (not (= lt!351987 lt!351978)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42838 (_ BitVec 32)) SeekEntryResult!8059)

(assert (=> b!788959 (= lt!351987 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20503 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788960 () Bool)

(declare-fun e!438580 () Bool)

(assert (=> b!788960 (= e!438575 e!438580)))

(declare-fun res!534310 () Bool)

(assert (=> b!788960 (=> (not res!534310) (not e!438580))))

(declare-fun lt!351981 () SeekEntryResult!8059)

(assert (=> b!788960 (= res!534310 (or (= lt!351981 (MissingZero!8059 i!1173)) (= lt!351981 (MissingVacant!8059 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42838 (_ BitVec 32)) SeekEntryResult!8059)

(assert (=> b!788960 (= lt!351981 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!788961 () Bool)

(declare-fun res!534318 () Bool)

(assert (=> b!788961 (=> (not res!534318) (not e!438575))))

(assert (=> b!788961 (= res!534318 (and (= (size!20923 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20923 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20923 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788962 () Bool)

(declare-fun res!534323 () Bool)

(assert (=> b!788962 (=> (not res!534323) (not e!438575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788962 (= res!534323 (validKeyInArray!0 k0!2102))))

(declare-fun lt!351986 () SeekEntryResult!8059)

(declare-fun b!788963 () Bool)

(declare-fun e!438579 () Bool)

(assert (=> b!788963 (= e!438579 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!351986))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!438573 () Bool)

(declare-fun b!788964 () Bool)

(assert (=> b!788964 (= e!438573 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!351978))))

(declare-fun b!788965 () Bool)

(declare-datatypes ((Unit!27301 0))(
  ( (Unit!27302) )
))
(declare-fun e!438574 () Unit!27301)

(declare-fun Unit!27303 () Unit!27301)

(assert (=> b!788965 (= e!438574 Unit!27303)))

(assert (=> b!788965 false))

(declare-fun b!788966 () Bool)

(declare-fun e!438578 () Bool)

(assert (=> b!788966 (= e!438571 e!438578)))

(declare-fun res!534314 () Bool)

(assert (=> b!788966 (=> res!534314 e!438578)))

(declare-fun lt!351977 () (_ BitVec 64))

(assert (=> b!788966 (= res!534314 (= lt!351977 lt!351988))))

(assert (=> b!788966 (= lt!351977 (select (store (arr!20503 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!788967 () Bool)

(declare-fun res!534311 () Bool)

(assert (=> b!788967 (=> (not res!534311) (not e!438576))))

(assert (=> b!788967 (= res!534311 e!438579)))

(declare-fun c!87737 () Bool)

(assert (=> b!788967 (= c!87737 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!534322 () Bool)

(assert (=> start!67918 (=> (not res!534322) (not e!438575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67918 (= res!534322 (validMask!0 mask!3328))))

(assert (=> start!67918 e!438575))

(assert (=> start!67918 true))

(declare-fun array_inv!16362 (array!42838) Bool)

(assert (=> start!67918 (array_inv!16362 a!3186)))

(declare-fun b!788968 () Bool)

(declare-fun res!534313 () Bool)

(assert (=> b!788968 (=> (not res!534313) (not e!438575))))

(assert (=> b!788968 (= res!534313 (validKeyInArray!0 (select (arr!20503 a!3186) j!159)))))

(declare-fun b!788969 () Bool)

(assert (=> b!788969 (= e!438579 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) (Found!8059 j!159)))))

(declare-fun b!788970 () Bool)

(declare-fun res!534315 () Bool)

(assert (=> b!788970 (=> (not res!534315) (not e!438580))))

(assert (=> b!788970 (= res!534315 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20923 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20923 a!3186))))))

(declare-fun b!788971 () Bool)

(declare-fun res!534316 () Bool)

(assert (=> b!788971 (=> (not res!534316) (not e!438576))))

(assert (=> b!788971 (= res!534316 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20503 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788972 () Bool)

(declare-fun res!534306 () Bool)

(assert (=> b!788972 (=> (not res!534306) (not e!438580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42838 (_ BitVec 32)) Bool)

(assert (=> b!788972 (= res!534306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788973 () Bool)

(declare-fun Unit!27304 () Unit!27301)

(assert (=> b!788973 (= e!438574 Unit!27304)))

(declare-fun b!788974 () Bool)

(declare-fun res!534317 () Bool)

(assert (=> b!788974 (=> (not res!534317) (not e!438580))))

(declare-datatypes ((List!14412 0))(
  ( (Nil!14409) (Cons!14408 (h!15537 (_ BitVec 64)) (t!20719 List!14412)) )
))
(declare-fun arrayNoDuplicates!0 (array!42838 (_ BitVec 32) List!14412) Bool)

(assert (=> b!788974 (= res!534317 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14409))))

(declare-fun b!788975 () Bool)

(assert (=> b!788975 (= e!438578 (or (not (= (select (arr!20503 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= index!1321 resIntermediateIndex!5))))))

(declare-fun e!438572 () Bool)

(assert (=> b!788975 e!438572))

(declare-fun res!534312 () Bool)

(assert (=> b!788975 (=> (not res!534312) (not e!438572))))

(assert (=> b!788975 (= res!534312 (= lt!351977 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351983 () Unit!27301)

(assert (=> b!788975 (= lt!351983 e!438574)))

(declare-fun c!87736 () Bool)

(assert (=> b!788975 (= c!87736 (= lt!351977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788976 () Bool)

(declare-fun lt!351980 () SeekEntryResult!8059)

(assert (=> b!788976 (= e!438572 (= lt!351980 lt!351987))))

(declare-fun b!788977 () Bool)

(assert (=> b!788977 (= e!438580 e!438576)))

(declare-fun res!534324 () Bool)

(assert (=> b!788977 (=> (not res!534324) (not e!438576))))

(assert (=> b!788977 (= res!534324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20503 a!3186) j!159) mask!3328) (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!351986))))

(assert (=> b!788977 (= lt!351986 (Intermediate!8059 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788978 () Bool)

(assert (=> b!788978 (= e!438569 (not e!438570))))

(declare-fun res!534309 () Bool)

(assert (=> b!788978 (=> res!534309 e!438570)))

(get-info :version)

(assert (=> b!788978 (= res!534309 (or (not ((_ is Intermediate!8059) lt!351984)) (bvslt x!1131 (x!65698 lt!351984)) (not (= x!1131 (x!65698 lt!351984))) (not (= index!1321 (index!34606 lt!351984)))))))

(assert (=> b!788978 e!438573))

(declare-fun res!534319 () Bool)

(assert (=> b!788978 (=> (not res!534319) (not e!438573))))

(assert (=> b!788978 (= res!534319 (= lt!351980 lt!351978))))

(assert (=> b!788978 (= lt!351978 (Found!8059 j!159))))

(assert (=> b!788978 (= lt!351980 (seekEntryOrOpen!0 (select (arr!20503 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788978 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351985 () Unit!27301)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27301)

(assert (=> b!788978 (= lt!351985 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788979 () Bool)

(declare-fun res!534320 () Bool)

(assert (=> b!788979 (=> (not res!534320) (not e!438572))))

(assert (=> b!788979 (= res!534320 (= (seekEntryOrOpen!0 lt!351988 lt!351979 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351988 lt!351979 mask!3328)))))

(assert (= (and start!67918 res!534322) b!788961))

(assert (= (and b!788961 res!534318) b!788968))

(assert (= (and b!788968 res!534313) b!788962))

(assert (= (and b!788962 res!534323) b!788958))

(assert (= (and b!788958 res!534308) b!788960))

(assert (= (and b!788960 res!534310) b!788972))

(assert (= (and b!788972 res!534306) b!788974))

(assert (= (and b!788974 res!534317) b!788970))

(assert (= (and b!788970 res!534315) b!788977))

(assert (= (and b!788977 res!534324) b!788971))

(assert (= (and b!788971 res!534316) b!788967))

(assert (= (and b!788967 c!87737) b!788963))

(assert (= (and b!788967 (not c!87737)) b!788969))

(assert (= (and b!788967 res!534311) b!788957))

(assert (= (and b!788957 res!534321) b!788978))

(assert (= (and b!788978 res!534319) b!788964))

(assert (= (and b!788978 (not res!534309)) b!788959))

(assert (= (and b!788959 (not res!534307)) b!788966))

(assert (= (and b!788966 (not res!534314)) b!788975))

(assert (= (and b!788975 c!87736) b!788965))

(assert (= (and b!788975 (not c!87736)) b!788973))

(assert (= (and b!788975 res!534312) b!788979))

(assert (= (and b!788979 res!534320) b!788976))

(declare-fun m!730745 () Bool)

(assert (=> start!67918 m!730745))

(declare-fun m!730747 () Bool)

(assert (=> start!67918 m!730747))

(declare-fun m!730749 () Bool)

(assert (=> b!788962 m!730749))

(declare-fun m!730751 () Bool)

(assert (=> b!788977 m!730751))

(assert (=> b!788977 m!730751))

(declare-fun m!730753 () Bool)

(assert (=> b!788977 m!730753))

(assert (=> b!788977 m!730753))

(assert (=> b!788977 m!730751))

(declare-fun m!730755 () Bool)

(assert (=> b!788977 m!730755))

(declare-fun m!730757 () Bool)

(assert (=> b!788974 m!730757))

(assert (=> b!788963 m!730751))

(assert (=> b!788963 m!730751))

(declare-fun m!730759 () Bool)

(assert (=> b!788963 m!730759))

(assert (=> b!788964 m!730751))

(assert (=> b!788964 m!730751))

(declare-fun m!730761 () Bool)

(assert (=> b!788964 m!730761))

(declare-fun m!730763 () Bool)

(assert (=> b!788975 m!730763))

(assert (=> b!788968 m!730751))

(assert (=> b!788968 m!730751))

(declare-fun m!730765 () Bool)

(assert (=> b!788968 m!730765))

(declare-fun m!730767 () Bool)

(assert (=> b!788979 m!730767))

(declare-fun m!730769 () Bool)

(assert (=> b!788979 m!730769))

(assert (=> b!788969 m!730751))

(assert (=> b!788969 m!730751))

(declare-fun m!730771 () Bool)

(assert (=> b!788969 m!730771))

(declare-fun m!730773 () Bool)

(assert (=> b!788972 m!730773))

(assert (=> b!788959 m!730751))

(assert (=> b!788959 m!730751))

(assert (=> b!788959 m!730771))

(assert (=> b!788978 m!730751))

(assert (=> b!788978 m!730751))

(declare-fun m!730775 () Bool)

(assert (=> b!788978 m!730775))

(declare-fun m!730777 () Bool)

(assert (=> b!788978 m!730777))

(declare-fun m!730779 () Bool)

(assert (=> b!788978 m!730779))

(declare-fun m!730781 () Bool)

(assert (=> b!788960 m!730781))

(declare-fun m!730783 () Bool)

(assert (=> b!788957 m!730783))

(declare-fun m!730785 () Bool)

(assert (=> b!788957 m!730785))

(declare-fun m!730787 () Bool)

(assert (=> b!788957 m!730787))

(assert (=> b!788957 m!730785))

(declare-fun m!730789 () Bool)

(assert (=> b!788957 m!730789))

(declare-fun m!730791 () Bool)

(assert (=> b!788957 m!730791))

(declare-fun m!730793 () Bool)

(assert (=> b!788971 m!730793))

(assert (=> b!788966 m!730787))

(declare-fun m!730795 () Bool)

(assert (=> b!788966 m!730795))

(declare-fun m!730797 () Bool)

(assert (=> b!788958 m!730797))

(check-sat (not b!788959) (not b!788977) (not b!788960) (not b!788964) (not b!788962) (not b!788972) (not b!788979) (not start!67918) (not b!788958) (not b!788963) (not b!788969) (not b!788978) (not b!788957) (not b!788968) (not b!788974))
(check-sat)
(get-model)

(declare-fun d!103083 () Bool)

(declare-fun res!534444 () Bool)

(declare-fun e!438660 () Bool)

(assert (=> d!103083 (=> res!534444 e!438660)))

(assert (=> d!103083 (= res!534444 (bvsge #b00000000000000000000000000000000 (size!20923 a!3186)))))

(assert (=> d!103083 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!438660)))

(declare-fun bm!35304 () Bool)

(declare-fun call!35307 () Bool)

(assert (=> bm!35304 (= call!35307 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!789126 () Bool)

(declare-fun e!438659 () Bool)

(declare-fun e!438661 () Bool)

(assert (=> b!789126 (= e!438659 e!438661)))

(declare-fun lt!352067 () (_ BitVec 64))

(assert (=> b!789126 (= lt!352067 (select (arr!20503 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!352068 () Unit!27301)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42838 (_ BitVec 64) (_ BitVec 32)) Unit!27301)

(assert (=> b!789126 (= lt!352068 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!352067 #b00000000000000000000000000000000))))

(assert (=> b!789126 (arrayContainsKey!0 a!3186 lt!352067 #b00000000000000000000000000000000)))

(declare-fun lt!352069 () Unit!27301)

(assert (=> b!789126 (= lt!352069 lt!352068)))

(declare-fun res!534443 () Bool)

(assert (=> b!789126 (= res!534443 (= (seekEntryOrOpen!0 (select (arr!20503 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8059 #b00000000000000000000000000000000)))))

(assert (=> b!789126 (=> (not res!534443) (not e!438661))))

(declare-fun b!789127 () Bool)

(assert (=> b!789127 (= e!438659 call!35307)))

(declare-fun b!789128 () Bool)

(assert (=> b!789128 (= e!438661 call!35307)))

(declare-fun b!789129 () Bool)

(assert (=> b!789129 (= e!438660 e!438659)))

(declare-fun c!87752 () Bool)

(assert (=> b!789129 (= c!87752 (validKeyInArray!0 (select (arr!20503 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!103083 (not res!534444)) b!789129))

(assert (= (and b!789129 c!87752) b!789126))

(assert (= (and b!789129 (not c!87752)) b!789127))

(assert (= (and b!789126 res!534443) b!789128))

(assert (= (or b!789128 b!789127) bm!35304))

(declare-fun m!730907 () Bool)

(assert (=> bm!35304 m!730907))

(declare-fun m!730909 () Bool)

(assert (=> b!789126 m!730909))

(declare-fun m!730911 () Bool)

(assert (=> b!789126 m!730911))

(declare-fun m!730913 () Bool)

(assert (=> b!789126 m!730913))

(assert (=> b!789126 m!730909))

(declare-fun m!730915 () Bool)

(assert (=> b!789126 m!730915))

(assert (=> b!789129 m!730909))

(assert (=> b!789129 m!730909))

(declare-fun m!730917 () Bool)

(assert (=> b!789129 m!730917))

(assert (=> b!788972 d!103083))

(declare-fun b!789187 () Bool)

(declare-fun e!438695 () SeekEntryResult!8059)

(declare-fun lt!352092 () SeekEntryResult!8059)

(assert (=> b!789187 (= e!438695 (Found!8059 (index!34606 lt!352092)))))

(declare-fun d!103087 () Bool)

(declare-fun lt!352094 () SeekEntryResult!8059)

(assert (=> d!103087 (and (or ((_ is Undefined!8059) lt!352094) (not ((_ is Found!8059) lt!352094)) (and (bvsge (index!34605 lt!352094) #b00000000000000000000000000000000) (bvslt (index!34605 lt!352094) (size!20923 a!3186)))) (or ((_ is Undefined!8059) lt!352094) ((_ is Found!8059) lt!352094) (not ((_ is MissingZero!8059) lt!352094)) (and (bvsge (index!34604 lt!352094) #b00000000000000000000000000000000) (bvslt (index!34604 lt!352094) (size!20923 a!3186)))) (or ((_ is Undefined!8059) lt!352094) ((_ is Found!8059) lt!352094) ((_ is MissingZero!8059) lt!352094) (not ((_ is MissingVacant!8059) lt!352094)) (and (bvsge (index!34607 lt!352094) #b00000000000000000000000000000000) (bvslt (index!34607 lt!352094) (size!20923 a!3186)))) (or ((_ is Undefined!8059) lt!352094) (ite ((_ is Found!8059) lt!352094) (= (select (arr!20503 a!3186) (index!34605 lt!352094)) k0!2102) (ite ((_ is MissingZero!8059) lt!352094) (= (select (arr!20503 a!3186) (index!34604 lt!352094)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8059) lt!352094) (= (select (arr!20503 a!3186) (index!34607 lt!352094)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!438693 () SeekEntryResult!8059)

(assert (=> d!103087 (= lt!352094 e!438693)))

(declare-fun c!87775 () Bool)

(assert (=> d!103087 (= c!87775 (and ((_ is Intermediate!8059) lt!352092) (undefined!8871 lt!352092)))))

(assert (=> d!103087 (= lt!352092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!103087 (validMask!0 mask!3328)))

(assert (=> d!103087 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!352094)))

(declare-fun e!438694 () SeekEntryResult!8059)

(declare-fun b!789188 () Bool)

(assert (=> b!789188 (= e!438694 (seekKeyOrZeroReturnVacant!0 (x!65698 lt!352092) (index!34606 lt!352092) (index!34606 lt!352092) k0!2102 a!3186 mask!3328))))

(declare-fun b!789189 () Bool)

(declare-fun c!87776 () Bool)

(declare-fun lt!352093 () (_ BitVec 64))

(assert (=> b!789189 (= c!87776 (= lt!352093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!789189 (= e!438695 e!438694)))

(declare-fun b!789190 () Bool)

(assert (=> b!789190 (= e!438694 (MissingZero!8059 (index!34606 lt!352092)))))

(declare-fun b!789191 () Bool)

(assert (=> b!789191 (= e!438693 Undefined!8059)))

(declare-fun b!789192 () Bool)

(assert (=> b!789192 (= e!438693 e!438695)))

(assert (=> b!789192 (= lt!352093 (select (arr!20503 a!3186) (index!34606 lt!352092)))))

(declare-fun c!87774 () Bool)

(assert (=> b!789192 (= c!87774 (= lt!352093 k0!2102))))

(assert (= (and d!103087 c!87775) b!789191))

(assert (= (and d!103087 (not c!87775)) b!789192))

(assert (= (and b!789192 c!87774) b!789187))

(assert (= (and b!789192 (not c!87774)) b!789189))

(assert (= (and b!789189 c!87776) b!789190))

(assert (= (and b!789189 (not c!87776)) b!789188))

(declare-fun m!730939 () Bool)

(assert (=> d!103087 m!730939))

(declare-fun m!730941 () Bool)

(assert (=> d!103087 m!730941))

(declare-fun m!730943 () Bool)

(assert (=> d!103087 m!730943))

(declare-fun m!730945 () Bool)

(assert (=> d!103087 m!730945))

(declare-fun m!730947 () Bool)

(assert (=> d!103087 m!730947))

(assert (=> d!103087 m!730941))

(assert (=> d!103087 m!730745))

(declare-fun m!730949 () Bool)

(assert (=> b!789188 m!730949))

(declare-fun m!730951 () Bool)

(assert (=> b!789192 m!730951))

(assert (=> b!788960 d!103087))

(declare-fun d!103101 () Bool)

(declare-fun lt!352113 () SeekEntryResult!8059)

(assert (=> d!103101 (and (or ((_ is Undefined!8059) lt!352113) (not ((_ is Found!8059) lt!352113)) (and (bvsge (index!34605 lt!352113) #b00000000000000000000000000000000) (bvslt (index!34605 lt!352113) (size!20923 a!3186)))) (or ((_ is Undefined!8059) lt!352113) ((_ is Found!8059) lt!352113) (not ((_ is MissingVacant!8059) lt!352113)) (not (= (index!34607 lt!352113) resIntermediateIndex!5)) (and (bvsge (index!34607 lt!352113) #b00000000000000000000000000000000) (bvslt (index!34607 lt!352113) (size!20923 a!3186)))) (or ((_ is Undefined!8059) lt!352113) (ite ((_ is Found!8059) lt!352113) (= (select (arr!20503 a!3186) (index!34605 lt!352113)) (select (arr!20503 a!3186) j!159)) (and ((_ is MissingVacant!8059) lt!352113) (= (index!34607 lt!352113) resIntermediateIndex!5) (= (select (arr!20503 a!3186) (index!34607 lt!352113)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!438723 () SeekEntryResult!8059)

(assert (=> d!103101 (= lt!352113 e!438723)))

(declare-fun c!87798 () Bool)

(assert (=> d!103101 (= c!87798 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!352112 () (_ BitVec 64))

(assert (=> d!103101 (= lt!352112 (select (arr!20503 a!3186) index!1321))))

(assert (=> d!103101 (validMask!0 mask!3328)))

(assert (=> d!103101 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!352113)))

(declare-fun b!789241 () Bool)

(declare-fun e!438724 () SeekEntryResult!8059)

(assert (=> b!789241 (= e!438724 (Found!8059 index!1321))))

(declare-fun b!789242 () Bool)

(declare-fun c!87800 () Bool)

(assert (=> b!789242 (= c!87800 (= lt!352112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438725 () SeekEntryResult!8059)

(assert (=> b!789242 (= e!438724 e!438725)))

(declare-fun b!789243 () Bool)

(assert (=> b!789243 (= e!438723 e!438724)))

(declare-fun c!87799 () Bool)

(assert (=> b!789243 (= c!87799 (= lt!352112 (select (arr!20503 a!3186) j!159)))))

(declare-fun b!789244 () Bool)

(assert (=> b!789244 (= e!438723 Undefined!8059)))

(declare-fun b!789245 () Bool)

(assert (=> b!789245 (= e!438725 (MissingVacant!8059 resIntermediateIndex!5))))

(declare-fun b!789246 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789246 (= e!438725 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20503 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!103101 c!87798) b!789244))

(assert (= (and d!103101 (not c!87798)) b!789243))

(assert (= (and b!789243 c!87799) b!789241))

(assert (= (and b!789243 (not c!87799)) b!789242))

(assert (= (and b!789242 c!87800) b!789245))

(assert (= (and b!789242 (not c!87800)) b!789246))

(declare-fun m!730967 () Bool)

(assert (=> d!103101 m!730967))

(declare-fun m!730969 () Bool)

(assert (=> d!103101 m!730969))

(assert (=> d!103101 m!730763))

(assert (=> d!103101 m!730745))

(declare-fun m!730971 () Bool)

(assert (=> b!789246 m!730971))

(assert (=> b!789246 m!730971))

(assert (=> b!789246 m!730751))

(declare-fun m!730973 () Bool)

(assert (=> b!789246 m!730973))

(assert (=> b!788959 d!103101))

(declare-fun lt!352115 () SeekEntryResult!8059)

(declare-fun d!103109 () Bool)

(assert (=> d!103109 (and (or ((_ is Undefined!8059) lt!352115) (not ((_ is Found!8059) lt!352115)) (and (bvsge (index!34605 lt!352115) #b00000000000000000000000000000000) (bvslt (index!34605 lt!352115) (size!20923 a!3186)))) (or ((_ is Undefined!8059) lt!352115) ((_ is Found!8059) lt!352115) (not ((_ is MissingVacant!8059) lt!352115)) (not (= (index!34607 lt!352115) resIntermediateIndex!5)) (and (bvsge (index!34607 lt!352115) #b00000000000000000000000000000000) (bvslt (index!34607 lt!352115) (size!20923 a!3186)))) (or ((_ is Undefined!8059) lt!352115) (ite ((_ is Found!8059) lt!352115) (= (select (arr!20503 a!3186) (index!34605 lt!352115)) (select (arr!20503 a!3186) j!159)) (and ((_ is MissingVacant!8059) lt!352115) (= (index!34607 lt!352115) resIntermediateIndex!5) (= (select (arr!20503 a!3186) (index!34607 lt!352115)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!438726 () SeekEntryResult!8059)

(assert (=> d!103109 (= lt!352115 e!438726)))

(declare-fun c!87801 () Bool)

(assert (=> d!103109 (= c!87801 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!352114 () (_ BitVec 64))

(assert (=> d!103109 (= lt!352114 (select (arr!20503 a!3186) resIntermediateIndex!5))))

(assert (=> d!103109 (validMask!0 mask!3328)))

(assert (=> d!103109 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!352115)))

(declare-fun b!789247 () Bool)

(declare-fun e!438727 () SeekEntryResult!8059)

(assert (=> b!789247 (= e!438727 (Found!8059 resIntermediateIndex!5))))

(declare-fun b!789248 () Bool)

(declare-fun c!87803 () Bool)

(assert (=> b!789248 (= c!87803 (= lt!352114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438728 () SeekEntryResult!8059)

(assert (=> b!789248 (= e!438727 e!438728)))

(declare-fun b!789249 () Bool)

(assert (=> b!789249 (= e!438726 e!438727)))

(declare-fun c!87802 () Bool)

(assert (=> b!789249 (= c!87802 (= lt!352114 (select (arr!20503 a!3186) j!159)))))

(declare-fun b!789250 () Bool)

(assert (=> b!789250 (= e!438726 Undefined!8059)))

(declare-fun b!789251 () Bool)

(assert (=> b!789251 (= e!438728 (MissingVacant!8059 resIntermediateIndex!5))))

(declare-fun b!789252 () Bool)

(assert (=> b!789252 (= e!438728 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20503 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!103109 c!87801) b!789250))

(assert (= (and d!103109 (not c!87801)) b!789249))

(assert (= (and b!789249 c!87802) b!789247))

(assert (= (and b!789249 (not c!87802)) b!789248))

(assert (= (and b!789248 c!87803) b!789251))

(assert (= (and b!789248 (not c!87803)) b!789252))

(declare-fun m!730975 () Bool)

(assert (=> d!103109 m!730975))

(declare-fun m!730977 () Bool)

(assert (=> d!103109 m!730977))

(assert (=> d!103109 m!730793))

(assert (=> d!103109 m!730745))

(declare-fun m!730979 () Bool)

(assert (=> b!789252 m!730979))

(assert (=> b!789252 m!730979))

(assert (=> b!789252 m!730751))

(declare-fun m!730981 () Bool)

(assert (=> b!789252 m!730981))

(assert (=> b!788964 d!103109))

(declare-fun b!789311 () Bool)

(declare-fun e!438769 () SeekEntryResult!8059)

(assert (=> b!789311 (= e!438769 (Intermediate!8059 false index!1321 x!1131))))

(declare-fun b!789312 () Bool)

(declare-fun e!438770 () SeekEntryResult!8059)

(assert (=> b!789312 (= e!438770 (Intermediate!8059 true index!1321 x!1131))))

(declare-fun b!789313 () Bool)

(assert (=> b!789313 (= e!438770 e!438769)))

(declare-fun c!87820 () Bool)

(declare-fun lt!352146 () (_ BitVec 64))

(assert (=> b!789313 (= c!87820 (or (= lt!352146 (select (arr!20503 a!3186) j!159)) (= (bvadd lt!352146 lt!352146) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789314 () Bool)

(declare-fun lt!352147 () SeekEntryResult!8059)

(assert (=> b!789314 (and (bvsge (index!34606 lt!352147) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352147) (size!20923 a!3186)))))

(declare-fun res!534494 () Bool)

(assert (=> b!789314 (= res!534494 (= (select (arr!20503 a!3186) (index!34606 lt!352147)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438773 () Bool)

(assert (=> b!789314 (=> res!534494 e!438773)))

(declare-fun b!789315 () Bool)

(declare-fun e!438771 () Bool)

(assert (=> b!789315 (= e!438771 (bvsge (x!65698 lt!352147) #b01111111111111111111111111111110))))

(declare-fun b!789316 () Bool)

(assert (=> b!789316 (= e!438769 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20503 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789317 () Bool)

(assert (=> b!789317 (and (bvsge (index!34606 lt!352147) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352147) (size!20923 a!3186)))))

(assert (=> b!789317 (= e!438773 (= (select (arr!20503 a!3186) (index!34606 lt!352147)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!103111 () Bool)

(assert (=> d!103111 e!438771))

(declare-fun c!87822 () Bool)

(assert (=> d!103111 (= c!87822 (and ((_ is Intermediate!8059) lt!352147) (undefined!8871 lt!352147)))))

(assert (=> d!103111 (= lt!352147 e!438770)))

(declare-fun c!87821 () Bool)

(assert (=> d!103111 (= c!87821 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!103111 (= lt!352146 (select (arr!20503 a!3186) index!1321))))

(assert (=> d!103111 (validMask!0 mask!3328)))

(assert (=> d!103111 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!352147)))

(declare-fun b!789318 () Bool)

(assert (=> b!789318 (and (bvsge (index!34606 lt!352147) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352147) (size!20923 a!3186)))))

(declare-fun res!534493 () Bool)

(assert (=> b!789318 (= res!534493 (= (select (arr!20503 a!3186) (index!34606 lt!352147)) (select (arr!20503 a!3186) j!159)))))

(assert (=> b!789318 (=> res!534493 e!438773)))

(declare-fun e!438772 () Bool)

(assert (=> b!789318 (= e!438772 e!438773)))

(declare-fun b!789319 () Bool)

(assert (=> b!789319 (= e!438771 e!438772)))

(declare-fun res!534495 () Bool)

(assert (=> b!789319 (= res!534495 (and ((_ is Intermediate!8059) lt!352147) (not (undefined!8871 lt!352147)) (bvslt (x!65698 lt!352147) #b01111111111111111111111111111110) (bvsge (x!65698 lt!352147) #b00000000000000000000000000000000) (bvsge (x!65698 lt!352147) x!1131)))))

(assert (=> b!789319 (=> (not res!534495) (not e!438772))))

(assert (= (and d!103111 c!87821) b!789312))

(assert (= (and d!103111 (not c!87821)) b!789313))

(assert (= (and b!789313 c!87820) b!789311))

(assert (= (and b!789313 (not c!87820)) b!789316))

(assert (= (and d!103111 c!87822) b!789315))

(assert (= (and d!103111 (not c!87822)) b!789319))

(assert (= (and b!789319 res!534495) b!789318))

(assert (= (and b!789318 (not res!534493)) b!789314))

(assert (= (and b!789314 (not res!534494)) b!789317))

(assert (=> b!789316 m!730971))

(assert (=> b!789316 m!730971))

(assert (=> b!789316 m!730751))

(declare-fun m!731023 () Bool)

(assert (=> b!789316 m!731023))

(declare-fun m!731025 () Bool)

(assert (=> b!789317 m!731025))

(assert (=> d!103111 m!730763))

(assert (=> d!103111 m!730745))

(assert (=> b!789314 m!731025))

(assert (=> b!789318 m!731025))

(assert (=> b!788963 d!103111))

(declare-fun b!789360 () Bool)

(declare-fun e!438801 () Bool)

(declare-fun e!438798 () Bool)

(assert (=> b!789360 (= e!438801 e!438798)))

(declare-fun res!534509 () Bool)

(assert (=> b!789360 (=> (not res!534509) (not e!438798))))

(declare-fun e!438799 () Bool)

(assert (=> b!789360 (= res!534509 (not e!438799))))

(declare-fun res!534508 () Bool)

(assert (=> b!789360 (=> (not res!534508) (not e!438799))))

(assert (=> b!789360 (= res!534508 (validKeyInArray!0 (select (arr!20503 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!103125 () Bool)

(declare-fun res!534510 () Bool)

(assert (=> d!103125 (=> res!534510 e!438801)))

(assert (=> d!103125 (= res!534510 (bvsge #b00000000000000000000000000000000 (size!20923 a!3186)))))

(assert (=> d!103125 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14409) e!438801)))

(declare-fun b!789361 () Bool)

(declare-fun e!438800 () Bool)

(declare-fun call!35317 () Bool)

(assert (=> b!789361 (= e!438800 call!35317)))

(declare-fun bm!35314 () Bool)

(declare-fun c!87837 () Bool)

(assert (=> bm!35314 (= call!35317 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!87837 (Cons!14408 (select (arr!20503 a!3186) #b00000000000000000000000000000000) Nil!14409) Nil!14409)))))

(declare-fun b!789362 () Bool)

(assert (=> b!789362 (= e!438798 e!438800)))

(assert (=> b!789362 (= c!87837 (validKeyInArray!0 (select (arr!20503 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!789363 () Bool)

(assert (=> b!789363 (= e!438800 call!35317)))

(declare-fun b!789364 () Bool)

(declare-fun contains!4086 (List!14412 (_ BitVec 64)) Bool)

(assert (=> b!789364 (= e!438799 (contains!4086 Nil!14409 (select (arr!20503 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!103125 (not res!534510)) b!789360))

(assert (= (and b!789360 res!534508) b!789364))

(assert (= (and b!789360 res!534509) b!789362))

(assert (= (and b!789362 c!87837) b!789363))

(assert (= (and b!789362 (not c!87837)) b!789361))

(assert (= (or b!789363 b!789361) bm!35314))

(assert (=> b!789360 m!730909))

(assert (=> b!789360 m!730909))

(assert (=> b!789360 m!730917))

(assert (=> bm!35314 m!730909))

(declare-fun m!731027 () Bool)

(assert (=> bm!35314 m!731027))

(assert (=> b!789362 m!730909))

(assert (=> b!789362 m!730909))

(assert (=> b!789362 m!730917))

(assert (=> b!789364 m!730909))

(assert (=> b!789364 m!730909))

(declare-fun m!731029 () Bool)

(assert (=> b!789364 m!731029))

(assert (=> b!788974 d!103125))

(declare-fun d!103127 () Bool)

(assert (=> d!103127 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!788962 d!103127))

(declare-fun b!789365 () Bool)

(declare-fun e!438802 () SeekEntryResult!8059)

(assert (=> b!789365 (= e!438802 (Intermediate!8059 false (toIndex!0 (select (arr!20503 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun e!438803 () SeekEntryResult!8059)

(declare-fun b!789366 () Bool)

(assert (=> b!789366 (= e!438803 (Intermediate!8059 true (toIndex!0 (select (arr!20503 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!789367 () Bool)

(assert (=> b!789367 (= e!438803 e!438802)))

(declare-fun c!87838 () Bool)

(declare-fun lt!352156 () (_ BitVec 64))

(assert (=> b!789367 (= c!87838 (or (= lt!352156 (select (arr!20503 a!3186) j!159)) (= (bvadd lt!352156 lt!352156) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789368 () Bool)

(declare-fun lt!352157 () SeekEntryResult!8059)

(assert (=> b!789368 (and (bvsge (index!34606 lt!352157) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352157) (size!20923 a!3186)))))

(declare-fun res!534512 () Bool)

(assert (=> b!789368 (= res!534512 (= (select (arr!20503 a!3186) (index!34606 lt!352157)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438806 () Bool)

(assert (=> b!789368 (=> res!534512 e!438806)))

(declare-fun b!789369 () Bool)

(declare-fun e!438804 () Bool)

(assert (=> b!789369 (= e!438804 (bvsge (x!65698 lt!352157) #b01111111111111111111111111111110))))

(declare-fun b!789370 () Bool)

(assert (=> b!789370 (= e!438802 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20503 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20503 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789371 () Bool)

(assert (=> b!789371 (and (bvsge (index!34606 lt!352157) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352157) (size!20923 a!3186)))))

(assert (=> b!789371 (= e!438806 (= (select (arr!20503 a!3186) (index!34606 lt!352157)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!103129 () Bool)

(assert (=> d!103129 e!438804))

(declare-fun c!87840 () Bool)

(assert (=> d!103129 (= c!87840 (and ((_ is Intermediate!8059) lt!352157) (undefined!8871 lt!352157)))))

(assert (=> d!103129 (= lt!352157 e!438803)))

(declare-fun c!87839 () Bool)

(assert (=> d!103129 (= c!87839 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!103129 (= lt!352156 (select (arr!20503 a!3186) (toIndex!0 (select (arr!20503 a!3186) j!159) mask!3328)))))

(assert (=> d!103129 (validMask!0 mask!3328)))

(assert (=> d!103129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20503 a!3186) j!159) mask!3328) (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!352157)))

(declare-fun b!789372 () Bool)

(assert (=> b!789372 (and (bvsge (index!34606 lt!352157) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352157) (size!20923 a!3186)))))

(declare-fun res!534511 () Bool)

(assert (=> b!789372 (= res!534511 (= (select (arr!20503 a!3186) (index!34606 lt!352157)) (select (arr!20503 a!3186) j!159)))))

(assert (=> b!789372 (=> res!534511 e!438806)))

(declare-fun e!438805 () Bool)

(assert (=> b!789372 (= e!438805 e!438806)))

(declare-fun b!789373 () Bool)

(assert (=> b!789373 (= e!438804 e!438805)))

(declare-fun res!534513 () Bool)

(assert (=> b!789373 (= res!534513 (and ((_ is Intermediate!8059) lt!352157) (not (undefined!8871 lt!352157)) (bvslt (x!65698 lt!352157) #b01111111111111111111111111111110) (bvsge (x!65698 lt!352157) #b00000000000000000000000000000000) (bvsge (x!65698 lt!352157) #b00000000000000000000000000000000)))))

(assert (=> b!789373 (=> (not res!534513) (not e!438805))))

(assert (= (and d!103129 c!87839) b!789366))

(assert (= (and d!103129 (not c!87839)) b!789367))

(assert (= (and b!789367 c!87838) b!789365))

(assert (= (and b!789367 (not c!87838)) b!789370))

(assert (= (and d!103129 c!87840) b!789369))

(assert (= (and d!103129 (not c!87840)) b!789373))

(assert (= (and b!789373 res!534513) b!789372))

(assert (= (and b!789372 (not res!534511)) b!789368))

(assert (= (and b!789368 (not res!534512)) b!789371))

(assert (=> b!789370 m!730753))

(declare-fun m!731031 () Bool)

(assert (=> b!789370 m!731031))

(assert (=> b!789370 m!731031))

(assert (=> b!789370 m!730751))

(declare-fun m!731033 () Bool)

(assert (=> b!789370 m!731033))

(declare-fun m!731035 () Bool)

(assert (=> b!789371 m!731035))

(assert (=> d!103129 m!730753))

(declare-fun m!731037 () Bool)

(assert (=> d!103129 m!731037))

(assert (=> d!103129 m!730745))

(assert (=> b!789368 m!731035))

(assert (=> b!789372 m!731035))

(assert (=> b!788977 d!103129))

(declare-fun d!103131 () Bool)

(declare-fun lt!352169 () (_ BitVec 32))

(declare-fun lt!352168 () (_ BitVec 32))

(assert (=> d!103131 (= lt!352169 (bvmul (bvxor lt!352168 (bvlshr lt!352168 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!103131 (= lt!352168 ((_ extract 31 0) (bvand (bvxor (select (arr!20503 a!3186) j!159) (bvlshr (select (arr!20503 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!103131 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!534517 (let ((h!15541 ((_ extract 31 0) (bvand (bvxor (select (arr!20503 a!3186) j!159) (bvlshr (select (arr!20503 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65708 (bvmul (bvxor h!15541 (bvlshr h!15541 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65708 (bvlshr x!65708 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!534517 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!534517 #b00000000000000000000000000000000))))))

(assert (=> d!103131 (= (toIndex!0 (select (arr!20503 a!3186) j!159) mask!3328) (bvand (bvxor lt!352169 (bvlshr lt!352169 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!788977 d!103131))

(assert (=> b!788969 d!103101))

(declare-fun b!789398 () Bool)

(declare-fun e!438822 () SeekEntryResult!8059)

(declare-fun lt!352170 () SeekEntryResult!8059)

(assert (=> b!789398 (= e!438822 (Found!8059 (index!34606 lt!352170)))))

(declare-fun d!103141 () Bool)

(declare-fun lt!352172 () SeekEntryResult!8059)

(assert (=> d!103141 (and (or ((_ is Undefined!8059) lt!352172) (not ((_ is Found!8059) lt!352172)) (and (bvsge (index!34605 lt!352172) #b00000000000000000000000000000000) (bvslt (index!34605 lt!352172) (size!20923 lt!351979)))) (or ((_ is Undefined!8059) lt!352172) ((_ is Found!8059) lt!352172) (not ((_ is MissingZero!8059) lt!352172)) (and (bvsge (index!34604 lt!352172) #b00000000000000000000000000000000) (bvslt (index!34604 lt!352172) (size!20923 lt!351979)))) (or ((_ is Undefined!8059) lt!352172) ((_ is Found!8059) lt!352172) ((_ is MissingZero!8059) lt!352172) (not ((_ is MissingVacant!8059) lt!352172)) (and (bvsge (index!34607 lt!352172) #b00000000000000000000000000000000) (bvslt (index!34607 lt!352172) (size!20923 lt!351979)))) (or ((_ is Undefined!8059) lt!352172) (ite ((_ is Found!8059) lt!352172) (= (select (arr!20503 lt!351979) (index!34605 lt!352172)) lt!351988) (ite ((_ is MissingZero!8059) lt!352172) (= (select (arr!20503 lt!351979) (index!34604 lt!352172)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8059) lt!352172) (= (select (arr!20503 lt!351979) (index!34607 lt!352172)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!438820 () SeekEntryResult!8059)

(assert (=> d!103141 (= lt!352172 e!438820)))

(declare-fun c!87851 () Bool)

(assert (=> d!103141 (= c!87851 (and ((_ is Intermediate!8059) lt!352170) (undefined!8871 lt!352170)))))

(assert (=> d!103141 (= lt!352170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351988 mask!3328) lt!351988 lt!351979 mask!3328))))

(assert (=> d!103141 (validMask!0 mask!3328)))

(assert (=> d!103141 (= (seekEntryOrOpen!0 lt!351988 lt!351979 mask!3328) lt!352172)))

(declare-fun e!438821 () SeekEntryResult!8059)

(declare-fun b!789399 () Bool)

(assert (=> b!789399 (= e!438821 (seekKeyOrZeroReturnVacant!0 (x!65698 lt!352170) (index!34606 lt!352170) (index!34606 lt!352170) lt!351988 lt!351979 mask!3328))))

(declare-fun b!789400 () Bool)

(declare-fun c!87852 () Bool)

(declare-fun lt!352171 () (_ BitVec 64))

(assert (=> b!789400 (= c!87852 (= lt!352171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!789400 (= e!438822 e!438821)))

(declare-fun b!789401 () Bool)

(assert (=> b!789401 (= e!438821 (MissingZero!8059 (index!34606 lt!352170)))))

(declare-fun b!789402 () Bool)

(assert (=> b!789402 (= e!438820 Undefined!8059)))

(declare-fun b!789403 () Bool)

(assert (=> b!789403 (= e!438820 e!438822)))

(assert (=> b!789403 (= lt!352171 (select (arr!20503 lt!351979) (index!34606 lt!352170)))))

(declare-fun c!87850 () Bool)

(assert (=> b!789403 (= c!87850 (= lt!352171 lt!351988))))

(assert (= (and d!103141 c!87851) b!789402))

(assert (= (and d!103141 (not c!87851)) b!789403))

(assert (= (and b!789403 c!87850) b!789398))

(assert (= (and b!789403 (not c!87850)) b!789400))

(assert (= (and b!789400 c!87852) b!789401))

(assert (= (and b!789400 (not c!87852)) b!789399))

(declare-fun m!731061 () Bool)

(assert (=> d!103141 m!731061))

(assert (=> d!103141 m!730785))

(assert (=> d!103141 m!730789))

(declare-fun m!731063 () Bool)

(assert (=> d!103141 m!731063))

(declare-fun m!731065 () Bool)

(assert (=> d!103141 m!731065))

(assert (=> d!103141 m!730785))

(assert (=> d!103141 m!730745))

(declare-fun m!731067 () Bool)

(assert (=> b!789399 m!731067))

(declare-fun m!731069 () Bool)

(assert (=> b!789403 m!731069))

(assert (=> b!788979 d!103141))

(declare-fun lt!352178 () SeekEntryResult!8059)

(declare-fun d!103143 () Bool)

(assert (=> d!103143 (and (or ((_ is Undefined!8059) lt!352178) (not ((_ is Found!8059) lt!352178)) (and (bvsge (index!34605 lt!352178) #b00000000000000000000000000000000) (bvslt (index!34605 lt!352178) (size!20923 lt!351979)))) (or ((_ is Undefined!8059) lt!352178) ((_ is Found!8059) lt!352178) (not ((_ is MissingVacant!8059) lt!352178)) (not (= (index!34607 lt!352178) index!1321)) (and (bvsge (index!34607 lt!352178) #b00000000000000000000000000000000) (bvslt (index!34607 lt!352178) (size!20923 lt!351979)))) (or ((_ is Undefined!8059) lt!352178) (ite ((_ is Found!8059) lt!352178) (= (select (arr!20503 lt!351979) (index!34605 lt!352178)) lt!351988) (and ((_ is MissingVacant!8059) lt!352178) (= (index!34607 lt!352178) index!1321) (= (select (arr!20503 lt!351979) (index!34607 lt!352178)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!438823 () SeekEntryResult!8059)

(assert (=> d!103143 (= lt!352178 e!438823)))

(declare-fun c!87853 () Bool)

(assert (=> d!103143 (= c!87853 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!352177 () (_ BitVec 64))

(assert (=> d!103143 (= lt!352177 (select (arr!20503 lt!351979) index!1321))))

(assert (=> d!103143 (validMask!0 mask!3328)))

(assert (=> d!103143 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351988 lt!351979 mask!3328) lt!352178)))

(declare-fun b!789404 () Bool)

(declare-fun e!438824 () SeekEntryResult!8059)

(assert (=> b!789404 (= e!438824 (Found!8059 index!1321))))

(declare-fun b!789405 () Bool)

(declare-fun c!87855 () Bool)

(assert (=> b!789405 (= c!87855 (= lt!352177 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438825 () SeekEntryResult!8059)

(assert (=> b!789405 (= e!438824 e!438825)))

(declare-fun b!789406 () Bool)

(assert (=> b!789406 (= e!438823 e!438824)))

(declare-fun c!87854 () Bool)

(assert (=> b!789406 (= c!87854 (= lt!352177 lt!351988))))

(declare-fun b!789407 () Bool)

(assert (=> b!789407 (= e!438823 Undefined!8059)))

(declare-fun b!789408 () Bool)

(assert (=> b!789408 (= e!438825 (MissingVacant!8059 index!1321))))

(declare-fun b!789409 () Bool)

(assert (=> b!789409 (= e!438825 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) index!1321 lt!351988 lt!351979 mask!3328))))

(assert (= (and d!103143 c!87853) b!789407))

(assert (= (and d!103143 (not c!87853)) b!789406))

(assert (= (and b!789406 c!87854) b!789404))

(assert (= (and b!789406 (not c!87854)) b!789405))

(assert (= (and b!789405 c!87855) b!789408))

(assert (= (and b!789405 (not c!87855)) b!789409))

(declare-fun m!731071 () Bool)

(assert (=> d!103143 m!731071))

(declare-fun m!731073 () Bool)

(assert (=> d!103143 m!731073))

(declare-fun m!731075 () Bool)

(assert (=> d!103143 m!731075))

(assert (=> d!103143 m!730745))

(assert (=> b!789409 m!730971))

(assert (=> b!789409 m!730971))

(declare-fun m!731077 () Bool)

(assert (=> b!789409 m!731077))

(assert (=> b!788979 d!103143))

(declare-fun d!103145 () Bool)

(declare-fun res!534526 () Bool)

(declare-fun e!438830 () Bool)

(assert (=> d!103145 (=> res!534526 e!438830)))

(assert (=> d!103145 (= res!534526 (= (select (arr!20503 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!103145 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!438830)))

(declare-fun b!789414 () Bool)

(declare-fun e!438831 () Bool)

(assert (=> b!789414 (= e!438830 e!438831)))

(declare-fun res!534527 () Bool)

(assert (=> b!789414 (=> (not res!534527) (not e!438831))))

(assert (=> b!789414 (= res!534527 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20923 a!3186)))))

(declare-fun b!789415 () Bool)

(assert (=> b!789415 (= e!438831 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103145 (not res!534526)) b!789414))

(assert (= (and b!789414 res!534527) b!789415))

(assert (=> d!103145 m!730909))

(declare-fun m!731079 () Bool)

(assert (=> b!789415 m!731079))

(assert (=> b!788958 d!103145))

(declare-fun b!789416 () Bool)

(declare-fun e!438832 () SeekEntryResult!8059)

(assert (=> b!789416 (= e!438832 (Intermediate!8059 false index!1321 x!1131))))

(declare-fun b!789417 () Bool)

(declare-fun e!438833 () SeekEntryResult!8059)

(assert (=> b!789417 (= e!438833 (Intermediate!8059 true index!1321 x!1131))))

(declare-fun b!789418 () Bool)

(assert (=> b!789418 (= e!438833 e!438832)))

(declare-fun c!87856 () Bool)

(declare-fun lt!352181 () (_ BitVec 64))

(assert (=> b!789418 (= c!87856 (or (= lt!352181 lt!351988) (= (bvadd lt!352181 lt!352181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789419 () Bool)

(declare-fun lt!352182 () SeekEntryResult!8059)

(assert (=> b!789419 (and (bvsge (index!34606 lt!352182) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352182) (size!20923 lt!351979)))))

(declare-fun res!534529 () Bool)

(assert (=> b!789419 (= res!534529 (= (select (arr!20503 lt!351979) (index!34606 lt!352182)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438836 () Bool)

(assert (=> b!789419 (=> res!534529 e!438836)))

(declare-fun b!789420 () Bool)

(declare-fun e!438834 () Bool)

(assert (=> b!789420 (= e!438834 (bvsge (x!65698 lt!352182) #b01111111111111111111111111111110))))

(declare-fun b!789421 () Bool)

(assert (=> b!789421 (= e!438832 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!351988 lt!351979 mask!3328))))

(declare-fun b!789422 () Bool)

(assert (=> b!789422 (and (bvsge (index!34606 lt!352182) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352182) (size!20923 lt!351979)))))

(assert (=> b!789422 (= e!438836 (= (select (arr!20503 lt!351979) (index!34606 lt!352182)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!103149 () Bool)

(assert (=> d!103149 e!438834))

(declare-fun c!87858 () Bool)

(assert (=> d!103149 (= c!87858 (and ((_ is Intermediate!8059) lt!352182) (undefined!8871 lt!352182)))))

(assert (=> d!103149 (= lt!352182 e!438833)))

(declare-fun c!87857 () Bool)

(assert (=> d!103149 (= c!87857 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!103149 (= lt!352181 (select (arr!20503 lt!351979) index!1321))))

(assert (=> d!103149 (validMask!0 mask!3328)))

(assert (=> d!103149 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351988 lt!351979 mask!3328) lt!352182)))

(declare-fun b!789423 () Bool)

(assert (=> b!789423 (and (bvsge (index!34606 lt!352182) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352182) (size!20923 lt!351979)))))

(declare-fun res!534528 () Bool)

(assert (=> b!789423 (= res!534528 (= (select (arr!20503 lt!351979) (index!34606 lt!352182)) lt!351988))))

(assert (=> b!789423 (=> res!534528 e!438836)))

(declare-fun e!438835 () Bool)

(assert (=> b!789423 (= e!438835 e!438836)))

(declare-fun b!789424 () Bool)

(assert (=> b!789424 (= e!438834 e!438835)))

(declare-fun res!534530 () Bool)

(assert (=> b!789424 (= res!534530 (and ((_ is Intermediate!8059) lt!352182) (not (undefined!8871 lt!352182)) (bvslt (x!65698 lt!352182) #b01111111111111111111111111111110) (bvsge (x!65698 lt!352182) #b00000000000000000000000000000000) (bvsge (x!65698 lt!352182) x!1131)))))

(assert (=> b!789424 (=> (not res!534530) (not e!438835))))

(assert (= (and d!103149 c!87857) b!789417))

(assert (= (and d!103149 (not c!87857)) b!789418))

(assert (= (and b!789418 c!87856) b!789416))

(assert (= (and b!789418 (not c!87856)) b!789421))

(assert (= (and d!103149 c!87858) b!789420))

(assert (= (and d!103149 (not c!87858)) b!789424))

(assert (= (and b!789424 res!534530) b!789423))

(assert (= (and b!789423 (not res!534528)) b!789419))

(assert (= (and b!789419 (not res!534529)) b!789422))

(assert (=> b!789421 m!730971))

(assert (=> b!789421 m!730971))

(declare-fun m!731081 () Bool)

(assert (=> b!789421 m!731081))

(declare-fun m!731083 () Bool)

(assert (=> b!789422 m!731083))

(assert (=> d!103149 m!731075))

(assert (=> d!103149 m!730745))

(assert (=> b!789419 m!731083))

(assert (=> b!789423 m!731083))

(assert (=> b!788957 d!103149))

(declare-fun b!789435 () Bool)

(declare-fun e!438845 () SeekEntryResult!8059)

(assert (=> b!789435 (= e!438845 (Intermediate!8059 false (toIndex!0 lt!351988 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!789436 () Bool)

(declare-fun e!438846 () SeekEntryResult!8059)

(assert (=> b!789436 (= e!438846 (Intermediate!8059 true (toIndex!0 lt!351988 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!789437 () Bool)

(assert (=> b!789437 (= e!438846 e!438845)))

(declare-fun c!87861 () Bool)

(declare-fun lt!352183 () (_ BitVec 64))

(assert (=> b!789437 (= c!87861 (or (= lt!352183 lt!351988) (= (bvadd lt!352183 lt!352183) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789438 () Bool)

(declare-fun lt!352184 () SeekEntryResult!8059)

(assert (=> b!789438 (and (bvsge (index!34606 lt!352184) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352184) (size!20923 lt!351979)))))

(declare-fun res!534538 () Bool)

(assert (=> b!789438 (= res!534538 (= (select (arr!20503 lt!351979) (index!34606 lt!352184)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438849 () Bool)

(assert (=> b!789438 (=> res!534538 e!438849)))

(declare-fun b!789439 () Bool)

(declare-fun e!438847 () Bool)

(assert (=> b!789439 (= e!438847 (bvsge (x!65698 lt!352184) #b01111111111111111111111111111110))))

(declare-fun b!789440 () Bool)

(assert (=> b!789440 (= e!438845 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!351988 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!351988 lt!351979 mask!3328))))

(declare-fun b!789441 () Bool)

(assert (=> b!789441 (and (bvsge (index!34606 lt!352184) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352184) (size!20923 lt!351979)))))

(assert (=> b!789441 (= e!438849 (= (select (arr!20503 lt!351979) (index!34606 lt!352184)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!103153 () Bool)

(assert (=> d!103153 e!438847))

(declare-fun c!87863 () Bool)

(assert (=> d!103153 (= c!87863 (and ((_ is Intermediate!8059) lt!352184) (undefined!8871 lt!352184)))))

(assert (=> d!103153 (= lt!352184 e!438846)))

(declare-fun c!87862 () Bool)

(assert (=> d!103153 (= c!87862 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!103153 (= lt!352183 (select (arr!20503 lt!351979) (toIndex!0 lt!351988 mask!3328)))))

(assert (=> d!103153 (validMask!0 mask!3328)))

(assert (=> d!103153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351988 mask!3328) lt!351988 lt!351979 mask!3328) lt!352184)))

(declare-fun b!789442 () Bool)

(assert (=> b!789442 (and (bvsge (index!34606 lt!352184) #b00000000000000000000000000000000) (bvslt (index!34606 lt!352184) (size!20923 lt!351979)))))

(declare-fun res!534537 () Bool)

(assert (=> b!789442 (= res!534537 (= (select (arr!20503 lt!351979) (index!34606 lt!352184)) lt!351988))))

(assert (=> b!789442 (=> res!534537 e!438849)))

(declare-fun e!438848 () Bool)

(assert (=> b!789442 (= e!438848 e!438849)))

(declare-fun b!789443 () Bool)

(assert (=> b!789443 (= e!438847 e!438848)))

(declare-fun res!534539 () Bool)

(assert (=> b!789443 (= res!534539 (and ((_ is Intermediate!8059) lt!352184) (not (undefined!8871 lt!352184)) (bvslt (x!65698 lt!352184) #b01111111111111111111111111111110) (bvsge (x!65698 lt!352184) #b00000000000000000000000000000000) (bvsge (x!65698 lt!352184) #b00000000000000000000000000000000)))))

(assert (=> b!789443 (=> (not res!534539) (not e!438848))))

(assert (= (and d!103153 c!87862) b!789436))

(assert (= (and d!103153 (not c!87862)) b!789437))

(assert (= (and b!789437 c!87861) b!789435))

(assert (= (and b!789437 (not c!87861)) b!789440))

(assert (= (and d!103153 c!87863) b!789439))

(assert (= (and d!103153 (not c!87863)) b!789443))

(assert (= (and b!789443 res!534539) b!789442))

(assert (= (and b!789442 (not res!534537)) b!789438))

(assert (= (and b!789438 (not res!534538)) b!789441))

(assert (=> b!789440 m!730785))

(declare-fun m!731085 () Bool)

(assert (=> b!789440 m!731085))

(assert (=> b!789440 m!731085))

(declare-fun m!731089 () Bool)

(assert (=> b!789440 m!731089))

(declare-fun m!731091 () Bool)

(assert (=> b!789441 m!731091))

(assert (=> d!103153 m!730785))

(declare-fun m!731097 () Bool)

(assert (=> d!103153 m!731097))

(assert (=> d!103153 m!730745))

(assert (=> b!789438 m!731091))

(assert (=> b!789442 m!731091))

(assert (=> b!788957 d!103153))

(declare-fun d!103157 () Bool)

(declare-fun lt!352189 () (_ BitVec 32))

(declare-fun lt!352188 () (_ BitVec 32))

(assert (=> d!103157 (= lt!352189 (bvmul (bvxor lt!352188 (bvlshr lt!352188 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!103157 (= lt!352188 ((_ extract 31 0) (bvand (bvxor lt!351988 (bvlshr lt!351988 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!103157 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!534517 (let ((h!15541 ((_ extract 31 0) (bvand (bvxor lt!351988 (bvlshr lt!351988 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65708 (bvmul (bvxor h!15541 (bvlshr h!15541 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65708 (bvlshr x!65708 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!534517 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!534517 #b00000000000000000000000000000000))))))

(assert (=> d!103157 (= (toIndex!0 lt!351988 mask!3328) (bvand (bvxor lt!352189 (bvlshr lt!352189 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!788957 d!103157))

(declare-fun d!103161 () Bool)

(assert (=> d!103161 (= (validKeyInArray!0 (select (arr!20503 a!3186) j!159)) (and (not (= (select (arr!20503 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20503 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!788968 d!103161))

(declare-fun d!103163 () Bool)

(assert (=> d!103163 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67918 d!103163))

(declare-fun d!103179 () Bool)

(assert (=> d!103179 (= (array_inv!16362 a!3186) (bvsge (size!20923 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67918 d!103179))

(declare-fun b!789506 () Bool)

(declare-fun e!438890 () SeekEntryResult!8059)

(declare-fun lt!352203 () SeekEntryResult!8059)

(assert (=> b!789506 (= e!438890 (Found!8059 (index!34606 lt!352203)))))

(declare-fun d!103181 () Bool)

(declare-fun lt!352205 () SeekEntryResult!8059)

(assert (=> d!103181 (and (or ((_ is Undefined!8059) lt!352205) (not ((_ is Found!8059) lt!352205)) (and (bvsge (index!34605 lt!352205) #b00000000000000000000000000000000) (bvslt (index!34605 lt!352205) (size!20923 a!3186)))) (or ((_ is Undefined!8059) lt!352205) ((_ is Found!8059) lt!352205) (not ((_ is MissingZero!8059) lt!352205)) (and (bvsge (index!34604 lt!352205) #b00000000000000000000000000000000) (bvslt (index!34604 lt!352205) (size!20923 a!3186)))) (or ((_ is Undefined!8059) lt!352205) ((_ is Found!8059) lt!352205) ((_ is MissingZero!8059) lt!352205) (not ((_ is MissingVacant!8059) lt!352205)) (and (bvsge (index!34607 lt!352205) #b00000000000000000000000000000000) (bvslt (index!34607 lt!352205) (size!20923 a!3186)))) (or ((_ is Undefined!8059) lt!352205) (ite ((_ is Found!8059) lt!352205) (= (select (arr!20503 a!3186) (index!34605 lt!352205)) (select (arr!20503 a!3186) j!159)) (ite ((_ is MissingZero!8059) lt!352205) (= (select (arr!20503 a!3186) (index!34604 lt!352205)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8059) lt!352205) (= (select (arr!20503 a!3186) (index!34607 lt!352205)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!438888 () SeekEntryResult!8059)

(assert (=> d!103181 (= lt!352205 e!438888)))

(declare-fun c!87887 () Bool)

(assert (=> d!103181 (= c!87887 (and ((_ is Intermediate!8059) lt!352203) (undefined!8871 lt!352203)))))

(assert (=> d!103181 (= lt!352203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20503 a!3186) j!159) mask!3328) (select (arr!20503 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!103181 (validMask!0 mask!3328)))

(assert (=> d!103181 (= (seekEntryOrOpen!0 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!352205)))

(declare-fun e!438889 () SeekEntryResult!8059)

(declare-fun b!789507 () Bool)

(assert (=> b!789507 (= e!438889 (seekKeyOrZeroReturnVacant!0 (x!65698 lt!352203) (index!34606 lt!352203) (index!34606 lt!352203) (select (arr!20503 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789508 () Bool)

(declare-fun c!87888 () Bool)

(declare-fun lt!352204 () (_ BitVec 64))

(assert (=> b!789508 (= c!87888 (= lt!352204 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!789508 (= e!438890 e!438889)))

(declare-fun b!789509 () Bool)

(assert (=> b!789509 (= e!438889 (MissingZero!8059 (index!34606 lt!352203)))))

(declare-fun b!789510 () Bool)

(assert (=> b!789510 (= e!438888 Undefined!8059)))

(declare-fun b!789511 () Bool)

(assert (=> b!789511 (= e!438888 e!438890)))

(assert (=> b!789511 (= lt!352204 (select (arr!20503 a!3186) (index!34606 lt!352203)))))

(declare-fun c!87886 () Bool)

(assert (=> b!789511 (= c!87886 (= lt!352204 (select (arr!20503 a!3186) j!159)))))

(assert (= (and d!103181 c!87887) b!789510))

(assert (= (and d!103181 (not c!87887)) b!789511))

(assert (= (and b!789511 c!87886) b!789506))

(assert (= (and b!789511 (not c!87886)) b!789508))

(assert (= (and b!789508 c!87888) b!789509))

(assert (= (and b!789508 (not c!87888)) b!789507))

(declare-fun m!731153 () Bool)

(assert (=> d!103181 m!731153))

(assert (=> d!103181 m!730753))

(assert (=> d!103181 m!730751))

(assert (=> d!103181 m!730755))

(declare-fun m!731155 () Bool)

(assert (=> d!103181 m!731155))

(declare-fun m!731157 () Bool)

(assert (=> d!103181 m!731157))

(assert (=> d!103181 m!730751))

(assert (=> d!103181 m!730753))

(assert (=> d!103181 m!730745))

(assert (=> b!789507 m!730751))

(declare-fun m!731159 () Bool)

(assert (=> b!789507 m!731159))

(declare-fun m!731161 () Bool)

(assert (=> b!789511 m!731161))

(assert (=> b!788978 d!103181))

(declare-fun d!103185 () Bool)

(declare-fun res!534559 () Bool)

(declare-fun e!438892 () Bool)

(assert (=> d!103185 (=> res!534559 e!438892)))

(assert (=> d!103185 (= res!534559 (bvsge j!159 (size!20923 a!3186)))))

(assert (=> d!103185 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!438892)))

(declare-fun bm!35321 () Bool)

(declare-fun call!35324 () Bool)

(assert (=> bm!35321 (= call!35324 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!789512 () Bool)

(declare-fun e!438891 () Bool)

(declare-fun e!438893 () Bool)

(assert (=> b!789512 (= e!438891 e!438893)))

(declare-fun lt!352208 () (_ BitVec 64))

(assert (=> b!789512 (= lt!352208 (select (arr!20503 a!3186) j!159))))

(declare-fun lt!352209 () Unit!27301)

(assert (=> b!789512 (= lt!352209 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!352208 j!159))))

(assert (=> b!789512 (arrayContainsKey!0 a!3186 lt!352208 #b00000000000000000000000000000000)))

(declare-fun lt!352210 () Unit!27301)

(assert (=> b!789512 (= lt!352210 lt!352209)))

(declare-fun res!534558 () Bool)

(assert (=> b!789512 (= res!534558 (= (seekEntryOrOpen!0 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) (Found!8059 j!159)))))

(assert (=> b!789512 (=> (not res!534558) (not e!438893))))

(declare-fun b!789513 () Bool)

(assert (=> b!789513 (= e!438891 call!35324)))

(declare-fun b!789514 () Bool)

(assert (=> b!789514 (= e!438893 call!35324)))

(declare-fun b!789515 () Bool)

(assert (=> b!789515 (= e!438892 e!438891)))

(declare-fun c!87889 () Bool)

(assert (=> b!789515 (= c!87889 (validKeyInArray!0 (select (arr!20503 a!3186) j!159)))))

(assert (= (and d!103185 (not res!534559)) b!789515))

(assert (= (and b!789515 c!87889) b!789512))

(assert (= (and b!789515 (not c!87889)) b!789513))

(assert (= (and b!789512 res!534558) b!789514))

(assert (= (or b!789514 b!789513) bm!35321))

(declare-fun m!731163 () Bool)

(assert (=> bm!35321 m!731163))

(assert (=> b!789512 m!730751))

(declare-fun m!731165 () Bool)

(assert (=> b!789512 m!731165))

(declare-fun m!731167 () Bool)

(assert (=> b!789512 m!731167))

(assert (=> b!789512 m!730751))

(assert (=> b!789512 m!730775))

(assert (=> b!789515 m!730751))

(assert (=> b!789515 m!730751))

(assert (=> b!789515 m!730765))

(assert (=> b!788978 d!103185))

(declare-fun d!103187 () Bool)

(assert (=> d!103187 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352213 () Unit!27301)

(declare-fun choose!38 (array!42838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27301)

(assert (=> d!103187 (= lt!352213 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!103187 (validMask!0 mask!3328)))

(assert (=> d!103187 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!352213)))

(declare-fun bs!21852 () Bool)

(assert (= bs!21852 d!103187))

(assert (=> bs!21852 m!730777))

(declare-fun m!731169 () Bool)

(assert (=> bs!21852 m!731169))

(assert (=> bs!21852 m!730745))

(assert (=> b!788978 d!103187))

(check-sat (not b!789440) (not d!103149) (not b!789364) (not d!103143) (not b!789188) (not d!103153) (not d!103111) (not b!789129) (not b!789370) (not d!103129) (not bm!35304) (not d!103109) (not bm!35321) (not b!789415) (not bm!35314) (not b!789421) (not b!789360) (not d!103087) (not b!789252) (not d!103101) (not b!789362) (not b!789399) (not b!789316) (not b!789512) (not d!103141) (not b!789126) (not b!789246) (not b!789515) (not b!789409) (not d!103181) (not d!103187) (not b!789507))
(check-sat)
