; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128844 () Bool)

(assert start!128844)

(declare-fun b!1509907 () Bool)

(declare-fun e!843259 () Bool)

(declare-fun e!843261 () Bool)

(assert (=> b!1509907 (= e!843259 e!843261)))

(declare-fun res!1029811 () Bool)

(assert (=> b!1509907 (=> (not res!1029811) (not e!843261))))

(declare-datatypes ((SeekEntryResult!12758 0))(
  ( (MissingZero!12758 (index!53427 (_ BitVec 32))) (Found!12758 (index!53428 (_ BitVec 32))) (Intermediate!12758 (undefined!13570 Bool) (index!53429 (_ BitVec 32)) (x!135180 (_ BitVec 32))) (Undefined!12758) (MissingVacant!12758 (index!53430 (_ BitVec 32))) )
))
(declare-fun lt!655025 () SeekEntryResult!12758)

(declare-fun lt!655027 () SeekEntryResult!12758)

(assert (=> b!1509907 (= res!1029811 (= lt!655025 lt!655027))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509907 (= lt!655027 (Intermediate!12758 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100700 0))(
  ( (array!100701 (arr!48587 (Array (_ BitVec 32) (_ BitVec 64))) (size!49137 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100700)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100700 (_ BitVec 32)) SeekEntryResult!12758)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509907 (= lt!655025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48587 a!2804) j!70) mask!2512) (select (arr!48587 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509908 () Bool)

(declare-fun res!1029812 () Bool)

(assert (=> b!1509908 (=> (not res!1029812) (not e!843261))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1509908 (= res!1029812 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48587 a!2804) j!70) a!2804 mask!2512) lt!655027))))

(declare-fun b!1509909 () Bool)

(declare-fun res!1029815 () Bool)

(assert (=> b!1509909 (=> (not res!1029815) (not e!843259))))

(assert (=> b!1509909 (= res!1029815 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49137 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49137 a!2804))))))

(declare-fun b!1509910 () Bool)

(declare-fun res!1029814 () Bool)

(assert (=> b!1509910 (=> (not res!1029814) (not e!843259))))

(declare-datatypes ((List!35070 0))(
  ( (Nil!35067) (Cons!35066 (h!36478 (_ BitVec 64)) (t!49764 List!35070)) )
))
(declare-fun arrayNoDuplicates!0 (array!100700 (_ BitVec 32) List!35070) Bool)

(assert (=> b!1509910 (= res!1029814 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35067))))

(declare-fun res!1029820 () Bool)

