; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125590 () Bool)

(assert start!125590)

(declare-fun e!825043 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12047 0))(
  ( (MissingZero!12047 (index!50580 (_ BitVec 32))) (Found!12047 (index!50581 (_ BitVec 32))) (Intermediate!12047 (undefined!12859 Bool) (index!50582 (_ BitVec 32)) (x!132160 (_ BitVec 32))) (Undefined!12047) (MissingVacant!12047 (index!50583 (_ BitVec 32))) )
))
(declare-fun lt!642626 () SeekEntryResult!12047)

(declare-datatypes ((array!99038 0))(
  ( (array!99039 (arr!47807 (Array (_ BitVec 32) (_ BitVec 64))) (size!48357 (_ BitVec 32))) )
))
(declare-fun lt!642624 () array!99038)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!642627 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1469642 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99038 (_ BitVec 32)) SeekEntryResult!12047)

(assert (=> b!1469642 (= e!825043 (= lt!642626 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642627 lt!642624 mask!2687)))))

(declare-fun res!998110 () Bool)

(declare-fun e!825046 () Bool)

(assert (=> start!125590 (=> (not res!998110) (not e!825046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125590 (= res!998110 (validMask!0 mask!2687))))

(assert (=> start!125590 e!825046))

(assert (=> start!125590 true))

(declare-fun a!2862 () array!99038)

(declare-fun array_inv!36835 (array!99038) Bool)

(assert (=> start!125590 (array_inv!36835 a!2862)))

(declare-fun b!1469643 () Bool)

(declare-fun res!998107 () Bool)

(assert (=> b!1469643 (=> (not res!998107) (not e!825046))))

(declare-datatypes ((List!34308 0))(
  ( (Nil!34305) (Cons!34304 (h!35654 (_ BitVec 64)) (t!49002 List!34308)) )
))
(declare-fun arrayNoDuplicates!0 (array!99038 (_ BitVec 32) List!34308) Bool)

(assert (=> b!1469643 (= res!998107 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34305))))

(declare-fun e!825044 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1469644 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469644 (= e!825044 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006) (bvsle #b00000000000000000000000000000000 (size!48357 a!2862)) (bvsgt j!93 (size!48357 a!2862))))))

(declare-fun b!1469645 () Bool)

(declare-fun res!998113 () Bool)

(declare-fun e!825042 () Bool)

(assert (=> b!1469645 (=> (not res!998113) (not e!825042))))

(declare-fun lt!642625 () SeekEntryResult!12047)

(assert (=> b!1469645 (= res!998113 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47807 a!2862) j!93) a!2862 mask!2687) lt!642625))))

(declare-fun b!1469646 () Bool)

(declare-fun res!998105 () Bool)

(assert (=> b!1469646 (=> (not res!998105) (not e!825046))))

(assert (=> b!1469646 (= res!998105 (and (= (size!48357 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48357 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48357 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469647 () Bool)

(declare-fun res!998111 () Bool)

(assert (=> b!1469647 (=> (not res!998111) (not e!825044))))

(assert (=> b!1469647 (= res!998111 e!825043)))

(declare-fun c!135279 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469647 (= c!135279 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469648 () Bool)

(declare-fun e!825045 () Bool)

(assert (=> b!1469648 (= e!825045 e!825042)))

(declare-fun res!998109 () Bool)

(assert (=> b!1469648 (=> (not res!998109) (not e!825042))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469648 (= res!998109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47807 a!2862) j!93) mask!2687) (select (arr!47807 a!2862) j!93) a!2862 mask!2687) lt!642625))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1469648 (= lt!642625 (Intermediate!12047 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469649 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99038 (_ BitVec 32)) SeekEntryResult!12047)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99038 (_ BitVec 32)) SeekEntryResult!12047)

(assert (=> b!1469649 (= e!825043 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642627 lt!642624 mask!2687) (seekEntryOrOpen!0 lt!642627 lt!642624 mask!2687)))))

(declare-fun b!1469650 () Bool)

(declare-fun res!998112 () Bool)

