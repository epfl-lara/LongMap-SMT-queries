; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127386 () Bool)

(assert start!127386)

(declare-fun b!1495634 () Bool)

(declare-fun res!1016978 () Bool)

(declare-fun e!837905 () Bool)

(assert (=> b!1495634 (=> (not res!1016978) (not e!837905))))

(declare-fun e!837906 () Bool)

(assert (=> b!1495634 (= res!1016978 e!837906)))

(declare-fun c!138874 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495634 (= c!138874 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495635 () Bool)

(declare-fun e!837910 () Bool)

(assert (=> b!1495635 (= e!837910 e!837905)))

(declare-fun res!1016975 () Bool)

(assert (=> b!1495635 (=> (not res!1016975) (not e!837905))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12336 0))(
  ( (MissingZero!12336 (index!51736 (_ BitVec 32))) (Found!12336 (index!51737 (_ BitVec 32))) (Intermediate!12336 (undefined!13148 Bool) (index!51738 (_ BitVec 32)) (x!133521 (_ BitVec 32))) (Undefined!12336) (MissingVacant!12336 (index!51739 (_ BitVec 32))) )
))
(declare-fun lt!651826 () SeekEntryResult!12336)

(assert (=> b!1495635 (= res!1016975 (= lt!651826 (Intermediate!12336 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651825 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99871 0))(
  ( (array!99872 (arr!48199 (Array (_ BitVec 32) (_ BitVec 64))) (size!48750 (_ BitVec 32))) )
))
(declare-fun lt!651824 () array!99871)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99871 (_ BitVec 32)) SeekEntryResult!12336)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495635 (= lt!651826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651825 mask!2687) lt!651825 lt!651824 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99871)

