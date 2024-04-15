; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121724 () Bool)

(assert start!121724)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96552 0))(
  ( (array!96553 (arr!46612 (Array (_ BitVec 32) (_ BitVec 64))) (size!47164 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96552)

(declare-datatypes ((SeekEntryResult!10949 0))(
  ( (MissingZero!10949 (index!46179 (_ BitVec 32))) (Found!10949 (index!46180 (_ BitVec 32))) (Intermediate!10949 (undefined!11761 Bool) (index!46181 (_ BitVec 32)) (x!127765 (_ BitVec 32))) (Undefined!10949) (MissingVacant!10949 (index!46182 (_ BitVec 32))) )
))
(declare-fun lt!623077 () SeekEntryResult!10949)

(declare-fun e!800124 () Bool)

(declare-fun b!1413792 () Bool)

(declare-fun lt!623080 () array!96552)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!623079 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96552 (_ BitVec 32)) SeekEntryResult!10949)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96552 (_ BitVec 32)) SeekEntryResult!10949)

(assert (=> b!1413792 (= e!800124 (= (seekEntryOrOpen!0 lt!623079 lt!623080 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127765 lt!623077) (index!46181 lt!623077) (index!46181 lt!623077) (select (arr!46612 a!2901) j!112) lt!623080 mask!2840)))))

(declare-fun b!1413793 () Bool)

(declare-fun e!800122 () Bool)

(declare-fun e!800121 () Bool)

(assert (=> b!1413793 (= e!800122 e!800121)))

(declare-fun res!950604 () Bool)

(assert (=> b!1413793 (=> res!950604 e!800121)))

(declare-fun lt!623075 () SeekEntryResult!10949)

(get-info :version)

