; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57816 () Bool)

(assert start!57816)

(declare-fun b!639533 () Bool)

(declare-datatypes ((Unit!21614 0))(
  ( (Unit!21615) )
))
(declare-fun e!366020 () Unit!21614)

(declare-fun Unit!21616 () Unit!21614)

(assert (=> b!639533 (= e!366020 Unit!21616)))

(declare-fun b!639534 () Bool)

(declare-fun e!366025 () Bool)

(declare-datatypes ((array!38318 0))(
  ( (array!38319 (arr!18380 (Array (_ BitVec 32) (_ BitVec 64))) (size!18744 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38318)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!639534 (= e!366025 (or (bvsge (size!18744 a!2986) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!18744 a!2986)) (bvsle j!136 (size!18744 a!2986))))))

(declare-fun lt!295877 () array!38318)

(declare-datatypes ((List!12421 0))(
  ( (Nil!12418) (Cons!12417 (h!13462 (_ BitVec 64)) (t!18649 List!12421)) )
))
(declare-fun arrayNoDuplicates!0 (array!38318 (_ BitVec 32) List!12421) Bool)

(assert (=> b!639534 (arrayNoDuplicates!0 lt!295877 #b00000000000000000000000000000000 Nil!12418)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!295875 () Unit!21614)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38318 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12421) Unit!21614)

(assert (=> b!639534 (= lt!295875 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12418))))

(declare-fun arrayContainsKey!0 (array!38318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639534 (arrayContainsKey!0 lt!295877 (select (arr!18380 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295872 () Unit!21614)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38318 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21614)

(assert (=> b!639534 (= lt!295872 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295877 (select (arr!18380 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639535 () Bool)

(declare-fun e!366023 () Bool)

(declare-fun e!366019 () Bool)

(assert (=> b!639535 (= e!366023 e!366019)))

(declare-fun res!414075 () Bool)

(assert (=> b!639535 (=> (not res!414075) (not e!366019))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6820 0))(
  ( (MissingZero!6820 (index!29597 (_ BitVec 32))) (Found!6820 (index!29598 (_ BitVec 32))) (Intermediate!6820 (undefined!7632 Bool) (index!29599 (_ BitVec 32)) (x!58351 (_ BitVec 32))) (Undefined!6820) (MissingVacant!6820 (index!29600 (_ BitVec 32))) )
))
(declare-fun lt!295879 () SeekEntryResult!6820)

(assert (=> b!639535 (= res!414075 (and (= lt!295879 (Found!6820 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18380 a!2986) index!984) (select (arr!18380 a!2986) j!136))) (not (= (select (arr!18380 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38318 (_ BitVec 32)) SeekEntryResult!6820)

(assert (=> b!639535 (= lt!295879 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18380 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639536 () Bool)

(declare-fun res!414077 () Bool)

(declare-fun e!366028 () Bool)

(assert (=> b!639536 (=> (not res!414077) (not e!366028))))

(assert (=> b!639536 (= res!414077 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18380 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639537 () Bool)

(declare-fun Unit!21617 () Unit!21614)

(assert (=> b!639537 (= e!366020 Unit!21617)))

(assert (=> b!639537 false))

(declare-fun b!639538 () Bool)

(declare-fun res!414078 () Bool)

(assert (=> b!639538 (=> (not res!414078) (not e!366028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38318 (_ BitVec 32)) Bool)

(assert (=> b!639538 (= res!414078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639539 () Bool)

(declare-fun e!366026 () Bool)

(declare-fun lt!295876 () SeekEntryResult!6820)

(assert (=> b!639539 (= e!366026 (= lt!295879 lt!295876))))

(declare-fun b!639540 () Bool)

(declare-fun e!366024 () Bool)

(assert (=> b!639540 (= e!366024 e!366025)))

(declare-fun res!414083 () Bool)

(assert (=> b!639540 (=> res!414083 e!366025)))

(declare-fun lt!295882 () (_ BitVec 64))

(declare-fun lt!295878 () (_ BitVec 64))

(assert (=> b!639540 (= res!414083 (or (not (= (select (arr!18380 a!2986) j!136) lt!295882)) (not (= (select (arr!18380 a!2986) j!136) lt!295878)) (bvsge j!136 index!984)))))

(declare-fun e!366027 () Bool)

(assert (=> b!639540 e!366027))

(declare-fun res!414069 () Bool)

(assert (=> b!639540 (=> (not res!414069) (not e!366027))))

(assert (=> b!639540 (= res!414069 (= lt!295878 (select (arr!18380 a!2986) j!136)))))

(assert (=> b!639540 (= lt!295878 (select (store (arr!18380 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!639542 () Bool)

(declare-fun res!414079 () Bool)

(declare-fun e!366022 () Bool)

(assert (=> b!639542 (=> (not res!414079) (not e!366022))))

(assert (=> b!639542 (= res!414079 (and (= (size!18744 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18744 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18744 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639543 () Bool)

(declare-fun res!414068 () Bool)

(assert (=> b!639543 (=> (not res!414068) (not e!366022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639543 (= res!414068 (validKeyInArray!0 (select (arr!18380 a!2986) j!136)))))

(declare-fun b!639544 () Bool)

(declare-fun e!366030 () Bool)

(assert (=> b!639544 (= e!366030 (arrayContainsKey!0 lt!295877 (select (arr!18380 a!2986) j!136) index!984))))

(declare-fun b!639545 () Bool)

(declare-fun e!366021 () Bool)

(assert (=> b!639545 (= e!366021 e!366030)))

(declare-fun res!414082 () Bool)

(assert (=> b!639545 (=> (not res!414082) (not e!366030))))

(assert (=> b!639545 (= res!414082 (arrayContainsKey!0 lt!295877 (select (arr!18380 a!2986) j!136) j!136))))

(declare-fun b!639546 () Bool)

(declare-fun res!414076 () Bool)

(assert (=> b!639546 (=> (not res!414076) (not e!366022))))

(assert (=> b!639546 (= res!414076 (validKeyInArray!0 k!1786))))

(declare-fun b!639547 () Bool)

(assert (=> b!639547 (= e!366019 (not e!366024))))

(declare-fun res!414071 () Bool)

(assert (=> b!639547 (=> res!414071 e!366024)))

(declare-fun lt!295880 () SeekEntryResult!6820)

(assert (=> b!639547 (= res!414071 (not (= lt!295880 (Found!6820 index!984))))))

(declare-fun lt!295874 () Unit!21614)

(assert (=> b!639547 (= lt!295874 e!366020)))

(declare-fun c!73100 () Bool)

(assert (=> b!639547 (= c!73100 (= lt!295880 Undefined!6820))))

(assert (=> b!639547 (= lt!295880 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295882 lt!295877 mask!3053))))

(assert (=> b!639547 e!366026))

(declare-fun res!414073 () Bool)

(assert (=> b!639547 (=> (not res!414073) (not e!366026))))

(declare-fun lt!295871 () (_ BitVec 32))

(assert (=> b!639547 (= res!414073 (= lt!295876 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295871 vacantSpotIndex!68 lt!295882 lt!295877 mask!3053)))))

(assert (=> b!639547 (= lt!295876 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295871 vacantSpotIndex!68 (select (arr!18380 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639547 (= lt!295882 (select (store (arr!18380 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295881 () Unit!21614)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38318 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21614)

(assert (=> b!639547 (= lt!295881 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295871 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639547 (= lt!295871 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639548 () Bool)

(declare-fun res!414081 () Bool)

(assert (=> b!639548 (=> (not res!414081) (not e!366028))))

(assert (=> b!639548 (= res!414081 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12418))))

(declare-fun b!639541 () Bool)

(declare-fun res!414074 () Bool)

(assert (=> b!639541 (=> (not res!414074) (not e!366022))))

(assert (=> b!639541 (= res!414074 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!414072 () Bool)

(assert (=> start!57816 (=> (not res!414072) (not e!366022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57816 (= res!414072 (validMask!0 mask!3053))))

(assert (=> start!57816 e!366022))

(assert (=> start!57816 true))

(declare-fun array_inv!14176 (array!38318) Bool)

(assert (=> start!57816 (array_inv!14176 a!2986)))

(declare-fun b!639549 () Bool)

(assert (=> b!639549 (= e!366022 e!366028)))

(declare-fun res!414067 () Bool)

(assert (=> b!639549 (=> (not res!414067) (not e!366028))))

(declare-fun lt!295873 () SeekEntryResult!6820)

(assert (=> b!639549 (= res!414067 (or (= lt!295873 (MissingZero!6820 i!1108)) (= lt!295873 (MissingVacant!6820 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38318 (_ BitVec 32)) SeekEntryResult!6820)

(assert (=> b!639549 (= lt!295873 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!639550 () Bool)

(assert (=> b!639550 (= e!366028 e!366023)))

(declare-fun res!414080 () Bool)

(assert (=> b!639550 (=> (not res!414080) (not e!366023))))

(assert (=> b!639550 (= res!414080 (= (select (store (arr!18380 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639550 (= lt!295877 (array!38319 (store (arr!18380 a!2986) i!1108 k!1786) (size!18744 a!2986)))))

(declare-fun b!639551 () Bool)

(assert (=> b!639551 (= e!366027 e!366021)))

(declare-fun res!414070 () Bool)

(assert (=> b!639551 (=> res!414070 e!366021)))

(assert (=> b!639551 (= res!414070 (or (not (= (select (arr!18380 a!2986) j!136) lt!295882)) (not (= (select (arr!18380 a!2986) j!136) lt!295878)) (bvsge j!136 index!984)))))

(assert (= (and start!57816 res!414072) b!639542))

(assert (= (and b!639542 res!414079) b!639543))

(assert (= (and b!639543 res!414068) b!639546))

(assert (= (and b!639546 res!414076) b!639541))

(assert (= (and b!639541 res!414074) b!639549))

(assert (= (and b!639549 res!414067) b!639538))

(assert (= (and b!639538 res!414078) b!639548))

(assert (= (and b!639548 res!414081) b!639536))

(assert (= (and b!639536 res!414077) b!639550))

(assert (= (and b!639550 res!414080) b!639535))

(assert (= (and b!639535 res!414075) b!639547))

(assert (= (and b!639547 res!414073) b!639539))

(assert (= (and b!639547 c!73100) b!639537))

(assert (= (and b!639547 (not c!73100)) b!639533))

(assert (= (and b!639547 (not res!414071)) b!639540))

(assert (= (and b!639540 res!414069) b!639551))

(assert (= (and b!639551 (not res!414070)) b!639545))

(assert (= (and b!639545 res!414082) b!639544))

(assert (= (and b!639540 (not res!414083)) b!639534))

(declare-fun m!613391 () Bool)

(assert (=> b!639541 m!613391))

(declare-fun m!613393 () Bool)

(assert (=> b!639547 m!613393))

(declare-fun m!613395 () Bool)

(assert (=> b!639547 m!613395))

(declare-fun m!613397 () Bool)

(assert (=> b!639547 m!613397))

(declare-fun m!613399 () Bool)

(assert (=> b!639547 m!613399))

(declare-fun m!613401 () Bool)

(assert (=> b!639547 m!613401))

(assert (=> b!639547 m!613397))

(declare-fun m!613403 () Bool)

(assert (=> b!639547 m!613403))

(declare-fun m!613405 () Bool)

(assert (=> b!639547 m!613405))

(declare-fun m!613407 () Bool)

(assert (=> b!639547 m!613407))

(declare-fun m!613409 () Bool)

(assert (=> b!639536 m!613409))

(assert (=> b!639534 m!613397))

(declare-fun m!613411 () Bool)

(assert (=> b!639534 m!613411))

(assert (=> b!639534 m!613397))

(declare-fun m!613413 () Bool)

(assert (=> b!639534 m!613413))

(assert (=> b!639534 m!613397))

(declare-fun m!613415 () Bool)

(assert (=> b!639534 m!613415))

(declare-fun m!613417 () Bool)

(assert (=> b!639534 m!613417))

(declare-fun m!613419 () Bool)

(assert (=> b!639535 m!613419))

(assert (=> b!639535 m!613397))

(assert (=> b!639535 m!613397))

(declare-fun m!613421 () Bool)

(assert (=> b!639535 m!613421))

(assert (=> b!639544 m!613397))

(assert (=> b!639544 m!613397))

(declare-fun m!613423 () Bool)

(assert (=> b!639544 m!613423))

(declare-fun m!613425 () Bool)

(assert (=> b!639546 m!613425))

(declare-fun m!613427 () Bool)

(assert (=> start!57816 m!613427))

(declare-fun m!613429 () Bool)

(assert (=> start!57816 m!613429))

(declare-fun m!613431 () Bool)

(assert (=> b!639538 m!613431))

(assert (=> b!639551 m!613397))

(assert (=> b!639550 m!613401))

(declare-fun m!613433 () Bool)

(assert (=> b!639550 m!613433))

(declare-fun m!613435 () Bool)

(assert (=> b!639548 m!613435))

(assert (=> b!639540 m!613397))

(assert (=> b!639540 m!613401))

(declare-fun m!613437 () Bool)

(assert (=> b!639540 m!613437))

(assert (=> b!639545 m!613397))

(assert (=> b!639545 m!613397))

(declare-fun m!613439 () Bool)

(assert (=> b!639545 m!613439))

(declare-fun m!613441 () Bool)

(assert (=> b!639549 m!613441))

(assert (=> b!639543 m!613397))

(assert (=> b!639543 m!613397))

(declare-fun m!613443 () Bool)

(assert (=> b!639543 m!613443))

(push 1)

(assert (not b!639535))

(assert (not b!639543))

(assert (not b!639538))

(assert (not b!639546))

(assert (not b!639549))

(assert (not b!639548))

(assert (not b!639541))

(assert (not b!639547))

(assert (not b!639534))

(assert (not start!57816))

(assert (not b!639544))

(assert (not b!639545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

