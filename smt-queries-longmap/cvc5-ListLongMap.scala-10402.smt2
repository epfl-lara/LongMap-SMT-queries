; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122574 () Bool)

(assert start!122574)

(declare-fun b!1419677 () Bool)

(declare-fun res!955113 () Bool)

(declare-fun e!803198 () Bool)

(assert (=> b!1419677 (=> (not res!955113) (not e!803198))))

(declare-datatypes ((array!96939 0))(
  ( (array!96940 (arr!46787 (Array (_ BitVec 32) (_ BitVec 64))) (size!47337 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96939)

(declare-datatypes ((List!33297 0))(
  ( (Nil!33294) (Cons!33293 (h!34595 (_ BitVec 64)) (t!47991 List!33297)) )
))
(declare-fun arrayNoDuplicates!0 (array!96939 (_ BitVec 32) List!33297) Bool)

(assert (=> b!1419677 (= res!955113 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33294))))

(declare-fun b!1419678 () Bool)

(declare-fun res!955112 () Bool)

(assert (=> b!1419678 (=> (not res!955112) (not e!803198))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419678 (= res!955112 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47337 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47337 a!2831))))))

(declare-fun b!1419679 () Bool)

(declare-fun res!955117 () Bool)

(assert (=> b!1419679 (=> (not res!955117) (not e!803198))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419679 (= res!955117 (and (= (size!47337 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47337 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47337 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419680 () Bool)

(declare-fun res!955115 () Bool)

(assert (=> b!1419680 (=> (not res!955115) (not e!803198))))

(declare-datatypes ((SeekEntryResult!11072 0))(
  ( (MissingZero!11072 (index!46680 (_ BitVec 32))) (Found!11072 (index!46681 (_ BitVec 32))) (Intermediate!11072 (undefined!11884 Bool) (index!46682 (_ BitVec 32)) (x!128354 (_ BitVec 32))) (Undefined!11072) (MissingVacant!11072 (index!46683 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96939 (_ BitVec 32)) SeekEntryResult!11072)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419680 (= res!955115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46787 a!2831) j!81) mask!2608) (select (arr!46787 a!2831) j!81) a!2831 mask!2608) (Intermediate!11072 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419681 () Bool)

(declare-fun res!955116 () Bool)

(assert (=> b!1419681 (=> (not res!955116) (not e!803198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419681 (= res!955116 (validKeyInArray!0 (select (arr!46787 a!2831) j!81)))))

(declare-fun b!1419682 () Bool)

(assert (=> b!1419682 (= e!803198 false)))

(declare-fun lt!625848 () SeekEntryResult!11072)

(assert (=> b!1419682 (= lt!625848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46787 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46787 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96940 (store (arr!46787 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47337 a!2831)) mask!2608))))

(declare-fun b!1419684 () Bool)

(declare-fun res!955111 () Bool)

(assert (=> b!1419684 (=> (not res!955111) (not e!803198))))

(assert (=> b!1419684 (= res!955111 (validKeyInArray!0 (select (arr!46787 a!2831) i!982)))))

(declare-fun res!955110 () Bool)

(assert (=> start!122574 (=> (not res!955110) (not e!803198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122574 (= res!955110 (validMask!0 mask!2608))))

(assert (=> start!122574 e!803198))

(assert (=> start!122574 true))

(declare-fun array_inv!35815 (array!96939) Bool)

(assert (=> start!122574 (array_inv!35815 a!2831)))

(declare-fun b!1419683 () Bool)

(declare-fun res!955114 () Bool)

(assert (=> b!1419683 (=> (not res!955114) (not e!803198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96939 (_ BitVec 32)) Bool)

(assert (=> b!1419683 (= res!955114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122574 res!955110) b!1419679))

(assert (= (and b!1419679 res!955117) b!1419684))

(assert (= (and b!1419684 res!955111) b!1419681))

(assert (= (and b!1419681 res!955116) b!1419683))

(assert (= (and b!1419683 res!955114) b!1419677))

(assert (= (and b!1419677 res!955113) b!1419678))

(assert (= (and b!1419678 res!955112) b!1419680))

(assert (= (and b!1419680 res!955115) b!1419682))

(declare-fun m!1310121 () Bool)

(assert (=> b!1419680 m!1310121))

(assert (=> b!1419680 m!1310121))

(declare-fun m!1310123 () Bool)

(assert (=> b!1419680 m!1310123))

(assert (=> b!1419680 m!1310123))

(assert (=> b!1419680 m!1310121))

(declare-fun m!1310125 () Bool)

(assert (=> b!1419680 m!1310125))

(declare-fun m!1310127 () Bool)

(assert (=> start!122574 m!1310127))

(declare-fun m!1310129 () Bool)

(assert (=> start!122574 m!1310129))

(declare-fun m!1310131 () Bool)

(assert (=> b!1419683 m!1310131))

(declare-fun m!1310133 () Bool)

(assert (=> b!1419684 m!1310133))

(assert (=> b!1419684 m!1310133))

(declare-fun m!1310135 () Bool)

(assert (=> b!1419684 m!1310135))

(declare-fun m!1310137 () Bool)

(assert (=> b!1419682 m!1310137))

(declare-fun m!1310139 () Bool)

(assert (=> b!1419682 m!1310139))

(assert (=> b!1419682 m!1310139))

(declare-fun m!1310141 () Bool)

(assert (=> b!1419682 m!1310141))

(assert (=> b!1419682 m!1310141))

(assert (=> b!1419682 m!1310139))

(declare-fun m!1310143 () Bool)

(assert (=> b!1419682 m!1310143))

(assert (=> b!1419681 m!1310121))

(assert (=> b!1419681 m!1310121))

(declare-fun m!1310145 () Bool)

(assert (=> b!1419681 m!1310145))

(declare-fun m!1310147 () Bool)

(assert (=> b!1419677 m!1310147))

(push 1)

(assert (not b!1419680))

(assert (not start!122574))

(assert (not b!1419684))

(assert (not b!1419677))

(assert (not b!1419682))

(assert (not b!1419683))

(assert (not b!1419681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

