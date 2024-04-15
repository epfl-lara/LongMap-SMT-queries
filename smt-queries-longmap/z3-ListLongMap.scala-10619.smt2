; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124822 () Bool)

(assert start!124822)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98248 0))(
  ( (array!98249 (arr!47413 (Array (_ BitVec 32) (_ BitVec 64))) (size!47965 (_ BitVec 32))) )
))
(declare-fun lt!635692 () array!98248)

(declare-fun b!1449315 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635697 () (_ BitVec 64))

(declare-fun e!816167 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11690 0))(
  ( (MissingZero!11690 (index!49152 (_ BitVec 32))) (Found!11690 (index!49153 (_ BitVec 32))) (Intermediate!11690 (undefined!12502 Bool) (index!49154 (_ BitVec 32)) (x!130814 (_ BitVec 32))) (Undefined!11690) (MissingVacant!11690 (index!49155 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98248 (_ BitVec 32)) SeekEntryResult!11690)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98248 (_ BitVec 32)) SeekEntryResult!11690)

(assert (=> b!1449315 (= e!816167 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635697 lt!635692 mask!2687) (seekEntryOrOpen!0 lt!635697 lt!635692 mask!2687)))))

(declare-fun b!1449316 () Bool)

(declare-fun e!816166 () Bool)

(declare-fun e!816161 () Bool)

(assert (=> b!1449316 (= e!816166 e!816161)))

(declare-fun res!980871 () Bool)

