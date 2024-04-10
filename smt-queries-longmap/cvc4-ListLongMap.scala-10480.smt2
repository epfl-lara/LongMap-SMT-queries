; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123262 () Bool)

(assert start!123262)

(declare-fun b!1429371 () Bool)

(declare-fun res!964010 () Bool)

(declare-fun e!807116 () Bool)

(assert (=> b!1429371 (=> (not res!964010) (not e!807116))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1429371 (= res!964010 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429372 () Bool)

(declare-fun res!964004 () Bool)

(assert (=> b!1429372 (=> (not res!964004) (not e!807116))))

(declare-datatypes ((array!97423 0))(
  ( (array!97424 (arr!47023 (Array (_ BitVec 32) (_ BitVec 64))) (size!47573 (_ BitVec 32))) )
))
(declare-fun lt!629340 () array!97423)

(declare-datatypes ((SeekEntryResult!11302 0))(
  ( (MissingZero!11302 (index!47600 (_ BitVec 32))) (Found!11302 (index!47601 (_ BitVec 32))) (Intermediate!11302 (undefined!12114 Bool) (index!47602 (_ BitVec 32)) (x!129232 (_ BitVec 32))) (Undefined!11302) (MissingVacant!11302 (index!47603 (_ BitVec 32))) )
))
(declare-fun lt!629341 () SeekEntryResult!11302)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!629342 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97423 (_ BitVec 32)) SeekEntryResult!11302)

(assert (=> b!1429372 (= res!964004 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629342 lt!629340 mask!2608) lt!629341))))

(declare-fun b!1429373 () Bool)

(declare-fun res!964009 () Bool)

(declare-fun e!807112 () Bool)

(assert (=> b!1429373 (=> (not res!964009) (not e!807112))))

(declare-fun a!2831 () array!97423)

(assert (=> b!1429373 (= res!964009 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47573 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47573 a!2831))))))

(declare-fun b!1429374 () Bool)

(declare-fun res!964001 () Bool)

(assert (=> b!1429374 (=> (not res!964001) (not e!807116))))

(declare-fun lt!629343 () SeekEntryResult!11302)

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1429374 (= res!964001 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47023 a!2831) j!81) a!2831 mask!2608) lt!629343))))

(declare-fun b!1429376 () Bool)

(declare-fun res!964006 () Bool)

(assert (=> b!1429376 (=> (not res!964006) (not e!807112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429376 (= res!964006 (validKeyInArray!0 (select (arr!47023 a!2831) j!81)))))

(declare-fun b!1429377 () Bool)

(declare-fun res!964008 () Bool)

(assert (=> b!1429377 (=> (not res!964008) (not e!807112))))

(declare-datatypes ((List!33533 0))(
  ( (Nil!33530) (Cons!33529 (h!34843 (_ BitVec 64)) (t!48227 List!33533)) )
))
(declare-fun arrayNoDuplicates!0 (array!97423 (_ BitVec 32) List!33533) Bool)

(assert (=> b!1429377 (= res!964008 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33530))))

(declare-fun b!1429378 () Bool)

(assert (=> b!1429378 (= e!807116 (not true))))

(declare-fun e!807114 () Bool)

(assert (=> b!1429378 e!807114))

(declare-fun res!964002 () Bool)

(assert (=> b!1429378 (=> (not res!964002) (not e!807114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97423 (_ BitVec 32)) Bool)

(assert (=> b!1429378 (= res!964002 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48350 0))(
  ( (Unit!48351) )
))
(declare-fun lt!629339 () Unit!48350)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48350)

(assert (=> b!1429378 (= lt!629339 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429379 () Bool)

(declare-fun e!807115 () Bool)

(assert (=> b!1429379 (= e!807112 e!807115)))

(declare-fun res!964003 () Bool)

(assert (=> b!1429379 (=> (not res!964003) (not e!807115))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429379 (= res!964003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47023 a!2831) j!81) mask!2608) (select (arr!47023 a!2831) j!81) a!2831 mask!2608) lt!629343))))

