; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54900 () Bool)

(assert start!54900)

(declare-fun b!601214 () Bool)

(declare-datatypes ((Unit!19008 0))(
  ( (Unit!19009) )
))
(declare-fun e!343759 () Unit!19008)

(declare-fun Unit!19010 () Unit!19008)

(assert (=> b!601214 (= e!343759 Unit!19010)))

(declare-fun b!601215 () Bool)

(declare-fun e!343752 () Bool)

(declare-fun e!343760 () Bool)

(assert (=> b!601215 (= e!343752 e!343760)))

(declare-fun res!386116 () Bool)

(assert (=> b!601215 (=> res!386116 e!343760)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!273610 () (_ BitVec 64))

(declare-fun lt!273608 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37149 0))(
  ( (array!37150 (arr!17834 (Array (_ BitVec 32) (_ BitVec 64))) (size!18199 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37149)

(assert (=> b!601215 (= res!386116 (or (not (= (select (arr!17834 a!2986) j!136) lt!273610)) (not (= (select (arr!17834 a!2986) j!136) lt!273608)) (bvsge j!136 index!984)))))

(declare-fun b!601216 () Bool)

(declare-fun res!386115 () Bool)

(declare-fun e!343761 () Bool)

(assert (=> b!601216 (=> (not res!386115) (not e!343761))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601216 (= res!386115 (validKeyInArray!0 k0!1786))))

(declare-fun b!601217 () Bool)

(declare-fun e!343758 () Unit!19008)

(declare-fun Unit!19011 () Unit!19008)

(assert (=> b!601217 (= e!343758 Unit!19011)))

(declare-fun e!343750 () Bool)

(declare-fun b!601218 () Bool)

(assert (=> b!601218 (= e!343750 (or (bvsge index!984 j!136) (bvslt (size!18199 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!273597 () Unit!19008)

(assert (=> b!601218 (= lt!273597 e!343759)))

(declare-fun c!67922 () Bool)

(assert (=> b!601218 (= c!67922 (bvslt j!136 index!984))))

(declare-fun b!601220 () Bool)

(declare-fun e!343755 () Bool)

(declare-fun lt!273603 () array!37149)

(declare-fun arrayContainsKey!0 (array!37149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601220 (= e!343755 (arrayContainsKey!0 lt!273603 (select (arr!17834 a!2986) j!136) index!984))))

(declare-fun b!601221 () Bool)

(declare-fun res!386111 () Bool)

(declare-fun e!343756 () Bool)

(assert (=> b!601221 (=> (not res!386111) (not e!343756))))

(declare-datatypes ((List!11914 0))(
  ( (Nil!11911) (Cons!11910 (h!12955 (_ BitVec 64)) (t!18133 List!11914)) )
))
(declare-fun arrayNoDuplicates!0 (array!37149 (_ BitVec 32) List!11914) Bool)

(assert (=> b!601221 (= res!386111 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11911))))

(declare-fun b!601222 () Bool)

(declare-fun Unit!19012 () Unit!19008)

(assert (=> b!601222 (= e!343758 Unit!19012)))

(assert (=> b!601222 false))

(declare-fun b!601223 () Bool)

(declare-fun e!343753 () Bool)

(declare-fun e!343754 () Bool)

(assert (=> b!601223 (= e!343753 (not e!343754))))

(declare-fun res!386108 () Bool)

(assert (=> b!601223 (=> res!386108 e!343754)))

(declare-datatypes ((SeekEntryResult!6271 0))(
  ( (MissingZero!6271 (index!27341 (_ BitVec 32))) (Found!6271 (index!27342 (_ BitVec 32))) (Intermediate!6271 (undefined!7083 Bool) (index!27343 (_ BitVec 32)) (x!56145 (_ BitVec 32))) (Undefined!6271) (MissingVacant!6271 (index!27344 (_ BitVec 32))) )
))
(declare-fun lt!273598 () SeekEntryResult!6271)

(assert (=> b!601223 (= res!386108 (not (= lt!273598 (Found!6271 index!984))))))

(declare-fun lt!273605 () Unit!19008)

(assert (=> b!601223 (= lt!273605 e!343758)))

(declare-fun c!67923 () Bool)

(assert (=> b!601223 (= c!67923 (= lt!273598 Undefined!6271))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37149 (_ BitVec 32)) SeekEntryResult!6271)

(assert (=> b!601223 (= lt!273598 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273610 lt!273603 mask!3053))))

(declare-fun e!343749 () Bool)

(assert (=> b!601223 e!343749))

(declare-fun res!386113 () Bool)

(assert (=> b!601223 (=> (not res!386113) (not e!343749))))

(declare-fun lt!273599 () (_ BitVec 32))

(declare-fun lt!273606 () SeekEntryResult!6271)

(assert (=> b!601223 (= res!386113 (= lt!273606 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273599 vacantSpotIndex!68 lt!273610 lt!273603 mask!3053)))))

(assert (=> b!601223 (= lt!273606 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273599 vacantSpotIndex!68 (select (arr!17834 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!601223 (= lt!273610 (select (store (arr!17834 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273604 () Unit!19008)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37149 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19008)

(assert (=> b!601223 (= lt!273604 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273599 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601223 (= lt!273599 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601224 () Bool)

(declare-fun res!386107 () Bool)

(assert (=> b!601224 (=> (not res!386107) (not e!343761))))

(assert (=> b!601224 (= res!386107 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601225 () Bool)

(declare-fun res!386117 () Bool)

(assert (=> b!601225 (=> (not res!386117) (not e!343761))))

(assert (=> b!601225 (= res!386117 (validKeyInArray!0 (select (arr!17834 a!2986) j!136)))))

(declare-fun b!601226 () Bool)

(assert (=> b!601226 (= e!343761 e!343756)))

(declare-fun res!386114 () Bool)

(assert (=> b!601226 (=> (not res!386114) (not e!343756))))

(declare-fun lt!273600 () SeekEntryResult!6271)

(assert (=> b!601226 (= res!386114 (or (= lt!273600 (MissingZero!6271 i!1108)) (= lt!273600 (MissingVacant!6271 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37149 (_ BitVec 32)) SeekEntryResult!6271)

(assert (=> b!601226 (= lt!273600 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!601227 () Bool)

(declare-fun Unit!19013 () Unit!19008)

(assert (=> b!601227 (= e!343759 Unit!19013)))

(declare-fun lt!273602 () Unit!19008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19008)

(assert (=> b!601227 (= lt!273602 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273603 (select (arr!17834 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601227 (arrayContainsKey!0 lt!273603 (select (arr!17834 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273607 () Unit!19008)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11914) Unit!19008)

(assert (=> b!601227 (= lt!273607 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11911))))

(assert (=> b!601227 (arrayNoDuplicates!0 lt!273603 #b00000000000000000000000000000000 Nil!11911)))

(declare-fun lt!273596 () Unit!19008)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37149 (_ BitVec 32) (_ BitVec 32)) Unit!19008)

(assert (=> b!601227 (= lt!273596 (lemmaNoDuplicateFromThenFromBigger!0 lt!273603 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601227 (arrayNoDuplicates!0 lt!273603 j!136 Nil!11911)))

(declare-fun lt!273609 () Unit!19008)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37149 (_ BitVec 64) (_ BitVec 32) List!11914) Unit!19008)

(assert (=> b!601227 (= lt!273609 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273603 (select (arr!17834 a!2986) j!136) j!136 Nil!11911))))

(assert (=> b!601227 false))

(declare-fun b!601228 () Bool)

(declare-fun e!343751 () Bool)

(assert (=> b!601228 (= e!343756 e!343751)))

(declare-fun res!386119 () Bool)

(assert (=> b!601228 (=> (not res!386119) (not e!343751))))

(assert (=> b!601228 (= res!386119 (= (select (store (arr!17834 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601228 (= lt!273603 (array!37150 (store (arr!17834 a!2986) i!1108 k0!1786) (size!18199 a!2986)))))

(declare-fun b!601219 () Bool)

(assert (=> b!601219 (= e!343754 e!343750)))

(declare-fun res!386112 () Bool)

(assert (=> b!601219 (=> res!386112 e!343750)))

(assert (=> b!601219 (= res!386112 (or (not (= (select (arr!17834 a!2986) j!136) lt!273610)) (not (= (select (arr!17834 a!2986) j!136) lt!273608))))))

(assert (=> b!601219 e!343752))

(declare-fun res!386110 () Bool)

(assert (=> b!601219 (=> (not res!386110) (not e!343752))))

(assert (=> b!601219 (= res!386110 (= lt!273608 (select (arr!17834 a!2986) j!136)))))

(assert (=> b!601219 (= lt!273608 (select (store (arr!17834 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!386109 () Bool)

(assert (=> start!54900 (=> (not res!386109) (not e!343761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54900 (= res!386109 (validMask!0 mask!3053))))

(assert (=> start!54900 e!343761))

(assert (=> start!54900 true))

(declare-fun array_inv!13717 (array!37149) Bool)

(assert (=> start!54900 (array_inv!13717 a!2986)))

(declare-fun b!601229 () Bool)

(declare-fun res!386106 () Bool)

(assert (=> b!601229 (=> (not res!386106) (not e!343756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37149 (_ BitVec 32)) Bool)

(assert (=> b!601229 (= res!386106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601230 () Bool)

(assert (=> b!601230 (= e!343760 e!343755)))

(declare-fun res!386104 () Bool)

(assert (=> b!601230 (=> (not res!386104) (not e!343755))))

(assert (=> b!601230 (= res!386104 (arrayContainsKey!0 lt!273603 (select (arr!17834 a!2986) j!136) j!136))))

(declare-fun b!601231 () Bool)

(declare-fun lt!273601 () SeekEntryResult!6271)

(assert (=> b!601231 (= e!343749 (= lt!273601 lt!273606))))

(declare-fun b!601232 () Bool)

(assert (=> b!601232 (= e!343751 e!343753)))

(declare-fun res!386105 () Bool)

(assert (=> b!601232 (=> (not res!386105) (not e!343753))))

(assert (=> b!601232 (= res!386105 (and (= lt!273601 (Found!6271 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17834 a!2986) index!984) (select (arr!17834 a!2986) j!136))) (not (= (select (arr!17834 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601232 (= lt!273601 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17834 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601233 () Bool)

(declare-fun res!386120 () Bool)

(assert (=> b!601233 (=> (not res!386120) (not e!343756))))

(assert (=> b!601233 (= res!386120 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17834 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601234 () Bool)

(declare-fun res!386118 () Bool)

(assert (=> b!601234 (=> (not res!386118) (not e!343761))))

(assert (=> b!601234 (= res!386118 (and (= (size!18199 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18199 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18199 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54900 res!386109) b!601234))

(assert (= (and b!601234 res!386118) b!601225))

(assert (= (and b!601225 res!386117) b!601216))

(assert (= (and b!601216 res!386115) b!601224))

(assert (= (and b!601224 res!386107) b!601226))

(assert (= (and b!601226 res!386114) b!601229))

(assert (= (and b!601229 res!386106) b!601221))

(assert (= (and b!601221 res!386111) b!601233))

(assert (= (and b!601233 res!386120) b!601228))

(assert (= (and b!601228 res!386119) b!601232))

(assert (= (and b!601232 res!386105) b!601223))

(assert (= (and b!601223 res!386113) b!601231))

(assert (= (and b!601223 c!67923) b!601222))

(assert (= (and b!601223 (not c!67923)) b!601217))

(assert (= (and b!601223 (not res!386108)) b!601219))

(assert (= (and b!601219 res!386110) b!601215))

(assert (= (and b!601215 (not res!386116)) b!601230))

(assert (= (and b!601230 res!386104) b!601220))

(assert (= (and b!601219 (not res!386112)) b!601218))

(assert (= (and b!601218 c!67922) b!601227))

(assert (= (and b!601218 (not c!67922)) b!601214))

(declare-fun m!577897 () Bool)

(assert (=> b!601233 m!577897))

(declare-fun m!577899 () Bool)

(assert (=> b!601224 m!577899))

(declare-fun m!577901 () Bool)

(assert (=> b!601216 m!577901))

(declare-fun m!577903 () Bool)

(assert (=> b!601230 m!577903))

(assert (=> b!601230 m!577903))

(declare-fun m!577905 () Bool)

(assert (=> b!601230 m!577905))

(declare-fun m!577907 () Bool)

(assert (=> b!601221 m!577907))

(declare-fun m!577909 () Bool)

(assert (=> start!54900 m!577909))

(declare-fun m!577911 () Bool)

(assert (=> start!54900 m!577911))

(assert (=> b!601219 m!577903))

(declare-fun m!577913 () Bool)

(assert (=> b!601219 m!577913))

(declare-fun m!577915 () Bool)

(assert (=> b!601219 m!577915))

(assert (=> b!601223 m!577903))

(declare-fun m!577917 () Bool)

(assert (=> b!601223 m!577917))

(assert (=> b!601223 m!577913))

(declare-fun m!577919 () Bool)

(assert (=> b!601223 m!577919))

(declare-fun m!577921 () Bool)

(assert (=> b!601223 m!577921))

(declare-fun m!577923 () Bool)

(assert (=> b!601223 m!577923))

(declare-fun m!577925 () Bool)

(assert (=> b!601223 m!577925))

(assert (=> b!601223 m!577903))

(declare-fun m!577927 () Bool)

(assert (=> b!601223 m!577927))

(declare-fun m!577929 () Bool)

(assert (=> b!601229 m!577929))

(assert (=> b!601227 m!577903))

(declare-fun m!577931 () Bool)

(assert (=> b!601227 m!577931))

(declare-fun m!577933 () Bool)

(assert (=> b!601227 m!577933))

(assert (=> b!601227 m!577903))

(assert (=> b!601227 m!577903))

(declare-fun m!577935 () Bool)

(assert (=> b!601227 m!577935))

(declare-fun m!577937 () Bool)

(assert (=> b!601227 m!577937))

(declare-fun m!577939 () Bool)

(assert (=> b!601227 m!577939))

(assert (=> b!601227 m!577903))

(declare-fun m!577941 () Bool)

(assert (=> b!601227 m!577941))

(declare-fun m!577943 () Bool)

(assert (=> b!601227 m!577943))

(assert (=> b!601228 m!577913))

(declare-fun m!577945 () Bool)

(assert (=> b!601228 m!577945))

(assert (=> b!601215 m!577903))

(declare-fun m!577947 () Bool)

(assert (=> b!601226 m!577947))

(assert (=> b!601220 m!577903))

(assert (=> b!601220 m!577903))

(declare-fun m!577949 () Bool)

(assert (=> b!601220 m!577949))

(declare-fun m!577951 () Bool)

(assert (=> b!601232 m!577951))

(assert (=> b!601232 m!577903))

(assert (=> b!601232 m!577903))

(declare-fun m!577953 () Bool)

(assert (=> b!601232 m!577953))

(assert (=> b!601225 m!577903))

(assert (=> b!601225 m!577903))

(declare-fun m!577955 () Bool)

(assert (=> b!601225 m!577955))

(check-sat (not b!601227) (not b!601226) (not b!601225) (not b!601223) (not b!601224) (not start!54900) (not b!601232) (not b!601221) (not b!601220) (not b!601230) (not b!601229) (not b!601216))
(check-sat)
(get-model)

(declare-fun d!86923 () Bool)

(declare-fun res!386227 () Bool)

(declare-fun e!343844 () Bool)

(assert (=> d!86923 (=> res!386227 e!343844)))

(assert (=> d!86923 (= res!386227 (= (select (arr!17834 lt!273603) j!136) (select (arr!17834 a!2986) j!136)))))

(assert (=> d!86923 (= (arrayContainsKey!0 lt!273603 (select (arr!17834 a!2986) j!136) j!136) e!343844)))

(declare-fun b!601365 () Bool)

(declare-fun e!343845 () Bool)

(assert (=> b!601365 (= e!343844 e!343845)))

(declare-fun res!386228 () Bool)

(assert (=> b!601365 (=> (not res!386228) (not e!343845))))

(assert (=> b!601365 (= res!386228 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18199 lt!273603)))))

(declare-fun b!601366 () Bool)

(assert (=> b!601366 (= e!343845 (arrayContainsKey!0 lt!273603 (select (arr!17834 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86923 (not res!386227)) b!601365))

(assert (= (and b!601365 res!386228) b!601366))

(declare-fun m!578077 () Bool)

(assert (=> d!86923 m!578077))

(assert (=> b!601366 m!577903))

(declare-fun m!578079 () Bool)

(assert (=> b!601366 m!578079))

(assert (=> b!601230 d!86923))

(declare-fun b!601377 () Bool)

(declare-fun e!343855 () Bool)

(declare-fun e!343857 () Bool)

(assert (=> b!601377 (= e!343855 e!343857)))

(declare-fun res!386237 () Bool)

(assert (=> b!601377 (=> (not res!386237) (not e!343857))))

(declare-fun e!343854 () Bool)

(assert (=> b!601377 (= res!386237 (not e!343854))))

(declare-fun res!386236 () Bool)

(assert (=> b!601377 (=> (not res!386236) (not e!343854))))

(assert (=> b!601377 (= res!386236 (validKeyInArray!0 (select (arr!17834 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86925 () Bool)

(declare-fun res!386235 () Bool)

(assert (=> d!86925 (=> res!386235 e!343855)))

(assert (=> d!86925 (= res!386235 (bvsge #b00000000000000000000000000000000 (size!18199 a!2986)))))

(assert (=> d!86925 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11911) e!343855)))

(declare-fun b!601378 () Bool)

(declare-fun e!343856 () Bool)

(assert (=> b!601378 (= e!343857 e!343856)))

(declare-fun c!67938 () Bool)

(assert (=> b!601378 (= c!67938 (validKeyInArray!0 (select (arr!17834 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!601379 () Bool)

(declare-fun call!32944 () Bool)

(assert (=> b!601379 (= e!343856 call!32944)))

(declare-fun b!601380 () Bool)

(assert (=> b!601380 (= e!343856 call!32944)))

(declare-fun b!601381 () Bool)

(declare-fun contains!2973 (List!11914 (_ BitVec 64)) Bool)

(assert (=> b!601381 (= e!343854 (contains!2973 Nil!11911 (select (arr!17834 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32941 () Bool)

(assert (=> bm!32941 (= call!32944 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67938 (Cons!11910 (select (arr!17834 a!2986) #b00000000000000000000000000000000) Nil!11911) Nil!11911)))))

(assert (= (and d!86925 (not res!386235)) b!601377))

(assert (= (and b!601377 res!386236) b!601381))

(assert (= (and b!601377 res!386237) b!601378))

(assert (= (and b!601378 c!67938) b!601380))

(assert (= (and b!601378 (not c!67938)) b!601379))

(assert (= (or b!601380 b!601379) bm!32941))

(declare-fun m!578081 () Bool)

(assert (=> b!601377 m!578081))

(assert (=> b!601377 m!578081))

(declare-fun m!578083 () Bool)

(assert (=> b!601377 m!578083))

(assert (=> b!601378 m!578081))

(assert (=> b!601378 m!578081))

(assert (=> b!601378 m!578083))

(assert (=> b!601381 m!578081))

(assert (=> b!601381 m!578081))

(declare-fun m!578085 () Bool)

(assert (=> b!601381 m!578085))

(assert (=> bm!32941 m!578081))

(declare-fun m!578087 () Bool)

(assert (=> bm!32941 m!578087))

(assert (=> b!601221 d!86925))

(declare-fun d!86927 () Bool)

(declare-fun res!386238 () Bool)

(declare-fun e!343858 () Bool)

(assert (=> d!86927 (=> res!386238 e!343858)))

(assert (=> d!86927 (= res!386238 (= (select (arr!17834 lt!273603) index!984) (select (arr!17834 a!2986) j!136)))))

(assert (=> d!86927 (= (arrayContainsKey!0 lt!273603 (select (arr!17834 a!2986) j!136) index!984) e!343858)))

(declare-fun b!601382 () Bool)

(declare-fun e!343859 () Bool)

(assert (=> b!601382 (= e!343858 e!343859)))

(declare-fun res!386239 () Bool)

(assert (=> b!601382 (=> (not res!386239) (not e!343859))))

(assert (=> b!601382 (= res!386239 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18199 lt!273603)))))

(declare-fun b!601383 () Bool)

(assert (=> b!601383 (= e!343859 (arrayContainsKey!0 lt!273603 (select (arr!17834 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86927 (not res!386238)) b!601382))

(assert (= (and b!601382 res!386239) b!601383))

(declare-fun m!578089 () Bool)

(assert (=> d!86927 m!578089))

(assert (=> b!601383 m!577903))

(declare-fun m!578091 () Bool)

(assert (=> b!601383 m!578091))

(assert (=> b!601220 d!86927))

(declare-fun d!86929 () Bool)

(assert (=> d!86929 (arrayNoDuplicates!0 lt!273603 j!136 Nil!11911)))

(declare-fun lt!273703 () Unit!19008)

(declare-fun choose!39 (array!37149 (_ BitVec 32) (_ BitVec 32)) Unit!19008)

(assert (=> d!86929 (= lt!273703 (choose!39 lt!273603 #b00000000000000000000000000000000 j!136))))

(assert (=> d!86929 (bvslt (size!18199 lt!273603) #b01111111111111111111111111111111)))

(assert (=> d!86929 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!273603 #b00000000000000000000000000000000 j!136) lt!273703)))

(declare-fun bs!18409 () Bool)

(assert (= bs!18409 d!86929))

(assert (=> bs!18409 m!577939))

(declare-fun m!578093 () Bool)

(assert (=> bs!18409 m!578093))

(assert (=> b!601227 d!86929))

(declare-fun b!601384 () Bool)

(declare-fun e!343861 () Bool)

(declare-fun e!343863 () Bool)

(assert (=> b!601384 (= e!343861 e!343863)))

(declare-fun res!386242 () Bool)

(assert (=> b!601384 (=> (not res!386242) (not e!343863))))

(declare-fun e!343860 () Bool)

(assert (=> b!601384 (= res!386242 (not e!343860))))

(declare-fun res!386241 () Bool)

(assert (=> b!601384 (=> (not res!386241) (not e!343860))))

(assert (=> b!601384 (= res!386241 (validKeyInArray!0 (select (arr!17834 lt!273603) #b00000000000000000000000000000000)))))

(declare-fun d!86931 () Bool)

(declare-fun res!386240 () Bool)

(assert (=> d!86931 (=> res!386240 e!343861)))

(assert (=> d!86931 (= res!386240 (bvsge #b00000000000000000000000000000000 (size!18199 lt!273603)))))

(assert (=> d!86931 (= (arrayNoDuplicates!0 lt!273603 #b00000000000000000000000000000000 Nil!11911) e!343861)))

(declare-fun b!601385 () Bool)

(declare-fun e!343862 () Bool)

(assert (=> b!601385 (= e!343863 e!343862)))

(declare-fun c!67939 () Bool)

(assert (=> b!601385 (= c!67939 (validKeyInArray!0 (select (arr!17834 lt!273603) #b00000000000000000000000000000000)))))

(declare-fun b!601386 () Bool)

(declare-fun call!32945 () Bool)

(assert (=> b!601386 (= e!343862 call!32945)))

(declare-fun b!601387 () Bool)

(assert (=> b!601387 (= e!343862 call!32945)))

(declare-fun b!601388 () Bool)

(assert (=> b!601388 (= e!343860 (contains!2973 Nil!11911 (select (arr!17834 lt!273603) #b00000000000000000000000000000000)))))

(declare-fun bm!32942 () Bool)

(assert (=> bm!32942 (= call!32945 (arrayNoDuplicates!0 lt!273603 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67939 (Cons!11910 (select (arr!17834 lt!273603) #b00000000000000000000000000000000) Nil!11911) Nil!11911)))))

(assert (= (and d!86931 (not res!386240)) b!601384))

(assert (= (and b!601384 res!386241) b!601388))

(assert (= (and b!601384 res!386242) b!601385))

(assert (= (and b!601385 c!67939) b!601387))

(assert (= (and b!601385 (not c!67939)) b!601386))

(assert (= (or b!601387 b!601386) bm!32942))

(declare-fun m!578095 () Bool)

(assert (=> b!601384 m!578095))

(assert (=> b!601384 m!578095))

(declare-fun m!578097 () Bool)

(assert (=> b!601384 m!578097))

(assert (=> b!601385 m!578095))

(assert (=> b!601385 m!578095))

(assert (=> b!601385 m!578097))

(assert (=> b!601388 m!578095))

(assert (=> b!601388 m!578095))

(declare-fun m!578099 () Bool)

(assert (=> b!601388 m!578099))

(assert (=> bm!32942 m!578095))

(declare-fun m!578101 () Bool)

(assert (=> bm!32942 m!578101))

(assert (=> b!601227 d!86931))

(declare-fun d!86933 () Bool)

(assert (=> d!86933 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18199 lt!273603)) (not (= (select (arr!17834 lt!273603) j!136) (select (arr!17834 a!2986) j!136))))))

(declare-fun lt!273706 () Unit!19008)

(declare-fun choose!21 (array!37149 (_ BitVec 64) (_ BitVec 32) List!11914) Unit!19008)

(assert (=> d!86933 (= lt!273706 (choose!21 lt!273603 (select (arr!17834 a!2986) j!136) j!136 Nil!11911))))

(assert (=> d!86933 (bvslt (size!18199 lt!273603) #b01111111111111111111111111111111)))

(assert (=> d!86933 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273603 (select (arr!17834 a!2986) j!136) j!136 Nil!11911) lt!273706)))

(declare-fun bs!18410 () Bool)

(assert (= bs!18410 d!86933))

(assert (=> bs!18410 m!578077))

(assert (=> bs!18410 m!577903))

(declare-fun m!578103 () Bool)

(assert (=> bs!18410 m!578103))

(assert (=> b!601227 d!86933))

(declare-fun d!86935 () Bool)

(declare-fun res!386243 () Bool)

(declare-fun e!343864 () Bool)

(assert (=> d!86935 (=> res!386243 e!343864)))

(assert (=> d!86935 (= res!386243 (= (select (arr!17834 lt!273603) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17834 a!2986) j!136)))))

(assert (=> d!86935 (= (arrayContainsKey!0 lt!273603 (select (arr!17834 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!343864)))

(declare-fun b!601389 () Bool)

(declare-fun e!343865 () Bool)

(assert (=> b!601389 (= e!343864 e!343865)))

(declare-fun res!386244 () Bool)

(assert (=> b!601389 (=> (not res!386244) (not e!343865))))

(assert (=> b!601389 (= res!386244 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18199 lt!273603)))))

(declare-fun b!601390 () Bool)

(assert (=> b!601390 (= e!343865 (arrayContainsKey!0 lt!273603 (select (arr!17834 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86935 (not res!386243)) b!601389))

(assert (= (and b!601389 res!386244) b!601390))

(declare-fun m!578105 () Bool)

(assert (=> d!86935 m!578105))

(assert (=> b!601390 m!577903))

(declare-fun m!578107 () Bool)

(assert (=> b!601390 m!578107))

(assert (=> b!601227 d!86935))

(declare-fun b!601391 () Bool)

(declare-fun e!343867 () Bool)

(declare-fun e!343869 () Bool)

(assert (=> b!601391 (= e!343867 e!343869)))

(declare-fun res!386247 () Bool)

(assert (=> b!601391 (=> (not res!386247) (not e!343869))))

(declare-fun e!343866 () Bool)

(assert (=> b!601391 (= res!386247 (not e!343866))))

(declare-fun res!386246 () Bool)

(assert (=> b!601391 (=> (not res!386246) (not e!343866))))

(assert (=> b!601391 (= res!386246 (validKeyInArray!0 (select (arr!17834 lt!273603) j!136)))))

(declare-fun d!86937 () Bool)

(declare-fun res!386245 () Bool)

(assert (=> d!86937 (=> res!386245 e!343867)))

(assert (=> d!86937 (= res!386245 (bvsge j!136 (size!18199 lt!273603)))))

(assert (=> d!86937 (= (arrayNoDuplicates!0 lt!273603 j!136 Nil!11911) e!343867)))

(declare-fun b!601392 () Bool)

(declare-fun e!343868 () Bool)

(assert (=> b!601392 (= e!343869 e!343868)))

(declare-fun c!67940 () Bool)

(assert (=> b!601392 (= c!67940 (validKeyInArray!0 (select (arr!17834 lt!273603) j!136)))))

(declare-fun b!601393 () Bool)

(declare-fun call!32946 () Bool)

(assert (=> b!601393 (= e!343868 call!32946)))

(declare-fun b!601394 () Bool)

(assert (=> b!601394 (= e!343868 call!32946)))

(declare-fun b!601395 () Bool)

(assert (=> b!601395 (= e!343866 (contains!2973 Nil!11911 (select (arr!17834 lt!273603) j!136)))))

(declare-fun bm!32943 () Bool)

(assert (=> bm!32943 (= call!32946 (arrayNoDuplicates!0 lt!273603 (bvadd j!136 #b00000000000000000000000000000001) (ite c!67940 (Cons!11910 (select (arr!17834 lt!273603) j!136) Nil!11911) Nil!11911)))))

(assert (= (and d!86937 (not res!386245)) b!601391))

(assert (= (and b!601391 res!386246) b!601395))

(assert (= (and b!601391 res!386247) b!601392))

(assert (= (and b!601392 c!67940) b!601394))

(assert (= (and b!601392 (not c!67940)) b!601393))

(assert (= (or b!601394 b!601393) bm!32943))

(assert (=> b!601391 m!578077))

(assert (=> b!601391 m!578077))

(declare-fun m!578109 () Bool)

(assert (=> b!601391 m!578109))

(assert (=> b!601392 m!578077))

(assert (=> b!601392 m!578077))

(assert (=> b!601392 m!578109))

(assert (=> b!601395 m!578077))

(assert (=> b!601395 m!578077))

(declare-fun m!578111 () Bool)

(assert (=> b!601395 m!578111))

(assert (=> bm!32943 m!578077))

(declare-fun m!578113 () Bool)

(assert (=> bm!32943 m!578113))

(assert (=> b!601227 d!86937))

(declare-fun d!86939 () Bool)

(assert (=> d!86939 (arrayContainsKey!0 lt!273603 (select (arr!17834 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273709 () Unit!19008)

(declare-fun choose!114 (array!37149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19008)

(assert (=> d!86939 (= lt!273709 (choose!114 lt!273603 (select (arr!17834 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86939 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86939 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273603 (select (arr!17834 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!273709)))

(declare-fun bs!18411 () Bool)

(assert (= bs!18411 d!86939))

(assert (=> bs!18411 m!577903))

(assert (=> bs!18411 m!577931))

(assert (=> bs!18411 m!577903))

(declare-fun m!578115 () Bool)

(assert (=> bs!18411 m!578115))

(assert (=> b!601227 d!86939))

(declare-fun d!86941 () Bool)

(declare-fun e!343872 () Bool)

(assert (=> d!86941 e!343872))

(declare-fun res!386250 () Bool)

(assert (=> d!86941 (=> (not res!386250) (not e!343872))))

(assert (=> d!86941 (= res!386250 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18199 a!2986))))))

(declare-fun lt!273712 () Unit!19008)

(declare-fun choose!41 (array!37149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11914) Unit!19008)

(assert (=> d!86941 (= lt!273712 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11911))))

(assert (=> d!86941 (bvslt (size!18199 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86941 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11911) lt!273712)))

(declare-fun b!601398 () Bool)

(assert (=> b!601398 (= e!343872 (arrayNoDuplicates!0 (array!37150 (store (arr!17834 a!2986) i!1108 k0!1786) (size!18199 a!2986)) #b00000000000000000000000000000000 Nil!11911))))

(assert (= (and d!86941 res!386250) b!601398))

(declare-fun m!578117 () Bool)

(assert (=> d!86941 m!578117))

(assert (=> b!601398 m!577913))

(declare-fun m!578119 () Bool)

(assert (=> b!601398 m!578119))

(assert (=> b!601227 d!86941))

(declare-fun d!86943 () Bool)

(assert (=> d!86943 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!601216 d!86943))

(declare-fun bm!32946 () Bool)

(declare-fun call!32949 () Bool)

(assert (=> bm!32946 (= call!32949 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!86945 () Bool)

(declare-fun res!386255 () Bool)

(declare-fun e!343879 () Bool)

(assert (=> d!86945 (=> res!386255 e!343879)))

(assert (=> d!86945 (= res!386255 (bvsge #b00000000000000000000000000000000 (size!18199 a!2986)))))

(assert (=> d!86945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!343879)))

(declare-fun b!601407 () Bool)

(declare-fun e!343881 () Bool)

(declare-fun e!343880 () Bool)

(assert (=> b!601407 (= e!343881 e!343880)))

(declare-fun lt!273719 () (_ BitVec 64))

(assert (=> b!601407 (= lt!273719 (select (arr!17834 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!273720 () Unit!19008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37149 (_ BitVec 64) (_ BitVec 32)) Unit!19008)

(assert (=> b!601407 (= lt!273720 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!273719 #b00000000000000000000000000000000))))

(assert (=> b!601407 (arrayContainsKey!0 a!2986 lt!273719 #b00000000000000000000000000000000)))

(declare-fun lt!273721 () Unit!19008)

(assert (=> b!601407 (= lt!273721 lt!273720)))

(declare-fun res!386256 () Bool)

(assert (=> b!601407 (= res!386256 (= (seekEntryOrOpen!0 (select (arr!17834 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6271 #b00000000000000000000000000000000)))))

(assert (=> b!601407 (=> (not res!386256) (not e!343880))))

(declare-fun b!601408 () Bool)

(assert (=> b!601408 (= e!343880 call!32949)))

(declare-fun b!601409 () Bool)

(assert (=> b!601409 (= e!343879 e!343881)))

(declare-fun c!67943 () Bool)

(assert (=> b!601409 (= c!67943 (validKeyInArray!0 (select (arr!17834 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!601410 () Bool)

(assert (=> b!601410 (= e!343881 call!32949)))

(assert (= (and d!86945 (not res!386255)) b!601409))

(assert (= (and b!601409 c!67943) b!601407))

(assert (= (and b!601409 (not c!67943)) b!601410))

(assert (= (and b!601407 res!386256) b!601408))

(assert (= (or b!601408 b!601410) bm!32946))

(declare-fun m!578121 () Bool)

(assert (=> bm!32946 m!578121))

(assert (=> b!601407 m!578081))

(declare-fun m!578123 () Bool)

(assert (=> b!601407 m!578123))

(declare-fun m!578125 () Bool)

(assert (=> b!601407 m!578125))

(assert (=> b!601407 m!578081))

(declare-fun m!578127 () Bool)

(assert (=> b!601407 m!578127))

(assert (=> b!601409 m!578081))

(assert (=> b!601409 m!578081))

(assert (=> b!601409 m!578083))

(assert (=> b!601229 d!86945))

(declare-fun d!86947 () Bool)

(assert (=> d!86947 (= (validKeyInArray!0 (select (arr!17834 a!2986) j!136)) (and (not (= (select (arr!17834 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17834 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!601225 d!86947))

(declare-fun d!86949 () Bool)

(declare-fun res!386257 () Bool)

(declare-fun e!343882 () Bool)

(assert (=> d!86949 (=> res!386257 e!343882)))

(assert (=> d!86949 (= res!386257 (= (select (arr!17834 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86949 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!343882)))

(declare-fun b!601411 () Bool)

(declare-fun e!343883 () Bool)

(assert (=> b!601411 (= e!343882 e!343883)))

(declare-fun res!386258 () Bool)

(assert (=> b!601411 (=> (not res!386258) (not e!343883))))

(assert (=> b!601411 (= res!386258 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18199 a!2986)))))

(declare-fun b!601412 () Bool)

(assert (=> b!601412 (= e!343883 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86949 (not res!386257)) b!601411))

(assert (= (and b!601411 res!386258) b!601412))

(assert (=> d!86949 m!578081))

(declare-fun m!578129 () Bool)

(assert (=> b!601412 m!578129))

(assert (=> b!601224 d!86949))

(declare-fun b!601425 () Bool)

(declare-fun e!343892 () SeekEntryResult!6271)

(declare-fun lt!273729 () SeekEntryResult!6271)

(assert (=> b!601425 (= e!343892 (MissingZero!6271 (index!27343 lt!273729)))))

(declare-fun b!601426 () Bool)

(declare-fun e!343891 () SeekEntryResult!6271)

(assert (=> b!601426 (= e!343891 Undefined!6271)))

(declare-fun b!601427 () Bool)

(declare-fun e!343890 () SeekEntryResult!6271)

(assert (=> b!601427 (= e!343890 (Found!6271 (index!27343 lt!273729)))))

(declare-fun d!86951 () Bool)

(declare-fun lt!273728 () SeekEntryResult!6271)

(get-info :version)

(assert (=> d!86951 (and (or ((_ is Undefined!6271) lt!273728) (not ((_ is Found!6271) lt!273728)) (and (bvsge (index!27342 lt!273728) #b00000000000000000000000000000000) (bvslt (index!27342 lt!273728) (size!18199 a!2986)))) (or ((_ is Undefined!6271) lt!273728) ((_ is Found!6271) lt!273728) (not ((_ is MissingZero!6271) lt!273728)) (and (bvsge (index!27341 lt!273728) #b00000000000000000000000000000000) (bvslt (index!27341 lt!273728) (size!18199 a!2986)))) (or ((_ is Undefined!6271) lt!273728) ((_ is Found!6271) lt!273728) ((_ is MissingZero!6271) lt!273728) (not ((_ is MissingVacant!6271) lt!273728)) (and (bvsge (index!27344 lt!273728) #b00000000000000000000000000000000) (bvslt (index!27344 lt!273728) (size!18199 a!2986)))) (or ((_ is Undefined!6271) lt!273728) (ite ((_ is Found!6271) lt!273728) (= (select (arr!17834 a!2986) (index!27342 lt!273728)) k0!1786) (ite ((_ is MissingZero!6271) lt!273728) (= (select (arr!17834 a!2986) (index!27341 lt!273728)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6271) lt!273728) (= (select (arr!17834 a!2986) (index!27344 lt!273728)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86951 (= lt!273728 e!343891)))

(declare-fun c!67952 () Bool)

(assert (=> d!86951 (= c!67952 (and ((_ is Intermediate!6271) lt!273729) (undefined!7083 lt!273729)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37149 (_ BitVec 32)) SeekEntryResult!6271)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86951 (= lt!273729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86951 (validMask!0 mask!3053)))

(assert (=> d!86951 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!273728)))

(declare-fun b!601428 () Bool)

(assert (=> b!601428 (= e!343892 (seekKeyOrZeroReturnVacant!0 (x!56145 lt!273729) (index!27343 lt!273729) (index!27343 lt!273729) k0!1786 a!2986 mask!3053))))

(declare-fun b!601429 () Bool)

(declare-fun c!67951 () Bool)

(declare-fun lt!273730 () (_ BitVec 64))

(assert (=> b!601429 (= c!67951 (= lt!273730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601429 (= e!343890 e!343892)))

(declare-fun b!601430 () Bool)

(assert (=> b!601430 (= e!343891 e!343890)))

(assert (=> b!601430 (= lt!273730 (select (arr!17834 a!2986) (index!27343 lt!273729)))))

(declare-fun c!67950 () Bool)

(assert (=> b!601430 (= c!67950 (= lt!273730 k0!1786))))

(assert (= (and d!86951 c!67952) b!601426))

(assert (= (and d!86951 (not c!67952)) b!601430))

(assert (= (and b!601430 c!67950) b!601427))

(assert (= (and b!601430 (not c!67950)) b!601429))

(assert (= (and b!601429 c!67951) b!601425))

(assert (= (and b!601429 (not c!67951)) b!601428))

(declare-fun m!578131 () Bool)

(assert (=> d!86951 m!578131))

(declare-fun m!578133 () Bool)

(assert (=> d!86951 m!578133))

(declare-fun m!578135 () Bool)

(assert (=> d!86951 m!578135))

(assert (=> d!86951 m!577909))

(declare-fun m!578137 () Bool)

(assert (=> d!86951 m!578137))

(assert (=> d!86951 m!578133))

(declare-fun m!578139 () Bool)

(assert (=> d!86951 m!578139))

(declare-fun m!578141 () Bool)

(assert (=> b!601428 m!578141))

(declare-fun m!578143 () Bool)

(assert (=> b!601430 m!578143))

(assert (=> b!601226 d!86951))

(declare-fun d!86955 () Bool)

(assert (=> d!86955 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54900 d!86955))

(declare-fun d!86959 () Bool)

(assert (=> d!86959 (= (array_inv!13717 a!2986) (bvsge (size!18199 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54900 d!86959))

(declare-fun b!601482 () Bool)

(declare-fun c!67972 () Bool)

(declare-fun lt!273744 () (_ BitVec 64))

(assert (=> b!601482 (= c!67972 (= lt!273744 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!343927 () SeekEntryResult!6271)

(declare-fun e!343928 () SeekEntryResult!6271)

(assert (=> b!601482 (= e!343927 e!343928)))

(declare-fun b!601483 () Bool)

(assert (=> b!601483 (= e!343927 (Found!6271 index!984))))

(declare-fun b!601484 () Bool)

(declare-fun e!343929 () SeekEntryResult!6271)

(assert (=> b!601484 (= e!343929 e!343927)))

(declare-fun c!67971 () Bool)

(assert (=> b!601484 (= c!67971 (= lt!273744 (select (arr!17834 a!2986) j!136)))))

(declare-fun d!86963 () Bool)

(declare-fun lt!273745 () SeekEntryResult!6271)

(assert (=> d!86963 (and (or ((_ is Undefined!6271) lt!273745) (not ((_ is Found!6271) lt!273745)) (and (bvsge (index!27342 lt!273745) #b00000000000000000000000000000000) (bvslt (index!27342 lt!273745) (size!18199 a!2986)))) (or ((_ is Undefined!6271) lt!273745) ((_ is Found!6271) lt!273745) (not ((_ is MissingVacant!6271) lt!273745)) (not (= (index!27344 lt!273745) vacantSpotIndex!68)) (and (bvsge (index!27344 lt!273745) #b00000000000000000000000000000000) (bvslt (index!27344 lt!273745) (size!18199 a!2986)))) (or ((_ is Undefined!6271) lt!273745) (ite ((_ is Found!6271) lt!273745) (= (select (arr!17834 a!2986) (index!27342 lt!273745)) (select (arr!17834 a!2986) j!136)) (and ((_ is MissingVacant!6271) lt!273745) (= (index!27344 lt!273745) vacantSpotIndex!68) (= (select (arr!17834 a!2986) (index!27344 lt!273745)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86963 (= lt!273745 e!343929)))

(declare-fun c!67970 () Bool)

(assert (=> d!86963 (= c!67970 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86963 (= lt!273744 (select (arr!17834 a!2986) index!984))))

(assert (=> d!86963 (validMask!0 mask!3053)))

(assert (=> d!86963 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17834 a!2986) j!136) a!2986 mask!3053) lt!273745)))

(declare-fun b!601485 () Bool)

(assert (=> b!601485 (= e!343928 (MissingVacant!6271 vacantSpotIndex!68))))

(declare-fun b!601486 () Bool)

(assert (=> b!601486 (= e!343928 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17834 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601487 () Bool)

(assert (=> b!601487 (= e!343929 Undefined!6271)))

(assert (= (and d!86963 c!67970) b!601487))

(assert (= (and d!86963 (not c!67970)) b!601484))

(assert (= (and b!601484 c!67971) b!601483))

(assert (= (and b!601484 (not c!67971)) b!601482))

(assert (= (and b!601482 c!67972) b!601485))

(assert (= (and b!601482 (not c!67972)) b!601486))

(declare-fun m!578167 () Bool)

(assert (=> d!86963 m!578167))

(declare-fun m!578169 () Bool)

(assert (=> d!86963 m!578169))

(assert (=> d!86963 m!577951))

(assert (=> d!86963 m!577909))

(assert (=> b!601486 m!577921))

(assert (=> b!601486 m!577921))

(assert (=> b!601486 m!577903))

(declare-fun m!578171 () Bool)

(assert (=> b!601486 m!578171))

(assert (=> b!601232 d!86963))

(declare-fun b!601488 () Bool)

(declare-fun c!67975 () Bool)

(declare-fun lt!273748 () (_ BitVec 64))

(assert (=> b!601488 (= c!67975 (= lt!273748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!343930 () SeekEntryResult!6271)

(declare-fun e!343931 () SeekEntryResult!6271)

(assert (=> b!601488 (= e!343930 e!343931)))

(declare-fun b!601489 () Bool)

(assert (=> b!601489 (= e!343930 (Found!6271 index!984))))

(declare-fun b!601490 () Bool)

(declare-fun e!343932 () SeekEntryResult!6271)

(assert (=> b!601490 (= e!343932 e!343930)))

(declare-fun c!67974 () Bool)

(assert (=> b!601490 (= c!67974 (= lt!273748 lt!273610))))

(declare-fun lt!273749 () SeekEntryResult!6271)

(declare-fun d!86971 () Bool)

(assert (=> d!86971 (and (or ((_ is Undefined!6271) lt!273749) (not ((_ is Found!6271) lt!273749)) (and (bvsge (index!27342 lt!273749) #b00000000000000000000000000000000) (bvslt (index!27342 lt!273749) (size!18199 lt!273603)))) (or ((_ is Undefined!6271) lt!273749) ((_ is Found!6271) lt!273749) (not ((_ is MissingVacant!6271) lt!273749)) (not (= (index!27344 lt!273749) vacantSpotIndex!68)) (and (bvsge (index!27344 lt!273749) #b00000000000000000000000000000000) (bvslt (index!27344 lt!273749) (size!18199 lt!273603)))) (or ((_ is Undefined!6271) lt!273749) (ite ((_ is Found!6271) lt!273749) (= (select (arr!17834 lt!273603) (index!27342 lt!273749)) lt!273610) (and ((_ is MissingVacant!6271) lt!273749) (= (index!27344 lt!273749) vacantSpotIndex!68) (= (select (arr!17834 lt!273603) (index!27344 lt!273749)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86971 (= lt!273749 e!343932)))

(declare-fun c!67973 () Bool)

(assert (=> d!86971 (= c!67973 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86971 (= lt!273748 (select (arr!17834 lt!273603) index!984))))

(assert (=> d!86971 (validMask!0 mask!3053)))

(assert (=> d!86971 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273610 lt!273603 mask!3053) lt!273749)))

(declare-fun b!601491 () Bool)

(assert (=> b!601491 (= e!343931 (MissingVacant!6271 vacantSpotIndex!68))))

(declare-fun b!601492 () Bool)

(assert (=> b!601492 (= e!343931 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!273610 lt!273603 mask!3053))))

(declare-fun b!601493 () Bool)

(assert (=> b!601493 (= e!343932 Undefined!6271)))

(assert (= (and d!86971 c!67973) b!601493))

(assert (= (and d!86971 (not c!67973)) b!601490))

(assert (= (and b!601490 c!67974) b!601489))

(assert (= (and b!601490 (not c!67974)) b!601488))

(assert (= (and b!601488 c!67975) b!601491))

(assert (= (and b!601488 (not c!67975)) b!601492))

(declare-fun m!578175 () Bool)

(assert (=> d!86971 m!578175))

(declare-fun m!578177 () Bool)

(assert (=> d!86971 m!578177))

(assert (=> d!86971 m!578089))

(assert (=> d!86971 m!577909))

(assert (=> b!601492 m!577921))

(assert (=> b!601492 m!577921))

(declare-fun m!578179 () Bool)

(assert (=> b!601492 m!578179))

(assert (=> b!601223 d!86971))

(declare-fun b!601500 () Bool)

(declare-fun c!67981 () Bool)

(declare-fun lt!273753 () (_ BitVec 64))

(assert (=> b!601500 (= c!67981 (= lt!273753 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!343936 () SeekEntryResult!6271)

(declare-fun e!343937 () SeekEntryResult!6271)

(assert (=> b!601500 (= e!343936 e!343937)))

(declare-fun b!601501 () Bool)

(assert (=> b!601501 (= e!343936 (Found!6271 lt!273599))))

(declare-fun b!601502 () Bool)

(declare-fun e!343938 () SeekEntryResult!6271)

(assert (=> b!601502 (= e!343938 e!343936)))

(declare-fun c!67980 () Bool)

(assert (=> b!601502 (= c!67980 (= lt!273753 lt!273610))))

(declare-fun d!86975 () Bool)

(declare-fun lt!273754 () SeekEntryResult!6271)

(assert (=> d!86975 (and (or ((_ is Undefined!6271) lt!273754) (not ((_ is Found!6271) lt!273754)) (and (bvsge (index!27342 lt!273754) #b00000000000000000000000000000000) (bvslt (index!27342 lt!273754) (size!18199 lt!273603)))) (or ((_ is Undefined!6271) lt!273754) ((_ is Found!6271) lt!273754) (not ((_ is MissingVacant!6271) lt!273754)) (not (= (index!27344 lt!273754) vacantSpotIndex!68)) (and (bvsge (index!27344 lt!273754) #b00000000000000000000000000000000) (bvslt (index!27344 lt!273754) (size!18199 lt!273603)))) (or ((_ is Undefined!6271) lt!273754) (ite ((_ is Found!6271) lt!273754) (= (select (arr!17834 lt!273603) (index!27342 lt!273754)) lt!273610) (and ((_ is MissingVacant!6271) lt!273754) (= (index!27344 lt!273754) vacantSpotIndex!68) (= (select (arr!17834 lt!273603) (index!27344 lt!273754)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86975 (= lt!273754 e!343938)))

(declare-fun c!67979 () Bool)

(assert (=> d!86975 (= c!67979 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86975 (= lt!273753 (select (arr!17834 lt!273603) lt!273599))))

(assert (=> d!86975 (validMask!0 mask!3053)))

(assert (=> d!86975 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273599 vacantSpotIndex!68 lt!273610 lt!273603 mask!3053) lt!273754)))

(declare-fun b!601503 () Bool)

(assert (=> b!601503 (= e!343937 (MissingVacant!6271 vacantSpotIndex!68))))

(declare-fun b!601504 () Bool)

(assert (=> b!601504 (= e!343937 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!273599 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!273610 lt!273603 mask!3053))))

(declare-fun b!601505 () Bool)

(assert (=> b!601505 (= e!343938 Undefined!6271)))

(assert (= (and d!86975 c!67979) b!601505))

(assert (= (and d!86975 (not c!67979)) b!601502))

(assert (= (and b!601502 c!67980) b!601501))

(assert (= (and b!601502 (not c!67980)) b!601500))

(assert (= (and b!601500 c!67981) b!601503))

(assert (= (and b!601500 (not c!67981)) b!601504))

(declare-fun m!578189 () Bool)

(assert (=> d!86975 m!578189))

(declare-fun m!578191 () Bool)

(assert (=> d!86975 m!578191))

(declare-fun m!578193 () Bool)

(assert (=> d!86975 m!578193))

(assert (=> d!86975 m!577909))

(declare-fun m!578195 () Bool)

(assert (=> b!601504 m!578195))

(assert (=> b!601504 m!578195))

(declare-fun m!578197 () Bool)

(assert (=> b!601504 m!578197))

(assert (=> b!601223 d!86975))

(declare-fun d!86979 () Bool)

(declare-fun e!343948 () Bool)

(assert (=> d!86979 e!343948))

(declare-fun res!386281 () Bool)

(assert (=> d!86979 (=> (not res!386281) (not e!343948))))

(assert (=> d!86979 (= res!386281 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18199 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18199 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18199 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18199 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18199 a!2986))))))

(declare-fun lt!273759 () Unit!19008)

(declare-fun choose!9 (array!37149 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19008)

(assert (=> d!86979 (= lt!273759 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273599 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86979 (validMask!0 mask!3053)))

(assert (=> d!86979 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273599 vacantSpotIndex!68 mask!3053) lt!273759)))

(declare-fun b!601519 () Bool)

(assert (=> b!601519 (= e!343948 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273599 vacantSpotIndex!68 (select (arr!17834 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273599 vacantSpotIndex!68 (select (store (arr!17834 a!2986) i!1108 k0!1786) j!136) (array!37150 (store (arr!17834 a!2986) i!1108 k0!1786) (size!18199 a!2986)) mask!3053)))))

(assert (= (and d!86979 res!386281) b!601519))

(declare-fun m!578215 () Bool)

(assert (=> d!86979 m!578215))

(assert (=> d!86979 m!577909))

(assert (=> b!601519 m!577913))

(assert (=> b!601519 m!577925))

(declare-fun m!578217 () Bool)

(assert (=> b!601519 m!578217))

(assert (=> b!601519 m!577903))

(assert (=> b!601519 m!577927))

(assert (=> b!601519 m!577903))

(assert (=> b!601519 m!577925))

(assert (=> b!601223 d!86979))

(declare-fun b!601520 () Bool)

(declare-fun c!67988 () Bool)

(declare-fun lt!273760 () (_ BitVec 64))

(assert (=> b!601520 (= c!67988 (= lt!273760 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!343949 () SeekEntryResult!6271)

(declare-fun e!343950 () SeekEntryResult!6271)

(assert (=> b!601520 (= e!343949 e!343950)))

(declare-fun b!601521 () Bool)

(assert (=> b!601521 (= e!343949 (Found!6271 lt!273599))))

(declare-fun b!601522 () Bool)

(declare-fun e!343951 () SeekEntryResult!6271)

(assert (=> b!601522 (= e!343951 e!343949)))

(declare-fun c!67987 () Bool)

(assert (=> b!601522 (= c!67987 (= lt!273760 (select (arr!17834 a!2986) j!136)))))

(declare-fun lt!273761 () SeekEntryResult!6271)

(declare-fun d!86989 () Bool)

(assert (=> d!86989 (and (or ((_ is Undefined!6271) lt!273761) (not ((_ is Found!6271) lt!273761)) (and (bvsge (index!27342 lt!273761) #b00000000000000000000000000000000) (bvslt (index!27342 lt!273761) (size!18199 a!2986)))) (or ((_ is Undefined!6271) lt!273761) ((_ is Found!6271) lt!273761) (not ((_ is MissingVacant!6271) lt!273761)) (not (= (index!27344 lt!273761) vacantSpotIndex!68)) (and (bvsge (index!27344 lt!273761) #b00000000000000000000000000000000) (bvslt (index!27344 lt!273761) (size!18199 a!2986)))) (or ((_ is Undefined!6271) lt!273761) (ite ((_ is Found!6271) lt!273761) (= (select (arr!17834 a!2986) (index!27342 lt!273761)) (select (arr!17834 a!2986) j!136)) (and ((_ is MissingVacant!6271) lt!273761) (= (index!27344 lt!273761) vacantSpotIndex!68) (= (select (arr!17834 a!2986) (index!27344 lt!273761)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86989 (= lt!273761 e!343951)))

(declare-fun c!67986 () Bool)

(assert (=> d!86989 (= c!67986 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86989 (= lt!273760 (select (arr!17834 a!2986) lt!273599))))

(assert (=> d!86989 (validMask!0 mask!3053)))

(assert (=> d!86989 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273599 vacantSpotIndex!68 (select (arr!17834 a!2986) j!136) a!2986 mask!3053) lt!273761)))

(declare-fun b!601523 () Bool)

(assert (=> b!601523 (= e!343950 (MissingVacant!6271 vacantSpotIndex!68))))

(declare-fun b!601524 () Bool)

(assert (=> b!601524 (= e!343950 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!273599 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17834 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601525 () Bool)

(assert (=> b!601525 (= e!343951 Undefined!6271)))

(assert (= (and d!86989 c!67986) b!601525))

(assert (= (and d!86989 (not c!67986)) b!601522))

(assert (= (and b!601522 c!67987) b!601521))

(assert (= (and b!601522 (not c!67987)) b!601520))

(assert (= (and b!601520 c!67988) b!601523))

(assert (= (and b!601520 (not c!67988)) b!601524))

(declare-fun m!578219 () Bool)

(assert (=> d!86989 m!578219))

(declare-fun m!578221 () Bool)

(assert (=> d!86989 m!578221))

(declare-fun m!578223 () Bool)

(assert (=> d!86989 m!578223))

(assert (=> d!86989 m!577909))

(assert (=> b!601524 m!578195))

(assert (=> b!601524 m!578195))

(assert (=> b!601524 m!577903))

(declare-fun m!578225 () Bool)

(assert (=> b!601524 m!578225))

(assert (=> b!601223 d!86989))

(declare-fun d!86991 () Bool)

(declare-fun lt!273766 () (_ BitVec 32))

(assert (=> d!86991 (and (bvsge lt!273766 #b00000000000000000000000000000000) (bvslt lt!273766 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86991 (= lt!273766 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86991 (validMask!0 mask!3053)))

(assert (=> d!86991 (= (nextIndex!0 index!984 x!910 mask!3053) lt!273766)))

(declare-fun bs!18413 () Bool)

(assert (= bs!18413 d!86991))

(declare-fun m!578227 () Bool)

(assert (=> bs!18413 m!578227))

(assert (=> bs!18413 m!577909))

(assert (=> b!601223 d!86991))

(check-sat (not d!86939) (not bm!32946) (not d!86971) (not b!601519) (not b!601428) (not b!601524) (not b!601392) (not d!86991) (not b!601486) (not b!601407) (not b!601388) (not b!601384) (not b!601504) (not b!601390) (not bm!32943) (not d!86963) (not b!601412) (not bm!32942) (not b!601409) (not b!601395) (not bm!32941) (not d!86979) (not b!601492) (not b!601383) (not b!601385) (not b!601391) (not b!601378) (not d!86941) (not d!86975) (not d!86951) (not b!601398) (not b!601366) (not d!86989) (not b!601381) (not d!86929) (not b!601377) (not d!86933))
(check-sat)
