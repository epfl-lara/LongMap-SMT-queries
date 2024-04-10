; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58122 () Bool)

(assert start!58122)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!367754 () Bool)

(declare-fun b!642173 () Bool)

(declare-datatypes ((array!38381 0))(
  ( (array!38382 (arr!18407 (Array (_ BitVec 32) (_ BitVec 64))) (size!18771 (_ BitVec 32))) )
))
(declare-fun lt!297339 () array!38381)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38381)

(declare-fun arrayContainsKey!0 (array!38381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642173 (= e!367754 (arrayContainsKey!0 lt!297339 (select (arr!18407 a!2986) j!136) index!984))))

(declare-fun b!642174 () Bool)

(declare-datatypes ((Unit!21722 0))(
  ( (Unit!21723) )
))
(declare-fun e!367764 () Unit!21722)

(declare-fun Unit!21724 () Unit!21722)

(assert (=> b!642174 (= e!367764 Unit!21724)))

(declare-fun b!642175 () Bool)

(declare-fun res!415929 () Bool)

(declare-fun e!367762 () Bool)

(assert (=> b!642175 (=> (not res!415929) (not e!367762))))

(declare-datatypes ((List!12448 0))(
  ( (Nil!12445) (Cons!12444 (h!13489 (_ BitVec 64)) (t!18676 List!12448)) )
))
(declare-fun arrayNoDuplicates!0 (array!38381 (_ BitVec 32) List!12448) Bool)

(assert (=> b!642175 (= res!415929 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12445))))

(declare-fun b!642176 () Bool)

(declare-fun e!367752 () Bool)

(assert (=> b!642176 (= e!367752 e!367754)))

(declare-fun res!415934 () Bool)

(assert (=> b!642176 (=> (not res!415934) (not e!367754))))

(assert (=> b!642176 (= res!415934 (arrayContainsKey!0 lt!297339 (select (arr!18407 a!2986) j!136) j!136))))

(declare-fun b!642177 () Bool)

(declare-fun e!367759 () Bool)

(assert (=> b!642177 (= e!367759 true)))

(declare-fun lt!297345 () Bool)

(declare-fun contains!3135 (List!12448 (_ BitVec 64)) Bool)

