; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122880 () Bool)

(assert start!122880)

(declare-fun b!1425248 () Bool)

(declare-fun res!960683 () Bool)

(declare-fun e!805313 () Bool)

(assert (=> b!1425248 (=> (not res!960683) (not e!805313))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97245 0))(
  ( (array!97246 (arr!46940 (Array (_ BitVec 32) (_ BitVec 64))) (size!47490 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97245)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425248 (= res!960683 (and (= (size!47490 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47490 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47490 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425249 () Bool)

(declare-fun res!960686 () Bool)

(assert (=> b!1425249 (=> (not res!960686) (not e!805313))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425249 (= res!960686 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47490 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47490 a!2831))))))

(declare-fun b!1425250 () Bool)

(declare-fun res!960682 () Bool)

(assert (=> b!1425250 (=> (not res!960682) (not e!805313))))

(declare-datatypes ((SeekEntryResult!11219 0))(
  ( (MissingZero!11219 (index!47268 (_ BitVec 32))) (Found!11219 (index!47269 (_ BitVec 32))) (Intermediate!11219 (undefined!12031 Bool) (index!47270 (_ BitVec 32)) (x!128909 (_ BitVec 32))) (Undefined!11219) (MissingVacant!11219 (index!47271 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97245 (_ BitVec 32)) SeekEntryResult!11219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425250 (= res!960682 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46940 a!2831) j!81) mask!2608) (select (arr!46940 a!2831) j!81) a!2831 mask!2608) (Intermediate!11219 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425251 () Bool)

(assert (=> b!1425251 (= e!805313 false)))

(declare-fun lt!627792 () (_ BitVec 32))

(assert (=> b!1425251 (= lt!627792 (toIndex!0 (select (store (arr!46940 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun res!960688 () Bool)

(assert (=> start!122880 (=> (not res!960688) (not e!805313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122880 (= res!960688 (validMask!0 mask!2608))))

(assert (=> start!122880 e!805313))

(assert (=> start!122880 true))

(declare-fun array_inv!35968 (array!97245) Bool)

(assert (=> start!122880 (array_inv!35968 a!2831)))

(declare-fun b!1425252 () Bool)

(declare-fun res!960685 () Bool)

(assert (=> b!1425252 (=> (not res!960685) (not e!805313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425252 (= res!960685 (validKeyInArray!0 (select (arr!46940 a!2831) j!81)))))

(declare-fun b!1425253 () Bool)

(declare-fun res!960687 () Bool)

(assert (=> b!1425253 (=> (not res!960687) (not e!805313))))

(assert (=> b!1425253 (= res!960687 (validKeyInArray!0 (select (arr!46940 a!2831) i!982)))))

(declare-fun b!1425254 () Bool)

(declare-fun res!960684 () Bool)

(assert (=> b!1425254 (=> (not res!960684) (not e!805313))))

(declare-datatypes ((List!33450 0))(
  ( (Nil!33447) (Cons!33446 (h!34748 (_ BitVec 64)) (t!48144 List!33450)) )
))
(declare-fun arrayNoDuplicates!0 (array!97245 (_ BitVec 32) List!33450) Bool)

(assert (=> b!1425254 (= res!960684 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33447))))

(declare-fun b!1425255 () Bool)

(declare-fun res!960681 () Bool)

(assert (=> b!1425255 (=> (not res!960681) (not e!805313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97245 (_ BitVec 32)) Bool)

(assert (=> b!1425255 (= res!960681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122880 res!960688) b!1425248))

(assert (= (and b!1425248 res!960683) b!1425253))

(assert (= (and b!1425253 res!960687) b!1425252))

(assert (= (and b!1425252 res!960685) b!1425255))

(assert (= (and b!1425255 res!960681) b!1425254))

(assert (= (and b!1425254 res!960684) b!1425249))

(assert (= (and b!1425249 res!960686) b!1425250))

(assert (= (and b!1425250 res!960682) b!1425251))

(declare-fun m!1315803 () Bool)

(assert (=> b!1425250 m!1315803))

(assert (=> b!1425250 m!1315803))

(declare-fun m!1315805 () Bool)

(assert (=> b!1425250 m!1315805))

(assert (=> b!1425250 m!1315805))

(assert (=> b!1425250 m!1315803))

(declare-fun m!1315807 () Bool)

(assert (=> b!1425250 m!1315807))

(declare-fun m!1315809 () Bool)

(assert (=> b!1425253 m!1315809))

(assert (=> b!1425253 m!1315809))

(declare-fun m!1315811 () Bool)

(assert (=> b!1425253 m!1315811))

(declare-fun m!1315813 () Bool)

(assert (=> b!1425254 m!1315813))

(assert (=> b!1425252 m!1315803))

(assert (=> b!1425252 m!1315803))

(declare-fun m!1315815 () Bool)

(assert (=> b!1425252 m!1315815))

(declare-fun m!1315817 () Bool)

(assert (=> b!1425255 m!1315817))

(declare-fun m!1315819 () Bool)

(assert (=> start!122880 m!1315819))

(declare-fun m!1315821 () Bool)

(assert (=> start!122880 m!1315821))

(declare-fun m!1315823 () Bool)

(assert (=> b!1425251 m!1315823))

(declare-fun m!1315825 () Bool)

(assert (=> b!1425251 m!1315825))

(assert (=> b!1425251 m!1315825))

(declare-fun m!1315827 () Bool)

(assert (=> b!1425251 m!1315827))

(push 1)

(assert (not b!1425251))

(assert (not start!122880))

(assert (not b!1425250))

(assert (not b!1425255))

(assert (not b!1425252))

(assert (not b!1425254))

(assert (not b!1425253))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

