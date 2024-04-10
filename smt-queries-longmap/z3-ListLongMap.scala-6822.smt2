; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85792 () Bool)

(assert start!85792)

(declare-fun b!995126 () Bool)

(declare-fun e!561526 () Bool)

(declare-datatypes ((List!20996 0))(
  ( (Nil!20993) (Cons!20992 (h!22154 (_ BitVec 64)) (t!29997 List!20996)) )
))
(declare-fun noDuplicate!1455 (List!20996) Bool)

(assert (=> b!995126 (= e!561526 (not (noDuplicate!1455 Nil!20993)))))

(declare-fun b!995127 () Bool)

(declare-fun res!665566 () Bool)

(assert (=> b!995127 (=> (not res!665566) (not e!561526))))

(declare-datatypes ((array!62965 0))(
  ( (array!62966 (arr!30320 (Array (_ BitVec 32) (_ BitVec 64))) (size!30822 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62965)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62965 (_ BitVec 32)) Bool)

(assert (=> b!995127 (= res!665566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995128 () Bool)

(declare-fun res!665567 () Bool)

(declare-fun e!561524 () Bool)

(assert (=> b!995128 (=> (not res!665567) (not e!561524))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995128 (= res!665567 (validKeyInArray!0 k0!2224))))

(declare-fun b!995129 () Bool)

(declare-fun res!665568 () Bool)

(assert (=> b!995129 (=> (not res!665568) (not e!561524))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995129 (= res!665568 (and (= (size!30822 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30822 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30822 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995130 () Bool)

(declare-fun res!665565 () Bool)

(assert (=> b!995130 (=> (not res!665565) (not e!561526))))

(assert (=> b!995130 (= res!665565 (and (bvsle #b00000000000000000000000000000000 (size!30822 a!3219)) (bvslt (size!30822 a!3219) #b01111111111111111111111111111111)))))

(declare-fun res!665564 () Bool)

(assert (=> start!85792 (=> (not res!665564) (not e!561524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85792 (= res!665564 (validMask!0 mask!3464))))

(assert (=> start!85792 e!561524))

(declare-fun array_inv!23444 (array!62965) Bool)

(assert (=> start!85792 (array_inv!23444 a!3219)))

(assert (=> start!85792 true))

(declare-fun b!995131 () Bool)

(declare-fun res!665561 () Bool)

(assert (=> b!995131 (=> (not res!665561) (not e!561524))))

(assert (=> b!995131 (= res!665561 (validKeyInArray!0 (select (arr!30320 a!3219) j!170)))))

(declare-fun b!995132 () Bool)

(declare-fun res!665563 () Bool)

(assert (=> b!995132 (=> (not res!665563) (not e!561524))))

(declare-fun arrayContainsKey!0 (array!62965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995132 (= res!665563 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995133 () Bool)

(assert (=> b!995133 (= e!561524 e!561526)))

(declare-fun res!665562 () Bool)

(assert (=> b!995133 (=> (not res!665562) (not e!561526))))

(declare-datatypes ((SeekEntryResult!9252 0))(
  ( (MissingZero!9252 (index!39379 (_ BitVec 32))) (Found!9252 (index!39380 (_ BitVec 32))) (Intermediate!9252 (undefined!10064 Bool) (index!39381 (_ BitVec 32)) (x!86821 (_ BitVec 32))) (Undefined!9252) (MissingVacant!9252 (index!39382 (_ BitVec 32))) )
))
(declare-fun lt!440855 () SeekEntryResult!9252)

(assert (=> b!995133 (= res!665562 (or (= lt!440855 (MissingVacant!9252 i!1194)) (= lt!440855 (MissingZero!9252 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62965 (_ BitVec 32)) SeekEntryResult!9252)

(assert (=> b!995133 (= lt!440855 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!85792 res!665564) b!995129))

(assert (= (and b!995129 res!665568) b!995131))

(assert (= (and b!995131 res!665561) b!995128))

(assert (= (and b!995128 res!665567) b!995132))

(assert (= (and b!995132 res!665563) b!995133))

(assert (= (and b!995133 res!665562) b!995127))

(assert (= (and b!995127 res!665566) b!995130))

(assert (= (and b!995130 res!665565) b!995126))

(declare-fun m!922601 () Bool)

(assert (=> b!995131 m!922601))

(assert (=> b!995131 m!922601))

(declare-fun m!922603 () Bool)

(assert (=> b!995131 m!922603))

(declare-fun m!922605 () Bool)

(assert (=> b!995126 m!922605))

(declare-fun m!922607 () Bool)

(assert (=> b!995133 m!922607))

(declare-fun m!922609 () Bool)

(assert (=> b!995128 m!922609))

(declare-fun m!922611 () Bool)

(assert (=> b!995132 m!922611))

(declare-fun m!922613 () Bool)

(assert (=> b!995127 m!922613))

(declare-fun m!922615 () Bool)

(assert (=> start!85792 m!922615))

(declare-fun m!922617 () Bool)

(assert (=> start!85792 m!922617))

(check-sat (not start!85792) (not b!995132) (not b!995131) (not b!995128) (not b!995126) (not b!995127) (not b!995133))
(check-sat)
(get-model)

(declare-fun d!118787 () Bool)

(assert (=> d!118787 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995128 d!118787))

(declare-fun d!118789 () Bool)

(assert (=> d!118789 (= (validKeyInArray!0 (select (arr!30320 a!3219) j!170)) (and (not (= (select (arr!30320 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30320 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995131 d!118789))

(declare-fun d!118791 () Bool)

(declare-fun res!665597 () Bool)

(declare-fun e!561540 () Bool)

(assert (=> d!118791 (=> res!665597 e!561540)))

(get-info :version)

(assert (=> d!118791 (= res!665597 ((_ is Nil!20993) Nil!20993))))

(assert (=> d!118791 (= (noDuplicate!1455 Nil!20993) e!561540)))

(declare-fun b!995162 () Bool)

(declare-fun e!561541 () Bool)

(assert (=> b!995162 (= e!561540 e!561541)))

(declare-fun res!665598 () Bool)

(assert (=> b!995162 (=> (not res!665598) (not e!561541))))

(declare-fun contains!5856 (List!20996 (_ BitVec 64)) Bool)

(assert (=> b!995162 (= res!665598 (not (contains!5856 (t!29997 Nil!20993) (h!22154 Nil!20993))))))

(declare-fun b!995163 () Bool)

(assert (=> b!995163 (= e!561541 (noDuplicate!1455 (t!29997 Nil!20993)))))

(assert (= (and d!118791 (not res!665597)) b!995162))

(assert (= (and b!995162 res!665598) b!995163))

(declare-fun m!922637 () Bool)

(assert (=> b!995162 m!922637))

(declare-fun m!922639 () Bool)

(assert (=> b!995163 m!922639))

(assert (=> b!995126 d!118791))

(declare-fun d!118793 () Bool)

(assert (=> d!118793 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85792 d!118793))

(declare-fun d!118805 () Bool)

(assert (=> d!118805 (= (array_inv!23444 a!3219) (bvsge (size!30822 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85792 d!118805))

(declare-fun d!118807 () Bool)

(declare-fun res!665615 () Bool)

(declare-fun e!561558 () Bool)

(assert (=> d!118807 (=> res!665615 e!561558)))

(assert (=> d!118807 (= res!665615 (= (select (arr!30320 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!118807 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!561558)))

(declare-fun b!995180 () Bool)

(declare-fun e!561559 () Bool)

(assert (=> b!995180 (= e!561558 e!561559)))

(declare-fun res!665616 () Bool)

(assert (=> b!995180 (=> (not res!665616) (not e!561559))))

(assert (=> b!995180 (= res!665616 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30822 a!3219)))))

(declare-fun b!995181 () Bool)

(assert (=> b!995181 (= e!561559 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118807 (not res!665615)) b!995180))

(assert (= (and b!995180 res!665616) b!995181))

(declare-fun m!922649 () Bool)

(assert (=> d!118807 m!922649))

(declare-fun m!922651 () Bool)

(assert (=> b!995181 m!922651))

(assert (=> b!995132 d!118807))

(declare-fun b!995204 () Bool)

(declare-fun e!561579 () Bool)

(declare-fun call!42190 () Bool)

(assert (=> b!995204 (= e!561579 call!42190)))

(declare-fun d!118809 () Bool)

(declare-fun res!665631 () Bool)

(declare-fun e!561580 () Bool)

(assert (=> d!118809 (=> res!665631 e!561580)))

(assert (=> d!118809 (= res!665631 (bvsge #b00000000000000000000000000000000 (size!30822 a!3219)))))

(assert (=> d!118809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561580)))

(declare-fun b!995205 () Bool)

(assert (=> b!995205 (= e!561580 e!561579)))

(declare-fun c!100927 () Bool)

(assert (=> b!995205 (= c!100927 (validKeyInArray!0 (select (arr!30320 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42187 () Bool)

(assert (=> bm!42187 (= call!42190 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!995206 () Bool)

(declare-fun e!561578 () Bool)

(assert (=> b!995206 (= e!561579 e!561578)))

(declare-fun lt!440872 () (_ BitVec 64))

(assert (=> b!995206 (= lt!440872 (select (arr!30320 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32950 0))(
  ( (Unit!32951) )
))
(declare-fun lt!440871 () Unit!32950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62965 (_ BitVec 64) (_ BitVec 32)) Unit!32950)

(assert (=> b!995206 (= lt!440871 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440872 #b00000000000000000000000000000000))))

(assert (=> b!995206 (arrayContainsKey!0 a!3219 lt!440872 #b00000000000000000000000000000000)))

(declare-fun lt!440873 () Unit!32950)

(assert (=> b!995206 (= lt!440873 lt!440871)))

(declare-fun res!665632 () Bool)

(assert (=> b!995206 (= res!665632 (= (seekEntryOrOpen!0 (select (arr!30320 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9252 #b00000000000000000000000000000000)))))

(assert (=> b!995206 (=> (not res!665632) (not e!561578))))

(declare-fun b!995207 () Bool)

(assert (=> b!995207 (= e!561578 call!42190)))

(assert (= (and d!118809 (not res!665631)) b!995205))

(assert (= (and b!995205 c!100927) b!995206))

(assert (= (and b!995205 (not c!100927)) b!995204))

(assert (= (and b!995206 res!665632) b!995207))

(assert (= (or b!995207 b!995204) bm!42187))

(assert (=> b!995205 m!922649))

(assert (=> b!995205 m!922649))

(declare-fun m!922657 () Bool)

(assert (=> b!995205 m!922657))

(declare-fun m!922659 () Bool)

(assert (=> bm!42187 m!922659))

(assert (=> b!995206 m!922649))

(declare-fun m!922661 () Bool)

(assert (=> b!995206 m!922661))

(declare-fun m!922663 () Bool)

(assert (=> b!995206 m!922663))

(assert (=> b!995206 m!922649))

(declare-fun m!922665 () Bool)

(assert (=> b!995206 m!922665))

(assert (=> b!995127 d!118809))

(declare-fun b!995254 () Bool)

(declare-fun e!561611 () SeekEntryResult!9252)

(declare-fun lt!440900 () SeekEntryResult!9252)

(assert (=> b!995254 (= e!561611 (MissingZero!9252 (index!39381 lt!440900)))))

(declare-fun b!995255 () Bool)

(declare-fun e!561612 () SeekEntryResult!9252)

(assert (=> b!995255 (= e!561612 (Found!9252 (index!39381 lt!440900)))))

(declare-fun b!995256 () Bool)

(declare-fun e!561613 () SeekEntryResult!9252)

(assert (=> b!995256 (= e!561613 e!561612)))

(declare-fun lt!440898 () (_ BitVec 64))

(assert (=> b!995256 (= lt!440898 (select (arr!30320 a!3219) (index!39381 lt!440900)))))

(declare-fun c!100946 () Bool)

(assert (=> b!995256 (= c!100946 (= lt!440898 k0!2224))))

(declare-fun b!995258 () Bool)

(declare-fun c!100944 () Bool)

(assert (=> b!995258 (= c!100944 (= lt!440898 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!995258 (= e!561612 e!561611)))

(declare-fun b!995259 () Bool)

(assert (=> b!995259 (= e!561613 Undefined!9252)))

(declare-fun b!995257 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62965 (_ BitVec 32)) SeekEntryResult!9252)

(assert (=> b!995257 (= e!561611 (seekKeyOrZeroReturnVacant!0 (x!86821 lt!440900) (index!39381 lt!440900) (index!39381 lt!440900) k0!2224 a!3219 mask!3464))))

(declare-fun d!118821 () Bool)

(declare-fun lt!440899 () SeekEntryResult!9252)

(assert (=> d!118821 (and (or ((_ is Undefined!9252) lt!440899) (not ((_ is Found!9252) lt!440899)) (and (bvsge (index!39380 lt!440899) #b00000000000000000000000000000000) (bvslt (index!39380 lt!440899) (size!30822 a!3219)))) (or ((_ is Undefined!9252) lt!440899) ((_ is Found!9252) lt!440899) (not ((_ is MissingZero!9252) lt!440899)) (and (bvsge (index!39379 lt!440899) #b00000000000000000000000000000000) (bvslt (index!39379 lt!440899) (size!30822 a!3219)))) (or ((_ is Undefined!9252) lt!440899) ((_ is Found!9252) lt!440899) ((_ is MissingZero!9252) lt!440899) (not ((_ is MissingVacant!9252) lt!440899)) (and (bvsge (index!39382 lt!440899) #b00000000000000000000000000000000) (bvslt (index!39382 lt!440899) (size!30822 a!3219)))) (or ((_ is Undefined!9252) lt!440899) (ite ((_ is Found!9252) lt!440899) (= (select (arr!30320 a!3219) (index!39380 lt!440899)) k0!2224) (ite ((_ is MissingZero!9252) lt!440899) (= (select (arr!30320 a!3219) (index!39379 lt!440899)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9252) lt!440899) (= (select (arr!30320 a!3219) (index!39382 lt!440899)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118821 (= lt!440899 e!561613)))

(declare-fun c!100945 () Bool)

(assert (=> d!118821 (= c!100945 (and ((_ is Intermediate!9252) lt!440900) (undefined!10064 lt!440900)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62965 (_ BitVec 32)) SeekEntryResult!9252)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118821 (= lt!440900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!118821 (validMask!0 mask!3464)))

(assert (=> d!118821 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!440899)))

(assert (= (and d!118821 c!100945) b!995259))

(assert (= (and d!118821 (not c!100945)) b!995256))

(assert (= (and b!995256 c!100946) b!995255))

(assert (= (and b!995256 (not c!100946)) b!995258))

(assert (= (and b!995258 c!100944) b!995254))

(assert (= (and b!995258 (not c!100944)) b!995257))

(declare-fun m!922691 () Bool)

(assert (=> b!995256 m!922691))

(declare-fun m!922693 () Bool)

(assert (=> b!995257 m!922693))

(declare-fun m!922695 () Bool)

(assert (=> d!118821 m!922695))

(declare-fun m!922697 () Bool)

(assert (=> d!118821 m!922697))

(assert (=> d!118821 m!922615))

(declare-fun m!922699 () Bool)

(assert (=> d!118821 m!922699))

(assert (=> d!118821 m!922699))

(declare-fun m!922701 () Bool)

(assert (=> d!118821 m!922701))

(declare-fun m!922703 () Bool)

(assert (=> d!118821 m!922703))

(assert (=> b!995133 d!118821))

(check-sat (not b!995181) (not b!995257) (not b!995206) (not b!995205) (not bm!42187) (not b!995163) (not b!995162) (not d!118821))
(check-sat)
