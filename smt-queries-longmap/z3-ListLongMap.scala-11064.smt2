; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129572 () Bool)

(assert start!129572)

(declare-fun b!1519081 () Bool)

(declare-fun res!1037630 () Bool)

(declare-fun e!847705 () Bool)

(assert (=> b!1519081 (=> (not res!1037630) (not e!847705))))

(declare-datatypes ((SeekEntryResult!12890 0))(
  ( (MissingZero!12890 (index!53955 (_ BitVec 32))) (Found!12890 (index!53956 (_ BitVec 32))) (Intermediate!12890 (undefined!13702 Bool) (index!53957 (_ BitVec 32)) (x!135851 (_ BitVec 32))) (Undefined!12890) (MissingVacant!12890 (index!53958 (_ BitVec 32))) )
))
(declare-fun lt!658402 () SeekEntryResult!12890)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101191 0))(
  ( (array!101192 (arr!48826 (Array (_ BitVec 32) (_ BitVec 64))) (size!49377 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101191)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101191 (_ BitVec 32)) SeekEntryResult!12890)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519081 (= res!1037630 (= lt!658402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48826 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48826 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101192 (store (arr!48826 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49377 a!2804)) mask!2512)))))

(declare-fun b!1519082 () Bool)

(declare-fun res!1037628 () Bool)

(declare-fun e!847709 () Bool)

(assert (=> b!1519082 (=> (not res!1037628) (not e!847709))))

(declare-datatypes ((List!35296 0))(
  ( (Nil!35293) (Cons!35292 (h!36722 (_ BitVec 64)) (t!49982 List!35296)) )
))
(declare-fun arrayNoDuplicates!0 (array!101191 (_ BitVec 32) List!35296) Bool)

(assert (=> b!1519082 (= res!1037628 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35293))))

(declare-fun b!1519083 () Bool)

(declare-fun e!847706 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101191 (_ BitVec 32)) SeekEntryResult!12890)

(assert (=> b!1519083 (= e!847706 (= (seekEntry!0 (select (arr!48826 a!2804) j!70) a!2804 mask!2512) (Found!12890 j!70)))))

(declare-fun b!1519084 () Bool)

(declare-fun res!1037624 () Bool)

