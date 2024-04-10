; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129212 () Bool)

(assert start!129212)

(declare-fun b!1516889 () Bool)

(declare-fun e!846363 () Bool)

(assert (=> b!1516889 (= e!846363 true)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101068 0))(
  ( (array!101069 (arr!48771 (Array (_ BitVec 32) (_ BitVec 64))) (size!49321 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101068)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12942 0))(
  ( (MissingZero!12942 (index!54163 (_ BitVec 32))) (Found!12942 (index!54164 (_ BitVec 32))) (Intermediate!12942 (undefined!13754 Bool) (index!54165 (_ BitVec 32)) (x!135852 (_ BitVec 32))) (Undefined!12942) (MissingVacant!12942 (index!54166 (_ BitVec 32))) )
))
(declare-fun lt!657574 () SeekEntryResult!12942)

(declare-fun lt!657577 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101068 (_ BitVec 32)) SeekEntryResult!12942)

(assert (=> b!1516889 (= lt!657574 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657577 (select (arr!48771 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516890 () Bool)

(declare-fun res!1036802 () Bool)

(declare-fun e!846362 () Bool)

(assert (=> b!1516890 (=> (not res!1036802) (not e!846362))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516890 (= res!1036802 (and (= (size!49321 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49321 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49321 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516891 () Bool)

(declare-fun res!1036796 () Bool)

(assert (=> b!1516891 (=> (not res!1036796) (not e!846362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101068 (_ BitVec 32)) Bool)

(assert (=> b!1516891 (= res!1036796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516892 () Bool)

(declare-fun e!846359 () Bool)

(assert (=> b!1516892 (= e!846359 e!846363)))

(declare-fun res!1036804 () Bool)

(assert (=> b!1516892 (=> res!1036804 e!846363)))

(assert (=> b!1516892 (= res!1036804 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657577 #b00000000000000000000000000000000) (bvsge lt!657577 (size!49321 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516892 (= lt!657577 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516893 () Bool)

(declare-fun e!846360 () Bool)

(assert (=> b!1516893 (= e!846360 (not e!846359))))

(declare-fun res!1036792 () Bool)

(assert (=> b!1516893 (=> res!1036792 e!846359)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516893 (= res!1036792 (or (not (= (select (arr!48771 a!2804) j!70) (select (store (arr!48771 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846361 () Bool)

(assert (=> b!1516893 e!846361))

(declare-fun res!1036795 () Bool)

(assert (=> b!1516893 (=> (not res!1036795) (not e!846361))))

(assert (=> b!1516893 (= res!1036795 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50752 0))(
  ( (Unit!50753) )
))
(declare-fun lt!657573 () Unit!50752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50752)

(assert (=> b!1516893 (= lt!657573 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516894 () Bool)

(declare-fun res!1036799 () Bool)

(assert (=> b!1516894 (=> (not res!1036799) (not e!846362))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516894 (= res!1036799 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49321 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49321 a!2804))))))

(declare-fun b!1516895 () Bool)

(declare-fun res!1036794 () Bool)

(assert (=> b!1516895 (=> (not res!1036794) (not e!846362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516895 (= res!1036794 (validKeyInArray!0 (select (arr!48771 a!2804) j!70)))))

(declare-fun b!1516896 () Bool)

(declare-fun res!1036797 () Bool)

(assert (=> b!1516896 (=> (not res!1036797) (not e!846360))))

(declare-fun lt!657576 () SeekEntryResult!12942)

(assert (=> b!1516896 (= res!1036797 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48771 a!2804) j!70) a!2804 mask!2512) lt!657576))))

(declare-fun b!1516897 () Bool)

(declare-fun res!1036801 () Bool)

(assert (=> b!1516897 (=> (not res!1036801) (not e!846360))))

(declare-fun lt!657575 () SeekEntryResult!12942)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516897 (= res!1036801 (= lt!657575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48771 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48771 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101069 (store (arr!48771 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49321 a!2804)) mask!2512)))))

(declare-fun res!1036793 () Bool)

(assert (=> start!129212 (=> (not res!1036793) (not e!846362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129212 (= res!1036793 (validMask!0 mask!2512))))

(assert (=> start!129212 e!846362))

(assert (=> start!129212 true))

(declare-fun array_inv!37799 (array!101068) Bool)

(assert (=> start!129212 (array_inv!37799 a!2804)))

(declare-fun b!1516898 () Bool)

(declare-fun res!1036803 () Bool)

(assert (=> b!1516898 (=> (not res!1036803) (not e!846362))))

(declare-datatypes ((List!35254 0))(
  ( (Nil!35251) (Cons!35250 (h!36662 (_ BitVec 64)) (t!49948 List!35254)) )
))
(declare-fun arrayNoDuplicates!0 (array!101068 (_ BitVec 32) List!35254) Bool)

(assert (=> b!1516898 (= res!1036803 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35251))))

(declare-fun b!1516899 () Bool)

(declare-fun res!1036798 () Bool)

(assert (=> b!1516899 (=> (not res!1036798) (not e!846362))))

(assert (=> b!1516899 (= res!1036798 (validKeyInArray!0 (select (arr!48771 a!2804) i!961)))))

(declare-fun b!1516900 () Bool)

(assert (=> b!1516900 (= e!846362 e!846360)))

(declare-fun res!1036800 () Bool)

(assert (=> b!1516900 (=> (not res!1036800) (not e!846360))))

(assert (=> b!1516900 (= res!1036800 (= lt!657575 lt!657576))))

(assert (=> b!1516900 (= lt!657576 (Intermediate!12942 false resIndex!21 resX!21))))

(assert (=> b!1516900 (= lt!657575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48771 a!2804) j!70) mask!2512) (select (arr!48771 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516901 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101068 (_ BitVec 32)) SeekEntryResult!12942)

(assert (=> b!1516901 (= e!846361 (= (seekEntry!0 (select (arr!48771 a!2804) j!70) a!2804 mask!2512) (Found!12942 j!70)))))

(assert (= (and start!129212 res!1036793) b!1516890))

(assert (= (and b!1516890 res!1036802) b!1516899))

(assert (= (and b!1516899 res!1036798) b!1516895))

(assert (= (and b!1516895 res!1036794) b!1516891))

(assert (= (and b!1516891 res!1036796) b!1516898))

(assert (= (and b!1516898 res!1036803) b!1516894))

(assert (= (and b!1516894 res!1036799) b!1516900))

(assert (= (and b!1516900 res!1036800) b!1516896))

(assert (= (and b!1516896 res!1036797) b!1516897))

(assert (= (and b!1516897 res!1036801) b!1516893))

(assert (= (and b!1516893 res!1036795) b!1516901))

(assert (= (and b!1516893 (not res!1036792)) b!1516892))

(assert (= (and b!1516892 (not res!1036804)) b!1516889))

(declare-fun m!1400165 () Bool)

(assert (=> start!129212 m!1400165))

(declare-fun m!1400167 () Bool)

(assert (=> start!129212 m!1400167))

(declare-fun m!1400169 () Bool)

(assert (=> b!1516892 m!1400169))

(declare-fun m!1400171 () Bool)

(assert (=> b!1516898 m!1400171))

(declare-fun m!1400173 () Bool)

(assert (=> b!1516895 m!1400173))

(assert (=> b!1516895 m!1400173))

(declare-fun m!1400175 () Bool)

(assert (=> b!1516895 m!1400175))

(assert (=> b!1516893 m!1400173))

(declare-fun m!1400177 () Bool)

(assert (=> b!1516893 m!1400177))

(declare-fun m!1400179 () Bool)

(assert (=> b!1516893 m!1400179))

(declare-fun m!1400181 () Bool)

(assert (=> b!1516893 m!1400181))

(declare-fun m!1400183 () Bool)

(assert (=> b!1516893 m!1400183))

(declare-fun m!1400185 () Bool)

(assert (=> b!1516891 m!1400185))

(assert (=> b!1516900 m!1400173))

(assert (=> b!1516900 m!1400173))

(declare-fun m!1400187 () Bool)

(assert (=> b!1516900 m!1400187))

(assert (=> b!1516900 m!1400187))

(assert (=> b!1516900 m!1400173))

(declare-fun m!1400189 () Bool)

(assert (=> b!1516900 m!1400189))

(assert (=> b!1516901 m!1400173))

(assert (=> b!1516901 m!1400173))

(declare-fun m!1400191 () Bool)

(assert (=> b!1516901 m!1400191))

(assert (=> b!1516889 m!1400173))

(assert (=> b!1516889 m!1400173))

(declare-fun m!1400193 () Bool)

(assert (=> b!1516889 m!1400193))

(declare-fun m!1400195 () Bool)

(assert (=> b!1516899 m!1400195))

(assert (=> b!1516899 m!1400195))

(declare-fun m!1400197 () Bool)

(assert (=> b!1516899 m!1400197))

(assert (=> b!1516897 m!1400179))

(assert (=> b!1516897 m!1400181))

(assert (=> b!1516897 m!1400181))

(declare-fun m!1400199 () Bool)

(assert (=> b!1516897 m!1400199))

(assert (=> b!1516897 m!1400199))

(assert (=> b!1516897 m!1400181))

(declare-fun m!1400201 () Bool)

(assert (=> b!1516897 m!1400201))

(assert (=> b!1516896 m!1400173))

(assert (=> b!1516896 m!1400173))

(declare-fun m!1400203 () Bool)

(assert (=> b!1516896 m!1400203))

(check-sat (not b!1516899) (not b!1516893) (not b!1516900) (not b!1516897) (not start!129212) (not b!1516896) (not b!1516891) (not b!1516892) (not b!1516901) (not b!1516898) (not b!1516895) (not b!1516889))
(check-sat)
