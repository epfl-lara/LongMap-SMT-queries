; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54870 () Bool)

(assert start!54870)

(declare-fun b!599987 () Bool)

(declare-fun e!343031 () Bool)

(declare-fun e!343035 () Bool)

(assert (=> b!599987 (= e!343031 e!343035)))

(declare-fun res!384929 () Bool)

(assert (=> b!599987 (=> (not res!384929) (not e!343035))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37105 0))(
  ( (array!37106 (arr!17812 (Array (_ BitVec 32) (_ BitVec 64))) (size!18176 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37105)

(assert (=> b!599987 (= res!384929 (= (select (store (arr!17812 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!272849 () array!37105)

(assert (=> b!599987 (= lt!272849 (array!37106 (store (arr!17812 a!2986) i!1108 k0!1786) (size!18176 a!2986)))))

(declare-fun b!599988 () Bool)

(declare-fun e!343030 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599988 (= e!343030 (arrayContainsKey!0 lt!272849 (select (arr!17812 a!2986) j!136) index!984))))

(declare-fun b!599989 () Bool)

(declare-fun res!384918 () Bool)

(declare-fun e!343036 () Bool)

(assert (=> b!599989 (=> (not res!384918) (not e!343036))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!599989 (= res!384918 (and (= (size!18176 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18176 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18176 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599990 () Bool)

(declare-datatypes ((Unit!18926 0))(
  ( (Unit!18927) )
))
(declare-fun e!343037 () Unit!18926)

(declare-fun Unit!18928 () Unit!18926)

(assert (=> b!599990 (= e!343037 Unit!18928)))

(declare-fun res!384924 () Bool)

(assert (=> start!54870 (=> (not res!384924) (not e!343036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54870 (= res!384924 (validMask!0 mask!3053))))

(assert (=> start!54870 e!343036))

(assert (=> start!54870 true))

(declare-fun array_inv!13608 (array!37105) Bool)

(assert (=> start!54870 (array_inv!13608 a!2986)))

(declare-fun b!599991 () Bool)

(declare-fun e!343033 () Bool)

(declare-datatypes ((SeekEntryResult!6252 0))(
  ( (MissingZero!6252 (index!27265 (_ BitVec 32))) (Found!6252 (index!27266 (_ BitVec 32))) (Intermediate!6252 (undefined!7064 Bool) (index!27267 (_ BitVec 32)) (x!56067 (_ BitVec 32))) (Undefined!6252) (MissingVacant!6252 (index!27268 (_ BitVec 32))) )
))
(declare-fun lt!272850 () SeekEntryResult!6252)

(declare-fun lt!272844 () SeekEntryResult!6252)

(assert (=> b!599991 (= e!343033 (= lt!272850 lt!272844))))

(declare-fun b!599992 () Bool)

(declare-fun e!343028 () Bool)

(declare-fun e!343032 () Bool)

(assert (=> b!599992 (= e!343028 e!343032)))

(declare-fun res!384925 () Bool)

(assert (=> b!599992 (=> res!384925 e!343032)))

(assert (=> b!599992 (= res!384925 (or (bvsge (size!18176 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18176 a!2986))))))

(declare-datatypes ((List!11853 0))(
  ( (Nil!11850) (Cons!11849 (h!12894 (_ BitVec 64)) (t!18081 List!11853)) )
))
(declare-fun arrayNoDuplicates!0 (array!37105 (_ BitVec 32) List!11853) Bool)

(assert (=> b!599992 (arrayNoDuplicates!0 lt!272849 j!136 Nil!11850)))

(declare-fun lt!272857 () Unit!18926)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37105 (_ BitVec 32) (_ BitVec 32)) Unit!18926)

(assert (=> b!599992 (= lt!272857 (lemmaNoDuplicateFromThenFromBigger!0 lt!272849 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599992 (arrayNoDuplicates!0 lt!272849 #b00000000000000000000000000000000 Nil!11850)))

(declare-fun lt!272853 () Unit!18926)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37105 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11853) Unit!18926)

(assert (=> b!599992 (= lt!272853 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11850))))

(assert (=> b!599992 (arrayContainsKey!0 lt!272849 (select (arr!17812 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272848 () Unit!18926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37105 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18926)

(assert (=> b!599992 (= lt!272848 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272849 (select (arr!17812 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599993 () Bool)

(declare-fun e!343027 () Bool)

(assert (=> b!599993 (= e!343027 e!343028)))

(declare-fun res!384916 () Bool)

(assert (=> b!599993 (=> res!384916 e!343028)))

(declare-fun lt!272847 () (_ BitVec 64))

(declare-fun lt!272856 () (_ BitVec 64))

(assert (=> b!599993 (= res!384916 (or (not (= (select (arr!17812 a!2986) j!136) lt!272847)) (not (= (select (arr!17812 a!2986) j!136) lt!272856)) (bvsge j!136 index!984)))))

(declare-fun e!343034 () Bool)

(assert (=> b!599993 e!343034))

(declare-fun res!384923 () Bool)

(assert (=> b!599993 (=> (not res!384923) (not e!343034))))

(assert (=> b!599993 (= res!384923 (= lt!272856 (select (arr!17812 a!2986) j!136)))))

(assert (=> b!599993 (= lt!272856 (select (store (arr!17812 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599994 () Bool)

(declare-fun res!384917 () Bool)

(assert (=> b!599994 (=> (not res!384917) (not e!343036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599994 (= res!384917 (validKeyInArray!0 k0!1786))))

(declare-fun b!599995 () Bool)

(declare-fun res!384922 () Bool)

(assert (=> b!599995 (=> res!384922 e!343032)))

(declare-fun contains!2969 (List!11853 (_ BitVec 64)) Bool)

(assert (=> b!599995 (= res!384922 (contains!2969 Nil!11850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599996 () Bool)

(declare-fun res!384914 () Bool)

(assert (=> b!599996 (=> (not res!384914) (not e!343036))))

(assert (=> b!599996 (= res!384914 (validKeyInArray!0 (select (arr!17812 a!2986) j!136)))))

(declare-fun b!599997 () Bool)

(declare-fun e!343038 () Bool)

(assert (=> b!599997 (= e!343034 e!343038)))

(declare-fun res!384921 () Bool)

(assert (=> b!599997 (=> res!384921 e!343038)))

(assert (=> b!599997 (= res!384921 (or (not (= (select (arr!17812 a!2986) j!136) lt!272847)) (not (= (select (arr!17812 a!2986) j!136) lt!272856)) (bvsge j!136 index!984)))))

(declare-fun b!599998 () Bool)

(declare-fun res!384913 () Bool)

(assert (=> b!599998 (=> (not res!384913) (not e!343036))))

(assert (=> b!599998 (= res!384913 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599999 () Bool)

(declare-fun Unit!18929 () Unit!18926)

(assert (=> b!599999 (= e!343037 Unit!18929)))

(assert (=> b!599999 false))

(declare-fun b!600000 () Bool)

(assert (=> b!600000 (= e!343038 e!343030)))

(declare-fun res!384920 () Bool)

(assert (=> b!600000 (=> (not res!384920) (not e!343030))))

(assert (=> b!600000 (= res!384920 (arrayContainsKey!0 lt!272849 (select (arr!17812 a!2986) j!136) j!136))))

(declare-fun b!600001 () Bool)

(declare-fun res!384928 () Bool)

(assert (=> b!600001 (=> (not res!384928) (not e!343031))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!600001 (= res!384928 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17812 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600002 () Bool)

(declare-fun res!384930 () Bool)

(assert (=> b!600002 (=> (not res!384930) (not e!343031))))

(assert (=> b!600002 (= res!384930 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11850))))

(declare-fun b!600003 () Bool)

(declare-fun e!343026 () Bool)

(assert (=> b!600003 (= e!343026 (not e!343027))))

(declare-fun res!384919 () Bool)

(assert (=> b!600003 (=> res!384919 e!343027)))

(declare-fun lt!272854 () SeekEntryResult!6252)

(assert (=> b!600003 (= res!384919 (not (= lt!272854 (Found!6252 index!984))))))

(declare-fun lt!272855 () Unit!18926)

(assert (=> b!600003 (= lt!272855 e!343037)))

(declare-fun c!67904 () Bool)

(assert (=> b!600003 (= c!67904 (= lt!272854 Undefined!6252))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37105 (_ BitVec 32)) SeekEntryResult!6252)

(assert (=> b!600003 (= lt!272854 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272847 lt!272849 mask!3053))))

(assert (=> b!600003 e!343033))

(declare-fun res!384927 () Bool)

(assert (=> b!600003 (=> (not res!384927) (not e!343033))))

(declare-fun lt!272852 () (_ BitVec 32))

(assert (=> b!600003 (= res!384927 (= lt!272844 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272852 vacantSpotIndex!68 lt!272847 lt!272849 mask!3053)))))

(assert (=> b!600003 (= lt!272844 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272852 vacantSpotIndex!68 (select (arr!17812 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600003 (= lt!272847 (select (store (arr!17812 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272845 () Unit!18926)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18926)

(assert (=> b!600003 (= lt!272845 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272852 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600003 (= lt!272852 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600004 () Bool)

(assert (=> b!600004 (= e!343036 e!343031)))

(declare-fun res!384931 () Bool)

(assert (=> b!600004 (=> (not res!384931) (not e!343031))))

(declare-fun lt!272846 () SeekEntryResult!6252)

(assert (=> b!600004 (= res!384931 (or (= lt!272846 (MissingZero!6252 i!1108)) (= lt!272846 (MissingVacant!6252 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37105 (_ BitVec 32)) SeekEntryResult!6252)

(assert (=> b!600004 (= lt!272846 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600005 () Bool)

(assert (=> b!600005 (= e!343035 e!343026)))

(declare-fun res!384915 () Bool)

(assert (=> b!600005 (=> (not res!384915) (not e!343026))))

(assert (=> b!600005 (= res!384915 (and (= lt!272850 (Found!6252 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17812 a!2986) index!984) (select (arr!17812 a!2986) j!136))) (not (= (select (arr!17812 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600005 (= lt!272850 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17812 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600006 () Bool)

(assert (=> b!600006 (= e!343032 true)))

(declare-fun lt!272851 () Bool)

(assert (=> b!600006 (= lt!272851 (contains!2969 Nil!11850 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600007 () Bool)

(declare-fun res!384932 () Bool)

(assert (=> b!600007 (=> res!384932 e!343032)))

(declare-fun noDuplicate!286 (List!11853) Bool)

(assert (=> b!600007 (= res!384932 (not (noDuplicate!286 Nil!11850)))))

(declare-fun b!600008 () Bool)

(declare-fun res!384926 () Bool)

(assert (=> b!600008 (=> (not res!384926) (not e!343031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37105 (_ BitVec 32)) Bool)

(assert (=> b!600008 (= res!384926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!54870 res!384924) b!599989))

(assert (= (and b!599989 res!384918) b!599996))

(assert (= (and b!599996 res!384914) b!599994))

(assert (= (and b!599994 res!384917) b!599998))

(assert (= (and b!599998 res!384913) b!600004))

(assert (= (and b!600004 res!384931) b!600008))

(assert (= (and b!600008 res!384926) b!600002))

(assert (= (and b!600002 res!384930) b!600001))

(assert (= (and b!600001 res!384928) b!599987))

(assert (= (and b!599987 res!384929) b!600005))

(assert (= (and b!600005 res!384915) b!600003))

(assert (= (and b!600003 res!384927) b!599991))

(assert (= (and b!600003 c!67904) b!599999))

(assert (= (and b!600003 (not c!67904)) b!599990))

(assert (= (and b!600003 (not res!384919)) b!599993))

(assert (= (and b!599993 res!384923) b!599997))

(assert (= (and b!599997 (not res!384921)) b!600000))

(assert (= (and b!600000 res!384920) b!599988))

(assert (= (and b!599993 (not res!384916)) b!599992))

(assert (= (and b!599992 (not res!384925)) b!600007))

(assert (= (and b!600007 (not res!384932)) b!599995))

(assert (= (and b!599995 (not res!384922)) b!600006))

(declare-fun m!577221 () Bool)

(assert (=> b!599994 m!577221))

(declare-fun m!577223 () Bool)

(assert (=> b!600000 m!577223))

(assert (=> b!600000 m!577223))

(declare-fun m!577225 () Bool)

(assert (=> b!600000 m!577225))

(declare-fun m!577227 () Bool)

(assert (=> b!600007 m!577227))

(declare-fun m!577229 () Bool)

(assert (=> b!600003 m!577229))

(declare-fun m!577231 () Bool)

(assert (=> b!600003 m!577231))

(assert (=> b!600003 m!577223))

(declare-fun m!577233 () Bool)

(assert (=> b!600003 m!577233))

(assert (=> b!600003 m!577223))

(declare-fun m!577235 () Bool)

(assert (=> b!600003 m!577235))

(declare-fun m!577237 () Bool)

(assert (=> b!600003 m!577237))

(declare-fun m!577239 () Bool)

(assert (=> b!600003 m!577239))

(declare-fun m!577241 () Bool)

(assert (=> b!600003 m!577241))

(assert (=> b!599992 m!577223))

(declare-fun m!577243 () Bool)

(assert (=> b!599992 m!577243))

(assert (=> b!599992 m!577223))

(assert (=> b!599992 m!577223))

(declare-fun m!577245 () Bool)

(assert (=> b!599992 m!577245))

(declare-fun m!577247 () Bool)

(assert (=> b!599992 m!577247))

(declare-fun m!577249 () Bool)

(assert (=> b!599992 m!577249))

(declare-fun m!577251 () Bool)

(assert (=> b!599992 m!577251))

(declare-fun m!577253 () Bool)

(assert (=> b!599992 m!577253))

(declare-fun m!577255 () Bool)

(assert (=> b!600004 m!577255))

(assert (=> b!599988 m!577223))

(assert (=> b!599988 m!577223))

(declare-fun m!577257 () Bool)

(assert (=> b!599988 m!577257))

(declare-fun m!577259 () Bool)

(assert (=> b!600005 m!577259))

(assert (=> b!600005 m!577223))

(assert (=> b!600005 m!577223))

(declare-fun m!577261 () Bool)

(assert (=> b!600005 m!577261))

(assert (=> b!599997 m!577223))

(declare-fun m!577263 () Bool)

(assert (=> b!599998 m!577263))

(declare-fun m!577265 () Bool)

(assert (=> b!599995 m!577265))

(declare-fun m!577267 () Bool)

(assert (=> b!600002 m!577267))

(declare-fun m!577269 () Bool)

(assert (=> b!600006 m!577269))

(assert (=> b!599987 m!577233))

(declare-fun m!577271 () Bool)

(assert (=> b!599987 m!577271))

(declare-fun m!577273 () Bool)

(assert (=> b!600008 m!577273))

(assert (=> b!599996 m!577223))

(assert (=> b!599996 m!577223))

(declare-fun m!577275 () Bool)

(assert (=> b!599996 m!577275))

(declare-fun m!577277 () Bool)

(assert (=> start!54870 m!577277))

(declare-fun m!577279 () Bool)

(assert (=> start!54870 m!577279))

(declare-fun m!577281 () Bool)

(assert (=> b!600001 m!577281))

(assert (=> b!599993 m!577223))

(assert (=> b!599993 m!577233))

(declare-fun m!577283 () Bool)

(assert (=> b!599993 m!577283))

(check-sat (not b!600006) (not b!599988) (not b!599995) (not b!600004) (not b!600002) (not b!600000) (not start!54870) (not b!599994) (not b!599996) (not b!600007) (not b!600005) (not b!600008) (not b!599992) (not b!600003) (not b!599998))
(check-sat)
