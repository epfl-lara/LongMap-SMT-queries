; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129632 () Bool)

(assert start!129632)

(declare-fun b!1520251 () Bool)

(declare-fun res!1038797 () Bool)

(declare-fun e!848249 () Bool)

(assert (=> b!1520251 (=> (not res!1038797) (not e!848249))))

(declare-datatypes ((array!101251 0))(
  ( (array!101252 (arr!48856 (Array (_ BitVec 32) (_ BitVec 64))) (size!49407 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101251)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520251 (= res!1038797 (validKeyInArray!0 (select (arr!48856 a!2804) i!961)))))

(declare-fun b!1520252 () Bool)

(declare-fun res!1038794 () Bool)

(assert (=> b!1520252 (=> (not res!1038794) (not e!848249))))

(declare-datatypes ((List!35326 0))(
  ( (Nil!35323) (Cons!35322 (h!36752 (_ BitVec 64)) (t!50012 List!35326)) )
))
(declare-fun arrayNoDuplicates!0 (array!101251 (_ BitVec 32) List!35326) Bool)

(assert (=> b!1520252 (= res!1038794 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35323))))

(declare-fun res!1038796 () Bool)

(assert (=> start!129632 (=> (not res!1038796) (not e!848249))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129632 (= res!1038796 (validMask!0 mask!2512))))

(assert (=> start!129632 e!848249))

(assert (=> start!129632 true))

(declare-fun array_inv!38137 (array!101251) Bool)

(assert (=> start!129632 (array_inv!38137 a!2804)))

(declare-fun b!1520253 () Bool)

(declare-fun res!1038804 () Bool)

(assert (=> b!1520253 (=> (not res!1038804) (not e!848249))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520253 (= res!1038804 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49407 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49407 a!2804))))))

(declare-fun e!848248 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun b!1520254 () Bool)

(declare-datatypes ((SeekEntryResult!12920 0))(
  ( (MissingZero!12920 (index!54075 (_ BitVec 32))) (Found!12920 (index!54076 (_ BitVec 32))) (Intermediate!12920 (undefined!13732 Bool) (index!54077 (_ BitVec 32)) (x!135961 (_ BitVec 32))) (Undefined!12920) (MissingVacant!12920 (index!54078 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101251 (_ BitVec 32)) SeekEntryResult!12920)

(assert (=> b!1520254 (= e!848248 (= (seekEntry!0 (select (arr!48856 a!2804) j!70) a!2804 mask!2512) (Found!12920 j!70)))))

(declare-fun b!1520255 () Bool)

(declare-fun res!1038799 () Bool)

(declare-fun e!848247 () Bool)

(assert (=> b!1520255 (=> (not res!1038799) (not e!848247))))

(declare-fun lt!658851 () SeekEntryResult!12920)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101251 (_ BitVec 32)) SeekEntryResult!12920)

(assert (=> b!1520255 (= res!1038799 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48856 a!2804) j!70) a!2804 mask!2512) lt!658851))))

(declare-fun b!1520256 () Bool)

(declare-fun e!848246 () Bool)

(assert (=> b!1520256 (= e!848247 (not e!848246))))

(declare-fun res!1038802 () Bool)

(assert (=> b!1520256 (=> res!1038802 e!848246)))

