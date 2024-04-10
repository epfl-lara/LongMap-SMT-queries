; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130258 () Bool)

(assert start!130258)

(declare-fun b!1529208 () Bool)

(declare-fun res!1046925 () Bool)

(declare-fun e!852237 () Bool)

(assert (=> b!1529208 (=> (not res!1046925) (not e!852237))))

(declare-datatypes ((array!101608 0))(
  ( (array!101609 (arr!49029 (Array (_ BitVec 32) (_ BitVec 64))) (size!49579 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101608)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101608 (_ BitVec 32)) Bool)

(assert (=> b!1529208 (= res!1046925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529209 () Bool)

(declare-fun e!852238 () Bool)

(declare-fun e!852236 () Bool)

(assert (=> b!1529209 (= e!852238 (not e!852236))))

(declare-fun res!1046926 () Bool)

(assert (=> b!1529209 (=> res!1046926 e!852236)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529209 (= res!1046926 (or (not (= (select (arr!49029 a!2804) j!70) (select (store (arr!49029 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852235 () Bool)

(assert (=> b!1529209 e!852235))

(declare-fun res!1046920 () Bool)

(assert (=> b!1529209 (=> (not res!1046920) (not e!852235))))

(assert (=> b!1529209 (= res!1046920 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51172 0))(
  ( (Unit!51173) )
))
(declare-fun lt!662359 () Unit!51172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101608 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51172)

(assert (=> b!1529209 (= lt!662359 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529210 () Bool)

(declare-fun res!1046924 () Bool)

(assert (=> b!1529210 (=> (not res!1046924) (not e!852237))))

(assert (=> b!1529210 (= res!1046924 (and (= (size!49579 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49579 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49579 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529211 () Bool)

(declare-fun res!1046922 () Bool)

(assert (=> b!1529211 (=> (not res!1046922) (not e!852238))))

(declare-datatypes ((SeekEntryResult!13194 0))(
  ( (MissingZero!13194 (index!55171 (_ BitVec 32))) (Found!13194 (index!55172 (_ BitVec 32))) (Intermediate!13194 (undefined!14006 Bool) (index!55173 (_ BitVec 32)) (x!136857 (_ BitVec 32))) (Undefined!13194) (MissingVacant!13194 (index!55174 (_ BitVec 32))) )
))
(declare-fun lt!662356 () SeekEntryResult!13194)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101608 (_ BitVec 32)) SeekEntryResult!13194)

(assert (=> b!1529211 (= res!1046922 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49029 a!2804) j!70) a!2804 mask!2512) lt!662356))))

(declare-fun b!1529212 () Bool)

(assert (=> b!1529212 (= e!852236 true)))

(declare-fun lt!662357 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529212 (= lt!662357 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529214 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101608 (_ BitVec 32)) SeekEntryResult!13194)

(assert (=> b!1529214 (= e!852235 (= (seekEntry!0 (select (arr!49029 a!2804) j!70) a!2804 mask!2512) (Found!13194 j!70)))))

(declare-fun b!1529215 () Bool)

(declare-fun res!1046921 () Bool)

(assert (=> b!1529215 (=> (not res!1046921) (not e!852237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529215 (= res!1046921 (validKeyInArray!0 (select (arr!49029 a!2804) i!961)))))

(declare-fun b!1529216 () Bool)

(declare-fun res!1046916 () Bool)

(assert (=> b!1529216 (=> (not res!1046916) (not e!852237))))

(assert (=> b!1529216 (= res!1046916 (validKeyInArray!0 (select (arr!49029 a!2804) j!70)))))

(declare-fun b!1529217 () Bool)

(declare-fun res!1046918 () Bool)

(assert (=> b!1529217 (=> (not res!1046918) (not e!852237))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529217 (= res!1046918 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49579 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49579 a!2804))))))

(declare-fun res!1046923 () Bool)

(assert (=> start!130258 (=> (not res!1046923) (not e!852237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130258 (= res!1046923 (validMask!0 mask!2512))))

(assert (=> start!130258 e!852237))

(assert (=> start!130258 true))

(declare-fun array_inv!38057 (array!101608) Bool)

(assert (=> start!130258 (array_inv!38057 a!2804)))

(declare-fun b!1529213 () Bool)

(declare-fun res!1046919 () Bool)

(assert (=> b!1529213 (=> (not res!1046919) (not e!852237))))

(declare-datatypes ((List!35512 0))(
  ( (Nil!35509) (Cons!35508 (h!36944 (_ BitVec 64)) (t!50206 List!35512)) )
))
(declare-fun arrayNoDuplicates!0 (array!101608 (_ BitVec 32) List!35512) Bool)

(assert (=> b!1529213 (= res!1046919 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35509))))

(declare-fun b!1529218 () Bool)

(assert (=> b!1529218 (= e!852237 e!852238)))

(declare-fun res!1046915 () Bool)

(assert (=> b!1529218 (=> (not res!1046915) (not e!852238))))

(declare-fun lt!662358 () SeekEntryResult!13194)

(assert (=> b!1529218 (= res!1046915 (= lt!662358 lt!662356))))

(assert (=> b!1529218 (= lt!662356 (Intermediate!13194 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529218 (= lt!662358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49029 a!2804) j!70) mask!2512) (select (arr!49029 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529219 () Bool)

(declare-fun res!1046917 () Bool)

(assert (=> b!1529219 (=> (not res!1046917) (not e!852238))))

(assert (=> b!1529219 (= res!1046917 (= lt!662358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49029 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49029 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101609 (store (arr!49029 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49579 a!2804)) mask!2512)))))

(assert (= (and start!130258 res!1046923) b!1529210))

(assert (= (and b!1529210 res!1046924) b!1529215))

(assert (= (and b!1529215 res!1046921) b!1529216))

(assert (= (and b!1529216 res!1046916) b!1529208))

(assert (= (and b!1529208 res!1046925) b!1529213))

(assert (= (and b!1529213 res!1046919) b!1529217))

(assert (= (and b!1529217 res!1046918) b!1529218))

(assert (= (and b!1529218 res!1046915) b!1529211))

(assert (= (and b!1529211 res!1046922) b!1529219))

(assert (= (and b!1529219 res!1046917) b!1529209))

(assert (= (and b!1529209 res!1046920) b!1529214))

(assert (= (and b!1529209 (not res!1046926)) b!1529212))

(declare-fun m!1412141 () Bool)

(assert (=> b!1529212 m!1412141))

(declare-fun m!1412143 () Bool)

(assert (=> start!130258 m!1412143))

(declare-fun m!1412145 () Bool)

(assert (=> start!130258 m!1412145))

(declare-fun m!1412147 () Bool)

(assert (=> b!1529208 m!1412147))

(declare-fun m!1412149 () Bool)

(assert (=> b!1529209 m!1412149))

(declare-fun m!1412151 () Bool)

(assert (=> b!1529209 m!1412151))

(declare-fun m!1412153 () Bool)

(assert (=> b!1529209 m!1412153))

(declare-fun m!1412155 () Bool)

(assert (=> b!1529209 m!1412155))

(declare-fun m!1412157 () Bool)

(assert (=> b!1529209 m!1412157))

(declare-fun m!1412159 () Bool)

(assert (=> b!1529213 m!1412159))

(assert (=> b!1529211 m!1412149))

(assert (=> b!1529211 m!1412149))

(declare-fun m!1412161 () Bool)

(assert (=> b!1529211 m!1412161))

(assert (=> b!1529216 m!1412149))

(assert (=> b!1529216 m!1412149))

(declare-fun m!1412163 () Bool)

(assert (=> b!1529216 m!1412163))

(assert (=> b!1529218 m!1412149))

(assert (=> b!1529218 m!1412149))

(declare-fun m!1412165 () Bool)

(assert (=> b!1529218 m!1412165))

(assert (=> b!1529218 m!1412165))

(assert (=> b!1529218 m!1412149))

(declare-fun m!1412167 () Bool)

(assert (=> b!1529218 m!1412167))

(assert (=> b!1529214 m!1412149))

(assert (=> b!1529214 m!1412149))

(declare-fun m!1412169 () Bool)

(assert (=> b!1529214 m!1412169))

(assert (=> b!1529219 m!1412153))

(assert (=> b!1529219 m!1412155))

(assert (=> b!1529219 m!1412155))

(declare-fun m!1412171 () Bool)

(assert (=> b!1529219 m!1412171))

(assert (=> b!1529219 m!1412171))

(assert (=> b!1529219 m!1412155))

(declare-fun m!1412173 () Bool)

(assert (=> b!1529219 m!1412173))

(declare-fun m!1412175 () Bool)

(assert (=> b!1529215 m!1412175))

(assert (=> b!1529215 m!1412175))

(declare-fun m!1412177 () Bool)

(assert (=> b!1529215 m!1412177))

(check-sat (not b!1529219) (not b!1529214) (not b!1529209) (not b!1529218) (not b!1529212) (not start!130258) (not b!1529215) (not b!1529211) (not b!1529216) (not b!1529213) (not b!1529208))
(check-sat)
