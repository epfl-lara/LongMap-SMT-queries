; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125184 () Bool)

(assert start!125184)

(declare-fun b!1453992 () Bool)

(declare-fun res!984265 () Bool)

(declare-fun e!818569 () Bool)

(assert (=> b!1453992 (=> (not res!984265) (not e!818569))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98527 0))(
  ( (array!98528 (arr!47548 (Array (_ BitVec 32) (_ BitVec 64))) (size!48099 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98527)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453992 (= res!984265 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48099 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48099 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48099 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!818566 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1453993 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453993 (= e!818566 (and (or (= (select (arr!47548 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47548 a!2862) intermediateBeforeIndex!19) (select (arr!47548 a!2862) j!93))) (or (and (= (select (arr!47548 a!2862) index!646) (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47548 a!2862) index!646) (select (arr!47548 a!2862) j!93))) (= (select (arr!47548 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1453994 () Bool)

(declare-fun e!818571 () Bool)

(assert (=> b!1453994 (= e!818569 e!818571)))

(declare-fun res!984269 () Bool)

(assert (=> b!1453994 (=> (not res!984269) (not e!818571))))

(assert (=> b!1453994 (= res!984269 (= (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637491 () array!98527)

(assert (=> b!1453994 (= lt!637491 (array!98528 (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48099 a!2862)))))

(declare-fun b!1453995 () Bool)

(declare-fun res!984260 () Bool)

(assert (=> b!1453995 (=> (not res!984260) (not e!818569))))

(declare-datatypes ((List!34036 0))(
  ( (Nil!34033) (Cons!34032 (h!35393 (_ BitVec 64)) (t!48722 List!34036)) )
))
(declare-fun arrayNoDuplicates!0 (array!98527 (_ BitVec 32) List!34036) Bool)

(assert (=> b!1453995 (= res!984260 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34033))))

(declare-fun b!1453996 () Bool)

(declare-fun res!984267 () Bool)

(assert (=> b!1453996 (=> (not res!984267) (not e!818569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453996 (= res!984267 (validKeyInArray!0 (select (arr!47548 a!2862) j!93)))))

(declare-fun b!1453997 () Bool)

(declare-fun res!984263 () Bool)

(declare-fun e!818567 () Bool)

(assert (=> b!1453997 (=> (not res!984263) (not e!818567))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11697 0))(
  ( (MissingZero!11697 (index!49180 (_ BitVec 32))) (Found!11697 (index!49181 (_ BitVec 32))) (Intermediate!11697 (undefined!12509 Bool) (index!49182 (_ BitVec 32)) (x!131002 (_ BitVec 32))) (Undefined!11697) (MissingVacant!11697 (index!49183 (_ BitVec 32))) )
))
(declare-fun lt!637490 () SeekEntryResult!11697)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98527 (_ BitVec 32)) SeekEntryResult!11697)

(assert (=> b!1453997 (= res!984263 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47548 a!2862) j!93) a!2862 mask!2687) lt!637490))))

(declare-fun b!1453998 () Bool)

(declare-fun res!984266 () Bool)

(assert (=> b!1453998 (=> (not res!984266) (not e!818569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98527 (_ BitVec 32)) Bool)

(assert (=> b!1453998 (= res!984266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453999 () Bool)

(declare-fun e!818570 () Bool)

(assert (=> b!1453999 (= e!818567 e!818570)))

(declare-fun res!984264 () Bool)

(assert (=> b!1453999 (=> (not res!984264) (not e!818570))))

(declare-fun lt!637488 () SeekEntryResult!11697)

(assert (=> b!1453999 (= res!984264 (= lt!637488 (Intermediate!11697 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637489 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453999 (= lt!637488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637489 mask!2687) lt!637489 lt!637491 mask!2687))))

(assert (=> b!1453999 (= lt!637489 (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!818565 () Bool)

(declare-fun b!1454000 () Bool)

(assert (=> b!1454000 (= e!818565 (= lt!637488 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637489 lt!637491 mask!2687)))))

(declare-fun b!1454001 () Bool)

(assert (=> b!1454001 (= e!818571 e!818567)))

(declare-fun res!984261 () Bool)

(assert (=> b!1454001 (=> (not res!984261) (not e!818567))))

(assert (=> b!1454001 (= res!984261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47548 a!2862) j!93) mask!2687) (select (arr!47548 a!2862) j!93) a!2862 mask!2687) lt!637490))))

(assert (=> b!1454001 (= lt!637490 (Intermediate!11697 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454002 () Bool)

(declare-fun res!984271 () Bool)

(assert (=> b!1454002 (=> (not res!984271) (not e!818569))))

(assert (=> b!1454002 (= res!984271 (validKeyInArray!0 (select (arr!47548 a!2862) i!1006)))))

(declare-fun b!1454003 () Bool)

(declare-fun res!984259 () Bool)

(assert (=> b!1454003 (=> (not res!984259) (not e!818570))))

(assert (=> b!1454003 (= res!984259 e!818565)))

(declare-fun c!134386 () Bool)

(assert (=> b!1454003 (= c!134386 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454004 () Bool)

(declare-fun res!984262 () Bool)

(assert (=> b!1454004 (=> (not res!984262) (not e!818566))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98527 (_ BitVec 32)) SeekEntryResult!11697)

(assert (=> b!1454004 (= res!984262 (= (seekEntryOrOpen!0 (select (arr!47548 a!2862) j!93) a!2862 mask!2687) (Found!11697 j!93)))))

(declare-fun res!984270 () Bool)

(assert (=> start!125184 (=> (not res!984270) (not e!818569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125184 (= res!984270 (validMask!0 mask!2687))))

(assert (=> start!125184 e!818569))

(assert (=> start!125184 true))

(declare-fun array_inv!36829 (array!98527) Bool)

(assert (=> start!125184 (array_inv!36829 a!2862)))

(declare-fun b!1454005 () Bool)

(assert (=> b!1454005 (= e!818570 (not true))))

(assert (=> b!1454005 e!818566))

(declare-fun res!984268 () Bool)

(assert (=> b!1454005 (=> (not res!984268) (not e!818566))))

(assert (=> b!1454005 (= res!984268 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48923 0))(
  ( (Unit!48924) )
))
(declare-fun lt!637492 () Unit!48923)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48923)

(assert (=> b!1454005 (= lt!637492 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454006 () Bool)

(declare-fun res!984258 () Bool)

(assert (=> b!1454006 (=> (not res!984258) (not e!818569))))

(assert (=> b!1454006 (= res!984258 (and (= (size!48099 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48099 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48099 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454007 () Bool)

(declare-fun res!984272 () Bool)

(assert (=> b!1454007 (=> (not res!984272) (not e!818570))))

(assert (=> b!1454007 (= res!984272 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454008 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98527 (_ BitVec 32)) SeekEntryResult!11697)

(assert (=> b!1454008 (= e!818565 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637489 lt!637491 mask!2687) (seekEntryOrOpen!0 lt!637489 lt!637491 mask!2687)))))

(assert (= (and start!125184 res!984270) b!1454006))

(assert (= (and b!1454006 res!984258) b!1454002))

(assert (= (and b!1454002 res!984271) b!1453996))

(assert (= (and b!1453996 res!984267) b!1453998))

(assert (= (and b!1453998 res!984266) b!1453995))

(assert (= (and b!1453995 res!984260) b!1453992))

(assert (= (and b!1453992 res!984265) b!1453994))

(assert (= (and b!1453994 res!984269) b!1454001))

(assert (= (and b!1454001 res!984261) b!1453997))

(assert (= (and b!1453997 res!984263) b!1453999))

(assert (= (and b!1453999 res!984264) b!1454003))

(assert (= (and b!1454003 c!134386) b!1454000))

(assert (= (and b!1454003 (not c!134386)) b!1454008))

(assert (= (and b!1454003 res!984259) b!1454007))

(assert (= (and b!1454007 res!984272) b!1454005))

(assert (= (and b!1454005 res!984268) b!1454004))

(assert (= (and b!1454004 res!984262) b!1453993))

(declare-fun m!1342675 () Bool)

(assert (=> b!1454005 m!1342675))

(declare-fun m!1342677 () Bool)

(assert (=> b!1454005 m!1342677))

(declare-fun m!1342679 () Bool)

(assert (=> b!1453993 m!1342679))

(declare-fun m!1342681 () Bool)

(assert (=> b!1453993 m!1342681))

(declare-fun m!1342683 () Bool)

(assert (=> b!1453993 m!1342683))

(declare-fun m!1342685 () Bool)

(assert (=> b!1453993 m!1342685))

(declare-fun m!1342687 () Bool)

(assert (=> b!1453993 m!1342687))

(assert (=> b!1454004 m!1342687))

(assert (=> b!1454004 m!1342687))

(declare-fun m!1342689 () Bool)

(assert (=> b!1454004 m!1342689))

(assert (=> b!1453994 m!1342679))

(declare-fun m!1342691 () Bool)

(assert (=> b!1453994 m!1342691))

(declare-fun m!1342693 () Bool)

(assert (=> b!1453999 m!1342693))

(assert (=> b!1453999 m!1342693))

(declare-fun m!1342695 () Bool)

(assert (=> b!1453999 m!1342695))

(assert (=> b!1453999 m!1342679))

(declare-fun m!1342697 () Bool)

(assert (=> b!1453999 m!1342697))

(declare-fun m!1342699 () Bool)

(assert (=> b!1453995 m!1342699))

(assert (=> b!1454001 m!1342687))

(assert (=> b!1454001 m!1342687))

(declare-fun m!1342701 () Bool)

(assert (=> b!1454001 m!1342701))

(assert (=> b!1454001 m!1342701))

(assert (=> b!1454001 m!1342687))

(declare-fun m!1342703 () Bool)

(assert (=> b!1454001 m!1342703))

(assert (=> b!1453997 m!1342687))

(assert (=> b!1453997 m!1342687))

(declare-fun m!1342705 () Bool)

(assert (=> b!1453997 m!1342705))

(declare-fun m!1342707 () Bool)

(assert (=> b!1454008 m!1342707))

(declare-fun m!1342709 () Bool)

(assert (=> b!1454008 m!1342709))

(declare-fun m!1342711 () Bool)

(assert (=> b!1454002 m!1342711))

(assert (=> b!1454002 m!1342711))

(declare-fun m!1342713 () Bool)

(assert (=> b!1454002 m!1342713))

(declare-fun m!1342715 () Bool)

(assert (=> start!125184 m!1342715))

(declare-fun m!1342717 () Bool)

(assert (=> start!125184 m!1342717))

(declare-fun m!1342719 () Bool)

(assert (=> b!1453998 m!1342719))

(assert (=> b!1453996 m!1342687))

(assert (=> b!1453996 m!1342687))

(declare-fun m!1342721 () Bool)

(assert (=> b!1453996 m!1342721))

(declare-fun m!1342723 () Bool)

(assert (=> b!1454000 m!1342723))

(check-sat (not start!125184) (not b!1454005) (not b!1454004) (not b!1453998) (not b!1453999) (not b!1453997) (not b!1454008) (not b!1454000) (not b!1454001) (not b!1453995) (not b!1453996) (not b!1454002))
(check-sat)
