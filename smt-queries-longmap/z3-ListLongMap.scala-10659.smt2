; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125310 () Bool)

(assert start!125310)

(declare-fun b!1458007 () Bool)

(declare-fun e!820383 () Bool)

(declare-fun e!820387 () Bool)

(assert (=> b!1458007 (= e!820383 e!820387)))

(declare-fun res!987624 () Bool)

(assert (=> b!1458007 (=> (not res!987624) (not e!820387))))

(declare-datatypes ((SeekEntryResult!11760 0))(
  ( (MissingZero!11760 (index!49432 (_ BitVec 32))) (Found!11760 (index!49433 (_ BitVec 32))) (Intermediate!11760 (undefined!12572 Bool) (index!49434 (_ BitVec 32)) (x!131233 (_ BitVec 32))) (Undefined!11760) (MissingVacant!11760 (index!49435 (_ BitVec 32))) )
))
(declare-fun lt!638883 () SeekEntryResult!11760)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1458007 (= res!987624 (= lt!638883 (Intermediate!11760 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!638882 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98653 0))(
  ( (array!98654 (arr!47611 (Array (_ BitVec 32) (_ BitVec 64))) (size!48162 (_ BitVec 32))) )
))
(declare-fun lt!638880 () array!98653)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98653 (_ BitVec 32)) SeekEntryResult!11760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458007 (= lt!638883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638882 mask!2687) lt!638882 lt!638880 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98653)

