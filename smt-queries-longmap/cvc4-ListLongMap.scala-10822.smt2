; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126650 () Bool)

(assert start!126650)

(declare-fun b!1486567 () Bool)

(declare-fun e!833338 () Bool)

(declare-fun e!833342 () Bool)

(assert (=> b!1486567 (= e!833338 e!833342)))

(declare-fun res!1010919 () Bool)

(assert (=> b!1486567 (=> (not res!1010919) (not e!833342))))

(declare-datatypes ((SeekEntryResult!12289 0))(
  ( (MissingZero!12289 (index!51548 (_ BitVec 32))) (Found!12289 (index!51549 (_ BitVec 32))) (Intermediate!12289 (undefined!13101 Bool) (index!51550 (_ BitVec 32)) (x!133129 (_ BitVec 32))) (Undefined!12289) (MissingVacant!12289 (index!51551 (_ BitVec 32))) )
))
(declare-fun lt!648513 () SeekEntryResult!12289)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1486567 (= res!1010919 (= lt!648513 (Intermediate!12289 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!648510 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99549 0))(
  ( (array!99550 (arr!48049 (Array (_ BitVec 32) (_ BitVec 64))) (size!48599 (_ BitVec 32))) )
))
(declare-fun lt!648511 () array!99549)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99549 (_ BitVec 32)) SeekEntryResult!12289)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486567 (= lt!648513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648510 mask!2687) lt!648510 lt!648511 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99549)

