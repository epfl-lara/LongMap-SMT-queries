; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122330 () Bool)

(assert start!122330)

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96786 0))(
  ( (array!96787 (arr!46717 (Array (_ BitVec 32) (_ BitVec 64))) (size!47269 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96786)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun b!1418089 () Bool)

(declare-fun e!802538 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1418089 (= e!802538 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47269 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47269 a!2831)) (bvsge mask!2608 #b00000000000000000000000000000000) (bvsgt mask!2608 #b00111111111111111111111111111111)))))

(declare-fun b!1418090 () Bool)

(declare-fun res!953820 () Bool)

(assert (=> b!1418090 (=> (not res!953820) (not e!802538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96786 (_ BitVec 32)) Bool)

(assert (=> b!1418090 (= res!953820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418091 () Bool)

(declare-fun res!953818 () Bool)

(assert (=> b!1418091 (=> (not res!953818) (not e!802538))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418091 (= res!953818 (validKeyInArray!0 (select (arr!46717 a!2831) j!81)))))

(declare-fun b!1418092 () Bool)

(declare-fun res!953819 () Bool)

(assert (=> b!1418092 (=> (not res!953819) (not e!802538))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418092 (= res!953819 (validKeyInArray!0 (select (arr!46717 a!2831) i!982)))))

(declare-fun res!953817 () Bool)

(assert (=> start!122330 (=> (not res!953817) (not e!802538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122330 (= res!953817 (validMask!0 mask!2608))))

(assert (=> start!122330 e!802538))

(assert (=> start!122330 true))

(declare-fun array_inv!35950 (array!96786) Bool)

(assert (=> start!122330 (array_inv!35950 a!2831)))

(declare-fun b!1418093 () Bool)

(declare-fun res!953816 () Bool)

(assert (=> b!1418093 (=> (not res!953816) (not e!802538))))

(declare-datatypes ((List!33305 0))(
  ( (Nil!33302) (Cons!33301 (h!34594 (_ BitVec 64)) (t!47991 List!33305)) )
))
(declare-fun arrayNoDuplicates!0 (array!96786 (_ BitVec 32) List!33305) Bool)

(assert (=> b!1418093 (= res!953816 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33302))))

(declare-fun b!1418094 () Bool)

(declare-fun res!953821 () Bool)

(assert (=> b!1418094 (=> (not res!953821) (not e!802538))))

(assert (=> b!1418094 (= res!953821 (and (= (size!47269 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47269 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47269 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122330 res!953817) b!1418094))

(assert (= (and b!1418094 res!953821) b!1418092))

(assert (= (and b!1418092 res!953819) b!1418091))

(assert (= (and b!1418091 res!953818) b!1418090))

(assert (= (and b!1418090 res!953820) b!1418093))

(assert (= (and b!1418093 res!953816) b!1418089))

(declare-fun m!1308379 () Bool)

(assert (=> b!1418092 m!1308379))

(assert (=> b!1418092 m!1308379))

(declare-fun m!1308381 () Bool)

(assert (=> b!1418092 m!1308381))

(declare-fun m!1308383 () Bool)

(assert (=> b!1418091 m!1308383))

(assert (=> b!1418091 m!1308383))

(declare-fun m!1308385 () Bool)

(assert (=> b!1418091 m!1308385))

(declare-fun m!1308387 () Bool)

(assert (=> b!1418093 m!1308387))

(declare-fun m!1308389 () Bool)

(assert (=> b!1418090 m!1308389))

(declare-fun m!1308391 () Bool)

(assert (=> start!122330 m!1308391))

(declare-fun m!1308393 () Bool)

(assert (=> start!122330 m!1308393))

(check-sat (not b!1418093) (not b!1418091) (not b!1418090) (not b!1418092) (not start!122330))
(check-sat)
(get-model)

(declare-fun d!152709 () Bool)

(declare-fun res!953862 () Bool)

(declare-fun e!802557 () Bool)

(assert (=> d!152709 (=> res!953862 e!802557)))

(assert (=> d!152709 (= res!953862 (bvsge #b00000000000000000000000000000000 (size!47269 a!2831)))))

(assert (=> d!152709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802557)))

(declare-fun b!1418139 () Bool)

(declare-fun e!802558 () Bool)

(assert (=> b!1418139 (= e!802557 e!802558)))

(declare-fun c!131623 () Bool)

(assert (=> b!1418139 (= c!131623 (validKeyInArray!0 (select (arr!46717 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67229 () Bool)

(declare-fun call!67232 () Bool)

(assert (=> bm!67229 (= call!67232 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418140 () Bool)

(assert (=> b!1418140 (= e!802558 call!67232)))

(declare-fun b!1418141 () Bool)

(declare-fun e!802559 () Bool)

(assert (=> b!1418141 (= e!802559 call!67232)))

(declare-fun b!1418142 () Bool)

(assert (=> b!1418142 (= e!802558 e!802559)))

(declare-fun lt!625352 () (_ BitVec 64))

(assert (=> b!1418142 (= lt!625352 (select (arr!46717 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!47907 0))(
  ( (Unit!47908) )
))
(declare-fun lt!625351 () Unit!47907)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96786 (_ BitVec 64) (_ BitVec 32)) Unit!47907)

(assert (=> b!1418142 (= lt!625351 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625352 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418142 (arrayContainsKey!0 a!2831 lt!625352 #b00000000000000000000000000000000)))

(declare-fun lt!625350 () Unit!47907)

(assert (=> b!1418142 (= lt!625350 lt!625351)))

(declare-fun res!953863 () Bool)

(declare-datatypes ((SeekEntryResult!11045 0))(
  ( (MissingZero!11045 (index!46572 (_ BitVec 32))) (Found!11045 (index!46573 (_ BitVec 32))) (Intermediate!11045 (undefined!11857 Bool) (index!46574 (_ BitVec 32)) (x!128189 (_ BitVec 32))) (Undefined!11045) (MissingVacant!11045 (index!46575 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96786 (_ BitVec 32)) SeekEntryResult!11045)

(assert (=> b!1418142 (= res!953863 (= (seekEntryOrOpen!0 (select (arr!46717 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11045 #b00000000000000000000000000000000)))))

(assert (=> b!1418142 (=> (not res!953863) (not e!802559))))

(assert (= (and d!152709 (not res!953862)) b!1418139))

(assert (= (and b!1418139 c!131623) b!1418142))

(assert (= (and b!1418139 (not c!131623)) b!1418140))

(assert (= (and b!1418142 res!953863) b!1418141))

(assert (= (or b!1418141 b!1418140) bm!67229))

(declare-fun m!1308427 () Bool)

(assert (=> b!1418139 m!1308427))

(assert (=> b!1418139 m!1308427))

(declare-fun m!1308429 () Bool)

(assert (=> b!1418139 m!1308429))

(declare-fun m!1308431 () Bool)

(assert (=> bm!67229 m!1308431))

(assert (=> b!1418142 m!1308427))

(declare-fun m!1308433 () Bool)

(assert (=> b!1418142 m!1308433))

(declare-fun m!1308435 () Bool)

(assert (=> b!1418142 m!1308435))

(assert (=> b!1418142 m!1308427))

(declare-fun m!1308437 () Bool)

(assert (=> b!1418142 m!1308437))

(assert (=> b!1418090 d!152709))

(declare-fun d!152717 () Bool)

(assert (=> d!152717 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122330 d!152717))

(declare-fun d!152723 () Bool)

(assert (=> d!152723 (= (array_inv!35950 a!2831) (bvsge (size!47269 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122330 d!152723))

(declare-fun d!152725 () Bool)

(assert (=> d!152725 (= (validKeyInArray!0 (select (arr!46717 a!2831) j!81)) (and (not (= (select (arr!46717 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46717 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418091 d!152725))

(declare-fun b!1418165 () Bool)

(declare-fun e!802580 () Bool)

(declare-fun e!802577 () Bool)

(assert (=> b!1418165 (= e!802580 e!802577)))

(declare-fun res!953876 () Bool)

(assert (=> b!1418165 (=> (not res!953876) (not e!802577))))

(declare-fun e!802579 () Bool)

(assert (=> b!1418165 (= res!953876 (not e!802579))))

(declare-fun res!953878 () Bool)

(assert (=> b!1418165 (=> (not res!953878) (not e!802579))))

(assert (=> b!1418165 (= res!953878 (validKeyInArray!0 (select (arr!46717 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418166 () Bool)

(declare-fun e!802578 () Bool)

(declare-fun call!67238 () Bool)

(assert (=> b!1418166 (= e!802578 call!67238)))

(declare-fun d!152727 () Bool)

(declare-fun res!953877 () Bool)

(assert (=> d!152727 (=> res!953877 e!802580)))

(assert (=> d!152727 (= res!953877 (bvsge #b00000000000000000000000000000000 (size!47269 a!2831)))))

(assert (=> d!152727 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33302) e!802580)))

(declare-fun bm!67235 () Bool)

(declare-fun c!131629 () Bool)

(assert (=> bm!67235 (= call!67238 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131629 (Cons!33301 (select (arr!46717 a!2831) #b00000000000000000000000000000000) Nil!33302) Nil!33302)))))

(declare-fun b!1418167 () Bool)

(declare-fun contains!9800 (List!33305 (_ BitVec 64)) Bool)

(assert (=> b!1418167 (= e!802579 (contains!9800 Nil!33302 (select (arr!46717 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418168 () Bool)

(assert (=> b!1418168 (= e!802577 e!802578)))

(assert (=> b!1418168 (= c!131629 (validKeyInArray!0 (select (arr!46717 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418169 () Bool)

(assert (=> b!1418169 (= e!802578 call!67238)))

(assert (= (and d!152727 (not res!953877)) b!1418165))

(assert (= (and b!1418165 res!953878) b!1418167))

(assert (= (and b!1418165 res!953876) b!1418168))

(assert (= (and b!1418168 c!131629) b!1418169))

(assert (= (and b!1418168 (not c!131629)) b!1418166))

(assert (= (or b!1418169 b!1418166) bm!67235))

(assert (=> b!1418165 m!1308427))

(assert (=> b!1418165 m!1308427))

(assert (=> b!1418165 m!1308429))

(assert (=> bm!67235 m!1308427))

(declare-fun m!1308451 () Bool)

(assert (=> bm!67235 m!1308451))

(assert (=> b!1418167 m!1308427))

(assert (=> b!1418167 m!1308427))

(declare-fun m!1308453 () Bool)

(assert (=> b!1418167 m!1308453))

(assert (=> b!1418168 m!1308427))

(assert (=> b!1418168 m!1308427))

(assert (=> b!1418168 m!1308429))

(assert (=> b!1418093 d!152727))

(declare-fun d!152731 () Bool)

(assert (=> d!152731 (= (validKeyInArray!0 (select (arr!46717 a!2831) i!982)) (and (not (= (select (arr!46717 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46717 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418092 d!152731))

(check-sat (not bm!67229) (not b!1418165) (not b!1418142) (not b!1418168) (not b!1418167) (not b!1418139) (not bm!67235))
(check-sat)