(assert (=> b!1458007 (= lt!638882 (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458008 () Bool)

(declare-fun res!987635 () Bool)

(declare-fun e!820381 () Bool)

(assert (=> b!1458008 (=> (not res!987635) (not e!820381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458008 (= res!987635 (validKeyInArray!0 (select (arr!47611 a!2862) j!93)))))

(declare-fun b!1458009 () Bool)

(declare-fun e!820388 () Bool)

(assert (=> b!1458009 (= e!820387 (not e!820388))))

(declare-fun res!987636 () Bool)

(assert (=> b!1458009 (=> res!987636 e!820388)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1458009 (= res!987636 (or (and (= (select (arr!47611 a!2862) index!646) (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47611 a!2862) index!646) (select (arr!47611 a!2862) j!93))) (= (select (arr!47611 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!820384 () Bool)

(assert (=> b!1458009 e!820384))

(declare-fun res!987623 () Bool)

(assert (=> b!1458009 (=> (not res!987623) (not e!820384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98653 (_ BitVec 32)) Bool)

(assert (=> b!1458009 (= res!987623 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49049 0))(
  ( (Unit!49050) )
))
(declare-fun lt!638881 () Unit!49049)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49049)

(assert (=> b!1458009 (= lt!638881 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458010 () Bool)

(declare-fun e!820386 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98653 (_ BitVec 32)) SeekEntryResult!11760)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98653 (_ BitVec 32)) SeekEntryResult!11760)

(assert (=> b!1458010 (= e!820386 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638882 lt!638880 mask!2687) (seekEntryOrOpen!0 lt!638882 lt!638880 mask!2687)))))

(declare-fun b!1458011 () Bool)

(declare-fun e!820385 () Bool)

(assert (=> b!1458011 (= e!820385 true)))

(declare-fun lt!638884 () Bool)

(declare-fun e!820389 () Bool)

(assert (=> b!1458011 (= lt!638884 e!820389)))

(declare-fun c!134713 () Bool)

(assert (=> b!1458011 (= c!134713 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458012 () Bool)

(declare-fun res!987621 () Bool)

(assert (=> b!1458012 (=> (not res!987621) (not e!820381))))

(assert (=> b!1458012 (= res!987621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458013 () Bool)

(declare-fun res!987625 () Bool)

(assert (=> b!1458013 (=> (not res!987625) (not e!820381))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458013 (= res!987625 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48162 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48162 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48162 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458014 () Bool)

(declare-fun e!820382 () Bool)

(assert (=> b!1458014 (= e!820381 e!820382)))

(declare-fun res!987628 () Bool)

(assert (=> b!1458014 (=> (not res!987628) (not e!820382))))

(assert (=> b!1458014 (= res!987628 (= (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458014 (= lt!638880 (array!98654 (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48162 a!2862)))))

(declare-fun b!1458015 () Bool)

(assert (=> b!1458015 (= e!820388 e!820385)))

(declare-fun res!987627 () Bool)

(assert (=> b!1458015 (=> res!987627 e!820385)))

(declare-fun lt!638887 () (_ BitVec 32))

(assert (=> b!1458015 (= res!987627 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638887 #b00000000000000000000000000000000) (bvsge lt!638887 (size!48162 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458015 (= lt!638887 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!638886 () SeekEntryResult!11760)

(assert (=> b!1458015 (= lt!638886 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638882 lt!638880 mask!2687))))

(assert (=> b!1458015 (= lt!638886 (seekEntryOrOpen!0 lt!638882 lt!638880 mask!2687))))

(declare-fun b!1458016 () Bool)

(assert (=> b!1458016 (= e!820386 (= lt!638883 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638882 lt!638880 mask!2687)))))

(declare-fun b!1458017 () Bool)

(declare-fun res!987638 () Bool)

(assert (=> b!1458017 (=> (not res!987638) (not e!820384))))

(assert (=> b!1458017 (= res!987638 (= (seekEntryOrOpen!0 (select (arr!47611 a!2862) j!93) a!2862 mask!2687) (Found!11760 j!93)))))

(declare-fun b!1458018 () Bool)

(declare-fun res!987634 () Bool)

(assert (=> b!1458018 (=> (not res!987634) (not e!820381))))

(assert (=> b!1458018 (= res!987634 (validKeyInArray!0 (select (arr!47611 a!2862) i!1006)))))

(declare-fun b!1458019 () Bool)

(declare-fun res!987631 () Bool)

(assert (=> b!1458019 (=> (not res!987631) (not e!820387))))

(assert (=> b!1458019 (= res!987631 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!987629 () Bool)

(assert (=> start!125310 (=> (not res!987629) (not e!820381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125310 (= res!987629 (validMask!0 mask!2687))))

(assert (=> start!125310 e!820381))

(assert (=> start!125310 true))

(declare-fun array_inv!36892 (array!98653) Bool)

(assert (=> start!125310 (array_inv!36892 a!2862)))

(declare-fun b!1458020 () Bool)

(declare-fun res!987632 () Bool)

(assert (=> b!1458020 (=> res!987632 e!820385)))

(declare-fun lt!638885 () SeekEntryResult!11760)

(assert (=> b!1458020 (= res!987632 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638887 (select (arr!47611 a!2862) j!93) a!2862 mask!2687) lt!638885)))))

(declare-fun b!1458021 () Bool)

(assert (=> b!1458021 (= e!820382 e!820383)))

(declare-fun res!987622 () Bool)

(assert (=> b!1458021 (=> (not res!987622) (not e!820383))))

(assert (=> b!1458021 (= res!987622 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47611 a!2862) j!93) mask!2687) (select (arr!47611 a!2862) j!93) a!2862 mask!2687) lt!638885))))

(assert (=> b!1458021 (= lt!638885 (Intermediate!11760 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458022 () Bool)

(assert (=> b!1458022 (= e!820389 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638887 intermediateAfterIndex!19 lt!638882 lt!638880 mask!2687) lt!638886)))))

(declare-fun b!1458023 () Bool)

(declare-fun res!987637 () Bool)

(assert (=> b!1458023 (=> (not res!987637) (not e!820383))))

(assert (=> b!1458023 (= res!987637 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47611 a!2862) j!93) a!2862 mask!2687) lt!638885))))

(declare-fun b!1458024 () Bool)

(declare-fun res!987630 () Bool)

(assert (=> b!1458024 (=> (not res!987630) (not e!820381))))

(assert (=> b!1458024 (= res!987630 (and (= (size!48162 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48162 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48162 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458025 () Bool)

(assert (=> b!1458025 (= e!820389 (not (= lt!638883 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638887 lt!638882 lt!638880 mask!2687))))))

(declare-fun b!1458026 () Bool)

(assert (=> b!1458026 (= e!820384 (and (or (= (select (arr!47611 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47611 a!2862) intermediateBeforeIndex!19) (select (arr!47611 a!2862) j!93))) (let ((bdg!53270 (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47611 a!2862) index!646) bdg!53270) (= (select (arr!47611 a!2862) index!646) (select (arr!47611 a!2862) j!93))) (= (select (arr!47611 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53270 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458027 () Bool)

(declare-fun res!987633 () Bool)

(assert (=> b!1458027 (=> (not res!987633) (not e!820387))))

(assert (=> b!1458027 (= res!987633 e!820386)))

(declare-fun c!134712 () Bool)

(assert (=> b!1458027 (= c!134712 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458028 () Bool)

(declare-fun res!987626 () Bool)

(assert (=> b!1458028 (=> (not res!987626) (not e!820381))))

(declare-datatypes ((List!34099 0))(
  ( (Nil!34096) (Cons!34095 (h!35456 (_ BitVec 64)) (t!48785 List!34099)) )
))
(declare-fun arrayNoDuplicates!0 (array!98653 (_ BitVec 32) List!34099) Bool)

(assert (=> b!1458028 (= res!987626 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34096))))

(assert (= (and start!125310 res!987629) b!1458024))

(assert (= (and b!1458024 res!987630) b!1458018))

(assert (= (and b!1458018 res!987634) b!1458008))

(assert (= (and b!1458008 res!987635) b!1458012))

(assert (= (and b!1458012 res!987621) b!1458028))

(assert (= (and b!1458028 res!987626) b!1458013))

(assert (= (and b!1458013 res!987625) b!1458014))

(assert (= (and b!1458014 res!987628) b!1458021))

(assert (= (and b!1458021 res!987622) b!1458023))

(assert (= (and b!1458023 res!987637) b!1458007))

(assert (= (and b!1458007 res!987624) b!1458027))

(assert (= (and b!1458027 c!134712) b!1458016))

(assert (= (and b!1458027 (not c!134712)) b!1458010))

(assert (= (and b!1458027 res!987633) b!1458019))

(assert (= (and b!1458019 res!987631) b!1458009))

(assert (= (and b!1458009 res!987623) b!1458017))

(assert (= (and b!1458017 res!987638) b!1458026))

(assert (= (and b!1458009 (not res!987636)) b!1458015))

(assert (= (and b!1458015 (not res!987627)) b!1458020))

(assert (= (and b!1458020 (not res!987632)) b!1458011))

(assert (= (and b!1458011 c!134713) b!1458025))

(assert (= (and b!1458011 (not c!134713)) b!1458022))

(declare-fun m!1346191 () Bool)

(assert (=> b!1458007 m!1346191))

(assert (=> b!1458007 m!1346191))

(declare-fun m!1346193 () Bool)

(assert (=> b!1458007 m!1346193))

(declare-fun m!1346195 () Bool)

(assert (=> b!1458007 m!1346195))

(declare-fun m!1346197 () Bool)

(assert (=> b!1458007 m!1346197))

(declare-fun m!1346199 () Bool)

(assert (=> b!1458025 m!1346199))

(declare-fun m!1346201 () Bool)

(assert (=> b!1458018 m!1346201))

(assert (=> b!1458018 m!1346201))

(declare-fun m!1346203 () Bool)

(assert (=> b!1458018 m!1346203))

(declare-fun m!1346205 () Bool)

(assert (=> start!125310 m!1346205))

(declare-fun m!1346207 () Bool)

(assert (=> start!125310 m!1346207))

(assert (=> b!1458026 m!1346195))

(declare-fun m!1346209 () Bool)

(assert (=> b!1458026 m!1346209))

(declare-fun m!1346211 () Bool)

(assert (=> b!1458026 m!1346211))

(declare-fun m!1346213 () Bool)

(assert (=> b!1458026 m!1346213))

(declare-fun m!1346215 () Bool)

(assert (=> b!1458026 m!1346215))

(declare-fun m!1346217 () Bool)

(assert (=> b!1458022 m!1346217))

(declare-fun m!1346219 () Bool)

(assert (=> b!1458012 m!1346219))

(assert (=> b!1458020 m!1346215))

(assert (=> b!1458020 m!1346215))

(declare-fun m!1346221 () Bool)

(assert (=> b!1458020 m!1346221))

(assert (=> b!1458017 m!1346215))

(assert (=> b!1458017 m!1346215))

(declare-fun m!1346223 () Bool)

(assert (=> b!1458017 m!1346223))

(declare-fun m!1346225 () Bool)

(assert (=> b!1458028 m!1346225))

(assert (=> b!1458008 m!1346215))

(assert (=> b!1458008 m!1346215))

(declare-fun m!1346227 () Bool)

(assert (=> b!1458008 m!1346227))

(declare-fun m!1346229 () Bool)

(assert (=> b!1458009 m!1346229))

(assert (=> b!1458009 m!1346195))

(assert (=> b!1458009 m!1346211))

(assert (=> b!1458009 m!1346213))

(declare-fun m!1346231 () Bool)

(assert (=> b!1458009 m!1346231))

(assert (=> b!1458009 m!1346215))

(assert (=> b!1458021 m!1346215))

(assert (=> b!1458021 m!1346215))

(declare-fun m!1346233 () Bool)

(assert (=> b!1458021 m!1346233))

(assert (=> b!1458021 m!1346233))

(assert (=> b!1458021 m!1346215))

(declare-fun m!1346235 () Bool)

(assert (=> b!1458021 m!1346235))

(assert (=> b!1458014 m!1346195))

(declare-fun m!1346237 () Bool)

(assert (=> b!1458014 m!1346237))

(declare-fun m!1346239 () Bool)

(assert (=> b!1458015 m!1346239))

(declare-fun m!1346241 () Bool)

(assert (=> b!1458015 m!1346241))

(declare-fun m!1346243 () Bool)

(assert (=> b!1458015 m!1346243))

(assert (=> b!1458010 m!1346241))

(assert (=> b!1458010 m!1346243))

(declare-fun m!1346245 () Bool)

(assert (=> b!1458016 m!1346245))

(assert (=> b!1458023 m!1346215))

(assert (=> b!1458023 m!1346215))

(declare-fun m!1346247 () Bool)

(assert (=> b!1458023 m!1346247))

(check-sat (not b!1458023) (not b!1458007) (not b!1458021) (not b!1458018) (not b!1458008) (not start!125310) (not b!1458009) (not b!1458025) (not b!1458020) (not b!1458028) (not b!1458010) (not b!1458016) (not b!1458015) (not b!1458022) (not b!1458017) (not b!1458012))
(check-sat)