(assert (=> start!128844 (=> (not res!1029820) (not e!843259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128844 (= res!1029820 (validMask!0 mask!2512))))

(assert (=> start!128844 e!843259))

(assert (=> start!128844 true))

(declare-fun array_inv!37615 (array!100700) Bool)

(assert (=> start!128844 (array_inv!37615 a!2804)))

(declare-fun b!1509911 () Bool)

(declare-fun res!1029816 () Bool)

(assert (=> b!1509911 (=> (not res!1029816) (not e!843259))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509911 (= res!1029816 (and (= (size!49137 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49137 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49137 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509912 () Bool)

(declare-fun e!843260 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100700 (_ BitVec 32)) SeekEntryResult!12758)

(assert (=> b!1509912 (= e!843260 (= (seekEntry!0 (select (arr!48587 a!2804) j!70) a!2804 mask!2512) (Found!12758 j!70)))))

(declare-fun b!1509913 () Bool)

(declare-fun res!1029810 () Bool)

(assert (=> b!1509913 (=> (not res!1029810) (not e!843259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509913 (= res!1029810 (validKeyInArray!0 (select (arr!48587 a!2804) j!70)))))

(declare-fun b!1509914 () Bool)

(declare-fun res!1029813 () Bool)

(assert (=> b!1509914 (=> (not res!1029813) (not e!843259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100700 (_ BitVec 32)) Bool)

(assert (=> b!1509914 (= res!1029813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509915 () Bool)

(declare-fun res!1029818 () Bool)

(assert (=> b!1509915 (=> (not res!1029818) (not e!843261))))

(assert (=> b!1509915 (= res!1029818 (= lt!655025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48587 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48587 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100701 (store (arr!48587 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49137 a!2804)) mask!2512)))))

(declare-fun b!1509916 () Bool)

(assert (=> b!1509916 (= e!843261 (not true))))

(assert (=> b!1509916 e!843260))

(declare-fun res!1029817 () Bool)

(assert (=> b!1509916 (=> (not res!1029817) (not e!843260))))

(assert (=> b!1509916 (= res!1029817 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50384 0))(
  ( (Unit!50385) )
))
(declare-fun lt!655026 () Unit!50384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50384)

(assert (=> b!1509916 (= lt!655026 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509917 () Bool)

(declare-fun res!1029819 () Bool)

(assert (=> b!1509917 (=> (not res!1029819) (not e!843259))))

(assert (=> b!1509917 (= res!1029819 (validKeyInArray!0 (select (arr!48587 a!2804) i!961)))))

(assert (= (and start!128844 res!1029820) b!1509911))

(assert (= (and b!1509911 res!1029816) b!1509917))

(assert (= (and b!1509917 res!1029819) b!1509913))

(assert (= (and b!1509913 res!1029810) b!1509914))

(assert (= (and b!1509914 res!1029813) b!1509910))

(assert (= (and b!1509910 res!1029814) b!1509909))

(assert (= (and b!1509909 res!1029815) b!1509907))

(assert (= (and b!1509907 res!1029811) b!1509908))

(assert (= (and b!1509908 res!1029812) b!1509915))

(assert (= (and b!1509915 res!1029818) b!1509916))

(assert (= (and b!1509916 res!1029817) b!1509912))

(declare-fun m!1392439 () Bool)

(assert (=> b!1509910 m!1392439))

(declare-fun m!1392441 () Bool)

(assert (=> b!1509908 m!1392441))

(assert (=> b!1509908 m!1392441))

(declare-fun m!1392443 () Bool)

(assert (=> b!1509908 m!1392443))

(declare-fun m!1392445 () Bool)

(assert (=> b!1509916 m!1392445))

(declare-fun m!1392447 () Bool)

(assert (=> b!1509916 m!1392447))

(declare-fun m!1392449 () Bool)

(assert (=> b!1509915 m!1392449))

(declare-fun m!1392451 () Bool)

(assert (=> b!1509915 m!1392451))

(assert (=> b!1509915 m!1392451))

(declare-fun m!1392453 () Bool)

(assert (=> b!1509915 m!1392453))

(assert (=> b!1509915 m!1392453))

(assert (=> b!1509915 m!1392451))

(declare-fun m!1392455 () Bool)

(assert (=> b!1509915 m!1392455))

(declare-fun m!1392457 () Bool)

(assert (=> b!1509917 m!1392457))

(assert (=> b!1509917 m!1392457))

(declare-fun m!1392459 () Bool)

(assert (=> b!1509917 m!1392459))

(declare-fun m!1392461 () Bool)

(assert (=> b!1509914 m!1392461))

(assert (=> b!1509912 m!1392441))

(assert (=> b!1509912 m!1392441))

(declare-fun m!1392463 () Bool)

(assert (=> b!1509912 m!1392463))

(assert (=> b!1509913 m!1392441))

(assert (=> b!1509913 m!1392441))

(declare-fun m!1392465 () Bool)

(assert (=> b!1509913 m!1392465))

(assert (=> b!1509907 m!1392441))

(assert (=> b!1509907 m!1392441))

(declare-fun m!1392467 () Bool)

(assert (=> b!1509907 m!1392467))

(assert (=> b!1509907 m!1392467))

(assert (=> b!1509907 m!1392441))

(declare-fun m!1392469 () Bool)

(assert (=> b!1509907 m!1392469))

(declare-fun m!1392471 () Bool)

(assert (=> start!128844 m!1392471))

(declare-fun m!1392473 () Bool)

(assert (=> start!128844 m!1392473))

(push 1)

