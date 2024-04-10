; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134594 () Bool)

(assert start!134594)

(declare-fun b!1571179 () Bool)

(declare-fun res!1073433 () Bool)

(declare-fun e!876035 () Bool)

(assert (=> b!1571179 (=> (not res!1073433) (not e!876035))))

(declare-datatypes ((array!104817 0))(
  ( (array!104818 (arr!50587 (Array (_ BitVec 32) (_ BitVec 64))) (size!51137 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104817)

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104817 (_ BitVec 32)) Bool)

(assert (=> b!1571179 (= res!1073433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571181 () Bool)

(assert (=> b!1571181 (= e!876035 (bvslt mask!4043 #b00000000000000000000000000000000))))

(declare-fun b!1571180 () Bool)

(declare-fun res!1073436 () Bool)

(assert (=> b!1571180 (=> (not res!1073436) (not e!876035))))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571180 (= res!1073436 (validKeyInArray!0 k!2731))))

(declare-fun b!1571178 () Bool)

(declare-fun res!1073434 () Bool)

(assert (=> b!1571178 (=> (not res!1073434) (not e!876035))))

(assert (=> b!1571178 (= res!1073434 (= (size!51137 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun res!1073435 () Bool)

(assert (=> start!134594 (=> (not res!1073435) (not e!876035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134594 (= res!1073435 (validMask!0 mask!4043))))

(assert (=> start!134594 e!876035))

(assert (=> start!134594 true))

(declare-fun array_inv!39314 (array!104817) Bool)

(assert (=> start!134594 (array_inv!39314 a!3462)))

(assert (= (and start!134594 res!1073435) b!1571178))

(assert (= (and b!1571178 res!1073434) b!1571179))

(assert (= (and b!1571179 res!1073433) b!1571180))

(assert (= (and b!1571180 res!1073436) b!1571181))

(declare-fun m!1445173 () Bool)

(assert (=> b!1571179 m!1445173))

(declare-fun m!1445175 () Bool)

(assert (=> b!1571180 m!1445175))

(declare-fun m!1445177 () Bool)

(assert (=> start!134594 m!1445177))

(declare-fun m!1445179 () Bool)

(assert (=> start!134594 m!1445179))

(push 1)

(assert (not b!1571179))

(assert (not start!134594))

(assert (not b!1571180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!72358 () Bool)

(declare-fun call!72361 () Bool)

(assert (=> bm!72358 (= call!72361 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3462 mask!4043))))

(declare-fun b!1571234 () Bool)

(declare-fun e!876070 () Bool)

(declare-fun e!876069 () Bool)

(assert (=> b!1571234 (= e!876070 e!876069)))

(declare-fun c!145115 () Bool)

(assert (=> b!1571234 (= c!145115 (validKeyInArray!0 (select (arr!50587 a!3462) #b00000000000000000000000000000000)))))

(declare-fun b!1571235 () Bool)

(declare-fun e!876071 () Bool)

(assert (=> b!1571235 (= e!876069 e!876071)))

(declare-fun lt!673512 () (_ BitVec 64))

(assert (=> b!1571235 (= lt!673512 (select (arr!50587 a!3462) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!52106 0))(
  ( (Unit!52107) )
))
(declare-fun lt!673511 () Unit!52106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104817 (_ BitVec 64) (_ BitVec 32)) Unit!52106)

(assert (=> b!1571235 (= lt!673511 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3462 lt!673512 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1571235 (arrayContainsKey!0 a!3462 lt!673512 #b00000000000000000000000000000000)))

(declare-fun lt!673513 () Unit!52106)

(assert (=> b!1571235 (= lt!673513 lt!673511)))

(declare-fun res!1073476 () Bool)

(declare-datatypes ((SeekEntryResult!13531 0))(
  ( (MissingZero!13531 (index!56522 (_ BitVec 32))) (Found!13531 (index!56523 (_ BitVec 32))) (Intermediate!13531 (undefined!14343 Bool) (index!56524 (_ BitVec 32)) (x!141209 (_ BitVec 32))) (Undefined!13531) (MissingVacant!13531 (index!56525 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104817 (_ BitVec 32)) SeekEntryResult!13531)

(assert (=> b!1571235 (= res!1073476 (= (seekEntryOrOpen!0 (select (arr!50587 a!3462) #b00000000000000000000000000000000) a!3462 mask!4043) (Found!13531 #b00000000000000000000000000000000)))))

(assert (=> b!1571235 (=> (not res!1073476) (not e!876071))))

(declare-fun d!164495 () Bool)

(declare-fun res!1073475 () Bool)

(assert (=> d!164495 (=> res!1073475 e!876070)))

(assert (=> d!164495 (= res!1073475 (bvsge #b00000000000000000000000000000000 (size!51137 a!3462)))))

(assert (=> d!164495 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043) e!876070)))

(declare-fun b!1571236 () Bool)

(assert (=> b!1571236 (= e!876069 call!72361)))

(declare-fun b!1571237 () Bool)

(assert (=> b!1571237 (= e!876071 call!72361)))

(assert (= (and d!164495 (not res!1073475)) b!1571234))

(assert (= (and b!1571234 c!145115) b!1571235))

(assert (= (and b!1571234 (not c!145115)) b!1571236))

(assert (= (and b!1571235 res!1073476) b!1571237))

(assert (= (or b!1571237 b!1571236) bm!72358))

(declare-fun m!1445209 () Bool)

(assert (=> bm!72358 m!1445209))

(declare-fun m!1445211 () Bool)

(assert (=> b!1571234 m!1445211))

(assert (=> b!1571234 m!1445211))

(declare-fun m!1445213 () Bool)

(assert (=> b!1571234 m!1445213))

(assert (=> b!1571235 m!1445211))

(declare-fun m!1445215 () Bool)

(assert (=> b!1571235 m!1445215))

(declare-fun m!1445217 () Bool)

(assert (=> b!1571235 m!1445217))

(assert (=> b!1571235 m!1445211))

(declare-fun m!1445219 () Bool)

(assert (=> b!1571235 m!1445219))

(assert (=> b!1571179 d!164495))

(declare-fun d!164503 () Bool)

(assert (=> d!164503 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

(assert (=> start!134594 d!164503))

(declare-fun d!164509 () Bool)

(assert (=> d!164509 (= (array_inv!39314 a!3462) (bvsge (size!51137 a!3462) #b00000000000000000000000000000000))))

(assert (=> start!134594 d!164509))

(declare-fun d!164511 () Bool)

(assert (=> d!164511 (= (validKeyInArray!0 k!2731) (and (not (= k!2731 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2731 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571180 d!164511))

(push 1)

