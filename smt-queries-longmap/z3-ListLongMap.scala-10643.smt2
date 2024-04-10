; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124998 () Bool)

(assert start!124998)

(declare-fun b!1453586 () Bool)

(declare-fun e!818144 () Bool)

(declare-fun e!818142 () Bool)

(assert (=> b!1453586 (= e!818144 e!818142)))

(declare-fun res!984588 () Bool)

(assert (=> b!1453586 (=> res!984588 e!818142)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!637287 () (_ BitVec 64))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98446 0))(
  ( (array!98447 (arr!47511 (Array (_ BitVec 32) (_ BitVec 64))) (size!48061 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98446)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1453586 (= res!984588 (or (and (= (select (arr!47511 a!2862) index!646) lt!637287) (= (select (arr!47511 a!2862) index!646) (select (arr!47511 a!2862) j!93))) (= (select (arr!47511 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453586 (= lt!637287 (select (store (arr!47511 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453587 () Bool)

(declare-fun e!818140 () Bool)

(declare-fun e!818139 () Bool)

(assert (=> b!1453587 (= e!818140 e!818139)))

(declare-fun res!984581 () Bool)

(assert (=> b!1453587 (=> (not res!984581) (not e!818139))))

(declare-datatypes ((SeekEntryResult!11763 0))(
  ( (MissingZero!11763 (index!49444 (_ BitVec 32))) (Found!11763 (index!49445 (_ BitVec 32))) (Intermediate!11763 (undefined!12575 Bool) (index!49446 (_ BitVec 32)) (x!131084 (_ BitVec 32))) (Undefined!11763) (MissingVacant!11763 (index!49447 (_ BitVec 32))) )
))
(declare-fun lt!637284 () SeekEntryResult!11763)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453587 (= res!984581 (= lt!637284 (Intermediate!11763 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637283 () array!98446)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637286 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98446 (_ BitVec 32)) SeekEntryResult!11763)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453587 (= lt!637284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637286 mask!2687) lt!637286 lt!637283 mask!2687))))

(assert (=> b!1453587 (= lt!637286 (select (store (arr!47511 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453588 () Bool)

(declare-fun res!984587 () Bool)

(declare-fun e!818138 () Bool)

(assert (=> b!1453588 (=> (not res!984587) (not e!818138))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453588 (= res!984587 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48061 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48061 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48061 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453589 () Bool)

(declare-fun e!818143 () Bool)

(assert (=> b!1453589 (= e!818138 e!818143)))

(declare-fun res!984591 () Bool)

(assert (=> b!1453589 (=> (not res!984591) (not e!818143))))

(assert (=> b!1453589 (= res!984591 (= (select (store (arr!47511 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453589 (= lt!637283 (array!98447 (store (arr!47511 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48061 a!2862)))))

(declare-fun b!1453590 () Bool)

(declare-fun res!984585 () Bool)

(assert (=> b!1453590 (=> (not res!984585) (not e!818138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453590 (= res!984585 (validKeyInArray!0 (select (arr!47511 a!2862) i!1006)))))

(declare-fun b!1453591 () Bool)

(declare-fun res!984594 () Bool)

(assert (=> b!1453591 (=> (not res!984594) (not e!818138))))

(declare-datatypes ((List!34012 0))(
  ( (Nil!34009) (Cons!34008 (h!35358 (_ BitVec 64)) (t!48706 List!34012)) )
))
(declare-fun arrayNoDuplicates!0 (array!98446 (_ BitVec 32) List!34012) Bool)

(assert (=> b!1453591 (= res!984594 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34009))))

(declare-fun b!1453592 () Bool)

(declare-fun e!818137 () Bool)

(assert (=> b!1453592 (= e!818137 (= lt!637284 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637286 lt!637283 mask!2687)))))

(declare-fun b!1453593 () Bool)

(assert (=> b!1453593 (= e!818143 e!818140)))

(declare-fun res!984595 () Bool)

(assert (=> b!1453593 (=> (not res!984595) (not e!818140))))

(declare-fun lt!637282 () SeekEntryResult!11763)

(assert (=> b!1453593 (= res!984595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47511 a!2862) j!93) mask!2687) (select (arr!47511 a!2862) j!93) a!2862 mask!2687) lt!637282))))

(assert (=> b!1453593 (= lt!637282 (Intermediate!11763 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!818136 () Bool)

(declare-fun b!1453594 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98446 (_ BitVec 32)) SeekEntryResult!11763)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98446 (_ BitVec 32)) SeekEntryResult!11763)

(assert (=> b!1453594 (= e!818136 (= (seekEntryOrOpen!0 lt!637286 lt!637283 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637286 lt!637283 mask!2687)))))

(declare-fun b!1453595 () Bool)

(declare-fun res!984593 () Bool)

(assert (=> b!1453595 (=> (not res!984593) (not e!818138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98446 (_ BitVec 32)) Bool)

(assert (=> b!1453595 (= res!984593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453596 () Bool)

(declare-fun res!984596 () Bool)

(assert (=> b!1453596 (=> (not res!984596) (not e!818139))))

(assert (=> b!1453596 (= res!984596 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453597 () Bool)

(declare-fun res!984597 () Bool)

(assert (=> b!1453597 (=> (not res!984597) (not e!818144))))

(assert (=> b!1453597 (= res!984597 (or (= (select (arr!47511 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47511 a!2862) intermediateBeforeIndex!19) (select (arr!47511 a!2862) j!93))))))

(declare-fun b!1453598 () Bool)

(declare-fun res!984583 () Bool)

(assert (=> b!1453598 (=> (not res!984583) (not e!818138))))

(assert (=> b!1453598 (= res!984583 (validKeyInArray!0 (select (arr!47511 a!2862) j!93)))))

(declare-fun b!1453599 () Bool)

(declare-fun res!984586 () Bool)

(assert (=> b!1453599 (=> (not res!984586) (not e!818139))))

(assert (=> b!1453599 (= res!984586 e!818137)))

(declare-fun c!134013 () Bool)

(assert (=> b!1453599 (= c!134013 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453600 () Bool)

(assert (=> b!1453600 (= e!818139 (not true))))

(assert (=> b!1453600 e!818144))

(declare-fun res!984584 () Bool)

(assert (=> b!1453600 (=> (not res!984584) (not e!818144))))

(assert (=> b!1453600 (= res!984584 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49022 0))(
  ( (Unit!49023) )
))
(declare-fun lt!637285 () Unit!49022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49022)

(assert (=> b!1453600 (= lt!637285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453601 () Bool)

(declare-fun res!984592 () Bool)

(assert (=> b!1453601 (=> (not res!984592) (not e!818138))))

(assert (=> b!1453601 (= res!984592 (and (= (size!48061 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48061 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48061 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453602 () Bool)

(declare-fun res!984589 () Bool)

(assert (=> b!1453602 (=> (not res!984589) (not e!818144))))

(assert (=> b!1453602 (= res!984589 (= (seekEntryOrOpen!0 (select (arr!47511 a!2862) j!93) a!2862 mask!2687) (Found!11763 j!93)))))

(declare-fun res!984590 () Bool)

(assert (=> start!124998 (=> (not res!984590) (not e!818138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124998 (= res!984590 (validMask!0 mask!2687))))

(assert (=> start!124998 e!818138))

(assert (=> start!124998 true))

(declare-fun array_inv!36539 (array!98446) Bool)

(assert (=> start!124998 (array_inv!36539 a!2862)))

(declare-fun b!1453603 () Bool)

(assert (=> b!1453603 (= e!818142 e!818136)))

(declare-fun res!984582 () Bool)

(assert (=> b!1453603 (=> (not res!984582) (not e!818136))))

(assert (=> b!1453603 (= res!984582 (and (= index!646 intermediateAfterIndex!19) (= lt!637287 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453604 () Bool)

(assert (=> b!1453604 (= e!818137 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637286 lt!637283 mask!2687) (seekEntryOrOpen!0 lt!637286 lt!637283 mask!2687)))))

(declare-fun b!1453605 () Bool)

(declare-fun res!984598 () Bool)

(assert (=> b!1453605 (=> (not res!984598) (not e!818140))))

(assert (=> b!1453605 (= res!984598 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47511 a!2862) j!93) a!2862 mask!2687) lt!637282))))

(assert (= (and start!124998 res!984590) b!1453601))

(assert (= (and b!1453601 res!984592) b!1453590))

(assert (= (and b!1453590 res!984585) b!1453598))

(assert (= (and b!1453598 res!984583) b!1453595))

(assert (= (and b!1453595 res!984593) b!1453591))

(assert (= (and b!1453591 res!984594) b!1453588))

(assert (= (and b!1453588 res!984587) b!1453589))

(assert (= (and b!1453589 res!984591) b!1453593))

(assert (= (and b!1453593 res!984595) b!1453605))

(assert (= (and b!1453605 res!984598) b!1453587))

(assert (= (and b!1453587 res!984581) b!1453599))

(assert (= (and b!1453599 c!134013) b!1453592))

(assert (= (and b!1453599 (not c!134013)) b!1453604))

(assert (= (and b!1453599 res!984586) b!1453596))

(assert (= (and b!1453596 res!984596) b!1453600))

(assert (= (and b!1453600 res!984584) b!1453602))

(assert (= (and b!1453602 res!984589) b!1453597))

(assert (= (and b!1453597 res!984597) b!1453586))

(assert (= (and b!1453586 (not res!984588)) b!1453603))

(assert (= (and b!1453603 res!984582) b!1453594))

(declare-fun m!1342041 () Bool)

(assert (=> b!1453605 m!1342041))

(assert (=> b!1453605 m!1342041))

(declare-fun m!1342043 () Bool)

(assert (=> b!1453605 m!1342043))

(declare-fun m!1342045 () Bool)

(assert (=> b!1453591 m!1342045))

(assert (=> b!1453593 m!1342041))

(assert (=> b!1453593 m!1342041))

(declare-fun m!1342047 () Bool)

(assert (=> b!1453593 m!1342047))

(assert (=> b!1453593 m!1342047))

(assert (=> b!1453593 m!1342041))

(declare-fun m!1342049 () Bool)

(assert (=> b!1453593 m!1342049))

(declare-fun m!1342051 () Bool)

(assert (=> b!1453590 m!1342051))

(assert (=> b!1453590 m!1342051))

(declare-fun m!1342053 () Bool)

(assert (=> b!1453590 m!1342053))

(declare-fun m!1342055 () Bool)

(assert (=> b!1453587 m!1342055))

(assert (=> b!1453587 m!1342055))

(declare-fun m!1342057 () Bool)

(assert (=> b!1453587 m!1342057))

(declare-fun m!1342059 () Bool)

(assert (=> b!1453587 m!1342059))

(declare-fun m!1342061 () Bool)

(assert (=> b!1453587 m!1342061))

(declare-fun m!1342063 () Bool)

(assert (=> b!1453594 m!1342063))

(declare-fun m!1342065 () Bool)

(assert (=> b!1453594 m!1342065))

(declare-fun m!1342067 () Bool)

(assert (=> b!1453600 m!1342067))

(declare-fun m!1342069 () Bool)

(assert (=> b!1453600 m!1342069))

(assert (=> b!1453598 m!1342041))

(assert (=> b!1453598 m!1342041))

(declare-fun m!1342071 () Bool)

(assert (=> b!1453598 m!1342071))

(assert (=> b!1453589 m!1342059))

(declare-fun m!1342073 () Bool)

(assert (=> b!1453589 m!1342073))

(declare-fun m!1342075 () Bool)

(assert (=> b!1453595 m!1342075))

(declare-fun m!1342077 () Bool)

(assert (=> b!1453592 m!1342077))

(assert (=> b!1453604 m!1342065))

(assert (=> b!1453604 m!1342063))

(declare-fun m!1342079 () Bool)

(assert (=> b!1453586 m!1342079))

(assert (=> b!1453586 m!1342041))

(assert (=> b!1453586 m!1342059))

(declare-fun m!1342081 () Bool)

(assert (=> b!1453586 m!1342081))

(assert (=> b!1453602 m!1342041))

(assert (=> b!1453602 m!1342041))

(declare-fun m!1342083 () Bool)

(assert (=> b!1453602 m!1342083))

(declare-fun m!1342085 () Bool)

(assert (=> b!1453597 m!1342085))

(assert (=> b!1453597 m!1342041))

(declare-fun m!1342087 () Bool)

(assert (=> start!124998 m!1342087))

(declare-fun m!1342089 () Bool)

(assert (=> start!124998 m!1342089))

(check-sat (not b!1453605) (not b!1453594) (not b!1453587) (not b!1453592) (not b!1453602) (not b!1453598) (not b!1453595) (not b!1453591) (not start!124998) (not b!1453600) (not b!1453593) (not b!1453604) (not b!1453590))
(check-sat)
