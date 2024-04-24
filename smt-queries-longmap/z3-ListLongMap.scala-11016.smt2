; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129230 () Bool)

(assert start!129230)

(declare-fun b!1513134 () Bool)

(declare-fun e!844910 () Bool)

(declare-fun e!844911 () Bool)

(assert (=> b!1513134 (= e!844910 e!844911)))

(declare-fun res!1031863 () Bool)

(assert (=> b!1513134 (=> (not res!1031863) (not e!844911))))

(declare-datatypes ((SeekEntryResult!12746 0))(
  ( (MissingZero!12746 (index!53379 (_ BitVec 32))) (Found!12746 (index!53380 (_ BitVec 32))) (Intermediate!12746 (undefined!13558 Bool) (index!53381 (_ BitVec 32)) (x!135317 (_ BitVec 32))) (Undefined!12746) (MissingVacant!12746 (index!53382 (_ BitVec 32))) )
))
(declare-fun lt!656066 () SeekEntryResult!12746)

(declare-fun lt!656068 () SeekEntryResult!12746)

(assert (=> b!1513134 (= res!1031863 (= lt!656066 lt!656068))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513134 (= lt!656068 (Intermediate!12746 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100900 0))(
  ( (array!100901 (arr!48682 (Array (_ BitVec 32) (_ BitVec 64))) (size!49233 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100900)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100900 (_ BitVec 32)) SeekEntryResult!12746)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513134 (= lt!656066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48682 a!2804) j!70) mask!2512) (select (arr!48682 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513135 () Bool)

(declare-fun res!1031868 () Bool)

(assert (=> b!1513135 (=> (not res!1031868) (not e!844911))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513135 (= res!1031868 (= lt!656066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48682 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48682 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100901 (store (arr!48682 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49233 a!2804)) mask!2512)))))

(declare-fun b!1513136 () Bool)

(declare-fun res!1031864 () Bool)

(assert (=> b!1513136 (=> (not res!1031864) (not e!844910))))

(assert (=> b!1513136 (= res!1031864 (and (= (size!49233 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49233 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49233 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513138 () Bool)

(declare-fun res!1031870 () Bool)

(assert (=> b!1513138 (=> (not res!1031870) (not e!844911))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1513138 (= res!1031870 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48682 a!2804) j!70) a!2804 mask!2512) lt!656068))))

(declare-fun b!1513139 () Bool)

(declare-fun res!1031861 () Bool)

(assert (=> b!1513139 (=> (not res!1031861) (not e!844910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513139 (= res!1031861 (validKeyInArray!0 (select (arr!48682 a!2804) j!70)))))

(declare-fun b!1513140 () Bool)

(assert (=> b!1513140 (= e!844911 (not true))))

(declare-fun e!844909 () Bool)

(assert (=> b!1513140 e!844909))

(declare-fun res!1031866 () Bool)

(assert (=> b!1513140 (=> (not res!1031866) (not e!844909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100900 (_ BitVec 32)) Bool)

(assert (=> b!1513140 (= res!1031866 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50395 0))(
  ( (Unit!50396) )
))
(declare-fun lt!656067 () Unit!50395)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50395)

(assert (=> b!1513140 (= lt!656067 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513141 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100900 (_ BitVec 32)) SeekEntryResult!12746)

(assert (=> b!1513141 (= e!844909 (= (seekEntry!0 (select (arr!48682 a!2804) j!70) a!2804 mask!2512) (Found!12746 j!70)))))

(declare-fun b!1513142 () Bool)

(declare-fun res!1031867 () Bool)

(assert (=> b!1513142 (=> (not res!1031867) (not e!844910))))

(declare-datatypes ((List!35152 0))(
  ( (Nil!35149) (Cons!35148 (h!36575 (_ BitVec 64)) (t!49838 List!35152)) )
))
(declare-fun arrayNoDuplicates!0 (array!100900 (_ BitVec 32) List!35152) Bool)

(assert (=> b!1513142 (= res!1031867 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35149))))

(declare-fun b!1513143 () Bool)

(declare-fun res!1031860 () Bool)

(assert (=> b!1513143 (=> (not res!1031860) (not e!844910))))

(assert (=> b!1513143 (= res!1031860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513144 () Bool)

(declare-fun res!1031865 () Bool)

(assert (=> b!1513144 (=> (not res!1031865) (not e!844910))))

(assert (=> b!1513144 (= res!1031865 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49233 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49233 a!2804))))))

(declare-fun b!1513137 () Bool)

(declare-fun res!1031869 () Bool)

(assert (=> b!1513137 (=> (not res!1031869) (not e!844910))))

(assert (=> b!1513137 (= res!1031869 (validKeyInArray!0 (select (arr!48682 a!2804) i!961)))))

(declare-fun res!1031862 () Bool)

(assert (=> start!129230 (=> (not res!1031862) (not e!844910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129230 (= res!1031862 (validMask!0 mask!2512))))

(assert (=> start!129230 e!844910))

(assert (=> start!129230 true))

(declare-fun array_inv!37963 (array!100900) Bool)

(assert (=> start!129230 (array_inv!37963 a!2804)))

(assert (= (and start!129230 res!1031862) b!1513136))

(assert (= (and b!1513136 res!1031864) b!1513137))

(assert (= (and b!1513137 res!1031869) b!1513139))

(assert (= (and b!1513139 res!1031861) b!1513143))

(assert (= (and b!1513143 res!1031860) b!1513142))

(assert (= (and b!1513142 res!1031867) b!1513144))

(assert (= (and b!1513144 res!1031865) b!1513134))

(assert (= (and b!1513134 res!1031863) b!1513138))

(assert (= (and b!1513138 res!1031870) b!1513135))

(assert (= (and b!1513135 res!1031868) b!1513140))

(assert (= (and b!1513140 res!1031866) b!1513141))

(declare-fun m!1395783 () Bool)

(assert (=> b!1513141 m!1395783))

(assert (=> b!1513141 m!1395783))

(declare-fun m!1395785 () Bool)

(assert (=> b!1513141 m!1395785))

(assert (=> b!1513139 m!1395783))

(assert (=> b!1513139 m!1395783))

(declare-fun m!1395787 () Bool)

(assert (=> b!1513139 m!1395787))

(declare-fun m!1395789 () Bool)

(assert (=> b!1513135 m!1395789))

(declare-fun m!1395791 () Bool)

(assert (=> b!1513135 m!1395791))

(assert (=> b!1513135 m!1395791))

(declare-fun m!1395793 () Bool)

(assert (=> b!1513135 m!1395793))

(assert (=> b!1513135 m!1395793))

(assert (=> b!1513135 m!1395791))

(declare-fun m!1395795 () Bool)

(assert (=> b!1513135 m!1395795))

(declare-fun m!1395797 () Bool)

(assert (=> start!129230 m!1395797))

(declare-fun m!1395799 () Bool)

(assert (=> start!129230 m!1395799))

(assert (=> b!1513134 m!1395783))

(assert (=> b!1513134 m!1395783))

(declare-fun m!1395801 () Bool)

(assert (=> b!1513134 m!1395801))

(assert (=> b!1513134 m!1395801))

(assert (=> b!1513134 m!1395783))

(declare-fun m!1395803 () Bool)

(assert (=> b!1513134 m!1395803))

(declare-fun m!1395805 () Bool)

(assert (=> b!1513140 m!1395805))

(declare-fun m!1395807 () Bool)

(assert (=> b!1513140 m!1395807))

(assert (=> b!1513138 m!1395783))

(assert (=> b!1513138 m!1395783))

(declare-fun m!1395809 () Bool)

(assert (=> b!1513138 m!1395809))

(declare-fun m!1395811 () Bool)

(assert (=> b!1513143 m!1395811))

(declare-fun m!1395813 () Bool)

(assert (=> b!1513137 m!1395813))

(assert (=> b!1513137 m!1395813))

(declare-fun m!1395815 () Bool)

(assert (=> b!1513137 m!1395815))

(declare-fun m!1395817 () Bool)

(assert (=> b!1513142 m!1395817))

(check-sat (not b!1513140) (not b!1513138) (not start!129230) (not b!1513142) (not b!1513141) (not b!1513134) (not b!1513139) (not b!1513137) (not b!1513143) (not b!1513135))
(check-sat)
