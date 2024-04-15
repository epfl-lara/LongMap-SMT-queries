; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122574 () Bool)

(assert start!122574)

(declare-fun b!1419645 () Bool)

(declare-fun res!955128 () Bool)

(declare-fun e!803170 () Bool)

(assert (=> b!1419645 (=> (not res!955128) (not e!803170))))

(declare-datatypes ((array!96892 0))(
  ( (array!96893 (arr!46764 (Array (_ BitVec 32) (_ BitVec 64))) (size!47316 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96892)

(declare-datatypes ((List!33352 0))(
  ( (Nil!33349) (Cons!33348 (h!34650 (_ BitVec 64)) (t!48038 List!33352)) )
))
(declare-fun arrayNoDuplicates!0 (array!96892 (_ BitVec 32) List!33352) Bool)

(assert (=> b!1419645 (= res!955128 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33349))))

(declare-fun b!1419646 () Bool)

(declare-fun res!955134 () Bool)

(assert (=> b!1419646 (=> (not res!955134) (not e!803170))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96892 (_ BitVec 32)) Bool)

(assert (=> b!1419646 (= res!955134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419647 () Bool)

(declare-fun res!955133 () Bool)

(assert (=> b!1419647 (=> (not res!955133) (not e!803170))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419647 (= res!955133 (validKeyInArray!0 (select (arr!46764 a!2831) j!81)))))

(declare-fun b!1419648 () Bool)

(declare-fun res!955130 () Bool)

(assert (=> b!1419648 (=> (not res!955130) (not e!803170))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419648 (= res!955130 (validKeyInArray!0 (select (arr!46764 a!2831) i!982)))))

(declare-fun b!1419649 () Bool)

(assert (=> b!1419649 (= e!803170 false)))

(declare-datatypes ((SeekEntryResult!11076 0))(
  ( (MissingZero!11076 (index!46696 (_ BitVec 32))) (Found!11076 (index!46697 (_ BitVec 32))) (Intermediate!11076 (undefined!11888 Bool) (index!46698 (_ BitVec 32)) (x!128355 (_ BitVec 32))) (Undefined!11076) (MissingVacant!11076 (index!46699 (_ BitVec 32))) )
))
(declare-fun lt!625664 () SeekEntryResult!11076)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96892 (_ BitVec 32)) SeekEntryResult!11076)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419649 (= lt!625664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46764 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46764 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96893 (store (arr!46764 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47316 a!2831)) mask!2608))))

(declare-fun b!1419650 () Bool)

(declare-fun res!955135 () Bool)

(assert (=> b!1419650 (=> (not res!955135) (not e!803170))))

(assert (=> b!1419650 (= res!955135 (and (= (size!47316 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47316 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47316 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419651 () Bool)

(declare-fun res!955132 () Bool)

(assert (=> b!1419651 (=> (not res!955132) (not e!803170))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1419651 (= res!955132 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46764 a!2831) j!81) mask!2608) (select (arr!46764 a!2831) j!81) a!2831 mask!2608) (Intermediate!11076 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!955129 () Bool)

(assert (=> start!122574 (=> (not res!955129) (not e!803170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122574 (= res!955129 (validMask!0 mask!2608))))

(assert (=> start!122574 e!803170))

(assert (=> start!122574 true))

(declare-fun array_inv!35997 (array!96892) Bool)

(assert (=> start!122574 (array_inv!35997 a!2831)))

(declare-fun b!1419644 () Bool)

(declare-fun res!955131 () Bool)

(assert (=> b!1419644 (=> (not res!955131) (not e!803170))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419644 (= res!955131 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47316 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47316 a!2831))))))

(assert (= (and start!122574 res!955129) b!1419650))

(assert (= (and b!1419650 res!955135) b!1419648))

(assert (= (and b!1419648 res!955130) b!1419647))

(assert (= (and b!1419647 res!955133) b!1419646))

(assert (= (and b!1419646 res!955134) b!1419645))

(assert (= (and b!1419645 res!955128) b!1419644))

(assert (= (and b!1419644 res!955131) b!1419651))

(assert (= (and b!1419651 res!955132) b!1419649))

(declare-fun m!1309625 () Bool)

(assert (=> b!1419648 m!1309625))

(assert (=> b!1419648 m!1309625))

(declare-fun m!1309627 () Bool)

(assert (=> b!1419648 m!1309627))

(declare-fun m!1309629 () Bool)

(assert (=> b!1419649 m!1309629))

(declare-fun m!1309631 () Bool)

(assert (=> b!1419649 m!1309631))

(assert (=> b!1419649 m!1309631))

(declare-fun m!1309633 () Bool)

(assert (=> b!1419649 m!1309633))

(assert (=> b!1419649 m!1309633))

(assert (=> b!1419649 m!1309631))

(declare-fun m!1309635 () Bool)

(assert (=> b!1419649 m!1309635))

(declare-fun m!1309637 () Bool)

(assert (=> b!1419646 m!1309637))

(declare-fun m!1309639 () Bool)

(assert (=> b!1419651 m!1309639))

(assert (=> b!1419651 m!1309639))

(declare-fun m!1309641 () Bool)

(assert (=> b!1419651 m!1309641))

(assert (=> b!1419651 m!1309641))

(assert (=> b!1419651 m!1309639))

(declare-fun m!1309643 () Bool)

(assert (=> b!1419651 m!1309643))

(declare-fun m!1309645 () Bool)

(assert (=> start!122574 m!1309645))

(declare-fun m!1309647 () Bool)

(assert (=> start!122574 m!1309647))

(declare-fun m!1309649 () Bool)

(assert (=> b!1419645 m!1309649))

(assert (=> b!1419647 m!1309639))

(assert (=> b!1419647 m!1309639))

(declare-fun m!1309651 () Bool)

(assert (=> b!1419647 m!1309651))

(push 1)

(assert (not b!1419651))

(assert (not start!122574))

(assert (not b!1419645))

(assert (not b!1419647))

(assert (not b!1419646))

(assert (not b!1419648))

(assert (not b!1419649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

