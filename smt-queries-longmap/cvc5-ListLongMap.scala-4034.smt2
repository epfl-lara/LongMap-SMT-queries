; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54910 () Bool)

(assert start!54910)

(declare-fun b!601296 () Bool)

(declare-fun res!386096 () Bool)

(declare-fun e!343816 () Bool)

(assert (=> b!601296 (=> (not res!386096) (not e!343816))))

(declare-datatypes ((array!37145 0))(
  ( (array!37146 (arr!17832 (Array (_ BitVec 32) (_ BitVec 64))) (size!18196 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37145)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601296 (= res!386096 (validKeyInArray!0 (select (arr!17832 a!2986) j!136)))))

(declare-fun b!601297 () Bool)

(declare-datatypes ((Unit!19012 0))(
  ( (Unit!19013) )
))
(declare-fun e!343807 () Unit!19012)

(declare-fun Unit!19014 () Unit!19012)

(assert (=> b!601297 (= e!343807 Unit!19014)))

(declare-fun b!601298 () Bool)

(declare-fun e!343810 () Bool)

(declare-fun e!343815 () Bool)

(assert (=> b!601298 (= e!343810 e!343815)))

(declare-fun res!386082 () Bool)

(assert (=> b!601298 (=> res!386082 e!343815)))

(declare-fun lt!273696 () (_ BitVec 64))

(declare-fun lt!273700 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!601298 (= res!386082 (or (not (= (select (arr!17832 a!2986) j!136) lt!273696)) (not (= (select (arr!17832 a!2986) j!136) lt!273700)) (bvsge j!136 index!984)))))

(declare-fun b!601299 () Bool)

(declare-fun res!386091 () Bool)

(declare-fun e!343814 () Bool)

(assert (=> b!601299 (=> (not res!386091) (not e!343814))))

(declare-datatypes ((List!11873 0))(
  ( (Nil!11870) (Cons!11869 (h!12914 (_ BitVec 64)) (t!18101 List!11873)) )
))
(declare-fun arrayNoDuplicates!0 (array!37145 (_ BitVec 32) List!11873) Bool)

(assert (=> b!601299 (= res!386091 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11870))))

(declare-fun b!601300 () Bool)

(declare-fun e!343808 () Bool)

(assert (=> b!601300 (= e!343808 true)))

(declare-fun lt!273706 () Unit!19012)

(assert (=> b!601300 (= lt!273706 e!343807)))

(declare-fun c!67976 () Bool)

(assert (=> b!601300 (= c!67976 (bvslt j!136 index!984))))

(declare-fun b!601301 () Bool)

(declare-fun e!343809 () Unit!19012)

(declare-fun Unit!19015 () Unit!19012)

(assert (=> b!601301 (= e!343809 Unit!19015)))

(declare-fun b!601302 () Bool)

(assert (=> b!601302 (= e!343816 e!343814)))

(declare-fun res!386086 () Bool)

(assert (=> b!601302 (=> (not res!386086) (not e!343814))))

