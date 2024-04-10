; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58128 () Bool)

(assert start!58128)

(declare-fun b!642371 () Bool)

(declare-fun res!416110 () Bool)

(declare-fun e!367881 () Bool)

(assert (=> b!642371 (=> (not res!416110) (not e!367881))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642371 (= res!416110 (validKeyInArray!0 k!1786))))

(declare-fun b!642372 () Bool)

(declare-datatypes ((Unit!21734 0))(
  ( (Unit!21735) )
))
(declare-fun e!367871 () Unit!21734)

(declare-fun Unit!21736 () Unit!21734)

(assert (=> b!642372 (= e!367871 Unit!21736)))

(assert (=> b!642372 false))

(declare-fun b!642373 () Bool)

(declare-fun e!367869 () Bool)

(declare-fun e!367879 () Bool)

(assert (=> b!642373 (= e!367869 e!367879)))

(declare-fun res!416102 () Bool)

(assert (=> b!642373 (=> res!416102 e!367879)))

(declare-datatypes ((array!38387 0))(
  ( (array!38388 (arr!18410 (Array (_ BitVec 32) (_ BitVec 64))) (size!18774 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38387)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!642373 (= res!416102 (or (bvsge (size!18774 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18774 a!2986))))))

(declare-fun lt!297478 () array!38387)

(declare-datatypes ((List!12451 0))(
  ( (Nil!12448) (Cons!12447 (h!13492 (_ BitVec 64)) (t!18679 List!12451)) )
))
(declare-fun arrayNoDuplicates!0 (array!38387 (_ BitVec 32) List!12451) Bool)

(assert (=> b!642373 (arrayNoDuplicates!0 lt!297478 j!136 Nil!12448)))

(declare-fun lt!297470 () Unit!21734)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38387 (_ BitVec 32) (_ BitVec 32)) Unit!21734)

