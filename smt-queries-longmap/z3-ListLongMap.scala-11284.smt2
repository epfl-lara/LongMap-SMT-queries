; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131496 () Bool)

(assert start!131496)

(declare-fun b!1541010 () Bool)

(declare-fun res!1057740 () Bool)

(declare-fun e!857059 () Bool)

(assert (=> b!1541010 (=> (not res!1057740) (not e!857059))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102397 0))(
  ( (array!102398 (arr!49408 (Array (_ BitVec 32) (_ BitVec 64))) (size!49960 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102397)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541010 (= res!1057740 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49960 a!3920))))))

(declare-fun b!1541008 () Bool)

(declare-fun res!1057739 () Bool)

(assert (=> b!1541008 (=> (not res!1057739) (not e!857059))))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1541008 (= res!1057739 (and (= (size!49960 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49960 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49960 a!3920))))))

(declare-fun res!1057738 () Bool)

(assert (=> start!131496 (=> (not res!1057738) (not e!857059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131496 (= res!1057738 (validMask!0 mask!4052))))

(assert (=> start!131496 e!857059))

(assert (=> start!131496 true))

(declare-fun array_inv!38641 (array!102397) Bool)

(assert (=> start!131496 (array_inv!38641 a!3920)))

(declare-fun b!1541011 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102397 (_ BitVec 32)) Bool)

(assert (=> b!1541011 (= e!857059 (not (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052)))))

(declare-fun b!1541009 () Bool)

(declare-fun res!1057741 () Bool)

(assert (=> b!1541009 (=> (not res!1057741) (not e!857059))))

(assert (=> b!1541009 (= res!1057741 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131496 res!1057738) b!1541008))

(assert (= (and b!1541008 res!1057739) b!1541009))

(assert (= (and b!1541009 res!1057741) b!1541010))

(assert (= (and b!1541010 res!1057740) b!1541011))

(declare-fun m!1422425 () Bool)

(assert (=> start!131496 m!1422425))

(declare-fun m!1422427 () Bool)

(assert (=> start!131496 m!1422427))

(declare-fun m!1422429 () Bool)

(assert (=> b!1541011 m!1422429))

(declare-fun m!1422431 () Bool)

(assert (=> b!1541009 m!1422431))

(check-sat (not start!131496) (not b!1541011) (not b!1541009))
(check-sat)
(get-model)

(declare-fun d!160399 () Bool)

(assert (=> d!160399 (= (validMask!0 mask!4052) (and (or (= mask!4052 #b00000000000000000000000000000111) (= mask!4052 #b00000000000000000000000000001111) (= mask!4052 #b00000000000000000000000000011111) (= mask!4052 #b00000000000000000000000000111111) (= mask!4052 #b00000000000000000000000001111111) (= mask!4052 #b00000000000000000000000011111111) (= mask!4052 #b00000000000000000000000111111111) (= mask!4052 #b00000000000000000000001111111111) (= mask!4052 #b00000000000000000000011111111111) (= mask!4052 #b00000000000000000000111111111111) (= mask!4052 #b00000000000000000001111111111111) (= mask!4052 #b00000000000000000011111111111111) (= mask!4052 #b00000000000000000111111111111111) (= mask!4052 #b00000000000000001111111111111111) (= mask!4052 #b00000000000000011111111111111111) (= mask!4052 #b00000000000000111111111111111111) (= mask!4052 #b00000000000001111111111111111111) (= mask!4052 #b00000000000011111111111111111111) (= mask!4052 #b00000000000111111111111111111111) (= mask!4052 #b00000000001111111111111111111111) (= mask!4052 #b00000000011111111111111111111111) (= mask!4052 #b00000000111111111111111111111111) (= mask!4052 #b00000001111111111111111111111111) (= mask!4052 #b00000011111111111111111111111111) (= mask!4052 #b00000111111111111111111111111111) (= mask!4052 #b00001111111111111111111111111111) (= mask!4052 #b00011111111111111111111111111111) (= mask!4052 #b00111111111111111111111111111111)) (bvsle mask!4052 #b00111111111111111111111111111111)))))

(assert (=> start!131496 d!160399))

(declare-fun d!160405 () Bool)

(assert (=> d!160405 (= (array_inv!38641 a!3920) (bvsge (size!49960 a!3920) #b00000000000000000000000000000000))))

(assert (=> start!131496 d!160405))

(declare-fun b!1541056 () Bool)

(declare-fun e!857088 () Bool)

(declare-fun call!68641 () Bool)

(assert (=> b!1541056 (= e!857088 call!68641)))

(declare-fun b!1541057 () Bool)

(declare-fun e!857089 () Bool)

(assert (=> b!1541057 (= e!857089 e!857088)))

(declare-fun c!141201 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541057 (= c!141201 (validKeyInArray!0 (select (arr!49408 a!3920) (bvadd #b00000000000000000000000000000001 from!3298))))))

(declare-fun b!1541058 () Bool)

(declare-fun e!857087 () Bool)

(assert (=> b!1541058 (= e!857088 e!857087)))

(declare-fun lt!665382 () (_ BitVec 64))

(assert (=> b!1541058 (= lt!665382 (select (arr!49408 a!3920) (bvadd #b00000000000000000000000000000001 from!3298)))))

(declare-datatypes ((Unit!51305 0))(
  ( (Unit!51306) )
))
(declare-fun lt!665381 () Unit!51305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102397 (_ BitVec 64) (_ BitVec 32)) Unit!51305)

(assert (=> b!1541058 (= lt!665381 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3920 lt!665382 (bvadd #b00000000000000000000000000000001 from!3298)))))

(declare-fun arrayContainsKey!0 (array!102397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541058 (arrayContainsKey!0 a!3920 lt!665382 #b00000000000000000000000000000000)))

(declare-fun lt!665380 () Unit!51305)

(assert (=> b!1541058 (= lt!665380 lt!665381)))

(declare-fun res!1057777 () Bool)

(declare-datatypes ((SeekEntryResult!13505 0))(
  ( (MissingZero!13505 (index!56418 (_ BitVec 32))) (Found!13505 (index!56419 (_ BitVec 32))) (Intermediate!13505 (undefined!14317 Bool) (index!56420 (_ BitVec 32)) (x!138300 (_ BitVec 32))) (Undefined!13505) (MissingVacant!13505 (index!56421 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102397 (_ BitVec 32)) SeekEntryResult!13505)

(assert (=> b!1541058 (= res!1057777 (= (seekEntryOrOpen!0 (select (arr!49408 a!3920) (bvadd #b00000000000000000000000000000001 from!3298)) a!3920 mask!4052) (Found!13505 (bvadd #b00000000000000000000000000000001 from!3298))))))

(assert (=> b!1541058 (=> (not res!1057777) (not e!857087))))

(declare-fun d!160407 () Bool)

(declare-fun res!1057776 () Bool)

(assert (=> d!160407 (=> res!1057776 e!857089)))

(assert (=> d!160407 (= res!1057776 (bvsge (bvadd #b00000000000000000000000000000001 from!3298) (size!49960 a!3920)))))

(assert (=> d!160407 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052) e!857089)))

(declare-fun bm!68638 () Bool)

(assert (=> bm!68638 (= call!68641 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298 #b00000000000000000000000000000001) a!3920 mask!4052))))

(declare-fun b!1541059 () Bool)

(assert (=> b!1541059 (= e!857087 call!68641)))

(assert (= (and d!160407 (not res!1057776)) b!1541057))

(assert (= (and b!1541057 c!141201) b!1541058))

(assert (= (and b!1541057 (not c!141201)) b!1541056))

(assert (= (and b!1541058 res!1057777) b!1541059))

(assert (= (or b!1541059 b!1541056) bm!68638))

(declare-fun m!1422461 () Bool)

(assert (=> b!1541057 m!1422461))

(assert (=> b!1541057 m!1422461))

(declare-fun m!1422463 () Bool)

(assert (=> b!1541057 m!1422463))

(assert (=> b!1541058 m!1422461))

(declare-fun m!1422465 () Bool)

(assert (=> b!1541058 m!1422465))

(declare-fun m!1422467 () Bool)

(assert (=> b!1541058 m!1422467))

(assert (=> b!1541058 m!1422461))

(declare-fun m!1422469 () Bool)

(assert (=> b!1541058 m!1422469))

(declare-fun m!1422471 () Bool)

(assert (=> bm!68638 m!1422471))

(assert (=> b!1541011 d!160407))

(declare-fun b!1541060 () Bool)

(declare-fun e!857091 () Bool)

(declare-fun call!68642 () Bool)

(assert (=> b!1541060 (= e!857091 call!68642)))

(declare-fun b!1541061 () Bool)

(declare-fun e!857092 () Bool)

(assert (=> b!1541061 (= e!857092 e!857091)))

(declare-fun c!141202 () Bool)

(assert (=> b!1541061 (= c!141202 (validKeyInArray!0 (select (arr!49408 a!3920) from!3298)))))

(declare-fun b!1541062 () Bool)

(declare-fun e!857090 () Bool)

(assert (=> b!1541062 (= e!857091 e!857090)))

(declare-fun lt!665385 () (_ BitVec 64))

(assert (=> b!1541062 (= lt!665385 (select (arr!49408 a!3920) from!3298))))

(declare-fun lt!665384 () Unit!51305)

(assert (=> b!1541062 (= lt!665384 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3920 lt!665385 from!3298))))

(assert (=> b!1541062 (arrayContainsKey!0 a!3920 lt!665385 #b00000000000000000000000000000000)))

(declare-fun lt!665383 () Unit!51305)

(assert (=> b!1541062 (= lt!665383 lt!665384)))

(declare-fun res!1057779 () Bool)

(assert (=> b!1541062 (= res!1057779 (= (seekEntryOrOpen!0 (select (arr!49408 a!3920) from!3298) a!3920 mask!4052) (Found!13505 from!3298)))))

(assert (=> b!1541062 (=> (not res!1057779) (not e!857090))))

(declare-fun d!160415 () Bool)

(declare-fun res!1057778 () Bool)

(assert (=> d!160415 (=> res!1057778 e!857092)))

(assert (=> d!160415 (= res!1057778 (bvsge from!3298 (size!49960 a!3920)))))

(assert (=> d!160415 (= (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052) e!857092)))

(declare-fun bm!68639 () Bool)

(assert (=> bm!68639 (= call!68642 (arrayForallSeekEntryOrOpenFound!0 (bvadd from!3298 #b00000000000000000000000000000001) a!3920 mask!4052))))

(declare-fun b!1541063 () Bool)

(assert (=> b!1541063 (= e!857090 call!68642)))

(assert (= (and d!160415 (not res!1057778)) b!1541061))

(assert (= (and b!1541061 c!141202) b!1541062))

(assert (= (and b!1541061 (not c!141202)) b!1541060))

(assert (= (and b!1541062 res!1057779) b!1541063))

(assert (= (or b!1541063 b!1541060) bm!68639))

(declare-fun m!1422473 () Bool)

(assert (=> b!1541061 m!1422473))

(assert (=> b!1541061 m!1422473))

(declare-fun m!1422475 () Bool)

(assert (=> b!1541061 m!1422475))

(assert (=> b!1541062 m!1422473))

(declare-fun m!1422477 () Bool)

(assert (=> b!1541062 m!1422477))

(declare-fun m!1422479 () Bool)

(assert (=> b!1541062 m!1422479))

(assert (=> b!1541062 m!1422473))

(declare-fun m!1422481 () Bool)

(assert (=> b!1541062 m!1422481))

(declare-fun m!1422483 () Bool)

(assert (=> bm!68639 m!1422483))

(assert (=> b!1541009 d!160415))

(check-sat (not b!1541057) (not b!1541061) (not b!1541062) (not b!1541058) (not bm!68639) (not bm!68638))
(check-sat)
