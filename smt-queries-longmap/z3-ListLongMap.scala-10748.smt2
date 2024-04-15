; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125656 () Bool)

(assert start!125656)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12065 0))(
  ( (MissingZero!12065 (index!50652 (_ BitVec 32))) (Found!12065 (index!50653 (_ BitVec 32))) (Intermediate!12065 (undefined!12877 Bool) (index!50654 (_ BitVec 32)) (x!132230 (_ BitVec 32))) (Undefined!12065) (MissingVacant!12065 (index!50655 (_ BitVec 32))) )
))
(declare-fun lt!642813 () SeekEntryResult!12065)

(declare-fun lt!642815 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1470633 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!825498 () Bool)

(declare-datatypes ((array!99025 0))(
  ( (array!99026 (arr!47800 (Array (_ BitVec 32) (_ BitVec 64))) (size!48352 (_ BitVec 32))) )
))
(declare-fun lt!642812 () array!99025)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99025 (_ BitVec 32)) SeekEntryResult!12065)

(assert (=> b!1470633 (= e!825498 (= lt!642813 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642815 lt!642812 mask!2687)))))

(declare-fun b!1470634 () Bool)

(declare-fun e!825499 () Bool)

(declare-fun e!825495 () Bool)

(assert (=> b!1470634 (= e!825499 e!825495)))

(declare-fun res!998840 () Bool)

