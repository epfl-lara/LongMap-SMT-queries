; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122030 () Bool)

(assert start!122030)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96716 0))(
  ( (array!96717 (arr!46689 (Array (_ BitVec 32) (_ BitVec 64))) (size!47239 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96716)

(declare-fun b!1416431 () Bool)

(declare-fun e!801654 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11000 0))(
  ( (MissingZero!11000 (index!46392 (_ BitVec 32))) (Found!11000 (index!46393 (_ BitVec 32))) (Intermediate!11000 (undefined!11812 Bool) (index!46394 (_ BitVec 32)) (x!127991 (_ BitVec 32))) (Undefined!11000) (MissingVacant!11000 (index!46395 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96716 (_ BitVec 32)) SeekEntryResult!11000)

(assert (=> b!1416431 (= e!801654 (= (seekEntryOrOpen!0 (select (arr!46689 a!2901) j!112) a!2901 mask!2840) (Found!11000 j!112)))))

(declare-fun res!952474 () Bool)

(declare-fun e!801656 () Bool)

(assert (=> start!122030 (=> (not res!952474) (not e!801656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122030 (= res!952474 (validMask!0 mask!2840))))

(assert (=> start!122030 e!801656))

(assert (=> start!122030 true))

(declare-fun array_inv!35717 (array!96716) Bool)

(assert (=> start!122030 (array_inv!35717 a!2901)))

(declare-fun b!1416432 () Bool)

(declare-fun e!801653 () Bool)

(assert (=> b!1416432 (= e!801656 (not e!801653))))

(declare-fun res!952475 () Bool)

(assert (=> b!1416432 (=> res!952475 e!801653)))

(declare-fun lt!624960 () SeekEntryResult!11000)

(get-info :version)

(assert (=> b!1416432 (= res!952475 (or (not ((_ is Intermediate!11000) lt!624960)) (undefined!11812 lt!624960)))))

(assert (=> b!1416432 e!801654))

(declare-fun res!952473 () Bool)

(assert (=> b!1416432 (=> (not res!952473) (not e!801654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96716 (_ BitVec 32)) Bool)

(assert (=> b!1416432 (= res!952473 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47974 0))(
  ( (Unit!47975) )
))
(declare-fun lt!624959 () Unit!47974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47974)

(assert (=> b!1416432 (= lt!624959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96716 (_ BitVec 32)) SeekEntryResult!11000)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416432 (= lt!624960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46689 a!2901) j!112) mask!2840) (select (arr!46689 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416433 () Bool)

(declare-fun res!952478 () Bool)

(assert (=> b!1416433 (=> (not res!952478) (not e!801656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416433 (= res!952478 (validKeyInArray!0 (select (arr!46689 a!2901) j!112)))))

(declare-fun b!1416434 () Bool)

(declare-fun res!952480 () Bool)

(assert (=> b!1416434 (=> (not res!952480) (not e!801656))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416434 (= res!952480 (and (= (size!47239 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47239 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47239 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416435 () Bool)

(declare-fun res!952476 () Bool)

(assert (=> b!1416435 (=> (not res!952476) (not e!801656))))

(declare-datatypes ((List!33208 0))(
  ( (Nil!33205) (Cons!33204 (h!34491 (_ BitVec 64)) (t!47902 List!33208)) )
))
(declare-fun arrayNoDuplicates!0 (array!96716 (_ BitVec 32) List!33208) Bool)

(assert (=> b!1416435 (= res!952476 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33205))))

(declare-fun b!1416436 () Bool)

(declare-fun res!952479 () Bool)

(assert (=> b!1416436 (=> (not res!952479) (not e!801656))))

(assert (=> b!1416436 (= res!952479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416437 () Bool)

(declare-fun res!952477 () Bool)

(assert (=> b!1416437 (=> (not res!952477) (not e!801656))))

(assert (=> b!1416437 (= res!952477 (validKeyInArray!0 (select (arr!46689 a!2901) i!1037)))))

(declare-fun b!1416438 () Bool)

(declare-fun lt!624958 () SeekEntryResult!11000)

(assert (=> b!1416438 (= e!801653 (or (= lt!624960 lt!624958) ((_ is Intermediate!11000) lt!624958)))))

(assert (=> b!1416438 (= lt!624958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96717 (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47239 a!2901)) mask!2840))))

(assert (= (and start!122030 res!952474) b!1416434))

(assert (= (and b!1416434 res!952480) b!1416437))

(assert (= (and b!1416437 res!952477) b!1416433))

(assert (= (and b!1416433 res!952478) b!1416436))

(assert (= (and b!1416436 res!952479) b!1416435))

(assert (= (and b!1416435 res!952476) b!1416432))

(assert (= (and b!1416432 res!952473) b!1416431))

(assert (= (and b!1416432 (not res!952475)) b!1416438))

(declare-fun m!1307155 () Bool)

(assert (=> b!1416436 m!1307155))

(declare-fun m!1307157 () Bool)

(assert (=> start!122030 m!1307157))

(declare-fun m!1307159 () Bool)

(assert (=> start!122030 m!1307159))

(declare-fun m!1307161 () Bool)

(assert (=> b!1416438 m!1307161))

(declare-fun m!1307163 () Bool)

(assert (=> b!1416438 m!1307163))

(assert (=> b!1416438 m!1307163))

(declare-fun m!1307165 () Bool)

(assert (=> b!1416438 m!1307165))

(assert (=> b!1416438 m!1307165))

(assert (=> b!1416438 m!1307163))

(declare-fun m!1307167 () Bool)

(assert (=> b!1416438 m!1307167))

(declare-fun m!1307169 () Bool)

(assert (=> b!1416433 m!1307169))

(assert (=> b!1416433 m!1307169))

(declare-fun m!1307171 () Bool)

(assert (=> b!1416433 m!1307171))

(assert (=> b!1416432 m!1307169))

(declare-fun m!1307173 () Bool)

(assert (=> b!1416432 m!1307173))

(assert (=> b!1416432 m!1307169))

(declare-fun m!1307175 () Bool)

(assert (=> b!1416432 m!1307175))

(assert (=> b!1416432 m!1307173))

(assert (=> b!1416432 m!1307169))

(declare-fun m!1307177 () Bool)

(assert (=> b!1416432 m!1307177))

(declare-fun m!1307179 () Bool)

(assert (=> b!1416432 m!1307179))

(declare-fun m!1307181 () Bool)

(assert (=> b!1416435 m!1307181))

(declare-fun m!1307183 () Bool)

(assert (=> b!1416437 m!1307183))

(assert (=> b!1416437 m!1307183))

(declare-fun m!1307185 () Bool)

(assert (=> b!1416437 m!1307185))

(assert (=> b!1416431 m!1307169))

(assert (=> b!1416431 m!1307169))

(declare-fun m!1307187 () Bool)

(assert (=> b!1416431 m!1307187))

(check-sat (not b!1416433) (not b!1416436) (not b!1416431) (not b!1416437) (not b!1416432) (not start!122030) (not b!1416438) (not b!1416435))
(check-sat)
(get-model)

(declare-fun b!1416481 () Bool)

(declare-fun lt!624974 () SeekEntryResult!11000)

(assert (=> b!1416481 (and (bvsge (index!46394 lt!624974) #b00000000000000000000000000000000) (bvslt (index!46394 lt!624974) (size!47239 (array!96717 (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47239 a!2901)))))))

(declare-fun res!952512 () Bool)

(assert (=> b!1416481 (= res!952512 (= (select (arr!46689 (array!96717 (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47239 a!2901))) (index!46394 lt!624974)) (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!801680 () Bool)

(assert (=> b!1416481 (=> res!952512 e!801680)))

(declare-fun e!801683 () Bool)

(assert (=> b!1416481 (= e!801683 e!801680)))

(declare-fun d!152541 () Bool)

(declare-fun e!801679 () Bool)

(assert (=> d!152541 e!801679))

(declare-fun c!131464 () Bool)

(assert (=> d!152541 (= c!131464 (and ((_ is Intermediate!11000) lt!624974) (undefined!11812 lt!624974)))))

(declare-fun e!801682 () SeekEntryResult!11000)

(assert (=> d!152541 (= lt!624974 e!801682)))

(declare-fun c!131465 () Bool)

(assert (=> d!152541 (= c!131465 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!624975 () (_ BitVec 64))

(assert (=> d!152541 (= lt!624975 (select (arr!46689 (array!96717 (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47239 a!2901))) (toIndex!0 (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!152541 (validMask!0 mask!2840)))

(assert (=> d!152541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96717 (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47239 a!2901)) mask!2840) lt!624974)))

(declare-fun b!1416482 () Bool)

(assert (=> b!1416482 (= e!801682 (Intermediate!11000 true (toIndex!0 (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416483 () Bool)

(declare-fun e!801681 () SeekEntryResult!11000)

(assert (=> b!1416483 (= e!801682 e!801681)))

(declare-fun c!131466 () Bool)

(assert (=> b!1416483 (= c!131466 (or (= lt!624975 (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!624975 lt!624975) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1416484 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416484 (= e!801681 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96717 (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47239 a!2901)) mask!2840))))

(declare-fun b!1416485 () Bool)

(assert (=> b!1416485 (and (bvsge (index!46394 lt!624974) #b00000000000000000000000000000000) (bvslt (index!46394 lt!624974) (size!47239 (array!96717 (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47239 a!2901)))))))

(declare-fun res!952511 () Bool)

(assert (=> b!1416485 (= res!952511 (= (select (arr!46689 (array!96717 (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47239 a!2901))) (index!46394 lt!624974)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416485 (=> res!952511 e!801680)))

(declare-fun b!1416486 () Bool)

(assert (=> b!1416486 (= e!801679 e!801683)))

(declare-fun res!952513 () Bool)

(assert (=> b!1416486 (= res!952513 (and ((_ is Intermediate!11000) lt!624974) (not (undefined!11812 lt!624974)) (bvslt (x!127991 lt!624974) #b01111111111111111111111111111110) (bvsge (x!127991 lt!624974) #b00000000000000000000000000000000) (bvsge (x!127991 lt!624974) #b00000000000000000000000000000000)))))

(assert (=> b!1416486 (=> (not res!952513) (not e!801683))))

(declare-fun b!1416487 () Bool)

(assert (=> b!1416487 (and (bvsge (index!46394 lt!624974) #b00000000000000000000000000000000) (bvslt (index!46394 lt!624974) (size!47239 (array!96717 (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47239 a!2901)))))))

(assert (=> b!1416487 (= e!801680 (= (select (arr!46689 (array!96717 (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47239 a!2901))) (index!46394 lt!624974)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1416488 () Bool)

(assert (=> b!1416488 (= e!801679 (bvsge (x!127991 lt!624974) #b01111111111111111111111111111110))))

(declare-fun b!1416489 () Bool)

(assert (=> b!1416489 (= e!801681 (Intermediate!11000 false (toIndex!0 (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!152541 c!131465) b!1416482))

(assert (= (and d!152541 (not c!131465)) b!1416483))

(assert (= (and b!1416483 c!131466) b!1416489))

(assert (= (and b!1416483 (not c!131466)) b!1416484))

(assert (= (and d!152541 c!131464) b!1416488))

(assert (= (and d!152541 (not c!131464)) b!1416486))

(assert (= (and b!1416486 res!952513) b!1416481))

(assert (= (and b!1416481 (not res!952512)) b!1416485))

(assert (= (and b!1416485 (not res!952511)) b!1416487))

(assert (=> d!152541 m!1307165))

(declare-fun m!1307223 () Bool)

(assert (=> d!152541 m!1307223))

(assert (=> d!152541 m!1307157))

(assert (=> b!1416484 m!1307165))

(declare-fun m!1307225 () Bool)

(assert (=> b!1416484 m!1307225))

(assert (=> b!1416484 m!1307225))

(assert (=> b!1416484 m!1307163))

(declare-fun m!1307227 () Bool)

(assert (=> b!1416484 m!1307227))

(declare-fun m!1307229 () Bool)

(assert (=> b!1416481 m!1307229))

(assert (=> b!1416487 m!1307229))

(assert (=> b!1416485 m!1307229))

(assert (=> b!1416438 d!152541))

(declare-fun d!152549 () Bool)

(declare-fun lt!624985 () (_ BitVec 32))

(declare-fun lt!624984 () (_ BitVec 32))

(assert (=> d!152549 (= lt!624985 (bvmul (bvxor lt!624984 (bvlshr lt!624984 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152549 (= lt!624984 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152549 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!952514 (let ((h!34493 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127994 (bvmul (bvxor h!34493 (bvlshr h!34493 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127994 (bvlshr x!127994 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!952514 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!952514 #b00000000000000000000000000000000))))))

(assert (=> d!152549 (= (toIndex!0 (select (store (arr!46689 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!624985 (bvlshr lt!624985 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1416438 d!152549))

(declare-fun d!152555 () Bool)

(assert (=> d!152555 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!122030 d!152555))

(declare-fun d!152559 () Bool)

(assert (=> d!152559 (= (array_inv!35717 a!2901) (bvsge (size!47239 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!122030 d!152559))

(declare-fun d!152563 () Bool)

(assert (=> d!152563 (= (validKeyInArray!0 (select (arr!46689 a!2901) j!112)) (and (not (= (select (arr!46689 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46689 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1416433 d!152563))

(declare-fun d!152565 () Bool)

(declare-fun lt!625038 () SeekEntryResult!11000)

(assert (=> d!152565 (and (or ((_ is Undefined!11000) lt!625038) (not ((_ is Found!11000) lt!625038)) (and (bvsge (index!46393 lt!625038) #b00000000000000000000000000000000) (bvslt (index!46393 lt!625038) (size!47239 a!2901)))) (or ((_ is Undefined!11000) lt!625038) ((_ is Found!11000) lt!625038) (not ((_ is MissingZero!11000) lt!625038)) (and (bvsge (index!46392 lt!625038) #b00000000000000000000000000000000) (bvslt (index!46392 lt!625038) (size!47239 a!2901)))) (or ((_ is Undefined!11000) lt!625038) ((_ is Found!11000) lt!625038) ((_ is MissingZero!11000) lt!625038) (not ((_ is MissingVacant!11000) lt!625038)) (and (bvsge (index!46395 lt!625038) #b00000000000000000000000000000000) (bvslt (index!46395 lt!625038) (size!47239 a!2901)))) (or ((_ is Undefined!11000) lt!625038) (ite ((_ is Found!11000) lt!625038) (= (select (arr!46689 a!2901) (index!46393 lt!625038)) (select (arr!46689 a!2901) j!112)) (ite ((_ is MissingZero!11000) lt!625038) (= (select (arr!46689 a!2901) (index!46392 lt!625038)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11000) lt!625038) (= (select (arr!46689 a!2901) (index!46395 lt!625038)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!801744 () SeekEntryResult!11000)

(assert (=> d!152565 (= lt!625038 e!801744)))

(declare-fun c!131500 () Bool)

(declare-fun lt!625039 () SeekEntryResult!11000)

(assert (=> d!152565 (= c!131500 (and ((_ is Intermediate!11000) lt!625039) (undefined!11812 lt!625039)))))

(assert (=> d!152565 (= lt!625039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46689 a!2901) j!112) mask!2840) (select (arr!46689 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152565 (validMask!0 mask!2840)))

(assert (=> d!152565 (= (seekEntryOrOpen!0 (select (arr!46689 a!2901) j!112) a!2901 mask!2840) lt!625038)))

(declare-fun b!1416589 () Bool)

(declare-fun e!801743 () SeekEntryResult!11000)

(assert (=> b!1416589 (= e!801743 (MissingZero!11000 (index!46394 lt!625039)))))

(declare-fun b!1416590 () Bool)

(declare-fun c!131501 () Bool)

(declare-fun lt!625037 () (_ BitVec 64))

(assert (=> b!1416590 (= c!131501 (= lt!625037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!801745 () SeekEntryResult!11000)

(assert (=> b!1416590 (= e!801745 e!801743)))

(declare-fun b!1416591 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96716 (_ BitVec 32)) SeekEntryResult!11000)

(assert (=> b!1416591 (= e!801743 (seekKeyOrZeroReturnVacant!0 (x!127991 lt!625039) (index!46394 lt!625039) (index!46394 lt!625039) (select (arr!46689 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416592 () Bool)

(assert (=> b!1416592 (= e!801744 Undefined!11000)))

(declare-fun b!1416593 () Bool)

(assert (=> b!1416593 (= e!801744 e!801745)))

(assert (=> b!1416593 (= lt!625037 (select (arr!46689 a!2901) (index!46394 lt!625039)))))

(declare-fun c!131502 () Bool)

(assert (=> b!1416593 (= c!131502 (= lt!625037 (select (arr!46689 a!2901) j!112)))))

(declare-fun b!1416594 () Bool)

(assert (=> b!1416594 (= e!801745 (Found!11000 (index!46394 lt!625039)))))

(assert (= (and d!152565 c!131500) b!1416592))

(assert (= (and d!152565 (not c!131500)) b!1416593))

(assert (= (and b!1416593 c!131502) b!1416594))

(assert (= (and b!1416593 (not c!131502)) b!1416590))

(assert (= (and b!1416590 c!131501) b!1416589))

(assert (= (and b!1416590 (not c!131501)) b!1416591))

(assert (=> d!152565 m!1307157))

(declare-fun m!1307275 () Bool)

(assert (=> d!152565 m!1307275))

(assert (=> d!152565 m!1307173))

(assert (=> d!152565 m!1307169))

(assert (=> d!152565 m!1307177))

(assert (=> d!152565 m!1307169))

(assert (=> d!152565 m!1307173))

(declare-fun m!1307277 () Bool)

(assert (=> d!152565 m!1307277))

(declare-fun m!1307279 () Bool)

(assert (=> d!152565 m!1307279))

(assert (=> b!1416591 m!1307169))

(declare-fun m!1307281 () Bool)

(assert (=> b!1416591 m!1307281))

(declare-fun m!1307283 () Bool)

(assert (=> b!1416593 m!1307283))

(assert (=> b!1416431 d!152565))

(declare-fun d!152581 () Bool)

(assert (=> d!152581 (= (validKeyInArray!0 (select (arr!46689 a!2901) i!1037)) (and (not (= (select (arr!46689 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46689 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1416437 d!152581))

(declare-fun b!1416616 () Bool)

(declare-fun e!801760 () Bool)

(declare-fun call!67190 () Bool)

(assert (=> b!1416616 (= e!801760 call!67190)))

(declare-fun b!1416617 () Bool)

(declare-fun e!801762 () Bool)

(assert (=> b!1416617 (= e!801762 call!67190)))

(declare-fun bm!67187 () Bool)

(assert (=> bm!67187 (= call!67190 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152583 () Bool)

(declare-fun res!952559 () Bool)

(declare-fun e!801761 () Bool)

(assert (=> d!152583 (=> res!952559 e!801761)))

(assert (=> d!152583 (= res!952559 (bvsge j!112 (size!47239 a!2901)))))

(assert (=> d!152583 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!801761)))

(declare-fun b!1416618 () Bool)

(assert (=> b!1416618 (= e!801761 e!801760)))

(declare-fun c!131509 () Bool)

(assert (=> b!1416618 (= c!131509 (validKeyInArray!0 (select (arr!46689 a!2901) j!112)))))

(declare-fun b!1416619 () Bool)

(assert (=> b!1416619 (= e!801760 e!801762)))

(declare-fun lt!625056 () (_ BitVec 64))

(assert (=> b!1416619 (= lt!625056 (select (arr!46689 a!2901) j!112))))

(declare-fun lt!625058 () Unit!47974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96716 (_ BitVec 64) (_ BitVec 32)) Unit!47974)

(assert (=> b!1416619 (= lt!625058 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625056 j!112))))

(declare-fun arrayContainsKey!0 (array!96716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1416619 (arrayContainsKey!0 a!2901 lt!625056 #b00000000000000000000000000000000)))

(declare-fun lt!625057 () Unit!47974)

(assert (=> b!1416619 (= lt!625057 lt!625058)))

(declare-fun res!952560 () Bool)

(assert (=> b!1416619 (= res!952560 (= (seekEntryOrOpen!0 (select (arr!46689 a!2901) j!112) a!2901 mask!2840) (Found!11000 j!112)))))

(assert (=> b!1416619 (=> (not res!952560) (not e!801762))))

(assert (= (and d!152583 (not res!952559)) b!1416618))

(assert (= (and b!1416618 c!131509) b!1416619))

(assert (= (and b!1416618 (not c!131509)) b!1416616))

(assert (= (and b!1416619 res!952560) b!1416617))

(assert (= (or b!1416617 b!1416616) bm!67187))

(declare-fun m!1307301 () Bool)

(assert (=> bm!67187 m!1307301))

(assert (=> b!1416618 m!1307169))

(assert (=> b!1416618 m!1307169))

(assert (=> b!1416618 m!1307171))

(assert (=> b!1416619 m!1307169))

(declare-fun m!1307303 () Bool)

(assert (=> b!1416619 m!1307303))

(declare-fun m!1307305 () Bool)

(assert (=> b!1416619 m!1307305))

(assert (=> b!1416619 m!1307169))

(assert (=> b!1416619 m!1307187))

(assert (=> b!1416432 d!152583))

(declare-fun d!152597 () Bool)

(assert (=> d!152597 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625061 () Unit!47974)

(declare-fun choose!38 (array!96716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47974)

(assert (=> d!152597 (= lt!625061 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152597 (validMask!0 mask!2840)))

(assert (=> d!152597 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!625061)))

(declare-fun bs!41296 () Bool)

(assert (= bs!41296 d!152597))

(assert (=> bs!41296 m!1307179))

(declare-fun m!1307307 () Bool)

(assert (=> bs!41296 m!1307307))

(assert (=> bs!41296 m!1307157))

(assert (=> b!1416432 d!152597))

(declare-fun b!1416630 () Bool)

(declare-fun lt!625062 () SeekEntryResult!11000)

(assert (=> b!1416630 (and (bvsge (index!46394 lt!625062) #b00000000000000000000000000000000) (bvslt (index!46394 lt!625062) (size!47239 a!2901)))))

(declare-fun res!952568 () Bool)

(assert (=> b!1416630 (= res!952568 (= (select (arr!46689 a!2901) (index!46394 lt!625062)) (select (arr!46689 a!2901) j!112)))))

(declare-fun e!801772 () Bool)

(assert (=> b!1416630 (=> res!952568 e!801772)))

(declare-fun e!801775 () Bool)

(assert (=> b!1416630 (= e!801775 e!801772)))

(declare-fun d!152599 () Bool)

(declare-fun e!801771 () Bool)

(assert (=> d!152599 e!801771))

(declare-fun c!131512 () Bool)

(assert (=> d!152599 (= c!131512 (and ((_ is Intermediate!11000) lt!625062) (undefined!11812 lt!625062)))))

(declare-fun e!801774 () SeekEntryResult!11000)

(assert (=> d!152599 (= lt!625062 e!801774)))

(declare-fun c!131513 () Bool)

(assert (=> d!152599 (= c!131513 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!625063 () (_ BitVec 64))

(assert (=> d!152599 (= lt!625063 (select (arr!46689 a!2901) (toIndex!0 (select (arr!46689 a!2901) j!112) mask!2840)))))

(assert (=> d!152599 (validMask!0 mask!2840)))

(assert (=> d!152599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46689 a!2901) j!112) mask!2840) (select (arr!46689 a!2901) j!112) a!2901 mask!2840) lt!625062)))

(declare-fun b!1416631 () Bool)

(assert (=> b!1416631 (= e!801774 (Intermediate!11000 true (toIndex!0 (select (arr!46689 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416632 () Bool)

(declare-fun e!801773 () SeekEntryResult!11000)

(assert (=> b!1416632 (= e!801774 e!801773)))

(declare-fun c!131514 () Bool)

(assert (=> b!1416632 (= c!131514 (or (= lt!625063 (select (arr!46689 a!2901) j!112)) (= (bvadd lt!625063 lt!625063) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1416633 () Bool)

(assert (=> b!1416633 (= e!801773 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46689 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46689 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416634 () Bool)

(assert (=> b!1416634 (and (bvsge (index!46394 lt!625062) #b00000000000000000000000000000000) (bvslt (index!46394 lt!625062) (size!47239 a!2901)))))

(declare-fun res!952567 () Bool)

(assert (=> b!1416634 (= res!952567 (= (select (arr!46689 a!2901) (index!46394 lt!625062)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416634 (=> res!952567 e!801772)))

(declare-fun b!1416635 () Bool)

(assert (=> b!1416635 (= e!801771 e!801775)))

(declare-fun res!952569 () Bool)

(assert (=> b!1416635 (= res!952569 (and ((_ is Intermediate!11000) lt!625062) (not (undefined!11812 lt!625062)) (bvslt (x!127991 lt!625062) #b01111111111111111111111111111110) (bvsge (x!127991 lt!625062) #b00000000000000000000000000000000) (bvsge (x!127991 lt!625062) #b00000000000000000000000000000000)))))

(assert (=> b!1416635 (=> (not res!952569) (not e!801775))))

(declare-fun b!1416636 () Bool)

(assert (=> b!1416636 (and (bvsge (index!46394 lt!625062) #b00000000000000000000000000000000) (bvslt (index!46394 lt!625062) (size!47239 a!2901)))))

(assert (=> b!1416636 (= e!801772 (= (select (arr!46689 a!2901) (index!46394 lt!625062)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1416637 () Bool)

(assert (=> b!1416637 (= e!801771 (bvsge (x!127991 lt!625062) #b01111111111111111111111111111110))))

(declare-fun b!1416638 () Bool)

(assert (=> b!1416638 (= e!801773 (Intermediate!11000 false (toIndex!0 (select (arr!46689 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!152599 c!131513) b!1416631))

(assert (= (and d!152599 (not c!131513)) b!1416632))

(assert (= (and b!1416632 c!131514) b!1416638))

(assert (= (and b!1416632 (not c!131514)) b!1416633))

(assert (= (and d!152599 c!131512) b!1416637))

(assert (= (and d!152599 (not c!131512)) b!1416635))

(assert (= (and b!1416635 res!952569) b!1416630))

(assert (= (and b!1416630 (not res!952568)) b!1416634))

(assert (= (and b!1416634 (not res!952567)) b!1416636))

(assert (=> d!152599 m!1307173))

(declare-fun m!1307309 () Bool)

(assert (=> d!152599 m!1307309))

(assert (=> d!152599 m!1307157))

(assert (=> b!1416633 m!1307173))

(declare-fun m!1307311 () Bool)

(assert (=> b!1416633 m!1307311))

(assert (=> b!1416633 m!1307311))

(assert (=> b!1416633 m!1307169))

(declare-fun m!1307315 () Bool)

(assert (=> b!1416633 m!1307315))

(declare-fun m!1307319 () Bool)

(assert (=> b!1416630 m!1307319))

(assert (=> b!1416636 m!1307319))

(assert (=> b!1416634 m!1307319))

(assert (=> b!1416432 d!152599))

(declare-fun d!152601 () Bool)

(declare-fun lt!625065 () (_ BitVec 32))

(declare-fun lt!625064 () (_ BitVec 32))

(assert (=> d!152601 (= lt!625065 (bvmul (bvxor lt!625064 (bvlshr lt!625064 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152601 (= lt!625064 ((_ extract 31 0) (bvand (bvxor (select (arr!46689 a!2901) j!112) (bvlshr (select (arr!46689 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152601 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!952514 (let ((h!34493 ((_ extract 31 0) (bvand (bvxor (select (arr!46689 a!2901) j!112) (bvlshr (select (arr!46689 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127994 (bvmul (bvxor h!34493 (bvlshr h!34493 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127994 (bvlshr x!127994 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!952514 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!952514 #b00000000000000000000000000000000))))))

(assert (=> d!152601 (= (toIndex!0 (select (arr!46689 a!2901) j!112) mask!2840) (bvand (bvxor lt!625065 (bvlshr lt!625065 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1416432 d!152601))

(declare-fun b!1416670 () Bool)

(declare-fun e!801799 () Bool)

(declare-fun e!801798 () Bool)

(assert (=> b!1416670 (= e!801799 e!801798)))

(declare-fun c!131525 () Bool)

(assert (=> b!1416670 (= c!131525 (validKeyInArray!0 (select (arr!46689 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1416671 () Bool)

(declare-fun call!67197 () Bool)

(assert (=> b!1416671 (= e!801798 call!67197)))

(declare-fun b!1416672 () Bool)

(declare-fun e!801800 () Bool)

(declare-fun contains!9825 (List!33208 (_ BitVec 64)) Bool)

(assert (=> b!1416672 (= e!801800 (contains!9825 Nil!33205 (select (arr!46689 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1416673 () Bool)

(assert (=> b!1416673 (= e!801798 call!67197)))

(declare-fun d!152605 () Bool)

(declare-fun res!952582 () Bool)

(declare-fun e!801797 () Bool)

(assert (=> d!152605 (=> res!952582 e!801797)))

(assert (=> d!152605 (= res!952582 (bvsge #b00000000000000000000000000000000 (size!47239 a!2901)))))

(assert (=> d!152605 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33205) e!801797)))

(declare-fun b!1416674 () Bool)

(assert (=> b!1416674 (= e!801797 e!801799)))

(declare-fun res!952583 () Bool)

(assert (=> b!1416674 (=> (not res!952583) (not e!801799))))

(assert (=> b!1416674 (= res!952583 (not e!801800))))

(declare-fun res!952581 () Bool)

(assert (=> b!1416674 (=> (not res!952581) (not e!801800))))

(assert (=> b!1416674 (= res!952581 (validKeyInArray!0 (select (arr!46689 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67194 () Bool)

(assert (=> bm!67194 (= call!67197 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131525 (Cons!33204 (select (arr!46689 a!2901) #b00000000000000000000000000000000) Nil!33205) Nil!33205)))))

(assert (= (and d!152605 (not res!952582)) b!1416674))

(assert (= (and b!1416674 res!952581) b!1416672))

(assert (= (and b!1416674 res!952583) b!1416670))

(assert (= (and b!1416670 c!131525) b!1416673))

(assert (= (and b!1416670 (not c!131525)) b!1416671))

(assert (= (or b!1416673 b!1416671) bm!67194))

(declare-fun m!1307333 () Bool)

(assert (=> b!1416670 m!1307333))

(assert (=> b!1416670 m!1307333))

(declare-fun m!1307335 () Bool)

(assert (=> b!1416670 m!1307335))

(assert (=> b!1416672 m!1307333))

(assert (=> b!1416672 m!1307333))

(declare-fun m!1307337 () Bool)

(assert (=> b!1416672 m!1307337))

(assert (=> b!1416674 m!1307333))

(assert (=> b!1416674 m!1307333))

(assert (=> b!1416674 m!1307335))

(assert (=> bm!67194 m!1307333))

(declare-fun m!1307339 () Bool)

(assert (=> bm!67194 m!1307339))

(assert (=> b!1416435 d!152605))

(declare-fun b!1416675 () Bool)

(declare-fun e!801801 () Bool)

(declare-fun call!67198 () Bool)

(assert (=> b!1416675 (= e!801801 call!67198)))

(declare-fun b!1416676 () Bool)

(declare-fun e!801803 () Bool)

(assert (=> b!1416676 (= e!801803 call!67198)))

(declare-fun bm!67195 () Bool)

(assert (=> bm!67195 (= call!67198 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152609 () Bool)

(declare-fun res!952584 () Bool)

(declare-fun e!801802 () Bool)

(assert (=> d!152609 (=> res!952584 e!801802)))

(assert (=> d!152609 (= res!952584 (bvsge #b00000000000000000000000000000000 (size!47239 a!2901)))))

(assert (=> d!152609 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!801802)))

(declare-fun b!1416677 () Bool)

(assert (=> b!1416677 (= e!801802 e!801801)))

(declare-fun c!131526 () Bool)

(assert (=> b!1416677 (= c!131526 (validKeyInArray!0 (select (arr!46689 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1416678 () Bool)

(assert (=> b!1416678 (= e!801801 e!801803)))

(declare-fun lt!625075 () (_ BitVec 64))

(assert (=> b!1416678 (= lt!625075 (select (arr!46689 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!625077 () Unit!47974)

(assert (=> b!1416678 (= lt!625077 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625075 #b00000000000000000000000000000000))))

(assert (=> b!1416678 (arrayContainsKey!0 a!2901 lt!625075 #b00000000000000000000000000000000)))

(declare-fun lt!625076 () Unit!47974)

(assert (=> b!1416678 (= lt!625076 lt!625077)))

(declare-fun res!952585 () Bool)

(assert (=> b!1416678 (= res!952585 (= (seekEntryOrOpen!0 (select (arr!46689 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!11000 #b00000000000000000000000000000000)))))

(assert (=> b!1416678 (=> (not res!952585) (not e!801803))))

(assert (= (and d!152609 (not res!952584)) b!1416677))

(assert (= (and b!1416677 c!131526) b!1416678))

(assert (= (and b!1416677 (not c!131526)) b!1416675))

(assert (= (and b!1416678 res!952585) b!1416676))

(assert (= (or b!1416676 b!1416675) bm!67195))

(declare-fun m!1307341 () Bool)

(assert (=> bm!67195 m!1307341))

(assert (=> b!1416677 m!1307333))

(assert (=> b!1416677 m!1307333))

(assert (=> b!1416677 m!1307335))

(assert (=> b!1416678 m!1307333))

(declare-fun m!1307343 () Bool)

(assert (=> b!1416678 m!1307343))

(declare-fun m!1307345 () Bool)

(assert (=> b!1416678 m!1307345))

(assert (=> b!1416678 m!1307333))

(declare-fun m!1307347 () Bool)

(assert (=> b!1416678 m!1307347))

(assert (=> b!1416436 d!152609))

(check-sat (not d!152599) (not b!1416591) (not b!1416678) (not d!152541) (not b!1416633) (not bm!67194) (not b!1416677) (not b!1416484) (not b!1416674) (not b!1416619) (not d!152565) (not b!1416618) (not bm!67187) (not bm!67195) (not b!1416670) (not b!1416672) (not d!152597))
(check-sat)
