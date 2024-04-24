; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57756 () Bool)

(assert start!57756)

(declare-fun b!638034 () Bool)

(declare-fun res!412811 () Bool)

(declare-fun e!365106 () Bool)

(assert (=> b!638034 (=> (not res!412811) (not e!365106))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38265 0))(
  ( (array!38266 (arr!18352 (Array (_ BitVec 32) (_ BitVec 64))) (size!18716 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38265)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!638034 (= res!412811 (and (= (size!18716 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18716 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18716 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638035 () Bool)

(declare-fun e!365105 () Bool)

(declare-fun e!365097 () Bool)

(assert (=> b!638035 (= e!365105 e!365097)))

(declare-fun res!412819 () Bool)

(assert (=> b!638035 (=> res!412819 e!365097)))

(declare-fun lt!295029 () (_ BitVec 64))

(declare-fun lt!295023 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638035 (= res!412819 (or (not (= (select (arr!18352 a!2986) j!136) lt!295023)) (not (= (select (arr!18352 a!2986) j!136) lt!295029)) (bvsge j!136 index!984)))))

(declare-fun b!638036 () Bool)

(declare-fun e!365108 () Bool)

(assert (=> b!638036 (= e!365106 e!365108)))

(declare-fun res!412814 () Bool)

(assert (=> b!638036 (=> (not res!412814) (not e!365108))))

(declare-datatypes ((SeekEntryResult!6748 0))(
  ( (MissingZero!6748 (index!29306 (_ BitVec 32))) (Found!6748 (index!29307 (_ BitVec 32))) (Intermediate!6748 (undefined!7560 Bool) (index!29308 (_ BitVec 32)) (x!58217 (_ BitVec 32))) (Undefined!6748) (MissingVacant!6748 (index!29309 (_ BitVec 32))) )
))
(declare-fun lt!295028 () SeekEntryResult!6748)

(assert (=> b!638036 (= res!412814 (or (= lt!295028 (MissingZero!6748 i!1108)) (= lt!295028 (MissingVacant!6748 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38265 (_ BitVec 32)) SeekEntryResult!6748)

(assert (=> b!638036 (= lt!295028 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638037 () Bool)

(declare-datatypes ((Unit!21501 0))(
  ( (Unit!21502) )
))
(declare-fun e!365099 () Unit!21501)

(declare-fun Unit!21503 () Unit!21501)

(assert (=> b!638037 (= e!365099 Unit!21503)))

(declare-fun b!638038 () Bool)

(declare-fun res!412804 () Bool)

(declare-fun e!365101 () Bool)

(assert (=> b!638038 (=> res!412804 e!365101)))

(declare-datatypes ((List!12300 0))(
  ( (Nil!12297) (Cons!12296 (h!13344 (_ BitVec 64)) (t!18520 List!12300)) )
))
(declare-fun contains!3092 (List!12300 (_ BitVec 64)) Bool)

(assert (=> b!638038 (= res!412804 (contains!3092 Nil!12297 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638039 () Bool)

(declare-fun e!365098 () Bool)

(declare-fun lt!295027 () SeekEntryResult!6748)

(declare-fun lt!295019 () SeekEntryResult!6748)

(assert (=> b!638039 (= e!365098 (= lt!295027 lt!295019))))

(declare-fun b!638040 () Bool)

(declare-fun Unit!21504 () Unit!21501)

(assert (=> b!638040 (= e!365099 Unit!21504)))

(assert (=> b!638040 false))

(declare-fun b!638041 () Bool)

(declare-fun res!412809 () Bool)

(assert (=> b!638041 (=> (not res!412809) (not e!365106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638041 (= res!412809 (validKeyInArray!0 k0!1786))))

(declare-fun res!412802 () Bool)

(assert (=> start!57756 (=> (not res!412802) (not e!365106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57756 (= res!412802 (validMask!0 mask!3053))))

(assert (=> start!57756 e!365106))

(assert (=> start!57756 true))

(declare-fun array_inv!14211 (array!38265) Bool)

(assert (=> start!57756 (array_inv!14211 a!2986)))

(declare-fun b!638042 () Bool)

(declare-fun res!412813 () Bool)

(assert (=> b!638042 (=> (not res!412813) (not e!365108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38265 (_ BitVec 32)) Bool)

(assert (=> b!638042 (= res!412813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638043 () Bool)

(declare-fun res!412816 () Bool)

(assert (=> b!638043 (=> (not res!412816) (not e!365106))))

(declare-fun arrayContainsKey!0 (array!38265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638043 (= res!412816 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638044 () Bool)

(declare-fun res!412799 () Bool)

(assert (=> b!638044 (=> res!412799 e!365101)))

(declare-fun noDuplicate!394 (List!12300) Bool)

(assert (=> b!638044 (= res!412799 (not (noDuplicate!394 Nil!12297)))))

(declare-fun b!638045 () Bool)

(declare-fun res!412817 () Bool)

(assert (=> b!638045 (=> (not res!412817) (not e!365106))))

(assert (=> b!638045 (= res!412817 (validKeyInArray!0 (select (arr!18352 a!2986) j!136)))))

(declare-fun b!638046 () Bool)

(declare-fun e!365100 () Bool)

(assert (=> b!638046 (= e!365097 e!365100)))

(declare-fun res!412806 () Bool)

(assert (=> b!638046 (=> (not res!412806) (not e!365100))))

(declare-fun lt!295026 () array!38265)

(assert (=> b!638046 (= res!412806 (arrayContainsKey!0 lt!295026 (select (arr!18352 a!2986) j!136) j!136))))

(declare-fun b!638047 () Bool)

(assert (=> b!638047 (= e!365100 (arrayContainsKey!0 lt!295026 (select (arr!18352 a!2986) j!136) index!984))))

(declare-fun b!638048 () Bool)

(declare-fun res!412815 () Bool)

(assert (=> b!638048 (=> (not res!412815) (not e!365108))))

(declare-fun arrayNoDuplicates!0 (array!38265 (_ BitVec 32) List!12300) Bool)

(assert (=> b!638048 (= res!412815 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12297))))

(declare-fun b!638049 () Bool)

(declare-fun res!412812 () Bool)

(assert (=> b!638049 (=> (not res!412812) (not e!365108))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!638049 (= res!412812 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18352 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638050 () Bool)

(declare-fun e!365107 () Bool)

(assert (=> b!638050 (= e!365108 e!365107)))

(declare-fun res!412810 () Bool)

(assert (=> b!638050 (=> (not res!412810) (not e!365107))))

(assert (=> b!638050 (= res!412810 (= (select (store (arr!18352 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638050 (= lt!295026 (array!38266 (store (arr!18352 a!2986) i!1108 k0!1786) (size!18716 a!2986)))))

(declare-fun b!638051 () Bool)

(assert (=> b!638051 (= e!365101 true)))

(declare-fun lt!295030 () Bool)

(assert (=> b!638051 (= lt!295030 (contains!3092 Nil!12297 k0!1786))))

(declare-fun b!638052 () Bool)

(declare-fun res!412808 () Bool)

(assert (=> b!638052 (=> res!412808 e!365101)))

(assert (=> b!638052 (= res!412808 (contains!3092 Nil!12297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638053 () Bool)

(declare-fun e!365102 () Bool)

(declare-fun e!365104 () Bool)

(assert (=> b!638053 (= e!365102 e!365104)))

(declare-fun res!412818 () Bool)

(assert (=> b!638053 (=> res!412818 e!365104)))

(assert (=> b!638053 (= res!412818 (or (not (= (select (arr!18352 a!2986) j!136) lt!295023)) (not (= (select (arr!18352 a!2986) j!136) lt!295029)) (bvsge j!136 index!984)))))

(assert (=> b!638053 e!365105))

(declare-fun res!412800 () Bool)

(assert (=> b!638053 (=> (not res!412800) (not e!365105))))

(assert (=> b!638053 (= res!412800 (= lt!295029 (select (arr!18352 a!2986) j!136)))))

(assert (=> b!638053 (= lt!295029 (select (store (arr!18352 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638054 () Bool)

(assert (=> b!638054 (= e!365104 e!365101)))

(declare-fun res!412801 () Bool)

(assert (=> b!638054 (=> res!412801 e!365101)))

(assert (=> b!638054 (= res!412801 (or (bvsge (size!18716 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18716 a!2986))))))

(assert (=> b!638054 (arrayContainsKey!0 lt!295026 (select (arr!18352 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295021 () Unit!21501)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38265 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21501)

(assert (=> b!638054 (= lt!295021 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295026 (select (arr!18352 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638055 () Bool)

(declare-fun e!365109 () Bool)

(assert (=> b!638055 (= e!365109 (not e!365102))))

(declare-fun res!412807 () Bool)

(assert (=> b!638055 (=> res!412807 e!365102)))

(declare-fun lt!295024 () SeekEntryResult!6748)

(assert (=> b!638055 (= res!412807 (not (= lt!295024 (Found!6748 index!984))))))

(declare-fun lt!295020 () Unit!21501)

(assert (=> b!638055 (= lt!295020 e!365099)))

(declare-fun c!72986 () Bool)

(assert (=> b!638055 (= c!72986 (= lt!295024 Undefined!6748))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38265 (_ BitVec 32)) SeekEntryResult!6748)

(assert (=> b!638055 (= lt!295024 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295023 lt!295026 mask!3053))))

(assert (=> b!638055 e!365098))

(declare-fun res!412803 () Bool)

(assert (=> b!638055 (=> (not res!412803) (not e!365098))))

(declare-fun lt!295025 () (_ BitVec 32))

(assert (=> b!638055 (= res!412803 (= lt!295019 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295025 vacantSpotIndex!68 lt!295023 lt!295026 mask!3053)))))

(assert (=> b!638055 (= lt!295019 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295025 vacantSpotIndex!68 (select (arr!18352 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638055 (= lt!295023 (select (store (arr!18352 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295022 () Unit!21501)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21501)

(assert (=> b!638055 (= lt!295022 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295025 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638055 (= lt!295025 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!638056 () Bool)

(assert (=> b!638056 (= e!365107 e!365109)))

(declare-fun res!412805 () Bool)

(assert (=> b!638056 (=> (not res!412805) (not e!365109))))

(assert (=> b!638056 (= res!412805 (and (= lt!295027 (Found!6748 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18352 a!2986) index!984) (select (arr!18352 a!2986) j!136))) (not (= (select (arr!18352 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!638056 (= lt!295027 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18352 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57756 res!412802) b!638034))

(assert (= (and b!638034 res!412811) b!638045))

(assert (= (and b!638045 res!412817) b!638041))

(assert (= (and b!638041 res!412809) b!638043))

(assert (= (and b!638043 res!412816) b!638036))

(assert (= (and b!638036 res!412814) b!638042))

(assert (= (and b!638042 res!412813) b!638048))

(assert (= (and b!638048 res!412815) b!638049))

(assert (= (and b!638049 res!412812) b!638050))

(assert (= (and b!638050 res!412810) b!638056))

(assert (= (and b!638056 res!412805) b!638055))

(assert (= (and b!638055 res!412803) b!638039))

(assert (= (and b!638055 c!72986) b!638040))

(assert (= (and b!638055 (not c!72986)) b!638037))

(assert (= (and b!638055 (not res!412807)) b!638053))

(assert (= (and b!638053 res!412800) b!638035))

(assert (= (and b!638035 (not res!412819)) b!638046))

(assert (= (and b!638046 res!412806) b!638047))

(assert (= (and b!638053 (not res!412818)) b!638054))

(assert (= (and b!638054 (not res!412801)) b!638044))

(assert (= (and b!638044 (not res!412799)) b!638052))

(assert (= (and b!638052 (not res!412808)) b!638038))

(assert (= (and b!638038 (not res!412804)) b!638051))

(declare-fun m!612421 () Bool)

(assert (=> b!638054 m!612421))

(assert (=> b!638054 m!612421))

(declare-fun m!612423 () Bool)

(assert (=> b!638054 m!612423))

(assert (=> b!638054 m!612421))

(declare-fun m!612425 () Bool)

(assert (=> b!638054 m!612425))

(declare-fun m!612427 () Bool)

(assert (=> start!57756 m!612427))

(declare-fun m!612429 () Bool)

(assert (=> start!57756 m!612429))

(declare-fun m!612431 () Bool)

(assert (=> b!638038 m!612431))

(assert (=> b!638046 m!612421))

(assert (=> b!638046 m!612421))

(declare-fun m!612433 () Bool)

(assert (=> b!638046 m!612433))

(declare-fun m!612435 () Bool)

(assert (=> b!638050 m!612435))

(declare-fun m!612437 () Bool)

(assert (=> b!638050 m!612437))

(declare-fun m!612439 () Bool)

(assert (=> b!638042 m!612439))

(declare-fun m!612441 () Bool)

(assert (=> b!638051 m!612441))

(declare-fun m!612443 () Bool)

(assert (=> b!638055 m!612443))

(declare-fun m!612445 () Bool)

(assert (=> b!638055 m!612445))

(declare-fun m!612447 () Bool)

(assert (=> b!638055 m!612447))

(assert (=> b!638055 m!612421))

(assert (=> b!638055 m!612435))

(assert (=> b!638055 m!612421))

(declare-fun m!612449 () Bool)

(assert (=> b!638055 m!612449))

(declare-fun m!612451 () Bool)

(assert (=> b!638055 m!612451))

(declare-fun m!612453 () Bool)

(assert (=> b!638055 m!612453))

(assert (=> b!638053 m!612421))

(assert (=> b!638053 m!612435))

(declare-fun m!612455 () Bool)

(assert (=> b!638053 m!612455))

(declare-fun m!612457 () Bool)

(assert (=> b!638052 m!612457))

(assert (=> b!638035 m!612421))

(declare-fun m!612459 () Bool)

(assert (=> b!638044 m!612459))

(declare-fun m!612461 () Bool)

(assert (=> b!638049 m!612461))

(declare-fun m!612463 () Bool)

(assert (=> b!638041 m!612463))

(declare-fun m!612465 () Bool)

(assert (=> b!638056 m!612465))

(assert (=> b!638056 m!612421))

(assert (=> b!638056 m!612421))

(declare-fun m!612467 () Bool)

(assert (=> b!638056 m!612467))

(assert (=> b!638047 m!612421))

(assert (=> b!638047 m!612421))

(declare-fun m!612469 () Bool)

(assert (=> b!638047 m!612469))

(assert (=> b!638045 m!612421))

(assert (=> b!638045 m!612421))

(declare-fun m!612471 () Bool)

(assert (=> b!638045 m!612471))

(declare-fun m!612473 () Bool)

(assert (=> b!638043 m!612473))

(declare-fun m!612475 () Bool)

(assert (=> b!638048 m!612475))

(declare-fun m!612477 () Bool)

(assert (=> b!638036 m!612477))

(check-sat (not start!57756) (not b!638052) (not b!638055) (not b!638036) (not b!638044) (not b!638054) (not b!638038) (not b!638046) (not b!638043) (not b!638045) (not b!638047) (not b!638042) (not b!638041) (not b!638056) (not b!638051) (not b!638048))
(check-sat)
