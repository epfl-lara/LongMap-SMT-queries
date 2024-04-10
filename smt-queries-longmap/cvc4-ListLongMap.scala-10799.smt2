; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126386 () Bool)

(assert start!126386)

(declare-fun b!1481669 () Bool)

(declare-fun e!830971 () Bool)

(declare-fun e!830974 () Bool)

(assert (=> b!1481669 (= e!830971 e!830974)))

(declare-fun res!1006969 () Bool)

(assert (=> b!1481669 (=> (not res!1006969) (not e!830974))))

(declare-datatypes ((SeekEntryResult!12220 0))(
  ( (MissingZero!12220 (index!51272 (_ BitVec 32))) (Found!12220 (index!51273 (_ BitVec 32))) (Intermediate!12220 (undefined!13032 Bool) (index!51274 (_ BitVec 32)) (x!132855 (_ BitVec 32))) (Undefined!12220) (MissingVacant!12220 (index!51275 (_ BitVec 32))) )
))
(declare-fun lt!646846 () SeekEntryResult!12220)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481669 (= res!1006969 (= lt!646846 (Intermediate!12220 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99405 0))(
  ( (array!99406 (arr!47980 (Array (_ BitVec 32) (_ BitVec 64))) (size!48530 (_ BitVec 32))) )
))
(declare-fun lt!646848 () array!99405)

(declare-fun lt!646844 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99405 (_ BitVec 32)) SeekEntryResult!12220)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481669 (= lt!646846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646844 mask!2687) lt!646844 lt!646848 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99405)

