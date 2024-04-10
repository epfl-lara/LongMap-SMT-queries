; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124920 () Bool)

(assert start!124920)

(declare-fun b!1451483 () Bool)

(declare-fun res!982712 () Bool)

(declare-fun e!817241 () Bool)

(assert (=> b!1451483 (=> (not res!982712) (not e!817241))))

(declare-datatypes ((array!98368 0))(
  ( (array!98369 (arr!47472 (Array (_ BitVec 32) (_ BitVec 64))) (size!48022 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98368)

(declare-datatypes ((List!33973 0))(
  ( (Nil!33970) (Cons!33969 (h!35319 (_ BitVec 64)) (t!48667 List!33973)) )
))
(declare-fun arrayNoDuplicates!0 (array!98368 (_ BitVec 32) List!33973) Bool)

(assert (=> b!1451483 (= res!982712 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33970))))

(declare-fun b!1451484 () Bool)

(declare-fun res!982715 () Bool)

(declare-fun e!817239 () Bool)

(assert (=> b!1451484 (=> (not res!982715) (not e!817239))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11724 0))(
  ( (MissingZero!11724 (index!49288 (_ BitVec 32))) (Found!11724 (index!49289 (_ BitVec 32))) (Intermediate!11724 (undefined!12536 Bool) (index!49290 (_ BitVec 32)) (x!130941 (_ BitVec 32))) (Undefined!11724) (MissingVacant!11724 (index!49291 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98368 (_ BitVec 32)) SeekEntryResult!11724)

(assert (=> b!1451484 (= res!982715 (= (seekEntryOrOpen!0 (select (arr!47472 a!2862) j!93) a!2862 mask!2687) (Found!11724 j!93)))))

(declare-fun b!1451485 () Bool)

(declare-fun res!982720 () Bool)

(declare-fun e!817238 () Bool)

(assert (=> b!1451485 (=> (not res!982720) (not e!817238))))

(declare-fun e!817240 () Bool)

(assert (=> b!1451485 (= res!982720 e!817240)))

(declare-fun c!133896 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451485 (= c!133896 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451486 () Bool)

(declare-fun res!982713 () Bool)

(assert (=> b!1451486 (=> (not res!982713) (not e!817241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98368 (_ BitVec 32)) Bool)

(assert (=> b!1451486 (= res!982713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!982723 () Bool)

(assert (=> start!124920 (=> (not res!982723) (not e!817241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124920 (= res!982723 (validMask!0 mask!2687))))

(assert (=> start!124920 e!817241))

(assert (=> start!124920 true))

(declare-fun array_inv!36500 (array!98368) Bool)

(assert (=> start!124920 (array_inv!36500 a!2862)))

(declare-fun b!1451487 () Bool)

(declare-fun res!982722 () Bool)

(assert (=> b!1451487 (=> (not res!982722) (not e!817241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451487 (= res!982722 (validKeyInArray!0 (select (arr!47472 a!2862) j!93)))))

(declare-fun lt!636665 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1451488 () Bool)

(declare-fun lt!636666 () array!98368)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98368 (_ BitVec 32)) SeekEntryResult!11724)

(assert (=> b!1451488 (= e!817240 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636665 lt!636666 mask!2687) (seekEntryOrOpen!0 lt!636665 lt!636666 mask!2687)))))

(declare-fun b!1451489 () Bool)

(declare-fun res!982718 () Bool)

(assert (=> b!1451489 (=> (not res!982718) (not e!817238))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451489 (= res!982718 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451490 () Bool)

(declare-fun res!982726 () Bool)

(declare-fun e!817237 () Bool)

(assert (=> b!1451490 (=> (not res!982726) (not e!817237))))

(declare-fun lt!636668 () SeekEntryResult!11724)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98368 (_ BitVec 32)) SeekEntryResult!11724)

(assert (=> b!1451490 (= res!982726 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47472 a!2862) j!93) a!2862 mask!2687) lt!636668))))

(declare-fun b!1451491 () Bool)

(assert (=> b!1451491 (= e!817237 e!817238)))

(declare-fun res!982725 () Bool)

(assert (=> b!1451491 (=> (not res!982725) (not e!817238))))

(declare-fun lt!636667 () SeekEntryResult!11724)

(assert (=> b!1451491 (= res!982725 (= lt!636667 (Intermediate!11724 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451491 (= lt!636667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636665 mask!2687) lt!636665 lt!636666 mask!2687))))

(assert (=> b!1451491 (= lt!636665 (select (store (arr!47472 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1451492 () Bool)

(assert (=> b!1451492 (= e!817239 (and (or (= (select (arr!47472 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47472 a!2862) intermediateBeforeIndex!19) (select (arr!47472 a!2862) j!93))) (or (and (= (select (arr!47472 a!2862) index!646) (select (store (arr!47472 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47472 a!2862) index!646) (select (arr!47472 a!2862) j!93))) (= (select (arr!47472 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47472 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451493 () Bool)

(assert (=> b!1451493 (= e!817240 (= lt!636667 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636665 lt!636666 mask!2687)))))

(declare-fun b!1451494 () Bool)

(declare-fun res!982717 () Bool)

(assert (=> b!1451494 (=> (not res!982717) (not e!817241))))

(assert (=> b!1451494 (= res!982717 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48022 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48022 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48022 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451495 () Bool)

(declare-fun res!982716 () Bool)

(assert (=> b!1451495 (=> (not res!982716) (not e!817241))))

(assert (=> b!1451495 (= res!982716 (and (= (size!48022 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48022 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48022 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451496 () Bool)

(declare-fun res!982714 () Bool)

(assert (=> b!1451496 (=> (not res!982714) (not e!817241))))

(assert (=> b!1451496 (= res!982714 (validKeyInArray!0 (select (arr!47472 a!2862) i!1006)))))

(declare-fun b!1451497 () Bool)

(assert (=> b!1451497 (= e!817238 (not true))))

(assert (=> b!1451497 e!817239))

(declare-fun res!982721 () Bool)

(assert (=> b!1451497 (=> (not res!982721) (not e!817239))))

(assert (=> b!1451497 (= res!982721 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48944 0))(
  ( (Unit!48945) )
))
(declare-fun lt!636669 () Unit!48944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48944)

(assert (=> b!1451497 (= lt!636669 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451498 () Bool)

(declare-fun e!817235 () Bool)

(assert (=> b!1451498 (= e!817235 e!817237)))

(declare-fun res!982724 () Bool)

(assert (=> b!1451498 (=> (not res!982724) (not e!817237))))

(assert (=> b!1451498 (= res!982724 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47472 a!2862) j!93) mask!2687) (select (arr!47472 a!2862) j!93) a!2862 mask!2687) lt!636668))))

(assert (=> b!1451498 (= lt!636668 (Intermediate!11724 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451499 () Bool)

(assert (=> b!1451499 (= e!817241 e!817235)))

(declare-fun res!982719 () Bool)

(assert (=> b!1451499 (=> (not res!982719) (not e!817235))))

(assert (=> b!1451499 (= res!982719 (= (select (store (arr!47472 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451499 (= lt!636666 (array!98369 (store (arr!47472 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48022 a!2862)))))

(assert (= (and start!124920 res!982723) b!1451495))

(assert (= (and b!1451495 res!982716) b!1451496))

(assert (= (and b!1451496 res!982714) b!1451487))

(assert (= (and b!1451487 res!982722) b!1451486))

(assert (= (and b!1451486 res!982713) b!1451483))

(assert (= (and b!1451483 res!982712) b!1451494))

(assert (= (and b!1451494 res!982717) b!1451499))

(assert (= (and b!1451499 res!982719) b!1451498))

(assert (= (and b!1451498 res!982724) b!1451490))

(assert (= (and b!1451490 res!982726) b!1451491))

(assert (= (and b!1451491 res!982725) b!1451485))

(assert (= (and b!1451485 c!133896) b!1451493))

(assert (= (and b!1451485 (not c!133896)) b!1451488))

(assert (= (and b!1451485 res!982720) b!1451489))

(assert (= (and b!1451489 res!982718) b!1451497))

(assert (= (and b!1451497 res!982721) b!1451484))

(assert (= (and b!1451484 res!982715) b!1451492))

(declare-fun m!1340079 () Bool)

(assert (=> b!1451496 m!1340079))

(assert (=> b!1451496 m!1340079))

(declare-fun m!1340081 () Bool)

(assert (=> b!1451496 m!1340081))

(declare-fun m!1340083 () Bool)

(assert (=> b!1451498 m!1340083))

(assert (=> b!1451498 m!1340083))

(declare-fun m!1340085 () Bool)

(assert (=> b!1451498 m!1340085))

(assert (=> b!1451498 m!1340085))

(assert (=> b!1451498 m!1340083))

(declare-fun m!1340087 () Bool)

(assert (=> b!1451498 m!1340087))

(assert (=> b!1451487 m!1340083))

(assert (=> b!1451487 m!1340083))

(declare-fun m!1340089 () Bool)

(assert (=> b!1451487 m!1340089))

(declare-fun m!1340091 () Bool)

(assert (=> b!1451488 m!1340091))

(declare-fun m!1340093 () Bool)

(assert (=> b!1451488 m!1340093))

(declare-fun m!1340095 () Bool)

(assert (=> start!124920 m!1340095))

(declare-fun m!1340097 () Bool)

(assert (=> start!124920 m!1340097))

(assert (=> b!1451484 m!1340083))

(assert (=> b!1451484 m!1340083))

(declare-fun m!1340099 () Bool)

(assert (=> b!1451484 m!1340099))

(declare-fun m!1340101 () Bool)

(assert (=> b!1451486 m!1340101))

(declare-fun m!1340103 () Bool)

(assert (=> b!1451499 m!1340103))

(declare-fun m!1340105 () Bool)

(assert (=> b!1451499 m!1340105))

(declare-fun m!1340107 () Bool)

(assert (=> b!1451493 m!1340107))

(assert (=> b!1451490 m!1340083))

(assert (=> b!1451490 m!1340083))

(declare-fun m!1340109 () Bool)

(assert (=> b!1451490 m!1340109))

(assert (=> b!1451492 m!1340103))

(declare-fun m!1340111 () Bool)

(assert (=> b!1451492 m!1340111))

(declare-fun m!1340113 () Bool)

(assert (=> b!1451492 m!1340113))

(declare-fun m!1340115 () Bool)

(assert (=> b!1451492 m!1340115))

(assert (=> b!1451492 m!1340083))

(declare-fun m!1340117 () Bool)

(assert (=> b!1451497 m!1340117))

(declare-fun m!1340119 () Bool)

(assert (=> b!1451497 m!1340119))

(declare-fun m!1340121 () Bool)

(assert (=> b!1451483 m!1340121))

(declare-fun m!1340123 () Bool)

(assert (=> b!1451491 m!1340123))

(assert (=> b!1451491 m!1340123))

(declare-fun m!1340125 () Bool)

(assert (=> b!1451491 m!1340125))

(assert (=> b!1451491 m!1340103))

(declare-fun m!1340127 () Bool)

(assert (=> b!1451491 m!1340127))

(check-sat (not b!1451493) (not b!1451498) (not b!1451496) (not b!1451486) (not b!1451497) (not b!1451484) (not b!1451483) (not start!124920) (not b!1451490) (not b!1451491) (not b!1451487) (not b!1451488))
(check-sat)
