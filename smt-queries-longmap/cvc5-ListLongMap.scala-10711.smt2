; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125404 () Bool)

(assert start!125404)

(declare-fun b!1466806 () Bool)

(declare-fun res!995449 () Bool)

(declare-fun e!824009 () Bool)

(assert (=> b!1466806 (=> (not res!995449) (not e!824009))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98852 0))(
  ( (array!98853 (arr!47714 (Array (_ BitVec 32) (_ BitVec 64))) (size!48264 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98852)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1466806 (= res!995449 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48264 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48264 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48264 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!641892 () array!98852)

(declare-fun e!824006 () Bool)

(declare-fun lt!641891 () (_ BitVec 32))

(declare-fun b!1466807 () Bool)

(declare-fun lt!641885 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11966 0))(
  ( (MissingZero!11966 (index!50256 (_ BitVec 32))) (Found!11966 (index!50257 (_ BitVec 32))) (Intermediate!11966 (undefined!12778 Bool) (index!50258 (_ BitVec 32)) (x!131831 (_ BitVec 32))) (Undefined!11966) (MissingVacant!11966 (index!50259 (_ BitVec 32))) )
))
(declare-fun lt!641886 () SeekEntryResult!11966)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98852 (_ BitVec 32)) SeekEntryResult!11966)

(assert (=> b!1466807 (= e!824006 (not (= lt!641886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641891 lt!641885 lt!641892 mask!2687))))))

(declare-fun b!1466808 () Bool)

(declare-fun e!824011 () Bool)

(declare-fun e!824004 () Bool)

(assert (=> b!1466808 (= e!824011 e!824004)))

(declare-fun res!995458 () Bool)

(assert (=> b!1466808 (=> res!995458 e!824004)))

