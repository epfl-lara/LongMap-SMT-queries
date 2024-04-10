; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124904 () Bool)

(assert start!124904)

(declare-fun b!1451071 () Bool)

(declare-fun res!982354 () Bool)

(declare-fun e!817073 () Bool)

(assert (=> b!1451071 (=> (not res!982354) (not e!817073))))

(declare-datatypes ((array!98352 0))(
  ( (array!98353 (arr!47464 (Array (_ BitVec 32) (_ BitVec 64))) (size!48014 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98352)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451071 (= res!982354 (validKeyInArray!0 (select (arr!47464 a!2862) i!1006)))))

(declare-fun b!1451072 () Bool)

(declare-fun res!982359 () Bool)

(declare-fun e!817063 () Bool)

(assert (=> b!1451072 (=> (not res!982359) (not e!817063))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11716 0))(
  ( (MissingZero!11716 (index!49256 (_ BitVec 32))) (Found!11716 (index!49257 (_ BitVec 32))) (Intermediate!11716 (undefined!12528 Bool) (index!49258 (_ BitVec 32)) (x!130909 (_ BitVec 32))) (Undefined!11716) (MissingVacant!11716 (index!49259 (_ BitVec 32))) )
))
(declare-fun lt!636546 () SeekEntryResult!11716)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98352 (_ BitVec 32)) SeekEntryResult!11716)

(assert (=> b!1451072 (= res!982359 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47464 a!2862) j!93) a!2862 mask!2687) lt!636546))))

(declare-fun b!1451073 () Bool)

(declare-fun e!817067 () Bool)

(declare-fun e!817071 () Bool)

(assert (=> b!1451073 (= e!817067 (not e!817071))))

(declare-fun res!982358 () Bool)

