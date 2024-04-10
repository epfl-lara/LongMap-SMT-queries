; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121802 () Bool)

(assert start!121802)

(declare-fun b!1414320 () Bool)

(declare-fun e!800429 () Bool)

(declare-fun e!800431 () Bool)

(assert (=> b!1414320 (= e!800429 e!800431)))

(declare-fun res!950836 () Bool)

(assert (=> b!1414320 (=> res!950836 e!800431)))

(declare-datatypes ((SeekEntryResult!10952 0))(
  ( (MissingZero!10952 (index!46194 (_ BitVec 32))) (Found!10952 (index!46195 (_ BitVec 32))) (Intermediate!10952 (undefined!11764 Bool) (index!46196 (_ BitVec 32)) (x!127791 (_ BitVec 32))) (Undefined!10952) (MissingVacant!10952 (index!46197 (_ BitVec 32))) )
))
(declare-fun lt!623508 () SeekEntryResult!10952)

(declare-fun lt!623507 () SeekEntryResult!10952)

(get-info :version)

(assert (=> b!1414320 (= res!950836 (or (= lt!623508 lt!623507) (not ((_ is Intermediate!10952) lt!623507))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!623506 () (_ BitVec 64))

(declare-datatypes ((array!96614 0))(
  ( (array!96615 (arr!46641 (Array (_ BitVec 32) (_ BitVec 64))) (size!47191 (_ BitVec 32))) )
))
(declare-fun lt!623505 () array!96614)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96614 (_ BitVec 32)) SeekEntryResult!10952)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414320 (= lt!623507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623506 mask!2840) lt!623506 lt!623505 mask!2840))))