(assert (=> b!1413793 (= res!950604 (or (= lt!623075 lt!623077) (not ((_ is Intermediate!10949) lt!623077))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96552 (_ BitVec 32)) SeekEntryResult!10949)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413793 (= lt!623077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623079 mask!2840) lt!623079 lt!623080 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413793 (= lt!623079 (select (store (arr!46612 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413793 (= lt!623080 (array!96553 (store (arr!46612 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47164 a!2901)))))

(declare-fun b!1413794 () Bool)

(declare-fun res!950598 () Bool)

(declare-fun e!800123 () Bool)

(assert (=> b!1413794 (=> (not res!950598) (not e!800123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96552 (_ BitVec 32)) Bool)

(assert (=> b!1413794 (= res!950598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!950600 () Bool)

(assert (=> start!121724 (=> (not res!950600) (not e!800123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121724 (= res!950600 (validMask!0 mask!2840))))

(assert (=> start!121724 e!800123))

(assert (=> start!121724 true))

(declare-fun array_inv!35845 (array!96552) Bool)

(assert (=> start!121724 (array_inv!35845 a!2901)))

(declare-fun b!1413795 () Bool)

(declare-fun res!950605 () Bool)

(assert (=> b!1413795 (=> (not res!950605) (not e!800123))))

(assert (=> b!1413795 (= res!950605 (and (= (size!47164 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47164 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47164 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413796 () Bool)

(declare-fun res!950596 () Bool)

(assert (=> b!1413796 (=> (not res!950596) (not e!800123))))

(declare-datatypes ((List!33209 0))(
  ( (Nil!33206) (Cons!33205 (h!34483 (_ BitVec 64)) (t!47895 List!33209)) )
))
(declare-fun arrayNoDuplicates!0 (array!96552 (_ BitVec 32) List!33209) Bool)

(assert (=> b!1413796 (= res!950596 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33206))))

(declare-fun b!1413797 () Bool)

(assert (=> b!1413797 (= e!800123 (not e!800122))))

(declare-fun res!950601 () Bool)

(assert (=> b!1413797 (=> res!950601 e!800122)))

(assert (=> b!1413797 (= res!950601 (or (not ((_ is Intermediate!10949) lt!623075)) (undefined!11761 lt!623075)))))

(declare-fun e!800125 () Bool)

(assert (=> b!1413797 e!800125))

(declare-fun res!950602 () Bool)

(assert (=> b!1413797 (=> (not res!950602) (not e!800125))))

(assert (=> b!1413797 (= res!950602 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47715 0))(
  ( (Unit!47716) )
))
(declare-fun lt!623076 () Unit!47715)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47715)

(assert (=> b!1413797 (= lt!623076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623078 () (_ BitVec 32))

(assert (=> b!1413797 (= lt!623075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623078 (select (arr!46612 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413797 (= lt!623078 (toIndex!0 (select (arr!46612 a!2901) j!112) mask!2840))))

(declare-fun b!1413798 () Bool)

(declare-fun res!950599 () Bool)

(assert (=> b!1413798 (=> (not res!950599) (not e!800123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413798 (= res!950599 (validKeyInArray!0 (select (arr!46612 a!2901) j!112)))))

(declare-fun b!1413799 () Bool)

(assert (=> b!1413799 (= e!800125 (= (seekEntryOrOpen!0 (select (arr!46612 a!2901) j!112) a!2901 mask!2840) (Found!10949 j!112)))))

(declare-fun b!1413800 () Bool)

(assert (=> b!1413800 (= e!800121 (or (bvslt (x!127765 lt!623075) #b00000000000000000000000000000000) (bvsgt (x!127765 lt!623075) #b01111111111111111111111111111110) (and (bvsge (x!127765 lt!623077) #b00000000000000000000000000000000) (bvsle (x!127765 lt!623077) #b01111111111111111111111111111110))))))

(assert (=> b!1413800 e!800124))

(declare-fun res!950603 () Bool)

(assert (=> b!1413800 (=> (not res!950603) (not e!800124))))

(assert (=> b!1413800 (= res!950603 (and (not (undefined!11761 lt!623077)) (= (index!46181 lt!623077) i!1037) (bvslt (x!127765 lt!623077) (x!127765 lt!623075)) (= (select (store (arr!46612 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46181 lt!623077)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623081 () Unit!47715)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47715)

(assert (=> b!1413800 (= lt!623081 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623078 (x!127765 lt!623075) (index!46181 lt!623075) (x!127765 lt!623077) (index!46181 lt!623077) (undefined!11761 lt!623077) mask!2840))))

(declare-fun b!1413801 () Bool)

(declare-fun res!950597 () Bool)

(assert (=> b!1413801 (=> (not res!950597) (not e!800123))))

(assert (=> b!1413801 (= res!950597 (validKeyInArray!0 (select (arr!46612 a!2901) i!1037)))))

(assert (= (and start!121724 res!950600) b!1413795))

(assert (= (and b!1413795 res!950605) b!1413801))

(assert (= (and b!1413801 res!950597) b!1413798))

(assert (= (and b!1413798 res!950599) b!1413794))

(assert (= (and b!1413794 res!950598) b!1413796))

(assert (= (and b!1413796 res!950596) b!1413797))

(assert (= (and b!1413797 res!950602) b!1413799))

(assert (= (and b!1413797 (not res!950601)) b!1413793))

(assert (= (and b!1413793 (not res!950604)) b!1413800))

(assert (= (and b!1413800 res!950603) b!1413792))

(declare-fun m!1303699 () Bool)

(assert (=> b!1413792 m!1303699))

(declare-fun m!1303701 () Bool)

(assert (=> b!1413792 m!1303701))

(assert (=> b!1413792 m!1303701))

(declare-fun m!1303703 () Bool)

(assert (=> b!1413792 m!1303703))

(declare-fun m!1303705 () Bool)

(assert (=> b!1413800 m!1303705))

(declare-fun m!1303707 () Bool)

(assert (=> b!1413800 m!1303707))

(declare-fun m!1303709 () Bool)

(assert (=> b!1413800 m!1303709))

(assert (=> b!1413798 m!1303701))

(assert (=> b!1413798 m!1303701))

(declare-fun m!1303711 () Bool)

(assert (=> b!1413798 m!1303711))

(declare-fun m!1303713 () Bool)

(assert (=> b!1413796 m!1303713))

(declare-fun m!1303715 () Bool)

(assert (=> b!1413794 m!1303715))

(assert (=> b!1413799 m!1303701))

(assert (=> b!1413799 m!1303701))

(declare-fun m!1303717 () Bool)

(assert (=> b!1413799 m!1303717))

(declare-fun m!1303719 () Bool)

(assert (=> b!1413793 m!1303719))

(assert (=> b!1413793 m!1303719))

(declare-fun m!1303721 () Bool)

(assert (=> b!1413793 m!1303721))

(assert (=> b!1413793 m!1303705))

(declare-fun m!1303723 () Bool)

(assert (=> b!1413793 m!1303723))

(declare-fun m!1303725 () Bool)

(assert (=> b!1413801 m!1303725))

(assert (=> b!1413801 m!1303725))

(declare-fun m!1303727 () Bool)

(assert (=> b!1413801 m!1303727))

(declare-fun m!1303729 () Bool)

(assert (=> start!121724 m!1303729))

(declare-fun m!1303731 () Bool)

(assert (=> start!121724 m!1303731))

(assert (=> b!1413797 m!1303701))

(declare-fun m!1303733 () Bool)

(assert (=> b!1413797 m!1303733))

(assert (=> b!1413797 m!1303701))

(declare-fun m!1303735 () Bool)

(assert (=> b!1413797 m!1303735))

(declare-fun m!1303737 () Bool)

(assert (=> b!1413797 m!1303737))

(assert (=> b!1413797 m!1303701))

(declare-fun m!1303739 () Bool)

(assert (=> b!1413797 m!1303739))

(check-sat (not b!1413793) (not b!1413794) (not b!1413792) (not b!1413799) (not b!1413800) (not b!1413798) (not b!1413797) (not start!121724) (not b!1413801) (not b!1413796))
(check-sat)
(get-model)

(declare-fun e!800169 () SeekEntryResult!10949)

(declare-fun lt!623131 () SeekEntryResult!10949)

(declare-fun b!1413874 () Bool)

(assert (=> b!1413874 (= e!800169 (seekKeyOrZeroReturnVacant!0 (x!127765 lt!623131) (index!46181 lt!623131) (index!46181 lt!623131) (select (arr!46612 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1413875 () Bool)

(declare-fun e!800170 () SeekEntryResult!10949)

(declare-fun e!800171 () SeekEntryResult!10949)

(assert (=> b!1413875 (= e!800170 e!800171)))

(declare-fun lt!623132 () (_ BitVec 64))

(assert (=> b!1413875 (= lt!623132 (select (arr!46612 a!2901) (index!46181 lt!623131)))))

(declare-fun c!131083 () Bool)

(assert (=> b!1413875 (= c!131083 (= lt!623132 (select (arr!46612 a!2901) j!112)))))

(declare-fun b!1413876 () Bool)

(assert (=> b!1413876 (= e!800169 (MissingZero!10949 (index!46181 lt!623131)))))

(declare-fun d!152093 () Bool)

(declare-fun lt!623130 () SeekEntryResult!10949)

(assert (=> d!152093 (and (or ((_ is Undefined!10949) lt!623130) (not ((_ is Found!10949) lt!623130)) (and (bvsge (index!46180 lt!623130) #b00000000000000000000000000000000) (bvslt (index!46180 lt!623130) (size!47164 a!2901)))) (or ((_ is Undefined!10949) lt!623130) ((_ is Found!10949) lt!623130) (not ((_ is MissingZero!10949) lt!623130)) (and (bvsge (index!46179 lt!623130) #b00000000000000000000000000000000) (bvslt (index!46179 lt!623130) (size!47164 a!2901)))) (or ((_ is Undefined!10949) lt!623130) ((_ is Found!10949) lt!623130) ((_ is MissingZero!10949) lt!623130) (not ((_ is MissingVacant!10949) lt!623130)) (and (bvsge (index!46182 lt!623130) #b00000000000000000000000000000000) (bvslt (index!46182 lt!623130) (size!47164 a!2901)))) (or ((_ is Undefined!10949) lt!623130) (ite ((_ is Found!10949) lt!623130) (= (select (arr!46612 a!2901) (index!46180 lt!623130)) (select (arr!46612 a!2901) j!112)) (ite ((_ is MissingZero!10949) lt!623130) (= (select (arr!46612 a!2901) (index!46179 lt!623130)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10949) lt!623130) (= (select (arr!46612 a!2901) (index!46182 lt!623130)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152093 (= lt!623130 e!800170)))

(declare-fun c!131081 () Bool)

(assert (=> d!152093 (= c!131081 (and ((_ is Intermediate!10949) lt!623131) (undefined!11761 lt!623131)))))

(assert (=> d!152093 (= lt!623131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46612 a!2901) j!112) mask!2840) (select (arr!46612 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152093 (validMask!0 mask!2840)))

(assert (=> d!152093 (= (seekEntryOrOpen!0 (select (arr!46612 a!2901) j!112) a!2901 mask!2840) lt!623130)))

(declare-fun b!1413877 () Bool)

(assert (=> b!1413877 (= e!800171 (Found!10949 (index!46181 lt!623131)))))

(declare-fun b!1413878 () Bool)

(assert (=> b!1413878 (= e!800170 Undefined!10949)))

(declare-fun b!1413879 () Bool)

(declare-fun c!131082 () Bool)

(assert (=> b!1413879 (= c!131082 (= lt!623132 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413879 (= e!800171 e!800169)))

(assert (= (and d!152093 c!131081) b!1413878))

(assert (= (and d!152093 (not c!131081)) b!1413875))

(assert (= (and b!1413875 c!131083) b!1413877))

(assert (= (and b!1413875 (not c!131083)) b!1413879))

(assert (= (and b!1413879 c!131082) b!1413876))

(assert (= (and b!1413879 (not c!131082)) b!1413874))

(assert (=> b!1413874 m!1303701))

(declare-fun m!1303825 () Bool)

(assert (=> b!1413874 m!1303825))

(declare-fun m!1303827 () Bool)

(assert (=> b!1413875 m!1303827))

(declare-fun m!1303829 () Bool)

(assert (=> d!152093 m!1303829))

(declare-fun m!1303831 () Bool)

(assert (=> d!152093 m!1303831))

(assert (=> d!152093 m!1303701))

(assert (=> d!152093 m!1303733))

(assert (=> d!152093 m!1303733))

(assert (=> d!152093 m!1303701))

(declare-fun m!1303833 () Bool)

(assert (=> d!152093 m!1303833))

(assert (=> d!152093 m!1303729))

(declare-fun m!1303835 () Bool)

(assert (=> d!152093 m!1303835))

(assert (=> b!1413799 d!152093))

(declare-fun b!1413888 () Bool)

(declare-fun e!800180 () Bool)

(declare-fun call!67100 () Bool)

(assert (=> b!1413888 (= e!800180 call!67100)))

(declare-fun b!1413889 () Bool)

(declare-fun e!800179 () Bool)

(assert (=> b!1413889 (= e!800179 call!67100)))

(declare-fun bm!67097 () Bool)

(assert (=> bm!67097 (= call!67100 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1413891 () Bool)

(assert (=> b!1413891 (= e!800180 e!800179)))

(declare-fun lt!623140 () (_ BitVec 64))

(assert (=> b!1413891 (= lt!623140 (select (arr!46612 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623139 () Unit!47715)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96552 (_ BitVec 64) (_ BitVec 32)) Unit!47715)

(assert (=> b!1413891 (= lt!623139 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623140 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1413891 (arrayContainsKey!0 a!2901 lt!623140 #b00000000000000000000000000000000)))

(declare-fun lt!623141 () Unit!47715)

(assert (=> b!1413891 (= lt!623141 lt!623139)))

(declare-fun res!950671 () Bool)

(assert (=> b!1413891 (= res!950671 (= (seekEntryOrOpen!0 (select (arr!46612 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10949 #b00000000000000000000000000000000)))))

(assert (=> b!1413891 (=> (not res!950671) (not e!800179))))

(declare-fun b!1413890 () Bool)

(declare-fun e!800178 () Bool)

(assert (=> b!1413890 (= e!800178 e!800180)))

(declare-fun c!131086 () Bool)

(assert (=> b!1413890 (= c!131086 (validKeyInArray!0 (select (arr!46612 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152095 () Bool)

(declare-fun res!950670 () Bool)

(assert (=> d!152095 (=> res!950670 e!800178)))

(assert (=> d!152095 (= res!950670 (bvsge #b00000000000000000000000000000000 (size!47164 a!2901)))))

(assert (=> d!152095 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800178)))

(assert (= (and d!152095 (not res!950670)) b!1413890))

(assert (= (and b!1413890 c!131086) b!1413891))

(assert (= (and b!1413890 (not c!131086)) b!1413888))

(assert (= (and b!1413891 res!950671) b!1413889))

(assert (= (or b!1413889 b!1413888) bm!67097))

(declare-fun m!1303837 () Bool)

(assert (=> bm!67097 m!1303837))

(declare-fun m!1303839 () Bool)

(assert (=> b!1413891 m!1303839))

(declare-fun m!1303841 () Bool)

(assert (=> b!1413891 m!1303841))

(declare-fun m!1303843 () Bool)

(assert (=> b!1413891 m!1303843))

(assert (=> b!1413891 m!1303839))

(declare-fun m!1303845 () Bool)

(assert (=> b!1413891 m!1303845))

(assert (=> b!1413890 m!1303839))

(assert (=> b!1413890 m!1303839))

(declare-fun m!1303847 () Bool)

(assert (=> b!1413890 m!1303847))

(assert (=> b!1413794 d!152095))

(declare-fun d!152097 () Bool)

(assert (=> d!152097 (and (not (undefined!11761 lt!623077)) (= (index!46181 lt!623077) i!1037) (bvslt (x!127765 lt!623077) (x!127765 lt!623075)))))

(declare-fun lt!623144 () Unit!47715)

(declare-fun choose!62 (array!96552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47715)

(assert (=> d!152097 (= lt!623144 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623078 (x!127765 lt!623075) (index!46181 lt!623075) (x!127765 lt!623077) (index!46181 lt!623077) (undefined!11761 lt!623077) mask!2840))))

(assert (=> d!152097 (validMask!0 mask!2840)))

(assert (=> d!152097 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623078 (x!127765 lt!623075) (index!46181 lt!623075) (x!127765 lt!623077) (index!46181 lt!623077) (undefined!11761 lt!623077) mask!2840) lt!623144)))

(declare-fun bs!41197 () Bool)

(assert (= bs!41197 d!152097))

(declare-fun m!1303849 () Bool)

(assert (=> bs!41197 m!1303849))

(assert (=> bs!41197 m!1303729))

(assert (=> b!1413800 d!152097))

(declare-fun d!152105 () Bool)

(assert (=> d!152105 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121724 d!152105))

(declare-fun d!152109 () Bool)

(assert (=> d!152109 (= (array_inv!35845 a!2901) (bvsge (size!47164 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121724 d!152109))

(declare-fun d!152113 () Bool)

(assert (=> d!152113 (= (validKeyInArray!0 (select (arr!46612 a!2901) j!112)) (and (not (= (select (arr!46612 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46612 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413798 d!152113))

(declare-fun b!1413940 () Bool)

(declare-fun lt!623170 () SeekEntryResult!10949)

(assert (=> b!1413940 (and (bvsge (index!46181 lt!623170) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623170) (size!47164 lt!623080)))))

(declare-fun e!800213 () Bool)

(assert (=> b!1413940 (= e!800213 (= (select (arr!46612 lt!623080) (index!46181 lt!623170)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1413941 () Bool)

(declare-fun e!800210 () SeekEntryResult!10949)

(assert (=> b!1413941 (= e!800210 (Intermediate!10949 false (toIndex!0 lt!623079 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413942 () Bool)

(declare-fun e!800209 () SeekEntryResult!10949)

(assert (=> b!1413942 (= e!800209 e!800210)))

(declare-fun c!131106 () Bool)

(declare-fun lt!623171 () (_ BitVec 64))

(assert (=> b!1413942 (= c!131106 (or (= lt!623171 lt!623079) (= (bvadd lt!623171 lt!623171) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152115 () Bool)

(declare-fun e!800211 () Bool)

(assert (=> d!152115 e!800211))

(declare-fun c!131105 () Bool)

(assert (=> d!152115 (= c!131105 (and ((_ is Intermediate!10949) lt!623170) (undefined!11761 lt!623170)))))

(assert (=> d!152115 (= lt!623170 e!800209)))

(declare-fun c!131107 () Bool)

(assert (=> d!152115 (= c!131107 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152115 (= lt!623171 (select (arr!46612 lt!623080) (toIndex!0 lt!623079 mask!2840)))))

(assert (=> d!152115 (validMask!0 mask!2840)))

(assert (=> d!152115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623079 mask!2840) lt!623079 lt!623080 mask!2840) lt!623170)))

(declare-fun b!1413943 () Bool)

(assert (=> b!1413943 (and (bvsge (index!46181 lt!623170) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623170) (size!47164 lt!623080)))))

(declare-fun res!950684 () Bool)

(assert (=> b!1413943 (= res!950684 (= (select (arr!46612 lt!623080) (index!46181 lt!623170)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413943 (=> res!950684 e!800213)))

(declare-fun b!1413944 () Bool)

(assert (=> b!1413944 (and (bvsge (index!46181 lt!623170) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623170) (size!47164 lt!623080)))))

(declare-fun res!950685 () Bool)

(assert (=> b!1413944 (= res!950685 (= (select (arr!46612 lt!623080) (index!46181 lt!623170)) lt!623079))))

(assert (=> b!1413944 (=> res!950685 e!800213)))

(declare-fun e!800212 () Bool)

(assert (=> b!1413944 (= e!800212 e!800213)))

(declare-fun b!1413945 () Bool)

(assert (=> b!1413945 (= e!800211 e!800212)))

(declare-fun res!950686 () Bool)

(assert (=> b!1413945 (= res!950686 (and ((_ is Intermediate!10949) lt!623170) (not (undefined!11761 lt!623170)) (bvslt (x!127765 lt!623170) #b01111111111111111111111111111110) (bvsge (x!127765 lt!623170) #b00000000000000000000000000000000) (bvsge (x!127765 lt!623170) #b00000000000000000000000000000000)))))

(assert (=> b!1413945 (=> (not res!950686) (not e!800212))))

(declare-fun b!1413946 () Bool)

(assert (=> b!1413946 (= e!800211 (bvsge (x!127765 lt!623170) #b01111111111111111111111111111110))))

(declare-fun b!1413947 () Bool)

(assert (=> b!1413947 (= e!800209 (Intermediate!10949 true (toIndex!0 lt!623079 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413948 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413948 (= e!800210 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623079 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623079 lt!623080 mask!2840))))

(assert (= (and d!152115 c!131107) b!1413947))

(assert (= (and d!152115 (not c!131107)) b!1413942))

(assert (= (and b!1413942 c!131106) b!1413941))

(assert (= (and b!1413942 (not c!131106)) b!1413948))

(assert (= (and d!152115 c!131105) b!1413946))

(assert (= (and d!152115 (not c!131105)) b!1413945))

(assert (= (and b!1413945 res!950686) b!1413944))

(assert (= (and b!1413944 (not res!950685)) b!1413943))

(assert (= (and b!1413943 (not res!950684)) b!1413940))

(declare-fun m!1303869 () Bool)

(assert (=> b!1413944 m!1303869))

(assert (=> b!1413940 m!1303869))

(assert (=> b!1413948 m!1303719))

(declare-fun m!1303871 () Bool)

(assert (=> b!1413948 m!1303871))

(assert (=> b!1413948 m!1303871))

(declare-fun m!1303873 () Bool)

(assert (=> b!1413948 m!1303873))

(assert (=> d!152115 m!1303719))

(declare-fun m!1303875 () Bool)

(assert (=> d!152115 m!1303875))

(assert (=> d!152115 m!1303729))

(assert (=> b!1413943 m!1303869))

(assert (=> b!1413793 d!152115))

(declare-fun d!152123 () Bool)

(declare-fun lt!623177 () (_ BitVec 32))

(declare-fun lt!623176 () (_ BitVec 32))

(assert (=> d!152123 (= lt!623177 (bvmul (bvxor lt!623176 (bvlshr lt!623176 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152123 (= lt!623176 ((_ extract 31 0) (bvand (bvxor lt!623079 (bvlshr lt!623079 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152123 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950687 (let ((h!34486 ((_ extract 31 0) (bvand (bvxor lt!623079 (bvlshr lt!623079 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127770 (bvmul (bvxor h!34486 (bvlshr h!34486 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127770 (bvlshr x!127770 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950687 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950687 #b00000000000000000000000000000000))))))

(assert (=> d!152123 (= (toIndex!0 lt!623079 mask!2840) (bvand (bvxor lt!623177 (bvlshr lt!623177 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413793 d!152123))

(declare-fun b!1413949 () Bool)

(declare-fun e!800216 () Bool)

(declare-fun call!67104 () Bool)

(assert (=> b!1413949 (= e!800216 call!67104)))

(declare-fun b!1413950 () Bool)

(declare-fun e!800215 () Bool)

(assert (=> b!1413950 (= e!800215 call!67104)))

(declare-fun bm!67101 () Bool)

(assert (=> bm!67101 (= call!67104 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1413952 () Bool)

(assert (=> b!1413952 (= e!800216 e!800215)))

(declare-fun lt!623179 () (_ BitVec 64))

(assert (=> b!1413952 (= lt!623179 (select (arr!46612 a!2901) j!112))))

(declare-fun lt!623178 () Unit!47715)

(assert (=> b!1413952 (= lt!623178 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623179 j!112))))

(assert (=> b!1413952 (arrayContainsKey!0 a!2901 lt!623179 #b00000000000000000000000000000000)))

(declare-fun lt!623180 () Unit!47715)

(assert (=> b!1413952 (= lt!623180 lt!623178)))

(declare-fun res!950689 () Bool)

(assert (=> b!1413952 (= res!950689 (= (seekEntryOrOpen!0 (select (arr!46612 a!2901) j!112) a!2901 mask!2840) (Found!10949 j!112)))))

(assert (=> b!1413952 (=> (not res!950689) (not e!800215))))

(declare-fun b!1413951 () Bool)

(declare-fun e!800214 () Bool)

(assert (=> b!1413951 (= e!800214 e!800216)))

(declare-fun c!131108 () Bool)

(assert (=> b!1413951 (= c!131108 (validKeyInArray!0 (select (arr!46612 a!2901) j!112)))))

(declare-fun d!152125 () Bool)

(declare-fun res!950688 () Bool)

(assert (=> d!152125 (=> res!950688 e!800214)))

(assert (=> d!152125 (= res!950688 (bvsge j!112 (size!47164 a!2901)))))

(assert (=> d!152125 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800214)))

(assert (= (and d!152125 (not res!950688)) b!1413951))

(assert (= (and b!1413951 c!131108) b!1413952))

(assert (= (and b!1413951 (not c!131108)) b!1413949))

(assert (= (and b!1413952 res!950689) b!1413950))

(assert (= (or b!1413950 b!1413949) bm!67101))

(declare-fun m!1303877 () Bool)

(assert (=> bm!67101 m!1303877))

(assert (=> b!1413952 m!1303701))

(declare-fun m!1303879 () Bool)

(assert (=> b!1413952 m!1303879))

(declare-fun m!1303881 () Bool)

(assert (=> b!1413952 m!1303881))

(assert (=> b!1413952 m!1303701))

(assert (=> b!1413952 m!1303717))

(assert (=> b!1413951 m!1303701))

(assert (=> b!1413951 m!1303701))

(assert (=> b!1413951 m!1303711))

(assert (=> b!1413797 d!152125))

(declare-fun d!152127 () Bool)

(assert (=> d!152127 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623183 () Unit!47715)

(declare-fun choose!38 (array!96552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47715)

(assert (=> d!152127 (= lt!623183 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152127 (validMask!0 mask!2840)))

(assert (=> d!152127 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623183)))

(declare-fun bs!41199 () Bool)

(assert (= bs!41199 d!152127))

(assert (=> bs!41199 m!1303737))

(declare-fun m!1303883 () Bool)

(assert (=> bs!41199 m!1303883))

(assert (=> bs!41199 m!1303729))

(assert (=> b!1413797 d!152127))

(declare-fun b!1413953 () Bool)

(declare-fun lt!623184 () SeekEntryResult!10949)

(assert (=> b!1413953 (and (bvsge (index!46181 lt!623184) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623184) (size!47164 a!2901)))))

(declare-fun e!800221 () Bool)

(assert (=> b!1413953 (= e!800221 (= (select (arr!46612 a!2901) (index!46181 lt!623184)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1413954 () Bool)

(declare-fun e!800218 () SeekEntryResult!10949)

(assert (=> b!1413954 (= e!800218 (Intermediate!10949 false lt!623078 #b00000000000000000000000000000000))))

(declare-fun b!1413955 () Bool)

(declare-fun e!800217 () SeekEntryResult!10949)

(assert (=> b!1413955 (= e!800217 e!800218)))

(declare-fun c!131110 () Bool)

(declare-fun lt!623185 () (_ BitVec 64))

(assert (=> b!1413955 (= c!131110 (or (= lt!623185 (select (arr!46612 a!2901) j!112)) (= (bvadd lt!623185 lt!623185) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152129 () Bool)

(declare-fun e!800219 () Bool)

(assert (=> d!152129 e!800219))

(declare-fun c!131109 () Bool)

(assert (=> d!152129 (= c!131109 (and ((_ is Intermediate!10949) lt!623184) (undefined!11761 lt!623184)))))

(assert (=> d!152129 (= lt!623184 e!800217)))

(declare-fun c!131111 () Bool)

(assert (=> d!152129 (= c!131111 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152129 (= lt!623185 (select (arr!46612 a!2901) lt!623078))))

(assert (=> d!152129 (validMask!0 mask!2840)))

(assert (=> d!152129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623078 (select (arr!46612 a!2901) j!112) a!2901 mask!2840) lt!623184)))

(declare-fun b!1413956 () Bool)

(assert (=> b!1413956 (and (bvsge (index!46181 lt!623184) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623184) (size!47164 a!2901)))))

(declare-fun res!950690 () Bool)

(assert (=> b!1413956 (= res!950690 (= (select (arr!46612 a!2901) (index!46181 lt!623184)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413956 (=> res!950690 e!800221)))

(declare-fun b!1413957 () Bool)

(assert (=> b!1413957 (and (bvsge (index!46181 lt!623184) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623184) (size!47164 a!2901)))))

(declare-fun res!950691 () Bool)

(assert (=> b!1413957 (= res!950691 (= (select (arr!46612 a!2901) (index!46181 lt!623184)) (select (arr!46612 a!2901) j!112)))))

(assert (=> b!1413957 (=> res!950691 e!800221)))

(declare-fun e!800220 () Bool)

(assert (=> b!1413957 (= e!800220 e!800221)))

(declare-fun b!1413958 () Bool)

(assert (=> b!1413958 (= e!800219 e!800220)))

(declare-fun res!950692 () Bool)

(assert (=> b!1413958 (= res!950692 (and ((_ is Intermediate!10949) lt!623184) (not (undefined!11761 lt!623184)) (bvslt (x!127765 lt!623184) #b01111111111111111111111111111110) (bvsge (x!127765 lt!623184) #b00000000000000000000000000000000) (bvsge (x!127765 lt!623184) #b00000000000000000000000000000000)))))

(assert (=> b!1413958 (=> (not res!950692) (not e!800220))))

(declare-fun b!1413959 () Bool)

(assert (=> b!1413959 (= e!800219 (bvsge (x!127765 lt!623184) #b01111111111111111111111111111110))))

(declare-fun b!1413960 () Bool)

(assert (=> b!1413960 (= e!800217 (Intermediate!10949 true lt!623078 #b00000000000000000000000000000000))))

(declare-fun b!1413961 () Bool)

(assert (=> b!1413961 (= e!800218 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623078 #b00000000000000000000000000000000 mask!2840) (select (arr!46612 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152129 c!131111) b!1413960))

(assert (= (and d!152129 (not c!131111)) b!1413955))

(assert (= (and b!1413955 c!131110) b!1413954))

(assert (= (and b!1413955 (not c!131110)) b!1413961))

(assert (= (and d!152129 c!131109) b!1413959))

(assert (= (and d!152129 (not c!131109)) b!1413958))

(assert (= (and b!1413958 res!950692) b!1413957))

(assert (= (and b!1413957 (not res!950691)) b!1413956))

(assert (= (and b!1413956 (not res!950690)) b!1413953))

(declare-fun m!1303885 () Bool)

(assert (=> b!1413957 m!1303885))

(assert (=> b!1413953 m!1303885))

(declare-fun m!1303887 () Bool)

(assert (=> b!1413961 m!1303887))

(assert (=> b!1413961 m!1303887))

(assert (=> b!1413961 m!1303701))

(declare-fun m!1303889 () Bool)

(assert (=> b!1413961 m!1303889))

(declare-fun m!1303891 () Bool)

(assert (=> d!152129 m!1303891))

(assert (=> d!152129 m!1303729))

(assert (=> b!1413956 m!1303885))

(assert (=> b!1413797 d!152129))

(declare-fun d!152131 () Bool)

(declare-fun lt!623191 () (_ BitVec 32))

(declare-fun lt!623190 () (_ BitVec 32))

(assert (=> d!152131 (= lt!623191 (bvmul (bvxor lt!623190 (bvlshr lt!623190 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152131 (= lt!623190 ((_ extract 31 0) (bvand (bvxor (select (arr!46612 a!2901) j!112) (bvlshr (select (arr!46612 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152131 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950687 (let ((h!34486 ((_ extract 31 0) (bvand (bvxor (select (arr!46612 a!2901) j!112) (bvlshr (select (arr!46612 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127770 (bvmul (bvxor h!34486 (bvlshr h!34486 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127770 (bvlshr x!127770 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950687 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950687 #b00000000000000000000000000000000))))))

(assert (=> d!152131 (= (toIndex!0 (select (arr!46612 a!2901) j!112) mask!2840) (bvand (bvxor lt!623191 (bvlshr lt!623191 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413797 d!152131))

(declare-fun e!800228 () SeekEntryResult!10949)

(declare-fun b!1413974 () Bool)

(declare-fun lt!623193 () SeekEntryResult!10949)

(assert (=> b!1413974 (= e!800228 (seekKeyOrZeroReturnVacant!0 (x!127765 lt!623193) (index!46181 lt!623193) (index!46181 lt!623193) lt!623079 lt!623080 mask!2840))))

(declare-fun b!1413975 () Bool)

(declare-fun e!800229 () SeekEntryResult!10949)

(declare-fun e!800230 () SeekEntryResult!10949)

(assert (=> b!1413975 (= e!800229 e!800230)))

(declare-fun lt!623194 () (_ BitVec 64))

(assert (=> b!1413975 (= lt!623194 (select (arr!46612 lt!623080) (index!46181 lt!623193)))))

(declare-fun c!131120 () Bool)

(assert (=> b!1413975 (= c!131120 (= lt!623194 lt!623079))))

(declare-fun b!1413976 () Bool)

(assert (=> b!1413976 (= e!800228 (MissingZero!10949 (index!46181 lt!623193)))))

(declare-fun d!152133 () Bool)

(declare-fun lt!623192 () SeekEntryResult!10949)

(assert (=> d!152133 (and (or ((_ is Undefined!10949) lt!623192) (not ((_ is Found!10949) lt!623192)) (and (bvsge (index!46180 lt!623192) #b00000000000000000000000000000000) (bvslt (index!46180 lt!623192) (size!47164 lt!623080)))) (or ((_ is Undefined!10949) lt!623192) ((_ is Found!10949) lt!623192) (not ((_ is MissingZero!10949) lt!623192)) (and (bvsge (index!46179 lt!623192) #b00000000000000000000000000000000) (bvslt (index!46179 lt!623192) (size!47164 lt!623080)))) (or ((_ is Undefined!10949) lt!623192) ((_ is Found!10949) lt!623192) ((_ is MissingZero!10949) lt!623192) (not ((_ is MissingVacant!10949) lt!623192)) (and (bvsge (index!46182 lt!623192) #b00000000000000000000000000000000) (bvslt (index!46182 lt!623192) (size!47164 lt!623080)))) (or ((_ is Undefined!10949) lt!623192) (ite ((_ is Found!10949) lt!623192) (= (select (arr!46612 lt!623080) (index!46180 lt!623192)) lt!623079) (ite ((_ is MissingZero!10949) lt!623192) (= (select (arr!46612 lt!623080) (index!46179 lt!623192)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10949) lt!623192) (= (select (arr!46612 lt!623080) (index!46182 lt!623192)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152133 (= lt!623192 e!800229)))

(declare-fun c!131118 () Bool)

(assert (=> d!152133 (= c!131118 (and ((_ is Intermediate!10949) lt!623193) (undefined!11761 lt!623193)))))

(assert (=> d!152133 (= lt!623193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623079 mask!2840) lt!623079 lt!623080 mask!2840))))

(assert (=> d!152133 (validMask!0 mask!2840)))

(assert (=> d!152133 (= (seekEntryOrOpen!0 lt!623079 lt!623080 mask!2840) lt!623192)))

(declare-fun b!1413977 () Bool)

(assert (=> b!1413977 (= e!800230 (Found!10949 (index!46181 lt!623193)))))

(declare-fun b!1413978 () Bool)

(assert (=> b!1413978 (= e!800229 Undefined!10949)))

(declare-fun b!1413979 () Bool)

(declare-fun c!131119 () Bool)

(assert (=> b!1413979 (= c!131119 (= lt!623194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413979 (= e!800230 e!800228)))

(assert (= (and d!152133 c!131118) b!1413978))

(assert (= (and d!152133 (not c!131118)) b!1413975))

(assert (= (and b!1413975 c!131120) b!1413977))

(assert (= (and b!1413975 (not c!131120)) b!1413979))

(assert (= (and b!1413979 c!131119) b!1413976))

(assert (= (and b!1413979 (not c!131119)) b!1413974))

(declare-fun m!1303893 () Bool)

(assert (=> b!1413974 m!1303893))

(declare-fun m!1303895 () Bool)

(assert (=> b!1413975 m!1303895))

(declare-fun m!1303897 () Bool)

(assert (=> d!152133 m!1303897))

(declare-fun m!1303899 () Bool)

(assert (=> d!152133 m!1303899))

(assert (=> d!152133 m!1303719))

(assert (=> d!152133 m!1303719))

(assert (=> d!152133 m!1303721))

(assert (=> d!152133 m!1303729))

(declare-fun m!1303901 () Bool)

(assert (=> d!152133 m!1303901))

(assert (=> b!1413792 d!152133))

(declare-fun b!1414037 () Bool)

(declare-fun e!800266 () SeekEntryResult!10949)

(assert (=> b!1414037 (= e!800266 Undefined!10949)))

(declare-fun b!1414038 () Bool)

(declare-fun c!131144 () Bool)

(declare-fun lt!623224 () (_ BitVec 64))

(assert (=> b!1414038 (= c!131144 (= lt!623224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800265 () SeekEntryResult!10949)

(declare-fun e!800264 () SeekEntryResult!10949)

(assert (=> b!1414038 (= e!800265 e!800264)))

(declare-fun b!1414039 () Bool)

(assert (=> b!1414039 (= e!800266 e!800265)))

(declare-fun c!131142 () Bool)

(assert (=> b!1414039 (= c!131142 (= lt!623224 (select (arr!46612 a!2901) j!112)))))

(declare-fun b!1414040 () Bool)

(assert (=> b!1414040 (= e!800264 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127765 lt!623077) #b00000000000000000000000000000001) (nextIndex!0 (index!46181 lt!623077) (x!127765 lt!623077) mask!2840) (index!46181 lt!623077) (select (arr!46612 a!2901) j!112) lt!623080 mask!2840))))

(declare-fun b!1414041 () Bool)

(assert (=> b!1414041 (= e!800264 (MissingVacant!10949 (index!46181 lt!623077)))))

(declare-fun b!1414042 () Bool)

(assert (=> b!1414042 (= e!800265 (Found!10949 (index!46181 lt!623077)))))

(declare-fun d!152135 () Bool)

(declare-fun lt!623225 () SeekEntryResult!10949)

(assert (=> d!152135 (and (or ((_ is Undefined!10949) lt!623225) (not ((_ is Found!10949) lt!623225)) (and (bvsge (index!46180 lt!623225) #b00000000000000000000000000000000) (bvslt (index!46180 lt!623225) (size!47164 lt!623080)))) (or ((_ is Undefined!10949) lt!623225) ((_ is Found!10949) lt!623225) (not ((_ is MissingVacant!10949) lt!623225)) (not (= (index!46182 lt!623225) (index!46181 lt!623077))) (and (bvsge (index!46182 lt!623225) #b00000000000000000000000000000000) (bvslt (index!46182 lt!623225) (size!47164 lt!623080)))) (or ((_ is Undefined!10949) lt!623225) (ite ((_ is Found!10949) lt!623225) (= (select (arr!46612 lt!623080) (index!46180 lt!623225)) (select (arr!46612 a!2901) j!112)) (and ((_ is MissingVacant!10949) lt!623225) (= (index!46182 lt!623225) (index!46181 lt!623077)) (= (select (arr!46612 lt!623080) (index!46182 lt!623225)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152135 (= lt!623225 e!800266)))

(declare-fun c!131143 () Bool)

(assert (=> d!152135 (= c!131143 (bvsge (x!127765 lt!623077) #b01111111111111111111111111111110))))

(assert (=> d!152135 (= lt!623224 (select (arr!46612 lt!623080) (index!46181 lt!623077)))))

(assert (=> d!152135 (validMask!0 mask!2840)))

(assert (=> d!152135 (= (seekKeyOrZeroReturnVacant!0 (x!127765 lt!623077) (index!46181 lt!623077) (index!46181 lt!623077) (select (arr!46612 a!2901) j!112) lt!623080 mask!2840) lt!623225)))

(assert (= (and d!152135 c!131143) b!1414037))

(assert (= (and d!152135 (not c!131143)) b!1414039))

(assert (= (and b!1414039 c!131142) b!1414042))

(assert (= (and b!1414039 (not c!131142)) b!1414038))

(assert (= (and b!1414038 c!131144) b!1414041))

(assert (= (and b!1414038 (not c!131144)) b!1414040))

(declare-fun m!1303933 () Bool)

(assert (=> b!1414040 m!1303933))

(assert (=> b!1414040 m!1303933))

(assert (=> b!1414040 m!1303701))

(declare-fun m!1303937 () Bool)

(assert (=> b!1414040 m!1303937))

(declare-fun m!1303939 () Bool)

(assert (=> d!152135 m!1303939))

(declare-fun m!1303941 () Bool)

(assert (=> d!152135 m!1303941))

(declare-fun m!1303943 () Bool)

(assert (=> d!152135 m!1303943))

(assert (=> d!152135 m!1303729))

(assert (=> b!1413792 d!152135))

(declare-fun d!152149 () Bool)

(assert (=> d!152149 (= (validKeyInArray!0 (select (arr!46612 a!2901) i!1037)) (and (not (= (select (arr!46612 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46612 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413801 d!152149))

(declare-fun b!1414083 () Bool)

(declare-fun e!800299 () Bool)

(declare-fun call!67116 () Bool)

(assert (=> b!1414083 (= e!800299 call!67116)))

(declare-fun b!1414084 () Bool)

(assert (=> b!1414084 (= e!800299 call!67116)))

(declare-fun b!1414085 () Bool)

(declare-fun e!800300 () Bool)

(assert (=> b!1414085 (= e!800300 e!800299)))

(declare-fun c!131153 () Bool)

(assert (=> b!1414085 (= c!131153 (validKeyInArray!0 (select (arr!46612 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414086 () Bool)

(declare-fun e!800302 () Bool)

(declare-fun contains!9780 (List!33209 (_ BitVec 64)) Bool)

(assert (=> b!1414086 (= e!800302 (contains!9780 Nil!33206 (select (arr!46612 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67113 () Bool)

(assert (=> bm!67113 (= call!67116 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131153 (Cons!33205 (select (arr!46612 a!2901) #b00000000000000000000000000000000) Nil!33206) Nil!33206)))))

(declare-fun b!1414087 () Bool)

(declare-fun e!800301 () Bool)

(assert (=> b!1414087 (= e!800301 e!800300)))

(declare-fun res!950735 () Bool)

(assert (=> b!1414087 (=> (not res!950735) (not e!800300))))

(assert (=> b!1414087 (= res!950735 (not e!800302))))

(declare-fun res!950733 () Bool)

(assert (=> b!1414087 (=> (not res!950733) (not e!800302))))

(assert (=> b!1414087 (= res!950733 (validKeyInArray!0 (select (arr!46612 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152151 () Bool)

(declare-fun res!950734 () Bool)

(assert (=> d!152151 (=> res!950734 e!800301)))

(assert (=> d!152151 (= res!950734 (bvsge #b00000000000000000000000000000000 (size!47164 a!2901)))))

(assert (=> d!152151 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33206) e!800301)))

(assert (= (and d!152151 (not res!950734)) b!1414087))

(assert (= (and b!1414087 res!950733) b!1414086))

(assert (= (and b!1414087 res!950735) b!1414085))

(assert (= (and b!1414085 c!131153) b!1414084))

(assert (= (and b!1414085 (not c!131153)) b!1414083))

(assert (= (or b!1414084 b!1414083) bm!67113))

(assert (=> b!1414085 m!1303839))

(assert (=> b!1414085 m!1303839))

(assert (=> b!1414085 m!1303847))

(assert (=> b!1414086 m!1303839))

(assert (=> b!1414086 m!1303839))

(declare-fun m!1303953 () Bool)

(assert (=> b!1414086 m!1303953))

(assert (=> bm!67113 m!1303839))

(declare-fun m!1303959 () Bool)

(assert (=> bm!67113 m!1303959))

(assert (=> b!1414087 m!1303839))

(assert (=> b!1414087 m!1303839))

(assert (=> b!1414087 m!1303847))

(assert (=> b!1413796 d!152151))

(check-sat (not b!1414086) (not b!1414085) (not b!1413890) (not d!152093) (not d!152127) (not b!1414087) (not b!1413961) (not bm!67113) (not b!1414040) (not b!1413891) (not b!1413948) (not b!1413874) (not d!152129) (not b!1413974) (not d!152135) (not d!152097) (not bm!67097) (not b!1413952) (not d!152133) (not b!1413951) (not bm!67101) (not d!152115))
(check-sat)
