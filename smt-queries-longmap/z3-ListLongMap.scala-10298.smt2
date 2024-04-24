; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121298 () Bool)

(assert start!121298)

(declare-fun res!946327 () Bool)

(declare-fun e!797699 () Bool)

(assert (=> start!121298 (=> (not res!946327) (not e!797699))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121298 (= res!946327 (validMask!0 mask!2840))))

(assert (=> start!121298 e!797699))

(assert (=> start!121298 true))

(declare-datatypes ((array!96374 0))(
  ( (array!96375 (arr!46528 (Array (_ BitVec 32) (_ BitVec 64))) (size!47079 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96374)

(declare-fun array_inv!35809 (array!96374) Bool)

(assert (=> start!121298 (array_inv!35809 a!2901)))

(declare-fun b!1409281 () Bool)

(declare-fun e!797697 () Bool)

(declare-fun e!797698 () Bool)

(assert (=> b!1409281 (= e!797697 e!797698)))

(declare-fun res!946325 () Bool)

(assert (=> b!1409281 (=> res!946325 e!797698)))

(declare-fun lt!620548 () array!96374)

(declare-fun lt!620546 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10742 0))(
  ( (MissingZero!10742 (index!45345 (_ BitVec 32))) (Found!10742 (index!45346 (_ BitVec 32))) (Intermediate!10742 (undefined!11554 Bool) (index!45347 (_ BitVec 32)) (x!127106 (_ BitVec 32))) (Undefined!10742) (MissingVacant!10742 (index!45348 (_ BitVec 32))) )
))
(declare-fun lt!620544 () SeekEntryResult!10742)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96374 (_ BitVec 32)) SeekEntryResult!10742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409281 (= res!946325 (not (= lt!620544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620546 mask!2840) lt!620546 lt!620548 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1409281 (= lt!620546 (select (store (arr!46528 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1409281 (= lt!620548 (array!96375 (store (arr!46528 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47079 a!2901)))))

(declare-fun b!1409282 () Bool)

(declare-fun res!946322 () Bool)

(assert (=> b!1409282 (=> res!946322 e!797698)))

(declare-fun lt!620547 () (_ BitVec 32))

(assert (=> b!1409282 (= res!946322 (or (bvslt (x!127106 lt!620544) #b00000000000000000000000000000000) (bvsgt (x!127106 lt!620544) #b01111111111111111111111111111110) (bvslt lt!620547 #b00000000000000000000000000000000) (bvsge lt!620547 (size!47079 a!2901)) (bvslt (index!45347 lt!620544) #b00000000000000000000000000000000) (bvsge (index!45347 lt!620544) (size!47079 a!2901)) (not (= lt!620544 (Intermediate!10742 false (index!45347 lt!620544) (x!127106 lt!620544))))))))

(declare-fun b!1409283 () Bool)

(assert (=> b!1409283 (= e!797699 (not e!797697))))

(declare-fun res!946323 () Bool)

(assert (=> b!1409283 (=> res!946323 e!797697)))

(get-info :version)

(assert (=> b!1409283 (= res!946323 (or (not ((_ is Intermediate!10742) lt!620544)) (undefined!11554 lt!620544)))))

(declare-fun lt!620549 () SeekEntryResult!10742)

(assert (=> b!1409283 (= lt!620549 (Found!10742 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96374 (_ BitVec 32)) SeekEntryResult!10742)

(assert (=> b!1409283 (= lt!620549 (seekEntryOrOpen!0 (select (arr!46528 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96374 (_ BitVec 32)) Bool)

(assert (=> b!1409283 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47485 0))(
  ( (Unit!47486) )
))
(declare-fun lt!620543 () Unit!47485)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47485)

(assert (=> b!1409283 (= lt!620543 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409283 (= lt!620544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620547 (select (arr!46528 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1409283 (= lt!620547 (toIndex!0 (select (arr!46528 a!2901) j!112) mask!2840))))

(declare-fun b!1409284 () Bool)

(declare-fun res!946326 () Bool)

(assert (=> b!1409284 (=> (not res!946326) (not e!797699))))

(assert (=> b!1409284 (= res!946326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409285 () Bool)

(declare-fun res!946320 () Bool)

(assert (=> b!1409285 (=> (not res!946320) (not e!797699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409285 (= res!946320 (validKeyInArray!0 (select (arr!46528 a!2901) i!1037)))))

(declare-fun b!1409286 () Bool)

(declare-fun res!946319 () Bool)

(assert (=> b!1409286 (=> (not res!946319) (not e!797699))))

(assert (=> b!1409286 (= res!946319 (validKeyInArray!0 (select (arr!46528 a!2901) j!112)))))

(declare-fun b!1409287 () Bool)

(declare-fun res!946324 () Bool)

(assert (=> b!1409287 (=> (not res!946324) (not e!797699))))

(declare-datatypes ((List!33034 0))(
  ( (Nil!33031) (Cons!33030 (h!34301 (_ BitVec 64)) (t!47720 List!33034)) )
))
(declare-fun arrayNoDuplicates!0 (array!96374 (_ BitVec 32) List!33034) Bool)

(assert (=> b!1409287 (= res!946324 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33031))))

(declare-fun b!1409288 () Bool)

(declare-fun res!946321 () Bool)

(assert (=> b!1409288 (=> (not res!946321) (not e!797699))))

(assert (=> b!1409288 (= res!946321 (and (= (size!47079 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47079 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47079 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409289 () Bool)

(assert (=> b!1409289 (= e!797698 true)))

(assert (=> b!1409289 (= lt!620549 (seekEntryOrOpen!0 lt!620546 lt!620548 mask!2840))))

(declare-fun lt!620545 () Unit!47485)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47485)

(assert (=> b!1409289 (= lt!620545 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620547 (x!127106 lt!620544) (index!45347 lt!620544) mask!2840))))

(assert (= (and start!121298 res!946327) b!1409288))

(assert (= (and b!1409288 res!946321) b!1409285))

(assert (= (and b!1409285 res!946320) b!1409286))

(assert (= (and b!1409286 res!946319) b!1409284))

(assert (= (and b!1409284 res!946326) b!1409287))

(assert (= (and b!1409287 res!946324) b!1409283))

(assert (= (and b!1409283 (not res!946323)) b!1409281))

(assert (= (and b!1409281 (not res!946325)) b!1409282))

(assert (= (and b!1409282 (not res!946322)) b!1409289))

(declare-fun m!1298689 () Bool)

(assert (=> b!1409283 m!1298689))

(declare-fun m!1298691 () Bool)

(assert (=> b!1409283 m!1298691))

(assert (=> b!1409283 m!1298689))

(declare-fun m!1298693 () Bool)

(assert (=> b!1409283 m!1298693))

(declare-fun m!1298695 () Bool)

(assert (=> b!1409283 m!1298695))

(assert (=> b!1409283 m!1298689))

(declare-fun m!1298697 () Bool)

(assert (=> b!1409283 m!1298697))

(assert (=> b!1409283 m!1298689))

(declare-fun m!1298699 () Bool)

(assert (=> b!1409283 m!1298699))

(declare-fun m!1298701 () Bool)

(assert (=> b!1409281 m!1298701))

(assert (=> b!1409281 m!1298701))

(declare-fun m!1298703 () Bool)

(assert (=> b!1409281 m!1298703))

(declare-fun m!1298705 () Bool)

(assert (=> b!1409281 m!1298705))

(declare-fun m!1298707 () Bool)

(assert (=> b!1409281 m!1298707))

(assert (=> b!1409286 m!1298689))

(assert (=> b!1409286 m!1298689))

(declare-fun m!1298709 () Bool)

(assert (=> b!1409286 m!1298709))

(declare-fun m!1298711 () Bool)

(assert (=> b!1409285 m!1298711))

(assert (=> b!1409285 m!1298711))

(declare-fun m!1298713 () Bool)

(assert (=> b!1409285 m!1298713))

(declare-fun m!1298715 () Bool)

(assert (=> b!1409289 m!1298715))

(declare-fun m!1298717 () Bool)

(assert (=> b!1409289 m!1298717))

(declare-fun m!1298719 () Bool)

(assert (=> start!121298 m!1298719))

(declare-fun m!1298721 () Bool)

(assert (=> start!121298 m!1298721))

(declare-fun m!1298723 () Bool)

(assert (=> b!1409287 m!1298723))

(declare-fun m!1298725 () Bool)

(assert (=> b!1409284 m!1298725))

(check-sat (not b!1409287) (not b!1409289) (not b!1409284) (not b!1409286) (not b!1409283) (not b!1409281) (not b!1409285) (not start!121298))
(check-sat)
