; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122846 () Bool)

(assert start!122846)

(declare-fun b!1421973 () Bool)

(declare-fun res!956730 () Bool)

(declare-fun e!804255 () Bool)

(assert (=> b!1421973 (=> (not res!956730) (not e!804255))))

(declare-datatypes ((array!97133 0))(
  ( (array!97134 (arr!46882 (Array (_ BitVec 32) (_ BitVec 64))) (size!47433 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97133)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97133 (_ BitVec 32)) Bool)

(assert (=> b!1421973 (= res!956730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421974 () Bool)

(declare-fun res!956729 () Bool)

(assert (=> b!1421974 (=> (not res!956729) (not e!804255))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421974 (= res!956729 (validKeyInArray!0 (select (arr!46882 a!2831) j!81)))))

(declare-fun b!1421975 () Bool)

(declare-fun res!956725 () Bool)

(assert (=> b!1421975 (=> (not res!956725) (not e!804255))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421975 (= res!956725 (and (= (size!47433 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47433 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47433 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421976 () Bool)

(declare-fun res!956728 () Bool)

(declare-fun e!804257 () Bool)

(assert (=> b!1421976 (=> (not res!956728) (not e!804257))))

(declare-datatypes ((SeekEntryResult!11069 0))(
  ( (MissingZero!11069 (index!46668 (_ BitVec 32))) (Found!11069 (index!46669 (_ BitVec 32))) (Intermediate!11069 (undefined!11881 Bool) (index!46670 (_ BitVec 32)) (x!128482 (_ BitVec 32))) (Undefined!11069) (MissingVacant!11069 (index!46671 (_ BitVec 32))) )
))
(declare-fun lt!626415 () SeekEntryResult!11069)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97133 (_ BitVec 32)) SeekEntryResult!11069)

(assert (=> b!1421976 (= res!956728 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46882 a!2831) j!81) a!2831 mask!2608) lt!626415))))

(declare-fun res!956731 () Bool)

(assert (=> start!122846 (=> (not res!956731) (not e!804255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122846 (= res!956731 (validMask!0 mask!2608))))

(assert (=> start!122846 e!804255))

(assert (=> start!122846 true))

(declare-fun array_inv!36163 (array!97133) Bool)

(assert (=> start!122846 (array_inv!36163 a!2831)))

(declare-fun b!1421977 () Bool)

(declare-fun e!804254 () Bool)

(assert (=> b!1421977 (= e!804255 e!804254)))

(declare-fun res!956723 () Bool)

(assert (=> b!1421977 (=> (not res!956723) (not e!804254))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421977 (= res!956723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46882 a!2831) j!81) mask!2608) (select (arr!46882 a!2831) j!81) a!2831 mask!2608) lt!626415))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421977 (= lt!626415 (Intermediate!11069 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421978 () Bool)

(assert (=> b!1421978 (= e!804254 e!804257)))

(declare-fun res!956727 () Bool)

(assert (=> b!1421978 (=> (not res!956727) (not e!804257))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!626414 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun lt!626416 () array!97133)

(assert (=> b!1421978 (= res!956727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626414 mask!2608) lt!626414 lt!626416 mask!2608) (Intermediate!11069 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1421978 (= lt!626414 (select (store (arr!46882 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421978 (= lt!626416 (array!97134 (store (arr!46882 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47433 a!2831)))))

(declare-fun b!1421979 () Bool)

(declare-fun res!956722 () Bool)

(assert (=> b!1421979 (=> (not res!956722) (not e!804255))))

(declare-datatypes ((List!33379 0))(
  ( (Nil!33376) (Cons!33375 (h!34685 (_ BitVec 64)) (t!48065 List!33379)) )
))
(declare-fun arrayNoDuplicates!0 (array!97133 (_ BitVec 32) List!33379) Bool)

(assert (=> b!1421979 (= res!956722 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33376))))

(declare-fun b!1421980 () Bool)

(declare-fun res!956724 () Bool)

(assert (=> b!1421980 (=> (not res!956724) (not e!804255))))

(assert (=> b!1421980 (= res!956724 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47433 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47433 a!2831))))))

(declare-fun b!1421981 () Bool)

(declare-fun res!956726 () Bool)

(assert (=> b!1421981 (=> (not res!956726) (not e!804255))))

(assert (=> b!1421981 (= res!956726 (validKeyInArray!0 (select (arr!46882 a!2831) i!982)))))

(declare-fun b!1421982 () Bool)

(assert (=> b!1421982 (= e!804257 false)))

(declare-fun lt!626417 () SeekEntryResult!11069)

(assert (=> b!1421982 (= lt!626417 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626414 lt!626416 mask!2608))))

(assert (= (and start!122846 res!956731) b!1421975))

(assert (= (and b!1421975 res!956725) b!1421981))

(assert (= (and b!1421981 res!956726) b!1421974))

(assert (= (and b!1421974 res!956729) b!1421973))

(assert (= (and b!1421973 res!956730) b!1421979))

(assert (= (and b!1421979 res!956722) b!1421980))

(assert (= (and b!1421980 res!956724) b!1421977))

(assert (= (and b!1421977 res!956723) b!1421978))

(assert (= (and b!1421978 res!956727) b!1421976))

(assert (= (and b!1421976 res!956728) b!1421982))

(declare-fun m!1312731 () Bool)

(assert (=> b!1421978 m!1312731))

(assert (=> b!1421978 m!1312731))

(declare-fun m!1312733 () Bool)

(assert (=> b!1421978 m!1312733))

(declare-fun m!1312735 () Bool)

(assert (=> b!1421978 m!1312735))

(declare-fun m!1312737 () Bool)

(assert (=> b!1421978 m!1312737))

(declare-fun m!1312739 () Bool)

(assert (=> b!1421973 m!1312739))

(declare-fun m!1312741 () Bool)

(assert (=> b!1421982 m!1312741))

(declare-fun m!1312743 () Bool)

(assert (=> b!1421979 m!1312743))

(declare-fun m!1312745 () Bool)

(assert (=> b!1421977 m!1312745))

(assert (=> b!1421977 m!1312745))

(declare-fun m!1312747 () Bool)

(assert (=> b!1421977 m!1312747))

(assert (=> b!1421977 m!1312747))

(assert (=> b!1421977 m!1312745))

(declare-fun m!1312749 () Bool)

(assert (=> b!1421977 m!1312749))

(assert (=> b!1421976 m!1312745))

(assert (=> b!1421976 m!1312745))

(declare-fun m!1312751 () Bool)

(assert (=> b!1421976 m!1312751))

(declare-fun m!1312753 () Bool)

(assert (=> b!1421981 m!1312753))

(assert (=> b!1421981 m!1312753))

(declare-fun m!1312755 () Bool)

(assert (=> b!1421981 m!1312755))

(assert (=> b!1421974 m!1312745))

(assert (=> b!1421974 m!1312745))

(declare-fun m!1312757 () Bool)

(assert (=> b!1421974 m!1312757))

(declare-fun m!1312759 () Bool)

(assert (=> start!122846 m!1312759))

(declare-fun m!1312761 () Bool)

(assert (=> start!122846 m!1312761))

(check-sat (not b!1421974) (not b!1421977) (not b!1421982) (not b!1421981) (not b!1421979) (not start!122846) (not b!1421973) (not b!1421978) (not b!1421976))
(check-sat)
