; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86142 () Bool)

(assert start!86142)

(declare-fun b!997515 () Bool)

(declare-fun res!667603 () Bool)

(declare-fun e!562577 () Bool)

(assert (=> b!997515 (=> (not res!667603) (not e!562577))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997515 (= res!667603 (validKeyInArray!0 k0!2224))))

(declare-fun b!997516 () Bool)

(declare-fun e!562579 () Bool)

(declare-fun e!562580 () Bool)

(assert (=> b!997516 (= e!562579 e!562580)))

(declare-fun res!667601 () Bool)

(assert (=> b!997516 (=> (not res!667601) (not e!562580))))

(declare-datatypes ((array!63043 0))(
  ( (array!63044 (arr!30351 (Array (_ BitVec 32) (_ BitVec 64))) (size!30855 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63043)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9308 0))(
  ( (MissingZero!9308 (index!39603 (_ BitVec 32))) (Found!9308 (index!39604 (_ BitVec 32))) (Intermediate!9308 (undefined!10120 Bool) (index!39605 (_ BitVec 32)) (x!87049 (_ BitVec 32))) (Undefined!9308) (MissingVacant!9308 (index!39606 (_ BitVec 32))) )
))
(declare-fun lt!441283 () SeekEntryResult!9308)

(declare-fun lt!441282 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63043 (_ BitVec 32)) SeekEntryResult!9308)

(assert (=> b!997516 (= res!667601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!441282 (select (arr!30351 a!3219) j!170) a!3219 mask!3464) lt!441283))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997516 (= lt!441283 (Intermediate!9308 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997516 (= lt!441282 (toIndex!0 (select (arr!30351 a!3219) j!170) mask!3464))))

(declare-fun b!997517 () Bool)

(declare-fun res!667594 () Bool)

(assert (=> b!997517 (=> (not res!667594) (not e!562579))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!997517 (= res!667594 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30855 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30855 a!3219))))))

(declare-fun b!997518 () Bool)

(declare-fun res!667602 () Bool)

