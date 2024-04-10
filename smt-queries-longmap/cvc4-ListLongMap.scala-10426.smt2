; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122722 () Bool)

(assert start!122722)

(declare-fun b!1421970 () Bool)

(declare-fun res!957408 () Bool)

(declare-fun e!803938 () Bool)

(assert (=> b!1421970 (=> (not res!957408) (not e!803938))))

(declare-datatypes ((array!97087 0))(
  ( (array!97088 (arr!46861 (Array (_ BitVec 32) (_ BitVec 64))) (size!47411 (_ BitVec 32))) )
))
(declare-fun lt!626475 () array!97087)

(declare-fun lt!626471 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11146 0))(
  ( (MissingZero!11146 (index!46976 (_ BitVec 32))) (Found!11146 (index!46977 (_ BitVec 32))) (Intermediate!11146 (undefined!11958 Bool) (index!46978 (_ BitVec 32)) (x!128620 (_ BitVec 32))) (Undefined!11146) (MissingVacant!11146 (index!46979 (_ BitVec 32))) )
))
(declare-fun lt!626473 () SeekEntryResult!11146)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97087 (_ BitVec 32)) SeekEntryResult!11146)

(assert (=> b!1421970 (= res!957408 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626471 lt!626475 mask!2608) lt!626473))))

(declare-fun b!1421971 () Bool)

(declare-fun res!957411 () Bool)

(declare-fun e!803936 () Bool)

(assert (=> b!1421971 (=> (not res!957411) (not e!803936))))

(declare-fun a!2831 () array!97087)

(declare-datatypes ((List!33371 0))(
  ( (Nil!33368) (Cons!33367 (h!34669 (_ BitVec 64)) (t!48065 List!33371)) )
))
(declare-fun arrayNoDuplicates!0 (array!97087 (_ BitVec 32) List!33371) Bool)

(assert (=> b!1421971 (= res!957411 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33368))))

(declare-fun b!1421972 () Bool)

(declare-fun res!957412 () Bool)

(assert (=> b!1421972 (=> (not res!957412) (not e!803936))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421972 (= res!957412 (validKeyInArray!0 (select (arr!46861 a!2831) j!81)))))

(declare-fun b!1421973 () Bool)

(declare-fun e!803937 () Bool)

(assert (=> b!1421973 (= e!803937 e!803938)))

(declare-fun res!957405 () Bool)