(assert (=> b!1429379 (= lt!629343 (Intermediate!11302 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429380 () Bool)

(declare-fun res!964011 () Bool)

(assert (=> b!1429380 (=> (not res!964011) (not e!807112))))

(assert (=> b!1429380 (= res!964011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429381 () Bool)

(declare-fun res!964005 () Bool)

(assert (=> b!1429381 (=> (not res!964005) (not e!807112))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429381 (= res!964005 (validKeyInArray!0 (select (arr!47023 a!2831) i!982)))))

(declare-fun b!1429382 () Bool)

(assert (=> b!1429382 (= e!807115 e!807116)))

(declare-fun res!964000 () Bool)

(assert (=> b!1429382 (=> (not res!964000) (not e!807116))))

(assert (=> b!1429382 (= res!964000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629342 mask!2608) lt!629342 lt!629340 mask!2608) lt!629341))))

(assert (=> b!1429382 (= lt!629341 (Intermediate!11302 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429382 (= lt!629342 (select (store (arr!47023 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429382 (= lt!629340 (array!97424 (store (arr!47023 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47573 a!2831)))))

(declare-fun b!1429383 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97423 (_ BitVec 32)) SeekEntryResult!11302)

(assert (=> b!1429383 (= e!807114 (= (seekEntryOrOpen!0 (select (arr!47023 a!2831) j!81) a!2831 mask!2608) (Found!11302 j!81)))))

(declare-fun b!1429375 () Bool)

(declare-fun res!964012 () Bool)

(assert (=> b!1429375 (=> (not res!964012) (not e!807112))))

(assert (=> b!1429375 (= res!964012 (and (= (size!47573 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47573 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47573 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!964007 () Bool)

(assert (=> start!123262 (=> (not res!964007) (not e!807112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123262 (= res!964007 (validMask!0 mask!2608))))

(assert (=> start!123262 e!807112))

(assert (=> start!123262 true))

(declare-fun array_inv!36051 (array!97423) Bool)

(assert (=> start!123262 (array_inv!36051 a!2831)))

(assert (= (and start!123262 res!964007) b!1429375))

(assert (= (and b!1429375 res!964012) b!1429381))

(assert (= (and b!1429381 res!964005) b!1429376))

(assert (= (and b!1429376 res!964006) b!1429380))

(assert (= (and b!1429380 res!964011) b!1429377))

(assert (= (and b!1429377 res!964008) b!1429373))

(assert (= (and b!1429373 res!964009) b!1429379))

(assert (= (and b!1429379 res!964003) b!1429382))

(assert (= (and b!1429382 res!964000) b!1429374))

(assert (= (and b!1429374 res!964001) b!1429372))

(assert (= (and b!1429372 res!964004) b!1429371))

(assert (= (and b!1429371 res!964010) b!1429378))

(assert (= (and b!1429378 res!964002) b!1429383))

(declare-fun m!1319473 () Bool)

(assert (=> b!1429382 m!1319473))

(assert (=> b!1429382 m!1319473))

(declare-fun m!1319475 () Bool)

(assert (=> b!1429382 m!1319475))

(declare-fun m!1319477 () Bool)

(assert (=> b!1429382 m!1319477))

(declare-fun m!1319479 () Bool)

(assert (=> b!1429382 m!1319479))

(declare-fun m!1319481 () Bool)

(assert (=> b!1429377 m!1319481))

(declare-fun m!1319483 () Bool)

(assert (=> b!1429372 m!1319483))

(declare-fun m!1319485 () Bool)

(assert (=> b!1429378 m!1319485))

(declare-fun m!1319487 () Bool)

(assert (=> b!1429378 m!1319487))

(declare-fun m!1319489 () Bool)

(assert (=> start!123262 m!1319489))

(declare-fun m!1319491 () Bool)

(assert (=> start!123262 m!1319491))

(declare-fun m!1319493 () Bool)

(assert (=> b!1429379 m!1319493))

(assert (=> b!1429379 m!1319493))

(declare-fun m!1319495 () Bool)

(assert (=> b!1429379 m!1319495))

(assert (=> b!1429379 m!1319495))

(assert (=> b!1429379 m!1319493))

(declare-fun m!1319497 () Bool)

(assert (=> b!1429379 m!1319497))

(assert (=> b!1429376 m!1319493))

(assert (=> b!1429376 m!1319493))

(declare-fun m!1319499 () Bool)

(assert (=> b!1429376 m!1319499))

(assert (=> b!1429383 m!1319493))

(assert (=> b!1429383 m!1319493))

(declare-fun m!1319501 () Bool)

(assert (=> b!1429383 m!1319501))

(declare-fun m!1319503 () Bool)

(assert (=> b!1429380 m!1319503))

(assert (=> b!1429374 m!1319493))

(assert (=> b!1429374 m!1319493))

(declare-fun m!1319505 () Bool)

(assert (=> b!1429374 m!1319505))

(declare-fun m!1319507 () Bool)

(assert (=> b!1429381 m!1319507))

(assert (=> b!1429381 m!1319507))

(declare-fun m!1319509 () Bool)

(assert (=> b!1429381 m!1319509))

(push 1)

