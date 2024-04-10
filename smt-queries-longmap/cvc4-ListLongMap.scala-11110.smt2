; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129768 () Bool)

(assert start!129768)

(declare-fun res!1042061 () Bool)

(declare-fun e!849232 () Bool)

(assert (=> start!129768 (=> (not res!1042061) (not e!849232))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129768 (= res!1042061 (validMask!0 mask!2512))))

(assert (=> start!129768 e!849232))

(assert (=> start!129768 true))

(declare-datatypes ((array!101364 0))(
  ( (array!101365 (arr!48913 (Array (_ BitVec 32) (_ BitVec 64))) (size!49463 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101364)

(declare-fun array_inv!37941 (array!101364) Bool)

(assert (=> start!129768 (array_inv!37941 a!2804)))

(declare-fun b!1523149 () Bool)

(declare-fun e!849235 () Bool)

(assert (=> b!1523149 (= e!849232 e!849235)))

(declare-fun res!1042066 () Bool)

(assert (=> b!1523149 (=> (not res!1042066) (not e!849235))))

(declare-datatypes ((SeekEntryResult!13078 0))(
  ( (MissingZero!13078 (index!54707 (_ BitVec 32))) (Found!13078 (index!54708 (_ BitVec 32))) (Intermediate!13078 (undefined!13890 Bool) (index!54709 (_ BitVec 32)) (x!136396 (_ BitVec 32))) (Undefined!13078) (MissingVacant!13078 (index!54710 (_ BitVec 32))) )
))
(declare-fun lt!659873 () SeekEntryResult!13078)

(declare-fun lt!659874 () SeekEntryResult!13078)

(assert (=> b!1523149 (= res!1042066 (= lt!659873 lt!659874))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523149 (= lt!659874 (Intermediate!13078 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101364 (_ BitVec 32)) SeekEntryResult!13078)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523149 (= lt!659873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48913 a!2804) j!70) mask!2512) (select (arr!48913 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523150 () Bool)

(assert (=> b!1523150 (= e!849235 (not true))))

(declare-fun e!849234 () Bool)

(assert (=> b!1523150 e!849234))

(declare-fun res!1042058 () Bool)

(assert (=> b!1523150 (=> (not res!1042058) (not e!849234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101364 (_ BitVec 32)) Bool)

(assert (=> b!1523150 (= res!1042058 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50940 0))(
  ( (Unit!50941) )
))
(declare-fun lt!659875 () Unit!50940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50940)

(assert (=> b!1523150 (= lt!659875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523151 () Bool)

(declare-fun res!1042064 () Bool)

(assert (=> b!1523151 (=> (not res!1042064) (not e!849235))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523151 (= res!1042064 (= lt!659873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48913 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48913 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101365 (store (arr!48913 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49463 a!2804)) mask!2512)))))

(declare-fun b!1523152 () Bool)

(declare-fun res!1042056 () Bool)

(assert (=> b!1523152 (=> (not res!1042056) (not e!849232))))

(declare-datatypes ((List!35396 0))(
  ( (Nil!35393) (Cons!35392 (h!36816 (_ BitVec 64)) (t!50090 List!35396)) )
))
(declare-fun arrayNoDuplicates!0 (array!101364 (_ BitVec 32) List!35396) Bool)

(assert (=> b!1523152 (= res!1042056 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35393))))

(declare-fun b!1523153 () Bool)

(declare-fun res!1042059 () Bool)

(assert (=> b!1523153 (=> (not res!1042059) (not e!849232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523153 (= res!1042059 (validKeyInArray!0 (select (arr!48913 a!2804) i!961)))))

(declare-fun b!1523154 () Bool)

(declare-fun res!1042057 () Bool)

(assert (=> b!1523154 (=> (not res!1042057) (not e!849232))))

(assert (=> b!1523154 (= res!1042057 (validKeyInArray!0 (select (arr!48913 a!2804) j!70)))))

(declare-fun b!1523155 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101364 (_ BitVec 32)) SeekEntryResult!13078)

(assert (=> b!1523155 (= e!849234 (= (seekEntry!0 (select (arr!48913 a!2804) j!70) a!2804 mask!2512) (Found!13078 j!70)))))

(declare-fun b!1523156 () Bool)

(declare-fun res!1042063 () Bool)

(assert (=> b!1523156 (=> (not res!1042063) (not e!849232))))

(assert (=> b!1523156 (= res!1042063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523157 () Bool)

(declare-fun res!1042065 () Bool)

(assert (=> b!1523157 (=> (not res!1042065) (not e!849232))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523157 (= res!1042065 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49463 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49463 a!2804))))))

(declare-fun b!1523158 () Bool)

(declare-fun res!1042060 () Bool)

(assert (=> b!1523158 (=> (not res!1042060) (not e!849232))))

(assert (=> b!1523158 (= res!1042060 (and (= (size!49463 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49463 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49463 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523159 () Bool)

(declare-fun res!1042062 () Bool)

(assert (=> b!1523159 (=> (not res!1042062) (not e!849235))))

(assert (=> b!1523159 (= res!1042062 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48913 a!2804) j!70) a!2804 mask!2512) lt!659874))))

(assert (= (and start!129768 res!1042061) b!1523158))

(assert (= (and b!1523158 res!1042060) b!1523153))

(assert (= (and b!1523153 res!1042059) b!1523154))

(assert (= (and b!1523154 res!1042057) b!1523156))

(assert (= (and b!1523156 res!1042063) b!1523152))

(assert (= (and b!1523152 res!1042056) b!1523157))

(assert (= (and b!1523157 res!1042065) b!1523149))

(assert (= (and b!1523149 res!1042066) b!1523159))

(assert (= (and b!1523159 res!1042062) b!1523151))

(assert (= (and b!1523151 res!1042064) b!1523150))

(assert (= (and b!1523150 res!1042058) b!1523155))

(declare-fun m!1406241 () Bool)

(assert (=> b!1523159 m!1406241))

(assert (=> b!1523159 m!1406241))

(declare-fun m!1406243 () Bool)

(assert (=> b!1523159 m!1406243))

(declare-fun m!1406245 () Bool)

(assert (=> start!129768 m!1406245))

(declare-fun m!1406247 () Bool)

(assert (=> start!129768 m!1406247))

(declare-fun m!1406249 () Bool)

(assert (=> b!1523150 m!1406249))

(declare-fun m!1406251 () Bool)

(assert (=> b!1523150 m!1406251))

(assert (=> b!1523155 m!1406241))

(assert (=> b!1523155 m!1406241))

(declare-fun m!1406253 () Bool)

(assert (=> b!1523155 m!1406253))

(declare-fun m!1406255 () Bool)

(assert (=> b!1523153 m!1406255))

(assert (=> b!1523153 m!1406255))

(declare-fun m!1406257 () Bool)

(assert (=> b!1523153 m!1406257))

(assert (=> b!1523154 m!1406241))

(assert (=> b!1523154 m!1406241))

(declare-fun m!1406259 () Bool)

(assert (=> b!1523154 m!1406259))

(assert (=> b!1523149 m!1406241))

(assert (=> b!1523149 m!1406241))

(declare-fun m!1406261 () Bool)

(assert (=> b!1523149 m!1406261))

(assert (=> b!1523149 m!1406261))

(assert (=> b!1523149 m!1406241))

(declare-fun m!1406263 () Bool)

(assert (=> b!1523149 m!1406263))

(declare-fun m!1406265 () Bool)

(assert (=> b!1523152 m!1406265))

(declare-fun m!1406267 () Bool)

(assert (=> b!1523156 m!1406267))

(declare-fun m!1406269 () Bool)

(assert (=> b!1523151 m!1406269))

(declare-fun m!1406271 () Bool)

(assert (=> b!1523151 m!1406271))

(assert (=> b!1523151 m!1406271))

(declare-fun m!1406273 () Bool)

(assert (=> b!1523151 m!1406273))

(assert (=> b!1523151 m!1406273))

(assert (=> b!1523151 m!1406271))

(declare-fun m!1406275 () Bool)

(assert (=> b!1523151 m!1406275))

(push 1)

