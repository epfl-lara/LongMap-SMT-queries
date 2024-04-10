; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120416 () Bool)

(assert start!120416)

(declare-fun b!1401872 () Bool)

(declare-fun e!793811 () Bool)

(declare-fun e!793810 () Bool)

(assert (=> b!1401872 (= e!793811 (not e!793810))))

(declare-fun res!940390 () Bool)

(assert (=> b!1401872 (=> res!940390 e!793810)))

(declare-datatypes ((SeekEntryResult!10580 0))(
  ( (MissingZero!10580 (index!44697 (_ BitVec 32))) (Found!10580 (index!44698 (_ BitVec 32))) (Intermediate!10580 (undefined!11392 Bool) (index!44699 (_ BitVec 32)) (x!126327 (_ BitVec 32))) (Undefined!10580) (MissingVacant!10580 (index!44700 (_ BitVec 32))) )
))
(declare-fun lt!617252 () SeekEntryResult!10580)

(get-info :version)

(assert (=> b!1401872 (= res!940390 (or (not ((_ is Intermediate!10580) lt!617252)) (undefined!11392 lt!617252)))))

(declare-fun e!793813 () Bool)

(assert (=> b!1401872 e!793813))

(declare-fun res!940383 () Bool)

(assert (=> b!1401872 (=> (not res!940383) (not e!793813))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95825 0))(
  ( (array!95826 (arr!46263 (Array (_ BitVec 32) (_ BitVec 64))) (size!46813 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95825)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95825 (_ BitVec 32)) Bool)

(assert (=> b!1401872 (= res!940383 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47164 0))(
  ( (Unit!47165) )
))
(declare-fun lt!617246 () Unit!47164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47164)

(assert (=> b!1401872 (= lt!617246 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617250 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95825 (_ BitVec 32)) SeekEntryResult!10580)

(assert (=> b!1401872 (= lt!617252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617250 (select (arr!46263 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401872 (= lt!617250 (toIndex!0 (select (arr!46263 a!2901) j!112) mask!2840))))

(declare-fun b!1401873 () Bool)

(declare-fun e!793812 () Bool)

(assert (=> b!1401873 (= e!793812 true)))

(declare-fun lt!617247 () SeekEntryResult!10580)

(declare-fun lt!617249 () array!95825)

(declare-fun lt!617251 () (_ BitVec 64))

(assert (=> b!1401873 (= lt!617247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617250 lt!617251 lt!617249 mask!2840))))

(declare-fun lt!617253 () SeekEntryResult!10580)

(declare-fun e!793809 () Bool)

(declare-fun b!1401874 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95825 (_ BitVec 32)) SeekEntryResult!10580)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95825 (_ BitVec 32)) SeekEntryResult!10580)

(assert (=> b!1401874 (= e!793809 (= (seekEntryOrOpen!0 lt!617251 lt!617249 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126327 lt!617253) (index!44699 lt!617253) (index!44699 lt!617253) (select (arr!46263 a!2901) j!112) lt!617249 mask!2840)))))

(declare-fun b!1401875 () Bool)

(assert (=> b!1401875 (= e!793813 (= (seekEntryOrOpen!0 (select (arr!46263 a!2901) j!112) a!2901 mask!2840) (Found!10580 j!112)))))

(declare-fun b!1401876 () Bool)

(declare-fun res!940391 () Bool)

(assert (=> b!1401876 (=> (not res!940391) (not e!793811))))

