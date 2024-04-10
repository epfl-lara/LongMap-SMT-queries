; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126560 () Bool)

(assert start!126560)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99522 0))(
  ( (array!99523 (arr!48037 (Array (_ BitVec 32) (_ BitVec 64))) (size!48587 (_ BitVec 32))) )
))
(declare-fun lt!648090 () array!99522)

(declare-fun b!1485430 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!648092 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!832756 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12277 0))(
  ( (MissingZero!12277 (index!51500 (_ BitVec 32))) (Found!12277 (index!51501 (_ BitVec 32))) (Intermediate!12277 (undefined!13089 Bool) (index!51502 (_ BitVec 32)) (x!133073 (_ BitVec 32))) (Undefined!12277) (MissingVacant!12277 (index!51503 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99522 (_ BitVec 32)) SeekEntryResult!12277)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99522 (_ BitVec 32)) SeekEntryResult!12277)

(assert (=> b!1485430 (= e!832756 (= (seekEntryOrOpen!0 lt!648092 lt!648090 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648092 lt!648090 mask!2687)))))

(declare-fun b!1485431 () Bool)

(declare-fun res!1010115 () Bool)

(declare-fun e!832753 () Bool)

(assert (=> b!1485431 (=> (not res!1010115) (not e!832753))))

(declare-fun a!2862 () array!99522)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99522 (_ BitVec 32)) Bool)

(assert (=> b!1485431 (= res!1010115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485432 () Bool)

(declare-fun res!1010121 () Bool)

(declare-fun e!832750 () Bool)

(assert (=> b!1485432 (=> (not res!1010121) (not e!832750))))

(declare-fun lt!648091 () SeekEntryResult!12277)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99522 (_ BitVec 32)) SeekEntryResult!12277)

(assert (=> b!1485432 (= res!1010121 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48037 a!2862) j!93) a!2862 mask!2687) lt!648091))))

(declare-fun b!1485433 () Bool)

(declare-fun res!1010116 () Bool)

(declare-fun e!832757 () Bool)

(assert (=> b!1485433 (=> (not res!1010116) (not e!832757))))

(assert (=> b!1485433 (= res!1010116 (= (seekEntryOrOpen!0 (select (arr!48037 a!2862) j!93) a!2862 mask!2687) (Found!12277 j!93)))))

(declare-fun b!1485434 () Bool)

(declare-fun e!832755 () Bool)

(assert (=> b!1485434 (= e!832753 e!832755)))

(declare-fun res!1010113 () Bool)

