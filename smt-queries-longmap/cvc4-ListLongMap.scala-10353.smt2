; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121804 () Bool)

(assert start!121804)

(declare-datatypes ((SeekEntryResult!10953 0))(
  ( (MissingZero!10953 (index!46198 (_ BitVec 32))) (Found!10953 (index!46199 (_ BitVec 32))) (Intermediate!10953 (undefined!11765 Bool) (index!46200 (_ BitVec 32)) (x!127792 (_ BitVec 32))) (Undefined!10953) (MissingVacant!10953 (index!46201 (_ BitVec 32))) )
))
(declare-fun lt!623532 () SeekEntryResult!10953)

(declare-fun lt!623530 () (_ BitVec 32))

(declare-fun e!800450 () Bool)

(declare-datatypes ((array!96616 0))(
  ( (array!96617 (arr!46642 (Array (_ BitVec 32) (_ BitVec 64))) (size!47192 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96616)

(declare-fun lt!623527 () SeekEntryResult!10953)

(declare-fun b!1414350 () Bool)

(assert (=> b!1414350 (= e!800450 (or (bvslt (x!127792 lt!623532) #b00000000000000000000000000000000) (bvsgt (x!127792 lt!623532) #b01111111111111111111111111111110) (bvslt (x!127792 lt!623527) #b00000000000000000000000000000000) (bvsgt (x!127792 lt!623527) #b01111111111111111111111111111110) (and (bvsge lt!623530 #b00000000000000000000000000000000) (bvslt lt!623530 (size!47192 a!2901)))))))

(declare-fun e!800445 () Bool)

(assert (=> b!1414350 e!800445))

(declare-fun res!950867 () Bool)

(assert (=> b!1414350 (=> (not res!950867) (not e!800445))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1414350 (= res!950867 (and (not (undefined!11765 lt!623527)) (= (index!46200 lt!623527) i!1037) (bvslt (x!127792 lt!623527) (x!127792 lt!623532)) (= (select (store (arr!46642 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46200 lt!623527)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47880 0))(
  ( (Unit!47881) )
))
(declare-fun lt!623531 () Unit!47880)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47880)

(assert (=> b!1414350 (= lt!623531 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623530 (x!127792 lt!623532) (index!46200 lt!623532) (x!127792 lt!623527) (index!46200 lt!623527) (undefined!11765 lt!623527) mask!2840))))

(declare-fun lt!623528 () (_ BitVec 64))

(declare-fun b!1414351 () Bool)

(declare-fun lt!623526 () array!96616)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96616 (_ BitVec 32)) SeekEntryResult!10953)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96616 (_ BitVec 32)) SeekEntryResult!10953)

(assert (=> b!1414351 (= e!800445 (= (seekEntryOrOpen!0 lt!623528 lt!623526 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127792 lt!623527) (index!46200 lt!623527) (index!46200 lt!623527) (select (arr!46642 a!2901) j!112) lt!623526 mask!2840)))))

(declare-fun b!1414352 () Bool)

(declare-fun res!950871 () Bool)

(declare-fun e!800449 () Bool)

(assert (=> b!1414352 (=> (not res!950871) (not e!800449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96616 (_ BitVec 32)) Bool)

(assert (=> b!1414352 (= res!950871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414353 () Bool)

(declare-fun e!800446 () Bool)

(assert (=> b!1414353 (= e!800446 e!800450)))

(declare-fun res!950869 () Bool)

(assert (=> b!1414353 (=> res!950869 e!800450)))

(assert (=> b!1414353 (= res!950869 (or (= lt!623532 lt!623527) (not (is-Intermediate!10953 lt!623527))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96616 (_ BitVec 32)) SeekEntryResult!10953)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414353 (= lt!623527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623528 mask!2840) lt!623528 lt!623526 mask!2840))))

(assert (=> b!1414353 (= lt!623528 (select (store (arr!46642 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414353 (= lt!623526 (array!96617 (store (arr!46642 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47192 a!2901)))))

(declare-fun b!1414354 () Bool)

(declare-fun res!950868 () Bool)

(assert (=> b!1414354 (=> (not res!950868) (not e!800449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414354 (= res!950868 (validKeyInArray!0 (select (arr!46642 a!2901) i!1037)))))

(declare-fun b!1414355 () Bool)

(declare-fun res!950872 () Bool)

(assert (=> b!1414355 (=> (not res!950872) (not e!800449))))

(assert (=> b!1414355 (= res!950872 (validKeyInArray!0 (select (arr!46642 a!2901) j!112)))))

(declare-fun b!1414356 () Bool)

(declare-fun res!950870 () Bool)

(assert (=> b!1414356 (=> (not res!950870) (not e!800449))))

(declare-datatypes ((List!33161 0))(
  ( (Nil!33158) (Cons!33157 (h!34438 (_ BitVec 64)) (t!47855 List!33161)) )
))
(declare-fun arrayNoDuplicates!0 (array!96616 (_ BitVec 32) List!33161) Bool)

(assert (=> b!1414356 (= res!950870 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33158))))

(declare-fun b!1414357 () Bool)

(assert (=> b!1414357 (= e!800449 (not e!800446))))

(declare-fun res!950874 () Bool)

(assert (=> b!1414357 (=> res!950874 e!800446)))

(assert (=> b!1414357 (= res!950874 (or (not (is-Intermediate!10953 lt!623532)) (undefined!11765 lt!623532)))))

(declare-fun e!800448 () Bool)

(assert (=> b!1414357 e!800448))

(declare-fun res!950875 () Bool)

(assert (=> b!1414357 (=> (not res!950875) (not e!800448))))

(assert (=> b!1414357 (= res!950875 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623529 () Unit!47880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47880)

(assert (=> b!1414357 (= lt!623529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1414357 (= lt!623532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623530 (select (arr!46642 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1414357 (= lt!623530 (toIndex!0 (select (arr!46642 a!2901) j!112) mask!2840))))

(declare-fun b!1414358 () Bool)

(declare-fun res!950873 () Bool)

(assert (=> b!1414358 (=> (not res!950873) (not e!800449))))

(assert (=> b!1414358 (= res!950873 (and (= (size!47192 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47192 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47192 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1414359 () Bool)

(assert (=> b!1414359 (= e!800448 (= (seekEntryOrOpen!0 (select (arr!46642 a!2901) j!112) a!2901 mask!2840) (Found!10953 j!112)))))

(declare-fun res!950866 () Bool)

(assert (=> start!121804 (=> (not res!950866) (not e!800449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121804 (= res!950866 (validMask!0 mask!2840))))

(assert (=> start!121804 e!800449))

(assert (=> start!121804 true))

(declare-fun array_inv!35670 (array!96616) Bool)

(assert (=> start!121804 (array_inv!35670 a!2901)))

(assert (= (and start!121804 res!950866) b!1414358))

(assert (= (and b!1414358 res!950873) b!1414354))

(assert (= (and b!1414354 res!950868) b!1414355))

(assert (= (and b!1414355 res!950872) b!1414352))

(assert (= (and b!1414352 res!950871) b!1414356))

(assert (= (and b!1414356 res!950870) b!1414357))

(assert (= (and b!1414357 res!950875) b!1414359))

(assert (= (and b!1414357 (not res!950874)) b!1414353))

(assert (= (and b!1414353 (not res!950869)) b!1414350))

(assert (= (and b!1414350 res!950867) b!1414351))

(declare-fun m!1304667 () Bool)

(assert (=> b!1414356 m!1304667))

(declare-fun m!1304669 () Bool)

(assert (=> b!1414355 m!1304669))

(assert (=> b!1414355 m!1304669))

(declare-fun m!1304671 () Bool)

(assert (=> b!1414355 m!1304671))

(assert (=> b!1414359 m!1304669))

(assert (=> b!1414359 m!1304669))

(declare-fun m!1304673 () Bool)

(assert (=> b!1414359 m!1304673))

(declare-fun m!1304675 () Bool)

(assert (=> b!1414353 m!1304675))

(assert (=> b!1414353 m!1304675))

(declare-fun m!1304677 () Bool)

(assert (=> b!1414353 m!1304677))

(declare-fun m!1304679 () Bool)

(assert (=> b!1414353 m!1304679))

(declare-fun m!1304681 () Bool)

(assert (=> b!1414353 m!1304681))

(declare-fun m!1304683 () Bool)

(assert (=> b!1414354 m!1304683))

(assert (=> b!1414354 m!1304683))

(declare-fun m!1304685 () Bool)

(assert (=> b!1414354 m!1304685))

(declare-fun m!1304687 () Bool)

(assert (=> b!1414352 m!1304687))

(assert (=> b!1414357 m!1304669))

(declare-fun m!1304689 () Bool)

(assert (=> b!1414357 m!1304689))

(assert (=> b!1414357 m!1304669))

(declare-fun m!1304691 () Bool)

(assert (=> b!1414357 m!1304691))

(assert (=> b!1414357 m!1304669))

(declare-fun m!1304693 () Bool)

(assert (=> b!1414357 m!1304693))

(declare-fun m!1304695 () Bool)

(assert (=> b!1414357 m!1304695))

(declare-fun m!1304697 () Bool)

(assert (=> b!1414351 m!1304697))

(assert (=> b!1414351 m!1304669))

(assert (=> b!1414351 m!1304669))

(declare-fun m!1304699 () Bool)

(assert (=> b!1414351 m!1304699))

(declare-fun m!1304701 () Bool)

(assert (=> start!121804 m!1304701))

(declare-fun m!1304703 () Bool)

(assert (=> start!121804 m!1304703))

(assert (=> b!1414350 m!1304679))

(declare-fun m!1304705 () Bool)

(assert (=> b!1414350 m!1304705))

(declare-fun m!1304707 () Bool)

(assert (=> b!1414350 m!1304707))

(push 1)

(assert (not b!1414359))

(assert (not b!1414354))

(assert (not b!1414351))

(assert (not b!1414356))

(assert (not b!1414357))

(assert (not b!1414352))

(assert (not b!1414355))

(assert (not b!1414350))

(assert (not start!121804))

(assert (not b!1414353))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1414431 () Bool)

(declare-fun e!800498 () Bool)

(declare-fun call!67147 () Bool)

(assert (=> b!1414431 (= e!800498 call!67147)))

(declare-fun b!1414432 () Bool)

(declare-fun e!800497 () Bool)

(assert (=> b!1414432 (= e!800497 e!800498)))

(declare-fun c!131244 () Bool)

(assert (=> b!1414432 (= c!131244 (validKeyInArray!0 (select (arr!46642 a!2901) j!112)))))

(declare-fun b!1414433 () Bool)

(declare-fun e!800496 () Bool)

(assert (=> b!1414433 (= e!800498 e!800496)))

(declare-fun lt!623566 () (_ BitVec 64))

(assert (=> b!1414433 (= lt!623566 (select (arr!46642 a!2901) j!112))))

(declare-fun lt!623568 () Unit!47880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96616 (_ BitVec 64) (_ BitVec 32)) Unit!47880)

(assert (=> b!1414433 (= lt!623568 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623566 j!112))))

(declare-fun arrayContainsKey!0 (array!96616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1414433 (arrayContainsKey!0 a!2901 lt!623566 #b00000000000000000000000000000000)))

(declare-fun lt!623567 () Unit!47880)

(assert (=> b!1414433 (= lt!623567 lt!623568)))

(declare-fun res!950896 () Bool)

(assert (=> b!1414433 (= res!950896 (= (seekEntryOrOpen!0 (select (arr!46642 a!2901) j!112) a!2901 mask!2840) (Found!10953 j!112)))))

(assert (=> b!1414433 (=> (not res!950896) (not e!800496))))

(declare-fun bm!67144 () Bool)

(assert (=> bm!67144 (= call!67147 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152323 () Bool)

(declare-fun res!950895 () Bool)

(assert (=> d!152323 (=> res!950895 e!800497)))

(assert (=> d!152323 (= res!950895 (bvsge j!112 (size!47192 a!2901)))))

(assert (=> d!152323 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800497)))

(declare-fun b!1414434 () Bool)

(assert (=> b!1414434 (= e!800496 call!67147)))

(assert (= (and d!152323 (not res!950895)) b!1414432))

(assert (= (and b!1414432 c!131244) b!1414433))

(assert (= (and b!1414432 (not c!131244)) b!1414431))

(assert (= (and b!1414433 res!950896) b!1414434))

(assert (= (or b!1414434 b!1414431) bm!67144))

(assert (=> b!1414432 m!1304669))

(assert (=> b!1414432 m!1304669))

(assert (=> b!1414432 m!1304671))

(assert (=> b!1414433 m!1304669))

(declare-fun m!1304745 () Bool)

(assert (=> b!1414433 m!1304745))

(declare-fun m!1304747 () Bool)

(assert (=> b!1414433 m!1304747))

(assert (=> b!1414433 m!1304669))

(assert (=> b!1414433 m!1304673))

(declare-fun m!1304751 () Bool)

(assert (=> bm!67144 m!1304751))

(assert (=> b!1414357 d!152323))

(declare-fun d!152335 () Bool)

(assert (=> d!152335 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623571 () Unit!47880)

(declare-fun choose!38 (array!96616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47880)

(assert (=> d!152335 (= lt!623571 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152335 (validMask!0 mask!2840)))

(assert (=> d!152335 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623571)))

(declare-fun bs!41235 () Bool)

(assert (= bs!41235 d!152335))

(assert (=> bs!41235 m!1304695))

(declare-fun m!1304753 () Bool)

(assert (=> bs!41235 m!1304753))

(assert (=> bs!41235 m!1304701))

(assert (=> b!1414357 d!152335))

(declare-fun b!1414507 () Bool)

(declare-fun e!800539 () SeekEntryResult!10953)

(assert (=> b!1414507 (= e!800539 (Intermediate!10953 true lt!623530 #b00000000000000000000000000000000))))

(declare-fun e!800540 () SeekEntryResult!10953)

(declare-fun b!1414508 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414508 (= e!800540 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623530 #b00000000000000000000000000000000 mask!2840) (select (arr!46642 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414509 () Bool)

(declare-fun lt!623592 () SeekEntryResult!10953)

(assert (=> b!1414509 (and (bvsge (index!46200 lt!623592) #b00000000000000000000000000000000) (bvslt (index!46200 lt!623592) (size!47192 a!2901)))))

(declare-fun res!950925 () Bool)

(assert (=> b!1414509 (= res!950925 (= (select (arr!46642 a!2901) (index!46200 lt!623592)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800542 () Bool)

(assert (=> b!1414509 (=> res!950925 e!800542)))

(declare-fun d!152337 () Bool)

(declare-fun e!800541 () Bool)

(assert (=> d!152337 e!800541))

(declare-fun c!131269 () Bool)

(assert (=> d!152337 (= c!131269 (and (is-Intermediate!10953 lt!623592) (undefined!11765 lt!623592)))))

(assert (=> d!152337 (= lt!623592 e!800539)))

(declare-fun c!131270 () Bool)

(assert (=> d!152337 (= c!131270 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623595 () (_ BitVec 64))

(assert (=> d!152337 (= lt!623595 (select (arr!46642 a!2901) lt!623530))))

(assert (=> d!152337 (validMask!0 mask!2840)))

(assert (=> d!152337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623530 (select (arr!46642 a!2901) j!112) a!2901 mask!2840) lt!623592)))

(declare-fun b!1414510 () Bool)

(declare-fun e!800543 () Bool)

(assert (=> b!1414510 (= e!800541 e!800543)))

(declare-fun res!950923 () Bool)

(assert (=> b!1414510 (= res!950923 (and (is-Intermediate!10953 lt!623592) (not (undefined!11765 lt!623592)) (bvslt (x!127792 lt!623592) #b01111111111111111111111111111110) (bvsge (x!127792 lt!623592) #b00000000000000000000000000000000) (bvsge (x!127792 lt!623592) #b00000000000000000000000000000000)))))

(assert (=> b!1414510 (=> (not res!950923) (not e!800543))))

(declare-fun b!1414511 () Bool)

(assert (=> b!1414511 (and (bvsge (index!46200 lt!623592) #b00000000000000000000000000000000) (bvslt (index!46200 lt!623592) (size!47192 a!2901)))))

(declare-fun res!950924 () Bool)

(assert (=> b!1414511 (= res!950924 (= (select (arr!46642 a!2901) (index!46200 lt!623592)) (select (arr!46642 a!2901) j!112)))))

(assert (=> b!1414511 (=> res!950924 e!800542)))

(assert (=> b!1414511 (= e!800543 e!800542)))

(declare-fun b!1414512 () Bool)

(assert (=> b!1414512 (= e!800540 (Intermediate!10953 false lt!623530 #b00000000000000000000000000000000))))

(declare-fun b!1414513 () Bool)

(assert (=> b!1414513 (and (bvsge (index!46200 lt!623592) #b00000000000000000000000000000000) (bvslt (index!46200 lt!623592) (size!47192 a!2901)))))

(assert (=> b!1414513 (= e!800542 (= (select (arr!46642 a!2901) (index!46200 lt!623592)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414514 () Bool)

(assert (=> b!1414514 (= e!800539 e!800540)))

(declare-fun c!131271 () Bool)

(assert (=> b!1414514 (= c!131271 (or (= lt!623595 (select (arr!46642 a!2901) j!112)) (= (bvadd lt!623595 lt!623595) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414515 () Bool)

(assert (=> b!1414515 (= e!800541 (bvsge (x!127792 lt!623592) #b01111111111111111111111111111110))))

(assert (= (and d!152337 c!131270) b!1414507))

(assert (= (and d!152337 (not c!131270)) b!1414514))

(assert (= (and b!1414514 c!131271) b!1414512))

(assert (= (and b!1414514 (not c!131271)) b!1414508))

(assert (= (and d!152337 c!131269) b!1414515))

(assert (= (and d!152337 (not c!131269)) b!1414510))

(assert (= (and b!1414510 res!950923) b!1414511))

(assert (= (and b!1414511 (not res!950924)) b!1414509))

(assert (= (and b!1414509 (not res!950925)) b!1414513))

(declare-fun m!1304771 () Bool)

(assert (=> b!1414513 m!1304771))

(declare-fun m!1304773 () Bool)

(assert (=> b!1414508 m!1304773))

(assert (=> b!1414508 m!1304773))

(assert (=> b!1414508 m!1304669))

(declare-fun m!1304775 () Bool)

(assert (=> b!1414508 m!1304775))

(assert (=> b!1414511 m!1304771))

(declare-fun m!1304777 () Bool)

(assert (=> d!152337 m!1304777))

(assert (=> d!152337 m!1304701))

(assert (=> b!1414509 m!1304771))

(assert (=> b!1414357 d!152337))

(declare-fun d!152345 () Bool)

(declare-fun lt!623610 () (_ BitVec 32))

(declare-fun lt!623609 () (_ BitVec 32))

(assert (=> d!152345 (= lt!623610 (bvmul (bvxor lt!623609 (bvlshr lt!623609 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152345 (= lt!623609 ((_ extract 31 0) (bvand (bvxor (select (arr!46642 a!2901) j!112) (bvlshr (select (arr!46642 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152345 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950926 (let ((h!34441 ((_ extract 31 0) (bvand (bvxor (select (arr!46642 a!2901) j!112) (bvlshr (select (arr!46642 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127800 (bvmul (bvxor h!34441 (bvlshr h!34441 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127800 (bvlshr x!127800 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950926 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950926 #b00000000000000000000000000000000))))))

(assert (=> d!152345 (= (toIndex!0 (select (arr!46642 a!2901) j!112) mask!2840) (bvand (bvxor lt!623610 (bvlshr lt!623610 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414357 d!152345))

(declare-fun b!1414522 () Bool)

(declare-fun e!800549 () Bool)

(declare-fun call!67148 () Bool)

(assert (=> b!1414522 (= e!800549 call!67148)))

(declare-fun b!1414523 () Bool)

(declare-fun e!800548 () Bool)

(assert (=> b!1414523 (= e!800548 e!800549)))

(declare-fun c!131275 () Bool)

(assert (=> b!1414523 (= c!131275 (validKeyInArray!0 (select (arr!46642 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414524 () Bool)

(declare-fun e!800547 () Bool)

(assert (=> b!1414524 (= e!800549 e!800547)))

(declare-fun lt!623611 () (_ BitVec 64))

(assert (=> b!1414524 (= lt!623611 (select (arr!46642 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623613 () Unit!47880)

(assert (=> b!1414524 (= lt!623613 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623611 #b00000000000000000000000000000000))))

(assert (=> b!1414524 (arrayContainsKey!0 a!2901 lt!623611 #b00000000000000000000000000000000)))

(declare-fun lt!623612 () Unit!47880)

(assert (=> b!1414524 (= lt!623612 lt!623613)))

(declare-fun res!950928 () Bool)

(assert (=> b!1414524 (= res!950928 (= (seekEntryOrOpen!0 (select (arr!46642 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10953 #b00000000000000000000000000000000)))))

(assert (=> b!1414524 (=> (not res!950928) (not e!800547))))

(declare-fun bm!67145 () Bool)

(assert (=> bm!67145 (= call!67148 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152351 () Bool)

(declare-fun res!950927 () Bool)

(assert (=> d!152351 (=> res!950927 e!800548)))

(assert (=> d!152351 (= res!950927 (bvsge #b00000000000000000000000000000000 (size!47192 a!2901)))))

(assert (=> d!152351 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800548)))

(declare-fun b!1414525 () Bool)

(assert (=> b!1414525 (= e!800547 call!67148)))

(assert (= (and d!152351 (not res!950927)) b!1414523))

(assert (= (and b!1414523 c!131275) b!1414524))

(assert (= (and b!1414523 (not c!131275)) b!1414522))

(assert (= (and b!1414524 res!950928) b!1414525))

(assert (= (or b!1414525 b!1414522) bm!67145))

(declare-fun m!1304791 () Bool)

(assert (=> b!1414523 m!1304791))

(assert (=> b!1414523 m!1304791))

(declare-fun m!1304793 () Bool)

(assert (=> b!1414523 m!1304793))

(assert (=> b!1414524 m!1304791))

(declare-fun m!1304795 () Bool)

(assert (=> b!1414524 m!1304795))

(declare-fun m!1304797 () Bool)

(assert (=> b!1414524 m!1304797))

(assert (=> b!1414524 m!1304791))

(declare-fun m!1304799 () Bool)

(assert (=> b!1414524 m!1304799))

(declare-fun m!1304801 () Bool)

(assert (=> bm!67145 m!1304801))

(assert (=> b!1414352 d!152351))

(declare-fun b!1414526 () Bool)

(declare-fun e!800550 () SeekEntryResult!10953)

(assert (=> b!1414526 (= e!800550 (Intermediate!10953 true (toIndex!0 lt!623528 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414527 () Bool)

(declare-fun e!800551 () SeekEntryResult!10953)

(assert (=> b!1414527 (= e!800551 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623528 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623528 lt!623526 mask!2840))))

(declare-fun b!1414528 () Bool)

(declare-fun lt!623614 () SeekEntryResult!10953)

(assert (=> b!1414528 (and (bvsge (index!46200 lt!623614) #b00000000000000000000000000000000) (bvslt (index!46200 lt!623614) (size!47192 lt!623526)))))

(declare-fun res!950931 () Bool)

(assert (=> b!1414528 (= res!950931 (= (select (arr!46642 lt!623526) (index!46200 lt!623614)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800553 () Bool)

(assert (=> b!1414528 (=> res!950931 e!800553)))

(declare-fun d!152353 () Bool)

(declare-fun e!800552 () Bool)

(assert (=> d!152353 e!800552))

(declare-fun c!131276 () Bool)

(assert (=> d!152353 (= c!131276 (and (is-Intermediate!10953 lt!623614) (undefined!11765 lt!623614)))))

(assert (=> d!152353 (= lt!623614 e!800550)))

(declare-fun c!131277 () Bool)

(assert (=> d!152353 (= c!131277 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623615 () (_ BitVec 64))

(assert (=> d!152353 (= lt!623615 (select (arr!46642 lt!623526) (toIndex!0 lt!623528 mask!2840)))))

(assert (=> d!152353 (validMask!0 mask!2840)))

(assert (=> d!152353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623528 mask!2840) lt!623528 lt!623526 mask!2840) lt!623614)))

(declare-fun b!1414529 () Bool)

(declare-fun e!800554 () Bool)

(assert (=> b!1414529 (= e!800552 e!800554)))

(declare-fun res!950929 () Bool)

(assert (=> b!1414529 (= res!950929 (and (is-Intermediate!10953 lt!623614) (not (undefined!11765 lt!623614)) (bvslt (x!127792 lt!623614) #b01111111111111111111111111111110) (bvsge (x!127792 lt!623614) #b00000000000000000000000000000000) (bvsge (x!127792 lt!623614) #b00000000000000000000000000000000)))))

(assert (=> b!1414529 (=> (not res!950929) (not e!800554))))

(declare-fun b!1414530 () Bool)

(assert (=> b!1414530 (and (bvsge (index!46200 lt!623614) #b00000000000000000000000000000000) (bvslt (index!46200 lt!623614) (size!47192 lt!623526)))))

(declare-fun res!950930 () Bool)

(assert (=> b!1414530 (= res!950930 (= (select (arr!46642 lt!623526) (index!46200 lt!623614)) lt!623528))))

(assert (=> b!1414530 (=> res!950930 e!800553)))

(assert (=> b!1414530 (= e!800554 e!800553)))

(declare-fun b!1414531 () Bool)

(assert (=> b!1414531 (= e!800551 (Intermediate!10953 false (toIndex!0 lt!623528 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414532 () Bool)

(assert (=> b!1414532 (and (bvsge (index!46200 lt!623614) #b00000000000000000000000000000000) (bvslt (index!46200 lt!623614) (size!47192 lt!623526)))))

(assert (=> b!1414532 (= e!800553 (= (select (arr!46642 lt!623526) (index!46200 lt!623614)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414533 () Bool)

(assert (=> b!1414533 (= e!800550 e!800551)))

(declare-fun c!131278 () Bool)

(assert (=> b!1414533 (= c!131278 (or (= lt!623615 lt!623528) (= (bvadd lt!623615 lt!623615) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414534 () Bool)

(assert (=> b!1414534 (= e!800552 (bvsge (x!127792 lt!623614) #b01111111111111111111111111111110))))

(assert (= (and d!152353 c!131277) b!1414526))

(assert (= (and d!152353 (not c!131277)) b!1414533))

(assert (= (and b!1414533 c!131278) b!1414531))

(assert (= (and b!1414533 (not c!131278)) b!1414527))

(assert (= (and d!152353 c!131276) b!1414534))

(assert (= (and d!152353 (not c!131276)) b!1414529))

(assert (= (and b!1414529 res!950929) b!1414530))

(assert (= (and b!1414530 (not res!950930)) b!1414528))

(assert (= (and b!1414528 (not res!950931)) b!1414532))

(declare-fun m!1304803 () Bool)

(assert (=> b!1414532 m!1304803))

(assert (=> b!1414527 m!1304675))

(declare-fun m!1304805 () Bool)

(assert (=> b!1414527 m!1304805))

(assert (=> b!1414527 m!1304805))

(declare-fun m!1304807 () Bool)

(assert (=> b!1414527 m!1304807))

(assert (=> b!1414530 m!1304803))

(assert (=> d!152353 m!1304675))

(declare-fun m!1304809 () Bool)

(assert (=> d!152353 m!1304809))

(assert (=> d!152353 m!1304701))

(assert (=> b!1414528 m!1304803))

(assert (=> b!1414353 d!152353))

(declare-fun d!152355 () Bool)

(declare-fun lt!623617 () (_ BitVec 32))

(declare-fun lt!623616 () (_ BitVec 32))

(assert (=> d!152355 (= lt!623617 (bvmul (bvxor lt!623616 (bvlshr lt!623616 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152355 (= lt!623616 ((_ extract 31 0) (bvand (bvxor lt!623528 (bvlshr lt!623528 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152355 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950926 (let ((h!34441 ((_ extract 31 0) (bvand (bvxor lt!623528 (bvlshr lt!623528 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127800 (bvmul (bvxor h!34441 (bvlshr h!34441 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127800 (bvlshr x!127800 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950926 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950926 #b00000000000000000000000000000000))))))

(assert (=> d!152355 (= (toIndex!0 lt!623528 mask!2840) (bvand (bvxor lt!623617 (bvlshr lt!623617 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414353 d!152355))

(declare-fun b!1414581 () Bool)

(declare-fun e!800584 () SeekEntryResult!10953)

(assert (=> b!1414581 (= e!800584 Undefined!10953)))

(declare-fun b!1414582 () Bool)

(declare-fun c!131297 () Bool)

(declare-fun lt!623654 () (_ BitVec 64))

(assert (=> b!1414582 (= c!131297 (= lt!623654 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800585 () SeekEntryResult!10953)

(declare-fun e!800583 () SeekEntryResult!10953)

(assert (=> b!1414582 (= e!800585 e!800583)))

(declare-fun d!152357 () Bool)

(declare-fun lt!623653 () SeekEntryResult!10953)

(assert (=> d!152357 (and (or (is-Undefined!10953 lt!623653) (not (is-Found!10953 lt!623653)) (and (bvsge (index!46199 lt!623653) #b00000000000000000000000000000000) (bvslt (index!46199 lt!623653) (size!47192 a!2901)))) (or (is-Undefined!10953 lt!623653) (is-Found!10953 lt!623653) (not (is-MissingZero!10953 lt!623653)) (and (bvsge (index!46198 lt!623653) #b00000000000000000000000000000000) (bvslt (index!46198 lt!623653) (size!47192 a!2901)))) (or (is-Undefined!10953 lt!623653) (is-Found!10953 lt!623653) (is-MissingZero!10953 lt!623653) (not (is-MissingVacant!10953 lt!623653)) (and (bvsge (index!46201 lt!623653) #b00000000000000000000000000000000) (bvslt (index!46201 lt!623653) (size!47192 a!2901)))) (or (is-Undefined!10953 lt!623653) (ite (is-Found!10953 lt!623653) (= (select (arr!46642 a!2901) (index!46199 lt!623653)) (select (arr!46642 a!2901) j!112)) (ite (is-MissingZero!10953 lt!623653) (= (select (arr!46642 a!2901) (index!46198 lt!623653)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10953 lt!623653) (= (select (arr!46642 a!2901) (index!46201 lt!623653)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152357 (= lt!623653 e!800584)))

(declare-fun c!131296 () Bool)

(declare-fun lt!623655 () SeekEntryResult!10953)

(assert (=> d!152357 (= c!131296 (and (is-Intermediate!10953 lt!623655) (undefined!11765 lt!623655)))))

(assert (=> d!152357 (= lt!623655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46642 a!2901) j!112) mask!2840) (select (arr!46642 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152357 (validMask!0 mask!2840)))

(assert (=> d!152357 (= (seekEntryOrOpen!0 (select (arr!46642 a!2901) j!112) a!2901 mask!2840) lt!623653)))

(declare-fun b!1414583 () Bool)

(assert (=> b!1414583 (= e!800585 (Found!10953 (index!46200 lt!623655)))))

(declare-fun b!1414584 () Bool)

(assert (=> b!1414584 (= e!800584 e!800585)))

(assert (=> b!1414584 (= lt!623654 (select (arr!46642 a!2901) (index!46200 lt!623655)))))

(declare-fun c!131295 () Bool)

(assert (=> b!1414584 (= c!131295 (= lt!623654 (select (arr!46642 a!2901) j!112)))))

(declare-fun b!1414585 () Bool)

(assert (=> b!1414585 (= e!800583 (seekKeyOrZeroReturnVacant!0 (x!127792 lt!623655) (index!46200 lt!623655) (index!46200 lt!623655) (select (arr!46642 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414586 () Bool)

(assert (=> b!1414586 (= e!800583 (MissingZero!10953 (index!46200 lt!623655)))))

(assert (= (and d!152357 c!131296) b!1414581))

(assert (= (and d!152357 (not c!131296)) b!1414584))

(assert (= (and b!1414584 c!131295) b!1414583))

(assert (= (and b!1414584 (not c!131295)) b!1414582))

(assert (= (and b!1414582 c!131297) b!1414586))

(assert (= (and b!1414582 (not c!131297)) b!1414585))

(assert (=> d!152357 m!1304669))

(assert (=> d!152357 m!1304691))

(assert (=> d!152357 m!1304701))

(declare-fun m!1304855 () Bool)

(assert (=> d!152357 m!1304855))

(assert (=> d!152357 m!1304691))

(assert (=> d!152357 m!1304669))

(declare-fun m!1304859 () Bool)

(assert (=> d!152357 m!1304859))

(declare-fun m!1304861 () Bool)

(assert (=> d!152357 m!1304861))

(declare-fun m!1304863 () Bool)

(assert (=> d!152357 m!1304863))

(declare-fun m!1304865 () Bool)

(assert (=> b!1414584 m!1304865))

(assert (=> b!1414585 m!1304669))

(declare-fun m!1304867 () Bool)

(assert (=> b!1414585 m!1304867))

(assert (=> b!1414359 d!152357))

(declare-fun d!152393 () Bool)

(assert (=> d!152393 (= (validKeyInArray!0 (select (arr!46642 a!2901) i!1037)) (and (not (= (select (arr!46642 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46642 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414354 d!152393))

(declare-fun d!152395 () Bool)

(assert (=> d!152395 (= (validKeyInArray!0 (select (arr!46642 a!2901) j!112)) (and (not (= (select (arr!46642 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46642 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414355 d!152395))

(declare-fun d!152397 () Bool)

(assert (=> d!152397 (and (not (undefined!11765 lt!623527)) (= (index!46200 lt!623527) i!1037) (bvslt (x!127792 lt!623527) (x!127792 lt!623532)))))

(declare-fun lt!623661 () Unit!47880)

(declare-fun choose!62 (array!96616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47880)

(assert (=> d!152397 (= lt!623661 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623530 (x!127792 lt!623532) (index!46200 lt!623532) (x!127792 lt!623527) (index!46200 lt!623527) (undefined!11765 lt!623527) mask!2840))))

(assert (=> d!152397 (validMask!0 mask!2840)))

(assert (=> d!152397 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623530 (x!127792 lt!623532) (index!46200 lt!623532) (x!127792 lt!623527) (index!46200 lt!623527) (undefined!11765 lt!623527) mask!2840) lt!623661)))

(declare-fun bs!41239 () Bool)

(assert (= bs!41239 d!152397))

(declare-fun m!1304869 () Bool)

(assert (=> bs!41239 m!1304869))

(assert (=> bs!41239 m!1304701))

(assert (=> b!1414350 d!152397))

(declare-fun b!1414616 () Bool)

(declare-fun e!800609 () Bool)

(declare-fun e!800610 () Bool)

(assert (=> b!1414616 (= e!800609 e!800610)))

(declare-fun c!131304 () Bool)

(assert (=> b!1414616 (= c!131304 (validKeyInArray!0 (select (arr!46642 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152399 () Bool)

(declare-fun res!950963 () Bool)

(declare-fun e!800611 () Bool)

(assert (=> d!152399 (=> res!950963 e!800611)))

(assert (=> d!152399 (= res!950963 (bvsge #b00000000000000000000000000000000 (size!47192 a!2901)))))

(assert (=> d!152399 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33158) e!800611)))

(declare-fun b!1414617 () Bool)

(declare-fun e!800612 () Bool)

(declare-fun contains!9821 (List!33161 (_ BitVec 64)) Bool)

(assert (=> b!1414617 (= e!800612 (contains!9821 Nil!33158 (select (arr!46642 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414618 () Bool)

(declare-fun call!67159 () Bool)

(assert (=> b!1414618 (= e!800610 call!67159)))

(declare-fun bm!67156 () Bool)

(assert (=> bm!67156 (= call!67159 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131304 (Cons!33157 (select (arr!46642 a!2901) #b00000000000000000000000000000000) Nil!33158) Nil!33158)))))

(declare-fun b!1414619 () Bool)

(assert (=> b!1414619 (= e!800610 call!67159)))

(declare-fun b!1414620 () Bool)

(assert (=> b!1414620 (= e!800611 e!800609)))

(declare-fun res!950965 () Bool)

(assert (=> b!1414620 (=> (not res!950965) (not e!800609))))

(assert (=> b!1414620 (= res!950965 (not e!800612))))

(declare-fun res!950964 () Bool)

(assert (=> b!1414620 (=> (not res!950964) (not e!800612))))

(assert (=> b!1414620 (= res!950964 (validKeyInArray!0 (select (arr!46642 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152399 (not res!950963)) b!1414620))

(assert (= (and b!1414620 res!950964) b!1414617))

(assert (= (and b!1414620 res!950965) b!1414616))

(assert (= (and b!1414616 c!131304) b!1414618))

(assert (= (and b!1414616 (not c!131304)) b!1414619))

(assert (= (or b!1414618 b!1414619) bm!67156))

(assert (=> b!1414616 m!1304791))

(assert (=> b!1414616 m!1304791))

(assert (=> b!1414616 m!1304793))

(assert (=> b!1414617 m!1304791))

(assert (=> b!1414617 m!1304791))

(declare-fun m!1304875 () Bool)

(assert (=> b!1414617 m!1304875))

(assert (=> bm!67156 m!1304791))

(declare-fun m!1304877 () Bool)

(assert (=> bm!67156 m!1304877))

(assert (=> b!1414620 m!1304791))

(assert (=> b!1414620 m!1304791))

(assert (=> b!1414620 m!1304793))

(assert (=> b!1414356 d!152399))

(declare-fun d!152401 () Bool)

(assert (=> d!152401 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121804 d!152401))

(declare-fun d!152405 () Bool)

(assert (=> d!152405 (= (array_inv!35670 a!2901) (bvsge (size!47192 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121804 d!152405))

(declare-fun b!1414639 () Bool)

(declare-fun e!800623 () SeekEntryResult!10953)

(assert (=> b!1414639 (= e!800623 Undefined!10953)))

(declare-fun b!1414640 () Bool)

(declare-fun c!131316 () Bool)

(declare-fun lt!623672 () (_ BitVec 64))

(assert (=> b!1414640 (= c!131316 (= lt!623672 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800624 () SeekEntryResult!10953)

(declare-fun e!800622 () SeekEntryResult!10953)

(assert (=> b!1414640 (= e!800624 e!800622)))

(declare-fun d!152407 () Bool)

(declare-fun lt!623671 () SeekEntryResult!10953)

(assert (=> d!152407 (and (or (is-Undefined!10953 lt!623671) (not (is-Found!10953 lt!623671)) (and (bvsge (index!46199 lt!623671) #b00000000000000000000000000000000) (bvslt (index!46199 lt!623671) (size!47192 lt!623526)))) (or (is-Undefined!10953 lt!623671) (is-Found!10953 lt!623671) (not (is-MissingZero!10953 lt!623671)) (and (bvsge (index!46198 lt!623671) #b00000000000000000000000000000000) (bvslt (index!46198 lt!623671) (size!47192 lt!623526)))) (or (is-Undefined!10953 lt!623671) (is-Found!10953 lt!623671) (is-MissingZero!10953 lt!623671) (not (is-MissingVacant!10953 lt!623671)) (and (bvsge (index!46201 lt!623671) #b00000000000000000000000000000000) (bvslt (index!46201 lt!623671) (size!47192 lt!623526)))) (or (is-Undefined!10953 lt!623671) (ite (is-Found!10953 lt!623671) (= (select (arr!46642 lt!623526) (index!46199 lt!623671)) lt!623528) (ite (is-MissingZero!10953 lt!623671) (= (select (arr!46642 lt!623526) (index!46198 lt!623671)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10953 lt!623671) (= (select (arr!46642 lt!623526) (index!46201 lt!623671)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152407 (= lt!623671 e!800623)))

(declare-fun c!131315 () Bool)

(declare-fun lt!623673 () SeekEntryResult!10953)

(assert (=> d!152407 (= c!131315 (and (is-Intermediate!10953 lt!623673) (undefined!11765 lt!623673)))))

(assert (=> d!152407 (= lt!623673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623528 mask!2840) lt!623528 lt!623526 mask!2840))))

(assert (=> d!152407 (validMask!0 mask!2840)))

(assert (=> d!152407 (= (seekEntryOrOpen!0 lt!623528 lt!623526 mask!2840) lt!623671)))

(declare-fun b!1414641 () Bool)

(assert (=> b!1414641 (= e!800624 (Found!10953 (index!46200 lt!623673)))))

(declare-fun b!1414642 () Bool)

(assert (=> b!1414642 (= e!800623 e!800624)))

(assert (=> b!1414642 (= lt!623672 (select (arr!46642 lt!623526) (index!46200 lt!623673)))))

(declare-fun c!131314 () Bool)

(assert (=> b!1414642 (= c!131314 (= lt!623672 lt!623528))))

(declare-fun b!1414643 () Bool)

(assert (=> b!1414643 (= e!800622 (seekKeyOrZeroReturnVacant!0 (x!127792 lt!623673) (index!46200 lt!623673) (index!46200 lt!623673) lt!623528 lt!623526 mask!2840))))

(declare-fun b!1414644 () Bool)

(assert (=> b!1414644 (= e!800622 (MissingZero!10953 (index!46200 lt!623673)))))

(assert (= (and d!152407 c!131315) b!1414639))

(assert (= (and d!152407 (not c!131315)) b!1414642))

(assert (= (and b!1414642 c!131314) b!1414641))

(assert (= (and b!1414642 (not c!131314)) b!1414640))

(assert (= (and b!1414640 c!131316) b!1414644))

(assert (= (and b!1414640 (not c!131316)) b!1414643))

(assert (=> d!152407 m!1304675))

(assert (=> d!152407 m!1304701))

(declare-fun m!1304889 () Bool)

(assert (=> d!152407 m!1304889))

(assert (=> d!152407 m!1304675))

(assert (=> d!152407 m!1304677))

(declare-fun m!1304891 () Bool)

(assert (=> d!152407 m!1304891))

(declare-fun m!1304893 () Bool)

(assert (=> d!152407 m!1304893))

(declare-fun m!1304895 () Bool)

(assert (=> b!1414642 m!1304895))

(declare-fun m!1304897 () Bool)

(assert (=> b!1414643 m!1304897))

(assert (=> b!1414351 d!152407))

(declare-fun b!1414675 () Bool)

(declare-fun e!800640 () SeekEntryResult!10953)

(declare-fun e!800641 () SeekEntryResult!10953)

(assert (=> b!1414675 (= e!800640 e!800641)))

(declare-fun c!131333 () Bool)

(declare-fun lt!623685 () (_ BitVec 64))

(assert (=> b!1414675 (= c!131333 (= lt!623685 (select (arr!46642 a!2901) j!112)))))

(declare-fun e!800642 () SeekEntryResult!10953)

(declare-fun b!1414676 () Bool)

(assert (=> b!1414676 (= e!800642 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127792 lt!623527) #b00000000000000000000000000000001) (nextIndex!0 (index!46200 lt!623527) (x!127792 lt!623527) mask!2840) (index!46200 lt!623527) (select (arr!46642 a!2901) j!112) lt!623526 mask!2840))))

(declare-fun b!1414677 () Bool)

(assert (=> b!1414677 (= e!800642 (MissingVacant!10953 (index!46200 lt!623527)))))

(declare-fun b!1414678 () Bool)

(declare-fun c!131332 () Bool)

(assert (=> b!1414678 (= c!131332 (= lt!623685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414678 (= e!800641 e!800642)))

(declare-fun d!152409 () Bool)

(declare-fun lt!623684 () SeekEntryResult!10953)

(assert (=> d!152409 (and (or (is-Undefined!10953 lt!623684) (not (is-Found!10953 lt!623684)) (and (bvsge (index!46199 lt!623684) #b00000000000000000000000000000000) (bvslt (index!46199 lt!623684) (size!47192 lt!623526)))) (or (is-Undefined!10953 lt!623684) (is-Found!10953 lt!623684) (not (is-MissingVacant!10953 lt!623684)) (not (= (index!46201 lt!623684) (index!46200 lt!623527))) (and (bvsge (index!46201 lt!623684) #b00000000000000000000000000000000) (bvslt (index!46201 lt!623684) (size!47192 lt!623526)))) (or (is-Undefined!10953 lt!623684) (ite (is-Found!10953 lt!623684) (= (select (arr!46642 lt!623526) (index!46199 lt!623684)) (select (arr!46642 a!2901) j!112)) (and (is-MissingVacant!10953 lt!623684) (= (index!46201 lt!623684) (index!46200 lt!623527)) (= (select (arr!46642 lt!623526) (index!46201 lt!623684)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152409 (= lt!623684 e!800640)))

(declare-fun c!131334 () Bool)

(assert (=> d!152409 (= c!131334 (bvsge (x!127792 lt!623527) #b01111111111111111111111111111110))))

(assert (=> d!152409 (= lt!623685 (select (arr!46642 lt!623526) (index!46200 lt!623527)))))

(assert (=> d!152409 (validMask!0 mask!2840)))

(assert (=> d!152409 (= (seekKeyOrZeroReturnVacant!0 (x!127792 lt!623527) (index!46200 lt!623527) (index!46200 lt!623527) (select (arr!46642 a!2901) j!112) lt!623526 mask!2840) lt!623684)))

(declare-fun b!1414679 () Bool)

(assert (=> b!1414679 (= e!800640 Undefined!10953)))

(declare-fun b!1414680 () Bool)

(assert (=> b!1414680 (= e!800641 (Found!10953 (index!46200 lt!623527)))))

(assert (= (and d!152409 c!131334) b!1414679))

(assert (= (and d!152409 (not c!131334)) b!1414675))

(assert (= (and b!1414675 c!131333) b!1414680))

(assert (= (and b!1414675 (not c!131333)) b!1414678))

(assert (= (and b!1414678 c!131332) b!1414677))

(assert (= (and b!1414678 (not c!131332)) b!1414676))

(declare-fun m!1304899 () Bool)

(assert (=> b!1414676 m!1304899))

(assert (=> b!1414676 m!1304899))

(assert (=> b!1414676 m!1304669))

(declare-fun m!1304903 () Bool)

(assert (=> b!1414676 m!1304903))

(declare-fun m!1304907 () Bool)

(assert (=> d!152409 m!1304907))

(declare-fun m!1304909 () Bool)

(assert (=> d!152409 m!1304909))

(declare-fun m!1304911 () Bool)

(assert (=> d!152409 m!1304911))

(assert (=> d!152409 m!1304701))

(assert (=> b!1414351 d!152409))

(push 1)

(assert (not b!1414643))

(assert (not b!1414523))

(assert (not d!152337))

(assert (not d!152407))

(assert (not bm!67145))

(assert (not d!152397))

(assert (not bm!67144))

(assert (not b!1414508))

(assert (not bm!67156))

(assert (not b!1414433))

(assert (not d!152409))

(assert (not b!1414617))

(assert (not b!1414585))

(assert (not b!1414616))

(assert (not b!1414432))

(assert (not d!152357))

(assert (not b!1414527))

(assert (not b!1414620))

(assert (not b!1414524))

(assert (not d!152353))

(assert (not b!1414676))

(assert (not d!152335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

