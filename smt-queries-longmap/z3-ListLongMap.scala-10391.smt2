; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122390 () Bool)

(assert start!122390)

(declare-fun b!1418517 () Bool)

(declare-fun e!802717 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!625593 () (_ BitVec 32))

(assert (=> b!1418517 (= e!802717 (and (bvsge mask!2608 #b00000000000000000000000000000000) (or (bvslt lt!625593 #b00000000000000000000000000000000) (bvsge lt!625593 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96866 0))(
  ( (array!96867 (arr!46755 (Array (_ BitVec 32) (_ BitVec 64))) (size!47305 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96866)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418517 (= lt!625593 (toIndex!0 (select (arr!46755 a!2831) j!81) mask!2608))))

(declare-fun b!1418518 () Bool)

(declare-fun res!954160 () Bool)

(assert (=> b!1418518 (=> (not res!954160) (not e!802717))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418518 (= res!954160 (and (= (size!47305 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47305 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47305 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418519 () Bool)

(declare-fun res!954157 () Bool)

(assert (=> b!1418519 (=> (not res!954157) (not e!802717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418519 (= res!954157 (validKeyInArray!0 (select (arr!46755 a!2831) j!81)))))

(declare-fun res!954163 () Bool)

(assert (=> start!122390 (=> (not res!954163) (not e!802717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122390 (= res!954163 (validMask!0 mask!2608))))

(assert (=> start!122390 e!802717))

(assert (=> start!122390 true))

(declare-fun array_inv!35783 (array!96866) Bool)

(assert (=> start!122390 (array_inv!35783 a!2831)))

(declare-fun b!1418520 () Bool)

(declare-fun res!954161 () Bool)

(assert (=> b!1418520 (=> (not res!954161) (not e!802717))))

(declare-datatypes ((List!33265 0))(
  ( (Nil!33262) (Cons!33261 (h!34554 (_ BitVec 64)) (t!47959 List!33265)) )
))
(declare-fun arrayNoDuplicates!0 (array!96866 (_ BitVec 32) List!33265) Bool)

(assert (=> b!1418520 (= res!954161 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33262))))

(declare-fun b!1418521 () Bool)

(declare-fun res!954162 () Bool)

(assert (=> b!1418521 (=> (not res!954162) (not e!802717))))

(assert (=> b!1418521 (= res!954162 (validKeyInArray!0 (select (arr!46755 a!2831) i!982)))))

(declare-fun b!1418522 () Bool)

(declare-fun res!954158 () Bool)

(assert (=> b!1418522 (=> (not res!954158) (not e!802717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96866 (_ BitVec 32)) Bool)

(assert (=> b!1418522 (= res!954158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418523 () Bool)

(declare-fun res!954159 () Bool)

(assert (=> b!1418523 (=> (not res!954159) (not e!802717))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1418523 (= res!954159 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47305 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47305 a!2831))))))

(assert (= (and start!122390 res!954163) b!1418518))

(assert (= (and b!1418518 res!954160) b!1418521))

(assert (= (and b!1418521 res!954162) b!1418519))

(assert (= (and b!1418519 res!954157) b!1418522))

(assert (= (and b!1418522 res!954158) b!1418520))

(assert (= (and b!1418520 res!954161) b!1418523))

(assert (= (and b!1418523 res!954159) b!1418517))

(declare-fun m!1309191 () Bool)

(assert (=> start!122390 m!1309191))

(declare-fun m!1309193 () Bool)

(assert (=> start!122390 m!1309193))

(declare-fun m!1309195 () Bool)

(assert (=> b!1418519 m!1309195))

(assert (=> b!1418519 m!1309195))

(declare-fun m!1309197 () Bool)

(assert (=> b!1418519 m!1309197))

(declare-fun m!1309199 () Bool)

(assert (=> b!1418520 m!1309199))

(assert (=> b!1418517 m!1309195))

(assert (=> b!1418517 m!1309195))

(declare-fun m!1309201 () Bool)

(assert (=> b!1418517 m!1309201))

(declare-fun m!1309203 () Bool)

(assert (=> b!1418521 m!1309203))

(assert (=> b!1418521 m!1309203))

(declare-fun m!1309205 () Bool)

(assert (=> b!1418521 m!1309205))

(declare-fun m!1309207 () Bool)

(assert (=> b!1418522 m!1309207))

(check-sat (not b!1418520) (not start!122390) (not b!1418521) (not b!1418522) (not b!1418517) (not b!1418519))
(check-sat)
(get-model)

(declare-fun d!152879 () Bool)

(assert (=> d!152879 (= (validKeyInArray!0 (select (arr!46755 a!2831) j!81)) (and (not (= (select (arr!46755 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46755 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418519 d!152879))

(declare-fun b!1418555 () Bool)

(declare-fun e!802735 () Bool)

(declare-fun contains!9838 (List!33265 (_ BitVec 64)) Bool)

(assert (=> b!1418555 (= e!802735 (contains!9838 Nil!33262 (select (arr!46755 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418556 () Bool)

(declare-fun e!802734 () Bool)

(declare-fun call!67270 () Bool)

(assert (=> b!1418556 (= e!802734 call!67270)))

(declare-fun bm!67267 () Bool)

(declare-fun c!131664 () Bool)

(assert (=> bm!67267 (= call!67270 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131664 (Cons!33261 (select (arr!46755 a!2831) #b00000000000000000000000000000000) Nil!33262) Nil!33262)))))

(declare-fun b!1418557 () Bool)

(declare-fun e!802736 () Bool)

(assert (=> b!1418557 (= e!802736 e!802734)))

(assert (=> b!1418557 (= c!131664 (validKeyInArray!0 (select (arr!46755 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418558 () Bool)

(assert (=> b!1418558 (= e!802734 call!67270)))

(declare-fun d!152881 () Bool)

(declare-fun res!954193 () Bool)

(declare-fun e!802733 () Bool)

(assert (=> d!152881 (=> res!954193 e!802733)))

(assert (=> d!152881 (= res!954193 (bvsge #b00000000000000000000000000000000 (size!47305 a!2831)))))

(assert (=> d!152881 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33262) e!802733)))

(declare-fun b!1418559 () Bool)

(assert (=> b!1418559 (= e!802733 e!802736)))

(declare-fun res!954191 () Bool)

(assert (=> b!1418559 (=> (not res!954191) (not e!802736))))

(assert (=> b!1418559 (= res!954191 (not e!802735))))

(declare-fun res!954192 () Bool)

(assert (=> b!1418559 (=> (not res!954192) (not e!802735))))

(assert (=> b!1418559 (= res!954192 (validKeyInArray!0 (select (arr!46755 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!152881 (not res!954193)) b!1418559))

(assert (= (and b!1418559 res!954192) b!1418555))

(assert (= (and b!1418559 res!954191) b!1418557))

(assert (= (and b!1418557 c!131664) b!1418556))

(assert (= (and b!1418557 (not c!131664)) b!1418558))

(assert (= (or b!1418556 b!1418558) bm!67267))

(declare-fun m!1309227 () Bool)

(assert (=> b!1418555 m!1309227))

(assert (=> b!1418555 m!1309227))

(declare-fun m!1309229 () Bool)

(assert (=> b!1418555 m!1309229))

(assert (=> bm!67267 m!1309227))

(declare-fun m!1309231 () Bool)

(assert (=> bm!67267 m!1309231))

(assert (=> b!1418557 m!1309227))

(assert (=> b!1418557 m!1309227))

(declare-fun m!1309233 () Bool)

(assert (=> b!1418557 m!1309233))

(assert (=> b!1418559 m!1309227))

(assert (=> b!1418559 m!1309227))

(assert (=> b!1418559 m!1309233))

(assert (=> b!1418520 d!152881))

(declare-fun d!152883 () Bool)

(assert (=> d!152883 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122390 d!152883))

(declare-fun d!152889 () Bool)

(assert (=> d!152889 (= (array_inv!35783 a!2831) (bvsge (size!47305 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122390 d!152889))

(declare-fun d!152893 () Bool)

(assert (=> d!152893 (= (validKeyInArray!0 (select (arr!46755 a!2831) i!982)) (and (not (= (select (arr!46755 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46755 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418521 d!152893))

(declare-fun b!1418583 () Bool)

(declare-fun e!802757 () Bool)

(declare-fun call!67276 () Bool)

(assert (=> b!1418583 (= e!802757 call!67276)))

(declare-fun d!152895 () Bool)

(declare-fun res!954207 () Bool)

(declare-fun e!802755 () Bool)

(assert (=> d!152895 (=> res!954207 e!802755)))

(assert (=> d!152895 (= res!954207 (bvsge #b00000000000000000000000000000000 (size!47305 a!2831)))))

(assert (=> d!152895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802755)))

(declare-fun bm!67273 () Bool)

(assert (=> bm!67273 (= call!67276 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418584 () Bool)

(declare-fun e!802756 () Bool)

(assert (=> b!1418584 (= e!802755 e!802756)))

(declare-fun c!131670 () Bool)

(assert (=> b!1418584 (= c!131670 (validKeyInArray!0 (select (arr!46755 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418585 () Bool)

(assert (=> b!1418585 (= e!802756 call!67276)))

(declare-fun b!1418586 () Bool)

(assert (=> b!1418586 (= e!802756 e!802757)))

(declare-fun lt!625603 () (_ BitVec 64))

(assert (=> b!1418586 (= lt!625603 (select (arr!46755 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48064 0))(
  ( (Unit!48065) )
))
(declare-fun lt!625604 () Unit!48064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96866 (_ BitVec 64) (_ BitVec 32)) Unit!48064)

(assert (=> b!1418586 (= lt!625604 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625603 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418586 (arrayContainsKey!0 a!2831 lt!625603 #b00000000000000000000000000000000)))

(declare-fun lt!625605 () Unit!48064)

(assert (=> b!1418586 (= lt!625605 lt!625604)))

(declare-fun res!954208 () Bool)

(declare-datatypes ((SeekEntryResult!11045 0))(
  ( (MissingZero!11045 (index!46572 (_ BitVec 32))) (Found!11045 (index!46573 (_ BitVec 32))) (Intermediate!11045 (undefined!11857 Bool) (index!46574 (_ BitVec 32)) (x!128227 (_ BitVec 32))) (Undefined!11045) (MissingVacant!11045 (index!46575 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96866 (_ BitVec 32)) SeekEntryResult!11045)

(assert (=> b!1418586 (= res!954208 (= (seekEntryOrOpen!0 (select (arr!46755 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11045 #b00000000000000000000000000000000)))))

(assert (=> b!1418586 (=> (not res!954208) (not e!802757))))

(assert (= (and d!152895 (not res!954207)) b!1418584))

(assert (= (and b!1418584 c!131670) b!1418586))

(assert (= (and b!1418584 (not c!131670)) b!1418585))

(assert (= (and b!1418586 res!954208) b!1418583))

(assert (= (or b!1418583 b!1418585) bm!67273))

(declare-fun m!1309243 () Bool)

(assert (=> bm!67273 m!1309243))

(assert (=> b!1418584 m!1309227))

(assert (=> b!1418584 m!1309227))

(assert (=> b!1418584 m!1309233))

(assert (=> b!1418586 m!1309227))

(declare-fun m!1309245 () Bool)

(assert (=> b!1418586 m!1309245))

(declare-fun m!1309247 () Bool)

(assert (=> b!1418586 m!1309247))

(assert (=> b!1418586 m!1309227))

(declare-fun m!1309249 () Bool)

(assert (=> b!1418586 m!1309249))

(assert (=> b!1418522 d!152895))

(declare-fun d!152899 () Bool)

(declare-fun lt!625611 () (_ BitVec 32))

(declare-fun lt!625610 () (_ BitVec 32))

(assert (=> d!152899 (= lt!625611 (bvmul (bvxor lt!625610 (bvlshr lt!625610 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152899 (= lt!625610 ((_ extract 31 0) (bvand (bvxor (select (arr!46755 a!2831) j!81) (bvlshr (select (arr!46755 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152899 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954209 (let ((h!34556 ((_ extract 31 0) (bvand (bvxor (select (arr!46755 a!2831) j!81) (bvlshr (select (arr!46755 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128224 (bvmul (bvxor h!34556 (bvlshr h!34556 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128224 (bvlshr x!128224 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954209 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954209 #b00000000000000000000000000000000))))))

(assert (=> d!152899 (= (toIndex!0 (select (arr!46755 a!2831) j!81) mask!2608) (bvand (bvxor lt!625611 (bvlshr lt!625611 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1418517 d!152899))

(check-sat (not b!1418586) (not b!1418584) (not b!1418555) (not bm!67273) (not bm!67267) (not b!1418557) (not b!1418559))
(check-sat)
