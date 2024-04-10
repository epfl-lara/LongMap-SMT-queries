; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123088 () Bool)

(assert start!123088)

(declare-fun b!1427466 () Bool)

(declare-fun res!962506 () Bool)

(declare-fun e!806242 () Bool)

(assert (=> b!1427466 (=> (not res!962506) (not e!806242))))

(declare-datatypes ((array!97351 0))(
  ( (array!97352 (arr!46990 (Array (_ BitVec 32) (_ BitVec 64))) (size!47540 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97351)

(declare-datatypes ((List!33500 0))(
  ( (Nil!33497) (Cons!33496 (h!34804 (_ BitVec 64)) (t!48194 List!33500)) )
))
(declare-fun arrayNoDuplicates!0 (array!97351 (_ BitVec 32) List!33500) Bool)

(assert (=> b!1427466 (= res!962506 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33497))))

(declare-fun res!962504 () Bool)

(assert (=> start!123088 (=> (not res!962504) (not e!806242))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123088 (= res!962504 (validMask!0 mask!2608))))

(assert (=> start!123088 e!806242))

(assert (=> start!123088 true))

(declare-fun array_inv!36018 (array!97351) Bool)

(assert (=> start!123088 (array_inv!36018 a!2831)))

(declare-fun b!1427467 () Bool)

(declare-fun e!806239 () Bool)

(declare-fun e!806243 () Bool)

(assert (=> b!1427467 (= e!806239 e!806243)))

(declare-fun res!962497 () Bool)

(assert (=> b!1427467 (=> (not res!962497) (not e!806243))))

(declare-fun lt!628580 () array!97351)

(declare-fun lt!628581 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11269 0))(
  ( (MissingZero!11269 (index!47468 (_ BitVec 32))) (Found!11269 (index!47469 (_ BitVec 32))) (Intermediate!11269 (undefined!12081 Bool) (index!47470 (_ BitVec 32)) (x!129099 (_ BitVec 32))) (Undefined!11269) (MissingVacant!11269 (index!47471 (_ BitVec 32))) )
))
(declare-fun lt!628582 () SeekEntryResult!11269)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97351 (_ BitVec 32)) SeekEntryResult!11269)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427467 (= res!962497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628581 mask!2608) lt!628581 lt!628580 mask!2608) lt!628582))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427467 (= lt!628582 (Intermediate!11269 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427467 (= lt!628581 (select (store (arr!46990 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427467 (= lt!628580 (array!97352 (store (arr!46990 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47540 a!2831)))))

(declare-fun b!1427468 () Bool)

(declare-fun res!962509 () Bool)

(assert (=> b!1427468 (=> (not res!962509) (not e!806243))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628584 () SeekEntryResult!11269)

(assert (=> b!1427468 (= res!962509 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46990 a!2831) j!81) a!2831 mask!2608) lt!628584))))

(declare-fun b!1427469 () Bool)

(assert (=> b!1427469 (= e!806242 e!806239)))

(declare-fun res!962501 () Bool)

(assert (=> b!1427469 (=> (not res!962501) (not e!806239))))

(assert (=> b!1427469 (= res!962501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46990 a!2831) j!81) mask!2608) (select (arr!46990 a!2831) j!81) a!2831 mask!2608) lt!628584))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1427469 (= lt!628584 (Intermediate!11269 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427470 () Bool)

(declare-fun res!962503 () Bool)

(assert (=> b!1427470 (=> (not res!962503) (not e!806242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427470 (= res!962503 (validKeyInArray!0 (select (arr!46990 a!2831) j!81)))))

(declare-fun b!1427471 () Bool)

(declare-fun res!962500 () Bool)

(assert (=> b!1427471 (=> (not res!962500) (not e!806242))))

(assert (=> b!1427471 (= res!962500 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47540 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47540 a!2831))))))

(declare-fun b!1427472 () Bool)

(declare-fun res!962498 () Bool)

