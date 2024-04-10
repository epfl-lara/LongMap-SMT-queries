; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54184 () Bool)

(assert start!54184)

(declare-fun b!592370 () Bool)

(declare-fun e!338279 () Bool)

(declare-fun e!338282 () Bool)

(assert (=> b!592370 (= e!338279 e!338282)))

(declare-fun res!379218 () Bool)

(assert (=> b!592370 (=> res!379218 e!338282)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!268897 () (_ BitVec 64))

(declare-fun lt!268902 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36914 0))(
  ( (array!36915 (arr!17727 (Array (_ BitVec 32) (_ BitVec 64))) (size!18091 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36914)

(assert (=> b!592370 (= res!379218 (or (not (= (select (arr!17727 a!2986) j!136) lt!268902)) (not (= (select (arr!17727 a!2986) j!136) lt!268897)) (bvsge j!136 index!984)))))

(declare-fun e!338283 () Bool)

(assert (=> b!592370 e!338283))

(declare-fun res!379223 () Bool)

(assert (=> b!592370 (=> (not res!379223) (not e!338283))))

(assert (=> b!592370 (= res!379223 (= lt!268897 (select (arr!17727 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!592370 (= lt!268897 (select (store (arr!17727 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!592371 () Bool)

(declare-fun e!338284 () Bool)

(declare-datatypes ((SeekEntryResult!6167 0))(
  ( (MissingZero!6167 (index!26904 (_ BitVec 32))) (Found!6167 (index!26905 (_ BitVec 32))) (Intermediate!6167 (undefined!6979 Bool) (index!26906 (_ BitVec 32)) (x!55695 (_ BitVec 32))) (Undefined!6167) (MissingVacant!6167 (index!26907 (_ BitVec 32))) )
))
(declare-fun lt!268894 () SeekEntryResult!6167)

(declare-fun lt!268893 () SeekEntryResult!6167)

(assert (=> b!592371 (= e!338284 (= lt!268894 lt!268893))))

(declare-fun b!592372 () Bool)

(declare-fun res!379210 () Bool)

(declare-fun e!338285 () Bool)

(assert (=> b!592372 (=> (not res!379210) (not e!338285))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36914 (_ BitVec 32)) Bool)

(assert (=> b!592372 (= res!379210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592373 () Bool)

(declare-fun res!379221 () Bool)

(assert (=> b!592373 (=> (not res!379221) (not e!338285))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!592373 (= res!379221 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17727 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592375 () Bool)

(declare-datatypes ((Unit!18586 0))(
  ( (Unit!18587) )
))
(declare-fun e!338286 () Unit!18586)

(declare-fun Unit!18588 () Unit!18586)

(assert (=> b!592375 (= e!338286 Unit!18588)))

(declare-fun b!592376 () Bool)

(declare-fun e!338276 () Bool)

(declare-fun e!338278 () Bool)

(assert (=> b!592376 (= e!338276 e!338278)))

(declare-fun res!379220 () Bool)

(assert (=> b!592376 (=> (not res!379220) (not e!338278))))

(declare-fun lt!268899 () array!36914)

(declare-fun arrayContainsKey!0 (array!36914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592376 (= res!379220 (arrayContainsKey!0 lt!268899 (select (arr!17727 a!2986) j!136) j!136))))

(declare-fun b!592377 () Bool)

(declare-fun res!379214 () Bool)

(declare-fun e!338281 () Bool)

(assert (=> b!592377 (=> (not res!379214) (not e!338281))))

(assert (=> b!592377 (= res!379214 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592378 () Bool)

(declare-fun e!338280 () Bool)

(declare-fun e!338277 () Bool)

(assert (=> b!592378 (= e!338280 e!338277)))

(declare-fun res!379211 () Bool)

(assert (=> b!592378 (=> (not res!379211) (not e!338277))))

(assert (=> b!592378 (= res!379211 (and (= lt!268894 (Found!6167 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17727 a!2986) index!984) (select (arr!17727 a!2986) j!136))) (not (= (select (arr!17727 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36914 (_ BitVec 32)) SeekEntryResult!6167)

(assert (=> b!592378 (= lt!268894 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17727 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592379 () Bool)

(assert (=> b!592379 (= e!338285 e!338280)))

(declare-fun res!379213 () Bool)

(assert (=> b!592379 (=> (not res!379213) (not e!338280))))

(assert (=> b!592379 (= res!379213 (= (select (store (arr!17727 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592379 (= lt!268899 (array!36915 (store (arr!17727 a!2986) i!1108 k!1786) (size!18091 a!2986)))))

(declare-fun b!592380 () Bool)

(declare-fun res!379226 () Bool)

(assert (=> b!592380 (=> (not res!379226) (not e!338281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592380 (= res!379226 (validKeyInArray!0 (select (arr!17727 a!2986) j!136)))))

(declare-fun b!592381 () Bool)

(assert (=> b!592381 (= e!338277 (not e!338279))))

(declare-fun res!379224 () Bool)

(assert (=> b!592381 (=> res!379224 e!338279)))

(declare-fun lt!268895 () SeekEntryResult!6167)

(assert (=> b!592381 (= res!379224 (not (= lt!268895 (Found!6167 index!984))))))

(declare-fun lt!268900 () Unit!18586)

(assert (=> b!592381 (= lt!268900 e!338286)))

(declare-fun c!66947 () Bool)

(assert (=> b!592381 (= c!66947 (= lt!268895 Undefined!6167))))

(assert (=> b!592381 (= lt!268895 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268902 lt!268899 mask!3053))))

(assert (=> b!592381 e!338284))

(declare-fun res!379217 () Bool)

(assert (=> b!592381 (=> (not res!379217) (not e!338284))))

(declare-fun lt!268896 () (_ BitVec 32))

(assert (=> b!592381 (= res!379217 (= lt!268893 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268896 vacantSpotIndex!68 lt!268902 lt!268899 mask!3053)))))

(assert (=> b!592381 (= lt!268893 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268896 vacantSpotIndex!68 (select (arr!17727 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592381 (= lt!268902 (select (store (arr!17727 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268898 () Unit!18586)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36914 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18586)

(assert (=> b!592381 (= lt!268898 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268896 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592381 (= lt!268896 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592382 () Bool)

(assert (=> b!592382 (= e!338282 (or (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18091 a!2986)) (bvslt (size!18091 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!592382 (arrayContainsKey!0 lt!268899 (select (arr!17727 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268901 () Unit!18586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36914 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18586)

(assert (=> b!592382 (= lt!268901 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268899 (select (arr!17727 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592383 () Bool)

(declare-fun res!379215 () Bool)

(assert (=> b!592383 (=> (not res!379215) (not e!338281))))

(assert (=> b!592383 (= res!379215 (validKeyInArray!0 k!1786))))

(declare-fun b!592374 () Bool)

(declare-fun res!379222 () Bool)

(assert (=> b!592374 (=> (not res!379222) (not e!338281))))

(assert (=> b!592374 (= res!379222 (and (= (size!18091 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18091 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18091 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!379225 () Bool)

(assert (=> start!54184 (=> (not res!379225) (not e!338281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54184 (= res!379225 (validMask!0 mask!3053))))

(assert (=> start!54184 e!338281))

(assert (=> start!54184 true))

(declare-fun array_inv!13523 (array!36914) Bool)

(assert (=> start!54184 (array_inv!13523 a!2986)))

(declare-fun b!592384 () Bool)

(assert (=> b!592384 (= e!338281 e!338285)))

(declare-fun res!379216 () Bool)

(assert (=> b!592384 (=> (not res!379216) (not e!338285))))

(declare-fun lt!268903 () SeekEntryResult!6167)

(assert (=> b!592384 (= res!379216 (or (= lt!268903 (MissingZero!6167 i!1108)) (= lt!268903 (MissingVacant!6167 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36914 (_ BitVec 32)) SeekEntryResult!6167)

(assert (=> b!592384 (= lt!268903 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!592385 () Bool)

(declare-fun Unit!18589 () Unit!18586)

(assert (=> b!592385 (= e!338286 Unit!18589)))

(assert (=> b!592385 false))

(declare-fun b!592386 () Bool)

(declare-fun res!379212 () Bool)

(assert (=> b!592386 (=> (not res!379212) (not e!338285))))

(declare-datatypes ((List!11768 0))(
  ( (Nil!11765) (Cons!11764 (h!12809 (_ BitVec 64)) (t!17996 List!11768)) )
))
(declare-fun arrayNoDuplicates!0 (array!36914 (_ BitVec 32) List!11768) Bool)

(assert (=> b!592386 (= res!379212 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11765))))

(declare-fun b!592387 () Bool)

(assert (=> b!592387 (= e!338283 e!338276)))

(declare-fun res!379219 () Bool)

(assert (=> b!592387 (=> res!379219 e!338276)))

(assert (=> b!592387 (= res!379219 (or (not (= (select (arr!17727 a!2986) j!136) lt!268902)) (not (= (select (arr!17727 a!2986) j!136) lt!268897)) (bvsge j!136 index!984)))))

(declare-fun b!592388 () Bool)

(assert (=> b!592388 (= e!338278 (arrayContainsKey!0 lt!268899 (select (arr!17727 a!2986) j!136) index!984))))

(assert (= (and start!54184 res!379225) b!592374))

(assert (= (and b!592374 res!379222) b!592380))

(assert (= (and b!592380 res!379226) b!592383))

(assert (= (and b!592383 res!379215) b!592377))

(assert (= (and b!592377 res!379214) b!592384))

(assert (= (and b!592384 res!379216) b!592372))

(assert (= (and b!592372 res!379210) b!592386))

(assert (= (and b!592386 res!379212) b!592373))

(assert (= (and b!592373 res!379221) b!592379))

(assert (= (and b!592379 res!379213) b!592378))

(assert (= (and b!592378 res!379211) b!592381))

(assert (= (and b!592381 res!379217) b!592371))

(assert (= (and b!592381 c!66947) b!592385))

(assert (= (and b!592381 (not c!66947)) b!592375))

(assert (= (and b!592381 (not res!379224)) b!592370))

(assert (= (and b!592370 res!379223) b!592387))

(assert (= (and b!592387 (not res!379219)) b!592376))

(assert (= (and b!592376 res!379220) b!592388))

(assert (= (and b!592370 (not res!379218)) b!592382))

(declare-fun m!570487 () Bool)

(assert (=> b!592384 m!570487))

(declare-fun m!570489 () Bool)

(assert (=> b!592387 m!570489))

(declare-fun m!570491 () Bool)

(assert (=> b!592373 m!570491))

(declare-fun m!570493 () Bool)

(assert (=> b!592381 m!570493))

(declare-fun m!570495 () Bool)

(assert (=> b!592381 m!570495))

(assert (=> b!592381 m!570489))

(declare-fun m!570497 () Bool)

(assert (=> b!592381 m!570497))

(declare-fun m!570499 () Bool)

(assert (=> b!592381 m!570499))

(declare-fun m!570501 () Bool)

(assert (=> b!592381 m!570501))

(assert (=> b!592381 m!570489))

(declare-fun m!570503 () Bool)

(assert (=> b!592381 m!570503))

(declare-fun m!570505 () Bool)

(assert (=> b!592381 m!570505))

(assert (=> b!592388 m!570489))

(assert (=> b!592388 m!570489))

(declare-fun m!570507 () Bool)

(assert (=> b!592388 m!570507))

(assert (=> b!592382 m!570489))

(assert (=> b!592382 m!570489))

(declare-fun m!570509 () Bool)

(assert (=> b!592382 m!570509))

(assert (=> b!592382 m!570489))

(declare-fun m!570511 () Bool)

(assert (=> b!592382 m!570511))

(assert (=> b!592370 m!570489))

(assert (=> b!592370 m!570497))

(declare-fun m!570513 () Bool)

(assert (=> b!592370 m!570513))

(assert (=> b!592379 m!570497))

(declare-fun m!570515 () Bool)

(assert (=> b!592379 m!570515))

(declare-fun m!570517 () Bool)

(assert (=> b!592386 m!570517))

(declare-fun m!570519 () Bool)

(assert (=> b!592383 m!570519))

(assert (=> b!592376 m!570489))

(assert (=> b!592376 m!570489))

(declare-fun m!570521 () Bool)

(assert (=> b!592376 m!570521))

(assert (=> b!592380 m!570489))

(assert (=> b!592380 m!570489))

(declare-fun m!570523 () Bool)

(assert (=> b!592380 m!570523))

(declare-fun m!570525 () Bool)

(assert (=> b!592372 m!570525))

(declare-fun m!570527 () Bool)

(assert (=> b!592378 m!570527))

(assert (=> b!592378 m!570489))

(assert (=> b!592378 m!570489))

(declare-fun m!570529 () Bool)

(assert (=> b!592378 m!570529))

(declare-fun m!570531 () Bool)

(assert (=> start!54184 m!570531))

(declare-fun m!570533 () Bool)

(assert (=> start!54184 m!570533))

(declare-fun m!570535 () Bool)

(assert (=> b!592377 m!570535))

(push 1)

(assert (not b!592381))

(assert (not b!592380))

(assert (not b!592378))

(assert (not start!54184))

(assert (not b!592386))

(assert (not b!592376))

(assert (not b!592377))

(assert (not b!592388))

(assert (not b!592383))

(assert (not b!592372))

(assert (not b!592384))

(assert (not b!592382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!592590 () Bool)

(declare-fun e!338414 () SeekEntryResult!6167)

(declare-fun lt!269012 () SeekEntryResult!6167)

(assert (=> b!592590 (= e!338414 (Found!6167 (index!26906 lt!269012)))))

(declare-fun b!592591 () Bool)

(declare-fun e!338413 () SeekEntryResult!6167)

(assert (=> b!592591 (= e!338413 e!338414)))

(declare-fun lt!269016 () (_ BitVec 64))

(assert (=> b!592591 (= lt!269016 (select (arr!17727 a!2986) (index!26906 lt!269012)))))

(declare-fun c!66990 () Bool)

(assert (=> b!592591 (= c!66990 (= lt!269016 k!1786))))

(declare-fun b!592592 () Bool)

(declare-fun e!338415 () SeekEntryResult!6167)

(assert (=> b!592592 (= e!338415 (MissingZero!6167 (index!26906 lt!269012)))))

(declare-fun b!592593 () Bool)

(declare-fun c!66987 () Bool)

(assert (=> b!592593 (= c!66987 (= lt!269016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592593 (= e!338414 e!338415)))

(declare-fun d!86243 () Bool)

(declare-fun lt!269013 () SeekEntryResult!6167)

(assert (=> d!86243 (and (or (is-Undefined!6167 lt!269013) (not (is-Found!6167 lt!269013)) (and (bvsge (index!26905 lt!269013) #b00000000000000000000000000000000) (bvslt (index!26905 lt!269013) (size!18091 a!2986)))) (or (is-Undefined!6167 lt!269013) (is-Found!6167 lt!269013) (not (is-MissingZero!6167 lt!269013)) (and (bvsge (index!26904 lt!269013) #b00000000000000000000000000000000) (bvslt (index!26904 lt!269013) (size!18091 a!2986)))) (or (is-Undefined!6167 lt!269013) (is-Found!6167 lt!269013) (is-MissingZero!6167 lt!269013) (not (is-MissingVacant!6167 lt!269013)) (and (bvsge (index!26907 lt!269013) #b00000000000000000000000000000000) (bvslt (index!26907 lt!269013) (size!18091 a!2986)))) (or (is-Undefined!6167 lt!269013) (ite (is-Found!6167 lt!269013) (= (select (arr!17727 a!2986) (index!26905 lt!269013)) k!1786) (ite (is-MissingZero!6167 lt!269013) (= (select (arr!17727 a!2986) (index!26904 lt!269013)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6167 lt!269013) (= (select (arr!17727 a!2986) (index!26907 lt!269013)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86243 (= lt!269013 e!338413)))

(declare-fun c!66989 () Bool)

(assert (=> d!86243 (= c!66989 (and (is-Intermediate!6167 lt!269012) (undefined!6979 lt!269012)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36914 (_ BitVec 32)) SeekEntryResult!6167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86243 (= lt!269012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!86243 (validMask!0 mask!3053)))

(assert (=> d!86243 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!269013)))

(declare-fun b!592594 () Bool)

(assert (=> b!592594 (= e!338413 Undefined!6167)))

(declare-fun b!592595 () Bool)

(assert (=> b!592595 (= e!338415 (seekKeyOrZeroReturnVacant!0 (x!55695 lt!269012) (index!26906 lt!269012) (index!26906 lt!269012) k!1786 a!2986 mask!3053))))

(assert (= (and d!86243 c!66989) b!592594))

(assert (= (and d!86243 (not c!66989)) b!592591))

(assert (= (and b!592591 c!66990) b!592590))

(assert (= (and b!592591 (not c!66990)) b!592593))

(assert (= (and b!592593 c!66987) b!592592))

(assert (= (and b!592593 (not c!66987)) b!592595))

(declare-fun m!570697 () Bool)

(assert (=> b!592591 m!570697))

(declare-fun m!570699 () Bool)

(assert (=> d!86243 m!570699))

(declare-fun m!570705 () Bool)

(assert (=> d!86243 m!570705))

(declare-fun m!570707 () Bool)

(assert (=> d!86243 m!570707))

(assert (=> d!86243 m!570531))

(assert (=> d!86243 m!570707))

(declare-fun m!570713 () Bool)

(assert (=> d!86243 m!570713))

(declare-fun m!570717 () Bool)

(assert (=> d!86243 m!570717))

(declare-fun m!570721 () Bool)

(assert (=> b!592595 m!570721))

(assert (=> b!592384 d!86243))

(declare-fun b!592628 () Bool)

(declare-fun e!338442 () Bool)

(declare-fun call!32839 () Bool)

(assert (=> b!592628 (= e!338442 call!32839)))

(declare-fun b!592629 () Bool)

(declare-fun e!338443 () Bool)

(declare-fun e!338441 () Bool)

(assert (=> b!592629 (= e!338443 e!338441)))

(declare-fun c!66997 () Bool)

(assert (=> b!592629 (= c!66997 (validKeyInArray!0 (select (arr!17727 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!592631 () Bool)

(assert (=> b!592631 (= e!338441 e!338442)))

(declare-fun lt!269029 () (_ BitVec 64))

(assert (=> b!592631 (= lt!269029 (select (arr!17727 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269027 () Unit!18586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36914 (_ BitVec 64) (_ BitVec 32)) Unit!18586)

(assert (=> b!592631 (= lt!269027 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269029 #b00000000000000000000000000000000))))

(assert (=> b!592631 (arrayContainsKey!0 a!2986 lt!269029 #b00000000000000000000000000000000)))

(declare-fun lt!269028 () Unit!18586)

(assert (=> b!592631 (= lt!269028 lt!269027)))

(declare-fun res!379368 () Bool)

(assert (=> b!592631 (= res!379368 (= (seekEntryOrOpen!0 (select (arr!17727 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6167 #b00000000000000000000000000000000)))))

(assert (=> b!592631 (=> (not res!379368) (not e!338442))))

(declare-fun bm!32836 () Bool)

(assert (=> bm!32836 (= call!32839 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!592630 () Bool)

(assert (=> b!592630 (= e!338441 call!32839)))

(declare-fun d!86259 () Bool)

(declare-fun res!379369 () Bool)

(assert (=> d!86259 (=> res!379369 e!338443)))

(assert (=> d!86259 (= res!379369 (bvsge #b00000000000000000000000000000000 (size!18091 a!2986)))))

(assert (=> d!86259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!338443)))

(assert (= (and d!86259 (not res!379369)) b!592629))

(assert (= (and b!592629 c!66997) b!592631))

(assert (= (and b!592629 (not c!66997)) b!592630))

(assert (= (and b!592631 res!379368) b!592628))

(assert (= (or b!592628 b!592630) bm!32836))

(declare-fun m!570739 () Bool)

(assert (=> b!592629 m!570739))

(assert (=> b!592629 m!570739))

(declare-fun m!570741 () Bool)

(assert (=> b!592629 m!570741))

(assert (=> b!592631 m!570739))

(declare-fun m!570743 () Bool)

(assert (=> b!592631 m!570743))

(declare-fun m!570745 () Bool)

(assert (=> b!592631 m!570745))

(assert (=> b!592631 m!570739))

(declare-fun m!570747 () Bool)

(assert (=> b!592631 m!570747))

(declare-fun m!570749 () Bool)

(assert (=> bm!32836 m!570749))

(assert (=> b!592372 d!86259))

(declare-fun d!86277 () Bool)

(assert (=> d!86277 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592383 d!86277))

(declare-fun d!86279 () Bool)

(declare-fun res!379377 () Bool)

(declare-fun e!338452 () Bool)

(assert (=> d!86279 (=> res!379377 e!338452)))

(assert (=> d!86279 (= res!379377 (= (select (arr!17727 lt!268899) j!136) (select (arr!17727 a!2986) j!136)))))

(assert (=> d!86279 (= (arrayContainsKey!0 lt!268899 (select (arr!17727 a!2986) j!136) j!136) e!338452)))

(declare-fun b!592641 () Bool)

(declare-fun e!338453 () Bool)

(assert (=> b!592641 (= e!338452 e!338453)))

(declare-fun res!379378 () Bool)

(assert (=> b!592641 (=> (not res!379378) (not e!338453))))

(assert (=> b!592641 (= res!379378 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18091 lt!268899)))))

(declare-fun b!592642 () Bool)

(assert (=> b!592642 (= e!338453 (arrayContainsKey!0 lt!268899 (select (arr!17727 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86279 (not res!379377)) b!592641))

(assert (= (and b!592641 res!379378) b!592642))

(declare-fun m!570755 () Bool)

(assert (=> d!86279 m!570755))

(assert (=> b!592642 m!570489))

(declare-fun m!570757 () Bool)

(assert (=> b!592642 m!570757))

(assert (=> b!592376 d!86279))

(declare-fun b!592656 () Bool)

(declare-fun e!338467 () Bool)

(declare-fun contains!2911 (List!11768 (_ BitVec 64)) Bool)

(assert (=> b!592656 (= e!338467 (contains!2911 Nil!11765 (select (arr!17727 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86283 () Bool)

(declare-fun res!379390 () Bool)

(declare-fun e!338468 () Bool)

(assert (=> d!86283 (=> res!379390 e!338468)))

(assert (=> d!86283 (= res!379390 (bvsge #b00000000000000000000000000000000 (size!18091 a!2986)))))

(assert (=> d!86283 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11765) e!338468)))

(declare-fun b!592657 () Bool)

(declare-fun e!338466 () Bool)

(declare-fun call!32843 () Bool)

(assert (=> b!592657 (= e!338466 call!32843)))

(declare-fun b!592658 () Bool)

(declare-fun e!338465 () Bool)

(assert (=> b!592658 (= e!338465 e!338466)))

(declare-fun c!67001 () Bool)

(assert (=> b!592658 (= c!67001 (validKeyInArray!0 (select (arr!17727 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!592659 () Bool)

(assert (=> b!592659 (= e!338468 e!338465)))

(declare-fun res!379389 () Bool)

(assert (=> b!592659 (=> (not res!379389) (not e!338465))))

(assert (=> b!592659 (= res!379389 (not e!338467))))

(declare-fun res!379388 () Bool)

(assert (=> b!592659 (=> (not res!379388) (not e!338467))))

(assert (=> b!592659 (= res!379388 (validKeyInArray!0 (select (arr!17727 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32840 () Bool)

(assert (=> bm!32840 (= call!32843 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67001 (Cons!11764 (select (arr!17727 a!2986) #b00000000000000000000000000000000) Nil!11765) Nil!11765)))))

(declare-fun b!592660 () Bool)

(assert (=> b!592660 (= e!338466 call!32843)))

(assert (= (and d!86283 (not res!379390)) b!592659))

(assert (= (and b!592659 res!379388) b!592656))

(assert (= (and b!592659 res!379389) b!592658))

(assert (= (and b!592658 c!67001) b!592657))

(assert (= (and b!592658 (not c!67001)) b!592660))

(assert (= (or b!592657 b!592660) bm!32840))

(assert (=> b!592656 m!570739))

(assert (=> b!592656 m!570739))

(declare-fun m!570763 () Bool)

(assert (=> b!592656 m!570763))

(assert (=> b!592658 m!570739))

(assert (=> b!592658 m!570739))

(assert (=> b!592658 m!570741))

(assert (=> b!592659 m!570739))

(assert (=> b!592659 m!570739))

(assert (=> b!592659 m!570741))

(assert (=> bm!32840 m!570739))

(declare-fun m!570765 () Bool)

(assert (=> bm!32840 m!570765))

(assert (=> b!592386 d!86283))

(declare-fun d!86287 () Bool)

(assert (=> d!86287 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54184 d!86287))

(declare-fun d!86293 () Bool)

(assert (=> d!86293 (= (array_inv!13523 a!2986) (bvsge (size!18091 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54184 d!86293))

(declare-fun d!86295 () Bool)

(declare-fun res!379391 () Bool)

(declare-fun e!338469 () Bool)

(assert (=> d!86295 (=> res!379391 e!338469)))

(assert (=> d!86295 (= res!379391 (= (select (arr!17727 lt!268899) index!984) (select (arr!17727 a!2986) j!136)))))

(assert (=> d!86295 (= (arrayContainsKey!0 lt!268899 (select (arr!17727 a!2986) j!136) index!984) e!338469)))

(declare-fun b!592661 () Bool)

(declare-fun e!338470 () Bool)

(assert (=> b!592661 (= e!338469 e!338470)))

(declare-fun res!379392 () Bool)

(assert (=> b!592661 (=> (not res!379392) (not e!338470))))

(assert (=> b!592661 (= res!379392 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18091 lt!268899)))))

(declare-fun b!592662 () Bool)

(assert (=> b!592662 (= e!338470 (arrayContainsKey!0 lt!268899 (select (arr!17727 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86295 (not res!379391)) b!592661))

(assert (= (and b!592661 res!379392) b!592662))

(declare-fun m!570769 () Bool)

(assert (=> d!86295 m!570769))

(assert (=> b!592662 m!570489))

(declare-fun m!570771 () Bool)

(assert (=> b!592662 m!570771))

(assert (=> b!592388 d!86295))

(declare-fun d!86297 () Bool)

(declare-fun res!379393 () Bool)

(declare-fun e!338471 () Bool)

(assert (=> d!86297 (=> res!379393 e!338471)))

(assert (=> d!86297 (= res!379393 (= (select (arr!17727 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!86297 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!338471)))

(declare-fun b!592663 () Bool)

(declare-fun e!338472 () Bool)

(assert (=> b!592663 (= e!338471 e!338472)))

(declare-fun res!379394 () Bool)

(assert (=> b!592663 (=> (not res!379394) (not e!338472))))

(assert (=> b!592663 (= res!379394 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18091 a!2986)))))

(declare-fun b!592664 () Bool)

(assert (=> b!592664 (= e!338472 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86297 (not res!379393)) b!592663))

(assert (= (and b!592663 res!379394) b!592664))

(assert (=> d!86297 m!570739))

(declare-fun m!570773 () Bool)

(assert (=> b!592664 m!570773))

(assert (=> b!592377 d!86297))

(declare-fun d!86299 () Bool)

(declare-fun lt!269053 () SeekEntryResult!6167)

(assert (=> d!86299 (and (or (is-Undefined!6167 lt!269053) (not (is-Found!6167 lt!269053)) (and (bvsge (index!26905 lt!269053) #b00000000000000000000000000000000) (bvslt (index!26905 lt!269053) (size!18091 a!2986)))) (or (is-Undefined!6167 lt!269053) (is-Found!6167 lt!269053) (not (is-MissingVacant!6167 lt!269053)) (not (= (index!26907 lt!269053) vacantSpotIndex!68)) (and (bvsge (index!26907 lt!269053) #b00000000000000000000000000000000) (bvslt (index!26907 lt!269053) (size!18091 a!2986)))) (or (is-Undefined!6167 lt!269053) (ite (is-Found!6167 lt!269053) (= (select (arr!17727 a!2986) (index!26905 lt!269053)) (select (arr!17727 a!2986) j!136)) (and (is-MissingVacant!6167 lt!269053) (= (index!26907 lt!269053) vacantSpotIndex!68) (= (select (arr!17727 a!2986) (index!26907 lt!269053)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338511 () SeekEntryResult!6167)

(assert (=> d!86299 (= lt!269053 e!338511)))

(declare-fun c!67030 () Bool)

(assert (=> d!86299 (= c!67030 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269052 () (_ BitVec 64))

