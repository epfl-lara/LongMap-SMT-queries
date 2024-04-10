; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122336 () Bool)

(assert start!122336)

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun e!802583 () Bool)

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96839 0))(
  ( (array!96840 (arr!46743 (Array (_ BitVec 32) (_ BitVec 64))) (size!47293 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96839)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun b!1418188 () Bool)

(assert (=> b!1418188 (= e!802583 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47293 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47293 a!2831)) (bvsge mask!2608 #b00000000000000000000000000000000) (bvsgt mask!2608 #b00111111111111111111111111111111)))))

(declare-fun res!953865 () Bool)

(assert (=> start!122336 (=> (not res!953865) (not e!802583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122336 (= res!953865 (validMask!0 mask!2608))))

(assert (=> start!122336 e!802583))

(assert (=> start!122336 true))

(declare-fun array_inv!35771 (array!96839) Bool)

(assert (=> start!122336 (array_inv!35771 a!2831)))

(declare-fun b!1418189 () Bool)

(declare-fun res!953864 () Bool)

(assert (=> b!1418189 (=> (not res!953864) (not e!802583))))

(declare-datatypes ((List!33253 0))(
  ( (Nil!33250) (Cons!33249 (h!34542 (_ BitVec 64)) (t!47947 List!33253)) )
))
(declare-fun arrayNoDuplicates!0 (array!96839 (_ BitVec 32) List!33253) Bool)

(assert (=> b!1418189 (= res!953864 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33250))))

(declare-fun b!1418190 () Bool)

(declare-fun res!953869 () Bool)

(assert (=> b!1418190 (=> (not res!953869) (not e!802583))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418190 (= res!953869 (validKeyInArray!0 (select (arr!46743 a!2831) i!982)))))

(declare-fun b!1418191 () Bool)

(declare-fun res!953868 () Bool)

(assert (=> b!1418191 (=> (not res!953868) (not e!802583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96839 (_ BitVec 32)) Bool)

(assert (=> b!1418191 (= res!953868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418192 () Bool)

(declare-fun res!953866 () Bool)

(assert (=> b!1418192 (=> (not res!953866) (not e!802583))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418192 (= res!953866 (and (= (size!47293 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47293 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47293 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418193 () Bool)

(declare-fun res!953867 () Bool)

(assert (=> b!1418193 (=> (not res!953867) (not e!802583))))

(assert (=> b!1418193 (= res!953867 (validKeyInArray!0 (select (arr!46743 a!2831) j!81)))))

(assert (= (and start!122336 res!953865) b!1418192))

(assert (= (and b!1418192 res!953866) b!1418190))

(assert (= (and b!1418190 res!953869) b!1418193))

(assert (= (and b!1418193 res!953867) b!1418191))

(assert (= (and b!1418191 res!953868) b!1418189))

(assert (= (and b!1418189 res!953864) b!1418188))

(declare-fun m!1308931 () Bool)

(assert (=> b!1418189 m!1308931))

(declare-fun m!1308933 () Bool)

(assert (=> b!1418193 m!1308933))

(assert (=> b!1418193 m!1308933))

(declare-fun m!1308935 () Bool)

(assert (=> b!1418193 m!1308935))

(declare-fun m!1308937 () Bool)

(assert (=> b!1418190 m!1308937))

(assert (=> b!1418190 m!1308937))

(declare-fun m!1308939 () Bool)

(assert (=> b!1418190 m!1308939))

(declare-fun m!1308941 () Bool)

(assert (=> start!122336 m!1308941))

(declare-fun m!1308943 () Bool)

(assert (=> start!122336 m!1308943))

(declare-fun m!1308945 () Bool)

(assert (=> b!1418191 m!1308945))

(check-sat (not b!1418190) (not b!1418189) (not b!1418191) (not b!1418193) (not start!122336))
(check-sat)
(get-model)

(declare-fun d!152835 () Bool)

(assert (=> d!152835 (= (validKeyInArray!0 (select (arr!46743 a!2831) j!81)) (and (not (= (select (arr!46743 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46743 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418193 d!152835))

(declare-fun b!1418222 () Bool)

(declare-fun e!802601 () Bool)

(declare-fun call!67252 () Bool)

(assert (=> b!1418222 (= e!802601 call!67252)))

(declare-fun b!1418223 () Bool)

(assert (=> b!1418223 (= e!802601 call!67252)))

(declare-fun bm!67249 () Bool)

(declare-fun c!131646 () Bool)

(assert (=> bm!67249 (= call!67252 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131646 (Cons!33249 (select (arr!46743 a!2831) #b00000000000000000000000000000000) Nil!33250) Nil!33250)))))

(declare-fun b!1418224 () Bool)

(declare-fun e!802599 () Bool)

(declare-fun contains!9837 (List!33253 (_ BitVec 64)) Bool)

(assert (=> b!1418224 (= e!802599 (contains!9837 Nil!33250 (select (arr!46743 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152837 () Bool)

(declare-fun res!953894 () Bool)

(declare-fun e!802598 () Bool)

(assert (=> d!152837 (=> res!953894 e!802598)))

(assert (=> d!152837 (= res!953894 (bvsge #b00000000000000000000000000000000 (size!47293 a!2831)))))

(assert (=> d!152837 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33250) e!802598)))

(declare-fun b!1418225 () Bool)

(declare-fun e!802600 () Bool)

(assert (=> b!1418225 (= e!802598 e!802600)))

(declare-fun res!953896 () Bool)

(assert (=> b!1418225 (=> (not res!953896) (not e!802600))))

(assert (=> b!1418225 (= res!953896 (not e!802599))))

(declare-fun res!953895 () Bool)

(assert (=> b!1418225 (=> (not res!953895) (not e!802599))))

(assert (=> b!1418225 (= res!953895 (validKeyInArray!0 (select (arr!46743 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418226 () Bool)

(assert (=> b!1418226 (= e!802600 e!802601)))

(assert (=> b!1418226 (= c!131646 (validKeyInArray!0 (select (arr!46743 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!152837 (not res!953894)) b!1418225))

(assert (= (and b!1418225 res!953895) b!1418224))

(assert (= (and b!1418225 res!953896) b!1418226))

(assert (= (and b!1418226 c!131646) b!1418223))

(assert (= (and b!1418226 (not c!131646)) b!1418222))

(assert (= (or b!1418223 b!1418222) bm!67249))

(declare-fun m!1308963 () Bool)

(assert (=> bm!67249 m!1308963))

(declare-fun m!1308965 () Bool)

(assert (=> bm!67249 m!1308965))

(assert (=> b!1418224 m!1308963))

(assert (=> b!1418224 m!1308963))

(declare-fun m!1308967 () Bool)

(assert (=> b!1418224 m!1308967))

(assert (=> b!1418225 m!1308963))

(assert (=> b!1418225 m!1308963))

(declare-fun m!1308969 () Bool)

(assert (=> b!1418225 m!1308969))

(assert (=> b!1418226 m!1308963))

(assert (=> b!1418226 m!1308963))

(assert (=> b!1418226 m!1308969))

(assert (=> b!1418189 d!152837))

(declare-fun d!152839 () Bool)

(assert (=> d!152839 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122336 d!152839))

(declare-fun d!152847 () Bool)

(assert (=> d!152847 (= (array_inv!35771 a!2831) (bvsge (size!47293 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122336 d!152847))

(declare-fun d!152849 () Bool)

(assert (=> d!152849 (= (validKeyInArray!0 (select (arr!46743 a!2831) i!982)) (and (not (= (select (arr!46743 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46743 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418190 d!152849))

(declare-fun b!1418243 () Bool)

(declare-fun e!802616 () Bool)

(declare-fun call!67257 () Bool)

(assert (=> b!1418243 (= e!802616 call!67257)))

(declare-fun b!1418244 () Bool)

(declare-fun e!802614 () Bool)

(assert (=> b!1418244 (= e!802616 e!802614)))

(declare-fun lt!625548 () (_ BitVec 64))

(assert (=> b!1418244 (= lt!625548 (select (arr!46743 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48060 0))(
  ( (Unit!48061) )
))
(declare-fun lt!625547 () Unit!48060)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96839 (_ BitVec 64) (_ BitVec 32)) Unit!48060)

(assert (=> b!1418244 (= lt!625547 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625548 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418244 (arrayContainsKey!0 a!2831 lt!625548 #b00000000000000000000000000000000)))

(declare-fun lt!625546 () Unit!48060)

(assert (=> b!1418244 (= lt!625546 lt!625547)))

(declare-fun res!953905 () Bool)

(declare-datatypes ((SeekEntryResult!11043 0))(
  ( (MissingZero!11043 (index!46564 (_ BitVec 32))) (Found!11043 (index!46565 (_ BitVec 32))) (Intermediate!11043 (undefined!11855 Bool) (index!46566 (_ BitVec 32)) (x!128190 (_ BitVec 32))) (Undefined!11043) (MissingVacant!11043 (index!46567 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96839 (_ BitVec 32)) SeekEntryResult!11043)

(assert (=> b!1418244 (= res!953905 (= (seekEntryOrOpen!0 (select (arr!46743 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11043 #b00000000000000000000000000000000)))))

(assert (=> b!1418244 (=> (not res!953905) (not e!802614))))

(declare-fun b!1418245 () Bool)

(declare-fun e!802615 () Bool)

(assert (=> b!1418245 (= e!802615 e!802616)))

(declare-fun c!131651 () Bool)

(assert (=> b!1418245 (= c!131651 (validKeyInArray!0 (select (arr!46743 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152851 () Bool)

(declare-fun res!953906 () Bool)

(assert (=> d!152851 (=> res!953906 e!802615)))

(assert (=> d!152851 (= res!953906 (bvsge #b00000000000000000000000000000000 (size!47293 a!2831)))))

(assert (=> d!152851 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802615)))

(declare-fun b!1418246 () Bool)

(assert (=> b!1418246 (= e!802614 call!67257)))

(declare-fun bm!67252 () Bool)

(assert (=> bm!67252 (= call!67257 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!152851 (not res!953906)) b!1418245))

(assert (= (and b!1418245 c!131651) b!1418244))

(assert (= (and b!1418245 (not c!131651)) b!1418243))

(assert (= (and b!1418244 res!953905) b!1418246))

(assert (= (or b!1418246 b!1418243) bm!67252))

(assert (=> b!1418244 m!1308963))

(declare-fun m!1308971 () Bool)

(assert (=> b!1418244 m!1308971))

(declare-fun m!1308973 () Bool)

(assert (=> b!1418244 m!1308973))

(assert (=> b!1418244 m!1308963))

(declare-fun m!1308975 () Bool)

(assert (=> b!1418244 m!1308975))

(assert (=> b!1418245 m!1308963))

(assert (=> b!1418245 m!1308963))

(assert (=> b!1418245 m!1308969))

(declare-fun m!1308977 () Bool)

(assert (=> bm!67252 m!1308977))

(assert (=> b!1418191 d!152851))

(check-sat (not bm!67252) (not b!1418224) (not b!1418245) (not b!1418226) (not b!1418225) (not b!1418244) (not bm!67249))
(check-sat)
