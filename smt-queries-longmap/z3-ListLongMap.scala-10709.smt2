; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125394 () Bool)

(assert start!125394)

(declare-fun lt!641766 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!641768 () (_ BitVec 64))

(declare-fun e!823873 () Bool)

(declare-fun b!1466475 () Bool)

(declare-datatypes ((array!98842 0))(
  ( (array!98843 (arr!47709 (Array (_ BitVec 32) (_ BitVec 64))) (size!48259 (_ BitVec 32))) )
))
(declare-fun lt!641769 () array!98842)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11961 0))(
  ( (MissingZero!11961 (index!50236 (_ BitVec 32))) (Found!11961 (index!50237 (_ BitVec 32))) (Intermediate!11961 (undefined!12773 Bool) (index!50238 (_ BitVec 32)) (x!131810 (_ BitVec 32))) (Undefined!11961) (MissingVacant!11961 (index!50239 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98842 (_ BitVec 32)) SeekEntryResult!11961)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98842 (_ BitVec 32)) SeekEntryResult!11961)

(assert (=> b!1466475 (= e!823873 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641766 intermediateAfterIndex!19 lt!641768 lt!641769 mask!2687) (seekEntryOrOpen!0 lt!641768 lt!641769 mask!2687))))))

(declare-fun b!1466476 () Bool)

(declare-fun e!823877 () Bool)

(declare-fun e!823870 () Bool)

(assert (=> b!1466476 (= e!823877 e!823870)))

(declare-fun res!995175 () Bool)

