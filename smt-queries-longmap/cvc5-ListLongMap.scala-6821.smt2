; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85748 () Bool)

(assert start!85748)

(declare-fun b!994929 () Bool)

(declare-fun res!665440 () Bool)

(declare-fun e!561416 () Bool)

(assert (=> b!994929 (=> (not res!665440) (not e!561416))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994929 (= res!665440 (validKeyInArray!0 k!2224))))

(declare-fun b!994930 () Bool)

(declare-fun res!665442 () Bool)

(assert (=> b!994930 (=> (not res!665442) (not e!561416))))

(declare-datatypes ((array!62954 0))(
  ( (array!62955 (arr!30316 (Array (_ BitVec 32) (_ BitVec 64))) (size!30818 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62954)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994930 (= res!665442 (and (= (size!30818 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30818 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30818 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994931 () Bool)

(declare-fun res!665436 () Bool)

(assert (=> b!994931 (=> (not res!665436) (not e!561416))))

(assert (=> b!994931 (= res!665436 (validKeyInArray!0 (select (arr!30316 a!3219) j!170)))))

(declare-fun b!994932 () Bool)

(declare-fun e!561417 () Bool)

(assert (=> b!994932 (= e!561416 e!561417)))

(declare-fun res!665441 () Bool)

(assert (=> b!994932 (=> (not res!665441) (not e!561417))))

(declare-datatypes ((SeekEntryResult!9248 0))(
  ( (MissingZero!9248 (index!39363 (_ BitVec 32))) (Found!9248 (index!39364 (_ BitVec 32))) (Intermediate!9248 (undefined!10060 Bool) (index!39365 (_ BitVec 32)) (x!86809 (_ BitVec 32))) (Undefined!9248) (MissingVacant!9248 (index!39366 (_ BitVec 32))) )
))
(declare-fun lt!440789 () SeekEntryResult!9248)

(assert (=> b!994932 (= res!665441 (or (= lt!440789 (MissingVacant!9248 i!1194)) (= lt!440789 (MissingZero!9248 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62954 (_ BitVec 32)) SeekEntryResult!9248)

(assert (=> b!994932 (= lt!440789 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994933 () Bool)

(declare-fun res!665439 () Bool)

(assert (=> b!994933 (=> (not res!665439) (not e!561416))))

(declare-fun arrayContainsKey!0 (array!62954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994933 (= res!665439 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!665438 () Bool)

(assert (=> start!85748 (=> (not res!665438) (not e!561416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85748 (= res!665438 (validMask!0 mask!3464))))

(assert (=> start!85748 e!561416))

(declare-fun array_inv!23440 (array!62954) Bool)

(assert (=> start!85748 (array_inv!23440 a!3219)))

(assert (=> start!85748 true))

(declare-fun b!994934 () Bool)

(declare-fun res!665437 () Bool)

(assert (=> b!994934 (=> (not res!665437) (not e!561417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62954 (_ BitVec 32)) Bool)

(assert (=> b!994934 (= res!665437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!994935 () Bool)

(assert (=> b!994935 (= e!561417 (and (bvsle #b00000000000000000000000000000000 (size!30818 a!3219)) (bvsge (size!30818 a!3219) #b01111111111111111111111111111111)))))

(assert (= (and start!85748 res!665438) b!994930))

(assert (= (and b!994930 res!665442) b!994931))

(assert (= (and b!994931 res!665436) b!994929))

(assert (= (and b!994929 res!665440) b!994933))

(assert (= (and b!994933 res!665439) b!994932))

(assert (= (and b!994932 res!665441) b!994934))

(assert (= (and b!994934 res!665437) b!994935))

(declare-fun m!922451 () Bool)

(assert (=> b!994932 m!922451))

(declare-fun m!922453 () Bool)

(assert (=> b!994931 m!922453))

(assert (=> b!994931 m!922453))

(declare-fun m!922455 () Bool)

(assert (=> b!994931 m!922455))

(declare-fun m!922457 () Bool)

(assert (=> b!994934 m!922457))

(declare-fun m!922459 () Bool)

(assert (=> b!994933 m!922459))

(declare-fun m!922461 () Bool)

(assert (=> start!85748 m!922461))

(declare-fun m!922463 () Bool)

(assert (=> start!85748 m!922463))

(declare-fun m!922465 () Bool)

(assert (=> b!994929 m!922465))

(push 1)

(assert (not b!994933))

(assert (not start!85748))

(assert (not b!994934))

(assert (not b!994931))

(assert (not b!994932))

(assert (not b!994929))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118747 () Bool)

(assert (=> d!118747 (= (validKeyInArray!0 (select (arr!30316 a!3219) j!170)) (and (not (= (select (arr!30316 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30316 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994931 d!118747))

(declare-fun b!995026 () Bool)

(declare-fun e!561469 () SeekEntryResult!9248)

(declare-fun lt!440828 () SeekEntryResult!9248)

(assert (=> b!995026 (= e!561469 (MissingZero!9248 (index!39365 lt!440828)))))

(declare-fun b!995027 () Bool)

(declare-fun e!561468 () SeekEntryResult!9248)

(assert (=> b!995027 (= e!561468 (Found!9248 (index!39365 lt!440828)))))

(declare-fun b!995028 () Bool)

(declare-fun c!100907 () Bool)

(declare-fun lt!440827 () (_ BitVec 64))

(assert (=> b!995028 (= c!100907 (= lt!440827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!995028 (= e!561468 e!561469)))

(declare-fun b!995030 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62954 (_ BitVec 32)) SeekEntryResult!9248)

(assert (=> b!995030 (= e!561469 (seekKeyOrZeroReturnVacant!0 (x!86809 lt!440828) (index!39365 lt!440828) (index!39365 lt!440828) k!2224 a!3219 mask!3464))))

(declare-fun b!995031 () Bool)

(declare-fun e!561467 () SeekEntryResult!9248)

(assert (=> b!995031 (= e!561467 e!561468)))

(assert (=> b!995031 (= lt!440827 (select (arr!30316 a!3219) (index!39365 lt!440828)))))

(declare-fun c!100906 () Bool)

(assert (=> b!995031 (= c!100906 (= lt!440827 k!2224))))

(declare-fun d!118749 () Bool)

(declare-fun lt!440826 () SeekEntryResult!9248)

(assert (=> d!118749 (and (or (is-Undefined!9248 lt!440826) (not (is-Found!9248 lt!440826)) (and (bvsge (index!39364 lt!440826) #b00000000000000000000000000000000) (bvslt (index!39364 lt!440826) (size!30818 a!3219)))) (or (is-Undefined!9248 lt!440826) (is-Found!9248 lt!440826) (not (is-MissingZero!9248 lt!440826)) (and (bvsge (index!39363 lt!440826) #b00000000000000000000000000000000) (bvslt (index!39363 lt!440826) (size!30818 a!3219)))) (or (is-Undefined!9248 lt!440826) (is-Found!9248 lt!440826) (is-MissingZero!9248 lt!440826) (not (is-MissingVacant!9248 lt!440826)) (and (bvsge (index!39366 lt!440826) #b00000000000000000000000000000000) (bvslt (index!39366 lt!440826) (size!30818 a!3219)))) (or (is-Undefined!9248 lt!440826) (ite (is-Found!9248 lt!440826) (= (select (arr!30316 a!3219) (index!39364 lt!440826)) k!2224) (ite (is-MissingZero!9248 lt!440826) (= (select (arr!30316 a!3219) (index!39363 lt!440826)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9248 lt!440826) (= (select (arr!30316 a!3219) (index!39366 lt!440826)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118749 (= lt!440826 e!561467)))

(declare-fun c!100905 () Bool)

(assert (=> d!118749 (= c!100905 (and (is-Intermediate!9248 lt!440828) (undefined!10060 lt!440828)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62954 (_ BitVec 32)) SeekEntryResult!9248)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118749 (= lt!440828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!118749 (validMask!0 mask!3464)))

(assert (=> d!118749 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!440826)))

(declare-fun b!995029 () Bool)

(assert (=> b!995029 (= e!561467 Undefined!9248)))

(assert (= (and d!118749 c!100905) b!995029))

(assert (= (and d!118749 (not c!100905)) b!995031))

(assert (= (and b!995031 c!100906) b!995027))

(assert (= (and b!995031 (not c!100906)) b!995028))

(assert (= (and b!995028 c!100907) b!995026))

(assert (= (and b!995028 (not c!100907)) b!995030))

(declare-fun m!922523 () Bool)

(assert (=> b!995030 m!922523))

(declare-fun m!922525 () Bool)

(assert (=> b!995031 m!922525))

(assert (=> d!118749 m!922461))

(declare-fun m!922527 () Bool)

(assert (=> d!118749 m!922527))

(declare-fun m!922529 () Bool)

(assert (=> d!118749 m!922529))

(declare-fun m!922531 () Bool)

(assert (=> d!118749 m!922531))

(declare-fun m!922533 () Bool)

(assert (=> d!118749 m!922533))

(assert (=> d!118749 m!922527))

(declare-fun m!922535 () Bool)

(assert (=> d!118749 m!922535))

(assert (=> b!994932 d!118749))

(declare-fun d!118761 () Bool)

(declare-fun res!665505 () Bool)

(declare-fun e!561481 () Bool)

(assert (=> d!118761 (=> res!665505 e!561481)))

(assert (=> d!118761 (= res!665505 (= (select (arr!30316 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!118761 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!561481)))

(declare-fun b!995046 () Bool)

(declare-fun e!561482 () Bool)

(assert (=> b!995046 (= e!561481 e!561482)))

(declare-fun res!665506 () Bool)

(assert (=> b!995046 (=> (not res!665506) (not e!561482))))

(assert (=> b!995046 (= res!665506 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30818 a!3219)))))

(declare-fun b!995047 () Bool)

(assert (=> b!995047 (= e!561482 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118761 (not res!665505)) b!995046))

(assert (= (and b!995046 res!665506) b!995047))

(declare-fun m!922551 () Bool)

(assert (=> d!118761 m!922551))

(declare-fun m!922553 () Bool)

(assert (=> b!995047 m!922553))

(assert (=> b!994933 d!118761))

(declare-fun d!118769 () Bool)

(assert (=> d!118769 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994929 d!118769))

(declare-fun d!118773 () Bool)

(assert (=> d!118773 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85748 d!118773))

(declare-fun d!118781 () Bool)

(assert (=> d!118781 (= (array_inv!23440 a!3219) (bvsge (size!30818 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85748 d!118781))

(declare-fun b!995082 () Bool)

(declare-fun e!561507 () Bool)

(declare-fun call!42185 () Bool)

(assert (=> b!995082 (= e!561507 call!42185)))

(declare-fun d!118783 () Bool)

(declare-fun res!665520 () Bool)

(declare-fun e!561506 () Bool)

(assert (=> d!118783 (=> res!665520 e!561506)))

(assert (=> d!118783 (= res!665520 (bvsge #b00000000000000000000000000000000 (size!30818 a!3219)))))

(assert (=> d!118783 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561506)))

(declare-fun bm!42182 () Bool)

(assert (=> bm!42182 (= call!42185 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!995083 () Bool)

(declare-fun e!561508 () Bool)

(assert (=> b!995083 (= e!561506 e!561508)))

(declare-fun c!100922 () Bool)

