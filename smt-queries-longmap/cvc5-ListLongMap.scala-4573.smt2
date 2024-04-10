; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63736 () Bool)

(assert start!63736)

(declare-fun b!717312 () Bool)

(declare-fun res!480100 () Bool)

(declare-fun e!402717 () Bool)

(assert (=> b!717312 (=> (not res!480100) (not e!402717))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717312 (= res!480100 (validKeyInArray!0 k!2102))))

(declare-fun b!717313 () Bool)

(declare-fun e!402719 () Bool)

(declare-datatypes ((array!40632 0))(
  ( (array!40633 (arr!19449 (Array (_ BitVec 32) (_ BitVec 64))) (size!19870 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40632)

(assert (=> b!717313 (= e!402719 (and (bvsle #b00000000000000000000000000000000 (size!19870 a!3186)) (bvsge (size!19870 a!3186) #b01111111111111111111111111111111)))))

(declare-fun res!480104 () Bool)

(assert (=> start!63736 (=> (not res!480104) (not e!402717))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63736 (= res!480104 (validMask!0 mask!3328))))

(assert (=> start!63736 e!402717))

(declare-fun array_inv!15245 (array!40632) Bool)

(assert (=> start!63736 (array_inv!15245 a!3186)))

(assert (=> start!63736 true))

(declare-fun b!717314 () Bool)

(declare-fun res!480102 () Bool)

(assert (=> b!717314 (=> (not res!480102) (not e!402719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40632 (_ BitVec 32)) Bool)

(assert (=> b!717314 (= res!480102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717315 () Bool)

(declare-fun res!480103 () Bool)

(assert (=> b!717315 (=> (not res!480103) (not e!402717))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717315 (= res!480103 (and (= (size!19870 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19870 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19870 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717316 () Bool)

(assert (=> b!717316 (= e!402717 e!402719)))

(declare-fun res!480101 () Bool)

(assert (=> b!717316 (=> (not res!480101) (not e!402719))))

(declare-datatypes ((SeekEntryResult!7049 0))(
  ( (MissingZero!7049 (index!30564 (_ BitVec 32))) (Found!7049 (index!30565 (_ BitVec 32))) (Intermediate!7049 (undefined!7861 Bool) (index!30566 (_ BitVec 32)) (x!61589 (_ BitVec 32))) (Undefined!7049) (MissingVacant!7049 (index!30567 (_ BitVec 32))) )
))
(declare-fun lt!319040 () SeekEntryResult!7049)

(assert (=> b!717316 (= res!480101 (or (= lt!319040 (MissingZero!7049 i!1173)) (= lt!319040 (MissingVacant!7049 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40632 (_ BitVec 32)) SeekEntryResult!7049)

(assert (=> b!717316 (= lt!319040 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717317 () Bool)

(declare-fun res!480098 () Bool)

(assert (=> b!717317 (=> (not res!480098) (not e!402717))))

(assert (=> b!717317 (= res!480098 (validKeyInArray!0 (select (arr!19449 a!3186) j!159)))))

(declare-fun b!717318 () Bool)

(declare-fun res!480099 () Bool)

(assert (=> b!717318 (=> (not res!480099) (not e!402717))))

(declare-fun arrayContainsKey!0 (array!40632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717318 (= res!480099 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!63736 res!480104) b!717315))

(assert (= (and b!717315 res!480103) b!717317))

(assert (= (and b!717317 res!480098) b!717312))

(assert (= (and b!717312 res!480100) b!717318))

(assert (= (and b!717318 res!480099) b!717316))

(assert (= (and b!717316 res!480101) b!717314))

(assert (= (and b!717314 res!480102) b!717313))

(declare-fun m!673243 () Bool)

(assert (=> b!717312 m!673243))

(declare-fun m!673245 () Bool)

(assert (=> b!717316 m!673245))

(declare-fun m!673247 () Bool)

(assert (=> b!717314 m!673247))

(declare-fun m!673249 () Bool)

(assert (=> b!717317 m!673249))

(assert (=> b!717317 m!673249))

(declare-fun m!673251 () Bool)

(assert (=> b!717317 m!673251))

(declare-fun m!673253 () Bool)

(assert (=> b!717318 m!673253))

(declare-fun m!673255 () Bool)

(assert (=> start!63736 m!673255))

(declare-fun m!673257 () Bool)

(assert (=> start!63736 m!673257))

(push 1)

(assert (not b!717312))

(assert (not b!717314))

(assert (not b!717318))

(assert (not b!717317))

(assert (not start!63736))

(assert (not b!717316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98803 () Bool)

(assert (=> d!98803 (= (validKeyInArray!0 (select (arr!19449 a!3186) j!159)) (and (not (= (select (arr!19449 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19449 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717317 d!98803))

(declare-fun d!98805 () Bool)

(assert (=> d!98805 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717312 d!98805))

(declare-fun d!98807 () Bool)

(assert (=> d!98807 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63736 d!98807))

(declare-fun d!98815 () Bool)

(assert (=> d!98815 (= (array_inv!15245 a!3186) (bvsge (size!19870 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63736 d!98815))

(declare-fun d!98817 () Bool)

(declare-fun res!480167 () Bool)

(declare-fun e!402763 () Bool)

(assert (=> d!98817 (=> res!480167 e!402763)))

(assert (=> d!98817 (= res!480167 (= (select (arr!19449 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!98817 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!402763)))

(declare-fun b!717391 () Bool)

(declare-fun e!402766 () Bool)

(assert (=> b!717391 (= e!402763 e!402766)))

(declare-fun res!480169 () Bool)

(assert (=> b!717391 (=> (not res!480169) (not e!402766))))

(assert (=> b!717391 (= res!480169 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19870 a!3186)))))

(declare-fun b!717392 () Bool)

(assert (=> b!717392 (= e!402766 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98817 (not res!480167)) b!717391))

(assert (= (and b!717391 res!480169) b!717392))

(declare-fun m!673307 () Bool)

(assert (=> d!98817 m!673307))

(declare-fun m!673309 () Bool)

(assert (=> b!717392 m!673309))

(assert (=> b!717318 d!98817))

(declare-fun b!717439 () Bool)

(declare-fun e!402792 () SeekEntryResult!7049)

(declare-fun lt!319083 () SeekEntryResult!7049)

(assert (=> b!717439 (= e!402792 (MissingZero!7049 (index!30566 lt!319083)))))

(declare-fun b!717440 () Bool)

(declare-fun e!402793 () SeekEntryResult!7049)

(assert (=> b!717440 (= e!402793 Undefined!7049)))

(declare-fun b!717442 () Bool)

(declare-fun e!402794 () SeekEntryResult!7049)

(assert (=> b!717442 (= e!402793 e!402794)))

(declare-fun lt!319085 () (_ BitVec 64))

(assert (=> b!717442 (= lt!319085 (select (arr!19449 a!3186) (index!30566 lt!319083)))))

(declare-fun c!78998 () Bool)

(assert (=> b!717442 (= c!78998 (= lt!319085 k!2102))))

(declare-fun b!717443 () Bool)

(declare-fun c!78999 () Bool)

(assert (=> b!717443 (= c!78999 (= lt!319085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!717443 (= e!402794 e!402792)))

(declare-fun b!717444 () Bool)

(assert (=> b!717444 (= e!402794 (Found!7049 (index!30566 lt!319083)))))

(declare-fun d!98825 () Bool)

(declare-fun lt!319084 () SeekEntryResult!7049)

(assert (=> d!98825 (and (or (is-Undefined!7049 lt!319084) (not (is-Found!7049 lt!319084)) (and (bvsge (index!30565 lt!319084) #b00000000000000000000000000000000) (bvslt (index!30565 lt!319084) (size!19870 a!3186)))) (or (is-Undefined!7049 lt!319084) (is-Found!7049 lt!319084) (not (is-MissingZero!7049 lt!319084)) (and (bvsge (index!30564 lt!319084) #b00000000000000000000000000000000) (bvslt (index!30564 lt!319084) (size!19870 a!3186)))) (or (is-Undefined!7049 lt!319084) (is-Found!7049 lt!319084) (is-MissingZero!7049 lt!319084) (not (is-MissingVacant!7049 lt!319084)) (and (bvsge (index!30567 lt!319084) #b00000000000000000000000000000000) (bvslt (index!30567 lt!319084) (size!19870 a!3186)))) (or (is-Undefined!7049 lt!319084) (ite (is-Found!7049 lt!319084) (= (select (arr!19449 a!3186) (index!30565 lt!319084)) k!2102) (ite (is-MissingZero!7049 lt!319084) (= (select (arr!19449 a!3186) (index!30564 lt!319084)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7049 lt!319084) (= (select (arr!19449 a!3186) (index!30567 lt!319084)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!98825 (= lt!319084 e!402793)))

(declare-fun c!79000 () Bool)

(assert (=> d!98825 (= c!79000 (and (is-Intermediate!7049 lt!319083) (undefined!7861 lt!319083)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40632 (_ BitVec 32)) SeekEntryResult!7049)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98825 (= lt!319083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!98825 (validMask!0 mask!3328)))

(assert (=> d!98825 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319084)))

(declare-fun b!717441 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40632 (_ BitVec 32)) SeekEntryResult!7049)

(assert (=> b!717441 (= e!402792 (seekKeyOrZeroReturnVacant!0 (x!61589 lt!319083) (index!30566 lt!319083) (index!30566 lt!319083) k!2102 a!3186 mask!3328))))

(assert (= (and d!98825 c!79000) b!717440))

(assert (= (and d!98825 (not c!79000)) b!717442))

(assert (= (and b!717442 c!78998) b!717444))

(assert (= (and b!717442 (not c!78998)) b!717443))

(assert (= (and b!717443 c!78999) b!717439))

(assert (= (and b!717443 (not c!78999)) b!717441))

(declare-fun m!673323 () Bool)

(assert (=> b!717442 m!673323))

(declare-fun m!673325 () Bool)

(assert (=> d!98825 m!673325))

(declare-fun m!673327 () Bool)

(assert (=> d!98825 m!673327))

(declare-fun m!673329 () Bool)

(assert (=> d!98825 m!673329))

(declare-fun m!673331 () Bool)

(assert (=> d!98825 m!673331))

(assert (=> d!98825 m!673255))

(assert (=> d!98825 m!673325))

(declare-fun m!673333 () Bool)

(assert (=> d!98825 m!673333))

(declare-fun m!673335 () Bool)

(assert (=> b!717441 m!673335))

(assert (=> b!717316 d!98825))

(declare-fun b!717465 () Bool)

(declare-fun e!402809 () Bool)

(declare-fun call!34695 () Bool)

(assert (=> b!717465 (= e!402809 call!34695)))

(declare-fun d!98833 () Bool)

(declare-fun res!480182 () Bool)

(declare-fun e!402807 () Bool)

(assert (=> d!98833 (=> res!480182 e!402807)))

(assert (=> d!98833 (= res!480182 (bvsge #b00000000000000000000000000000000 (size!19870 a!3186)))))

(assert (=> d!98833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!402807)))

(declare-fun bm!34692 () Bool)

(assert (=> bm!34692 (= call!34695 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!717466 () Bool)

(declare-fun e!402808 () Bool)

(assert (=> b!717466 (= e!402809 e!402808)))

(declare-fun lt!319100 () (_ BitVec 64))

(assert (=> b!717466 (= lt!319100 (select (arr!19449 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24646 0))(
  ( (Unit!24647) )
))
(declare-fun lt!319098 () Unit!24646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40632 (_ BitVec 64) (_ BitVec 32)) Unit!24646)

