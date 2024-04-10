; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126514 () Bool)

(assert start!126514)

(declare-fun b!1483981 () Bool)

(declare-fun res!1008805 () Bool)

(declare-fun e!832065 () Bool)

(assert (=> b!1483981 (=> (not res!1008805) (not e!832065))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99476 0))(
  ( (array!99477 (arr!48014 (Array (_ BitVec 32) (_ BitVec 64))) (size!48564 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99476)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1483981 (= res!1008805 (or (= (select (arr!48014 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48014 a!2862) intermediateBeforeIndex!19) (select (arr!48014 a!2862) j!93))))))

(declare-fun b!1483982 () Bool)

(declare-fun res!1008802 () Bool)

(declare-fun e!832061 () Bool)

(assert (=> b!1483982 (=> (not res!1008802) (not e!832061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483982 (= res!1008802 (validKeyInArray!0 (select (arr!48014 a!2862) j!93)))))

(declare-fun b!1483983 () Bool)

(declare-fun res!1008806 () Bool)

(assert (=> b!1483983 (=> (not res!1008806) (not e!832061))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483983 (= res!1008806 (validKeyInArray!0 (select (arr!48014 a!2862) i!1006)))))

(declare-fun b!1483984 () Bool)

(declare-fun e!832063 () Bool)

(assert (=> b!1483984 (= e!832065 e!832063)))

(declare-fun res!1008803 () Bool)

(assert (=> b!1483984 (=> res!1008803 e!832063)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!647607 () (_ BitVec 64))

(assert (=> b!1483984 (= res!1008803 (or (and (= (select (arr!48014 a!2862) index!646) lt!647607) (= (select (arr!48014 a!2862) index!646) (select (arr!48014 a!2862) j!93))) (= (select (arr!48014 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483984 (= lt!647607 (select (store (arr!48014 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483985 () Bool)

(declare-fun res!1008820 () Bool)

(assert (=> b!1483985 (=> (not res!1008820) (not e!832061))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483985 (= res!1008820 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48564 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48564 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48564 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483987 () Bool)

(declare-fun e!832064 () Bool)

(assert (=> b!1483987 (= e!832064 true)))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!647613 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483987 (= lt!647613 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483988 () Bool)

(declare-fun res!1008810 () Bool)

(declare-fun e!832060 () Bool)

(assert (=> b!1483988 (=> (not res!1008810) (not e!832060))))

(assert (=> b!1483988 (= res!1008810 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483989 () Bool)

(declare-fun e!832059 () Bool)

(assert (=> b!1483989 (= e!832061 e!832059)))

(declare-fun res!1008804 () Bool)

(assert (=> b!1483989 (=> (not res!1008804) (not e!832059))))

(assert (=> b!1483989 (= res!1008804 (= (select (store (arr!48014 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647610 () array!99476)

(assert (=> b!1483989 (= lt!647610 (array!99477 (store (arr!48014 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48564 a!2862)))))

(declare-fun e!832066 () Bool)

(declare-fun lt!647612 () (_ BitVec 64))

(declare-fun b!1483990 () Bool)

(declare-datatypes ((SeekEntryResult!12254 0))(
  ( (MissingZero!12254 (index!51408 (_ BitVec 32))) (Found!12254 (index!51409 (_ BitVec 32))) (Intermediate!12254 (undefined!13066 Bool) (index!51410 (_ BitVec 32)) (x!132994 (_ BitVec 32))) (Undefined!12254) (MissingVacant!12254 (index!51411 (_ BitVec 32))) )
))
(declare-fun lt!647609 () SeekEntryResult!12254)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99476 (_ BitVec 32)) SeekEntryResult!12254)

(assert (=> b!1483990 (= e!832066 (= lt!647609 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647612 lt!647610 mask!2687)))))

(declare-fun b!1483991 () Bool)

(declare-fun res!1008811 () Bool)

(assert (=> b!1483991 (=> (not res!1008811) (not e!832060))))

(assert (=> b!1483991 (= res!1008811 e!832066)))

(declare-fun c!137112 () Bool)

(assert (=> b!1483991 (= c!137112 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483992 () Bool)

(declare-fun e!832058 () Bool)

(assert (=> b!1483992 (= e!832059 e!832058)))

(declare-fun res!1008815 () Bool)

(assert (=> b!1483992 (=> (not res!1008815) (not e!832058))))

(declare-fun lt!647608 () SeekEntryResult!12254)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483992 (= res!1008815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48014 a!2862) j!93) mask!2687) (select (arr!48014 a!2862) j!93) a!2862 mask!2687) lt!647608))))

(assert (=> b!1483992 (= lt!647608 (Intermediate!12254 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483993 () Bool)

(declare-fun res!1008809 () Bool)

(assert (=> b!1483993 (=> (not res!1008809) (not e!832058))))

(assert (=> b!1483993 (= res!1008809 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48014 a!2862) j!93) a!2862 mask!2687) lt!647608))))

(declare-fun b!1483986 () Bool)

(declare-fun res!1008819 () Bool)

(assert (=> b!1483986 (=> (not res!1008819) (not e!832065))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99476 (_ BitVec 32)) SeekEntryResult!12254)

(assert (=> b!1483986 (= res!1008819 (= (seekEntryOrOpen!0 (select (arr!48014 a!2862) j!93) a!2862 mask!2687) (Found!12254 j!93)))))

(declare-fun res!1008813 () Bool)

(assert (=> start!126514 (=> (not res!1008813) (not e!832061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126514 (= res!1008813 (validMask!0 mask!2687))))

(assert (=> start!126514 e!832061))

(assert (=> start!126514 true))

(declare-fun array_inv!37042 (array!99476) Bool)

(assert (=> start!126514 (array_inv!37042 a!2862)))

(declare-fun b!1483994 () Bool)

(declare-fun res!1008812 () Bool)

(assert (=> b!1483994 (=> (not res!1008812) (not e!832061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99476 (_ BitVec 32)) Bool)

(assert (=> b!1483994 (= res!1008812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483995 () Bool)

(declare-fun e!832067 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99476 (_ BitVec 32)) SeekEntryResult!12254)

(assert (=> b!1483995 (= e!832067 (= (seekEntryOrOpen!0 lt!647612 lt!647610 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647612 lt!647610 mask!2687)))))

(declare-fun b!1483996 () Bool)

(declare-fun res!1008818 () Bool)

(assert (=> b!1483996 (=> (not res!1008818) (not e!832061))))

(assert (=> b!1483996 (= res!1008818 (and (= (size!48564 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48564 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48564 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483997 () Bool)

(assert (=> b!1483997 (= e!832066 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647612 lt!647610 mask!2687) (seekEntryOrOpen!0 lt!647612 lt!647610 mask!2687)))))

(declare-fun b!1483998 () Bool)

(declare-fun res!1008808 () Bool)

(assert (=> b!1483998 (=> (not res!1008808) (not e!832061))))

(declare-datatypes ((List!34515 0))(
  ( (Nil!34512) (Cons!34511 (h!35885 (_ BitVec 64)) (t!49209 List!34515)) )
))
(declare-fun arrayNoDuplicates!0 (array!99476 (_ BitVec 32) List!34515) Bool)

(assert (=> b!1483998 (= res!1008808 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34512))))

(declare-fun b!1483999 () Bool)

(assert (=> b!1483999 (= e!832058 e!832060)))

(declare-fun res!1008807 () Bool)

(assert (=> b!1483999 (=> (not res!1008807) (not e!832060))))

(assert (=> b!1483999 (= res!1008807 (= lt!647609 (Intermediate!12254 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483999 (= lt!647609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647612 mask!2687) lt!647612 lt!647610 mask!2687))))

(assert (=> b!1483999 (= lt!647612 (select (store (arr!48014 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484000 () Bool)

(assert (=> b!1484000 (= e!832063 e!832067)))

(declare-fun res!1008816 () Bool)

(assert (=> b!1484000 (=> (not res!1008816) (not e!832067))))

(assert (=> b!1484000 (= res!1008816 (and (= index!646 intermediateAfterIndex!19) (= lt!647607 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484001 () Bool)

(assert (=> b!1484001 (= e!832060 (not e!832064))))

(declare-fun res!1008817 () Bool)

(assert (=> b!1484001 (=> res!1008817 e!832064)))

(assert (=> b!1484001 (= res!1008817 (or (and (= (select (arr!48014 a!2862) index!646) (select (store (arr!48014 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48014 a!2862) index!646) (select (arr!48014 a!2862) j!93))) (= (select (arr!48014 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484001 e!832065))

(declare-fun res!1008814 () Bool)

(assert (=> b!1484001 (=> (not res!1008814) (not e!832065))))

(assert (=> b!1484001 (= res!1008814 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49848 0))(
  ( (Unit!49849) )
))
(declare-fun lt!647611 () Unit!49848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99476 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49848)

(assert (=> b!1484001 (= lt!647611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126514 res!1008813) b!1483996))

(assert (= (and b!1483996 res!1008818) b!1483983))

(assert (= (and b!1483983 res!1008806) b!1483982))

(assert (= (and b!1483982 res!1008802) b!1483994))

(assert (= (and b!1483994 res!1008812) b!1483998))

(assert (= (and b!1483998 res!1008808) b!1483985))

(assert (= (and b!1483985 res!1008820) b!1483989))

(assert (= (and b!1483989 res!1008804) b!1483992))

(assert (= (and b!1483992 res!1008815) b!1483993))

(assert (= (and b!1483993 res!1008809) b!1483999))

(assert (= (and b!1483999 res!1008807) b!1483991))

(assert (= (and b!1483991 c!137112) b!1483990))

(assert (= (and b!1483991 (not c!137112)) b!1483997))

(assert (= (and b!1483991 res!1008811) b!1483988))

(assert (= (and b!1483988 res!1008810) b!1484001))

(assert (= (and b!1484001 res!1008814) b!1483986))

(assert (= (and b!1483986 res!1008819) b!1483981))

(assert (= (and b!1483981 res!1008805) b!1483984))

(assert (= (and b!1483984 (not res!1008803)) b!1484000))

(assert (= (and b!1484000 res!1008816) b!1483995))

(assert (= (and b!1484001 (not res!1008817)) b!1483987))

(declare-fun m!1369369 () Bool)

(assert (=> b!1483986 m!1369369))

(assert (=> b!1483986 m!1369369))

(declare-fun m!1369371 () Bool)

(assert (=> b!1483986 m!1369371))

(declare-fun m!1369373 () Bool)

(assert (=> b!1483981 m!1369373))

(assert (=> b!1483981 m!1369369))

(declare-fun m!1369375 () Bool)

(assert (=> b!1483987 m!1369375))

(assert (=> b!1483982 m!1369369))

(assert (=> b!1483982 m!1369369))

(declare-fun m!1369377 () Bool)

(assert (=> b!1483982 m!1369377))

(declare-fun m!1369379 () Bool)

(assert (=> start!126514 m!1369379))

(declare-fun m!1369381 () Bool)

(assert (=> start!126514 m!1369381))

(declare-fun m!1369383 () Bool)

(assert (=> b!1483998 m!1369383))

(declare-fun m!1369385 () Bool)

(assert (=> b!1483989 m!1369385))

(declare-fun m!1369387 () Bool)

(assert (=> b!1483989 m!1369387))

(declare-fun m!1369389 () Bool)

(assert (=> b!1483983 m!1369389))

(assert (=> b!1483983 m!1369389))

(declare-fun m!1369391 () Bool)

(assert (=> b!1483983 m!1369391))

(assert (=> b!1483993 m!1369369))

(assert (=> b!1483993 m!1369369))

(declare-fun m!1369393 () Bool)

(assert (=> b!1483993 m!1369393))

(declare-fun m!1369395 () Bool)

(assert (=> b!1484001 m!1369395))

(assert (=> b!1484001 m!1369385))

(declare-fun m!1369397 () Bool)

(assert (=> b!1484001 m!1369397))

(declare-fun m!1369399 () Bool)

(assert (=> b!1484001 m!1369399))

(declare-fun m!1369401 () Bool)

(assert (=> b!1484001 m!1369401))

(assert (=> b!1484001 m!1369369))

(declare-fun m!1369403 () Bool)

(assert (=> b!1483990 m!1369403))

(assert (=> b!1483984 m!1369399))

(assert (=> b!1483984 m!1369369))

(assert (=> b!1483984 m!1369385))

(assert (=> b!1483984 m!1369397))

(declare-fun m!1369405 () Bool)

(assert (=> b!1483997 m!1369405))

(declare-fun m!1369407 () Bool)

(assert (=> b!1483997 m!1369407))

(assert (=> b!1483995 m!1369407))

(assert (=> b!1483995 m!1369405))

(assert (=> b!1483992 m!1369369))

(assert (=> b!1483992 m!1369369))

(declare-fun m!1369409 () Bool)

(assert (=> b!1483992 m!1369409))

(assert (=> b!1483992 m!1369409))

(assert (=> b!1483992 m!1369369))

(declare-fun m!1369411 () Bool)

(assert (=> b!1483992 m!1369411))

(declare-fun m!1369413 () Bool)

(assert (=> b!1483999 m!1369413))

(assert (=> b!1483999 m!1369413))

(declare-fun m!1369415 () Bool)

(assert (=> b!1483999 m!1369415))

(assert (=> b!1483999 m!1369385))

(declare-fun m!1369417 () Bool)

(assert (=> b!1483999 m!1369417))

(declare-fun m!1369419 () Bool)

(assert (=> b!1483994 m!1369419))

(push 1)