(assert (=> b!1519084 (=> (not res!1037624) (not e!847709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101191 (_ BitVec 32)) Bool)

(assert (=> b!1519084 (= res!1037624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519085 () Bool)

(declare-fun e!847710 () Bool)

(assert (=> b!1519085 (= e!847705 (not e!847710))))

(declare-fun res!1037632 () Bool)

(assert (=> b!1519085 (=> res!1037632 e!847710)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519085 (= res!1037632 (or (not (= (select (arr!48826 a!2804) j!70) (select (store (arr!48826 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1519085 e!847706))

(declare-fun res!1037636 () Bool)

(assert (=> b!1519085 (=> (not res!1037636) (not e!847706))))

(assert (=> b!1519085 (= res!1037636 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50683 0))(
  ( (Unit!50684) )
))
(declare-fun lt!658403 () Unit!50683)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50683)

(assert (=> b!1519085 (= lt!658403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1037627 () Bool)

(assert (=> start!129572 (=> (not res!1037627) (not e!847709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129572 (= res!1037627 (validMask!0 mask!2512))))

(assert (=> start!129572 e!847709))

(assert (=> start!129572 true))

(declare-fun array_inv!38107 (array!101191) Bool)

(assert (=> start!129572 (array_inv!38107 a!2804)))

(declare-fun b!1519086 () Bool)

(declare-fun res!1037625 () Bool)

(assert (=> b!1519086 (=> (not res!1037625) (not e!847709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519086 (= res!1037625 (validKeyInArray!0 (select (arr!48826 a!2804) i!961)))))

(declare-fun b!1519087 () Bool)

(declare-fun e!847707 () Bool)

(assert (=> b!1519087 (= e!847710 e!847707)))

(declare-fun res!1037633 () Bool)

(assert (=> b!1519087 (=> res!1037633 e!847707)))

(declare-fun lt!658401 () (_ BitVec 32))

(assert (=> b!1519087 (= res!1037633 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658401 #b00000000000000000000000000000000) (bvsge lt!658401 (size!49377 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519087 (= lt!658401 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1519088 () Bool)

(assert (=> b!1519088 (= e!847709 e!847705)))

(declare-fun res!1037629 () Bool)

(assert (=> b!1519088 (=> (not res!1037629) (not e!847705))))

(declare-fun lt!658405 () SeekEntryResult!12890)

(assert (=> b!1519088 (= res!1037629 (= lt!658402 lt!658405))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519088 (= lt!658405 (Intermediate!12890 false resIndex!21 resX!21))))

(assert (=> b!1519088 (= lt!658402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48826 a!2804) j!70) mask!2512) (select (arr!48826 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519089 () Bool)

(declare-fun res!1037626 () Bool)

(assert (=> b!1519089 (=> (not res!1037626) (not e!847709))))

(assert (=> b!1519089 (= res!1037626 (and (= (size!49377 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49377 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49377 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519090 () Bool)

(declare-fun res!1037635 () Bool)

(assert (=> b!1519090 (=> (not res!1037635) (not e!847709))))

(assert (=> b!1519090 (= res!1037635 (validKeyInArray!0 (select (arr!48826 a!2804) j!70)))))

(declare-fun b!1519091 () Bool)

(declare-fun res!1037634 () Bool)

(assert (=> b!1519091 (=> (not res!1037634) (not e!847705))))

(assert (=> b!1519091 (= res!1037634 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48826 a!2804) j!70) a!2804 mask!2512) lt!658405))))

(declare-fun b!1519092 () Bool)

(assert (=> b!1519092 (= e!847707 true)))

(declare-fun lt!658404 () SeekEntryResult!12890)

(assert (=> b!1519092 (= lt!658404 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658401 (select (arr!48826 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519093 () Bool)

(declare-fun res!1037631 () Bool)

(assert (=> b!1519093 (=> (not res!1037631) (not e!847709))))

(assert (=> b!1519093 (= res!1037631 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49377 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49377 a!2804))))))

(assert (= (and start!129572 res!1037627) b!1519089))

(assert (= (and b!1519089 res!1037626) b!1519086))

(assert (= (and b!1519086 res!1037625) b!1519090))

(assert (= (and b!1519090 res!1037635) b!1519084))

(assert (= (and b!1519084 res!1037624) b!1519082))

(assert (= (and b!1519082 res!1037628) b!1519093))

(assert (= (and b!1519093 res!1037631) b!1519088))

(assert (= (and b!1519088 res!1037629) b!1519091))

(assert (= (and b!1519091 res!1037634) b!1519081))

(assert (= (and b!1519081 res!1037630) b!1519085))

(assert (= (and b!1519085 res!1037636) b!1519083))

(assert (= (and b!1519085 (not res!1037632)) b!1519087))

(assert (= (and b!1519087 (not res!1037633)) b!1519092))

(declare-fun m!1402209 () Bool)

(assert (=> start!129572 m!1402209))

(declare-fun m!1402211 () Bool)

(assert (=> start!129572 m!1402211))

(declare-fun m!1402213 () Bool)

(assert (=> b!1519083 m!1402213))

(assert (=> b!1519083 m!1402213))

(declare-fun m!1402215 () Bool)

(assert (=> b!1519083 m!1402215))

(assert (=> b!1519090 m!1402213))

(assert (=> b!1519090 m!1402213))

(declare-fun m!1402217 () Bool)

(assert (=> b!1519090 m!1402217))

(declare-fun m!1402219 () Bool)

(assert (=> b!1519082 m!1402219))

(declare-fun m!1402221 () Bool)

(assert (=> b!1519081 m!1402221))

(declare-fun m!1402223 () Bool)

(assert (=> b!1519081 m!1402223))

(assert (=> b!1519081 m!1402223))

(declare-fun m!1402225 () Bool)

(assert (=> b!1519081 m!1402225))

(assert (=> b!1519081 m!1402225))

(assert (=> b!1519081 m!1402223))

(declare-fun m!1402227 () Bool)

(assert (=> b!1519081 m!1402227))

(assert (=> b!1519088 m!1402213))

(assert (=> b!1519088 m!1402213))

(declare-fun m!1402229 () Bool)

(assert (=> b!1519088 m!1402229))

(assert (=> b!1519088 m!1402229))

(assert (=> b!1519088 m!1402213))

(declare-fun m!1402231 () Bool)

(assert (=> b!1519088 m!1402231))

(assert (=> b!1519085 m!1402213))

(declare-fun m!1402233 () Bool)

(assert (=> b!1519085 m!1402233))

(assert (=> b!1519085 m!1402221))

(assert (=> b!1519085 m!1402223))

(declare-fun m!1402235 () Bool)

(assert (=> b!1519085 m!1402235))

(assert (=> b!1519092 m!1402213))

(assert (=> b!1519092 m!1402213))

(declare-fun m!1402237 () Bool)

(assert (=> b!1519092 m!1402237))

(declare-fun m!1402239 () Bool)

(assert (=> b!1519086 m!1402239))

(assert (=> b!1519086 m!1402239))

(declare-fun m!1402241 () Bool)

(assert (=> b!1519086 m!1402241))

(assert (=> b!1519091 m!1402213))

(assert (=> b!1519091 m!1402213))

(declare-fun m!1402243 () Bool)

(assert (=> b!1519091 m!1402243))

(declare-fun m!1402245 () Bool)

(assert (=> b!1519087 m!1402245))

(declare-fun m!1402247 () Bool)

(assert (=> b!1519084 m!1402247))

(check-sat (not b!1519092) (not b!1519082) (not b!1519084) (not b!1519081) (not b!1519087) (not b!1519091) (not b!1519085) (not start!129572) (not b!1519088) (not b!1519090) (not b!1519086) (not b!1519083))
(check-sat)
