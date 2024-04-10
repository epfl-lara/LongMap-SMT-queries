; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128918 () Bool)

(assert start!128918)

(declare-fun b!1511137 () Bool)

(declare-fun res!1031042 () Bool)

(declare-fun e!843715 () Bool)

(assert (=> b!1511137 (=> (not res!1031042) (not e!843715))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100774 0))(
  ( (array!100775 (arr!48624 (Array (_ BitVec 32) (_ BitVec 64))) (size!49174 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100774)

(assert (=> b!1511137 (= res!1031042 (and (= (size!49174 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49174 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49174 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511138 () Bool)

(declare-fun res!1031041 () Bool)

(assert (=> b!1511138 (=> (not res!1031041) (not e!843715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100774 (_ BitVec 32)) Bool)

(assert (=> b!1511138 (= res!1031041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511139 () Bool)

(declare-fun res!1031040 () Bool)

(assert (=> b!1511139 (=> (not res!1031040) (not e!843715))))

(declare-datatypes ((List!35107 0))(
  ( (Nil!35104) (Cons!35103 (h!36515 (_ BitVec 64)) (t!49801 List!35107)) )
))
(declare-fun arrayNoDuplicates!0 (array!100774 (_ BitVec 32) List!35107) Bool)

(assert (=> b!1511139 (= res!1031040 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35104))))

(declare-fun b!1511140 () Bool)

(declare-fun res!1031050 () Bool)

(declare-fun e!843713 () Bool)

(assert (=> b!1511140 (=> (not res!1031050) (not e!843713))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12795 0))(
  ( (MissingZero!12795 (index!53575 (_ BitVec 32))) (Found!12795 (index!53576 (_ BitVec 32))) (Intermediate!12795 (undefined!13607 Bool) (index!53577 (_ BitVec 32)) (x!135313 (_ BitVec 32))) (Undefined!12795) (MissingVacant!12795 (index!53578 (_ BitVec 32))) )
))
(declare-fun lt!655358 () SeekEntryResult!12795)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100774 (_ BitVec 32)) SeekEntryResult!12795)

(assert (=> b!1511140 (= res!1031050 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48624 a!2804) j!70) a!2804 mask!2512) lt!655358))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun b!1511141 () Bool)

(assert (=> b!1511141 (= e!843713 (not (or (not (= (select (arr!48624 a!2804) j!70) (select (store (arr!48624 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48624 a!2804) index!487) (select (arr!48624 a!2804) j!70)) (not (= (select (arr!48624 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun e!843712 () Bool)

(assert (=> b!1511141 e!843712))

(declare-fun res!1031044 () Bool)

(assert (=> b!1511141 (=> (not res!1031044) (not e!843712))))

(assert (=> b!1511141 (= res!1031044 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50458 0))(
  ( (Unit!50459) )
))
(declare-fun lt!655360 () Unit!50458)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50458)

(assert (=> b!1511141 (= lt!655360 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511142 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100774 (_ BitVec 32)) SeekEntryResult!12795)

(assert (=> b!1511142 (= e!843712 (= (seekEntry!0 (select (arr!48624 a!2804) j!70) a!2804 mask!2512) (Found!12795 j!70)))))

(declare-fun b!1511143 () Bool)

(assert (=> b!1511143 (= e!843715 e!843713)))

(declare-fun res!1031043 () Bool)

(assert (=> b!1511143 (=> (not res!1031043) (not e!843713))))

(declare-fun lt!655359 () SeekEntryResult!12795)

(assert (=> b!1511143 (= res!1031043 (= lt!655359 lt!655358))))

(assert (=> b!1511143 (= lt!655358 (Intermediate!12795 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511143 (= lt!655359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48624 a!2804) j!70) mask!2512) (select (arr!48624 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511145 () Bool)

(declare-fun res!1031049 () Bool)

(assert (=> b!1511145 (=> (not res!1031049) (not e!843715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511145 (= res!1031049 (validKeyInArray!0 (select (arr!48624 a!2804) i!961)))))

(declare-fun b!1511146 () Bool)

(declare-fun res!1031046 () Bool)

(assert (=> b!1511146 (=> (not res!1031046) (not e!843713))))

(assert (=> b!1511146 (= res!1031046 (= lt!655359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48624 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48624 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100775 (store (arr!48624 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49174 a!2804)) mask!2512)))))

(declare-fun b!1511147 () Bool)

(declare-fun res!1031048 () Bool)

(assert (=> b!1511147 (=> (not res!1031048) (not e!843715))))

(assert (=> b!1511147 (= res!1031048 (validKeyInArray!0 (select (arr!48624 a!2804) j!70)))))

(declare-fun b!1511144 () Bool)

(declare-fun res!1031047 () Bool)

(assert (=> b!1511144 (=> (not res!1031047) (not e!843715))))

(assert (=> b!1511144 (= res!1031047 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49174 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49174 a!2804))))))

(declare-fun res!1031045 () Bool)

(assert (=> start!128918 (=> (not res!1031045) (not e!843715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128918 (= res!1031045 (validMask!0 mask!2512))))

(assert (=> start!128918 e!843715))

(assert (=> start!128918 true))

(declare-fun array_inv!37652 (array!100774) Bool)

(assert (=> start!128918 (array_inv!37652 a!2804)))

(assert (= (and start!128918 res!1031045) b!1511137))

(assert (= (and b!1511137 res!1031042) b!1511145))

(assert (= (and b!1511145 res!1031049) b!1511147))

(assert (= (and b!1511147 res!1031048) b!1511138))

(assert (= (and b!1511138 res!1031041) b!1511139))

(assert (= (and b!1511139 res!1031040) b!1511144))

(assert (= (and b!1511144 res!1031047) b!1511143))

(assert (= (and b!1511143 res!1031043) b!1511140))

(assert (= (and b!1511140 res!1031050) b!1511146))

(assert (= (and b!1511146 res!1031046) b!1511141))

(assert (= (and b!1511141 res!1031044) b!1511142))

(declare-fun m!1393803 () Bool)

(assert (=> b!1511143 m!1393803))

(assert (=> b!1511143 m!1393803))

(declare-fun m!1393805 () Bool)

(assert (=> b!1511143 m!1393805))

(assert (=> b!1511143 m!1393805))

(assert (=> b!1511143 m!1393803))

(declare-fun m!1393807 () Bool)

(assert (=> b!1511143 m!1393807))

(assert (=> b!1511147 m!1393803))

(assert (=> b!1511147 m!1393803))

(declare-fun m!1393809 () Bool)

(assert (=> b!1511147 m!1393809))

(declare-fun m!1393811 () Bool)

(assert (=> b!1511139 m!1393811))

(declare-fun m!1393813 () Bool)

(assert (=> b!1511145 m!1393813))

(assert (=> b!1511145 m!1393813))

(declare-fun m!1393815 () Bool)

(assert (=> b!1511145 m!1393815))

(assert (=> b!1511140 m!1393803))

(assert (=> b!1511140 m!1393803))

(declare-fun m!1393817 () Bool)

(assert (=> b!1511140 m!1393817))

(assert (=> b!1511142 m!1393803))

(assert (=> b!1511142 m!1393803))

(declare-fun m!1393819 () Bool)

(assert (=> b!1511142 m!1393819))

(declare-fun m!1393821 () Bool)

(assert (=> b!1511138 m!1393821))

(declare-fun m!1393823 () Bool)

(assert (=> b!1511146 m!1393823))

(declare-fun m!1393825 () Bool)

(assert (=> b!1511146 m!1393825))

(assert (=> b!1511146 m!1393825))

(declare-fun m!1393827 () Bool)

(assert (=> b!1511146 m!1393827))

(assert (=> b!1511146 m!1393827))

(assert (=> b!1511146 m!1393825))

(declare-fun m!1393829 () Bool)

(assert (=> b!1511146 m!1393829))

(declare-fun m!1393831 () Bool)

(assert (=> start!128918 m!1393831))

(declare-fun m!1393833 () Bool)

(assert (=> start!128918 m!1393833))

(assert (=> b!1511141 m!1393803))

(declare-fun m!1393835 () Bool)

(assert (=> b!1511141 m!1393835))

(assert (=> b!1511141 m!1393823))

(declare-fun m!1393837 () Bool)

(assert (=> b!1511141 m!1393837))

(assert (=> b!1511141 m!1393825))

(declare-fun m!1393839 () Bool)

(assert (=> b!1511141 m!1393839))

(check-sat (not start!128918) (not b!1511142) (not b!1511140) (not b!1511143) (not b!1511141) (not b!1511147) (not b!1511145) (not b!1511146) (not b!1511139) (not b!1511138))
(check-sat)
