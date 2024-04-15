; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53976 () Bool)

(assert start!53976)

(declare-fun b!589637 () Bool)

(declare-fun e!336593 () Bool)

(declare-datatypes ((SeekEntryResult!6127 0))(
  ( (MissingZero!6127 (index!26738 (_ BitVec 32))) (Found!6127 (index!26739 (_ BitVec 32))) (Intermediate!6127 (undefined!6939 Bool) (index!26740 (_ BitVec 32)) (x!55536 (_ BitVec 32))) (Undefined!6127) (MissingVacant!6127 (index!26741 (_ BitVec 32))) )
))
(declare-fun lt!267378 () SeekEntryResult!6127)

(declare-fun lt!267377 () SeekEntryResult!6127)

(assert (=> b!589637 (= e!336593 (= lt!267378 lt!267377))))

(declare-fun b!589638 () Bool)

(declare-fun res!377233 () Bool)

(declare-fun e!336599 () Bool)

(assert (=> b!589638 (=> (not res!377233) (not e!336599))))

(declare-datatypes ((array!36834 0))(
  ( (array!36835 (arr!17690 (Array (_ BitVec 32) (_ BitVec 64))) (size!18055 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36834)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36834 (_ BitVec 32)) Bool)

(assert (=> b!589638 (= res!377233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589639 () Bool)

(declare-fun res!377242 () Bool)

(declare-fun e!336594 () Bool)

(assert (=> b!589639 (=> (not res!377242) (not e!336594))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589639 (= res!377242 (validKeyInArray!0 (select (arr!17690 a!2986) j!136)))))

(declare-fun b!589640 () Bool)

(declare-fun res!377234 () Bool)

(assert (=> b!589640 (=> (not res!377234) (not e!336599))))

(declare-datatypes ((List!11770 0))(
  ( (Nil!11767) (Cons!11766 (h!12811 (_ BitVec 64)) (t!17989 List!11770)) )
))
(declare-fun arrayNoDuplicates!0 (array!36834 (_ BitVec 32) List!11770) Bool)

(assert (=> b!589640 (= res!377234 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11767))))

(declare-fun b!589641 () Bool)

(declare-fun res!377231 () Bool)

(assert (=> b!589641 (=> (not res!377231) (not e!336599))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589641 (= res!377231 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17690 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!377241 () Bool)

(assert (=> start!53976 (=> (not res!377241) (not e!336594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53976 (= res!377241 (validMask!0 mask!3053))))

(assert (=> start!53976 e!336594))

(assert (=> start!53976 true))

(declare-fun array_inv!13573 (array!36834) Bool)

(assert (=> start!53976 (array_inv!13573 a!2986)))

(declare-fun b!589642 () Bool)

(declare-datatypes ((Unit!18420 0))(
  ( (Unit!18421) )
))
(declare-fun e!336596 () Unit!18420)

(declare-fun Unit!18422 () Unit!18420)

(assert (=> b!589642 (= e!336596 Unit!18422)))

(assert (=> b!589642 false))

(declare-fun b!589643 () Bool)

(declare-fun res!377238 () Bool)

(assert (=> b!589643 (=> (not res!377238) (not e!336594))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589643 (= res!377238 (and (= (size!18055 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18055 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18055 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!267384 () (_ BitVec 64))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun e!336600 () Bool)

(declare-fun b!589644 () Bool)

(assert (=> b!589644 (= e!336600 (or (not (= (select (arr!17690 a!2986) j!136) lt!267384)) (not (= (select (arr!17690 a!2986) j!136) (select (store (arr!17690 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984) (bvslt (size!18055 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!589644 (= (select (store (arr!17690 a!2986) i!1108 k0!1786) index!984) (select (arr!17690 a!2986) j!136))))

(declare-fun b!589645 () Bool)

(assert (=> b!589645 (= e!336594 e!336599)))

(declare-fun res!377240 () Bool)

(assert (=> b!589645 (=> (not res!377240) (not e!336599))))

(declare-fun lt!267383 () SeekEntryResult!6127)

(assert (=> b!589645 (= res!377240 (or (= lt!267383 (MissingZero!6127 i!1108)) (= lt!267383 (MissingVacant!6127 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36834 (_ BitVec 32)) SeekEntryResult!6127)

(assert (=> b!589645 (= lt!267383 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589646 () Bool)

(declare-fun res!377232 () Bool)

(assert (=> b!589646 (=> (not res!377232) (not e!336594))))

(declare-fun arrayContainsKey!0 (array!36834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589646 (= res!377232 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589647 () Bool)

(declare-fun res!377239 () Bool)

(assert (=> b!589647 (=> (not res!377239) (not e!336594))))

(assert (=> b!589647 (= res!377239 (validKeyInArray!0 k0!1786))))

(declare-fun b!589648 () Bool)

(declare-fun e!336595 () Bool)

(assert (=> b!589648 (= e!336595 (not e!336600))))

(declare-fun res!377235 () Bool)

(assert (=> b!589648 (=> res!377235 e!336600)))

(declare-fun lt!267381 () SeekEntryResult!6127)

(assert (=> b!589648 (= res!377235 (not (= lt!267381 (Found!6127 index!984))))))

(declare-fun lt!267380 () Unit!18420)

(assert (=> b!589648 (= lt!267380 e!336596)))

(declare-fun c!66570 () Bool)

(assert (=> b!589648 (= c!66570 (= lt!267381 Undefined!6127))))

(declare-fun lt!267382 () array!36834)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36834 (_ BitVec 32)) SeekEntryResult!6127)

(assert (=> b!589648 (= lt!267381 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267384 lt!267382 mask!3053))))

(assert (=> b!589648 e!336593))

(declare-fun res!377243 () Bool)

(assert (=> b!589648 (=> (not res!377243) (not e!336593))))

(declare-fun lt!267385 () (_ BitVec 32))

(assert (=> b!589648 (= res!377243 (= lt!267377 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267385 vacantSpotIndex!68 lt!267384 lt!267382 mask!3053)))))

(assert (=> b!589648 (= lt!267377 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267385 vacantSpotIndex!68 (select (arr!17690 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589648 (= lt!267384 (select (store (arr!17690 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267379 () Unit!18420)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36834 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18420)

(assert (=> b!589648 (= lt!267379 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267385 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589648 (= lt!267385 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589649 () Bool)

(declare-fun e!336597 () Bool)

(assert (=> b!589649 (= e!336599 e!336597)))

(declare-fun res!377237 () Bool)

(assert (=> b!589649 (=> (not res!377237) (not e!336597))))

(assert (=> b!589649 (= res!377237 (= (select (store (arr!17690 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589649 (= lt!267382 (array!36835 (store (arr!17690 a!2986) i!1108 k0!1786) (size!18055 a!2986)))))

(declare-fun b!589650 () Bool)

(declare-fun Unit!18423 () Unit!18420)

(assert (=> b!589650 (= e!336596 Unit!18423)))

(declare-fun b!589651 () Bool)

(assert (=> b!589651 (= e!336597 e!336595)))

(declare-fun res!377236 () Bool)

(assert (=> b!589651 (=> (not res!377236) (not e!336595))))

(assert (=> b!589651 (= res!377236 (and (= lt!267378 (Found!6127 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17690 a!2986) index!984) (select (arr!17690 a!2986) j!136))) (not (= (select (arr!17690 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589651 (= lt!267378 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17690 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53976 res!377241) b!589643))

(assert (= (and b!589643 res!377238) b!589639))

(assert (= (and b!589639 res!377242) b!589647))

(assert (= (and b!589647 res!377239) b!589646))

(assert (= (and b!589646 res!377232) b!589645))

(assert (= (and b!589645 res!377240) b!589638))

(assert (= (and b!589638 res!377233) b!589640))

(assert (= (and b!589640 res!377234) b!589641))

(assert (= (and b!589641 res!377231) b!589649))

(assert (= (and b!589649 res!377237) b!589651))

(assert (= (and b!589651 res!377236) b!589648))

(assert (= (and b!589648 res!377243) b!589637))

(assert (= (and b!589648 c!66570) b!589642))

(assert (= (and b!589648 (not c!66570)) b!589650))

(assert (= (and b!589648 (not res!377235)) b!589644))

(declare-fun m!567619 () Bool)

(assert (=> b!589646 m!567619))

(declare-fun m!567621 () Bool)

(assert (=> b!589640 m!567621))

(declare-fun m!567623 () Bool)

(assert (=> b!589645 m!567623))

(declare-fun m!567625 () Bool)

(assert (=> b!589638 m!567625))

(declare-fun m!567627 () Bool)

(assert (=> b!589648 m!567627))

(declare-fun m!567629 () Bool)

(assert (=> b!589648 m!567629))

(declare-fun m!567631 () Bool)

(assert (=> b!589648 m!567631))

(declare-fun m!567633 () Bool)

(assert (=> b!589648 m!567633))

(declare-fun m!567635 () Bool)

(assert (=> b!589648 m!567635))

(assert (=> b!589648 m!567633))

(declare-fun m!567637 () Bool)

(assert (=> b!589648 m!567637))

(declare-fun m!567639 () Bool)

(assert (=> b!589648 m!567639))

(declare-fun m!567641 () Bool)

(assert (=> b!589648 m!567641))

(declare-fun m!567643 () Bool)

(assert (=> b!589647 m!567643))

(assert (=> b!589649 m!567635))

(declare-fun m!567645 () Bool)

(assert (=> b!589649 m!567645))

(declare-fun m!567647 () Bool)

(assert (=> start!53976 m!567647))

(declare-fun m!567649 () Bool)

(assert (=> start!53976 m!567649))

(assert (=> b!589639 m!567633))

(assert (=> b!589639 m!567633))

(declare-fun m!567651 () Bool)

(assert (=> b!589639 m!567651))

(assert (=> b!589644 m!567633))

(assert (=> b!589644 m!567635))

(declare-fun m!567653 () Bool)

(assert (=> b!589644 m!567653))

(declare-fun m!567655 () Bool)

(assert (=> b!589651 m!567655))

(assert (=> b!589651 m!567633))

(assert (=> b!589651 m!567633))

(declare-fun m!567657 () Bool)

(assert (=> b!589651 m!567657))

(declare-fun m!567659 () Bool)

(assert (=> b!589641 m!567659))

(check-sat (not b!589646) (not b!589645) (not start!53976) (not b!589648) (not b!589651) (not b!589640) (not b!589647) (not b!589638) (not b!589639))
(check-sat)
(get-model)

(declare-fun b!589754 () Bool)

(declare-fun e!336657 () SeekEntryResult!6127)

(declare-fun e!336655 () SeekEntryResult!6127)

(assert (=> b!589754 (= e!336657 e!336655)))

(declare-fun lt!267446 () (_ BitVec 64))

(declare-fun lt!267447 () SeekEntryResult!6127)

(assert (=> b!589754 (= lt!267446 (select (arr!17690 a!2986) (index!26740 lt!267447)))))

(declare-fun c!66584 () Bool)

(assert (=> b!589754 (= c!66584 (= lt!267446 k0!1786))))

(declare-fun b!589755 () Bool)

(declare-fun e!336656 () SeekEntryResult!6127)

(assert (=> b!589755 (= e!336656 (MissingZero!6127 (index!26740 lt!267447)))))

(declare-fun b!589756 () Bool)

(assert (=> b!589756 (= e!336657 Undefined!6127)))

(declare-fun d!85813 () Bool)

(declare-fun lt!267448 () SeekEntryResult!6127)

(get-info :version)

(assert (=> d!85813 (and (or ((_ is Undefined!6127) lt!267448) (not ((_ is Found!6127) lt!267448)) (and (bvsge (index!26739 lt!267448) #b00000000000000000000000000000000) (bvslt (index!26739 lt!267448) (size!18055 a!2986)))) (or ((_ is Undefined!6127) lt!267448) ((_ is Found!6127) lt!267448) (not ((_ is MissingZero!6127) lt!267448)) (and (bvsge (index!26738 lt!267448) #b00000000000000000000000000000000) (bvslt (index!26738 lt!267448) (size!18055 a!2986)))) (or ((_ is Undefined!6127) lt!267448) ((_ is Found!6127) lt!267448) ((_ is MissingZero!6127) lt!267448) (not ((_ is MissingVacant!6127) lt!267448)) (and (bvsge (index!26741 lt!267448) #b00000000000000000000000000000000) (bvslt (index!26741 lt!267448) (size!18055 a!2986)))) (or ((_ is Undefined!6127) lt!267448) (ite ((_ is Found!6127) lt!267448) (= (select (arr!17690 a!2986) (index!26739 lt!267448)) k0!1786) (ite ((_ is MissingZero!6127) lt!267448) (= (select (arr!17690 a!2986) (index!26738 lt!267448)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6127) lt!267448) (= (select (arr!17690 a!2986) (index!26741 lt!267448)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85813 (= lt!267448 e!336657)))

(declare-fun c!66583 () Bool)

(assert (=> d!85813 (= c!66583 (and ((_ is Intermediate!6127) lt!267447) (undefined!6939 lt!267447)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36834 (_ BitVec 32)) SeekEntryResult!6127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85813 (= lt!267447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85813 (validMask!0 mask!3053)))

(assert (=> d!85813 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!267448)))

(declare-fun b!589757 () Bool)

(assert (=> b!589757 (= e!336656 (seekKeyOrZeroReturnVacant!0 (x!55536 lt!267447) (index!26740 lt!267447) (index!26740 lt!267447) k0!1786 a!2986 mask!3053))))

(declare-fun b!589758 () Bool)

(assert (=> b!589758 (= e!336655 (Found!6127 (index!26740 lt!267447)))))

(declare-fun b!589759 () Bool)

(declare-fun c!66585 () Bool)

(assert (=> b!589759 (= c!66585 (= lt!267446 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589759 (= e!336655 e!336656)))

(assert (= (and d!85813 c!66583) b!589756))

(assert (= (and d!85813 (not c!66583)) b!589754))

(assert (= (and b!589754 c!66584) b!589758))

(assert (= (and b!589754 (not c!66584)) b!589759))

(assert (= (and b!589759 c!66585) b!589755))

(assert (= (and b!589759 (not c!66585)) b!589757))

(declare-fun m!567745 () Bool)

(assert (=> b!589754 m!567745))

(declare-fun m!567747 () Bool)

(assert (=> d!85813 m!567747))

(declare-fun m!567749 () Bool)

(assert (=> d!85813 m!567749))

(declare-fun m!567751 () Bool)

(assert (=> d!85813 m!567751))

(assert (=> d!85813 m!567647))

(declare-fun m!567753 () Bool)

(assert (=> d!85813 m!567753))

(assert (=> d!85813 m!567753))

(declare-fun m!567755 () Bool)

(assert (=> d!85813 m!567755))

(declare-fun m!567757 () Bool)

(assert (=> b!589757 m!567757))

(assert (=> b!589645 d!85813))

(declare-fun d!85815 () Bool)

(assert (=> d!85815 (= (validKeyInArray!0 (select (arr!17690 a!2986) j!136)) (and (not (= (select (arr!17690 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17690 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!589639 d!85815))

(declare-fun d!85817 () Bool)

(assert (=> d!85817 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53976 d!85817))

(declare-fun d!85821 () Bool)

(assert (=> d!85821 (= (array_inv!13573 a!2986) (bvsge (size!18055 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53976 d!85821))

(declare-fun d!85825 () Bool)

(declare-fun res!377326 () Bool)

(declare-fun e!336662 () Bool)

(assert (=> d!85825 (=> res!377326 e!336662)))

(assert (=> d!85825 (= res!377326 (= (select (arr!17690 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85825 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!336662)))

(declare-fun b!589764 () Bool)

(declare-fun e!336663 () Bool)

(assert (=> b!589764 (= e!336662 e!336663)))

(declare-fun res!377327 () Bool)

(assert (=> b!589764 (=> (not res!377327) (not e!336663))))

(assert (=> b!589764 (= res!377327 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18055 a!2986)))))

(declare-fun b!589765 () Bool)

(assert (=> b!589765 (= e!336663 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85825 (not res!377326)) b!589764))

(assert (= (and b!589764 res!377327) b!589765))

(declare-fun m!567759 () Bool)

(assert (=> d!85825 m!567759))

(declare-fun m!567761 () Bool)

(assert (=> b!589765 m!567761))

(assert (=> b!589646 d!85825))

(declare-fun b!589814 () Bool)

(declare-fun c!66598 () Bool)

(declare-fun lt!267453 () (_ BitVec 64))

(assert (=> b!589814 (= c!66598 (= lt!267453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!336700 () SeekEntryResult!6127)

(declare-fun e!336702 () SeekEntryResult!6127)

(assert (=> b!589814 (= e!336700 e!336702)))

(declare-fun b!589815 () Bool)

(assert (=> b!589815 (= e!336702 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17690 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589816 () Bool)

(assert (=> b!589816 (= e!336702 (MissingVacant!6127 vacantSpotIndex!68))))

(declare-fun lt!267454 () SeekEntryResult!6127)

(declare-fun d!85827 () Bool)

(assert (=> d!85827 (and (or ((_ is Undefined!6127) lt!267454) (not ((_ is Found!6127) lt!267454)) (and (bvsge (index!26739 lt!267454) #b00000000000000000000000000000000) (bvslt (index!26739 lt!267454) (size!18055 a!2986)))) (or ((_ is Undefined!6127) lt!267454) ((_ is Found!6127) lt!267454) (not ((_ is MissingVacant!6127) lt!267454)) (not (= (index!26741 lt!267454) vacantSpotIndex!68)) (and (bvsge (index!26741 lt!267454) #b00000000000000000000000000000000) (bvslt (index!26741 lt!267454) (size!18055 a!2986)))) (or ((_ is Undefined!6127) lt!267454) (ite ((_ is Found!6127) lt!267454) (= (select (arr!17690 a!2986) (index!26739 lt!267454)) (select (arr!17690 a!2986) j!136)) (and ((_ is MissingVacant!6127) lt!267454) (= (index!26741 lt!267454) vacantSpotIndex!68) (= (select (arr!17690 a!2986) (index!26741 lt!267454)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!336701 () SeekEntryResult!6127)

(assert (=> d!85827 (= lt!267454 e!336701)))

(declare-fun c!66600 () Bool)

(assert (=> d!85827 (= c!66600 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!85827 (= lt!267453 (select (arr!17690 a!2986) index!984))))

(assert (=> d!85827 (validMask!0 mask!3053)))

(assert (=> d!85827 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17690 a!2986) j!136) a!2986 mask!3053) lt!267454)))

(declare-fun b!589817 () Bool)

(assert (=> b!589817 (= e!336701 e!336700)))

(declare-fun c!66599 () Bool)

(assert (=> b!589817 (= c!66599 (= lt!267453 (select (arr!17690 a!2986) j!136)))))

(declare-fun b!589818 () Bool)

(assert (=> b!589818 (= e!336701 Undefined!6127)))

(declare-fun b!589819 () Bool)

(assert (=> b!589819 (= e!336700 (Found!6127 index!984))))

(assert (= (and d!85827 c!66600) b!589818))

(assert (= (and d!85827 (not c!66600)) b!589817))

(assert (= (and b!589817 c!66599) b!589819))

(assert (= (and b!589817 (not c!66599)) b!589814))

(assert (= (and b!589814 c!66598) b!589816))

(assert (= (and b!589814 (not c!66598)) b!589815))

(assert (=> b!589815 m!567629))

(assert (=> b!589815 m!567629))

(assert (=> b!589815 m!567633))

(declare-fun m!567781 () Bool)

(assert (=> b!589815 m!567781))

(declare-fun m!567783 () Bool)

(assert (=> d!85827 m!567783))

(declare-fun m!567785 () Bool)

(assert (=> d!85827 m!567785))

(assert (=> d!85827 m!567655))

(assert (=> d!85827 m!567647))

(assert (=> b!589651 d!85827))

(declare-fun bm!32776 () Bool)

(declare-fun call!32779 () Bool)

(declare-fun c!66603 () Bool)

(assert (=> bm!32776 (= call!32779 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66603 (Cons!11766 (select (arr!17690 a!2986) #b00000000000000000000000000000000) Nil!11767) Nil!11767)))))

(declare-fun b!589830 () Bool)

(declare-fun e!336711 () Bool)

(declare-fun e!336713 () Bool)

(assert (=> b!589830 (= e!336711 e!336713)))

(declare-fun res!377360 () Bool)

(assert (=> b!589830 (=> (not res!377360) (not e!336713))))

(declare-fun e!336714 () Bool)

(assert (=> b!589830 (= res!377360 (not e!336714))))

(declare-fun res!377358 () Bool)

(assert (=> b!589830 (=> (not res!377358) (not e!336714))))

(assert (=> b!589830 (= res!377358 (validKeyInArray!0 (select (arr!17690 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!589831 () Bool)

(declare-fun contains!2889 (List!11770 (_ BitVec 64)) Bool)

(assert (=> b!589831 (= e!336714 (contains!2889 Nil!11767 (select (arr!17690 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!85839 () Bool)

(declare-fun res!377359 () Bool)

(assert (=> d!85839 (=> res!377359 e!336711)))

(assert (=> d!85839 (= res!377359 (bvsge #b00000000000000000000000000000000 (size!18055 a!2986)))))

(assert (=> d!85839 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11767) e!336711)))

(declare-fun b!589832 () Bool)

(declare-fun e!336712 () Bool)

(assert (=> b!589832 (= e!336712 call!32779)))

(declare-fun b!589833 () Bool)

(assert (=> b!589833 (= e!336712 call!32779)))

(declare-fun b!589834 () Bool)

(assert (=> b!589834 (= e!336713 e!336712)))

(assert (=> b!589834 (= c!66603 (validKeyInArray!0 (select (arr!17690 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!85839 (not res!377359)) b!589830))

(assert (= (and b!589830 res!377358) b!589831))

(assert (= (and b!589830 res!377360) b!589834))

(assert (= (and b!589834 c!66603) b!589832))

(assert (= (and b!589834 (not c!66603)) b!589833))

(assert (= (or b!589832 b!589833) bm!32776))

(assert (=> bm!32776 m!567759))

(declare-fun m!567787 () Bool)

(assert (=> bm!32776 m!567787))

(assert (=> b!589830 m!567759))

(assert (=> b!589830 m!567759))

(declare-fun m!567789 () Bool)

(assert (=> b!589830 m!567789))

(assert (=> b!589831 m!567759))

(assert (=> b!589831 m!567759))

(declare-fun m!567791 () Bool)

(assert (=> b!589831 m!567791))

(assert (=> b!589834 m!567759))

(assert (=> b!589834 m!567759))

(assert (=> b!589834 m!567789))

(assert (=> b!589640 d!85839))

(declare-fun d!85847 () Bool)

(assert (=> d!85847 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!589647 d!85847))

(declare-fun d!85849 () Bool)

(declare-fun res!377365 () Bool)

(declare-fun e!336738 () Bool)

(assert (=> d!85849 (=> res!377365 e!336738)))

(assert (=> d!85849 (= res!377365 (bvsge #b00000000000000000000000000000000 (size!18055 a!2986)))))

(assert (=> d!85849 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!336738)))

(declare-fun b!589873 () Bool)

(declare-fun e!336736 () Bool)

(assert (=> b!589873 (= e!336738 e!336736)))

(declare-fun c!66621 () Bool)

(assert (=> b!589873 (= c!66621 (validKeyInArray!0 (select (arr!17690 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!589874 () Bool)

(declare-fun e!336737 () Bool)

(assert (=> b!589874 (= e!336736 e!336737)))

(declare-fun lt!267473 () (_ BitVec 64))

(assert (=> b!589874 (= lt!267473 (select (arr!17690 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!267474 () Unit!18420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36834 (_ BitVec 64) (_ BitVec 32)) Unit!18420)

(assert (=> b!589874 (= lt!267474 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!267473 #b00000000000000000000000000000000))))

(assert (=> b!589874 (arrayContainsKey!0 a!2986 lt!267473 #b00000000000000000000000000000000)))

(declare-fun lt!267475 () Unit!18420)

(assert (=> b!589874 (= lt!267475 lt!267474)))

(declare-fun res!377366 () Bool)

(assert (=> b!589874 (= res!377366 (= (seekEntryOrOpen!0 (select (arr!17690 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6127 #b00000000000000000000000000000000)))))

(assert (=> b!589874 (=> (not res!377366) (not e!336737))))

(declare-fun bm!32779 () Bool)

(declare-fun call!32782 () Bool)

(assert (=> bm!32779 (= call!32782 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!589875 () Bool)

(assert (=> b!589875 (= e!336737 call!32782)))

(declare-fun b!589876 () Bool)

(assert (=> b!589876 (= e!336736 call!32782)))

(assert (= (and d!85849 (not res!377365)) b!589873))

(assert (= (and b!589873 c!66621) b!589874))

(assert (= (and b!589873 (not c!66621)) b!589876))

(assert (= (and b!589874 res!377366) b!589875))

(assert (= (or b!589875 b!589876) bm!32779))

(assert (=> b!589873 m!567759))

(assert (=> b!589873 m!567759))

(assert (=> b!589873 m!567789))

(assert (=> b!589874 m!567759))

(declare-fun m!567803 () Bool)

(assert (=> b!589874 m!567803))

(declare-fun m!567805 () Bool)

(assert (=> b!589874 m!567805))

(assert (=> b!589874 m!567759))

(declare-fun m!567807 () Bool)

(assert (=> b!589874 m!567807))

(declare-fun m!567809 () Bool)

(assert (=> bm!32779 m!567809))

(assert (=> b!589638 d!85849))

(declare-fun d!85853 () Bool)

(declare-fun e!336762 () Bool)

(assert (=> d!85853 e!336762))

(declare-fun res!377372 () Bool)

(assert (=> d!85853 (=> (not res!377372) (not e!336762))))

(assert (=> d!85853 (= res!377372 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18055 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18055 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18055 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18055 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18055 a!2986))))))

(declare-fun lt!267497 () Unit!18420)

(declare-fun choose!9 (array!36834 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18420)

(assert (=> d!85853 (= lt!267497 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267385 vacantSpotIndex!68 mask!3053))))

(assert (=> d!85853 (validMask!0 mask!3053)))

(assert (=> d!85853 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267385 vacantSpotIndex!68 mask!3053) lt!267497)))

(declare-fun b!589918 () Bool)

(assert (=> b!589918 (= e!336762 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267385 vacantSpotIndex!68 (select (arr!17690 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267385 vacantSpotIndex!68 (select (store (arr!17690 a!2986) i!1108 k0!1786) j!136) (array!36835 (store (arr!17690 a!2986) i!1108 k0!1786) (size!18055 a!2986)) mask!3053)))))

(assert (= (and d!85853 res!377372) b!589918))

(declare-fun m!567853 () Bool)

(assert (=> d!85853 m!567853))

(assert (=> d!85853 m!567647))

(assert (=> b!589918 m!567633))

(assert (=> b!589918 m!567637))

(assert (=> b!589918 m!567633))

(assert (=> b!589918 m!567631))

(declare-fun m!567861 () Bool)

(assert (=> b!589918 m!567861))

(assert (=> b!589918 m!567631))

(assert (=> b!589918 m!567635))

(assert (=> b!589648 d!85853))

(declare-fun b!589925 () Bool)

(declare-fun c!66643 () Bool)

(declare-fun lt!267500 () (_ BitVec 64))

(assert (=> b!589925 (= c!66643 (= lt!267500 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!336766 () SeekEntryResult!6127)

(declare-fun e!336768 () SeekEntryResult!6127)

(assert (=> b!589925 (= e!336766 e!336768)))

(declare-fun b!589926 () Bool)

(assert (=> b!589926 (= e!336768 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267385 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!267384 lt!267382 mask!3053))))

(declare-fun b!589927 () Bool)

(assert (=> b!589927 (= e!336768 (MissingVacant!6127 vacantSpotIndex!68))))

(declare-fun lt!267501 () SeekEntryResult!6127)

(declare-fun d!85871 () Bool)

(assert (=> d!85871 (and (or ((_ is Undefined!6127) lt!267501) (not ((_ is Found!6127) lt!267501)) (and (bvsge (index!26739 lt!267501) #b00000000000000000000000000000000) (bvslt (index!26739 lt!267501) (size!18055 lt!267382)))) (or ((_ is Undefined!6127) lt!267501) ((_ is Found!6127) lt!267501) (not ((_ is MissingVacant!6127) lt!267501)) (not (= (index!26741 lt!267501) vacantSpotIndex!68)) (and (bvsge (index!26741 lt!267501) #b00000000000000000000000000000000) (bvslt (index!26741 lt!267501) (size!18055 lt!267382)))) (or ((_ is Undefined!6127) lt!267501) (ite ((_ is Found!6127) lt!267501) (= (select (arr!17690 lt!267382) (index!26739 lt!267501)) lt!267384) (and ((_ is MissingVacant!6127) lt!267501) (= (index!26741 lt!267501) vacantSpotIndex!68) (= (select (arr!17690 lt!267382) (index!26741 lt!267501)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!336767 () SeekEntryResult!6127)

(assert (=> d!85871 (= lt!267501 e!336767)))

(declare-fun c!66645 () Bool)

(assert (=> d!85871 (= c!66645 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85871 (= lt!267500 (select (arr!17690 lt!267382) lt!267385))))

(assert (=> d!85871 (validMask!0 mask!3053)))

(assert (=> d!85871 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267385 vacantSpotIndex!68 lt!267384 lt!267382 mask!3053) lt!267501)))

(declare-fun b!589928 () Bool)

(assert (=> b!589928 (= e!336767 e!336766)))

(declare-fun c!66644 () Bool)

(assert (=> b!589928 (= c!66644 (= lt!267500 lt!267384))))

(declare-fun b!589929 () Bool)

(assert (=> b!589929 (= e!336767 Undefined!6127)))

(declare-fun b!589930 () Bool)

(assert (=> b!589930 (= e!336766 (Found!6127 lt!267385))))

(assert (= (and d!85871 c!66645) b!589929))

(assert (= (and d!85871 (not c!66645)) b!589928))

(assert (= (and b!589928 c!66644) b!589930))

(assert (= (and b!589928 (not c!66644)) b!589925))

(assert (= (and b!589925 c!66643) b!589927))

(assert (= (and b!589925 (not c!66643)) b!589926))

(declare-fun m!567863 () Bool)

(assert (=> b!589926 m!567863))

(assert (=> b!589926 m!567863))

(declare-fun m!567865 () Bool)

(assert (=> b!589926 m!567865))

(declare-fun m!567867 () Bool)

(assert (=> d!85871 m!567867))

(declare-fun m!567869 () Bool)

(assert (=> d!85871 m!567869))

(declare-fun m!567871 () Bool)

(assert (=> d!85871 m!567871))

(assert (=> d!85871 m!567647))

(assert (=> b!589648 d!85871))

(declare-fun d!85873 () Bool)

(declare-fun lt!267507 () (_ BitVec 32))

(assert (=> d!85873 (and (bvsge lt!267507 #b00000000000000000000000000000000) (bvslt lt!267507 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85873 (= lt!267507 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!85873 (validMask!0 mask!3053)))

(assert (=> d!85873 (= (nextIndex!0 index!984 x!910 mask!3053) lt!267507)))

(declare-fun bs!18219 () Bool)

(assert (= bs!18219 d!85873))

(declare-fun m!567875 () Bool)

(assert (=> bs!18219 m!567875))

(assert (=> bs!18219 m!567647))

(assert (=> b!589648 d!85873))

(declare-fun b!589931 () Bool)

(declare-fun c!66646 () Bool)

(declare-fun lt!267508 () (_ BitVec 64))

(assert (=> b!589931 (= c!66646 (= lt!267508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!336769 () SeekEntryResult!6127)

(declare-fun e!336771 () SeekEntryResult!6127)

(assert (=> b!589931 (= e!336769 e!336771)))

(declare-fun b!589932 () Bool)

(assert (=> b!589932 (= e!336771 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!267384 lt!267382 mask!3053))))

(declare-fun b!589933 () Bool)

(assert (=> b!589933 (= e!336771 (MissingVacant!6127 vacantSpotIndex!68))))

(declare-fun d!85877 () Bool)

(declare-fun lt!267509 () SeekEntryResult!6127)

(assert (=> d!85877 (and (or ((_ is Undefined!6127) lt!267509) (not ((_ is Found!6127) lt!267509)) (and (bvsge (index!26739 lt!267509) #b00000000000000000000000000000000) (bvslt (index!26739 lt!267509) (size!18055 lt!267382)))) (or ((_ is Undefined!6127) lt!267509) ((_ is Found!6127) lt!267509) (not ((_ is MissingVacant!6127) lt!267509)) (not (= (index!26741 lt!267509) vacantSpotIndex!68)) (and (bvsge (index!26741 lt!267509) #b00000000000000000000000000000000) (bvslt (index!26741 lt!267509) (size!18055 lt!267382)))) (or ((_ is Undefined!6127) lt!267509) (ite ((_ is Found!6127) lt!267509) (= (select (arr!17690 lt!267382) (index!26739 lt!267509)) lt!267384) (and ((_ is MissingVacant!6127) lt!267509) (= (index!26741 lt!267509) vacantSpotIndex!68) (= (select (arr!17690 lt!267382) (index!26741 lt!267509)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!336770 () SeekEntryResult!6127)

(assert (=> d!85877 (= lt!267509 e!336770)))

(declare-fun c!66648 () Bool)

(assert (=> d!85877 (= c!66648 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!85877 (= lt!267508 (select (arr!17690 lt!267382) index!984))))

(assert (=> d!85877 (validMask!0 mask!3053)))

(assert (=> d!85877 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267384 lt!267382 mask!3053) lt!267509)))

(declare-fun b!589934 () Bool)

(assert (=> b!589934 (= e!336770 e!336769)))

(declare-fun c!66647 () Bool)

(assert (=> b!589934 (= c!66647 (= lt!267508 lt!267384))))

(declare-fun b!589935 () Bool)

(assert (=> b!589935 (= e!336770 Undefined!6127)))

(declare-fun b!589936 () Bool)

(assert (=> b!589936 (= e!336769 (Found!6127 index!984))))

(assert (= (and d!85877 c!66648) b!589935))

(assert (= (and d!85877 (not c!66648)) b!589934))

(assert (= (and b!589934 c!66647) b!589936))

(assert (= (and b!589934 (not c!66647)) b!589931))

(assert (= (and b!589931 c!66646) b!589933))

(assert (= (and b!589931 (not c!66646)) b!589932))

(assert (=> b!589932 m!567629))

(assert (=> b!589932 m!567629))

(declare-fun m!567877 () Bool)

(assert (=> b!589932 m!567877))

(declare-fun m!567879 () Bool)

(assert (=> d!85877 m!567879))

(declare-fun m!567881 () Bool)

(assert (=> d!85877 m!567881))

(declare-fun m!567883 () Bool)

(assert (=> d!85877 m!567883))

(assert (=> d!85877 m!567647))

(assert (=> b!589648 d!85877))

(declare-fun b!589945 () Bool)

(declare-fun c!66651 () Bool)

(declare-fun lt!267516 () (_ BitVec 64))

(assert (=> b!589945 (= c!66651 (= lt!267516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!336778 () SeekEntryResult!6127)

(declare-fun e!336780 () SeekEntryResult!6127)

(assert (=> b!589945 (= e!336778 e!336780)))

(declare-fun b!589946 () Bool)

(assert (=> b!589946 (= e!336780 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267385 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17690 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589947 () Bool)

(assert (=> b!589947 (= e!336780 (MissingVacant!6127 vacantSpotIndex!68))))

(declare-fun lt!267517 () SeekEntryResult!6127)

(declare-fun d!85879 () Bool)

(assert (=> d!85879 (and (or ((_ is Undefined!6127) lt!267517) (not ((_ is Found!6127) lt!267517)) (and (bvsge (index!26739 lt!267517) #b00000000000000000000000000000000) (bvslt (index!26739 lt!267517) (size!18055 a!2986)))) (or ((_ is Undefined!6127) lt!267517) ((_ is Found!6127) lt!267517) (not ((_ is MissingVacant!6127) lt!267517)) (not (= (index!26741 lt!267517) vacantSpotIndex!68)) (and (bvsge (index!26741 lt!267517) #b00000000000000000000000000000000) (bvslt (index!26741 lt!267517) (size!18055 a!2986)))) (or ((_ is Undefined!6127) lt!267517) (ite ((_ is Found!6127) lt!267517) (= (select (arr!17690 a!2986) (index!26739 lt!267517)) (select (arr!17690 a!2986) j!136)) (and ((_ is MissingVacant!6127) lt!267517) (= (index!26741 lt!267517) vacantSpotIndex!68) (= (select (arr!17690 a!2986) (index!26741 lt!267517)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!336779 () SeekEntryResult!6127)

(assert (=> d!85879 (= lt!267517 e!336779)))

(declare-fun c!66653 () Bool)

(assert (=> d!85879 (= c!66653 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85879 (= lt!267516 (select (arr!17690 a!2986) lt!267385))))

(assert (=> d!85879 (validMask!0 mask!3053)))

(assert (=> d!85879 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267385 vacantSpotIndex!68 (select (arr!17690 a!2986) j!136) a!2986 mask!3053) lt!267517)))

(declare-fun b!589948 () Bool)

(assert (=> b!589948 (= e!336779 e!336778)))

(declare-fun c!66652 () Bool)

(assert (=> b!589948 (= c!66652 (= lt!267516 (select (arr!17690 a!2986) j!136)))))

(declare-fun b!589949 () Bool)

(assert (=> b!589949 (= e!336779 Undefined!6127)))

(declare-fun b!589950 () Bool)

(assert (=> b!589950 (= e!336778 (Found!6127 lt!267385))))

(assert (= (and d!85879 c!66653) b!589949))

(assert (= (and d!85879 (not c!66653)) b!589948))

(assert (= (and b!589948 c!66652) b!589950))

(assert (= (and b!589948 (not c!66652)) b!589945))

(assert (= (and b!589945 c!66651) b!589947))

(assert (= (and b!589945 (not c!66651)) b!589946))

(assert (=> b!589946 m!567863))

(assert (=> b!589946 m!567863))

(assert (=> b!589946 m!567633))

(declare-fun m!567885 () Bool)

(assert (=> b!589946 m!567885))

(declare-fun m!567887 () Bool)

(assert (=> d!85879 m!567887))

(declare-fun m!567889 () Bool)

(assert (=> d!85879 m!567889))

(declare-fun m!567891 () Bool)

(assert (=> d!85879 m!567891))

(assert (=> d!85879 m!567647))

(assert (=> b!589648 d!85879))

(check-sat (not d!85879) (not d!85877) (not b!589873) (not b!589874) (not b!589932) (not b!589834) (not b!589815) (not d!85827) (not b!589765) (not d!85813) (not b!589757) (not b!589918) (not d!85871) (not b!589830) (not b!589831) (not b!589926) (not b!589946) (not d!85853) (not bm!32779) (not d!85873) (not bm!32776))
(check-sat)
