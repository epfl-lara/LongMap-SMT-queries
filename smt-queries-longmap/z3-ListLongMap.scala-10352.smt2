; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121730 () Bool)

(assert start!121730)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96605 0))(
  ( (array!96606 (arr!46638 (Array (_ BitVec 32) (_ BitVec 64))) (size!47188 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96605)

(declare-fun b!1413903 () Bool)

(declare-fun e!800179 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10949 0))(
  ( (MissingZero!10949 (index!46179 (_ BitVec 32))) (Found!10949 (index!46180 (_ BitVec 32))) (Intermediate!10949 (undefined!11761 Bool) (index!46181 (_ BitVec 32)) (x!127768 (_ BitVec 32))) (Undefined!10949) (MissingVacant!10949 (index!46182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96605 (_ BitVec 32)) SeekEntryResult!10949)

(assert (=> b!1413903 (= e!800179 (= (seekEntryOrOpen!0 (select (arr!46638 a!2901) j!112) a!2901 mask!2840) (Found!10949 j!112)))))

(declare-fun b!1413904 () Bool)

(declare-fun res!950663 () Bool)

(declare-fun e!800182 () Bool)

(assert (=> b!1413904 (=> (not res!950663) (not e!800182))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413904 (= res!950663 (and (= (size!47188 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47188 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47188 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413905 () Bool)

(declare-fun res!950659 () Bool)

(assert (=> b!1413905 (=> (not res!950659) (not e!800182))))

(declare-datatypes ((List!33157 0))(
  ( (Nil!33154) (Cons!33153 (h!34431 (_ BitVec 64)) (t!47851 List!33157)) )
))
(declare-fun arrayNoDuplicates!0 (array!96605 (_ BitVec 32) List!33157) Bool)

(assert (=> b!1413905 (= res!950659 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33154))))

(declare-fun lt!623292 () SeekEntryResult!10949)

(declare-fun lt!623287 () (_ BitVec 64))

(declare-fun b!1413906 () Bool)

(declare-fun lt!623290 () array!96605)

(declare-fun e!800178 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96605 (_ BitVec 32)) SeekEntryResult!10949)

(assert (=> b!1413906 (= e!800178 (= (seekEntryOrOpen!0 lt!623287 lt!623290 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127768 lt!623292) (index!46181 lt!623292) (index!46181 lt!623292) (select (arr!46638 a!2901) j!112) lt!623290 mask!2840)))))

(declare-fun b!1413907 () Bool)

(declare-fun e!800181 () Bool)

(declare-fun lt!623286 () SeekEntryResult!10949)

(assert (=> b!1413907 (= e!800181 (or (bvslt (x!127768 lt!623286) #b00000000000000000000000000000000) (bvsgt (x!127768 lt!623286) #b01111111111111111111111111111110) (and (bvsge (x!127768 lt!623292) #b00000000000000000000000000000000) (bvsle (x!127768 lt!623292) #b01111111111111111111111111111110))))))

(assert (=> b!1413907 e!800178))

(declare-fun res!950658 () Bool)

(assert (=> b!1413907 (=> (not res!950658) (not e!800178))))

(assert (=> b!1413907 (= res!950658 (and (not (undefined!11761 lt!623292)) (= (index!46181 lt!623292) i!1037) (bvslt (x!127768 lt!623292) (x!127768 lt!623286)) (= (select (store (arr!46638 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46181 lt!623292)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47872 0))(
  ( (Unit!47873) )
))
(declare-fun lt!623288 () Unit!47872)

(declare-fun lt!623291 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47872)

(assert (=> b!1413907 (= lt!623288 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623291 (x!127768 lt!623286) (index!46181 lt!623286) (x!127768 lt!623292) (index!46181 lt!623292) (undefined!11761 lt!623292) mask!2840))))

(declare-fun b!1413908 () Bool)

(declare-fun e!800180 () Bool)

(assert (=> b!1413908 (= e!800182 (not e!800180))))

(declare-fun res!950664 () Bool)

(assert (=> b!1413908 (=> res!950664 e!800180)))

(get-info :version)

(assert (=> b!1413908 (= res!950664 (or (not ((_ is Intermediate!10949) lt!623286)) (undefined!11761 lt!623286)))))

(assert (=> b!1413908 e!800179))

(declare-fun res!950657 () Bool)

(assert (=> b!1413908 (=> (not res!950657) (not e!800179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96605 (_ BitVec 32)) Bool)

(assert (=> b!1413908 (= res!950657 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623289 () Unit!47872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47872)

(assert (=> b!1413908 (= lt!623289 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96605 (_ BitVec 32)) SeekEntryResult!10949)

(assert (=> b!1413908 (= lt!623286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623291 (select (arr!46638 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413908 (= lt!623291 (toIndex!0 (select (arr!46638 a!2901) j!112) mask!2840))))

(declare-fun b!1413909 () Bool)

(declare-fun res!950662 () Bool)

(assert (=> b!1413909 (=> (not res!950662) (not e!800182))))

(assert (=> b!1413909 (= res!950662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413910 () Bool)

(declare-fun res!950656 () Bool)

(assert (=> b!1413910 (=> (not res!950656) (not e!800182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413910 (= res!950656 (validKeyInArray!0 (select (arr!46638 a!2901) j!112)))))

(declare-fun b!1413911 () Bool)

(assert (=> b!1413911 (= e!800180 e!800181)))

(declare-fun res!950660 () Bool)

(assert (=> b!1413911 (=> res!950660 e!800181)))

(assert (=> b!1413911 (= res!950660 (or (= lt!623286 lt!623292) (not ((_ is Intermediate!10949) lt!623292))))))

(assert (=> b!1413911 (= lt!623292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623287 mask!2840) lt!623287 lt!623290 mask!2840))))

(assert (=> b!1413911 (= lt!623287 (select (store (arr!46638 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413911 (= lt!623290 (array!96606 (store (arr!46638 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47188 a!2901)))))

(declare-fun b!1413912 () Bool)

(declare-fun res!950665 () Bool)

(assert (=> b!1413912 (=> (not res!950665) (not e!800182))))

(assert (=> b!1413912 (= res!950665 (validKeyInArray!0 (select (arr!46638 a!2901) i!1037)))))

(declare-fun res!950661 () Bool)

(assert (=> start!121730 (=> (not res!950661) (not e!800182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121730 (= res!950661 (validMask!0 mask!2840))))

(assert (=> start!121730 e!800182))

(assert (=> start!121730 true))

(declare-fun array_inv!35666 (array!96605) Bool)

(assert (=> start!121730 (array_inv!35666 a!2901)))

(assert (= (and start!121730 res!950661) b!1413904))

(assert (= (and b!1413904 res!950663) b!1413912))

(assert (= (and b!1413912 res!950665) b!1413910))

(assert (= (and b!1413910 res!950656) b!1413909))

(assert (= (and b!1413909 res!950662) b!1413905))

(assert (= (and b!1413905 res!950659) b!1413908))

(assert (= (and b!1413908 res!950657) b!1413903))

(assert (= (and b!1413908 (not res!950664)) b!1413911))

(assert (= (and b!1413911 (not res!950660)) b!1413907))

(assert (= (and b!1413907 res!950658) b!1413906))

(declare-fun m!1304277 () Bool)

(assert (=> b!1413910 m!1304277))

(assert (=> b!1413910 m!1304277))

(declare-fun m!1304279 () Bool)

(assert (=> b!1413910 m!1304279))

(assert (=> b!1413908 m!1304277))

(declare-fun m!1304281 () Bool)

(assert (=> b!1413908 m!1304281))

(assert (=> b!1413908 m!1304277))

(assert (=> b!1413908 m!1304277))

(declare-fun m!1304283 () Bool)

(assert (=> b!1413908 m!1304283))

(declare-fun m!1304285 () Bool)

(assert (=> b!1413908 m!1304285))

(declare-fun m!1304287 () Bool)

(assert (=> b!1413908 m!1304287))

(declare-fun m!1304289 () Bool)

(assert (=> b!1413911 m!1304289))

(assert (=> b!1413911 m!1304289))

(declare-fun m!1304291 () Bool)

(assert (=> b!1413911 m!1304291))

(declare-fun m!1304293 () Bool)

(assert (=> b!1413911 m!1304293))

(declare-fun m!1304295 () Bool)

(assert (=> b!1413911 m!1304295))

(declare-fun m!1304297 () Bool)

(assert (=> b!1413906 m!1304297))

(assert (=> b!1413906 m!1304277))

(assert (=> b!1413906 m!1304277))

(declare-fun m!1304299 () Bool)

(assert (=> b!1413906 m!1304299))

(assert (=> b!1413907 m!1304293))

(declare-fun m!1304301 () Bool)

(assert (=> b!1413907 m!1304301))

(declare-fun m!1304303 () Bool)

(assert (=> b!1413907 m!1304303))

(declare-fun m!1304305 () Bool)

(assert (=> start!121730 m!1304305))

(declare-fun m!1304307 () Bool)

(assert (=> start!121730 m!1304307))

(declare-fun m!1304309 () Bool)

(assert (=> b!1413909 m!1304309))

(declare-fun m!1304311 () Bool)

(assert (=> b!1413905 m!1304311))

(assert (=> b!1413903 m!1304277))

(assert (=> b!1413903 m!1304277))

(declare-fun m!1304313 () Bool)

(assert (=> b!1413903 m!1304313))

(declare-fun m!1304315 () Bool)

(assert (=> b!1413912 m!1304315))

(assert (=> b!1413912 m!1304315))

(declare-fun m!1304317 () Bool)

(assert (=> b!1413912 m!1304317))

(check-sat (not b!1413912) (not b!1413906) (not start!121730) (not b!1413908) (not b!1413903) (not b!1413910) (not b!1413905) (not b!1413911) (not b!1413909) (not b!1413907))
(check-sat)
(get-model)

(declare-fun d!152219 () Bool)

(assert (=> d!152219 (and (not (undefined!11761 lt!623292)) (= (index!46181 lt!623292) i!1037) (bvslt (x!127768 lt!623292) (x!127768 lt!623286)))))

(declare-fun lt!623316 () Unit!47872)

(declare-fun choose!62 (array!96605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47872)

(assert (=> d!152219 (= lt!623316 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623291 (x!127768 lt!623286) (index!46181 lt!623286) (x!127768 lt!623292) (index!46181 lt!623292) (undefined!11761 lt!623292) mask!2840))))

(assert (=> d!152219 (validMask!0 mask!2840)))

(assert (=> d!152219 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623291 (x!127768 lt!623286) (index!46181 lt!623286) (x!127768 lt!623292) (index!46181 lt!623292) (undefined!11761 lt!623292) mask!2840) lt!623316)))

(declare-fun bs!41225 () Bool)

(assert (= bs!41225 d!152219))

(declare-fun m!1304361 () Bool)

(assert (=> bs!41225 m!1304361))

(assert (=> bs!41225 m!1304305))

(assert (=> b!1413907 d!152219))

(declare-fun d!152221 () Bool)

(assert (=> d!152221 (= (validKeyInArray!0 (select (arr!46638 a!2901) i!1037)) (and (not (= (select (arr!46638 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46638 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413912 d!152221))

(declare-fun d!152223 () Bool)

(declare-fun lt!623324 () SeekEntryResult!10949)

(assert (=> d!152223 (and (or ((_ is Undefined!10949) lt!623324) (not ((_ is Found!10949) lt!623324)) (and (bvsge (index!46180 lt!623324) #b00000000000000000000000000000000) (bvslt (index!46180 lt!623324) (size!47188 lt!623290)))) (or ((_ is Undefined!10949) lt!623324) ((_ is Found!10949) lt!623324) (not ((_ is MissingZero!10949) lt!623324)) (and (bvsge (index!46179 lt!623324) #b00000000000000000000000000000000) (bvslt (index!46179 lt!623324) (size!47188 lt!623290)))) (or ((_ is Undefined!10949) lt!623324) ((_ is Found!10949) lt!623324) ((_ is MissingZero!10949) lt!623324) (not ((_ is MissingVacant!10949) lt!623324)) (and (bvsge (index!46182 lt!623324) #b00000000000000000000000000000000) (bvslt (index!46182 lt!623324) (size!47188 lt!623290)))) (or ((_ is Undefined!10949) lt!623324) (ite ((_ is Found!10949) lt!623324) (= (select (arr!46638 lt!623290) (index!46180 lt!623324)) lt!623287) (ite ((_ is MissingZero!10949) lt!623324) (= (select (arr!46638 lt!623290) (index!46179 lt!623324)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10949) lt!623324) (= (select (arr!46638 lt!623290) (index!46182 lt!623324)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!800209 () SeekEntryResult!10949)

(assert (=> d!152223 (= lt!623324 e!800209)))

(declare-fun c!131106 () Bool)

(declare-fun lt!623323 () SeekEntryResult!10949)

(assert (=> d!152223 (= c!131106 (and ((_ is Intermediate!10949) lt!623323) (undefined!11761 lt!623323)))))

(assert (=> d!152223 (= lt!623323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623287 mask!2840) lt!623287 lt!623290 mask!2840))))

(assert (=> d!152223 (validMask!0 mask!2840)))

(assert (=> d!152223 (= (seekEntryOrOpen!0 lt!623287 lt!623290 mask!2840) lt!623324)))

(declare-fun b!1413955 () Bool)

(declare-fun e!800208 () SeekEntryResult!10949)

(assert (=> b!1413955 (= e!800209 e!800208)))

(declare-fun lt!623325 () (_ BitVec 64))

(assert (=> b!1413955 (= lt!623325 (select (arr!46638 lt!623290) (index!46181 lt!623323)))))

(declare-fun c!131104 () Bool)

(assert (=> b!1413955 (= c!131104 (= lt!623325 lt!623287))))

(declare-fun b!1413956 () Bool)

(declare-fun e!800210 () SeekEntryResult!10949)

(assert (=> b!1413956 (= e!800210 (MissingZero!10949 (index!46181 lt!623323)))))

(declare-fun b!1413957 () Bool)

(assert (=> b!1413957 (= e!800210 (seekKeyOrZeroReturnVacant!0 (x!127768 lt!623323) (index!46181 lt!623323) (index!46181 lt!623323) lt!623287 lt!623290 mask!2840))))

(declare-fun b!1413958 () Bool)

(assert (=> b!1413958 (= e!800209 Undefined!10949)))

(declare-fun b!1413959 () Bool)

(assert (=> b!1413959 (= e!800208 (Found!10949 (index!46181 lt!623323)))))

(declare-fun b!1413960 () Bool)

(declare-fun c!131105 () Bool)

(assert (=> b!1413960 (= c!131105 (= lt!623325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413960 (= e!800208 e!800210)))

(assert (= (and d!152223 c!131106) b!1413958))

(assert (= (and d!152223 (not c!131106)) b!1413955))

(assert (= (and b!1413955 c!131104) b!1413959))

(assert (= (and b!1413955 (not c!131104)) b!1413960))

(assert (= (and b!1413960 c!131105) b!1413956))

(assert (= (and b!1413960 (not c!131105)) b!1413957))

(declare-fun m!1304363 () Bool)

(assert (=> d!152223 m!1304363))

(declare-fun m!1304365 () Bool)

(assert (=> d!152223 m!1304365))

(assert (=> d!152223 m!1304289))

(assert (=> d!152223 m!1304289))

(assert (=> d!152223 m!1304291))

(assert (=> d!152223 m!1304305))

(declare-fun m!1304367 () Bool)

(assert (=> d!152223 m!1304367))

(declare-fun m!1304369 () Bool)

(assert (=> b!1413955 m!1304369))

(declare-fun m!1304371 () Bool)

(assert (=> b!1413957 m!1304371))

(assert (=> b!1413906 d!152223))

(declare-fun b!1414003 () Bool)

(declare-fun e!800243 () SeekEntryResult!10949)

(assert (=> b!1414003 (= e!800243 (MissingVacant!10949 (index!46181 lt!623292)))))

(declare-fun b!1414004 () Bool)

(declare-fun e!800241 () SeekEntryResult!10949)

(assert (=> b!1414004 (= e!800241 Undefined!10949)))

(declare-fun d!152225 () Bool)

(declare-fun lt!623333 () SeekEntryResult!10949)

(assert (=> d!152225 (and (or ((_ is Undefined!10949) lt!623333) (not ((_ is Found!10949) lt!623333)) (and (bvsge (index!46180 lt!623333) #b00000000000000000000000000000000) (bvslt (index!46180 lt!623333) (size!47188 lt!623290)))) (or ((_ is Undefined!10949) lt!623333) ((_ is Found!10949) lt!623333) (not ((_ is MissingVacant!10949) lt!623333)) (not (= (index!46182 lt!623333) (index!46181 lt!623292))) (and (bvsge (index!46182 lt!623333) #b00000000000000000000000000000000) (bvslt (index!46182 lt!623333) (size!47188 lt!623290)))) (or ((_ is Undefined!10949) lt!623333) (ite ((_ is Found!10949) lt!623333) (= (select (arr!46638 lt!623290) (index!46180 lt!623333)) (select (arr!46638 a!2901) j!112)) (and ((_ is MissingVacant!10949) lt!623333) (= (index!46182 lt!623333) (index!46181 lt!623292)) (= (select (arr!46638 lt!623290) (index!46182 lt!623333)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152225 (= lt!623333 e!800241)))

(declare-fun c!131120 () Bool)

(assert (=> d!152225 (= c!131120 (bvsge (x!127768 lt!623292) #b01111111111111111111111111111110))))

(declare-fun lt!623334 () (_ BitVec 64))

(assert (=> d!152225 (= lt!623334 (select (arr!46638 lt!623290) (index!46181 lt!623292)))))

(assert (=> d!152225 (validMask!0 mask!2840)))

(assert (=> d!152225 (= (seekKeyOrZeroReturnVacant!0 (x!127768 lt!623292) (index!46181 lt!623292) (index!46181 lt!623292) (select (arr!46638 a!2901) j!112) lt!623290 mask!2840) lt!623333)))

(declare-fun b!1414005 () Bool)

(declare-fun c!131119 () Bool)

(assert (=> b!1414005 (= c!131119 (= lt!623334 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800242 () SeekEntryResult!10949)

(assert (=> b!1414005 (= e!800242 e!800243)))

(declare-fun b!1414006 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414006 (= e!800243 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127768 lt!623292) #b00000000000000000000000000000001) (nextIndex!0 (index!46181 lt!623292) (x!127768 lt!623292) mask!2840) (index!46181 lt!623292) (select (arr!46638 a!2901) j!112) lt!623290 mask!2840))))

(declare-fun b!1414007 () Bool)

(assert (=> b!1414007 (= e!800241 e!800242)))

(declare-fun c!131121 () Bool)

(assert (=> b!1414007 (= c!131121 (= lt!623334 (select (arr!46638 a!2901) j!112)))))

(declare-fun b!1414008 () Bool)

(assert (=> b!1414008 (= e!800242 (Found!10949 (index!46181 lt!623292)))))

(assert (= (and d!152225 c!131120) b!1414004))

(assert (= (and d!152225 (not c!131120)) b!1414007))

(assert (= (and b!1414007 c!131121) b!1414008))

(assert (= (and b!1414007 (not c!131121)) b!1414005))

(assert (= (and b!1414005 c!131119) b!1414003))

(assert (= (and b!1414005 (not c!131119)) b!1414006))

(declare-fun m!1304391 () Bool)

(assert (=> d!152225 m!1304391))

(declare-fun m!1304393 () Bool)

(assert (=> d!152225 m!1304393))

(declare-fun m!1304395 () Bool)

(assert (=> d!152225 m!1304395))

(assert (=> d!152225 m!1304305))

(declare-fun m!1304397 () Bool)

(assert (=> b!1414006 m!1304397))

(assert (=> b!1414006 m!1304397))

(assert (=> b!1414006 m!1304277))

(declare-fun m!1304399 () Bool)

(assert (=> b!1414006 m!1304399))

(assert (=> b!1413906 d!152225))

(declare-fun d!152241 () Bool)

(declare-fun lt!623336 () SeekEntryResult!10949)

(assert (=> d!152241 (and (or ((_ is Undefined!10949) lt!623336) (not ((_ is Found!10949) lt!623336)) (and (bvsge (index!46180 lt!623336) #b00000000000000000000000000000000) (bvslt (index!46180 lt!623336) (size!47188 a!2901)))) (or ((_ is Undefined!10949) lt!623336) ((_ is Found!10949) lt!623336) (not ((_ is MissingZero!10949) lt!623336)) (and (bvsge (index!46179 lt!623336) #b00000000000000000000000000000000) (bvslt (index!46179 lt!623336) (size!47188 a!2901)))) (or ((_ is Undefined!10949) lt!623336) ((_ is Found!10949) lt!623336) ((_ is MissingZero!10949) lt!623336) (not ((_ is MissingVacant!10949) lt!623336)) (and (bvsge (index!46182 lt!623336) #b00000000000000000000000000000000) (bvslt (index!46182 lt!623336) (size!47188 a!2901)))) (or ((_ is Undefined!10949) lt!623336) (ite ((_ is Found!10949) lt!623336) (= (select (arr!46638 a!2901) (index!46180 lt!623336)) (select (arr!46638 a!2901) j!112)) (ite ((_ is MissingZero!10949) lt!623336) (= (select (arr!46638 a!2901) (index!46179 lt!623336)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10949) lt!623336) (= (select (arr!46638 a!2901) (index!46182 lt!623336)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!800245 () SeekEntryResult!10949)

(assert (=> d!152241 (= lt!623336 e!800245)))

(declare-fun c!131124 () Bool)

(declare-fun lt!623335 () SeekEntryResult!10949)

(assert (=> d!152241 (= c!131124 (and ((_ is Intermediate!10949) lt!623335) (undefined!11761 lt!623335)))))

(assert (=> d!152241 (= lt!623335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46638 a!2901) j!112) mask!2840) (select (arr!46638 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152241 (validMask!0 mask!2840)))

(assert (=> d!152241 (= (seekEntryOrOpen!0 (select (arr!46638 a!2901) j!112) a!2901 mask!2840) lt!623336)))

(declare-fun b!1414009 () Bool)

(declare-fun e!800244 () SeekEntryResult!10949)

(assert (=> b!1414009 (= e!800245 e!800244)))

(declare-fun lt!623337 () (_ BitVec 64))

(assert (=> b!1414009 (= lt!623337 (select (arr!46638 a!2901) (index!46181 lt!623335)))))

(declare-fun c!131122 () Bool)

(assert (=> b!1414009 (= c!131122 (= lt!623337 (select (arr!46638 a!2901) j!112)))))

(declare-fun b!1414010 () Bool)

(declare-fun e!800246 () SeekEntryResult!10949)

(assert (=> b!1414010 (= e!800246 (MissingZero!10949 (index!46181 lt!623335)))))

(declare-fun b!1414011 () Bool)

(assert (=> b!1414011 (= e!800246 (seekKeyOrZeroReturnVacant!0 (x!127768 lt!623335) (index!46181 lt!623335) (index!46181 lt!623335) (select (arr!46638 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414012 () Bool)

(assert (=> b!1414012 (= e!800245 Undefined!10949)))

(declare-fun b!1414013 () Bool)

(assert (=> b!1414013 (= e!800244 (Found!10949 (index!46181 lt!623335)))))

(declare-fun b!1414014 () Bool)

(declare-fun c!131123 () Bool)

(assert (=> b!1414014 (= c!131123 (= lt!623337 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414014 (= e!800244 e!800246)))

(assert (= (and d!152241 c!131124) b!1414012))

(assert (= (and d!152241 (not c!131124)) b!1414009))

(assert (= (and b!1414009 c!131122) b!1414013))

(assert (= (and b!1414009 (not c!131122)) b!1414014))

(assert (= (and b!1414014 c!131123) b!1414010))

(assert (= (and b!1414014 (not c!131123)) b!1414011))

(declare-fun m!1304401 () Bool)

(assert (=> d!152241 m!1304401))

(declare-fun m!1304403 () Bool)

(assert (=> d!152241 m!1304403))

(assert (=> d!152241 m!1304277))

(assert (=> d!152241 m!1304281))

(assert (=> d!152241 m!1304281))

(assert (=> d!152241 m!1304277))

(declare-fun m!1304405 () Bool)

(assert (=> d!152241 m!1304405))

(assert (=> d!152241 m!1304305))

(declare-fun m!1304407 () Bool)

(assert (=> d!152241 m!1304407))

(declare-fun m!1304409 () Bool)

(assert (=> b!1414009 m!1304409))

(assert (=> b!1414011 m!1304277))

(declare-fun m!1304411 () Bool)

(assert (=> b!1414011 m!1304411))

(assert (=> b!1413903 d!152241))

(declare-fun b!1414043 () Bool)

(declare-fun e!800266 () Bool)

(declare-fun e!800268 () Bool)

(assert (=> b!1414043 (= e!800266 e!800268)))

(declare-fun c!131134 () Bool)

(assert (=> b!1414043 (= c!131134 (validKeyInArray!0 (select (arr!46638 a!2901) j!112)))))

(declare-fun b!1414044 () Bool)

(declare-fun e!800267 () Bool)

(assert (=> b!1414044 (= e!800268 e!800267)))

(declare-fun lt!623358 () (_ BitVec 64))

(assert (=> b!1414044 (= lt!623358 (select (arr!46638 a!2901) j!112))))

(declare-fun lt!623357 () Unit!47872)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96605 (_ BitVec 64) (_ BitVec 32)) Unit!47872)

(assert (=> b!1414044 (= lt!623357 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623358 j!112))))

(declare-fun arrayContainsKey!0 (array!96605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1414044 (arrayContainsKey!0 a!2901 lt!623358 #b00000000000000000000000000000000)))

(declare-fun lt!623359 () Unit!47872)

(assert (=> b!1414044 (= lt!623359 lt!623357)))

(declare-fun res!950724 () Bool)

(assert (=> b!1414044 (= res!950724 (= (seekEntryOrOpen!0 (select (arr!46638 a!2901) j!112) a!2901 mask!2840) (Found!10949 j!112)))))

(assert (=> b!1414044 (=> (not res!950724) (not e!800267))))

(declare-fun b!1414045 () Bool)

(declare-fun call!67129 () Bool)

(assert (=> b!1414045 (= e!800267 call!67129)))

(declare-fun bm!67126 () Bool)

(assert (=> bm!67126 (= call!67129 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414046 () Bool)

(assert (=> b!1414046 (= e!800268 call!67129)))

(declare-fun d!152243 () Bool)

(declare-fun res!950725 () Bool)

(assert (=> d!152243 (=> res!950725 e!800266)))

(assert (=> d!152243 (= res!950725 (bvsge j!112 (size!47188 a!2901)))))

(assert (=> d!152243 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800266)))

(assert (= (and d!152243 (not res!950725)) b!1414043))

(assert (= (and b!1414043 c!131134) b!1414044))

(assert (= (and b!1414043 (not c!131134)) b!1414046))

(assert (= (and b!1414044 res!950724) b!1414045))

(assert (= (or b!1414045 b!1414046) bm!67126))

(assert (=> b!1414043 m!1304277))

(assert (=> b!1414043 m!1304277))

(assert (=> b!1414043 m!1304279))

(assert (=> b!1414044 m!1304277))

(declare-fun m!1304419 () Bool)

(assert (=> b!1414044 m!1304419))

(declare-fun m!1304421 () Bool)

(assert (=> b!1414044 m!1304421))

(assert (=> b!1414044 m!1304277))

(assert (=> b!1414044 m!1304313))

(declare-fun m!1304423 () Bool)

(assert (=> bm!67126 m!1304423))

(assert (=> b!1413908 d!152243))

(declare-fun d!152247 () Bool)

(assert (=> d!152247 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623365 () Unit!47872)

(declare-fun choose!38 (array!96605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47872)

(assert (=> d!152247 (= lt!623365 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152247 (validMask!0 mask!2840)))

(assert (=> d!152247 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623365)))

(declare-fun bs!41228 () Bool)

(assert (= bs!41228 d!152247))

(assert (=> bs!41228 m!1304287))

(declare-fun m!1304427 () Bool)

(assert (=> bs!41228 m!1304427))

(assert (=> bs!41228 m!1304305))

(assert (=> b!1413908 d!152247))

(declare-fun b!1414111 () Bool)

(declare-fun lt!623385 () SeekEntryResult!10949)

(assert (=> b!1414111 (and (bvsge (index!46181 lt!623385) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623385) (size!47188 a!2901)))))

(declare-fun e!800307 () Bool)

(assert (=> b!1414111 (= e!800307 (= (select (arr!46638 a!2901) (index!46181 lt!623385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414112 () Bool)

(declare-fun e!800306 () SeekEntryResult!10949)

(assert (=> b!1414112 (= e!800306 (Intermediate!10949 false lt!623291 #b00000000000000000000000000000000))))

(declare-fun b!1414113 () Bool)

(declare-fun e!800305 () Bool)

(assert (=> b!1414113 (= e!800305 (bvsge (x!127768 lt!623385) #b01111111111111111111111111111110))))

(declare-fun b!1414114 () Bool)

(declare-fun e!800309 () Bool)

(assert (=> b!1414114 (= e!800305 e!800309)))

(declare-fun res!950752 () Bool)

(assert (=> b!1414114 (= res!950752 (and ((_ is Intermediate!10949) lt!623385) (not (undefined!11761 lt!623385)) (bvslt (x!127768 lt!623385) #b01111111111111111111111111111110) (bvsge (x!127768 lt!623385) #b00000000000000000000000000000000) (bvsge (x!127768 lt!623385) #b00000000000000000000000000000000)))))

(assert (=> b!1414114 (=> (not res!950752) (not e!800309))))

(declare-fun d!152251 () Bool)

(assert (=> d!152251 e!800305))

(declare-fun c!131155 () Bool)

(assert (=> d!152251 (= c!131155 (and ((_ is Intermediate!10949) lt!623385) (undefined!11761 lt!623385)))))

(declare-fun e!800308 () SeekEntryResult!10949)

(assert (=> d!152251 (= lt!623385 e!800308)))

(declare-fun c!131156 () Bool)

(assert (=> d!152251 (= c!131156 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623384 () (_ BitVec 64))

(assert (=> d!152251 (= lt!623384 (select (arr!46638 a!2901) lt!623291))))

(assert (=> d!152251 (validMask!0 mask!2840)))

(assert (=> d!152251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623291 (select (arr!46638 a!2901) j!112) a!2901 mask!2840) lt!623385)))

(declare-fun b!1414115 () Bool)

(assert (=> b!1414115 (= e!800306 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623291 #b00000000000000000000000000000000 mask!2840) (select (arr!46638 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414116 () Bool)

(assert (=> b!1414116 (and (bvsge (index!46181 lt!623385) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623385) (size!47188 a!2901)))))

(declare-fun res!950753 () Bool)

(assert (=> b!1414116 (= res!950753 (= (select (arr!46638 a!2901) (index!46181 lt!623385)) (select (arr!46638 a!2901) j!112)))))

(assert (=> b!1414116 (=> res!950753 e!800307)))

(assert (=> b!1414116 (= e!800309 e!800307)))

(declare-fun b!1414117 () Bool)

(assert (=> b!1414117 (= e!800308 e!800306)))

(declare-fun c!131157 () Bool)

(assert (=> b!1414117 (= c!131157 (or (= lt!623384 (select (arr!46638 a!2901) j!112)) (= (bvadd lt!623384 lt!623384) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414118 () Bool)

(assert (=> b!1414118 (and (bvsge (index!46181 lt!623385) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623385) (size!47188 a!2901)))))

(declare-fun res!950754 () Bool)

(assert (=> b!1414118 (= res!950754 (= (select (arr!46638 a!2901) (index!46181 lt!623385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414118 (=> res!950754 e!800307)))

(declare-fun b!1414119 () Bool)

(assert (=> b!1414119 (= e!800308 (Intermediate!10949 true lt!623291 #b00000000000000000000000000000000))))

(assert (= (and d!152251 c!131156) b!1414119))

(assert (= (and d!152251 (not c!131156)) b!1414117))

(assert (= (and b!1414117 c!131157) b!1414112))

(assert (= (and b!1414117 (not c!131157)) b!1414115))

(assert (= (and d!152251 c!131155) b!1414113))

(assert (= (and d!152251 (not c!131155)) b!1414114))

(assert (= (and b!1414114 res!950752) b!1414116))

(assert (= (and b!1414116 (not res!950753)) b!1414118))

(assert (= (and b!1414118 (not res!950754)) b!1414111))

(declare-fun m!1304445 () Bool)

(assert (=> d!152251 m!1304445))

(assert (=> d!152251 m!1304305))

(declare-fun m!1304447 () Bool)

(assert (=> b!1414115 m!1304447))

(assert (=> b!1414115 m!1304447))

(assert (=> b!1414115 m!1304277))

(declare-fun m!1304449 () Bool)

(assert (=> b!1414115 m!1304449))

(declare-fun m!1304451 () Bool)

(assert (=> b!1414111 m!1304451))

(assert (=> b!1414116 m!1304451))

(assert (=> b!1414118 m!1304451))

(assert (=> b!1413908 d!152251))

(declare-fun d!152263 () Bool)

(declare-fun lt!623408 () (_ BitVec 32))

(declare-fun lt!623407 () (_ BitVec 32))

(assert (=> d!152263 (= lt!623408 (bvmul (bvxor lt!623407 (bvlshr lt!623407 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152263 (= lt!623407 ((_ extract 31 0) (bvand (bvxor (select (arr!46638 a!2901) j!112) (bvlshr (select (arr!46638 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152263 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950755 (let ((h!34435 ((_ extract 31 0) (bvand (bvxor (select (arr!46638 a!2901) j!112) (bvlshr (select (arr!46638 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127778 (bvmul (bvxor h!34435 (bvlshr h!34435 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127778 (bvlshr x!127778 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950755 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950755 #b00000000000000000000000000000000))))))

(assert (=> d!152263 (= (toIndex!0 (select (arr!46638 a!2901) j!112) mask!2840) (bvand (bvxor lt!623408 (bvlshr lt!623408 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413908 d!152263))

(declare-fun d!152267 () Bool)

(assert (=> d!152267 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121730 d!152267))

(declare-fun d!152281 () Bool)

(assert (=> d!152281 (= (array_inv!35666 a!2901) (bvsge (size!47188 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121730 d!152281))

(declare-fun b!1414141 () Bool)

(declare-fun e!800324 () Bool)

(declare-fun e!800326 () Bool)

(assert (=> b!1414141 (= e!800324 e!800326)))

(declare-fun c!131164 () Bool)

(assert (=> b!1414141 (= c!131164 (validKeyInArray!0 (select (arr!46638 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414142 () Bool)

(declare-fun e!800325 () Bool)

(assert (=> b!1414142 (= e!800326 e!800325)))

(declare-fun lt!623418 () (_ BitVec 64))

(assert (=> b!1414142 (= lt!623418 (select (arr!46638 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623417 () Unit!47872)

(assert (=> b!1414142 (= lt!623417 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623418 #b00000000000000000000000000000000))))

(assert (=> b!1414142 (arrayContainsKey!0 a!2901 lt!623418 #b00000000000000000000000000000000)))

(declare-fun lt!623419 () Unit!47872)

(assert (=> b!1414142 (= lt!623419 lt!623417)))

(declare-fun res!950765 () Bool)

(assert (=> b!1414142 (= res!950765 (= (seekEntryOrOpen!0 (select (arr!46638 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10949 #b00000000000000000000000000000000)))))

(assert (=> b!1414142 (=> (not res!950765) (not e!800325))))

(declare-fun b!1414143 () Bool)

(declare-fun call!67133 () Bool)

(assert (=> b!1414143 (= e!800325 call!67133)))

(declare-fun bm!67130 () Bool)

(assert (=> bm!67130 (= call!67133 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414144 () Bool)

(assert (=> b!1414144 (= e!800326 call!67133)))

(declare-fun d!152283 () Bool)

(declare-fun res!950766 () Bool)

(assert (=> d!152283 (=> res!950766 e!800324)))

(assert (=> d!152283 (= res!950766 (bvsge #b00000000000000000000000000000000 (size!47188 a!2901)))))

(assert (=> d!152283 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800324)))

(assert (= (and d!152283 (not res!950766)) b!1414141))

(assert (= (and b!1414141 c!131164) b!1414142))

(assert (= (and b!1414141 (not c!131164)) b!1414144))

(assert (= (and b!1414142 res!950765) b!1414143))

(assert (= (or b!1414143 b!1414144) bm!67130))

(declare-fun m!1304471 () Bool)

(assert (=> b!1414141 m!1304471))

(assert (=> b!1414141 m!1304471))

(declare-fun m!1304473 () Bool)

(assert (=> b!1414141 m!1304473))

(assert (=> b!1414142 m!1304471))

(declare-fun m!1304475 () Bool)

(assert (=> b!1414142 m!1304475))

(declare-fun m!1304477 () Bool)

(assert (=> b!1414142 m!1304477))

(assert (=> b!1414142 m!1304471))

(declare-fun m!1304479 () Bool)

(assert (=> b!1414142 m!1304479))

(declare-fun m!1304481 () Bool)

(assert (=> bm!67130 m!1304481))

(assert (=> b!1413909 d!152283))

(declare-fun b!1414145 () Bool)

(declare-fun lt!623421 () SeekEntryResult!10949)

(assert (=> b!1414145 (and (bvsge (index!46181 lt!623421) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623421) (size!47188 lt!623290)))))

(declare-fun e!800329 () Bool)

(assert (=> b!1414145 (= e!800329 (= (select (arr!46638 lt!623290) (index!46181 lt!623421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414146 () Bool)

(declare-fun e!800328 () SeekEntryResult!10949)

(assert (=> b!1414146 (= e!800328 (Intermediate!10949 false (toIndex!0 lt!623287 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414147 () Bool)

(declare-fun e!800327 () Bool)

(assert (=> b!1414147 (= e!800327 (bvsge (x!127768 lt!623421) #b01111111111111111111111111111110))))

(declare-fun b!1414148 () Bool)

(declare-fun e!800331 () Bool)

(assert (=> b!1414148 (= e!800327 e!800331)))

(declare-fun res!950767 () Bool)

(assert (=> b!1414148 (= res!950767 (and ((_ is Intermediate!10949) lt!623421) (not (undefined!11761 lt!623421)) (bvslt (x!127768 lt!623421) #b01111111111111111111111111111110) (bvsge (x!127768 lt!623421) #b00000000000000000000000000000000) (bvsge (x!127768 lt!623421) #b00000000000000000000000000000000)))))

(assert (=> b!1414148 (=> (not res!950767) (not e!800331))))

(declare-fun d!152285 () Bool)

(assert (=> d!152285 e!800327))

(declare-fun c!131165 () Bool)

(assert (=> d!152285 (= c!131165 (and ((_ is Intermediate!10949) lt!623421) (undefined!11761 lt!623421)))))

(declare-fun e!800330 () SeekEntryResult!10949)

(assert (=> d!152285 (= lt!623421 e!800330)))

(declare-fun c!131166 () Bool)

(assert (=> d!152285 (= c!131166 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623420 () (_ BitVec 64))

(assert (=> d!152285 (= lt!623420 (select (arr!46638 lt!623290) (toIndex!0 lt!623287 mask!2840)))))

(assert (=> d!152285 (validMask!0 mask!2840)))

(assert (=> d!152285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623287 mask!2840) lt!623287 lt!623290 mask!2840) lt!623421)))

(declare-fun b!1414149 () Bool)

(assert (=> b!1414149 (= e!800328 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623287 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623287 lt!623290 mask!2840))))

(declare-fun b!1414150 () Bool)

(assert (=> b!1414150 (and (bvsge (index!46181 lt!623421) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623421) (size!47188 lt!623290)))))

(declare-fun res!950768 () Bool)

(assert (=> b!1414150 (= res!950768 (= (select (arr!46638 lt!623290) (index!46181 lt!623421)) lt!623287))))

(assert (=> b!1414150 (=> res!950768 e!800329)))

(assert (=> b!1414150 (= e!800331 e!800329)))

(declare-fun b!1414151 () Bool)

(assert (=> b!1414151 (= e!800330 e!800328)))

(declare-fun c!131167 () Bool)

(assert (=> b!1414151 (= c!131167 (or (= lt!623420 lt!623287) (= (bvadd lt!623420 lt!623420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414152 () Bool)

(assert (=> b!1414152 (and (bvsge (index!46181 lt!623421) #b00000000000000000000000000000000) (bvslt (index!46181 lt!623421) (size!47188 lt!623290)))))

(declare-fun res!950769 () Bool)

(assert (=> b!1414152 (= res!950769 (= (select (arr!46638 lt!623290) (index!46181 lt!623421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414152 (=> res!950769 e!800329)))

(declare-fun b!1414153 () Bool)

(assert (=> b!1414153 (= e!800330 (Intermediate!10949 true (toIndex!0 lt!623287 mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!152285 c!131166) b!1414153))

(assert (= (and d!152285 (not c!131166)) b!1414151))

(assert (= (and b!1414151 c!131167) b!1414146))

(assert (= (and b!1414151 (not c!131167)) b!1414149))

(assert (= (and d!152285 c!131165) b!1414147))

(assert (= (and d!152285 (not c!131165)) b!1414148))

(assert (= (and b!1414148 res!950767) b!1414150))

(assert (= (and b!1414150 (not res!950768)) b!1414152))

(assert (= (and b!1414152 (not res!950769)) b!1414145))

(assert (=> d!152285 m!1304289))

(declare-fun m!1304483 () Bool)

(assert (=> d!152285 m!1304483))

(assert (=> d!152285 m!1304305))

(assert (=> b!1414149 m!1304289))

(declare-fun m!1304485 () Bool)

(assert (=> b!1414149 m!1304485))

(assert (=> b!1414149 m!1304485))

(declare-fun m!1304487 () Bool)

(assert (=> b!1414149 m!1304487))

(declare-fun m!1304489 () Bool)

(assert (=> b!1414145 m!1304489))

(assert (=> b!1414150 m!1304489))

(assert (=> b!1414152 m!1304489))

(assert (=> b!1413911 d!152285))

(declare-fun d!152287 () Bool)

(declare-fun lt!623423 () (_ BitVec 32))

(declare-fun lt!623422 () (_ BitVec 32))

(assert (=> d!152287 (= lt!623423 (bvmul (bvxor lt!623422 (bvlshr lt!623422 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152287 (= lt!623422 ((_ extract 31 0) (bvand (bvxor lt!623287 (bvlshr lt!623287 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152287 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950755 (let ((h!34435 ((_ extract 31 0) (bvand (bvxor lt!623287 (bvlshr lt!623287 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127778 (bvmul (bvxor h!34435 (bvlshr h!34435 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127778 (bvlshr x!127778 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950755 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950755 #b00000000000000000000000000000000))))))

(assert (=> d!152287 (= (toIndex!0 lt!623287 mask!2840) (bvand (bvxor lt!623423 (bvlshr lt!623423 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413911 d!152287))

(declare-fun b!1414176 () Bool)

(declare-fun e!800349 () Bool)

(declare-fun call!67136 () Bool)

(assert (=> b!1414176 (= e!800349 call!67136)))

(declare-fun b!1414177 () Bool)

(declare-fun e!800347 () Bool)

(assert (=> b!1414177 (= e!800347 e!800349)))

(declare-fun c!131176 () Bool)

(assert (=> b!1414177 (= c!131176 (validKeyInArray!0 (select (arr!46638 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414178 () Bool)

(declare-fun e!800346 () Bool)

(assert (=> b!1414178 (= e!800346 e!800347)))

(declare-fun res!950778 () Bool)

(assert (=> b!1414178 (=> (not res!950778) (not e!800347))))

(declare-fun e!800348 () Bool)

(assert (=> b!1414178 (= res!950778 (not e!800348))))

(declare-fun res!950777 () Bool)

(assert (=> b!1414178 (=> (not res!950777) (not e!800348))))

(assert (=> b!1414178 (= res!950777 (validKeyInArray!0 (select (arr!46638 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152289 () Bool)

(declare-fun res!950776 () Bool)

(assert (=> d!152289 (=> res!950776 e!800346)))

(assert (=> d!152289 (= res!950776 (bvsge #b00000000000000000000000000000000 (size!47188 a!2901)))))

(assert (=> d!152289 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33154) e!800346)))

(declare-fun bm!67133 () Bool)

(assert (=> bm!67133 (= call!67136 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131176 (Cons!33153 (select (arr!46638 a!2901) #b00000000000000000000000000000000) Nil!33154) Nil!33154)))))

(declare-fun b!1414179 () Bool)

(assert (=> b!1414179 (= e!800349 call!67136)))

(declare-fun b!1414180 () Bool)

(declare-fun contains!9818 (List!33157 (_ BitVec 64)) Bool)

(assert (=> b!1414180 (= e!800348 (contains!9818 Nil!33154 (select (arr!46638 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152289 (not res!950776)) b!1414178))

(assert (= (and b!1414178 res!950777) b!1414180))

(assert (= (and b!1414178 res!950778) b!1414177))

(assert (= (and b!1414177 c!131176) b!1414176))

(assert (= (and b!1414177 (not c!131176)) b!1414179))

(assert (= (or b!1414176 b!1414179) bm!67133))

(assert (=> b!1414177 m!1304471))

(assert (=> b!1414177 m!1304471))

(assert (=> b!1414177 m!1304473))

(assert (=> b!1414178 m!1304471))

(assert (=> b!1414178 m!1304471))

(assert (=> b!1414178 m!1304473))

(assert (=> bm!67133 m!1304471))

(declare-fun m!1304491 () Bool)

(assert (=> bm!67133 m!1304491))

(assert (=> b!1414180 m!1304471))

(assert (=> b!1414180 m!1304471))

(declare-fun m!1304493 () Bool)

(assert (=> b!1414180 m!1304493))

(assert (=> b!1413905 d!152289))

(declare-fun d!152291 () Bool)

(assert (=> d!152291 (= (validKeyInArray!0 (select (arr!46638 a!2901) j!112)) (and (not (= (select (arr!46638 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46638 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413910 d!152291))

(check-sat (not b!1414142) (not d!152251) (not bm!67126) (not d!152219) (not b!1414149) (not b!1414043) (not d!152285) (not d!152223) (not b!1414006) (not d!152247) (not b!1414178) (not b!1414011) (not bm!67133) (not b!1414180) (not bm!67130) (not b!1414044) (not b!1413957) (not b!1414177) (not d!152225) (not b!1414141) (not b!1414115) (not d!152241))
(check-sat)
