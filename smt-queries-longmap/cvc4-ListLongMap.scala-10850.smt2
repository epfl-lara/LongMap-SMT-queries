; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127016 () Bool)

(assert start!127016)

(declare-fun b!1492843 () Bool)

(declare-fun e!836311 () Bool)

(declare-fun e!836312 () Bool)

(assert (=> b!1492843 (= e!836311 (not e!836312))))

(declare-fun res!1015634 () Bool)

(assert (=> b!1492843 (=> res!1015634 e!836312)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99726 0))(
  ( (array!99727 (arr!48133 (Array (_ BitVec 32) (_ BitVec 64))) (size!48683 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99726)

(assert (=> b!1492843 (= res!1015634 (or (and (= (select (arr!48133 a!2862) index!646) (select (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48133 a!2862) index!646) (select (arr!48133 a!2862) j!93))) (= (select (arr!48133 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836305 () Bool)

(assert (=> b!1492843 e!836305))

(declare-fun res!1015629 () Bool)

(assert (=> b!1492843 (=> (not res!1015629) (not e!836305))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99726 (_ BitVec 32)) Bool)

(assert (=> b!1492843 (= res!1015629 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50086 0))(
  ( (Unit!50087) )
))
(declare-fun lt!650790 () Unit!50086)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50086)

(assert (=> b!1492843 (= lt!650790 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492844 () Bool)

(declare-fun res!1015636 () Bool)

(declare-fun e!836310 () Bool)

(assert (=> b!1492844 (=> (not res!1015636) (not e!836310))))

(declare-datatypes ((List!34634 0))(
  ( (Nil!34631) (Cons!34630 (h!36016 (_ BitVec 64)) (t!49328 List!34634)) )
))
(declare-fun arrayNoDuplicates!0 (array!99726 (_ BitVec 32) List!34634) Bool)

(assert (=> b!1492844 (= res!1015636 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34631))))

(declare-fun res!1015630 () Bool)

(assert (=> start!127016 (=> (not res!1015630) (not e!836310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127016 (= res!1015630 (validMask!0 mask!2687))))

(assert (=> start!127016 e!836310))

(assert (=> start!127016 true))

(declare-fun array_inv!37161 (array!99726) Bool)

(assert (=> start!127016 (array_inv!37161 a!2862)))

(declare-fun b!1492845 () Bool)

(declare-fun e!836307 () Bool)

(assert (=> b!1492845 (= e!836307 e!836311)))

(declare-fun res!1015639 () Bool)

(assert (=> b!1492845 (=> (not res!1015639) (not e!836311))))

(declare-datatypes ((SeekEntryResult!12373 0))(
  ( (MissingZero!12373 (index!51884 (_ BitVec 32))) (Found!12373 (index!51885 (_ BitVec 32))) (Intermediate!12373 (undefined!13185 Bool) (index!51886 (_ BitVec 32)) (x!133473 (_ BitVec 32))) (Undefined!12373) (MissingVacant!12373 (index!51887 (_ BitVec 32))) )
))
(declare-fun lt!650789 () SeekEntryResult!12373)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492845 (= res!1015639 (= lt!650789 (Intermediate!12373 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650788 () array!99726)

(declare-fun lt!650785 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99726 (_ BitVec 32)) SeekEntryResult!12373)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492845 (= lt!650789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650785 mask!2687) lt!650785 lt!650788 mask!2687))))

(assert (=> b!1492845 (= lt!650785 (select (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492846 () Bool)

(declare-fun res!1015637 () Bool)

(assert (=> b!1492846 (=> (not res!1015637) (not e!836311))))

(declare-fun e!836306 () Bool)

(assert (=> b!1492846 (= res!1015637 e!836306)))

(declare-fun c!138138 () Bool)

(assert (=> b!1492846 (= c!138138 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492847 () Bool)

(declare-fun res!1015638 () Bool)

(assert (=> b!1492847 (=> (not res!1015638) (not e!836310))))

(assert (=> b!1492847 (= res!1015638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492848 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99726 (_ BitVec 32)) SeekEntryResult!12373)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99726 (_ BitVec 32)) SeekEntryResult!12373)

(assert (=> b!1492848 (= e!836306 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650785 lt!650788 mask!2687) (seekEntryOrOpen!0 lt!650785 lt!650788 mask!2687)))))

(declare-fun b!1492849 () Bool)

(declare-fun res!1015625 () Bool)

(assert (=> b!1492849 (=> (not res!1015625) (not e!836307))))

(declare-fun lt!650786 () SeekEntryResult!12373)

(assert (=> b!1492849 (= res!1015625 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!650786))))

(declare-fun b!1492850 () Bool)

(assert (=> b!1492850 (= e!836312 true)))

(declare-fun lt!650787 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492850 (= lt!650787 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492851 () Bool)

(declare-fun res!1015635 () Bool)

(assert (=> b!1492851 (=> (not res!1015635) (not e!836310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492851 (= res!1015635 (validKeyInArray!0 (select (arr!48133 a!2862) j!93)))))

(declare-fun b!1492852 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1492852 (= e!836305 (or (= (select (arr!48133 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48133 a!2862) intermediateBeforeIndex!19) (select (arr!48133 a!2862) j!93))))))

(declare-fun b!1492853 () Bool)

(assert (=> b!1492853 (= e!836306 (= lt!650789 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650785 lt!650788 mask!2687)))))

(declare-fun b!1492854 () Bool)

(declare-fun res!1015632 () Bool)

(assert (=> b!1492854 (=> (not res!1015632) (not e!836311))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492854 (= res!1015632 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492855 () Bool)

(declare-fun res!1015627 () Bool)

(assert (=> b!1492855 (=> (not res!1015627) (not e!836310))))

(assert (=> b!1492855 (= res!1015627 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48683 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48683 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48683 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492856 () Bool)

(declare-fun e!836308 () Bool)

(assert (=> b!1492856 (= e!836308 e!836307)))

(declare-fun res!1015624 () Bool)

(assert (=> b!1492856 (=> (not res!1015624) (not e!836307))))

(assert (=> b!1492856 (= res!1015624 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48133 a!2862) j!93) mask!2687) (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!650786))))

(assert (=> b!1492856 (= lt!650786 (Intermediate!12373 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492857 () Bool)

(assert (=> b!1492857 (= e!836310 e!836308)))

(declare-fun res!1015626 () Bool)

(assert (=> b!1492857 (=> (not res!1015626) (not e!836308))))

(assert (=> b!1492857 (= res!1015626 (= (select (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492857 (= lt!650788 (array!99727 (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48683 a!2862)))))

(declare-fun b!1492858 () Bool)

(declare-fun res!1015633 () Bool)

(assert (=> b!1492858 (=> (not res!1015633) (not e!836310))))

(assert (=> b!1492858 (= res!1015633 (validKeyInArray!0 (select (arr!48133 a!2862) i!1006)))))

(declare-fun b!1492859 () Bool)

(declare-fun res!1015631 () Bool)

(assert (=> b!1492859 (=> (not res!1015631) (not e!836310))))

(assert (=> b!1492859 (= res!1015631 (and (= (size!48683 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48683 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48683 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492860 () Bool)

(declare-fun res!1015628 () Bool)

(assert (=> b!1492860 (=> (not res!1015628) (not e!836305))))

(assert (=> b!1492860 (= res!1015628 (= (seekEntryOrOpen!0 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) (Found!12373 j!93)))))

(assert (= (and start!127016 res!1015630) b!1492859))

(assert (= (and b!1492859 res!1015631) b!1492858))

(assert (= (and b!1492858 res!1015633) b!1492851))

(assert (= (and b!1492851 res!1015635) b!1492847))

(assert (= (and b!1492847 res!1015638) b!1492844))

(assert (= (and b!1492844 res!1015636) b!1492855))

(assert (= (and b!1492855 res!1015627) b!1492857))

(assert (= (and b!1492857 res!1015626) b!1492856))

(assert (= (and b!1492856 res!1015624) b!1492849))

(assert (= (and b!1492849 res!1015625) b!1492845))

(assert (= (and b!1492845 res!1015639) b!1492846))

(assert (= (and b!1492846 c!138138) b!1492853))

(assert (= (and b!1492846 (not c!138138)) b!1492848))

(assert (= (and b!1492846 res!1015637) b!1492854))

(assert (= (and b!1492854 res!1015632) b!1492843))

(assert (= (and b!1492843 res!1015629) b!1492860))

(assert (= (and b!1492860 res!1015628) b!1492852))

(assert (= (and b!1492843 (not res!1015634)) b!1492850))

(declare-fun m!1376781 () Bool)

(assert (=> b!1492857 m!1376781))

(declare-fun m!1376783 () Bool)

(assert (=> b!1492857 m!1376783))

(declare-fun m!1376785 () Bool)

(assert (=> b!1492853 m!1376785))

(declare-fun m!1376787 () Bool)

(assert (=> b!1492851 m!1376787))

(assert (=> b!1492851 m!1376787))

(declare-fun m!1376789 () Bool)

(assert (=> b!1492851 m!1376789))

(declare-fun m!1376791 () Bool)

(assert (=> b!1492845 m!1376791))

(assert (=> b!1492845 m!1376791))

(declare-fun m!1376793 () Bool)

(assert (=> b!1492845 m!1376793))

(assert (=> b!1492845 m!1376781))

(declare-fun m!1376795 () Bool)

(assert (=> b!1492845 m!1376795))

(declare-fun m!1376797 () Bool)

(assert (=> b!1492844 m!1376797))

(assert (=> b!1492860 m!1376787))

(assert (=> b!1492860 m!1376787))

(declare-fun m!1376799 () Bool)

(assert (=> b!1492860 m!1376799))

(declare-fun m!1376801 () Bool)

(assert (=> b!1492847 m!1376801))

(declare-fun m!1376803 () Bool)

(assert (=> b!1492850 m!1376803))

(assert (=> b!1492856 m!1376787))

(assert (=> b!1492856 m!1376787))

(declare-fun m!1376805 () Bool)

(assert (=> b!1492856 m!1376805))

(assert (=> b!1492856 m!1376805))

(assert (=> b!1492856 m!1376787))

(declare-fun m!1376807 () Bool)

(assert (=> b!1492856 m!1376807))

(declare-fun m!1376809 () Bool)

(assert (=> b!1492858 m!1376809))

(assert (=> b!1492858 m!1376809))

(declare-fun m!1376811 () Bool)

(assert (=> b!1492858 m!1376811))

(declare-fun m!1376813 () Bool)

(assert (=> b!1492852 m!1376813))

(assert (=> b!1492852 m!1376787))

(declare-fun m!1376815 () Bool)

(assert (=> start!127016 m!1376815))

(declare-fun m!1376817 () Bool)

(assert (=> start!127016 m!1376817))

(assert (=> b!1492849 m!1376787))

(assert (=> b!1492849 m!1376787))

(declare-fun m!1376819 () Bool)

(assert (=> b!1492849 m!1376819))

(declare-fun m!1376821 () Bool)

(assert (=> b!1492843 m!1376821))

(assert (=> b!1492843 m!1376781))

(declare-fun m!1376823 () Bool)

(assert (=> b!1492843 m!1376823))

(declare-fun m!1376825 () Bool)

(assert (=> b!1492843 m!1376825))

(declare-fun m!1376827 () Bool)

(assert (=> b!1492843 m!1376827))

(assert (=> b!1492843 m!1376787))

(declare-fun m!1376829 () Bool)

(assert (=> b!1492848 m!1376829))

(declare-fun m!1376831 () Bool)

(assert (=> b!1492848 m!1376831))

(push 1)