(declare-datatypes ((SeekEntryResult!6272 0))(
  ( (MissingZero!6272 (index!27345 (_ BitVec 32))) (Found!6272 (index!27346 (_ BitVec 32))) (Intermediate!6272 (undefined!7084 Bool) (index!27347 (_ BitVec 32)) (x!56143 (_ BitVec 32))) (Undefined!6272) (MissingVacant!6272 (index!27348 (_ BitVec 32))) )
))
(declare-fun lt!273698 () SeekEntryResult!6272)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!601302 (= res!386086 (or (= lt!273698 (MissingZero!6272 i!1108)) (= lt!273698 (MissingVacant!6272 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37145 (_ BitVec 32)) SeekEntryResult!6272)

(assert (=> b!601302 (= lt!273698 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!601303 () Bool)

(declare-fun e!343817 () Bool)

(declare-fun lt!273699 () SeekEntryResult!6272)

(declare-fun lt!273704 () SeekEntryResult!6272)

(assert (=> b!601303 (= e!343817 (= lt!273699 lt!273704))))

(declare-fun res!386090 () Bool)

(assert (=> start!54910 (=> (not res!386090) (not e!343816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54910 (= res!386090 (validMask!0 mask!3053))))

(assert (=> start!54910 e!343816))

(assert (=> start!54910 true))

(declare-fun array_inv!13628 (array!37145) Bool)

(assert (=> start!54910 (array_inv!13628 a!2986)))

(declare-fun b!601304 () Bool)

(declare-fun res!386088 () Bool)

(assert (=> b!601304 (=> (not res!386088) (not e!343814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37145 (_ BitVec 32)) Bool)

(assert (=> b!601304 (= res!386088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601305 () Bool)

(declare-fun e!343812 () Bool)

(declare-fun e!343806 () Bool)

(assert (=> b!601305 (= e!343812 (not e!343806))))

(declare-fun res!386094 () Bool)

(assert (=> b!601305 (=> res!386094 e!343806)))

(declare-fun lt!273709 () SeekEntryResult!6272)

(assert (=> b!601305 (= res!386094 (not (= lt!273709 (Found!6272 index!984))))))

(declare-fun lt!273707 () Unit!19012)

(assert (=> b!601305 (= lt!273707 e!343809)))

(declare-fun c!67975 () Bool)

(assert (=> b!601305 (= c!67975 (= lt!273709 Undefined!6272))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!273702 () array!37145)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37145 (_ BitVec 32)) SeekEntryResult!6272)

(assert (=> b!601305 (= lt!273709 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273696 lt!273702 mask!3053))))

(assert (=> b!601305 e!343817))

(declare-fun res!386095 () Bool)

(assert (=> b!601305 (=> (not res!386095) (not e!343817))))

(declare-fun lt!273701 () (_ BitVec 32))

(assert (=> b!601305 (= res!386095 (= lt!273704 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273701 vacantSpotIndex!68 lt!273696 lt!273702 mask!3053)))))

(assert (=> b!601305 (= lt!273704 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273701 vacantSpotIndex!68 (select (arr!17832 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601305 (= lt!273696 (select (store (arr!17832 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273703 () Unit!19012)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19012)

(assert (=> b!601305 (= lt!273703 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273701 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601305 (= lt!273701 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601306 () Bool)

(declare-fun Unit!19016 () Unit!19012)

(assert (=> b!601306 (= e!343809 Unit!19016)))

(assert (=> b!601306 false))

(declare-fun b!601307 () Bool)

(declare-fun res!386087 () Bool)

(assert (=> b!601307 (=> (not res!386087) (not e!343816))))

(assert (=> b!601307 (= res!386087 (validKeyInArray!0 k!1786))))

(declare-fun b!601308 () Bool)

(declare-fun e!343813 () Bool)

(assert (=> b!601308 (= e!343813 e!343812)))

(declare-fun res!386080 () Bool)

(assert (=> b!601308 (=> (not res!386080) (not e!343812))))

(assert (=> b!601308 (= res!386080 (and (= lt!273699 (Found!6272 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17832 a!2986) index!984) (select (arr!17832 a!2986) j!136))) (not (= (select (arr!17832 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601308 (= lt!273699 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17832 a!2986) j!136) a!2986 mask!3053))))

(declare-fun e!343811 () Bool)

(declare-fun b!601309 () Bool)

(declare-fun arrayContainsKey!0 (array!37145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601309 (= e!343811 (arrayContainsKey!0 lt!273702 (select (arr!17832 a!2986) j!136) index!984))))

(declare-fun b!601310 () Bool)

(declare-fun Unit!19017 () Unit!19012)

(assert (=> b!601310 (= e!343807 Unit!19017)))

(declare-fun lt!273708 () Unit!19012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37145 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19012)

(assert (=> b!601310 (= lt!273708 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273702 (select (arr!17832 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601310 (arrayContainsKey!0 lt!273702 (select (arr!17832 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273705 () Unit!19012)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37145 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11873) Unit!19012)

(assert (=> b!601310 (= lt!273705 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11870))))

(assert (=> b!601310 (arrayNoDuplicates!0 lt!273702 #b00000000000000000000000000000000 Nil!11870)))

(declare-fun lt!273695 () Unit!19012)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37145 (_ BitVec 32) (_ BitVec 32)) Unit!19012)

(assert (=> b!601310 (= lt!273695 (lemmaNoDuplicateFromThenFromBigger!0 lt!273702 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601310 (arrayNoDuplicates!0 lt!273702 j!136 Nil!11870)))

(declare-fun lt!273697 () Unit!19012)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37145 (_ BitVec 64) (_ BitVec 32) List!11873) Unit!19012)

(assert (=> b!601310 (= lt!273697 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273702 (select (arr!17832 a!2986) j!136) j!136 Nil!11870))))

(assert (=> b!601310 false))

(declare-fun b!601311 () Bool)

(assert (=> b!601311 (= e!343814 e!343813)))

(declare-fun res!386081 () Bool)

(assert (=> b!601311 (=> (not res!386081) (not e!343813))))

(assert (=> b!601311 (= res!386081 (= (select (store (arr!17832 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601311 (= lt!273702 (array!37146 (store (arr!17832 a!2986) i!1108 k!1786) (size!18196 a!2986)))))

(declare-fun b!601312 () Bool)

(declare-fun res!386085 () Bool)

(assert (=> b!601312 (=> (not res!386085) (not e!343816))))

(assert (=> b!601312 (= res!386085 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601313 () Bool)

(declare-fun res!386084 () Bool)

(assert (=> b!601313 (=> (not res!386084) (not e!343816))))

(assert (=> b!601313 (= res!386084 (and (= (size!18196 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18196 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18196 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601314 () Bool)

(assert (=> b!601314 (= e!343806 e!343808)))

(declare-fun res!386089 () Bool)

(assert (=> b!601314 (=> res!386089 e!343808)))

(assert (=> b!601314 (= res!386089 (or (not (= (select (arr!17832 a!2986) j!136) lt!273696)) (not (= (select (arr!17832 a!2986) j!136) lt!273700))))))

(assert (=> b!601314 e!343810))

(declare-fun res!386083 () Bool)

(assert (=> b!601314 (=> (not res!386083) (not e!343810))))

(assert (=> b!601314 (= res!386083 (= lt!273700 (select (arr!17832 a!2986) j!136)))))

(assert (=> b!601314 (= lt!273700 (select (store (arr!17832 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!601315 () Bool)

(assert (=> b!601315 (= e!343815 e!343811)))

(declare-fun res!386093 () Bool)

(assert (=> b!601315 (=> (not res!386093) (not e!343811))))

(assert (=> b!601315 (= res!386093 (arrayContainsKey!0 lt!273702 (select (arr!17832 a!2986) j!136) j!136))))

(declare-fun b!601316 () Bool)

(declare-fun res!386092 () Bool)

(assert (=> b!601316 (=> (not res!386092) (not e!343814))))

(assert (=> b!601316 (= res!386092 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17832 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54910 res!386090) b!601313))

(assert (= (and b!601313 res!386084) b!601296))

(assert (= (and b!601296 res!386096) b!601307))

(assert (= (and b!601307 res!386087) b!601312))

(assert (= (and b!601312 res!386085) b!601302))

(assert (= (and b!601302 res!386086) b!601304))

(assert (= (and b!601304 res!386088) b!601299))

(assert (= (and b!601299 res!386091) b!601316))

(assert (= (and b!601316 res!386092) b!601311))

(assert (= (and b!601311 res!386081) b!601308))

(assert (= (and b!601308 res!386080) b!601305))

(assert (= (and b!601305 res!386095) b!601303))

(assert (= (and b!601305 c!67975) b!601306))

(assert (= (and b!601305 (not c!67975)) b!601301))

(assert (= (and b!601305 (not res!386094)) b!601314))

(assert (= (and b!601314 res!386083) b!601298))

(assert (= (and b!601298 (not res!386082)) b!601315))

(assert (= (and b!601315 res!386093) b!601309))

(assert (= (and b!601314 (not res!386089)) b!601300))

(assert (= (and b!601300 c!67976) b!601310))

(assert (= (and b!601300 (not c!67976)) b!601297))

(declare-fun m!578489 () Bool)

(assert (=> b!601309 m!578489))

(assert (=> b!601309 m!578489))

(declare-fun m!578491 () Bool)

(assert (=> b!601309 m!578491))

(declare-fun m!578493 () Bool)

(assert (=> b!601312 m!578493))

(declare-fun m!578495 () Bool)

(assert (=> b!601307 m!578495))

(assert (=> b!601314 m!578489))

(declare-fun m!578497 () Bool)

(assert (=> b!601314 m!578497))

(declare-fun m!578499 () Bool)

(assert (=> b!601314 m!578499))

(declare-fun m!578501 () Bool)

(assert (=> b!601308 m!578501))

(assert (=> b!601308 m!578489))

(assert (=> b!601308 m!578489))

(declare-fun m!578503 () Bool)

(assert (=> b!601308 m!578503))

(declare-fun m!578505 () Bool)

(assert (=> start!54910 m!578505))

(declare-fun m!578507 () Bool)

(assert (=> start!54910 m!578507))

(assert (=> b!601305 m!578489))

(declare-fun m!578509 () Bool)

(assert (=> b!601305 m!578509))

(declare-fun m!578511 () Bool)

(assert (=> b!601305 m!578511))

(assert (=> b!601305 m!578489))

(declare-fun m!578513 () Bool)

(assert (=> b!601305 m!578513))

(declare-fun m!578515 () Bool)

(assert (=> b!601305 m!578515))

(declare-fun m!578517 () Bool)

(assert (=> b!601305 m!578517))

(declare-fun m!578519 () Bool)

(assert (=> b!601305 m!578519))

(assert (=> b!601305 m!578497))

(assert (=> b!601311 m!578497))

(declare-fun m!578521 () Bool)

(assert (=> b!601311 m!578521))

(declare-fun m!578523 () Bool)

(assert (=> b!601302 m!578523))

(assert (=> b!601310 m!578489))

(declare-fun m!578525 () Bool)

(assert (=> b!601310 m!578525))

(declare-fun m!578527 () Bool)

(assert (=> b!601310 m!578527))

(assert (=> b!601310 m!578489))

(declare-fun m!578529 () Bool)

(assert (=> b!601310 m!578529))

(assert (=> b!601310 m!578489))

(declare-fun m!578531 () Bool)

(assert (=> b!601310 m!578531))

(assert (=> b!601310 m!578489))

(declare-fun m!578533 () Bool)

(assert (=> b!601310 m!578533))

(declare-fun m!578535 () Bool)

(assert (=> b!601310 m!578535))

(declare-fun m!578537 () Bool)

(assert (=> b!601310 m!578537))

(declare-fun m!578539 () Bool)

(assert (=> b!601316 m!578539))

(assert (=> b!601315 m!578489))

(assert (=> b!601315 m!578489))

(declare-fun m!578541 () Bool)

(assert (=> b!601315 m!578541))

(assert (=> b!601298 m!578489))

(assert (=> b!601296 m!578489))

(assert (=> b!601296 m!578489))

(declare-fun m!578543 () Bool)

(assert (=> b!601296 m!578543))

(declare-fun m!578545 () Bool)

(assert (=> b!601299 m!578545))

(declare-fun m!578547 () Bool)

(assert (=> b!601304 m!578547))

(push 1)

