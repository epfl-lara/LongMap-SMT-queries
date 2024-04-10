; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126388 () Bool)

(assert start!126388)

(declare-fun res!1007015 () Bool)

(declare-fun e!830996 () Bool)

(assert (=> start!126388 (=> (not res!1007015) (not e!830996))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126388 (= res!1007015 (validMask!0 mask!2687))))

(assert (=> start!126388 e!830996))

(assert (=> start!126388 true))

(declare-datatypes ((array!99407 0))(
  ( (array!99408 (arr!47981 (Array (_ BitVec 32) (_ BitVec 64))) (size!48531 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99407)

(declare-fun array_inv!37009 (array!99407) Bool)

(assert (=> start!126388 (array_inv!37009 a!2862)))

(declare-fun e!830992 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12221 0))(
  ( (MissingZero!12221 (index!51276 (_ BitVec 32))) (Found!12221 (index!51277 (_ BitVec 32))) (Intermediate!12221 (undefined!13033 Bool) (index!51278 (_ BitVec 32)) (x!132864 (_ BitVec 32))) (Undefined!12221) (MissingVacant!12221 (index!51279 (_ BitVec 32))) )
))
(declare-fun lt!646863 () SeekEntryResult!12221)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!646861 () array!99407)

(declare-fun b!1481720 () Bool)

(declare-fun lt!646859 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99407 (_ BitVec 32)) SeekEntryResult!12221)

(assert (=> b!1481720 (= e!830992 (= lt!646863 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646859 lt!646861 mask!2687)))))

(declare-fun b!1481721 () Bool)

(declare-fun res!1007026 () Bool)

(assert (=> b!1481721 (=> (not res!1007026) (not e!830996))))

(declare-datatypes ((List!34482 0))(
  ( (Nil!34479) (Cons!34478 (h!35849 (_ BitVec 64)) (t!49176 List!34482)) )
))
(declare-fun arrayNoDuplicates!0 (array!99407 (_ BitVec 32) List!34482) Bool)

(assert (=> b!1481721 (= res!1007026 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34479))))

(declare-fun b!1481722 () Bool)

(declare-fun res!1007019 () Bool)

(declare-fun e!830994 () Bool)

(assert (=> b!1481722 (=> (not res!1007019) (not e!830994))))

(assert (=> b!1481722 (= res!1007019 e!830992)))

