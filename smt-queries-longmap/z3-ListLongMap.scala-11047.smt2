; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129062 () Bool)

(assert start!129062)

(declare-fun b!1514701 () Bool)

(declare-fun res!1034819 () Bool)

(declare-fun e!845256 () Bool)

(assert (=> b!1514701 (=> (not res!1034819) (not e!845256))))

(declare-datatypes ((array!100918 0))(
  ( (array!100919 (arr!48697 (Array (_ BitVec 32) (_ BitVec 64))) (size!49249 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100918)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100918 (_ BitVec 32)) Bool)

(assert (=> b!1514701 (= res!1034819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514702 () Bool)

(declare-fun e!845258 () Bool)

(declare-fun e!845259 () Bool)

(assert (=> b!1514702 (= e!845258 e!845259)))

(declare-fun res!1034822 () Bool)

(assert (=> b!1514702 (=> (not res!1034822) (not e!845259))))

(declare-fun lt!656267 () array!100918)

(declare-datatypes ((SeekEntryResult!12891 0))(
  ( (MissingZero!12891 (index!53959 (_ BitVec 32))) (Found!12891 (index!53960 (_ BitVec 32))) (Intermediate!12891 (undefined!13703 Bool) (index!53961 (_ BitVec 32)) (x!135667 (_ BitVec 32))) (Undefined!12891) (MissingVacant!12891 (index!53962 (_ BitVec 32))) )
))
(declare-fun lt!656268 () SeekEntryResult!12891)

(declare-fun lt!656265 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12891)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514702 (= res!1034822 (= lt!656268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656265 mask!2512) lt!656265 lt!656267 mask!2512)))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514702 (= lt!656265 (select (store (arr!48697 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514702 (= lt!656267 (array!100919 (store (arr!48697 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49249 a!2804)))))

(declare-fun e!845262 () Bool)

(declare-fun b!1514703 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12891)

(assert (=> b!1514703 (= e!845262 (= (seekEntry!0 (select (arr!48697 a!2804) j!70) a!2804 mask!2512) (Found!12891 j!70)))))

(declare-fun b!1514704 () Bool)

(declare-fun res!1034821 () Bool)

(assert (=> b!1514704 (=> (not res!1034821) (not e!845256))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514704 (= res!1034821 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49249 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49249 a!2804))))))

(declare-fun b!1514705 () Bool)

(declare-fun e!845257 () Bool)

(assert (=> b!1514705 (= e!845259 (not e!845257))))

(declare-fun res!1034820 () Bool)

(assert (=> b!1514705 (=> res!1034820 e!845257)))

(assert (=> b!1514705 (= res!1034820 (or (not (= (select (arr!48697 a!2804) j!70) lt!656265)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48697 a!2804) index!487) (select (arr!48697 a!2804) j!70)) (not (= (select (arr!48697 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1514705 e!845262))

(declare-fun res!1034818 () Bool)

(assert (=> b!1514705 (=> (not res!1034818) (not e!845262))))

(assert (=> b!1514705 (= res!1034818 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50489 0))(
  ( (Unit!50490) )
))
(declare-fun lt!656271 () Unit!50489)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50489)

(assert (=> b!1514705 (= lt!656271 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514706 () Bool)

(declare-fun e!845260 () Bool)

(assert (=> b!1514706 (= e!845257 e!845260)))

(declare-fun res!1034817 () Bool)

(assert (=> b!1514706 (=> res!1034817 e!845260)))

(declare-fun lt!656269 () SeekEntryResult!12891)

(assert (=> b!1514706 (= res!1034817 (not (= lt!656269 (Found!12891 j!70))))))

(declare-fun lt!656273 () SeekEntryResult!12891)

(declare-fun lt!656272 () SeekEntryResult!12891)

(assert (=> b!1514706 (= lt!656273 lt!656272)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12891)

(assert (=> b!1514706 (= lt!656272 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656265 lt!656267 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12891)

(assert (=> b!1514706 (= lt!656273 (seekEntryOrOpen!0 lt!656265 lt!656267 mask!2512))))

(declare-fun lt!656274 () SeekEntryResult!12891)

(assert (=> b!1514706 (= lt!656274 lt!656269)))

(assert (=> b!1514706 (= lt!656269 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48697 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1514706 (= lt!656274 (seekEntryOrOpen!0 (select (arr!48697 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514707 () Bool)

(declare-fun res!1034810 () Bool)

(assert (=> b!1514707 (=> (not res!1034810) (not e!845256))))

(assert (=> b!1514707 (= res!1034810 (and (= (size!49249 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49249 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49249 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514708 () Bool)

(assert (=> b!1514708 (= e!845260 true)))

(assert (=> b!1514708 (= lt!656272 lt!656269)))

(declare-fun lt!656270 () Unit!50489)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50489)

(assert (=> b!1514708 (= lt!656270 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1514709 () Bool)

(assert (=> b!1514709 (= e!845256 e!845258)))

(declare-fun res!1034816 () Bool)

(assert (=> b!1514709 (=> (not res!1034816) (not e!845258))))

(declare-fun lt!656266 () SeekEntryResult!12891)

(assert (=> b!1514709 (= res!1034816 (= lt!656268 lt!656266))))

(assert (=> b!1514709 (= lt!656266 (Intermediate!12891 false resIndex!21 resX!21))))

(assert (=> b!1514709 (= lt!656268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48697 a!2804) j!70) mask!2512) (select (arr!48697 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1034812 () Bool)

(assert (=> start!129062 (=> (not res!1034812) (not e!845256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129062 (= res!1034812 (validMask!0 mask!2512))))

(assert (=> start!129062 e!845256))

(assert (=> start!129062 true))

(declare-fun array_inv!37930 (array!100918) Bool)

(assert (=> start!129062 (array_inv!37930 a!2804)))

(declare-fun b!1514710 () Bool)

(declare-fun res!1034813 () Bool)

(assert (=> b!1514710 (=> (not res!1034813) (not e!845256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514710 (= res!1034813 (validKeyInArray!0 (select (arr!48697 a!2804) i!961)))))

(declare-fun b!1514711 () Bool)

(declare-fun res!1034815 () Bool)

(assert (=> b!1514711 (=> (not res!1034815) (not e!845258))))

(assert (=> b!1514711 (= res!1034815 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48697 a!2804) j!70) a!2804 mask!2512) lt!656266))))

(declare-fun b!1514712 () Bool)

(declare-fun res!1034811 () Bool)

(assert (=> b!1514712 (=> (not res!1034811) (not e!845256))))

(assert (=> b!1514712 (= res!1034811 (validKeyInArray!0 (select (arr!48697 a!2804) j!70)))))

(declare-fun b!1514713 () Bool)

(declare-fun res!1034814 () Bool)

(assert (=> b!1514713 (=> (not res!1034814) (not e!845256))))

(declare-datatypes ((List!35258 0))(
  ( (Nil!35255) (Cons!35254 (h!36667 (_ BitVec 64)) (t!49944 List!35258)) )
))
(declare-fun arrayNoDuplicates!0 (array!100918 (_ BitVec 32) List!35258) Bool)

(assert (=> b!1514713 (= res!1034814 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35255))))

(assert (= (and start!129062 res!1034812) b!1514707))

(assert (= (and b!1514707 res!1034810) b!1514710))

(assert (= (and b!1514710 res!1034813) b!1514712))

(assert (= (and b!1514712 res!1034811) b!1514701))

(assert (= (and b!1514701 res!1034819) b!1514713))

(assert (= (and b!1514713 res!1034814) b!1514704))

(assert (= (and b!1514704 res!1034821) b!1514709))

(assert (= (and b!1514709 res!1034816) b!1514711))

(assert (= (and b!1514711 res!1034815) b!1514702))

(assert (= (and b!1514702 res!1034822) b!1514705))

(assert (= (and b!1514705 res!1034818) b!1514703))

(assert (= (and b!1514705 (not res!1034820)) b!1514706))

(assert (= (and b!1514706 (not res!1034817)) b!1514708))

(declare-fun m!1397147 () Bool)

(assert (=> b!1514703 m!1397147))

(assert (=> b!1514703 m!1397147))

(declare-fun m!1397149 () Bool)

(assert (=> b!1514703 m!1397149))

(assert (=> b!1514711 m!1397147))

(assert (=> b!1514711 m!1397147))

(declare-fun m!1397151 () Bool)

(assert (=> b!1514711 m!1397151))

(declare-fun m!1397153 () Bool)

(assert (=> b!1514713 m!1397153))

(declare-fun m!1397155 () Bool)

(assert (=> b!1514708 m!1397155))

(assert (=> b!1514709 m!1397147))

(assert (=> b!1514709 m!1397147))

(declare-fun m!1397157 () Bool)

(assert (=> b!1514709 m!1397157))

(assert (=> b!1514709 m!1397157))

(assert (=> b!1514709 m!1397147))

(declare-fun m!1397159 () Bool)

(assert (=> b!1514709 m!1397159))

(assert (=> b!1514712 m!1397147))

(assert (=> b!1514712 m!1397147))

(declare-fun m!1397161 () Bool)

(assert (=> b!1514712 m!1397161))

(declare-fun m!1397163 () Bool)

(assert (=> b!1514701 m!1397163))

(declare-fun m!1397165 () Bool)

(assert (=> start!129062 m!1397165))

(declare-fun m!1397167 () Bool)

(assert (=> start!129062 m!1397167))

(assert (=> b!1514705 m!1397147))

(declare-fun m!1397169 () Bool)

(assert (=> b!1514705 m!1397169))

(declare-fun m!1397171 () Bool)

(assert (=> b!1514705 m!1397171))

(declare-fun m!1397173 () Bool)

(assert (=> b!1514705 m!1397173))

(declare-fun m!1397175 () Bool)

(assert (=> b!1514702 m!1397175))

(assert (=> b!1514702 m!1397175))

(declare-fun m!1397177 () Bool)

(assert (=> b!1514702 m!1397177))

(declare-fun m!1397179 () Bool)

(assert (=> b!1514702 m!1397179))

(declare-fun m!1397181 () Bool)

(assert (=> b!1514702 m!1397181))

(assert (=> b!1514706 m!1397147))

(declare-fun m!1397183 () Bool)

(assert (=> b!1514706 m!1397183))

(assert (=> b!1514706 m!1397147))

(declare-fun m!1397185 () Bool)

(assert (=> b!1514706 m!1397185))

(assert (=> b!1514706 m!1397147))

(declare-fun m!1397187 () Bool)

(assert (=> b!1514706 m!1397187))

(declare-fun m!1397189 () Bool)

(assert (=> b!1514706 m!1397189))

(declare-fun m!1397191 () Bool)

(assert (=> b!1514710 m!1397191))

(assert (=> b!1514710 m!1397191))

(declare-fun m!1397193 () Bool)

(assert (=> b!1514710 m!1397193))

(check-sat (not b!1514701) (not b!1514711) (not b!1514708) (not b!1514710) (not b!1514705) (not b!1514712) (not b!1514702) (not b!1514709) (not b!1514713) (not b!1514703) (not b!1514706) (not start!129062))
(check-sat)
