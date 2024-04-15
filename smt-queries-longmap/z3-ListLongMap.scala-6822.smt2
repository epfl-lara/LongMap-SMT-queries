; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85782 () Bool)

(assert start!85782)

(declare-fun res!665449 () Bool)

(declare-fun e!561384 () Bool)

(assert (=> start!85782 (=> (not res!665449) (not e!561384))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85782 (= res!665449 (validMask!0 mask!3464))))

(assert (=> start!85782 e!561384))

(declare-datatypes ((array!62902 0))(
  ( (array!62903 (arr!30288 (Array (_ BitVec 32) (_ BitVec 64))) (size!30792 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62902)

(declare-fun array_inv!23431 (array!62902) Bool)

(assert (=> start!85782 (array_inv!23431 a!3219)))

(assert (=> start!85782 true))

(declare-fun b!994884 () Bool)

(declare-fun res!665444 () Bool)

(declare-fun e!561385 () Bool)

(assert (=> b!994884 (=> (not res!665444) (not e!561385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62902 (_ BitVec 32)) Bool)

(assert (=> b!994884 (= res!665444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!994885 () Bool)

(declare-datatypes ((List!21030 0))(
  ( (Nil!21027) (Cons!21026 (h!22188 (_ BitVec 64)) (t!30022 List!21030)) )
))
(declare-fun noDuplicate!1462 (List!21030) Bool)

(assert (=> b!994885 (= e!561385 (not (noDuplicate!1462 Nil!21027)))))

(declare-fun b!994886 () Bool)

(declare-fun res!665445 () Bool)

(assert (=> b!994886 (=> (not res!665445) (not e!561384))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994886 (= res!665445 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994887 () Bool)

(declare-fun res!665450 () Bool)

(assert (=> b!994887 (=> (not res!665450) (not e!561384))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994887 (= res!665450 (and (= (size!30792 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30792 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30792 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994888 () Bool)

(declare-fun res!665443 () Bool)

(assert (=> b!994888 (=> (not res!665443) (not e!561384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994888 (= res!665443 (validKeyInArray!0 k0!2224))))

(declare-fun b!994889 () Bool)

(declare-fun res!665447 () Bool)

(assert (=> b!994889 (=> (not res!665447) (not e!561384))))

(assert (=> b!994889 (= res!665447 (validKeyInArray!0 (select (arr!30288 a!3219) j!170)))))

(declare-fun b!994890 () Bool)

(assert (=> b!994890 (= e!561384 e!561385)))

(declare-fun res!665446 () Bool)

(assert (=> b!994890 (=> (not res!665446) (not e!561385))))

(declare-datatypes ((SeekEntryResult!9245 0))(
  ( (MissingZero!9245 (index!39351 (_ BitVec 32))) (Found!9245 (index!39352 (_ BitVec 32))) (Intermediate!9245 (undefined!10057 Bool) (index!39353 (_ BitVec 32)) (x!86809 (_ BitVec 32))) (Undefined!9245) (MissingVacant!9245 (index!39354 (_ BitVec 32))) )
))
(declare-fun lt!440620 () SeekEntryResult!9245)

(assert (=> b!994890 (= res!665446 (or (= lt!440620 (MissingVacant!9245 i!1194)) (= lt!440620 (MissingZero!9245 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62902 (_ BitVec 32)) SeekEntryResult!9245)

(assert (=> b!994890 (= lt!440620 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!994891 () Bool)

(declare-fun res!665448 () Bool)

(assert (=> b!994891 (=> (not res!665448) (not e!561385))))

(assert (=> b!994891 (= res!665448 (and (bvsle #b00000000000000000000000000000000 (size!30792 a!3219)) (bvslt (size!30792 a!3219) #b01111111111111111111111111111111)))))

(assert (= (and start!85782 res!665449) b!994887))

(assert (= (and b!994887 res!665450) b!994889))

(assert (= (and b!994889 res!665447) b!994888))

(assert (= (and b!994888 res!665443) b!994886))

(assert (= (and b!994886 res!665445) b!994890))

(assert (= (and b!994890 res!665446) b!994884))

(assert (= (and b!994884 res!665444) b!994891))

(assert (= (and b!994891 res!665448) b!994885))

(declare-fun m!921853 () Bool)

(assert (=> b!994890 m!921853))

(declare-fun m!921855 () Bool)

(assert (=> b!994889 m!921855))

(assert (=> b!994889 m!921855))

(declare-fun m!921857 () Bool)

(assert (=> b!994889 m!921857))

(declare-fun m!921859 () Bool)

(assert (=> start!85782 m!921859))

(declare-fun m!921861 () Bool)

(assert (=> start!85782 m!921861))

(declare-fun m!921863 () Bool)

(assert (=> b!994885 m!921863))

(declare-fun m!921865 () Bool)

(assert (=> b!994888 m!921865))

(declare-fun m!921867 () Bool)

(assert (=> b!994886 m!921867))

(declare-fun m!921869 () Bool)

(assert (=> b!994884 m!921869))

(check-sat (not start!85782) (not b!994884) (not b!994886) (not b!994888) (not b!994890) (not b!994889) (not b!994885))
(check-sat)
(get-model)

(declare-fun d!118613 () Bool)

(declare-fun res!665503 () Bool)

(declare-fun e!561409 () Bool)

(assert (=> d!118613 (=> res!665503 e!561409)))

(assert (=> d!118613 (= res!665503 (= (select (arr!30288 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!118613 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!561409)))

(declare-fun b!994944 () Bool)

(declare-fun e!561410 () Bool)

(assert (=> b!994944 (= e!561409 e!561410)))

(declare-fun res!665504 () Bool)

(assert (=> b!994944 (=> (not res!665504) (not e!561410))))

(assert (=> b!994944 (= res!665504 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30792 a!3219)))))

(declare-fun b!994945 () Bool)

(assert (=> b!994945 (= e!561410 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118613 (not res!665503)) b!994944))

(assert (= (and b!994944 res!665504) b!994945))

(declare-fun m!921907 () Bool)

(assert (=> d!118613 m!921907))

(declare-fun m!921909 () Bool)

(assert (=> b!994945 m!921909))

(assert (=> b!994886 d!118613))

(declare-fun d!118615 () Bool)

(declare-fun res!665509 () Bool)

(declare-fun e!561415 () Bool)

(assert (=> d!118615 (=> res!665509 e!561415)))

(get-info :version)

(assert (=> d!118615 (= res!665509 ((_ is Nil!21027) Nil!21027))))

(assert (=> d!118615 (= (noDuplicate!1462 Nil!21027) e!561415)))

(declare-fun b!994950 () Bool)

(declare-fun e!561416 () Bool)

(assert (=> b!994950 (= e!561415 e!561416)))

(declare-fun res!665510 () Bool)

(assert (=> b!994950 (=> (not res!665510) (not e!561416))))

(declare-fun contains!5829 (List!21030 (_ BitVec 64)) Bool)

(assert (=> b!994950 (= res!665510 (not (contains!5829 (t!30022 Nil!21027) (h!22188 Nil!21027))))))

(declare-fun b!994951 () Bool)

(assert (=> b!994951 (= e!561416 (noDuplicate!1462 (t!30022 Nil!21027)))))

(assert (= (and d!118615 (not res!665509)) b!994950))

(assert (= (and b!994950 res!665510) b!994951))

(declare-fun m!921911 () Bool)

(assert (=> b!994950 m!921911))

(declare-fun m!921913 () Bool)

(assert (=> b!994951 m!921913))

(assert (=> b!994885 d!118615))

(declare-fun d!118617 () Bool)

(assert (=> d!118617 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994888 d!118617))

(declare-fun d!118619 () Bool)

(assert (=> d!118619 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85782 d!118619))

(declare-fun d!118629 () Bool)

(assert (=> d!118629 (= (array_inv!23431 a!3219) (bvsge (size!30792 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85782 d!118629))

(declare-fun b!995018 () Bool)

(declare-fun c!100881 () Bool)

(declare-fun lt!440651 () (_ BitVec 64))

(assert (=> b!995018 (= c!100881 (= lt!440651 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561465 () SeekEntryResult!9245)

(declare-fun e!561466 () SeekEntryResult!9245)

(assert (=> b!995018 (= e!561465 e!561466)))

(declare-fun b!995019 () Bool)

(declare-fun lt!440653 () SeekEntryResult!9245)

(assert (=> b!995019 (= e!561465 (Found!9245 (index!39353 lt!440653)))))

(declare-fun b!995020 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62902 (_ BitVec 32)) SeekEntryResult!9245)

(assert (=> b!995020 (= e!561466 (seekKeyOrZeroReturnVacant!0 (x!86809 lt!440653) (index!39353 lt!440653) (index!39353 lt!440653) k0!2224 a!3219 mask!3464))))

(declare-fun b!995021 () Bool)

(declare-fun e!561467 () SeekEntryResult!9245)

(assert (=> b!995021 (= e!561467 Undefined!9245)))

(declare-fun b!995022 () Bool)

(assert (=> b!995022 (= e!561466 (MissingZero!9245 (index!39353 lt!440653)))))

(declare-fun b!995023 () Bool)

(assert (=> b!995023 (= e!561467 e!561465)))

(assert (=> b!995023 (= lt!440651 (select (arr!30288 a!3219) (index!39353 lt!440653)))))

(declare-fun c!100882 () Bool)

(assert (=> b!995023 (= c!100882 (= lt!440651 k0!2224))))

(declare-fun d!118631 () Bool)

(declare-fun lt!440652 () SeekEntryResult!9245)

(assert (=> d!118631 (and (or ((_ is Undefined!9245) lt!440652) (not ((_ is Found!9245) lt!440652)) (and (bvsge (index!39352 lt!440652) #b00000000000000000000000000000000) (bvslt (index!39352 lt!440652) (size!30792 a!3219)))) (or ((_ is Undefined!9245) lt!440652) ((_ is Found!9245) lt!440652) (not ((_ is MissingZero!9245) lt!440652)) (and (bvsge (index!39351 lt!440652) #b00000000000000000000000000000000) (bvslt (index!39351 lt!440652) (size!30792 a!3219)))) (or ((_ is Undefined!9245) lt!440652) ((_ is Found!9245) lt!440652) ((_ is MissingZero!9245) lt!440652) (not ((_ is MissingVacant!9245) lt!440652)) (and (bvsge (index!39354 lt!440652) #b00000000000000000000000000000000) (bvslt (index!39354 lt!440652) (size!30792 a!3219)))) (or ((_ is Undefined!9245) lt!440652) (ite ((_ is Found!9245) lt!440652) (= (select (arr!30288 a!3219) (index!39352 lt!440652)) k0!2224) (ite ((_ is MissingZero!9245) lt!440652) (= (select (arr!30288 a!3219) (index!39351 lt!440652)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9245) lt!440652) (= (select (arr!30288 a!3219) (index!39354 lt!440652)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118631 (= lt!440652 e!561467)))

(declare-fun c!100880 () Bool)

(assert (=> d!118631 (= c!100880 (and ((_ is Intermediate!9245) lt!440653) (undefined!10057 lt!440653)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62902 (_ BitVec 32)) SeekEntryResult!9245)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118631 (= lt!440653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!118631 (validMask!0 mask!3464)))

(assert (=> d!118631 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!440652)))

(assert (= (and d!118631 c!100880) b!995021))

(assert (= (and d!118631 (not c!100880)) b!995023))

(assert (= (and b!995023 c!100882) b!995019))

(assert (= (and b!995023 (not c!100882)) b!995018))

(assert (= (and b!995018 c!100881) b!995022))

(assert (= (and b!995018 (not c!100881)) b!995020))

(declare-fun m!921955 () Bool)

(assert (=> b!995020 m!921955))

(declare-fun m!921957 () Bool)

(assert (=> b!995023 m!921957))

(declare-fun m!921959 () Bool)

(assert (=> d!118631 m!921959))

(declare-fun m!921961 () Bool)

(assert (=> d!118631 m!921961))

(assert (=> d!118631 m!921859))

(declare-fun m!921963 () Bool)

(assert (=> d!118631 m!921963))

(assert (=> d!118631 m!921961))

(declare-fun m!921965 () Bool)

(assert (=> d!118631 m!921965))

(declare-fun m!921967 () Bool)

(assert (=> d!118631 m!921967))

(assert (=> b!994890 d!118631))

(declare-fun d!118649 () Bool)

(assert (=> d!118649 (= (validKeyInArray!0 (select (arr!30288 a!3219) j!170)) (and (not (= (select (arr!30288 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30288 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994889 d!118649))

(declare-fun d!118651 () Bool)

(declare-fun res!665552 () Bool)

(declare-fun e!561483 () Bool)

(assert (=> d!118651 (=> res!665552 e!561483)))

(assert (=> d!118651 (= res!665552 (bvsge #b00000000000000000000000000000000 (size!30792 a!3219)))))

(assert (=> d!118651 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561483)))

(declare-fun b!995044 () Bool)

(declare-fun e!561484 () Bool)

(declare-fun e!561485 () Bool)

(assert (=> b!995044 (= e!561484 e!561485)))

(declare-fun lt!440670 () (_ BitVec 64))

(assert (=> b!995044 (= lt!440670 (select (arr!30288 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32823 0))(
  ( (Unit!32824) )
))
(declare-fun lt!440671 () Unit!32823)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62902 (_ BitVec 64) (_ BitVec 32)) Unit!32823)

(assert (=> b!995044 (= lt!440671 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440670 #b00000000000000000000000000000000))))

(assert (=> b!995044 (arrayContainsKey!0 a!3219 lt!440670 #b00000000000000000000000000000000)))

(declare-fun lt!440669 () Unit!32823)

(assert (=> b!995044 (= lt!440669 lt!440671)))

(declare-fun res!665551 () Bool)

(assert (=> b!995044 (= res!665551 (= (seekEntryOrOpen!0 (select (arr!30288 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9245 #b00000000000000000000000000000000)))))

(assert (=> b!995044 (=> (not res!665551) (not e!561485))))

(declare-fun b!995045 () Bool)

(declare-fun call!42169 () Bool)

(assert (=> b!995045 (= e!561484 call!42169)))

(declare-fun b!995046 () Bool)

(assert (=> b!995046 (= e!561483 e!561484)))

(declare-fun c!100888 () Bool)

(assert (=> b!995046 (= c!100888 (validKeyInArray!0 (select (arr!30288 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995047 () Bool)

(assert (=> b!995047 (= e!561485 call!42169)))

(declare-fun bm!42166 () Bool)

(assert (=> bm!42166 (= call!42169 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!118651 (not res!665552)) b!995046))

(assert (= (and b!995046 c!100888) b!995044))

(assert (= (and b!995046 (not c!100888)) b!995045))

(assert (= (and b!995044 res!665551) b!995047))

(assert (= (or b!995047 b!995045) bm!42166))

(assert (=> b!995044 m!921907))

(declare-fun m!921979 () Bool)

(assert (=> b!995044 m!921979))

(declare-fun m!921981 () Bool)

(assert (=> b!995044 m!921981))

(assert (=> b!995044 m!921907))

(declare-fun m!921983 () Bool)

(assert (=> b!995044 m!921983))

(assert (=> b!995046 m!921907))

(assert (=> b!995046 m!921907))

(declare-fun m!921985 () Bool)

(assert (=> b!995046 m!921985))

(declare-fun m!921987 () Bool)

(assert (=> bm!42166 m!921987))

(assert (=> b!994884 d!118651))

(check-sat (not d!118631) (not b!995020) (not b!995046) (not b!994951) (not b!994950) (not b!994945) (not bm!42166) (not b!995044))
(check-sat)