(assert (=> b!1481669 (= lt!646844 (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481670 () Bool)

(declare-fun res!1006981 () Bool)

(declare-fun e!830975 () Bool)

(assert (=> b!1481670 (=> (not res!1006981) (not e!830975))))

(assert (=> b!1481670 (= res!1006981 (and (= (size!48530 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48530 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48530 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481671 () Bool)

(declare-fun res!1006970 () Bool)

(assert (=> b!1481671 (=> (not res!1006970) (not e!830975))))

(declare-datatypes ((List!34481 0))(
  ( (Nil!34478) (Cons!34477 (h!35848 (_ BitVec 64)) (t!49175 List!34481)) )
))
(declare-fun arrayNoDuplicates!0 (array!99405 (_ BitVec 32) List!34481) Bool)

(assert (=> b!1481671 (= res!1006970 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34478))))

(declare-fun b!1481673 () Bool)

(declare-fun res!1006976 () Bool)

(assert (=> b!1481673 (=> (not res!1006976) (not e!830975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481673 (= res!1006976 (validKeyInArray!0 (select (arr!47980 a!2862) i!1006)))))

(declare-fun b!1481674 () Bool)

(declare-fun res!1006973 () Bool)

(assert (=> b!1481674 (=> (not res!1006973) (not e!830974))))

(declare-fun e!830973 () Bool)

(assert (=> b!1481674 (= res!1006973 e!830973)))

(declare-fun c!136872 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1481674 (= c!136872 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481675 () Bool)

(declare-fun res!1006968 () Bool)

(assert (=> b!1481675 (=> (not res!1006968) (not e!830975))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1481675 (= res!1006968 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48530 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48530 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48530 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481676 () Bool)

(declare-fun res!1006972 () Bool)

(assert (=> b!1481676 (=> (not res!1006972) (not e!830975))))

(assert (=> b!1481676 (= res!1006972 (validKeyInArray!0 (select (arr!47980 a!2862) j!93)))))

(declare-fun b!1481677 () Bool)

(assert (=> b!1481677 (= e!830973 (= lt!646846 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646844 lt!646848 mask!2687)))))

(declare-fun b!1481678 () Bool)

(assert (=> b!1481678 (= e!830974 (not true))))

(declare-fun e!830970 () Bool)

(assert (=> b!1481678 e!830970))

(declare-fun res!1006971 () Bool)

(assert (=> b!1481678 (=> (not res!1006971) (not e!830970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99405 (_ BitVec 32)) Bool)

(assert (=> b!1481678 (= res!1006971 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49780 0))(
  ( (Unit!49781) )
))
(declare-fun lt!646845 () Unit!49780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49780)

(assert (=> b!1481678 (= lt!646845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481679 () Bool)

(declare-fun res!1006980 () Bool)

(assert (=> b!1481679 (=> (not res!1006980) (not e!830971))))

(declare-fun lt!646847 () SeekEntryResult!12220)

(assert (=> b!1481679 (= res!1006980 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47980 a!2862) j!93) a!2862 mask!2687) lt!646847))))

(declare-fun b!1481680 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99405 (_ BitVec 32)) SeekEntryResult!12220)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99405 (_ BitVec 32)) SeekEntryResult!12220)

(assert (=> b!1481680 (= e!830973 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646844 lt!646848 mask!2687) (seekEntryOrOpen!0 lt!646844 lt!646848 mask!2687)))))

(declare-fun b!1481681 () Bool)

(declare-fun res!1006978 () Bool)

(assert (=> b!1481681 (=> (not res!1006978) (not e!830975))))

(assert (=> b!1481681 (= res!1006978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481672 () Bool)

(declare-fun e!830969 () Bool)

(assert (=> b!1481672 (= e!830969 e!830971)))

(declare-fun res!1006967 () Bool)

(assert (=> b!1481672 (=> (not res!1006967) (not e!830971))))

(assert (=> b!1481672 (= res!1006967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47980 a!2862) j!93) mask!2687) (select (arr!47980 a!2862) j!93) a!2862 mask!2687) lt!646847))))

(assert (=> b!1481672 (= lt!646847 (Intermediate!12220 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1006974 () Bool)

(assert (=> start!126386 (=> (not res!1006974) (not e!830975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126386 (= res!1006974 (validMask!0 mask!2687))))

(assert (=> start!126386 e!830975))

(assert (=> start!126386 true))

(declare-fun array_inv!37008 (array!99405) Bool)

(assert (=> start!126386 (array_inv!37008 a!2862)))

(declare-fun b!1481682 () Bool)

(declare-fun res!1006975 () Bool)

(assert (=> b!1481682 (=> (not res!1006975) (not e!830970))))

(assert (=> b!1481682 (= res!1006975 (= (seekEntryOrOpen!0 (select (arr!47980 a!2862) j!93) a!2862 mask!2687) (Found!12220 j!93)))))

(declare-fun b!1481683 () Bool)

(assert (=> b!1481683 (= e!830970 (and (or (= (select (arr!47980 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47980 a!2862) intermediateBeforeIndex!19) (select (arr!47980 a!2862) j!93))) (or (and (= (select (arr!47980 a!2862) index!646) (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47980 a!2862) index!646) (select (arr!47980 a!2862) j!93))) (= (select (arr!47980 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481684 () Bool)

(declare-fun res!1006977 () Bool)

(assert (=> b!1481684 (=> (not res!1006977) (not e!830974))))

(assert (=> b!1481684 (= res!1006977 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481685 () Bool)

(assert (=> b!1481685 (= e!830975 e!830969)))

(declare-fun res!1006979 () Bool)

(assert (=> b!1481685 (=> (not res!1006979) (not e!830969))))

(assert (=> b!1481685 (= res!1006979 (= (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481685 (= lt!646848 (array!99406 (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48530 a!2862)))))

(assert (= (and start!126386 res!1006974) b!1481670))

(assert (= (and b!1481670 res!1006981) b!1481673))

(assert (= (and b!1481673 res!1006976) b!1481676))

(assert (= (and b!1481676 res!1006972) b!1481681))

(assert (= (and b!1481681 res!1006978) b!1481671))

(assert (= (and b!1481671 res!1006970) b!1481675))

(assert (= (and b!1481675 res!1006968) b!1481685))

(assert (= (and b!1481685 res!1006979) b!1481672))

(assert (= (and b!1481672 res!1006967) b!1481679))

(assert (= (and b!1481679 res!1006980) b!1481669))

(assert (= (and b!1481669 res!1006969) b!1481674))

(assert (= (and b!1481674 c!136872) b!1481677))

(assert (= (and b!1481674 (not c!136872)) b!1481680))

(assert (= (and b!1481674 res!1006973) b!1481684))

(assert (= (and b!1481684 res!1006977) b!1481678))

(assert (= (and b!1481678 res!1006971) b!1481682))

(assert (= (and b!1481682 res!1006975) b!1481683))

(declare-fun m!1367405 () Bool)

(assert (=> b!1481672 m!1367405))

(assert (=> b!1481672 m!1367405))

(declare-fun m!1367407 () Bool)

(assert (=> b!1481672 m!1367407))

(assert (=> b!1481672 m!1367407))

(assert (=> b!1481672 m!1367405))

(declare-fun m!1367409 () Bool)

(assert (=> b!1481672 m!1367409))

(declare-fun m!1367411 () Bool)

(assert (=> b!1481678 m!1367411))

(declare-fun m!1367413 () Bool)

(assert (=> b!1481678 m!1367413))

(declare-fun m!1367415 () Bool)

(assert (=> b!1481673 m!1367415))

(assert (=> b!1481673 m!1367415))

(declare-fun m!1367417 () Bool)

(assert (=> b!1481673 m!1367417))

(declare-fun m!1367419 () Bool)

(assert (=> b!1481683 m!1367419))

(declare-fun m!1367421 () Bool)

(assert (=> b!1481683 m!1367421))

(declare-fun m!1367423 () Bool)

(assert (=> b!1481683 m!1367423))

(declare-fun m!1367425 () Bool)

(assert (=> b!1481683 m!1367425))

(assert (=> b!1481683 m!1367405))

(assert (=> b!1481682 m!1367405))

(assert (=> b!1481682 m!1367405))

(declare-fun m!1367427 () Bool)

(assert (=> b!1481682 m!1367427))

(declare-fun m!1367429 () Bool)

(assert (=> b!1481680 m!1367429))

(declare-fun m!1367431 () Bool)

(assert (=> b!1481680 m!1367431))

(declare-fun m!1367433 () Bool)

(assert (=> b!1481671 m!1367433))

(declare-fun m!1367435 () Bool)

(assert (=> b!1481669 m!1367435))

(assert (=> b!1481669 m!1367435))

(declare-fun m!1367437 () Bool)

(assert (=> b!1481669 m!1367437))

(assert (=> b!1481669 m!1367419))

(declare-fun m!1367439 () Bool)

(assert (=> b!1481669 m!1367439))

(declare-fun m!1367441 () Bool)

(assert (=> start!126386 m!1367441))

(declare-fun m!1367443 () Bool)

(assert (=> start!126386 m!1367443))

(assert (=> b!1481685 m!1367419))

(declare-fun m!1367445 () Bool)

(assert (=> b!1481685 m!1367445))

(declare-fun m!1367447 () Bool)

(assert (=> b!1481677 m!1367447))

(assert (=> b!1481676 m!1367405))

(assert (=> b!1481676 m!1367405))

(declare-fun m!1367449 () Bool)

(assert (=> b!1481676 m!1367449))

(assert (=> b!1481679 m!1367405))

(assert (=> b!1481679 m!1367405))

(declare-fun m!1367451 () Bool)

(assert (=> b!1481679 m!1367451))

(declare-fun m!1367453 () Bool)

(assert (=> b!1481681 m!1367453))

(push 1)