(assert (=> b!1486567 (= lt!648510 (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486568 () Bool)

(declare-fun res!1010909 () Bool)

(declare-fun e!833339 () Bool)

(assert (=> b!1486568 (=> (not res!1010909) (not e!833339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486568 (= res!1010909 (validKeyInArray!0 (select (arr!48049 a!2862) i!1006)))))

(declare-fun b!1486569 () Bool)

(declare-fun res!1010912 () Bool)

(declare-fun e!833335 () Bool)

(assert (=> b!1486569 (=> (not res!1010912) (not e!833335))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99549 (_ BitVec 32)) SeekEntryResult!12289)

(assert (=> b!1486569 (= res!1010912 (= (seekEntryOrOpen!0 (select (arr!48049 a!2862) j!93) a!2862 mask!2687) (Found!12289 j!93)))))

(declare-fun b!1486570 () Bool)

(declare-fun e!833334 () Bool)

(declare-fun e!833336 () Bool)

(assert (=> b!1486570 (= e!833334 e!833336)))

(declare-fun res!1010910 () Bool)

(assert (=> b!1486570 (=> (not res!1010910) (not e!833336))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!648512 () (_ BitVec 64))

(assert (=> b!1486570 (= res!1010910 (and (= index!646 intermediateAfterIndex!19) (= lt!648512 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486571 () Bool)

(declare-fun res!1010913 () Bool)

(assert (=> b!1486571 (=> (not res!1010913) (not e!833339))))

(declare-datatypes ((List!34550 0))(
  ( (Nil!34547) (Cons!34546 (h!35923 (_ BitVec 64)) (t!49244 List!34550)) )
))
(declare-fun arrayNoDuplicates!0 (array!99549 (_ BitVec 32) List!34550) Bool)

(assert (=> b!1486571 (= res!1010913 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34547))))

(declare-fun b!1486572 () Bool)

(declare-fun e!833337 () Bool)

(assert (=> b!1486572 (= e!833342 (not e!833337))))

(declare-fun res!1010911 () Bool)

(assert (=> b!1486572 (=> res!1010911 e!833337)))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1486572 (= res!1010911 (or (and (= (select (arr!48049 a!2862) index!646) (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48049 a!2862) index!646) (select (arr!48049 a!2862) j!93))) (= (select (arr!48049 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486572 e!833335))

(declare-fun res!1010916 () Bool)

(assert (=> b!1486572 (=> (not res!1010916) (not e!833335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99549 (_ BitVec 32)) Bool)

(assert (=> b!1486572 (= res!1010916 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49918 0))(
  ( (Unit!49919) )
))
(declare-fun lt!648516 () Unit!49918)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99549 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49918)

(assert (=> b!1486572 (= lt!648516 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486573 () Bool)

(declare-fun res!1010915 () Bool)

(assert (=> b!1486573 (=> (not res!1010915) (not e!833338))))

(declare-fun lt!648514 () SeekEntryResult!12289)

(assert (=> b!1486573 (= res!1010915 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48049 a!2862) j!93) a!2862 mask!2687) lt!648514))))

(declare-fun b!1486574 () Bool)

(declare-fun res!1010906 () Bool)

(assert (=> b!1486574 (=> (not res!1010906) (not e!833339))))

(assert (=> b!1486574 (= res!1010906 (and (= (size!48599 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48599 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48599 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486576 () Bool)

(declare-fun res!1010908 () Bool)

(assert (=> b!1486576 (=> (not res!1010908) (not e!833339))))

(assert (=> b!1486576 (= res!1010908 (validKeyInArray!0 (select (arr!48049 a!2862) j!93)))))

(declare-fun b!1486577 () Bool)

(assert (=> b!1486577 (= e!833335 e!833334)))

(declare-fun res!1010923 () Bool)

(assert (=> b!1486577 (=> res!1010923 e!833334)))

(assert (=> b!1486577 (= res!1010923 (or (and (= (select (arr!48049 a!2862) index!646) lt!648512) (= (select (arr!48049 a!2862) index!646) (select (arr!48049 a!2862) j!93))) (= (select (arr!48049 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486577 (= lt!648512 (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486578 () Bool)

(declare-fun res!1010921 () Bool)

(assert (=> b!1486578 (=> (not res!1010921) (not e!833339))))

(assert (=> b!1486578 (= res!1010921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486579 () Bool)

(declare-fun res!1010907 () Bool)

(assert (=> b!1486579 (=> (not res!1010907) (not e!833342))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486579 (= res!1010907 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486580 () Bool)

(declare-fun e!833333 () Bool)

(assert (=> b!1486580 (= e!833339 e!833333)))

(declare-fun res!1010905 () Bool)

(assert (=> b!1486580 (=> (not res!1010905) (not e!833333))))

(assert (=> b!1486580 (= res!1010905 (= (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486580 (= lt!648511 (array!99550 (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48599 a!2862)))))

(declare-fun b!1486581 () Bool)

(declare-fun e!833340 () Bool)

(assert (=> b!1486581 (= e!833340 (= lt!648513 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648510 lt!648511 mask!2687)))))

(declare-fun b!1486582 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99549 (_ BitVec 32)) SeekEntryResult!12289)

(assert (=> b!1486582 (= e!833336 (= (seekEntryOrOpen!0 lt!648510 lt!648511 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648510 lt!648511 mask!2687)))))

(declare-fun b!1486583 () Bool)

(declare-fun res!1010920 () Bool)

(assert (=> b!1486583 (=> (not res!1010920) (not e!833342))))

(assert (=> b!1486583 (= res!1010920 e!833340)))

(declare-fun c!137355 () Bool)

(assert (=> b!1486583 (= c!137355 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1010917 () Bool)

(assert (=> start!126650 (=> (not res!1010917) (not e!833339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126650 (= res!1010917 (validMask!0 mask!2687))))

(assert (=> start!126650 e!833339))

(assert (=> start!126650 true))

(declare-fun array_inv!37077 (array!99549) Bool)

(assert (=> start!126650 (array_inv!37077 a!2862)))

(declare-fun b!1486575 () Bool)

(declare-fun res!1010918 () Bool)

(assert (=> b!1486575 (=> (not res!1010918) (not e!833339))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1486575 (= res!1010918 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48599 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48599 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48599 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486584 () Bool)

(assert (=> b!1486584 (= e!833337 true)))

(declare-fun lt!648515 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486584 (= lt!648515 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486585 () Bool)

(assert (=> b!1486585 (= e!833333 e!833338)))

(declare-fun res!1010922 () Bool)

(assert (=> b!1486585 (=> (not res!1010922) (not e!833338))))

(assert (=> b!1486585 (= res!1010922 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48049 a!2862) j!93) mask!2687) (select (arr!48049 a!2862) j!93) a!2862 mask!2687) lt!648514))))

(assert (=> b!1486585 (= lt!648514 (Intermediate!12289 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486586 () Bool)

(assert (=> b!1486586 (= e!833340 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648510 lt!648511 mask!2687) (seekEntryOrOpen!0 lt!648510 lt!648511 mask!2687)))))

(declare-fun b!1486587 () Bool)

(declare-fun res!1010914 () Bool)

(assert (=> b!1486587 (=> (not res!1010914) (not e!833335))))

(assert (=> b!1486587 (= res!1010914 (or (= (select (arr!48049 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48049 a!2862) intermediateBeforeIndex!19) (select (arr!48049 a!2862) j!93))))))

(assert (= (and start!126650 res!1010917) b!1486574))

(assert (= (and b!1486574 res!1010906) b!1486568))

(assert (= (and b!1486568 res!1010909) b!1486576))

(assert (= (and b!1486576 res!1010908) b!1486578))

(assert (= (and b!1486578 res!1010921) b!1486571))

(assert (= (and b!1486571 res!1010913) b!1486575))

(assert (= (and b!1486575 res!1010918) b!1486580))

(assert (= (and b!1486580 res!1010905) b!1486585))

(assert (= (and b!1486585 res!1010922) b!1486573))

(assert (= (and b!1486573 res!1010915) b!1486567))

(assert (= (and b!1486567 res!1010919) b!1486583))

(assert (= (and b!1486583 c!137355) b!1486581))

(assert (= (and b!1486583 (not c!137355)) b!1486586))

(assert (= (and b!1486583 res!1010920) b!1486579))

(assert (= (and b!1486579 res!1010907) b!1486572))

(assert (= (and b!1486572 res!1010916) b!1486569))

(assert (= (and b!1486569 res!1010912) b!1486587))

(assert (= (and b!1486587 res!1010914) b!1486577))

(assert (= (and b!1486577 (not res!1010923)) b!1486570))

(assert (= (and b!1486570 res!1010910) b!1486582))

(assert (= (and b!1486572 (not res!1010911)) b!1486584))

(declare-fun m!1371423 () Bool)

(assert (=> b!1486585 m!1371423))

(assert (=> b!1486585 m!1371423))

(declare-fun m!1371425 () Bool)

(assert (=> b!1486585 m!1371425))

(assert (=> b!1486585 m!1371425))

(assert (=> b!1486585 m!1371423))

(declare-fun m!1371427 () Bool)

(assert (=> b!1486585 m!1371427))

(declare-fun m!1371429 () Bool)

(assert (=> b!1486584 m!1371429))

(declare-fun m!1371431 () Bool)

(assert (=> b!1486572 m!1371431))

(declare-fun m!1371433 () Bool)

(assert (=> b!1486572 m!1371433))

(declare-fun m!1371435 () Bool)

(assert (=> b!1486572 m!1371435))

(declare-fun m!1371437 () Bool)

(assert (=> b!1486572 m!1371437))

(declare-fun m!1371439 () Bool)

(assert (=> b!1486572 m!1371439))

(assert (=> b!1486572 m!1371423))

(declare-fun m!1371441 () Bool)

(assert (=> b!1486587 m!1371441))

(assert (=> b!1486587 m!1371423))

(assert (=> b!1486573 m!1371423))

(assert (=> b!1486573 m!1371423))

(declare-fun m!1371443 () Bool)

(assert (=> b!1486573 m!1371443))

(declare-fun m!1371445 () Bool)

(assert (=> b!1486581 m!1371445))

(assert (=> b!1486580 m!1371433))

(declare-fun m!1371447 () Bool)

(assert (=> b!1486580 m!1371447))

(declare-fun m!1371449 () Bool)

(assert (=> b!1486571 m!1371449))

(declare-fun m!1371451 () Bool)

(assert (=> start!126650 m!1371451))

(declare-fun m!1371453 () Bool)

(assert (=> start!126650 m!1371453))

(declare-fun m!1371455 () Bool)

(assert (=> b!1486567 m!1371455))

(assert (=> b!1486567 m!1371455))

(declare-fun m!1371457 () Bool)

(assert (=> b!1486567 m!1371457))

(assert (=> b!1486567 m!1371433))

(declare-fun m!1371459 () Bool)

(assert (=> b!1486567 m!1371459))

(assert (=> b!1486576 m!1371423))

(assert (=> b!1486576 m!1371423))

(declare-fun m!1371461 () Bool)

(assert (=> b!1486576 m!1371461))

(declare-fun m!1371463 () Bool)

(assert (=> b!1486582 m!1371463))

(declare-fun m!1371465 () Bool)

(assert (=> b!1486582 m!1371465))

(assert (=> b!1486586 m!1371465))

(assert (=> b!1486586 m!1371463))

(declare-fun m!1371467 () Bool)

(assert (=> b!1486578 m!1371467))

(declare-fun m!1371469 () Bool)

(assert (=> b!1486568 m!1371469))

(assert (=> b!1486568 m!1371469))

(declare-fun m!1371471 () Bool)

(assert (=> b!1486568 m!1371471))

(assert (=> b!1486569 m!1371423))

(assert (=> b!1486569 m!1371423))

(declare-fun m!1371473 () Bool)

(assert (=> b!1486569 m!1371473))

(assert (=> b!1486577 m!1371437))

(assert (=> b!1486577 m!1371423))

(assert (=> b!1486577 m!1371433))

(assert (=> b!1486577 m!1371435))

(push 1)

