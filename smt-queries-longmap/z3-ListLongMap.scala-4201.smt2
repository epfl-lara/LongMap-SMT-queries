; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57344 () Bool)

(assert start!57344)

(declare-fun b!634734 () Bool)

(declare-fun e!362987 () Bool)

(declare-fun e!362989 () Bool)

(assert (=> b!634734 (= e!362987 e!362989)))

(declare-fun res!410721 () Bool)

(assert (=> b!634734 (=> res!410721 e!362989)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293357 () (_ BitVec 64))

(declare-fun lt!293360 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38208 0))(
  ( (array!38209 (arr!18332 (Array (_ BitVec 32) (_ BitVec 64))) (size!18697 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38208)

(assert (=> b!634734 (= res!410721 (or (not (= (select (arr!18332 a!2986) j!136) lt!293360)) (not (= (select (arr!18332 a!2986) j!136) lt!293357)) (bvsge j!136 index!984)))))

(declare-fun b!634735 () Bool)

(declare-fun e!362988 () Bool)

(declare-fun e!362982 () Bool)

(assert (=> b!634735 (= e!362988 (not e!362982))))

(declare-fun res!410707 () Bool)

(assert (=> b!634735 (=> res!410707 e!362982)))

(declare-datatypes ((SeekEntryResult!6769 0))(
  ( (MissingZero!6769 (index!29378 (_ BitVec 32))) (Found!6769 (index!29379 (_ BitVec 32))) (Intermediate!6769 (undefined!7581 Bool) (index!29380 (_ BitVec 32)) (x!58130 (_ BitVec 32))) (Undefined!6769) (MissingVacant!6769 (index!29381 (_ BitVec 32))) )
))
(declare-fun lt!293362 () SeekEntryResult!6769)

(assert (=> b!634735 (= res!410707 (not (= lt!293362 (Found!6769 index!984))))))

(declare-datatypes ((Unit!21404 0))(
  ( (Unit!21405) )
))
(declare-fun lt!293364 () Unit!21404)

(declare-fun e!362991 () Unit!21404)

(assert (=> b!634735 (= lt!293364 e!362991)))

(declare-fun c!72381 () Bool)

(assert (=> b!634735 (= c!72381 (= lt!293362 Undefined!6769))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!293361 () array!38208)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38208 (_ BitVec 32)) SeekEntryResult!6769)

(assert (=> b!634735 (= lt!293362 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293360 lt!293361 mask!3053))))

(declare-fun e!362986 () Bool)

(assert (=> b!634735 e!362986))

(declare-fun res!410716 () Bool)

(assert (=> b!634735 (=> (not res!410716) (not e!362986))))

(declare-fun lt!293356 () SeekEntryResult!6769)

(declare-fun lt!293359 () (_ BitVec 32))

(assert (=> b!634735 (= res!410716 (= lt!293356 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293359 vacantSpotIndex!68 lt!293360 lt!293361 mask!3053)))))

