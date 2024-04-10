; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122568 () Bool)

(assert start!122568)

(declare-fun b!1419598 () Bool)

(declare-fun res!955039 () Bool)

(declare-fun e!803174 () Bool)

(assert (=> b!1419598 (=> (not res!955039) (not e!803174))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96933 0))(
  ( (array!96934 (arr!46784 (Array (_ BitVec 32) (_ BitVec 64))) (size!47334 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96933)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419598 (= res!955039 (and (= (size!47334 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47334 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47334 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!955037 () Bool)

(assert (=> start!122568 (=> (not res!955037) (not e!803174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122568 (= res!955037 (validMask!0 mask!2608))))

(assert (=> start!122568 e!803174))

(assert (=> start!122568 true))

(declare-fun array_inv!35812 (array!96933) Bool)

(assert (=> start!122568 (array_inv!35812 a!2831)))

(declare-fun e!803172 () Bool)

(declare-fun b!1419599 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419599 (= e!803172 (not (validKeyInArray!0 (select (store (arr!46784 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))))

(declare-fun b!1419600 () Bool)

(declare-fun res!955038 () Bool)

(assert (=> b!1419600 (=> (not res!955038) (not e!803174))))

(assert (=> b!1419600 (= res!955038 (validKeyInArray!0 (select (arr!46784 a!2831) j!81)))))

(declare-fun b!1419601 () Bool)

(declare-fun res!955032 () Bool)

(assert (=> b!1419601 (=> (not res!955032) (not e!803174))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419601 (= res!955032 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47334 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47334 a!2831))))))

(declare-fun b!1419602 () Bool)

(declare-fun res!955036 () Bool)

(assert (=> b!1419602 (=> (not res!955036) (not e!803174))))

(assert (=> b!1419602 (= res!955036 (validKeyInArray!0 (select (arr!46784 a!2831) i!982)))))

(declare-fun b!1419603 () Bool)

(declare-fun res!955033 () Bool)

(assert (=> b!1419603 (=> (not res!955033) (not e!803174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96933 (_ BitVec 32)) Bool)

(assert (=> b!1419603 (= res!955033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419604 () Bool)

(assert (=> b!1419604 (= e!803174 e!803172)))

(declare-fun res!955034 () Bool)

(assert (=> b!1419604 (=> (not res!955034) (not e!803172))))

(declare-fun lt!625839 () (_ BitVec 32))

(assert (=> b!1419604 (= res!955034 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge lt!625839 #b00000000000000000000000000000000) (bvslt lt!625839 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419604 (= lt!625839 (toIndex!0 (select (store (arr!46784 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419605 () Bool)

(declare-fun res!955035 () Bool)

(assert (=> b!1419605 (=> (not res!955035) (not e!803174))))

(declare-datatypes ((List!33294 0))(
  ( (Nil!33291) (Cons!33290 (h!34592 (_ BitVec 64)) (t!47988 List!33294)) )
))
(declare-fun arrayNoDuplicates!0 (array!96933 (_ BitVec 32) List!33294) Bool)

(assert (=> b!1419605 (= res!955035 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33291))))

(declare-fun b!1419606 () Bool)

(declare-fun res!955031 () Bool)

(assert (=> b!1419606 (=> (not res!955031) (not e!803174))))

(declare-datatypes ((SeekEntryResult!11069 0))(
  ( (MissingZero!11069 (index!46668 (_ BitVec 32))) (Found!11069 (index!46669 (_ BitVec 32))) (Intermediate!11069 (undefined!11881 Bool) (index!46670 (_ BitVec 32)) (x!128343 (_ BitVec 32))) (Undefined!11069) (MissingVacant!11069 (index!46671 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96933 (_ BitVec 32)) SeekEntryResult!11069)

(assert (=> b!1419606 (= res!955031 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46784 a!2831) j!81) mask!2608) (select (arr!46784 a!2831) j!81) a!2831 mask!2608) (Intermediate!11069 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122568 res!955037) b!1419598))

(assert (= (and b!1419598 res!955039) b!1419602))

(assert (= (and b!1419602 res!955036) b!1419600))

(assert (= (and b!1419600 res!955038) b!1419603))

(assert (= (and b!1419603 res!955033) b!1419605))

(assert (= (and b!1419605 res!955035) b!1419601))

(assert (= (and b!1419601 res!955032) b!1419606))

(assert (= (and b!1419606 res!955031) b!1419604))

(assert (= (and b!1419604 res!955034) b!1419599))

(declare-fun m!1310037 () Bool)

(assert (=> b!1419599 m!1310037))

(declare-fun m!1310039 () Bool)

(assert (=> b!1419599 m!1310039))

(assert (=> b!1419599 m!1310039))

(declare-fun m!1310041 () Bool)

(assert (=> b!1419599 m!1310041))

(assert (=> b!1419604 m!1310037))

(assert (=> b!1419604 m!1310039))

(assert (=> b!1419604 m!1310039))

(declare-fun m!1310043 () Bool)

(assert (=> b!1419604 m!1310043))

(declare-fun m!1310045 () Bool)

(assert (=> b!1419602 m!1310045))

(assert (=> b!1419602 m!1310045))

(declare-fun m!1310047 () Bool)

(assert (=> b!1419602 m!1310047))

(declare-fun m!1310049 () Bool)

(assert (=> b!1419606 m!1310049))

(assert (=> b!1419606 m!1310049))

(declare-fun m!1310051 () Bool)

(assert (=> b!1419606 m!1310051))

(assert (=> b!1419606 m!1310051))

(assert (=> b!1419606 m!1310049))

(declare-fun m!1310053 () Bool)

(assert (=> b!1419606 m!1310053))

(declare-fun m!1310055 () Bool)

(assert (=> start!122568 m!1310055))

(declare-fun m!1310057 () Bool)

(assert (=> start!122568 m!1310057))

(assert (=> b!1419600 m!1310049))

(assert (=> b!1419600 m!1310049))

(declare-fun m!1310059 () Bool)

(assert (=> b!1419600 m!1310059))

(declare-fun m!1310061 () Bool)

(assert (=> b!1419605 m!1310061))

(declare-fun m!1310063 () Bool)

(assert (=> b!1419603 m!1310063))

(push 1)

