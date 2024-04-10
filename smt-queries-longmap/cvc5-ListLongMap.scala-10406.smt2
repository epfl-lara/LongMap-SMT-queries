; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122598 () Bool)

(assert start!122598)

(declare-fun b!1419983 () Bool)

(declare-fun res!955422 () Bool)

(declare-fun e!803269 () Bool)

(assert (=> b!1419983 (=> (not res!955422) (not e!803269))))

(declare-datatypes ((array!96963 0))(
  ( (array!96964 (arr!46799 (Array (_ BitVec 32) (_ BitVec 64))) (size!47349 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96963)

(declare-datatypes ((List!33309 0))(
  ( (Nil!33306) (Cons!33305 (h!34607 (_ BitVec 64)) (t!48003 List!33309)) )
))
(declare-fun arrayNoDuplicates!0 (array!96963 (_ BitVec 32) List!33309) Bool)

(assert (=> b!1419983 (= res!955422 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33306))))

(declare-fun res!955416 () Bool)

(assert (=> start!122598 (=> (not res!955416) (not e!803269))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122598 (= res!955416 (validMask!0 mask!2608))))

(assert (=> start!122598 e!803269))

(assert (=> start!122598 true))

(declare-fun array_inv!35827 (array!96963) Bool)

(assert (=> start!122598 (array_inv!35827 a!2831)))

(declare-fun b!1419984 () Bool)

(assert (=> b!1419984 (= e!803269 false)))

(declare-datatypes ((SeekEntryResult!11084 0))(
  ( (MissingZero!11084 (index!46728 (_ BitVec 32))) (Found!11084 (index!46729 (_ BitVec 32))) (Intermediate!11084 (undefined!11896 Bool) (index!46730 (_ BitVec 32)) (x!128398 (_ BitVec 32))) (Undefined!11084) (MissingVacant!11084 (index!46731 (_ BitVec 32))) )
))
(declare-fun lt!625866 () SeekEntryResult!11084)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96963 (_ BitVec 32)) SeekEntryResult!11084)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419984 (= lt!625866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46799 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46799 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96964 (store (arr!46799 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47349 a!2831)) mask!2608))))

(declare-fun b!1419985 () Bool)

(declare-fun res!955421 () Bool)

(assert (=> b!1419985 (=> (not res!955421) (not e!803269))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1419985 (= res!955421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46799 a!2831) j!81) mask!2608) (select (arr!46799 a!2831) j!81) a!2831 mask!2608) (Intermediate!11084 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419986 () Bool)

(declare-fun res!955420 () Bool)

(assert (=> b!1419986 (=> (not res!955420) (not e!803269))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419986 (= res!955420 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47349 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47349 a!2831))))))

(declare-fun b!1419987 () Bool)

(declare-fun res!955423 () Bool)

(assert (=> b!1419987 (=> (not res!955423) (not e!803269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419987 (= res!955423 (validKeyInArray!0 (select (arr!46799 a!2831) i!982)))))

(declare-fun b!1419988 () Bool)

(declare-fun res!955418 () Bool)

(assert (=> b!1419988 (=> (not res!955418) (not e!803269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96963 (_ BitVec 32)) Bool)

(assert (=> b!1419988 (= res!955418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419989 () Bool)

(declare-fun res!955417 () Bool)

(assert (=> b!1419989 (=> (not res!955417) (not e!803269))))

(assert (=> b!1419989 (= res!955417 (and (= (size!47349 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47349 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47349 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419990 () Bool)

(declare-fun res!955419 () Bool)

(assert (=> b!1419990 (=> (not res!955419) (not e!803269))))

(assert (=> b!1419990 (= res!955419 (validKeyInArray!0 (select (arr!46799 a!2831) j!81)))))

(assert (= (and start!122598 res!955416) b!1419989))

(assert (= (and b!1419989 res!955417) b!1419987))

(assert (= (and b!1419987 res!955423) b!1419990))

(assert (= (and b!1419990 res!955419) b!1419988))

(assert (= (and b!1419988 res!955418) b!1419983))

(assert (= (and b!1419983 res!955422) b!1419986))

(assert (= (and b!1419986 res!955420) b!1419985))

(assert (= (and b!1419985 res!955421) b!1419984))

(declare-fun m!1310457 () Bool)

(assert (=> b!1419990 m!1310457))

(assert (=> b!1419990 m!1310457))

(declare-fun m!1310459 () Bool)

(assert (=> b!1419990 m!1310459))

(declare-fun m!1310461 () Bool)

(assert (=> b!1419987 m!1310461))

(assert (=> b!1419987 m!1310461))

(declare-fun m!1310463 () Bool)

(assert (=> b!1419987 m!1310463))

(declare-fun m!1310465 () Bool)

(assert (=> start!122598 m!1310465))

(declare-fun m!1310467 () Bool)

(assert (=> start!122598 m!1310467))

(declare-fun m!1310469 () Bool)

(assert (=> b!1419984 m!1310469))

(declare-fun m!1310471 () Bool)

(assert (=> b!1419984 m!1310471))

(assert (=> b!1419984 m!1310471))

(declare-fun m!1310473 () Bool)

(assert (=> b!1419984 m!1310473))

(assert (=> b!1419984 m!1310473))

(assert (=> b!1419984 m!1310471))

(declare-fun m!1310475 () Bool)

(assert (=> b!1419984 m!1310475))

(assert (=> b!1419985 m!1310457))

(assert (=> b!1419985 m!1310457))

(declare-fun m!1310477 () Bool)

(assert (=> b!1419985 m!1310477))

(assert (=> b!1419985 m!1310477))

(assert (=> b!1419985 m!1310457))

(declare-fun m!1310479 () Bool)

(assert (=> b!1419985 m!1310479))

(declare-fun m!1310481 () Bool)

(assert (=> b!1419988 m!1310481))

(declare-fun m!1310483 () Bool)

(assert (=> b!1419983 m!1310483))

(push 1)

(assert (not b!1419985))

(assert (not b!1419983))

(assert (not b!1419990))

(assert (not start!122598))

(assert (not b!1419988))

(assert (not b!1419987))

(assert (not b!1419984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

