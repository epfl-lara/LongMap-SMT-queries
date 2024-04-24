; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55608 () Bool)

(assert start!55608)

(declare-fun b!607991 () Bool)

(declare-fun res!390671 () Bool)

(declare-fun e!348185 () Bool)

(assert (=> b!607991 (=> (not res!390671) (not e!348185))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37284 0))(
  ( (array!37285 (arr!17890 (Array (_ BitVec 32) (_ BitVec 64))) (size!18254 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37284)

(assert (=> b!607991 (= res!390671 (and (= (size!18254 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18254 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18254 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607992 () Bool)

(declare-fun e!348189 () Bool)

(declare-fun e!348186 () Bool)

(assert (=> b!607992 (= e!348189 e!348186)))

(declare-fun res!390660 () Bool)

(assert (=> b!607992 (=> res!390660 e!348186)))

(declare-fun lt!277652 () (_ BitVec 64))

(declare-fun lt!277643 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!607992 (= res!390660 (or (not (= (select (arr!17890 a!2986) j!136) lt!277643)) (not (= (select (arr!17890 a!2986) j!136) lt!277652)) (bvsge j!136 index!984)))))

(declare-fun b!607993 () Bool)

(declare-fun res!390667 () Bool)

(declare-fun e!348197 () Bool)

(assert (=> b!607993 (=> (not res!390667) (not e!348197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37284 (_ BitVec 32)) Bool)

(assert (=> b!607993 (= res!390667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607994 () Bool)

(declare-fun e!348198 () Bool)

(declare-fun e!348190 () Bool)

(assert (=> b!607994 (= e!348198 e!348190)))

(declare-fun res!390661 () Bool)

(assert (=> b!607994 (=> (not res!390661) (not e!348190))))

(declare-datatypes ((SeekEntryResult!6286 0))(
  ( (MissingZero!6286 (index!27419 (_ BitVec 32))) (Found!6286 (index!27420 (_ BitVec 32))) (Intermediate!6286 (undefined!7098 Bool) (index!27421 (_ BitVec 32)) (x!56382 (_ BitVec 32))) (Undefined!6286) (MissingVacant!6286 (index!27422 (_ BitVec 32))) )
))
(declare-fun lt!277644 () SeekEntryResult!6286)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!607994 (= res!390661 (and (= lt!277644 (Found!6286 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17890 a!2986) index!984) (select (arr!17890 a!2986) j!136))) (not (= (select (arr!17890 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37284 (_ BitVec 32)) SeekEntryResult!6286)

(assert (=> b!607994 (= lt!277644 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17890 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607995 () Bool)

(declare-fun res!390670 () Bool)

(assert (=> b!607995 (=> (not res!390670) (not e!348185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607995 (= res!390670 (validKeyInArray!0 (select (arr!17890 a!2986) j!136)))))

(declare-fun b!607996 () Bool)

(assert (=> b!607996 (= e!348185 e!348197)))

(declare-fun res!390658 () Bool)

(assert (=> b!607996 (=> (not res!390658) (not e!348197))))

(declare-fun lt!277651 () SeekEntryResult!6286)

(assert (=> b!607996 (= res!390658 (or (= lt!277651 (MissingZero!6286 i!1108)) (= lt!277651 (MissingVacant!6286 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37284 (_ BitVec 32)) SeekEntryResult!6286)

(assert (=> b!607996 (= lt!277651 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607997 () Bool)

(declare-fun e!348194 () Bool)

(assert (=> b!607997 (= e!348186 e!348194)))

(declare-fun res!390669 () Bool)

(assert (=> b!607997 (=> (not res!390669) (not e!348194))))

(declare-fun lt!277646 () array!37284)

(declare-fun arrayContainsKey!0 (array!37284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607997 (= res!390669 (arrayContainsKey!0 lt!277646 (select (arr!17890 a!2986) j!136) j!136))))

(declare-fun b!607998 () Bool)

(declare-fun res!390672 () Bool)

(declare-fun e!348196 () Bool)

(assert (=> b!607998 (=> res!390672 e!348196)))

(declare-datatypes ((List!11838 0))(
  ( (Nil!11835) (Cons!11834 (h!12882 (_ BitVec 64)) (t!18058 List!11838)) )
))
(declare-fun contains!2988 (List!11838 (_ BitVec 64)) Bool)

(assert (=> b!607998 (= res!390672 (contains!2988 Nil!11835 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!390668 () Bool)

(assert (=> start!55608 (=> (not res!390668) (not e!348185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55608 (= res!390668 (validMask!0 mask!3053))))

(assert (=> start!55608 e!348185))

(assert (=> start!55608 true))

(declare-fun array_inv!13749 (array!37284) Bool)

(assert (=> start!55608 (array_inv!13749 a!2986)))

(declare-fun b!607999 () Bool)

(declare-fun res!390654 () Bool)

(assert (=> b!607999 (=> (not res!390654) (not e!348197))))

(assert (=> b!607999 (= res!390654 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17890 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608000 () Bool)

(declare-fun e!348187 () Bool)

(assert (=> b!608000 (= e!348187 (arrayContainsKey!0 lt!277646 (select (arr!17890 a!2986) j!136) index!984))))

(declare-fun b!608001 () Bool)

(declare-fun res!390674 () Bool)

(assert (=> b!608001 (=> res!390674 e!348196)))

(assert (=> b!608001 (= res!390674 (contains!2988 Nil!11835 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608002 () Bool)

(declare-fun res!390673 () Bool)

(assert (=> b!608002 (=> (not res!390673) (not e!348185))))

(assert (=> b!608002 (= res!390673 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608003 () Bool)

(declare-fun res!390664 () Bool)

(assert (=> b!608003 (=> (not res!390664) (not e!348185))))

(assert (=> b!608003 (= res!390664 (validKeyInArray!0 k0!1786))))

(declare-fun b!608004 () Bool)

(declare-fun res!390663 () Bool)

(assert (=> b!608004 (=> res!390663 e!348196)))

(declare-fun noDuplicate!322 (List!11838) Bool)

(assert (=> b!608004 (= res!390663 (not (noDuplicate!322 Nil!11835)))))

(declare-fun b!608005 () Bool)

(assert (=> b!608005 (= e!348196 true)))

(declare-fun lt!277642 () Bool)

(assert (=> b!608005 (= lt!277642 (contains!2988 Nil!11835 k0!1786))))

(declare-fun b!608006 () Bool)

(declare-fun e!348188 () Bool)

(assert (=> b!608006 (= e!348190 (not e!348188))))

(declare-fun res!390659 () Bool)

(assert (=> b!608006 (=> res!390659 e!348188)))

(declare-fun lt!277657 () SeekEntryResult!6286)

(assert (=> b!608006 (= res!390659 (not (= lt!277657 (Found!6286 index!984))))))

(declare-datatypes ((Unit!19369 0))(
  ( (Unit!19370) )
))
(declare-fun lt!277650 () Unit!19369)

(declare-fun e!348193 () Unit!19369)

(assert (=> b!608006 (= lt!277650 e!348193)))

(declare-fun c!69038 () Bool)

(assert (=> b!608006 (= c!69038 (= lt!277657 Undefined!6286))))

(assert (=> b!608006 (= lt!277657 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277643 lt!277646 mask!3053))))

(declare-fun e!348192 () Bool)

(assert (=> b!608006 e!348192))

(declare-fun res!390662 () Bool)

(assert (=> b!608006 (=> (not res!390662) (not e!348192))))

(declare-fun lt!277653 () SeekEntryResult!6286)

(declare-fun lt!277656 () (_ BitVec 32))

(assert (=> b!608006 (= res!390662 (= lt!277653 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277656 vacantSpotIndex!68 lt!277643 lt!277646 mask!3053)))))

(assert (=> b!608006 (= lt!277653 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277656 vacantSpotIndex!68 (select (arr!17890 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608006 (= lt!277643 (select (store (arr!17890 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277647 () Unit!19369)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37284 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19369)

(assert (=> b!608006 (= lt!277647 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277656 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608006 (= lt!277656 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!608007 () Bool)

(declare-fun e!348183 () Bool)

(declare-fun e!348191 () Bool)

(assert (=> b!608007 (= e!348183 e!348191)))

(declare-fun res!390675 () Bool)

(assert (=> b!608007 (=> res!390675 e!348191)))

(assert (=> b!608007 (= res!390675 (bvsge index!984 j!136))))

(declare-fun lt!277655 () Unit!19369)

(declare-fun e!348195 () Unit!19369)

(assert (=> b!608007 (= lt!277655 e!348195)))

(declare-fun c!69037 () Bool)

(assert (=> b!608007 (= c!69037 (bvslt j!136 index!984))))

(declare-fun b!608008 () Bool)

(assert (=> b!608008 (= e!348191 e!348196)))

(declare-fun res!390656 () Bool)

(assert (=> b!608008 (=> res!390656 e!348196)))

(assert (=> b!608008 (= res!390656 (or (bvsge (size!18254 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18254 a!2986))))))

(assert (=> b!608008 (arrayContainsKey!0 lt!277646 (select (arr!17890 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277649 () Unit!19369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37284 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19369)

(assert (=> b!608008 (= lt!277649 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277646 (select (arr!17890 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608008 e!348187))

(declare-fun res!390657 () Bool)

(assert (=> b!608008 (=> (not res!390657) (not e!348187))))

(assert (=> b!608008 (= res!390657 (arrayContainsKey!0 lt!277646 (select (arr!17890 a!2986) j!136) j!136))))

(declare-fun b!608009 () Bool)

(declare-fun Unit!19371 () Unit!19369)

(assert (=> b!608009 (= e!348195 Unit!19371)))

(declare-fun lt!277648 () Unit!19369)

(assert (=> b!608009 (= lt!277648 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277646 (select (arr!17890 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608009 (arrayContainsKey!0 lt!277646 (select (arr!17890 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277641 () Unit!19369)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37284 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11838) Unit!19369)

(assert (=> b!608009 (= lt!277641 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11835))))

(declare-fun arrayNoDuplicates!0 (array!37284 (_ BitVec 32) List!11838) Bool)

(assert (=> b!608009 (arrayNoDuplicates!0 lt!277646 #b00000000000000000000000000000000 Nil!11835)))

(declare-fun lt!277645 () Unit!19369)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37284 (_ BitVec 32) (_ BitVec 32)) Unit!19369)

(assert (=> b!608009 (= lt!277645 (lemmaNoDuplicateFromThenFromBigger!0 lt!277646 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608009 (arrayNoDuplicates!0 lt!277646 j!136 Nil!11835)))

(declare-fun lt!277654 () Unit!19369)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37284 (_ BitVec 64) (_ BitVec 32) List!11838) Unit!19369)

(assert (=> b!608009 (= lt!277654 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277646 (select (arr!17890 a!2986) j!136) j!136 Nil!11835))))

(assert (=> b!608009 false))

(declare-fun b!608010 () Bool)

(declare-fun Unit!19372 () Unit!19369)

(assert (=> b!608010 (= e!348195 Unit!19372)))

(declare-fun b!608011 () Bool)

(assert (=> b!608011 (= e!348192 (= lt!277644 lt!277653))))

(declare-fun b!608012 () Bool)

(assert (=> b!608012 (= e!348194 (arrayContainsKey!0 lt!277646 (select (arr!17890 a!2986) j!136) index!984))))

(declare-fun b!608013 () Bool)

(declare-fun Unit!19373 () Unit!19369)

(assert (=> b!608013 (= e!348193 Unit!19373)))

(assert (=> b!608013 false))

(declare-fun b!608014 () Bool)

(assert (=> b!608014 (= e!348197 e!348198)))

(declare-fun res!390665 () Bool)

(assert (=> b!608014 (=> (not res!390665) (not e!348198))))

(assert (=> b!608014 (= res!390665 (= (select (store (arr!17890 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608014 (= lt!277646 (array!37285 (store (arr!17890 a!2986) i!1108 k0!1786) (size!18254 a!2986)))))

(declare-fun b!608015 () Bool)

(declare-fun res!390666 () Bool)

(assert (=> b!608015 (=> (not res!390666) (not e!348197))))

(assert (=> b!608015 (= res!390666 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11835))))

(declare-fun b!608016 () Bool)

(assert (=> b!608016 (= e!348188 e!348183)))

(declare-fun res!390676 () Bool)

(assert (=> b!608016 (=> res!390676 e!348183)))

(assert (=> b!608016 (= res!390676 (or (not (= (select (arr!17890 a!2986) j!136) lt!277643)) (not (= (select (arr!17890 a!2986) j!136) lt!277652))))))

(assert (=> b!608016 e!348189))

(declare-fun res!390655 () Bool)

(assert (=> b!608016 (=> (not res!390655) (not e!348189))))

(assert (=> b!608016 (= res!390655 (= lt!277652 (select (arr!17890 a!2986) j!136)))))

(assert (=> b!608016 (= lt!277652 (select (store (arr!17890 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608017 () Bool)

(declare-fun Unit!19374 () Unit!19369)

(assert (=> b!608017 (= e!348193 Unit!19374)))

(assert (= (and start!55608 res!390668) b!607991))

(assert (= (and b!607991 res!390671) b!607995))

(assert (= (and b!607995 res!390670) b!608003))

(assert (= (and b!608003 res!390664) b!608002))

(assert (= (and b!608002 res!390673) b!607996))

(assert (= (and b!607996 res!390658) b!607993))

(assert (= (and b!607993 res!390667) b!608015))

(assert (= (and b!608015 res!390666) b!607999))

(assert (= (and b!607999 res!390654) b!608014))

(assert (= (and b!608014 res!390665) b!607994))

(assert (= (and b!607994 res!390661) b!608006))

(assert (= (and b!608006 res!390662) b!608011))

(assert (= (and b!608006 c!69038) b!608013))

(assert (= (and b!608006 (not c!69038)) b!608017))

(assert (= (and b!608006 (not res!390659)) b!608016))

(assert (= (and b!608016 res!390655) b!607992))

(assert (= (and b!607992 (not res!390660)) b!607997))

(assert (= (and b!607997 res!390669) b!608012))

(assert (= (and b!608016 (not res!390676)) b!608007))

(assert (= (and b!608007 c!69037) b!608009))

(assert (= (and b!608007 (not c!69037)) b!608010))

(assert (= (and b!608007 (not res!390675)) b!608008))

(assert (= (and b!608008 res!390657) b!608000))

(assert (= (and b!608008 (not res!390656)) b!608004))

(assert (= (and b!608004 (not res!390663)) b!607998))

(assert (= (and b!607998 (not res!390672)) b!608001))

(assert (= (and b!608001 (not res!390674)) b!608005))

(declare-fun m!584951 () Bool)

(assert (=> b!608016 m!584951))

(declare-fun m!584953 () Bool)

(assert (=> b!608016 m!584953))

(declare-fun m!584955 () Bool)

(assert (=> b!608016 m!584955))

(assert (=> b!608014 m!584953))

(declare-fun m!584957 () Bool)

(assert (=> b!608014 m!584957))

(declare-fun m!584959 () Bool)

(assert (=> b!607993 m!584959))

(declare-fun m!584961 () Bool)

(assert (=> b!607998 m!584961))

(assert (=> b!608012 m!584951))

(assert (=> b!608012 m!584951))

(declare-fun m!584963 () Bool)

(assert (=> b!608012 m!584963))

(declare-fun m!584965 () Bool)

(assert (=> b!608003 m!584965))

(assert (=> b!608009 m!584951))

(declare-fun m!584967 () Bool)

(assert (=> b!608009 m!584967))

(declare-fun m!584969 () Bool)

(assert (=> b!608009 m!584969))

(declare-fun m!584971 () Bool)

(assert (=> b!608009 m!584971))

(declare-fun m!584973 () Bool)

(assert (=> b!608009 m!584973))

(assert (=> b!608009 m!584951))

(assert (=> b!608009 m!584951))

(declare-fun m!584975 () Bool)

(assert (=> b!608009 m!584975))

(declare-fun m!584977 () Bool)

(assert (=> b!608009 m!584977))

(assert (=> b!608009 m!584951))

(declare-fun m!584979 () Bool)

(assert (=> b!608009 m!584979))

(assert (=> b!608000 m!584951))

(assert (=> b!608000 m!584951))

(assert (=> b!608000 m!584963))

(declare-fun m!584981 () Bool)

(assert (=> b!608006 m!584981))

(assert (=> b!608006 m!584951))

(assert (=> b!608006 m!584953))

(assert (=> b!608006 m!584951))

(declare-fun m!584983 () Bool)

(assert (=> b!608006 m!584983))

(declare-fun m!584985 () Bool)

(assert (=> b!608006 m!584985))

(declare-fun m!584987 () Bool)

(assert (=> b!608006 m!584987))

(declare-fun m!584989 () Bool)

(assert (=> b!608006 m!584989))

(declare-fun m!584991 () Bool)

(assert (=> b!608006 m!584991))

(declare-fun m!584993 () Bool)

(assert (=> b!607996 m!584993))

(assert (=> b!607997 m!584951))

(assert (=> b!607997 m!584951))

(declare-fun m!584995 () Bool)

(assert (=> b!607997 m!584995))

(declare-fun m!584997 () Bool)

(assert (=> b!608002 m!584997))

(declare-fun m!584999 () Bool)

(assert (=> start!55608 m!584999))

(declare-fun m!585001 () Bool)

(assert (=> start!55608 m!585001))

(declare-fun m!585003 () Bool)

(assert (=> b!608001 m!585003))

(assert (=> b!607992 m!584951))

(declare-fun m!585005 () Bool)

(assert (=> b!608005 m!585005))

(assert (=> b!607995 m!584951))

(assert (=> b!607995 m!584951))

(declare-fun m!585007 () Bool)

(assert (=> b!607995 m!585007))

(declare-fun m!585009 () Bool)

(assert (=> b!607994 m!585009))

(assert (=> b!607994 m!584951))

(assert (=> b!607994 m!584951))

(declare-fun m!585011 () Bool)

(assert (=> b!607994 m!585011))

(declare-fun m!585013 () Bool)

(assert (=> b!608004 m!585013))

(declare-fun m!585015 () Bool)

(assert (=> b!607999 m!585015))

(assert (=> b!608008 m!584951))

(assert (=> b!608008 m!584951))

(declare-fun m!585017 () Bool)

(assert (=> b!608008 m!585017))

(assert (=> b!608008 m!584951))

(declare-fun m!585019 () Bool)

(assert (=> b!608008 m!585019))

(assert (=> b!608008 m!584951))

(assert (=> b!608008 m!584995))

(declare-fun m!585021 () Bool)

(assert (=> b!608015 m!585021))

(check-sat (not b!607996) (not b!608012) (not b!607998) (not b!608002) (not b!607997) (not start!55608) (not b!608001) (not b!608008) (not b!608006) (not b!607994) (not b!608009) (not b!608004) (not b!608000) (not b!608015) (not b!607993) (not b!607995) (not b!608003) (not b!608005))
(check-sat)
