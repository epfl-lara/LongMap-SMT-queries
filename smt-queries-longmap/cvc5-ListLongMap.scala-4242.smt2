; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58646 () Bool)

(assert start!58646)

(declare-fun b!647170 () Bool)

(declare-fun e!371060 () Bool)

(declare-fun e!371046 () Bool)

(assert (=> b!647170 (= e!371060 e!371046)))

(declare-fun res!419329 () Bool)

(assert (=> b!647170 (=> (not res!419329) (not e!371046))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38494 0))(
  ( (array!38495 (arr!18456 (Array (_ BitVec 32) (_ BitVec 64))) (size!18820 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38494)

(assert (=> b!647170 (= res!419329 (= (select (store (arr!18456 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!300316 () array!38494)

(assert (=> b!647170 (= lt!300316 (array!38495 (store (arr!18456 a!2986) i!1108 k!1786) (size!18820 a!2986)))))

(declare-fun b!647171 () Bool)

(declare-fun res!419312 () Bool)

(declare-fun e!371048 () Bool)

(assert (=> b!647171 (=> (not res!419312) (not e!371048))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!647171 (= res!419312 (validKeyInArray!0 (select (arr!18456 a!2986) j!136)))))

(declare-fun b!647172 () Bool)

(declare-fun e!371052 () Bool)

(declare-datatypes ((List!12497 0))(
  ( (Nil!12494) (Cons!12493 (h!13538 (_ BitVec 64)) (t!18725 List!12497)) )
))
(declare-fun contains!3152 (List!12497 (_ BitVec 64)) Bool)

(assert (=> b!647172 (= e!371052 (not (contains!3152 Nil!12494 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647173 () Bool)

(declare-fun res!419325 () Bool)

(assert (=> b!647173 (=> (not res!419325) (not e!371060))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38494 (_ BitVec 32)) Bool)

(assert (=> b!647173 (= res!419325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!647174 () Bool)

(declare-fun res!419333 () Bool)

(assert (=> b!647174 (=> (not res!419333) (not e!371048))))

(declare-fun arrayContainsKey!0 (array!38494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!647174 (= res!419333 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!647175 () Bool)

(declare-fun res!419324 () Bool)

(declare-fun e!371059 () Bool)

(assert (=> b!647175 (=> res!419324 e!371059)))

(declare-fun noDuplicate!414 (List!12497) Bool)

(assert (=> b!647175 (= res!419324 (not (noDuplicate!414 Nil!12494)))))

(declare-fun b!647176 () Bool)

(declare-fun res!419318 () Bool)

(assert (=> b!647176 (=> (not res!419318) (not e!371060))))

(declare-fun arrayNoDuplicates!0 (array!38494 (_ BitVec 32) List!12497) Bool)

(assert (=> b!647176 (= res!419318 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12494))))

(declare-fun b!647178 () Bool)

(declare-fun e!371053 () Bool)

(declare-fun e!371050 () Bool)

(assert (=> b!647178 (= e!371053 e!371050)))

(declare-fun res!419323 () Bool)

(assert (=> b!647178 (=> res!419323 e!371050)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!647178 (= res!419323 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22002 0))(
  ( (Unit!22003) )
))
(declare-fun lt!300318 () Unit!22002)

(declare-fun e!371057 () Unit!22002)

(assert (=> b!647178 (= lt!300318 e!371057)))

(declare-fun c!74297 () Bool)

(assert (=> b!647178 (= c!74297 (bvslt j!136 index!984))))

(declare-fun b!647179 () Bool)

(assert (=> b!647179 (= e!371048 e!371060)))

(declare-fun res!419314 () Bool)

(assert (=> b!647179 (=> (not res!419314) (not e!371060))))

(declare-datatypes ((SeekEntryResult!6896 0))(
  ( (MissingZero!6896 (index!29925 (_ BitVec 32))) (Found!6896 (index!29926 (_ BitVec 32))) (Intermediate!6896 (undefined!7708 Bool) (index!29927 (_ BitVec 32)) (x!58707 (_ BitVec 32))) (Undefined!6896) (MissingVacant!6896 (index!29928 (_ BitVec 32))) )
))
(declare-fun lt!300312 () SeekEntryResult!6896)

(assert (=> b!647179 (= res!419314 (or (= lt!300312 (MissingZero!6896 i!1108)) (= lt!300312 (MissingVacant!6896 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38494 (_ BitVec 32)) SeekEntryResult!6896)

(assert (=> b!647179 (= lt!300312 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!647180 () Bool)

(declare-fun e!371055 () Bool)

(assert (=> b!647180 (= e!371055 e!371053)))

(declare-fun res!419315 () Bool)

(assert (=> b!647180 (=> res!419315 e!371053)))

(declare-fun lt!300321 () (_ BitVec 64))

(declare-fun lt!300309 () (_ BitVec 64))

(assert (=> b!647180 (= res!419315 (or (not (= (select (arr!18456 a!2986) j!136) lt!300309)) (not (= (select (arr!18456 a!2986) j!136) lt!300321))))))

(declare-fun e!371056 () Bool)

(assert (=> b!647180 e!371056))

(declare-fun res!419317 () Bool)

(assert (=> b!647180 (=> (not res!419317) (not e!371056))))

(assert (=> b!647180 (= res!419317 (= lt!300321 (select (arr!18456 a!2986) j!136)))))

(assert (=> b!647180 (= lt!300321 (select (store (arr!18456 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!647181 () Bool)

(assert (=> b!647181 (= e!371059 e!371052)))

(declare-fun res!419328 () Bool)

(assert (=> b!647181 (=> (not res!419328) (not e!371052))))

(assert (=> b!647181 (= res!419328 (not (contains!3152 Nil!12494 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647182 () Bool)

(declare-fun e!371047 () Unit!22002)

(declare-fun Unit!22004 () Unit!22002)

(assert (=> b!647182 (= e!371047 Unit!22004)))

(assert (=> b!647182 false))

(declare-fun b!647183 () Bool)

(declare-fun e!371058 () Bool)

(declare-fun e!371051 () Bool)

(assert (=> b!647183 (= e!371058 e!371051)))

(declare-fun res!419327 () Bool)

(assert (=> b!647183 (=> (not res!419327) (not e!371051))))

(assert (=> b!647183 (= res!419327 (arrayContainsKey!0 lt!300316 (select (arr!18456 a!2986) j!136) j!136))))

(declare-fun b!647184 () Bool)

(declare-fun Unit!22005 () Unit!22002)

(assert (=> b!647184 (= e!371047 Unit!22005)))

(declare-fun b!647185 () Bool)

(declare-fun Unit!22006 () Unit!22002)

(assert (=> b!647185 (= e!371057 Unit!22006)))

(declare-fun lt!300317 () Unit!22002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38494 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22002)

(assert (=> b!647185 (= lt!300317 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300316 (select (arr!18456 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!647185 (arrayContainsKey!0 lt!300316 (select (arr!18456 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300320 () Unit!22002)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38494 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12497) Unit!22002)

(assert (=> b!647185 (= lt!300320 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12494))))

(assert (=> b!647185 (arrayNoDuplicates!0 lt!300316 #b00000000000000000000000000000000 Nil!12494)))

(declare-fun lt!300308 () Unit!22002)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38494 (_ BitVec 32) (_ BitVec 32)) Unit!22002)

(assert (=> b!647185 (= lt!300308 (lemmaNoDuplicateFromThenFromBigger!0 lt!300316 #b00000000000000000000000000000000 j!136))))

(assert (=> b!647185 (arrayNoDuplicates!0 lt!300316 j!136 Nil!12494)))

(declare-fun lt!300314 () Unit!22002)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38494 (_ BitVec 64) (_ BitVec 32) List!12497) Unit!22002)

(assert (=> b!647185 (= lt!300314 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300316 (select (arr!18456 a!2986) j!136) j!136 Nil!12494))))

(assert (=> b!647185 false))

(declare-fun b!647186 () Bool)

(declare-fun e!371054 () Bool)

(declare-fun lt!300307 () SeekEntryResult!6896)

(declare-fun lt!300319 () SeekEntryResult!6896)

(assert (=> b!647186 (= e!371054 (= lt!300307 lt!300319))))

(declare-fun e!371049 () Bool)

(declare-fun b!647187 () Bool)

(assert (=> b!647187 (= e!371049 (arrayContainsKey!0 lt!300316 (select (arr!18456 a!2986) j!136) index!984))))

(declare-fun b!647188 () Bool)

(declare-fun e!371045 () Bool)

(assert (=> b!647188 (= e!371046 e!371045)))

(declare-fun res!419331 () Bool)

(assert (=> b!647188 (=> (not res!419331) (not e!371045))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!647188 (= res!419331 (and (= lt!300307 (Found!6896 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18456 a!2986) index!984) (select (arr!18456 a!2986) j!136))) (not (= (select (arr!18456 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38494 (_ BitVec 32)) SeekEntryResult!6896)

(assert (=> b!647188 (= lt!300307 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18456 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!647189 () Bool)

(assert (=> b!647189 (= e!371051 (arrayContainsKey!0 lt!300316 (select (arr!18456 a!2986) j!136) index!984))))

(declare-fun b!647190 () Bool)

(declare-fun res!419320 () Bool)

(assert (=> b!647190 (=> (not res!419320) (not e!371048))))

(assert (=> b!647190 (= res!419320 (and (= (size!18820 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18820 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18820 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!647191 () Bool)

(declare-fun res!419332 () Bool)

(assert (=> b!647191 (=> (not res!419332) (not e!371048))))

(assert (=> b!647191 (= res!419332 (validKeyInArray!0 k!1786))))

(declare-fun res!419313 () Bool)

(assert (=> start!58646 (=> (not res!419313) (not e!371048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58646 (= res!419313 (validMask!0 mask!3053))))

(assert (=> start!58646 e!371048))

(assert (=> start!58646 true))

(declare-fun array_inv!14252 (array!38494) Bool)

(assert (=> start!58646 (array_inv!14252 a!2986)))

(declare-fun b!647177 () Bool)

(assert (=> b!647177 (= e!371056 e!371058)))

(declare-fun res!419326 () Bool)

(assert (=> b!647177 (=> res!419326 e!371058)))

(assert (=> b!647177 (= res!419326 (or (not (= (select (arr!18456 a!2986) j!136) lt!300309)) (not (= (select (arr!18456 a!2986) j!136) lt!300321)) (bvsge j!136 index!984)))))

(declare-fun b!647192 () Bool)

(declare-fun res!419330 () Bool)

(assert (=> b!647192 (=> (not res!419330) (not e!371060))))

(assert (=> b!647192 (= res!419330 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18456 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647193 () Bool)

(declare-fun Unit!22007 () Unit!22002)

(assert (=> b!647193 (= e!371057 Unit!22007)))

(declare-fun b!647194 () Bool)

(assert (=> b!647194 (= e!371050 e!371059)))

(declare-fun res!419321 () Bool)

(assert (=> b!647194 (=> res!419321 e!371059)))

(assert (=> b!647194 (= res!419321 (or (bvsge (size!18820 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18820 a!2986))))))

(assert (=> b!647194 (arrayContainsKey!0 lt!300316 (select (arr!18456 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300313 () Unit!22002)

(assert (=> b!647194 (= lt!300313 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300316 (select (arr!18456 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!647194 e!371049))

(declare-fun res!419316 () Bool)

(assert (=> b!647194 (=> (not res!419316) (not e!371049))))

(assert (=> b!647194 (= res!419316 (arrayContainsKey!0 lt!300316 (select (arr!18456 a!2986) j!136) j!136))))

(declare-fun b!647195 () Bool)

(assert (=> b!647195 (= e!371045 (not e!371055))))

(declare-fun res!419319 () Bool)

(assert (=> b!647195 (=> res!419319 e!371055)))

(declare-fun lt!300322 () SeekEntryResult!6896)

(assert (=> b!647195 (= res!419319 (not (= lt!300322 (Found!6896 index!984))))))

(declare-fun lt!300311 () Unit!22002)

(assert (=> b!647195 (= lt!300311 e!371047)))

(declare-fun c!74296 () Bool)

(assert (=> b!647195 (= c!74296 (= lt!300322 Undefined!6896))))

(assert (=> b!647195 (= lt!300322 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300309 lt!300316 mask!3053))))

(assert (=> b!647195 e!371054))

(declare-fun res!419322 () Bool)

(assert (=> b!647195 (=> (not res!419322) (not e!371054))))

(declare-fun lt!300315 () (_ BitVec 32))

(assert (=> b!647195 (= res!419322 (= lt!300319 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300315 vacantSpotIndex!68 lt!300309 lt!300316 mask!3053)))))

(assert (=> b!647195 (= lt!300319 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300315 vacantSpotIndex!68 (select (arr!18456 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!647195 (= lt!300309 (select (store (arr!18456 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!300310 () Unit!22002)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38494 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22002)

(assert (=> b!647195 (= lt!300310 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300315 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!647195 (= lt!300315 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!58646 res!419313) b!647190))

(assert (= (and b!647190 res!419320) b!647171))

(assert (= (and b!647171 res!419312) b!647191))

(assert (= (and b!647191 res!419332) b!647174))

(assert (= (and b!647174 res!419333) b!647179))

(assert (= (and b!647179 res!419314) b!647173))

(assert (= (and b!647173 res!419325) b!647176))

(assert (= (and b!647176 res!419318) b!647192))

(assert (= (and b!647192 res!419330) b!647170))

(assert (= (and b!647170 res!419329) b!647188))

(assert (= (and b!647188 res!419331) b!647195))

(assert (= (and b!647195 res!419322) b!647186))

(assert (= (and b!647195 c!74296) b!647182))

(assert (= (and b!647195 (not c!74296)) b!647184))

(assert (= (and b!647195 (not res!419319)) b!647180))

(assert (= (and b!647180 res!419317) b!647177))

(assert (= (and b!647177 (not res!419326)) b!647183))

(assert (= (and b!647183 res!419327) b!647189))

(assert (= (and b!647180 (not res!419315)) b!647178))

(assert (= (and b!647178 c!74297) b!647185))

(assert (= (and b!647178 (not c!74297)) b!647193))

(assert (= (and b!647178 (not res!419323)) b!647194))

(assert (= (and b!647194 res!419316) b!647187))

(assert (= (and b!647194 (not res!419321)) b!647175))

(assert (= (and b!647175 (not res!419324)) b!647181))

(assert (= (and b!647181 res!419328) b!647172))

(declare-fun m!620591 () Bool)

(assert (=> b!647187 m!620591))

(assert (=> b!647187 m!620591))

(declare-fun m!620593 () Bool)

(assert (=> b!647187 m!620593))

(assert (=> b!647185 m!620591))

(declare-fun m!620595 () Bool)

(assert (=> b!647185 m!620595))

(assert (=> b!647185 m!620591))

(declare-fun m!620597 () Bool)

(assert (=> b!647185 m!620597))

(declare-fun m!620599 () Bool)

(assert (=> b!647185 m!620599))

(assert (=> b!647185 m!620591))

(declare-fun m!620601 () Bool)

(assert (=> b!647185 m!620601))

(assert (=> b!647185 m!620591))

(declare-fun m!620603 () Bool)

(assert (=> b!647185 m!620603))

(declare-fun m!620605 () Bool)

(assert (=> b!647185 m!620605))

(declare-fun m!620607 () Bool)

(assert (=> b!647185 m!620607))

(assert (=> b!647194 m!620591))

(assert (=> b!647194 m!620591))

(declare-fun m!620609 () Bool)

(assert (=> b!647194 m!620609))

(assert (=> b!647194 m!620591))

(declare-fun m!620611 () Bool)

(assert (=> b!647194 m!620611))

(assert (=> b!647194 m!620591))

(declare-fun m!620613 () Bool)

(assert (=> b!647194 m!620613))

(declare-fun m!620615 () Bool)

(assert (=> b!647175 m!620615))

(declare-fun m!620617 () Bool)

(assert (=> b!647191 m!620617))

(declare-fun m!620619 () Bool)

(assert (=> b!647181 m!620619))

(declare-fun m!620621 () Bool)

(assert (=> b!647192 m!620621))

(declare-fun m!620623 () Bool)

(assert (=> b!647176 m!620623))

(declare-fun m!620625 () Bool)

(assert (=> b!647179 m!620625))

(declare-fun m!620627 () Bool)

(assert (=> b!647170 m!620627))

(declare-fun m!620629 () Bool)

(assert (=> b!647170 m!620629))

(assert (=> b!647183 m!620591))

(assert (=> b!647183 m!620591))

(assert (=> b!647183 m!620613))

(declare-fun m!620631 () Bool)

(assert (=> b!647188 m!620631))

(assert (=> b!647188 m!620591))

(assert (=> b!647188 m!620591))

(declare-fun m!620633 () Bool)

(assert (=> b!647188 m!620633))

(assert (=> b!647189 m!620591))

(assert (=> b!647189 m!620591))

(assert (=> b!647189 m!620593))

(declare-fun m!620635 () Bool)

(assert (=> b!647172 m!620635))

(assert (=> b!647171 m!620591))

(assert (=> b!647171 m!620591))

(declare-fun m!620637 () Bool)

(assert (=> b!647171 m!620637))

(declare-fun m!620639 () Bool)

(assert (=> b!647174 m!620639))

(declare-fun m!620641 () Bool)

(assert (=> start!58646 m!620641))

(declare-fun m!620643 () Bool)

(assert (=> start!58646 m!620643))

(assert (=> b!647177 m!620591))

(assert (=> b!647180 m!620591))

(assert (=> b!647180 m!620627))

(declare-fun m!620645 () Bool)

(assert (=> b!647180 m!620645))

(declare-fun m!620647 () Bool)

(assert (=> b!647195 m!620647))

(declare-fun m!620649 () Bool)

(assert (=> b!647195 m!620649))

(assert (=> b!647195 m!620591))

(assert (=> b!647195 m!620627))

(declare-fun m!620651 () Bool)

(assert (=> b!647195 m!620651))

(declare-fun m!620653 () Bool)

(assert (=> b!647195 m!620653))

(declare-fun m!620655 () Bool)

(assert (=> b!647195 m!620655))

(assert (=> b!647195 m!620591))

(declare-fun m!620657 () Bool)

(assert (=> b!647195 m!620657))

(declare-fun m!620659 () Bool)

(assert (=> b!647173 m!620659))

(push 1)

(assert (not start!58646))

(assert (not b!647171))

(assert (not b!647189))

(assert (not b!647176))

(assert (not b!647175))

(assert (not b!647173))

(assert (not b!647195))

(assert (not b!647174))

(assert (not b!647188))

(assert (not b!647183))

(assert (not b!647194))

(assert (not b!647191))

(assert (not b!647181))

(assert (not b!647179))

(assert (not b!647172))

(assert (not b!647185))

(assert (not b!647187))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91575 () Bool)

(declare-fun res!419520 () Bool)

(declare-fun e!371235 () Bool)

(assert (=> d!91575 (=> res!419520 e!371235)))

(assert (=> d!91575 (= res!419520 (= (select (arr!18456 lt!300316) index!984) (select (arr!18456 a!2986) j!136)))))

(assert (=> d!91575 (= (arrayContainsKey!0 lt!300316 (select (arr!18456 a!2986) j!136) index!984) e!371235)))

(declare-fun b!647440 () Bool)

(declare-fun e!371236 () Bool)

(assert (=> b!647440 (= e!371235 e!371236)))

(declare-fun res!419521 () Bool)

(assert (=> b!647440 (=> (not res!419521) (not e!371236))))

(assert (=> b!647440 (= res!419521 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18820 lt!300316)))))

(declare-fun b!647441 () Bool)

(assert (=> b!647441 (= e!371236 (arrayContainsKey!0 lt!300316 (select (arr!18456 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91575 (not res!419520)) b!647440))

(assert (= (and b!647440 res!419521) b!647441))

(declare-fun m!620877 () Bool)

(assert (=> d!91575 m!620877))

(assert (=> b!647441 m!620591))

(declare-fun m!620879 () Bool)

(assert (=> b!647441 m!620879))

(assert (=> b!647187 d!91575))

(declare-fun d!91579 () Bool)

(declare-fun res!419530 () Bool)

(declare-fun e!371254 () Bool)

(assert (=> d!91579 (=> res!419530 e!371254)))

(assert (=> d!91579 (= res!419530 (bvsge #b00000000000000000000000000000000 (size!18820 a!2986)))))

(assert (=> d!91579 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12494) e!371254)))

(declare-fun bm!33688 () Bool)

(declare-fun call!33691 () Bool)

(declare-fun c!74338 () Bool)

(assert (=> bm!33688 (= call!33691 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74338 (Cons!12493 (select (arr!18456 a!2986) #b00000000000000000000000000000000) Nil!12494) Nil!12494)))))

(declare-fun b!647470 () Bool)

(declare-fun e!371257 () Bool)

(assert (=> b!647470 (= e!371257 call!33691)))

(declare-fun b!647471 () Bool)

(assert (=> b!647471 (= e!371257 call!33691)))

(declare-fun b!647472 () Bool)

(declare-fun e!371255 () Bool)

(assert (=> b!647472 (= e!371254 e!371255)))

(declare-fun res!419528 () Bool)

(assert (=> b!647472 (=> (not res!419528) (not e!371255))))

(declare-fun e!371256 () Bool)

(assert (=> b!647472 (= res!419528 (not e!371256))))

(declare-fun res!419529 () Bool)

(assert (=> b!647472 (=> (not res!419529) (not e!371256))))

(assert (=> b!647472 (= res!419529 (validKeyInArray!0 (select (arr!18456 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647473 () Bool)

(assert (=> b!647473 (= e!371256 (contains!3152 Nil!12494 (select (arr!18456 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647474 () Bool)

(assert (=> b!647474 (= e!371255 e!371257)))

(assert (=> b!647474 (= c!74338 (validKeyInArray!0 (select (arr!18456 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91579 (not res!419530)) b!647472))

(assert (= (and b!647472 res!419529) b!647473))

(assert (= (and b!647472 res!419528) b!647474))

(assert (= (and b!647474 c!74338) b!647470))

(assert (= (and b!647474 (not c!74338)) b!647471))

(assert (= (or b!647470 b!647471) bm!33688))

(declare-fun m!620895 () Bool)

(assert (=> bm!33688 m!620895))

(declare-fun m!620897 () Bool)

(assert (=> bm!33688 m!620897))

(assert (=> b!647472 m!620895))

(assert (=> b!647472 m!620895))

(declare-fun m!620899 () Bool)

(assert (=> b!647472 m!620899))

(assert (=> b!647473 m!620895))

(assert (=> b!647473 m!620895))

(declare-fun m!620901 () Bool)

(assert (=> b!647473 m!620901))

(assert (=> b!647474 m!620895))

(assert (=> b!647474 m!620895))

(assert (=> b!647474 m!620899))

(assert (=> b!647176 d!91579))

(declare-fun d!91583 () Bool)

(declare-fun res!419537 () Bool)

(declare-fun e!371264 () Bool)

(assert (=> d!91583 (=> res!419537 e!371264)))

(assert (=> d!91583 (= res!419537 (is-Nil!12494 Nil!12494))))

(assert (=> d!91583 (= (noDuplicate!414 Nil!12494) e!371264)))

(declare-fun b!647481 () Bool)

(declare-fun e!371265 () Bool)

(assert (=> b!647481 (= e!371264 e!371265)))

(declare-fun res!419538 () Bool)

(assert (=> b!647481 (=> (not res!419538) (not e!371265))))

(assert (=> b!647481 (= res!419538 (not (contains!3152 (t!18725 Nil!12494) (h!13538 Nil!12494))))))

(declare-fun b!647482 () Bool)

(assert (=> b!647482 (= e!371265 (noDuplicate!414 (t!18725 Nil!12494)))))

(assert (= (and d!91583 (not res!419537)) b!647481))

(assert (= (and b!647481 res!419538) b!647482))

(declare-fun m!620907 () Bool)

(assert (=> b!647481 m!620907))

(declare-fun m!620909 () Bool)

(assert (=> b!647482 m!620909))

(assert (=> b!647175 d!91583))

(declare-fun b!647559 () Bool)

(declare-fun e!371309 () SeekEntryResult!6896)

(declare-fun e!371311 () SeekEntryResult!6896)

(assert (=> b!647559 (= e!371309 e!371311)))

(declare-fun lt!300489 () (_ BitVec 64))

(declare-fun lt!300487 () SeekEntryResult!6896)

(assert (=> b!647559 (= lt!300489 (select (arr!18456 a!2986) (index!29927 lt!300487)))))

(declare-fun c!74372 () Bool)

(assert (=> b!647559 (= c!74372 (= lt!300489 k!1786))))

(declare-fun b!647561 () Bool)

(assert (=> b!647561 (= e!371309 Undefined!6896)))

(declare-fun b!647562 () Bool)

(assert (=> b!647562 (= e!371311 (Found!6896 (index!29927 lt!300487)))))

(declare-fun b!647560 () Bool)

(declare-fun c!74374 () Bool)

(assert (=> b!647560 (= c!74374 (= lt!300489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371310 () SeekEntryResult!6896)

(assert (=> b!647560 (= e!371311 e!371310)))

(declare-fun d!91587 () Bool)

(declare-fun lt!300488 () SeekEntryResult!6896)

(assert (=> d!91587 (and (or (is-Undefined!6896 lt!300488) (not (is-Found!6896 lt!300488)) (and (bvsge (index!29926 lt!300488) #b00000000000000000000000000000000) (bvslt (index!29926 lt!300488) (size!18820 a!2986)))) (or (is-Undefined!6896 lt!300488) (is-Found!6896 lt!300488) (not (is-MissingZero!6896 lt!300488)) (and (bvsge (index!29925 lt!300488) #b00000000000000000000000000000000) (bvslt (index!29925 lt!300488) (size!18820 a!2986)))) (or (is-Undefined!6896 lt!300488) (is-Found!6896 lt!300488) (is-MissingZero!6896 lt!300488) (not (is-MissingVacant!6896 lt!300488)) (and (bvsge (index!29928 lt!300488) #b00000000000000000000000000000000) (bvslt (index!29928 lt!300488) (size!18820 a!2986)))) (or (is-Undefined!6896 lt!300488) (ite (is-Found!6896 lt!300488) (= (select (arr!18456 a!2986) (index!29926 lt!300488)) k!1786) (ite (is-MissingZero!6896 lt!300488) (= (select (arr!18456 a!2986) (index!29925 lt!300488)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6896 lt!300488) (= (select (arr!18456 a!2986) (index!29928 lt!300488)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91587 (= lt!300488 e!371309)))

(declare-fun c!74373 () Bool)

(assert (=> d!91587 (= c!74373 (and (is-Intermediate!6896 lt!300487) (undefined!7708 lt!300487)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38494 (_ BitVec 32)) SeekEntryResult!6896)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91587 (= lt!300487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!91587 (validMask!0 mask!3053)))

(assert (=> d!91587 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!300488)))

(declare-fun b!647563 () Bool)

(assert (=> b!647563 (= e!371310 (MissingZero!6896 (index!29927 lt!300487)))))

(declare-fun b!647564 () Bool)

(assert (=> b!647564 (= e!371310 (seekKeyOrZeroReturnVacant!0 (x!58707 lt!300487) (index!29927 lt!300487) (index!29927 lt!300487) k!1786 a!2986 mask!3053))))

(assert (= (and d!91587 c!74373) b!647561))

(assert (= (and d!91587 (not c!74373)) b!647559))

(assert (= (and b!647559 c!74372) b!647562))

(assert (= (and b!647559 (not c!74372)) b!647560))

(assert (= (and b!647560 c!74374) b!647563))

(assert (= (and b!647560 (not c!74374)) b!647564))

(declare-fun m!620967 () Bool)

(assert (=> b!647559 m!620967))

(assert (=> d!91587 m!620641))

(declare-fun m!620969 () Bool)

(assert (=> d!91587 m!620969))

(declare-fun m!620971 () Bool)

(assert (=> d!91587 m!620971))

(assert (=> d!91587 m!620971))

(declare-fun m!620973 () Bool)

(assert (=> d!91587 m!620973))

(declare-fun m!620975 () Bool)

(assert (=> d!91587 m!620975))

(declare-fun m!620977 () Bool)

(assert (=> d!91587 m!620977))

(declare-fun m!620979 () Bool)

(assert (=> b!647564 m!620979))

(assert (=> b!647179 d!91587))

(assert (=> b!647189 d!91575))

(declare-fun lt!300512 () SeekEntryResult!6896)

(declare-fun d!91611 () Bool)

(assert (=> d!91611 (and (or (is-Undefined!6896 lt!300512) (not (is-Found!6896 lt!300512)) (and (bvsge (index!29926 lt!300512) #b00000000000000000000000000000000) (bvslt (index!29926 lt!300512) (size!18820 a!2986)))) (or (is-Undefined!6896 lt!300512) (is-Found!6896 lt!300512) (not (is-MissingVacant!6896 lt!300512)) (not (= (index!29928 lt!300512) vacantSpotIndex!68)) (and (bvsge (index!29928 lt!300512) #b00000000000000000000000000000000) (bvslt (index!29928 lt!300512) (size!18820 a!2986)))) (or (is-Undefined!6896 lt!300512) (ite (is-Found!6896 lt!300512) (= (select (arr!18456 a!2986) (index!29926 lt!300512)) (select (arr!18456 a!2986) j!136)) (and (is-MissingVacant!6896 lt!300512) (= (index!29928 lt!300512) vacantSpotIndex!68) (= (select (arr!18456 a!2986) (index!29928 lt!300512)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!371333 () SeekEntryResult!6896)

(assert (=> d!91611 (= lt!300512 e!371333)))

(declare-fun c!74386 () Bool)

(assert (=> d!91611 (= c!74386 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!300513 () (_ BitVec 64))

(assert (=> d!91611 (= lt!300513 (select (arr!18456 a!2986) index!984))))

(assert (=> d!91611 (validMask!0 mask!3053)))

(assert (=> d!91611 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18456 a!2986) j!136) a!2986 mask!3053) lt!300512)))

(declare-fun b!647595 () Bool)

(declare-fun c!74385 () Bool)

(assert (=> b!647595 (= c!74385 (= lt!300513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371334 () SeekEntryResult!6896)

(declare-fun e!371335 () SeekEntryResult!6896)

(assert (=> b!647595 (= e!371334 e!371335)))

(declare-fun b!647596 () Bool)

(assert (=> b!647596 (= e!371335 (MissingVacant!6896 vacantSpotIndex!68))))

(declare-fun b!647597 () Bool)

(assert (=> b!647597 (= e!371333 Undefined!6896)))

(declare-fun b!647598 () Bool)

(assert (=> b!647598 (= e!371335 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18456 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!647599 () Bool)

(assert (=> b!647599 (= e!371334 (Found!6896 index!984))))

(declare-fun b!647600 () Bool)

(assert (=> b!647600 (= e!371333 e!371334)))

(declare-fun c!74384 () Bool)

(assert (=> b!647600 (= c!74384 (= lt!300513 (select (arr!18456 a!2986) j!136)))))

(assert (= (and d!91611 c!74386) b!647597))

(assert (= (and d!91611 (not c!74386)) b!647600))

(assert (= (and b!647600 c!74384) b!647599))

(assert (= (and b!647600 (not c!74384)) b!647595))

(assert (= (and b!647595 c!74385) b!647596))

(assert (= (and b!647595 (not c!74385)) b!647598))

(declare-fun m!621001 () Bool)

(assert (=> d!91611 m!621001))

(declare-fun m!621003 () Bool)

(assert (=> d!91611 m!621003))

(assert (=> d!91611 m!620631))

(assert (=> d!91611 m!620641))

(assert (=> b!647598 m!620647))

(assert (=> b!647598 m!620647))

(assert (=> b!647598 m!620591))

(declare-fun m!621005 () Bool)

(assert (=> b!647598 m!621005))

(assert (=> b!647188 d!91611))

(declare-fun d!91619 () Bool)

