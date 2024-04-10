; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122710 () Bool)

(assert start!122710)

(declare-fun b!1421736 () Bool)

(declare-fun e!803847 () Bool)

(declare-fun e!803848 () Bool)

(assert (=> b!1421736 (= e!803847 e!803848)))

(declare-fun res!957177 () Bool)

(assert (=> b!1421736 (=> (not res!957177) (not e!803848))))

(declare-datatypes ((array!97075 0))(
  ( (array!97076 (arr!46855 (Array (_ BitVec 32) (_ BitVec 64))) (size!47405 (_ BitVec 32))) )
))
(declare-fun lt!626383 () array!97075)

(declare-datatypes ((SeekEntryResult!11140 0))(
  ( (MissingZero!11140 (index!46952 (_ BitVec 32))) (Found!11140 (index!46953 (_ BitVec 32))) (Intermediate!11140 (undefined!11952 Bool) (index!46954 (_ BitVec 32)) (x!128598 (_ BitVec 32))) (Undefined!11140) (MissingVacant!11140 (index!46955 (_ BitVec 32))) )
))
(declare-fun lt!626382 () SeekEntryResult!11140)

(declare-fun lt!626381 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97075 (_ BitVec 32)) SeekEntryResult!11140)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421736 (= res!957177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626381 mask!2608) lt!626381 lt!626383 mask!2608) lt!626382))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421736 (= lt!626382 (Intermediate!11140 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97075)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421736 (= lt!626381 (select (store (arr!46855 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421736 (= lt!626383 (array!97076 (store (arr!46855 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47405 a!2831)))))

(declare-fun b!1421737 () Bool)

(declare-fun res!957169 () Bool)

(declare-fun e!803846 () Bool)

(assert (=> b!1421737 (=> (not res!957169) (not e!803846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97075 (_ BitVec 32)) Bool)

(assert (=> b!1421737 (= res!957169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421738 () Bool)

(declare-fun res!957180 () Bool)

(assert (=> b!1421738 (=> (not res!957180) (not e!803846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421738 (= res!957180 (validKeyInArray!0 (select (arr!46855 a!2831) j!81)))))

(declare-fun b!1421739 () Bool)

(assert (=> b!1421739 (= e!803846 e!803847)))

(declare-fun res!957175 () Bool)

(assert (=> b!1421739 (=> (not res!957175) (not e!803847))))

(declare-fun lt!626385 () SeekEntryResult!11140)

(assert (=> b!1421739 (= res!957175 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46855 a!2831) j!81) mask!2608) (select (arr!46855 a!2831) j!81) a!2831 mask!2608) lt!626385))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421739 (= lt!626385 (Intermediate!11140 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421740 () Bool)

(declare-fun res!957181 () Bool)

(assert (=> b!1421740 (=> (not res!957181) (not e!803848))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421740 (= res!957181 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626381 lt!626383 mask!2608) lt!626382))))

(declare-fun b!1421741 () Bool)

(declare-fun res!957176 () Bool)

(assert (=> b!1421741 (=> (not res!957176) (not e!803848))))

(assert (=> b!1421741 (= res!957176 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46855 a!2831) j!81) a!2831 mask!2608) lt!626385))))

(declare-fun b!1421742 () Bool)

(declare-fun res!957179 () Bool)

(assert (=> b!1421742 (=> (not res!957179) (not e!803846))))

(assert (=> b!1421742 (= res!957179 (and (= (size!47405 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47405 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47405 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421743 () Bool)

(declare-fun res!957170 () Bool)

(assert (=> b!1421743 (=> (not res!957170) (not e!803846))))

(assert (=> b!1421743 (= res!957170 (validKeyInArray!0 (select (arr!46855 a!2831) i!982)))))

(declare-fun b!1421744 () Bool)

(declare-fun res!957174 () Bool)

(assert (=> b!1421744 (=> (not res!957174) (not e!803848))))

(assert (=> b!1421744 (= res!957174 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421746 () Bool)

(declare-fun res!957172 () Bool)

(assert (=> b!1421746 (=> (not res!957172) (not e!803846))))

(declare-datatypes ((List!33365 0))(
  ( (Nil!33362) (Cons!33361 (h!34663 (_ BitVec 64)) (t!48059 List!33365)) )
))
(declare-fun arrayNoDuplicates!0 (array!97075 (_ BitVec 32) List!33365) Bool)

(assert (=> b!1421746 (= res!957172 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33362))))

(declare-fun e!803849 () Bool)

(declare-fun b!1421747 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97075 (_ BitVec 32)) SeekEntryResult!11140)

(assert (=> b!1421747 (= e!803849 (= (seekEntryOrOpen!0 (select (arr!46855 a!2831) j!81) a!2831 mask!2608) (Found!11140 j!81)))))

(declare-fun b!1421748 () Bool)

(assert (=> b!1421748 (= e!803848 (not (or (= (select (arr!46855 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46855 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46855 a!2831) index!585) (select (arr!46855 a!2831) j!81)) (= (select (store (arr!46855 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2608 #b00000000000000000000000000000000))))))

(assert (=> b!1421748 e!803849))

(declare-fun res!957178 () Bool)

(assert (=> b!1421748 (=> (not res!957178) (not e!803849))))

(assert (=> b!1421748 (= res!957178 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48116 0))(
  ( (Unit!48117) )
))
(declare-fun lt!626384 () Unit!48116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48116)

(assert (=> b!1421748 (= lt!626384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!957171 () Bool)

(assert (=> start!122710 (=> (not res!957171) (not e!803846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122710 (= res!957171 (validMask!0 mask!2608))))

(assert (=> start!122710 e!803846))

(assert (=> start!122710 true))

(declare-fun array_inv!35883 (array!97075) Bool)

(assert (=> start!122710 (array_inv!35883 a!2831)))

(declare-fun b!1421745 () Bool)

(declare-fun res!957173 () Bool)

(assert (=> b!1421745 (=> (not res!957173) (not e!803846))))

(assert (=> b!1421745 (= res!957173 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47405 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47405 a!2831))))))

(assert (= (and start!122710 res!957171) b!1421742))

(assert (= (and b!1421742 res!957179) b!1421743))

(assert (= (and b!1421743 res!957170) b!1421738))

(assert (= (and b!1421738 res!957180) b!1421737))

(assert (= (and b!1421737 res!957169) b!1421746))

(assert (= (and b!1421746 res!957172) b!1421745))

(assert (= (and b!1421745 res!957173) b!1421739))

(assert (= (and b!1421739 res!957175) b!1421736))

(assert (= (and b!1421736 res!957177) b!1421741))

(assert (= (and b!1421741 res!957176) b!1421740))

(assert (= (and b!1421740 res!957181) b!1421744))

(assert (= (and b!1421744 res!957174) b!1421748))

(assert (= (and b!1421748 res!957178) b!1421747))

(declare-fun m!1312281 () Bool)

(assert (=> b!1421738 m!1312281))

(assert (=> b!1421738 m!1312281))

(declare-fun m!1312283 () Bool)

(assert (=> b!1421738 m!1312283))

(declare-fun m!1312285 () Bool)

(assert (=> b!1421740 m!1312285))

(declare-fun m!1312287 () Bool)

(assert (=> b!1421748 m!1312287))

(declare-fun m!1312289 () Bool)

(assert (=> b!1421748 m!1312289))

(declare-fun m!1312291 () Bool)

(assert (=> b!1421748 m!1312291))

(declare-fun m!1312293 () Bool)

(assert (=> b!1421748 m!1312293))

(assert (=> b!1421748 m!1312281))

(declare-fun m!1312295 () Bool)

(assert (=> b!1421748 m!1312295))

(assert (=> b!1421747 m!1312281))

(assert (=> b!1421747 m!1312281))

(declare-fun m!1312297 () Bool)

(assert (=> b!1421747 m!1312297))

(assert (=> b!1421741 m!1312281))

(assert (=> b!1421741 m!1312281))

(declare-fun m!1312299 () Bool)

(assert (=> b!1421741 m!1312299))

(declare-fun m!1312301 () Bool)

(assert (=> b!1421736 m!1312301))

(assert (=> b!1421736 m!1312301))

(declare-fun m!1312303 () Bool)

(assert (=> b!1421736 m!1312303))

(assert (=> b!1421736 m!1312287))

(declare-fun m!1312305 () Bool)

(assert (=> b!1421736 m!1312305))

(declare-fun m!1312307 () Bool)

(assert (=> b!1421746 m!1312307))

(declare-fun m!1312309 () Bool)

(assert (=> b!1421743 m!1312309))

(assert (=> b!1421743 m!1312309))

(declare-fun m!1312311 () Bool)

(assert (=> b!1421743 m!1312311))

(declare-fun m!1312313 () Bool)

(assert (=> start!122710 m!1312313))

(declare-fun m!1312315 () Bool)

(assert (=> start!122710 m!1312315))

(assert (=> b!1421739 m!1312281))

(assert (=> b!1421739 m!1312281))

(declare-fun m!1312317 () Bool)

(assert (=> b!1421739 m!1312317))

(assert (=> b!1421739 m!1312317))

(assert (=> b!1421739 m!1312281))

(declare-fun m!1312319 () Bool)

(assert (=> b!1421739 m!1312319))

(declare-fun m!1312321 () Bool)

(assert (=> b!1421737 m!1312321))

(push 1)

(assert (not b!1421737))

(assert (not b!1421736))

(assert (not b!1421741))

