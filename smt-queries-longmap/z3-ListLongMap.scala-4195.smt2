; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57250 () Bool)

(assert start!57250)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!362201 () Bool)

(declare-fun lt!292705 () (_ BitVec 64))

(declare-fun lt!292700 () (_ BitVec 64))

(declare-fun b!633480 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38169 0))(
  ( (array!38170 (arr!18314 (Array (_ BitVec 32) (_ BitVec 64))) (size!18679 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38169)

(assert (=> b!633480 (= e!362201 (or (not (= (select (arr!18314 a!2986) j!136) lt!292700)) (not (= (select (arr!18314 a!2986) j!136) lt!292705)) (bvsge j!136 index!984) (bvsge index!984 (size!18679 a!2986)) (bvsge (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000)))))

(declare-fun e!362199 () Bool)

(assert (=> b!633480 e!362199))

(declare-fun res!409754 () Bool)

(assert (=> b!633480 (=> (not res!409754) (not e!362199))))

(assert (=> b!633480 (= res!409754 (= lt!292705 (select (arr!18314 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!633480 (= lt!292705 (select (store (arr!18314 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633481 () Bool)

(declare-fun res!409751 () Bool)

(declare-fun e!362204 () Bool)

(assert (=> b!633481 (=> (not res!409751) (not e!362204))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38169 (_ BitVec 32)) Bool)

(assert (=> b!633481 (= res!409751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!409747 () Bool)

(declare-fun e!362208 () Bool)

(assert (=> start!57250 (=> (not res!409747) (not e!362208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57250 (= res!409747 (validMask!0 mask!3053))))

(assert (=> start!57250 e!362208))

(assert (=> start!57250 true))

(declare-fun array_inv!14197 (array!38169) Bool)

(assert (=> start!57250 (array_inv!14197 a!2986)))

(declare-fun b!633482 () Bool)

(declare-fun res!409749 () Bool)

(assert (=> b!633482 (=> (not res!409749) (not e!362204))))

(declare-datatypes ((List!12394 0))(
  ( (Nil!12391) (Cons!12390 (h!13435 (_ BitVec 64)) (t!18613 List!12394)) )
))
(declare-fun arrayNoDuplicates!0 (array!38169 (_ BitVec 32) List!12394) Bool)

(assert (=> b!633482 (= res!409749 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12391))))

(declare-fun b!633483 () Bool)

(declare-fun res!409757 () Bool)

(assert (=> b!633483 (=> (not res!409757) (not e!362204))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!633483 (= res!409757 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18314 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633484 () Bool)

(declare-fun res!409761 () Bool)

(assert (=> b!633484 (=> (not res!409761) (not e!362208))))

(declare-fun arrayContainsKey!0 (array!38169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633484 (= res!409761 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633485 () Bool)

(declare-fun e!362206 () Bool)

(declare-fun e!362205 () Bool)

(assert (=> b!633485 (= e!362206 e!362205)))

(declare-fun res!409759 () Bool)

(assert (=> b!633485 (=> (not res!409759) (not e!362205))))

(declare-datatypes ((SeekEntryResult!6751 0))(
  ( (MissingZero!6751 (index!29303 (_ BitVec 32))) (Found!6751 (index!29304 (_ BitVec 32))) (Intermediate!6751 (undefined!7563 Bool) (index!29305 (_ BitVec 32)) (x!58055 (_ BitVec 32))) (Undefined!6751) (MissingVacant!6751 (index!29306 (_ BitVec 32))) )
))
(declare-fun lt!292706 () SeekEntryResult!6751)

(assert (=> b!633485 (= res!409759 (and (= lt!292706 (Found!6751 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18314 a!2986) index!984) (select (arr!18314 a!2986) j!136))) (not (= (select (arr!18314 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38169 (_ BitVec 32)) SeekEntryResult!6751)

(assert (=> b!633485 (= lt!292706 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18314 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633486 () Bool)

(declare-fun e!362203 () Bool)

(declare-fun e!362209 () Bool)

(assert (=> b!633486 (= e!362203 e!362209)))

(declare-fun res!409752 () Bool)

(assert (=> b!633486 (=> (not res!409752) (not e!362209))))

(declare-fun lt!292704 () array!38169)

(assert (=> b!633486 (= res!409752 (arrayContainsKey!0 lt!292704 (select (arr!18314 a!2986) j!136) j!136))))

(declare-fun b!633487 () Bool)

(declare-fun res!409758 () Bool)

(assert (=> b!633487 (=> (not res!409758) (not e!362208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633487 (= res!409758 (validKeyInArray!0 (select (arr!18314 a!2986) j!136)))))

(declare-fun b!633488 () Bool)

(declare-fun res!409746 () Bool)

(assert (=> b!633488 (=> (not res!409746) (not e!362208))))

(assert (=> b!633488 (= res!409746 (validKeyInArray!0 k0!1786))))

(declare-fun b!633489 () Bool)

(assert (=> b!633489 (= e!362209 (arrayContainsKey!0 lt!292704 (select (arr!18314 a!2986) j!136) index!984))))

(declare-fun b!633490 () Bool)

(assert (=> b!633490 (= e!362205 (not e!362201))))

(declare-fun res!409753 () Bool)

(assert (=> b!633490 (=> res!409753 e!362201)))

(declare-fun lt!292699 () SeekEntryResult!6751)

(assert (=> b!633490 (= res!409753 (not (= lt!292699 (Found!6751 index!984))))))

(declare-datatypes ((Unit!21332 0))(
  ( (Unit!21333) )
))
(declare-fun lt!292698 () Unit!21332)

(declare-fun e!362200 () Unit!21332)

(assert (=> b!633490 (= lt!292698 e!362200)))

(declare-fun c!72234 () Bool)

(assert (=> b!633490 (= c!72234 (= lt!292699 Undefined!6751))))

(assert (=> b!633490 (= lt!292699 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292700 lt!292704 mask!3053))))

(declare-fun e!362202 () Bool)

(assert (=> b!633490 e!362202))

(declare-fun res!409755 () Bool)

(assert (=> b!633490 (=> (not res!409755) (not e!362202))))

(declare-fun lt!292703 () (_ BitVec 32))

(declare-fun lt!292701 () SeekEntryResult!6751)

(assert (=> b!633490 (= res!409755 (= lt!292701 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292703 vacantSpotIndex!68 lt!292700 lt!292704 mask!3053)))))

(assert (=> b!633490 (= lt!292701 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292703 vacantSpotIndex!68 (select (arr!18314 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633490 (= lt!292700 (select (store (arr!18314 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292697 () Unit!21332)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21332)

(assert (=> b!633490 (= lt!292697 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292703 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633490 (= lt!292703 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633491 () Bool)

(declare-fun res!409748 () Bool)

(assert (=> b!633491 (=> (not res!409748) (not e!362208))))

(assert (=> b!633491 (= res!409748 (and (= (size!18679 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18679 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18679 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633492 () Bool)

(declare-fun Unit!21334 () Unit!21332)

(assert (=> b!633492 (= e!362200 Unit!21334)))

(assert (=> b!633492 false))

(declare-fun b!633493 () Bool)

(assert (=> b!633493 (= e!362202 (= lt!292706 lt!292701))))

(declare-fun b!633494 () Bool)

(assert (=> b!633494 (= e!362204 e!362206)))

(declare-fun res!409760 () Bool)

(assert (=> b!633494 (=> (not res!409760) (not e!362206))))

(assert (=> b!633494 (= res!409760 (= (select (store (arr!18314 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633494 (= lt!292704 (array!38170 (store (arr!18314 a!2986) i!1108 k0!1786) (size!18679 a!2986)))))

(declare-fun b!633495 () Bool)

(declare-fun Unit!21335 () Unit!21332)

(assert (=> b!633495 (= e!362200 Unit!21335)))

(declare-fun b!633496 () Bool)

(assert (=> b!633496 (= e!362208 e!362204)))

(declare-fun res!409756 () Bool)

(assert (=> b!633496 (=> (not res!409756) (not e!362204))))

(declare-fun lt!292702 () SeekEntryResult!6751)

(assert (=> b!633496 (= res!409756 (or (= lt!292702 (MissingZero!6751 i!1108)) (= lt!292702 (MissingVacant!6751 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38169 (_ BitVec 32)) SeekEntryResult!6751)

(assert (=> b!633496 (= lt!292702 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!633497 () Bool)

(assert (=> b!633497 (= e!362199 e!362203)))

(declare-fun res!409750 () Bool)

(assert (=> b!633497 (=> res!409750 e!362203)))

(assert (=> b!633497 (= res!409750 (or (not (= (select (arr!18314 a!2986) j!136) lt!292700)) (not (= (select (arr!18314 a!2986) j!136) lt!292705)) (bvsge j!136 index!984)))))

(assert (= (and start!57250 res!409747) b!633491))

(assert (= (and b!633491 res!409748) b!633487))

(assert (= (and b!633487 res!409758) b!633488))

(assert (= (and b!633488 res!409746) b!633484))

(assert (= (and b!633484 res!409761) b!633496))

(assert (= (and b!633496 res!409756) b!633481))

(assert (= (and b!633481 res!409751) b!633482))

(assert (= (and b!633482 res!409749) b!633483))

(assert (= (and b!633483 res!409757) b!633494))

(assert (= (and b!633494 res!409760) b!633485))

(assert (= (and b!633485 res!409759) b!633490))

(assert (= (and b!633490 res!409755) b!633493))

(assert (= (and b!633490 c!72234) b!633492))

(assert (= (and b!633490 (not c!72234)) b!633495))

(assert (= (and b!633490 (not res!409753)) b!633480))

(assert (= (and b!633480 res!409754) b!633497))

(assert (= (and b!633497 (not res!409750)) b!633486))

(assert (= (and b!633486 res!409752) b!633489))

(declare-fun m!607607 () Bool)

(assert (=> b!633481 m!607607))

(declare-fun m!607609 () Bool)

(assert (=> b!633480 m!607609))

(declare-fun m!607611 () Bool)

(assert (=> b!633480 m!607611))

(declare-fun m!607613 () Bool)

(assert (=> b!633480 m!607613))

(assert (=> b!633497 m!607609))

(declare-fun m!607615 () Bool)

(assert (=> b!633483 m!607615))

(declare-fun m!607617 () Bool)

(assert (=> b!633488 m!607617))

(declare-fun m!607619 () Bool)

(assert (=> start!57250 m!607619))

(declare-fun m!607621 () Bool)

(assert (=> start!57250 m!607621))

(declare-fun m!607623 () Bool)

(assert (=> b!633490 m!607623))

(assert (=> b!633490 m!607609))

(assert (=> b!633490 m!607609))

(declare-fun m!607625 () Bool)

(assert (=> b!633490 m!607625))

(declare-fun m!607627 () Bool)

(assert (=> b!633490 m!607627))

(declare-fun m!607629 () Bool)

(assert (=> b!633490 m!607629))

(declare-fun m!607631 () Bool)

(assert (=> b!633490 m!607631))

(declare-fun m!607633 () Bool)

(assert (=> b!633490 m!607633))

(assert (=> b!633490 m!607611))

(declare-fun m!607635 () Bool)

(assert (=> b!633482 m!607635))

(assert (=> b!633489 m!607609))

(assert (=> b!633489 m!607609))

(declare-fun m!607637 () Bool)

(assert (=> b!633489 m!607637))

(declare-fun m!607639 () Bool)

(assert (=> b!633496 m!607639))

(assert (=> b!633486 m!607609))

(assert (=> b!633486 m!607609))

(declare-fun m!607641 () Bool)

(assert (=> b!633486 m!607641))

(assert (=> b!633494 m!607611))

(declare-fun m!607643 () Bool)

(assert (=> b!633494 m!607643))

(declare-fun m!607645 () Bool)

(assert (=> b!633484 m!607645))

(assert (=> b!633487 m!607609))

(assert (=> b!633487 m!607609))

(declare-fun m!607647 () Bool)

(assert (=> b!633487 m!607647))

(declare-fun m!607649 () Bool)

(assert (=> b!633485 m!607649))

(assert (=> b!633485 m!607609))

(assert (=> b!633485 m!607609))

(declare-fun m!607651 () Bool)

(assert (=> b!633485 m!607651))

(check-sat (not b!633496) (not b!633490) (not start!57250) (not b!633482) (not b!633485) (not b!633489) (not b!633481) (not b!633486) (not b!633484) (not b!633487) (not b!633488))
(check-sat)
