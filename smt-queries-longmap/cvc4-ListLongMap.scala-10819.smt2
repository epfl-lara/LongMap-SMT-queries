; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126566 () Bool)

(assert start!126566)

(declare-fun b!1485619 () Bool)

(declare-fun e!832842 () Bool)

(declare-fun e!832844 () Bool)

(assert (=> b!1485619 (= e!832842 (not e!832844))))

(declare-fun res!1010289 () Bool)

(assert (=> b!1485619 (=> res!1010289 e!832844)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99528 0))(
  ( (array!99529 (arr!48040 (Array (_ BitVec 32) (_ BitVec 64))) (size!48590 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99528)

(assert (=> b!1485619 (= res!1010289 (or (and (= (select (arr!48040 a!2862) index!646) (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48040 a!2862) index!646) (select (arr!48040 a!2862) j!93))) (= (select (arr!48040 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832840 () Bool)

(assert (=> b!1485619 e!832840))

(declare-fun res!1010286 () Bool)

(assert (=> b!1485619 (=> (not res!1010286) (not e!832840))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99528 (_ BitVec 32)) Bool)

(assert (=> b!1485619 (= res!1010286 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49900 0))(
  ( (Unit!49901) )
))
(declare-fun lt!648153 () Unit!49900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49900)

(assert (=> b!1485619 (= lt!648153 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485620 () Bool)

(assert (=> b!1485620 (= e!832844 true)))

(declare-fun lt!648156 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485620 (= lt!648156 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1010296 () Bool)

(declare-fun e!832838 () Bool)

(assert (=> start!126566 (=> (not res!1010296) (not e!832838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126566 (= res!1010296 (validMask!0 mask!2687))))

(assert (=> start!126566 e!832838))

(assert (=> start!126566 true))

(declare-fun array_inv!37068 (array!99528) Bool)

(assert (=> start!126566 (array_inv!37068 a!2862)))

(declare-fun b!1485621 () Bool)

(declare-fun res!1010285 () Bool)

(assert (=> b!1485621 (=> (not res!1010285) (not e!832838))))

(declare-datatypes ((List!34541 0))(
  ( (Nil!34538) (Cons!34537 (h!35911 (_ BitVec 64)) (t!49235 List!34541)) )
))
(declare-fun arrayNoDuplicates!0 (array!99528 (_ BitVec 32) List!34541) Bool)

(assert (=> b!1485621 (= res!1010285 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34538))))

(declare-fun b!1485622 () Bool)

(declare-fun res!1010295 () Bool)

(assert (=> b!1485622 (=> (not res!1010295) (not e!832838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485622 (= res!1010295 (validKeyInArray!0 (select (arr!48040 a!2862) j!93)))))

(declare-fun b!1485623 () Bool)

(declare-fun res!1010299 () Bool)

(assert (=> b!1485623 (=> (not res!1010299) (not e!832842))))

(declare-fun e!832839 () Bool)

(assert (=> b!1485623 (= res!1010299 e!832839)))

(declare-fun c!137190 () Bool)

(assert (=> b!1485623 (= c!137190 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485624 () Bool)

(declare-fun res!1010292 () Bool)

(assert (=> b!1485624 (=> (not res!1010292) (not e!832838))))

(assert (=> b!1485624 (= res!1010292 (validKeyInArray!0 (select (arr!48040 a!2862) i!1006)))))

(declare-fun b!1485625 () Bool)

(declare-fun res!1010290 () Bool)

(declare-fun e!832841 () Bool)

(assert (=> b!1485625 (=> (not res!1010290) (not e!832841))))

(declare-datatypes ((SeekEntryResult!12280 0))(
  ( (MissingZero!12280 (index!51512 (_ BitVec 32))) (Found!12280 (index!51513 (_ BitVec 32))) (Intermediate!12280 (undefined!13092 Bool) (index!51514 (_ BitVec 32)) (x!133084 (_ BitVec 32))) (Undefined!12280) (MissingVacant!12280 (index!51515 (_ BitVec 32))) )
))
(declare-fun lt!648155 () SeekEntryResult!12280)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99528 (_ BitVec 32)) SeekEntryResult!12280)

(assert (=> b!1485625 (= res!1010290 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!648155))))

(declare-fun lt!648159 () (_ BitVec 64))

(declare-fun lt!648158 () SeekEntryResult!12280)

(declare-fun b!1485626 () Bool)

(declare-fun lt!648154 () array!99528)

(assert (=> b!1485626 (= e!832839 (= lt!648158 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648159 lt!648154 mask!2687)))))

(declare-fun b!1485627 () Bool)

(declare-fun res!1010302 () Bool)

(assert (=> b!1485627 (=> (not res!1010302) (not e!832840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99528 (_ BitVec 32)) SeekEntryResult!12280)

(assert (=> b!1485627 (= res!1010302 (= (seekEntryOrOpen!0 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) (Found!12280 j!93)))))

(declare-fun b!1485628 () Bool)

(declare-fun res!1010301 () Bool)

(assert (=> b!1485628 (=> (not res!1010301) (not e!832838))))

(assert (=> b!1485628 (= res!1010301 (and (= (size!48590 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48590 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48590 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485629 () Bool)

(declare-fun e!832846 () Bool)

(assert (=> b!1485629 (= e!832846 e!832841)))

(declare-fun res!1010293 () Bool)

(assert (=> b!1485629 (=> (not res!1010293) (not e!832841))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485629 (= res!1010293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48040 a!2862) j!93) mask!2687) (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!648155))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485629 (= lt!648155 (Intermediate!12280 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485630 () Bool)

(declare-fun e!832845 () Bool)

(assert (=> b!1485630 (= e!832840 e!832845)))

(declare-fun res!1010291 () Bool)

(assert (=> b!1485630 (=> res!1010291 e!832845)))

(declare-fun lt!648157 () (_ BitVec 64))

(assert (=> b!1485630 (= res!1010291 (or (and (= (select (arr!48040 a!2862) index!646) lt!648157) (= (select (arr!48040 a!2862) index!646) (select (arr!48040 a!2862) j!93))) (= (select (arr!48040 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485630 (= lt!648157 (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485631 () Bool)

(declare-fun res!1010298 () Bool)

(assert (=> b!1485631 (=> (not res!1010298) (not e!832842))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485631 (= res!1010298 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485632 () Bool)

(declare-fun res!1010294 () Bool)

(assert (=> b!1485632 (=> (not res!1010294) (not e!832838))))

(assert (=> b!1485632 (= res!1010294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485633 () Bool)

(declare-fun res!1010297 () Bool)

(assert (=> b!1485633 (=> (not res!1010297) (not e!832840))))

(assert (=> b!1485633 (= res!1010297 (or (= (select (arr!48040 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48040 a!2862) intermediateBeforeIndex!19) (select (arr!48040 a!2862) j!93))))))

(declare-fun b!1485634 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99528 (_ BitVec 32)) SeekEntryResult!12280)

(assert (=> b!1485634 (= e!832839 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648159 lt!648154 mask!2687) (seekEntryOrOpen!0 lt!648159 lt!648154 mask!2687)))))

(declare-fun e!832843 () Bool)

(declare-fun b!1485635 () Bool)

(assert (=> b!1485635 (= e!832843 (= (seekEntryOrOpen!0 lt!648159 lt!648154 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648159 lt!648154 mask!2687)))))

(declare-fun b!1485636 () Bool)

(assert (=> b!1485636 (= e!832838 e!832846)))

(declare-fun res!1010300 () Bool)

(assert (=> b!1485636 (=> (not res!1010300) (not e!832846))))

(assert (=> b!1485636 (= res!1010300 (= (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485636 (= lt!648154 (array!99529 (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48590 a!2862)))))

(declare-fun b!1485637 () Bool)

(assert (=> b!1485637 (= e!832845 e!832843)))

(declare-fun res!1010288 () Bool)

(assert (=> b!1485637 (=> (not res!1010288) (not e!832843))))

(assert (=> b!1485637 (= res!1010288 (and (= index!646 intermediateAfterIndex!19) (= lt!648157 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485638 () Bool)

(assert (=> b!1485638 (= e!832841 e!832842)))

(declare-fun res!1010287 () Bool)

(assert (=> b!1485638 (=> (not res!1010287) (not e!832842))))

(assert (=> b!1485638 (= res!1010287 (= lt!648158 (Intermediate!12280 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1485638 (= lt!648158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648159 mask!2687) lt!648159 lt!648154 mask!2687))))

(assert (=> b!1485638 (= lt!648159 (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485639 () Bool)

(declare-fun res!1010284 () Bool)

(assert (=> b!1485639 (=> (not res!1010284) (not e!832838))))

(assert (=> b!1485639 (= res!1010284 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48590 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48590 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48590 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126566 res!1010296) b!1485628))

(assert (= (and b!1485628 res!1010301) b!1485624))

(assert (= (and b!1485624 res!1010292) b!1485622))

(assert (= (and b!1485622 res!1010295) b!1485632))

(assert (= (and b!1485632 res!1010294) b!1485621))

(assert (= (and b!1485621 res!1010285) b!1485639))

(assert (= (and b!1485639 res!1010284) b!1485636))

(assert (= (and b!1485636 res!1010300) b!1485629))

(assert (= (and b!1485629 res!1010293) b!1485625))

(assert (= (and b!1485625 res!1010290) b!1485638))

(assert (= (and b!1485638 res!1010287) b!1485623))

(assert (= (and b!1485623 c!137190) b!1485626))

(assert (= (and b!1485623 (not c!137190)) b!1485634))

(assert (= (and b!1485623 res!1010299) b!1485631))

(assert (= (and b!1485631 res!1010298) b!1485619))

(assert (= (and b!1485619 res!1010286) b!1485627))

(assert (= (and b!1485627 res!1010302) b!1485633))

(assert (= (and b!1485633 res!1010297) b!1485630))

(assert (= (and b!1485630 (not res!1010291)) b!1485637))

(assert (= (and b!1485637 res!1010288) b!1485635))

(assert (= (and b!1485619 (not res!1010289)) b!1485620))

(declare-fun m!1370721 () Bool)

(assert (=> b!1485626 m!1370721))

(declare-fun m!1370723 () Bool)

(assert (=> b!1485629 m!1370723))

(assert (=> b!1485629 m!1370723))

(declare-fun m!1370725 () Bool)

(assert (=> b!1485629 m!1370725))

(assert (=> b!1485629 m!1370725))

(assert (=> b!1485629 m!1370723))

(declare-fun m!1370727 () Bool)

(assert (=> b!1485629 m!1370727))

(declare-fun m!1370729 () Bool)

(assert (=> b!1485635 m!1370729))

(declare-fun m!1370731 () Bool)

(assert (=> b!1485635 m!1370731))

(declare-fun m!1370733 () Bool)

(assert (=> b!1485638 m!1370733))

(assert (=> b!1485638 m!1370733))

(declare-fun m!1370735 () Bool)

(assert (=> b!1485638 m!1370735))

(declare-fun m!1370737 () Bool)

(assert (=> b!1485638 m!1370737))

(declare-fun m!1370739 () Bool)

(assert (=> b!1485638 m!1370739))

(declare-fun m!1370741 () Bool)

(assert (=> b!1485630 m!1370741))

(assert (=> b!1485630 m!1370723))

(assert (=> b!1485630 m!1370737))

(declare-fun m!1370743 () Bool)

(assert (=> b!1485630 m!1370743))

(assert (=> b!1485636 m!1370737))

(declare-fun m!1370745 () Bool)

(assert (=> b!1485636 m!1370745))

(declare-fun m!1370747 () Bool)

(assert (=> b!1485632 m!1370747))

(declare-fun m!1370749 () Bool)

(assert (=> b!1485624 m!1370749))

(assert (=> b!1485624 m!1370749))

(declare-fun m!1370751 () Bool)

(assert (=> b!1485624 m!1370751))

(declare-fun m!1370753 () Bool)

(assert (=> b!1485633 m!1370753))

(assert (=> b!1485633 m!1370723))

(declare-fun m!1370755 () Bool)

(assert (=> b!1485619 m!1370755))

(assert (=> b!1485619 m!1370737))

(assert (=> b!1485619 m!1370743))

(assert (=> b!1485619 m!1370741))

(declare-fun m!1370757 () Bool)

(assert (=> b!1485619 m!1370757))

(assert (=> b!1485619 m!1370723))

(assert (=> b!1485627 m!1370723))

(assert (=> b!1485627 m!1370723))

(declare-fun m!1370759 () Bool)

(assert (=> b!1485627 m!1370759))

(declare-fun m!1370761 () Bool)

(assert (=> b!1485621 m!1370761))

(declare-fun m!1370763 () Bool)

(assert (=> b!1485620 m!1370763))

(assert (=> b!1485634 m!1370731))

(assert (=> b!1485634 m!1370729))

(assert (=> b!1485625 m!1370723))

(assert (=> b!1485625 m!1370723))

(declare-fun m!1370765 () Bool)

(assert (=> b!1485625 m!1370765))

(assert (=> b!1485622 m!1370723))

(assert (=> b!1485622 m!1370723))

(declare-fun m!1370767 () Bool)

(assert (=> b!1485622 m!1370767))

(declare-fun m!1370769 () Bool)

(assert (=> start!126566 m!1370769))

(declare-fun m!1370771 () Bool)

(assert (=> start!126566 m!1370771))

(push 1)