(declare-fun c!136875 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481722 (= c!136875 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481723 () Bool)

(declare-fun e!830995 () Bool)

(assert (=> b!1481723 (= e!830995 e!830994)))

(declare-fun res!1007021 () Bool)

(assert (=> b!1481723 (=> (not res!1007021) (not e!830994))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481723 (= res!1007021 (= lt!646863 (Intermediate!12221 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481723 (= lt!646863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646859 mask!2687) lt!646859 lt!646861 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481723 (= lt!646859 (select (store (arr!47981 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481724 () Bool)

(declare-fun e!830991 () Bool)

(assert (=> b!1481724 (= e!830991 e!830995)))

(declare-fun res!1007016 () Bool)

(assert (=> b!1481724 (=> (not res!1007016) (not e!830995))))

(declare-fun lt!646862 () SeekEntryResult!12221)

(assert (=> b!1481724 (= res!1007016 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47981 a!2862) j!93) mask!2687) (select (arr!47981 a!2862) j!93) a!2862 mask!2687) lt!646862))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481724 (= lt!646862 (Intermediate!12221 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481725 () Bool)

(assert (=> b!1481725 (= e!830994 (not true))))

(declare-fun e!830993 () Bool)

(assert (=> b!1481725 e!830993))

(declare-fun res!1007012 () Bool)

(assert (=> b!1481725 (=> (not res!1007012) (not e!830993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99407 (_ BitVec 32)) Bool)

(assert (=> b!1481725 (= res!1007012 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49782 0))(
  ( (Unit!49783) )
))
(declare-fun lt!646860 () Unit!49782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49782)

(assert (=> b!1481725 (= lt!646860 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481726 () Bool)

(declare-fun res!1007025 () Bool)

(assert (=> b!1481726 (=> (not res!1007025) (not e!830996))))

(assert (=> b!1481726 (= res!1007025 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48531 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48531 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48531 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481727 () Bool)

(declare-fun res!1007020 () Bool)

(assert (=> b!1481727 (=> (not res!1007020) (not e!830995))))

(assert (=> b!1481727 (= res!1007020 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47981 a!2862) j!93) a!2862 mask!2687) lt!646862))))

(declare-fun b!1481728 () Bool)

(declare-fun res!1007018 () Bool)

(assert (=> b!1481728 (=> (not res!1007018) (not e!830996))))

(assert (=> b!1481728 (= res!1007018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481729 () Bool)

(assert (=> b!1481729 (= e!830993 (and (or (= (select (arr!47981 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47981 a!2862) intermediateBeforeIndex!19) (select (arr!47981 a!2862) j!93))) (or (and (= (select (arr!47981 a!2862) index!646) (select (store (arr!47981 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47981 a!2862) index!646) (select (arr!47981 a!2862) j!93))) (= (select (arr!47981 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47981 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481730 () Bool)

(declare-fun res!1007022 () Bool)

(assert (=> b!1481730 (=> (not res!1007022) (not e!830993))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99407 (_ BitVec 32)) SeekEntryResult!12221)

(assert (=> b!1481730 (= res!1007022 (= (seekEntryOrOpen!0 (select (arr!47981 a!2862) j!93) a!2862 mask!2687) (Found!12221 j!93)))))

(declare-fun b!1481731 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99407 (_ BitVec 32)) SeekEntryResult!12221)

(assert (=> b!1481731 (= e!830992 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646859 lt!646861 mask!2687) (seekEntryOrOpen!0 lt!646859 lt!646861 mask!2687)))))

(declare-fun b!1481732 () Bool)

(declare-fun res!1007024 () Bool)

(assert (=> b!1481732 (=> (not res!1007024) (not e!830996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481732 (= res!1007024 (validKeyInArray!0 (select (arr!47981 a!2862) j!93)))))

(declare-fun b!1481733 () Bool)

(declare-fun res!1007013 () Bool)

(assert (=> b!1481733 (=> (not res!1007013) (not e!830996))))

(assert (=> b!1481733 (= res!1007013 (and (= (size!48531 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48531 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48531 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481734 () Bool)

(declare-fun res!1007023 () Bool)

(assert (=> b!1481734 (=> (not res!1007023) (not e!830994))))

(assert (=> b!1481734 (= res!1007023 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481735 () Bool)

(declare-fun res!1007017 () Bool)

(assert (=> b!1481735 (=> (not res!1007017) (not e!830996))))

(assert (=> b!1481735 (= res!1007017 (validKeyInArray!0 (select (arr!47981 a!2862) i!1006)))))

(declare-fun b!1481736 () Bool)

(assert (=> b!1481736 (= e!830996 e!830991)))

(declare-fun res!1007014 () Bool)

(assert (=> b!1481736 (=> (not res!1007014) (not e!830991))))

(assert (=> b!1481736 (= res!1007014 (= (select (store (arr!47981 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481736 (= lt!646861 (array!99408 (store (arr!47981 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48531 a!2862)))))

(assert (= (and start!126388 res!1007015) b!1481733))

(assert (= (and b!1481733 res!1007013) b!1481735))

(assert (= (and b!1481735 res!1007017) b!1481732))

(assert (= (and b!1481732 res!1007024) b!1481728))

(assert (= (and b!1481728 res!1007018) b!1481721))

(assert (= (and b!1481721 res!1007026) b!1481726))

(assert (= (and b!1481726 res!1007025) b!1481736))

(assert (= (and b!1481736 res!1007014) b!1481724))

(assert (= (and b!1481724 res!1007016) b!1481727))

(assert (= (and b!1481727 res!1007020) b!1481723))

(assert (= (and b!1481723 res!1007021) b!1481722))

(assert (= (and b!1481722 c!136875) b!1481720))

(assert (= (and b!1481722 (not c!136875)) b!1481731))

(assert (= (and b!1481722 res!1007019) b!1481734))

(assert (= (and b!1481734 res!1007023) b!1481725))

(assert (= (and b!1481725 res!1007012) b!1481730))

(assert (= (and b!1481730 res!1007022) b!1481729))

(declare-fun m!1367455 () Bool)

(assert (=> b!1481735 m!1367455))

(assert (=> b!1481735 m!1367455))

(declare-fun m!1367457 () Bool)

(assert (=> b!1481735 m!1367457))

(declare-fun m!1367459 () Bool)

(assert (=> b!1481729 m!1367459))

(declare-fun m!1367461 () Bool)

(assert (=> b!1481729 m!1367461))

(declare-fun m!1367463 () Bool)

(assert (=> b!1481729 m!1367463))

(declare-fun m!1367465 () Bool)

(assert (=> b!1481729 m!1367465))

(declare-fun m!1367467 () Bool)

(assert (=> b!1481729 m!1367467))

(assert (=> b!1481724 m!1367467))

(assert (=> b!1481724 m!1367467))

(declare-fun m!1367469 () Bool)

(assert (=> b!1481724 m!1367469))

(assert (=> b!1481724 m!1367469))

(assert (=> b!1481724 m!1367467))

(declare-fun m!1367471 () Bool)

(assert (=> b!1481724 m!1367471))

(declare-fun m!1367473 () Bool)

(assert (=> b!1481725 m!1367473))

(declare-fun m!1367475 () Bool)

(assert (=> b!1481725 m!1367475))

(declare-fun m!1367477 () Bool)

(assert (=> b!1481723 m!1367477))

(assert (=> b!1481723 m!1367477))

(declare-fun m!1367479 () Bool)

(assert (=> b!1481723 m!1367479))

(assert (=> b!1481723 m!1367459))

(declare-fun m!1367481 () Bool)

(assert (=> b!1481723 m!1367481))

(assert (=> b!1481727 m!1367467))

(assert (=> b!1481727 m!1367467))

(declare-fun m!1367483 () Bool)

(assert (=> b!1481727 m!1367483))

(declare-fun m!1367485 () Bool)

(assert (=> b!1481720 m!1367485))

(assert (=> b!1481732 m!1367467))

(assert (=> b!1481732 m!1367467))

(declare-fun m!1367487 () Bool)

(assert (=> b!1481732 m!1367487))

(declare-fun m!1367489 () Bool)

(assert (=> b!1481728 m!1367489))

(declare-fun m!1367491 () Bool)

(assert (=> b!1481721 m!1367491))

(declare-fun m!1367493 () Bool)

(assert (=> b!1481731 m!1367493))

(declare-fun m!1367495 () Bool)

(assert (=> b!1481731 m!1367495))

(declare-fun m!1367497 () Bool)

(assert (=> start!126388 m!1367497))

(declare-fun m!1367499 () Bool)

(assert (=> start!126388 m!1367499))

(assert (=> b!1481730 m!1367467))

(assert (=> b!1481730 m!1367467))

(declare-fun m!1367501 () Bool)

(assert (=> b!1481730 m!1367501))

(assert (=> b!1481736 m!1367459))

(declare-fun m!1367503 () Bool)

(assert (=> b!1481736 m!1367503))

(push 1)

