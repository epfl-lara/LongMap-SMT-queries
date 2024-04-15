; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125284 () Bool)

(assert start!125284)

(declare-fun b!1463640 () Bool)

(declare-fun e!822586 () Bool)

(assert (=> b!1463640 (= e!822586 true)))

(declare-fun lt!640661 () Bool)

(declare-fun e!822592 () Bool)

(assert (=> b!1463640 (= lt!640661 e!822592)))

(declare-fun c!134866 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463640 (= c!134866 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463641 () Bool)

(declare-fun res!992937 () Bool)

(declare-fun e!822590 () Bool)

(assert (=> b!1463641 (=> (not res!992937) (not e!822590))))

(declare-datatypes ((array!98710 0))(
  ( (array!98711 (arr!47644 (Array (_ BitVec 32) (_ BitVec 64))) (size!48196 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98710)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11921 0))(
  ( (MissingZero!11921 (index!50076 (_ BitVec 32))) (Found!11921 (index!50077 (_ BitVec 32))) (Intermediate!11921 (undefined!12733 Bool) (index!50078 (_ BitVec 32)) (x!131661 (_ BitVec 32))) (Undefined!11921) (MissingVacant!11921 (index!50079 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98710 (_ BitVec 32)) SeekEntryResult!11921)

(assert (=> b!1463641 (= res!992937 (= (seekEntryOrOpen!0 (select (arr!47644 a!2862) j!93) a!2862 mask!2687) (Found!11921 j!93)))))

(declare-fun b!1463642 () Bool)

(declare-fun res!992946 () Bool)

(declare-fun e!822591 () Bool)

(assert (=> b!1463642 (=> (not res!992946) (not e!822591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98710 (_ BitVec 32)) Bool)

(assert (=> b!1463642 (= res!992946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463643 () Bool)

(declare-fun res!992944 () Bool)

(assert (=> b!1463643 (=> (not res!992944) (not e!822591))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463643 (= res!992944 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48196 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48196 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48196 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!640664 () SeekEntryResult!11921)

(declare-fun lt!640663 () (_ BitVec 64))

(declare-fun e!822585 () Bool)

(declare-fun lt!640660 () array!98710)

(declare-fun b!1463644 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98710 (_ BitVec 32)) SeekEntryResult!11921)

(assert (=> b!1463644 (= e!822585 (= lt!640664 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640663 lt!640660 mask!2687)))))

(declare-fun res!992945 () Bool)

(assert (=> start!125284 (=> (not res!992945) (not e!822591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125284 (= res!992945 (validMask!0 mask!2687))))

(assert (=> start!125284 e!822591))

(assert (=> start!125284 true))

(declare-fun array_inv!36877 (array!98710) Bool)

(assert (=> start!125284 (array_inv!36877 a!2862)))

(declare-fun b!1463645 () Bool)

(declare-fun e!822593 () Bool)

(declare-fun e!822589 () Bool)

(assert (=> b!1463645 (= e!822593 e!822589)))

(declare-fun res!992941 () Bool)

(assert (=> b!1463645 (=> (not res!992941) (not e!822589))))

(assert (=> b!1463645 (= res!992941 (= lt!640664 (Intermediate!11921 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463645 (= lt!640664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640663 mask!2687) lt!640663 lt!640660 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463645 (= lt!640663 (select (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463646 () Bool)

(declare-fun res!992948 () Bool)

(assert (=> b!1463646 (=> (not res!992948) (not e!822593))))

(declare-fun lt!640662 () SeekEntryResult!11921)

(assert (=> b!1463646 (= res!992948 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47644 a!2862) j!93) a!2862 mask!2687) lt!640662))))

(declare-fun lt!640659 () (_ BitVec 32))

(declare-fun b!1463647 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98710 (_ BitVec 32)) SeekEntryResult!11921)

(assert (=> b!1463647 (= e!822592 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640659 intermediateAfterIndex!19 lt!640663 lt!640660 mask!2687) (seekEntryOrOpen!0 lt!640663 lt!640660 mask!2687))))))

(declare-fun b!1463648 () Bool)

(declare-fun e!822588 () Bool)

(assert (=> b!1463648 (= e!822589 (not e!822588))))

(declare-fun res!992942 () Bool)

(assert (=> b!1463648 (=> res!992942 e!822588)))

(assert (=> b!1463648 (= res!992942 (or (and (= (select (arr!47644 a!2862) index!646) (select (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47644 a!2862) index!646) (select (arr!47644 a!2862) j!93))) (= (select (arr!47644 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463648 e!822590))

(declare-fun res!992953 () Bool)

(assert (=> b!1463648 (=> (not res!992953) (not e!822590))))

(assert (=> b!1463648 (= res!992953 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49179 0))(
  ( (Unit!49180) )
))
(declare-fun lt!640665 () Unit!49179)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49179)

(assert (=> b!1463648 (= lt!640665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463649 () Bool)

(assert (=> b!1463649 (= e!822590 (or (= (select (arr!47644 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47644 a!2862) intermediateBeforeIndex!19) (select (arr!47644 a!2862) j!93))))))

(declare-fun b!1463650 () Bool)

(assert (=> b!1463650 (= e!822588 e!822586)))

(declare-fun res!992952 () Bool)

(assert (=> b!1463650 (=> res!992952 e!822586)))

(assert (=> b!1463650 (= res!992952 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640659 #b00000000000000000000000000000000) (bvsge lt!640659 (size!48196 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463650 (= lt!640659 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463651 () Bool)

(declare-fun res!992951 () Bool)

(assert (=> b!1463651 (=> (not res!992951) (not e!822591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463651 (= res!992951 (validKeyInArray!0 (select (arr!47644 a!2862) i!1006)))))

(declare-fun b!1463652 () Bool)

(declare-fun res!992943 () Bool)

(assert (=> b!1463652 (=> (not res!992943) (not e!822589))))

(assert (=> b!1463652 (= res!992943 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463653 () Bool)

(declare-fun res!992940 () Bool)

(assert (=> b!1463653 (=> (not res!992940) (not e!822591))))

(assert (=> b!1463653 (= res!992940 (and (= (size!48196 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48196 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48196 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463654 () Bool)

(declare-fun e!822587 () Bool)

(assert (=> b!1463654 (= e!822591 e!822587)))

(declare-fun res!992949 () Bool)

(assert (=> b!1463654 (=> (not res!992949) (not e!822587))))

(assert (=> b!1463654 (= res!992949 (= (select (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463654 (= lt!640660 (array!98711 (store (arr!47644 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48196 a!2862)))))

(declare-fun b!1463655 () Bool)

(assert (=> b!1463655 (= e!822592 (not (= lt!640664 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640659 lt!640663 lt!640660 mask!2687))))))

(declare-fun b!1463656 () Bool)

(assert (=> b!1463656 (= e!822587 e!822593)))

(declare-fun res!992947 () Bool)

(assert (=> b!1463656 (=> (not res!992947) (not e!822593))))

(assert (=> b!1463656 (= res!992947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47644 a!2862) j!93) mask!2687) (select (arr!47644 a!2862) j!93) a!2862 mask!2687) lt!640662))))

(assert (=> b!1463656 (= lt!640662 (Intermediate!11921 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463657 () Bool)

(declare-fun res!992938 () Bool)

(assert (=> b!1463657 (=> (not res!992938) (not e!822591))))

(declare-datatypes ((List!34223 0))(
  ( (Nil!34220) (Cons!34219 (h!35569 (_ BitVec 64)) (t!48909 List!34223)) )
))
(declare-fun arrayNoDuplicates!0 (array!98710 (_ BitVec 32) List!34223) Bool)

(assert (=> b!1463657 (= res!992938 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34220))))

(declare-fun b!1463658 () Bool)

(assert (=> b!1463658 (= e!822585 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640663 lt!640660 mask!2687) (seekEntryOrOpen!0 lt!640663 lt!640660 mask!2687)))))

(declare-fun b!1463659 () Bool)

(declare-fun res!992950 () Bool)

(assert (=> b!1463659 (=> res!992950 e!822586)))

(assert (=> b!1463659 (= res!992950 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640659 (select (arr!47644 a!2862) j!93) a!2862 mask!2687) lt!640662)))))

(declare-fun b!1463660 () Bool)

(declare-fun res!992939 () Bool)

(assert (=> b!1463660 (=> (not res!992939) (not e!822591))))

(assert (=> b!1463660 (= res!992939 (validKeyInArray!0 (select (arr!47644 a!2862) j!93)))))

(declare-fun b!1463661 () Bool)

(declare-fun res!992936 () Bool)

(assert (=> b!1463661 (=> (not res!992936) (not e!822589))))

(assert (=> b!1463661 (= res!992936 e!822585)))

(declare-fun c!134865 () Bool)

(assert (=> b!1463661 (= c!134865 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125284 res!992945) b!1463653))

(assert (= (and b!1463653 res!992940) b!1463651))

(assert (= (and b!1463651 res!992951) b!1463660))

(assert (= (and b!1463660 res!992939) b!1463642))

(assert (= (and b!1463642 res!992946) b!1463657))

(assert (= (and b!1463657 res!992938) b!1463643))

(assert (= (and b!1463643 res!992944) b!1463654))

(assert (= (and b!1463654 res!992949) b!1463656))

(assert (= (and b!1463656 res!992947) b!1463646))

(assert (= (and b!1463646 res!992948) b!1463645))

(assert (= (and b!1463645 res!992941) b!1463661))

(assert (= (and b!1463661 c!134865) b!1463644))

(assert (= (and b!1463661 (not c!134865)) b!1463658))

(assert (= (and b!1463661 res!992936) b!1463652))

(assert (= (and b!1463652 res!992943) b!1463648))

(assert (= (and b!1463648 res!992953) b!1463641))

(assert (= (and b!1463641 res!992937) b!1463649))

(assert (= (and b!1463648 (not res!992942)) b!1463650))

(assert (= (and b!1463650 (not res!992952)) b!1463659))

(assert (= (and b!1463659 (not res!992950)) b!1463640))

(assert (= (and b!1463640 c!134866) b!1463655))

(assert (= (and b!1463640 (not c!134866)) b!1463647))

(declare-fun m!1350447 () Bool)

(assert (=> b!1463660 m!1350447))

(assert (=> b!1463660 m!1350447))

(declare-fun m!1350449 () Bool)

(assert (=> b!1463660 m!1350449))

(declare-fun m!1350451 () Bool)

(assert (=> b!1463642 m!1350451))

(declare-fun m!1350453 () Bool)

(assert (=> b!1463647 m!1350453))

(declare-fun m!1350455 () Bool)

(assert (=> b!1463647 m!1350455))

(assert (=> b!1463656 m!1350447))

(assert (=> b!1463656 m!1350447))

(declare-fun m!1350457 () Bool)

(assert (=> b!1463656 m!1350457))

(assert (=> b!1463656 m!1350457))

(assert (=> b!1463656 m!1350447))

(declare-fun m!1350459 () Bool)

(assert (=> b!1463656 m!1350459))

(assert (=> b!1463659 m!1350447))

(assert (=> b!1463659 m!1350447))

(declare-fun m!1350461 () Bool)

(assert (=> b!1463659 m!1350461))

(declare-fun m!1350463 () Bool)

(assert (=> b!1463650 m!1350463))

(declare-fun m!1350465 () Bool)

(assert (=> start!125284 m!1350465))

(declare-fun m!1350467 () Bool)

(assert (=> start!125284 m!1350467))

(declare-fun m!1350469 () Bool)

(assert (=> b!1463658 m!1350469))

(assert (=> b!1463658 m!1350455))

(declare-fun m!1350471 () Bool)

(assert (=> b!1463645 m!1350471))

(assert (=> b!1463645 m!1350471))

(declare-fun m!1350473 () Bool)

(assert (=> b!1463645 m!1350473))

(declare-fun m!1350475 () Bool)

(assert (=> b!1463645 m!1350475))

(declare-fun m!1350477 () Bool)

(assert (=> b!1463645 m!1350477))

(declare-fun m!1350479 () Bool)

(assert (=> b!1463644 m!1350479))

(declare-fun m!1350481 () Bool)

(assert (=> b!1463655 m!1350481))

(assert (=> b!1463641 m!1350447))

(assert (=> b!1463641 m!1350447))

(declare-fun m!1350483 () Bool)

(assert (=> b!1463641 m!1350483))

(declare-fun m!1350485 () Bool)

(assert (=> b!1463649 m!1350485))

(assert (=> b!1463649 m!1350447))

(declare-fun m!1350487 () Bool)

(assert (=> b!1463651 m!1350487))

(assert (=> b!1463651 m!1350487))

(declare-fun m!1350489 () Bool)

(assert (=> b!1463651 m!1350489))

(assert (=> b!1463646 m!1350447))

(assert (=> b!1463646 m!1350447))

(declare-fun m!1350491 () Bool)

(assert (=> b!1463646 m!1350491))

(declare-fun m!1350493 () Bool)

(assert (=> b!1463648 m!1350493))

(assert (=> b!1463648 m!1350475))

(declare-fun m!1350495 () Bool)

(assert (=> b!1463648 m!1350495))

(declare-fun m!1350497 () Bool)

(assert (=> b!1463648 m!1350497))

(declare-fun m!1350499 () Bool)

(assert (=> b!1463648 m!1350499))

(assert (=> b!1463648 m!1350447))

(declare-fun m!1350501 () Bool)

(assert (=> b!1463657 m!1350501))

(assert (=> b!1463654 m!1350475))

(declare-fun m!1350503 () Bool)

(assert (=> b!1463654 m!1350503))

(check-sat (not b!1463648) (not b!1463641) (not b!1463655) (not b!1463647) (not b!1463660) (not b!1463645) (not start!125284) (not b!1463656) (not b!1463658) (not b!1463642) (not b!1463650) (not b!1463644) (not b!1463651) (not b!1463657) (not b!1463646) (not b!1463659))
(check-sat)