(assert (=> b!1451073 (=> res!982358 e!817071)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1451073 (= res!982358 (or (and (= (select (arr!47464 a!2862) index!646) (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47464 a!2862) index!646) (select (arr!47464 a!2862) j!93))) (not (= (select (arr!47464 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47464 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!817065 () Bool)

(assert (=> b!1451073 e!817065))

(declare-fun res!982350 () Bool)

(assert (=> b!1451073 (=> (not res!982350) (not e!817065))))

(declare-fun lt!636544 () SeekEntryResult!11716)

(declare-fun lt!636548 () SeekEntryResult!11716)

(assert (=> b!1451073 (= res!982350 (and (= lt!636544 lt!636548) (or (= (select (arr!47464 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47464 a!2862) intermediateBeforeIndex!19) (select (arr!47464 a!2862) j!93)))))))

(assert (=> b!1451073 (= lt!636548 (Found!11716 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98352 (_ BitVec 32)) SeekEntryResult!11716)

(assert (=> b!1451073 (= lt!636544 (seekEntryOrOpen!0 (select (arr!47464 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98352 (_ BitVec 32)) Bool)

(assert (=> b!1451073 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48928 0))(
  ( (Unit!48929) )
))
(declare-fun lt!636545 () Unit!48928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48928)

(assert (=> b!1451073 (= lt!636545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451074 () Bool)

(declare-fun e!817068 () Bool)

(assert (=> b!1451074 (= e!817073 e!817068)))

(declare-fun res!982356 () Bool)

(assert (=> b!1451074 (=> (not res!982356) (not e!817068))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451074 (= res!982356 (= (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636543 () array!98352)

(assert (=> b!1451074 (= lt!636543 (array!98353 (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48014 a!2862)))))

(declare-fun b!1451075 () Bool)

(declare-fun res!982361 () Bool)

(assert (=> b!1451075 (=> (not res!982361) (not e!817073))))

(assert (=> b!1451075 (= res!982361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451076 () Bool)

(assert (=> b!1451076 (= e!817068 e!817063)))

(declare-fun res!982349 () Bool)

(assert (=> b!1451076 (=> (not res!982349) (not e!817063))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451076 (= res!982349 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47464 a!2862) j!93) mask!2687) (select (arr!47464 a!2862) j!93) a!2862 mask!2687) lt!636546))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451076 (= lt!636546 (Intermediate!11716 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451077 () Bool)

(declare-fun res!982353 () Bool)

(assert (=> b!1451077 (=> (not res!982353) (not e!817067))))

(assert (=> b!1451077 (= res!982353 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!982362 () Bool)

(assert (=> start!124904 (=> (not res!982362) (not e!817073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124904 (= res!982362 (validMask!0 mask!2687))))

(assert (=> start!124904 e!817073))

(assert (=> start!124904 true))

(declare-fun array_inv!36492 (array!98352) Bool)

(assert (=> start!124904 (array_inv!36492 a!2862)))

(declare-fun b!1451078 () Bool)

(declare-fun res!982352 () Bool)

(assert (=> b!1451078 (=> (not res!982352) (not e!817073))))

(assert (=> b!1451078 (= res!982352 (validKeyInArray!0 (select (arr!47464 a!2862) j!93)))))

(declare-fun b!1451079 () Bool)

(declare-fun e!817064 () Bool)

(assert (=> b!1451079 (= e!817064 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1451080 () Bool)

(assert (=> b!1451080 (= e!817063 e!817067)))

(declare-fun res!982363 () Bool)

(assert (=> b!1451080 (=> (not res!982363) (not e!817067))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!636549 () SeekEntryResult!11716)

(assert (=> b!1451080 (= res!982363 (= lt!636549 (Intermediate!11716 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636542 () (_ BitVec 64))

(assert (=> b!1451080 (= lt!636549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636542 mask!2687) lt!636542 lt!636543 mask!2687))))

(assert (=> b!1451080 (= lt!636542 (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!817066 () Bool)

(declare-fun b!1451081 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98352 (_ BitVec 32)) SeekEntryResult!11716)

(assert (=> b!1451081 (= e!817066 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636542 lt!636543 mask!2687) (seekEntryOrOpen!0 lt!636542 lt!636543 mask!2687)))))

(declare-fun b!1451082 () Bool)

(declare-fun e!817072 () Bool)

(assert (=> b!1451082 (= e!817071 e!817072)))

(declare-fun res!982364 () Bool)

(assert (=> b!1451082 (=> res!982364 e!817072)))

(assert (=> b!1451082 (= res!982364 (bvslt mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1451082 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636542 lt!636543 mask!2687) lt!636548)))

(declare-fun lt!636547 () Unit!48928)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48928)

(assert (=> b!1451082 (= lt!636547 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1451083 () Bool)

(declare-fun res!982357 () Bool)

(assert (=> b!1451083 (=> (not res!982357) (not e!817067))))

(assert (=> b!1451083 (= res!982357 e!817066)))

(declare-fun c!133872 () Bool)

(assert (=> b!1451083 (= c!133872 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451084 () Bool)

(assert (=> b!1451084 (= e!817066 (= lt!636549 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636542 lt!636543 mask!2687)))))

(declare-fun b!1451085 () Bool)

(assert (=> b!1451085 (= e!817072 (validKeyInArray!0 lt!636542))))

(declare-fun b!1451086 () Bool)

(declare-fun res!982365 () Bool)

(assert (=> b!1451086 (=> (not res!982365) (not e!817073))))

(assert (=> b!1451086 (= res!982365 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48014 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48014 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48014 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451087 () Bool)

(declare-fun res!982360 () Bool)

(assert (=> b!1451087 (=> (not res!982360) (not e!817073))))

(assert (=> b!1451087 (= res!982360 (and (= (size!48014 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48014 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48014 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451088 () Bool)

(declare-fun e!817070 () Bool)

(assert (=> b!1451088 (= e!817065 e!817070)))

(declare-fun res!982351 () Bool)

(assert (=> b!1451088 (=> res!982351 e!817070)))

(assert (=> b!1451088 (= res!982351 (or (and (= (select (arr!47464 a!2862) index!646) (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47464 a!2862) index!646) (select (arr!47464 a!2862) j!93))) (not (= (select (arr!47464 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1451089 () Bool)

(assert (=> b!1451089 (= e!817070 e!817064)))

(declare-fun res!982366 () Bool)

(assert (=> b!1451089 (=> (not res!982366) (not e!817064))))

(assert (=> b!1451089 (= res!982366 (= lt!636544 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47464 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1451090 () Bool)

(declare-fun res!982355 () Bool)

(assert (=> b!1451090 (=> res!982355 e!817071)))

(assert (=> b!1451090 (= res!982355 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47464 a!2862) j!93) a!2862 mask!2687) lt!636548)))))

(declare-fun b!1451091 () Bool)

(declare-fun res!982348 () Bool)

(assert (=> b!1451091 (=> (not res!982348) (not e!817073))))

(declare-datatypes ((List!33965 0))(
  ( (Nil!33962) (Cons!33961 (h!35311 (_ BitVec 64)) (t!48659 List!33965)) )
))
(declare-fun arrayNoDuplicates!0 (array!98352 (_ BitVec 32) List!33965) Bool)

(assert (=> b!1451091 (= res!982348 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33962))))

(assert (= (and start!124904 res!982362) b!1451087))

(assert (= (and b!1451087 res!982360) b!1451071))

(assert (= (and b!1451071 res!982354) b!1451078))

(assert (= (and b!1451078 res!982352) b!1451075))

(assert (= (and b!1451075 res!982361) b!1451091))

(assert (= (and b!1451091 res!982348) b!1451086))

(assert (= (and b!1451086 res!982365) b!1451074))

(assert (= (and b!1451074 res!982356) b!1451076))

(assert (= (and b!1451076 res!982349) b!1451072))

(assert (= (and b!1451072 res!982359) b!1451080))

(assert (= (and b!1451080 res!982363) b!1451083))

(assert (= (and b!1451083 c!133872) b!1451084))

(assert (= (and b!1451083 (not c!133872)) b!1451081))

(assert (= (and b!1451083 res!982357) b!1451077))

(assert (= (and b!1451077 res!982353) b!1451073))

(assert (= (and b!1451073 res!982350) b!1451088))

(assert (= (and b!1451088 (not res!982351)) b!1451089))

(assert (= (and b!1451089 res!982366) b!1451079))

(assert (= (and b!1451073 (not res!982358)) b!1451090))

(assert (= (and b!1451090 (not res!982355)) b!1451082))

(assert (= (and b!1451082 (not res!982364)) b!1451085))

(declare-fun m!1339671 () Bool)

(assert (=> b!1451091 m!1339671))

(declare-fun m!1339673 () Bool)

(assert (=> b!1451089 m!1339673))

(assert (=> b!1451089 m!1339673))

(declare-fun m!1339675 () Bool)

(assert (=> b!1451089 m!1339675))

(assert (=> b!1451078 m!1339673))

(assert (=> b!1451078 m!1339673))

(declare-fun m!1339677 () Bool)

(assert (=> b!1451078 m!1339677))

(declare-fun m!1339679 () Bool)

(assert (=> b!1451071 m!1339679))

(assert (=> b!1451071 m!1339679))

(declare-fun m!1339681 () Bool)

(assert (=> b!1451071 m!1339681))

(declare-fun m!1339683 () Bool)

(assert (=> b!1451084 m!1339683))

(declare-fun m!1339685 () Bool)

(assert (=> b!1451073 m!1339685))

(declare-fun m!1339687 () Bool)

(assert (=> b!1451073 m!1339687))

(declare-fun m!1339689 () Bool)

(assert (=> b!1451073 m!1339689))

(declare-fun m!1339691 () Bool)

(assert (=> b!1451073 m!1339691))

(declare-fun m!1339693 () Bool)

(assert (=> b!1451073 m!1339693))

(assert (=> b!1451073 m!1339673))

(declare-fun m!1339695 () Bool)

(assert (=> b!1451073 m!1339695))

(declare-fun m!1339697 () Bool)

(assert (=> b!1451073 m!1339697))

(assert (=> b!1451073 m!1339673))

(declare-fun m!1339699 () Bool)

(assert (=> b!1451082 m!1339699))

(declare-fun m!1339701 () Bool)

(assert (=> b!1451082 m!1339701))

(declare-fun m!1339703 () Bool)

(assert (=> b!1451080 m!1339703))

(assert (=> b!1451080 m!1339703))

(declare-fun m!1339705 () Bool)

(assert (=> b!1451080 m!1339705))

(assert (=> b!1451080 m!1339687))

(declare-fun m!1339707 () Bool)

(assert (=> b!1451080 m!1339707))

(assert (=> b!1451090 m!1339673))

(assert (=> b!1451090 m!1339673))

(declare-fun m!1339709 () Bool)

(assert (=> b!1451090 m!1339709))

(assert (=> b!1451074 m!1339687))

(declare-fun m!1339711 () Bool)

(assert (=> b!1451074 m!1339711))

(declare-fun m!1339713 () Bool)

(assert (=> b!1451075 m!1339713))

(assert (=> b!1451076 m!1339673))

(assert (=> b!1451076 m!1339673))

(declare-fun m!1339715 () Bool)

(assert (=> b!1451076 m!1339715))

(assert (=> b!1451076 m!1339715))

(assert (=> b!1451076 m!1339673))

(declare-fun m!1339717 () Bool)

(assert (=> b!1451076 m!1339717))

(assert (=> b!1451072 m!1339673))

(assert (=> b!1451072 m!1339673))

(declare-fun m!1339719 () Bool)

(assert (=> b!1451072 m!1339719))

(declare-fun m!1339721 () Bool)

(assert (=> start!124904 m!1339721))

(declare-fun m!1339723 () Bool)

(assert (=> start!124904 m!1339723))

(declare-fun m!1339725 () Bool)

(assert (=> b!1451085 m!1339725))

(assert (=> b!1451081 m!1339699))

(declare-fun m!1339727 () Bool)

(assert (=> b!1451081 m!1339727))

(assert (=> b!1451088 m!1339693))

(assert (=> b!1451088 m!1339687))

(assert (=> b!1451088 m!1339691))

(assert (=> b!1451088 m!1339673))

(push 1)