(declare-fun a!2901 () array!96614)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1414320 (= lt!623506 (select (store (arr!46641 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414320 (= lt!623505 (array!96615 (store (arr!46641 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47191 a!2901)))))

(declare-fun b!1414321 () Bool)

(declare-fun e!800430 () Bool)

(assert (=> b!1414321 (= e!800430 (not e!800429))))

(declare-fun res!950841 () Bool)

(assert (=> b!1414321 (=> res!950841 e!800429)))

(assert (=> b!1414321 (= res!950841 (or (not ((_ is Intermediate!10952) lt!623508)) (undefined!11764 lt!623508)))))

(declare-fun e!800428 () Bool)

(assert (=> b!1414321 e!800428))

(declare-fun res!950838 () Bool)

(assert (=> b!1414321 (=> (not res!950838) (not e!800428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96614 (_ BitVec 32)) Bool)

(assert (=> b!1414321 (= res!950838 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47878 0))(
  ( (Unit!47879) )
))
(declare-fun lt!623509 () Unit!47878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47878)

(assert (=> b!1414321 (= lt!623509 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623510 () (_ BitVec 32))

(assert (=> b!1414321 (= lt!623508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623510 (select (arr!46641 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1414321 (= lt!623510 (toIndex!0 (select (arr!46641 a!2901) j!112) mask!2840))))

(declare-fun b!1414322 () Bool)

(declare-fun res!950840 () Bool)

(assert (=> b!1414322 (=> (not res!950840) (not e!800430))))

(assert (=> b!1414322 (= res!950840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414323 () Bool)

(declare-fun e!800427 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96614 (_ BitVec 32)) SeekEntryResult!10952)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96614 (_ BitVec 32)) SeekEntryResult!10952)

(assert (=> b!1414323 (= e!800427 (= (seekEntryOrOpen!0 lt!623506 lt!623505 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127791 lt!623507) (index!46196 lt!623507) (index!46196 lt!623507) (select (arr!46641 a!2901) j!112) lt!623505 mask!2840)))))

(declare-fun b!1414324 () Bool)

(declare-fun res!950843 () Bool)

(assert (=> b!1414324 (=> (not res!950843) (not e!800430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414324 (= res!950843 (validKeyInArray!0 (select (arr!46641 a!2901) i!1037)))))

(declare-fun b!1414325 () Bool)

(assert (=> b!1414325 (= e!800428 (= (seekEntryOrOpen!0 (select (arr!46641 a!2901) j!112) a!2901 mask!2840) (Found!10952 j!112)))))

(declare-fun b!1414326 () Bool)

(declare-fun res!950837 () Bool)

(assert (=> b!1414326 (=> (not res!950837) (not e!800430))))

(assert (=> b!1414326 (= res!950837 (and (= (size!47191 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47191 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47191 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!950839 () Bool)

(assert (=> start!121802 (=> (not res!950839) (not e!800430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121802 (= res!950839 (validMask!0 mask!2840))))

(assert (=> start!121802 e!800430))

(assert (=> start!121802 true))

(declare-fun array_inv!35669 (array!96614) Bool)

(assert (=> start!121802 (array_inv!35669 a!2901)))

(declare-fun b!1414327 () Bool)

(declare-fun res!950842 () Bool)

(assert (=> b!1414327 (=> (not res!950842) (not e!800430))))

(assert (=> b!1414327 (= res!950842 (validKeyInArray!0 (select (arr!46641 a!2901) j!112)))))

(declare-fun b!1414328 () Bool)

(declare-fun res!950845 () Bool)

(assert (=> b!1414328 (=> (not res!950845) (not e!800430))))

(declare-datatypes ((List!33160 0))(
  ( (Nil!33157) (Cons!33156 (h!34437 (_ BitVec 64)) (t!47854 List!33160)) )
))
(declare-fun arrayNoDuplicates!0 (array!96614 (_ BitVec 32) List!33160) Bool)

(assert (=> b!1414328 (= res!950845 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33157))))

(declare-fun b!1414329 () Bool)

(assert (=> b!1414329 (= e!800431 (or (bvslt (x!127791 lt!623508) #b00000000000000000000000000000000) (bvsgt (x!127791 lt!623508) #b01111111111111111111111111111110) (bvslt (x!127791 lt!623507) #b00000000000000000000000000000000) (bvsgt (x!127791 lt!623507) #b01111111111111111111111111111110) (and (bvsge lt!623510 #b00000000000000000000000000000000) (bvslt lt!623510 (size!47191 a!2901)))))))

(assert (=> b!1414329 e!800427))

(declare-fun res!950844 () Bool)

(assert (=> b!1414329 (=> (not res!950844) (not e!800427))))

(assert (=> b!1414329 (= res!950844 (and (not (undefined!11764 lt!623507)) (= (index!46196 lt!623507) i!1037) (bvslt (x!127791 lt!623507) (x!127791 lt!623508)) (= (select (store (arr!46641 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46196 lt!623507)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623511 () Unit!47878)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47878)

(assert (=> b!1414329 (= lt!623511 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623510 (x!127791 lt!623508) (index!46196 lt!623508) (x!127791 lt!623507) (index!46196 lt!623507) (undefined!11764 lt!623507) mask!2840))))

(assert (= (and start!121802 res!950839) b!1414326))

(assert (= (and b!1414326 res!950837) b!1414324))

(assert (= (and b!1414324 res!950843) b!1414327))

(assert (= (and b!1414327 res!950842) b!1414322))

(assert (= (and b!1414322 res!950840) b!1414328))

(assert (= (and b!1414328 res!950845) b!1414321))

(assert (= (and b!1414321 res!950838) b!1414325))

(assert (= (and b!1414321 (not res!950841)) b!1414320))

(assert (= (and b!1414320 (not res!950836)) b!1414329))

(assert (= (and b!1414329 res!950844) b!1414323))

(declare-fun m!1304625 () Bool)

(assert (=> b!1414325 m!1304625))

(assert (=> b!1414325 m!1304625))

(declare-fun m!1304627 () Bool)

(assert (=> b!1414325 m!1304627))

(assert (=> b!1414327 m!1304625))

(assert (=> b!1414327 m!1304625))

(declare-fun m!1304629 () Bool)

(assert (=> b!1414327 m!1304629))

(assert (=> b!1414321 m!1304625))

(declare-fun m!1304631 () Bool)

(assert (=> b!1414321 m!1304631))

(assert (=> b!1414321 m!1304625))

(assert (=> b!1414321 m!1304625))

(declare-fun m!1304633 () Bool)

(assert (=> b!1414321 m!1304633))

(declare-fun m!1304635 () Bool)

(assert (=> b!1414321 m!1304635))

(declare-fun m!1304637 () Bool)

(assert (=> b!1414321 m!1304637))

(declare-fun m!1304639 () Bool)

(assert (=> b!1414322 m!1304639))

(declare-fun m!1304641 () Bool)

(assert (=> b!1414323 m!1304641))

(assert (=> b!1414323 m!1304625))

(assert (=> b!1414323 m!1304625))

(declare-fun m!1304643 () Bool)

(assert (=> b!1414323 m!1304643))

(declare-fun m!1304645 () Bool)

(assert (=> b!1414324 m!1304645))

(assert (=> b!1414324 m!1304645))

(declare-fun m!1304647 () Bool)

(assert (=> b!1414324 m!1304647))

(declare-fun m!1304649 () Bool)

(assert (=> b!1414320 m!1304649))

(assert (=> b!1414320 m!1304649))

(declare-fun m!1304651 () Bool)

(assert (=> b!1414320 m!1304651))

(declare-fun m!1304653 () Bool)

(assert (=> b!1414320 m!1304653))

(declare-fun m!1304655 () Bool)

(assert (=> b!1414320 m!1304655))

(assert (=> b!1414329 m!1304653))

(declare-fun m!1304657 () Bool)

(assert (=> b!1414329 m!1304657))

(declare-fun m!1304659 () Bool)

(assert (=> b!1414329 m!1304659))

(declare-fun m!1304661 () Bool)

(assert (=> b!1414328 m!1304661))

(declare-fun m!1304663 () Bool)

(assert (=> start!121802 m!1304663))

(declare-fun m!1304665 () Bool)

(assert (=> start!121802 m!1304665))

(check-sat (not b!1414328) (not b!1414322) (not b!1414321) (not b!1414325) (not b!1414327) (not b!1414323) (not b!1414320) (not start!121802) (not b!1414324) (not b!1414329))
(check-sat)
(get-model)

(declare-fun b!1414372 () Bool)

(declare-fun e!800458 () SeekEntryResult!10952)

(declare-fun lt!623540 () SeekEntryResult!10952)

(assert (=> b!1414372 (= e!800458 (MissingZero!10952 (index!46196 lt!623540)))))

(declare-fun b!1414373 () Bool)

(declare-fun e!800459 () SeekEntryResult!10952)

(assert (=> b!1414373 (= e!800459 Undefined!10952)))

(declare-fun b!1414375 () Bool)

(assert (=> b!1414375 (= e!800458 (seekKeyOrZeroReturnVacant!0 (x!127791 lt!623540) (index!46196 lt!623540) (index!46196 lt!623540) lt!623506 lt!623505 mask!2840))))

(declare-fun b!1414376 () Bool)

(declare-fun e!800457 () SeekEntryResult!10952)

(assert (=> b!1414376 (= e!800457 (Found!10952 (index!46196 lt!623540)))))

(declare-fun b!1414377 () Bool)

(declare-fun c!131225 () Bool)

(declare-fun lt!623541 () (_ BitVec 64))

(assert (=> b!1414377 (= c!131225 (= lt!623541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414377 (= e!800457 e!800458)))

(declare-fun d!152317 () Bool)

(declare-fun lt!623539 () SeekEntryResult!10952)

(assert (=> d!152317 (and (or ((_ is Undefined!10952) lt!623539) (not ((_ is Found!10952) lt!623539)) (and (bvsge (index!46195 lt!623539) #b00000000000000000000000000000000) (bvslt (index!46195 lt!623539) (size!47191 lt!623505)))) (or ((_ is Undefined!10952) lt!623539) ((_ is Found!10952) lt!623539) (not ((_ is MissingZero!10952) lt!623539)) (and (bvsge (index!46194 lt!623539) #b00000000000000000000000000000000) (bvslt (index!46194 lt!623539) (size!47191 lt!623505)))) (or ((_ is Undefined!10952) lt!623539) ((_ is Found!10952) lt!623539) ((_ is MissingZero!10952) lt!623539) (not ((_ is MissingVacant!10952) lt!623539)) (and (bvsge (index!46197 lt!623539) #b00000000000000000000000000000000) (bvslt (index!46197 lt!623539) (size!47191 lt!623505)))) (or ((_ is Undefined!10952) lt!623539) (ite ((_ is Found!10952) lt!623539) (= (select (arr!46641 lt!623505) (index!46195 lt!623539)) lt!623506) (ite ((_ is MissingZero!10952) lt!623539) (= (select (arr!46641 lt!623505) (index!46194 lt!623539)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10952) lt!623539) (= (select (arr!46641 lt!623505) (index!46197 lt!623539)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152317 (= lt!623539 e!800459)))

(declare-fun c!131224 () Bool)

(assert (=> d!152317 (= c!131224 (and ((_ is Intermediate!10952) lt!623540) (undefined!11764 lt!623540)))))

(assert (=> d!152317 (= lt!623540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623506 mask!2840) lt!623506 lt!623505 mask!2840))))

(assert (=> d!152317 (validMask!0 mask!2840)))

(assert (=> d!152317 (= (seekEntryOrOpen!0 lt!623506 lt!623505 mask!2840) lt!623539)))

(declare-fun b!1414374 () Bool)

(assert (=> b!1414374 (= e!800459 e!800457)))

(assert (=> b!1414374 (= lt!623541 (select (arr!46641 lt!623505) (index!46196 lt!623540)))))

(declare-fun c!131226 () Bool)

(assert (=> b!1414374 (= c!131226 (= lt!623541 lt!623506))))

(assert (= (and d!152317 c!131224) b!1414373))

(assert (= (and d!152317 (not c!131224)) b!1414374))

(assert (= (and b!1414374 c!131226) b!1414376))

(assert (= (and b!1414374 (not c!131226)) b!1414377))

(assert (= (and b!1414377 c!131225) b!1414372))

(assert (= (and b!1414377 (not c!131225)) b!1414375))

(declare-fun m!1304709 () Bool)

(assert (=> b!1414375 m!1304709))

(declare-fun m!1304711 () Bool)

(assert (=> d!152317 m!1304711))

(assert (=> d!152317 m!1304663))

(declare-fun m!1304713 () Bool)

(assert (=> d!152317 m!1304713))

(declare-fun m!1304715 () Bool)

(assert (=> d!152317 m!1304715))

(assert (=> d!152317 m!1304649))

(assert (=> d!152317 m!1304651))

(assert (=> d!152317 m!1304649))

(declare-fun m!1304717 () Bool)

(assert (=> b!1414374 m!1304717))

(assert (=> b!1414323 d!152317))

(declare-fun b!1414402 () Bool)

(declare-fun e!800476 () SeekEntryResult!10952)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414402 (= e!800476 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127791 lt!623507) #b00000000000000000000000000000001) (nextIndex!0 (index!46196 lt!623507) (x!127791 lt!623507) mask!2840) (index!46196 lt!623507) (select (arr!46641 a!2901) j!112) lt!623505 mask!2840))))

(declare-fun b!1414403 () Bool)

(declare-fun e!800477 () SeekEntryResult!10952)

(assert (=> b!1414403 (= e!800477 Undefined!10952)))

(declare-fun b!1414404 () Bool)

(declare-fun e!800475 () SeekEntryResult!10952)

(assert (=> b!1414404 (= e!800475 (Found!10952 (index!46196 lt!623507)))))

(declare-fun b!1414405 () Bool)

(assert (=> b!1414405 (= e!800476 (MissingVacant!10952 (index!46196 lt!623507)))))

(declare-fun d!152319 () Bool)

(declare-fun lt!623556 () SeekEntryResult!10952)

(assert (=> d!152319 (and (or ((_ is Undefined!10952) lt!623556) (not ((_ is Found!10952) lt!623556)) (and (bvsge (index!46195 lt!623556) #b00000000000000000000000000000000) (bvslt (index!46195 lt!623556) (size!47191 lt!623505)))) (or ((_ is Undefined!10952) lt!623556) ((_ is Found!10952) lt!623556) (not ((_ is MissingVacant!10952) lt!623556)) (not (= (index!46197 lt!623556) (index!46196 lt!623507))) (and (bvsge (index!46197 lt!623556) #b00000000000000000000000000000000) (bvslt (index!46197 lt!623556) (size!47191 lt!623505)))) (or ((_ is Undefined!10952) lt!623556) (ite ((_ is Found!10952) lt!623556) (= (select (arr!46641 lt!623505) (index!46195 lt!623556)) (select (arr!46641 a!2901) j!112)) (and ((_ is MissingVacant!10952) lt!623556) (= (index!46197 lt!623556) (index!46196 lt!623507)) (= (select (arr!46641 lt!623505) (index!46197 lt!623556)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152319 (= lt!623556 e!800477)))

(declare-fun c!131238 () Bool)

(assert (=> d!152319 (= c!131238 (bvsge (x!127791 lt!623507) #b01111111111111111111111111111110))))

(declare-fun lt!623555 () (_ BitVec 64))

(assert (=> d!152319 (= lt!623555 (select (arr!46641 lt!623505) (index!46196 lt!623507)))))

(assert (=> d!152319 (validMask!0 mask!2840)))

(assert (=> d!152319 (= (seekKeyOrZeroReturnVacant!0 (x!127791 lt!623507) (index!46196 lt!623507) (index!46196 lt!623507) (select (arr!46641 a!2901) j!112) lt!623505 mask!2840) lt!623556)))

(declare-fun b!1414406 () Bool)

(declare-fun c!131236 () Bool)

(assert (=> b!1414406 (= c!131236 (= lt!623555 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414406 (= e!800475 e!800476)))

(declare-fun b!1414407 () Bool)

(assert (=> b!1414407 (= e!800477 e!800475)))

(declare-fun c!131237 () Bool)

(assert (=> b!1414407 (= c!131237 (= lt!623555 (select (arr!46641 a!2901) j!112)))))

(assert (= (and d!152319 c!131238) b!1414403))

(assert (= (and d!152319 (not c!131238)) b!1414407))

(assert (= (and b!1414407 c!131237) b!1414404))

(assert (= (and b!1414407 (not c!131237)) b!1414406))

(assert (= (and b!1414406 c!131236) b!1414405))

(assert (= (and b!1414406 (not c!131236)) b!1414402))

(declare-fun m!1304731 () Bool)

(assert (=> b!1414402 m!1304731))

(assert (=> b!1414402 m!1304731))

(assert (=> b!1414402 m!1304625))

(declare-fun m!1304733 () Bool)

(assert (=> b!1414402 m!1304733))

(declare-fun m!1304735 () Bool)

(assert (=> d!152319 m!1304735))

(declare-fun m!1304737 () Bool)

(assert (=> d!152319 m!1304737))

(declare-fun m!1304739 () Bool)

(assert (=> d!152319 m!1304739))

(assert (=> d!152319 m!1304663))

(assert (=> b!1414323 d!152319))

(declare-fun d!152327 () Bool)

(assert (=> d!152327 (= (validKeyInArray!0 (select (arr!46641 a!2901) i!1037)) (and (not (= (select (arr!46641 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46641 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414324 d!152327))

(declare-fun d!152329 () Bool)

(assert (=> d!152329 (and (not (undefined!11764 lt!623507)) (= (index!46196 lt!623507) i!1037) (bvslt (x!127791 lt!623507) (x!127791 lt!623508)))))

(declare-fun lt!623565 () Unit!47878)

(declare-fun choose!62 (array!96614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47878)

(assert (=> d!152329 (= lt!623565 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623510 (x!127791 lt!623508) (index!46196 lt!623508) (x!127791 lt!623507) (index!46196 lt!623507) (undefined!11764 lt!623507) mask!2840))))

(assert (=> d!152329 (validMask!0 mask!2840)))

(assert (=> d!152329 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623510 (x!127791 lt!623508) (index!46196 lt!623508) (x!127791 lt!623507) (index!46196 lt!623507) (undefined!11764 lt!623507) mask!2840) lt!623565)))

(declare-fun bs!41234 () Bool)

(assert (= bs!41234 d!152329))

(declare-fun m!1304741 () Bool)

(assert (=> bs!41234 m!1304741))

(assert (=> bs!41234 m!1304663))

(assert (=> b!1414329 d!152329))

(declare-fun b!1414471 () Bool)

(declare-fun e!800522 () Bool)

(declare-fun e!800520 () Bool)

(assert (=> b!1414471 (= e!800522 e!800520)))

(declare-fun res!950911 () Bool)

(declare-fun lt!623580 () SeekEntryResult!10952)

(assert (=> b!1414471 (= res!950911 (and ((_ is Intermediate!10952) lt!623580) (not (undefined!11764 lt!623580)) (bvslt (x!127791 lt!623580) #b01111111111111111111111111111110) (bvsge (x!127791 lt!623580) #b00000000000000000000000000000000) (bvsge (x!127791 lt!623580) #b00000000000000000000000000000000)))))

(assert (=> b!1414471 (=> (not res!950911) (not e!800520))))

(declare-fun b!1414472 () Bool)

(declare-fun e!800523 () SeekEntryResult!10952)

(assert (=> b!1414472 (= e!800523 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623506 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623506 lt!623505 mask!2840))))

(declare-fun b!1414473 () Bool)

(assert (=> b!1414473 (= e!800523 (Intermediate!10952 false (toIndex!0 lt!623506 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414474 () Bool)

(assert (=> b!1414474 (and (bvsge (index!46196 lt!623580) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623580) (size!47191 lt!623505)))))

(declare-fun e!800519 () Bool)

(assert (=> b!1414474 (= e!800519 (= (select (arr!46641 lt!623505) (index!46196 lt!623580)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414475 () Bool)

(assert (=> b!1414475 (and (bvsge (index!46196 lt!623580) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623580) (size!47191 lt!623505)))))

(declare-fun res!950909 () Bool)

(assert (=> b!1414475 (= res!950909 (= (select (arr!46641 lt!623505) (index!46196 lt!623580)) lt!623506))))

(assert (=> b!1414475 (=> res!950909 e!800519)))

(assert (=> b!1414475 (= e!800520 e!800519)))

(declare-fun d!152331 () Bool)

(assert (=> d!152331 e!800522))

(declare-fun c!131258 () Bool)

(assert (=> d!152331 (= c!131258 (and ((_ is Intermediate!10952) lt!623580) (undefined!11764 lt!623580)))))

(declare-fun e!800521 () SeekEntryResult!10952)

(assert (=> d!152331 (= lt!623580 e!800521)))

(declare-fun c!131257 () Bool)

(assert (=> d!152331 (= c!131257 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623581 () (_ BitVec 64))

(assert (=> d!152331 (= lt!623581 (select (arr!46641 lt!623505) (toIndex!0 lt!623506 mask!2840)))))

(assert (=> d!152331 (validMask!0 mask!2840)))

(assert (=> d!152331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623506 mask!2840) lt!623506 lt!623505 mask!2840) lt!623580)))

(declare-fun b!1414476 () Bool)

(assert (=> b!1414476 (and (bvsge (index!46196 lt!623580) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623580) (size!47191 lt!623505)))))

(declare-fun res!950910 () Bool)

(assert (=> b!1414476 (= res!950910 (= (select (arr!46641 lt!623505) (index!46196 lt!623580)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414476 (=> res!950910 e!800519)))

(declare-fun b!1414477 () Bool)

(assert (=> b!1414477 (= e!800521 (Intermediate!10952 true (toIndex!0 lt!623506 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414478 () Bool)

(assert (=> b!1414478 (= e!800522 (bvsge (x!127791 lt!623580) #b01111111111111111111111111111110))))

(declare-fun b!1414479 () Bool)

(assert (=> b!1414479 (= e!800521 e!800523)))

(declare-fun c!131259 () Bool)

(assert (=> b!1414479 (= c!131259 (or (= lt!623581 lt!623506) (= (bvadd lt!623581 lt!623581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!152331 c!131257) b!1414477))

(assert (= (and d!152331 (not c!131257)) b!1414479))

(assert (= (and b!1414479 c!131259) b!1414473))

(assert (= (and b!1414479 (not c!131259)) b!1414472))

(assert (= (and d!152331 c!131258) b!1414478))

(assert (= (and d!152331 (not c!131258)) b!1414471))

(assert (= (and b!1414471 res!950911) b!1414475))

(assert (= (and b!1414475 (not res!950909)) b!1414476))

(assert (= (and b!1414476 (not res!950910)) b!1414474))

(declare-fun m!1304755 () Bool)

(assert (=> b!1414475 m!1304755))

(assert (=> d!152331 m!1304649))

(declare-fun m!1304757 () Bool)

(assert (=> d!152331 m!1304757))

(assert (=> d!152331 m!1304663))

(assert (=> b!1414474 m!1304755))

(assert (=> b!1414472 m!1304649))

(declare-fun m!1304759 () Bool)

(assert (=> b!1414472 m!1304759))

(assert (=> b!1414472 m!1304759))

(declare-fun m!1304761 () Bool)

(assert (=> b!1414472 m!1304761))

(assert (=> b!1414476 m!1304755))

(assert (=> b!1414320 d!152331))

(declare-fun d!152339 () Bool)

(declare-fun lt!623594 () (_ BitVec 32))

(declare-fun lt!623593 () (_ BitVec 32))

(assert (=> d!152339 (= lt!623594 (bvmul (bvxor lt!623593 (bvlshr lt!623593 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152339 (= lt!623593 ((_ extract 31 0) (bvand (bvxor lt!623506 (bvlshr lt!623506 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152339 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950912 (let ((h!34439 ((_ extract 31 0) (bvand (bvxor lt!623506 (bvlshr lt!623506 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127798 (bvmul (bvxor h!34439 (bvlshr h!34439 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127798 (bvlshr x!127798 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950912 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950912 #b00000000000000000000000000000000))))))

(assert (=> d!152339 (= (toIndex!0 lt!623506 mask!2840) (bvand (bvxor lt!623594 (bvlshr lt!623594 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414320 d!152339))

(declare-fun b!1414516 () Bool)

(declare-fun e!800545 () SeekEntryResult!10952)

(declare-fun lt!623597 () SeekEntryResult!10952)

(assert (=> b!1414516 (= e!800545 (MissingZero!10952 (index!46196 lt!623597)))))

(declare-fun b!1414517 () Bool)

(declare-fun e!800546 () SeekEntryResult!10952)

(assert (=> b!1414517 (= e!800546 Undefined!10952)))

(declare-fun b!1414519 () Bool)

(assert (=> b!1414519 (= e!800545 (seekKeyOrZeroReturnVacant!0 (x!127791 lt!623597) (index!46196 lt!623597) (index!46196 lt!623597) (select (arr!46641 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414520 () Bool)

(declare-fun e!800544 () SeekEntryResult!10952)

(assert (=> b!1414520 (= e!800544 (Found!10952 (index!46196 lt!623597)))))

(declare-fun b!1414521 () Bool)

(declare-fun c!131273 () Bool)

(declare-fun lt!623598 () (_ BitVec 64))

(assert (=> b!1414521 (= c!131273 (= lt!623598 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414521 (= e!800544 e!800545)))

(declare-fun d!152343 () Bool)

(declare-fun lt!623596 () SeekEntryResult!10952)

(assert (=> d!152343 (and (or ((_ is Undefined!10952) lt!623596) (not ((_ is Found!10952) lt!623596)) (and (bvsge (index!46195 lt!623596) #b00000000000000000000000000000000) (bvslt (index!46195 lt!623596) (size!47191 a!2901)))) (or ((_ is Undefined!10952) lt!623596) ((_ is Found!10952) lt!623596) (not ((_ is MissingZero!10952) lt!623596)) (and (bvsge (index!46194 lt!623596) #b00000000000000000000000000000000) (bvslt (index!46194 lt!623596) (size!47191 a!2901)))) (or ((_ is Undefined!10952) lt!623596) ((_ is Found!10952) lt!623596) ((_ is MissingZero!10952) lt!623596) (not ((_ is MissingVacant!10952) lt!623596)) (and (bvsge (index!46197 lt!623596) #b00000000000000000000000000000000) (bvslt (index!46197 lt!623596) (size!47191 a!2901)))) (or ((_ is Undefined!10952) lt!623596) (ite ((_ is Found!10952) lt!623596) (= (select (arr!46641 a!2901) (index!46195 lt!623596)) (select (arr!46641 a!2901) j!112)) (ite ((_ is MissingZero!10952) lt!623596) (= (select (arr!46641 a!2901) (index!46194 lt!623596)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10952) lt!623596) (= (select (arr!46641 a!2901) (index!46197 lt!623596)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152343 (= lt!623596 e!800546)))

(declare-fun c!131272 () Bool)

(assert (=> d!152343 (= c!131272 (and ((_ is Intermediate!10952) lt!623597) (undefined!11764 lt!623597)))))

(assert (=> d!152343 (= lt!623597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46641 a!2901) j!112) mask!2840) (select (arr!46641 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152343 (validMask!0 mask!2840)))

(assert (=> d!152343 (= (seekEntryOrOpen!0 (select (arr!46641 a!2901) j!112) a!2901 mask!2840) lt!623596)))

(declare-fun b!1414518 () Bool)

(assert (=> b!1414518 (= e!800546 e!800544)))

(assert (=> b!1414518 (= lt!623598 (select (arr!46641 a!2901) (index!46196 lt!623597)))))

(declare-fun c!131274 () Bool)

(assert (=> b!1414518 (= c!131274 (= lt!623598 (select (arr!46641 a!2901) j!112)))))

(assert (= (and d!152343 c!131272) b!1414517))

(assert (= (and d!152343 (not c!131272)) b!1414518))

(assert (= (and b!1414518 c!131274) b!1414520))

(assert (= (and b!1414518 (not c!131274)) b!1414521))

(assert (= (and b!1414521 c!131273) b!1414516))

(assert (= (and b!1414521 (not c!131273)) b!1414519))

(assert (=> b!1414519 m!1304625))

(declare-fun m!1304779 () Bool)

(assert (=> b!1414519 m!1304779))

(declare-fun m!1304781 () Bool)

(assert (=> d!152343 m!1304781))

(assert (=> d!152343 m!1304663))

(declare-fun m!1304783 () Bool)

(assert (=> d!152343 m!1304783))

(declare-fun m!1304785 () Bool)

(assert (=> d!152343 m!1304785))

(assert (=> d!152343 m!1304631))

(assert (=> d!152343 m!1304625))

(declare-fun m!1304787 () Bool)

(assert (=> d!152343 m!1304787))

(assert (=> d!152343 m!1304625))

(assert (=> d!152343 m!1304631))

(declare-fun m!1304789 () Bool)

(assert (=> b!1414518 m!1304789))

(assert (=> b!1414325 d!152343))

(declare-fun d!152347 () Bool)

(assert (=> d!152347 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121802 d!152347))

(declare-fun d!152359 () Bool)

(assert (=> d!152359 (= (array_inv!35669 a!2901) (bvsge (size!47191 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121802 d!152359))

(declare-fun b!1414547 () Bool)

(declare-fun e!800565 () Bool)

(declare-fun e!800564 () Bool)

(assert (=> b!1414547 (= e!800565 e!800564)))

(declare-fun c!131282 () Bool)

(assert (=> b!1414547 (= c!131282 (validKeyInArray!0 (select (arr!46641 a!2901) j!112)))))

(declare-fun b!1414548 () Bool)

(declare-fun e!800566 () Bool)

(declare-fun call!67152 () Bool)

(assert (=> b!1414548 (= e!800566 call!67152)))

(declare-fun bm!67149 () Bool)

(assert (=> bm!67149 (= call!67152 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414549 () Bool)

(assert (=> b!1414549 (= e!800564 e!800566)))

(declare-fun lt!623633 () (_ BitVec 64))

(assert (=> b!1414549 (= lt!623633 (select (arr!46641 a!2901) j!112))))

(declare-fun lt!623635 () Unit!47878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96614 (_ BitVec 64) (_ BitVec 32)) Unit!47878)

(assert (=> b!1414549 (= lt!623635 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623633 j!112))))

(declare-fun arrayContainsKey!0 (array!96614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1414549 (arrayContainsKey!0 a!2901 lt!623633 #b00000000000000000000000000000000)))

(declare-fun lt!623634 () Unit!47878)

(assert (=> b!1414549 (= lt!623634 lt!623635)))

(declare-fun res!950939 () Bool)

(assert (=> b!1414549 (= res!950939 (= (seekEntryOrOpen!0 (select (arr!46641 a!2901) j!112) a!2901 mask!2840) (Found!10952 j!112)))))

(assert (=> b!1414549 (=> (not res!950939) (not e!800566))))

(declare-fun b!1414550 () Bool)

(assert (=> b!1414550 (= e!800564 call!67152)))

(declare-fun d!152363 () Bool)

(declare-fun res!950938 () Bool)

(assert (=> d!152363 (=> res!950938 e!800565)))

(assert (=> d!152363 (= res!950938 (bvsge j!112 (size!47191 a!2901)))))

(assert (=> d!152363 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800565)))

(assert (= (and d!152363 (not res!950938)) b!1414547))

(assert (= (and b!1414547 c!131282) b!1414549))

(assert (= (and b!1414547 (not c!131282)) b!1414550))

(assert (= (and b!1414549 res!950939) b!1414548))

(assert (= (or b!1414548 b!1414550) bm!67149))

(assert (=> b!1414547 m!1304625))

(assert (=> b!1414547 m!1304625))

(assert (=> b!1414547 m!1304629))

(declare-fun m!1304821 () Bool)

(assert (=> bm!67149 m!1304821))

(assert (=> b!1414549 m!1304625))

(declare-fun m!1304823 () Bool)

(assert (=> b!1414549 m!1304823))

(declare-fun m!1304825 () Bool)

(assert (=> b!1414549 m!1304825))

(assert (=> b!1414549 m!1304625))

(assert (=> b!1414549 m!1304627))

(assert (=> b!1414321 d!152363))

(declare-fun d!152373 () Bool)

(assert (=> d!152373 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623648 () Unit!47878)

(declare-fun choose!38 (array!96614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47878)

(assert (=> d!152373 (= lt!623648 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152373 (validMask!0 mask!2840)))

(assert (=> d!152373 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623648)))

(declare-fun bs!41238 () Bool)

(assert (= bs!41238 d!152373))

(assert (=> bs!41238 m!1304637))

(declare-fun m!1304835 () Bool)

(assert (=> bs!41238 m!1304835))

(assert (=> bs!41238 m!1304663))

(assert (=> b!1414321 d!152373))

(declare-fun b!1414572 () Bool)

(declare-fun e!800581 () Bool)

(declare-fun e!800579 () Bool)

(assert (=> b!1414572 (= e!800581 e!800579)))

(declare-fun res!950945 () Bool)

(declare-fun lt!623649 () SeekEntryResult!10952)

(assert (=> b!1414572 (= res!950945 (and ((_ is Intermediate!10952) lt!623649) (not (undefined!11764 lt!623649)) (bvslt (x!127791 lt!623649) #b01111111111111111111111111111110) (bvsge (x!127791 lt!623649) #b00000000000000000000000000000000) (bvsge (x!127791 lt!623649) #b00000000000000000000000000000000)))))

(assert (=> b!1414572 (=> (not res!950945) (not e!800579))))

(declare-fun b!1414573 () Bool)

(declare-fun e!800582 () SeekEntryResult!10952)

(assert (=> b!1414573 (= e!800582 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623510 #b00000000000000000000000000000000 mask!2840) (select (arr!46641 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414574 () Bool)

(assert (=> b!1414574 (= e!800582 (Intermediate!10952 false lt!623510 #b00000000000000000000000000000000))))

(declare-fun b!1414575 () Bool)

(assert (=> b!1414575 (and (bvsge (index!46196 lt!623649) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623649) (size!47191 a!2901)))))

(declare-fun e!800578 () Bool)

(assert (=> b!1414575 (= e!800578 (= (select (arr!46641 a!2901) (index!46196 lt!623649)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414576 () Bool)

(assert (=> b!1414576 (and (bvsge (index!46196 lt!623649) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623649) (size!47191 a!2901)))))

(declare-fun res!950943 () Bool)

(assert (=> b!1414576 (= res!950943 (= (select (arr!46641 a!2901) (index!46196 lt!623649)) (select (arr!46641 a!2901) j!112)))))

(assert (=> b!1414576 (=> res!950943 e!800578)))

(assert (=> b!1414576 (= e!800579 e!800578)))

(declare-fun d!152383 () Bool)

(assert (=> d!152383 e!800581))

(declare-fun c!131293 () Bool)

(assert (=> d!152383 (= c!131293 (and ((_ is Intermediate!10952) lt!623649) (undefined!11764 lt!623649)))))

(declare-fun e!800580 () SeekEntryResult!10952)

(assert (=> d!152383 (= lt!623649 e!800580)))

(declare-fun c!131292 () Bool)

(assert (=> d!152383 (= c!131292 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623650 () (_ BitVec 64))

(assert (=> d!152383 (= lt!623650 (select (arr!46641 a!2901) lt!623510))))

(assert (=> d!152383 (validMask!0 mask!2840)))

(assert (=> d!152383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623510 (select (arr!46641 a!2901) j!112) a!2901 mask!2840) lt!623649)))

(declare-fun b!1414577 () Bool)

(assert (=> b!1414577 (and (bvsge (index!46196 lt!623649) #b00000000000000000000000000000000) (bvslt (index!46196 lt!623649) (size!47191 a!2901)))))

(declare-fun res!950944 () Bool)

(assert (=> b!1414577 (= res!950944 (= (select (arr!46641 a!2901) (index!46196 lt!623649)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414577 (=> res!950944 e!800578)))

(declare-fun b!1414578 () Bool)

(assert (=> b!1414578 (= e!800580 (Intermediate!10952 true lt!623510 #b00000000000000000000000000000000))))

(declare-fun b!1414579 () Bool)

(assert (=> b!1414579 (= e!800581 (bvsge (x!127791 lt!623649) #b01111111111111111111111111111110))))

(declare-fun b!1414580 () Bool)

(assert (=> b!1414580 (= e!800580 e!800582)))

(declare-fun c!131294 () Bool)

(assert (=> b!1414580 (= c!131294 (or (= lt!623650 (select (arr!46641 a!2901) j!112)) (= (bvadd lt!623650 lt!623650) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!152383 c!131292) b!1414578))

(assert (= (and d!152383 (not c!131292)) b!1414580))

(assert (= (and b!1414580 c!131294) b!1414574))

(assert (= (and b!1414580 (not c!131294)) b!1414573))

(assert (= (and d!152383 c!131293) b!1414579))

(assert (= (and d!152383 (not c!131293)) b!1414572))

(assert (= (and b!1414572 res!950945) b!1414576))

(assert (= (and b!1414576 (not res!950943)) b!1414577))

(assert (= (and b!1414577 (not res!950944)) b!1414575))

(declare-fun m!1304837 () Bool)

(assert (=> b!1414576 m!1304837))

(declare-fun m!1304839 () Bool)

(assert (=> d!152383 m!1304839))

(assert (=> d!152383 m!1304663))

(assert (=> b!1414575 m!1304837))

(declare-fun m!1304841 () Bool)

(assert (=> b!1414573 m!1304841))

(assert (=> b!1414573 m!1304841))

(assert (=> b!1414573 m!1304625))

(declare-fun m!1304843 () Bool)

(assert (=> b!1414573 m!1304843))

(assert (=> b!1414577 m!1304837))

(assert (=> b!1414321 d!152383))

(declare-fun d!152385 () Bool)

(declare-fun lt!623652 () (_ BitVec 32))

(declare-fun lt!623651 () (_ BitVec 32))

(assert (=> d!152385 (= lt!623652 (bvmul (bvxor lt!623651 (bvlshr lt!623651 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152385 (= lt!623651 ((_ extract 31 0) (bvand (bvxor (select (arr!46641 a!2901) j!112) (bvlshr (select (arr!46641 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152385 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950912 (let ((h!34439 ((_ extract 31 0) (bvand (bvxor (select (arr!46641 a!2901) j!112) (bvlshr (select (arr!46641 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127798 (bvmul (bvxor h!34439 (bvlshr h!34439 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127798 (bvlshr x!127798 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950912 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950912 #b00000000000000000000000000000000))))))

(assert (=> d!152385 (= (toIndex!0 (select (arr!46641 a!2901) j!112) mask!2840) (bvand (bvxor lt!623652 (bvlshr lt!623652 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414321 d!152385))

(declare-fun b!1414587 () Bool)

(declare-fun e!800587 () Bool)

(declare-fun e!800586 () Bool)

(assert (=> b!1414587 (= e!800587 e!800586)))

(declare-fun c!131298 () Bool)

(assert (=> b!1414587 (= c!131298 (validKeyInArray!0 (select (arr!46641 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414588 () Bool)

(declare-fun e!800588 () Bool)

(declare-fun call!67153 () Bool)

(assert (=> b!1414588 (= e!800588 call!67153)))

(declare-fun bm!67150 () Bool)

(assert (=> bm!67150 (= call!67153 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414589 () Bool)

(assert (=> b!1414589 (= e!800586 e!800588)))

(declare-fun lt!623656 () (_ BitVec 64))

(assert (=> b!1414589 (= lt!623656 (select (arr!46641 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623658 () Unit!47878)

(assert (=> b!1414589 (= lt!623658 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623656 #b00000000000000000000000000000000))))

(assert (=> b!1414589 (arrayContainsKey!0 a!2901 lt!623656 #b00000000000000000000000000000000)))

(declare-fun lt!623657 () Unit!47878)

(assert (=> b!1414589 (= lt!623657 lt!623658)))

(declare-fun res!950947 () Bool)

(assert (=> b!1414589 (= res!950947 (= (seekEntryOrOpen!0 (select (arr!46641 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10952 #b00000000000000000000000000000000)))))

(assert (=> b!1414589 (=> (not res!950947) (not e!800588))))

(declare-fun b!1414590 () Bool)

(assert (=> b!1414590 (= e!800586 call!67153)))

(declare-fun d!152387 () Bool)

(declare-fun res!950946 () Bool)

(assert (=> d!152387 (=> res!950946 e!800587)))

(assert (=> d!152387 (= res!950946 (bvsge #b00000000000000000000000000000000 (size!47191 a!2901)))))

(assert (=> d!152387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800587)))

(assert (= (and d!152387 (not res!950946)) b!1414587))

(assert (= (and b!1414587 c!131298) b!1414589))

(assert (= (and b!1414587 (not c!131298)) b!1414590))

(assert (= (and b!1414589 res!950947) b!1414588))

(assert (= (or b!1414588 b!1414590) bm!67150))

(declare-fun m!1304845 () Bool)

(assert (=> b!1414587 m!1304845))

(assert (=> b!1414587 m!1304845))

(declare-fun m!1304847 () Bool)

(assert (=> b!1414587 m!1304847))

(declare-fun m!1304849 () Bool)

(assert (=> bm!67150 m!1304849))

(assert (=> b!1414589 m!1304845))

(declare-fun m!1304851 () Bool)

(assert (=> b!1414589 m!1304851))

(declare-fun m!1304853 () Bool)

(assert (=> b!1414589 m!1304853))

(assert (=> b!1414589 m!1304845))

(declare-fun m!1304857 () Bool)

(assert (=> b!1414589 m!1304857))

(assert (=> b!1414322 d!152387))

(declare-fun d!152389 () Bool)

(assert (=> d!152389 (= (validKeyInArray!0 (select (arr!46641 a!2901) j!112)) (and (not (= (select (arr!46641 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46641 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414327 d!152389))

(declare-fun bm!67153 () Bool)

(declare-fun call!67156 () Bool)

(declare-fun c!131301 () Bool)

(assert (=> bm!67153 (= call!67156 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131301 (Cons!33156 (select (arr!46641 a!2901) #b00000000000000000000000000000000) Nil!33157) Nil!33157)))))

(declare-fun b!1414601 () Bool)

(declare-fun e!800599 () Bool)

(assert (=> b!1414601 (= e!800599 call!67156)))

(declare-fun b!1414602 () Bool)

(declare-fun e!800600 () Bool)

(declare-fun contains!9820 (List!33160 (_ BitVec 64)) Bool)

(assert (=> b!1414602 (= e!800600 (contains!9820 Nil!33157 (select (arr!46641 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152391 () Bool)

(declare-fun res!950955 () Bool)

(declare-fun e!800597 () Bool)

(assert (=> d!152391 (=> res!950955 e!800597)))

(assert (=> d!152391 (= res!950955 (bvsge #b00000000000000000000000000000000 (size!47191 a!2901)))))

(assert (=> d!152391 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33157) e!800597)))

(declare-fun b!1414603 () Bool)

(assert (=> b!1414603 (= e!800599 call!67156)))

(declare-fun b!1414604 () Bool)

(declare-fun e!800598 () Bool)

(assert (=> b!1414604 (= e!800598 e!800599)))

(assert (=> b!1414604 (= c!131301 (validKeyInArray!0 (select (arr!46641 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414605 () Bool)

(assert (=> b!1414605 (= e!800597 e!800598)))

(declare-fun res!950956 () Bool)

(assert (=> b!1414605 (=> (not res!950956) (not e!800598))))

(assert (=> b!1414605 (= res!950956 (not e!800600))))

(declare-fun res!950954 () Bool)

(assert (=> b!1414605 (=> (not res!950954) (not e!800600))))

(assert (=> b!1414605 (= res!950954 (validKeyInArray!0 (select (arr!46641 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152391 (not res!950955)) b!1414605))

(assert (= (and b!1414605 res!950954) b!1414602))

(assert (= (and b!1414605 res!950956) b!1414604))

(assert (= (and b!1414604 c!131301) b!1414601))

(assert (= (and b!1414604 (not c!131301)) b!1414603))

(assert (= (or b!1414601 b!1414603) bm!67153))

(assert (=> bm!67153 m!1304845))

(declare-fun m!1304871 () Bool)

(assert (=> bm!67153 m!1304871))

(assert (=> b!1414602 m!1304845))

(assert (=> b!1414602 m!1304845))

(declare-fun m!1304873 () Bool)

(assert (=> b!1414602 m!1304873))

(assert (=> b!1414604 m!1304845))

(assert (=> b!1414604 m!1304845))

(assert (=> b!1414604 m!1304847))

(assert (=> b!1414605 m!1304845))

(assert (=> b!1414605 m!1304845))

(assert (=> b!1414605 m!1304847))

(assert (=> b!1414328 d!152391))

(check-sat (not b!1414602) (not b!1414519) (not bm!67149) (not d!152317) (not b!1414472) (not b!1414549) (not d!152343) (not b!1414375) (not d!152373) (not b!1414589) (not d!152383) (not b!1414402) (not d!152329) (not b!1414573) (not bm!67153) (not d!152331) (not b!1414604) (not d!152319) (not b!1414605) (not b!1414587) (not b!1414547) (not bm!67150))
(check-sat)
