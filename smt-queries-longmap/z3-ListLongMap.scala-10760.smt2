; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125880 () Bool)

(assert start!125880)

(declare-datatypes ((array!99157 0))(
  ( (array!99158 (arr!47862 (Array (_ BitVec 32) (_ BitVec 64))) (size!48412 (_ BitVec 32))) )
))
(declare-fun lt!643937 () array!99157)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!826847 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!643935 () (_ BitVec 64))

(declare-fun b!1473457 () Bool)

(declare-datatypes ((SeekEntryResult!12102 0))(
  ( (MissingZero!12102 (index!50800 (_ BitVec 32))) (Found!12102 (index!50801 (_ BitVec 32))) (Intermediate!12102 (undefined!12914 Bool) (index!50802 (_ BitVec 32)) (x!132386 (_ BitVec 32))) (Undefined!12102) (MissingVacant!12102 (index!50803 (_ BitVec 32))) )
))
(declare-fun lt!643934 () SeekEntryResult!12102)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99157 (_ BitVec 32)) SeekEntryResult!12102)

(assert (=> b!1473457 (= e!826847 (= lt!643934 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643935 lt!643937 mask!2687)))))

(declare-fun b!1473458 () Bool)

(declare-fun res!1000773 () Bool)

(declare-fun e!826845 () Bool)

