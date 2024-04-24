; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129224 () Bool)

(assert start!129224)

(declare-fun b!1513035 () Bool)

(declare-fun res!1031770 () Bool)

(declare-fun e!844873 () Bool)

(assert (=> b!1513035 (=> (not res!1031770) (not e!844873))))

(declare-datatypes ((array!100894 0))(
  ( (array!100895 (arr!48679 (Array (_ BitVec 32) (_ BitVec 64))) (size!49230 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100894)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100894 (_ BitVec 32)) Bool)

(assert (=> b!1513035 (= res!1031770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513036 () Bool)

(declare-fun res!1031764 () Bool)

(declare-fun e!844875 () Bool)

(assert (=> b!1513036 (=> (not res!1031764) (not e!844875))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12743 0))(
  ( (MissingZero!12743 (index!53367 (_ BitVec 32))) (Found!12743 (index!53368 (_ BitVec 32))) (Intermediate!12743 (undefined!13555 Bool) (index!53369 (_ BitVec 32)) (x!135306 (_ BitVec 32))) (Undefined!12743) (MissingVacant!12743 (index!53370 (_ BitVec 32))) )
))
(declare-fun lt!656039 () SeekEntryResult!12743)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100894 (_ BitVec 32)) SeekEntryResult!12743)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513036 (= res!1031764 (= lt!656039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48679 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48679 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100895 (store (arr!48679 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49230 a!2804)) mask!2512)))))

(declare-fun b!1513037 () Bool)

(declare-fun res!1031768 () Bool)

(assert (=> b!1513037 (=> (not res!1031768) (not e!844873))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513037 (= res!1031768 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49230 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49230 a!2804))))))

(declare-fun b!1513038 () Bool)

(declare-fun res!1031761 () Bool)

(assert (=> b!1513038 (=> (not res!1031761) (not e!844875))))

(declare-fun lt!656040 () SeekEntryResult!12743)

(assert (=> b!1513038 (= res!1031761 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48679 a!2804) j!70) a!2804 mask!2512) lt!656040))))

(declare-fun b!1513039 () Bool)

(assert (=> b!1513039 (= e!844875 (not true))))

(declare-fun e!844872 () Bool)

(assert (=> b!1513039 e!844872))

(declare-fun res!1031763 () Bool)

(assert (=> b!1513039 (=> (not res!1031763) (not e!844872))))

(assert (=> b!1513039 (= res!1031763 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50389 0))(
  ( (Unit!50390) )
))
(declare-fun lt!656041 () Unit!50389)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50389)

