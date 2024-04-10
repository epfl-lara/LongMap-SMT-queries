; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122896 () Bool)

(assert start!122896)

(declare-fun b!1425448 () Bool)

(declare-fun res!960881 () Bool)

(declare-fun e!805360 () Bool)

(assert (=> b!1425448 (=> (not res!960881) (not e!805360))))

(declare-datatypes ((array!97261 0))(
  ( (array!97262 (arr!46948 (Array (_ BitVec 32) (_ BitVec 64))) (size!47498 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97261)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97261 (_ BitVec 32)) Bool)

(assert (=> b!1425448 (= res!960881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425449 () Bool)

(declare-fun res!960882 () Bool)

(assert (=> b!1425449 (=> (not res!960882) (not e!805360))))

(declare-datatypes ((List!33458 0))(
  ( (Nil!33455) (Cons!33454 (h!34756 (_ BitVec 64)) (t!48152 List!33458)) )
))
(declare-fun arrayNoDuplicates!0 (array!97261 (_ BitVec 32) List!33458) Bool)

(assert (=> b!1425449 (= res!960882 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33455))))

(declare-fun res!960884 () Bool)

(assert (=> start!122896 (=> (not res!960884) (not e!805360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122896 (= res!960884 (validMask!0 mask!2608))))

(assert (=> start!122896 e!805360))

(assert (=> start!122896 true))

(declare-fun array_inv!35976 (array!97261) Bool)

(assert (=> start!122896 (array_inv!35976 a!2831)))

(declare-fun b!1425450 () Bool)

(declare-fun res!960886 () Bool)

(assert (=> b!1425450 (=> (not res!960886) (not e!805360))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11227 0))(
  ( (MissingZero!11227 (index!47300 (_ BitVec 32))) (Found!11227 (index!47301 (_ BitVec 32))) (Intermediate!11227 (undefined!12039 Bool) (index!47302 (_ BitVec 32)) (x!128933 (_ BitVec 32))) (Undefined!11227) (MissingVacant!11227 (index!47303 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97261 (_ BitVec 32)) SeekEntryResult!11227)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425450 (= res!960886 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46948 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46948 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97262 (store (arr!46948 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47498 a!2831)) mask!2608) (Intermediate!11227 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425451 () Bool)

(assert (=> b!1425451 (= e!805360 false)))

(declare-fun lt!627816 () SeekEntryResult!11227)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425451 (= lt!627816 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46948 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425452 () Bool)

(declare-fun res!960888 () Bool)

(assert (=> b!1425452 (=> (not res!960888) (not e!805360))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1425452 (= res!960888 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47498 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47498 a!2831))))))

(declare-fun b!1425453 () Bool)

(declare-fun res!960889 () Bool)

(assert (=> b!1425453 (=> (not res!960889) (not e!805360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425453 (= res!960889 (validKeyInArray!0 (select (arr!46948 a!2831) j!81)))))

(declare-fun b!1425454 () Bool)

(declare-fun res!960885 () Bool)

(assert (=> b!1425454 (=> (not res!960885) (not e!805360))))

(assert (=> b!1425454 (= res!960885 (validKeyInArray!0 (select (arr!46948 a!2831) i!982)))))

(declare-fun b!1425455 () Bool)

(declare-fun res!960883 () Bool)

(assert (=> b!1425455 (=> (not res!960883) (not e!805360))))

(assert (=> b!1425455 (= res!960883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46948 a!2831) j!81) mask!2608) (select (arr!46948 a!2831) j!81) a!2831 mask!2608) (Intermediate!11227 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425456 () Bool)

(declare-fun res!960887 () Bool)

(assert (=> b!1425456 (=> (not res!960887) (not e!805360))))

(assert (=> b!1425456 (= res!960887 (and (= (size!47498 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47498 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47498 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122896 res!960884) b!1425456))

(assert (= (and b!1425456 res!960887) b!1425454))

(assert (= (and b!1425454 res!960885) b!1425453))

(assert (= (and b!1425453 res!960889) b!1425448))

(assert (= (and b!1425448 res!960881) b!1425449))

(assert (= (and b!1425449 res!960882) b!1425452))

(assert (= (and b!1425452 res!960888) b!1425455))

(assert (= (and b!1425455 res!960883) b!1425450))

(assert (= (and b!1425450 res!960886) b!1425451))

(declare-fun m!1316025 () Bool)

(assert (=> b!1425448 m!1316025))

(declare-fun m!1316027 () Bool)

(assert (=> b!1425449 m!1316027))

(declare-fun m!1316029 () Bool)

(assert (=> b!1425455 m!1316029))

(assert (=> b!1425455 m!1316029))

(declare-fun m!1316031 () Bool)

(assert (=> b!1425455 m!1316031))

(assert (=> b!1425455 m!1316031))

(assert (=> b!1425455 m!1316029))

(declare-fun m!1316033 () Bool)

(assert (=> b!1425455 m!1316033))

(declare-fun m!1316035 () Bool)

(assert (=> b!1425454 m!1316035))

(assert (=> b!1425454 m!1316035))

(declare-fun m!1316037 () Bool)

(assert (=> b!1425454 m!1316037))

(declare-fun m!1316039 () Bool)

(assert (=> b!1425450 m!1316039))

(declare-fun m!1316041 () Bool)

(assert (=> b!1425450 m!1316041))

(assert (=> b!1425450 m!1316041))

(declare-fun m!1316043 () Bool)

(assert (=> b!1425450 m!1316043))

(assert (=> b!1425450 m!1316043))

(assert (=> b!1425450 m!1316041))

(declare-fun m!1316045 () Bool)

(assert (=> b!1425450 m!1316045))

(declare-fun m!1316047 () Bool)

(assert (=> start!122896 m!1316047))

(declare-fun m!1316049 () Bool)

(assert (=> start!122896 m!1316049))

(assert (=> b!1425451 m!1316029))

(assert (=> b!1425451 m!1316029))

(declare-fun m!1316051 () Bool)

(assert (=> b!1425451 m!1316051))

(assert (=> b!1425453 m!1316029))

(assert (=> b!1425453 m!1316029))

(declare-fun m!1316053 () Bool)

(assert (=> b!1425453 m!1316053))

(push 1)

(assert (not b!1425449))

(assert (not b!1425455))

(assert (not b!1425453))

(assert (not b!1425448))

(assert (not start!122896))

(assert (not b!1425450))

(assert (not b!1425451))

