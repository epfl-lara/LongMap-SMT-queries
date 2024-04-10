; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122884 () Bool)

(assert start!122884)

(declare-fun b!1425296 () Bool)

(declare-fun res!960735 () Bool)

(declare-fun e!805324 () Bool)

(assert (=> b!1425296 (=> (not res!960735) (not e!805324))))

(declare-datatypes ((array!97249 0))(
  ( (array!97250 (arr!46942 (Array (_ BitVec 32) (_ BitVec 64))) (size!47492 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97249)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425296 (= res!960735 (validKeyInArray!0 (select (arr!46942 a!2831) i!982)))))

(declare-fun b!1425297 () Bool)

(declare-fun res!960736 () Bool)

(assert (=> b!1425297 (=> (not res!960736) (not e!805324))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97249 (_ BitVec 32)) Bool)

(assert (=> b!1425297 (= res!960736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425298 () Bool)

(declare-fun res!960734 () Bool)

(assert (=> b!1425298 (=> (not res!960734) (not e!805324))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425298 (= res!960734 (validKeyInArray!0 (select (arr!46942 a!2831) j!81)))))

(declare-fun b!1425299 () Bool)

(declare-fun res!960732 () Bool)

(assert (=> b!1425299 (=> (not res!960732) (not e!805324))))

(declare-datatypes ((List!33452 0))(
  ( (Nil!33449) (Cons!33448 (h!34750 (_ BitVec 64)) (t!48146 List!33452)) )
))
(declare-fun arrayNoDuplicates!0 (array!97249 (_ BitVec 32) List!33452) Bool)

(assert (=> b!1425299 (= res!960732 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33449))))

(declare-fun b!1425300 () Bool)

(declare-fun res!960733 () Bool)

(assert (=> b!1425300 (=> (not res!960733) (not e!805324))))

(assert (=> b!1425300 (= res!960733 (and (= (size!47492 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47492 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47492 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425302 () Bool)

(assert (=> b!1425302 (= e!805324 false)))

(declare-fun lt!627798 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425302 (= lt!627798 (toIndex!0 (select (store (arr!46942 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1425303 () Bool)

(declare-fun res!960731 () Bool)

(assert (=> b!1425303 (=> (not res!960731) (not e!805324))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11221 0))(
  ( (MissingZero!11221 (index!47276 (_ BitVec 32))) (Found!11221 (index!47277 (_ BitVec 32))) (Intermediate!11221 (undefined!12033 Bool) (index!47278 (_ BitVec 32)) (x!128911 (_ BitVec 32))) (Undefined!11221) (MissingVacant!11221 (index!47279 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97249 (_ BitVec 32)) SeekEntryResult!11221)

(assert (=> b!1425303 (= res!960731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46942 a!2831) j!81) mask!2608) (select (arr!46942 a!2831) j!81) a!2831 mask!2608) (Intermediate!11221 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!960730 () Bool)

(assert (=> start!122884 (=> (not res!960730) (not e!805324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122884 (= res!960730 (validMask!0 mask!2608))))

(assert (=> start!122884 e!805324))

(assert (=> start!122884 true))

(declare-fun array_inv!35970 (array!97249) Bool)

(assert (=> start!122884 (array_inv!35970 a!2831)))

(declare-fun b!1425301 () Bool)

(declare-fun res!960729 () Bool)

(assert (=> b!1425301 (=> (not res!960729) (not e!805324))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425301 (= res!960729 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47492 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47492 a!2831))))))

(assert (= (and start!122884 res!960730) b!1425300))

(assert (= (and b!1425300 res!960733) b!1425296))

(assert (= (and b!1425296 res!960735) b!1425298))

(assert (= (and b!1425298 res!960734) b!1425297))

(assert (= (and b!1425297 res!960736) b!1425299))

(assert (= (and b!1425299 res!960732) b!1425301))

(assert (= (and b!1425301 res!960729) b!1425303))

(assert (= (and b!1425303 res!960731) b!1425302))

(declare-fun m!1315855 () Bool)

(assert (=> b!1425298 m!1315855))

(assert (=> b!1425298 m!1315855))

(declare-fun m!1315857 () Bool)

(assert (=> b!1425298 m!1315857))

(declare-fun m!1315859 () Bool)

(assert (=> start!122884 m!1315859))

(declare-fun m!1315861 () Bool)

(assert (=> start!122884 m!1315861))

(declare-fun m!1315863 () Bool)

(assert (=> b!1425302 m!1315863))

(declare-fun m!1315865 () Bool)

(assert (=> b!1425302 m!1315865))

(assert (=> b!1425302 m!1315865))

(declare-fun m!1315867 () Bool)

(assert (=> b!1425302 m!1315867))

(declare-fun m!1315869 () Bool)

(assert (=> b!1425297 m!1315869))

(declare-fun m!1315871 () Bool)

(assert (=> b!1425296 m!1315871))

(assert (=> b!1425296 m!1315871))

(declare-fun m!1315873 () Bool)

(assert (=> b!1425296 m!1315873))

(declare-fun m!1315875 () Bool)

(assert (=> b!1425299 m!1315875))

(assert (=> b!1425303 m!1315855))

(assert (=> b!1425303 m!1315855))

(declare-fun m!1315877 () Bool)

(assert (=> b!1425303 m!1315877))

(assert (=> b!1425303 m!1315877))

(assert (=> b!1425303 m!1315855))

(declare-fun m!1315879 () Bool)

(assert (=> b!1425303 m!1315879))

(push 1)

(assert (not b!1425298))

(assert (not b!1425302))

(assert (not b!1425303))

(assert (not start!122884))

(assert (not b!1425297))

(assert (not b!1425296))

(assert (not b!1425299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

