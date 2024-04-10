; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54836 () Bool)

(assert start!54836)

(declare-fun b!598922 () Bool)

(declare-fun e!342382 () Bool)

(declare-fun e!342391 () Bool)

(assert (=> b!598922 (= e!342382 e!342391)))

(declare-fun res!383954 () Bool)

(assert (=> b!598922 (=> (not res!383954) (not e!342391))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37071 0))(
  ( (array!37072 (arr!17795 (Array (_ BitVec 32) (_ BitVec 64))) (size!18159 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37071)

(declare-fun lt!272170 () array!37071)

(declare-fun arrayContainsKey!0 (array!37071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598922 (= res!383954 (arrayContainsKey!0 lt!272170 (select (arr!17795 a!2986) j!136) j!136))))

(declare-fun b!598923 () Bool)

(declare-datatypes ((Unit!18858 0))(
  ( (Unit!18859) )
))
(declare-fun e!342383 () Unit!18858)

(declare-fun Unit!18860 () Unit!18858)

(assert (=> b!598923 (= e!342383 Unit!18860)))

(declare-fun b!598924 () Bool)

(declare-fun res!383955 () Bool)

(declare-fun e!342386 () Bool)

(assert (=> b!598924 (=> (not res!383955) (not e!342386))))

(declare-datatypes ((List!11836 0))(
  ( (Nil!11833) (Cons!11832 (h!12877 (_ BitVec 64)) (t!18064 List!11836)) )
))
(declare-fun arrayNoDuplicates!0 (array!37071 (_ BitVec 32) List!11836) Bool)

(assert (=> b!598924 (= res!383955 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11833))))

(declare-fun b!598925 () Bool)

(declare-fun e!342385 () Bool)

(assert (=> b!598925 (= e!342385 e!342382)))

(declare-fun res!383960 () Bool)

(assert (=> b!598925 (=> res!383960 e!342382)))

(declare-fun lt!272169 () (_ BitVec 64))

(declare-fun lt!272172 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!598925 (= res!383960 (or (not (= (select (arr!17795 a!2986) j!136) lt!272172)) (not (= (select (arr!17795 a!2986) j!136) lt!272169)) (bvsge j!136 index!984)))))

(declare-fun b!598926 () Bool)

(assert (=> b!598926 (= e!342391 (arrayContainsKey!0 lt!272170 (select (arr!17795 a!2986) j!136) index!984))))

(declare-fun b!598927 () Bool)

(declare-fun e!342390 () Bool)

(declare-fun e!342387 () Bool)

(assert (=> b!598927 (= e!342390 e!342387)))

(declare-fun res!383962 () Bool)

(assert (=> b!598927 (=> (not res!383962) (not e!342387))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6235 0))(
  ( (MissingZero!6235 (index!27197 (_ BitVec 32))) (Found!6235 (index!27198 (_ BitVec 32))) (Intermediate!6235 (undefined!7047 Bool) (index!27199 (_ BitVec 32)) (x!56002 (_ BitVec 32))) (Undefined!6235) (MissingVacant!6235 (index!27200 (_ BitVec 32))) )
))
(declare-fun lt!272168 () SeekEntryResult!6235)

