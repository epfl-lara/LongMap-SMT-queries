; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57250 () Bool)

(assert start!57250)

(declare-fun b!633486 () Bool)

(declare-fun e!362218 () Bool)

(declare-fun e!362219 () Bool)

(assert (=> b!633486 (= e!362218 e!362219)))

(declare-fun res!409639 () Bool)

(assert (=> b!633486 (=> (not res!409639) (not e!362219))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38160 0))(
  ( (array!38161 (arr!18310 (Array (_ BitVec 32) (_ BitVec 64))) (size!18674 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38160)

(assert (=> b!633486 (= res!409639 (= (select (store (arr!18310 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292796 () array!38160)

(assert (=> b!633486 (= lt!292796 (array!38161 (store (arr!18310 a!2986) i!1108 k0!1786) (size!18674 a!2986)))))

(declare-fun b!633487 () Bool)

(declare-fun res!409642 () Bool)

(assert (=> b!633487 (=> (not res!409642) (not e!362218))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38160 (_ BitVec 32)) Bool)

(assert (=> b!633487 (= res!409642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633488 () Bool)

(declare-fun res!409635 () Bool)

(declare-fun e!362215 () Bool)

(assert (=> b!633488 (=> (not res!409635) (not e!362215))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!633488 (= res!409635 (and (= (size!18674 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18674 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18674 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633489 () Bool)

(declare-fun e!362217 () Bool)

(declare-datatypes ((SeekEntryResult!6750 0))(
  ( (MissingZero!6750 (index!29299 (_ BitVec 32))) (Found!6750 (index!29300 (_ BitVec 32))) (Intermediate!6750 (undefined!7562 Bool) (index!29301 (_ BitVec 32)) (x!58043 (_ BitVec 32))) (Undefined!6750) (MissingVacant!6750 (index!29302 (_ BitVec 32))) )
))
(declare-fun lt!292795 () SeekEntryResult!6750)

(declare-fun lt!292799 () SeekEntryResult!6750)

(assert (=> b!633489 (= e!362217 (= lt!292795 lt!292799))))

(declare-fun b!633490 () Bool)

(assert (=> b!633490 (= e!362215 e!362218)))

(declare-fun res!409637 () Bool)

(assert (=> b!633490 (=> (not res!409637) (not e!362218))))

(declare-fun lt!292793 () SeekEntryResult!6750)

(assert (=> b!633490 (= res!409637 (or (= lt!292793 (MissingZero!6750 i!1108)) (= lt!292793 (MissingVacant!6750 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38160 (_ BitVec 32)) SeekEntryResult!6750)

(assert (=> b!633490 (= lt!292793 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!633491 () Bool)

(declare-fun e!362213 () Bool)

(assert (=> b!633491 (= e!362219 e!362213)))

(declare-fun res!409648 () Bool)

(assert (=> b!633491 (=> (not res!409648) (not e!362213))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633491 (= res!409648 (and (= lt!292795 (Found!6750 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18310 a!2986) index!984) (select (arr!18310 a!2986) j!136))) (not (= (select (arr!18310 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38160 (_ BitVec 32)) SeekEntryResult!6750)

(assert (=> b!633491 (= lt!292795 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18310 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633492 () Bool)

(declare-fun res!409646 () Bool)

(assert (=> b!633492 (=> (not res!409646) (not e!362215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633492 (= res!409646 (validKeyInArray!0 k0!1786))))

(declare-fun e!362212 () Bool)

(declare-fun b!633493 () Bool)

(declare-fun arrayContainsKey!0 (array!38160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633493 (= e!362212 (arrayContainsKey!0 lt!292796 (select (arr!18310 a!2986) j!136) index!984))))

(declare-fun b!633494 () Bool)

(declare-datatypes ((Unit!21334 0))(
  ( (Unit!21335) )
))
(declare-fun e!362214 () Unit!21334)

(declare-fun Unit!21336 () Unit!21334)

(assert (=> b!633494 (= e!362214 Unit!21336)))

(assert (=> b!633494 false))

(declare-fun b!633495 () Bool)

(declare-fun e!362220 () Bool)

(declare-fun e!362216 () Bool)

(assert (=> b!633495 (= e!362220 e!362216)))

(declare-fun res!409636 () Bool)

(assert (=> b!633495 (=> res!409636 e!362216)))

(declare-fun lt!292801 () (_ BitVec 64))

(declare-fun lt!292794 () (_ BitVec 64))

(assert (=> b!633495 (= res!409636 (or (not (= (select (arr!18310 a!2986) j!136) lt!292794)) (not (= (select (arr!18310 a!2986) j!136) lt!292801)) (bvsge j!136 index!984)))))

(declare-fun b!633496 () Bool)

(declare-fun Unit!21337 () Unit!21334)

(assert (=> b!633496 (= e!362214 Unit!21337)))

(declare-fun b!633497 () Bool)

(declare-fun res!409649 () Bool)

(assert (=> b!633497 (=> (not res!409649) (not e!362215))))

(assert (=> b!633497 (= res!409649 (validKeyInArray!0 (select (arr!18310 a!2986) j!136)))))

(declare-fun b!633498 () Bool)

(assert (=> b!633498 (= e!362216 e!362212)))

(declare-fun res!409640 () Bool)

(assert (=> b!633498 (=> (not res!409640) (not e!362212))))

(assert (=> b!633498 (= res!409640 (arrayContainsKey!0 lt!292796 (select (arr!18310 a!2986) j!136) j!136))))

(declare-fun res!409641 () Bool)

(assert (=> start!57250 (=> (not res!409641) (not e!362215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57250 (= res!409641 (validMask!0 mask!3053))))

(assert (=> start!57250 e!362215))

(assert (=> start!57250 true))

(declare-fun array_inv!14106 (array!38160) Bool)

(assert (=> start!57250 (array_inv!14106 a!2986)))

(declare-fun b!633499 () Bool)

(declare-fun res!409647 () Bool)

(assert (=> b!633499 (=> (not res!409647) (not e!362218))))

(declare-datatypes ((List!12351 0))(
  ( (Nil!12348) (Cons!12347 (h!13392 (_ BitVec 64)) (t!18579 List!12351)) )
))
(declare-fun arrayNoDuplicates!0 (array!38160 (_ BitVec 32) List!12351) Bool)

(assert (=> b!633499 (= res!409647 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12348))))

(declare-fun b!633500 () Bool)

(declare-fun res!409634 () Bool)

(assert (=> b!633500 (=> (not res!409634) (not e!362215))))

(assert (=> b!633500 (= res!409634 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633501 () Bool)

(declare-fun res!409645 () Bool)

(assert (=> b!633501 (=> (not res!409645) (not e!362218))))

(assert (=> b!633501 (= res!409645 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18310 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633502 () Bool)

(declare-fun e!362211 () Bool)

(assert (=> b!633502 (= e!362211 true)))

(assert (=> b!633502 e!362220))

(declare-fun res!409643 () Bool)

(assert (=> b!633502 (=> (not res!409643) (not e!362220))))

(assert (=> b!633502 (= res!409643 (= lt!292801 (select (arr!18310 a!2986) j!136)))))

(assert (=> b!633502 (= lt!292801 (select (store (arr!18310 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633503 () Bool)

(assert (=> b!633503 (= e!362213 (not e!362211))))

(declare-fun res!409644 () Bool)

(assert (=> b!633503 (=> res!409644 e!362211)))

(declare-fun lt!292792 () SeekEntryResult!6750)

(assert (=> b!633503 (= res!409644 (not (= lt!292792 (Found!6750 index!984))))))

(declare-fun lt!292798 () Unit!21334)

(assert (=> b!633503 (= lt!292798 e!362214)))

(declare-fun c!72293 () Bool)

(assert (=> b!633503 (= c!72293 (= lt!292792 Undefined!6750))))

(assert (=> b!633503 (= lt!292792 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292794 lt!292796 mask!3053))))

(assert (=> b!633503 e!362217))

(declare-fun res!409638 () Bool)

(assert (=> b!633503 (=> (not res!409638) (not e!362217))))

(declare-fun lt!292797 () (_ BitVec 32))

(assert (=> b!633503 (= res!409638 (= lt!292799 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292797 vacantSpotIndex!68 lt!292794 lt!292796 mask!3053)))))

(assert (=> b!633503 (= lt!292799 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292797 vacantSpotIndex!68 (select (arr!18310 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633503 (= lt!292794 (select (store (arr!18310 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292800 () Unit!21334)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38160 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21334)

(assert (=> b!633503 (= lt!292800 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292797 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633503 (= lt!292797 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!57250 res!409641) b!633488))

(assert (= (and b!633488 res!409635) b!633497))

(assert (= (and b!633497 res!409649) b!633492))

(assert (= (and b!633492 res!409646) b!633500))

(assert (= (and b!633500 res!409634) b!633490))

(assert (= (and b!633490 res!409637) b!633487))

(assert (= (and b!633487 res!409642) b!633499))

(assert (= (and b!633499 res!409647) b!633501))

(assert (= (and b!633501 res!409645) b!633486))

(assert (= (and b!633486 res!409639) b!633491))

(assert (= (and b!633491 res!409648) b!633503))

(assert (= (and b!633503 res!409638) b!633489))

(assert (= (and b!633503 c!72293) b!633494))

(assert (= (and b!633503 (not c!72293)) b!633496))

(assert (= (and b!633503 (not res!409644)) b!633502))

(assert (= (and b!633502 res!409643) b!633495))

(assert (= (and b!633495 (not res!409636)) b!633498))

(assert (= (and b!633498 res!409640) b!633493))

(declare-fun m!608133 () Bool)

(assert (=> b!633501 m!608133))

(declare-fun m!608135 () Bool)

(assert (=> b!633503 m!608135))

(declare-fun m!608137 () Bool)

(assert (=> b!633503 m!608137))

(declare-fun m!608139 () Bool)

(assert (=> b!633503 m!608139))

(declare-fun m!608141 () Bool)

(assert (=> b!633503 m!608141))

(assert (=> b!633503 m!608137))

(declare-fun m!608143 () Bool)

(assert (=> b!633503 m!608143))

(declare-fun m!608145 () Bool)

(assert (=> b!633503 m!608145))

(declare-fun m!608147 () Bool)

(assert (=> b!633503 m!608147))

(declare-fun m!608149 () Bool)

(assert (=> b!633503 m!608149))

(assert (=> b!633497 m!608137))

(assert (=> b!633497 m!608137))

(declare-fun m!608151 () Bool)

(assert (=> b!633497 m!608151))

(declare-fun m!608153 () Bool)

(assert (=> b!633491 m!608153))

(assert (=> b!633491 m!608137))

(assert (=> b!633491 m!608137))

(declare-fun m!608155 () Bool)

(assert (=> b!633491 m!608155))

(declare-fun m!608157 () Bool)

(assert (=> b!633500 m!608157))

(assert (=> b!633498 m!608137))

(assert (=> b!633498 m!608137))

(declare-fun m!608159 () Bool)

(assert (=> b!633498 m!608159))

(declare-fun m!608161 () Bool)

(assert (=> b!633490 m!608161))

(assert (=> b!633486 m!608139))

(declare-fun m!608163 () Bool)

(assert (=> b!633486 m!608163))

(declare-fun m!608165 () Bool)

(assert (=> b!633487 m!608165))

(declare-fun m!608167 () Bool)

(assert (=> start!57250 m!608167))

(declare-fun m!608169 () Bool)

(assert (=> start!57250 m!608169))

(assert (=> b!633495 m!608137))

(assert (=> b!633493 m!608137))

(assert (=> b!633493 m!608137))

(declare-fun m!608171 () Bool)

(assert (=> b!633493 m!608171))

(declare-fun m!608173 () Bool)

(assert (=> b!633492 m!608173))

(declare-fun m!608175 () Bool)

(assert (=> b!633499 m!608175))

(assert (=> b!633502 m!608137))

(assert (=> b!633502 m!608139))

(declare-fun m!608177 () Bool)

(assert (=> b!633502 m!608177))

(check-sat (not b!633492) (not b!633487) (not b!633498) (not start!57250) (not b!633503) (not b!633500) (not b!633493) (not b!633490) (not b!633499) (not b!633497) (not b!633491))
(check-sat)
