; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121868 () Bool)

(assert start!121868)

(declare-fun b!1414626 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96570 0))(
  ( (array!96571 (arr!46618 (Array (_ BitVec 32) (_ BitVec 64))) (size!47170 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96570)

(declare-fun e!800620 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10955 0))(
  ( (MissingZero!10955 (index!46209 (_ BitVec 32))) (Found!10955 (index!46210 (_ BitVec 32))) (Intermediate!10955 (undefined!11767 Bool) (index!46211 (_ BitVec 32)) (x!127811 (_ BitVec 32))) (Undefined!10955) (MissingVacant!10955 (index!46212 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96570 (_ BitVec 32)) SeekEntryResult!10955)

(assert (=> b!1414626 (= e!800620 (= (seekEntryOrOpen!0 (select (arr!46618 a!2901) j!112) a!2901 mask!2840) (Found!10955 j!112)))))

(declare-fun b!1414627 () Bool)

(declare-fun e!800622 () Bool)

(declare-fun e!800623 () Bool)

(assert (=> b!1414627 (= e!800622 e!800623)))

(declare-fun res!950959 () Bool)

(assert (=> b!1414627 (=> res!950959 e!800623)))

(declare-fun lt!623517 () SeekEntryResult!10955)

(declare-fun lt!623518 () SeekEntryResult!10955)

(get-info :version)

(assert (=> b!1414627 (= res!950959 (or (= lt!623517 lt!623518) (not ((_ is Intermediate!10955) lt!623518))))))

(declare-fun lt!623514 () (_ BitVec 64))

(declare-fun lt!623515 () array!96570)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96570 (_ BitVec 32)) SeekEntryResult!10955)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414627 (= lt!623518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623514 mask!2840) lt!623514 lt!623515 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1414627 (= lt!623514 (select (store (arr!46618 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414627 (= lt!623515 (array!96571 (store (arr!46618 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47170 a!2901)))))

(declare-fun b!1414628 () Bool)

(declare-fun res!950960 () Bool)

(declare-fun e!800621 () Bool)

(assert (=> b!1414628 (=> (not res!950960) (not e!800621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96570 (_ BitVec 32)) Bool)

(assert (=> b!1414628 (= res!950960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414629 () Bool)

(assert (=> b!1414629 (= e!800621 (not e!800622))))

(declare-fun res!950956 () Bool)

(assert (=> b!1414629 (=> res!950956 e!800622)))

(assert (=> b!1414629 (= res!950956 (or (not ((_ is Intermediate!10955) lt!623517)) (undefined!11767 lt!623517)))))

(assert (=> b!1414629 e!800620))

(declare-fun res!950965 () Bool)

(assert (=> b!1414629 (=> (not res!950965) (not e!800620))))

(assert (=> b!1414629 (= res!950965 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47727 0))(
  ( (Unit!47728) )
))
(declare-fun lt!623516 () Unit!47727)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47727)

(assert (=> b!1414629 (= lt!623516 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623513 () (_ BitVec 32))

(assert (=> b!1414629 (= lt!623517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623513 (select (arr!46618 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1414629 (= lt!623513 (toIndex!0 (select (arr!46618 a!2901) j!112) mask!2840))))

(declare-fun b!1414630 () Bool)

(declare-fun res!950961 () Bool)

(assert (=> b!1414630 (=> (not res!950961) (not e!800621))))

(assert (=> b!1414630 (= res!950961 (and (= (size!47170 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47170 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47170 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!950964 () Bool)

(assert (=> start!121868 (=> (not res!950964) (not e!800621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121868 (= res!950964 (validMask!0 mask!2840))))

(assert (=> start!121868 e!800621))

(assert (=> start!121868 true))

(declare-fun array_inv!35851 (array!96570) Bool)

(assert (=> start!121868 (array_inv!35851 a!2901)))

(declare-fun e!800619 () Bool)

(declare-fun b!1414631 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96570 (_ BitVec 32)) SeekEntryResult!10955)

(assert (=> b!1414631 (= e!800619 (= (seekEntryOrOpen!0 lt!623514 lt!623515 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127811 lt!623518) (index!46211 lt!623518) (index!46211 lt!623518) (select (arr!46618 a!2901) j!112) lt!623515 mask!2840)))))

(declare-fun b!1414632 () Bool)

(assert (=> b!1414632 (= e!800623 (or (bvslt (x!127811 lt!623517) #b00000000000000000000000000000000) (bvsgt (x!127811 lt!623517) #b01111111111111111111111111111110) (bvslt (x!127811 lt!623518) #b00000000000000000000000000000000) (bvsgt (x!127811 lt!623518) #b01111111111111111111111111111110) (bvslt lt!623513 #b00000000000000000000000000000000) (bvsge lt!623513 (size!47170 a!2901)) (and (bvsge (index!46211 lt!623517) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623517) (size!47170 a!2901)))))))

(assert (=> b!1414632 e!800619))

(declare-fun res!950957 () Bool)

(assert (=> b!1414632 (=> (not res!950957) (not e!800619))))

(assert (=> b!1414632 (= res!950957 (and (not (undefined!11767 lt!623518)) (= (index!46211 lt!623518) i!1037) (bvslt (x!127811 lt!623518) (x!127811 lt!623517)) (= (select (store (arr!46618 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46211 lt!623518)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623519 () Unit!47727)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47727)

(assert (=> b!1414632 (= lt!623519 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623513 (x!127811 lt!623517) (index!46211 lt!623517) (x!127811 lt!623518) (index!46211 lt!623518) (undefined!11767 lt!623518) mask!2840))))

(declare-fun b!1414633 () Bool)

(declare-fun res!950958 () Bool)

(assert (=> b!1414633 (=> (not res!950958) (not e!800621))))

(declare-datatypes ((List!33215 0))(
  ( (Nil!33212) (Cons!33211 (h!34495 (_ BitVec 64)) (t!47901 List!33215)) )
))
(declare-fun arrayNoDuplicates!0 (array!96570 (_ BitVec 32) List!33215) Bool)

(assert (=> b!1414633 (= res!950958 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33212))))

(declare-fun b!1414634 () Bool)

(declare-fun res!950962 () Bool)

(assert (=> b!1414634 (=> (not res!950962) (not e!800621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414634 (= res!950962 (validKeyInArray!0 (select (arr!46618 a!2901) i!1037)))))

(declare-fun b!1414635 () Bool)

(declare-fun res!950963 () Bool)

(assert (=> b!1414635 (=> (not res!950963) (not e!800621))))

(assert (=> b!1414635 (= res!950963 (validKeyInArray!0 (select (arr!46618 a!2901) j!112)))))

(assert (= (and start!121868 res!950964) b!1414630))

(assert (= (and b!1414630 res!950961) b!1414634))

(assert (= (and b!1414634 res!950962) b!1414635))

(assert (= (and b!1414635 res!950963) b!1414628))

(assert (= (and b!1414628 res!950960) b!1414633))

(assert (= (and b!1414633 res!950958) b!1414629))

(assert (= (and b!1414629 res!950965) b!1414626))

(assert (= (and b!1414629 (not res!950956)) b!1414627))

(assert (= (and b!1414627 (not res!950959)) b!1414632))

(assert (= (and b!1414632 res!950957) b!1414631))

(declare-fun m!1304395 () Bool)

(assert (=> b!1414626 m!1304395))

(assert (=> b!1414626 m!1304395))

(declare-fun m!1304397 () Bool)

(assert (=> b!1414626 m!1304397))

(declare-fun m!1304399 () Bool)

(assert (=> b!1414633 m!1304399))

(declare-fun m!1304401 () Bool)

(assert (=> b!1414634 m!1304401))

(assert (=> b!1414634 m!1304401))

(declare-fun m!1304403 () Bool)

(assert (=> b!1414634 m!1304403))

(assert (=> b!1414635 m!1304395))

(assert (=> b!1414635 m!1304395))

(declare-fun m!1304405 () Bool)

(assert (=> b!1414635 m!1304405))

(declare-fun m!1304407 () Bool)

(assert (=> b!1414632 m!1304407))

(declare-fun m!1304409 () Bool)

(assert (=> b!1414632 m!1304409))

(declare-fun m!1304411 () Bool)

(assert (=> b!1414632 m!1304411))

(assert (=> b!1414629 m!1304395))

(declare-fun m!1304413 () Bool)

(assert (=> b!1414629 m!1304413))

(assert (=> b!1414629 m!1304395))

(declare-fun m!1304415 () Bool)

(assert (=> b!1414629 m!1304415))

(assert (=> b!1414629 m!1304395))

(declare-fun m!1304417 () Bool)

(assert (=> b!1414629 m!1304417))

(declare-fun m!1304419 () Bool)

(assert (=> b!1414629 m!1304419))

(declare-fun m!1304421 () Bool)

(assert (=> b!1414631 m!1304421))

(assert (=> b!1414631 m!1304395))

(assert (=> b!1414631 m!1304395))

(declare-fun m!1304423 () Bool)

(assert (=> b!1414631 m!1304423))

(declare-fun m!1304425 () Bool)

(assert (=> b!1414628 m!1304425))

(declare-fun m!1304427 () Bool)

(assert (=> start!121868 m!1304427))

(declare-fun m!1304429 () Bool)

(assert (=> start!121868 m!1304429))

(declare-fun m!1304431 () Bool)

(assert (=> b!1414627 m!1304431))

(assert (=> b!1414627 m!1304431))

(declare-fun m!1304433 () Bool)

(assert (=> b!1414627 m!1304433))

(assert (=> b!1414627 m!1304407))

(declare-fun m!1304435 () Bool)

(assert (=> b!1414627 m!1304435))

(check-sat (not b!1414634) (not b!1414626) (not b!1414632) (not b!1414627) (not start!121868) (not b!1414629) (not b!1414628) (not b!1414631) (not b!1414635) (not b!1414633))
(check-sat)
(get-model)

(declare-fun b!1414708 () Bool)

(declare-fun e!800669 () SeekEntryResult!10955)

(declare-fun lt!623569 () SeekEntryResult!10955)

(assert (=> b!1414708 (= e!800669 (MissingZero!10955 (index!46211 lt!623569)))))

(declare-fun d!152289 () Bool)

(declare-fun lt!623570 () SeekEntryResult!10955)

(assert (=> d!152289 (and (or ((_ is Undefined!10955) lt!623570) (not ((_ is Found!10955) lt!623570)) (and (bvsge (index!46210 lt!623570) #b00000000000000000000000000000000) (bvslt (index!46210 lt!623570) (size!47170 lt!623515)))) (or ((_ is Undefined!10955) lt!623570) ((_ is Found!10955) lt!623570) (not ((_ is MissingZero!10955) lt!623570)) (and (bvsge (index!46209 lt!623570) #b00000000000000000000000000000000) (bvslt (index!46209 lt!623570) (size!47170 lt!623515)))) (or ((_ is Undefined!10955) lt!623570) ((_ is Found!10955) lt!623570) ((_ is MissingZero!10955) lt!623570) (not ((_ is MissingVacant!10955) lt!623570)) (and (bvsge (index!46212 lt!623570) #b00000000000000000000000000000000) (bvslt (index!46212 lt!623570) (size!47170 lt!623515)))) (or ((_ is Undefined!10955) lt!623570) (ite ((_ is Found!10955) lt!623570) (= (select (arr!46618 lt!623515) (index!46210 lt!623570)) lt!623514) (ite ((_ is MissingZero!10955) lt!623570) (= (select (arr!46618 lt!623515) (index!46209 lt!623570)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10955) lt!623570) (= (select (arr!46618 lt!623515) (index!46212 lt!623570)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!800668 () SeekEntryResult!10955)

(assert (=> d!152289 (= lt!623570 e!800668)))

(declare-fun c!131321 () Bool)

(assert (=> d!152289 (= c!131321 (and ((_ is Intermediate!10955) lt!623569) (undefined!11767 lt!623569)))))

(assert (=> d!152289 (= lt!623569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623514 mask!2840) lt!623514 lt!623515 mask!2840))))

(assert (=> d!152289 (validMask!0 mask!2840)))

(assert (=> d!152289 (= (seekEntryOrOpen!0 lt!623514 lt!623515 mask!2840) lt!623570)))

(declare-fun b!1414709 () Bool)

(assert (=> b!1414709 (= e!800668 Undefined!10955)))

(declare-fun b!1414710 () Bool)

(declare-fun e!800667 () SeekEntryResult!10955)

(assert (=> b!1414710 (= e!800668 e!800667)))

(declare-fun lt!623568 () (_ BitVec 64))

(assert (=> b!1414710 (= lt!623568 (select (arr!46618 lt!623515) (index!46211 lt!623569)))))

(declare-fun c!131323 () Bool)

(assert (=> b!1414710 (= c!131323 (= lt!623568 lt!623514))))

(declare-fun b!1414711 () Bool)

(assert (=> b!1414711 (= e!800667 (Found!10955 (index!46211 lt!623569)))))

(declare-fun b!1414712 () Bool)

(assert (=> b!1414712 (= e!800669 (seekKeyOrZeroReturnVacant!0 (x!127811 lt!623569) (index!46211 lt!623569) (index!46211 lt!623569) lt!623514 lt!623515 mask!2840))))

(declare-fun b!1414713 () Bool)

(declare-fun c!131322 () Bool)

(assert (=> b!1414713 (= c!131322 (= lt!623568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414713 (= e!800667 e!800669)))

(assert (= (and d!152289 c!131321) b!1414709))

(assert (= (and d!152289 (not c!131321)) b!1414710))

(assert (= (and b!1414710 c!131323) b!1414711))

(assert (= (and b!1414710 (not c!131323)) b!1414713))

(assert (= (and b!1414713 c!131322) b!1414708))

(assert (= (and b!1414713 (not c!131322)) b!1414712))

(assert (=> d!152289 m!1304431))

(assert (=> d!152289 m!1304433))

(assert (=> d!152289 m!1304431))

(declare-fun m!1304521 () Bool)

(assert (=> d!152289 m!1304521))

(declare-fun m!1304523 () Bool)

(assert (=> d!152289 m!1304523))

(assert (=> d!152289 m!1304427))

(declare-fun m!1304525 () Bool)

(assert (=> d!152289 m!1304525))

(declare-fun m!1304527 () Bool)

(assert (=> b!1414710 m!1304527))

(declare-fun m!1304529 () Bool)

(assert (=> b!1414712 m!1304529))

(assert (=> b!1414631 d!152289))

(declare-fun b!1414726 () Bool)

(declare-fun e!800676 () SeekEntryResult!10955)

(assert (=> b!1414726 (= e!800676 (Found!10955 (index!46211 lt!623518)))))

(declare-fun b!1414727 () Bool)

(declare-fun e!800678 () SeekEntryResult!10955)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414727 (= e!800678 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127811 lt!623518) #b00000000000000000000000000000001) (nextIndex!0 (index!46211 lt!623518) (x!127811 lt!623518) mask!2840) (index!46211 lt!623518) (select (arr!46618 a!2901) j!112) lt!623515 mask!2840))))

(declare-fun d!152291 () Bool)

(declare-fun lt!623576 () SeekEntryResult!10955)

(assert (=> d!152291 (and (or ((_ is Undefined!10955) lt!623576) (not ((_ is Found!10955) lt!623576)) (and (bvsge (index!46210 lt!623576) #b00000000000000000000000000000000) (bvslt (index!46210 lt!623576) (size!47170 lt!623515)))) (or ((_ is Undefined!10955) lt!623576) ((_ is Found!10955) lt!623576) (not ((_ is MissingVacant!10955) lt!623576)) (not (= (index!46212 lt!623576) (index!46211 lt!623518))) (and (bvsge (index!46212 lt!623576) #b00000000000000000000000000000000) (bvslt (index!46212 lt!623576) (size!47170 lt!623515)))) (or ((_ is Undefined!10955) lt!623576) (ite ((_ is Found!10955) lt!623576) (= (select (arr!46618 lt!623515) (index!46210 lt!623576)) (select (arr!46618 a!2901) j!112)) (and ((_ is MissingVacant!10955) lt!623576) (= (index!46212 lt!623576) (index!46211 lt!623518)) (= (select (arr!46618 lt!623515) (index!46212 lt!623576)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!800677 () SeekEntryResult!10955)

(assert (=> d!152291 (= lt!623576 e!800677)))

(declare-fun c!131332 () Bool)

(assert (=> d!152291 (= c!131332 (bvsge (x!127811 lt!623518) #b01111111111111111111111111111110))))

(declare-fun lt!623575 () (_ BitVec 64))

(assert (=> d!152291 (= lt!623575 (select (arr!46618 lt!623515) (index!46211 lt!623518)))))

(assert (=> d!152291 (validMask!0 mask!2840)))

(assert (=> d!152291 (= (seekKeyOrZeroReturnVacant!0 (x!127811 lt!623518) (index!46211 lt!623518) (index!46211 lt!623518) (select (arr!46618 a!2901) j!112) lt!623515 mask!2840) lt!623576)))

(declare-fun b!1414728 () Bool)

(declare-fun c!131331 () Bool)

(assert (=> b!1414728 (= c!131331 (= lt!623575 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414728 (= e!800676 e!800678)))

(declare-fun b!1414729 () Bool)

(assert (=> b!1414729 (= e!800678 (MissingVacant!10955 (index!46211 lt!623518)))))

(declare-fun b!1414730 () Bool)

(assert (=> b!1414730 (= e!800677 Undefined!10955)))

(declare-fun b!1414731 () Bool)

(assert (=> b!1414731 (= e!800677 e!800676)))

(declare-fun c!131330 () Bool)

(assert (=> b!1414731 (= c!131330 (= lt!623575 (select (arr!46618 a!2901) j!112)))))

(assert (= (and d!152291 c!131332) b!1414730))

(assert (= (and d!152291 (not c!131332)) b!1414731))

(assert (= (and b!1414731 c!131330) b!1414726))

(assert (= (and b!1414731 (not c!131330)) b!1414728))

(assert (= (and b!1414728 c!131331) b!1414729))

(assert (= (and b!1414728 (not c!131331)) b!1414727))

(declare-fun m!1304531 () Bool)

(assert (=> b!1414727 m!1304531))

(assert (=> b!1414727 m!1304531))

(assert (=> b!1414727 m!1304395))

(declare-fun m!1304533 () Bool)

(assert (=> b!1414727 m!1304533))

(declare-fun m!1304535 () Bool)

(assert (=> d!152291 m!1304535))

(declare-fun m!1304537 () Bool)

(assert (=> d!152291 m!1304537))

(declare-fun m!1304539 () Bool)

(assert (=> d!152291 m!1304539))

(assert (=> d!152291 m!1304427))

(assert (=> b!1414631 d!152291))

(declare-fun b!1414732 () Bool)

(declare-fun e!800681 () SeekEntryResult!10955)

(declare-fun lt!623578 () SeekEntryResult!10955)

(assert (=> b!1414732 (= e!800681 (MissingZero!10955 (index!46211 lt!623578)))))

(declare-fun d!152299 () Bool)

(declare-fun lt!623579 () SeekEntryResult!10955)

(assert (=> d!152299 (and (or ((_ is Undefined!10955) lt!623579) (not ((_ is Found!10955) lt!623579)) (and (bvsge (index!46210 lt!623579) #b00000000000000000000000000000000) (bvslt (index!46210 lt!623579) (size!47170 a!2901)))) (or ((_ is Undefined!10955) lt!623579) ((_ is Found!10955) lt!623579) (not ((_ is MissingZero!10955) lt!623579)) (and (bvsge (index!46209 lt!623579) #b00000000000000000000000000000000) (bvslt (index!46209 lt!623579) (size!47170 a!2901)))) (or ((_ is Undefined!10955) lt!623579) ((_ is Found!10955) lt!623579) ((_ is MissingZero!10955) lt!623579) (not ((_ is MissingVacant!10955) lt!623579)) (and (bvsge (index!46212 lt!623579) #b00000000000000000000000000000000) (bvslt (index!46212 lt!623579) (size!47170 a!2901)))) (or ((_ is Undefined!10955) lt!623579) (ite ((_ is Found!10955) lt!623579) (= (select (arr!46618 a!2901) (index!46210 lt!623579)) (select (arr!46618 a!2901) j!112)) (ite ((_ is MissingZero!10955) lt!623579) (= (select (arr!46618 a!2901) (index!46209 lt!623579)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10955) lt!623579) (= (select (arr!46618 a!2901) (index!46212 lt!623579)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!800680 () SeekEntryResult!10955)

(assert (=> d!152299 (= lt!623579 e!800680)))

(declare-fun c!131333 () Bool)

(assert (=> d!152299 (= c!131333 (and ((_ is Intermediate!10955) lt!623578) (undefined!11767 lt!623578)))))

(assert (=> d!152299 (= lt!623578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46618 a!2901) j!112) mask!2840) (select (arr!46618 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152299 (validMask!0 mask!2840)))

(assert (=> d!152299 (= (seekEntryOrOpen!0 (select (arr!46618 a!2901) j!112) a!2901 mask!2840) lt!623579)))

(declare-fun b!1414733 () Bool)

(assert (=> b!1414733 (= e!800680 Undefined!10955)))

(declare-fun b!1414734 () Bool)

(declare-fun e!800679 () SeekEntryResult!10955)

(assert (=> b!1414734 (= e!800680 e!800679)))

(declare-fun lt!623577 () (_ BitVec 64))

(assert (=> b!1414734 (= lt!623577 (select (arr!46618 a!2901) (index!46211 lt!623578)))))

(declare-fun c!131335 () Bool)

(assert (=> b!1414734 (= c!131335 (= lt!623577 (select (arr!46618 a!2901) j!112)))))

(declare-fun b!1414735 () Bool)

(assert (=> b!1414735 (= e!800679 (Found!10955 (index!46211 lt!623578)))))

(declare-fun b!1414736 () Bool)

(assert (=> b!1414736 (= e!800681 (seekKeyOrZeroReturnVacant!0 (x!127811 lt!623578) (index!46211 lt!623578) (index!46211 lt!623578) (select (arr!46618 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414737 () Bool)

(declare-fun c!131334 () Bool)

(assert (=> b!1414737 (= c!131334 (= lt!623577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414737 (= e!800679 e!800681)))

(assert (= (and d!152299 c!131333) b!1414733))

(assert (= (and d!152299 (not c!131333)) b!1414734))

(assert (= (and b!1414734 c!131335) b!1414735))

(assert (= (and b!1414734 (not c!131335)) b!1414737))

(assert (= (and b!1414737 c!131334) b!1414732))

(assert (= (and b!1414737 (not c!131334)) b!1414736))

(assert (=> d!152299 m!1304413))

(assert (=> d!152299 m!1304395))

(declare-fun m!1304541 () Bool)

(assert (=> d!152299 m!1304541))

(assert (=> d!152299 m!1304395))

(assert (=> d!152299 m!1304413))

(declare-fun m!1304543 () Bool)

(assert (=> d!152299 m!1304543))

(declare-fun m!1304545 () Bool)

(assert (=> d!152299 m!1304545))

(assert (=> d!152299 m!1304427))

(declare-fun m!1304547 () Bool)

(assert (=> d!152299 m!1304547))

(declare-fun m!1304549 () Bool)

(assert (=> b!1414734 m!1304549))

(assert (=> b!1414736 m!1304395))

(declare-fun m!1304551 () Bool)

(assert (=> b!1414736 m!1304551))

(assert (=> b!1414626 d!152299))

(declare-fun d!152305 () Bool)

(assert (=> d!152305 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121868 d!152305))

(declare-fun d!152309 () Bool)

(assert (=> d!152309 (= (array_inv!35851 a!2901) (bvsge (size!47170 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121868 d!152309))

(declare-fun d!152311 () Bool)

(assert (=> d!152311 (and (not (undefined!11767 lt!623518)) (= (index!46211 lt!623518) i!1037) (bvslt (x!127811 lt!623518) (x!127811 lt!623517)))))

(declare-fun lt!623594 () Unit!47727)

(declare-fun choose!62 (array!96570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47727)

(assert (=> d!152311 (= lt!623594 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623513 (x!127811 lt!623517) (index!46211 lt!623517) (x!127811 lt!623518) (index!46211 lt!623518) (undefined!11767 lt!623518) mask!2840))))

(assert (=> d!152311 (validMask!0 mask!2840)))

(assert (=> d!152311 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623513 (x!127811 lt!623517) (index!46211 lt!623517) (x!127811 lt!623518) (index!46211 lt!623518) (undefined!11767 lt!623518) mask!2840) lt!623594)))

(declare-fun bs!41216 () Bool)

(assert (= bs!41216 d!152311))

(declare-fun m!1304567 () Bool)

(assert (=> bs!41216 m!1304567))

(assert (=> bs!41216 m!1304427))

(assert (=> b!1414632 d!152311))

(declare-fun b!1414816 () Bool)

(declare-fun e!800731 () SeekEntryResult!10955)

(assert (=> b!1414816 (= e!800731 (Intermediate!10955 true (toIndex!0 lt!623514 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414817 () Bool)

(declare-fun lt!623627 () SeekEntryResult!10955)

(assert (=> b!1414817 (and (bvsge (index!46211 lt!623627) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623627) (size!47170 lt!623515)))))

(declare-fun res!951044 () Bool)

(assert (=> b!1414817 (= res!951044 (= (select (arr!46618 lt!623515) (index!46211 lt!623627)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800730 () Bool)

(assert (=> b!1414817 (=> res!951044 e!800730)))

(declare-fun b!1414818 () Bool)

(declare-fun e!800729 () Bool)

(declare-fun e!800728 () Bool)

(assert (=> b!1414818 (= e!800729 e!800728)))

(declare-fun res!951045 () Bool)

(assert (=> b!1414818 (= res!951045 (and ((_ is Intermediate!10955) lt!623627) (not (undefined!11767 lt!623627)) (bvslt (x!127811 lt!623627) #b01111111111111111111111111111110) (bvsge (x!127811 lt!623627) #b00000000000000000000000000000000) (bvsge (x!127811 lt!623627) #b00000000000000000000000000000000)))))

(assert (=> b!1414818 (=> (not res!951045) (not e!800728))))

(declare-fun b!1414819 () Bool)

(declare-fun e!800732 () SeekEntryResult!10955)

(assert (=> b!1414819 (= e!800731 e!800732)))

(declare-fun c!131367 () Bool)

(declare-fun lt!623626 () (_ BitVec 64))

(assert (=> b!1414819 (= c!131367 (or (= lt!623626 lt!623514) (= (bvadd lt!623626 lt!623626) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414820 () Bool)

(assert (=> b!1414820 (and (bvsge (index!46211 lt!623627) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623627) (size!47170 lt!623515)))))

(declare-fun res!951046 () Bool)

(assert (=> b!1414820 (= res!951046 (= (select (arr!46618 lt!623515) (index!46211 lt!623627)) lt!623514))))

(assert (=> b!1414820 (=> res!951046 e!800730)))

(assert (=> b!1414820 (= e!800728 e!800730)))

(declare-fun d!152317 () Bool)

(assert (=> d!152317 e!800729))

(declare-fun c!131366 () Bool)

(assert (=> d!152317 (= c!131366 (and ((_ is Intermediate!10955) lt!623627) (undefined!11767 lt!623627)))))

(assert (=> d!152317 (= lt!623627 e!800731)))

(declare-fun c!131368 () Bool)

(assert (=> d!152317 (= c!131368 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152317 (= lt!623626 (select (arr!46618 lt!623515) (toIndex!0 lt!623514 mask!2840)))))

(assert (=> d!152317 (validMask!0 mask!2840)))

(assert (=> d!152317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623514 mask!2840) lt!623514 lt!623515 mask!2840) lt!623627)))

(declare-fun b!1414821 () Bool)

(assert (=> b!1414821 (= e!800732 (Intermediate!10955 false (toIndex!0 lt!623514 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414822 () Bool)

(assert (=> b!1414822 (= e!800729 (bvsge (x!127811 lt!623627) #b01111111111111111111111111111110))))

(declare-fun b!1414823 () Bool)

(assert (=> b!1414823 (= e!800732 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623514 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623514 lt!623515 mask!2840))))

(declare-fun b!1414824 () Bool)

(assert (=> b!1414824 (and (bvsge (index!46211 lt!623627) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623627) (size!47170 lt!623515)))))

(assert (=> b!1414824 (= e!800730 (= (select (arr!46618 lt!623515) (index!46211 lt!623627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!152317 c!131368) b!1414816))

(assert (= (and d!152317 (not c!131368)) b!1414819))

(assert (= (and b!1414819 c!131367) b!1414821))

(assert (= (and b!1414819 (not c!131367)) b!1414823))

(assert (= (and d!152317 c!131366) b!1414822))

(assert (= (and d!152317 (not c!131366)) b!1414818))

(assert (= (and b!1414818 res!951045) b!1414820))

(assert (= (and b!1414820 (not res!951046)) b!1414817))

(assert (= (and b!1414817 (not res!951044)) b!1414824))

(assert (=> b!1414823 m!1304431))

(declare-fun m!1304599 () Bool)

(assert (=> b!1414823 m!1304599))

(assert (=> b!1414823 m!1304599))

(declare-fun m!1304601 () Bool)

(assert (=> b!1414823 m!1304601))

(assert (=> d!152317 m!1304431))

(declare-fun m!1304603 () Bool)

(assert (=> d!152317 m!1304603))

(assert (=> d!152317 m!1304427))

(declare-fun m!1304605 () Bool)

(assert (=> b!1414824 m!1304605))

(assert (=> b!1414817 m!1304605))

(assert (=> b!1414820 m!1304605))

(assert (=> b!1414627 d!152317))

(declare-fun d!152325 () Bool)

(declare-fun lt!623636 () (_ BitVec 32))

(declare-fun lt!623635 () (_ BitVec 32))

(assert (=> d!152325 (= lt!623636 (bvmul (bvxor lt!623635 (bvlshr lt!623635 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152325 (= lt!623635 ((_ extract 31 0) (bvand (bvxor lt!623514 (bvlshr lt!623514 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152325 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951047 (let ((h!34498 ((_ extract 31 0) (bvand (bvxor lt!623514 (bvlshr lt!623514 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127818 (bvmul (bvxor h!34498 (bvlshr h!34498 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127818 (bvlshr x!127818 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951047 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951047 #b00000000000000000000000000000000))))))

(assert (=> d!152325 (= (toIndex!0 lt!623514 mask!2840) (bvand (bvxor lt!623636 (bvlshr lt!623636 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414627 d!152325))

(declare-fun b!1414839 () Bool)

(declare-fun e!800744 () Bool)

(declare-fun call!67149 () Bool)

(assert (=> b!1414839 (= e!800744 call!67149)))

(declare-fun b!1414840 () Bool)

(declare-fun e!800746 () Bool)

(assert (=> b!1414840 (= e!800746 e!800744)))

(declare-fun c!131372 () Bool)

(assert (=> b!1414840 (= c!131372 (validKeyInArray!0 (select (arr!46618 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414841 () Bool)

(declare-fun e!800745 () Bool)

(assert (=> b!1414841 (= e!800745 e!800746)))

(declare-fun res!951057 () Bool)

(assert (=> b!1414841 (=> (not res!951057) (not e!800746))))

(declare-fun e!800747 () Bool)

(assert (=> b!1414841 (= res!951057 (not e!800747))))

(declare-fun res!951056 () Bool)

(assert (=> b!1414841 (=> (not res!951056) (not e!800747))))

(assert (=> b!1414841 (= res!951056 (validKeyInArray!0 (select (arr!46618 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67146 () Bool)

(assert (=> bm!67146 (= call!67149 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131372 (Cons!33211 (select (arr!46618 a!2901) #b00000000000000000000000000000000) Nil!33212) Nil!33212)))))

(declare-fun d!152329 () Bool)

(declare-fun res!951058 () Bool)

(assert (=> d!152329 (=> res!951058 e!800745)))

(assert (=> d!152329 (= res!951058 (bvsge #b00000000000000000000000000000000 (size!47170 a!2901)))))

(assert (=> d!152329 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33212) e!800745)))

(declare-fun b!1414842 () Bool)

(assert (=> b!1414842 (= e!800744 call!67149)))

(declare-fun b!1414843 () Bool)

(declare-fun contains!9786 (List!33215 (_ BitVec 64)) Bool)

(assert (=> b!1414843 (= e!800747 (contains!9786 Nil!33212 (select (arr!46618 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152329 (not res!951058)) b!1414841))

(assert (= (and b!1414841 res!951056) b!1414843))

(assert (= (and b!1414841 res!951057) b!1414840))

(assert (= (and b!1414840 c!131372) b!1414842))

(assert (= (and b!1414840 (not c!131372)) b!1414839))

(assert (= (or b!1414842 b!1414839) bm!67146))

(declare-fun m!1304615 () Bool)

(assert (=> b!1414840 m!1304615))

(assert (=> b!1414840 m!1304615))

(declare-fun m!1304617 () Bool)

(assert (=> b!1414840 m!1304617))

(assert (=> b!1414841 m!1304615))

(assert (=> b!1414841 m!1304615))

(assert (=> b!1414841 m!1304617))

(assert (=> bm!67146 m!1304615))

(declare-fun m!1304619 () Bool)

(assert (=> bm!67146 m!1304619))

(assert (=> b!1414843 m!1304615))

(assert (=> b!1414843 m!1304615))

(declare-fun m!1304621 () Bool)

(assert (=> b!1414843 m!1304621))

(assert (=> b!1414633 d!152329))

(declare-fun b!1414870 () Bool)

(declare-fun e!800766 () Bool)

(declare-fun call!67152 () Bool)

(assert (=> b!1414870 (= e!800766 call!67152)))

(declare-fun b!1414871 () Bool)

(declare-fun e!800765 () Bool)

(assert (=> b!1414871 (= e!800765 call!67152)))

(declare-fun bm!67149 () Bool)

(assert (=> bm!67149 (= call!67152 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414872 () Bool)

(declare-fun e!800764 () Bool)

(assert (=> b!1414872 (= e!800764 e!800765)))

(declare-fun c!131381 () Bool)

(assert (=> b!1414872 (= c!131381 (validKeyInArray!0 (select (arr!46618 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152337 () Bool)

(declare-fun res!951069 () Bool)

(assert (=> d!152337 (=> res!951069 e!800764)))

(assert (=> d!152337 (= res!951069 (bvsge #b00000000000000000000000000000000 (size!47170 a!2901)))))

(assert (=> d!152337 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800764)))

(declare-fun b!1414873 () Bool)

(assert (=> b!1414873 (= e!800765 e!800766)))

(declare-fun lt!623653 () (_ BitVec 64))

(assert (=> b!1414873 (= lt!623653 (select (arr!46618 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623654 () Unit!47727)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96570 (_ BitVec 64) (_ BitVec 32)) Unit!47727)

(assert (=> b!1414873 (= lt!623654 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623653 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1414873 (arrayContainsKey!0 a!2901 lt!623653 #b00000000000000000000000000000000)))

(declare-fun lt!623655 () Unit!47727)

(assert (=> b!1414873 (= lt!623655 lt!623654)))

(declare-fun res!951070 () Bool)

(assert (=> b!1414873 (= res!951070 (= (seekEntryOrOpen!0 (select (arr!46618 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10955 #b00000000000000000000000000000000)))))

(assert (=> b!1414873 (=> (not res!951070) (not e!800766))))

(assert (= (and d!152337 (not res!951069)) b!1414872))

(assert (= (and b!1414872 c!131381) b!1414873))

(assert (= (and b!1414872 (not c!131381)) b!1414871))

(assert (= (and b!1414873 res!951070) b!1414870))

(assert (= (or b!1414870 b!1414871) bm!67149))

(declare-fun m!1304625 () Bool)

(assert (=> bm!67149 m!1304625))

(assert (=> b!1414872 m!1304615))

(assert (=> b!1414872 m!1304615))

(assert (=> b!1414872 m!1304617))

(assert (=> b!1414873 m!1304615))

(declare-fun m!1304627 () Bool)

(assert (=> b!1414873 m!1304627))

(declare-fun m!1304629 () Bool)

(assert (=> b!1414873 m!1304629))

(assert (=> b!1414873 m!1304615))

(declare-fun m!1304631 () Bool)

(assert (=> b!1414873 m!1304631))

(assert (=> b!1414628 d!152337))

(declare-fun d!152341 () Bool)

(assert (=> d!152341 (= (validKeyInArray!0 (select (arr!46618 a!2901) i!1037)) (and (not (= (select (arr!46618 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46618 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414634 d!152341))

(declare-fun b!1414883 () Bool)

(declare-fun e!800774 () Bool)

(declare-fun call!67153 () Bool)

(assert (=> b!1414883 (= e!800774 call!67153)))

(declare-fun b!1414884 () Bool)

(declare-fun e!800773 () Bool)

(assert (=> b!1414884 (= e!800773 call!67153)))

(declare-fun bm!67150 () Bool)

(assert (=> bm!67150 (= call!67153 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414885 () Bool)

(declare-fun e!800772 () Bool)

(assert (=> b!1414885 (= e!800772 e!800773)))

(declare-fun c!131385 () Bool)

(assert (=> b!1414885 (= c!131385 (validKeyInArray!0 (select (arr!46618 a!2901) j!112)))))

(declare-fun d!152345 () Bool)

(declare-fun res!951074 () Bool)

(assert (=> d!152345 (=> res!951074 e!800772)))

(assert (=> d!152345 (= res!951074 (bvsge j!112 (size!47170 a!2901)))))

(assert (=> d!152345 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800772)))

(declare-fun b!1414886 () Bool)

(assert (=> b!1414886 (= e!800773 e!800774)))

(declare-fun lt!623658 () (_ BitVec 64))

(assert (=> b!1414886 (= lt!623658 (select (arr!46618 a!2901) j!112))))

(declare-fun lt!623659 () Unit!47727)

(assert (=> b!1414886 (= lt!623659 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623658 j!112))))

(assert (=> b!1414886 (arrayContainsKey!0 a!2901 lt!623658 #b00000000000000000000000000000000)))

(declare-fun lt!623660 () Unit!47727)

(assert (=> b!1414886 (= lt!623660 lt!623659)))

(declare-fun res!951075 () Bool)

(assert (=> b!1414886 (= res!951075 (= (seekEntryOrOpen!0 (select (arr!46618 a!2901) j!112) a!2901 mask!2840) (Found!10955 j!112)))))

(assert (=> b!1414886 (=> (not res!951075) (not e!800774))))

(assert (= (and d!152345 (not res!951074)) b!1414885))

(assert (= (and b!1414885 c!131385) b!1414886))

(assert (= (and b!1414885 (not c!131385)) b!1414884))

(assert (= (and b!1414886 res!951075) b!1414883))

(assert (= (or b!1414883 b!1414884) bm!67150))

(declare-fun m!1304641 () Bool)

(assert (=> bm!67150 m!1304641))

(assert (=> b!1414885 m!1304395))

(assert (=> b!1414885 m!1304395))

(assert (=> b!1414885 m!1304405))

(assert (=> b!1414886 m!1304395))

(declare-fun m!1304643 () Bool)

(assert (=> b!1414886 m!1304643))

(declare-fun m!1304645 () Bool)

(assert (=> b!1414886 m!1304645))

(assert (=> b!1414886 m!1304395))

(assert (=> b!1414886 m!1304397))

(assert (=> b!1414629 d!152345))

(declare-fun d!152347 () Bool)

(assert (=> d!152347 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623669 () Unit!47727)

(declare-fun choose!38 (array!96570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47727)

(assert (=> d!152347 (= lt!623669 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152347 (validMask!0 mask!2840)))

(assert (=> d!152347 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623669)))

(declare-fun bs!41219 () Bool)

(assert (= bs!41219 d!152347))

(assert (=> bs!41219 m!1304419))

(declare-fun m!1304647 () Bool)

(assert (=> bs!41219 m!1304647))

(assert (=> bs!41219 m!1304427))

(assert (=> b!1414629 d!152347))

(declare-fun b!1414887 () Bool)

(declare-fun e!800778 () SeekEntryResult!10955)

(assert (=> b!1414887 (= e!800778 (Intermediate!10955 true lt!623513 #b00000000000000000000000000000000))))

(declare-fun b!1414888 () Bool)

(declare-fun lt!623671 () SeekEntryResult!10955)

(assert (=> b!1414888 (and (bvsge (index!46211 lt!623671) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623671) (size!47170 a!2901)))))

(declare-fun res!951077 () Bool)

(assert (=> b!1414888 (= res!951077 (= (select (arr!46618 a!2901) (index!46211 lt!623671)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800777 () Bool)

(assert (=> b!1414888 (=> res!951077 e!800777)))

(declare-fun b!1414889 () Bool)

(declare-fun e!800776 () Bool)

(declare-fun e!800775 () Bool)

(assert (=> b!1414889 (= e!800776 e!800775)))

(declare-fun res!951078 () Bool)

(assert (=> b!1414889 (= res!951078 (and ((_ is Intermediate!10955) lt!623671) (not (undefined!11767 lt!623671)) (bvslt (x!127811 lt!623671) #b01111111111111111111111111111110) (bvsge (x!127811 lt!623671) #b00000000000000000000000000000000) (bvsge (x!127811 lt!623671) #b00000000000000000000000000000000)))))

(assert (=> b!1414889 (=> (not res!951078) (not e!800775))))

(declare-fun b!1414890 () Bool)

(declare-fun e!800779 () SeekEntryResult!10955)

(assert (=> b!1414890 (= e!800778 e!800779)))

(declare-fun c!131387 () Bool)

(declare-fun lt!623670 () (_ BitVec 64))

(assert (=> b!1414890 (= c!131387 (or (= lt!623670 (select (arr!46618 a!2901) j!112)) (= (bvadd lt!623670 lt!623670) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414891 () Bool)

(assert (=> b!1414891 (and (bvsge (index!46211 lt!623671) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623671) (size!47170 a!2901)))))

(declare-fun res!951079 () Bool)

(assert (=> b!1414891 (= res!951079 (= (select (arr!46618 a!2901) (index!46211 lt!623671)) (select (arr!46618 a!2901) j!112)))))

(assert (=> b!1414891 (=> res!951079 e!800777)))

(assert (=> b!1414891 (= e!800775 e!800777)))

(declare-fun d!152351 () Bool)

(assert (=> d!152351 e!800776))

(declare-fun c!131386 () Bool)

(assert (=> d!152351 (= c!131386 (and ((_ is Intermediate!10955) lt!623671) (undefined!11767 lt!623671)))))

(assert (=> d!152351 (= lt!623671 e!800778)))

(declare-fun c!131388 () Bool)

(assert (=> d!152351 (= c!131388 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152351 (= lt!623670 (select (arr!46618 a!2901) lt!623513))))

(assert (=> d!152351 (validMask!0 mask!2840)))

(assert (=> d!152351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623513 (select (arr!46618 a!2901) j!112) a!2901 mask!2840) lt!623671)))

(declare-fun b!1414892 () Bool)

(assert (=> b!1414892 (= e!800779 (Intermediate!10955 false lt!623513 #b00000000000000000000000000000000))))

(declare-fun b!1414893 () Bool)

(assert (=> b!1414893 (= e!800776 (bvsge (x!127811 lt!623671) #b01111111111111111111111111111110))))

(declare-fun b!1414894 () Bool)

(assert (=> b!1414894 (= e!800779 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623513 #b00000000000000000000000000000000 mask!2840) (select (arr!46618 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414895 () Bool)

(assert (=> b!1414895 (and (bvsge (index!46211 lt!623671) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623671) (size!47170 a!2901)))))

(assert (=> b!1414895 (= e!800777 (= (select (arr!46618 a!2901) (index!46211 lt!623671)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!152351 c!131388) b!1414887))

(assert (= (and d!152351 (not c!131388)) b!1414890))

(assert (= (and b!1414890 c!131387) b!1414892))

(assert (= (and b!1414890 (not c!131387)) b!1414894))

(assert (= (and d!152351 c!131386) b!1414893))

(assert (= (and d!152351 (not c!131386)) b!1414889))

(assert (= (and b!1414889 res!951078) b!1414891))

(assert (= (and b!1414891 (not res!951079)) b!1414888))

(assert (= (and b!1414888 (not res!951077)) b!1414895))

(declare-fun m!1304649 () Bool)

(assert (=> b!1414894 m!1304649))

(assert (=> b!1414894 m!1304649))

(assert (=> b!1414894 m!1304395))

(declare-fun m!1304651 () Bool)

(assert (=> b!1414894 m!1304651))

(declare-fun m!1304653 () Bool)

(assert (=> d!152351 m!1304653))

(assert (=> d!152351 m!1304427))

(declare-fun m!1304655 () Bool)

(assert (=> b!1414895 m!1304655))

(assert (=> b!1414888 m!1304655))

(assert (=> b!1414891 m!1304655))

(assert (=> b!1414629 d!152351))

(declare-fun d!152353 () Bool)

(declare-fun lt!623677 () (_ BitVec 32))

(declare-fun lt!623676 () (_ BitVec 32))

(assert (=> d!152353 (= lt!623677 (bvmul (bvxor lt!623676 (bvlshr lt!623676 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152353 (= lt!623676 ((_ extract 31 0) (bvand (bvxor (select (arr!46618 a!2901) j!112) (bvlshr (select (arr!46618 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152353 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951047 (let ((h!34498 ((_ extract 31 0) (bvand (bvxor (select (arr!46618 a!2901) j!112) (bvlshr (select (arr!46618 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127818 (bvmul (bvxor h!34498 (bvlshr h!34498 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127818 (bvlshr x!127818 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951047 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951047 #b00000000000000000000000000000000))))))

(assert (=> d!152353 (= (toIndex!0 (select (arr!46618 a!2901) j!112) mask!2840) (bvand (bvxor lt!623677 (bvlshr lt!623677 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414629 d!152353))

(declare-fun d!152355 () Bool)

(assert (=> d!152355 (= (validKeyInArray!0 (select (arr!46618 a!2901) j!112)) (and (not (= (select (arr!46618 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46618 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414635 d!152355))

(check-sat (not b!1414712) (not d!152311) (not b!1414843) (not bm!67146) (not bm!67150) (not b!1414872) (not b!1414873) (not b!1414736) (not b!1414885) (not b!1414886) (not b!1414840) (not b!1414823) (not d!152317) (not b!1414894) (not d!152351) (not d!152291) (not d!152299) (not d!152289) (not bm!67149) (not b!1414727) (not d!152347) (not b!1414841))
(check-sat)
