; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129218 () Bool)

(assert start!129218)

(declare-fun b!1517006 () Bool)

(declare-fun res!1036915 () Bool)

(declare-fun e!846414 () Bool)

(assert (=> b!1517006 (=> (not res!1036915) (not e!846414))))

(declare-datatypes ((array!101074 0))(
  ( (array!101075 (arr!48774 (Array (_ BitVec 32) (_ BitVec 64))) (size!49324 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101074)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517006 (= res!1036915 (validKeyInArray!0 (select (arr!48774 a!2804) j!70)))))

(declare-fun b!1517007 () Bool)

(declare-fun res!1036912 () Bool)

(declare-fun e!846415 () Bool)

(assert (=> b!1517007 (=> (not res!1036912) (not e!846415))))

(declare-datatypes ((SeekEntryResult!12945 0))(
  ( (MissingZero!12945 (index!54175 (_ BitVec 32))) (Found!12945 (index!54176 (_ BitVec 32))) (Intermediate!12945 (undefined!13757 Bool) (index!54177 (_ BitVec 32)) (x!135863 (_ BitVec 32))) (Undefined!12945) (MissingVacant!12945 (index!54178 (_ BitVec 32))) )
))
(declare-fun lt!657620 () SeekEntryResult!12945)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101074 (_ BitVec 32)) SeekEntryResult!12945)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517007 (= res!1036912 (= lt!657620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48774 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48774 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101075 (store (arr!48774 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49324 a!2804)) mask!2512)))))

(declare-fun b!1517008 () Bool)

(declare-fun e!846418 () Bool)

(assert (=> b!1517008 (= e!846418 true)))

(declare-fun lt!657622 () (_ BitVec 32))

(declare-fun lt!657621 () SeekEntryResult!12945)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517008 (= lt!657621 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657622 (select (arr!48774 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517009 () Bool)

(declare-fun res!1036920 () Bool)

(assert (=> b!1517009 (=> (not res!1036920) (not e!846415))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!657619 () SeekEntryResult!12945)

(assert (=> b!1517009 (= res!1036920 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48774 a!2804) j!70) a!2804 mask!2512) lt!657619))))

(declare-fun b!1517010 () Bool)

(declare-fun res!1036918 () Bool)

(assert (=> b!1517010 (=> (not res!1036918) (not e!846414))))

(assert (=> b!1517010 (= res!1036918 (validKeyInArray!0 (select (arr!48774 a!2804) i!961)))))

(declare-fun b!1517011 () Bool)

(declare-fun e!846413 () Bool)

(assert (=> b!1517011 (= e!846415 (not e!846413))))

(declare-fun res!1036909 () Bool)

