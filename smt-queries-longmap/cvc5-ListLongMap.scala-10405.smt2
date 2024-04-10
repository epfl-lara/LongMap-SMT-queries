; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122592 () Bool)

(assert start!122592)

(declare-fun b!1419904 () Bool)

(declare-fun e!803252 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419904 (= e!803252 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1419905 () Bool)

(declare-fun res!955339 () Bool)

(assert (=> b!1419905 (=> (not res!955339) (not e!803252))))

(declare-datatypes ((array!96957 0))(
  ( (array!96958 (arr!46796 (Array (_ BitVec 32) (_ BitVec 64))) (size!47346 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96957)

(declare-datatypes ((List!33306 0))(
  ( (Nil!33303) (Cons!33302 (h!34604 (_ BitVec 64)) (t!48000 List!33306)) )
))
(declare-fun arrayNoDuplicates!0 (array!96957 (_ BitVec 32) List!33306) Bool)

(assert (=> b!1419905 (= res!955339 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33303))))

(declare-fun b!1419906 () Bool)

(declare-fun res!955344 () Bool)

(assert (=> b!1419906 (=> (not res!955344) (not e!803252))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419906 (= res!955344 (validKeyInArray!0 (select (arr!46796 a!2831) j!81)))))

(declare-fun b!1419907 () Bool)

(declare-fun res!955337 () Bool)

(assert (=> b!1419907 (=> (not res!955337) (not e!803252))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419907 (= res!955337 (and (= (size!47346 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47346 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47346 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!955341 () Bool)

(assert (=> start!122592 (=> (not res!955341) (not e!803252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122592 (= res!955341 (validMask!0 mask!2608))))

(assert (=> start!122592 e!803252))

(assert (=> start!122592 true))

(declare-fun array_inv!35824 (array!96957) Bool)

(assert (=> start!122592 (array_inv!35824 a!2831)))

(declare-fun b!1419908 () Bool)

(declare-fun res!955342 () Bool)

(assert (=> b!1419908 (=> (not res!955342) (not e!803252))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11081 0))(
  ( (MissingZero!11081 (index!46716 (_ BitVec 32))) (Found!11081 (index!46717 (_ BitVec 32))) (Intermediate!11081 (undefined!11893 Bool) (index!46718 (_ BitVec 32)) (x!128387 (_ BitVec 32))) (Undefined!11081) (MissingVacant!11081 (index!46719 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96957 (_ BitVec 32)) SeekEntryResult!11081)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419908 (= res!955342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46796 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46796 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96958 (store (arr!46796 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47346 a!2831)) mask!2608) (Intermediate!11081 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1419909 () Bool)

(declare-fun res!955340 () Bool)

(assert (=> b!1419909 (=> (not res!955340) (not e!803252))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1419909 (= res!955340 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47346 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47346 a!2831))))))

(declare-fun b!1419910 () Bool)

(declare-fun res!955343 () Bool)

(assert (=> b!1419910 (=> (not res!955343) (not e!803252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96957 (_ BitVec 32)) Bool)

(assert (=> b!1419910 (= res!955343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419911 () Bool)

(declare-fun res!955345 () Bool)

(assert (=> b!1419911 (=> (not res!955345) (not e!803252))))

(assert (=> b!1419911 (= res!955345 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46796 a!2831) j!81) mask!2608) (select (arr!46796 a!2831) j!81) a!2831 mask!2608) (Intermediate!11081 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419912 () Bool)

(declare-fun res!955338 () Bool)

(assert (=> b!1419912 (=> (not res!955338) (not e!803252))))

(assert (=> b!1419912 (= res!955338 (validKeyInArray!0 (select (arr!46796 a!2831) i!982)))))

(assert (= (and start!122592 res!955341) b!1419907))

(assert (= (and b!1419907 res!955337) b!1419912))

(assert (= (and b!1419912 res!955338) b!1419906))

(assert (= (and b!1419906 res!955344) b!1419910))

(assert (= (and b!1419910 res!955343) b!1419905))

(assert (= (and b!1419905 res!955339) b!1419909))

(assert (= (and b!1419909 res!955340) b!1419911))

(assert (= (and b!1419911 res!955345) b!1419908))

(assert (= (and b!1419908 res!955342) b!1419904))

(declare-fun m!1310373 () Bool)

(assert (=> b!1419911 m!1310373))

(assert (=> b!1419911 m!1310373))

(declare-fun m!1310375 () Bool)

(assert (=> b!1419911 m!1310375))

(assert (=> b!1419911 m!1310375))

(assert (=> b!1419911 m!1310373))

(declare-fun m!1310377 () Bool)

(assert (=> b!1419911 m!1310377))

(assert (=> b!1419906 m!1310373))

(assert (=> b!1419906 m!1310373))

(declare-fun m!1310379 () Bool)

(assert (=> b!1419906 m!1310379))

(declare-fun m!1310381 () Bool)

(assert (=> b!1419912 m!1310381))

(assert (=> b!1419912 m!1310381))

(declare-fun m!1310383 () Bool)

(assert (=> b!1419912 m!1310383))

(declare-fun m!1310385 () Bool)

(assert (=> start!122592 m!1310385))

(declare-fun m!1310387 () Bool)

(assert (=> start!122592 m!1310387))

(declare-fun m!1310389 () Bool)

(assert (=> b!1419905 m!1310389))

(declare-fun m!1310391 () Bool)

(assert (=> b!1419910 m!1310391))

(declare-fun m!1310393 () Bool)

(assert (=> b!1419908 m!1310393))

(declare-fun m!1310395 () Bool)

(assert (=> b!1419908 m!1310395))

(assert (=> b!1419908 m!1310395))

(declare-fun m!1310397 () Bool)

(assert (=> b!1419908 m!1310397))

(assert (=> b!1419908 m!1310397))

(assert (=> b!1419908 m!1310395))

(declare-fun m!1310399 () Bool)

(assert (=> b!1419908 m!1310399))

(push 1)

(assert (not start!122592))

(assert (not b!1419906))

(assert (not b!1419910))

(assert (not b!1419912))

(assert (not b!1419905))

(assert (not b!1419908))

(assert (not b!1419911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