(assert (=> b!1401876 (= res!940391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!940389 () Bool)

(assert (=> start!120416 (=> (not res!940389) (not e!793811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120416 (= res!940389 (validMask!0 mask!2840))))

(assert (=> start!120416 e!793811))

(assert (=> start!120416 true))

(declare-fun array_inv!35291 (array!95825) Bool)

(assert (=> start!120416 (array_inv!35291 a!2901)))

(declare-fun b!1401877 () Bool)

(declare-fun res!940385 () Bool)

(assert (=> b!1401877 (=> (not res!940385) (not e!793811))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401877 (= res!940385 (and (= (size!46813 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46813 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46813 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401878 () Bool)

(declare-fun e!793808 () Bool)

(assert (=> b!1401878 (= e!793810 e!793808)))

(declare-fun res!940393 () Bool)

(assert (=> b!1401878 (=> res!940393 e!793808)))

(assert (=> b!1401878 (= res!940393 (or (= lt!617252 lt!617253) (not ((_ is Intermediate!10580) lt!617253))))))

(assert (=> b!1401878 (= lt!617253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617251 mask!2840) lt!617251 lt!617249 mask!2840))))

(assert (=> b!1401878 (= lt!617251 (select (store (arr!46263 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401878 (= lt!617249 (array!95826 (store (arr!46263 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46813 a!2901)))))

(declare-fun b!1401879 () Bool)

(assert (=> b!1401879 (= e!793808 e!793812)))

(declare-fun res!940392 () Bool)

(assert (=> b!1401879 (=> res!940392 e!793812)))

(assert (=> b!1401879 (= res!940392 (or (bvslt (x!126327 lt!617252) #b00000000000000000000000000000000) (bvsgt (x!126327 lt!617252) #b01111111111111111111111111111110) (bvslt (x!126327 lt!617253) #b00000000000000000000000000000000) (bvsgt (x!126327 lt!617253) #b01111111111111111111111111111110) (bvslt lt!617250 #b00000000000000000000000000000000) (bvsge lt!617250 (size!46813 a!2901)) (bvslt (index!44699 lt!617252) #b00000000000000000000000000000000) (bvsge (index!44699 lt!617252) (size!46813 a!2901)) (bvslt (index!44699 lt!617253) #b00000000000000000000000000000000) (bvsge (index!44699 lt!617253) (size!46813 a!2901)) (not (= lt!617252 (Intermediate!10580 false (index!44699 lt!617252) (x!126327 lt!617252)))) (not (= lt!617253 (Intermediate!10580 false (index!44699 lt!617253) (x!126327 lt!617253))))))))

(assert (=> b!1401879 e!793809))

(declare-fun res!940387 () Bool)

(assert (=> b!1401879 (=> (not res!940387) (not e!793809))))

(assert (=> b!1401879 (= res!940387 (and (not (undefined!11392 lt!617253)) (= (index!44699 lt!617253) i!1037) (bvslt (x!126327 lt!617253) (x!126327 lt!617252)) (= (select (store (arr!46263 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44699 lt!617253)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617248 () Unit!47164)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47164)

(assert (=> b!1401879 (= lt!617248 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617250 (x!126327 lt!617252) (index!44699 lt!617252) (x!126327 lt!617253) (index!44699 lt!617253) (undefined!11392 lt!617253) mask!2840))))

(declare-fun b!1401880 () Bool)

(declare-fun res!940384 () Bool)

(assert (=> b!1401880 (=> (not res!940384) (not e!793811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401880 (= res!940384 (validKeyInArray!0 (select (arr!46263 a!2901) i!1037)))))

(declare-fun b!1401881 () Bool)

(declare-fun res!940386 () Bool)

(assert (=> b!1401881 (=> (not res!940386) (not e!793811))))

(declare-datatypes ((List!32782 0))(
  ( (Nil!32779) (Cons!32778 (h!34026 (_ BitVec 64)) (t!47476 List!32782)) )
))
(declare-fun arrayNoDuplicates!0 (array!95825 (_ BitVec 32) List!32782) Bool)

(assert (=> b!1401881 (= res!940386 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32779))))

(declare-fun b!1401882 () Bool)

(declare-fun res!940388 () Bool)

(assert (=> b!1401882 (=> (not res!940388) (not e!793811))))

(assert (=> b!1401882 (= res!940388 (validKeyInArray!0 (select (arr!46263 a!2901) j!112)))))

(assert (= (and start!120416 res!940389) b!1401877))

(assert (= (and b!1401877 res!940385) b!1401880))

(assert (= (and b!1401880 res!940384) b!1401882))

(assert (= (and b!1401882 res!940388) b!1401876))

(assert (= (and b!1401876 res!940391) b!1401881))

(assert (= (and b!1401881 res!940386) b!1401872))

(assert (= (and b!1401872 res!940383) b!1401875))

(assert (= (and b!1401872 (not res!940390)) b!1401878))

(assert (= (and b!1401878 (not res!940393)) b!1401879))

(assert (= (and b!1401879 res!940387) b!1401874))

(assert (= (and b!1401879 (not res!940392)) b!1401873))

(declare-fun m!1289801 () Bool)

(assert (=> b!1401875 m!1289801))

(assert (=> b!1401875 m!1289801))

(declare-fun m!1289803 () Bool)

(assert (=> b!1401875 m!1289803))

(assert (=> b!1401872 m!1289801))

(declare-fun m!1289805 () Bool)

(assert (=> b!1401872 m!1289805))

(assert (=> b!1401872 m!1289801))

(assert (=> b!1401872 m!1289801))

(declare-fun m!1289807 () Bool)

(assert (=> b!1401872 m!1289807))

(declare-fun m!1289809 () Bool)

(assert (=> b!1401872 m!1289809))

(declare-fun m!1289811 () Bool)

(assert (=> b!1401872 m!1289811))

(declare-fun m!1289813 () Bool)

(assert (=> b!1401874 m!1289813))

(assert (=> b!1401874 m!1289801))

(assert (=> b!1401874 m!1289801))

(declare-fun m!1289815 () Bool)

(assert (=> b!1401874 m!1289815))

(declare-fun m!1289817 () Bool)

(assert (=> b!1401880 m!1289817))

(assert (=> b!1401880 m!1289817))

(declare-fun m!1289819 () Bool)

(assert (=> b!1401880 m!1289819))

(declare-fun m!1289821 () Bool)

(assert (=> start!120416 m!1289821))

(declare-fun m!1289823 () Bool)

(assert (=> start!120416 m!1289823))

(declare-fun m!1289825 () Bool)

(assert (=> b!1401876 m!1289825))

(declare-fun m!1289827 () Bool)

(assert (=> b!1401873 m!1289827))

(declare-fun m!1289829 () Bool)

(assert (=> b!1401879 m!1289829))

(declare-fun m!1289831 () Bool)

(assert (=> b!1401879 m!1289831))

(declare-fun m!1289833 () Bool)

(assert (=> b!1401879 m!1289833))

(declare-fun m!1289835 () Bool)

(assert (=> b!1401881 m!1289835))

(declare-fun m!1289837 () Bool)

(assert (=> b!1401878 m!1289837))

(assert (=> b!1401878 m!1289837))

(declare-fun m!1289839 () Bool)

(assert (=> b!1401878 m!1289839))

(assert (=> b!1401878 m!1289829))

(declare-fun m!1289841 () Bool)

(assert (=> b!1401878 m!1289841))

(assert (=> b!1401882 m!1289801))

(assert (=> b!1401882 m!1289801))

(declare-fun m!1289843 () Bool)

(assert (=> b!1401882 m!1289843))

(check-sat (not b!1401882) (not b!1401880) (not b!1401879) (not b!1401876) (not b!1401873) (not b!1401881) (not b!1401872) (not b!1401874) (not b!1401875) (not start!120416) (not b!1401878))
(check-sat)
