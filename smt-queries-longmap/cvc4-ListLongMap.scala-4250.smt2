; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58890 () Bool)

(assert start!58890)

(declare-fun res!421377 () Bool)

(declare-fun e!372843 () Bool)

(assert (=> start!58890 (=> (not res!421377) (not e!372843))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58890 (= res!421377 (validMask!0 mask!3053))))

(assert (=> start!58890 e!372843))

(assert (=> start!58890 true))

(declare-datatypes ((array!38552 0))(
  ( (array!38553 (arr!18482 (Array (_ BitVec 32) (_ BitVec 64))) (size!18846 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38552)

(declare-fun array_inv!14278 (array!38552) Bool)

(assert (=> start!58890 (array_inv!14278 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!372838 () Bool)

(declare-fun lt!301954 () array!38552)

(declare-fun b!649957 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649957 (= e!372838 (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) index!984))))

(declare-fun b!649958 () Bool)

(declare-fun e!372830 () Bool)

(declare-fun e!372840 () Bool)

(assert (=> b!649958 (= e!372830 e!372840)))

(declare-fun res!421380 () Bool)

(assert (=> b!649958 (=> res!421380 e!372840)))

(assert (=> b!649958 (= res!421380 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22158 0))(
  ( (Unit!22159) )
))
(declare-fun lt!301944 () Unit!22158)

(declare-fun e!372839 () Unit!22158)

(assert (=> b!649958 (= lt!301944 e!372839)))

(declare-fun c!74663 () Bool)

(assert (=> b!649958 (= c!74663 (bvslt j!136 index!984))))

(declare-fun b!649959 () Bool)

(declare-fun e!372842 () Bool)

(declare-fun e!372835 () Bool)

(assert (=> b!649959 (= e!372842 (not e!372835))))

(declare-fun res!421382 () Bool)

(assert (=> b!649959 (=> res!421382 e!372835)))

(declare-datatypes ((SeekEntryResult!6922 0))(
  ( (MissingZero!6922 (index!30035 (_ BitVec 32))) (Found!6922 (index!30036 (_ BitVec 32))) (Intermediate!6922 (undefined!7734 Bool) (index!30037 (_ BitVec 32)) (x!58815 (_ BitVec 32))) (Undefined!6922) (MissingVacant!6922 (index!30038 (_ BitVec 32))) )
))
(declare-fun lt!301943 () SeekEntryResult!6922)

(assert (=> b!649959 (= res!421382 (not (= lt!301943 (Found!6922 index!984))))))

(declare-fun lt!301946 () Unit!22158)

(declare-fun e!372833 () Unit!22158)

(assert (=> b!649959 (= lt!301946 e!372833)))

(declare-fun c!74662 () Bool)

(assert (=> b!649959 (= c!74662 (= lt!301943 Undefined!6922))))

(declare-fun lt!301950 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38552 (_ BitVec 32)) SeekEntryResult!6922)

(assert (=> b!649959 (= lt!301943 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301950 lt!301954 mask!3053))))

(declare-fun e!372841 () Bool)

(assert (=> b!649959 e!372841))

(declare-fun res!421372 () Bool)

(assert (=> b!649959 (=> (not res!421372) (not e!372841))))

(declare-fun lt!301941 () SeekEntryResult!6922)

(declare-fun lt!301952 () (_ BitVec 32))

(assert (=> b!649959 (= res!421372 (= lt!301941 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 lt!301950 lt!301954 mask!3053)))))

(assert (=> b!649959 (= lt!301941 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 (select (arr!18482 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!649959 (= lt!301950 (select (store (arr!18482 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301942 () Unit!22158)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38552 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22158)

(assert (=> b!649959 (= lt!301942 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649959 (= lt!301952 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649960 () Bool)

(declare-fun lt!301940 () SeekEntryResult!6922)

(assert (=> b!649960 (= e!372841 (= lt!301940 lt!301941))))

(declare-fun b!649961 () Bool)

(declare-fun e!372836 () Bool)

(assert (=> b!649961 (= e!372836 e!372838)))

(declare-fun res!421376 () Bool)

(assert (=> b!649961 (=> (not res!421376) (not e!372838))))

(assert (=> b!649961 (= res!421376 (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) j!136))))

(declare-fun b!649962 () Bool)

(assert (=> b!649962 (= e!372835 e!372830)))

(declare-fun res!421370 () Bool)

(assert (=> b!649962 (=> res!421370 e!372830)))

(declare-fun lt!301953 () (_ BitVec 64))

(assert (=> b!649962 (= res!421370 (or (not (= (select (arr!18482 a!2986) j!136) lt!301950)) (not (= (select (arr!18482 a!2986) j!136) lt!301953))))))

(declare-fun e!372829 () Bool)

(assert (=> b!649962 e!372829))

(declare-fun res!421383 () Bool)

(assert (=> b!649962 (=> (not res!421383) (not e!372829))))

(assert (=> b!649962 (= res!421383 (= lt!301953 (select (arr!18482 a!2986) j!136)))))

(assert (=> b!649962 (= lt!301953 (select (store (arr!18482 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!649963 () Bool)

(assert (=> b!649963 (= e!372829 e!372836)))

(declare-fun res!421379 () Bool)

(assert (=> b!649963 (=> res!421379 e!372836)))

(assert (=> b!649963 (= res!421379 (or (not (= (select (arr!18482 a!2986) j!136) lt!301950)) (not (= (select (arr!18482 a!2986) j!136) lt!301953)) (bvsge j!136 index!984)))))

(declare-fun b!649964 () Bool)

(assert (=> b!649964 (= e!372840 (bvslt (size!18846 a!2986) #b01111111111111111111111111111111))))

(declare-datatypes ((List!12523 0))(
  ( (Nil!12520) (Cons!12519 (h!13564 (_ BitVec 64)) (t!18751 List!12523)) )
))
(declare-fun arrayNoDuplicates!0 (array!38552 (_ BitVec 32) List!12523) Bool)

(assert (=> b!649964 (arrayNoDuplicates!0 lt!301954 #b00000000000000000000000000000000 Nil!12520)))

(declare-fun lt!301951 () Unit!22158)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12523) Unit!22158)

(assert (=> b!649964 (= lt!301951 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12520))))

(assert (=> b!649964 (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301945 () Unit!22158)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22158)

(assert (=> b!649964 (= lt!301945 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301954 (select (arr!18482 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372834 () Bool)

(assert (=> b!649964 e!372834))

(declare-fun res!421384 () Bool)

(assert (=> b!649964 (=> (not res!421384) (not e!372834))))

(assert (=> b!649964 (= res!421384 (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) j!136))))

(declare-fun b!649965 () Bool)

(declare-fun Unit!22160 () Unit!22158)

(assert (=> b!649965 (= e!372839 Unit!22160)))

(declare-fun b!649966 () Bool)

(declare-fun e!372831 () Bool)

(declare-fun e!372837 () Bool)

(assert (=> b!649966 (= e!372831 e!372837)))

(declare-fun res!421371 () Bool)

(assert (=> b!649966 (=> (not res!421371) (not e!372837))))

(assert (=> b!649966 (= res!421371 (= (select (store (arr!18482 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649966 (= lt!301954 (array!38553 (store (arr!18482 a!2986) i!1108 k!1786) (size!18846 a!2986)))))

(declare-fun b!649967 () Bool)

(declare-fun res!421373 () Bool)

(assert (=> b!649967 (=> (not res!421373) (not e!372831))))

(assert (=> b!649967 (= res!421373 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18482 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649968 () Bool)

(declare-fun res!421374 () Bool)

(assert (=> b!649968 (=> (not res!421374) (not e!372843))))

(assert (=> b!649968 (= res!421374 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649969 () Bool)

(declare-fun Unit!22161 () Unit!22158)

(assert (=> b!649969 (= e!372833 Unit!22161)))

(assert (=> b!649969 false))

(declare-fun b!649970 () Bool)

(assert (=> b!649970 (= e!372834 (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) index!984))))

(declare-fun b!649971 () Bool)

(declare-fun Unit!22162 () Unit!22158)

(assert (=> b!649971 (= e!372833 Unit!22162)))

(declare-fun b!649972 () Bool)

(assert (=> b!649972 (= e!372843 e!372831)))

(declare-fun res!421381 () Bool)

(assert (=> b!649972 (=> (not res!421381) (not e!372831))))

(declare-fun lt!301938 () SeekEntryResult!6922)

(assert (=> b!649972 (= res!421381 (or (= lt!301938 (MissingZero!6922 i!1108)) (= lt!301938 (MissingVacant!6922 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38552 (_ BitVec 32)) SeekEntryResult!6922)

(assert (=> b!649972 (= lt!301938 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!649973 () Bool)

(declare-fun res!421375 () Bool)

(assert (=> b!649973 (=> (not res!421375) (not e!372843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649973 (= res!421375 (validKeyInArray!0 (select (arr!18482 a!2986) j!136)))))

(declare-fun b!649974 () Bool)

(assert (=> b!649974 (= e!372837 e!372842)))

(declare-fun res!421378 () Bool)

(assert (=> b!649974 (=> (not res!421378) (not e!372842))))

(assert (=> b!649974 (= res!421378 (and (= lt!301940 (Found!6922 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18482 a!2986) index!984) (select (arr!18482 a!2986) j!136))) (not (= (select (arr!18482 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!649974 (= lt!301940 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18482 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649975 () Bool)

(declare-fun res!421367 () Bool)

(assert (=> b!649975 (=> (not res!421367) (not e!372831))))

(assert (=> b!649975 (= res!421367 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12520))))

(declare-fun b!649976 () Bool)

(declare-fun res!421369 () Bool)

(assert (=> b!649976 (=> (not res!421369) (not e!372843))))

(assert (=> b!649976 (= res!421369 (validKeyInArray!0 k!1786))))

(declare-fun b!649977 () Bool)

(declare-fun Unit!22163 () Unit!22158)

(assert (=> b!649977 (= e!372839 Unit!22163)))

(declare-fun lt!301939 () Unit!22158)

(assert (=> b!649977 (= lt!301939 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301954 (select (arr!18482 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649977 (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301947 () Unit!22158)

(assert (=> b!649977 (= lt!301947 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12520))))

(assert (=> b!649977 (arrayNoDuplicates!0 lt!301954 #b00000000000000000000000000000000 Nil!12520)))

(declare-fun lt!301949 () Unit!22158)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38552 (_ BitVec 32) (_ BitVec 32)) Unit!22158)

(assert (=> b!649977 (= lt!301949 (lemmaNoDuplicateFromThenFromBigger!0 lt!301954 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649977 (arrayNoDuplicates!0 lt!301954 j!136 Nil!12520)))

(declare-fun lt!301948 () Unit!22158)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38552 (_ BitVec 64) (_ BitVec 32) List!12523) Unit!22158)

(assert (=> b!649977 (= lt!301948 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301954 (select (arr!18482 a!2986) j!136) j!136 Nil!12520))))

(assert (=> b!649977 false))

(declare-fun b!649978 () Bool)

(declare-fun res!421385 () Bool)

(assert (=> b!649978 (=> (not res!421385) (not e!372831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38552 (_ BitVec 32)) Bool)

(assert (=> b!649978 (= res!421385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649979 () Bool)

(declare-fun res!421368 () Bool)

(assert (=> b!649979 (=> (not res!421368) (not e!372843))))

(assert (=> b!649979 (= res!421368 (and (= (size!18846 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18846 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18846 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!58890 res!421377) b!649979))

(assert (= (and b!649979 res!421368) b!649973))

(assert (= (and b!649973 res!421375) b!649976))

(assert (= (and b!649976 res!421369) b!649968))

(assert (= (and b!649968 res!421374) b!649972))

(assert (= (and b!649972 res!421381) b!649978))

(assert (= (and b!649978 res!421385) b!649975))

(assert (= (and b!649975 res!421367) b!649967))

(assert (= (and b!649967 res!421373) b!649966))

(assert (= (and b!649966 res!421371) b!649974))

(assert (= (and b!649974 res!421378) b!649959))

(assert (= (and b!649959 res!421372) b!649960))

(assert (= (and b!649959 c!74662) b!649969))

(assert (= (and b!649959 (not c!74662)) b!649971))

(assert (= (and b!649959 (not res!421382)) b!649962))

(assert (= (and b!649962 res!421383) b!649963))

(assert (= (and b!649963 (not res!421379)) b!649961))

(assert (= (and b!649961 res!421376) b!649957))

(assert (= (and b!649962 (not res!421370)) b!649958))

(assert (= (and b!649958 c!74663) b!649977))

(assert (= (and b!649958 (not c!74663)) b!649965))

(assert (= (and b!649958 (not res!421380)) b!649964))

(assert (= (and b!649964 res!421384) b!649970))

(declare-fun m!623173 () Bool)

(assert (=> b!649977 m!623173))

(declare-fun m!623175 () Bool)

(assert (=> b!649977 m!623175))

(declare-fun m!623177 () Bool)

(assert (=> b!649977 m!623177))

(assert (=> b!649977 m!623175))

(assert (=> b!649977 m!623175))

(declare-fun m!623179 () Bool)

(assert (=> b!649977 m!623179))

(declare-fun m!623181 () Bool)

(assert (=> b!649977 m!623181))

(assert (=> b!649977 m!623175))

(declare-fun m!623183 () Bool)

(assert (=> b!649977 m!623183))

(declare-fun m!623185 () Bool)

(assert (=> b!649977 m!623185))

(declare-fun m!623187 () Bool)

(assert (=> b!649977 m!623187))

(declare-fun m!623189 () Bool)

(assert (=> b!649972 m!623189))

(assert (=> b!649963 m!623175))

(assert (=> b!649961 m!623175))

(assert (=> b!649961 m!623175))

(declare-fun m!623191 () Bool)

(assert (=> b!649961 m!623191))

(declare-fun m!623193 () Bool)

(assert (=> b!649978 m!623193))

(assert (=> b!649962 m!623175))

(declare-fun m!623195 () Bool)

(assert (=> b!649962 m!623195))

(declare-fun m!623197 () Bool)

(assert (=> b!649962 m!623197))

(assert (=> b!649966 m!623195))

(declare-fun m!623199 () Bool)

(assert (=> b!649966 m!623199))

(assert (=> b!649964 m!623175))

(declare-fun m!623201 () Bool)

(assert (=> b!649964 m!623201))

(assert (=> b!649964 m!623175))

(assert (=> b!649964 m!623175))

(declare-fun m!623203 () Bool)

(assert (=> b!649964 m!623203))

(assert (=> b!649964 m!623175))

(assert (=> b!649964 m!623191))

(assert (=> b!649964 m!623185))

(assert (=> b!649964 m!623187))

(assert (=> b!649973 m!623175))

(assert (=> b!649973 m!623175))

(declare-fun m!623205 () Bool)

(assert (=> b!649973 m!623205))

(declare-fun m!623207 () Bool)

(assert (=> b!649967 m!623207))

(assert (=> b!649970 m!623175))

(assert (=> b!649970 m!623175))

(declare-fun m!623209 () Bool)

(assert (=> b!649970 m!623209))

(declare-fun m!623211 () Bool)

(assert (=> b!649975 m!623211))

(declare-fun m!623213 () Bool)

(assert (=> b!649976 m!623213))

(declare-fun m!623215 () Bool)

(assert (=> start!58890 m!623215))

(declare-fun m!623217 () Bool)

(assert (=> start!58890 m!623217))

(declare-fun m!623219 () Bool)

(assert (=> b!649959 m!623219))

(declare-fun m!623221 () Bool)

(assert (=> b!649959 m!623221))

(assert (=> b!649959 m!623175))

(assert (=> b!649959 m!623195))

(declare-fun m!623223 () Bool)

(assert (=> b!649959 m!623223))

(declare-fun m!623225 () Bool)

(assert (=> b!649959 m!623225))

(declare-fun m!623227 () Bool)

(assert (=> b!649959 m!623227))

(assert (=> b!649959 m!623175))

(declare-fun m!623229 () Bool)

(assert (=> b!649959 m!623229))

(declare-fun m!623231 () Bool)

(assert (=> b!649968 m!623231))

(declare-fun m!623233 () Bool)

(assert (=> b!649974 m!623233))

(assert (=> b!649974 m!623175))

(assert (=> b!649974 m!623175))

(declare-fun m!623235 () Bool)

(assert (=> b!649974 m!623235))

(assert (=> b!649957 m!623175))

(assert (=> b!649957 m!623175))

(assert (=> b!649957 m!623209))

(push 1)

(assert (not b!649957))

(assert (not b!649977))

(assert (not b!649978))

(assert (not start!58890))

(assert (not b!649959))

(assert (not b!649976))

(assert (not b!649973))

(assert (not b!649970))

(assert (not b!649961))

(assert (not b!649975))

(assert (not b!649964))

(assert (not b!649972))

(assert (not b!649968))

(assert (not b!649974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91925 () Bool)

(assert (=> d!91925 (= (validKeyInArray!0 (select (arr!18482 a!2986) j!136)) (and (not (= (select (arr!18482 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18482 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!649973 d!91925))

(declare-fun d!91927 () Bool)

(declare-fun res!421441 () Bool)

(declare-fun e!372915 () Bool)

(assert (=> d!91927 (=> res!421441 e!372915)))

(assert (=> d!91927 (= res!421441 (= (select (arr!18482 lt!301954) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18482 a!2986) j!136)))))

(assert (=> d!91927 (= (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!372915)))

(declare-fun b!650067 () Bool)

(declare-fun e!372916 () Bool)

(assert (=> b!650067 (= e!372915 e!372916)))

(declare-fun res!421442 () Bool)

(assert (=> b!650067 (=> (not res!421442) (not e!372916))))

(assert (=> b!650067 (= res!421442 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18846 lt!301954)))))

(declare-fun b!650068 () Bool)

(assert (=> b!650068 (= e!372916 (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91927 (not res!421441)) b!650067))

(assert (= (and b!650067 res!421442) b!650068))

(declare-fun m!623299 () Bool)

(assert (=> d!91927 m!623299))

(assert (=> b!650068 m!623175))

(declare-fun m!623301 () Bool)

(assert (=> b!650068 m!623301))

(assert (=> b!649964 d!91927))

(declare-fun bm!33738 () Bool)

(declare-fun call!33741 () Bool)

(declare-fun c!74688 () Bool)

(assert (=> bm!33738 (= call!33741 (arrayNoDuplicates!0 lt!301954 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74688 (Cons!12519 (select (arr!18482 lt!301954) #b00000000000000000000000000000000) Nil!12520) Nil!12520)))))

(declare-fun b!650091 () Bool)

(declare-fun e!372933 () Bool)

(declare-fun e!372931 () Bool)

(assert (=> b!650091 (= e!372933 e!372931)))

(assert (=> b!650091 (= c!74688 (validKeyInArray!0 (select (arr!18482 lt!301954) #b00000000000000000000000000000000)))))

(declare-fun b!650092 () Bool)

(assert (=> b!650092 (= e!372931 call!33741)))

(declare-fun d!91929 () Bool)

(declare-fun res!421449 () Bool)

(declare-fun e!372932 () Bool)

(assert (=> d!91929 (=> res!421449 e!372932)))

(assert (=> d!91929 (= res!421449 (bvsge #b00000000000000000000000000000000 (size!18846 lt!301954)))))

(assert (=> d!91929 (= (arrayNoDuplicates!0 lt!301954 #b00000000000000000000000000000000 Nil!12520) e!372932)))

(declare-fun b!650093 () Bool)

(declare-fun e!372934 () Bool)

(declare-fun contains!3175 (List!12523 (_ BitVec 64)) Bool)

(assert (=> b!650093 (= e!372934 (contains!3175 Nil!12520 (select (arr!18482 lt!301954) #b00000000000000000000000000000000)))))

(declare-fun b!650094 () Bool)

(assert (=> b!650094 (= e!372932 e!372933)))

(declare-fun res!421451 () Bool)

(assert (=> b!650094 (=> (not res!421451) (not e!372933))))

(assert (=> b!650094 (= res!421451 (not e!372934))))

(declare-fun res!421450 () Bool)

(assert (=> b!650094 (=> (not res!421450) (not e!372934))))

(assert (=> b!650094 (= res!421450 (validKeyInArray!0 (select (arr!18482 lt!301954) #b00000000000000000000000000000000)))))

(declare-fun b!650095 () Bool)

(assert (=> b!650095 (= e!372931 call!33741)))

(assert (= (and d!91929 (not res!421449)) b!650094))

(assert (= (and b!650094 res!421450) b!650093))

(assert (= (and b!650094 res!421451) b!650091))

(assert (= (and b!650091 c!74688) b!650095))

(assert (= (and b!650091 (not c!74688)) b!650092))

(assert (= (or b!650095 b!650092) bm!33738))

(declare-fun m!623323 () Bool)

(assert (=> bm!33738 m!623323))

(declare-fun m!623325 () Bool)

(assert (=> bm!33738 m!623325))

(assert (=> b!650091 m!623323))

(assert (=> b!650091 m!623323))

(declare-fun m!623327 () Bool)

(assert (=> b!650091 m!623327))

(assert (=> b!650093 m!623323))

(assert (=> b!650093 m!623323))

(declare-fun m!623329 () Bool)

(assert (=> b!650093 m!623329))

(assert (=> b!650094 m!623323))

(assert (=> b!650094 m!623323))

(assert (=> b!650094 m!623327))

(assert (=> b!649964 d!91929))

(declare-fun d!91937 () Bool)

(assert (=> d!91937 (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301993 () Unit!22158)

(declare-fun choose!114 (array!38552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22158)

(assert (=> d!91937 (= lt!301993 (choose!114 lt!301954 (select (arr!18482 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91937 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91937 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301954 (select (arr!18482 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!301993)))

(declare-fun bs!19393 () Bool)

(assert (= bs!19393 d!91937))

(assert (=> bs!19393 m!623175))

(assert (=> bs!19393 m!623203))

(assert (=> bs!19393 m!623175))

(declare-fun m!623331 () Bool)

(assert (=> bs!19393 m!623331))

(assert (=> b!649964 d!91937))

(declare-fun d!91939 () Bool)

(declare-fun res!421452 () Bool)

(declare-fun e!372937 () Bool)

(assert (=> d!91939 (=> res!421452 e!372937)))

(assert (=> d!91939 (= res!421452 (= (select (arr!18482 lt!301954) j!136) (select (arr!18482 a!2986) j!136)))))

(assert (=> d!91939 (= (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) j!136) e!372937)))

(declare-fun b!650103 () Bool)

(declare-fun e!372939 () Bool)

(assert (=> b!650103 (= e!372937 e!372939)))

(declare-fun res!421453 () Bool)

(assert (=> b!650103 (=> (not res!421453) (not e!372939))))

(assert (=> b!650103 (= res!421453 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18846 lt!301954)))))

(declare-fun b!650105 () Bool)

(assert (=> b!650105 (= e!372939 (arrayContainsKey!0 lt!301954 (select (arr!18482 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91939 (not res!421452)) b!650103))

(assert (= (and b!650103 res!421453) b!650105))

(declare-fun m!623333 () Bool)

(assert (=> d!91939 m!623333))

(assert (=> b!650105 m!623175))

(declare-fun m!623335 () Bool)

(assert (=> b!650105 m!623335))

(assert (=> b!649964 d!91939))

(declare-fun d!91941 () Bool)

(declare-fun e!372948 () Bool)

(assert (=> d!91941 e!372948))

(declare-fun res!421456 () Bool)

(assert (=> d!91941 (=> (not res!421456) (not e!372948))))

(assert (=> d!91941 (= res!421456 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18846 a!2986))))))

(declare-fun lt!302001 () Unit!22158)

(declare-fun choose!41 (array!38552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12523) Unit!22158)

(assert (=> d!91941 (= lt!302001 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12520))))

(assert (=> d!91941 (bvslt (size!18846 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91941 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12520) lt!302001)))

(declare-fun b!650118 () Bool)

(assert (=> b!650118 (= e!372948 (arrayNoDuplicates!0 (array!38553 (store (arr!18482 a!2986) i!1108 k!1786) (size!18846 a!2986)) #b00000000000000000000000000000000 Nil!12520))))

(assert (= (and d!91941 res!421456) b!650118))

(declare-fun m!623349 () Bool)

(assert (=> d!91941 m!623349))

(assert (=> b!650118 m!623195))

(declare-fun m!623353 () Bool)

(assert (=> b!650118 m!623353))

(assert (=> b!649964 d!91941))

(declare-fun e!372980 () SeekEntryResult!6922)

(declare-fun b!650163 () Bool)

(assert (=> b!650163 (= e!372980 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18482 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650164 () Bool)

(declare-fun e!372982 () SeekEntryResult!6922)

(assert (=> b!650164 (= e!372982 (Found!6922 index!984))))

(declare-fun d!91945 () Bool)

(declare-fun lt!302027 () SeekEntryResult!6922)

(assert (=> d!91945 (and (or (is-Undefined!6922 lt!302027) (not (is-Found!6922 lt!302027)) (and (bvsge (index!30036 lt!302027) #b00000000000000000000000000000000) (bvslt (index!30036 lt!302027) (size!18846 a!2986)))) (or (is-Undefined!6922 lt!302027) (is-Found!6922 lt!302027) (not (is-MissingVacant!6922 lt!302027)) (not (= (index!30038 lt!302027) vacantSpotIndex!68)) (and (bvsge (index!30038 lt!302027) #b00000000000000000000000000000000) (bvslt (index!30038 lt!302027) (size!18846 a!2986)))) (or (is-Undefined!6922 lt!302027) (ite (is-Found!6922 lt!302027) (= (select (arr!18482 a!2986) (index!30036 lt!302027)) (select (arr!18482 a!2986) j!136)) (and (is-MissingVacant!6922 lt!302027) (= (index!30038 lt!302027) vacantSpotIndex!68) (= (select (arr!18482 a!2986) (index!30038 lt!302027)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!372981 () SeekEntryResult!6922)

(assert (=> d!91945 (= lt!302027 e!372981)))

(declare-fun c!74711 () Bool)

(assert (=> d!91945 (= c!74711 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!302028 () (_ BitVec 64))

(assert (=> d!91945 (= lt!302028 (select (arr!18482 a!2986) index!984))))

(assert (=> d!91945 (validMask!0 mask!3053)))

(assert (=> d!91945 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18482 a!2986) j!136) a!2986 mask!3053) lt!302027)))

(declare-fun b!650165 () Bool)

(declare-fun c!74712 () Bool)

(assert (=> b!650165 (= c!74712 (= lt!302028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650165 (= e!372982 e!372980)))

(declare-fun b!650166 () Bool)

(assert (=> b!650166 (= e!372981 e!372982)))

(declare-fun c!74713 () Bool)

(assert (=> b!650166 (= c!74713 (= lt!302028 (select (arr!18482 a!2986) j!136)))))

(declare-fun b!650167 () Bool)

(assert (=> b!650167 (= e!372981 Undefined!6922)))

(declare-fun b!650168 () Bool)

(assert (=> b!650168 (= e!372980 (MissingVacant!6922 vacantSpotIndex!68))))

(assert (= (and d!91945 c!74711) b!650167))

(assert (= (and d!91945 (not c!74711)) b!650166))

(assert (= (and b!650166 c!74713) b!650164))

(assert (= (and b!650166 (not c!74713)) b!650165))

(assert (= (and b!650165 c!74712) b!650168))

(assert (= (and b!650165 (not c!74712)) b!650163))

(assert (=> b!650163 m!623219))

(assert (=> b!650163 m!623219))

(assert (=> b!650163 m!623175))

(declare-fun m!623403 () Bool)

(assert (=> b!650163 m!623403))

(declare-fun m!623405 () Bool)

(assert (=> d!91945 m!623405))

(declare-fun m!623407 () Bool)

(assert (=> d!91945 m!623407))

(assert (=> d!91945 m!623233))

(assert (=> d!91945 m!623215))

(assert (=> b!649974 d!91945))

(declare-fun b!650177 () Bool)

(declare-fun e!372988 () SeekEntryResult!6922)

(assert (=> b!650177 (= e!372988 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!301952 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!301950 lt!301954 mask!3053))))

(declare-fun b!650178 () Bool)

(declare-fun e!372990 () SeekEntryResult!6922)

(assert (=> b!650178 (= e!372990 (Found!6922 lt!301952))))

(declare-fun d!91973 () Bool)

(declare-fun lt!302031 () SeekEntryResult!6922)

(assert (=> d!91973 (and (or (is-Undefined!6922 lt!302031) (not (is-Found!6922 lt!302031)) (and (bvsge (index!30036 lt!302031) #b00000000000000000000000000000000) (bvslt (index!30036 lt!302031) (size!18846 lt!301954)))) (or (is-Undefined!6922 lt!302031) (is-Found!6922 lt!302031) (not (is-MissingVacant!6922 lt!302031)) (not (= (index!30038 lt!302031) vacantSpotIndex!68)) (and (bvsge (index!30038 lt!302031) #b00000000000000000000000000000000) (bvslt (index!30038 lt!302031) (size!18846 lt!301954)))) (or (is-Undefined!6922 lt!302031) (ite (is-Found!6922 lt!302031) (= (select (arr!18482 lt!301954) (index!30036 lt!302031)) lt!301950) (and (is-MissingVacant!6922 lt!302031) (= (index!30038 lt!302031) vacantSpotIndex!68) (= (select (arr!18482 lt!301954) (index!30038 lt!302031)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!372989 () SeekEntryResult!6922)

(assert (=> d!91973 (= lt!302031 e!372989)))

(declare-fun c!74717 () Bool)

(assert (=> d!91973 (= c!74717 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!302032 () (_ BitVec 64))

(assert (=> d!91973 (= lt!302032 (select (arr!18482 lt!301954) lt!301952))))

(assert (=> d!91973 (validMask!0 mask!3053)))

(assert (=> d!91973 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301952 vacantSpotIndex!68 lt!301950 lt!301954 mask!3053) lt!302031)))

(declare-fun b!650179 () Bool)

(declare-fun c!74718 () Bool)

(assert (=> b!650179 (= c!74718 (= lt!302032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650179 (= e!372990 e!372988)))

(declare-fun b!650180 () Bool)

(assert (=> b!650180 (= e!372989 e!372990)))

(declare-fun c!74719 () Bool)

(assert (=> b!650180 (= c!74719 (= lt!302032 lt!301950))))

(declare-fun b!650181 () Bool)

(assert (=> b!650181 (= e!372989 Undefined!6922)))

(declare-fun b!650182 () Bool)

(assert (=> b!650182 (= e!372988 (MissingVacant!6922 vacantSpotIndex!68))))

(assert (= (and d!91973 c!74717) b!650181))

(assert (= (and d!91973 (not c!74717)) b!650180))

(assert (= (and b!650180 c!74719) b!650178))

(assert (= (and b!650180 (not c!74719)) b!650179))

(assert (= (and b!650179 c!74718) b!650182))

(assert (= (and b!650179 (not c!74718)) b!650177))

(declare-fun m!623415 () Bool)

(assert (=> b!650177 m!623415))

(assert (=> b!650177 m!623415))

(declare-fun m!623417 () Bool)

(assert (=> b!650177 m!623417))

(declare-fun m!623419 () Bool)

(assert (=> d!91973 m!623419))

(declare-fun m!623421 () Bool)

(assert (=> d!91973 m!623421))

(declare-fun m!623423 () Bool)

(assert (=> d!91973 m!623423))

(assert (=> d!91973 m!623215))

(assert (=> b!649959 d!91973))

(declare-fun d!91977 () Bool)

(declare-fun lt!302035 () (_ BitVec 32))

(assert (=> d!91977 (and (bvsge lt!302035 #b00000000000000000000000000000000) (bvslt lt!302035 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91977 (= lt!302035 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91977 (validMask!0 mask!3053)))

(assert (=> d!91977 (= (nextIndex!0 index!984 x!910 mask!3053) lt!302035)))

(declare-fun bs!19397 () Bool)

(assert (= bs!19397 d!91977))

(declare-fun m!623425 () Bool)

(assert (=> bs!19397 m!623425))

(assert (=> bs!19397 m!623215))

(assert (=> b!649959 d!91977))

(declare-fun e!372991 () SeekEntryResult!6922)

(declare-fun b!650183 () Bool)

(assert (=> b!650183 (= e!372991 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!301950 lt!301954 mask!3053))))

(declare-fun b!650184 () Bool)

(declare-fun e!372993 () SeekEntryResult!6922)

(assert (=> b!650184 (= e!372993 (Found!6922 index!984))))

(declare-fun lt!302036 () SeekEntryResult!6922)

(declare-fun d!91979 () Bool)

(assert (=> d!91979 (and (or (is-Undefined!6922 lt!302036) (not (is-Found!6922 lt!302036)) (and (bvsge (index!30036 lt!302036) #b00000000000000000000000000000000) (bvslt (index!30036 lt!302036) (size!18846 lt!301954)))) (or (is-Undefined!6922 lt!302036) (is-Found!6922 lt!302036) (not (is-MissingVacant!6922 lt!302036)) (not (= (index!30038 lt!302036) vacantSpotIndex!68)) (and (bvsge (index!30038 lt!302036) #b00000000000000000000000000000000) (bvslt (index!30038 lt!302036) (size!18846 lt!301954)))) (or (is-Undefined!6922 lt!302036) (ite (is-Found!6922 lt!302036) (= (select (arr!18482 lt!301954) (index!30036 lt!302036)) lt!301950) (and (is-MissingVacant!6922 lt!302036) (= (index!30038 lt!302036) vacantSpotIndex!68) (= (select (arr!18482 lt!301954) (index!30038 lt!302036)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!372992 () SeekEntryResult!6922)

(assert (=> d!91979 (= lt!302036 e!372992)))

(declare-fun c!74720 () Bool)

(assert (=> d!91979 (= c!74720 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!302037 () (_ BitVec 64))

(assert (=> d!91979 (= lt!302037 (select (arr!18482 lt!301954) index!984))))

(assert (=> d!91979 (validMask!0 mask!3053)))

(assert (=> d!91979 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301950 lt!301954 mask!3053) lt!302036)))

(declare-fun b!650185 () Bool)

(declare-fun c!74721 () Bool)

(assert (=> b!650185 (= c!74721 (= lt!302037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650185 (= e!372993 e!372991)))

(declare-fun b!650186 () Bool)

(assert (=> b!650186 (= e!372992 e!372993)))

(declare-fun c!74722 () Bool)

(assert (=> b!650186 (= c!74722 (= lt!302037 lt!301950))))

(declare-fun b!650187 () Bool)

(assert (=> b!650187 (= e!372992 Undefined!6922)))

(declare-fun b!650188 () Bool)

(assert (=> b!650188 (= e!372991 (MissingVacant!6922 vacantSpotIndex!68))))

(assert (= (and d!91979 c!74720) b!650187))

(assert (= (and d!91979 (not c!74720)) b!650186))

(assert (= (and b!650186 c!74722) b!650184))

(assert (= (and b!650186 (not c!74722)) b!650185))

(assert (= (and b!650185 c!74721) b!650188))

(assert (= (and b!650185 (not c!74721)) b!650183))

(assert (=> b!650183 m!623219))

(assert (=> b!650183 m!623219))

(declare-fun m!623427 () Bool)

(assert (=> b!650183 m!623427))

(declare-fun m!623429 () Bool)

(assert (=> d!91979 m!623429))

(declare-fun m!623431 () Bool)

(assert (=> d!91979 m!623431))

(declare-fun m!623433 () Bool)

(assert (=> d!91979 m!623433))

(assert (=> d!91979 m!623215))

(assert (=> b!649959 d!91979))

(declare-fun d!91981 () Bool)

(declare-fun e!373008 () Bool)

(assert (=> d!91981 e!373008))

(declare-fun res!421479 () Bool)

(assert (=> d!91981 (=> (not res!421479) (not e!373008))))

(assert (=> d!91981 (= res!421479 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18846 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18846 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18846 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18846 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18846 a!2986))))))

(declare-fun lt!302050 () Unit!22158)

(declare-fun choose!9 (array!38552 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22158)

