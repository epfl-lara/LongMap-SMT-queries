; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122602 () Bool)

(assert start!122602)

(declare-fun b!1419999 () Bool)

(declare-fun res!955483 () Bool)

(declare-fun e!803254 () Bool)

(assert (=> b!1419999 (=> (not res!955483) (not e!803254))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96920 0))(
  ( (array!96921 (arr!46778 (Array (_ BitVec 32) (_ BitVec 64))) (size!47330 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96920)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419999 (= res!955483 (and (= (size!47330 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47330 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47330 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420000 () Bool)

(declare-fun res!955485 () Bool)

(assert (=> b!1420000 (=> (not res!955485) (not e!803254))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11090 0))(
  ( (MissingZero!11090 (index!46752 (_ BitVec 32))) (Found!11090 (index!46753 (_ BitVec 32))) (Intermediate!11090 (undefined!11902 Bool) (index!46754 (_ BitVec 32)) (x!128409 (_ BitVec 32))) (Undefined!11090) (MissingVacant!11090 (index!46755 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96920 (_ BitVec 32)) SeekEntryResult!11090)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420000 (= res!955485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46778 a!2831) j!81) mask!2608) (select (arr!46778 a!2831) j!81) a!2831 mask!2608) (Intermediate!11090 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420001 () Bool)

(assert (=> b!1420001 (= e!803254 false)))

(declare-fun lt!625688 () SeekEntryResult!11090)

(assert (=> b!1420001 (= lt!625688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46778 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46778 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96921 (store (arr!46778 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47330 a!2831)) mask!2608))))

(declare-fun b!1420002 () Bool)

(declare-fun res!955489 () Bool)

(assert (=> b!1420002 (=> (not res!955489) (not e!803254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420002 (= res!955489 (validKeyInArray!0 (select (arr!46778 a!2831) i!982)))))

(declare-fun b!1420003 () Bool)

(declare-fun res!955488 () Bool)

(assert (=> b!1420003 (=> (not res!955488) (not e!803254))))

(declare-datatypes ((List!33366 0))(
  ( (Nil!33363) (Cons!33362 (h!34664 (_ BitVec 64)) (t!48052 List!33366)) )
))
(declare-fun arrayNoDuplicates!0 (array!96920 (_ BitVec 32) List!33366) Bool)

(assert (=> b!1420003 (= res!955488 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33363))))

(declare-fun b!1420004 () Bool)

(declare-fun res!955486 () Bool)

(assert (=> b!1420004 (=> (not res!955486) (not e!803254))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420004 (= res!955486 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47330 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47330 a!2831))))))

(declare-fun b!1420005 () Bool)

(declare-fun res!955484 () Bool)

(assert (=> b!1420005 (=> (not res!955484) (not e!803254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96920 (_ BitVec 32)) Bool)

(assert (=> b!1420005 (= res!955484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!955482 () Bool)

(assert (=> start!122602 (=> (not res!955482) (not e!803254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122602 (= res!955482 (validMask!0 mask!2608))))

(assert (=> start!122602 e!803254))

(assert (=> start!122602 true))

(declare-fun array_inv!36011 (array!96920) Bool)

(assert (=> start!122602 (array_inv!36011 a!2831)))

(declare-fun b!1419998 () Bool)

(declare-fun res!955487 () Bool)

(assert (=> b!1419998 (=> (not res!955487) (not e!803254))))

(assert (=> b!1419998 (= res!955487 (validKeyInArray!0 (select (arr!46778 a!2831) j!81)))))

(assert (= (and start!122602 res!955482) b!1419999))

(assert (= (and b!1419999 res!955483) b!1420002))

(assert (= (and b!1420002 res!955489) b!1419998))

(assert (= (and b!1419998 res!955487) b!1420005))

(assert (= (and b!1420005 res!955484) b!1420003))

(assert (= (and b!1420003 res!955488) b!1420004))

(assert (= (and b!1420004 res!955486) b!1420000))

(assert (= (and b!1420000 res!955485) b!1420001))

(declare-fun m!1310017 () Bool)

(assert (=> b!1420000 m!1310017))

(assert (=> b!1420000 m!1310017))

(declare-fun m!1310019 () Bool)

(assert (=> b!1420000 m!1310019))

(assert (=> b!1420000 m!1310019))

(assert (=> b!1420000 m!1310017))

(declare-fun m!1310021 () Bool)

(assert (=> b!1420000 m!1310021))

(declare-fun m!1310023 () Bool)

(assert (=> start!122602 m!1310023))

(declare-fun m!1310025 () Bool)

(assert (=> start!122602 m!1310025))

(declare-fun m!1310027 () Bool)

(assert (=> b!1420003 m!1310027))

(assert (=> b!1419998 m!1310017))

(assert (=> b!1419998 m!1310017))

(declare-fun m!1310029 () Bool)

(assert (=> b!1419998 m!1310029))

(declare-fun m!1310031 () Bool)

(assert (=> b!1420001 m!1310031))

(declare-fun m!1310033 () Bool)

(assert (=> b!1420001 m!1310033))

(assert (=> b!1420001 m!1310033))

(declare-fun m!1310035 () Bool)

(assert (=> b!1420001 m!1310035))

(assert (=> b!1420001 m!1310035))

(assert (=> b!1420001 m!1310033))

(declare-fun m!1310037 () Bool)

(assert (=> b!1420001 m!1310037))

(declare-fun m!1310039 () Bool)

(assert (=> b!1420002 m!1310039))

(assert (=> b!1420002 m!1310039))

(declare-fun m!1310041 () Bool)

(assert (=> b!1420002 m!1310041))

(declare-fun m!1310043 () Bool)

(assert (=> b!1420005 m!1310043))

(push 1)

(assert (not b!1420003))

(assert (not b!1420000))

(assert (not b!1420001))

(assert (not b!1420002))

(assert (not b!1420005))

(assert (not b!1419998))

(assert (not start!122602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

