; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121800 () Bool)

(assert start!121800)

(declare-fun b!1414290 () Bool)

(declare-fun res!950810 () Bool)

(declare-fun e!800411 () Bool)

(assert (=> b!1414290 (=> (not res!950810) (not e!800411))))

(declare-datatypes ((array!96612 0))(
  ( (array!96613 (arr!46640 (Array (_ BitVec 32) (_ BitVec 64))) (size!47190 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96612)

(declare-datatypes ((List!33159 0))(
  ( (Nil!33156) (Cons!33155 (h!34436 (_ BitVec 64)) (t!47853 List!33159)) )
))
(declare-fun arrayNoDuplicates!0 (array!96612 (_ BitVec 32) List!33159) Bool)

(assert (=> b!1414290 (= res!950810 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33156))))

(declare-fun b!1414291 () Bool)

(declare-fun e!800409 () Bool)

(declare-fun e!800413 () Bool)

(assert (=> b!1414291 (= e!800409 e!800413)))

(declare-fun res!950815 () Bool)

(assert (=> b!1414291 (=> res!950815 e!800413)))

(declare-datatypes ((SeekEntryResult!10951 0))(
  ( (MissingZero!10951 (index!46190 (_ BitVec 32))) (Found!10951 (index!46191 (_ BitVec 32))) (Intermediate!10951 (undefined!11763 Bool) (index!46192 (_ BitVec 32)) (x!127790 (_ BitVec 32))) (Undefined!10951) (MissingVacant!10951 (index!46193 (_ BitVec 32))) )
))
(declare-fun lt!623489 () SeekEntryResult!10951)

(declare-fun lt!623484 () SeekEntryResult!10951)

(assert (=> b!1414291 (= res!950815 (or (= lt!623489 lt!623484) (not (is-Intermediate!10951 lt!623484))))))

(declare-fun lt!623488 () array!96612)

(declare-fun lt!623487 () (_ BitVec 64))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96612 (_ BitVec 32)) SeekEntryResult!10951)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414291 (= lt!623484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623487 mask!2840) lt!623487 lt!623488 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1414291 (= lt!623487 (select (store (arr!46640 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414291 (= lt!623488 (array!96613 (store (arr!46640 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47190 a!2901)))))

(declare-fun b!1414293 () Bool)

(declare-fun res!950808 () Bool)

(assert (=> b!1414293 (=> (not res!950808) (not e!800411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414293 (= res!950808 (validKeyInArray!0 (select (arr!46640 a!2901) i!1037)))))

(declare-fun b!1414294 () Bool)

(declare-fun e!800410 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96612 (_ BitVec 32)) SeekEntryResult!10951)

(assert (=> b!1414294 (= e!800410 (= (seekEntryOrOpen!0 (select (arr!46640 a!2901) j!112) a!2901 mask!2840) (Found!10951 j!112)))))

(declare-fun b!1414295 () Bool)

(declare-fun res!950814 () Bool)

(assert (=> b!1414295 (=> (not res!950814) (not e!800411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96612 (_ BitVec 32)) Bool)

(assert (=> b!1414295 (= res!950814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414296 () Bool)

(declare-fun res!950811 () Bool)

(assert (=> b!1414296 (=> (not res!950811) (not e!800411))))

(assert (=> b!1414296 (= res!950811 (and (= (size!47190 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47190 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47190 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1414297 () Bool)

(declare-fun lt!623485 () (_ BitVec 32))

(assert (=> b!1414297 (= e!800413 (or (bvslt (x!127790 lt!623489) #b00000000000000000000000000000000) (bvsgt (x!127790 lt!623489) #b01111111111111111111111111111110) (bvslt (x!127790 lt!623484) #b00000000000000000000000000000000) (bvsgt (x!127790 lt!623484) #b01111111111111111111111111111110) (and (bvsge lt!623485 #b00000000000000000000000000000000) (bvslt lt!623485 (size!47190 a!2901)))))))

(declare-fun e!800414 () Bool)

(assert (=> b!1414297 e!800414))

(declare-fun res!950813 () Bool)

(assert (=> b!1414297 (=> (not res!950813) (not e!800414))))

(assert (=> b!1414297 (= res!950813 (and (not (undefined!11763 lt!623484)) (= (index!46192 lt!623484) i!1037) (bvslt (x!127790 lt!623484) (x!127790 lt!623489)) (= (select (store (arr!46640 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46192 lt!623484)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47876 0))(
  ( (Unit!47877) )
))
(declare-fun lt!623490 () Unit!47876)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47876)

(assert (=> b!1414297 (= lt!623490 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623485 (x!127790 lt!623489) (index!46192 lt!623489) (x!127790 lt!623484) (index!46192 lt!623484) (undefined!11763 lt!623484) mask!2840))))

(declare-fun b!1414292 () Bool)

(assert (=> b!1414292 (= e!800411 (not e!800409))))

(declare-fun res!950806 () Bool)

(assert (=> b!1414292 (=> res!950806 e!800409)))

(assert (=> b!1414292 (= res!950806 (or (not (is-Intermediate!10951 lt!623489)) (undefined!11763 lt!623489)))))

(assert (=> b!1414292 e!800410))

(declare-fun res!950807 () Bool)

(assert (=> b!1414292 (=> (not res!950807) (not e!800410))))

(assert (=> b!1414292 (= res!950807 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623486 () Unit!47876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47876)

(assert (=> b!1414292 (= lt!623486 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1414292 (= lt!623489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623485 (select (arr!46640 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1414292 (= lt!623485 (toIndex!0 (select (arr!46640 a!2901) j!112) mask!2840))))

(declare-fun res!950812 () Bool)

(assert (=> start!121800 (=> (not res!950812) (not e!800411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121800 (= res!950812 (validMask!0 mask!2840))))

(assert (=> start!121800 e!800411))

(assert (=> start!121800 true))

(declare-fun array_inv!35668 (array!96612) Bool)

(assert (=> start!121800 (array_inv!35668 a!2901)))

(declare-fun b!1414298 () Bool)

(declare-fun res!950809 () Bool)

(assert (=> b!1414298 (=> (not res!950809) (not e!800411))))

(assert (=> b!1414298 (= res!950809 (validKeyInArray!0 (select (arr!46640 a!2901) j!112)))))

(declare-fun b!1414299 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96612 (_ BitVec 32)) SeekEntryResult!10951)

(assert (=> b!1414299 (= e!800414 (= (seekEntryOrOpen!0 lt!623487 lt!623488 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127790 lt!623484) (index!46192 lt!623484) (index!46192 lt!623484) (select (arr!46640 a!2901) j!112) lt!623488 mask!2840)))))

(assert (= (and start!121800 res!950812) b!1414296))

(assert (= (and b!1414296 res!950811) b!1414293))

(assert (= (and b!1414293 res!950808) b!1414298))

(assert (= (and b!1414298 res!950809) b!1414295))

(assert (= (and b!1414295 res!950814) b!1414290))

(assert (= (and b!1414290 res!950810) b!1414292))

(assert (= (and b!1414292 res!950807) b!1414294))

(assert (= (and b!1414292 (not res!950806)) b!1414291))

(assert (= (and b!1414291 (not res!950815)) b!1414297))

(assert (= (and b!1414297 res!950813) b!1414299))

(declare-fun m!1304583 () Bool)

(assert (=> b!1414290 m!1304583))

(declare-fun m!1304585 () Bool)

(assert (=> b!1414292 m!1304585))

(declare-fun m!1304587 () Bool)

(assert (=> b!1414292 m!1304587))

(assert (=> b!1414292 m!1304585))

(declare-fun m!1304589 () Bool)

(assert (=> b!1414292 m!1304589))

(declare-fun m!1304591 () Bool)

(assert (=> b!1414292 m!1304591))

(assert (=> b!1414292 m!1304585))

(declare-fun m!1304593 () Bool)

(assert (=> b!1414292 m!1304593))

(declare-fun m!1304595 () Bool)

(assert (=> b!1414293 m!1304595))

(assert (=> b!1414293 m!1304595))

(declare-fun m!1304597 () Bool)

(assert (=> b!1414293 m!1304597))

(declare-fun m!1304599 () Bool)

(assert (=> b!1414299 m!1304599))

(assert (=> b!1414299 m!1304585))

(assert (=> b!1414299 m!1304585))

(declare-fun m!1304601 () Bool)

(assert (=> b!1414299 m!1304601))

(assert (=> b!1414298 m!1304585))

(assert (=> b!1414298 m!1304585))

(declare-fun m!1304603 () Bool)

(assert (=> b!1414298 m!1304603))

(assert (=> b!1414294 m!1304585))

(assert (=> b!1414294 m!1304585))

(declare-fun m!1304605 () Bool)

(assert (=> b!1414294 m!1304605))

(declare-fun m!1304607 () Bool)

(assert (=> start!121800 m!1304607))

(declare-fun m!1304609 () Bool)

(assert (=> start!121800 m!1304609))

(declare-fun m!1304611 () Bool)

(assert (=> b!1414291 m!1304611))

(assert (=> b!1414291 m!1304611))

(declare-fun m!1304613 () Bool)

(assert (=> b!1414291 m!1304613))

(declare-fun m!1304615 () Bool)

(assert (=> b!1414291 m!1304615))

(declare-fun m!1304617 () Bool)

(assert (=> b!1414291 m!1304617))

(assert (=> b!1414297 m!1304615))

(declare-fun m!1304619 () Bool)

(assert (=> b!1414297 m!1304619))

(declare-fun m!1304621 () Bool)

(assert (=> b!1414297 m!1304621))

(declare-fun m!1304623 () Bool)

(assert (=> b!1414295 m!1304623))

(push 1)

(assert (not b!1414290))

(assert (not start!121800))

(assert (not b!1414292))

(assert (not b!1414291))

(assert (not b!1414294))

(assert (not b!1414299))

(assert (not b!1414297))

(assert (not b!1414293))

(assert (not b!1414298))

(assert (not b!1414295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152321 () Bool)

(declare-fun res!950881 () Bool)

(declare-fun e!800472 () Bool)

(assert (=> d!152321 (=> res!950881 e!800472)))

(assert (=> d!152321 (= res!950881 (bvsge #b00000000000000000000000000000000 (size!47190 a!2901)))))

(assert (=> d!152321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800472)))

(declare-fun b!1414398 () Bool)

(declare-fun e!800474 () Bool)

(declare-fun call!67141 () Bool)

(assert (=> b!1414398 (= e!800474 call!67141)))

(declare-fun b!1414399 () Bool)

(declare-fun e!800473 () Bool)

(assert (=> b!1414399 (= e!800474 e!800473)))

(declare-fun lt!623554 () (_ BitVec 64))

(assert (=> b!1414399 (= lt!623554 (select (arr!46640 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623552 () Unit!47876)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96612 (_ BitVec 64) (_ BitVec 32)) Unit!47876)

(assert (=> b!1414399 (= lt!623552 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623554 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1414399 (arrayContainsKey!0 a!2901 lt!623554 #b00000000000000000000000000000000)))

(declare-fun lt!623553 () Unit!47876)

(assert (=> b!1414399 (= lt!623553 lt!623552)))

(declare-fun res!950880 () Bool)

(assert (=> b!1414399 (= res!950880 (= (seekEntryOrOpen!0 (select (arr!46640 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10951 #b00000000000000000000000000000000)))))

(assert (=> b!1414399 (=> (not res!950880) (not e!800473))))

(declare-fun b!1414400 () Bool)

(assert (=> b!1414400 (= e!800473 call!67141)))

(declare-fun b!1414401 () Bool)

(assert (=> b!1414401 (= e!800472 e!800474)))

(declare-fun c!131235 () Bool)

(assert (=> b!1414401 (= c!131235 (validKeyInArray!0 (select (arr!46640 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67138 () Bool)

(assert (=> bm!67138 (= call!67141 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152321 (not res!950881)) b!1414401))

(assert (= (and b!1414401 c!131235) b!1414399))

(assert (= (and b!1414401 (not c!131235)) b!1414398))

(assert (= (and b!1414399 res!950880) b!1414400))

(assert (= (or b!1414400 b!1414398) bm!67138))

(declare-fun m!1304719 () Bool)

(assert (=> b!1414399 m!1304719))

(declare-fun m!1304721 () Bool)

(assert (=> b!1414399 m!1304721))

(declare-fun m!1304723 () Bool)

(assert (=> b!1414399 m!1304723))

(assert (=> b!1414399 m!1304719))

(declare-fun m!1304725 () Bool)

(assert (=> b!1414399 m!1304725))

(assert (=> b!1414401 m!1304719))

(assert (=> b!1414401 m!1304719))

(declare-fun m!1304727 () Bool)

(assert (=> b!1414401 m!1304727))

(declare-fun m!1304729 () Bool)

(assert (=> bm!67138 m!1304729))

(assert (=> b!1414295 d!152321))

(declare-fun b!1414426 () Bool)

(declare-fun e!800494 () Bool)

(declare-fun call!67146 () Bool)

(assert (=> b!1414426 (= e!800494 call!67146)))

(declare-fun b!1414427 () Bool)

(declare-fun e!800495 () Bool)

(assert (=> b!1414427 (= e!800495 e!800494)))

(declare-fun c!131243 () Bool)

(assert (=> b!1414427 (= c!131243 (validKeyInArray!0 (select (arr!46640 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414428 () Bool)

(assert (=> b!1414428 (= e!800494 call!67146)))

(declare-fun d!152325 () Bool)

(declare-fun res!950892 () Bool)

(declare-fun e!800492 () Bool)

(assert (=> d!152325 (=> res!950892 e!800492)))

(assert (=> d!152325 (= res!950892 (bvsge #b00000000000000000000000000000000 (size!47190 a!2901)))))

(assert (=> d!152325 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33156) e!800492)))

(declare-fun b!1414429 () Bool)

(assert (=> b!1414429 (= e!800492 e!800495)))

(declare-fun res!950894 () Bool)

(assert (=> b!1414429 (=> (not res!950894) (not e!800495))))

(declare-fun e!800493 () Bool)

(assert (=> b!1414429 (= res!950894 (not e!800493))))

(declare-fun res!950893 () Bool)

(assert (=> b!1414429 (=> (not res!950893) (not e!800493))))

(assert (=> b!1414429 (= res!950893 (validKeyInArray!0 (select (arr!46640 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414430 () Bool)

(declare-fun contains!9819 (List!33159 (_ BitVec 64)) Bool)

(assert (=> b!1414430 (= e!800493 (contains!9819 Nil!33156 (select (arr!46640 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67143 () Bool)

(assert (=> bm!67143 (= call!67146 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131243 (Cons!33155 (select (arr!46640 a!2901) #b00000000000000000000000000000000) Nil!33156) Nil!33156)))))

(assert (= (and d!152325 (not res!950892)) b!1414429))

(assert (= (and b!1414429 res!950893) b!1414430))

(assert (= (and b!1414429 res!950894) b!1414427))

(assert (= (and b!1414427 c!131243) b!1414428))

(assert (= (and b!1414427 (not c!131243)) b!1414426))

(assert (= (or b!1414428 b!1414426) bm!67143))

(assert (=> b!1414427 m!1304719))

(assert (=> b!1414427 m!1304719))

(assert (=> b!1414427 m!1304727))

(assert (=> b!1414429 m!1304719))

(assert (=> b!1414429 m!1304719))

(assert (=> b!1414429 m!1304727))

(assert (=> b!1414430 m!1304719))

(assert (=> b!1414430 m!1304719))

(declare-fun m!1304744 () Bool)

(assert (=> b!1414430 m!1304744))

(assert (=> bm!67143 m!1304719))

(declare-fun m!1304749 () Bool)

(assert (=> bm!67143 m!1304749))

(assert (=> b!1414290 d!152325))

(declare-fun b!1414492 () Bool)

(declare-fun e!800531 () Bool)

(declare-fun e!800530 () Bool)

(assert (=> b!1414492 (= e!800531 e!800530)))

(declare-fun res!950913 () Bool)

(declare-fun lt!623587 () SeekEntryResult!10951)

(assert (=> b!1414492 (= res!950913 (and (is-Intermediate!10951 lt!623587) (not (undefined!11763 lt!623587)) (bvslt (x!127790 lt!623587) #b01111111111111111111111111111110) (bvsge (x!127790 lt!623587) #b00000000000000000000000000000000) (bvsge (x!127790 lt!623587) #b00000000000000000000000000000000)))))

(assert (=> b!1414492 (=> (not res!950913) (not e!800530))))

(declare-fun d!152333 () Bool)

(assert (=> d!152333 e!800531))

(declare-fun c!131266 () Bool)

(assert (=> d!152333 (= c!131266 (and (is-Intermediate!10951 lt!623587) (undefined!11763 lt!623587)))))

(declare-fun e!800533 () SeekEntryResult!10951)

(assert (=> d!152333 (= lt!623587 e!800533)))

(declare-fun c!131267 () Bool)

(assert (=> d!152333 (= c!131267 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623586 () (_ BitVec 64))

(assert (=> d!152333 (= lt!623586 (select (arr!46640 lt!623488) (toIndex!0 lt!623487 mask!2840)))))

(assert (=> d!152333 (validMask!0 mask!2840)))

(assert (=> d!152333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623487 mask!2840) lt!623487 lt!623488 mask!2840) lt!623587)))

(declare-fun b!1414493 () Bool)

(declare-fun e!800532 () SeekEntryResult!10951)

(assert (=> b!1414493 (= e!800532 (Intermediate!10951 false (toIndex!0 lt!623487 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414494 () Bool)

(assert (=> b!1414494 (= e!800531 (bvsge (x!127790 lt!623587) #b01111111111111111111111111111110))))

(declare-fun b!1414495 () Bool)

(assert (=> b!1414495 (= e!800533 e!800532)))

(declare-fun c!131268 () Bool)

(assert (=> b!1414495 (= c!131268 (or (= lt!623586 lt!623487) (= (bvadd lt!623586 lt!623586) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414496 () Bool)

(assert (=> b!1414496 (and (bvsge (index!46192 lt!623587) #b00000000000000000000000000000000) (bvslt (index!46192 lt!623587) (size!47190 lt!623488)))))

(declare-fun res!950915 () Bool)

(assert (=> b!1414496 (= res!950915 (= (select (arr!46640 lt!623488) (index!46192 lt!623587)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800534 () Bool)

(assert (=> b!1414496 (=> res!950915 e!800534)))

(declare-fun b!1414497 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414497 (= e!800532 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623487 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623487 lt!623488 mask!2840))))

(declare-fun b!1414498 () Bool)

(assert (=> b!1414498 (and (bvsge (index!46192 lt!623587) #b00000000000000000000000000000000) (bvslt (index!46192 lt!623587) (size!47190 lt!623488)))))

(declare-fun res!950914 () Bool)

(assert (=> b!1414498 (= res!950914 (= (select (arr!46640 lt!623488) (index!46192 lt!623587)) lt!623487))))

(assert (=> b!1414498 (=> res!950914 e!800534)))

(assert (=> b!1414498 (= e!800530 e!800534)))

(declare-fun b!1414499 () Bool)

(assert (=> b!1414499 (and (bvsge (index!46192 lt!623587) #b00000000000000000000000000000000) (bvslt (index!46192 lt!623587) (size!47190 lt!623488)))))

(assert (=> b!1414499 (= e!800534 (= (select (arr!46640 lt!623488) (index!46192 lt!623587)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414500 () Bool)

(assert (=> b!1414500 (= e!800533 (Intermediate!10951 true (toIndex!0 lt!623487 mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!152333 c!131267) b!1414500))

(assert (= (and d!152333 (not c!131267)) b!1414495))

(assert (= (and b!1414495 c!131268) b!1414493))

(assert (= (and b!1414495 (not c!131268)) b!1414497))

(assert (= (and d!152333 c!131266) b!1414494))

(assert (= (and d!152333 (not c!131266)) b!1414492))

(assert (= (and b!1414492 res!950913) b!1414498))

(assert (= (and b!1414498 (not res!950914)) b!1414496))

(assert (= (and b!1414496 (not res!950915)) b!1414499))

(assert (=> d!152333 m!1304611))

(declare-fun m!1304763 () Bool)

(assert (=> d!152333 m!1304763))

(assert (=> d!152333 m!1304607))

(declare-fun m!1304765 () Bool)

(assert (=> b!1414496 m!1304765))

(assert (=> b!1414498 m!1304765))

(assert (=> b!1414497 m!1304611))

(declare-fun m!1304767 () Bool)

(assert (=> b!1414497 m!1304767))

(assert (=> b!1414497 m!1304767))

(declare-fun m!1304769 () Bool)

(assert (=> b!1414497 m!1304769))

(assert (=> b!1414499 m!1304765))

(assert (=> b!1414291 d!152333))

(declare-fun d!152341 () Bool)

(declare-fun lt!623604 () (_ BitVec 32))

(declare-fun lt!623603 () (_ BitVec 32))

(assert (=> d!152341 (= lt!623604 (bvmul (bvxor lt!623603 (bvlshr lt!623603 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152341 (= lt!623603 ((_ extract 31 0) (bvand (bvxor lt!623487 (bvlshr lt!623487 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152341 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950922 (let ((h!34440 ((_ extract 31 0) (bvand (bvxor lt!623487 (bvlshr lt!623487 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127799 (bvmul (bvxor h!34440 (bvlshr h!34440 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127799 (bvlshr x!127799 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950922 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950922 #b00000000000000000000000000000000))))))

(assert (=> d!152341 (= (toIndex!0 lt!623487 mask!2840) (bvand (bvxor lt!623604 (bvlshr lt!623604 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414291 d!152341))

(declare-fun d!152349 () Bool)

(assert (=> d!152349 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121800 d!152349))

(declare-fun d!152361 () Bool)

(assert (=> d!152361 (= (array_inv!35668 a!2901) (bvsge (size!47190 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121800 d!152361))

(declare-fun d!152365 () Bool)

(assert (=> d!152365 (and (not (undefined!11763 lt!623484)) (= (index!46192 lt!623484) i!1037) (bvslt (x!127790 lt!623484) (x!127790 lt!623489)))))

(declare-fun lt!623620 () Unit!47876)

(declare-fun choose!62 (array!96612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47876)

(assert (=> d!152365 (= lt!623620 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623485 (x!127790 lt!623489) (index!46192 lt!623489) (x!127790 lt!623484) (index!46192 lt!623484) (undefined!11763 lt!623484) mask!2840))))

(assert (=> d!152365 (validMask!0 mask!2840)))

(assert (=> d!152365 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623485 (x!127790 lt!623489) (index!46192 lt!623489) (x!127790 lt!623484) (index!46192 lt!623484) (undefined!11763 lt!623484) mask!2840) lt!623620)))

(declare-fun bs!41236 () Bool)

(assert (= bs!41236 d!152365))

(declare-fun m!1304811 () Bool)

(assert (=> bs!41236 m!1304811))

(assert (=> bs!41236 m!1304607))

(assert (=> b!1414297 d!152365))

(declare-fun d!152367 () Bool)

(declare-fun res!950933 () Bool)

(declare-fun e!800555 () Bool)

(assert (=> d!152367 (=> res!950933 e!800555)))

(assert (=> d!152367 (= res!950933 (bvsge j!112 (size!47190 a!2901)))))

(assert (=> d!152367 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800555)))

(declare-fun b!1414535 () Bool)

(declare-fun e!800557 () Bool)

(declare-fun call!67149 () Bool)

(assert (=> b!1414535 (= e!800557 call!67149)))

(declare-fun b!1414536 () Bool)

(declare-fun e!800556 () Bool)

(assert (=> b!1414536 (= e!800557 e!800556)))

(declare-fun lt!623623 () (_ BitVec 64))

(assert (=> b!1414536 (= lt!623623 (select (arr!46640 a!2901) j!112))))

(declare-fun lt!623621 () Unit!47876)

(assert (=> b!1414536 (= lt!623621 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623623 j!112))))

(assert (=> b!1414536 (arrayContainsKey!0 a!2901 lt!623623 #b00000000000000000000000000000000)))

(declare-fun lt!623622 () Unit!47876)

(assert (=> b!1414536 (= lt!623622 lt!623621)))

(declare-fun res!950932 () Bool)

(assert (=> b!1414536 (= res!950932 (= (seekEntryOrOpen!0 (select (arr!46640 a!2901) j!112) a!2901 mask!2840) (Found!10951 j!112)))))

(assert (=> b!1414536 (=> (not res!950932) (not e!800556))))

(declare-fun b!1414537 () Bool)

(assert (=> b!1414537 (= e!800556 call!67149)))

(declare-fun b!1414538 () Bool)

(assert (=> b!1414538 (= e!800555 e!800557)))

(declare-fun c!131279 () Bool)

(assert (=> b!1414538 (= c!131279 (validKeyInArray!0 (select (arr!46640 a!2901) j!112)))))

(declare-fun bm!67146 () Bool)

(assert (=> bm!67146 (= call!67149 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152367 (not res!950933)) b!1414538))

(assert (= (and b!1414538 c!131279) b!1414536))

(assert (= (and b!1414538 (not c!131279)) b!1414535))

(assert (= (and b!1414536 res!950932) b!1414537))

(assert (= (or b!1414537 b!1414535) bm!67146))

(assert (=> b!1414536 m!1304585))

(declare-fun m!1304813 () Bool)

(assert (=> b!1414536 m!1304813))

(declare-fun m!1304815 () Bool)

(assert (=> b!1414536 m!1304815))

(assert (=> b!1414536 m!1304585))

(assert (=> b!1414536 m!1304605))

(assert (=> b!1414538 m!1304585))

(assert (=> b!1414538 m!1304585))

(assert (=> b!1414538 m!1304603))

(declare-fun m!1304817 () Bool)

(assert (=> bm!67146 m!1304817))

(assert (=> b!1414292 d!152367))

(declare-fun d!152369 () Bool)

(assert (=> d!152369 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623632 () Unit!47876)

(declare-fun choose!38 (array!96612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47876)

(assert (=> d!152369 (= lt!623632 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152369 (validMask!0 mask!2840)))

(assert (=> d!152369 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623632)))

(declare-fun bs!41237 () Bool)

(assert (= bs!41237 d!152369))

(assert (=> bs!41237 m!1304591))

(declare-fun m!1304819 () Bool)

(assert (=> bs!41237 m!1304819))

(assert (=> bs!41237 m!1304607))

(assert (=> b!1414292 d!152369))

(declare-fun b!1414551 () Bool)

(declare-fun e!800568 () Bool)

(declare-fun e!800567 () Bool)

(assert (=> b!1414551 (= e!800568 e!800567)))

(declare-fun res!950940 () Bool)

(declare-fun lt!623637 () SeekEntryResult!10951)

(assert (=> b!1414551 (= res!950940 (and (is-Intermediate!10951 lt!623637) (not (undefined!11763 lt!623637)) (bvslt (x!127790 lt!623637) #b01111111111111111111111111111110) (bvsge (x!127790 lt!623637) #b00000000000000000000000000000000) (bvsge (x!127790 lt!623637) #b00000000000000000000000000000000)))))

(assert (=> b!1414551 (=> (not res!950940) (not e!800567))))

(declare-fun d!152371 () Bool)

(assert (=> d!152371 e!800568))

(declare-fun c!131283 () Bool)

(assert (=> d!152371 (= c!131283 (and (is-Intermediate!10951 lt!623637) (undefined!11763 lt!623637)))))

(declare-fun e!800570 () SeekEntryResult!10951)

(assert (=> d!152371 (= lt!623637 e!800570)))

(declare-fun c!131284 () Bool)

(assert (=> d!152371 (= c!131284 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623636 () (_ BitVec 64))

(assert (=> d!152371 (= lt!623636 (select (arr!46640 a!2901) lt!623485))))

(assert (=> d!152371 (validMask!0 mask!2840)))

(assert (=> d!152371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623485 (select (arr!46640 a!2901) j!112) a!2901 mask!2840) lt!623637)))

(declare-fun b!1414552 () Bool)

(declare-fun e!800569 () SeekEntryResult!10951)

(assert (=> b!1414552 (= e!800569 (Intermediate!10951 false lt!623485 #b00000000000000000000000000000000))))

(declare-fun b!1414553 () Bool)

(assert (=> b!1414553 (= e!800568 (bvsge (x!127790 lt!623637) #b01111111111111111111111111111110))))

(declare-fun b!1414554 () Bool)

(assert (=> b!1414554 (= e!800570 e!800569)))

(declare-fun c!131285 () Bool)

(assert (=> b!1414554 (= c!131285 (or (= lt!623636 (select (arr!46640 a!2901) j!112)) (= (bvadd lt!623636 lt!623636) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414555 () Bool)

(assert (=> b!1414555 (and (bvsge (index!46192 lt!623637) #b00000000000000000000000000000000) (bvslt (index!46192 lt!623637) (size!47190 a!2901)))))

(declare-fun res!950942 () Bool)

(assert (=> b!1414555 (= res!950942 (= (select (arr!46640 a!2901) (index!46192 lt!623637)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800571 () Bool)

(assert (=> b!1414555 (=> res!950942 e!800571)))

(declare-fun b!1414556 () Bool)

(assert (=> b!1414556 (= e!800569 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623485 #b00000000000000000000000000000000 mask!2840) (select (arr!46640 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414557 () Bool)

(assert (=> b!1414557 (and (bvsge (index!46192 lt!623637) #b00000000000000000000000000000000) (bvslt (index!46192 lt!623637) (size!47190 a!2901)))))

(declare-fun res!950941 () Bool)

(assert (=> b!1414557 (= res!950941 (= (select (arr!46640 a!2901) (index!46192 lt!623637)) (select (arr!46640 a!2901) j!112)))))

(assert (=> b!1414557 (=> res!950941 e!800571)))

(assert (=> b!1414557 (= e!800567 e!800571)))

(declare-fun b!1414558 () Bool)

(assert (=> b!1414558 (and (bvsge (index!46192 lt!623637) #b00000000000000000000000000000000) (bvslt (index!46192 lt!623637) (size!47190 a!2901)))))

(assert (=> b!1414558 (= e!800571 (= (select (arr!46640 a!2901) (index!46192 lt!623637)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414559 () Bool)

(assert (=> b!1414559 (= e!800570 (Intermediate!10951 true lt!623485 #b00000000000000000000000000000000))))

(assert (= (and d!152371 c!131284) b!1414559))

(assert (= (and d!152371 (not c!131284)) b!1414554))

(assert (= (and b!1414554 c!131285) b!1414552))

(assert (= (and b!1414554 (not c!131285)) b!1414556))

(assert (= (and d!152371 c!131283) b!1414553))

(assert (= (and d!152371 (not c!131283)) b!1414551))

(assert (= (and b!1414551 res!950940) b!1414557))

(assert (= (and b!1414557 (not res!950941)) b!1414555))

(assert (= (and b!1414555 (not res!950942)) b!1414558))

(declare-fun m!1304827 () Bool)

(assert (=> d!152371 m!1304827))

(assert (=> d!152371 m!1304607))

(declare-fun m!1304829 () Bool)

(assert (=> b!1414555 m!1304829))

(assert (=> b!1414557 m!1304829))

(declare-fun m!1304831 () Bool)

(assert (=> b!1414556 m!1304831))

(assert (=> b!1414556 m!1304831))

(assert (=> b!1414556 m!1304585))

(declare-fun m!1304833 () Bool)

(assert (=> b!1414556 m!1304833))

(assert (=> b!1414558 m!1304829))

(assert (=> b!1414292 d!152371))

(declare-fun d!152375 () Bool)

(declare-fun lt!623639 () (_ BitVec 32))

(declare-fun lt!623638 () (_ BitVec 32))

(assert (=> d!152375 (= lt!623639 (bvmul (bvxor lt!623638 (bvlshr lt!623638 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152375 (= lt!623638 ((_ extract 31 0) (bvand (bvxor (select (arr!46640 a!2901) j!112) (bvlshr (select (arr!46640 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152375 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950922 (let ((h!34440 ((_ extract 31 0) (bvand (bvxor (select (arr!46640 a!2901) j!112) (bvlshr (select (arr!46640 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127799 (bvmul (bvxor h!34440 (bvlshr h!34440 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127799 (bvlshr x!127799 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950922 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950922 #b00000000000000000000000000000000))))))

(assert (=> d!152375 (= (toIndex!0 (select (arr!46640 a!2901) j!112) mask!2840) (bvand (bvxor lt!623639 (bvlshr lt!623639 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414292 d!152375))

(declare-fun d!152377 () Bool)

(assert (=> d!152377 (= (validKeyInArray!0 (select (arr!46640 a!2901) i!1037)) (and (not (= (select (arr!46640 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46640 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414293 d!152377))

(declare-fun d!152379 () Bool)

(assert (=> d!152379 (= (validKeyInArray!0 (select (arr!46640 a!2901) j!112)) (and (not (= (select (arr!46640 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46640 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414298 d!152379))

(declare-fun lt!623668 () SeekEntryResult!10951)

(declare-fun e!800621 () SeekEntryResult!10951)

(declare-fun b!1414634 () Bool)

(assert (=> b!1414634 (= e!800621 (seekKeyOrZeroReturnVacant!0 (x!127790 lt!623668) (index!46192 lt!623668) (index!46192 lt!623668) lt!623487 lt!623488 mask!2840))))

(declare-fun b!1414635 () Bool)

(declare-fun c!131312 () Bool)

(declare-fun lt!623670 () (_ BitVec 64))

(assert (=> b!1414635 (= c!131312 (= lt!623670 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800620 () SeekEntryResult!10951)

(assert (=> b!1414635 (= e!800620 e!800621)))

(declare-fun b!1414636 () Bool)

(declare-fun e!800619 () SeekEntryResult!10951)

(assert (=> b!1414636 (= e!800619 Undefined!10951)))

(declare-fun d!152381 () Bool)

(declare-fun lt!623669 () SeekEntryResult!10951)

(assert (=> d!152381 (and (or (is-Undefined!10951 lt!623669) (not (is-Found!10951 lt!623669)) (and (bvsge (index!46191 lt!623669) #b00000000000000000000000000000000) (bvslt (index!46191 lt!623669) (size!47190 lt!623488)))) (or (is-Undefined!10951 lt!623669) (is-Found!10951 lt!623669) (not (is-MissingZero!10951 lt!623669)) (and (bvsge (index!46190 lt!623669) #b00000000000000000000000000000000) (bvslt (index!46190 lt!623669) (size!47190 lt!623488)))) (or (is-Undefined!10951 lt!623669) (is-Found!10951 lt!623669) (is-MissingZero!10951 lt!623669) (not (is-MissingVacant!10951 lt!623669)) (and (bvsge (index!46193 lt!623669) #b00000000000000000000000000000000) (bvslt (index!46193 lt!623669) (size!47190 lt!623488)))) (or (is-Undefined!10951 lt!623669) (ite (is-Found!10951 lt!623669) (= (select (arr!46640 lt!623488) (index!46191 lt!623669)) lt!623487) (ite (is-MissingZero!10951 lt!623669) (= (select (arr!46640 lt!623488) (index!46190 lt!623669)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10951 lt!623669) (= (select (arr!46640 lt!623488) (index!46193 lt!623669)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152381 (= lt!623669 e!800619)))

(declare-fun c!131311 () Bool)

(assert (=> d!152381 (= c!131311 (and (is-Intermediate!10951 lt!623668) (undefined!11763 lt!623668)))))

(assert (=> d!152381 (= lt!623668 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623487 mask!2840) lt!623487 lt!623488 mask!2840))))

(assert (=> d!152381 (validMask!0 mask!2840)))

(assert (=> d!152381 (= (seekEntryOrOpen!0 lt!623487 lt!623488 mask!2840) lt!623669)))

(declare-fun b!1414633 () Bool)

(assert (=> b!1414633 (= e!800619 e!800620)))

(assert (=> b!1414633 (= lt!623670 (select (arr!46640 lt!623488) (index!46192 lt!623668)))))

(declare-fun c!131313 () Bool)

(assert (=> b!1414633 (= c!131313 (= lt!623670 lt!623487))))

(declare-fun b!1414637 () Bool)

(assert (=> b!1414637 (= e!800620 (Found!10951 (index!46192 lt!623668)))))

(declare-fun b!1414638 () Bool)

(assert (=> b!1414638 (= e!800621 (MissingZero!10951 (index!46192 lt!623668)))))

(assert (= (and d!152381 c!131311) b!1414636))

(assert (= (and d!152381 (not c!131311)) b!1414633))

(assert (= (and b!1414633 c!131313) b!1414637))

(assert (= (and b!1414633 (not c!131313)) b!1414635))

(assert (= (and b!1414635 c!131312) b!1414638))

(assert (= (and b!1414635 (not c!131312)) b!1414634))

(declare-fun m!1304879 () Bool)

(assert (=> b!1414634 m!1304879))

(assert (=> d!152381 m!1304611))

(declare-fun m!1304881 () Bool)

(assert (=> d!152381 m!1304881))

(assert (=> d!152381 m!1304611))

(assert (=> d!152381 m!1304613))

(assert (=> d!152381 m!1304607))

(declare-fun m!1304883 () Bool)

(assert (=> d!152381 m!1304883))

(declare-fun m!1304885 () Bool)

(assert (=> d!152381 m!1304885))

(declare-fun m!1304887 () Bool)

(assert (=> b!1414633 m!1304887))

(assert (=> b!1414299 d!152381))

(declare-fun b!1414669 () Bool)

(declare-fun c!131331 () Bool)

(declare-fun lt!623683 () (_ BitVec 64))

(assert (=> b!1414669 (= c!131331 (= lt!623683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800639 () SeekEntryResult!10951)

(declare-fun e!800637 () SeekEntryResult!10951)

(assert (=> b!1414669 (= e!800639 e!800637)))

(declare-fun b!1414670 () Bool)

(assert (=> b!1414670 (= e!800639 (Found!10951 (index!46192 lt!623484)))))

(declare-fun b!1414672 () Bool)

(assert (=> b!1414672 (= e!800637 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127790 lt!623484) #b00000000000000000000000000000001) (nextIndex!0 (index!46192 lt!623484) (x!127790 lt!623484) mask!2840) (index!46192 lt!623484) (select (arr!46640 a!2901) j!112) lt!623488 mask!2840))))

(declare-fun b!1414673 () Bool)

(declare-fun e!800638 () SeekEntryResult!10951)

(assert (=> b!1414673 (= e!800638 e!800639)))

(declare-fun c!131329 () Bool)

(assert (=> b!1414673 (= c!131329 (= lt!623683 (select (arr!46640 a!2901) j!112)))))

(declare-fun b!1414674 () Bool)

(assert (=> b!1414674 (= e!800637 (MissingVacant!10951 (index!46192 lt!623484)))))

(declare-fun b!1414671 () Bool)

(assert (=> b!1414671 (= e!800638 Undefined!10951)))

(declare-fun lt!623682 () SeekEntryResult!10951)

(declare-fun d!152403 () Bool)

(assert (=> d!152403 (and (or (is-Undefined!10951 lt!623682) (not (is-Found!10951 lt!623682)) (and (bvsge (index!46191 lt!623682) #b00000000000000000000000000000000) (bvslt (index!46191 lt!623682) (size!47190 lt!623488)))) (or (is-Undefined!10951 lt!623682) (is-Found!10951 lt!623682) (not (is-MissingVacant!10951 lt!623682)) (not (= (index!46193 lt!623682) (index!46192 lt!623484))) (and (bvsge (index!46193 lt!623682) #b00000000000000000000000000000000) (bvslt (index!46193 lt!623682) (size!47190 lt!623488)))) (or (is-Undefined!10951 lt!623682) (ite (is-Found!10951 lt!623682) (= (select (arr!46640 lt!623488) (index!46191 lt!623682)) (select (arr!46640 a!2901) j!112)) (and (is-MissingVacant!10951 lt!623682) (= (index!46193 lt!623682) (index!46192 lt!623484)) (= (select (arr!46640 lt!623488) (index!46193 lt!623682)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152403 (= lt!623682 e!800638)))

(declare-fun c!131330 () Bool)

(assert (=> d!152403 (= c!131330 (bvsge (x!127790 lt!623484) #b01111111111111111111111111111110))))

(assert (=> d!152403 (= lt!623683 (select (arr!46640 lt!623488) (index!46192 lt!623484)))))

(assert (=> d!152403 (validMask!0 mask!2840)))

(assert (=> d!152403 (= (seekKeyOrZeroReturnVacant!0 (x!127790 lt!623484) (index!46192 lt!623484) (index!46192 lt!623484) (select (arr!46640 a!2901) j!112) lt!623488 mask!2840) lt!623682)))

(assert (= (and d!152403 c!131330) b!1414671))

(assert (= (and d!152403 (not c!131330)) b!1414673))

(assert (= (and b!1414673 c!131329) b!1414670))

(assert (= (and b!1414673 (not c!131329)) b!1414669))

(assert (= (and b!1414669 c!131331) b!1414674))

(assert (= (and b!1414669 (not c!131331)) b!1414672))

(declare-fun m!1304901 () Bool)

(assert (=> b!1414672 m!1304901))

(assert (=> b!1414672 m!1304901))

(assert (=> b!1414672 m!1304585))

(declare-fun m!1304905 () Bool)

(assert (=> b!1414672 m!1304905))

(declare-fun m!1304913 () Bool)

(assert (=> d!152403 m!1304913))

(declare-fun m!1304915 () Bool)

(assert (=> d!152403 m!1304915))

(declare-fun m!1304917 () Bool)

(assert (=> d!152403 m!1304917))

(assert (=> d!152403 m!1304607))

(assert (=> b!1414299 d!152403))

(declare-fun b!1414682 () Bool)

(declare-fun lt!623686 () SeekEntryResult!10951)

(declare-fun e!800645 () SeekEntryResult!10951)

(assert (=> b!1414682 (= e!800645 (seekKeyOrZeroReturnVacant!0 (x!127790 lt!623686) (index!46192 lt!623686) (index!46192 lt!623686) (select (arr!46640 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414683 () Bool)

(declare-fun c!131336 () Bool)

(declare-fun lt!623688 () (_ BitVec 64))

(assert (=> b!1414683 (= c!131336 (= lt!623688 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800644 () SeekEntryResult!10951)

(assert (=> b!1414683 (= e!800644 e!800645)))

(declare-fun b!1414684 () Bool)

(declare-fun e!800643 () SeekEntryResult!10951)

(assert (=> b!1414684 (= e!800643 Undefined!10951)))

(declare-fun d!152411 () Bool)

(declare-fun lt!623687 () SeekEntryResult!10951)

(assert (=> d!152411 (and (or (is-Undefined!10951 lt!623687) (not (is-Found!10951 lt!623687)) (and (bvsge (index!46191 lt!623687) #b00000000000000000000000000000000) (bvslt (index!46191 lt!623687) (size!47190 a!2901)))) (or (is-Undefined!10951 lt!623687) (is-Found!10951 lt!623687) (not (is-MissingZero!10951 lt!623687)) (and (bvsge (index!46190 lt!623687) #b00000000000000000000000000000000) (bvslt (index!46190 lt!623687) (size!47190 a!2901)))) (or (is-Undefined!10951 lt!623687) (is-Found!10951 lt!623687) (is-MissingZero!10951 lt!623687) (not (is-MissingVacant!10951 lt!623687)) (and (bvsge (index!46193 lt!623687) #b00000000000000000000000000000000) (bvslt (index!46193 lt!623687) (size!47190 a!2901)))) (or (is-Undefined!10951 lt!623687) (ite (is-Found!10951 lt!623687) (= (select (arr!46640 a!2901) (index!46191 lt!623687)) (select (arr!46640 a!2901) j!112)) (ite (is-MissingZero!10951 lt!623687) (= (select (arr!46640 a!2901) (index!46190 lt!623687)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10951 lt!623687) (= (select (arr!46640 a!2901) (index!46193 lt!623687)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152411 (= lt!623687 e!800643)))

(declare-fun c!131335 () Bool)

(assert (=> d!152411 (= c!131335 (and (is-Intermediate!10951 lt!623686) (undefined!11763 lt!623686)))))

(assert (=> d!152411 (= lt!623686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46640 a!2901) j!112) mask!2840) (select (arr!46640 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152411 (validMask!0 mask!2840)))

(assert (=> d!152411 (= (seekEntryOrOpen!0 (select (arr!46640 a!2901) j!112) a!2901 mask!2840) lt!623687)))

(declare-fun b!1414681 () Bool)

(assert (=> b!1414681 (= e!800643 e!800644)))

(assert (=> b!1414681 (= lt!623688 (select (arr!46640 a!2901) (index!46192 lt!623686)))))

(declare-fun c!131337 () Bool)

(assert (=> b!1414681 (= c!131337 (= lt!623688 (select (arr!46640 a!2901) j!112)))))

(declare-fun b!1414685 () Bool)

(assert (=> b!1414685 (= e!800644 (Found!10951 (index!46192 lt!623686)))))

(declare-fun b!1414686 () Bool)

(assert (=> b!1414686 (= e!800645 (MissingZero!10951 (index!46192 lt!623686)))))

(assert (= (and d!152411 c!131335) b!1414684))

(assert (= (and d!152411 (not c!131335)) b!1414681))

(assert (= (and b!1414681 c!131337) b!1414685))

(assert (= (and b!1414681 (not c!131337)) b!1414683))

(assert (= (and b!1414683 c!131336) b!1414686))

(assert (= (and b!1414683 (not c!131336)) b!1414682))

(assert (=> b!1414682 m!1304585))

(declare-fun m!1304919 () Bool)

(assert (=> b!1414682 m!1304919))

(assert (=> d!152411 m!1304585))

(assert (=> d!152411 m!1304587))

(declare-fun m!1304921 () Bool)

(assert (=> d!152411 m!1304921))

(assert (=> d!152411 m!1304587))

(assert (=> d!152411 m!1304585))

(declare-fun m!1304923 () Bool)

(assert (=> d!152411 m!1304923))

(assert (=> d!152411 m!1304607))

(declare-fun m!1304925 () Bool)

(assert (=> d!152411 m!1304925))

(declare-fun m!1304927 () Bool)

(assert (=> d!152411 m!1304927))

(declare-fun m!1304929 () Bool)

(assert (=> b!1414681 m!1304929))

(assert (=> b!1414294 d!152411))

(push 1)

(assert (not bm!67146))

(assert (not b!1414401))

(assert (not d!152365))

(assert (not b!1414556))

(assert (not b!1414399))

(assert (not b!1414682))

(assert (not b!1414430))

(assert (not b!1414538))

(assert (not b!1414536))

(assert (not b!1414672))

(assert (not b!1414427))

(assert (not b!1414429))

(assert (not d!152411))

(assert (not d!152371))

(assert (not bm!67138))

(assert (not d!152333))

(assert (not b!1414497))

(assert (not d!152403))

(assert (not bm!67143))

(assert (not d!152369))

(assert (not d!152381))

(assert (not b!1414634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

