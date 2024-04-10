; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134596 () Bool)

(assert start!134596)

(declare-fun b!1571191 () Bool)

(declare-fun res!1073448 () Bool)

(declare-fun e!876040 () Bool)

(assert (=> b!1571191 (=> (not res!1073448) (not e!876040))))

(declare-datatypes ((array!104819 0))(
  ( (array!104820 (arr!50588 (Array (_ BitVec 32) (_ BitVec 64))) (size!51138 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104819)

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104819 (_ BitVec 32)) Bool)

(assert (=> b!1571191 (= res!1073448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571190 () Bool)

(declare-fun res!1073446 () Bool)

(assert (=> b!1571190 (=> (not res!1073446) (not e!876040))))

(assert (=> b!1571190 (= res!1073446 (= (size!51138 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun res!1073445 () Bool)

(assert (=> start!134596 (=> (not res!1073445) (not e!876040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134596 (= res!1073445 (validMask!0 mask!4043))))

(assert (=> start!134596 e!876040))

(assert (=> start!134596 true))

(declare-fun array_inv!39315 (array!104819) Bool)

(assert (=> start!134596 (array_inv!39315 a!3462)))

(declare-fun b!1571192 () Bool)

(declare-fun res!1073447 () Bool)

(assert (=> b!1571192 (=> (not res!1073447) (not e!876040))))

(declare-fun k0!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571192 (= res!1073447 (validKeyInArray!0 k0!2731))))

(declare-fun b!1571193 () Bool)

(assert (=> b!1571193 (= e!876040 (bvslt mask!4043 #b00000000000000000000000000000000))))

(assert (= (and start!134596 res!1073445) b!1571190))

(assert (= (and b!1571190 res!1073446) b!1571191))

(assert (= (and b!1571191 res!1073448) b!1571192))

(assert (= (and b!1571192 res!1073447) b!1571193))

(declare-fun m!1445181 () Bool)

(assert (=> b!1571191 m!1445181))

(declare-fun m!1445183 () Bool)

(assert (=> start!134596 m!1445183))

(declare-fun m!1445185 () Bool)

(assert (=> start!134596 m!1445185))

(declare-fun m!1445187 () Bool)

(assert (=> b!1571192 m!1445187))

(check-sat (not b!1571192) (not b!1571191) (not start!134596))
(check-sat)
(get-model)

(declare-fun d!164491 () Bool)

(assert (=> d!164491 (= (validKeyInArray!0 k0!2731) (and (not (= k0!2731 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2731 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571192 d!164491))

(declare-fun b!1571231 () Bool)

(declare-fun e!876067 () Bool)

(declare-fun call!72360 () Bool)

(assert (=> b!1571231 (= e!876067 call!72360)))

(declare-fun b!1571232 () Bool)

(declare-fun e!876066 () Bool)

(declare-fun e!876068 () Bool)

(assert (=> b!1571232 (= e!876066 e!876068)))

(declare-fun c!145114 () Bool)

(assert (=> b!1571232 (= c!145114 (validKeyInArray!0 (select (arr!50588 a!3462) #b00000000000000000000000000000000)))))

(declare-fun b!1571233 () Bool)

(assert (=> b!1571233 (= e!876068 call!72360)))

(declare-fun bm!72355 () Bool)

(assert (=> bm!72355 (= call!72360 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3462 mask!4043))))

(declare-fun d!164493 () Bool)

(declare-fun res!1073473 () Bool)

(assert (=> d!164493 (=> res!1073473 e!876066)))

(assert (=> d!164493 (= res!1073473 (bvsge #b00000000000000000000000000000000 (size!51138 a!3462)))))

(assert (=> d!164493 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043) e!876066)))

(declare-fun b!1571230 () Bool)

(assert (=> b!1571230 (= e!876068 e!876067)))

(declare-fun lt!673509 () (_ BitVec 64))

(assert (=> b!1571230 (= lt!673509 (select (arr!50588 a!3462) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!52102 0))(
  ( (Unit!52103) )
))
(declare-fun lt!673510 () Unit!52102)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104819 (_ BitVec 64) (_ BitVec 32)) Unit!52102)

(assert (=> b!1571230 (= lt!673510 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3462 lt!673509 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1571230 (arrayContainsKey!0 a!3462 lt!673509 #b00000000000000000000000000000000)))

(declare-fun lt!673508 () Unit!52102)

(assert (=> b!1571230 (= lt!673508 lt!673510)))

(declare-fun res!1073474 () Bool)

(declare-datatypes ((SeekEntryResult!13530 0))(
  ( (MissingZero!13530 (index!56518 (_ BitVec 32))) (Found!13530 (index!56519 (_ BitVec 32))) (Intermediate!13530 (undefined!14342 Bool) (index!56520 (_ BitVec 32)) (x!141208 (_ BitVec 32))) (Undefined!13530) (MissingVacant!13530 (index!56521 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104819 (_ BitVec 32)) SeekEntryResult!13530)

(assert (=> b!1571230 (= res!1073474 (= (seekEntryOrOpen!0 (select (arr!50588 a!3462) #b00000000000000000000000000000000) a!3462 mask!4043) (Found!13530 #b00000000000000000000000000000000)))))

(assert (=> b!1571230 (=> (not res!1073474) (not e!876067))))

(assert (= (and d!164493 (not res!1073473)) b!1571232))

(assert (= (and b!1571232 c!145114) b!1571230))

(assert (= (and b!1571232 (not c!145114)) b!1571233))

(assert (= (and b!1571230 res!1073474) b!1571231))

(assert (= (or b!1571231 b!1571233) bm!72355))

(declare-fun m!1445197 () Bool)

(assert (=> b!1571232 m!1445197))

(assert (=> b!1571232 m!1445197))

(declare-fun m!1445199 () Bool)

(assert (=> b!1571232 m!1445199))

(declare-fun m!1445201 () Bool)

(assert (=> bm!72355 m!1445201))

(assert (=> b!1571230 m!1445197))

(declare-fun m!1445203 () Bool)

(assert (=> b!1571230 m!1445203))

(declare-fun m!1445205 () Bool)

(assert (=> b!1571230 m!1445205))

(assert (=> b!1571230 m!1445197))

(declare-fun m!1445207 () Bool)

(assert (=> b!1571230 m!1445207))

(assert (=> b!1571191 d!164493))

(declare-fun d!164501 () Bool)

(assert (=> d!164501 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

(assert (=> start!134596 d!164501))

(declare-fun d!164507 () Bool)

(assert (=> d!164507 (= (array_inv!39315 a!3462) (bvsge (size!51138 a!3462) #b00000000000000000000000000000000))))

(assert (=> start!134596 d!164507))

(check-sat (not b!1571230) (not bm!72355) (not b!1571232))
(check-sat)
