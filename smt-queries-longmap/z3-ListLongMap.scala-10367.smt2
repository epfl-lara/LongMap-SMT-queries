; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122012 () Bool)

(assert start!122012)

(declare-fun b!1416150 () Bool)

(declare-fun res!952247 () Bool)

(declare-fun e!801518 () Bool)

(assert (=> b!1416150 (=> (not res!952247) (not e!801518))))

(declare-datatypes ((array!96651 0))(
  ( (array!96652 (arr!46657 (Array (_ BitVec 32) (_ BitVec 64))) (size!47209 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96651)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416150 (= res!952247 (validKeyInArray!0 (select (arr!46657 a!2901) i!1037)))))

(declare-fun b!1416151 () Bool)

(declare-fun e!801515 () Bool)

(declare-fun e!801517 () Bool)

(assert (=> b!1416151 (= e!801515 e!801517)))

(declare-fun res!952248 () Bool)

(assert (=> b!1416151 (=> res!952248 e!801517)))

(declare-datatypes ((SeekEntryResult!10994 0))(
  ( (MissingZero!10994 (index!46368 (_ BitVec 32))) (Found!10994 (index!46369 (_ BitVec 32))) (Intermediate!10994 (undefined!11806 Bool) (index!46370 (_ BitVec 32)) (x!127966 (_ BitVec 32))) (Undefined!10994) (MissingVacant!10994 (index!46371 (_ BitVec 32))) )
))
(declare-fun lt!624601 () SeekEntryResult!10994)

(declare-fun lt!624594 () SeekEntryResult!10994)

(get-info :version)

(assert (=> b!1416151 (= res!952248 (or (= lt!624601 lt!624594) (not ((_ is Intermediate!10994) lt!624594))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624602 () (_ BitVec 64))

(declare-fun lt!624600 () array!96651)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96651 (_ BitVec 32)) SeekEntryResult!10994)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416151 (= lt!624594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624602 mask!2840) lt!624602 lt!624600 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416151 (= lt!624602 (select (store (arr!46657 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416151 (= lt!624600 (array!96652 (store (arr!46657 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47209 a!2901)))))

(declare-fun b!1416152 () Bool)

(declare-fun e!801516 () Bool)

(assert (=> b!1416152 (= e!801517 e!801516)))

(declare-fun res!952246 () Bool)

(assert (=> b!1416152 (=> res!952246 e!801516)))

(declare-fun lt!624599 () (_ BitVec 32))

(assert (=> b!1416152 (= res!952246 (or (bvslt (x!127966 lt!624601) #b00000000000000000000000000000000) (bvsgt (x!127966 lt!624601) #b01111111111111111111111111111110) (bvslt (x!127966 lt!624594) #b00000000000000000000000000000000) (bvsgt (x!127966 lt!624594) #b01111111111111111111111111111110) (bvslt lt!624599 #b00000000000000000000000000000000) (bvsge lt!624599 (size!47209 a!2901)) (bvslt (index!46370 lt!624601) #b00000000000000000000000000000000) (bvsge (index!46370 lt!624601) (size!47209 a!2901)) (bvslt (index!46370 lt!624594) #b00000000000000000000000000000000) (bvsge (index!46370 lt!624594) (size!47209 a!2901)) (not (= lt!624601 (Intermediate!10994 false (index!46370 lt!624601) (x!127966 lt!624601)))) (not (= lt!624594 (Intermediate!10994 false (index!46370 lt!624594) (x!127966 lt!624594))))))))

(declare-fun lt!624593 () SeekEntryResult!10994)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96651 (_ BitVec 32)) SeekEntryResult!10994)

(assert (=> b!1416152 (= lt!624593 (seekKeyOrZeroReturnVacant!0 (x!127966 lt!624594) (index!46370 lt!624594) (index!46370 lt!624594) (select (arr!46657 a!2901) j!112) lt!624600 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96651 (_ BitVec 32)) SeekEntryResult!10994)

(assert (=> b!1416152 (= lt!624593 (seekEntryOrOpen!0 lt!624602 lt!624600 mask!2840))))

(assert (=> b!1416152 (and (not (undefined!11806 lt!624594)) (= (index!46370 lt!624594) i!1037) (bvslt (x!127966 lt!624594) (x!127966 lt!624601)) (= (select (store (arr!46657 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46370 lt!624594)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47805 0))(
  ( (Unit!47806) )
))
(declare-fun lt!624595 () Unit!47805)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47805)

(assert (=> b!1416152 (= lt!624595 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624599 (x!127966 lt!624601) (index!46370 lt!624601) (x!127966 lt!624594) (index!46370 lt!624594) (undefined!11806 lt!624594) mask!2840))))

(declare-fun b!1416153 () Bool)

(declare-fun res!952245 () Bool)

(assert (=> b!1416153 (=> (not res!952245) (not e!801518))))

(assert (=> b!1416153 (= res!952245 (and (= (size!47209 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47209 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47209 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416154 () Bool)

(declare-fun res!952243 () Bool)

(assert (=> b!1416154 (=> res!952243 e!801516)))

(assert (=> b!1416154 (= res!952243 (not (= lt!624594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624599 lt!624602 lt!624600 mask!2840))))))

(declare-fun b!1416155 () Bool)

(declare-fun res!952251 () Bool)

(assert (=> b!1416155 (=> (not res!952251) (not e!801518))))

(declare-datatypes ((List!33254 0))(
  ( (Nil!33251) (Cons!33250 (h!34537 (_ BitVec 64)) (t!47940 List!33254)) )
))
(declare-fun arrayNoDuplicates!0 (array!96651 (_ BitVec 32) List!33254) Bool)

(assert (=> b!1416155 (= res!952251 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33251))))

(declare-fun b!1416156 () Bool)

(declare-fun res!952244 () Bool)

(assert (=> b!1416156 (=> (not res!952244) (not e!801518))))

(assert (=> b!1416156 (= res!952244 (validKeyInArray!0 (select (arr!46657 a!2901) j!112)))))

(declare-fun res!952250 () Bool)

(assert (=> start!122012 (=> (not res!952250) (not e!801518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122012 (= res!952250 (validMask!0 mask!2840))))

(assert (=> start!122012 e!801518))

(assert (=> start!122012 true))

(declare-fun array_inv!35890 (array!96651) Bool)

(assert (=> start!122012 (array_inv!35890 a!2901)))

(declare-fun b!1416157 () Bool)

(assert (=> b!1416157 (= e!801518 (not e!801515))))

(declare-fun res!952252 () Bool)

(assert (=> b!1416157 (=> res!952252 e!801515)))

(assert (=> b!1416157 (= res!952252 (or (not ((_ is Intermediate!10994) lt!624601)) (undefined!11806 lt!624601)))))

(declare-fun lt!624597 () SeekEntryResult!10994)

(assert (=> b!1416157 (= lt!624597 (Found!10994 j!112))))

(assert (=> b!1416157 (= lt!624597 (seekEntryOrOpen!0 (select (arr!46657 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96651 (_ BitVec 32)) Bool)

(assert (=> b!1416157 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624596 () Unit!47805)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47805)

(assert (=> b!1416157 (= lt!624596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416157 (= lt!624601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624599 (select (arr!46657 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416157 (= lt!624599 (toIndex!0 (select (arr!46657 a!2901) j!112) mask!2840))))

(declare-fun b!1416158 () Bool)

(declare-fun res!952249 () Bool)

(assert (=> b!1416158 (=> (not res!952249) (not e!801518))))

(assert (=> b!1416158 (= res!952249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416159 () Bool)

(assert (=> b!1416159 (= e!801516 true)))

(assert (=> b!1416159 (= lt!624597 lt!624593)))

(declare-fun lt!624598 () Unit!47805)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47805)

(assert (=> b!1416159 (= lt!624598 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624599 (x!127966 lt!624601) (index!46370 lt!624601) (x!127966 lt!624594) (index!46370 lt!624594) mask!2840))))

(assert (= (and start!122012 res!952250) b!1416153))

(assert (= (and b!1416153 res!952245) b!1416150))

(assert (= (and b!1416150 res!952247) b!1416156))

(assert (= (and b!1416156 res!952244) b!1416158))

(assert (= (and b!1416158 res!952249) b!1416155))

(assert (= (and b!1416155 res!952251) b!1416157))

(assert (= (and b!1416157 (not res!952252)) b!1416151))

(assert (= (and b!1416151 (not res!952248)) b!1416152))

(assert (= (and b!1416152 (not res!952246)) b!1416154))

(assert (= (and b!1416154 (not res!952243)) b!1416159))

(declare-fun m!1306309 () Bool)

(assert (=> b!1416151 m!1306309))

(assert (=> b!1416151 m!1306309))

(declare-fun m!1306311 () Bool)

(assert (=> b!1416151 m!1306311))

(declare-fun m!1306313 () Bool)

(assert (=> b!1416151 m!1306313))

(declare-fun m!1306315 () Bool)

(assert (=> b!1416151 m!1306315))

(declare-fun m!1306317 () Bool)

(assert (=> start!122012 m!1306317))

(declare-fun m!1306319 () Bool)

(assert (=> start!122012 m!1306319))

(declare-fun m!1306321 () Bool)

(assert (=> b!1416154 m!1306321))

(declare-fun m!1306323 () Bool)

(assert (=> b!1416152 m!1306323))

(declare-fun m!1306325 () Bool)

(assert (=> b!1416152 m!1306325))

(assert (=> b!1416152 m!1306323))

(declare-fun m!1306327 () Bool)

(assert (=> b!1416152 m!1306327))

(declare-fun m!1306329 () Bool)

(assert (=> b!1416152 m!1306329))

(declare-fun m!1306331 () Bool)

(assert (=> b!1416152 m!1306331))

(assert (=> b!1416152 m!1306313))

(declare-fun m!1306333 () Bool)

(assert (=> b!1416150 m!1306333))

(assert (=> b!1416150 m!1306333))

(declare-fun m!1306335 () Bool)

(assert (=> b!1416150 m!1306335))

(declare-fun m!1306337 () Bool)

(assert (=> b!1416159 m!1306337))

(declare-fun m!1306339 () Bool)

(assert (=> b!1416158 m!1306339))

(assert (=> b!1416156 m!1306323))

(assert (=> b!1416156 m!1306323))

(declare-fun m!1306341 () Bool)

(assert (=> b!1416156 m!1306341))

(declare-fun m!1306343 () Bool)

(assert (=> b!1416155 m!1306343))

(assert (=> b!1416157 m!1306323))

(declare-fun m!1306345 () Bool)

(assert (=> b!1416157 m!1306345))

(assert (=> b!1416157 m!1306323))

(declare-fun m!1306347 () Bool)

(assert (=> b!1416157 m!1306347))

(assert (=> b!1416157 m!1306323))

(declare-fun m!1306349 () Bool)

(assert (=> b!1416157 m!1306349))

(assert (=> b!1416157 m!1306323))

(declare-fun m!1306351 () Bool)

(assert (=> b!1416157 m!1306351))

(declare-fun m!1306353 () Bool)

(assert (=> b!1416157 m!1306353))

(check-sat (not b!1416154) (not b!1416159) (not b!1416152) (not b!1416151) (not b!1416158) (not b!1416157) (not b!1416150) (not start!122012) (not b!1416156) (not b!1416155))
(check-sat)
