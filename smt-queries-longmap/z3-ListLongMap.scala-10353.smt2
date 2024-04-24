; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121988 () Bool)

(assert start!121988)

(declare-fun b!1415430 () Bool)

(declare-fun e!801152 () Bool)

(declare-fun e!801149 () Bool)

(assert (=> b!1415430 (= e!801152 (not e!801149))))

(declare-fun res!951263 () Bool)

(assert (=> b!1415430 (=> res!951263 e!801149)))

(declare-datatypes ((SeekEntryResult!10907 0))(
  ( (MissingZero!10907 (index!46014 (_ BitVec 32))) (Found!10907 (index!46015 (_ BitVec 32))) (Intermediate!10907 (undefined!11719 Bool) (index!46016 (_ BitVec 32)) (x!127765 (_ BitVec 32))) (Undefined!10907) (MissingVacant!10907 (index!46017 (_ BitVec 32))) )
))
(declare-fun lt!623883 () SeekEntryResult!10907)

(get-info :version)

(assert (=> b!1415430 (= res!951263 (or (not ((_ is Intermediate!10907) lt!623883)) (undefined!11719 lt!623883)))))

(declare-fun e!801147 () Bool)

(assert (=> b!1415430 e!801147))

(declare-fun res!951264 () Bool)

(assert (=> b!1415430 (=> (not res!951264) (not e!801147))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96722 0))(
  ( (array!96723 (arr!46693 (Array (_ BitVec 32) (_ BitVec 64))) (size!47244 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96722)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96722 (_ BitVec 32)) Bool)

(assert (=> b!1415430 (= res!951264 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47815 0))(
  ( (Unit!47816) )
))
(declare-fun lt!623888 () Unit!47815)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47815)

