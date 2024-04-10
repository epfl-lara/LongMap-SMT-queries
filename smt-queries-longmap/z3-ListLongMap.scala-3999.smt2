; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54186 () Bool)

(assert start!54186)

(declare-fun res!379270 () Bool)

(declare-fun e!338311 () Bool)

(assert (=> start!54186 (=> (not res!379270) (not e!338311))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54186 (= res!379270 (validMask!0 mask!3053))))

(assert (=> start!54186 e!338311))

(assert (=> start!54186 true))

(declare-datatypes ((array!36916 0))(
  ( (array!36917 (arr!17728 (Array (_ BitVec 32) (_ BitVec 64))) (size!18092 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36916)

(declare-fun array_inv!13524 (array!36916) Bool)

(assert (=> start!54186 (array_inv!13524 a!2986)))

(declare-fun b!592427 () Bool)

(declare-datatypes ((Unit!18590 0))(
  ( (Unit!18591) )
))
(declare-fun e!338321 () Unit!18590)

(declare-fun Unit!18592 () Unit!18590)

(assert (=> b!592427 (= e!338321 Unit!18592)))

(assert (=> b!592427 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!592428 () Bool)

(declare-fun e!338317 () Bool)

(declare-fun lt!268929 () array!36916)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592428 (= e!338317 (arrayContainsKey!0 lt!268929 (select (arr!17728 a!2986) j!136) index!984))))

(declare-fun b!592429 () Bool)

(declare-fun e!338314 () Bool)

(declare-fun e!338320 () Bool)

(assert (=> b!592429 (= e!338314 e!338320)))

(declare-fun res!379264 () Bool)

(assert (=> b!592429 (=> res!379264 e!338320)))

(declare-fun lt!268932 () (_ BitVec 64))

(declare-fun lt!268926 () (_ BitVec 64))

(assert (=> b!592429 (= res!379264 (or (not (= (select (arr!17728 a!2986) j!136) lt!268932)) (not (= (select (arr!17728 a!2986) j!136) lt!268926)) (bvsge j!136 index!984)))))

(declare-fun b!592430 () Bool)

(declare-fun res!379267 () Bool)

(assert (=> b!592430 (=> (not res!379267) (not e!338311))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592430 (= res!379267 (validKeyInArray!0 k0!1786))))

(declare-fun b!592431 () Bool)

(declare-fun e!338312 () Bool)

(declare-fun e!338313 () Bool)

(assert (=> b!592431 (= e!338312 (not e!338313))))

(declare-fun res!379262 () Bool)

(assert (=> b!592431 (=> res!379262 e!338313)))

(declare-datatypes ((SeekEntryResult!6168 0))(
  ( (MissingZero!6168 (index!26908 (_ BitVec 32))) (Found!6168 (index!26909 (_ BitVec 32))) (Intermediate!6168 (undefined!6980 Bool) (index!26910 (_ BitVec 32)) (x!55696 (_ BitVec 32))) (Undefined!6168) (MissingVacant!6168 (index!26911 (_ BitVec 32))) )
))
(declare-fun lt!268933 () SeekEntryResult!6168)

(assert (=> b!592431 (= res!379262 (not (= lt!268933 (Found!6168 index!984))))))

(declare-fun lt!268931 () Unit!18590)

(assert (=> b!592431 (= lt!268931 e!338321)))

(declare-fun c!66950 () Bool)

(assert (=> b!592431 (= c!66950 (= lt!268933 Undefined!6168))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36916 (_ BitVec 32)) SeekEntryResult!6168)

(assert (=> b!592431 (= lt!268933 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268932 lt!268929 mask!3053))))

(declare-fun e!338319 () Bool)

(assert (=> b!592431 e!338319))

(declare-fun res!379274 () Bool)

(assert (=> b!592431 (=> (not res!379274) (not e!338319))))

(declare-fun lt!268930 () (_ BitVec 32))

(declare-fun lt!268927 () SeekEntryResult!6168)

(assert (=> b!592431 (= res!379274 (= lt!268927 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268930 vacantSpotIndex!68 lt!268932 lt!268929 mask!3053)))))

(assert (=> b!592431 (= lt!268927 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268930 vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!592431 (= lt!268932 (select (store (arr!17728 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268934 () Unit!18590)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36916 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18590)

(assert (=> b!592431 (= lt!268934 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268930 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592431 (= lt!268930 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592432 () Bool)

(declare-fun e!338322 () Bool)

(assert (=> b!592432 (= e!338322 (or (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18092 a!2986)) (bvslt (size!18092 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!592432 (arrayContainsKey!0 lt!268929 (select (arr!17728 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268928 () Unit!18590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36916 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18590)

(assert (=> b!592432 (= lt!268928 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268929 (select (arr!17728 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592433 () Bool)

(declare-fun res!379265 () Bool)

(assert (=> b!592433 (=> (not res!379265) (not e!338311))))

(assert (=> b!592433 (= res!379265 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592434 () Bool)

(declare-fun res!379263 () Bool)

(assert (=> b!592434 (=> (not res!379263) (not e!338311))))

(assert (=> b!592434 (= res!379263 (and (= (size!18092 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18092 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18092 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592435 () Bool)

(declare-fun res!379261 () Bool)

(declare-fun e!338315 () Bool)

(assert (=> b!592435 (=> (not res!379261) (not e!338315))))

(declare-datatypes ((List!11769 0))(
  ( (Nil!11766) (Cons!11765 (h!12810 (_ BitVec 64)) (t!17997 List!11769)) )
))
(declare-fun arrayNoDuplicates!0 (array!36916 (_ BitVec 32) List!11769) Bool)

(assert (=> b!592435 (= res!379261 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11766))))

(declare-fun b!592436 () Bool)

(assert (=> b!592436 (= e!338320 e!338317)))

(declare-fun res!379269 () Bool)

(assert (=> b!592436 (=> (not res!379269) (not e!338317))))

(assert (=> b!592436 (= res!379269 (arrayContainsKey!0 lt!268929 (select (arr!17728 a!2986) j!136) j!136))))

(declare-fun b!592437 () Bool)

(declare-fun lt!268936 () SeekEntryResult!6168)

(assert (=> b!592437 (= e!338319 (= lt!268936 lt!268927))))

(declare-fun b!592438 () Bool)

(declare-fun res!379273 () Bool)

(assert (=> b!592438 (=> (not res!379273) (not e!338311))))

(assert (=> b!592438 (= res!379273 (validKeyInArray!0 (select (arr!17728 a!2986) j!136)))))

(declare-fun b!592439 () Bool)

(declare-fun e!338316 () Bool)

(assert (=> b!592439 (= e!338316 e!338312)))

(declare-fun res!379276 () Bool)

(assert (=> b!592439 (=> (not res!379276) (not e!338312))))

(assert (=> b!592439 (= res!379276 (and (= lt!268936 (Found!6168 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17728 a!2986) index!984) (select (arr!17728 a!2986) j!136))) (not (= (select (arr!17728 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592439 (= lt!268936 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592440 () Bool)

(assert (=> b!592440 (= e!338313 e!338322)))

(declare-fun res!379271 () Bool)

(assert (=> b!592440 (=> res!379271 e!338322)))

(assert (=> b!592440 (= res!379271 (or (not (= (select (arr!17728 a!2986) j!136) lt!268932)) (not (= (select (arr!17728 a!2986) j!136) lt!268926)) (bvsge j!136 index!984)))))

(assert (=> b!592440 e!338314))

(declare-fun res!379272 () Bool)

(assert (=> b!592440 (=> (not res!379272) (not e!338314))))

(assert (=> b!592440 (= res!379272 (= lt!268926 (select (arr!17728 a!2986) j!136)))))

(assert (=> b!592440 (= lt!268926 (select (store (arr!17728 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!592441 () Bool)

(declare-fun res!379277 () Bool)

(assert (=> b!592441 (=> (not res!379277) (not e!338315))))

(assert (=> b!592441 (= res!379277 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17728 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592442 () Bool)

(declare-fun res!379266 () Bool)

(assert (=> b!592442 (=> (not res!379266) (not e!338315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36916 (_ BitVec 32)) Bool)

(assert (=> b!592442 (= res!379266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592443 () Bool)

(assert (=> b!592443 (= e!338315 e!338316)))

(declare-fun res!379275 () Bool)

(assert (=> b!592443 (=> (not res!379275) (not e!338316))))

(assert (=> b!592443 (= res!379275 (= (select (store (arr!17728 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592443 (= lt!268929 (array!36917 (store (arr!17728 a!2986) i!1108 k0!1786) (size!18092 a!2986)))))

(declare-fun b!592444 () Bool)

(declare-fun Unit!18593 () Unit!18590)

(assert (=> b!592444 (= e!338321 Unit!18593)))

(declare-fun b!592445 () Bool)

(assert (=> b!592445 (= e!338311 e!338315)))

(declare-fun res!379268 () Bool)

(assert (=> b!592445 (=> (not res!379268) (not e!338315))))

(declare-fun lt!268935 () SeekEntryResult!6168)

(assert (=> b!592445 (= res!379268 (or (= lt!268935 (MissingZero!6168 i!1108)) (= lt!268935 (MissingVacant!6168 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36916 (_ BitVec 32)) SeekEntryResult!6168)

(assert (=> b!592445 (= lt!268935 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!54186 res!379270) b!592434))

(assert (= (and b!592434 res!379263) b!592438))

(assert (= (and b!592438 res!379273) b!592430))

(assert (= (and b!592430 res!379267) b!592433))

(assert (= (and b!592433 res!379265) b!592445))

(assert (= (and b!592445 res!379268) b!592442))

(assert (= (and b!592442 res!379266) b!592435))

(assert (= (and b!592435 res!379261) b!592441))

(assert (= (and b!592441 res!379277) b!592443))

(assert (= (and b!592443 res!379275) b!592439))

(assert (= (and b!592439 res!379276) b!592431))

(assert (= (and b!592431 res!379274) b!592437))

(assert (= (and b!592431 c!66950) b!592427))

(assert (= (and b!592431 (not c!66950)) b!592444))

(assert (= (and b!592431 (not res!379262)) b!592440))

(assert (= (and b!592440 res!379272) b!592429))

(assert (= (and b!592429 (not res!379264)) b!592436))

(assert (= (and b!592436 res!379269) b!592428))

(assert (= (and b!592440 (not res!379271)) b!592432))

(declare-fun m!570537 () Bool)

(assert (=> b!592442 m!570537))

(declare-fun m!570539 () Bool)

(assert (=> b!592435 m!570539))

(declare-fun m!570541 () Bool)

(assert (=> b!592428 m!570541))

(assert (=> b!592428 m!570541))

(declare-fun m!570543 () Bool)

(assert (=> b!592428 m!570543))

(declare-fun m!570545 () Bool)

(assert (=> b!592441 m!570545))

(declare-fun m!570547 () Bool)

(assert (=> b!592430 m!570547))

(assert (=> b!592429 m!570541))

(declare-fun m!570549 () Bool)

(assert (=> b!592431 m!570549))

(declare-fun m!570551 () Bool)

(assert (=> b!592431 m!570551))

(assert (=> b!592431 m!570541))

(declare-fun m!570553 () Bool)

(assert (=> b!592431 m!570553))

(assert (=> b!592431 m!570541))

(declare-fun m!570555 () Bool)

(assert (=> b!592431 m!570555))

(declare-fun m!570557 () Bool)

(assert (=> b!592431 m!570557))

(declare-fun m!570559 () Bool)

(assert (=> b!592431 m!570559))

(declare-fun m!570561 () Bool)

(assert (=> b!592431 m!570561))

(assert (=> b!592438 m!570541))

(assert (=> b!592438 m!570541))

(declare-fun m!570563 () Bool)

(assert (=> b!592438 m!570563))

(assert (=> b!592440 m!570541))

(assert (=> b!592440 m!570553))

(declare-fun m!570565 () Bool)

(assert (=> b!592440 m!570565))

(declare-fun m!570567 () Bool)

(assert (=> b!592433 m!570567))

(assert (=> b!592436 m!570541))

(assert (=> b!592436 m!570541))

(declare-fun m!570569 () Bool)

(assert (=> b!592436 m!570569))

(declare-fun m!570571 () Bool)

(assert (=> start!54186 m!570571))

(declare-fun m!570573 () Bool)

(assert (=> start!54186 m!570573))

(declare-fun m!570575 () Bool)

(assert (=> b!592439 m!570575))

(assert (=> b!592439 m!570541))

(assert (=> b!592439 m!570541))

(declare-fun m!570577 () Bool)

(assert (=> b!592439 m!570577))

(declare-fun m!570579 () Bool)

(assert (=> b!592445 m!570579))

(assert (=> b!592432 m!570541))

(assert (=> b!592432 m!570541))

(declare-fun m!570581 () Bool)

(assert (=> b!592432 m!570581))

(assert (=> b!592432 m!570541))

(declare-fun m!570583 () Bool)

(assert (=> b!592432 m!570583))

(assert (=> b!592443 m!570553))

(declare-fun m!570585 () Bool)

(assert (=> b!592443 m!570585))

(check-sat (not start!54186) (not b!592442) (not b!592428) (not b!592432) (not b!592433) (not b!592445) (not b!592431) (not b!592439) (not b!592435) (not b!592430) (not b!592436) (not b!592438))
(check-sat)
(get-model)

(declare-fun d!86225 () Bool)

(declare-fun lt!268974 () SeekEntryResult!6168)

(get-info :version)

(assert (=> d!86225 (and (or ((_ is Undefined!6168) lt!268974) (not ((_ is Found!6168) lt!268974)) (and (bvsge (index!26909 lt!268974) #b00000000000000000000000000000000) (bvslt (index!26909 lt!268974) (size!18092 a!2986)))) (or ((_ is Undefined!6168) lt!268974) ((_ is Found!6168) lt!268974) (not ((_ is MissingVacant!6168) lt!268974)) (not (= (index!26911 lt!268974) vacantSpotIndex!68)) (and (bvsge (index!26911 lt!268974) #b00000000000000000000000000000000) (bvslt (index!26911 lt!268974) (size!18092 a!2986)))) (or ((_ is Undefined!6168) lt!268974) (ite ((_ is Found!6168) lt!268974) (= (select (arr!17728 a!2986) (index!26909 lt!268974)) (select (arr!17728 a!2986) j!136)) (and ((_ is MissingVacant!6168) lt!268974) (= (index!26911 lt!268974) vacantSpotIndex!68) (= (select (arr!17728 a!2986) (index!26911 lt!268974)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338365 () SeekEntryResult!6168)

(assert (=> d!86225 (= lt!268974 e!338365)))

(declare-fun c!66961 () Bool)

(assert (=> d!86225 (= c!66961 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!268975 () (_ BitVec 64))

(assert (=> d!86225 (= lt!268975 (select (arr!17728 a!2986) index!984))))

(assert (=> d!86225 (validMask!0 mask!3053)))

(assert (=> d!86225 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053) lt!268974)))

(declare-fun b!592515 () Bool)

(assert (=> b!592515 (= e!338365 Undefined!6168)))

(declare-fun b!592516 () Bool)

(declare-fun e!338367 () SeekEntryResult!6168)

(assert (=> b!592516 (= e!338365 e!338367)))

(declare-fun c!66962 () Bool)

(assert (=> b!592516 (= c!66962 (= lt!268975 (select (arr!17728 a!2986) j!136)))))

(declare-fun b!592517 () Bool)

(declare-fun e!338366 () SeekEntryResult!6168)

(assert (=> b!592517 (= e!338366 (MissingVacant!6168 vacantSpotIndex!68))))

(declare-fun b!592518 () Bool)

(declare-fun c!66960 () Bool)

(assert (=> b!592518 (= c!66960 (= lt!268975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592518 (= e!338367 e!338366)))

(declare-fun b!592519 () Bool)

(assert (=> b!592519 (= e!338367 (Found!6168 index!984))))

(declare-fun b!592520 () Bool)

(assert (=> b!592520 (= e!338366 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!86225 c!66961) b!592515))

(assert (= (and d!86225 (not c!66961)) b!592516))

(assert (= (and b!592516 c!66962) b!592519))

(assert (= (and b!592516 (not c!66962)) b!592518))

(assert (= (and b!592518 c!66960) b!592517))

(assert (= (and b!592518 (not c!66960)) b!592520))

(declare-fun m!570637 () Bool)

(assert (=> d!86225 m!570637))

(declare-fun m!570639 () Bool)

(assert (=> d!86225 m!570639))

(assert (=> d!86225 m!570575))

(assert (=> d!86225 m!570571))

(assert (=> b!592520 m!570549))

(assert (=> b!592520 m!570549))

(assert (=> b!592520 m!570541))

(declare-fun m!570641 () Bool)

(assert (=> b!592520 m!570641))

(assert (=> b!592439 d!86225))

(declare-fun d!86227 () Bool)

(declare-fun res!379333 () Bool)

(declare-fun e!338372 () Bool)

(assert (=> d!86227 (=> res!379333 e!338372)))

(assert (=> d!86227 (= res!379333 (= (select (arr!17728 lt!268929) index!984) (select (arr!17728 a!2986) j!136)))))

(assert (=> d!86227 (= (arrayContainsKey!0 lt!268929 (select (arr!17728 a!2986) j!136) index!984) e!338372)))

(declare-fun b!592525 () Bool)

(declare-fun e!338373 () Bool)

(assert (=> b!592525 (= e!338372 e!338373)))

(declare-fun res!379334 () Bool)

(assert (=> b!592525 (=> (not res!379334) (not e!338373))))

(assert (=> b!592525 (= res!379334 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18092 lt!268929)))))

(declare-fun b!592526 () Bool)

(assert (=> b!592526 (= e!338373 (arrayContainsKey!0 lt!268929 (select (arr!17728 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86227 (not res!379333)) b!592525))

(assert (= (and b!592525 res!379334) b!592526))

(declare-fun m!570643 () Bool)

(assert (=> d!86227 m!570643))

(assert (=> b!592526 m!570541))

(declare-fun m!570645 () Bool)

(assert (=> b!592526 m!570645))

(assert (=> b!592428 d!86227))

(declare-fun d!86229 () Bool)

(assert (=> d!86229 (= (validKeyInArray!0 (select (arr!17728 a!2986) j!136)) (and (not (= (select (arr!17728 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17728 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592438 d!86229))

(declare-fun lt!268976 () SeekEntryResult!6168)

(declare-fun d!86231 () Bool)

(assert (=> d!86231 (and (or ((_ is Undefined!6168) lt!268976) (not ((_ is Found!6168) lt!268976)) (and (bvsge (index!26909 lt!268976) #b00000000000000000000000000000000) (bvslt (index!26909 lt!268976) (size!18092 a!2986)))) (or ((_ is Undefined!6168) lt!268976) ((_ is Found!6168) lt!268976) (not ((_ is MissingVacant!6168) lt!268976)) (not (= (index!26911 lt!268976) vacantSpotIndex!68)) (and (bvsge (index!26911 lt!268976) #b00000000000000000000000000000000) (bvslt (index!26911 lt!268976) (size!18092 a!2986)))) (or ((_ is Undefined!6168) lt!268976) (ite ((_ is Found!6168) lt!268976) (= (select (arr!17728 a!2986) (index!26909 lt!268976)) (select (arr!17728 a!2986) j!136)) (and ((_ is MissingVacant!6168) lt!268976) (= (index!26911 lt!268976) vacantSpotIndex!68) (= (select (arr!17728 a!2986) (index!26911 lt!268976)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338374 () SeekEntryResult!6168)

(assert (=> d!86231 (= lt!268976 e!338374)))

(declare-fun c!66964 () Bool)

(assert (=> d!86231 (= c!66964 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!268977 () (_ BitVec 64))

(assert (=> d!86231 (= lt!268977 (select (arr!17728 a!2986) lt!268930))))

(assert (=> d!86231 (validMask!0 mask!3053)))

(assert (=> d!86231 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268930 vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053) lt!268976)))

(declare-fun b!592527 () Bool)

(assert (=> b!592527 (= e!338374 Undefined!6168)))

(declare-fun b!592528 () Bool)

(declare-fun e!338376 () SeekEntryResult!6168)

(assert (=> b!592528 (= e!338374 e!338376)))

(declare-fun c!66965 () Bool)

(assert (=> b!592528 (= c!66965 (= lt!268977 (select (arr!17728 a!2986) j!136)))))

(declare-fun b!592529 () Bool)

(declare-fun e!338375 () SeekEntryResult!6168)

(assert (=> b!592529 (= e!338375 (MissingVacant!6168 vacantSpotIndex!68))))

(declare-fun b!592530 () Bool)

(declare-fun c!66963 () Bool)

(assert (=> b!592530 (= c!66963 (= lt!268977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592530 (= e!338376 e!338375)))

(declare-fun b!592531 () Bool)

(assert (=> b!592531 (= e!338376 (Found!6168 lt!268930))))

(declare-fun b!592532 () Bool)

(assert (=> b!592532 (= e!338375 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!268930 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!86231 c!66964) b!592527))

(assert (= (and d!86231 (not c!66964)) b!592528))

(assert (= (and b!592528 c!66965) b!592531))

(assert (= (and b!592528 (not c!66965)) b!592530))

(assert (= (and b!592530 c!66963) b!592529))

(assert (= (and b!592530 (not c!66963)) b!592532))

(declare-fun m!570647 () Bool)

(assert (=> d!86231 m!570647))

(declare-fun m!570649 () Bool)

(assert (=> d!86231 m!570649))

(declare-fun m!570651 () Bool)

(assert (=> d!86231 m!570651))

(assert (=> d!86231 m!570571))

(declare-fun m!570653 () Bool)

(assert (=> b!592532 m!570653))

(assert (=> b!592532 m!570653))

(assert (=> b!592532 m!570541))

(declare-fun m!570655 () Bool)

(assert (=> b!592532 m!570655))

(assert (=> b!592431 d!86231))

(declare-fun d!86233 () Bool)

(declare-fun e!338379 () Bool)

(assert (=> d!86233 e!338379))

(declare-fun res!379337 () Bool)

(assert (=> d!86233 (=> (not res!379337) (not e!338379))))

(assert (=> d!86233 (= res!379337 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18092 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18092 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18092 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18092 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18092 a!2986))))))

(declare-fun lt!268980 () Unit!18590)

(declare-fun choose!9 (array!36916 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18590)

(assert (=> d!86233 (= lt!268980 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268930 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86233 (validMask!0 mask!3053)))

(assert (=> d!86233 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268930 vacantSpotIndex!68 mask!3053) lt!268980)))

(declare-fun b!592535 () Bool)

(assert (=> b!592535 (= e!338379 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268930 vacantSpotIndex!68 (select (arr!17728 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268930 vacantSpotIndex!68 (select (store (arr!17728 a!2986) i!1108 k0!1786) j!136) (array!36917 (store (arr!17728 a!2986) i!1108 k0!1786) (size!18092 a!2986)) mask!3053)))))

(assert (= (and d!86233 res!379337) b!592535))

(declare-fun m!570657 () Bool)

(assert (=> d!86233 m!570657))

(assert (=> d!86233 m!570571))

(assert (=> b!592535 m!570541))

(assert (=> b!592535 m!570551))

(assert (=> b!592535 m!570553))

(assert (=> b!592535 m!570551))

(declare-fun m!570659 () Bool)

(assert (=> b!592535 m!570659))

(assert (=> b!592535 m!570541))

(assert (=> b!592535 m!570555))

(assert (=> b!592431 d!86233))

(declare-fun d!86235 () Bool)

(declare-fun lt!268983 () (_ BitVec 32))

(assert (=> d!86235 (and (bvsge lt!268983 #b00000000000000000000000000000000) (bvslt lt!268983 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86235 (= lt!268983 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86235 (validMask!0 mask!3053)))

(assert (=> d!86235 (= (nextIndex!0 index!984 x!910 mask!3053) lt!268983)))

(declare-fun bs!18289 () Bool)

(assert (= bs!18289 d!86235))

(declare-fun m!570661 () Bool)

(assert (=> bs!18289 m!570661))

(assert (=> bs!18289 m!570571))

(assert (=> b!592431 d!86235))

(declare-fun lt!268984 () SeekEntryResult!6168)

(declare-fun d!86237 () Bool)

(assert (=> d!86237 (and (or ((_ is Undefined!6168) lt!268984) (not ((_ is Found!6168) lt!268984)) (and (bvsge (index!26909 lt!268984) #b00000000000000000000000000000000) (bvslt (index!26909 lt!268984) (size!18092 lt!268929)))) (or ((_ is Undefined!6168) lt!268984) ((_ is Found!6168) lt!268984) (not ((_ is MissingVacant!6168) lt!268984)) (not (= (index!26911 lt!268984) vacantSpotIndex!68)) (and (bvsge (index!26911 lt!268984) #b00000000000000000000000000000000) (bvslt (index!26911 lt!268984) (size!18092 lt!268929)))) (or ((_ is Undefined!6168) lt!268984) (ite ((_ is Found!6168) lt!268984) (= (select (arr!17728 lt!268929) (index!26909 lt!268984)) lt!268932) (and ((_ is MissingVacant!6168) lt!268984) (= (index!26911 lt!268984) vacantSpotIndex!68) (= (select (arr!17728 lt!268929) (index!26911 lt!268984)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338380 () SeekEntryResult!6168)

(assert (=> d!86237 (= lt!268984 e!338380)))

(declare-fun c!66967 () Bool)

(assert (=> d!86237 (= c!66967 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!268985 () (_ BitVec 64))

(assert (=> d!86237 (= lt!268985 (select (arr!17728 lt!268929) index!984))))

(assert (=> d!86237 (validMask!0 mask!3053)))

(assert (=> d!86237 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268932 lt!268929 mask!3053) lt!268984)))

(declare-fun b!592536 () Bool)

(assert (=> b!592536 (= e!338380 Undefined!6168)))

(declare-fun b!592537 () Bool)

(declare-fun e!338382 () SeekEntryResult!6168)

(assert (=> b!592537 (= e!338380 e!338382)))

(declare-fun c!66968 () Bool)

(assert (=> b!592537 (= c!66968 (= lt!268985 lt!268932))))

(declare-fun b!592538 () Bool)

(declare-fun e!338381 () SeekEntryResult!6168)

(assert (=> b!592538 (= e!338381 (MissingVacant!6168 vacantSpotIndex!68))))

(declare-fun b!592539 () Bool)

(declare-fun c!66966 () Bool)

(assert (=> b!592539 (= c!66966 (= lt!268985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592539 (= e!338382 e!338381)))

(declare-fun b!592540 () Bool)

(assert (=> b!592540 (= e!338382 (Found!6168 index!984))))

(declare-fun b!592541 () Bool)

(assert (=> b!592541 (= e!338381 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!268932 lt!268929 mask!3053))))

(assert (= (and d!86237 c!66967) b!592536))

(assert (= (and d!86237 (not c!66967)) b!592537))

(assert (= (and b!592537 c!66968) b!592540))

(assert (= (and b!592537 (not c!66968)) b!592539))

(assert (= (and b!592539 c!66966) b!592538))

(assert (= (and b!592539 (not c!66966)) b!592541))

(declare-fun m!570663 () Bool)

(assert (=> d!86237 m!570663))

(declare-fun m!570665 () Bool)

(assert (=> d!86237 m!570665))

(assert (=> d!86237 m!570643))

(assert (=> d!86237 m!570571))

(assert (=> b!592541 m!570549))

(assert (=> b!592541 m!570549))

(declare-fun m!570667 () Bool)

(assert (=> b!592541 m!570667))

(assert (=> b!592431 d!86237))

(declare-fun d!86239 () Bool)

(declare-fun lt!268986 () SeekEntryResult!6168)

(assert (=> d!86239 (and (or ((_ is Undefined!6168) lt!268986) (not ((_ is Found!6168) lt!268986)) (and (bvsge (index!26909 lt!268986) #b00000000000000000000000000000000) (bvslt (index!26909 lt!268986) (size!18092 lt!268929)))) (or ((_ is Undefined!6168) lt!268986) ((_ is Found!6168) lt!268986) (not ((_ is MissingVacant!6168) lt!268986)) (not (= (index!26911 lt!268986) vacantSpotIndex!68)) (and (bvsge (index!26911 lt!268986) #b00000000000000000000000000000000) (bvslt (index!26911 lt!268986) (size!18092 lt!268929)))) (or ((_ is Undefined!6168) lt!268986) (ite ((_ is Found!6168) lt!268986) (= (select (arr!17728 lt!268929) (index!26909 lt!268986)) lt!268932) (and ((_ is MissingVacant!6168) lt!268986) (= (index!26911 lt!268986) vacantSpotIndex!68) (= (select (arr!17728 lt!268929) (index!26911 lt!268986)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338383 () SeekEntryResult!6168)

(assert (=> d!86239 (= lt!268986 e!338383)))

(declare-fun c!66970 () Bool)

(assert (=> d!86239 (= c!66970 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!268987 () (_ BitVec 64))

(assert (=> d!86239 (= lt!268987 (select (arr!17728 lt!268929) lt!268930))))

(assert (=> d!86239 (validMask!0 mask!3053)))

(assert (=> d!86239 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268930 vacantSpotIndex!68 lt!268932 lt!268929 mask!3053) lt!268986)))

(declare-fun b!592542 () Bool)

(assert (=> b!592542 (= e!338383 Undefined!6168)))

(declare-fun b!592543 () Bool)

(declare-fun e!338385 () SeekEntryResult!6168)

(assert (=> b!592543 (= e!338383 e!338385)))

(declare-fun c!66971 () Bool)

(assert (=> b!592543 (= c!66971 (= lt!268987 lt!268932))))

(declare-fun b!592544 () Bool)

(declare-fun e!338384 () SeekEntryResult!6168)

(assert (=> b!592544 (= e!338384 (MissingVacant!6168 vacantSpotIndex!68))))

(declare-fun b!592545 () Bool)

(declare-fun c!66969 () Bool)

(assert (=> b!592545 (= c!66969 (= lt!268987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592545 (= e!338385 e!338384)))

(declare-fun b!592546 () Bool)

(assert (=> b!592546 (= e!338385 (Found!6168 lt!268930))))

(declare-fun b!592547 () Bool)

(assert (=> b!592547 (= e!338384 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!268930 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!268932 lt!268929 mask!3053))))

(assert (= (and d!86239 c!66970) b!592542))

(assert (= (and d!86239 (not c!66970)) b!592543))

(assert (= (and b!592543 c!66971) b!592546))

(assert (= (and b!592543 (not c!66971)) b!592545))

(assert (= (and b!592545 c!66969) b!592544))

(assert (= (and b!592545 (not c!66969)) b!592547))

(declare-fun m!570669 () Bool)

(assert (=> d!86239 m!570669))

(declare-fun m!570671 () Bool)

(assert (=> d!86239 m!570671))

(declare-fun m!570673 () Bool)

(assert (=> d!86239 m!570673))

(assert (=> d!86239 m!570571))

(assert (=> b!592547 m!570653))

(assert (=> b!592547 m!570653))

(declare-fun m!570675 () Bool)

(assert (=> b!592547 m!570675))

(assert (=> b!592431 d!86239))

(declare-fun bm!32831 () Bool)

(declare-fun call!32834 () Bool)

(assert (=> bm!32831 (= call!32834 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!592556 () Bool)

(declare-fun e!338394 () Bool)

(assert (=> b!592556 (= e!338394 call!32834)))

(declare-fun b!592557 () Bool)

(declare-fun e!338393 () Bool)

(assert (=> b!592557 (= e!338393 e!338394)))

(declare-fun lt!268994 () (_ BitVec 64))

(assert (=> b!592557 (= lt!268994 (select (arr!17728 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!268995 () Unit!18590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36916 (_ BitVec 64) (_ BitVec 32)) Unit!18590)

(assert (=> b!592557 (= lt!268995 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!268994 #b00000000000000000000000000000000))))

(assert (=> b!592557 (arrayContainsKey!0 a!2986 lt!268994 #b00000000000000000000000000000000)))

(declare-fun lt!268996 () Unit!18590)

(assert (=> b!592557 (= lt!268996 lt!268995)))

(declare-fun res!379342 () Bool)

(assert (=> b!592557 (= res!379342 (= (seekEntryOrOpen!0 (select (arr!17728 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6168 #b00000000000000000000000000000000)))))

(assert (=> b!592557 (=> (not res!379342) (not e!338394))))

(declare-fun d!86241 () Bool)

(declare-fun res!379343 () Bool)

(declare-fun e!338392 () Bool)

(assert (=> d!86241 (=> res!379343 e!338392)))

(assert (=> d!86241 (= res!379343 (bvsge #b00000000000000000000000000000000 (size!18092 a!2986)))))

(assert (=> d!86241 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!338392)))

(declare-fun b!592558 () Bool)

(assert (=> b!592558 (= e!338393 call!32834)))

(declare-fun b!592559 () Bool)

(assert (=> b!592559 (= e!338392 e!338393)))

(declare-fun c!66974 () Bool)

(assert (=> b!592559 (= c!66974 (validKeyInArray!0 (select (arr!17728 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86241 (not res!379343)) b!592559))

(assert (= (and b!592559 c!66974) b!592557))

(assert (= (and b!592559 (not c!66974)) b!592558))

(assert (= (and b!592557 res!379342) b!592556))

(assert (= (or b!592556 b!592558) bm!32831))

(declare-fun m!570677 () Bool)

(assert (=> bm!32831 m!570677))

(declare-fun m!570679 () Bool)

(assert (=> b!592557 m!570679))

(declare-fun m!570681 () Bool)

(assert (=> b!592557 m!570681))

(declare-fun m!570683 () Bool)

(assert (=> b!592557 m!570683))

(assert (=> b!592557 m!570679))

(declare-fun m!570685 () Bool)

(assert (=> b!592557 m!570685))

(assert (=> b!592559 m!570679))

(assert (=> b!592559 m!570679))

(declare-fun m!570687 () Bool)

(assert (=> b!592559 m!570687))

(assert (=> b!592442 d!86241))

(declare-fun d!86245 () Bool)

(assert (=> d!86245 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592430 d!86245))

(declare-fun b!592596 () Bool)

(declare-fun e!338418 () SeekEntryResult!6168)

(assert (=> b!592596 (= e!338418 Undefined!6168)))

(declare-fun b!592597 () Bool)

(declare-fun e!338416 () SeekEntryResult!6168)

(declare-fun lt!269014 () SeekEntryResult!6168)

(assert (=> b!592597 (= e!338416 (MissingZero!6168 (index!26910 lt!269014)))))

(declare-fun b!592598 () Bool)

(declare-fun e!338417 () SeekEntryResult!6168)

(assert (=> b!592598 (= e!338417 (Found!6168 (index!26910 lt!269014)))))

(declare-fun b!592599 () Bool)

(assert (=> b!592599 (= e!338418 e!338417)))

(declare-fun lt!269015 () (_ BitVec 64))

(assert (=> b!592599 (= lt!269015 (select (arr!17728 a!2986) (index!26910 lt!269014)))))

(declare-fun c!66988 () Bool)

(assert (=> b!592599 (= c!66988 (= lt!269015 k0!1786))))

(declare-fun d!86247 () Bool)

(declare-fun lt!269017 () SeekEntryResult!6168)

(assert (=> d!86247 (and (or ((_ is Undefined!6168) lt!269017) (not ((_ is Found!6168) lt!269017)) (and (bvsge (index!26909 lt!269017) #b00000000000000000000000000000000) (bvslt (index!26909 lt!269017) (size!18092 a!2986)))) (or ((_ is Undefined!6168) lt!269017) ((_ is Found!6168) lt!269017) (not ((_ is MissingZero!6168) lt!269017)) (and (bvsge (index!26908 lt!269017) #b00000000000000000000000000000000) (bvslt (index!26908 lt!269017) (size!18092 a!2986)))) (or ((_ is Undefined!6168) lt!269017) ((_ is Found!6168) lt!269017) ((_ is MissingZero!6168) lt!269017) (not ((_ is MissingVacant!6168) lt!269017)) (and (bvsge (index!26911 lt!269017) #b00000000000000000000000000000000) (bvslt (index!26911 lt!269017) (size!18092 a!2986)))) (or ((_ is Undefined!6168) lt!269017) (ite ((_ is Found!6168) lt!269017) (= (select (arr!17728 a!2986) (index!26909 lt!269017)) k0!1786) (ite ((_ is MissingZero!6168) lt!269017) (= (select (arr!17728 a!2986) (index!26908 lt!269017)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6168) lt!269017) (= (select (arr!17728 a!2986) (index!26911 lt!269017)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86247 (= lt!269017 e!338418)))

(declare-fun c!66991 () Bool)

(assert (=> d!86247 (= c!66991 (and ((_ is Intermediate!6168) lt!269014) (undefined!6980 lt!269014)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36916 (_ BitVec 32)) SeekEntryResult!6168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86247 (= lt!269014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86247 (validMask!0 mask!3053)))

(assert (=> d!86247 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269017)))

(declare-fun b!592600 () Bool)

(declare-fun c!66992 () Bool)

(assert (=> b!592600 (= c!66992 (= lt!269015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592600 (= e!338417 e!338416)))

(declare-fun b!592601 () Bool)

(assert (=> b!592601 (= e!338416 (seekKeyOrZeroReturnVacant!0 (x!55696 lt!269014) (index!26910 lt!269014) (index!26910 lt!269014) k0!1786 a!2986 mask!3053))))

(assert (= (and d!86247 c!66991) b!592596))

(assert (= (and d!86247 (not c!66991)) b!592599))

(assert (= (and b!592599 c!66988) b!592598))

(assert (= (and b!592599 (not c!66988)) b!592600))

(assert (= (and b!592600 c!66992) b!592597))

(assert (= (and b!592600 (not c!66992)) b!592601))

(declare-fun m!570695 () Bool)

(assert (=> b!592599 m!570695))

(declare-fun m!570701 () Bool)

(assert (=> d!86247 m!570701))

(declare-fun m!570703 () Bool)

(assert (=> d!86247 m!570703))

(assert (=> d!86247 m!570571))

(declare-fun m!570709 () Bool)

(assert (=> d!86247 m!570709))

(assert (=> d!86247 m!570701))

(declare-fun m!570711 () Bool)

(assert (=> d!86247 m!570711))

(declare-fun m!570715 () Bool)

(assert (=> d!86247 m!570715))

(declare-fun m!570719 () Bool)

(assert (=> b!592601 m!570719))

(assert (=> b!592445 d!86247))

(declare-fun d!86257 () Bool)

(declare-fun res!379350 () Bool)

(declare-fun e!338419 () Bool)

(assert (=> d!86257 (=> res!379350 e!338419)))

(assert (=> d!86257 (= res!379350 (= (select (arr!17728 lt!268929) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17728 a!2986) j!136)))))

(assert (=> d!86257 (= (arrayContainsKey!0 lt!268929 (select (arr!17728 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!338419)))

(declare-fun b!592602 () Bool)

(declare-fun e!338420 () Bool)

(assert (=> b!592602 (= e!338419 e!338420)))

(declare-fun res!379351 () Bool)

(assert (=> b!592602 (=> (not res!379351) (not e!338420))))

(assert (=> b!592602 (= res!379351 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18092 lt!268929)))))

(declare-fun b!592603 () Bool)

(assert (=> b!592603 (= e!338420 (arrayContainsKey!0 lt!268929 (select (arr!17728 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86257 (not res!379350)) b!592602))

(assert (= (and b!592602 res!379351) b!592603))

(declare-fun m!570723 () Bool)

(assert (=> d!86257 m!570723))

(assert (=> b!592603 m!570541))

(declare-fun m!570725 () Bool)

(assert (=> b!592603 m!570725))

(assert (=> b!592432 d!86257))

(declare-fun d!86261 () Bool)

(assert (=> d!86261 (arrayContainsKey!0 lt!268929 (select (arr!17728 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269020 () Unit!18590)

(declare-fun choose!114 (array!36916 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18590)

(assert (=> d!86261 (= lt!269020 (choose!114 lt!268929 (select (arr!17728 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86261 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86261 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268929 (select (arr!17728 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269020)))

(declare-fun bs!18291 () Bool)

(assert (= bs!18291 d!86261))

(assert (=> bs!18291 m!570541))

(assert (=> bs!18291 m!570581))

(assert (=> bs!18291 m!570541))

(declare-fun m!570727 () Bool)

(assert (=> bs!18291 m!570727))

(assert (=> b!592432 d!86261))

(declare-fun d!86263 () Bool)

(declare-fun res!379352 () Bool)

(declare-fun e!338421 () Bool)

(assert (=> d!86263 (=> res!379352 e!338421)))

(assert (=> d!86263 (= res!379352 (= (select (arr!17728 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86263 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!338421)))

(declare-fun b!592604 () Bool)

(declare-fun e!338422 () Bool)

(assert (=> b!592604 (= e!338421 e!338422)))

(declare-fun res!379353 () Bool)

(assert (=> b!592604 (=> (not res!379353) (not e!338422))))

(assert (=> b!592604 (= res!379353 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18092 a!2986)))))

(declare-fun b!592605 () Bool)

(assert (=> b!592605 (= e!338422 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86263 (not res!379352)) b!592604))

(assert (= (and b!592604 res!379353) b!592605))

(assert (=> d!86263 m!570679))

(declare-fun m!570729 () Bool)

(assert (=> b!592605 m!570729))

(assert (=> b!592433 d!86263))

(declare-fun d!86265 () Bool)

(declare-fun res!379354 () Bool)

(declare-fun e!338423 () Bool)

(assert (=> d!86265 (=> res!379354 e!338423)))

(assert (=> d!86265 (= res!379354 (= (select (arr!17728 lt!268929) j!136) (select (arr!17728 a!2986) j!136)))))

(assert (=> d!86265 (= (arrayContainsKey!0 lt!268929 (select (arr!17728 a!2986) j!136) j!136) e!338423)))

(declare-fun b!592606 () Bool)

(declare-fun e!338424 () Bool)

(assert (=> b!592606 (= e!338423 e!338424)))

(declare-fun res!379355 () Bool)

(assert (=> b!592606 (=> (not res!379355) (not e!338424))))

(assert (=> b!592606 (= res!379355 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18092 lt!268929)))))

(declare-fun b!592607 () Bool)

(assert (=> b!592607 (= e!338424 (arrayContainsKey!0 lt!268929 (select (arr!17728 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86265 (not res!379354)) b!592606))

(assert (= (and b!592606 res!379355) b!592607))

(declare-fun m!570731 () Bool)

(assert (=> d!86265 m!570731))

(assert (=> b!592607 m!570541))

(declare-fun m!570733 () Bool)

(assert (=> b!592607 m!570733))

(assert (=> b!592436 d!86265))

(declare-fun bm!32837 () Bool)

(declare-fun call!32840 () Bool)

(declare-fun c!66998 () Bool)

(assert (=> bm!32837 (= call!32840 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66998 (Cons!11765 (select (arr!17728 a!2986) #b00000000000000000000000000000000) Nil!11766) Nil!11766)))))

(declare-fun b!592632 () Bool)

(declare-fun e!338444 () Bool)

(declare-fun contains!2910 (List!11769 (_ BitVec 64)) Bool)

(assert (=> b!592632 (= e!338444 (contains!2910 Nil!11766 (select (arr!17728 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!592633 () Bool)

(declare-fun e!338447 () Bool)

(assert (=> b!592633 (= e!338447 call!32840)))

(declare-fun d!86267 () Bool)

(declare-fun res!379372 () Bool)

(declare-fun e!338445 () Bool)

(assert (=> d!86267 (=> res!379372 e!338445)))

(assert (=> d!86267 (= res!379372 (bvsge #b00000000000000000000000000000000 (size!18092 a!2986)))))

(assert (=> d!86267 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11766) e!338445)))

(declare-fun b!592634 () Bool)

(assert (=> b!592634 (= e!338447 call!32840)))

(declare-fun b!592635 () Bool)

(declare-fun e!338446 () Bool)

(assert (=> b!592635 (= e!338445 e!338446)))

(declare-fun res!379371 () Bool)

(assert (=> b!592635 (=> (not res!379371) (not e!338446))))

(assert (=> b!592635 (= res!379371 (not e!338444))))

(declare-fun res!379370 () Bool)

(assert (=> b!592635 (=> (not res!379370) (not e!338444))))

(assert (=> b!592635 (= res!379370 (validKeyInArray!0 (select (arr!17728 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!592636 () Bool)

(assert (=> b!592636 (= e!338446 e!338447)))

(assert (=> b!592636 (= c!66998 (validKeyInArray!0 (select (arr!17728 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86267 (not res!379372)) b!592635))

(assert (= (and b!592635 res!379370) b!592632))

(assert (= (and b!592635 res!379371) b!592636))

(assert (= (and b!592636 c!66998) b!592633))

(assert (= (and b!592636 (not c!66998)) b!592634))

(assert (= (or b!592633 b!592634) bm!32837))

(assert (=> bm!32837 m!570679))

(declare-fun m!570751 () Bool)

(assert (=> bm!32837 m!570751))

(assert (=> b!592632 m!570679))

(assert (=> b!592632 m!570679))

(declare-fun m!570753 () Bool)

(assert (=> b!592632 m!570753))

(assert (=> b!592635 m!570679))

(assert (=> b!592635 m!570679))

(assert (=> b!592635 m!570687))

(assert (=> b!592636 m!570679))

(assert (=> b!592636 m!570679))

(assert (=> b!592636 m!570687))

(assert (=> b!592435 d!86267))

(declare-fun d!86281 () Bool)

(assert (=> d!86281 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54186 d!86281))

(declare-fun d!86289 () Bool)

(assert (=> d!86289 (= (array_inv!13524 a!2986) (bvsge (size!18092 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54186 d!86289))

(check-sat (not d!86261) (not b!592532) (not b!592636) (not b!592632) (not bm!32831) (not d!86239) (not bm!32837) (not d!86235) (not d!86237) (not b!592559) (not b!592541) (not b!592535) (not d!86233) (not b!592635) (not b!592607) (not d!86247) (not b!592526) (not b!592605) (not b!592603) (not b!592547) (not b!592601) (not b!592520) (not b!592557) (not d!86231) (not d!86225))
(check-sat)
