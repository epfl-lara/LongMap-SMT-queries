; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57248 () Bool)

(assert start!57248)

(declare-fun b!633432 () Bool)

(declare-fun e!362180 () Bool)

(declare-fun e!362177 () Bool)

(assert (=> b!633432 (= e!362180 e!362177)))

(declare-fun res!409600 () Bool)

(assert (=> b!633432 (=> (not res!409600) (not e!362177))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38158 0))(
  ( (array!38159 (arr!18309 (Array (_ BitVec 32) (_ BitVec 64))) (size!18673 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38158)

(assert (=> b!633432 (= res!409600 (= (select (store (arr!18309 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292768 () array!38158)

(assert (=> b!633432 (= lt!292768 (array!38159 (store (arr!18309 a!2986) i!1108 k!1786) (size!18673 a!2986)))))

(declare-fun b!633433 () Bool)

(declare-fun res!409592 () Bool)

(declare-fun e!362178 () Bool)

(assert (=> b!633433 (=> (not res!409592) (not e!362178))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633433 (= res!409592 (validKeyInArray!0 (select (arr!18309 a!2986) j!136)))))

(declare-fun b!633435 () Bool)

(declare-fun res!409588 () Bool)

(assert (=> b!633435 (=> (not res!409588) (not e!362180))))

(declare-datatypes ((List!12350 0))(
  ( (Nil!12347) (Cons!12346 (h!13391 (_ BitVec 64)) (t!18578 List!12350)) )
))
(declare-fun arrayNoDuplicates!0 (array!38158 (_ BitVec 32) List!12350) Bool)

(assert (=> b!633435 (= res!409588 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12347))))

(declare-fun b!633436 () Bool)

(declare-fun res!409601 () Bool)

(assert (=> b!633436 (=> (not res!409601) (not e!362180))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38158 (_ BitVec 32)) Bool)

(assert (=> b!633436 (= res!409601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633437 () Bool)

(declare-fun e!362181 () Bool)

(declare-fun e!362183 () Bool)

(assert (=> b!633437 (= e!362181 e!362183)))

(declare-fun res!409590 () Bool)

(assert (=> b!633437 (=> (not res!409590) (not e!362183))))

(declare-fun arrayContainsKey!0 (array!38158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633437 (= res!409590 (arrayContainsKey!0 lt!292768 (select (arr!18309 a!2986) j!136) j!136))))

(declare-fun b!633438 () Bool)

(declare-fun res!409591 () Bool)

(assert (=> b!633438 (=> (not res!409591) (not e!362178))))

(assert (=> b!633438 (= res!409591 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633439 () Bool)

(declare-fun res!409596 () Bool)

(assert (=> b!633439 (=> (not res!409596) (not e!362178))))

(assert (=> b!633439 (= res!409596 (and (= (size!18673 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18673 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18673 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633440 () Bool)

(declare-fun e!362182 () Bool)

(assert (=> b!633440 (= e!362182 e!362181)))

(declare-fun res!409599 () Bool)

(assert (=> b!633440 (=> res!409599 e!362181)))

(declare-fun lt!292765 () (_ BitVec 64))

(declare-fun lt!292766 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633440 (= res!409599 (or (not (= (select (arr!18309 a!2986) j!136) lt!292765)) (not (= (select (arr!18309 a!2986) j!136) lt!292766)) (bvsge j!136 index!984)))))

(declare-fun b!633441 () Bool)

(declare-datatypes ((Unit!21330 0))(
  ( (Unit!21331) )
))
(declare-fun e!362185 () Unit!21330)

(declare-fun Unit!21332 () Unit!21330)

(assert (=> b!633441 (= e!362185 Unit!21332)))

(declare-fun b!633442 () Bool)

(assert (=> b!633442 (= e!362178 e!362180)))

(declare-fun res!409593 () Bool)

(assert (=> b!633442 (=> (not res!409593) (not e!362180))))

(declare-datatypes ((SeekEntryResult!6749 0))(
  ( (MissingZero!6749 (index!29295 (_ BitVec 32))) (Found!6749 (index!29296 (_ BitVec 32))) (Intermediate!6749 (undefined!7561 Bool) (index!29297 (_ BitVec 32)) (x!58042 (_ BitVec 32))) (Undefined!6749) (MissingVacant!6749 (index!29298 (_ BitVec 32))) )
))
(declare-fun lt!292767 () SeekEntryResult!6749)

(assert (=> b!633442 (= res!409593 (or (= lt!292767 (MissingZero!6749 i!1108)) (= lt!292767 (MissingVacant!6749 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38158 (_ BitVec 32)) SeekEntryResult!6749)

(assert (=> b!633442 (= lt!292767 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!409587 () Bool)

(assert (=> start!57248 (=> (not res!409587) (not e!362178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57248 (= res!409587 (validMask!0 mask!3053))))

(assert (=> start!57248 e!362178))

(assert (=> start!57248 true))

(declare-fun array_inv!14105 (array!38158) Bool)

(assert (=> start!57248 (array_inv!14105 a!2986)))

(declare-fun b!633434 () Bool)

(declare-fun e!362186 () Bool)

(declare-fun lt!292762 () SeekEntryResult!6749)

(declare-fun lt!292764 () SeekEntryResult!6749)

(assert (=> b!633434 (= e!362186 (= lt!292762 lt!292764))))

(declare-fun b!633443 () Bool)

(declare-fun e!362187 () Bool)

(declare-fun e!362179 () Bool)

(assert (=> b!633443 (= e!362187 (not e!362179))))

(declare-fun res!409597 () Bool)

(assert (=> b!633443 (=> res!409597 e!362179)))

(declare-fun lt!292763 () SeekEntryResult!6749)

(assert (=> b!633443 (= res!409597 (not (= lt!292763 (Found!6749 index!984))))))

(declare-fun lt!292771 () Unit!21330)

(assert (=> b!633443 (= lt!292771 e!362185)))

(declare-fun c!72290 () Bool)

(assert (=> b!633443 (= c!72290 (= lt!292763 Undefined!6749))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38158 (_ BitVec 32)) SeekEntryResult!6749)

(assert (=> b!633443 (= lt!292763 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292765 lt!292768 mask!3053))))

(assert (=> b!633443 e!362186))

(declare-fun res!409595 () Bool)

(assert (=> b!633443 (=> (not res!409595) (not e!362186))))

(declare-fun lt!292769 () (_ BitVec 32))

(assert (=> b!633443 (= res!409595 (= lt!292764 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292769 vacantSpotIndex!68 lt!292765 lt!292768 mask!3053)))))

(assert (=> b!633443 (= lt!292764 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292769 vacantSpotIndex!68 (select (arr!18309 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633443 (= lt!292765 (select (store (arr!18309 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292770 () Unit!21330)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38158 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21330)

(assert (=> b!633443 (= lt!292770 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292769 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633443 (= lt!292769 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633444 () Bool)

(assert (=> b!633444 (= e!362179 true)))

(assert (=> b!633444 e!362182))

(declare-fun res!409586 () Bool)

(assert (=> b!633444 (=> (not res!409586) (not e!362182))))

(assert (=> b!633444 (= res!409586 (= lt!292766 (select (arr!18309 a!2986) j!136)))))

(assert (=> b!633444 (= lt!292766 (select (store (arr!18309 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!633445 () Bool)

(declare-fun res!409589 () Bool)

(assert (=> b!633445 (=> (not res!409589) (not e!362178))))

(assert (=> b!633445 (= res!409589 (validKeyInArray!0 k!1786))))

(declare-fun b!633446 () Bool)

(declare-fun Unit!21333 () Unit!21330)

(assert (=> b!633446 (= e!362185 Unit!21333)))

(assert (=> b!633446 false))

(declare-fun b!633447 () Bool)

(assert (=> b!633447 (= e!362177 e!362187)))

(declare-fun res!409594 () Bool)

(assert (=> b!633447 (=> (not res!409594) (not e!362187))))

(assert (=> b!633447 (= res!409594 (and (= lt!292762 (Found!6749 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18309 a!2986) index!984) (select (arr!18309 a!2986) j!136))) (not (= (select (arr!18309 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!633447 (= lt!292762 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18309 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633448 () Bool)

(assert (=> b!633448 (= e!362183 (arrayContainsKey!0 lt!292768 (select (arr!18309 a!2986) j!136) index!984))))

(declare-fun b!633449 () Bool)

(declare-fun res!409598 () Bool)

(assert (=> b!633449 (=> (not res!409598) (not e!362180))))

(assert (=> b!633449 (= res!409598 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18309 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57248 res!409587) b!633439))

(assert (= (and b!633439 res!409596) b!633433))

(assert (= (and b!633433 res!409592) b!633445))

(assert (= (and b!633445 res!409589) b!633438))

(assert (= (and b!633438 res!409591) b!633442))

(assert (= (and b!633442 res!409593) b!633436))

(assert (= (and b!633436 res!409601) b!633435))

(assert (= (and b!633435 res!409588) b!633449))

(assert (= (and b!633449 res!409598) b!633432))

(assert (= (and b!633432 res!409600) b!633447))

(assert (= (and b!633447 res!409594) b!633443))

(assert (= (and b!633443 res!409595) b!633434))

(assert (= (and b!633443 c!72290) b!633446))

(assert (= (and b!633443 (not c!72290)) b!633441))

(assert (= (and b!633443 (not res!409597)) b!633444))

(assert (= (and b!633444 res!409586) b!633440))

(assert (= (and b!633440 (not res!409599)) b!633437))

(assert (= (and b!633437 res!409590) b!633448))

(declare-fun m!608087 () Bool)

(assert (=> b!633443 m!608087))

(declare-fun m!608089 () Bool)

(assert (=> b!633443 m!608089))

(declare-fun m!608091 () Bool)

(assert (=> b!633443 m!608091))

(declare-fun m!608093 () Bool)

(assert (=> b!633443 m!608093))

(declare-fun m!608095 () Bool)

(assert (=> b!633443 m!608095))

(declare-fun m!608097 () Bool)

(assert (=> b!633443 m!608097))

(assert (=> b!633443 m!608095))

(declare-fun m!608099 () Bool)

(assert (=> b!633443 m!608099))

(declare-fun m!608101 () Bool)

(assert (=> b!633443 m!608101))

(declare-fun m!608103 () Bool)

(assert (=> b!633442 m!608103))

(declare-fun m!608105 () Bool)

(assert (=> b!633435 m!608105))

(declare-fun m!608107 () Bool)

(assert (=> b!633438 m!608107))

(assert (=> b!633448 m!608095))

(assert (=> b!633448 m!608095))

(declare-fun m!608109 () Bool)

(assert (=> b!633448 m!608109))

(declare-fun m!608111 () Bool)

(assert (=> start!57248 m!608111))

(declare-fun m!608113 () Bool)

(assert (=> start!57248 m!608113))

(declare-fun m!608115 () Bool)

(assert (=> b!633447 m!608115))

(assert (=> b!633447 m!608095))

(assert (=> b!633447 m!608095))

(declare-fun m!608117 () Bool)

(assert (=> b!633447 m!608117))

(declare-fun m!608119 () Bool)

(assert (=> b!633436 m!608119))

(assert (=> b!633440 m!608095))

(assert (=> b!633432 m!608091))

(declare-fun m!608121 () Bool)

(assert (=> b!633432 m!608121))

(assert (=> b!633444 m!608095))

(assert (=> b!633444 m!608091))

(declare-fun m!608123 () Bool)

(assert (=> b!633444 m!608123))

(declare-fun m!608125 () Bool)

(assert (=> b!633445 m!608125))

(declare-fun m!608127 () Bool)

(assert (=> b!633449 m!608127))

(assert (=> b!633433 m!608095))

(assert (=> b!633433 m!608095))

(declare-fun m!608129 () Bool)

(assert (=> b!633433 m!608129))

(assert (=> b!633437 m!608095))

(assert (=> b!633437 m!608095))

(declare-fun m!608131 () Bool)

(assert (=> b!633437 m!608131))

(push 1)