(assert (=> b!1466476 (=> (not res!995175) (not e!823870))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98842)

(assert (=> b!1466476 (= res!995175 (= (select (store (arr!47709 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466476 (= lt!641769 (array!98843 (store (arr!47709 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48259 a!2862)))))

(declare-fun b!1466477 () Bool)

(declare-fun e!823876 () Bool)

(assert (=> b!1466477 (= e!823876 true)))

(declare-fun lt!641767 () SeekEntryResult!11961)

(assert (=> b!1466477 (= lt!641767 (seekEntryOrOpen!0 lt!641768 lt!641769 mask!2687))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((Unit!49418 0))(
  ( (Unit!49419) )
))
(declare-fun lt!641771 () Unit!49418)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49418)

(assert (=> b!1466477 (= lt!641771 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641766 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun e!823871 () Bool)

(declare-fun lt!641772 () SeekEntryResult!11961)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1466478 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98842 (_ BitVec 32)) SeekEntryResult!11961)

(assert (=> b!1466478 (= e!823871 (= lt!641772 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641768 lt!641769 mask!2687)))))

(declare-fun b!1466479 () Bool)

(declare-fun e!823875 () Bool)

(assert (=> b!1466479 (= e!823875 e!823876)))

(declare-fun res!995178 () Bool)

(assert (=> b!1466479 (=> res!995178 e!823876)))

(assert (=> b!1466479 (= res!995178 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641766 #b00000000000000000000000000000000) (bvsge lt!641766 (size!48259 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466479 (= lt!641766 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466480 () Bool)

(assert (=> b!1466480 (= e!823873 (not (= lt!641772 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641766 lt!641768 lt!641769 mask!2687))))))

(declare-fun b!1466481 () Bool)

(declare-fun res!995180 () Bool)

(declare-fun e!823874 () Bool)

(assert (=> b!1466481 (=> (not res!995180) (not e!823874))))

(assert (=> b!1466481 (= res!995180 e!823871)))

(declare-fun c!135162 () Bool)

(assert (=> b!1466481 (= c!135162 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466482 () Bool)

(declare-fun res!995179 () Bool)

(declare-fun e!823872 () Bool)

(assert (=> b!1466482 (=> (not res!995179) (not e!823872))))

(declare-fun lt!641765 () SeekEntryResult!11961)

(assert (=> b!1466482 (= res!995179 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47709 a!2862) j!93) a!2862 mask!2687) lt!641765))))

(declare-fun res!995183 () Bool)

(assert (=> start!125394 (=> (not res!995183) (not e!823877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125394 (= res!995183 (validMask!0 mask!2687))))

(assert (=> start!125394 e!823877))

(assert (=> start!125394 true))

(declare-fun array_inv!36737 (array!98842) Bool)

(assert (=> start!125394 (array_inv!36737 a!2862)))

(declare-fun b!1466483 () Bool)

(assert (=> b!1466483 (= e!823871 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641768 lt!641769 mask!2687) (seekEntryOrOpen!0 lt!641768 lt!641769 mask!2687)))))

(declare-fun b!1466484 () Bool)

(declare-fun res!995188 () Bool)

(assert (=> b!1466484 (=> res!995188 e!823876)))

(assert (=> b!1466484 (= res!995188 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466485 () Bool)

(declare-fun res!995184 () Bool)

(assert (=> b!1466485 (=> (not res!995184) (not e!823874))))

(assert (=> b!1466485 (= res!995184 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466486 () Bool)

(declare-fun res!995185 () Bool)

(assert (=> b!1466486 (=> (not res!995185) (not e!823877))))

(assert (=> b!1466486 (= res!995185 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48259 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48259 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48259 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466487 () Bool)

(declare-fun res!995182 () Bool)

(assert (=> b!1466487 (=> (not res!995182) (not e!823877))))

(declare-datatypes ((List!34210 0))(
  ( (Nil!34207) (Cons!34206 (h!35556 (_ BitVec 64)) (t!48904 List!34210)) )
))
(declare-fun arrayNoDuplicates!0 (array!98842 (_ BitVec 32) List!34210) Bool)

(assert (=> b!1466487 (= res!995182 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34207))))

(declare-fun b!1466488 () Bool)

(declare-fun res!995187 () Bool)

(assert (=> b!1466488 (=> (not res!995187) (not e!823877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466488 (= res!995187 (validKeyInArray!0 (select (arr!47709 a!2862) j!93)))))

(declare-fun b!1466489 () Bool)

(declare-fun res!995176 () Bool)

(assert (=> b!1466489 (=> (not res!995176) (not e!823877))))

(assert (=> b!1466489 (= res!995176 (and (= (size!48259 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48259 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48259 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466490 () Bool)

(declare-fun res!995191 () Bool)

(assert (=> b!1466490 (=> res!995191 e!823876)))

(assert (=> b!1466490 (= res!995191 e!823873)))

(declare-fun c!135161 () Bool)

(assert (=> b!1466490 (= c!135161 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466491 () Bool)

(assert (=> b!1466491 (= e!823872 e!823874)))

(declare-fun res!995190 () Bool)

(assert (=> b!1466491 (=> (not res!995190) (not e!823874))))

(assert (=> b!1466491 (= res!995190 (= lt!641772 (Intermediate!11961 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466491 (= lt!641772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641768 mask!2687) lt!641768 lt!641769 mask!2687))))

(assert (=> b!1466491 (= lt!641768 (select (store (arr!47709 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466492 () Bool)

(declare-fun res!995186 () Bool)

(assert (=> b!1466492 (=> res!995186 e!823876)))

(assert (=> b!1466492 (= res!995186 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641766 (select (arr!47709 a!2862) j!93) a!2862 mask!2687) lt!641765)))))

(declare-fun b!1466493 () Bool)

(declare-fun res!995177 () Bool)

(assert (=> b!1466493 (=> (not res!995177) (not e!823877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98842 (_ BitVec 32)) Bool)

(assert (=> b!1466493 (= res!995177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466494 () Bool)

(assert (=> b!1466494 (= e!823870 e!823872)))

(declare-fun res!995181 () Bool)

(assert (=> b!1466494 (=> (not res!995181) (not e!823872))))

(assert (=> b!1466494 (= res!995181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47709 a!2862) j!93) mask!2687) (select (arr!47709 a!2862) j!93) a!2862 mask!2687) lt!641765))))

(assert (=> b!1466494 (= lt!641765 (Intermediate!11961 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466495 () Bool)

(declare-fun res!995189 () Bool)

(assert (=> b!1466495 (=> (not res!995189) (not e!823877))))

(assert (=> b!1466495 (= res!995189 (validKeyInArray!0 (select (arr!47709 a!2862) i!1006)))))

(declare-fun b!1466496 () Bool)

(assert (=> b!1466496 (= e!823874 (not e!823875))))

(declare-fun res!995174 () Bool)

(assert (=> b!1466496 (=> res!995174 e!823875)))

(assert (=> b!1466496 (= res!995174 (or (and (= (select (arr!47709 a!2862) index!646) (select (store (arr!47709 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47709 a!2862) index!646) (select (arr!47709 a!2862) j!93))) (= (select (arr!47709 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466496 (and (= lt!641767 (Found!11961 j!93)) (or (= (select (arr!47709 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47709 a!2862) intermediateBeforeIndex!19) (select (arr!47709 a!2862) j!93))))))

(assert (=> b!1466496 (= lt!641767 (seekEntryOrOpen!0 (select (arr!47709 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1466496 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641770 () Unit!49418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49418)

(assert (=> b!1466496 (= lt!641770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125394 res!995183) b!1466489))

(assert (= (and b!1466489 res!995176) b!1466495))

(assert (= (and b!1466495 res!995189) b!1466488))

(assert (= (and b!1466488 res!995187) b!1466493))

(assert (= (and b!1466493 res!995177) b!1466487))

(assert (= (and b!1466487 res!995182) b!1466486))

(assert (= (and b!1466486 res!995185) b!1466476))

(assert (= (and b!1466476 res!995175) b!1466494))

(assert (= (and b!1466494 res!995181) b!1466482))

(assert (= (and b!1466482 res!995179) b!1466491))

(assert (= (and b!1466491 res!995190) b!1466481))

(assert (= (and b!1466481 c!135162) b!1466478))

(assert (= (and b!1466481 (not c!135162)) b!1466483))

(assert (= (and b!1466481 res!995180) b!1466485))

(assert (= (and b!1466485 res!995184) b!1466496))

(assert (= (and b!1466496 (not res!995174)) b!1466479))

(assert (= (and b!1466479 (not res!995178)) b!1466492))

(assert (= (and b!1466492 (not res!995186)) b!1466490))

(assert (= (and b!1466490 c!135161) b!1466480))

(assert (= (and b!1466490 (not c!135161)) b!1466475))

(assert (= (and b!1466490 (not res!995191)) b!1466484))

(assert (= (and b!1466484 (not res!995188)) b!1466477))

(declare-fun m!1353463 () Bool)

(assert (=> b!1466493 m!1353463))

(declare-fun m!1353465 () Bool)

(assert (=> b!1466476 m!1353465))

(declare-fun m!1353467 () Bool)

(assert (=> b!1466476 m!1353467))

(declare-fun m!1353469 () Bool)

(assert (=> b!1466494 m!1353469))

(assert (=> b!1466494 m!1353469))

(declare-fun m!1353471 () Bool)

(assert (=> b!1466494 m!1353471))

(assert (=> b!1466494 m!1353471))

(assert (=> b!1466494 m!1353469))

(declare-fun m!1353473 () Bool)

(assert (=> b!1466494 m!1353473))

(assert (=> b!1466492 m!1353469))

(assert (=> b!1466492 m!1353469))

(declare-fun m!1353475 () Bool)

(assert (=> b!1466492 m!1353475))

(declare-fun m!1353477 () Bool)

(assert (=> b!1466491 m!1353477))

(assert (=> b!1466491 m!1353477))

(declare-fun m!1353479 () Bool)

(assert (=> b!1466491 m!1353479))

(assert (=> b!1466491 m!1353465))

(declare-fun m!1353481 () Bool)

(assert (=> b!1466491 m!1353481))

(declare-fun m!1353483 () Bool)

(assert (=> b!1466479 m!1353483))

(assert (=> b!1466488 m!1353469))

(assert (=> b!1466488 m!1353469))

(declare-fun m!1353485 () Bool)

(assert (=> b!1466488 m!1353485))

(declare-fun m!1353487 () Bool)

(assert (=> b!1466477 m!1353487))

(declare-fun m!1353489 () Bool)

(assert (=> b!1466477 m!1353489))

(declare-fun m!1353491 () Bool)

(assert (=> b!1466478 m!1353491))

(declare-fun m!1353493 () Bool)

(assert (=> b!1466496 m!1353493))

(assert (=> b!1466496 m!1353465))

(declare-fun m!1353495 () Bool)

(assert (=> b!1466496 m!1353495))

(declare-fun m!1353497 () Bool)

(assert (=> b!1466496 m!1353497))

(declare-fun m!1353499 () Bool)

(assert (=> b!1466496 m!1353499))

(assert (=> b!1466496 m!1353469))

(declare-fun m!1353501 () Bool)

(assert (=> b!1466496 m!1353501))

(declare-fun m!1353503 () Bool)

(assert (=> b!1466496 m!1353503))

(assert (=> b!1466496 m!1353469))

(declare-fun m!1353505 () Bool)

(assert (=> b!1466487 m!1353505))

(declare-fun m!1353507 () Bool)

(assert (=> b!1466475 m!1353507))

(assert (=> b!1466475 m!1353487))

(declare-fun m!1353509 () Bool)

(assert (=> b!1466495 m!1353509))

(assert (=> b!1466495 m!1353509))

(declare-fun m!1353511 () Bool)

(assert (=> b!1466495 m!1353511))

(declare-fun m!1353513 () Bool)

(assert (=> start!125394 m!1353513))

(declare-fun m!1353515 () Bool)

(assert (=> start!125394 m!1353515))

(assert (=> b!1466482 m!1353469))

(assert (=> b!1466482 m!1353469))

(declare-fun m!1353517 () Bool)

(assert (=> b!1466482 m!1353517))

(declare-fun m!1353519 () Bool)

(assert (=> b!1466480 m!1353519))

(declare-fun m!1353521 () Bool)

(assert (=> b!1466483 m!1353521))

(assert (=> b!1466483 m!1353487))

(check-sat (not b!1466480) (not b!1466478) (not b!1466496) (not b!1466475) (not b!1466482) (not b!1466487) (not b!1466483) (not b!1466491) (not b!1466477) (not b!1466493) (not start!125394) (not b!1466495) (not b!1466494) (not b!1466492) (not b!1466479) (not b!1466488))
(check-sat)
