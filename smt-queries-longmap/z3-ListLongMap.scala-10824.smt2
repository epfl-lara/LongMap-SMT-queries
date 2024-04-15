; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126608 () Bool)

(assert start!126608)

(declare-fun b!1486450 () Bool)

(declare-fun res!1011004 () Bool)

(declare-fun e!833226 () Bool)

(assert (=> b!1486450 (=> (not res!1011004) (not e!833226))))

(declare-datatypes ((array!99505 0))(
  ( (array!99506 (arr!48028 (Array (_ BitVec 32) (_ BitVec 64))) (size!48580 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99505)

(declare-datatypes ((List!34607 0))(
  ( (Nil!34604) (Cons!34603 (h!35980 (_ BitVec 64)) (t!49293 List!34607)) )
))
(declare-fun arrayNoDuplicates!0 (array!99505 (_ BitVec 32) List!34607) Bool)

(assert (=> b!1486450 (= res!1011004 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34604))))

(declare-fun e!833234 () Bool)

(declare-fun lt!648293 () array!99505)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1486451 () Bool)

(declare-datatypes ((SeekEntryResult!12293 0))(
  ( (MissingZero!12293 (index!51564 (_ BitVec 32))) (Found!12293 (index!51565 (_ BitVec 32))) (Intermediate!12293 (undefined!13105 Bool) (index!51566 (_ BitVec 32)) (x!133142 (_ BitVec 32))) (Undefined!12293) (MissingVacant!12293 (index!51567 (_ BitVec 32))) )
))
(declare-fun lt!648294 () SeekEntryResult!12293)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!648290 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99505 (_ BitVec 32)) SeekEntryResult!12293)

(assert (=> b!1486451 (= e!833234 (= lt!648294 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648290 lt!648293 mask!2687)))))

(declare-fun b!1486452 () Bool)

(declare-fun e!833233 () Bool)

(declare-fun e!833225 () Bool)

(assert (=> b!1486452 (= e!833233 e!833225)))

(declare-fun res!1011001 () Bool)

(assert (=> b!1486452 (=> (not res!1011001) (not e!833225))))

