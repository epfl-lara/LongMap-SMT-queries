; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124822 () Bool)

(assert start!124822)

(declare-fun b!1448655 () Bool)

(declare-fun e!815833 () Bool)

(assert (=> b!1448655 (= e!815833 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98270 0))(
  ( (array!98271 (arr!47423 (Array (_ BitVec 32) (_ BitVec 64))) (size!47973 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98270)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11675 0))(
  ( (MissingZero!11675 (index!49092 (_ BitVec 32))) (Found!11675 (index!49093 (_ BitVec 32))) (Intermediate!11675 (undefined!12487 Bool) (index!49094 (_ BitVec 32)) (x!130764 (_ BitVec 32))) (Undefined!11675) (MissingVacant!11675 (index!49095 (_ BitVec 32))) )
))
(declare-fun lt!635612 () SeekEntryResult!11675)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98270 (_ BitVec 32)) SeekEntryResult!11675)

(assert (=> b!1448655 (= lt!635612 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47423 a!2862) j!93) a!2862 mask!2687))))

(declare-fun res!980192 () Bool)

(declare-fun e!815825 () Bool)

(assert (=> start!124822 (=> (not res!980192) (not e!815825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124822 (= res!980192 (validMask!0 mask!2687))))

(assert (=> start!124822 e!815825))

(assert (=> start!124822 true))

(declare-fun array_inv!36451 (array!98270) Bool)

(assert (=> start!124822 (array_inv!36451 a!2862)))

(declare-fun b!1448656 () Bool)

(declare-fun e!815831 () Bool)

(assert (=> b!1448656 (= e!815825 e!815831)))

(declare-fun res!980182 () Bool)

(assert (=> b!1448656 (=> (not res!980182) (not e!815831))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448656 (= res!980182 (= (select (store (arr!47423 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635616 () array!98270)

(assert (=> b!1448656 (= lt!635616 (array!98271 (store (arr!47423 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47973 a!2862)))))

(declare-fun b!1448657 () Bool)

(declare-fun e!815826 () Bool)

(declare-fun e!815827 () Bool)

(assert (=> b!1448657 (= e!815826 e!815827)))

(declare-fun res!980184 () Bool)

(assert (=> b!1448657 (=> (not res!980184) (not e!815827))))

(declare-fun lt!635614 () SeekEntryResult!11675)

(assert (=> b!1448657 (= res!980184 (= lt!635614 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47423 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448658 () Bool)

(declare-fun res!980191 () Bool)

(assert (=> b!1448658 (=> (not res!980191) (not e!815825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448658 (= res!980191 (validKeyInArray!0 (select (arr!47423 a!2862) i!1006)))))

(declare-fun b!1448659 () Bool)

(declare-fun e!815832 () Bool)

(assert (=> b!1448659 (= e!815831 e!815832)))

(declare-fun res!980179 () Bool)

(assert (=> b!1448659 (=> (not res!980179) (not e!815832))))

(declare-fun lt!635610 () SeekEntryResult!11675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98270 (_ BitVec 32)) SeekEntryResult!11675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448659 (= res!980179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47423 a!2862) j!93) mask!2687) (select (arr!47423 a!2862) j!93) a!2862 mask!2687) lt!635610))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448659 (= lt!635610 (Intermediate!11675 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448660 () Bool)

(declare-fun res!980187 () Bool)

(declare-fun e!815828 () Bool)

(assert (=> b!1448660 (=> (not res!980187) (not e!815828))))

(assert (=> b!1448660 (= res!980187 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448661 () Bool)

(assert (=> b!1448661 (= e!815832 e!815828)))

(declare-fun res!980180 () Bool)

(assert (=> b!1448661 (=> (not res!980180) (not e!815828))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!635613 () SeekEntryResult!11675)

(assert (=> b!1448661 (= res!980180 (= lt!635613 (Intermediate!11675 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635611 () (_ BitVec 64))

(assert (=> b!1448661 (= lt!635613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635611 mask!2687) lt!635611 lt!635616 mask!2687))))

(assert (=> b!1448661 (= lt!635611 (select (store (arr!47423 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448662 () Bool)

(declare-fun res!980183 () Bool)

(assert (=> b!1448662 (=> (not res!980183) (not e!815825))))

(declare-datatypes ((List!33924 0))(
  ( (Nil!33921) (Cons!33920 (h!35270 (_ BitVec 64)) (t!48618 List!33924)) )
))
(declare-fun arrayNoDuplicates!0 (array!98270 (_ BitVec 32) List!33924) Bool)

(assert (=> b!1448662 (= res!980183 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33921))))

(declare-fun b!1448663 () Bool)

(declare-fun res!980188 () Bool)

(assert (=> b!1448663 (=> (not res!980188) (not e!815828))))

(declare-fun e!815829 () Bool)

(assert (=> b!1448663 (= res!980188 e!815829)))

(declare-fun c!133749 () Bool)

(assert (=> b!1448663 (= c!133749 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448664 () Bool)

(declare-fun res!980181 () Bool)

(assert (=> b!1448664 (=> (not res!980181) (not e!815825))))

(assert (=> b!1448664 (= res!980181 (and (= (size!47973 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47973 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47973 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448665 () Bool)

(assert (=> b!1448665 (= e!815828 (not e!815833))))

(declare-fun res!980190 () Bool)

(assert (=> b!1448665 (=> res!980190 e!815833)))

(assert (=> b!1448665 (= res!980190 (or (and (= (select (arr!47423 a!2862) index!646) (select (store (arr!47423 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47423 a!2862) index!646) (select (arr!47423 a!2862) j!93))) (not (= (select (arr!47423 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47423 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815834 () Bool)

(assert (=> b!1448665 e!815834))

(declare-fun res!980193 () Bool)

(assert (=> b!1448665 (=> (not res!980193) (not e!815834))))

(assert (=> b!1448665 (= res!980193 (and (= lt!635614 (Found!11675 j!93)) (or (= (select (arr!47423 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47423 a!2862) intermediateBeforeIndex!19) (select (arr!47423 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98270 (_ BitVec 32)) SeekEntryResult!11675)

(assert (=> b!1448665 (= lt!635614 (seekEntryOrOpen!0 (select (arr!47423 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98270 (_ BitVec 32)) Bool)

(assert (=> b!1448665 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48846 0))(
  ( (Unit!48847) )
))
(declare-fun lt!635615 () Unit!48846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48846)

(assert (=> b!1448665 (= lt!635615 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448666 () Bool)

(declare-fun res!980186 () Bool)

(assert (=> b!1448666 (=> (not res!980186) (not e!815825))))

(assert (=> b!1448666 (= res!980186 (validKeyInArray!0 (select (arr!47423 a!2862) j!93)))))

(declare-fun b!1448667 () Bool)

(declare-fun res!980178 () Bool)

(assert (=> b!1448667 (=> (not res!980178) (not e!815825))))

(assert (=> b!1448667 (= res!980178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448668 () Bool)

(declare-fun res!980185 () Bool)

(assert (=> b!1448668 (=> (not res!980185) (not e!815832))))

(assert (=> b!1448668 (= res!980185 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47423 a!2862) j!93) a!2862 mask!2687) lt!635610))))

(declare-fun b!1448669 () Bool)

(assert (=> b!1448669 (= e!815829 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635611 lt!635616 mask!2687) (seekEntryOrOpen!0 lt!635611 lt!635616 mask!2687)))))

(declare-fun b!1448670 () Bool)

(assert (=> b!1448670 (= e!815834 e!815826)))

(declare-fun res!980194 () Bool)

(assert (=> b!1448670 (=> res!980194 e!815826)))

(assert (=> b!1448670 (= res!980194 (or (and (= (select (arr!47423 a!2862) index!646) (select (store (arr!47423 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47423 a!2862) index!646) (select (arr!47423 a!2862) j!93))) (not (= (select (arr!47423 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448671 () Bool)

(assert (=> b!1448671 (= e!815829 (= lt!635613 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635611 lt!635616 mask!2687)))))

(declare-fun b!1448672 () Bool)

(declare-fun res!980189 () Bool)

(assert (=> b!1448672 (=> (not res!980189) (not e!815825))))

(assert (=> b!1448672 (= res!980189 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47973 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47973 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47973 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448673 () Bool)

(assert (=> b!1448673 (= e!815827 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124822 res!980192) b!1448664))

(assert (= (and b!1448664 res!980181) b!1448658))

(assert (= (and b!1448658 res!980191) b!1448666))

(assert (= (and b!1448666 res!980186) b!1448667))

(assert (= (and b!1448667 res!980178) b!1448662))

(assert (= (and b!1448662 res!980183) b!1448672))

(assert (= (and b!1448672 res!980189) b!1448656))

(assert (= (and b!1448656 res!980182) b!1448659))

(assert (= (and b!1448659 res!980179) b!1448668))

(assert (= (and b!1448668 res!980185) b!1448661))

(assert (= (and b!1448661 res!980180) b!1448663))

(assert (= (and b!1448663 c!133749) b!1448671))

(assert (= (and b!1448663 (not c!133749)) b!1448669))

(assert (= (and b!1448663 res!980188) b!1448660))

(assert (= (and b!1448660 res!980187) b!1448665))

(assert (= (and b!1448665 res!980193) b!1448670))

(assert (= (and b!1448670 (not res!980194)) b!1448657))

(assert (= (and b!1448657 res!980184) b!1448673))

(assert (= (and b!1448665 (not res!980190)) b!1448655))

(declare-fun m!1337407 () Bool)

(assert (=> b!1448671 m!1337407))

(declare-fun m!1337409 () Bool)

(assert (=> b!1448662 m!1337409))

(declare-fun m!1337411 () Bool)

(assert (=> b!1448655 m!1337411))

(assert (=> b!1448655 m!1337411))

(declare-fun m!1337413 () Bool)

(assert (=> b!1448655 m!1337413))

(declare-fun m!1337415 () Bool)

(assert (=> b!1448661 m!1337415))

(assert (=> b!1448661 m!1337415))

(declare-fun m!1337417 () Bool)

(assert (=> b!1448661 m!1337417))

(declare-fun m!1337419 () Bool)

(assert (=> b!1448661 m!1337419))

(declare-fun m!1337421 () Bool)

(assert (=> b!1448661 m!1337421))

(assert (=> b!1448659 m!1337411))

(assert (=> b!1448659 m!1337411))

(declare-fun m!1337423 () Bool)

(assert (=> b!1448659 m!1337423))

(assert (=> b!1448659 m!1337423))

(assert (=> b!1448659 m!1337411))

(declare-fun m!1337425 () Bool)

(assert (=> b!1448659 m!1337425))

(declare-fun m!1337427 () Bool)

(assert (=> b!1448667 m!1337427))

(assert (=> b!1448657 m!1337411))

(assert (=> b!1448657 m!1337411))

(declare-fun m!1337429 () Bool)

(assert (=> b!1448657 m!1337429))

(declare-fun m!1337431 () Bool)

(assert (=> b!1448665 m!1337431))

(assert (=> b!1448665 m!1337419))

(declare-fun m!1337433 () Bool)

(assert (=> b!1448665 m!1337433))

(declare-fun m!1337435 () Bool)

(assert (=> b!1448665 m!1337435))

(declare-fun m!1337437 () Bool)

(assert (=> b!1448665 m!1337437))

(assert (=> b!1448665 m!1337411))

(declare-fun m!1337439 () Bool)

(assert (=> b!1448665 m!1337439))

(declare-fun m!1337441 () Bool)

(assert (=> b!1448665 m!1337441))

(assert (=> b!1448665 m!1337411))

(declare-fun m!1337443 () Bool)

(assert (=> b!1448669 m!1337443))

(declare-fun m!1337445 () Bool)

(assert (=> b!1448669 m!1337445))

(assert (=> b!1448656 m!1337419))

(declare-fun m!1337447 () Bool)

(assert (=> b!1448656 m!1337447))

(assert (=> b!1448666 m!1337411))

(assert (=> b!1448666 m!1337411))

(declare-fun m!1337449 () Bool)

(assert (=> b!1448666 m!1337449))

(declare-fun m!1337451 () Bool)

(assert (=> b!1448658 m!1337451))

(assert (=> b!1448658 m!1337451))

(declare-fun m!1337453 () Bool)

(assert (=> b!1448658 m!1337453))

(declare-fun m!1337455 () Bool)

(assert (=> start!124822 m!1337455))

(declare-fun m!1337457 () Bool)

(assert (=> start!124822 m!1337457))

(assert (=> b!1448668 m!1337411))

(assert (=> b!1448668 m!1337411))

(declare-fun m!1337459 () Bool)

(assert (=> b!1448668 m!1337459))

(assert (=> b!1448670 m!1337437))

(assert (=> b!1448670 m!1337419))

(assert (=> b!1448670 m!1337435))

(assert (=> b!1448670 m!1337411))

(push 1)

