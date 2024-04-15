; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122898 () Bool)

(assert start!122898)

(declare-fun b!1425448 () Bool)

(declare-fun res!960936 () Bool)

(declare-fun e!805339 () Bool)

(assert (=> b!1425448 (=> (not res!960936) (not e!805339))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97216 0))(
  ( (array!97217 (arr!46926 (Array (_ BitVec 32) (_ BitVec 64))) (size!47478 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97216)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425448 (= res!960936 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47478 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47478 a!2831))))))

(declare-fun b!1425449 () Bool)

(declare-fun res!960935 () Bool)

(assert (=> b!1425449 (=> (not res!960935) (not e!805339))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97216 (_ BitVec 32)) Bool)

(assert (=> b!1425449 (= res!960935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425450 () Bool)

(declare-fun res!960940 () Bool)

(assert (=> b!1425450 (=> (not res!960940) (not e!805339))))

(declare-datatypes ((List!33514 0))(
  ( (Nil!33511) (Cons!33510 (h!34812 (_ BitVec 64)) (t!48200 List!33514)) )
))
(declare-fun arrayNoDuplicates!0 (array!97216 (_ BitVec 32) List!33514) Bool)

(assert (=> b!1425450 (= res!960940 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33511))))

(declare-fun b!1425451 () Bool)

(declare-fun res!960937 () Bool)

(assert (=> b!1425451 (=> (not res!960937) (not e!805339))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11232 0))(
  ( (MissingZero!11232 (index!47320 (_ BitVec 32))) (Found!11232 (index!47321 (_ BitVec 32))) (Intermediate!11232 (undefined!12044 Bool) (index!47322 (_ BitVec 32)) (x!128943 (_ BitVec 32))) (Undefined!11232) (MissingVacant!11232 (index!47323 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97216 (_ BitVec 32)) SeekEntryResult!11232)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425451 (= res!960937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46926 a!2831) j!81) mask!2608) (select (arr!46926 a!2831) j!81) a!2831 mask!2608) (Intermediate!11232 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425452 () Bool)

(declare-fun res!960938 () Bool)

(assert (=> b!1425452 (=> (not res!960938) (not e!805339))))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1425452 (= res!960938 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46926 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46926 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97217 (store (arr!46926 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47478 a!2831)) mask!2608) (Intermediate!11232 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425453 () Bool)

(assert (=> b!1425453 (= e!805339 false)))

(declare-fun lt!627635 () SeekEntryResult!11232)

(assert (=> b!1425453 (= lt!627635 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46926 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425454 () Bool)

(declare-fun res!960939 () Bool)

(assert (=> b!1425454 (=> (not res!960939) (not e!805339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425454 (= res!960939 (validKeyInArray!0 (select (arr!46926 a!2831) j!81)))))

(declare-fun b!1425455 () Bool)

(declare-fun res!960932 () Bool)

(assert (=> b!1425455 (=> (not res!960932) (not e!805339))))

(assert (=> b!1425455 (= res!960932 (validKeyInArray!0 (select (arr!46926 a!2831) i!982)))))

(declare-fun res!960934 () Bool)

(assert (=> start!122898 (=> (not res!960934) (not e!805339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122898 (= res!960934 (validMask!0 mask!2608))))

(assert (=> start!122898 e!805339))

(assert (=> start!122898 true))

(declare-fun array_inv!36159 (array!97216) Bool)

(assert (=> start!122898 (array_inv!36159 a!2831)))

(declare-fun b!1425456 () Bool)

(declare-fun res!960933 () Bool)

(assert (=> b!1425456 (=> (not res!960933) (not e!805339))))

(assert (=> b!1425456 (= res!960933 (and (= (size!47478 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47478 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47478 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122898 res!960934) b!1425456))

(assert (= (and b!1425456 res!960933) b!1425455))

(assert (= (and b!1425455 res!960932) b!1425454))

(assert (= (and b!1425454 res!960939) b!1425449))

(assert (= (and b!1425449 res!960935) b!1425450))

(assert (= (and b!1425450 res!960940) b!1425448))

(assert (= (and b!1425448 res!960936) b!1425451))

(assert (= (and b!1425451 res!960937) b!1425452))

(assert (= (and b!1425452 res!960938) b!1425453))

(declare-fun m!1315563 () Bool)

(assert (=> b!1425452 m!1315563))

(declare-fun m!1315565 () Bool)

(assert (=> b!1425452 m!1315565))

(assert (=> b!1425452 m!1315565))

(declare-fun m!1315567 () Bool)

(assert (=> b!1425452 m!1315567))

(assert (=> b!1425452 m!1315567))

(assert (=> b!1425452 m!1315565))

(declare-fun m!1315569 () Bool)

(assert (=> b!1425452 m!1315569))

(declare-fun m!1315571 () Bool)

(assert (=> b!1425454 m!1315571))

(assert (=> b!1425454 m!1315571))

(declare-fun m!1315573 () Bool)

(assert (=> b!1425454 m!1315573))

(declare-fun m!1315575 () Bool)

(assert (=> b!1425449 m!1315575))

(assert (=> b!1425451 m!1315571))

(assert (=> b!1425451 m!1315571))

(declare-fun m!1315577 () Bool)

(assert (=> b!1425451 m!1315577))

(assert (=> b!1425451 m!1315577))

(assert (=> b!1425451 m!1315571))

(declare-fun m!1315579 () Bool)

(assert (=> b!1425451 m!1315579))

(declare-fun m!1315581 () Bool)

(assert (=> b!1425455 m!1315581))

(assert (=> b!1425455 m!1315581))

(declare-fun m!1315583 () Bool)

(assert (=> b!1425455 m!1315583))

(assert (=> b!1425453 m!1315571))

(assert (=> b!1425453 m!1315571))

(declare-fun m!1315585 () Bool)

(assert (=> b!1425453 m!1315585))

(declare-fun m!1315587 () Bool)

(assert (=> b!1425450 m!1315587))

(declare-fun m!1315589 () Bool)

(assert (=> start!122898 m!1315589))

(declare-fun m!1315591 () Bool)

(assert (=> start!122898 m!1315591))

(push 1)

(assert (not start!122898))

(assert (not b!1425454))

(assert (not b!1425455))

(assert (not b!1425450))

(assert (not b!1425452))

(assert (not b!1425449))

(assert (not b!1425451))

(assert (not b!1425453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