(assert (=> b!1415430 (= lt!623888 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623882 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96722 (_ BitVec 32)) SeekEntryResult!10907)

(assert (=> b!1415430 (= lt!623883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623882 (select (arr!46693 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415430 (= lt!623882 (toIndex!0 (select (arr!46693 a!2901) j!112) mask!2840))))

(declare-fun b!1415431 () Bool)

(declare-fun res!951269 () Bool)

(assert (=> b!1415431 (=> (not res!951269) (not e!801152))))

(assert (=> b!1415431 (= res!951269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415432 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96722 (_ BitVec 32)) SeekEntryResult!10907)

(assert (=> b!1415432 (= e!801147 (= (seekEntryOrOpen!0 (select (arr!46693 a!2901) j!112) a!2901 mask!2840) (Found!10907 j!112)))))

(declare-fun b!1415433 () Bool)

(declare-fun e!801151 () Bool)

(assert (=> b!1415433 (= e!801149 e!801151)))

(declare-fun res!951267 () Bool)

(assert (=> b!1415433 (=> res!951267 e!801151)))

(declare-fun lt!623886 () SeekEntryResult!10907)

(assert (=> b!1415433 (= res!951267 (or (= lt!623883 lt!623886) (not ((_ is Intermediate!10907) lt!623886))))))

(declare-fun lt!623884 () (_ BitVec 64))

(declare-fun lt!623887 () array!96722)

(assert (=> b!1415433 (= lt!623886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623884 mask!2840) lt!623884 lt!623887 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415433 (= lt!623884 (select (store (arr!46693 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415433 (= lt!623887 (array!96723 (store (arr!46693 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47244 a!2901)))))

(declare-fun res!951265 () Bool)

(assert (=> start!121988 (=> (not res!951265) (not e!801152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121988 (= res!951265 (validMask!0 mask!2840))))

(assert (=> start!121988 e!801152))

(assert (=> start!121988 true))

(declare-fun array_inv!35974 (array!96722) Bool)

(assert (=> start!121988 (array_inv!35974 a!2901)))

(declare-fun b!1415434 () Bool)

(declare-fun res!951268 () Bool)

(assert (=> b!1415434 (=> (not res!951268) (not e!801152))))

(declare-datatypes ((List!33199 0))(
  ( (Nil!33196) (Cons!33195 (h!34484 (_ BitVec 64)) (t!47885 List!33199)) )
))
(declare-fun arrayNoDuplicates!0 (array!96722 (_ BitVec 32) List!33199) Bool)

(assert (=> b!1415434 (= res!951268 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33196))))

(declare-fun b!1415435 () Bool)

(declare-fun res!951262 () Bool)

(assert (=> b!1415435 (=> (not res!951262) (not e!801152))))

(assert (=> b!1415435 (= res!951262 (and (= (size!47244 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47244 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47244 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415436 () Bool)

(assert (=> b!1415436 (= e!801151 (or (bvslt (x!127765 lt!623883) #b00000000000000000000000000000000) (bvsgt (x!127765 lt!623883) #b01111111111111111111111111111110) (bvslt (x!127765 lt!623886) #b00000000000000000000000000000000) (bvsgt (x!127765 lt!623886) #b01111111111111111111111111111110) (and (bvsge lt!623882 #b00000000000000000000000000000000) (bvslt lt!623882 (size!47244 a!2901)))))))

(declare-fun e!801148 () Bool)

(assert (=> b!1415436 e!801148))

(declare-fun res!951270 () Bool)

(assert (=> b!1415436 (=> (not res!951270) (not e!801148))))

(assert (=> b!1415436 (= res!951270 (and (not (undefined!11719 lt!623886)) (= (index!46016 lt!623886) i!1037) (bvslt (x!127765 lt!623886) (x!127765 lt!623883)) (= (select (store (arr!46693 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46016 lt!623886)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623885 () Unit!47815)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47815)

(assert (=> b!1415436 (= lt!623885 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623882 (x!127765 lt!623883) (index!46016 lt!623883) (x!127765 lt!623886) (index!46016 lt!623886) (undefined!11719 lt!623886) mask!2840))))

(declare-fun b!1415437 () Bool)

(declare-fun res!951271 () Bool)

(assert (=> b!1415437 (=> (not res!951271) (not e!801152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415437 (= res!951271 (validKeyInArray!0 (select (arr!46693 a!2901) i!1037)))))

(declare-fun b!1415438 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96722 (_ BitVec 32)) SeekEntryResult!10907)

(assert (=> b!1415438 (= e!801148 (= (seekEntryOrOpen!0 lt!623884 lt!623887 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127765 lt!623886) (index!46016 lt!623886) (index!46016 lt!623886) (select (arr!46693 a!2901) j!112) lt!623887 mask!2840)))))

(declare-fun b!1415439 () Bool)

(declare-fun res!951266 () Bool)

(assert (=> b!1415439 (=> (not res!951266) (not e!801152))))

(assert (=> b!1415439 (= res!951266 (validKeyInArray!0 (select (arr!46693 a!2901) j!112)))))

(assert (= (and start!121988 res!951265) b!1415435))

(assert (= (and b!1415435 res!951262) b!1415437))

(assert (= (and b!1415437 res!951271) b!1415439))

(assert (= (and b!1415439 res!951266) b!1415431))

(assert (= (and b!1415431 res!951269) b!1415434))

(assert (= (and b!1415434 res!951268) b!1415430))

(assert (= (and b!1415430 res!951264) b!1415432))

(assert (= (and b!1415430 (not res!951263)) b!1415433))

(assert (= (and b!1415433 (not res!951267)) b!1415436))

(assert (= (and b!1415436 res!951270) b!1415438))

(declare-fun m!1305955 () Bool)

(assert (=> b!1415431 m!1305955))

(declare-fun m!1305957 () Bool)

(assert (=> start!121988 m!1305957))

(declare-fun m!1305959 () Bool)

(assert (=> start!121988 m!1305959))

(declare-fun m!1305961 () Bool)

(assert (=> b!1415438 m!1305961))

(declare-fun m!1305963 () Bool)

(assert (=> b!1415438 m!1305963))

(assert (=> b!1415438 m!1305963))

(declare-fun m!1305965 () Bool)

(assert (=> b!1415438 m!1305965))

(declare-fun m!1305967 () Bool)

(assert (=> b!1415433 m!1305967))

(assert (=> b!1415433 m!1305967))

(declare-fun m!1305969 () Bool)

(assert (=> b!1415433 m!1305969))

(declare-fun m!1305971 () Bool)

(assert (=> b!1415433 m!1305971))

(declare-fun m!1305973 () Bool)

(assert (=> b!1415433 m!1305973))

(assert (=> b!1415432 m!1305963))

(assert (=> b!1415432 m!1305963))

(declare-fun m!1305975 () Bool)

(assert (=> b!1415432 m!1305975))

(declare-fun m!1305977 () Bool)

(assert (=> b!1415434 m!1305977))

(assert (=> b!1415430 m!1305963))

(declare-fun m!1305979 () Bool)

(assert (=> b!1415430 m!1305979))

(assert (=> b!1415430 m!1305963))

(assert (=> b!1415430 m!1305963))

(declare-fun m!1305981 () Bool)

(assert (=> b!1415430 m!1305981))

(declare-fun m!1305983 () Bool)

(assert (=> b!1415430 m!1305983))

(declare-fun m!1305985 () Bool)

(assert (=> b!1415430 m!1305985))

(declare-fun m!1305987 () Bool)

(assert (=> b!1415437 m!1305987))

(assert (=> b!1415437 m!1305987))

(declare-fun m!1305989 () Bool)

(assert (=> b!1415437 m!1305989))

(assert (=> b!1415439 m!1305963))

(assert (=> b!1415439 m!1305963))

(declare-fun m!1305991 () Bool)

(assert (=> b!1415439 m!1305991))

(assert (=> b!1415436 m!1305971))

(declare-fun m!1305993 () Bool)

(assert (=> b!1415436 m!1305993))

(declare-fun m!1305995 () Bool)

(assert (=> b!1415436 m!1305995))

(check-sat (not b!1415430) (not b!1415438) (not b!1415434) (not b!1415436) (not b!1415437) (not b!1415431) (not start!121988) (not b!1415433) (not b!1415432) (not b!1415439))
(check-sat)
(get-model)

(declare-fun b!1415508 () Bool)

(declare-fun e!801196 () Bool)

(declare-fun e!801197 () Bool)

(assert (=> b!1415508 (= e!801196 e!801197)))

(declare-fun lt!623939 () (_ BitVec 64))

(assert (=> b!1415508 (= lt!623939 (select (arr!46693 a!2901) j!112))))

(declare-fun lt!623937 () Unit!47815)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96722 (_ BitVec 64) (_ BitVec 32)) Unit!47815)

(assert (=> b!1415508 (= lt!623937 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623939 j!112))))

(declare-fun arrayContainsKey!0 (array!96722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1415508 (arrayContainsKey!0 a!2901 lt!623939 #b00000000000000000000000000000000)))

(declare-fun lt!623938 () Unit!47815)

(assert (=> b!1415508 (= lt!623938 lt!623937)))

(declare-fun res!951336 () Bool)

(assert (=> b!1415508 (= res!951336 (= (seekEntryOrOpen!0 (select (arr!46693 a!2901) j!112) a!2901 mask!2840) (Found!10907 j!112)))))

(assert (=> b!1415508 (=> (not res!951336) (not e!801197))))

(declare-fun b!1415509 () Bool)

(declare-fun call!67200 () Bool)

(assert (=> b!1415509 (= e!801197 call!67200)))

(declare-fun b!1415510 () Bool)

(declare-fun e!801195 () Bool)

(assert (=> b!1415510 (= e!801195 e!801196)))

(declare-fun c!131569 () Bool)

(assert (=> b!1415510 (= c!131569 (validKeyInArray!0 (select (arr!46693 a!2901) j!112)))))

(declare-fun bm!67197 () Bool)

(assert (=> bm!67197 (= call!67200 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152661 () Bool)

(declare-fun res!951337 () Bool)

(assert (=> d!152661 (=> res!951337 e!801195)))

(assert (=> d!152661 (= res!951337 (bvsge j!112 (size!47244 a!2901)))))

(assert (=> d!152661 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!801195)))

(declare-fun b!1415511 () Bool)

(assert (=> b!1415511 (= e!801196 call!67200)))

(assert (= (and d!152661 (not res!951337)) b!1415510))

(assert (= (and b!1415510 c!131569) b!1415508))

(assert (= (and b!1415510 (not c!131569)) b!1415511))

(assert (= (and b!1415508 res!951336) b!1415509))

(assert (= (or b!1415509 b!1415511) bm!67197))

(assert (=> b!1415508 m!1305963))

(declare-fun m!1306081 () Bool)

(assert (=> b!1415508 m!1306081))

(declare-fun m!1306083 () Bool)

(assert (=> b!1415508 m!1306083))

(assert (=> b!1415508 m!1305963))

(assert (=> b!1415508 m!1305975))

(assert (=> b!1415510 m!1305963))

(assert (=> b!1415510 m!1305963))

(assert (=> b!1415510 m!1305991))

(declare-fun m!1306085 () Bool)

(assert (=> bm!67197 m!1306085))

(assert (=> b!1415430 d!152661))

(declare-fun d!152663 () Bool)

(assert (=> d!152663 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623942 () Unit!47815)

(declare-fun choose!38 (array!96722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47815)

(assert (=> d!152663 (= lt!623942 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152663 (validMask!0 mask!2840)))

(assert (=> d!152663 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623942)))

(declare-fun bs!41239 () Bool)

(assert (= bs!41239 d!152663))

(assert (=> bs!41239 m!1305985))

(declare-fun m!1306087 () Bool)

(assert (=> bs!41239 m!1306087))

(assert (=> bs!41239 m!1305957))

(assert (=> b!1415430 d!152663))

(declare-fun d!152665 () Bool)

(declare-fun e!801211 () Bool)

(assert (=> d!152665 e!801211))

(declare-fun c!131577 () Bool)

(declare-fun lt!623948 () SeekEntryResult!10907)

(assert (=> d!152665 (= c!131577 (and ((_ is Intermediate!10907) lt!623948) (undefined!11719 lt!623948)))))

(declare-fun e!801209 () SeekEntryResult!10907)

(assert (=> d!152665 (= lt!623948 e!801209)))

(declare-fun c!131576 () Bool)

(assert (=> d!152665 (= c!131576 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623947 () (_ BitVec 64))

(assert (=> d!152665 (= lt!623947 (select (arr!46693 a!2901) lt!623882))))

(assert (=> d!152665 (validMask!0 mask!2840)))

(assert (=> d!152665 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623882 (select (arr!46693 a!2901) j!112) a!2901 mask!2840) lt!623948)))

(declare-fun b!1415530 () Bool)

(declare-fun e!801212 () SeekEntryResult!10907)

(assert (=> b!1415530 (= e!801209 e!801212)))

(declare-fun c!131578 () Bool)

(assert (=> b!1415530 (= c!131578 (or (= lt!623947 (select (arr!46693 a!2901) j!112)) (= (bvadd lt!623947 lt!623947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1415531 () Bool)

(assert (=> b!1415531 (and (bvsge (index!46016 lt!623948) #b00000000000000000000000000000000) (bvslt (index!46016 lt!623948) (size!47244 a!2901)))))

(declare-fun res!951344 () Bool)

(assert (=> b!1415531 (= res!951344 (= (select (arr!46693 a!2901) (index!46016 lt!623948)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!801210 () Bool)

(assert (=> b!1415531 (=> res!951344 e!801210)))

(declare-fun b!1415532 () Bool)

(assert (=> b!1415532 (and (bvsge (index!46016 lt!623948) #b00000000000000000000000000000000) (bvslt (index!46016 lt!623948) (size!47244 a!2901)))))

(assert (=> b!1415532 (= e!801210 (= (select (arr!46693 a!2901) (index!46016 lt!623948)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1415533 () Bool)

(assert (=> b!1415533 (= e!801211 (bvsge (x!127765 lt!623948) #b01111111111111111111111111111110))))

(declare-fun b!1415534 () Bool)

(assert (=> b!1415534 (= e!801209 (Intermediate!10907 true lt!623882 #b00000000000000000000000000000000))))

(declare-fun b!1415535 () Bool)

(declare-fun e!801208 () Bool)

(assert (=> b!1415535 (= e!801211 e!801208)))

(declare-fun res!951345 () Bool)

(assert (=> b!1415535 (= res!951345 (and ((_ is Intermediate!10907) lt!623948) (not (undefined!11719 lt!623948)) (bvslt (x!127765 lt!623948) #b01111111111111111111111111111110) (bvsge (x!127765 lt!623948) #b00000000000000000000000000000000) (bvsge (x!127765 lt!623948) #b00000000000000000000000000000000)))))

(assert (=> b!1415535 (=> (not res!951345) (not e!801208))))

(declare-fun b!1415536 () Bool)

(assert (=> b!1415536 (= e!801212 (Intermediate!10907 false lt!623882 #b00000000000000000000000000000000))))

(declare-fun b!1415537 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415537 (= e!801212 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623882 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46693 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1415538 () Bool)

(assert (=> b!1415538 (and (bvsge (index!46016 lt!623948) #b00000000000000000000000000000000) (bvslt (index!46016 lt!623948) (size!47244 a!2901)))))

(declare-fun res!951346 () Bool)

(assert (=> b!1415538 (= res!951346 (= (select (arr!46693 a!2901) (index!46016 lt!623948)) (select (arr!46693 a!2901) j!112)))))

(assert (=> b!1415538 (=> res!951346 e!801210)))

(assert (=> b!1415538 (= e!801208 e!801210)))

(assert (= (and d!152665 c!131576) b!1415534))

(assert (= (and d!152665 (not c!131576)) b!1415530))

(assert (= (and b!1415530 c!131578) b!1415536))

(assert (= (and b!1415530 (not c!131578)) b!1415537))

(assert (= (and d!152665 c!131577) b!1415533))

(assert (= (and d!152665 (not c!131577)) b!1415535))

(assert (= (and b!1415535 res!951345) b!1415538))

(assert (= (and b!1415538 (not res!951346)) b!1415531))

(assert (= (and b!1415531 (not res!951344)) b!1415532))

(declare-fun m!1306089 () Bool)

(assert (=> b!1415531 m!1306089))

(declare-fun m!1306091 () Bool)

(assert (=> d!152665 m!1306091))

(assert (=> d!152665 m!1305957))

(declare-fun m!1306093 () Bool)

(assert (=> b!1415537 m!1306093))

(assert (=> b!1415537 m!1306093))

(assert (=> b!1415537 m!1305963))

(declare-fun m!1306095 () Bool)

(assert (=> b!1415537 m!1306095))

(assert (=> b!1415538 m!1306089))

(assert (=> b!1415532 m!1306089))

(assert (=> b!1415430 d!152665))

(declare-fun d!152671 () Bool)

(declare-fun lt!623957 () (_ BitVec 32))

(declare-fun lt!623956 () (_ BitVec 32))

(assert (=> d!152671 (= lt!623957 (bvmul (bvxor lt!623956 (bvlshr lt!623956 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152671 (= lt!623956 ((_ extract 31 0) (bvand (bvxor (select (arr!46693 a!2901) j!112) (bvlshr (select (arr!46693 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152671 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951347 (let ((h!34487 ((_ extract 31 0) (bvand (bvxor (select (arr!46693 a!2901) j!112) (bvlshr (select (arr!46693 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127770 (bvmul (bvxor h!34487 (bvlshr h!34487 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127770 (bvlshr x!127770 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951347 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951347 #b00000000000000000000000000000000))))))

(assert (=> d!152671 (= (toIndex!0 (select (arr!46693 a!2901) j!112) mask!2840) (bvand (bvxor lt!623957 (bvlshr lt!623957 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1415430 d!152671))

(declare-fun d!152675 () Bool)

(assert (=> d!152675 (= (validKeyInArray!0 (select (arr!46693 a!2901) i!1037)) (and (not (= (select (arr!46693 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46693 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1415437 d!152675))

(declare-fun b!1415551 () Bool)

(declare-fun e!801220 () Bool)

(declare-fun e!801221 () Bool)

(assert (=> b!1415551 (= e!801220 e!801221)))

(declare-fun lt!623966 () (_ BitVec 64))

(assert (=> b!1415551 (= lt!623966 (select (arr!46693 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623964 () Unit!47815)

(assert (=> b!1415551 (= lt!623964 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623966 #b00000000000000000000000000000000))))

(assert (=> b!1415551 (arrayContainsKey!0 a!2901 lt!623966 #b00000000000000000000000000000000)))

(declare-fun lt!623965 () Unit!47815)

(assert (=> b!1415551 (= lt!623965 lt!623964)))

(declare-fun res!951348 () Bool)

(assert (=> b!1415551 (= res!951348 (= (seekEntryOrOpen!0 (select (arr!46693 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10907 #b00000000000000000000000000000000)))))

(assert (=> b!1415551 (=> (not res!951348) (not e!801221))))

(declare-fun b!1415552 () Bool)

(declare-fun call!67201 () Bool)

(assert (=> b!1415552 (= e!801221 call!67201)))

(declare-fun b!1415553 () Bool)

(declare-fun e!801219 () Bool)

(assert (=> b!1415553 (= e!801219 e!801220)))

(declare-fun c!131585 () Bool)

(assert (=> b!1415553 (= c!131585 (validKeyInArray!0 (select (arr!46693 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67198 () Bool)

(assert (=> bm!67198 (= call!67201 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152677 () Bool)

(declare-fun res!951349 () Bool)

(assert (=> d!152677 (=> res!951349 e!801219)))

(assert (=> d!152677 (= res!951349 (bvsge #b00000000000000000000000000000000 (size!47244 a!2901)))))

(assert (=> d!152677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!801219)))

(declare-fun b!1415554 () Bool)

(assert (=> b!1415554 (= e!801220 call!67201)))

(assert (= (and d!152677 (not res!951349)) b!1415553))

(assert (= (and b!1415553 c!131585) b!1415551))

(assert (= (and b!1415553 (not c!131585)) b!1415554))

(assert (= (and b!1415551 res!951348) b!1415552))

(assert (= (or b!1415552 b!1415554) bm!67198))

(declare-fun m!1306099 () Bool)

(assert (=> b!1415551 m!1306099))

(declare-fun m!1306101 () Bool)

(assert (=> b!1415551 m!1306101))

(declare-fun m!1306103 () Bool)

(assert (=> b!1415551 m!1306103))

(assert (=> b!1415551 m!1306099))

(declare-fun m!1306105 () Bool)

(assert (=> b!1415551 m!1306105))

(assert (=> b!1415553 m!1306099))

(assert (=> b!1415553 m!1306099))

(declare-fun m!1306107 () Bool)

(assert (=> b!1415553 m!1306107))

(declare-fun m!1306109 () Bool)

(assert (=> bm!67198 m!1306109))

(assert (=> b!1415431 d!152677))

(declare-fun d!152679 () Bool)

(assert (=> d!152679 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121988 d!152679))

(declare-fun d!152683 () Bool)

(assert (=> d!152683 (= (array_inv!35974 a!2901) (bvsge (size!47244 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121988 d!152683))

(declare-fun d!152685 () Bool)

(assert (=> d!152685 (and (not (undefined!11719 lt!623886)) (= (index!46016 lt!623886) i!1037) (bvslt (x!127765 lt!623886) (x!127765 lt!623883)))))

(declare-fun lt!623979 () Unit!47815)

(declare-fun choose!62 (array!96722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47815)

(assert (=> d!152685 (= lt!623979 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623882 (x!127765 lt!623883) (index!46016 lt!623883) (x!127765 lt!623886) (index!46016 lt!623886) (undefined!11719 lt!623886) mask!2840))))

(assert (=> d!152685 (validMask!0 mask!2840)))

(assert (=> d!152685 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623882 (x!127765 lt!623883) (index!46016 lt!623883) (x!127765 lt!623886) (index!46016 lt!623886) (undefined!11719 lt!623886) mask!2840) lt!623979)))

(declare-fun bs!41241 () Bool)

(assert (= bs!41241 d!152685))

(declare-fun m!1306141 () Bool)

(assert (=> bs!41241 m!1306141))

(assert (=> bs!41241 m!1305957))

(assert (=> b!1415436 d!152685))

(declare-fun d!152693 () Bool)

(declare-fun e!801253 () Bool)

(assert (=> d!152693 e!801253))

(declare-fun c!131602 () Bool)

(declare-fun lt!623981 () SeekEntryResult!10907)

(assert (=> d!152693 (= c!131602 (and ((_ is Intermediate!10907) lt!623981) (undefined!11719 lt!623981)))))

(declare-fun e!801251 () SeekEntryResult!10907)

(assert (=> d!152693 (= lt!623981 e!801251)))

(declare-fun c!131601 () Bool)

(assert (=> d!152693 (= c!131601 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623980 () (_ BitVec 64))

(assert (=> d!152693 (= lt!623980 (select (arr!46693 lt!623887) (toIndex!0 lt!623884 mask!2840)))))

(assert (=> d!152693 (validMask!0 mask!2840)))

(assert (=> d!152693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623884 mask!2840) lt!623884 lt!623887 mask!2840) lt!623981)))

(declare-fun b!1415600 () Bool)

(declare-fun e!801254 () SeekEntryResult!10907)

(assert (=> b!1415600 (= e!801251 e!801254)))

(declare-fun c!131603 () Bool)

(assert (=> b!1415600 (= c!131603 (or (= lt!623980 lt!623884) (= (bvadd lt!623980 lt!623980) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1415601 () Bool)

(assert (=> b!1415601 (and (bvsge (index!46016 lt!623981) #b00000000000000000000000000000000) (bvslt (index!46016 lt!623981) (size!47244 lt!623887)))))

(declare-fun res!951365 () Bool)

(assert (=> b!1415601 (= res!951365 (= (select (arr!46693 lt!623887) (index!46016 lt!623981)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!801252 () Bool)

(assert (=> b!1415601 (=> res!951365 e!801252)))

(declare-fun b!1415602 () Bool)

(assert (=> b!1415602 (and (bvsge (index!46016 lt!623981) #b00000000000000000000000000000000) (bvslt (index!46016 lt!623981) (size!47244 lt!623887)))))

(assert (=> b!1415602 (= e!801252 (= (select (arr!46693 lt!623887) (index!46016 lt!623981)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1415603 () Bool)

(assert (=> b!1415603 (= e!801253 (bvsge (x!127765 lt!623981) #b01111111111111111111111111111110))))

(declare-fun b!1415604 () Bool)

(assert (=> b!1415604 (= e!801251 (Intermediate!10907 true (toIndex!0 lt!623884 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1415605 () Bool)

(declare-fun e!801250 () Bool)

(assert (=> b!1415605 (= e!801253 e!801250)))

(declare-fun res!951366 () Bool)

(assert (=> b!1415605 (= res!951366 (and ((_ is Intermediate!10907) lt!623981) (not (undefined!11719 lt!623981)) (bvslt (x!127765 lt!623981) #b01111111111111111111111111111110) (bvsge (x!127765 lt!623981) #b00000000000000000000000000000000) (bvsge (x!127765 lt!623981) #b00000000000000000000000000000000)))))

(assert (=> b!1415605 (=> (not res!951366) (not e!801250))))

(declare-fun b!1415606 () Bool)

(assert (=> b!1415606 (= e!801254 (Intermediate!10907 false (toIndex!0 lt!623884 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1415607 () Bool)

(assert (=> b!1415607 (= e!801254 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623884 mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) lt!623884 lt!623887 mask!2840))))

(declare-fun b!1415608 () Bool)

(assert (=> b!1415608 (and (bvsge (index!46016 lt!623981) #b00000000000000000000000000000000) (bvslt (index!46016 lt!623981) (size!47244 lt!623887)))))

(declare-fun res!951367 () Bool)

(assert (=> b!1415608 (= res!951367 (= (select (arr!46693 lt!623887) (index!46016 lt!623981)) lt!623884))))

(assert (=> b!1415608 (=> res!951367 e!801252)))

(assert (=> b!1415608 (= e!801250 e!801252)))

(assert (= (and d!152693 c!131601) b!1415604))

(assert (= (and d!152693 (not c!131601)) b!1415600))

(assert (= (and b!1415600 c!131603) b!1415606))

(assert (= (and b!1415600 (not c!131603)) b!1415607))

(assert (= (and d!152693 c!131602) b!1415603))

(assert (= (and d!152693 (not c!131602)) b!1415605))

(assert (= (and b!1415605 res!951366) b!1415608))

(assert (= (and b!1415608 (not res!951367)) b!1415601))

(assert (= (and b!1415601 (not res!951365)) b!1415602))

(declare-fun m!1306143 () Bool)

(assert (=> b!1415601 m!1306143))

(assert (=> d!152693 m!1305967))

(declare-fun m!1306145 () Bool)

(assert (=> d!152693 m!1306145))

(assert (=> d!152693 m!1305957))

(assert (=> b!1415607 m!1305967))

(declare-fun m!1306147 () Bool)

(assert (=> b!1415607 m!1306147))

(assert (=> b!1415607 m!1306147))

(declare-fun m!1306149 () Bool)

(assert (=> b!1415607 m!1306149))

(assert (=> b!1415608 m!1306143))

(assert (=> b!1415602 m!1306143))

(assert (=> b!1415433 d!152693))

(declare-fun d!152695 () Bool)

(declare-fun lt!623985 () (_ BitVec 32))

(declare-fun lt!623984 () (_ BitVec 32))

(assert (=> d!152695 (= lt!623985 (bvmul (bvxor lt!623984 (bvlshr lt!623984 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152695 (= lt!623984 ((_ extract 31 0) (bvand (bvxor lt!623884 (bvlshr lt!623884 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152695 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951347 (let ((h!34487 ((_ extract 31 0) (bvand (bvxor lt!623884 (bvlshr lt!623884 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127770 (bvmul (bvxor h!34487 (bvlshr h!34487 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127770 (bvlshr x!127770 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951347 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951347 #b00000000000000000000000000000000))))))

(assert (=> d!152695 (= (toIndex!0 lt!623884 mask!2840) (bvand (bvxor lt!623985 (bvlshr lt!623985 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1415433 d!152695))

(declare-fun d!152697 () Bool)

(declare-fun lt!624005 () SeekEntryResult!10907)

(assert (=> d!152697 (and (or ((_ is Undefined!10907) lt!624005) (not ((_ is Found!10907) lt!624005)) (and (bvsge (index!46015 lt!624005) #b00000000000000000000000000000000) (bvslt (index!46015 lt!624005) (size!47244 lt!623887)))) (or ((_ is Undefined!10907) lt!624005) ((_ is Found!10907) lt!624005) (not ((_ is MissingZero!10907) lt!624005)) (and (bvsge (index!46014 lt!624005) #b00000000000000000000000000000000) (bvslt (index!46014 lt!624005) (size!47244 lt!623887)))) (or ((_ is Undefined!10907) lt!624005) ((_ is Found!10907) lt!624005) ((_ is MissingZero!10907) lt!624005) (not ((_ is MissingVacant!10907) lt!624005)) (and (bvsge (index!46017 lt!624005) #b00000000000000000000000000000000) (bvslt (index!46017 lt!624005) (size!47244 lt!623887)))) (or ((_ is Undefined!10907) lt!624005) (ite ((_ is Found!10907) lt!624005) (= (select (arr!46693 lt!623887) (index!46015 lt!624005)) lt!623884) (ite ((_ is MissingZero!10907) lt!624005) (= (select (arr!46693 lt!623887) (index!46014 lt!624005)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10907) lt!624005) (= (select (arr!46693 lt!623887) (index!46017 lt!624005)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!801287 () SeekEntryResult!10907)

(assert (=> d!152697 (= lt!624005 e!801287)))

(declare-fun c!131625 () Bool)

(declare-fun lt!624004 () SeekEntryResult!10907)

(assert (=> d!152697 (= c!131625 (and ((_ is Intermediate!10907) lt!624004) (undefined!11719 lt!624004)))))

(assert (=> d!152697 (= lt!624004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623884 mask!2840) lt!623884 lt!623887 mask!2840))))

(assert (=> d!152697 (validMask!0 mask!2840)))

(assert (=> d!152697 (= (seekEntryOrOpen!0 lt!623884 lt!623887 mask!2840) lt!624005)))

(declare-fun b!1415663 () Bool)

(assert (=> b!1415663 (= e!801287 Undefined!10907)))

(declare-fun e!801288 () SeekEntryResult!10907)

(declare-fun b!1415664 () Bool)

(assert (=> b!1415664 (= e!801288 (seekKeyOrZeroReturnVacant!0 (x!127765 lt!624004) (index!46016 lt!624004) (index!46016 lt!624004) lt!623884 lt!623887 mask!2840))))

(declare-fun b!1415665 () Bool)

(assert (=> b!1415665 (= e!801288 (MissingZero!10907 (index!46016 lt!624004)))))

(declare-fun b!1415666 () Bool)

(declare-fun c!131626 () Bool)

(declare-fun lt!624006 () (_ BitVec 64))

(assert (=> b!1415666 (= c!131626 (= lt!624006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!801289 () SeekEntryResult!10907)

(assert (=> b!1415666 (= e!801289 e!801288)))

(declare-fun b!1415667 () Bool)

(assert (=> b!1415667 (= e!801287 e!801289)))

(assert (=> b!1415667 (= lt!624006 (select (arr!46693 lt!623887) (index!46016 lt!624004)))))

(declare-fun c!131627 () Bool)

(assert (=> b!1415667 (= c!131627 (= lt!624006 lt!623884))))

(declare-fun b!1415668 () Bool)

(assert (=> b!1415668 (= e!801289 (Found!10907 (index!46016 lt!624004)))))

(assert (= (and d!152697 c!131625) b!1415663))

(assert (= (and d!152697 (not c!131625)) b!1415667))

(assert (= (and b!1415667 c!131627) b!1415668))

(assert (= (and b!1415667 (not c!131627)) b!1415666))

(assert (= (and b!1415666 c!131626) b!1415665))

(assert (= (and b!1415666 (not c!131626)) b!1415664))

(assert (=> d!152697 m!1305967))

(assert (=> d!152697 m!1305969))

(declare-fun m!1306177 () Bool)

(assert (=> d!152697 m!1306177))

(declare-fun m!1306179 () Bool)

(assert (=> d!152697 m!1306179))

(assert (=> d!152697 m!1305967))

(declare-fun m!1306181 () Bool)

(assert (=> d!152697 m!1306181))

(assert (=> d!152697 m!1305957))

(declare-fun m!1306183 () Bool)

(assert (=> b!1415664 m!1306183))

(declare-fun m!1306185 () Bool)

(assert (=> b!1415667 m!1306185))

(assert (=> b!1415438 d!152697))

(declare-fun b!1415711 () Bool)

(declare-fun e!801315 () SeekEntryResult!10907)

(assert (=> b!1415711 (= e!801315 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127765 lt!623886) #b00000000000000000000000000000001) (nextIndex!0 (index!46016 lt!623886) (bvadd (x!127765 lt!623886) #b00000000000000000000000000000001) mask!2840) (index!46016 lt!623886) (select (arr!46693 a!2901) j!112) lt!623887 mask!2840))))

(declare-fun b!1415712 () Bool)

(declare-fun e!801314 () SeekEntryResult!10907)

(assert (=> b!1415712 (= e!801314 (Found!10907 (index!46016 lt!623886)))))

(declare-fun b!1415713 () Bool)

(assert (=> b!1415713 (= e!801315 (MissingVacant!10907 (index!46016 lt!623886)))))

(declare-fun lt!624033 () SeekEntryResult!10907)

(declare-fun d!152709 () Bool)

(assert (=> d!152709 (and (or ((_ is Undefined!10907) lt!624033) (not ((_ is Found!10907) lt!624033)) (and (bvsge (index!46015 lt!624033) #b00000000000000000000000000000000) (bvslt (index!46015 lt!624033) (size!47244 lt!623887)))) (or ((_ is Undefined!10907) lt!624033) ((_ is Found!10907) lt!624033) (not ((_ is MissingVacant!10907) lt!624033)) (not (= (index!46017 lt!624033) (index!46016 lt!623886))) (and (bvsge (index!46017 lt!624033) #b00000000000000000000000000000000) (bvslt (index!46017 lt!624033) (size!47244 lt!623887)))) (or ((_ is Undefined!10907) lt!624033) (ite ((_ is Found!10907) lt!624033) (= (select (arr!46693 lt!623887) (index!46015 lt!624033)) (select (arr!46693 a!2901) j!112)) (and ((_ is MissingVacant!10907) lt!624033) (= (index!46017 lt!624033) (index!46016 lt!623886)) (= (select (arr!46693 lt!623887) (index!46017 lt!624033)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!801316 () SeekEntryResult!10907)

(assert (=> d!152709 (= lt!624033 e!801316)))

(declare-fun c!131647 () Bool)

(assert (=> d!152709 (= c!131647 (bvsge (x!127765 lt!623886) #b01111111111111111111111111111110))))

(declare-fun lt!624032 () (_ BitVec 64))

(assert (=> d!152709 (= lt!624032 (select (arr!46693 lt!623887) (index!46016 lt!623886)))))

(assert (=> d!152709 (validMask!0 mask!2840)))

(assert (=> d!152709 (= (seekKeyOrZeroReturnVacant!0 (x!127765 lt!623886) (index!46016 lt!623886) (index!46016 lt!623886) (select (arr!46693 a!2901) j!112) lt!623887 mask!2840) lt!624033)))

(declare-fun b!1415714 () Bool)

(assert (=> b!1415714 (= e!801316 e!801314)))

(declare-fun c!131648 () Bool)

(assert (=> b!1415714 (= c!131648 (= lt!624032 (select (arr!46693 a!2901) j!112)))))

(declare-fun b!1415715 () Bool)

(declare-fun c!131646 () Bool)

(assert (=> b!1415715 (= c!131646 (= lt!624032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1415715 (= e!801314 e!801315)))

(declare-fun b!1415716 () Bool)

(assert (=> b!1415716 (= e!801316 Undefined!10907)))

(assert (= (and d!152709 c!131647) b!1415716))

(assert (= (and d!152709 (not c!131647)) b!1415714))

(assert (= (and b!1415714 c!131648) b!1415712))

(assert (= (and b!1415714 (not c!131648)) b!1415715))

(assert (= (and b!1415715 c!131646) b!1415713))

(assert (= (and b!1415715 (not c!131646)) b!1415711))

(declare-fun m!1306205 () Bool)

(assert (=> b!1415711 m!1306205))

(assert (=> b!1415711 m!1306205))

(assert (=> b!1415711 m!1305963))

(declare-fun m!1306207 () Bool)

(assert (=> b!1415711 m!1306207))

(declare-fun m!1306209 () Bool)

(assert (=> d!152709 m!1306209))

(declare-fun m!1306211 () Bool)

(assert (=> d!152709 m!1306211))

(declare-fun m!1306213 () Bool)

(assert (=> d!152709 m!1306213))

(assert (=> d!152709 m!1305957))

(assert (=> b!1415438 d!152709))

(declare-fun d!152717 () Bool)

(declare-fun lt!624035 () SeekEntryResult!10907)

(assert (=> d!152717 (and (or ((_ is Undefined!10907) lt!624035) (not ((_ is Found!10907) lt!624035)) (and (bvsge (index!46015 lt!624035) #b00000000000000000000000000000000) (bvslt (index!46015 lt!624035) (size!47244 a!2901)))) (or ((_ is Undefined!10907) lt!624035) ((_ is Found!10907) lt!624035) (not ((_ is MissingZero!10907) lt!624035)) (and (bvsge (index!46014 lt!624035) #b00000000000000000000000000000000) (bvslt (index!46014 lt!624035) (size!47244 a!2901)))) (or ((_ is Undefined!10907) lt!624035) ((_ is Found!10907) lt!624035) ((_ is MissingZero!10907) lt!624035) (not ((_ is MissingVacant!10907) lt!624035)) (and (bvsge (index!46017 lt!624035) #b00000000000000000000000000000000) (bvslt (index!46017 lt!624035) (size!47244 a!2901)))) (or ((_ is Undefined!10907) lt!624035) (ite ((_ is Found!10907) lt!624035) (= (select (arr!46693 a!2901) (index!46015 lt!624035)) (select (arr!46693 a!2901) j!112)) (ite ((_ is MissingZero!10907) lt!624035) (= (select (arr!46693 a!2901) (index!46014 lt!624035)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10907) lt!624035) (= (select (arr!46693 a!2901) (index!46017 lt!624035)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!801317 () SeekEntryResult!10907)

(assert (=> d!152717 (= lt!624035 e!801317)))

(declare-fun c!131649 () Bool)

(declare-fun lt!624034 () SeekEntryResult!10907)

(assert (=> d!152717 (= c!131649 (and ((_ is Intermediate!10907) lt!624034) (undefined!11719 lt!624034)))))

(assert (=> d!152717 (= lt!624034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46693 a!2901) j!112) mask!2840) (select (arr!46693 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152717 (validMask!0 mask!2840)))

(assert (=> d!152717 (= (seekEntryOrOpen!0 (select (arr!46693 a!2901) j!112) a!2901 mask!2840) lt!624035)))

(declare-fun b!1415717 () Bool)

(assert (=> b!1415717 (= e!801317 Undefined!10907)))

(declare-fun e!801318 () SeekEntryResult!10907)

(declare-fun b!1415718 () Bool)

(assert (=> b!1415718 (= e!801318 (seekKeyOrZeroReturnVacant!0 (x!127765 lt!624034) (index!46016 lt!624034) (index!46016 lt!624034) (select (arr!46693 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1415719 () Bool)

(assert (=> b!1415719 (= e!801318 (MissingZero!10907 (index!46016 lt!624034)))))

(declare-fun b!1415720 () Bool)

(declare-fun c!131650 () Bool)

(declare-fun lt!624036 () (_ BitVec 64))

(assert (=> b!1415720 (= c!131650 (= lt!624036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!801319 () SeekEntryResult!10907)

(assert (=> b!1415720 (= e!801319 e!801318)))

(declare-fun b!1415721 () Bool)

(assert (=> b!1415721 (= e!801317 e!801319)))

(assert (=> b!1415721 (= lt!624036 (select (arr!46693 a!2901) (index!46016 lt!624034)))))

(declare-fun c!131651 () Bool)

(assert (=> b!1415721 (= c!131651 (= lt!624036 (select (arr!46693 a!2901) j!112)))))

(declare-fun b!1415722 () Bool)

(assert (=> b!1415722 (= e!801319 (Found!10907 (index!46016 lt!624034)))))

(assert (= (and d!152717 c!131649) b!1415717))

(assert (= (and d!152717 (not c!131649)) b!1415721))

(assert (= (and b!1415721 c!131651) b!1415722))

(assert (= (and b!1415721 (not c!131651)) b!1415720))

(assert (= (and b!1415720 c!131650) b!1415719))

(assert (= (and b!1415720 (not c!131650)) b!1415718))

(assert (=> d!152717 m!1305979))

(assert (=> d!152717 m!1305963))

(declare-fun m!1306215 () Bool)

(assert (=> d!152717 m!1306215))

(declare-fun m!1306217 () Bool)

(assert (=> d!152717 m!1306217))

(declare-fun m!1306219 () Bool)

(assert (=> d!152717 m!1306219))

(assert (=> d!152717 m!1305963))

(assert (=> d!152717 m!1305979))

(declare-fun m!1306221 () Bool)

(assert (=> d!152717 m!1306221))

(assert (=> d!152717 m!1305957))

(assert (=> b!1415718 m!1305963))

(declare-fun m!1306223 () Bool)

(assert (=> b!1415718 m!1306223))

(declare-fun m!1306225 () Bool)

(assert (=> b!1415721 m!1306225))

(assert (=> b!1415432 d!152717))

(declare-fun b!1415741 () Bool)

(declare-fun e!801332 () Bool)

(declare-fun call!67213 () Bool)

(assert (=> b!1415741 (= e!801332 call!67213)))

(declare-fun b!1415742 () Bool)

(declare-fun e!801335 () Bool)

(assert (=> b!1415742 (= e!801335 e!801332)))

(declare-fun c!131658 () Bool)

(assert (=> b!1415742 (= c!131658 (validKeyInArray!0 (select (arr!46693 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1415743 () Bool)

(assert (=> b!1415743 (= e!801332 call!67213)))

(declare-fun b!1415745 () Bool)

(declare-fun e!801333 () Bool)

(declare-fun contains!9864 (List!33199 (_ BitVec 64)) Bool)

(assert (=> b!1415745 (= e!801333 (contains!9864 Nil!33196 (select (arr!46693 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67210 () Bool)

(assert (=> bm!67210 (= call!67213 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131658 (Cons!33195 (select (arr!46693 a!2901) #b00000000000000000000000000000000) Nil!33196) Nil!33196)))))

(declare-fun d!152719 () Bool)

(declare-fun res!951394 () Bool)

(declare-fun e!801334 () Bool)

(assert (=> d!152719 (=> res!951394 e!801334)))

(assert (=> d!152719 (= res!951394 (bvsge #b00000000000000000000000000000000 (size!47244 a!2901)))))

(assert (=> d!152719 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33196) e!801334)))

(declare-fun b!1415744 () Bool)

(assert (=> b!1415744 (= e!801334 e!801335)))

(declare-fun res!951393 () Bool)

(assert (=> b!1415744 (=> (not res!951393) (not e!801335))))

(assert (=> b!1415744 (= res!951393 (not e!801333))))

(declare-fun res!951395 () Bool)

(assert (=> b!1415744 (=> (not res!951395) (not e!801333))))

(assert (=> b!1415744 (= res!951395 (validKeyInArray!0 (select (arr!46693 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152719 (not res!951394)) b!1415744))

(assert (= (and b!1415744 res!951395) b!1415745))

(assert (= (and b!1415744 res!951393) b!1415742))

(assert (= (and b!1415742 c!131658) b!1415741))

(assert (= (and b!1415742 (not c!131658)) b!1415743))

(assert (= (or b!1415741 b!1415743) bm!67210))

(assert (=> b!1415742 m!1306099))

(assert (=> b!1415742 m!1306099))

(assert (=> b!1415742 m!1306107))

(assert (=> b!1415745 m!1306099))

(assert (=> b!1415745 m!1306099))

(declare-fun m!1306227 () Bool)

(assert (=> b!1415745 m!1306227))

(assert (=> bm!67210 m!1306099))

(declare-fun m!1306229 () Bool)

(assert (=> bm!67210 m!1306229))

(assert (=> b!1415744 m!1306099))

(assert (=> b!1415744 m!1306099))

(assert (=> b!1415744 m!1306107))

(assert (=> b!1415434 d!152719))

(declare-fun d!152721 () Bool)

(assert (=> d!152721 (= (validKeyInArray!0 (select (arr!46693 a!2901) j!112)) (and (not (= (select (arr!46693 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46693 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1415439 d!152721))

(check-sat (not bm!67210) (not bm!67198) (not b!1415711) (not b!1415744) (not d!152709) (not b!1415510) (not b!1415664) (not b!1415537) (not d!152663) (not b!1415742) (not d!152665) (not b!1415551) (not b!1415718) (not d!152693) (not b!1415508) (not bm!67197) (not b!1415607) (not b!1415553) (not b!1415745) (not d!152685) (not d!152717) (not d!152697))
(check-sat)
