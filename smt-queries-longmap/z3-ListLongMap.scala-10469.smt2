; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123086 () Bool)

(assert start!123086)

(declare-fun b!1427427 () Bool)

(declare-fun e!806227 () Bool)

(declare-fun e!806228 () Bool)

(assert (=> b!1427427 (= e!806227 e!806228)))

(declare-fun res!962466 () Bool)

(assert (=> b!1427427 (=> (not res!962466) (not e!806228))))

(declare-datatypes ((array!97349 0))(
  ( (array!97350 (arr!46989 (Array (_ BitVec 32) (_ BitVec 64))) (size!47539 (_ BitVec 32))) )
))
(declare-fun lt!628565 () array!97349)

(declare-fun lt!628566 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11268 0))(
  ( (MissingZero!11268 (index!47464 (_ BitVec 32))) (Found!11268 (index!47465 (_ BitVec 32))) (Intermediate!11268 (undefined!12080 Bool) (index!47466 (_ BitVec 32)) (x!129098 (_ BitVec 32))) (Undefined!11268) (MissingVacant!11268 (index!47467 (_ BitVec 32))) )
))
(declare-fun lt!628568 () SeekEntryResult!11268)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97349 (_ BitVec 32)) SeekEntryResult!11268)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427427 (= res!962466 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628566 mask!2608) lt!628566 lt!628565 mask!2608) lt!628568))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427427 (= lt!628568 (Intermediate!11268 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97349)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427427 (= lt!628566 (select (store (arr!46989 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427427 (= lt!628565 (array!97350 (store (arr!46989 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47539 a!2831)))))

(declare-fun b!1427428 () Bool)

(declare-fun res!962460 () Bool)

(declare-fun e!806225 () Bool)

(assert (=> b!1427428 (=> (not res!962460) (not e!806225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427428 (= res!962460 (validKeyInArray!0 (select (arr!46989 a!2831) j!81)))))

(declare-fun b!1427429 () Bool)

(declare-fun res!962464 () Bool)

(assert (=> b!1427429 (=> (not res!962464) (not e!806228))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1427429 (= res!962464 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427430 () Bool)

(declare-fun res!962462 () Bool)

(assert (=> b!1427430 (=> (not res!962462) (not e!806225))))

(assert (=> b!1427430 (= res!962462 (and (= (size!47539 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47539 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47539 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427431 () Bool)

(assert (=> b!1427431 (= e!806228 (not true))))

(declare-fun e!806224 () Bool)

(assert (=> b!1427431 e!806224))

(declare-fun res!962469 () Bool)

(assert (=> b!1427431 (=> (not res!962469) (not e!806224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97349 (_ BitVec 32)) Bool)

(assert (=> b!1427431 (= res!962469 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48282 0))(
  ( (Unit!48283) )
))
(declare-fun lt!628567 () Unit!48282)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97349 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48282)

(assert (=> b!1427431 (= lt!628567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427432 () Bool)

(assert (=> b!1427432 (= e!806225 e!806227)))

(declare-fun res!962465 () Bool)

(assert (=> b!1427432 (=> (not res!962465) (not e!806227))))

(declare-fun lt!628569 () SeekEntryResult!11268)

(assert (=> b!1427432 (= res!962465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46989 a!2831) j!81) mask!2608) (select (arr!46989 a!2831) j!81) a!2831 mask!2608) lt!628569))))

(assert (=> b!1427432 (= lt!628569 (Intermediate!11268 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!962459 () Bool)

(assert (=> start!123086 (=> (not res!962459) (not e!806225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123086 (= res!962459 (validMask!0 mask!2608))))

(assert (=> start!123086 e!806225))

(assert (=> start!123086 true))

(declare-fun array_inv!36017 (array!97349) Bool)

(assert (=> start!123086 (array_inv!36017 a!2831)))

(declare-fun b!1427433 () Bool)

(declare-fun res!962461 () Bool)

(assert (=> b!1427433 (=> (not res!962461) (not e!806228))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427433 (= res!962461 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628566 lt!628565 mask!2608) lt!628568))))

(declare-fun b!1427434 () Bool)

(declare-fun res!962467 () Bool)

(assert (=> b!1427434 (=> (not res!962467) (not e!806225))))

(declare-datatypes ((List!33499 0))(
  ( (Nil!33496) (Cons!33495 (h!34803 (_ BitVec 64)) (t!48193 List!33499)) )
))
(declare-fun arrayNoDuplicates!0 (array!97349 (_ BitVec 32) List!33499) Bool)

(assert (=> b!1427434 (= res!962467 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33496))))

(declare-fun b!1427435 () Bool)

(declare-fun res!962463 () Bool)

(assert (=> b!1427435 (=> (not res!962463) (not e!806225))))

(assert (=> b!1427435 (= res!962463 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47539 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47539 a!2831))))))

(declare-fun b!1427436 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97349 (_ BitVec 32)) SeekEntryResult!11268)

(assert (=> b!1427436 (= e!806224 (= (seekEntryOrOpen!0 (select (arr!46989 a!2831) j!81) a!2831 mask!2608) (Found!11268 j!81)))))

(declare-fun b!1427437 () Bool)

(declare-fun res!962470 () Bool)

(assert (=> b!1427437 (=> (not res!962470) (not e!806225))))

(assert (=> b!1427437 (= res!962470 (validKeyInArray!0 (select (arr!46989 a!2831) i!982)))))

(declare-fun b!1427438 () Bool)

(declare-fun res!962458 () Bool)

(assert (=> b!1427438 (=> (not res!962458) (not e!806225))))

(assert (=> b!1427438 (= res!962458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427439 () Bool)

(declare-fun res!962468 () Bool)

(assert (=> b!1427439 (=> (not res!962468) (not e!806228))))

(assert (=> b!1427439 (= res!962468 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46989 a!2831) j!81) a!2831 mask!2608) lt!628569))))

(assert (= (and start!123086 res!962459) b!1427430))

(assert (= (and b!1427430 res!962462) b!1427437))

(assert (= (and b!1427437 res!962470) b!1427428))

(assert (= (and b!1427428 res!962460) b!1427438))

(assert (= (and b!1427438 res!962458) b!1427434))

(assert (= (and b!1427434 res!962467) b!1427435))

(assert (= (and b!1427435 res!962463) b!1427432))

(assert (= (and b!1427432 res!962465) b!1427427))

(assert (= (and b!1427427 res!962466) b!1427439))

(assert (= (and b!1427439 res!962468) b!1427433))

(assert (= (and b!1427433 res!962461) b!1427429))

(assert (= (and b!1427429 res!962464) b!1427431))

(assert (= (and b!1427431 res!962469) b!1427436))

(declare-fun m!1317797 () Bool)

(assert (=> b!1427431 m!1317797))

(declare-fun m!1317799 () Bool)

(assert (=> b!1427431 m!1317799))

(declare-fun m!1317801 () Bool)

(assert (=> start!123086 m!1317801))

(declare-fun m!1317803 () Bool)

(assert (=> start!123086 m!1317803))

(declare-fun m!1317805 () Bool)

(assert (=> b!1427428 m!1317805))

(assert (=> b!1427428 m!1317805))

(declare-fun m!1317807 () Bool)

(assert (=> b!1427428 m!1317807))

(assert (=> b!1427432 m!1317805))

(assert (=> b!1427432 m!1317805))

(declare-fun m!1317809 () Bool)

(assert (=> b!1427432 m!1317809))

(assert (=> b!1427432 m!1317809))

(assert (=> b!1427432 m!1317805))

(declare-fun m!1317811 () Bool)

(assert (=> b!1427432 m!1317811))

(declare-fun m!1317813 () Bool)

(assert (=> b!1427433 m!1317813))

(declare-fun m!1317815 () Bool)

(assert (=> b!1427427 m!1317815))

(assert (=> b!1427427 m!1317815))

(declare-fun m!1317817 () Bool)

(assert (=> b!1427427 m!1317817))

(declare-fun m!1317819 () Bool)

(assert (=> b!1427427 m!1317819))

(declare-fun m!1317821 () Bool)

(assert (=> b!1427427 m!1317821))

(declare-fun m!1317823 () Bool)

(assert (=> b!1427438 m!1317823))

(declare-fun m!1317825 () Bool)

(assert (=> b!1427437 m!1317825))

(assert (=> b!1427437 m!1317825))

(declare-fun m!1317827 () Bool)

(assert (=> b!1427437 m!1317827))

(assert (=> b!1427436 m!1317805))

(assert (=> b!1427436 m!1317805))

(declare-fun m!1317829 () Bool)

(assert (=> b!1427436 m!1317829))

(declare-fun m!1317831 () Bool)

(assert (=> b!1427434 m!1317831))

(assert (=> b!1427439 m!1317805))

(assert (=> b!1427439 m!1317805))

(declare-fun m!1317833 () Bool)

(assert (=> b!1427439 m!1317833))

(check-sat (not start!123086) (not b!1427427) (not b!1427433) (not b!1427437) (not b!1427434) (not b!1427436) (not b!1427428) (not b!1427432) (not b!1427431) (not b!1427439) (not b!1427438))
(check-sat)
