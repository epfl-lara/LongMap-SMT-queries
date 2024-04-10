; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125676 () Bool)

(assert start!125676)

(declare-fun b!1470588 () Bool)

(declare-fun res!998711 () Bool)

(declare-fun e!825509 () Bool)

(assert (=> b!1470588 (=> (not res!998711) (not e!825509))))

(declare-datatypes ((array!99067 0))(
  ( (array!99068 (arr!47820 (Array (_ BitVec 32) (_ BitVec 64))) (size!48370 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99067)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470588 (= res!998711 (validKeyInArray!0 (select (arr!47820 a!2862) i!1006)))))

(declare-fun b!1470589 () Bool)

(declare-fun e!825511 () Bool)

(declare-fun e!825512 () Bool)

(assert (=> b!1470589 (= e!825511 e!825512)))

(declare-fun res!998702 () Bool)

(assert (=> b!1470589 (=> (not res!998702) (not e!825512))))

(declare-datatypes ((SeekEntryResult!12060 0))(
  ( (MissingZero!12060 (index!50632 (_ BitVec 32))) (Found!12060 (index!50633 (_ BitVec 32))) (Intermediate!12060 (undefined!12872 Bool) (index!50634 (_ BitVec 32)) (x!132214 (_ BitVec 32))) (Undefined!12060) (MissingVacant!12060 (index!50635 (_ BitVec 32))) )
))
(declare-fun lt!642971 () SeekEntryResult!12060)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1470589 (= res!998702 (= lt!642971 (Intermediate!12060 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!642974 () (_ BitVec 64))

(declare-fun lt!642972 () array!99067)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99067 (_ BitVec 32)) SeekEntryResult!12060)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470589 (= lt!642971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642974 mask!2687) lt!642974 lt!642972 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1470589 (= lt!642974 (select (store (arr!47820 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470590 () Bool)

(declare-fun res!998712 () Bool)

(assert (=> b!1470590 (=> (not res!998712) (not e!825512))))

(declare-fun e!825510 () Bool)

(assert (=> b!1470590 (= res!998712 e!825510)))

(declare-fun c!135456 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1470590 (= c!135456 (bvsle x!665 intermediateAfterX!19))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1470591 () Bool)

(assert (=> b!1470591 (= e!825510 (= lt!642971 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642974 lt!642972 mask!2687)))))

(declare-fun b!1470593 () Bool)

(declare-fun res!998700 () Bool)

(assert (=> b!1470593 (=> (not res!998700) (not e!825512))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470593 (= res!998700 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470594 () Bool)

(declare-fun e!825506 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99067 (_ BitVec 32)) SeekEntryResult!12060)

(assert (=> b!1470594 (= e!825506 (= (seekEntryOrOpen!0 (select (arr!47820 a!2862) j!93) a!2862 mask!2687) (Found!12060 j!93)))))

(declare-fun b!1470595 () Bool)

(declare-fun res!998703 () Bool)

(assert (=> b!1470595 (=> (not res!998703) (not e!825509))))

(declare-datatypes ((List!34321 0))(
  ( (Nil!34318) (Cons!34317 (h!35670 (_ BitVec 64)) (t!49015 List!34321)) )
))
(declare-fun arrayNoDuplicates!0 (array!99067 (_ BitVec 32) List!34321) Bool)

(assert (=> b!1470595 (= res!998703 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34318))))

(declare-fun b!1470596 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99067 (_ BitVec 32)) SeekEntryResult!12060)

(assert (=> b!1470596 (= e!825510 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642974 lt!642972 mask!2687) (seekEntryOrOpen!0 lt!642974 lt!642972 mask!2687)))))

(declare-fun b!1470597 () Bool)

(declare-fun e!825508 () Bool)

(assert (=> b!1470597 (= e!825509 e!825508)))

(declare-fun res!998706 () Bool)

(assert (=> b!1470597 (=> (not res!998706) (not e!825508))))

(assert (=> b!1470597 (= res!998706 (= (select (store (arr!47820 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470597 (= lt!642972 (array!99068 (store (arr!47820 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48370 a!2862)))))

(declare-fun b!1470598 () Bool)

(declare-fun res!998710 () Bool)

(assert (=> b!1470598 (=> (not res!998710) (not e!825509))))

(assert (=> b!1470598 (= res!998710 (and (= (size!48370 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48370 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48370 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470599 () Bool)

(assert (=> b!1470599 (= e!825508 e!825511)))

(declare-fun res!998704 () Bool)

(assert (=> b!1470599 (=> (not res!998704) (not e!825511))))

(declare-fun lt!642975 () SeekEntryResult!12060)

(assert (=> b!1470599 (= res!998704 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47820 a!2862) j!93) mask!2687) (select (arr!47820 a!2862) j!93) a!2862 mask!2687) lt!642975))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1470599 (= lt!642975 (Intermediate!12060 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470600 () Bool)

(declare-fun res!998707 () Bool)

(assert (=> b!1470600 (=> (not res!998707) (not e!825511))))

(assert (=> b!1470600 (= res!998707 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47820 a!2862) j!93) a!2862 mask!2687) lt!642975))))

(declare-fun b!1470601 () Bool)

(declare-fun res!998705 () Bool)

(assert (=> b!1470601 (=> (not res!998705) (not e!825509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99067 (_ BitVec 32)) Bool)

(assert (=> b!1470601 (= res!998705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470602 () Bool)

(declare-fun res!998701 () Bool)

(assert (=> b!1470602 (=> (not res!998701) (not e!825509))))

(assert (=> b!1470602 (= res!998701 (validKeyInArray!0 (select (arr!47820 a!2862) j!93)))))

(declare-fun b!1470603 () Bool)

(assert (=> b!1470603 (= e!825512 (not true))))

(assert (=> b!1470603 e!825506))

(declare-fun res!998713 () Bool)

(assert (=> b!1470603 (=> (not res!998713) (not e!825506))))

(assert (=> b!1470603 (= res!998713 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49460 0))(
  ( (Unit!49461) )
))
(declare-fun lt!642973 () Unit!49460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49460)

(assert (=> b!1470603 (= lt!642973 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!998708 () Bool)

(assert (=> start!125676 (=> (not res!998708) (not e!825509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125676 (= res!998708 (validMask!0 mask!2687))))

(assert (=> start!125676 e!825509))

(assert (=> start!125676 true))

(declare-fun array_inv!36848 (array!99067) Bool)

(assert (=> start!125676 (array_inv!36848 a!2862)))

(declare-fun b!1470592 () Bool)

(declare-fun res!998709 () Bool)

(assert (=> b!1470592 (=> (not res!998709) (not e!825509))))

(assert (=> b!1470592 (= res!998709 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48370 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48370 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48370 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125676 res!998708) b!1470598))

(assert (= (and b!1470598 res!998710) b!1470588))

(assert (= (and b!1470588 res!998711) b!1470602))

(assert (= (and b!1470602 res!998701) b!1470601))

(assert (= (and b!1470601 res!998705) b!1470595))

(assert (= (and b!1470595 res!998703) b!1470592))

(assert (= (and b!1470592 res!998709) b!1470597))

(assert (= (and b!1470597 res!998706) b!1470599))

(assert (= (and b!1470599 res!998704) b!1470600))

(assert (= (and b!1470600 res!998707) b!1470589))

(assert (= (and b!1470589 res!998702) b!1470590))

(assert (= (and b!1470590 c!135456) b!1470591))

(assert (= (and b!1470590 (not c!135456)) b!1470596))

(assert (= (and b!1470590 res!998712) b!1470593))

(assert (= (and b!1470593 res!998700) b!1470603))

(assert (= (and b!1470603 res!998713) b!1470594))

(declare-fun m!1357575 () Bool)

(assert (=> b!1470588 m!1357575))

(assert (=> b!1470588 m!1357575))

(declare-fun m!1357577 () Bool)

(assert (=> b!1470588 m!1357577))

(declare-fun m!1357579 () Bool)

(assert (=> b!1470589 m!1357579))

(assert (=> b!1470589 m!1357579))

(declare-fun m!1357581 () Bool)

(assert (=> b!1470589 m!1357581))

(declare-fun m!1357583 () Bool)

(assert (=> b!1470589 m!1357583))

(declare-fun m!1357585 () Bool)

(assert (=> b!1470589 m!1357585))

(assert (=> b!1470597 m!1357583))

(declare-fun m!1357587 () Bool)

(assert (=> b!1470597 m!1357587))

(declare-fun m!1357589 () Bool)

(assert (=> start!125676 m!1357589))

(declare-fun m!1357591 () Bool)

(assert (=> start!125676 m!1357591))

(declare-fun m!1357593 () Bool)

(assert (=> b!1470591 m!1357593))

(declare-fun m!1357595 () Bool)

(assert (=> b!1470595 m!1357595))

(declare-fun m!1357597 () Bool)

(assert (=> b!1470599 m!1357597))

(assert (=> b!1470599 m!1357597))

(declare-fun m!1357599 () Bool)

(assert (=> b!1470599 m!1357599))

(assert (=> b!1470599 m!1357599))

(assert (=> b!1470599 m!1357597))

(declare-fun m!1357601 () Bool)

(assert (=> b!1470599 m!1357601))

(assert (=> b!1470594 m!1357597))

(assert (=> b!1470594 m!1357597))

(declare-fun m!1357603 () Bool)

(assert (=> b!1470594 m!1357603))

(declare-fun m!1357605 () Bool)

(assert (=> b!1470596 m!1357605))

(declare-fun m!1357607 () Bool)

(assert (=> b!1470596 m!1357607))

(declare-fun m!1357609 () Bool)

(assert (=> b!1470603 m!1357609))

(declare-fun m!1357611 () Bool)

(assert (=> b!1470603 m!1357611))

(declare-fun m!1357613 () Bool)

(assert (=> b!1470601 m!1357613))

(assert (=> b!1470600 m!1357597))

(assert (=> b!1470600 m!1357597))

(declare-fun m!1357615 () Bool)

(assert (=> b!1470600 m!1357615))

(assert (=> b!1470602 m!1357597))

(assert (=> b!1470602 m!1357597))

(declare-fun m!1357617 () Bool)

(assert (=> b!1470602 m!1357617))

(check-sat (not b!1470600) (not b!1470591) (not b!1470599) (not b!1470601) (not b!1470603) (not b!1470595) (not start!125676) (not b!1470602) (not b!1470589) (not b!1470588) (not b!1470594) (not b!1470596))
(check-sat)
