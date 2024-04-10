; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121580 () Bool)

(assert start!121580)

(declare-fun b!1412316 () Bool)

(declare-fun res!949308 () Bool)

(declare-fun e!799229 () Bool)

(assert (=> b!1412316 (=> (not res!949308) (not e!799229))))

(declare-datatypes ((array!96518 0))(
  ( (array!96519 (arr!46596 (Array (_ BitVec 32) (_ BitVec 64))) (size!47146 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96518)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412316 (= res!949308 (validKeyInArray!0 (select (arr!46596 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!799227 () Bool)

(declare-fun b!1412317 () Bool)

(declare-datatypes ((SeekEntryResult!10907 0))(
  ( (MissingZero!10907 (index!46008 (_ BitVec 32))) (Found!10907 (index!46009 (_ BitVec 32))) (Intermediate!10907 (undefined!11719 Bool) (index!46010 (_ BitVec 32)) (x!127602 (_ BitVec 32))) (Undefined!10907) (MissingVacant!10907 (index!46011 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96518 (_ BitVec 32)) SeekEntryResult!10907)

(assert (=> b!1412317 (= e!799227 (= (seekEntryOrOpen!0 (select (arr!46596 a!2901) j!112) a!2901 mask!2840) (Found!10907 j!112)))))

(declare-fun b!1412318 () Bool)

(declare-fun e!799228 () Bool)

(declare-fun e!799230 () Bool)

(assert (=> b!1412318 (= e!799228 e!799230)))

(declare-fun res!949306 () Bool)

(assert (=> b!1412318 (=> res!949306 e!799230)))

(declare-fun lt!622254 () SeekEntryResult!10907)

(declare-fun lt!622250 () SeekEntryResult!10907)

(get-info :version)

(assert (=> b!1412318 (= res!949306 (or (= lt!622254 lt!622250) (not ((_ is Intermediate!10907) lt!622250))))))

(declare-fun lt!622253 () array!96518)

(declare-fun lt!622249 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96518 (_ BitVec 32)) SeekEntryResult!10907)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412318 (= lt!622250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622249 mask!2840) lt!622249 lt!622253 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412318 (= lt!622249 (select (store (arr!46596 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412318 (= lt!622253 (array!96519 (store (arr!46596 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47146 a!2901)))))

(declare-fun b!1412319 () Bool)

(assert (=> b!1412319 (= e!799229 (not e!799228))))

(declare-fun res!949309 () Bool)

(assert (=> b!1412319 (=> res!949309 e!799228)))

(assert (=> b!1412319 (= res!949309 (or (not ((_ is Intermediate!10907) lt!622254)) (undefined!11719 lt!622254)))))

(assert (=> b!1412319 e!799227))

(declare-fun res!949314 () Bool)

(assert (=> b!1412319 (=> (not res!949314) (not e!799227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96518 (_ BitVec 32)) Bool)

(assert (=> b!1412319 (= res!949314 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47788 0))(
  ( (Unit!47789) )
))
(declare-fun lt!622251 () Unit!47788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47788)

(assert (=> b!1412319 (= lt!622251 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622252 () (_ BitVec 32))

(assert (=> b!1412319 (= lt!622254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622252 (select (arr!46596 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412319 (= lt!622252 (toIndex!0 (select (arr!46596 a!2901) j!112) mask!2840))))

(declare-fun b!1412320 () Bool)

(declare-fun res!949313 () Bool)

(assert (=> b!1412320 (=> (not res!949313) (not e!799229))))

(assert (=> b!1412320 (= res!949313 (and (= (size!47146 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47146 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47146 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!949312 () Bool)

(assert (=> start!121580 (=> (not res!949312) (not e!799229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121580 (= res!949312 (validMask!0 mask!2840))))

(assert (=> start!121580 e!799229))

(assert (=> start!121580 true))

(declare-fun array_inv!35624 (array!96518) Bool)

(assert (=> start!121580 (array_inv!35624 a!2901)))

(declare-fun b!1412321 () Bool)

(assert (=> b!1412321 (= e!799230 true)))

(declare-fun e!799231 () Bool)

(assert (=> b!1412321 e!799231))

(declare-fun res!949310 () Bool)

(assert (=> b!1412321 (=> (not res!949310) (not e!799231))))

(assert (=> b!1412321 (= res!949310 (and (not (undefined!11719 lt!622250)) (= (index!46010 lt!622250) i!1037) (bvslt (x!127602 lt!622250) (x!127602 lt!622254)) (= (select (store (arr!46596 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46010 lt!622250)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622248 () Unit!47788)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47788)

(assert (=> b!1412321 (= lt!622248 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622252 (x!127602 lt!622254) (index!46010 lt!622254) (x!127602 lt!622250) (index!46010 lt!622250) (undefined!11719 lt!622250) mask!2840))))

(declare-fun b!1412322 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96518 (_ BitVec 32)) SeekEntryResult!10907)

(assert (=> b!1412322 (= e!799231 (= (seekEntryOrOpen!0 lt!622249 lt!622253 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127602 lt!622250) (index!46010 lt!622250) (index!46010 lt!622250) (select (arr!46596 a!2901) j!112) lt!622253 mask!2840)))))

(declare-fun b!1412323 () Bool)

(declare-fun res!949307 () Bool)

(assert (=> b!1412323 (=> (not res!949307) (not e!799229))))

(assert (=> b!1412323 (= res!949307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412324 () Bool)

(declare-fun res!949311 () Bool)

(assert (=> b!1412324 (=> (not res!949311) (not e!799229))))

(assert (=> b!1412324 (= res!949311 (validKeyInArray!0 (select (arr!46596 a!2901) i!1037)))))

(declare-fun b!1412325 () Bool)

(declare-fun res!949315 () Bool)

(assert (=> b!1412325 (=> (not res!949315) (not e!799229))))

(declare-datatypes ((List!33115 0))(
  ( (Nil!33112) (Cons!33111 (h!34386 (_ BitVec 64)) (t!47809 List!33115)) )
))
(declare-fun arrayNoDuplicates!0 (array!96518 (_ BitVec 32) List!33115) Bool)

(assert (=> b!1412325 (= res!949315 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33112))))

(assert (= (and start!121580 res!949312) b!1412320))

(assert (= (and b!1412320 res!949313) b!1412324))

(assert (= (and b!1412324 res!949311) b!1412316))

(assert (= (and b!1412316 res!949308) b!1412323))

(assert (= (and b!1412323 res!949307) b!1412325))

(assert (= (and b!1412325 res!949315) b!1412319))

(assert (= (and b!1412319 res!949314) b!1412317))

(assert (= (and b!1412319 (not res!949309)) b!1412318))

(assert (= (and b!1412318 (not res!949306)) b!1412321))

(assert (= (and b!1412321 res!949310) b!1412322))

(declare-fun m!1302291 () Bool)

(assert (=> b!1412323 m!1302291))

(declare-fun m!1302293 () Bool)

(assert (=> b!1412321 m!1302293))

(declare-fun m!1302295 () Bool)

(assert (=> b!1412321 m!1302295))

(declare-fun m!1302297 () Bool)

(assert (=> b!1412321 m!1302297))

(declare-fun m!1302299 () Bool)

(assert (=> b!1412322 m!1302299))

(declare-fun m!1302301 () Bool)

(assert (=> b!1412322 m!1302301))

(assert (=> b!1412322 m!1302301))

(declare-fun m!1302303 () Bool)

(assert (=> b!1412322 m!1302303))

(assert (=> b!1412316 m!1302301))

(assert (=> b!1412316 m!1302301))

(declare-fun m!1302305 () Bool)

(assert (=> b!1412316 m!1302305))

(assert (=> b!1412319 m!1302301))

(declare-fun m!1302307 () Bool)

(assert (=> b!1412319 m!1302307))

(assert (=> b!1412319 m!1302301))

(declare-fun m!1302309 () Bool)

(assert (=> b!1412319 m!1302309))

(assert (=> b!1412319 m!1302301))

(declare-fun m!1302311 () Bool)

(assert (=> b!1412319 m!1302311))

(declare-fun m!1302313 () Bool)

(assert (=> b!1412319 m!1302313))

(declare-fun m!1302315 () Bool)

(assert (=> b!1412324 m!1302315))

(assert (=> b!1412324 m!1302315))

(declare-fun m!1302317 () Bool)

(assert (=> b!1412324 m!1302317))

(assert (=> b!1412317 m!1302301))

(assert (=> b!1412317 m!1302301))

(declare-fun m!1302319 () Bool)

(assert (=> b!1412317 m!1302319))

(declare-fun m!1302321 () Bool)

(assert (=> start!121580 m!1302321))

(declare-fun m!1302323 () Bool)

(assert (=> start!121580 m!1302323))

(declare-fun m!1302325 () Bool)

(assert (=> b!1412318 m!1302325))

(assert (=> b!1412318 m!1302325))

(declare-fun m!1302327 () Bool)

(assert (=> b!1412318 m!1302327))

(assert (=> b!1412318 m!1302293))

(declare-fun m!1302329 () Bool)

(assert (=> b!1412318 m!1302329))

(declare-fun m!1302331 () Bool)

(assert (=> b!1412325 m!1302331))

(check-sat (not b!1412316) (not b!1412319) (not start!121580) (not b!1412322) (not b!1412317) (not b!1412321) (not b!1412323) (not b!1412318) (not b!1412324) (not b!1412325))
(check-sat)
