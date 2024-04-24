; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123152 () Bool)

(assert start!123152)

(declare-fun b!1427088 () Bool)

(declare-fun res!961639 () Bool)

(declare-fun e!806335 () Bool)

(assert (=> b!1427088 (=> (not res!961639) (not e!806335))))

(declare-datatypes ((array!97388 0))(
  ( (array!97389 (arr!47008 (Array (_ BitVec 32) (_ BitVec 64))) (size!47559 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97388)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97388 (_ BitVec 32)) Bool)

(assert (=> b!1427088 (= res!961639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427089 () Bool)

(declare-fun e!806336 () Bool)

(declare-fun e!806333 () Bool)

(assert (=> b!1427089 (= e!806336 e!806333)))

(declare-fun res!961640 () Bool)

(assert (=> b!1427089 (=> (not res!961640) (not e!806333))))

(declare-fun lt!628376 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun lt!628373 () array!97388)

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11189 0))(
  ( (MissingZero!11189 (index!47148 (_ BitVec 32))) (Found!11189 (index!47149 (_ BitVec 32))) (Intermediate!11189 (undefined!12001 Bool) (index!47150 (_ BitVec 32)) (x!128944 (_ BitVec 32))) (Undefined!11189) (MissingVacant!11189 (index!47151 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97388 (_ BitVec 32)) SeekEntryResult!11189)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427089 (= res!961640 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628376 mask!2608) lt!628376 lt!628373 mask!2608) (Intermediate!11189 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427089 (= lt!628376 (select (store (arr!47008 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427089 (= lt!628373 (array!97389 (store (arr!47008 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47559 a!2831)))))

(declare-fun b!1427090 () Bool)

(declare-fun res!961644 () Bool)

(assert (=> b!1427090 (=> (not res!961644) (not e!806335))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427090 (= res!961644 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47559 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47559 a!2831))))))

(declare-fun b!1427091 () Bool)

(declare-fun res!961641 () Bool)

(assert (=> b!1427091 (=> (not res!961641) (not e!806333))))

(declare-fun lt!628375 () SeekEntryResult!11189)

(assert (=> b!1427091 (= res!961641 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47008 a!2831) j!81) a!2831 mask!2608) lt!628375))))

(declare-fun b!1427092 () Bool)

(declare-fun res!961636 () Bool)

(assert (=> b!1427092 (=> (not res!961636) (not e!806335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427092 (= res!961636 (validKeyInArray!0 (select (arr!47008 a!2831) i!982)))))

(declare-fun b!1427093 () Bool)

(declare-fun res!961643 () Bool)

(assert (=> b!1427093 (=> (not res!961643) (not e!806335))))

(assert (=> b!1427093 (= res!961643 (validKeyInArray!0 (select (arr!47008 a!2831) j!81)))))

(declare-fun b!1427094 () Bool)

(assert (=> b!1427094 (= e!806333 false)))

(declare-fun lt!628374 () SeekEntryResult!11189)

(assert (=> b!1427094 (= lt!628374 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628376 lt!628373 mask!2608))))

(declare-fun res!961638 () Bool)

(assert (=> start!123152 (=> (not res!961638) (not e!806335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123152 (= res!961638 (validMask!0 mask!2608))))

(assert (=> start!123152 e!806335))

(assert (=> start!123152 true))

(declare-fun array_inv!36289 (array!97388) Bool)

(assert (=> start!123152 (array_inv!36289 a!2831)))

(declare-fun b!1427095 () Bool)

(declare-fun res!961642 () Bool)

(assert (=> b!1427095 (=> (not res!961642) (not e!806335))))

(declare-datatypes ((List!33505 0))(
  ( (Nil!33502) (Cons!33501 (h!34814 (_ BitVec 64)) (t!48191 List!33505)) )
))
(declare-fun arrayNoDuplicates!0 (array!97388 (_ BitVec 32) List!33505) Bool)

(assert (=> b!1427095 (= res!961642 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33502))))

(declare-fun b!1427096 () Bool)

(declare-fun res!961637 () Bool)

(assert (=> b!1427096 (=> (not res!961637) (not e!806335))))

(assert (=> b!1427096 (= res!961637 (and (= (size!47559 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47559 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47559 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427097 () Bool)

(assert (=> b!1427097 (= e!806335 e!806336)))

(declare-fun res!961645 () Bool)

(assert (=> b!1427097 (=> (not res!961645) (not e!806336))))

(assert (=> b!1427097 (= res!961645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47008 a!2831) j!81) mask!2608) (select (arr!47008 a!2831) j!81) a!2831 mask!2608) lt!628375))))

(assert (=> b!1427097 (= lt!628375 (Intermediate!11189 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123152 res!961638) b!1427096))

(assert (= (and b!1427096 res!961637) b!1427092))

(assert (= (and b!1427092 res!961636) b!1427093))

(assert (= (and b!1427093 res!961643) b!1427088))

(assert (= (and b!1427088 res!961639) b!1427095))

(assert (= (and b!1427095 res!961642) b!1427090))

(assert (= (and b!1427090 res!961644) b!1427097))

(assert (= (and b!1427097 res!961645) b!1427089))

(assert (= (and b!1427089 res!961640) b!1427091))

(assert (= (and b!1427091 res!961641) b!1427094))

(declare-fun m!1317801 () Bool)

(assert (=> b!1427094 m!1317801))

(declare-fun m!1317803 () Bool)

(assert (=> b!1427091 m!1317803))

(assert (=> b!1427091 m!1317803))

(declare-fun m!1317805 () Bool)

(assert (=> b!1427091 m!1317805))

(assert (=> b!1427097 m!1317803))

(assert (=> b!1427097 m!1317803))

(declare-fun m!1317807 () Bool)

(assert (=> b!1427097 m!1317807))

(assert (=> b!1427097 m!1317807))

(assert (=> b!1427097 m!1317803))

(declare-fun m!1317809 () Bool)

(assert (=> b!1427097 m!1317809))

(declare-fun m!1317811 () Bool)

(assert (=> b!1427088 m!1317811))

(declare-fun m!1317813 () Bool)

(assert (=> b!1427092 m!1317813))

(assert (=> b!1427092 m!1317813))

(declare-fun m!1317815 () Bool)

(assert (=> b!1427092 m!1317815))

(declare-fun m!1317817 () Bool)

(assert (=> b!1427095 m!1317817))

(declare-fun m!1317819 () Bool)

(assert (=> b!1427089 m!1317819))

(assert (=> b!1427089 m!1317819))

(declare-fun m!1317821 () Bool)

(assert (=> b!1427089 m!1317821))

(declare-fun m!1317823 () Bool)

(assert (=> b!1427089 m!1317823))

(declare-fun m!1317825 () Bool)

(assert (=> b!1427089 m!1317825))

(declare-fun m!1317827 () Bool)

(assert (=> start!123152 m!1317827))

(declare-fun m!1317829 () Bool)

(assert (=> start!123152 m!1317829))

(assert (=> b!1427093 m!1317803))

(assert (=> b!1427093 m!1317803))

(declare-fun m!1317831 () Bool)

(assert (=> b!1427093 m!1317831))

(check-sat (not b!1427097) (not b!1427091) (not b!1427095) (not start!123152) (not b!1427093) (not b!1427094) (not b!1427088) (not b!1427092) (not b!1427089))
(check-sat)
