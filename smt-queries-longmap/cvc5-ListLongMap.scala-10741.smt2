; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125584 () Bool)

(assert start!125584)

(declare-fun b!1469516 () Bool)

(declare-fun e!824992 () Bool)

(declare-fun e!824989 () Bool)

(assert (=> b!1469516 (= e!824992 e!824989)))

(declare-fun res!998008 () Bool)

(assert (=> b!1469516 (=> (not res!998008) (not e!824989))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99032 0))(
  ( (array!99033 (arr!47804 (Array (_ BitVec 32) (_ BitVec 64))) (size!48354 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99032)

(assert (=> b!1469516 (= res!998008 (= (select (store (arr!47804 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642590 () array!99032)

(assert (=> b!1469516 (= lt!642590 (array!99033 (store (arr!47804 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48354 a!2862)))))

(declare-fun b!1469517 () Bool)

(declare-fun res!998001 () Bool)

(assert (=> b!1469517 (=> (not res!998001) (not e!824992))))

(declare-datatypes ((List!34305 0))(
  ( (Nil!34302) (Cons!34301 (h!35651 (_ BitVec 64)) (t!48999 List!34305)) )
))
(declare-fun arrayNoDuplicates!0 (array!99032 (_ BitVec 32) List!34305) Bool)

(assert (=> b!1469517 (= res!998001 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34302))))

(declare-fun b!1469518 () Bool)

(declare-fun res!998000 () Bool)

(assert (=> b!1469518 (=> (not res!998000) (not e!824992))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469518 (= res!998000 (validKeyInArray!0 (select (arr!47804 a!2862) j!93)))))

(declare-fun b!1469519 () Bool)

(declare-fun res!997997 () Bool)

(assert (=> b!1469519 (=> (not res!997997) (not e!824992))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1469519 (= res!997997 (and (= (size!48354 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48354 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48354 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469520 () Bool)

(declare-fun res!998003 () Bool)

(assert (=> b!1469520 (=> (not res!998003) (not e!824992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99032 (_ BitVec 32)) Bool)

(assert (=> b!1469520 (= res!998003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469521 () Bool)

(declare-fun e!824990 () Bool)

(assert (=> b!1469521 (= e!824989 e!824990)))

(declare-fun res!998007 () Bool)

(assert (=> b!1469521 (=> (not res!998007) (not e!824990))))

(declare-datatypes ((SeekEntryResult!12044 0))(
  ( (MissingZero!12044 (index!50568 (_ BitVec 32))) (Found!12044 (index!50569 (_ BitVec 32))) (Intermediate!12044 (undefined!12856 Bool) (index!50570 (_ BitVec 32)) (x!132149 (_ BitVec 32))) (Undefined!12044) (MissingVacant!12044 (index!50571 (_ BitVec 32))) )
))
(declare-fun lt!642591 () SeekEntryResult!12044)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99032 (_ BitVec 32)) SeekEntryResult!12044)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469521 (= res!998007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47804 a!2862) j!93) mask!2687) (select (arr!47804 a!2862) j!93) a!2862 mask!2687) lt!642591))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469521 (= lt!642591 (Intermediate!12044 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469522 () Bool)

(declare-fun res!998006 () Bool)

(declare-fun e!824991 () Bool)

(assert (=> b!1469522 (=> (not res!998006) (not e!824991))))

(declare-fun e!824993 () Bool)

(assert (=> b!1469522 (= res!998006 e!824993)))

(declare-fun c!135270 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469522 (= c!135270 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469523 () Bool)

(declare-fun res!997999 () Bool)

(assert (=> b!1469523 (=> (not res!997999) (not e!824992))))

(assert (=> b!1469523 (= res!997999 (validKeyInArray!0 (select (arr!47804 a!2862) i!1006)))))

(declare-fun b!1469524 () Bool)

(declare-fun res!997998 () Bool)

(assert (=> b!1469524 (=> (not res!997998) (not e!824990))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469524 (= res!997998 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47804 a!2862) j!93) a!2862 mask!2687) lt!642591))))

(declare-fun lt!642588 () (_ BitVec 64))

(declare-fun b!1469525 () Bool)

(declare-fun lt!642589 () SeekEntryResult!12044)

(assert (=> b!1469525 (= e!824993 (= lt!642589 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642588 lt!642590 mask!2687)))))

(declare-fun b!1469526 () Bool)

(declare-fun res!998005 () Bool)

(assert (=> b!1469526 (=> (not res!998005) (not e!824992))))

(assert (=> b!1469526 (= res!998005 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48354 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48354 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48354 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!998002 () Bool)

(assert (=> start!125584 (=> (not res!998002) (not e!824992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125584 (= res!998002 (validMask!0 mask!2687))))

(assert (=> start!125584 e!824992))

(assert (=> start!125584 true))

(declare-fun array_inv!36832 (array!99032) Bool)

(assert (=> start!125584 (array_inv!36832 a!2862)))

(declare-fun b!1469527 () Bool)

(assert (=> b!1469527 (= e!824991 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006) (bvsgt #b00000000000000000000000000000000 (size!48354 a!2862))))))

(declare-fun b!1469528 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99032 (_ BitVec 32)) SeekEntryResult!12044)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99032 (_ BitVec 32)) SeekEntryResult!12044)

(assert (=> b!1469528 (= e!824993 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642588 lt!642590 mask!2687) (seekEntryOrOpen!0 lt!642588 lt!642590 mask!2687)))))

(declare-fun b!1469529 () Bool)

(assert (=> b!1469529 (= e!824990 e!824991)))

(declare-fun res!998004 () Bool)

(assert (=> b!1469529 (=> (not res!998004) (not e!824991))))

(assert (=> b!1469529 (= res!998004 (= lt!642589 (Intermediate!12044 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469529 (= lt!642589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642588 mask!2687) lt!642588 lt!642590 mask!2687))))

(assert (=> b!1469529 (= lt!642588 (select (store (arr!47804 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125584 res!998002) b!1469519))

(assert (= (and b!1469519 res!997997) b!1469523))

(assert (= (and b!1469523 res!997999) b!1469518))

(assert (= (and b!1469518 res!998000) b!1469520))

(assert (= (and b!1469520 res!998003) b!1469517))

(assert (= (and b!1469517 res!998001) b!1469526))

(assert (= (and b!1469526 res!998005) b!1469516))

(assert (= (and b!1469516 res!998008) b!1469521))

(assert (= (and b!1469521 res!998007) b!1469524))

(assert (= (and b!1469524 res!997998) b!1469529))

(assert (= (and b!1469529 res!998004) b!1469522))

(assert (= (and b!1469522 c!135270) b!1469525))

(assert (= (and b!1469522 (not c!135270)) b!1469528))

(assert (= (and b!1469522 res!998006) b!1469527))

(declare-fun m!1356691 () Bool)

(assert (=> b!1469523 m!1356691))

(assert (=> b!1469523 m!1356691))

(declare-fun m!1356693 () Bool)

(assert (=> b!1469523 m!1356693))

(declare-fun m!1356695 () Bool)

(assert (=> b!1469529 m!1356695))

(assert (=> b!1469529 m!1356695))

(declare-fun m!1356697 () Bool)

(assert (=> b!1469529 m!1356697))

(declare-fun m!1356699 () Bool)

(assert (=> b!1469529 m!1356699))

(declare-fun m!1356701 () Bool)

(assert (=> b!1469529 m!1356701))

(declare-fun m!1356703 () Bool)

(assert (=> b!1469528 m!1356703))

(declare-fun m!1356705 () Bool)

(assert (=> b!1469528 m!1356705))

(declare-fun m!1356707 () Bool)

(assert (=> b!1469524 m!1356707))

(assert (=> b!1469524 m!1356707))

(declare-fun m!1356709 () Bool)

(assert (=> b!1469524 m!1356709))

(assert (=> b!1469516 m!1356699))

(declare-fun m!1356711 () Bool)

(assert (=> b!1469516 m!1356711))

(declare-fun m!1356713 () Bool)

(assert (=> start!125584 m!1356713))

(declare-fun m!1356715 () Bool)

(assert (=> start!125584 m!1356715))

(assert (=> b!1469518 m!1356707))

(assert (=> b!1469518 m!1356707))

(declare-fun m!1356717 () Bool)

(assert (=> b!1469518 m!1356717))

(declare-fun m!1356719 () Bool)

(assert (=> b!1469517 m!1356719))

(declare-fun m!1356721 () Bool)

(assert (=> b!1469525 m!1356721))

(declare-fun m!1356723 () Bool)

(assert (=> b!1469520 m!1356723))

(assert (=> b!1469521 m!1356707))

(assert (=> b!1469521 m!1356707))

(declare-fun m!1356725 () Bool)

(assert (=> b!1469521 m!1356725))

(assert (=> b!1469521 m!1356725))

(assert (=> b!1469521 m!1356707))

(declare-fun m!1356727 () Bool)

(assert (=> b!1469521 m!1356727))

(push 1)

