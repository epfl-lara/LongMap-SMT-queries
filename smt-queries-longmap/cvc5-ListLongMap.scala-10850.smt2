; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127012 () Bool)

(assert start!127012)

(declare-fun b!1492735 () Bool)

(declare-fun res!1015539 () Bool)

(declare-fun e!836263 () Bool)

(assert (=> b!1492735 (=> (not res!1015539) (not e!836263))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492735 (= res!1015539 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-datatypes ((array!99722 0))(
  ( (array!99723 (arr!48131 (Array (_ BitVec 32) (_ BitVec 64))) (size!48681 (_ BitVec 32))) )
))
(declare-fun lt!650749 () array!99722)

(declare-fun e!836261 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!650752 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1492736 () Bool)

(declare-datatypes ((SeekEntryResult!12371 0))(
  ( (MissingZero!12371 (index!51876 (_ BitVec 32))) (Found!12371 (index!51877 (_ BitVec 32))) (Intermediate!12371 (undefined!13183 Bool) (index!51878 (_ BitVec 32)) (x!133471 (_ BitVec 32))) (Undefined!12371) (MissingVacant!12371 (index!51879 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99722 (_ BitVec 32)) SeekEntryResult!12371)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99722 (_ BitVec 32)) SeekEntryResult!12371)

(assert (=> b!1492736 (= e!836261 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650752 lt!650749 mask!2687) (seekEntryOrOpen!0 lt!650752 lt!650749 mask!2687)))))

(declare-fun b!1492737 () Bool)

(declare-fun res!1015528 () Bool)

(assert (=> b!1492737 (=> (not res!1015528) (not e!836263))))

(assert (=> b!1492737 (= res!1015528 e!836261)))

(declare-fun c!138132 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1492737 (= c!138132 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492738 () Bool)

(declare-fun res!1015540 () Bool)

(declare-fun e!836259 () Bool)

(assert (=> b!1492738 (=> (not res!1015540) (not e!836259))))

(declare-fun a!2862 () array!99722)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99722 (_ BitVec 32)) Bool)

(assert (=> b!1492738 (= res!1015540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492739 () Bool)

(declare-fun res!1015543 () Bool)

(assert (=> b!1492739 (=> (not res!1015543) (not e!836259))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1492739 (= res!1015543 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48681 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48681 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48681 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492740 () Bool)

(declare-fun e!836257 () Bool)

(declare-fun e!836258 () Bool)

(assert (=> b!1492740 (= e!836257 e!836258)))

(declare-fun res!1015532 () Bool)

(assert (=> b!1492740 (=> (not res!1015532) (not e!836258))))

(declare-fun lt!650750 () SeekEntryResult!12371)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99722 (_ BitVec 32)) SeekEntryResult!12371)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492740 (= res!1015532 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48131 a!2862) j!93) mask!2687) (select (arr!48131 a!2862) j!93) a!2862 mask!2687) lt!650750))))

