; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54834 () Bool)

(assert start!54834)

(declare-fun b!598865 () Bool)

(declare-datatypes ((Unit!18854 0))(
  ( (Unit!18855) )
))
(declare-fun e!342351 () Unit!18854)

(declare-fun Unit!18856 () Unit!18854)

(assert (=> b!598865 (= e!342351 Unit!18856)))

(assert (=> b!598865 false))

(declare-fun b!598866 () Bool)

(declare-fun e!342356 () Bool)

(declare-fun e!342350 () Bool)

(assert (=> b!598866 (= e!342356 (not e!342350))))

(declare-fun res!383902 () Bool)

(assert (=> b!598866 (=> res!383902 e!342350)))

(declare-datatypes ((SeekEntryResult!6234 0))(
  ( (MissingZero!6234 (index!27193 (_ BitVec 32))) (Found!6234 (index!27194 (_ BitVec 32))) (Intermediate!6234 (undefined!7046 Bool) (index!27195 (_ BitVec 32)) (x!56001 (_ BitVec 32))) (Undefined!6234) (MissingVacant!6234 (index!27196 (_ BitVec 32))) )
))
(declare-fun lt!272132 () SeekEntryResult!6234)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!598866 (= res!383902 (not (= lt!272132 (Found!6234 index!984))))))

(declare-fun lt!272138 () Unit!18854)

(assert (=> b!598866 (= lt!272138 e!342351)))

(declare-fun c!67850 () Bool)

(assert (=> b!598866 (= c!67850 (= lt!272132 Undefined!6234))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37069 0))(
  ( (array!37070 (arr!17794 (Array (_ BitVec 32) (_ BitVec 64))) (size!18158 (_ BitVec 32))) )
))
(declare-fun lt!272134 () array!37069)

(declare-fun lt!272136 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37069 (_ BitVec 32)) SeekEntryResult!6234)

(assert (=> b!598866 (= lt!272132 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272136 lt!272134 mask!3053))))

(declare-fun e!342357 () Bool)

(assert (=> b!598866 e!342357))

(declare-fun res!383906 () Bool)

(assert (=> b!598866 (=> (not res!383906) (not e!342357))))

(declare-fun lt!272140 () (_ BitVec 32))

(declare-fun lt!272133 () SeekEntryResult!6234)