(assert (=> b!1520256 (= res!1038802 (or (not (= (select (arr!48856 a!2804) j!70) (select (store (arr!48856 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1520256 e!848248))

(declare-fun res!1038798 () Bool)

(assert (=> b!1520256 (=> (not res!1038798) (not e!848248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101251 (_ BitVec 32)) Bool)

(assert (=> b!1520256 (= res!1038798 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50743 0))(
  ( (Unit!50744) )
))
(declare-fun lt!658852 () Unit!50743)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50743)

(assert (=> b!1520256 (= lt!658852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520257 () Bool)

(declare-fun e!848245 () Bool)

(assert (=> b!1520257 (= e!848245 true)))

(declare-fun lt!658855 () (_ BitVec 32))

(declare-fun lt!658854 () SeekEntryResult!12920)

(assert (=> b!1520257 (= lt!658854 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658855 (select (arr!48856 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520258 () Bool)

(assert (=> b!1520258 (= e!848246 e!848245)))

(declare-fun res!1038795 () Bool)

(assert (=> b!1520258 (=> res!1038795 e!848245)))

(assert (=> b!1520258 (= res!1038795 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658855 #b00000000000000000000000000000000) (bvsge lt!658855 (size!49407 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520258 (= lt!658855 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1520259 () Bool)

(declare-fun res!1038806 () Bool)

(assert (=> b!1520259 (=> (not res!1038806) (not e!848249))))

(assert (=> b!1520259 (= res!1038806 (and (= (size!49407 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49407 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49407 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520260 () Bool)

(assert (=> b!1520260 (= e!848249 e!848247)))

(declare-fun res!1038800 () Bool)

(assert (=> b!1520260 (=> (not res!1038800) (not e!848247))))

(declare-fun lt!658853 () SeekEntryResult!12920)

(assert (=> b!1520260 (= res!1038800 (= lt!658853 lt!658851))))

(assert (=> b!1520260 (= lt!658851 (Intermediate!12920 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520260 (= lt!658853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48856 a!2804) j!70) mask!2512) (select (arr!48856 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520261 () Bool)

(declare-fun res!1038803 () Bool)

(assert (=> b!1520261 (=> (not res!1038803) (not e!848247))))

(assert (=> b!1520261 (= res!1038803 (= lt!658853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48856 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48856 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101252 (store (arr!48856 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49407 a!2804)) mask!2512)))))

(declare-fun b!1520262 () Bool)

(declare-fun res!1038805 () Bool)

(assert (=> b!1520262 (=> (not res!1038805) (not e!848249))))

(assert (=> b!1520262 (= res!1038805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520263 () Bool)

(declare-fun res!1038801 () Bool)

(assert (=> b!1520263 (=> (not res!1038801) (not e!848249))))

(assert (=> b!1520263 (= res!1038801 (validKeyInArray!0 (select (arr!48856 a!2804) j!70)))))

(assert (= (and start!129632 res!1038796) b!1520259))

(assert (= (and b!1520259 res!1038806) b!1520251))

(assert (= (and b!1520251 res!1038797) b!1520263))

(assert (= (and b!1520263 res!1038801) b!1520262))

(assert (= (and b!1520262 res!1038805) b!1520252))

(assert (= (and b!1520252 res!1038794) b!1520253))

(assert (= (and b!1520253 res!1038804) b!1520260))

(assert (= (and b!1520260 res!1038800) b!1520255))

(assert (= (and b!1520255 res!1038799) b!1520261))

(assert (= (and b!1520261 res!1038803) b!1520256))

(assert (= (and b!1520256 res!1038798) b!1520254))

(assert (= (and b!1520256 (not res!1038802)) b!1520258))

(assert (= (and b!1520258 (not res!1038795)) b!1520257))

(declare-fun m!1403409 () Bool)

(assert (=> b!1520257 m!1403409))

(assert (=> b!1520257 m!1403409))

(declare-fun m!1403411 () Bool)

(assert (=> b!1520257 m!1403411))

(declare-fun m!1403413 () Bool)

(assert (=> b!1520262 m!1403413))

(assert (=> b!1520256 m!1403409))

(declare-fun m!1403415 () Bool)

(assert (=> b!1520256 m!1403415))

(declare-fun m!1403417 () Bool)

(assert (=> b!1520256 m!1403417))

(declare-fun m!1403419 () Bool)

(assert (=> b!1520256 m!1403419))

(declare-fun m!1403421 () Bool)

(assert (=> b!1520256 m!1403421))

(assert (=> b!1520254 m!1403409))

(assert (=> b!1520254 m!1403409))

(declare-fun m!1403423 () Bool)

(assert (=> b!1520254 m!1403423))

(declare-fun m!1403425 () Bool)

(assert (=> b!1520258 m!1403425))

(assert (=> b!1520260 m!1403409))

(assert (=> b!1520260 m!1403409))

(declare-fun m!1403427 () Bool)

(assert (=> b!1520260 m!1403427))

(assert (=> b!1520260 m!1403427))

(assert (=> b!1520260 m!1403409))

(declare-fun m!1403429 () Bool)

(assert (=> b!1520260 m!1403429))

(declare-fun m!1403431 () Bool)

(assert (=> start!129632 m!1403431))

(declare-fun m!1403433 () Bool)

(assert (=> start!129632 m!1403433))

(declare-fun m!1403435 () Bool)

(assert (=> b!1520251 m!1403435))

(assert (=> b!1520251 m!1403435))

(declare-fun m!1403437 () Bool)

(assert (=> b!1520251 m!1403437))

(assert (=> b!1520261 m!1403417))

(assert (=> b!1520261 m!1403419))

(assert (=> b!1520261 m!1403419))

(declare-fun m!1403439 () Bool)

(assert (=> b!1520261 m!1403439))

(assert (=> b!1520261 m!1403439))

(assert (=> b!1520261 m!1403419))

(declare-fun m!1403441 () Bool)

(assert (=> b!1520261 m!1403441))

(assert (=> b!1520263 m!1403409))

(assert (=> b!1520263 m!1403409))

(declare-fun m!1403443 () Bool)

(assert (=> b!1520263 m!1403443))

(declare-fun m!1403445 () Bool)

(assert (=> b!1520252 m!1403445))

(assert (=> b!1520255 m!1403409))

(assert (=> b!1520255 m!1403409))

(declare-fun m!1403447 () Bool)

(assert (=> b!1520255 m!1403447))

(check-sat (not b!1520257) (not b!1520258) (not b!1520261) (not b!1520251) (not b!1520255) (not b!1520252) (not b!1520256) (not b!1520260) (not b!1520263) (not b!1520262) (not start!129632) (not b!1520254))
(check-sat)