(assert (=> b!1492740 (= lt!650750 (Intermediate!12371 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492741 () Bool)

(declare-fun e!836264 () Bool)

(assert (=> b!1492741 (= e!836264 true)))

(declare-fun lt!650754 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492741 (= lt!650754 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492742 () Bool)

(declare-fun res!1015531 () Bool)

(assert (=> b!1492742 (=> (not res!1015531) (not e!836259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492742 (= res!1015531 (validKeyInArray!0 (select (arr!48131 a!2862) j!93)))))

(declare-fun e!836262 () Bool)

(declare-fun b!1492743 () Bool)

(assert (=> b!1492743 (= e!836262 (or (= (select (arr!48131 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48131 a!2862) intermediateBeforeIndex!19) (select (arr!48131 a!2862) j!93))))))

(declare-fun b!1492744 () Bool)

(declare-fun res!1015529 () Bool)

(assert (=> b!1492744 (=> (not res!1015529) (not e!836259))))

(assert (=> b!1492744 (= res!1015529 (and (= (size!48681 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48681 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48681 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492745 () Bool)

(assert (=> b!1492745 (= e!836258 e!836263)))

(declare-fun res!1015542 () Bool)

(assert (=> b!1492745 (=> (not res!1015542) (not e!836263))))

(declare-fun lt!650753 () SeekEntryResult!12371)

(assert (=> b!1492745 (= res!1015542 (= lt!650753 (Intermediate!12371 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1492745 (= lt!650753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650752 mask!2687) lt!650752 lt!650749 mask!2687))))

(assert (=> b!1492745 (= lt!650752 (select (store (arr!48131 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492746 () Bool)

(declare-fun res!1015536 () Bool)

(assert (=> b!1492746 (=> (not res!1015536) (not e!836262))))

(assert (=> b!1492746 (= res!1015536 (= (seekEntryOrOpen!0 (select (arr!48131 a!2862) j!93) a!2862 mask!2687) (Found!12371 j!93)))))

(declare-fun b!1492747 () Bool)

(declare-fun res!1015534 () Bool)

(assert (=> b!1492747 (=> (not res!1015534) (not e!836259))))

(assert (=> b!1492747 (= res!1015534 (validKeyInArray!0 (select (arr!48131 a!2862) i!1006)))))

(declare-fun b!1492748 () Bool)

(assert (=> b!1492748 (= e!836263 (not e!836264))))

(declare-fun res!1015533 () Bool)

(assert (=> b!1492748 (=> res!1015533 e!836264)))

(assert (=> b!1492748 (= res!1015533 (or (and (= (select (arr!48131 a!2862) index!646) (select (store (arr!48131 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48131 a!2862) index!646) (select (arr!48131 a!2862) j!93))) (= (select (arr!48131 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1492748 e!836262))

(declare-fun res!1015530 () Bool)

(assert (=> b!1492748 (=> (not res!1015530) (not e!836262))))

(assert (=> b!1492748 (= res!1015530 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50082 0))(
  ( (Unit!50083) )
))
(declare-fun lt!650751 () Unit!50082)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50082)

(assert (=> b!1492748 (= lt!650751 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1015541 () Bool)

(assert (=> start!127012 (=> (not res!1015541) (not e!836259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127012 (= res!1015541 (validMask!0 mask!2687))))

(assert (=> start!127012 e!836259))

(assert (=> start!127012 true))

(declare-fun array_inv!37159 (array!99722) Bool)

(assert (=> start!127012 (array_inv!37159 a!2862)))

(declare-fun b!1492749 () Bool)

(declare-fun res!1015535 () Bool)

(assert (=> b!1492749 (=> (not res!1015535) (not e!836258))))

(assert (=> b!1492749 (= res!1015535 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48131 a!2862) j!93) a!2862 mask!2687) lt!650750))))

(declare-fun b!1492750 () Bool)

(assert (=> b!1492750 (= e!836261 (= lt!650753 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650752 lt!650749 mask!2687)))))

(declare-fun b!1492751 () Bool)

(declare-fun res!1015537 () Bool)

(assert (=> b!1492751 (=> (not res!1015537) (not e!836259))))

(declare-datatypes ((List!34632 0))(
  ( (Nil!34629) (Cons!34628 (h!36014 (_ BitVec 64)) (t!49326 List!34632)) )
))
(declare-fun arrayNoDuplicates!0 (array!99722 (_ BitVec 32) List!34632) Bool)

(assert (=> b!1492751 (= res!1015537 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34629))))

(declare-fun b!1492752 () Bool)

(assert (=> b!1492752 (= e!836259 e!836257)))

(declare-fun res!1015538 () Bool)

(assert (=> b!1492752 (=> (not res!1015538) (not e!836257))))

(assert (=> b!1492752 (= res!1015538 (= (select (store (arr!48131 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492752 (= lt!650749 (array!99723 (store (arr!48131 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48681 a!2862)))))

(assert (= (and start!127012 res!1015541) b!1492744))

(assert (= (and b!1492744 res!1015529) b!1492747))

(assert (= (and b!1492747 res!1015534) b!1492742))

(assert (= (and b!1492742 res!1015531) b!1492738))

(assert (= (and b!1492738 res!1015540) b!1492751))

(assert (= (and b!1492751 res!1015537) b!1492739))

(assert (= (and b!1492739 res!1015543) b!1492752))

(assert (= (and b!1492752 res!1015538) b!1492740))

(assert (= (and b!1492740 res!1015532) b!1492749))

(assert (= (and b!1492749 res!1015535) b!1492745))

(assert (= (and b!1492745 res!1015542) b!1492737))

(assert (= (and b!1492737 c!138132) b!1492750))

(assert (= (and b!1492737 (not c!138132)) b!1492736))

(assert (= (and b!1492737 res!1015528) b!1492735))

(assert (= (and b!1492735 res!1015539) b!1492748))

(assert (= (and b!1492748 res!1015530) b!1492746))

(assert (= (and b!1492746 res!1015536) b!1492743))

(assert (= (and b!1492748 (not res!1015533)) b!1492741))

(declare-fun m!1376677 () Bool)

(assert (=> b!1492750 m!1376677))

(declare-fun m!1376679 () Bool)

(assert (=> b!1492749 m!1376679))

(assert (=> b!1492749 m!1376679))

(declare-fun m!1376681 () Bool)

(assert (=> b!1492749 m!1376681))

(declare-fun m!1376683 () Bool)

(assert (=> b!1492748 m!1376683))

(declare-fun m!1376685 () Bool)

(assert (=> b!1492748 m!1376685))

(declare-fun m!1376687 () Bool)

(assert (=> b!1492748 m!1376687))

(declare-fun m!1376689 () Bool)

(assert (=> b!1492748 m!1376689))

(declare-fun m!1376691 () Bool)

(assert (=> b!1492748 m!1376691))

(assert (=> b!1492748 m!1376679))

(declare-fun m!1376693 () Bool)

(assert (=> start!127012 m!1376693))

(declare-fun m!1376695 () Bool)

(assert (=> start!127012 m!1376695))

(declare-fun m!1376697 () Bool)

(assert (=> b!1492743 m!1376697))

(assert (=> b!1492743 m!1376679))

(declare-fun m!1376699 () Bool)

(assert (=> b!1492741 m!1376699))

(declare-fun m!1376701 () Bool)

(assert (=> b!1492745 m!1376701))

(assert (=> b!1492745 m!1376701))

(declare-fun m!1376703 () Bool)

(assert (=> b!1492745 m!1376703))

(assert (=> b!1492745 m!1376685))

(declare-fun m!1376705 () Bool)

(assert (=> b!1492745 m!1376705))

(assert (=> b!1492746 m!1376679))

(assert (=> b!1492746 m!1376679))

(declare-fun m!1376707 () Bool)

(assert (=> b!1492746 m!1376707))

(declare-fun m!1376709 () Bool)

(assert (=> b!1492747 m!1376709))

(assert (=> b!1492747 m!1376709))

(declare-fun m!1376711 () Bool)

(assert (=> b!1492747 m!1376711))

(declare-fun m!1376713 () Bool)

(assert (=> b!1492736 m!1376713))

(declare-fun m!1376715 () Bool)

(assert (=> b!1492736 m!1376715))

(assert (=> b!1492742 m!1376679))

(assert (=> b!1492742 m!1376679))

(declare-fun m!1376717 () Bool)

(assert (=> b!1492742 m!1376717))

(declare-fun m!1376719 () Bool)

(assert (=> b!1492738 m!1376719))

(declare-fun m!1376721 () Bool)

(assert (=> b!1492751 m!1376721))

(assert (=> b!1492740 m!1376679))

(assert (=> b!1492740 m!1376679))

(declare-fun m!1376723 () Bool)

(assert (=> b!1492740 m!1376723))

(assert (=> b!1492740 m!1376723))

(assert (=> b!1492740 m!1376679))

(declare-fun m!1376725 () Bool)

(assert (=> b!1492740 m!1376725))

(assert (=> b!1492752 m!1376685))

(declare-fun m!1376727 () Bool)

(assert (=> b!1492752 m!1376727))

(push 1)

