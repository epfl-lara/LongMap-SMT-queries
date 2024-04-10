; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122842 () Bool)

(assert start!122842)

(declare-fun b!1424847 () Bool)

(declare-fun res!960282 () Bool)

(declare-fun e!805199 () Bool)

(assert (=> b!1424847 (=> (not res!960282) (not e!805199))))

(declare-datatypes ((array!97207 0))(
  ( (array!97208 (arr!46921 (Array (_ BitVec 32) (_ BitVec 64))) (size!47471 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97207)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424847 (= res!960282 (validKeyInArray!0 (select (arr!46921 a!2831) i!982)))))

(declare-fun b!1424848 () Bool)

(declare-fun res!960287 () Bool)

(assert (=> b!1424848 (=> (not res!960287) (not e!805199))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97207 (_ BitVec 32)) Bool)

(assert (=> b!1424848 (= res!960287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424849 () Bool)

(declare-fun res!960281 () Bool)

(assert (=> b!1424849 (=> (not res!960281) (not e!805199))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424849 (= res!960281 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47471 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47471 a!2831))))))

(declare-fun b!1424850 () Bool)

(declare-fun e!805197 () Bool)

(declare-fun e!805196 () Bool)

(assert (=> b!1424850 (= e!805197 e!805196)))

(declare-fun res!960280 () Bool)

(assert (=> b!1424850 (=> res!960280 e!805196)))

(declare-fun lt!627735 () (_ BitVec 32))

(assert (=> b!1424850 (= res!960280 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627735 #b00000000000000000000000000000000) (bvsge lt!627735 (size!47471 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424850 (= lt!627735 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424851 () Bool)

(declare-fun res!960288 () Bool)

(assert (=> b!1424851 (=> (not res!960288) (not e!805199))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1424851 (= res!960288 (and (= (size!47471 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47471 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47471 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424852 () Bool)

(declare-fun res!960294 () Bool)

(declare-fun e!805194 () Bool)

(assert (=> b!1424852 (=> (not res!960294) (not e!805194))))

(declare-datatypes ((SeekEntryResult!11206 0))(
  ( (MissingZero!11206 (index!47216 (_ BitVec 32))) (Found!11206 (index!47217 (_ BitVec 32))) (Intermediate!11206 (undefined!12018 Bool) (index!47218 (_ BitVec 32)) (x!128840 (_ BitVec 32))) (Undefined!11206) (MissingVacant!11206 (index!47219 (_ BitVec 32))) )
))
(declare-fun lt!627732 () SeekEntryResult!11206)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97207 (_ BitVec 32)) SeekEntryResult!11206)

(assert (=> b!1424852 (= res!960294 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46921 a!2831) j!81) a!2831 mask!2608) lt!627732))))

(declare-fun res!960293 () Bool)

(assert (=> start!122842 (=> (not res!960293) (not e!805199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122842 (= res!960293 (validMask!0 mask!2608))))

(assert (=> start!122842 e!805199))

(assert (=> start!122842 true))

(declare-fun array_inv!35949 (array!97207) Bool)

(assert (=> start!122842 (array_inv!35949 a!2831)))

(declare-fun b!1424853 () Bool)

(declare-fun res!960284 () Bool)

(assert (=> b!1424853 (=> (not res!960284) (not e!805194))))

(declare-fun lt!627729 () (_ BitVec 64))

(declare-fun lt!627730 () SeekEntryResult!11206)

(declare-fun lt!627733 () array!97207)

(assert (=> b!1424853 (= res!960284 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627729 lt!627733 mask!2608) lt!627730))))

(declare-fun b!1424854 () Bool)

(declare-fun e!805198 () Bool)

(assert (=> b!1424854 (= e!805198 e!805194)))

(declare-fun res!960285 () Bool)

(assert (=> b!1424854 (=> (not res!960285) (not e!805194))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424854 (= res!960285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627729 mask!2608) lt!627729 lt!627733 mask!2608) lt!627730))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424854 (= lt!627730 (Intermediate!11206 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424854 (= lt!627729 (select (store (arr!46921 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424854 (= lt!627733 (array!97208 (store (arr!46921 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47471 a!2831)))))

(declare-fun b!1424855 () Bool)

(declare-fun res!960290 () Bool)

(assert (=> b!1424855 (=> res!960290 e!805196)))

(assert (=> b!1424855 (= res!960290 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627735 (select (arr!46921 a!2831) j!81) a!2831 mask!2608) lt!627732)))))

(declare-fun b!1424856 () Bool)

(assert (=> b!1424856 (= e!805199 e!805198)))

(declare-fun res!960295 () Bool)

(assert (=> b!1424856 (=> (not res!960295) (not e!805198))))

(assert (=> b!1424856 (= res!960295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46921 a!2831) j!81) mask!2608) (select (arr!46921 a!2831) j!81) a!2831 mask!2608) lt!627732))))

(assert (=> b!1424856 (= lt!627732 (Intermediate!11206 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424857 () Bool)

(declare-fun res!960283 () Bool)

(assert (=> b!1424857 (=> (not res!960283) (not e!805199))))

(declare-datatypes ((List!33431 0))(
  ( (Nil!33428) (Cons!33427 (h!34729 (_ BitVec 64)) (t!48125 List!33431)) )
))
(declare-fun arrayNoDuplicates!0 (array!97207 (_ BitVec 32) List!33431) Bool)

(assert (=> b!1424857 (= res!960283 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33428))))

(declare-fun e!805195 () Bool)

(declare-fun b!1424858 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97207 (_ BitVec 32)) SeekEntryResult!11206)

(assert (=> b!1424858 (= e!805195 (= (seekEntryOrOpen!0 (select (arr!46921 a!2831) j!81) a!2831 mask!2608) (Found!11206 j!81)))))

(declare-fun b!1424859 () Bool)

(assert (=> b!1424859 (= e!805196 true)))

(declare-fun lt!627731 () SeekEntryResult!11206)

(assert (=> b!1424859 (= lt!627731 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627735 lt!627729 lt!627733 mask!2608))))

