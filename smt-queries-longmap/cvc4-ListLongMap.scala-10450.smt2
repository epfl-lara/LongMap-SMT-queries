; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122866 () Bool)

(assert start!122866)

(declare-fun res!960523 () Bool)

(declare-fun e!805270 () Bool)

(assert (=> start!122866 (=> (not res!960523) (not e!805270))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122866 (= res!960523 (validMask!0 mask!2608))))

(assert (=> start!122866 e!805270))

(assert (=> start!122866 true))

(declare-datatypes ((array!97231 0))(
  ( (array!97232 (arr!46933 (Array (_ BitVec 32) (_ BitVec 64))) (size!47483 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97231)

(declare-fun array_inv!35961 (array!97231) Bool)

(assert (=> start!122866 (array_inv!35961 a!2831)))

(declare-fun b!1425090 () Bool)

(declare-fun res!960529 () Bool)

(assert (=> b!1425090 (=> (not res!960529) (not e!805270))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425090 (= res!960529 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47483 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47483 a!2831))))))

(declare-fun b!1425091 () Bool)

(declare-fun res!960527 () Bool)

(assert (=> b!1425091 (=> (not res!960527) (not e!805270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97231 (_ BitVec 32)) Bool)

(assert (=> b!1425091 (= res!960527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425092 () Bool)

(declare-fun res!960526 () Bool)

(assert (=> b!1425092 (=> (not res!960526) (not e!805270))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425092 (= res!960526 (and (= (size!47483 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47483 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47483 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425093 () Bool)

(assert (=> b!1425093 (= e!805270 false)))

(declare-datatypes ((SeekEntryResult!11212 0))(
  ( (MissingZero!11212 (index!47240 (_ BitVec 32))) (Found!11212 (index!47241 (_ BitVec 32))) (Intermediate!11212 (undefined!12024 Bool) (index!47242 (_ BitVec 32)) (x!128878 (_ BitVec 32))) (Undefined!11212) (MissingVacant!11212 (index!47243 (_ BitVec 32))) )
))
(declare-fun lt!627771 () SeekEntryResult!11212)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97231 (_ BitVec 32)) SeekEntryResult!11212)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425093 (= lt!627771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46933 a!2831) j!81) mask!2608) (select (arr!46933 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425094 () Bool)

(declare-fun res!960528 () Bool)

(assert (=> b!1425094 (=> (not res!960528) (not e!805270))))

(declare-datatypes ((List!33443 0))(
  ( (Nil!33440) (Cons!33439 (h!34741 (_ BitVec 64)) (t!48137 List!33443)) )
))
(declare-fun arrayNoDuplicates!0 (array!97231 (_ BitVec 32) List!33443) Bool)

(assert (=> b!1425094 (= res!960528 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33440))))

(declare-fun b!1425095 () Bool)

(declare-fun res!960525 () Bool)

(assert (=> b!1425095 (=> (not res!960525) (not e!805270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425095 (= res!960525 (validKeyInArray!0 (select (arr!46933 a!2831) i!982)))))

(declare-fun b!1425096 () Bool)

(declare-fun res!960524 () Bool)

(assert (=> b!1425096 (=> (not res!960524) (not e!805270))))

(assert (=> b!1425096 (= res!960524 (validKeyInArray!0 (select (arr!46933 a!2831) j!81)))))

(assert (= (and start!122866 res!960523) b!1425092))

(assert (= (and b!1425092 res!960526) b!1425095))

(assert (= (and b!1425095 res!960525) b!1425096))

(assert (= (and b!1425096 res!960524) b!1425091))

(assert (= (and b!1425091 res!960527) b!1425094))

(assert (= (and b!1425094 res!960528) b!1425090))

(assert (= (and b!1425090 res!960529) b!1425093))

(declare-fun m!1315645 () Bool)

(assert (=> start!122866 m!1315645))

(declare-fun m!1315647 () Bool)

(assert (=> start!122866 m!1315647))

(declare-fun m!1315649 () Bool)

(assert (=> b!1425093 m!1315649))

(assert (=> b!1425093 m!1315649))

(declare-fun m!1315651 () Bool)

(assert (=> b!1425093 m!1315651))

(assert (=> b!1425093 m!1315651))

(assert (=> b!1425093 m!1315649))

(declare-fun m!1315653 () Bool)

(assert (=> b!1425093 m!1315653))

(assert (=> b!1425096 m!1315649))

(assert (=> b!1425096 m!1315649))

(declare-fun m!1315655 () Bool)

(assert (=> b!1425096 m!1315655))

(declare-fun m!1315657 () Bool)

(assert (=> b!1425095 m!1315657))

(assert (=> b!1425095 m!1315657))

(declare-fun m!1315659 () Bool)

(assert (=> b!1425095 m!1315659))

(declare-fun m!1315661 () Bool)

(assert (=> b!1425094 m!1315661))

(declare-fun m!1315663 () Bool)

(assert (=> b!1425091 m!1315663))

(push 1)

(assert (not b!1425093))

(assert (not b!1425091))

(assert (not b!1425095))

(assert (not b!1425096))

(assert (not b!1425094))

(assert (not start!122866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

