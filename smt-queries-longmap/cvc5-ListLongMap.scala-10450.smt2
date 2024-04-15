; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122862 () Bool)

(assert start!122862)

(declare-fun b!1425009 () Bool)

(declare-fun res!960498 () Bool)

(declare-fun e!805231 () Bool)

(assert (=> b!1425009 (=> (not res!960498) (not e!805231))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97180 0))(
  ( (array!97181 (arr!46908 (Array (_ BitVec 32) (_ BitVec 64))) (size!47460 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97180)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425009 (= res!960498 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47460 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47460 a!2831))))))

(declare-fun b!1425010 () Bool)

(declare-fun res!960493 () Bool)

(assert (=> b!1425010 (=> (not res!960493) (not e!805231))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425010 (= res!960493 (and (= (size!47460 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47460 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47460 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425011 () Bool)

(declare-fun res!960499 () Bool)

(assert (=> b!1425011 (=> (not res!960499) (not e!805231))))

(declare-datatypes ((List!33496 0))(
  ( (Nil!33493) (Cons!33492 (h!34794 (_ BitVec 64)) (t!48182 List!33496)) )
))
(declare-fun arrayNoDuplicates!0 (array!97180 (_ BitVec 32) List!33496) Bool)

(assert (=> b!1425011 (= res!960499 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33493))))

(declare-fun b!1425012 () Bool)

(declare-fun res!960497 () Bool)

(assert (=> b!1425012 (=> (not res!960497) (not e!805231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97180 (_ BitVec 32)) Bool)

(assert (=> b!1425012 (= res!960497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425013 () Bool)

(assert (=> b!1425013 (= e!805231 false)))

(declare-datatypes ((SeekEntryResult!11214 0))(
  ( (MissingZero!11214 (index!47248 (_ BitVec 32))) (Found!11214 (index!47249 (_ BitVec 32))) (Intermediate!11214 (undefined!12026 Bool) (index!47250 (_ BitVec 32)) (x!128877 (_ BitVec 32))) (Undefined!11214) (MissingVacant!11214 (index!47251 (_ BitVec 32))) )
))
(declare-fun lt!627581 () SeekEntryResult!11214)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97180 (_ BitVec 32)) SeekEntryResult!11214)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425013 (= lt!627581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46908 a!2831) j!81) mask!2608) (select (arr!46908 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425014 () Bool)

(declare-fun res!960495 () Bool)

(assert (=> b!1425014 (=> (not res!960495) (not e!805231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425014 (= res!960495 (validKeyInArray!0 (select (arr!46908 a!2831) i!982)))))

(declare-fun b!1425015 () Bool)

(declare-fun res!960494 () Bool)

(assert (=> b!1425015 (=> (not res!960494) (not e!805231))))

(assert (=> b!1425015 (= res!960494 (validKeyInArray!0 (select (arr!46908 a!2831) j!81)))))

(declare-fun res!960496 () Bool)

(assert (=> start!122862 (=> (not res!960496) (not e!805231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122862 (= res!960496 (validMask!0 mask!2608))))

(assert (=> start!122862 e!805231))

(assert (=> start!122862 true))

(declare-fun array_inv!36141 (array!97180) Bool)

(assert (=> start!122862 (array_inv!36141 a!2831)))

(assert (= (and start!122862 res!960496) b!1425010))

(assert (= (and b!1425010 res!960493) b!1425014))

(assert (= (and b!1425014 res!960495) b!1425015))

(assert (= (and b!1425015 res!960494) b!1425012))

(assert (= (and b!1425012 res!960497) b!1425011))

(assert (= (and b!1425011 res!960499) b!1425009))

(assert (= (and b!1425009 res!960498) b!1425013))

(declare-fun m!1315093 () Bool)

(assert (=> b!1425014 m!1315093))

(assert (=> b!1425014 m!1315093))

(declare-fun m!1315095 () Bool)

(assert (=> b!1425014 m!1315095))

(declare-fun m!1315097 () Bool)

(assert (=> b!1425013 m!1315097))

(assert (=> b!1425013 m!1315097))

(declare-fun m!1315099 () Bool)

(assert (=> b!1425013 m!1315099))

(assert (=> b!1425013 m!1315099))

(assert (=> b!1425013 m!1315097))

(declare-fun m!1315101 () Bool)

(assert (=> b!1425013 m!1315101))

(declare-fun m!1315103 () Bool)

(assert (=> b!1425011 m!1315103))

(declare-fun m!1315105 () Bool)

(assert (=> start!122862 m!1315105))

(declare-fun m!1315107 () Bool)

(assert (=> start!122862 m!1315107))

(assert (=> b!1425015 m!1315097))

(assert (=> b!1425015 m!1315097))

(declare-fun m!1315109 () Bool)

(assert (=> b!1425015 m!1315109))

(declare-fun m!1315111 () Bool)

(assert (=> b!1425012 m!1315111))

(push 1)

(assert (not b!1425011))

(assert (not b!1425015))

(assert (not b!1425012))

(assert (not start!122862))

(assert (not b!1425014))

(assert (not b!1425013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

