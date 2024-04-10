; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122694 () Bool)

(assert start!122694)

(declare-fun b!1421431 () Bool)

(declare-fun res!956869 () Bool)

(declare-fun e!803732 () Bool)

(assert (=> b!1421431 (=> (not res!956869) (not e!803732))))

(declare-datatypes ((array!97059 0))(
  ( (array!97060 (arr!46847 (Array (_ BitVec 32) (_ BitVec 64))) (size!47397 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97059)

(declare-datatypes ((List!33357 0))(
  ( (Nil!33354) (Cons!33353 (h!34655 (_ BitVec 64)) (t!48051 List!33357)) )
))
(declare-fun arrayNoDuplicates!0 (array!97059 (_ BitVec 32) List!33357) Bool)

(assert (=> b!1421431 (= res!956869 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33354))))

(declare-fun res!956868 () Bool)

(assert (=> start!122694 (=> (not res!956868) (not e!803732))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122694 (= res!956868 (validMask!0 mask!2608))))

(assert (=> start!122694 e!803732))

(assert (=> start!122694 true))

(declare-fun array_inv!35875 (array!97059) Bool)

(assert (=> start!122694 (array_inv!35875 a!2831)))

(declare-fun b!1421432 () Bool)

(declare-fun res!956865 () Bool)

(assert (=> b!1421432 (=> (not res!956865) (not e!803732))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421432 (= res!956865 (and (= (size!47397 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47397 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47397 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421433 () Bool)

(declare-fun res!956870 () Bool)

(declare-fun e!803733 () Bool)

(assert (=> b!1421433 (=> (not res!956870) (not e!803733))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421433 (= res!956870 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421434 () Bool)

(declare-fun res!956867 () Bool)

(assert (=> b!1421434 (=> (not res!956867) (not e!803732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421434 (= res!956867 (validKeyInArray!0 (select (arr!46847 a!2831) j!81)))))

(declare-fun b!1421435 () Bool)

(declare-fun res!956873 () Bool)

(assert (=> b!1421435 (=> (not res!956873) (not e!803732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97059 (_ BitVec 32)) Bool)

(assert (=> b!1421435 (= res!956873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421436 () Bool)

(declare-fun e!803734 () Bool)

(assert (=> b!1421436 (= e!803734 e!803733)))

(declare-fun res!956875 () Bool)

(assert (=> b!1421436 (=> (not res!956875) (not e!803733))))

(declare-datatypes ((SeekEntryResult!11132 0))(
  ( (MissingZero!11132 (index!46920 (_ BitVec 32))) (Found!11132 (index!46921 (_ BitVec 32))) (Intermediate!11132 (undefined!11944 Bool) (index!46922 (_ BitVec 32)) (x!128574 (_ BitVec 32))) (Undefined!11132) (MissingVacant!11132 (index!46923 (_ BitVec 32))) )
))
(declare-fun lt!626263 () SeekEntryResult!11132)

(declare-fun lt!626261 () array!97059)

(declare-fun lt!626265 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97059 (_ BitVec 32)) SeekEntryResult!11132)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421436 (= res!956875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626265 mask!2608) lt!626265 lt!626261 mask!2608) lt!626263))))

(assert (=> b!1421436 (= lt!626263 (Intermediate!11132 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421436 (= lt!626265 (select (store (arr!46847 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421436 (= lt!626261 (array!97060 (store (arr!46847 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47397 a!2831)))))

(declare-fun b!1421437 () Bool)

(assert (=> b!1421437 (= e!803732 e!803734)))

(declare-fun res!956864 () Bool)

(assert (=> b!1421437 (=> (not res!956864) (not e!803734))))

(declare-fun lt!626264 () SeekEntryResult!11132)

(assert (=> b!1421437 (= res!956864 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46847 a!2831) j!81) mask!2608) (select (arr!46847 a!2831) j!81) a!2831 mask!2608) lt!626264))))

(assert (=> b!1421437 (= lt!626264 (Intermediate!11132 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421438 () Bool)

(declare-fun res!956874 () Bool)

(assert (=> b!1421438 (=> (not res!956874) (not e!803733))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1421438 (= res!956874 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626265 lt!626261 mask!2608) lt!626263))))

(declare-fun b!1421439 () Bool)

(declare-fun res!956866 () Bool)

(assert (=> b!1421439 (=> (not res!956866) (not e!803732))))

(assert (=> b!1421439 (= res!956866 (validKeyInArray!0 (select (arr!46847 a!2831) i!982)))))

(declare-fun b!1421440 () Bool)

(declare-fun res!956872 () Bool)

(assert (=> b!1421440 (=> (not res!956872) (not e!803732))))

(assert (=> b!1421440 (= res!956872 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47397 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47397 a!2831))))))

(declare-fun b!1421441 () Bool)

(declare-fun res!956871 () Bool)

(assert (=> b!1421441 (=> (not res!956871) (not e!803733))))

(assert (=> b!1421441 (= res!956871 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46847 a!2831) j!81) a!2831 mask!2608) lt!626264))))

(declare-fun b!1421442 () Bool)

(assert (=> b!1421442 (= e!803733 (not true))))

(assert (=> b!1421442 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48100 0))(
  ( (Unit!48101) )
))
(declare-fun lt!626262 () Unit!48100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48100)

(assert (=> b!1421442 (= lt!626262 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!122694 res!956868) b!1421432))

(assert (= (and b!1421432 res!956865) b!1421439))

(assert (= (and b!1421439 res!956866) b!1421434))

(assert (= (and b!1421434 res!956867) b!1421435))

(assert (= (and b!1421435 res!956873) b!1421431))

(assert (= (and b!1421431 res!956869) b!1421440))

(assert (= (and b!1421440 res!956872) b!1421437))

(assert (= (and b!1421437 res!956864) b!1421436))

(assert (= (and b!1421436 res!956875) b!1421441))

(assert (= (and b!1421441 res!956871) b!1421438))

(assert (= (and b!1421438 res!956874) b!1421433))

(assert (= (and b!1421433 res!956870) b!1421442))

(declare-fun m!1311975 () Bool)

(assert (=> b!1421434 m!1311975))

(assert (=> b!1421434 m!1311975))

(declare-fun m!1311977 () Bool)

(assert (=> b!1421434 m!1311977))

(declare-fun m!1311979 () Bool)

(assert (=> b!1421438 m!1311979))

(declare-fun m!1311981 () Bool)

(assert (=> b!1421439 m!1311981))

(assert (=> b!1421439 m!1311981))

(declare-fun m!1311983 () Bool)

(assert (=> b!1421439 m!1311983))

(declare-fun m!1311985 () Bool)

(assert (=> b!1421431 m!1311985))

(declare-fun m!1311987 () Bool)

(assert (=> b!1421436 m!1311987))

(assert (=> b!1421436 m!1311987))

(declare-fun m!1311989 () Bool)

(assert (=> b!1421436 m!1311989))

(declare-fun m!1311991 () Bool)

(assert (=> b!1421436 m!1311991))

(declare-fun m!1311993 () Bool)

(assert (=> b!1421436 m!1311993))

(assert (=> b!1421437 m!1311975))

(assert (=> b!1421437 m!1311975))

(declare-fun m!1311995 () Bool)

(assert (=> b!1421437 m!1311995))

(assert (=> b!1421437 m!1311995))

(assert (=> b!1421437 m!1311975))

(declare-fun m!1311997 () Bool)

(assert (=> b!1421437 m!1311997))

(declare-fun m!1311999 () Bool)

(assert (=> b!1421435 m!1311999))

(declare-fun m!1312001 () Bool)

(assert (=> b!1421442 m!1312001))

(declare-fun m!1312003 () Bool)

(assert (=> b!1421442 m!1312003))

(declare-fun m!1312005 () Bool)

(assert (=> start!122694 m!1312005))

(declare-fun m!1312007 () Bool)

(assert (=> start!122694 m!1312007))

(assert (=> b!1421441 m!1311975))

(assert (=> b!1421441 m!1311975))

(declare-fun m!1312009 () Bool)

(assert (=> b!1421441 m!1312009))

(push 1)

