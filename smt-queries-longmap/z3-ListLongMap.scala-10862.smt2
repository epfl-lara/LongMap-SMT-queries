; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127346 () Bool)

(assert start!127346)

(declare-fun b!1496534 () Bool)

(declare-fun res!1017873 () Bool)

(declare-fun e!838189 () Bool)

(assert (=> b!1496534 (=> (not res!1017873) (not e!838189))))

(declare-datatypes ((array!99808 0))(
  ( (array!99809 (arr!48168 (Array (_ BitVec 32) (_ BitVec 64))) (size!48718 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99808)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496534 (= res!1017873 (validKeyInArray!0 (select (arr!48168 a!2862) i!1006)))))

(declare-fun lt!652125 () array!99808)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1496535 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12408 0))(
  ( (MissingZero!12408 (index!52024 (_ BitVec 32))) (Found!12408 (index!52025 (_ BitVec 32))) (Intermediate!12408 (undefined!13220 Bool) (index!52026 (_ BitVec 32)) (x!133650 (_ BitVec 32))) (Undefined!12408) (MissingVacant!12408 (index!52027 (_ BitVec 32))) )
))
(declare-fun lt!652126 () SeekEntryResult!12408)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!838195 () Bool)

(declare-fun lt!652124 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99808 (_ BitVec 32)) SeekEntryResult!12408)

(assert (=> b!1496535 (= e!838195 (= lt!652126 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652124 lt!652125 mask!2687)))))

(declare-fun b!1496536 () Bool)

(declare-fun e!838191 () Bool)

(declare-fun e!838197 () Bool)

(assert (=> b!1496536 (= e!838191 e!838197)))

(declare-fun res!1017868 () Bool)

