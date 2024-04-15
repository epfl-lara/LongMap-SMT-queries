; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122874 () Bool)

(assert start!122874)

(declare-fun res!960634 () Bool)

(declare-fun e!805268 () Bool)

(assert (=> start!122874 (=> (not res!960634) (not e!805268))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122874 (= res!960634 (validMask!0 mask!2608))))

(assert (=> start!122874 e!805268))

(assert (=> start!122874 true))

(declare-datatypes ((array!97192 0))(
  ( (array!97193 (arr!46914 (Array (_ BitVec 32) (_ BitVec 64))) (size!47466 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97192)

(declare-fun array_inv!36147 (array!97192) Bool)

(assert (=> start!122874 (array_inv!36147 a!2831)))

(declare-fun b!1425143 () Bool)

(declare-fun res!960632 () Bool)

(assert (=> b!1425143 (=> (not res!960632) (not e!805268))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425143 (= res!960632 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47466 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47466 a!2831))))))

(declare-fun b!1425144 () Bool)

(assert (=> b!1425144 (= e!805268 false)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun lt!627599 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425144 (= lt!627599 (toIndex!0 (select (store (arr!46914 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1425145 () Bool)

(declare-fun res!960629 () Bool)

(assert (=> b!1425145 (=> (not res!960629) (not e!805268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425145 (= res!960629 (validKeyInArray!0 (select (arr!46914 a!2831) j!81)))))

(declare-fun b!1425146 () Bool)

(declare-fun res!960633 () Bool)

(assert (=> b!1425146 (=> (not res!960633) (not e!805268))))

(declare-datatypes ((List!33502 0))(
  ( (Nil!33499) (Cons!33498 (h!34800 (_ BitVec 64)) (t!48188 List!33502)) )
))
(declare-fun arrayNoDuplicates!0 (array!97192 (_ BitVec 32) List!33502) Bool)

(assert (=> b!1425146 (= res!960633 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33499))))

(declare-fun b!1425147 () Bool)

(declare-fun res!960630 () Bool)

(assert (=> b!1425147 (=> (not res!960630) (not e!805268))))

(assert (=> b!1425147 (= res!960630 (and (= (size!47466 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47466 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47466 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425148 () Bool)

(declare-fun res!960627 () Bool)

(assert (=> b!1425148 (=> (not res!960627) (not e!805268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97192 (_ BitVec 32)) Bool)

(assert (=> b!1425148 (= res!960627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425149 () Bool)

(declare-fun res!960631 () Bool)

(assert (=> b!1425149 (=> (not res!960631) (not e!805268))))

(assert (=> b!1425149 (= res!960631 (validKeyInArray!0 (select (arr!46914 a!2831) i!982)))))

(declare-fun b!1425150 () Bool)

(declare-fun res!960628 () Bool)

(assert (=> b!1425150 (=> (not res!960628) (not e!805268))))

(declare-datatypes ((SeekEntryResult!11220 0))(
  ( (MissingZero!11220 (index!47272 (_ BitVec 32))) (Found!11220 (index!47273 (_ BitVec 32))) (Intermediate!11220 (undefined!12032 Bool) (index!47274 (_ BitVec 32)) (x!128899 (_ BitVec 32))) (Undefined!11220) (MissingVacant!11220 (index!47275 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97192 (_ BitVec 32)) SeekEntryResult!11220)

(assert (=> b!1425150 (= res!960628 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46914 a!2831) j!81) mask!2608) (select (arr!46914 a!2831) j!81) a!2831 mask!2608) (Intermediate!11220 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122874 res!960634) b!1425147))

(assert (= (and b!1425147 res!960630) b!1425149))

(assert (= (and b!1425149 res!960631) b!1425145))

(assert (= (and b!1425145 res!960629) b!1425148))

(assert (= (and b!1425148 res!960627) b!1425146))

(assert (= (and b!1425146 res!960633) b!1425143))

(assert (= (and b!1425143 res!960632) b!1425150))

(assert (= (and b!1425150 res!960628) b!1425144))

(declare-fun m!1315225 () Bool)

(assert (=> b!1425150 m!1315225))

(assert (=> b!1425150 m!1315225))

(declare-fun m!1315227 () Bool)

(assert (=> b!1425150 m!1315227))

(assert (=> b!1425150 m!1315227))

(assert (=> b!1425150 m!1315225))

(declare-fun m!1315229 () Bool)

(assert (=> b!1425150 m!1315229))

(declare-fun m!1315231 () Bool)

(assert (=> start!122874 m!1315231))

(declare-fun m!1315233 () Bool)

(assert (=> start!122874 m!1315233))

(assert (=> b!1425145 m!1315225))

(assert (=> b!1425145 m!1315225))

(declare-fun m!1315235 () Bool)

(assert (=> b!1425145 m!1315235))

(declare-fun m!1315237 () Bool)

(assert (=> b!1425146 m!1315237))

(declare-fun m!1315239 () Bool)

(assert (=> b!1425149 m!1315239))

(assert (=> b!1425149 m!1315239))

(declare-fun m!1315241 () Bool)

(assert (=> b!1425149 m!1315241))

(declare-fun m!1315243 () Bool)

(assert (=> b!1425144 m!1315243))

(declare-fun m!1315245 () Bool)

(assert (=> b!1425144 m!1315245))

(assert (=> b!1425144 m!1315245))

(declare-fun m!1315247 () Bool)

(assert (=> b!1425144 m!1315247))

(declare-fun m!1315249 () Bool)

(assert (=> b!1425148 m!1315249))

(push 1)

(assert (not b!1425149))

(assert (not start!122874))

(assert (not b!1425148))

(assert (not b!1425145))

(assert (not b!1425144))

(assert (not b!1425150))

(assert (not b!1425146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

