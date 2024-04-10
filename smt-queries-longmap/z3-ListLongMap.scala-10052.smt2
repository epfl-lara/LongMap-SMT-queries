; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118418 () Bool)

(assert start!118418)

(declare-fun b!1385183 () Bool)

(declare-fun res!926472 () Bool)

(declare-fun e!784846 () Bool)

(assert (=> b!1385183 (=> (not res!926472) (not e!784846))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94721 0))(
  ( (array!94722 (arr!45738 (Array (_ BitVec 32) (_ BitVec 64))) (size!46288 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94721)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385183 (= res!926472 (and (= (size!46288 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46288 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46288 a!2938))))))

(declare-fun b!1385184 () Bool)

(assert (=> b!1385184 (= e!784846 (or (= (select (arr!45738 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!45738 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!926471 () Bool)

(assert (=> start!118418 (=> (not res!926471) (not e!784846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118418 (= res!926471 (validMask!0 mask!2987))))

(assert (=> start!118418 e!784846))

(assert (=> start!118418 true))

(declare-fun array_inv!34766 (array!94721) Bool)

(assert (=> start!118418 (array_inv!34766 a!2938)))

(declare-fun b!1385185 () Bool)

(declare-fun res!926469 () Bool)

(assert (=> b!1385185 (=> (not res!926469) (not e!784846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94721 (_ BitVec 32)) Bool)

(assert (=> b!1385185 (= res!926469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385186 () Bool)

(declare-fun res!926473 () Bool)

(assert (=> b!1385186 (=> (not res!926473) (not e!784846))))

(declare-datatypes ((List!32266 0))(
  ( (Nil!32263) (Cons!32262 (h!33471 (_ BitVec 64)) (t!46960 List!32266)) )
))
(declare-fun arrayNoDuplicates!0 (array!94721 (_ BitVec 32) List!32266) Bool)

(assert (=> b!1385186 (= res!926473 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32263))))

(declare-fun b!1385187 () Bool)

(declare-fun res!926470 () Bool)

(assert (=> b!1385187 (=> (not res!926470) (not e!784846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385187 (= res!926470 (validKeyInArray!0 (select (arr!45738 a!2938) i!1065)))))

(assert (= (and start!118418 res!926471) b!1385183))

(assert (= (and b!1385183 res!926472) b!1385187))

(assert (= (and b!1385187 res!926470) b!1385186))

(assert (= (and b!1385186 res!926473) b!1385185))

(assert (= (and b!1385185 res!926469) b!1385184))

(declare-fun m!1270521 () Bool)

(assert (=> start!118418 m!1270521))

(declare-fun m!1270523 () Bool)

(assert (=> start!118418 m!1270523))

(declare-fun m!1270525 () Bool)

(assert (=> b!1385187 m!1270525))

(assert (=> b!1385187 m!1270525))

(declare-fun m!1270527 () Bool)

(assert (=> b!1385187 m!1270527))

(assert (=> b!1385184 m!1270525))

(declare-fun m!1270529 () Bool)

(assert (=> b!1385186 m!1270529))

(declare-fun m!1270531 () Bool)

(assert (=> b!1385185 m!1270531))

(check-sat (not start!118418) (not b!1385187) (not b!1385186) (not b!1385185))
(check-sat)
(get-model)

(declare-fun d!149357 () Bool)

(assert (=> d!149357 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118418 d!149357))

(declare-fun d!149367 () Bool)

(assert (=> d!149367 (= (array_inv!34766 a!2938) (bvsge (size!46288 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118418 d!149367))

(declare-fun d!149369 () Bool)

(assert (=> d!149369 (= (validKeyInArray!0 (select (arr!45738 a!2938) i!1065)) (and (not (= (select (arr!45738 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45738 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1385187 d!149369))

(declare-fun b!1385228 () Bool)

(declare-fun e!784876 () Bool)

(declare-fun e!784874 () Bool)

(assert (=> b!1385228 (= e!784876 e!784874)))

(declare-fun res!926506 () Bool)

(assert (=> b!1385228 (=> (not res!926506) (not e!784874))))

(declare-fun e!784875 () Bool)

(assert (=> b!1385228 (= res!926506 (not e!784875))))

(declare-fun res!926504 () Bool)

(assert (=> b!1385228 (=> (not res!926504) (not e!784875))))

(assert (=> b!1385228 (= res!926504 (validKeyInArray!0 (select (arr!45738 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1385229 () Bool)

(declare-fun e!784877 () Bool)

(declare-fun call!66541 () Bool)

(assert (=> b!1385229 (= e!784877 call!66541)))

(declare-fun d!149371 () Bool)

(declare-fun res!926505 () Bool)

(assert (=> d!149371 (=> res!926505 e!784876)))

(assert (=> d!149371 (= res!926505 (bvsge #b00000000000000000000000000000000 (size!46288 a!2938)))))

(assert (=> d!149371 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32263) e!784876)))

(declare-fun b!1385230 () Bool)

(assert (=> b!1385230 (= e!784874 e!784877)))

(declare-fun c!128802 () Bool)

(assert (=> b!1385230 (= c!128802 (validKeyInArray!0 (select (arr!45738 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1385231 () Bool)

(assert (=> b!1385231 (= e!784877 call!66541)))

(declare-fun bm!66538 () Bool)

(assert (=> bm!66538 (= call!66541 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128802 (Cons!32262 (select (arr!45738 a!2938) #b00000000000000000000000000000000) Nil!32263) Nil!32263)))))

(declare-fun b!1385232 () Bool)

(declare-fun contains!9742 (List!32266 (_ BitVec 64)) Bool)

(assert (=> b!1385232 (= e!784875 (contains!9742 Nil!32263 (select (arr!45738 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149371 (not res!926505)) b!1385228))

(assert (= (and b!1385228 res!926504) b!1385232))

(assert (= (and b!1385228 res!926506) b!1385230))

(assert (= (and b!1385230 c!128802) b!1385229))

(assert (= (and b!1385230 (not c!128802)) b!1385231))

(assert (= (or b!1385229 b!1385231) bm!66538))

(declare-fun m!1270553 () Bool)

(assert (=> b!1385228 m!1270553))

(assert (=> b!1385228 m!1270553))

(declare-fun m!1270555 () Bool)

(assert (=> b!1385228 m!1270555))

(assert (=> b!1385230 m!1270553))

(assert (=> b!1385230 m!1270553))

(assert (=> b!1385230 m!1270555))

(assert (=> bm!66538 m!1270553))

(declare-fun m!1270557 () Bool)

(assert (=> bm!66538 m!1270557))

(assert (=> b!1385232 m!1270553))

(assert (=> b!1385232 m!1270553))

(declare-fun m!1270559 () Bool)

(assert (=> b!1385232 m!1270559))

(assert (=> b!1385186 d!149371))

(declare-fun d!149377 () Bool)

(declare-fun res!926527 () Bool)

(declare-fun e!784905 () Bool)

(assert (=> d!149377 (=> res!926527 e!784905)))

(assert (=> d!149377 (= res!926527 (bvsge #b00000000000000000000000000000000 (size!46288 a!2938)))))

(assert (=> d!149377 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!784905)))

(declare-fun b!1385268 () Bool)

(declare-fun e!784907 () Bool)

(assert (=> b!1385268 (= e!784905 e!784907)))

(declare-fun c!128811 () Bool)

(assert (=> b!1385268 (= c!128811 (validKeyInArray!0 (select (arr!45738 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1385269 () Bool)

(declare-fun call!66550 () Bool)

(assert (=> b!1385269 (= e!784907 call!66550)))

(declare-fun bm!66547 () Bool)

(assert (=> bm!66547 (= call!66550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1385270 () Bool)

(declare-fun e!784906 () Bool)

(assert (=> b!1385270 (= e!784907 e!784906)))

(declare-fun lt!609207 () (_ BitVec 64))

(assert (=> b!1385270 (= lt!609207 (select (arr!45738 a!2938) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46248 0))(
  ( (Unit!46249) )
))
(declare-fun lt!609206 () Unit!46248)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94721 (_ BitVec 64) (_ BitVec 32)) Unit!46248)

(assert (=> b!1385270 (= lt!609206 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609207 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1385270 (arrayContainsKey!0 a!2938 lt!609207 #b00000000000000000000000000000000)))

(declare-fun lt!609205 () Unit!46248)

(assert (=> b!1385270 (= lt!609205 lt!609206)))

(declare-fun res!926526 () Bool)

(declare-datatypes ((SeekEntryResult!10130 0))(
  ( (MissingZero!10130 (index!42891 (_ BitVec 32))) (Found!10130 (index!42892 (_ BitVec 32))) (Intermediate!10130 (undefined!10942 Bool) (index!42893 (_ BitVec 32)) (x!124387 (_ BitVec 32))) (Undefined!10130) (MissingVacant!10130 (index!42894 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94721 (_ BitVec 32)) SeekEntryResult!10130)

(assert (=> b!1385270 (= res!926526 (= (seekEntryOrOpen!0 (select (arr!45738 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10130 #b00000000000000000000000000000000)))))

(assert (=> b!1385270 (=> (not res!926526) (not e!784906))))

(declare-fun b!1385271 () Bool)

(assert (=> b!1385271 (= e!784906 call!66550)))

(assert (= (and d!149377 (not res!926527)) b!1385268))

(assert (= (and b!1385268 c!128811) b!1385270))

(assert (= (and b!1385268 (not c!128811)) b!1385269))

(assert (= (and b!1385270 res!926526) b!1385271))

(assert (= (or b!1385271 b!1385269) bm!66547))

(assert (=> b!1385268 m!1270553))

(assert (=> b!1385268 m!1270553))

(assert (=> b!1385268 m!1270555))

(declare-fun m!1270577 () Bool)

(assert (=> bm!66547 m!1270577))

(assert (=> b!1385270 m!1270553))

(declare-fun m!1270579 () Bool)

(assert (=> b!1385270 m!1270579))

(declare-fun m!1270581 () Bool)

(assert (=> b!1385270 m!1270581))

(assert (=> b!1385270 m!1270553))

(declare-fun m!1270583 () Bool)

(assert (=> b!1385270 m!1270583))

(assert (=> b!1385185 d!149377))

(check-sat (not b!1385228) (not b!1385230) (not b!1385270) (not b!1385232) (not bm!66538) (not bm!66547) (not b!1385268))
(check-sat)
