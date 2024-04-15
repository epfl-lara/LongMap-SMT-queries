; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122588 () Bool)

(assert start!122588)

(declare-fun b!1419823 () Bool)

(declare-fun res!955311 () Bool)

(declare-fun e!803212 () Bool)

(assert (=> b!1419823 (=> (not res!955311) (not e!803212))))

(declare-datatypes ((array!96906 0))(
  ( (array!96907 (arr!46771 (Array (_ BitVec 32) (_ BitVec 64))) (size!47323 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96906)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419823 (= res!955311 (validKeyInArray!0 (select (arr!46771 a!2831) i!982)))))

(declare-fun b!1419824 () Bool)

(declare-fun res!955312 () Bool)

(assert (=> b!1419824 (=> (not res!955312) (not e!803212))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1419824 (= res!955312 (validKeyInArray!0 (select (arr!46771 a!2831) j!81)))))

(declare-fun res!955308 () Bool)

(assert (=> start!122588 (=> (not res!955308) (not e!803212))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122588 (= res!955308 (validMask!0 mask!2608))))

(assert (=> start!122588 e!803212))

(assert (=> start!122588 true))

(declare-fun array_inv!36004 (array!96906) Bool)

(assert (=> start!122588 (array_inv!36004 a!2831)))

(declare-fun b!1419825 () Bool)

(declare-fun res!955314 () Bool)

(assert (=> b!1419825 (=> (not res!955314) (not e!803212))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11083 0))(
  ( (MissingZero!11083 (index!46724 (_ BitVec 32))) (Found!11083 (index!46725 (_ BitVec 32))) (Intermediate!11083 (undefined!11895 Bool) (index!46726 (_ BitVec 32)) (x!128386 (_ BitVec 32))) (Undefined!11083) (MissingVacant!11083 (index!46727 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96906 (_ BitVec 32)) SeekEntryResult!11083)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419825 (= res!955314 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46771 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46771 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96907 (store (arr!46771 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47323 a!2831)) mask!2608) (Intermediate!11083 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1419826 () Bool)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419826 (= e!803212 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1419827 () Bool)

(declare-fun res!955309 () Bool)

(assert (=> b!1419827 (=> (not res!955309) (not e!803212))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1419827 (= res!955309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46771 a!2831) j!81) mask!2608) (select (arr!46771 a!2831) j!81) a!2831 mask!2608) (Intermediate!11083 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419828 () Bool)

(declare-fun res!955315 () Bool)

(assert (=> b!1419828 (=> (not res!955315) (not e!803212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96906 (_ BitVec 32)) Bool)

(assert (=> b!1419828 (= res!955315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419829 () Bool)

(declare-fun res!955313 () Bool)

(assert (=> b!1419829 (=> (not res!955313) (not e!803212))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1419829 (= res!955313 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47323 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47323 a!2831))))))

(declare-fun b!1419830 () Bool)

(declare-fun res!955310 () Bool)

(assert (=> b!1419830 (=> (not res!955310) (not e!803212))))

(declare-datatypes ((List!33359 0))(
  ( (Nil!33356) (Cons!33355 (h!34657 (_ BitVec 64)) (t!48045 List!33359)) )
))
(declare-fun arrayNoDuplicates!0 (array!96906 (_ BitVec 32) List!33359) Bool)

(assert (=> b!1419830 (= res!955310 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33356))))

(declare-fun b!1419831 () Bool)

(declare-fun res!955307 () Bool)

(assert (=> b!1419831 (=> (not res!955307) (not e!803212))))

(assert (=> b!1419831 (= res!955307 (and (= (size!47323 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47323 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47323 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122588 res!955308) b!1419831))

(assert (= (and b!1419831 res!955307) b!1419823))

(assert (= (and b!1419823 res!955311) b!1419824))

(assert (= (and b!1419824 res!955312) b!1419828))

(assert (= (and b!1419828 res!955315) b!1419830))

(assert (= (and b!1419830 res!955310) b!1419829))

(assert (= (and b!1419829 res!955313) b!1419827))

(assert (= (and b!1419827 res!955309) b!1419825))

(assert (= (and b!1419825 res!955314) b!1419826))

(declare-fun m!1309821 () Bool)

(assert (=> b!1419828 m!1309821))

(declare-fun m!1309823 () Bool)

(assert (=> b!1419830 m!1309823))

(declare-fun m!1309825 () Bool)

(assert (=> b!1419823 m!1309825))

(assert (=> b!1419823 m!1309825))

(declare-fun m!1309827 () Bool)

(assert (=> b!1419823 m!1309827))

(declare-fun m!1309829 () Bool)

(assert (=> start!122588 m!1309829))

(declare-fun m!1309831 () Bool)

(assert (=> start!122588 m!1309831))

(declare-fun m!1309833 () Bool)

(assert (=> b!1419827 m!1309833))

(assert (=> b!1419827 m!1309833))

(declare-fun m!1309835 () Bool)

(assert (=> b!1419827 m!1309835))

(assert (=> b!1419827 m!1309835))

(assert (=> b!1419827 m!1309833))

(declare-fun m!1309837 () Bool)

(assert (=> b!1419827 m!1309837))

(assert (=> b!1419824 m!1309833))

(assert (=> b!1419824 m!1309833))

(declare-fun m!1309839 () Bool)

(assert (=> b!1419824 m!1309839))

(declare-fun m!1309841 () Bool)

(assert (=> b!1419825 m!1309841))

(declare-fun m!1309843 () Bool)

(assert (=> b!1419825 m!1309843))

(assert (=> b!1419825 m!1309843))

(declare-fun m!1309845 () Bool)

(assert (=> b!1419825 m!1309845))

(assert (=> b!1419825 m!1309845))

(assert (=> b!1419825 m!1309843))

(declare-fun m!1309847 () Bool)

(assert (=> b!1419825 m!1309847))

(check-sat (not b!1419828) (not start!122588) (not b!1419823) (not b!1419827) (not b!1419824) (not b!1419825) (not b!1419830))
(check-sat)
