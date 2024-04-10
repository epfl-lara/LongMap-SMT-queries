; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122928 () Bool)

(assert start!122928)

(declare-fun b!1425911 () Bool)

(declare-fun res!961350 () Bool)

(declare-fun e!805515 () Bool)

(assert (=> b!1425911 (=> (not res!961350) (not e!805515))))

(declare-datatypes ((SeekEntryResult!11243 0))(
  ( (MissingZero!11243 (index!47364 (_ BitVec 32))) (Found!11243 (index!47365 (_ BitVec 32))) (Intermediate!11243 (undefined!12055 Bool) (index!47366 (_ BitVec 32)) (x!128997 (_ BitVec 32))) (Undefined!11243) (MissingVacant!11243 (index!47367 (_ BitVec 32))) )
))
(declare-fun lt!627953 () SeekEntryResult!11243)

(declare-fun lt!627951 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97293 0))(
  ( (array!97294 (arr!46964 (Array (_ BitVec 32) (_ BitVec 64))) (size!47514 (_ BitVec 32))) )
))
(declare-fun lt!627954 () array!97293)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97293 (_ BitVec 32)) SeekEntryResult!11243)

(assert (=> b!1425911 (= res!961350 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627951 lt!627954 mask!2608) lt!627953))))

(declare-fun b!1425912 () Bool)

(declare-fun e!805516 () Bool)

(declare-fun e!805514 () Bool)

(assert (=> b!1425912 (= e!805516 e!805514)))

(declare-fun res!961344 () Bool)

(assert (=> b!1425912 (=> (not res!961344) (not e!805514))))

(declare-fun lt!627952 () SeekEntryResult!11243)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97293)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425912 (= res!961344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46964 a!2831) j!81) mask!2608) (select (arr!46964 a!2831) j!81) a!2831 mask!2608) lt!627952))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425912 (= lt!627952 (Intermediate!11243 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425913 () Bool)

(declare-fun res!961347 () Bool)

(assert (=> b!1425913 (=> (not res!961347) (not e!805515))))

(assert (=> b!1425913 (= res!961347 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46964 a!2831) j!81) a!2831 mask!2608) lt!627952))))

(declare-fun b!1425914 () Bool)

(declare-fun res!961345 () Bool)

(assert (=> b!1425914 (=> (not res!961345) (not e!805516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97293 (_ BitVec 32)) Bool)

(assert (=> b!1425914 (= res!961345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425915 () Bool)

(declare-fun res!961348 () Bool)

(assert (=> b!1425915 (=> (not res!961348) (not e!805516))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425915 (= res!961348 (and (= (size!47514 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47514 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47514 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425917 () Bool)

(declare-fun res!961353 () Bool)

(assert (=> b!1425917 (=> (not res!961353) (not e!805516))))

(declare-datatypes ((List!33474 0))(
  ( (Nil!33471) (Cons!33470 (h!34772 (_ BitVec 64)) (t!48168 List!33474)) )
))
(declare-fun arrayNoDuplicates!0 (array!97293 (_ BitVec 32) List!33474) Bool)

(assert (=> b!1425917 (= res!961353 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33471))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun b!1425918 () Bool)

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1425918 (= e!805515 (and (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))) (bvsgt #b00000000000000000000000000000000 (size!47514 a!2831))))))

(declare-fun b!1425919 () Bool)

(declare-fun res!961351 () Bool)

(assert (=> b!1425919 (=> (not res!961351) (not e!805516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425919 (= res!961351 (validKeyInArray!0 (select (arr!46964 a!2831) j!81)))))

(declare-fun b!1425920 () Bool)

(declare-fun res!961346 () Bool)

(assert (=> b!1425920 (=> (not res!961346) (not e!805516))))

(assert (=> b!1425920 (= res!961346 (validKeyInArray!0 (select (arr!46964 a!2831) i!982)))))

(declare-fun b!1425921 () Bool)

(assert (=> b!1425921 (= e!805514 e!805515)))

(declare-fun res!961352 () Bool)

(assert (=> b!1425921 (=> (not res!961352) (not e!805515))))

(assert (=> b!1425921 (= res!961352 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627951 mask!2608) lt!627951 lt!627954 mask!2608) lt!627953))))

(assert (=> b!1425921 (= lt!627953 (Intermediate!11243 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1425921 (= lt!627951 (select (store (arr!46964 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425921 (= lt!627954 (array!97294 (store (arr!46964 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47514 a!2831)))))

(declare-fun res!961349 () Bool)

(assert (=> start!122928 (=> (not res!961349) (not e!805516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122928 (= res!961349 (validMask!0 mask!2608))))

(assert (=> start!122928 e!805516))

(assert (=> start!122928 true))

(declare-fun array_inv!35992 (array!97293) Bool)

(assert (=> start!122928 (array_inv!35992 a!2831)))

(declare-fun b!1425916 () Bool)

(declare-fun res!961354 () Bool)

(assert (=> b!1425916 (=> (not res!961354) (not e!805516))))

(assert (=> b!1425916 (= res!961354 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47514 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47514 a!2831))))))

(assert (= (and start!122928 res!961349) b!1425915))

(assert (= (and b!1425915 res!961348) b!1425920))

(assert (= (and b!1425920 res!961346) b!1425919))

(assert (= (and b!1425919 res!961351) b!1425914))

(assert (= (and b!1425914 res!961345) b!1425917))

(assert (= (and b!1425917 res!961353) b!1425916))

(assert (= (and b!1425916 res!961354) b!1425912))

(assert (= (and b!1425912 res!961344) b!1425921))

(assert (= (and b!1425921 res!961352) b!1425913))

(assert (= (and b!1425913 res!961347) b!1425911))

(assert (= (and b!1425911 res!961350) b!1425918))

(declare-fun m!1316523 () Bool)

(assert (=> b!1425919 m!1316523))

(assert (=> b!1425919 m!1316523))

(declare-fun m!1316525 () Bool)

(assert (=> b!1425919 m!1316525))

(assert (=> b!1425913 m!1316523))

(assert (=> b!1425913 m!1316523))

(declare-fun m!1316527 () Bool)

(assert (=> b!1425913 m!1316527))

(declare-fun m!1316529 () Bool)

(assert (=> b!1425911 m!1316529))

(declare-fun m!1316531 () Bool)

(assert (=> b!1425920 m!1316531))

(assert (=> b!1425920 m!1316531))

(declare-fun m!1316533 () Bool)

(assert (=> b!1425920 m!1316533))

(declare-fun m!1316535 () Bool)

(assert (=> b!1425917 m!1316535))

(declare-fun m!1316537 () Bool)

(assert (=> b!1425921 m!1316537))

(assert (=> b!1425921 m!1316537))

(declare-fun m!1316539 () Bool)

(assert (=> b!1425921 m!1316539))

(declare-fun m!1316541 () Bool)

(assert (=> b!1425921 m!1316541))

(declare-fun m!1316543 () Bool)

(assert (=> b!1425921 m!1316543))

(declare-fun m!1316545 () Bool)

(assert (=> start!122928 m!1316545))

(declare-fun m!1316547 () Bool)

(assert (=> start!122928 m!1316547))

(assert (=> b!1425912 m!1316523))

(assert (=> b!1425912 m!1316523))

(declare-fun m!1316549 () Bool)

(assert (=> b!1425912 m!1316549))

(assert (=> b!1425912 m!1316549))

(assert (=> b!1425912 m!1316523))

(declare-fun m!1316551 () Bool)

(assert (=> b!1425912 m!1316551))

(declare-fun m!1316553 () Bool)

(assert (=> b!1425914 m!1316553))

(push 1)

