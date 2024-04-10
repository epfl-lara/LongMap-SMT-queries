; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129100 () Bool)

(assert start!129100)

(declare-fun b!1514749 () Bool)

(declare-fun e!845325 () Bool)

(assert (=> b!1514749 (= e!845325 (not true))))

(declare-fun e!845328 () Bool)

(assert (=> b!1514749 e!845328))

(declare-fun res!1034658 () Bool)

(assert (=> b!1514749 (=> (not res!1034658) (not e!845328))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100956 0))(
  ( (array!100957 (arr!48715 (Array (_ BitVec 32) (_ BitVec 64))) (size!49265 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100956)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100956 (_ BitVec 32)) Bool)

(assert (=> b!1514749 (= res!1034658 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50640 0))(
  ( (Unit!50641) )
))
(declare-fun lt!656449 () Unit!50640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50640)

(assert (=> b!1514749 (= lt!656449 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514750 () Bool)

(declare-fun e!845326 () Bool)

(declare-fun e!845327 () Bool)

(assert (=> b!1514750 (= e!845326 e!845327)))

(declare-fun res!1034656 () Bool)

(assert (=> b!1514750 (=> (not res!1034656) (not e!845327))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12886 0))(
  ( (MissingZero!12886 (index!53939 (_ BitVec 32))) (Found!12886 (index!53940 (_ BitVec 32))) (Intermediate!12886 (undefined!13698 Bool) (index!53941 (_ BitVec 32)) (x!135644 (_ BitVec 32))) (Undefined!12886) (MissingVacant!12886 (index!53942 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100956 (_ BitVec 32)) SeekEntryResult!12886)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100956 (_ BitVec 32)) SeekEntryResult!12886)

(assert (=> b!1514750 (= res!1034656 (= (seekEntryOrOpen!0 (select (arr!48715 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48715 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514751 () Bool)

(declare-fun res!1034655 () Bool)

(declare-fun e!845329 () Bool)

(assert (=> b!1514751 (=> (not res!1034655) (not e!845329))))

(declare-fun lt!656448 () SeekEntryResult!12886)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100956 (_ BitVec 32)) SeekEntryResult!12886)

(assert (=> b!1514751 (= res!1034655 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48715 a!2804) j!70) a!2804 mask!2512) lt!656448))))

(declare-fun lt!656447 () array!100956)

(declare-fun lt!656445 () (_ BitVec 64))

(declare-fun b!1514752 () Bool)

(assert (=> b!1514752 (= e!845327 (= (seekEntryOrOpen!0 lt!656445 lt!656447 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656445 lt!656447 mask!2512)))))

(declare-fun b!1514753 () Bool)

(declare-fun res!1034659 () Bool)

(declare-fun e!845323 () Bool)

(assert (=> b!1514753 (=> (not res!1034659) (not e!845323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514753 (= res!1034659 (validKeyInArray!0 (select (arr!48715 a!2804) j!70)))))

(declare-fun b!1514754 () Bool)

(declare-fun res!1034660 () Bool)

(assert (=> b!1514754 (=> (not res!1034660) (not e!845323))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514754 (= res!1034660 (and (= (size!49265 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49265 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49265 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514755 () Bool)

(declare-fun res!1034664 () Bool)

(assert (=> b!1514755 (=> (not res!1034664) (not e!845323))))

(assert (=> b!1514755 (= res!1034664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514756 () Bool)

(declare-fun res!1034662 () Bool)

(assert (=> b!1514756 (=> (not res!1034662) (not e!845323))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514756 (= res!1034662 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49265 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49265 a!2804))))))

(declare-fun b!1514758 () Bool)

(declare-fun res!1034661 () Bool)

(assert (=> b!1514758 (=> (not res!1034661) (not e!845328))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100956 (_ BitVec 32)) SeekEntryResult!12886)

(assert (=> b!1514758 (= res!1034661 (= (seekEntry!0 (select (arr!48715 a!2804) j!70) a!2804 mask!2512) (Found!12886 j!70)))))

(declare-fun b!1514759 () Bool)

(assert (=> b!1514759 (= e!845329 e!845325)))

(declare-fun res!1034653 () Bool)

(assert (=> b!1514759 (=> (not res!1034653) (not e!845325))))

(declare-fun lt!656446 () SeekEntryResult!12886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514759 (= res!1034653 (= lt!656446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656445 mask!2512) lt!656445 lt!656447 mask!2512)))))

(assert (=> b!1514759 (= lt!656445 (select (store (arr!48715 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514759 (= lt!656447 (array!100957 (store (arr!48715 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49265 a!2804)))))

(declare-fun b!1514760 () Bool)

(declare-fun res!1034654 () Bool)

(assert (=> b!1514760 (=> (not res!1034654) (not e!845323))))

(assert (=> b!1514760 (= res!1034654 (validKeyInArray!0 (select (arr!48715 a!2804) i!961)))))

(declare-fun b!1514757 () Bool)

(assert (=> b!1514757 (= e!845328 e!845326)))

(declare-fun res!1034663 () Bool)

(assert (=> b!1514757 (=> res!1034663 e!845326)))

(assert (=> b!1514757 (= res!1034663 (or (not (= (select (arr!48715 a!2804) j!70) lt!656445)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48715 a!2804) index!487) (select (arr!48715 a!2804) j!70)) (not (= (select (arr!48715 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1034652 () Bool)

(assert (=> start!129100 (=> (not res!1034652) (not e!845323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129100 (= res!1034652 (validMask!0 mask!2512))))

(assert (=> start!129100 e!845323))

(assert (=> start!129100 true))

(declare-fun array_inv!37743 (array!100956) Bool)

(assert (=> start!129100 (array_inv!37743 a!2804)))

(declare-fun b!1514761 () Bool)

(assert (=> b!1514761 (= e!845323 e!845329)))

(declare-fun res!1034657 () Bool)

(assert (=> b!1514761 (=> (not res!1034657) (not e!845329))))

(assert (=> b!1514761 (= res!1034657 (= lt!656446 lt!656448))))

(assert (=> b!1514761 (= lt!656448 (Intermediate!12886 false resIndex!21 resX!21))))

(assert (=> b!1514761 (= lt!656446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48715 a!2804) j!70) mask!2512) (select (arr!48715 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514762 () Bool)

(declare-fun res!1034665 () Bool)

(assert (=> b!1514762 (=> (not res!1034665) (not e!845323))))

(declare-datatypes ((List!35198 0))(
  ( (Nil!35195) (Cons!35194 (h!36606 (_ BitVec 64)) (t!49892 List!35198)) )
))
(declare-fun arrayNoDuplicates!0 (array!100956 (_ BitVec 32) List!35198) Bool)

(assert (=> b!1514762 (= res!1034665 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35195))))

(assert (= (and start!129100 res!1034652) b!1514754))

(assert (= (and b!1514754 res!1034660) b!1514760))

(assert (= (and b!1514760 res!1034654) b!1514753))

(assert (= (and b!1514753 res!1034659) b!1514755))

(assert (= (and b!1514755 res!1034664) b!1514762))

(assert (= (and b!1514762 res!1034665) b!1514756))

(assert (= (and b!1514756 res!1034662) b!1514761))

(assert (= (and b!1514761 res!1034657) b!1514751))

(assert (= (and b!1514751 res!1034655) b!1514759))

(assert (= (and b!1514759 res!1034653) b!1514749))

(assert (= (and b!1514749 res!1034658) b!1514758))

(assert (= (and b!1514758 res!1034661) b!1514757))

(assert (= (and b!1514757 (not res!1034663)) b!1514750))

(assert (= (and b!1514750 res!1034656) b!1514752))

(declare-fun m!1397733 () Bool)

(assert (=> b!1514751 m!1397733))

(assert (=> b!1514751 m!1397733))

(declare-fun m!1397735 () Bool)

(assert (=> b!1514751 m!1397735))

(assert (=> b!1514757 m!1397733))

(declare-fun m!1397737 () Bool)

(assert (=> b!1514757 m!1397737))

(declare-fun m!1397739 () Bool)

(assert (=> b!1514755 m!1397739))

(declare-fun m!1397741 () Bool)

(assert (=> start!129100 m!1397741))

(declare-fun m!1397743 () Bool)

(assert (=> start!129100 m!1397743))

(assert (=> b!1514761 m!1397733))

(assert (=> b!1514761 m!1397733))

(declare-fun m!1397745 () Bool)

(assert (=> b!1514761 m!1397745))

(assert (=> b!1514761 m!1397745))

(assert (=> b!1514761 m!1397733))

(declare-fun m!1397747 () Bool)

(assert (=> b!1514761 m!1397747))

(declare-fun m!1397749 () Bool)

(assert (=> b!1514752 m!1397749))

(declare-fun m!1397751 () Bool)

(assert (=> b!1514752 m!1397751))

(declare-fun m!1397753 () Bool)

(assert (=> b!1514759 m!1397753))

(assert (=> b!1514759 m!1397753))

(declare-fun m!1397755 () Bool)

(assert (=> b!1514759 m!1397755))

(declare-fun m!1397757 () Bool)

(assert (=> b!1514759 m!1397757))

(declare-fun m!1397759 () Bool)

(assert (=> b!1514759 m!1397759))

(assert (=> b!1514753 m!1397733))

(assert (=> b!1514753 m!1397733))

(declare-fun m!1397761 () Bool)

(assert (=> b!1514753 m!1397761))

(declare-fun m!1397763 () Bool)

(assert (=> b!1514762 m!1397763))

(declare-fun m!1397765 () Bool)

(assert (=> b!1514749 m!1397765))

(declare-fun m!1397767 () Bool)

(assert (=> b!1514749 m!1397767))

(assert (=> b!1514750 m!1397733))

(assert (=> b!1514750 m!1397733))

(declare-fun m!1397769 () Bool)

(assert (=> b!1514750 m!1397769))

(assert (=> b!1514750 m!1397733))

(declare-fun m!1397771 () Bool)

(assert (=> b!1514750 m!1397771))

(assert (=> b!1514758 m!1397733))

(assert (=> b!1514758 m!1397733))

(declare-fun m!1397773 () Bool)

(assert (=> b!1514758 m!1397773))

(declare-fun m!1397775 () Bool)

(assert (=> b!1514760 m!1397775))

(assert (=> b!1514760 m!1397775))

(declare-fun m!1397777 () Bool)

(assert (=> b!1514760 m!1397777))

(push 1)

