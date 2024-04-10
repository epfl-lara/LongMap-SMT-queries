; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126418 () Bool)

(assert start!126418)

(declare-fun b!1482487 () Bool)

(declare-fun e!831314 () Bool)

(declare-fun e!831308 () Bool)

(assert (=> b!1482487 (= e!831314 (not e!831308))))

(declare-fun res!1007704 () Bool)

(assert (=> b!1482487 (=> res!1007704 e!831308)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99437 0))(
  ( (array!99438 (arr!47996 (Array (_ BitVec 32) (_ BitVec 64))) (size!48546 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99437)

(assert (=> b!1482487 (= res!1007704 (or (and (= (select (arr!47996 a!2862) index!646) (select (store (arr!47996 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47996 a!2862) index!646) (select (arr!47996 a!2862) j!93))) (= (select (arr!47996 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!831313 () Bool)

(assert (=> b!1482487 e!831313))

(declare-fun res!1007689 () Bool)

(assert (=> b!1482487 (=> (not res!1007689) (not e!831313))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99437 (_ BitVec 32)) Bool)

(assert (=> b!1482487 (= res!1007689 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49812 0))(
  ( (Unit!49813) )
))
(declare-fun lt!647088 () Unit!49812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49812)

(assert (=> b!1482487 (= lt!647088 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!647087 () array!99437)

(declare-datatypes ((SeekEntryResult!12236 0))(
  ( (MissingZero!12236 (index!51336 (_ BitVec 32))) (Found!12236 (index!51337 (_ BitVec 32))) (Intermediate!12236 (undefined!13048 Bool) (index!51338 (_ BitVec 32)) (x!132919 (_ BitVec 32))) (Undefined!12236) (MissingVacant!12236 (index!51339 (_ BitVec 32))) )
))
(declare-fun lt!647085 () SeekEntryResult!12236)

(declare-fun e!831307 () Bool)

(declare-fun b!1482488 () Bool)

(declare-fun lt!647084 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99437 (_ BitVec 32)) SeekEntryResult!12236)

(assert (=> b!1482488 (= e!831307 (= lt!647085 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647084 lt!647087 mask!2687)))))

(declare-fun b!1482489 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99437 (_ BitVec 32)) SeekEntryResult!12236)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99437 (_ BitVec 32)) SeekEntryResult!12236)

(assert (=> b!1482489 (= e!831308 (= (seekEntryOrOpen!0 lt!647084 lt!647087 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647084 lt!647087 mask!2687)))))

(declare-fun b!1482490 () Bool)

(declare-fun res!1007697 () Bool)

(declare-fun e!831309 () Bool)

(assert (=> b!1482490 (=> (not res!1007697) (not e!831309))))

(declare-fun lt!647086 () SeekEntryResult!12236)

(assert (=> b!1482490 (= res!1007697 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47996 a!2862) j!93) a!2862 mask!2687) lt!647086))))

(declare-fun b!1482491 () Bool)

(declare-fun res!1007692 () Bool)

(declare-fun e!831312 () Bool)

(assert (=> b!1482491 (=> (not res!1007692) (not e!831312))))

(assert (=> b!1482491 (= res!1007692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482492 () Bool)

(declare-fun res!1007702 () Bool)

(assert (=> b!1482492 (=> (not res!1007702) (not e!831314))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482492 (= res!1007702 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482493 () Bool)

(declare-fun res!1007693 () Bool)

(assert (=> b!1482493 (=> (not res!1007693) (not e!831312))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1482493 (= res!1007693 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48546 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48546 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48546 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482494 () Bool)

(declare-fun e!831310 () Bool)

(assert (=> b!1482494 (= e!831312 e!831310)))

(declare-fun res!1007691 () Bool)

(assert (=> b!1482494 (=> (not res!1007691) (not e!831310))))

(assert (=> b!1482494 (= res!1007691 (= (select (store (arr!47996 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482494 (= lt!647087 (array!99438 (store (arr!47996 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48546 a!2862)))))

(declare-fun b!1482495 () Bool)

(declare-fun res!1007700 () Bool)

(assert (=> b!1482495 (=> (not res!1007700) (not e!831312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482495 (= res!1007700 (validKeyInArray!0 (select (arr!47996 a!2862) i!1006)))))

(declare-fun b!1482496 () Bool)

(declare-fun res!1007699 () Bool)

(assert (=> b!1482496 (=> (not res!1007699) (not e!831314))))

(assert (=> b!1482496 (= res!1007699 e!831307)))

(declare-fun c!136920 () Bool)

(assert (=> b!1482496 (= c!136920 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482497 () Bool)

(assert (=> b!1482497 (= e!831310 e!831309)))

(declare-fun res!1007698 () Bool)

(assert (=> b!1482497 (=> (not res!1007698) (not e!831309))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482497 (= res!1007698 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47996 a!2862) j!93) mask!2687) (select (arr!47996 a!2862) j!93) a!2862 mask!2687) lt!647086))))

(assert (=> b!1482497 (= lt!647086 (Intermediate!12236 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482498 () Bool)

(declare-fun res!1007701 () Bool)

(assert (=> b!1482498 (=> (not res!1007701) (not e!831312))))

(declare-datatypes ((List!34497 0))(
  ( (Nil!34494) (Cons!34493 (h!35864 (_ BitVec 64)) (t!49191 List!34497)) )
))
(declare-fun arrayNoDuplicates!0 (array!99437 (_ BitVec 32) List!34497) Bool)

(assert (=> b!1482498 (= res!1007701 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34494))))

(declare-fun b!1482499 () Bool)

(declare-fun res!1007696 () Bool)

(assert (=> b!1482499 (=> (not res!1007696) (not e!831313))))

(assert (=> b!1482499 (= res!1007696 (= (seekEntryOrOpen!0 (select (arr!47996 a!2862) j!93) a!2862 mask!2687) (Found!12236 j!93)))))

(declare-fun b!1482500 () Bool)

(declare-fun res!1007690 () Bool)

(assert (=> b!1482500 (=> (not res!1007690) (not e!831312))))

(assert (=> b!1482500 (= res!1007690 (and (= (size!48546 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48546 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48546 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1007703 () Bool)

(assert (=> start!126418 (=> (not res!1007703) (not e!831312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126418 (= res!1007703 (validMask!0 mask!2687))))

(assert (=> start!126418 e!831312))

(assert (=> start!126418 true))

(declare-fun array_inv!37024 (array!99437) Bool)

(assert (=> start!126418 (array_inv!37024 a!2862)))

(declare-fun b!1482501 () Bool)

(declare-fun res!1007694 () Bool)

(assert (=> b!1482501 (=> (not res!1007694) (not e!831312))))

(assert (=> b!1482501 (= res!1007694 (validKeyInArray!0 (select (arr!47996 a!2862) j!93)))))

(declare-fun b!1482502 () Bool)

(assert (=> b!1482502 (= e!831313 (and (or (= (select (arr!47996 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47996 a!2862) intermediateBeforeIndex!19) (select (arr!47996 a!2862) j!93))) (let ((bdg!54266 (select (store (arr!47996 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47996 a!2862) index!646) bdg!54266) (= (select (arr!47996 a!2862) index!646) (select (arr!47996 a!2862) j!93))) (= (select (arr!47996 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54266 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1482503 () Bool)

(assert (=> b!1482503 (= e!831307 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647084 lt!647087 mask!2687) (seekEntryOrOpen!0 lt!647084 lt!647087 mask!2687)))))

(declare-fun b!1482504 () Bool)

(assert (=> b!1482504 (= e!831309 e!831314)))

(declare-fun res!1007695 () Bool)

(assert (=> b!1482504 (=> (not res!1007695) (not e!831314))))

(assert (=> b!1482504 (= res!1007695 (= lt!647085 (Intermediate!12236 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1482504 (= lt!647085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647084 mask!2687) lt!647084 lt!647087 mask!2687))))

(assert (=> b!1482504 (= lt!647084 (select (store (arr!47996 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126418 res!1007703) b!1482500))

(assert (= (and b!1482500 res!1007690) b!1482495))

(assert (= (and b!1482495 res!1007700) b!1482501))

(assert (= (and b!1482501 res!1007694) b!1482491))

(assert (= (and b!1482491 res!1007692) b!1482498))

(assert (= (and b!1482498 res!1007701) b!1482493))

(assert (= (and b!1482493 res!1007693) b!1482494))

(assert (= (and b!1482494 res!1007691) b!1482497))

(assert (= (and b!1482497 res!1007698) b!1482490))

(assert (= (and b!1482490 res!1007697) b!1482504))

(assert (= (and b!1482504 res!1007695) b!1482496))

(assert (= (and b!1482496 c!136920) b!1482488))

(assert (= (and b!1482496 (not c!136920)) b!1482503))

(assert (= (and b!1482496 res!1007699) b!1482492))

(assert (= (and b!1482492 res!1007702) b!1482487))

(assert (= (and b!1482487 res!1007689) b!1482499))

(assert (= (and b!1482499 res!1007696) b!1482502))

(assert (= (and b!1482487 (not res!1007704)) b!1482489))

(declare-fun m!1368205 () Bool)

(assert (=> b!1482495 m!1368205))

(assert (=> b!1482495 m!1368205))

(declare-fun m!1368207 () Bool)

(assert (=> b!1482495 m!1368207))

(declare-fun m!1368209 () Bool)

(assert (=> start!126418 m!1368209))

(declare-fun m!1368211 () Bool)

(assert (=> start!126418 m!1368211))

(declare-fun m!1368213 () Bool)

(assert (=> b!1482489 m!1368213))

(declare-fun m!1368215 () Bool)

(assert (=> b!1482489 m!1368215))

(declare-fun m!1368217 () Bool)

(assert (=> b!1482502 m!1368217))

(declare-fun m!1368219 () Bool)

(assert (=> b!1482502 m!1368219))

(declare-fun m!1368221 () Bool)

(assert (=> b!1482502 m!1368221))

(declare-fun m!1368223 () Bool)

(assert (=> b!1482502 m!1368223))

(declare-fun m!1368225 () Bool)

(assert (=> b!1482502 m!1368225))

(assert (=> b!1482501 m!1368225))

(assert (=> b!1482501 m!1368225))

(declare-fun m!1368227 () Bool)

(assert (=> b!1482501 m!1368227))

(declare-fun m!1368229 () Bool)

(assert (=> b!1482504 m!1368229))

(assert (=> b!1482504 m!1368229))

(declare-fun m!1368231 () Bool)

(assert (=> b!1482504 m!1368231))

(assert (=> b!1482504 m!1368217))

(declare-fun m!1368233 () Bool)

(assert (=> b!1482504 m!1368233))

(assert (=> b!1482499 m!1368225))

(assert (=> b!1482499 m!1368225))

(declare-fun m!1368235 () Bool)

(assert (=> b!1482499 m!1368235))

(assert (=> b!1482494 m!1368217))

(declare-fun m!1368237 () Bool)

(assert (=> b!1482494 m!1368237))

(assert (=> b!1482497 m!1368225))

(assert (=> b!1482497 m!1368225))

(declare-fun m!1368239 () Bool)

(assert (=> b!1482497 m!1368239))

(assert (=> b!1482497 m!1368239))

(assert (=> b!1482497 m!1368225))

(declare-fun m!1368241 () Bool)

(assert (=> b!1482497 m!1368241))

(declare-fun m!1368243 () Bool)

(assert (=> b!1482491 m!1368243))

(declare-fun m!1368245 () Bool)

(assert (=> b!1482498 m!1368245))

(assert (=> b!1482490 m!1368225))

(assert (=> b!1482490 m!1368225))

(declare-fun m!1368247 () Bool)

(assert (=> b!1482490 m!1368247))

(assert (=> b!1482503 m!1368215))

(assert (=> b!1482503 m!1368213))

(declare-fun m!1368249 () Bool)

(assert (=> b!1482488 m!1368249))

(declare-fun m!1368251 () Bool)

(assert (=> b!1482487 m!1368251))

(assert (=> b!1482487 m!1368217))

(assert (=> b!1482487 m!1368221))

(assert (=> b!1482487 m!1368223))

(declare-fun m!1368253 () Bool)

(assert (=> b!1482487 m!1368253))

(assert (=> b!1482487 m!1368225))

(push 1)

(assert (not b!1482498))

(assert (not start!126418))

(assert (not b!1482503))

(assert (not b!1482490))

(assert (not b!1482497))

(assert (not b!1482487))

(assert (not b!1482489))

(assert (not b!1482491))

(assert (not b!1482501))

(assert (not b!1482504))

(assert (not b!1482499))

(assert (not b!1482495))

(assert (not b!1482488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1482721 () Bool)

(declare-fun e!831424 () SeekEntryResult!12236)

(assert (=> b!1482721 (= e!831424 (Found!12236 index!646))))

(declare-fun b!1482722 () Bool)

(declare-fun e!831423 () SeekEntryResult!12236)

(assert (=> b!1482722 (= e!831423 Undefined!12236)))

(declare-fun b!1482723 () Bool)

(declare-fun e!831425 () SeekEntryResult!12236)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482723 (= e!831425 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!647084 lt!647087 mask!2687))))

(declare-fun b!1482724 () Bool)

(assert (=> b!1482724 (= e!831423 e!831424)))

(declare-fun c!136972 () Bool)

(declare-fun lt!647156 () (_ BitVec 64))

(assert (=> b!1482724 (= c!136972 (= lt!647156 lt!647084))))

(declare-fun b!1482725 () Bool)

(assert (=> b!1482725 (= e!831425 (MissingVacant!12236 intermediateAfterIndex!19))))

(declare-fun d!156301 () Bool)

(declare-fun lt!647157 () SeekEntryResult!12236)

(assert (=> d!156301 (and (or (is-Undefined!12236 lt!647157) (not (is-Found!12236 lt!647157)) (and (bvsge (index!51337 lt!647157) #b00000000000000000000000000000000) (bvslt (index!51337 lt!647157) (size!48546 lt!647087)))) (or (is-Undefined!12236 lt!647157) (is-Found!12236 lt!647157) (not (is-MissingVacant!12236 lt!647157)) (not (= (index!51339 lt!647157) intermediateAfterIndex!19)) (and (bvsge (index!51339 lt!647157) #b00000000000000000000000000000000) (bvslt (index!51339 lt!647157) (size!48546 lt!647087)))) (or (is-Undefined!12236 lt!647157) (ite (is-Found!12236 lt!647157) (= (select (arr!47996 lt!647087) (index!51337 lt!647157)) lt!647084) (and (is-MissingVacant!12236 lt!647157) (= (index!51339 lt!647157) intermediateAfterIndex!19) (= (select (arr!47996 lt!647087) (index!51339 lt!647157)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156301 (= lt!647157 e!831423)))

(declare-fun c!136973 () Bool)

(assert (=> d!156301 (= c!136973 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156301 (= lt!647156 (select (arr!47996 lt!647087) index!646))))

(assert (=> d!156301 (validMask!0 mask!2687)))

(assert (=> d!156301 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647084 lt!647087 mask!2687) lt!647157)))

(declare-fun b!1482726 () Bool)

(declare-fun c!136974 () Bool)

(assert (=> b!1482726 (= c!136974 (= lt!647156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482726 (= e!831424 e!831425)))

(assert (= (and d!156301 c!136973) b!1482722))

(assert (= (and d!156301 (not c!136973)) b!1482724))

(assert (= (and b!1482724 c!136972) b!1482721))

(assert (= (and b!1482724 (not c!136972)) b!1482726))

(assert (= (and b!1482726 c!136974) b!1482725))

(assert (= (and b!1482726 (not c!136974)) b!1482723))

(declare-fun m!1368401 () Bool)

(assert (=> b!1482723 m!1368401))

(assert (=> b!1482723 m!1368401))

(declare-fun m!1368403 () Bool)

(assert (=> b!1482723 m!1368403))

(declare-fun m!1368405 () Bool)

(assert (=> d!156301 m!1368405))

(declare-fun m!1368407 () Bool)

(assert (=> d!156301 m!1368407))

(declare-fun m!1368409 () Bool)

(assert (=> d!156301 m!1368409))

(assert (=> d!156301 m!1368209))

(assert (=> b!1482503 d!156301))

(declare-fun b!1482796 () Bool)

(declare-fun e!831466 () SeekEntryResult!12236)

(assert (=> b!1482796 (= e!831466 Undefined!12236)))

(declare-fun d!156309 () Bool)

(declare-fun lt!647191 () SeekEntryResult!12236)

(assert (=> d!156309 (and (or (is-Undefined!12236 lt!647191) (not (is-Found!12236 lt!647191)) (and (bvsge (index!51337 lt!647191) #b00000000000000000000000000000000) (bvslt (index!51337 lt!647191) (size!48546 lt!647087)))) (or (is-Undefined!12236 lt!647191) (is-Found!12236 lt!647191) (not (is-MissingZero!12236 lt!647191)) (and (bvsge (index!51336 lt!647191) #b00000000000000000000000000000000) (bvslt (index!51336 lt!647191) (size!48546 lt!647087)))) (or (is-Undefined!12236 lt!647191) (is-Found!12236 lt!647191) (is-MissingZero!12236 lt!647191) (not (is-MissingVacant!12236 lt!647191)) (and (bvsge (index!51339 lt!647191) #b00000000000000000000000000000000) (bvslt (index!51339 lt!647191) (size!48546 lt!647087)))) (or (is-Undefined!12236 lt!647191) (ite (is-Found!12236 lt!647191) (= (select (arr!47996 lt!647087) (index!51337 lt!647191)) lt!647084) (ite (is-MissingZero!12236 lt!647191) (= (select (arr!47996 lt!647087) (index!51336 lt!647191)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12236 lt!647191) (= (select (arr!47996 lt!647087) (index!51339 lt!647191)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156309 (= lt!647191 e!831466)))

(declare-fun c!137003 () Bool)

(declare-fun lt!647192 () SeekEntryResult!12236)

(assert (=> d!156309 (= c!137003 (and (is-Intermediate!12236 lt!647192) (undefined!13048 lt!647192)))))

(assert (=> d!156309 (= lt!647192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647084 mask!2687) lt!647084 lt!647087 mask!2687))))

(assert (=> d!156309 (validMask!0 mask!2687)))

(assert (=> d!156309 (= (seekEntryOrOpen!0 lt!647084 lt!647087 mask!2687) lt!647191)))

(declare-fun b!1482797 () Bool)

(declare-fun e!831465 () SeekEntryResult!12236)

(assert (=> b!1482797 (= e!831465 (MissingZero!12236 (index!51338 lt!647192)))))

(declare-fun b!1482798 () Bool)

(declare-fun e!831467 () SeekEntryResult!12236)

(assert (=> b!1482798 (= e!831466 e!831467)))

(declare-fun lt!647190 () (_ BitVec 64))

(assert (=> b!1482798 (= lt!647190 (select (arr!47996 lt!647087) (index!51338 lt!647192)))))

(declare-fun c!137002 () Bool)

(assert (=> b!1482798 (= c!137002 (= lt!647190 lt!647084))))

(declare-fun b!1482799 () Bool)

(declare-fun c!137004 () Bool)

(assert (=> b!1482799 (= c!137004 (= lt!647190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482799 (= e!831467 e!831465)))

(declare-fun b!1482800 () Bool)

(assert (=> b!1482800 (= e!831465 (seekKeyOrZeroReturnVacant!0 (x!132919 lt!647192) (index!51338 lt!647192) (index!51338 lt!647192) lt!647084 lt!647087 mask!2687))))

(declare-fun b!1482801 () Bool)

(assert (=> b!1482801 (= e!831467 (Found!12236 (index!51338 lt!647192)))))

(assert (= (and d!156309 c!137003) b!1482796))

(assert (= (and d!156309 (not c!137003)) b!1482798))

(assert (= (and b!1482798 c!137002) b!1482801))

(assert (= (and b!1482798 (not c!137002)) b!1482799))

(assert (= (and b!1482799 c!137004) b!1482797))

(assert (= (and b!1482799 (not c!137004)) b!1482800))

(assert (=> d!156309 m!1368229))

(declare-fun m!1368445 () Bool)

(assert (=> d!156309 m!1368445))

(declare-fun m!1368447 () Bool)

(assert (=> d!156309 m!1368447))

(declare-fun m!1368449 () Bool)

(assert (=> d!156309 m!1368449))

(assert (=> d!156309 m!1368209))

(assert (=> d!156309 m!1368229))

(assert (=> d!156309 m!1368231))

(declare-fun m!1368451 () Bool)

(assert (=> b!1482798 m!1368451))

(declare-fun m!1368453 () Bool)

(assert (=> b!1482800 m!1368453))

(assert (=> b!1482503 d!156309))

(declare-fun d!156325 () Bool)

(assert (=> d!156325 (= (validKeyInArray!0 (select (arr!47996 a!2862) j!93)) (and (not (= (select (arr!47996 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47996 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1482501 d!156325))

(declare-fun b!1482820 () Bool)

(declare-fun e!831482 () Bool)

(declare-fun e!831481 () Bool)

(assert (=> b!1482820 (= e!831482 e!831481)))

(declare-fun lt!647209 () (_ BitVec 64))

(assert (=> b!1482820 (= lt!647209 (select (arr!47996 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!647210 () Unit!49812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99437 (_ BitVec 64) (_ BitVec 32)) Unit!49812)

(assert (=> b!1482820 (= lt!647210 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647209 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1482820 (arrayContainsKey!0 a!2862 lt!647209 #b00000000000000000000000000000000)))

(declare-fun lt!647208 () Unit!49812)

(assert (=> b!1482820 (= lt!647208 lt!647210)))

(declare-fun res!1007841 () Bool)

(assert (=> b!1482820 (= res!1007841 (= (seekEntryOrOpen!0 (select (arr!47996 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12236 #b00000000000000000000000000000000)))))

(assert (=> b!1482820 (=> (not res!1007841) (not e!831481))))

(declare-fun b!1482821 () Bool)

(declare-fun e!831480 () Bool)

(assert (=> b!1482821 (= e!831480 e!831482)))

(declare-fun c!137011 () Bool)

(assert (=> b!1482821 (= c!137011 (validKeyInArray!0 (select (arr!47996 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482822 () Bool)

(declare-fun call!67862 () Bool)

(assert (=> b!1482822 (= e!831482 call!67862)))

(declare-fun b!1482823 () Bool)

(assert (=> b!1482823 (= e!831481 call!67862)))

(declare-fun bm!67859 () Bool)

(assert (=> bm!67859 (= call!67862 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156331 () Bool)

(declare-fun res!1007842 () Bool)

(assert (=> d!156331 (=> res!1007842 e!831480)))

(assert (=> d!156331 (= res!1007842 (bvsge #b00000000000000000000000000000000 (size!48546 a!2862)))))

(assert (=> d!156331 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!831480)))

(assert (= (and d!156331 (not res!1007842)) b!1482821))

(assert (= (and b!1482821 c!137011) b!1482820))

(assert (= (and b!1482821 (not c!137011)) b!1482822))

(assert (= (and b!1482820 res!1007841) b!1482823))

(assert (= (or b!1482823 b!1482822) bm!67859))

(declare-fun m!1368473 () Bool)

(assert (=> b!1482820 m!1368473))

(declare-fun m!1368475 () Bool)

(assert (=> b!1482820 m!1368475))

(declare-fun m!1368477 () Bool)

(assert (=> b!1482820 m!1368477))

(assert (=> b!1482820 m!1368473))

(declare-fun m!1368479 () Bool)

(assert (=> b!1482820 m!1368479))

(assert (=> b!1482821 m!1368473))

(assert (=> b!1482821 m!1368473))

(declare-fun m!1368481 () Bool)

(assert (=> b!1482821 m!1368481))

(declare-fun m!1368483 () Bool)

(assert (=> bm!67859 m!1368483))

(assert (=> b!1482491 d!156331))

(assert (=> b!1482489 d!156309))

(assert (=> b!1482489 d!156301))

(declare-fun b!1482869 () Bool)

(declare-fun lt!647228 () SeekEntryResult!12236)

(assert (=> b!1482869 (and (bvsge (index!51338 lt!647228) #b00000000000000000000000000000000) (bvslt (index!51338 lt!647228) (size!48546 a!2862)))))

(declare-fun res!1007859 () Bool)

(assert (=> b!1482869 (= res!1007859 (= (select (arr!47996 a!2862) (index!51338 lt!647228)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831510 () Bool)

(assert (=> b!1482869 (=> res!1007859 e!831510)))

(declare-fun b!1482870 () Bool)

(declare-fun e!831508 () SeekEntryResult!12236)

(assert (=> b!1482870 (= e!831508 (Intermediate!12236 true index!646 x!665))))

(declare-fun b!1482871 () Bool)

(assert (=> b!1482871 (and (bvsge (index!51338 lt!647228) #b00000000000000000000000000000000) (bvslt (index!51338 lt!647228) (size!48546 a!2862)))))

(declare-fun res!1007861 () Bool)

(assert (=> b!1482871 (= res!1007861 (= (select (arr!47996 a!2862) (index!51338 lt!647228)) (select (arr!47996 a!2862) j!93)))))

(assert (=> b!1482871 (=> res!1007861 e!831510)))

(declare-fun e!831509 () Bool)

(assert (=> b!1482871 (= e!831509 e!831510)))

(declare-fun b!1482872 () Bool)

(declare-fun e!831511 () SeekEntryResult!12236)

(assert (=> b!1482872 (= e!831508 e!831511)))

(declare-fun c!137028 () Bool)

(declare-fun lt!647227 () (_ BitVec 64))

(assert (=> b!1482872 (= c!137028 (or (= lt!647227 (select (arr!47996 a!2862) j!93)) (= (bvadd lt!647227 lt!647227) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482873 () Bool)

(assert (=> b!1482873 (and (bvsge (index!51338 lt!647228) #b00000000000000000000000000000000) (bvslt (index!51338 lt!647228) (size!48546 a!2862)))))

(assert (=> b!1482873 (= e!831510 (= (select (arr!47996 a!2862) (index!51338 lt!647228)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482874 () Bool)

(assert (=> b!1482874 (= e!831511 (Intermediate!12236 false index!646 x!665))))

(declare-fun b!1482875 () Bool)

(assert (=> b!1482875 (= e!831511 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47996 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156339 () Bool)

(declare-fun e!831512 () Bool)

(assert (=> d!156339 e!831512))

(declare-fun c!137027 () Bool)

(assert (=> d!156339 (= c!137027 (and (is-Intermediate!12236 lt!647228) (undefined!13048 lt!647228)))))

(assert (=> d!156339 (= lt!647228 e!831508)))

(declare-fun c!137029 () Bool)

(assert (=> d!156339 (= c!137029 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156339 (= lt!647227 (select (arr!47996 a!2862) index!646))))

(assert (=> d!156339 (validMask!0 mask!2687)))

(assert (=> d!156339 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47996 a!2862) j!93) a!2862 mask!2687) lt!647228)))

(declare-fun b!1482876 () Bool)

(assert (=> b!1482876 (= e!831512 (bvsge (x!132919 lt!647228) #b01111111111111111111111111111110))))

(declare-fun b!1482877 () Bool)

(assert (=> b!1482877 (= e!831512 e!831509)))

(declare-fun res!1007860 () Bool)

(assert (=> b!1482877 (= res!1007860 (and (is-Intermediate!12236 lt!647228) (not (undefined!13048 lt!647228)) (bvslt (x!132919 lt!647228) #b01111111111111111111111111111110) (bvsge (x!132919 lt!647228) #b00000000000000000000000000000000) (bvsge (x!132919 lt!647228) x!665)))))

(assert (=> b!1482877 (=> (not res!1007860) (not e!831509))))

(assert (= (and d!156339 c!137029) b!1482870))

(assert (= (and d!156339 (not c!137029)) b!1482872))

(assert (= (and b!1482872 c!137028) b!1482874))

(assert (= (and b!1482872 (not c!137028)) b!1482875))

(assert (= (and d!156339 c!137027) b!1482876))

(assert (= (and d!156339 (not c!137027)) b!1482877))

(assert (= (and b!1482877 res!1007860) b!1482871))

(assert (= (and b!1482871 (not res!1007861)) b!1482869))

(assert (= (and b!1482869 (not res!1007859)) b!1482873))

(declare-fun m!1368493 () Bool)

(assert (=> b!1482871 m!1368493))

(assert (=> d!156339 m!1368223))

(assert (=> d!156339 m!1368209))

(assert (=> b!1482869 m!1368493))

(assert (=> b!1482875 m!1368401))

(assert (=> b!1482875 m!1368401))

(assert (=> b!1482875 m!1368225))

(declare-fun m!1368495 () Bool)

(assert (=> b!1482875 m!1368495))

(assert (=> b!1482873 m!1368493))

(assert (=> b!1482490 d!156339))

(declare-fun b!1482884 () Bool)

(declare-fun lt!647230 () SeekEntryResult!12236)

(assert (=> b!1482884 (and (bvsge (index!51338 lt!647230) #b00000000000000000000000000000000) (bvslt (index!51338 lt!647230) (size!48546 lt!647087)))))

(declare-fun res!1007864 () Bool)

(assert (=> b!1482884 (= res!1007864 (= (select (arr!47996 lt!647087) (index!51338 lt!647230)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831519 () Bool)

(assert (=> b!1482884 (=> res!1007864 e!831519)))

(declare-fun b!1482885 () Bool)

(declare-fun e!831517 () SeekEntryResult!12236)

(assert (=> b!1482885 (= e!831517 (Intermediate!12236 true index!646 x!665))))

(declare-fun b!1482886 () Bool)

(assert (=> b!1482886 (and (bvsge (index!51338 lt!647230) #b00000000000000000000000000000000) (bvslt (index!51338 lt!647230) (size!48546 lt!647087)))))

(declare-fun res!1007866 () Bool)

(assert (=> b!1482886 (= res!1007866 (= (select (arr!47996 lt!647087) (index!51338 lt!647230)) lt!647084))))

(assert (=> b!1482886 (=> res!1007866 e!831519)))

(declare-fun e!831518 () Bool)

(assert (=> b!1482886 (= e!831518 e!831519)))

(declare-fun b!1482887 () Bool)

(declare-fun e!831520 () SeekEntryResult!12236)

(assert (=> b!1482887 (= e!831517 e!831520)))

(declare-fun c!137033 () Bool)

(declare-fun lt!647229 () (_ BitVec 64))

(assert (=> b!1482887 (= c!137033 (or (= lt!647229 lt!647084) (= (bvadd lt!647229 lt!647229) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482888 () Bool)

(assert (=> b!1482888 (and (bvsge (index!51338 lt!647230) #b00000000000000000000000000000000) (bvslt (index!51338 lt!647230) (size!48546 lt!647087)))))

(assert (=> b!1482888 (= e!831519 (= (select (arr!47996 lt!647087) (index!51338 lt!647230)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482889 () Bool)

(assert (=> b!1482889 (= e!831520 (Intermediate!12236 false index!646 x!665))))

(declare-fun b!1482890 () Bool)

(assert (=> b!1482890 (= e!831520 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!647084 lt!647087 mask!2687))))

(declare-fun d!156345 () Bool)

(declare-fun e!831521 () Bool)

(assert (=> d!156345 e!831521))

(declare-fun c!137032 () Bool)

(assert (=> d!156345 (= c!137032 (and (is-Intermediate!12236 lt!647230) (undefined!13048 lt!647230)))))

(assert (=> d!156345 (= lt!647230 e!831517)))

(declare-fun c!137034 () Bool)

(assert (=> d!156345 (= c!137034 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156345 (= lt!647229 (select (arr!47996 lt!647087) index!646))))

(assert (=> d!156345 (validMask!0 mask!2687)))

(assert (=> d!156345 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647084 lt!647087 mask!2687) lt!647230)))

(declare-fun b!1482891 () Bool)

(assert (=> b!1482891 (= e!831521 (bvsge (x!132919 lt!647230) #b01111111111111111111111111111110))))

(declare-fun b!1482892 () Bool)

(assert (=> b!1482892 (= e!831521 e!831518)))

(declare-fun res!1007865 () Bool)

(assert (=> b!1482892 (= res!1007865 (and (is-Intermediate!12236 lt!647230) (not (undefined!13048 lt!647230)) (bvslt (x!132919 lt!647230) #b01111111111111111111111111111110) (bvsge (x!132919 lt!647230) #b00000000000000000000000000000000) (bvsge (x!132919 lt!647230) x!665)))))

(assert (=> b!1482892 (=> (not res!1007865) (not e!831518))))

(assert (= (and d!156345 c!137034) b!1482885))

(assert (= (and d!156345 (not c!137034)) b!1482887))

(assert (= (and b!1482887 c!137033) b!1482889))

(assert (= (and b!1482887 (not c!137033)) b!1482890))

(assert (= (and d!156345 c!137032) b!1482891))

(assert (= (and d!156345 (not c!137032)) b!1482892))

(assert (= (and b!1482892 res!1007865) b!1482886))

(assert (= (and b!1482886 (not res!1007866)) b!1482884))

(assert (= (and b!1482884 (not res!1007864)) b!1482888))

(declare-fun m!1368497 () Bool)

(assert (=> b!1482886 m!1368497))

(assert (=> d!156345 m!1368409))

(assert (=> d!156345 m!1368209))

(assert (=> b!1482884 m!1368497))

(assert (=> b!1482890 m!1368401))

(assert (=> b!1482890 m!1368401))

(declare-fun m!1368499 () Bool)

(assert (=> b!1482890 m!1368499))

(assert (=> b!1482888 m!1368497))

(assert (=> b!1482488 d!156345))

(declare-fun b!1482895 () Bool)

(declare-fun e!831525 () SeekEntryResult!12236)

(assert (=> b!1482895 (= e!831525 Undefined!12236)))

(declare-fun d!156347 () Bool)

(declare-fun lt!647238 () SeekEntryResult!12236)

(assert (=> d!156347 (and (or (is-Undefined!12236 lt!647238) (not (is-Found!12236 lt!647238)) (and (bvsge (index!51337 lt!647238) #b00000000000000000000000000000000) (bvslt (index!51337 lt!647238) (size!48546 a!2862)))) (or (is-Undefined!12236 lt!647238) (is-Found!12236 lt!647238) (not (is-MissingZero!12236 lt!647238)) (and (bvsge (index!51336 lt!647238) #b00000000000000000000000000000000) (bvslt (index!51336 lt!647238) (size!48546 a!2862)))) (or (is-Undefined!12236 lt!647238) (is-Found!12236 lt!647238) (is-MissingZero!12236 lt!647238) (not (is-MissingVacant!12236 lt!647238)) (and (bvsge (index!51339 lt!647238) #b00000000000000000000000000000000) (bvslt (index!51339 lt!647238) (size!48546 a!2862)))) (or (is-Undefined!12236 lt!647238) (ite (is-Found!12236 lt!647238) (= (select (arr!47996 a!2862) (index!51337 lt!647238)) (select (arr!47996 a!2862) j!93)) (ite (is-MissingZero!12236 lt!647238) (= (select (arr!47996 a!2862) (index!51336 lt!647238)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12236 lt!647238) (= (select (arr!47996 a!2862) (index!51339 lt!647238)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156347 (= lt!647238 e!831525)))

(declare-fun c!137036 () Bool)

(declare-fun lt!647239 () SeekEntryResult!12236)

(assert (=> d!156347 (= c!137036 (and (is-Intermediate!12236 lt!647239) (undefined!13048 lt!647239)))))

(assert (=> d!156347 (= lt!647239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47996 a!2862) j!93) mask!2687) (select (arr!47996 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156347 (validMask!0 mask!2687)))

(assert (=> d!156347 (= (seekEntryOrOpen!0 (select (arr!47996 a!2862) j!93) a!2862 mask!2687) lt!647238)))

(declare-fun b!1482896 () Bool)

(declare-fun e!831524 () SeekEntryResult!12236)

(assert (=> b!1482896 (= e!831524 (MissingZero!12236 (index!51338 lt!647239)))))

(declare-fun b!1482897 () Bool)

(declare-fun e!831526 () SeekEntryResult!12236)

(assert (=> b!1482897 (= e!831525 e!831526)))

(declare-fun lt!647237 () (_ BitVec 64))

(assert (=> b!1482897 (= lt!647237 (select (arr!47996 a!2862) (index!51338 lt!647239)))))

(declare-fun c!137035 () Bool)

(assert (=> b!1482897 (= c!137035 (= lt!647237 (select (arr!47996 a!2862) j!93)))))

(declare-fun b!1482898 () Bool)

(declare-fun c!137037 () Bool)

(assert (=> b!1482898 (= c!137037 (= lt!647237 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482898 (= e!831526 e!831524)))

(declare-fun b!1482899 () Bool)

(assert (=> b!1482899 (= e!831524 (seekKeyOrZeroReturnVacant!0 (x!132919 lt!647239) (index!51338 lt!647239) (index!51338 lt!647239) (select (arr!47996 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482900 () Bool)

(assert (=> b!1482900 (= e!831526 (Found!12236 (index!51338 lt!647239)))))

(assert (= (and d!156347 c!137036) b!1482895))

(assert (= (and d!156347 (not c!137036)) b!1482897))

(assert (= (and b!1482897 c!137035) b!1482900))

(assert (= (and b!1482897 (not c!137035)) b!1482898))

(assert (= (and b!1482898 c!137037) b!1482896))

(assert (= (and b!1482898 (not c!137037)) b!1482899))

(assert (=> d!156347 m!1368225))

(assert (=> d!156347 m!1368239))

(declare-fun m!1368501 () Bool)

(assert (=> d!156347 m!1368501))

(declare-fun m!1368503 () Bool)

(assert (=> d!156347 m!1368503))

(declare-fun m!1368505 () Bool)

(assert (=> d!156347 m!1368505))

(assert (=> d!156347 m!1368209))

(assert (=> d!156347 m!1368239))

(assert (=> d!156347 m!1368225))

(assert (=> d!156347 m!1368241))

(declare-fun m!1368507 () Bool)

(assert (=> b!1482897 m!1368507))

(assert (=> b!1482899 m!1368225))

(declare-fun m!1368509 () Bool)

(assert (=> b!1482899 m!1368509))

(assert (=> b!1482499 d!156347))

(declare-fun b!1482901 () Bool)

(declare-fun lt!647241 () SeekEntryResult!12236)

(assert (=> b!1482901 (and (bvsge (index!51338 lt!647241) #b00000000000000000000000000000000) (bvslt (index!51338 lt!647241) (size!48546 a!2862)))))

(declare-fun res!1007869 () Bool)

(assert (=> b!1482901 (= res!1007869 (= (select (arr!47996 a!2862) (index!51338 lt!647241)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831529 () Bool)

(assert (=> b!1482901 (=> res!1007869 e!831529)))

(declare-fun e!831527 () SeekEntryResult!12236)

(declare-fun b!1482902 () Bool)

(assert (=> b!1482902 (= e!831527 (Intermediate!12236 true (toIndex!0 (select (arr!47996 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482903 () Bool)

(assert (=> b!1482903 (and (bvsge (index!51338 lt!647241) #b00000000000000000000000000000000) (bvslt (index!51338 lt!647241) (size!48546 a!2862)))))

(declare-fun res!1007871 () Bool)

(assert (=> b!1482903 (= res!1007871 (= (select (arr!47996 a!2862) (index!51338 lt!647241)) (select (arr!47996 a!2862) j!93)))))

(assert (=> b!1482903 (=> res!1007871 e!831529)))

(declare-fun e!831528 () Bool)

(assert (=> b!1482903 (= e!831528 e!831529)))

(declare-fun b!1482904 () Bool)

(declare-fun e!831530 () SeekEntryResult!12236)

(assert (=> b!1482904 (= e!831527 e!831530)))

(declare-fun c!137039 () Bool)

(declare-fun lt!647240 () (_ BitVec 64))

(assert (=> b!1482904 (= c!137039 (or (= lt!647240 (select (arr!47996 a!2862) j!93)) (= (bvadd lt!647240 lt!647240) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482905 () Bool)

(assert (=> b!1482905 (and (bvsge (index!51338 lt!647241) #b00000000000000000000000000000000) (bvslt (index!51338 lt!647241) (size!48546 a!2862)))))

(assert (=> b!1482905 (= e!831529 (= (select (arr!47996 a!2862) (index!51338 lt!647241)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482906 () Bool)

(assert (=> b!1482906 (= e!831530 (Intermediate!12236 false (toIndex!0 (select (arr!47996 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482907 () Bool)

(assert (=> b!1482907 (= e!831530 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47996 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47996 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156349 () Bool)

(declare-fun e!831531 () Bool)

(assert (=> d!156349 e!831531))

(declare-fun c!137038 () Bool)

(assert (=> d!156349 (= c!137038 (and (is-Intermediate!12236 lt!647241) (undefined!13048 lt!647241)))))

(assert (=> d!156349 (= lt!647241 e!831527)))

(declare-fun c!137040 () Bool)

(assert (=> d!156349 (= c!137040 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156349 (= lt!647240 (select (arr!47996 a!2862) (toIndex!0 (select (arr!47996 a!2862) j!93) mask!2687)))))

(assert (=> d!156349 (validMask!0 mask!2687)))

(assert (=> d!156349 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47996 a!2862) j!93) mask!2687) (select (arr!47996 a!2862) j!93) a!2862 mask!2687) lt!647241)))

(declare-fun b!1482908 () Bool)

(assert (=> b!1482908 (= e!831531 (bvsge (x!132919 lt!647241) #b01111111111111111111111111111110))))

(declare-fun b!1482909 () Bool)

(assert (=> b!1482909 (= e!831531 e!831528)))

(declare-fun res!1007870 () Bool)

(assert (=> b!1482909 (= res!1007870 (and (is-Intermediate!12236 lt!647241) (not (undefined!13048 lt!647241)) (bvslt (x!132919 lt!647241) #b01111111111111111111111111111110) (bvsge (x!132919 lt!647241) #b00000000000000000000000000000000) (bvsge (x!132919 lt!647241) #b00000000000000000000000000000000)))))

(assert (=> b!1482909 (=> (not res!1007870) (not e!831528))))

(assert (= (and d!156349 c!137040) b!1482902))

(assert (= (and d!156349 (not c!137040)) b!1482904))

(assert (= (and b!1482904 c!137039) b!1482906))

(assert (= (and b!1482904 (not c!137039)) b!1482907))

(assert (= (and d!156349 c!137038) b!1482908))

(assert (= (and d!156349 (not c!137038)) b!1482909))

(assert (= (and b!1482909 res!1007870) b!1482903))

(assert (= (and b!1482903 (not res!1007871)) b!1482901))

(assert (= (and b!1482901 (not res!1007869)) b!1482905))

(declare-fun m!1368511 () Bool)

(assert (=> b!1482903 m!1368511))

(assert (=> d!156349 m!1368239))

(declare-fun m!1368513 () Bool)

(assert (=> d!156349 m!1368513))

(assert (=> d!156349 m!1368209))

(assert (=> b!1482901 m!1368511))

(assert (=> b!1482907 m!1368239))

(declare-fun m!1368515 () Bool)

(assert (=> b!1482907 m!1368515))

(assert (=> b!1482907 m!1368515))

(assert (=> b!1482907 m!1368225))

(declare-fun m!1368517 () Bool)

(assert (=> b!1482907 m!1368517))

(assert (=> b!1482905 m!1368511))

(assert (=> b!1482497 d!156349))

(declare-fun d!156351 () Bool)

(declare-fun lt!647250 () (_ BitVec 32))

(declare-fun lt!647249 () (_ BitVec 32))

(assert (=> d!156351 (= lt!647250 (bvmul (bvxor lt!647249 (bvlshr lt!647249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156351 (= lt!647249 ((_ extract 31 0) (bvand (bvxor (select (arr!47996 a!2862) j!93) (bvlshr (select (arr!47996 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156351 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1007874 (let ((h!35869 ((_ extract 31 0) (bvand (bvxor (select (arr!47996 a!2862) j!93) (bvlshr (select (arr!47996 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132930 (bvmul (bvxor h!35869 (bvlshr h!35869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132930 (bvlshr x!132930 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1007874 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1007874 #b00000000000000000000000000000000))))))

(assert (=> d!156351 (= (toIndex!0 (select (arr!47996 a!2862) j!93) mask!2687) (bvand (bvxor lt!647250 (bvlshr lt!647250 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1482497 d!156351))

(declare-fun b!1482961 () Bool)

(declare-fun e!831569 () Bool)

(declare-fun e!831570 () Bool)

(assert (=> b!1482961 (= e!831569 e!831570)))

(declare-fun c!137054 () Bool)

(assert (=> b!1482961 (= c!137054 (validKeyInArray!0 (select (arr!47996 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482962 () Bool)

(declare-fun e!831568 () Bool)

(declare-fun contains!9915 (List!34497 (_ BitVec 64)) Bool)

(assert (=> b!1482962 (= e!831568 (contains!9915 Nil!34494 (select (arr!47996 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67869 () Bool)

(declare-fun call!67872 () Bool)

(assert (=> bm!67869 (= call!67872 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137054 (Cons!34493 (select (arr!47996 a!2862) #b00000000000000000000000000000000) Nil!34494) Nil!34494)))))

(declare-fun b!1482963 () Bool)

(assert (=> b!1482963 (= e!831570 call!67872)))

(declare-fun b!1482964 () Bool)

(assert (=> b!1482964 (= e!831570 call!67872)))

(declare-fun d!156355 () Bool)

(declare-fun res!1007900 () Bool)

(declare-fun e!831571 () Bool)

(assert (=> d!156355 (=> res!1007900 e!831571)))

(assert (=> d!156355 (= res!1007900 (bvsge #b00000000000000000000000000000000 (size!48546 a!2862)))))

(assert (=> d!156355 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34494) e!831571)))

(declare-fun b!1482965 () Bool)

(assert (=> b!1482965 (= e!831571 e!831569)))

(declare-fun res!1007898 () Bool)

(assert (=> b!1482965 (=> (not res!1007898) (not e!831569))))

(assert (=> b!1482965 (= res!1007898 (not e!831568))))

(declare-fun res!1007899 () Bool)

(assert (=> b!1482965 (=> (not res!1007899) (not e!831568))))

(assert (=> b!1482965 (= res!1007899 (validKeyInArray!0 (select (arr!47996 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156355 (not res!1007900)) b!1482965))

(assert (= (and b!1482965 res!1007899) b!1482962))

(assert (= (and b!1482965 res!1007898) b!1482961))

(assert (= (and b!1482961 c!137054) b!1482963))

(assert (= (and b!1482961 (not c!137054)) b!1482964))

(assert (= (or b!1482963 b!1482964) bm!67869))

(assert (=> b!1482961 m!1368473))

(assert (=> b!1482961 m!1368473))

(assert (=> b!1482961 m!1368481))

(assert (=> b!1482962 m!1368473))

(assert (=> b!1482962 m!1368473))

(declare-fun m!1368553 () Bool)

(assert (=> b!1482962 m!1368553))

(assert (=> bm!67869 m!1368473))

(declare-fun m!1368555 () Bool)

(assert (=> bm!67869 m!1368555))

(assert (=> b!1482965 m!1368473))

(assert (=> b!1482965 m!1368473))

(assert (=> b!1482965 m!1368481))

(assert (=> b!1482498 d!156355))

(declare-fun b!1482966 () Bool)

(declare-fun e!831574 () Bool)

(declare-fun e!831573 () Bool)

(assert (=> b!1482966 (= e!831574 e!831573)))

(declare-fun lt!647261 () (_ BitVec 64))

(assert (=> b!1482966 (= lt!647261 (select (arr!47996 a!2862) j!93))))

(declare-fun lt!647262 () Unit!49812)

(assert (=> b!1482966 (= lt!647262 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647261 j!93))))

(assert (=> b!1482966 (arrayContainsKey!0 a!2862 lt!647261 #b00000000000000000000000000000000)))

(declare-fun lt!647260 () Unit!49812)

(assert (=> b!1482966 (= lt!647260 lt!647262)))

(declare-fun res!1007901 () Bool)

(assert (=> b!1482966 (= res!1007901 (= (seekEntryOrOpen!0 (select (arr!47996 a!2862) j!93) a!2862 mask!2687) (Found!12236 j!93)))))

(assert (=> b!1482966 (=> (not res!1007901) (not e!831573))))

(declare-fun b!1482967 () Bool)

(declare-fun e!831572 () Bool)

(assert (=> b!1482967 (= e!831572 e!831574)))

(declare-fun c!137055 () Bool)

(assert (=> b!1482967 (= c!137055 (validKeyInArray!0 (select (arr!47996 a!2862) j!93)))))

(declare-fun b!1482968 () Bool)

(declare-fun call!67873 () Bool)

(assert (=> b!1482968 (= e!831574 call!67873)))

(declare-fun b!1482969 () Bool)

(assert (=> b!1482969 (= e!831573 call!67873)))

(declare-fun bm!67870 () Bool)

(assert (=> bm!67870 (= call!67873 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156369 () Bool)

(declare-fun res!1007902 () Bool)

(assert (=> d!156369 (=> res!1007902 e!831572)))

(assert (=> d!156369 (= res!1007902 (bvsge j!93 (size!48546 a!2862)))))

(assert (=> d!156369 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!831572)))

(assert (= (and d!156369 (not res!1007902)) b!1482967))

(assert (= (and b!1482967 c!137055) b!1482966))

(assert (= (and b!1482967 (not c!137055)) b!1482968))

(assert (= (and b!1482966 res!1007901) b!1482969))

(assert (= (or b!1482969 b!1482968) bm!67870))

(assert (=> b!1482966 m!1368225))

(declare-fun m!1368557 () Bool)

(assert (=> b!1482966 m!1368557))

(declare-fun m!1368559 () Bool)

(assert (=> b!1482966 m!1368559))

(assert (=> b!1482966 m!1368225))

(assert (=> b!1482966 m!1368235))

(assert (=> b!1482967 m!1368225))

(assert (=> b!1482967 m!1368225))

(assert (=> b!1482967 m!1368227))

(declare-fun m!1368561 () Bool)

(assert (=> bm!67870 m!1368561))

(assert (=> b!1482487 d!156369))

(declare-fun d!156371 () Bool)

(assert (=> d!156371 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

