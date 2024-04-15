; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122886 () Bool)

(assert start!122886)

(declare-fun b!1425287 () Bool)

(declare-fun res!960777 () Bool)

(declare-fun e!805303 () Bool)

(assert (=> b!1425287 (=> (not res!960777) (not e!805303))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((array!97204 0))(
  ( (array!97205 (arr!46920 (Array (_ BitVec 32) (_ BitVec 64))) (size!47472 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97204)

(assert (=> b!1425287 (= res!960777 (and (= (size!47472 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47472 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47472 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425288 () Bool)

(declare-fun res!960775 () Bool)

(assert (=> b!1425288 (=> (not res!960775) (not e!805303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97204 (_ BitVec 32)) Bool)

(assert (=> b!1425288 (= res!960775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425289 () Bool)

(declare-fun res!960772 () Bool)

(assert (=> b!1425289 (=> (not res!960772) (not e!805303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425289 (= res!960772 (validKeyInArray!0 (select (arr!46920 a!2831) j!81)))))

(declare-fun b!1425290 () Bool)

(assert (=> b!1425290 (= e!805303 false)))

(declare-datatypes ((SeekEntryResult!11226 0))(
  ( (MissingZero!11226 (index!47296 (_ BitVec 32))) (Found!11226 (index!47297 (_ BitVec 32))) (Intermediate!11226 (undefined!12038 Bool) (index!47298 (_ BitVec 32)) (x!128921 (_ BitVec 32))) (Undefined!11226) (MissingVacant!11226 (index!47299 (_ BitVec 32))) )
))
(declare-fun lt!627617 () SeekEntryResult!11226)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97204 (_ BitVec 32)) SeekEntryResult!11226)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425290 (= lt!627617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46920 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46920 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97205 (store (arr!46920 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47472 a!2831)) mask!2608))))

(declare-fun b!1425291 () Bool)

(declare-fun res!960773 () Bool)

(assert (=> b!1425291 (=> (not res!960773) (not e!805303))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1425291 (= res!960773 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47472 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47472 a!2831))))))

(declare-fun res!960774 () Bool)

(assert (=> start!122886 (=> (not res!960774) (not e!805303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122886 (= res!960774 (validMask!0 mask!2608))))

(assert (=> start!122886 e!805303))

(assert (=> start!122886 true))

(declare-fun array_inv!36153 (array!97204) Bool)

(assert (=> start!122886 (array_inv!36153 a!2831)))

(declare-fun b!1425292 () Bool)

(declare-fun res!960771 () Bool)

(assert (=> b!1425292 (=> (not res!960771) (not e!805303))))

(assert (=> b!1425292 (= res!960771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46920 a!2831) j!81) mask!2608) (select (arr!46920 a!2831) j!81) a!2831 mask!2608) (Intermediate!11226 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425293 () Bool)

(declare-fun res!960776 () Bool)

(assert (=> b!1425293 (=> (not res!960776) (not e!805303))))

(declare-datatypes ((List!33508 0))(
  ( (Nil!33505) (Cons!33504 (h!34806 (_ BitVec 64)) (t!48194 List!33508)) )
))
(declare-fun arrayNoDuplicates!0 (array!97204 (_ BitVec 32) List!33508) Bool)

(assert (=> b!1425293 (= res!960776 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33505))))

(declare-fun b!1425294 () Bool)

(declare-fun res!960778 () Bool)

(assert (=> b!1425294 (=> (not res!960778) (not e!805303))))

(assert (=> b!1425294 (= res!960778 (validKeyInArray!0 (select (arr!46920 a!2831) i!982)))))

(assert (= (and start!122886 res!960774) b!1425287))

(assert (= (and b!1425287 res!960777) b!1425294))

(assert (= (and b!1425294 res!960778) b!1425289))

(assert (= (and b!1425289 res!960772) b!1425288))

(assert (= (and b!1425288 res!960775) b!1425293))

(assert (= (and b!1425293 res!960776) b!1425291))

(assert (= (and b!1425291 res!960773) b!1425292))

(assert (= (and b!1425292 res!960771) b!1425290))

(declare-fun m!1315385 () Bool)

(assert (=> b!1425288 m!1315385))

(declare-fun m!1315387 () Bool)

(assert (=> b!1425294 m!1315387))

(assert (=> b!1425294 m!1315387))

(declare-fun m!1315389 () Bool)

(assert (=> b!1425294 m!1315389))

(declare-fun m!1315391 () Bool)

(assert (=> start!122886 m!1315391))

(declare-fun m!1315393 () Bool)

(assert (=> start!122886 m!1315393))

(declare-fun m!1315395 () Bool)

(assert (=> b!1425292 m!1315395))

(assert (=> b!1425292 m!1315395))

(declare-fun m!1315397 () Bool)

(assert (=> b!1425292 m!1315397))

(assert (=> b!1425292 m!1315397))

(assert (=> b!1425292 m!1315395))

(declare-fun m!1315399 () Bool)

(assert (=> b!1425292 m!1315399))

(declare-fun m!1315401 () Bool)

(assert (=> b!1425293 m!1315401))

(assert (=> b!1425289 m!1315395))

(assert (=> b!1425289 m!1315395))

(declare-fun m!1315403 () Bool)

(assert (=> b!1425289 m!1315403))

(declare-fun m!1315405 () Bool)

(assert (=> b!1425290 m!1315405))

(declare-fun m!1315407 () Bool)

(assert (=> b!1425290 m!1315407))

(assert (=> b!1425290 m!1315407))

(declare-fun m!1315409 () Bool)

(assert (=> b!1425290 m!1315409))

(assert (=> b!1425290 m!1315409))

(assert (=> b!1425290 m!1315407))

(declare-fun m!1315411 () Bool)

(assert (=> b!1425290 m!1315411))

(push 1)

(assert (not b!1425289))

(assert (not b!1425288))

(assert (not start!122886))

(assert (not b!1425294))

(assert (not b!1425292))

(assert (not b!1425293))

(assert (not b!1425290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

