; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125918 () Bool)

(assert start!125918)

(declare-fun b!1474466 () Bool)

(declare-fun res!1001674 () Bool)

(declare-fun e!827282 () Bool)

(assert (=> b!1474466 (=> (not res!1001674) (not e!827282))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474466 (= res!1001674 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!644259 () (_ BitVec 64))

(declare-fun e!827286 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99195 0))(
  ( (array!99196 (arr!47881 (Array (_ BitVec 32) (_ BitVec 64))) (size!48431 (_ BitVec 32))) )
))
(declare-fun lt!644261 () array!99195)

(declare-fun b!1474467 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12121 0))(
  ( (MissingZero!12121 (index!50876 (_ BitVec 32))) (Found!12121 (index!50877 (_ BitVec 32))) (Intermediate!12121 (undefined!12933 Bool) (index!50878 (_ BitVec 32)) (x!132453 (_ BitVec 32))) (Undefined!12121) (MissingVacant!12121 (index!50879 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99195 (_ BitVec 32)) SeekEntryResult!12121)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99195 (_ BitVec 32)) SeekEntryResult!12121)

(assert (=> b!1474467 (= e!827286 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644259 lt!644261 mask!2687) (seekEntryOrOpen!0 lt!644259 lt!644261 mask!2687)))))

(declare-fun b!1474468 () Bool)

(declare-fun e!827288 () Bool)

(declare-fun e!827283 () Bool)

(assert (=> b!1474468 (= e!827288 e!827283)))

(declare-fun res!1001671 () Bool)

(assert (=> b!1474468 (=> (not res!1001671) (not e!827283))))

(declare-fun lt!644258 () SeekEntryResult!12121)

