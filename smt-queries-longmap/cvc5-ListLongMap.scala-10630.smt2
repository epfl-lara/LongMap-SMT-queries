; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124918 () Bool)

(assert start!124918)

(declare-fun b!1451432 () Bool)

(declare-fun res!982674 () Bool)

(declare-fun e!817218 () Bool)

(assert (=> b!1451432 (=> (not res!982674) (not e!817218))))

(declare-datatypes ((array!98366 0))(
  ( (array!98367 (arr!47471 (Array (_ BitVec 32) (_ BitVec 64))) (size!48021 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98366)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451432 (= res!982674 (validKeyInArray!0 (select (arr!47471 a!2862) i!1006)))))

(declare-fun b!1451433 () Bool)

(declare-fun res!982677 () Bool)

(declare-fun e!817217 () Bool)

(assert (=> b!1451433 (=> (not res!982677) (not e!817217))))

(declare-fun e!817216 () Bool)

(assert (=> b!1451433 (= res!982677 e!817216)))

(declare-fun c!133893 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451433 (= c!133893 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!982669 () Bool)

(assert (=> start!124918 (=> (not res!982669) (not e!817218))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124918 (= res!982669 (validMask!0 mask!2687))))

(assert (=> start!124918 e!817218))

(assert (=> start!124918 true))

(declare-fun array_inv!36499 (array!98366) Bool)

(assert (=> start!124918 (array_inv!36499 a!2862)))

(declare-fun b!1451434 () Bool)

(declare-fun res!982670 () Bool)

(assert (=> b!1451434 (=> (not res!982670) (not e!817218))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1451434 (= res!982670 (and (= (size!48021 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48021 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48021 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451435 () Bool)

(assert (=> b!1451435 (= e!817217 (not true))))

(declare-fun e!817215 () Bool)

(assert (=> b!1451435 e!817215))

(declare-fun res!982676 () Bool)

(assert (=> b!1451435 (=> (not res!982676) (not e!817215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98366 (_ BitVec 32)) Bool)

(assert (=> b!1451435 (= res!982676 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48942 0))(
  ( (Unit!48943) )
))
(declare-fun lt!636654 () Unit!48942)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48942)

(assert (=> b!1451435 (= lt!636654 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451436 () Bool)

(declare-fun res!982673 () Bool)

(assert (=> b!1451436 (=> (not res!982673) (not e!817218))))

(declare-datatypes ((List!33972 0))(
  ( (Nil!33969) (Cons!33968 (h!35318 (_ BitVec 64)) (t!48666 List!33972)) )
))
(declare-fun arrayNoDuplicates!0 (array!98366 (_ BitVec 32) List!33972) Bool)

(assert (=> b!1451436 (= res!982673 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33969))))

(declare-fun b!1451437 () Bool)

(declare-fun res!982667 () Bool)

(assert (=> b!1451437 (=> (not res!982667) (not e!817217))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451437 (= res!982667 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1451438 () Bool)

(assert (=> b!1451438 (= e!817215 (and (or (= (select (arr!47471 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47471 a!2862) intermediateBeforeIndex!19) (select (arr!47471 a!2862) j!93))) (or (and (= (select (arr!47471 a!2862) index!646) (select (store (arr!47471 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47471 a!2862) index!646) (select (arr!47471 a!2862) j!93))) (= (select (arr!47471 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47471 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451439 () Bool)

(declare-fun res!982675 () Bool)

(declare-fun e!817214 () Bool)

(assert (=> b!1451439 (=> (not res!982675) (not e!817214))))

(declare-datatypes ((SeekEntryResult!11723 0))(
  ( (MissingZero!11723 (index!49284 (_ BitVec 32))) (Found!11723 (index!49285 (_ BitVec 32))) (Intermediate!11723 (undefined!12535 Bool) (index!49286 (_ BitVec 32)) (x!130940 (_ BitVec 32))) (Undefined!11723) (MissingVacant!11723 (index!49287 (_ BitVec 32))) )
))
(declare-fun lt!636651 () SeekEntryResult!11723)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98366 (_ BitVec 32)) SeekEntryResult!11723)

(assert (=> b!1451439 (= res!982675 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47471 a!2862) j!93) a!2862 mask!2687) lt!636651))))

(declare-fun b!1451440 () Bool)

(assert (=> b!1451440 (= e!817214 e!817217)))

(declare-fun res!982679 () Bool)

(assert (=> b!1451440 (=> (not res!982679) (not e!817217))))

(declare-fun lt!636650 () SeekEntryResult!11723)

(assert (=> b!1451440 (= res!982679 (= lt!636650 (Intermediate!11723 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636653 () (_ BitVec 64))

(declare-fun lt!636652 () array!98366)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451440 (= lt!636650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636653 mask!2687) lt!636653 lt!636652 mask!2687))))

(assert (=> b!1451440 (= lt!636653 (select (store (arr!47471 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451441 () Bool)

(declare-fun e!817219 () Bool)

(assert (=> b!1451441 (= e!817219 e!817214)))

(declare-fun res!982668 () Bool)

(assert (=> b!1451441 (=> (not res!982668) (not e!817214))))

(assert (=> b!1451441 (= res!982668 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47471 a!2862) j!93) mask!2687) (select (arr!47471 a!2862) j!93) a!2862 mask!2687) lt!636651))))

(assert (=> b!1451441 (= lt!636651 (Intermediate!11723 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451442 () Bool)

(declare-fun res!982672 () Bool)

(assert (=> b!1451442 (=> (not res!982672) (not e!817218))))

(assert (=> b!1451442 (= res!982672 (validKeyInArray!0 (select (arr!47471 a!2862) j!93)))))

(declare-fun b!1451443 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98366 (_ BitVec 32)) SeekEntryResult!11723)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98366 (_ BitVec 32)) SeekEntryResult!11723)

(assert (=> b!1451443 (= e!817216 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636653 lt!636652 mask!2687) (seekEntryOrOpen!0 lt!636653 lt!636652 mask!2687)))))

(declare-fun b!1451444 () Bool)

(declare-fun res!982678 () Bool)

(assert (=> b!1451444 (=> (not res!982678) (not e!817215))))

(assert (=> b!1451444 (= res!982678 (= (seekEntryOrOpen!0 (select (arr!47471 a!2862) j!93) a!2862 mask!2687) (Found!11723 j!93)))))

(declare-fun b!1451445 () Bool)

(assert (=> b!1451445 (= e!817216 (= lt!636650 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636653 lt!636652 mask!2687)))))

(declare-fun b!1451446 () Bool)

(assert (=> b!1451446 (= e!817218 e!817219)))

(declare-fun res!982671 () Bool)

(assert (=> b!1451446 (=> (not res!982671) (not e!817219))))

(assert (=> b!1451446 (= res!982671 (= (select (store (arr!47471 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451446 (= lt!636652 (array!98367 (store (arr!47471 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48021 a!2862)))))

(declare-fun b!1451447 () Bool)

(declare-fun res!982680 () Bool)

(assert (=> b!1451447 (=> (not res!982680) (not e!817218))))

(assert (=> b!1451447 (= res!982680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451448 () Bool)

(declare-fun res!982681 () Bool)

(assert (=> b!1451448 (=> (not res!982681) (not e!817218))))

(assert (=> b!1451448 (= res!982681 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48021 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48021 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48021 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124918 res!982669) b!1451434))

(assert (= (and b!1451434 res!982670) b!1451432))

(assert (= (and b!1451432 res!982674) b!1451442))

(assert (= (and b!1451442 res!982672) b!1451447))

(assert (= (and b!1451447 res!982680) b!1451436))

(assert (= (and b!1451436 res!982673) b!1451448))

(assert (= (and b!1451448 res!982681) b!1451446))

(assert (= (and b!1451446 res!982671) b!1451441))

(assert (= (and b!1451441 res!982668) b!1451439))

(assert (= (and b!1451439 res!982675) b!1451440))

(assert (= (and b!1451440 res!982679) b!1451433))

(assert (= (and b!1451433 c!133893) b!1451445))

(assert (= (and b!1451433 (not c!133893)) b!1451443))

(assert (= (and b!1451433 res!982677) b!1451437))

(assert (= (and b!1451437 res!982667) b!1451435))

(assert (= (and b!1451435 res!982676) b!1451444))

(assert (= (and b!1451444 res!982678) b!1451438))

(declare-fun m!1340029 () Bool)

(assert (=> b!1451447 m!1340029))

(declare-fun m!1340031 () Bool)

(assert (=> b!1451439 m!1340031))

(assert (=> b!1451439 m!1340031))

(declare-fun m!1340033 () Bool)

(assert (=> b!1451439 m!1340033))

(declare-fun m!1340035 () Bool)

(assert (=> b!1451445 m!1340035))

(assert (=> b!1451444 m!1340031))

(assert (=> b!1451444 m!1340031))

(declare-fun m!1340037 () Bool)

(assert (=> b!1451444 m!1340037))

(declare-fun m!1340039 () Bool)

(assert (=> start!124918 m!1340039))

(declare-fun m!1340041 () Bool)

(assert (=> start!124918 m!1340041))

(assert (=> b!1451442 m!1340031))

(assert (=> b!1451442 m!1340031))

(declare-fun m!1340043 () Bool)

(assert (=> b!1451442 m!1340043))

(declare-fun m!1340045 () Bool)

(assert (=> b!1451446 m!1340045))

(declare-fun m!1340047 () Bool)

(assert (=> b!1451446 m!1340047))

(declare-fun m!1340049 () Bool)

(assert (=> b!1451440 m!1340049))

(assert (=> b!1451440 m!1340049))

(declare-fun m!1340051 () Bool)

(assert (=> b!1451440 m!1340051))

(assert (=> b!1451440 m!1340045))

(declare-fun m!1340053 () Bool)

(assert (=> b!1451440 m!1340053))

(assert (=> b!1451441 m!1340031))

(assert (=> b!1451441 m!1340031))

(declare-fun m!1340055 () Bool)

(assert (=> b!1451441 m!1340055))

(assert (=> b!1451441 m!1340055))

(assert (=> b!1451441 m!1340031))

(declare-fun m!1340057 () Bool)

(assert (=> b!1451441 m!1340057))

(declare-fun m!1340059 () Bool)

(assert (=> b!1451443 m!1340059))

(declare-fun m!1340061 () Bool)

(assert (=> b!1451443 m!1340061))

(declare-fun m!1340063 () Bool)

(assert (=> b!1451436 m!1340063))

(assert (=> b!1451438 m!1340045))

(declare-fun m!1340065 () Bool)

(assert (=> b!1451438 m!1340065))

(declare-fun m!1340067 () Bool)

(assert (=> b!1451438 m!1340067))

(declare-fun m!1340069 () Bool)

(assert (=> b!1451438 m!1340069))

(assert (=> b!1451438 m!1340031))

(declare-fun m!1340071 () Bool)

(assert (=> b!1451432 m!1340071))

(assert (=> b!1451432 m!1340071))

(declare-fun m!1340073 () Bool)

(assert (=> b!1451432 m!1340073))

(declare-fun m!1340075 () Bool)

(assert (=> b!1451435 m!1340075))

(declare-fun m!1340077 () Bool)

(assert (=> b!1451435 m!1340077))

(push 1)

