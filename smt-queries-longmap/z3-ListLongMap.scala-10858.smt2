; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127470 () Bool)

(assert start!127470)

(declare-fun b!1496539 () Bool)

(declare-fun res!1017530 () Bool)

(declare-fun e!838379 () Bool)

(assert (=> b!1496539 (=> (not res!1017530) (not e!838379))))

(declare-datatypes ((array!99892 0))(
  ( (array!99893 (arr!48208 (Array (_ BitVec 32) (_ BitVec 64))) (size!48759 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99892)

(declare-datatypes ((List!34696 0))(
  ( (Nil!34693) (Cons!34692 (h!36098 (_ BitVec 64)) (t!49382 List!34696)) )
))
(declare-fun arrayNoDuplicates!0 (array!99892 (_ BitVec 32) List!34696) Bool)

(assert (=> b!1496539 (= res!1017530 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34693))))

(declare-fun b!1496540 () Bool)

(declare-fun res!1017529 () Bool)

(assert (=> b!1496540 (=> (not res!1017529) (not e!838379))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496540 (= res!1017529 (validKeyInArray!0 (select (arr!48208 a!2862) i!1006)))))

(declare-fun b!1496542 () Bool)

(declare-fun res!1017540 () Bool)

(declare-fun e!838375 () Bool)

(assert (=> b!1496542 (=> (not res!1017540) (not e!838375))))

(declare-fun e!838378 () Bool)

(assert (=> b!1496542 (= res!1017540 e!838378)))

(declare-fun c!139048 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496542 (= c!139048 (bvsle x!665 intermediateAfterX!19))))

(declare-datatypes ((SeekEntryResult!12345 0))(
  ( (MissingZero!12345 (index!51772 (_ BitVec 32))) (Found!12345 (index!51773 (_ BitVec 32))) (Intermediate!12345 (undefined!13157 Bool) (index!51774 (_ BitVec 32)) (x!133566 (_ BitVec 32))) (Undefined!12345) (MissingVacant!12345 (index!51775 (_ BitVec 32))) )
))
(declare-fun lt!652165 () SeekEntryResult!12345)

(declare-fun b!1496543 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!652164 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!652168 () array!99892)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99892 (_ BitVec 32)) SeekEntryResult!12345)

(assert (=> b!1496543 (= e!838378 (= lt!652165 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652164 lt!652168 mask!2687)))))

(declare-fun b!1496544 () Bool)

(declare-fun res!1017527 () Bool)

(assert (=> b!1496544 (=> (not res!1017527) (not e!838379))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1496544 (= res!1017527 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48759 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48759 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48759 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496545 () Bool)

(declare-fun e!838377 () Bool)

(assert (=> b!1496545 (= e!838377 true)))

(declare-fun lt!652167 () SeekEntryResult!12345)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!652162 () (_ BitVec 32))

(assert (=> b!1496545 (= lt!652167 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652162 (select (arr!48208 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1496546 () Bool)

(declare-fun e!838380 () Bool)

(declare-fun e!838376 () Bool)

(assert (=> b!1496546 (= e!838380 e!838376)))

(declare-fun res!1017542 () Bool)

(assert (=> b!1496546 (=> (not res!1017542) (not e!838376))))

(declare-fun lt!652163 () SeekEntryResult!12345)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496546 (= res!1017542 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48208 a!2862) j!93) mask!2687) (select (arr!48208 a!2862) j!93) a!2862 mask!2687) lt!652163))))