(assert (=> b!598866 (= res!383906 (= lt!272133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272140 vacantSpotIndex!68 lt!272136 lt!272134 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37069)

(assert (=> b!598866 (= lt!272133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272140 vacantSpotIndex!68 (select (arr!17794 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!598866 (= lt!272136 (select (store (arr!17794 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272139 () Unit!18854)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37069 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18854)

(assert (=> b!598866 (= lt!272139 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272140 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598866 (= lt!272140 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598867 () Bool)

(declare-fun e!342349 () Bool)

(declare-fun e!342346 () Bool)

(assert (=> b!598867 (= e!342349 e!342346)))

(declare-fun res!383901 () Bool)

(assert (=> b!598867 (=> (not res!383901) (not e!342346))))

(declare-fun arrayContainsKey!0 (array!37069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598867 (= res!383901 (arrayContainsKey!0 lt!272134 (select (arr!17794 a!2986) j!136) j!136))))

(declare-fun b!598868 () Bool)

(declare-fun Unit!18857 () Unit!18854)

(assert (=> b!598868 (= e!342351 Unit!18857)))

(declare-fun b!598869 () Bool)

(declare-fun e!342353 () Bool)

(assert (=> b!598869 (= e!342353 e!342349)))

(declare-fun res!383914 () Bool)

(assert (=> b!598869 (=> res!383914 e!342349)))

(declare-fun lt!272137 () (_ BitVec 64))

(assert (=> b!598869 (= res!383914 (or (not (= (select (arr!17794 a!2986) j!136) lt!272136)) (not (= (select (arr!17794 a!2986) j!136) lt!272137)) (bvsge j!136 index!984)))))

(declare-fun res!383910 () Bool)

(declare-fun e!342352 () Bool)

(assert (=> start!54834 (=> (not res!383910) (not e!342352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54834 (= res!383910 (validMask!0 mask!3053))))

(assert (=> start!54834 e!342352))

(assert (=> start!54834 true))

(declare-fun array_inv!13590 (array!37069) Bool)

(assert (=> start!54834 (array_inv!13590 a!2986)))

(declare-fun b!598870 () Bool)

(declare-fun lt!272143 () SeekEntryResult!6234)

(assert (=> b!598870 (= e!342357 (= lt!272143 lt!272133))))

(declare-fun b!598871 () Bool)

(declare-fun res!383905 () Bool)

(declare-fun e!342355 () Bool)

(assert (=> b!598871 (=> (not res!383905) (not e!342355))))

(assert (=> b!598871 (= res!383905 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17794 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598872 () Bool)

(declare-fun res!383911 () Bool)

(assert (=> b!598872 (=> (not res!383911) (not e!342352))))

(assert (=> b!598872 (= res!383911 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598873 () Bool)

(declare-fun res!383900 () Bool)

(assert (=> b!598873 (=> (not res!383900) (not e!342352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598873 (= res!383900 (validKeyInArray!0 k0!1786))))

(declare-fun b!598874 () Bool)

(declare-fun res!383909 () Bool)

(assert (=> b!598874 (=> (not res!383909) (not e!342352))))

(assert (=> b!598874 (= res!383909 (and (= (size!18158 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18158 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18158 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598875 () Bool)

(assert (=> b!598875 (= e!342352 e!342355)))

(declare-fun res!383907 () Bool)

(assert (=> b!598875 (=> (not res!383907) (not e!342355))))

(declare-fun lt!272141 () SeekEntryResult!6234)

(assert (=> b!598875 (= res!383907 (or (= lt!272141 (MissingZero!6234 i!1108)) (= lt!272141 (MissingVacant!6234 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37069 (_ BitVec 32)) SeekEntryResult!6234)

(assert (=> b!598875 (= lt!272141 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!598876 () Bool)

(declare-fun e!342348 () Bool)

(assert (=> b!598876 (= e!342355 e!342348)))

(declare-fun res!383904 () Bool)

(assert (=> b!598876 (=> (not res!383904) (not e!342348))))

(assert (=> b!598876 (= res!383904 (= (select (store (arr!17794 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598876 (= lt!272134 (array!37070 (store (arr!17794 a!2986) i!1108 k0!1786) (size!18158 a!2986)))))

(declare-fun b!598877 () Bool)

(declare-fun e!342347 () Bool)

(assert (=> b!598877 (= e!342350 e!342347)))

(declare-fun res!383908 () Bool)

(assert (=> b!598877 (=> res!383908 e!342347)))

(assert (=> b!598877 (= res!383908 (or (not (= (select (arr!17794 a!2986) j!136) lt!272136)) (not (= (select (arr!17794 a!2986) j!136) lt!272137)) (bvsge j!136 index!984)))))

(assert (=> b!598877 e!342353))

(declare-fun res!383899 () Bool)

(assert (=> b!598877 (=> (not res!383899) (not e!342353))))

(assert (=> b!598877 (= res!383899 (= lt!272137 (select (arr!17794 a!2986) j!136)))))

(assert (=> b!598877 (= lt!272137 (select (store (arr!17794 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598878 () Bool)

(declare-fun res!383912 () Bool)

(assert (=> b!598878 (=> (not res!383912) (not e!342355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37069 (_ BitVec 32)) Bool)

(assert (=> b!598878 (= res!383912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598879 () Bool)

(assert (=> b!598879 (= e!342348 e!342356)))

(declare-fun res!383915 () Bool)

(assert (=> b!598879 (=> (not res!383915) (not e!342356))))

(assert (=> b!598879 (= res!383915 (and (= lt!272143 (Found!6234 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17794 a!2986) index!984) (select (arr!17794 a!2986) j!136))) (not (= (select (arr!17794 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!598879 (= lt!272143 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17794 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598880 () Bool)

(declare-fun res!383913 () Bool)

(assert (=> b!598880 (=> (not res!383913) (not e!342355))))

(declare-datatypes ((List!11835 0))(
  ( (Nil!11832) (Cons!11831 (h!12876 (_ BitVec 64)) (t!18063 List!11835)) )
))
(declare-fun arrayNoDuplicates!0 (array!37069 (_ BitVec 32) List!11835) Bool)

(assert (=> b!598880 (= res!383913 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11832))))

(declare-fun b!598881 () Bool)

(assert (=> b!598881 (= e!342347 true)))

(assert (=> b!598881 (arrayNoDuplicates!0 lt!272134 #b00000000000000000000000000000000 Nil!11832)))

(declare-fun lt!272135 () Unit!18854)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37069 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11835) Unit!18854)

(assert (=> b!598881 (= lt!272135 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11832))))

(assert (=> b!598881 (arrayContainsKey!0 lt!272134 (select (arr!17794 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272142 () Unit!18854)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37069 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18854)

(assert (=> b!598881 (= lt!272142 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272134 (select (arr!17794 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598882 () Bool)

(assert (=> b!598882 (= e!342346 (arrayContainsKey!0 lt!272134 (select (arr!17794 a!2986) j!136) index!984))))

(declare-fun b!598883 () Bool)

(declare-fun res!383903 () Bool)

(assert (=> b!598883 (=> (not res!383903) (not e!342352))))

(assert (=> b!598883 (= res!383903 (validKeyInArray!0 (select (arr!17794 a!2986) j!136)))))

(assert (= (and start!54834 res!383910) b!598874))

(assert (= (and b!598874 res!383909) b!598883))

(assert (= (and b!598883 res!383903) b!598873))

(assert (= (and b!598873 res!383900) b!598872))

(assert (= (and b!598872 res!383911) b!598875))

(assert (= (and b!598875 res!383907) b!598878))

(assert (= (and b!598878 res!383912) b!598880))

(assert (= (and b!598880 res!383913) b!598871))

(assert (= (and b!598871 res!383905) b!598876))

(assert (= (and b!598876 res!383904) b!598879))

(assert (= (and b!598879 res!383915) b!598866))

(assert (= (and b!598866 res!383906) b!598870))

(assert (= (and b!598866 c!67850) b!598865))

(assert (= (and b!598866 (not c!67850)) b!598868))

(assert (= (and b!598866 (not res!383902)) b!598877))

(assert (= (and b!598877 res!383899) b!598869))

(assert (= (and b!598869 (not res!383914)) b!598867))

(assert (= (and b!598867 res!383901) b!598882))

(assert (= (and b!598877 (not res!383908)) b!598881))

(declare-fun m!576149 () Bool)

(assert (=> b!598875 m!576149))

(declare-fun m!576151 () Bool)

(assert (=> b!598867 m!576151))

(assert (=> b!598867 m!576151))

(declare-fun m!576153 () Bool)

(assert (=> b!598867 m!576153))

(assert (=> b!598877 m!576151))

(declare-fun m!576155 () Bool)

(assert (=> b!598877 m!576155))

(declare-fun m!576157 () Bool)

(assert (=> b!598877 m!576157))

(declare-fun m!576159 () Bool)

(assert (=> b!598879 m!576159))

(assert (=> b!598879 m!576151))

(assert (=> b!598879 m!576151))

(declare-fun m!576161 () Bool)

(assert (=> b!598879 m!576161))

(assert (=> b!598881 m!576151))

(assert (=> b!598881 m!576151))

(declare-fun m!576163 () Bool)

(assert (=> b!598881 m!576163))

(assert (=> b!598881 m!576151))

(declare-fun m!576165 () Bool)

(assert (=> b!598881 m!576165))

(declare-fun m!576167 () Bool)

(assert (=> b!598881 m!576167))

(declare-fun m!576169 () Bool)

(assert (=> b!598881 m!576169))

(declare-fun m!576171 () Bool)

(assert (=> b!598878 m!576171))

(assert (=> b!598883 m!576151))

(assert (=> b!598883 m!576151))

(declare-fun m!576173 () Bool)

(assert (=> b!598883 m!576173))

(assert (=> b!598869 m!576151))

(assert (=> b!598876 m!576155))

(declare-fun m!576175 () Bool)

(assert (=> b!598876 m!576175))

(declare-fun m!576177 () Bool)

(assert (=> start!54834 m!576177))

(declare-fun m!576179 () Bool)

(assert (=> start!54834 m!576179))

(declare-fun m!576181 () Bool)

(assert (=> b!598871 m!576181))

(declare-fun m!576183 () Bool)

(assert (=> b!598872 m!576183))

(declare-fun m!576185 () Bool)

(assert (=> b!598873 m!576185))

(assert (=> b!598882 m!576151))

(assert (=> b!598882 m!576151))

(declare-fun m!576187 () Bool)

(assert (=> b!598882 m!576187))

(assert (=> b!598866 m!576151))

(declare-fun m!576189 () Bool)

(assert (=> b!598866 m!576189))

(declare-fun m!576191 () Bool)

(assert (=> b!598866 m!576191))

(declare-fun m!576193 () Bool)

(assert (=> b!598866 m!576193))

(assert (=> b!598866 m!576151))

(assert (=> b!598866 m!576155))

(declare-fun m!576195 () Bool)

(assert (=> b!598866 m!576195))

(declare-fun m!576197 () Bool)

(assert (=> b!598866 m!576197))

(declare-fun m!576199 () Bool)

(assert (=> b!598866 m!576199))

(declare-fun m!576201 () Bool)

(assert (=> b!598880 m!576201))

(check-sat (not b!598873) (not b!598872) (not b!598878) (not b!598881) (not b!598883) (not start!54834) (not b!598880) (not b!598882) (not b!598867) (not b!598879) (not b!598866) (not b!598875))
(check-sat)
