; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117988 () Bool)

(assert start!117988)

(declare-fun b!1382084 () Bool)

(declare-fun res!923712 () Bool)

(declare-fun e!783377 () Bool)

(assert (=> b!1382084 (=> (not res!923712) (not e!783377))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94379 0))(
  ( (array!94380 (arr!45572 (Array (_ BitVec 32) (_ BitVec 64))) (size!46122 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94379)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382084 (= res!923712 (and (= (size!46122 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46122 a!2971))))))

(declare-fun b!1382085 () Bool)

(assert (=> b!1382085 (= e!783377 (or (= (select (arr!45572 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!45572 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!923713 () Bool)

(assert (=> start!117988 (=> (not res!923713) (not e!783377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117988 (= res!923713 (validMask!0 mask!3034))))

(assert (=> start!117988 e!783377))

(assert (=> start!117988 true))

(declare-fun array_inv!34600 (array!94379) Bool)

(assert (=> start!117988 (array_inv!34600 a!2971)))

(declare-fun b!1382086 () Bool)

(declare-fun res!923716 () Bool)

(assert (=> b!1382086 (=> (not res!923716) (not e!783377))))

(declare-datatypes ((List!32106 0))(
  ( (Nil!32103) (Cons!32102 (h!33311 (_ BitVec 64)) (t!46800 List!32106)) )
))
(declare-fun arrayNoDuplicates!0 (array!94379 (_ BitVec 32) List!32106) Bool)

(assert (=> b!1382086 (= res!923716 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32103))))

(declare-fun b!1382087 () Bool)

(declare-fun res!923714 () Bool)

(assert (=> b!1382087 (=> (not res!923714) (not e!783377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382087 (= res!923714 (validKeyInArray!0 (select (arr!45572 a!2971) i!1094)))))

(declare-fun b!1382088 () Bool)

(declare-fun res!923715 () Bool)

(assert (=> b!1382088 (=> (not res!923715) (not e!783377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94379 (_ BitVec 32)) Bool)

(assert (=> b!1382088 (= res!923715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!117988 res!923713) b!1382084))

(assert (= (and b!1382084 res!923712) b!1382087))

(assert (= (and b!1382087 res!923714) b!1382086))

(assert (= (and b!1382086 res!923716) b!1382088))

(assert (= (and b!1382088 res!923715) b!1382085))

(declare-fun m!1267263 () Bool)

(assert (=> b!1382087 m!1267263))

(assert (=> b!1382087 m!1267263))

(declare-fun m!1267265 () Bool)

(assert (=> b!1382087 m!1267265))

(assert (=> b!1382085 m!1267263))

(declare-fun m!1267267 () Bool)

(assert (=> start!117988 m!1267267))

(declare-fun m!1267269 () Bool)

(assert (=> start!117988 m!1267269))

(declare-fun m!1267271 () Bool)

(assert (=> b!1382086 m!1267271))

(declare-fun m!1267273 () Bool)

(assert (=> b!1382088 m!1267273))

(push 1)

(assert (not b!1382088))

(assert (not start!117988))

(assert (not b!1382087))

(assert (not b!1382086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1382142 () Bool)

(declare-fun e!783409 () Bool)

(declare-fun e!783410 () Bool)

(assert (=> b!1382142 (= e!783409 e!783410)))

(declare-fun c!128631 () Bool)

(assert (=> b!1382142 (= c!128631 (validKeyInArray!0 (select (arr!45572 a!2971) #b00000000000000000000000000000000)))))

(declare-fun d!149145 () Bool)

(declare-fun res!923760 () Bool)

(assert (=> d!149145 (=> res!923760 e!783409)))

(assert (=> d!149145 (= res!923760 (bvsge #b00000000000000000000000000000000 (size!46122 a!2971)))))

(assert (=> d!149145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034) e!783409)))

(declare-fun b!1382143 () Bool)

(declare-fun e!783408 () Bool)

(assert (=> b!1382143 (= e!783410 e!783408)))

(declare-fun lt!608348 () (_ BitVec 64))

(assert (=> b!1382143 (= lt!608348 (select (arr!45572 a!2971) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46047 0))(
  ( (Unit!46048) )
))
(declare-fun lt!608349 () Unit!46047)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94379 (_ BitVec 64) (_ BitVec 32)) Unit!46047)

(assert (=> b!1382143 (= lt!608349 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2971 lt!608348 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1382143 (arrayContainsKey!0 a!2971 lt!608348 #b00000000000000000000000000000000)))

(declare-fun lt!608347 () Unit!46047)

(assert (=> b!1382143 (= lt!608347 lt!608349)))

(declare-fun res!923761 () Bool)

(declare-datatypes ((SeekEntryResult!10061 0))(
  ( (MissingZero!10061 (index!42615 (_ BitVec 32))) (Found!10061 (index!42616 (_ BitVec 32))) (Intermediate!10061 (undefined!10873 Bool) (index!42617 (_ BitVec 32)) (x!123878 (_ BitVec 32))) (Undefined!10061) (MissingVacant!10061 (index!42618 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94379 (_ BitVec 32)) SeekEntryResult!10061)

(assert (=> b!1382143 (= res!923761 (= (seekEntryOrOpen!0 (select (arr!45572 a!2971) #b00000000000000000000000000000000) a!2971 mask!3034) (Found!10061 #b00000000000000000000000000000000)))))

(assert (=> b!1382143 (=> (not res!923761) (not e!783408))))

(declare-fun b!1382144 () Bool)

(declare-fun call!66523 () Bool)

(assert (=> b!1382144 (= e!783410 call!66523)))

(declare-fun bm!66520 () Bool)

(assert (=> bm!66520 (= call!66523 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2971 mask!3034))))

(declare-fun b!1382145 () Bool)

(assert (=> b!1382145 (= e!783408 call!66523)))

(assert (= (and d!149145 (not res!923760)) b!1382142))

(assert (= (and b!1382142 c!128631) b!1382143))

(assert (= (and b!1382142 (not c!128631)) b!1382144))

(assert (= (and b!1382143 res!923761) b!1382145))

(assert (= (or b!1382145 b!1382144) bm!66520))

(declare-fun m!1267307 () Bool)

(assert (=> b!1382142 m!1267307))

(assert (=> b!1382142 m!1267307))

(declare-fun m!1267309 () Bool)

(assert (=> b!1382142 m!1267309))

(assert (=> b!1382143 m!1267307))

(declare-fun m!1267311 () Bool)

(assert (=> b!1382143 m!1267311))

(declare-fun m!1267313 () Bool)

(assert (=> b!1382143 m!1267313))

(assert (=> b!1382143 m!1267307))

(declare-fun m!1267315 () Bool)

(assert (=> b!1382143 m!1267315))

(declare-fun m!1267317 () Bool)

(assert (=> bm!66520 m!1267317))

(assert (=> b!1382088 d!149145))

(declare-fun d!149153 () Bool)

(assert (=> d!149153 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!117988 d!149153))

(declare-fun d!149163 () Bool)

(assert (=> d!149163 (= (array_inv!34600 a!2971) (bvsge (size!46122 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!117988 d!149163))

(declare-fun d!149165 () Bool)

(assert (=> d!149165 (= (validKeyInArray!0 (select (arr!45572 a!2971) i!1094)) (and (not (= (select (arr!45572 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45572 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382087 d!149165))

(declare-fun b!1382195 () Bool)

(declare-fun e!783450 () Bool)

(declare-fun call!66535 () Bool)

(assert (=> b!1382195 (= e!783450 call!66535)))

(declare-fun b!1382196 () Bool)

(assert (=> b!1382196 (= e!783450 call!66535)))

(declare-fun b!1382197 () Bool)

(declare-fun e!783452 () Bool)

(assert (=> b!1382197 (= e!783452 e!783450)))

(declare-fun c!128643 () Bool)

(assert (=> b!1382197 (= c!128643 (validKeyInArray!0 (select (arr!45572 a!2971) #b00000000000000000000000000000000)))))

(declare-fun bm!66532 () Bool)

(assert (=> bm!66532 (= call!66535 (arrayNoDuplicates!0 a!2971 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128643 (Cons!32102 (select (arr!45572 a!2971) #b00000000000000000000000000000000) Nil!32103) Nil!32103)))))

(declare-fun b!1382198 () Bool)

(declare-fun e!783449 () Bool)

(assert (=> b!1382198 (= e!783449 e!783452)))

(declare-fun res!923789 () Bool)

(assert (=> b!1382198 (=> (not res!923789) (not e!783452))))

(declare-fun e!783451 () Bool)

(assert (=> b!1382198 (= res!923789 (not e!783451))))

(declare-fun res!923790 () Bool)

(assert (=> b!1382198 (=> (not res!923790) (not e!783451))))

(assert (=> b!1382198 (= res!923790 (validKeyInArray!0 (select (arr!45572 a!2971) #b00000000000000000000000000000000)))))

(declare-fun b!1382199 () Bool)

(declare-fun contains!9737 (List!32106 (_ BitVec 64)) Bool)

(assert (=> b!1382199 (= e!783451 (contains!9737 Nil!32103 (select (arr!45572 a!2971) #b00000000000000000000000000000000)))))

(declare-fun d!149167 () Bool)

(declare-fun res!923791 () Bool)

(assert (=> d!149167 (=> res!923791 e!783449)))

(assert (=> d!149167 (= res!923791 (bvsge #b00000000000000000000000000000000 (size!46122 a!2971)))))

(assert (=> d!149167 (= (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32103) e!783449)))

(assert (= (and d!149167 (not res!923791)) b!1382198))

(assert (= (and b!1382198 res!923790) b!1382199))

(assert (= (and b!1382198 res!923789) b!1382197))

(assert (= (and b!1382197 c!128643) b!1382196))

(assert (= (and b!1382197 (not c!128643)) b!1382195))

(assert (= (or b!1382196 b!1382195) bm!66532))

(assert (=> b!1382197 m!1267307))

(assert (=> b!1382197 m!1267307))

(assert (=> b!1382197 m!1267309))

(assert (=> bm!66532 m!1267307))

(declare-fun m!1267343 () Bool)

(assert (=> bm!66532 m!1267343))

(assert (=> b!1382198 m!1267307))

(assert (=> b!1382198 m!1267307))

(assert (=> b!1382198 m!1267309))

(assert (=> b!1382199 m!1267307))

(assert (=> b!1382199 m!1267307))

(declare-fun m!1267345 () Bool)

(assert (=> b!1382199 m!1267345))

(assert (=> b!1382086 d!149167))

(push 1)

