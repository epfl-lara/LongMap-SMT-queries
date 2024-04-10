; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129264 () Bool)

(assert start!129264)

(declare-fun b!1517903 () Bool)

(declare-fun res!1037808 () Bool)

(declare-fun e!846830 () Bool)

(assert (=> b!1517903 (=> (not res!1037808) (not e!846830))))

(declare-datatypes ((array!101120 0))(
  ( (array!101121 (arr!48797 (Array (_ BitVec 32) (_ BitVec 64))) (size!49347 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101120)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517903 (= res!1037808 (validKeyInArray!0 (select (arr!48797 a!2804) j!70)))))

(declare-fun b!1517904 () Bool)

(declare-fun res!1037810 () Bool)

(declare-fun e!846831 () Bool)

(assert (=> b!1517904 (=> (not res!1037810) (not e!846831))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12968 0))(
  ( (MissingZero!12968 (index!54267 (_ BitVec 32))) (Found!12968 (index!54268 (_ BitVec 32))) (Intermediate!12968 (undefined!13780 Bool) (index!54269 (_ BitVec 32)) (x!135950 (_ BitVec 32))) (Undefined!12968) (MissingVacant!12968 (index!54270 (_ BitVec 32))) )
))
(declare-fun lt!657966 () SeekEntryResult!12968)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101120 (_ BitVec 32)) SeekEntryResult!12968)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517904 (= res!1037810 (= lt!657966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48797 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48797 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101121 (store (arr!48797 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49347 a!2804)) mask!2512)))))

(declare-fun b!1517905 () Bool)

(declare-fun res!1037806 () Bool)

(assert (=> b!1517905 (=> (not res!1037806) (not e!846830))))

(assert (=> b!1517905 (= res!1037806 (validKeyInArray!0 (select (arr!48797 a!2804) i!961)))))

(declare-fun b!1517906 () Bool)

(declare-fun e!846832 () Bool)

(assert (=> b!1517906 (= e!846831 (not e!846832))))

(declare-fun res!1037813 () Bool)

