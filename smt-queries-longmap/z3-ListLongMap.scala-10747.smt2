; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125650 () Bool)

(assert start!125650)

(declare-fun b!1470489 () Bool)

(declare-fun res!998717 () Bool)

(declare-fun e!825438 () Bool)

(assert (=> b!1470489 (=> (not res!998717) (not e!825438))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470489 (= res!998717 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470490 () Bool)

(declare-fun res!998716 () Bool)

(declare-fun e!825436 () Bool)

(assert (=> b!1470490 (=> (not res!998716) (not e!825436))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99019 0))(
  ( (array!99020 (arr!47797 (Array (_ BitVec 32) (_ BitVec 64))) (size!48349 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99019)

(assert (=> b!1470490 (= res!998716 (and (= (size!48349 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48349 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48349 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470491 () Bool)

(declare-fun e!825437 () Bool)

(assert (=> b!1470491 (= e!825436 e!825437)))

(declare-fun res!998711 () Bool)

(assert (=> b!1470491 (=> (not res!998711) (not e!825437))))

(assert (=> b!1470491 (= res!998711 (= (select (store (arr!47797 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642767 () array!99019)

(assert (=> b!1470491 (= lt!642767 (array!99020 (store (arr!47797 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48349 a!2862)))))

(declare-fun lt!642770 () (_ BitVec 64))

(declare-fun b!1470492 () Bool)

(declare-fun e!825435 () Bool)

(declare-datatypes ((SeekEntryResult!12062 0))(
  ( (MissingZero!12062 (index!50640 (_ BitVec 32))) (Found!12062 (index!50641 (_ BitVec 32))) (Intermediate!12062 (undefined!12874 Bool) (index!50642 (_ BitVec 32)) (x!132219 (_ BitVec 32))) (Undefined!12062) (MissingVacant!12062 (index!50643 (_ BitVec 32))) )
))
(declare-fun lt!642771 () SeekEntryResult!12062)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99019 (_ BitVec 32)) SeekEntryResult!12062)

(assert (=> b!1470492 (= e!825435 (= lt!642771 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642770 lt!642767 mask!2687)))))

(declare-fun res!998712 () Bool)

(assert (=> start!125650 (=> (not res!998712) (not e!825436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125650 (= res!998712 (validMask!0 mask!2687))))

(assert (=> start!125650 e!825436))

(assert (=> start!125650 true))

(declare-fun array_inv!37030 (array!99019) Bool)

(assert (=> start!125650 (array_inv!37030 a!2862)))

(declare-fun b!1470493 () Bool)

(declare-fun res!998714 () Bool)

(assert (=> b!1470493 (=> (not res!998714) (not e!825436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470493 (= res!998714 (validKeyInArray!0 (select (arr!47797 a!2862) i!1006)))))

(declare-fun b!1470494 () Bool)

(declare-fun res!998709 () Bool)

(assert (=> b!1470494 (=> (not res!998709) (not e!825436))))

(declare-datatypes ((List!34376 0))(
  ( (Nil!34373) (Cons!34372 (h!35725 (_ BitVec 64)) (t!49062 List!34376)) )
))
(declare-fun arrayNoDuplicates!0 (array!99019 (_ BitVec 32) List!34376) Bool)

(assert (=> b!1470494 (= res!998709 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34373))))

(declare-fun b!1470495 () Bool)

(declare-fun e!825433 () Bool)

(assert (=> b!1470495 (= e!825433 e!825438)))

(declare-fun res!998710 () Bool)

(assert (=> b!1470495 (=> (not res!998710) (not e!825438))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1470495 (= res!998710 (= lt!642771 (Intermediate!12062 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470495 (= lt!642771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642770 mask!2687) lt!642770 lt!642767 mask!2687))))

(assert (=> b!1470495 (= lt!642770 (select (store (arr!47797 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470496 () Bool)

(assert (=> b!1470496 (= e!825437 e!825433)))

(declare-fun res!998713 () Bool)

(assert (=> b!1470496 (=> (not res!998713) (not e!825433))))

(declare-fun lt!642769 () SeekEntryResult!12062)

(assert (=> b!1470496 (= res!998713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47797 a!2862) j!93) mask!2687) (select (arr!47797 a!2862) j!93) a!2862 mask!2687) lt!642769))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1470496 (= lt!642769 (Intermediate!12062 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470497 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99019 (_ BitVec 32)) SeekEntryResult!12062)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99019 (_ BitVec 32)) SeekEntryResult!12062)

(assert (=> b!1470497 (= e!825435 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642770 lt!642767 mask!2687) (seekEntryOrOpen!0 lt!642770 lt!642767 mask!2687)))))

(declare-fun b!1470498 () Bool)

(declare-fun res!998718 () Bool)

(assert (=> b!1470498 (=> (not res!998718) (not e!825436))))

(assert (=> b!1470498 (= res!998718 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48349 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48349 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48349 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470499 () Bool)

(assert (=> b!1470499 (= e!825438 (not true))))

(declare-fun e!825432 () Bool)

(assert (=> b!1470499 e!825432))

(declare-fun res!998715 () Bool)

(assert (=> b!1470499 (=> (not res!998715) (not e!825432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99019 (_ BitVec 32)) Bool)

(assert (=> b!1470499 (= res!998715 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49305 0))(
  ( (Unit!49306) )
))
(declare-fun lt!642768 () Unit!49305)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49305)

(assert (=> b!1470499 (= lt!642768 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470500 () Bool)

(declare-fun res!998719 () Bool)

(assert (=> b!1470500 (=> (not res!998719) (not e!825438))))

(assert (=> b!1470500 (= res!998719 e!825435)))

(declare-fun c!135406 () Bool)

(assert (=> b!1470500 (= c!135406 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470501 () Bool)

(declare-fun res!998707 () Bool)

(assert (=> b!1470501 (=> (not res!998707) (not e!825436))))

(assert (=> b!1470501 (= res!998707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470502 () Bool)

(assert (=> b!1470502 (= e!825432 (= (seekEntryOrOpen!0 (select (arr!47797 a!2862) j!93) a!2862 mask!2687) (Found!12062 j!93)))))

(declare-fun b!1470503 () Bool)

(declare-fun res!998706 () Bool)

(assert (=> b!1470503 (=> (not res!998706) (not e!825433))))

(assert (=> b!1470503 (= res!998706 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47797 a!2862) j!93) a!2862 mask!2687) lt!642769))))

(declare-fun b!1470504 () Bool)

(declare-fun res!998708 () Bool)

(assert (=> b!1470504 (=> (not res!998708) (not e!825436))))

(assert (=> b!1470504 (= res!998708 (validKeyInArray!0 (select (arr!47797 a!2862) j!93)))))

(assert (= (and start!125650 res!998712) b!1470490))

(assert (= (and b!1470490 res!998716) b!1470493))

(assert (= (and b!1470493 res!998714) b!1470504))

(assert (= (and b!1470504 res!998708) b!1470501))

(assert (= (and b!1470501 res!998707) b!1470494))

(assert (= (and b!1470494 res!998709) b!1470498))

(assert (= (and b!1470498 res!998718) b!1470491))

(assert (= (and b!1470491 res!998711) b!1470496))

(assert (= (and b!1470496 res!998713) b!1470503))

(assert (= (and b!1470503 res!998706) b!1470495))

(assert (= (and b!1470495 res!998710) b!1470500))

(assert (= (and b!1470500 c!135406) b!1470492))

(assert (= (and b!1470500 (not c!135406)) b!1470497))

(assert (= (and b!1470500 res!998719) b!1470489))

(assert (= (and b!1470489 res!998717) b!1470499))

(assert (= (and b!1470499 res!998715) b!1470502))

(declare-fun m!1356987 () Bool)

(assert (=> b!1470499 m!1356987))

(declare-fun m!1356989 () Bool)

(assert (=> b!1470499 m!1356989))

(declare-fun m!1356991 () Bool)

(assert (=> b!1470502 m!1356991))

(assert (=> b!1470502 m!1356991))

(declare-fun m!1356993 () Bool)

(assert (=> b!1470502 m!1356993))

(declare-fun m!1356995 () Bool)

(assert (=> b!1470491 m!1356995))

(declare-fun m!1356997 () Bool)

(assert (=> b!1470491 m!1356997))

(declare-fun m!1356999 () Bool)

(assert (=> start!125650 m!1356999))

(declare-fun m!1357001 () Bool)

(assert (=> start!125650 m!1357001))

(declare-fun m!1357003 () Bool)

(assert (=> b!1470495 m!1357003))

(assert (=> b!1470495 m!1357003))

(declare-fun m!1357005 () Bool)

(assert (=> b!1470495 m!1357005))

(assert (=> b!1470495 m!1356995))

(declare-fun m!1357007 () Bool)

(assert (=> b!1470495 m!1357007))

(declare-fun m!1357009 () Bool)

(assert (=> b!1470497 m!1357009))

(declare-fun m!1357011 () Bool)

(assert (=> b!1470497 m!1357011))

(declare-fun m!1357013 () Bool)

(assert (=> b!1470492 m!1357013))

(declare-fun m!1357015 () Bool)

(assert (=> b!1470493 m!1357015))

(assert (=> b!1470493 m!1357015))

(declare-fun m!1357017 () Bool)

(assert (=> b!1470493 m!1357017))

(declare-fun m!1357019 () Bool)

(assert (=> b!1470501 m!1357019))

(assert (=> b!1470496 m!1356991))

(assert (=> b!1470496 m!1356991))

(declare-fun m!1357021 () Bool)

(assert (=> b!1470496 m!1357021))

(assert (=> b!1470496 m!1357021))

(assert (=> b!1470496 m!1356991))

(declare-fun m!1357023 () Bool)

(assert (=> b!1470496 m!1357023))

(assert (=> b!1470503 m!1356991))

(assert (=> b!1470503 m!1356991))

(declare-fun m!1357025 () Bool)

(assert (=> b!1470503 m!1357025))

(assert (=> b!1470504 m!1356991))

(assert (=> b!1470504 m!1356991))

(declare-fun m!1357027 () Bool)

(assert (=> b!1470504 m!1357027))

(declare-fun m!1357029 () Bool)

(assert (=> b!1470494 m!1357029))

(check-sat (not b!1470504) (not b!1470493) (not b!1470502) (not b!1470497) (not start!125650) (not b!1470492) (not b!1470496) (not b!1470495) (not b!1470499) (not b!1470494) (not b!1470501) (not b!1470503))
(check-sat)