(assert (=> b!1427472 (=> (not res!962498) (not e!806242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97351 (_ BitVec 32)) Bool)

(assert (=> b!1427472 (= res!962498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427473 () Bool)

(declare-fun res!962508 () Bool)

(assert (=> b!1427473 (=> (not res!962508) (not e!806242))))

(assert (=> b!1427473 (= res!962508 (validKeyInArray!0 (select (arr!46990 a!2831) i!982)))))

(declare-fun b!1427474 () Bool)

(declare-fun res!962499 () Bool)

(assert (=> b!1427474 (=> (not res!962499) (not e!806242))))

(assert (=> b!1427474 (= res!962499 (and (= (size!47540 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47540 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47540 a!2831)) (not (= i!982 j!81))))))

(declare-fun e!806241 () Bool)

(declare-fun b!1427475 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97351 (_ BitVec 32)) SeekEntryResult!11269)

(assert (=> b!1427475 (= e!806241 (= (seekEntryOrOpen!0 (select (arr!46990 a!2831) j!81) a!2831 mask!2608) (Found!11269 j!81)))))

(declare-fun b!1427476 () Bool)

(declare-fun res!962502 () Bool)

(assert (=> b!1427476 (=> (not res!962502) (not e!806243))))

(assert (=> b!1427476 (= res!962502 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427477 () Bool)

(assert (=> b!1427477 (= e!806243 (not true))))

(assert (=> b!1427477 e!806241))

(declare-fun res!962505 () Bool)

(assert (=> b!1427477 (=> (not res!962505) (not e!806241))))

(assert (=> b!1427477 (= res!962505 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48284 0))(
  ( (Unit!48285) )
))
(declare-fun lt!628583 () Unit!48284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97351 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48284)

(assert (=> b!1427477 (= lt!628583 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427478 () Bool)

(declare-fun res!962507 () Bool)

(assert (=> b!1427478 (=> (not res!962507) (not e!806243))))

(assert (=> b!1427478 (= res!962507 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628581 lt!628580 mask!2608) lt!628582))))

(assert (= (and start!123088 res!962504) b!1427474))

(assert (= (and b!1427474 res!962499) b!1427473))

(assert (= (and b!1427473 res!962508) b!1427470))

(assert (= (and b!1427470 res!962503) b!1427472))

(assert (= (and b!1427472 res!962498) b!1427466))

(assert (= (and b!1427466 res!962506) b!1427471))

(assert (= (and b!1427471 res!962500) b!1427469))

(assert (= (and b!1427469 res!962501) b!1427467))

(assert (= (and b!1427467 res!962497) b!1427468))

(assert (= (and b!1427468 res!962509) b!1427478))

(assert (= (and b!1427478 res!962507) b!1427476))

(assert (= (and b!1427476 res!962502) b!1427477))

(assert (= (and b!1427477 res!962505) b!1427475))

(declare-fun m!1317835 () Bool)

(assert (=> b!1427472 m!1317835))

(declare-fun m!1317837 () Bool)

(assert (=> b!1427475 m!1317837))

(assert (=> b!1427475 m!1317837))

(declare-fun m!1317839 () Bool)

(assert (=> b!1427475 m!1317839))

(declare-fun m!1317841 () Bool)

(assert (=> b!1427478 m!1317841))

(declare-fun m!1317843 () Bool)

(assert (=> b!1427466 m!1317843))

(assert (=> b!1427469 m!1317837))

(assert (=> b!1427469 m!1317837))

(declare-fun m!1317845 () Bool)

(assert (=> b!1427469 m!1317845))

(assert (=> b!1427469 m!1317845))

(assert (=> b!1427469 m!1317837))

(declare-fun m!1317847 () Bool)

(assert (=> b!1427469 m!1317847))

(assert (=> b!1427468 m!1317837))

(assert (=> b!1427468 m!1317837))

(declare-fun m!1317849 () Bool)

(assert (=> b!1427468 m!1317849))

(declare-fun m!1317851 () Bool)

(assert (=> b!1427477 m!1317851))

(declare-fun m!1317853 () Bool)

(assert (=> b!1427477 m!1317853))

(declare-fun m!1317855 () Bool)

(assert (=> b!1427467 m!1317855))

(assert (=> b!1427467 m!1317855))

(declare-fun m!1317857 () Bool)

(assert (=> b!1427467 m!1317857))

(declare-fun m!1317859 () Bool)

(assert (=> b!1427467 m!1317859))

(declare-fun m!1317861 () Bool)

(assert (=> b!1427467 m!1317861))

(assert (=> b!1427470 m!1317837))

(assert (=> b!1427470 m!1317837))

(declare-fun m!1317863 () Bool)

(assert (=> b!1427470 m!1317863))

(declare-fun m!1317865 () Bool)

(assert (=> b!1427473 m!1317865))

(assert (=> b!1427473 m!1317865))

(declare-fun m!1317867 () Bool)

(assert (=> b!1427473 m!1317867))

(declare-fun m!1317869 () Bool)

(assert (=> start!123088 m!1317869))

(declare-fun m!1317871 () Bool)

(assert (=> start!123088 m!1317871))

(push 1)

(assert (not b!1427475))

