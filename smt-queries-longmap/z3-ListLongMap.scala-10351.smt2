; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121658 () Bool)

(assert start!121658)

(declare-fun res!950485 () Bool)

(declare-fun e!799929 () Bool)

(assert (=> start!121658 (=> (not res!950485) (not e!799929))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121658 (= res!950485 (validMask!0 mask!2840))))

(assert (=> start!121658 e!799929))

(assert (=> start!121658 true))

(declare-datatypes ((array!96596 0))(
  ( (array!96597 (arr!46635 (Array (_ BitVec 32) (_ BitVec 64))) (size!47185 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96596)

(declare-fun array_inv!35663 (array!96596) Bool)

(assert (=> start!121658 (array_inv!35663 a!2901)))

(declare-fun b!1413486 () Bool)

(declare-fun lt!623069 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10946 0))(
  ( (MissingZero!10946 (index!46164 (_ BitVec 32))) (Found!10946 (index!46165 (_ BitVec 32))) (Intermediate!10946 (undefined!11758 Bool) (index!46166 (_ BitVec 32)) (x!127745 (_ BitVec 32))) (Undefined!10946) (MissingVacant!10946 (index!46167 (_ BitVec 32))) )
))
(declare-fun lt!623071 () SeekEntryResult!10946)

(declare-fun e!799931 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!623072 () array!96596)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96596 (_ BitVec 32)) SeekEntryResult!10946)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96596 (_ BitVec 32)) SeekEntryResult!10946)

(assert (=> b!1413486 (= e!799931 (= (seekEntryOrOpen!0 lt!623069 lt!623072 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127745 lt!623071) (index!46166 lt!623071) (index!46166 lt!623071) (select (arr!46635 a!2901) j!112) lt!623072 mask!2840)))))

(declare-fun b!1413487 () Bool)

(declare-fun e!799932 () Bool)

(declare-fun e!799934 () Bool)

(assert (=> b!1413487 (= e!799932 e!799934)))

(declare-fun res!950484 () Bool)

(assert (=> b!1413487 (=> res!950484 e!799934)))

(declare-fun lt!623067 () SeekEntryResult!10946)

(get-info :version)

