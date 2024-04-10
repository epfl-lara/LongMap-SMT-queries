; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85752 () Bool)

(assert start!85752)

(declare-fun b!994971 () Bool)

(declare-fun res!665478 () Bool)

(declare-fun e!561436 () Bool)

(assert (=> b!994971 (=> (not res!665478) (not e!561436))))

(declare-datatypes ((array!62958 0))(
  ( (array!62959 (arr!30318 (Array (_ BitVec 32) (_ BitVec 64))) (size!30820 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62958)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62958 (_ BitVec 32)) Bool)

(assert (=> b!994971 (= res!665478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!994972 () Bool)

(declare-fun res!665479 () Bool)

(declare-fun e!561435 () Bool)

(assert (=> b!994972 (=> (not res!665479) (not e!561435))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!994972 (= res!665479 (and (= (size!30820 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30820 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30820 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994973 () Bool)

(declare-fun res!665484 () Bool)

(assert (=> b!994973 (=> (not res!665484) (not e!561435))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994973 (= res!665484 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994974 () Bool)

(assert (=> b!994974 (= e!561435 e!561436)))

(declare-fun res!665481 () Bool)

(assert (=> b!994974 (=> (not res!665481) (not e!561436))))

(declare-datatypes ((SeekEntryResult!9250 0))(
  ( (MissingZero!9250 (index!39371 (_ BitVec 32))) (Found!9250 (index!39372 (_ BitVec 32))) (Intermediate!9250 (undefined!10062 Bool) (index!39373 (_ BitVec 32)) (x!86811 (_ BitVec 32))) (Undefined!9250) (MissingVacant!9250 (index!39374 (_ BitVec 32))) )
))
(declare-fun lt!440795 () SeekEntryResult!9250)

(assert (=> b!994974 (= res!665481 (or (= lt!440795 (MissingVacant!9250 i!1194)) (= lt!440795 (MissingZero!9250 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62958 (_ BitVec 32)) SeekEntryResult!9250)

(assert (=> b!994974 (= lt!440795 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994975 () Bool)

(declare-fun res!665480 () Bool)

(assert (=> b!994975 (=> (not res!665480) (not e!561435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994975 (= res!665480 (validKeyInArray!0 k!2224))))

(declare-fun res!665483 () Bool)

(assert (=> start!85752 (=> (not res!665483) (not e!561435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85752 (= res!665483 (validMask!0 mask!3464))))

(assert (=> start!85752 e!561435))

(declare-fun array_inv!23442 (array!62958) Bool)

(assert (=> start!85752 (array_inv!23442 a!3219)))

(assert (=> start!85752 true))

(declare-fun b!994976 () Bool)

(assert (=> b!994976 (= e!561436 (and (bvsle #b00000000000000000000000000000000 (size!30820 a!3219)) (bvsge (size!30820 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!994977 () Bool)

(declare-fun res!665482 () Bool)

(assert (=> b!994977 (=> (not res!665482) (not e!561435))))

(assert (=> b!994977 (= res!665482 (validKeyInArray!0 (select (arr!30318 a!3219) j!170)))))

(assert (= (and start!85752 res!665483) b!994972))

(assert (= (and b!994972 res!665479) b!994977))

(assert (= (and b!994977 res!665482) b!994975))

(assert (= (and b!994975 res!665480) b!994973))

(assert (= (and b!994973 res!665484) b!994974))

(assert (= (and b!994974 res!665481) b!994971))

(assert (= (and b!994971 res!665478) b!994976))

(declare-fun m!922483 () Bool)

(assert (=> b!994975 m!922483))

(declare-fun m!922485 () Bool)

(assert (=> b!994973 m!922485))

(declare-fun m!922487 () Bool)

(assert (=> b!994974 m!922487))

(declare-fun m!922489 () Bool)

(assert (=> b!994977 m!922489))

(assert (=> b!994977 m!922489))

(declare-fun m!922491 () Bool)

(assert (=> b!994977 m!922491))

(declare-fun m!922493 () Bool)

(assert (=> b!994971 m!922493))

(declare-fun m!922495 () Bool)

(assert (=> start!85752 m!922495))

(declare-fun m!922497 () Bool)

(assert (=> start!85752 m!922497))

(push 1)

(assert (not b!994973))

(assert (not b!994975))

(assert (not start!85752))

(assert (not b!994974))

(assert (not b!994971))

(assert (not b!994977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118751 () Bool)

(assert (=> d!118751 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994975 d!118751))

(declare-fun b!994998 () Bool)

(declare-fun e!561454 () Bool)

(declare-fun call!42182 () Bool)

(assert (=> b!994998 (= e!561454 call!42182)))

(declare-fun d!118755 () Bool)

(declare-fun res!665495 () Bool)

(declare-fun e!561452 () Bool)

(assert (=> d!118755 (=> res!665495 e!561452)))

(assert (=> d!118755 (= res!665495 (bvsge #b00000000000000000000000000000000 (size!30820 a!3219)))))

(assert (=> d!118755 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561452)))

(declare-fun bm!42179 () Bool)

(assert (=> bm!42179 (= call!42182 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!994999 () Bool)

(declare-fun e!561453 () Bool)

(assert (=> b!994999 (= e!561453 e!561454)))

(declare-fun lt!440811 () (_ BitVec 64))

(assert (=> b!994999 (= lt!440811 (select (arr!30318 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32948 0))(
  ( (Unit!32949) )
))
(declare-fun lt!440813 () Unit!32948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62958 (_ BitVec 64) (_ BitVec 32)) Unit!32948)

(assert (=> b!994999 (= lt!440813 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440811 #b00000000000000000000000000000000))))

(assert (=> b!994999 (arrayContainsKey!0 a!3219 lt!440811 #b00000000000000000000000000000000)))

(declare-fun lt!440812 () Unit!32948)

(assert (=> b!994999 (= lt!440812 lt!440813)))

(declare-fun res!665496 () Bool)

(assert (=> b!994999 (= res!665496 (= (seekEntryOrOpen!0 (select (arr!30318 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9250 #b00000000000000000000000000000000)))))

(assert (=> b!994999 (=> (not res!665496) (not e!561454))))

(declare-fun b!995000 () Bool)

(assert (=> b!995000 (= e!561453 call!42182)))

(declare-fun b!995001 () Bool)

(assert (=> b!995001 (= e!561452 e!561453)))

(declare-fun c!100892 () Bool)

(assert (=> b!995001 (= c!100892 (validKeyInArray!0 (select (arr!30318 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!118755 (not res!665495)) b!995001))

(assert (= (and b!995001 c!100892) b!994999))

(assert (= (and b!995001 (not c!100892)) b!995000))

(assert (= (and b!994999 res!665496) b!994998))

(assert (= (or b!994998 b!995000) bm!42179))

(declare-fun m!922511 () Bool)

(assert (=> bm!42179 m!922511))

(declare-fun m!922513 () Bool)

(assert (=> b!994999 m!922513))

(declare-fun m!922515 () Bool)

(assert (=> b!994999 m!922515))

(declare-fun m!922517 () Bool)

(assert (=> b!994999 m!922517))

(assert (=> b!994999 m!922513))

(declare-fun m!922519 () Bool)

(assert (=> b!994999 m!922519))

(assert (=> b!995001 m!922513))

(assert (=> b!995001 m!922513))

(declare-fun m!922521 () Bool)

(assert (=> b!995001 m!922521))

(assert (=> b!994971 d!118755))

(declare-fun d!118757 () Bool)

(assert (=> d!118757 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85752 d!118757))

(declare-fun d!118759 () Bool)

(assert (=> d!118759 (= (array_inv!23442 a!3219) (bvsge (size!30820 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85752 d!118759))

(declare-fun d!118763 () Bool)

(assert (=> d!118763 (= (validKeyInArray!0 (select (arr!30318 a!3219) j!170)) (and (not (= (select (arr!30318 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30318 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994977 d!118763))

(declare-fun d!118765 () Bool)

(declare-fun res!665507 () Bool)

(declare-fun e!561483 () Bool)

(assert (=> d!118765 (=> res!665507 e!561483)))

(assert (=> d!118765 (= res!665507 (= (select (arr!30318 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!118765 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!561483)))

(declare-fun b!995048 () Bool)

(declare-fun e!561484 () Bool)

(assert (=> b!995048 (= e!561483 e!561484)))

(declare-fun res!665508 () Bool)

(assert (=> b!995048 (=> (not res!665508) (not e!561484))))

(assert (=> b!995048 (= res!665508 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30820 a!3219)))))

(declare-fun b!995049 () Bool)

(assert (=> b!995049 (= e!561484 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118765 (not res!665507)) b!995048))

(assert (= (and b!995048 res!665508) b!995049))

(assert (=> d!118765 m!922513))

(declare-fun m!922555 () Bool)

(assert (=> b!995049 m!922555))

(assert (=> b!994973 d!118765))

(declare-fun b!995076 () Bool)

(declare-fun lt!440845 () SeekEntryResult!9250)

(declare-fun e!561503 () SeekEntryResult!9250)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62958 (_ BitVec 32)) SeekEntryResult!9250)

(assert (=> b!995076 (= e!561503 (seekKeyOrZeroReturnVacant!0 (x!86811 lt!440845) (index!39373 lt!440845) (index!39373 lt!440845) k!2224 a!3219 mask!3464))))

