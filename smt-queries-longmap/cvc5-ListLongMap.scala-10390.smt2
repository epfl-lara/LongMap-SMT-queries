; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122382 () Bool)

(assert start!122382)

(declare-fun b!1418433 () Bool)

(declare-fun res!954078 () Bool)

(declare-fun e!802693 () Bool)

(assert (=> b!1418433 (=> (not res!954078) (not e!802693))))

(declare-datatypes ((array!96858 0))(
  ( (array!96859 (arr!46751 (Array (_ BitVec 32) (_ BitVec 64))) (size!47301 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96858)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96858 (_ BitVec 32)) Bool)

(assert (=> b!1418433 (= res!954078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418434 () Bool)

(assert (=> b!1418434 (= e!802693 false)))

(declare-fun lt!625581 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418434 (= lt!625581 (toIndex!0 (select (arr!46751 a!2831) j!81) mask!2608))))

(declare-fun b!1418435 () Bool)

(declare-fun res!954074 () Bool)

(assert (=> b!1418435 (=> (not res!954074) (not e!802693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418435 (= res!954074 (validKeyInArray!0 (select (arr!46751 a!2831) j!81)))))

(declare-fun b!1418436 () Bool)

(declare-fun res!954079 () Bool)

(assert (=> b!1418436 (=> (not res!954079) (not e!802693))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418436 (= res!954079 (validKeyInArray!0 (select (arr!46751 a!2831) i!982)))))

(declare-fun res!954076 () Bool)

(assert (=> start!122382 (=> (not res!954076) (not e!802693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122382 (= res!954076 (validMask!0 mask!2608))))

(assert (=> start!122382 e!802693))

(assert (=> start!122382 true))

(declare-fun array_inv!35779 (array!96858) Bool)

(assert (=> start!122382 (array_inv!35779 a!2831)))

(declare-fun b!1418437 () Bool)

(declare-fun res!954075 () Bool)

(assert (=> b!1418437 (=> (not res!954075) (not e!802693))))

(assert (=> b!1418437 (= res!954075 (and (= (size!47301 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47301 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47301 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418438 () Bool)

(declare-fun res!954077 () Bool)

(assert (=> b!1418438 (=> (not res!954077) (not e!802693))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418438 (= res!954077 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47301 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47301 a!2831))))))

(declare-fun b!1418439 () Bool)

(declare-fun res!954073 () Bool)

(assert (=> b!1418439 (=> (not res!954073) (not e!802693))))

(declare-datatypes ((List!33261 0))(
  ( (Nil!33258) (Cons!33257 (h!34550 (_ BitVec 64)) (t!47955 List!33261)) )
))
(declare-fun arrayNoDuplicates!0 (array!96858 (_ BitVec 32) List!33261) Bool)

(assert (=> b!1418439 (= res!954073 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33258))))

(assert (= (and start!122382 res!954076) b!1418437))

(assert (= (and b!1418437 res!954075) b!1418436))

(assert (= (and b!1418436 res!954079) b!1418435))

(assert (= (and b!1418435 res!954074) b!1418433))

(assert (= (and b!1418433 res!954078) b!1418439))

(assert (= (and b!1418439 res!954073) b!1418438))

(assert (= (and b!1418438 res!954077) b!1418434))

(declare-fun m!1309119 () Bool)

(assert (=> b!1418433 m!1309119))

(declare-fun m!1309121 () Bool)

(assert (=> b!1418436 m!1309121))

(assert (=> b!1418436 m!1309121))

(declare-fun m!1309123 () Bool)

(assert (=> b!1418436 m!1309123))

(declare-fun m!1309125 () Bool)

(assert (=> b!1418439 m!1309125))

(declare-fun m!1309127 () Bool)

(assert (=> b!1418435 m!1309127))

(assert (=> b!1418435 m!1309127))

(declare-fun m!1309129 () Bool)

(assert (=> b!1418435 m!1309129))

(declare-fun m!1309131 () Bool)

(assert (=> start!122382 m!1309131))

(declare-fun m!1309133 () Bool)

(assert (=> start!122382 m!1309133))

(assert (=> b!1418434 m!1309127))

(assert (=> b!1418434 m!1309127))

(declare-fun m!1309135 () Bool)

(assert (=> b!1418434 m!1309135))

(push 1)

(assert (not b!1418435))

(assert (not start!122382))

(assert (not b!1418436))

(assert (not b!1418433))

(assert (not b!1418434))

(assert (not b!1418439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

