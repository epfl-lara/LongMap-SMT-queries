; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55584 () Bool)

(assert start!55584)

(declare-fun b!609212 () Bool)

(declare-datatypes ((Unit!19494 0))(
  ( (Unit!19495) )
))
(declare-fun e!348900 () Unit!19494)

(declare-fun Unit!19496 () Unit!19494)

(assert (=> b!609212 (= e!348900 Unit!19496)))

(assert (=> b!609212 false))

(declare-fun b!609213 () Bool)

(declare-fun res!391876 () Bool)

(declare-fun e!348903 () Bool)

(assert (=> b!609213 (=> (not res!391876) (not e!348903))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37329 0))(
  ( (array!37330 (arr!17915 (Array (_ BitVec 32) (_ BitVec 64))) (size!18280 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37329)

(assert (=> b!609213 (= res!391876 (and (= (size!18280 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18280 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18280 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!278377 () array!37329)

(declare-fun b!609214 () Bool)

(declare-fun e!348901 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609214 (= e!348901 (arrayContainsKey!0 lt!278377 (select (arr!17915 a!2986) j!136) index!984))))

(declare-fun b!609215 () Bool)

(declare-fun res!391873 () Bool)

(declare-fun e!348892 () Bool)

(assert (=> b!609215 (=> (not res!391873) (not e!348892))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!609215 (= res!391873 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17915 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609216 () Bool)

(declare-fun res!391878 () Bool)

(assert (=> b!609216 (=> (not res!391878) (not e!348903))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609216 (= res!391878 (validKeyInArray!0 k0!1786))))

(declare-fun b!609217 () Bool)

(declare-fun res!391875 () Bool)

(declare-fun e!348896 () Bool)

(assert (=> b!609217 (=> res!391875 e!348896)))

(declare-datatypes ((List!11995 0))(
  ( (Nil!11992) (Cons!11991 (h!13036 (_ BitVec 64)) (t!18214 List!11995)) )
))
(declare-fun contains!3017 (List!11995 (_ BitVec 64)) Bool)

(assert (=> b!609217 (= res!391875 (contains!3017 Nil!11992 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609218 () Bool)

(declare-fun Unit!19497 () Unit!19494)

(assert (=> b!609218 (= e!348900 Unit!19497)))

(declare-fun b!609219 () Bool)

(declare-fun res!391880 () Bool)

(assert (=> b!609219 (=> res!391880 e!348896)))

(declare-fun noDuplicate!344 (List!11995) Bool)

(assert (=> b!609219 (= res!391880 (not (noDuplicate!344 Nil!11992)))))

(declare-fun b!609220 () Bool)

(declare-fun e!348888 () Bool)

(assert (=> b!609220 (= e!348888 e!348896)))

(declare-fun res!391889 () Bool)

(assert (=> b!609220 (=> res!391889 e!348896)))

(assert (=> b!609220 (= res!391889 (or (bvsge (size!18280 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18280 a!2986))))))

(assert (=> b!609220 (arrayContainsKey!0 lt!278377 (select (arr!17915 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278381 () Unit!19494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37329 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19494)

(assert (=> b!609220 (= lt!278381 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278377 (select (arr!17915 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!609220 e!348901))

(declare-fun res!391884 () Bool)

(assert (=> b!609220 (=> (not res!391884) (not e!348901))))

(assert (=> b!609220 (= res!391884 (arrayContainsKey!0 lt!278377 (select (arr!17915 a!2986) j!136) j!136))))

(declare-fun b!609221 () Bool)

(assert (=> b!609221 (= e!348903 e!348892)))

(declare-fun res!391881 () Bool)

(assert (=> b!609221 (=> (not res!391881) (not e!348892))))

(declare-datatypes ((SeekEntryResult!6352 0))(
  ( (MissingZero!6352 (index!27683 (_ BitVec 32))) (Found!6352 (index!27684 (_ BitVec 32))) (Intermediate!6352 (undefined!7164 Bool) (index!27685 (_ BitVec 32)) (x!56496 (_ BitVec 32))) (Undefined!6352) (MissingVacant!6352 (index!27686 (_ BitVec 32))) )
))
(declare-fun lt!278376 () SeekEntryResult!6352)

(assert (=> b!609221 (= res!391881 (or (= lt!278376 (MissingZero!6352 i!1108)) (= lt!278376 (MissingVacant!6352 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37329 (_ BitVec 32)) SeekEntryResult!6352)

(assert (=> b!609221 (= lt!278376 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!609222 () Bool)

(declare-fun e!348891 () Unit!19494)

(declare-fun Unit!19498 () Unit!19494)

(assert (=> b!609222 (= e!348891 Unit!19498)))

(declare-fun lt!278387 () Unit!19494)

(assert (=> b!609222 (= lt!278387 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278377 (select (arr!17915 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609222 (arrayContainsKey!0 lt!278377 (select (arr!17915 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278391 () Unit!19494)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37329 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11995) Unit!19494)

(assert (=> b!609222 (= lt!278391 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11992))))

(declare-fun arrayNoDuplicates!0 (array!37329 (_ BitVec 32) List!11995) Bool)

(assert (=> b!609222 (arrayNoDuplicates!0 lt!278377 #b00000000000000000000000000000000 Nil!11992)))

(declare-fun lt!278386 () Unit!19494)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37329 (_ BitVec 32) (_ BitVec 32)) Unit!19494)

(assert (=> b!609222 (= lt!278386 (lemmaNoDuplicateFromThenFromBigger!0 lt!278377 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609222 (arrayNoDuplicates!0 lt!278377 j!136 Nil!11992)))

(declare-fun lt!278383 () Unit!19494)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37329 (_ BitVec 64) (_ BitVec 32) List!11995) Unit!19494)

(assert (=> b!609222 (= lt!278383 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278377 (select (arr!17915 a!2986) j!136) j!136 Nil!11992))))

(assert (=> b!609222 false))

(declare-fun res!391870 () Bool)

(assert (=> start!55584 (=> (not res!391870) (not e!348903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55584 (= res!391870 (validMask!0 mask!3053))))

(assert (=> start!55584 e!348903))

(assert (=> start!55584 true))

(declare-fun array_inv!13798 (array!37329) Bool)

(assert (=> start!55584 (array_inv!13798 a!2986)))

(declare-fun b!609223 () Bool)

(declare-fun res!391882 () Bool)

(assert (=> b!609223 (=> (not res!391882) (not e!348903))))

(assert (=> b!609223 (= res!391882 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609224 () Bool)

(declare-fun e!348898 () Bool)

(assert (=> b!609224 (= e!348898 (arrayContainsKey!0 lt!278377 (select (arr!17915 a!2986) j!136) index!984))))

(declare-fun b!609225 () Bool)

(declare-fun e!348889 () Bool)

(declare-fun e!348893 () Bool)

(assert (=> b!609225 (= e!348889 e!348893)))

(declare-fun res!391871 () Bool)

(assert (=> b!609225 (=> (not res!391871) (not e!348893))))

(declare-fun lt!278392 () SeekEntryResult!6352)

(assert (=> b!609225 (= res!391871 (and (= lt!278392 (Found!6352 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17915 a!2986) index!984) (select (arr!17915 a!2986) j!136))) (not (= (select (arr!17915 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37329 (_ BitVec 32)) SeekEntryResult!6352)

(assert (=> b!609225 (= lt!278392 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17915 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609226 () Bool)

(declare-fun e!348890 () Bool)

(declare-fun e!348899 () Bool)

(assert (=> b!609226 (= e!348890 e!348899)))

(declare-fun res!391891 () Bool)

(assert (=> b!609226 (=> res!391891 e!348899)))

(declare-fun lt!278382 () (_ BitVec 64))

(declare-fun lt!278379 () (_ BitVec 64))

(assert (=> b!609226 (= res!391891 (or (not (= (select (arr!17915 a!2986) j!136) lt!278382)) (not (= (select (arr!17915 a!2986) j!136) lt!278379))))))

(declare-fun e!348894 () Bool)

(assert (=> b!609226 e!348894))

(declare-fun res!391872 () Bool)

(assert (=> b!609226 (=> (not res!391872) (not e!348894))))

(assert (=> b!609226 (= res!391872 (= lt!278379 (select (arr!17915 a!2986) j!136)))))

(assert (=> b!609226 (= lt!278379 (select (store (arr!17915 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!609227 () Bool)

(declare-fun e!348897 () Bool)

(assert (=> b!609227 (= e!348897 e!348898)))

(declare-fun res!391887 () Bool)

(assert (=> b!609227 (=> (not res!391887) (not e!348898))))

(assert (=> b!609227 (= res!391887 (arrayContainsKey!0 lt!278377 (select (arr!17915 a!2986) j!136) j!136))))

(declare-fun b!609228 () Bool)

(declare-fun e!348895 () Bool)

(declare-fun lt!278380 () SeekEntryResult!6352)

(assert (=> b!609228 (= e!348895 (= lt!278392 lt!278380))))

(declare-fun b!609229 () Bool)

(declare-fun res!391892 () Bool)

(assert (=> b!609229 (=> (not res!391892) (not e!348903))))

(assert (=> b!609229 (= res!391892 (validKeyInArray!0 (select (arr!17915 a!2986) j!136)))))

(declare-fun b!609230 () Bool)

(assert (=> b!609230 (= e!348892 e!348889)))

(declare-fun res!391885 () Bool)

(assert (=> b!609230 (=> (not res!391885) (not e!348889))))

(assert (=> b!609230 (= res!391885 (= (select (store (arr!17915 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609230 (= lt!278377 (array!37330 (store (arr!17915 a!2986) i!1108 k0!1786) (size!18280 a!2986)))))

(declare-fun b!609231 () Bool)

(declare-fun Unit!19499 () Unit!19494)

(assert (=> b!609231 (= e!348891 Unit!19499)))

(declare-fun b!609232 () Bool)

(assert (=> b!609232 (= e!348893 (not e!348890))))

(declare-fun res!391890 () Bool)

(assert (=> b!609232 (=> res!391890 e!348890)))

(declare-fun lt!278388 () SeekEntryResult!6352)

(assert (=> b!609232 (= res!391890 (not (= lt!278388 (Found!6352 index!984))))))

(declare-fun lt!278384 () Unit!19494)

(assert (=> b!609232 (= lt!278384 e!348900)))

(declare-fun c!69038 () Bool)

(assert (=> b!609232 (= c!69038 (= lt!278388 Undefined!6352))))

(assert (=> b!609232 (= lt!278388 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278382 lt!278377 mask!3053))))

(assert (=> b!609232 e!348895))

(declare-fun res!391886 () Bool)

(assert (=> b!609232 (=> (not res!391886) (not e!348895))))

(declare-fun lt!278390 () (_ BitVec 32))

(assert (=> b!609232 (= res!391886 (= lt!278380 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278390 vacantSpotIndex!68 lt!278382 lt!278377 mask!3053)))))

(assert (=> b!609232 (= lt!278380 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278390 vacantSpotIndex!68 (select (arr!17915 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609232 (= lt!278382 (select (store (arr!17915 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278385 () Unit!19494)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19494)

(assert (=> b!609232 (= lt!278385 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278390 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609232 (= lt!278390 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609233 () Bool)

(assert (=> b!609233 (= e!348899 e!348888)))

(declare-fun res!391874 () Bool)

(assert (=> b!609233 (=> res!391874 e!348888)))

(assert (=> b!609233 (= res!391874 (bvsge index!984 j!136))))

(declare-fun lt!278378 () Unit!19494)

(assert (=> b!609233 (= lt!278378 e!348891)))

(declare-fun c!69039 () Bool)

(assert (=> b!609233 (= c!69039 (bvslt j!136 index!984))))

(declare-fun b!609234 () Bool)

(declare-fun res!391888 () Bool)

(assert (=> b!609234 (=> (not res!391888) (not e!348892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37329 (_ BitVec 32)) Bool)

(assert (=> b!609234 (= res!391888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609235 () Bool)

(declare-fun res!391879 () Bool)

(assert (=> b!609235 (=> res!391879 e!348896)))

(assert (=> b!609235 (= res!391879 (contains!3017 Nil!11992 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609236 () Bool)

(assert (=> b!609236 (= e!348896 true)))

(declare-fun lt!278389 () Bool)

(assert (=> b!609236 (= lt!278389 (contains!3017 Nil!11992 k0!1786))))

(declare-fun b!609237 () Bool)

(declare-fun res!391883 () Bool)

(assert (=> b!609237 (=> (not res!391883) (not e!348892))))

(assert (=> b!609237 (= res!391883 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11992))))

(declare-fun b!609238 () Bool)

(assert (=> b!609238 (= e!348894 e!348897)))

(declare-fun res!391877 () Bool)

(assert (=> b!609238 (=> res!391877 e!348897)))

(assert (=> b!609238 (= res!391877 (or (not (= (select (arr!17915 a!2986) j!136) lt!278382)) (not (= (select (arr!17915 a!2986) j!136) lt!278379)) (bvsge j!136 index!984)))))

(assert (= (and start!55584 res!391870) b!609213))

(assert (= (and b!609213 res!391876) b!609229))

(assert (= (and b!609229 res!391892) b!609216))

(assert (= (and b!609216 res!391878) b!609223))

(assert (= (and b!609223 res!391882) b!609221))

(assert (= (and b!609221 res!391881) b!609234))

(assert (= (and b!609234 res!391888) b!609237))

(assert (= (and b!609237 res!391883) b!609215))

(assert (= (and b!609215 res!391873) b!609230))

(assert (= (and b!609230 res!391885) b!609225))

(assert (= (and b!609225 res!391871) b!609232))

(assert (= (and b!609232 res!391886) b!609228))

(assert (= (and b!609232 c!69038) b!609212))

(assert (= (and b!609232 (not c!69038)) b!609218))

(assert (= (and b!609232 (not res!391890)) b!609226))

(assert (= (and b!609226 res!391872) b!609238))

(assert (= (and b!609238 (not res!391877)) b!609227))

(assert (= (and b!609227 res!391887) b!609224))

(assert (= (and b!609226 (not res!391891)) b!609233))

(assert (= (and b!609233 c!69039) b!609222))

(assert (= (and b!609233 (not c!69039)) b!609231))

(assert (= (and b!609233 (not res!391874)) b!609220))

(assert (= (and b!609220 res!391884) b!609214))

(assert (= (and b!609220 (not res!391889)) b!609219))

(assert (= (and b!609219 (not res!391880)) b!609217))

(assert (= (and b!609217 (not res!391875)) b!609235))

(assert (= (and b!609235 (not res!391879)) b!609236))

(declare-fun m!585223 () Bool)

(assert (=> b!609232 m!585223))

(declare-fun m!585225 () Bool)

(assert (=> b!609232 m!585225))

(declare-fun m!585227 () Bool)

(assert (=> b!609232 m!585227))

(declare-fun m!585229 () Bool)

(assert (=> b!609232 m!585229))

(declare-fun m!585231 () Bool)

(assert (=> b!609232 m!585231))

(declare-fun m!585233 () Bool)

(assert (=> b!609232 m!585233))

(declare-fun m!585235 () Bool)

(assert (=> b!609232 m!585235))

(assert (=> b!609232 m!585231))

(declare-fun m!585237 () Bool)

(assert (=> b!609232 m!585237))

(declare-fun m!585239 () Bool)

(assert (=> start!55584 m!585239))

(declare-fun m!585241 () Bool)

(assert (=> start!55584 m!585241))

(assert (=> b!609227 m!585231))

(assert (=> b!609227 m!585231))

(declare-fun m!585243 () Bool)

(assert (=> b!609227 m!585243))

(assert (=> b!609229 m!585231))

(assert (=> b!609229 m!585231))

(declare-fun m!585245 () Bool)

(assert (=> b!609229 m!585245))

(declare-fun m!585247 () Bool)

(assert (=> b!609217 m!585247))

(assert (=> b!609224 m!585231))

(assert (=> b!609224 m!585231))

(declare-fun m!585249 () Bool)

(assert (=> b!609224 m!585249))

(assert (=> b!609214 m!585231))

(assert (=> b!609214 m!585231))

(assert (=> b!609214 m!585249))

(assert (=> b!609238 m!585231))

(declare-fun m!585251 () Bool)

(assert (=> b!609235 m!585251))

(declare-fun m!585253 () Bool)

(assert (=> b!609236 m!585253))

(assert (=> b!609222 m!585231))

(declare-fun m!585255 () Bool)

(assert (=> b!609222 m!585255))

(assert (=> b!609222 m!585231))

(assert (=> b!609222 m!585231))

(declare-fun m!585257 () Bool)

(assert (=> b!609222 m!585257))

(assert (=> b!609222 m!585231))

(declare-fun m!585259 () Bool)

(assert (=> b!609222 m!585259))

(declare-fun m!585261 () Bool)

(assert (=> b!609222 m!585261))

(declare-fun m!585263 () Bool)

(assert (=> b!609222 m!585263))

(declare-fun m!585265 () Bool)

(assert (=> b!609222 m!585265))

(declare-fun m!585267 () Bool)

(assert (=> b!609222 m!585267))

(declare-fun m!585269 () Bool)

(assert (=> b!609219 m!585269))

(declare-fun m!585271 () Bool)

(assert (=> b!609237 m!585271))

(assert (=> b!609226 m!585231))

(assert (=> b!609226 m!585227))

(declare-fun m!585273 () Bool)

(assert (=> b!609226 m!585273))

(declare-fun m!585275 () Bool)

(assert (=> b!609221 m!585275))

(assert (=> b!609220 m!585231))

(assert (=> b!609220 m!585231))

(declare-fun m!585277 () Bool)

(assert (=> b!609220 m!585277))

(assert (=> b!609220 m!585231))

(declare-fun m!585279 () Bool)

(assert (=> b!609220 m!585279))

(assert (=> b!609220 m!585231))

(assert (=> b!609220 m!585243))

(declare-fun m!585281 () Bool)

(assert (=> b!609225 m!585281))

(assert (=> b!609225 m!585231))

(assert (=> b!609225 m!585231))

(declare-fun m!585283 () Bool)

(assert (=> b!609225 m!585283))

(declare-fun m!585285 () Bool)

(assert (=> b!609215 m!585285))

(assert (=> b!609230 m!585227))

(declare-fun m!585287 () Bool)

(assert (=> b!609230 m!585287))

(declare-fun m!585289 () Bool)

(assert (=> b!609223 m!585289))

(declare-fun m!585291 () Bool)

(assert (=> b!609216 m!585291))

(declare-fun m!585293 () Bool)

(assert (=> b!609234 m!585293))

(check-sat (not b!609220) (not b!609224) (not b!609236) (not b!609232) (not b!609217) (not b!609225) (not b!609221) (not b!609235) (not b!609237) (not b!609216) (not b!609229) (not b!609227) (not start!55584) (not b!609234) (not b!609223) (not b!609219) (not b!609222) (not b!609214))
(check-sat)