(declare-fun a!2862 () array!99195)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99195 (_ BitVec 32)) SeekEntryResult!12121)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474468 (= res!1001671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47881 a!2862) j!93) mask!2687) (select (arr!47881 a!2862) j!93) a!2862 mask!2687) lt!644258))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1474468 (= lt!644258 (Intermediate!12121 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474469 () Bool)

(declare-fun e!827287 () Bool)

(assert (=> b!1474469 (= e!827287 e!827288)))

(declare-fun res!1001672 () Bool)

(assert (=> b!1474469 (=> (not res!1001672) (not e!827288))))

(assert (=> b!1474469 (= res!1001672 (= (select (store (arr!47881 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474469 (= lt!644261 (array!99196 (store (arr!47881 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48431 a!2862)))))

(declare-fun b!1474470 () Bool)

(assert (=> b!1474470 (= e!827283 e!827282)))

(declare-fun res!1001673 () Bool)

(assert (=> b!1474470 (=> (not res!1001673) (not e!827282))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!644260 () SeekEntryResult!12121)

(assert (=> b!1474470 (= res!1001673 (= lt!644260 (Intermediate!12121 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1474470 (= lt!644260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644259 mask!2687) lt!644259 lt!644261 mask!2687))))

(assert (=> b!1474470 (= lt!644259 (select (store (arr!47881 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1001666 () Bool)

(assert (=> start!125918 (=> (not res!1001666) (not e!827287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125918 (= res!1001666 (validMask!0 mask!2687))))

(assert (=> start!125918 e!827287))

(assert (=> start!125918 true))

(declare-fun array_inv!36909 (array!99195) Bool)

(assert (=> start!125918 (array_inv!36909 a!2862)))

(declare-fun b!1474471 () Bool)

(declare-fun res!1001670 () Bool)

(assert (=> b!1474471 (=> (not res!1001670) (not e!827287))))

(assert (=> b!1474471 (= res!1001670 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48431 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48431 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48431 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474472 () Bool)

(declare-fun e!827285 () Bool)

(assert (=> b!1474472 (= e!827285 (or (= (select (arr!47881 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47881 a!2862) intermediateBeforeIndex!19) (select (arr!47881 a!2862) j!93))))))

(declare-fun b!1474473 () Bool)

(declare-fun res!1001675 () Bool)

(assert (=> b!1474473 (=> (not res!1001675) (not e!827287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474473 (= res!1001675 (validKeyInArray!0 (select (arr!47881 a!2862) i!1006)))))

(declare-fun b!1474474 () Bool)

(declare-fun res!1001676 () Bool)

(assert (=> b!1474474 (=> (not res!1001676) (not e!827287))))

(assert (=> b!1474474 (= res!1001676 (validKeyInArray!0 (select (arr!47881 a!2862) j!93)))))

(declare-fun b!1474475 () Bool)

(assert (=> b!1474475 (= e!827286 (= lt!644260 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644259 lt!644261 mask!2687)))))

(declare-fun b!1474476 () Bool)

(declare-fun res!1001678 () Bool)

(assert (=> b!1474476 (=> (not res!1001678) (not e!827287))))

(assert (=> b!1474476 (= res!1001678 (and (= (size!48431 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48431 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48431 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474477 () Bool)

(declare-fun res!1001667 () Bool)

(assert (=> b!1474477 (=> (not res!1001667) (not e!827287))))

(declare-datatypes ((List!34382 0))(
  ( (Nil!34379) (Cons!34378 (h!35737 (_ BitVec 64)) (t!49076 List!34382)) )
))
(declare-fun arrayNoDuplicates!0 (array!99195 (_ BitVec 32) List!34382) Bool)

(assert (=> b!1474477 (= res!1001667 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34379))))

(declare-fun b!1474478 () Bool)

(declare-fun res!1001679 () Bool)

(assert (=> b!1474478 (=> (not res!1001679) (not e!827283))))

(assert (=> b!1474478 (= res!1001679 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47881 a!2862) j!93) a!2862 mask!2687) lt!644258))))

(declare-fun b!1474479 () Bool)

(declare-fun res!1001680 () Bool)

(assert (=> b!1474479 (=> (not res!1001680) (not e!827287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99195 (_ BitVec 32)) Bool)

(assert (=> b!1474479 (= res!1001680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474480 () Bool)

(declare-fun res!1001669 () Bool)

(assert (=> b!1474480 (=> (not res!1001669) (not e!827285))))

(assert (=> b!1474480 (= res!1001669 (= (seekEntryOrOpen!0 (select (arr!47881 a!2862) j!93) a!2862 mask!2687) (Found!12121 j!93)))))

(declare-fun b!1474481 () Bool)

(declare-fun res!1001677 () Bool)

(assert (=> b!1474481 (=> (not res!1001677) (not e!827282))))

(assert (=> b!1474481 (= res!1001677 e!827286)))

(declare-fun c!135915 () Bool)

(assert (=> b!1474481 (= c!135915 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474482 () Bool)

(assert (=> b!1474482 (= e!827282 (not true))))

(assert (=> b!1474482 e!827285))

(declare-fun res!1001668 () Bool)

(assert (=> b!1474482 (=> (not res!1001668) (not e!827285))))

(assert (=> b!1474482 (= res!1001668 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49582 0))(
  ( (Unit!49583) )
))
(declare-fun lt!644262 () Unit!49582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49582)

(assert (=> b!1474482 (= lt!644262 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125918 res!1001666) b!1474476))

(assert (= (and b!1474476 res!1001678) b!1474473))

(assert (= (and b!1474473 res!1001675) b!1474474))

(assert (= (and b!1474474 res!1001676) b!1474479))

(assert (= (and b!1474479 res!1001680) b!1474477))

(assert (= (and b!1474477 res!1001667) b!1474471))

(assert (= (and b!1474471 res!1001670) b!1474469))

(assert (= (and b!1474469 res!1001672) b!1474468))

(assert (= (and b!1474468 res!1001671) b!1474478))

(assert (= (and b!1474478 res!1001679) b!1474470))

(assert (= (and b!1474470 res!1001673) b!1474481))

(assert (= (and b!1474481 c!135915) b!1474475))

(assert (= (and b!1474481 (not c!135915)) b!1474467))

(assert (= (and b!1474481 res!1001677) b!1474466))

(assert (= (and b!1474466 res!1001674) b!1474482))

(assert (= (and b!1474482 res!1001668) b!1474480))

(assert (= (and b!1474480 res!1001669) b!1474472))

(declare-fun m!1360911 () Bool)

(assert (=> b!1474478 m!1360911))

(assert (=> b!1474478 m!1360911))

(declare-fun m!1360913 () Bool)

(assert (=> b!1474478 m!1360913))

(declare-fun m!1360915 () Bool)

(assert (=> b!1474473 m!1360915))

(assert (=> b!1474473 m!1360915))

(declare-fun m!1360917 () Bool)

(assert (=> b!1474473 m!1360917))

(declare-fun m!1360919 () Bool)

(assert (=> b!1474477 m!1360919))

(assert (=> b!1474474 m!1360911))

(assert (=> b!1474474 m!1360911))

(declare-fun m!1360921 () Bool)

(assert (=> b!1474474 m!1360921))

(declare-fun m!1360923 () Bool)

(assert (=> b!1474472 m!1360923))

(assert (=> b!1474472 m!1360911))

(assert (=> b!1474468 m!1360911))

(assert (=> b!1474468 m!1360911))

(declare-fun m!1360925 () Bool)

(assert (=> b!1474468 m!1360925))

(assert (=> b!1474468 m!1360925))

(assert (=> b!1474468 m!1360911))

(declare-fun m!1360927 () Bool)

(assert (=> b!1474468 m!1360927))

(declare-fun m!1360929 () Bool)

(assert (=> b!1474467 m!1360929))

(declare-fun m!1360931 () Bool)

(assert (=> b!1474467 m!1360931))

(declare-fun m!1360933 () Bool)

(assert (=> b!1474470 m!1360933))

(assert (=> b!1474470 m!1360933))

(declare-fun m!1360935 () Bool)

(assert (=> b!1474470 m!1360935))

(declare-fun m!1360937 () Bool)

(assert (=> b!1474470 m!1360937))

(declare-fun m!1360939 () Bool)

(assert (=> b!1474470 m!1360939))

(assert (=> b!1474480 m!1360911))

(assert (=> b!1474480 m!1360911))

(declare-fun m!1360941 () Bool)

(assert (=> b!1474480 m!1360941))

(declare-fun m!1360943 () Bool)

(assert (=> b!1474482 m!1360943))

(declare-fun m!1360945 () Bool)

(assert (=> b!1474482 m!1360945))

(declare-fun m!1360947 () Bool)

(assert (=> start!125918 m!1360947))

(declare-fun m!1360949 () Bool)

(assert (=> start!125918 m!1360949))

(declare-fun m!1360951 () Bool)

(assert (=> b!1474475 m!1360951))

(declare-fun m!1360953 () Bool)

(assert (=> b!1474479 m!1360953))

(assert (=> b!1474469 m!1360937))

(declare-fun m!1360955 () Bool)

(assert (=> b!1474469 m!1360955))

(push 1)

