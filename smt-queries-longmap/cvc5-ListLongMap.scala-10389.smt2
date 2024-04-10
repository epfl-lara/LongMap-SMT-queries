; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122376 () Bool)

(assert start!122376)

(declare-fun b!1418370 () Bool)

(declare-fun res!954015 () Bool)

(declare-fun e!802675 () Bool)

(assert (=> b!1418370 (=> (not res!954015) (not e!802675))))

(declare-datatypes ((array!96852 0))(
  ( (array!96853 (arr!46748 (Array (_ BitVec 32) (_ BitVec 64))) (size!47298 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96852)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418370 (= res!954015 (validKeyInArray!0 (select (arr!46748 a!2831) j!81)))))

(declare-fun b!1418371 () Bool)

(declare-fun res!954012 () Bool)

(assert (=> b!1418371 (=> (not res!954012) (not e!802675))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418371 (= res!954012 (and (= (size!47298 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47298 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47298 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418372 () Bool)

(declare-fun res!954013 () Bool)

(assert (=> b!1418372 (=> (not res!954013) (not e!802675))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418372 (= res!954013 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47298 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47298 a!2831))))))

(declare-fun res!954016 () Bool)

(assert (=> start!122376 (=> (not res!954016) (not e!802675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122376 (= res!954016 (validMask!0 mask!2608))))

(assert (=> start!122376 e!802675))

(assert (=> start!122376 true))

(declare-fun array_inv!35776 (array!96852) Bool)

(assert (=> start!122376 (array_inv!35776 a!2831)))

(declare-fun b!1418373 () Bool)

(declare-fun res!954010 () Bool)

(assert (=> b!1418373 (=> (not res!954010) (not e!802675))))

(declare-datatypes ((List!33258 0))(
  ( (Nil!33255) (Cons!33254 (h!34547 (_ BitVec 64)) (t!47952 List!33258)) )
))
(declare-fun arrayNoDuplicates!0 (array!96852 (_ BitVec 32) List!33258) Bool)

(assert (=> b!1418373 (= res!954010 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33255))))

(declare-fun b!1418374 () Bool)

(declare-fun res!954014 () Bool)

(assert (=> b!1418374 (=> (not res!954014) (not e!802675))))

(assert (=> b!1418374 (= res!954014 (validKeyInArray!0 (select (arr!46748 a!2831) i!982)))))

(declare-fun b!1418375 () Bool)

(declare-fun res!954011 () Bool)

(assert (=> b!1418375 (=> (not res!954011) (not e!802675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96852 (_ BitVec 32)) Bool)

(assert (=> b!1418375 (= res!954011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418376 () Bool)

(assert (=> b!1418376 (= e!802675 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun lt!625572 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418376 (= lt!625572 (toIndex!0 (select (arr!46748 a!2831) j!81) mask!2608))))

(assert (= (and start!122376 res!954016) b!1418371))

(assert (= (and b!1418371 res!954012) b!1418374))

(assert (= (and b!1418374 res!954014) b!1418370))

(assert (= (and b!1418370 res!954015) b!1418375))

(assert (= (and b!1418375 res!954011) b!1418373))

(assert (= (and b!1418373 res!954010) b!1418372))

(assert (= (and b!1418372 res!954013) b!1418376))

(declare-fun m!1309065 () Bool)

(assert (=> b!1418370 m!1309065))

(assert (=> b!1418370 m!1309065))

(declare-fun m!1309067 () Bool)

(assert (=> b!1418370 m!1309067))

(declare-fun m!1309069 () Bool)

(assert (=> b!1418375 m!1309069))

(assert (=> b!1418376 m!1309065))

(assert (=> b!1418376 m!1309065))

(declare-fun m!1309071 () Bool)

(assert (=> b!1418376 m!1309071))

(declare-fun m!1309073 () Bool)

(assert (=> b!1418373 m!1309073))

(declare-fun m!1309075 () Bool)

(assert (=> start!122376 m!1309075))

(declare-fun m!1309077 () Bool)

(assert (=> start!122376 m!1309077))

(declare-fun m!1309079 () Bool)

(assert (=> b!1418374 m!1309079))

(assert (=> b!1418374 m!1309079))

(declare-fun m!1309081 () Bool)

(assert (=> b!1418374 m!1309081))

(push 1)

(assert (not b!1418375))

(assert (not b!1418370))

(assert (not b!1418376))

(assert (not b!1418374))

(assert (not b!1418373))

(assert (not start!122376))

(check-sat)

