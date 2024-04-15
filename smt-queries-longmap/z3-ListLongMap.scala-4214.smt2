; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57788 () Bool)

(assert start!57788)

(declare-fun b!638781 () Bool)

(declare-fun res!413539 () Bool)

(declare-fun e!365546 () Bool)

(assert (=> b!638781 (=> (not res!413539) (not e!365546))))

(declare-datatypes ((array!38301 0))(
  ( (array!38302 (arr!18371 (Array (_ BitVec 32) (_ BitVec 64))) (size!18736 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38301)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638781 (= res!413539 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638782 () Bool)

(declare-fun res!413535 () Bool)

(assert (=> b!638782 (=> (not res!413535) (not e!365546))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!638782 (= res!413535 (and (= (size!18736 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18736 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18736 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638783 () Bool)

(declare-fun res!413536 () Bool)

(assert (=> b!638783 (=> (not res!413536) (not e!365546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638783 (= res!413536 (validKeyInArray!0 (select (arr!18371 a!2986) j!136)))))

(declare-fun b!638784 () Bool)

(declare-fun e!365549 () Bool)

(declare-fun e!365545 () Bool)

(assert (=> b!638784 (= e!365549 e!365545)))

(declare-fun res!413537 () Bool)

(assert (=> b!638784 (=> (not res!413537) (not e!365545))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!638784 (= res!413537 (= (select (store (arr!18371 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!295333 () array!38301)

(assert (=> b!638784 (= lt!295333 (array!38302 (store (arr!18371 a!2986) i!1108 k0!1786) (size!18736 a!2986)))))

(declare-fun b!638785 () Bool)

(declare-fun res!413523 () Bool)

(assert (=> b!638785 (=> (not res!413523) (not e!365549))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638785 (= res!413523 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18371 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638786 () Bool)

(declare-fun e!365551 () Bool)

(declare-fun e!365547 () Bool)

(assert (=> b!638786 (= e!365551 e!365547)))

(declare-fun res!413528 () Bool)

(assert (=> b!638786 (=> res!413528 e!365547)))

(declare-fun lt!295327 () (_ BitVec 64))

(declare-fun lt!295334 () (_ BitVec 64))

(assert (=> b!638786 (= res!413528 (or (not (= (select (arr!18371 a!2986) j!136) lt!295327)) (not (= (select (arr!18371 a!2986) j!136) lt!295334)) (bvsge j!136 index!984)))))

(declare-fun b!638787 () Bool)

(declare-fun e!365552 () Bool)

(assert (=> b!638787 (= e!365545 e!365552)))

(declare-fun res!413527 () Bool)

(assert (=> b!638787 (=> (not res!413527) (not e!365552))))

(declare-datatypes ((SeekEntryResult!6808 0))(
  ( (MissingZero!6808 (index!29549 (_ BitVec 32))) (Found!6808 (index!29550 (_ BitVec 32))) (Intermediate!6808 (undefined!7620 Bool) (index!29551 (_ BitVec 32)) (x!58318 (_ BitVec 32))) (Undefined!6808) (MissingVacant!6808 (index!29552 (_ BitVec 32))) )
))
(declare-fun lt!295329 () SeekEntryResult!6808)

(assert (=> b!638787 (= res!413527 (and (= lt!295329 (Found!6808 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18371 a!2986) index!984) (select (arr!18371 a!2986) j!136))) (not (= (select (arr!18371 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38301 (_ BitVec 32)) SeekEntryResult!6808)

(assert (=> b!638787 (= lt!295329 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18371 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638788 () Bool)

(declare-fun res!413525 () Bool)

(assert (=> b!638788 (=> (not res!413525) (not e!365549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38301 (_ BitVec 32)) Bool)

(assert (=> b!638788 (= res!413525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638789 () Bool)

(declare-fun res!413529 () Bool)

(assert (=> b!638789 (=> (not res!413529) (not e!365549))))

(declare-datatypes ((List!12451 0))(
  ( (Nil!12448) (Cons!12447 (h!13492 (_ BitVec 64)) (t!18670 List!12451)) )
))
(declare-fun arrayNoDuplicates!0 (array!38301 (_ BitVec 32) List!12451) Bool)

(assert (=> b!638789 (= res!413529 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12448))))

(declare-fun b!638790 () Bool)

(declare-datatypes ((Unit!21560 0))(
  ( (Unit!21561) )
))
(declare-fun e!365548 () Unit!21560)

(declare-fun Unit!21562 () Unit!21560)

(assert (=> b!638790 (= e!365548 Unit!21562)))

(declare-fun b!638791 () Bool)

(assert (=> b!638791 (= e!365546 e!365549)))

(declare-fun res!413526 () Bool)

(assert (=> b!638791 (=> (not res!413526) (not e!365549))))

(declare-fun lt!295328 () SeekEntryResult!6808)

(assert (=> b!638791 (= res!413526 (or (= lt!295328 (MissingZero!6808 i!1108)) (= lt!295328 (MissingVacant!6808 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38301 (_ BitVec 32)) SeekEntryResult!6808)

(assert (=> b!638791 (= lt!295328 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638793 () Bool)

(declare-fun e!365550 () Bool)

(assert (=> b!638793 (= e!365552 (not e!365550))))

(declare-fun res!413532 () Bool)

(assert (=> b!638793 (=> res!413532 e!365550)))

(declare-fun lt!295337 () SeekEntryResult!6808)

(assert (=> b!638793 (= res!413532 (not (= lt!295337 (Found!6808 index!984))))))

(declare-fun lt!295335 () Unit!21560)

(assert (=> b!638793 (= lt!295335 e!365548)))

(declare-fun c!72996 () Bool)

(assert (=> b!638793 (= c!72996 (= lt!295337 Undefined!6808))))

(assert (=> b!638793 (= lt!295337 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295327 lt!295333 mask!3053))))

(declare-fun e!365542 () Bool)

(assert (=> b!638793 e!365542))

(declare-fun res!413538 () Bool)

(assert (=> b!638793 (=> (not res!413538) (not e!365542))))

(declare-fun lt!295331 () (_ BitVec 32))

(declare-fun lt!295336 () SeekEntryResult!6808)

(assert (=> b!638793 (= res!413538 (= lt!295336 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295331 vacantSpotIndex!68 lt!295327 lt!295333 mask!3053)))))

(assert (=> b!638793 (= lt!295336 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295331 vacantSpotIndex!68 (select (arr!18371 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638793 (= lt!295327 (select (store (arr!18371 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295332 () Unit!21560)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38301 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21560)

(assert (=> b!638793 (= lt!295332 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295331 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638793 (= lt!295331 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638794 () Bool)

(declare-fun e!365544 () Bool)

(assert (=> b!638794 (= e!365550 e!365544)))

(declare-fun res!413533 () Bool)

(assert (=> b!638794 (=> res!413533 e!365544)))

(assert (=> b!638794 (= res!413533 (or (not (= (select (arr!18371 a!2986) j!136) lt!295327)) (not (= (select (arr!18371 a!2986) j!136) lt!295334)) (bvsge j!136 index!984)))))

(assert (=> b!638794 e!365551))

(declare-fun res!413534 () Bool)

(assert (=> b!638794 (=> (not res!413534) (not e!365551))))

(assert (=> b!638794 (= res!413534 (= lt!295334 (select (arr!18371 a!2986) j!136)))))

(assert (=> b!638794 (= lt!295334 (select (store (arr!18371 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638795 () Bool)

(assert (=> b!638795 (= e!365544 true)))

(assert (=> b!638795 (arrayNoDuplicates!0 lt!295333 #b00000000000000000000000000000000 Nil!12448)))

(declare-fun lt!295330 () Unit!21560)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38301 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12451) Unit!21560)

(assert (=> b!638795 (= lt!295330 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12448))))

(assert (=> b!638795 (arrayContainsKey!0 lt!295333 (select (arr!18371 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295338 () Unit!21560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38301 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21560)

(assert (=> b!638795 (= lt!295338 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295333 (select (arr!18371 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638796 () Bool)

(declare-fun e!365541 () Bool)

(assert (=> b!638796 (= e!365547 e!365541)))

(declare-fun res!413531 () Bool)

(assert (=> b!638796 (=> (not res!413531) (not e!365541))))

(assert (=> b!638796 (= res!413531 (arrayContainsKey!0 lt!295333 (select (arr!18371 a!2986) j!136) j!136))))

(declare-fun b!638797 () Bool)

(declare-fun res!413524 () Bool)

(assert (=> b!638797 (=> (not res!413524) (not e!365546))))

(assert (=> b!638797 (= res!413524 (validKeyInArray!0 k0!1786))))

(declare-fun b!638798 () Bool)

(assert (=> b!638798 (= e!365541 (arrayContainsKey!0 lt!295333 (select (arr!18371 a!2986) j!136) index!984))))

(declare-fun b!638799 () Bool)

(assert (=> b!638799 (= e!365542 (= lt!295329 lt!295336))))

(declare-fun res!413530 () Bool)

(assert (=> start!57788 (=> (not res!413530) (not e!365546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57788 (= res!413530 (validMask!0 mask!3053))))

(assert (=> start!57788 e!365546))

(assert (=> start!57788 true))

(declare-fun array_inv!14254 (array!38301) Bool)

(assert (=> start!57788 (array_inv!14254 a!2986)))

(declare-fun b!638792 () Bool)

(declare-fun Unit!21563 () Unit!21560)

(assert (=> b!638792 (= e!365548 Unit!21563)))

(assert (=> b!638792 false))

(assert (= (and start!57788 res!413530) b!638782))

(assert (= (and b!638782 res!413535) b!638783))

(assert (= (and b!638783 res!413536) b!638797))

(assert (= (and b!638797 res!413524) b!638781))

(assert (= (and b!638781 res!413539) b!638791))

(assert (= (and b!638791 res!413526) b!638788))

(assert (= (and b!638788 res!413525) b!638789))

(assert (= (and b!638789 res!413529) b!638785))

(assert (= (and b!638785 res!413523) b!638784))

(assert (= (and b!638784 res!413537) b!638787))

(assert (= (and b!638787 res!413527) b!638793))

(assert (= (and b!638793 res!413538) b!638799))

(assert (= (and b!638793 c!72996) b!638792))

(assert (= (and b!638793 (not c!72996)) b!638790))

(assert (= (and b!638793 (not res!413532)) b!638794))

(assert (= (and b!638794 res!413534) b!638786))

(assert (= (and b!638786 (not res!413528)) b!638796))

(assert (= (and b!638796 res!413531) b!638798))

(assert (= (and b!638794 (not res!413533)) b!638795))

(declare-fun m!612177 () Bool)

(assert (=> b!638797 m!612177))

(declare-fun m!612179 () Bool)

(assert (=> b!638787 m!612179))

(declare-fun m!612181 () Bool)

(assert (=> b!638787 m!612181))

(assert (=> b!638787 m!612181))

(declare-fun m!612183 () Bool)

(assert (=> b!638787 m!612183))

(declare-fun m!612185 () Bool)

(assert (=> b!638788 m!612185))

(declare-fun m!612187 () Bool)

(assert (=> b!638791 m!612187))

(assert (=> b!638795 m!612181))

(assert (=> b!638795 m!612181))

(declare-fun m!612189 () Bool)

(assert (=> b!638795 m!612189))

(assert (=> b!638795 m!612181))

(declare-fun m!612191 () Bool)

(assert (=> b!638795 m!612191))

(declare-fun m!612193 () Bool)

(assert (=> b!638795 m!612193))

(declare-fun m!612195 () Bool)

(assert (=> b!638795 m!612195))

(assert (=> b!638783 m!612181))

(assert (=> b!638783 m!612181))

(declare-fun m!612197 () Bool)

(assert (=> b!638783 m!612197))

(declare-fun m!612199 () Bool)

(assert (=> b!638784 m!612199))

(declare-fun m!612201 () Bool)

(assert (=> b!638784 m!612201))

(declare-fun m!612203 () Bool)

(assert (=> b!638781 m!612203))

(assert (=> b!638796 m!612181))

(assert (=> b!638796 m!612181))

(declare-fun m!612205 () Bool)

(assert (=> b!638796 m!612205))

(assert (=> b!638798 m!612181))

(assert (=> b!638798 m!612181))

(declare-fun m!612207 () Bool)

(assert (=> b!638798 m!612207))

(declare-fun m!612209 () Bool)

(assert (=> b!638793 m!612209))

(declare-fun m!612211 () Bool)

(assert (=> b!638793 m!612211))

(assert (=> b!638793 m!612181))

(assert (=> b!638793 m!612199))

(assert (=> b!638793 m!612181))

(declare-fun m!612213 () Bool)

(assert (=> b!638793 m!612213))

(declare-fun m!612215 () Bool)

(assert (=> b!638793 m!612215))

(declare-fun m!612217 () Bool)

(assert (=> b!638793 m!612217))

(declare-fun m!612219 () Bool)

(assert (=> b!638793 m!612219))

(assert (=> b!638786 m!612181))

(declare-fun m!612221 () Bool)

(assert (=> start!57788 m!612221))

(declare-fun m!612223 () Bool)

(assert (=> start!57788 m!612223))

(assert (=> b!638794 m!612181))

(assert (=> b!638794 m!612199))

(declare-fun m!612225 () Bool)

(assert (=> b!638794 m!612225))

(declare-fun m!612227 () Bool)

(assert (=> b!638789 m!612227))

(declare-fun m!612229 () Bool)

(assert (=> b!638785 m!612229))

(check-sat (not b!638793) (not b!638795) (not start!57788) (not b!638798) (not b!638788) (not b!638796) (not b!638783) (not b!638791) (not b!638787) (not b!638789) (not b!638781) (not b!638797))
(check-sat)