(declare-fun b!1424860 () Bool)

(declare-fun res!960289 () Bool)

(assert (=> b!1424860 (=> (not res!960289) (not e!805199))))

(assert (=> b!1424860 (= res!960289 (validKeyInArray!0 (select (arr!46921 a!2831) j!81)))))

(declare-fun b!1424861 () Bool)

(assert (=> b!1424861 (= e!805194 (not e!805197))))

(declare-fun res!960286 () Bool)

(assert (=> b!1424861 (=> res!960286 e!805197)))

(assert (=> b!1424861 (= res!960286 (or (= (select (arr!46921 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46921 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46921 a!2831) index!585) (select (arr!46921 a!2831) j!81)) (= (select (store (arr!46921 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424861 e!805195))

(declare-fun res!960291 () Bool)

(assert (=> b!1424861 (=> (not res!960291) (not e!805195))))

(assert (=> b!1424861 (= res!960291 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48248 0))(
  ( (Unit!48249) )
))
(declare-fun lt!627734 () Unit!48248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48248)

(assert (=> b!1424861 (= lt!627734 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424862 () Bool)

(declare-fun res!960292 () Bool)

(assert (=> b!1424862 (=> (not res!960292) (not e!805194))))

(assert (=> b!1424862 (= res!960292 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122842 res!960293) b!1424851))

(assert (= (and b!1424851 res!960288) b!1424847))

(assert (= (and b!1424847 res!960282) b!1424860))

(assert (= (and b!1424860 res!960289) b!1424848))

(assert (= (and b!1424848 res!960287) b!1424857))

(assert (= (and b!1424857 res!960283) b!1424849))

(assert (= (and b!1424849 res!960281) b!1424856))

(assert (= (and b!1424856 res!960295) b!1424854))

(assert (= (and b!1424854 res!960285) b!1424852))

(assert (= (and b!1424852 res!960294) b!1424853))

(assert (= (and b!1424853 res!960284) b!1424862))

(assert (= (and b!1424862 res!960292) b!1424861))

(assert (= (and b!1424861 res!960291) b!1424858))

(assert (= (and b!1424861 (not res!960286)) b!1424850))

(assert (= (and b!1424850 (not res!960280)) b!1424855))

(assert (= (and b!1424855 (not res!960290)) b!1424859))

(declare-fun m!1315395 () Bool)

(assert (=> b!1424861 m!1315395))

(declare-fun m!1315397 () Bool)

(assert (=> b!1424861 m!1315397))

(declare-fun m!1315399 () Bool)

(assert (=> b!1424861 m!1315399))

(declare-fun m!1315401 () Bool)

(assert (=> b!1424861 m!1315401))

(declare-fun m!1315403 () Bool)

(assert (=> b!1424861 m!1315403))

(declare-fun m!1315405 () Bool)

(assert (=> b!1424861 m!1315405))

(declare-fun m!1315407 () Bool)

(assert (=> b!1424854 m!1315407))

(assert (=> b!1424854 m!1315407))

(declare-fun m!1315409 () Bool)

(assert (=> b!1424854 m!1315409))

(assert (=> b!1424854 m!1315395))

(declare-fun m!1315411 () Bool)

(assert (=> b!1424854 m!1315411))

(assert (=> b!1424852 m!1315403))

(assert (=> b!1424852 m!1315403))

(declare-fun m!1315413 () Bool)

(assert (=> b!1424852 m!1315413))

(declare-fun m!1315415 () Bool)

(assert (=> b!1424850 m!1315415))

(declare-fun m!1315417 () Bool)

(assert (=> b!1424853 m!1315417))

(assert (=> b!1424855 m!1315403))

(assert (=> b!1424855 m!1315403))

(declare-fun m!1315419 () Bool)

(assert (=> b!1424855 m!1315419))

(assert (=> b!1424860 m!1315403))

(assert (=> b!1424860 m!1315403))

(declare-fun m!1315421 () Bool)

(assert (=> b!1424860 m!1315421))

(assert (=> b!1424858 m!1315403))

(assert (=> b!1424858 m!1315403))

(declare-fun m!1315423 () Bool)

(assert (=> b!1424858 m!1315423))

(declare-fun m!1315425 () Bool)

(assert (=> b!1424847 m!1315425))

(assert (=> b!1424847 m!1315425))

(declare-fun m!1315427 () Bool)

(assert (=> b!1424847 m!1315427))

(declare-fun m!1315429 () Bool)

(assert (=> start!122842 m!1315429))

(declare-fun m!1315431 () Bool)

(assert (=> start!122842 m!1315431))

(declare-fun m!1315433 () Bool)

(assert (=> b!1424848 m!1315433))

(assert (=> b!1424856 m!1315403))

(assert (=> b!1424856 m!1315403))

(declare-fun m!1315435 () Bool)

(assert (=> b!1424856 m!1315435))

(assert (=> b!1424856 m!1315435))

(assert (=> b!1424856 m!1315403))

(declare-fun m!1315437 () Bool)

(assert (=> b!1424856 m!1315437))

(declare-fun m!1315439 () Bool)

(assert (=> b!1424859 m!1315439))

(declare-fun m!1315441 () Bool)

(assert (=> b!1424857 m!1315441))

(push 1)

