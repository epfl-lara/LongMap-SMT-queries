; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58448 () Bool)

(assert start!58448)

(declare-fun res!418360 () Bool)

(declare-fun e!370018 () Bool)

(assert (=> start!58448 (=> (not res!418360) (not e!370018))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58448 (= res!418360 (validMask!0 mask!3053))))

(assert (=> start!58448 e!370018))

(assert (=> start!58448 true))

(declare-datatypes ((array!38464 0))(
  ( (array!38465 (arr!18444 (Array (_ BitVec 32) (_ BitVec 64))) (size!18808 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38464)

(declare-fun array_inv!14240 (array!38464) Bool)

(assert (=> start!58448 (array_inv!14240 a!2986)))

(declare-fun b!645643 () Bool)

(declare-fun e!370025 () Bool)

(declare-fun e!370030 () Bool)

(assert (=> b!645643 (= e!370025 e!370030)))

(declare-fun res!418365 () Bool)

(assert (=> b!645643 (=> (not res!418365) (not e!370030))))

(declare-datatypes ((SeekEntryResult!6884 0))(
  ( (MissingZero!6884 (index!29871 (_ BitVec 32))) (Found!6884 (index!29872 (_ BitVec 32))) (Intermediate!6884 (undefined!7696 Bool) (index!29873 (_ BitVec 32)) (x!58645 (_ BitVec 32))) (Undefined!6884) (MissingVacant!6884 (index!29874 (_ BitVec 32))) )
))
(declare-fun lt!299440 () SeekEntryResult!6884)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!645643 (= res!418365 (and (= lt!299440 (Found!6884 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18444 a!2986) index!984) (select (arr!18444 a!2986) j!136))) (not (= (select (arr!18444 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38464 (_ BitVec 32)) SeekEntryResult!6884)

(assert (=> b!645643 (= lt!299440 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18444 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645644 () Bool)

(declare-fun e!370019 () Bool)

(declare-fun e!370031 () Bool)

(assert (=> b!645644 (= e!370019 e!370031)))

(declare-fun res!418367 () Bool)

(assert (=> b!645644 (=> res!418367 e!370031)))

(declare-fun lt!299449 () (_ BitVec 64))

(declare-fun lt!299439 () (_ BitVec 64))

(assert (=> b!645644 (= res!418367 (or (not (= (select (arr!18444 a!2986) j!136) lt!299439)) (not (= (select (arr!18444 a!2986) j!136) lt!299449))))))

(declare-fun e!370032 () Bool)

(assert (=> b!645644 e!370032))

(declare-fun res!418351 () Bool)

(assert (=> b!645644 (=> (not res!418351) (not e!370032))))

(assert (=> b!645644 (= res!418351 (= lt!299449 (select (arr!18444 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!645644 (= lt!299449 (select (store (arr!18444 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!645645 () Bool)

(declare-datatypes ((Unit!21930 0))(
  ( (Unit!21931) )
))
(declare-fun e!370024 () Unit!21930)

(declare-fun Unit!21932 () Unit!21930)

(assert (=> b!645645 (= e!370024 Unit!21932)))

(declare-fun lt!299451 () array!38464)

(declare-fun lt!299438 () Unit!21930)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21930)

(assert (=> b!645645 (= lt!299438 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299451 (select (arr!18444 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645645 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299442 () Unit!21930)

(declare-datatypes ((List!12485 0))(
  ( (Nil!12482) (Cons!12481 (h!13526 (_ BitVec 64)) (t!18713 List!12485)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12485) Unit!21930)

(assert (=> b!645645 (= lt!299442 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12482))))

(declare-fun arrayNoDuplicates!0 (array!38464 (_ BitVec 32) List!12485) Bool)

(assert (=> b!645645 (arrayNoDuplicates!0 lt!299451 #b00000000000000000000000000000000 Nil!12482)))

(declare-fun lt!299446 () Unit!21930)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38464 (_ BitVec 32) (_ BitVec 32)) Unit!21930)

(assert (=> b!645645 (= lt!299446 (lemmaNoDuplicateFromThenFromBigger!0 lt!299451 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645645 (arrayNoDuplicates!0 lt!299451 j!136 Nil!12482)))

(declare-fun lt!299441 () Unit!21930)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38464 (_ BitVec 64) (_ BitVec 32) List!12485) Unit!21930)

(assert (=> b!645645 (= lt!299441 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299451 (select (arr!18444 a!2986) j!136) j!136 Nil!12482))))

(assert (=> b!645645 false))

(declare-fun b!645646 () Bool)

(declare-fun res!418357 () Bool)

(assert (=> b!645646 (=> (not res!418357) (not e!370018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645646 (= res!418357 (validKeyInArray!0 (select (arr!18444 a!2986) j!136)))))

(declare-fun b!645647 () Bool)

(declare-fun res!418355 () Bool)

(assert (=> b!645647 (=> (not res!418355) (not e!370018))))

(assert (=> b!645647 (= res!418355 (validKeyInArray!0 k!1786))))

(declare-fun b!645648 () Bool)

(declare-fun res!418349 () Bool)

(declare-fun e!370020 () Bool)

(assert (=> b!645648 (=> (not res!418349) (not e!370020))))

(assert (=> b!645648 (= res!418349 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18444 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645649 () Bool)

(declare-fun Unit!21933 () Unit!21930)

(assert (=> b!645649 (= e!370024 Unit!21933)))

(declare-fun b!645650 () Bool)

(declare-fun res!418352 () Bool)

(assert (=> b!645650 (=> (not res!418352) (not e!370020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38464 (_ BitVec 32)) Bool)

(assert (=> b!645650 (= res!418352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645651 () Bool)

(declare-fun res!418358 () Bool)

(assert (=> b!645651 (=> (not res!418358) (not e!370018))))

(assert (=> b!645651 (= res!418358 (and (= (size!18808 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18808 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18808 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645652 () Bool)

(declare-fun e!370026 () Bool)

(assert (=> b!645652 (= e!370026 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) index!984))))

(declare-fun b!645653 () Bool)

(declare-fun e!370022 () Bool)

(assert (=> b!645653 (= e!370032 e!370022)))

(declare-fun res!418359 () Bool)

(assert (=> b!645653 (=> res!418359 e!370022)))

(assert (=> b!645653 (= res!418359 (or (not (= (select (arr!18444 a!2986) j!136) lt!299439)) (not (= (select (arr!18444 a!2986) j!136) lt!299449)) (bvsge j!136 index!984)))))

(declare-fun b!645654 () Bool)

(declare-fun res!418354 () Bool)

(assert (=> b!645654 (=> (not res!418354) (not e!370018))))

(assert (=> b!645654 (= res!418354 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645655 () Bool)

(declare-fun e!370027 () Bool)

(assert (=> b!645655 (= e!370027 (bvslt (size!18808 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!645655 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299452 () Unit!21930)

(assert (=> b!645655 (= lt!299452 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299451 (select (arr!18444 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370029 () Bool)

(assert (=> b!645655 e!370029))

(declare-fun res!418353 () Bool)

(assert (=> b!645655 (=> (not res!418353) (not e!370029))))

(assert (=> b!645655 (= res!418353 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) j!136))))

(declare-fun b!645656 () Bool)

(assert (=> b!645656 (= e!370030 (not e!370019))))

(declare-fun res!418366 () Bool)

(assert (=> b!645656 (=> res!418366 e!370019)))

(declare-fun lt!299448 () SeekEntryResult!6884)

(assert (=> b!645656 (= res!418366 (not (= lt!299448 (Found!6884 index!984))))))

(declare-fun lt!299447 () Unit!21930)

(declare-fun e!370021 () Unit!21930)

(assert (=> b!645656 (= lt!299447 e!370021)))

(declare-fun c!74015 () Bool)

(assert (=> b!645656 (= c!74015 (= lt!299448 Undefined!6884))))

(assert (=> b!645656 (= lt!299448 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299439 lt!299451 mask!3053))))

(declare-fun e!370028 () Bool)

(assert (=> b!645656 e!370028))

(declare-fun res!418361 () Bool)

(assert (=> b!645656 (=> (not res!418361) (not e!370028))))

(declare-fun lt!299444 () (_ BitVec 32))

(declare-fun lt!299443 () SeekEntryResult!6884)

(assert (=> b!645656 (= res!418361 (= lt!299443 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299444 vacantSpotIndex!68 lt!299439 lt!299451 mask!3053)))))

(assert (=> b!645656 (= lt!299443 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299444 vacantSpotIndex!68 (select (arr!18444 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645656 (= lt!299439 (select (store (arr!18444 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299450 () Unit!21930)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21930)

(assert (=> b!645656 (= lt!299450 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299444 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645656 (= lt!299444 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645657 () Bool)

(assert (=> b!645657 (= e!370020 e!370025)))

(declare-fun res!418364 () Bool)

(assert (=> b!645657 (=> (not res!418364) (not e!370025))))

(assert (=> b!645657 (= res!418364 (= (select (store (arr!18444 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645657 (= lt!299451 (array!38465 (store (arr!18444 a!2986) i!1108 k!1786) (size!18808 a!2986)))))

(declare-fun b!645658 () Bool)

(declare-fun res!418363 () Bool)

(assert (=> b!645658 (=> (not res!418363) (not e!370020))))

(assert (=> b!645658 (= res!418363 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12482))))

(declare-fun b!645659 () Bool)

(assert (=> b!645659 (= e!370029 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) index!984))))

(declare-fun b!645660 () Bool)

(declare-fun Unit!21934 () Unit!21930)

(assert (=> b!645660 (= e!370021 Unit!21934)))

(assert (=> b!645660 false))

(declare-fun b!645661 () Bool)

(assert (=> b!645661 (= e!370018 e!370020)))

(declare-fun res!418356 () Bool)

(assert (=> b!645661 (=> (not res!418356) (not e!370020))))

(declare-fun lt!299437 () SeekEntryResult!6884)

(assert (=> b!645661 (= res!418356 (or (= lt!299437 (MissingZero!6884 i!1108)) (= lt!299437 (MissingVacant!6884 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38464 (_ BitVec 32)) SeekEntryResult!6884)

(assert (=> b!645661 (= lt!299437 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!645662 () Bool)

(declare-fun Unit!21935 () Unit!21930)

(assert (=> b!645662 (= e!370021 Unit!21935)))

(declare-fun b!645663 () Bool)

(assert (=> b!645663 (= e!370031 e!370027)))

(declare-fun res!418350 () Bool)

(assert (=> b!645663 (=> res!418350 e!370027)))

(assert (=> b!645663 (= res!418350 (bvsge index!984 j!136))))

(declare-fun lt!299445 () Unit!21930)

(assert (=> b!645663 (= lt!299445 e!370024)))

(declare-fun c!74014 () Bool)

(assert (=> b!645663 (= c!74014 (bvslt j!136 index!984))))

(declare-fun b!645664 () Bool)

(assert (=> b!645664 (= e!370022 e!370026)))

(declare-fun res!418362 () Bool)

(assert (=> b!645664 (=> (not res!418362) (not e!370026))))

(assert (=> b!645664 (= res!418362 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) j!136))))

(declare-fun b!645665 () Bool)

(assert (=> b!645665 (= e!370028 (= lt!299440 lt!299443))))

(assert (= (and start!58448 res!418360) b!645651))

(assert (= (and b!645651 res!418358) b!645646))

(assert (= (and b!645646 res!418357) b!645647))

(assert (= (and b!645647 res!418355) b!645654))

(assert (= (and b!645654 res!418354) b!645661))

(assert (= (and b!645661 res!418356) b!645650))

(assert (= (and b!645650 res!418352) b!645658))

(assert (= (and b!645658 res!418363) b!645648))

(assert (= (and b!645648 res!418349) b!645657))

(assert (= (and b!645657 res!418364) b!645643))

(assert (= (and b!645643 res!418365) b!645656))

(assert (= (and b!645656 res!418361) b!645665))

(assert (= (and b!645656 c!74015) b!645660))

(assert (= (and b!645656 (not c!74015)) b!645662))

(assert (= (and b!645656 (not res!418366)) b!645644))

(assert (= (and b!645644 res!418351) b!645653))

(assert (= (and b!645653 (not res!418359)) b!645664))

(assert (= (and b!645664 res!418362) b!645652))

(assert (= (and b!645644 (not res!418367)) b!645663))

(assert (= (and b!645663 c!74014) b!645645))

(assert (= (and b!645663 (not c!74014)) b!645649))

(assert (= (and b!645663 (not res!418350)) b!645655))

(assert (= (and b!645655 res!418353) b!645659))

(declare-fun m!619145 () Bool)

(assert (=> b!645664 m!619145))

(assert (=> b!645664 m!619145))

(declare-fun m!619147 () Bool)

(assert (=> b!645664 m!619147))

(assert (=> b!645646 m!619145))

(assert (=> b!645646 m!619145))

(declare-fun m!619149 () Bool)

(assert (=> b!645646 m!619149))

(assert (=> b!645644 m!619145))

(declare-fun m!619151 () Bool)

(assert (=> b!645644 m!619151))

(declare-fun m!619153 () Bool)

(assert (=> b!645644 m!619153))

(declare-fun m!619155 () Bool)

(assert (=> b!645658 m!619155))

(declare-fun m!619157 () Bool)

(assert (=> b!645654 m!619157))

(declare-fun m!619159 () Bool)

(assert (=> b!645648 m!619159))

(declare-fun m!619161 () Bool)

(assert (=> b!645647 m!619161))

(declare-fun m!619163 () Bool)

(assert (=> b!645661 m!619163))

(assert (=> b!645659 m!619145))

(assert (=> b!645659 m!619145))

(declare-fun m!619165 () Bool)

(assert (=> b!645659 m!619165))

(assert (=> b!645645 m!619145))

(declare-fun m!619167 () Bool)

(assert (=> b!645645 m!619167))

(assert (=> b!645645 m!619145))

(declare-fun m!619169 () Bool)

(assert (=> b!645645 m!619169))

(declare-fun m!619171 () Bool)

(assert (=> b!645645 m!619171))

(assert (=> b!645645 m!619145))

(declare-fun m!619173 () Bool)

(assert (=> b!645645 m!619173))

(declare-fun m!619175 () Bool)

(assert (=> b!645645 m!619175))

(assert (=> b!645645 m!619145))

(declare-fun m!619177 () Bool)

(assert (=> b!645645 m!619177))

(declare-fun m!619179 () Bool)

(assert (=> b!645645 m!619179))

(assert (=> b!645657 m!619151))

(declare-fun m!619181 () Bool)

(assert (=> b!645657 m!619181))

(declare-fun m!619183 () Bool)

(assert (=> b!645656 m!619183))

(declare-fun m!619185 () Bool)

(assert (=> b!645656 m!619185))

(assert (=> b!645656 m!619145))

(assert (=> b!645656 m!619151))

(assert (=> b!645656 m!619145))

(declare-fun m!619187 () Bool)

(assert (=> b!645656 m!619187))

(declare-fun m!619189 () Bool)

(assert (=> b!645656 m!619189))

(declare-fun m!619191 () Bool)

(assert (=> b!645656 m!619191))

(declare-fun m!619193 () Bool)

(assert (=> b!645656 m!619193))

(declare-fun m!619195 () Bool)

(assert (=> b!645643 m!619195))

(assert (=> b!645643 m!619145))

(assert (=> b!645643 m!619145))

(declare-fun m!619197 () Bool)

(assert (=> b!645643 m!619197))

(assert (=> b!645653 m!619145))

(declare-fun m!619199 () Bool)

(assert (=> b!645650 m!619199))

(assert (=> b!645655 m!619145))

(assert (=> b!645655 m!619145))

(declare-fun m!619201 () Bool)

(assert (=> b!645655 m!619201))

(assert (=> b!645655 m!619145))

(declare-fun m!619203 () Bool)

(assert (=> b!645655 m!619203))

(assert (=> b!645655 m!619145))

(assert (=> b!645655 m!619147))

(declare-fun m!619205 () Bool)

(assert (=> start!58448 m!619205))

(declare-fun m!619207 () Bool)

(assert (=> start!58448 m!619207))

(assert (=> b!645652 m!619145))

(assert (=> b!645652 m!619145))

(assert (=> b!645652 m!619165))

(push 1)

(assert (not b!645652))

(assert (not b!645658))

(assert (not b!645647))

(assert (not start!58448))

(assert (not b!645659))

(assert (not b!645664))

(assert (not b!645643))

(assert (not b!645650))

(assert (not b!645656))

(assert (not b!645654))

(assert (not b!645655))

(assert (not b!645646))

(assert (not b!645645))

(assert (not b!645661))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91239 () Bool)

(declare-fun res!418512 () Bool)

(declare-fun e!370168 () Bool)

(assert (=> d!91239 (=> res!418512 e!370168)))

(assert (=> d!91239 (= res!418512 (= (select (arr!18444 lt!299451) index!984) (select (arr!18444 a!2986) j!136)))))

(assert (=> d!91239 (= (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) index!984) e!370168)))

(declare-fun b!645864 () Bool)

(declare-fun e!370169 () Bool)

(assert (=> b!645864 (= e!370168 e!370169)))

(declare-fun res!418513 () Bool)

(assert (=> b!645864 (=> (not res!418513) (not e!370169))))

(assert (=> b!645864 (= res!418513 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18808 lt!299451)))))

(declare-fun b!645865 () Bool)

(assert (=> b!645865 (= e!370169 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91239 (not res!418512)) b!645864))

(assert (= (and b!645864 res!418513) b!645865))

(declare-fun m!619373 () Bool)

(assert (=> d!91239 m!619373))

(assert (=> b!645865 m!619145))

(declare-fun m!619375 () Bool)

(assert (=> b!645865 m!619375))

(assert (=> b!645659 d!91239))

(declare-fun b!645890 () Bool)

(declare-fun e!370193 () Bool)

(declare-fun call!33642 () Bool)

(assert (=> b!645890 (= e!370193 call!33642)))

(declare-fun b!645891 () Bool)

(declare-fun e!370192 () Bool)

(assert (=> b!645891 (= e!370192 e!370193)))

(declare-fun c!74046 () Bool)

(assert (=> b!645891 (= c!74046 (validKeyInArray!0 (select (arr!18444 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!645892 () Bool)

(declare-fun e!370191 () Bool)

(assert (=> b!645892 (= e!370191 e!370192)))

(declare-fun res!418532 () Bool)

(assert (=> b!645892 (=> (not res!418532) (not e!370192))))

(declare-fun e!370194 () Bool)

(assert (=> b!645892 (= res!418532 (not e!370194))))

(declare-fun res!418534 () Bool)

(assert (=> b!645892 (=> (not res!418534) (not e!370194))))

(assert (=> b!645892 (= res!418534 (validKeyInArray!0 (select (arr!18444 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91243 () Bool)

(declare-fun res!418533 () Bool)

(assert (=> d!91243 (=> res!418533 e!370191)))

(assert (=> d!91243 (= res!418533 (bvsge #b00000000000000000000000000000000 (size!18808 a!2986)))))

(assert (=> d!91243 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12482) e!370191)))

(declare-fun bm!33639 () Bool)

(assert (=> bm!33639 (= call!33642 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74046 (Cons!12481 (select (arr!18444 a!2986) #b00000000000000000000000000000000) Nil!12482) Nil!12482)))))

(declare-fun b!645893 () Bool)

(declare-fun contains!3149 (List!12485 (_ BitVec 64)) Bool)

(assert (=> b!645893 (= e!370194 (contains!3149 Nil!12482 (select (arr!18444 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!645894 () Bool)

(assert (=> b!645894 (= e!370193 call!33642)))

(assert (= (and d!91243 (not res!418533)) b!645892))

(assert (= (and b!645892 res!418534) b!645893))

(assert (= (and b!645892 res!418532) b!645891))

(assert (= (and b!645891 c!74046) b!645890))

(assert (= (and b!645891 (not c!74046)) b!645894))

(assert (= (or b!645890 b!645894) bm!33639))

(declare-fun m!619391 () Bool)

(assert (=> b!645891 m!619391))

(assert (=> b!645891 m!619391))

(declare-fun m!619393 () Bool)

(assert (=> b!645891 m!619393))

(assert (=> b!645892 m!619391))

(assert (=> b!645892 m!619391))

(assert (=> b!645892 m!619393))

(assert (=> bm!33639 m!619391))

(declare-fun m!619395 () Bool)

(assert (=> bm!33639 m!619395))

(assert (=> b!645893 m!619391))

(assert (=> b!645893 m!619391))

(declare-fun m!619397 () Bool)

(assert (=> b!645893 m!619397))

(assert (=> b!645658 d!91243))

(declare-fun d!91251 () Bool)

(assert (=> d!91251 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!645647 d!91251))

(declare-fun d!91253 () Bool)

(assert (=> d!91253 (= (validKeyInArray!0 (select (arr!18444 a!2986) j!136)) (and (not (= (select (arr!18444 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18444 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!645646 d!91253))

(declare-fun d!91255 () Bool)

(declare-fun lt!299569 () (_ BitVec 32))

(assert (=> d!91255 (and (bvsge lt!299569 #b00000000000000000000000000000000) (bvslt lt!299569 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91255 (= lt!299569 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91255 (validMask!0 mask!3053)))

(assert (=> d!91255 (= (nextIndex!0 index!984 x!910 mask!3053) lt!299569)))

(declare-fun bs!19296 () Bool)

(assert (= bs!19296 d!91255))

(declare-fun m!619403 () Bool)

(assert (=> bs!19296 m!619403))

(assert (=> bs!19296 m!619205))

(assert (=> b!645656 d!91255))

(declare-fun b!645945 () Bool)

(declare-fun c!74069 () Bool)

(declare-fun lt!299591 () (_ BitVec 64))

(assert (=> b!645945 (= c!74069 (= lt!299591 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370224 () SeekEntryResult!6884)

(declare-fun e!370225 () SeekEntryResult!6884)

(assert (=> b!645945 (= e!370224 e!370225)))

(declare-fun b!645946 () Bool)

(assert (=> b!645946 (= e!370225 (MissingVacant!6884 vacantSpotIndex!68))))

(declare-fun b!645947 () Bool)

(assert (=> b!645947 (= e!370224 (Found!6884 index!984))))

(declare-fun b!645949 () Bool)

(assert (=> b!645949 (= e!370225 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!299439 lt!299451 mask!3053))))

(declare-fun b!645950 () Bool)

(declare-fun e!370223 () SeekEntryResult!6884)

(assert (=> b!645950 (= e!370223 e!370224)))

(declare-fun c!74071 () Bool)

(assert (=> b!645950 (= c!74071 (= lt!299591 lt!299439))))

(declare-fun b!645948 () Bool)

(assert (=> b!645948 (= e!370223 Undefined!6884)))

(declare-fun lt!299590 () SeekEntryResult!6884)

(declare-fun d!91259 () Bool)

(assert (=> d!91259 (and (or (is-Undefined!6884 lt!299590) (not (is-Found!6884 lt!299590)) (and (bvsge (index!29872 lt!299590) #b00000000000000000000000000000000) (bvslt (index!29872 lt!299590) (size!18808 lt!299451)))) (or (is-Undefined!6884 lt!299590) (is-Found!6884 lt!299590) (not (is-MissingVacant!6884 lt!299590)) (not (= (index!29874 lt!299590) vacantSpotIndex!68)) (and (bvsge (index!29874 lt!299590) #b00000000000000000000000000000000) (bvslt (index!29874 lt!299590) (size!18808 lt!299451)))) (or (is-Undefined!6884 lt!299590) (ite (is-Found!6884 lt!299590) (= (select (arr!18444 lt!299451) (index!29872 lt!299590)) lt!299439) (and (is-MissingVacant!6884 lt!299590) (= (index!29874 lt!299590) vacantSpotIndex!68) (= (select (arr!18444 lt!299451) (index!29874 lt!299590)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91259 (= lt!299590 e!370223)))

(declare-fun c!74070 () Bool)

(assert (=> d!91259 (= c!74070 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91259 (= lt!299591 (select (arr!18444 lt!299451) index!984))))

(assert (=> d!91259 (validMask!0 mask!3053)))

(assert (=> d!91259 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299439 lt!299451 mask!3053) lt!299590)))

(assert (= (and d!91259 c!74070) b!645948))

(assert (= (and d!91259 (not c!74070)) b!645950))

(assert (= (and b!645950 c!74071) b!645947))

(assert (= (and b!645950 (not c!74071)) b!645945))

(assert (= (and b!645945 c!74069) b!645946))

(assert (= (and b!645945 (not c!74069)) b!645949))

(assert (=> b!645949 m!619183))

(assert (=> b!645949 m!619183))

(declare-fun m!619441 () Bool)

(assert (=> b!645949 m!619441))

(declare-fun m!619443 () Bool)

(assert (=> d!91259 m!619443))

(declare-fun m!619445 () Bool)

(assert (=> d!91259 m!619445))

(assert (=> d!91259 m!619373))

(assert (=> d!91259 m!619205))

(assert (=> b!645656 d!91259))

(declare-fun d!91273 () Bool)

(declare-fun e!370251 () Bool)

(assert (=> d!91273 e!370251))

(declare-fun res!418556 () Bool)

(assert (=> d!91273 (=> (not res!418556) (not e!370251))))

(assert (=> d!91273 (= res!418556 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18808 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18808 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18808 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18808 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18808 a!2986))))))

(declare-fun lt!299618 () Unit!21930)

(declare-fun choose!9 (array!38464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21930)

(assert (=> d!91273 (= lt!299618 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299444 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91273 (validMask!0 mask!3053)))

(assert (=> d!91273 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299444 vacantSpotIndex!68 mask!3053) lt!299618)))

(declare-fun b!645986 () Bool)

(assert (=> b!645986 (= e!370251 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299444 vacantSpotIndex!68 (select (arr!18444 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299444 vacantSpotIndex!68 (select (store (arr!18444 a!2986) i!1108 k!1786) j!136) (array!38465 (store (arr!18444 a!2986) i!1108 k!1786) (size!18808 a!2986)) mask!3053)))))

(assert (= (and d!91273 res!418556) b!645986))

(declare-fun m!619501 () Bool)

(assert (=> d!91273 m!619501))

(assert (=> d!91273 m!619205))

(assert (=> b!645986 m!619145))

(assert (=> b!645986 m!619187))

(assert (=> b!645986 m!619185))

(declare-fun m!619503 () Bool)

(assert (=> b!645986 m!619503))

(assert (=> b!645986 m!619145))

(assert (=> b!645986 m!619151))

(assert (=> b!645986 m!619185))

(assert (=> b!645656 d!91273))

(declare-fun b!645992 () Bool)

(declare-fun c!74083 () Bool)

(declare-fun lt!299620 () (_ BitVec 64))

(assert (=> b!645992 (= c!74083 (= lt!299620 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370257 () SeekEntryResult!6884)

(declare-fun e!370258 () SeekEntryResult!6884)

(assert (=> b!645992 (= e!370257 e!370258)))

(declare-fun b!645993 () Bool)

(assert (=> b!645993 (= e!370258 (MissingVacant!6884 vacantSpotIndex!68))))

(declare-fun b!645994 () Bool)

(assert (=> b!645994 (= e!370257 (Found!6884 lt!299444))))

(declare-fun b!645996 () Bool)

(assert (=> b!645996 (= e!370258 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299444 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!299439 lt!299451 mask!3053))))

(declare-fun b!645997 () Bool)

(declare-fun e!370256 () SeekEntryResult!6884)

(assert (=> b!645997 (= e!370256 e!370257)))

(declare-fun c!74085 () Bool)

(assert (=> b!645997 (= c!74085 (= lt!299620 lt!299439))))

(declare-fun b!645995 () Bool)

(assert (=> b!645995 (= e!370256 Undefined!6884)))

(declare-fun lt!299619 () SeekEntryResult!6884)

(declare-fun d!91301 () Bool)

(assert (=> d!91301 (and (or (is-Undefined!6884 lt!299619) (not (is-Found!6884 lt!299619)) (and (bvsge (index!29872 lt!299619) #b00000000000000000000000000000000) (bvslt (index!29872 lt!299619) (size!18808 lt!299451)))) (or (is-Undefined!6884 lt!299619) (is-Found!6884 lt!299619) (not (is-MissingVacant!6884 lt!299619)) (not (= (index!29874 lt!299619) vacantSpotIndex!68)) (and (bvsge (index!29874 lt!299619) #b00000000000000000000000000000000) (bvslt (index!29874 lt!299619) (size!18808 lt!299451)))) (or (is-Undefined!6884 lt!299619) (ite (is-Found!6884 lt!299619) (= (select (arr!18444 lt!299451) (index!29872 lt!299619)) lt!299439) (and (is-MissingVacant!6884 lt!299619) (= (index!29874 lt!299619) vacantSpotIndex!68) (= (select (arr!18444 lt!299451) (index!29874 lt!299619)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91301 (= lt!299619 e!370256)))

(declare-fun c!74084 () Bool)

(assert (=> d!91301 (= c!74084 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91301 (= lt!299620 (select (arr!18444 lt!299451) lt!299444))))

(assert (=> d!91301 (validMask!0 mask!3053)))

(assert (=> d!91301 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299444 vacantSpotIndex!68 lt!299439 lt!299451 mask!3053) lt!299619)))

(assert (= (and d!91301 c!74084) b!645995))

(assert (= (and d!91301 (not c!74084)) b!645997))

(assert (= (and b!645997 c!74085) b!645994))

(assert (= (and b!645997 (not c!74085)) b!645992))

(assert (= (and b!645992 c!74083) b!645993))

(assert (= (and b!645992 (not c!74083)) b!645996))

(declare-fun m!619515 () Bool)

(assert (=> b!645996 m!619515))

(assert (=> b!645996 m!619515))

(declare-fun m!619519 () Bool)

(assert (=> b!645996 m!619519))

(declare-fun m!619521 () Bool)

(assert (=> d!91301 m!619521))

(declare-fun m!619523 () Bool)

(assert (=> d!91301 m!619523))

(declare-fun m!619525 () Bool)

(assert (=> d!91301 m!619525))

(assert (=> d!91301 m!619205))

(assert (=> b!645656 d!91301))

(declare-fun b!646000 () Bool)

(declare-fun c!74086 () Bool)

(declare-fun lt!299623 () (_ BitVec 64))

(assert (=> b!646000 (= c!74086 (= lt!299623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370262 () SeekEntryResult!6884)

(declare-fun e!370263 () SeekEntryResult!6884)

(assert (=> b!646000 (= e!370262 e!370263)))

(declare-fun b!646001 () Bool)

(assert (=> b!646001 (= e!370263 (MissingVacant!6884 vacantSpotIndex!68))))

(declare-fun b!646002 () Bool)

(assert (=> b!646002 (= e!370262 (Found!6884 lt!299444))))

(declare-fun b!646004 () Bool)

(assert (=> b!646004 (= e!370263 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299444 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18444 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646005 () Bool)

(declare-fun e!370261 () SeekEntryResult!6884)

(assert (=> b!646005 (= e!370261 e!370262)))

(declare-fun c!74088 () Bool)

(assert (=> b!646005 (= c!74088 (= lt!299623 (select (arr!18444 a!2986) j!136)))))

(declare-fun b!646003 () Bool)

(assert (=> b!646003 (= e!370261 Undefined!6884)))

(declare-fun d!91307 () Bool)

(declare-fun lt!299622 () SeekEntryResult!6884)

(assert (=> d!91307 (and (or (is-Undefined!6884 lt!299622) (not (is-Found!6884 lt!299622)) (and (bvsge (index!29872 lt!299622) #b00000000000000000000000000000000) (bvslt (index!29872 lt!299622) (size!18808 a!2986)))) (or (is-Undefined!6884 lt!299622) (is-Found!6884 lt!299622) (not (is-MissingVacant!6884 lt!299622)) (not (= (index!29874 lt!299622) vacantSpotIndex!68)) (and (bvsge (index!29874 lt!299622) #b00000000000000000000000000000000) (bvslt (index!29874 lt!299622) (size!18808 a!2986)))) (or (is-Undefined!6884 lt!299622) (ite (is-Found!6884 lt!299622) (= (select (arr!18444 a!2986) (index!29872 lt!299622)) (select (arr!18444 a!2986) j!136)) (and (is-MissingVacant!6884 lt!299622) (= (index!29874 lt!299622) vacantSpotIndex!68) (= (select (arr!18444 a!2986) (index!29874 lt!299622)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91307 (= lt!299622 e!370261)))

(declare-fun c!74087 () Bool)

(assert (=> d!91307 (= c!74087 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91307 (= lt!299623 (select (arr!18444 a!2986) lt!299444))))

(assert (=> d!91307 (validMask!0 mask!3053)))

(assert (=> d!91307 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299444 vacantSpotIndex!68 (select (arr!18444 a!2986) j!136) a!2986 mask!3053) lt!299622)))

(assert (= (and d!91307 c!74087) b!646003))

(assert (= (and d!91307 (not c!74087)) b!646005))

(assert (= (and b!646005 c!74088) b!646002))

(assert (= (and b!646005 (not c!74088)) b!646000))

(assert (= (and b!646000 c!74086) b!646001))

(assert (= (and b!646000 (not c!74086)) b!646004))

(assert (=> b!646004 m!619515))

(assert (=> b!646004 m!619515))

(assert (=> b!646004 m!619145))

(declare-fun m!619529 () Bool)

(assert (=> b!646004 m!619529))

(declare-fun m!619531 () Bool)

(assert (=> d!91307 m!619531))

(declare-fun m!619533 () Bool)

(assert (=> d!91307 m!619533))

(declare-fun m!619535 () Bool)

(assert (=> d!91307 m!619535))

(assert (=> d!91307 m!619205))

(assert (=> b!645656 d!91307))

(declare-fun d!91311 () Bool)

(assert (=> d!91311 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18808 lt!299451)) (not (= (select (arr!18444 lt!299451) j!136) (select (arr!18444 a!2986) j!136))))))

(declare-fun lt!299626 () Unit!21930)

(declare-fun choose!21 (array!38464 (_ BitVec 64) (_ BitVec 32) List!12485) Unit!21930)

(assert (=> d!91311 (= lt!299626 (choose!21 lt!299451 (select (arr!18444 a!2986) j!136) j!136 Nil!12482))))

(assert (=> d!91311 (bvslt (size!18808 lt!299451) #b01111111111111111111111111111111)))

(assert (=> d!91311 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299451 (select (arr!18444 a!2986) j!136) j!136 Nil!12482) lt!299626)))

(declare-fun bs!19304 () Bool)

(assert (= bs!19304 d!91311))

(declare-fun m!619537 () Bool)

(assert (=> bs!19304 m!619537))

(assert (=> bs!19304 m!619145))

(declare-fun m!619539 () Bool)

(assert (=> bs!19304 m!619539))

(assert (=> b!645645 d!91311))

(declare-fun d!91313 () Bool)

(declare-fun res!418562 () Bool)

(declare-fun e!370264 () Bool)

(assert (=> d!91313 (=> res!418562 e!370264)))

(assert (=> d!91313 (= res!418562 (= (select (arr!18444 lt!299451) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18444 a!2986) j!136)))))

(assert (=> d!91313 (= (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!370264)))

(declare-fun b!646006 () Bool)

(declare-fun e!370265 () Bool)

(assert (=> b!646006 (= e!370264 e!370265)))

(declare-fun res!418563 () Bool)

(assert (=> b!646006 (=> (not res!418563) (not e!370265))))

(assert (=> b!646006 (= res!418563 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18808 lt!299451)))))

(declare-fun b!646007 () Bool)

(assert (=> b!646007 (= e!370265 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91313 (not res!418562)) b!646006))

(assert (= (and b!646006 res!418563) b!646007))

(declare-fun m!619541 () Bool)

(assert (=> d!91313 m!619541))

(assert (=> b!646007 m!619145))

(declare-fun m!619543 () Bool)

(assert (=> b!646007 m!619543))

(assert (=> b!645645 d!91313))

(declare-fun b!646008 () Bool)

(declare-fun e!370268 () Bool)

(declare-fun call!33646 () Bool)

(assert (=> b!646008 (= e!370268 call!33646)))

(declare-fun b!646009 () Bool)

(declare-fun e!370267 () Bool)

(assert (=> b!646009 (= e!370267 e!370268)))

(declare-fun c!74089 () Bool)

(assert (=> b!646009 (= c!74089 (validKeyInArray!0 (select (arr!18444 lt!299451) #b00000000000000000000000000000000)))))

(declare-fun b!646010 () Bool)

(declare-fun e!370266 () Bool)

(assert (=> b!646010 (= e!370266 e!370267)))

(declare-fun res!418564 () Bool)

(assert (=> b!646010 (=> (not res!418564) (not e!370267))))

(declare-fun e!370269 () Bool)

(assert (=> b!646010 (= res!418564 (not e!370269))))

(declare-fun res!418566 () Bool)

(assert (=> b!646010 (=> (not res!418566) (not e!370269))))

(assert (=> b!646010 (= res!418566 (validKeyInArray!0 (select (arr!18444 lt!299451) #b00000000000000000000000000000000)))))

(declare-fun d!91315 () Bool)

(declare-fun res!418565 () Bool)

(assert (=> d!91315 (=> res!418565 e!370266)))

(assert (=> d!91315 (= res!418565 (bvsge #b00000000000000000000000000000000 (size!18808 lt!299451)))))

(assert (=> d!91315 (= (arrayNoDuplicates!0 lt!299451 #b00000000000000000000000000000000 Nil!12482) e!370266)))

(declare-fun bm!33643 () Bool)

(assert (=> bm!33643 (= call!33646 (arrayNoDuplicates!0 lt!299451 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74089 (Cons!12481 (select (arr!18444 lt!299451) #b00000000000000000000000000000000) Nil!12482) Nil!12482)))))

(declare-fun b!646011 () Bool)

(assert (=> b!646011 (= e!370269 (contains!3149 Nil!12482 (select (arr!18444 lt!299451) #b00000000000000000000000000000000)))))

(declare-fun b!646012 () Bool)

(assert (=> b!646012 (= e!370268 call!33646)))

(assert (= (and d!91315 (not res!418565)) b!646010))

(assert (= (and b!646010 res!418566) b!646011))

(assert (= (and b!646010 res!418564) b!646009))

(assert (= (and b!646009 c!74089) b!646008))

(assert (= (and b!646009 (not c!74089)) b!646012))

(assert (= (or b!646008 b!646012) bm!33643))

(declare-fun m!619545 () Bool)

(assert (=> b!646009 m!619545))

(assert (=> b!646009 m!619545))

(declare-fun m!619547 () Bool)

(assert (=> b!646009 m!619547))

(assert (=> b!646010 m!619545))

(assert (=> b!646010 m!619545))

(assert (=> b!646010 m!619547))

(assert (=> bm!33643 m!619545))

(declare-fun m!619549 () Bool)

(assert (=> bm!33643 m!619549))

(assert (=> b!646011 m!619545))

(assert (=> b!646011 m!619545))

(declare-fun m!619551 () Bool)

(assert (=> b!646011 m!619551))

(assert (=> b!645645 d!91315))

(declare-fun d!91317 () Bool)

(assert (=> d!91317 (arrayNoDuplicates!0 lt!299451 j!136 Nil!12482)))

(declare-fun lt!299629 () Unit!21930)

(declare-fun choose!39 (array!38464 (_ BitVec 32) (_ BitVec 32)) Unit!21930)

(assert (=> d!91317 (= lt!299629 (choose!39 lt!299451 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91317 (bvslt (size!18808 lt!299451) #b01111111111111111111111111111111)))

(assert (=> d!91317 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!299451 #b00000000000000000000000000000000 j!136) lt!299629)))

(declare-fun bs!19305 () Bool)

(assert (= bs!19305 d!91317))

(assert (=> bs!19305 m!619171))

(declare-fun m!619553 () Bool)

(assert (=> bs!19305 m!619553))

(assert (=> b!645645 d!91317))

(declare-fun b!646013 () Bool)

(declare-fun e!370272 () Bool)

(declare-fun call!33647 () Bool)

(assert (=> b!646013 (= e!370272 call!33647)))

(declare-fun b!646014 () Bool)

(declare-fun e!370271 () Bool)

(assert (=> b!646014 (= e!370271 e!370272)))

(declare-fun c!74090 () Bool)

(assert (=> b!646014 (= c!74090 (validKeyInArray!0 (select (arr!18444 lt!299451) j!136)))))

(declare-fun b!646015 () Bool)

(declare-fun e!370270 () Bool)

(assert (=> b!646015 (= e!370270 e!370271)))

(declare-fun res!418567 () Bool)

(assert (=> b!646015 (=> (not res!418567) (not e!370271))))

(declare-fun e!370273 () Bool)

(assert (=> b!646015 (= res!418567 (not e!370273))))

(declare-fun res!418569 () Bool)

(assert (=> b!646015 (=> (not res!418569) (not e!370273))))

(assert (=> b!646015 (= res!418569 (validKeyInArray!0 (select (arr!18444 lt!299451) j!136)))))

(declare-fun d!91319 () Bool)

(declare-fun res!418568 () Bool)

(assert (=> d!91319 (=> res!418568 e!370270)))

(assert (=> d!91319 (= res!418568 (bvsge j!136 (size!18808 lt!299451)))))

(assert (=> d!91319 (= (arrayNoDuplicates!0 lt!299451 j!136 Nil!12482) e!370270)))

(declare-fun bm!33644 () Bool)

(assert (=> bm!33644 (= call!33647 (arrayNoDuplicates!0 lt!299451 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74090 (Cons!12481 (select (arr!18444 lt!299451) j!136) Nil!12482) Nil!12482)))))

(declare-fun b!646016 () Bool)

(assert (=> b!646016 (= e!370273 (contains!3149 Nil!12482 (select (arr!18444 lt!299451) j!136)))))

(declare-fun b!646017 () Bool)

(assert (=> b!646017 (= e!370272 call!33647)))

(assert (= (and d!91319 (not res!418568)) b!646015))

(assert (= (and b!646015 res!418569) b!646016))

(assert (= (and b!646015 res!418567) b!646014))

(assert (= (and b!646014 c!74090) b!646013))

(assert (= (and b!646014 (not c!74090)) b!646017))

(assert (= (or b!646013 b!646017) bm!33644))

(assert (=> b!646014 m!619537))

(assert (=> b!646014 m!619537))

(declare-fun m!619555 () Bool)

(assert (=> b!646014 m!619555))

(assert (=> b!646015 m!619537))

(assert (=> b!646015 m!619537))

(assert (=> b!646015 m!619555))

(assert (=> bm!33644 m!619537))

(declare-fun m!619557 () Bool)

(assert (=> bm!33644 m!619557))

(assert (=> b!646016 m!619537))

(assert (=> b!646016 m!619537))

(declare-fun m!619559 () Bool)

(assert (=> b!646016 m!619559))

(assert (=> b!645645 d!91319))

(declare-fun d!91321 () Bool)

(assert (=> d!91321 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299634 () Unit!21930)

(declare-fun choose!114 (array!38464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21930)

(assert (=> d!91321 (= lt!299634 (choose!114 lt!299451 (select (arr!18444 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91321 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91321 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299451 (select (arr!18444 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!299634)))

(declare-fun bs!19306 () Bool)

(assert (= bs!19306 d!91321))

(assert (=> bs!19306 m!619145))

(assert (=> bs!19306 m!619173))

(assert (=> bs!19306 m!619145))

(declare-fun m!619563 () Bool)

(assert (=> bs!19306 m!619563))

(assert (=> b!645645 d!91321))

(declare-fun d!91327 () Bool)

(declare-fun e!370279 () Bool)

(assert (=> d!91327 e!370279))

(declare-fun res!418572 () Bool)

(assert (=> d!91327 (=> (not res!418572) (not e!370279))))

(assert (=> d!91327 (= res!418572 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18808 a!2986))))))

(declare-fun lt!299637 () Unit!21930)

(declare-fun choose!41 (array!38464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12485) Unit!21930)

(assert (=> d!91327 (= lt!299637 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12482))))

(assert (=> d!91327 (bvslt (size!18808 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91327 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12482) lt!299637)))

(declare-fun b!646026 () Bool)

(assert (=> b!646026 (= e!370279 (arrayNoDuplicates!0 (array!38465 (store (arr!18444 a!2986) i!1108 k!1786) (size!18808 a!2986)) #b00000000000000000000000000000000 Nil!12482))))

(assert (= (and d!91327 res!418572) b!646026))

(declare-fun m!619569 () Bool)

(assert (=> d!91327 m!619569))

(assert (=> b!646026 m!619151))

(declare-fun m!619571 () Bool)

(assert (=> b!646026 m!619571))

(assert (=> b!645645 d!91327))

(declare-fun d!91331 () Bool)

(declare-fun res!418573 () Bool)

(declare-fun e!370280 () Bool)

(assert (=> d!91331 (=> res!418573 e!370280)))

(assert (=> d!91331 (= res!418573 (= (select (arr!18444 lt!299451) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18444 a!2986) j!136)))))

(assert (=> d!91331 (= (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!370280)))

(declare-fun b!646027 () Bool)

(declare-fun e!370281 () Bool)

(assert (=> b!646027 (= e!370280 e!370281)))

(declare-fun res!418574 () Bool)

(assert (=> b!646027 (=> (not res!418574) (not e!370281))))

(assert (=> b!646027 (= res!418574 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18808 lt!299451)))))

(declare-fun b!646028 () Bool)

(assert (=> b!646028 (= e!370281 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91331 (not res!418573)) b!646027))

(assert (= (and b!646027 res!418574) b!646028))

(declare-fun m!619573 () Bool)

(assert (=> d!91331 m!619573))

(assert (=> b!646028 m!619145))

(declare-fun m!619575 () Bool)

(assert (=> b!646028 m!619575))

(assert (=> b!645655 d!91331))

(declare-fun d!91333 () Bool)

(assert (=> d!91333 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299644 () Unit!21930)

(assert (=> d!91333 (= lt!299644 (choose!114 lt!299451 (select (arr!18444 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91333 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91333 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299451 (select (arr!18444 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!299644)))

(declare-fun bs!19307 () Bool)

(assert (= bs!19307 d!91333))

(assert (=> bs!19307 m!619145))

(assert (=> bs!19307 m!619201))

(assert (=> bs!19307 m!619145))

(declare-fun m!619577 () Bool)

(assert (=> bs!19307 m!619577))

(assert (=> b!645655 d!91333))

(declare-fun d!91335 () Bool)

(declare-fun res!418577 () Bool)

(declare-fun e!370290 () Bool)

(assert (=> d!91335 (=> res!418577 e!370290)))

(assert (=> d!91335 (= res!418577 (= (select (arr!18444 lt!299451) j!136) (select (arr!18444 a!2986) j!136)))))

(assert (=> d!91335 (= (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) j!136) e!370290)))

(declare-fun b!646045 () Bool)

(declare-fun e!370291 () Bool)

(assert (=> b!646045 (= e!370290 e!370291)))

(declare-fun res!418578 () Bool)

(assert (=> b!646045 (=> (not res!418578) (not e!370291))))

(assert (=> b!646045 (= res!418578 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18808 lt!299451)))))

(declare-fun b!646046 () Bool)

(assert (=> b!646046 (= e!370291 (arrayContainsKey!0 lt!299451 (select (arr!18444 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91335 (not res!418577)) b!646045))

(assert (= (and b!646045 res!418578) b!646046))

(assert (=> d!91335 m!619537))

(assert (=> b!646046 m!619145))

(declare-fun m!619579 () Bool)

(assert (=> b!646046 m!619579))

(assert (=> b!645655 d!91335))

(declare-fun d!91337 () Bool)

(declare-fun res!418581 () Bool)

(declare-fun e!370296 () Bool)

(assert (=> d!91337 (=> res!418581 e!370296)))

(assert (=> d!91337 (= res!418581 (= (select (arr!18444 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91337 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!370296)))

(declare-fun b!646051 () Bool)

(declare-fun e!370297 () Bool)

(assert (=> b!646051 (= e!370296 e!370297)))

(declare-fun res!418582 () Bool)

(assert (=> b!646051 (=> (not res!418582) (not e!370297))))

(assert (=> b!646051 (= res!418582 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18808 a!2986)))))

(declare-fun b!646052 () Bool)

(assert (=> b!646052 (= e!370297 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91337 (not res!418581)) b!646051))

(assert (= (and b!646051 res!418582) b!646052))

(assert (=> d!91337 m!619391))

(declare-fun m!619581 () Bool)

(assert (=> b!646052 m!619581))

(assert (=> b!645654 d!91337))

(declare-fun b!646053 () Bool)

(declare-fun c!74102 () Bool)

(declare-fun lt!299652 () (_ BitVec 64))

(assert (=> b!646053 (= c!74102 (= lt!299652 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370299 () SeekEntryResult!6884)

(declare-fun e!370300 () SeekEntryResult!6884)

(assert (=> b!646053 (= e!370299 e!370300)))

(declare-fun b!646054 () Bool)

(assert (=> b!646054 (= e!370300 (MissingVacant!6884 vacantSpotIndex!68))))

(declare-fun b!646055 () Bool)

(assert (=> b!646055 (= e!370299 (Found!6884 index!984))))

(declare-fun b!646057 () Bool)

(assert (=> b!646057 (= e!370300 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18444 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646058 () Bool)

(declare-fun e!370298 () SeekEntryResult!6884)

(assert (=> b!646058 (= e!370298 e!370299)))

(declare-fun c!74104 () Bool)

(assert (=> b!646058 (= c!74104 (= lt!299652 (select (arr!18444 a!2986) j!136)))))

(declare-fun b!646056 () Bool)

(assert (=> b!646056 (= e!370298 Undefined!6884)))

(declare-fun d!91339 () Bool)

(declare-fun lt!299651 () SeekEntryResult!6884)

(assert (=> d!91339 (and (or (is-Undefined!6884 lt!299651) (not (is-Found!6884 lt!299651)) (and (bvsge (index!29872 lt!299651) #b00000000000000000000000000000000) (bvslt (index!29872 lt!299651) (size!18808 a!2986)))) (or (is-Undefined!6884 lt!299651) (is-Found!6884 lt!299651) (not (is-MissingVacant!6884 lt!299651)) (not (= (index!29874 lt!299651) vacantSpotIndex!68)) (and (bvsge (index!29874 lt!299651) #b00000000000000000000000000000000) (bvslt (index!29874 lt!299651) (size!18808 a!2986)))) (or (is-Undefined!6884 lt!299651) (ite (is-Found!6884 lt!299651) (= (select (arr!18444 a!2986) (index!29872 lt!299651)) (select (arr!18444 a!2986) j!136)) (and (is-MissingVacant!6884 lt!299651) (= (index!29874 lt!299651) vacantSpotIndex!68) (= (select (arr!18444 a!2986) (index!29874 lt!299651)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91339 (= lt!299651 e!370298)))

(declare-fun c!74103 () Bool)

(assert (=> d!91339 (= c!74103 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91339 (= lt!299652 (select (arr!18444 a!2986) index!984))))

(assert (=> d!91339 (validMask!0 mask!3053)))

(assert (=> d!91339 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18444 a!2986) j!136) a!2986 mask!3053) lt!299651)))

(assert (= (and d!91339 c!74103) b!646056))

(assert (= (and d!91339 (not c!74103)) b!646058))

(assert (= (and b!646058 c!74104) b!646055))

(assert (= (and b!646058 (not c!74104)) b!646053))

(assert (= (and b!646053 c!74102) b!646054))

(assert (= (and b!646053 (not c!74102)) b!646057))

(assert (=> b!646057 m!619183))

(assert (=> b!646057 m!619183))

(assert (=> b!646057 m!619145))

(declare-fun m!619583 () Bool)

(assert (=> b!646057 m!619583))

(declare-fun m!619585 () Bool)

(assert (=> d!91339 m!619585))

(declare-fun m!619587 () Bool)

(assert (=> d!91339 m!619587))

(assert (=> d!91339 m!619195))

(assert (=> d!91339 m!619205))

(assert (=> b!645643 d!91339))

(assert (=> b!645664 d!91335))

(declare-fun d!91341 () Bool)

(assert (=> d!91341 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58448 d!91341))

(declare-fun d!91347 () Bool)

(assert (=> d!91347 (= (array_inv!14240 a!2986) (bvsge (size!18808 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58448 d!91347))

(assert (=> b!645652 d!91239))

(declare-fun b!646119 () Bool)

(declare-fun e!370340 () SeekEntryResult!6884)

(assert (=> b!646119 (= e!370340 Undefined!6884)))

(declare-fun b!646120 () Bool)

(declare-fun lt!299686 () SeekEntryResult!6884)

(declare-fun e!370339 () SeekEntryResult!6884)

(assert (=> b!646120 (= e!370339 (seekKeyOrZeroReturnVacant!0 (x!58645 lt!299686) (index!29873 lt!299686) (index!29873 lt!299686) k!1786 a!2986 mask!3053))))

(declare-fun b!646121 () Bool)

(declare-fun c!74127 () Bool)

(declare-fun lt!299685 () (_ BitVec 64))

(assert (=> b!646121 (= c!74127 (= lt!299685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370341 () SeekEntryResult!6884)

(assert (=> b!646121 (= e!370341 e!370339)))

(declare-fun b!646122 () Bool)

(assert (=> b!646122 (= e!370341 (Found!6884 (index!29873 lt!299686)))))

(declare-fun b!646123 () Bool)

(assert (=> b!646123 (= e!370340 e!370341)))

(assert (=> b!646123 (= lt!299685 (select (arr!18444 a!2986) (index!29873 lt!299686)))))

(declare-fun c!74128 () Bool)

(assert (=> b!646123 (= c!74128 (= lt!299685 k!1786))))

(declare-fun b!646124 () Bool)

(assert (=> b!646124 (= e!370339 (MissingZero!6884 (index!29873 lt!299686)))))

(declare-fun d!91349 () Bool)

(declare-fun lt!299684 () SeekEntryResult!6884)

(assert (=> d!91349 (and (or (is-Undefined!6884 lt!299684) (not (is-Found!6884 lt!299684)) (and (bvsge (index!29872 lt!299684) #b00000000000000000000000000000000) (bvslt (index!29872 lt!299684) (size!18808 a!2986)))) (or (is-Undefined!6884 lt!299684) (is-Found!6884 lt!299684) (not (is-MissingZero!6884 lt!299684)) (and (bvsge (index!29871 lt!299684) #b00000000000000000000000000000000) (bvslt (index!29871 lt!299684) (size!18808 a!2986)))) (or (is-Undefined!6884 lt!299684) (is-Found!6884 lt!299684) (is-MissingZero!6884 lt!299684) (not (is-MissingVacant!6884 lt!299684)) (and (bvsge (index!29874 lt!299684) #b00000000000000000000000000000000) (bvslt (index!29874 lt!299684) (size!18808 a!2986)))) (or (is-Undefined!6884 lt!299684) (ite (is-Found!6884 lt!299684) (= (select (arr!18444 a!2986) (index!29872 lt!299684)) k!1786) (ite (is-MissingZero!6884 lt!299684) (= (select (arr!18444 a!2986) (index!29871 lt!299684)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6884 lt!299684) (= (select (arr!18444 a!2986) (index!29874 lt!299684)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91349 (= lt!299684 e!370340)))

(declare-fun c!74129 () Bool)

(assert (=> d!91349 (= c!74129 (and (is-Intermediate!6884 lt!299686) (undefined!7696 lt!299686)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38464 (_ BitVec 32)) SeekEntryResult!6884)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91349 (= lt!299686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!91349 (validMask!0 mask!3053)))

(assert (=> d!91349 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!299684)))

(assert (= (and d!91349 c!74129) b!646119))

(assert (= (and d!91349 (not c!74129)) b!646123))

(assert (= (and b!646123 c!74128) b!646122))

(assert (= (and b!646123 (not c!74128)) b!646121))

(assert (= (and b!646121 c!74127) b!646124))

(assert (= (and b!646121 (not c!74127)) b!646120))

(declare-fun m!619645 () Bool)

(assert (=> b!646120 m!619645))

(declare-fun m!619647 () Bool)

(assert (=> b!646123 m!619647))

(declare-fun m!619649 () Bool)

(assert (=> d!91349 m!619649))

(declare-fun m!619651 () Bool)

(assert (=> d!91349 m!619651))

(declare-fun m!619653 () Bool)

(assert (=> d!91349 m!619653))

(declare-fun m!619655 () Bool)

(assert (=> d!91349 m!619655))

(assert (=> d!91349 m!619205))

(assert (=> d!91349 m!619649))

(declare-fun m!619657 () Bool)

(assert (=> d!91349 m!619657))

(assert (=> b!645661 d!91349))

(declare-fun b!646133 () Bool)

(declare-fun e!370350 () Bool)

(declare-fun e!370349 () Bool)

(assert (=> b!646133 (= e!370350 e!370349)))

(declare-fun c!74132 () Bool)

(assert (=> b!646133 (= c!74132 (validKeyInArray!0 (select (arr!18444 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!646134 () Bool)

(declare-fun e!370348 () Bool)

(assert (=> b!646134 (= e!370349 e!370348)))

(declare-fun lt!299695 () (_ BitVec 64))

(assert (=> b!646134 (= lt!299695 (select (arr!18444 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!299693 () Unit!21930)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38464 (_ BitVec 64) (_ BitVec 32)) Unit!21930)

(assert (=> b!646134 (= lt!299693 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!299695 #b00000000000000000000000000000000))))

(assert (=> b!646134 (arrayContainsKey!0 a!2986 lt!299695 #b00000000000000000000000000000000)))

(declare-fun lt!299694 () Unit!21930)

(assert (=> b!646134 (= lt!299694 lt!299693)))

(declare-fun res!418604 () Bool)

(assert (=> b!646134 (= res!418604 (= (seekEntryOrOpen!0 (select (arr!18444 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6884 #b00000000000000000000000000000000)))))

(assert (=> b!646134 (=> (not res!418604) (not e!370348))))

(declare-fun b!646135 () Bool)

(declare-fun call!33656 () Bool)

(assert (=> b!646135 (= e!370348 call!33656)))

(declare-fun d!91365 () Bool)

(declare-fun res!418603 () Bool)

(assert (=> d!91365 (=> res!418603 e!370350)))

(assert (=> d!91365 (= res!418603 (bvsge #b00000000000000000000000000000000 (size!18808 a!2986)))))

(assert (=> d!91365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!370350)))

(declare-fun b!646136 () Bool)

(assert (=> b!646136 (= e!370349 call!33656)))

(declare-fun bm!33653 () Bool)

(assert (=> bm!33653 (= call!33656 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!91365 (not res!418603)) b!646133))

(assert (= (and b!646133 c!74132) b!646134))

(assert (= (and b!646133 (not c!74132)) b!646136))

(assert (= (and b!646134 res!418604) b!646135))

(assert (= (or b!646135 b!646136) bm!33653))

(assert (=> b!646133 m!619391))

(assert (=> b!646133 m!619391))

(assert (=> b!646133 m!619393))

(assert (=> b!646134 m!619391))

(declare-fun m!619659 () Bool)

(assert (=> b!646134 m!619659))

(declare-fun m!619661 () Bool)

(assert (=> b!646134 m!619661))

(assert (=> b!646134 m!619391))

(declare-fun m!619663 () Bool)

(assert (=> b!646134 m!619663))

(declare-fun m!619665 () Bool)

(assert (=> bm!33653 m!619665))

(assert (=> b!645650 d!91365))

(push 1)

