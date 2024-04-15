; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122610 () Bool)

(assert start!122610)

(declare-fun b!1420102 () Bool)

(declare-fun res!955593 () Bool)

(declare-fun e!803278 () Bool)

(assert (=> b!1420102 (=> (not res!955593) (not e!803278))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96928 0))(
  ( (array!96929 (arr!46782 (Array (_ BitVec 32) (_ BitVec 64))) (size!47334 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96928)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11094 0))(
  ( (MissingZero!11094 (index!46768 (_ BitVec 32))) (Found!11094 (index!46769 (_ BitVec 32))) (Intermediate!11094 (undefined!11906 Bool) (index!46770 (_ BitVec 32)) (x!128421 (_ BitVec 32))) (Undefined!11094) (MissingVacant!11094 (index!46771 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96928 (_ BitVec 32)) SeekEntryResult!11094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420102 (= res!955593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46782 a!2831) j!81) mask!2608) (select (arr!46782 a!2831) j!81) a!2831 mask!2608) (Intermediate!11094 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420103 () Bool)

(declare-fun res!955589 () Bool)

(assert (=> b!1420103 (=> (not res!955589) (not e!803278))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420103 (= res!955589 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47334 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47334 a!2831))))))

(declare-fun b!1420104 () Bool)

(declare-fun res!955594 () Bool)

(assert (=> b!1420104 (=> (not res!955594) (not e!803278))))

(declare-datatypes ((List!33370 0))(
  ( (Nil!33367) (Cons!33366 (h!34668 (_ BitVec 64)) (t!48056 List!33370)) )
))
(declare-fun arrayNoDuplicates!0 (array!96928 (_ BitVec 32) List!33370) Bool)

(assert (=> b!1420104 (= res!955594 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33367))))

(declare-fun b!1420105 () Bool)

(declare-fun res!955592 () Bool)

(assert (=> b!1420105 (=> (not res!955592) (not e!803278))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420105 (= res!955592 (validKeyInArray!0 (select (arr!46782 a!2831) i!982)))))

(declare-fun b!1420106 () Bool)

(declare-fun res!955588 () Bool)

(assert (=> b!1420106 (=> (not res!955588) (not e!803278))))

(assert (=> b!1420106 (= res!955588 (validKeyInArray!0 (select (arr!46782 a!2831) j!81)))))

(declare-fun b!1420107 () Bool)

(declare-fun res!955590 () Bool)

(assert (=> b!1420107 (=> (not res!955590) (not e!803278))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420107 (= res!955590 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46782 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46782 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96929 (store (arr!46782 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47334 a!2831)) mask!2608) (Intermediate!11094 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420108 () Bool)

(declare-fun res!955586 () Bool)

(assert (=> b!1420108 (=> (not res!955586) (not e!803278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96928 (_ BitVec 32)) Bool)

(assert (=> b!1420108 (= res!955586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!955591 () Bool)

(assert (=> start!122610 (=> (not res!955591) (not e!803278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122610 (= res!955591 (validMask!0 mask!2608))))

(assert (=> start!122610 e!803278))

(assert (=> start!122610 true))

(declare-fun array_inv!36015 (array!96928) Bool)

(assert (=> start!122610 (array_inv!36015 a!2831)))

(declare-fun b!1420109 () Bool)

(declare-fun res!955587 () Bool)

(assert (=> b!1420109 (=> (not res!955587) (not e!803278))))

(assert (=> b!1420109 (= res!955587 (and (= (size!47334 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47334 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47334 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420110 () Bool)

(assert (=> b!1420110 (= e!803278 false)))

(declare-fun lt!625700 () SeekEntryResult!11094)

(assert (=> b!1420110 (= lt!625700 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46782 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and start!122610 res!955591) b!1420109))

(assert (= (and b!1420109 res!955587) b!1420105))

(assert (= (and b!1420105 res!955592) b!1420106))

(assert (= (and b!1420106 res!955588) b!1420108))

(assert (= (and b!1420108 res!955586) b!1420104))

(assert (= (and b!1420104 res!955594) b!1420103))

(assert (= (and b!1420103 res!955589) b!1420102))

(assert (= (and b!1420102 res!955593) b!1420107))

(assert (= (and b!1420107 res!955590) b!1420110))

(declare-fun m!1310133 () Bool)

(assert (=> b!1420110 m!1310133))

(assert (=> b!1420110 m!1310133))

(declare-fun m!1310135 () Bool)

(assert (=> b!1420110 m!1310135))

(assert (=> b!1420106 m!1310133))

(assert (=> b!1420106 m!1310133))

(declare-fun m!1310137 () Bool)

(assert (=> b!1420106 m!1310137))

(declare-fun m!1310139 () Bool)

(assert (=> b!1420107 m!1310139))

(declare-fun m!1310141 () Bool)

(assert (=> b!1420107 m!1310141))

(assert (=> b!1420107 m!1310141))

(declare-fun m!1310143 () Bool)

(assert (=> b!1420107 m!1310143))

(assert (=> b!1420107 m!1310143))

(assert (=> b!1420107 m!1310141))

(declare-fun m!1310145 () Bool)

(assert (=> b!1420107 m!1310145))

(declare-fun m!1310147 () Bool)

(assert (=> start!122610 m!1310147))

(declare-fun m!1310149 () Bool)

(assert (=> start!122610 m!1310149))

(declare-fun m!1310151 () Bool)

(assert (=> b!1420104 m!1310151))

(declare-fun m!1310153 () Bool)

(assert (=> b!1420108 m!1310153))

(assert (=> b!1420102 m!1310133))

(assert (=> b!1420102 m!1310133))

(declare-fun m!1310155 () Bool)

(assert (=> b!1420102 m!1310155))

(assert (=> b!1420102 m!1310155))

(assert (=> b!1420102 m!1310133))

(declare-fun m!1310157 () Bool)

(assert (=> b!1420102 m!1310157))

(declare-fun m!1310159 () Bool)

(assert (=> b!1420105 m!1310159))

(assert (=> b!1420105 m!1310159))

(declare-fun m!1310161 () Bool)

(assert (=> b!1420105 m!1310161))

(push 1)

(assert (not b!1420105))

(assert (not b!1420106))

(assert (not start!122610))

(assert (not b!1420102))

(assert (not b!1420107))

(assert (not b!1420110))

(assert (not b!1420108))

(assert (not b!1420104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