(assert (=> b!997518 (=> (not res!667602) (not e!562579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63043 (_ BitVec 32)) Bool)

(assert (=> b!997518 (= res!667602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997519 () Bool)

(declare-fun res!667598 () Bool)

(assert (=> b!997519 (=> (not res!667598) (not e!562577))))

(assert (=> b!997519 (= res!667598 (validKeyInArray!0 (select (arr!30351 a!3219) j!170)))))

(declare-fun b!997520 () Bool)

(declare-fun res!667595 () Bool)

(assert (=> b!997520 (=> (not res!667595) (not e!562577))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997520 (= res!667595 (and (= (size!30855 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30855 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30855 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997521 () Bool)

(assert (=> b!997521 (= e!562580 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441282 #b00000000000000000000000000000000) (bvsge lt!441282 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun b!997523 () Bool)

(declare-fun res!667597 () Bool)

(assert (=> b!997523 (=> (not res!667597) (not e!562580))))

(assert (=> b!997523 (= res!667597 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30351 a!3219) j!170) a!3219 mask!3464) lt!441283))))

(declare-fun b!997522 () Bool)

(declare-fun res!667596 () Bool)

(assert (=> b!997522 (=> (not res!667596) (not e!562577))))

(declare-fun arrayContainsKey!0 (array!63043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997522 (= res!667596 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!667600 () Bool)

(assert (=> start!86142 (=> (not res!667600) (not e!562577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86142 (= res!667600 (validMask!0 mask!3464))))

(assert (=> start!86142 e!562577))

(declare-fun array_inv!23494 (array!63043) Bool)

(assert (=> start!86142 (array_inv!23494 a!3219)))

(assert (=> start!86142 true))

(declare-fun b!997524 () Bool)

(declare-fun res!667599 () Bool)

(assert (=> b!997524 (=> (not res!667599) (not e!562579))))

(declare-datatypes ((List!21093 0))(
  ( (Nil!21090) (Cons!21089 (h!22257 (_ BitVec 64)) (t!30085 List!21093)) )
))
(declare-fun arrayNoDuplicates!0 (array!63043 (_ BitVec 32) List!21093) Bool)

(assert (=> b!997524 (= res!667599 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21090))))

(declare-fun b!997525 () Bool)

(assert (=> b!997525 (= e!562577 e!562579)))

(declare-fun res!667604 () Bool)

(assert (=> b!997525 (=> (not res!667604) (not e!562579))))

(declare-fun lt!441281 () SeekEntryResult!9308)

(assert (=> b!997525 (= res!667604 (or (= lt!441281 (MissingVacant!9308 i!1194)) (= lt!441281 (MissingZero!9308 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63043 (_ BitVec 32)) SeekEntryResult!9308)

(assert (=> b!997525 (= lt!441281 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86142 res!667600) b!997520))

(assert (= (and b!997520 res!667595) b!997519))

(assert (= (and b!997519 res!667598) b!997515))

(assert (= (and b!997515 res!667603) b!997522))

(assert (= (and b!997522 res!667596) b!997525))

(assert (= (and b!997525 res!667604) b!997518))

(assert (= (and b!997518 res!667602) b!997524))

(assert (= (and b!997524 res!667599) b!997517))

(assert (= (and b!997517 res!667594) b!997516))

(assert (= (and b!997516 res!667601) b!997523))

(assert (= (and b!997523 res!667597) b!997521))

(declare-fun m!923755 () Bool)

(assert (=> b!997523 m!923755))

(assert (=> b!997523 m!923755))

(declare-fun m!923757 () Bool)

(assert (=> b!997523 m!923757))

(assert (=> b!997519 m!923755))

(assert (=> b!997519 m!923755))

(declare-fun m!923759 () Bool)

(assert (=> b!997519 m!923759))

(assert (=> b!997516 m!923755))

(assert (=> b!997516 m!923755))

(declare-fun m!923761 () Bool)

(assert (=> b!997516 m!923761))

(assert (=> b!997516 m!923755))

(declare-fun m!923763 () Bool)

(assert (=> b!997516 m!923763))

(declare-fun m!923765 () Bool)

(assert (=> b!997522 m!923765))

(declare-fun m!923767 () Bool)

(assert (=> b!997525 m!923767))

(declare-fun m!923769 () Bool)

(assert (=> b!997524 m!923769))

(declare-fun m!923771 () Bool)

(assert (=> b!997518 m!923771))

(declare-fun m!923773 () Bool)

(assert (=> start!86142 m!923773))

(declare-fun m!923775 () Bool)

(assert (=> start!86142 m!923775))

(declare-fun m!923777 () Bool)

(assert (=> b!997515 m!923777))

(check-sat (not b!997519) (not b!997523) (not b!997524) (not b!997516) (not b!997515) (not start!86142) (not b!997525) (not b!997522) (not b!997518))
(check-sat)
(get-model)

(declare-fun b!997604 () Bool)

(declare-fun e!562613 () SeekEntryResult!9308)

(assert (=> b!997604 (= e!562613 Undefined!9308)))

(declare-fun b!997605 () Bool)

(declare-fun e!562611 () SeekEntryResult!9308)

(declare-fun lt!441310 () SeekEntryResult!9308)

(assert (=> b!997605 (= e!562611 (Found!9308 (index!39605 lt!441310)))))

(declare-fun b!997606 () Bool)

(assert (=> b!997606 (= e!562613 e!562611)))

(declare-fun lt!441309 () (_ BitVec 64))

(assert (=> b!997606 (= lt!441309 (select (arr!30351 a!3219) (index!39605 lt!441310)))))

(declare-fun c!101111 () Bool)

(assert (=> b!997606 (= c!101111 (= lt!441309 k0!2224))))

(declare-fun b!997607 () Bool)

(declare-fun c!101113 () Bool)

(assert (=> b!997607 (= c!101113 (= lt!441309 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562612 () SeekEntryResult!9308)

(assert (=> b!997607 (= e!562611 e!562612)))

(declare-fun b!997608 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63043 (_ BitVec 32)) SeekEntryResult!9308)

(assert (=> b!997608 (= e!562612 (seekKeyOrZeroReturnVacant!0 (x!87049 lt!441310) (index!39605 lt!441310) (index!39605 lt!441310) k0!2224 a!3219 mask!3464))))

(declare-fun b!997609 () Bool)

(assert (=> b!997609 (= e!562612 (MissingZero!9308 (index!39605 lt!441310)))))

(declare-fun d!118931 () Bool)

(declare-fun lt!441308 () SeekEntryResult!9308)

(get-info :version)

(assert (=> d!118931 (and (or ((_ is Undefined!9308) lt!441308) (not ((_ is Found!9308) lt!441308)) (and (bvsge (index!39604 lt!441308) #b00000000000000000000000000000000) (bvslt (index!39604 lt!441308) (size!30855 a!3219)))) (or ((_ is Undefined!9308) lt!441308) ((_ is Found!9308) lt!441308) (not ((_ is MissingZero!9308) lt!441308)) (and (bvsge (index!39603 lt!441308) #b00000000000000000000000000000000) (bvslt (index!39603 lt!441308) (size!30855 a!3219)))) (or ((_ is Undefined!9308) lt!441308) ((_ is Found!9308) lt!441308) ((_ is MissingZero!9308) lt!441308) (not ((_ is MissingVacant!9308) lt!441308)) (and (bvsge (index!39606 lt!441308) #b00000000000000000000000000000000) (bvslt (index!39606 lt!441308) (size!30855 a!3219)))) (or ((_ is Undefined!9308) lt!441308) (ite ((_ is Found!9308) lt!441308) (= (select (arr!30351 a!3219) (index!39604 lt!441308)) k0!2224) (ite ((_ is MissingZero!9308) lt!441308) (= (select (arr!30351 a!3219) (index!39603 lt!441308)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9308) lt!441308) (= (select (arr!30351 a!3219) (index!39606 lt!441308)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118931 (= lt!441308 e!562613)))

(declare-fun c!101112 () Bool)

(assert (=> d!118931 (= c!101112 (and ((_ is Intermediate!9308) lt!441310) (undefined!10120 lt!441310)))))

(assert (=> d!118931 (= lt!441310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!118931 (validMask!0 mask!3464)))

(assert (=> d!118931 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441308)))

(assert (= (and d!118931 c!101112) b!997604))

(assert (= (and d!118931 (not c!101112)) b!997606))

(assert (= (and b!997606 c!101111) b!997605))

(assert (= (and b!997606 (not c!101111)) b!997607))

(assert (= (and b!997607 c!101113) b!997609))

(assert (= (and b!997607 (not c!101113)) b!997608))

(declare-fun m!923827 () Bool)

(assert (=> b!997606 m!923827))

(declare-fun m!923829 () Bool)

(assert (=> b!997608 m!923829))

(declare-fun m!923831 () Bool)

(assert (=> d!118931 m!923831))

(declare-fun m!923833 () Bool)

(assert (=> d!118931 m!923833))

(declare-fun m!923835 () Bool)

(assert (=> d!118931 m!923835))

(declare-fun m!923837 () Bool)

(assert (=> d!118931 m!923837))

(declare-fun m!923839 () Bool)

(assert (=> d!118931 m!923839))

(assert (=> d!118931 m!923773))

(assert (=> d!118931 m!923833))

(assert (=> b!997525 d!118931))

(declare-fun d!118937 () Bool)

(assert (=> d!118937 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997515 d!118937))

(declare-fun b!997651 () Bool)

(declare-fun e!562642 () Bool)

(declare-fun call!42235 () Bool)

(assert (=> b!997651 (= e!562642 call!42235)))

(declare-fun b!997652 () Bool)

(declare-fun e!562641 () Bool)

(declare-fun e!562640 () Bool)

(assert (=> b!997652 (= e!562641 e!562640)))

(declare-fun res!667685 () Bool)

(assert (=> b!997652 (=> (not res!667685) (not e!562640))))

(declare-fun e!562643 () Bool)

(assert (=> b!997652 (= res!667685 (not e!562643))))

(declare-fun res!667687 () Bool)

(assert (=> b!997652 (=> (not res!667687) (not e!562643))))

(assert (=> b!997652 (= res!667687 (validKeyInArray!0 (select (arr!30351 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997653 () Bool)

(assert (=> b!997653 (= e!562642 call!42235)))

(declare-fun b!997654 () Bool)

(declare-fun contains!5844 (List!21093 (_ BitVec 64)) Bool)

(assert (=> b!997654 (= e!562643 (contains!5844 Nil!21090 (select (arr!30351 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42232 () Bool)

(declare-fun c!101128 () Bool)

(assert (=> bm!42232 (= call!42235 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101128 (Cons!21089 (select (arr!30351 a!3219) #b00000000000000000000000000000000) Nil!21090) Nil!21090)))))

(declare-fun d!118939 () Bool)

(declare-fun res!667686 () Bool)

(assert (=> d!118939 (=> res!667686 e!562641)))

(assert (=> d!118939 (= res!667686 (bvsge #b00000000000000000000000000000000 (size!30855 a!3219)))))

(assert (=> d!118939 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21090) e!562641)))

(declare-fun b!997650 () Bool)

(assert (=> b!997650 (= e!562640 e!562642)))

(assert (=> b!997650 (= c!101128 (validKeyInArray!0 (select (arr!30351 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!118939 (not res!667686)) b!997652))

(assert (= (and b!997652 res!667687) b!997654))

(assert (= (and b!997652 res!667685) b!997650))

(assert (= (and b!997650 c!101128) b!997653))

(assert (= (and b!997650 (not c!101128)) b!997651))

(assert (= (or b!997653 b!997651) bm!42232))

(declare-fun m!923841 () Bool)

(assert (=> b!997652 m!923841))

(assert (=> b!997652 m!923841))

(declare-fun m!923843 () Bool)

(assert (=> b!997652 m!923843))

(assert (=> b!997654 m!923841))

(assert (=> b!997654 m!923841))

(declare-fun m!923845 () Bool)

(assert (=> b!997654 m!923845))

(assert (=> bm!42232 m!923841))

(declare-fun m!923847 () Bool)

(assert (=> bm!42232 m!923847))

(assert (=> b!997650 m!923841))

(assert (=> b!997650 m!923841))

(assert (=> b!997650 m!923843))

(assert (=> b!997524 d!118939))

(declare-fun d!118941 () Bool)

(assert (=> d!118941 (= (validKeyInArray!0 (select (arr!30351 a!3219) j!170)) (and (not (= (select (arr!30351 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30351 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997519 d!118941))

(declare-fun d!118943 () Bool)

(declare-fun res!667703 () Bool)

(declare-fun e!562664 () Bool)

(assert (=> d!118943 (=> res!667703 e!562664)))

(assert (=> d!118943 (= res!667703 (bvsge #b00000000000000000000000000000000 (size!30855 a!3219)))))

(assert (=> d!118943 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562664)))

(declare-fun b!997687 () Bool)

(declare-fun e!562662 () Bool)

(declare-fun call!42238 () Bool)

(assert (=> b!997687 (= e!562662 call!42238)))

(declare-fun b!997688 () Bool)

(declare-fun e!562663 () Bool)

(assert (=> b!997688 (= e!562664 e!562663)))

(declare-fun c!101137 () Bool)

(assert (=> b!997688 (= c!101137 (validKeyInArray!0 (select (arr!30351 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997689 () Bool)

(assert (=> b!997689 (= e!562663 call!42238)))

(declare-fun b!997690 () Bool)

(assert (=> b!997690 (= e!562663 e!562662)))

(declare-fun lt!441331 () (_ BitVec 64))

(assert (=> b!997690 (= lt!441331 (select (arr!30351 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32851 0))(
  ( (Unit!32852) )
))
(declare-fun lt!441329 () Unit!32851)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63043 (_ BitVec 64) (_ BitVec 32)) Unit!32851)

(assert (=> b!997690 (= lt!441329 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441331 #b00000000000000000000000000000000))))

(assert (=> b!997690 (arrayContainsKey!0 a!3219 lt!441331 #b00000000000000000000000000000000)))

(declare-fun lt!441330 () Unit!32851)

(assert (=> b!997690 (= lt!441330 lt!441329)))

(declare-fun res!667702 () Bool)

(assert (=> b!997690 (= res!667702 (= (seekEntryOrOpen!0 (select (arr!30351 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9308 #b00000000000000000000000000000000)))))

(assert (=> b!997690 (=> (not res!667702) (not e!562662))))

(declare-fun bm!42235 () Bool)

(assert (=> bm!42235 (= call!42238 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!118943 (not res!667703)) b!997688))

(assert (= (and b!997688 c!101137) b!997690))

(assert (= (and b!997688 (not c!101137)) b!997689))

(assert (= (and b!997690 res!667702) b!997687))

(assert (= (or b!997687 b!997689) bm!42235))

(assert (=> b!997688 m!923841))

(assert (=> b!997688 m!923841))

(assert (=> b!997688 m!923843))

(assert (=> b!997690 m!923841))

(declare-fun m!923865 () Bool)

(assert (=> b!997690 m!923865))

(declare-fun m!923867 () Bool)

(assert (=> b!997690 m!923867))

(assert (=> b!997690 m!923841))

(declare-fun m!923869 () Bool)

(assert (=> b!997690 m!923869))

(declare-fun m!923871 () Bool)

(assert (=> bm!42235 m!923871))

(assert (=> b!997518 d!118943))

(declare-fun d!118949 () Bool)

(assert (=> d!118949 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86142 d!118949))

(declare-fun d!118965 () Bool)

(assert (=> d!118965 (= (array_inv!23494 a!3219) (bvsge (size!30855 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86142 d!118965))

(declare-fun e!562723 () SeekEntryResult!9308)

(declare-fun b!997775 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997775 (= e!562723 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30351 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997776 () Bool)

(declare-fun lt!441363 () SeekEntryResult!9308)

(assert (=> b!997776 (and (bvsge (index!39605 lt!441363) #b00000000000000000000000000000000) (bvslt (index!39605 lt!441363) (size!30855 a!3219)))))

(declare-fun e!562724 () Bool)

(assert (=> b!997776 (= e!562724 (= (select (arr!30351 a!3219) (index!39605 lt!441363)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997778 () Bool)

(declare-fun e!562722 () Bool)

(assert (=> b!997778 (= e!562722 (bvsge (x!87049 lt!441363) #b01111111111111111111111111111110))))

(declare-fun b!997779 () Bool)

(assert (=> b!997779 (= e!562723 (Intermediate!9308 false index!1507 x!1245))))

(declare-fun b!997780 () Bool)

(assert (=> b!997780 (and (bvsge (index!39605 lt!441363) #b00000000000000000000000000000000) (bvslt (index!39605 lt!441363) (size!30855 a!3219)))))

(declare-fun res!667742 () Bool)

(assert (=> b!997780 (= res!667742 (= (select (arr!30351 a!3219) (index!39605 lt!441363)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997780 (=> res!667742 e!562724)))

(declare-fun b!997781 () Bool)

(assert (=> b!997781 (and (bvsge (index!39605 lt!441363) #b00000000000000000000000000000000) (bvslt (index!39605 lt!441363) (size!30855 a!3219)))))

(declare-fun res!667743 () Bool)

(assert (=> b!997781 (= res!667743 (= (select (arr!30351 a!3219) (index!39605 lt!441363)) (select (arr!30351 a!3219) j!170)))))

(assert (=> b!997781 (=> res!667743 e!562724)))

(declare-fun e!562725 () Bool)

(assert (=> b!997781 (= e!562725 e!562724)))

(declare-fun b!997782 () Bool)

(assert (=> b!997782 (= e!562722 e!562725)))

(declare-fun res!667741 () Bool)

(assert (=> b!997782 (= res!667741 (and ((_ is Intermediate!9308) lt!441363) (not (undefined!10120 lt!441363)) (bvslt (x!87049 lt!441363) #b01111111111111111111111111111110) (bvsge (x!87049 lt!441363) #b00000000000000000000000000000000) (bvsge (x!87049 lt!441363) x!1245)))))

(assert (=> b!997782 (=> (not res!667741) (not e!562725))))

(declare-fun b!997783 () Bool)

(declare-fun e!562726 () SeekEntryResult!9308)

(assert (=> b!997783 (= e!562726 e!562723)))

(declare-fun c!101164 () Bool)

(declare-fun lt!441362 () (_ BitVec 64))

(assert (=> b!997783 (= c!101164 (or (= lt!441362 (select (arr!30351 a!3219) j!170)) (= (bvadd lt!441362 lt!441362) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!118967 () Bool)

(assert (=> d!118967 e!562722))

(declare-fun c!101163 () Bool)

(assert (=> d!118967 (= c!101163 (and ((_ is Intermediate!9308) lt!441363) (undefined!10120 lt!441363)))))

(assert (=> d!118967 (= lt!441363 e!562726)))

(declare-fun c!101162 () Bool)

(assert (=> d!118967 (= c!101162 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!118967 (= lt!441362 (select (arr!30351 a!3219) index!1507))))

(assert (=> d!118967 (validMask!0 mask!3464)))

(assert (=> d!118967 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30351 a!3219) j!170) a!3219 mask!3464) lt!441363)))

(declare-fun b!997777 () Bool)

(assert (=> b!997777 (= e!562726 (Intermediate!9308 true index!1507 x!1245))))

(assert (= (and d!118967 c!101162) b!997777))

(assert (= (and d!118967 (not c!101162)) b!997783))

(assert (= (and b!997783 c!101164) b!997779))

(assert (= (and b!997783 (not c!101164)) b!997775))

(assert (= (and d!118967 c!101163) b!997778))

(assert (= (and d!118967 (not c!101163)) b!997782))

(assert (= (and b!997782 res!667741) b!997781))

(assert (= (and b!997781 (not res!667743)) b!997780))

(assert (= (and b!997780 (not res!667742)) b!997776))

(declare-fun m!923919 () Bool)

(assert (=> b!997775 m!923919))

(assert (=> b!997775 m!923919))

(assert (=> b!997775 m!923755))

(declare-fun m!923921 () Bool)

(assert (=> b!997775 m!923921))

(declare-fun m!923923 () Bool)

(assert (=> d!118967 m!923923))

(assert (=> d!118967 m!923773))

(declare-fun m!923925 () Bool)

(assert (=> b!997776 m!923925))

(assert (=> b!997780 m!923925))

(assert (=> b!997781 m!923925))

(assert (=> b!997523 d!118967))

(declare-fun e!562728 () SeekEntryResult!9308)

(declare-fun b!997784 () Bool)

(assert (=> b!997784 (= e!562728 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!441282 #b00000000000000000000000000000000 mask!3464) (select (arr!30351 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997785 () Bool)

(declare-fun lt!441365 () SeekEntryResult!9308)

(assert (=> b!997785 (and (bvsge (index!39605 lt!441365) #b00000000000000000000000000000000) (bvslt (index!39605 lt!441365) (size!30855 a!3219)))))

(declare-fun e!562729 () Bool)

(assert (=> b!997785 (= e!562729 (= (select (arr!30351 a!3219) (index!39605 lt!441365)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997787 () Bool)

(declare-fun e!562727 () Bool)

(assert (=> b!997787 (= e!562727 (bvsge (x!87049 lt!441365) #b01111111111111111111111111111110))))

(declare-fun b!997788 () Bool)

(assert (=> b!997788 (= e!562728 (Intermediate!9308 false lt!441282 #b00000000000000000000000000000000))))

(declare-fun b!997789 () Bool)

(assert (=> b!997789 (and (bvsge (index!39605 lt!441365) #b00000000000000000000000000000000) (bvslt (index!39605 lt!441365) (size!30855 a!3219)))))

(declare-fun res!667745 () Bool)

(assert (=> b!997789 (= res!667745 (= (select (arr!30351 a!3219) (index!39605 lt!441365)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997789 (=> res!667745 e!562729)))

(declare-fun b!997790 () Bool)

(assert (=> b!997790 (and (bvsge (index!39605 lt!441365) #b00000000000000000000000000000000) (bvslt (index!39605 lt!441365) (size!30855 a!3219)))))

(declare-fun res!667746 () Bool)

(assert (=> b!997790 (= res!667746 (= (select (arr!30351 a!3219) (index!39605 lt!441365)) (select (arr!30351 a!3219) j!170)))))

(assert (=> b!997790 (=> res!667746 e!562729)))

(declare-fun e!562730 () Bool)

(assert (=> b!997790 (= e!562730 e!562729)))

(declare-fun b!997791 () Bool)

(assert (=> b!997791 (= e!562727 e!562730)))

(declare-fun res!667744 () Bool)

(assert (=> b!997791 (= res!667744 (and ((_ is Intermediate!9308) lt!441365) (not (undefined!10120 lt!441365)) (bvslt (x!87049 lt!441365) #b01111111111111111111111111111110) (bvsge (x!87049 lt!441365) #b00000000000000000000000000000000) (bvsge (x!87049 lt!441365) #b00000000000000000000000000000000)))))

(assert (=> b!997791 (=> (not res!667744) (not e!562730))))

(declare-fun b!997792 () Bool)

(declare-fun e!562731 () SeekEntryResult!9308)

(assert (=> b!997792 (= e!562731 e!562728)))

(declare-fun lt!441364 () (_ BitVec 64))

(declare-fun c!101167 () Bool)

(assert (=> b!997792 (= c!101167 (or (= lt!441364 (select (arr!30351 a!3219) j!170)) (= (bvadd lt!441364 lt!441364) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!118977 () Bool)

(assert (=> d!118977 e!562727))

(declare-fun c!101166 () Bool)

(assert (=> d!118977 (= c!101166 (and ((_ is Intermediate!9308) lt!441365) (undefined!10120 lt!441365)))))

(assert (=> d!118977 (= lt!441365 e!562731)))

(declare-fun c!101165 () Bool)

(assert (=> d!118977 (= c!101165 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!118977 (= lt!441364 (select (arr!30351 a!3219) lt!441282))))

(assert (=> d!118977 (validMask!0 mask!3464)))

(assert (=> d!118977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!441282 (select (arr!30351 a!3219) j!170) a!3219 mask!3464) lt!441365)))

(declare-fun b!997786 () Bool)

(assert (=> b!997786 (= e!562731 (Intermediate!9308 true lt!441282 #b00000000000000000000000000000000))))

(assert (= (and d!118977 c!101165) b!997786))

(assert (= (and d!118977 (not c!101165)) b!997792))

(assert (= (and b!997792 c!101167) b!997788))

(assert (= (and b!997792 (not c!101167)) b!997784))

(assert (= (and d!118977 c!101166) b!997787))

(assert (= (and d!118977 (not c!101166)) b!997791))

(assert (= (and b!997791 res!667744) b!997790))

(assert (= (and b!997790 (not res!667746)) b!997789))

(assert (= (and b!997789 (not res!667745)) b!997785))

(declare-fun m!923927 () Bool)

(assert (=> b!997784 m!923927))

(assert (=> b!997784 m!923927))

(assert (=> b!997784 m!923755))

(declare-fun m!923929 () Bool)

(assert (=> b!997784 m!923929))

(declare-fun m!923931 () Bool)

(assert (=> d!118977 m!923931))

(assert (=> d!118977 m!923773))

(declare-fun m!923933 () Bool)

(assert (=> b!997785 m!923933))

(assert (=> b!997789 m!923933))

(assert (=> b!997790 m!923933))

(assert (=> b!997516 d!118977))

(declare-fun d!118979 () Bool)

(declare-fun lt!441377 () (_ BitVec 32))

(declare-fun lt!441376 () (_ BitVec 32))

(assert (=> d!118979 (= lt!441377 (bvmul (bvxor lt!441376 (bvlshr lt!441376 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!118979 (= lt!441376 ((_ extract 31 0) (bvand (bvxor (select (arr!30351 a!3219) j!170) (bvlshr (select (arr!30351 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!118979 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!667753 (let ((h!22261 ((_ extract 31 0) (bvand (bvxor (select (arr!30351 a!3219) j!170) (bvlshr (select (arr!30351 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87056 (bvmul (bvxor h!22261 (bvlshr h!22261 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87056 (bvlshr x!87056 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!667753 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!667753 #b00000000000000000000000000000000))))))

(assert (=> d!118979 (= (toIndex!0 (select (arr!30351 a!3219) j!170) mask!3464) (bvand (bvxor lt!441377 (bvlshr lt!441377 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!997516 d!118979))

(declare-fun d!118985 () Bool)

(declare-fun res!667761 () Bool)

(declare-fun e!562757 () Bool)

(assert (=> d!118985 (=> res!667761 e!562757)))

(assert (=> d!118985 (= res!667761 (= (select (arr!30351 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!118985 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!562757)))

(declare-fun b!997830 () Bool)

(declare-fun e!562758 () Bool)

(assert (=> b!997830 (= e!562757 e!562758)))

(declare-fun res!667762 () Bool)

(assert (=> b!997830 (=> (not res!667762) (not e!562758))))

(assert (=> b!997830 (= res!667762 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30855 a!3219)))))

(declare-fun b!997831 () Bool)

(assert (=> b!997831 (= e!562758 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118985 (not res!667761)) b!997830))

(assert (= (and b!997830 res!667762) b!997831))

(assert (=> d!118985 m!923841))

(declare-fun m!923953 () Bool)

(assert (=> b!997831 m!923953))

(assert (=> b!997522 d!118985))

(check-sat (not b!997652) (not b!997608) (not bm!42232) (not b!997650) (not b!997784) (not d!118977) (not bm!42235) (not b!997775) (not b!997831) (not b!997688) (not d!118967) (not b!997690) (not b!997654) (not d!118931))
(check-sat)