(assert (=> b!1449316 (=> (not res!980871) (not e!816161))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98248)

(assert (=> b!1449316 (= res!980871 (= (select (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449316 (= lt!635692 (array!98249 (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47965 a!2862)))))

(declare-fun b!1449317 () Bool)

(declare-fun res!980865 () Bool)

(declare-fun e!816159 () Bool)

(assert (=> b!1449317 (=> (not res!980865) (not e!816159))))

(assert (=> b!1449317 (= res!980865 e!816167)))

(declare-fun c!133738 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449317 (= c!133738 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449318 () Bool)

(declare-fun res!980869 () Bool)

(assert (=> b!1449318 (=> (not res!980869) (not e!816166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449318 (= res!980869 (validKeyInArray!0 (select (arr!47413 a!2862) i!1006)))))

(declare-fun b!1449319 () Bool)

(declare-fun res!980870 () Bool)

(assert (=> b!1449319 (=> (not res!980870) (not e!816159))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449319 (= res!980870 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449320 () Bool)

(declare-fun res!980867 () Bool)

(assert (=> b!1449320 (=> (not res!980867) (not e!816166))))

(declare-datatypes ((List!33992 0))(
  ( (Nil!33989) (Cons!33988 (h!35338 (_ BitVec 64)) (t!48678 List!33992)) )
))
(declare-fun arrayNoDuplicates!0 (array!98248 (_ BitVec 32) List!33992) Bool)

(assert (=> b!1449320 (= res!980867 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33989))))

(declare-fun b!1449321 () Bool)

(declare-fun res!980875 () Bool)

(assert (=> b!1449321 (=> (not res!980875) (not e!816166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98248 (_ BitVec 32)) Bool)

(assert (=> b!1449321 (= res!980875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!816162 () Bool)

(declare-fun b!1449322 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1449322 (= e!816162 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449323 () Bool)

(declare-fun e!816165 () Bool)

(assert (=> b!1449323 (= e!816165 true)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!635693 () SeekEntryResult!11690)

(assert (=> b!1449323 (= lt!635693 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47413 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449324 () Bool)

(declare-fun res!980877 () Bool)

(assert (=> b!1449324 (=> (not res!980877) (not e!816166))))

(assert (=> b!1449324 (= res!980877 (and (= (size!47965 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47965 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47965 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!980878 () Bool)

(assert (=> start!124822 (=> (not res!980878) (not e!816166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124822 (= res!980878 (validMask!0 mask!2687))))

(assert (=> start!124822 e!816166))

(assert (=> start!124822 true))

(declare-fun array_inv!36646 (array!98248) Bool)

(assert (=> start!124822 (array_inv!36646 a!2862)))

(declare-fun b!1449325 () Bool)

(declare-fun res!980876 () Bool)

(assert (=> b!1449325 (=> (not res!980876) (not e!816166))))

(assert (=> b!1449325 (= res!980876 (validKeyInArray!0 (select (arr!47413 a!2862) j!93)))))

(declare-fun b!1449326 () Bool)

(declare-fun lt!635694 () SeekEntryResult!11690)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98248 (_ BitVec 32)) SeekEntryResult!11690)

(assert (=> b!1449326 (= e!816167 (= lt!635694 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635697 lt!635692 mask!2687)))))

(declare-fun b!1449327 () Bool)

(declare-fun e!816163 () Bool)

(assert (=> b!1449327 (= e!816163 e!816162)))

(declare-fun res!980879 () Bool)

(assert (=> b!1449327 (=> (not res!980879) (not e!816162))))

(declare-fun lt!635695 () SeekEntryResult!11690)

(assert (=> b!1449327 (= res!980879 (= lt!635695 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47413 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449328 () Bool)

(declare-fun e!816164 () Bool)

(assert (=> b!1449328 (= e!816161 e!816164)))

(declare-fun res!980880 () Bool)

(assert (=> b!1449328 (=> (not res!980880) (not e!816164))))

(declare-fun lt!635696 () SeekEntryResult!11690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449328 (= res!980880 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47413 a!2862) j!93) mask!2687) (select (arr!47413 a!2862) j!93) a!2862 mask!2687) lt!635696))))

(assert (=> b!1449328 (= lt!635696 (Intermediate!11690 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449329 () Bool)

(assert (=> b!1449329 (= e!816159 (not e!816165))))

(declare-fun res!980868 () Bool)

(assert (=> b!1449329 (=> res!980868 e!816165)))

(assert (=> b!1449329 (= res!980868 (or (and (= (select (arr!47413 a!2862) index!646) (select (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47413 a!2862) index!646) (select (arr!47413 a!2862) j!93))) (not (= (select (arr!47413 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47413 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816160 () Bool)

(assert (=> b!1449329 e!816160))

(declare-fun res!980873 () Bool)

(assert (=> b!1449329 (=> (not res!980873) (not e!816160))))

(assert (=> b!1449329 (= res!980873 (and (= lt!635695 (Found!11690 j!93)) (or (= (select (arr!47413 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47413 a!2862) intermediateBeforeIndex!19) (select (arr!47413 a!2862) j!93)))))))

(assert (=> b!1449329 (= lt!635695 (seekEntryOrOpen!0 (select (arr!47413 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449329 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48717 0))(
  ( (Unit!48718) )
))
(declare-fun lt!635691 () Unit!48717)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48717)

(assert (=> b!1449329 (= lt!635691 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449330 () Bool)

(assert (=> b!1449330 (= e!816160 e!816163)))

(declare-fun res!980881 () Bool)

(assert (=> b!1449330 (=> res!980881 e!816163)))

(assert (=> b!1449330 (= res!980881 (or (and (= (select (arr!47413 a!2862) index!646) (select (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47413 a!2862) index!646) (select (arr!47413 a!2862) j!93))) (not (= (select (arr!47413 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449331 () Bool)

(assert (=> b!1449331 (= e!816164 e!816159)))

(declare-fun res!980866 () Bool)

(assert (=> b!1449331 (=> (not res!980866) (not e!816159))))

(assert (=> b!1449331 (= res!980866 (= lt!635694 (Intermediate!11690 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449331 (= lt!635694 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635697 mask!2687) lt!635697 lt!635692 mask!2687))))

(assert (=> b!1449331 (= lt!635697 (select (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449332 () Bool)

(declare-fun res!980874 () Bool)

(assert (=> b!1449332 (=> (not res!980874) (not e!816166))))

(assert (=> b!1449332 (= res!980874 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47965 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47965 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47965 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449333 () Bool)

(declare-fun res!980872 () Bool)

(assert (=> b!1449333 (=> (not res!980872) (not e!816164))))

(assert (=> b!1449333 (= res!980872 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47413 a!2862) j!93) a!2862 mask!2687) lt!635696))))

(assert (= (and start!124822 res!980878) b!1449324))

(assert (= (and b!1449324 res!980877) b!1449318))

(assert (= (and b!1449318 res!980869) b!1449325))

(assert (= (and b!1449325 res!980876) b!1449321))

(assert (= (and b!1449321 res!980875) b!1449320))

(assert (= (and b!1449320 res!980867) b!1449332))

(assert (= (and b!1449332 res!980874) b!1449316))

(assert (= (and b!1449316 res!980871) b!1449328))

(assert (= (and b!1449328 res!980880) b!1449333))

(assert (= (and b!1449333 res!980872) b!1449331))

(assert (= (and b!1449331 res!980866) b!1449317))

(assert (= (and b!1449317 c!133738) b!1449326))

(assert (= (and b!1449317 (not c!133738)) b!1449315))

(assert (= (and b!1449317 res!980865) b!1449319))

(assert (= (and b!1449319 res!980870) b!1449329))

(assert (= (and b!1449329 res!980873) b!1449330))

(assert (= (and b!1449330 (not res!980881)) b!1449327))

(assert (= (and b!1449327 res!980879) b!1449322))

(assert (= (and b!1449329 (not res!980868)) b!1449323))

(declare-fun m!1337541 () Bool)

(assert (=> b!1449331 m!1337541))

(assert (=> b!1449331 m!1337541))

(declare-fun m!1337543 () Bool)

(assert (=> b!1449331 m!1337543))

(declare-fun m!1337545 () Bool)

(assert (=> b!1449331 m!1337545))

(declare-fun m!1337547 () Bool)

(assert (=> b!1449331 m!1337547))

(declare-fun m!1337549 () Bool)

(assert (=> b!1449333 m!1337549))

(assert (=> b!1449333 m!1337549))

(declare-fun m!1337551 () Bool)

(assert (=> b!1449333 m!1337551))

(declare-fun m!1337553 () Bool)

(assert (=> b!1449326 m!1337553))

(assert (=> b!1449327 m!1337549))

(assert (=> b!1449327 m!1337549))

(declare-fun m!1337555 () Bool)

(assert (=> b!1449327 m!1337555))

(declare-fun m!1337557 () Bool)

(assert (=> start!124822 m!1337557))

(declare-fun m!1337559 () Bool)

(assert (=> start!124822 m!1337559))

(assert (=> b!1449316 m!1337545))

(declare-fun m!1337561 () Bool)

(assert (=> b!1449316 m!1337561))

(assert (=> b!1449323 m!1337549))

(assert (=> b!1449323 m!1337549))

(declare-fun m!1337563 () Bool)

(assert (=> b!1449323 m!1337563))

(assert (=> b!1449328 m!1337549))

(assert (=> b!1449328 m!1337549))

(declare-fun m!1337565 () Bool)

(assert (=> b!1449328 m!1337565))

(assert (=> b!1449328 m!1337565))

(assert (=> b!1449328 m!1337549))

(declare-fun m!1337567 () Bool)

(assert (=> b!1449328 m!1337567))

(declare-fun m!1337569 () Bool)

(assert (=> b!1449329 m!1337569))

(assert (=> b!1449329 m!1337545))

(declare-fun m!1337571 () Bool)

(assert (=> b!1449329 m!1337571))

(declare-fun m!1337573 () Bool)

(assert (=> b!1449329 m!1337573))

(declare-fun m!1337575 () Bool)

(assert (=> b!1449329 m!1337575))

(assert (=> b!1449329 m!1337549))

(declare-fun m!1337577 () Bool)

(assert (=> b!1449329 m!1337577))

(declare-fun m!1337579 () Bool)

(assert (=> b!1449329 m!1337579))

(assert (=> b!1449329 m!1337549))

(assert (=> b!1449330 m!1337575))

(assert (=> b!1449330 m!1337545))

(assert (=> b!1449330 m!1337573))

(assert (=> b!1449330 m!1337549))

(declare-fun m!1337581 () Bool)

(assert (=> b!1449320 m!1337581))

(declare-fun m!1337583 () Bool)

(assert (=> b!1449315 m!1337583))

(declare-fun m!1337585 () Bool)

(assert (=> b!1449315 m!1337585))

(declare-fun m!1337587 () Bool)

(assert (=> b!1449318 m!1337587))

(assert (=> b!1449318 m!1337587))

(declare-fun m!1337589 () Bool)

(assert (=> b!1449318 m!1337589))

(assert (=> b!1449325 m!1337549))

(assert (=> b!1449325 m!1337549))

(declare-fun m!1337591 () Bool)

(assert (=> b!1449325 m!1337591))

(declare-fun m!1337593 () Bool)

(assert (=> b!1449321 m!1337593))

(check-sat (not b!1449328) (not b!1449331) (not b!1449323) (not b!1449320) (not b!1449315) (not b!1449325) (not b!1449333) (not b!1449318) (not b!1449321) (not b!1449329) (not b!1449327) (not b!1449326) (not start!124822))
(check-sat)
