; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125336 () Bool)

(assert start!125336)

(declare-fun b!1464561 () Bool)

(declare-fun res!993619 () Bool)

(declare-fun e!823037 () Bool)

(assert (=> b!1464561 (=> (not res!993619) (not e!823037))))

(declare-fun e!823034 () Bool)

(assert (=> b!1464561 (= res!993619 e!823034)))

(declare-fun c!134988 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464561 (= c!134988 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464562 () Bool)

(declare-fun e!823032 () Bool)

(assert (=> b!1464562 (= e!823037 (not e!823032))))

(declare-fun res!993609 () Bool)

(assert (=> b!1464562 (=> res!993609 e!823032)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98784 0))(
  ( (array!98785 (arr!47680 (Array (_ BitVec 32) (_ BitVec 64))) (size!48230 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98784)

(assert (=> b!1464562 (= res!993609 (or (and (= (select (arr!47680 a!2862) index!646) (select (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47680 a!2862) index!646) (select (arr!47680 a!2862) j!93))) (= (select (arr!47680 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823035 () Bool)

(assert (=> b!1464562 e!823035))

(declare-fun res!993611 () Bool)

(assert (=> b!1464562 (=> (not res!993611) (not e!823035))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98784 (_ BitVec 32)) Bool)

(assert (=> b!1464562 (= res!993611 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49360 0))(
  ( (Unit!49361) )
))
(declare-fun lt!641125 () Unit!49360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49360)

(assert (=> b!1464562 (= lt!641125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464563 () Bool)

(declare-fun res!993623 () Bool)

(declare-fun e!823038 () Bool)

(assert (=> b!1464563 (=> (not res!993623) (not e!823038))))

(assert (=> b!1464563 (= res!993623 (and (= (size!48230 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48230 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48230 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464564 () Bool)

(declare-fun e!823033 () Bool)

(assert (=> b!1464564 (= e!823033 true)))

(declare-fun lt!641130 () Bool)

(declare-fun e!823031 () Bool)

(assert (=> b!1464564 (= lt!641130 e!823031)))

(declare-fun c!134987 () Bool)

(assert (=> b!1464564 (= c!134987 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464565 () Bool)

(declare-fun res!993613 () Bool)

(assert (=> b!1464565 (=> (not res!993613) (not e!823035))))

(declare-datatypes ((SeekEntryResult!11932 0))(
  ( (MissingZero!11932 (index!50120 (_ BitVec 32))) (Found!11932 (index!50121 (_ BitVec 32))) (Intermediate!11932 (undefined!12744 Bool) (index!50122 (_ BitVec 32)) (x!131701 (_ BitVec 32))) (Undefined!11932) (MissingVacant!11932 (index!50123 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98784 (_ BitVec 32)) SeekEntryResult!11932)

(assert (=> b!1464565 (= res!993613 (= (seekEntryOrOpen!0 (select (arr!47680 a!2862) j!93) a!2862 mask!2687) (Found!11932 j!93)))))

(declare-fun b!1464566 () Bool)

(assert (=> b!1464566 (= e!823032 e!823033)))

(declare-fun res!993616 () Bool)

(assert (=> b!1464566 (=> res!993616 e!823033)))

(declare-fun lt!641127 () (_ BitVec 32))

(assert (=> b!1464566 (= res!993616 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641127 #b00000000000000000000000000000000) (bvsge lt!641127 (size!48230 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464566 (= lt!641127 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464568 () Bool)

(declare-fun res!993621 () Bool)

(assert (=> b!1464568 (=> res!993621 e!823033)))

(declare-fun lt!641128 () SeekEntryResult!11932)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98784 (_ BitVec 32)) SeekEntryResult!11932)

(assert (=> b!1464568 (= res!993621 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641127 (select (arr!47680 a!2862) j!93) a!2862 mask!2687) lt!641128)))))

(declare-fun b!1464569 () Bool)

(declare-fun res!993617 () Bool)

(assert (=> b!1464569 (=> (not res!993617) (not e!823038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464569 (= res!993617 (validKeyInArray!0 (select (arr!47680 a!2862) i!1006)))))

(declare-fun b!1464570 () Bool)

(declare-fun e!823040 () Bool)

(assert (=> b!1464570 (= e!823038 e!823040)))

(declare-fun res!993625 () Bool)

(assert (=> b!1464570 (=> (not res!993625) (not e!823040))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464570 (= res!993625 (= (select (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641129 () array!98784)

(assert (=> b!1464570 (= lt!641129 (array!98785 (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48230 a!2862)))))

(declare-fun lt!641124 () (_ BitVec 64))

(declare-fun b!1464571 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98784 (_ BitVec 32)) SeekEntryResult!11932)

(assert (=> b!1464571 (= e!823034 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641124 lt!641129 mask!2687) (seekEntryOrOpen!0 lt!641124 lt!641129 mask!2687)))))

(declare-fun b!1464572 () Bool)

(declare-fun res!993618 () Bool)

(assert (=> b!1464572 (=> (not res!993618) (not e!823038))))

(declare-datatypes ((List!34181 0))(
  ( (Nil!34178) (Cons!34177 (h!35527 (_ BitVec 64)) (t!48875 List!34181)) )
))
(declare-fun arrayNoDuplicates!0 (array!98784 (_ BitVec 32) List!34181) Bool)

(assert (=> b!1464572 (= res!993618 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34178))))

(declare-fun b!1464573 () Bool)

(declare-fun e!823039 () Bool)

(assert (=> b!1464573 (= e!823039 e!823037)))

(declare-fun res!993608 () Bool)

(assert (=> b!1464573 (=> (not res!993608) (not e!823037))))

(declare-fun lt!641126 () SeekEntryResult!11932)

(assert (=> b!1464573 (= res!993608 (= lt!641126 (Intermediate!11932 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464573 (= lt!641126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641124 mask!2687) lt!641124 lt!641129 mask!2687))))

(assert (=> b!1464573 (= lt!641124 (select (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464574 () Bool)

(declare-fun res!993610 () Bool)

(assert (=> b!1464574 (=> (not res!993610) (not e!823037))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464574 (= res!993610 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464575 () Bool)

(declare-fun res!993615 () Bool)

(assert (=> b!1464575 (=> (not res!993615) (not e!823038))))

(assert (=> b!1464575 (= res!993615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464576 () Bool)

(declare-fun res!993620 () Bool)

(assert (=> b!1464576 (=> (not res!993620) (not e!823038))))

(assert (=> b!1464576 (= res!993620 (validKeyInArray!0 (select (arr!47680 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1464577 () Bool)

(assert (=> b!1464577 (= e!823035 (or (= (select (arr!47680 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47680 a!2862) intermediateBeforeIndex!19) (select (arr!47680 a!2862) j!93))))))

(declare-fun b!1464578 () Bool)

(declare-fun res!993622 () Bool)

(assert (=> b!1464578 (=> (not res!993622) (not e!823039))))

(assert (=> b!1464578 (= res!993622 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47680 a!2862) j!93) a!2862 mask!2687) lt!641128))))

(declare-fun res!993624 () Bool)

(assert (=> start!125336 (=> (not res!993624) (not e!823038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125336 (= res!993624 (validMask!0 mask!2687))))

(assert (=> start!125336 e!823038))

(assert (=> start!125336 true))

(declare-fun array_inv!36708 (array!98784) Bool)

(assert (=> start!125336 (array_inv!36708 a!2862)))

(declare-fun b!1464567 () Bool)

(assert (=> b!1464567 (= e!823040 e!823039)))

(declare-fun res!993612 () Bool)

(assert (=> b!1464567 (=> (not res!993612) (not e!823039))))

(assert (=> b!1464567 (= res!993612 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47680 a!2862) j!93) mask!2687) (select (arr!47680 a!2862) j!93) a!2862 mask!2687) lt!641128))))

(assert (=> b!1464567 (= lt!641128 (Intermediate!11932 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464579 () Bool)

(declare-fun res!993614 () Bool)

(assert (=> b!1464579 (=> (not res!993614) (not e!823038))))

(assert (=> b!1464579 (= res!993614 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48230 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48230 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48230 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464580 () Bool)

(assert (=> b!1464580 (= e!823034 (= lt!641126 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641124 lt!641129 mask!2687)))))

(declare-fun b!1464581 () Bool)

(assert (=> b!1464581 (= e!823031 (not (= lt!641126 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641127 lt!641124 lt!641129 mask!2687))))))

(declare-fun b!1464582 () Bool)

(assert (=> b!1464582 (= e!823031 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641127 intermediateAfterIndex!19 lt!641124 lt!641129 mask!2687) (seekEntryOrOpen!0 lt!641124 lt!641129 mask!2687))))))

(assert (= (and start!125336 res!993624) b!1464563))

(assert (= (and b!1464563 res!993623) b!1464569))

(assert (= (and b!1464569 res!993617) b!1464576))

(assert (= (and b!1464576 res!993620) b!1464575))

(assert (= (and b!1464575 res!993615) b!1464572))

(assert (= (and b!1464572 res!993618) b!1464579))

(assert (= (and b!1464579 res!993614) b!1464570))

(assert (= (and b!1464570 res!993625) b!1464567))

(assert (= (and b!1464567 res!993612) b!1464578))

(assert (= (and b!1464578 res!993622) b!1464573))

(assert (= (and b!1464573 res!993608) b!1464561))

(assert (= (and b!1464561 c!134988) b!1464580))

(assert (= (and b!1464561 (not c!134988)) b!1464571))

(assert (= (and b!1464561 res!993619) b!1464574))

(assert (= (and b!1464574 res!993610) b!1464562))

(assert (= (and b!1464562 res!993611) b!1464565))

(assert (= (and b!1464565 res!993613) b!1464577))

(assert (= (and b!1464562 (not res!993609)) b!1464566))

(assert (= (and b!1464566 (not res!993616)) b!1464568))

(assert (= (and b!1464568 (not res!993621)) b!1464564))

(assert (= (and b!1464564 c!134987) b!1464581))

(assert (= (and b!1464564 (not c!134987)) b!1464582))

(declare-fun m!1351761 () Bool)

(assert (=> b!1464571 m!1351761))

(declare-fun m!1351763 () Bool)

(assert (=> b!1464571 m!1351763))

(declare-fun m!1351765 () Bool)

(assert (=> b!1464580 m!1351765))

(declare-fun m!1351767 () Bool)

(assert (=> b!1464562 m!1351767))

(declare-fun m!1351769 () Bool)

(assert (=> b!1464562 m!1351769))

(declare-fun m!1351771 () Bool)

(assert (=> b!1464562 m!1351771))

(declare-fun m!1351773 () Bool)

(assert (=> b!1464562 m!1351773))

(declare-fun m!1351775 () Bool)

(assert (=> b!1464562 m!1351775))

(declare-fun m!1351777 () Bool)

(assert (=> b!1464562 m!1351777))

(declare-fun m!1351779 () Bool)

(assert (=> b!1464566 m!1351779))

(assert (=> b!1464570 m!1351769))

(declare-fun m!1351781 () Bool)

(assert (=> b!1464570 m!1351781))

(declare-fun m!1351783 () Bool)

(assert (=> b!1464582 m!1351783))

(assert (=> b!1464582 m!1351763))

(assert (=> b!1464576 m!1351777))

(assert (=> b!1464576 m!1351777))

(declare-fun m!1351785 () Bool)

(assert (=> b!1464576 m!1351785))

(declare-fun m!1351787 () Bool)

(assert (=> b!1464573 m!1351787))

(assert (=> b!1464573 m!1351787))

(declare-fun m!1351789 () Bool)

(assert (=> b!1464573 m!1351789))

(assert (=> b!1464573 m!1351769))

(declare-fun m!1351791 () Bool)

(assert (=> b!1464573 m!1351791))

(assert (=> b!1464567 m!1351777))

(assert (=> b!1464567 m!1351777))

(declare-fun m!1351793 () Bool)

(assert (=> b!1464567 m!1351793))

(assert (=> b!1464567 m!1351793))

(assert (=> b!1464567 m!1351777))

(declare-fun m!1351795 () Bool)

(assert (=> b!1464567 m!1351795))

(declare-fun m!1351797 () Bool)

(assert (=> b!1464581 m!1351797))

(declare-fun m!1351799 () Bool)

(assert (=> b!1464577 m!1351799))

(assert (=> b!1464577 m!1351777))

(declare-fun m!1351801 () Bool)

(assert (=> b!1464572 m!1351801))

(assert (=> b!1464578 m!1351777))

(assert (=> b!1464578 m!1351777))

(declare-fun m!1351803 () Bool)

(assert (=> b!1464578 m!1351803))

(declare-fun m!1351805 () Bool)

(assert (=> b!1464569 m!1351805))

(assert (=> b!1464569 m!1351805))

(declare-fun m!1351807 () Bool)

(assert (=> b!1464569 m!1351807))

(declare-fun m!1351809 () Bool)

(assert (=> start!125336 m!1351809))

(declare-fun m!1351811 () Bool)

(assert (=> start!125336 m!1351811))

(declare-fun m!1351813 () Bool)

(assert (=> b!1464575 m!1351813))

(assert (=> b!1464565 m!1351777))

(assert (=> b!1464565 m!1351777))

(declare-fun m!1351815 () Bool)

(assert (=> b!1464565 m!1351815))

(assert (=> b!1464568 m!1351777))

(assert (=> b!1464568 m!1351777))

(declare-fun m!1351817 () Bool)

(assert (=> b!1464568 m!1351817))

(push 1)