(assert (=> b!598927 (= res!383962 (and (= lt!272168 (Found!6235 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17795 a!2986) index!984) (select (arr!17795 a!2986) j!136))) (not (= (select (arr!17795 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37071 (_ BitVec 32)) SeekEntryResult!6235)

(assert (=> b!598927 (= lt!272168 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17795 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598928 () Bool)

(declare-fun res!383959 () Bool)

(assert (=> b!598928 (=> (not res!383959) (not e!342386))))

(assert (=> b!598928 (= res!383959 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17795 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!383958 () Bool)

(declare-fun e!342388 () Bool)

(assert (=> start!54836 (=> (not res!383958) (not e!342388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54836 (= res!383958 (validMask!0 mask!3053))))

(assert (=> start!54836 e!342388))

(assert (=> start!54836 true))

(declare-fun array_inv!13591 (array!37071) Bool)

(assert (=> start!54836 (array_inv!13591 a!2986)))

(declare-fun b!598929 () Bool)

(declare-fun e!342393 () Bool)

(assert (=> b!598929 (= e!342387 (not e!342393))))

(declare-fun res!383961 () Bool)

(assert (=> b!598929 (=> res!383961 e!342393)))

(declare-fun lt!272174 () SeekEntryResult!6235)

(assert (=> b!598929 (= res!383961 (not (= lt!272174 (Found!6235 index!984))))))

(declare-fun lt!272178 () Unit!18858)

(assert (=> b!598929 (= lt!272178 e!342383)))

(declare-fun c!67853 () Bool)

(assert (=> b!598929 (= c!67853 (= lt!272174 Undefined!6235))))

(assert (=> b!598929 (= lt!272174 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272172 lt!272170 mask!3053))))

(declare-fun e!342384 () Bool)

(assert (=> b!598929 e!342384))

(declare-fun res!383956 () Bool)

(assert (=> b!598929 (=> (not res!383956) (not e!342384))))

(declare-fun lt!272176 () SeekEntryResult!6235)

(declare-fun lt!272175 () (_ BitVec 32))

(assert (=> b!598929 (= res!383956 (= lt!272176 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272175 vacantSpotIndex!68 lt!272172 lt!272170 mask!3053)))))

(assert (=> b!598929 (= lt!272176 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272175 vacantSpotIndex!68 (select (arr!17795 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!598929 (= lt!272172 (select (store (arr!17795 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272173 () Unit!18858)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37071 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18858)

(assert (=> b!598929 (= lt!272173 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272175 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598929 (= lt!272175 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598930 () Bool)

(declare-fun res!383957 () Bool)

(assert (=> b!598930 (=> (not res!383957) (not e!342386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37071 (_ BitVec 32)) Bool)

(assert (=> b!598930 (= res!383957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598931 () Bool)

(assert (=> b!598931 (= e!342384 (= lt!272168 lt!272176))))

(declare-fun b!598932 () Bool)

(declare-fun res!383964 () Bool)

(assert (=> b!598932 (=> (not res!383964) (not e!342388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598932 (= res!383964 (validKeyInArray!0 k!1786))))

(declare-fun b!598933 () Bool)

(declare-fun e!342389 () Bool)

(assert (=> b!598933 (= e!342389 true)))

(assert (=> b!598933 (arrayNoDuplicates!0 lt!272170 #b00000000000000000000000000000000 Nil!11833)))

(declare-fun lt!272177 () Unit!18858)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37071 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11836) Unit!18858)

(assert (=> b!598933 (= lt!272177 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11833))))

(assert (=> b!598933 (arrayContainsKey!0 lt!272170 (select (arr!17795 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272179 () Unit!18858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37071 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18858)

(assert (=> b!598933 (= lt!272179 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272170 (select (arr!17795 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598934 () Bool)

(assert (=> b!598934 (= e!342388 e!342386)))

(declare-fun res!383950 () Bool)

(assert (=> b!598934 (=> (not res!383950) (not e!342386))))

(declare-fun lt!272171 () SeekEntryResult!6235)

(assert (=> b!598934 (= res!383950 (or (= lt!272171 (MissingZero!6235 i!1108)) (= lt!272171 (MissingVacant!6235 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37071 (_ BitVec 32)) SeekEntryResult!6235)

(assert (=> b!598934 (= lt!272171 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!598935 () Bool)

(declare-fun res!383963 () Bool)

(assert (=> b!598935 (=> (not res!383963) (not e!342388))))

(assert (=> b!598935 (= res!383963 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598936 () Bool)

(declare-fun res!383953 () Bool)

(assert (=> b!598936 (=> (not res!383953) (not e!342388))))

(assert (=> b!598936 (= res!383953 (validKeyInArray!0 (select (arr!17795 a!2986) j!136)))))

(declare-fun b!598937 () Bool)

(assert (=> b!598937 (= e!342393 e!342389)))

(declare-fun res!383952 () Bool)

(assert (=> b!598937 (=> res!383952 e!342389)))

(assert (=> b!598937 (= res!383952 (or (not (= (select (arr!17795 a!2986) j!136) lt!272172)) (not (= (select (arr!17795 a!2986) j!136) lt!272169)) (bvsge j!136 index!984)))))

(assert (=> b!598937 e!342385))

(declare-fun res!383966 () Bool)

(assert (=> b!598937 (=> (not res!383966) (not e!342385))))

(assert (=> b!598937 (= res!383966 (= lt!272169 (select (arr!17795 a!2986) j!136)))))

(assert (=> b!598937 (= lt!272169 (select (store (arr!17795 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!598938 () Bool)

(declare-fun res!383951 () Bool)

(assert (=> b!598938 (=> (not res!383951) (not e!342388))))

(assert (=> b!598938 (= res!383951 (and (= (size!18159 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18159 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18159 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598939 () Bool)

(declare-fun Unit!18861 () Unit!18858)

(assert (=> b!598939 (= e!342383 Unit!18861)))

(assert (=> b!598939 false))

(declare-fun b!598940 () Bool)

(assert (=> b!598940 (= e!342386 e!342390)))

(declare-fun res!383965 () Bool)

(assert (=> b!598940 (=> (not res!383965) (not e!342390))))

(assert (=> b!598940 (= res!383965 (= (select (store (arr!17795 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598940 (= lt!272170 (array!37072 (store (arr!17795 a!2986) i!1108 k!1786) (size!18159 a!2986)))))

(assert (= (and start!54836 res!383958) b!598938))

(assert (= (and b!598938 res!383951) b!598936))

(assert (= (and b!598936 res!383953) b!598932))

(assert (= (and b!598932 res!383964) b!598935))

(assert (= (and b!598935 res!383963) b!598934))

(assert (= (and b!598934 res!383950) b!598930))

(assert (= (and b!598930 res!383957) b!598924))

(assert (= (and b!598924 res!383955) b!598928))

(assert (= (and b!598928 res!383959) b!598940))

(assert (= (and b!598940 res!383965) b!598927))

(assert (= (and b!598927 res!383962) b!598929))

(assert (= (and b!598929 res!383956) b!598931))

(assert (= (and b!598929 c!67853) b!598939))

(assert (= (and b!598929 (not c!67853)) b!598923))

(assert (= (and b!598929 (not res!383961)) b!598937))

(assert (= (and b!598937 res!383966) b!598925))

(assert (= (and b!598925 (not res!383960)) b!598922))

(assert (= (and b!598922 res!383954) b!598926))

(assert (= (and b!598937 (not res!383952)) b!598933))

(declare-fun m!576203 () Bool)

(assert (=> b!598937 m!576203))

(declare-fun m!576205 () Bool)

(assert (=> b!598937 m!576205))

(declare-fun m!576207 () Bool)

(assert (=> b!598937 m!576207))

(declare-fun m!576209 () Bool)

(assert (=> b!598924 m!576209))

(declare-fun m!576211 () Bool)

(assert (=> start!54836 m!576211))

(declare-fun m!576213 () Bool)

(assert (=> start!54836 m!576213))

(assert (=> b!598922 m!576203))

(assert (=> b!598922 m!576203))

(declare-fun m!576215 () Bool)

(assert (=> b!598922 m!576215))

(declare-fun m!576217 () Bool)

(assert (=> b!598935 m!576217))

(assert (=> b!598925 m!576203))

(assert (=> b!598926 m!576203))

(assert (=> b!598926 m!576203))

(declare-fun m!576219 () Bool)

(assert (=> b!598926 m!576219))

(declare-fun m!576221 () Bool)

(assert (=> b!598929 m!576221))

(declare-fun m!576223 () Bool)

(assert (=> b!598929 m!576223))

(declare-fun m!576225 () Bool)

(assert (=> b!598929 m!576225))

(assert (=> b!598929 m!576203))

(declare-fun m!576227 () Bool)

(assert (=> b!598929 m!576227))

(assert (=> b!598929 m!576205))

(assert (=> b!598929 m!576203))

(declare-fun m!576229 () Bool)

(assert (=> b!598929 m!576229))

(declare-fun m!576231 () Bool)

(assert (=> b!598929 m!576231))

(declare-fun m!576233 () Bool)

(assert (=> b!598932 m!576233))

(declare-fun m!576235 () Bool)

(assert (=> b!598927 m!576235))

(assert (=> b!598927 m!576203))

(assert (=> b!598927 m!576203))

(declare-fun m!576237 () Bool)

(assert (=> b!598927 m!576237))

(declare-fun m!576239 () Bool)

(assert (=> b!598928 m!576239))

(assert (=> b!598940 m!576205))

(declare-fun m!576241 () Bool)

(assert (=> b!598940 m!576241))

(assert (=> b!598936 m!576203))

(assert (=> b!598936 m!576203))

(declare-fun m!576243 () Bool)

(assert (=> b!598936 m!576243))

(declare-fun m!576245 () Bool)

(assert (=> b!598934 m!576245))

(assert (=> b!598933 m!576203))

(declare-fun m!576247 () Bool)

(assert (=> b!598933 m!576247))

(assert (=> b!598933 m!576203))

(assert (=> b!598933 m!576203))

(declare-fun m!576249 () Bool)

(assert (=> b!598933 m!576249))

(declare-fun m!576251 () Bool)

(assert (=> b!598933 m!576251))

(declare-fun m!576253 () Bool)

(assert (=> b!598933 m!576253))

(declare-fun m!576255 () Bool)

(assert (=> b!598930 m!576255))

(push 1)

(assert (not b!598934))

(assert (not b!598930))

(assert (not b!598932))

(assert (not b!598927))

(assert (not b!598936))

(assert (not start!54836))

(assert (not b!598935))

(assert (not b!598924))

(assert (not b!598926))

(assert (not b!598922))

(assert (not b!598933))

(assert (not b!598929))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

