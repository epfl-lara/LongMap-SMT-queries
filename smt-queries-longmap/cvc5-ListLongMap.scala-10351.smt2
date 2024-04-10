; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121656 () Bool)

(assert start!121656)

(declare-fun b!1413456 () Bool)

(declare-fun res!950451 () Bool)

(declare-fun e!799912 () Bool)

(assert (=> b!1413456 (=> (not res!950451) (not e!799912))))

(declare-datatypes ((array!96594 0))(
  ( (array!96595 (arr!46634 (Array (_ BitVec 32) (_ BitVec 64))) (size!47184 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96594)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413456 (= res!950451 (validKeyInArray!0 (select (arr!46634 a!2901) j!112)))))

(declare-fun b!1413457 () Bool)

(declare-fun res!950452 () Bool)

(assert (=> b!1413457 (=> (not res!950452) (not e!799912))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413457 (= res!950452 (validKeyInArray!0 (select (arr!46634 a!2901) i!1037)))))

(declare-fun lt!623052 () (_ BitVec 64))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1413458 () Bool)

(declare-datatypes ((SeekEntryResult!10945 0))(
  ( (MissingZero!10945 (index!46160 (_ BitVec 32))) (Found!10945 (index!46161 (_ BitVec 32))) (Intermediate!10945 (undefined!11757 Bool) (index!46162 (_ BitVec 32)) (x!127744 (_ BitVec 32))) (Undefined!10945) (MissingVacant!10945 (index!46163 (_ BitVec 32))) )
))
(declare-fun lt!623047 () SeekEntryResult!10945)

(declare-fun lt!623049 () array!96594)

(declare-fun e!799911 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96594 (_ BitVec 32)) SeekEntryResult!10945)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96594 (_ BitVec 32)) SeekEntryResult!10945)

(assert (=> b!1413458 (= e!799911 (= (seekEntryOrOpen!0 lt!623052 lt!623049 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127744 lt!623047) (index!46162 lt!623047) (index!46162 lt!623047) (select (arr!46634 a!2901) j!112) lt!623049 mask!2840)))))

(declare-fun b!1413459 () Bool)

(declare-fun e!799916 () Bool)

(declare-fun e!799914 () Bool)

(assert (=> b!1413459 (= e!799916 e!799914)))

(declare-fun res!950447 () Bool)

(assert (=> b!1413459 (=> res!950447 e!799914)))

(declare-fun lt!623051 () SeekEntryResult!10945)

(assert (=> b!1413459 (= res!950447 (or (= lt!623051 lt!623047) (not (is-Intermediate!10945 lt!623047))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96594 (_ BitVec 32)) SeekEntryResult!10945)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413459 (= lt!623047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623052 mask!2840) lt!623052 lt!623049 mask!2840))))

