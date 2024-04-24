; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57156 () Bool)

(assert start!57156)

(declare-fun b!632381 () Bool)

(declare-fun e!361562 () Bool)

(declare-datatypes ((SeekEntryResult!6685 0))(
  ( (MissingZero!6685 (index!29033 (_ BitVec 32))) (Found!6685 (index!29034 (_ BitVec 32))) (Intermediate!6685 (undefined!7497 Bool) (index!29035 (_ BitVec 32)) (x!57923 (_ BitVec 32))) (Undefined!6685) (MissingVacant!6685 (index!29036 (_ BitVec 32))) )
))
(declare-fun lt!292232 () SeekEntryResult!6685)

(declare-fun lt!292236 () SeekEntryResult!6685)

(assert (=> b!632381 (= e!361562 (= lt!292232 lt!292236))))

(declare-fun b!632382 () Bool)

(declare-fun res!408916 () Bool)

(declare-fun e!361560 () Bool)

(assert (=> b!632382 (=> (not res!408916) (not e!361560))))

(declare-datatypes ((array!38118 0))(
  ( (array!38119 (arr!18289 (Array (_ BitVec 32) (_ BitVec 64))) (size!18653 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38118)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632382 (= res!408916 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632383 () Bool)

(declare-fun res!408910 () Bool)

(declare-fun e!361561 () Bool)

(assert (=> b!632383 (=> (not res!408910) (not e!361561))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632383 (= res!408910 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18289 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632384 () Bool)

(declare-fun res!408915 () Bool)

(assert (=> b!632384 (=> (not res!408915) (not e!361560))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632384 (= res!408915 (and (= (size!18653 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18653 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18653 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!408913 () Bool)

(assert (=> start!57156 (=> (not res!408913) (not e!361560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57156 (= res!408913 (validMask!0 mask!3053))))

(assert (=> start!57156 e!361560))

(assert (=> start!57156 true))

(declare-fun array_inv!14148 (array!38118) Bool)

(assert (=> start!57156 (array_inv!14148 a!2986)))

(declare-fun b!632385 () Bool)

(declare-fun e!361558 () Bool)

(declare-fun e!361556 () Bool)

(assert (=> b!632385 (= e!361558 e!361556)))

(declare-fun res!408920 () Bool)

(assert (=> b!632385 (=> (not res!408920) (not e!361556))))

(assert (=> b!632385 (= res!408920 (and (= lt!292232 (Found!6685 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18289 a!2986) index!984) (select (arr!18289 a!2986) j!136))) (not (= (select (arr!18289 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38118 (_ BitVec 32)) SeekEntryResult!6685)

(assert (=> b!632385 (= lt!292232 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18289 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632386 () Bool)

(declare-datatypes ((Unit!21249 0))(
  ( (Unit!21250) )
))
(declare-fun e!361563 () Unit!21249)

(declare-fun Unit!21251 () Unit!21249)

(assert (=> b!632386 (= e!361563 Unit!21251)))

(assert (=> b!632386 false))

(declare-fun b!632387 () Bool)

(assert (=> b!632387 (= e!361560 e!361561)))

(declare-fun res!408912 () Bool)

(assert (=> b!632387 (=> (not res!408912) (not e!361561))))

(declare-fun lt!292233 () SeekEntryResult!6685)

(assert (=> b!632387 (= res!408912 (or (= lt!292233 (MissingZero!6685 i!1108)) (= lt!292233 (MissingVacant!6685 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38118 (_ BitVec 32)) SeekEntryResult!6685)

(assert (=> b!632387 (= lt!292233 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632388 () Bool)

(declare-fun res!408917 () Bool)

(assert (=> b!632388 (=> (not res!408917) (not e!361561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38118 (_ BitVec 32)) Bool)

(assert (=> b!632388 (= res!408917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632389 () Bool)

(declare-fun e!361559 () Bool)

(assert (=> b!632389 (= e!361559 true)))

(assert (=> b!632389 (= (select (store (arr!18289 a!2986) i!1108 k0!1786) index!984) (select (arr!18289 a!2986) j!136))))

(declare-fun b!632390 () Bool)

(declare-fun res!408921 () Bool)

(assert (=> b!632390 (=> (not res!408921) (not e!361560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632390 (= res!408921 (validKeyInArray!0 (select (arr!18289 a!2986) j!136)))))

(declare-fun b!632391 () Bool)

(assert (=> b!632391 (= e!361561 e!361558)))

(declare-fun res!408918 () Bool)

(assert (=> b!632391 (=> (not res!408918) (not e!361558))))

(assert (=> b!632391 (= res!408918 (= (select (store (arr!18289 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292235 () array!38118)

(assert (=> b!632391 (= lt!292235 (array!38119 (store (arr!18289 a!2986) i!1108 k0!1786) (size!18653 a!2986)))))

(declare-fun b!632392 () Bool)

(declare-fun Unit!21252 () Unit!21249)

(assert (=> b!632392 (= e!361563 Unit!21252)))

(declare-fun b!632393 () Bool)

(assert (=> b!632393 (= e!361556 (not e!361559))))

(declare-fun res!408914 () Bool)

(assert (=> b!632393 (=> res!408914 e!361559)))

(declare-fun lt!292238 () SeekEntryResult!6685)

(assert (=> b!632393 (= res!408914 (not (= lt!292238 (Found!6685 index!984))))))

(declare-fun lt!292237 () Unit!21249)

(assert (=> b!632393 (= lt!292237 e!361563)))

(declare-fun c!72104 () Bool)

(assert (=> b!632393 (= c!72104 (= lt!292238 Undefined!6685))))

(declare-fun lt!292239 () (_ BitVec 64))

(assert (=> b!632393 (= lt!292238 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292239 lt!292235 mask!3053))))

(assert (=> b!632393 e!361562))

(declare-fun res!408922 () Bool)

(assert (=> b!632393 (=> (not res!408922) (not e!361562))))

(declare-fun lt!292240 () (_ BitVec 32))

(assert (=> b!632393 (= res!408922 (= lt!292236 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292240 vacantSpotIndex!68 lt!292239 lt!292235 mask!3053)))))

(assert (=> b!632393 (= lt!292236 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292240 vacantSpotIndex!68 (select (arr!18289 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632393 (= lt!292239 (select (store (arr!18289 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292234 () Unit!21249)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38118 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21249)

(assert (=> b!632393 (= lt!292234 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292240 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632393 (= lt!292240 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!632394 () Bool)

(declare-fun res!408911 () Bool)

(assert (=> b!632394 (=> (not res!408911) (not e!361560))))

(assert (=> b!632394 (= res!408911 (validKeyInArray!0 k0!1786))))

(declare-fun b!632395 () Bool)

(declare-fun res!408919 () Bool)

(assert (=> b!632395 (=> (not res!408919) (not e!361561))))

(declare-datatypes ((List!12237 0))(
  ( (Nil!12234) (Cons!12233 (h!13281 (_ BitVec 64)) (t!18457 List!12237)) )
))
(declare-fun arrayNoDuplicates!0 (array!38118 (_ BitVec 32) List!12237) Bool)

(assert (=> b!632395 (= res!408919 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12234))))

(assert (= (and start!57156 res!408913) b!632384))

(assert (= (and b!632384 res!408915) b!632390))

(assert (= (and b!632390 res!408921) b!632394))

(assert (= (and b!632394 res!408911) b!632382))

(assert (= (and b!632382 res!408916) b!632387))

(assert (= (and b!632387 res!408912) b!632388))

(assert (= (and b!632388 res!408917) b!632395))

(assert (= (and b!632395 res!408919) b!632383))

(assert (= (and b!632383 res!408910) b!632391))

(assert (= (and b!632391 res!408918) b!632385))

(assert (= (and b!632385 res!408920) b!632393))

(assert (= (and b!632393 res!408922) b!632381))

(assert (= (and b!632393 c!72104) b!632386))

(assert (= (and b!632393 (not c!72104)) b!632392))

(assert (= (and b!632393 (not res!408914)) b!632389))

(declare-fun m!607537 () Bool)

(assert (=> b!632391 m!607537))

(declare-fun m!607539 () Bool)

(assert (=> b!632391 m!607539))

(declare-fun m!607541 () Bool)

(assert (=> b!632385 m!607541))

(declare-fun m!607543 () Bool)

(assert (=> b!632385 m!607543))

(assert (=> b!632385 m!607543))

(declare-fun m!607545 () Bool)

(assert (=> b!632385 m!607545))

(declare-fun m!607547 () Bool)

(assert (=> b!632393 m!607547))

(declare-fun m!607549 () Bool)

(assert (=> b!632393 m!607549))

(assert (=> b!632393 m!607543))

(assert (=> b!632393 m!607537))

(declare-fun m!607551 () Bool)

(assert (=> b!632393 m!607551))

(declare-fun m!607553 () Bool)

(assert (=> b!632393 m!607553))

(declare-fun m!607555 () Bool)

(assert (=> b!632393 m!607555))

(assert (=> b!632393 m!607543))

(declare-fun m!607557 () Bool)

(assert (=> b!632393 m!607557))

(declare-fun m!607559 () Bool)

(assert (=> b!632394 m!607559))

(declare-fun m!607561 () Bool)

(assert (=> b!632382 m!607561))

(assert (=> b!632389 m!607537))

(declare-fun m!607563 () Bool)

(assert (=> b!632389 m!607563))

(assert (=> b!632389 m!607543))

(declare-fun m!607565 () Bool)

(assert (=> b!632387 m!607565))

(declare-fun m!607567 () Bool)

(assert (=> b!632383 m!607567))

(declare-fun m!607569 () Bool)

(assert (=> start!57156 m!607569))

(declare-fun m!607571 () Bool)

(assert (=> start!57156 m!607571))

(declare-fun m!607573 () Bool)

(assert (=> b!632395 m!607573))

(assert (=> b!632390 m!607543))

(assert (=> b!632390 m!607543))

(declare-fun m!607575 () Bool)

(assert (=> b!632390 m!607575))

(declare-fun m!607577 () Bool)

(assert (=> b!632388 m!607577))

(check-sat (not b!632387) (not b!632394) (not b!632395) (not b!632382) (not b!632390) (not b!632388) (not b!632385) (not start!57156) (not b!632393))
(check-sat)
