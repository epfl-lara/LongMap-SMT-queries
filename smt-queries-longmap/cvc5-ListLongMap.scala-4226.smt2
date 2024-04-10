; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58124 () Bool)

(assert start!58124)

(declare-fun b!642239 () Bool)

(declare-fun e!367799 () Bool)

(declare-fun e!367798 () Bool)

(assert (=> b!642239 (= e!367799 e!367798)))

(declare-fun res!415988 () Bool)

(assert (=> b!642239 (=> (not res!415988) (not e!367798))))

(declare-datatypes ((SeekEntryResult!6848 0))(
  ( (MissingZero!6848 (index!29718 (_ BitVec 32))) (Found!6848 (index!29719 (_ BitVec 32))) (Intermediate!6848 (undefined!7660 Bool) (index!29720 (_ BitVec 32)) (x!58486 (_ BitVec 32))) (Undefined!6848) (MissingVacant!6848 (index!29721 (_ BitVec 32))) )
))
(declare-fun lt!297394 () SeekEntryResult!6848)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38383 0))(
  ( (array!38384 (arr!18408 (Array (_ BitVec 32) (_ BitVec 64))) (size!18772 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38383)

(assert (=> b!642239 (= res!415988 (and (= lt!297394 (Found!6848 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18408 a!2986) index!984) (select (arr!18408 a!2986) j!136))) (not (= (select (arr!18408 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38383 (_ BitVec 32)) SeekEntryResult!6848)

(assert (=> b!642239 (= lt!297394 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18408 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642240 () Bool)

(declare-fun res!415976 () Bool)

(declare-fun e!367795 () Bool)

(assert (=> b!642240 (=> (not res!415976) (not e!367795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642240 (= res!415976 (validKeyInArray!0 (select (arr!18408 a!2986) j!136)))))

(declare-fun b!642241 () Bool)

(declare-fun e!367796 () Bool)

(declare-fun e!367797 () Bool)

(assert (=> b!642241 (= e!367796 e!367797)))

(declare-fun res!415977 () Bool)

(assert (=> b!642241 (=> res!415977 e!367797)))

(declare-fun lt!297383 () (_ BitVec 64))

(declare-fun lt!297392 () (_ BitVec 64))

(assert (=> b!642241 (= res!415977 (or (not (= (select (arr!18408 a!2986) j!136) lt!297392)) (not (= (select (arr!18408 a!2986) j!136) lt!297383)) (bvsge j!136 index!984)))))

(declare-fun b!642242 () Bool)

(declare-fun e!367801 () Bool)

(declare-fun lt!297381 () SeekEntryResult!6848)

(assert (=> b!642242 (= e!367801 (= lt!297394 lt!297381))))

(declare-fun b!642243 () Bool)

(declare-fun res!415987 () Bool)

(declare-fun e!367792 () Bool)

(assert (=> b!642243 (=> (not res!415987) (not e!367792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38383 (_ BitVec 32)) Bool)

(assert (=> b!642243 (= res!415987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642244 () Bool)

(declare-fun e!367794 () Bool)

(declare-fun e!367793 () Bool)

(assert (=> b!642244 (= e!367794 e!367793)))

(declare-fun res!415981 () Bool)

(assert (=> b!642244 (=> res!415981 e!367793)))

(assert (=> b!642244 (= res!415981 (or (bvsge (size!18772 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18772 a!2986))))))

(declare-fun lt!297382 () array!38383)

(declare-datatypes ((List!12449 0))(
  ( (Nil!12446) (Cons!12445 (h!13490 (_ BitVec 64)) (t!18677 List!12449)) )
))
(declare-fun arrayNoDuplicates!0 (array!38383 (_ BitVec 32) List!12449) Bool)

(assert (=> b!642244 (arrayNoDuplicates!0 lt!297382 j!136 Nil!12446)))

(declare-datatypes ((Unit!21726 0))(
  ( (Unit!21727) )
))
(declare-fun lt!297391 () Unit!21726)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38383 (_ BitVec 32) (_ BitVec 32)) Unit!21726)

(assert (=> b!642244 (= lt!297391 (lemmaNoDuplicateFromThenFromBigger!0 lt!297382 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642244 (arrayNoDuplicates!0 lt!297382 #b00000000000000000000000000000000 Nil!12446)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!297384 () Unit!21726)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38383 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12449) Unit!21726)

(assert (=> b!642244 (= lt!297384 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12446))))

(declare-fun arrayContainsKey!0 (array!38383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642244 (arrayContainsKey!0 lt!297382 (select (arr!18408 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297390 () Unit!21726)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38383 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21726)

(assert (=> b!642244 (= lt!297390 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297382 (select (arr!18408 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!642245 () Bool)

(declare-fun e!367802 () Unit!21726)

(declare-fun Unit!21728 () Unit!21726)

(assert (=> b!642245 (= e!367802 Unit!21728)))

(assert (=> b!642245 false))

(declare-fun e!367800 () Bool)

(declare-fun b!642246 () Bool)

(assert (=> b!642246 (= e!367800 (arrayContainsKey!0 lt!297382 (select (arr!18408 a!2986) j!136) index!984))))

(declare-fun b!642247 () Bool)

(assert (=> b!642247 (= e!367797 e!367800)))

(declare-fun res!415980 () Bool)

(assert (=> b!642247 (=> (not res!415980) (not e!367800))))

(assert (=> b!642247 (= res!415980 (arrayContainsKey!0 lt!297382 (select (arr!18408 a!2986) j!136) j!136))))

(declare-fun b!642248 () Bool)

(declare-fun res!415983 () Bool)

(assert (=> b!642248 (=> (not res!415983) (not e!367795))))

(assert (=> b!642248 (= res!415983 (validKeyInArray!0 k!1786))))

(declare-fun b!642249 () Bool)

(declare-fun Unit!21729 () Unit!21726)

(assert (=> b!642249 (= e!367802 Unit!21729)))

(declare-fun b!642250 () Bool)

(declare-fun res!415989 () Bool)

(assert (=> b!642250 (=> res!415989 e!367793)))

(declare-fun noDuplicate!408 (List!12449) Bool)

(assert (=> b!642250 (= res!415989 (not (noDuplicate!408 Nil!12446)))))

(declare-fun b!642251 () Bool)

(assert (=> b!642251 (= e!367795 e!367792)))

(declare-fun res!415991 () Bool)

(assert (=> b!642251 (=> (not res!415991) (not e!367792))))

(declare-fun lt!297387 () SeekEntryResult!6848)

(assert (=> b!642251 (= res!415991 (or (= lt!297387 (MissingZero!6848 i!1108)) (= lt!297387 (MissingVacant!6848 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38383 (_ BitVec 32)) SeekEntryResult!6848)

(assert (=> b!642251 (= lt!297387 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!642252 () Bool)

(declare-fun res!415978 () Bool)

(assert (=> b!642252 (=> (not res!415978) (not e!367792))))

(assert (=> b!642252 (= res!415978 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18408 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642253 () Bool)

(declare-fun e!367791 () Bool)

(assert (=> b!642253 (= e!367791 e!367794)))

(declare-fun res!415985 () Bool)

(assert (=> b!642253 (=> res!415985 e!367794)))

(assert (=> b!642253 (= res!415985 (or (not (= (select (arr!18408 a!2986) j!136) lt!297392)) (not (= (select (arr!18408 a!2986) j!136) lt!297383)) (bvsge j!136 index!984)))))

(assert (=> b!642253 e!367796))

(declare-fun res!415975 () Bool)

(assert (=> b!642253 (=> (not res!415975) (not e!367796))))

(assert (=> b!642253 (= res!415975 (= lt!297383 (select (arr!18408 a!2986) j!136)))))

(assert (=> b!642253 (= lt!297383 (select (store (arr!18408 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!642254 () Bool)

(assert (=> b!642254 (= e!367798 (not e!367791))))

(declare-fun res!415990 () Bool)

(assert (=> b!642254 (=> res!415990 e!367791)))

(declare-fun lt!297388 () SeekEntryResult!6848)

(assert (=> b!642254 (= res!415990 (not (= lt!297388 (Found!6848 index!984))))))

(declare-fun lt!297386 () Unit!21726)

(assert (=> b!642254 (= lt!297386 e!367802)))

(declare-fun c!73499 () Bool)

(assert (=> b!642254 (= c!73499 (= lt!297388 Undefined!6848))))

(assert (=> b!642254 (= lt!297388 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297392 lt!297382 mask!3053))))

(assert (=> b!642254 e!367801))

(declare-fun res!415986 () Bool)

(assert (=> b!642254 (=> (not res!415986) (not e!367801))))

(declare-fun lt!297385 () (_ BitVec 32))

(assert (=> b!642254 (= res!415986 (= lt!297381 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297385 vacantSpotIndex!68 lt!297392 lt!297382 mask!3053)))))

(assert (=> b!642254 (= lt!297381 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297385 vacantSpotIndex!68 (select (arr!18408 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642254 (= lt!297392 (select (store (arr!18408 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!297393 () Unit!21726)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38383 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21726)

(assert (=> b!642254 (= lt!297393 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297385 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642254 (= lt!297385 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642255 () Bool)

(declare-fun res!415994 () Bool)

(assert (=> b!642255 (=> (not res!415994) (not e!367792))))

(assert (=> b!642255 (= res!415994 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12446))))

(declare-fun b!642256 () Bool)

(assert (=> b!642256 (= e!367793 true)))

(declare-fun lt!297389 () Bool)

(declare-fun contains!3136 (List!12449 (_ BitVec 64)) Bool)

(assert (=> b!642256 (= lt!297389 (contains!3136 Nil!12446 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642257 () Bool)

(declare-fun res!415993 () Bool)

(assert (=> b!642257 (=> res!415993 e!367793)))

(assert (=> b!642257 (= res!415993 (contains!3136 Nil!12446 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642258 () Bool)

(declare-fun res!415982 () Bool)

(assert (=> b!642258 (=> (not res!415982) (not e!367795))))

(assert (=> b!642258 (= res!415982 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642260 () Bool)

(assert (=> b!642260 (= e!367792 e!367799)))

(declare-fun res!415984 () Bool)

(assert (=> b!642260 (=> (not res!415984) (not e!367799))))

(assert (=> b!642260 (= res!415984 (= (select (store (arr!18408 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642260 (= lt!297382 (array!38384 (store (arr!18408 a!2986) i!1108 k!1786) (size!18772 a!2986)))))

(declare-fun b!642259 () Bool)

(declare-fun res!415979 () Bool)

(assert (=> b!642259 (=> (not res!415979) (not e!367795))))

(assert (=> b!642259 (= res!415979 (and (= (size!18772 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18772 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18772 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!415992 () Bool)

(assert (=> start!58124 (=> (not res!415992) (not e!367795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58124 (= res!415992 (validMask!0 mask!3053))))

(assert (=> start!58124 e!367795))

(assert (=> start!58124 true))

(declare-fun array_inv!14204 (array!38383) Bool)

(assert (=> start!58124 (array_inv!14204 a!2986)))

(assert (= (and start!58124 res!415992) b!642259))

(assert (= (and b!642259 res!415979) b!642240))

(assert (= (and b!642240 res!415976) b!642248))

(assert (= (and b!642248 res!415983) b!642258))

(assert (= (and b!642258 res!415982) b!642251))

(assert (= (and b!642251 res!415991) b!642243))

(assert (= (and b!642243 res!415987) b!642255))

(assert (= (and b!642255 res!415994) b!642252))

(assert (= (and b!642252 res!415978) b!642260))

(assert (= (and b!642260 res!415984) b!642239))

(assert (= (and b!642239 res!415988) b!642254))

(assert (= (and b!642254 res!415986) b!642242))

(assert (= (and b!642254 c!73499) b!642245))

(assert (= (and b!642254 (not c!73499)) b!642249))

(assert (= (and b!642254 (not res!415990)) b!642253))

(assert (= (and b!642253 res!415975) b!642241))

(assert (= (and b!642241 (not res!415977)) b!642247))

(assert (= (and b!642247 res!415980) b!642246))

(assert (= (and b!642253 (not res!415985)) b!642244))

(assert (= (and b!642244 (not res!415981)) b!642250))

(assert (= (and b!642250 (not res!415989)) b!642257))

(assert (= (and b!642257 (not res!415993)) b!642256))

(declare-fun m!616013 () Bool)

(assert (=> b!642257 m!616013))

(declare-fun m!616015 () Bool)

(assert (=> b!642255 m!616015))

(declare-fun m!616017 () Bool)

(assert (=> b!642241 m!616017))

(declare-fun m!616019 () Bool)

(assert (=> start!58124 m!616019))

(declare-fun m!616021 () Bool)

(assert (=> start!58124 m!616021))

(declare-fun m!616023 () Bool)

(assert (=> b!642243 m!616023))

(assert (=> b!642244 m!616017))

(assert (=> b!642244 m!616017))

(declare-fun m!616025 () Bool)

(assert (=> b!642244 m!616025))

(assert (=> b!642244 m!616017))

(declare-fun m!616027 () Bool)

(assert (=> b!642244 m!616027))

(declare-fun m!616029 () Bool)

(assert (=> b!642244 m!616029))

(declare-fun m!616031 () Bool)

(assert (=> b!642244 m!616031))

(declare-fun m!616033 () Bool)

(assert (=> b!642244 m!616033))

(declare-fun m!616035 () Bool)

(assert (=> b!642244 m!616035))

(declare-fun m!616037 () Bool)

(assert (=> b!642250 m!616037))

(assert (=> b!642246 m!616017))

(assert (=> b!642246 m!616017))

(declare-fun m!616039 () Bool)

(assert (=> b!642246 m!616039))

(declare-fun m!616041 () Bool)

(assert (=> b!642256 m!616041))

(declare-fun m!616043 () Bool)

(assert (=> b!642252 m!616043))

(assert (=> b!642240 m!616017))

(assert (=> b!642240 m!616017))

(declare-fun m!616045 () Bool)

(assert (=> b!642240 m!616045))

(assert (=> b!642253 m!616017))

(declare-fun m!616047 () Bool)

(assert (=> b!642253 m!616047))

(declare-fun m!616049 () Bool)

(assert (=> b!642253 m!616049))

(declare-fun m!616051 () Bool)

(assert (=> b!642254 m!616051))

(declare-fun m!616053 () Bool)

(assert (=> b!642254 m!616053))

(assert (=> b!642254 m!616017))

(declare-fun m!616055 () Bool)

(assert (=> b!642254 m!616055))

(assert (=> b!642254 m!616047))

(declare-fun m!616057 () Bool)

(assert (=> b!642254 m!616057))

(declare-fun m!616059 () Bool)

(assert (=> b!642254 m!616059))

(assert (=> b!642254 m!616017))

(declare-fun m!616061 () Bool)

(assert (=> b!642254 m!616061))

(declare-fun m!616063 () Bool)

(assert (=> b!642251 m!616063))

(declare-fun m!616065 () Bool)

(assert (=> b!642248 m!616065))

(assert (=> b!642247 m!616017))

(assert (=> b!642247 m!616017))

(declare-fun m!616067 () Bool)

(assert (=> b!642247 m!616067))

(declare-fun m!616069 () Bool)

(assert (=> b!642239 m!616069))

(assert (=> b!642239 m!616017))

(assert (=> b!642239 m!616017))

(declare-fun m!616071 () Bool)

(assert (=> b!642239 m!616071))

(declare-fun m!616073 () Bool)

(assert (=> b!642258 m!616073))

(assert (=> b!642260 m!616047))

(declare-fun m!616075 () Bool)

(assert (=> b!642260 m!616075))

(push 1)

