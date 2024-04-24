; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123126 () Bool)

(assert start!123126)

(declare-fun b!1426745 () Bool)

(declare-fun res!961295 () Bool)

(declare-fun e!806252 () Bool)

(assert (=> b!1426745 (=> (not res!961295) (not e!806252))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97362 0))(
  ( (array!97363 (arr!46995 (Array (_ BitVec 32) (_ BitVec 64))) (size!47546 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97362)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426745 (= res!961295 (and (= (size!47546 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47546 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47546 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!961299 () Bool)

(assert (=> start!123126 (=> (not res!961299) (not e!806252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123126 (= res!961299 (validMask!0 mask!2608))))

(assert (=> start!123126 e!806252))

(assert (=> start!123126 true))

(declare-fun array_inv!36276 (array!97362) Bool)

(assert (=> start!123126 (array_inv!36276 a!2831)))

(declare-fun b!1426746 () Bool)

(declare-fun res!961293 () Bool)

(assert (=> b!1426746 (=> (not res!961293) (not e!806252))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426746 (= res!961293 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47546 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47546 a!2831))))))

(declare-fun b!1426747 () Bool)

(declare-fun res!961296 () Bool)

(assert (=> b!1426747 (=> (not res!961296) (not e!806252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97362 (_ BitVec 32)) Bool)

(assert (=> b!1426747 (= res!961296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426748 () Bool)

(assert (=> b!1426748 (= e!806252 false)))

(declare-fun lt!628328 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426748 (= lt!628328 (toIndex!0 (select (store (arr!46995 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1426749 () Bool)

(declare-fun res!961297 () Bool)

(assert (=> b!1426749 (=> (not res!961297) (not e!806252))))

(declare-datatypes ((SeekEntryResult!11176 0))(
  ( (MissingZero!11176 (index!47096 (_ BitVec 32))) (Found!11176 (index!47097 (_ BitVec 32))) (Intermediate!11176 (undefined!11988 Bool) (index!47098 (_ BitVec 32)) (x!128891 (_ BitVec 32))) (Undefined!11176) (MissingVacant!11176 (index!47099 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97362 (_ BitVec 32)) SeekEntryResult!11176)

(assert (=> b!1426749 (= res!961297 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46995 a!2831) j!81) mask!2608) (select (arr!46995 a!2831) j!81) a!2831 mask!2608) (Intermediate!11176 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1426750 () Bool)

(declare-fun res!961300 () Bool)

(assert (=> b!1426750 (=> (not res!961300) (not e!806252))))

(declare-datatypes ((List!33492 0))(
  ( (Nil!33489) (Cons!33488 (h!34801 (_ BitVec 64)) (t!48178 List!33492)) )
))
(declare-fun arrayNoDuplicates!0 (array!97362 (_ BitVec 32) List!33492) Bool)

(assert (=> b!1426750 (= res!961300 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33489))))

(declare-fun b!1426751 () Bool)

(declare-fun res!961294 () Bool)

(assert (=> b!1426751 (=> (not res!961294) (not e!806252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426751 (= res!961294 (validKeyInArray!0 (select (arr!46995 a!2831) i!982)))))

(declare-fun b!1426752 () Bool)

(declare-fun res!961298 () Bool)

(assert (=> b!1426752 (=> (not res!961298) (not e!806252))))

(assert (=> b!1426752 (= res!961298 (validKeyInArray!0 (select (arr!46995 a!2831) j!81)))))

(assert (= (and start!123126 res!961299) b!1426745))

(assert (= (and b!1426745 res!961295) b!1426751))

(assert (= (and b!1426751 res!961294) b!1426752))

(assert (= (and b!1426752 res!961298) b!1426747))

(assert (= (and b!1426747 res!961296) b!1426750))

(assert (= (and b!1426750 res!961300) b!1426746))

(assert (= (and b!1426746 res!961293) b!1426749))

(assert (= (and b!1426749 res!961297) b!1426748))

(declare-fun m!1317421 () Bool)

(assert (=> b!1426750 m!1317421))

(declare-fun m!1317423 () Bool)

(assert (=> b!1426752 m!1317423))

(assert (=> b!1426752 m!1317423))

(declare-fun m!1317425 () Bool)

(assert (=> b!1426752 m!1317425))

(declare-fun m!1317427 () Bool)

(assert (=> b!1426747 m!1317427))

(declare-fun m!1317429 () Bool)

(assert (=> b!1426748 m!1317429))

(declare-fun m!1317431 () Bool)

(assert (=> b!1426748 m!1317431))

(assert (=> b!1426748 m!1317431))

(declare-fun m!1317433 () Bool)

(assert (=> b!1426748 m!1317433))

(declare-fun m!1317435 () Bool)

(assert (=> start!123126 m!1317435))

(declare-fun m!1317437 () Bool)

(assert (=> start!123126 m!1317437))

(declare-fun m!1317439 () Bool)

(assert (=> b!1426751 m!1317439))

(assert (=> b!1426751 m!1317439))

(declare-fun m!1317441 () Bool)

(assert (=> b!1426751 m!1317441))

(assert (=> b!1426749 m!1317423))

(assert (=> b!1426749 m!1317423))

(declare-fun m!1317443 () Bool)

(assert (=> b!1426749 m!1317443))

(assert (=> b!1426749 m!1317443))

(assert (=> b!1426749 m!1317423))

(declare-fun m!1317445 () Bool)

(assert (=> b!1426749 m!1317445))

(push 1)

(assert (not start!123126))

(assert (not b!1426747))

(assert (not b!1426751))

(assert (not b!1426752))

(assert (not b!1426748))

(assert (not b!1426750))

(assert (not b!1426749))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

