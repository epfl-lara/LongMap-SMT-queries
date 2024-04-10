; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125908 () Bool)

(assert start!125908)

(declare-fun b!1474211 () Bool)

(declare-fun e!827179 () Bool)

(declare-fun e!827177 () Bool)

(assert (=> b!1474211 (= e!827179 e!827177)))

(declare-fun res!1001448 () Bool)

(assert (=> b!1474211 (=> (not res!1001448) (not e!827177))))

(declare-datatypes ((array!99185 0))(
  ( (array!99186 (arr!47876 (Array (_ BitVec 32) (_ BitVec 64))) (size!48426 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99185)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12116 0))(
  ( (MissingZero!12116 (index!50856 (_ BitVec 32))) (Found!12116 (index!50857 (_ BitVec 32))) (Intermediate!12116 (undefined!12928 Bool) (index!50858 (_ BitVec 32)) (x!132440 (_ BitVec 32))) (Undefined!12116) (MissingVacant!12116 (index!50859 (_ BitVec 32))) )
))
(declare-fun lt!644186 () SeekEntryResult!12116)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99185 (_ BitVec 32)) SeekEntryResult!12116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474211 (= res!1001448 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47876 a!2862) j!93) mask!2687) (select (arr!47876 a!2862) j!93) a!2862 mask!2687) lt!644186))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474211 (= lt!644186 (Intermediate!12116 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474212 () Bool)

(declare-fun res!1001447 () Bool)

(declare-fun e!827181 () Bool)

(assert (=> b!1474212 (=> (not res!1001447) (not e!827181))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99185 (_ BitVec 32)) SeekEntryResult!12116)

(assert (=> b!1474212 (= res!1001447 (= (seekEntryOrOpen!0 (select (arr!47876 a!2862) j!93) a!2862 mask!2687) (Found!12116 j!93)))))

(declare-fun b!1474213 () Bool)

(declare-fun res!1001443 () Bool)

(assert (=> b!1474213 (=> (not res!1001443) (not e!827177))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1474213 (= res!1001443 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47876 a!2862) j!93) a!2862 mask!2687) lt!644186))))

(declare-fun b!1474214 () Bool)

(declare-fun res!1001442 () Bool)

(declare-fun e!827178 () Bool)

