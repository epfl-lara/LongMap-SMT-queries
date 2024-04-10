; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129630 () Bool)

(assert start!129630)

(declare-fun b!1521813 () Bool)

(declare-fun e!848651 () Bool)

(assert (=> b!1521813 (= e!848651 false)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101305 0))(
  ( (array!101306 (arr!48885 (Array (_ BitVec 32) (_ BitVec 64))) (size!49435 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101305)

(declare-datatypes ((SeekEntryResult!13050 0))(
  ( (MissingZero!13050 (index!54595 (_ BitVec 32))) (Found!13050 (index!54596 (_ BitVec 32))) (Intermediate!13050 (undefined!13862 Bool) (index!54597 (_ BitVec 32)) (x!136286 (_ BitVec 32))) (Undefined!13050) (MissingVacant!13050 (index!54598 (_ BitVec 32))) )
))
(declare-fun lt!659433 () SeekEntryResult!13050)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101305 (_ BitVec 32)) SeekEntryResult!13050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521813 (= lt!659433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48885 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48885 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101306 (store (arr!48885 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49435 a!2804)) mask!2512))))

(declare-fun b!1521814 () Bool)

(declare-fun res!1041036 () Bool)

(declare-fun e!848652 () Bool)

(assert (=> b!1521814 (=> (not res!1041036) (not e!848652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521814 (= res!1041036 (validKeyInArray!0 (select (arr!48885 a!2804) j!70)))))

(declare-fun b!1521815 () Bool)

(declare-fun res!1041040 () Bool)

(assert (=> b!1521815 (=> (not res!1041040) (not e!848652))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521815 (= res!1041040 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49435 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49435 a!2804))))))

(declare-fun b!1521816 () Bool)

(assert (=> b!1521816 (= e!848652 e!848651)))

(declare-fun res!1041035 () Bool)

(assert (=> b!1521816 (=> (not res!1041035) (not e!848651))))

(declare-fun lt!659434 () SeekEntryResult!13050)

(assert (=> b!1521816 (= res!1041035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48885 a!2804) j!70) mask!2512) (select (arr!48885 a!2804) j!70) a!2804 mask!2512) lt!659434))))

(assert (=> b!1521816 (= lt!659434 (Intermediate!13050 false resIndex!21 resX!21))))

(declare-fun b!1521817 () Bool)

(declare-fun res!1041043 () Bool)

(assert (=> b!1521817 (=> (not res!1041043) (not e!848652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101305 (_ BitVec 32)) Bool)

(assert (=> b!1521817 (= res!1041043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1041037 () Bool)

(assert (=> start!129630 (=> (not res!1041037) (not e!848652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129630 (= res!1041037 (validMask!0 mask!2512))))

(assert (=> start!129630 e!848652))

(assert (=> start!129630 true))

(declare-fun array_inv!37913 (array!101305) Bool)

(assert (=> start!129630 (array_inv!37913 a!2804)))

(declare-fun b!1521818 () Bool)

(declare-fun res!1041041 () Bool)

(assert (=> b!1521818 (=> (not res!1041041) (not e!848652))))

(assert (=> b!1521818 (= res!1041041 (validKeyInArray!0 (select (arr!48885 a!2804) i!961)))))

(declare-fun b!1521819 () Bool)

(declare-fun res!1041042 () Bool)

(assert (=> b!1521819 (=> (not res!1041042) (not e!848651))))

(assert (=> b!1521819 (= res!1041042 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48885 a!2804) j!70) a!2804 mask!2512) lt!659434))))

(declare-fun b!1521820 () Bool)

(declare-fun res!1041039 () Bool)

(assert (=> b!1521820 (=> (not res!1041039) (not e!848652))))

(declare-datatypes ((List!35368 0))(
  ( (Nil!35365) (Cons!35364 (h!36785 (_ BitVec 64)) (t!50062 List!35368)) )
))
(declare-fun arrayNoDuplicates!0 (array!101305 (_ BitVec 32) List!35368) Bool)

(assert (=> b!1521820 (= res!1041039 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35365))))

(declare-fun b!1521821 () Bool)

(declare-fun res!1041038 () Bool)

(assert (=> b!1521821 (=> (not res!1041038) (not e!848652))))

(assert (=> b!1521821 (= res!1041038 (and (= (size!49435 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49435 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49435 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129630 res!1041037) b!1521821))

(assert (= (and b!1521821 res!1041038) b!1521818))

(assert (= (and b!1521818 res!1041041) b!1521814))

(assert (= (and b!1521814 res!1041036) b!1521817))

(assert (= (and b!1521817 res!1041043) b!1521820))

(assert (= (and b!1521820 res!1041039) b!1521815))

(assert (= (and b!1521815 res!1041040) b!1521816))

(assert (= (and b!1521816 res!1041035) b!1521819))

(assert (= (and b!1521819 res!1041042) b!1521813))

(declare-fun m!1404929 () Bool)

(assert (=> b!1521820 m!1404929))

(declare-fun m!1404931 () Bool)

(assert (=> b!1521814 m!1404931))

(assert (=> b!1521814 m!1404931))

(declare-fun m!1404933 () Bool)

(assert (=> b!1521814 m!1404933))

(assert (=> b!1521819 m!1404931))

(assert (=> b!1521819 m!1404931))

(declare-fun m!1404935 () Bool)

(assert (=> b!1521819 m!1404935))

(declare-fun m!1404937 () Bool)

(assert (=> b!1521813 m!1404937))

(declare-fun m!1404939 () Bool)

(assert (=> b!1521813 m!1404939))

(assert (=> b!1521813 m!1404939))

(declare-fun m!1404941 () Bool)

(assert (=> b!1521813 m!1404941))

(assert (=> b!1521813 m!1404941))

(assert (=> b!1521813 m!1404939))

(declare-fun m!1404943 () Bool)

(assert (=> b!1521813 m!1404943))

(declare-fun m!1404945 () Bool)

(assert (=> b!1521817 m!1404945))

(assert (=> b!1521816 m!1404931))

(assert (=> b!1521816 m!1404931))

(declare-fun m!1404947 () Bool)

(assert (=> b!1521816 m!1404947))

(assert (=> b!1521816 m!1404947))

(assert (=> b!1521816 m!1404931))

(declare-fun m!1404949 () Bool)

(assert (=> b!1521816 m!1404949))

(declare-fun m!1404951 () Bool)

(assert (=> start!129630 m!1404951))

(declare-fun m!1404953 () Bool)

(assert (=> start!129630 m!1404953))

(declare-fun m!1404955 () Bool)

(assert (=> b!1521818 m!1404955))

(assert (=> b!1521818 m!1404955))

(declare-fun m!1404957 () Bool)

(assert (=> b!1521818 m!1404957))

(check-sat (not b!1521816) (not b!1521820) (not b!1521818) (not b!1521814) (not b!1521817) (not b!1521819) (not start!129630) (not b!1521813))
(check-sat)
