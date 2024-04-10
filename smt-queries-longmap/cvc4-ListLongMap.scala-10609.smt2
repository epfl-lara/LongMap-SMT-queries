; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124796 () Bool)

(assert start!124796)

(declare-fun b!1447914 () Bool)

(declare-fun res!979521 () Bool)

(declare-fun e!815442 () Bool)

(assert (=> b!1447914 (=> (not res!979521) (not e!815442))))

(declare-datatypes ((array!98244 0))(
  ( (array!98245 (arr!47410 (Array (_ BitVec 32) (_ BitVec 64))) (size!47960 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98244)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447914 (= res!979521 (validKeyInArray!0 (select (arr!47410 a!2862) j!93)))))

(declare-fun lt!635337 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1447915 () Bool)

(declare-fun e!815439 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635340 () array!98244)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11662 0))(
  ( (MissingZero!11662 (index!49040 (_ BitVec 32))) (Found!11662 (index!49041 (_ BitVec 32))) (Intermediate!11662 (undefined!12474 Bool) (index!49042 (_ BitVec 32)) (x!130711 (_ BitVec 32))) (Undefined!11662) (MissingVacant!11662 (index!49043 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98244 (_ BitVec 32)) SeekEntryResult!11662)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98244 (_ BitVec 32)) SeekEntryResult!11662)

(assert (=> b!1447915 (= e!815439 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635337 lt!635340 mask!2687) (seekEntryOrOpen!0 lt!635337 lt!635340 mask!2687)))))

(declare-fun e!815444 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1447916 () Bool)

