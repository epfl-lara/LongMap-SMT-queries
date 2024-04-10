; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119212 () Bool)

(assert start!119212)

(declare-fun b!1390602 () Bool)

(declare-fun res!930763 () Bool)

(declare-fun e!787489 () Bool)

(assert (=> b!1390602 (=> (not res!930763) (not e!787489))))

(declare-datatypes ((array!95149 0))(
  ( (array!95150 (arr!45940 (Array (_ BitVec 32) (_ BitVec 64))) (size!46490 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95149)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390602 (= res!930763 (validKeyInArray!0 (select (arr!45940 a!2901) i!1037)))))

(declare-fun b!1390603 () Bool)

(declare-datatypes ((SeekEntryResult!10257 0))(
  ( (MissingZero!10257 (index!43399 (_ BitVec 32))) (Found!10257 (index!43400 (_ BitVec 32))) (Intermediate!10257 (undefined!11069 Bool) (index!43401 (_ BitVec 32)) (x!125071 (_ BitVec 32))) (Undefined!10257) (MissingVacant!10257 (index!43402 (_ BitVec 32))) )
))
(declare-fun lt!610872 () SeekEntryResult!10257)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1390603 (= e!787489 (not (or (not (is-Intermediate!10257 lt!610872)) (undefined!11069 lt!610872) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111))))))

(declare-fun e!787490 () Bool)

(assert (=> b!1390603 e!787490))

(declare-fun res!930767 () Bool)

(assert (=> b!1390603 (=> (not res!930767) (not e!787490))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95149 (_ BitVec 32)) Bool)

(assert (=> b!1390603 (= res!930767 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46518 0))(
  ( (Unit!46519) )
))
(declare-fun lt!610871 () Unit!46518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46518)

(assert (=> b!1390603 (= lt!610871 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95149 (_ BitVec 32)) SeekEntryResult!10257)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390603 (= lt!610872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45940 a!2901) j!112) mask!2840) (select (arr!45940 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390604 () Bool)

(declare-fun res!930768 () Bool)

(assert (=> b!1390604 (=> (not res!930768) (not e!787489))))

(declare-datatypes ((List!32459 0))(
  ( (Nil!32456) (Cons!32455 (h!33673 (_ BitVec 64)) (t!47153 List!32459)) )
))
(declare-fun arrayNoDuplicates!0 (array!95149 (_ BitVec 32) List!32459) Bool)

(assert (=> b!1390604 (= res!930768 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32456))))

(declare-fun b!1390605 () Bool)

(declare-fun res!930765 () Bool)

(assert (=> b!1390605 (=> (not res!930765) (not e!787489))))

