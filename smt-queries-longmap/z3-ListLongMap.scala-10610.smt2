; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124768 () Bool)

(assert start!124768)

(declare-fun b!1447776 () Bool)

(declare-fun e!815355 () Bool)

(declare-fun e!815358 () Bool)

(assert (=> b!1447776 (= e!815355 e!815358)))

(declare-fun res!979499 () Bool)

(assert (=> b!1447776 (=> (not res!979499) (not e!815358))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11663 0))(
  ( (MissingZero!11663 (index!49044 (_ BitVec 32))) (Found!11663 (index!49045 (_ BitVec 32))) (Intermediate!11663 (undefined!12475 Bool) (index!49046 (_ BitVec 32)) (x!130715 (_ BitVec 32))) (Undefined!11663) (MissingVacant!11663 (index!49047 (_ BitVec 32))) )
))
(declare-fun lt!635127 () SeekEntryResult!11663)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98194 0))(
  ( (array!98195 (arr!47386 (Array (_ BitVec 32) (_ BitVec 64))) (size!47938 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98194)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98194 (_ BitVec 32)) SeekEntryResult!11663)

(assert (=> b!1447776 (= res!979499 (= lt!635127 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47386 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447777 () Bool)

(declare-fun res!979493 () Bool)

(declare-fun e!815357 () Bool)

(assert (=> b!1447777 (=> (not res!979493) (not e!815357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98194 (_ BitVec 32)) Bool)

(assert (=> b!1447777 (= res!979493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447778 () Bool)

(declare-fun res!979497 () Bool)

(assert (=> b!1447778 (=> (not res!979497) (not e!815357))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447778 (= res!979497 (validKeyInArray!0 (select (arr!47386 a!2862) i!1006)))))

(declare-fun e!815353 () Bool)

(declare-fun lt!635130 () (_ BitVec 64))

(declare-fun b!1447779 () Bool)

(declare-fun lt!635128 () SeekEntryResult!11663)

(declare-fun lt!635126 () array!98194)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98194 (_ BitVec 32)) SeekEntryResult!11663)

(assert (=> b!1447779 (= e!815353 (= lt!635128 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635130 lt!635126 mask!2687)))))

(declare-fun b!1447781 () Bool)

(declare-fun res!979501 () Bool)

(assert (=> b!1447781 (=> (not res!979501) (not e!815357))))

(assert (=> b!1447781 (= res!979501 (and (= (size!47938 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47938 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47938 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447782 () Bool)

(declare-fun e!815350 () Bool)

(declare-fun e!815351 () Bool)

(assert (=> b!1447782 (= e!815350 (not e!815351))))

(declare-fun res!979491 () Bool)

(assert (=> b!1447782 (=> res!979491 e!815351)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1447782 (= res!979491 (or (and (= (select (arr!47386 a!2862) index!646) (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47386 a!2862) index!646) (select (arr!47386 a!2862) j!93))) (not (= (select (arr!47386 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47386 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815352 () Bool)

(assert (=> b!1447782 e!815352))

(declare-fun res!979495 () Bool)

(assert (=> b!1447782 (=> (not res!979495) (not e!815352))))

(assert (=> b!1447782 (= res!979495 (and (= lt!635127 (Found!11663 j!93)) (or (= (select (arr!47386 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47386 a!2862) intermediateBeforeIndex!19) (select (arr!47386 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98194 (_ BitVec 32)) SeekEntryResult!11663)

(assert (=> b!1447782 (= lt!635127 (seekEntryOrOpen!0 (select (arr!47386 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447782 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48663 0))(
  ( (Unit!48664) )
))
(declare-fun lt!635129 () Unit!48663)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48663)

(assert (=> b!1447782 (= lt!635129 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447783 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447783 (= e!815353 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635130 lt!635126 mask!2687) (seekEntryOrOpen!0 lt!635130 lt!635126 mask!2687)))))

(declare-fun b!1447784 () Bool)

(declare-fun e!815356 () Bool)

(declare-fun e!815349 () Bool)

(assert (=> b!1447784 (= e!815356 e!815349)))

(declare-fun res!979492 () Bool)

(assert (=> b!1447784 (=> (not res!979492) (not e!815349))))

(declare-fun lt!635124 () SeekEntryResult!11663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447784 (= res!979492 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47386 a!2862) j!93) mask!2687) (select (arr!47386 a!2862) j!93) a!2862 mask!2687) lt!635124))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1447784 (= lt!635124 (Intermediate!11663 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447785 () Bool)

(declare-fun res!979500 () Bool)

(assert (=> b!1447785 (=> (not res!979500) (not e!815357))))

(declare-datatypes ((List!33965 0))(
  ( (Nil!33962) (Cons!33961 (h!35311 (_ BitVec 64)) (t!48651 List!33965)) )
))
(declare-fun arrayNoDuplicates!0 (array!98194 (_ BitVec 32) List!33965) Bool)

(assert (=> b!1447785 (= res!979500 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33962))))

(declare-fun b!1447786 () Bool)

(assert (=> b!1447786 (= e!815358 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447787 () Bool)

(declare-fun res!979489 () Bool)

(assert (=> b!1447787 (=> (not res!979489) (not e!815349))))

(assert (=> b!1447787 (= res!979489 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47386 a!2862) j!93) a!2862 mask!2687) lt!635124))))

(declare-fun b!1447788 () Bool)

(assert (=> b!1447788 (= e!815357 e!815356)))

(declare-fun res!979490 () Bool)

(assert (=> b!1447788 (=> (not res!979490) (not e!815356))))

(assert (=> b!1447788 (= res!979490 (= (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447788 (= lt!635126 (array!98195 (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47938 a!2862)))))

(declare-fun b!1447789 () Bool)

(declare-fun res!979488 () Bool)

(assert (=> b!1447789 (=> (not res!979488) (not e!815350))))

(assert (=> b!1447789 (= res!979488 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447790 () Bool)

(declare-fun res!979504 () Bool)

(assert (=> b!1447790 (=> (not res!979504) (not e!815357))))

(assert (=> b!1447790 (= res!979504 (validKeyInArray!0 (select (arr!47386 a!2862) j!93)))))

(declare-fun b!1447791 () Bool)

(assert (=> b!1447791 (= e!815351 true)))

(declare-fun lt!635125 () SeekEntryResult!11663)

(assert (=> b!1447791 (= lt!635125 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47386 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447792 () Bool)

(assert (=> b!1447792 (= e!815352 e!815355)))

(declare-fun res!979503 () Bool)

(assert (=> b!1447792 (=> res!979503 e!815355)))

(assert (=> b!1447792 (= res!979503 (or (and (= (select (arr!47386 a!2862) index!646) (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47386 a!2862) index!646) (select (arr!47386 a!2862) j!93))) (not (= (select (arr!47386 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447793 () Bool)

(assert (=> b!1447793 (= e!815349 e!815350)))

(declare-fun res!979496 () Bool)

(assert (=> b!1447793 (=> (not res!979496) (not e!815350))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447793 (= res!979496 (= lt!635128 (Intermediate!11663 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447793 (= lt!635128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635130 mask!2687) lt!635130 lt!635126 mask!2687))))

(assert (=> b!1447793 (= lt!635130 (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447794 () Bool)

(declare-fun res!979502 () Bool)

(assert (=> b!1447794 (=> (not res!979502) (not e!815357))))

(assert (=> b!1447794 (= res!979502 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47938 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47938 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47938 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!979498 () Bool)

(assert (=> start!124768 (=> (not res!979498) (not e!815357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124768 (= res!979498 (validMask!0 mask!2687))))

(assert (=> start!124768 e!815357))

(assert (=> start!124768 true))

(declare-fun array_inv!36619 (array!98194) Bool)

(assert (=> start!124768 (array_inv!36619 a!2862)))

(declare-fun b!1447780 () Bool)

(declare-fun res!979494 () Bool)

(assert (=> b!1447780 (=> (not res!979494) (not e!815350))))

(assert (=> b!1447780 (= res!979494 e!815353)))

(declare-fun c!133657 () Bool)

(assert (=> b!1447780 (= c!133657 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124768 res!979498) b!1447781))

(assert (= (and b!1447781 res!979501) b!1447778))

(assert (= (and b!1447778 res!979497) b!1447790))

(assert (= (and b!1447790 res!979504) b!1447777))

(assert (= (and b!1447777 res!979493) b!1447785))

(assert (= (and b!1447785 res!979500) b!1447794))

(assert (= (and b!1447794 res!979502) b!1447788))

(assert (= (and b!1447788 res!979490) b!1447784))

(assert (= (and b!1447784 res!979492) b!1447787))

(assert (= (and b!1447787 res!979489) b!1447793))

(assert (= (and b!1447793 res!979496) b!1447780))

(assert (= (and b!1447780 c!133657) b!1447779))

(assert (= (and b!1447780 (not c!133657)) b!1447783))

(assert (= (and b!1447780 res!979494) b!1447789))

(assert (= (and b!1447789 res!979488) b!1447782))

(assert (= (and b!1447782 res!979495) b!1447792))

(assert (= (and b!1447792 (not res!979503)) b!1447776))

(assert (= (and b!1447776 res!979499) b!1447786))

(assert (= (and b!1447782 (not res!979491)) b!1447791))

(declare-fun m!1336083 () Bool)

(assert (=> b!1447777 m!1336083))

(declare-fun m!1336085 () Bool)

(assert (=> b!1447779 m!1336085))

(declare-fun m!1336087 () Bool)

(assert (=> b!1447784 m!1336087))

(assert (=> b!1447784 m!1336087))

(declare-fun m!1336089 () Bool)

(assert (=> b!1447784 m!1336089))

(assert (=> b!1447784 m!1336089))

(assert (=> b!1447784 m!1336087))

(declare-fun m!1336091 () Bool)

(assert (=> b!1447784 m!1336091))

(declare-fun m!1336093 () Bool)

(assert (=> start!124768 m!1336093))

(declare-fun m!1336095 () Bool)

(assert (=> start!124768 m!1336095))

(declare-fun m!1336097 () Bool)

(assert (=> b!1447792 m!1336097))

(declare-fun m!1336099 () Bool)

(assert (=> b!1447792 m!1336099))

(declare-fun m!1336101 () Bool)

(assert (=> b!1447792 m!1336101))

(assert (=> b!1447792 m!1336087))

(assert (=> b!1447788 m!1336099))

(declare-fun m!1336103 () Bool)

(assert (=> b!1447788 m!1336103))

(assert (=> b!1447776 m!1336087))

(assert (=> b!1447776 m!1336087))

(declare-fun m!1336105 () Bool)

(assert (=> b!1447776 m!1336105))

(declare-fun m!1336107 () Bool)

(assert (=> b!1447783 m!1336107))

(declare-fun m!1336109 () Bool)

(assert (=> b!1447783 m!1336109))

(declare-fun m!1336111 () Bool)

(assert (=> b!1447782 m!1336111))

(assert (=> b!1447782 m!1336099))

(declare-fun m!1336113 () Bool)

(assert (=> b!1447782 m!1336113))

(assert (=> b!1447782 m!1336101))

(assert (=> b!1447782 m!1336097))

(assert (=> b!1447782 m!1336087))

(declare-fun m!1336115 () Bool)

(assert (=> b!1447782 m!1336115))

(declare-fun m!1336117 () Bool)

(assert (=> b!1447782 m!1336117))

(assert (=> b!1447782 m!1336087))

(declare-fun m!1336119 () Bool)

(assert (=> b!1447785 m!1336119))

(assert (=> b!1447790 m!1336087))

(assert (=> b!1447790 m!1336087))

(declare-fun m!1336121 () Bool)

(assert (=> b!1447790 m!1336121))

(assert (=> b!1447791 m!1336087))

(assert (=> b!1447791 m!1336087))

(declare-fun m!1336123 () Bool)

(assert (=> b!1447791 m!1336123))

(assert (=> b!1447787 m!1336087))

(assert (=> b!1447787 m!1336087))

(declare-fun m!1336125 () Bool)

(assert (=> b!1447787 m!1336125))

(declare-fun m!1336127 () Bool)

(assert (=> b!1447793 m!1336127))

(assert (=> b!1447793 m!1336127))

(declare-fun m!1336129 () Bool)

(assert (=> b!1447793 m!1336129))

(assert (=> b!1447793 m!1336099))

(declare-fun m!1336131 () Bool)

(assert (=> b!1447793 m!1336131))

(declare-fun m!1336133 () Bool)

(assert (=> b!1447778 m!1336133))

(assert (=> b!1447778 m!1336133))

(declare-fun m!1336135 () Bool)

(assert (=> b!1447778 m!1336135))

(check-sat (not b!1447791) (not b!1447784) (not b!1447783) (not b!1447776) (not start!124768) (not b!1447787) (not b!1447779) (not b!1447785) (not b!1447777) (not b!1447793) (not b!1447778) (not b!1447782) (not b!1447790))
(check-sat)
