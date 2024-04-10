; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125594 () Bool)

(assert start!125594)

(declare-fun b!1469726 () Bool)

(declare-fun res!998186 () Bool)

(declare-fun e!825080 () Bool)

(assert (=> b!1469726 (=> (not res!998186) (not e!825080))))

(declare-fun e!825078 () Bool)

(assert (=> b!1469726 (= res!998186 e!825078)))

(declare-fun c!135285 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469726 (= c!135285 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469727 () Bool)

(declare-fun res!998178 () Bool)

(declare-fun e!825082 () Bool)

(assert (=> b!1469727 (=> (not res!998178) (not e!825082))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99042 0))(
  ( (array!99043 (arr!47809 (Array (_ BitVec 32) (_ BitVec 64))) (size!48359 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99042)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469727 (= res!998178 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48359 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48359 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48359 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469728 () Bool)

(declare-fun e!825083 () Bool)

(assert (=> b!1469728 (= e!825083 e!825080)))

(declare-fun res!998177 () Bool)

(assert (=> b!1469728 (=> (not res!998177) (not e!825080))))

(declare-datatypes ((SeekEntryResult!12049 0))(
  ( (MissingZero!12049 (index!50588 (_ BitVec 32))) (Found!12049 (index!50589 (_ BitVec 32))) (Intermediate!12049 (undefined!12861 Bool) (index!50590 (_ BitVec 32)) (x!132162 (_ BitVec 32))) (Undefined!12049) (MissingVacant!12049 (index!50591 (_ BitVec 32))) )
))
(declare-fun lt!642649 () SeekEntryResult!12049)

(assert (=> b!1469728 (= res!998177 (= lt!642649 (Intermediate!12049 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!642651 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!642650 () array!99042)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99042 (_ BitVec 32)) SeekEntryResult!12049)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469728 (= lt!642649 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642651 mask!2687) lt!642651 lt!642650 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469728 (= lt!642651 (select (store (arr!47809 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469729 () Bool)

(declare-fun res!998180 () Bool)

(assert (=> b!1469729 (=> (not res!998180) (not e!825083))))

(declare-fun lt!642648 () SeekEntryResult!12049)

(assert (=> b!1469729 (= res!998180 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47809 a!2862) j!93) a!2862 mask!2687) lt!642648))))

(declare-fun b!1469730 () Bool)

(declare-fun res!998181 () Bool)

(assert (=> b!1469730 (=> (not res!998181) (not e!825082))))

(declare-datatypes ((List!34310 0))(
  ( (Nil!34307) (Cons!34306 (h!35656 (_ BitVec 64)) (t!49004 List!34310)) )
))
(declare-fun arrayNoDuplicates!0 (array!99042 (_ BitVec 32) List!34310) Bool)

(assert (=> b!1469730 (= res!998181 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34307))))

(declare-fun b!1469731 () Bool)

(declare-fun res!998187 () Bool)

(assert (=> b!1469731 (=> (not res!998187) (not e!825082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99042 (_ BitVec 32)) Bool)

(assert (=> b!1469731 (= res!998187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469732 () Bool)

(declare-fun res!998182 () Bool)

(assert (=> b!1469732 (=> (not res!998182) (not e!825082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469732 (= res!998182 (validKeyInArray!0 (select (arr!47809 a!2862) j!93)))))

(declare-fun b!1469733 () Bool)

(declare-fun res!998184 () Bool)

(assert (=> b!1469733 (=> (not res!998184) (not e!825082))))

(assert (=> b!1469733 (= res!998184 (and (= (size!48359 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48359 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48359 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469734 () Bool)

(declare-fun e!825079 () Bool)

(assert (=> b!1469734 (= e!825082 e!825079)))

(declare-fun res!998185 () Bool)

(assert (=> b!1469734 (=> (not res!998185) (not e!825079))))

(assert (=> b!1469734 (= res!998185 (= (select (store (arr!47809 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469734 (= lt!642650 (array!99043 (store (arr!47809 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48359 a!2862)))))

(declare-fun b!1469735 () Bool)

(assert (=> b!1469735 (= e!825079 e!825083)))

(declare-fun res!998188 () Bool)

(assert (=> b!1469735 (=> (not res!998188) (not e!825083))))

(assert (=> b!1469735 (= res!998188 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47809 a!2862) j!93) mask!2687) (select (arr!47809 a!2862) j!93) a!2862 mask!2687) lt!642648))))

(assert (=> b!1469735 (= lt!642648 (Intermediate!12049 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469736 () Bool)

(declare-fun res!998183 () Bool)

(assert (=> b!1469736 (=> (not res!998183) (not e!825082))))

(assert (=> b!1469736 (= res!998183 (validKeyInArray!0 (select (arr!47809 a!2862) i!1006)))))

(declare-fun res!998179 () Bool)

(assert (=> start!125594 (=> (not res!998179) (not e!825082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125594 (= res!998179 (validMask!0 mask!2687))))

(assert (=> start!125594 e!825082))

(assert (=> start!125594 true))

(declare-fun array_inv!36837 (array!99042) Bool)

(assert (=> start!125594 (array_inv!36837 a!2862)))

(declare-fun b!1469737 () Bool)

(assert (=> b!1469737 (= e!825078 (= lt!642649 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642651 lt!642650 mask!2687)))))

(declare-fun b!1469738 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99042 (_ BitVec 32)) SeekEntryResult!12049)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99042 (_ BitVec 32)) SeekEntryResult!12049)

(assert (=> b!1469738 (= e!825078 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642651 lt!642650 mask!2687) (seekEntryOrOpen!0 lt!642651 lt!642650 mask!2687)))))

(declare-fun b!1469739 () Bool)

(assert (=> b!1469739 (= e!825080 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006) (bvsle #b00000000000000000000000000000000 (size!48359 a!2862)) (bvsgt j!93 (size!48359 a!2862))))))

(assert (= (and start!125594 res!998179) b!1469733))

(assert (= (and b!1469733 res!998184) b!1469736))

(assert (= (and b!1469736 res!998183) b!1469732))

(assert (= (and b!1469732 res!998182) b!1469731))

(assert (= (and b!1469731 res!998187) b!1469730))

(assert (= (and b!1469730 res!998181) b!1469727))

(assert (= (and b!1469727 res!998178) b!1469734))

(assert (= (and b!1469734 res!998185) b!1469735))

(assert (= (and b!1469735 res!998188) b!1469729))

(assert (= (and b!1469729 res!998180) b!1469728))

(assert (= (and b!1469728 res!998177) b!1469726))

(assert (= (and b!1469726 c!135285) b!1469737))

(assert (= (and b!1469726 (not c!135285)) b!1469738))

(assert (= (and b!1469726 res!998186) b!1469739))

(declare-fun m!1356881 () Bool)

(assert (=> b!1469728 m!1356881))

(assert (=> b!1469728 m!1356881))

(declare-fun m!1356883 () Bool)

(assert (=> b!1469728 m!1356883))

(declare-fun m!1356885 () Bool)

(assert (=> b!1469728 m!1356885))

(declare-fun m!1356887 () Bool)

(assert (=> b!1469728 m!1356887))

(declare-fun m!1356889 () Bool)

(assert (=> b!1469738 m!1356889))

(declare-fun m!1356891 () Bool)

(assert (=> b!1469738 m!1356891))

(declare-fun m!1356893 () Bool)

(assert (=> start!125594 m!1356893))

(declare-fun m!1356895 () Bool)

(assert (=> start!125594 m!1356895))

(declare-fun m!1356897 () Bool)

(assert (=> b!1469732 m!1356897))

(assert (=> b!1469732 m!1356897))

(declare-fun m!1356899 () Bool)

(assert (=> b!1469732 m!1356899))

(declare-fun m!1356901 () Bool)

(assert (=> b!1469730 m!1356901))

(declare-fun m!1356903 () Bool)

(assert (=> b!1469737 m!1356903))

(assert (=> b!1469735 m!1356897))

(assert (=> b!1469735 m!1356897))

(declare-fun m!1356905 () Bool)

(assert (=> b!1469735 m!1356905))

(assert (=> b!1469735 m!1356905))

(assert (=> b!1469735 m!1356897))

(declare-fun m!1356907 () Bool)

(assert (=> b!1469735 m!1356907))

(assert (=> b!1469729 m!1356897))

(assert (=> b!1469729 m!1356897))

(declare-fun m!1356909 () Bool)

(assert (=> b!1469729 m!1356909))

(declare-fun m!1356911 () Bool)

(assert (=> b!1469731 m!1356911))

(declare-fun m!1356913 () Bool)

(assert (=> b!1469736 m!1356913))

(assert (=> b!1469736 m!1356913))

(declare-fun m!1356915 () Bool)

(assert (=> b!1469736 m!1356915))

(assert (=> b!1469734 m!1356885))

(declare-fun m!1356917 () Bool)

(assert (=> b!1469734 m!1356917))

(push 1)

(assert (not b!1469730))

(assert (not b!1469735))

(assert (not b!1469738))

(assert (not b!1469731))

(assert (not b!1469729))

(assert (not b!1469728))

(assert (not b!1469732))

(assert (not b!1469737))

(assert (not b!1469736))

(assert (not start!125594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