(assert (=> b!1485434 (=> (not res!1010113) (not e!832755))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485434 (= res!1010113 (= (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485434 (= lt!648090 (array!99523 (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48587 a!2862)))))

(declare-fun b!1485435 () Bool)

(declare-fun res!1010129 () Bool)

(assert (=> b!1485435 (=> (not res!1010129) (not e!832753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485435 (= res!1010129 (validKeyInArray!0 (select (arr!48037 a!2862) i!1006)))))

(declare-fun b!1485436 () Bool)

(declare-fun e!832754 () Bool)

(declare-fun e!832749 () Bool)

(assert (=> b!1485436 (= e!832754 (not e!832749))))

(declare-fun res!1010130 () Bool)

(assert (=> b!1485436 (=> res!1010130 e!832749)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1485436 (= res!1010130 (or (and (= (select (arr!48037 a!2862) index!646) (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48037 a!2862) index!646) (select (arr!48037 a!2862) j!93))) (= (select (arr!48037 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485436 e!832757))

(declare-fun res!1010127 () Bool)

(assert (=> b!1485436 (=> (not res!1010127) (not e!832757))))

(assert (=> b!1485436 (= res!1010127 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49894 0))(
  ( (Unit!49895) )
))
(declare-fun lt!648096 () Unit!49894)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49894)

(assert (=> b!1485436 (= lt!648096 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1010117 () Bool)

(assert (=> start!126560 (=> (not res!1010117) (not e!832753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126560 (= res!1010117 (validMask!0 mask!2687))))

(assert (=> start!126560 e!832753))

(assert (=> start!126560 true))

(declare-fun array_inv!37065 (array!99522) Bool)

(assert (=> start!126560 (array_inv!37065 a!2862)))

(declare-fun b!1485437 () Bool)

(declare-fun res!1010131 () Bool)

(assert (=> b!1485437 (=> (not res!1010131) (not e!832754))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485437 (= res!1010131 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485438 () Bool)

(declare-fun res!1010126 () Bool)

(assert (=> b!1485438 (=> (not res!1010126) (not e!832753))))

(declare-datatypes ((List!34538 0))(
  ( (Nil!34535) (Cons!34534 (h!35908 (_ BitVec 64)) (t!49232 List!34538)) )
))
(declare-fun arrayNoDuplicates!0 (array!99522 (_ BitVec 32) List!34538) Bool)

(assert (=> b!1485438 (= res!1010126 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34535))))

(declare-fun b!1485439 () Bool)

(declare-fun res!1010118 () Bool)

(assert (=> b!1485439 (=> (not res!1010118) (not e!832753))))

(assert (=> b!1485439 (= res!1010118 (validKeyInArray!0 (select (arr!48037 a!2862) j!93)))))

(declare-fun e!832752 () Bool)

(declare-fun lt!648094 () SeekEntryResult!12277)

(declare-fun b!1485440 () Bool)

(assert (=> b!1485440 (= e!832752 (= lt!648094 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648092 lt!648090 mask!2687)))))

(declare-fun b!1485441 () Bool)

(assert (=> b!1485441 (= e!832752 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648092 lt!648090 mask!2687) (seekEntryOrOpen!0 lt!648092 lt!648090 mask!2687)))))

(declare-fun b!1485442 () Bool)

(declare-fun res!1010119 () Bool)

(assert (=> b!1485442 (=> (not res!1010119) (not e!832757))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1485442 (= res!1010119 (or (= (select (arr!48037 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48037 a!2862) intermediateBeforeIndex!19) (select (arr!48037 a!2862) j!93))))))

(declare-fun b!1485443 () Bool)

(assert (=> b!1485443 (= e!832755 e!832750)))

(declare-fun res!1010114 () Bool)

(assert (=> b!1485443 (=> (not res!1010114) (not e!832750))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485443 (= res!1010114 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48037 a!2862) j!93) mask!2687) (select (arr!48037 a!2862) j!93) a!2862 mask!2687) lt!648091))))

(assert (=> b!1485443 (= lt!648091 (Intermediate!12277 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485444 () Bool)

(declare-fun e!832748 () Bool)

(assert (=> b!1485444 (= e!832757 e!832748)))

(declare-fun res!1010120 () Bool)

(assert (=> b!1485444 (=> res!1010120 e!832748)))

(declare-fun lt!648093 () (_ BitVec 64))

(assert (=> b!1485444 (= res!1010120 (or (and (= (select (arr!48037 a!2862) index!646) lt!648093) (= (select (arr!48037 a!2862) index!646) (select (arr!48037 a!2862) j!93))) (= (select (arr!48037 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485444 (= lt!648093 (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485445 () Bool)

(assert (=> b!1485445 (= e!832750 e!832754)))

(declare-fun res!1010123 () Bool)

(assert (=> b!1485445 (=> (not res!1010123) (not e!832754))))

(assert (=> b!1485445 (= res!1010123 (= lt!648094 (Intermediate!12277 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1485445 (= lt!648094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648092 mask!2687) lt!648092 lt!648090 mask!2687))))

(assert (=> b!1485445 (= lt!648092 (select (store (arr!48037 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485446 () Bool)

(declare-fun res!1010125 () Bool)

(assert (=> b!1485446 (=> (not res!1010125) (not e!832754))))

(assert (=> b!1485446 (= res!1010125 e!832752)))

(declare-fun c!137181 () Bool)

(assert (=> b!1485446 (= c!137181 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485447 () Bool)

(declare-fun res!1010124 () Bool)

(assert (=> b!1485447 (=> (not res!1010124) (not e!832753))))

(assert (=> b!1485447 (= res!1010124 (and (= (size!48587 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48587 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48587 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485448 () Bool)

(declare-fun res!1010122 () Bool)

(assert (=> b!1485448 (=> (not res!1010122) (not e!832753))))

(assert (=> b!1485448 (= res!1010122 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48587 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48587 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48587 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485449 () Bool)

(assert (=> b!1485449 (= e!832748 e!832756)))

(declare-fun res!1010128 () Bool)

(assert (=> b!1485449 (=> (not res!1010128) (not e!832756))))

(assert (=> b!1485449 (= res!1010128 (and (= index!646 intermediateAfterIndex!19) (= lt!648093 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485450 () Bool)

(assert (=> b!1485450 (= e!832749 true)))

(declare-fun lt!648095 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485450 (= lt!648095 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (= (and start!126560 res!1010117) b!1485447))

(assert (= (and b!1485447 res!1010124) b!1485435))

(assert (= (and b!1485435 res!1010129) b!1485439))

(assert (= (and b!1485439 res!1010118) b!1485431))

(assert (= (and b!1485431 res!1010115) b!1485438))

(assert (= (and b!1485438 res!1010126) b!1485448))

(assert (= (and b!1485448 res!1010122) b!1485434))

(assert (= (and b!1485434 res!1010113) b!1485443))

(assert (= (and b!1485443 res!1010114) b!1485432))

(assert (= (and b!1485432 res!1010121) b!1485445))

(assert (= (and b!1485445 res!1010123) b!1485446))

(assert (= (and b!1485446 c!137181) b!1485440))

(assert (= (and b!1485446 (not c!137181)) b!1485441))

(assert (= (and b!1485446 res!1010125) b!1485437))

(assert (= (and b!1485437 res!1010131) b!1485436))

(assert (= (and b!1485436 res!1010127) b!1485433))

(assert (= (and b!1485433 res!1010116) b!1485442))

(assert (= (and b!1485442 res!1010119) b!1485444))

(assert (= (and b!1485444 (not res!1010120)) b!1485449))

(assert (= (and b!1485449 res!1010128) b!1485430))

(assert (= (and b!1485436 (not res!1010130)) b!1485450))

(declare-fun m!1370565 () Bool)

(assert (=> b!1485433 m!1370565))

(assert (=> b!1485433 m!1370565))

(declare-fun m!1370567 () Bool)

(assert (=> b!1485433 m!1370567))

(declare-fun m!1370569 () Bool)

(assert (=> b!1485434 m!1370569))

(declare-fun m!1370571 () Bool)

(assert (=> b!1485434 m!1370571))

(declare-fun m!1370573 () Bool)

(assert (=> b!1485444 m!1370573))

(assert (=> b!1485444 m!1370565))

(assert (=> b!1485444 m!1370569))

(declare-fun m!1370575 () Bool)

(assert (=> b!1485444 m!1370575))

(declare-fun m!1370577 () Bool)

(assert (=> b!1485440 m!1370577))

(declare-fun m!1370579 () Bool)

(assert (=> b!1485442 m!1370579))

(assert (=> b!1485442 m!1370565))

(assert (=> b!1485439 m!1370565))

(assert (=> b!1485439 m!1370565))

(declare-fun m!1370581 () Bool)

(assert (=> b!1485439 m!1370581))

(declare-fun m!1370583 () Bool)

(assert (=> b!1485450 m!1370583))

(declare-fun m!1370585 () Bool)

(assert (=> b!1485441 m!1370585))

(declare-fun m!1370587 () Bool)

(assert (=> b!1485441 m!1370587))

(declare-fun m!1370589 () Bool)

(assert (=> start!126560 m!1370589))

(declare-fun m!1370591 () Bool)

(assert (=> start!126560 m!1370591))

(declare-fun m!1370593 () Bool)

(assert (=> b!1485436 m!1370593))

(assert (=> b!1485436 m!1370569))

(assert (=> b!1485436 m!1370575))

(assert (=> b!1485436 m!1370573))

(declare-fun m!1370595 () Bool)

(assert (=> b!1485436 m!1370595))

(assert (=> b!1485436 m!1370565))

(assert (=> b!1485432 m!1370565))

(assert (=> b!1485432 m!1370565))

(declare-fun m!1370597 () Bool)

(assert (=> b!1485432 m!1370597))

(declare-fun m!1370599 () Bool)

(assert (=> b!1485445 m!1370599))

(assert (=> b!1485445 m!1370599))

(declare-fun m!1370601 () Bool)

(assert (=> b!1485445 m!1370601))

(assert (=> b!1485445 m!1370569))

(declare-fun m!1370603 () Bool)

(assert (=> b!1485445 m!1370603))

(assert (=> b!1485430 m!1370587))

(assert (=> b!1485430 m!1370585))

(declare-fun m!1370605 () Bool)

(assert (=> b!1485435 m!1370605))

(assert (=> b!1485435 m!1370605))

(declare-fun m!1370607 () Bool)

(assert (=> b!1485435 m!1370607))

(declare-fun m!1370609 () Bool)

(assert (=> b!1485438 m!1370609))

(assert (=> b!1485443 m!1370565))

(assert (=> b!1485443 m!1370565))

(declare-fun m!1370611 () Bool)

(assert (=> b!1485443 m!1370611))

(assert (=> b!1485443 m!1370611))

(assert (=> b!1485443 m!1370565))

(declare-fun m!1370613 () Bool)

(assert (=> b!1485443 m!1370613))

(declare-fun m!1370615 () Bool)

(assert (=> b!1485431 m!1370615))

(push 1)

