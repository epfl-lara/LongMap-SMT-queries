; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126516 () Bool)

(assert start!126516)

(declare-fun b!1484045 () Bool)

(declare-fun e!832090 () Bool)

(declare-fun e!832088 () Bool)

(assert (=> b!1484045 (= e!832090 (not e!832088))))

(declare-fun res!1008876 () Bool)

(assert (=> b!1484045 (=> res!1008876 e!832088)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99478 0))(
  ( (array!99479 (arr!48015 (Array (_ BitVec 32) (_ BitVec 64))) (size!48565 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99478)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1484045 (= res!1008876 (or (and (= (select (arr!48015 a!2862) index!646) (select (store (arr!48015 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48015 a!2862) index!646) (select (arr!48015 a!2862) j!93))) (= (select (arr!48015 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832092 () Bool)

(assert (=> b!1484045 e!832092))

(declare-fun res!1008875 () Bool)

(assert (=> b!1484045 (=> (not res!1008875) (not e!832092))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99478 (_ BitVec 32)) Bool)

(assert (=> b!1484045 (= res!1008875 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49850 0))(
  ( (Unit!49851) )
))
(declare-fun lt!647634 () Unit!49850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49850)

(assert (=> b!1484045 (= lt!647634 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484046 () Bool)

(declare-fun e!832089 () Bool)

(assert (=> b!1484046 (= e!832092 e!832089)))

(declare-fun res!1008864 () Bool)

(assert (=> b!1484046 (=> res!1008864 e!832089)))

(declare-fun lt!647630 () (_ BitVec 64))

(assert (=> b!1484046 (= res!1008864 (or (and (= (select (arr!48015 a!2862) index!646) lt!647630) (= (select (arr!48015 a!2862) index!646) (select (arr!48015 a!2862) j!93))) (= (select (arr!48015 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484046 (= lt!647630 (select (store (arr!48015 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484047 () Bool)

(declare-fun lt!647632 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12255 0))(
  ( (MissingZero!12255 (index!51412 (_ BitVec 32))) (Found!12255 (index!51413 (_ BitVec 32))) (Intermediate!12255 (undefined!13067 Bool) (index!51414 (_ BitVec 32)) (x!132995 (_ BitVec 32))) (Undefined!12255) (MissingVacant!12255 (index!51415 (_ BitVec 32))) )
))
(declare-fun lt!647631 () SeekEntryResult!12255)

(declare-fun lt!647633 () array!99478)

(declare-fun e!832094 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99478 (_ BitVec 32)) SeekEntryResult!12255)

(assert (=> b!1484047 (= e!832094 (= lt!647631 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647632 lt!647633 mask!2687)))))

(declare-fun b!1484048 () Bool)

(declare-fun res!1008871 () Bool)

(declare-fun e!832095 () Bool)

(assert (=> b!1484048 (=> (not res!1008871) (not e!832095))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484048 (= res!1008871 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48565 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48565 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48565 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484049 () Bool)

(declare-fun res!1008873 () Bool)

(assert (=> b!1484049 (=> (not res!1008873) (not e!832095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484049 (= res!1008873 (validKeyInArray!0 (select (arr!48015 a!2862) i!1006)))))

(declare-fun b!1484050 () Bool)

(declare-fun e!832097 () Bool)

(assert (=> b!1484050 (= e!832095 e!832097)))

(declare-fun res!1008862 () Bool)

(assert (=> b!1484050 (=> (not res!1008862) (not e!832097))))

(assert (=> b!1484050 (= res!1008862 (= (select (store (arr!48015 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484050 (= lt!647633 (array!99479 (store (arr!48015 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48565 a!2862)))))

(declare-fun b!1484051 () Bool)

(declare-fun res!1008866 () Bool)

(assert (=> b!1484051 (=> (not res!1008866) (not e!832095))))

(assert (=> b!1484051 (= res!1008866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484044 () Bool)

(assert (=> b!1484044 (= e!832088 true)))

(declare-fun lt!647629 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484044 (= lt!647629 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1008861 () Bool)

(assert (=> start!126516 (=> (not res!1008861) (not e!832095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126516 (= res!1008861 (validMask!0 mask!2687))))

(assert (=> start!126516 e!832095))

(assert (=> start!126516 true))

(declare-fun array_inv!37043 (array!99478) Bool)

(assert (=> start!126516 (array_inv!37043 a!2862)))

(declare-fun b!1484052 () Bool)

(declare-fun res!1008863 () Bool)

(assert (=> b!1484052 (=> (not res!1008863) (not e!832090))))

(assert (=> b!1484052 (= res!1008863 e!832094)))

(declare-fun c!137115 () Bool)

(assert (=> b!1484052 (= c!137115 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484053 () Bool)

(declare-fun res!1008874 () Bool)

(declare-fun e!832096 () Bool)

(assert (=> b!1484053 (=> (not res!1008874) (not e!832096))))

(declare-fun lt!647628 () SeekEntryResult!12255)

(assert (=> b!1484053 (= res!1008874 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48015 a!2862) j!93) a!2862 mask!2687) lt!647628))))

(declare-fun b!1484054 () Bool)

(declare-fun res!1008868 () Bool)

(assert (=> b!1484054 (=> (not res!1008868) (not e!832092))))

(assert (=> b!1484054 (= res!1008868 (or (= (select (arr!48015 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48015 a!2862) intermediateBeforeIndex!19) (select (arr!48015 a!2862) j!93))))))

(declare-fun b!1484055 () Bool)

(declare-fun res!1008877 () Bool)

(assert (=> b!1484055 (=> (not res!1008877) (not e!832095))))

(assert (=> b!1484055 (= res!1008877 (and (= (size!48565 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48565 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48565 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484056 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99478 (_ BitVec 32)) SeekEntryResult!12255)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99478 (_ BitVec 32)) SeekEntryResult!12255)

(assert (=> b!1484056 (= e!832094 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647632 lt!647633 mask!2687) (seekEntryOrOpen!0 lt!647632 lt!647633 mask!2687)))))

(declare-fun b!1484057 () Bool)

(declare-fun res!1008860 () Bool)

(assert (=> b!1484057 (=> (not res!1008860) (not e!832090))))

(assert (=> b!1484057 (= res!1008860 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484058 () Bool)

(declare-fun e!832093 () Bool)

(assert (=> b!1484058 (= e!832089 e!832093)))

(declare-fun res!1008859 () Bool)

(assert (=> b!1484058 (=> (not res!1008859) (not e!832093))))

(assert (=> b!1484058 (= res!1008859 (and (= index!646 intermediateAfterIndex!19) (= lt!647630 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484059 () Bool)

(assert (=> b!1484059 (= e!832097 e!832096)))

(declare-fun res!1008870 () Bool)

(assert (=> b!1484059 (=> (not res!1008870) (not e!832096))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484059 (= res!1008870 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48015 a!2862) j!93) mask!2687) (select (arr!48015 a!2862) j!93) a!2862 mask!2687) lt!647628))))

(assert (=> b!1484059 (= lt!647628 (Intermediate!12255 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484060 () Bool)

(declare-fun res!1008872 () Bool)

(assert (=> b!1484060 (=> (not res!1008872) (not e!832095))))

(assert (=> b!1484060 (= res!1008872 (validKeyInArray!0 (select (arr!48015 a!2862) j!93)))))

(declare-fun b!1484061 () Bool)

(declare-fun res!1008867 () Bool)

(assert (=> b!1484061 (=> (not res!1008867) (not e!832092))))

(assert (=> b!1484061 (= res!1008867 (= (seekEntryOrOpen!0 (select (arr!48015 a!2862) j!93) a!2862 mask!2687) (Found!12255 j!93)))))

(declare-fun b!1484062 () Bool)

(assert (=> b!1484062 (= e!832096 e!832090)))

(declare-fun res!1008869 () Bool)

(assert (=> b!1484062 (=> (not res!1008869) (not e!832090))))

(assert (=> b!1484062 (= res!1008869 (= lt!647631 (Intermediate!12255 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484062 (= lt!647631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647632 mask!2687) lt!647632 lt!647633 mask!2687))))

(assert (=> b!1484062 (= lt!647632 (select (store (arr!48015 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484063 () Bool)

(declare-fun res!1008865 () Bool)

(assert (=> b!1484063 (=> (not res!1008865) (not e!832095))))

(declare-datatypes ((List!34516 0))(
  ( (Nil!34513) (Cons!34512 (h!35886 (_ BitVec 64)) (t!49210 List!34516)) )
))
(declare-fun arrayNoDuplicates!0 (array!99478 (_ BitVec 32) List!34516) Bool)

(assert (=> b!1484063 (= res!1008865 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34513))))

(declare-fun b!1484064 () Bool)

(assert (=> b!1484064 (= e!832093 (= (seekEntryOrOpen!0 lt!647632 lt!647633 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647632 lt!647633 mask!2687)))))

(assert (= (and start!126516 res!1008861) b!1484055))

(assert (= (and b!1484055 res!1008877) b!1484049))

(assert (= (and b!1484049 res!1008873) b!1484060))

(assert (= (and b!1484060 res!1008872) b!1484051))

(assert (= (and b!1484051 res!1008866) b!1484063))

(assert (= (and b!1484063 res!1008865) b!1484048))

(assert (= (and b!1484048 res!1008871) b!1484050))

(assert (= (and b!1484050 res!1008862) b!1484059))

(assert (= (and b!1484059 res!1008870) b!1484053))

(assert (= (and b!1484053 res!1008874) b!1484062))

(assert (= (and b!1484062 res!1008869) b!1484052))

(assert (= (and b!1484052 c!137115) b!1484047))

(assert (= (and b!1484052 (not c!137115)) b!1484056))

(assert (= (and b!1484052 res!1008863) b!1484057))

(assert (= (and b!1484057 res!1008860) b!1484045))

(assert (= (and b!1484045 res!1008875) b!1484061))

(assert (= (and b!1484061 res!1008867) b!1484054))

(assert (= (and b!1484054 res!1008868) b!1484046))

(assert (= (and b!1484046 (not res!1008864)) b!1484058))

(assert (= (and b!1484058 res!1008859) b!1484064))

(assert (= (and b!1484045 (not res!1008876)) b!1484044))

(declare-fun m!1369421 () Bool)

(assert (=> b!1484044 m!1369421))

(declare-fun m!1369423 () Bool)

(assert (=> b!1484054 m!1369423))

(declare-fun m!1369425 () Bool)

(assert (=> b!1484054 m!1369425))

(assert (=> b!1484061 m!1369425))

(assert (=> b!1484061 m!1369425))

(declare-fun m!1369427 () Bool)

(assert (=> b!1484061 m!1369427))

(declare-fun m!1369429 () Bool)

(assert (=> b!1484051 m!1369429))

(declare-fun m!1369431 () Bool)

(assert (=> b!1484050 m!1369431))

(declare-fun m!1369433 () Bool)

(assert (=> b!1484050 m!1369433))

(declare-fun m!1369435 () Bool)

(assert (=> start!126516 m!1369435))

(declare-fun m!1369437 () Bool)

(assert (=> start!126516 m!1369437))

(declare-fun m!1369439 () Bool)

(assert (=> b!1484045 m!1369439))

(assert (=> b!1484045 m!1369431))

(declare-fun m!1369441 () Bool)

(assert (=> b!1484045 m!1369441))

(declare-fun m!1369443 () Bool)

(assert (=> b!1484045 m!1369443))

(declare-fun m!1369445 () Bool)

(assert (=> b!1484045 m!1369445))

(assert (=> b!1484045 m!1369425))

(declare-fun m!1369447 () Bool)

(assert (=> b!1484056 m!1369447))

(declare-fun m!1369449 () Bool)

(assert (=> b!1484056 m!1369449))

(declare-fun m!1369451 () Bool)

(assert (=> b!1484049 m!1369451))

(assert (=> b!1484049 m!1369451))

(declare-fun m!1369453 () Bool)

(assert (=> b!1484049 m!1369453))

(assert (=> b!1484064 m!1369449))

(assert (=> b!1484064 m!1369447))

(assert (=> b!1484059 m!1369425))

(assert (=> b!1484059 m!1369425))

(declare-fun m!1369455 () Bool)

(assert (=> b!1484059 m!1369455))

(assert (=> b!1484059 m!1369455))

(assert (=> b!1484059 m!1369425))

(declare-fun m!1369457 () Bool)

(assert (=> b!1484059 m!1369457))

(assert (=> b!1484046 m!1369443))

(assert (=> b!1484046 m!1369425))

(assert (=> b!1484046 m!1369431))

(assert (=> b!1484046 m!1369441))

(assert (=> b!1484053 m!1369425))

(assert (=> b!1484053 m!1369425))

(declare-fun m!1369459 () Bool)

(assert (=> b!1484053 m!1369459))

(declare-fun m!1369461 () Bool)

(assert (=> b!1484047 m!1369461))

(declare-fun m!1369463 () Bool)

(assert (=> b!1484062 m!1369463))

(assert (=> b!1484062 m!1369463))

(declare-fun m!1369465 () Bool)

(assert (=> b!1484062 m!1369465))

(assert (=> b!1484062 m!1369431))

(declare-fun m!1369467 () Bool)

(assert (=> b!1484062 m!1369467))

(assert (=> b!1484060 m!1369425))

(assert (=> b!1484060 m!1369425))

(declare-fun m!1369469 () Bool)

(assert (=> b!1484060 m!1369469))

(declare-fun m!1369471 () Bool)

(assert (=> b!1484063 m!1369471))

(check-sat (not b!1484062) (not b!1484049) (not b!1484063) (not b!1484060) (not b!1484061) (not b!1484064) (not b!1484056) (not b!1484059) (not b!1484053) (not b!1484047) (not b!1484051) (not b!1484044) (not start!126516) (not b!1484045))
(check-sat)
