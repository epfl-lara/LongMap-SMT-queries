; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56148 () Bool)

(assert start!56148)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!621146 () Bool)

(declare-datatypes ((array!37632 0))(
  ( (array!37633 (arr!18062 (Array (_ BitVec 32) (_ BitVec 64))) (size!18427 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37632)

(declare-fun lt!287310 () array!37632)

(declare-fun res!400328 () Bool)

(declare-fun arrayContainsKey!0 (array!37632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621146 (= res!400328 (arrayContainsKey!0 lt!287310 (select (arr!18062 a!2986) j!136) j!136))))

(declare-fun e!356244 () Bool)

(assert (=> b!621146 (=> (not res!400328) (not e!356244))))

(declare-fun e!356248 () Bool)

(assert (=> b!621146 (= e!356248 e!356244)))

(declare-fun b!621147 () Bool)

(declare-fun res!400324 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!621147 (= res!400324 (bvsge j!136 index!984))))

(assert (=> b!621147 (=> res!400324 e!356248)))

(declare-fun e!356251 () Bool)

(assert (=> b!621147 (= e!356251 e!356248)))

(declare-fun b!621148 () Bool)

(declare-fun res!400330 () Bool)

(declare-fun e!356253 () Bool)

(assert (=> b!621148 (=> (not res!400330) (not e!356253))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!621148 (= res!400330 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621150 () Bool)

(declare-fun e!356249 () Bool)

(assert (=> b!621150 (= e!356253 e!356249)))

(declare-fun res!400327 () Bool)

(assert (=> b!621150 (=> (not res!400327) (not e!356249))))

(declare-datatypes ((SeekEntryResult!6499 0))(
  ( (MissingZero!6499 (index!28280 (_ BitVec 32))) (Found!6499 (index!28281 (_ BitVec 32))) (Intermediate!6499 (undefined!7311 Bool) (index!28282 (_ BitVec 32)) (x!57062 (_ BitVec 32))) (Undefined!6499) (MissingVacant!6499 (index!28283 (_ BitVec 32))) )
))
(declare-fun lt!287317 () SeekEntryResult!6499)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!621150 (= res!400327 (or (= lt!287317 (MissingZero!6499 i!1108)) (= lt!287317 (MissingVacant!6499 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37632 (_ BitVec 32)) SeekEntryResult!6499)

(assert (=> b!621150 (= lt!287317 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!621151 () Bool)

(declare-datatypes ((Unit!20736 0))(
  ( (Unit!20737) )
))
(declare-fun e!356252 () Unit!20736)

(declare-fun Unit!20738 () Unit!20736)

(assert (=> b!621151 (= e!356252 Unit!20738)))

(declare-fun b!621152 () Bool)

(declare-fun res!400331 () Bool)

(assert (=> b!621152 (=> (not res!400331) (not e!356249))))

(declare-datatypes ((List!12142 0))(
  ( (Nil!12139) (Cons!12138 (h!13183 (_ BitVec 64)) (t!18361 List!12142)) )
))
(declare-fun arrayNoDuplicates!0 (array!37632 (_ BitVec 32) List!12142) Bool)

(assert (=> b!621152 (= res!400331 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12139))))

(declare-fun b!621153 () Bool)

(declare-fun res!400335 () Bool)

(assert (=> b!621153 (=> (not res!400335) (not e!356249))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!621153 (= res!400335 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18062 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621154 () Bool)

(declare-fun e!356243 () Bool)

(declare-fun lt!287313 () SeekEntryResult!6499)

(declare-fun lt!287319 () SeekEntryResult!6499)

(assert (=> b!621154 (= e!356243 (= lt!287313 lt!287319))))

(declare-fun b!621155 () Bool)

(declare-fun e!356254 () Bool)

(declare-fun e!356250 () Bool)

(assert (=> b!621155 (= e!356254 e!356250)))

(declare-fun res!400336 () Bool)

(assert (=> b!621155 (=> (not res!400336) (not e!356250))))

(assert (=> b!621155 (= res!400336 (and (= lt!287313 (Found!6499 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18062 a!2986) index!984) (select (arr!18062 a!2986) j!136))) (not (= (select (arr!18062 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37632 (_ BitVec 32)) SeekEntryResult!6499)

(assert (=> b!621155 (= lt!287313 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18062 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621156 () Bool)

(declare-fun e!356245 () Unit!20736)

(declare-fun Unit!20739 () Unit!20736)

(assert (=> b!621156 (= e!356245 Unit!20739)))

(declare-fun b!621157 () Bool)

(assert (=> b!621157 (= e!356244 (arrayContainsKey!0 lt!287310 (select (arr!18062 a!2986) j!136) index!984))))

(declare-fun b!621158 () Bool)

(assert (=> b!621158 false))

(declare-fun lt!287321 () Unit!20736)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37632 (_ BitVec 64) (_ BitVec 32) List!12142) Unit!20736)

(assert (=> b!621158 (= lt!287321 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287310 (select (arr!18062 a!2986) j!136) j!136 Nil!12139))))

(assert (=> b!621158 (arrayNoDuplicates!0 lt!287310 j!136 Nil!12139)))

(declare-fun lt!287309 () Unit!20736)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37632 (_ BitVec 32) (_ BitVec 32)) Unit!20736)

(assert (=> b!621158 (= lt!287309 (lemmaNoDuplicateFromThenFromBigger!0 lt!287310 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621158 (arrayNoDuplicates!0 lt!287310 #b00000000000000000000000000000000 Nil!12139)))

(declare-fun lt!287318 () Unit!20736)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37632 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12142) Unit!20736)

(assert (=> b!621158 (= lt!287318 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12139))))

(assert (=> b!621158 (arrayContainsKey!0 lt!287310 (select (arr!18062 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287315 () Unit!20736)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37632 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20736)

(assert (=> b!621158 (= lt!287315 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287310 (select (arr!18062 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356256 () Unit!20736)

(declare-fun Unit!20740 () Unit!20736)

(assert (=> b!621158 (= e!356256 Unit!20740)))

(declare-fun b!621159 () Bool)

(assert (=> b!621159 (= e!356249 e!356254)))

(declare-fun res!400325 () Bool)

(assert (=> b!621159 (=> (not res!400325) (not e!356254))))

(assert (=> b!621159 (= res!400325 (= (select (store (arr!18062 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621159 (= lt!287310 (array!37633 (store (arr!18062 a!2986) i!1108 k0!1786) (size!18427 a!2986)))))

(declare-fun b!621160 () Bool)

(declare-fun e!356246 () Unit!20736)

(declare-fun Unit!20741 () Unit!20736)

(assert (=> b!621160 (= e!356246 Unit!20741)))

(declare-fun b!621161 () Bool)

(declare-fun e!356247 () Bool)

(assert (=> b!621161 (= e!356247 (arrayContainsKey!0 lt!287310 (select (arr!18062 a!2986) j!136) index!984))))

(declare-fun res!400323 () Bool)

(assert (=> start!56148 (=> (not res!400323) (not e!356253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56148 (= res!400323 (validMask!0 mask!3053))))

(assert (=> start!56148 e!356253))

(assert (=> start!56148 true))

(declare-fun array_inv!13945 (array!37632) Bool)

(assert (=> start!56148 (array_inv!13945 a!2986)))

(declare-fun b!621149 () Bool)

(declare-fun Unit!20742 () Unit!20736)

(assert (=> b!621149 (= e!356256 Unit!20742)))

(declare-fun b!621162 () Bool)

(declare-fun Unit!20743 () Unit!20736)

(assert (=> b!621162 (= e!356252 Unit!20743)))

(assert (=> b!621162 false))

(declare-fun b!621163 () Bool)

(declare-fun res!400337 () Bool)

(assert (=> b!621163 (=> (not res!400337) (not e!356253))))

(assert (=> b!621163 (= res!400337 (and (= (size!18427 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18427 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18427 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621164 () Bool)

(declare-fun Unit!20744 () Unit!20736)

(assert (=> b!621164 (= e!356246 Unit!20744)))

(declare-fun res!400326 () Bool)

(assert (=> b!621164 (= res!400326 (= (select (store (arr!18062 a!2986) i!1108 k0!1786) index!984) (select (arr!18062 a!2986) j!136)))))

(assert (=> b!621164 (=> (not res!400326) (not e!356251))))

(assert (=> b!621164 e!356251))

(declare-fun c!70781 () Bool)

(assert (=> b!621164 (= c!70781 (bvslt j!136 index!984))))

(declare-fun lt!287304 () Unit!20736)

(assert (=> b!621164 (= lt!287304 e!356256)))

(declare-fun c!70780 () Bool)

(assert (=> b!621164 (= c!70780 (bvslt index!984 j!136))))

(declare-fun lt!287311 () Unit!20736)

(assert (=> b!621164 (= lt!287311 e!356245)))

(assert (=> b!621164 false))

(declare-fun b!621165 () Bool)

(declare-fun res!400329 () Bool)

(assert (=> b!621165 (=> (not res!400329) (not e!356253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621165 (= res!400329 (validKeyInArray!0 k0!1786))))

(declare-fun b!621166 () Bool)

(declare-fun res!400333 () Bool)

(assert (=> b!621166 (=> (not res!400333) (not e!356253))))

(assert (=> b!621166 (= res!400333 (validKeyInArray!0 (select (arr!18062 a!2986) j!136)))))

(declare-fun b!621167 () Bool)

(declare-fun res!400322 () Bool)

(assert (=> b!621167 (=> (not res!400322) (not e!356249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37632 (_ BitVec 32)) Bool)

(assert (=> b!621167 (= res!400322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621168 () Bool)

(assert (=> b!621168 (= e!356250 (not true))))

(declare-fun lt!287323 () Unit!20736)

(assert (=> b!621168 (= lt!287323 e!356246)))

(declare-fun c!70782 () Bool)

(declare-fun lt!287314 () SeekEntryResult!6499)

(assert (=> b!621168 (= c!70782 (= lt!287314 (Found!6499 index!984)))))

(declare-fun lt!287320 () Unit!20736)

(assert (=> b!621168 (= lt!287320 e!356252)))

(declare-fun c!70779 () Bool)

(assert (=> b!621168 (= c!70779 (= lt!287314 Undefined!6499))))

(declare-fun lt!287305 () (_ BitVec 64))

(assert (=> b!621168 (= lt!287314 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287305 lt!287310 mask!3053))))

(assert (=> b!621168 e!356243))

(declare-fun res!400332 () Bool)

(assert (=> b!621168 (=> (not res!400332) (not e!356243))))

(declare-fun lt!287322 () (_ BitVec 32))

(assert (=> b!621168 (= res!400332 (= lt!287319 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287322 vacantSpotIndex!68 lt!287305 lt!287310 mask!3053)))))

(assert (=> b!621168 (= lt!287319 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287322 vacantSpotIndex!68 (select (arr!18062 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621168 (= lt!287305 (select (store (arr!18062 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287312 () Unit!20736)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37632 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20736)

(assert (=> b!621168 (= lt!287312 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287322 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621168 (= lt!287322 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621169 () Bool)

(assert (=> b!621169 false))

(declare-fun lt!287316 () Unit!20736)

(assert (=> b!621169 (= lt!287316 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287310 (select (arr!18062 a!2986) j!136) index!984 Nil!12139))))

(assert (=> b!621169 (arrayNoDuplicates!0 lt!287310 index!984 Nil!12139)))

(declare-fun lt!287307 () Unit!20736)

(assert (=> b!621169 (= lt!287307 (lemmaNoDuplicateFromThenFromBigger!0 lt!287310 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621169 (arrayNoDuplicates!0 lt!287310 #b00000000000000000000000000000000 Nil!12139)))

(declare-fun lt!287306 () Unit!20736)

(assert (=> b!621169 (= lt!287306 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12139))))

(assert (=> b!621169 (arrayContainsKey!0 lt!287310 (select (arr!18062 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287308 () Unit!20736)

(assert (=> b!621169 (= lt!287308 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287310 (select (arr!18062 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621169 e!356247))

(declare-fun res!400334 () Bool)

(assert (=> b!621169 (=> (not res!400334) (not e!356247))))

(assert (=> b!621169 (= res!400334 (arrayContainsKey!0 lt!287310 (select (arr!18062 a!2986) j!136) j!136))))

(declare-fun Unit!20745 () Unit!20736)

(assert (=> b!621169 (= e!356245 Unit!20745)))

(assert (= (and start!56148 res!400323) b!621163))

(assert (= (and b!621163 res!400337) b!621166))

(assert (= (and b!621166 res!400333) b!621165))

(assert (= (and b!621165 res!400329) b!621148))

(assert (= (and b!621148 res!400330) b!621150))

(assert (= (and b!621150 res!400327) b!621167))

(assert (= (and b!621167 res!400322) b!621152))

(assert (= (and b!621152 res!400331) b!621153))

(assert (= (and b!621153 res!400335) b!621159))

(assert (= (and b!621159 res!400325) b!621155))

(assert (= (and b!621155 res!400336) b!621168))

(assert (= (and b!621168 res!400332) b!621154))

(assert (= (and b!621168 c!70779) b!621162))

(assert (= (and b!621168 (not c!70779)) b!621151))

(assert (= (and b!621168 c!70782) b!621164))

(assert (= (and b!621168 (not c!70782)) b!621160))

(assert (= (and b!621164 res!400326) b!621147))

(assert (= (and b!621147 (not res!400324)) b!621146))

(assert (= (and b!621146 res!400328) b!621157))

(assert (= (and b!621164 c!70781) b!621158))

(assert (= (and b!621164 (not c!70781)) b!621149))

(assert (= (and b!621164 c!70780) b!621169))

(assert (= (and b!621164 (not c!70780)) b!621156))

(assert (= (and b!621169 res!400334) b!621161))

(declare-fun m!596539 () Bool)

(assert (=> b!621168 m!596539))

(declare-fun m!596541 () Bool)

(assert (=> b!621168 m!596541))

(declare-fun m!596543 () Bool)

(assert (=> b!621168 m!596543))

(declare-fun m!596545 () Bool)

(assert (=> b!621168 m!596545))

(declare-fun m!596547 () Bool)

(assert (=> b!621168 m!596547))

(declare-fun m!596549 () Bool)

(assert (=> b!621168 m!596549))

(assert (=> b!621168 m!596543))

(declare-fun m!596551 () Bool)

(assert (=> b!621168 m!596551))

(declare-fun m!596553 () Bool)

(assert (=> b!621168 m!596553))

(assert (=> b!621146 m!596543))

(assert (=> b!621146 m!596543))

(declare-fun m!596555 () Bool)

(assert (=> b!621146 m!596555))

(declare-fun m!596557 () Bool)

(assert (=> b!621169 m!596557))

(declare-fun m!596559 () Bool)

(assert (=> b!621169 m!596559))

(assert (=> b!621169 m!596543))

(assert (=> b!621169 m!596543))

(assert (=> b!621169 m!596555))

(assert (=> b!621169 m!596543))

(declare-fun m!596561 () Bool)

(assert (=> b!621169 m!596561))

(assert (=> b!621169 m!596543))

(declare-fun m!596563 () Bool)

(assert (=> b!621169 m!596563))

(declare-fun m!596565 () Bool)

(assert (=> b!621169 m!596565))

(assert (=> b!621169 m!596543))

(declare-fun m!596567 () Bool)

(assert (=> b!621169 m!596567))

(declare-fun m!596569 () Bool)

(assert (=> b!621169 m!596569))

(assert (=> b!621157 m!596543))

(assert (=> b!621157 m!596543))

(declare-fun m!596571 () Bool)

(assert (=> b!621157 m!596571))

(declare-fun m!596573 () Bool)

(assert (=> b!621153 m!596573))

(declare-fun m!596575 () Bool)

(assert (=> b!621152 m!596575))

(declare-fun m!596577 () Bool)

(assert (=> b!621148 m!596577))

(assert (=> b!621158 m!596557))

(assert (=> b!621158 m!596543))

(declare-fun m!596579 () Bool)

(assert (=> b!621158 m!596579))

(assert (=> b!621158 m!596543))

(declare-fun m!596581 () Bool)

(assert (=> b!621158 m!596581))

(assert (=> b!621158 m!596543))

(declare-fun m!596583 () Bool)

(assert (=> b!621158 m!596583))

(assert (=> b!621158 m!596565))

(assert (=> b!621158 m!596543))

(declare-fun m!596585 () Bool)

(assert (=> b!621158 m!596585))

(declare-fun m!596587 () Bool)

(assert (=> b!621158 m!596587))

(declare-fun m!596589 () Bool)

(assert (=> b!621165 m!596589))

(assert (=> b!621159 m!596545))

(declare-fun m!596591 () Bool)

(assert (=> b!621159 m!596591))

(assert (=> b!621161 m!596543))

(assert (=> b!621161 m!596543))

(assert (=> b!621161 m!596571))

(assert (=> b!621164 m!596545))

(declare-fun m!596593 () Bool)

(assert (=> b!621164 m!596593))

(assert (=> b!621164 m!596543))

(declare-fun m!596595 () Bool)

(assert (=> b!621155 m!596595))

(assert (=> b!621155 m!596543))

(assert (=> b!621155 m!596543))

(declare-fun m!596597 () Bool)

(assert (=> b!621155 m!596597))

(declare-fun m!596599 () Bool)

(assert (=> b!621150 m!596599))

(declare-fun m!596601 () Bool)

(assert (=> b!621167 m!596601))

(assert (=> b!621166 m!596543))

(assert (=> b!621166 m!596543))

(declare-fun m!596603 () Bool)

(assert (=> b!621166 m!596603))

(declare-fun m!596605 () Bool)

(assert (=> start!56148 m!596605))

(declare-fun m!596607 () Bool)

(assert (=> start!56148 m!596607))

(check-sat (not b!621152) (not b!621155) (not b!621167) (not b!621166) (not start!56148) (not b!621148) (not b!621161) (not b!621169) (not b!621146) (not b!621158) (not b!621157) (not b!621165) (not b!621150) (not b!621168))
(check-sat)
