; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120126 () Bool)

(assert start!120126)

(declare-fun b!1398670 () Bool)

(declare-fun res!937584 () Bool)

(declare-fun e!791821 () Bool)

(assert (=> b!1398670 (=> (not res!937584) (not e!791821))))

(declare-datatypes ((array!95655 0))(
  ( (array!95656 (arr!46181 (Array (_ BitVec 32) (_ BitVec 64))) (size!46731 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95655)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95655 (_ BitVec 32)) Bool)

(assert (=> b!1398670 (= res!937584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398671 () Bool)

(declare-fun res!937591 () Bool)

(assert (=> b!1398671 (=> (not res!937591) (not e!791821))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398671 (= res!937591 (validKeyInArray!0 (select (arr!46181 a!2901) i!1037)))))

(declare-fun b!1398672 () Bool)

(declare-fun res!937585 () Bool)

(assert (=> b!1398672 (=> (not res!937585) (not e!791821))))

(declare-datatypes ((List!32700 0))(
  ( (Nil!32697) (Cons!32696 (h!33938 (_ BitVec 64)) (t!47394 List!32700)) )
))
(declare-fun arrayNoDuplicates!0 (array!95655 (_ BitVec 32) List!32700) Bool)

(assert (=> b!1398672 (= res!937585 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32697))))

(declare-fun res!937589 () Bool)

(assert (=> start!120126 (=> (not res!937589) (not e!791821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120126 (= res!937589 (validMask!0 mask!2840))))

(assert (=> start!120126 e!791821))

(assert (=> start!120126 true))

(declare-fun array_inv!35209 (array!95655) Bool)

(assert (=> start!120126 (array_inv!35209 a!2901)))

(declare-fun b!1398673 () Bool)

(declare-fun res!937590 () Bool)

(assert (=> b!1398673 (=> (not res!937590) (not e!791821))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398673 (= res!937590 (validKeyInArray!0 (select (arr!46181 a!2901) j!112)))))

(declare-fun b!1398674 () Bool)

(declare-fun e!791818 () Bool)

(assert (=> b!1398674 (= e!791821 (not e!791818))))

(declare-fun res!937586 () Bool)

(assert (=> b!1398674 (=> res!937586 e!791818)))

(declare-datatypes ((SeekEntryResult!10498 0))(
  ( (MissingZero!10498 (index!44363 (_ BitVec 32))) (Found!10498 (index!44364 (_ BitVec 32))) (Intermediate!10498 (undefined!11310 Bool) (index!44365 (_ BitVec 32)) (x!126008 (_ BitVec 32))) (Undefined!10498) (MissingVacant!10498 (index!44366 (_ BitVec 32))) )
))
(declare-fun lt!615081 () SeekEntryResult!10498)

(assert (=> b!1398674 (= res!937586 (or (not (is-Intermediate!10498 lt!615081)) (undefined!11310 lt!615081)))))

(declare-fun e!791819 () Bool)

(assert (=> b!1398674 e!791819))

(declare-fun res!937588 () Bool)

(assert (=> b!1398674 (=> (not res!937588) (not e!791819))))

(assert (=> b!1398674 (= res!937588 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47000 0))(
  ( (Unit!47001) )
))
(declare-fun lt!615083 () Unit!47000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47000)

(assert (=> b!1398674 (= lt!615083 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615080 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95655 (_ BitVec 32)) SeekEntryResult!10498)

(assert (=> b!1398674 (= lt!615081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615080 (select (arr!46181 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398674 (= lt!615080 (toIndex!0 (select (arr!46181 a!2901) j!112) mask!2840))))

(declare-fun b!1398675 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95655 (_ BitVec 32)) SeekEntryResult!10498)

(assert (=> b!1398675 (= e!791819 (= (seekEntryOrOpen!0 (select (arr!46181 a!2901) j!112) a!2901 mask!2840) (Found!10498 j!112)))))

(declare-fun b!1398676 () Bool)

(declare-fun e!791822 () Bool)

(declare-fun lt!615084 () SeekEntryResult!10498)

(assert (=> b!1398676 (= e!791822 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt (index!44365 lt!615084) #b00000000000000000000000000000000) (bvsge (index!44365 lt!615084) (bvadd #b00000000000000000000000000000001 mask!2840)) (and (bvsle (x!126008 lt!615084) #b01111111111111111111111111111110) (bvsge (x!126008 lt!615084) #b00000000000000000000000000000000))))))

(assert (=> b!1398676 (and (not (undefined!11310 lt!615084)) (= (index!44365 lt!615084) i!1037) (bvslt (x!126008 lt!615084) (x!126008 lt!615081)) (= (select (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44365 lt!615084)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615079 () Unit!47000)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47000)

(assert (=> b!1398676 (= lt!615079 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615080 (x!126008 lt!615081) (index!44365 lt!615081) (x!126008 lt!615084) (index!44365 lt!615084) (undefined!11310 lt!615084) mask!2840))))

(declare-fun b!1398677 () Bool)

(assert (=> b!1398677 (= e!791818 e!791822)))

(declare-fun res!937583 () Bool)

(assert (=> b!1398677 (=> res!937583 e!791822)))

(assert (=> b!1398677 (= res!937583 (or (= lt!615081 lt!615084) (not (is-Intermediate!10498 lt!615084))))))

(declare-fun lt!615082 () (_ BitVec 64))

(assert (=> b!1398677 (= lt!615084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615082 mask!2840) lt!615082 (array!95656 (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901)) mask!2840))))

(assert (=> b!1398677 (= lt!615082 (select (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398678 () Bool)

(declare-fun res!937587 () Bool)

(assert (=> b!1398678 (=> (not res!937587) (not e!791821))))

(assert (=> b!1398678 (= res!937587 (and (= (size!46731 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46731 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46731 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120126 res!937589) b!1398678))

(assert (= (and b!1398678 res!937587) b!1398671))

(assert (= (and b!1398671 res!937591) b!1398673))

(assert (= (and b!1398673 res!937590) b!1398670))

(assert (= (and b!1398670 res!937584) b!1398672))

(assert (= (and b!1398672 res!937585) b!1398674))

(assert (= (and b!1398674 res!937588) b!1398675))

(assert (= (and b!1398674 (not res!937586)) b!1398677))

(assert (= (and b!1398677 (not res!937583)) b!1398676))

(declare-fun m!1285893 () Bool)

(assert (=> b!1398676 m!1285893))

(declare-fun m!1285895 () Bool)

(assert (=> b!1398676 m!1285895))

(declare-fun m!1285897 () Bool)

(assert (=> b!1398676 m!1285897))

(declare-fun m!1285899 () Bool)

(assert (=> b!1398674 m!1285899))

(declare-fun m!1285901 () Bool)

(assert (=> b!1398674 m!1285901))

(assert (=> b!1398674 m!1285899))

(declare-fun m!1285903 () Bool)

(assert (=> b!1398674 m!1285903))

(assert (=> b!1398674 m!1285899))

(declare-fun m!1285905 () Bool)

(assert (=> b!1398674 m!1285905))

(declare-fun m!1285907 () Bool)

(assert (=> b!1398674 m!1285907))

(declare-fun m!1285909 () Bool)

(assert (=> b!1398671 m!1285909))

(assert (=> b!1398671 m!1285909))

(declare-fun m!1285911 () Bool)

(assert (=> b!1398671 m!1285911))

(declare-fun m!1285913 () Bool)

(assert (=> b!1398677 m!1285913))

(assert (=> b!1398677 m!1285893))

(assert (=> b!1398677 m!1285913))

(declare-fun m!1285915 () Bool)

(assert (=> b!1398677 m!1285915))

(declare-fun m!1285917 () Bool)

(assert (=> b!1398677 m!1285917))

(declare-fun m!1285919 () Bool)

(assert (=> start!120126 m!1285919))

(declare-fun m!1285921 () Bool)

(assert (=> start!120126 m!1285921))

(assert (=> b!1398675 m!1285899))

(assert (=> b!1398675 m!1285899))

(declare-fun m!1285923 () Bool)

(assert (=> b!1398675 m!1285923))

(declare-fun m!1285925 () Bool)

(assert (=> b!1398672 m!1285925))

(assert (=> b!1398673 m!1285899))

(assert (=> b!1398673 m!1285899))

(declare-fun m!1285927 () Bool)

(assert (=> b!1398673 m!1285927))

(declare-fun m!1285929 () Bool)

(assert (=> b!1398670 m!1285929))

(push 1)

(assert (not b!1398671))

(assert (not b!1398677))

(assert (not b!1398670))

(assert (not start!120126))

(assert (not b!1398675))

(assert (not b!1398676))

(assert (not b!1398672))

(assert (not b!1398673))

(assert (not b!1398674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!66865 () Bool)

(declare-fun call!66868 () Bool)

(assert (=> bm!66865 (= call!66868 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1398760 () Bool)

(declare-fun e!791868 () Bool)

(assert (=> b!1398760 (= e!791868 call!66868)))

(declare-fun b!1398761 () Bool)

(declare-fun e!791870 () Bool)

(declare-fun e!791869 () Bool)

(assert (=> b!1398761 (= e!791870 e!791869)))

(declare-fun c!130011 () Bool)

(assert (=> b!1398761 (= c!130011 (validKeyInArray!0 (select (arr!46181 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1398762 () Bool)

(assert (=> b!1398762 (= e!791869 call!66868)))

(declare-fun d!150947 () Bool)

(declare-fun res!937650 () Bool)

(assert (=> d!150947 (=> res!937650 e!791870)))

(assert (=> d!150947 (= res!937650 (bvsge #b00000000000000000000000000000000 (size!46731 a!2901)))))

(assert (=> d!150947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!791870)))

(declare-fun b!1398759 () Bool)

(assert (=> b!1398759 (= e!791869 e!791868)))

(declare-fun lt!615138 () (_ BitVec 64))

(assert (=> b!1398759 (= lt!615138 (select (arr!46181 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!615136 () Unit!47000)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95655 (_ BitVec 64) (_ BitVec 32)) Unit!47000)

(assert (=> b!1398759 (= lt!615136 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615138 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1398759 (arrayContainsKey!0 a!2901 lt!615138 #b00000000000000000000000000000000)))

(declare-fun lt!615137 () Unit!47000)

(assert (=> b!1398759 (= lt!615137 lt!615136)))

(declare-fun res!937651 () Bool)

(assert (=> b!1398759 (= res!937651 (= (seekEntryOrOpen!0 (select (arr!46181 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10498 #b00000000000000000000000000000000)))))

(assert (=> b!1398759 (=> (not res!937651) (not e!791868))))

(assert (= (and d!150947 (not res!937650)) b!1398761))

(assert (= (and b!1398761 c!130011) b!1398759))

(assert (= (and b!1398761 (not c!130011)) b!1398762))

(assert (= (and b!1398759 res!937651) b!1398760))

(assert (= (or b!1398760 b!1398762) bm!66865))

(declare-fun m!1286019 () Bool)

(assert (=> bm!66865 m!1286019))

(declare-fun m!1286021 () Bool)

(assert (=> b!1398761 m!1286021))

(assert (=> b!1398761 m!1286021))

(declare-fun m!1286023 () Bool)

(assert (=> b!1398761 m!1286023))

(assert (=> b!1398759 m!1286021))

(declare-fun m!1286025 () Bool)

(assert (=> b!1398759 m!1286025))

(declare-fun m!1286027 () Bool)

(assert (=> b!1398759 m!1286027))

(assert (=> b!1398759 m!1286021))

(declare-fun m!1286029 () Bool)

(assert (=> b!1398759 m!1286029))

(assert (=> b!1398670 d!150947))

(declare-fun b!1398802 () Bool)

(declare-fun e!791894 () SeekEntryResult!10498)

(declare-fun lt!615153 () SeekEntryResult!10498)

(assert (=> b!1398802 (= e!791894 (Found!10498 (index!44365 lt!615153)))))

(declare-fun e!791893 () SeekEntryResult!10498)

(declare-fun b!1398803 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95655 (_ BitVec 32)) SeekEntryResult!10498)

(assert (=> b!1398803 (= e!791893 (seekKeyOrZeroReturnVacant!0 (x!126008 lt!615153) (index!44365 lt!615153) (index!44365 lt!615153) (select (arr!46181 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!150951 () Bool)

(declare-fun lt!615151 () SeekEntryResult!10498)

(assert (=> d!150951 (and (or (is-Undefined!10498 lt!615151) (not (is-Found!10498 lt!615151)) (and (bvsge (index!44364 lt!615151) #b00000000000000000000000000000000) (bvslt (index!44364 lt!615151) (size!46731 a!2901)))) (or (is-Undefined!10498 lt!615151) (is-Found!10498 lt!615151) (not (is-MissingZero!10498 lt!615151)) (and (bvsge (index!44363 lt!615151) #b00000000000000000000000000000000) (bvslt (index!44363 lt!615151) (size!46731 a!2901)))) (or (is-Undefined!10498 lt!615151) (is-Found!10498 lt!615151) (is-MissingZero!10498 lt!615151) (not (is-MissingVacant!10498 lt!615151)) (and (bvsge (index!44366 lt!615151) #b00000000000000000000000000000000) (bvslt (index!44366 lt!615151) (size!46731 a!2901)))) (or (is-Undefined!10498 lt!615151) (ite (is-Found!10498 lt!615151) (= (select (arr!46181 a!2901) (index!44364 lt!615151)) (select (arr!46181 a!2901) j!112)) (ite (is-MissingZero!10498 lt!615151) (= (select (arr!46181 a!2901) (index!44363 lt!615151)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10498 lt!615151) (= (select (arr!46181 a!2901) (index!44366 lt!615151)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!791892 () SeekEntryResult!10498)

(assert (=> d!150951 (= lt!615151 e!791892)))

(declare-fun c!130028 () Bool)

(assert (=> d!150951 (= c!130028 (and (is-Intermediate!10498 lt!615153) (undefined!11310 lt!615153)))))

(assert (=> d!150951 (= lt!615153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46181 a!2901) j!112) mask!2840) (select (arr!46181 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150951 (validMask!0 mask!2840)))

(assert (=> d!150951 (= (seekEntryOrOpen!0 (select (arr!46181 a!2901) j!112) a!2901 mask!2840) lt!615151)))

(declare-fun b!1398804 () Bool)

(declare-fun c!130027 () Bool)

(declare-fun lt!615152 () (_ BitVec 64))

(assert (=> b!1398804 (= c!130027 (= lt!615152 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1398804 (= e!791894 e!791893)))

(declare-fun b!1398805 () Bool)

(assert (=> b!1398805 (= e!791892 e!791894)))

(assert (=> b!1398805 (= lt!615152 (select (arr!46181 a!2901) (index!44365 lt!615153)))))

(declare-fun c!130029 () Bool)

(assert (=> b!1398805 (= c!130029 (= lt!615152 (select (arr!46181 a!2901) j!112)))))

(declare-fun b!1398806 () Bool)

(assert (=> b!1398806 (= e!791893 (MissingZero!10498 (index!44365 lt!615153)))))

(declare-fun b!1398807 () Bool)

(assert (=> b!1398807 (= e!791892 Undefined!10498)))

(assert (= (and d!150951 c!130028) b!1398807))

(assert (= (and d!150951 (not c!130028)) b!1398805))

(assert (= (and b!1398805 c!130029) b!1398802))

(assert (= (and b!1398805 (not c!130029)) b!1398804))

(assert (= (and b!1398804 c!130027) b!1398806))

(assert (= (and b!1398804 (not c!130027)) b!1398803))

(assert (=> b!1398803 m!1285899))

(declare-fun m!1286039 () Bool)

(assert (=> b!1398803 m!1286039))

(assert (=> d!150951 m!1285899))

(assert (=> d!150951 m!1285903))

(declare-fun m!1286041 () Bool)

(assert (=> d!150951 m!1286041))

(assert (=> d!150951 m!1285903))

(assert (=> d!150951 m!1285899))

(declare-fun m!1286043 () Bool)

(assert (=> d!150951 m!1286043))

(assert (=> d!150951 m!1285919))

(declare-fun m!1286045 () Bool)

(assert (=> d!150951 m!1286045))

(declare-fun m!1286047 () Bool)

(assert (=> d!150951 m!1286047))

(declare-fun m!1286049 () Bool)

(assert (=> b!1398805 m!1286049))

(assert (=> b!1398675 d!150951))

(declare-fun d!150963 () Bool)

(assert (=> d!150963 (and (not (undefined!11310 lt!615084)) (= (index!44365 lt!615084) i!1037) (bvslt (x!126008 lt!615084) (x!126008 lt!615081)))))

(declare-fun lt!615164 () Unit!47000)

(declare-fun choose!62 (array!95655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47000)

(assert (=> d!150963 (= lt!615164 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615080 (x!126008 lt!615081) (index!44365 lt!615081) (x!126008 lt!615084) (index!44365 lt!615084) (undefined!11310 lt!615084) mask!2840))))

(assert (=> d!150963 (validMask!0 mask!2840)))

(assert (=> d!150963 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615080 (x!126008 lt!615081) (index!44365 lt!615081) (x!126008 lt!615084) (index!44365 lt!615084) (undefined!11310 lt!615084) mask!2840) lt!615164)))

(declare-fun bs!40721 () Bool)

(assert (= bs!40721 d!150963))

(declare-fun m!1286051 () Bool)

(assert (=> bs!40721 m!1286051))

(assert (=> bs!40721 m!1285919))

(assert (=> b!1398676 d!150963))

(declare-fun d!150967 () Bool)

(assert (=> d!150967 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120126 d!150967))

(declare-fun d!150973 () Bool)

(assert (=> d!150973 (= (array_inv!35209 a!2901) (bvsge (size!46731 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120126 d!150973))

(declare-fun d!150975 () Bool)

(assert (=> d!150975 (= (validKeyInArray!0 (select (arr!46181 a!2901) i!1037)) (and (not (= (select (arr!46181 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46181 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1398671 d!150975))

(declare-fun b!1398854 () Bool)

(declare-fun e!791926 () Bool)

(declare-fun e!791927 () Bool)

(assert (=> b!1398854 (= e!791926 e!791927)))

(declare-fun c!130045 () Bool)

(assert (=> b!1398854 (= c!130045 (validKeyInArray!0 (select (arr!46181 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150981 () Bool)

(declare-fun res!937679 () Bool)

(declare-fun e!791928 () Bool)

(assert (=> d!150981 (=> res!937679 e!791928)))

(assert (=> d!150981 (= res!937679 (bvsge #b00000000000000000000000000000000 (size!46731 a!2901)))))

(assert (=> d!150981 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32697) e!791928)))

(declare-fun b!1398855 () Bool)

(assert (=> b!1398855 (= e!791928 e!791926)))

(declare-fun res!937680 () Bool)

(assert (=> b!1398855 (=> (not res!937680) (not e!791926))))

(declare-fun e!791929 () Bool)

(assert (=> b!1398855 (= res!937680 (not e!791929))))

(declare-fun res!937678 () Bool)

(assert (=> b!1398855 (=> (not res!937678) (not e!791929))))

(assert (=> b!1398855 (= res!937678 (validKeyInArray!0 (select (arr!46181 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66870 () Bool)

(declare-fun call!66875 () Bool)

(assert (=> bm!66870 (= call!66875 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130045 (Cons!32696 (select (arr!46181 a!2901) #b00000000000000000000000000000000) Nil!32697) Nil!32697)))))

(declare-fun b!1398856 () Bool)

(assert (=> b!1398856 (= e!791927 call!66875)))

(declare-fun b!1398857 () Bool)

(declare-fun contains!9784 (List!32700 (_ BitVec 64)) Bool)

(assert (=> b!1398857 (= e!791929 (contains!9784 Nil!32697 (select (arr!46181 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1398858 () Bool)

(assert (=> b!1398858 (= e!791927 call!66875)))

(assert (= (and d!150981 (not res!937679)) b!1398855))

(assert (= (and b!1398855 res!937678) b!1398857))

(assert (= (and b!1398855 res!937680) b!1398854))

(assert (= (and b!1398854 c!130045) b!1398856))

(assert (= (and b!1398854 (not c!130045)) b!1398858))

(assert (= (or b!1398856 b!1398858) bm!66870))

(assert (=> b!1398854 m!1286021))

(assert (=> b!1398854 m!1286021))

(assert (=> b!1398854 m!1286023))

(assert (=> b!1398855 m!1286021))

(assert (=> b!1398855 m!1286021))

(assert (=> b!1398855 m!1286023))

(assert (=> bm!66870 m!1286021))

(declare-fun m!1286067 () Bool)

(assert (=> bm!66870 m!1286067))

(assert (=> b!1398857 m!1286021))

(assert (=> b!1398857 m!1286021))

(declare-fun m!1286069 () Bool)

(assert (=> b!1398857 m!1286069))

(assert (=> b!1398672 d!150981))

(declare-fun b!1398926 () Bool)

(declare-fun e!791979 () SeekEntryResult!10498)

(assert (=> b!1398926 (= e!791979 (Intermediate!10498 true (toIndex!0 lt!615082 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1398927 () Bool)

(declare-fun e!791976 () Bool)

(declare-fun e!791977 () Bool)

(assert (=> b!1398927 (= e!791976 e!791977)))

(declare-fun res!937712 () Bool)

(declare-fun lt!615214 () SeekEntryResult!10498)

(assert (=> b!1398927 (= res!937712 (and (is-Intermediate!10498 lt!615214) (not (undefined!11310 lt!615214)) (bvslt (x!126008 lt!615214) #b01111111111111111111111111111110) (bvsge (x!126008 lt!615214) #b00000000000000000000000000000000) (bvsge (x!126008 lt!615214) #b00000000000000000000000000000000)))))

(assert (=> b!1398927 (=> (not res!937712) (not e!791977))))

(declare-fun b!1398928 () Bool)

(declare-fun e!791980 () SeekEntryResult!10498)

(assert (=> b!1398928 (= e!791979 e!791980)))

(declare-fun c!130066 () Bool)

(declare-fun lt!615213 () (_ BitVec 64))

(assert (=> b!1398928 (= c!130066 (or (= lt!615213 lt!615082) (= (bvadd lt!615213 lt!615213) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1398929 () Bool)

(assert (=> b!1398929 (= e!791976 (bvsge (x!126008 lt!615214) #b01111111111111111111111111111110))))

(declare-fun b!1398930 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398930 (= e!791980 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!615082 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!615082 (array!95656 (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901)) mask!2840))))

(declare-fun b!1398932 () Bool)

(assert (=> b!1398932 (and (bvsge (index!44365 lt!615214) #b00000000000000000000000000000000) (bvslt (index!44365 lt!615214) (size!46731 (array!95656 (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901)))))))

(declare-fun res!937713 () Bool)

(assert (=> b!1398932 (= res!937713 (= (select (arr!46181 (array!95656 (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901))) (index!44365 lt!615214)) lt!615082))))

(declare-fun e!791978 () Bool)

(assert (=> b!1398932 (=> res!937713 e!791978)))

(assert (=> b!1398932 (= e!791977 e!791978)))

(declare-fun b!1398933 () Bool)

(assert (=> b!1398933 (and (bvsge (index!44365 lt!615214) #b00000000000000000000000000000000) (bvslt (index!44365 lt!615214) (size!46731 (array!95656 (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901)))))))

(declare-fun res!937714 () Bool)

(assert (=> b!1398933 (= res!937714 (= (select (arr!46181 (array!95656 (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901))) (index!44365 lt!615214)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1398933 (=> res!937714 e!791978)))

(declare-fun b!1398934 () Bool)

(assert (=> b!1398934 (= e!791980 (Intermediate!10498 false (toIndex!0 lt!615082 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1398931 () Bool)

(assert (=> b!1398931 (and (bvsge (index!44365 lt!615214) #b00000000000000000000000000000000) (bvslt (index!44365 lt!615214) (size!46731 (array!95656 (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901)))))))

(assert (=> b!1398931 (= e!791978 (= (select (arr!46181 (array!95656 (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901))) (index!44365 lt!615214)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!150985 () Bool)

(assert (=> d!150985 e!791976))

(declare-fun c!130065 () Bool)

(assert (=> d!150985 (= c!130065 (and (is-Intermediate!10498 lt!615214) (undefined!11310 lt!615214)))))

(assert (=> d!150985 (= lt!615214 e!791979)))

(declare-fun c!130064 () Bool)

(assert (=> d!150985 (= c!130064 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150985 (= lt!615213 (select (arr!46181 (array!95656 (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901))) (toIndex!0 lt!615082 mask!2840)))))

(assert (=> d!150985 (validMask!0 mask!2840)))

(assert (=> d!150985 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615082 mask!2840) lt!615082 (array!95656 (store (arr!46181 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46731 a!2901)) mask!2840) lt!615214)))

(assert (= (and d!150985 c!130064) b!1398926))

(assert (= (and d!150985 (not c!130064)) b!1398928))

(assert (= (and b!1398928 c!130066) b!1398934))

(assert (= (and b!1398928 (not c!130066)) b!1398930))

(assert (= (and d!150985 c!130065) b!1398929))

(assert (= (and d!150985 (not c!130065)) b!1398927))

(assert (= (and b!1398927 res!937712) b!1398932))

(assert (= (and b!1398932 (not res!937713)) b!1398933))

(assert (= (and b!1398933 (not res!937714)) b!1398931))

(declare-fun m!1286121 () Bool)

(assert (=> b!1398931 m!1286121))

(assert (=> d!150985 m!1285913))

(declare-fun m!1286123 () Bool)

(assert (=> d!150985 m!1286123))

(assert (=> d!150985 m!1285919))

(assert (=> b!1398930 m!1285913))

(declare-fun m!1286125 () Bool)

(assert (=> b!1398930 m!1286125))

(assert (=> b!1398930 m!1286125))

(declare-fun m!1286127 () Bool)

(assert (=> b!1398930 m!1286127))

(assert (=> b!1398932 m!1286121))

(assert (=> b!1398933 m!1286121))

(assert (=> b!1398677 d!150985))

(declare-fun d!151005 () Bool)

(declare-fun lt!615220 () (_ BitVec 32))

(declare-fun lt!615219 () (_ BitVec 32))

(assert (=> d!151005 (= lt!615220 (bvmul (bvxor lt!615219 (bvlshr lt!615219 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151005 (= lt!615219 ((_ extract 31 0) (bvand (bvxor lt!615082 (bvlshr lt!615082 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151005 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!937715 (let ((h!33942 ((_ extract 31 0) (bvand (bvxor lt!615082 (bvlshr lt!615082 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126017 (bvmul (bvxor h!33942 (bvlshr h!33942 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126017 (bvlshr x!126017 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!937715 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!937715 #b00000000000000000000000000000000))))))

(assert (=> d!151005 (= (toIndex!0 lt!615082 mask!2840) (bvand (bvxor lt!615220 (bvlshr lt!615220 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1398677 d!151005))

(declare-fun d!151007 () Bool)

(assert (=> d!151007 (= (validKeyInArray!0 (select (arr!46181 a!2901) j!112)) (and (not (= (select (arr!46181 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46181 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1398673 d!151007))

(declare-fun call!66885 () Bool)

(declare-fun bm!66882 () Bool)

(assert (=> bm!66882 (= call!66885 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1398936 () Bool)

(declare-fun e!791981 () Bool)

(assert (=> b!1398936 (= e!791981 call!66885)))

(declare-fun b!1398937 () Bool)

(declare-fun e!791983 () Bool)

(declare-fun e!791982 () Bool)

(assert (=> b!1398937 (= e!791983 e!791982)))

(declare-fun c!130067 () Bool)

(assert (=> b!1398937 (= c!130067 (validKeyInArray!0 (select (arr!46181 a!2901) j!112)))))

(declare-fun b!1398938 () Bool)

(assert (=> b!1398938 (= e!791982 call!66885)))

(declare-fun d!151009 () Bool)

(declare-fun res!937716 () Bool)

(assert (=> d!151009 (=> res!937716 e!791983)))

(assert (=> d!151009 (= res!937716 (bvsge j!112 (size!46731 a!2901)))))

(assert (=> d!151009 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!791983)))

(declare-fun b!1398935 () Bool)

(assert (=> b!1398935 (= e!791982 e!791981)))

(declare-fun lt!615223 () (_ BitVec 64))

(assert (=> b!1398935 (= lt!615223 (select (arr!46181 a!2901) j!112))))

(declare-fun lt!615221 () Unit!47000)

(assert (=> b!1398935 (= lt!615221 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615223 j!112))))

(assert (=> b!1398935 (arrayContainsKey!0 a!2901 lt!615223 #b00000000000000000000000000000000)))

(declare-fun lt!615222 () Unit!47000)

(assert (=> b!1398935 (= lt!615222 lt!615221)))

(declare-fun res!937717 () Bool)

(assert (=> b!1398935 (= res!937717 (= (seekEntryOrOpen!0 (select (arr!46181 a!2901) j!112) a!2901 mask!2840) (Found!10498 j!112)))))

(assert (=> b!1398935 (=> (not res!937717) (not e!791981))))

(assert (= (and d!151009 (not res!937716)) b!1398937))

(assert (= (and b!1398937 c!130067) b!1398935))

(assert (= (and b!1398937 (not c!130067)) b!1398938))

(assert (= (and b!1398935 res!937717) b!1398936))

(assert (= (or b!1398936 b!1398938) bm!66882))

(declare-fun m!1286129 () Bool)

(assert (=> bm!66882 m!1286129))

(assert (=> b!1398937 m!1285899))

(assert (=> b!1398937 m!1285899))

(assert (=> b!1398937 m!1285927))

(assert (=> b!1398935 m!1285899))

(declare-fun m!1286131 () Bool)

(assert (=> b!1398935 m!1286131))

(declare-fun m!1286133 () Bool)

(assert (=> b!1398935 m!1286133))

(assert (=> b!1398935 m!1285899))

(assert (=> b!1398935 m!1285923))

(assert (=> b!1398674 d!151009))

(declare-fun d!151011 () Bool)

(assert (=> d!151011 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!615226 () Unit!47000)

(declare-fun choose!38 (array!95655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47000)

(assert (=> d!151011 (= lt!615226 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151011 (validMask!0 mask!2840)))

(assert (=> d!151011 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!615226)))

(declare-fun bs!40726 () Bool)

(assert (= bs!40726 d!151011))

(assert (=> bs!40726 m!1285907))

(declare-fun m!1286135 () Bool)

(assert (=> bs!40726 m!1286135))

(assert (=> bs!40726 m!1285919))

(assert (=> b!1398674 d!151011))

(declare-fun b!1398939 () Bool)

(declare-fun e!791987 () SeekEntryResult!10498)

(assert (=> b!1398939 (= e!791987 (Intermediate!10498 true lt!615080 #b00000000000000000000000000000000))))

(declare-fun b!1398940 () Bool)

(declare-fun e!791984 () Bool)

(declare-fun e!791985 () Bool)

(assert (=> b!1398940 (= e!791984 e!791985)))

(declare-fun res!937718 () Bool)

(declare-fun lt!615228 () SeekEntryResult!10498)

(assert (=> b!1398940 (= res!937718 (and (is-Intermediate!10498 lt!615228) (not (undefined!11310 lt!615228)) (bvslt (x!126008 lt!615228) #b01111111111111111111111111111110) (bvsge (x!126008 lt!615228) #b00000000000000000000000000000000) (bvsge (x!126008 lt!615228) #b00000000000000000000000000000000)))))

(assert (=> b!1398940 (=> (not res!937718) (not e!791985))))

(declare-fun b!1398941 () Bool)

(declare-fun e!791988 () SeekEntryResult!10498)

(assert (=> b!1398941 (= e!791987 e!791988)))

(declare-fun lt!615227 () (_ BitVec 64))

(declare-fun c!130070 () Bool)

(assert (=> b!1398941 (= c!130070 (or (= lt!615227 (select (arr!46181 a!2901) j!112)) (= (bvadd lt!615227 lt!615227) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1398942 () Bool)

(assert (=> b!1398942 (= e!791984 (bvsge (x!126008 lt!615228) #b01111111111111111111111111111110))))

(declare-fun b!1398943 () Bool)

(assert (=> b!1398943 (= e!791988 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!615080 #b00000000000000000000000000000000 mask!2840) (select (arr!46181 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1398945 () Bool)

(assert (=> b!1398945 (and (bvsge (index!44365 lt!615228) #b00000000000000000000000000000000) (bvslt (index!44365 lt!615228) (size!46731 a!2901)))))

(declare-fun res!937719 () Bool)

(assert (=> b!1398945 (= res!937719 (= (select (arr!46181 a!2901) (index!44365 lt!615228)) (select (arr!46181 a!2901) j!112)))))

(declare-fun e!791986 () Bool)

(assert (=> b!1398945 (=> res!937719 e!791986)))

(assert (=> b!1398945 (= e!791985 e!791986)))

(declare-fun b!1398946 () Bool)

(assert (=> b!1398946 (and (bvsge (index!44365 lt!615228) #b00000000000000000000000000000000) (bvslt (index!44365 lt!615228) (size!46731 a!2901)))))

(declare-fun res!937720 () Bool)

(assert (=> b!1398946 (= res!937720 (= (select (arr!46181 a!2901) (index!44365 lt!615228)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1398946 (=> res!937720 e!791986)))

(declare-fun b!1398947 () Bool)

(assert (=> b!1398947 (= e!791988 (Intermediate!10498 false lt!615080 #b00000000000000000000000000000000))))

(declare-fun b!1398944 () Bool)

(assert (=> b!1398944 (and (bvsge (index!44365 lt!615228) #b00000000000000000000000000000000) (bvslt (index!44365 lt!615228) (size!46731 a!2901)))))

(assert (=> b!1398944 (= e!791986 (= (select (arr!46181 a!2901) (index!44365 lt!615228)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151013 () Bool)

(assert (=> d!151013 e!791984))

(declare-fun c!130069 () Bool)

(assert (=> d!151013 (= c!130069 (and (is-Intermediate!10498 lt!615228) (undefined!11310 lt!615228)))))

(assert (=> d!151013 (= lt!615228 e!791987)))

(declare-fun c!130068 () Bool)

(assert (=> d!151013 (= c!130068 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151013 (= lt!615227 (select (arr!46181 a!2901) lt!615080))))

(assert (=> d!151013 (validMask!0 mask!2840)))

(assert (=> d!151013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615080 (select (arr!46181 a!2901) j!112) a!2901 mask!2840) lt!615228)))

(assert (= (and d!151013 c!130068) b!1398939))

(assert (= (and d!151013 (not c!130068)) b!1398941))

(assert (= (and b!1398941 c!130070) b!1398947))

(assert (= (and b!1398941 (not c!130070)) b!1398943))

(assert (= (and d!151013 c!130069) b!1398942))

(assert (= (and d!151013 (not c!130069)) b!1398940))

(assert (= (and b!1398940 res!937718) b!1398945))

(assert (= (and b!1398945 (not res!937719)) b!1398946))

(assert (= (and b!1398946 (not res!937720)) b!1398944))

(declare-fun m!1286137 () Bool)

(assert (=> b!1398944 m!1286137))

(declare-fun m!1286139 () Bool)

(assert (=> d!151013 m!1286139))

(assert (=> d!151013 m!1285919))

(declare-fun m!1286141 () Bool)

(assert (=> b!1398943 m!1286141))

(assert (=> b!1398943 m!1286141))

(assert (=> b!1398943 m!1285899))

(declare-fun m!1286143 () Bool)

(assert (=> b!1398943 m!1286143))

(assert (=> b!1398945 m!1286137))

(assert (=> b!1398946 m!1286137))

(assert (=> b!1398674 d!151013))

(declare-fun d!151015 () Bool)

(declare-fun lt!615230 () (_ BitVec 32))

(declare-fun lt!615229 () (_ BitVec 32))

(assert (=> d!151015 (= lt!615230 (bvmul (bvxor lt!615229 (bvlshr lt!615229 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151015 (= lt!615229 ((_ extract 31 0) (bvand (bvxor (select (arr!46181 a!2901) j!112) (bvlshr (select (arr!46181 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151015 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!937715 (let ((h!33942 ((_ extract 31 0) (bvand (bvxor (select (arr!46181 a!2901) j!112) (bvlshr (select (arr!46181 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126017 (bvmul (bvxor h!33942 (bvlshr h!33942 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126017 (bvlshr x!126017 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!937715 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!937715 #b00000000000000000000000000000000))))))

(assert (=> d!151015 (= (toIndex!0 (select (arr!46181 a!2901) j!112) mask!2840) (bvand (bvxor lt!615230 (bvlshr lt!615230 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1398674 d!151015))

(push 1)

