; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122932 () Bool)

(assert start!122932)

(declare-fun b!1425977 () Bool)

(declare-fun e!805539 () Bool)

(declare-fun e!805541 () Bool)

(assert (=> b!1425977 (= e!805539 e!805541)))

(declare-fun res!961415 () Bool)

(assert (=> b!1425977 (=> (not res!961415) (not e!805541))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97297 0))(
  ( (array!97298 (arr!46966 (Array (_ BitVec 32) (_ BitVec 64))) (size!47516 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97297)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11245 0))(
  ( (MissingZero!11245 (index!47372 (_ BitVec 32))) (Found!11245 (index!47373 (_ BitVec 32))) (Intermediate!11245 (undefined!12057 Bool) (index!47374 (_ BitVec 32)) (x!128999 (_ BitVec 32))) (Undefined!11245) (MissingVacant!11245 (index!47375 (_ BitVec 32))) )
))
(declare-fun lt!627975 () SeekEntryResult!11245)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97297 (_ BitVec 32)) SeekEntryResult!11245)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425977 (= res!961415 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46966 a!2831) j!81) mask!2608) (select (arr!46966 a!2831) j!81) a!2831 mask!2608) lt!627975))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425977 (= lt!627975 (Intermediate!11245 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425978 () Bool)

(declare-fun res!961410 () Bool)

(declare-fun e!805540 () Bool)

(assert (=> b!1425978 (=> (not res!961410) (not e!805540))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425978 (= res!961410 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46966 a!2831) j!81) a!2831 mask!2608) lt!627975))))

(declare-fun b!1425979 () Bool)

(assert (=> b!1425979 (= e!805541 e!805540)))

(declare-fun res!961418 () Bool)

(assert (=> b!1425979 (=> (not res!961418) (not e!805540))))

(declare-fun lt!627976 () (_ BitVec 64))

(declare-fun lt!627978 () array!97297)

(declare-fun lt!627977 () SeekEntryResult!11245)