(assert (=> b!642177 (= lt!297345 (contains!3135 Nil!12445 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642178 () Bool)

(declare-fun res!415933 () Bool)

(assert (=> b!642178 (=> (not res!415933) (not e!367762))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!642178 (= res!415933 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18407 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642180 () Bool)

(declare-fun e!367758 () Bool)

(declare-fun e!367760 () Bool)

(assert (=> b!642180 (= e!367758 e!367760)))

(declare-fun res!415924 () Bool)

(assert (=> b!642180 (=> res!415924 e!367760)))

(declare-fun lt!297340 () (_ BitVec 64))

(declare-fun lt!297347 () (_ BitVec 64))

(assert (=> b!642180 (= res!415924 (or (not (= (select (arr!18407 a!2986) j!136) lt!297340)) (not (= (select (arr!18407 a!2986) j!136) lt!297347)) (bvsge j!136 index!984)))))

(declare-fun e!367761 () Bool)

(assert (=> b!642180 e!367761))

(declare-fun res!415923 () Bool)

(assert (=> b!642180 (=> (not res!415923) (not e!367761))))

(assert (=> b!642180 (= res!415923 (= lt!297347 (select (arr!18407 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!642180 (= lt!297347 (select (store (arr!18407 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!642181 () Bool)

(declare-fun e!367763 () Bool)

(assert (=> b!642181 (= e!367763 (not e!367758))))

(declare-fun res!415920 () Bool)

(assert (=> b!642181 (=> res!415920 e!367758)))

(declare-datatypes ((SeekEntryResult!6847 0))(
  ( (MissingZero!6847 (index!29714 (_ BitVec 32))) (Found!6847 (index!29715 (_ BitVec 32))) (Intermediate!6847 (undefined!7659 Bool) (index!29716 (_ BitVec 32)) (x!58477 (_ BitVec 32))) (Undefined!6847) (MissingVacant!6847 (index!29717 (_ BitVec 32))) )
))
(declare-fun lt!297343 () SeekEntryResult!6847)

(assert (=> b!642181 (= res!415920 (not (= lt!297343 (Found!6847 index!984))))))

(declare-fun lt!297352 () Unit!21722)

(assert (=> b!642181 (= lt!297352 e!367764)))

(declare-fun c!73496 () Bool)

(assert (=> b!642181 (= c!73496 (= lt!297343 Undefined!6847))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38381 (_ BitVec 32)) SeekEntryResult!6847)

(assert (=> b!642181 (= lt!297343 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297340 lt!297339 mask!3053))))

(declare-fun e!367756 () Bool)

(assert (=> b!642181 e!367756))

(declare-fun res!415930 () Bool)

(assert (=> b!642181 (=> (not res!415930) (not e!367756))))

(declare-fun lt!297349 () (_ BitVec 32))

(declare-fun lt!297342 () SeekEntryResult!6847)

(assert (=> b!642181 (= res!415930 (= lt!297342 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297349 vacantSpotIndex!68 lt!297340 lt!297339 mask!3053)))))

(assert (=> b!642181 (= lt!297342 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297349 vacantSpotIndex!68 (select (arr!18407 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642181 (= lt!297340 (select (store (arr!18407 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!297344 () Unit!21722)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38381 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21722)

(assert (=> b!642181 (= lt!297344 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297349 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642181 (= lt!297349 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642182 () Bool)

(declare-fun e!367757 () Bool)

(assert (=> b!642182 (= e!367757 e!367762)))

(declare-fun res!415917 () Bool)

(assert (=> b!642182 (=> (not res!415917) (not e!367762))))

(declare-fun lt!297348 () SeekEntryResult!6847)

(assert (=> b!642182 (= res!415917 (or (= lt!297348 (MissingZero!6847 i!1108)) (= lt!297348 (MissingVacant!6847 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38381 (_ BitVec 32)) SeekEntryResult!6847)

(assert (=> b!642182 (= lt!297348 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!642183 () Bool)

(declare-fun Unit!21725 () Unit!21722)

(assert (=> b!642183 (= e!367764 Unit!21725)))

(assert (=> b!642183 false))

(declare-fun b!642184 () Bool)

(declare-fun res!415919 () Bool)

(assert (=> b!642184 (=> res!415919 e!367759)))

(declare-fun noDuplicate!407 (List!12448) Bool)

(assert (=> b!642184 (= res!415919 (not (noDuplicate!407 Nil!12445)))))

(declare-fun b!642185 () Bool)

(declare-fun res!415915 () Bool)

(assert (=> b!642185 (=> (not res!415915) (not e!367757))))

(assert (=> b!642185 (= res!415915 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642186 () Bool)

(declare-fun e!367755 () Bool)

(assert (=> b!642186 (= e!367755 e!367763)))

(declare-fun res!415926 () Bool)

(assert (=> b!642186 (=> (not res!415926) (not e!367763))))

(declare-fun lt!297341 () SeekEntryResult!6847)

(assert (=> b!642186 (= res!415926 (and (= lt!297341 (Found!6847 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18407 a!2986) index!984) (select (arr!18407 a!2986) j!136))) (not (= (select (arr!18407 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!642186 (= lt!297341 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18407 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642187 () Bool)

(declare-fun res!415922 () Bool)

(assert (=> b!642187 (=> (not res!415922) (not e!367757))))

(assert (=> b!642187 (= res!415922 (and (= (size!18771 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18771 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18771 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642188 () Bool)

(assert (=> b!642188 (= e!367756 (= lt!297341 lt!297342))))

(declare-fun b!642189 () Bool)

(assert (=> b!642189 (= e!367761 e!367752)))

(declare-fun res!415928 () Bool)

(assert (=> b!642189 (=> res!415928 e!367752)))

(assert (=> b!642189 (= res!415928 (or (not (= (select (arr!18407 a!2986) j!136) lt!297340)) (not (= (select (arr!18407 a!2986) j!136) lt!297347)) (bvsge j!136 index!984)))))

(declare-fun b!642190 () Bool)

(declare-fun res!415932 () Bool)

(assert (=> b!642190 (=> (not res!415932) (not e!367757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642190 (= res!415932 (validKeyInArray!0 k!1786))))

(declare-fun b!642191 () Bool)

(assert (=> b!642191 (= e!367762 e!367755)))

(declare-fun res!415921 () Bool)

(assert (=> b!642191 (=> (not res!415921) (not e!367755))))

(assert (=> b!642191 (= res!415921 (= (select (store (arr!18407 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642191 (= lt!297339 (array!38382 (store (arr!18407 a!2986) i!1108 k!1786) (size!18771 a!2986)))))

(declare-fun b!642192 () Bool)

(declare-fun res!415925 () Bool)

(assert (=> b!642192 (=> res!415925 e!367759)))

(assert (=> b!642192 (= res!415925 (contains!3135 Nil!12445 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!415927 () Bool)

(assert (=> start!58122 (=> (not res!415927) (not e!367757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58122 (= res!415927 (validMask!0 mask!3053))))

(assert (=> start!58122 e!367757))

(assert (=> start!58122 true))

(declare-fun array_inv!14203 (array!38381) Bool)

(assert (=> start!58122 (array_inv!14203 a!2986)))

(declare-fun b!642179 () Bool)

(declare-fun res!415916 () Bool)

(assert (=> b!642179 (=> (not res!415916) (not e!367757))))

(assert (=> b!642179 (= res!415916 (validKeyInArray!0 (select (arr!18407 a!2986) j!136)))))

(declare-fun b!642193 () Bool)

(assert (=> b!642193 (= e!367760 e!367759)))

(declare-fun res!415918 () Bool)

(assert (=> b!642193 (=> res!415918 e!367759)))

(assert (=> b!642193 (= res!415918 (or (bvsge (size!18771 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18771 a!2986))))))

(assert (=> b!642193 (arrayNoDuplicates!0 lt!297339 j!136 Nil!12445)))

(declare-fun lt!297346 () Unit!21722)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38381 (_ BitVec 32) (_ BitVec 32)) Unit!21722)

(assert (=> b!642193 (= lt!297346 (lemmaNoDuplicateFromThenFromBigger!0 lt!297339 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642193 (arrayNoDuplicates!0 lt!297339 #b00000000000000000000000000000000 Nil!12445)))

(declare-fun lt!297351 () Unit!21722)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38381 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12448) Unit!21722)

(assert (=> b!642193 (= lt!297351 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12445))))

(assert (=> b!642193 (arrayContainsKey!0 lt!297339 (select (arr!18407 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297350 () Unit!21722)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38381 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21722)

(assert (=> b!642193 (= lt!297350 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297339 (select (arr!18407 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!642194 () Bool)

(declare-fun res!415931 () Bool)

(assert (=> b!642194 (=> (not res!415931) (not e!367762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38381 (_ BitVec 32)) Bool)

(assert (=> b!642194 (= res!415931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58122 res!415927) b!642187))

(assert (= (and b!642187 res!415922) b!642179))

(assert (= (and b!642179 res!415916) b!642190))

(assert (= (and b!642190 res!415932) b!642185))

(assert (= (and b!642185 res!415915) b!642182))

(assert (= (and b!642182 res!415917) b!642194))

(assert (= (and b!642194 res!415931) b!642175))

(assert (= (and b!642175 res!415929) b!642178))

(assert (= (and b!642178 res!415933) b!642191))

(assert (= (and b!642191 res!415921) b!642186))

(assert (= (and b!642186 res!415926) b!642181))

(assert (= (and b!642181 res!415930) b!642188))

(assert (= (and b!642181 c!73496) b!642183))

(assert (= (and b!642181 (not c!73496)) b!642174))

(assert (= (and b!642181 (not res!415920)) b!642180))

(assert (= (and b!642180 res!415923) b!642189))

(assert (= (and b!642189 (not res!415928)) b!642176))

(assert (= (and b!642176 res!415934) b!642173))

(assert (= (and b!642180 (not res!415924)) b!642193))

(assert (= (and b!642193 (not res!415918)) b!642184))

(assert (= (and b!642184 (not res!415919)) b!642192))

(assert (= (and b!642192 (not res!415925)) b!642177))

(declare-fun m!615949 () Bool)

(assert (=> b!642178 m!615949))

(declare-fun m!615951 () Bool)

(assert (=> b!642173 m!615951))

(assert (=> b!642173 m!615951))

(declare-fun m!615953 () Bool)

(assert (=> b!642173 m!615953))

(declare-fun m!615955 () Bool)

(assert (=> b!642194 m!615955))

(declare-fun m!615957 () Bool)

(assert (=> b!642185 m!615957))

(declare-fun m!615959 () Bool)

(assert (=> b!642191 m!615959))

(declare-fun m!615961 () Bool)

(assert (=> b!642191 m!615961))

(declare-fun m!615963 () Bool)

(assert (=> start!58122 m!615963))

(declare-fun m!615965 () Bool)

(assert (=> start!58122 m!615965))

(declare-fun m!615967 () Bool)

(assert (=> b!642192 m!615967))

(assert (=> b!642180 m!615951))

(assert (=> b!642180 m!615959))

(declare-fun m!615969 () Bool)

(assert (=> b!642180 m!615969))

(declare-fun m!615971 () Bool)

(assert (=> b!642190 m!615971))

(declare-fun m!615973 () Bool)

(assert (=> b!642175 m!615973))

(declare-fun m!615975 () Bool)

(assert (=> b!642186 m!615975))

(assert (=> b!642186 m!615951))

(assert (=> b!642186 m!615951))

(declare-fun m!615977 () Bool)

(assert (=> b!642186 m!615977))

(declare-fun m!615979 () Bool)

(assert (=> b!642177 m!615979))

(declare-fun m!615981 () Bool)

(assert (=> b!642184 m!615981))

(assert (=> b!642189 m!615951))

(declare-fun m!615983 () Bool)

(assert (=> b!642182 m!615983))

(assert (=> b!642179 m!615951))

(assert (=> b!642179 m!615951))

(declare-fun m!615985 () Bool)

(assert (=> b!642179 m!615985))

(declare-fun m!615987 () Bool)

(assert (=> b!642181 m!615987))

(declare-fun m!615989 () Bool)

(assert (=> b!642181 m!615989))

(assert (=> b!642181 m!615951))

(declare-fun m!615991 () Bool)

(assert (=> b!642181 m!615991))

(assert (=> b!642181 m!615959))

(declare-fun m!615993 () Bool)

(assert (=> b!642181 m!615993))

(assert (=> b!642181 m!615951))

(declare-fun m!615995 () Bool)

(assert (=> b!642181 m!615995))

(declare-fun m!615997 () Bool)

(assert (=> b!642181 m!615997))

(assert (=> b!642176 m!615951))

(assert (=> b!642176 m!615951))

(declare-fun m!615999 () Bool)

(assert (=> b!642176 m!615999))

(declare-fun m!616001 () Bool)

(assert (=> b!642193 m!616001))

(assert (=> b!642193 m!615951))

(declare-fun m!616003 () Bool)

(assert (=> b!642193 m!616003))

(assert (=> b!642193 m!615951))

(declare-fun m!616005 () Bool)

(assert (=> b!642193 m!616005))

(declare-fun m!616007 () Bool)

(assert (=> b!642193 m!616007))

(declare-fun m!616009 () Bool)

(assert (=> b!642193 m!616009))

(assert (=> b!642193 m!615951))

(declare-fun m!616011 () Bool)

(assert (=> b!642193 m!616011))

(push 1)

