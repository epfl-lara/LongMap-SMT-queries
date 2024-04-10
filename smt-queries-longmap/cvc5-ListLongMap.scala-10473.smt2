; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123162 () Bool)

(assert start!123162)

(declare-fun e!806582 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97374 0))(
  ( (array!97375 (arr!47000 (Array (_ BitVec 32) (_ BitVec 64))) (size!47550 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97374)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun b!1428165 () Bool)

(declare-datatypes ((SeekEntryResult!11279 0))(
  ( (MissingZero!11279 (index!47508 (_ BitVec 32))) (Found!11279 (index!47509 (_ BitVec 32))) (Intermediate!11279 (undefined!12091 Bool) (index!47510 (_ BitVec 32)) (x!129147 (_ BitVec 32))) (Undefined!11279) (MissingVacant!11279 (index!47511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97374 (_ BitVec 32)) SeekEntryResult!11279)

(assert (=> b!1428165 (= e!806582 (= (seekEntryOrOpen!0 (select (arr!47000 a!2831) j!81) a!2831 mask!2608) (Found!11279 j!81)))))

(declare-fun res!962998 () Bool)

(declare-fun e!806581 () Bool)

(assert (=> start!123162 (=> (not res!962998) (not e!806581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123162 (= res!962998 (validMask!0 mask!2608))))

(assert (=> start!123162 e!806581))

(assert (=> start!123162 true))

(declare-fun array_inv!36028 (array!97374) Bool)

(assert (=> start!123162 (array_inv!36028 a!2831)))

(declare-fun b!1428166 () Bool)

(declare-fun e!806580 () Bool)

(assert (=> b!1428166 (= e!806581 e!806580)))

(declare-fun res!962995 () Bool)

(assert (=> b!1428166 (=> (not res!962995) (not e!806580))))

(declare-fun lt!628863 () SeekEntryResult!11279)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97374 (_ BitVec 32)) SeekEntryResult!11279)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428166 (= res!962995 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47000 a!2831) j!81) mask!2608) (select (arr!47000 a!2831) j!81) a!2831 mask!2608) lt!628863))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428166 (= lt!628863 (Intermediate!11279 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428167 () Bool)

(declare-fun res!963000 () Bool)

(assert (=> b!1428167 (=> (not res!963000) (not e!806581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428167 (= res!963000 (validKeyInArray!0 (select (arr!47000 a!2831) j!81)))))

(declare-fun b!1428168 () Bool)

(declare-fun res!963007 () Bool)

(declare-fun e!806579 () Bool)

(assert (=> b!1428168 (=> (not res!963007) (not e!806579))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428168 (= res!963007 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428169 () Bool)

(assert (=> b!1428169 (= e!806580 e!806579)))

(declare-fun res!963004 () Bool)

(assert (=> b!1428169 (=> (not res!963004) (not e!806579))))

(declare-fun lt!628864 () SeekEntryResult!11279)

(declare-fun lt!628865 () array!97374)

(declare-fun lt!628862 () (_ BitVec 64))

(assert (=> b!1428169 (= res!963004 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628862 mask!2608) lt!628862 lt!628865 mask!2608) lt!628864))))

(assert (=> b!1428169 (= lt!628864 (Intermediate!11279 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428169 (= lt!628862 (select (store (arr!47000 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428169 (= lt!628865 (array!97375 (store (arr!47000 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47550 a!2831)))))

(declare-fun b!1428170 () Bool)

(declare-fun res!962996 () Bool)

(assert (=> b!1428170 (=> (not res!962996) (not e!806581))))

(assert (=> b!1428170 (= res!962996 (validKeyInArray!0 (select (arr!47000 a!2831) i!982)))))

(declare-fun b!1428171 () Bool)

(assert (=> b!1428171 (= e!806579 (not true))))

(assert (=> b!1428171 e!806582))

(declare-fun res!962999 () Bool)

(assert (=> b!1428171 (=> (not res!962999) (not e!806582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97374 (_ BitVec 32)) Bool)

(assert (=> b!1428171 (= res!962999 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48304 0))(
  ( (Unit!48305) )
))
(declare-fun lt!628866 () Unit!48304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48304)

(assert (=> b!1428171 (= lt!628866 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428172 () Bool)

(declare-fun res!963001 () Bool)

(assert (=> b!1428172 (=> (not res!963001) (not e!806581))))

(assert (=> b!1428172 (= res!963001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428173 () Bool)

(declare-fun res!963006 () Bool)

(assert (=> b!1428173 (=> (not res!963006) (not e!806581))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428173 (= res!963006 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47550 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47550 a!2831))))))

(declare-fun b!1428174 () Bool)

(declare-fun res!962997 () Bool)

(assert (=> b!1428174 (=> (not res!962997) (not e!806581))))

(assert (=> b!1428174 (= res!962997 (and (= (size!47550 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47550 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47550 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428175 () Bool)

(declare-fun res!963003 () Bool)

(assert (=> b!1428175 (=> (not res!963003) (not e!806581))))

(declare-datatypes ((List!33510 0))(
  ( (Nil!33507) (Cons!33506 (h!34817 (_ BitVec 64)) (t!48204 List!33510)) )
))
(declare-fun arrayNoDuplicates!0 (array!97374 (_ BitVec 32) List!33510) Bool)

(assert (=> b!1428175 (= res!963003 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33507))))

(declare-fun b!1428176 () Bool)

(declare-fun res!963005 () Bool)

(assert (=> b!1428176 (=> (not res!963005) (not e!806579))))

(assert (=> b!1428176 (= res!963005 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47000 a!2831) j!81) a!2831 mask!2608) lt!628863))))

(declare-fun b!1428177 () Bool)

(declare-fun res!963002 () Bool)

(assert (=> b!1428177 (=> (not res!963002) (not e!806579))))

(assert (=> b!1428177 (= res!963002 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628862 lt!628865 mask!2608) lt!628864))))

(assert (= (and start!123162 res!962998) b!1428174))

(assert (= (and b!1428174 res!962997) b!1428170))

(assert (= (and b!1428170 res!962996) b!1428167))

(assert (= (and b!1428167 res!963000) b!1428172))

(assert (= (and b!1428172 res!963001) b!1428175))

(assert (= (and b!1428175 res!963003) b!1428173))

(assert (= (and b!1428173 res!963006) b!1428166))

(assert (= (and b!1428166 res!962995) b!1428169))

(assert (= (and b!1428169 res!963004) b!1428176))

(assert (= (and b!1428176 res!963005) b!1428177))

(assert (= (and b!1428177 res!963002) b!1428168))

(assert (= (and b!1428168 res!963007) b!1428171))

(assert (= (and b!1428171 res!962999) b!1428165))

(declare-fun m!1318407 () Bool)

(assert (=> b!1428175 m!1318407))

(declare-fun m!1318409 () Bool)

(assert (=> b!1428169 m!1318409))

(assert (=> b!1428169 m!1318409))

(declare-fun m!1318411 () Bool)

(assert (=> b!1428169 m!1318411))

(declare-fun m!1318413 () Bool)

(assert (=> b!1428169 m!1318413))

(declare-fun m!1318415 () Bool)

(assert (=> b!1428169 m!1318415))

(declare-fun m!1318417 () Bool)

(assert (=> b!1428167 m!1318417))

(assert (=> b!1428167 m!1318417))

(declare-fun m!1318419 () Bool)

(assert (=> b!1428167 m!1318419))

(declare-fun m!1318421 () Bool)

(assert (=> b!1428177 m!1318421))

(declare-fun m!1318423 () Bool)

(assert (=> start!123162 m!1318423))

(declare-fun m!1318425 () Bool)

(assert (=> start!123162 m!1318425))

(assert (=> b!1428165 m!1318417))

(assert (=> b!1428165 m!1318417))

(declare-fun m!1318427 () Bool)

(assert (=> b!1428165 m!1318427))

(assert (=> b!1428166 m!1318417))

(assert (=> b!1428166 m!1318417))

(declare-fun m!1318429 () Bool)

(assert (=> b!1428166 m!1318429))

(assert (=> b!1428166 m!1318429))

(assert (=> b!1428166 m!1318417))

(declare-fun m!1318431 () Bool)

(assert (=> b!1428166 m!1318431))

(declare-fun m!1318433 () Bool)

(assert (=> b!1428172 m!1318433))

(declare-fun m!1318435 () Bool)

(assert (=> b!1428170 m!1318435))

(assert (=> b!1428170 m!1318435))

(declare-fun m!1318437 () Bool)

(assert (=> b!1428170 m!1318437))

(declare-fun m!1318439 () Bool)

(assert (=> b!1428171 m!1318439))

(declare-fun m!1318441 () Bool)

(assert (=> b!1428171 m!1318441))

(assert (=> b!1428176 m!1318417))

(assert (=> b!1428176 m!1318417))

(declare-fun m!1318443 () Bool)

(assert (=> b!1428176 m!1318443))

(push 1)

