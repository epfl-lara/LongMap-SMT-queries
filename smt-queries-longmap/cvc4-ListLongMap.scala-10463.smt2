; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122944 () Bool)

(assert start!122944)

(declare-fun b!1426167 () Bool)

(declare-fun res!961601 () Bool)

(declare-fun e!805613 () Bool)

(assert (=> b!1426167 (=> (not res!961601) (not e!805613))))

(declare-datatypes ((array!97309 0))(
  ( (array!97310 (arr!46972 (Array (_ BitVec 32) (_ BitVec 64))) (size!47522 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97309)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426167 (= res!961601 (validKeyInArray!0 (select (arr!46972 a!2831) j!81)))))

(declare-fun b!1426168 () Bool)

(declare-fun res!961609 () Bool)

(assert (=> b!1426168 (=> (not res!961609) (not e!805613))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1426168 (= res!961609 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47522 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47522 a!2831))))))

(declare-fun b!1426169 () Bool)

(declare-fun res!961604 () Bool)

(assert (=> b!1426169 (=> (not res!961604) (not e!805613))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1426169 (= res!961604 (and (= (size!47522 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47522 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47522 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426170 () Bool)

(declare-fun res!961608 () Bool)

(assert (=> b!1426170 (=> (not res!961608) (not e!805613))))

(declare-datatypes ((List!33482 0))(
  ( (Nil!33479) (Cons!33478 (h!34780 (_ BitVec 64)) (t!48176 List!33482)) )
))
(declare-fun arrayNoDuplicates!0 (array!97309 (_ BitVec 32) List!33482) Bool)

(assert (=> b!1426170 (= res!961608 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33479))))

(declare-fun b!1426171 () Bool)

(declare-fun res!961600 () Bool)

(assert (=> b!1426171 (=> (not res!961600) (not e!805613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97309 (_ BitVec 32)) Bool)

(assert (=> b!1426171 (= res!961600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426172 () Bool)

(declare-fun e!805611 () Bool)

(declare-fun e!805610 () Bool)

(assert (=> b!1426172 (= e!805611 e!805610)))

(declare-fun res!961606 () Bool)

(assert (=> b!1426172 (=> (not res!961606) (not e!805610))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!628048 () array!97309)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun lt!628050 () (_ BitVec 64))

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11251 0))(
  ( (MissingZero!11251 (index!47396 (_ BitVec 32))) (Found!11251 (index!47397 (_ BitVec 32))) (Intermediate!11251 (undefined!12063 Bool) (index!47398 (_ BitVec 32)) (x!129021 (_ BitVec 32))) (Undefined!11251) (MissingVacant!11251 (index!47399 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97309 (_ BitVec 32)) SeekEntryResult!11251)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426172 (= res!961606 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628050 mask!2608) lt!628050 lt!628048 mask!2608) (Intermediate!11251 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1426172 (= lt!628050 (select (store (arr!46972 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426172 (= lt!628048 (array!97310 (store (arr!46972 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47522 a!2831)))))

(declare-fun res!961602 () Bool)

(assert (=> start!122944 (=> (not res!961602) (not e!805613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122944 (= res!961602 (validMask!0 mask!2608))))

(assert (=> start!122944 e!805613))

(assert (=> start!122944 true))

(declare-fun array_inv!36000 (array!97309) Bool)

(assert (=> start!122944 (array_inv!36000 a!2831)))

(declare-fun b!1426173 () Bool)

(declare-fun res!961605 () Bool)

(assert (=> b!1426173 (=> (not res!961605) (not e!805613))))

(assert (=> b!1426173 (= res!961605 (validKeyInArray!0 (select (arr!46972 a!2831) i!982)))))

(declare-fun b!1426174 () Bool)

(declare-fun res!961607 () Bool)

(assert (=> b!1426174 (=> (not res!961607) (not e!805610))))

(declare-fun lt!628049 () SeekEntryResult!11251)

(assert (=> b!1426174 (= res!961607 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46972 a!2831) j!81) a!2831 mask!2608) lt!628049))))

(declare-fun b!1426175 () Bool)

(assert (=> b!1426175 (= e!805613 e!805611)))

(declare-fun res!961603 () Bool)

(assert (=> b!1426175 (=> (not res!961603) (not e!805611))))

(assert (=> b!1426175 (= res!961603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46972 a!2831) j!81) mask!2608) (select (arr!46972 a!2831) j!81) a!2831 mask!2608) lt!628049))))

(assert (=> b!1426175 (= lt!628049 (Intermediate!11251 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426176 () Bool)

(assert (=> b!1426176 (= e!805610 false)))

(declare-fun lt!628047 () SeekEntryResult!11251)

(assert (=> b!1426176 (= lt!628047 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628050 lt!628048 mask!2608))))

(assert (= (and start!122944 res!961602) b!1426169))

(assert (= (and b!1426169 res!961604) b!1426173))

(assert (= (and b!1426173 res!961605) b!1426167))

(assert (= (and b!1426167 res!961601) b!1426171))

(assert (= (and b!1426171 res!961600) b!1426170))

(assert (= (and b!1426170 res!961608) b!1426168))

(assert (= (and b!1426168 res!961609) b!1426175))

(assert (= (and b!1426175 res!961603) b!1426172))

(assert (= (and b!1426172 res!961606) b!1426174))

(assert (= (and b!1426174 res!961607) b!1426176))

(declare-fun m!1316779 () Bool)

(assert (=> b!1426170 m!1316779))

(declare-fun m!1316781 () Bool)

(assert (=> b!1426167 m!1316781))

(assert (=> b!1426167 m!1316781))

(declare-fun m!1316783 () Bool)

(assert (=> b!1426167 m!1316783))

(assert (=> b!1426174 m!1316781))

(assert (=> b!1426174 m!1316781))

(declare-fun m!1316785 () Bool)

(assert (=> b!1426174 m!1316785))

(declare-fun m!1316787 () Bool)

(assert (=> b!1426176 m!1316787))

(declare-fun m!1316789 () Bool)

(assert (=> start!122944 m!1316789))

(declare-fun m!1316791 () Bool)

(assert (=> start!122944 m!1316791))

(declare-fun m!1316793 () Bool)

(assert (=> b!1426172 m!1316793))

(assert (=> b!1426172 m!1316793))

(declare-fun m!1316795 () Bool)

(assert (=> b!1426172 m!1316795))

(declare-fun m!1316797 () Bool)

(assert (=> b!1426172 m!1316797))

(declare-fun m!1316799 () Bool)

(assert (=> b!1426172 m!1316799))

(declare-fun m!1316801 () Bool)

(assert (=> b!1426171 m!1316801))

(assert (=> b!1426175 m!1316781))

(assert (=> b!1426175 m!1316781))

(declare-fun m!1316803 () Bool)

(assert (=> b!1426175 m!1316803))

(assert (=> b!1426175 m!1316803))

(assert (=> b!1426175 m!1316781))

(declare-fun m!1316805 () Bool)

(assert (=> b!1426175 m!1316805))

(declare-fun m!1316807 () Bool)

(assert (=> b!1426173 m!1316807))

(assert (=> b!1426173 m!1316807))

(declare-fun m!1316809 () Bool)

(assert (=> b!1426173 m!1316809))

(push 1)

(assert (not b!1426175))

(assert (not b!1426172))

(assert (not b!1426171))

(assert (not b!1426176))

