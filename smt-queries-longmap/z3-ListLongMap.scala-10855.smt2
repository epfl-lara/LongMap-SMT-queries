; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127058 () Bool)

(assert start!127058)

(declare-fun b!1493557 () Bool)

(declare-fun res!1016227 () Bool)

(declare-fun e!836619 () Bool)

(assert (=> b!1493557 (=> (not res!1016227) (not e!836619))))

(declare-datatypes ((array!99703 0))(
  ( (array!99704 (arr!48121 (Array (_ BitVec 32) (_ BitVec 64))) (size!48673 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99703)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493557 (= res!1016227 (validKeyInArray!0 (select (arr!48121 a!2862) i!1006)))))

(declare-fun e!836614 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1493558 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1493558 (= e!836614 (or (= (select (arr!48121 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48121 a!2862) intermediateBeforeIndex!19) (select (arr!48121 a!2862) j!93))))))

(declare-fun b!1493560 () Bool)

(declare-fun e!836618 () Bool)

(assert (=> b!1493560 (= e!836618 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!650888 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493560 (= lt!650888 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!650885 () (_ BitVec 64))

(declare-fun e!836621 () Bool)

(declare-fun lt!650886 () array!99703)

(declare-fun b!1493561 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12386 0))(
  ( (MissingZero!12386 (index!51936 (_ BitVec 32))) (Found!12386 (index!51937 (_ BitVec 32))) (Intermediate!12386 (undefined!13198 Bool) (index!51938 (_ BitVec 32)) (x!133531 (_ BitVec 32))) (Undefined!12386) (MissingVacant!12386 (index!51939 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99703 (_ BitVec 32)) SeekEntryResult!12386)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99703 (_ BitVec 32)) SeekEntryResult!12386)

(assert (=> b!1493561 (= e!836621 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650885 lt!650886 mask!2687) (seekEntryOrOpen!0 lt!650885 lt!650886 mask!2687)))))

(declare-fun b!1493562 () Bool)

(declare-fun res!1016223 () Bool)

(assert (=> b!1493562 (=> (not res!1016223) (not e!836619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99703 (_ BitVec 32)) Bool)

(assert (=> b!1493562 (= res!1016223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493563 () Bool)

(declare-fun res!1016219 () Bool)

(assert (=> b!1493563 (=> (not res!1016219) (not e!836619))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493563 (= res!1016219 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48673 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48673 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48673 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493564 () Bool)

(declare-fun res!1016221 () Bool)

(assert (=> b!1493564 (=> (not res!1016221) (not e!836619))))

(assert (=> b!1493564 (= res!1016221 (and (= (size!48673 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48673 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48673 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493565 () Bool)

(declare-fun res!1016216 () Bool)

(assert (=> b!1493565 (=> (not res!1016216) (not e!836614))))

(assert (=> b!1493565 (= res!1016216 (= (seekEntryOrOpen!0 (select (arr!48121 a!2862) j!93) a!2862 mask!2687) (Found!12386 j!93)))))

(declare-fun b!1493566 () Bool)

(declare-fun e!836616 () Bool)

(assert (=> b!1493566 (= e!836616 (not e!836618))))

(declare-fun res!1016212 () Bool)

(assert (=> b!1493566 (=> res!1016212 e!836618)))

(assert (=> b!1493566 (= res!1016212 (or (and (= (select (arr!48121 a!2862) index!646) (select (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48121 a!2862) index!646) (select (arr!48121 a!2862) j!93))) (= (select (arr!48121 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493566 e!836614))

(declare-fun res!1016225 () Bool)

(assert (=> b!1493566 (=> (not res!1016225) (not e!836614))))

(assert (=> b!1493566 (= res!1016225 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49953 0))(
  ( (Unit!49954) )
))
(declare-fun lt!650884 () Unit!49953)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49953)

(assert (=> b!1493566 (= lt!650884 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493567 () Bool)

(declare-fun e!836617 () Bool)

(assert (=> b!1493567 (= e!836619 e!836617)))

(declare-fun res!1016220 () Bool)

(assert (=> b!1493567 (=> (not res!1016220) (not e!836617))))

(assert (=> b!1493567 (= res!1016220 (= (select (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493567 (= lt!650886 (array!99704 (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48673 a!2862)))))

(declare-fun b!1493568 () Bool)

(declare-fun res!1016224 () Bool)

(assert (=> b!1493568 (=> (not res!1016224) (not e!836616))))

(assert (=> b!1493568 (= res!1016224 e!836621)))

(declare-fun c!138205 () Bool)

(assert (=> b!1493568 (= c!138205 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1016218 () Bool)

(assert (=> start!127058 (=> (not res!1016218) (not e!836619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127058 (= res!1016218 (validMask!0 mask!2687))))

(assert (=> start!127058 e!836619))

(assert (=> start!127058 true))

(declare-fun array_inv!37354 (array!99703) Bool)

(assert (=> start!127058 (array_inv!37354 a!2862)))

(declare-fun b!1493559 () Bool)

(declare-fun res!1016213 () Bool)

(assert (=> b!1493559 (=> (not res!1016213) (not e!836619))))

(assert (=> b!1493559 (= res!1016213 (validKeyInArray!0 (select (arr!48121 a!2862) j!93)))))

(declare-fun b!1493569 () Bool)

(declare-fun lt!650883 () SeekEntryResult!12386)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99703 (_ BitVec 32)) SeekEntryResult!12386)

(assert (=> b!1493569 (= e!836621 (= lt!650883 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650885 lt!650886 mask!2687)))))

(declare-fun b!1493570 () Bool)

(declare-fun res!1016215 () Bool)

(declare-fun e!836615 () Bool)

(assert (=> b!1493570 (=> (not res!1016215) (not e!836615))))

(declare-fun lt!650887 () SeekEntryResult!12386)

(assert (=> b!1493570 (= res!1016215 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48121 a!2862) j!93) a!2862 mask!2687) lt!650887))))

(declare-fun b!1493571 () Bool)

(assert (=> b!1493571 (= e!836617 e!836615)))

(declare-fun res!1016226 () Bool)

(assert (=> b!1493571 (=> (not res!1016226) (not e!836615))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493571 (= res!1016226 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48121 a!2862) j!93) mask!2687) (select (arr!48121 a!2862) j!93) a!2862 mask!2687) lt!650887))))

(assert (=> b!1493571 (= lt!650887 (Intermediate!12386 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493572 () Bool)

(declare-fun res!1016217 () Bool)

(assert (=> b!1493572 (=> (not res!1016217) (not e!836616))))

(assert (=> b!1493572 (= res!1016217 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493573 () Bool)

(declare-fun res!1016214 () Bool)

(assert (=> b!1493573 (=> (not res!1016214) (not e!836619))))

(declare-datatypes ((List!34700 0))(
  ( (Nil!34697) (Cons!34696 (h!36085 (_ BitVec 64)) (t!49386 List!34700)) )
))
(declare-fun arrayNoDuplicates!0 (array!99703 (_ BitVec 32) List!34700) Bool)

(assert (=> b!1493573 (= res!1016214 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34697))))

(declare-fun b!1493574 () Bool)

(assert (=> b!1493574 (= e!836615 e!836616)))

(declare-fun res!1016222 () Bool)

(assert (=> b!1493574 (=> (not res!1016222) (not e!836616))))

(assert (=> b!1493574 (= res!1016222 (= lt!650883 (Intermediate!12386 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493574 (= lt!650883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650885 mask!2687) lt!650885 lt!650886 mask!2687))))

(assert (=> b!1493574 (= lt!650885 (select (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!127058 res!1016218) b!1493564))

(assert (= (and b!1493564 res!1016221) b!1493557))

(assert (= (and b!1493557 res!1016227) b!1493559))

(assert (= (and b!1493559 res!1016213) b!1493562))

(assert (= (and b!1493562 res!1016223) b!1493573))

(assert (= (and b!1493573 res!1016214) b!1493563))

(assert (= (and b!1493563 res!1016219) b!1493567))

(assert (= (and b!1493567 res!1016220) b!1493571))

(assert (= (and b!1493571 res!1016226) b!1493570))

(assert (= (and b!1493570 res!1016215) b!1493574))

(assert (= (and b!1493574 res!1016222) b!1493568))

(assert (= (and b!1493568 c!138205) b!1493569))

(assert (= (and b!1493568 (not c!138205)) b!1493561))

(assert (= (and b!1493568 res!1016224) b!1493572))

(assert (= (and b!1493572 res!1016217) b!1493566))

(assert (= (and b!1493566 res!1016225) b!1493565))

(assert (= (and b!1493565 res!1016216) b!1493558))

(assert (= (and b!1493566 (not res!1016212)) b!1493560))

(declare-fun m!1376787 () Bool)

(assert (=> b!1493565 m!1376787))

(assert (=> b!1493565 m!1376787))

(declare-fun m!1376789 () Bool)

(assert (=> b!1493565 m!1376789))

(declare-fun m!1376791 () Bool)

(assert (=> b!1493557 m!1376791))

(assert (=> b!1493557 m!1376791))

(declare-fun m!1376793 () Bool)

(assert (=> b!1493557 m!1376793))

(declare-fun m!1376795 () Bool)

(assert (=> b!1493558 m!1376795))

(assert (=> b!1493558 m!1376787))

(declare-fun m!1376797 () Bool)

(assert (=> b!1493567 m!1376797))

(declare-fun m!1376799 () Bool)

(assert (=> b!1493567 m!1376799))

(declare-fun m!1376801 () Bool)

(assert (=> b!1493560 m!1376801))

(declare-fun m!1376803 () Bool)

(assert (=> b!1493566 m!1376803))

(assert (=> b!1493566 m!1376797))

(declare-fun m!1376805 () Bool)

(assert (=> b!1493566 m!1376805))

(declare-fun m!1376807 () Bool)

(assert (=> b!1493566 m!1376807))

(declare-fun m!1376809 () Bool)

(assert (=> b!1493566 m!1376809))

(assert (=> b!1493566 m!1376787))

(declare-fun m!1376811 () Bool)

(assert (=> b!1493574 m!1376811))

(assert (=> b!1493574 m!1376811))

(declare-fun m!1376813 () Bool)

(assert (=> b!1493574 m!1376813))

(assert (=> b!1493574 m!1376797))

(declare-fun m!1376815 () Bool)

(assert (=> b!1493574 m!1376815))

(assert (=> b!1493559 m!1376787))

(assert (=> b!1493559 m!1376787))

(declare-fun m!1376817 () Bool)

(assert (=> b!1493559 m!1376817))

(assert (=> b!1493571 m!1376787))

(assert (=> b!1493571 m!1376787))

(declare-fun m!1376819 () Bool)

(assert (=> b!1493571 m!1376819))

(assert (=> b!1493571 m!1376819))

(assert (=> b!1493571 m!1376787))

(declare-fun m!1376821 () Bool)

(assert (=> b!1493571 m!1376821))

(declare-fun m!1376823 () Bool)

(assert (=> start!127058 m!1376823))

(declare-fun m!1376825 () Bool)

(assert (=> start!127058 m!1376825))

(declare-fun m!1376827 () Bool)

(assert (=> b!1493562 m!1376827))

(assert (=> b!1493570 m!1376787))

(assert (=> b!1493570 m!1376787))

(declare-fun m!1376829 () Bool)

(assert (=> b!1493570 m!1376829))

(declare-fun m!1376831 () Bool)

(assert (=> b!1493569 m!1376831))

(declare-fun m!1376833 () Bool)

(assert (=> b!1493561 m!1376833))

(declare-fun m!1376835 () Bool)

(assert (=> b!1493561 m!1376835))

(declare-fun m!1376837 () Bool)

(assert (=> b!1493573 m!1376837))

(check-sat (not b!1493573) (not b!1493569) (not b!1493562) (not b!1493559) (not b!1493561) (not b!1493571) (not b!1493560) (not b!1493557) (not b!1493566) (not b!1493574) (not b!1493570) (not b!1493565) (not start!127058))
(check-sat)