(assert (=> b!642373 (= lt!297470 (lemmaNoDuplicateFromThenFromBigger!0 lt!297478 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642373 (arrayNoDuplicates!0 lt!297478 #b00000000000000000000000000000000 Nil!12448)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!297475 () Unit!21734)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38387 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12451) Unit!21734)

(assert (=> b!642373 (= lt!297475 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12448))))

(declare-fun arrayContainsKey!0 (array!38387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642373 (arrayContainsKey!0 lt!297478 (select (arr!18410 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297465 () Unit!21734)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38387 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21734)

(assert (=> b!642373 (= lt!297465 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297478 (select (arr!18410 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!642374 () Bool)

(declare-fun e!367870 () Bool)

(declare-fun e!367877 () Bool)

(assert (=> b!642374 (= e!367870 e!367877)))

(declare-fun res!416109 () Bool)

(assert (=> b!642374 (=> res!416109 e!367877)))

(declare-fun lt!297472 () (_ BitVec 64))

(declare-fun lt!297467 () (_ BitVec 64))

(assert (=> b!642374 (= res!416109 (or (not (= (select (arr!18410 a!2986) j!136) lt!297467)) (not (= (select (arr!18410 a!2986) j!136) lt!297472)) (bvsge j!136 index!984)))))

(declare-fun b!642375 () Bool)

(declare-fun e!367874 () Bool)

(declare-fun e!367876 () Bool)

(assert (=> b!642375 (= e!367874 (not e!367876))))

(declare-fun res!416112 () Bool)

(assert (=> b!642375 (=> res!416112 e!367876)))

(declare-datatypes ((SeekEntryResult!6850 0))(
  ( (MissingZero!6850 (index!29726 (_ BitVec 32))) (Found!6850 (index!29727 (_ BitVec 32))) (Intermediate!6850 (undefined!7662 Bool) (index!29728 (_ BitVec 32)) (x!58488 (_ BitVec 32))) (Undefined!6850) (MissingVacant!6850 (index!29729 (_ BitVec 32))) )
))
(declare-fun lt!297471 () SeekEntryResult!6850)

(assert (=> b!642375 (= res!416112 (not (= lt!297471 (Found!6850 index!984))))))

(declare-fun lt!297468 () Unit!21734)

(assert (=> b!642375 (= lt!297468 e!367871)))

(declare-fun c!73505 () Bool)

(assert (=> b!642375 (= c!73505 (= lt!297471 Undefined!6850))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38387 (_ BitVec 32)) SeekEntryResult!6850)

(assert (=> b!642375 (= lt!297471 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297467 lt!297478 mask!3053))))

(declare-fun e!367880 () Bool)

(assert (=> b!642375 e!367880))

(declare-fun res!416096 () Bool)

(assert (=> b!642375 (=> (not res!416096) (not e!367880))))

(declare-fun lt!297474 () (_ BitVec 32))

(declare-fun lt!297476 () SeekEntryResult!6850)

(assert (=> b!642375 (= res!416096 (= lt!297476 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297474 vacantSpotIndex!68 lt!297467 lt!297478 mask!3053)))))

(assert (=> b!642375 (= lt!297476 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297474 vacantSpotIndex!68 (select (arr!18410 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642375 (= lt!297467 (select (store (arr!18410 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!297473 () Unit!21734)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38387 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21734)

(assert (=> b!642375 (= lt!297473 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297474 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642375 (= lt!297474 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642376 () Bool)

(declare-fun res!416101 () Bool)

(declare-fun e!367875 () Bool)

(assert (=> b!642376 (=> (not res!416101) (not e!367875))))

(assert (=> b!642376 (= res!416101 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18410 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642377 () Bool)

(assert (=> b!642377 (= e!367876 e!367869)))

(declare-fun res!416107 () Bool)

(assert (=> b!642377 (=> res!416107 e!367869)))

(assert (=> b!642377 (= res!416107 (or (not (= (select (arr!18410 a!2986) j!136) lt!297467)) (not (= (select (arr!18410 a!2986) j!136) lt!297472)) (bvsge j!136 index!984)))))

(assert (=> b!642377 e!367870))

(declare-fun res!416111 () Bool)

(assert (=> b!642377 (=> (not res!416111) (not e!367870))))

(assert (=> b!642377 (= res!416111 (= lt!297472 (select (arr!18410 a!2986) j!136)))))

(assert (=> b!642377 (= lt!297472 (select (store (arr!18410 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!416108 () Bool)

(assert (=> start!58128 (=> (not res!416108) (not e!367881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58128 (= res!416108 (validMask!0 mask!3053))))

(assert (=> start!58128 e!367881))

(assert (=> start!58128 true))

(declare-fun array_inv!14206 (array!38387) Bool)

(assert (=> start!58128 (array_inv!14206 a!2986)))

(declare-fun b!642378 () Bool)

(declare-fun e!367873 () Bool)

(assert (=> b!642378 (= e!367877 e!367873)))

(declare-fun res!416105 () Bool)

(assert (=> b!642378 (=> (not res!416105) (not e!367873))))

(assert (=> b!642378 (= res!416105 (arrayContainsKey!0 lt!297478 (select (arr!18410 a!2986) j!136) j!136))))

(declare-fun b!642379 () Bool)

(declare-fun res!416098 () Bool)

(assert (=> b!642379 (=> (not res!416098) (not e!367881))))

(assert (=> b!642379 (= res!416098 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642380 () Bool)

(declare-fun res!416113 () Bool)

(assert (=> b!642380 (=> res!416113 e!367879)))

(declare-fun contains!3138 (List!12451 (_ BitVec 64)) Bool)

(assert (=> b!642380 (= res!416113 (contains!3138 Nil!12448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642381 () Bool)

(declare-fun res!416095 () Bool)

(assert (=> b!642381 (=> (not res!416095) (not e!367881))))

(assert (=> b!642381 (= res!416095 (and (= (size!18774 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18774 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18774 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642382 () Bool)

(assert (=> b!642382 (= e!367873 (arrayContainsKey!0 lt!297478 (select (arr!18410 a!2986) j!136) index!984))))

(declare-fun b!642383 () Bool)

(declare-fun res!416104 () Bool)

(assert (=> b!642383 (=> (not res!416104) (not e!367875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38387 (_ BitVec 32)) Bool)

(assert (=> b!642383 (= res!416104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642384 () Bool)

(declare-fun Unit!21737 () Unit!21734)

(assert (=> b!642384 (= e!367871 Unit!21737)))

(declare-fun b!642385 () Bool)

(declare-fun lt!297477 () SeekEntryResult!6850)

(assert (=> b!642385 (= e!367880 (= lt!297477 lt!297476))))

(declare-fun b!642386 () Bool)

(declare-fun e!367872 () Bool)

(assert (=> b!642386 (= e!367875 e!367872)))

(declare-fun res!416114 () Bool)

(assert (=> b!642386 (=> (not res!416114) (not e!367872))))

(assert (=> b!642386 (= res!416114 (= (select (store (arr!18410 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642386 (= lt!297478 (array!38388 (store (arr!18410 a!2986) i!1108 k!1786) (size!18774 a!2986)))))

(declare-fun b!642387 () Bool)

(assert (=> b!642387 (= e!367879 true)))

(declare-fun lt!297466 () Bool)

(assert (=> b!642387 (= lt!297466 (contains!3138 Nil!12448 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642388 () Bool)

(assert (=> b!642388 (= e!367872 e!367874)))

(declare-fun res!416097 () Bool)

(assert (=> b!642388 (=> (not res!416097) (not e!367874))))

(assert (=> b!642388 (= res!416097 (and (= lt!297477 (Found!6850 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18410 a!2986) index!984) (select (arr!18410 a!2986) j!136))) (not (= (select (arr!18410 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!642388 (= lt!297477 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18410 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642389 () Bool)

(declare-fun res!416100 () Bool)

(assert (=> b!642389 (=> (not res!416100) (not e!367875))))

(assert (=> b!642389 (= res!416100 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12448))))

(declare-fun b!642390 () Bool)

(declare-fun res!416103 () Bool)

(assert (=> b!642390 (=> (not res!416103) (not e!367881))))

(assert (=> b!642390 (= res!416103 (validKeyInArray!0 (select (arr!18410 a!2986) j!136)))))

(declare-fun b!642391 () Bool)

(assert (=> b!642391 (= e!367881 e!367875)))

(declare-fun res!416099 () Bool)

(assert (=> b!642391 (=> (not res!416099) (not e!367875))))

(declare-fun lt!297469 () SeekEntryResult!6850)

(assert (=> b!642391 (= res!416099 (or (= lt!297469 (MissingZero!6850 i!1108)) (= lt!297469 (MissingVacant!6850 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38387 (_ BitVec 32)) SeekEntryResult!6850)

(assert (=> b!642391 (= lt!297469 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!642392 () Bool)

(declare-fun res!416106 () Bool)

(assert (=> b!642392 (=> res!416106 e!367879)))

(declare-fun noDuplicate!410 (List!12451) Bool)

(assert (=> b!642392 (= res!416106 (not (noDuplicate!410 Nil!12448)))))

(assert (= (and start!58128 res!416108) b!642381))

(assert (= (and b!642381 res!416095) b!642390))

(assert (= (and b!642390 res!416103) b!642371))

(assert (= (and b!642371 res!416110) b!642379))

(assert (= (and b!642379 res!416098) b!642391))

(assert (= (and b!642391 res!416099) b!642383))

(assert (= (and b!642383 res!416104) b!642389))

(assert (= (and b!642389 res!416100) b!642376))

(assert (= (and b!642376 res!416101) b!642386))

(assert (= (and b!642386 res!416114) b!642388))

(assert (= (and b!642388 res!416097) b!642375))

(assert (= (and b!642375 res!416096) b!642385))

(assert (= (and b!642375 c!73505) b!642372))

(assert (= (and b!642375 (not c!73505)) b!642384))

(assert (= (and b!642375 (not res!416112)) b!642377))

(assert (= (and b!642377 res!416111) b!642374))

(assert (= (and b!642374 (not res!416109)) b!642378))

(assert (= (and b!642378 res!416105) b!642382))

(assert (= (and b!642377 (not res!416107)) b!642373))

(assert (= (and b!642373 (not res!416102)) b!642392))

(assert (= (and b!642392 (not res!416106)) b!642380))

(assert (= (and b!642380 (not res!416113)) b!642387))

(declare-fun m!616141 () Bool)

(assert (=> b!642391 m!616141))

(declare-fun m!616143 () Bool)

(assert (=> b!642373 m!616143))

(declare-fun m!616145 () Bool)

(assert (=> b!642373 m!616145))

(declare-fun m!616147 () Bool)

(assert (=> b!642373 m!616147))

(declare-fun m!616149 () Bool)

(assert (=> b!642373 m!616149))

(declare-fun m!616151 () Bool)

(assert (=> b!642373 m!616151))

(declare-fun m!616153 () Bool)

(assert (=> b!642373 m!616153))

(assert (=> b!642373 m!616147))

(assert (=> b!642373 m!616147))

(declare-fun m!616155 () Bool)

(assert (=> b!642373 m!616155))

(declare-fun m!616157 () Bool)

(assert (=> b!642375 m!616157))

(declare-fun m!616159 () Bool)

(assert (=> b!642375 m!616159))

(declare-fun m!616161 () Bool)

(assert (=> b!642375 m!616161))

(assert (=> b!642375 m!616147))

(declare-fun m!616163 () Bool)

(assert (=> b!642375 m!616163))

(assert (=> b!642375 m!616147))

(declare-fun m!616165 () Bool)

(assert (=> b!642375 m!616165))

(declare-fun m!616167 () Bool)

(assert (=> b!642375 m!616167))

(declare-fun m!616169 () Bool)

(assert (=> b!642375 m!616169))

(assert (=> b!642377 m!616147))

(assert (=> b!642377 m!616163))

(declare-fun m!616171 () Bool)

(assert (=> b!642377 m!616171))

(declare-fun m!616173 () Bool)

(assert (=> b!642376 m!616173))

(assert (=> b!642374 m!616147))

(declare-fun m!616175 () Bool)

(assert (=> b!642387 m!616175))

(declare-fun m!616177 () Bool)

(assert (=> b!642388 m!616177))

(assert (=> b!642388 m!616147))

(assert (=> b!642388 m!616147))

(declare-fun m!616179 () Bool)

(assert (=> b!642388 m!616179))

(declare-fun m!616181 () Bool)

(assert (=> b!642380 m!616181))

(declare-fun m!616183 () Bool)

(assert (=> b!642389 m!616183))

(declare-fun m!616185 () Bool)

(assert (=> b!642383 m!616185))

(assert (=> b!642386 m!616163))

(declare-fun m!616187 () Bool)

(assert (=> b!642386 m!616187))

(assert (=> b!642378 m!616147))

(assert (=> b!642378 m!616147))

(declare-fun m!616189 () Bool)

(assert (=> b!642378 m!616189))

(declare-fun m!616191 () Bool)

(assert (=> b!642379 m!616191))

(declare-fun m!616193 () Bool)

(assert (=> start!58128 m!616193))

(declare-fun m!616195 () Bool)

(assert (=> start!58128 m!616195))

(assert (=> b!642382 m!616147))

(assert (=> b!642382 m!616147))

(declare-fun m!616197 () Bool)

(assert (=> b!642382 m!616197))

(declare-fun m!616199 () Bool)

(assert (=> b!642392 m!616199))

(declare-fun m!616201 () Bool)

(assert (=> b!642371 m!616201))

(assert (=> b!642390 m!616147))

(assert (=> b!642390 m!616147))

(declare-fun m!616203 () Bool)

(assert (=> b!642390 m!616203))

(push 1)