(assert (=> b!1447916 (= e!815444 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447917 () Bool)

(declare-fun res!979526 () Bool)

(assert (=> b!1447917 (=> (not res!979526) (not e!815442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98244 (_ BitVec 32)) Bool)

(assert (=> b!1447917 (= res!979526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447918 () Bool)

(declare-fun e!815441 () Bool)

(assert (=> b!1447918 (= e!815441 e!815444)))

(declare-fun res!979529 () Bool)

(assert (=> b!1447918 (=> (not res!979529) (not e!815444))))

(declare-fun lt!635342 () SeekEntryResult!11662)

(assert (=> b!1447918 (= res!979529 (= lt!635342 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47410 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!979517 () Bool)

(assert (=> start!124796 (=> (not res!979517) (not e!815442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124796 (= res!979517 (validMask!0 mask!2687))))

(assert (=> start!124796 e!815442))

(assert (=> start!124796 true))

(declare-fun array_inv!36438 (array!98244) Bool)

(assert (=> start!124796 (array_inv!36438 a!2862)))

(declare-fun b!1447919 () Bool)

(declare-fun e!815440 () Bool)

(declare-fun e!815437 () Bool)

(assert (=> b!1447919 (= e!815440 (not e!815437))))

(declare-fun res!979527 () Bool)

(assert (=> b!1447919 (=> res!979527 e!815437)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447919 (= res!979527 (or (and (= (select (arr!47410 a!2862) index!646) (select (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47410 a!2862) index!646) (select (arr!47410 a!2862) j!93))) (not (= (select (arr!47410 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47410 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815443 () Bool)

(assert (=> b!1447919 e!815443))

(declare-fun res!979519 () Bool)

(assert (=> b!1447919 (=> (not res!979519) (not e!815443))))

(assert (=> b!1447919 (= res!979519 (and (= lt!635342 (Found!11662 j!93)) (or (= (select (arr!47410 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47410 a!2862) intermediateBeforeIndex!19) (select (arr!47410 a!2862) j!93)))))))

(assert (=> b!1447919 (= lt!635342 (seekEntryOrOpen!0 (select (arr!47410 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447919 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48820 0))(
  ( (Unit!48821) )
))
(declare-fun lt!635343 () Unit!48820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48820)

(assert (=> b!1447919 (= lt!635343 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447920 () Bool)

(declare-fun res!979516 () Bool)

(assert (=> b!1447920 (=> (not res!979516) (not e!815440))))

(assert (=> b!1447920 (= res!979516 e!815439)))

(declare-fun c!133710 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447920 (= c!133710 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447921 () Bool)

(assert (=> b!1447921 (= e!815437 true)))

(declare-fun lt!635339 () SeekEntryResult!11662)

(assert (=> b!1447921 (= lt!635339 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47410 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447922 () Bool)

(declare-fun res!979524 () Bool)

(assert (=> b!1447922 (=> (not res!979524) (not e!815442))))

(assert (=> b!1447922 (= res!979524 (validKeyInArray!0 (select (arr!47410 a!2862) i!1006)))))

(declare-fun b!1447923 () Bool)

(declare-fun res!979522 () Bool)

(assert (=> b!1447923 (=> (not res!979522) (not e!815440))))

(assert (=> b!1447923 (= res!979522 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447924 () Bool)

(declare-fun res!979525 () Bool)

(assert (=> b!1447924 (=> (not res!979525) (not e!815442))))

(assert (=> b!1447924 (= res!979525 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47960 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47960 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47960 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447925 () Bool)

(declare-fun e!815436 () Bool)

(assert (=> b!1447925 (= e!815436 e!815440)))

(declare-fun res!979531 () Bool)

(assert (=> b!1447925 (=> (not res!979531) (not e!815440))))

(declare-fun lt!635341 () SeekEntryResult!11662)

(assert (=> b!1447925 (= res!979531 (= lt!635341 (Intermediate!11662 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98244 (_ BitVec 32)) SeekEntryResult!11662)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447925 (= lt!635341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635337 mask!2687) lt!635337 lt!635340 mask!2687))))

(assert (=> b!1447925 (= lt!635337 (select (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447926 () Bool)

(declare-fun e!815435 () Bool)

(assert (=> b!1447926 (= e!815435 e!815436)))

(declare-fun res!979520 () Bool)

(assert (=> b!1447926 (=> (not res!979520) (not e!815436))))

(declare-fun lt!635338 () SeekEntryResult!11662)

(assert (=> b!1447926 (= res!979520 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47410 a!2862) j!93) mask!2687) (select (arr!47410 a!2862) j!93) a!2862 mask!2687) lt!635338))))

(assert (=> b!1447926 (= lt!635338 (Intermediate!11662 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447927 () Bool)

(assert (=> b!1447927 (= e!815442 e!815435)))

(declare-fun res!979518 () Bool)

(assert (=> b!1447927 (=> (not res!979518) (not e!815435))))

(assert (=> b!1447927 (= res!979518 (= (select (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447927 (= lt!635340 (array!98245 (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47960 a!2862)))))

(declare-fun b!1447928 () Bool)

(assert (=> b!1447928 (= e!815439 (= lt!635341 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635337 lt!635340 mask!2687)))))

(declare-fun b!1447929 () Bool)

(declare-fun res!979528 () Bool)

(assert (=> b!1447929 (=> (not res!979528) (not e!815442))))

(declare-datatypes ((List!33911 0))(
  ( (Nil!33908) (Cons!33907 (h!35257 (_ BitVec 64)) (t!48605 List!33911)) )
))
(declare-fun arrayNoDuplicates!0 (array!98244 (_ BitVec 32) List!33911) Bool)

(assert (=> b!1447929 (= res!979528 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33908))))

(declare-fun b!1447930 () Bool)

(declare-fun res!979523 () Bool)

(assert (=> b!1447930 (=> (not res!979523) (not e!815436))))

(assert (=> b!1447930 (= res!979523 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47410 a!2862) j!93) a!2862 mask!2687) lt!635338))))

(declare-fun b!1447931 () Bool)

(assert (=> b!1447931 (= e!815443 e!815441)))

(declare-fun res!979530 () Bool)

(assert (=> b!1447931 (=> res!979530 e!815441)))

(assert (=> b!1447931 (= res!979530 (or (and (= (select (arr!47410 a!2862) index!646) (select (store (arr!47410 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47410 a!2862) index!646) (select (arr!47410 a!2862) j!93))) (not (= (select (arr!47410 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447932 () Bool)

(declare-fun res!979515 () Bool)

(assert (=> b!1447932 (=> (not res!979515) (not e!815442))))

(assert (=> b!1447932 (= res!979515 (and (= (size!47960 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47960 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47960 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124796 res!979517) b!1447932))

(assert (= (and b!1447932 res!979515) b!1447922))

(assert (= (and b!1447922 res!979524) b!1447914))

(assert (= (and b!1447914 res!979521) b!1447917))

(assert (= (and b!1447917 res!979526) b!1447929))

(assert (= (and b!1447929 res!979528) b!1447924))

(assert (= (and b!1447924 res!979525) b!1447927))

(assert (= (and b!1447927 res!979518) b!1447926))

(assert (= (and b!1447926 res!979520) b!1447930))

(assert (= (and b!1447930 res!979523) b!1447925))

(assert (= (and b!1447925 res!979531) b!1447920))

(assert (= (and b!1447920 c!133710) b!1447928))

(assert (= (and b!1447920 (not c!133710)) b!1447915))

(assert (= (and b!1447920 res!979516) b!1447923))

(assert (= (and b!1447923 res!979522) b!1447919))

(assert (= (and b!1447919 res!979519) b!1447931))

(assert (= (and b!1447931 (not res!979530)) b!1447918))

(assert (= (and b!1447918 res!979529) b!1447916))

(assert (= (and b!1447919 (not res!979527)) b!1447921))

(declare-fun m!1336705 () Bool)

(assert (=> b!1447931 m!1336705))

(declare-fun m!1336707 () Bool)

(assert (=> b!1447931 m!1336707))

(declare-fun m!1336709 () Bool)

(assert (=> b!1447931 m!1336709))

(declare-fun m!1336711 () Bool)

(assert (=> b!1447931 m!1336711))

(declare-fun m!1336713 () Bool)

(assert (=> b!1447922 m!1336713))

(assert (=> b!1447922 m!1336713))

(declare-fun m!1336715 () Bool)

(assert (=> b!1447922 m!1336715))

(declare-fun m!1336717 () Bool)

(assert (=> b!1447929 m!1336717))

(declare-fun m!1336719 () Bool)

(assert (=> start!124796 m!1336719))

(declare-fun m!1336721 () Bool)

(assert (=> start!124796 m!1336721))

(declare-fun m!1336723 () Bool)

(assert (=> b!1447915 m!1336723))

(declare-fun m!1336725 () Bool)

(assert (=> b!1447915 m!1336725))

(assert (=> b!1447918 m!1336711))

(assert (=> b!1447918 m!1336711))

(declare-fun m!1336727 () Bool)

(assert (=> b!1447918 m!1336727))

(declare-fun m!1336729 () Bool)

(assert (=> b!1447928 m!1336729))

(assert (=> b!1447926 m!1336711))

(assert (=> b!1447926 m!1336711))

(declare-fun m!1336731 () Bool)

(assert (=> b!1447926 m!1336731))

(assert (=> b!1447926 m!1336731))

(assert (=> b!1447926 m!1336711))

(declare-fun m!1336733 () Bool)

(assert (=> b!1447926 m!1336733))

(declare-fun m!1336735 () Bool)

(assert (=> b!1447917 m!1336735))

(assert (=> b!1447914 m!1336711))

(assert (=> b!1447914 m!1336711))

(declare-fun m!1336737 () Bool)

(assert (=> b!1447914 m!1336737))

(assert (=> b!1447927 m!1336707))

(declare-fun m!1336739 () Bool)

(assert (=> b!1447927 m!1336739))

(assert (=> b!1447921 m!1336711))

(assert (=> b!1447921 m!1336711))

(declare-fun m!1336741 () Bool)

(assert (=> b!1447921 m!1336741))

(declare-fun m!1336743 () Bool)

(assert (=> b!1447925 m!1336743))

(assert (=> b!1447925 m!1336743))

(declare-fun m!1336745 () Bool)

(assert (=> b!1447925 m!1336745))

(assert (=> b!1447925 m!1336707))

(declare-fun m!1336747 () Bool)

(assert (=> b!1447925 m!1336747))

(assert (=> b!1447930 m!1336711))

(assert (=> b!1447930 m!1336711))

(declare-fun m!1336749 () Bool)

(assert (=> b!1447930 m!1336749))

(declare-fun m!1336751 () Bool)

(assert (=> b!1447919 m!1336751))

(assert (=> b!1447919 m!1336707))

(declare-fun m!1336753 () Bool)

(assert (=> b!1447919 m!1336753))

(assert (=> b!1447919 m!1336709))

(assert (=> b!1447919 m!1336705))

(assert (=> b!1447919 m!1336711))

(declare-fun m!1336755 () Bool)

(assert (=> b!1447919 m!1336755))

(declare-fun m!1336757 () Bool)

(assert (=> b!1447919 m!1336757))

(assert (=> b!1447919 m!1336711))

(push 1)

