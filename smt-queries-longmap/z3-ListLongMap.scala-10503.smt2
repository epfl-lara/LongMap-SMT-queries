; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123716 () Bool)

(assert start!123716)

(declare-fun b!1433987 () Bool)

(declare-fun e!809381 () Bool)

(declare-fun e!809377 () Bool)

(assert (=> b!1433987 (= e!809381 e!809377)))

(declare-fun res!967452 () Bool)

(assert (=> b!1433987 (=> (not res!967452) (not e!809377))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97574 0))(
  ( (array!97575 (arr!47091 (Array (_ BitVec 32) (_ BitVec 64))) (size!47641 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97574)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11370 0))(
  ( (MissingZero!11370 (index!47872 (_ BitVec 32))) (Found!11370 (index!47873 (_ BitVec 32))) (Intermediate!11370 (undefined!12182 Bool) (index!47874 (_ BitVec 32)) (x!129526 (_ BitVec 32))) (Undefined!11370) (MissingVacant!11370 (index!47875 (_ BitVec 32))) )
))
(declare-fun lt!631277 () SeekEntryResult!11370)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97574 (_ BitVec 32)) SeekEntryResult!11370)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433987 (= res!967452 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47091 a!2831) j!81) mask!2608) (select (arr!47091 a!2831) j!81) a!2831 mask!2608) lt!631277))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1433987 (= lt!631277 (Intermediate!11370 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433988 () Bool)

(declare-fun e!809380 () Bool)

(assert (=> b!1433988 (= e!809380 true)))

(declare-fun lt!631273 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433988 (= lt!631273 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433990 () Bool)

(declare-fun res!967461 () Bool)

(assert (=> b!1433990 (=> (not res!967461) (not e!809381))))

(declare-datatypes ((List!33601 0))(
  ( (Nil!33598) (Cons!33597 (h!34926 (_ BitVec 64)) (t!48295 List!33601)) )
))
(declare-fun arrayNoDuplicates!0 (array!97574 (_ BitVec 32) List!33601) Bool)

(assert (=> b!1433990 (= res!967461 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33598))))

(declare-fun b!1433991 () Bool)

(declare-fun res!967449 () Bool)

(assert (=> b!1433991 (=> (not res!967449) (not e!809381))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433991 (= res!967449 (and (= (size!47641 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47641 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47641 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433992 () Bool)

(declare-fun e!809376 () Bool)

(assert (=> b!1433992 (= e!809376 (not e!809380))))

(declare-fun res!967454 () Bool)

(assert (=> b!1433992 (=> res!967454 e!809380)))

(assert (=> b!1433992 (= res!967454 (or (= (select (arr!47091 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47091 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47091 a!2831) index!585) (select (arr!47091 a!2831) j!81)) (= (select (store (arr!47091 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809378 () Bool)

(assert (=> b!1433992 e!809378))

(declare-fun res!967453 () Bool)

(assert (=> b!1433992 (=> (not res!967453) (not e!809378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97574 (_ BitVec 32)) Bool)

(assert (=> b!1433992 (= res!967453 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48486 0))(
  ( (Unit!48487) )
))
(declare-fun lt!631274 () Unit!48486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48486)

(assert (=> b!1433992 (= lt!631274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433993 () Bool)

(assert (=> b!1433993 (= e!809377 e!809376)))

(declare-fun res!967451 () Bool)

(assert (=> b!1433993 (=> (not res!967451) (not e!809376))))

(declare-fun lt!631275 () array!97574)

(declare-fun lt!631278 () (_ BitVec 64))

(declare-fun lt!631276 () SeekEntryResult!11370)

(assert (=> b!1433993 (= res!967451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631278 mask!2608) lt!631278 lt!631275 mask!2608) lt!631276))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1433993 (= lt!631276 (Intermediate!11370 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433993 (= lt!631278 (select (store (arr!47091 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433993 (= lt!631275 (array!97575 (store (arr!47091 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47641 a!2831)))))

(declare-fun b!1433994 () Bool)

(declare-fun res!967462 () Bool)

(assert (=> b!1433994 (=> (not res!967462) (not e!809376))))

(assert (=> b!1433994 (= res!967462 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47091 a!2831) j!81) a!2831 mask!2608) lt!631277))))

(declare-fun b!1433995 () Bool)

(declare-fun res!967450 () Bool)

(assert (=> b!1433995 (=> (not res!967450) (not e!809381))))

(assert (=> b!1433995 (= res!967450 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47641 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47641 a!2831))))))

(declare-fun b!1433996 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97574 (_ BitVec 32)) SeekEntryResult!11370)

(assert (=> b!1433996 (= e!809378 (= (seekEntryOrOpen!0 (select (arr!47091 a!2831) j!81) a!2831 mask!2608) (Found!11370 j!81)))))

(declare-fun b!1433997 () Bool)

(declare-fun res!967458 () Bool)

(assert (=> b!1433997 (=> (not res!967458) (not e!809381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433997 (= res!967458 (validKeyInArray!0 (select (arr!47091 a!2831) i!982)))))

(declare-fun b!1433998 () Bool)

(declare-fun res!967459 () Bool)

(assert (=> b!1433998 (=> (not res!967459) (not e!809376))))

(assert (=> b!1433998 (= res!967459 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631278 lt!631275 mask!2608) lt!631276))))

(declare-fun b!1433989 () Bool)

(declare-fun res!967457 () Bool)

(assert (=> b!1433989 (=> (not res!967457) (not e!809381))))

(assert (=> b!1433989 (= res!967457 (validKeyInArray!0 (select (arr!47091 a!2831) j!81)))))

(declare-fun res!967456 () Bool)

(assert (=> start!123716 (=> (not res!967456) (not e!809381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123716 (= res!967456 (validMask!0 mask!2608))))

(assert (=> start!123716 e!809381))

(assert (=> start!123716 true))

(declare-fun array_inv!36119 (array!97574) Bool)

(assert (=> start!123716 (array_inv!36119 a!2831)))

(declare-fun b!1433999 () Bool)

(declare-fun res!967455 () Bool)

(assert (=> b!1433999 (=> (not res!967455) (not e!809376))))

(assert (=> b!1433999 (= res!967455 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434000 () Bool)

(declare-fun res!967460 () Bool)

(assert (=> b!1434000 (=> (not res!967460) (not e!809381))))

(assert (=> b!1434000 (= res!967460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123716 res!967456) b!1433991))

(assert (= (and b!1433991 res!967449) b!1433997))

(assert (= (and b!1433997 res!967458) b!1433989))

(assert (= (and b!1433989 res!967457) b!1434000))

(assert (= (and b!1434000 res!967460) b!1433990))

(assert (= (and b!1433990 res!967461) b!1433995))

(assert (= (and b!1433995 res!967450) b!1433987))

(assert (= (and b!1433987 res!967452) b!1433993))

(assert (= (and b!1433993 res!967451) b!1433994))

(assert (= (and b!1433994 res!967462) b!1433998))

(assert (= (and b!1433998 res!967459) b!1433999))

(assert (= (and b!1433999 res!967455) b!1433992))

(assert (= (and b!1433992 res!967453) b!1433996))

(assert (= (and b!1433992 (not res!967454)) b!1433988))

(declare-fun m!1323593 () Bool)

(assert (=> b!1433990 m!1323593))

(declare-fun m!1323595 () Bool)

(assert (=> b!1433989 m!1323595))

(assert (=> b!1433989 m!1323595))

(declare-fun m!1323597 () Bool)

(assert (=> b!1433989 m!1323597))

(declare-fun m!1323599 () Bool)

(assert (=> b!1433998 m!1323599))

(declare-fun m!1323601 () Bool)

(assert (=> b!1434000 m!1323601))

(declare-fun m!1323603 () Bool)

(assert (=> b!1433993 m!1323603))

(assert (=> b!1433993 m!1323603))

(declare-fun m!1323605 () Bool)

(assert (=> b!1433993 m!1323605))

(declare-fun m!1323607 () Bool)

(assert (=> b!1433993 m!1323607))

(declare-fun m!1323609 () Bool)

(assert (=> b!1433993 m!1323609))

(assert (=> b!1433987 m!1323595))

(assert (=> b!1433987 m!1323595))

(declare-fun m!1323611 () Bool)

(assert (=> b!1433987 m!1323611))

(assert (=> b!1433987 m!1323611))

(assert (=> b!1433987 m!1323595))

(declare-fun m!1323613 () Bool)

(assert (=> b!1433987 m!1323613))

(declare-fun m!1323615 () Bool)

(assert (=> start!123716 m!1323615))

(declare-fun m!1323617 () Bool)

(assert (=> start!123716 m!1323617))

(assert (=> b!1433994 m!1323595))

(assert (=> b!1433994 m!1323595))

(declare-fun m!1323619 () Bool)

(assert (=> b!1433994 m!1323619))

(declare-fun m!1323621 () Bool)

(assert (=> b!1433997 m!1323621))

(assert (=> b!1433997 m!1323621))

(declare-fun m!1323623 () Bool)

(assert (=> b!1433997 m!1323623))

(assert (=> b!1433996 m!1323595))

(assert (=> b!1433996 m!1323595))

(declare-fun m!1323625 () Bool)

(assert (=> b!1433996 m!1323625))

(assert (=> b!1433992 m!1323607))

(declare-fun m!1323627 () Bool)

(assert (=> b!1433992 m!1323627))

(declare-fun m!1323629 () Bool)

(assert (=> b!1433992 m!1323629))

(declare-fun m!1323631 () Bool)

(assert (=> b!1433992 m!1323631))

(assert (=> b!1433992 m!1323595))

(declare-fun m!1323633 () Bool)

(assert (=> b!1433992 m!1323633))

(declare-fun m!1323635 () Bool)

(assert (=> b!1433988 m!1323635))

(check-sat (not b!1433994) (not b!1433996) (not b!1433997) (not b!1433989) (not b!1433988) (not b!1434000) (not b!1433992) (not b!1433993) (not b!1433990) (not start!123716) (not b!1433998) (not b!1433987))
(check-sat)
