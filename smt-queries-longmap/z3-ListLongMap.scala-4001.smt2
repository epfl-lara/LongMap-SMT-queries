; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54312 () Bool)

(assert start!54312)

(declare-fun b!593209 () Bool)

(declare-fun e!338812 () Bool)

(declare-datatypes ((SeekEntryResult!6124 0))(
  ( (MissingZero!6124 (index!26735 (_ BitVec 32))) (Found!6124 (index!26736 (_ BitVec 32))) (Intermediate!6124 (undefined!6936 Bool) (index!26737 (_ BitVec 32)) (x!55680 (_ BitVec 32))) (Undefined!6124) (MissingVacant!6124 (index!26738 (_ BitVec 32))) )
))
(declare-fun lt!269310 () SeekEntryResult!6124)

(declare-fun lt!269311 () SeekEntryResult!6124)

(assert (=> b!593209 (= e!338812 (= lt!269310 lt!269311))))

(declare-fun b!593210 () Bool)

(declare-fun e!338813 () Bool)

(declare-fun e!338814 () Bool)

(assert (=> b!593210 (= e!338813 e!338814)))

(declare-fun res!379717 () Bool)

(assert (=> b!593210 (=> (not res!379717) (not e!338814))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36924 0))(
  ( (array!36925 (arr!17728 (Array (_ BitVec 32) (_ BitVec 64))) (size!18092 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36924)

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!593210 (= res!379717 (= (select (store (arr!17728 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!269317 () array!36924)

(assert (=> b!593210 (= lt!269317 (array!36925 (store (arr!17728 a!2986) i!1108 k0!1786) (size!18092 a!2986)))))

(declare-fun res!379723 () Bool)

(declare-fun e!338809 () Bool)

(assert (=> start!54312 (=> (not res!379723) (not e!338809))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54312 (= res!379723 (validMask!0 mask!3053))))

(assert (=> start!54312 e!338809))

(assert (=> start!54312 true))

(declare-fun array_inv!13587 (array!36924) Bool)

(assert (=> start!54312 (array_inv!13587 a!2986)))

(declare-fun b!593211 () Bool)

(declare-fun res!379719 () Bool)

(assert (=> b!593211 (=> (not res!379719) (not e!338813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36924 (_ BitVec 32)) Bool)

(assert (=> b!593211 (= res!379719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593212 () Bool)

(declare-datatypes ((Unit!18589 0))(
  ( (Unit!18590) )
))
(declare-fun e!338810 () Unit!18589)

(declare-fun Unit!18591 () Unit!18589)

(assert (=> b!593212 (= e!338810 Unit!18591)))

(declare-fun b!593213 () Bool)

(declare-fun Unit!18592 () Unit!18589)

(assert (=> b!593213 (= e!338810 Unit!18592)))

(assert (=> b!593213 false))

(declare-fun b!593214 () Bool)

(declare-fun res!379712 () Bool)

(assert (=> b!593214 (=> (not res!379712) (not e!338809))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593214 (= res!379712 (validKeyInArray!0 (select (arr!17728 a!2986) j!136)))))

(declare-fun b!593215 () Bool)

(declare-fun e!338820 () Bool)

(declare-fun e!338815 () Bool)

(assert (=> b!593215 (= e!338820 e!338815)))

(declare-fun res!379714 () Bool)

(assert (=> b!593215 (=> res!379714 e!338815)))

(declare-fun lt!269319 () (_ BitVec 64))

(declare-fun lt!269318 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!593215 (= res!379714 (or (not (= (select (arr!17728 a!2986) j!136) lt!269318)) (not (= (select (arr!17728 a!2986) j!136) lt!269319)) (bvsge j!136 index!984)))))

(declare-fun e!338818 () Bool)

(assert (=> b!593215 e!338818))

(declare-fun res!379726 () Bool)

(assert (=> b!593215 (=> (not res!379726) (not e!338818))))

(assert (=> b!593215 (= res!379726 (= lt!269319 (select (arr!17728 a!2986) j!136)))))

(assert (=> b!593215 (= lt!269319 (select (store (arr!17728 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!593216 () Bool)

(declare-fun e!338819 () Bool)

(assert (=> b!593216 (= e!338814 e!338819)))

(declare-fun res!379715 () Bool)

(assert (=> b!593216 (=> (not res!379715) (not e!338819))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!593216 (= res!379715 (and (= lt!269310 (Found!6124 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17728 a!2986) index!984) (select (arr!17728 a!2986) j!136))) (not (= (select (arr!17728 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36924 (_ BitVec 32)) SeekEntryResult!6124)

(assert (=> b!593216 (= lt!269310 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593217 () Bool)

(declare-fun res!379711 () Bool)

(assert (=> b!593217 (=> (not res!379711) (not e!338809))))

(declare-fun arrayContainsKey!0 (array!36924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593217 (= res!379711 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!593218 () Bool)

(declare-fun res!379721 () Bool)

(assert (=> b!593218 (=> (not res!379721) (not e!338813))))

(assert (=> b!593218 (= res!379721 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17728 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593219 () Bool)

(declare-fun res!379725 () Bool)

(assert (=> b!593219 (=> (not res!379725) (not e!338813))))

(declare-datatypes ((List!11676 0))(
  ( (Nil!11673) (Cons!11672 (h!12720 (_ BitVec 64)) (t!17896 List!11676)) )
))
(declare-fun arrayNoDuplicates!0 (array!36924 (_ BitVec 32) List!11676) Bool)

(assert (=> b!593219 (= res!379725 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11673))))

(declare-fun b!593220 () Bool)

(declare-fun res!379720 () Bool)

(assert (=> b!593220 (=> (not res!379720) (not e!338809))))

(assert (=> b!593220 (= res!379720 (and (= (size!18092 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18092 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18092 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593221 () Bool)

(assert (=> b!593221 (= e!338819 (not e!338820))))

(declare-fun res!379718 () Bool)

(assert (=> b!593221 (=> res!379718 e!338820)))

(declare-fun lt!269320 () SeekEntryResult!6124)

(assert (=> b!593221 (= res!379718 (not (= lt!269320 (Found!6124 index!984))))))

(declare-fun lt!269316 () Unit!18589)

(assert (=> b!593221 (= lt!269316 e!338810)))

(declare-fun c!67118 () Bool)

(assert (=> b!593221 (= c!67118 (= lt!269320 Undefined!6124))))

(assert (=> b!593221 (= lt!269320 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269318 lt!269317 mask!3053))))

(assert (=> b!593221 e!338812))

(declare-fun res!379713 () Bool)

(assert (=> b!593221 (=> (not res!379713) (not e!338812))))

(declare-fun lt!269312 () (_ BitVec 32))

(assert (=> b!593221 (= res!379713 (= lt!269311 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269312 vacantSpotIndex!68 lt!269318 lt!269317 mask!3053)))))

(assert (=> b!593221 (= lt!269311 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269312 vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!593221 (= lt!269318 (select (store (arr!17728 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269314 () Unit!18589)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36924 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18589)

(assert (=> b!593221 (= lt!269314 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269312 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593221 (= lt!269312 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!593222 () Bool)

(declare-fun e!338811 () Bool)

(assert (=> b!593222 (= e!338818 e!338811)))

(declare-fun res!379716 () Bool)

(assert (=> b!593222 (=> res!379716 e!338811)))

(assert (=> b!593222 (= res!379716 (or (not (= (select (arr!17728 a!2986) j!136) lt!269318)) (not (= (select (arr!17728 a!2986) j!136) lt!269319)) (bvsge j!136 index!984)))))

(declare-fun b!593223 () Bool)

(assert (=> b!593223 (= e!338809 e!338813)))

(declare-fun res!379710 () Bool)

(assert (=> b!593223 (=> (not res!379710) (not e!338813))))

(declare-fun lt!269315 () SeekEntryResult!6124)

(assert (=> b!593223 (= res!379710 (or (= lt!269315 (MissingZero!6124 i!1108)) (= lt!269315 (MissingVacant!6124 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36924 (_ BitVec 32)) SeekEntryResult!6124)

(assert (=> b!593223 (= lt!269315 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!593224 () Bool)

(assert (=> b!593224 (= e!338815 (or (bvsgt #b00000000000000000000000000000000 (size!18092 a!2986)) (bvslt (size!18092 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!593224 (arrayContainsKey!0 lt!269317 (select (arr!17728 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269313 () Unit!18589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36924 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18589)

(assert (=> b!593224 (= lt!269313 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269317 (select (arr!17728 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!593225 () Bool)

(declare-fun e!338817 () Bool)

(assert (=> b!593225 (= e!338811 e!338817)))

(declare-fun res!379724 () Bool)

(assert (=> b!593225 (=> (not res!379724) (not e!338817))))

(assert (=> b!593225 (= res!379724 (arrayContainsKey!0 lt!269317 (select (arr!17728 a!2986) j!136) j!136))))

(declare-fun b!593226 () Bool)

(declare-fun res!379722 () Bool)

(assert (=> b!593226 (=> (not res!379722) (not e!338809))))

(assert (=> b!593226 (= res!379722 (validKeyInArray!0 k0!1786))))

(declare-fun b!593227 () Bool)

(assert (=> b!593227 (= e!338817 (arrayContainsKey!0 lt!269317 (select (arr!17728 a!2986) j!136) index!984))))

(assert (= (and start!54312 res!379723) b!593220))

(assert (= (and b!593220 res!379720) b!593214))

(assert (= (and b!593214 res!379712) b!593226))

(assert (= (and b!593226 res!379722) b!593217))

(assert (= (and b!593217 res!379711) b!593223))

(assert (= (and b!593223 res!379710) b!593211))

(assert (= (and b!593211 res!379719) b!593219))

(assert (= (and b!593219 res!379725) b!593218))

(assert (= (and b!593218 res!379721) b!593210))

(assert (= (and b!593210 res!379717) b!593216))

(assert (= (and b!593216 res!379715) b!593221))

(assert (= (and b!593221 res!379713) b!593209))

(assert (= (and b!593221 c!67118) b!593213))

(assert (= (and b!593221 (not c!67118)) b!593212))

(assert (= (and b!593221 (not res!379718)) b!593215))

(assert (= (and b!593215 res!379726) b!593222))

(assert (= (and b!593222 (not res!379716)) b!593225))

(assert (= (and b!593225 res!379724) b!593227))

(assert (= (and b!593215 (not res!379714)) b!593224))

(declare-fun m!571415 () Bool)

(assert (=> b!593217 m!571415))

(declare-fun m!571417 () Bool)

(assert (=> b!593221 m!571417))

(declare-fun m!571419 () Bool)

(assert (=> b!593221 m!571419))

(declare-fun m!571421 () Bool)

(assert (=> b!593221 m!571421))

(declare-fun m!571423 () Bool)

(assert (=> b!593221 m!571423))

(declare-fun m!571425 () Bool)

(assert (=> b!593221 m!571425))

(declare-fun m!571427 () Bool)

(assert (=> b!593221 m!571427))

(assert (=> b!593221 m!571425))

(declare-fun m!571429 () Bool)

(assert (=> b!593221 m!571429))

(declare-fun m!571431 () Bool)

(assert (=> b!593221 m!571431))

(declare-fun m!571433 () Bool)

(assert (=> b!593219 m!571433))

(assert (=> b!593215 m!571425))

(assert (=> b!593215 m!571421))

(declare-fun m!571435 () Bool)

(assert (=> b!593215 m!571435))

(assert (=> b!593214 m!571425))

(assert (=> b!593214 m!571425))

(declare-fun m!571437 () Bool)

(assert (=> b!593214 m!571437))

(declare-fun m!571439 () Bool)

(assert (=> b!593216 m!571439))

(assert (=> b!593216 m!571425))

(assert (=> b!593216 m!571425))

(declare-fun m!571441 () Bool)

(assert (=> b!593216 m!571441))

(assert (=> b!593227 m!571425))

(assert (=> b!593227 m!571425))

(declare-fun m!571443 () Bool)

(assert (=> b!593227 m!571443))

(declare-fun m!571445 () Bool)

(assert (=> start!54312 m!571445))

(declare-fun m!571447 () Bool)

(assert (=> start!54312 m!571447))

(assert (=> b!593225 m!571425))

(assert (=> b!593225 m!571425))

(declare-fun m!571449 () Bool)

(assert (=> b!593225 m!571449))

(declare-fun m!571451 () Bool)

(assert (=> b!593223 m!571451))

(assert (=> b!593210 m!571421))

(declare-fun m!571453 () Bool)

(assert (=> b!593210 m!571453))

(declare-fun m!571455 () Bool)

(assert (=> b!593226 m!571455))

(assert (=> b!593222 m!571425))

(declare-fun m!571457 () Bool)

(assert (=> b!593218 m!571457))

(declare-fun m!571459 () Bool)

(assert (=> b!593211 m!571459))

(assert (=> b!593224 m!571425))

(assert (=> b!593224 m!571425))

(declare-fun m!571461 () Bool)

(assert (=> b!593224 m!571461))

(assert (=> b!593224 m!571425))

(declare-fun m!571463 () Bool)

(assert (=> b!593224 m!571463))

(check-sat (not b!593224) (not b!593226) (not b!593217) (not b!593214) (not b!593223) (not start!54312) (not b!593225) (not b!593219) (not b!593211) (not b!593227) (not b!593216) (not b!593221))
(check-sat)
(get-model)

(declare-fun d!86449 () Bool)

(declare-fun res!379833 () Bool)

(declare-fun e!338897 () Bool)

(assert (=> d!86449 (=> res!379833 e!338897)))

(assert (=> d!86449 (= res!379833 (= (select (arr!17728 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86449 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!338897)))

(declare-fun b!593346 () Bool)

(declare-fun e!338898 () Bool)

(assert (=> b!593346 (= e!338897 e!338898)))

(declare-fun res!379834 () Bool)

(assert (=> b!593346 (=> (not res!379834) (not e!338898))))

(assert (=> b!593346 (= res!379834 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18092 a!2986)))))

(declare-fun b!593347 () Bool)

(assert (=> b!593347 (= e!338898 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86449 (not res!379833)) b!593346))

(assert (= (and b!593346 res!379834) b!593347))

(declare-fun m!571565 () Bool)

(assert (=> d!86449 m!571565))

(declare-fun m!571567 () Bool)

(assert (=> b!593347 m!571567))

(assert (=> b!593217 d!86449))

(declare-fun d!86451 () Bool)

(declare-fun res!379835 () Bool)

(declare-fun e!338899 () Bool)

(assert (=> d!86451 (=> res!379835 e!338899)))

(assert (=> d!86451 (= res!379835 (= (select (arr!17728 lt!269317) index!984) (select (arr!17728 a!2986) j!136)))))

(assert (=> d!86451 (= (arrayContainsKey!0 lt!269317 (select (arr!17728 a!2986) j!136) index!984) e!338899)))

(declare-fun b!593348 () Bool)

(declare-fun e!338900 () Bool)

(assert (=> b!593348 (= e!338899 e!338900)))

(declare-fun res!379836 () Bool)

(assert (=> b!593348 (=> (not res!379836) (not e!338900))))

(assert (=> b!593348 (= res!379836 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18092 lt!269317)))))

(declare-fun b!593349 () Bool)

(assert (=> b!593349 (= e!338900 (arrayContainsKey!0 lt!269317 (select (arr!17728 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86451 (not res!379835)) b!593348))

(assert (= (and b!593348 res!379836) b!593349))

(declare-fun m!571569 () Bool)

(assert (=> d!86451 m!571569))

(assert (=> b!593349 m!571425))

(declare-fun m!571571 () Bool)

(assert (=> b!593349 m!571571))

(assert (=> b!593227 d!86451))

(declare-fun d!86453 () Bool)

(assert (=> d!86453 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54312 d!86453))

(declare-fun d!86455 () Bool)

(assert (=> d!86455 (= (array_inv!13587 a!2986) (bvsge (size!18092 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54312 d!86455))

(declare-fun bm!32853 () Bool)

(declare-fun call!32856 () Bool)

(declare-fun c!67127 () Bool)

(assert (=> bm!32853 (= call!32856 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67127 (Cons!11672 (select (arr!17728 a!2986) #b00000000000000000000000000000000) Nil!11673) Nil!11673)))))

(declare-fun b!593360 () Bool)

(declare-fun e!338912 () Bool)

(declare-fun contains!2887 (List!11676 (_ BitVec 64)) Bool)

(assert (=> b!593360 (= e!338912 (contains!2887 Nil!11673 (select (arr!17728 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593362 () Bool)

(declare-fun e!338911 () Bool)

(declare-fun e!338910 () Bool)

(assert (=> b!593362 (= e!338911 e!338910)))

(declare-fun res!379843 () Bool)

(assert (=> b!593362 (=> (not res!379843) (not e!338910))))

(assert (=> b!593362 (= res!379843 (not e!338912))))

(declare-fun res!379845 () Bool)

(assert (=> b!593362 (=> (not res!379845) (not e!338912))))

(assert (=> b!593362 (= res!379845 (validKeyInArray!0 (select (arr!17728 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593363 () Bool)

(declare-fun e!338909 () Bool)

(assert (=> b!593363 (= e!338909 call!32856)))

(declare-fun b!593364 () Bool)

(assert (=> b!593364 (= e!338909 call!32856)))

(declare-fun d!86457 () Bool)

(declare-fun res!379844 () Bool)

(assert (=> d!86457 (=> res!379844 e!338911)))

(assert (=> d!86457 (= res!379844 (bvsge #b00000000000000000000000000000000 (size!18092 a!2986)))))

(assert (=> d!86457 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11673) e!338911)))

(declare-fun b!593361 () Bool)

(assert (=> b!593361 (= e!338910 e!338909)))

(assert (=> b!593361 (= c!67127 (validKeyInArray!0 (select (arr!17728 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86457 (not res!379844)) b!593362))

(assert (= (and b!593362 res!379845) b!593360))

(assert (= (and b!593362 res!379843) b!593361))

(assert (= (and b!593361 c!67127) b!593364))

(assert (= (and b!593361 (not c!67127)) b!593363))

(assert (= (or b!593364 b!593363) bm!32853))

(assert (=> bm!32853 m!571565))

(declare-fun m!571573 () Bool)

(assert (=> bm!32853 m!571573))

(assert (=> b!593360 m!571565))

(assert (=> b!593360 m!571565))

(declare-fun m!571575 () Bool)

(assert (=> b!593360 m!571575))

(assert (=> b!593362 m!571565))

(assert (=> b!593362 m!571565))

(declare-fun m!571577 () Bool)

(assert (=> b!593362 m!571577))

(assert (=> b!593361 m!571565))

(assert (=> b!593361 m!571565))

(assert (=> b!593361 m!571577))

(assert (=> b!593219 d!86457))

(declare-fun d!86459 () Bool)

(declare-fun e!338915 () Bool)

(assert (=> d!86459 e!338915))

(declare-fun res!379848 () Bool)

(assert (=> d!86459 (=> (not res!379848) (not e!338915))))

(assert (=> d!86459 (= res!379848 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18092 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18092 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18092 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18092 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18092 a!2986))))))

(declare-fun lt!269389 () Unit!18589)

(declare-fun choose!9 (array!36924 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18589)

(assert (=> d!86459 (= lt!269389 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269312 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86459 (validMask!0 mask!3053)))

(assert (=> d!86459 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269312 vacantSpotIndex!68 mask!3053) lt!269389)))

(declare-fun b!593367 () Bool)

(assert (=> b!593367 (= e!338915 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269312 vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269312 vacantSpotIndex!68 (select (store (arr!17728 a!2986) i!1108 k0!1786) j!136) (array!36925 (store (arr!17728 a!2986) i!1108 k0!1786) (size!18092 a!2986)) mask!3053)))))

(assert (= (and d!86459 res!379848) b!593367))

(declare-fun m!571579 () Bool)

(assert (=> d!86459 m!571579))

(assert (=> d!86459 m!571445))

(assert (=> b!593367 m!571421))

(assert (=> b!593367 m!571425))

(assert (=> b!593367 m!571429))

(assert (=> b!593367 m!571419))

(declare-fun m!571581 () Bool)

(assert (=> b!593367 m!571581))

(assert (=> b!593367 m!571425))

(assert (=> b!593367 m!571419))

(assert (=> b!593221 d!86459))

(declare-fun b!593392 () Bool)

(declare-fun c!67134 () Bool)

(declare-fun lt!269398 () (_ BitVec 64))

(assert (=> b!593392 (= c!67134 (= lt!269398 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338935 () SeekEntryResult!6124)

(declare-fun e!338934 () SeekEntryResult!6124)

(assert (=> b!593392 (= e!338935 e!338934)))

(declare-fun b!593393 () Bool)

(declare-fun e!338936 () SeekEntryResult!6124)

(assert (=> b!593393 (= e!338936 e!338935)))

(declare-fun c!67136 () Bool)

(assert (=> b!593393 (= c!67136 (= lt!269398 (select (arr!17728 a!2986) j!136)))))

(declare-fun b!593394 () Bool)

(assert (=> b!593394 (= e!338936 Undefined!6124)))

(declare-fun b!593396 () Bool)

(assert (=> b!593396 (= e!338935 (Found!6124 lt!269312))))

(declare-fun b!593397 () Bool)

(assert (=> b!593397 (= e!338934 (MissingVacant!6124 vacantSpotIndex!68))))

(declare-fun d!86461 () Bool)

(declare-fun lt!269397 () SeekEntryResult!6124)

(get-info :version)

(assert (=> d!86461 (and (or ((_ is Undefined!6124) lt!269397) (not ((_ is Found!6124) lt!269397)) (and (bvsge (index!26736 lt!269397) #b00000000000000000000000000000000) (bvslt (index!26736 lt!269397) (size!18092 a!2986)))) (or ((_ is Undefined!6124) lt!269397) ((_ is Found!6124) lt!269397) (not ((_ is MissingVacant!6124) lt!269397)) (not (= (index!26738 lt!269397) vacantSpotIndex!68)) (and (bvsge (index!26738 lt!269397) #b00000000000000000000000000000000) (bvslt (index!26738 lt!269397) (size!18092 a!2986)))) (or ((_ is Undefined!6124) lt!269397) (ite ((_ is Found!6124) lt!269397) (= (select (arr!17728 a!2986) (index!26736 lt!269397)) (select (arr!17728 a!2986) j!136)) (and ((_ is MissingVacant!6124) lt!269397) (= (index!26738 lt!269397) vacantSpotIndex!68) (= (select (arr!17728 a!2986) (index!26738 lt!269397)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86461 (= lt!269397 e!338936)))

(declare-fun c!67135 () Bool)

(assert (=> d!86461 (= c!67135 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86461 (= lt!269398 (select (arr!17728 a!2986) lt!269312))))

(assert (=> d!86461 (validMask!0 mask!3053)))

(assert (=> d!86461 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269312 vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053) lt!269397)))

(declare-fun b!593395 () Bool)

(assert (=> b!593395 (= e!338934 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269312 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!86461 c!67135) b!593394))

(assert (= (and d!86461 (not c!67135)) b!593393))

(assert (= (and b!593393 c!67136) b!593396))

(assert (= (and b!593393 (not c!67136)) b!593392))

(assert (= (and b!593392 c!67134) b!593397))

(assert (= (and b!593392 (not c!67134)) b!593395))

(declare-fun m!571601 () Bool)

(assert (=> d!86461 m!571601))

(declare-fun m!571603 () Bool)

(assert (=> d!86461 m!571603))

(declare-fun m!571605 () Bool)

(assert (=> d!86461 m!571605))

(assert (=> d!86461 m!571445))

(declare-fun m!571607 () Bool)

(assert (=> b!593395 m!571607))

(assert (=> b!593395 m!571607))

(assert (=> b!593395 m!571425))

(declare-fun m!571609 () Bool)

(assert (=> b!593395 m!571609))

(assert (=> b!593221 d!86461))

(declare-fun b!593398 () Bool)

(declare-fun c!67137 () Bool)

(declare-fun lt!269400 () (_ BitVec 64))

(assert (=> b!593398 (= c!67137 (= lt!269400 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338938 () SeekEntryResult!6124)

(declare-fun e!338937 () SeekEntryResult!6124)

(assert (=> b!593398 (= e!338938 e!338937)))

(declare-fun b!593399 () Bool)

(declare-fun e!338939 () SeekEntryResult!6124)

(assert (=> b!593399 (= e!338939 e!338938)))

(declare-fun c!67139 () Bool)

(assert (=> b!593399 (= c!67139 (= lt!269400 lt!269318))))

(declare-fun b!593400 () Bool)

(assert (=> b!593400 (= e!338939 Undefined!6124)))

(declare-fun b!593402 () Bool)

(assert (=> b!593402 (= e!338938 (Found!6124 lt!269312))))

(declare-fun b!593403 () Bool)

(assert (=> b!593403 (= e!338937 (MissingVacant!6124 vacantSpotIndex!68))))

(declare-fun lt!269399 () SeekEntryResult!6124)

(declare-fun d!86479 () Bool)

(assert (=> d!86479 (and (or ((_ is Undefined!6124) lt!269399) (not ((_ is Found!6124) lt!269399)) (and (bvsge (index!26736 lt!269399) #b00000000000000000000000000000000) (bvslt (index!26736 lt!269399) (size!18092 lt!269317)))) (or ((_ is Undefined!6124) lt!269399) ((_ is Found!6124) lt!269399) (not ((_ is MissingVacant!6124) lt!269399)) (not (= (index!26738 lt!269399) vacantSpotIndex!68)) (and (bvsge (index!26738 lt!269399) #b00000000000000000000000000000000) (bvslt (index!26738 lt!269399) (size!18092 lt!269317)))) (or ((_ is Undefined!6124) lt!269399) (ite ((_ is Found!6124) lt!269399) (= (select (arr!17728 lt!269317) (index!26736 lt!269399)) lt!269318) (and ((_ is MissingVacant!6124) lt!269399) (= (index!26738 lt!269399) vacantSpotIndex!68) (= (select (arr!17728 lt!269317) (index!26738 lt!269399)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86479 (= lt!269399 e!338939)))

(declare-fun c!67138 () Bool)

(assert (=> d!86479 (= c!67138 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86479 (= lt!269400 (select (arr!17728 lt!269317) lt!269312))))

(assert (=> d!86479 (validMask!0 mask!3053)))

(assert (=> d!86479 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269312 vacantSpotIndex!68 lt!269318 lt!269317 mask!3053) lt!269399)))

(declare-fun b!593401 () Bool)

(assert (=> b!593401 (= e!338937 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269312 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!269318 lt!269317 mask!3053))))

(assert (= (and d!86479 c!67138) b!593400))

(assert (= (and d!86479 (not c!67138)) b!593399))

(assert (= (and b!593399 c!67139) b!593402))

(assert (= (and b!593399 (not c!67139)) b!593398))

(assert (= (and b!593398 c!67137) b!593403))

(assert (= (and b!593398 (not c!67137)) b!593401))

(declare-fun m!571611 () Bool)

(assert (=> d!86479 m!571611))

(declare-fun m!571613 () Bool)

(assert (=> d!86479 m!571613))

(declare-fun m!571615 () Bool)

(assert (=> d!86479 m!571615))

(assert (=> d!86479 m!571445))

(assert (=> b!593401 m!571607))

(assert (=> b!593401 m!571607))

(declare-fun m!571617 () Bool)

(assert (=> b!593401 m!571617))

(assert (=> b!593221 d!86479))

(declare-fun b!593404 () Bool)

(declare-fun c!67140 () Bool)

(declare-fun lt!269402 () (_ BitVec 64))

(assert (=> b!593404 (= c!67140 (= lt!269402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338941 () SeekEntryResult!6124)

(declare-fun e!338940 () SeekEntryResult!6124)

(assert (=> b!593404 (= e!338941 e!338940)))

(declare-fun b!593405 () Bool)

(declare-fun e!338942 () SeekEntryResult!6124)

(assert (=> b!593405 (= e!338942 e!338941)))

(declare-fun c!67142 () Bool)

(assert (=> b!593405 (= c!67142 (= lt!269402 lt!269318))))

(declare-fun b!593406 () Bool)

(assert (=> b!593406 (= e!338942 Undefined!6124)))

(declare-fun b!593408 () Bool)

(assert (=> b!593408 (= e!338941 (Found!6124 index!984))))

(declare-fun b!593409 () Bool)

(assert (=> b!593409 (= e!338940 (MissingVacant!6124 vacantSpotIndex!68))))

(declare-fun lt!269401 () SeekEntryResult!6124)

(declare-fun d!86481 () Bool)

(assert (=> d!86481 (and (or ((_ is Undefined!6124) lt!269401) (not ((_ is Found!6124) lt!269401)) (and (bvsge (index!26736 lt!269401) #b00000000000000000000000000000000) (bvslt (index!26736 lt!269401) (size!18092 lt!269317)))) (or ((_ is Undefined!6124) lt!269401) ((_ is Found!6124) lt!269401) (not ((_ is MissingVacant!6124) lt!269401)) (not (= (index!26738 lt!269401) vacantSpotIndex!68)) (and (bvsge (index!26738 lt!269401) #b00000000000000000000000000000000) (bvslt (index!26738 lt!269401) (size!18092 lt!269317)))) (or ((_ is Undefined!6124) lt!269401) (ite ((_ is Found!6124) lt!269401) (= (select (arr!17728 lt!269317) (index!26736 lt!269401)) lt!269318) (and ((_ is MissingVacant!6124) lt!269401) (= (index!26738 lt!269401) vacantSpotIndex!68) (= (select (arr!17728 lt!269317) (index!26738 lt!269401)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86481 (= lt!269401 e!338942)))

(declare-fun c!67141 () Bool)

(assert (=> d!86481 (= c!67141 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86481 (= lt!269402 (select (arr!17728 lt!269317) index!984))))

(assert (=> d!86481 (validMask!0 mask!3053)))

(assert (=> d!86481 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269318 lt!269317 mask!3053) lt!269401)))

(declare-fun b!593407 () Bool)

(assert (=> b!593407 (= e!338940 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!269318 lt!269317 mask!3053))))

(assert (= (and d!86481 c!67141) b!593406))

(assert (= (and d!86481 (not c!67141)) b!593405))

(assert (= (and b!593405 c!67142) b!593408))

(assert (= (and b!593405 (not c!67142)) b!593404))

(assert (= (and b!593404 c!67140) b!593409))

(assert (= (and b!593404 (not c!67140)) b!593407))

(declare-fun m!571619 () Bool)

(assert (=> d!86481 m!571619))

(declare-fun m!571621 () Bool)

(assert (=> d!86481 m!571621))

(assert (=> d!86481 m!571569))

(assert (=> d!86481 m!571445))

(declare-fun m!571623 () Bool)

(assert (=> b!593407 m!571623))

(assert (=> b!593407 m!571623))

(declare-fun m!571625 () Bool)

(assert (=> b!593407 m!571625))

(assert (=> b!593221 d!86481))

(declare-fun d!86483 () Bool)

(declare-fun lt!269405 () (_ BitVec 32))

(assert (=> d!86483 (and (bvsge lt!269405 #b00000000000000000000000000000000) (bvslt lt!269405 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86483 (= lt!269405 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!86483 (validMask!0 mask!3053)))

(assert (=> d!86483 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!269405)))

(declare-fun bs!18321 () Bool)

(assert (= bs!18321 d!86483))

(declare-fun m!571627 () Bool)

(assert (=> bs!18321 m!571627))

(assert (=> bs!18321 m!571445))

(assert (=> b!593221 d!86483))

(declare-fun b!593442 () Bool)

(declare-fun e!338964 () Bool)

(declare-fun call!32862 () Bool)

(assert (=> b!593442 (= e!338964 call!32862)))

(declare-fun bm!32859 () Bool)

(assert (=> bm!32859 (= call!32862 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!86489 () Bool)

(declare-fun res!379872 () Bool)

(declare-fun e!338966 () Bool)

(assert (=> d!86489 (=> res!379872 e!338966)))

(assert (=> d!86489 (= res!379872 (bvsge #b00000000000000000000000000000000 (size!18092 a!2986)))))

(assert (=> d!86489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!338966)))

(declare-fun b!593443 () Bool)

(declare-fun e!338965 () Bool)

(assert (=> b!593443 (= e!338966 e!338965)))

(declare-fun c!67154 () Bool)

(assert (=> b!593443 (= c!67154 (validKeyInArray!0 (select (arr!17728 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593444 () Bool)

(assert (=> b!593444 (= e!338965 call!32862)))

(declare-fun b!593445 () Bool)

(assert (=> b!593445 (= e!338965 e!338964)))

(declare-fun lt!269427 () (_ BitVec 64))

(assert (=> b!593445 (= lt!269427 (select (arr!17728 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269428 () Unit!18589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36924 (_ BitVec 64) (_ BitVec 32)) Unit!18589)

(assert (=> b!593445 (= lt!269428 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269427 #b00000000000000000000000000000000))))

(assert (=> b!593445 (arrayContainsKey!0 a!2986 lt!269427 #b00000000000000000000000000000000)))

(declare-fun lt!269429 () Unit!18589)

(assert (=> b!593445 (= lt!269429 lt!269428)))

(declare-fun res!379871 () Bool)

(assert (=> b!593445 (= res!379871 (= (seekEntryOrOpen!0 (select (arr!17728 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6124 #b00000000000000000000000000000000)))))

(assert (=> b!593445 (=> (not res!379871) (not e!338964))))

(assert (= (and d!86489 (not res!379872)) b!593443))

(assert (= (and b!593443 c!67154) b!593445))

(assert (= (and b!593443 (not c!67154)) b!593444))

(assert (= (and b!593445 res!379871) b!593442))

(assert (= (or b!593442 b!593444) bm!32859))

(declare-fun m!571639 () Bool)

(assert (=> bm!32859 m!571639))

(assert (=> b!593443 m!571565))

(assert (=> b!593443 m!571565))

(assert (=> b!593443 m!571577))

(assert (=> b!593445 m!571565))

(declare-fun m!571641 () Bool)

(assert (=> b!593445 m!571641))

(declare-fun m!571643 () Bool)

(assert (=> b!593445 m!571643))

(assert (=> b!593445 m!571565))

(declare-fun m!571645 () Bool)

(assert (=> b!593445 m!571645))

(assert (=> b!593211 d!86489))

(declare-fun d!86493 () Bool)

(declare-fun res!379873 () Bool)

(declare-fun e!338970 () Bool)

(assert (=> d!86493 (=> res!379873 e!338970)))

(assert (=> d!86493 (= res!379873 (= (select (arr!17728 lt!269317) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17728 a!2986) j!136)))))

(assert (=> d!86493 (= (arrayContainsKey!0 lt!269317 (select (arr!17728 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!338970)))

(declare-fun b!593452 () Bool)

(declare-fun e!338971 () Bool)

(assert (=> b!593452 (= e!338970 e!338971)))

(declare-fun res!379874 () Bool)

(assert (=> b!593452 (=> (not res!379874) (not e!338971))))

(assert (=> b!593452 (= res!379874 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18092 lt!269317)))))

(declare-fun b!593453 () Bool)

(assert (=> b!593453 (= e!338971 (arrayContainsKey!0 lt!269317 (select (arr!17728 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86493 (not res!379873)) b!593452))

(assert (= (and b!593452 res!379874) b!593453))

(declare-fun m!571647 () Bool)

(assert (=> d!86493 m!571647))

(assert (=> b!593453 m!571425))

(declare-fun m!571649 () Bool)

(assert (=> b!593453 m!571649))

(assert (=> b!593224 d!86493))

(declare-fun d!86495 () Bool)

(assert (=> d!86495 (arrayContainsKey!0 lt!269317 (select (arr!17728 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269439 () Unit!18589)

(declare-fun choose!114 (array!36924 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18589)

(assert (=> d!86495 (= lt!269439 (choose!114 lt!269317 (select (arr!17728 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86495 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86495 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269317 (select (arr!17728 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269439)))

(declare-fun bs!18322 () Bool)

(assert (= bs!18322 d!86495))

(assert (=> bs!18322 m!571425))

(assert (=> bs!18322 m!571461))

(assert (=> bs!18322 m!571425))

(declare-fun m!571665 () Bool)

(assert (=> bs!18322 m!571665))

(assert (=> b!593224 d!86495))

(declare-fun b!593538 () Bool)

(declare-fun e!339020 () SeekEntryResult!6124)

(declare-fun lt!269468 () SeekEntryResult!6124)

(assert (=> b!593538 (= e!339020 (Found!6124 (index!26737 lt!269468)))))

(declare-fun e!339021 () SeekEntryResult!6124)

(declare-fun b!593539 () Bool)

(assert (=> b!593539 (= e!339021 (seekKeyOrZeroReturnVacant!0 (x!55680 lt!269468) (index!26737 lt!269468) (index!26737 lt!269468) k0!1786 a!2986 mask!3053))))

(declare-fun b!593540 () Bool)

(declare-fun e!339022 () SeekEntryResult!6124)

(assert (=> b!593540 (= e!339022 Undefined!6124)))

(declare-fun b!593541 () Bool)

(assert (=> b!593541 (= e!339021 (MissingZero!6124 (index!26737 lt!269468)))))

(declare-fun d!86499 () Bool)

(declare-fun lt!269467 () SeekEntryResult!6124)

(assert (=> d!86499 (and (or ((_ is Undefined!6124) lt!269467) (not ((_ is Found!6124) lt!269467)) (and (bvsge (index!26736 lt!269467) #b00000000000000000000000000000000) (bvslt (index!26736 lt!269467) (size!18092 a!2986)))) (or ((_ is Undefined!6124) lt!269467) ((_ is Found!6124) lt!269467) (not ((_ is MissingZero!6124) lt!269467)) (and (bvsge (index!26735 lt!269467) #b00000000000000000000000000000000) (bvslt (index!26735 lt!269467) (size!18092 a!2986)))) (or ((_ is Undefined!6124) lt!269467) ((_ is Found!6124) lt!269467) ((_ is MissingZero!6124) lt!269467) (not ((_ is MissingVacant!6124) lt!269467)) (and (bvsge (index!26738 lt!269467) #b00000000000000000000000000000000) (bvslt (index!26738 lt!269467) (size!18092 a!2986)))) (or ((_ is Undefined!6124) lt!269467) (ite ((_ is Found!6124) lt!269467) (= (select (arr!17728 a!2986) (index!26736 lt!269467)) k0!1786) (ite ((_ is MissingZero!6124) lt!269467) (= (select (arr!17728 a!2986) (index!26735 lt!269467)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6124) lt!269467) (= (select (arr!17728 a!2986) (index!26738 lt!269467)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86499 (= lt!269467 e!339022)))

(declare-fun c!67196 () Bool)

(assert (=> d!86499 (= c!67196 (and ((_ is Intermediate!6124) lt!269468) (undefined!6936 lt!269468)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36924 (_ BitVec 32)) SeekEntryResult!6124)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86499 (= lt!269468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86499 (validMask!0 mask!3053)))

(assert (=> d!86499 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269467)))

(declare-fun b!593542 () Bool)

(declare-fun c!67194 () Bool)

(declare-fun lt!269466 () (_ BitVec 64))

(assert (=> b!593542 (= c!67194 (= lt!269466 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593542 (= e!339020 e!339021)))

(declare-fun b!593543 () Bool)

(assert (=> b!593543 (= e!339022 e!339020)))

(assert (=> b!593543 (= lt!269466 (select (arr!17728 a!2986) (index!26737 lt!269468)))))

(declare-fun c!67195 () Bool)

(assert (=> b!593543 (= c!67195 (= lt!269466 k0!1786))))

(assert (= (and d!86499 c!67196) b!593540))

(assert (= (and d!86499 (not c!67196)) b!593543))

(assert (= (and b!593543 c!67195) b!593538))

(assert (= (and b!593543 (not c!67195)) b!593542))

(assert (= (and b!593542 c!67194) b!593541))

(assert (= (and b!593542 (not c!67194)) b!593539))

(declare-fun m!571719 () Bool)

(assert (=> b!593539 m!571719))

(assert (=> d!86499 m!571445))

(declare-fun m!571721 () Bool)

(assert (=> d!86499 m!571721))

(declare-fun m!571723 () Bool)

(assert (=> d!86499 m!571723))

(assert (=> d!86499 m!571723))

(declare-fun m!571725 () Bool)

(assert (=> d!86499 m!571725))

(declare-fun m!571727 () Bool)

(assert (=> d!86499 m!571727))

(declare-fun m!571729 () Bool)

(assert (=> d!86499 m!571729))

(declare-fun m!571731 () Bool)

(assert (=> b!593543 m!571731))

(assert (=> b!593223 d!86499))

(declare-fun d!86519 () Bool)

(declare-fun res!379887 () Bool)

(declare-fun e!339023 () Bool)

(assert (=> d!86519 (=> res!379887 e!339023)))

(assert (=> d!86519 (= res!379887 (= (select (arr!17728 lt!269317) j!136) (select (arr!17728 a!2986) j!136)))))

(assert (=> d!86519 (= (arrayContainsKey!0 lt!269317 (select (arr!17728 a!2986) j!136) j!136) e!339023)))

(declare-fun b!593544 () Bool)

(declare-fun e!339024 () Bool)

(assert (=> b!593544 (= e!339023 e!339024)))

(declare-fun res!379888 () Bool)

(assert (=> b!593544 (=> (not res!379888) (not e!339024))))

(assert (=> b!593544 (= res!379888 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18092 lt!269317)))))

(declare-fun b!593545 () Bool)

(assert (=> b!593545 (= e!339024 (arrayContainsKey!0 lt!269317 (select (arr!17728 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86519 (not res!379887)) b!593544))

(assert (= (and b!593544 res!379888) b!593545))

(declare-fun m!571733 () Bool)

(assert (=> d!86519 m!571733))

(assert (=> b!593545 m!571425))

(declare-fun m!571735 () Bool)

(assert (=> b!593545 m!571735))

(assert (=> b!593225 d!86519))

(declare-fun d!86521 () Bool)

(assert (=> d!86521 (= (validKeyInArray!0 (select (arr!17728 a!2986) j!136)) (and (not (= (select (arr!17728 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17728 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593214 d!86521))

(declare-fun b!593546 () Bool)

(declare-fun c!67197 () Bool)

(declare-fun lt!269470 () (_ BitVec 64))

(assert (=> b!593546 (= c!67197 (= lt!269470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339026 () SeekEntryResult!6124)

(declare-fun e!339025 () SeekEntryResult!6124)

(assert (=> b!593546 (= e!339026 e!339025)))

(declare-fun b!593547 () Bool)

(declare-fun e!339027 () SeekEntryResult!6124)

(assert (=> b!593547 (= e!339027 e!339026)))

(declare-fun c!67199 () Bool)

(assert (=> b!593547 (= c!67199 (= lt!269470 (select (arr!17728 a!2986) j!136)))))

(declare-fun b!593548 () Bool)

(assert (=> b!593548 (= e!339027 Undefined!6124)))

(declare-fun b!593550 () Bool)

(assert (=> b!593550 (= e!339026 (Found!6124 index!984))))

(declare-fun b!593551 () Bool)

(assert (=> b!593551 (= e!339025 (MissingVacant!6124 vacantSpotIndex!68))))

(declare-fun lt!269469 () SeekEntryResult!6124)

(declare-fun d!86523 () Bool)

(assert (=> d!86523 (and (or ((_ is Undefined!6124) lt!269469) (not ((_ is Found!6124) lt!269469)) (and (bvsge (index!26736 lt!269469) #b00000000000000000000000000000000) (bvslt (index!26736 lt!269469) (size!18092 a!2986)))) (or ((_ is Undefined!6124) lt!269469) ((_ is Found!6124) lt!269469) (not ((_ is MissingVacant!6124) lt!269469)) (not (= (index!26738 lt!269469) vacantSpotIndex!68)) (and (bvsge (index!26738 lt!269469) #b00000000000000000000000000000000) (bvslt (index!26738 lt!269469) (size!18092 a!2986)))) (or ((_ is Undefined!6124) lt!269469) (ite ((_ is Found!6124) lt!269469) (= (select (arr!17728 a!2986) (index!26736 lt!269469)) (select (arr!17728 a!2986) j!136)) (and ((_ is MissingVacant!6124) lt!269469) (= (index!26738 lt!269469) vacantSpotIndex!68) (= (select (arr!17728 a!2986) (index!26738 lt!269469)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86523 (= lt!269469 e!339027)))

(declare-fun c!67198 () Bool)

(assert (=> d!86523 (= c!67198 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86523 (= lt!269470 (select (arr!17728 a!2986) index!984))))

(assert (=> d!86523 (validMask!0 mask!3053)))

(assert (=> d!86523 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053) lt!269469)))

(declare-fun b!593549 () Bool)

(assert (=> b!593549 (= e!339025 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!86523 c!67198) b!593548))

(assert (= (and d!86523 (not c!67198)) b!593547))

(assert (= (and b!593547 c!67199) b!593550))

(assert (= (and b!593547 (not c!67199)) b!593546))

(assert (= (and b!593546 c!67197) b!593551))

(assert (= (and b!593546 (not c!67197)) b!593549))

(declare-fun m!571737 () Bool)

(assert (=> d!86523 m!571737))

(declare-fun m!571739 () Bool)

(assert (=> d!86523 m!571739))

(assert (=> d!86523 m!571439))

(assert (=> d!86523 m!571445))

(assert (=> b!593549 m!571623))

(assert (=> b!593549 m!571623))

(assert (=> b!593549 m!571425))

(declare-fun m!571741 () Bool)

(assert (=> b!593549 m!571741))

(assert (=> b!593216 d!86523))

(declare-fun d!86525 () Bool)

(assert (=> d!86525 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593226 d!86525))

(check-sat (not b!593367) (not b!593362) (not b!593361) (not bm!32853) (not d!86459) (not d!86479) (not b!593445) (not b!593453) (not d!86495) (not b!593349) (not d!86461) (not b!593407) (not d!86499) (not d!86523) (not b!593443) (not b!593539) (not b!593545) (not d!86481) (not d!86483) (not b!593549) (not b!593347) (not b!593360) (not bm!32859) (not b!593401) (not b!593395))
(check-sat)