(assert (=> b!1517011 (=> res!1036909 e!846413)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517011 (= res!1036909 (or (not (= (select (arr!48774 a!2804) j!70) (select (store (arr!48774 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846416 () Bool)

(assert (=> b!1517011 e!846416))

(declare-fun res!1036916 () Bool)

(assert (=> b!1517011 (=> (not res!1036916) (not e!846416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101074 (_ BitVec 32)) Bool)

(assert (=> b!1517011 (= res!1036916 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50758 0))(
  ( (Unit!50759) )
))
(declare-fun lt!657618 () Unit!50758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50758)

(assert (=> b!1517011 (= lt!657618 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517012 () Bool)

(declare-fun res!1036919 () Bool)

(assert (=> b!1517012 (=> (not res!1036919) (not e!846414))))

(assert (=> b!1517012 (= res!1036919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517013 () Bool)

(assert (=> b!1517013 (= e!846413 e!846418)))

(declare-fun res!1036911 () Bool)

(assert (=> b!1517013 (=> res!1036911 e!846418)))

(assert (=> b!1517013 (= res!1036911 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657622 #b00000000000000000000000000000000) (bvsge lt!657622 (size!49324 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517013 (= lt!657622 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517015 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101074 (_ BitVec 32)) SeekEntryResult!12945)

(assert (=> b!1517015 (= e!846416 (= (seekEntry!0 (select (arr!48774 a!2804) j!70) a!2804 mask!2512) (Found!12945 j!70)))))

(declare-fun b!1517016 () Bool)

(assert (=> b!1517016 (= e!846414 e!846415)))

(declare-fun res!1036913 () Bool)

(assert (=> b!1517016 (=> (not res!1036913) (not e!846415))))

(assert (=> b!1517016 (= res!1036913 (= lt!657620 lt!657619))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517016 (= lt!657619 (Intermediate!12945 false resIndex!21 resX!21))))

(assert (=> b!1517016 (= lt!657620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48774 a!2804) j!70) mask!2512) (select (arr!48774 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517017 () Bool)

(declare-fun res!1036921 () Bool)

(assert (=> b!1517017 (=> (not res!1036921) (not e!846414))))

(declare-datatypes ((List!35257 0))(
  ( (Nil!35254) (Cons!35253 (h!36665 (_ BitVec 64)) (t!49951 List!35257)) )
))
(declare-fun arrayNoDuplicates!0 (array!101074 (_ BitVec 32) List!35257) Bool)

(assert (=> b!1517017 (= res!1036921 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35254))))

(declare-fun b!1517018 () Bool)

(declare-fun res!1036914 () Bool)

(assert (=> b!1517018 (=> (not res!1036914) (not e!846414))))

(assert (=> b!1517018 (= res!1036914 (and (= (size!49324 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49324 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49324 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1036917 () Bool)

(assert (=> start!129218 (=> (not res!1036917) (not e!846414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129218 (= res!1036917 (validMask!0 mask!2512))))

(assert (=> start!129218 e!846414))

(assert (=> start!129218 true))

(declare-fun array_inv!37802 (array!101074) Bool)

(assert (=> start!129218 (array_inv!37802 a!2804)))

(declare-fun b!1517014 () Bool)

(declare-fun res!1036910 () Bool)

(assert (=> b!1517014 (=> (not res!1036910) (not e!846414))))

(assert (=> b!1517014 (= res!1036910 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49324 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49324 a!2804))))))

(assert (= (and start!129218 res!1036917) b!1517018))

(assert (= (and b!1517018 res!1036914) b!1517010))

(assert (= (and b!1517010 res!1036918) b!1517006))

(assert (= (and b!1517006 res!1036915) b!1517012))

(assert (= (and b!1517012 res!1036919) b!1517017))

(assert (= (and b!1517017 res!1036921) b!1517014))

(assert (= (and b!1517014 res!1036910) b!1517016))

(assert (= (and b!1517016 res!1036913) b!1517009))

(assert (= (and b!1517009 res!1036920) b!1517007))

(assert (= (and b!1517007 res!1036912) b!1517011))

(assert (= (and b!1517011 res!1036916) b!1517015))

(assert (= (and b!1517011 (not res!1036909)) b!1517013))

(assert (= (and b!1517013 (not res!1036911)) b!1517008))

(declare-fun m!1400285 () Bool)

(assert (=> b!1517016 m!1400285))

(assert (=> b!1517016 m!1400285))

(declare-fun m!1400287 () Bool)

(assert (=> b!1517016 m!1400287))

(assert (=> b!1517016 m!1400287))

(assert (=> b!1517016 m!1400285))

(declare-fun m!1400289 () Bool)

(assert (=> b!1517016 m!1400289))

(assert (=> b!1517008 m!1400285))

(assert (=> b!1517008 m!1400285))

(declare-fun m!1400291 () Bool)

(assert (=> b!1517008 m!1400291))

(assert (=> b!1517006 m!1400285))

(assert (=> b!1517006 m!1400285))

(declare-fun m!1400293 () Bool)

(assert (=> b!1517006 m!1400293))

(declare-fun m!1400295 () Bool)

(assert (=> b!1517012 m!1400295))

(declare-fun m!1400297 () Bool)

(assert (=> b!1517007 m!1400297))

(declare-fun m!1400299 () Bool)

(assert (=> b!1517007 m!1400299))

(assert (=> b!1517007 m!1400299))

(declare-fun m!1400301 () Bool)

(assert (=> b!1517007 m!1400301))

(assert (=> b!1517007 m!1400301))

(assert (=> b!1517007 m!1400299))

(declare-fun m!1400303 () Bool)

(assert (=> b!1517007 m!1400303))

(assert (=> b!1517011 m!1400285))

(declare-fun m!1400305 () Bool)

(assert (=> b!1517011 m!1400305))

(assert (=> b!1517011 m!1400297))

(assert (=> b!1517011 m!1400299))

(declare-fun m!1400307 () Bool)

(assert (=> b!1517011 m!1400307))

(assert (=> b!1517009 m!1400285))

(assert (=> b!1517009 m!1400285))

(declare-fun m!1400309 () Bool)

(assert (=> b!1517009 m!1400309))

(declare-fun m!1400311 () Bool)

(assert (=> b!1517013 m!1400311))

(assert (=> b!1517015 m!1400285))

(assert (=> b!1517015 m!1400285))

(declare-fun m!1400313 () Bool)

(assert (=> b!1517015 m!1400313))

(declare-fun m!1400315 () Bool)

(assert (=> b!1517010 m!1400315))

(assert (=> b!1517010 m!1400315))

(declare-fun m!1400317 () Bool)

(assert (=> b!1517010 m!1400317))

(declare-fun m!1400319 () Bool)

(assert (=> start!129218 m!1400319))

(declare-fun m!1400321 () Bool)

(assert (=> start!129218 m!1400321))

(declare-fun m!1400323 () Bool)

(assert (=> b!1517017 m!1400323))

(check-sat (not b!1517011) (not b!1517009) (not b!1517017) (not b!1517012) (not b!1517010) (not b!1517007) (not b!1517013) (not b!1517006) (not b!1517016) (not b!1517008) (not b!1517015) (not start!129218))
(check-sat)
