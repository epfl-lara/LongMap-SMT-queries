; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123392 () Bool)

(assert start!123392)

(declare-fun b!1429380 () Bool)

(declare-fun res!963329 () Bool)

(declare-fun e!807416 () Bool)

(assert (=> b!1429380 (=> (not res!963329) (not e!807416))))

(declare-datatypes ((array!97475 0))(
  ( (array!97476 (arr!47047 (Array (_ BitVec 32) (_ BitVec 64))) (size!47598 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97475)

(declare-datatypes ((List!33544 0))(
  ( (Nil!33541) (Cons!33540 (h!34862 (_ BitVec 64)) (t!48230 List!33544)) )
))
(declare-fun arrayNoDuplicates!0 (array!97475 (_ BitVec 32) List!33544) Bool)

(assert (=> b!1429380 (= res!963329 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33541))))

(declare-fun b!1429381 () Bool)

(declare-fun e!807415 () Bool)

(assert (=> b!1429381 (= e!807415 (not true))))

(declare-fun e!807419 () Bool)

(assert (=> b!1429381 e!807419))

(declare-fun res!963332 () Bool)

(assert (=> b!1429381 (=> (not res!963332) (not e!807419))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97475 (_ BitVec 32)) Bool)

(assert (=> b!1429381 (= res!963332 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48233 0))(
  ( (Unit!48234) )
))
(declare-fun lt!629303 () Unit!48233)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48233)

(assert (=> b!1429381 (= lt!629303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429382 () Bool)

(declare-fun res!963325 () Bool)

(assert (=> b!1429382 (=> (not res!963325) (not e!807415))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429382 (= res!963325 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429383 () Bool)

(declare-fun e!807418 () Bool)

(assert (=> b!1429383 (= e!807416 e!807418)))

(declare-fun res!963337 () Bool)

(assert (=> b!1429383 (=> (not res!963337) (not e!807418))))

(declare-datatypes ((SeekEntryResult!11228 0))(
  ( (MissingZero!11228 (index!47304 (_ BitVec 32))) (Found!11228 (index!47305 (_ BitVec 32))) (Intermediate!11228 (undefined!12040 Bool) (index!47306 (_ BitVec 32)) (x!129105 (_ BitVec 32))) (Undefined!11228) (MissingVacant!11228 (index!47307 (_ BitVec 32))) )
))
(declare-fun lt!629304 () SeekEntryResult!11228)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97475 (_ BitVec 32)) SeekEntryResult!11228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429383 (= res!963337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47047 a!2831) j!81) mask!2608) (select (arr!47047 a!2831) j!81) a!2831 mask!2608) lt!629304))))

(assert (=> b!1429383 (= lt!629304 (Intermediate!11228 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429385 () Bool)

(assert (=> b!1429385 (= e!807418 e!807415)))

(declare-fun res!963328 () Bool)

(assert (=> b!1429385 (=> (not res!963328) (not e!807415))))

(declare-fun lt!629302 () (_ BitVec 64))

(declare-fun lt!629305 () SeekEntryResult!11228)

(declare-fun lt!629306 () array!97475)

(assert (=> b!1429385 (= res!963328 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629302 mask!2608) lt!629302 lt!629306 mask!2608) lt!629305))))

