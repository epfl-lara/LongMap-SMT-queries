; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128972 () Bool)

(assert start!128972)

(declare-fun b!1512813 () Bool)

(declare-fun res!1032933 () Bool)

(declare-fun e!844316 () Bool)

(assert (=> b!1512813 (=> (not res!1032933) (not e!844316))))

(declare-datatypes ((array!100828 0))(
  ( (array!100829 (arr!48652 (Array (_ BitVec 32) (_ BitVec 64))) (size!49204 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100828)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512813 (= res!1032933 (validKeyInArray!0 (select (arr!48652 a!2804) j!70)))))

(declare-fun b!1512814 () Bool)

(declare-fun e!844314 () Bool)

(assert (=> b!1512814 (= e!844316 e!844314)))

(declare-fun res!1032926 () Bool)

(assert (=> b!1512814 (=> (not res!1032926) (not e!844314))))

(declare-datatypes ((SeekEntryResult!12846 0))(
  ( (MissingZero!12846 (index!53779 (_ BitVec 32))) (Found!12846 (index!53780 (_ BitVec 32))) (Intermediate!12846 (undefined!13658 Bool) (index!53781 (_ BitVec 32)) (x!135502 (_ BitVec 32))) (Undefined!12846) (MissingVacant!12846 (index!53782 (_ BitVec 32))) )
))
(declare-fun lt!655584 () SeekEntryResult!12846)

(declare-fun lt!655582 () SeekEntryResult!12846)

(assert (=> b!1512814 (= res!1032926 (= lt!655584 lt!655582))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512814 (= lt!655582 (Intermediate!12846 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100828 (_ BitVec 32)) SeekEntryResult!12846)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512814 (= lt!655584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48652 a!2804) j!70) mask!2512) (select (arr!48652 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512815 () Bool)

(declare-fun res!1032929 () Bool)

(assert (=> b!1512815 (=> (not res!1032929) (not e!844316))))

(declare-datatypes ((List!35213 0))(
  ( (Nil!35210) (Cons!35209 (h!36622 (_ BitVec 64)) (t!49899 List!35213)) )
))
(declare-fun arrayNoDuplicates!0 (array!100828 (_ BitVec 32) List!35213) Bool)

(assert (=> b!1512815 (= res!1032929 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35210))))

(declare-fun b!1512816 () Bool)

(declare-fun res!1032925 () Bool)

(assert (=> b!1512816 (=> (not res!1032925) (not e!844316))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1512816 (= res!1032925 (validKeyInArray!0 (select (arr!48652 a!2804) i!961)))))

(declare-fun b!1512817 () Bool)

(declare-fun res!1032922 () Bool)

(declare-fun e!844313 () Bool)

(assert (=> b!1512817 (=> (not res!1032922) (not e!844313))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100828 (_ BitVec 32)) SeekEntryResult!12846)

(assert (=> b!1512817 (= res!1032922 (= (seekEntry!0 (select (arr!48652 a!2804) j!70) a!2804 mask!2512) (Found!12846 j!70)))))

(declare-fun b!1512818 () Bool)

(declare-fun e!844312 () Bool)

(assert (=> b!1512818 (= e!844312 (not true))))

(assert (=> b!1512818 e!844313))

(declare-fun res!1032927 () Bool)

(assert (=> b!1512818 (=> (not res!1032927) (not e!844313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100828 (_ BitVec 32)) Bool)

(assert (=> b!1512818 (= res!1032927 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50399 0))(
  ( (Unit!50400) )
))
(declare-fun lt!655583 () Unit!50399)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50399)

(assert (=> b!1512818 (= lt!655583 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512819 () Bool)

(declare-fun e!844315 () Bool)

(declare-fun e!844317 () Bool)

(assert (=> b!1512819 (= e!844315 e!844317)))

(declare-fun res!1032934 () Bool)

(assert (=> b!1512819 (=> (not res!1032934) (not e!844317))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100828 (_ BitVec 32)) SeekEntryResult!12846)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100828 (_ BitVec 32)) SeekEntryResult!12846)

(assert (=> b!1512819 (= res!1032934 (= (seekEntryOrOpen!0 (select (arr!48652 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48652 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512820 () Bool)

(assert (=> b!1512820 (= e!844314 e!844312)))

(declare-fun res!1032928 () Bool)

(assert (=> b!1512820 (=> (not res!1032928) (not e!844312))))

(declare-fun lt!655581 () (_ BitVec 64))

(declare-fun lt!655580 () array!100828)

(assert (=> b!1512820 (= res!1032928 (= lt!655584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655581 mask!2512) lt!655581 lt!655580 mask!2512)))))

(assert (=> b!1512820 (= lt!655581 (select (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1512820 (= lt!655580 (array!100829 (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49204 a!2804)))))

(declare-fun b!1512821 () Bool)

(assert (=> b!1512821 (= e!844317 (= (seekEntryOrOpen!0 lt!655581 lt!655580 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655581 lt!655580 mask!2512)))))

(declare-fun b!1512822 () Bool)

(declare-fun res!1032924 () Bool)

(assert (=> b!1512822 (=> (not res!1032924) (not e!844316))))

(assert (=> b!1512822 (= res!1032924 (and (= (size!49204 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49204 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49204 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512823 () Bool)

(declare-fun res!1032932 () Bool)

(assert (=> b!1512823 (=> (not res!1032932) (not e!844316))))

(assert (=> b!1512823 (= res!1032932 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49204 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49204 a!2804))))))

(declare-fun b!1512824 () Bool)

(assert (=> b!1512824 (= e!844313 e!844315)))

(declare-fun res!1032930 () Bool)

(assert (=> b!1512824 (=> res!1032930 e!844315)))

(assert (=> b!1512824 (= res!1032930 (or (not (= (select (arr!48652 a!2804) j!70) lt!655581)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48652 a!2804) index!487) (select (arr!48652 a!2804) j!70)) (not (= (select (arr!48652 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512825 () Bool)

(declare-fun res!1032931 () Bool)

(assert (=> b!1512825 (=> (not res!1032931) (not e!844314))))

(assert (=> b!1512825 (= res!1032931 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48652 a!2804) j!70) a!2804 mask!2512) lt!655582))))

(declare-fun b!1512826 () Bool)

(declare-fun res!1032923 () Bool)

(assert (=> b!1512826 (=> (not res!1032923) (not e!844316))))

(assert (=> b!1512826 (= res!1032923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1032935 () Bool)

(assert (=> start!128972 (=> (not res!1032935) (not e!844316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128972 (= res!1032935 (validMask!0 mask!2512))))

(assert (=> start!128972 e!844316))

(assert (=> start!128972 true))

(declare-fun array_inv!37885 (array!100828) Bool)

(assert (=> start!128972 (array_inv!37885 a!2804)))

(assert (= (and start!128972 res!1032935) b!1512822))

(assert (= (and b!1512822 res!1032924) b!1512816))

(assert (= (and b!1512816 res!1032925) b!1512813))

(assert (= (and b!1512813 res!1032933) b!1512826))

(assert (= (and b!1512826 res!1032923) b!1512815))

(assert (= (and b!1512815 res!1032929) b!1512823))

(assert (= (and b!1512823 res!1032932) b!1512814))

(assert (= (and b!1512814 res!1032926) b!1512825))

(assert (= (and b!1512825 res!1032931) b!1512820))

(assert (= (and b!1512820 res!1032928) b!1512818))

(assert (= (and b!1512818 res!1032927) b!1512817))

(assert (= (and b!1512817 res!1032922) b!1512824))

(assert (= (and b!1512824 (not res!1032930)) b!1512819))

(assert (= (and b!1512819 res!1032934) b!1512821))

(declare-fun m!1395077 () Bool)

(assert (=> b!1512818 m!1395077))

(declare-fun m!1395079 () Bool)

(assert (=> b!1512818 m!1395079))

(declare-fun m!1395081 () Bool)

(assert (=> b!1512826 m!1395081))

(declare-fun m!1395083 () Bool)

(assert (=> start!128972 m!1395083))

(declare-fun m!1395085 () Bool)

(assert (=> start!128972 m!1395085))

(declare-fun m!1395087 () Bool)

(assert (=> b!1512820 m!1395087))

(assert (=> b!1512820 m!1395087))

(declare-fun m!1395089 () Bool)

(assert (=> b!1512820 m!1395089))

(declare-fun m!1395091 () Bool)

(assert (=> b!1512820 m!1395091))

(declare-fun m!1395093 () Bool)

(assert (=> b!1512820 m!1395093))

(declare-fun m!1395095 () Bool)

(assert (=> b!1512817 m!1395095))

(assert (=> b!1512817 m!1395095))

(declare-fun m!1395097 () Bool)

(assert (=> b!1512817 m!1395097))

(assert (=> b!1512825 m!1395095))

(assert (=> b!1512825 m!1395095))

(declare-fun m!1395099 () Bool)

(assert (=> b!1512825 m!1395099))

(assert (=> b!1512814 m!1395095))

(assert (=> b!1512814 m!1395095))

(declare-fun m!1395101 () Bool)

(assert (=> b!1512814 m!1395101))

(assert (=> b!1512814 m!1395101))

(assert (=> b!1512814 m!1395095))

(declare-fun m!1395103 () Bool)

(assert (=> b!1512814 m!1395103))

(assert (=> b!1512813 m!1395095))

(assert (=> b!1512813 m!1395095))

(declare-fun m!1395105 () Bool)

(assert (=> b!1512813 m!1395105))

(assert (=> b!1512824 m!1395095))

(declare-fun m!1395107 () Bool)

(assert (=> b!1512824 m!1395107))

(assert (=> b!1512819 m!1395095))

(assert (=> b!1512819 m!1395095))

(declare-fun m!1395109 () Bool)

(assert (=> b!1512819 m!1395109))

(assert (=> b!1512819 m!1395095))

(declare-fun m!1395111 () Bool)

(assert (=> b!1512819 m!1395111))

(declare-fun m!1395113 () Bool)

(assert (=> b!1512816 m!1395113))

(assert (=> b!1512816 m!1395113))

(declare-fun m!1395115 () Bool)

(assert (=> b!1512816 m!1395115))

(declare-fun m!1395117 () Bool)

(assert (=> b!1512815 m!1395117))

(declare-fun m!1395119 () Bool)

(assert (=> b!1512821 m!1395119))

(declare-fun m!1395121 () Bool)

(assert (=> b!1512821 m!1395121))

(check-sat (not b!1512815) (not b!1512816) (not b!1512819) (not b!1512820) (not b!1512813) (not start!128972) (not b!1512817) (not b!1512818) (not b!1512814) (not b!1512821) (not b!1512826) (not b!1512825))
(check-sat)