(assert (=> b!634735 (= lt!293356 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293359 vacantSpotIndex!68 (select (arr!18332 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!634735 (= lt!293360 (select (store (arr!18332 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293358 () Unit!21404)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38208 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21404)

(assert (=> b!634735 (= lt!293358 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293359 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634735 (= lt!293359 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634736 () Bool)

(declare-fun res!410710 () Bool)

(declare-fun e!362984 () Bool)

(assert (=> b!634736 (=> (not res!410710) (not e!362984))))

(assert (=> b!634736 (= res!410710 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18332 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634737 () Bool)

(declare-fun e!362990 () Bool)

(assert (=> b!634737 (= e!362984 e!362990)))

(declare-fun res!410718 () Bool)

(assert (=> b!634737 (=> (not res!410718) (not e!362990))))

(assert (=> b!634737 (= res!410718 (= (select (store (arr!18332 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634737 (= lt!293361 (array!38209 (store (arr!18332 a!2986) i!1108 k0!1786) (size!18697 a!2986)))))

(declare-fun b!634738 () Bool)

(declare-fun e!362992 () Bool)

(assert (=> b!634738 (= e!362992 e!362984)))

(declare-fun res!410714 () Bool)

(assert (=> b!634738 (=> (not res!410714) (not e!362984))))

(declare-fun lt!293363 () SeekEntryResult!6769)

(assert (=> b!634738 (= res!410714 (or (= lt!293363 (MissingZero!6769 i!1108)) (= lt!293363 (MissingVacant!6769 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38208 (_ BitVec 32)) SeekEntryResult!6769)

(assert (=> b!634738 (= lt!293363 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634739 () Bool)

(declare-fun e!362985 () Bool)

(assert (=> b!634739 (= e!362982 e!362985)))

(declare-fun res!410717 () Bool)

(assert (=> b!634739 (=> res!410717 e!362985)))

(assert (=> b!634739 (= res!410717 (or (not (= (select (arr!18332 a!2986) j!136) lt!293360)) (not (= (select (arr!18332 a!2986) j!136) lt!293357)) (bvsge j!136 index!984)))))

(assert (=> b!634739 e!362987))

(declare-fun res!410706 () Bool)

(assert (=> b!634739 (=> (not res!410706) (not e!362987))))

(assert (=> b!634739 (= res!410706 (= lt!293357 (select (arr!18332 a!2986) j!136)))))

(assert (=> b!634739 (= lt!293357 (select (store (arr!18332 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!634740 () Bool)

(declare-fun res!410719 () Bool)

(assert (=> b!634740 (=> (not res!410719) (not e!362984))))

(declare-datatypes ((List!12412 0))(
  ( (Nil!12409) (Cons!12408 (h!13453 (_ BitVec 64)) (t!18631 List!12412)) )
))
(declare-fun arrayNoDuplicates!0 (array!38208 (_ BitVec 32) List!12412) Bool)

(assert (=> b!634740 (= res!410719 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12409))))

(declare-fun b!634741 () Bool)

(declare-fun Unit!21406 () Unit!21404)

(assert (=> b!634741 (= e!362991 Unit!21406)))

(declare-fun b!634742 () Bool)

(declare-fun res!410709 () Bool)

(assert (=> b!634742 (=> (not res!410709) (not e!362992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634742 (= res!410709 (validKeyInArray!0 k0!1786))))

(declare-fun b!634743 () Bool)

(assert (=> b!634743 (= e!362985 (bvslt (size!18697 a!2986) #b01111111111111111111111111111111))))

(declare-fun arrayContainsKey!0 (array!38208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634743 (arrayContainsKey!0 lt!293361 (select (arr!18332 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293354 () Unit!21404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38208 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21404)

(assert (=> b!634743 (= lt!293354 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293361 (select (arr!18332 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!634744 () Bool)

(declare-fun e!362993 () Bool)

(assert (=> b!634744 (= e!362989 e!362993)))

(declare-fun res!410711 () Bool)

(assert (=> b!634744 (=> (not res!410711) (not e!362993))))

(assert (=> b!634744 (= res!410711 (arrayContainsKey!0 lt!293361 (select (arr!18332 a!2986) j!136) j!136))))

(declare-fun res!410722 () Bool)

(assert (=> start!57344 (=> (not res!410722) (not e!362992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57344 (= res!410722 (validMask!0 mask!3053))))

(assert (=> start!57344 e!362992))

(assert (=> start!57344 true))

(declare-fun array_inv!14215 (array!38208) Bool)

(assert (=> start!57344 (array_inv!14215 a!2986)))

(declare-fun b!634745 () Bool)

(assert (=> b!634745 (= e!362993 (arrayContainsKey!0 lt!293361 (select (arr!18332 a!2986) j!136) index!984))))

(declare-fun b!634746 () Bool)

(declare-fun res!410713 () Bool)

(assert (=> b!634746 (=> (not res!410713) (not e!362992))))

(assert (=> b!634746 (= res!410713 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634747 () Bool)

(declare-fun Unit!21407 () Unit!21404)

(assert (=> b!634747 (= e!362991 Unit!21407)))

(assert (=> b!634747 false))

(declare-fun b!634748 () Bool)

(declare-fun lt!293355 () SeekEntryResult!6769)

(assert (=> b!634748 (= e!362986 (= lt!293355 lt!293356))))

(declare-fun b!634749 () Bool)

(declare-fun res!410712 () Bool)

(assert (=> b!634749 (=> (not res!410712) (not e!362984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38208 (_ BitVec 32)) Bool)

(assert (=> b!634749 (= res!410712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634750 () Bool)

(assert (=> b!634750 (= e!362990 e!362988)))

(declare-fun res!410708 () Bool)

(assert (=> b!634750 (=> (not res!410708) (not e!362988))))

(assert (=> b!634750 (= res!410708 (and (= lt!293355 (Found!6769 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18332 a!2986) index!984) (select (arr!18332 a!2986) j!136))) (not (= (select (arr!18332 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634750 (= lt!293355 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18332 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634751 () Bool)

(declare-fun res!410720 () Bool)

(assert (=> b!634751 (=> (not res!410720) (not e!362992))))

(assert (=> b!634751 (= res!410720 (and (= (size!18697 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18697 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18697 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634752 () Bool)

(declare-fun res!410715 () Bool)

(assert (=> b!634752 (=> (not res!410715) (not e!362992))))

(assert (=> b!634752 (= res!410715 (validKeyInArray!0 (select (arr!18332 a!2986) j!136)))))

(assert (= (and start!57344 res!410722) b!634751))

(assert (= (and b!634751 res!410720) b!634752))

(assert (= (and b!634752 res!410715) b!634742))

(assert (= (and b!634742 res!410709) b!634746))

(assert (= (and b!634746 res!410713) b!634738))

(assert (= (and b!634738 res!410714) b!634749))

(assert (= (and b!634749 res!410712) b!634740))

(assert (= (and b!634740 res!410719) b!634736))

(assert (= (and b!634736 res!410710) b!634737))

(assert (= (and b!634737 res!410718) b!634750))

(assert (= (and b!634750 res!410708) b!634735))

(assert (= (and b!634735 res!410716) b!634748))

(assert (= (and b!634735 c!72381) b!634747))

(assert (= (and b!634735 (not c!72381)) b!634741))

(assert (= (and b!634735 (not res!410707)) b!634739))

(assert (= (and b!634739 res!410706) b!634734))

(assert (= (and b!634734 (not res!410721)) b!634744))

(assert (= (and b!634744 res!410711) b!634745))

(assert (= (and b!634739 (not res!410717)) b!634743))

(declare-fun m!608661 () Bool)

(assert (=> b!634736 m!608661))

(declare-fun m!608663 () Bool)

(assert (=> b!634749 m!608663))

(declare-fun m!608665 () Bool)

(assert (=> b!634742 m!608665))

(declare-fun m!608667 () Bool)

(assert (=> b!634739 m!608667))

(declare-fun m!608669 () Bool)

(assert (=> b!634739 m!608669))

(declare-fun m!608671 () Bool)

(assert (=> b!634739 m!608671))

(assert (=> b!634737 m!608669))

(declare-fun m!608673 () Bool)

(assert (=> b!634737 m!608673))

(declare-fun m!608675 () Bool)

(assert (=> b!634740 m!608675))

(assert (=> b!634744 m!608667))

(assert (=> b!634744 m!608667))

(declare-fun m!608677 () Bool)

(assert (=> b!634744 m!608677))

(assert (=> b!634743 m!608667))

(assert (=> b!634743 m!608667))

(declare-fun m!608679 () Bool)

(assert (=> b!634743 m!608679))

(assert (=> b!634743 m!608667))

(declare-fun m!608681 () Bool)

(assert (=> b!634743 m!608681))

(declare-fun m!608683 () Bool)

(assert (=> start!57344 m!608683))

(declare-fun m!608685 () Bool)

(assert (=> start!57344 m!608685))

(declare-fun m!608687 () Bool)

(assert (=> b!634750 m!608687))

(assert (=> b!634750 m!608667))

(assert (=> b!634750 m!608667))

(declare-fun m!608689 () Bool)

(assert (=> b!634750 m!608689))

(assert (=> b!634734 m!608667))

(declare-fun m!608691 () Bool)

(assert (=> b!634735 m!608691))

(declare-fun m!608693 () Bool)

(assert (=> b!634735 m!608693))

(declare-fun m!608695 () Bool)

(assert (=> b!634735 m!608695))

(assert (=> b!634735 m!608667))

(assert (=> b!634735 m!608669))

(declare-fun m!608697 () Bool)

(assert (=> b!634735 m!608697))

(declare-fun m!608699 () Bool)

(assert (=> b!634735 m!608699))

(assert (=> b!634735 m!608667))

(declare-fun m!608701 () Bool)

(assert (=> b!634735 m!608701))

(assert (=> b!634745 m!608667))

(assert (=> b!634745 m!608667))

(declare-fun m!608703 () Bool)

(assert (=> b!634745 m!608703))

(declare-fun m!608705 () Bool)

(assert (=> b!634746 m!608705))

(assert (=> b!634752 m!608667))

(assert (=> b!634752 m!608667))

(declare-fun m!608707 () Bool)

(assert (=> b!634752 m!608707))

(declare-fun m!608709 () Bool)

(assert (=> b!634738 m!608709))

(check-sat (not b!634743) (not b!634745) (not start!57344) (not b!634744) (not b!634740) (not b!634746) (not b!634742) (not b!634735) (not b!634750) (not b!634749) (not b!634738) (not b!634752))
(check-sat)
(get-model)

(declare-fun b!634879 () Bool)

(declare-fun e!363073 () SeekEntryResult!6769)

(declare-fun e!363074 () SeekEntryResult!6769)

(assert (=> b!634879 (= e!363073 e!363074)))

(declare-fun lt!293435 () (_ BitVec 64))

(declare-fun c!72396 () Bool)

(assert (=> b!634879 (= c!72396 (= lt!293435 (select (arr!18332 a!2986) j!136)))))

(declare-fun lt!293436 () SeekEntryResult!6769)

(declare-fun d!89493 () Bool)

(get-info :version)

(assert (=> d!89493 (and (or ((_ is Undefined!6769) lt!293436) (not ((_ is Found!6769) lt!293436)) (and (bvsge (index!29379 lt!293436) #b00000000000000000000000000000000) (bvslt (index!29379 lt!293436) (size!18697 a!2986)))) (or ((_ is Undefined!6769) lt!293436) ((_ is Found!6769) lt!293436) (not ((_ is MissingVacant!6769) lt!293436)) (not (= (index!29381 lt!293436) vacantSpotIndex!68)) (and (bvsge (index!29381 lt!293436) #b00000000000000000000000000000000) (bvslt (index!29381 lt!293436) (size!18697 a!2986)))) (or ((_ is Undefined!6769) lt!293436) (ite ((_ is Found!6769) lt!293436) (= (select (arr!18332 a!2986) (index!29379 lt!293436)) (select (arr!18332 a!2986) j!136)) (and ((_ is MissingVacant!6769) lt!293436) (= (index!29381 lt!293436) vacantSpotIndex!68) (= (select (arr!18332 a!2986) (index!29381 lt!293436)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89493 (= lt!293436 e!363073)))

(declare-fun c!72394 () Bool)

(assert (=> d!89493 (= c!72394 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89493 (= lt!293435 (select (arr!18332 a!2986) index!984))))

(assert (=> d!89493 (validMask!0 mask!3053)))

(assert (=> d!89493 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18332 a!2986) j!136) a!2986 mask!3053) lt!293436)))

(declare-fun b!634880 () Bool)

(declare-fun c!72395 () Bool)

(assert (=> b!634880 (= c!72395 (= lt!293435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363072 () SeekEntryResult!6769)

(assert (=> b!634880 (= e!363074 e!363072)))

(declare-fun b!634881 () Bool)

(assert (=> b!634881 (= e!363074 (Found!6769 index!984))))

(declare-fun b!634882 () Bool)

(assert (=> b!634882 (= e!363073 Undefined!6769)))

(declare-fun b!634883 () Bool)

(assert (=> b!634883 (= e!363072 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18332 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634884 () Bool)

(assert (=> b!634884 (= e!363072 (MissingVacant!6769 vacantSpotIndex!68))))

(assert (= (and d!89493 c!72394) b!634882))

(assert (= (and d!89493 (not c!72394)) b!634879))

(assert (= (and b!634879 c!72396) b!634881))

(assert (= (and b!634879 (not c!72396)) b!634880))

(assert (= (and b!634880 c!72395) b!634884))

(assert (= (and b!634880 (not c!72395)) b!634883))

(declare-fun m!608811 () Bool)

(assert (=> d!89493 m!608811))

(declare-fun m!608813 () Bool)

(assert (=> d!89493 m!608813))

(assert (=> d!89493 m!608687))

(assert (=> d!89493 m!608683))

(assert (=> b!634883 m!608693))

(assert (=> b!634883 m!608693))

(assert (=> b!634883 m!608667))

(declare-fun m!608815 () Bool)

(assert (=> b!634883 m!608815))

(assert (=> b!634750 d!89493))

(declare-fun b!634915 () Bool)

(declare-fun c!72403 () Bool)

(declare-fun lt!293448 () (_ BitVec 64))

(assert (=> b!634915 (= c!72403 (= lt!293448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363100 () SeekEntryResult!6769)

(declare-fun e!363099 () SeekEntryResult!6769)

(assert (=> b!634915 (= e!363100 e!363099)))

(declare-fun d!89495 () Bool)

(declare-fun lt!293447 () SeekEntryResult!6769)

(assert (=> d!89495 (and (or ((_ is Undefined!6769) lt!293447) (not ((_ is Found!6769) lt!293447)) (and (bvsge (index!29379 lt!293447) #b00000000000000000000000000000000) (bvslt (index!29379 lt!293447) (size!18697 a!2986)))) (or ((_ is Undefined!6769) lt!293447) ((_ is Found!6769) lt!293447) (not ((_ is MissingZero!6769) lt!293447)) (and (bvsge (index!29378 lt!293447) #b00000000000000000000000000000000) (bvslt (index!29378 lt!293447) (size!18697 a!2986)))) (or ((_ is Undefined!6769) lt!293447) ((_ is Found!6769) lt!293447) ((_ is MissingZero!6769) lt!293447) (not ((_ is MissingVacant!6769) lt!293447)) (and (bvsge (index!29381 lt!293447) #b00000000000000000000000000000000) (bvslt (index!29381 lt!293447) (size!18697 a!2986)))) (or ((_ is Undefined!6769) lt!293447) (ite ((_ is Found!6769) lt!293447) (= (select (arr!18332 a!2986) (index!29379 lt!293447)) k0!1786) (ite ((_ is MissingZero!6769) lt!293447) (= (select (arr!18332 a!2986) (index!29378 lt!293447)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6769) lt!293447) (= (select (arr!18332 a!2986) (index!29381 lt!293447)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!363101 () SeekEntryResult!6769)

(assert (=> d!89495 (= lt!293447 e!363101)))

(declare-fun c!72404 () Bool)

(declare-fun lt!293446 () SeekEntryResult!6769)

(assert (=> d!89495 (= c!72404 (and ((_ is Intermediate!6769) lt!293446) (undefined!7581 lt!293446)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38208 (_ BitVec 32)) SeekEntryResult!6769)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89495 (= lt!293446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89495 (validMask!0 mask!3053)))

(assert (=> d!89495 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!293447)))

(declare-fun b!634916 () Bool)

(assert (=> b!634916 (= e!363101 e!363100)))

(assert (=> b!634916 (= lt!293448 (select (arr!18332 a!2986) (index!29380 lt!293446)))))

(declare-fun c!72405 () Bool)

(assert (=> b!634916 (= c!72405 (= lt!293448 k0!1786))))

(declare-fun b!634917 () Bool)

(assert (=> b!634917 (= e!363101 Undefined!6769)))

(declare-fun b!634918 () Bool)

(assert (=> b!634918 (= e!363100 (Found!6769 (index!29380 lt!293446)))))

(declare-fun b!634919 () Bool)

(assert (=> b!634919 (= e!363099 (MissingZero!6769 (index!29380 lt!293446)))))

(declare-fun b!634920 () Bool)

(assert (=> b!634920 (= e!363099 (seekKeyOrZeroReturnVacant!0 (x!58130 lt!293446) (index!29380 lt!293446) (index!29380 lt!293446) k0!1786 a!2986 mask!3053))))

(assert (= (and d!89495 c!72404) b!634917))

(assert (= (and d!89495 (not c!72404)) b!634916))

(assert (= (and b!634916 c!72405) b!634918))

(assert (= (and b!634916 (not c!72405)) b!634915))

(assert (= (and b!634915 c!72403) b!634919))

(assert (= (and b!634915 (not c!72403)) b!634920))

(declare-fun m!608839 () Bool)

(assert (=> d!89495 m!608839))

(declare-fun m!608841 () Bool)

(assert (=> d!89495 m!608841))

(declare-fun m!608843 () Bool)

(assert (=> d!89495 m!608843))

(assert (=> d!89495 m!608843))

(declare-fun m!608845 () Bool)

(assert (=> d!89495 m!608845))

(assert (=> d!89495 m!608683))

(declare-fun m!608847 () Bool)

(assert (=> d!89495 m!608847))

(declare-fun m!608849 () Bool)

(assert (=> b!634916 m!608849))

(declare-fun m!608851 () Bool)

(assert (=> b!634920 m!608851))

(assert (=> b!634738 d!89495))

(declare-fun b!634932 () Bool)

(declare-fun e!363111 () Bool)

(declare-fun call!33370 () Bool)

(assert (=> b!634932 (= e!363111 call!33370)))

(declare-fun b!634933 () Bool)

(declare-fun e!363112 () Bool)

(assert (=> b!634933 (= e!363112 e!363111)))

(declare-fun c!72408 () Bool)

(assert (=> b!634933 (= c!72408 (validKeyInArray!0 (select (arr!18332 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!634934 () Bool)

(declare-fun e!363113 () Bool)

(assert (=> b!634934 (= e!363111 e!363113)))

(declare-fun lt!293459 () (_ BitVec 64))

(assert (=> b!634934 (= lt!293459 (select (arr!18332 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!293460 () Unit!21404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38208 (_ BitVec 64) (_ BitVec 32)) Unit!21404)

(assert (=> b!634934 (= lt!293460 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!293459 #b00000000000000000000000000000000))))

(assert (=> b!634934 (arrayContainsKey!0 a!2986 lt!293459 #b00000000000000000000000000000000)))

(declare-fun lt!293458 () Unit!21404)

(assert (=> b!634934 (= lt!293458 lt!293460)))

(declare-fun res!410851 () Bool)

(assert (=> b!634934 (= res!410851 (= (seekEntryOrOpen!0 (select (arr!18332 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6769 #b00000000000000000000000000000000)))))

(assert (=> b!634934 (=> (not res!410851) (not e!363113))))

(declare-fun bm!33367 () Bool)

(assert (=> bm!33367 (= call!33370 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!89515 () Bool)

(declare-fun res!410850 () Bool)

(assert (=> d!89515 (=> res!410850 e!363112)))

(assert (=> d!89515 (= res!410850 (bvsge #b00000000000000000000000000000000 (size!18697 a!2986)))))

(assert (=> d!89515 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!363112)))

(declare-fun b!634935 () Bool)

(assert (=> b!634935 (= e!363113 call!33370)))

(assert (= (and d!89515 (not res!410850)) b!634933))

(assert (= (and b!634933 c!72408) b!634934))

(assert (= (and b!634933 (not c!72408)) b!634932))

(assert (= (and b!634934 res!410851) b!634935))

(assert (= (or b!634935 b!634932) bm!33367))

(declare-fun m!608857 () Bool)

(assert (=> b!634933 m!608857))

(assert (=> b!634933 m!608857))

(declare-fun m!608859 () Bool)

(assert (=> b!634933 m!608859))

(assert (=> b!634934 m!608857))

(declare-fun m!608861 () Bool)

(assert (=> b!634934 m!608861))

(declare-fun m!608863 () Bool)

(assert (=> b!634934 m!608863))

(assert (=> b!634934 m!608857))

(declare-fun m!608865 () Bool)

(assert (=> b!634934 m!608865))

(declare-fun m!608867 () Bool)

(assert (=> bm!33367 m!608867))

(assert (=> b!634749 d!89515))

(declare-fun d!89519 () Bool)

(assert (=> d!89519 (= (validKeyInArray!0 (select (arr!18332 a!2986) j!136)) (and (not (= (select (arr!18332 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18332 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!634752 d!89519))

(declare-fun d!89521 () Bool)

(assert (=> d!89521 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!634742 d!89521))

(declare-fun b!634958 () Bool)

(declare-fun e!363130 () Bool)

(declare-fun contains!3079 (List!12412 (_ BitVec 64)) Bool)

(assert (=> b!634958 (= e!363130 (contains!3079 Nil!12409 (select (arr!18332 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!634960 () Bool)

(declare-fun e!363131 () Bool)

(declare-fun e!363128 () Bool)

(assert (=> b!634960 (= e!363131 e!363128)))

(declare-fun c!72417 () Bool)

(assert (=> b!634960 (= c!72417 (validKeyInArray!0 (select (arr!18332 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!634961 () Bool)

(declare-fun call!33373 () Bool)

(assert (=> b!634961 (= e!363128 call!33373)))

(declare-fun bm!33370 () Bool)

(assert (=> bm!33370 (= call!33373 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72417 (Cons!12408 (select (arr!18332 a!2986) #b00000000000000000000000000000000) Nil!12409) Nil!12409)))))

(declare-fun b!634962 () Bool)

(declare-fun e!363129 () Bool)

(assert (=> b!634962 (= e!363129 e!363131)))

(declare-fun res!410860 () Bool)

(assert (=> b!634962 (=> (not res!410860) (not e!363131))))

(assert (=> b!634962 (= res!410860 (not e!363130))))

(declare-fun res!410858 () Bool)

(assert (=> b!634962 (=> (not res!410858) (not e!363130))))

(assert (=> b!634962 (= res!410858 (validKeyInArray!0 (select (arr!18332 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!634959 () Bool)

(assert (=> b!634959 (= e!363128 call!33373)))

(declare-fun d!89523 () Bool)

(declare-fun res!410859 () Bool)

(assert (=> d!89523 (=> res!410859 e!363129)))

(assert (=> d!89523 (= res!410859 (bvsge #b00000000000000000000000000000000 (size!18697 a!2986)))))

(assert (=> d!89523 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12409) e!363129)))

(assert (= (and d!89523 (not res!410859)) b!634962))

(assert (= (and b!634962 res!410858) b!634958))

(assert (= (and b!634962 res!410860) b!634960))

(assert (= (and b!634960 c!72417) b!634961))

(assert (= (and b!634960 (not c!72417)) b!634959))

(assert (= (or b!634961 b!634959) bm!33370))

(assert (=> b!634958 m!608857))

(assert (=> b!634958 m!608857))

(declare-fun m!608871 () Bool)

(assert (=> b!634958 m!608871))

(assert (=> b!634960 m!608857))

(assert (=> b!634960 m!608857))

(assert (=> b!634960 m!608859))

(assert (=> bm!33370 m!608857))

(declare-fun m!608873 () Bool)

(assert (=> bm!33370 m!608873))

(assert (=> b!634962 m!608857))

(assert (=> b!634962 m!608857))

(assert (=> b!634962 m!608859))

(assert (=> b!634740 d!89523))

(declare-fun d!89527 () Bool)

(declare-fun res!410865 () Bool)

(declare-fun e!363139 () Bool)

(assert (=> d!89527 (=> res!410865 e!363139)))

(assert (=> d!89527 (= res!410865 (= (select (arr!18332 lt!293361) j!136) (select (arr!18332 a!2986) j!136)))))

(assert (=> d!89527 (= (arrayContainsKey!0 lt!293361 (select (arr!18332 a!2986) j!136) j!136) e!363139)))

(declare-fun b!634973 () Bool)

(declare-fun e!363140 () Bool)

(assert (=> b!634973 (= e!363139 e!363140)))

(declare-fun res!410866 () Bool)

(assert (=> b!634973 (=> (not res!410866) (not e!363140))))

(assert (=> b!634973 (= res!410866 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18697 lt!293361)))))

(declare-fun b!634974 () Bool)

(assert (=> b!634974 (= e!363140 (arrayContainsKey!0 lt!293361 (select (arr!18332 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89527 (not res!410865)) b!634973))

(assert (= (and b!634973 res!410866) b!634974))

(declare-fun m!608889 () Bool)

(assert (=> d!89527 m!608889))

(assert (=> b!634974 m!608667))

(declare-fun m!608891 () Bool)

(assert (=> b!634974 m!608891))

(assert (=> b!634744 d!89527))

(declare-fun d!89533 () Bool)

(declare-fun res!410867 () Bool)

(declare-fun e!363141 () Bool)

(assert (=> d!89533 (=> res!410867 e!363141)))

(assert (=> d!89533 (= res!410867 (= (select (arr!18332 lt!293361) index!984) (select (arr!18332 a!2986) j!136)))))

(assert (=> d!89533 (= (arrayContainsKey!0 lt!293361 (select (arr!18332 a!2986) j!136) index!984) e!363141)))

(declare-fun b!634975 () Bool)

(declare-fun e!363142 () Bool)

(assert (=> b!634975 (= e!363141 e!363142)))

(declare-fun res!410868 () Bool)

(assert (=> b!634975 (=> (not res!410868) (not e!363142))))

(assert (=> b!634975 (= res!410868 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18697 lt!293361)))))

(declare-fun b!634976 () Bool)

(assert (=> b!634976 (= e!363142 (arrayContainsKey!0 lt!293361 (select (arr!18332 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89533 (not res!410867)) b!634975))

(assert (= (and b!634975 res!410868) b!634976))

(declare-fun m!608893 () Bool)

(assert (=> d!89533 m!608893))

(assert (=> b!634976 m!608667))

(declare-fun m!608895 () Bool)

(assert (=> b!634976 m!608895))

(assert (=> b!634745 d!89533))

(declare-fun d!89535 () Bool)

(assert (=> d!89535 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57344 d!89535))

(declare-fun d!89549 () Bool)

(assert (=> d!89549 (= (array_inv!14215 a!2986) (bvsge (size!18697 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57344 d!89549))

(declare-fun d!89551 () Bool)

(declare-fun res!410884 () Bool)

(declare-fun e!363181 () Bool)

(assert (=> d!89551 (=> res!410884 e!363181)))

(assert (=> d!89551 (= res!410884 (= (select (arr!18332 lt!293361) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18332 a!2986) j!136)))))

(assert (=> d!89551 (= (arrayContainsKey!0 lt!293361 (select (arr!18332 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!363181)))

(declare-fun b!635038 () Bool)

(declare-fun e!363182 () Bool)

(assert (=> b!635038 (= e!363181 e!363182)))

(declare-fun res!410885 () Bool)

(assert (=> b!635038 (=> (not res!410885) (not e!363182))))

(assert (=> b!635038 (= res!410885 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18697 lt!293361)))))

(declare-fun b!635039 () Bool)

(assert (=> b!635039 (= e!363182 (arrayContainsKey!0 lt!293361 (select (arr!18332 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89551 (not res!410884)) b!635038))

(assert (= (and b!635038 res!410885) b!635039))

(declare-fun m!608935 () Bool)

(assert (=> d!89551 m!608935))

(assert (=> b!635039 m!608667))

(declare-fun m!608937 () Bool)

(assert (=> b!635039 m!608937))

(assert (=> b!634743 d!89551))

(declare-fun d!89557 () Bool)

(assert (=> d!89557 (arrayContainsKey!0 lt!293361 (select (arr!18332 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293487 () Unit!21404)

(declare-fun choose!114 (array!38208 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21404)

(assert (=> d!89557 (= lt!293487 (choose!114 lt!293361 (select (arr!18332 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89557 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89557 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293361 (select (arr!18332 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!293487)))

(declare-fun bs!19061 () Bool)

(assert (= bs!19061 d!89557))

(assert (=> bs!19061 m!608667))

(assert (=> bs!19061 m!608679))

(assert (=> bs!19061 m!608667))

(declare-fun m!608945 () Bool)

(assert (=> bs!19061 m!608945))

(assert (=> b!634743 d!89557))

(declare-fun b!635045 () Bool)

(declare-fun e!363188 () SeekEntryResult!6769)

(declare-fun e!363189 () SeekEntryResult!6769)

(assert (=> b!635045 (= e!363188 e!363189)))

(declare-fun c!72447 () Bool)

(declare-fun lt!293488 () (_ BitVec 64))

(assert (=> b!635045 (= c!72447 (= lt!293488 lt!293360))))

(declare-fun lt!293489 () SeekEntryResult!6769)

(declare-fun d!89561 () Bool)

(assert (=> d!89561 (and (or ((_ is Undefined!6769) lt!293489) (not ((_ is Found!6769) lt!293489)) (and (bvsge (index!29379 lt!293489) #b00000000000000000000000000000000) (bvslt (index!29379 lt!293489) (size!18697 lt!293361)))) (or ((_ is Undefined!6769) lt!293489) ((_ is Found!6769) lt!293489) (not ((_ is MissingVacant!6769) lt!293489)) (not (= (index!29381 lt!293489) vacantSpotIndex!68)) (and (bvsge (index!29381 lt!293489) #b00000000000000000000000000000000) (bvslt (index!29381 lt!293489) (size!18697 lt!293361)))) (or ((_ is Undefined!6769) lt!293489) (ite ((_ is Found!6769) lt!293489) (= (select (arr!18332 lt!293361) (index!29379 lt!293489)) lt!293360) (and ((_ is MissingVacant!6769) lt!293489) (= (index!29381 lt!293489) vacantSpotIndex!68) (= (select (arr!18332 lt!293361) (index!29381 lt!293489)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89561 (= lt!293489 e!363188)))

(declare-fun c!72445 () Bool)

(assert (=> d!89561 (= c!72445 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89561 (= lt!293488 (select (arr!18332 lt!293361) index!984))))

(assert (=> d!89561 (validMask!0 mask!3053)))

(assert (=> d!89561 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293360 lt!293361 mask!3053) lt!293489)))

(declare-fun b!635046 () Bool)

(declare-fun c!72446 () Bool)

(assert (=> b!635046 (= c!72446 (= lt!293488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363187 () SeekEntryResult!6769)

(assert (=> b!635046 (= e!363189 e!363187)))

(declare-fun b!635047 () Bool)

(assert (=> b!635047 (= e!363189 (Found!6769 index!984))))

(declare-fun b!635048 () Bool)

(assert (=> b!635048 (= e!363188 Undefined!6769)))

(declare-fun b!635049 () Bool)

(assert (=> b!635049 (= e!363187 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!293360 lt!293361 mask!3053))))

(declare-fun b!635050 () Bool)

(assert (=> b!635050 (= e!363187 (MissingVacant!6769 vacantSpotIndex!68))))

(assert (= (and d!89561 c!72445) b!635048))

(assert (= (and d!89561 (not c!72445)) b!635045))

(assert (= (and b!635045 c!72447) b!635047))

(assert (= (and b!635045 (not c!72447)) b!635046))

(assert (= (and b!635046 c!72446) b!635050))

(assert (= (and b!635046 (not c!72446)) b!635049))

(declare-fun m!608947 () Bool)

(assert (=> d!89561 m!608947))

(declare-fun m!608949 () Bool)

(assert (=> d!89561 m!608949))

(assert (=> d!89561 m!608893))

(assert (=> d!89561 m!608683))

(assert (=> b!635049 m!608693))

(assert (=> b!635049 m!608693))

(declare-fun m!608951 () Bool)

(assert (=> b!635049 m!608951))

(assert (=> b!634735 d!89561))

(declare-fun b!635051 () Bool)

(declare-fun e!363191 () SeekEntryResult!6769)

(declare-fun e!363192 () SeekEntryResult!6769)

(assert (=> b!635051 (= e!363191 e!363192)))

(declare-fun lt!293490 () (_ BitVec 64))

(declare-fun c!72450 () Bool)

(assert (=> b!635051 (= c!72450 (= lt!293490 (select (arr!18332 a!2986) j!136)))))

(declare-fun lt!293491 () SeekEntryResult!6769)

(declare-fun d!89563 () Bool)

(assert (=> d!89563 (and (or ((_ is Undefined!6769) lt!293491) (not ((_ is Found!6769) lt!293491)) (and (bvsge (index!29379 lt!293491) #b00000000000000000000000000000000) (bvslt (index!29379 lt!293491) (size!18697 a!2986)))) (or ((_ is Undefined!6769) lt!293491) ((_ is Found!6769) lt!293491) (not ((_ is MissingVacant!6769) lt!293491)) (not (= (index!29381 lt!293491) vacantSpotIndex!68)) (and (bvsge (index!29381 lt!293491) #b00000000000000000000000000000000) (bvslt (index!29381 lt!293491) (size!18697 a!2986)))) (or ((_ is Undefined!6769) lt!293491) (ite ((_ is Found!6769) lt!293491) (= (select (arr!18332 a!2986) (index!29379 lt!293491)) (select (arr!18332 a!2986) j!136)) (and ((_ is MissingVacant!6769) lt!293491) (= (index!29381 lt!293491) vacantSpotIndex!68) (= (select (arr!18332 a!2986) (index!29381 lt!293491)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89563 (= lt!293491 e!363191)))

(declare-fun c!72448 () Bool)

(assert (=> d!89563 (= c!72448 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89563 (= lt!293490 (select (arr!18332 a!2986) lt!293359))))

(assert (=> d!89563 (validMask!0 mask!3053)))

(assert (=> d!89563 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293359 vacantSpotIndex!68 (select (arr!18332 a!2986) j!136) a!2986 mask!3053) lt!293491)))

(declare-fun b!635052 () Bool)

(declare-fun c!72449 () Bool)

(assert (=> b!635052 (= c!72449 (= lt!293490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363190 () SeekEntryResult!6769)

(assert (=> b!635052 (= e!363192 e!363190)))

(declare-fun b!635053 () Bool)

(assert (=> b!635053 (= e!363192 (Found!6769 lt!293359))))

(declare-fun b!635054 () Bool)

(assert (=> b!635054 (= e!363191 Undefined!6769)))

(declare-fun b!635055 () Bool)

(assert (=> b!635055 (= e!363190 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293359 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18332 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635056 () Bool)

(assert (=> b!635056 (= e!363190 (MissingVacant!6769 vacantSpotIndex!68))))

(assert (= (and d!89563 c!72448) b!635054))

(assert (= (and d!89563 (not c!72448)) b!635051))

(assert (= (and b!635051 c!72450) b!635053))

(assert (= (and b!635051 (not c!72450)) b!635052))

(assert (= (and b!635052 c!72449) b!635056))

(assert (= (and b!635052 (not c!72449)) b!635055))

(declare-fun m!608953 () Bool)

(assert (=> d!89563 m!608953))

(declare-fun m!608955 () Bool)

(assert (=> d!89563 m!608955))

(declare-fun m!608957 () Bool)

(assert (=> d!89563 m!608957))

(assert (=> d!89563 m!608683))

(declare-fun m!608959 () Bool)

(assert (=> b!635055 m!608959))

(assert (=> b!635055 m!608959))

(assert (=> b!635055 m!608667))

(declare-fun m!608961 () Bool)

(assert (=> b!635055 m!608961))

(assert (=> b!634735 d!89563))

(declare-fun d!89565 () Bool)

(declare-fun lt!293506 () (_ BitVec 32))

(assert (=> d!89565 (and (bvsge lt!293506 #b00000000000000000000000000000000) (bvslt lt!293506 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89565 (= lt!293506 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89565 (validMask!0 mask!3053)))

(assert (=> d!89565 (= (nextIndex!0 index!984 x!910 mask!3053) lt!293506)))

(declare-fun bs!19062 () Bool)

(assert (= bs!19062 d!89565))

(declare-fun m!608963 () Bool)

(assert (=> bs!19062 m!608963))

(assert (=> bs!19062 m!608683))

(assert (=> b!634735 d!89565))

(declare-fun d!89567 () Bool)

(declare-fun e!363221 () Bool)

(assert (=> d!89567 e!363221))

(declare-fun res!410905 () Bool)

(assert (=> d!89567 (=> (not res!410905) (not e!363221))))

(assert (=> d!89567 (= res!410905 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18697 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18697 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18697 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18697 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18697 a!2986))))))

(declare-fun lt!293522 () Unit!21404)

(declare-fun choose!9 (array!38208 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21404)

(assert (=> d!89567 (= lt!293522 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293359 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89567 (validMask!0 mask!3053)))

(assert (=> d!89567 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293359 vacantSpotIndex!68 mask!3053) lt!293522)))

(declare-fun b!635097 () Bool)

(assert (=> b!635097 (= e!363221 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293359 vacantSpotIndex!68 (select (arr!18332 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293359 vacantSpotIndex!68 (select (store (arr!18332 a!2986) i!1108 k0!1786) j!136) (array!38209 (store (arr!18332 a!2986) i!1108 k0!1786) (size!18697 a!2986)) mask!3053)))))

(assert (= (and d!89567 res!410905) b!635097))

(declare-fun m!608987 () Bool)

(assert (=> d!89567 m!608987))

(assert (=> d!89567 m!608683))

(assert (=> b!635097 m!608667))

(assert (=> b!635097 m!608701))

(assert (=> b!635097 m!608695))

(declare-fun m!608989 () Bool)

(assert (=> b!635097 m!608989))

(assert (=> b!635097 m!608669))

(assert (=> b!635097 m!608667))

(assert (=> b!635097 m!608695))

(assert (=> b!634735 d!89567))

(declare-fun b!635098 () Bool)

(declare-fun e!363223 () SeekEntryResult!6769)

(declare-fun e!363224 () SeekEntryResult!6769)

(assert (=> b!635098 (= e!363223 e!363224)))

(declare-fun c!72465 () Bool)

(declare-fun lt!293523 () (_ BitVec 64))

(assert (=> b!635098 (= c!72465 (= lt!293523 lt!293360))))

(declare-fun d!89577 () Bool)

(declare-fun lt!293524 () SeekEntryResult!6769)

(assert (=> d!89577 (and (or ((_ is Undefined!6769) lt!293524) (not ((_ is Found!6769) lt!293524)) (and (bvsge (index!29379 lt!293524) #b00000000000000000000000000000000) (bvslt (index!29379 lt!293524) (size!18697 lt!293361)))) (or ((_ is Undefined!6769) lt!293524) ((_ is Found!6769) lt!293524) (not ((_ is MissingVacant!6769) lt!293524)) (not (= (index!29381 lt!293524) vacantSpotIndex!68)) (and (bvsge (index!29381 lt!293524) #b00000000000000000000000000000000) (bvslt (index!29381 lt!293524) (size!18697 lt!293361)))) (or ((_ is Undefined!6769) lt!293524) (ite ((_ is Found!6769) lt!293524) (= (select (arr!18332 lt!293361) (index!29379 lt!293524)) lt!293360) (and ((_ is MissingVacant!6769) lt!293524) (= (index!29381 lt!293524) vacantSpotIndex!68) (= (select (arr!18332 lt!293361) (index!29381 lt!293524)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89577 (= lt!293524 e!363223)))

(declare-fun c!72463 () Bool)

(assert (=> d!89577 (= c!72463 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89577 (= lt!293523 (select (arr!18332 lt!293361) lt!293359))))

(assert (=> d!89577 (validMask!0 mask!3053)))

(assert (=> d!89577 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293359 vacantSpotIndex!68 lt!293360 lt!293361 mask!3053) lt!293524)))

(declare-fun b!635099 () Bool)

(declare-fun c!72464 () Bool)

(assert (=> b!635099 (= c!72464 (= lt!293523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363222 () SeekEntryResult!6769)

(assert (=> b!635099 (= e!363224 e!363222)))

(declare-fun b!635100 () Bool)

(assert (=> b!635100 (= e!363224 (Found!6769 lt!293359))))

(declare-fun b!635101 () Bool)

(assert (=> b!635101 (= e!363223 Undefined!6769)))

(declare-fun b!635102 () Bool)

(assert (=> b!635102 (= e!363222 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293359 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!293360 lt!293361 mask!3053))))

(declare-fun b!635103 () Bool)

(assert (=> b!635103 (= e!363222 (MissingVacant!6769 vacantSpotIndex!68))))

(assert (= (and d!89577 c!72463) b!635101))

(assert (= (and d!89577 (not c!72463)) b!635098))

(assert (= (and b!635098 c!72465) b!635100))

(assert (= (and b!635098 (not c!72465)) b!635099))

(assert (= (and b!635099 c!72464) b!635103))

(assert (= (and b!635099 (not c!72464)) b!635102))

(declare-fun m!608991 () Bool)

(assert (=> d!89577 m!608991))

(declare-fun m!608995 () Bool)

(assert (=> d!89577 m!608995))

(declare-fun m!608999 () Bool)

(assert (=> d!89577 m!608999))

(assert (=> d!89577 m!608683))

(assert (=> b!635102 m!608959))

(assert (=> b!635102 m!608959))

(declare-fun m!609001 () Bool)

(assert (=> b!635102 m!609001))

(assert (=> b!634735 d!89577))

(declare-fun d!89579 () Bool)

(declare-fun res!410906 () Bool)

(declare-fun e!363231 () Bool)

(assert (=> d!89579 (=> res!410906 e!363231)))

(assert (=> d!89579 (= res!410906 (= (select (arr!18332 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89579 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!363231)))

(declare-fun b!635116 () Bool)

(declare-fun e!363232 () Bool)

(assert (=> b!635116 (= e!363231 e!363232)))

(declare-fun res!410907 () Bool)

(assert (=> b!635116 (=> (not res!410907) (not e!363232))))

(assert (=> b!635116 (= res!410907 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18697 a!2986)))))

(declare-fun b!635117 () Bool)

(assert (=> b!635117 (= e!363232 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89579 (not res!410906)) b!635116))

(assert (= (and b!635116 res!410907) b!635117))

(assert (=> d!89579 m!608857))

(declare-fun m!609005 () Bool)

(assert (=> b!635117 m!609005))

(assert (=> b!634746 d!89579))

(check-sat (not d!89563) (not d!89565) (not b!635097) (not d!89577) (not d!89493) (not bm!33370) (not b!635055) (not d!89495) (not b!634883) (not b!635049) (not b!635102) (not b!634976) (not d!89557) (not d!89567) (not b!634960) (not b!634934) (not d!89561) (not b!635117) (not bm!33367) (not b!634933) (not b!634974) (not b!634962) (not b!635039) (not b!634958) (not b!634920))
(check-sat)