(assert (=> b!1517906 (=> res!1037813 e!846832)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517906 (= res!1037813 (or (not (= (select (arr!48797 a!2804) j!70) (select (store (arr!48797 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846827 () Bool)

(assert (=> b!1517906 e!846827))

(declare-fun res!1037816 () Bool)

(assert (=> b!1517906 (=> (not res!1037816) (not e!846827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101120 (_ BitVec 32)) Bool)

(assert (=> b!1517906 (= res!1037816 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50804 0))(
  ( (Unit!50805) )
))
(declare-fun lt!657964 () Unit!50804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50804)

(assert (=> b!1517906 (= lt!657964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517907 () Bool)

(declare-fun e!846828 () Bool)

(assert (=> b!1517907 (= e!846828 true)))

(declare-fun lt!657967 () SeekEntryResult!12968)

(declare-fun lt!657965 () (_ BitVec 32))

(assert (=> b!1517907 (= lt!657967 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657965 (select (arr!48797 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517908 () Bool)

(declare-fun res!1037812 () Bool)

(assert (=> b!1517908 (=> (not res!1037812) (not e!846830))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517908 (= res!1037812 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49347 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49347 a!2804))))))

(declare-fun res!1037817 () Bool)

(assert (=> start!129264 (=> (not res!1037817) (not e!846830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129264 (= res!1037817 (validMask!0 mask!2512))))

(assert (=> start!129264 e!846830))

(assert (=> start!129264 true))

(declare-fun array_inv!37825 (array!101120) Bool)

(assert (=> start!129264 (array_inv!37825 a!2804)))

(declare-fun b!1517909 () Bool)

(declare-fun res!1037815 () Bool)

(assert (=> b!1517909 (=> (not res!1037815) (not e!846831))))

(declare-fun lt!657963 () SeekEntryResult!12968)

(assert (=> b!1517909 (= res!1037815 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48797 a!2804) j!70) a!2804 mask!2512) lt!657963))))

(declare-fun b!1517910 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101120 (_ BitVec 32)) SeekEntryResult!12968)

(assert (=> b!1517910 (= e!846827 (= (seekEntry!0 (select (arr!48797 a!2804) j!70) a!2804 mask!2512) (Found!12968 j!70)))))

(declare-fun b!1517911 () Bool)

(declare-fun res!1037818 () Bool)

(assert (=> b!1517911 (=> (not res!1037818) (not e!846830))))

(declare-datatypes ((List!35280 0))(
  ( (Nil!35277) (Cons!35276 (h!36688 (_ BitVec 64)) (t!49974 List!35280)) )
))
(declare-fun arrayNoDuplicates!0 (array!101120 (_ BitVec 32) List!35280) Bool)

(assert (=> b!1517911 (= res!1037818 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35277))))

(declare-fun b!1517912 () Bool)

(assert (=> b!1517912 (= e!846832 e!846828)))

(declare-fun res!1037814 () Bool)

(assert (=> b!1517912 (=> res!1037814 e!846828)))

(assert (=> b!1517912 (= res!1037814 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657965 #b00000000000000000000000000000000) (bvsge lt!657965 (size!49347 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517912 (= lt!657965 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517913 () Bool)

(declare-fun res!1037807 () Bool)

(assert (=> b!1517913 (=> (not res!1037807) (not e!846830))))

(assert (=> b!1517913 (= res!1037807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517914 () Bool)

(declare-fun res!1037809 () Bool)

(assert (=> b!1517914 (=> (not res!1037809) (not e!846830))))

(assert (=> b!1517914 (= res!1037809 (and (= (size!49347 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49347 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49347 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517915 () Bool)

(assert (=> b!1517915 (= e!846830 e!846831)))

(declare-fun res!1037811 () Bool)

(assert (=> b!1517915 (=> (not res!1037811) (not e!846831))))

(assert (=> b!1517915 (= res!1037811 (= lt!657966 lt!657963))))

(assert (=> b!1517915 (= lt!657963 (Intermediate!12968 false resIndex!21 resX!21))))

(assert (=> b!1517915 (= lt!657966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48797 a!2804) j!70) mask!2512) (select (arr!48797 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129264 res!1037817) b!1517914))

(assert (= (and b!1517914 res!1037809) b!1517905))

(assert (= (and b!1517905 res!1037806) b!1517903))

(assert (= (and b!1517903 res!1037808) b!1517913))

(assert (= (and b!1517913 res!1037807) b!1517911))

(assert (= (and b!1517911 res!1037818) b!1517908))

(assert (= (and b!1517908 res!1037812) b!1517915))

(assert (= (and b!1517915 res!1037811) b!1517909))

(assert (= (and b!1517909 res!1037815) b!1517904))

(assert (= (and b!1517904 res!1037810) b!1517906))

(assert (= (and b!1517906 res!1037816) b!1517910))

(assert (= (and b!1517906 (not res!1037813)) b!1517912))

(assert (= (and b!1517912 (not res!1037814)) b!1517907))

(declare-fun m!1401205 () Bool)

(assert (=> b!1517909 m!1401205))

(assert (=> b!1517909 m!1401205))

(declare-fun m!1401207 () Bool)

(assert (=> b!1517909 m!1401207))

(declare-fun m!1401209 () Bool)

(assert (=> b!1517905 m!1401209))

(assert (=> b!1517905 m!1401209))

(declare-fun m!1401211 () Bool)

(assert (=> b!1517905 m!1401211))

(assert (=> b!1517910 m!1401205))

(assert (=> b!1517910 m!1401205))

(declare-fun m!1401213 () Bool)

(assert (=> b!1517910 m!1401213))

(assert (=> b!1517907 m!1401205))

(assert (=> b!1517907 m!1401205))

(declare-fun m!1401215 () Bool)

(assert (=> b!1517907 m!1401215))

(declare-fun m!1401217 () Bool)

(assert (=> b!1517913 m!1401217))

(declare-fun m!1401219 () Bool)

(assert (=> start!129264 m!1401219))

(declare-fun m!1401221 () Bool)

(assert (=> start!129264 m!1401221))

(assert (=> b!1517915 m!1401205))

(assert (=> b!1517915 m!1401205))

(declare-fun m!1401223 () Bool)

(assert (=> b!1517915 m!1401223))

(assert (=> b!1517915 m!1401223))

(assert (=> b!1517915 m!1401205))

(declare-fun m!1401225 () Bool)

(assert (=> b!1517915 m!1401225))

(assert (=> b!1517906 m!1401205))

(declare-fun m!1401227 () Bool)

(assert (=> b!1517906 m!1401227))

(declare-fun m!1401229 () Bool)

(assert (=> b!1517906 m!1401229))

(declare-fun m!1401231 () Bool)

(assert (=> b!1517906 m!1401231))

(declare-fun m!1401233 () Bool)

(assert (=> b!1517906 m!1401233))

(declare-fun m!1401235 () Bool)

(assert (=> b!1517912 m!1401235))

(assert (=> b!1517904 m!1401229))

(assert (=> b!1517904 m!1401231))

(assert (=> b!1517904 m!1401231))

(declare-fun m!1401237 () Bool)

(assert (=> b!1517904 m!1401237))

(assert (=> b!1517904 m!1401237))

(assert (=> b!1517904 m!1401231))

(declare-fun m!1401239 () Bool)

(assert (=> b!1517904 m!1401239))

(declare-fun m!1401241 () Bool)

(assert (=> b!1517911 m!1401241))

(assert (=> b!1517903 m!1401205))

(assert (=> b!1517903 m!1401205))

(declare-fun m!1401243 () Bool)

(assert (=> b!1517903 m!1401243))

(push 1)

