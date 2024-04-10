; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58338 () Bool)

(assert start!58338)

(declare-fun b!644419 () Bool)

(declare-fun e!369217 () Bool)

(declare-fun e!369220 () Bool)

(assert (=> b!644419 (= e!369217 e!369220)))

(declare-fun res!417498 () Bool)

(assert (=> b!644419 (=> (not res!417498) (not e!369220))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6871 0))(
  ( (MissingZero!6871 (index!29816 (_ BitVec 32))) (Found!6871 (index!29817 (_ BitVec 32))) (Intermediate!6871 (undefined!7683 Bool) (index!29818 (_ BitVec 32)) (x!58583 (_ BitVec 32))) (Undefined!6871) (MissingVacant!6871 (index!29819 (_ BitVec 32))) )
))
(declare-fun lt!298689 () SeekEntryResult!6871)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38435 0))(
  ( (array!38436 (arr!18431 (Array (_ BitVec 32) (_ BitVec 64))) (size!18795 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38435)

(assert (=> b!644419 (= res!417498 (and (= lt!298689 (Found!6871 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18431 a!2986) index!984) (select (arr!18431 a!2986) j!136))) (not (= (select (arr!18431 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38435 (_ BitVec 32)) SeekEntryResult!6871)

(assert (=> b!644419 (= lt!298689 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18431 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644420 () Bool)

(declare-datatypes ((Unit!21852 0))(
  ( (Unit!21853) )
))
(declare-fun e!369214 () Unit!21852)

(declare-fun Unit!21854 () Unit!21852)

(assert (=> b!644420 (= e!369214 Unit!21854)))

(declare-fun lt!298698 () Unit!21852)

(declare-fun lt!298702 () array!38435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38435 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21852)

(assert (=> b!644420 (= lt!298698 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298702 (select (arr!18431 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644420 (arrayContainsKey!0 lt!298702 (select (arr!18431 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298700 () Unit!21852)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((List!12472 0))(
  ( (Nil!12469) (Cons!12468 (h!13513 (_ BitVec 64)) (t!18700 List!12472)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38435 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12472) Unit!21852)

(assert (=> b!644420 (= lt!298700 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12469))))

(declare-fun arrayNoDuplicates!0 (array!38435 (_ BitVec 32) List!12472) Bool)

(assert (=> b!644420 (arrayNoDuplicates!0 lt!298702 #b00000000000000000000000000000000 Nil!12469)))

(declare-fun lt!298691 () Unit!21852)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38435 (_ BitVec 32) (_ BitVec 32)) Unit!21852)

(assert (=> b!644420 (= lt!298691 (lemmaNoDuplicateFromThenFromBigger!0 lt!298702 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644420 (arrayNoDuplicates!0 lt!298702 j!136 Nil!12469)))

(declare-fun lt!298694 () Unit!21852)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38435 (_ BitVec 64) (_ BitVec 32) List!12472) Unit!21852)

(assert (=> b!644420 (= lt!298694 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298702 (select (arr!18431 a!2986) j!136) j!136 Nil!12469))))

(assert (=> b!644420 false))

(declare-fun b!644421 () Bool)

(declare-fun res!417504 () Bool)

(declare-fun e!369223 () Bool)

(assert (=> b!644421 (=> (not res!417504) (not e!369223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644421 (= res!417504 (validKeyInArray!0 k!1786))))

(declare-fun b!644422 () Bool)

(declare-fun e!369224 () Bool)

(assert (=> b!644422 (= e!369224 e!369217)))

(declare-fun res!417502 () Bool)

(assert (=> b!644422 (=> (not res!417502) (not e!369217))))

(assert (=> b!644422 (= res!417502 (= (select (store (arr!18431 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644422 (= lt!298702 (array!38436 (store (arr!18431 a!2986) i!1108 k!1786) (size!18795 a!2986)))))

(declare-fun b!644423 () Bool)

(declare-fun e!369215 () Bool)

(declare-fun e!369216 () Bool)

(assert (=> b!644423 (= e!369215 e!369216)))

(declare-fun res!417497 () Bool)

(assert (=> b!644423 (=> (not res!417497) (not e!369216))))

(assert (=> b!644423 (= res!417497 (arrayContainsKey!0 lt!298702 (select (arr!18431 a!2986) j!136) j!136))))

(declare-fun b!644424 () Bool)

(declare-fun res!417508 () Bool)

(assert (=> b!644424 (=> (not res!417508) (not e!369223))))

(assert (=> b!644424 (= res!417508 (validKeyInArray!0 (select (arr!18431 a!2986) j!136)))))

(declare-fun b!644425 () Bool)

(declare-fun Unit!21855 () Unit!21852)

(assert (=> b!644425 (= e!369214 Unit!21855)))

(declare-fun b!644426 () Bool)

(assert (=> b!644426 (= e!369216 (arrayContainsKey!0 lt!298702 (select (arr!18431 a!2986) j!136) index!984))))

(declare-fun b!644427 () Bool)

(declare-fun e!369212 () Bool)

(declare-fun lt!298692 () SeekEntryResult!6871)

(assert (=> b!644427 (= e!369212 (= lt!298689 lt!298692))))

(declare-fun b!644428 () Bool)

(declare-fun res!417492 () Bool)

(assert (=> b!644428 (=> (not res!417492) (not e!369223))))

(assert (=> b!644428 (= res!417492 (and (= (size!18795 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18795 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18795 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!417496 () Bool)

(assert (=> start!58338 (=> (not res!417496) (not e!369223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58338 (= res!417496 (validMask!0 mask!3053))))

(assert (=> start!58338 e!369223))

(assert (=> start!58338 true))

(declare-fun array_inv!14227 (array!38435) Bool)

(assert (=> start!58338 (array_inv!14227 a!2986)))

(declare-fun b!644429 () Bool)

(declare-fun res!417494 () Bool)

(assert (=> b!644429 (=> (not res!417494) (not e!369224))))

(assert (=> b!644429 (= res!417494 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12469))))

(declare-fun b!644430 () Bool)

(declare-fun res!417500 () Bool)

(assert (=> b!644430 (=> (not res!417500) (not e!369224))))

(assert (=> b!644430 (= res!417500 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18431 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644431 () Bool)

(declare-fun e!369218 () Unit!21852)

(declare-fun Unit!21856 () Unit!21852)

(assert (=> b!644431 (= e!369218 Unit!21856)))

(assert (=> b!644431 false))

(declare-fun b!644432 () Bool)

(assert (=> b!644432 (= e!369223 e!369224)))

(declare-fun res!417503 () Bool)

(assert (=> b!644432 (=> (not res!417503) (not e!369224))))

(declare-fun lt!298701 () SeekEntryResult!6871)

(assert (=> b!644432 (= res!417503 (or (= lt!298701 (MissingZero!6871 i!1108)) (= lt!298701 (MissingVacant!6871 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38435 (_ BitVec 32)) SeekEntryResult!6871)

(assert (=> b!644432 (= lt!298701 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!644433 () Bool)

(declare-fun e!369211 () Bool)

(assert (=> b!644433 (= e!369211 true)))

(declare-fun e!369221 () Bool)

(assert (=> b!644433 e!369221))

(declare-fun res!417495 () Bool)

(assert (=> b!644433 (=> (not res!417495) (not e!369221))))

(assert (=> b!644433 (= res!417495 (arrayContainsKey!0 lt!298702 (select (arr!18431 a!2986) j!136) j!136))))

(declare-fun b!644434 () Bool)

(declare-fun e!369222 () Bool)

(assert (=> b!644434 (= e!369220 (not e!369222))))

(declare-fun res!417499 () Bool)

(assert (=> b!644434 (=> res!417499 e!369222)))

(declare-fun lt!298688 () SeekEntryResult!6871)

(assert (=> b!644434 (= res!417499 (not (= lt!298688 (Found!6871 index!984))))))

(declare-fun lt!298696 () Unit!21852)

(assert (=> b!644434 (= lt!298696 e!369218)))

(declare-fun c!73831 () Bool)

(assert (=> b!644434 (= c!73831 (= lt!298688 Undefined!6871))))

(declare-fun lt!298695 () (_ BitVec 64))

(assert (=> b!644434 (= lt!298688 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298695 lt!298702 mask!3053))))

(assert (=> b!644434 e!369212))

(declare-fun res!417509 () Bool)

(assert (=> b!644434 (=> (not res!417509) (not e!369212))))

(declare-fun lt!298693 () (_ BitVec 32))

(assert (=> b!644434 (= res!417509 (= lt!298692 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298693 vacantSpotIndex!68 lt!298695 lt!298702 mask!3053)))))

(assert (=> b!644434 (= lt!298692 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298693 vacantSpotIndex!68 (select (arr!18431 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644434 (= lt!298695 (select (store (arr!18431 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298697 () Unit!21852)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21852)

(assert (=> b!644434 (= lt!298697 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298693 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644434 (= lt!298693 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644435 () Bool)

(assert (=> b!644435 (= e!369221 (arrayContainsKey!0 lt!298702 (select (arr!18431 a!2986) j!136) index!984))))

(declare-fun b!644436 () Bool)

(declare-fun e!369219 () Bool)

(assert (=> b!644436 (= e!369222 e!369219)))

(declare-fun res!417506 () Bool)

(assert (=> b!644436 (=> res!417506 e!369219)))

(declare-fun lt!298699 () (_ BitVec 64))

(assert (=> b!644436 (= res!417506 (or (not (= (select (arr!18431 a!2986) j!136) lt!298695)) (not (= (select (arr!18431 a!2986) j!136) lt!298699))))))

(declare-fun e!369225 () Bool)

(assert (=> b!644436 e!369225))

(declare-fun res!417501 () Bool)

(assert (=> b!644436 (=> (not res!417501) (not e!369225))))

(assert (=> b!644436 (= res!417501 (= lt!298699 (select (arr!18431 a!2986) j!136)))))

(assert (=> b!644436 (= lt!298699 (select (store (arr!18431 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!644437 () Bool)

(declare-fun res!417493 () Bool)

(assert (=> b!644437 (=> (not res!417493) (not e!369223))))

(assert (=> b!644437 (= res!417493 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644438 () Bool)

(declare-fun res!417507 () Bool)

(assert (=> b!644438 (=> (not res!417507) (not e!369224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38435 (_ BitVec 32)) Bool)

(assert (=> b!644438 (= res!417507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644439 () Bool)

(assert (=> b!644439 (= e!369225 e!369215)))

(declare-fun res!417505 () Bool)

(assert (=> b!644439 (=> res!417505 e!369215)))

(assert (=> b!644439 (= res!417505 (or (not (= (select (arr!18431 a!2986) j!136) lt!298695)) (not (= (select (arr!18431 a!2986) j!136) lt!298699)) (bvsge j!136 index!984)))))

(declare-fun b!644440 () Bool)

(declare-fun Unit!21857 () Unit!21852)

(assert (=> b!644440 (= e!369218 Unit!21857)))

(declare-fun b!644441 () Bool)

(assert (=> b!644441 (= e!369219 e!369211)))

(declare-fun res!417491 () Bool)

(assert (=> b!644441 (=> res!417491 e!369211)))

(assert (=> b!644441 (= res!417491 (bvsge index!984 j!136))))

(declare-fun lt!298690 () Unit!21852)

(assert (=> b!644441 (= lt!298690 e!369214)))

(declare-fun c!73832 () Bool)

(assert (=> b!644441 (= c!73832 (bvslt j!136 index!984))))

(assert (= (and start!58338 res!417496) b!644428))

(assert (= (and b!644428 res!417492) b!644424))

(assert (= (and b!644424 res!417508) b!644421))

(assert (= (and b!644421 res!417504) b!644437))

(assert (= (and b!644437 res!417493) b!644432))

(assert (= (and b!644432 res!417503) b!644438))

(assert (= (and b!644438 res!417507) b!644429))

(assert (= (and b!644429 res!417494) b!644430))

(assert (= (and b!644430 res!417500) b!644422))

(assert (= (and b!644422 res!417502) b!644419))

(assert (= (and b!644419 res!417498) b!644434))

(assert (= (and b!644434 res!417509) b!644427))

(assert (= (and b!644434 c!73831) b!644431))

(assert (= (and b!644434 (not c!73831)) b!644440))

(assert (= (and b!644434 (not res!417499)) b!644436))

(assert (= (and b!644436 res!417501) b!644439))

(assert (= (and b!644439 (not res!417505)) b!644423))

(assert (= (and b!644423 res!417497) b!644426))

(assert (= (and b!644436 (not res!417506)) b!644441))

(assert (= (and b!644441 c!73832) b!644420))

(assert (= (and b!644441 (not c!73832)) b!644425))

(assert (= (and b!644441 (not res!417491)) b!644433))

(assert (= (and b!644433 res!417495) b!644435))

(declare-fun m!618029 () Bool)

(assert (=> b!644438 m!618029))

(declare-fun m!618031 () Bool)

(assert (=> b!644424 m!618031))

(assert (=> b!644424 m!618031))

(declare-fun m!618033 () Bool)

(assert (=> b!644424 m!618033))

(assert (=> b!644435 m!618031))

(assert (=> b!644435 m!618031))

(declare-fun m!618035 () Bool)

(assert (=> b!644435 m!618035))

(assert (=> b!644423 m!618031))

(assert (=> b!644423 m!618031))

(declare-fun m!618037 () Bool)

(assert (=> b!644423 m!618037))

(assert (=> b!644439 m!618031))

(declare-fun m!618039 () Bool)

(assert (=> b!644434 m!618039))

(declare-fun m!618041 () Bool)

(assert (=> b!644434 m!618041))

(assert (=> b!644434 m!618031))

(declare-fun m!618043 () Bool)

(assert (=> b!644434 m!618043))

(declare-fun m!618045 () Bool)

(assert (=> b!644434 m!618045))

(declare-fun m!618047 () Bool)

(assert (=> b!644434 m!618047))

(assert (=> b!644434 m!618031))

(declare-fun m!618049 () Bool)

(assert (=> b!644434 m!618049))

(declare-fun m!618051 () Bool)

(assert (=> b!644434 m!618051))

(assert (=> b!644422 m!618043))

(declare-fun m!618053 () Bool)

(assert (=> b!644422 m!618053))

(declare-fun m!618055 () Bool)

(assert (=> b!644430 m!618055))

(assert (=> b!644436 m!618031))

(assert (=> b!644436 m!618043))

(declare-fun m!618057 () Bool)

(assert (=> b!644436 m!618057))

(declare-fun m!618059 () Bool)

(assert (=> b!644419 m!618059))

(assert (=> b!644419 m!618031))

(assert (=> b!644419 m!618031))

(declare-fun m!618061 () Bool)

(assert (=> b!644419 m!618061))

(assert (=> b!644433 m!618031))

(assert (=> b!644433 m!618031))

(assert (=> b!644433 m!618037))

(declare-fun m!618063 () Bool)

(assert (=> b!644432 m!618063))

(declare-fun m!618065 () Bool)

(assert (=> b!644429 m!618065))

(declare-fun m!618067 () Bool)

(assert (=> b!644437 m!618067))

(assert (=> b!644426 m!618031))

(assert (=> b!644426 m!618031))

(assert (=> b!644426 m!618035))

(declare-fun m!618069 () Bool)

(assert (=> b!644421 m!618069))

(declare-fun m!618071 () Bool)

(assert (=> b!644420 m!618071))

(assert (=> b!644420 m!618031))

(assert (=> b!644420 m!618031))

(declare-fun m!618073 () Bool)

(assert (=> b!644420 m!618073))

(declare-fun m!618075 () Bool)

(assert (=> b!644420 m!618075))

(assert (=> b!644420 m!618031))

(declare-fun m!618077 () Bool)

(assert (=> b!644420 m!618077))

(declare-fun m!618079 () Bool)

(assert (=> b!644420 m!618079))

(assert (=> b!644420 m!618031))

(declare-fun m!618081 () Bool)

(assert (=> b!644420 m!618081))

(declare-fun m!618083 () Bool)

(assert (=> b!644420 m!618083))

(declare-fun m!618085 () Bool)

(assert (=> start!58338 m!618085))

(declare-fun m!618087 () Bool)

(assert (=> start!58338 m!618087))

(push 1)

(assert (not b!644435))

(assert (not b!644429))

(assert (not b!644421))

(assert (not b!644432))

(assert (not b!644438))

(assert (not b!644426))

(assert (not b!644419))

(assert (not b!644433))

(assert (not b!644437))

(assert (not b!644423))

(assert (not b!644434))

(assert (not b!644424))

(assert (not start!58338))

(assert (not b!644420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