(assert (=> b!1390605 (= res!930765 (and (= (size!46490 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46490 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46490 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390606 () Bool)

(declare-fun res!930764 () Bool)

(assert (=> b!1390606 (=> (not res!930764) (not e!787489))))

(assert (=> b!1390606 (= res!930764 (validKeyInArray!0 (select (arr!45940 a!2901) j!112)))))

(declare-fun b!1390607 () Bool)

(declare-fun res!930766 () Bool)

(assert (=> b!1390607 (=> (not res!930766) (not e!787489))))

(assert (=> b!1390607 (= res!930766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390608 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95149 (_ BitVec 32)) SeekEntryResult!10257)

(assert (=> b!1390608 (= e!787490 (= (seekEntryOrOpen!0 (select (arr!45940 a!2901) j!112) a!2901 mask!2840) (Found!10257 j!112)))))

(declare-fun res!930769 () Bool)

(assert (=> start!119212 (=> (not res!930769) (not e!787489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119212 (= res!930769 (validMask!0 mask!2840))))

(assert (=> start!119212 e!787489))

(assert (=> start!119212 true))

(declare-fun array_inv!34968 (array!95149) Bool)

(assert (=> start!119212 (array_inv!34968 a!2901)))

(assert (= (and start!119212 res!930769) b!1390605))

(assert (= (and b!1390605 res!930765) b!1390602))

(assert (= (and b!1390602 res!930763) b!1390606))

(assert (= (and b!1390606 res!930764) b!1390607))

(assert (= (and b!1390607 res!930766) b!1390604))

(assert (= (and b!1390604 res!930768) b!1390603))

(assert (= (and b!1390603 res!930767) b!1390608))

(declare-fun m!1276489 () Bool)

(assert (=> b!1390608 m!1276489))

(assert (=> b!1390608 m!1276489))

(declare-fun m!1276491 () Bool)

(assert (=> b!1390608 m!1276491))

(assert (=> b!1390603 m!1276489))

(declare-fun m!1276493 () Bool)

(assert (=> b!1390603 m!1276493))

(assert (=> b!1390603 m!1276489))

(declare-fun m!1276495 () Bool)

(assert (=> b!1390603 m!1276495))

(assert (=> b!1390603 m!1276493))

(assert (=> b!1390603 m!1276489))

(declare-fun m!1276497 () Bool)

(assert (=> b!1390603 m!1276497))

(declare-fun m!1276499 () Bool)

(assert (=> b!1390603 m!1276499))

(declare-fun m!1276501 () Bool)

(assert (=> b!1390607 m!1276501))

(declare-fun m!1276503 () Bool)

(assert (=> b!1390602 m!1276503))

(assert (=> b!1390602 m!1276503))

(declare-fun m!1276505 () Bool)

(assert (=> b!1390602 m!1276505))

(declare-fun m!1276507 () Bool)

(assert (=> b!1390604 m!1276507))

(declare-fun m!1276509 () Bool)

(assert (=> start!119212 m!1276509))

(declare-fun m!1276511 () Bool)

(assert (=> start!119212 m!1276511))

(assert (=> b!1390606 m!1276489))

(assert (=> b!1390606 m!1276489))

(declare-fun m!1276513 () Bool)

(assert (=> b!1390606 m!1276513))

(push 1)

(assert (not b!1390602))

(assert (not b!1390607))

(assert (not b!1390603))

(assert (not start!119212))

(assert (not b!1390608))

(assert (not b!1390606))

(assert (not b!1390604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1390647 () Bool)

(declare-fun e!787523 () Bool)

(declare-fun e!787521 () Bool)

(assert (=> b!1390647 (= e!787523 e!787521)))

(declare-fun c!129372 () Bool)

(assert (=> b!1390647 (= c!129372 (validKeyInArray!0 (select (arr!45940 a!2901) j!112)))))

(declare-fun b!1390648 () Bool)

(declare-fun e!787522 () Bool)

(declare-fun call!66706 () Bool)

(assert (=> b!1390648 (= e!787522 call!66706)))

(declare-fun b!1390649 () Bool)

(assert (=> b!1390649 (= e!787521 call!66706)))

(declare-fun bm!66703 () Bool)

(assert (=> bm!66703 (= call!66706 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150203 () Bool)

(declare-fun res!930793 () Bool)

(assert (=> d!150203 (=> res!930793 e!787523)))

(assert (=> d!150203 (= res!930793 (bvsge j!112 (size!46490 a!2901)))))

(assert (=> d!150203 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!787523)))

(declare-fun b!1390650 () Bool)

(assert (=> b!1390650 (= e!787521 e!787522)))

(declare-fun lt!610880 () (_ BitVec 64))

(assert (=> b!1390650 (= lt!610880 (select (arr!45940 a!2901) j!112))))

(declare-fun lt!610881 () Unit!46518)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95149 (_ BitVec 64) (_ BitVec 32)) Unit!46518)

(assert (=> b!1390650 (= lt!610881 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610880 j!112))))

(declare-fun arrayContainsKey!0 (array!95149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1390650 (arrayContainsKey!0 a!2901 lt!610880 #b00000000000000000000000000000000)))

(declare-fun lt!610879 () Unit!46518)

(assert (=> b!1390650 (= lt!610879 lt!610881)))

(declare-fun res!930792 () Bool)

(assert (=> b!1390650 (= res!930792 (= (seekEntryOrOpen!0 (select (arr!45940 a!2901) j!112) a!2901 mask!2840) (Found!10257 j!112)))))

(assert (=> b!1390650 (=> (not res!930792) (not e!787522))))

(assert (= (and d!150203 (not res!930793)) b!1390647))

(assert (= (and b!1390647 c!129372) b!1390650))

(assert (= (and b!1390647 (not c!129372)) b!1390649))

(assert (= (and b!1390650 res!930792) b!1390648))

(assert (= (or b!1390648 b!1390649) bm!66703))

(assert (=> b!1390647 m!1276489))

(assert (=> b!1390647 m!1276489))

(assert (=> b!1390647 m!1276513))

(declare-fun m!1276531 () Bool)

(assert (=> bm!66703 m!1276531))

(assert (=> b!1390650 m!1276489))

(declare-fun m!1276533 () Bool)

(assert (=> b!1390650 m!1276533))

(declare-fun m!1276535 () Bool)

(assert (=> b!1390650 m!1276535))

(assert (=> b!1390650 m!1276489))

(assert (=> b!1390650 m!1276491))

(assert (=> b!1390603 d!150203))

(declare-fun d!150209 () Bool)

(assert (=> d!150209 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!610884 () Unit!46518)

(declare-fun choose!38 (array!95149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46518)

(assert (=> d!150209 (= lt!610884 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150209 (validMask!0 mask!2840)))

(assert (=> d!150209 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!610884)))

(declare-fun bs!40454 () Bool)

(assert (= bs!40454 d!150209))

(assert (=> bs!40454 m!1276499))

(declare-fun m!1276537 () Bool)

(assert (=> bs!40454 m!1276537))

(assert (=> bs!40454 m!1276509))

(assert (=> b!1390603 d!150209))

(declare-fun b!1390713 () Bool)

(declare-fun lt!610914 () SeekEntryResult!10257)

(assert (=> b!1390713 (and (bvsge (index!43401 lt!610914) #b00000000000000000000000000000000) (bvslt (index!43401 lt!610914) (size!46490 a!2901)))))

(declare-fun e!787560 () Bool)

(assert (=> b!1390713 (= e!787560 (= (select (arr!45940 a!2901) (index!43401 lt!610914)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!150215 () Bool)

(declare-fun e!787558 () Bool)

(assert (=> d!150215 e!787558))

(declare-fun c!129399 () Bool)

(assert (=> d!150215 (= c!129399 (and (is-Intermediate!10257 lt!610914) (undefined!11069 lt!610914)))))

(declare-fun e!787561 () SeekEntryResult!10257)

(assert (=> d!150215 (= lt!610914 e!787561)))

(declare-fun c!129400 () Bool)

(assert (=> d!150215 (= c!129400 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!610913 () (_ BitVec 64))

(assert (=> d!150215 (= lt!610913 (select (arr!45940 a!2901) (toIndex!0 (select (arr!45940 a!2901) j!112) mask!2840)))))

(assert (=> d!150215 (validMask!0 mask!2840)))

(assert (=> d!150215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45940 a!2901) j!112) mask!2840) (select (arr!45940 a!2901) j!112) a!2901 mask!2840) lt!610914)))

(declare-fun b!1390714 () Bool)

(declare-fun e!787559 () SeekEntryResult!10257)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390714 (= e!787559 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45940 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45940 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390715 () Bool)

(assert (=> b!1390715 (= e!787561 e!787559)))

(declare-fun c!129401 () Bool)

(assert (=> b!1390715 (= c!129401 (or (= lt!610913 (select (arr!45940 a!2901) j!112)) (= (bvadd lt!610913 lt!610913) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1390716 () Bool)

(assert (=> b!1390716 (= e!787558 (bvsge (x!125071 lt!610914) #b01111111111111111111111111111110))))

(declare-fun b!1390717 () Bool)

(assert (=> b!1390717 (and (bvsge (index!43401 lt!610914) #b00000000000000000000000000000000) (bvslt (index!43401 lt!610914) (size!46490 a!2901)))))

(declare-fun res!930804 () Bool)

(assert (=> b!1390717 (= res!930804 (= (select (arr!45940 a!2901) (index!43401 lt!610914)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1390717 (=> res!930804 e!787560)))

(declare-fun b!1390718 () Bool)

(declare-fun e!787562 () Bool)

(assert (=> b!1390718 (= e!787558 e!787562)))

(declare-fun res!930805 () Bool)

(assert (=> b!1390718 (= res!930805 (and (is-Intermediate!10257 lt!610914) (not (undefined!11069 lt!610914)) (bvslt (x!125071 lt!610914) #b01111111111111111111111111111110) (bvsge (x!125071 lt!610914) #b00000000000000000000000000000000) (bvsge (x!125071 lt!610914) #b00000000000000000000000000000000)))))

(assert (=> b!1390718 (=> (not res!930805) (not e!787562))))

(declare-fun b!1390719 () Bool)

(assert (=> b!1390719 (= e!787559 (Intermediate!10257 false (toIndex!0 (select (arr!45940 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1390720 () Bool)

(assert (=> b!1390720 (and (bvsge (index!43401 lt!610914) #b00000000000000000000000000000000) (bvslt (index!43401 lt!610914) (size!46490 a!2901)))))

(declare-fun res!930806 () Bool)

(assert (=> b!1390720 (= res!930806 (= (select (arr!45940 a!2901) (index!43401 lt!610914)) (select (arr!45940 a!2901) j!112)))))

(assert (=> b!1390720 (=> res!930806 e!787560)))

(assert (=> b!1390720 (= e!787562 e!787560)))

(declare-fun b!1390721 () Bool)

(assert (=> b!1390721 (= e!787561 (Intermediate!10257 true (toIndex!0 (select (arr!45940 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!150215 c!129400) b!1390721))

(assert (= (and d!150215 (not c!129400)) b!1390715))

(assert (= (and b!1390715 c!129401) b!1390719))

(assert (= (and b!1390715 (not c!129401)) b!1390714))

(assert (= (and d!150215 c!129399) b!1390716))

(assert (= (and d!150215 (not c!129399)) b!1390718))

(assert (= (and b!1390718 res!930805) b!1390720))

(assert (= (and b!1390720 (not res!930806)) b!1390717))

(assert (= (and b!1390717 (not res!930804)) b!1390713))

(declare-fun m!1276559 () Bool)

(assert (=> b!1390713 m!1276559))

(assert (=> b!1390717 m!1276559))

(assert (=> b!1390720 m!1276559))

(assert (=> d!150215 m!1276493))

(declare-fun m!1276561 () Bool)

(assert (=> d!150215 m!1276561))

(assert (=> d!150215 m!1276509))

(assert (=> b!1390714 m!1276493))

(declare-fun m!1276563 () Bool)

(assert (=> b!1390714 m!1276563))

(assert (=> b!1390714 m!1276563))

(assert (=> b!1390714 m!1276489))

(declare-fun m!1276565 () Bool)

(assert (=> b!1390714 m!1276565))

(assert (=> b!1390603 d!150215))

(declare-fun d!150221 () Bool)

(declare-fun lt!610932 () (_ BitVec 32))

(declare-fun lt!610931 () (_ BitVec 32))

(assert (=> d!150221 (= lt!610932 (bvmul (bvxor lt!610931 (bvlshr lt!610931 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150221 (= lt!610931 ((_ extract 31 0) (bvand (bvxor (select (arr!45940 a!2901) j!112) (bvlshr (select (arr!45940 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150221 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!930809 (let ((h!33674 ((_ extract 31 0) (bvand (bvxor (select (arr!45940 a!2901) j!112) (bvlshr (select (arr!45940 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125073 (bvmul (bvxor h!33674 (bvlshr h!33674 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125073 (bvlshr x!125073 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!930809 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!930809 #b00000000000000000000000000000000))))))

(assert (=> d!150221 (= (toIndex!0 (select (arr!45940 a!2901) j!112) mask!2840) (bvand (bvxor lt!610932 (bvlshr lt!610932 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1390603 d!150221))

(declare-fun b!1390772 () Bool)

(declare-fun e!787596 () SeekEntryResult!10257)

(declare-fun e!787595 () SeekEntryResult!10257)

(assert (=> b!1390772 (= e!787596 e!787595)))

(declare-fun lt!610954 () (_ BitVec 64))

(declare-fun lt!610953 () SeekEntryResult!10257)

(assert (=> b!1390772 (= lt!610954 (select (arr!45940 a!2901) (index!43401 lt!610953)))))

(declare-fun c!129420 () Bool)

(assert (=> b!1390772 (= c!129420 (= lt!610954 (select (arr!45940 a!2901) j!112)))))

(declare-fun e!787594 () SeekEntryResult!10257)

(declare-fun b!1390773 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95149 (_ BitVec 32)) SeekEntryResult!10257)

(assert (=> b!1390773 (= e!787594 (seekKeyOrZeroReturnVacant!0 (x!125071 lt!610953) (index!43401 lt!610953) (index!43401 lt!610953) (select (arr!45940 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390774 () Bool)

(assert (=> b!1390774 (= e!787595 (Found!10257 (index!43401 lt!610953)))))

(declare-fun b!1390775 () Bool)

(assert (=> b!1390775 (= e!787596 Undefined!10257)))

(declare-fun d!150227 () Bool)

(declare-fun lt!610952 () SeekEntryResult!10257)

(assert (=> d!150227 (and (or (is-Undefined!10257 lt!610952) (not (is-Found!10257 lt!610952)) (and (bvsge (index!43400 lt!610952) #b00000000000000000000000000000000) (bvslt (index!43400 lt!610952) (size!46490 a!2901)))) (or (is-Undefined!10257 lt!610952) (is-Found!10257 lt!610952) (not (is-MissingZero!10257 lt!610952)) (and (bvsge (index!43399 lt!610952) #b00000000000000000000000000000000) (bvslt (index!43399 lt!610952) (size!46490 a!2901)))) (or (is-Undefined!10257 lt!610952) (is-Found!10257 lt!610952) (is-MissingZero!10257 lt!610952) (not (is-MissingVacant!10257 lt!610952)) (and (bvsge (index!43402 lt!610952) #b00000000000000000000000000000000) (bvslt (index!43402 lt!610952) (size!46490 a!2901)))) (or (is-Undefined!10257 lt!610952) (ite (is-Found!10257 lt!610952) (= (select (arr!45940 a!2901) (index!43400 lt!610952)) (select (arr!45940 a!2901) j!112)) (ite (is-MissingZero!10257 lt!610952) (= (select (arr!45940 a!2901) (index!43399 lt!610952)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10257 lt!610952) (= (select (arr!45940 a!2901) (index!43402 lt!610952)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150227 (= lt!610952 e!787596)))

(declare-fun c!129421 () Bool)

(assert (=> d!150227 (= c!129421 (and (is-Intermediate!10257 lt!610953) (undefined!11069 lt!610953)))))

(assert (=> d!150227 (= lt!610953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45940 a!2901) j!112) mask!2840) (select (arr!45940 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150227 (validMask!0 mask!2840)))

(assert (=> d!150227 (= (seekEntryOrOpen!0 (select (arr!45940 a!2901) j!112) a!2901 mask!2840) lt!610952)))

(declare-fun b!1390776 () Bool)

(assert (=> b!1390776 (= e!787594 (MissingZero!10257 (index!43401 lt!610953)))))

(declare-fun b!1390777 () Bool)

(declare-fun c!129419 () Bool)

(assert (=> b!1390777 (= c!129419 (= lt!610954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1390777 (= e!787595 e!787594)))

(assert (= (and d!150227 c!129421) b!1390775))

(assert (= (and d!150227 (not c!129421)) b!1390772))

(assert (= (and b!1390772 c!129420) b!1390774))

(assert (= (and b!1390772 (not c!129420)) b!1390777))

(assert (= (and b!1390777 c!129419) b!1390776))

(assert (= (and b!1390777 (not c!129419)) b!1390773))

(declare-fun m!1276591 () Bool)

(assert (=> b!1390772 m!1276591))

(assert (=> b!1390773 m!1276489))

(declare-fun m!1276593 () Bool)

(assert (=> b!1390773 m!1276593))

(declare-fun m!1276595 () Bool)

(assert (=> d!150227 m!1276595))

(assert (=> d!150227 m!1276489))

(assert (=> d!150227 m!1276493))

(assert (=> d!150227 m!1276509))

(declare-fun m!1276597 () Bool)

(assert (=> d!150227 m!1276597))

(assert (=> d!150227 m!1276493))

(assert (=> d!150227 m!1276489))

(assert (=> d!150227 m!1276497))

(declare-fun m!1276599 () Bool)

(assert (=> d!150227 m!1276599))

(assert (=> b!1390608 d!150227))

(declare-fun d!150235 () Bool)

(assert (=> d!150235 (= (validKeyInArray!0 (select (arr!45940 a!2901) i!1037)) (and (not (= (select (arr!45940 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45940 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390602 d!150235))

(declare-fun d!150237 () Bool)

(assert (=> d!150237 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119212 d!150237))

(declare-fun d!150245 () Bool)

(assert (=> d!150245 (= (array_inv!34968 a!2901) (bvsge (size!46490 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119212 d!150245))

(declare-fun b!1390828 () Bool)

(declare-fun e!787630 () Bool)

(declare-fun e!787629 () Bool)

(assert (=> b!1390828 (= e!787630 e!787629)))

(declare-fun c!129437 () Bool)

(assert (=> b!1390828 (= c!129437 (validKeyInArray!0 (select (arr!45940 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390829 () Bool)

(declare-fun call!66717 () Bool)

(assert (=> b!1390829 (= e!787629 call!66717)))

(declare-fun b!1390830 () Bool)

(assert (=> b!1390830 (= e!787629 call!66717)))

(declare-fun b!1390831 () Bool)

(declare-fun e!787628 () Bool)

(assert (=> b!1390831 (= e!787628 e!787630)))

(declare-fun res!930848 () Bool)

(assert (=> b!1390831 (=> (not res!930848) (not e!787630))))

(declare-fun e!787631 () Bool)

(assert (=> b!1390831 (= res!930848 (not e!787631))))

(declare-fun res!930847 () Bool)

(assert (=> b!1390831 (=> (not res!930847) (not e!787631))))

