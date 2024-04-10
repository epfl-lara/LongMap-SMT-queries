; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57346 () Bool)

(assert start!57346)

(declare-fun b!634745 () Bool)

(declare-fun res!410599 () Bool)

(declare-fun e!363001 () Bool)

(assert (=> b!634745 (=> (not res!410599) (not e!363001))))

(declare-datatypes ((array!38199 0))(
  ( (array!38200 (arr!18328 (Array (_ BitVec 32) (_ BitVec 64))) (size!18692 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38199)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634745 (= res!410599 (validKeyInArray!0 (select (arr!18328 a!2986) j!136)))))

(declare-fun b!634746 () Bool)

(declare-fun e!362996 () Bool)

(declare-fun e!362995 () Bool)

(assert (=> b!634746 (= e!362996 e!362995)))

(declare-fun res!410603 () Bool)

(assert (=> b!634746 (=> (not res!410603) (not e!362995))))

(declare-datatypes ((SeekEntryResult!6768 0))(
  ( (MissingZero!6768 (index!29374 (_ BitVec 32))) (Found!6768 (index!29375 (_ BitVec 32))) (Intermediate!6768 (undefined!7580 Bool) (index!29376 (_ BitVec 32)) (x!58118 (_ BitVec 32))) (Undefined!6768) (MissingVacant!6768 (index!29377 (_ BitVec 32))) )
))
(declare-fun lt!293452 () SeekEntryResult!6768)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634746 (= res!410603 (and (= lt!293452 (Found!6768 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18328 a!2986) index!984) (select (arr!18328 a!2986) j!136))) (not (= (select (arr!18328 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38199 (_ BitVec 32)) SeekEntryResult!6768)

(assert (=> b!634746 (= lt!293452 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18328 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634747 () Bool)

(declare-datatypes ((Unit!21406 0))(
  ( (Unit!21407) )
))
(declare-fun e!363000 () Unit!21406)

(declare-fun Unit!21408 () Unit!21406)

(assert (=> b!634747 (= e!363000 Unit!21408)))

(declare-fun b!634748 () Bool)

(declare-fun res!410598 () Bool)

(declare-fun e!363003 () Bool)

(assert (=> b!634748 (=> (not res!410598) (not e!363003))))

(declare-datatypes ((List!12369 0))(
  ( (Nil!12366) (Cons!12365 (h!13410 (_ BitVec 64)) (t!18597 List!12369)) )
))
(declare-fun arrayNoDuplicates!0 (array!38199 (_ BitVec 32) List!12369) Bool)

(assert (=> b!634748 (= res!410598 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12366))))

(declare-fun b!634749 () Bool)

(declare-fun e!362994 () Bool)

(assert (=> b!634749 (= e!362994 true)))

(declare-fun lt!293446 () array!38199)

(declare-fun arrayContainsKey!0 (array!38199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634749 (arrayContainsKey!0 lt!293446 (select (arr!18328 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293448 () Unit!21406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38199 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21406)

(assert (=> b!634749 (= lt!293448 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293446 (select (arr!18328 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!634750 () Bool)

(declare-fun res!410591 () Bool)

(assert (=> b!634750 (=> (not res!410591) (not e!363001))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634750 (= res!410591 (and (= (size!18692 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18692 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18692 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634751 () Bool)

(declare-fun res!410602 () Bool)

(assert (=> b!634751 (=> (not res!410602) (not e!363001))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!634751 (= res!410602 (validKeyInArray!0 k0!1786))))

(declare-fun e!362998 () Bool)

(declare-fun b!634752 () Bool)

(assert (=> b!634752 (= e!362998 (arrayContainsKey!0 lt!293446 (select (arr!18328 a!2986) j!136) index!984))))

(declare-fun res!410592 () Bool)

(assert (=> start!57346 (=> (not res!410592) (not e!363001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57346 (= res!410592 (validMask!0 mask!3053))))

(assert (=> start!57346 e!363001))

(assert (=> start!57346 true))

(declare-fun array_inv!14124 (array!38199) Bool)

(assert (=> start!57346 (array_inv!14124 a!2986)))

(declare-fun b!634753 () Bool)

(declare-fun e!362999 () Bool)

(declare-fun lt!293445 () SeekEntryResult!6768)

(assert (=> b!634753 (= e!362999 (= lt!293452 lt!293445))))

(declare-fun b!634754 () Bool)

(declare-fun e!363002 () Bool)

(assert (=> b!634754 (= e!363002 e!362998)))

(declare-fun res!410597 () Bool)

(assert (=> b!634754 (=> (not res!410597) (not e!362998))))

(assert (=> b!634754 (= res!410597 (arrayContainsKey!0 lt!293446 (select (arr!18328 a!2986) j!136) j!136))))

(declare-fun b!634755 () Bool)

(declare-fun res!410589 () Bool)

(assert (=> b!634755 (=> (not res!410589) (not e!363003))))

(assert (=> b!634755 (= res!410589 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18328 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634756 () Bool)

(declare-fun res!410590 () Bool)

(assert (=> b!634756 (=> (not res!410590) (not e!363001))))

(assert (=> b!634756 (= res!410590 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634757 () Bool)

(declare-fun Unit!21409 () Unit!21406)

(assert (=> b!634757 (= e!363000 Unit!21409)))

(assert (=> b!634757 false))

(declare-fun b!634758 () Bool)

(declare-fun e!362993 () Bool)

(assert (=> b!634758 (= e!362993 e!362994)))

(declare-fun res!410594 () Bool)

(assert (=> b!634758 (=> res!410594 e!362994)))

(declare-fun lt!293450 () (_ BitVec 64))

(declare-fun lt!293449 () (_ BitVec 64))

(assert (=> b!634758 (= res!410594 (or (not (= (select (arr!18328 a!2986) j!136) lt!293449)) (not (= (select (arr!18328 a!2986) j!136) lt!293450)) (bvsge j!136 index!984)))))

(declare-fun e!362997 () Bool)

(assert (=> b!634758 e!362997))

(declare-fun res!410601 () Bool)

(assert (=> b!634758 (=> (not res!410601) (not e!362997))))

(assert (=> b!634758 (= res!410601 (= lt!293450 (select (arr!18328 a!2986) j!136)))))

(assert (=> b!634758 (= lt!293450 (select (store (arr!18328 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!634759 () Bool)

(assert (=> b!634759 (= e!363003 e!362996)))

(declare-fun res!410587 () Bool)

(assert (=> b!634759 (=> (not res!410587) (not e!362996))))

(assert (=> b!634759 (= res!410587 (= (select (store (arr!18328 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634759 (= lt!293446 (array!38200 (store (arr!18328 a!2986) i!1108 k0!1786) (size!18692 a!2986)))))

(declare-fun b!634760 () Bool)

(assert (=> b!634760 (= e!362995 (not e!362993))))

(declare-fun res!410596 () Bool)

(assert (=> b!634760 (=> res!410596 e!362993)))

(declare-fun lt!293451 () SeekEntryResult!6768)

(assert (=> b!634760 (= res!410596 (not (= lt!293451 (Found!6768 index!984))))))

(declare-fun lt!293454 () Unit!21406)

(assert (=> b!634760 (= lt!293454 e!363000)))

(declare-fun c!72446 () Bool)

(assert (=> b!634760 (= c!72446 (= lt!293451 Undefined!6768))))

(assert (=> b!634760 (= lt!293451 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293449 lt!293446 mask!3053))))

(assert (=> b!634760 e!362999))

(declare-fun res!410595 () Bool)

(assert (=> b!634760 (=> (not res!410595) (not e!362999))))

(declare-fun lt!293455 () (_ BitVec 32))

(assert (=> b!634760 (= res!410595 (= lt!293445 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293455 vacantSpotIndex!68 lt!293449 lt!293446 mask!3053)))))

(assert (=> b!634760 (= lt!293445 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293455 vacantSpotIndex!68 (select (arr!18328 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634760 (= lt!293449 (select (store (arr!18328 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293447 () Unit!21406)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38199 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21406)

(assert (=> b!634760 (= lt!293447 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293455 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634760 (= lt!293455 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634761 () Bool)

(assert (=> b!634761 (= e!362997 e!363002)))

(declare-fun res!410588 () Bool)

(assert (=> b!634761 (=> res!410588 e!363002)))

(assert (=> b!634761 (= res!410588 (or (not (= (select (arr!18328 a!2986) j!136) lt!293449)) (not (= (select (arr!18328 a!2986) j!136) lt!293450)) (bvsge j!136 index!984)))))

(declare-fun b!634762 () Bool)

(declare-fun res!410593 () Bool)

(assert (=> b!634762 (=> (not res!410593) (not e!363003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38199 (_ BitVec 32)) Bool)

(assert (=> b!634762 (= res!410593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634763 () Bool)

(assert (=> b!634763 (= e!363001 e!363003)))

(declare-fun res!410600 () Bool)

(assert (=> b!634763 (=> (not res!410600) (not e!363003))))

(declare-fun lt!293453 () SeekEntryResult!6768)

(assert (=> b!634763 (= res!410600 (or (= lt!293453 (MissingZero!6768 i!1108)) (= lt!293453 (MissingVacant!6768 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38199 (_ BitVec 32)) SeekEntryResult!6768)

(assert (=> b!634763 (= lt!293453 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!57346 res!410592) b!634750))

(assert (= (and b!634750 res!410591) b!634745))

(assert (= (and b!634745 res!410599) b!634751))

(assert (= (and b!634751 res!410602) b!634756))

(assert (= (and b!634756 res!410590) b!634763))

(assert (= (and b!634763 res!410600) b!634762))

(assert (= (and b!634762 res!410593) b!634748))

(assert (= (and b!634748 res!410598) b!634755))

(assert (= (and b!634755 res!410589) b!634759))

(assert (= (and b!634759 res!410587) b!634746))

(assert (= (and b!634746 res!410603) b!634760))

(assert (= (and b!634760 res!410595) b!634753))

(assert (= (and b!634760 c!72446) b!634757))

(assert (= (and b!634760 (not c!72446)) b!634747))

(assert (= (and b!634760 (not res!410596)) b!634758))

(assert (= (and b!634758 res!410601) b!634761))

(assert (= (and b!634761 (not res!410588)) b!634754))

(assert (= (and b!634754 res!410597) b!634752))

(assert (= (and b!634758 (not res!410594)) b!634749))

(declare-fun m!609193 () Bool)

(assert (=> b!634758 m!609193))

(declare-fun m!609195 () Bool)

(assert (=> b!634758 m!609195))

(declare-fun m!609197 () Bool)

(assert (=> b!634758 m!609197))

(assert (=> b!634754 m!609193))

(assert (=> b!634754 m!609193))

(declare-fun m!609199 () Bool)

(assert (=> b!634754 m!609199))

(assert (=> b!634759 m!609195))

(declare-fun m!609201 () Bool)

(assert (=> b!634759 m!609201))

(assert (=> b!634761 m!609193))

(declare-fun m!609203 () Bool)

(assert (=> b!634751 m!609203))

(declare-fun m!609205 () Bool)

(assert (=> b!634763 m!609205))

(assert (=> b!634749 m!609193))

(assert (=> b!634749 m!609193))

(declare-fun m!609207 () Bool)

(assert (=> b!634749 m!609207))

(assert (=> b!634749 m!609193))

(declare-fun m!609209 () Bool)

(assert (=> b!634749 m!609209))

(declare-fun m!609211 () Bool)

(assert (=> b!634762 m!609211))

(declare-fun m!609213 () Bool)

(assert (=> start!57346 m!609213))

(declare-fun m!609215 () Bool)

(assert (=> start!57346 m!609215))

(assert (=> b!634745 m!609193))

(assert (=> b!634745 m!609193))

(declare-fun m!609217 () Bool)

(assert (=> b!634745 m!609217))

(declare-fun m!609219 () Bool)

(assert (=> b!634748 m!609219))

(assert (=> b!634752 m!609193))

(assert (=> b!634752 m!609193))

(declare-fun m!609221 () Bool)

(assert (=> b!634752 m!609221))

(declare-fun m!609223 () Bool)

(assert (=> b!634746 m!609223))

(assert (=> b!634746 m!609193))

(assert (=> b!634746 m!609193))

(declare-fun m!609225 () Bool)

(assert (=> b!634746 m!609225))

(declare-fun m!609227 () Bool)

(assert (=> b!634756 m!609227))

(declare-fun m!609229 () Bool)

(assert (=> b!634755 m!609229))

(declare-fun m!609231 () Bool)

(assert (=> b!634760 m!609231))

(declare-fun m!609233 () Bool)

(assert (=> b!634760 m!609233))

(assert (=> b!634760 m!609193))

(assert (=> b!634760 m!609195))

(declare-fun m!609235 () Bool)

(assert (=> b!634760 m!609235))

(declare-fun m!609237 () Bool)

(assert (=> b!634760 m!609237))

(assert (=> b!634760 m!609193))

(declare-fun m!609239 () Bool)

(assert (=> b!634760 m!609239))

(declare-fun m!609241 () Bool)

(assert (=> b!634760 m!609241))

(check-sat (not b!634752) (not b!634756) (not start!57346) (not b!634748) (not b!634751) (not b!634763) (not b!634745) (not b!634749) (not b!634746) (not b!634760) (not b!634754) (not b!634762))
(check-sat)
