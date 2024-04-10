; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122870 () Bool)

(assert start!122870)

(declare-fun b!1425132 () Bool)

(declare-fun res!960568 () Bool)

(declare-fun e!805283 () Bool)

(assert (=> b!1425132 (=> (not res!960568) (not e!805283))))

(declare-datatypes ((array!97235 0))(
  ( (array!97236 (arr!46935 (Array (_ BitVec 32) (_ BitVec 64))) (size!47485 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97235)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425132 (= res!960568 (validKeyInArray!0 (select (arr!46935 a!2831) j!81)))))

(declare-fun b!1425133 () Bool)

(declare-fun res!960566 () Bool)

(assert (=> b!1425133 (=> (not res!960566) (not e!805283))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97235 (_ BitVec 32)) Bool)

(assert (=> b!1425133 (= res!960566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425134 () Bool)

(assert (=> b!1425134 (= e!805283 false)))

(declare-datatypes ((SeekEntryResult!11214 0))(
  ( (MissingZero!11214 (index!47248 (_ BitVec 32))) (Found!11214 (index!47249 (_ BitVec 32))) (Intermediate!11214 (undefined!12026 Bool) (index!47250 (_ BitVec 32)) (x!128888 (_ BitVec 32))) (Undefined!11214) (MissingVacant!11214 (index!47251 (_ BitVec 32))) )
))
(declare-fun lt!627777 () SeekEntryResult!11214)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97235 (_ BitVec 32)) SeekEntryResult!11214)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425134 (= lt!627777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46935 a!2831) j!81) mask!2608) (select (arr!46935 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425135 () Bool)

(declare-fun res!960571 () Bool)

(assert (=> b!1425135 (=> (not res!960571) (not e!805283))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425135 (= res!960571 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47485 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47485 a!2831))))))

(declare-fun b!1425136 () Bool)

(declare-fun res!960565 () Bool)

(assert (=> b!1425136 (=> (not res!960565) (not e!805283))))

(declare-datatypes ((List!33445 0))(
  ( (Nil!33442) (Cons!33441 (h!34743 (_ BitVec 64)) (t!48139 List!33445)) )
))
(declare-fun arrayNoDuplicates!0 (array!97235 (_ BitVec 32) List!33445) Bool)

(assert (=> b!1425136 (= res!960565 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33442))))

(declare-fun b!1425137 () Bool)

(declare-fun res!960567 () Bool)

(assert (=> b!1425137 (=> (not res!960567) (not e!805283))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425137 (= res!960567 (and (= (size!47485 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47485 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47485 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!960569 () Bool)

(assert (=> start!122870 (=> (not res!960569) (not e!805283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122870 (= res!960569 (validMask!0 mask!2608))))

(assert (=> start!122870 e!805283))

(assert (=> start!122870 true))

(declare-fun array_inv!35963 (array!97235) Bool)

(assert (=> start!122870 (array_inv!35963 a!2831)))

(declare-fun b!1425138 () Bool)

(declare-fun res!960570 () Bool)

(assert (=> b!1425138 (=> (not res!960570) (not e!805283))))

(assert (=> b!1425138 (= res!960570 (validKeyInArray!0 (select (arr!46935 a!2831) i!982)))))

(assert (= (and start!122870 res!960569) b!1425137))

(assert (= (and b!1425137 res!960567) b!1425138))

(assert (= (and b!1425138 res!960570) b!1425132))

(assert (= (and b!1425132 res!960568) b!1425133))

(assert (= (and b!1425133 res!960566) b!1425136))

(assert (= (and b!1425136 res!960565) b!1425135))

(assert (= (and b!1425135 res!960571) b!1425134))

(declare-fun m!1315685 () Bool)

(assert (=> b!1425138 m!1315685))

(assert (=> b!1425138 m!1315685))

(declare-fun m!1315687 () Bool)

(assert (=> b!1425138 m!1315687))

(declare-fun m!1315689 () Bool)

(assert (=> b!1425136 m!1315689))

(declare-fun m!1315691 () Bool)

(assert (=> b!1425134 m!1315691))

(assert (=> b!1425134 m!1315691))

(declare-fun m!1315693 () Bool)

(assert (=> b!1425134 m!1315693))

(assert (=> b!1425134 m!1315693))

(assert (=> b!1425134 m!1315691))

(declare-fun m!1315695 () Bool)

(assert (=> b!1425134 m!1315695))

(declare-fun m!1315697 () Bool)

(assert (=> b!1425133 m!1315697))

(declare-fun m!1315699 () Bool)

(assert (=> start!122870 m!1315699))

(declare-fun m!1315701 () Bool)

(assert (=> start!122870 m!1315701))

(assert (=> b!1425132 m!1315691))

(assert (=> b!1425132 m!1315691))

(declare-fun m!1315703 () Bool)

(assert (=> b!1425132 m!1315703))

(check-sat (not b!1425136) (not start!122870) (not b!1425134) (not b!1425133) (not b!1425138) (not b!1425132))