(assert (=> b!1421973 (=> (not res!957405) (not e!803938))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421973 (= res!957405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626471 mask!2608) lt!626471 lt!626475 mask!2608) lt!626473))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421973 (= lt!626473 (Intermediate!11146 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421973 (= lt!626471 (select (store (arr!46861 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421973 (= lt!626475 (array!97088 (store (arr!46861 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47411 a!2831)))))

(declare-fun b!1421974 () Bool)

(declare-fun res!957410 () Bool)

(assert (=> b!1421974 (=> (not res!957410) (not e!803936))))

(assert (=> b!1421974 (= res!957410 (and (= (size!47411 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47411 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47411 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421975 () Bool)

(declare-fun res!957404 () Bool)

(assert (=> b!1421975 (=> (not res!957404) (not e!803936))))

(assert (=> b!1421975 (= res!957404 (validKeyInArray!0 (select (arr!46861 a!2831) i!982)))))

(declare-fun b!1421976 () Bool)

(assert (=> b!1421976 (= e!803936 e!803937)))

(declare-fun res!957407 () Bool)

(assert (=> b!1421976 (=> (not res!957407) (not e!803937))))

(declare-fun lt!626472 () SeekEntryResult!11146)

(assert (=> b!1421976 (= res!957407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46861 a!2831) j!81) mask!2608) (select (arr!46861 a!2831) j!81) a!2831 mask!2608) lt!626472))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421976 (= lt!626472 (Intermediate!11146 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421977 () Bool)

(assert (=> b!1421977 (= e!803938 (not true))))

(declare-fun e!803939 () Bool)

(assert (=> b!1421977 e!803939))

(declare-fun res!957403 () Bool)

(assert (=> b!1421977 (=> (not res!957403) (not e!803939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97087 (_ BitVec 32)) Bool)

(assert (=> b!1421977 (= res!957403 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48128 0))(
  ( (Unit!48129) )
))
(declare-fun lt!626474 () Unit!48128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48128)

(assert (=> b!1421977 (= lt!626474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421978 () Bool)

(declare-fun res!957414 () Bool)

(assert (=> b!1421978 (=> (not res!957414) (not e!803938))))

(assert (=> b!1421978 (= res!957414 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421979 () Bool)

(declare-fun res!957409 () Bool)

(assert (=> b!1421979 (=> (not res!957409) (not e!803938))))

(assert (=> b!1421979 (= res!957409 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46861 a!2831) j!81) a!2831 mask!2608) lt!626472))))

(declare-fun b!1421980 () Bool)

(declare-fun res!957413 () Bool)

(assert (=> b!1421980 (=> (not res!957413) (not e!803936))))

(assert (=> b!1421980 (= res!957413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!957406 () Bool)

(assert (=> start!122722 (=> (not res!957406) (not e!803936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122722 (= res!957406 (validMask!0 mask!2608))))

(assert (=> start!122722 e!803936))

(assert (=> start!122722 true))

(declare-fun array_inv!35889 (array!97087) Bool)

(assert (=> start!122722 (array_inv!35889 a!2831)))

(declare-fun b!1421981 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97087 (_ BitVec 32)) SeekEntryResult!11146)

(assert (=> b!1421981 (= e!803939 (= (seekEntryOrOpen!0 (select (arr!46861 a!2831) j!81) a!2831 mask!2608) (Found!11146 j!81)))))

(declare-fun b!1421982 () Bool)

(declare-fun res!957415 () Bool)

(assert (=> b!1421982 (=> (not res!957415) (not e!803936))))

(assert (=> b!1421982 (= res!957415 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47411 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47411 a!2831))))))

(assert (= (and start!122722 res!957406) b!1421974))

(assert (= (and b!1421974 res!957410) b!1421975))

(assert (= (and b!1421975 res!957404) b!1421972))

(assert (= (and b!1421972 res!957412) b!1421980))

(assert (= (and b!1421980 res!957413) b!1421971))

(assert (= (and b!1421971 res!957411) b!1421982))

(assert (= (and b!1421982 res!957415) b!1421976))

(assert (= (and b!1421976 res!957407) b!1421973))

(assert (= (and b!1421973 res!957405) b!1421979))

(assert (= (and b!1421979 res!957409) b!1421970))

(assert (= (and b!1421970 res!957408) b!1421978))

(assert (= (and b!1421978 res!957414) b!1421977))

(assert (= (and b!1421977 res!957403) b!1421981))

(declare-fun m!1312525 () Bool)

(assert (=> b!1421972 m!1312525))

(assert (=> b!1421972 m!1312525))

(declare-fun m!1312527 () Bool)

(assert (=> b!1421972 m!1312527))

(declare-fun m!1312529 () Bool)

(assert (=> b!1421971 m!1312529))

(declare-fun m!1312531 () Bool)

(assert (=> start!122722 m!1312531))

(declare-fun m!1312533 () Bool)

(assert (=> start!122722 m!1312533))

(declare-fun m!1312535 () Bool)

(assert (=> b!1421980 m!1312535))

(declare-fun m!1312537 () Bool)

(assert (=> b!1421975 m!1312537))

(assert (=> b!1421975 m!1312537))

(declare-fun m!1312539 () Bool)

(assert (=> b!1421975 m!1312539))

(declare-fun m!1312541 () Bool)

(assert (=> b!1421977 m!1312541))

(declare-fun m!1312543 () Bool)

(assert (=> b!1421977 m!1312543))

(assert (=> b!1421976 m!1312525))

(assert (=> b!1421976 m!1312525))

(declare-fun m!1312545 () Bool)

(assert (=> b!1421976 m!1312545))

(assert (=> b!1421976 m!1312545))

(assert (=> b!1421976 m!1312525))

(declare-fun m!1312547 () Bool)

(assert (=> b!1421976 m!1312547))

(declare-fun m!1312549 () Bool)

(assert (=> b!1421970 m!1312549))

(assert (=> b!1421979 m!1312525))

(assert (=> b!1421979 m!1312525))

(declare-fun m!1312551 () Bool)

(assert (=> b!1421979 m!1312551))

(assert (=> b!1421981 m!1312525))

(assert (=> b!1421981 m!1312525))

(declare-fun m!1312553 () Bool)

(assert (=> b!1421981 m!1312553))

(declare-fun m!1312555 () Bool)

(assert (=> b!1421973 m!1312555))

(assert (=> b!1421973 m!1312555))

(declare-fun m!1312557 () Bool)

(assert (=> b!1421973 m!1312557))

(declare-fun m!1312559 () Bool)

(assert (=> b!1421973 m!1312559))

(declare-fun m!1312561 () Bool)

(assert (=> b!1421973 m!1312561))

(push 1)