(assert (=> b!1413487 (= res!950484 (or (= lt!623067 lt!623071) (not ((_ is Intermediate!10946) lt!623071))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96596 (_ BitVec 32)) SeekEntryResult!10946)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413487 (= lt!623071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623069 mask!2840) lt!623069 lt!623072 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413487 (= lt!623069 (select (store (arr!46635 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413487 (= lt!623072 (array!96597 (store (arr!46635 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47185 a!2901)))))

(declare-fun b!1413488 () Bool)

(assert (=> b!1413488 (= e!799934 (and (bvsge (x!127745 lt!623067) #b00000000000000000000000000000000) (bvsle (x!127745 lt!623067) #b01111111111111111111111111111110)))))

(assert (=> b!1413488 e!799931))

(declare-fun res!950482 () Bool)

(assert (=> b!1413488 (=> (not res!950482) (not e!799931))))

(assert (=> b!1413488 (= res!950482 (and (not (undefined!11758 lt!623071)) (= (index!46166 lt!623071) i!1037) (bvslt (x!127745 lt!623071) (x!127745 lt!623067)) (= (select (store (arr!46635 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46166 lt!623071)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47866 0))(
  ( (Unit!47867) )
))
(declare-fun lt!623073 () Unit!47866)

(declare-fun lt!623070 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47866)

(assert (=> b!1413488 (= lt!623073 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623070 (x!127745 lt!623067) (index!46166 lt!623067) (x!127745 lt!623071) (index!46166 lt!623071) (undefined!11758 lt!623071) mask!2840))))

(declare-fun b!1413489 () Bool)

(declare-fun e!799930 () Bool)

(assert (=> b!1413489 (= e!799930 (= (seekEntryOrOpen!0 (select (arr!46635 a!2901) j!112) a!2901 mask!2840) (Found!10946 j!112)))))

(declare-fun b!1413490 () Bool)

(declare-fun res!950481 () Bool)

(assert (=> b!1413490 (=> (not res!950481) (not e!799929))))

(assert (=> b!1413490 (= res!950481 (and (= (size!47185 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47185 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47185 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413491 () Bool)

(declare-fun res!950479 () Bool)

(assert (=> b!1413491 (=> (not res!950479) (not e!799929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413491 (= res!950479 (validKeyInArray!0 (select (arr!46635 a!2901) i!1037)))))

(declare-fun b!1413492 () Bool)

(declare-fun res!950477 () Bool)

(assert (=> b!1413492 (=> (not res!950477) (not e!799929))))

(declare-datatypes ((List!33154 0))(
  ( (Nil!33151) (Cons!33150 (h!34425 (_ BitVec 64)) (t!47848 List!33154)) )
))
(declare-fun arrayNoDuplicates!0 (array!96596 (_ BitVec 32) List!33154) Bool)

(assert (=> b!1413492 (= res!950477 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33151))))

(declare-fun b!1413493 () Bool)

(declare-fun res!950476 () Bool)

(assert (=> b!1413493 (=> (not res!950476) (not e!799929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96596 (_ BitVec 32)) Bool)

(assert (=> b!1413493 (= res!950476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413494 () Bool)

(assert (=> b!1413494 (= e!799929 (not e!799932))))

(declare-fun res!950478 () Bool)

(assert (=> b!1413494 (=> res!950478 e!799932)))

(assert (=> b!1413494 (= res!950478 (or (not ((_ is Intermediate!10946) lt!623067)) (undefined!11758 lt!623067)))))

(assert (=> b!1413494 e!799930))

(declare-fun res!950480 () Bool)

(assert (=> b!1413494 (=> (not res!950480) (not e!799930))))

(assert (=> b!1413494 (= res!950480 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623068 () Unit!47866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47866)

(assert (=> b!1413494 (= lt!623068 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413494 (= lt!623067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623070 (select (arr!46635 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413494 (= lt!623070 (toIndex!0 (select (arr!46635 a!2901) j!112) mask!2840))))

(declare-fun b!1413495 () Bool)

(declare-fun res!950483 () Bool)

(assert (=> b!1413495 (=> (not res!950483) (not e!799929))))

(assert (=> b!1413495 (= res!950483 (validKeyInArray!0 (select (arr!46635 a!2901) j!112)))))

(assert (= (and start!121658 res!950485) b!1413490))

(assert (= (and b!1413490 res!950481) b!1413491))

(assert (= (and b!1413491 res!950479) b!1413495))

(assert (= (and b!1413495 res!950483) b!1413493))

(assert (= (and b!1413493 res!950476) b!1413492))

(assert (= (and b!1413492 res!950477) b!1413494))

(assert (= (and b!1413494 res!950480) b!1413489))

(assert (= (and b!1413494 (not res!950478)) b!1413487))

(assert (= (and b!1413487 (not res!950484)) b!1413488))

(assert (= (and b!1413488 res!950482) b!1413486))

(declare-fun m!1303929 () Bool)

(assert (=> b!1413492 m!1303929))

(declare-fun m!1303931 () Bool)

(assert (=> b!1413494 m!1303931))

(declare-fun m!1303933 () Bool)

(assert (=> b!1413494 m!1303933))

(assert (=> b!1413494 m!1303931))

(declare-fun m!1303935 () Bool)

(assert (=> b!1413494 m!1303935))

(assert (=> b!1413494 m!1303931))

(declare-fun m!1303937 () Bool)

(assert (=> b!1413494 m!1303937))

(declare-fun m!1303939 () Bool)

(assert (=> b!1413494 m!1303939))

(declare-fun m!1303941 () Bool)

(assert (=> b!1413491 m!1303941))

(assert (=> b!1413491 m!1303941))

(declare-fun m!1303943 () Bool)

(assert (=> b!1413491 m!1303943))

(assert (=> b!1413489 m!1303931))

(assert (=> b!1413489 m!1303931))

(declare-fun m!1303945 () Bool)

(assert (=> b!1413489 m!1303945))

(assert (=> b!1413495 m!1303931))

(assert (=> b!1413495 m!1303931))

(declare-fun m!1303947 () Bool)

(assert (=> b!1413495 m!1303947))

(declare-fun m!1303949 () Bool)

(assert (=> b!1413487 m!1303949))

(assert (=> b!1413487 m!1303949))

(declare-fun m!1303951 () Bool)

(assert (=> b!1413487 m!1303951))

(declare-fun m!1303953 () Bool)

(assert (=> b!1413487 m!1303953))

(declare-fun m!1303955 () Bool)

(assert (=> b!1413487 m!1303955))

(declare-fun m!1303957 () Bool)

(assert (=> start!121658 m!1303957))

(declare-fun m!1303959 () Bool)

(assert (=> start!121658 m!1303959))

(declare-fun m!1303961 () Bool)

(assert (=> b!1413486 m!1303961))

(assert (=> b!1413486 m!1303931))

(assert (=> b!1413486 m!1303931))

(declare-fun m!1303963 () Bool)

(assert (=> b!1413486 m!1303963))

(assert (=> b!1413488 m!1303953))

(declare-fun m!1303965 () Bool)

(assert (=> b!1413488 m!1303965))

(declare-fun m!1303967 () Bool)

(assert (=> b!1413488 m!1303967))

(declare-fun m!1303969 () Bool)

(assert (=> b!1413493 m!1303969))

(check-sat (not b!1413493) (not b!1413492) (not b!1413487) (not b!1413486) (not b!1413494) (not b!1413488) (not b!1413489) (not b!1413495) (not b!1413491) (not start!121658))
(check-sat)
(get-model)

(declare-fun d!152121 () Bool)

(assert (=> d!152121 (= (validKeyInArray!0 (select (arr!46635 a!2901) j!112)) (and (not (= (select (arr!46635 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46635 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413495 d!152121))

(declare-fun d!152123 () Bool)

(assert (=> d!152123 (and (not (undefined!11758 lt!623071)) (= (index!46166 lt!623071) i!1037) (bvslt (x!127745 lt!623071) (x!127745 lt!623067)))))

(declare-fun lt!623097 () Unit!47866)

(declare-fun choose!62 (array!96596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47866)

(assert (=> d!152123 (= lt!623097 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623070 (x!127745 lt!623067) (index!46166 lt!623067) (x!127745 lt!623071) (index!46166 lt!623071) (undefined!11758 lt!623071) mask!2840))))

(assert (=> d!152123 (validMask!0 mask!2840)))

(assert (=> d!152123 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623070 (x!127745 lt!623067) (index!46166 lt!623067) (x!127745 lt!623071) (index!46166 lt!623071) (undefined!11758 lt!623071) mask!2840) lt!623097)))

(declare-fun bs!41216 () Bool)

(assert (= bs!41216 d!152123))

(declare-fun m!1304013 () Bool)

(assert (=> bs!41216 m!1304013))

(assert (=> bs!41216 m!1303957))

(assert (=> b!1413488 d!152123))

(declare-fun b!1413538 () Bool)

(declare-fun e!799959 () SeekEntryResult!10946)

(declare-fun lt!623105 () SeekEntryResult!10946)

(assert (=> b!1413538 (= e!799959 (MissingZero!10946 (index!46166 lt!623105)))))

(declare-fun b!1413539 () Bool)

(assert (=> b!1413539 (= e!799959 (seekKeyOrZeroReturnVacant!0 (x!127745 lt!623105) (index!46166 lt!623105) (index!46166 lt!623105) (select (arr!46635 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1413540 () Bool)

(declare-fun e!799960 () SeekEntryResult!10946)

(declare-fun e!799961 () SeekEntryResult!10946)

(assert (=> b!1413540 (= e!799960 e!799961)))

(declare-fun lt!623104 () (_ BitVec 64))

(assert (=> b!1413540 (= lt!623104 (select (arr!46635 a!2901) (index!46166 lt!623105)))))

(declare-fun c!130985 () Bool)

(assert (=> b!1413540 (= c!130985 (= lt!623104 (select (arr!46635 a!2901) j!112)))))

(declare-fun d!152125 () Bool)

(declare-fun lt!623106 () SeekEntryResult!10946)

(assert (=> d!152125 (and (or ((_ is Undefined!10946) lt!623106) (not ((_ is Found!10946) lt!623106)) (and (bvsge (index!46165 lt!623106) #b00000000000000000000000000000000) (bvslt (index!46165 lt!623106) (size!47185 a!2901)))) (or ((_ is Undefined!10946) lt!623106) ((_ is Found!10946) lt!623106) (not ((_ is MissingZero!10946) lt!623106)) (and (bvsge (index!46164 lt!623106) #b00000000000000000000000000000000) (bvslt (index!46164 lt!623106) (size!47185 a!2901)))) (or ((_ is Undefined!10946) lt!623106) ((_ is Found!10946) lt!623106) ((_ is MissingZero!10946) lt!623106) (not ((_ is MissingVacant!10946) lt!623106)) (and (bvsge (index!46167 lt!623106) #b00000000000000000000000000000000) (bvslt (index!46167 lt!623106) (size!47185 a!2901)))) (or ((_ is Undefined!10946) lt!623106) (ite ((_ is Found!10946) lt!623106) (= (select (arr!46635 a!2901) (index!46165 lt!623106)) (select (arr!46635 a!2901) j!112)) (ite ((_ is MissingZero!10946) lt!623106) (= (select (arr!46635 a!2901) (index!46164 lt!623106)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10946) lt!623106) (= (select (arr!46635 a!2901) (index!46167 lt!623106)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152125 (= lt!623106 e!799960)))

(declare-fun c!130984 () Bool)

(assert (=> d!152125 (= c!130984 (and ((_ is Intermediate!10946) lt!623105) (undefined!11758 lt!623105)))))

(assert (=> d!152125 (= lt!623105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46635 a!2901) j!112) mask!2840) (select (arr!46635 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152125 (validMask!0 mask!2840)))

(assert (=> d!152125 (= (seekEntryOrOpen!0 (select (arr!46635 a!2901) j!112) a!2901 mask!2840) lt!623106)))

(declare-fun b!1413541 () Bool)

(declare-fun c!130986 () Bool)

(assert (=> b!1413541 (= c!130986 (= lt!623104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413541 (= e!799961 e!799959)))

(declare-fun b!1413542 () Bool)

(assert (=> b!1413542 (= e!799961 (Found!10946 (index!46166 lt!623105)))))

(declare-fun b!1413543 () Bool)

(assert (=> b!1413543 (= e!799960 Undefined!10946)))

(assert (= (and d!152125 c!130984) b!1413543))

(assert (= (and d!152125 (not c!130984)) b!1413540))

(assert (= (and b!1413540 c!130985) b!1413542))

(assert (= (and b!1413540 (not c!130985)) b!1413541))

(assert (= (and b!1413541 c!130986) b!1413538))

(assert (= (and b!1413541 (not c!130986)) b!1413539))

(assert (=> b!1413539 m!1303931))

(declare-fun m!1304015 () Bool)

(assert (=> b!1413539 m!1304015))

(declare-fun m!1304017 () Bool)

(assert (=> b!1413540 m!1304017))

(assert (=> d!152125 m!1303931))

(assert (=> d!152125 m!1303935))

(declare-fun m!1304019 () Bool)

(assert (=> d!152125 m!1304019))

(declare-fun m!1304021 () Bool)

(assert (=> d!152125 m!1304021))

(assert (=> d!152125 m!1303935))

(assert (=> d!152125 m!1303931))

(declare-fun m!1304023 () Bool)

(assert (=> d!152125 m!1304023))

(assert (=> d!152125 m!1303957))

(declare-fun m!1304025 () Bool)

(assert (=> d!152125 m!1304025))

(assert (=> b!1413489 d!152125))

(declare-fun d!152129 () Bool)

(declare-fun res!950521 () Bool)

(declare-fun e!799970 () Bool)

(assert (=> d!152129 (=> res!950521 e!799970)))

(assert (=> d!152129 (= res!950521 (bvsge j!112 (size!47185 a!2901)))))

(assert (=> d!152129 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!799970)))

(declare-fun b!1413552 () Bool)

(declare-fun e!799968 () Bool)

(declare-fun call!67099 () Bool)

(assert (=> b!1413552 (= e!799968 call!67099)))

(declare-fun b!1413553 () Bool)

(declare-fun e!799969 () Bool)

(assert (=> b!1413553 (= e!799969 e!799968)))

(declare-fun lt!623115 () (_ BitVec 64))

(assert (=> b!1413553 (= lt!623115 (select (arr!46635 a!2901) j!112))))

(declare-fun lt!623113 () Unit!47866)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96596 (_ BitVec 64) (_ BitVec 32)) Unit!47866)

(assert (=> b!1413553 (= lt!623113 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623115 j!112))))

(declare-fun arrayContainsKey!0 (array!96596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1413553 (arrayContainsKey!0 a!2901 lt!623115 #b00000000000000000000000000000000)))

(declare-fun lt!623114 () Unit!47866)

(assert (=> b!1413553 (= lt!623114 lt!623113)))

(declare-fun res!950520 () Bool)

(assert (=> b!1413553 (= res!950520 (= (seekEntryOrOpen!0 (select (arr!46635 a!2901) j!112) a!2901 mask!2840) (Found!10946 j!112)))))

(assert (=> b!1413553 (=> (not res!950520) (not e!799968))))

(declare-fun b!1413554 () Bool)

(assert (=> b!1413554 (= e!799969 call!67099)))

(declare-fun b!1413555 () Bool)

(assert (=> b!1413555 (= e!799970 e!799969)))

(declare-fun c!130989 () Bool)

(assert (=> b!1413555 (= c!130989 (validKeyInArray!0 (select (arr!46635 a!2901) j!112)))))

(declare-fun bm!67096 () Bool)

(assert (=> bm!67096 (= call!67099 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152129 (not res!950521)) b!1413555))

(assert (= (and b!1413555 c!130989) b!1413553))

(assert (= (and b!1413555 (not c!130989)) b!1413554))

(assert (= (and b!1413553 res!950520) b!1413552))

(assert (= (or b!1413552 b!1413554) bm!67096))

(assert (=> b!1413553 m!1303931))

(declare-fun m!1304027 () Bool)

(assert (=> b!1413553 m!1304027))

(declare-fun m!1304029 () Bool)

(assert (=> b!1413553 m!1304029))

(assert (=> b!1413553 m!1303931))

(assert (=> b!1413553 m!1303945))

(assert (=> b!1413555 m!1303931))

(assert (=> b!1413555 m!1303931))

(assert (=> b!1413555 m!1303947))

(declare-fun m!1304031 () Bool)

(assert (=> bm!67096 m!1304031))

(assert (=> b!1413494 d!152129))

(declare-fun d!152135 () Bool)

(assert (=> d!152135 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623118 () Unit!47866)

(declare-fun choose!38 (array!96596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47866)

(assert (=> d!152135 (= lt!623118 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152135 (validMask!0 mask!2840)))

(assert (=> d!152135 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623118)))

(declare-fun bs!41217 () Bool)

(assert (= bs!41217 d!152135))

(assert (=> bs!41217 m!1303939))

(declare-fun m!1304033 () Bool)

(assert (=> bs!41217 m!1304033))

(assert (=> bs!41217 m!1303957))

(assert (=> b!1413494 d!152135))

(declare-fun b!1413616 () Bool)

(declare-fun e!800002 () SeekEntryResult!10946)

(assert (=> b!1413616 (= e!800002 (Intermediate!10946 false lt!623070 #b00000000000000000000000000000000))))

(declare-fun b!1413617 () Bool)

(declare-fun e!800006 () Bool)

(declare-fun e!800005 () Bool)

(assert (=> b!1413617 (= e!800006 e!800005)))

(declare-fun res!950528 () Bool)

(declare-fun lt!623144 () SeekEntryResult!10946)

(assert (=> b!1413617 (= res!950528 (and ((_ is Intermediate!10946) lt!623144) (not (undefined!11758 lt!623144)) (bvslt (x!127745 lt!623144) #b01111111111111111111111111111110) (bvsge (x!127745 lt!623144) #b00000000000000000000000000000000) (bvsge (x!127745 lt!623144) #b00000000000000000000000000000000)))))

(assert (=> b!1413617 (=> (not res!950528) (not e!800005))))

(declare-fun b!1413618 () Bool)

(declare-fun e!800003 () SeekEntryResult!10946)

(assert (=> b!1413618 (= e!800003 e!800002)))

(declare-fun lt!623145 () (_ BitVec 64))

(declare-fun c!131017 () Bool)

(assert (=> b!1413618 (= c!131017 (or (= lt!623145 (select (arr!46635 a!2901) j!112)) (= (bvadd lt!623145 lt!623145) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152137 () Bool)

(assert (=> d!152137 e!800006))

(declare-fun c!131019 () Bool)

(assert (=> d!152137 (= c!131019 (and ((_ is Intermediate!10946) lt!623144) (undefined!11758 lt!623144)))))

(assert (=> d!152137 (= lt!623144 e!800003)))

(declare-fun c!131018 () Bool)

(assert (=> d!152137 (= c!131018 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152137 (= lt!623145 (select (arr!46635 a!2901) lt!623070))))

(assert (=> d!152137 (validMask!0 mask!2840)))

(assert (=> d!152137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623070 (select (arr!46635 a!2901) j!112) a!2901 mask!2840) lt!623144)))

(declare-fun b!1413619 () Bool)

(assert (=> b!1413619 (and (bvsge (index!46166 lt!623144) #b00000000000000000000000000000000) (bvslt (index!46166 lt!623144) (size!47185 a!2901)))))

(declare-fun res!950529 () Bool)

(assert (=> b!1413619 (= res!950529 (= (select (arr!46635 a!2901) (index!46166 lt!623144)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800004 () Bool)

(assert (=> b!1413619 (=> res!950529 e!800004)))

(declare-fun b!1413620 () Bool)

(assert (=> b!1413620 (= e!800006 (bvsge (x!127745 lt!623144) #b01111111111111111111111111111110))))

(declare-fun b!1413621 () Bool)

(assert (=> b!1413621 (and (bvsge (index!46166 lt!623144) #b00000000000000000000000000000000) (bvslt (index!46166 lt!623144) (size!47185 a!2901)))))

(assert (=> b!1413621 (= e!800004 (= (select (arr!46635 a!2901) (index!46166 lt!623144)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1413622 () Bool)

(assert (=> b!1413622 (and (bvsge (index!46166 lt!623144) #b00000000000000000000000000000000) (bvslt (index!46166 lt!623144) (size!47185 a!2901)))))

(declare-fun res!950530 () Bool)

(assert (=> b!1413622 (= res!950530 (= (select (arr!46635 a!2901) (index!46166 lt!623144)) (select (arr!46635 a!2901) j!112)))))

(assert (=> b!1413622 (=> res!950530 e!800004)))

(assert (=> b!1413622 (= e!800005 e!800004)))

(declare-fun b!1413623 () Bool)

(assert (=> b!1413623 (= e!800003 (Intermediate!10946 true lt!623070 #b00000000000000000000000000000000))))

(declare-fun b!1413624 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413624 (= e!800002 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623070 #b00000000000000000000000000000000 mask!2840) (select (arr!46635 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152137 c!131018) b!1413623))

(assert (= (and d!152137 (not c!131018)) b!1413618))

(assert (= (and b!1413618 c!131017) b!1413616))

(assert (= (and b!1413618 (not c!131017)) b!1413624))

(assert (= (and d!152137 c!131019) b!1413620))

(assert (= (and d!152137 (not c!131019)) b!1413617))

(assert (= (and b!1413617 res!950528) b!1413622))

(assert (= (and b!1413622 (not res!950530)) b!1413619))

(assert (= (and b!1413619 (not res!950529)) b!1413621))

(declare-fun m!1304069 () Bool)

(assert (=> b!1413622 m!1304069))

(declare-fun m!1304071 () Bool)

(assert (=> d!152137 m!1304071))

(assert (=> d!152137 m!1303957))

(declare-fun m!1304073 () Bool)

(assert (=> b!1413624 m!1304073))

(assert (=> b!1413624 m!1304073))

(assert (=> b!1413624 m!1303931))

(declare-fun m!1304075 () Bool)

(assert (=> b!1413624 m!1304075))

(assert (=> b!1413619 m!1304069))

(assert (=> b!1413621 m!1304069))

(assert (=> b!1413494 d!152137))

(declare-fun d!152149 () Bool)

(declare-fun lt!623158 () (_ BitVec 32))

(declare-fun lt!623157 () (_ BitVec 32))

(assert (=> d!152149 (= lt!623158 (bvmul (bvxor lt!623157 (bvlshr lt!623157 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152149 (= lt!623157 ((_ extract 31 0) (bvand (bvxor (select (arr!46635 a!2901) j!112) (bvlshr (select (arr!46635 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152149 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950531 (let ((h!34427 ((_ extract 31 0) (bvand (bvxor (select (arr!46635 a!2901) j!112) (bvlshr (select (arr!46635 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127750 (bvmul (bvxor h!34427 (bvlshr h!34427 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127750 (bvlshr x!127750 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950531 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950531 #b00000000000000000000000000000000))))))

(assert (=> d!152149 (= (toIndex!0 (select (arr!46635 a!2901) j!112) mask!2840) (bvand (bvxor lt!623158 (bvlshr lt!623158 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413494 d!152149))

(declare-fun b!1413637 () Bool)

(declare-fun e!800013 () SeekEntryResult!10946)

(assert (=> b!1413637 (= e!800013 (Intermediate!10946 false (toIndex!0 lt!623069 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413638 () Bool)

(declare-fun e!800017 () Bool)

(declare-fun e!800016 () Bool)

(assert (=> b!1413638 (= e!800017 e!800016)))

(declare-fun res!950532 () Bool)

(declare-fun lt!623159 () SeekEntryResult!10946)

(assert (=> b!1413638 (= res!950532 (and ((_ is Intermediate!10946) lt!623159) (not (undefined!11758 lt!623159)) (bvslt (x!127745 lt!623159) #b01111111111111111111111111111110) (bvsge (x!127745 lt!623159) #b00000000000000000000000000000000) (bvsge (x!127745 lt!623159) #b00000000000000000000000000000000)))))

(assert (=> b!1413638 (=> (not res!950532) (not e!800016))))

(declare-fun b!1413639 () Bool)

(declare-fun e!800014 () SeekEntryResult!10946)

(assert (=> b!1413639 (= e!800014 e!800013)))

(declare-fun c!131026 () Bool)

(declare-fun lt!623160 () (_ BitVec 64))

(assert (=> b!1413639 (= c!131026 (or (= lt!623160 lt!623069) (= (bvadd lt!623160 lt!623160) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152153 () Bool)

(assert (=> d!152153 e!800017))

(declare-fun c!131028 () Bool)

(assert (=> d!152153 (= c!131028 (and ((_ is Intermediate!10946) lt!623159) (undefined!11758 lt!623159)))))

(assert (=> d!152153 (= lt!623159 e!800014)))

(declare-fun c!131027 () Bool)

(assert (=> d!152153 (= c!131027 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152153 (= lt!623160 (select (arr!46635 lt!623072) (toIndex!0 lt!623069 mask!2840)))))

(assert (=> d!152153 (validMask!0 mask!2840)))

(assert (=> d!152153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623069 mask!2840) lt!623069 lt!623072 mask!2840) lt!623159)))

(declare-fun b!1413640 () Bool)

(assert (=> b!1413640 (and (bvsge (index!46166 lt!623159) #b00000000000000000000000000000000) (bvslt (index!46166 lt!623159) (size!47185 lt!623072)))))

(declare-fun res!950533 () Bool)

(assert (=> b!1413640 (= res!950533 (= (select (arr!46635 lt!623072) (index!46166 lt!623159)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800015 () Bool)

(assert (=> b!1413640 (=> res!950533 e!800015)))

(declare-fun b!1413641 () Bool)

(assert (=> b!1413641 (= e!800017 (bvsge (x!127745 lt!623159) #b01111111111111111111111111111110))))

(declare-fun b!1413642 () Bool)

(assert (=> b!1413642 (and (bvsge (index!46166 lt!623159) #b00000000000000000000000000000000) (bvslt (index!46166 lt!623159) (size!47185 lt!623072)))))

(assert (=> b!1413642 (= e!800015 (= (select (arr!46635 lt!623072) (index!46166 lt!623159)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1413643 () Bool)

(assert (=> b!1413643 (and (bvsge (index!46166 lt!623159) #b00000000000000000000000000000000) (bvslt (index!46166 lt!623159) (size!47185 lt!623072)))))

(declare-fun res!950534 () Bool)

(assert (=> b!1413643 (= res!950534 (= (select (arr!46635 lt!623072) (index!46166 lt!623159)) lt!623069))))

(assert (=> b!1413643 (=> res!950534 e!800015)))

(assert (=> b!1413643 (= e!800016 e!800015)))

(declare-fun b!1413644 () Bool)

(assert (=> b!1413644 (= e!800014 (Intermediate!10946 true (toIndex!0 lt!623069 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413645 () Bool)

(assert (=> b!1413645 (= e!800013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623069 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623069 lt!623072 mask!2840))))

(assert (= (and d!152153 c!131027) b!1413644))

(assert (= (and d!152153 (not c!131027)) b!1413639))

(assert (= (and b!1413639 c!131026) b!1413637))

(assert (= (and b!1413639 (not c!131026)) b!1413645))

(assert (= (and d!152153 c!131028) b!1413641))

(assert (= (and d!152153 (not c!131028)) b!1413638))

(assert (= (and b!1413638 res!950532) b!1413643))

(assert (= (and b!1413643 (not res!950534)) b!1413640))

(assert (= (and b!1413640 (not res!950533)) b!1413642))

(declare-fun m!1304079 () Bool)

(assert (=> b!1413643 m!1304079))

(assert (=> d!152153 m!1303949))

(declare-fun m!1304081 () Bool)

(assert (=> d!152153 m!1304081))

(assert (=> d!152153 m!1303957))

(assert (=> b!1413645 m!1303949))

(declare-fun m!1304083 () Bool)

(assert (=> b!1413645 m!1304083))

(assert (=> b!1413645 m!1304083))

(declare-fun m!1304085 () Bool)

(assert (=> b!1413645 m!1304085))

(assert (=> b!1413640 m!1304079))

(assert (=> b!1413642 m!1304079))

(assert (=> b!1413487 d!152153))

(declare-fun d!152155 () Bool)

(declare-fun lt!623162 () (_ BitVec 32))

(declare-fun lt!623161 () (_ BitVec 32))

(assert (=> d!152155 (= lt!623162 (bvmul (bvxor lt!623161 (bvlshr lt!623161 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152155 (= lt!623161 ((_ extract 31 0) (bvand (bvxor lt!623069 (bvlshr lt!623069 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152155 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950531 (let ((h!34427 ((_ extract 31 0) (bvand (bvxor lt!623069 (bvlshr lt!623069 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127750 (bvmul (bvxor h!34427 (bvlshr h!34427 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127750 (bvlshr x!127750 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950531 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950531 #b00000000000000000000000000000000))))))

(assert (=> d!152155 (= (toIndex!0 lt!623069 mask!2840) (bvand (bvxor lt!623162 (bvlshr lt!623162 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413487 d!152155))

(declare-fun d!152157 () Bool)

(assert (=> d!152157 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121658 d!152157))

(declare-fun d!152163 () Bool)

(assert (=> d!152163 (= (array_inv!35663 a!2901) (bvsge (size!47185 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121658 d!152163))

(declare-fun b!1413701 () Bool)

(declare-fun e!800060 () Bool)

(declare-fun call!67111 () Bool)

(assert (=> b!1413701 (= e!800060 call!67111)))

(declare-fun b!1413702 () Bool)

(assert (=> b!1413702 (= e!800060 call!67111)))

(declare-fun bm!67108 () Bool)

(declare-fun c!131043 () Bool)

(assert (=> bm!67108 (= call!67111 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131043 (Cons!33150 (select (arr!46635 a!2901) #b00000000000000000000000000000000) Nil!33151) Nil!33151)))))

(declare-fun b!1413703 () Bool)

(declare-fun e!800059 () Bool)

(declare-fun e!800061 () Bool)

(assert (=> b!1413703 (= e!800059 e!800061)))

(declare-fun res!950564 () Bool)

(assert (=> b!1413703 (=> (not res!950564) (not e!800061))))

(declare-fun e!800062 () Bool)

(assert (=> b!1413703 (= res!950564 (not e!800062))))

(declare-fun res!950562 () Bool)

(assert (=> b!1413703 (=> (not res!950562) (not e!800062))))

(assert (=> b!1413703 (= res!950562 (validKeyInArray!0 (select (arr!46635 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152165 () Bool)

(declare-fun res!950563 () Bool)

(assert (=> d!152165 (=> res!950563 e!800059)))

(assert (=> d!152165 (= res!950563 (bvsge #b00000000000000000000000000000000 (size!47185 a!2901)))))

(assert (=> d!152165 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33151) e!800059)))

(declare-fun b!1413704 () Bool)

(assert (=> b!1413704 (= e!800061 e!800060)))

(assert (=> b!1413704 (= c!131043 (validKeyInArray!0 (select (arr!46635 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1413705 () Bool)

(declare-fun contains!9814 (List!33154 (_ BitVec 64)) Bool)

(assert (=> b!1413705 (= e!800062 (contains!9814 Nil!33151 (select (arr!46635 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152165 (not res!950563)) b!1413703))

(assert (= (and b!1413703 res!950562) b!1413705))

(assert (= (and b!1413703 res!950564) b!1413704))

(assert (= (and b!1413704 c!131043) b!1413701))

(assert (= (and b!1413704 (not c!131043)) b!1413702))

(assert (= (or b!1413701 b!1413702) bm!67108))

(declare-fun m!1304125 () Bool)

(assert (=> bm!67108 m!1304125))

(declare-fun m!1304127 () Bool)

(assert (=> bm!67108 m!1304127))

(assert (=> b!1413703 m!1304125))

(assert (=> b!1413703 m!1304125))

(declare-fun m!1304129 () Bool)

(assert (=> b!1413703 m!1304129))

(assert (=> b!1413704 m!1304125))

(assert (=> b!1413704 m!1304125))

(assert (=> b!1413704 m!1304129))

(assert (=> b!1413705 m!1304125))

(assert (=> b!1413705 m!1304125))

(declare-fun m!1304131 () Bool)

(assert (=> b!1413705 m!1304131))

(assert (=> b!1413492 d!152165))

(declare-fun d!152171 () Bool)

(declare-fun res!950566 () Bool)

(declare-fun e!800065 () Bool)

(assert (=> d!152171 (=> res!950566 e!800065)))

(assert (=> d!152171 (= res!950566 (bvsge #b00000000000000000000000000000000 (size!47185 a!2901)))))

(assert (=> d!152171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800065)))

(declare-fun b!1413706 () Bool)

(declare-fun e!800063 () Bool)

(declare-fun call!67112 () Bool)

(assert (=> b!1413706 (= e!800063 call!67112)))

(declare-fun b!1413707 () Bool)

(declare-fun e!800064 () Bool)

(assert (=> b!1413707 (= e!800064 e!800063)))

(declare-fun lt!623185 () (_ BitVec 64))

(assert (=> b!1413707 (= lt!623185 (select (arr!46635 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623183 () Unit!47866)

(assert (=> b!1413707 (= lt!623183 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623185 #b00000000000000000000000000000000))))

(assert (=> b!1413707 (arrayContainsKey!0 a!2901 lt!623185 #b00000000000000000000000000000000)))

(declare-fun lt!623184 () Unit!47866)

(assert (=> b!1413707 (= lt!623184 lt!623183)))

(declare-fun res!950565 () Bool)

(assert (=> b!1413707 (= res!950565 (= (seekEntryOrOpen!0 (select (arr!46635 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10946 #b00000000000000000000000000000000)))))

(assert (=> b!1413707 (=> (not res!950565) (not e!800063))))

(declare-fun b!1413708 () Bool)

(assert (=> b!1413708 (= e!800064 call!67112)))

(declare-fun b!1413709 () Bool)

(assert (=> b!1413709 (= e!800065 e!800064)))

(declare-fun c!131044 () Bool)

(assert (=> b!1413709 (= c!131044 (validKeyInArray!0 (select (arr!46635 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67109 () Bool)

(assert (=> bm!67109 (= call!67112 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152171 (not res!950566)) b!1413709))

(assert (= (and b!1413709 c!131044) b!1413707))

(assert (= (and b!1413709 (not c!131044)) b!1413708))

(assert (= (and b!1413707 res!950565) b!1413706))

(assert (= (or b!1413706 b!1413708) bm!67109))

(assert (=> b!1413707 m!1304125))

(declare-fun m!1304133 () Bool)

(assert (=> b!1413707 m!1304133))

(declare-fun m!1304135 () Bool)

(assert (=> b!1413707 m!1304135))

(assert (=> b!1413707 m!1304125))

(declare-fun m!1304137 () Bool)

(assert (=> b!1413707 m!1304137))

(assert (=> b!1413709 m!1304125))

(assert (=> b!1413709 m!1304125))

(assert (=> b!1413709 m!1304129))

(declare-fun m!1304139 () Bool)

(assert (=> bm!67109 m!1304139))

(assert (=> b!1413493 d!152171))

(declare-fun d!152173 () Bool)

(assert (=> d!152173 (= (validKeyInArray!0 (select (arr!46635 a!2901) i!1037)) (and (not (= (select (arr!46635 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46635 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413491 d!152173))

(declare-fun b!1413710 () Bool)

(declare-fun e!800066 () SeekEntryResult!10946)

(declare-fun lt!623187 () SeekEntryResult!10946)

(assert (=> b!1413710 (= e!800066 (MissingZero!10946 (index!46166 lt!623187)))))

(declare-fun b!1413711 () Bool)

(assert (=> b!1413711 (= e!800066 (seekKeyOrZeroReturnVacant!0 (x!127745 lt!623187) (index!46166 lt!623187) (index!46166 lt!623187) lt!623069 lt!623072 mask!2840))))

(declare-fun b!1413712 () Bool)

(declare-fun e!800067 () SeekEntryResult!10946)

(declare-fun e!800068 () SeekEntryResult!10946)

(assert (=> b!1413712 (= e!800067 e!800068)))

(declare-fun lt!623186 () (_ BitVec 64))

(assert (=> b!1413712 (= lt!623186 (select (arr!46635 lt!623072) (index!46166 lt!623187)))))

(declare-fun c!131046 () Bool)

(assert (=> b!1413712 (= c!131046 (= lt!623186 lt!623069))))

(declare-fun d!152175 () Bool)

(declare-fun lt!623188 () SeekEntryResult!10946)

(assert (=> d!152175 (and (or ((_ is Undefined!10946) lt!623188) (not ((_ is Found!10946) lt!623188)) (and (bvsge (index!46165 lt!623188) #b00000000000000000000000000000000) (bvslt (index!46165 lt!623188) (size!47185 lt!623072)))) (or ((_ is Undefined!10946) lt!623188) ((_ is Found!10946) lt!623188) (not ((_ is MissingZero!10946) lt!623188)) (and (bvsge (index!46164 lt!623188) #b00000000000000000000000000000000) (bvslt (index!46164 lt!623188) (size!47185 lt!623072)))) (or ((_ is Undefined!10946) lt!623188) ((_ is Found!10946) lt!623188) ((_ is MissingZero!10946) lt!623188) (not ((_ is MissingVacant!10946) lt!623188)) (and (bvsge (index!46167 lt!623188) #b00000000000000000000000000000000) (bvslt (index!46167 lt!623188) (size!47185 lt!623072)))) (or ((_ is Undefined!10946) lt!623188) (ite ((_ is Found!10946) lt!623188) (= (select (arr!46635 lt!623072) (index!46165 lt!623188)) lt!623069) (ite ((_ is MissingZero!10946) lt!623188) (= (select (arr!46635 lt!623072) (index!46164 lt!623188)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10946) lt!623188) (= (select (arr!46635 lt!623072) (index!46167 lt!623188)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152175 (= lt!623188 e!800067)))

(declare-fun c!131045 () Bool)

(assert (=> d!152175 (= c!131045 (and ((_ is Intermediate!10946) lt!623187) (undefined!11758 lt!623187)))))

(assert (=> d!152175 (= lt!623187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623069 mask!2840) lt!623069 lt!623072 mask!2840))))

(assert (=> d!152175 (validMask!0 mask!2840)))

(assert (=> d!152175 (= (seekEntryOrOpen!0 lt!623069 lt!623072 mask!2840) lt!623188)))

(declare-fun b!1413713 () Bool)

(declare-fun c!131047 () Bool)

(assert (=> b!1413713 (= c!131047 (= lt!623186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413713 (= e!800068 e!800066)))

(declare-fun b!1413714 () Bool)

(assert (=> b!1413714 (= e!800068 (Found!10946 (index!46166 lt!623187)))))

(declare-fun b!1413715 () Bool)

(assert (=> b!1413715 (= e!800067 Undefined!10946)))

(assert (= (and d!152175 c!131045) b!1413715))

(assert (= (and d!152175 (not c!131045)) b!1413712))

(assert (= (and b!1413712 c!131046) b!1413714))

(assert (= (and b!1413712 (not c!131046)) b!1413713))

(assert (= (and b!1413713 c!131047) b!1413710))

(assert (= (and b!1413713 (not c!131047)) b!1413711))

(declare-fun m!1304141 () Bool)

(assert (=> b!1413711 m!1304141))

(declare-fun m!1304143 () Bool)

(assert (=> b!1413712 m!1304143))

(assert (=> d!152175 m!1303949))

(declare-fun m!1304145 () Bool)

(assert (=> d!152175 m!1304145))

(declare-fun m!1304147 () Bool)

(assert (=> d!152175 m!1304147))

(assert (=> d!152175 m!1303949))

(assert (=> d!152175 m!1303951))

(assert (=> d!152175 m!1303957))

(declare-fun m!1304149 () Bool)

(assert (=> d!152175 m!1304149))

(assert (=> b!1413486 d!152175))

(declare-fun b!1413755 () Bool)

(declare-fun c!131064 () Bool)

(declare-fun lt!623203 () (_ BitVec 64))

(assert (=> b!1413755 (= c!131064 (= lt!623203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800090 () SeekEntryResult!10946)

(declare-fun e!800092 () SeekEntryResult!10946)

(assert (=> b!1413755 (= e!800090 e!800092)))

(declare-fun b!1413756 () Bool)

(assert (=> b!1413756 (= e!800092 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127745 lt!623071) #b00000000000000000000000000000001) (nextIndex!0 (index!46166 lt!623071) (x!127745 lt!623071) mask!2840) (index!46166 lt!623071) (select (arr!46635 a!2901) j!112) lt!623072 mask!2840))))

(declare-fun b!1413757 () Bool)

(assert (=> b!1413757 (= e!800090 (Found!10946 (index!46166 lt!623071)))))

(declare-fun lt!623202 () SeekEntryResult!10946)

(declare-fun d!152177 () Bool)

(assert (=> d!152177 (and (or ((_ is Undefined!10946) lt!623202) (not ((_ is Found!10946) lt!623202)) (and (bvsge (index!46165 lt!623202) #b00000000000000000000000000000000) (bvslt (index!46165 lt!623202) (size!47185 lt!623072)))) (or ((_ is Undefined!10946) lt!623202) ((_ is Found!10946) lt!623202) (not ((_ is MissingVacant!10946) lt!623202)) (not (= (index!46167 lt!623202) (index!46166 lt!623071))) (and (bvsge (index!46167 lt!623202) #b00000000000000000000000000000000) (bvslt (index!46167 lt!623202) (size!47185 lt!623072)))) (or ((_ is Undefined!10946) lt!623202) (ite ((_ is Found!10946) lt!623202) (= (select (arr!46635 lt!623072) (index!46165 lt!623202)) (select (arr!46635 a!2901) j!112)) (and ((_ is MissingVacant!10946) lt!623202) (= (index!46167 lt!623202) (index!46166 lt!623071)) (= (select (arr!46635 lt!623072) (index!46167 lt!623202)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!800091 () SeekEntryResult!10946)

(assert (=> d!152177 (= lt!623202 e!800091)))

(declare-fun c!131063 () Bool)

(assert (=> d!152177 (= c!131063 (bvsge (x!127745 lt!623071) #b01111111111111111111111111111110))))

(assert (=> d!152177 (= lt!623203 (select (arr!46635 lt!623072) (index!46166 lt!623071)))))

(assert (=> d!152177 (validMask!0 mask!2840)))

(assert (=> d!152177 (= (seekKeyOrZeroReturnVacant!0 (x!127745 lt!623071) (index!46166 lt!623071) (index!46166 lt!623071) (select (arr!46635 a!2901) j!112) lt!623072 mask!2840) lt!623202)))

(declare-fun b!1413758 () Bool)

(assert (=> b!1413758 (= e!800092 (MissingVacant!10946 (index!46166 lt!623071)))))

(declare-fun b!1413759 () Bool)

(assert (=> b!1413759 (= e!800091 e!800090)))

(declare-fun c!131065 () Bool)

(assert (=> b!1413759 (= c!131065 (= lt!623203 (select (arr!46635 a!2901) j!112)))))

(declare-fun b!1413760 () Bool)

(assert (=> b!1413760 (= e!800091 Undefined!10946)))

(assert (= (and d!152177 c!131063) b!1413760))

(assert (= (and d!152177 (not c!131063)) b!1413759))

(assert (= (and b!1413759 c!131065) b!1413757))

(assert (= (and b!1413759 (not c!131065)) b!1413755))

(assert (= (and b!1413755 c!131064) b!1413758))

(assert (= (and b!1413755 (not c!131064)) b!1413756))

(declare-fun m!1304161 () Bool)

(assert (=> b!1413756 m!1304161))

(assert (=> b!1413756 m!1304161))

(assert (=> b!1413756 m!1303931))

(declare-fun m!1304163 () Bool)

(assert (=> b!1413756 m!1304163))

(declare-fun m!1304165 () Bool)

(assert (=> d!152177 m!1304165))

(declare-fun m!1304167 () Bool)

(assert (=> d!152177 m!1304167))

(declare-fun m!1304169 () Bool)

(assert (=> d!152177 m!1304169))

(assert (=> d!152177 m!1303957))

(assert (=> b!1413486 d!152177))

(check-sat (not b!1413555) (not b!1413539) (not d!152125) (not d!152153) (not b!1413553) (not bm!67108) (not b!1413756) (not d!152175) (not bm!67096) (not d!152177) (not bm!67109) (not b!1413707) (not b!1413703) (not b!1413711) (not b!1413704) (not b!1413709) (not d!152137) (not b!1413645) (not b!1413624) (not d!152135) (not b!1413705) (not d!152123))
(check-sat)
