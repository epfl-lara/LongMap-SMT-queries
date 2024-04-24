; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121916 () Bool)

(assert start!121916)

(declare-fun b!1415013 () Bool)

(declare-fun res!951084 () Bool)

(declare-fun e!800903 () Bool)

(assert (=> b!1415013 (=> (not res!951084) (not e!800903))))

(declare-datatypes ((array!96713 0))(
  ( (array!96714 (arr!46690 (Array (_ BitVec 32) (_ BitVec 64))) (size!47241 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96713)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415013 (= res!951084 (validKeyInArray!0 (select (arr!46690 a!2901) i!1037)))))

(declare-fun res!951091 () Bool)

(assert (=> start!121916 (=> (not res!951091) (not e!800903))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121916 (= res!951091 (validMask!0 mask!2840))))

(assert (=> start!121916 e!800903))

(assert (=> start!121916 true))

(declare-fun array_inv!35971 (array!96713) Bool)

(assert (=> start!121916 (array_inv!35971 a!2901)))

(declare-fun lt!623669 () array!96713)

(declare-datatypes ((SeekEntryResult!10904 0))(
  ( (MissingZero!10904 (index!45999 (_ BitVec 32))) (Found!10904 (index!46000 (_ BitVec 32))) (Intermediate!10904 (undefined!11716 Bool) (index!46001 (_ BitVec 32)) (x!127742 (_ BitVec 32))) (Undefined!10904) (MissingVacant!10904 (index!46002 (_ BitVec 32))) )
))
(declare-fun lt!623667 () SeekEntryResult!10904)

(declare-fun b!1415014 () Bool)

(declare-fun lt!623664 () (_ BitVec 64))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!800902 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96713 (_ BitVec 32)) SeekEntryResult!10904)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96713 (_ BitVec 32)) SeekEntryResult!10904)

(assert (=> b!1415014 (= e!800902 (= (seekEntryOrOpen!0 lt!623664 lt!623669 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127742 lt!623667) (index!46001 lt!623667) (index!46001 lt!623667) (select (arr!46690 a!2901) j!112) lt!623669 mask!2840)))))

(declare-fun b!1415015 () Bool)

(declare-fun res!951082 () Bool)