(assert (=> b!1469650 (=> (not res!998112) (not e!825046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99038 (_ BitVec 32)) Bool)

(assert (=> b!1469650 (= res!998112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469651 () Bool)

(assert (=> b!1469651 (= e!825046 e!825045)))

(declare-fun res!998106 () Bool)

(assert (=> b!1469651 (=> (not res!998106) (not e!825045))))

(assert (=> b!1469651 (= res!998106 (= (select (store (arr!47807 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469651 (= lt!642624 (array!99039 (store (arr!47807 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48357 a!2862)))))

(declare-fun b!1469652 () Bool)

(assert (=> b!1469652 (= e!825042 e!825044)))

(declare-fun res!998108 () Bool)

(assert (=> b!1469652 (=> (not res!998108) (not e!825044))))

(assert (=> b!1469652 (= res!998108 (= lt!642626 (Intermediate!12047 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469652 (= lt!642626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642627 mask!2687) lt!642627 lt!642624 mask!2687))))

(assert (=> b!1469652 (= lt!642627 (select (store (arr!47807 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469653 () Bool)

(declare-fun res!998116 () Bool)

(assert (=> b!1469653 (=> (not res!998116) (not e!825046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469653 (= res!998116 (validKeyInArray!0 (select (arr!47807 a!2862) i!1006)))))

(declare-fun b!1469654 () Bool)

(declare-fun res!998115 () Bool)

(assert (=> b!1469654 (=> (not res!998115) (not e!825046))))

(assert (=> b!1469654 (= res!998115 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48357 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48357 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48357 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469655 () Bool)

(declare-fun res!998114 () Bool)

(assert (=> b!1469655 (=> (not res!998114) (not e!825046))))

(assert (=> b!1469655 (= res!998114 (validKeyInArray!0 (select (arr!47807 a!2862) j!93)))))

(assert (= (and start!125590 res!998110) b!1469646))

(assert (= (and b!1469646 res!998105) b!1469653))

(assert (= (and b!1469653 res!998116) b!1469655))

(assert (= (and b!1469655 res!998114) b!1469650))

(assert (= (and b!1469650 res!998112) b!1469643))

(assert (= (and b!1469643 res!998107) b!1469654))

(assert (= (and b!1469654 res!998115) b!1469651))

(assert (= (and b!1469651 res!998106) b!1469648))

(assert (= (and b!1469648 res!998109) b!1469645))

(assert (= (and b!1469645 res!998113) b!1469652))

(assert (= (and b!1469652 res!998108) b!1469647))

(assert (= (and b!1469647 c!135279) b!1469642))

(assert (= (and b!1469647 (not c!135279)) b!1469649))

(assert (= (and b!1469647 res!998111) b!1469644))

(declare-fun m!1356805 () Bool)

(assert (=> b!1469652 m!1356805))

(assert (=> b!1469652 m!1356805))

(declare-fun m!1356807 () Bool)

(assert (=> b!1469652 m!1356807))

(declare-fun m!1356809 () Bool)

(assert (=> b!1469652 m!1356809))

(declare-fun m!1356811 () Bool)

(assert (=> b!1469652 m!1356811))

(declare-fun m!1356813 () Bool)

(assert (=> b!1469642 m!1356813))

(declare-fun m!1356815 () Bool)

(assert (=> b!1469653 m!1356815))

(assert (=> b!1469653 m!1356815))

(declare-fun m!1356817 () Bool)

(assert (=> b!1469653 m!1356817))

(declare-fun m!1356819 () Bool)

(assert (=> b!1469643 m!1356819))

(declare-fun m!1356821 () Bool)

(assert (=> b!1469645 m!1356821))

(assert (=> b!1469645 m!1356821))

(declare-fun m!1356823 () Bool)

(assert (=> b!1469645 m!1356823))

(assert (=> b!1469651 m!1356809))

(declare-fun m!1356825 () Bool)

(assert (=> b!1469651 m!1356825))

(declare-fun m!1356827 () Bool)

(assert (=> b!1469649 m!1356827))

(declare-fun m!1356829 () Bool)

(assert (=> b!1469649 m!1356829))

(declare-fun m!1356831 () Bool)

(assert (=> start!125590 m!1356831))

(declare-fun m!1356833 () Bool)

(assert (=> start!125590 m!1356833))

(assert (=> b!1469655 m!1356821))

(assert (=> b!1469655 m!1356821))

(declare-fun m!1356835 () Bool)

(assert (=> b!1469655 m!1356835))

(declare-fun m!1356837 () Bool)

(assert (=> b!1469650 m!1356837))

(assert (=> b!1469648 m!1356821))

(assert (=> b!1469648 m!1356821))

(declare-fun m!1356839 () Bool)

(assert (=> b!1469648 m!1356839))

(assert (=> b!1469648 m!1356839))

(assert (=> b!1469648 m!1356821))

(declare-fun m!1356841 () Bool)

(assert (=> b!1469648 m!1356841))

(push 1)

(assert (not b!1469650))

(assert (not start!125590))

(assert (not b!1469642))

(assert (not b!1469649))

(assert (not b!1469655))

(assert (not b!1469652))