(assert (=> b!1496546 (= lt!652163 (Intermediate!12345 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496547 () Bool)

(declare-fun e!838374 () Bool)

(assert (=> b!1496547 (= e!838375 (not e!838374))))

(declare-fun res!1017541 () Bool)

(assert (=> b!1496547 (=> res!1017541 e!838374)))

(assert (=> b!1496547 (= res!1017541 (or (and (= (select (arr!48208 a!2862) index!646) (select (store (arr!48208 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48208 a!2862) index!646) (select (arr!48208 a!2862) j!93))) (= (select (arr!48208 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!838373 () Bool)

(assert (=> b!1496547 e!838373))

(declare-fun res!1017526 () Bool)

(assert (=> b!1496547 (=> (not res!1017526) (not e!838373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99892 (_ BitVec 32)) Bool)

(assert (=> b!1496547 (= res!1017526 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50063 0))(
  ( (Unit!50064) )
))
(declare-fun lt!652166 () Unit!50063)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50063)

(assert (=> b!1496547 (= lt!652166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496548 () Bool)

(assert (=> b!1496548 (= e!838374 e!838377)))

(declare-fun res!1017539 () Bool)

(assert (=> b!1496548 (=> res!1017539 e!838377)))

(assert (=> b!1496548 (= res!1017539 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652162 #b00000000000000000000000000000000) (bvsge lt!652162 (size!48759 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496548 (= lt!652162 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1496549 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99892 (_ BitVec 32)) SeekEntryResult!12345)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99892 (_ BitVec 32)) SeekEntryResult!12345)

(assert (=> b!1496549 (= e!838378 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652164 lt!652168 mask!2687) (seekEntryOrOpen!0 lt!652164 lt!652168 mask!2687)))))

(declare-fun b!1496550 () Bool)

(declare-fun res!1017532 () Bool)

(assert (=> b!1496550 (=> (not res!1017532) (not e!838379))))

(assert (=> b!1496550 (= res!1017532 (validKeyInArray!0 (select (arr!48208 a!2862) j!93)))))

(declare-fun b!1496551 () Bool)

(declare-fun res!1017534 () Bool)

(assert (=> b!1496551 (=> (not res!1017534) (not e!838376))))

(assert (=> b!1496551 (= res!1017534 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48208 a!2862) j!93) a!2862 mask!2687) lt!652163))))

(declare-fun res!1017528 () Bool)

(assert (=> start!127470 (=> (not res!1017528) (not e!838379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127470 (= res!1017528 (validMask!0 mask!2687))))

(assert (=> start!127470 e!838379))

(assert (=> start!127470 true))

(declare-fun array_inv!37489 (array!99892) Bool)

(assert (=> start!127470 (array_inv!37489 a!2862)))

(declare-fun b!1496541 () Bool)

(assert (=> b!1496541 (= e!838379 e!838380)))

(declare-fun res!1017535 () Bool)

(assert (=> b!1496541 (=> (not res!1017535) (not e!838380))))

(assert (=> b!1496541 (= res!1017535 (= (select (store (arr!48208 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496541 (= lt!652168 (array!99893 (store (arr!48208 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48759 a!2862)))))

(declare-fun b!1496552 () Bool)

(declare-fun res!1017537 () Bool)

(assert (=> b!1496552 (=> (not res!1017537) (not e!838379))))

(assert (=> b!1496552 (= res!1017537 (and (= (size!48759 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48759 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48759 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496553 () Bool)

(declare-fun res!1017533 () Bool)

(assert (=> b!1496553 (=> (not res!1017533) (not e!838375))))

(assert (=> b!1496553 (= res!1017533 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496554 () Bool)

(declare-fun res!1017531 () Bool)

(assert (=> b!1496554 (=> (not res!1017531) (not e!838379))))

(assert (=> b!1496554 (= res!1017531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496555 () Bool)

(declare-fun res!1017536 () Bool)

(assert (=> b!1496555 (=> (not res!1017536) (not e!838373))))

(assert (=> b!1496555 (= res!1017536 (= (seekEntryOrOpen!0 (select (arr!48208 a!2862) j!93) a!2862 mask!2687) (Found!12345 j!93)))))

(declare-fun b!1496556 () Bool)

(assert (=> b!1496556 (= e!838373 (or (= (select (arr!48208 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48208 a!2862) intermediateBeforeIndex!19) (select (arr!48208 a!2862) j!93))))))

(declare-fun b!1496557 () Bool)

(assert (=> b!1496557 (= e!838376 e!838375)))

(declare-fun res!1017538 () Bool)

(assert (=> b!1496557 (=> (not res!1017538) (not e!838375))))

(assert (=> b!1496557 (= res!1017538 (= lt!652165 (Intermediate!12345 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1496557 (= lt!652165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652164 mask!2687) lt!652164 lt!652168 mask!2687))))

(assert (=> b!1496557 (= lt!652164 (select (store (arr!48208 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!127470 res!1017528) b!1496552))

(assert (= (and b!1496552 res!1017537) b!1496540))

(assert (= (and b!1496540 res!1017529) b!1496550))

(assert (= (and b!1496550 res!1017532) b!1496554))

(assert (= (and b!1496554 res!1017531) b!1496539))

(assert (= (and b!1496539 res!1017530) b!1496544))

(assert (= (and b!1496544 res!1017527) b!1496541))

(assert (= (and b!1496541 res!1017535) b!1496546))

(assert (= (and b!1496546 res!1017542) b!1496551))

(assert (= (and b!1496551 res!1017534) b!1496557))

(assert (= (and b!1496557 res!1017538) b!1496542))

(assert (= (and b!1496542 c!139048) b!1496543))

(assert (= (and b!1496542 (not c!139048)) b!1496549))

(assert (= (and b!1496542 res!1017540) b!1496553))

(assert (= (and b!1496553 res!1017533) b!1496547))

(assert (= (and b!1496547 res!1017526) b!1496555))

(assert (= (and b!1496555 res!1017536) b!1496556))

(assert (= (and b!1496547 (not res!1017541)) b!1496548))

(assert (= (and b!1496548 (not res!1017539)) b!1496545))

(declare-fun m!1380145 () Bool)

(assert (=> b!1496547 m!1380145))

(declare-fun m!1380147 () Bool)

(assert (=> b!1496547 m!1380147))

(declare-fun m!1380149 () Bool)

(assert (=> b!1496547 m!1380149))

(declare-fun m!1380151 () Bool)

(assert (=> b!1496547 m!1380151))

(declare-fun m!1380153 () Bool)

(assert (=> b!1496547 m!1380153))

(declare-fun m!1380155 () Bool)

(assert (=> b!1496547 m!1380155))

(assert (=> b!1496541 m!1380147))

(declare-fun m!1380157 () Bool)

(assert (=> b!1496541 m!1380157))

(declare-fun m!1380159 () Bool)

(assert (=> b!1496549 m!1380159))

(declare-fun m!1380161 () Bool)

(assert (=> b!1496549 m!1380161))

(assert (=> b!1496551 m!1380155))

(assert (=> b!1496551 m!1380155))

(declare-fun m!1380163 () Bool)

(assert (=> b!1496551 m!1380163))

(declare-fun m!1380165 () Bool)

(assert (=> start!127470 m!1380165))

(declare-fun m!1380167 () Bool)

(assert (=> start!127470 m!1380167))

(assert (=> b!1496555 m!1380155))

(assert (=> b!1496555 m!1380155))

(declare-fun m!1380169 () Bool)

(assert (=> b!1496555 m!1380169))

(declare-fun m!1380171 () Bool)

(assert (=> b!1496556 m!1380171))

(assert (=> b!1496556 m!1380155))

(declare-fun m!1380173 () Bool)

(assert (=> b!1496539 m!1380173))

(declare-fun m!1380175 () Bool)

(assert (=> b!1496548 m!1380175))

(assert (=> b!1496546 m!1380155))

(assert (=> b!1496546 m!1380155))

(declare-fun m!1380177 () Bool)

(assert (=> b!1496546 m!1380177))

(assert (=> b!1496546 m!1380177))

(assert (=> b!1496546 m!1380155))

(declare-fun m!1380179 () Bool)

(assert (=> b!1496546 m!1380179))

(declare-fun m!1380181 () Bool)

(assert (=> b!1496540 m!1380181))

(assert (=> b!1496540 m!1380181))

(declare-fun m!1380183 () Bool)

(assert (=> b!1496540 m!1380183))

(assert (=> b!1496545 m!1380155))

(assert (=> b!1496545 m!1380155))

(declare-fun m!1380185 () Bool)

(assert (=> b!1496545 m!1380185))

(assert (=> b!1496550 m!1380155))

(assert (=> b!1496550 m!1380155))

(declare-fun m!1380187 () Bool)

(assert (=> b!1496550 m!1380187))

(declare-fun m!1380189 () Bool)

(assert (=> b!1496554 m!1380189))

(declare-fun m!1380191 () Bool)

(assert (=> b!1496543 m!1380191))

(declare-fun m!1380193 () Bool)

(assert (=> b!1496557 m!1380193))

(assert (=> b!1496557 m!1380193))

(declare-fun m!1380195 () Bool)

(assert (=> b!1496557 m!1380195))

(assert (=> b!1496557 m!1380147))

(declare-fun m!1380197 () Bool)

(assert (=> b!1496557 m!1380197))

(check-sat (not b!1496545) (not b!1496547) (not b!1496554) (not b!1496549) (not b!1496551) (not b!1496546) (not b!1496555) (not start!127470) (not b!1496540) (not b!1496557) (not b!1496539) (not b!1496548) (not b!1496543) (not b!1496550))
(check-sat)