(assert (=> b!1415015 (=> (not res!951082) (not e!800903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96713 (_ BitVec 32)) Bool)

(assert (=> b!1415015 (= res!951082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415016 () Bool)

(declare-fun res!951090 () Bool)

(assert (=> b!1415016 (=> (not res!951090) (not e!800903))))

(declare-datatypes ((List!33196 0))(
  ( (Nil!33193) (Cons!33192 (h!34478 (_ BitVec 64)) (t!47882 List!33196)) )
))
(declare-fun arrayNoDuplicates!0 (array!96713 (_ BitVec 32) List!33196) Bool)

(assert (=> b!1415016 (= res!951090 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33193))))

(declare-fun b!1415017 () Bool)

(declare-fun e!800898 () Bool)

(declare-fun lt!623665 () SeekEntryResult!10904)

(assert (=> b!1415017 (= e!800898 (or (bvslt (x!127742 lt!623665) #b00000000000000000000000000000000) (bvsgt (x!127742 lt!623665) #b01111111111111111111111111111110) (and (bvsge (x!127742 lt!623667) #b00000000000000000000000000000000) (bvsle (x!127742 lt!623667) #b01111111111111111111111111111110))))))

(assert (=> b!1415017 e!800902))

(declare-fun res!951088 () Bool)

(assert (=> b!1415017 (=> (not res!951088) (not e!800902))))

(assert (=> b!1415017 (= res!951088 (and (not (undefined!11716 lt!623667)) (= (index!46001 lt!623667) i!1037) (bvslt (x!127742 lt!623667) (x!127742 lt!623665)) (= (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46001 lt!623667)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47809 0))(
  ( (Unit!47810) )
))
(declare-fun lt!623666 () Unit!47809)

(declare-fun lt!623668 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47809)

(assert (=> b!1415017 (= lt!623666 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623668 (x!127742 lt!623665) (index!46001 lt!623665) (x!127742 lt!623667) (index!46001 lt!623667) (undefined!11716 lt!623667) mask!2840))))

(declare-fun b!1415018 () Bool)

(declare-fun e!800901 () Bool)

(assert (=> b!1415018 (= e!800901 e!800898)))

(declare-fun res!951085 () Bool)

(assert (=> b!1415018 (=> res!951085 e!800898)))

(get-info :version)

(assert (=> b!1415018 (= res!951085 (or (= lt!623665 lt!623667) (not ((_ is Intermediate!10904) lt!623667))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96713 (_ BitVec 32)) SeekEntryResult!10904)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415018 (= lt!623667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623664 mask!2840) lt!623664 lt!623669 mask!2840))))

(assert (=> b!1415018 (= lt!623664 (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415018 (= lt!623669 (array!96714 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47241 a!2901)))))

(declare-fun b!1415019 () Bool)

(declare-fun res!951086 () Bool)

(assert (=> b!1415019 (=> (not res!951086) (not e!800903))))

(assert (=> b!1415019 (= res!951086 (validKeyInArray!0 (select (arr!46690 a!2901) j!112)))))

(declare-fun b!1415020 () Bool)

(assert (=> b!1415020 (= e!800903 (not e!800901))))

(declare-fun res!951083 () Bool)

(assert (=> b!1415020 (=> res!951083 e!800901)))

(assert (=> b!1415020 (= res!951083 (or (not ((_ is Intermediate!10904) lt!623665)) (undefined!11716 lt!623665)))))

(declare-fun e!800899 () Bool)

(assert (=> b!1415020 e!800899))

(declare-fun res!951087 () Bool)

(assert (=> b!1415020 (=> (not res!951087) (not e!800899))))

(assert (=> b!1415020 (= res!951087 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623663 () Unit!47809)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47809)

(assert (=> b!1415020 (= lt!623663 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415020 (= lt!623665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623668 (select (arr!46690 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415020 (= lt!623668 (toIndex!0 (select (arr!46690 a!2901) j!112) mask!2840))))

(declare-fun b!1415021 () Bool)

(assert (=> b!1415021 (= e!800899 (= (seekEntryOrOpen!0 (select (arr!46690 a!2901) j!112) a!2901 mask!2840) (Found!10904 j!112)))))

(declare-fun b!1415022 () Bool)

(declare-fun res!951089 () Bool)

(assert (=> b!1415022 (=> (not res!951089) (not e!800903))))

(assert (=> b!1415022 (= res!951089 (and (= (size!47241 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47241 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47241 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121916 res!951091) b!1415022))

(assert (= (and b!1415022 res!951089) b!1415013))

(assert (= (and b!1415013 res!951084) b!1415019))

(assert (= (and b!1415019 res!951086) b!1415015))

(assert (= (and b!1415015 res!951082) b!1415016))

(assert (= (and b!1415016 res!951090) b!1415020))

(assert (= (and b!1415020 res!951087) b!1415021))

(assert (= (and b!1415020 (not res!951083)) b!1415018))

(assert (= (and b!1415018 (not res!951085)) b!1415017))

(assert (= (and b!1415017 res!951088) b!1415014))

(declare-fun m!1305607 () Bool)

(assert (=> b!1415020 m!1305607))

(declare-fun m!1305609 () Bool)

(assert (=> b!1415020 m!1305609))

(assert (=> b!1415020 m!1305607))

(declare-fun m!1305611 () Bool)

(assert (=> b!1415020 m!1305611))

(assert (=> b!1415020 m!1305607))

(declare-fun m!1305613 () Bool)

(assert (=> b!1415020 m!1305613))

(declare-fun m!1305615 () Bool)

(assert (=> b!1415020 m!1305615))

(declare-fun m!1305617 () Bool)

(assert (=> b!1415016 m!1305617))

(declare-fun m!1305619 () Bool)

(assert (=> start!121916 m!1305619))

(declare-fun m!1305621 () Bool)

(assert (=> start!121916 m!1305621))

(declare-fun m!1305623 () Bool)

(assert (=> b!1415014 m!1305623))

(assert (=> b!1415014 m!1305607))

(assert (=> b!1415014 m!1305607))

(declare-fun m!1305625 () Bool)

(assert (=> b!1415014 m!1305625))

(declare-fun m!1305627 () Bool)

(assert (=> b!1415017 m!1305627))

(declare-fun m!1305629 () Bool)

(assert (=> b!1415017 m!1305629))

(declare-fun m!1305631 () Bool)

(assert (=> b!1415017 m!1305631))

(assert (=> b!1415019 m!1305607))

(assert (=> b!1415019 m!1305607))

(declare-fun m!1305633 () Bool)

(assert (=> b!1415019 m!1305633))

(declare-fun m!1305635 () Bool)

(assert (=> b!1415013 m!1305635))

(assert (=> b!1415013 m!1305635))

(declare-fun m!1305637 () Bool)

(assert (=> b!1415013 m!1305637))

(declare-fun m!1305639 () Bool)

(assert (=> b!1415015 m!1305639))

(assert (=> b!1415021 m!1305607))

(assert (=> b!1415021 m!1305607))

(declare-fun m!1305641 () Bool)

(assert (=> b!1415021 m!1305641))

(declare-fun m!1305643 () Bool)

(assert (=> b!1415018 m!1305643))

(assert (=> b!1415018 m!1305643))

(declare-fun m!1305645 () Bool)

(assert (=> b!1415018 m!1305645))

(assert (=> b!1415018 m!1305627))

(declare-fun m!1305647 () Bool)

(assert (=> b!1415018 m!1305647))

(check-sat (not b!1415021) (not b!1415014) (not b!1415018) (not b!1415015) (not start!121916) (not b!1415016) (not b!1415019) (not b!1415020) (not b!1415017) (not b!1415013))
(check-sat)
(get-model)

(declare-fun d!152563 () Bool)

(declare-fun lt!623719 () SeekEntryResult!10904)

(assert (=> d!152563 (and (or ((_ is Undefined!10904) lt!623719) (not ((_ is Found!10904) lt!623719)) (and (bvsge (index!46000 lt!623719) #b00000000000000000000000000000000) (bvslt (index!46000 lt!623719) (size!47241 lt!623669)))) (or ((_ is Undefined!10904) lt!623719) ((_ is Found!10904) lt!623719) (not ((_ is MissingZero!10904) lt!623719)) (and (bvsge (index!45999 lt!623719) #b00000000000000000000000000000000) (bvslt (index!45999 lt!623719) (size!47241 lt!623669)))) (or ((_ is Undefined!10904) lt!623719) ((_ is Found!10904) lt!623719) ((_ is MissingZero!10904) lt!623719) (not ((_ is MissingVacant!10904) lt!623719)) (and (bvsge (index!46002 lt!623719) #b00000000000000000000000000000000) (bvslt (index!46002 lt!623719) (size!47241 lt!623669)))) (or ((_ is Undefined!10904) lt!623719) (ite ((_ is Found!10904) lt!623719) (= (select (arr!46690 lt!623669) (index!46000 lt!623719)) lt!623664) (ite ((_ is MissingZero!10904) lt!623719) (= (select (arr!46690 lt!623669) (index!45999 lt!623719)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10904) lt!623719) (= (select (arr!46690 lt!623669) (index!46002 lt!623719)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!800948 () SeekEntryResult!10904)

(assert (=> d!152563 (= lt!623719 e!800948)))

(declare-fun c!131454 () Bool)

(declare-fun lt!623718 () SeekEntryResult!10904)

(assert (=> d!152563 (= c!131454 (and ((_ is Intermediate!10904) lt!623718) (undefined!11716 lt!623718)))))

(assert (=> d!152563 (= lt!623718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623664 mask!2840) lt!623664 lt!623669 mask!2840))))

(assert (=> d!152563 (validMask!0 mask!2840)))

(assert (=> d!152563 (= (seekEntryOrOpen!0 lt!623664 lt!623669 mask!2840) lt!623719)))

(declare-fun b!1415095 () Bool)

(declare-fun e!800947 () SeekEntryResult!10904)

(assert (=> b!1415095 (= e!800947 (seekKeyOrZeroReturnVacant!0 (x!127742 lt!623718) (index!46001 lt!623718) (index!46001 lt!623718) lt!623664 lt!623669 mask!2840))))

(declare-fun b!1415096 () Bool)

(declare-fun e!800946 () SeekEntryResult!10904)

(assert (=> b!1415096 (= e!800946 (Found!10904 (index!46001 lt!623718)))))

(declare-fun b!1415097 () Bool)

(assert (=> b!1415097 (= e!800947 (MissingZero!10904 (index!46001 lt!623718)))))

(declare-fun b!1415098 () Bool)

(assert (=> b!1415098 (= e!800948 e!800946)))

(declare-fun lt!623720 () (_ BitVec 64))

(assert (=> b!1415098 (= lt!623720 (select (arr!46690 lt!623669) (index!46001 lt!623718)))))

(declare-fun c!131455 () Bool)

(assert (=> b!1415098 (= c!131455 (= lt!623720 lt!623664))))

(declare-fun b!1415099 () Bool)

(declare-fun c!131453 () Bool)

(assert (=> b!1415099 (= c!131453 (= lt!623720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1415099 (= e!800946 e!800947)))

(declare-fun b!1415100 () Bool)

(assert (=> b!1415100 (= e!800948 Undefined!10904)))

(assert (= (and d!152563 c!131454) b!1415100))

(assert (= (and d!152563 (not c!131454)) b!1415098))

(assert (= (and b!1415098 c!131455) b!1415096))

(assert (= (and b!1415098 (not c!131455)) b!1415099))

(assert (= (and b!1415099 c!131453) b!1415097))

(assert (= (and b!1415099 (not c!131453)) b!1415095))

(assert (=> d!152563 m!1305643))

(assert (=> d!152563 m!1305643))

(assert (=> d!152563 m!1305645))

(assert (=> d!152563 m!1305619))

(declare-fun m!1305733 () Bool)

(assert (=> d!152563 m!1305733))

(declare-fun m!1305735 () Bool)

(assert (=> d!152563 m!1305735))

(declare-fun m!1305737 () Bool)

(assert (=> d!152563 m!1305737))

(declare-fun m!1305739 () Bool)

(assert (=> b!1415095 m!1305739))

(declare-fun m!1305741 () Bool)

(assert (=> b!1415098 m!1305741))

(assert (=> b!1415014 d!152563))

(declare-fun lt!623729 () SeekEntryResult!10904)

(declare-fun d!152565 () Bool)

(assert (=> d!152565 (and (or ((_ is Undefined!10904) lt!623729) (not ((_ is Found!10904) lt!623729)) (and (bvsge (index!46000 lt!623729) #b00000000000000000000000000000000) (bvslt (index!46000 lt!623729) (size!47241 lt!623669)))) (or ((_ is Undefined!10904) lt!623729) ((_ is Found!10904) lt!623729) (not ((_ is MissingVacant!10904) lt!623729)) (not (= (index!46002 lt!623729) (index!46001 lt!623667))) (and (bvsge (index!46002 lt!623729) #b00000000000000000000000000000000) (bvslt (index!46002 lt!623729) (size!47241 lt!623669)))) (or ((_ is Undefined!10904) lt!623729) (ite ((_ is Found!10904) lt!623729) (= (select (arr!46690 lt!623669) (index!46000 lt!623729)) (select (arr!46690 a!2901) j!112)) (and ((_ is MissingVacant!10904) lt!623729) (= (index!46002 lt!623729) (index!46001 lt!623667)) (= (select (arr!46690 lt!623669) (index!46002 lt!623729)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!800955 () SeekEntryResult!10904)

(assert (=> d!152565 (= lt!623729 e!800955)))

(declare-fun c!131464 () Bool)

(assert (=> d!152565 (= c!131464 (bvsge (x!127742 lt!623667) #b01111111111111111111111111111110))))

(declare-fun lt!623728 () (_ BitVec 64))

(assert (=> d!152565 (= lt!623728 (select (arr!46690 lt!623669) (index!46001 lt!623667)))))

(assert (=> d!152565 (validMask!0 mask!2840)))

(assert (=> d!152565 (= (seekKeyOrZeroReturnVacant!0 (x!127742 lt!623667) (index!46001 lt!623667) (index!46001 lt!623667) (select (arr!46690 a!2901) j!112) lt!623669 mask!2840) lt!623729)))

(declare-fun b!1415113 () Bool)

(declare-fun e!800956 () SeekEntryResult!10904)

(assert (=> b!1415113 (= e!800956 (Found!10904 (index!46001 lt!623667)))))

(declare-fun e!800957 () SeekEntryResult!10904)

(declare-fun b!1415114 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415114 (= e!800957 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127742 lt!623667) #b00000000000000000000000000000001) (nextIndex!0 (index!46001 lt!623667) (bvadd (x!127742 lt!623667) #b00000000000000000000000000000001) mask!2840) (index!46001 lt!623667) (select (arr!46690 a!2901) j!112) lt!623669 mask!2840))))

(declare-fun b!1415115 () Bool)

(assert (=> b!1415115 (= e!800955 Undefined!10904)))

(declare-fun b!1415116 () Bool)

(assert (=> b!1415116 (= e!800955 e!800956)))

(declare-fun c!131463 () Bool)

(assert (=> b!1415116 (= c!131463 (= lt!623728 (select (arr!46690 a!2901) j!112)))))

(declare-fun b!1415117 () Bool)

(assert (=> b!1415117 (= e!800957 (MissingVacant!10904 (index!46001 lt!623667)))))

(declare-fun b!1415118 () Bool)

(declare-fun c!131462 () Bool)

(assert (=> b!1415118 (= c!131462 (= lt!623728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1415118 (= e!800956 e!800957)))

(assert (= (and d!152565 c!131464) b!1415115))

(assert (= (and d!152565 (not c!131464)) b!1415116))

(assert (= (and b!1415116 c!131463) b!1415113))

(assert (= (and b!1415116 (not c!131463)) b!1415118))

(assert (= (and b!1415118 c!131462) b!1415117))

(assert (= (and b!1415118 (not c!131462)) b!1415114))

(declare-fun m!1305745 () Bool)

(assert (=> d!152565 m!1305745))

(declare-fun m!1305747 () Bool)

(assert (=> d!152565 m!1305747))

(declare-fun m!1305749 () Bool)

(assert (=> d!152565 m!1305749))

(assert (=> d!152565 m!1305619))

(declare-fun m!1305751 () Bool)

(assert (=> b!1415114 m!1305751))

(assert (=> b!1415114 m!1305751))

(assert (=> b!1415114 m!1305607))

(declare-fun m!1305753 () Bool)

(assert (=> b!1415114 m!1305753))

(assert (=> b!1415014 d!152565))

(declare-fun d!152573 () Bool)

(assert (=> d!152573 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121916 d!152573))

(declare-fun d!152581 () Bool)

(assert (=> d!152581 (= (array_inv!35971 a!2901) (bvsge (size!47241 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121916 d!152581))

(declare-fun d!152583 () Bool)

(assert (=> d!152583 (= (validKeyInArray!0 (select (arr!46690 a!2901) j!112)) (and (not (= (select (arr!46690 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46690 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1415019 d!152583))

(declare-fun d!152585 () Bool)

(declare-fun res!951165 () Bool)

(declare-fun e!800989 () Bool)

(assert (=> d!152585 (=> res!951165 e!800989)))

(assert (=> d!152585 (= res!951165 (bvsge j!112 (size!47241 a!2901)))))

(assert (=> d!152585 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800989)))

(declare-fun b!1415166 () Bool)

(declare-fun e!800990 () Bool)

(declare-fun call!67182 () Bool)

(assert (=> b!1415166 (= e!800990 call!67182)))

(declare-fun b!1415167 () Bool)

(declare-fun e!800988 () Bool)

(assert (=> b!1415167 (= e!800989 e!800988)))

(declare-fun c!131482 () Bool)

(assert (=> b!1415167 (= c!131482 (validKeyInArray!0 (select (arr!46690 a!2901) j!112)))))

(declare-fun b!1415168 () Bool)

(assert (=> b!1415168 (= e!800988 e!800990)))

(declare-fun lt!623753 () (_ BitVec 64))

(assert (=> b!1415168 (= lt!623753 (select (arr!46690 a!2901) j!112))))

(declare-fun lt!623751 () Unit!47809)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96713 (_ BitVec 64) (_ BitVec 32)) Unit!47809)

(assert (=> b!1415168 (= lt!623751 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623753 j!112))))

(declare-fun arrayContainsKey!0 (array!96713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1415168 (arrayContainsKey!0 a!2901 lt!623753 #b00000000000000000000000000000000)))

(declare-fun lt!623752 () Unit!47809)

(assert (=> b!1415168 (= lt!623752 lt!623751)))

(declare-fun res!951166 () Bool)

(assert (=> b!1415168 (= res!951166 (= (seekEntryOrOpen!0 (select (arr!46690 a!2901) j!112) a!2901 mask!2840) (Found!10904 j!112)))))

(assert (=> b!1415168 (=> (not res!951166) (not e!800990))))

(declare-fun bm!67179 () Bool)

(assert (=> bm!67179 (= call!67182 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1415169 () Bool)

(assert (=> b!1415169 (= e!800988 call!67182)))

(assert (= (and d!152585 (not res!951165)) b!1415167))

(assert (= (and b!1415167 c!131482) b!1415168))

(assert (= (and b!1415167 (not c!131482)) b!1415169))

(assert (= (and b!1415168 res!951166) b!1415166))

(assert (= (or b!1415166 b!1415169) bm!67179))

(assert (=> b!1415167 m!1305607))

(assert (=> b!1415167 m!1305607))

(assert (=> b!1415167 m!1305633))

(assert (=> b!1415168 m!1305607))

(declare-fun m!1305787 () Bool)

(assert (=> b!1415168 m!1305787))

(declare-fun m!1305789 () Bool)

(assert (=> b!1415168 m!1305789))

(assert (=> b!1415168 m!1305607))

(assert (=> b!1415168 m!1305641))

(declare-fun m!1305791 () Bool)

(assert (=> bm!67179 m!1305791))

(assert (=> b!1415020 d!152585))

(declare-fun d!152591 () Bool)

(assert (=> d!152591 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623766 () Unit!47809)

(declare-fun choose!38 (array!96713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47809)

(assert (=> d!152591 (= lt!623766 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152591 (validMask!0 mask!2840)))

(assert (=> d!152591 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623766)))

(declare-fun bs!41232 () Bool)

(assert (= bs!41232 d!152591))

(assert (=> bs!41232 m!1305615))

(declare-fun m!1305793 () Bool)

(assert (=> bs!41232 m!1305793))

(assert (=> bs!41232 m!1305619))

(assert (=> b!1415020 d!152591))

(declare-fun b!1415254 () Bool)

(declare-fun lt!623792 () SeekEntryResult!10904)

(assert (=> b!1415254 (and (bvsge (index!46001 lt!623792) #b00000000000000000000000000000000) (bvslt (index!46001 lt!623792) (size!47241 a!2901)))))

(declare-fun e!801039 () Bool)

(assert (=> b!1415254 (= e!801039 (= (select (arr!46690 a!2901) (index!46001 lt!623792)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1415255 () Bool)

(assert (=> b!1415255 (and (bvsge (index!46001 lt!623792) #b00000000000000000000000000000000) (bvslt (index!46001 lt!623792) (size!47241 a!2901)))))

(declare-fun res!951179 () Bool)

(assert (=> b!1415255 (= res!951179 (= (select (arr!46690 a!2901) (index!46001 lt!623792)) (select (arr!46690 a!2901) j!112)))))

(assert (=> b!1415255 (=> res!951179 e!801039)))

(declare-fun e!801041 () Bool)

(assert (=> b!1415255 (= e!801041 e!801039)))

(declare-fun e!801040 () SeekEntryResult!10904)

(declare-fun b!1415256 () Bool)

(assert (=> b!1415256 (= e!801040 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623668 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46690 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1415257 () Bool)

(assert (=> b!1415257 (= e!801040 (Intermediate!10904 false lt!623668 #b00000000000000000000000000000000))))

(declare-fun b!1415258 () Bool)

(declare-fun e!801038 () SeekEntryResult!10904)

(assert (=> b!1415258 (= e!801038 e!801040)))

(declare-fun lt!623791 () (_ BitVec 64))

(declare-fun c!131519 () Bool)

(assert (=> b!1415258 (= c!131519 (or (= lt!623791 (select (arr!46690 a!2901) j!112)) (= (bvadd lt!623791 lt!623791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152593 () Bool)

(declare-fun e!801037 () Bool)

(assert (=> d!152593 e!801037))

(declare-fun c!131521 () Bool)

(assert (=> d!152593 (= c!131521 (and ((_ is Intermediate!10904) lt!623792) (undefined!11716 lt!623792)))))

(assert (=> d!152593 (= lt!623792 e!801038)))

(declare-fun c!131520 () Bool)

(assert (=> d!152593 (= c!131520 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152593 (= lt!623791 (select (arr!46690 a!2901) lt!623668))))

(assert (=> d!152593 (validMask!0 mask!2840)))

(assert (=> d!152593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623668 (select (arr!46690 a!2901) j!112) a!2901 mask!2840) lt!623792)))

(declare-fun b!1415259 () Bool)

(assert (=> b!1415259 (and (bvsge (index!46001 lt!623792) #b00000000000000000000000000000000) (bvslt (index!46001 lt!623792) (size!47241 a!2901)))))

(declare-fun res!951181 () Bool)

(assert (=> b!1415259 (= res!951181 (= (select (arr!46690 a!2901) (index!46001 lt!623792)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1415259 (=> res!951181 e!801039)))

(declare-fun b!1415260 () Bool)

(assert (=> b!1415260 (= e!801038 (Intermediate!10904 true lt!623668 #b00000000000000000000000000000000))))

(declare-fun b!1415261 () Bool)

(assert (=> b!1415261 (= e!801037 (bvsge (x!127742 lt!623792) #b01111111111111111111111111111110))))

(declare-fun b!1415262 () Bool)

(assert (=> b!1415262 (= e!801037 e!801041)))

(declare-fun res!951180 () Bool)

(assert (=> b!1415262 (= res!951180 (and ((_ is Intermediate!10904) lt!623792) (not (undefined!11716 lt!623792)) (bvslt (x!127742 lt!623792) #b01111111111111111111111111111110) (bvsge (x!127742 lt!623792) #b00000000000000000000000000000000) (bvsge (x!127742 lt!623792) #b00000000000000000000000000000000)))))

(assert (=> b!1415262 (=> (not res!951180) (not e!801041))))

(assert (= (and d!152593 c!131520) b!1415260))

(assert (= (and d!152593 (not c!131520)) b!1415258))

(assert (= (and b!1415258 c!131519) b!1415257))

(assert (= (and b!1415258 (not c!131519)) b!1415256))

(assert (= (and d!152593 c!131521) b!1415261))

(assert (= (and d!152593 (not c!131521)) b!1415262))

(assert (= (and b!1415262 res!951180) b!1415255))

(assert (= (and b!1415255 (not res!951179)) b!1415259))

(assert (= (and b!1415259 (not res!951181)) b!1415254))

(declare-fun m!1305837 () Bool)

(assert (=> b!1415254 m!1305837))

(assert (=> b!1415259 m!1305837))

(declare-fun m!1305839 () Bool)

(assert (=> b!1415256 m!1305839))

(assert (=> b!1415256 m!1305839))

(assert (=> b!1415256 m!1305607))

(declare-fun m!1305841 () Bool)

(assert (=> b!1415256 m!1305841))

(assert (=> b!1415255 m!1305837))

(declare-fun m!1305843 () Bool)

(assert (=> d!152593 m!1305843))

(assert (=> d!152593 m!1305619))

(assert (=> b!1415020 d!152593))

(declare-fun d!152607 () Bool)

(declare-fun lt!623798 () (_ BitVec 32))

(declare-fun lt!623797 () (_ BitVec 32))

(assert (=> d!152607 (= lt!623798 (bvmul (bvxor lt!623797 (bvlshr lt!623797 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152607 (= lt!623797 ((_ extract 31 0) (bvand (bvxor (select (arr!46690 a!2901) j!112) (bvlshr (select (arr!46690 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152607 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951182 (let ((h!34481 ((_ extract 31 0) (bvand (bvxor (select (arr!46690 a!2901) j!112) (bvlshr (select (arr!46690 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127751 (bvmul (bvxor h!34481 (bvlshr h!34481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127751 (bvlshr x!127751 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951182 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951182 #b00000000000000000000000000000000))))))

(assert (=> d!152607 (= (toIndex!0 (select (arr!46690 a!2901) j!112) mask!2840) (bvand (bvxor lt!623798 (bvlshr lt!623798 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1415020 d!152607))

(declare-fun b!1415263 () Bool)

(declare-fun lt!623800 () SeekEntryResult!10904)

(assert (=> b!1415263 (and (bvsge (index!46001 lt!623800) #b00000000000000000000000000000000) (bvslt (index!46001 lt!623800) (size!47241 lt!623669)))))

(declare-fun e!801044 () Bool)

(assert (=> b!1415263 (= e!801044 (= (select (arr!46690 lt!623669) (index!46001 lt!623800)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1415264 () Bool)

(assert (=> b!1415264 (and (bvsge (index!46001 lt!623800) #b00000000000000000000000000000000) (bvslt (index!46001 lt!623800) (size!47241 lt!623669)))))

(declare-fun res!951183 () Bool)

(assert (=> b!1415264 (= res!951183 (= (select (arr!46690 lt!623669) (index!46001 lt!623800)) lt!623664))))

(assert (=> b!1415264 (=> res!951183 e!801044)))

(declare-fun e!801046 () Bool)

(assert (=> b!1415264 (= e!801046 e!801044)))

(declare-fun e!801045 () SeekEntryResult!10904)

(declare-fun b!1415265 () Bool)

(assert (=> b!1415265 (= e!801045 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623664 mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) lt!623664 lt!623669 mask!2840))))

(declare-fun b!1415266 () Bool)

(assert (=> b!1415266 (= e!801045 (Intermediate!10904 false (toIndex!0 lt!623664 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1415267 () Bool)

(declare-fun e!801043 () SeekEntryResult!10904)

(assert (=> b!1415267 (= e!801043 e!801045)))

(declare-fun c!131522 () Bool)

(declare-fun lt!623799 () (_ BitVec 64))

(assert (=> b!1415267 (= c!131522 (or (= lt!623799 lt!623664) (= (bvadd lt!623799 lt!623799) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152613 () Bool)

(declare-fun e!801042 () Bool)

(assert (=> d!152613 e!801042))

(declare-fun c!131524 () Bool)

(assert (=> d!152613 (= c!131524 (and ((_ is Intermediate!10904) lt!623800) (undefined!11716 lt!623800)))))

(assert (=> d!152613 (= lt!623800 e!801043)))

(declare-fun c!131523 () Bool)

(assert (=> d!152613 (= c!131523 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152613 (= lt!623799 (select (arr!46690 lt!623669) (toIndex!0 lt!623664 mask!2840)))))

(assert (=> d!152613 (validMask!0 mask!2840)))

(assert (=> d!152613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623664 mask!2840) lt!623664 lt!623669 mask!2840) lt!623800)))

(declare-fun b!1415268 () Bool)

(assert (=> b!1415268 (and (bvsge (index!46001 lt!623800) #b00000000000000000000000000000000) (bvslt (index!46001 lt!623800) (size!47241 lt!623669)))))

(declare-fun res!951185 () Bool)

(assert (=> b!1415268 (= res!951185 (= (select (arr!46690 lt!623669) (index!46001 lt!623800)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1415268 (=> res!951185 e!801044)))

(declare-fun b!1415269 () Bool)

(assert (=> b!1415269 (= e!801043 (Intermediate!10904 true (toIndex!0 lt!623664 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1415270 () Bool)

(assert (=> b!1415270 (= e!801042 (bvsge (x!127742 lt!623800) #b01111111111111111111111111111110))))

(declare-fun b!1415271 () Bool)

(assert (=> b!1415271 (= e!801042 e!801046)))

(declare-fun res!951184 () Bool)

(assert (=> b!1415271 (= res!951184 (and ((_ is Intermediate!10904) lt!623800) (not (undefined!11716 lt!623800)) (bvslt (x!127742 lt!623800) #b01111111111111111111111111111110) (bvsge (x!127742 lt!623800) #b00000000000000000000000000000000) (bvsge (x!127742 lt!623800) #b00000000000000000000000000000000)))))

(assert (=> b!1415271 (=> (not res!951184) (not e!801046))))

(assert (= (and d!152613 c!131523) b!1415269))

(assert (= (and d!152613 (not c!131523)) b!1415267))

(assert (= (and b!1415267 c!131522) b!1415266))

(assert (= (and b!1415267 (not c!131522)) b!1415265))

(assert (= (and d!152613 c!131524) b!1415270))

(assert (= (and d!152613 (not c!131524)) b!1415271))

(assert (= (and b!1415271 res!951184) b!1415264))

(assert (= (and b!1415264 (not res!951183)) b!1415268))

(assert (= (and b!1415268 (not res!951185)) b!1415263))

(declare-fun m!1305845 () Bool)

(assert (=> b!1415263 m!1305845))

(assert (=> b!1415268 m!1305845))

(assert (=> b!1415265 m!1305643))

(declare-fun m!1305847 () Bool)

(assert (=> b!1415265 m!1305847))

(assert (=> b!1415265 m!1305847))

(declare-fun m!1305849 () Bool)

(assert (=> b!1415265 m!1305849))

(assert (=> b!1415264 m!1305845))

(assert (=> d!152613 m!1305643))

(declare-fun m!1305851 () Bool)

(assert (=> d!152613 m!1305851))

(assert (=> d!152613 m!1305619))

(assert (=> b!1415018 d!152613))

(declare-fun d!152615 () Bool)

(declare-fun lt!623802 () (_ BitVec 32))

(declare-fun lt!623801 () (_ BitVec 32))

(assert (=> d!152615 (= lt!623802 (bvmul (bvxor lt!623801 (bvlshr lt!623801 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152615 (= lt!623801 ((_ extract 31 0) (bvand (bvxor lt!623664 (bvlshr lt!623664 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152615 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951182 (let ((h!34481 ((_ extract 31 0) (bvand (bvxor lt!623664 (bvlshr lt!623664 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127751 (bvmul (bvxor h!34481 (bvlshr h!34481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127751 (bvlshr x!127751 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951182 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951182 #b00000000000000000000000000000000))))))

(assert (=> d!152615 (= (toIndex!0 lt!623664 mask!2840) (bvand (bvxor lt!623802 (bvlshr lt!623802 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1415018 d!152615))

(declare-fun d!152617 () Bool)

(assert (=> d!152617 (= (validKeyInArray!0 (select (arr!46690 a!2901) i!1037)) (and (not (= (select (arr!46690 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46690 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1415013 d!152617))

(declare-fun d!152619 () Bool)

(assert (=> d!152619 (and (not (undefined!11716 lt!623667)) (= (index!46001 lt!623667) i!1037) (bvslt (x!127742 lt!623667) (x!127742 lt!623665)))))

(declare-fun lt!623805 () Unit!47809)

(declare-fun choose!62 (array!96713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47809)

(assert (=> d!152619 (= lt!623805 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623668 (x!127742 lt!623665) (index!46001 lt!623665) (x!127742 lt!623667) (index!46001 lt!623667) (undefined!11716 lt!623667) mask!2840))))

(assert (=> d!152619 (validMask!0 mask!2840)))

(assert (=> d!152619 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623668 (x!127742 lt!623665) (index!46001 lt!623665) (x!127742 lt!623667) (index!46001 lt!623667) (undefined!11716 lt!623667) mask!2840) lt!623805)))

(declare-fun bs!41233 () Bool)

(assert (= bs!41233 d!152619))

(declare-fun m!1305853 () Bool)

(assert (=> bs!41233 m!1305853))

(assert (=> bs!41233 m!1305619))

(assert (=> b!1415017 d!152619))

(declare-fun d!152621 () Bool)

(declare-fun res!951186 () Bool)

(declare-fun e!801048 () Bool)

(assert (=> d!152621 (=> res!951186 e!801048)))

(assert (=> d!152621 (= res!951186 (bvsge #b00000000000000000000000000000000 (size!47241 a!2901)))))

(assert (=> d!152621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!801048)))

(declare-fun b!1415272 () Bool)

(declare-fun e!801049 () Bool)

(declare-fun call!67186 () Bool)

(assert (=> b!1415272 (= e!801049 call!67186)))

(declare-fun b!1415273 () Bool)

(declare-fun e!801047 () Bool)

(assert (=> b!1415273 (= e!801048 e!801047)))

(declare-fun c!131525 () Bool)

(assert (=> b!1415273 (= c!131525 (validKeyInArray!0 (select (arr!46690 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1415274 () Bool)

(assert (=> b!1415274 (= e!801047 e!801049)))

(declare-fun lt!623808 () (_ BitVec 64))

(assert (=> b!1415274 (= lt!623808 (select (arr!46690 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623806 () Unit!47809)

(assert (=> b!1415274 (= lt!623806 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623808 #b00000000000000000000000000000000))))

(assert (=> b!1415274 (arrayContainsKey!0 a!2901 lt!623808 #b00000000000000000000000000000000)))

(declare-fun lt!623807 () Unit!47809)

(assert (=> b!1415274 (= lt!623807 lt!623806)))

(declare-fun res!951187 () Bool)

(assert (=> b!1415274 (= res!951187 (= (seekEntryOrOpen!0 (select (arr!46690 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10904 #b00000000000000000000000000000000)))))

(assert (=> b!1415274 (=> (not res!951187) (not e!801049))))

(declare-fun bm!67183 () Bool)

(assert (=> bm!67183 (= call!67186 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1415275 () Bool)

(assert (=> b!1415275 (= e!801047 call!67186)))

(assert (= (and d!152621 (not res!951186)) b!1415273))

(assert (= (and b!1415273 c!131525) b!1415274))

(assert (= (and b!1415273 (not c!131525)) b!1415275))

(assert (= (and b!1415274 res!951187) b!1415272))

(assert (= (or b!1415272 b!1415275) bm!67183))

(declare-fun m!1305855 () Bool)

(assert (=> b!1415273 m!1305855))

(assert (=> b!1415273 m!1305855))

(declare-fun m!1305857 () Bool)

(assert (=> b!1415273 m!1305857))

(assert (=> b!1415274 m!1305855))

(declare-fun m!1305859 () Bool)

(assert (=> b!1415274 m!1305859))

(declare-fun m!1305861 () Bool)

(assert (=> b!1415274 m!1305861))

(assert (=> b!1415274 m!1305855))

(declare-fun m!1305863 () Bool)

(assert (=> b!1415274 m!1305863))

(declare-fun m!1305865 () Bool)

(assert (=> bm!67183 m!1305865))

(assert (=> b!1415015 d!152621))

(declare-fun b!1415313 () Bool)

(declare-fun e!801076 () Bool)

(declare-fun call!67189 () Bool)

(assert (=> b!1415313 (= e!801076 call!67189)))

(declare-fun b!1415314 () Bool)

(assert (=> b!1415314 (= e!801076 call!67189)))

(declare-fun d!152623 () Bool)

(declare-fun res!951205 () Bool)

(declare-fun e!801073 () Bool)

(assert (=> d!152623 (=> res!951205 e!801073)))

(assert (=> d!152623 (= res!951205 (bvsge #b00000000000000000000000000000000 (size!47241 a!2901)))))

(assert (=> d!152623 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33193) e!801073)))

(declare-fun bm!67186 () Bool)

(declare-fun c!131537 () Bool)

(assert (=> bm!67186 (= call!67189 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131537 (Cons!33192 (select (arr!46690 a!2901) #b00000000000000000000000000000000) Nil!33193) Nil!33193)))))

(declare-fun b!1415315 () Bool)

(declare-fun e!801074 () Bool)

(assert (=> b!1415315 (= e!801073 e!801074)))

(declare-fun res!951204 () Bool)

(assert (=> b!1415315 (=> (not res!951204) (not e!801074))))

(declare-fun e!801075 () Bool)

(assert (=> b!1415315 (= res!951204 (not e!801075))))

(declare-fun res!951203 () Bool)

(assert (=> b!1415315 (=> (not res!951203) (not e!801075))))

(assert (=> b!1415315 (= res!951203 (validKeyInArray!0 (select (arr!46690 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1415316 () Bool)

(declare-fun contains!9860 (List!33196 (_ BitVec 64)) Bool)

(assert (=> b!1415316 (= e!801075 (contains!9860 Nil!33193 (select (arr!46690 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1415317 () Bool)

(assert (=> b!1415317 (= e!801074 e!801076)))

(assert (=> b!1415317 (= c!131537 (validKeyInArray!0 (select (arr!46690 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152623 (not res!951205)) b!1415315))

(assert (= (and b!1415315 res!951203) b!1415316))

(assert (= (and b!1415315 res!951204) b!1415317))

(assert (= (and b!1415317 c!131537) b!1415314))

(assert (= (and b!1415317 (not c!131537)) b!1415313))

(assert (= (or b!1415314 b!1415313) bm!67186))

(assert (=> bm!67186 m!1305855))

(declare-fun m!1305867 () Bool)

(assert (=> bm!67186 m!1305867))

(assert (=> b!1415315 m!1305855))

(assert (=> b!1415315 m!1305855))

(assert (=> b!1415315 m!1305857))

(assert (=> b!1415316 m!1305855))

(assert (=> b!1415316 m!1305855))

(declare-fun m!1305871 () Bool)

(assert (=> b!1415316 m!1305871))

(assert (=> b!1415317 m!1305855))

(assert (=> b!1415317 m!1305855))

(assert (=> b!1415317 m!1305857))

(assert (=> b!1415016 d!152623))

(declare-fun d!152625 () Bool)

(declare-fun lt!623816 () SeekEntryResult!10904)

(assert (=> d!152625 (and (or ((_ is Undefined!10904) lt!623816) (not ((_ is Found!10904) lt!623816)) (and (bvsge (index!46000 lt!623816) #b00000000000000000000000000000000) (bvslt (index!46000 lt!623816) (size!47241 a!2901)))) (or ((_ is Undefined!10904) lt!623816) ((_ is Found!10904) lt!623816) (not ((_ is MissingZero!10904) lt!623816)) (and (bvsge (index!45999 lt!623816) #b00000000000000000000000000000000) (bvslt (index!45999 lt!623816) (size!47241 a!2901)))) (or ((_ is Undefined!10904) lt!623816) ((_ is Found!10904) lt!623816) ((_ is MissingZero!10904) lt!623816) (not ((_ is MissingVacant!10904) lt!623816)) (and (bvsge (index!46002 lt!623816) #b00000000000000000000000000000000) (bvslt (index!46002 lt!623816) (size!47241 a!2901)))) (or ((_ is Undefined!10904) lt!623816) (ite ((_ is Found!10904) lt!623816) (= (select (arr!46690 a!2901) (index!46000 lt!623816)) (select (arr!46690 a!2901) j!112)) (ite ((_ is MissingZero!10904) lt!623816) (= (select (arr!46690 a!2901) (index!45999 lt!623816)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10904) lt!623816) (= (select (arr!46690 a!2901) (index!46002 lt!623816)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!801079 () SeekEntryResult!10904)

(assert (=> d!152625 (= lt!623816 e!801079)))

(declare-fun c!131539 () Bool)

(declare-fun lt!623815 () SeekEntryResult!10904)

(assert (=> d!152625 (= c!131539 (and ((_ is Intermediate!10904) lt!623815) (undefined!11716 lt!623815)))))

(assert (=> d!152625 (= lt!623815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46690 a!2901) j!112) mask!2840) (select (arr!46690 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152625 (validMask!0 mask!2840)))

(assert (=> d!152625 (= (seekEntryOrOpen!0 (select (arr!46690 a!2901) j!112) a!2901 mask!2840) lt!623816)))

(declare-fun b!1415318 () Bool)

(declare-fun e!801078 () SeekEntryResult!10904)

(assert (=> b!1415318 (= e!801078 (seekKeyOrZeroReturnVacant!0 (x!127742 lt!623815) (index!46001 lt!623815) (index!46001 lt!623815) (select (arr!46690 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1415319 () Bool)

(declare-fun e!801077 () SeekEntryResult!10904)

(assert (=> b!1415319 (= e!801077 (Found!10904 (index!46001 lt!623815)))))

(declare-fun b!1415320 () Bool)

(assert (=> b!1415320 (= e!801078 (MissingZero!10904 (index!46001 lt!623815)))))

(declare-fun b!1415321 () Bool)

(assert (=> b!1415321 (= e!801079 e!801077)))

(declare-fun lt!623817 () (_ BitVec 64))

(assert (=> b!1415321 (= lt!623817 (select (arr!46690 a!2901) (index!46001 lt!623815)))))

(declare-fun c!131540 () Bool)

(assert (=> b!1415321 (= c!131540 (= lt!623817 (select (arr!46690 a!2901) j!112)))))

(declare-fun b!1415322 () Bool)

(declare-fun c!131538 () Bool)

(assert (=> b!1415322 (= c!131538 (= lt!623817 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1415322 (= e!801077 e!801078)))

(declare-fun b!1415323 () Bool)

(assert (=> b!1415323 (= e!801079 Undefined!10904)))

(assert (= (and d!152625 c!131539) b!1415323))

(assert (= (and d!152625 (not c!131539)) b!1415321))

(assert (= (and b!1415321 c!131540) b!1415319))

(assert (= (and b!1415321 (not c!131540)) b!1415322))

(assert (= (and b!1415322 c!131538) b!1415320))

(assert (= (and b!1415322 (not c!131538)) b!1415318))

(assert (=> d!152625 m!1305607))

(assert (=> d!152625 m!1305611))

(assert (=> d!152625 m!1305611))

(assert (=> d!152625 m!1305607))

(declare-fun m!1305879 () Bool)

(assert (=> d!152625 m!1305879))

(assert (=> d!152625 m!1305619))

(declare-fun m!1305881 () Bool)

(assert (=> d!152625 m!1305881))

(declare-fun m!1305883 () Bool)

(assert (=> d!152625 m!1305883))

(declare-fun m!1305885 () Bool)

(assert (=> d!152625 m!1305885))

(assert (=> b!1415318 m!1305607))

(declare-fun m!1305887 () Bool)

(assert (=> b!1415318 m!1305887))

(declare-fun m!1305889 () Bool)

(assert (=> b!1415321 m!1305889))

(assert (=> b!1415021 d!152625))

(check-sat (not d!152563) (not bm!67179) (not d!152591) (not d!152625) (not b!1415318) (not d!152593) (not b!1415168) (not b!1415265) (not b!1415317) (not b!1415274) (not d!152565) (not b!1415095) (not b!1415316) (not b!1415114) (not bm!67183) (not d!152619) (not b!1415167) (not b!1415315) (not b!1415273) (not bm!67186) (not b!1415256) (not d!152613))
(check-sat)
