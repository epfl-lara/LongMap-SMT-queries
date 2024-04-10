; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56198 () Bool)

(assert start!56198)

(declare-fun b!622641 () Bool)

(assert (=> b!622641 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20928 0))(
  ( (Unit!20929) )
))
(declare-fun lt!288564 () Unit!20928)

(declare-datatypes ((array!37668 0))(
  ( (array!37669 (arr!18080 (Array (_ BitVec 32) (_ BitVec 64))) (size!18444 (_ BitVec 32))) )
))
(declare-fun lt!288565 () array!37668)

(declare-fun a!2986 () array!37668)

(declare-datatypes ((List!12121 0))(
  ( (Nil!12118) (Cons!12117 (h!13162 (_ BitVec 64)) (t!18349 List!12121)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37668 (_ BitVec 64) (_ BitVec 32) List!12121) Unit!20928)

(assert (=> b!622641 (= lt!288564 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288565 (select (arr!18080 a!2986) j!136) j!136 Nil!12118))))

(declare-fun arrayNoDuplicates!0 (array!37668 (_ BitVec 32) List!12121) Bool)

(assert (=> b!622641 (arrayNoDuplicates!0 lt!288565 j!136 Nil!12118)))

(declare-fun lt!288571 () Unit!20928)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37668 (_ BitVec 32) (_ BitVec 32)) Unit!20928)