(assert (=> b!1474214 (=> (not res!1001442) (not e!827178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474214 (= res!1001442 (validKeyInArray!0 (select (arr!47876 a!2862) j!93)))))

(declare-fun res!1001446 () Bool)

(assert (=> start!125908 (=> (not res!1001446) (not e!827178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125908 (= res!1001446 (validMask!0 mask!2687))))

(assert (=> start!125908 e!827178))

(assert (=> start!125908 true))

(declare-fun array_inv!36904 (array!99185) Bool)

(assert (=> start!125908 (array_inv!36904 a!2862)))

(declare-fun lt!644187 () array!99185)

(declare-fun b!1474215 () Bool)

(declare-fun lt!644185 () SeekEntryResult!12116)

(declare-fun e!827182 () Bool)

(declare-fun lt!644184 () (_ BitVec 64))

(assert (=> b!1474215 (= e!827182 (= lt!644185 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644184 lt!644187 mask!2687)))))

(declare-fun b!1474216 () Bool)

(declare-fun e!827183 () Bool)

(assert (=> b!1474216 (= e!827183 (not true))))

(assert (=> b!1474216 e!827181))

(declare-fun res!1001445 () Bool)

(assert (=> b!1474216 (=> (not res!1001445) (not e!827181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99185 (_ BitVec 32)) Bool)

(assert (=> b!1474216 (= res!1001445 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49572 0))(
  ( (Unit!49573) )
))
(declare-fun lt!644183 () Unit!49572)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49572)

(assert (=> b!1474216 (= lt!644183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474217 () Bool)

(declare-fun res!1001451 () Bool)

(assert (=> b!1474217 (=> (not res!1001451) (not e!827178))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474217 (= res!1001451 (validKeyInArray!0 (select (arr!47876 a!2862) i!1006)))))

(declare-fun b!1474218 () Bool)

(assert (=> b!1474218 (= e!827177 e!827183)))

(declare-fun res!1001455 () Bool)

(assert (=> b!1474218 (=> (not res!1001455) (not e!827183))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474218 (= res!1001455 (= lt!644185 (Intermediate!12116 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1474218 (= lt!644185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644184 mask!2687) lt!644184 lt!644187 mask!2687))))

(assert (=> b!1474218 (= lt!644184 (select (store (arr!47876 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474219 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99185 (_ BitVec 32)) SeekEntryResult!12116)

(assert (=> b!1474219 (= e!827182 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644184 lt!644187 mask!2687) (seekEntryOrOpen!0 lt!644184 lt!644187 mask!2687)))))

(declare-fun b!1474220 () Bool)

(assert (=> b!1474220 (= e!827178 e!827179)))

(declare-fun res!1001452 () Bool)

(assert (=> b!1474220 (=> (not res!1001452) (not e!827179))))

(assert (=> b!1474220 (= res!1001452 (= (select (store (arr!47876 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474220 (= lt!644187 (array!99186 (store (arr!47876 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48426 a!2862)))))

(declare-fun b!1474221 () Bool)

(declare-fun res!1001453 () Bool)

(assert (=> b!1474221 (=> (not res!1001453) (not e!827178))))

(assert (=> b!1474221 (= res!1001453 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48426 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48426 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48426 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474222 () Bool)

(declare-fun res!1001450 () Bool)

(assert (=> b!1474222 (=> (not res!1001450) (not e!827183))))

(assert (=> b!1474222 (= res!1001450 e!827182)))

(declare-fun c!135900 () Bool)

(assert (=> b!1474222 (= c!135900 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474223 () Bool)

(assert (=> b!1474223 (= e!827181 (or (= (select (arr!47876 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47876 a!2862) intermediateBeforeIndex!19) (select (arr!47876 a!2862) j!93))))))

(declare-fun b!1474224 () Bool)

(declare-fun res!1001444 () Bool)

(assert (=> b!1474224 (=> (not res!1001444) (not e!827178))))

(assert (=> b!1474224 (= res!1001444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474225 () Bool)

(declare-fun res!1001454 () Bool)

(assert (=> b!1474225 (=> (not res!1001454) (not e!827178))))

(assert (=> b!1474225 (= res!1001454 (and (= (size!48426 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48426 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48426 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474226 () Bool)

(declare-fun res!1001441 () Bool)

(assert (=> b!1474226 (=> (not res!1001441) (not e!827178))))

(declare-datatypes ((List!34377 0))(
  ( (Nil!34374) (Cons!34373 (h!35732 (_ BitVec 64)) (t!49071 List!34377)) )
))
(declare-fun arrayNoDuplicates!0 (array!99185 (_ BitVec 32) List!34377) Bool)

(assert (=> b!1474226 (= res!1001441 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34374))))

(declare-fun b!1474227 () Bool)

(declare-fun res!1001449 () Bool)

(assert (=> b!1474227 (=> (not res!1001449) (not e!827183))))

(assert (=> b!1474227 (= res!1001449 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125908 res!1001446) b!1474225))

(assert (= (and b!1474225 res!1001454) b!1474217))

(assert (= (and b!1474217 res!1001451) b!1474214))

(assert (= (and b!1474214 res!1001442) b!1474224))

(assert (= (and b!1474224 res!1001444) b!1474226))

(assert (= (and b!1474226 res!1001441) b!1474221))

(assert (= (and b!1474221 res!1001453) b!1474220))

(assert (= (and b!1474220 res!1001452) b!1474211))

(assert (= (and b!1474211 res!1001448) b!1474213))

(assert (= (and b!1474213 res!1001443) b!1474218))

(assert (= (and b!1474218 res!1001455) b!1474222))

(assert (= (and b!1474222 c!135900) b!1474215))

(assert (= (and b!1474222 (not c!135900)) b!1474219))

(assert (= (and b!1474222 res!1001450) b!1474227))

(assert (= (and b!1474227 res!1001449) b!1474216))

(assert (= (and b!1474216 res!1001445) b!1474212))

(assert (= (and b!1474212 res!1001447) b!1474223))

(declare-fun m!1360681 () Bool)

(assert (=> b!1474215 m!1360681))

(declare-fun m!1360683 () Bool)

(assert (=> b!1474220 m!1360683))

(declare-fun m!1360685 () Bool)

(assert (=> b!1474220 m!1360685))

(declare-fun m!1360687 () Bool)

(assert (=> b!1474211 m!1360687))

(assert (=> b!1474211 m!1360687))

(declare-fun m!1360689 () Bool)

(assert (=> b!1474211 m!1360689))

(assert (=> b!1474211 m!1360689))

(assert (=> b!1474211 m!1360687))

(declare-fun m!1360691 () Bool)

(assert (=> b!1474211 m!1360691))

(declare-fun m!1360693 () Bool)

(assert (=> b!1474219 m!1360693))

(declare-fun m!1360695 () Bool)

(assert (=> b!1474219 m!1360695))

(declare-fun m!1360697 () Bool)

(assert (=> b!1474216 m!1360697))

(declare-fun m!1360699 () Bool)

(assert (=> b!1474216 m!1360699))

(declare-fun m!1360701 () Bool)

(assert (=> b!1474224 m!1360701))

(assert (=> b!1474212 m!1360687))

(assert (=> b!1474212 m!1360687))

(declare-fun m!1360703 () Bool)

(assert (=> b!1474212 m!1360703))

(declare-fun m!1360705 () Bool)

(assert (=> b!1474218 m!1360705))

(assert (=> b!1474218 m!1360705))

(declare-fun m!1360707 () Bool)

(assert (=> b!1474218 m!1360707))

(assert (=> b!1474218 m!1360683))

(declare-fun m!1360709 () Bool)

(assert (=> b!1474218 m!1360709))

(declare-fun m!1360711 () Bool)

(assert (=> start!125908 m!1360711))

(declare-fun m!1360713 () Bool)

(assert (=> start!125908 m!1360713))

(declare-fun m!1360715 () Bool)

(assert (=> b!1474217 m!1360715))

(assert (=> b!1474217 m!1360715))

(declare-fun m!1360717 () Bool)

(assert (=> b!1474217 m!1360717))

(assert (=> b!1474213 m!1360687))

(assert (=> b!1474213 m!1360687))

(declare-fun m!1360719 () Bool)

(assert (=> b!1474213 m!1360719))

(declare-fun m!1360721 () Bool)

(assert (=> b!1474226 m!1360721))

(declare-fun m!1360723 () Bool)

(assert (=> b!1474223 m!1360723))

(assert (=> b!1474223 m!1360687))

(assert (=> b!1474214 m!1360687))

(assert (=> b!1474214 m!1360687))

(declare-fun m!1360725 () Bool)

(assert (=> b!1474214 m!1360725))

(push 1)

