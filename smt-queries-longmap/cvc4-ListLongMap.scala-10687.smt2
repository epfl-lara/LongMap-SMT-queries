; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125264 () Bool)

(assert start!125264)

(declare-fun b!1462185 () Bool)

(declare-fun e!821951 () Bool)

(declare-fun e!821958 () Bool)

(assert (=> b!1462185 (= e!821951 e!821958)))

(declare-fun res!991681 () Bool)

(assert (=> b!1462185 (=> (not res!991681) (not e!821958))))

(declare-datatypes ((SeekEntryResult!11896 0))(
  ( (MissingZero!11896 (index!49976 (_ BitVec 32))) (Found!11896 (index!49977 (_ BitVec 32))) (Intermediate!11896 (undefined!12708 Bool) (index!49978 (_ BitVec 32)) (x!131569 (_ BitVec 32))) (Undefined!11896) (MissingVacant!11896 (index!49979 (_ BitVec 32))) )
))
(declare-fun lt!640369 () SeekEntryResult!11896)

(declare-datatypes ((array!98712 0))(
  ( (array!98713 (arr!47644 (Array (_ BitVec 32) (_ BitVec 64))) (size!48194 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98712)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98712 (_ BitVec 32)) SeekEntryResult!11896)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462185 (= res!991681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47644 a!2862) j!93) mask!2687) (select (arr!47644 a!2862) j!93) a!2862 mask!2687) lt!640369))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462185 (= lt!640369 (Intermediate!11896 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!991675 () Bool)

(declare-fun e!821952 () Bool)

(assert (=> start!125264 (=> (not res!991675) (not e!821952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125264 (= res!991675 (validMask!0 mask!2687))))

(assert (=> start!125264 e!821952))

(assert (=> start!125264 true))

(declare-fun array_inv!36672 (array!98712) Bool)

(assert (=> start!125264 (array_inv!36672 a!2862)))

(declare-fun b!1462186 () Bool)

(declare-fun res!991676 () Bool)

(declare-fun e!821954 () Bool)

(assert (=> b!1462186 (=> (not res!991676) (not e!821954))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98712 (_ BitVec 32)) SeekEntryResult!11896)

(assert (=> b!1462186 (= res!991676 (= (seekEntryOrOpen!0 (select (arr!47644 a!2862) j!93) a!2862 mask!2687) (Found!11896 j!93)))))

(declare-fun b!1462187 () Bool)

(declare-fun res!991674 () Bool)

(assert (=> b!1462187 (=> (not res!991674) (not e!821952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462187 (= res!991674 (validKeyInArray!0 (select (arr!47644 a!2862) j!93)))))

(declare-fun b!1462188 () Bool)

(declare-fun res!991672 () Bool)

(assert (=> b!1462188 (=> (not res!991672) (not e!821952))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462188 (= res!991672 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48194 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48194 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48194 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462189 () Bool)

(declare-fun res!991669 () Bool)

(assert (=> b!1462189 (=> (not res!991669) (not e!821952))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462189 (= res!991669 (and (= (size!48194 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48194 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48194 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!640368 () (_ BitVec 32))

(declare-fun lt!640373 () array!98712)

(declare-fun lt!640371 () (_ BitVec 64))

(declare-fun b!1462190 () Bool)

(declare-fun e!821960 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98712 (_ BitVec 32)) SeekEntryResult!11896)

(assert (=> b!1462190 (= e!821960 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640368 intermediateAfterIndex!19 lt!640371 lt!640373 mask!2687) (seekEntryOrOpen!0 lt!640371 lt!640373 mask!2687))))))

(declare-fun b!1462191 () Bool)

(declare-fun res!991670 () Bool)

(assert (=> b!1462191 (=> (not res!991670) (not e!821952))))

(assert (=> b!1462191 (= res!991670 (validKeyInArray!0 (select (arr!47644 a!2862) i!1006)))))

(declare-fun b!1462192 () Bool)

(declare-fun res!991671 () Bool)

(assert (=> b!1462192 (=> (not res!991671) (not e!821958))))

(assert (=> b!1462192 (= res!991671 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47644 a!2862) j!93) a!2862 mask!2687) lt!640369))))

(declare-fun b!1462193 () Bool)

(assert (=> b!1462193 (= e!821954 (or (= (select (arr!47644 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47644 a!2862) intermediateBeforeIndex!19) (select (arr!47644 a!2862) j!93))))))

(declare-fun b!1462194 () Bool)

(declare-fun res!991666 () Bool)

(assert (=> b!1462194 (=> (not res!991666) (not e!821952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98712 (_ BitVec 32)) Bool)

(assert (=> b!1462194 (= res!991666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462195 () Bool)

(declare-fun res!991680 () Bool)

(declare-fun e!821955 () Bool)

(assert (=> b!1462195 (=> (not res!991680) (not e!821955))))

(declare-fun e!821956 () Bool)

(assert (=> b!1462195 (= res!991680 e!821956)))

(declare-fun c!134771 () Bool)

(assert (=> b!1462195 (= c!134771 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462196 () Bool)

(assert (=> b!1462196 (= e!821956 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640371 lt!640373 mask!2687) (seekEntryOrOpen!0 lt!640371 lt!640373 mask!2687)))))

(declare-fun lt!640370 () SeekEntryResult!11896)

(declare-fun b!1462197 () Bool)

(assert (=> b!1462197 (= e!821956 (= lt!640370 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640371 lt!640373 mask!2687)))))

(declare-fun b!1462198 () Bool)

(assert (=> b!1462198 (= e!821952 e!821951)))

(declare-fun res!991665 () Bool)

(assert (=> b!1462198 (=> (not res!991665) (not e!821951))))

(assert (=> b!1462198 (= res!991665 (= (select (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462198 (= lt!640373 (array!98713 (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48194 a!2862)))))

(declare-fun b!1462199 () Bool)

(declare-fun e!821957 () Bool)

(assert (=> b!1462199 (= e!821957 true)))

(declare-fun lt!640374 () Bool)

(assert (=> b!1462199 (= lt!640374 e!821960)))

(declare-fun c!134772 () Bool)

(assert (=> b!1462199 (= c!134772 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462200 () Bool)

(declare-fun res!991673 () Bool)

(assert (=> b!1462200 (=> (not res!991673) (not e!821952))))

(declare-datatypes ((List!34145 0))(
  ( (Nil!34142) (Cons!34141 (h!35491 (_ BitVec 64)) (t!48839 List!34145)) )
))
(declare-fun arrayNoDuplicates!0 (array!98712 (_ BitVec 32) List!34145) Bool)

(assert (=> b!1462200 (= res!991673 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34142))))

(declare-fun b!1462201 () Bool)

(declare-fun e!821953 () Bool)

(assert (=> b!1462201 (= e!821953 e!821957)))

(declare-fun res!991664 () Bool)

(assert (=> b!1462201 (=> res!991664 e!821957)))

(assert (=> b!1462201 (= res!991664 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640368 #b00000000000000000000000000000000) (bvsge lt!640368 (size!48194 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462201 (= lt!640368 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462202 () Bool)

(assert (=> b!1462202 (= e!821955 (not e!821953))))

(declare-fun res!991679 () Bool)

(assert (=> b!1462202 (=> res!991679 e!821953)))

(assert (=> b!1462202 (= res!991679 (or (and (= (select (arr!47644 a!2862) index!646) (select (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47644 a!2862) index!646) (select (arr!47644 a!2862) j!93))) (= (select (arr!47644 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462202 e!821954))

(declare-fun res!991668 () Bool)

(assert (=> b!1462202 (=> (not res!991668) (not e!821954))))

(assert (=> b!1462202 (= res!991668 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49288 0))(
  ( (Unit!49289) )
))
(declare-fun lt!640372 () Unit!49288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49288)

(assert (=> b!1462202 (= lt!640372 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462203 () Bool)

(assert (=> b!1462203 (= e!821960 (not (= lt!640370 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640368 lt!640371 lt!640373 mask!2687))))))

(declare-fun b!1462204 () Bool)

(declare-fun res!991677 () Bool)

(assert (=> b!1462204 (=> res!991677 e!821957)))

(assert (=> b!1462204 (= res!991677 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640368 (select (arr!47644 a!2862) j!93) a!2862 mask!2687) lt!640369)))))

(declare-fun b!1462205 () Bool)

(declare-fun res!991667 () Bool)

(assert (=> b!1462205 (=> (not res!991667) (not e!821955))))

(assert (=> b!1462205 (= res!991667 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462206 () Bool)

(assert (=> b!1462206 (= e!821958 e!821955)))

(declare-fun res!991678 () Bool)

(assert (=> b!1462206 (=> (not res!991678) (not e!821955))))

(assert (=> b!1462206 (= res!991678 (= lt!640370 (Intermediate!11896 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462206 (= lt!640370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640371 mask!2687) lt!640371 lt!640373 mask!2687))))

(assert (=> b!1462206 (= lt!640371 (select (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125264 res!991675) b!1462189))

(assert (= (and b!1462189 res!991669) b!1462191))

(assert (= (and b!1462191 res!991670) b!1462187))

(assert (= (and b!1462187 res!991674) b!1462194))

(assert (= (and b!1462194 res!991666) b!1462200))

(assert (= (and b!1462200 res!991673) b!1462188))

(assert (= (and b!1462188 res!991672) b!1462198))

(assert (= (and b!1462198 res!991665) b!1462185))

(assert (= (and b!1462185 res!991681) b!1462192))

(assert (= (and b!1462192 res!991671) b!1462206))

(assert (= (and b!1462206 res!991678) b!1462195))

(assert (= (and b!1462195 c!134771) b!1462197))

(assert (= (and b!1462195 (not c!134771)) b!1462196))

(assert (= (and b!1462195 res!991680) b!1462205))

(assert (= (and b!1462205 res!991667) b!1462202))

(assert (= (and b!1462202 res!991668) b!1462186))

(assert (= (and b!1462186 res!991676) b!1462193))

(assert (= (and b!1462202 (not res!991679)) b!1462201))

(assert (= (and b!1462201 (not res!991664)) b!1462204))

(assert (= (and b!1462204 (not res!991677)) b!1462199))

(assert (= (and b!1462199 c!134772) b!1462203))

(assert (= (and b!1462199 (not c!134772)) b!1462190))

(declare-fun m!1349673 () Bool)

(assert (=> b!1462193 m!1349673))

(declare-fun m!1349675 () Bool)

(assert (=> b!1462193 m!1349675))

(assert (=> b!1462192 m!1349675))

(assert (=> b!1462192 m!1349675))

(declare-fun m!1349677 () Bool)

(assert (=> b!1462192 m!1349677))

(declare-fun m!1349679 () Bool)

(assert (=> b!1462191 m!1349679))

(assert (=> b!1462191 m!1349679))

(declare-fun m!1349681 () Bool)

(assert (=> b!1462191 m!1349681))

(declare-fun m!1349683 () Bool)

(assert (=> b!1462202 m!1349683))

(declare-fun m!1349685 () Bool)

(assert (=> b!1462202 m!1349685))

(declare-fun m!1349687 () Bool)

(assert (=> b!1462202 m!1349687))

(declare-fun m!1349689 () Bool)

(assert (=> b!1462202 m!1349689))

(declare-fun m!1349691 () Bool)

(assert (=> b!1462202 m!1349691))

(assert (=> b!1462202 m!1349675))

(declare-fun m!1349693 () Bool)

(assert (=> b!1462197 m!1349693))

(declare-fun m!1349695 () Bool)

(assert (=> b!1462200 m!1349695))

(declare-fun m!1349697 () Bool)

(assert (=> b!1462196 m!1349697))

(declare-fun m!1349699 () Bool)

(assert (=> b!1462196 m!1349699))

(declare-fun m!1349701 () Bool)

(assert (=> b!1462194 m!1349701))

(declare-fun m!1349703 () Bool)

(assert (=> start!125264 m!1349703))

(declare-fun m!1349705 () Bool)

(assert (=> start!125264 m!1349705))

(declare-fun m!1349707 () Bool)

(assert (=> b!1462206 m!1349707))

(assert (=> b!1462206 m!1349707))

(declare-fun m!1349709 () Bool)

(assert (=> b!1462206 m!1349709))

(assert (=> b!1462206 m!1349685))

(declare-fun m!1349711 () Bool)

(assert (=> b!1462206 m!1349711))

(assert (=> b!1462185 m!1349675))

(assert (=> b!1462185 m!1349675))

(declare-fun m!1349713 () Bool)

(assert (=> b!1462185 m!1349713))

(assert (=> b!1462185 m!1349713))

(assert (=> b!1462185 m!1349675))

(declare-fun m!1349715 () Bool)

(assert (=> b!1462185 m!1349715))

(assert (=> b!1462198 m!1349685))

(declare-fun m!1349717 () Bool)

(assert (=> b!1462198 m!1349717))

(assert (=> b!1462204 m!1349675))

(assert (=> b!1462204 m!1349675))

(declare-fun m!1349719 () Bool)

(assert (=> b!1462204 m!1349719))

(assert (=> b!1462186 m!1349675))

(assert (=> b!1462186 m!1349675))

(declare-fun m!1349721 () Bool)

(assert (=> b!1462186 m!1349721))

(declare-fun m!1349723 () Bool)

(assert (=> b!1462203 m!1349723))

(assert (=> b!1462187 m!1349675))

(assert (=> b!1462187 m!1349675))

(declare-fun m!1349725 () Bool)

(assert (=> b!1462187 m!1349725))

(declare-fun m!1349727 () Bool)

(assert (=> b!1462201 m!1349727))

(declare-fun m!1349729 () Bool)

(assert (=> b!1462190 m!1349729))

(assert (=> b!1462190 m!1349699))

(push 1)

(assert (not b!1462185))

(assert (not b!1462191))

(assert (not b!1462204))

(assert (not b!1462196))

(assert (not b!1462186))

(assert (not b!1462201))

(assert (not b!1462187))

(assert (not b!1462197))

(assert (not start!125264))

(assert (not b!1462206))

(assert (not b!1462192))

(assert (not b!1462200))

(assert (not b!1462203))

(assert (not b!1462202))

(assert (not b!1462194))

(assert (not b!1462190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

