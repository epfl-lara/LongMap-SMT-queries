; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123108 () Bool)

(assert start!123108)

(declare-fun b!1426539 () Bool)

(declare-fun res!961087 () Bool)

(declare-fun e!806198 () Bool)

(assert (=> b!1426539 (=> (not res!961087) (not e!806198))))

(declare-datatypes ((array!97344 0))(
  ( (array!97345 (arr!46986 (Array (_ BitVec 32) (_ BitVec 64))) (size!47537 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97344)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426539 (= res!961087 (validKeyInArray!0 (select (arr!46986 a!2831) i!982)))))

(declare-fun b!1426540 () Bool)

(declare-fun res!961090 () Bool)

(assert (=> b!1426540 (=> (not res!961090) (not e!806198))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97344 (_ BitVec 32)) Bool)

(assert (=> b!1426540 (= res!961090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426541 () Bool)

(declare-fun res!961091 () Bool)

(assert (=> b!1426541 (=> (not res!961091) (not e!806198))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1426541 (= res!961091 (and (= (size!47537 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47537 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47537 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426542 () Bool)

(declare-fun res!961089 () Bool)

(assert (=> b!1426542 (=> (not res!961089) (not e!806198))))

(assert (=> b!1426542 (= res!961089 (validKeyInArray!0 (select (arr!46986 a!2831) j!81)))))

(declare-fun b!1426543 () Bool)

(declare-fun res!961092 () Bool)

(assert (=> b!1426543 (=> (not res!961092) (not e!806198))))

(declare-datatypes ((List!33483 0))(
  ( (Nil!33480) (Cons!33479 (h!34792 (_ BitVec 64)) (t!48169 List!33483)) )
))
(declare-fun arrayNoDuplicates!0 (array!97344 (_ BitVec 32) List!33483) Bool)

(assert (=> b!1426543 (= res!961092 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33480))))

(declare-fun res!961088 () Bool)

(assert (=> start!123108 (=> (not res!961088) (not e!806198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123108 (= res!961088 (validMask!0 mask!2608))))

(assert (=> start!123108 e!806198))

(assert (=> start!123108 true))

(declare-fun array_inv!36267 (array!97344) Bool)

(assert (=> start!123108 (array_inv!36267 a!2831)))

(declare-fun b!1426544 () Bool)

(declare-fun res!961093 () Bool)

(assert (=> b!1426544 (=> (not res!961093) (not e!806198))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1426544 (= res!961093 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47537 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47537 a!2831))))))

(declare-fun b!1426545 () Bool)

(assert (=> b!1426545 (= e!806198 false)))

(declare-datatypes ((SeekEntryResult!11167 0))(
  ( (MissingZero!11167 (index!47060 (_ BitVec 32))) (Found!11167 (index!47061 (_ BitVec 32))) (Intermediate!11167 (undefined!11979 Bool) (index!47062 (_ BitVec 32)) (x!128858 (_ BitVec 32))) (Undefined!11167) (MissingVacant!11167 (index!47063 (_ BitVec 32))) )
))
(declare-fun lt!628301 () SeekEntryResult!11167)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97344 (_ BitVec 32)) SeekEntryResult!11167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426545 (= lt!628301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46986 a!2831) j!81) mask!2608) (select (arr!46986 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and start!123108 res!961088) b!1426541))

(assert (= (and b!1426541 res!961091) b!1426539))

(assert (= (and b!1426539 res!961087) b!1426542))

(assert (= (and b!1426542 res!961089) b!1426540))

(assert (= (and b!1426540 res!961090) b!1426543))

(assert (= (and b!1426543 res!961092) b!1426544))

(assert (= (and b!1426544 res!961093) b!1426545))

(declare-fun m!1317211 () Bool)

(assert (=> b!1426540 m!1317211))

(declare-fun m!1317213 () Bool)

(assert (=> start!123108 m!1317213))

(declare-fun m!1317215 () Bool)

(assert (=> start!123108 m!1317215))

(declare-fun m!1317217 () Bool)

(assert (=> b!1426545 m!1317217))

(assert (=> b!1426545 m!1317217))

(declare-fun m!1317219 () Bool)

(assert (=> b!1426545 m!1317219))

(assert (=> b!1426545 m!1317219))

(assert (=> b!1426545 m!1317217))

(declare-fun m!1317221 () Bool)

(assert (=> b!1426545 m!1317221))

(assert (=> b!1426542 m!1317217))

(assert (=> b!1426542 m!1317217))

(declare-fun m!1317223 () Bool)

(assert (=> b!1426542 m!1317223))

(declare-fun m!1317225 () Bool)

(assert (=> b!1426539 m!1317225))

(assert (=> b!1426539 m!1317225))

(declare-fun m!1317227 () Bool)

(assert (=> b!1426539 m!1317227))

(declare-fun m!1317229 () Bool)

(assert (=> b!1426543 m!1317229))

(push 1)

(assert (not b!1426545))

(assert (not start!123108))

(assert (not b!1426540))

(assert (not b!1426539))

(assert (not b!1426543))

(assert (not b!1426542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