(assert (=> b!1425979 (= res!961418 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627976 mask!2608) lt!627976 lt!627978 mask!2608) lt!627977))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425979 (= lt!627977 (Intermediate!11245 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425979 (= lt!627976 (select (store (arr!46966 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425979 (= lt!627978 (array!97298 (store (arr!46966 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47516 a!2831)))))

(declare-fun b!1425980 () Bool)

(declare-fun res!961416 () Bool)

(assert (=> b!1425980 (=> (not res!961416) (not e!805540))))

(assert (=> b!1425980 (= res!961416 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627976 lt!627978 mask!2608) lt!627977))))

(declare-fun b!1425981 () Bool)

(declare-fun res!961411 () Bool)

(assert (=> b!1425981 (=> (not res!961411) (not e!805539))))

(assert (=> b!1425981 (= res!961411 (and (= (size!47516 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47516 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47516 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425982 () Bool)

(declare-fun res!961412 () Bool)

(assert (=> b!1425982 (=> (not res!961412) (not e!805539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97297 (_ BitVec 32)) Bool)

(assert (=> b!1425982 (= res!961412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!961413 () Bool)

(assert (=> start!122932 (=> (not res!961413) (not e!805539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122932 (= res!961413 (validMask!0 mask!2608))))

(assert (=> start!122932 e!805539))

(assert (=> start!122932 true))

(declare-fun array_inv!35994 (array!97297) Bool)

(assert (=> start!122932 (array_inv!35994 a!2831)))

(declare-fun b!1425983 () Bool)

(declare-fun res!961417 () Bool)

(assert (=> b!1425983 (=> (not res!961417) (not e!805539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425983 (= res!961417 (validKeyInArray!0 (select (arr!46966 a!2831) i!982)))))

(declare-fun b!1425984 () Bool)

(declare-fun res!961420 () Bool)

(assert (=> b!1425984 (=> (not res!961420) (not e!805539))))

(declare-datatypes ((List!33476 0))(
  ( (Nil!33473) (Cons!33472 (h!34774 (_ BitVec 64)) (t!48170 List!33476)) )
))
(declare-fun arrayNoDuplicates!0 (array!97297 (_ BitVec 32) List!33476) Bool)

(assert (=> b!1425984 (= res!961420 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33473))))

(declare-fun b!1425985 () Bool)

(declare-fun res!961419 () Bool)

(assert (=> b!1425985 (=> (not res!961419) (not e!805539))))

(assert (=> b!1425985 (= res!961419 (validKeyInArray!0 (select (arr!46966 a!2831) j!81)))))

(declare-fun b!1425986 () Bool)

(assert (=> b!1425986 (= e!805540 (and (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))) (bvsgt #b00000000000000000000000000000000 (size!47516 a!2831))))))

(declare-fun b!1425987 () Bool)

(declare-fun res!961414 () Bool)

(assert (=> b!1425987 (=> (not res!961414) (not e!805539))))

(assert (=> b!1425987 (= res!961414 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47516 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47516 a!2831))))))

(assert (= (and start!122932 res!961413) b!1425981))

(assert (= (and b!1425981 res!961411) b!1425983))

(assert (= (and b!1425983 res!961417) b!1425985))

(assert (= (and b!1425985 res!961419) b!1425982))

(assert (= (and b!1425982 res!961412) b!1425984))

(assert (= (and b!1425984 res!961420) b!1425987))

(assert (= (and b!1425987 res!961414) b!1425977))

(assert (= (and b!1425977 res!961415) b!1425979))

(assert (= (and b!1425979 res!961418) b!1425978))

(assert (= (and b!1425978 res!961410) b!1425980))

(assert (= (and b!1425980 res!961416) b!1425986))

(declare-fun m!1316587 () Bool)

(assert (=> b!1425978 m!1316587))

(assert (=> b!1425978 m!1316587))

(declare-fun m!1316589 () Bool)

(assert (=> b!1425978 m!1316589))

(declare-fun m!1316591 () Bool)

(assert (=> b!1425982 m!1316591))

(declare-fun m!1316593 () Bool)

(assert (=> b!1425979 m!1316593))

(assert (=> b!1425979 m!1316593))

(declare-fun m!1316595 () Bool)

(assert (=> b!1425979 m!1316595))

(declare-fun m!1316597 () Bool)

(assert (=> b!1425979 m!1316597))

(declare-fun m!1316599 () Bool)

(assert (=> b!1425979 m!1316599))

(assert (=> b!1425985 m!1316587))

(assert (=> b!1425985 m!1316587))

(declare-fun m!1316601 () Bool)

(assert (=> b!1425985 m!1316601))

(declare-fun m!1316603 () Bool)

(assert (=> b!1425984 m!1316603))

(declare-fun m!1316605 () Bool)

(assert (=> start!122932 m!1316605))

(declare-fun m!1316607 () Bool)

(assert (=> start!122932 m!1316607))

(assert (=> b!1425977 m!1316587))

(assert (=> b!1425977 m!1316587))

(declare-fun m!1316609 () Bool)

(assert (=> b!1425977 m!1316609))

(assert (=> b!1425977 m!1316609))

(assert (=> b!1425977 m!1316587))

(declare-fun m!1316611 () Bool)

(assert (=> b!1425977 m!1316611))

(declare-fun m!1316613 () Bool)

(assert (=> b!1425980 m!1316613))

(declare-fun m!1316615 () Bool)

(assert (=> b!1425983 m!1316615))

(assert (=> b!1425983 m!1316615))

(declare-fun m!1316617 () Bool)

(assert (=> b!1425983 m!1316617))

(push 1)

(assert (not b!1425979))

(assert (not b!1425980))

(assert (not b!1425978))

(assert (not b!1425983))

(assert (not start!122932))

(assert (not b!1425984))

(assert (not b!1425977))

(assert (not b!1425985))

(assert (not b!1425982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

