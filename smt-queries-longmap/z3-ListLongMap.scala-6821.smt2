; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85750 () Bool)

(assert start!85750)

(declare-fun b!994950 () Bool)

(declare-fun e!561426 () Bool)

(declare-fun e!561425 () Bool)

(assert (=> b!994950 (= e!561426 e!561425)))

(declare-fun res!665461 () Bool)

(assert (=> b!994950 (=> (not res!665461) (not e!561425))))

(declare-datatypes ((SeekEntryResult!9249 0))(
  ( (MissingZero!9249 (index!39367 (_ BitVec 32))) (Found!9249 (index!39368 (_ BitVec 32))) (Intermediate!9249 (undefined!10061 Bool) (index!39369 (_ BitVec 32)) (x!86810 (_ BitVec 32))) (Undefined!9249) (MissingVacant!9249 (index!39370 (_ BitVec 32))) )
))
(declare-fun lt!440792 () SeekEntryResult!9249)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994950 (= res!665461 (or (= lt!440792 (MissingVacant!9249 i!1194)) (= lt!440792 (MissingZero!9249 i!1194))))))

(declare-datatypes ((array!62956 0))(
  ( (array!62957 (arr!30317 (Array (_ BitVec 32) (_ BitVec 64))) (size!30819 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62956)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62956 (_ BitVec 32)) SeekEntryResult!9249)

(assert (=> b!994950 (= lt!440792 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!994951 () Bool)

(declare-fun res!665460 () Bool)

(assert (=> b!994951 (=> (not res!665460) (not e!561426))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994951 (= res!665460 (validKeyInArray!0 (select (arr!30317 a!3219) j!170)))))

(declare-fun b!994952 () Bool)

(assert (=> b!994952 (= e!561425 (and (bvsle #b00000000000000000000000000000000 (size!30819 a!3219)) (bvsge (size!30819 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!994953 () Bool)

(declare-fun res!665459 () Bool)

(assert (=> b!994953 (=> (not res!665459) (not e!561426))))

(assert (=> b!994953 (= res!665459 (validKeyInArray!0 k0!2224))))

(declare-fun res!665462 () Bool)

(assert (=> start!85750 (=> (not res!665462) (not e!561426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85750 (= res!665462 (validMask!0 mask!3464))))

(assert (=> start!85750 e!561426))

(declare-fun array_inv!23441 (array!62956) Bool)

(assert (=> start!85750 (array_inv!23441 a!3219)))

(assert (=> start!85750 true))

(declare-fun b!994954 () Bool)

(declare-fun res!665457 () Bool)

(assert (=> b!994954 (=> (not res!665457) (not e!561425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62956 (_ BitVec 32)) Bool)

(assert (=> b!994954 (= res!665457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!994955 () Bool)

(declare-fun res!665463 () Bool)

(assert (=> b!994955 (=> (not res!665463) (not e!561426))))

(assert (=> b!994955 (= res!665463 (and (= (size!30819 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30819 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30819 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994956 () Bool)

(declare-fun res!665458 () Bool)

(assert (=> b!994956 (=> (not res!665458) (not e!561426))))

(declare-fun arrayContainsKey!0 (array!62956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994956 (= res!665458 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85750 res!665462) b!994955))

(assert (= (and b!994955 res!665463) b!994951))

(assert (= (and b!994951 res!665460) b!994953))

(assert (= (and b!994953 res!665459) b!994956))

(assert (= (and b!994956 res!665458) b!994950))

(assert (= (and b!994950 res!665461) b!994954))

(assert (= (and b!994954 res!665457) b!994952))

(declare-fun m!922467 () Bool)

(assert (=> b!994953 m!922467))

(declare-fun m!922469 () Bool)

(assert (=> b!994951 m!922469))

(assert (=> b!994951 m!922469))

(declare-fun m!922471 () Bool)

(assert (=> b!994951 m!922471))

(declare-fun m!922473 () Bool)

(assert (=> b!994956 m!922473))

(declare-fun m!922475 () Bool)

(assert (=> start!85750 m!922475))

(declare-fun m!922477 () Bool)

(assert (=> start!85750 m!922477))

(declare-fun m!922479 () Bool)

(assert (=> b!994954 m!922479))

(declare-fun m!922481 () Bool)

(assert (=> b!994950 m!922481))

(check-sat (not b!994954) (not b!994956) (not b!994951) (not start!85750) (not b!994953) (not b!994950))
(check-sat)
(get-model)

(declare-fun d!118743 () Bool)

(assert (=> d!118743 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994953 d!118743))

(declare-fun b!994986 () Bool)

(declare-fun e!561443 () Bool)

(declare-fun e!561444 () Bool)

(assert (=> b!994986 (= e!561443 e!561444)))

(declare-fun lt!440804 () (_ BitVec 64))

(assert (=> b!994986 (= lt!440804 (select (arr!30317 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32946 0))(
  ( (Unit!32947) )
))
(declare-fun lt!440802 () Unit!32946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62956 (_ BitVec 64) (_ BitVec 32)) Unit!32946)

(assert (=> b!994986 (= lt!440802 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440804 #b00000000000000000000000000000000))))

(assert (=> b!994986 (arrayContainsKey!0 a!3219 lt!440804 #b00000000000000000000000000000000)))

(declare-fun lt!440803 () Unit!32946)

(assert (=> b!994986 (= lt!440803 lt!440802)))

(declare-fun res!665489 () Bool)

(assert (=> b!994986 (= res!665489 (= (seekEntryOrOpen!0 (select (arr!30317 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9249 #b00000000000000000000000000000000)))))

(assert (=> b!994986 (=> (not res!665489) (not e!561444))))

(declare-fun bm!42176 () Bool)

(declare-fun call!42179 () Bool)

(assert (=> bm!42176 (= call!42179 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!994987 () Bool)

(assert (=> b!994987 (= e!561443 call!42179)))

(declare-fun b!994988 () Bool)

(declare-fun e!561445 () Bool)

(assert (=> b!994988 (= e!561445 e!561443)))

(declare-fun c!100889 () Bool)

(assert (=> b!994988 (= c!100889 (validKeyInArray!0 (select (arr!30317 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118745 () Bool)

(declare-fun res!665490 () Bool)

(assert (=> d!118745 (=> res!665490 e!561445)))

(assert (=> d!118745 (= res!665490 (bvsge #b00000000000000000000000000000000 (size!30819 a!3219)))))

(assert (=> d!118745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561445)))

(declare-fun b!994989 () Bool)

(assert (=> b!994989 (= e!561444 call!42179)))

(assert (= (and d!118745 (not res!665490)) b!994988))

(assert (= (and b!994988 c!100889) b!994986))

(assert (= (and b!994988 (not c!100889)) b!994987))

(assert (= (and b!994986 res!665489) b!994989))

(assert (= (or b!994989 b!994987) bm!42176))

(declare-fun m!922499 () Bool)

(assert (=> b!994986 m!922499))

(declare-fun m!922501 () Bool)

(assert (=> b!994986 m!922501))

(declare-fun m!922503 () Bool)

(assert (=> b!994986 m!922503))

(assert (=> b!994986 m!922499))

(declare-fun m!922505 () Bool)

(assert (=> b!994986 m!922505))

(declare-fun m!922507 () Bool)

(assert (=> bm!42176 m!922507))

(assert (=> b!994988 m!922499))

(assert (=> b!994988 m!922499))

(declare-fun m!922509 () Bool)

(assert (=> b!994988 m!922509))

(assert (=> b!994954 d!118745))

(declare-fun d!118753 () Bool)

(declare-fun lt!440830 () SeekEntryResult!9249)

(get-info :version)

(assert (=> d!118753 (and (or ((_ is Undefined!9249) lt!440830) (not ((_ is Found!9249) lt!440830)) (and (bvsge (index!39368 lt!440830) #b00000000000000000000000000000000) (bvslt (index!39368 lt!440830) (size!30819 a!3219)))) (or ((_ is Undefined!9249) lt!440830) ((_ is Found!9249) lt!440830) (not ((_ is MissingZero!9249) lt!440830)) (and (bvsge (index!39367 lt!440830) #b00000000000000000000000000000000) (bvslt (index!39367 lt!440830) (size!30819 a!3219)))) (or ((_ is Undefined!9249) lt!440830) ((_ is Found!9249) lt!440830) ((_ is MissingZero!9249) lt!440830) (not ((_ is MissingVacant!9249) lt!440830)) (and (bvsge (index!39370 lt!440830) #b00000000000000000000000000000000) (bvslt (index!39370 lt!440830) (size!30819 a!3219)))) (or ((_ is Undefined!9249) lt!440830) (ite ((_ is Found!9249) lt!440830) (= (select (arr!30317 a!3219) (index!39368 lt!440830)) k0!2224) (ite ((_ is MissingZero!9249) lt!440830) (= (select (arr!30317 a!3219) (index!39367 lt!440830)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9249) lt!440830) (= (select (arr!30317 a!3219) (index!39370 lt!440830)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!561471 () SeekEntryResult!9249)

(assert (=> d!118753 (= lt!440830 e!561471)))

(declare-fun c!100908 () Bool)

(declare-fun lt!440831 () SeekEntryResult!9249)

(assert (=> d!118753 (= c!100908 (and ((_ is Intermediate!9249) lt!440831) (undefined!10061 lt!440831)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62956 (_ BitVec 32)) SeekEntryResult!9249)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118753 (= lt!440831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!118753 (validMask!0 mask!3464)))

(assert (=> d!118753 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!440830)))

(declare-fun b!995032 () Bool)

(declare-fun c!100909 () Bool)

(declare-fun lt!440829 () (_ BitVec 64))

(assert (=> b!995032 (= c!100909 (= lt!440829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561472 () SeekEntryResult!9249)

(declare-fun e!561470 () SeekEntryResult!9249)

(assert (=> b!995032 (= e!561472 e!561470)))

(declare-fun b!995033 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62956 (_ BitVec 32)) SeekEntryResult!9249)

(assert (=> b!995033 (= e!561470 (seekKeyOrZeroReturnVacant!0 (x!86810 lt!440831) (index!39369 lt!440831) (index!39369 lt!440831) k0!2224 a!3219 mask!3464))))

(declare-fun b!995034 () Bool)

(assert (=> b!995034 (= e!561471 Undefined!9249)))

(declare-fun b!995035 () Bool)

(assert (=> b!995035 (= e!561471 e!561472)))

(assert (=> b!995035 (= lt!440829 (select (arr!30317 a!3219) (index!39369 lt!440831)))))

(declare-fun c!100910 () Bool)

(assert (=> b!995035 (= c!100910 (= lt!440829 k0!2224))))

(declare-fun b!995036 () Bool)

(assert (=> b!995036 (= e!561470 (MissingZero!9249 (index!39369 lt!440831)))))

(declare-fun b!995037 () Bool)

(assert (=> b!995037 (= e!561472 (Found!9249 (index!39369 lt!440831)))))

(assert (= (and d!118753 c!100908) b!995034))

(assert (= (and d!118753 (not c!100908)) b!995035))

(assert (= (and b!995035 c!100910) b!995037))

(assert (= (and b!995035 (not c!100910)) b!995032))

(assert (= (and b!995032 c!100909) b!995036))

(assert (= (and b!995032 (not c!100909)) b!995033))

(declare-fun m!922537 () Bool)

(assert (=> d!118753 m!922537))

(declare-fun m!922539 () Bool)

(assert (=> d!118753 m!922539))

(assert (=> d!118753 m!922537))

(declare-fun m!922541 () Bool)

(assert (=> d!118753 m!922541))

(assert (=> d!118753 m!922475))

(declare-fun m!922543 () Bool)

(assert (=> d!118753 m!922543))

(declare-fun m!922545 () Bool)

(assert (=> d!118753 m!922545))

(declare-fun m!922547 () Bool)

(assert (=> b!995033 m!922547))

(declare-fun m!922549 () Bool)

(assert (=> b!995035 m!922549))

(assert (=> b!994950 d!118753))

(declare-fun d!118767 () Bool)

(assert (=> d!118767 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85750 d!118767))

(declare-fun d!118775 () Bool)

(assert (=> d!118775 (= (array_inv!23441 a!3219) (bvsge (size!30819 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85750 d!118775))

(declare-fun d!118777 () Bool)

(assert (=> d!118777 (= (validKeyInArray!0 (select (arr!30317 a!3219) j!170)) (and (not (= (select (arr!30317 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30317 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994951 d!118777))

(declare-fun d!118779 () Bool)

(declare-fun res!665513 () Bool)

(declare-fun e!561489 () Bool)

(assert (=> d!118779 (=> res!665513 e!561489)))

(assert (=> d!118779 (= res!665513 (= (select (arr!30317 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!118779 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!561489)))

(declare-fun b!995054 () Bool)

(declare-fun e!561490 () Bool)

(assert (=> b!995054 (= e!561489 e!561490)))

(declare-fun res!665514 () Bool)

(assert (=> b!995054 (=> (not res!665514) (not e!561490))))

(assert (=> b!995054 (= res!665514 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30819 a!3219)))))

(declare-fun b!995055 () Bool)

(assert (=> b!995055 (= e!561490 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118779 (not res!665513)) b!995054))

(assert (= (and b!995054 res!665514) b!995055))

(assert (=> d!118779 m!922499))

(declare-fun m!922557 () Bool)

(assert (=> b!995055 m!922557))

(assert (=> b!994956 d!118779))

(check-sat (not bm!42176) (not b!994986) (not b!995033) (not b!994988) (not d!118753) (not b!995055))
(check-sat)