(declare-fun lt!648291 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1486452 (= res!1011001 (and (= index!646 intermediateAfterIndex!19) (= lt!648291 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486453 () Bool)

(declare-fun e!833230 () Bool)

(declare-fun e!833231 () Bool)

(assert (=> b!1486453 (= e!833230 e!833231)))

(declare-fun res!1011000 () Bool)

(assert (=> b!1486453 (=> (not res!1011000) (not e!833231))))

(declare-fun lt!648296 () SeekEntryResult!12293)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486453 (= res!1011000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48028 a!2862) j!93) mask!2687) (select (arr!48028 a!2862) j!93) a!2862 mask!2687) lt!648296))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486453 (= lt!648296 (Intermediate!12293 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1010996 () Bool)

(assert (=> start!126608 (=> (not res!1010996) (not e!833226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126608 (= res!1010996 (validMask!0 mask!2687))))

(assert (=> start!126608 e!833226))

(assert (=> start!126608 true))

(declare-fun array_inv!37261 (array!99505) Bool)

(assert (=> start!126608 (array_inv!37261 a!2862)))

(declare-fun b!1486454 () Bool)

(declare-fun e!833227 () Bool)

(assert (=> b!1486454 (= e!833231 e!833227)))

(declare-fun res!1011003 () Bool)

(assert (=> b!1486454 (=> (not res!1011003) (not e!833227))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486454 (= res!1011003 (= lt!648294 (Intermediate!12293 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486454 (= lt!648294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648290 mask!2687) lt!648290 lt!648293 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486454 (= lt!648290 (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486455 () Bool)

(declare-fun e!833228 () Bool)

(assert (=> b!1486455 (= e!833227 (not e!833228))))

(declare-fun res!1010995 () Bool)

(assert (=> b!1486455 (=> res!1010995 e!833228)))

(assert (=> b!1486455 (= res!1010995 (or (and (= (select (arr!48028 a!2862) index!646) (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48028 a!2862) index!646) (select (arr!48028 a!2862) j!93))) (= (select (arr!48028 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!833229 () Bool)

(assert (=> b!1486455 e!833229))

(declare-fun res!1010990 () Bool)

(assert (=> b!1486455 (=> (not res!1010990) (not e!833229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99505 (_ BitVec 32)) Bool)

(assert (=> b!1486455 (= res!1010990 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49767 0))(
  ( (Unit!49768) )
))
(declare-fun lt!648295 () Unit!49767)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49767)

(assert (=> b!1486455 (= lt!648295 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486456 () Bool)

(declare-fun res!1010994 () Bool)

(assert (=> b!1486456 (=> (not res!1010994) (not e!833226))))

(assert (=> b!1486456 (= res!1010994 (and (= (size!48580 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48580 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48580 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486457 () Bool)

(declare-fun res!1010997 () Bool)

(assert (=> b!1486457 (=> (not res!1010997) (not e!833227))))

(assert (=> b!1486457 (= res!1010997 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486458 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99505 (_ BitVec 32)) SeekEntryResult!12293)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99505 (_ BitVec 32)) SeekEntryResult!12293)

(assert (=> b!1486458 (= e!833234 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648290 lt!648293 mask!2687) (seekEntryOrOpen!0 lt!648290 lt!648293 mask!2687)))))

(declare-fun b!1486459 () Bool)

(declare-fun res!1010991 () Bool)

(assert (=> b!1486459 (=> (not res!1010991) (not e!833226))))

(assert (=> b!1486459 (= res!1010991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486460 () Bool)

(declare-fun res!1010998 () Bool)

(assert (=> b!1486460 (=> (not res!1010998) (not e!833231))))

(assert (=> b!1486460 (= res!1010998 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48028 a!2862) j!93) a!2862 mask!2687) lt!648296))))

(declare-fun b!1486461 () Bool)

(declare-fun res!1011002 () Bool)

(assert (=> b!1486461 (=> (not res!1011002) (not e!833226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486461 (= res!1011002 (validKeyInArray!0 (select (arr!48028 a!2862) i!1006)))))

(declare-fun b!1486462 () Bool)

(assert (=> b!1486462 (= e!833229 e!833233)))

(declare-fun res!1010992 () Bool)

(assert (=> b!1486462 (=> res!1010992 e!833233)))

(assert (=> b!1486462 (= res!1010992 (or (and (= (select (arr!48028 a!2862) index!646) lt!648291) (= (select (arr!48028 a!2862) index!646) (select (arr!48028 a!2862) j!93))) (= (select (arr!48028 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486462 (= lt!648291 (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486463 () Bool)

(declare-fun res!1010993 () Bool)

(assert (=> b!1486463 (=> (not res!1010993) (not e!833229))))

(assert (=> b!1486463 (= res!1010993 (= (seekEntryOrOpen!0 (select (arr!48028 a!2862) j!93) a!2862 mask!2687) (Found!12293 j!93)))))

(declare-fun b!1486464 () Bool)

(declare-fun res!1011007 () Bool)

(assert (=> b!1486464 (=> (not res!1011007) (not e!833226))))

(assert (=> b!1486464 (= res!1011007 (validKeyInArray!0 (select (arr!48028 a!2862) j!93)))))

(declare-fun b!1486465 () Bool)

(assert (=> b!1486465 (= e!833225 (= (seekEntryOrOpen!0 lt!648290 lt!648293 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648290 lt!648293 mask!2687)))))

(declare-fun b!1486466 () Bool)

(assert (=> b!1486466 (= e!833228 true)))

(declare-fun lt!648292 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486466 (= lt!648292 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486467 () Bool)

(declare-fun res!1011006 () Bool)

(assert (=> b!1486467 (=> (not res!1011006) (not e!833227))))

(assert (=> b!1486467 (= res!1011006 e!833234)))

(declare-fun c!137257 () Bool)

(assert (=> b!1486467 (= c!137257 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486468 () Bool)

(declare-fun res!1011005 () Bool)

(assert (=> b!1486468 (=> (not res!1011005) (not e!833229))))

(assert (=> b!1486468 (= res!1011005 (or (= (select (arr!48028 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48028 a!2862) intermediateBeforeIndex!19) (select (arr!48028 a!2862) j!93))))))

(declare-fun b!1486469 () Bool)

(assert (=> b!1486469 (= e!833226 e!833230)))

(declare-fun res!1010989 () Bool)

(assert (=> b!1486469 (=> (not res!1010989) (not e!833230))))

(assert (=> b!1486469 (= res!1010989 (= (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486469 (= lt!648293 (array!99506 (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48580 a!2862)))))

(declare-fun b!1486470 () Bool)

(declare-fun res!1010999 () Bool)

(assert (=> b!1486470 (=> (not res!1010999) (not e!833226))))

(assert (=> b!1486470 (= res!1010999 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48580 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48580 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48580 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126608 res!1010996) b!1486456))

(assert (= (and b!1486456 res!1010994) b!1486461))

(assert (= (and b!1486461 res!1011002) b!1486464))

(assert (= (and b!1486464 res!1011007) b!1486459))

(assert (= (and b!1486459 res!1010991) b!1486450))

(assert (= (and b!1486450 res!1011004) b!1486470))

(assert (= (and b!1486470 res!1010999) b!1486469))

(assert (= (and b!1486469 res!1010989) b!1486453))

(assert (= (and b!1486453 res!1011000) b!1486460))

(assert (= (and b!1486460 res!1010998) b!1486454))

(assert (= (and b!1486454 res!1011003) b!1486467))

(assert (= (and b!1486467 c!137257) b!1486451))

(assert (= (and b!1486467 (not c!137257)) b!1486458))

(assert (= (and b!1486467 res!1011006) b!1486457))

(assert (= (and b!1486457 res!1010997) b!1486455))

(assert (= (and b!1486455 res!1010990) b!1486463))

(assert (= (and b!1486463 res!1010993) b!1486468))

(assert (= (and b!1486468 res!1011005) b!1486462))

(assert (= (and b!1486462 (not res!1010992)) b!1486452))

(assert (= (and b!1486452 res!1011001) b!1486465))

(assert (= (and b!1486455 (not res!1010995)) b!1486466))

(declare-fun m!1370727 () Bool)

(assert (=> b!1486463 m!1370727))

(assert (=> b!1486463 m!1370727))

(declare-fun m!1370729 () Bool)

(assert (=> b!1486463 m!1370729))

(declare-fun m!1370731 () Bool)

(assert (=> b!1486468 m!1370731))

(assert (=> b!1486468 m!1370727))

(declare-fun m!1370733 () Bool)

(assert (=> b!1486455 m!1370733))

(declare-fun m!1370735 () Bool)

(assert (=> b!1486455 m!1370735))

(declare-fun m!1370737 () Bool)

(assert (=> b!1486455 m!1370737))

(declare-fun m!1370739 () Bool)

(assert (=> b!1486455 m!1370739))

(declare-fun m!1370741 () Bool)

(assert (=> b!1486455 m!1370741))

(assert (=> b!1486455 m!1370727))

(declare-fun m!1370743 () Bool)

(assert (=> b!1486451 m!1370743))

(assert (=> b!1486453 m!1370727))

(assert (=> b!1486453 m!1370727))

(declare-fun m!1370745 () Bool)

(assert (=> b!1486453 m!1370745))

(assert (=> b!1486453 m!1370745))

(assert (=> b!1486453 m!1370727))

(declare-fun m!1370747 () Bool)

(assert (=> b!1486453 m!1370747))

(assert (=> b!1486464 m!1370727))

(assert (=> b!1486464 m!1370727))

(declare-fun m!1370749 () Bool)

(assert (=> b!1486464 m!1370749))

(assert (=> b!1486462 m!1370739))

(assert (=> b!1486462 m!1370727))

(assert (=> b!1486462 m!1370735))

(assert (=> b!1486462 m!1370737))

(declare-fun m!1370751 () Bool)

(assert (=> b!1486458 m!1370751))

(declare-fun m!1370753 () Bool)

(assert (=> b!1486458 m!1370753))

(declare-fun m!1370755 () Bool)

(assert (=> b!1486459 m!1370755))

(assert (=> b!1486469 m!1370735))

(declare-fun m!1370757 () Bool)

(assert (=> b!1486469 m!1370757))

(declare-fun m!1370759 () Bool)

(assert (=> b!1486450 m!1370759))

(assert (=> b!1486460 m!1370727))

(assert (=> b!1486460 m!1370727))

(declare-fun m!1370761 () Bool)

(assert (=> b!1486460 m!1370761))

(declare-fun m!1370763 () Bool)

(assert (=> b!1486454 m!1370763))

(assert (=> b!1486454 m!1370763))

(declare-fun m!1370765 () Bool)

(assert (=> b!1486454 m!1370765))

(assert (=> b!1486454 m!1370735))

(declare-fun m!1370767 () Bool)

(assert (=> b!1486454 m!1370767))

(declare-fun m!1370769 () Bool)

(assert (=> b!1486461 m!1370769))

(assert (=> b!1486461 m!1370769))

(declare-fun m!1370771 () Bool)

(assert (=> b!1486461 m!1370771))

(declare-fun m!1370773 () Bool)

(assert (=> b!1486466 m!1370773))

(assert (=> b!1486465 m!1370753))

(assert (=> b!1486465 m!1370751))

(declare-fun m!1370775 () Bool)

(assert (=> start!126608 m!1370775))

(declare-fun m!1370777 () Bool)

(assert (=> start!126608 m!1370777))

(check-sat (not b!1486450) (not b!1486453) (not b!1486455) (not b!1486465) (not b!1486458) (not b!1486460) (not b!1486463) (not start!126608) (not b!1486461) (not b!1486451) (not b!1486464) (not b!1486459) (not b!1486466) (not b!1486454))
(check-sat)
