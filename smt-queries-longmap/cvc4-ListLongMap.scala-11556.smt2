; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134598 () Bool)

(assert start!134598)

(declare-fun b!1571204 () Bool)

(declare-fun res!1073458 () Bool)

(declare-fun e!876046 () Bool)

(assert (=> b!1571204 (=> (not res!1073458) (not e!876046))))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571204 (= res!1073458 (validKeyInArray!0 k!2731))))

(declare-fun b!1571203 () Bool)

(declare-fun res!1073457 () Bool)

(assert (=> b!1571203 (=> (not res!1073457) (not e!876046))))

(declare-datatypes ((array!104821 0))(
  ( (array!104822 (arr!50589 (Array (_ BitVec 32) (_ BitVec 64))) (size!51139 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104821)

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104821 (_ BitVec 32)) Bool)

(assert (=> b!1571203 (= res!1073457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571202 () Bool)

(declare-fun res!1073459 () Bool)

(assert (=> b!1571202 (=> (not res!1073459) (not e!876046))))

(assert (=> b!1571202 (= res!1073459 (= (size!51139 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun res!1073460 () Bool)

(assert (=> start!134598 (=> (not res!1073460) (not e!876046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134598 (= res!1073460 (validMask!0 mask!4043))))

(assert (=> start!134598 e!876046))

(assert (=> start!134598 true))

(declare-fun array_inv!39316 (array!104821) Bool)

(assert (=> start!134598 (array_inv!39316 a!3462)))

(declare-fun b!1571205 () Bool)

(assert (=> b!1571205 (= e!876046 (bvslt mask!4043 #b00000000000000000000000000000000))))

(assert (= (and start!134598 res!1073460) b!1571202))

(assert (= (and b!1571202 res!1073459) b!1571203))

(assert (= (and b!1571203 res!1073457) b!1571204))

(assert (= (and b!1571204 res!1073458) b!1571205))

(declare-fun m!1445189 () Bool)

(assert (=> b!1571204 m!1445189))

(declare-fun m!1445191 () Bool)

(assert (=> b!1571203 m!1445191))

(declare-fun m!1445193 () Bool)

(assert (=> start!134598 m!1445193))

(declare-fun m!1445195 () Bool)

(assert (=> start!134598 m!1445195))

(push 1)

(assert (not b!1571204))

(assert (not b!1571203))

(assert (not start!134598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164497 () Bool)

(assert (=> d!164497 (= (validKeyInArray!0 k!2731) (and (not (= k!2731 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2731 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571204 d!164497))

(declare-fun b!1571239 () Bool)

(declare-fun e!876072 () Bool)

(declare-fun e!876074 () Bool)

(assert (=> b!1571239 (= e!876072 e!876074)))

(declare-fun lt!673514 () (_ BitVec 64))

(assert (=> b!1571239 (= lt!673514 (select (arr!50589 a!3462) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!52104 0))(
  ( (Unit!52105) )
))
(declare-fun lt!673516 () Unit!52104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104821 (_ BitVec 64) (_ BitVec 32)) Unit!52104)

(assert (=> b!1571239 (= lt!673516 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3462 lt!673514 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1571239 (arrayContainsKey!0 a!3462 lt!673514 #b00000000000000000000000000000000)))

(declare-fun lt!673515 () Unit!52104)

(assert (=> b!1571239 (= lt!673515 lt!673516)))

(declare-fun res!1073477 () Bool)

(declare-datatypes ((SeekEntryResult!13532 0))(
  ( (MissingZero!13532 (index!56526 (_ BitVec 32))) (Found!13532 (index!56527 (_ BitVec 32))) (Intermediate!13532 (undefined!14344 Bool) (index!56528 (_ BitVec 32)) (x!141210 (_ BitVec 32))) (Undefined!13532) (MissingVacant!13532 (index!56529 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104821 (_ BitVec 32)) SeekEntryResult!13532)

(assert (=> b!1571239 (= res!1073477 (= (seekEntryOrOpen!0 (select (arr!50589 a!3462) #b00000000000000000000000000000000) a!3462 mask!4043) (Found!13532 #b00000000000000000000000000000000)))))

(assert (=> b!1571239 (=> (not res!1073477) (not e!876074))))

(declare-fun b!1571240 () Bool)

(declare-fun call!72362 () Bool)

(assert (=> b!1571240 (= e!876072 call!72362)))

(declare-fun b!1571238 () Bool)

(assert (=> b!1571238 (= e!876074 call!72362)))

(declare-fun d!164499 () Bool)

(declare-fun res!1073478 () Bool)

(declare-fun e!876073 () Bool)

(assert (=> d!164499 (=> res!1073478 e!876073)))

(assert (=> d!164499 (= res!1073478 (bvsge #b00000000000000000000000000000000 (size!51139 a!3462)))))

(assert (=> d!164499 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043) e!876073)))

(declare-fun b!1571241 () Bool)

(assert (=> b!1571241 (= e!876073 e!876072)))

(declare-fun c!145116 () Bool)

(assert (=> b!1571241 (= c!145116 (validKeyInArray!0 (select (arr!50589 a!3462) #b00000000000000000000000000000000)))))

(declare-fun bm!72359 () Bool)

(assert (=> bm!72359 (= call!72362 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3462 mask!4043))))

(assert (= (and d!164499 (not res!1073478)) b!1571241))

(assert (= (and b!1571241 c!145116) b!1571239))

(assert (= (and b!1571241 (not c!145116)) b!1571240))

(assert (= (and b!1571239 res!1073477) b!1571238))

(assert (= (or b!1571238 b!1571240) bm!72359))

(declare-fun m!1445221 () Bool)

(assert (=> b!1571239 m!1445221))

(declare-fun m!1445223 () Bool)

(assert (=> b!1571239 m!1445223))

(declare-fun m!1445225 () Bool)

(assert (=> b!1571239 m!1445225))

(assert (=> b!1571239 m!1445221))

(declare-fun m!1445227 () Bool)

(assert (=> b!1571239 m!1445227))

(assert (=> b!1571241 m!1445221))

(assert (=> b!1571241 m!1445221))

(declare-fun m!1445229 () Bool)

(assert (=> b!1571241 m!1445229))

(declare-fun m!1445231 () Bool)

(assert (=> bm!72359 m!1445231))

(assert (=> b!1571203 d!164499))

(declare-fun d!164505 () Bool)

(assert (=> d!164505 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

