; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121728 () Bool)

(assert start!121728)

(declare-fun res!950634 () Bool)

(declare-fun e!800161 () Bool)

(assert (=> start!121728 (=> (not res!950634) (not e!800161))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121728 (= res!950634 (validMask!0 mask!2840))))

(assert (=> start!121728 e!800161))

(assert (=> start!121728 true))

(declare-datatypes ((array!96603 0))(
  ( (array!96604 (arr!46637 (Array (_ BitVec 32) (_ BitVec 64))) (size!47187 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96603)

(declare-fun array_inv!35665 (array!96603) Bool)

(assert (=> start!121728 (array_inv!35665 a!2901)))

(declare-fun b!1413873 () Bool)

(declare-fun res!950628 () Bool)

(assert (=> b!1413873 (=> (not res!950628) (not e!800161))))

(declare-datatypes ((List!33156 0))(
  ( (Nil!33153) (Cons!33152 (h!34430 (_ BitVec 64)) (t!47850 List!33156)) )
))
(declare-fun arrayNoDuplicates!0 (array!96603 (_ BitVec 32) List!33156) Bool)

(assert (=> b!1413873 (= res!950628 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33153))))

(declare-fun b!1413874 () Bool)

(declare-fun e!800163 () Bool)

(declare-fun e!800162 () Bool)

(assert (=> b!1413874 (= e!800163 e!800162)))

(declare-fun res!950626 () Bool)

(assert (=> b!1413874 (=> res!950626 e!800162)))

(declare-datatypes ((SeekEntryResult!10948 0))(
  ( (MissingZero!10948 (index!46175 (_ BitVec 32))) (Found!10948 (index!46176 (_ BitVec 32))) (Intermediate!10948 (undefined!11760 Bool) (index!46177 (_ BitVec 32)) (x!127767 (_ BitVec 32))) (Undefined!10948) (MissingVacant!10948 (index!46178 (_ BitVec 32))) )
))
(declare-fun lt!623266 () SeekEntryResult!10948)

(declare-fun lt!623270 () SeekEntryResult!10948)

(assert (=> b!1413874 (= res!950626 (or (= lt!623266 lt!623270) (not (is-Intermediate!10948 lt!623270))))))

(declare-fun lt!623267 () (_ BitVec 64))

(declare-fun lt!623269 () array!96603)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96603 (_ BitVec 32)) SeekEntryResult!10948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413874 (= lt!623270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623267 mask!2840) lt!623267 lt!623269 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413874 (= lt!623267 (select (store (arr!46637 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413874 (= lt!623269 (array!96604 (store (arr!46637 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47187 a!2901)))))

(declare-fun b!1413875 () Bool)

(declare-fun res!950630 () Bool)

(assert (=> b!1413875 (=> (not res!950630) (not e!800161))))

(assert (=> b!1413875 (= res!950630 (and (= (size!47187 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47187 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47187 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413876 () Bool)

(declare-fun res!950629 () Bool)

(assert (=> b!1413876 (=> (not res!950629) (not e!800161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413876 (= res!950629 (validKeyInArray!0 (select (arr!46637 a!2901) i!1037)))))

(declare-fun b!1413877 () Bool)

(declare-fun e!800165 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96603 (_ BitVec 32)) SeekEntryResult!10948)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96603 (_ BitVec 32)) SeekEntryResult!10948)

(assert (=> b!1413877 (= e!800165 (= (seekEntryOrOpen!0 lt!623267 lt!623269 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127767 lt!623270) (index!46177 lt!623270) (index!46177 lt!623270) (select (arr!46637 a!2901) j!112) lt!623269 mask!2840)))))

(declare-fun b!1413878 () Bool)

(assert (=> b!1413878 (= e!800162 (or (bvslt (x!127767 lt!623266) #b00000000000000000000000000000000) (bvsgt (x!127767 lt!623266) #b01111111111111111111111111111110) (and (bvsge (x!127767 lt!623270) #b00000000000000000000000000000000) (bvsle (x!127767 lt!623270) #b01111111111111111111111111111110))))))

(assert (=> b!1413878 e!800165))

(declare-fun res!950627 () Bool)

(assert (=> b!1413878 (=> (not res!950627) (not e!800165))))

(assert (=> b!1413878 (= res!950627 (and (not (undefined!11760 lt!623270)) (= (index!46177 lt!623270) i!1037) (bvslt (x!127767 lt!623270) (x!127767 lt!623266)) (= (select (store (arr!46637 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46177 lt!623270)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47870 0))(
  ( (Unit!47871) )
))
(declare-fun lt!623271 () Unit!47870)

(declare-fun lt!623265 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47870)

(assert (=> b!1413878 (= lt!623271 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623265 (x!127767 lt!623266) (index!46177 lt!623266) (x!127767 lt!623270) (index!46177 lt!623270) (undefined!11760 lt!623270) mask!2840))))

(declare-fun b!1413879 () Bool)

(assert (=> b!1413879 (= e!800161 (not e!800163))))

(declare-fun res!950632 () Bool)

(assert (=> b!1413879 (=> res!950632 e!800163)))

(assert (=> b!1413879 (= res!950632 (or (not (is-Intermediate!10948 lt!623266)) (undefined!11760 lt!623266)))))

(declare-fun e!800160 () Bool)

(assert (=> b!1413879 e!800160))

(declare-fun res!950635 () Bool)

(assert (=> b!1413879 (=> (not res!950635) (not e!800160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96603 (_ BitVec 32)) Bool)

(assert (=> b!1413879 (= res!950635 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623268 () Unit!47870)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47870)

(assert (=> b!1413879 (= lt!623268 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413879 (= lt!623266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623265 (select (arr!46637 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413879 (= lt!623265 (toIndex!0 (select (arr!46637 a!2901) j!112) mask!2840))))

(declare-fun b!1413880 () Bool)

(declare-fun res!950633 () Bool)

(assert (=> b!1413880 (=> (not res!950633) (not e!800161))))

(assert (=> b!1413880 (= res!950633 (validKeyInArray!0 (select (arr!46637 a!2901) j!112)))))

(declare-fun b!1413881 () Bool)

(assert (=> b!1413881 (= e!800160 (= (seekEntryOrOpen!0 (select (arr!46637 a!2901) j!112) a!2901 mask!2840) (Found!10948 j!112)))))

(declare-fun b!1413882 () Bool)

(declare-fun res!950631 () Bool)

(assert (=> b!1413882 (=> (not res!950631) (not e!800161))))

(assert (=> b!1413882 (= res!950631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121728 res!950634) b!1413875))

(assert (= (and b!1413875 res!950630) b!1413876))

(assert (= (and b!1413876 res!950629) b!1413880))

(assert (= (and b!1413880 res!950633) b!1413882))

(assert (= (and b!1413882 res!950631) b!1413873))

(assert (= (and b!1413873 res!950628) b!1413879))

(assert (= (and b!1413879 res!950635) b!1413881))

(assert (= (and b!1413879 (not res!950632)) b!1413874))

(assert (= (and b!1413874 (not res!950626)) b!1413878))

(assert (= (and b!1413878 res!950627) b!1413877))

(declare-fun m!1304235 () Bool)

(assert (=> b!1413878 m!1304235))

(declare-fun m!1304237 () Bool)

(assert (=> b!1413878 m!1304237))

(declare-fun m!1304239 () Bool)

(assert (=> b!1413878 m!1304239))

(declare-fun m!1304241 () Bool)

(assert (=> b!1413877 m!1304241))

(declare-fun m!1304243 () Bool)

(assert (=> b!1413877 m!1304243))

(assert (=> b!1413877 m!1304243))

(declare-fun m!1304245 () Bool)

(assert (=> b!1413877 m!1304245))

(assert (=> b!1413879 m!1304243))

(declare-fun m!1304247 () Bool)

(assert (=> b!1413879 m!1304247))

(assert (=> b!1413879 m!1304243))

(assert (=> b!1413879 m!1304243))

(declare-fun m!1304249 () Bool)

(assert (=> b!1413879 m!1304249))

(declare-fun m!1304251 () Bool)

(assert (=> b!1413879 m!1304251))

(declare-fun m!1304253 () Bool)

(assert (=> b!1413879 m!1304253))

(declare-fun m!1304255 () Bool)

(assert (=> b!1413882 m!1304255))

(assert (=> b!1413881 m!1304243))

(assert (=> b!1413881 m!1304243))

(declare-fun m!1304257 () Bool)

(assert (=> b!1413881 m!1304257))

(declare-fun m!1304259 () Bool)

(assert (=> b!1413874 m!1304259))

(assert (=> b!1413874 m!1304259))

(declare-fun m!1304261 () Bool)

(assert (=> b!1413874 m!1304261))

(assert (=> b!1413874 m!1304235))

(declare-fun m!1304263 () Bool)

(assert (=> b!1413874 m!1304263))

(assert (=> b!1413880 m!1304243))

(assert (=> b!1413880 m!1304243))

(declare-fun m!1304265 () Bool)

(assert (=> b!1413880 m!1304265))

(declare-fun m!1304267 () Bool)

(assert (=> b!1413876 m!1304267))

(assert (=> b!1413876 m!1304267))

(declare-fun m!1304269 () Bool)

(assert (=> b!1413876 m!1304269))

(declare-fun m!1304271 () Bool)

(assert (=> start!121728 m!1304271))

(declare-fun m!1304273 () Bool)

(assert (=> start!121728 m!1304273))

(declare-fun m!1304275 () Bool)

(assert (=> b!1413873 m!1304275))

(push 1)

(assert (not b!1413881))

(assert (not b!1413879))

(assert (not b!1413878))

(assert (not b!1413882))

(assert (not b!1413877))

(assert (not b!1413874))

(assert (not start!121728))

(assert (not b!1413876))

(assert (not b!1413880))

(assert (not b!1413873))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152227 () Bool)

(declare-fun res!950702 () Bool)

(declare-fun e!800221 () Bool)

(assert (=> d!152227 (=> res!950702 e!800221)))

(assert (=> d!152227 (= res!950702 (bvsge #b00000000000000000000000000000000 (size!47187 a!2901)))))

(assert (=> d!152227 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33153) e!800221)))

(declare-fun b!1413971 () Bool)

(declare-fun e!800222 () Bool)

(declare-fun call!67120 () Bool)

(assert (=> b!1413971 (= e!800222 call!67120)))

(declare-fun b!1413972 () Bool)

(declare-fun e!800220 () Bool)

(assert (=> b!1413972 (= e!800220 e!800222)))

(declare-fun c!131109 () Bool)

(assert (=> b!1413972 (= c!131109 (validKeyInArray!0 (select (arr!46637 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67117 () Bool)

(assert (=> bm!67117 (= call!67120 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131109 (Cons!33152 (select (arr!46637 a!2901) #b00000000000000000000000000000000) Nil!33153) Nil!33153)))))

(declare-fun b!1413973 () Bool)

(assert (=> b!1413973 (= e!800222 call!67120)))

(declare-fun b!1413974 () Bool)

(assert (=> b!1413974 (= e!800221 e!800220)))

(declare-fun res!950704 () Bool)

(assert (=> b!1413974 (=> (not res!950704) (not e!800220))))

(declare-fun e!800219 () Bool)

(assert (=> b!1413974 (= res!950704 (not e!800219))))

(declare-fun res!950703 () Bool)

(assert (=> b!1413974 (=> (not res!950703) (not e!800219))))

(assert (=> b!1413974 (= res!950703 (validKeyInArray!0 (select (arr!46637 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1413975 () Bool)

(declare-fun contains!9816 (List!33156 (_ BitVec 64)) Bool)

(assert (=> b!1413975 (= e!800219 (contains!9816 Nil!33153 (select (arr!46637 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152227 (not res!950702)) b!1413974))

(assert (= (and b!1413974 res!950703) b!1413975))

(assert (= (and b!1413974 res!950704) b!1413972))

(assert (= (and b!1413972 c!131109) b!1413973))

(assert (= (and b!1413972 (not c!131109)) b!1413971))

(assert (= (or b!1413973 b!1413971) bm!67117))

(declare-fun m!1304373 () Bool)

(assert (=> b!1413972 m!1304373))

(assert (=> b!1413972 m!1304373))

(declare-fun m!1304375 () Bool)

(assert (=> b!1413972 m!1304375))

(assert (=> bm!67117 m!1304373))

(declare-fun m!1304377 () Bool)

(assert (=> bm!67117 m!1304377))

(assert (=> b!1413974 m!1304373))

(assert (=> b!1413974 m!1304373))

(assert (=> b!1413974 m!1304375))

(assert (=> b!1413975 m!1304373))

(assert (=> b!1413975 m!1304373))

(declare-fun m!1304379 () Bool)

(assert (=> b!1413975 m!1304379))

(assert (=> b!1413873 d!152227))

(declare-fun d!152231 () Bool)

(assert (=> d!152231 (and (not (undefined!11760 lt!623270)) (= (index!46177 lt!623270) i!1037) (bvslt (x!127767 lt!623270) (x!127767 lt!623266)))))

(declare-fun lt!623328 () Unit!47870)

(declare-fun choose!62 (array!96603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47870)

(assert (=> d!152231 (= lt!623328 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623265 (x!127767 lt!623266) (index!46177 lt!623266) (x!127767 lt!623270) (index!46177 lt!623270) (undefined!11760 lt!623270) mask!2840))))

(assert (=> d!152231 (validMask!0 mask!2840)))

(assert (=> d!152231 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623265 (x!127767 lt!623266) (index!46177 lt!623266) (x!127767 lt!623270) (index!46177 lt!623270) (undefined!11760 lt!623270) mask!2840) lt!623328)))

(declare-fun bs!41226 () Bool)

(assert (= bs!41226 d!152231))

(declare-fun m!1304381 () Bool)

(assert (=> bs!41226 m!1304381))

(assert (=> bs!41226 m!1304271))

(assert (=> b!1413878 d!152231))

(declare-fun d!152233 () Bool)

(assert (=> d!152233 (= (validKeyInArray!0 (select (arr!46637 a!2901) j!112)) (and (not (= (select (arr!46637 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46637 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413880 d!152233))

(declare-fun e!800277 () SeekEntryResult!10948)

(declare-fun b!1414057 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414057 (= e!800277 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623267 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623267 lt!623269 mask!2840))))

(declare-fun b!1414058 () Bool)

(declare-fun e!800278 () SeekEntryResult!10948)

(assert (=> b!1414058 (= e!800278 e!800277)))

(declare-fun c!131138 () Bool)

(declare-fun lt!623367 () (_ BitVec 64))

(assert (=> b!1414058 (= c!131138 (or (= lt!623367 lt!623267) (= (bvadd lt!623367 lt!623367) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414059 () Bool)

(declare-fun lt!623366 () SeekEntryResult!10948)

(assert (=> b!1414059 (and (bvsge (index!46177 lt!623366) #b00000000000000000000000000000000) (bvslt (index!46177 lt!623366) (size!47187 lt!623269)))))

(declare-fun res!950734 () Bool)

(assert (=> b!1414059 (= res!950734 (= (select (arr!46637 lt!623269) (index!46177 lt!623366)) lt!623267))))

(declare-fun e!800279 () Bool)

(assert (=> b!1414059 (=> res!950734 e!800279)))

(declare-fun e!800276 () Bool)

(assert (=> b!1414059 (= e!800276 e!800279)))

(declare-fun b!1414060 () Bool)

(declare-fun e!800275 () Bool)

(assert (=> b!1414060 (= e!800275 e!800276)))

(declare-fun res!950733 () Bool)

(assert (=> b!1414060 (= res!950733 (and (is-Intermediate!10948 lt!623366) (not (undefined!11760 lt!623366)) (bvslt (x!127767 lt!623366) #b01111111111111111111111111111110) (bvsge (x!127767 lt!623366) #b00000000000000000000000000000000) (bvsge (x!127767 lt!623366) #b00000000000000000000000000000000)))))

(assert (=> b!1414060 (=> (not res!950733) (not e!800276))))

(declare-fun d!152235 () Bool)

(assert (=> d!152235 e!800275))

(declare-fun c!131139 () Bool)

(assert (=> d!152235 (= c!131139 (and (is-Intermediate!10948 lt!623366) (undefined!11760 lt!623366)))))

(assert (=> d!152235 (= lt!623366 e!800278)))

(declare-fun c!131137 () Bool)

(assert (=> d!152235 (= c!131137 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152235 (= lt!623367 (select (arr!46637 lt!623269) (toIndex!0 lt!623267 mask!2840)))))

(assert (=> d!152235 (validMask!0 mask!2840)))

(assert (=> d!152235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623267 mask!2840) lt!623267 lt!623269 mask!2840) lt!623366)))

(declare-fun b!1414061 () Bool)

(assert (=> b!1414061 (= e!800278 (Intermediate!10948 true (toIndex!0 lt!623267 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414062 () Bool)

(assert (=> b!1414062 (= e!800275 (bvsge (x!127767 lt!623366) #b01111111111111111111111111111110))))

(declare-fun b!1414063 () Bool)

(assert (=> b!1414063 (= e!800277 (Intermediate!10948 false (toIndex!0 lt!623267 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414064 () Bool)

(assert (=> b!1414064 (and (bvsge (index!46177 lt!623366) #b00000000000000000000000000000000) (bvslt (index!46177 lt!623366) (size!47187 lt!623269)))))

(assert (=> b!1414064 (= e!800279 (= (select (arr!46637 lt!623269) (index!46177 lt!623366)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414065 () Bool)

(assert (=> b!1414065 (and (bvsge (index!46177 lt!623366) #b00000000000000000000000000000000) (bvslt (index!46177 lt!623366) (size!47187 lt!623269)))))

(declare-fun res!950732 () Bool)

(assert (=> b!1414065 (= res!950732 (= (select (arr!46637 lt!623269) (index!46177 lt!623366)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414065 (=> res!950732 e!800279)))

(assert (= (and d!152235 c!131137) b!1414061))

(assert (= (and d!152235 (not c!131137)) b!1414058))

(assert (= (and b!1414058 c!131138) b!1414063))

(assert (= (and b!1414058 (not c!131138)) b!1414057))

(assert (= (and d!152235 c!131139) b!1414062))

(assert (= (and d!152235 (not c!131139)) b!1414060))

(assert (= (and b!1414060 res!950733) b!1414059))

(assert (= (and b!1414059 (not res!950734)) b!1414065))

(assert (= (and b!1414065 (not res!950732)) b!1414064))

(declare-fun m!1304429 () Bool)

(assert (=> b!1414065 m!1304429))

(assert (=> b!1414059 m!1304429))

(assert (=> b!1414064 m!1304429))

(assert (=> d!152235 m!1304259))

(declare-fun m!1304431 () Bool)

(assert (=> d!152235 m!1304431))

(assert (=> d!152235 m!1304271))

(assert (=> b!1414057 m!1304259))

(declare-fun m!1304433 () Bool)

(assert (=> b!1414057 m!1304433))

(assert (=> b!1414057 m!1304433))

(declare-fun m!1304435 () Bool)

(assert (=> b!1414057 m!1304435))

(assert (=> b!1413874 d!152235))

(declare-fun d!152253 () Bool)

(declare-fun lt!623373 () (_ BitVec 32))

(declare-fun lt!623372 () (_ BitVec 32))

(assert (=> d!152253 (= lt!623373 (bvmul (bvxor lt!623372 (bvlshr lt!623372 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152253 (= lt!623372 ((_ extract 31 0) (bvand (bvxor lt!623267 (bvlshr lt!623267 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152253 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950735 (let ((h!34433 ((_ extract 31 0) (bvand (bvxor lt!623267 (bvlshr lt!623267 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127774 (bvmul (bvxor h!34433 (bvlshr h!34433 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127774 (bvlshr x!127774 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950735 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950735 #b00000000000000000000000000000000))))))

(assert (=> d!152253 (= (toIndex!0 lt!623267 mask!2840) (bvand (bvxor lt!623373 (bvlshr lt!623373 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413874 d!152253))

(declare-fun d!152255 () Bool)

(assert (=> d!152255 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121728 d!152255))

(declare-fun d!152257 () Bool)

(assert (=> d!152257 (= (array_inv!35665 a!2901) (bvsge (size!47187 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121728 d!152257))

(declare-fun b!1414128 () Bool)

(declare-fun e!800318 () Bool)

(declare-fun call!67132 () Bool)

(assert (=> b!1414128 (= e!800318 call!67132)))

(declare-fun d!152259 () Bool)

(declare-fun res!950760 () Bool)

(declare-fun e!800316 () Bool)

(assert (=> d!152259 (=> res!950760 e!800316)))

(assert (=> d!152259 (= res!950760 (bvsge j!112 (size!47187 a!2901)))))

(assert (=> d!152259 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800316)))

(declare-fun b!1414129 () Bool)

(assert (=> b!1414129 (= e!800316 e!800318)))

(declare-fun c!131160 () Bool)

(assert (=> b!1414129 (= c!131160 (validKeyInArray!0 (select (arr!46637 a!2901) j!112)))))

(declare-fun bm!67129 () Bool)

(assert (=> bm!67129 (= call!67132 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414130 () Bool)

(declare-fun e!800317 () Bool)

(assert (=> b!1414130 (= e!800317 call!67132)))

(declare-fun b!1414131 () Bool)

(assert (=> b!1414131 (= e!800318 e!800317)))

(declare-fun lt!623404 () (_ BitVec 64))

(assert (=> b!1414131 (= lt!623404 (select (arr!46637 a!2901) j!112))))

(declare-fun lt!623402 () Unit!47870)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96603 (_ BitVec 64) (_ BitVec 32)) Unit!47870)

(assert (=> b!1414131 (= lt!623402 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623404 j!112))))

(declare-fun arrayContainsKey!0 (array!96603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1414131 (arrayContainsKey!0 a!2901 lt!623404 #b00000000000000000000000000000000)))

(declare-fun lt!623403 () Unit!47870)

(assert (=> b!1414131 (= lt!623403 lt!623402)))

(declare-fun res!950761 () Bool)

(assert (=> b!1414131 (= res!950761 (= (seekEntryOrOpen!0 (select (arr!46637 a!2901) j!112) a!2901 mask!2840) (Found!10948 j!112)))))

(assert (=> b!1414131 (=> (not res!950761) (not e!800317))))

(assert (= (and d!152259 (not res!950760)) b!1414129))

(assert (= (and b!1414129 c!131160) b!1414131))

(assert (= (and b!1414129 (not c!131160)) b!1414128))

(assert (= (and b!1414131 res!950761) b!1414130))

(assert (= (or b!1414130 b!1414128) bm!67129))

(assert (=> b!1414129 m!1304243))

(assert (=> b!1414129 m!1304243))

(assert (=> b!1414129 m!1304265))

(declare-fun m!1304453 () Bool)

(assert (=> bm!67129 m!1304453))

(assert (=> b!1414131 m!1304243))

(declare-fun m!1304455 () Bool)

(assert (=> b!1414131 m!1304455))

(declare-fun m!1304457 () Bool)

(assert (=> b!1414131 m!1304457))

(assert (=> b!1414131 m!1304243))

(assert (=> b!1414131 m!1304257))

(assert (=> b!1413879 d!152259))

(declare-fun d!152269 () Bool)

(assert (=> d!152269 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623412 () Unit!47870)

(declare-fun choose!38 (array!96603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47870)

(assert (=> d!152269 (= lt!623412 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152269 (validMask!0 mask!2840)))

(assert (=> d!152269 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623412)))

(declare-fun bs!41230 () Bool)

(assert (= bs!41230 d!152269))

(assert (=> bs!41230 m!1304253))

(declare-fun m!1304461 () Bool)

(assert (=> bs!41230 m!1304461))

(assert (=> bs!41230 m!1304271))

(assert (=> b!1413879 d!152269))

(declare-fun e!800321 () SeekEntryResult!10948)

(declare-fun b!1414132 () Bool)

(assert (=> b!1414132 (= e!800321 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623265 #b00000000000000000000000000000000 mask!2840) (select (arr!46637 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414133 () Bool)

(declare-fun e!800322 () SeekEntryResult!10948)

(assert (=> b!1414133 (= e!800322 e!800321)))

(declare-fun c!131162 () Bool)

(declare-fun lt!623414 () (_ BitVec 64))

(assert (=> b!1414133 (= c!131162 (or (= lt!623414 (select (arr!46637 a!2901) j!112)) (= (bvadd lt!623414 lt!623414) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414134 () Bool)

(declare-fun lt!623413 () SeekEntryResult!10948)

(assert (=> b!1414134 (and (bvsge (index!46177 lt!623413) #b00000000000000000000000000000000) (bvslt (index!46177 lt!623413) (size!47187 a!2901)))))

(declare-fun res!950764 () Bool)

(assert (=> b!1414134 (= res!950764 (= (select (arr!46637 a!2901) (index!46177 lt!623413)) (select (arr!46637 a!2901) j!112)))))

(declare-fun e!800323 () Bool)

(assert (=> b!1414134 (=> res!950764 e!800323)))

(declare-fun e!800320 () Bool)

(assert (=> b!1414134 (= e!800320 e!800323)))

(declare-fun b!1414135 () Bool)

(declare-fun e!800319 () Bool)

(assert (=> b!1414135 (= e!800319 e!800320)))

(declare-fun res!950763 () Bool)

(assert (=> b!1414135 (= res!950763 (and (is-Intermediate!10948 lt!623413) (not (undefined!11760 lt!623413)) (bvslt (x!127767 lt!623413) #b01111111111111111111111111111110) (bvsge (x!127767 lt!623413) #b00000000000000000000000000000000) (bvsge (x!127767 lt!623413) #b00000000000000000000000000000000)))))

(assert (=> b!1414135 (=> (not res!950763) (not e!800320))))

(declare-fun d!152273 () Bool)

(assert (=> d!152273 e!800319))

(declare-fun c!131163 () Bool)

(assert (=> d!152273 (= c!131163 (and (is-Intermediate!10948 lt!623413) (undefined!11760 lt!623413)))))

(assert (=> d!152273 (= lt!623413 e!800322)))

(declare-fun c!131161 () Bool)

(assert (=> d!152273 (= c!131161 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152273 (= lt!623414 (select (arr!46637 a!2901) lt!623265))))

(assert (=> d!152273 (validMask!0 mask!2840)))

(assert (=> d!152273 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623265 (select (arr!46637 a!2901) j!112) a!2901 mask!2840) lt!623413)))

(declare-fun b!1414136 () Bool)

(assert (=> b!1414136 (= e!800322 (Intermediate!10948 true lt!623265 #b00000000000000000000000000000000))))

(declare-fun b!1414137 () Bool)

(assert (=> b!1414137 (= e!800319 (bvsge (x!127767 lt!623413) #b01111111111111111111111111111110))))

(declare-fun b!1414138 () Bool)

(assert (=> b!1414138 (= e!800321 (Intermediate!10948 false lt!623265 #b00000000000000000000000000000000))))

(declare-fun b!1414139 () Bool)

(assert (=> b!1414139 (and (bvsge (index!46177 lt!623413) #b00000000000000000000000000000000) (bvslt (index!46177 lt!623413) (size!47187 a!2901)))))

(assert (=> b!1414139 (= e!800323 (= (select (arr!46637 a!2901) (index!46177 lt!623413)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414140 () Bool)

(assert (=> b!1414140 (and (bvsge (index!46177 lt!623413) #b00000000000000000000000000000000) (bvslt (index!46177 lt!623413) (size!47187 a!2901)))))

(declare-fun res!950762 () Bool)

(assert (=> b!1414140 (= res!950762 (= (select (arr!46637 a!2901) (index!46177 lt!623413)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414140 (=> res!950762 e!800323)))

(assert (= (and d!152273 c!131161) b!1414136))

(assert (= (and d!152273 (not c!131161)) b!1414133))

(assert (= (and b!1414133 c!131162) b!1414138))

(assert (= (and b!1414133 (not c!131162)) b!1414132))

(assert (= (and d!152273 c!131163) b!1414137))

(assert (= (and d!152273 (not c!131163)) b!1414135))

(assert (= (and b!1414135 res!950763) b!1414134))

(assert (= (and b!1414134 (not res!950764)) b!1414140))

(assert (= (and b!1414140 (not res!950762)) b!1414139))

(declare-fun m!1304463 () Bool)

(assert (=> b!1414140 m!1304463))

(assert (=> b!1414134 m!1304463))

(assert (=> b!1414139 m!1304463))

(declare-fun m!1304465 () Bool)

(assert (=> d!152273 m!1304465))

(assert (=> d!152273 m!1304271))

(declare-fun m!1304467 () Bool)

(assert (=> b!1414132 m!1304467))

(assert (=> b!1414132 m!1304467))

(assert (=> b!1414132 m!1304243))

(declare-fun m!1304469 () Bool)

(assert (=> b!1414132 m!1304469))

(assert (=> b!1413879 d!152273))

(declare-fun d!152275 () Bool)

(declare-fun lt!623416 () (_ BitVec 32))

(declare-fun lt!623415 () (_ BitVec 32))

(assert (=> d!152275 (= lt!623416 (bvmul (bvxor lt!623415 (bvlshr lt!623415 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152275 (= lt!623415 ((_ extract 31 0) (bvand (bvxor (select (arr!46637 a!2901) j!112) (bvlshr (select (arr!46637 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152275 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950735 (let ((h!34433 ((_ extract 31 0) (bvand (bvxor (select (arr!46637 a!2901) j!112) (bvlshr (select (arr!46637 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127774 (bvmul (bvxor h!34433 (bvlshr h!34433 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127774 (bvlshr x!127774 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950735 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950735 #b00000000000000000000000000000000))))))

(assert (=> d!152275 (= (toIndex!0 (select (arr!46637 a!2901) j!112) mask!2840) (bvand (bvxor lt!623416 (bvlshr lt!623416 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413879 d!152275))

(declare-fun d!152277 () Bool)

(assert (=> d!152277 (= (validKeyInArray!0 (select (arr!46637 a!2901) i!1037)) (and (not (= (select (arr!46637 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46637 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413876 d!152277))

(declare-fun lt!623442 () SeekEntryResult!10948)

(declare-fun b!1414205 () Bool)

(declare-fun e!800364 () SeekEntryResult!10948)

(assert (=> b!1414205 (= e!800364 (seekKeyOrZeroReturnVacant!0 (x!127767 lt!623442) (index!46177 lt!623442) (index!46177 lt!623442) (select (arr!46637 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414206 () Bool)

(declare-fun e!800363 () SeekEntryResult!10948)

(assert (=> b!1414206 (= e!800363 (Found!10948 (index!46177 lt!623442)))))

(declare-fun b!1414208 () Bool)

(declare-fun e!800362 () SeekEntryResult!10948)

(assert (=> b!1414208 (= e!800362 e!800363)))

(declare-fun lt!623444 () (_ BitVec 64))

(assert (=> b!1414208 (= lt!623444 (select (arr!46637 a!2901) (index!46177 lt!623442)))))

(declare-fun c!131190 () Bool)

(assert (=> b!1414208 (= c!131190 (= lt!623444 (select (arr!46637 a!2901) j!112)))))

(declare-fun b!1414209 () Bool)

(declare-fun c!131189 () Bool)

(assert (=> b!1414209 (= c!131189 (= lt!623444 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414209 (= e!800363 e!800364)))

(declare-fun b!1414210 () Bool)

(assert (=> b!1414210 (= e!800362 Undefined!10948)))

(declare-fun d!152279 () Bool)

(declare-fun lt!623443 () SeekEntryResult!10948)

(assert (=> d!152279 (and (or (is-Undefined!10948 lt!623443) (not (is-Found!10948 lt!623443)) (and (bvsge (index!46176 lt!623443) #b00000000000000000000000000000000) (bvslt (index!46176 lt!623443) (size!47187 a!2901)))) (or (is-Undefined!10948 lt!623443) (is-Found!10948 lt!623443) (not (is-MissingZero!10948 lt!623443)) (and (bvsge (index!46175 lt!623443) #b00000000000000000000000000000000) (bvslt (index!46175 lt!623443) (size!47187 a!2901)))) (or (is-Undefined!10948 lt!623443) (is-Found!10948 lt!623443) (is-MissingZero!10948 lt!623443) (not (is-MissingVacant!10948 lt!623443)) (and (bvsge (index!46178 lt!623443) #b00000000000000000000000000000000) (bvslt (index!46178 lt!623443) (size!47187 a!2901)))) (or (is-Undefined!10948 lt!623443) (ite (is-Found!10948 lt!623443) (= (select (arr!46637 a!2901) (index!46176 lt!623443)) (select (arr!46637 a!2901) j!112)) (ite (is-MissingZero!10948 lt!623443) (= (select (arr!46637 a!2901) (index!46175 lt!623443)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10948 lt!623443) (= (select (arr!46637 a!2901) (index!46178 lt!623443)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152279 (= lt!623443 e!800362)))

(declare-fun c!131191 () Bool)

(assert (=> d!152279 (= c!131191 (and (is-Intermediate!10948 lt!623442) (undefined!11760 lt!623442)))))

(assert (=> d!152279 (= lt!623442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46637 a!2901) j!112) mask!2840) (select (arr!46637 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152279 (validMask!0 mask!2840)))

(assert (=> d!152279 (= (seekEntryOrOpen!0 (select (arr!46637 a!2901) j!112) a!2901 mask!2840) lt!623443)))

(declare-fun b!1414207 () Bool)

(assert (=> b!1414207 (= e!800364 (MissingZero!10948 (index!46177 lt!623442)))))

(assert (= (and d!152279 c!131191) b!1414210))

(assert (= (and d!152279 (not c!131191)) b!1414208))

(assert (= (and b!1414208 c!131190) b!1414206))

(assert (= (and b!1414208 (not c!131190)) b!1414209))

(assert (= (and b!1414209 c!131189) b!1414207))

(assert (= (and b!1414209 (not c!131189)) b!1414205))

(assert (=> b!1414205 m!1304243))

(declare-fun m!1304517 () Bool)

(assert (=> b!1414205 m!1304517))

(declare-fun m!1304519 () Bool)

(assert (=> b!1414208 m!1304519))

(declare-fun m!1304521 () Bool)

(assert (=> d!152279 m!1304521))

(declare-fun m!1304523 () Bool)

(assert (=> d!152279 m!1304523))

(assert (=> d!152279 m!1304247))

(assert (=> d!152279 m!1304243))

(declare-fun m!1304525 () Bool)

(assert (=> d!152279 m!1304525))

(declare-fun m!1304527 () Bool)

(assert (=> d!152279 m!1304527))

(assert (=> d!152279 m!1304271))

(assert (=> d!152279 m!1304243))

(assert (=> d!152279 m!1304247))

(assert (=> b!1413881 d!152279))

(declare-fun b!1414211 () Bool)

(declare-fun e!800367 () SeekEntryResult!10948)

(declare-fun lt!623445 () SeekEntryResult!10948)

(assert (=> b!1414211 (= e!800367 (seekKeyOrZeroReturnVacant!0 (x!127767 lt!623445) (index!46177 lt!623445) (index!46177 lt!623445) lt!623267 lt!623269 mask!2840))))

(declare-fun b!1414212 () Bool)

(declare-fun e!800366 () SeekEntryResult!10948)

(assert (=> b!1414212 (= e!800366 (Found!10948 (index!46177 lt!623445)))))

(declare-fun b!1414214 () Bool)

(declare-fun e!800365 () SeekEntryResult!10948)

(assert (=> b!1414214 (= e!800365 e!800366)))

(declare-fun lt!623447 () (_ BitVec 64))

(assert (=> b!1414214 (= lt!623447 (select (arr!46637 lt!623269) (index!46177 lt!623445)))))

(declare-fun c!131193 () Bool)

(assert (=> b!1414214 (= c!131193 (= lt!623447 lt!623267))))

(declare-fun b!1414215 () Bool)

(declare-fun c!131192 () Bool)

(assert (=> b!1414215 (= c!131192 (= lt!623447 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414215 (= e!800366 e!800367)))

(declare-fun b!1414216 () Bool)

(assert (=> b!1414216 (= e!800365 Undefined!10948)))

(declare-fun d!152297 () Bool)

(declare-fun lt!623446 () SeekEntryResult!10948)

(assert (=> d!152297 (and (or (is-Undefined!10948 lt!623446) (not (is-Found!10948 lt!623446)) (and (bvsge (index!46176 lt!623446) #b00000000000000000000000000000000) (bvslt (index!46176 lt!623446) (size!47187 lt!623269)))) (or (is-Undefined!10948 lt!623446) (is-Found!10948 lt!623446) (not (is-MissingZero!10948 lt!623446)) (and (bvsge (index!46175 lt!623446) #b00000000000000000000000000000000) (bvslt (index!46175 lt!623446) (size!47187 lt!623269)))) (or (is-Undefined!10948 lt!623446) (is-Found!10948 lt!623446) (is-MissingZero!10948 lt!623446) (not (is-MissingVacant!10948 lt!623446)) (and (bvsge (index!46178 lt!623446) #b00000000000000000000000000000000) (bvslt (index!46178 lt!623446) (size!47187 lt!623269)))) (or (is-Undefined!10948 lt!623446) (ite (is-Found!10948 lt!623446) (= (select (arr!46637 lt!623269) (index!46176 lt!623446)) lt!623267) (ite (is-MissingZero!10948 lt!623446) (= (select (arr!46637 lt!623269) (index!46175 lt!623446)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10948 lt!623446) (= (select (arr!46637 lt!623269) (index!46178 lt!623446)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152297 (= lt!623446 e!800365)))

(declare-fun c!131194 () Bool)

(assert (=> d!152297 (= c!131194 (and (is-Intermediate!10948 lt!623445) (undefined!11760 lt!623445)))))

(assert (=> d!152297 (= lt!623445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623267 mask!2840) lt!623267 lt!623269 mask!2840))))

(assert (=> d!152297 (validMask!0 mask!2840)))

(assert (=> d!152297 (= (seekEntryOrOpen!0 lt!623267 lt!623269 mask!2840) lt!623446)))

(declare-fun b!1414213 () Bool)

(assert (=> b!1414213 (= e!800367 (MissingZero!10948 (index!46177 lt!623445)))))

(assert (= (and d!152297 c!131194) b!1414216))

(assert (= (and d!152297 (not c!131194)) b!1414214))

(assert (= (and b!1414214 c!131193) b!1414212))

(assert (= (and b!1414214 (not c!131193)) b!1414215))

(assert (= (and b!1414215 c!131192) b!1414213))

(assert (= (and b!1414215 (not c!131192)) b!1414211))

(declare-fun m!1304529 () Bool)

(assert (=> b!1414211 m!1304529))

(declare-fun m!1304531 () Bool)

(assert (=> b!1414214 m!1304531))

(declare-fun m!1304533 () Bool)

(assert (=> d!152297 m!1304533))

(declare-fun m!1304535 () Bool)

(assert (=> d!152297 m!1304535))

(assert (=> d!152297 m!1304259))

(assert (=> d!152297 m!1304261))

(declare-fun m!1304537 () Bool)

(assert (=> d!152297 m!1304537))

(assert (=> d!152297 m!1304271))

(assert (=> d!152297 m!1304259))

(assert (=> b!1413877 d!152297))

(declare-fun b!1414247 () Bool)

(declare-fun e!800385 () SeekEntryResult!10948)

(assert (=> b!1414247 (= e!800385 (MissingVacant!10948 (index!46177 lt!623270)))))

(declare-fun b!1414248 () Bool)

(declare-fun e!800384 () SeekEntryResult!10948)

(declare-fun e!800383 () SeekEntryResult!10948)

(assert (=> b!1414248 (= e!800384 e!800383)))

(declare-fun lt!623458 () (_ BitVec 64))

(declare-fun c!131211 () Bool)

(assert (=> b!1414248 (= c!131211 (= lt!623458 (select (arr!46637 a!2901) j!112)))))

(declare-fun b!1414249 () Bool)

(assert (=> b!1414249 (= e!800385 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127767 lt!623270) #b00000000000000000000000000000001) (nextIndex!0 (index!46177 lt!623270) (x!127767 lt!623270) mask!2840) (index!46177 lt!623270) (select (arr!46637 a!2901) j!112) lt!623269 mask!2840))))

(declare-fun d!152299 () Bool)

(declare-fun lt!623459 () SeekEntryResult!10948)

(assert (=> d!152299 (and (or (is-Undefined!10948 lt!623459) (not (is-Found!10948 lt!623459)) (and (bvsge (index!46176 lt!623459) #b00000000000000000000000000000000) (bvslt (index!46176 lt!623459) (size!47187 lt!623269)))) (or (is-Undefined!10948 lt!623459) (is-Found!10948 lt!623459) (not (is-MissingVacant!10948 lt!623459)) (not (= (index!46178 lt!623459) (index!46177 lt!623270))) (and (bvsge (index!46178 lt!623459) #b00000000000000000000000000000000) (bvslt (index!46178 lt!623459) (size!47187 lt!623269)))) (or (is-Undefined!10948 lt!623459) (ite (is-Found!10948 lt!623459) (= (select (arr!46637 lt!623269) (index!46176 lt!623459)) (select (arr!46637 a!2901) j!112)) (and (is-MissingVacant!10948 lt!623459) (= (index!46178 lt!623459) (index!46177 lt!623270)) (= (select (arr!46637 lt!623269) (index!46178 lt!623459)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152299 (= lt!623459 e!800384)))

(declare-fun c!131212 () Bool)

(assert (=> d!152299 (= c!131212 (bvsge (x!127767 lt!623270) #b01111111111111111111111111111110))))

(assert (=> d!152299 (= lt!623458 (select (arr!46637 lt!623269) (index!46177 lt!623270)))))

(assert (=> d!152299 (validMask!0 mask!2840)))

(assert (=> d!152299 (= (seekKeyOrZeroReturnVacant!0 (x!127767 lt!623270) (index!46177 lt!623270) (index!46177 lt!623270) (select (arr!46637 a!2901) j!112) lt!623269 mask!2840) lt!623459)))

(declare-fun b!1414250 () Bool)

(declare-fun c!131210 () Bool)

(assert (=> b!1414250 (= c!131210 (= lt!623458 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414250 (= e!800383 e!800385)))

(declare-fun b!1414251 () Bool)

(assert (=> b!1414251 (= e!800384 Undefined!10948)))

(declare-fun b!1414252 () Bool)

(assert (=> b!1414252 (= e!800383 (Found!10948 (index!46177 lt!623270)))))

(assert (= (and d!152299 c!131212) b!1414251))

(assert (= (and d!152299 (not c!131212)) b!1414248))

(assert (= (and b!1414248 c!131211) b!1414252))

(assert (= (and b!1414248 (not c!131211)) b!1414250))

(assert (= (and b!1414250 c!131210) b!1414247))

(assert (= (and b!1414250 (not c!131210)) b!1414249))

(declare-fun m!1304549 () Bool)

(assert (=> b!1414249 m!1304549))

(assert (=> b!1414249 m!1304549))

(assert (=> b!1414249 m!1304243))

(declare-fun m!1304551 () Bool)

(assert (=> b!1414249 m!1304551))

(declare-fun m!1304553 () Bool)

(assert (=> d!152299 m!1304553))

(declare-fun m!1304555 () Bool)

(assert (=> d!152299 m!1304555))

(declare-fun m!1304557 () Bool)

(assert (=> d!152299 m!1304557))

(assert (=> d!152299 m!1304271))

(assert (=> b!1413877 d!152299))

(declare-fun b!1414253 () Bool)

(declare-fun e!800388 () Bool)

(declare-fun call!67137 () Bool)

(assert (=> b!1414253 (= e!800388 call!67137)))

(declare-fun d!152305 () Bool)

(declare-fun res!950779 () Bool)

(declare-fun e!800386 () Bool)

(assert (=> d!152305 (=> res!950779 e!800386)))

(assert (=> d!152305 (= res!950779 (bvsge #b00000000000000000000000000000000 (size!47187 a!2901)))))

(assert (=> d!152305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800386)))

(declare-fun b!1414254 () Bool)

(assert (=> b!1414254 (= e!800386 e!800388)))

(declare-fun c!131213 () Bool)

(assert (=> b!1414254 (= c!131213 (validKeyInArray!0 (select (arr!46637 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67134 () Bool)

(assert (=> bm!67134 (= call!67137 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414255 () Bool)

(declare-fun e!800387 () Bool)

(assert (=> b!1414255 (= e!800387 call!67137)))

(declare-fun b!1414256 () Bool)

(assert (=> b!1414256 (= e!800388 e!800387)))

(declare-fun lt!623462 () (_ BitVec 64))

(assert (=> b!1414256 (= lt!623462 (select (arr!46637 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623460 () Unit!47870)

(assert (=> b!1414256 (= lt!623460 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623462 #b00000000000000000000000000000000))))

(assert (=> b!1414256 (arrayContainsKey!0 a!2901 lt!623462 #b00000000000000000000000000000000)))

(declare-fun lt!623461 () Unit!47870)

(assert (=> b!1414256 (= lt!623461 lt!623460)))

(declare-fun res!950780 () Bool)

(assert (=> b!1414256 (= res!950780 (= (seekEntryOrOpen!0 (select (arr!46637 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10948 #b00000000000000000000000000000000)))))

(assert (=> b!1414256 (=> (not res!950780) (not e!800387))))

(assert (= (and d!152305 (not res!950779)) b!1414254))

(assert (= (and b!1414254 c!131213) b!1414256))

(assert (= (and b!1414254 (not c!131213)) b!1414253))

(assert (= (and b!1414256 res!950780) b!1414255))

(assert (= (or b!1414255 b!1414253) bm!67134))

(assert (=> b!1414254 m!1304373))

(assert (=> b!1414254 m!1304373))

(assert (=> b!1414254 m!1304375))

(declare-fun m!1304559 () Bool)

(assert (=> bm!67134 m!1304559))

(assert (=> b!1414256 m!1304373))

(declare-fun m!1304561 () Bool)

(assert (=> b!1414256 m!1304561))

(declare-fun m!1304563 () Bool)

(assert (=> b!1414256 m!1304563))

(assert (=> b!1414256 m!1304373))

(declare-fun m!1304565 () Bool)

(assert (=> b!1414256 m!1304565))

(assert (=> b!1413882 d!152305))

(push 1)