(assert (=> b!1413459 (= lt!623052 (select (store (arr!46634 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413459 (= lt!623049 (array!96595 (store (arr!46634 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47184 a!2901)))))

(declare-fun b!1413460 () Bool)

(assert (=> b!1413460 (= e!799914 (and (bvsge (x!127744 lt!623051) #b00000000000000000000000000000000) (bvsle (x!127744 lt!623051) #b01111111111111111111111111111110)))))

(assert (=> b!1413460 e!799911))

(declare-fun res!950448 () Bool)

(assert (=> b!1413460 (=> (not res!950448) (not e!799911))))

(assert (=> b!1413460 (= res!950448 (and (not (undefined!11757 lt!623047)) (= (index!46162 lt!623047) i!1037) (bvslt (x!127744 lt!623047) (x!127744 lt!623051)) (= (select (store (arr!46634 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46162 lt!623047)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623048 () (_ BitVec 32))

(declare-datatypes ((Unit!47864 0))(
  ( (Unit!47865) )
))
(declare-fun lt!623050 () Unit!47864)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47864)

(assert (=> b!1413460 (= lt!623050 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623048 (x!127744 lt!623051) (index!46162 lt!623051) (x!127744 lt!623047) (index!46162 lt!623047) (undefined!11757 lt!623047) mask!2840))))

(declare-fun e!799915 () Bool)

(declare-fun b!1413461 () Bool)

(assert (=> b!1413461 (= e!799915 (= (seekEntryOrOpen!0 (select (arr!46634 a!2901) j!112) a!2901 mask!2840) (Found!10945 j!112)))))

(declare-fun b!1413462 () Bool)

(declare-fun res!950449 () Bool)

(assert (=> b!1413462 (=> (not res!950449) (not e!799912))))

(assert (=> b!1413462 (= res!950449 (and (= (size!47184 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47184 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47184 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413464 () Bool)

(declare-fun res!950450 () Bool)

(assert (=> b!1413464 (=> (not res!950450) (not e!799912))))

(declare-datatypes ((List!33153 0))(
  ( (Nil!33150) (Cons!33149 (h!34424 (_ BitVec 64)) (t!47847 List!33153)) )
))
(declare-fun arrayNoDuplicates!0 (array!96594 (_ BitVec 32) List!33153) Bool)

(assert (=> b!1413464 (= res!950450 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33150))))

(declare-fun b!1413465 () Bool)

(declare-fun res!950446 () Bool)

(assert (=> b!1413465 (=> (not res!950446) (not e!799912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96594 (_ BitVec 32)) Bool)

(assert (=> b!1413465 (= res!950446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!950453 () Bool)

(assert (=> start!121656 (=> (not res!950453) (not e!799912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121656 (= res!950453 (validMask!0 mask!2840))))

(assert (=> start!121656 e!799912))

(assert (=> start!121656 true))

(declare-fun array_inv!35662 (array!96594) Bool)

(assert (=> start!121656 (array_inv!35662 a!2901)))

(declare-fun b!1413463 () Bool)

(assert (=> b!1413463 (= e!799912 (not e!799916))))

(declare-fun res!950454 () Bool)

(assert (=> b!1413463 (=> res!950454 e!799916)))

(assert (=> b!1413463 (= res!950454 (or (not (is-Intermediate!10945 lt!623051)) (undefined!11757 lt!623051)))))

(assert (=> b!1413463 e!799915))

(declare-fun res!950455 () Bool)

(assert (=> b!1413463 (=> (not res!950455) (not e!799915))))

(assert (=> b!1413463 (= res!950455 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623046 () Unit!47864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47864)

(assert (=> b!1413463 (= lt!623046 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413463 (= lt!623051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623048 (select (arr!46634 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413463 (= lt!623048 (toIndex!0 (select (arr!46634 a!2901) j!112) mask!2840))))

(assert (= (and start!121656 res!950453) b!1413462))

(assert (= (and b!1413462 res!950449) b!1413457))

(assert (= (and b!1413457 res!950452) b!1413456))

(assert (= (and b!1413456 res!950451) b!1413465))

(assert (= (and b!1413465 res!950446) b!1413464))

(assert (= (and b!1413464 res!950450) b!1413463))

(assert (= (and b!1413463 res!950455) b!1413461))

(assert (= (and b!1413463 (not res!950454)) b!1413459))

(assert (= (and b!1413459 (not res!950447)) b!1413460))

(assert (= (and b!1413460 res!950448) b!1413458))

(declare-fun m!1303887 () Bool)

(assert (=> b!1413463 m!1303887))

(declare-fun m!1303889 () Bool)

(assert (=> b!1413463 m!1303889))

(assert (=> b!1413463 m!1303887))

(declare-fun m!1303891 () Bool)

(assert (=> b!1413463 m!1303891))

(assert (=> b!1413463 m!1303887))

(declare-fun m!1303893 () Bool)

(assert (=> b!1413463 m!1303893))

(declare-fun m!1303895 () Bool)

(assert (=> b!1413463 m!1303895))

(assert (=> b!1413461 m!1303887))

(assert (=> b!1413461 m!1303887))

(declare-fun m!1303897 () Bool)

(assert (=> b!1413461 m!1303897))

(assert (=> b!1413456 m!1303887))

(assert (=> b!1413456 m!1303887))

(declare-fun m!1303899 () Bool)

(assert (=> b!1413456 m!1303899))

(declare-fun m!1303901 () Bool)

(assert (=> b!1413459 m!1303901))

(assert (=> b!1413459 m!1303901))

(declare-fun m!1303903 () Bool)

(assert (=> b!1413459 m!1303903))

(declare-fun m!1303905 () Bool)

(assert (=> b!1413459 m!1303905))

(declare-fun m!1303907 () Bool)

(assert (=> b!1413459 m!1303907))

(declare-fun m!1303909 () Bool)

(assert (=> start!121656 m!1303909))

(declare-fun m!1303911 () Bool)

(assert (=> start!121656 m!1303911))

(declare-fun m!1303913 () Bool)

(assert (=> b!1413457 m!1303913))

(assert (=> b!1413457 m!1303913))

(declare-fun m!1303915 () Bool)

(assert (=> b!1413457 m!1303915))

(assert (=> b!1413460 m!1303905))

(declare-fun m!1303917 () Bool)

(assert (=> b!1413460 m!1303917))

(declare-fun m!1303919 () Bool)

(assert (=> b!1413460 m!1303919))

(declare-fun m!1303921 () Bool)

(assert (=> b!1413465 m!1303921))

(declare-fun m!1303923 () Bool)

(assert (=> b!1413464 m!1303923))

(declare-fun m!1303925 () Bool)

(assert (=> b!1413458 m!1303925))

(assert (=> b!1413458 m!1303887))

(assert (=> b!1413458 m!1303887))

(declare-fun m!1303927 () Bool)

(assert (=> b!1413458 m!1303927))

(push 1)

(assert (not b!1413459))

(assert (not b!1413458))

(assert (not b!1413465))

(assert (not b!1413461))

(assert (not b!1413456))

(assert (not b!1413457))

(assert (not b!1413464))

(assert (not b!1413463))

(assert (not start!121656))

(assert (not b!1413460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152127 () Bool)

(assert (=> d!152127 (= (validKeyInArray!0 (select (arr!46634 a!2901) j!112)) (and (not (= (select (arr!46634 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46634 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413456 d!152127))

(declare-fun b!1413568 () Bool)

(declare-fun c!130997 () Bool)

(declare-fun lt!623127 () (_ BitVec 64))

(assert (=> b!1413568 (= c!130997 (= lt!623127 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799977 () SeekEntryResult!10945)

(declare-fun e!799978 () SeekEntryResult!10945)

(assert (=> b!1413568 (= e!799977 e!799978)))

(declare-fun b!1413569 () Bool)

(declare-fun lt!623126 () SeekEntryResult!10945)

(assert (=> b!1413569 (= e!799978 (MissingZero!10945 (index!46162 lt!623126)))))

(declare-fun d!152131 () Bool)

(declare-fun lt!623125 () SeekEntryResult!10945)

(assert (=> d!152131 (and (or (is-Undefined!10945 lt!623125) (not (is-Found!10945 lt!623125)) (and (bvsge (index!46161 lt!623125) #b00000000000000000000000000000000) (bvslt (index!46161 lt!623125) (size!47184 a!2901)))) (or (is-Undefined!10945 lt!623125) (is-Found!10945 lt!623125) (not (is-MissingZero!10945 lt!623125)) (and (bvsge (index!46160 lt!623125) #b00000000000000000000000000000000) (bvslt (index!46160 lt!623125) (size!47184 a!2901)))) (or (is-Undefined!10945 lt!623125) (is-Found!10945 lt!623125) (is-MissingZero!10945 lt!623125) (not (is-MissingVacant!10945 lt!623125)) (and (bvsge (index!46163 lt!623125) #b00000000000000000000000000000000) (bvslt (index!46163 lt!623125) (size!47184 a!2901)))) (or (is-Undefined!10945 lt!623125) (ite (is-Found!10945 lt!623125) (= (select (arr!46634 a!2901) (index!46161 lt!623125)) (select (arr!46634 a!2901) j!112)) (ite (is-MissingZero!10945 lt!623125) (= (select (arr!46634 a!2901) (index!46160 lt!623125)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10945 lt!623125) (= (select (arr!46634 a!2901) (index!46163 lt!623125)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!799979 () SeekEntryResult!10945)

(assert (=> d!152131 (= lt!623125 e!799979)))

(declare-fun c!130996 () Bool)

(assert (=> d!152131 (= c!130996 (and (is-Intermediate!10945 lt!623126) (undefined!11757 lt!623126)))))

(assert (=> d!152131 (= lt!623126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46634 a!2901) j!112) mask!2840) (select (arr!46634 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152131 (validMask!0 mask!2840)))

(assert (=> d!152131 (= (seekEntryOrOpen!0 (select (arr!46634 a!2901) j!112) a!2901 mask!2840) lt!623125)))

(declare-fun b!1413570 () Bool)

(assert (=> b!1413570 (= e!799977 (Found!10945 (index!46162 lt!623126)))))

(declare-fun b!1413571 () Bool)

(assert (=> b!1413571 (= e!799979 e!799977)))

(assert (=> b!1413571 (= lt!623127 (select (arr!46634 a!2901) (index!46162 lt!623126)))))

(declare-fun c!130998 () Bool)

(assert (=> b!1413571 (= c!130998 (= lt!623127 (select (arr!46634 a!2901) j!112)))))

(declare-fun b!1413572 () Bool)

(assert (=> b!1413572 (= e!799979 Undefined!10945)))

(declare-fun b!1413573 () Bool)

(assert (=> b!1413573 (= e!799978 (seekKeyOrZeroReturnVacant!0 (x!127744 lt!623126) (index!46162 lt!623126) (index!46162 lt!623126) (select (arr!46634 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152131 c!130996) b!1413572))

(assert (= (and d!152131 (not c!130996)) b!1413571))

(assert (= (and b!1413571 c!130998) b!1413570))

(assert (= (and b!1413571 (not c!130998)) b!1413568))

(assert (= (and b!1413568 c!130997) b!1413569))

(assert (= (and b!1413568 (not c!130997)) b!1413573))

(assert (=> d!152131 m!1303889))

(assert (=> d!152131 m!1303887))

(declare-fun m!1304035 () Bool)

(assert (=> d!152131 m!1304035))

(declare-fun m!1304037 () Bool)

(assert (=> d!152131 m!1304037))

(assert (=> d!152131 m!1303909))

(declare-fun m!1304039 () Bool)

(assert (=> d!152131 m!1304039))

(declare-fun m!1304041 () Bool)

(assert (=> d!152131 m!1304041))

(assert (=> d!152131 m!1303887))

(assert (=> d!152131 m!1303889))

(declare-fun m!1304043 () Bool)

(assert (=> b!1413571 m!1304043))

(assert (=> b!1413573 m!1303887))

(declare-fun m!1304045 () Bool)

(assert (=> b!1413573 m!1304045))

(assert (=> b!1413461 d!152131))

(declare-fun d!152139 () Bool)

(assert (=> d!152139 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121656 d!152139))

(declare-fun d!152145 () Bool)

(assert (=> d!152145 (= (array_inv!35662 a!2901) (bvsge (size!47184 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121656 d!152145))

(declare-fun d!152147 () Bool)

(assert (=> d!152147 (and (not (undefined!11757 lt!623047)) (= (index!46162 lt!623047) i!1037) (bvslt (x!127744 lt!623047) (x!127744 lt!623051)))))

(declare-fun lt!623148 () Unit!47864)

(declare-fun choose!62 (array!96594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47864)

(assert (=> d!152147 (= lt!623148 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623048 (x!127744 lt!623051) (index!46162 lt!623051) (x!127744 lt!623047) (index!46162 lt!623047) (undefined!11757 lt!623047) mask!2840))))

(assert (=> d!152147 (validMask!0 mask!2840)))

(assert (=> d!152147 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623048 (x!127744 lt!623051) (index!46162 lt!623051) (x!127744 lt!623047) (index!46162 lt!623047) (undefined!11757 lt!623047) mask!2840) lt!623148)))

(declare-fun bs!41218 () Bool)

(assert (= bs!41218 d!152147))

(declare-fun m!1304077 () Bool)

(assert (=> bs!41218 m!1304077))

(assert (=> bs!41218 m!1303909))

(assert (=> b!1413460 d!152147))

(declare-fun d!152151 () Bool)

(declare-fun res!950539 () Bool)

(declare-fun e!800029 () Bool)

(assert (=> d!152151 (=> res!950539 e!800029)))

(assert (=> d!152151 (= res!950539 (bvsge #b00000000000000000000000000000000 (size!47184 a!2901)))))

(assert (=> d!152151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800029)))

(declare-fun b!1413660 () Bool)

(declare-fun e!800028 () Bool)

(declare-fun call!67102 () Bool)

(assert (=> b!1413660 (= e!800028 call!67102)))

(declare-fun b!1413661 () Bool)

(declare-fun e!800027 () Bool)

(assert (=> b!1413661 (= e!800029 e!800027)))

(declare-fun c!131034 () Bool)

(assert (=> b!1413661 (= c!131034 (validKeyInArray!0 (select (arr!46634 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67099 () Bool)

(assert (=> bm!67099 (= call!67102 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1413662 () Bool)

(assert (=> b!1413662 (= e!800027 call!67102)))

(declare-fun b!1413663 () Bool)

(assert (=> b!1413663 (= e!800027 e!800028)))

(declare-fun lt!623172 () (_ BitVec 64))

(assert (=> b!1413663 (= lt!623172 (select (arr!46634 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623173 () Unit!47864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96594 (_ BitVec 64) (_ BitVec 32)) Unit!47864)

(assert (=> b!1413663 (= lt!623173 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623172 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1413663 (arrayContainsKey!0 a!2901 lt!623172 #b00000000000000000000000000000000)))

(declare-fun lt!623171 () Unit!47864)

(assert (=> b!1413663 (= lt!623171 lt!623173)))

(declare-fun res!950540 () Bool)

(assert (=> b!1413663 (= res!950540 (= (seekEntryOrOpen!0 (select (arr!46634 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10945 #b00000000000000000000000000000000)))))

(assert (=> b!1413663 (=> (not res!950540) (not e!800028))))

(assert (= (and d!152151 (not res!950539)) b!1413661))

(assert (= (and b!1413661 c!131034) b!1413663))

(assert (= (and b!1413661 (not c!131034)) b!1413662))

(assert (= (and b!1413663 res!950540) b!1413660))

(assert (= (or b!1413660 b!1413662) bm!67099))

(declare-fun m!1304097 () Bool)

(assert (=> b!1413661 m!1304097))

(assert (=> b!1413661 m!1304097))

(declare-fun m!1304099 () Bool)

(assert (=> b!1413661 m!1304099))

(declare-fun m!1304101 () Bool)

(assert (=> bm!67099 m!1304101))

(assert (=> b!1413663 m!1304097))

(declare-fun m!1304103 () Bool)

(assert (=> b!1413663 m!1304103))

(declare-fun m!1304105 () Bool)

(assert (=> b!1413663 m!1304105))

(assert (=> b!1413663 m!1304097))

(declare-fun m!1304107 () Bool)

(assert (=> b!1413663 m!1304107))

(assert (=> b!1413465 d!152151))

(declare-fun b!1413682 () Bool)

(declare-fun e!800046 () Bool)

(declare-fun e!800047 () Bool)

(assert (=> b!1413682 (= e!800046 e!800047)))

(declare-fun res!950553 () Bool)

(assert (=> b!1413682 (=> (not res!950553) (not e!800047))))

(declare-fun e!800045 () Bool)

(assert (=> b!1413682 (= res!950553 (not e!800045))))

(declare-fun res!950551 () Bool)

(assert (=> b!1413682 (=> (not res!950551) (not e!800045))))

(assert (=> b!1413682 (= res!950551 (validKeyInArray!0 (select (arr!46634 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152161 () Bool)

(declare-fun res!950552 () Bool)

(assert (=> d!152161 (=> res!950552 e!800046)))

(assert (=> d!152161 (= res!950552 (bvsge #b00000000000000000000000000000000 (size!47184 a!2901)))))

(assert (=> d!152161 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33150) e!800046)))

(declare-fun b!1413683 () Bool)

(declare-fun e!800044 () Bool)

(declare-fun call!67107 () Bool)

(assert (=> b!1413683 (= e!800044 call!67107)))

(declare-fun bm!67104 () Bool)

(declare-fun c!131039 () Bool)

(assert (=> bm!67104 (= call!67107 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131039 (Cons!33149 (select (arr!46634 a!2901) #b00000000000000000000000000000000) Nil!33150) Nil!33150)))))

(declare-fun b!1413684 () Bool)

(assert (=> b!1413684 (= e!800047 e!800044)))

(assert (=> b!1413684 (= c!131039 (validKeyInArray!0 (select (arr!46634 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1413685 () Bool)

(assert (=> b!1413685 (= e!800044 call!67107)))

(declare-fun b!1413686 () Bool)

(declare-fun contains!9815 (List!33153 (_ BitVec 64)) Bool)

(assert (=> b!1413686 (= e!800045 (contains!9815 Nil!33150 (select (arr!46634 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152161 (not res!950552)) b!1413682))

(assert (= (and b!1413682 res!950551) b!1413686))

(assert (= (and b!1413682 res!950553) b!1413684))

(assert (= (and b!1413684 c!131039) b!1413683))

(assert (= (and b!1413684 (not c!131039)) b!1413685))

(assert (= (or b!1413683 b!1413685) bm!67104))

(assert (=> b!1413682 m!1304097))

(assert (=> b!1413682 m!1304097))

(assert (=> b!1413682 m!1304099))

(assert (=> bm!67104 m!1304097))

(declare-fun m!1304109 () Bool)

(assert (=> bm!67104 m!1304109))

(assert (=> b!1413684 m!1304097))

(assert (=> b!1413684 m!1304097))

(assert (=> b!1413684 m!1304099))

(assert (=> b!1413686 m!1304097))

(assert (=> b!1413686 m!1304097))

(declare-fun m!1304111 () Bool)

(assert (=> b!1413686 m!1304111))

(assert (=> b!1413464 d!152161))

(declare-fun b!1413738 () Bool)

(declare-fun lt!623201 () SeekEntryResult!10945)

(assert (=> b!1413738 (and (bvsge (index!46162 lt!623201) #b00000000000000000000000000000000) (bvslt (index!46162 lt!623201) (size!47184 lt!623049)))))

(declare-fun e!800084 () Bool)

(assert (=> b!1413738 (= e!800084 (= (select (arr!46634 lt!623049) (index!46162 lt!623201)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152167 () Bool)

(declare-fun e!800079 () Bool)

(assert (=> d!152167 e!800079))

(declare-fun c!131056 () Bool)

(assert (=> d!152167 (= c!131056 (and (is-Intermediate!10945 lt!623201) (undefined!11757 lt!623201)))))

(declare-fun e!800080 () SeekEntryResult!10945)

(assert (=> d!152167 (= lt!623201 e!800080)))

(declare-fun c!131055 () Bool)

(assert (=> d!152167 (= c!131055 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623200 () (_ BitVec 64))

(assert (=> d!152167 (= lt!623200 (select (arr!46634 lt!623049) (toIndex!0 lt!623052 mask!2840)))))

(assert (=> d!152167 (validMask!0 mask!2840)))

(assert (=> d!152167 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623052 mask!2840) lt!623052 lt!623049 mask!2840) lt!623201)))

(declare-fun b!1413739 () Bool)

(declare-fun e!800083 () Bool)

(assert (=> b!1413739 (= e!800079 e!800083)))

(declare-fun res!950575 () Bool)

(assert (=> b!1413739 (= res!950575 (and (is-Intermediate!10945 lt!623201) (not (undefined!11757 lt!623201)) (bvslt (x!127744 lt!623201) #b01111111111111111111111111111110) (bvsge (x!127744 lt!623201) #b00000000000000000000000000000000) (bvsge (x!127744 lt!623201) #b00000000000000000000000000000000)))))

(assert (=> b!1413739 (=> (not res!950575) (not e!800083))))

(declare-fun b!1413740 () Bool)

(assert (=> b!1413740 (and (bvsge (index!46162 lt!623201) #b00000000000000000000000000000000) (bvslt (index!46162 lt!623201) (size!47184 lt!623049)))))

(declare-fun res!950574 () Bool)

(assert (=> b!1413740 (= res!950574 (= (select (arr!46634 lt!623049) (index!46162 lt!623201)) lt!623052))))

(assert (=> b!1413740 (=> res!950574 e!800084)))

(assert (=> b!1413740 (= e!800083 e!800084)))

(declare-fun b!1413741 () Bool)

(assert (=> b!1413741 (= e!800080 (Intermediate!10945 true (toIndex!0 lt!623052 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413742 () Bool)

(declare-fun e!800081 () SeekEntryResult!10945)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413742 (= e!800081 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623052 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623052 lt!623049 mask!2840))))

(declare-fun b!1413743 () Bool)

(assert (=> b!1413743 (= e!800081 (Intermediate!10945 false (toIndex!0 lt!623052 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413744 () Bool)

(assert (=> b!1413744 (= e!800080 e!800081)))

(declare-fun c!131054 () Bool)

(assert (=> b!1413744 (= c!131054 (or (= lt!623200 lt!623052) (= (bvadd lt!623200 lt!623200) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1413745 () Bool)

(assert (=> b!1413745 (and (bvsge (index!46162 lt!623201) #b00000000000000000000000000000000) (bvslt (index!46162 lt!623201) (size!47184 lt!623049)))))

(declare-fun res!950573 () Bool)

(assert (=> b!1413745 (= res!950573 (= (select (arr!46634 lt!623049) (index!46162 lt!623201)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413745 (=> res!950573 e!800084)))

(declare-fun b!1413746 () Bool)

(assert (=> b!1413746 (= e!800079 (bvsge (x!127744 lt!623201) #b01111111111111111111111111111110))))

(assert (= (and d!152167 c!131055) b!1413741))

(assert (= (and d!152167 (not c!131055)) b!1413744))

(assert (= (and b!1413744 c!131054) b!1413743))

(assert (= (and b!1413744 (not c!131054)) b!1413742))

(assert (= (and d!152167 c!131056) b!1413746))

(assert (= (and d!152167 (not c!131056)) b!1413739))

(assert (= (and b!1413739 res!950575) b!1413740))

(assert (= (and b!1413740 (not res!950574)) b!1413745))

(assert (= (and b!1413745 (not res!950573)) b!1413738))

(assert (=> b!1413742 m!1303901))

(declare-fun m!1304153 () Bool)

(assert (=> b!1413742 m!1304153))

(assert (=> b!1413742 m!1304153))

(declare-fun m!1304155 () Bool)

(assert (=> b!1413742 m!1304155))

(declare-fun m!1304157 () Bool)

(assert (=> b!1413745 m!1304157))

(assert (=> b!1413738 m!1304157))

(assert (=> d!152167 m!1303901))

(declare-fun m!1304159 () Bool)

(assert (=> d!152167 m!1304159))

(assert (=> d!152167 m!1303909))

(assert (=> b!1413740 m!1304157))

(assert (=> b!1413459 d!152167))

(declare-fun d!152187 () Bool)

(declare-fun lt!623209 () (_ BitVec 32))

(declare-fun lt!623208 () (_ BitVec 32))

(assert (=> d!152187 (= lt!623209 (bvmul (bvxor lt!623208 (bvlshr lt!623208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152187 (= lt!623208 ((_ extract 31 0) (bvand (bvxor lt!623052 (bvlshr lt!623052 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152187 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950576 (let ((h!34428 ((_ extract 31 0) (bvand (bvxor lt!623052 (bvlshr lt!623052 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127755 (bvmul (bvxor h!34428 (bvlshr h!34428 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127755 (bvlshr x!127755 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950576 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950576 #b00000000000000000000000000000000))))))

(assert (=> d!152187 (= (toIndex!0 lt!623052 mask!2840) (bvand (bvxor lt!623209 (bvlshr lt!623209 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413459 d!152187))

(declare-fun d!152189 () Bool)

(assert (=> d!152189 (= (validKeyInArray!0 (select (arr!46634 a!2901) i!1037)) (and (not (= (select (arr!46634 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46634 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413457 d!152189))

(declare-fun b!1413761 () Bool)

(declare-fun c!131067 () Bool)

(declare-fun lt!623212 () (_ BitVec 64))

(assert (=> b!1413761 (= c!131067 (= lt!623212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800093 () SeekEntryResult!10945)

(declare-fun e!800094 () SeekEntryResult!10945)

(assert (=> b!1413761 (= e!800093 e!800094)))

(declare-fun b!1413762 () Bool)

(declare-fun lt!623211 () SeekEntryResult!10945)

(assert (=> b!1413762 (= e!800094 (MissingZero!10945 (index!46162 lt!623211)))))

(declare-fun d!152191 () Bool)

(declare-fun lt!623210 () SeekEntryResult!10945)

(assert (=> d!152191 (and (or (is-Undefined!10945 lt!623210) (not (is-Found!10945 lt!623210)) (and (bvsge (index!46161 lt!623210) #b00000000000000000000000000000000) (bvslt (index!46161 lt!623210) (size!47184 lt!623049)))) (or (is-Undefined!10945 lt!623210) (is-Found!10945 lt!623210) (not (is-MissingZero!10945 lt!623210)) (and (bvsge (index!46160 lt!623210) #b00000000000000000000000000000000) (bvslt (index!46160 lt!623210) (size!47184 lt!623049)))) (or (is-Undefined!10945 lt!623210) (is-Found!10945 lt!623210) (is-MissingZero!10945 lt!623210) (not (is-MissingVacant!10945 lt!623210)) (and (bvsge (index!46163 lt!623210) #b00000000000000000000000000000000) (bvslt (index!46163 lt!623210) (size!47184 lt!623049)))) (or (is-Undefined!10945 lt!623210) (ite (is-Found!10945 lt!623210) (= (select (arr!46634 lt!623049) (index!46161 lt!623210)) lt!623052) (ite (is-MissingZero!10945 lt!623210) (= (select (arr!46634 lt!623049) (index!46160 lt!623210)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10945 lt!623210) (= (select (arr!46634 lt!623049) (index!46163 lt!623210)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!800095 () SeekEntryResult!10945)

(assert (=> d!152191 (= lt!623210 e!800095)))

(declare-fun c!131066 () Bool)

(assert (=> d!152191 (= c!131066 (and (is-Intermediate!10945 lt!623211) (undefined!11757 lt!623211)))))

(assert (=> d!152191 (= lt!623211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623052 mask!2840) lt!623052 lt!623049 mask!2840))))

(assert (=> d!152191 (validMask!0 mask!2840)))

(assert (=> d!152191 (= (seekEntryOrOpen!0 lt!623052 lt!623049 mask!2840) lt!623210)))

(declare-fun b!1413763 () Bool)

(assert (=> b!1413763 (= e!800093 (Found!10945 (index!46162 lt!623211)))))

(declare-fun b!1413764 () Bool)

(assert (=> b!1413764 (= e!800095 e!800093)))

(assert (=> b!1413764 (= lt!623212 (select (arr!46634 lt!623049) (index!46162 lt!623211)))))

(declare-fun c!131068 () Bool)

(assert (=> b!1413764 (= c!131068 (= lt!623212 lt!623052))))

(declare-fun b!1413765 () Bool)

(assert (=> b!1413765 (= e!800095 Undefined!10945)))

(declare-fun b!1413766 () Bool)

(assert (=> b!1413766 (= e!800094 (seekKeyOrZeroReturnVacant!0 (x!127744 lt!623211) (index!46162 lt!623211) (index!46162 lt!623211) lt!623052 lt!623049 mask!2840))))

(assert (= (and d!152191 c!131066) b!1413765))

(assert (= (and d!152191 (not c!131066)) b!1413764))

(assert (= (and b!1413764 c!131068) b!1413763))

(assert (= (and b!1413764 (not c!131068)) b!1413761))

(assert (= (and b!1413761 c!131067) b!1413762))

(assert (= (and b!1413761 (not c!131067)) b!1413766))

(assert (=> d!152191 m!1303901))

(assert (=> d!152191 m!1303903))

(declare-fun m!1304171 () Bool)

(assert (=> d!152191 m!1304171))

(assert (=> d!152191 m!1303909))

(declare-fun m!1304173 () Bool)

(assert (=> d!152191 m!1304173))

(declare-fun m!1304175 () Bool)

(assert (=> d!152191 m!1304175))

(assert (=> d!152191 m!1303901))

(declare-fun m!1304177 () Bool)

(assert (=> b!1413764 m!1304177))

(declare-fun m!1304179 () Bool)

(assert (=> b!1413766 m!1304179))

(assert (=> b!1413458 d!152191))

(declare-fun e!800121 () SeekEntryResult!10945)

(declare-fun b!1413810 () Bool)

(assert (=> b!1413810 (= e!800121 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127744 lt!623047) #b00000000000000000000000000000001) (nextIndex!0 (index!46162 lt!623047) (x!127744 lt!623047) mask!2840) (index!46162 lt!623047) (select (arr!46634 a!2901) j!112) lt!623049 mask!2840))))

(declare-fun b!1413811 () Bool)

(declare-fun c!131085 () Bool)

(declare-fun lt!623233 () (_ BitVec 64))

(assert (=> b!1413811 (= c!131085 (= lt!623233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800122 () SeekEntryResult!10945)

(assert (=> b!1413811 (= e!800122 e!800121)))

(declare-fun b!1413812 () Bool)

(declare-fun e!800120 () SeekEntryResult!10945)

(assert (=> b!1413812 (= e!800120 Undefined!10945)))

(declare-fun lt!623232 () SeekEntryResult!10945)

(declare-fun d!152193 () Bool)

(assert (=> d!152193 (and (or (is-Undefined!10945 lt!623232) (not (is-Found!10945 lt!623232)) (and (bvsge (index!46161 lt!623232) #b00000000000000000000000000000000) (bvslt (index!46161 lt!623232) (size!47184 lt!623049)))) (or (is-Undefined!10945 lt!623232) (is-Found!10945 lt!623232) (not (is-MissingVacant!10945 lt!623232)) (not (= (index!46163 lt!623232) (index!46162 lt!623047))) (and (bvsge (index!46163 lt!623232) #b00000000000000000000000000000000) (bvslt (index!46163 lt!623232) (size!47184 lt!623049)))) (or (is-Undefined!10945 lt!623232) (ite (is-Found!10945 lt!623232) (= (select (arr!46634 lt!623049) (index!46161 lt!623232)) (select (arr!46634 a!2901) j!112)) (and (is-MissingVacant!10945 lt!623232) (= (index!46163 lt!623232) (index!46162 lt!623047)) (= (select (arr!46634 lt!623049) (index!46163 lt!623232)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152193 (= lt!623232 e!800120)))

(declare-fun c!131086 () Bool)

(assert (=> d!152193 (= c!131086 (bvsge (x!127744 lt!623047) #b01111111111111111111111111111110))))

(assert (=> d!152193 (= lt!623233 (select (arr!46634 lt!623049) (index!46162 lt!623047)))))

(assert (=> d!152193 (validMask!0 mask!2840)))

(assert (=> d!152193 (= (seekKeyOrZeroReturnVacant!0 (x!127744 lt!623047) (index!46162 lt!623047) (index!46162 lt!623047) (select (arr!46634 a!2901) j!112) lt!623049 mask!2840) lt!623232)))

(declare-fun b!1413813 () Bool)

(assert (=> b!1413813 (= e!800120 e!800122)))

(declare-fun c!131087 () Bool)

(assert (=> b!1413813 (= c!131087 (= lt!623233 (select (arr!46634 a!2901) j!112)))))

(declare-fun b!1413814 () Bool)

(assert (=> b!1413814 (= e!800122 (Found!10945 (index!46162 lt!623047)))))

(declare-fun b!1413815 () Bool)

(assert (=> b!1413815 (= e!800121 (MissingVacant!10945 (index!46162 lt!623047)))))

(assert (= (and d!152193 c!131086) b!1413812))

(assert (= (and d!152193 (not c!131086)) b!1413813))

(assert (= (and b!1413813 c!131087) b!1413814))

(assert (= (and b!1413813 (not c!131087)) b!1413811))

(assert (= (and b!1413811 c!131085) b!1413815))

(assert (= (and b!1413811 (not c!131085)) b!1413810))

(declare-fun m!1304195 () Bool)

(assert (=> b!1413810 m!1304195))

(assert (=> b!1413810 m!1304195))

(assert (=> b!1413810 m!1303887))

(declare-fun m!1304197 () Bool)

(assert (=> b!1413810 m!1304197))

(declare-fun m!1304199 () Bool)

(assert (=> d!152193 m!1304199))

(declare-fun m!1304201 () Bool)

(assert (=> d!152193 m!1304201))

(declare-fun m!1304203 () Bool)

(assert (=> d!152193 m!1304203))

(assert (=> d!152193 m!1303909))

(assert (=> b!1413458 d!152193))

(declare-fun d!152203 () Bool)

(declare-fun res!950589 () Bool)

(declare-fun e!800125 () Bool)

(assert (=> d!152203 (=> res!950589 e!800125)))

(assert (=> d!152203 (= res!950589 (bvsge j!112 (size!47184 a!2901)))))

(assert (=> d!152203 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800125)))

(declare-fun b!1413816 () Bool)

(declare-fun e!800124 () Bool)

(declare-fun call!67114 () Bool)

(assert (=> b!1413816 (= e!800124 call!67114)))

(declare-fun b!1413817 () Bool)

(declare-fun e!800123 () Bool)

(assert (=> b!1413817 (= e!800125 e!800123)))

(declare-fun c!131088 () Bool)

(assert (=> b!1413817 (= c!131088 (validKeyInArray!0 (select (arr!46634 a!2901) j!112)))))

(declare-fun bm!67111 () Bool)

(assert (=> bm!67111 (= call!67114 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1413818 () Bool)

(assert (=> b!1413818 (= e!800123 call!67114)))

(declare-fun b!1413819 () Bool)

(assert (=> b!1413819 (= e!800123 e!800124)))

(declare-fun lt!623235 () (_ BitVec 64))

(assert (=> b!1413819 (= lt!623235 (select (arr!46634 a!2901) j!112))))

(declare-fun lt!623236 () Unit!47864)

(assert (=> b!1413819 (= lt!623236 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623235 j!112))))

(assert (=> b!1413819 (arrayContainsKey!0 a!2901 lt!623235 #b00000000000000000000000000000000)))

(declare-fun lt!623234 () Unit!47864)

(assert (=> b!1413819 (= lt!623234 lt!623236)))

(declare-fun res!950590 () Bool)

(assert (=> b!1413819 (= res!950590 (= (seekEntryOrOpen!0 (select (arr!46634 a!2901) j!112) a!2901 mask!2840) (Found!10945 j!112)))))

(assert (=> b!1413819 (=> (not res!950590) (not e!800124))))

(assert (= (and d!152203 (not res!950589)) b!1413817))

(assert (= (and b!1413817 c!131088) b!1413819))

(assert (= (and b!1413817 (not c!131088)) b!1413818))

(assert (= (and b!1413819 res!950590) b!1413816))

(assert (= (or b!1413816 b!1413818) bm!67111))

(assert (=> b!1413817 m!1303887))

(assert (=> b!1413817 m!1303887))

(assert (=> b!1413817 m!1303899))

(declare-fun m!1304205 () Bool)

(assert (=> bm!67111 m!1304205))

(assert (=> b!1413819 m!1303887))

(declare-fun m!1304207 () Bool)

(assert (=> b!1413819 m!1304207))

(declare-fun m!1304209 () Bool)

(assert (=> b!1413819 m!1304209))

(assert (=> b!1413819 m!1303887))

(assert (=> b!1413819 m!1303897))

(assert (=> b!1413463 d!152203))

(declare-fun d!152205 () Bool)

(assert (=> d!152205 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623246 () Unit!47864)

(declare-fun choose!38 (array!96594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47864)

(assert (=> d!152205 (= lt!623246 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152205 (validMask!0 mask!2840)))

(assert (=> d!152205 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623246)))

(declare-fun bs!41221 () Bool)

(assert (= bs!41221 d!152205))

(assert (=> bs!41221 m!1303895))

(declare-fun m!1304221 () Bool)

(assert (=> bs!41221 m!1304221))

(assert (=> bs!41221 m!1303909))

(assert (=> b!1413463 d!152205))

(declare-fun b!1413829 () Bool)

(declare-fun lt!623248 () SeekEntryResult!10945)

(assert (=> b!1413829 (and (bvsge (index!46162 lt!623248) #b00000000000000000000000000000000) (bvslt (index!46162 lt!623248) (size!47184 a!2901)))))

(declare-fun e!800135 () Bool)

(assert (=> b!1413829 (= e!800135 (= (select (arr!46634 a!2901) (index!46162 lt!623248)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152213 () Bool)

(declare-fun e!800131 () Bool)

(assert (=> d!152213 e!800131))

(declare-fun c!131094 () Bool)

(assert (=> d!152213 (= c!131094 (and (is-Intermediate!10945 lt!623248) (undefined!11757 lt!623248)))))

(declare-fun e!800132 () SeekEntryResult!10945)

(assert (=> d!152213 (= lt!623248 e!800132)))

(declare-fun c!131093 () Bool)

(assert (=> d!152213 (= c!131093 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623247 () (_ BitVec 64))

(assert (=> d!152213 (= lt!623247 (select (arr!46634 a!2901) lt!623048))))

(assert (=> d!152213 (validMask!0 mask!2840)))

(assert (=> d!152213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623048 (select (arr!46634 a!2901) j!112) a!2901 mask!2840) lt!623248)))

(declare-fun b!1413830 () Bool)

(declare-fun e!800134 () Bool)

(assert (=> b!1413830 (= e!800131 e!800134)))

(declare-fun res!950596 () Bool)

(assert (=> b!1413830 (= res!950596 (and (is-Intermediate!10945 lt!623248) (not (undefined!11757 lt!623248)) (bvslt (x!127744 lt!623248) #b01111111111111111111111111111110) (bvsge (x!127744 lt!623248) #b00000000000000000000000000000000) (bvsge (x!127744 lt!623248) #b00000000000000000000000000000000)))))

(assert (=> b!1413830 (=> (not res!950596) (not e!800134))))

(declare-fun b!1413831 () Bool)

(assert (=> b!1413831 (and (bvsge (index!46162 lt!623248) #b00000000000000000000000000000000) (bvslt (index!46162 lt!623248) (size!47184 a!2901)))))

(declare-fun res!950595 () Bool)

(assert (=> b!1413831 (= res!950595 (= (select (arr!46634 a!2901) (index!46162 lt!623248)) (select (arr!46634 a!2901) j!112)))))

(assert (=> b!1413831 (=> res!950595 e!800135)))

(assert (=> b!1413831 (= e!800134 e!800135)))

(declare-fun b!1413832 () Bool)

(assert (=> b!1413832 (= e!800132 (Intermediate!10945 true lt!623048 #b00000000000000000000000000000000))))

(declare-fun b!1413833 () Bool)

(declare-fun e!800133 () SeekEntryResult!10945)

(assert (=> b!1413833 (= e!800133 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623048 #b00000000000000000000000000000000 mask!2840) (select (arr!46634 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1413834 () Bool)

(assert (=> b!1413834 (= e!800133 (Intermediate!10945 false lt!623048 #b00000000000000000000000000000000))))

(declare-fun b!1413835 () Bool)

(assert (=> b!1413835 (= e!800132 e!800133)))

(declare-fun c!131092 () Bool)

(assert (=> b!1413835 (= c!131092 (or (= lt!623247 (select (arr!46634 a!2901) j!112)) (= (bvadd lt!623247 lt!623247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1413836 () Bool)

(assert (=> b!1413836 (and (bvsge (index!46162 lt!623248) #b00000000000000000000000000000000) (bvslt (index!46162 lt!623248) (size!47184 a!2901)))))

(declare-fun res!950594 () Bool)

(assert (=> b!1413836 (= res!950594 (= (select (arr!46634 a!2901) (index!46162 lt!623248)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413836 (=> res!950594 e!800135)))

(declare-fun b!1413837 () Bool)

(assert (=> b!1413837 (= e!800131 (bvsge (x!127744 lt!623248) #b01111111111111111111111111111110))))

(assert (= (and d!152213 c!131093) b!1413832))

(assert (= (and d!152213 (not c!131093)) b!1413835))

(assert (= (and b!1413835 c!131092) b!1413834))

(assert (= (and b!1413835 (not c!131092)) b!1413833))

(assert (= (and d!152213 c!131094) b!1413837))

(assert (= (and d!152213 (not c!131094)) b!1413830))

(assert (= (and b!1413830 res!950596) b!1413831))

(assert (= (and b!1413831 (not res!950595)) b!1413836))

(assert (= (and b!1413836 (not res!950594)) b!1413829))

(declare-fun m!1304223 () Bool)

(assert (=> b!1413833 m!1304223))

(assert (=> b!1413833 m!1304223))

(assert (=> b!1413833 m!1303887))

(declare-fun m!1304225 () Bool)

(assert (=> b!1413833 m!1304225))

(declare-fun m!1304227 () Bool)

(assert (=> b!1413836 m!1304227))

(assert (=> b!1413829 m!1304227))

(declare-fun m!1304229 () Bool)

(assert (=> d!152213 m!1304229))

(assert (=> d!152213 m!1303909))

(assert (=> b!1413831 m!1304227))

(assert (=> b!1413463 d!152213))

(declare-fun d!152215 () Bool)

(declare-fun lt!623250 () (_ BitVec 32))

(declare-fun lt!623249 () (_ BitVec 32))

(assert (=> d!152215 (= lt!623250 (bvmul (bvxor lt!623249 (bvlshr lt!623249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152215 (= lt!623249 ((_ extract 31 0) (bvand (bvxor (select (arr!46634 a!2901) j!112) (bvlshr (select (arr!46634 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152215 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950576 (let ((h!34428 ((_ extract 31 0) (bvand (bvxor (select (arr!46634 a!2901) j!112) (bvlshr (select (arr!46634 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127755 (bvmul (bvxor h!34428 (bvlshr h!34428 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127755 (bvlshr x!127755 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950576 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950576 #b00000000000000000000000000000000))))))

(assert (=> d!152215 (= (toIndex!0 (select (arr!46634 a!2901) j!112) mask!2840) (bvand (bvxor lt!623250 (bvlshr lt!623250 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413463 d!152215))

(push 1)

