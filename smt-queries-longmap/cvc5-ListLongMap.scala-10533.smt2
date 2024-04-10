; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124210 () Bool)

(assert start!124210)

(declare-fun b!1437637 () Bool)

(declare-fun res!970422 () Bool)

(declare-fun e!811074 () Bool)

(assert (=> b!1437637 (=> (not res!970422) (not e!811074))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97775 0))(
  ( (array!97776 (arr!47180 (Array (_ BitVec 32) (_ BitVec 64))) (size!47730 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97775)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11432 0))(
  ( (MissingZero!11432 (index!48120 (_ BitVec 32))) (Found!11432 (index!48121 (_ BitVec 32))) (Intermediate!11432 (undefined!12244 Bool) (index!48122 (_ BitVec 32)) (x!129855 (_ BitVec 32))) (Undefined!11432) (MissingVacant!11432 (index!48123 (_ BitVec 32))) )
))
(declare-fun lt!632358 () SeekEntryResult!11432)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97775 (_ BitVec 32)) SeekEntryResult!11432)

(assert (=> b!1437637 (= res!970422 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47180 a!2862) j!93) a!2862 mask!2687) lt!632358))))

(declare-fun b!1437638 () Bool)

(declare-fun res!970415 () Bool)

(declare-fun e!811075 () Bool)

(assert (=> b!1437638 (=> (not res!970415) (not e!811075))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437638 (= res!970415 (and (= (size!47730 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47730 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47730 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437639 () Bool)

(declare-fun res!970420 () Bool)

(assert (=> b!1437639 (=> (not res!970420) (not e!811075))))

(declare-datatypes ((List!33681 0))(
  ( (Nil!33678) (Cons!33677 (h!35018 (_ BitVec 64)) (t!48375 List!33681)) )
))
(declare-fun arrayNoDuplicates!0 (array!97775 (_ BitVec 32) List!33681) Bool)

(assert (=> b!1437639 (= res!970420 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33678))))

(declare-fun b!1437640 () Bool)

(assert (=> b!1437640 (= e!811075 e!811074)))

(declare-fun res!970417 () Bool)

(assert (=> b!1437640 (=> (not res!970417) (not e!811074))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437640 (= res!970417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47180 a!2862) j!93) mask!2687) (select (arr!47180 a!2862) j!93) a!2862 mask!2687) lt!632358))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437640 (= lt!632358 (Intermediate!11432 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437641 () Bool)

(declare-fun res!970416 () Bool)

(assert (=> b!1437641 (=> (not res!970416) (not e!811075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437641 (= res!970416 (validKeyInArray!0 (select (arr!47180 a!2862) i!1006)))))

(declare-fun b!1437642 () Bool)

(declare-fun res!970423 () Bool)

(assert (=> b!1437642 (=> (not res!970423) (not e!811075))))

(assert (=> b!1437642 (= res!970423 (validKeyInArray!0 (select (arr!47180 a!2862) j!93)))))

(declare-fun res!970418 () Bool)

(assert (=> start!124210 (=> (not res!970418) (not e!811075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124210 (= res!970418 (validMask!0 mask!2687))))

(assert (=> start!124210 e!811075))

(assert (=> start!124210 true))

(declare-fun array_inv!36208 (array!97775) Bool)

(assert (=> start!124210 (array_inv!36208 a!2862)))

(declare-fun b!1437643 () Bool)

(declare-fun res!970419 () Bool)

(assert (=> b!1437643 (=> (not res!970419) (not e!811075))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437643 (= res!970419 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47730 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47730 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47730 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47180 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437644 () Bool)

(assert (=> b!1437644 (= e!811074 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!632357 () (_ BitVec 32))

(assert (=> b!1437644 (= lt!632357 (toIndex!0 (select (store (arr!47180 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437645 () Bool)

(declare-fun res!970421 () Bool)

(assert (=> b!1437645 (=> (not res!970421) (not e!811075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97775 (_ BitVec 32)) Bool)

(assert (=> b!1437645 (= res!970421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124210 res!970418) b!1437638))

(assert (= (and b!1437638 res!970415) b!1437641))

(assert (= (and b!1437641 res!970416) b!1437642))

(assert (= (and b!1437642 res!970423) b!1437645))

(assert (= (and b!1437645 res!970421) b!1437639))

(assert (= (and b!1437639 res!970420) b!1437643))

(assert (= (and b!1437643 res!970419) b!1437640))

(assert (= (and b!1437640 res!970417) b!1437637))

(assert (= (and b!1437637 res!970422) b!1437644))

(declare-fun m!1326871 () Bool)

(assert (=> b!1437644 m!1326871))

(declare-fun m!1326873 () Bool)

(assert (=> b!1437644 m!1326873))

(assert (=> b!1437644 m!1326873))

(declare-fun m!1326875 () Bool)

(assert (=> b!1437644 m!1326875))

(declare-fun m!1326877 () Bool)

(assert (=> b!1437639 m!1326877))

(declare-fun m!1326879 () Bool)

(assert (=> b!1437640 m!1326879))

(assert (=> b!1437640 m!1326879))

(declare-fun m!1326881 () Bool)

(assert (=> b!1437640 m!1326881))

(assert (=> b!1437640 m!1326881))

(assert (=> b!1437640 m!1326879))

(declare-fun m!1326883 () Bool)

(assert (=> b!1437640 m!1326883))

(assert (=> b!1437643 m!1326871))

(declare-fun m!1326885 () Bool)

(assert (=> b!1437643 m!1326885))

(assert (=> b!1437637 m!1326879))

(assert (=> b!1437637 m!1326879))

(declare-fun m!1326887 () Bool)

(assert (=> b!1437637 m!1326887))

(declare-fun m!1326889 () Bool)

(assert (=> b!1437641 m!1326889))

(assert (=> b!1437641 m!1326889))

(declare-fun m!1326891 () Bool)

(assert (=> b!1437641 m!1326891))

(declare-fun m!1326893 () Bool)

(assert (=> start!124210 m!1326893))

(declare-fun m!1326895 () Bool)

(assert (=> start!124210 m!1326895))

(assert (=> b!1437642 m!1326879))

(assert (=> b!1437642 m!1326879))

(declare-fun m!1326897 () Bool)

(assert (=> b!1437642 m!1326897))

(declare-fun m!1326899 () Bool)

(assert (=> b!1437645 m!1326899))

(push 1)

(assert (not b!1437640))

(assert (not b!1437642))

(assert (not b!1437639))

(assert (not b!1437641))

(assert (not b!1437637))

(assert (not b!1437645))

(assert (not start!124210))

(assert (not b!1437644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