(assert (=> b!1473458 (=> (not res!1000773) (not e!826845))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473458 (= res!1000773 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473459 () Bool)

(declare-fun res!1000785 () Bool)

(declare-fun e!826843 () Bool)

(assert (=> b!1473459 (=> (not res!1000785) (not e!826843))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun a!2862 () array!99157)

(assert (=> b!1473459 (= res!1000785 (and (= (size!48412 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48412 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48412 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473460 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!826850 () Bool)

(assert (=> b!1473460 (= e!826850 (or (= (select (arr!47862 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47862 a!2862) intermediateBeforeIndex!19) (select (arr!47862 a!2862) j!93))))))

(declare-fun b!1473461 () Bool)

(declare-fun e!826846 () Bool)

(declare-fun e!826848 () Bool)

(assert (=> b!1473461 (= e!826846 e!826848)))

(declare-fun res!1000777 () Bool)

(assert (=> b!1473461 (=> (not res!1000777) (not e!826848))))

(declare-fun lt!643936 () SeekEntryResult!12102)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473461 (= res!1000777 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47862 a!2862) j!93) mask!2687) (select (arr!47862 a!2862) j!93) a!2862 mask!2687) lt!643936))))

(assert (=> b!1473461 (= lt!643936 (Intermediate!12102 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473462 () Bool)

(assert (=> b!1473462 (= e!826843 e!826846)))

(declare-fun res!1000784 () Bool)

(assert (=> b!1473462 (=> (not res!1000784) (not e!826846))))

(assert (=> b!1473462 (= res!1000784 (= (select (store (arr!47862 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473462 (= lt!643937 (array!99158 (store (arr!47862 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48412 a!2862)))))

(declare-fun b!1473463 () Bool)

(declare-fun res!1000771 () Bool)

(assert (=> b!1473463 (=> (not res!1000771) (not e!826843))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473463 (= res!1000771 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48412 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48412 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48412 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473464 () Bool)

(declare-fun res!1000775 () Bool)

(assert (=> b!1473464 (=> (not res!1000775) (not e!826848))))

(assert (=> b!1473464 (= res!1000775 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47862 a!2862) j!93) a!2862 mask!2687) lt!643936))))

(declare-fun b!1473465 () Bool)

(declare-fun e!826844 () Bool)

(assert (=> b!1473465 (= e!826844 true)))

(declare-fun lt!643938 () SeekEntryResult!12102)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99157 (_ BitVec 32)) SeekEntryResult!12102)

(assert (=> b!1473465 (= lt!643938 (seekEntryOrOpen!0 lt!643935 lt!643937 mask!2687))))

(declare-fun b!1473466 () Bool)

(declare-fun res!1000779 () Bool)

(assert (=> b!1473466 (=> (not res!1000779) (not e!826843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473466 (= res!1000779 (validKeyInArray!0 (select (arr!47862 a!2862) i!1006)))))

(declare-fun b!1473467 () Bool)

(declare-fun res!1000772 () Bool)

(assert (=> b!1473467 (=> (not res!1000772) (not e!826843))))

(assert (=> b!1473467 (= res!1000772 (validKeyInArray!0 (select (arr!47862 a!2862) j!93)))))

(declare-fun b!1473468 () Bool)

(declare-fun res!1000774 () Bool)

(assert (=> b!1473468 (=> (not res!1000774) (not e!826845))))

(assert (=> b!1473468 (= res!1000774 e!826847)))

(declare-fun c!135858 () Bool)

(assert (=> b!1473468 (= c!135858 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473469 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99157 (_ BitVec 32)) SeekEntryResult!12102)

(assert (=> b!1473469 (= e!826847 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643935 lt!643937 mask!2687) (seekEntryOrOpen!0 lt!643935 lt!643937 mask!2687)))))

(declare-fun b!1473470 () Bool)

(declare-fun res!1000783 () Bool)

(assert (=> b!1473470 (=> (not res!1000783) (not e!826850))))

(assert (=> b!1473470 (= res!1000783 (= (seekEntryOrOpen!0 (select (arr!47862 a!2862) j!93) a!2862 mask!2687) (Found!12102 j!93)))))

(declare-fun b!1473471 () Bool)

(assert (=> b!1473471 (= e!826845 (not e!826844))))

(declare-fun res!1000776 () Bool)

(assert (=> b!1473471 (=> res!1000776 e!826844)))

(assert (=> b!1473471 (= res!1000776 (or (not (= (select (arr!47862 a!2862) index!646) (select (store (arr!47862 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47862 a!2862) index!646) (select (arr!47862 a!2862) j!93)))))))

(assert (=> b!1473471 e!826850))

(declare-fun res!1000782 () Bool)

(assert (=> b!1473471 (=> (not res!1000782) (not e!826850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99157 (_ BitVec 32)) Bool)

(assert (=> b!1473471 (= res!1000782 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49544 0))(
  ( (Unit!49545) )
))
(declare-fun lt!643933 () Unit!49544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49544)

(assert (=> b!1473471 (= lt!643933 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473472 () Bool)

(assert (=> b!1473472 (= e!826848 e!826845)))

(declare-fun res!1000778 () Bool)

(assert (=> b!1473472 (=> (not res!1000778) (not e!826845))))

(assert (=> b!1473472 (= res!1000778 (= lt!643934 (Intermediate!12102 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473472 (= lt!643934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643935 mask!2687) lt!643935 lt!643937 mask!2687))))

(assert (=> b!1473472 (= lt!643935 (select (store (arr!47862 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1000786 () Bool)

(assert (=> start!125880 (=> (not res!1000786) (not e!826843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125880 (= res!1000786 (validMask!0 mask!2687))))

(assert (=> start!125880 e!826843))

(assert (=> start!125880 true))

(declare-fun array_inv!36890 (array!99157) Bool)

(assert (=> start!125880 (array_inv!36890 a!2862)))

(declare-fun b!1473473 () Bool)

(declare-fun res!1000781 () Bool)

(assert (=> b!1473473 (=> (not res!1000781) (not e!826843))))

(declare-datatypes ((List!34363 0))(
  ( (Nil!34360) (Cons!34359 (h!35718 (_ BitVec 64)) (t!49057 List!34363)) )
))
(declare-fun arrayNoDuplicates!0 (array!99157 (_ BitVec 32) List!34363) Bool)

(assert (=> b!1473473 (= res!1000781 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34360))))

(declare-fun b!1473474 () Bool)

(declare-fun res!1000780 () Bool)

(assert (=> b!1473474 (=> (not res!1000780) (not e!826843))))

(assert (=> b!1473474 (= res!1000780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125880 res!1000786) b!1473459))

(assert (= (and b!1473459 res!1000785) b!1473466))

(assert (= (and b!1473466 res!1000779) b!1473467))

(assert (= (and b!1473467 res!1000772) b!1473474))

(assert (= (and b!1473474 res!1000780) b!1473473))

(assert (= (and b!1473473 res!1000781) b!1473463))

(assert (= (and b!1473463 res!1000771) b!1473462))

(assert (= (and b!1473462 res!1000784) b!1473461))

(assert (= (and b!1473461 res!1000777) b!1473464))

(assert (= (and b!1473464 res!1000775) b!1473472))

(assert (= (and b!1473472 res!1000778) b!1473468))

(assert (= (and b!1473468 c!135858) b!1473457))

(assert (= (and b!1473468 (not c!135858)) b!1473469))

(assert (= (and b!1473468 res!1000774) b!1473458))

(assert (= (and b!1473458 res!1000773) b!1473471))

(assert (= (and b!1473471 res!1000782) b!1473470))

(assert (= (and b!1473470 res!1000783) b!1473460))

(assert (= (and b!1473471 (not res!1000776)) b!1473465))

(declare-fun m!1359981 () Bool)

(assert (=> b!1473469 m!1359981))

(declare-fun m!1359983 () Bool)

(assert (=> b!1473469 m!1359983))

(declare-fun m!1359985 () Bool)

(assert (=> b!1473471 m!1359985))

(declare-fun m!1359987 () Bool)

(assert (=> b!1473471 m!1359987))

(declare-fun m!1359989 () Bool)

(assert (=> b!1473471 m!1359989))

(declare-fun m!1359991 () Bool)

(assert (=> b!1473471 m!1359991))

(declare-fun m!1359993 () Bool)

(assert (=> b!1473471 m!1359993))

(declare-fun m!1359995 () Bool)

(assert (=> b!1473471 m!1359995))

(assert (=> b!1473464 m!1359995))

(assert (=> b!1473464 m!1359995))

(declare-fun m!1359997 () Bool)

(assert (=> b!1473464 m!1359997))

(declare-fun m!1359999 () Bool)

(assert (=> start!125880 m!1359999))

(declare-fun m!1360001 () Bool)

(assert (=> start!125880 m!1360001))

(declare-fun m!1360003 () Bool)

(assert (=> b!1473473 m!1360003))

(assert (=> b!1473465 m!1359983))

(declare-fun m!1360005 () Bool)

(assert (=> b!1473457 m!1360005))

(assert (=> b!1473461 m!1359995))

(assert (=> b!1473461 m!1359995))

(declare-fun m!1360007 () Bool)

(assert (=> b!1473461 m!1360007))

(assert (=> b!1473461 m!1360007))

(assert (=> b!1473461 m!1359995))

(declare-fun m!1360009 () Bool)

(assert (=> b!1473461 m!1360009))

(declare-fun m!1360011 () Bool)

(assert (=> b!1473466 m!1360011))

(assert (=> b!1473466 m!1360011))

(declare-fun m!1360013 () Bool)

(assert (=> b!1473466 m!1360013))

(assert (=> b!1473467 m!1359995))

(assert (=> b!1473467 m!1359995))

(declare-fun m!1360015 () Bool)

(assert (=> b!1473467 m!1360015))

(assert (=> b!1473470 m!1359995))

(assert (=> b!1473470 m!1359995))

(declare-fun m!1360017 () Bool)

(assert (=> b!1473470 m!1360017))

(declare-fun m!1360019 () Bool)

(assert (=> b!1473472 m!1360019))

(assert (=> b!1473472 m!1360019))

(declare-fun m!1360021 () Bool)

(assert (=> b!1473472 m!1360021))

(assert (=> b!1473472 m!1359987))

(declare-fun m!1360023 () Bool)

(assert (=> b!1473472 m!1360023))

(assert (=> b!1473462 m!1359987))

(declare-fun m!1360025 () Bool)

(assert (=> b!1473462 m!1360025))

(declare-fun m!1360027 () Bool)

(assert (=> b!1473460 m!1360027))

(assert (=> b!1473460 m!1359995))

(declare-fun m!1360029 () Bool)

(assert (=> b!1473474 m!1360029))

(check-sat (not b!1473473) (not b!1473457) (not b!1473469) (not b!1473467) (not b!1473464) (not b!1473471) (not b!1473461) (not b!1473470) (not b!1473474) (not start!125880) (not b!1473472) (not b!1473465) (not b!1473466))
(check-sat)
