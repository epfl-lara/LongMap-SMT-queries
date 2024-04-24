; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122702 () Bool)

(assert start!122702)

(declare-fun res!955266 () Bool)

(declare-fun e!803764 () Bool)

(assert (=> start!122702 (=> (not res!955266) (not e!803764))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122702 (= res!955266 (validMask!0 mask!2608))))

(assert (=> start!122702 e!803764))

(assert (=> start!122702 true))

(declare-datatypes ((array!97028 0))(
  ( (array!97029 (arr!46831 (Array (_ BitVec 32) (_ BitVec 64))) (size!47382 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97028)

(declare-fun array_inv!36112 (array!97028) Bool)

(assert (=> start!122702 (array_inv!36112 a!2831)))

(declare-fun b!1420430 () Bool)

(declare-fun res!955267 () Bool)

(assert (=> b!1420430 (=> (not res!955267) (not e!803764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97028 (_ BitVec 32)) Bool)

(assert (=> b!1420430 (= res!955267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420431 () Bool)

(declare-fun lt!626150 () (_ BitVec 32))

(assert (=> b!1420431 (= e!803764 (and (bvsge mask!2608 #b00000000000000000000000000000000) (or (bvslt lt!626150 #b00000000000000000000000000000000) (bvsge lt!626150 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420431 (= lt!626150 (toIndex!0 (select (store (arr!46831 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1420432 () Bool)

(declare-fun res!955269 () Bool)

(assert (=> b!1420432 (=> (not res!955269) (not e!803764))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420432 (= res!955269 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47382 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47382 a!2831))))))

(declare-fun b!1420433 () Bool)

(declare-fun res!955271 () Bool)

(assert (=> b!1420433 (=> (not res!955271) (not e!803764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420433 (= res!955271 (validKeyInArray!0 (select (arr!46831 a!2831) j!81)))))

(declare-fun b!1420434 () Bool)

(declare-fun res!955273 () Bool)

(assert (=> b!1420434 (=> (not res!955273) (not e!803764))))

(declare-datatypes ((List!33328 0))(
  ( (Nil!33325) (Cons!33324 (h!34631 (_ BitVec 64)) (t!48014 List!33328)) )
))
(declare-fun arrayNoDuplicates!0 (array!97028 (_ BitVec 32) List!33328) Bool)

(assert (=> b!1420434 (= res!955273 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33325))))

(declare-fun b!1420435 () Bool)

(declare-fun res!955272 () Bool)

(assert (=> b!1420435 (=> (not res!955272) (not e!803764))))

(assert (=> b!1420435 (= res!955272 (validKeyInArray!0 (select (arr!46831 a!2831) i!982)))))

(declare-fun b!1420436 () Bool)

(declare-fun res!955268 () Bool)

(assert (=> b!1420436 (=> (not res!955268) (not e!803764))))

(declare-datatypes ((SeekEntryResult!11018 0))(
  ( (MissingZero!11018 (index!46464 (_ BitVec 32))) (Found!11018 (index!46465 (_ BitVec 32))) (Intermediate!11018 (undefined!11830 Bool) (index!46466 (_ BitVec 32)) (x!128289 (_ BitVec 32))) (Undefined!11018) (MissingVacant!11018 (index!46467 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97028 (_ BitVec 32)) SeekEntryResult!11018)

(assert (=> b!1420436 (= res!955268 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46831 a!2831) j!81) mask!2608) (select (arr!46831 a!2831) j!81) a!2831 mask!2608) (Intermediate!11018 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420437 () Bool)

(declare-fun res!955270 () Bool)

(assert (=> b!1420437 (=> (not res!955270) (not e!803764))))

(assert (=> b!1420437 (= res!955270 (and (= (size!47382 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47382 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47382 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122702 res!955266) b!1420437))

(assert (= (and b!1420437 res!955270) b!1420435))

(assert (= (and b!1420435 res!955272) b!1420433))

(assert (= (and b!1420433 res!955271) b!1420430))

(assert (= (and b!1420430 res!955267) b!1420434))

(assert (= (and b!1420434 res!955273) b!1420432))

(assert (= (and b!1420432 res!955269) b!1420436))

(assert (= (and b!1420436 res!955268) b!1420431))

(declare-fun m!1311177 () Bool)

(assert (=> b!1420433 m!1311177))

(assert (=> b!1420433 m!1311177))

(declare-fun m!1311179 () Bool)

(assert (=> b!1420433 m!1311179))

(declare-fun m!1311181 () Bool)

(assert (=> b!1420434 m!1311181))

(declare-fun m!1311183 () Bool)

(assert (=> b!1420435 m!1311183))

(assert (=> b!1420435 m!1311183))

(declare-fun m!1311185 () Bool)

(assert (=> b!1420435 m!1311185))

(assert (=> b!1420436 m!1311177))

(assert (=> b!1420436 m!1311177))

(declare-fun m!1311187 () Bool)

(assert (=> b!1420436 m!1311187))

(assert (=> b!1420436 m!1311187))

(assert (=> b!1420436 m!1311177))

(declare-fun m!1311189 () Bool)

(assert (=> b!1420436 m!1311189))

(declare-fun m!1311191 () Bool)

(assert (=> start!122702 m!1311191))

(declare-fun m!1311193 () Bool)

(assert (=> start!122702 m!1311193))

(declare-fun m!1311195 () Bool)

(assert (=> b!1420430 m!1311195))

(declare-fun m!1311197 () Bool)

(assert (=> b!1420431 m!1311197))

(declare-fun m!1311199 () Bool)

(assert (=> b!1420431 m!1311199))

(assert (=> b!1420431 m!1311199))

(declare-fun m!1311201 () Bool)

(assert (=> b!1420431 m!1311201))

(check-sat (not b!1420433) (not b!1420434) (not b!1420435) (not b!1420431) (not start!122702) (not b!1420430) (not b!1420436))
(check-sat)
(get-model)

(declare-fun b!1420496 () Bool)

(declare-fun e!803786 () Bool)

(declare-fun call!67365 () Bool)

(assert (=> b!1420496 (= e!803786 call!67365)))

(declare-fun d!153329 () Bool)

(declare-fun res!955329 () Bool)

(declare-fun e!803789 () Bool)

(assert (=> d!153329 (=> res!955329 e!803789)))

(assert (=> d!153329 (= res!955329 (bvsge #b00000000000000000000000000000000 (size!47382 a!2831)))))

(assert (=> d!153329 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33325) e!803789)))

(declare-fun b!1420497 () Bool)

(declare-fun e!803788 () Bool)

(assert (=> b!1420497 (= e!803789 e!803788)))

(declare-fun res!955328 () Bool)

(assert (=> b!1420497 (=> (not res!955328) (not e!803788))))

(declare-fun e!803787 () Bool)

(assert (=> b!1420497 (= res!955328 (not e!803787))))

(declare-fun res!955330 () Bool)

(assert (=> b!1420497 (=> (not res!955330) (not e!803787))))

(assert (=> b!1420497 (= res!955330 (validKeyInArray!0 (select (arr!46831 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1420498 () Bool)

(assert (=> b!1420498 (= e!803786 call!67365)))

(declare-fun bm!67362 () Bool)

(declare-fun c!132076 () Bool)

(assert (=> bm!67362 (= call!67365 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132076 (Cons!33324 (select (arr!46831 a!2831) #b00000000000000000000000000000000) Nil!33325) Nil!33325)))))

(declare-fun b!1420499 () Bool)

(declare-fun contains!9887 (List!33328 (_ BitVec 64)) Bool)

(assert (=> b!1420499 (= e!803787 (contains!9887 Nil!33325 (select (arr!46831 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1420500 () Bool)

(assert (=> b!1420500 (= e!803788 e!803786)))

(assert (=> b!1420500 (= c!132076 (validKeyInArray!0 (select (arr!46831 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153329 (not res!955329)) b!1420497))

(assert (= (and b!1420497 res!955330) b!1420499))

(assert (= (and b!1420497 res!955328) b!1420500))

(assert (= (and b!1420500 c!132076) b!1420498))

(assert (= (and b!1420500 (not c!132076)) b!1420496))

(assert (= (or b!1420498 b!1420496) bm!67362))

(declare-fun m!1311255 () Bool)

(assert (=> b!1420497 m!1311255))

(assert (=> b!1420497 m!1311255))

(declare-fun m!1311257 () Bool)

(assert (=> b!1420497 m!1311257))

(assert (=> bm!67362 m!1311255))

(declare-fun m!1311259 () Bool)

(assert (=> bm!67362 m!1311259))

(assert (=> b!1420499 m!1311255))

(assert (=> b!1420499 m!1311255))

(declare-fun m!1311261 () Bool)

(assert (=> b!1420499 m!1311261))

(assert (=> b!1420500 m!1311255))

(assert (=> b!1420500 m!1311255))

(assert (=> b!1420500 m!1311257))

(assert (=> b!1420434 d!153329))

(declare-fun d!153331 () Bool)

(assert (=> d!153331 (= (validKeyInArray!0 (select (arr!46831 a!2831) j!81)) (and (not (= (select (arr!46831 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46831 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1420433 d!153331))

(declare-fun d!153333 () Bool)

(assert (=> d!153333 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122702 d!153333))

(declare-fun d!153337 () Bool)

(assert (=> d!153337 (= (array_inv!36112 a!2831) (bvsge (size!47382 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122702 d!153337))

(declare-fun d!153339 () Bool)

(declare-fun lt!626162 () (_ BitVec 32))

(declare-fun lt!626161 () (_ BitVec 32))

(assert (=> d!153339 (= lt!626162 (bvmul (bvxor lt!626161 (bvlshr lt!626161 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153339 (= lt!626161 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46831 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (bvlshr (select (store (arr!46831 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153339 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!955331 (let ((h!34634 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46831 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (bvlshr (select (store (arr!46831 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128292 (bvmul (bvxor h!34634 (bvlshr h!34634 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128292 (bvlshr x!128292 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!955331 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!955331 #b00000000000000000000000000000000))))))

(assert (=> d!153339 (= (toIndex!0 (select (store (arr!46831 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (bvand (bvxor lt!626162 (bvlshr lt!626162 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1420431 d!153339))

(declare-fun b!1420561 () Bool)

(declare-fun e!803831 () Bool)

(declare-fun lt!626179 () SeekEntryResult!11018)

(assert (=> b!1420561 (= e!803831 (bvsge (x!128289 lt!626179) #b01111111111111111111111111111110))))

(declare-fun b!1420562 () Bool)

(assert (=> b!1420562 (and (bvsge (index!46466 lt!626179) #b00000000000000000000000000000000) (bvslt (index!46466 lt!626179) (size!47382 a!2831)))))

(declare-fun e!803827 () Bool)

(assert (=> b!1420562 (= e!803827 (= (select (arr!46831 a!2831) (index!46466 lt!626179)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153343 () Bool)

(assert (=> d!153343 e!803831))

(declare-fun c!132095 () Bool)

(get-info :version)

(assert (=> d!153343 (= c!132095 (and ((_ is Intermediate!11018) lt!626179) (undefined!11830 lt!626179)))))

(declare-fun e!803829 () SeekEntryResult!11018)

(assert (=> d!153343 (= lt!626179 e!803829)))

(declare-fun c!132096 () Bool)

(assert (=> d!153343 (= c!132096 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!626180 () (_ BitVec 64))

(assert (=> d!153343 (= lt!626180 (select (arr!46831 a!2831) (toIndex!0 (select (arr!46831 a!2831) j!81) mask!2608)))))

(assert (=> d!153343 (validMask!0 mask!2608)))

(assert (=> d!153343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46831 a!2831) j!81) mask!2608) (select (arr!46831 a!2831) j!81) a!2831 mask!2608) lt!626179)))

(declare-fun b!1420563 () Bool)

(assert (=> b!1420563 (= e!803829 (Intermediate!11018 true (toIndex!0 (select (arr!46831 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1420564 () Bool)

(declare-fun e!803828 () SeekEntryResult!11018)

(assert (=> b!1420564 (= e!803829 e!803828)))

(declare-fun c!132097 () Bool)

(assert (=> b!1420564 (= c!132097 (or (= lt!626180 (select (arr!46831 a!2831) j!81)) (= (bvadd lt!626180 lt!626180) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1420565 () Bool)

(assert (=> b!1420565 (and (bvsge (index!46466 lt!626179) #b00000000000000000000000000000000) (bvslt (index!46466 lt!626179) (size!47382 a!2831)))))

(declare-fun res!955358 () Bool)

(assert (=> b!1420565 (= res!955358 (= (select (arr!46831 a!2831) (index!46466 lt!626179)) (select (arr!46831 a!2831) j!81)))))

(assert (=> b!1420565 (=> res!955358 e!803827)))

(declare-fun e!803830 () Bool)

(assert (=> b!1420565 (= e!803830 e!803827)))

(declare-fun b!1420566 () Bool)

(assert (=> b!1420566 (= e!803831 e!803830)))

(declare-fun res!955359 () Bool)

(assert (=> b!1420566 (= res!955359 (and ((_ is Intermediate!11018) lt!626179) (not (undefined!11830 lt!626179)) (bvslt (x!128289 lt!626179) #b01111111111111111111111111111110) (bvsge (x!128289 lt!626179) #b00000000000000000000000000000000) (bvsge (x!128289 lt!626179) #b00000000000000000000000000000000)))))

(assert (=> b!1420566 (=> (not res!955359) (not e!803830))))

(declare-fun b!1420567 () Bool)

(assert (=> b!1420567 (and (bvsge (index!46466 lt!626179) #b00000000000000000000000000000000) (bvslt (index!46466 lt!626179) (size!47382 a!2831)))))

(declare-fun res!955357 () Bool)

(assert (=> b!1420567 (= res!955357 (= (select (arr!46831 a!2831) (index!46466 lt!626179)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1420567 (=> res!955357 e!803827)))

(declare-fun b!1420568 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420568 (= e!803828 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46831 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!46831 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420569 () Bool)

(assert (=> b!1420569 (= e!803828 (Intermediate!11018 false (toIndex!0 (select (arr!46831 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153343 c!132096) b!1420563))

(assert (= (and d!153343 (not c!132096)) b!1420564))

(assert (= (and b!1420564 c!132097) b!1420569))

(assert (= (and b!1420564 (not c!132097)) b!1420568))

(assert (= (and d!153343 c!132095) b!1420561))

(assert (= (and d!153343 (not c!132095)) b!1420566))

(assert (= (and b!1420566 res!955359) b!1420565))

(assert (= (and b!1420565 (not res!955358)) b!1420567))

(assert (= (and b!1420567 (not res!955357)) b!1420562))

(declare-fun m!1311279 () Bool)

(assert (=> b!1420567 m!1311279))

(assert (=> b!1420565 m!1311279))

(assert (=> d!153343 m!1311187))

(declare-fun m!1311281 () Bool)

(assert (=> d!153343 m!1311281))

(assert (=> d!153343 m!1311191))

(assert (=> b!1420562 m!1311279))

(assert (=> b!1420568 m!1311187))

(declare-fun m!1311283 () Bool)

(assert (=> b!1420568 m!1311283))

(assert (=> b!1420568 m!1311283))

(assert (=> b!1420568 m!1311177))

(declare-fun m!1311285 () Bool)

(assert (=> b!1420568 m!1311285))

(assert (=> b!1420436 d!153343))

(declare-fun d!153355 () Bool)

(declare-fun lt!626182 () (_ BitVec 32))

(declare-fun lt!626181 () (_ BitVec 32))

(assert (=> d!153355 (= lt!626182 (bvmul (bvxor lt!626181 (bvlshr lt!626181 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153355 (= lt!626181 ((_ extract 31 0) (bvand (bvxor (select (arr!46831 a!2831) j!81) (bvlshr (select (arr!46831 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153355 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!955331 (let ((h!34634 ((_ extract 31 0) (bvand (bvxor (select (arr!46831 a!2831) j!81) (bvlshr (select (arr!46831 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128292 (bvmul (bvxor h!34634 (bvlshr h!34634 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128292 (bvlshr x!128292 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!955331 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!955331 #b00000000000000000000000000000000))))))

(assert (=> d!153355 (= (toIndex!0 (select (arr!46831 a!2831) j!81) mask!2608) (bvand (bvxor lt!626182 (bvlshr lt!626182 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1420436 d!153355))

(declare-fun d!153357 () Bool)

(assert (=> d!153357 (= (validKeyInArray!0 (select (arr!46831 a!2831) i!982)) (and (not (= (select (arr!46831 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46831 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1420435 d!153357))

(declare-fun b!1420596 () Bool)

(declare-fun e!803848 () Bool)

(declare-fun e!803850 () Bool)

(assert (=> b!1420596 (= e!803848 e!803850)))

(declare-fun lt!626195 () (_ BitVec 64))

(assert (=> b!1420596 (= lt!626195 (select (arr!46831 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48017 0))(
  ( (Unit!48018) )
))
(declare-fun lt!626193 () Unit!48017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97028 (_ BitVec 64) (_ BitVec 32)) Unit!48017)

(assert (=> b!1420596 (= lt!626193 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!626195 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1420596 (arrayContainsKey!0 a!2831 lt!626195 #b00000000000000000000000000000000)))

(declare-fun lt!626194 () Unit!48017)

(assert (=> b!1420596 (= lt!626194 lt!626193)))

(declare-fun res!955371 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97028 (_ BitVec 32)) SeekEntryResult!11018)

(assert (=> b!1420596 (= res!955371 (= (seekEntryOrOpen!0 (select (arr!46831 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11018 #b00000000000000000000000000000000)))))

(assert (=> b!1420596 (=> (not res!955371) (not e!803850))))

(declare-fun b!1420597 () Bool)

(declare-fun e!803849 () Bool)

(assert (=> b!1420597 (= e!803849 e!803848)))

(declare-fun c!132106 () Bool)

(assert (=> b!1420597 (= c!132106 (validKeyInArray!0 (select (arr!46831 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67368 () Bool)

(declare-fun call!67371 () Bool)

(assert (=> bm!67368 (= call!67371 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1420598 () Bool)

(assert (=> b!1420598 (= e!803848 call!67371)))

(declare-fun b!1420599 () Bool)

(assert (=> b!1420599 (= e!803850 call!67371)))

(declare-fun d!153359 () Bool)

(declare-fun res!955370 () Bool)

(assert (=> d!153359 (=> res!955370 e!803849)))

(assert (=> d!153359 (= res!955370 (bvsge #b00000000000000000000000000000000 (size!47382 a!2831)))))

(assert (=> d!153359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!803849)))

(assert (= (and d!153359 (not res!955370)) b!1420597))

(assert (= (and b!1420597 c!132106) b!1420596))

(assert (= (and b!1420597 (not c!132106)) b!1420598))

(assert (= (and b!1420596 res!955371) b!1420599))

(assert (= (or b!1420599 b!1420598) bm!67368))

(assert (=> b!1420596 m!1311255))

(declare-fun m!1311287 () Bool)

(assert (=> b!1420596 m!1311287))

(declare-fun m!1311289 () Bool)

(assert (=> b!1420596 m!1311289))

(assert (=> b!1420596 m!1311255))

(declare-fun m!1311291 () Bool)

(assert (=> b!1420596 m!1311291))

(assert (=> b!1420597 m!1311255))

(assert (=> b!1420597 m!1311255))

(assert (=> b!1420597 m!1311257))

(declare-fun m!1311293 () Bool)

(assert (=> bm!67368 m!1311293))

(assert (=> b!1420430 d!153359))

(check-sat (not d!153343) (not b!1420499) (not bm!67362) (not b!1420597) (not bm!67368) (not b!1420497) (not b!1420500) (not b!1420596) (not b!1420568))
(check-sat)