(assert (=> b!622641 (= lt!288571 (lemmaNoDuplicateFromThenFromBigger!0 lt!288565 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622641 (arrayNoDuplicates!0 lt!288565 #b00000000000000000000000000000000 Nil!12118)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!288566 () Unit!20928)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12121) Unit!20928)

(assert (=> b!622641 (= lt!288566 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12118))))

(declare-fun arrayContainsKey!0 (array!37668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622641 (arrayContainsKey!0 lt!288565 (select (arr!18080 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288577 () Unit!20928)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20928)

(assert (=> b!622641 (= lt!288577 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288565 (select (arr!18080 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357143 () Unit!20928)

(declare-fun Unit!20930 () Unit!20928)

(assert (=> b!622641 (= e!357143 Unit!20930)))

(declare-fun b!622642 () Bool)

(declare-fun Unit!20931 () Unit!20928)

(assert (=> b!622642 (= e!357143 Unit!20931)))

(declare-fun b!622643 () Bool)

(declare-fun e!357136 () Unit!20928)

(declare-fun Unit!20932 () Unit!20928)

(assert (=> b!622643 (= e!357136 Unit!20932)))

(assert (=> b!622643 false))

(declare-fun b!622644 () Bool)

(declare-fun e!357135 () Bool)

(declare-datatypes ((SeekEntryResult!6520 0))(
  ( (MissingZero!6520 (index!28364 (_ BitVec 32))) (Found!6520 (index!28365 (_ BitVec 32))) (Intermediate!6520 (undefined!7332 Bool) (index!28366 (_ BitVec 32)) (x!57128 (_ BitVec 32))) (Undefined!6520) (MissingVacant!6520 (index!28367 (_ BitVec 32))) )
))
(declare-fun lt!288559 () SeekEntryResult!6520)

(declare-fun lt!288561 () SeekEntryResult!6520)

(assert (=> b!622644 (= e!357135 (= lt!288559 lt!288561))))

(declare-fun e!357133 () Bool)

(declare-fun b!622645 () Bool)

(assert (=> b!622645 (= e!357133 (arrayContainsKey!0 lt!288565 (select (arr!18080 a!2986) j!136) index!984))))

(declare-fun b!622646 () Bool)

(declare-fun Unit!20933 () Unit!20928)

(assert (=> b!622646 (= e!357136 Unit!20933)))

(declare-fun b!622647 () Bool)

(declare-fun res!401268 () Bool)

(declare-fun e!357140 () Bool)

(assert (=> b!622647 (=> (not res!401268) (not e!357140))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37668 (_ BitVec 32)) Bool)

(assert (=> b!622647 (= res!401268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!357137 () Bool)

(declare-fun b!622648 () Bool)

(assert (=> b!622648 (= e!357137 (arrayContainsKey!0 lt!288565 (select (arr!18080 a!2986) j!136) index!984))))

(declare-fun b!622650 () Bool)

(declare-fun res!401273 () Bool)

(assert (=> b!622650 (= res!401273 (arrayContainsKey!0 lt!288565 (select (arr!18080 a!2986) j!136) j!136))))

(assert (=> b!622650 (=> (not res!401273) (not e!357137))))

(declare-fun e!357139 () Bool)

(assert (=> b!622650 (= e!357139 e!357137)))

(declare-fun b!622651 () Bool)

(assert (=> b!622651 false))

(declare-fun lt!288572 () Unit!20928)

(assert (=> b!622651 (= lt!288572 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288565 (select (arr!18080 a!2986) j!136) index!984 Nil!12118))))

(assert (=> b!622651 (arrayNoDuplicates!0 lt!288565 index!984 Nil!12118)))

(declare-fun lt!288562 () Unit!20928)

(assert (=> b!622651 (= lt!288562 (lemmaNoDuplicateFromThenFromBigger!0 lt!288565 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622651 (arrayNoDuplicates!0 lt!288565 #b00000000000000000000000000000000 Nil!12118)))

(declare-fun lt!288569 () Unit!20928)

(assert (=> b!622651 (= lt!288569 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12118))))

(assert (=> b!622651 (arrayContainsKey!0 lt!288565 (select (arr!18080 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288573 () Unit!20928)

(assert (=> b!622651 (= lt!288573 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288565 (select (arr!18080 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622651 e!357133))

(declare-fun res!401281 () Bool)

(assert (=> b!622651 (=> (not res!401281) (not e!357133))))

(assert (=> b!622651 (= res!401281 (arrayContainsKey!0 lt!288565 (select (arr!18080 a!2986) j!136) j!136))))

(declare-fun e!357132 () Unit!20928)

(declare-fun Unit!20934 () Unit!20928)

(assert (=> b!622651 (= e!357132 Unit!20934)))

(declare-fun b!622652 () Bool)

(declare-fun res!401277 () Bool)

(declare-fun e!357144 () Bool)

(assert (=> b!622652 (=> (not res!401277) (not e!357144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622652 (= res!401277 (validKeyInArray!0 (select (arr!18080 a!2986) j!136)))))

(declare-fun b!622653 () Bool)

(declare-fun res!401270 () Bool)

(assert (=> b!622653 (=> (not res!401270) (not e!357144))))

(assert (=> b!622653 (= res!401270 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622654 () Bool)

(declare-fun e!357141 () Unit!20928)

(declare-fun Unit!20935 () Unit!20928)

(assert (=> b!622654 (= e!357141 Unit!20935)))

(declare-fun b!622655 () Bool)

(declare-fun Unit!20936 () Unit!20928)

(assert (=> b!622655 (= e!357141 Unit!20936)))

(declare-fun res!401274 () Bool)

(assert (=> b!622655 (= res!401274 (= (select (store (arr!18080 a!2986) i!1108 k!1786) index!984) (select (arr!18080 a!2986) j!136)))))

(declare-fun e!357142 () Bool)

(assert (=> b!622655 (=> (not res!401274) (not e!357142))))

(assert (=> b!622655 e!357142))

(declare-fun c!71054 () Bool)

(assert (=> b!622655 (= c!71054 (bvslt j!136 index!984))))

(declare-fun lt!288558 () Unit!20928)

(assert (=> b!622655 (= lt!288558 e!357143)))

(declare-fun c!71055 () Bool)

(assert (=> b!622655 (= c!71055 (bvslt index!984 j!136))))

(declare-fun lt!288567 () Unit!20928)

(assert (=> b!622655 (= lt!288567 e!357132)))

(assert (=> b!622655 false))

(declare-fun b!622656 () Bool)

(declare-fun Unit!20937 () Unit!20928)

(assert (=> b!622656 (= e!357132 Unit!20937)))

(declare-fun b!622657 () Bool)

(declare-fun e!357138 () Bool)

(assert (=> b!622657 (= e!357138 (not true))))

(declare-fun lt!288560 () Unit!20928)

(assert (=> b!622657 (= lt!288560 e!357141)))

(declare-fun c!71056 () Bool)

(declare-fun lt!288563 () SeekEntryResult!6520)

(assert (=> b!622657 (= c!71056 (= lt!288563 (Found!6520 index!984)))))

(declare-fun lt!288568 () Unit!20928)

(assert (=> b!622657 (= lt!288568 e!357136)))

(declare-fun c!71057 () Bool)

(assert (=> b!622657 (= c!71057 (= lt!288563 Undefined!6520))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!288574 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37668 (_ BitVec 32)) SeekEntryResult!6520)

(assert (=> b!622657 (= lt!288563 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288574 lt!288565 mask!3053))))

(assert (=> b!622657 e!357135))

(declare-fun res!401279 () Bool)

(assert (=> b!622657 (=> (not res!401279) (not e!357135))))

(declare-fun lt!288576 () (_ BitVec 32))

(assert (=> b!622657 (= res!401279 (= lt!288561 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288576 vacantSpotIndex!68 lt!288574 lt!288565 mask!3053)))))

(assert (=> b!622657 (= lt!288561 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288576 vacantSpotIndex!68 (select (arr!18080 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622657 (= lt!288574 (select (store (arr!18080 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288570 () Unit!20928)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37668 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20928)

(assert (=> b!622657 (= lt!288570 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288576 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622657 (= lt!288576 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622658 () Bool)

(declare-fun e!357131 () Bool)

(assert (=> b!622658 (= e!357131 e!357138)))

(declare-fun res!401276 () Bool)

(assert (=> b!622658 (=> (not res!401276) (not e!357138))))

(assert (=> b!622658 (= res!401276 (and (= lt!288559 (Found!6520 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18080 a!2986) index!984) (select (arr!18080 a!2986) j!136))) (not (= (select (arr!18080 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622658 (= lt!288559 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18080 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622659 () Bool)

(assert (=> b!622659 (= e!357144 e!357140)))

(declare-fun res!401278 () Bool)

(assert (=> b!622659 (=> (not res!401278) (not e!357140))))

(declare-fun lt!288575 () SeekEntryResult!6520)

(assert (=> b!622659 (= res!401278 (or (= lt!288575 (MissingZero!6520 i!1108)) (= lt!288575 (MissingVacant!6520 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37668 (_ BitVec 32)) SeekEntryResult!6520)

(assert (=> b!622659 (= lt!288575 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!622660 () Bool)

(declare-fun res!401272 () Bool)

(assert (=> b!622660 (=> (not res!401272) (not e!357144))))

(assert (=> b!622660 (= res!401272 (and (= (size!18444 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18444 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18444 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622661 () Bool)

(declare-fun res!401275 () Bool)

(assert (=> b!622661 (=> (not res!401275) (not e!357140))))

(assert (=> b!622661 (= res!401275 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12118))))

(declare-fun b!622662 () Bool)

(assert (=> b!622662 (= e!357140 e!357131)))

(declare-fun res!401271 () Bool)

(assert (=> b!622662 (=> (not res!401271) (not e!357131))))

(assert (=> b!622662 (= res!401271 (= (select (store (arr!18080 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622662 (= lt!288565 (array!37669 (store (arr!18080 a!2986) i!1108 k!1786) (size!18444 a!2986)))))

(declare-fun b!622649 () Bool)

(declare-fun res!401280 () Bool)

(assert (=> b!622649 (=> (not res!401280) (not e!357140))))

(assert (=> b!622649 (= res!401280 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18080 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!401267 () Bool)

(assert (=> start!56198 (=> (not res!401267) (not e!357144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56198 (= res!401267 (validMask!0 mask!3053))))

(assert (=> start!56198 e!357144))

(assert (=> start!56198 true))

(declare-fun array_inv!13876 (array!37668) Bool)

(assert (=> start!56198 (array_inv!13876 a!2986)))

(declare-fun b!622663 () Bool)

(declare-fun res!401282 () Bool)

(assert (=> b!622663 (= res!401282 (bvsge j!136 index!984))))

(assert (=> b!622663 (=> res!401282 e!357139)))

(assert (=> b!622663 (= e!357142 e!357139)))

(declare-fun b!622664 () Bool)

(declare-fun res!401269 () Bool)

(assert (=> b!622664 (=> (not res!401269) (not e!357144))))

(assert (=> b!622664 (= res!401269 (validKeyInArray!0 k!1786))))

(assert (= (and start!56198 res!401267) b!622660))

(assert (= (and b!622660 res!401272) b!622652))

(assert (= (and b!622652 res!401277) b!622664))

(assert (= (and b!622664 res!401269) b!622653))

(assert (= (and b!622653 res!401270) b!622659))

(assert (= (and b!622659 res!401278) b!622647))

(assert (= (and b!622647 res!401268) b!622661))

(assert (= (and b!622661 res!401275) b!622649))

(assert (= (and b!622649 res!401280) b!622662))

(assert (= (and b!622662 res!401271) b!622658))

(assert (= (and b!622658 res!401276) b!622657))

(assert (= (and b!622657 res!401279) b!622644))

(assert (= (and b!622657 c!71057) b!622643))

(assert (= (and b!622657 (not c!71057)) b!622646))

(assert (= (and b!622657 c!71056) b!622655))

(assert (= (and b!622657 (not c!71056)) b!622654))

(assert (= (and b!622655 res!401274) b!622663))

(assert (= (and b!622663 (not res!401282)) b!622650))

(assert (= (and b!622650 res!401273) b!622648))

(assert (= (and b!622655 c!71054) b!622641))

(assert (= (and b!622655 (not c!71054)) b!622642))

(assert (= (and b!622655 c!71055) b!622651))

(assert (= (and b!622655 (not c!71055)) b!622656))

(assert (= (and b!622651 res!401281) b!622645))

(declare-fun m!598501 () Bool)

(assert (=> b!622659 m!598501))

(declare-fun m!598503 () Bool)

(assert (=> b!622661 m!598503))

(declare-fun m!598505 () Bool)

(assert (=> b!622655 m!598505))

(declare-fun m!598507 () Bool)

(assert (=> b!622655 m!598507))

(declare-fun m!598509 () Bool)

(assert (=> b!622655 m!598509))

(assert (=> b!622645 m!598509))

(assert (=> b!622645 m!598509))

(declare-fun m!598511 () Bool)

(assert (=> b!622645 m!598511))

(declare-fun m!598513 () Bool)

(assert (=> b!622647 m!598513))

(declare-fun m!598515 () Bool)

(assert (=> b!622649 m!598515))

(assert (=> b!622650 m!598509))

(assert (=> b!622650 m!598509))

(declare-fun m!598517 () Bool)

(assert (=> b!622650 m!598517))

(declare-fun m!598519 () Bool)

(assert (=> b!622653 m!598519))

(assert (=> b!622652 m!598509))

(assert (=> b!622652 m!598509))

(declare-fun m!598521 () Bool)

(assert (=> b!622652 m!598521))

(assert (=> b!622651 m!598509))

(assert (=> b!622651 m!598517))

(assert (=> b!622651 m!598509))

(declare-fun m!598523 () Bool)

(assert (=> b!622651 m!598523))

(assert (=> b!622651 m!598509))

(declare-fun m!598525 () Bool)

(assert (=> b!622651 m!598525))

(assert (=> b!622651 m!598509))

(declare-fun m!598527 () Bool)

(assert (=> b!622651 m!598527))

(declare-fun m!598529 () Bool)

(assert (=> b!622651 m!598529))

(assert (=> b!622651 m!598509))

(declare-fun m!598531 () Bool)

(assert (=> b!622651 m!598531))

(declare-fun m!598533 () Bool)

(assert (=> b!622651 m!598533))

(declare-fun m!598535 () Bool)

(assert (=> b!622651 m!598535))

(declare-fun m!598537 () Bool)

(assert (=> b!622658 m!598537))

(assert (=> b!622658 m!598509))

(assert (=> b!622658 m!598509))

(declare-fun m!598539 () Bool)

(assert (=> b!622658 m!598539))

(assert (=> b!622641 m!598509))

(assert (=> b!622641 m!598509))

(declare-fun m!598541 () Bool)

(assert (=> b!622641 m!598541))

(assert (=> b!622641 m!598535))

(assert (=> b!622641 m!598509))

(declare-fun m!598543 () Bool)

(assert (=> b!622641 m!598543))

(assert (=> b!622641 m!598509))

(declare-fun m!598545 () Bool)

(assert (=> b!622641 m!598545))

(assert (=> b!622641 m!598529))

(declare-fun m!598547 () Bool)

(assert (=> b!622641 m!598547))

(declare-fun m!598549 () Bool)

(assert (=> b!622641 m!598549))

(assert (=> b!622662 m!598505))

(declare-fun m!598551 () Bool)

(assert (=> b!622662 m!598551))

(declare-fun m!598553 () Bool)

(assert (=> b!622657 m!598553))

(declare-fun m!598555 () Bool)

(assert (=> b!622657 m!598555))

(declare-fun m!598557 () Bool)

(assert (=> b!622657 m!598557))

(assert (=> b!622657 m!598509))

(declare-fun m!598559 () Bool)

(assert (=> b!622657 m!598559))

(assert (=> b!622657 m!598505))

(assert (=> b!622657 m!598509))

(declare-fun m!598561 () Bool)

(assert (=> b!622657 m!598561))

(declare-fun m!598563 () Bool)

(assert (=> b!622657 m!598563))

(declare-fun m!598565 () Bool)

(assert (=> b!622664 m!598565))

(declare-fun m!598567 () Bool)

(assert (=> start!56198 m!598567))

(declare-fun m!598569 () Bool)

(assert (=> start!56198 m!598569))

(assert (=> b!622648 m!598509))

(assert (=> b!622648 m!598509))

(assert (=> b!622648 m!598511))

(push 1)