(assert (=> b!1496536 (=> (not res!1017868) (not e!838197))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1496536 (= res!1017868 (= lt!652126 (Intermediate!12408 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496536 (= lt!652126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652124 mask!2687) lt!652124 lt!652125 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1496536 (= lt!652124 (select (store (arr!48168 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496537 () Bool)

(declare-fun res!1017865 () Bool)

(assert (=> b!1496537 (=> (not res!1017865) (not e!838191))))

(declare-fun lt!652123 () SeekEntryResult!12408)

(assert (=> b!1496537 (= res!1017865 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48168 a!2862) j!93) a!2862 mask!2687) lt!652123))))

(declare-fun b!1496538 () Bool)

(declare-fun res!1017863 () Bool)

(assert (=> b!1496538 (=> (not res!1017863) (not e!838189))))

(assert (=> b!1496538 (= res!1017863 (and (= (size!48718 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48718 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48718 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496539 () Bool)

(declare-fun res!1017872 () Bool)

(assert (=> b!1496539 (=> (not res!1017872) (not e!838189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99808 (_ BitVec 32)) Bool)

(assert (=> b!1496539 (= res!1017872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496540 () Bool)

(declare-fun e!838190 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496540 (= e!838190 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!665)) (bvsub #b01111111111111111111111111111110 x!665))))))

(declare-fun b!1496541 () Bool)

(declare-fun e!838192 () Bool)

(assert (=> b!1496541 (= e!838189 e!838192)))

(declare-fun res!1017860 () Bool)

(assert (=> b!1496541 (=> (not res!1017860) (not e!838192))))

(assert (=> b!1496541 (= res!1017860 (= (select (store (arr!48168 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496541 (= lt!652125 (array!99809 (store (arr!48168 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48718 a!2862)))))

(declare-fun res!1017867 () Bool)

(assert (=> start!127346 (=> (not res!1017867) (not e!838189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127346 (= res!1017867 (validMask!0 mask!2687))))

(assert (=> start!127346 e!838189))

(assert (=> start!127346 true))

(declare-fun array_inv!37196 (array!99808) Bool)

(assert (=> start!127346 (array_inv!37196 a!2862)))

(declare-fun b!1496533 () Bool)

(declare-fun e!838194 () Bool)

(assert (=> b!1496533 (= e!838197 (not e!838194))))

(declare-fun res!1017859 () Bool)

(assert (=> b!1496533 (=> res!1017859 e!838194)))

(assert (=> b!1496533 (= res!1017859 (or (and (= (select (arr!48168 a!2862) index!646) (select (store (arr!48168 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48168 a!2862) index!646) (select (arr!48168 a!2862) j!93))) (= (select (arr!48168 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!838193 () Bool)

(assert (=> b!1496533 e!838193))

(declare-fun res!1017866 () Bool)

(assert (=> b!1496533 (=> (not res!1017866) (not e!838193))))

(assert (=> b!1496533 (= res!1017866 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50156 0))(
  ( (Unit!50157) )
))
(declare-fun lt!652121 () Unit!50156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50156)

(assert (=> b!1496533 (= lt!652121 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496542 () Bool)

(declare-fun res!1017874 () Bool)

(assert (=> b!1496542 (=> res!1017874 e!838190)))

(declare-fun e!838196 () Bool)

(assert (=> b!1496542 (= res!1017874 e!838196)))

(declare-fun c!138871 () Bool)

(assert (=> b!1496542 (= c!138871 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496543 () Bool)

(declare-fun res!1017862 () Bool)

(assert (=> b!1496543 (=> (not res!1017862) (not e!838193))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99808 (_ BitVec 32)) SeekEntryResult!12408)

(assert (=> b!1496543 (= res!1017862 (= (seekEntryOrOpen!0 (select (arr!48168 a!2862) j!93) a!2862 mask!2687) (Found!12408 j!93)))))

(declare-fun b!1496544 () Bool)

(assert (=> b!1496544 (= e!838192 e!838191)))

(declare-fun res!1017875 () Bool)

(assert (=> b!1496544 (=> (not res!1017875) (not e!838191))))

(assert (=> b!1496544 (= res!1017875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48168 a!2862) j!93) mask!2687) (select (arr!48168 a!2862) j!93) a!2862 mask!2687) lt!652123))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1496544 (= lt!652123 (Intermediate!12408 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496545 () Bool)

(declare-fun res!1017861 () Bool)

(assert (=> b!1496545 (=> res!1017861 e!838190)))

(declare-fun lt!652122 () (_ BitVec 32))

(assert (=> b!1496545 (= res!1017861 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652122 (select (arr!48168 a!2862) j!93) a!2862 mask!2687) lt!652123)))))

(declare-fun b!1496546 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99808 (_ BitVec 32)) SeekEntryResult!12408)

(assert (=> b!1496546 (= e!838195 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652124 lt!652125 mask!2687) (seekEntryOrOpen!0 lt!652124 lt!652125 mask!2687)))))

(declare-fun b!1496547 () Bool)

(declare-fun res!1017869 () Bool)

(assert (=> b!1496547 (=> (not res!1017869) (not e!838197))))

(assert (=> b!1496547 (= res!1017869 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496548 () Bool)

(declare-fun res!1017876 () Bool)

(assert (=> b!1496548 (=> (not res!1017876) (not e!838189))))

(assert (=> b!1496548 (= res!1017876 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48718 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48718 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48718 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496549 () Bool)

(assert (=> b!1496549 (= e!838196 (not (= lt!652126 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652122 lt!652124 lt!652125 mask!2687))))))

(declare-fun b!1496550 () Bool)

(assert (=> b!1496550 (= e!838193 (or (= (select (arr!48168 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48168 a!2862) intermediateBeforeIndex!19) (select (arr!48168 a!2862) j!93))))))

(declare-fun b!1496551 () Bool)

(declare-fun res!1017864 () Bool)

(assert (=> b!1496551 (=> (not res!1017864) (not e!838189))))

(assert (=> b!1496551 (= res!1017864 (validKeyInArray!0 (select (arr!48168 a!2862) j!93)))))

(declare-fun b!1496552 () Bool)

(declare-fun res!1017870 () Bool)

(assert (=> b!1496552 (=> (not res!1017870) (not e!838189))))

(declare-datatypes ((List!34669 0))(
  ( (Nil!34666) (Cons!34665 (h!36062 (_ BitVec 64)) (t!49363 List!34669)) )
))
(declare-fun arrayNoDuplicates!0 (array!99808 (_ BitVec 32) List!34669) Bool)

(assert (=> b!1496552 (= res!1017870 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34666))))

(declare-fun b!1496553 () Bool)

(assert (=> b!1496553 (= e!838194 e!838190)))

(declare-fun res!1017877 () Bool)

(assert (=> b!1496553 (=> res!1017877 e!838190)))

(assert (=> b!1496553 (= res!1017877 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652122 #b00000000000000000000000000000000) (bvsge lt!652122 (size!48718 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496553 (= lt!652122 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496554 () Bool)

(declare-fun res!1017871 () Bool)

(assert (=> b!1496554 (=> (not res!1017871) (not e!838197))))

(assert (=> b!1496554 (= res!1017871 e!838195)))

(declare-fun c!138872 () Bool)

(assert (=> b!1496554 (= c!138872 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496555 () Bool)

(assert (=> b!1496555 (= e!838196 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652122 intermediateAfterIndex!19 lt!652124 lt!652125 mask!2687) (seekEntryOrOpen!0 lt!652124 lt!652125 mask!2687))))))

(assert (= (and start!127346 res!1017867) b!1496538))

(assert (= (and b!1496538 res!1017863) b!1496534))

(assert (= (and b!1496534 res!1017873) b!1496551))

(assert (= (and b!1496551 res!1017864) b!1496539))

(assert (= (and b!1496539 res!1017872) b!1496552))

(assert (= (and b!1496552 res!1017870) b!1496548))

(assert (= (and b!1496548 res!1017876) b!1496541))

(assert (= (and b!1496541 res!1017860) b!1496544))

(assert (= (and b!1496544 res!1017875) b!1496537))

(assert (= (and b!1496537 res!1017865) b!1496536))

(assert (= (and b!1496536 res!1017868) b!1496554))

(assert (= (and b!1496554 c!138872) b!1496535))

(assert (= (and b!1496554 (not c!138872)) b!1496546))

(assert (= (and b!1496554 res!1017871) b!1496547))

(assert (= (and b!1496547 res!1017869) b!1496533))

(assert (= (and b!1496533 res!1017866) b!1496543))

(assert (= (and b!1496543 res!1017862) b!1496550))

(assert (= (and b!1496533 (not res!1017859)) b!1496553))

(assert (= (and b!1496553 (not res!1017877)) b!1496545))

(assert (= (and b!1496545 (not res!1017861)) b!1496542))

(assert (= (and b!1496542 c!138871) b!1496549))

(assert (= (and b!1496542 (not c!138871)) b!1496555))

(assert (= (and b!1496542 (not res!1017874)) b!1496540))

(declare-fun m!1379699 () Bool)

(assert (=> b!1496545 m!1379699))

(assert (=> b!1496545 m!1379699))

(declare-fun m!1379701 () Bool)

(assert (=> b!1496545 m!1379701))

(declare-fun m!1379703 () Bool)

(assert (=> b!1496539 m!1379703))

(declare-fun m!1379705 () Bool)

(assert (=> start!127346 m!1379705))

(declare-fun m!1379707 () Bool)

(assert (=> start!127346 m!1379707))

(assert (=> b!1496544 m!1379699))

(assert (=> b!1496544 m!1379699))

(declare-fun m!1379709 () Bool)

(assert (=> b!1496544 m!1379709))

(assert (=> b!1496544 m!1379709))

(assert (=> b!1496544 m!1379699))

(declare-fun m!1379711 () Bool)

(assert (=> b!1496544 m!1379711))

(declare-fun m!1379713 () Bool)

(assert (=> b!1496555 m!1379713))

(declare-fun m!1379715 () Bool)

(assert (=> b!1496555 m!1379715))

(declare-fun m!1379717 () Bool)

(assert (=> b!1496550 m!1379717))

(assert (=> b!1496550 m!1379699))

(declare-fun m!1379719 () Bool)

(assert (=> b!1496535 m!1379719))

(declare-fun m!1379721 () Bool)

(assert (=> b!1496534 m!1379721))

(assert (=> b!1496534 m!1379721))

(declare-fun m!1379723 () Bool)

(assert (=> b!1496534 m!1379723))

(declare-fun m!1379725 () Bool)

(assert (=> b!1496541 m!1379725))

(declare-fun m!1379727 () Bool)

(assert (=> b!1496541 m!1379727))

(declare-fun m!1379729 () Bool)

(assert (=> b!1496549 m!1379729))

(declare-fun m!1379731 () Bool)

(assert (=> b!1496533 m!1379731))

(assert (=> b!1496533 m!1379725))

(declare-fun m!1379733 () Bool)

(assert (=> b!1496533 m!1379733))

(declare-fun m!1379735 () Bool)

(assert (=> b!1496533 m!1379735))

(declare-fun m!1379737 () Bool)

(assert (=> b!1496533 m!1379737))

(assert (=> b!1496533 m!1379699))

(assert (=> b!1496551 m!1379699))

(assert (=> b!1496551 m!1379699))

(declare-fun m!1379739 () Bool)

(assert (=> b!1496551 m!1379739))

(declare-fun m!1379741 () Bool)

(assert (=> b!1496536 m!1379741))

(assert (=> b!1496536 m!1379741))

(declare-fun m!1379743 () Bool)

(assert (=> b!1496536 m!1379743))

(assert (=> b!1496536 m!1379725))

(declare-fun m!1379745 () Bool)

(assert (=> b!1496536 m!1379745))

(declare-fun m!1379747 () Bool)

(assert (=> b!1496552 m!1379747))

(assert (=> b!1496543 m!1379699))

(assert (=> b!1496543 m!1379699))

(declare-fun m!1379749 () Bool)

(assert (=> b!1496543 m!1379749))

(declare-fun m!1379751 () Bool)

(assert (=> b!1496546 m!1379751))

(assert (=> b!1496546 m!1379715))

(assert (=> b!1496537 m!1379699))

(assert (=> b!1496537 m!1379699))

(declare-fun m!1379753 () Bool)

(assert (=> b!1496537 m!1379753))

(declare-fun m!1379755 () Bool)

(assert (=> b!1496553 m!1379755))

(check-sat (not b!1496539) (not b!1496546) (not start!127346) (not b!1496545) (not b!1496551) (not b!1496537) (not b!1496535) (not b!1496544) (not b!1496549) (not b!1496552) (not b!1496533) (not b!1496555) (not b!1496534) (not b!1496553) (not b!1496543) (not b!1496536))
(check-sat)
