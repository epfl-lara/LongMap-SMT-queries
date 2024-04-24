; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129560 () Bool)

(assert start!129560)

(declare-fun b!1518847 () Bool)

(declare-fun e!847601 () Bool)

(declare-fun e!847600 () Bool)

(assert (=> b!1518847 (= e!847601 e!847600)))

(declare-fun res!1037401 () Bool)

(assert (=> b!1518847 (=> res!1037401 e!847600)))

(declare-fun lt!658311 () (_ BitVec 32))

(declare-datatypes ((array!101179 0))(
  ( (array!101180 (arr!48820 (Array (_ BitVec 32) (_ BitVec 64))) (size!49371 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101179)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518847 (= res!1037401 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658311 #b00000000000000000000000000000000) (bvsge lt!658311 (size!49371 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518847 (= lt!658311 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1518848 () Bool)

(declare-fun res!1037394 () Bool)

(declare-fun e!847599 () Bool)

(assert (=> b!1518848 (=> (not res!1037394) (not e!847599))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1518848 (= res!1037394 (and (= (size!49371 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49371 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49371 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1037395 () Bool)

(assert (=> start!129560 (=> (not res!1037395) (not e!847599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129560 (= res!1037395 (validMask!0 mask!2512))))

(assert (=> start!129560 e!847599))

(assert (=> start!129560 true))

(declare-fun array_inv!38101 (array!101179) Bool)

(assert (=> start!129560 (array_inv!38101 a!2804)))

(declare-fun b!1518849 () Bool)

(declare-fun res!1037391 () Bool)

(assert (=> b!1518849 (=> (not res!1037391) (not e!847599))))

(declare-datatypes ((List!35290 0))(
  ( (Nil!35287) (Cons!35286 (h!36716 (_ BitVec 64)) (t!49976 List!35290)) )
))
(declare-fun arrayNoDuplicates!0 (array!101179 (_ BitVec 32) List!35290) Bool)

(assert (=> b!1518849 (= res!1037391 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35287))))

(declare-fun b!1518850 () Bool)

(assert (=> b!1518850 (= e!847600 true)))

(declare-datatypes ((SeekEntryResult!12884 0))(
  ( (MissingZero!12884 (index!53931 (_ BitVec 32))) (Found!12884 (index!53932 (_ BitVec 32))) (Intermediate!12884 (undefined!13696 Bool) (index!53933 (_ BitVec 32)) (x!135829 (_ BitVec 32))) (Undefined!12884) (MissingVacant!12884 (index!53934 (_ BitVec 32))) )
))
(declare-fun lt!658312 () SeekEntryResult!12884)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101179 (_ BitVec 32)) SeekEntryResult!12884)

(assert (=> b!1518850 (= lt!658312 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658311 (select (arr!48820 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518851 () Bool)

(declare-fun res!1037392 () Bool)

(assert (=> b!1518851 (=> (not res!1037392) (not e!847599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518851 (= res!1037392 (validKeyInArray!0 (select (arr!48820 a!2804) j!70)))))

(declare-fun b!1518852 () Bool)

(declare-fun e!847598 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101179 (_ BitVec 32)) SeekEntryResult!12884)

(assert (=> b!1518852 (= e!847598 (= (seekEntry!0 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) (Found!12884 j!70)))))

(declare-fun b!1518853 () Bool)

(declare-fun res!1037397 () Bool)

(assert (=> b!1518853 (=> (not res!1037397) (not e!847599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101179 (_ BitVec 32)) Bool)

(assert (=> b!1518853 (= res!1037397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518854 () Bool)

(declare-fun res!1037400 () Bool)

(assert (=> b!1518854 (=> (not res!1037400) (not e!847599))))

(assert (=> b!1518854 (= res!1037400 (validKeyInArray!0 (select (arr!48820 a!2804) i!961)))))

(declare-fun b!1518855 () Bool)

(declare-fun res!1037393 () Bool)

(declare-fun e!847597 () Bool)

(assert (=> b!1518855 (=> (not res!1037393) (not e!847597))))

(declare-fun lt!658314 () SeekEntryResult!12884)

(assert (=> b!1518855 (= res!1037393 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) lt!658314))))

(declare-fun b!1518856 () Bool)

(assert (=> b!1518856 (= e!847597 (not e!847601))))

(declare-fun res!1037390 () Bool)

(assert (=> b!1518856 (=> res!1037390 e!847601)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518856 (= res!1037390 (or (not (= (select (arr!48820 a!2804) j!70) (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1518856 e!847598))

(declare-fun res!1037396 () Bool)

(assert (=> b!1518856 (=> (not res!1037396) (not e!847598))))

(assert (=> b!1518856 (= res!1037396 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50671 0))(
  ( (Unit!50672) )
))
(declare-fun lt!658315 () Unit!50671)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50671)

(assert (=> b!1518856 (= lt!658315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518857 () Bool)

(declare-fun res!1037402 () Bool)

(assert (=> b!1518857 (=> (not res!1037402) (not e!847597))))

(declare-fun lt!658313 () SeekEntryResult!12884)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518857 (= res!1037402 (= lt!658313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101180 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49371 a!2804)) mask!2512)))))

(declare-fun b!1518858 () Bool)

(assert (=> b!1518858 (= e!847599 e!847597)))

(declare-fun res!1037398 () Bool)

(assert (=> b!1518858 (=> (not res!1037398) (not e!847597))))

(assert (=> b!1518858 (= res!1037398 (= lt!658313 lt!658314))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518858 (= lt!658314 (Intermediate!12884 false resIndex!21 resX!21))))

(assert (=> b!1518858 (= lt!658313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48820 a!2804) j!70) mask!2512) (select (arr!48820 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518859 () Bool)

(declare-fun res!1037399 () Bool)

(assert (=> b!1518859 (=> (not res!1037399) (not e!847599))))

(assert (=> b!1518859 (= res!1037399 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49371 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49371 a!2804))))))

(assert (= (and start!129560 res!1037395) b!1518848))

(assert (= (and b!1518848 res!1037394) b!1518854))

(assert (= (and b!1518854 res!1037400) b!1518851))

(assert (= (and b!1518851 res!1037392) b!1518853))

(assert (= (and b!1518853 res!1037397) b!1518849))

(assert (= (and b!1518849 res!1037391) b!1518859))

(assert (= (and b!1518859 res!1037399) b!1518858))

(assert (= (and b!1518858 res!1037398) b!1518855))

(assert (= (and b!1518855 res!1037393) b!1518857))

(assert (= (and b!1518857 res!1037402) b!1518856))

(assert (= (and b!1518856 res!1037396) b!1518852))

(assert (= (and b!1518856 (not res!1037390)) b!1518847))

(assert (= (and b!1518847 (not res!1037401)) b!1518850))

(declare-fun m!1401969 () Bool)

(assert (=> b!1518850 m!1401969))

(assert (=> b!1518850 m!1401969))

(declare-fun m!1401971 () Bool)

(assert (=> b!1518850 m!1401971))

(declare-fun m!1401973 () Bool)

(assert (=> b!1518854 m!1401973))

(assert (=> b!1518854 m!1401973))

(declare-fun m!1401975 () Bool)

(assert (=> b!1518854 m!1401975))

(assert (=> b!1518851 m!1401969))

(assert (=> b!1518851 m!1401969))

(declare-fun m!1401977 () Bool)

(assert (=> b!1518851 m!1401977))

(assert (=> b!1518855 m!1401969))

(assert (=> b!1518855 m!1401969))

(declare-fun m!1401979 () Bool)

(assert (=> b!1518855 m!1401979))

(declare-fun m!1401981 () Bool)

(assert (=> b!1518857 m!1401981))

(declare-fun m!1401983 () Bool)

(assert (=> b!1518857 m!1401983))

(assert (=> b!1518857 m!1401983))

(declare-fun m!1401985 () Bool)

(assert (=> b!1518857 m!1401985))

(assert (=> b!1518857 m!1401985))

(assert (=> b!1518857 m!1401983))

(declare-fun m!1401987 () Bool)

(assert (=> b!1518857 m!1401987))

(declare-fun m!1401989 () Bool)

(assert (=> b!1518849 m!1401989))

(assert (=> b!1518858 m!1401969))

(assert (=> b!1518858 m!1401969))

(declare-fun m!1401991 () Bool)

(assert (=> b!1518858 m!1401991))

(assert (=> b!1518858 m!1401991))

(assert (=> b!1518858 m!1401969))

(declare-fun m!1401993 () Bool)

(assert (=> b!1518858 m!1401993))

(assert (=> b!1518856 m!1401969))

(declare-fun m!1401995 () Bool)

(assert (=> b!1518856 m!1401995))

(assert (=> b!1518856 m!1401981))

(assert (=> b!1518856 m!1401983))

(declare-fun m!1401997 () Bool)

(assert (=> b!1518856 m!1401997))

(assert (=> b!1518852 m!1401969))

(assert (=> b!1518852 m!1401969))

(declare-fun m!1401999 () Bool)

(assert (=> b!1518852 m!1401999))

(declare-fun m!1402001 () Bool)

(assert (=> b!1518853 m!1402001))

(declare-fun m!1402003 () Bool)

(assert (=> start!129560 m!1402003))

(declare-fun m!1402005 () Bool)

(assert (=> start!129560 m!1402005))

(declare-fun m!1402007 () Bool)

(assert (=> b!1518847 m!1402007))

(check-sat (not b!1518847) (not b!1518851) (not start!129560) (not b!1518858) (not b!1518856) (not b!1518857) (not b!1518852) (not b!1518855) (not b!1518854) (not b!1518849) (not b!1518850) (not b!1518853))
(check-sat)
