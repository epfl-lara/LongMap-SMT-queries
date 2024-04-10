; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122876 () Bool)

(assert start!122876)

(declare-fun b!1425200 () Bool)

(declare-fun res!960640 () Bool)

(declare-fun e!805300 () Bool)

(assert (=> b!1425200 (=> (not res!960640) (not e!805300))))

(declare-datatypes ((array!97241 0))(
  ( (array!97242 (arr!46938 (Array (_ BitVec 32) (_ BitVec 64))) (size!47488 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97241)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425200 (= res!960640 (and (= (size!47488 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47488 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47488 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425201 () Bool)

(assert (=> b!1425201 (= e!805300 false)))

(declare-fun lt!627786 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425201 (= lt!627786 (toIndex!0 (select (store (arr!46938 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1425202 () Bool)

(declare-fun res!960635 () Bool)

(assert (=> b!1425202 (=> (not res!960635) (not e!805300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97241 (_ BitVec 32)) Bool)

(assert (=> b!1425202 (= res!960635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425203 () Bool)

(declare-fun res!960634 () Bool)

(assert (=> b!1425203 (=> (not res!960634) (not e!805300))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11217 0))(
  ( (MissingZero!11217 (index!47260 (_ BitVec 32))) (Found!11217 (index!47261 (_ BitVec 32))) (Intermediate!11217 (undefined!12029 Bool) (index!47262 (_ BitVec 32)) (x!128899 (_ BitVec 32))) (Undefined!11217) (MissingVacant!11217 (index!47263 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97241 (_ BitVec 32)) SeekEntryResult!11217)

(assert (=> b!1425203 (= res!960634 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46938 a!2831) j!81) mask!2608) (select (arr!46938 a!2831) j!81) a!2831 mask!2608) (Intermediate!11217 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425204 () Bool)

(declare-fun res!960638 () Bool)

(assert (=> b!1425204 (=> (not res!960638) (not e!805300))))

(declare-datatypes ((List!33448 0))(
  ( (Nil!33445) (Cons!33444 (h!34746 (_ BitVec 64)) (t!48142 List!33448)) )
))
(declare-fun arrayNoDuplicates!0 (array!97241 (_ BitVec 32) List!33448) Bool)

(assert (=> b!1425204 (= res!960638 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33445))))

(declare-fun b!1425205 () Bool)

(declare-fun res!960637 () Bool)

(assert (=> b!1425205 (=> (not res!960637) (not e!805300))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425205 (= res!960637 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47488 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47488 a!2831))))))

(declare-fun b!1425206 () Bool)

(declare-fun res!960636 () Bool)

(assert (=> b!1425206 (=> (not res!960636) (not e!805300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425206 (= res!960636 (validKeyInArray!0 (select (arr!46938 a!2831) j!81)))))

(declare-fun res!960639 () Bool)

(assert (=> start!122876 (=> (not res!960639) (not e!805300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122876 (= res!960639 (validMask!0 mask!2608))))

(assert (=> start!122876 e!805300))

(assert (=> start!122876 true))

(declare-fun array_inv!35966 (array!97241) Bool)

(assert (=> start!122876 (array_inv!35966 a!2831)))

(declare-fun b!1425207 () Bool)

(declare-fun res!960633 () Bool)

(assert (=> b!1425207 (=> (not res!960633) (not e!805300))))

(assert (=> b!1425207 (= res!960633 (validKeyInArray!0 (select (arr!46938 a!2831) i!982)))))

(assert (= (and start!122876 res!960639) b!1425200))

(assert (= (and b!1425200 res!960640) b!1425207))

(assert (= (and b!1425207 res!960633) b!1425206))

(assert (= (and b!1425206 res!960636) b!1425202))

(assert (= (and b!1425202 res!960635) b!1425204))

(assert (= (and b!1425204 res!960638) b!1425205))

(assert (= (and b!1425205 res!960637) b!1425203))

(assert (= (and b!1425203 res!960634) b!1425201))

(declare-fun m!1315751 () Bool)

(assert (=> b!1425207 m!1315751))

(assert (=> b!1425207 m!1315751))

(declare-fun m!1315753 () Bool)

(assert (=> b!1425207 m!1315753))

(declare-fun m!1315755 () Bool)

(assert (=> b!1425203 m!1315755))

(assert (=> b!1425203 m!1315755))

(declare-fun m!1315757 () Bool)

(assert (=> b!1425203 m!1315757))

(assert (=> b!1425203 m!1315757))

(assert (=> b!1425203 m!1315755))

(declare-fun m!1315759 () Bool)

(assert (=> b!1425203 m!1315759))

(assert (=> b!1425206 m!1315755))

(assert (=> b!1425206 m!1315755))

(declare-fun m!1315761 () Bool)

(assert (=> b!1425206 m!1315761))

(declare-fun m!1315763 () Bool)

(assert (=> b!1425204 m!1315763))

(declare-fun m!1315765 () Bool)

(assert (=> b!1425201 m!1315765))

(declare-fun m!1315767 () Bool)

(assert (=> b!1425201 m!1315767))

(assert (=> b!1425201 m!1315767))

(declare-fun m!1315769 () Bool)

(assert (=> b!1425201 m!1315769))

(declare-fun m!1315771 () Bool)

(assert (=> b!1425202 m!1315771))

(declare-fun m!1315773 () Bool)

(assert (=> start!122876 m!1315773))

(declare-fun m!1315775 () Bool)

(assert (=> start!122876 m!1315775))

(check-sat (not b!1425203) (not b!1425201) (not b!1425206) (not b!1425204) (not b!1425202) (not start!122876) (not b!1425207))