(assert (=> b!1466808 (= res!995458 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641891 #b00000000000000000000000000000000) (bvsge lt!641891 (size!48264 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466808 (= lt!641891 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466809 () Bool)

(declare-fun res!995460 () Bool)

(assert (=> b!1466809 (=> (not res!995460) (not e!824009))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466809 (= res!995460 (validKeyInArray!0 (select (arr!47714 a!2862) i!1006)))))

(declare-fun b!1466810 () Bool)

(declare-fun e!824007 () Bool)

(assert (=> b!1466810 (= e!824007 (not e!824011))))

(declare-fun res!995459 () Bool)

(assert (=> b!1466810 (=> res!995459 e!824011)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1466810 (= res!995459 (or (and (= (select (arr!47714 a!2862) index!646) (select (store (arr!47714 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47714 a!2862) index!646) (select (arr!47714 a!2862) j!93))) (= (select (arr!47714 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!641888 () SeekEntryResult!11966)

(assert (=> b!1466810 (and (= lt!641888 (Found!11966 j!93)) (or (= (select (arr!47714 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47714 a!2862) intermediateBeforeIndex!19) (select (arr!47714 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98852 (_ BitVec 32)) SeekEntryResult!11966)

(assert (=> b!1466810 (= lt!641888 (seekEntryOrOpen!0 (select (arr!47714 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98852 (_ BitVec 32)) Bool)

(assert (=> b!1466810 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49428 0))(
  ( (Unit!49429) )
))
(declare-fun lt!641889 () Unit!49428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49428)

(assert (=> b!1466810 (= lt!641889 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466811 () Bool)

(declare-fun res!995453 () Bool)

(assert (=> b!1466811 (=> (not res!995453) (not e!824009))))

(declare-datatypes ((List!34215 0))(
  ( (Nil!34212) (Cons!34211 (h!35561 (_ BitVec 64)) (t!48909 List!34215)) )
))
(declare-fun arrayNoDuplicates!0 (array!98852 (_ BitVec 32) List!34215) Bool)

(assert (=> b!1466811 (= res!995453 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34212))))

(declare-fun b!1466812 () Bool)

(assert (=> b!1466812 (= e!824004 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1466812 (= lt!641888 (seekEntryOrOpen!0 lt!641885 lt!641892 mask!2687))))

(declare-fun lt!641887 () Unit!49428)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49428)

(assert (=> b!1466812 (= lt!641887 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641891 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466813 () Bool)

(declare-fun res!995461 () Bool)

(assert (=> b!1466813 (=> (not res!995461) (not e!824007))))

(declare-fun e!824008 () Bool)

(assert (=> b!1466813 (= res!995461 e!824008)))

(declare-fun c!135191 () Bool)

(assert (=> b!1466813 (= c!135191 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466814 () Bool)

(declare-fun e!824012 () Bool)

(assert (=> b!1466814 (= e!824009 e!824012)))

(declare-fun res!995450 () Bool)

(assert (=> b!1466814 (=> (not res!995450) (not e!824012))))

(assert (=> b!1466814 (= res!995450 (= (select (store (arr!47714 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466814 (= lt!641892 (array!98853 (store (arr!47714 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48264 a!2862)))))

(declare-fun b!1466815 () Bool)

(declare-fun res!995455 () Bool)

(assert (=> b!1466815 (=> (not res!995455) (not e!824009))))

(assert (=> b!1466815 (= res!995455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466816 () Bool)

(declare-fun res!995456 () Bool)

(assert (=> b!1466816 (=> (not res!995456) (not e!824007))))

(assert (=> b!1466816 (= res!995456 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466817 () Bool)

(declare-fun res!995454 () Bool)

(declare-fun e!824010 () Bool)

(assert (=> b!1466817 (=> (not res!995454) (not e!824010))))

(declare-fun lt!641890 () SeekEntryResult!11966)

(assert (=> b!1466817 (= res!995454 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47714 a!2862) j!93) a!2862 mask!2687) lt!641890))))

(declare-fun b!1466818 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98852 (_ BitVec 32)) SeekEntryResult!11966)

(assert (=> b!1466818 (= e!824006 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641891 intermediateAfterIndex!19 lt!641885 lt!641892 mask!2687) (seekEntryOrOpen!0 lt!641885 lt!641892 mask!2687))))))

(declare-fun b!1466819 () Bool)

(declare-fun res!995444 () Bool)

(assert (=> b!1466819 (=> res!995444 e!824004)))

(assert (=> b!1466819 (= res!995444 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466820 () Bool)

(declare-fun res!995448 () Bool)

(assert (=> b!1466820 (=> (not res!995448) (not e!824009))))

(assert (=> b!1466820 (= res!995448 (validKeyInArray!0 (select (arr!47714 a!2862) j!93)))))

(declare-fun b!1466805 () Bool)

(declare-fun res!995447 () Bool)

(assert (=> b!1466805 (=> res!995447 e!824004)))

(assert (=> b!1466805 (= res!995447 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641891 (select (arr!47714 a!2862) j!93) a!2862 mask!2687) lt!641890)))))

(declare-fun res!995446 () Bool)

(assert (=> start!125404 (=> (not res!995446) (not e!824009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125404 (= res!995446 (validMask!0 mask!2687))))

(assert (=> start!125404 e!824009))

(assert (=> start!125404 true))

(declare-fun array_inv!36742 (array!98852) Bool)

(assert (=> start!125404 (array_inv!36742 a!2862)))

(declare-fun b!1466821 () Bool)

(declare-fun res!995445 () Bool)

(assert (=> b!1466821 (=> res!995445 e!824004)))

(assert (=> b!1466821 (= res!995445 e!824006)))

(declare-fun c!135192 () Bool)

(assert (=> b!1466821 (= c!135192 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466822 () Bool)

(assert (=> b!1466822 (= e!824008 (= lt!641886 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641885 lt!641892 mask!2687)))))

(declare-fun b!1466823 () Bool)

(assert (=> b!1466823 (= e!824008 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641885 lt!641892 mask!2687) (seekEntryOrOpen!0 lt!641885 lt!641892 mask!2687)))))

(declare-fun b!1466824 () Bool)

(assert (=> b!1466824 (= e!824010 e!824007)))

(declare-fun res!995452 () Bool)

(assert (=> b!1466824 (=> (not res!995452) (not e!824007))))

(assert (=> b!1466824 (= res!995452 (= lt!641886 (Intermediate!11966 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466824 (= lt!641886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641885 mask!2687) lt!641885 lt!641892 mask!2687))))

(assert (=> b!1466824 (= lt!641885 (select (store (arr!47714 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466825 () Bool)

(assert (=> b!1466825 (= e!824012 e!824010)))

(declare-fun res!995451 () Bool)

(assert (=> b!1466825 (=> (not res!995451) (not e!824010))))

(assert (=> b!1466825 (= res!995451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47714 a!2862) j!93) mask!2687) (select (arr!47714 a!2862) j!93) a!2862 mask!2687) lt!641890))))

(assert (=> b!1466825 (= lt!641890 (Intermediate!11966 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466826 () Bool)

(declare-fun res!995457 () Bool)

(assert (=> b!1466826 (=> (not res!995457) (not e!824009))))

(assert (=> b!1466826 (= res!995457 (and (= (size!48264 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48264 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48264 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125404 res!995446) b!1466826))

(assert (= (and b!1466826 res!995457) b!1466809))

(assert (= (and b!1466809 res!995460) b!1466820))

(assert (= (and b!1466820 res!995448) b!1466815))

(assert (= (and b!1466815 res!995455) b!1466811))

(assert (= (and b!1466811 res!995453) b!1466806))

(assert (= (and b!1466806 res!995449) b!1466814))

(assert (= (and b!1466814 res!995450) b!1466825))

(assert (= (and b!1466825 res!995451) b!1466817))

(assert (= (and b!1466817 res!995454) b!1466824))

(assert (= (and b!1466824 res!995452) b!1466813))

(assert (= (and b!1466813 c!135191) b!1466822))

(assert (= (and b!1466813 (not c!135191)) b!1466823))

(assert (= (and b!1466813 res!995461) b!1466816))

(assert (= (and b!1466816 res!995456) b!1466810))

(assert (= (and b!1466810 (not res!995459)) b!1466808))

(assert (= (and b!1466808 (not res!995458)) b!1466805))

(assert (= (and b!1466805 (not res!995447)) b!1466821))

(assert (= (and b!1466821 c!135192) b!1466807))

(assert (= (and b!1466821 (not c!135192)) b!1466818))

(assert (= (and b!1466821 (not res!995445)) b!1466819))

(assert (= (and b!1466819 (not res!995444)) b!1466812))

(declare-fun m!1353763 () Bool)

(assert (=> b!1466810 m!1353763))

(declare-fun m!1353765 () Bool)

(assert (=> b!1466810 m!1353765))

(declare-fun m!1353767 () Bool)

(assert (=> b!1466810 m!1353767))

(declare-fun m!1353769 () Bool)

(assert (=> b!1466810 m!1353769))

(declare-fun m!1353771 () Bool)

(assert (=> b!1466810 m!1353771))

(declare-fun m!1353773 () Bool)

(assert (=> b!1466810 m!1353773))

(declare-fun m!1353775 () Bool)

(assert (=> b!1466810 m!1353775))

(declare-fun m!1353777 () Bool)

(assert (=> b!1466810 m!1353777))

(assert (=> b!1466810 m!1353773))

(declare-fun m!1353779 () Bool)

(assert (=> start!125404 m!1353779))

(declare-fun m!1353781 () Bool)

(assert (=> start!125404 m!1353781))

(declare-fun m!1353783 () Bool)

(assert (=> b!1466815 m!1353783))

(declare-fun m!1353785 () Bool)

(assert (=> b!1466823 m!1353785))

(declare-fun m!1353787 () Bool)

(assert (=> b!1466823 m!1353787))

(assert (=> b!1466820 m!1353773))

(assert (=> b!1466820 m!1353773))

(declare-fun m!1353789 () Bool)

(assert (=> b!1466820 m!1353789))

(declare-fun m!1353791 () Bool)

(assert (=> b!1466808 m!1353791))

(declare-fun m!1353793 () Bool)

(assert (=> b!1466824 m!1353793))

(assert (=> b!1466824 m!1353793))

(declare-fun m!1353795 () Bool)

(assert (=> b!1466824 m!1353795))

(assert (=> b!1466824 m!1353765))

(declare-fun m!1353797 () Bool)

(assert (=> b!1466824 m!1353797))

(assert (=> b!1466825 m!1353773))

(assert (=> b!1466825 m!1353773))

(declare-fun m!1353799 () Bool)

(assert (=> b!1466825 m!1353799))

(assert (=> b!1466825 m!1353799))

(assert (=> b!1466825 m!1353773))

(declare-fun m!1353801 () Bool)

(assert (=> b!1466825 m!1353801))

(declare-fun m!1353803 () Bool)

(assert (=> b!1466807 m!1353803))

(assert (=> b!1466812 m!1353787))

(declare-fun m!1353805 () Bool)

(assert (=> b!1466812 m!1353805))

(declare-fun m!1353807 () Bool)

(assert (=> b!1466818 m!1353807))

(assert (=> b!1466818 m!1353787))

(assert (=> b!1466805 m!1353773))

(assert (=> b!1466805 m!1353773))

(declare-fun m!1353809 () Bool)

(assert (=> b!1466805 m!1353809))

(declare-fun m!1353811 () Bool)

(assert (=> b!1466809 m!1353811))

(assert (=> b!1466809 m!1353811))

(declare-fun m!1353813 () Bool)

(assert (=> b!1466809 m!1353813))

(assert (=> b!1466814 m!1353765))

(declare-fun m!1353815 () Bool)

(assert (=> b!1466814 m!1353815))

(declare-fun m!1353817 () Bool)

(assert (=> b!1466811 m!1353817))

(assert (=> b!1466817 m!1353773))

(assert (=> b!1466817 m!1353773))

(declare-fun m!1353819 () Bool)

(assert (=> b!1466817 m!1353819))

(declare-fun m!1353821 () Bool)

(assert (=> b!1466822 m!1353821))

(push 1)

