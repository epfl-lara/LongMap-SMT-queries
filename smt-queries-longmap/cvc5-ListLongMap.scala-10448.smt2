; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123096 () Bool)

(assert start!123096)

(declare-fun b!1426413 () Bool)

(declare-fun res!960961 () Bool)

(declare-fun e!806162 () Bool)

(assert (=> b!1426413 (=> (not res!960961) (not e!806162))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97332 0))(
  ( (array!97333 (arr!46980 (Array (_ BitVec 32) (_ BitVec 64))) (size!47531 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97332)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426413 (= res!960961 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47531 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47531 a!2831))))))

(declare-fun b!1426414 () Bool)

(declare-fun res!960965 () Bool)

(assert (=> b!1426414 (=> (not res!960965) (not e!806162))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426414 (= res!960965 (and (= (size!47531 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47531 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47531 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426415 () Bool)

(declare-fun res!960963 () Bool)

(assert (=> b!1426415 (=> (not res!960963) (not e!806162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426415 (= res!960963 (validKeyInArray!0 (select (arr!46980 a!2831) j!81)))))

(declare-fun b!1426416 () Bool)

(declare-fun res!960962 () Bool)

(assert (=> b!1426416 (=> (not res!960962) (not e!806162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97332 (_ BitVec 32)) Bool)

(assert (=> b!1426416 (= res!960962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426417 () Bool)

(assert (=> b!1426417 (= e!806162 false)))

(declare-fun lt!628283 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426417 (= lt!628283 (toIndex!0 (select (arr!46980 a!2831) j!81) mask!2608))))

(declare-fun res!960964 () Bool)

(assert (=> start!123096 (=> (not res!960964) (not e!806162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123096 (= res!960964 (validMask!0 mask!2608))))

(assert (=> start!123096 e!806162))

(assert (=> start!123096 true))

(declare-fun array_inv!36261 (array!97332) Bool)

(assert (=> start!123096 (array_inv!36261 a!2831)))

(declare-fun b!1426418 () Bool)

(declare-fun res!960967 () Bool)

(assert (=> b!1426418 (=> (not res!960967) (not e!806162))))

(assert (=> b!1426418 (= res!960967 (validKeyInArray!0 (select (arr!46980 a!2831) i!982)))))

(declare-fun b!1426419 () Bool)

(declare-fun res!960966 () Bool)

(assert (=> b!1426419 (=> (not res!960966) (not e!806162))))

(declare-datatypes ((List!33477 0))(
  ( (Nil!33474) (Cons!33473 (h!34786 (_ BitVec 64)) (t!48163 List!33477)) )
))
(declare-fun arrayNoDuplicates!0 (array!97332 (_ BitVec 32) List!33477) Bool)

(assert (=> b!1426419 (= res!960966 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33474))))

(assert (= (and start!123096 res!960964) b!1426414))

(assert (= (and b!1426414 res!960965) b!1426418))

(assert (= (and b!1426418 res!960967) b!1426415))

(assert (= (and b!1426415 res!960963) b!1426416))

(assert (= (and b!1426416 res!960962) b!1426419))

(assert (= (and b!1426419 res!960966) b!1426413))

(assert (= (and b!1426413 res!960961) b!1426417))

(declare-fun m!1317093 () Bool)

(assert (=> start!123096 m!1317093))

(declare-fun m!1317095 () Bool)

(assert (=> start!123096 m!1317095))

(declare-fun m!1317097 () Bool)

(assert (=> b!1426418 m!1317097))

(assert (=> b!1426418 m!1317097))

(declare-fun m!1317099 () Bool)

(assert (=> b!1426418 m!1317099))

(declare-fun m!1317101 () Bool)

(assert (=> b!1426415 m!1317101))

(assert (=> b!1426415 m!1317101))

(declare-fun m!1317103 () Bool)

(assert (=> b!1426415 m!1317103))

(assert (=> b!1426417 m!1317101))

(assert (=> b!1426417 m!1317101))

(declare-fun m!1317105 () Bool)

(assert (=> b!1426417 m!1317105))

(declare-fun m!1317107 () Bool)

(assert (=> b!1426419 m!1317107))

(declare-fun m!1317109 () Bool)

(assert (=> b!1426416 m!1317109))

(push 1)

(assert (not start!123096))

(assert (not b!1426416))

(assert (not b!1426417))

(assert (not b!1426419))

(assert (not b!1426415))

(assert (not b!1426418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