(assert (=> b!1429385 (= lt!629305 (Intermediate!11228 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429385 (= lt!629302 (select (store (arr!47047 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429385 (= lt!629306 (array!97476 (store (arr!47047 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47598 a!2831)))))

(declare-fun b!1429386 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97475 (_ BitVec 32)) SeekEntryResult!11228)

(assert (=> b!1429386 (= e!807419 (= (seekEntryOrOpen!0 (select (arr!47047 a!2831) j!81) a!2831 mask!2608) (Found!11228 j!81)))))

(declare-fun b!1429387 () Bool)

(declare-fun res!963336 () Bool)

(assert (=> b!1429387 (=> (not res!963336) (not e!807416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429387 (= res!963336 (validKeyInArray!0 (select (arr!47047 a!2831) i!982)))))

(declare-fun b!1429388 () Bool)

(declare-fun res!963330 () Bool)

(assert (=> b!1429388 (=> (not res!963330) (not e!807416))))

(assert (=> b!1429388 (= res!963330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429389 () Bool)

(declare-fun res!963326 () Bool)

(assert (=> b!1429389 (=> (not res!963326) (not e!807416))))

(assert (=> b!1429389 (= res!963326 (validKeyInArray!0 (select (arr!47047 a!2831) j!81)))))

(declare-fun b!1429390 () Bool)

(declare-fun res!963331 () Bool)

(assert (=> b!1429390 (=> (not res!963331) (not e!807415))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1429390 (= res!963331 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47047 a!2831) j!81) a!2831 mask!2608) lt!629304))))

(declare-fun b!1429384 () Bool)

(declare-fun res!963334 () Bool)

(assert (=> b!1429384 (=> (not res!963334) (not e!807416))))

(assert (=> b!1429384 (= res!963334 (and (= (size!47598 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47598 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47598 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!963333 () Bool)

(assert (=> start!123392 (=> (not res!963333) (not e!807416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123392 (= res!963333 (validMask!0 mask!2608))))

(assert (=> start!123392 e!807416))

(assert (=> start!123392 true))

(declare-fun array_inv!36328 (array!97475) Bool)

(assert (=> start!123392 (array_inv!36328 a!2831)))

(declare-fun b!1429391 () Bool)

(declare-fun res!963335 () Bool)

(assert (=> b!1429391 (=> (not res!963335) (not e!807416))))

(assert (=> b!1429391 (= res!963335 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47598 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47598 a!2831))))))

(declare-fun b!1429392 () Bool)

(declare-fun res!963327 () Bool)

(assert (=> b!1429392 (=> (not res!963327) (not e!807415))))

(assert (=> b!1429392 (= res!963327 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629302 lt!629306 mask!2608) lt!629305))))

(assert (= (and start!123392 res!963333) b!1429384))

(assert (= (and b!1429384 res!963334) b!1429387))

(assert (= (and b!1429387 res!963336) b!1429389))

(assert (= (and b!1429389 res!963326) b!1429388))

(assert (= (and b!1429388 res!963330) b!1429380))

(assert (= (and b!1429380 res!963329) b!1429391))

(assert (= (and b!1429391 res!963335) b!1429383))

(assert (= (and b!1429383 res!963337) b!1429385))

(assert (= (and b!1429385 res!963328) b!1429390))

(assert (= (and b!1429390 res!963331) b!1429392))

(assert (= (and b!1429392 res!963327) b!1429382))

(assert (= (and b!1429382 res!963325) b!1429381))

(assert (= (and b!1429381 res!963332) b!1429386))

(declare-fun m!1319745 () Bool)

(assert (=> b!1429383 m!1319745))

(assert (=> b!1429383 m!1319745))

(declare-fun m!1319747 () Bool)

(assert (=> b!1429383 m!1319747))

(assert (=> b!1429383 m!1319747))

(assert (=> b!1429383 m!1319745))

(declare-fun m!1319749 () Bool)

(assert (=> b!1429383 m!1319749))

(declare-fun m!1319751 () Bool)

(assert (=> b!1429388 m!1319751))

(assert (=> b!1429390 m!1319745))

(assert (=> b!1429390 m!1319745))

(declare-fun m!1319753 () Bool)

(assert (=> b!1429390 m!1319753))

(declare-fun m!1319755 () Bool)

(assert (=> start!123392 m!1319755))

(declare-fun m!1319757 () Bool)

(assert (=> start!123392 m!1319757))

(declare-fun m!1319759 () Bool)

(assert (=> b!1429392 m!1319759))

(declare-fun m!1319761 () Bool)

(assert (=> b!1429380 m!1319761))

(declare-fun m!1319763 () Bool)

(assert (=> b!1429385 m!1319763))

(assert (=> b!1429385 m!1319763))

(declare-fun m!1319765 () Bool)

(assert (=> b!1429385 m!1319765))

(declare-fun m!1319767 () Bool)

(assert (=> b!1429385 m!1319767))

(declare-fun m!1319769 () Bool)

(assert (=> b!1429385 m!1319769))

(assert (=> b!1429386 m!1319745))

(assert (=> b!1429386 m!1319745))

(declare-fun m!1319771 () Bool)

(assert (=> b!1429386 m!1319771))

(declare-fun m!1319773 () Bool)

(assert (=> b!1429387 m!1319773))

(assert (=> b!1429387 m!1319773))

(declare-fun m!1319775 () Bool)

(assert (=> b!1429387 m!1319775))

(assert (=> b!1429389 m!1319745))

(assert (=> b!1429389 m!1319745))

(declare-fun m!1319777 () Bool)

(assert (=> b!1429389 m!1319777))

(declare-fun m!1319779 () Bool)

(assert (=> b!1429381 m!1319779))

(declare-fun m!1319781 () Bool)

(assert (=> b!1429381 m!1319781))

(check-sat (not b!1429386) (not b!1429383) (not b!1429390) (not b!1429388) (not b!1429392) (not b!1429380) (not b!1429389) (not b!1429385) (not start!123392) (not b!1429387) (not b!1429381))
(check-sat)