(assert (=> b!1495635 (= lt!651825 (select (store (arr!48199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495636 () Bool)

(declare-fun e!837908 () Bool)

(assert (=> b!1495636 (= e!837908 true)))

(declare-fun lt!651829 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495636 (= lt!651829 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1495637 () Bool)

(declare-fun e!837909 () Bool)

(assert (=> b!1495637 (= e!837909 e!837910)))

(declare-fun res!1016980 () Bool)

(assert (=> b!1495637 (=> (not res!1016980) (not e!837910))))

(declare-fun lt!651827 () SeekEntryResult!12336)

(assert (=> b!1495637 (= res!1016980 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48199 a!2862) j!93) mask!2687) (select (arr!48199 a!2862) j!93) a!2862 mask!2687) lt!651827))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1495637 (= lt!651827 (Intermediate!12336 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1016969 () Bool)

(declare-fun e!837911 () Bool)

(assert (=> start!127386 (=> (not res!1016969) (not e!837911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127386 (= res!1016969 (validMask!0 mask!2687))))

(assert (=> start!127386 e!837911))

(assert (=> start!127386 true))

(declare-fun array_inv!37480 (array!99871) Bool)

(assert (=> start!127386 (array_inv!37480 a!2862)))

(declare-fun b!1495638 () Bool)

(assert (=> b!1495638 (= e!837906 (= lt!651826 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651825 lt!651824 mask!2687)))))

(declare-fun b!1495639 () Bool)

(declare-fun res!1016970 () Bool)

(assert (=> b!1495639 (=> (not res!1016970) (not e!837910))))

(assert (=> b!1495639 (= res!1016970 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48199 a!2862) j!93) a!2862 mask!2687) lt!651827))))

(declare-fun b!1495640 () Bool)

(assert (=> b!1495640 (= e!837911 e!837909)))

(declare-fun res!1016972 () Bool)

(assert (=> b!1495640 (=> (not res!1016972) (not e!837909))))

(assert (=> b!1495640 (= res!1016972 (= (select (store (arr!48199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495640 (= lt!651824 (array!99872 (store (arr!48199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48750 a!2862)))))

(declare-fun b!1495641 () Bool)

(declare-fun res!1016981 () Bool)

(assert (=> b!1495641 (=> (not res!1016981) (not e!837911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99871 (_ BitVec 32)) Bool)

(assert (=> b!1495641 (= res!1016981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495642 () Bool)

(declare-fun res!1016976 () Bool)

(assert (=> b!1495642 (=> (not res!1016976) (not e!837911))))

(assert (=> b!1495642 (= res!1016976 (and (= (size!48750 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48750 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48750 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1495643 () Bool)

(declare-fun res!1016968 () Bool)

(declare-fun e!837907 () Bool)

(assert (=> b!1495643 (=> (not res!1016968) (not e!837907))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99871 (_ BitVec 32)) SeekEntryResult!12336)

(assert (=> b!1495643 (= res!1016968 (= (seekEntryOrOpen!0 (select (arr!48199 a!2862) j!93) a!2862 mask!2687) (Found!12336 j!93)))))

(declare-fun b!1495644 () Bool)

(declare-fun res!1016977 () Bool)

(assert (=> b!1495644 (=> (not res!1016977) (not e!837911))))

(declare-datatypes ((List!34687 0))(
  ( (Nil!34684) (Cons!34683 (h!36086 (_ BitVec 64)) (t!49373 List!34687)) )
))
(declare-fun arrayNoDuplicates!0 (array!99871 (_ BitVec 32) List!34687) Bool)

(assert (=> b!1495644 (= res!1016977 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34684))))

(declare-fun b!1495645 () Bool)

(assert (=> b!1495645 (= e!837907 (or (= (select (arr!48199 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48199 a!2862) intermediateBeforeIndex!19) (select (arr!48199 a!2862) j!93))))))

(declare-fun b!1495646 () Bool)

(declare-fun res!1016971 () Bool)

(assert (=> b!1495646 (=> (not res!1016971) (not e!837905))))

(assert (=> b!1495646 (= res!1016971 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495647 () Bool)

(declare-fun res!1016973 () Bool)

(assert (=> b!1495647 (=> (not res!1016973) (not e!837911))))

(assert (=> b!1495647 (= res!1016973 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48750 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48750 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48750 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1495648 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99871 (_ BitVec 32)) SeekEntryResult!12336)

(assert (=> b!1495648 (= e!837906 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651825 lt!651824 mask!2687) (seekEntryOrOpen!0 lt!651825 lt!651824 mask!2687)))))

(declare-fun b!1495649 () Bool)

(assert (=> b!1495649 (= e!837905 (not e!837908))))

(declare-fun res!1016966 () Bool)

(assert (=> b!1495649 (=> res!1016966 e!837908)))

(assert (=> b!1495649 (= res!1016966 (or (and (= (select (arr!48199 a!2862) index!646) (select (store (arr!48199 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48199 a!2862) index!646) (select (arr!48199 a!2862) j!93))) (= (select (arr!48199 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495649 e!837907))

(declare-fun res!1016967 () Bool)

(assert (=> b!1495649 (=> (not res!1016967) (not e!837907))))

(assert (=> b!1495649 (= res!1016967 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50045 0))(
  ( (Unit!50046) )
))
(declare-fun lt!651828 () Unit!50045)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50045)

(assert (=> b!1495649 (= lt!651828 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495650 () Bool)

(declare-fun res!1016979 () Bool)

(assert (=> b!1495650 (=> (not res!1016979) (not e!837911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495650 (= res!1016979 (validKeyInArray!0 (select (arr!48199 a!2862) j!93)))))

(declare-fun b!1495651 () Bool)

(declare-fun res!1016974 () Bool)

(assert (=> b!1495651 (=> (not res!1016974) (not e!837911))))

(assert (=> b!1495651 (= res!1016974 (validKeyInArray!0 (select (arr!48199 a!2862) i!1006)))))

(assert (= (and start!127386 res!1016969) b!1495642))

(assert (= (and b!1495642 res!1016976) b!1495651))

(assert (= (and b!1495651 res!1016974) b!1495650))

(assert (= (and b!1495650 res!1016979) b!1495641))

(assert (= (and b!1495641 res!1016981) b!1495644))

(assert (= (and b!1495644 res!1016977) b!1495647))

(assert (= (and b!1495647 res!1016973) b!1495640))

(assert (= (and b!1495640 res!1016972) b!1495637))

(assert (= (and b!1495637 res!1016980) b!1495639))

(assert (= (and b!1495639 res!1016970) b!1495635))

(assert (= (and b!1495635 res!1016975) b!1495634))

(assert (= (and b!1495634 c!138874) b!1495638))

(assert (= (and b!1495634 (not c!138874)) b!1495648))

(assert (= (and b!1495634 res!1016978) b!1495646))

(assert (= (and b!1495646 res!1016971) b!1495649))

(assert (= (and b!1495649 res!1016967) b!1495643))

(assert (= (and b!1495643 res!1016968) b!1495645))

(assert (= (and b!1495649 (not res!1016966)) b!1495636))

(declare-fun m!1379407 () Bool)

(assert (=> b!1495635 m!1379407))

(assert (=> b!1495635 m!1379407))

(declare-fun m!1379409 () Bool)

(assert (=> b!1495635 m!1379409))

(declare-fun m!1379411 () Bool)

(assert (=> b!1495635 m!1379411))

(declare-fun m!1379413 () Bool)

(assert (=> b!1495635 m!1379413))

(declare-fun m!1379415 () Bool)

(assert (=> b!1495645 m!1379415))

(declare-fun m!1379417 () Bool)

(assert (=> b!1495645 m!1379417))

(assert (=> b!1495637 m!1379417))

(assert (=> b!1495637 m!1379417))

(declare-fun m!1379419 () Bool)

(assert (=> b!1495637 m!1379419))

(assert (=> b!1495637 m!1379419))

(assert (=> b!1495637 m!1379417))

(declare-fun m!1379421 () Bool)

(assert (=> b!1495637 m!1379421))

(declare-fun m!1379423 () Bool)

(assert (=> start!127386 m!1379423))

(declare-fun m!1379425 () Bool)

(assert (=> start!127386 m!1379425))

(declare-fun m!1379427 () Bool)

(assert (=> b!1495638 m!1379427))

(assert (=> b!1495639 m!1379417))

(assert (=> b!1495639 m!1379417))

(declare-fun m!1379429 () Bool)

(assert (=> b!1495639 m!1379429))

(declare-fun m!1379431 () Bool)

(assert (=> b!1495636 m!1379431))

(declare-fun m!1379433 () Bool)

(assert (=> b!1495641 m!1379433))

(declare-fun m!1379435 () Bool)

(assert (=> b!1495651 m!1379435))

(assert (=> b!1495651 m!1379435))

(declare-fun m!1379437 () Bool)

(assert (=> b!1495651 m!1379437))

(declare-fun m!1379439 () Bool)

(assert (=> b!1495649 m!1379439))

(assert (=> b!1495649 m!1379411))

(declare-fun m!1379441 () Bool)

(assert (=> b!1495649 m!1379441))

(declare-fun m!1379443 () Bool)

(assert (=> b!1495649 m!1379443))

(declare-fun m!1379445 () Bool)

(assert (=> b!1495649 m!1379445))

(assert (=> b!1495649 m!1379417))

(declare-fun m!1379447 () Bool)

(assert (=> b!1495648 m!1379447))

(declare-fun m!1379449 () Bool)

(assert (=> b!1495648 m!1379449))

(assert (=> b!1495640 m!1379411))

(declare-fun m!1379451 () Bool)

(assert (=> b!1495640 m!1379451))

(declare-fun m!1379453 () Bool)

(assert (=> b!1495644 m!1379453))

(assert (=> b!1495643 m!1379417))

(assert (=> b!1495643 m!1379417))

(declare-fun m!1379455 () Bool)

(assert (=> b!1495643 m!1379455))

(assert (=> b!1495650 m!1379417))

(assert (=> b!1495650 m!1379417))

(declare-fun m!1379457 () Bool)

(assert (=> b!1495650 m!1379457))

(check-sat (not b!1495635) (not b!1495643) (not b!1495636) (not b!1495648) (not start!127386) (not b!1495649) (not b!1495641) (not b!1495637) (not b!1495639) (not b!1495651) (not b!1495638) (not b!1495650) (not b!1495644))
(check-sat)