(assert (=> b!1513039 (= lt!656041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513040 () Bool)

(declare-fun res!1031769 () Bool)

(assert (=> b!1513040 (=> (not res!1031769) (not e!844873))))

(declare-datatypes ((List!35149 0))(
  ( (Nil!35146) (Cons!35145 (h!36572 (_ BitVec 64)) (t!49835 List!35149)) )
))
(declare-fun arrayNoDuplicates!0 (array!100894 (_ BitVec 32) List!35149) Bool)

(assert (=> b!1513040 (= res!1031769 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35146))))

(declare-fun b!1513041 () Bool)

(assert (=> b!1513041 (= e!844873 e!844875)))

(declare-fun res!1031767 () Bool)

(assert (=> b!1513041 (=> (not res!1031767) (not e!844875))))

(assert (=> b!1513041 (= res!1031767 (= lt!656039 lt!656040))))

(assert (=> b!1513041 (= lt!656040 (Intermediate!12743 false resIndex!21 resX!21))))

(assert (=> b!1513041 (= lt!656039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48679 a!2804) j!70) mask!2512) (select (arr!48679 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513042 () Bool)

(declare-fun res!1031762 () Bool)

(assert (=> b!1513042 (=> (not res!1031762) (not e!844873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513042 (= res!1031762 (validKeyInArray!0 (select (arr!48679 a!2804) i!961)))))

(declare-fun b!1513043 () Bool)

(declare-fun res!1031765 () Bool)

(assert (=> b!1513043 (=> (not res!1031765) (not e!844873))))

(assert (=> b!1513043 (= res!1031765 (validKeyInArray!0 (select (arr!48679 a!2804) j!70)))))

(declare-fun b!1513044 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100894 (_ BitVec 32)) SeekEntryResult!12743)

(assert (=> b!1513044 (= e!844872 (= (seekEntry!0 (select (arr!48679 a!2804) j!70) a!2804 mask!2512) (Found!12743 j!70)))))

(declare-fun res!1031766 () Bool)

(assert (=> start!129224 (=> (not res!1031766) (not e!844873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129224 (= res!1031766 (validMask!0 mask!2512))))

(assert (=> start!129224 e!844873))

(assert (=> start!129224 true))

(declare-fun array_inv!37960 (array!100894) Bool)

(assert (=> start!129224 (array_inv!37960 a!2804)))

(declare-fun b!1513045 () Bool)

(declare-fun res!1031771 () Bool)

(assert (=> b!1513045 (=> (not res!1031771) (not e!844873))))

(assert (=> b!1513045 (= res!1031771 (and (= (size!49230 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49230 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49230 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129224 res!1031766) b!1513045))

(assert (= (and b!1513045 res!1031771) b!1513042))

(assert (= (and b!1513042 res!1031762) b!1513043))

(assert (= (and b!1513043 res!1031765) b!1513035))

(assert (= (and b!1513035 res!1031770) b!1513040))

(assert (= (and b!1513040 res!1031769) b!1513037))

(assert (= (and b!1513037 res!1031768) b!1513041))

(assert (= (and b!1513041 res!1031767) b!1513038))

(assert (= (and b!1513038 res!1031761) b!1513036))

(assert (= (and b!1513036 res!1031764) b!1513039))

(assert (= (and b!1513039 res!1031763) b!1513044))

(declare-fun m!1395675 () Bool)

(assert (=> start!129224 m!1395675))

(declare-fun m!1395677 () Bool)

(assert (=> start!129224 m!1395677))

(declare-fun m!1395679 () Bool)

(assert (=> b!1513044 m!1395679))

(assert (=> b!1513044 m!1395679))

(declare-fun m!1395681 () Bool)

(assert (=> b!1513044 m!1395681))

(assert (=> b!1513041 m!1395679))

(assert (=> b!1513041 m!1395679))

(declare-fun m!1395683 () Bool)

(assert (=> b!1513041 m!1395683))

(assert (=> b!1513041 m!1395683))

(assert (=> b!1513041 m!1395679))

(declare-fun m!1395685 () Bool)

(assert (=> b!1513041 m!1395685))

(declare-fun m!1395687 () Bool)

(assert (=> b!1513039 m!1395687))

(declare-fun m!1395689 () Bool)

(assert (=> b!1513039 m!1395689))

(declare-fun m!1395691 () Bool)

(assert (=> b!1513036 m!1395691))

(declare-fun m!1395693 () Bool)

(assert (=> b!1513036 m!1395693))

(assert (=> b!1513036 m!1395693))

(declare-fun m!1395695 () Bool)

(assert (=> b!1513036 m!1395695))

(assert (=> b!1513036 m!1395695))

(assert (=> b!1513036 m!1395693))

(declare-fun m!1395697 () Bool)

(assert (=> b!1513036 m!1395697))

(assert (=> b!1513043 m!1395679))

(assert (=> b!1513043 m!1395679))

(declare-fun m!1395699 () Bool)

(assert (=> b!1513043 m!1395699))

(declare-fun m!1395701 () Bool)

(assert (=> b!1513040 m!1395701))

(assert (=> b!1513038 m!1395679))

(assert (=> b!1513038 m!1395679))

(declare-fun m!1395703 () Bool)

(assert (=> b!1513038 m!1395703))

(declare-fun m!1395705 () Bool)

(assert (=> b!1513042 m!1395705))

(assert (=> b!1513042 m!1395705))

(declare-fun m!1395707 () Bool)

(assert (=> b!1513042 m!1395707))

(declare-fun m!1395709 () Bool)

(assert (=> b!1513035 m!1395709))

(check-sat (not b!1513042) (not b!1513035) (not b!1513039) (not b!1513036) (not b!1513044) (not start!129224) (not b!1513040) (not b!1513038) (not b!1513041) (not b!1513043))
(check-sat)