(assert (=> b!1470634 (=> (not res!998840) (not e!825495))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99025)

(assert (=> b!1470634 (= res!998840 (= (select (store (arr!47800 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470634 (= lt!642812 (array!99026 (store (arr!47800 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48352 a!2862)))))

(declare-fun b!1470635 () Bool)

(declare-fun e!825501 () Bool)

(assert (=> b!1470635 (= e!825501 (not true))))

(declare-fun e!825500 () Bool)

(assert (=> b!1470635 e!825500))

(declare-fun res!998832 () Bool)

(assert (=> b!1470635 (=> (not res!998832) (not e!825500))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99025 (_ BitVec 32)) Bool)

(assert (=> b!1470635 (= res!998832 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49311 0))(
  ( (Unit!49312) )
))
(declare-fun lt!642814 () Unit!49311)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99025 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49311)

(assert (=> b!1470635 (= lt!642814 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470636 () Bool)

(declare-fun res!998836 () Bool)

(assert (=> b!1470636 (=> (not res!998836) (not e!825499))))

(assert (=> b!1470636 (= res!998836 (and (= (size!48352 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48352 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48352 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470637 () Bool)

(declare-fun e!825496 () Bool)

(assert (=> b!1470637 (= e!825496 e!825501)))

(declare-fun res!998844 () Bool)

(assert (=> b!1470637 (=> (not res!998844) (not e!825501))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1470637 (= res!998844 (= lt!642813 (Intermediate!12065 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470637 (= lt!642813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642815 mask!2687) lt!642815 lt!642812 mask!2687))))

(assert (=> b!1470637 (= lt!642815 (select (store (arr!47800 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!998845 () Bool)

(assert (=> start!125656 (=> (not res!998845) (not e!825499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125656 (= res!998845 (validMask!0 mask!2687))))

(assert (=> start!125656 e!825499))

(assert (=> start!125656 true))

(declare-fun array_inv!37033 (array!99025) Bool)

(assert (=> start!125656 (array_inv!37033 a!2862)))

(declare-fun b!1470638 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99025 (_ BitVec 32)) SeekEntryResult!12065)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99025 (_ BitVec 32)) SeekEntryResult!12065)

(assert (=> b!1470638 (= e!825498 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642815 lt!642812 mask!2687) (seekEntryOrOpen!0 lt!642815 lt!642812 mask!2687)))))

(declare-fun b!1470639 () Bool)

(declare-fun res!998843 () Bool)

(assert (=> b!1470639 (=> (not res!998843) (not e!825499))))

(assert (=> b!1470639 (= res!998843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470640 () Bool)

(declare-fun res!998842 () Bool)

(assert (=> b!1470640 (=> (not res!998842) (not e!825496))))

(declare-fun lt!642816 () SeekEntryResult!12065)

(assert (=> b!1470640 (= res!998842 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47800 a!2862) j!93) a!2862 mask!2687) lt!642816))))

(declare-fun b!1470641 () Bool)

(declare-fun res!998839 () Bool)

(assert (=> b!1470641 (=> (not res!998839) (not e!825499))))

(declare-datatypes ((List!34379 0))(
  ( (Nil!34376) (Cons!34375 (h!35728 (_ BitVec 64)) (t!49065 List!34379)) )
))
(declare-fun arrayNoDuplicates!0 (array!99025 (_ BitVec 32) List!34379) Bool)

(assert (=> b!1470641 (= res!998839 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34376))))

(declare-fun b!1470642 () Bool)

(declare-fun res!998835 () Bool)

(assert (=> b!1470642 (=> (not res!998835) (not e!825499))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470642 (= res!998835 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48352 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48352 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48352 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470643 () Bool)

(declare-fun res!998834 () Bool)

(assert (=> b!1470643 (=> (not res!998834) (not e!825501))))

(assert (=> b!1470643 (= res!998834 e!825498)))

(declare-fun c!135415 () Bool)

(assert (=> b!1470643 (= c!135415 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470644 () Bool)

(assert (=> b!1470644 (= e!825495 e!825496)))

(declare-fun res!998837 () Bool)

(assert (=> b!1470644 (=> (not res!998837) (not e!825496))))

(assert (=> b!1470644 (= res!998837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47800 a!2862) j!93) mask!2687) (select (arr!47800 a!2862) j!93) a!2862 mask!2687) lt!642816))))

(assert (=> b!1470644 (= lt!642816 (Intermediate!12065 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470645 () Bool)

(assert (=> b!1470645 (= e!825500 (= (seekEntryOrOpen!0 (select (arr!47800 a!2862) j!93) a!2862 mask!2687) (Found!12065 j!93)))))

(declare-fun b!1470646 () Bool)

(declare-fun res!998841 () Bool)

(assert (=> b!1470646 (=> (not res!998841) (not e!825499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470646 (= res!998841 (validKeyInArray!0 (select (arr!47800 a!2862) j!93)))))

(declare-fun b!1470647 () Bool)

(declare-fun res!998838 () Bool)

(assert (=> b!1470647 (=> (not res!998838) (not e!825499))))

(assert (=> b!1470647 (= res!998838 (validKeyInArray!0 (select (arr!47800 a!2862) i!1006)))))

(declare-fun b!1470648 () Bool)

(declare-fun res!998833 () Bool)

(assert (=> b!1470648 (=> (not res!998833) (not e!825501))))

(assert (=> b!1470648 (= res!998833 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125656 res!998845) b!1470636))

(assert (= (and b!1470636 res!998836) b!1470647))

(assert (= (and b!1470647 res!998838) b!1470646))

(assert (= (and b!1470646 res!998841) b!1470639))

(assert (= (and b!1470639 res!998843) b!1470641))

(assert (= (and b!1470641 res!998839) b!1470642))

(assert (= (and b!1470642 res!998835) b!1470634))

(assert (= (and b!1470634 res!998840) b!1470644))

(assert (= (and b!1470644 res!998837) b!1470640))

(assert (= (and b!1470640 res!998842) b!1470637))

(assert (= (and b!1470637 res!998844) b!1470643))

(assert (= (and b!1470643 c!135415) b!1470633))

(assert (= (and b!1470643 (not c!135415)) b!1470638))

(assert (= (and b!1470643 res!998834) b!1470648))

(assert (= (and b!1470648 res!998833) b!1470635))

(assert (= (and b!1470635 res!998832) b!1470645))

(declare-fun m!1357119 () Bool)

(assert (=> b!1470637 m!1357119))

(assert (=> b!1470637 m!1357119))

(declare-fun m!1357121 () Bool)

(assert (=> b!1470637 m!1357121))

(declare-fun m!1357123 () Bool)

(assert (=> b!1470637 m!1357123))

(declare-fun m!1357125 () Bool)

(assert (=> b!1470637 m!1357125))

(declare-fun m!1357127 () Bool)

(assert (=> b!1470641 m!1357127))

(declare-fun m!1357129 () Bool)

(assert (=> b!1470647 m!1357129))

(assert (=> b!1470647 m!1357129))

(declare-fun m!1357131 () Bool)

(assert (=> b!1470647 m!1357131))

(declare-fun m!1357133 () Bool)

(assert (=> b!1470635 m!1357133))

(declare-fun m!1357135 () Bool)

(assert (=> b!1470635 m!1357135))

(declare-fun m!1357137 () Bool)

(assert (=> start!125656 m!1357137))

(declare-fun m!1357139 () Bool)

(assert (=> start!125656 m!1357139))

(declare-fun m!1357141 () Bool)

(assert (=> b!1470646 m!1357141))

(assert (=> b!1470646 m!1357141))

(declare-fun m!1357143 () Bool)

(assert (=> b!1470646 m!1357143))

(assert (=> b!1470634 m!1357123))

(declare-fun m!1357145 () Bool)

(assert (=> b!1470634 m!1357145))

(assert (=> b!1470640 m!1357141))

(assert (=> b!1470640 m!1357141))

(declare-fun m!1357147 () Bool)

(assert (=> b!1470640 m!1357147))

(declare-fun m!1357149 () Bool)

(assert (=> b!1470638 m!1357149))

(declare-fun m!1357151 () Bool)

(assert (=> b!1470638 m!1357151))

(declare-fun m!1357153 () Bool)

(assert (=> b!1470633 m!1357153))

(assert (=> b!1470644 m!1357141))

(assert (=> b!1470644 m!1357141))

(declare-fun m!1357155 () Bool)

(assert (=> b!1470644 m!1357155))

(assert (=> b!1470644 m!1357155))

(assert (=> b!1470644 m!1357141))

(declare-fun m!1357157 () Bool)

(assert (=> b!1470644 m!1357157))

(assert (=> b!1470645 m!1357141))

(assert (=> b!1470645 m!1357141))

(declare-fun m!1357159 () Bool)

(assert (=> b!1470645 m!1357159))

(declare-fun m!1357161 () Bool)

(assert (=> b!1470639 m!1357161))

(check-sat (not b!1470635) (not b!1470637) (not b!1470641) (not b!1470644) (not b!1470645) (not b!1470646) (not b!1470633) (not b!1470640) (not b!1470638) (not start!125656) (not b!1470639) (not b!1470647))
(check-sat)
